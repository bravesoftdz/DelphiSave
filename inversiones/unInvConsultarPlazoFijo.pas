unit unInvConsultarPlazoFijo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, CurrEdit, Menus,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmInvConsultarPlazoFijo = class(TfrmCustomGridABM)
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    gbInstit: TGroupBox;
    fraInstitucion: TfraCodigoDescripcion;
    gbVencimiento: TGroupBox;
    edFechaVencimDesde: TDateComboBox;
    GroupBox1: TGroupBox;
    edDiasVencerDesde: TCurrencyEdit;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbCancelar: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    edFechaVencimHasta: TDateComboBox;
    Label2: TLabel;
    edDiasVencerHasta: TCurrencyEdit;
    mnuAltaPlazoFijo: TPopupMenu;
    mnuAltaPlFijoConst: TMenuItem;
    mnuAltaPlFijoRenov: TMenuItem;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edFechaConstDesde: TDateComboBox;
    edFechaConstHasta: TDateComboBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edFechaCancelDesde: TDateComboBox;
    edFechaCancelHasta: TDateComboBox;
    rgEnCartera: TRadioGroup;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    GroupBox4: TGroupBox;
    edFecha: TDateComboBox;
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    Label5: TLabel;
    edCodCajaValAltaModif: TEdit;
    ToolButton1: TToolButton;
    tbExportarSSN: TToolButton;
    chkEnCustodiaAltaModif: TCheckBox;
    rgCodCajaValores: TRadioGroup;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpSolicitudCustodia: TMenuItem;
    mnuImpSolicitudCustodiaEntr: TMenuItem;
    mnuImpSolicitudCustodiaRet: TMenuItem;
    rgEnCustodia: TRadioGroup;
    fpFechas: TFormPanel;
    Bevel1: TBevel;
    btnAceptarFechas: TButton;
    btnCancelarFechas: TButton;
    gbFechas: TGroupBox;
    Label6: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbCancelarClick(Sender: TObject);
    procedure DoAltaNuevoPlazoFijo(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbExportarSSNClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure DoImprimirSolicCustodia(Sender: TObject);
    procedure btnAceptarFechasClick(Sender: TObject);
  private
    procedure CalcTotales;
    function DoCancelarPlazosFijosSel(EnTrans: Boolean): Boolean;
    function ValidarPlazosFijos: Boolean;
    procedure DoCancelarPlazosFijos(EnTrans: Boolean);
  public
  protected
    procedure RefreshData; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmInvConsultarPlazoFijo: TfrmInvConsultarPlazoFijo;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 7;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('CAPITAL', 'INTERES', 'IMPUESTO', 'MONTO', 'RENDIMIENTO', 'DEVENGADO', 'INTERES_DEVENGADO', 'CAPITALACT');

implementation              

{$R *.dfm}
                       
uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, unInvConsultarInstrumentos, DateTimeFuncs, unArt, unInversiones,
  unImpoExpoWizard, unInvRptSolicitudCustodia;

procedure TfrmInvConsultarPlazoFijo.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);

  with fraInstitucion do
    begin
      TableName   := 'NNS_INSTITUCION ';
      FieldID     := 'NS_ID';
      FieldCodigo := 'NS_ID';
      FieldDesc   := 'NS_NOMBRE';
      FieldBaja   := 'NS_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraTipoInstrumento do
    begin
      TableName      := 'NTI_TIPOINSTRUMENTO';
      FieldID        := 'TI_ID';
      FieldCodigo    := 'TI_ID';
      FieldDesc      := 'TI_DESCRIPCION';
      FieldBaja      := 'TI_FECHABAJA';
      ShowBajas      := True;
      ExtraCondition := 'AND TI_PLAZOFIJO = ''S''';
    end;

  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'NIN_INSTRUMENTO';

  edFecha.Date := DBDate();

  ShowActived := False;
end;

procedure TfrmInvConsultarPlazoFijo.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraInstitucion.Clear;
  fraTipoInstrumento.Clear;
  edFechaVencimDesde.Clear;
  edFechaVencimHasta.Clear;
  edDiasVencerDesde.Clear;
  edDiasVencerHasta.Clear;
  edFechaConstDesde.Clear;
  edFechaConstHasta.Clear;
  edFechaCancelDesde.Clear;
  edFechaCancelHasta.Clear;
  rgEnCartera.ItemIndex      := 2;   // Todos
  rgCodCajaValores.ItemIndex := 2;   // Todos
  rgEnCustodia.ItemIndex     := 2;   // Todos
end;

procedure TfrmInvConsultarPlazoFijo.RefreshData;
var
  sSql, sWhere: String;
