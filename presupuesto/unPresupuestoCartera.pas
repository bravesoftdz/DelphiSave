unit unPresupuestoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, ToolEdit, CurrEdit,
  unfraCtbTablas;

type
  TfrmPresupuestoCartera = class(TfrmCustomGridABM)
    Label1: TLabel;
    edAnio: TIntEdit;
    Label2: TLabel;
    edVersion: TIntEdit;
    Label3: TLabel;
    edMes: TIntEdit;
    chkNoMostrarBajas: TCheckBox;
    Label4: TLabel;
    fraSector: TfraCodigoDescripcion;
    Label5: TLabel;
    fraIndicador: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    Label6: TLabel;
    fraPA_IDPRESUPUESTO: TfraCodigoDescripcion;
    Label7: TLabel;
    fraPA_IDINDICADOR: TfraCodigoDescripcion;
    Label8: TLabel;
    edPA_MES: TIntEdit;
    Label9: TLabel;
    edPA_VALOR: TCurrencyEdit;
    Label10: TLabel;
    fraPA_SECTOR: TfraCtbTablas;
    Label11: TLabel;
    fraPA_IDCANAL: TfraCodigoDescripcion;
    btnContinuar: TButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure edAnioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    pbHuboCambios: Boolean;
    procedure DoLimpiarDatosAltaModif(BorrarTodos: Boolean);
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPresupuestoCartera: TfrmPresupuestoCartera;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmPresupuestoCartera.ClearControls;
begin
  pbHuboCambios := False;

  DoLimpiarDatosAltaModif(True)
end;

procedure TfrmPresupuestoCartera.LoadControls;
begin
  pbHuboCambios := False;

  fraPA_IDPRESUPUESTO.Value := sdqConsulta.FieldByName('IDPRESUPUESTO').AsInteger;
  fraPA_IDINDICADOR.Value   := sdqConsulta.FieldByName('IDINDICADOR').AsInteger;
  edPA_MES.Value            := sdqConsulta.FieldByName('MES').AsInteger;
  edPA_VALOR.Value          := sdqConsulta.FieldByName('VALOR').AsCurrency;
  fraPA_SECTOR.Codigo       := sdqConsulta.FieldByName('SECTOREMPR').AsString;
  fraPA_IDCANAL.Value       := sdqConsulta.FieldByName('IDCANAL').AsInteger;
end;

