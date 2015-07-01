unit unInvConsultarOperaciones;

interface

uses
  {$IFDEF VER150} Placemnt, ToolEdit, CurrEdit, {$ELSE} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, 
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unArt, Mask, DateComboBox;

type
  TfrmInvConsultarOperaciones = class(TfrmCustomGridABM)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbDescripcion: TGroupBox;
    edDescripcion: TEdit;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    fraOperacionAltaModif: TfraCodigoDescripcion;
    Label2: TLabel;
    edFechaAltaModif: TDateComboBox;
    Label3: TLabel;
    edResidualAltaModif: TCurrencyEdit;
    Label4: TLabel;
    edPrecioAltaModif: TCurrencyEdit;
    Label6: TLabel;
    edTasaAltaModif: TCurrencyEdit;
    Label7: TLabel;
    edNominalAltaModif: TCurrencyEdit;
    Label8: TLabel;
    edArancelAltaModif: TCurrencyEdit;
    Label5: TLabel;
    edMontoAltaModif: TCurrencyEdit;
    Label9: TLabel;
    edPorcArancelAltaModif: TCurrencyEdit;
    Label10: TLabel;
    fraPlazoLiqAltaModif: TfraCodigoDescripcion;
    edFCustodiaAltaModif: TDateComboBox;
    Label11: TLabel;
    Label12: TLabel;
    fraCuentaAltaModif: TfraCodigoDescripcion;
    Label13: TLabel;
    edImpuestosAltaModif: TCurrencyEdit;
    Label14: TLabel;
    edMontoNetoAltaModif: TCurrencyEdit;
    Label15: TLabel;
    edFraccionFondoAltaModif: TCurrencyEdit;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    Label16: TLabel;
    edPorcImpuestoAltaModif: TCurrencyEdit;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure DoCalcularImporte(Sender: TObject);
    procedure DoCalcularArancel(Sender: TObject);
    procedure DoCalcularFCustodia(Sender: TObject);
    procedure DoCalcularMontoNeto(Sender: TObject);
    procedure DoCalcularImpuesto(Sender: TObject);
    procedure fraOperacionAltaModifChange(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FIdInstrumento: TTableId;
    psMercado, psResiduales: String;
    pbLoadControls: Boolean;
    procedure SetIdInstrumento(const Value: TTableId);
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdInstrumento: TTableId   read FIdInstrumento  write SetIdInstrumento;
  end;

var
  frmInvConsultarOperaciones: TfrmInvConsultarOperaciones;
var
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 7;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('PRECIO', 'MONTO', 'NOMINAL', 'RESIDUAL', 'ARANCEL', 'IMPUESTOS', 'MONTONETO', 'FRACCIONINTEGRADA');

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, unInversiones, unComunes;

procedure TfrmInvConsultarOperaciones.ClearControls;
begin
  fraOperacionAltaModif.Clear;
  edFechaAltaModif.Clear;
  edNominalAltaModif.Clear;
  edResidualAltaModif.Clear;

  if fraTipoInstrumento.Value = 22 then    // 22: FCI
    edPrecioAltaModif.Value := Get_CotizacionInstrumento(FIdInstrumento, DBDateTime())
  else
    edPrecioAltaModif.Clear;

  edTasaAltaModif.Clear;
  edArancelAltaModif.Clear;
  edMontoAltaModif.Clear;
  edImpuestosAltaModif.Clear;

  if psMercado = 'S' then
    begin
      edPorcArancelAltaModif.Value  := StrToFloatDef(Get_CTBEspecial1('IVDEF', 'PA'), 0);
      edPorcImpuestoAltaModif.Value := StrToFloatDef(Get_CTBEspecial1('IVDEF', 'PI'), 0);
    end
  else
    begin
      edPorcArancelAltaModif.Clear;
      edPorcImpuestoAltaModif.Clear;
    end;

  edFraccionFondoAltaModif.Clear;
  fraCuentaAltaModif.Value   := Get_IdDefaultCuentaBancaria();
  fraPlazoLiqAltaModif.Value := Get_IdDefaultPlazoLiquidacion(IdInstrumento);
  edFCustodiaAltaModif.Clear;
end;

function TfrmInvConsultarOperaciones.DoABM: Boolean;
begin
  BeginTrans;
  try
    with Sql do
      begin
        Clear;

        if (ModoABM = maAlta) or (ModoABM = maModificacion) then
          begin
            if ModoABM = maAlta then
              begin
                SqlType := stInsert;

                PrimaryKey.Add('OI_ID',           GetSecNextVal('INV.SEQ_NOI_ID'));
                Fields.Add('OI_FECHAALTA',        exDateTime);
                Fields.Add('OI_USUALTA',          Sesion.UserID);
              end
            else
              begin
                SqlType := stUpdate;

                PrimaryKey.Add('OI_ID',           sdqConsulta.FieldByName('ID').AsInteger);
                Fields.Add('OI_FECHAMODIF',       exDateTime);
                Fields.Add('OI_USUMODIF',         Sesion.UserID);
              end;

            Fields.Add('OI_IDINSTRUMENTO',        FIdInstrumento);
            Fields.Add('OI_IDTIPOOPERACION',      fraOperacionAltaModif.Value);
            Fields.Add('OI_FECHA',                edFechaAltaModif.Date);
            Fields.Add('OI_IMPORTERESIDUAL',      edResidualAltaModif.Value);
            Fields.Add('OI_IMPORTENOMINAL',       edNominalAltaModif.Value);
            Fields.Add('OI_MONTO',                edMontoAltaModif.Value);
            Fields.Add('OI_PRECIO',               edPrecioAltaModif.Value);
            Fields.Add('OI_TASA',                 edTasaAltaModif.Value);
            Fields.Add('OI_ARANCEL',              edArancelAltaModif.Value);
            Fields.Add('OI_IMPUESTOS',            edImpuestosAltaModif.Value);
            Fields.Add('OI_PORCARANCEL',          edPorcArancelAltaModif.Value);
            Fields.Add('OI_PORCIMPUESTO',         edPorcImpuestoAltaModif.Value);
            Fields.Add('OI_IDCUENTABANCARIA',     fraCuentaAltaModif.Value, True);
            Fields.Add('OI_PLAZOLIQUIDACION',     fraPlazoLiqAltaModif.Value, True);

            if edFCustodiaAltaModif.IsEmpty then
              Fields.Add('OI_FECHACUSTODIA',      exNull)
            else
              Fields.Add('OI_FECHACUSTODIA',      edFCustodiaAltaModif.Date);

            Fields.Add('OI_FRACCIONINTEGRADA',    edFraccionFondoAltaModif.Value);
          end
        else if ModoABM = maBaja then
          begin
            PrimaryKey.Add('OI_ID',               sdqConsulta.FieldByName('ID').AsInteger);
            Fields.Add('OI_FECHABAJA',            exDateTime);
            Fields.Add('OI_USUBAJA',              Sesion.UserID);

            SqlType := stUpdate;
          end
      end;

    Result := inherited DoABM;

    CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        Raise Exception.Create(E.Message + CRLF + 'Error al grabar la operación.');
      end;
  end;
end;

procedure TfrmInvConsultarOperaciones.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT TO_DESCRIPCION OPERACION, OI_FECHA FECHA, OI_IMPORTENOMINAL NOMINAL, ' +
                 'OI_IMPORTERESIDUAL RESIDUAL, OI_PRECIO PRECIO, OI_TASA TASA, ' +
                 'OI_ARANCEL ARANCEL, OI_MONTO MONTO, OI_PORCARANCEL PORC_ARANCEL, ' +
                 'OI_FECHABAJA FECHA_BAJA, OI_ID ID, BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, ' +
                 'RCB.CB_DESCRIPCION PLAZO_LIQUIDACION, OI_FECHACUSTODIA FECHA_CUSTODIA, ' +
                 'OI_IMPUESTOS IMPUESTOS, OI_FRACCIONINTEGRADA FRACCIONINTEGRADA, ' +
                 'NVL(OI_MONTO, 0) + TO_SIGNO * (NVL(OI_ARANCEL, 0) + NVL(OI_IMPUESTOS, 0)) MONTONETO, ' +
                 'OI_FECHACONTABLE FECHACONTABLE, OI_PORCIMPUESTO PORC_IMPUESTO, ' +
                 'OI_IDTIPOOPERACION IDTIPOOPERACION, OI_IDCUENTABANCARIA IDCUENTABANCARIA, ' +
                 'OI_PLAZOLIQUIDACION PLAZOLIQUIDACION, OI_CONTABILIZADO CONTABILIZADO ' +
            'FROM RCB_CLEARINGBANCARIO RCB, ZBA_BANCO, ZCB_CUENTABANCARIA ZCB, ' +
                 'NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO ' +
           'WHERE TO_ID = OI_IDTIPOOPERACION ' +
             'AND BA_ID(+) = CB_IDBANCO ' +
             'AND ZCB.CB_ID(+) = OI_IDCUENTABANCARIA ' +
             'AND RCB.CB_ID(+) = OI_PLAZOLIQUIDACION ' +
             'AND OI_IDINSTRUMENTO = :Instrumento';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND OI_FECHABAJA IS NULL';

  sdqConsulta.ParamByName('Instrumento').AsInteger := FIdInstrumento;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
  CalcTotales;
end;

procedure TfrmInvConsultarOperaciones.SetIdInstrumento(const Value: TTableId);
var
  sSql: String;
  SqlResults: TStringList;
begin
  if FIdInstrumento <> Value then
    begin
      FIdInstrumento := Value;

      sSql := 'SELECT IN_IDTIPOINSTRUMENTO, IN_DESCRIPCION, TI_RESIDUALES, IN_MERCADO ' +
                'FROM NIN_INSTRUMENTO, NTI_TIPOINSTRUMENTO ' +
               'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                 'AND IN_ID = ' + SqlValue(FIdInstrumento);

      SqlResults := ValoresColSql(sSql);
      try
        fraTipoInstrumento.Value := StrToInt(SqlResults[0]);
        edDescripcion.Text       := SqlResults[1];
        psResiduales             := SqlResults[2];
        psMercado                := SqlResults[3];
      finally
        SqlResults.Free;
      end;

      RefreshData;
    end;
end;

procedure TfrmInvConsultarOperaciones.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'La operación se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('CONTABILIZADO').IsNull, nil, 'La operación se encuentra confirmada.');
  inherited;
end;

procedure TfrmInvConsultarOperaciones.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

function TfrmInvConsultarOperaciones.Validar: Boolean;
begin
  Verificar(fraOperacionAltaModif.IsEmpty, fraOperacionAltaModif, 'La operación es obligatoria.');
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'La fecha es obligatoria.');
  Verificar(edNominalAltaModif.Value <= 0, edNominalAltaModif, 'El importe nominal debe ser mayor a 0.');
  Verificar(edResidualAltaModif.Value <= 0, edResidualAltaModif, 'El importe residual debe ser mayor a 0.');

  Result := True;
