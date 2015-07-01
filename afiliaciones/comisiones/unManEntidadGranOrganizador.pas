unit unManEntidadGranOrganizador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, IntEdit, unArtFrame, unFraCodigoDescripcion, SqlFuncs,
  Mask, ToolEdit, CurrEdit, unArt, unfraEntidadCUIT, unArtDBAwareFrame,
  JvgGroupBox;

type
  TfrmManEntidadGranOrganizador = class(TfrmCustomGridABM)
    fraGO_IDENTIDAD: TfraEntidadCUIT;
    Label2: TLabel;
    edGO_PORCCOMISION: TCurrencyEdit;
    SDUpdateSQL: TSDUpdateSQL;
    gbFiltros: TJvgGroupBox;
    fraFiltroEntidad: TfraEntidadCUIT;
    chkSoloGranOrg: TCheckBox;
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    chkSoloEntActivas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure edGO_PORCCOMISIONChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure chkSoloGranOrgClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
  private
    FModoStandalone: boolean;
    procedure SetIDEntidad(Valor : TTableId);
    procedure FiltroChange(Sender: TObject);
    procedure SetModoStandalone(const Value: boolean);
    function  GetIDEntidad: TTableId;
    function  TieneGranOrganizador(IDEntidad: TTableID): boolean;
  protected
    procedure RefreshData; override;
    procedure PrintResults; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  public
    function IsBaja : boolean; override;
    property IDEntidad: TTableId read GetIDEntidad write SetIDEntidad;
    property ModoStandalone: boolean read FModoStandalone write SetModoStandalone;
  end;

var
  frmManEntidadGranOrganizador: TfrmManEntidadGranOrganizador;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, VCLExtra, unSesion,
  unGrids;
  
{$R *.DFM}

procedure TfrmManEntidadGranOrganizador.ClearControls;
begin
  VCLExtra.LockControl(fraGO_IDENTIDAD, False);
  edGO_PORCCOMISION.Value := 0;
  fraGO_IDENTIDAD.Clear;
end;

