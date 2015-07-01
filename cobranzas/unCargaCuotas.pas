unit unCargaCuotas;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   20-07-03
}

interface
                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  Mask, PatternEdit, CardinalEdit, ToolEdit, CurrEdit, DateComboBox, StaticGrid, unArtFrame, unArt,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDbFrame, unFraEmpresa, IntEdit, FormPanel, Menus,
  unArtDBAwareFrame, SortDlg, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmCargaCuotas = class(TfrmCustomPanelABM)
    fpCheques: TFormPanel;
    GridCheques: TArtDBGrid;
    sdqCheques: TSDQuery;
    dsCheques: TDataSource;
    Label12: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    edMontoADeducir: TCurrencyEdit;
    edMontoDisponible: TCurrencyEdit;
    Label14: TLabel;
    Bevel1: TBevel;
    mnuImprimir: TPopupMenu;
    mnuImprimirPlan: TMenuItem;
    mnuImprimirEstadodeCuenta: TMenuItem;
    SortDialog: TSortDialog;
    mnuImprimirRecibo: TMenuItem;
    Panel1: TPanel;
    gbEmpresa: TGroupBox;
    Label11: TLabel;
    fraEmpresa: TfraEmpresa;
    gbEstado: TGroupBox;
    fraPP_ESTADO: TfraStaticCTB_TABLAS;
    GridCuotas: TStaticGrid;
    Panel2: TPanel;
    gbToolbar: TGroupBox;
    ToolBarPagoCuota: TToolBar;
    tbVerReemplazo: TToolButton;
    ToolButton1: TToolButton;
    tbCargarCheque: TToolButton;
    ToolButton2: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    tbAgregarRegistro: TToolButton;
    tbModificarRegistro: TToolButton;
    tbEliminarRegistro: TToolButton;
    GridValores: TArtDBGrid;
    Panel3: TPanel;
    gbCuotas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    lblNro: TLabel;
    edPP_TASAINTERESMENSUAL: TCurrencyEdit;
    edAnticipo: TCurrencyEdit;
    edDeudaInicial: TCurrencyEdit;
    btnCalcular: TButton;
    edDeudaTotal: TCurrencyEdit;
    edCantCuotas: TIntEdit;
    rbTipoVencimQuincenal: TRadioButton;
    rbTipoVencimMensual: TRadioButton;
    edPrimerVencimiento: TDateComboBox;
    gbPago: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    edVA_IMPORTE: TCurrencyEdit;
    cmbVA_VENCIMIENTO: TDateComboBox;
    edVA_NROCHEQUE: TPatternEdit;
    fraVA_IDBANCO: TfraStaticCodigoDescripcion;
    chkNegociable: TCheckBox;
    fraVA_TIPO: TfraStaticCodigoDescripcion;
    gbCuotasLEGALES: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    lblNroLEGALES: TLabel;
    edDeudaInicialLEGALES: TCurrencyEdit;
    btnAgregarCuota: TButton;
    edDeudaTotalLEGALES: TCurrencyEdit;
    btnQuitarCuota: TButton;
    cmbVencimiento: TDateComboBox;
    Label16: TLabel;
    edCuota: TCurrencyEdit;
    Label17: TLabel;
    Label18: TLabel;
    edInteres: TCurrencyEdit;
    chkSoloActivos: TCheckBox;
    ToolButton5: TToolButton;
    tbObservaciones: TToolButton;
    tbSepObservaciones: TToolButton;
    tbSalir2: TToolButton;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure GridCuotasSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure tbAgregarRegistroClick(Sender: TObject);
    procedure tbModificarRegistroClick(Sender: TObject);
    procedure tbEliminarRegistroClick(Sender: TObject);
    procedure GridCuotasClick(Sender: TObject);
    procedure GridValoresDblClick(Sender: TObject);
    procedure GridValoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbVerReemplazoClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure tbCargarChequeClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure sdqChequesAfterScroll(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirPlanClick(Sender: TObject);
    procedure mnuImprimirEstadodeCuentaClick(Sender: TObject);
    procedure GridCuotasGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;	var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure mnuImprimirReciboClick(Sender: TObject);
    procedure btnAgregarCuotaClick(Sender: TObject);
    procedure btnQuitarCuotaClick(Sender: TObject);
    procedure chkSoloActivosClick(Sender: TObject);
    procedure tbObservacionesClick(Sender: TObject);
  private
    fPlanEspecial: Boolean;
    procedure SetPlanEspecial(const Value: Boolean);
  private
    iCantidadCuotas: Integer;
    fContrato: String;
    fCuotaActual: String;
    fDeudaInicial: Extended;
    fIDEstudio: TTableId;
    fIDPlanPago: String;
    fGenerarCuotas: Boolean;
    HuboModificacion: Boolean;
    fModifCuotas: Boolean;

    function CanCuotaManual(Contrato: Integer): Boolean;
    function Do_GrabarAntesImpresion: Boolean;
    function DoGuardar: Boolean;
    function Get_MinFechaPrimerVencimiento: TDateTime;
    function Get_TotalValores(Cuota: Integer = -1): Currency;
    function Is_BloquearCargaCuotas: Boolean;
    function Is_ValidarTotalCuota(Contrato: Integer): Boolean;
    function Is_ValoresCargados(CondicionExtra: String = ''): Boolean;
    function Validar_DatosCuota: Boolean;
    function Validar_RedondeoTotal: Boolean;
    function Validar_Valor: Boolean;
    function ValidarGbPago(ImporteAModificar: Extended = 0): Boolean;
    function VerificarPreacuerdoConValores(IDPlanPago: TTableId): Boolean;
    procedure ABMRelacion(TipoABM: String; Query: TSDQuery; IDPlanCuota, IDRelacion: String; TipoValor: Integer);
    procedure ActualizarBotones;
    procedure ActualizarGrilla;
    procedure ActualizarMontoDisponible;
    procedure CambiarModoPago(Sender: TObject);
    procedure ClearGbPago;
    procedure DoGuardarRegistro(Modo: String; IsJuridico: Boolean = False);
    procedure Do_BorrarValores;
    procedure Do_Validar_CalcularCuotas(ActualizarPagoCuota: Boolean);
    procedure GeneraCuotas;
    procedure MostrarAdic;
    procedure SetCuotaActual(Value: String);
    procedure Validar_DatosValores(Tipo: String; EsAlta: Boolean);
    procedure Validar_DatosValoresYRedondeo;
    procedure Validar_ImportesCuota;
    procedure Validar_RedondeoCuota;
    property CuotaActual: String       read fCuotaActual      write SetCuotaActual;
  protected
    procedure BloquearControles; //No uso LockControls porque LockControls es llamada en otros lados por herencia
  public
    procedure DoCargar(IDPlanPago: String);
    property PlanEspecial: Boolean     read fPlanEspecial     write SetPlanEspecial      Default False;
  end;

var
  frmCargaCuotas: TfrmCargaCuotas;

implementation

uses
  unPrincipal, unVerReemplazos, VCLExtra, AnsiSql, strFuncs, DateTimeFuncs, undmPrincipal, SqlFuncs, Math, CustomDlgs,
  unQrPlanFinanciamiento, unQrConvenio, unQrEstadoCuentaPlan, unComunes, unCobranzas, Numeros, unConvertirEnConvenio,
  unqrImpresionRecibo, General, unSesion, unEspera, unCargaPreAcuerdos;

{$R *.DFM}

procedure TfrmCargaCuotas.ClearGbPago;
begin
  fraVA_TIPO.Clear;
  edVA_IMPORTE.Clear;
  fraVA_IDBANCO.Clear;
  edVA_NROCHEQUE.Clear;
  cmbVA_VENCIMIENTO.Clear;

  sdqConsulta.Refresh;
end;

procedure TfrmCargaCuotas.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HuboModificacion then
    if MsgBox('No grabó las modificaciones efectuadas. ¿ Desea hacerlo ahora ?', MB_YESNO) = mrYes then
      if not DoGuardar then Exit;

  Verificar(VerificarPreacuerdoConValores(StrToInt(fIDPlanPago)), nil, 'El preacuerdo actual posee valores cargados - Comuníquese por favor con Sistemas');

  inherited;
  
  frmCargaCuotas := nil;
  Action := caFree;
end;

procedure TfrmCargaCuotas.CambiarModoPago(Sender: TObject);
var
  bHabilitarVencimiento: Boolean;
begin
  bHabilitarVencimiento := ((fraVA_TIPO.Codigo = 'CHQ') or (fraVA_TIPO.Codigo = 'PAG'));

  VCLExtra.LockControls([fraVA_IDBANCO, edVA_NROCHEQUE, cmbVA_VENCIMIENTO, chkNegociable], (fraVA_TIPO.Codigo <> 'CHQ'));
  VCLExtra.LockControls([cmbVA_VENCIMIENTO], not bHabilitarVencimiento);

  if not bHabilitarVencimiento then
    cmbVA_VENCIMIENTO.Clear;
end;

procedure TfrmCargaCuotas.FSFormCreate(Sender: TObject);
begin
  gbCuotasLEGALES.Align   := alLeft;
  iCantidadCuotas         := 0;
  fIDEstudio              := ART_EMPTY_ID;
  fModifCuotas            := False;
  fPlanEspecial           := False;
  inherited;

  with fraVA_IDBANCO do
  begin
    TableName   := 'ZBA_BANCO';
    FieldCodigo := 'BA_CODIGO';
    FieldID     := 'BA_ID';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraVA_TIPO do
  begin
    TableName   := 'OTV_TIPOVALOR';
    FieldId     := 'TV_ID';
    FieldCodigo := 'TV_CODIGO';
    FieldDesc   := 'TV_DESCRIPCION';
    FieldBaja   := 'TV_USUBAJA';
    ShowBajas   := False;
    OnChange    := CambiarModoPago
  end;

  fraPP_ESTADO.Clave := 'ESPLA';

  fraEmpresa.ShowBajas := True;
  CuotaActual := '';

  edPrimerVencimiento.Date    := Get_MinFechaPrimerVencimiento;
  rbTipoVencimMensual.Checked := True
end;

procedure TfrmCargaCuotas.btnAceptarClick(Sender: TObject);
begin
  if not CanCuotaManual(fraEmpresa.Contrato) and btnCalcular.Enabled then   // por las dudas que no haya presionado Calcular
    btnCalcularClick(nil);

  //Graba en las tablas finales
  if DoGuardar then
    DoCargar(fIDPlanPago);
end;

procedure TfrmCargaCuotas.Do_Validar_CalcularCuotas(ActualizarPagoCuota: Boolean);
//var
//  MinFechaPrimerVenc: TDateTime;
begin
  Verificar(edCantCuotas.Value < 0, edCantCuotas, 'Debe ingresar el nro. de cuotas.');
  Verificar(edPrimerVencimiento.IsEmpty, edPrimerVencimiento, 'Debe ingresar la fecha del primer vencimiento.');
  Verificar((fraPP_ESTADO.Especial2 = 'A') and (edPrimerVencimiento.date < DBDate), edPrimerVencimiento, 'La fecha del primer vencimiento no puede ser menor a la fecha actual.');

  //if edCantCuotas.Value > 0 then
  //begin
  //  MinFechaPrimerVenc := Get_MinFechaPrimerVencimiento;
  //  Verificar(edPrimerVencimiento.Date < MinFechaPrimerVenc, edPrimerVencimiento, 'La fecha del primer vencimiento no puede ser menor al ' + DateToStr(MinFechaPrimerVenc) + '.');
  //end;

  Verificar(Is_ValoresCargados(), btnCalcular, 'No se puede cambiar datos de las cuotas cuando se han ingresado valores.');
  Validar_DatosCuota;

  Do_BorrarValores;
  GeneraCuotas;
  if ActualizarPagoCuota then
    ActualizarGrilla;
  ActualizarBotones;
end;

procedure TfrmCargaCuotas.btnCalcularClick(Sender: TObject);
begin
  fModifCuotas := True;

  Do_Validar_CalcularCuotas(True);
end;

procedure TfrmCargaCuotas.DoCargar(IDPlanPago: String);
var
  sSql: String;
  iloop: Integer;
  sdqDatos: TSDQuery;
  FechaBaja: String;
  SqlResults: TStringList;
begin
//  IniciarEspera;
  try
    HuboModificacion := False;

    lblNro.Caption        := 'Nº ' + IDPlanPago;
    lblNroLEGALES.Caption := 'Nº ' + IDPlanPago;
    fIdPlanPago           := IdPlanPago;

    SqlResults := ValoresColSql('SELECT PP_CONTRATO, PP_ESTADO, NVL(PP_DEUDATOTAL,0), PP_FECHABAJA, NVL(PP_TASAINTERESMENSUAL, 0), PP_TIPOCUOTA, PP_IDESTUDIO' +
                                 ' FROM ZPP_PLANPAGO' +
                                ' WHERE PP_ID = ' + fIdPlanPago);
    try
      //Carga el numero de contrato
      if SqlResults[0] <> '' then
        fContrato := SqlResults[0]
      else
        fContrato := '0';
      fraEmpresa.Contrato := StrToInt(fContrato);
      VCLExtra.LockControls(fraEmpresa, True);

      gbCuotasLEGALES.Visible := CanCuotaManual(fraEmpresa.Contrato);
      gbCuotas.Visible        := not gbCuotasLEGALES.Visible;

      //carga el estado del plan
      if SqlResults[1] <> '' then
        fraPP_ESTADO.Value := SqlResults[1]
      else
        fraPP_ESTADO.Clear;
                                     
      if fraPP_ESTADO.Especial2 = 'B' then   // convenio cuota bonificada
        begin
          if Seguridad.Claves.IsActive('PermitirConvenioCuotaBonificada') then
            fraVA_TIPO.ExtraCondition := 'AND TV_CODIGO = ''BON'''
          else
            fraVA_TIPO.ExtraCondition := 'AND 1 = 2';  // no pueden cargar nada   
        end
      else
        fraVA_TIPO.ExtraCondition := 'AND TV_CODIGO <> ''BON''';

      //Carga los valores de las deudas
      if SqlResults[2] <> '' then
        fDeudaInicial := ToFloat(SqlResults[2])
      else
        fDeudaInicial := 0;

      edDeudaInicial.Value := fDeudaInicial;
      edDeudaInicialLEGALES.Value := fDeudaInicial;

      //Carga la fecha de baja si es que tiene
      FechaBaja := SqlResults[3];

      edPP_TASAINTERESMENSUAL.Value := ToFloat(SqlResults[4]);

      if SqlResults[5] = 'Q' then
        rbTipoVencimQuincenal.Checked := True
      else
        rbTipoVencimMensual.Checked := True;

      if SqlResults[6] <> '' then
        fIDEstudio := StrToInt(SqlResults[6])
      else
        fIDEstudio := ART_EMPTY_ID;
    finally
      SqlResults.Free;
    end;

    //Recupero de la base de datos si corresponde
    //Copio los registros reales a las tablas temporales para poder manipularlos en el formulario
    //Registros en ZVA_VALOR
    Do_BorrarValores;

    //Obtengo los registros
    sSql :=
    	'SELECT PC_NROCUOTA, PC_VENCIMIENTO, PC_AMORTIZACION, PC_INTERESFINANC, PC_SALDO' +
       ' FROM ZPC_PLANCUOTA' +
      ' WHERE PC_IDPLANPAGO = :p1' +
   ' ORDER BY PC_NROCUOTA';
    sdqDatos := GetQueryEx(sSql, [fIDPlanPago]);
    try
      if not sdqDatos.Eof then
      begin
        GridCuotas.RowCount := sdqDatos.RecordCount + 1;
        iloop := 1;
        iCantidadCuotas := sdqDatos.RecordCount;

        while not sdqDatos.Eof do
        begin
          if iloop = 2 then
            edPrimerVencimiento.Date := sdqDatos.FieldByName('PC_VENCIMIENTO').AsDateTime;

          GridCuotas.Cells[0, iloop] := sdqDatos.FieldByName('PC_NROCUOTA').AsString;
          GridCuotas.Cells[1, iloop] := sdqDatos.FieldByName('PC_VENCIMIENTO').AsString;
          GridCuotas.Cells[2, iloop] := ToStr(sdqDatos.FieldByName('PC_AMORTIZACION').AsFloat);
          GridCuotas.Cells[3, iloop] := ToStr(sdqDatos.FieldByName('PC_INTERESFINANC').AsFloat);
          GridCuotas.Cells[4, iloop] := ToStr(ToFloat(GridCuotas.Cells[2, iloop]) + ToFloat(GridCuotas.Cells[3, iloop]));
          GridCuotas.Cells[5, iloop] := ToStr(sdqDatos.FieldByName('PC_SALDO').AsFloat);

          sSql := 'INSERT INTO TVA_VALOR (VA_IDPLANVALOR, VA_IDREMESA, VA_IDVALOR, VA_ORIGEN, ' +
                  '       VA_ID, VA_TIPO, VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                  '       VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE, '+
                  '       VA_NROCUOTA, VA_USUARIO) ' +
                  '(SELECT  VA_IDPLANVALOR, VA_IDREMESA, VA_IDVALOR, VA_ORIGEN, ' +
                  '         SEQ_TVA_ID.NEXTVAL, VA_IDTIPOVALOR, VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                  '         VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE, ' +
                  '         VA_NROCUOTA, VA_USUARIO FROM ' +
                  '(SELECT PV_ID VA_IDPLANVALOR, TO_NUMBER(NULL) VA_IDREMESA, VA_ID VA_IDVALOR, DECODE(VA_IDGESTORCUENTA,'''',''1'',''2'') VA_ORIGEN, ' +
                  '        TO_CHAR(VA_IDTIPOVALOR) VA_IDTIPOVALOR, PV_IMPORTE VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                  '        VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE,  ' +
                           sdqDatos.FieldByName('PC_NROCUOTA').AsString + ' VA_NROCUOTA, ''' + Sesion.UserID + ''' VA_USUARIO ' +
                  '   FROM OTV_TIPOVALOR, ZVA_VALOR, ZPV_PLANVALOR ' +
                  '  WHERE VA_ID = PV_IDVALOR ' +
                  '    AND VA_IDTIPOVALOR = TV_ID(+) ' +
                  '    AND PV_FECHABAJA IS NULL ' +
                  '    AND PV_IDPLANCUOTA IN ( SELECT PC_ID ' +
                                           '     FROM ZPC_PLANCUOTA ' +
                                           '    WHERE PC_IDPLANPAGO = ' + fIDPlanPago +
                                           '      AND PC_NROCUOTA = ' + sdqDatos.FieldByName('PC_NROCUOTA').AsString + ')' +
                  ' UNION ALL ' +
                  'SELECT PV_ID VA_IDPLANVALOR, PV_IDREMESA VA_IDREMESA, TO_NUMBER(NULL) VA_IDVALOR, ''3'' VA_ORIGEN, ' +
                  '       ''R'' VA_IDTIPOVALOR, PV_IMPORTE VA_IMPORTE, '''' VA_MOTIVORECHAZO, ' +
                  '       CB_IDBANCO VA_IDBANCO, TO_DATE(NULL) VA_VENCIMIENTO, ''04'' VA_ESTADO, '''' VA_NEGOCIABLE, NULL VA_NROCHEQUE, ' +
                          sdqDatos.FieldByName('PC_NROCUOTA').AsString + ' VA_NROCUOTA, ''' + Sesion.UserID + ''' VA_USUARIO ' +
                  '   FROM RRM_REMESA, ZPV_PLANVALOR, ZCB_CUENTABANCARIA ' +
                  '  WHERE RM_ID = PV_IDREMESA ' +
                  '    AND RM_IDCUENTABANCARIA = CB_ID ' +
                  '    AND PV_FECHABAJA IS NULL ' +
                  '    AND PV_IDPLANCUOTA IN ( SELECT PC_ID ' +
                                           '     FROM ZPC_PLANCUOTA ' +
                                           '    WHERE PC_IDPLANPAGO = ' + fIDPlanPago +
                                           '      AND PC_NROCUOTA = ' + sdqDatos.FieldByName('PC_NROCUOTA').AsString + ')' +
                  ' UNION ALL ' +
                  ' SELECT TO_NUMBER(NULL) VA_IDPLANVALOR, TO_NUMBER(NULL) VA_IDREMESA, TO_NUMBER(NULL) VA_IDVALOR, NULL VA_ORIGEN, ' +
                  '        (SELECT TO_CHAR(TV_ID) FROM OTV_TIPOVALOR WHERE TV_CODIGO=''RET'') VA_IDTIPOVALOR, PV_IMPORTE VA_IMPORTE, NULL VA_MOTIVORECHAZO, ' +
                  '        TO_NUMBER(NULL) VA_IDBANCO, TO_DATE(NULL) VA_VENCIMIENTO, NULL VA_ESTADO, NULL VA_NEGOCIABLE, CT_NUMERO VA_NROCHEQUE, ' +
                           sdqDatos.FieldByName('PC_NROCUOTA').AsString + ' VA_NROCUOTA, ''' + Sesion.UserID + ''' VA_USUARIO ' +
                  '   FROM ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR ' +
                  '  WHERE CT_ID = PV_IDCERTIFICADORETENCION ' +
                  '    AND PV_FECHABAJA IS NULL ' +
                  '    AND PV_IDPLANCUOTA IN ( SELECT PC_ID ' +
                                           '     FROM ZPC_PLANCUOTA ' +
                                           '    WHERE PC_IDPLANPAGO = ' + fIDPlanPago +
                                           '      AND PC_NROCUOTA = ' + sdqDatos.FieldByName('PC_NROCUOTA').AsString + ')' +
                  ' ))';

          EjecutarSql(sSql);
          Inc(iloop);
          sdqDatos.Next;
        end;
        //Completo el resto de los datos
        edAnticipo.Value := ToFloat(GridCuotas.Cells[4, 1]);
        edCantCuotas.Value := GridCuotas.RowCount - 2;
      end
      else
      begin
        edAnticipo.Value   := edDeudaInicial.Value * 30 / 100;
        edCantCuotas.Value := 0;

        if not CanCuotaManual(fraEmpresa.Contrato) then
          InfoHint(edAnticipo, 'El anticipo calculado es el %30 de la deuda inicial.');
      end;

      edDeudaTotal.Value := ValorSqlEx('SELECT NVL(SUM(PC_INTERESFINANC + PC_AMORTIZACION), 0)' +
      																	' FROM ZPC_PLANCUOTA' +
                                       ' WHERE PC_IDPLANPAGO = :p1', [fIDPlanPago], '0');
      edDeudaTotalLEGALES.Value := edDeudaTotal.Value;
    finally
      sdqDatos.Free;
    end;

    ActualizarGrilla;
    ActualizarBotones;
    fGenerarCuotas := False;

    if CanCuotaManual(fraEmpresa.Contrato) then
      VCLExtra.LockControls([cmbVencimiento, edCuota, edInteres], Is_ValoresCargados());

    if FechaBaja <> '' then
    begin
      BloquearControles;
      MessageDlg('El plan ha sido dado de baja, sólo puede consultarlo.', mtWarning, [mbOK], 0);
    end;
  finally
//    DetenerEspera;
  end;
end;

procedure TfrmCargaCuotas.BloquearControles;
begin
  VCLExtra.LockControls(gbCuotas, True);
  VCLExtra.LockControls(gbPago, True);
  VCLExtra.LockControls(gbToolbar, True);
  VCLExtra.LockControls(gbEstado, True);
  VCLExtra.LockControls(gbEmpresa, True);
  VCLExtra.EnableControls([tbNuevo, tbModificar, tbEliminar, tbCargarCheque, tbVerReemplazo, tbAgregarRegistro,
  												 tbModificarRegistro, tbEliminarRegistro], False);
end;

procedure TfrmCargaCuotas.GeneraCuotas;
var
  iloop, iDiasVencimiento, iDiasVencimQuincena, iDiasPrimerQuincena: Integer;
  iDiasSegundaQuincena: Integer;
  DeudaAFinanciar, CuotaAmortizada, CuotaInteres, TotalMensual, Saldo, DeudaFinal: Extended;
  Factor: Extended;
  Interes: Currency;
  VencimientoAnt, Vencimiento: TDateTime;

  function ToCurr(Valor: Extended): Extended;
  begin
    Result := ToFloat(ToStr(Valor));
  end;
begin
  fGenerarCuotas      := True;
  HuboModificacion    := True;
  GridCuotas.RowCount := edCantCuotas.Value + 2;

  Interes := edPP_TASAINTERESMENSUAL.Value / 100;
  if rbTipoVencimQuincenal.Checked then
    Interes := Interes / 2;

  //Ingreso los datos correspondientes al anticipo
  DeudaAFinanciar := fDeudaInicial - edAnticipo.Value;
  Saldo           := DeudaAFinanciar;
  Factor          := Power(1 + Interes, edCantCuotas.Value);

  //Calcula el interes de cada mes
  if Factor = 1 then
  begin
  	if edCantCuotas.Value = 0 then
    	TotalMensual := 0
    else
    	TotalMensual := ToCurr(Saldo / edCantCuotas.Value);
  end
  else
    TotalMensual := ToCurr(Saldo * Interes * Factor / (Factor - 1));

  DeudaFinal := ToCurr(edAnticipo.Value);
  for iloop := 2 to edCantCuotas.Value + 1 do
    DeudaFinal := ToCurr(DeudaFinal + TotalMensual);
  edDeudaTotal.Value := DeudaFinal;

  Saldo := ToCurr(DeudaAFinanciar);
  GridCuotas.Cells [0,1] := '0';
  GridCuotas.Cells [1,1] := DateToStr(DbDate);   // cuota 0 es la fecha del día
  GridCuotas.Cells [2,1] := ToStr(edAnticipo.Value);
  GridCuotas.Cells [3,1] := '0,00';
  GridCuotas.Cells [4,1] := ToStr(edAnticipo.Value);
  GridCuotas.Cells [5,1] := ToStr(Saldo);

  iDiasSegundaQuincena := 0;

  //ingreso los datos correspondientes a las cuotas
  for iloop := 2 to edCantCuotas.Value + 1 do
  begin
    CuotaInteres    := ToCurr(Saldo * Interes);
    CuotaAmortizada := ToCurr(TotalMensual - CuotaInteres);
    Saldo           := ToCurr(Saldo - CuotaAmortizada);

    if iloop = edCantCuotas.Value + 1 then
    begin
      //En la ultima ajusto los valores para que cierre todo...
      //Paso el excedente del saldo de la cuota al capital
      CuotaInteres    := CuotaInteres - Saldo;
      CuotaAmortizada := CuotaAmortizada + Saldo;
      Saldo           := 0;
    end;

    if iloop = 2 then
      Vencimiento := edPrimerVencimiento.Date        // cuota 1 es la fecha del primer vencimiento
    else
    begin
      VencimientoAnt := StrToDate(GridCuotas.Cells[1, iloop - 1]);
      Vencimiento    := IncMonth(VencimientoAnt, 1); // vencimiento de cuotas mensual

      if rbTipoVencimQuincenal.Checked then          // vencimiento de cuotas quincenal
      begin
        if (iloop mod 2) = 1 then
        begin
          iDiasVencimiento     := Trunc(Vencimiento - VencimientoAnt);
          iDiasPrimerQuincena  := Trunc(iDiasVencimiento / 2);
          iDiasSegundaQuincena := iDiasVencimiento - iDiasPrimerQuincena;

          iDiasVencimQuincena  := iDiasPrimerQuincena;
        end
        else
          iDiasVencimQuincena  := iDiasSegundaQuincena;

        Vencimiento :=  VencimientoAnt + iDiasVencimQuincena;
      end;
    end;

    GridCuotas.Cells [0,iloop] := IntToStr(iloop - 1);
    GridCuotas.Cells [1,iloop] := DateToStr(Vencimiento);
    GridCuotas.Cells [2,iloop] := ToStr(CuotaAmortizada);
    GridCuotas.Cells [3,iloop] := ToStr(CuotaInteres);
    GridCuotas.Cells [4,iloop] := ToStr(TotalMensual);
    GridCuotas.Cells [5,iloop] := ToStr(Saldo);
  end;
end;

function TfrmCargaCuotas.DoGuardar: Boolean;
var
  AStrings: TStringList;
  bOk: Boolean;
  bPlanConvenio: Boolean;
  bValoresCargados, bPreacuerdoConCuotasYValores: Boolean;
  eImporte: Extended;
  ePorcentajeRedondeo: Extended;
  eTotalPagos: Extended;
  iConvDlg: Integer;
  IDPlanCuota: String;
  IdZPP: TTableId;
  iLoop: Integer;
  QueryCuotas: TSDQuery;
  sSql: String;
  SqlTrans: TSql;
  sTipo: String;
  
  procedure EliminaRegistros(IdPlanCuota: String);
  var
    sSql: String;
    Query: TSDQuery;
    TipoValor: Integer;
    ExisteRegistro: Boolean;
  begin
    sSql :=
    	'SELECT *' +
       ' FROM ZPV_PLANVALOR' +
      ' WHERE PV_IDPLANCUOTA = :Id';
    Query := GetQueryEx(sSql, [IdPlanCuota]);
    try
      while not Query.Eof do
      begin
        ///////////////////////////////////////////////////
        //  Se fija si el valor existe en la TVA         //
        //  Si no existe en la TVA lo elimino de la ZPV  //
        ///////////////////////////////////////////////////
        TipoValor := StrToInt(Query.FieldByName('PV_ORIGEN').AsString);
        ExisteRegistro := False;

        case TipoValor of
          1, 2: ExisteRegistro := Is_ValoresCargados(' AND VA_IDVALOR=' + SqlValue(Query.FieldByName('PV_IDVALOR').AsInteger));
          3:   	ExisteRegistro := Is_ValoresCargados(' AND VA_IDREMESA=' + SqlValue(Query.FieldByName('PV_IDREMESA').AsInteger));
        end;

        if not ExisteRegistro then
          ABMRelacion('baja', Query, IDPlanCuota, Query.FieldByName('PV_ID').AsString, TipoValor);

        Query.Next;
      end;
    finally
      Query.Free;
    end;
  end;

  procedure ModificaAltaRegistros(IdPlanCuota: String);
  var
    sSql: String;
    Query: TSDQuery;
    TipoValor: Integer;
    Id: String;
    IDRelacion: String;
    ExisteRegistro: Boolean;
  begin
    sSql :=
    	'SELECT *' +
       ' FROM TVA_VALOR' +
      ' WHERE VA_NROCUOTA = :p1' +
      	' AND VA_USUARIO  = :p2';
    Query := GetQueryEx(sSql, [GridCuotas.Cells[0, iloop], Sesion.UserID]);
    try
      while not Query.Eof do
      begin
        TipoValor := StrToInt(Query.FieldByName('VA_ORIGEN').AsString);
        ExisteRegistro := False;

        case TipoValor of
	        1, 2:
  	      begin
    	    	Id := Query.FieldByName('VA_IDVALOR').AsString;
      	    ExisteRegistro := ExisteSqlEx('SELECT 1' +
	          															 ' FROM ZPV_PLANVALOR' +
  	                                      ' WHERE PV_IDPLANCUOTA = :p1' +
    	                                    	' AND PV_IDVALOR     = :p2', [IdPlanCuota, Id]);
      	    IDRelacion := ValorSqlEx('SELECT PV_ID' +
        	   													' FROM ZPV_PLANVALOR' +
          	                         ' WHERE PV_IDPLANCUOTA = :p1' +
            	                       	 ' AND PV_IDVALOR     = :p2', [IdPlanCuota, Id]);
	        end;
  	      3:
    	    begin
      	  	Id := Query.FieldByName('VA_IDREMESA').AsString;
        	  ExisteRegistro := ExisteSqlEx('SELECT 1' +
	          															 ' FROM ZPV_PLANVALOR' +
  	                                      ' WHERE PV_IDPLANCUOTA = :p1' +
    	                                    	' AND PV_IDREMESA    = :p2', [IdPlanCuota, Id]);
      	    IDRelacion := ValorSqlEx('SELECT PV_ID' +
        	  													' FROM ZPV_PLANVALOR' +
          	                         ' WHERE PV_IDPLANCUOTA = :p1' +
            	                       	 ' AND PV_IDREMESA    = :p2', [IdPlanCuota, Id]);
	        end;
  	    end;

    	  if ExisteRegistro then
      		ABMRelacion('modif', Query, IDPlanCuota, IDRelacion, TipoValor)
	      else
  	    	ABMRelacion('alta', Query, IDPlanCuota, '', TipoValor);

      	//Continua con el loop
	      Query.Next;
  	  end;
	  finally
  		Query.Free;
	  end;
	end;

begin
  {
  La idea general es la siguiente:
  1) Creo los registros de la ZPC si es necesario (flag)
  Por cada una de las cuotas de la ZPC:
  begin
    2) Elimino lo que está en ZPV y no esta en la TVA
    3) Modifico lo que está en ambas
    4) Doy de alta lo que está en TVA y no esta en la ZPV
  end;
  5) Actualizo el estado del plan

  Las modificaciones que se le hagan a la ZPV van a estar relacionadas con modificaciones
  en la ZVA, de acuerdo a que tipo de registro estemos tratando (normal, remesa, cheque judicial)
  }

  sTipo            := fraPP_ESTADO.Especial2;
  bValoresCargados := (sdqConsulta.Active and not sdqConsulta.eof);
  bPreacuerdoConCuotasYValores := ((sTipo = 'A') and (GridCuotas.RowCount > 0) and bValoresCargados);       // preacuerdo y tiene cuotas y valores cargados

  iConvDlg      := -1;
  bPlanConvenio := False;
  bOk           := True;

  if bPreacuerdoConCuotasYValores then   // si es preacuerdo y tiene cuotas y valores cargados
  begin
  	bPlanConvenio := ((edCantCuotas.Value > 0) or CanCuotaManual(fraEmpresa.Contrato));

    AStrings := TStringList.Create;
    try
    	if bPlanConvenio then
      begin
      	AStrings.Add('Plan');
        AStrings.Add('Convenio');
      end
      else
      	AStrings.Add('Cobro con Estado de Deuda');

      iConvDlg := SelectDlg('Convertir el Preacuerdo en ...', AStrings, 0, [soAllowCancel]);
    finally
    	AStrings.Free;
    end;

    if iConvDlg = -1 then
    	Abort   // Cancel
    else
    begin
    	if (iConvDlg = 0) and (Sesion.Sector = 'COB') then
      begin
				sSql :=
          'SELECT SUM(va_importe)' +
           ' FROM tva_valor' +
          ' WHERE va_usuario = :p1';
	      eTotalPagos := ValorSqlExtendedEx(sSql, [Sesion.UserID]);

        sSql :=
          'SELECT rp_porcredondeo / 100' +
           ' FROM zrp_redondeoplan' +
          ' WHERE rp_fechabaja IS NULL' +
            ' AND rp_sector = ''COB''';
        ePorcentajeRedondeo := ValorSqlExtended(sSql);

        if not Seguridad.Claves.IsActive('PermitirPendienteEntregaValores') then
    	  	Verificar(((edDeudaTotal.Value - eTotalPagos) > (edDeudaTotal.Value * ePorcentajeRedondeo)), GridCuotas,
          						'El plan no puede quedar pendiente de entrega de valores.');

      	for iLoop := 1 to GridCuotas.RowCount - 1 do
        begin
        	sSql :=
            'SELECT :p1 - (SELECT SUM(va_importe)' +
            							 ' FROM tva_valor' +
                          ' WHERE va_usuario = :p3' +
                          	' AND va_nrocuota = :p4)' +
             ' FROM DUAL';
					eImporte := ValorSqlExtendedEx(sSql, [ToFloat(GridCuotas.Cells[4, iLoop]), Sesion.UserID, GridCuotas.Cells[0, iLoop]]);
          if eImporte > 0 then
          begin
						sSql :=
  		        'INSERT INTO tva_valor' +
    		                 ' (va_id, va_usuario, va_nrocuota, va_origen, va_idvalor, va_tipo,' +
      		                ' va_importe, va_negociable)' +
        		      ' VALUES (seq_tva_id.NEXTVAL, :p1, :p2, 1, seq_zva_id.NEXTVAL, 6,' +
	              					' :p3, ''N'')';
  	      	EjecutarSqlSTEx(sSql, [Sesion.UserID, GridCuotas.Cells[0, iLoop], eImporte]);
          end;
        end;
			end;

    	VCLExtra.LockControls(gbCuotas, False);
      Validar_DatosCuota;
      VCLExtra.LockControls(gbCuotas, True);

      if not bPlanConvenio then     // Cobro con Estado de Deuda
      	Validar_DatosValores('E', True);
    end;
  end
  else
    Validar_DatosValores(sTipo, False);

  Validar_DatosValoresYRedondeo();

  SqlTrans := TSql.Create('ZPC_PLANCUOTA');
  Result   := True;
  BeginTrans;
  try
    try
      IdZPP := StrToInt(fIdPlanPago);

      //1) Creo los registros de la ZPC si es necesario (flag)
      if fGenerarCuotas or (CanCuotaManual(fraEmpresa.Contrato) and not Is_ValoresCargados) then
      begin
        //Elimino todos los registros actuales de la ZPV y la ZVA
        sSql :=
        	'SELECT PC_ID' +
           ' FROM ZPC_PLANCUOTA' +
          ' WHERE PC_IDPLANPAGO = :p1';
        QueryCuotas := GetQueryEx(sSql, [fIDPlanPago]);
        try
          while not QueryCuotas.Eof do
          begin
            EliminaRegistros(QueryCuotas.FieldByName('PC_ID').AsString);
            QueryCuotas.Next;
          end;
        finally
          QueryCuotas.Free;
        end;

        //Elimino todos los registros actuales de la ZPC
        sSql :=
        	'DELETE FROM ZPC_PLANCUOTA' +
               ' WHERE PC_IDPLANPAGO = :p1';
        EjecutarSqlSTEx(sSql, [fIDPlanPago]);

        //Genero los registros de la zpc_plancuota
        if GridCuotas.Cells[0, 1] <> '' then
          for iloop := 1 to GridCuotas.RowCount - 1 do
          begin
            //Ingreso el nuevo registro
            SqlTrans.TableName := 'ZPC_PLANCUOTA';
            IDPlanCuota := ValorSql('SELECT SEQ_ZPC_ID.NEXTVAL FROM DUAL');
            SqlTrans.PrimaryKey.Add ('PC_ID',       IDPlanCuota, False);
            SqlTrans.Fields.Add('PC_IDPLANPAGO',    fIDPlanPago, False);
            SqlTrans.Fields.Add('PC_NROCUOTA',      GridCuotas.Cells[0, iloop], False);
            SqlTrans.Fields.Add('PC_VENCIMIENTO',   'TO_DATE(''' + GridCuotas.Cells[1, iloop] + ''', ''dd/mm/yyyy'')', False);
            SqlTrans.Fields.Add('PC_AMORTIZACION',  GridCuotas.Cells[2, iloop], dtNumber);
            SqlTrans.Fields.Add('PC_INTERESFINANC', GridCuotas.Cells[3, iloop], dtNumber);
            SqlTrans.Fields.Add('PC_SALDO',         GridCuotas.Cells[5, iloop], dtNumber);
            SqlTrans.Fields.Add('PC_USUALTA',       Sesion.UserId);
            SqlTrans.Fields.Add('PC_FECHAALTA',     SQL_ACTUALDATE, False);
            EjecutarSqlST(SqlTrans.InsertSql);
            SqlTrans.Clear;
          end;

        if fModifCuotas and (not CanCuotaManual(fraEmpresa.Contrato) or PlanEspecial) then
        begin
          fModifCuotas := False;

          sSql := 'DEUDA.DO_VERIFICARAUTORIZACION(:idplan, :usuario);';
          EjecutarStoreSTEx(sSql, [fIDPlanPago, Sesion.UserID]);
        end;
      end;

      /////////////////////////////////////////
      //  Loopeo por cada una de las cuotas  //
      /////////////////////////////////////////
      if GridCuotas.Cells[0, 1] <> '' then
        for iloop := 1 to GridCuotas.RowCount - 1 do
        begin
          IdPlanCuota := ValorSqlEx('SELECT PC_ID' +
                                   	 ' FROM ZPC_PLANCUOTA' +
                                    ' WHERE PC_IDPLANPAGO = :p1' +
                                    	' AND PC_NROCUOTA = :p2', [fIdPlanPago, GridCuotas.Cells[0, iloop]]);

          //2) Elimino lo que está en ZPV y no esta en la TVA
          EliminaRegistros(IdPlanCuota);

          //3) Modifico lo que está en ambas
          //4) Doy de alta lo que está en TVA y no esta en la ZPV
          ModificaAltaRegistros(IdPlanCuota);
        end;

      //Actualiza el valor de la tasa de interes mensual en la tabla ZPP_PLANPAGO
      sSql :=
      	'UPDATE ZPP_PLANPAGO' +
        	' SET PP_TASAINTERESMENSUAL = :p1,' +
          		' PP_TIPOCUOTA = :p2' +
        ' WHERE PP_ID = :p3';
      EjecutarSqlSTEx(sSql, [edPP_TASAINTERESMENSUAL.Value, String(IIF(rbTipoVencimMensual.Checked, 'M', 'Q')),
      											 fIDPlanPago]);

      if bPreacuerdoConCuotasYValores then  // si es preacuerdo y tiene cuotas y valores cargados
      begin
      	if bPlanConvenio then    // Plan / Convenio / Convenio Cuota Bonificada
        begin
        	case iConvDlg of
          	0:	bOk := Do_ConvertirPreacuerdo(IdZPP, False, Sesion.UserID, 'P');   // Plan
            1:	with TfrmConvertirEnConvenio.Create(nil) do   // Convenio
                  try
                    ConTrans     := False;
                    Id           := IdZPP;
                    TipoConvenio := Iif(iConvDlg = 1, tcConvenio, tcConvenioCuotaBonif);

                    if ShowModal = mrCancel then
                      bOk := False;
                  finally
                    Free;
                  end;
          end;
        end
        else
        	bOk := Do_ConvertirPreacuerdo(IdZPP, False, Sesion.UserID, 'E');   // Cobro con estado de deuda
      end
      else
        bOk := ActualizarEstadoPlanPago(IdZPP, Sesion.UserID);


      if bOk then
      begin
        CommitTrans;

        if (fraPP_ESTADO.Codigo = '01') and (not CanCuotaManual(fraEmpresa.Contrato) or PlanEspecial) then
        begin
          sSql := 'SELECT AP_IDTRANSACCIONWEB ' +
                    'FROM ZAP_AUTORIZACIONPLAN ' +
                   'WHERE AP_IDPLAN = :IdPlan';

          if ValorSqlIntegerEx(sSql, [fIDPlanPago], ART_EMPTY_ID) <> ART_EMPTY_ID  then
            MessageDlg('Se envió un mail solicitando la autorización de este plan.', mtInformation, [mbOK], 0);
        end;

        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        HuboModificacion := False;
        Result := True;
      end
      else
      begin
        RollBack;
        Result := False;
        HuboModificacion := True;
      end
    except
    	on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + #13);
        Result := False;
      end;
    end;
  finally
    SqlTrans.Free;
  end;
end;

function TfrmCargaCuotas.ValidarGbPago(ImporteAModificar: Extended = 0): Boolean;
var
  FActual, VencimientoCuota: TDateTime;
  iDiasVencim: Integer;
begin
  FActual := DBDate;

  Verificar(fraVA_TIPO.IsEmpty, fraVA_TIPO.edCodigo, 'Debe ingresar una forma de pago.');
  Verificar((fraVA_TIPO.Codigo <> 'RED') and (edVA_IMPORTE.Value <= 0), edVA_IMPORTE, 'El importe debe ser mayor a 0.');

  VencimientoCuota := StrToDate(GridCuotas.Cells[1, StrToInt(fCuotaActual) + 1]);

  if fraVA_IDBANCO.Codigo = '014' then    // BANCO DE LA PROVINCIA DE BUENOS AIRES
    iDiasVencim := 60
  else
    iDiasVencim := 30;

  if fraVA_TIPO.Codigo = 'CHQ' then
  begin
    Verificar(fraVA_IDBANCO.IsEmpty, fraVA_IDBANCO.edCodigo, 'Si elige utilizar un cheque, debe ingresar un banco.');
    Verificar(Trim(edVA_NROCHEQUE.Text) = '', edVA_NROCHEQUE, 'Si elige utilizar un cheque, debe ingresar un número de cheque.');
  end;

  if (fraVA_TIPO.Codigo = 'CHQ') or (fraVA_TIPO.Codigo = 'PAG') then
  begin
    Verificar(cmbVA_VENCIMIENTO.IsEmpty, cmbVA_VENCIMIENTO, 'Debe ingresar la fecha de vencimiento.');
    Verificar((fraVA_TIPO.Codigo = 'CHQ') and (cmbVA_VENCIMIENTO.Date < FActual - (iDiasVencim - 1)), cmbVA_VENCIMIENTO, 'El cheque ya está vencido.');

    if not CanCuotaManual(fraEmpresa.Contrato) then    // Si no es legales..
      if Seguridad.Claves.IsActive('ValidarFVencimCheque45Dias') then
        Verificar(cmbVA_VENCIMIENTO.Date > VencimientoCuota + 45, cmbVA_VENCIMIENTO, 'La fecha de vencimiento del cheque no puede ser mayor a la fecha de vencimiento de la cuota + 45 días.');
  end;

  Result := True

  (*
  //Obtengo el importe de la base de datos
  Importe := Get_TotalValores( StrToInt( fCuotaActual ));

  //Sumo lo que quiero agregar
  Importe := RoundNumber(Importe + edVA_IMPORTE.Value - ImporteAModificar, 2);
  //Me aseguro que sea menor a la cuota
  if Importe <= ToFloat(GridCuotas.Cells[4,StrToInt(fCuotaActual)+1]) then
    Result := True
  else
    InfoHint(edVA_IMPORTE, 'La suma de los importes exceden el valor de la cuota.');
  *)
end;

procedure TfrmCargaCuotas.GridCuotasSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  ActualizarGrilla;
end;

procedure TfrmCargaCuotas.SetCuotaActual(Value: String);
begin
  fCuotaActual := Value;
  if (Value <> '') then
  begin
    sdqConsulta.SQL.Text :=
    	'SELECT VA_ID, VA_TIPO, VA_NROCUOTA, VA_IMPORTE, NVL(TVAL.TV_DESCRIPCION,''Remesa'') TIPO, VA_IDBANCO,' +
      			' VA_NEGOCIABLE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_ORIGEN, PV_IDREMESA IDREMESA, ' +
            ' DECODE(VA_ORIGEN,''1'', ''Normal'', ''2'', ''Estudio Jurídico'', ''3'', ''Remesa'') ORIGEN, VA_ESTADO,' +
            ' EST.TB_DESCRIPCION ESTADO, BA_NOMBRE, VA_IDVALOR, MRECH.TB_DESCRIPCION MOTIVORECHAZO, VA_IDPLANVALOR,' +
            ' COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_IDVALOR) NRORECIBO, RV_FECHAIMPRESION FECHAIMPRRECIBO,' +
            ' COBRANZA.GET_FECHACONCILIADO(VA_IDVALOR) FECHACONCILIADO, TVAL.TV_CODIGO CODIGOTIPOVALOR' +
       ' FROM RRV_RECIBOVALOR, ZPV_PLANVALOR, TVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR TVAL, CTB_TABLAS EST,' +
       			' CTB_TABLAS MRECH' +
      ' WHERE VA_IDBANCO = BA_ID (+)' +               
        ' AND VA_TIPO = TO_CHAR(TVAL.TV_ID (+))' +
        ' AND MRECH.TB_CLAVE(+) = ''MRECH''' +
        ' AND VA_MOTIVORECHAZO = MRECH.TB_CODIGO(+)' +
        ' AND EST.TB_CLAVE(+)= ''ESVAL''' +
        ' AND VA_ESTADO = EST.TB_CODIGO(+)' +
        ' AND VA_IDPLANVALOR = PV_ID(+)' +
        ' AND PV_IDRECIBO = RV_ID(+)' +
        ' AND VA_NROCUOTA = ' + fCuotaActual +
        ' AND VA_USUARIO = ''' + Sesion.UserID + ''' ' +
        Iif(chkSoloActivos.Checked, ' AND PV_FECHABAJA IS NULL', '');
    sdqConsulta.Open;

    LoadDynamicSortFields(SortDialog.SortFields, GridValores.Columns);
  end
  else
    sdqConsulta.Close;
end;

procedure TfrmCargaCuotas.tbAgregarRegistroClick(Sender: TObject);
var
  sSql: String;
  fAprobado: TDateTime;
begin
  Verificar(not Is_AperturaCajaIngrTesoreria(), nil, 'La fecha de la caja de tesorería es anterior a la actual.');

  if CanCuotaManual(fraEmpresa.Contrato) then
  begin
    if (iCantidadCuotas = 0) or (ToFloat(GridCuotas.Cells[5,GridCuotas.RowCount-1]) <> 0) then
      InfoHint(btnAgregarCuota, 'Debe completar la carga de cuotas para poder cargar los valores.', True);

    if PlanEspecial then
      Verificar(fraPP_ESTADO.Codigo = '01', nil, 'El preacuerdo no se encuentra aprobado.');
  end
  else
    begin
      if not Is_ValoresCargados() then
        Do_Validar_CalcularCuotas(False);

      Verificar(fraPP_ESTADO.Codigo = '01', nil, 'El preacuerdo no se encuentra aprobado.');

      if GridCuotas.Row = 1 then
        begin
          sSql := 'SELECT PP_FECHAAPROBADO ' +
                    'FROM ZPP_PLANPAGO ' +
                   'WHERE PP_ID = :IdPlan';
          fAprobado := ValorSqlDateTimeEx(sSql, [fIDPlanPago]);

          Verificar(cmbVA_VENCIMIENTO.Date > CalcDiasHabiles(fAprobado, 6), nil, 'El anticipo no puede ser posterior a la fecha de aprobado + 6 días hábiles.');
        end;
    end;

  if ValidarGbPago then
    DoGuardarRegistro('alta');
end;

procedure TfrmCargaCuotas.tbModificarRegistroClick(Sender: TObject);
begin
  if Validar_DatosCuota and Validar_Valor() and ValidarGbPago(sdqConsulta.FieldByName('VA_IMPORTE').AsFloat) and
  	(MsgBox('¿ Está usted seguro de querer modificar este registro ?', MB_YESNO) = mrYes) then
  	DoGuardarRegistro('modif');
end;

procedure TfrmCargaCuotas.DoGuardarRegistro(Modo: String; IsJuridico: Boolean = False);
var
  SqlTrans: TSql;
begin
  // Validación WF 4648
  if modo = 'alta' then
  begin
  	Verificar(ExisteSQLEx('SELECT 1' +
                           ' FROM tva_valor' +
                          ' WHERE va_usuario = :p1' +
                          	' AND va_nrocheque = :p2' +
                          	' AND va_idbanco = :p3', [Sesion.UserID, edVA_NROCHEQUE.Text, fraVA_IDBANCO.Value]),
    					edVA_NROCHEQUE,
              'El cheque ya ha sido asignado a otra cuota.');

		Verificar(ExisteSQLEx('SELECT 1' +
                           ' FROM zva_valor' +
                          ' WHERE va_nrocheque = :p1' +
                          	' AND va_idbanco = :p2', [edVA_NROCHEQUE.Text, fraVA_IDBANCO.Value]),
    					edVA_NROCHEQUE,
              'El cheque ya ha sido asignado.');
  end;

  if modo = 'modif' then
    Verificar(ExisteSQLEx('SELECT 1' +
                        	 ' FROM tva_valor' +
                        	' WHERE va_nrocheque = :p1' +
		                        ' AND va_idbanco = :p2' +
  		                      ' AND va_usuario = :p3' +
    		                    ' AND va_id <> :p4', [edVA_NROCHEQUE.Text, fraVA_IDBANCO.Value, Sesion.UserID,
                            											sdqConsulta.FieldByName('VA_ID').AsString]),
              edVA_NROCHEQUE,
              'El cheque está asociado a otra cuota');
  // Validación WF 4648

  //Agrega un registro a la TABLA TEMPORAL
  SqlTrans := TSql.Create('TVA_VALOR');
  try
    try
      BeginTrans;
      if modo = 'baja' then
      begin
        SqlTrans.PrimaryKey.Add('VA_ID', sdqConsulta.FieldByName('VA_ID').AsString, False);
        SqlTrans.SqlType := stDelete;
      end
      else
      begin
        if modo = 'alta' then
        begin
          SqlTrans.SqlType := stInsert;
          SqlTrans.PrimaryKey.Add('VA_ID', 'SEQ_TVA_ID.NEXTVAL', False);
        end
        else if modo = 'modif' then
        begin
          SqlTrans.SqlType := stUpdate;
          SqlTrans.PrimaryKey.Add('VA_ID', sdqConsulta.FieldByName('VA_ID').AsString, False);
        end;

        SqlTrans.Fields.Add('VA_USUARIO',  Sesion.UserID);
        SqlTrans.Fields.Add('VA_IDREMESA', 'NULL', False);
        SqlTrans.Fields.Add('VA_NROCUOTA', fCuotaActual, False);

        //Con esto guarda los cheques provenientes de estudios juridicos
        if IsJuridico then
        begin
          SqlTrans.Fields.Add('VA_ORIGEN',      '2');
          SqlTrans.Fields.Add('VA_IDVALOR',     sdqCheques.FieldByName('VA_ID').AsString);
          SqlTrans.Fields.Add('VA_TIPO',        sdqCheques.FieldByName('VA_IDTIPOVALOR').AsInteger);
          SqlTrans.Fields.Add('VA_IMPORTE',     edMontoADeducir.Text, dtNumber);
          SqlTrans.Fields.Add('VA_ESTADO',      sdqCheques.FieldByName('VA_ESTADO').AsString);

          //Correspondiente a Cheque y pagaré
          SqlTrans.Fields.Add('VA_VENCIMIENTO', sdqCheques.FieldByName('VA_VENCIMIENTO').AsDateTime);
          if not sdqCheques.FieldByName('VA_IDBANCO').isnull then
          begin
          	SqlTrans.Fields.Add('VA_IDBANCO',     sdqCheques.FieldByName('VA_IDBANCO').AsString, False);
            SqlTrans.Fields.Add('VA_NROCHEQUE',   sdqCheques.FieldByName('VA_NROCHEQUE').AsString, False);
          end;
          SqlTrans.Fields.Add('VA_NEGOCIABLE',  sdqCheques.FieldByName('VA_NEGOCIABLE').AsString);
        end
        else
        begin
          SqlTrans.Fields.Add('VA_ORIGEN',  '1');
          SqlTrans.Fields.Add('VA_IDVALOR', 'SEQ_ZVA_ID.NEXTVAL', False);
          SqlTrans.Fields.Add('VA_TIPO', 		fraVA_TIPO.Value);
          SqlTrans.Fields.Add('VA_IMPORTE', edVA_IMPORTE.Text, dtNumber);

          if (fraVA_TIPO.Codigo<>'RED') and (fraVA_TIPO.Codigo<>'BON') then
            SqlTrans.Fields.Add('VA_ESTADO', '01');

          //Correspondiente a Cheque y pagaré
          if fraVA_TIPO.Codigo = 'CHQ' then
          begin
            SqlTrans.Fields.Add('VA_IDBANCO', 		fraVA_IDBANCO.Value);
            SqlTrans.Fields.Add('VA_VENCIMIENTO', cmbVA_VENCIMIENTO.Date);
            SqlTrans.Fields.Add('VA_NROCHEQUE', 	edVA_NROCHEQUE.Text, dtNumber);
            if chkNegociable.checked then
              SqlTrans.Fields.Add('VA_NEGOCIABLE', 'S')
            else
              SqlTrans.Fields.Add('VA_NEGOCIABLE', 'N');
          end
          else if fraVA_TIPO.Codigo = 'PAG' then //Pagaré
          begin
            SqlTrans.Fields.Add('VA_VENCIMIENTO', cmbVA_VENCIMIENTO.Date);
            SqlTrans.Fields.Add('VA_IDBANCO', 		'NULL', False);
            SqlTrans.Fields.Add('VA_NROCHEQUE', 	'NULL', False);
            SqlTrans.Fields.Add('VA_NEGOCIABLE', 	'N');
          end
          else
          begin
            SqlTrans.Fields.Add('VA_IDBANCO', 'NULL', False);
            SqlTrans.Fields.Add('VA_VENCIMIENTO', 'NULL', False);
            SqlTrans.Fields.Add('VA_NROCHEQUE', 'NULL', False);
            SqlTrans.Fields.Add('VA_NEGOCIABLE', 'N');
          end;
        end;
      end;

      EjecutarSqlST(SqlTrans.Sql);
      CommitTrans;
      HuboModificacion := True;

      VCLExtra.LockControls(gbCuotas, Is_BloquearCargaCuotas() or Is_ValoresCargados());   // si hay valores cargados, para que no puedan cambiar nada de la grilla de cuotas
    except
      on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + #13);
      end;
    end;
  finally
    SqlTrans.Free;
  end;

  //Actualizo el Query y limpio los campos
  ClearGbPago;
end;

procedure TfrmCargaCuotas.tbEliminarRegistroClick(Sender: TObject);
begin
  if Validar_Valor() and (MsgBox('¿ Está usted seguro de querer eliminar este registro ?', MB_YESNO) = mrYes) then
    DoGuardarRegistro('baja');
end;

procedure TfrmCargaCuotas.ActualizarGrilla;
var
  Fila: Integer;
begin
  Fila := GridCuotas.Row;
  
  if (Fila > 0) then
    CuotaActual := GridCuotas.Cells[0, Fila]
  else
    CuotaActual := '';

  if ToFloat(GridCuotas.Cells[4, Fila]) > 0 then
    edVA_IMPORTE.Value := ToFloat(GridCuotas.Cells[4, Fila]);

  if Is_FechaValida(GridCuotas.Cells[1, Fila]) then
    cmbVA_VENCIMIENTO.Date := StrToDate(GridCuotas.Cells[1, Fila]);
end;

procedure TfrmCargaCuotas.ActualizarBotones;
var
  Habilitar: Boolean;
begin
  VCLExtra.LockControls(gbEstado, True);
  //Si el estado no es preacuerdo no se puede modificar las cuotas
  VCLExtra.LockControls(gbCuotas, Is_BloquearCargaCuotas() or Is_ValoresCargados());
  VCLExtra.LockControls([edDeudaInicial, edDeudaTotal], True);

  VCLExtra.LockControls([edDeudaInicialLEGALES, edDeudaTotalLEGALES], True);

  //Se fija si el plan se encuentra en un estado en que se pueda modificar registros
  if fraPP_ESTADO.Especial1 = 'S' then
    Habilitar := True
  else
    Habilitar := False;

  //Decido si le permito agregar registros
  Habilitar := Habilitar and (edCantCuotas.Value >= 0);
  VCLExtra.LockControls(gbPago, not Habilitar);
  VCLExtra.EnableControls([tbAgregarRegistro, tbModificarRegistro, tbEliminarRegistro, tbCargarCheque], Habilitar);
  CambiarModoPago(nil);
end;

procedure TfrmCargaCuotas.GridCuotasClick(Sender: TObject);
begin
  ActualizarGrilla;
end;

procedure TfrmCargaCuotas.GridValoresDblClick(Sender: TObject);
begin
	with sdqConsulta do
	  if Active and not Eof then
  	begin
	    fraVA_TIPO.Value       := FieldByName('VA_TIPO').AsInteger;
  	  edVA_IMPORTE.Value     := FieldByName('VA_IMPORTE').AsFloat;
	    fraVA_IDBANCO.Value    := FieldByName('VA_IDBANCO').AsInteger;
  	  edVA_NROCHEQUE.Text    := FieldByName('VA_NROCHEQUE').AsString;
	    cmbVA_VENCIMIENTO.Date := FieldByName('VA_VENCIMIENTO').AsDateTime;
    	chkNegociable.Checked  := (FieldByName('VA_NEGOCIABLE').AsString = 'S');
  	  CambiarModoPago(nil);
	  end;
end;

procedure TfrmCargaCuotas.GridValoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																									 Highlight: Boolean);
var
  bEsRedondeo: Boolean;
begin
  inherited;

  if sdqConsulta.Active and not sdqConsulta.eof then
  begin
  	bEsRedondeo := (sdqConsulta.FieldByName('CODIGOTIPOVALOR').AsString = 'RED');

    if (sdqConsulta.FieldByName('VA_ESTADO').AsString = '03') or (sdqConsulta.FieldByName('VA_ESTADO').AsString = '05') then
    	AFont.Color := clRed
    else if ((bEsRedondeo and (fraPP_ESTADO.Especial1 = 'N')) or (not bEsRedondeo and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01') or not sdqConsulta.FieldByName('FECHAIMPRRECIBO').IsNull)) then
    	AFont.Color := clGray;
  end;
end;

procedure TfrmCargaCuotas.tbVerReemplazoClick(Sender: TObject);
begin
  //Consulta de valores rechazados y reemplazados
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir al menos un registro.');
  Verificar((sdqConsulta.FieldByName('VA_ESTADO').AsString <> '03') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '05') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '07'), nil, 'El estado debe ser rechazado, reemplazado o reemplazado parcial.');
  MostrarAdic;
end;

procedure TfrmCargaCuotas.MostrarAdic;
begin
  frmVerReemplazos.Free;
  frmVerReemplazos := TfrmVerReemplazos.Create(Self);
  frmVerReemplazos.Preparar(sdqConsulta.FieldByName('VA_IDVALOR').AsInteger);
end;

procedure TfrmCargaCuotas.btnCancelar2Click(Sender: TObject);
begin
  fpCheques.ModalResult := mrCancel;
end;

procedure TfrmCargaCuotas.tbCargarChequeClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  sSql :=
  	'SELECT VA_ID, TV_DESCRIPCION TIPO, VA_IMPORTE, BA_NOMBRE, VA_VENCIMIENTO, VA_NEGOCIABLE, VA_NROCHEQUE,' +
    			' VA_IDTIPOVALOR, VA_IDBANCO, VA_ESTADO' +
     ' FROM ZVA_VALOR, OTV_TIPOVALOR, ZBA_BANCO' +
    ' WHERE VA_IDGESTORCUENTA = :p1' +
    	' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND VA_IDBANCO = BA_ID(+)' +
      ' AND VA_ESTADO = ''01''';

  OpenQueryEx(sdqCheques, [fIDEstudio], sSql);
  
  //Setea los controles para mostrar la pantalla
  edMontoADeducir.Value := 0;
  VCLExtra.LockControls([edMontoDisponible], True);

  if fpCheques.ShowModal = mrOk then
    DoGuardarRegistro('alta', True);
end;

procedure TfrmCargaCuotas.btnAceptar2Click(Sender: TObject);
var
  Validar: Boolean;
  CantRegistros: Integer;
  sSQL: String;
begin
  Validar := True;
  Verificar(edMontoADeducir.Value <= 0, edMontoADeducir, 'El monto a deducir debe ser superior a cero.');
  Verificar((edMontoDisponible.Value < edMontoADeducir.Value), edMontoADeducir, 'El monto a deducir no puede ser mayor al monto disponible.');

  sSQL := 'SELECT 1 ' +
            'FROM ZPV_PLANVALOR ' +
           'WHERE PV_IDVALOR = :VALOR ' +
             'AND PV_IDPLANCUOTA IN ( SELECT PC_ID ' +
                                       'FROM ZPC_PLANCUOTA ' +
                                      'WHERE PC_IDPLANPAGO = :PLAN ) ' +
          ' UNION ' +
          'SELECT 1 ' +
            'FROM TVA_VALOR ' +
           'WHERE VA_IDVALOR = :VALOR ' +
             'AND VA_USUARIO = :USER';

  Verificar(ExisteSQLEx(sSQL, [sdqCheques.FieldByName('VA_ID').AsInteger,
                               StrToInt(fIDPlanPago),
                               sdqCheques.FieldByName('VA_ID').AsInteger,
                               Sesion.UserID]), btnAceptar2, 'El cheque seleccionado ya ha sido asociado parcialmente a otra couta del mismo plan de pago.');

  //Me fijo que sea el unico agregado
  CantRegistros := ValorSqlEx('SELECT COUNT(*)' +
                            	 ' FROM TVA_VALOR' +
                            	' WHERE VA_IDVALOR  = :p1' +
                            		' AND VA_NROCUOTA = :p2' +
                            		' AND VA_USUARIO = :p3', [sdqCheques.FieldByName('VA_ID').AsString, fCuotaActual,
                                													Sesion.UserID]);
  Verificar(CantRegistros <> 0, btnAceptar2, 'El valor ya ha sido agregado a esta cuota.');

  (*
  //Obtengo el importe de la base de datos
  Importe := Get_TotalValores( StrToInt( fCuotaActual ));
  //Sumo lo que quiero agregar
  Importe := Importe + edMontoADeducir.Value;
  //Me aseguro que sea menor a la cuota
  Verificar(Importe > ToFloat(GridCuotas.Cells[4,StrToInt(fCuotaActual)+1]), btnAceptar2, 'La suma de importes exceden el valor de la cuota.');
  *)

  if Validar then
    fpCheques.ModalResult := mrOk;
end;

procedure TfrmCargaCuotas.sdqChequesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ActualizarMontoDisponible;
end;

procedure TfrmCargaCuotas.ActualizarMontoDisponible;
var
  MontoUtilizado: Double;
begin
  if sdqCheques.Active and not sdqCheques.IsEmpty then
  begin
    MontoUtilizado := ValorSqlEx('SELECT NVL(SUM(PV_IMPORTE), 0)' +
                                	' FROM ZPV_PLANVALOR' +
                                 ' WHERE PV_IDVALOR = :p1' +
                                	 ' AND PV_IDPLANCUOTA NOT IN (SELECT PC_ID' +
                                                            		' FROM ZPC_PLANCUOTA' +
                                                            	 ' WHERE PC_IDPLANPAGO = :p2)',
                                 [sdqCheques.FieldByName('VA_ID').AsString, fIdPlanPago]);

    MontoUtilizado := MontoUtilizado + ValorSqlEx('SELECT NVL(SUM(VA_IMPORTE), 0)' +
                                                 	 ' FROM TVA_VALOR' +
                                                 	' WHERE VA_IDVALOR = :p1' +
                                                 		' AND VA_USUARIO = :p2',
                                                  [sdqCheques.FieldByName('VA_ID').AsString, Sesion.UserID]);

    edMontoDisponible.Value := sdqCheques.FieldByName('VA_IMPORTE').AsFloat - MontoUtilizado;
  end
  else
    edMontoDisponible.Value := 0;
end;

procedure TfrmCargaCuotas.ABMRelacion(TipoABM: String; Query: TSDQuery; IDPlanCuota, IDRelacion: String; TipoValor: Integer);
var
  SqlRelacion, SqlValor: TSql;
begin
  SqlRelacion := TSql.Create('ZPV_PLANVALOR');
  SqlValor    := TSql.Create('ZVA_VALOR');
  try
    //De acuerdo al tipo de registro se comporta de forma diferente
    //los tipos son Valor normal, Cheque Judicial y Remesa
    ////////////
    //  ALTA  //
    ////////////
    if TipoABM = 'alta' then
    begin
      //Creo la relacion en la ZPV_PLANVALOR
      SqlRelacion.SqlType := stInsert;
      SqlRelacion.PrimaryKey.Add('PV_ID',      'SEQ_ZPV_ID.NEXTVAL', False);
      SqlRelacion.Fields.Add('PV_IDPLANCUOTA', IDPlanCuota, False);
      SqlRelacion.Fields.Add('PV_IMPORTE',     Query.FieldByName('VA_IMPORTE').AsString, dtNumber);
      SqlRelacion.Fields.Add('PV_ORIGEN',      Query.FieldByName('VA_ORIGEN').AsString);
      SqlRelacion.Fields.Add('PV_USUALTA',     Sesion.UserID);
      SqlRelacion.Fields.Add('PV_FECHAALTA',   'ACTUALDATE', False);
      //Id correspondiente
      if (TipoValor = 1) or (TipoValor = 2) then
        SqlRelacion.Fields.Add('PV_IDVALOR',  Query.FieldByName('VA_IDVALOR').AsString, False)
      else
        SqlRelacion.Fields.Add('PV_IDREMESA', Query.FieldByName('VA_IDREMESA').AsString, False);
      EjecutarSqlST( SqlRelacion.Sql );

      if TipoValor = 1 then
      begin
        SqlValor.SqlType := stInsert;
        SqlValor.PrimaryKey.Add('VA_ID',         Query.FieldByName('VA_IDVALOR').AsString, False);
        SqlValor.Fields.Add('VA_IDCONTRATO',     fraEmpresa.edContrato.Text);
        SqlValor.Fields.Add('VA_IDTIPOVALOR',    Query.FieldByName('VA_TIPO').AsInteger);
        SqlValor.Fields.Add('VA_IMPORTE',        Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_IMPOSINIMPUTAR', Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_ESTADO',         Query.FieldByName('VA_ESTADO').AsString);

        if Query.FieldByName('VA_TIPO').AsString = '3' then
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  Query.FieldByName('VA_VENCIMIENTO').AsDateTime);
          SqlValor.Fields.Add('VA_NROCHEQUE',    Query.FieldByName('VA_NROCHEQUE').AsInteger);
          SqlValor.Fields.Add('VA_IDBANCO',      Query.FieldByName('VA_IDBANCO').AsInteger);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   Query.FieldByName('VA_NEGOCIABLE').AsString);
        end
        else if Query.FieldByName('VA_TIPO').AsString = '2' then
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  Query.FieldByName('VA_VENCIMIENTO').AsDateTime);
          SqlValor.Fields.Add('VA_NROCHEQUE',    'NULL', False);
          SqlValor.Fields.Add('VA_IDBANCO',      'NULL', False);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   'N');
        end
        else
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  'NULL', False);
          SqlValor.Fields.Add('VA_NROCHEQUE',    'NULL', False);
          SqlValor.Fields.Add('VA_IDBANCO',      'NULL', False);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   'N');
        end;

        SqlValor.Fields.Add('VA_USUALTA',        Sesion.UserID);
        SqlValor.Fields.Add('VA_FECHAALTA',      'ACTUALDATE', False);
        EjecutarSqlST( SqlValor.Sql );
      end;
    end;

    ////////////////////
    //  Modificacion  //
    ////////////////////
    if TipoABM = 'modif' then
    begin
      //modifico la relacion en la ZPV_PLANVALOR
      SqlRelacion.SqlType := stUpdate;
      SqlRelacion.PrimaryKey.Add('PV_ID',      IDRelacion, False);
      SqlRelacion.Fields.Add('PV_IMPORTE',     Query.FieldByName('VA_IMPORTE').AsString, dtNumber);
      SqlRelacion.Fields.Add('PV_USUMODIF',    Sesion.UserID);
      SqlRelacion.Fields.Add('PV_FECHAMODIF',  'ACTUALDATE', False);
      EjecutarSqlST(SqlRelacion.Sql);

      if TipoValor = 1 then
      begin
        SqlValor.SqlType := stUpdate;
        SqlValor.PrimaryKey.Add('VA_ID',         Query.FieldByName('VA_IDVALOR').AsString, False);
        SqlValor.Fields.Add('VA_IDCONTRATO',     fraEmpresa.edContrato.Text);
        SqlValor.Fields.Add('VA_IDTIPOVALOR',    Query.FieldByName('VA_TIPO').AsInteger);
        SqlValor.Fields.Add('VA_IMPORTE',        Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_IMPOSINIMPUTAR', Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_ESTADO',         Query.FieldByName('VA_ESTADO').AsString);

        if Query.FieldByName('VA_TIPO').AsString = '3' then
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  Query.FieldByName('VA_VENCIMIENTO').AsDateTime);
          SqlValor.Fields.Add('VA_NROCHEQUE',    Query.FieldByName('VA_NROCHEQUE').AsInteger);
          SqlValor.Fields.Add('VA_IDBANCO',      Query.FieldByName('VA_IDBANCO').AsInteger);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   Query.FieldByName('VA_NEGOCIABLE').AsString);
        end
        else if Query.FieldByName('VA_TIPO').AsString = '2' then
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  Query.FieldByName('VA_VENCIMIENTO').AsDateTime);
          SqlValor.Fields.Add('VA_NROCHEQUE',    'NULL', False);
          SqlValor.Fields.Add('VA_IDBANCO',      'NULL', False);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   'N');
        end
        else
        begin
          SqlValor.Fields.Add('VA_VENCIMIENTO',  'NULL', False);
          SqlValor.Fields.Add('VA_NROCHEQUE',    'NULL', False);
          SqlValor.Fields.Add('VA_IDBANCO',      'NULL', False);
          SqlValor.Fields.Add('VA_NEGOCIABLE',   'N');
        end;
        SqlValor.Fields.Add('VA_USUMODIF',       Sesion.UserID);
        SqlValor.Fields.Add('VA_FECHAMODIF',     'ACTUALDATE', False);
        EjecutarSqlST( SqlValor.Sql );
      end;
    end;

    ////////////
    //  BAJA  //
    ////////////
    if TipoABM = 'baja' then
    begin
      //elimino la relacion en la ZPV_PLANVALOR
      SqlRelacion.SqlType := stDelete;
      SqlRelacion.PrimaryKey.Add('PV_ID', IDRelacion, False);
      EjecutarSqlST(SqlRelacion.Sql);

      if (TipoValor = 1) and (not Query.FieldByName('PV_IDVALOR').IsNull) then
      begin
        SqlValor.SqlType := stDelete;
        SqlValor.PrimaryKey.Add('VA_ID',  Query.FieldByName('PV_IDVALOR').AsInteger, False);
        EjecutarSqlST(SqlValor.Sql);
      end;
    end;

  finally
    SqlValor.Free;
    SqlRelacion.Free;
  end;