end;

procedure TfrmInvConsultarOperaciones.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraOperacionAltaModif do
    begin
      TableName   := 'NTO_TIPOOPERACION';
      FieldID     := 'TO_ID';
      FieldCodigo := 'TO_ID';
      FieldDesc   := 'TO_DESCRIPCION';
      FieldBaja   := 'TO_FECHABAJA';
      ExtraFields := ', TO_SIGNO ';
      ShowBajas   := False;
      OnChange    := fraOperacionAltaModifChange;
    end;

    with fraPlazoLiqAltaModif do
    begin
      TableName   := 'RCB_CLEARINGBANCARIO';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_DESCRIPCION';
      FieldBaja   := 'CB_FECHABAJA';
      ExtraFields := ', CB_DIAS ';
      ShowBajas   := False;
      OnChange    := DoCalcularFCustodia;
    end;

  with fraCuentaAltaModif do
    begin
      TableName      := 'ZCB_CUENTABANCARIA';
      FieldID        := 'CB_ID';
      FieldCodigo    := 'CB_ID';
      FieldDesc      := 'CB_NUMERO || '' - '' || BA_NOMBRE';
      FieldBaja      := 'CB_FECHABAJA';
      ExtraTables    := ', ZBA_BANCO';
      ExtraCondition := 'AND BA_ID = CB_IDBANCO AND CB_INVERSIONES <> ''N'' AND BA_FECHABAJA IS NULL';
      ShowBajas      := False;
    end;

  VCLExtra.LockControls([fraTipoInstrumento, edDescripcion, edMontoAltaModif, edMontoNetoAltaModif]);

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NOI_OPERACIONINSTRUMENTO';
end;

procedure TfrmInvConsultarOperaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('PRECIO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('PRECIO')).DisplayFormat := '$ #,##0.0000000000;-$ #,##0.0000000000';

  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('MONTO')).Currency := True;

  if sdqConsulta.FieldByName('TASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA')).DisplayFormat := '% #,##0.000000;-% #,##0.000000';

  if sdqConsulta.FieldByName('NOMINAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('NOMINAL')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('RESIDUAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('RESIDUAL')).DisplayFormat := '$ #,##0.0000000000;-$ #,##0.0000000000';

  if sdqConsulta.FieldByName('ARANCEL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('ARANCEL')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('PORC_ARANCEL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORC_ARANCEL')).DisplayFormat := '% #,##0.000000;-% #,##0.000000';

  if sdqConsulta.FieldByName('PORC_IMPUESTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORC_IMPUESTO')).DisplayFormat := '% #,##0.000000;-% #,##0.000000';

  if sdqConsulta.FieldByName('IMPUESTOS') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('IMPUESTOS')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('MONTONETO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('MONTONETO')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('FRACCIONINTEGRADA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('FRACCIONINTEGRADA')).Currency := True;
end;

procedure TfrmInvConsultarOperaciones.DoCalcularImporte(Sender: TObject);
begin
  if not pbLoadControls then
    if psResiduales = 'S' then
      edMontoAltaModif.Value := (edResidualAltaModif.Value * edPrecioAltaModif.Value) + edFraccionFondoAltaModif.Value
    else
      edMontoAltaModif.Value := (edNominalAltaModif.Value * edPrecioAltaModif.Value) + edFraccionFondoAltaModif.Value;

  if Sender = edResidualAltaModif then
    begin
      DoCalcularArancel(Sender);
      DoCalcularImpuesto(Sender);
    end;

  if Sender = edMontoAltaModif then
    DoCalcularMontoNeto(Sender);
