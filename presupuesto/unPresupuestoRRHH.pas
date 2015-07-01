unit unPresupuestoRRHH;

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
  TfrmPresupuestoRRHH = class(TfrmCustomGridABM)
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
    fraPH_IDPRESUPUESTO: TfraCodigoDescripcion;
    Label7: TLabel;
    fraPH_IDINDICADOR: TfraCodigoDescripcion;
    Label8: TLabel;
    edPH_MES: TIntEdit;
    Label9: TLabel;
    edPH_VALORPRESUP: TCurrencyEdit;
    btnContinuar: TButton;
    Label10: TLabel;
    edPH_VALORREAL: TCurrencyEdit;
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
  frmPresupuestoRRHH: TfrmPresupuestoRRHH;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmPresupuestoRRHH.ClearControls;
begin
  pbHuboCambios := False;

  DoLimpiarDatosAltaModif(True);
  VCLExtra.LockControl(edPH_VALORPRESUP, False);
end;

procedure TfrmPresupuestoRRHH.LoadControls;
begin
  pbHuboCambios := False;

  fraPH_IDPRESUPUESTO.Value := sdqConsulta.FieldByName('IDPRESUPUESTO').AsInteger;
  fraPH_IDINDICADOR.Value   := sdqConsulta.FieldByName('IDINDICADOR').AsInteger;
  edPH_MES.Value            := sdqConsulta.FieldByName('MES').AsInteger;
  edPH_VALORPRESUP.Value    := sdqConsulta.FieldByName('VALOR_PRESUPUESTADO').AsCurrency;
  edPH_VALORREAL.Value      := sdqConsulta.FieldByName('VALOR_REAL').AsCurrency;

  VCLExtra.LockControl(edPH_VALORPRESUP, not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull);
end;

