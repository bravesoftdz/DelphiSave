unit unInvInstrumentoAnalisis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, DBCtrls, CurrEdit,
  unfraCtbTablas, Menus, unArt, RxCurrEdit, RxToolEdit, RxPlacemnt, PatternEdit,
  IntEdit;

type
  TTipoCarga = (tcInstrumento, tcLicitacion, tcResultado);

  TfrmInvInstrumentoAnalisis = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaVencimDesde: TDateComboBox;
    edFechaVencimHasta: TDateComboBox;
    gbCodCajaValores: TGroupBox;
    edCodCajaVal: TEdit;
    rgGrupoEcon: TRadioGroup;
    gbFechaLiquidacion: TGroupBox;
    Label2: TLabel;
    edFechaLiquidDesde: TDateComboBox;
    edFechaLiquidHasta: TDateComboBox;
    gbFechaLicitacion: TGroupBox;
    Label3: TLabel;
    edFechaLicitacDesde: TDateComboBox;
    edFechaLicitacHasta: TDateComboBox;
    pnlBottom: TPanel;
    gbLicitacion: TGroupBox;
    DBEdit14: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    fraTipoInstrumentoAltaModif: TfraCodigoDescripcion;
    Label17: TLabel;
    edDescripcionAltaModif: TEdit;
    Label18: TLabel;
    fraMonedaAltaModif: TfraCodigoDescripcion;
    Label19: TLabel;
    edCalificacionAltaModif: TEdit;
    chkGrupoEconAltaModif: TCheckBox;
    lblEmisorAltaModif: TLabel;
    fraEmisorAltaModif: TfraCodigoDescripcion;
    lblFiduciarioAltaModif: TLabel;
    fraFiduciarioAltaModif: TfraCodigoDescripcion;
    Label20: TLabel;
    fraTasaRefAltaModif: TfraCodigoDescripcion;
    lblMontoAltaModif: TLabel;
    edMontoEmisAltaModif: TCurrencyEdit;
    Label21: TLabel;
    edLicitacionAltaModif: TDateComboBox;
    Label22: TLabel;
    edLiquidacionAltaModif: TDateComboBox;
    Label23: TLabel;
    edVencimientoAltaModif: TDateComboBox;
    Label24: TLabel;
    Label25: TLabel;
    rgMetodoAltaModif: TRadioGroup;
    Label26: TLabel;
    edTasaAltaModif: TCurrencyEdit;
    Label27: TLabel;
    edTIRAltaModif: TCurrencyEdit;
    fraAmortizacionAltaModif: TfraCtbTablas;
    fraInteresAltaModif: TfraCtbTablas;
    tbSalir2: TToolButton;
    tbCargarLicitacion: TToolButton;
    ToolButton2: TToolButton;
    tbCargarResultado: TToolButton;
    fpABMLicitacion: TFormPanel;
    Bevel1: TBevel;
    Label32: TLabel;
    Label36: TLabel;
    btnAceptarLicit: TButton;
    btnCancelarLicit: TButton;
    fraCtaComitenteLicAltaModif: TfraCodigoDescripcion;
    Label28: TLabel;
    edTasaLIcAltaModif: TCurrencyEdit;
    Label29: TLabel;
    edPrecioLicAltaModif: TCurrencyEdit;
    Label30: TLabel;
    fraColocadorLicAltaModif: TfraCodigoDescripcion;
    Label31: TLabel;
    fraCtaDepositLicAltaModif: TfraCodigoDescripcion;
    Label33: TLabel;
    fraCtaPagadoraLicAltaModif: TfraCodigoDescripcion;
    edNominalLicAltaModif: TCurrencyEdit;
    fpABMResultado: TFormPanel;
    Bevel2: TBevel;
    Label34: TLabel;
    Label38: TLabel;
    btnAceptarRes: TButton;
    btnCancelarRes: TButton;
    edTasaResAltaModif: TCurrencyEdit;
    edPrecioResAltaModif: TCurrencyEdit;
    Label35: TLabel;
    edCodCajaValResAltaModif: TEdit;
    Label37: TLabel;
    edCodigoSSNResAltaModif: TEdit;
    Label39: TLabel;
    edMontoResAltaModif: TCurrencyEdit;
    mnuAdjuntos: TPopupMenu;
    mnuAdjuntosCargar: TMenuItem;
    mnuAdjuntosVisualizar: TMenuItem;
    ToolButton1: TToolButton;
    tbAdjuntos: TToolButton;
    OpenDialog: TOpenDialog;
    mnuAdjuntosEliminar: TMenuItem;
    Label40: TLabel;
    edNominalResAltaModif: TCurrencyEdit;
    Label41: TLabel;
    DBEdit12: TDBEdit;
    tbSumatoria: TToolButton;
    ToolButton9: TToolButton;
    rgMercadoAltaModif: TRadioGroup;
    rgLicitacionCargada: TRadioGroup;
    rgResultadoCargado: TRadioGroup;
    Label42: TLabel;
    edVersionResAltaModif: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbCargarLicitacionClick(Sender: TObject);
    procedure tbCargarResultadoClick(Sender: TObject);
    procedure btnAceptarLicitClick(Sender: TObject);
    procedure fraColocadorLicAltaModifedCodigoChange(Sender: TObject);
    procedure btnAceptarResClick(Sender: TObject);
    procedure tbAdjuntosClick(Sender: TObject);
    procedure mnuAdjuntosCargarClick(Sender: TObject);
    procedure mnuAdjuntosVisualizarClick(Sender: TObject);
    procedure mnuAdjuntosEliminarClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    TipoCarga: TTipoCarga;
    procedure fraColocadorLicAltaModifChange(Sender: TObject);
    function Is_ExisteArchivoInstrAnalisisFilaActual(var NombreArchivo: String): Boolean;
    procedure Do_CambiarNombreArchivoInstrAnalisis(IdInstrAnalisis: TTableId; Archivo: String);
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmInvInstrumentoAnalisis: TfrmInvInstrumentoAnalisis;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('MONTO_EMISION');

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  VCLExtra, DateTimeFuncs, unInversiones, ArchFuncs, Numeros;