end;

procedure TfrmInvConsultarOperaciones.DoCalcularImpuesto(Sender: TObject);
begin
  if not pbLoadControls then
    if (edMontoAltaModif.Value > 0) and (edPorcImpuestoAltaModif.Value > 0) then
      edImpuestosAltaModif.Value := edMontoAltaModif.Value * edPorcImpuestoAltaModif.Value / 100
    else
      edImpuestosAltaModif.Clear;
end;

procedure TfrmInvConsultarOperaciones.DoCalcularArancel(Sender: TObject);
begin
  if not pbLoadControls then
    if (edMontoAltaModif.Value > 0) and (edPorcArancelAltaModif.Value > 0) then
      edArancelAltaModif.Value := edMontoAltaModif.Value * edPorcArancelAltaModif.Value / 100
    else
      edArancelAltaModif.Clear;
end;

procedure TfrmInvConsultarOperaciones.DoCalcularFCustodia(Sender: TObject);
begin
  if not pbLoadControls then
    if not edFechaAltaModif.IsEmpty and fraPlazoLiqAltaModif.IsSelected then
      edFCustodiaAltaModif.Date := CalcDiasHabiles(edFechaAltaModif.Date, fraPlazoLiqAltaModif.sdqDatos.FieldByName('CB_DIAS').AsInteger)
    else
      edFCustodiaAltaModif.Clear;