function TfrmManEntidadGranOrganizador.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('GO_ID',             sdqConsulta.FieldByName('GO_ID').AsInteger);
    Sql.Fields.Add('GO_FECHABAJA',          exDateTime);
    Sql.Fields.Add('GO_USUBAJA',            Sesion.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;

      Sql.PrimaryKey.AddExpression('GO_ID', 'SEQ_XGO_ID.NEXTVAL');
      Sql.Fields.Add('GO_FECHAALTA',        exDateTime);
      Sql.Fields.Add('GO_USUALTA',          Sesion.UserID);
    end
    else
    begin { maModificacion }
      Sql.SqlType := stUpdate;

      Sql.PrimaryKey.Add('GO_ID',           sdqConsulta.FieldByName('GO_ID').AsInteger);
      Sql.Fields.Add('GO_FECHAMODIF',       exDateTime);
      Sql.Fields.Add('GO_USUMODIF',         Sesion.UserID);
    end;

    if ModoStandalone then
    begin
      Sql.Fields.Add('GO_IDENTIDAD',        fraGO_IDENTIDAD.Value);
      Sql.Fields.Add('GO_IDENTORGANIZADOR', fraFiltroEntidad.Value);
    end else
    begin
      Sql.Fields.Add('GO_IDENTIDAD',        fraFiltroEntidad.Value);
      Sql.Fields.Add('GO_IDENTORGANIZADOR', fraGO_IDENTIDAD.Value);
    end;

    Sql.Fields.Add('GO_PORCCOMISION',       edGO_PORCCOMISION.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManEntidadGranOrganizador.LoadControls;
begin
  VCLExtra.LockControl(fraGO_IDENTIDAD, True);
  edGO_PORCCOMISION.Value := sdqConsulta.FieldByName('GO_PORCCOMISION').AsFloat;
  fraGO_IDENTIDAD.Value   := sdqConsulta.FieldByName('GO_IDENTIDAD').AsInteger;
end;

procedure TfrmManEntidadGranOrganizador.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

function TfrmManEntidadGranOrganizador.Validar: Boolean;
begin
  Verificar(fraGO_IDENTIDAD.IsEmpty, fraGO_IDENTIDAD, 'La entidad es obligatoria.');
  Verificar(fraGO_IDENTIDAD.Value = fraFiltroEntidad.Value, fraGO_IDENTIDAD, 'Una entidad no puede ser organizadora de si misma.');
  Verificar((edGO_PORCCOMISION.Value <=0) OR (edGO_PORCCOMISION.Value > 100), edGO_PORCCOMISION, 'El campo comisión debe ser mayor que 0 y menor o igual que 100.');
  Verificar((ModoABM = maAlta) and ModoStandAlone and TieneGranOrganizador(fraGO_IDENTIDAD.Value), fraGO_IDENTIDAD.edEN_CODBANCO, Format('La entidad %s ya tiene un organizador asociado.', [fraGO_IDENTIDAD.Descripcion]));

  Result := True;
end;

procedure TfrmManEntidadGranOrganizador.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  Sql.TableName                  := 'XGO_GRANORGANIZADOR';
  FieldBaja                      := 'FECHABAJA';
  fraGO_IDENTIDAD.ExtraCondition := 'AND EN_FECHABAJA IS NULL ';
  fraGO_IDENTIDAD.ShowBajas      := False;
  fraGO_IDENTIDAD.FieldCodigo    := 'EN_CODBANCO';

  with fraFiltroEntidad do
    begin
      FieldCodigo := 'EN_CODBANCO';
      OnChange    := FiltroChange;
    end;

  IDEntidad      := ART_EMPTY_ID;
  ModoStandalone := True;

  chkSoloGranOrg.Checked := ModoStandalone;
  chkSoloGranOrgClick(nil);
end;

procedure TfrmManEntidadGranOrganizador.SetIDEntidad(Valor: TTableId);
begin
  if (fraFiltroEntidad.Value <> Valor) then
  begin
    ModoStandalone         := False;
    fraFiltroEntidad.Value := Valor;
    RefreshData;
  end;
end;

procedure TfrmManEntidadGranOrganizador.FiltroChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmManEntidadGranOrganizador.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'El registro ya se encuentra aprobado.');

  inherited;
end;

procedure TfrmManEntidadGranOrganizador.RefreshData;
var
  sWhere, sSql : String;
begin
  if ModoStandalone then
    sSql := 'SELECT DISTINCT GO_ID, GO_IDENTIDAD, GO_IDENTORGANIZADOR, EN_CODBANCO, EN_NOMBRE, GO_PORCCOMISION, ' +
                   'GO_USUALTA, GO_FECHAALTA, GO_USUBAJA, TRUNC(GO_FECHABAJA) FECHABAJA, TRUNC(GO_FECHAAPROBADO) FECHAAPROBADO, ' +
                   'VC_PORCPRIVADO, VC_PORCPUBLICO, TRUNC(EN_FECHABAJA) FECHABAJAENT ' +
              'FROM XEN_ENTIDAD, XGO_GRANORGANIZADOR, ' +
                   '(SELECT EV_IDENTIDAD, VC_PORCPRIVADO, VC_PORCPUBLICO ' +
                      'FROM XEV_ENTIDADVENDEDOR, XVC_ENTVENDCONCEPTO ' +
                     'WHERE EV_ID = VC_IDENTIDADVEND ' +
                       'AND EV_FECHABAJA IS NULL ' +
                       'AND VC_FECHABAJA IS NULL ' +
                       'AND VC_IDCONCEPTO = 1) ' +
             'WHERE EN_ID = GO_IDENTIDAD ' +
               'AND EN_ID = EV_IDENTIDAD(+) ' +
               'AND GO_IDENTORGANIZADOR = :ID '
  else
    sSql := 'SELECT DISTINCT GO_ID, GO_IDENTIDAD, GO_IDENTORGANIZADOR, EN_CODBANCO, EN_NOMBRE, TRUNC(GO_FECHAAPROBADO) FECHAAPROBADO, ' +
                   'GO_USUALTA, GO_FECHAALTA, GO_USUBAJA, TRUNC(GO_FECHABAJA) FECHABAJA, GO_FECHAAPROBADO, ' +
                   'VC_PORCPRIVADO, VC_PORCPUBLICO, NULL GO_PORCCOMISION, TRUNC(EN_FECHABAJA) FECHABAJAENT ' +
              'FROM XEN_ENTIDAD, XGO_GRANORGANIZADOR, ' +
                   '(SELECT EV_IDENTIDAD, VC_PORCPRIVADO, VC_PORCPUBLICO ' +
                      'FROM XEV_ENTIDADVENDEDOR, XVC_ENTVENDCONCEPTO ' +
                     'WHERE EV_ID = VC_IDENTIDADVEND ' +
                       'AND EV_FECHABAJA IS NULL ' +
                       'AND VC_FECHABAJA IS NULL ' +
                       'AND VC_IDCONCEPTO = 1) ' +
             'WHERE EN_ID = GO_IDENTORGANIZADOR ' +
               'AND EN_ID = EV_IDENTIDAD(+) ' +
               'AND GO_IDENTIDAD = :ID ';

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND GO_FECHABAJA IS NULL';

  if chkSoloEntActivas.Checked then
    sWhere := sWhere + ' AND EN_FECHABAJA IS NULL';

  OpenQueryEx(sdqConsulta, [IDEntidad], sSql + sWhere, True);
  inherited;
end;

procedure TfrmManEntidadGranOrganizador.edGO_PORCCOMISIONChange(Sender: TObject);
begin
  if (edGO_PORCCOMISION.Text <> '') then
    if StrToFloat( edGO_PORCCOMISION.Text ) > edGO_PORCCOMISION.MaxValue then
    begin
      MessageDlg('La comisión no puede ser mayor de 100.', mtError, [mbOK], 0);
      edGO_PORCCOMISION.Value := 0;
      edGO_PORCCOMISION.SelectAll;
    end;
end;

function TfrmManEntidadGranOrganizador.IsBaja: boolean;
begin
  Result := inherited IsBaja;
end;

procedure TfrmManEntidadGranOrganizador.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControl(fraFiltroEntidad, False);
  fraFiltroEntidad.Clear;
  chkSoloActivos.Checked    := True;
  chkSoloEntActivas.Checked := True;
end;

procedure TfrmManEntidadGranOrganizador.SetModoStandalone(const Value: boolean);
begin
  FModoStandalone := Value;
  VCLExtra.LockControl(fraFiltroEntidad, not Value);
  tbLimpiar.Visible := Value;
  
  if not Value then
  begin
    gbFiltros.Caption := ' Filtro (Entidad)';
    Grid.ColumnByField['EN_NOMBRE'].Title.Caption := 'Organizador';
  end else
  begin
    gbFiltros.Caption := ' Filtro (Organizadores)';
    Grid.ColumnByField['EN_NOMBRE'].Title.Caption := 'Entidad Asociada';
  end;

  chkSoloGranOrg.Checked := FModoStandalone;
  chkSoloGranOrgClick(nil);
end;

function TfrmManEntidadGranOrganizador.GetIDEntidad: TTableId;
begin
  Result := fraFiltroEntidad.Value;
end;

function TfrmManEntidadGranOrganizador.TieneGranOrganizador(IDEntidad: TTableID): boolean;
begin
  Result := ExisteSQLEx('SELECT 1 FROM XGO_GRANORGANIZADOR WHERE GO_IDENTIDAD = :ID AND GO_FECHABAJA IS NULL', [IDEntidad]);
end;

procedure TfrmManEntidadGranOrganizador.tbNuevoClick(Sender: TObject);
begin
  Verificar(fraFiltroEntidad.IsEmpty, fraFiltroEntidad.edEN_CODBANCO, 'Debe seleccionar una entidad.');
  Verificar(not ModoStandAlone and TieneGranOrganizador(fraFiltroEntidad.Value), fraFiltroEntidad.edEN_CODBANCO, Format('La entidad %s ya tiene un organizador asociado.', [fraFiltroEntidad.Descripcion]));
  inherited;
end;

procedure TfrmManEntidadGranOrganizador.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);  
  Width := GetColumnWidths(Grid, True);

  if sdqConsulta.FieldByName('GO_PORCCOMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('GO_PORCCOMISION')).DisplayFormat        := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('VC_PORCPRIVADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VC_PORCPRIVADO')).DisplayFormat    := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('VC_PORCPUBLICO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VC_PORCPUBLICO')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmManEntidadGranOrganizador.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe seleccionar un registro.');
  Verificar(IsBaja, Grid, 'Debe seleccionar un registro que no esté dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'La relación ya ha sido aprobada.');

  if MsgAsk('¿Está seguro que desea aprobar esta relación?') then
    begin
      EjecutarSqlEx('UPDATE XGO_GRANORGANIZADOR ' +
                       'SET GO_USUAPROBADO = :USUARIO, ' +
                           'GO_FECHAAPROBADO = SYSDATE ' +
                     'WHERE GO_ID = :ID', [Sesion.UserID, sdqConsulta.FieldByName('GO_ID').AsInteger]);

      RefreshData;
    end;
end;

procedure TfrmManEntidadGranOrganizador.chkSoloGranOrgClick(Sender: TObject);
begin
  with fraFiltroEntidad do
    if ModoStandalone and chkSoloGranOrg.Checked then
      ExtraCondition := ' AND EXISTS (SELECT 1 FROM XGO_GRANORGANIZADOR WHERE GO_IDENTORGANIZADOR = EN_ID AND GO_FECHABAJA IS NULL) '
    else
      ExtraCondition := '';
end;

procedure TfrmManEntidadGranOrganizador.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Title.Text := 'Organizador';
  if fraFiltroEntidad.IsSelected then
    QueryPrint.Title.Text := QueryPrint.Title.Text + ' ' + fraFiltroEntidad.Codigo + ' (' + fraFiltroEntidad.Descripcion + ')';
    
  inherited;
end;

end.