begin
  Verificar(edFecha.IsEmpty, edFecha, 'Debe indicar la fecha.');

  sSql := 'SELECT CERTIFICADO, CONSTITUCION, INSTITUCION, CAPITAL, TASA, PLAZO, VENCIMIENTO, ' +
                 'ROUND(CAPITAL*TASA/100*PLAZO/365, 2) INTERES, IMPUESTO, ENCUSTODIA, ' +
                 'CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO MONTO, EN_CUSTODIA, ' +
                 'DECODE(CAPITAL, 0, 0, ROUND((((CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO)/CAPITAL)-1)*100, 2)) RENDIMIENTO, ' +
                 'CASE ' +
                   'WHEN VENCIMIENTO <= :Fecha THEN CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO ' +
                   'ELSE DECODE(CAPITAL, 0, 0, ROUND(CAPITAL*(((CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO)/CAPITAL)-1)*(:Fecha - CONSTITUCION)/PLAZO+CAPITAL, 2)) ' +
                 'END DEVENGADO, ' +
                 'CASE ' +
                   'WHEN VENCIMIENTO <= :Fecha THEN ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO ' +
                   'ELSE DECODE(CAPITAL, 0, 0, ROUND(CAPITAL*(((CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO)/CAPITAL)-1)*(:Fecha - CONSTITUCION)/PLAZO+CAPITAL, 2)-CAPITAL) ' +
                 'END INTERES_DEVENGADO, ' +
                 'DIAS_A_VENCER, IDINSTITUCION, IDINSTRUMENTO, PRECANCELABLE, CAPITALACT, IDTIPOINSTRUMENTO, TIPOINSTRUMENTO, FECHA_CANCELACION, FECHABAJA, GARANTIA ' +
            'FROM (SELECT TI_ID IDTIPOINSTRUMENTO, TI_DESCRIPCION TIPOINSTRUMENTO, IN_CODCAJAVALORES CERTIFICADO, IN_CONSTITUCION CONSTITUCION, NS_NOMBRE INSTITUCION, ' +
                         'ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPITAL, IN_TASA TASA, IN_PLAZO PLAZO, IN_ENCUSTODIA EN_CUSTODIA, ' +
                         'ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID) CAPITALACT, NVL(IN_ENCUSTODIA, ''N'') ENCUSTODIA, ' +
                         'IN_VENCIMIENTO VENCIMIENTO, 0 IMPUESTO, NS_ID IDINSTITUCION, GREATEST(IN_VENCIMIENTO - :Fecha, 0) DIAS_A_VENCER, ' +
                         'IN_ID IDINSTRUMENTO, IN_PRECANCELABLE PRECANCELABLE, IN_FECHABAJA FECHABAJA, GTIA.TB_DESCRIPCION GARANTIA, ' +
                         '(SELECT MAX(OI_FECHA) ' +
                            'FROM NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO ' +
                           'WHERE OI_FECHABAJA IS NULL ' +
                             'AND OI_IDINSTRUMENTO = IN_ID ' +
                             'AND TO_ID = OI_IDTIPOOPERACION ' +
                             'AND TO_FECHABAJA IS NULL ' +
                             'AND TO_PLAZOFIJO = ''S'' ' +
                             'AND TO_SIGNO = -1) FECHA_CANCELACION ' +
                    'FROM CTB_TABLAS GTIA, NTI_TIPOINSTRUMENTO, NNS_INSTITUCION, NIN_INSTRUMENTO ' +
                   'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                     'AND NS_ID = IN_IDINSTITUCION ' +
                     'AND TI_PLAZOFIJO = ''S'' ' +
                     'AND GTIA.TB_CLAVE(+) = ''IGTIA'' ' +
                     'AND GTIA.TB_CODIGO(+) = IN_GARANTIA) ' +
           'WHERE 1 = 1';

  sWhere := SqlBetweenDateTime(' AND VENCIMIENTO', edFechaVencimDesde.Date, edFechaVencimHasta.Date) +
            SqlBetweenDateTime(' AND CONSTITUCION', edFechaConstDesde.Date, edFechaConstHasta.Date) +
            SqlBetweenDateTime(' AND FECHA_CANCELACION', edFechaCancelDesde.Date, edFechaCancelHasta.Date) +
            SqlBetween(' AND DIAS_A_VENCER', edDiasVencerDesde.Value, edDiasVencerHasta.Value);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FECHABAJA IS NULL';

  if fraInstitucion.IsSelected then
    sWhere := sWhere + ' AND IDINSTITUCION = ' + SqlValue(fraInstitucion.Value);

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND IDTIPOINSTRUMENTO = ' + SqlValue(fraTipoInstrumento.Value);

  case rgEnCartera.ItemIndex of
    0: sWhere := sWhere + ' AND ' + SqlValue(edFecha.Date) + ' BETWEEN CONSTITUCION AND VENCIMIENTO-1';
    1: sWhere := sWhere + ' AND ' + SqlValue(edFecha.Date) + ' NOT BETWEEN CONSTITUCION AND VENCIMIENTO-1';
  end;

  case rgCodCajaValores.ItemIndex of
    0: sWhere := sWhere + ' AND CERTIFICADO IS NOT NULL';
    1: sWhere := sWhere + ' AND CERTIFICADO IS NULL';
  end;

  case rgEnCustodia.ItemIndex of
    0: sWhere := sWhere + ' AND ENCUSTODIA = ''S''';
    1: sWhere := sWhere + ' AND NVL(ENCUSTODIA, ''N'') = ''N''';
  end;

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;
  sdqConsulta.ParamByName('Fecha').AsDateTime := edFecha.Date;

  inherited;
  CalcTotales;