end;

procedure TfrmCargaCuotas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

function TfrmCargaCuotas.Do_GrabarAntesImpresion: Boolean;
var
  bImprime: Boolean;
begin
  bImprime := False;

  if not HuboModificacion then
    bImprime := True
  else
    if msgbox('Debe grabar las modificaciones efectuadas para imprimir el reporte, desea hacerlo?', MB_YESNO) = mrYes then
    begin
      DoGuardar;
      bImprime := True;
    end;

  Result := bImprime;
end;

procedure TfrmCargaCuotas.mnuImprimirPlanClick(Sender: TObject);
var
  Tipo: String;
begin
  if Do_GrabarAntesImpresion then
  begin
    Tipo := fraPP_ESTADO.Especial2;

    if Tipo = 'E' then
      InfoHint(nil, 'No puede imprimir cuando se trata de un Cobro con Estado de Deuda.', True)
    else
    begin
      if (Tipo = 'C') or (Tipo = 'B') then   // convenio - convenio cuota bonificada
      begin
        //Se trata de un convenio
        with TQrConvenio.Create(Self) do
        begin
          Preparar(fIDPlanPago);
          Free;
        end;
      end;

      with TfrmQrPlanFinanciamiento.Create(Self) do
      begin
        Preparar(fIDPlanPago);
        Free;
      end;
    end;
  end;
