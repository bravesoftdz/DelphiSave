unit unInvConsultarCotizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, CurrEdit, RxCurrEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmInvConsultarCotizaciones = class(TfrmCustomGridABM)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbDenominacion: TGroupBox;
    fraDenominacion: TfraCodigoDescripcion;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    gbVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    fraTipoInstrAltaModif: TfraCodigoDescripcion;
    fraDenominacionAltaModif: TfraCodigoDescripcion;
    edFechaAltaModif: TDateComboBox;
    Label2: TLabel;
    edImporteAltaModif: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ShortCutControl1: TShortCutControl;
    gbTasaReferencia: TGroupBox;
    fraTasaRef: TfraCodigoDescripcion;
    gbMoneda: TGroupBox;
    fraMoneda: TfraCodigoDescripcion;
    fraMonedaAltaModif: TfraCodigoDescripcion;
    fraTasaRefAltaModif: TfraCodigoDescripcion;
    Label6: TLabel;
    Label7: TLabel;
    rgTipoCotizacion: TRadioGroup;
    Label8: TLabel;
    edTasaAltaModif: TCurrencyEdit;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    tbSumatoria: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure rgTipoCotizacionClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    procedure fraTipoInstrAltaModifChange(Sender: TObject);
    procedure CalcTotales;
  public
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmInvConsultarCotizaciones: TfrmInvConsultarCotizaciones;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('IMPORTE');

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, DateTimeFuncs, unArt;

procedure TfrmInvConsultarCotizaciones.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT CO_ID ID, TI_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, ' +
                 'IN_DESCRIPCION DENOMINACION, CO_FECHA FECHA, CO_IMPORTE IMPORTE, ' +
                 'CO_TASA TASA, MO_NOMBRE MONEDA, TR_NOMBRE TASA_REFERENCIA, CO_FECHABAJA FECHA_BAJA ' +
            'FROM NMO_MONEDA, NTR_TASAREFERENCIA, NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO, NCO_COTIZACION ' +
           'WHERE TI_ID(+) = IN_IDTIPOINSTRUMENTO ' +
             'AND IN_ID(+) = CO_IDINSTRUMENTO ' +
             'AND CO_IDTASAREFERENCIA = TR_ID(+) ' +
             'AND CO_IDMONEDA = MO_ID(+) ' +
             'AND IN_FECHABAJA IS NULL';

  sWhere := SqlBetweenDateTime(' AND CO_FECHA', edFechaDesde.Date, edFechaHasta.Date);

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND TI_ID = ' + SqlValue(fraTipoInstrumento.Value);

  if fraDenominacion.IsSelected then
    sWhere := sWhere + ' AND CO_IDINSTRUMENTO = ' + SqlValue(fraDenominacion.Value);

  if fraTasaRef.IsSelected then
    sWhere := sWhere + ' AND CO_IDTASAREFERENCIA = ' + SqlValue(fraTasaRef.Value);

  if fraMoneda.IsSelected then
    sWhere := sWhere + ' AND CO_IDMONEDA = ' + SqlValue(fraMoneda.Value);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND CO_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;
  inherited;
  CalcTotales;
end;

procedure TfrmInvConsultarCotizaciones.ClearControls;
begin
  rgTipoCotizacion.ItemIndex := -1;
  rgTipoCotizacionClick(nil);
  fraTipoInstrAltaModif.Clear;
  fraDenominacionAltaModif.Clear;
  fraMonedaAltaModif.Clear;
  fraTasaRefAltaModif.Clear;
  edFechaAltaModif.Clear;
  edImporteAltaModif.Clear;
  edTasaAltaModif.Clear;
end;

function TfrmInvConsultarCotizaciones.DoABM: Boolean;
var
  sSql: String;