procedure TfrmInvInstrumentoAnalisis.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT IA_ID IDNIA, TI_DESCRIPCION TIPO_INSTRUMENTO, IA_DESCRIPCION DENOMINACION, MO_NOMBRE MONEDA, ' +
                 'IA_MONTOEMISION MONTO_EMISION, IA_FECHALICITACION FECHA_LICITACION, ' +
                 'IA_FECHALIQUIDACION FECHA_LIQUIDACION, IA_FECHAVENCIMIENTO FECHA_VENCIMIENTO, ' +
                 'AMO.TB_DESCRIPCION AMORTIZACION, INT.TB_DESCRIPCION INTERES, IA_CALIFICACION CALIFICACION, ' +
                 'DECODE(IA_METODO, ''T'', ''Tasa'', ''P'', ''Precio'') METODO, TR_NOMBRE TASA_REFERENCIA, IA_TASA TASA_INTERES, ' +
                 'IA_TIR TIR, EM_NOMBRE EMISOR, FI_NOMBRE FIDUCIARIO, IA_GRUPOECONOMICO GRUPO_ECONOMICO, ' +
                 'IA_FECHABAJA FECHA_BAJA, IA_IDTIPOINSTRUMENTO IDTIPOINSTRUMENTO, IA_IDMONEDA IDMONEDA, '+
                 'IA_AMORTIZACION CODAMORTIZACION, IA_INTERES CODINTERES, IA_METODO CODMETODO, ' +
                 'IA_IDTASAREFERENCIA IDTASAREFERENCIA, IA_IDEMISOR IDEMISOR, IA_IDFIDUCIARIO IDDIFUCIARIO, ' +
                 'IA_FECHACARGALICIT FECHACARGALICIT, IA_FECHACARGARDO FECHACARGARDO, ' +
                 'DECODE(IA_NOMBREARCHIVO, NULL, ''N'', ''S'') EXISTENOMBREARCHIVO, IA_MERCADO CODMERCADO, ' +
                 'DECODE(IA_MERCADO, ''P'', ''Primario'', ''S'', ''Secundario'') MERCADO, IA_VERSION VERSION, ' +
                 '/* LICITACION */ ' +
                 'IA_NOMINALLICITACION NOMINAL_LICITACION, IA_TASALICITACION TASA_LICITACION, ' +
                 'IA_PRECIOLICITACION PRECIO_LICITACION, NS_NOMBRE COLOCADOR, COM.IC_NUMERO CUENTA_COMITENTE, ' +
                 'DEP.IC_NUMERO CUENTA_DEPOSITANTE, CB_NUMERO CUENTA_PAGADORA, IA_IDCOLOCADOR IDCOLOCADOR, ' +
                 'IA_IDCUENTACOMITENTE IDCUENTACOMITENTE, IA_IDCUENTADEPOSITANTE IDCUENTADEPOSITANTE, ' +
                 'IA_IDCUENTAPAGADORA IDCUENTAPAGADORA, ' +
                 '/* RESULTADO */ ' +
                 'IA_TASARESULTADO TASA_RESULTADO, IA_PRECIORESULTADO PRECIO_RESULTADO, ' +
                 'IA_CODCAJAVALORES COD_CAJA_VALORES, IA_CODIGOSSN CODIGO_SSN, IA_MONTO MONTO, ' +
                 'IA_NOMINALRDO NOMINAL_RESULTADO ' +
            'FROM CTB_TABLAS INT, CTB_TABLAS AMO, NTI_TIPOINSTRUMENTO, NEM_EMISOR, NIC_INSTITUCIONCUENTA COM, ' +
                 'NIC_INSTITUCIONCUENTA DEP, ZCB_CUENTABANCARIA, NFI_FIDUCIARIO, NMO_MONEDA, NTR_TASAREFERENCIA, ' +
                 'NNS_INSTITUCION, NIA_INSTRUMENTOENANALISIS ' +
           'WHERE TI_ID = IA_IDTIPOINSTRUMENTO ' +
             'AND MO_ID = IA_IDMONEDA ' +
             'AND TR_ID(+) = IA_IDTASAREFERENCIA ' +
             'AND EM_ID(+) = IA_IDEMISOR ' +
             'AND FI_ID(+) = IA_IDFIDUCIARIO ' +
             'AND NS_ID(+) = IA_IDCOLOCADOR ' +
             'AND CB_ID(+) = IA_IDCUENTAPAGADORA ' +
             'AND COM.IC_ID(+) = IA_IDCUENTACOMITENTE ' +
             'AND DEP.IC_ID(+) = IA_IDCUENTADEPOSITANTE ' +
             'AND AMO.TB_CODIGO(+) = IA_AMORTIZACION ' +
             'AND AMO.TB_CLAVE(+) = ''PLINT'' ' +
             'AND INT.TB_CODIGO(+) = IA_INTERES ' +
             'AND INT.TB_CLAVE(+) = ''PLINT''';

  sWhere := SqlBetweenDateTime(' AND IA_FECHAVENCIMIENTO ', edFechaVencimDesde.Date, edFechaVencimHasta.Date) +
            SqlBetweenDateTime(' AND IA_FECHALIQUIDACION ', edFechaLiquidDesde.Date, edFechaLiquidHasta.Date) +
            SqlBetweenDateTime(' AND IA_FECHALICITACION ', edFechaLicitacDesde.Date, edFechaLicitacHasta.Date);

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND TI_ID = ' + SqlValue(fraTipoInstrumento.Value);

  if not IsEmptyString(edCodCajaVal.Text) then
    sWhere := sWhere + ' AND IA_CODCAJAVALORES = ' + SqlValue(Trim(edCodCajaVal.Text));

  case rgGrupoEcon.ItemIndex of
    0: sWhere := sWhere + ' AND IA_GRUPOECONOMICO = ''S''';
    1: sWhere := sWhere + ' AND IA_GRUPOECONOMICO = ''N''';
  end;

  case rgLicitacionCargada.ItemIndex of
    0: sWhere := sWhere + ' AND IA_FECHACARGALICIT IS NOT NULL';
    1: sWhere := sWhere + ' AND IA_FECHACARGALICIT IS NULL';
  end;

  case rgResultadoCargado.ItemIndex of
    0: sWhere := sWhere + ' AND IA_FECHACARGARDO IS NOT NULL';
    1: sWhere := sWhere + ' AND IA_FECHACARGARDO IS NULL';
  end;

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IA_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;

  inherited;
  CalcTotales;