end;

procedure TfrmCargaCuotas.mnuImprimirEstadodeCuentaClick(Sender: TObject);
begin
  if Do_GrabarAntesImpresion then
    with TfrmQrEstadoCuenta.Create(Self) do
    begin
      Preparar(fIDPlanPago);
      Free;
    end;
end;

procedure TfrmCargaCuotas.GridCuotasGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont;
																									var AAlignment: TAlignment; var Background: TColor;
                                                  Highlight: Boolean);
begin
  inherited;

  if ACol in [2..5] then  // columnas de importes
    AAlignment := taRightJustify;
end;

procedure TfrmCargaCuotas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
  	TFloatField(sdqConsulta.FieldByName('VA_IMPORTE')).DisplayFormat := '#,##0.00';
end;

procedure TfrmCargaCuotas.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

procedure TfrmCargaCuotas.mnuImprimirReciboClick(Sender: TObject);
begin
  DoReImprimirRecibosPlan(StrToInt(fIdPlanPago));
end;

function TfrmCargaCuotas.Get_TotalValores(Cuota: Integer = -1): Currency;
var
  Importe: Currency;
begin
  Importe := ValorSqlExtendedEx('SELECT NVL(SUM(VA_IMPORTE), 0)' +
	                               ' FROM TVA_VALOR' +
                               	' WHERE 1 = 1' +
                                 	IIF(Cuota = -1, '',
                                	' AND VA_NROCUOTA = ' + SqlValue(Cuota)) +
                                 	' AND VA_USUARIO = :p1', [Sesion.UserID]);

  Result := RoundNumber(Importe, 2)
