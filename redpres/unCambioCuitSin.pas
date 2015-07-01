unit unCambioCuitSin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, unFraTrabajador,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, SinEdit;

type
  TfrmCambioCuitSin = class(TForm)
    gbSiniestro: TGroupBox;
    Siniestro: TSinEdit;
    gbEmpresaTrabajador: TGroupBox;
    fraEmpresaAnterior: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    fraEmpresaNueva: TfraEmpresa;
    btnLimpiar: TBitBtn;
    btnGuardar: TBitBtn;
    btnSalir: TBitBtn;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGuardarClick(Sender: TObject);
    procedure SiniestroSelect(Sender: TObject);
  private
    function ValidarDatos: Boolean;

    procedure DoActualizarDelegacion(iRecaida: Integer);
    procedure DoActualizarDelegacionGrupo;
    procedure DoActualizarGrupo(iRecaida: Integer);
    procedure DoLimpiarEstablDenuncia;
    procedure DoLogCambioCuit;
  public
  end;

var
  frmCambioCuitSin: TfrmCambioCuitSin;

implementation

uses
  unArt, AnsiSql, unPrincipal, CustomDlgs, unDmPrincipal, DateTimeFuncs,
  unComunes, DB;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.btnLimpiarClick(Sender: TObject);
begin
  Siniestro.Clear;
  fraEmpresaAnterior.Clear;
  fraTrabajador.Clear;
  fraEmpresaNueva.Clear;
  Siniestro.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.MnuCambioCuitSin.Enabled := True;
  Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.btnGuardarClick(Sender: TObject);
var
  sSql: String;
begin
  if ValidarDatos then
  begin
    BeginTrans;
    try
      sSql := 'UPDATE sex_expedientes' +
                ' SET ex_cuit = ' + SqlValue(fraEmpresaNueva.CUIT) +
              ' WHERE ex_siniestro = ' + SqlInt(Siniestro.Siniestro) +
                ' AND ex_orden = ' + SqlInt(Siniestro.Orden);
      EjecutarSqlST(sSql);

      DoActualizarDelegacionGrupo;
      DoLimpiarEstablDenuncia;
      DoLogCambioCuit;

      CommitTrans;
      MessageDlg('El cambio de CUIT se realizó correctamente para todas las recaidas del siniestro/orden seleccionado.', mtConfirmation, [mbOK], 0);
    except
      on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar el nuevo CUIT.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCambioCuitSin.ValidarDatos: Boolean;
var
  dFechaAccid: TDateTime;
  sAux, sSql: String;