end;

function TfrmInvInstrumentoAnalisis.Validar: Boolean;
var
  sSql, sCodCajaVal: String;
begin
  case TipoCarga of
    tcInstrumento:
      begin
        Verificar(fraTipoInstrumentoAltaModif.IsEmpty, fraTipoInstrumentoAltaModif, 'El tipo de instrumento es obligatorio.');
        Verificar(IsEmptyString(edDescripcionAltaModif.Text), edDescripcionAltaModif, 'La denominación es obligatoria.');
        Verificar(fraMonedaAltaModif.IsEmpty, fraMonedaAltaModif, 'La moneda es obligatoria.');
        Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIEREVENCIM').AsString = 'S') and edVencimientoAltaModif.IsEmpty, edVencimientoAltaModif, 'El vencimiento es obligatorio.');
        Verificar(rgMetodoAltaModif.ItemIndex = -1, rgMetodoAltaModif, 'El método es obligagorio.');
        Verificar(rgMercadoAltaModif.ItemIndex = -1, rgMercadoAltaModif, 'El mercado es obligagorio.');
        Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIERETASAREFERENCIA').AsString = 'S') and fraTasaRefAltaModif.IsEmpty, fraTasaRefAltaModif, 'La tasa de referencia es obligatoria.');
      end;
    tcLicitacion:
      begin
        Verificar(edNominalLicAltaModif.Value <= 0, edNominalLicAltaModif, 'La cantidad de nominales debe ser mayor a 0.');
        Verificar(not edPrecioLicAltaModif.ReadOnly and (sdqConsulta.FieldByName('CODMETODO').AsString = 'P') and (edPrecioLicAltaModif.Value <= 0), edPrecioLicAltaModif, 'El precio debe ser mayor a 0.');
      end;
    tcResultado:
      begin
        Verificar(edNominalResAltaModif.Value <= 0, edNominalResAltaModif, 'La cantidad de nominales debe ser mayor a 0.');
        Verificar(not edPrecioResAltaModif.ReadOnly and (sdqConsulta.FieldByName('CODMETODO').AsString = 'P') and (edPrecioResAltaModif.Value <= 0), edPrecioResAltaModif, 'El precio debe ser mayor a 0.');
        Verificar(edVersionResAltaModif.Value <= 0, edVersionResAltaModif, 'La versión es obligatoria.');

        sCodCajaVal := Trim(edCodCajaValResAltaModif.Text);
        sSql := 'SELECT 1 ' +
                  'FROM NIN_INSTRUMENTO ' +
                 'WHERE IN_CODCAJAVALORES = :CodCaja ' +
                   'AND IN_VERSION = :Version ' +
                   'AND IN_FECHABAJA IS NULL ' +
                 'UNION ' +
                'SELECT 1 ' +
                  'FROM NIA_INSTRUMENTOENANALISIS ' +
                 'WHERE IA_CODCAJAVALORES = :CodCaja ' +
                   'AND Ia_VERSION = :Version ' +
                   'AND IA_FECHABAJA IS NULL';
        Verificar(not IsEmptyString(sCodCajaVal) and ExisteSqlEx(sSql, [sCodCajaVal, edVersionResAltaModif.Value, sCodCajaVal, edVersionResAltaModif.Value]), edCodCajaValResAltaModif, 'El código caja valores/certificado y versión ya existen.');

        with sdqConsulta do
          begin
            if ((FieldByName('CODMETODO').AsString = 'T') and
                (ToleranceCompare2(FieldByName('TASA_LICITACION').AsFloat, edTasaResAltaModif.Value) <= 0))
               or ((sdqConsulta.FieldByName('CODMETODO').AsString = 'P') and
                   (ToleranceCompare2(FieldByName('PRECIO_LICITACION').AsFloat, edPrecioResAltaModif.Value) >= 0)) then
              Verificar(edMontoResAltaModif.Value <= 0, edMontoResAltaModif, 'El monto debe ser mayor a 0.');
          end;
      end;
  end;

  Result := True;