end;

procedure TfrmInvConsultarOperaciones.DoCalcularMontoNeto(Sender: TObject);
begin
  if fraOperacionAltaModif.IsSelected then
    edMontoNetoAltaModif.Value := edMontoAltaModif.Value + fraOperacionAltaModif.sdqDatos.FieldByName('TO_SIGNO').AsInteger * (edArancelAltaModif.Value + edImpuestosAltaModif.Value)
  else
    edMontoNetoAltaModif.Value := edMontoAltaModif.Value;
end;

procedure TfrmInvConsultarOperaciones.LoadControls;
begin
  pbLoadControls := True;
  try
    with sdqConsulta do
      begin
        fraOperacionAltaModif.Value     := FieldByName('IDTIPOOPERACION').AsInteger;
        edFechaAltaModif.Date           := FieldByName('FECHA').AsDateTime;
        edNominalAltaModif.Value        := FieldByName('NOMINAL').AsFloat;
        edResidualAltaModif.Value       := FieldByName('RESIDUAL').AsFloat;
        edPrecioAltaModif.Value         := FieldByName('PRECIO').AsFloat;
        edTasaAltaModif.Value           := FieldByName('TASA').AsFloat;
        edArancelAltaModif.Value        := FieldByName('ARANCEL').AsFloat;
        edMontoAltaModif.Value          := FieldByName('MONTO').AsFloat;
        edImpuestosAltaModif.Value      := FieldByName('IMPUESTOS').AsFloat;
        edPorcArancelAltaModif.Value    := FieldByName('PORC_ARANCEL').AsFloat;
        edPorcImpuestoAltaModif.Value   := FieldByName('PORC_IMPUESTO').AsFloat;
        edFraccionFondoAltaModif.Value  := FieldByName('FRACCIONINTEGRADA').AsFloat;
        fraCuentaAltaModif.Value        := FieldByName('IDCUENTABANCARIA').AsInteger;
        fraPlazoLiqAltaModif.Value      := FieldByName('PLAZOLIQUIDACION').AsInteger;
        edFCustodiaAltaModif.Date       := FieldByName('FECHA_CUSTODIA').AsDateTime;
      end;
  finally
    pbLoadControls := False;
  end;
end;

procedure TfrmInvConsultarOperaciones.fraOperacionAltaModifChange(Sender: TObject);
begin
  DoCalcularMontoNeto(Sender);

  if fraOperacionAltaModif.IsSelected then
    begin
      if fraTipoInstrumento.Value = 22 then    // 22: FCI
        begin
          if fraOperacionAltaModif.sdqDatos.FieldByName('TO_SIGNO').AsInteger = 1 then
            fraPlazoLiqAltaModif.Value := 1   // Compras
          else
            fraPlazoLiqAltaModif.Value := Get_IdDefaultPlazoLiquidacion(IdInstrumento);
        end;
    end;
end;

procedure TfrmInvConsultarOperaciones.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if AreIn(CAMPOS_SUMA[iPos], ['PRECIO', 'RESIDUAL']) then
        iCantDec := 10
      else if AreIn(CAMPOS_SUMA[iPos], ['NOMINAL', 'ARANCEL', 'IMPUESTOS', 'MONTONETO']) then
        iCantDec := 6
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec);
    end;
end;

procedure TfrmInvConsultarOperaciones.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmInvConsultarOperaciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'La operación se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('CONTABILIZADO').IsNull, nil, 'La operación se encuentra confirmada.');

  inherited;
end;

end.

