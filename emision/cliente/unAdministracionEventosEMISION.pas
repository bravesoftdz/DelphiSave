unit unAdministracionEventosEMISION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unAdministracionEventos, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  JvExStdCtrls, JvGroupBox, JvgGroupBox, unArtFrame,
  unFraCodigoDescripcion, unFraCodDesc, PatternEdit, DateTimeEditors,
  DBCtrls, IntEdit, JvgSplit, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  Menus, JvMenus, CheckLst, ARTCheckListBox, Buttons, JvExControls,
  JvComponent, JvButton, JvTransparentButton, CardinalEdit, AdvToolBar,
  AdvToolBarStylers, JvExDBGrids, JvDBGrid;

type
  TfrmAdministracionEventosEMISION = class(TfrmAdministracionEventos)
    Label32: TLabel;
    fraSE_IDRESPUESTA: TfraCodDesc;
    Label33: TLabel;
    fraSE_IDRESPUESTA_2: TfraCodDesc;
    Label34: TLabel;
    fraSE_IDRESPUESTA_3: TfraCodDesc;
    Label36: TLabel;
    edSE_OBSERVACIONREALIZADO_2: TMemo;
    Label37: TLabel;
    edSE_OBSERVACIONREALIZADO: TMemo;
    pnlSeleccion: TPanel;
    btnCancelarSeleccion: TButton;
    btnAceptarSeleccion: TButton;
    procedure gbFiltrosEventosAdicionalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraSE_IDRESPUESTA_2cmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_IDRESPUESTA_3cmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_IDRESPUESTA_2PropiedadesChange(Sender: TObject);
    procedure fraSE_IDRESPUESTA_3PropiedadesChange(Sender: TObject);
    procedure btnAceptarSeleccionClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(
      Sender: TObject);
    procedure FSFormShow(Sender: TObject);
  private
    procedure DoOcultarControles;
  protected
    function  DoABM: Boolean; override;
    procedure DoABMHijos; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    procedure Filtros(AValue: boolean); override;
    procedure DoArmarSqlBusquedaAdicional; override;
  end;

  procedure DoMostrarEventosAgenda(AContrato: Integer; ACargaDesde: TDateTime = 0; ASoloMiSector: boolean = False);
  function ObtenerEventosAgenda(AContrato: Integer; ACargaDesde: TDateTime = 0; ASoloMiSector: boolean = False): integer;
  
var
  frmAdministracionEventosEMISION: TfrmAdministracionEventosEMISION;

implementation

uses
  General, AnsiSql, SQLFuncs, unSesion, VCLExtra, unDmPrincipal, unART, CustomDlgs,
  unCustomGridABM, unCustomConsulta;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.ClearControls;