end;

procedure TfrmInvInstrumentoAnalisis.ClearControls;
begin
  fraTipoInstrumentoAltaModif.Clear;
  edDescripcionAltaModif.Clear;
  fraMonedaAltaModif.Clear;
  edMontoEmisAltaModif.Clear;
  edLicitacionAltaModif.Clear;
  edLiquidacionAltaModif.Clear;
  edVencimientoAltaModif.Clear;
  edCalificacionAltaModif.Clear;
  fraAmortizacionAltaModif.Clear;
  fraInteresAltaModif.Clear;
  rgMetodoAltaModif.ItemIndex  := -1;
  rgMercadoAltaModif.ItemIndex := -1;
  edTasaAltaModif.Clear;
  fraTasaRefAltaModif.Clear;
  edTIRAltaModif.Clear;
  chkGrupoEconAltaModif.Checked := False;
  fraEmisorAltaModif.Clear;
  fraFiduciarioAltaModif.Clear;

  VCLExtra.LockControls([fraTipoInstrumentoAltaModif], False);
end;

procedure TfrmInvInstrumentoAnalisis.LoadControls;
begin
  with sdqConsulta do
    begin
      case TipoCarga of
        tcInstrumento:
          begin
            fraTipoInstrumentoAltaModif.Value := FieldByName('IDTIPOINSTRUMENTO').AsInteger;
            edDescripcionAltaModif.Text       := FieldByName('DENOMINACION').AsString;
            fraMonedaAltaModif.Value          := FieldByName('IDMONEDA').AsInteger;
            edMontoEmisAltaModif.Value        := FieldByName('MONTO_EMISION').AsFloat;
            edLicitacionAltaModif.Date        := FieldByName('FECHA_LICITACION').AsDateTime;
            edLiquidacionAltaModif.Date       := FieldByName('FECHA_LIQUIDACION').AsDateTime;
            edVencimientoAltaModif.Date       := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            edCalificacionAltaModif.Text      := FieldByName('CALIFICACION').AsString;
            fraAmortizacionAltaModif.Codigo   := FieldByName('CODAMORTIZACION').AsString;
            fraInteresAltaModif.Codigo        := FieldByName('CODINTERES').AsString;
            rgMetodoAltaModif.ItemIndex       := Iif(FieldByName('CODMETODO').AsString = 'T', 0, (Iif(FieldByName('CODMETODO').AsString = 'P', 1, 0)));
            rgMercadoAltaModif.ItemIndex      := Iif(FieldByName('CODMERCADO').AsString = 'P', 0, (Iif(FieldByName('CODMERCADO').AsString = 'S', 1, 0)));
            edTasaAltaModif.Value             := FieldByName('TASA_INTERES').AsFloat;
            fraTasaRefAltaModif.Value         := FieldByName('IDTASAREFERENCIA').AsInteger;
            edTIRAltaModif.Value              := FieldByName('TIR').AsFloat;
            chkGrupoEconAltaModif.Checked     := (FieldByName('GRUPO_ECONOMICO').AsString = 'S');
            fraEmisorAltaModif.Value          := FieldByName('IDEMISOR').AsInteger;
            fraFiduciarioAltaModif.Value      := FieldByName('IDDIFUCIARIO').AsInteger;

            VCLExtra.LockControls([fraTipoInstrumentoAltaModif]);
          end;
        tcLicitacion:
          begin
            edNominalLicAltaModif.Value       := FieldByName('NOMINAL_LICITACION').AsFloat;
            edTasaLIcAltaModif.Value          := FieldByName('TASA_LICITACION').AsFloat;
            edPrecioLicAltaModif.Value        := FieldByName('PRECIO_LICITACION').AsFloat;
            fraColocadorLicAltaModif.Value    := FieldByName('IDCOLOCADOR').AsInteger;
            fraCtaComitenteLicAltaModif.Value := FieldByName('IDCUENTACOMITENTE').AsInteger;
            fraCtaDepositLicAltaModif.Value   := FieldByName('IDCUENTADEPOSITANTE').AsInteger;
            fraCtaPagadoraLicAltaModif.Value  := FieldByName('IDCUENTAPAGADORA').AsInteger;

            VCLExtra.LockControl(edTasaLIcAltaModif, (sdqConsulta.FieldByName('CODMETODO').AsString = 'P'));
            VCLExtra.LockControl(edPrecioLicAltaModif, (sdqConsulta.FieldByName('CODMETODO').AsString = 'T'));
          end;
        tcResultado:
          begin
            edNominalResAltaModif.Value       := Iif(FieldByName('NOMINAL_RESULTADO').IsNull, FieldByName('NOMINAL_LICITACION').AsFloat, FieldByName('NOMINAL_RESULTADO').AsFloat);
            edTasaResAltaModif.Value          := FieldByName('TASA_RESULTADO').AsFloat;
            edPrecioResAltaModif.Value        := FieldByName('PRECIO_RESULTADO').AsFloat;
            edCodCajaValResAltaModif.Text     := FieldByName('COD_CAJA_VALORES').AsString;
            edCodigoSSNResAltaModif.Text      := FieldByName('CODIGO_SSN').AsString;
            edMontoResAltaModif.Value         := FieldByName('MONTO').AsFloat;
            edVersionResAltaModif.Value       := Iif(FieldByName('VERSION').IsNull, 1, FieldByName('VERSION').AsInteger);

            VCLExtra.LockControl(edTasaResAltaModif, (sdqConsulta.FieldByName('CODMETODO').AsString = 'P'));
            VCLExtra.LockControl(edPrecioResAltaModif, (sdqConsulta.FieldByName('CODMETODO').AsString = 'T'));
          end;
      end;
    end;
