unit unAdministracionEventosCOBRANZAS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unAdministracionEventos, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  JvExStdCtrls, JvGroupBox, JvgGroupBox, unArtFrame, unFraCodigoDescripcion, unFraCodDesc, PatternEdit, DateTimeEditors,
  DBCtrls, IntEdit, JvgSplit, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Menus, JvMenus, CheckLst, ARTCheckListBox,
  Buttons, JvExControls, JvComponent, JvButton, JvTransparentButton, CardinalEdit, AdvToolBar, AdvToolBarStylers,
  JvExDBGrids, JvDBGrid;

type
  TfrmAdministracionEventosCOBRANZAS = class(TfrmAdministracionEventos)
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
    procedure gbFiltrosEventosAdicionalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraSE_SECTORINVOLUCRADO_2cmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_SECTORINVOLUCRADOcmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_IDRESPUESTA_2PropiedadesChange(Sender: TObject);
    procedure fraSE_IDRESPUESTA_3PropiedadesChange(Sender: TObject);
    procedure fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(Sender: TObject);
  private
    procedure DoOcultarControles;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure DoABMHijos; override;
    procedure DoArmarSqlBusquedaAdicional; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    procedure AbrirIdentificador(aIdentificador: Integer); override;
  end;

  procedure DoMostrarEventosAgenda(aContrato: Integer; aCargaDesde: TDateTime = 0; aSoloMiSector: Boolean = False);

var
  frmAdministracionEventosCOBRANZAS: TfrmAdministracionEventosCOBRANZAS;

implementation

uses
  General, AnsiSql, SQLFuncs, unSesion, VCLExtra, unDmPrincipal, unART, CustomDlgs, unCustomGridABM;

{$R *.DFM}

procedure TfrmAdministracionEventosCOBRANZAS.RefreshData;
begin
  DoArmarSqlBusquedaAdicional;
  sdqConsulta.SQL.Text := FSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmAdministracionEventosCOBRANZAS.ClearControls;
begin
  inherited;
  sbScroll.VertScrollBar.Position     := 0;

  fraSE_SECTORINVOLUCRADO.Codigo      := Sesion.Sector;
  fraSE_SECTORINVOLUCRADO_2.Codigo    := Sesion.Sector;
  fraSE_SECTORINVOLUCRADO_2cmbDescripcionDropDown( nil );
  fraSE_SECTORINVOLUCRADOcmbDescripcionDropDown( nil );
  frafpSE_USUARIODERIVACIONTELEF.Codigo := Sesion.UserID;
  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO, True);
  VCLExtra.LockControls(fraSE_SECTORINVOLUCRADO_2, True);
  frafpSE_IDCODIGOEVENTO.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''E'' AND ag_fechabaja IS NULL AND ag_idevento = ce_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  frafpSE_IDCODIGOINGRESO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''I'' AND ag_fechabaja IS NULL AND ag_idingresoevento = ie_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''M'' AND ag_fechabaja IS NULL AND ag_idmotivo = me_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''M'' AND ag_fechabaja IS NULL AND ag_idmotivo = me_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  VCLExtra.LockControls(fraSE_IDRESPUESTA_2, False);
  fraSE_IDRESPUESTA_2.Clear;
  VCLExtra.LockControls(fraSE_IDRESPUESTA_3, True);
  fraSE_IDRESPUESTA_3.Clear;
  fraSE_IDCODIGOINGRESO.Clear;
  edSE_OBSERVACIONREALIZADO_2.Lines.Clear;
  edSE_OBSERVACIONREALIZADO.Lines.Clear;
end;

procedure TfrmAdministracionEventosCOBRANZAS.LoadControls;
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
    fraSE_IDRESPUESTA_2.Value := sdqConsulta.FieldByName('se_idrespuesta').AsInteger;
    fraSE_IDRESPUESTA_3.Clear;
    edSE_OBSERVACIONREALIZADO_2.Lines.Text := sdqConsulta.FieldByName('respuesta').AsString;
    edSE_OBSERVACIONREALIZADO.Clear;
  end
  else
  begin
    fraSE_IDRESPUESTA_3.Value := sdqConsulta.FieldByName('se_idrespuesta').AsInteger;
    fraSE_IDRESPUESTA_2.Clear;
    edSE_OBSERVACIONREALIZADO.Lines.Text := sdqConsulta.FieldByName('respuesta').AsString;
    edSE_OBSERVACIONREALIZADO_2.Clear;
  end;

  VCLExtra.LockControls([fraSE_IDRESPUESTA_2, fraSE_IDRESPUESTA_3], not cmbSE_FECHAREALIZADO.IsEmpty);

  inherited;
end;

procedure TfrmAdministracionEventosCOBRANZAS.DoABMHijos;
begin
  inherited;

  if Is_PantallaAmpliada() then
    Sql.Fields.Add('se_observacionrealizado', edSE_OBSERVACIONREALIZADO_2.Lines.Text)
  else
    Sql.Fields.Add('se_observacionrealizado', edSE_OBSERVACIONREALIZADO.Lines.Text);

  if ModoABM <> maBaja then
    Sql.Fields.Add('se_idrespuesta', Integer(IIF(fraSE_IDRESPUESTA_2.Value = ART_EMPTY_ID, fraSE_IDRESPUESTA_3.Value, fraSE_IDRESPUESTA_2.Value)), True);
end;

function TfrmAdministracionEventosCOBRANZAS.DoABM: Boolean;
begin
  Result := inherited DoABM;
end;