begin
  inherited;

  sbScroll.VertScrollBar.Position     := 0;

  fraSE_SECTORINVOLUCRADO.Codigo      := Sesion.Sector;
  fraSE_SECTORINVOLUCRADO_2.Codigo    := Sesion.Sector;
  fraSE_IDRESPUESTA_2cmbDescripcionDropDown( nil );
  fraSE_IDRESPUESTA_3cmbDescripcionDropDown( nil );
  frafpSE_USUARIODERIVACIONTELEF.Codigo := Sesion.UserID;
  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO, True);
  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO_2, True);
  frafpSE_IDCODIGOEVENTO.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''E'' AND AG_FECHABAJA IS NULL AND AG_IDEVENTO = CE_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  frafpSE_IDCODIGOINGRESO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''I'' AND AG_FECHABAJA IS NULL AND AG_IDINGRESOEVENTO = IE_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''M'' AND AG_FECHABAJA IS NULL AND AG_IDMOTIVO = ME_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''M'' AND AG_FECHABAJA IS NULL AND AG_IDMOTIVO = ME_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  VCLExtra.LockControls(fraSE_IDRESPUESTA_2, False);
  fraSE_IDRESPUESTA_2.Clear;
  VCLExtra.LockControls(fraSE_IDRESPUESTA_3, True);
  fraSE_IDRESPUESTA_3.Clear;
  fraSE_IDCODIGOINGRESO.Clear;
  edSE_OBSERVACIONREALIZADO_2.Lines.Clear;
  edSE_OBSERVACIONREALIZADO.Lines.Clear;    
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.LoadControls;
begin
  sbScroll.VertScrollBar.Position := 0;

  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO, False);
  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO_2, False);
  frafpSE_IDCODIGOEVENTO.Propiedades.ExtraCondition  := '';
  frafpSE_IDCODIGOINGRESO.Propiedades.ExtraCondition := '';
  frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition  := '';
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := '';

  if Is_PantallaAmpliada(True) then
    begin
      fraSE_IDRESPUESTA_2.Value := sdqConsulta.FieldByName('SE_IDRESPUESTA').AsInteger;
      fraSE_IDRESPUESTA_3.Clear;
      edSE_OBSERVACIONREALIZADO_2.Lines.Text := sdqConsulta.FieldByName('RESPUESTA').AsString;
      edSE_OBSERVACIONREALIZADO.Clear;
    end
  else
    begin
      fraSE_IDRESPUESTA_3.Value := sdqConsulta.FieldByName('SE_IDRESPUESTA').AsInteger;
      fraSE_IDRESPUESTA_2.Clear;
      edSE_OBSERVACIONREALIZADO.Lines.Text := sdqConsulta.FieldByName('RESPUESTA').AsString;
      edSE_OBSERVACIONREALIZADO_2.Clear;
    end;

  VCLExtra.LockControls([fraSE_IDRESPUESTA_2, fraSE_IDRESPUESTA_3], not cmbSE_FECHAREALIZADO.IsEmpty);

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.DoABMHijos;
begin
  inherited;
  if Is_PantallaAmpliada() then
    Sql.Fields.Add('SE_OBSERVACIONREALIZADO', edSE_OBSERVACIONREALIZADO_2.Lines.Text)
  else
    Sql.Fields.Add('SE_OBSERVACIONREALIZADO', edSE_OBSERVACIONREALIZADO.Lines.Text);

  if ModoABM <> maBaja then
    Sql.Fields.AddInteger('SE_IDRESPUESTA', integer(iif(fraSE_IDRESPUESTA_2.Value = ART_EMPTY_ID, fraSE_IDRESPUESTA_3.Value, fraSE_IDRESPUESTA_2.Value)), True);
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionEventosEMISION.DoABM: Boolean;
begin
  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.gbFiltrosEventosAdicionalesClick(Sender: TObject);
begin
  inherited;
  DoOcultarControles;   // si no hago esto, cuando colapso y vuelvo a expandir me vuelve a poner visible el frame de ingreso
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.FormCreate(Sender: TObject);
begin
  inherited;

  fraSE_IDCODIGOEVENTO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''E'' AND AG_IDEVENTO = CE_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDRESPUESTA.Propiedades.ExtraCondition    := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''R'' AND AG_IDRESPUESTA = RR_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''M'' AND AG_IDMOTIVO = ME_ID AND AG_SECTOR = ' + SqlValue(Sesion.Sector) + ') ';

  DoOcultarControles;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.DoOcultarControles;
begin
  fraSE_IDCODIGOINGRESO.Visible := False;
  Labelx2.Visible               := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraSE_IDRESPUESTA.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.fraSE_IDRESPUESTA_2cmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINVOLUCRADO_2.IsEmpty then
    fraSE_IDRESPUESTA_2.Propiedades.ExtraCondition := ' AND RR_SECTOR = ' + SQLValue(fraSE_SECTORINVOLUCRADO_2.AsString);
  fraSE_IDRESPUESTA_2.cmbDescripcionDropDown(Sender);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.fraSE_IDRESPUESTA_3cmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINVOLUCRADO.IsEmpty then
    fraSE_IDRESPUESTA_3.Propiedades.ExtraCondition := ' AND RR_SECTOR = ' + SQLValue(fraSE_SECTORINVOLUCRADO.AsString);
  fraSE_IDRESPUESTA_3.cmbDescripcionDropDown(Sender);