end;

function TfrmInvInstrumentoAnalisis.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      case TipoCarga of
        tcInstrumento:
          begin
            if (ModoABM = maAlta) or (ModoABM = maModificacion) then
              begin
                if (ModoABM = maAlta) then
                  begin
                    PrimaryKey.Add('IA_ID',             GetSecNextVal('INV.SEQ_NIA_ID'));
                    Fields.Add('IA_FECHAALTA',          exDateTime);
                    Fields.Add('IA_USUALTA',            Sesion.UserID);

                    SqlType := stInsert;
                  end
                else
                  begin
                    PrimaryKey.Add('IA_ID',             sdqConsulta.FieldByName('IDNIA').AsInteger);
                    Fields.Add('IA_FECHAMODIF',         exDateTime);
                    Fields.Add('IA_USUMODIF',           Sesion.UserID);

                    SqlType := stUpdate;
                  end;

                Fields.Add('IA_IDTIPOINSTRUMENTO',      fraTipoInstrumentoAltaModif.Value);
                Fields.Add('IA_DESCRIPCION',            Trim(edDescripcionAltaModif.Text));
                Fields.Add('IA_IDMONEDA',               fraMonedaAltaModif.Value);
                Fields.Add('IA_MONTOEMISION',           edMontoEmisAltaModif.Value);

                if edLicitacionAltaModif.IsEmpty then
                  Fields.Add('IA_FECHALICITACION',      exNull)
                else
                  Fields.Add('IA_FECHALICITACION',      edLicitacionAltaModif.Date);

                if edLiquidacionAltaModif.IsEmpty then
                  Fields.Add('IA_FECHALIQUIDACION',     exNull)
                else
                  Fields.Add('IA_FECHALIQUIDACION',     edLiquidacionAltaModif.Date);

                if edVencimientoAltaModif.IsEmpty then
                  Fields.Add('IA_FECHAVENCIMIENTO',     exNull)
                else
                  Fields.Add('IA_FECHAVENCIMIENTO',     edVencimientoAltaModif.Date);

                Fields.Add('IA_CALIFICACION',           Trim(edCalificacionAltaModif.Text));
                Fields.Add('IA_AMORTIZACION',           fraAmortizacionAltaModif.Value);
                Fields.Add('IA_INTERES',                fraInteresAltaModif.Value);
                Fields.Add('IA_METODO',                 String(Iif(rgMetodoAltaModif.ItemIndex = 0, 'T', (Iif(rgMetodoAltaModif.ItemIndex = 1, 'P', '')))));
                Fields.Add('IA_MERCADO',                String(Iif(rgMercadoAltaModif.ItemIndex = 0, 'P', (Iif(rgMercadoAltaModif.ItemIndex = 1, 'S', '')))));
                Fields.Add('IA_TASA',                   edTasaAltaModif.Value);
                Fields.Add('IA_IDTASAREFERENCIA',       fraTasaRefAltaModif.Value, True);
                Fields.Add('IA_TIR',                    edTIRAltaModif.Value);
                Fields.Add('IA_GRUPOECONOMICO',         String(Iif(chkGrupoEconAltaModif.Checked, 'S', 'N')));
                Fields.Add('IA_IDEMISOR',               fraEmisorAltaModif.Value, True);
                Fields.Add('IA_IDFIDUCIARIO',           fraFiduciarioAltaModif.Value, True);
              end
            else if ModoABM = maBaja then
              begin
                PrimaryKey.Add('IA_ID',                 sdqConsulta.FieldByName('IDNIA').AsInteger);
                Fields.Add('IA_FECHABAJA',              exDateTime);
                Fields.Add('IA_USUBAJA',                Sesion.UserID);

                SqlType := stUpdate;
              end;
          end;
        tcLicitacion:
          begin
            PrimaryKey.Add('IA_ID',                     sdqConsulta.FieldByName('IDNIA').AsInteger);
            Fields.Add('IA_FECHACARGALICIT',            exDateTime);
            Fields.Add('IA_USUCARGALICIT',              Sesion.UserID);
            Fields.Add('IA_NOMINALLICITACION',          edNominalLicAltaModif.Value);
            Fields.Add('IA_TASALICITACION',             edTasaLIcAltaModif.Value);
            Fields.Add('IA_PRECIOLICITACION',           edPrecioLicAltaModif.Value);
            Fields.Add('IA_IDCOLOCADOR',                fraColocadorLicAltaModif.Value, True);
            Fields.Add('IA_IDCUENTACOMITENTE',          fraCtaComitenteLicAltaModif.Value, True);
            Fields.Add('IA_IDCUENTADEPOSITANTE',        fraCtaDepositLicAltaModif.Value, True);
            Fields.Add('IA_IDCUENTAPAGADORA',           fraCtaPagadoraLicAltaModif.Value, True);

            SqlType := stUpdate;
          end;
        tcResultado:
          begin
            PrimaryKey.Add('IA_ID',                     sdqConsulta.FieldByName('IDNIA').AsInteger);
            Fields.Add('IA_FECHACARGARDO',              exDateTime);
            Fields.Add('IA_USUCARGARDO',                Sesion.UserID);
            Fields.Add('IA_NOMINALRDO',                 edNominalResAltaModif.Value);
            Fields.Add('IA_TASARESULTADO',              edTasaResAltaModif.Value);
            Fields.Add('IA_PRECIORESULTADO',            edPrecioResAltaModif.Value);
            Fields.Add('IA_CODCAJAVALORES',             Trim(edCodCajaValResAltaModif.Text));
            Fields.Add('IA_CODIGOSSN',                  Trim(edCodigoSSNResAltaModif.Text));
            Fields.Add('IA_MONTO',                      edMontoResAltaModif.Value);
            Fields.Add('IA_VERSION',                    edVersionResAltaModif.Value, 0, True);

            SqlType := stUpdate;
          end;
      end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmInvInstrumentoAnalisis.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

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

  with fraTipoInstrumentoAltaModif do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ExtraFields := ', TI_VENCIMIENTO REQUIEREVENCIM, TI_TASA REQUIERETASA, TI_TASAREFERENCIA REQUIERETASAREFERENCIA ';
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

  with fraAmortizacionAltaModif do
    begin
      Clave     := 'PLINT';
      ShowBajas := False;
    end;

  with fraInteresAltaModif do
    begin
      Clave     := 'PLINT';
      ShowBajas := False;
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

  with fraEmisorAltaModif do
    begin
      TableName   := 'NEM_EMISOR';
      FieldID     := 'EM_ID';
      FieldCodigo := 'EM_ID';
      FieldDesc   := 'EM_NOMBRE';
      FieldBaja   := 'EM_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraFiduciarioAltaModif do
    begin
      TableName   := 'NFI_FIDUCIARIO';
      FieldID     := 'FI_ID';
      FieldCodigo := 'FI_ID';
      FieldDesc   := 'FI_NOMBRE';
      FieldBaja   := 'FI_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraColocadorLicAltaModif do
    begin
      TableName      := 'NNS_INSTITUCION';
      FieldID        := 'NS_ID';
      FieldCodigo    := 'NS_ID';
      FieldDesc      := 'NS_NOMBRE';
      FieldBaja      := 'NS_FECHABAJA';
      ExtraCondition := 'AND NS_COLOCADOR = ''S''';
      OnChange       := fraColocadorLicAltaModifChange;
      ShowBajas      := False;
    end;

  with fraCtaComitenteLicAltaModif do
    begin
      TableName      := 'NIC_INSTITUCIONCUENTA';
      FieldID        := 'IC_ID';
      FieldCodigo    := 'IC_ID';
      FieldDesc      := 'IC_NUMERO';
      FieldBaja      := 'IC_FECHABAJA';
      ExtraCondition := 'AND 1 = 2';
      ShowBajas      := False;
    end;

  with fraCtaDepositLicAltaModif do
    begin
      TableName      := 'NIC_INSTITUCIONCUENTA';
      FieldID        := 'IC_ID';
      FieldCodigo    := 'IC_ID';
      FieldDesc      := 'IC_NUMERO';
      FieldBaja      := 'IC_FECHABAJA';
      ExtraCondition := 'AND 1 = 2';
      ShowBajas      := False;
    end;

  with fraCtaPagadoraLicAltaModif do
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

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NIA_INSTRUMENTOENANALISIS';
end;

