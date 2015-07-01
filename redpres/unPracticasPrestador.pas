unit unPracticasPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, unfraNomenclador, Placemnt, artSeguridad,
  ImgList, Buttons, RxPlacemnt, unArtFrame;

type
  TfrmPracticasPrestador = class(TForm)
    pnlFiltros: TPanel;
    pnlBotones: TPanel;
    lvPracticas: TListView;
    Label1: TLabel;
    Label2: TLabel;
    fraNomenclador: TfraNomenclador;
    edPrestador: TEdit;
    FormStorage1: TFormStorage;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdPrestador, FValorPrestador, FIdNomenclador :Integer;
    FHabilitar, FHabilitarGrilla, FEsAlta :Boolean;
    procedure LoadValues;
    procedure LoadCabecera;
    function EsPracticaDelPrestador(IdPractica :Integer; EsPractica :String) :Boolean;
    function Get_FechaUltimoMovimiento_CPP(IdPractica :Integer; EsPractica :String): String;     // TK 61052
  public
    procedure Execute;
    property IdPrestador    :Integer read FIdPrestador    write FIdPrestador;
    property IdNomenclador  :Integer read FIdNomenclador  write FIdNomenclador;
    property ValorPrestador :Integer read FValorPrestador write FValorPrestador;
    property Habilitar      :Boolean read FHabilitar      write FHabilitar;
    property HabilitarGrilla :Boolean read FHabilitarGrilla  write FHabilitarGrilla;     // TK 60813
    property EsAlta         :Boolean read FEsAlta         write FEsAlta default False;
  end;

var
  frmPracticasPrestador: TfrmPracticasPrestador;

implementation

uses unSesion, AnsiSql, sdEngine, unDmPrincipal;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmPracticasPrestador.Execute;
begin
  LoadCabecera;
  LoadValues;
  btnAceptar.Enabled := Habilitar;
  lvPracticas.Enabled := HabilitarGrilla; // TK 60813
  if not HabilitarGrilla then
    btnAceptar.Enabled := False;
  ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPracticasPrestador.FormShow(Sender: TObject);
begin
  lvPracticas.Columns[0].Width := 250;
  lvPracticas.Columns[3].Width := 250;
end;

{-------------------------------------------------------------------------------}
function TfrmPracticasPrestador.Get_FechaUltimoMovimiento_CPP(IdPractica: Integer; EsPractica: String): String;     // TK 61052
var sSql :String;
begin
  sSql := 'SELECT nvl(pp_fechabaja, pp_fechaalta) Fecha FROM cpp_prestadorpractica ' +
          ' WHERE pp_idprestador = ' + SqlInt(IdPrestador) +
            ' AND pp_idvalorprestador = ' + SqlInt(ValorPrestador) +
            ' AND pp_idpractica = ' + SqlInt(IdPractica) +
            ' AND pp_espractica = ' + SqlValue(EsPractica);

  if ExisteSql(sSql) then
    Result := ValorSql(sSql)
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TfrmPracticasPrestador.LoadValues;
var
  sSql :String;
  sdqPracticas :TSDQuery;
begin
  sSql := 'SELECT pm_id, pm_descripcion, im_tope, im_observacion, ' +
                ' im_excluyente, im_espractica ' +
           ' FROM amed.mim_incluyemodulo, amed.mpm_practicamodulo ' +
          ' WHERE pm_id = im_idpracticamodulo ' +
            ' AND im_idnomenclador = ' + SqlInt(IdNomenclador) +
            ' AND im_fechabaja IS NULL ' +
            ' AND im_espractica = ''S'' ' +
          ' UNION ALL ' +
         ' SELECT on_id, on_descripcion, im_tope, im_observacion, ' +
                ' im_excluyente, im_espractica ' +
           ' FROM amed.mim_incluyemodulo, son_nomenclador ' +
          ' WHERE im_idpracticamodulo = on_id ' +
            ' AND im_idnomenclador = ' + SqlInt(IdNomenclador) +
            ' AND im_fechabaja IS NULL ' +
            ' AND im_espractica = ''N'' ';
  sdqPracticas := GetQuery(sSql);
  with sdqPracticas do
  try
    lvPracticas.Items.BeginUpdate;
    lvPracticas.Items.Clear;
    while not Eof do
    begin
      with lvPracticas.Items.Add do
      begin
        Caption := sdqPracticas.FieldByName('PM_DESCRIPCION').AsString;
        SubItems.Add(sdqPracticas.FieldByName('IM_TOPE').AsString);
        SubItems.Add(sdqPracticas.FieldByName('IM_EXCLUYENTE').AsString);
        SubItems.Add(sdqPracticas.FieldByName('IM_OBSERVACION').AsString);
        SubItems.Add(sdqPracticas.FieldByName('PM_ID').AsString);
        SubItems.Add(sdqPracticas.FieldByName('IM_ESPRACTICA').AsString);


        Checked := EsPracticaDelPrestador(sdqPracticas.FieldByName('PM_ID').AsInteger,
                                          sdqPracticas.FieldByName('IM_ESPRACTICA').AsString)
                   or EsAlta;

        SubItems.Add(Get_FechaUltimoMovimiento_CPP(sdqPracticas.FieldByName('PM_ID').AsInteger,
                                                   sdqPracticas.FieldByName('IM_ESPRACTICA').AsString));   // TK 61052

      end;
      Next;
    end;
    lvPracticas.Items.EndUpdate;
  finally
    sdqPracticas.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPracticasPrestador.LoadCabecera;