end;
{------------------------------------------------------------------------------}
procedure DoMostrarEventosAgenda(AContrato: Integer; ACargaDesde: TDateTime = 0; ASoloMiSector: boolean = False);
begin
  with TfrmAdministracionEventosEMISION.Create(nil) do
    try
      chkSoloSector.Checked := ASoloMiSector;
      cmbSE_FECHADesde.Date := ACargaDesde;
      ShowModalEx(AContrato);
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
function ObtenerEventosAgenda(AContrato: Integer; ACargaDesde: TDateTime = 0; ASoloMiSector: boolean = False): integer;
begin
  Result := -1;
  with TfrmAdministracionEventosEMISION.Create(nil) do
  try
    chkSoloSector.Checked := ASoloMiSector;
    cmbSE_FECHADesde.Date := ACargaDesde;
    pnlSeleccion.Visible  := True;
    if ShowModalEx(AContrato) = mrOK then
      Result := IdEvento;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionEventosEMISION.Validar: Boolean;
begin
  inherited Validar;

  if Is_PantallaAmpliada() then
  begin
    Verificar((Trim(edSE_OBSERVACIONREALIZADO_2.Text) = '') and chkNotificado.Checked, chkNotificado, 'No puede seleccionar evento notificado si no se ha ingresado el texto de la respuesta.');
    Verificar(FCerrando and (ModoABM = maModificacion) and (Trim(edSE_OBSERVACIONREALIZADO_2.Lines.Text) = ''), edSE_OBSERVACIONREALIZADO_2, 'Debe indicar la respuesta.');
  end else
    Verificar(Trim(edSE_OBSERVACIONREALIZADO.Lines.Text) = '', edSE_OBSERVACIONREALIZADO, 'Debe indicar la respuesta.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.DoArmarSqlBusquedaAdicional;
begin
  inherited;

  SqlAddJoin(FSql, 'ACO_CONTRATO CON', 'SE.SE_CONTRATO',    'CON.CO_CONTRATO', jtOuter);
  SqlAddJoin(FSql, 'AEM_EMPRESA EMP',  'CON.CO_IDEMPRESA',  'EMP.EM_ID', jtOuter);
  SqlAddJoin(FSql, 'CRR_RESPUESTA RR', 'SE.SE_IDRESPUESTA', 'RR.RR_ID', jtOuter);

  AddField(FSql, 'EMP.EM_NOMBRE',                      'EMPRESA');
  AddField(FSql, 'ART.UTILES.ARMAR_CUIT(EMP.EM_CUIT)', 'CUITEMPRESA');
  AddField(FSql, 'CON.CO_CONTRATO',                    'CONTRATO');
  AddField(FSql, 'RR.RR_DESCRIPCION',                  'DESCRRESPUESTA');

  if fraSE_IDRESPUESTA.IsSelected then
    AddCondition(FSql, ' SE.SE_IDRESPUESTA = ' + SQLValue(fraSE_IDRESPUESTA.Value));
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.fraSE_IDRESPUESTA_2PropiedadesChange(Sender: TObject);
begin
  inherited;
  edSE_OBSERVACIONREALIZADO_2.Lines.Add(fraSE_IDRESPUESTA_2.Descripcion);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.fraSE_IDRESPUESTA_3PropiedadesChange(Sender: TObject);
begin
  inherited;
  edSE_OBSERVACIONREALIZADO.Lines.Add(fraSE_IDRESPUESTA_3.Descripcion);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.btnAceptarSeleccionClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), btnAceptarSeleccion, 'Debe seleccionar un evento.');

  ModalResult := mrOK;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.Filtros(AValue: boolean);
begin
  inherited;
  tbRefrescar.Visible                 := True;
  ToolButton5.Visible                 := True;
  tbSalir.Visible                     := AValue;
                                      
  gbFiltrosEventos.Enabled            := True;
  gbFiltrosUsuarios.Enabled           := True;
  gbFiltrosEventosAdicionales.Enabled := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.btnCerrarClick(Sender: TObject);
begin
  if not fraFiltroEmpresa.IsSelected then
    fraFiltroEmpresa.Contrato := Contrato;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(Sender: TObject);
begin
  if fraSE_SECTORINVOLUCRADO_2.Codigo = Sesion.Sector then
    fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = ''M'' AND AG_FECHABAJA IS NULL AND AG_IDMOTIVO = ME_ID AND AG_SECTOR = ' + SqlString(NVL(fraSE_SECTORINVOLUCRADO_2.Codigo, Sesion.Sector), True) + ') '
  else
    fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := ' ';
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionEventosEMISION.FSFormShow(Sender: TObject);
begin
//
end;

end.