end;

function TfrmCargaCuotas.Get_MinFechaPrimerVencimiento: TDateTime;
var
  MinFechaPrimerVenc, FActual: TDateTime;
begin
  FActual := DBDate;

  if rbTipoVencimMensual.Checked then
    MinFechaPrimerVenc := IncMonth(FActual, 1)
  else
    MinFechaPrimerVenc := FActual + 15;

  Result := MinFechaPrimerVenc;
end;

function TfrmCargaCuotas.Is_ValoresCargados(CondicionExtra: String = ''): Boolean;
var
  sSql: String;
begin
  sSql :=
  	'SELECT 1' +
     ' FROM TVA_VALOR' +
    ' WHERE VA_USUARIO = ' + SqlValue(Sesion.UserID) + ' ' +
    	CondicionExtra;

  Result := ExisteSql(sSql);
end;

procedure TfrmCargaCuotas.Do_BorrarValores;
var
  sSql: String;
begin
  sSql :=
  	'DELETE FROM TVA_VALOR' +
    		 ' WHERE VA_USUARIO = :p1';

  EjecutarSqlEx(sSql, [Sesion.UserID]);
end;

function TfrmCargaCuotas.Is_BloquearCargaCuotas: Boolean;
begin
  Result := ((fraPP_ESTADO.Especial2 <> 'A') or (fraPP_ESTADO.Codigo = Get_CodPreacuerdoAprobado()));