procedure TfrmInvInstrumentoAnalisis.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraTipoInstrumento.Clear;
  edFechaVencimDesde.Clear;
  edFechaVencimHasta.Clear;
  edFechaLiquidDesde.Clear;
  edFechaLiquidHasta.Clear;
  edFechaLicitacDesde.Clear;
  edFechaLicitacHasta.Clear;
  edCodCajaVal.Clear;
  rgGrupoEcon.ItemIndex         := 2;  // Todos
  rgLicitacionCargada.ItemIndex := 2;  // Todos
  rgResultadoCargado.ItemIndex  := 2;  // Todos
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmInvInstrumentoAnalisis.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('TASA_INTERES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA_INTERES')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('TIR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TIR')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('MONTO_EMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO_EMISION')).Currency := True;

  if sdqConsulta.FieldByName('NOMINAL_LICITACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('NOMINAL_LICITACION')).DisplayFormat := '#,##0;- #,##0';

  if sdqConsulta.FieldByName('TASA_LICITACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA_LICITACION')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('PRECIO_LICITACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PRECIO_LICITACION')).DisplayFormat := '$ #,##0.000000;-$ #,##0.000000';

  if sdqConsulta.FieldByName('NOMINAL_RESULTADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('NOMINAL_RESULTADO')).DisplayFormat := '#,##0;- #,##0';

  if sdqConsulta.FieldByName('TASA_RESULTADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA_RESULTADO')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('PRECIO_RESULTADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PRECIO_RESULTADO')).Currency := True;

  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;