function TfrmPresupuestoRRHH.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('PH_ID',      GetSecNextVal('SEQ_OPH_ID'));
              Fields.Add('PH_FECHAALTA',   exDateTime);
              Fields.Add('PH_USUALTA',     Sesion.UserID );

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('PH_ID',      sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('PH_FECHAMODIF',  exDateTime);
              Fields.Add('PH_USUMODIF',    Sesion.UserID );

              SqlType := stUpdate;
            end;

          Fields.Add('PH_IDPRESUPUESTO',   fraPH_IDPRESUPUESTO.Value);
          Fields.Add('PH_IDINDICADOR',     fraPH_IDINDICADOR.Value);
          Fields.Add('PH_MES',             edPH_MES.Value);
          Fields.Add('PH_VALORPRESUP',     edPH_VALORPRESUP.Value);
          Fields.Add('PH_VALORREAL',       edPH_VALORREAL.Value);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PH_ID',      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PH_FECHABAJA',   exDateTime);
          Fields.Add('PH_USUBAJA',     Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmPresupuestoRRHH.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraPH_IDPRESUPUESTO.IsEmpty, fraPH_IDPRESUPUESTO, 'El presupuesto es obligatorio.');
  Verificar(fraPH_IDINDICADOR.IsEmpty, fraPH_IDINDICADOR, 'El indicador es obligatorio.');
  Verificar((edPH_MES.Value < 1) or (edPH_MES.Value > 12), edPH_MES, 'El mes debe estar entre 1 y 12.');
  Verificar(edPH_VALORPRESUP.Value = 0, edPH_VALORPRESUP, 'El valor presupuestado es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM OPH_PRESUPUESTORRHH ' +
           'WHERE PH_IDPRESUPUESTO = ' + SqlValue(fraPH_IDPRESUPUESTO.Value) + ' ' +
             'AND PH_IDINDICADOR = ' + SqlValue(fraPH_IDINDICADOR.Value) + ' ' +
             'AND PH_MES = ' + SqlValue(edPH_MES.Value) + ' ' +
             'AND PH_FECHABAJA IS NULL ' +
             Iif(ModoABM = maModificacion, 'AND PH_ID <> ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger), '');
  Verificar(ExisteSql(sSql), TControl(Iif(not edPH_VALORPRESUP.ReadOnly, edPH_VALORPRESUP, edPH_VALORREAL)), 'Ya existe un valor presupuestado para el resto de los datos ingresados.');

  Result := True;
end;

procedure TfrmPresupuestoRRHH.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin             
  edAnioExit(nil);

  sWhere := '';

  sSql := 'SELECT PR_AÑO AÑO, PR_VERSION VERSION, PN_DESCRIPCION INDICADOR, PH_MES MES, ' +
                 'PH_VALORPRESUP VALOR_PRESUPUESTADO, PH_VALORREAL VALOR_REAL, PH_ID ID, ' +
                 'SC_DESCRIPCION SECTOR, TRUNC(PR_FECHACONGELADO) FECHA_CONGELADO, TRUNC(PH_FECHABAJA) FECHA_BAJA, ' +
                 'PH_IDPRESUPUESTO IDPRESUPUESTO, PH_IDINDICADOR IDINDICADOR ' +
            'FROM USC_SECTORES, OPN_PRESUPUESTOCONCINDICADOR, OPR_PRESUPUESTO, OPH_PRESUPUESTORRHH ' +
           'WHERE SC_CODIGO = PN_SECTOR ' +
             'AND PR_ID = PH_IDPRESUPUESTO ' +
             'AND PN_ID = PH_IDINDICADOR ' +
             'AND PR_FECHABAJA IS NULL ';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PH_FECHABAJA IS NULL';

  if not edAnio.IsEmpty then
    sWhere := sWhere + ' AND PR_AÑO = ' + SqlValue(edAnio.Value);

  if not edVersion.IsEmpty then
    sWhere := sWhere + ' AND PR_VERSION = ' + SqlValue(edVersion.Value);

  if (edMes.Value >= 1) and (edMes.Value <= 12) then
    sWhere := sWhere + ' AND PH_MES = ' + SqlValue(edMes.Value);

  if fraSector.IsSelected then
    sWhere := sWhere + ' AND PN_SECTOR = ' + SqlValue(fraSector.Codigo);

  if fraIndicador.IsSelected then
    sWhere := sWhere + ' AND PN_ID = ' + SqlValue(fraIndicador.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPresupuestoRRHH.edAnioExit(Sender: TObject);
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

procedure TfrmPresupuestoRRHH.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OPH_PRESUPUESTORRHH';

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

  with fraPH_IDPRESUPUESTO do
    begin
      TableName      := 'OPR_PRESUPUESTO';
      FieldID        := 'PR_ID';
      FieldCodigo    := 'PR_ID';
      FieldDesc      := '''Año '' || PR_AÑO || '' - Versión '' || PR_VERSION';
      FieldBaja      := 'PR_FECHABAJA';
      ExtraCondition := ' AND PR_FECHACONGELADO IS NULL';
      ShowBajas      := False;
    end;

  with fraPH_IDINDICADOR do
    begin
      TableName      := 'OPN_PRESUPUESTOCONCINDICADOR';
      FieldID        := 'PN_ID';
      FieldCodigo    := 'PN_ID';
      FieldDesc      := 'PN_DESCRIPCION';
      FieldBaja      := 'PN_FECHABAJA';
      ExtraCondition := ' AND PN_SECTOR = ' + SqlValue(Sesion.Sector);
      ShowBajas      := False;
    end;

  VCLExtra.LockControls([fraSector, edVersion]);
end;

procedure TfrmPresupuestoRRHH.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edAnio.Clear;
  edVersion.Clear;
  edMes.Clear;
  fraSector.Clear;
  fraIndicador.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmPresupuestoRRHH.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El presupuesto RRHH ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ha sido congelado.');

  inherited;
end;

procedure TfrmPresupuestoRRHH.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El presupuesto RRHH ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmPresupuestoRRHH.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VALOR_PRESUPUESTADO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('VALOR_PRESUPUESTADO')).Currency := True;

  if sdqConsulta.FieldByName('VALOR_REAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('VALOR_REAL')).Currency := True;
end;

procedure TfrmPresupuestoRRHH.btnAceptarClick(Sender: TObject);
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

procedure TfrmPresupuestoRRHH.DoLimpiarDatosAltaModif(BorrarTodos: Boolean);
begin
  edPH_MES.Clear;
  edPH_VALORPRESUP.Clear;
  edPH_VALORREAL.Clear;

  if BorrarTodos then
    begin
      fraPH_IDPRESUPUESTO.Clear;
      fraPH_IDINDICADOR.Clear;
    end
  else
    edPH_MES.SetFocus;
end;

procedure TfrmPresupuestoRRHH.btnCancelarClick(Sender: TObject);
begin
  if pbHuboCambios then
    RefreshData;

  fpAbm.Close;
end;

end.