var
  sSql :String;
begin
  fraNomenclador.Cargar(IdNomenclador);
  sSql := 'SELECT ca_descripcion ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = ' + SqlInt(IdPrestador);
  edPrestador.Text := ValorSql(sSql);
end;
{-------------------------------------------------------------------------------}

function TfrmPracticasPrestador.EsPracticaDelPrestador(IdPractica :Integer; EsPractica :String) :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT 1 FROM cpp_prestadorpractica ' +
          ' WHERE pp_idprestador = ' + SqlInt(IdPrestador) +
            ' AND pp_idvalorprestador = ' + SqlInt(ValorPrestador) +
            ' AND pp_idpractica = ' + SqlInt(IdPractica) +
            ' AND pp_espractica = ' + SqlValue(EsPractica) +
            ' AND pp_fechabaja IS NULL';
  Result := ExisteSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmPracticasPrestador.btnAceptarClick(Sender: TObject);
var
  i :Integer;
  sSql, sWhere :String;
  bEsPracticaP :Boolean;
begin
  for i := 0 to lvPracticas.Items.Count - 1 do
  begin
    sWhere := ' WHERE pp_idprestador = ' + SqlInt(IdPrestador) +
                ' AND pp_idvalorprestador = ' + SqlInt(ValorPrestador) +
                ' AND pp_idpractica = ' + SqlInt(StrToInt(lvPracticas.Items[i].SubItems[3])) +
                ' AND pp_espractica = ' + SqlValue(lvPracticas.Items[i].SubItems[4]);

    bEsPracticaP := EsPracticaDelPrestador(StrToInt(lvPracticas.Items[i].SubItems[3]),
                                           lvPracticas.Items[i].SubItems[4]);

    if lvPracticas.Items[i].Checked and not(bEsPracticaP) then
    begin
      sSql := 'SELECT 1 FROM cpp_prestadorpractica ' + sWhere;
      if ExisteSql(sSql) then //si ya existia y estaba dada de baja, la activo...
        sSql := 'UPDATE cpp_prestadorpractica ' +
                  ' SET pp_fechabaja = Null, ' +
                      ' pp_usubaja = Null, ' +
                      ' pp_usualta = ' + SqlValue(Sesion.UserID) + ',' +
                      ' pp_fechaalta = ActualDate ' + sWhere
      else //si no existia la inserto...
        sSql := 'INSERT INTO cpp_prestadorpractica ' +
                '(pp_idprestador, pp_idvalorprestador, pp_idpractica,  ' +
                ' pp_fechaalta, pp_usualta, pp_espractica) VALUES (' +
                SqlInt(IdPrestador) + ',' + SqlInt(ValorPrestador) + ',' +
                SqlInt(StrToInt(lvPracticas.Items[i].SubItems[3])) + ',' +
                'ActualDate,' + SqlValue(Sesion.UserID) + ',' +
                SqlValue(lvPracticas.Items[i].SubItems[4]) + ')';
      EjecutarSql(sSql);
    end
    else if not(lvPracticas.Items[i].Checked) and bEsPracticaP then
    begin //se da de baja...
      sSql := 'UPDATE cpp_prestadorpractica ' +
                ' SET pp_fechabaja = ActualDate, ' +
                    ' pp_usubaja = ' + SqlValue(Sesion.UserID) + sWhere;
      EjecutarSql(sSql);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
end.