function TfrmPresupuestoCartera.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('PA_ID',      GetSecNextVal('SEQ_OPA_ID'));
              Fields.Add('PA_FECHAALTA',   exDateTime);
              Fields.Add('PA_USUALTA',     Sesion.UserID );

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('PA_ID',      sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('PA_FECHAMODIF',  exDateTime);
              Fields.Add('PA_USUMODIF',    Sesion.UserID );

              SqlType := stUpdate;
            end;

          Fields.Add('PA_IDPRESUPUESTO',   fraPA_IDPRESUPUESTO.Value);
          Fields.Add('PA_IDINDICADOR',     fraPA_IDINDICADOR.Value);
          Fields.Add('PA_MES',             edPA_MES.Value);
          Fields.Add('PA_VALOR',           edPA_VALOR.Value);
          Fields.Add('PA_SECTOR',          fraPA_SECTOR.Codigo);
          Fields.Add('PA_IDCANAL',         fraPA_IDCANAL.Value, True);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PA_ID',      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PA_FECHABAJA',   exDateTime);
          Fields.Add('PA_USUBAJA',     Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmPresupuestoCartera.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraPA_IDPRESUPUESTO.IsEmpty, fraPA_IDPRESUPUESTO, 'El presupuesto es obligatorio.');
  Verificar(fraPA_IDINDICADOR.IsEmpty, fraPA_IDINDICADOR, 'El indicador es obligatorio.');
  Verificar(fraPA_SECTOR.IsEmpty, fraPA_SECTOR, 'El sector de la empresa es obligatorio.');
  Verificar((edPA_MES.Value < 1) or (edPA_MES.Value > 12), edPA_MES, 'El mes debe estar entre 1 y 12.');
  Verificar(edPA_VALOR.Value = 0, edPA_VALOR, 'El valor es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM OPA_PRESUPUESTOCARTERA ' +
           'WHERE PA_IDPRESUPUESTO = ' + SqlValue(fraPA_IDPRESUPUESTO.Value) + ' ' +
             'AND PA_IDINDICADOR = ' + SqlValue(fraPA_IDINDICADOR.Value) + ' ' +
             'AND PA_MES = ' + SqlValue(edPA_MES.Value) + ' ' +
             'AND PA_SECTOR = ' + SqlValue(fraPA_SECTOR.Codigo) + ' ' +
             Iif(fraPA_IDCANAL.IsEmpty, 'AND PA_IDCANAL IS NULL', 'AND PA_IDCANAL = ' + SqlValue(fraPA_IDCANAL.Value)) + ' ' +
             'AND PA_FECHABAJA IS NULL ' +
             Iif(ModoABM = maModificacion, 'AND PA_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger), '');
  Verificar(ExisteSql(sSql), edPA_VALOR, 'Ya existe un valor para el resto de los datos ingresados.');

  Result := True;
end;

procedure TfrmPresupuestoCartera.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin             
  edAnioExit(nil);

  sWhere := '';

  sSql := 'SELECT PR_AÑO AÑO, PR_VERSION VERSION, PN_DESCRIPCION INDICADOR, PA_MES MES, PA_VALOR VALOR, ' +
                 'SC_DESCRIPCION SECTOR, TRUNC(PR_FECHACONGELADO) FECHA_CONGELADO, TRUNC(PA_FECHABAJA) FECHA_BAJA, ' +
                 'PA_IDPRESUPUESTO IDPRESUPUESTO, PA_IDINDICADOR IDINDICADOR, PA_ID ID, ' +
                 'TB_DESCRIPCION DESCRSECTOREMPR, CA_DESCRIPCION DESCRCANAL, PA_SECTOR SECTOREMPR, PA_IDCANAL IDCANAL ' +
            'FROM ACA_CANAL, CTB_TABLAS, USC_SECTORES, OPN_PRESUPUESTOCONCINDICADOR, OPR_PRESUPUESTO, ' +
                 'OPA_PRESUPUESTOCARTERA ' +
           'WHERE SC_CODIGO = PN_SECTOR ' +
             'AND PR_ID = PA_IDPRESUPUESTO ' +
             'AND PN_ID = PA_IDINDICADOR ' +
             'AND PR_FECHABAJA IS NULL ' +
             'AND TB_CLAVE = ''SECT'' ' +
             'AND PA_SECTOR = TB_CODIGO ' +
             'AND PA_IDCANAL = CA_ID(+) ';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PA_FECHABAJA IS NULL';

  if not edAnio.IsEmpty then
    sWhere := sWhere + ' AND PR_AÑO = ' + SqlValue(edAnio.Value);

  if not edVersion.IsEmpty then
    sWhere := sWhere + ' AND PR_VERSION = ' + SqlValue(edVersion.Value);

  if (edMes.Value >= 1) and (edMes.Value <= 12) then
    sWhere := sWhere + ' AND PA_MES = ' + SqlValue(edMes.Value);

  if fraSector.IsSelected then
    sWhere := sWhere + ' AND PN_SECTOR = ' + SqlValue(fraSector.Codigo);

  if fraIndicador.IsSelected then
    sWhere := sWhere + ' AND PN_ID = ' + SqlValue(fraIndicador.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPresupuestoCartera.edAnioExit(Sender: TObject);
var
  sSql: String;
begin
  if not edAnio.IsEmpty then
    begin
      sSql := 'SELECT NVL(MAX(PR_VERSION), 0) ' +
                'FROM OPR_PRESUPUESTO ' +
               'WHERE PR_AÑO = :Anio';
      edVersion.Value := ValorSqlIntegerEx(sSql, [edAnio.Value]);
    end
  else
    edVersion.Clear;
end;

procedure TfrmPresupuestoCartera.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OPA_PRESUPUESTOCARTERA';

  with fraSector do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := False;
      Codigo      := Sesion.Sector;
    end;

  with fraIndicador do
    begin
      TableName      := 'OPN_PRESUPUESTOCONCINDICADOR';
      FieldID        := 'PN_ID';
      FieldCodigo    := 'PN_ID';
      FieldDesc      := 'PN_DESCRIPCION';
      FieldBaja      := 'PN_FECHABAJA';
      ExtraCondition := ' AND PN_SECTOR = ' + SqlValue(Sesion.Sector);
      ShowBajas      := True;
    end;

  with fraPA_IDPRESUPUESTO do
    begin
      TableName      := 'OPR_PRESUPUESTO';
      FieldID        := 'PR_ID';
      FieldCodigo    := 'PR_ID';
      FieldDesc      := '''Año '' || PR_AÑO || '' - Versión '' || PR_VERSION';
      FieldBaja      := 'PR_FECHABAJA';
      ExtraCondition := ' AND PR_FECHACONGELADO IS NULL';
      ShowBajas      := False;
    end;

  with fraPA_IDINDICADOR do
    begin
      TableName      := 'OPN_PRESUPUESTOCONCINDICADOR';
      FieldID        := 'PN_ID';
      FieldCodigo    := 'PN_ID';
      FieldDesc      := 'PN_DESCRIPCION';
      FieldBaja      := 'PN_FECHABAJA';
      ExtraCondition := ' AND PN_SECTOR = ' + SqlValue(Sesion.Sector);
      ShowBajas      := False;
    end;

  with fraPA_SECTOR do
    begin
      Clave     := 'SECT';
      ShowBajas := False;
    end;

  with fraPA_IDCANAL do
    begin
      TableName      := 'ACA_CANAL';
      FieldID        := 'CA_ID';
      FieldCodigo    := 'CA_CODIGO';
      FieldDesc      := 'CA_DESCRIPCION';
      FieldBaja      := 'CA_FECHABAJA';
      ExtraCondition := ' AND (CA_FECHABAJA IS NULL OR CA_CODIGO = ''001'')';
      ShowBajas      := True;
    end;

  VCLExtra.LockControls([fraSector, edVersion]);
end;

procedure TfrmPresupuestoCartera.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edAnio.Clear;
  edVersion.Clear;
  edMes.Clear;
  fraSector.Clear;
  fraIndicador.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmPresupuestoCartera.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El presupuesto de cartera ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ha sido congelado.');

  inherited;
end;

procedure TfrmPresupuestoCartera.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El presupuesto de cartera ya ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ha sido congelado.');

  inherited;
end;

procedure TfrmPresupuestoCartera.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VALOR') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('VALOR')).Currency := True;
end;

procedure TfrmPresupuestoCartera.btnAceptarClick(Sender: TObject);
var
  bSalir: Boolean;
begin
  bSalir := (Sender = btnAceptar);

	if Validar and DoABM then
    begin
      if bSalir then
        begin
          if sdqConsulta.Active then
            begin
              sdqConsulta.Refresh;
              CheckButtons;
            end
          else
            tbRefrescarClick(nil);

          fpABM.ModalResult := mrOk;
        end
      else
        begin
          pbHuboCambios := True;

          DoLimpiarDatosAltaModif(False);
        end;
    end;
end;

procedure TfrmPresupuestoCartera.DoLimpiarDatosAltaModif(BorrarTodos: Boolean);
begin
  edPA_MES.Clear;
  edPA_VALOR.Clear;

  if BorrarTodos then
    begin
      fraPA_IDPRESUPUESTO.Clear;
      fraPA_IDINDICADOR.Clear;
      fraPA_SECTOR.Clear;
      fraPA_IDCANAL.Clear;
    end
  else
    edPA_MES.SetFocus;
end;

procedure TfrmPresupuestoCartera.btnCancelarClick(Sender: TObject);
begin
  if pbHuboCambios then
    RefreshData;

  fpAbm.Close;
end;

end.

