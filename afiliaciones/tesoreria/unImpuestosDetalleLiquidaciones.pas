unit unImpuestosDetalleLiquidaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, DBCtrls, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, ToolEdit, CurrEdit,
  unFraCodigoDescripcion, unArt, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmImpuestosDetalleLiquidaciones = class(TfrmCustomGridABM)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    edCUITEntidad: TEdit;
    edNombreEntidad: TEdit;
    GroupBox1: TGroupBox;
    edID_IMPORTE: TCurrencyEdit;
    Label5: TLabel;
    Label4: TLabel;
    edID_OBSERVACIONES: TMemo;
    Label6: TLabel;
    edImporte: TCurrencyEdit;
    chkNoMostrarBajas: TCheckBox;
    fraConceptoBusq: TfraCodigoDescripcion;
    fraID_IDCONCEPTO: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FIDLiquidacion: TTableId;
    procedure SetIDLiquidacion(const Value: TTableId);
  public
    property IDLiquidacion: TTableId         read FIDLiquidacion         write SetIDLiquidacion;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

function GetTotalDetalleLiquidacion(IdLiquidac: TTableId; SqlModificacion: String = ''): Currency;

var
  frmImpuestosDetalleLiquidaciones: TfrmImpuestosDetalleLiquidaciones;

implementation

uses
  unGrids, CustomDlgs, unDmPrincipal, unPrincipal, unSesion, AnsiSQL, SQLFuncs,
  SDOra, StrFuncs, VCLExtra, Numeros, General;

const
  CAPTION_BASE = 'Detalle de Liquidaciones | Liquidación Nro. ';

{$R *.dfm}

procedure TfrmImpuestosDetalleLiquidaciones.ClearControls;
begin
  fraID_IDCONCEPTO.Clear;
  edID_IMPORTE.Clear;
  edID_OBSERVACIONES.Clear;
end;

procedure TfrmImpuestosDetalleLiquidaciones.LoadControls;
begin
  with sdqConsulta do
    begin
      fraID_IDCONCEPTO.Value        := FieldByName('IDCONCEPTOLIQ').AsInteger;
      edID_IMPORTE.Value            := FieldByName('IMPORTELIQ').AsCurrency;
      edID_OBSERVACIONES.Lines.Text := FieldByName('OBSERVACIONESLIQ').AsString;
    end;
end;