end;

procedure TfrmInvInstrumentoAnalisis.tbModificarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El instrumento ha sido dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHACARGALICIT').IsNull, nil, 'El instrumento tiene una licitación cargada.');

  TipoCarga := tcInstrumento;
  inherited;
end;

procedure TfrmInvInstrumentoAnalisis.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'El instrumento ya ha sido dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHACARGARDO').IsNull, nil, 'El instrumento tiene un resultado cargado.');

  TipoCarga := tcInstrumento;
  inherited;
end;

procedure TfrmInvInstrumentoAnalisis.tbNuevoClick(Sender: TObject);
begin
  TipoCarga := tcInstrumento;
  inherited;
end;

procedure TfrmInvInstrumentoAnalisis.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmInvInstrumentoAnalisis.tbCargarLicitacionClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      Verificar(IsBaja(), nil, 'El instrumento ha sido dada de baja.');
      Verificar(not sdqConsulta.FieldByName('FECHACARGARDO').IsNull, nil, 'El instrumento ya tiene un resultado cargado.');

      TipoCarga := tcLicitacion;

      ModoABM := maModificacion;
      ModoABMToSqlType;
      LoadControls;
      fpABMLicitacion.Caption := 'Cargar Licitación';
      fpABMLicitacion.ShowModal;
    end;
end;

procedure TfrmInvInstrumentoAnalisis.tbCargarResultadoClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      Verificar(IsBaja(), nil, 'El instrumento ha sido dada de baja.');
      Verificar(sdqConsulta.FieldByName('FECHACARGALICIT').IsNull, nil, 'El instrumento no tiene una licitación cargada.');
      Verificar(not sdqConsulta.FieldByName('FECHACARGARDO').IsNull, nil, 'El instrumento ya tiene un resultado cargado.');

      TipoCarga := tcResultado;

      ModoABM := maModificacion;
      ModoABMToSqlType;
      LoadControls;
      fpABMResultado.Caption := 'Cargar Resultado';
      fpABMResultado.ShowModal;
    end;
end;

procedure TfrmInvInstrumentoAnalisis.btnAceptarLicitClick(Sender: TObject);
begin
	if Validar and DoABM then
    begin
      if sdqConsulta.Active then
        begin
          sdqConsulta.Refresh;
          CheckButtons;
        end
      else
        tbRefrescarClick(nil);

      fpABMLicitacion.ModalResult := mrOk;
    end;
end;

procedure TfrmInvInstrumentoAnalisis.btnAceptarResClick(Sender: TObject);
begin
  if Validar and
     (MsgBox('ATENCIÓN: Esta acción NO se puede deshacer.' + CRLF + '¿Confirma la carga del resultado?', MB_ICONQUESTION+MB_YESNO) = ID_YES) and
     DoABM then
    begin
      if sdqConsulta.Active then
        begin
          sdqConsulta.Refresh;
          CheckButtons;
        end
      else
        tbRefrescarClick(nil);

      fpABMResultado.ModalResult := mrOk;
    end;
end;

procedure TfrmInvInstrumentoAnalisis.fraColocadorLicAltaModifChange(Sender: TObject);
begin
  with fraCtaComitenteLicAltaModif do
    begin
      Clear;

      if fraColocadorLicAltaModif.IsSelected then
        ExtraCondition := ' AND IC_TIPO = ''C'' AND IC_IDINSTITUCION  = ' + SqlValue(fraColocadorLicAltaModif.Value)
      else
        ExtraCondition := ' AND 1 = 2';
    end;

  with fraCtaDepositLicAltaModif  do
    begin
      Clear;

      if fraColocadorLicAltaModif.IsSelected then
        ExtraCondition := ' AND IC_TIPO = ''D'' AND IC_IDINSTITUCION  = ' + SqlValue(fraColocadorLicAltaModif.Value)
      else
        ExtraCondition := ' AND 1 = 2';
    end;
