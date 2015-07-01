unit unEstRespiratorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, IntEdit, StdCtrls, Mask, ToolEdit, DateComboBox,
  unfraPrestadorAMP, GroupCheckBox, ImageComboBox, ExtCtrls, unFormEstudios,
  PatternEdit, Db, SDEngine, unfraOperativo, unFraCodigoDescripcion,
  unfraCtbTablas, unFraTipoEstudio, unArtFrame, unArtDbFrame,
  unFraReconfirmacion, unArtDBAwareFrame;

type
  TfrmEstRespiratorio = class(TFormEstudios)
    pnlEstudio: TPanel;
    Label6: TLabel;
    lbOperativo: TLabel;
    fraPrestador: TfraPrestadorAMP;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraOperativo: TfraOperativo;
    fraTipoEstudio: TfraTipoEstudio;
    Label1: TLabel;
    fraReconfirmacion: TfraReconfirmacion;
    pcDatos: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsObservaciones: TTabSheet;
    gbOpaParen: TGroupBox;
    pnlOpacPequenas: TPanel;
    pnlOpacRedond: TPanel;
    pnlOpacIrreg: TPanel;
    edOpacPequRedDer: TPatternEdit;
    edOpacPequRedIzq: TPatternEdit;
    edOpacPequIrregDer: TPatternEdit;
    edOpacPequIrregIzq: TPatternEdit;
    pnlOpacGrandes: TPanel;
    edOpacGrandes: TPatternEdit;
    pnlOpacDerecho: TPanel;
    pnlOpacIzquierdo: TPanel;
    pnlOpacHeader: TPanel;
    pnlOpacProfusion: TPanel;
    edOpacProfusion: TPatternEdit;
    cgOpacPleurales: TCheckGroup;
    gbEspirometria: TGroupBox;
    Label40: TLabel;
    Label57: TLabel;
    cmbEspiroGrado: TComboBox;
    cmbEspirometria: TImageComboBox;
    cgCalcificaciones: TCheckGroup;
    edObservaciones: TMemo;
    Label5: TLabel;
    edFechaRPrest: TDateComboBox;
    Label2: TLabel;
    edFechaRML: TDateComboBox;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbEspirometriaChange(Sender: TObject);
  private
  public
    function Validar : Boolean;
    function Execute(AModoABM : TModoABM = maAdd) : boolean; override;
    procedure CargarDatos;
  end;

var
  frmEstRespiratorio: TfrmEstRespiratorio;

implementation

uses
  StrFuncs, AnsiSql, unPrincipal, unDmPrincipal, SqlFuncs, CustomDlgs, General;

Const
  PAGE_DATOSGENERALES = 0;
  PAGE_OBSERVACIONES  = 1;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmEstRespiratorio }
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstRespiratorio.Execute(AModoABM: TModoABM): boolean;
begin
  btnAceptar.Enabled := AModoABM <> maConsulta;

  fraReconfirmacion.Fecha        := ClaveEstudio.Fecha;
  fraReconfirmacion.Cuil         := ClaveEstudio.Cuil;
//    fraReconfirmacion.Estudio      := ClaveEstudio.Estudio;
  fraReconfirmacion.Value        := DatosEstudio.Reconfirmacion;

  With DatosEstudio do begin
    fraPrestador.Cargar(Prestador);
    fraOperativo.Cargar(Periodo);
    fraTipoEstudio.PeriodoOriginal := Periodo;
    fraTipoEstudio.Value           := Tipo;

    if Tipo <> TE_EXAMEN_RECONFIRMACION then
    begin
      fraReconfirmacion.Clear;
      fraReconfirmacion.ForeColor := clBtnFace;
      fraReconfirmacion.ReadOnly  := True;
    end
    else begin
      fraReconfirmacion.ForeColor := clWindow;
      fraReconfirmacion.ReadOnly  := False;
    end;
  end;

  edFechaRPrest.Date := DatosEstudio.FechaRecPrest;
  edFechaRML.Date := DatosEstudio.FechaRecML;

  if AModoABM in [maUpdate, maConsulta] Then
     CargarDatos;

  if not fraPrestador.IsSelected Then
     ActiveControl := fraPrestador.edCodigo
  else if (fraOperativo.edPeriodo.Text = '') and (not fraOperativo.ReadOnly) Then
     ActiveControl := fraOperativo.edPeriodo
  else
     ActiveControl := cmbEspirometria; //edOpacPequRedDer;

  Result := Inherited Execute(AModoABM);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstRespiratorio.btnAceptarClick(Sender: TObject);