function TfrmImpuestosDetalleLiquidaciones.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('ID_ID',               sdqConsulta.FieldByName('IDLIQ').AsInteger);
           Fields.Add('ID_FECHABAJA',            exDateTime);
           Fields.Add('ID_USUBAJA',              Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
           if ModoABM = maAlta then
             begin
               PrimaryKey.Add('ID_ID',           GetSecNextVal('CONT.SEQ_OID_ID'));
               Fields.Add('ID_FECHAALTA',        exDateTime);
               Fields.Add('ID_USUALTA',          Sesion.UserID);

               SqlType := stInsert;
             end
           else if ModoABM = maModificacion then
             begin
               PrimaryKey.Add('ID_ID',           sdqConsulta.FieldByName('IDLIQ').AsInteger);
               Fields.Add('ID_FECHAMODIF',       exDateTime);
               Fields.Add('ID_USUMODIF',         Sesion.UserID);

               SqlType := stUpdate;
             end;

           Fields.Add('ID_IDLIQUIDACION',        IDLiquidacion);
           Fields.Add('ID_IDCONCEPTO',           fraID_IDCONCEPTO.Value);
           Fields.Add('ID_IMPORTE',              edID_IMPORTE.Value);
           Fields.Add('ID_OBSERVACIONES',        Trim(edID_OBSERVACIONES.Lines.Text));
        end;

      Result := inherited DoABM;
    end
end;

function TfrmImpuestosDetalleLiquidaciones.Validar: Boolean;
var
  dTotal: Extended;
  sSqlModificacion, sSql: String;
begin
  Verificar(fraID_IDCONCEPTO.IsEmpty, fraID_IDCONCEPTO, 'El concepto es obligatorio.');
  Verificar(edID_IMPORTE.Value = 0, edID_IMPORTE, 'El importe es obligatorio.');

  sSqlModificacion := String(Iif(ModoABM = maModificacion, ' AND ID_ID <> ' + SqlValue(sdqConsulta.FieldByName('IDLIQ').AsInteger) + ' ', ''));

  dTotal := GetTotalDetalleLiquidacion(IDLiquidacion, sSqlModificacion) + edID_IMPORTE.Value;
  Verificar(CompareFloat2(dTotal, StrToFloat(edImporte.Text)) > 0, edID_IMPORTE, 'Con este importe se supera el importe total de la liquidación original.');

  sSql := 'SELECT 1 ' +
            'FROM CONT.OIX_IMPENTIDADCONCEPTO OIXALTA, CONT.OIC_IMPCONCEPTO OICALTA, CONT.OIL_IMPLIQUIDACION, ' +
                 'CONT.OIX_IMPENTIDADCONCEPTO OIXLIQ, CONT.OIC_IMPCONCEPTO OICLIQ, CONT.OID_IMPLIQUIDACIONDETALLE ' +
           'WHERE ID_IDCONCEPTO = OICLIQ.IC_ID ' +
             'AND OIXLIQ.IX_IDCONCEPTO = OICLIQ.IC_ID ' +
             'AND ID_IDLIQUIDACION = IL_ID ' +
             'AND IL_IDENTIDAD = OIXLIQ.IX_IDENTIDAD ' +
             'AND OICALTA.IC_ID = :IdConceptoAlta ' +
             'AND OIXALTA.IX_IDCONCEPTO = OICALTA.IC_ID ' +
             'AND OIXALTA.IX_IDENTIDAD = IL_IDENTIDAD ' +
             'AND ID_FECHABAJA IS NULL ' +
             'AND OIXALTA.IX_FECHABAJA IS NULL ' +
             'AND OIXLIQ.IX_FECHABAJA IS NULL ' +
             sSqlModificacion +
             'AND (OIXALTA.IX_METODOPAGO <> OIXLIQ.IX_METODOPAGO OR UPPER(OIXALTA.IX_BENEFICIARIO) <> UPPER(OIXLIQ.IX_BENEFICIARIO)) ' +
             'AND ID_IDLIQUIDACION = :IdLiq';

  Verificar(ExisteSqlEx(sSql, [fraID_IDCONCEPTO.Value, IDLiquidacion]), fraID_IDCONCEPTO, 'El concepto que está eligiendo no tiene el mismo método de pago y beneficiario que el resto de los conceptos cargados en el detalle de las liquidaciones.');

  Result := True;
end;

procedure TfrmImpuestosDetalleLiquidaciones.RefreshData;
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT ID_ID IDLIQ, TRUNC(ID_FECHAALTA) FECHALIQ, ID_IMPORTE IMPORTELIQ, ID_OBSERVACIONES OBSERVACIONESLIQ, IC_CONCEPTO CONCEPTOLIQ, ' +
                 'TRUNC(ID_FECHAALTA) FECHAALTALIQ, ID_USUALTA USUALTALIQ, IM_DESCRIPCION IMPUESTOLIQ, IT_DESCRIPCION TIPOLIQ, ' +
                 'ID_IDCONCEPTO IDCONCEPTOLIQ, TRUNC(ID_FECHABAJA) FECHABAJALIQ, ID_USUBAJA USUBAJALIQ, ' +
                 'METPAGO.TB_DESCRIPCION DESCRMETPAGO, IX_ENDOSO ENDOSO ' +
            'FROM ART.CTB_TABLAS METPAGO, CONT.OIL_IMPLIQUIDACION, CONT.OIX_IMPENTIDADCONCEPTO, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIC_IMPCONCEPTO, ' +
                 'CONT.OID_IMPLIQUIDACIONDETALLE ' +
           'WHERE ID_IDCONCEPTO = IC_ID ' +
             'AND IC_IDIMPUESTO = IM_ID ' +
             'AND IC_IDTIPO = IT_ID ' +
             'AND IX_IDCONCEPTO = IC_ID ' +
             'AND ID_IDLIQUIDACION = IL_ID ' +
             'AND IL_IDENTIDAD = IX_IDENTIDAD ' +
             'AND METPAGO.TB_CLAVE = ''COBRO'' ' +
             'AND METPAGO.TB_CODIGO = IX_METODOPAGO ' +
             'AND IX_FECHABAJA IS NULL ' +
             'AND ID_IDLIQUIDACION = ' + SqlValue(IDLiquidacion);

  if fraConceptoBusq.IsSelected then
    sWhere := sWhere + ' AND IC_ID = ' + SqlValue(fraConceptoBusq.Value);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND ID_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmImpuestosDetalleLiquidaciones.SetIDLiquidacion(const Value: TTableId);
var
  sSql: String;
  bMostrar: Boolean;
  SqlResults: TStringList;
  IdEntidad: TTableId;
begin
  if FIDLiquidacion <> Value then
    begin
      FIDLiquidacion := Value;

      sSql := 'SELECT IL_FECHAAPROBADO, IL_NUMERO, IL_MONTO, IE_CUIT, IE_NOMBRE, IE_ID  ' +
                'FROM CONT.OIE_IMPENTIDAD, CONT.OIL_IMPLIQUIDACION ' +
               'WHERE IL_IDENTIDAD = IE_ID ' +
                 'AND IL_ID = ' + SqlValue(FIDLiquidacion);
      SqlResults := ValoresColSql(sSql);
      try
        bMostrar             := (SqlResults[0] = '');
        Caption              := CAPTION_BASE + SqlResults[1];
        edImporte.Value      := StrToFloat(SqlResults[2]);;
        edCUITEntidad.Text   := SqlResults[3];
        edNombreEntidad.Text := SqlResults[4];
        IdEntidad            := StrToInt(SqlResults[5]);
      finally
        SqlResults.Free;
      end;

      fraConceptoBusq.ExtraCondition  := fraConceptoBusq.ExtraCondition + ' AND IX_IDENTIDAD = ' + SqlValue(IdEntidad);
      fraID_IDCONCEPTO.ExtraCondition := fraConceptoBusq.ExtraCondition;

      tbNuevo.Visible     := bMostrar;
      tbModificar.Visible := bMostrar;
      tbEliminar.Visible  := bMostrar;
      ToolButton3.Visible := bMostrar;

      RefreshData;
    end;
end;

procedure TfrmImpuestosDetalleLiquidaciones.FormCreate(Sender: TObject);
begin
  inherited;

  with fraConceptoBusq do
    begin
      ShowBajas             := True;
      TableName             := 'CONT.OIC_IMPCONCEPTO';
      FieldID               := 'IC_ID';
      FieldCodigo           := 'IC_ID';
      FieldDesc             := 'IC_CONCEPTO';
      FieldBaja             := 'IC_FECHABAJA';
      ExtraFields           := ', IM_DESCRIPCION, IT_DESCRIPCION, PV_DESCRIPCION ';
      ExtraTables           := ', ART.CPV_PROVINCIAS, CONT.OIT_IMPTIPO, CONT.OIM_IMPUESTO, CONT.OIX_IMPENTIDADCONCEPTO';
      ExtraCondition        := ' AND IC_IDIMPUESTO = IM_ID AND IC_IDTIPO = IT_ID AND IX_IDCONCEPTO = IC_ID AND IC_PROVINCIA = PV_CODIGO(+) AND IT_FECHABAJA IS NULL AND IM_FECHABAJA IS NULL AND IX_FECHABAJA IS NULL';
    end;

  with fraID_IDCONCEPTO do
    begin
      ShowBajas             := False;
      TableName             := fraConceptoBusq.TableName;
      FieldID               := fraConceptoBusq.FieldID;
      FieldCodigo           := fraConceptoBusq.FieldCodigo;
      FieldDesc             := fraConceptoBusq.FieldDesc;
      FieldBaja             := fraConceptoBusq.FieldBaja;
      ExtraFields           := fraConceptoBusq.ExtraFields;
      ExtraTables           := fraConceptoBusq.ExtraTables;
      ExtraCondition        := fraConceptoBusq.ExtraCondition;
    end;

  VCLExtra.LockControls([edImporte, edCUITEntidad, edNombreEntidad]);

  SQL.TableName := 'CONT.OID_IMPLIQUIDACIONDETALLE';
  FieldBaja     := 'FECHABAJALIQ';
end;

procedure TfrmImpuestosDetalleLiquidaciones.tbLimpiarClick(Sender: TObject);
begin
  fraConceptoBusq.Clear;
  chkNoMostrarBajas.Checked := True;
  
  inherited;
end;

procedure TfrmImpuestosDetalleLiquidaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTELIQ') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTELIQ')).Currency := True;
end;

function GetTotalDetalleLiquidacion(IdLiquidac: TTableId; SqlModificacion: String = ''): Currency;
var
  sSql: String;
begin
  sSql := 'SELECT SUM(ID_IMPORTE) ' +
            'FROM CONT.OID_IMPLIQUIDACIONDETALLE ' +
           'WHERE ID_FECHABAJA IS NULL ' +
             SqlModificacion +
             'AND ID_IDLIQUIDACION = :IdLiquidac';

  Result := ValorSqlExtendedEx(sSql, [IDLiquidac]);
end;

end.