end;

function TfrmInvConsultarPlazoFijo.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      PrimaryKey.Add('IN_ID',                sdqConsulta.FieldByName('IDINSTRUMENTO').AsInteger);
      SqlType := stUpdate;

      if ModoABM = maModificacion then
        begin
          Fields.Add('IN_CODCAJAVALORES',    Trim(edCodCajaValAltaModif.Text));
          Fields.Add('IN_ENCUSTODIA',        String(Iif(chkEnCustodiaAltaModif.Checked, 'S', 'N')));
        end
      else if ModoABM = maBaja then
        begin
          Fields.Add('IN_FECHABAJA',         exDateTime);
          Fields.Add('IN_USUBAJA',           Sesion.UserID);
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmInvConsultarPlazoFijo.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('CAPITAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('CAPITAL')).DisplayFormat := '$ #,##0.000;-$ #,##0.000';

  if sdqConsulta.FieldByName('TASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('INTERES') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES')).Currency := True;

  if sdqConsulta.FieldByName('IMPUESTO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('IMPUESTO')).Currency := True;

  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('MONTO')).Currency := True;

  if sdqConsulta.FieldByName('RENDIMIENTO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('RENDIMIENTO')).Currency := True;

  if sdqConsulta.FieldByName('DEVENGADO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('DEVENGADO')).Currency := True;

  if sdqConsulta.FieldByName('INTERES_DEVENGADO') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES_DEVENGADO')).Currency := True;

  if sdqConsulta.FieldByName('CAPITALACT') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('CAPITALACT')).Currency := True;
end;

function TfrmInvConsultarPlazoFijo.ValidarPlazosFijos: Boolean;
var
  i: Integer;
begin
  with sdqConsulta do
    begin
      DisableControls;
      try
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            Verificar(not FieldByName(FieldBaja).IsNull, nil, 'Alguno de los plazos fijos seleccionados se encuentra dado de baja.');
            Verificar(not ((FieldByName('VENCIMIENTO').AsDateTime <= DBDate()) or (FieldByName('PRECANCELABLE').AsString = 'S' )), nil, 'Alguno de los plazos fijos seleccionados no es precancelable o su fecha de vencimiento no es menor o igual a la fecha actual.');
            Verificar(FieldByName('CAPITALACT').AsCurrency = 0, nil, 'Alguno de los plazos fijos seleccionados ya se encuentra cancelado.');
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

function TfrmInvConsultarPlazoFijo.DoCancelarPlazosFijosSel(EnTrans: Boolean): Boolean;
var
  i: Integer;
  sSql: String;
  IdCuentaBancaria: TTableId;
begin
  Result := False;

  if MsgBox('¿Confirma la cancelación de los plazos fijos seleccionados?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    with sdqConsulta do
      begin
        DisableControls;
        try
          if EnTrans then
            BeginTrans;

          try
            for i := 0 to Grid.SelectedRows.Count - 1 do
              begin
                GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                sSql := 'SELECT OI_IDCUENTABANCARIA ' +
                          'FROM NOI_OPERACIONINSTRUMENTO ' +
                         'WHERE OI_IDINSTRUMENTO = :IdInstrumento ' +
                           'AND OI_FECHABAJA IS NULL ' +
                         'ORDER BY OI_ID';
                IdCuentaBancaria := ValorSqlIntegerEx(sSql, [FieldByName('IDINSTRUMENTO').AsInteger]);

                DoInsertarOperacionInstrumento(True, FieldByName('IDINSTRUMENTO').AsInteger, FieldByName('MONTO').AsFloat, FieldByName('CAPITAL').AsFloat, MinDate(FieldByName('VENCIMIENTO').AsDateTime, DBDate()), True, IdCuentaBancaria);
              end;

            if EnTrans then
              CommitTrans;

            MsgBox('Plazos fijos cancelados correctamente.', MB_ICONINFORMATION);
            RefreshData;

            Result := True;
          except
            on E: exception do
              begin
                if EnTrans then
                  Rollback;

                MessageDlg('Se produjo un error al intentar cancelar los plazos fijos.' + E.Message, mtError, [mbOK], 0);
              end;
          end;
        finally
          EnableControls;
        end;
      end;
end;

procedure TfrmInvConsultarPlazoFijo.DoCancelarPlazosFijos(EnTrans: Boolean);
begin
  if ValidarPlazosFijos() then
    DoCancelarPlazosFijosSel(EnTrans);
end;

procedure TfrmInvConsultarPlazoFijo.tbCancelarClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  DoCancelarPlazosFijos(True);
end;

procedure TfrmInvConsultarPlazoFijo.DoAltaNuevoPlazoFijo(Sender: TObject);
var
  sDenominacion: String;
  bOk, bEsRenovacion: Boolean;
  IdInstrumento: TTableId;
  dMonto: Double;
begin
  with sdqConsulta do
    begin
      bEsRenovacion := (Sender = mnuAltaPlFijoRenov);

      if bEsRenovacion then
        begin
          Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');
          Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar exactamente un registro en la grilla.');

          sDenominacion := Trim('RENOVACION ' + FieldByName('CERTIFICADO').AsString);
          IdInstrumento := FieldByName('IDINSTRUMENTO').AsInteger;
          dMonto        := FieldByName('MONTO').AsCurrency;

          bOk := ValidarPlazosFijos();
        end
      else
        begin
          bOk           := True;
          sDenominacion := 'CONSTITUCION';
          IdInstrumento := ART_EMPTY_ID;
          dMonto        := 0;
        end;

      if bOk then
        begin
          BeginTrans;
          try
            if bEsRenovacion then
              bOk := DoCancelarPlazosFijosSel(False);

            if bOk and TfrmInvConsultarInstrumentos.DoAltaPlazoFijo(sDenominacion, IdInstrumento, dMonto) then
              CommitTrans
            else
              Rollback(True);

            RefreshData;    // siempre refresco porque pudo haber hecho una cancelación primero con su refreshdata, y luego eligió botón Cancelar en pantalla de alta... 
          except
            on E: exception do
              begin
                Rollback;
                MessageDlg('Se produjo un error al intentar dar de alta los plazos fijos.' + E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
    end;
end;

procedure TfrmInvConsultarPlazoFijo.tbNuevoClick(Sender: TObject);
begin
  tbNuevo.CheckMenuDropdown;
end;

procedure TfrmInvConsultarPlazoFijo.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if CAMPOS_SUMA[iPos] = 'CAPITAL' then
        iCantDec := 3
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec);
    end;  
end;

procedure TfrmInvConsultarPlazoFijo.btnAceptarFechasClick(Sender: TObject);
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe ingresar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe ingresar la fecha hasta.');

  fpFechas.ModalResult := mrOk;
end;

procedure TfrmInvConsultarPlazoFijo.CalcTotales;
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

procedure TfrmInvConsultarPlazoFijo.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmInvConsultarPlazoFijo.LoadControls;
begin
  with sdqConsulta do
    begin
      edCodCajaValAltaModif.Text     := FieldByName('CERTIFICADO').AsString;
      chkEnCustodiaAltaModif.Checked := (FieldByName('ENCUSTODIA').AsString = 'S');
    end;
end;

procedure TfrmInvConsultarPlazoFijo.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmInvConsultarPlazoFijo.DoImprimirSolicCustodia(Sender: TObject);
var
  sTipo: String;
begin
  edFechaDesde.Date := DBDate();
  edFechaHasta.Date := edFechaDesde.Date;

  if fpFechas.ShowModal = mrOk then
    begin
      if Sender = mnuImpSolicitudCustodiaEntr then
        sTipo := 'E'
      else
        sTipo := 'R';

      DoImprimirSolicitudCustodia(edFechaDesde.Date, edFechaHasta.Date, sTipo);
    end;
end;

function TfrmInvConsultarPlazoFijo.Validar: Boolean;
begin
  Result := True;
end;

procedure TfrmInvConsultarPlazoFijo.tbExportarSSNClick(Sender: TObject);
begin
  ImpoExpoWizard('IPFSS');
end;

procedure TfrmInvConsultarPlazoFijo.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

end.