end;

function TfrmCargaCuotas.Validar_Valor: Boolean;
var
  bEsRedondeo: Boolean;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');

  bEsRedondeo := (sdqConsulta.FieldByName( 'CODIGOTIPOVALOR').AsString = 'RED');

  Verificar(bEsRedondeo and (fraPP_ESTADO.Especial1 = 'N'), nil, 'No se puede modificar el redondeo.');
  Verificar(not bEsRedondeo and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01'), nil, 'El valor ha sido ingresado en tesorería.');
  Verificar(not bEsRedondeo and not sdqConsulta.FieldByName('FECHAIMPRRECIBO').IsNull, nil, 'El valor ya ha sido impreso en un recibo.');

  Result := True;
end;

procedure TfrmCargaCuotas.Validar_DatosValores(Tipo: String; EsAlta: Boolean);
var
  bFaltaCargarValores: Boolean;
begin
  if Tipo = 'E' then   // Cobro con Estado de Deuda Cancelado
  begin
  	Verificar(EsAlta and sdqConsulta.Eof, GridValores, 'Debe cargar los valores.');
    bFaltaCargarValores := (CompareFloat2(Get_TotalValores(), edDeudaInicial.Value) <> 0);
    Verificar((EsAlta and bFaltaCargarValores) or (not EsAlta and (not sdqConsulta.Eof) and bFaltaCargarValores), GridValores, 'La suma de los valores debe ser igual a la deuda inicial.');
  end;
end;

function TfrmCargaCuotas.Validar_DatosCuota: Boolean;
begin
  if not CanCuotaManual(fraEmpresa.Contrato) then
  begin
    if edCantCuotas.Value > 0 then   // plan / convenio
      Verificar(edAnticipo.Value >= edDeudaInicial.Value, edAnticipo, 'El anticipo debe ser menor a la deuda inicial.')
    else
    begin                          // Cobro con estado de deuda
    	Verificar(edPP_TASAINTERESMENSUAL.Value <> 0, edPP_TASAINTERESMENSUAL, 'Si la cantidad de cuotas es 0, la T.E.M. debe ser igual a 0.');
      Verificar(edAnticipo.Value <> edDeudaInicial.Value, edAnticipo, 'Si la cantidad de cuotas es 0, el anticipo debe ser igual a la deuda inicial.');
    end;
  end;

  Result := True;
end;

procedure TfrmCargaCuotas.btnAgregarCuotaClick(Sender: TObject);
var
  fSaldo: Extended;
  iRow: Integer;
begin
  fSaldo := fDeudaInicial;

  for iRow := 1 to GridCuotas.RowCount - 1 do
    fSaldo := fSaldo - ToFloat(GridCuotas.Cells[2, iRow]);

  fSaldo := fSaldo - edCuota.Value;

  Verificar(cmbVencimiento.IsEmpty, cmbVencimiento, 'Debe ingresar la fecha de vencimiento.');
  Verificar(CompareFloat2(fSaldo, 0) < 0, edCuota, 'Con el valor de la cuota ingresada se supera la deuda inicial.');

//  if (iCantidadCuotas = 0) and (CompareFloat(fSaldo, 0) = 0) then
//    if edInteres.Value > 0 then
//      InfoHint(edInteres, 'Si el monto de la cuota es igual al total de la deuda, el pago no puede tener intereses.', True);

  if iCantidadCuotas > 0 then
  begin
    Verificar(StrToDate(GridCuotas.Cells [1,GridCuotas.RowCount - 1]) >= cmbVencimiento.Date, cmbVencimiento, 'La fecha de vencimiento debe ser posterior a la última ingresada.');
    GridCuotas.RowCount := GridCuotas.RowCount + 1;
  end;

  GridCuotas.Cells [0,GridCuotas.RowCount - 1] := IntToStr(GridCuotas.RowCount - 2);
  GridCuotas.Cells [1,GridCuotas.RowCount - 1] := DateToStr(cmbVencimiento.Date);
  GridCuotas.Cells [2,GridCuotas.RowCount - 1] := ToStr(edCuota.Value);
  GridCuotas.Cells [3,GridCuotas.RowCount - 1] := ToStr(edInteres.Value);
  GridCuotas.Cells [4,GridCuotas.RowCount - 1] := ToStr(edCuota.Value + edInteres.Value);
  GridCuotas.Cells [5,GridCuotas.RowCount - 1] := ToStr(fSaldo);
  Inc(iCantidadCuotas);
  CuotaActual := IntToStr(iCantidadCuotas - 1);

  edDeudaTotalLEGALES.Value := edDeudaTotalLEGALES.Value + edCuota.Value + edInteres.Value;
  btnQuitarCuota.Enabled := True;
  fGenerarCuotas := True;

  if not fModifCuotas and PlanEspecial then
    fModifCuotas := True;
end;

procedure TfrmCargaCuotas.btnQuitarCuotaClick(Sender: TObject);
begin
  if iCantidadCuotas > 0 then
  begin
    Dec(iCantidadCuotas);

    edDeudaTotalLEGALES.Value := edDeudaTotalLEGALES.Value - ToFloat(GridCuotas.Cells [4,GridCuotas.RowCount - 1]);

    GridCuotas.Cells[0,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[1,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[2,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[3,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[4,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[5,GridCuotas.RowCount - 1] := '';

    if iCantidadCuotas > 0 then
      GridCuotas.RowCount := GridCuotas.RowCount - 1
    else
      btnQuitarCuota.Enabled := False;
  end else
    InfoHint(btnQuitarCuota, 'No quedan cuotas para quitar.');
end;

function TfrmCargaCuotas.CanCuotaManual(Contrato: Integer): Boolean;
begin
  Result := Is_SectorLegal() or PlanEspecial;
end;

function TfrmCargaCuotas.Validar_RedondeoTotal: Boolean;
var
  sSql: String;
  dTotalRedondeos, dPorcRedondeo, dDeudaTotal: Currency;
begin
  sSql :=
  	'SELECT NVL(SUM(VA_IMPORTE), 0)' +
     ' FROM OTV_TIPOVALOR, TVA_VALOR' +
    ' WHERE VA_USUARIO = :p1' +
    	' AND VA_TIPO = TV_ID' +
      ' AND VA_TIPO <> ''R''' +   // Remesa
      ' AND TV_CODIGO = ''RED''';  // Redondeo
  dTotalRedondeos := ValorSqlExtendedEx(sSql, [Sesion.UserID]);

  dPorcRedondeo := Get_RedondeoPlanPago(Sesion.Sector);

  if gbCuotasLEGALES.Visible then
    dDeudaTotal := edDeudaTotalLEGALES.Value
  else
    dDeudaTotal := edDeudaTotal.Value;

  Result := (Abs(dTotalRedondeos) <= RoundNumber(dDeudaTotal * dPorcRedondeo / 100, 2));
end;

procedure TfrmCargaCuotas.Validar_ImportesCuota;
var
  Importe: Currency;
  iloop, iCuotaActual: Integer;
begin
  if GridCuotas.Cells[0, 1] <> '' then
  begin
  	for iloop := 1 to GridCuotas.RowCount - 1 do
    begin
    	iCuotaActual := StrToInt(GridCuotas.Cells[0, iloop]);

      //Obtengo el importe de la base de datos
      Importe := Get_TotalValores(iCuotaActual);

      //Me aseguro que sea mayor o igual a 0
      Verificar(Importe < 0, GridValores, 'La suma de los importes de los valores de la cuota ' + IntToStr(iCuotaActual) + ' es menor a 0.');

      //Me aseguro que sea menor a la cuota
      if Is_ValidarTotalCuota(fraEmpresa.Contrato) then
      	Verificar(CompareFloat2(Importe, ToFloat(GridCuotas.Cells[4, iCuotaActual + 1] )) > 0, GridValores, 'La suma de los importes de los valores exceden el valor de la cuota ' + IntToStr(iCuotaActual) + '.');
    end;
  end;
end;

procedure TfrmCargaCuotas.Validar_DatosValoresYRedondeo;
begin
  Validar_ImportesCuota();
  Validar_RedondeoCuota();
  Verificar(not Validar_RedondeoTotal(), GridValores, 'Los redondeos cargados superan el porcentaje máximo permitido sobre la deuda final.');
end;

procedure TfrmCargaCuotas.Validar_RedondeoCuota;
var
  sSql: String;
  iNroCuota: Integer;
  dTotalRedondeosCuota, dPorcRedondeoCuota, dTotalCuota: Currency;
begin
  dPorcRedondeoCuota := Get_RedondeoCuotaPlanPago( Sesion.Sector );

  sSql :=
  	'SELECT VA_NROCUOTA NROCUOTA, NVL(SUM(VA_IMPORTE), 0) TOTREDCUOTA' +
     ' FROM OTV_TIPOVALOR, TVA_VALOR' +
    ' WHERE VA_USUARIO = :p1' +
    	' AND VA_TIPO = TV_ID' +
      ' AND VA_TIPO <> ''R''' +     // Remesa
      ' AND TV_CODIGO = ''RED''' +  // Redondeo
 ' GROUP BY VA_NROCUOTA';

  with GetQueryEx(sSql, [Sesion.UserID]) do
  try
  	while not Eof do
    begin
    	iNroCuota            := FieldByName('NROCUOTA').AsInteger;
      dTotalRedondeosCuota := FieldByName('TOTREDCUOTA').AsFloat;;

      dTotalCuota := ToFloat(GridCuotas.Cells[4, iNroCuota + 1]);

      Verificar(Abs(dTotalRedondeosCuota ) > RoundNumber(dTotalCuota * dPorcRedondeoCuota / 100, 2), GridValores, 'Los redondeos cargados para la cuota ' + IntToStr( iNroCuota ) + ' superan el porcentaje máximo permitido sobre el total de la cuota.');

      Next;
    end;
  finally
  	Free;
  end;
end;

function TfrmCargaCuotas.Is_ValidarTotalCuota(Contrato: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
  	'SELECT 1' +
     ' FROM ZEP_EXCLUIRVALIDACIONPLAN' +
    ' WHERE EP_CONTRATO = :iContrato';

  Result := not ExisteSqlEx(sSql, [Contrato]);
end;

procedure TfrmCargaCuotas.chkSoloActivosClick(Sender: TObject);
begin
  SetCuotaActual(fCuotaActual);
end;

function TfrmCargaCuotas.VerificarPreacuerdoConValores(IDPlanPago: TTableId): Boolean;
begin
  Result := ExisteSqlEx('SELECT 1 ' +
                          'FROM CTB_TABLAS, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
                         'WHERE PC_IDPLANPAGO=PP_ID ' +
                           'AND PV_IDPLANCUOTA=PC_ID ' +
                           'AND PP_ID=:PPID ' +
                           'AND PV_FECHABAJA IS NULL ' + 
                           'AND TB_CLAVE=''ESPLA'' ' +
                           'AND TB_CODIGO=PP_ESTADO ' +
                           'AND TB_ESPECIAL2=''A''', [IDPlanPago]);
end;

procedure TfrmCargaCuotas.SetPlanEspecial(const Value: Boolean);
begin
  if fPlanEspecial <> Value then
    begin
      fPlanEspecial := Value;

      tbSepObservaciones.Visible := fPlanEspecial;
      tbObservaciones.Visible    := fPlanEspecial;
    end;
end;

procedure TfrmCargaCuotas.tbObservacionesClick(Sender: TObject);
var
  sObservac: String;
begin
  sObservac := GetObservacionesPlan(StrToInt(fIDPlanPago));
  MsgBox(sObservac, MB_ICONINFORMATION, 'Observaciones');
end;

end.