begin
  BeginTrans;
  try
    with Sql do
      begin
        Clear;

        if ModoABM = maAlta then
          begin
            PrimaryKey.Add('CO_ID',             GetSecNextVal('INV.SEQ_NCO_ID'));
            Fields.Add('CO_FECHAALTA',          exDateTime);
            Fields.Add('CO_USUALTA',            Sesion.UserID);

            Fields.Add('CO_IDINSTRUMENTO',      fraDenominacionAltaModif.Value, True);
            Fields.Add('CO_IDMONEDA',           fraMonedaAltaModif.Value, True);
            Fields.Add('CO_IDTASAREFERENCIA',   fraTasaRefAltaModif.Value, True);
            Fields.Add('CO_FECHA',              edFechaAltaModif.Date);
            Fields.Add('CO_IMPORTE',            edImporteAltaModif.Value, 10, True);
            Fields.Add('CO_TASA',               edTasaAltaModif.Value, 6, True);

            SqlType := stInsert;
          end
        else if ModoABM = maBaja then
          begin
            PrimaryKey.Add('CO_ID',             sdqConsulta.FieldByName('ID').AsInteger);
            Fields.Add('CO_FECHABAJA',          exDateTime);
            Fields.Add('CO_USUBAJA',            Sesion.UserID);

            SqlType := stUpdate;
          end
      end;

    Result := inherited DoABM;

    if (ModoABM = maAlta) and ((rgTipoCotizacion.ItemIndex = 1) or (rgTipoCotizacion.ItemIndex = 2)) then   // Moneda o Tasa de Referencia
      begin
         sSql := 'ART.INVERSION.Do_ActualizarInteresCupon(:IdTasa, :IdMoneda, :Fecha, :Usuario);';
         EjecutarStoreSTEx(sSql, [Iif(fraTasaRefAltaModif.Value = ART_EMPTY_ID, '', fraTasaRefAltaModif.Value), Iif(fraMonedaAltaModif.Value = ART_EMPTY_ID, '', fraMonedaAltaModif.Value), TDateTimeEx.Create(edFechaAltaModif.Date), Sesion.UserID]);
      end;

    CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        Raise Exception.Create(E.Message + CRLF + 'Error al grabar la cotización.');
      end;
  end;
end;

function TfrmInvConsultarCotizaciones.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(rgTipoCotizacion.ItemIndex = -1, rgTipoCotizacion, 'Debe indicar el tipo.');
  Verificar((rgTipoCotizacion.ItemIndex = 0) and fraTipoInstrAltaModif.IsEmpty, fraTipoInstrAltaModif, 'El tipo de instrumento es obligatorio.');
  Verificar((rgTipoCotizacion.ItemIndex = 0) and fraDenominacionAltaModif.IsEmpty, fraDenominacionAltaModif, 'La denominación es obligatoria.');
  Verificar((rgTipoCotizacion.ItemIndex = 1) and fraMonedaAltaModif.IsEmpty, fraMonedaAltaModif, 'La moneda es obligatoria.');
  Verificar((rgTipoCotizacion.ItemIndex = 2) and fraTasaRefAltaModif.IsEmpty, fraTasaRefAltaModif, 'La tasa de referencia es obligatoria.');
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'La fecha es obligatoria.');
  Verificar(edFechaAltaModif.Date > DBDate(), edFechaAltaModif, 'La fecha no puede ser mayor a la fecha actual.');

  if rgTipoCotizacion.ItemIndex = 2 then     // tasa de referencia
    Verificar(edTasaAltaModif.Value = 0, edTasaAltaModif, 'La tasa es obligatoria.')
  else
    Verificar(edImporteAltaModif.Value = 0, edImporteAltaModif, 'El importe es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM NCO_COTIZACION ' +
           'WHERE CO_FECHABAJA IS NULL ' +
             'AND CO_FECHA = :Fecha ' +
             'AND (CO_IDINSTRUMENTO = :Instrumento OR ' +
                  'CO_IDTASAREFERENCIA = :Tasa OR ' +
                  'CO_IDMONEDA = :Moneda)';
  Verificar(ExisteSqlEx(sSql, [TDateTimeEx.Create(edFechaAltaModif.Date), fraDenominacionAltaModif.Value, fraTasaRefAltaModif.Value, fraMonedaAltaModif.Value]), edFechaAltaModif, 'Ya existe una cotización para esta fecha.');

  Result := True;
end;

procedure TfrmInvConsultarCotizaciones.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NCO_COTIZACION';
  ShowActived   := False;

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

  with fraDenominacion do
    begin
      TableName   := 'NIN_INSTRUMENTO';
      FieldID     := 'IN_ID';
      FieldCodigo := 'IN_ID';
      FieldDesc   := 'IN_DESCRIPCION';
      FieldBaja   := 'IN_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraTasaRef do
    begin
      TableName   := 'NTR_TASAREFERENCIA';
      FieldID     := 'TR_ID';
      FieldCodigo := 'TR_ID';
      FieldDesc   := 'TR_NOMBRE';
      FieldBaja   := 'TR_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraMoneda do
    begin
      TableName   := 'NMO_MONEDA';
      FieldID     := 'MO_ID';
      FieldCodigo := 'MO_ID';
      FieldDesc   := 'MO_NOMBRE';
      FieldBaja   := 'MO_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraTipoInstrAltaModif do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := False;
      OnChange    := fraTipoInstrAltaModifChange;
    end;

  with fraDenominacionAltaModif do
    begin
      TableName   := 'NIN_INSTRUMENTO';
      FieldID     := 'IN_ID';
      FieldCodigo := 'IN_ID';
      FieldDesc   := 'IN_DESCRIPCION';
      FieldBaja   := 'IN_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraTasaRefAltaModif do
    begin
      TableName   := 'NTR_TASAREFERENCIA';
      FieldID     := 'TR_ID';
      FieldCodigo := 'TR_ID';
      FieldDesc   := 'TR_NOMBRE';
      FieldBaja   := 'TR_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraMonedaAltaModif do
    begin
      TableName   := 'NMO_MONEDA';
      FieldID     := 'MO_ID';
      FieldCodigo := 'MO_ID';
      FieldDesc   := 'MO_NOMBRE';
      FieldBaja   := 'MO_FECHABAJA';
      ShowBajas   := False;
    end;
end;

procedure TfrmInvConsultarCotizaciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraDenominacion.Clear;
  fraTipoInstrumento.Clear;
  fraTasaRef.Clear;
  fraMoneda.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvConsultarCotizaciones.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmInvConsultarCotizaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin    
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('TASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA')).DisplayFormat := '% #,##0.000000;-% #,##0.000000';
end;