procedure TfrmAdministracionEventosCOBRANZAS.AbrirIdentificador(aIdentificador: Integer);
begin
  DoArmarSqlBusquedaAdicional;

  AddCondition(FSQL, ' se_identificador = ' + SqlValue(aIdentificador));

  sdqConsulta.SQL.Text := FSQL + SortDialog.OrderBy;
  OpenQuery(sdqConsulta);
  tbModificar.Click;
end;

procedure TfrmAdministracionEventosCOBRANZAS.gbFiltrosEventosAdicionalesClick(Sender: TObject);
begin
  inherited;

  DoOcultarControles;   // si no hago esto, cuando colapso y vuelvo a expandir me vuelve a poner visible el frame de ingreso
end;

procedure TfrmAdministracionEventosCOBRANZAS.FormCreate(Sender: TObject);
begin
  inherited;

  fraSE_IDCODIGOEVENTO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''E'' AND ag_idevento = ce_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDRESPUESTA.Propiedades.ExtraCondition    := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''R'' AND ag_idrespuesta = rr_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';
  fraSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''M'' AND ag_idmotivo = me_id AND ag_sector = ' + SqlValue(Sesion.Sector) + ') ';

  DoOcultarControles;
end;

procedure TfrmAdministracionEventosCOBRANZAS.DoOcultarControles;
begin
  fraSE_IDCODIGOINGRESO.Visible := False;
  Labelx2.Visible               := False;
end;

procedure TfrmAdministracionEventosCOBRANZAS.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraSE_IDRESPUESTA.Clear;
end;

procedure TfrmAdministracionEventosCOBRANZAS.fraSE_SECTORINVOLUCRADO_2cmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINVOLUCRADO_2.IsEmpty then
    fraSE_IDRESPUESTA_2.Propiedades.ExtraCondition := ' AND rr_sector = ' + SqlValue(fraSE_SECTORINVOLUCRADO_2.AsString);
  fraSE_IDRESPUESTA_2.cmbDescripcionDropDown(Sender);
end;

procedure TfrmAdministracionEventosCOBRANZAS.fraSE_SECTORINVOLUCRADOcmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINVOLUCRADO.IsEmpty then
    fraSE_IDRESPUESTA_3.Propiedades.ExtraCondition := ' AND rr_sector = ' + SqlValue(fraSE_SECTORINVOLUCRADO.AsString);
  fraSE_IDRESPUESTA_3.cmbDescripcionDropDown(Sender);
end;

procedure DoMostrarEventosAgenda(aContrato: Integer; aCargaDesde: TDateTime = 0; aSoloMiSector: Boolean = False);
begin
  with TfrmAdministracionEventosCOBRANZAS.Create(nil) do
  try
    chkSoloSector.Checked := aSoloMiSector;
    cmbSE_FECHADesde.Date := aCargaDesde;
    ShowModalEx(aContrato);
  finally
    Free;
  end;
end;

function TfrmAdministracionEventosCOBRANZAS.Validar: Boolean;
begin
  inherited Validar;

  Verificar(not Is_PantallaAmpliada() and fraSE_IDRESPUESTA_3.IsEmpty, fraSE_IDRESPUESTA_3, 'Debe ingresar la respuesta.');
  Verificar((Trim(edSE_OBSERVACIONREALIZADO_2.Text) = '') and chkNotificado.Checked, chkNotificado, 'No puede seleccionar evento notificado si no se ha ingresado el texto de la respuesta.');

  Result := True;
end;

procedure TfrmAdministracionEventosCOBRANZAS.DoArmarSqlBusquedaAdicional;
begin
  inherited;

  SqlAddJoin(FSQL, 'ACO_CONTRATO CON', 'SE.SE_CONTRATO',    'CON.CO_CONTRATO', jtInner);
  SqlAddJoin(FSQL, 'AEM_EMPRESA EMP',  'CON.CO_IDEMPRESA',  'EMP.EM_ID', jtInner);
  SqlAddJoin(FSQL, 'CRR_RESPUESTA RR', 'SE.SE_IDRESPUESTA', 'RR.RR_ID', jtOuter);

  AddField(FSQL, 'EMP.EM_NOMBRE',                      'EMPRESA');
  AddField(FSQL, 'ART.UTILES.ARMAR_CUIT(EMP.EM_CUIT)', 'CUITEMPRESA');
  AddField(FSQL, 'CON.CO_CONTRATO',                    'CONTRATO');
  AddField(FSQL, 'RR.RR_DESCRIPCION',                  'DESCRRESPUESTA');

  if fraSE_IDRESPUESTA.IsSelected then
    AddCondition(FSQL, ' se.se_idrespuesta = ' + SqlValue(fraSE_IDRESPUESTA.Value));
end;

procedure TfrmAdministracionEventosCOBRANZAS.fraSE_IDRESPUESTA_2PropiedadesChange(Sender: TObject);
begin
  inherited;
  edSE_OBSERVACIONREALIZADO_2.Lines.Add(fraSE_IDRESPUESTA_2.Descripcion);
end;

procedure TfrmAdministracionEventosCOBRANZAS.fraSE_IDRESPUESTA_3PropiedadesChange(Sender: TObject);
begin
  inherited;
  edSE_OBSERVACIONREALIZADO.Lines.Add(fraSE_IDRESPUESTA_3.Descripcion);
end;

procedure TfrmAdministracionEventosCOBRANZAS.fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(Sender: TObject);
begin
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition  := ' AND EXISTS (SELECT 1 FROM cag_agenda WHERE ag_tipo = ''M'' AND ag_fechabaja IS NULL AND ag_idmotivo = me_id AND ag_sector = ' + SqlString(NVL(fraSE_SECTORINVOLUCRADO_2.Codigo, Sesion.Sector), True) + ') ';
  inherited;
end;

end.
