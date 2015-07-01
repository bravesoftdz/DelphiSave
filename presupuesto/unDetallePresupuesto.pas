unit unDetallePresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, ToolEdit, CurrEdit;

type
  TfrmDetallePresupuesto = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edAnio: TIntEdit;
    chkNoMostrarBajas: TCheckBox;
    Label2: TLabel;
    edVersion: TIntEdit;
    Label3: TLabel;
    edMes: TIntEdit;
    Label4: TLabel;
    fraConcepto: TfraCodigoDescripcion;
    Label5: TLabel;
    fraPresupuestoAltaModif: TfraCodigoDescripcion;
    Label6: TLabel;
    fraConceptoAltaModif: TfraCodigoDescripcion;
    Label7: TLabel;
    edMesAltaModif: TIntEdit;
    edImporteAltaModif: TCurrencyEdit;
    Label8: TLabel;
    btnGuardarContinuar: TButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edAnioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    pbHuboCambios: Boolean;
    procedure DoLimpiarAlta(Continuar: Boolean);
    procedure DoRefrescarDatos;
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmDetallePresupuesto: TfrmDetallePresupuesto;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, unArt,
  VCLExtra, CustomDlgs;

procedure TfrmDetallePresupuesto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmDetallePresupuesto.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  edAnioExit(nil);
  
  sWhere := '';

  sSql := 'SELECT PR_AÑO AÑO, PR_VERSION VERSION, PC_DESCRIPCION CONCEPTO, PD_MES MES, PD_IMPORTE IMPORTE, ' +
                 'SC_DESCRIPCION SECTOR, TRUNC(PR_FECHACONGELADO) FECHA_CONGELADO, TRUNC(PD_FECHABAJA) FECHA_BAJA, ' +
                 'PR_ID IDPRESUPUESTO, PC_ID IDPRESCONCEPTO, PD_ID ID, SC_CODIGO CODSECTOR ' +
            'FROM USC_SECTORES, OPC_PRESUPUESTOCONCEPTO, OPR_PRESUPUESTO, OPD_PRESUPUESTODETALLE ' +
           'WHERE SC_CODIGO = PC_SECTOR ' +
             'AND PR_ID = PD_IDPRESUPUESTO ' +
             'AND PC_ID = PD_IDCONCEPTO ' +
             'AND PR_FECHABAJA IS NULL';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PD_FECHABAJA IS NULL';

  if not edAnio.IsEmpty then
    sWhere := sWhere + ' AND PR_AÑO = ' + SqlValue(edAnio.Value);

  if not edVersion.IsEmpty then
    sWhere := sWhere + ' AND PR_VERSION = ' + SqlValue(edVersion.Value);

  if (edMes.Value >= 1) and (edMes.Value <= 12) then
    sWhere := sWhere + ' AND PD_MES = ' + SqlValue(edMes.Value);

  if fraConcepto.IsSelected then
    sWhere := sWhere + ' AND PC_ID = ' + SqlValue(fraConcepto.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmDetallePresupuesto.ClearControls;
begin
  pbHuboCambios := False;

  fraPresupuestoAltaModif.Clear;
  fraConceptoAltaModif.Clear;
  edMesAltaModif.Clear;
  edImporteAltaModif.Clear;

  VCLExtra.LockControl(btnGuardarContinuar, False);
end;

procedure TfrmDetallePresupuesto.LoadControls;
begin
  pbHuboCambios := False;

  fraPresupuestoAltaModif.Value := sdqConsulta.FieldByName('IDPRESUPUESTO').AsInteger;
  fraConceptoAltaModif.Value    := sdqConsulta.FieldByName('IDPRESCONCEPTO').AsInteger;
  edMesAltaModif.Value          := sdqConsulta.FieldByName('MES').AsInteger;
  edImporteAltaModif.Value      := sdqConsulta.FieldByName('IMPORTE').AsCurrency;

  VCLExtra.LockControl(btnGuardarContinuar);
end;

function TfrmDetallePresupuesto.Validar: Boolean;
begin
  Verificar(fraPresupuestoAltaModif.IsEmpty, fraPresupuestoAltaModif, 'El presupuesto es obligatorio.');
  Verificar(fraConceptoAltaModif.IsEmpty, fraConceptoAltaModif, 'El concepto es obligatorio.');
  Verificar((edMesAltaModif.Value < 1) or (edMesAltaModif.Value > 12), edMesAltaModif, 'El mes debe estar entre 1 y 12.');
  Verificar(edImporteAltaModif.Value = 0, edImporteAltaModif, 'El importe es obligatorio.');

  Result := True;
end;

function TfrmDetallePresupuesto.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('PD_ID',      GetSecNextVal('SEQ_OPD_PRESUPUESTODETALLE_ID'));
              Fields.Add('PD_FECHAALTA',   exDateTime);
              Fields.Add('PD_USUALTA',     Sesion.UserID );

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('PD_ID',      sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('PD_FECHAMODIF',  exDateTime);
              Fields.Add('PD_USUMODIF',    Sesion.UserID );

              SqlType := stUpdate;
            end;

          Fields.Add('PD_IDPRESUPUESTO',   fraPresupuestoAltaModif.Value);
          Fields.Add('PD_IDCONCEPTO',      fraConceptoAltaModif.Value);
          Fields.Add('PD_MES',             edMesAltaModif.Value);
          Fields.Add('PD_IMPORTE',         edImporteAltaModif.Value);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PD_ID',      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PD_FECHABAJA',   exDateTime);
          Fields.Add('PD_USUBAJA',     Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

procedure TfrmDetallePresupuesto.edAnioExit(Sender: TObject);
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

procedure TfrmDetallePresupuesto.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OPD_PRESUPUESTODETALLE';

  with fraConcepto do
    begin
      TableName      := 'OPC_PRESUPUESTOCONCEPTO';
      FieldID        := 'PC_ID';
      FieldCodigo    := 'PC_ID';
      FieldDesc      := 'PC_DESCRIPCION';
      FieldBaja      := 'PC_FECHABAJA';
      ShowBajas      := True;
      ExtraCondition := ' AND PC_SECTOR = ' + SqlValue(Sesion.Sector)
    end;

  with fraPresupuestoAltaModif do
    begin
      TableName      := 'OPR_PRESUPUESTO';
      FieldID        := 'PR_ID';
      FieldCodigo    := 'PR_ID';
      FieldDesc      := '''Año '' || PR_AÑO || '' - Versión '' || PR_VERSION';
      FieldBaja      := 'PR_FECHABAJA';
      ExtraCondition := ' AND PR_FECHACONGELADO IS NULL';
      ShowBajas      := False;
    end;

  with fraConceptoAltaModif do
    begin
      TableName      := 'OPC_PRESUPUESTOCONCEPTO';
      FieldID        := 'PC_ID';
      FieldCodigo    := 'PC_ID';
      FieldDesc      := 'PC_DESCRIPCION';
      FieldBaja      := 'PC_FECHABAJA';
      ShowBajas      := False;
      ExtraCondition := ' AND PC_SECTOR = ' + SqlValue(Sesion.Sector);
    end;

  VCLExtra.LockControl(edVersion);
end;

procedure TfrmDetallePresupuesto.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edAnio.Clear;
  edVersion.Clear;
  edMes.Clear;
  fraConcepto.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmDetallePresupuesto.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El detalle del presupuesto ya ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ya ha sido congelado.');
  Verificar(sdqConsulta.FieldByName('CODSECTOR').AsString <> Sesion.Sector, nil, 'El concepto no corresponde a su sector.');

  inherited;
end;

procedure TfrmDetallePresupuesto.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El detalle del presupuesto ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CONGELADO').IsNull, nil, 'El presupuesto ya ha sido congelado.');
  Verificar(sdqConsulta.FieldByName('CODSECTOR').AsString <> Sesion.Sector, nil, 'El concepto no corresponde a su sector.');

  inherited;
end;

procedure TfrmDetallePresupuesto.btnAceptarClick(Sender: TObject);
var
  bContinuar: Boolean;
begin
	if Validar and DoABM then
    begin
      if ModoABM = maAlta then
        begin
          bContinuar := (Sender = btnGuardarContinuar);
          DoLimpiarAlta(bContinuar);
          pbHuboCambios := True;
        end
      else
        begin
          DoRefrescarDatos;
      		fpABM.ModalResult := mrOk;
        end;
    end;
end;

procedure TfrmDetallePresupuesto.DoLimpiarAlta(Continuar: Boolean);
begin
  if not Continuar then
    begin
      fraPresupuestoAltaModif.Clear;
      fraConceptoAltaModif.Clear;

      fraPresupuestoAltaModif.edCodigo.SetFocus;
    end
  else
    edMesAltaModif.SetFocus;

  edMesAltaModif.Clear;
  edImporteAltaModif.Clear;
end;

procedure TfrmDetallePresupuesto.DoRefrescarDatos;
begin
  if sdqConsulta.Active then
    begin
      sdqConsulta.Refresh;
      CheckButtons;
    end
  else
    tbRefrescarClick(nil);
end;

procedure TfrmDetallePresupuesto.btnCancelarClick(Sender: TObject);
begin
  if pbHuboCambios then
    begin
      DoRefrescarDatos;
      fpABM.ModalResult := mrOk;
    end;
end;

end.