Var Sql      : TSql;
    ATipoRes : TTipoRes;
begin
    if Validar Then With ClaveEstudio do begin
      Sql := TSql.Create( 'AER_ESTRESPIRATORIOS' );

      Sql.PrimaryKey.Add('ER_CUIT', CUIT);
      Sql.PrimaryKey.Add('ER_ESTABLECI', Estableci);
      Sql.PrimaryKey.Add('ER_FECHA', Fecha);
      Sql.PrimaryKey.Add('ER_CUIL', Cuil);
      Sql.PrimaryKey.Add('ER_ESTUDIO', Estudio);
      Sql.Fields.Add('ER_OPACIDADES', GetChar( edOpacPequRedDer.Text, 1, ' ' ) +
                                      GetChar( edOpacPequRedIzq.Text, 1, ' ' ) +
                                      GetChar( edOpacPequIrregDer.Text, 1, ' ' ) +
                                      GetChar( edOpacPequIrregIzq.Text, 1, ' ' ) +
                                      GetChar( edOpacGrandes.Text, 1, ' ' ) +
                                      GetChar( edOpacProfusion.Text, 1, ' ' ) +
                                      GetChar( edOpacProfusion.Text, 2, ' ' ) );
      Sql.Fields.Add('ER_ESPIRO_TIPO',     GetChar( cmbEspirometria.Text ));
      Sql.Fields.Add('ER_ESPIRO_GRADO',    GetChar( cmbEspiroGrado.Text ));
      Sql.Fields.Add('ER_OPAC_PLEURALES',  cgOpacPleurales.Value);
      Sql.Fields.Add('ER_CALCIFICACIONES', cgCalcificaciones.Value);
      Sql.Fields.Add('ER_OBSERVACIONES',   edObservaciones.Text);

      if cmbEspirometria.ItemIndex = 0 Then
         ATipoRes := trNormal
      else
         ATipoRes := trAnormal;

      if ModoABM = maUpdate Then begin
         Sql.Fields.Add('ER_USUMODIF', frmPrincipal.DBLogin.LoginName );
         Sql.Fields.Add('ER_FECHAMODIF', 'ACTUALDATE', False );
         Sql.SqlType := stUpdate;
      end else begin
         Sql.Fields.Add('ER_USUALTA', frmPrincipal.DBLogin.LoginName );
         Sql.Fields.Add('ER_FECHAALTA', 'ACTUALDATE', False );
         Sql.SqlType := stInsert;
      end;
      Try
         BeginTrans;
           SaveResult(0,
                      ATipoRes,
                      fraPrestador.edCodigo.Text,
                      fraOperativo.edPeriodo.Text,
                      fraTipoEstudio.PeriodoOriginal,
                      DatosEstudio.IDCarpetaAMP,
                      DatosEstudio.IDDetalleArchivo,
                      DatosEstudio.CarpetaPendiente,
                      fraTipoEstudio.Value,
                      fraReconfirmacion.Value,
                      edFechaRPrest.Date,
                      edFechaRML.Date);
           EjecutarSqlST( Sql.Sql );
         CommitTrans;
         ModalResult := mrOk;
      Except
         on E: Exception do begin
            Rollback;
            ErrorMsg(E);
         end;
      End;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstRespiratorio.FormCreate(Sender: TObject);
begin
//  StatusBar                          := frmPrincipal.StatusBar ;
  fraTipoEstudio.FrameOperativo      := fraOperativo;
  fraTipoEstudio.FrameReconfirmacion := fraReconfirmacion;
  pcDatos.ActivePageIndex            := PAGE_DATOSGENERALES;

  fraPrestador.ShowBajas := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstRespiratorio.Validar: Boolean;
   {procedure InvMsg( ATabIndex : Integer; AControl : TWinControl; AText : String );
   begin
      pcDatos.ActivePageIndex := ATabIndex;
      InvalidMsg( AControl, AText );
   end;}