procedure TfrmInvConsultarCotizaciones.fraTipoInstrAltaModifChange(Sender: TObject);
begin
  with fraDenominacionAltaModif do
    begin
      Clear;

      if fraTipoInstrAltaModif.IsSelected then
        ExtraCondition := ' AND IN_IDTIPOINSTRUMENTO = ' + SqlValue(fraTipoInstrAltaModif.Value)
      else
        ExtraCondition := ' AND 1 = 2';
    end;
end;

procedure TfrmInvConsultarCotizaciones.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if CAMPOS_SUMA[iPos] = 'IMPORTE' then
        iCantDec := 6
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec);
    end;
end;

procedure TfrmInvConsultarCotizaciones.rgTipoCotizacionClick(Sender: TObject);
var
  bTipoIntr, bMoneda, bTasaRef: Boolean;
begin
  bTipoIntr := False;
  bMoneda   := False;
  bTasaRef  := False;

  case rgTipoCotizacion.ItemIndex of
    0: bTipoIntr := True;
    1: bMoneda   := True;
    2: bTasaRef  := True;
  end;

  VCLExtra.LockControls([fraDenominacionAltaModif, fraTipoInstrAltaModif], not bTipoIntr);
  VCLExtra.LockControl(fraMonedaAltaModif, not bMoneda);
  VCLExtra.LockControl(fraTasaRefAltaModif, not bTasaRef);
  VCLExtra.LockControl(edImporteAltaModif, bTasaRef);
  VCLExtra.LockControl(edTasaAltaModif, not bTasaRef);

  if not bTipoIntr then
    begin
      fraDenominacionAltaModif.Clear;
      fraTipoInstrAltaModif.Clear;
    end;

  if not bMoneda then
    fraMonedaAltaModif.Clear;

  if not bTasaRef then
    fraTasaRefAltaModif.Clear;

  if bTasaRef then
    edImporteAltaModif.Clear
  else
    edTasaAltaModif.Clear;
end;

procedure TfrmInvConsultarCotizaciones.CalcTotales;
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

end.