end;

procedure TfrmInvInstrumentoAnalisis.fraColocadorLicAltaModifedCodigoChange(Sender: TObject);
begin
  if fraColocadorLicAltaModif.edCodigo.Text = '' then
    fraColocadorLicAltaModifChange(Sender);
end;

procedure TfrmInvInstrumentoAnalisis.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if AreIn(CAMPOS_SUMA[iPos], ['NOMINAL_LICITACION', 'NOMINAL_RESULTADO']) then
        iCantDec := 0
      else if AreIn(CAMPOS_SUMA[iPos], ['PRECIO_LICITACION']) then
        iCantDec := 6
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec);
    end;
end;

procedure TfrmInvInstrumentoAnalisis.tbAdjuntosClick(Sender: TObject);
begin
  tbAdjuntos.CheckMenuDropdown;
end;

procedure TfrmInvInstrumentoAnalisis.mnuAdjuntosCargarClick(Sender: TObject);
var
  sNombreArchivoServidor, sNombreArchivo: String;
  IdInstrAnalisis: TTableId;
  bContinuar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(IsBaja(), nil, 'El instrumento ha sido dada de baja.');

  if sdqConsulta.FieldByName('EXISTENOMBREARCHIVO').AsString = 'S' then
    bContinuar := (MsgBox('El instrumento en análisis ya tiene un adjunto asociado. ¿Desea sobreescribirlo?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    bContinuar := True;

  if bContinuar then
    with OpenDialog do
      begin
        Title      := 'Archivo Adjunto del Instrumento en Análisis';
        DefaultExt := 'pdf';
        Filter     := 'Archivos Adobe PDF (*.pdf)|*.pdf';

        if Execute then
          begin
            sNombreArchivo         := OpenDialog.FileName;
            IdInstrAnalisis        := sdqConsulta.FieldByName('IDNIA').AsInteger;
            sNombreArchivoServidor := Get_NombreArchivoEnvioInstrumentoAnalisis(IdInstrAnalisis);

            CopyFileExt(sNombreArchivo, sNombreArchivoServidor, False);

            if FileExists(sNombreArchivoServidor) then
              begin
                Do_CambiarNombreArchivoInstrAnalisis(IdInstrAnalisis, sNombreArchivoServidor);

                MsgBox('Adjunto del instrumento en análisis cargado correctamente.', MB_ICONINFORMATION);
                RefreshData;
              end
            else
              MsgBox('Error al cargar el adjunto del instrumento en análisis ' + IntToStr(IdInstrAnalisis), MB_ICONERROR);
          end;
      end;
end;

procedure TfrmInvInstrumentoAnalisis.Do_CambiarNombreArchivoInstrAnalisis(IdInstrAnalisis: TTableId; Archivo: String);
var
  sSql: String;
begin
  sSql := 'UPDATE NIA_INSTRUMENTOENANALISIS ' +
             'SET IA_NOMBREARCHIVO = :NombreArch ' +
           'WHERE IA_ID = :Id';
  EjecutarSqlEx(sSql, [Archivo, IdInstrAnalisis]);
end;

function TfrmInvInstrumentoAnalisis.Is_ExisteArchivoInstrAnalisisFilaActual(var NombreArchivo: String): Boolean;
var
  Id: TTableId;
  bExiste: Boolean;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      Id := sdqConsulta.FieldByName('IDNIA').AsInteger;

      bExiste := Is_ExisteArchivoInstrumentoAnalisis(Id, NombreArchivo);
    end
  else
    bExiste := False;

  Result := bExiste;
end;

procedure TfrmInvInstrumentoAnalisis.mnuAdjuntosVisualizarClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not Is_ExisteArchivoInstrAnalisisFilaActual(sNombreArchivo), nil, 'El instrumento en análisis no tiene un archivo adjunto.');

  Do_ImprimirArchivoInstrumentoAnalisis(sNombreArchivo);
end;

procedure TfrmInvInstrumentoAnalisis.mnuAdjuntosEliminarClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not Is_ExisteArchivoInstrAnalisisFilaActual(sNombreArchivo), nil, 'El instrumento en análisis no tiene un archivo adjunto.');
  Verificar(not FileExists(sNombreArchivo), nil, 'El archivo adjunto: ' + sNombreArchivo + ' no existe.');

  if MsgBox('¿Está seguro que desea borrar el archivo adjunto seleccionado?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      Verificar(not DeleteFile(sNombreArchivo), nil, 'No se pudo borrar el archivo adjunto: ' + sNombreArchivo + '.');

      Do_CambiarNombreArchivoInstrAnalisis(sdqConsulta.FieldByName('IDNIA').AsInteger, '');

      MsgBox('Archivo adjunto del instrumento en análisis borrado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmInvInstrumentoAnalisis.CalcTotales;
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