begin
   Result := False;
   if not fraPrestador.IsSelected Then
      InvalidMsg( fraPrestador.edCodigo, 'Debe seleccionar el prestador' )

   else if fraTipoEstudio.IsEmpty Then
      InvalidMsg( fraTipoEstudio.edCodigo, 'Debe seleccionar el Tipo de Estudio.' )

   else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and fraReconfirmacion.IsEmpty then
      InvalidMsg( fraReconfirmacion.cmbEstudio, 'Debe seleccionar el estudio a reconfirmar.' )

   else if (fraTipoEstudio.Value = TE_EXAMEN_RECONFIRMACION) and
           not ExisteSQLEx('SELECT 1 ' +
                           '  FROM art.aet_estrab ' +
                           ' WHERE et_cuit = :cuit ' +
                           '   AND et_cuil = :cuil ' +
                           '   AND et_estableci = :estableci ' +
                           '   AND et_fecha = ' + SqlDate (fraReconfirmacion.Value.Fecha) +
                           '   AND et_estudio = :estudio ',
                           [ClaveEstudio.CUIT, ClaveEstudio.CUIL,
                            ClaveEstudio.Estableci, fraReconfirmacion.Value.Estudio]) then
    InvalidMsg(fraReconfirmacion.cmbEstudio,
               'Hay inconsistencia de datos. Revise que CUIT/Estab/CUIL/Fecha/Estudio de la carga coincidan con el estudio existente a reconfirmar')

   else if (edFechaRPrest.Date <> 0) and (edFechaRPrest.Date < ClaveEstudio.Fecha) then
     InvalidMsg( edFechaRPrest, 'La fecha de recepción por parte del prestador ' +
                                'debe ser posterior o igual a la fecha del estudio.' )

   else if (edFechaRML.Date <> 0) and
           ((edFechaRML.Date < ClaveEstudio.Fecha) or (edFechaRML.Date < edFechaRPrest.Date)) then
     InvalidMsg( edFechaRML, 'La fecha de recepción en ML debe ser posterior o igual ' +
                             'a la fecha del estudio y/o de recepción por parte ' +
                             'del prestador.' )
   else
      Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstRespiratorio.CargarDatos;
Var sSql,
    sOpacidades : String;
    sdqEstRespiratorio : TSDQuery;
begin
    sSql := 'SELECT ER_OPACIDADES, ER_ESPIRO_TIPO, ER_ESPIRO_GRADO, ER_OPAC_PLEURALES, ER_CALCIFICACIONES, ER_OBSERVACIONES ' +
              'FROM AER_ESTRESPIRATORIOS ' +
             'WHERE ER_CUIT = ''' + ClaveEstudio.CUIT + ''' ' +
               'AND ER_ESTABLECI = ' + SqlInt(ClaveEstudio.Estableci) + ' ' +
               'AND ER_CUIL = ''' + ClaveEstudio.CUIL + ''' ' +
               'AND ER_FECHA = ' + SqlDate(ClaveEstudio.Fecha) + ' ' +
               'AND ER_ESTUDIO = ''' + ClaveEstudio.Estudio + ''' ';
    sdqEstRespiratorio := GetQuery( sSql );
    Try
      sOpacidades                := sdqEstRespiratorio.FieldByName('ER_OPACIDADES').AsString;
      edOpacPequRedDer.Text      := Copy(sOpacidades, 1, 1);
      edOpacPequRedIzq.Text      := Copy(sOpacidades, 2, 1);
      edOpacPequIrregDer.Text    := Copy(sOpacidades, 3, 1);
      edOpacPequIrregIzq.Text    := Copy(sOpacidades, 4, 1);
      edOpacGrandes.Text         := Copy(sOpacidades, 5, 1);
      edOpacProfusion.Text       := Copy(sOpacidades, 6, 2);
      edOpacProfusion.Text       := Copy(sOpacidades, 6, 2);
      cmbEspirometria.ItemIndex  := Pos(sdqEstRespiratorio.FieldByName('ER_ESPIRO_TIPO').AsString,  'NORM') - 1;
      cmbEspiroGrado.ItemIndex   := Pos(sdqEstRespiratorio.FieldByName('ER_ESPIRO_GRADO').AsString, 'LMG')  - 1;
      edObservaciones.Text       := sdqEstRespiratorio.FieldByName('ER_OBSERVACIONES').AsString;

      cgOpacPleurales.Value      := sdqEstRespiratorio.FieldByName('ER_OPAC_PLEURALES').AsString;
      cgCalcificaciones.Value    := sdqEstRespiratorio.FieldByName('ER_CALCIFICACIONES').AsString;
    Finally
      sdqEstRespiratorio.Free;
    End;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstRespiratorio.cmbEspirometriaChange(Sender: TObject);
begin
     if cmbEspirometria.ItemIndex = 0 Then
        cmbEspiroGrado.ItemIndex := -1;
     if cmbEspirometria.ItemIndex = 0 Then
        cmbEspiroGrado.TabStop := False
     else
        cmbEspiroGrado.TabStop := True;

end;
{----------------------------------------------------------------------------------------------------------------------}
end.