begin
  Verificar(Siniestro.IsEmpty, Siniestro, 'Debe seleccionar Siniestro.');
  Verificar(fraEmpresaNueva.IsEmpty, fraEmpresaNueva, 'Debe seleccionar el nuevo CUIT.');
  Verificar(fraEmpresaAnterior.edContrato.Value=fraEmpresaNueva.edContrato.Value, fraEmpresaNueva, 'La Empresa Nueva debe ser diferente a la actual.');

  //verifico que exista el siniestro
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :p1' +
      ' AND ex_orden = :p2';
  Verificar(not ExisteSqlEx(sSql, [Siniestro.Siniestro, Siniestro.Orden]), Siniestro, 'El siniestro no existe.');

  //verifico que el trabajador pertenezca a la empresa nueva
  sSql :=
    '(SELECT 1' +
      ' FROM cdl_datoslaborales' +
     ' WHERE dl_cuit = :p1' +
       ' AND dl_cuil = :p2' + ')' +
     ' UNION' +
   ' (SELECT 1' +
      ' FROM chl_histolaboral' +
     ' WHERE hl_cuit = :p3' +
       ' AND hl_cuil = :p4' + ')';
  Verificar(not ExisteSqlEx(sSql, [fraEmpresaNueva.mskCUIT.Text, fraTrabajador.CUIL,
                                   fraEmpresaNueva.mskCUIT.Text, fraTrabajador.CUIL]),
                                   fraEmpresaNueva, 'El trabajador no pertenece a la nueva empresa seleccionada.');

  //verifico que no existan liquidaciones
  sSql :=
    'SELECT nvl(sum(le_imporperi), 0)' +
     ' FROM sle_liquiempsin' +
    ' WHERE le_siniestro = :p1' +
      ' AND le_orden = :p2';
  sAux :=
    'SELECT nvl(sum(pr_imporpago), 0)' +
     ' FROM spr_pagoexpesin' +
    ' WHERE pr_siniestro = :p1' +
      ' AND pr_orden = :p2';
  Verificar((ValorSqlEx(sSql, [Siniestro.Siniestro, Siniestro.Orden]) <> 0) or
            (ValorSqlEx(sAux, [Siniestro.Siniestro, Siniestro.Orden]) <> 0), Siniestro, 'El siniestro/orden seleccionado posee liquidaciones para alguna de sus recaidas.');

  dFechaAccid := ValorSqlDateTimeEx('SELECT nvl(ex_fecharecaida, ex_fechaaccidente)' +
                                     ' FROM sex_expedientes' +
                                    ' WHERE ex_siniestro = :p1' +
                                      ' AND ex_orden = :p2' +
                                      ' AND ex_recaida = 0', [Siniestro.Siniestro, Siniestro.Orden]);
  sSql :=
    'SELECT siniestro.is_nroexpediente(:p1, :p2)' +
     ' FROM dual';
  sAux :=
    'SELECT siniestro.is_nroexpediente(:p1, :p2)' +
     ' FROM dual';
  Verificar((ValorSqlEx(sSql, [fraEmpresaNueva.CUIT, TDateTimeEx.Create(dFechaAccid)]) <> ValorSqlEx(sAux, [fraEmpresaAnterior.CUIT, TDateTimeEx.Create(dFechaAccid)])), Siniestro,
             'No puede haber cambio entre los cuits indicados.' + #13 + #10 +
             'Cierre el siniestro por error de carga y traspase la información');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.SiniestroSelect(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT ex_contrato, ex_cuil' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :Sin ' +
      ' AND ex_orden = :Ord ' +
      ' AND ex_recaida = 0 ';
  with GetQueryEx(sSql, [Siniestro.Siniestro, Siniestro.Orden]) do
  try
    fraEmpresaAnterior.Contrato := Fields[0].AsInteger;
    fraTrabajador.CUIL          := Fields[1].AsString;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.DoActualizarDelegacionGrupo;
var
  sSql: String;
begin
  sSql :=
    'SELECT ex_recaida' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = ' + SqlInt(Siniestro.Siniestro) +
      ' AND ex_orden = ' + SqlInt(Siniestro.Orden);
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      DoActualizarDelegacion(FieldByName('EX_RECAIDA').AsInteger);
      DoActualizarGrupo(FieldByName('EX_RECAIDA').AsInteger);
      Next;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.DoActualizarDelegacion(iRecaida: Integer);
var
  sDelegacion: String;
begin
  sDelegacion := ValorSQL('SELECT art.siniestro.get_delegacion(' + Siniestro.SiniestroSql + ', ' +
                                                                   Siniestro.OrdenSql + ', ' +
                                                                   SqlInt(iRecaida) + ' )' +
                             ' FROM DUAL');
  if sDelegacion <> '' then
    EjecutarSqlST('UPDATE sex_expedientes' +
                    ' SET ex_delegacion = ' + SqlValue(sDelegacion) +
                  ' WHERE ex_siniestro = ' + Siniestro.SiniestroSql +
                    ' AND ex_orden = ' + Siniestro.OrdenSql +
                    ' AND ex_recaida = ' + SqlInt(iRecaida));
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.DoActualizarGrupo(iRecaida: Integer);
var
  sGTrabajo: String;
begin
  sGTrabajo := ValorSQL('SELECT art.amebpba.get_gtrabajo(' + Siniestro.SiniestroSql + ', ' +
                                                             Siniestro.OrdenSql + ', ' +
                                                             SqlInt(iRecaida) + ')' +
                         ' FROM dual');
  if sGTrabajo <> '' then
    EjecutarSqlST('UPDATE sex_expedientes' +
                    ' SET ex_gtrabajo = ' + SqlValue(sGTrabajo) +
                  ' WHERE ex_siniestro = ' + Siniestro.SiniestroSql +
                    ' AND ex_orden = ' + Siniestro.OrdenSql +
                    ' AND ex_recaida = ' + SqlInt(iRecaida));
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.DoLimpiarEstablDenuncia;
begin
  EjecutarSqlSTEx('UPDATE sin.sud_ubicaciondenuncia' +
                    ' SET ud_establecimiento = Null' +
                  ' WHERE ud_idexpediente in (SELECT ex_id' +
                                              ' FROM sex_expedientes' +
                                             ' WHERE ex_siniestro = :siniestro' +
                                               ' AND ex_orden = :orden)', [Siniestro.Siniestro, Siniestro.Orden]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCambioCuitSin.DoLogCambioCuit;
var
  sObs :String;
begin
  sObs := Siniestro.SinOrdRec + ' CUIT: ' + fraEmpresaAnterior.CUIT + ' por: ' + fraEmpresaNueva.CUIT;
  DoInsertarRegAuditLog('CAMBIO CUIT', 'MODIFICACION', sObs, False, 'REDPRES');
end;
{-------------------------------------------------------------------------------}
end.
