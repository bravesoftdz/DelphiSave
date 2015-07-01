unit unCargaCuotasLeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  Mask, PatternEdit, CardinalEdit, ToolEdit, CurrEdit, DateComboBox, StaticGrid, unArtFrame, unArt,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDbFrame, unFraEmpresa, IntEdit, FormPanel, Menus,
  unArtDBAwareFrame, SortDlg, unFraTrabajador, unFraTrabajadorSiniestro,
  unFraCodigoDescripcion, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmCargaCuotasLeg = class(TfrmCustomPanelABM)
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
    SortDialog: TSortDialog;
    mnuImprimirRecibo: TMenuItem;
    Panel1: TPanel;
    gbEmpresa: TGroupBox;
    Label11: TLabel;
    fraEmpresaNormal: TfraEmpresa;
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
    gbCuotasLEGALES: TGroupBox;
    Label20: TLabel;
    lblNroLEGALES: TLabel;
    btnAgregarCuota: TButton;
    edDeudaTotalLEGALES: TCurrencyEdit;
    btnQuitarCuota: TButton;
    cmbVencimiento: TDateComboBox;
    Label16: TLabel;
    edCuota: TCurrencyEdit;
    Label17: TLabel;
    chkSoloActivos: TCheckBox;
    ToolButton5: TToolButton;
    fraTrabajadorSin: TfraTrabajadorSiniestro;
    gbEstado: TGroupBox;
    fraXP_ESTADO: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    Label2: TLabel;
    edDeudaInicialLEGALES: TCurrencyEdit;
    fraVA_TIPO: TfraCodigoDescripcion;
    gbEmpDeudora: TGroupBox;
    fraEmpresaDeudora: TfraEmpresa;
    lbCuit: TLabel;
    gbConcepto: TGroupBox;
    fraXP_CONCEPTO: TfraStaticCTB_TABLAS;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
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
    procedure GridCuotasGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;	var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure mnuImprimirReciboClick(Sender: TObject);
    procedure btnAgregarCuotaClick(Sender: TObject);
    procedure btnQuitarCuotaClick(Sender: TObject);
    procedure chkSoloActivosClick(Sender: TObject);
    function Validar_RedondeoTotal: Boolean;
    procedure Validar_RedondeoCuota;
    procedure tbNuevoClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
  private
    iCantidadCuotas: Integer;
    fCuotaActual: String;
    fDeudaInicial: Extended;
    fIDPlanPago: String;
    fGenerarCuotas: Boolean;
    HuboModificacion: Boolean;
    fOldDecimalSeparator, fOldThousandSeparator: Char;

    function CanCuotaManual(): Boolean;
    function Do_GrabarAntesImpresion: Boolean;
    function DoGuardar: Boolean;
    function Get_TotalValores(Cuota: Integer = -1): Currency;
    function Is_ValoresCargados(CondicionExtra: String = ''): Boolean;
    function Validar_Valor: Boolean;
    function ValidarGbPago(ImporteAModificar: Extended = 0): Boolean;
    function VerificarPreacuerdoConValores(IDPlanPago: TTableId): Boolean;
    procedure ABMRelacion(TipoABM: String; Query: TSDQuery; IDPlanCuota, IDRelacion: String; TipoValor: Integer);
    procedure ActualizarBotones;
    procedure ActualizarGrilla;
    procedure ActualizarMontoDisponible;
    procedure CambiarModoPago(Sender: TObject);
    procedure ClearGbPago;
    procedure DoGuardarRegistro(Modo: String; IsRecupero: Boolean = False);
    procedure Do_BorrarValores;
    procedure MostrarAdic;
    procedure SetCuotaActual(Value: String);
    procedure Validar_DatosValoresYRedondeo;
    procedure Validar_ImportesCuota;

    property CuotaActual: String read fCuotaActual write SetCuotaActual;
  protected
    procedure BloquearControles; //No uso LockControls porque LockControls es llamada en otros lados por herencia
  public
    procedure DoCargar(IDPlanPago: String);
  end;

var
  frmCargaCuotasLeg: TfrmCargaCuotasLeg;

implementation

uses
  unPrincipal, unVerReemplazos, VCLExtra, AnsiSql, strFuncs, DateTimeFuncs, undmPrincipal,
  SqlFuncs, Math, CustomDlgs, unQrPlanFinanciamientoLeg, unComunes, unLegales, Numeros,
  unqrImpresionRecibo, General, unSesion, unEspera, unCobranzas;

{$R *.DFM}

procedure TfrmCargaCuotasLeg.ClearGbPago;
begin
  fraVA_TIPO.Clear;
  edVA_IMPORTE.Clear;
  fraVA_IDBANCO.Clear;
  edVA_NROCHEQUE.Clear;
  cmbVA_VENCIMIENTO.Clear;

  sdqConsulta.Refresh;
end;

procedure TfrmCargaCuotasLeg.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HuboModificacion then
    if MsgBox('No grabó las modificaciones efectuadas. ¿ Desea hacerlo ahora ?', MB_YESNO) = mrYes then
      if not DoGuardar then Exit;

  Verificar(VerificarPreacuerdoConValores(StrToInt(fIDPlanPago)), nil, 'El preacuerdo actual posee valores cargados - Comuníquese por favor con Sistemas');

  inherited;

  frmCargaCuotasLeg := nil;
  Action := caFree;
end;

procedure TfrmCargaCuotasLeg.CambiarModoPago(Sender: TObject);
var
  bHabilitarVencimiento: Boolean;
begin
  bHabilitarVencimiento := ((fraVA_TIPO.Codigo = 'CHQ') or (fraVA_TIPO.Codigo = 'PAG'));

  VCLExtra.LockControls([fraVA_IDBANCO, edVA_NROCHEQUE, cmbVA_VENCIMIENTO, chkNegociable], (fraVA_TIPO.Codigo <> 'CHQ'));
  VCLExtra.LockControls([cmbVA_VENCIMIENTO], not bHabilitarVencimiento);

  if not bHabilitarVencimiento then
    cmbVA_VENCIMIENTO.Clear;
end;

procedure TfrmCargaCuotasLeg.FSFormCreate(Sender: TObject);
begin
  fOldDecimalSeparator  := DecimalSeparator;
  fOldThousandSeparator := ThousandSeparator;
  DecimalSeparator      := ',';
  ThousandSeparator     := '.';

  gbCuotasLEGALES.Align   := alLeft;
  iCantidadCuotas         := 0;
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

  fraXP_ESTADO.Clave   := 'ESPLR';
  fraXP_CONCEPTO.Clave := 'LCPRS';

  fraEmpresaNormal.ShowBajas := True;
  fraTrabajadorSin.ShowBajas := True;

  with fraEmpresaDeudora do
    begin
      Sql :=
        'SELECT ED_ID AS '           + EMP_ALIAS_ID                 + ', ' +
               'ED_CUIT AS '         + EMP_ALIAS_CUIT               + ', ' +
               'ED_NOMBRE AS '       + EMP_ALIAS_NOMBRE             + ', ' +
               'NULL AS '            + EMP_ALIAS_CONTRATO           + ', ' +
               'NULL AS '            + EMP_ALIAS_CODREG             + ', ' +
               'TO_NUMBER(NULL) AS ' + EMP_ALIAS_CONTRATOEXT        + ', ' +
               'TO_NUMBER(NULL) AS ' + EMP_ALIAS_IDTIPOREGIMEN_ORIG + ', ' +
               'ED_FECHABAJA AS '    + EMP_ALIAS_BAJA               + ', ' +
               'NULL '               + EMP_ALIAS_VIP                + ', ' +
               'DECODE(ED_FECHABAJA, NULL, 1, 2) ' + EMP_ALIAS_COBERTURA + ', ' +
               'NULL '               + EMP_ALIAS_ORDEN              + ' ' +
          'FROM RED_EMPDEUDORA '  +
         'WHERE 1 = 1 ' ;

      FieldID     := 'ED_ID';
      FieldCUIT   := 'ED_CUIT';
      FieldNombre := 'ED_NOMBRE';
      FieldBaja   := 'ED_FECHABAJA';

      ShowBajas := True;
    end;

  CuotaActual := '';
end;

procedure TfrmCargaCuotasLeg.DoCargar(IDPlanPago: String);
var
  sSql: String;
  iloop: Integer;
  sdqDatos: TSDQuery;
  FechaBaja: String;
  SqlResults: TStringList;
  IdEmpDeudora, IdExped: TTableId;
begin
  HuboModificacion := False;

  lblNroLEGALES.Caption := 'Nº ' + IDPlanPago;
  fIdPlanPago           := IdPlanPago;

  SqlResults := ValoresColSql('SELECT EX_ID, XP_ESTADO, XP_IMPORTE, XP_FECHABAJA, XP_IDEMPDEUDORA, XP_CONCEPTO  ' +
                                'FROM SEX_EXPEDIENTES, LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN ' +
                               'WHERE XP_ID = ' + fIdPlanPago + ' ' +
                                 'AND XP_IDRECUPEROSINIESTRO = RS_ID ' +
                                 'AND RS_SINIESTRO = EX_SINIESTRO ' +
                                 'AND RS_ORDEN = EX_ORDEN ' +
                                 'AND EX_RECAIDA = 0');
  try
    //Carga el numero de contrato
    if SqlResults[0] <> '' then
      IdExped := StrToInt(SqlResults[0])
    else
      IdExped := ART_EMPTY_ID;
    fraTrabajadorSin.IdExpediente := IdExped;
    fraEmpresaNormal.Contrato     := fraTrabajadorSin.Contrato;
    VCLExtra.LockControls([fraEmpresaNormal, fraTrabajadorSin, fraEmpresaDeudora], True);

    gbCuotasLEGALES.Visible := True;

    //carga el estado del plan
    if SqlResults[1] <> '' then
      fraXP_ESTADO.Value := SqlResults[1]
    else
      fraXP_ESTADO.Clear;

    fraVA_TIPO.ExtraCondition := 'AND TV_CODIGO <> ''BON''';

    //Carga los valores de las deudas
    if SqlResults[2] <> '' then
      fDeudaInicial := ToFloat(SqlResults[2])
    else
      fDeudaInicial := 0;

    edDeudaInicialLEGALES.Value := fDeudaInicial;

    //Carga la fecha de baja si es que tiene
    FechaBaja := SqlResults[3];

    if SqlResults[4] <> '' then
      IdEmpDeudora := StrToInt(SqlResults[4])
    else
      IdEmpDeudora := ART_EMPTY_ID;
    fraEmpresaDeudora.Value := IdEmpDeudora;

    //carga el concepto del plan
    if SqlResults[5] <> '' then
      fraXP_CONCEPTO.Value := SqlResults[5]
    else
      fraXP_CONCEPTO.Clear;
  finally
    SqlResults.Free;
  end;

  //Recupero de la base de datos si corresponde
  //Copio los registros reales a las tablas temporales para poder manipularlos en el formulario
  //Registros en ZVA_VALOR
  Do_BorrarValores;

  //Obtengo los registros
  sSql :=
    'SELECT XC_NROCUOTA, XC_VENCIMIENTO, XC_IMPORTE, XC_SALDO' +
     ' FROM LXC_RECUPEROCUOTA' +
    ' WHERE XC_IDPLANPAGO = :p1' +
 ' ORDER BY XC_NROCUOTA';
  sdqDatos := GetQueryEx(sSql, [fIDPlanPago]);
  try
    if not sdqDatos.Eof then
    begin
      GridCuotas.RowCount := sdqDatos.RecordCount + 1;
      iloop := 1;
      iCantidadCuotas := sdqDatos.RecordCount;

      while not sdqDatos.Eof do
      begin
        GridCuotas.Cells[0, iloop] := sdqDatos.FieldByName('XC_NROCUOTA').AsString;
        GridCuotas.Cells[1, iloop] := sdqDatos.FieldByName('XC_VENCIMIENTO').AsString;
        GridCuotas.Cells[2, iloop] := ToStr(sdqDatos.FieldByName('XC_IMPORTE').AsFloat);
        GridCuotas.Cells[3, iloop] := ToStr(sdqDatos.FieldByName('XC_SALDO').AsFloat);

        sSql := 'INSERT INTO TVA_VALOR (VA_IDPLANVALOR, VA_IDREMESA, VA_IDVALOR, VA_ORIGEN, ' +
                '       VA_ID, VA_TIPO, VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                '       VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE, '+
                '       VA_NROCUOTA, VA_USUARIO) ' +
                '(SELECT  VA_IDPLANVALOR, VA_IDREMESA, VA_IDVALOR, VA_ORIGEN, ' +
                '         SEQ_TVA_ID.NEXTVAL, VA_IDTIPOVALOR, VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                '         VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE, ' +
                '         VA_NROCUOTA, VA_USUARIO FROM ' +
                '(SELECT XV_ID VA_IDPLANVALOR, TO_NUMBER(NULL) VA_IDREMESA, VA_ID VA_IDVALOR, VA_ORIGEN, ' +
                '        TO_CHAR(VA_IDTIPOVALOR) VA_IDTIPOVALOR, XV_IMPORTE VA_IMPORTE, VA_MOTIVORECHAZO, ' +
                '        VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE, VA_NROCHEQUE,  ' +
                         sdqDatos.FieldByName('XC_NROCUOTA').AsString + ' VA_NROCUOTA, ''' + Sesion.UserID + ''' VA_USUARIO ' +
                '   FROM OTV_TIPOVALOR, ZVA_VALOR, LXV_RECUPEROVALOR ' +
                '  WHERE VA_ID = XV_IDVALOR ' +
                '    AND VA_IDTIPOVALOR = TV_ID(+) ' +
                '    AND XV_FECHABAJA IS NULL ' +
                '    AND XV_IDCUOTA IN ( SELECT XC_ID ' +
                                     '     FROM LXC_RECUPEROCUOTA ' +
                                     '    WHERE XC_IDPLANPAGO = ' + fIDPlanPago +
                                     '      AND XC_NROCUOTA = ' + sdqDatos.FieldByName('XC_NROCUOTA').AsString + ')' +
                ' ))';

        EjecutarSql(sSql);
        Inc(iloop);
        sdqDatos.Next;
      end;
    end;

    edDeudaTotalLEGALES.Value := ValorSqlEx('SELECT NVL(SUM(XC_IMPORTE), 0)' +
                                             ' FROM LXC_RECUPEROCUOTA' +
                                            ' WHERE XC_IDPLANPAGO = :p1', [fIDPlanPago], '0');
  finally
    sdqDatos.Free;
  end;

  ActualizarGrilla;
  ActualizarBotones;
  fGenerarCuotas := False;

  if CanCuotaManual() then
    VCLExtra.LockControls([cmbVencimiento, edCuota], Is_ValoresCargados());

  if FechaBaja <> '' then
  begin
    BloquearControles;
    MessageDlg('El plan ha sido dado de baja, sólo puede consultarlo.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmCargaCuotasLeg.BloquearControles;
begin
  VCLExtra.LockControls([gbPago, gbToolbar, gbEstado, gbConcepto, gbEmpresa, gbEmpDeudora], True);
  VCLExtra.EnableControls([tbNuevo, tbModificar, tbEliminar, tbCargarCheque, tbVerReemplazo, tbAgregarRegistro,
  												 tbModificarRegistro, tbEliminarRegistro], False);
end;

function TfrmCargaCuotasLeg.DoGuardar: Boolean;
var
  AStrings: TStringList;
  bOk: Boolean;
  bPlanConvenio: Boolean;
  bValoresCargados, bPreacuerdoConCuotasYValores: Boolean;
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
    ExisteRegistro: Boolean;
  begin
    sSql :=
    	'SELECT *' +
       ' FROM LXV_RECUPEROVALOR' +
      ' WHERE XV_IDCUOTA = :Id';
    Query := GetQueryEx(sSql, [IdPlanCuota]);
    try
      while not Query.Eof do
      begin
        ///////////////////////////////////////////////////
        //  Se fija si el valor existe en la TVA         //
        //  Si no existe en la TVA lo elimino de la ZPV  //
        ///////////////////////////////////////////////////
        ExisteRegistro := Is_ValoresCargados(' AND VA_IDVALOR=' + SqlValue(Query.FieldByName('XV_IDVALOR').AsInteger));

        if not ExisteRegistro then
          ABMRelacion('baja', Query, IDPlanCuota, Query.FieldByName('XV_ID').AsString, 1);

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
        TipoValor := StrToInt(NVL(Query.FieldByName('VA_ORIGEN').AsString, '1'));
        ExisteRegistro := False;

        case TipoValor of
	        1, 2:
  	      begin
    	    	Id := Query.FieldByName('VA_IDVALOR').AsString;
      	    ExisteRegistro := ExisteSqlEx('SELECT 1' +
	          															 ' FROM LXV_RECUPEROVALOR' +
  	                                      ' WHERE XV_IDCUOTA = :p1' +
    	                                    	' AND XV_IDVALOR = :p2', [IdPlanCuota, Id]);
      	    IDRelacion := ValorSqlEx('SELECT XV_ID' +
        	   													' FROM LXV_RECUPEROVALOR' +
          	                         ' WHERE XV_IDCUOTA = :p1' +
            	                       	 ' AND XV_IDVALOR = :p2', [IdPlanCuota, Id]);
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

  sTipo            := fraXP_ESTADO.Especial2;
  bValoresCargados := (sdqConsulta.Active and not sdqConsulta.eof);
  bPreacuerdoConCuotasYValores := ((sTipo = 'A') and (GridCuotas.RowCount > 0) and bValoresCargados);       // preacuerdo y tiene cuotas y valores cargados

  iConvDlg      := -1;
  bPlanConvenio := False;
  bOk           := True;

  if bPreacuerdoConCuotasYValores then   // si es preacuerdo y tiene cuotas y valores cargados
  begin
  	bPlanConvenio := (CanCuotaManual());

    AStrings := TStringList.Create;
    try
    	if bPlanConvenio then
      	AStrings.Add('Plan');

      iConvDlg := SelectDlg('Convertir el Preacuerdo en ...', AStrings, 0, [soAllowCancel]);
    finally
    	AStrings.Free;
    end;

    if iConvDlg = -1 then
    	Abort;   // Cancel
  end;

  Validar_DatosValoresYRedondeo();

  SqlTrans := TSql.Create('LXC_RECUPEROCUOTA');
  Result   := True;
  BeginTrans;
  try
    try
      IdZPP := StrToInt(fIdPlanPago);

      //1) Creo los registros de la ZPC si es necesario (flag)
      if fGenerarCuotas or (CanCuotaManual() and not Is_ValoresCargados) then
      begin
        //Elimino todos los registros actuales de la ZPV y la ZVA
        sSql :=
        	'SELECT XC_ID' +
           ' FROM LXC_RECUPEROCUOTA' +
          ' WHERE XC_IDPLANPAGO = :p1';
        QueryCuotas := GetQueryEx(sSql, [fIDPlanPago]);
        try
          while not QueryCuotas.Eof do
          begin
            EliminaRegistros(QueryCuotas.FieldByName('XC_ID').AsString);
            QueryCuotas.Next;
          end;
        finally
          QueryCuotas.Free;
        end;

        //Elimino todos los registros actuales de la ZPC
        sSql :=
        	'DELETE FROM LXC_RECUPEROCUOTA' +
               ' WHERE XC_IDPLANPAGO = :p1';
        EjecutarSqlSTEx(sSql, [fIDPlanPago]);

        //Genero los registros de la zpc_plancuota
        if GridCuotas.Cells[0, 1] <> '' then
          for iloop := 1 to GridCuotas.RowCount - 1 do
          begin
            //Ingreso el nuevo registro
            SqlTrans.TableName := 'LXC_RECUPEROCUOTA';
            IDPlanCuota := ValorSql('SELECT SEQ_LXC_ID.NEXTVAL FROM DUAL');
            SqlTrans.PrimaryKey.Add ('XC_ID',       IDPlanCuota, False);
            SqlTrans.Fields.Add('XC_IDPLANPAGO',    fIDPlanPago, False);
            SqlTrans.Fields.Add('XC_NROCUOTA',      GridCuotas.Cells[0, iloop], False);
            SqlTrans.Fields.Add('XC_VENCIMIENTO',   'TO_DATE(''' + GridCuotas.Cells[1, iloop] + ''', ''dd/mm/yyyy'')', False);
            SqlTrans.Fields.Add('XC_IMPORTE',       GridCuotas.Cells[2, iloop], dtNumber);
            SqlTrans.Fields.Add('XC_SALDO',         GridCuotas.Cells[3, iloop], dtNumber);
            SqlTrans.Fields.Add('XC_USUALTA',       Sesion.UserId);
            SqlTrans.Fields.Add('XC_FECHAALTA',     SQL_ACTUALDATE, False);
            EjecutarSqlST(SqlTrans.InsertSql);
            SqlTrans.Clear;
          end;
      end;

      /////////////////////////////////////////
      //  Loopeo por cada una de las cuotas  //
      /////////////////////////////////////////
      if GridCuotas.Cells[0, 1] <> '' then
        for iloop := 1 to GridCuotas.RowCount - 1 do
        begin
          IdPlanCuota := ValorSqlEx('SELECT XC_ID' +
                                   	 ' FROM LXC_RECUPEROCUOTA' +
                                    ' WHERE XC_IDPLANPAGO = :p1' +
                                    	' AND XC_NROCUOTA = :p2', [fIdPlanPago, GridCuotas.Cells[0, iloop]]);

          //2) Elimino lo que está en ZPV y no esta en la TVA
          EliminaRegistros(IdPlanCuota);

          //3) Modifico lo que está en ambas
          //4) Doy de alta lo que está en TVA y no esta en la ZPV
          ModificaAltaRegistros(IdPlanCuota);
        end;

      if bPreacuerdoConCuotasYValores then  // si es preacuerdo y tiene cuotas y valores cargados
      begin
      	if bPlanConvenio then    // Plan
        begin
        	case iConvDlg of
          	0:	bOk := Do_ConvertirPreacuerdoRec(IdZPP, False, Sesion.UserID, 'P');   // Plan
          end;
        end;
      end
      else
        bOk := ActualizarEstadoPlanPagoRec(IdZPP, Sesion.UserID);

      if bOk then
      begin
        CommitTrans;

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

function TfrmCargaCuotasLeg.ValidarGbPago(ImporteAModificar: Extended = 0): Boolean;
var
  FActual: TDateTime;
  iDiasVencim: Integer;
begin
  FActual := DBDate;

  Verificar(fraVA_TIPO.IsEmpty, fraVA_TIPO.edCodigo, 'Debe ingresar una forma de pago.');
  Verificar((fraVA_TIPO.Codigo <> 'RED') and (edVA_IMPORTE.Value <= 0), edVA_IMPORTE, 'El importe debe ser mayor a 0.');

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
  end;

  Result := True
end;

procedure TfrmCargaCuotasLeg.GridCuotasSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  ActualizarGrilla;
end;

procedure TfrmCargaCuotasLeg.SetCuotaActual(Value: String);
begin
  fCuotaActual := Value;
  if (Value <> '') then
  begin
    sdqConsulta.SQL.Text :=
    	'SELECT VA_ID, VA_TIPO, VA_NROCUOTA, VA_IMPORTE, NVL(TVAL.TV_DESCRIPCION,''Remesa'') TIPO, VA_IDBANCO,' +
      			' VA_NEGOCIABLE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_ORIGEN, NULL IDREMESA, ' +
            ' DECODE(VA_ORIGEN,''1'', ''Normal'', ''2'', ''Recupero'', ''3'', ''Remesa'') ORIGEN, VA_ESTADO,' +
            ' EST.TB_DESCRIPCION ESTADO, BA_NOMBRE, VA_IDVALOR, MRECH.TB_DESCRIPCION MOTIVORECHAZO, VA_IDPLANVALOR,' +
            ' COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_IDVALOR) NRORECIBO, RV_FECHAIMPRESION FECHAIMPRRECIBO,' +
            ' COBRANZA.GET_FECHACONCILIADO(VA_IDVALOR) FECHACONCILIADO, TVAL.TV_CODIGO CODIGOTIPOVALOR' +
       ' FROM RRV_RECIBOVALOR, LXV_RECUPEROVALOR, TVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR TVAL, CTB_TABLAS EST,' +
       			' CTB_TABLAS MRECH' +
      ' WHERE VA_IDBANCO = BA_ID (+)' +
        ' AND VA_TIPO = TO_CHAR(TVAL.TV_ID (+))' +
        ' AND MRECH.TB_CLAVE(+) = ''MRECH''' +
        ' AND VA_MOTIVORECHAZO = MRECH.TB_CODIGO(+)' +
        ' AND EST.TB_CLAVE(+)= ''ESVAL''' +
        ' AND VA_ESTADO = EST.TB_CODIGO(+)' +
        ' AND VA_IDPLANVALOR = XV_ID(+)' +
        ' AND XV_IDRECIBO = RV_ID(+)' +
        ' AND VA_NROCUOTA = ' + fCuotaActual +
        ' AND VA_USUARIO = ''' + Sesion.UserID + ''' ' +
        Iif(chkSoloActivos.Checked, ' AND XV_FECHABAJA IS NULL', '');
    sdqConsulta.Open;

    LoadDynamicSortFields(SortDialog.SortFields, GridValores.Columns);
  end
  else
    sdqConsulta.Close;
end;

procedure TfrmCargaCuotasLeg.tbAgregarRegistroClick(Sender: TObject);
begin
  Verificar(not Is_AperturaCajaIngrTesoreria(), nil, 'La fecha de la caja de tesorería es anterior a la actual.');

  if CanCuotaManual() then
  begin
    if (iCantidadCuotas = 0) or (ToFloat(GridCuotas.Cells[3,GridCuotas.RowCount-1]) <> 0) then
      InfoHint(btnAgregarCuota, 'Debe completar la carga de cuotas para poder cargar los valores.', True);
  end;

  if ValidarGbPago then
    DoGuardarRegistro('alta');
end;

procedure TfrmCargaCuotasLeg.tbModificarRegistroClick(Sender: TObject);
begin
  if Validar_Valor() and ValidarGbPago(sdqConsulta.FieldByName('VA_IMPORTE').AsFloat) and
  	(MsgBox('¿ Está usted seguro de querer modificar este registro ?', MB_YESNO) = mrYes) then
  	DoGuardarRegistro('modif');
end;

procedure TfrmCargaCuotasLeg.DoGuardarRegistro(Modo: String; IsRecupero: Boolean = False);
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
        if IsRecupero then
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

procedure TfrmCargaCuotasLeg.tbEliminarRegistroClick(Sender: TObject);
begin
  if Validar_Valor() and (MsgBox('¿ Está usted seguro de querer eliminar este registro ?', MB_YESNO) = mrYes) then
    DoGuardarRegistro('baja');
end;

procedure TfrmCargaCuotasLeg.ActualizarGrilla;
var
  Fila: Integer;
begin
  Fila := GridCuotas.Row;

  if (Fila > 0) then
    CuotaActual := GridCuotas.Cells[0, Fila]
  else
    CuotaActual := '';

  if Is_FechaValida(GridCuotas.Cells[1, Fila]) then
    cmbVA_VENCIMIENTO.Date := StrToDate(GridCuotas.Cells[1, Fila]);
end;

procedure TfrmCargaCuotasLeg.ActualizarBotones;
var
  Habilitar: Boolean;
begin
  VCLExtra.LockControls([gbEstado, gbConcepto, edDeudaInicialLEGALES, edDeudaTotalLEGALES], True);

  //Se fija si el plan se encuentra en un estado en que se pueda modificar registros
  if fraXP_ESTADO.Especial1 = 'S' then
    Habilitar := True
  else
    Habilitar := False;

  //Decido si le permito agregar registros
  VCLExtra.LockControls(gbPago, not Habilitar);
  VCLExtra.EnableControls([tbAgregarRegistro, tbModificarRegistro, tbEliminarRegistro, tbCargarCheque], Habilitar);
  CambiarModoPago(nil);
end;

procedure TfrmCargaCuotasLeg.GridCuotasClick(Sender: TObject);
begin
  ActualizarGrilla;
end;

procedure TfrmCargaCuotasLeg.GridValoresDblClick(Sender: TObject);
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

procedure TfrmCargaCuotasLeg.GridValoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
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
    else if ((bEsRedondeo and (fraXP_ESTADO.Especial1 = 'N')) or (not bEsRedondeo and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01') or not sdqConsulta.FieldByName('FECHAIMPRRECIBO').IsNull)) then
    	AFont.Color := clGray;
  end;
end;

procedure TfrmCargaCuotasLeg.tbVerReemplazoClick(Sender: TObject);
begin
  //Consulta de valores rechazados y reemplazados
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir al menos un registro.');
  Verificar((sdqConsulta.FieldByName('VA_ESTADO').AsString <> '03') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '05') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '07'), nil, 'El estado debe ser rechazado, reemplazado o reemplazado parcial.');
  MostrarAdic;
end;

procedure TfrmCargaCuotasLeg.MostrarAdic;
begin
  frmVerReemplazos.Free;
  frmVerReemplazos := TfrmVerReemplazos.Create(Self);
  frmVerReemplazos.Preparar(sdqConsulta.FieldByName('VA_IDVALOR').AsInteger);
end;

procedure TfrmCargaCuotasLeg.btnCancelar2Click(Sender: TObject);
begin
  fpCheques.ModalResult := mrCancel;
end;

procedure TfrmCargaCuotasLeg.tbCargarChequeClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  sSql :=
  	'SELECT VA_ID, TV_DESCRIPCION TIPO, VA_IMPORTE, BA_NOMBRE, VA_VENCIMIENTO, VA_NEGOCIABLE, VA_NROCHEQUE,' +
    			' VA_IDTIPOVALOR, VA_IDBANCO, VA_ESTADO' +
     ' FROM ZVA_VALOR, OTV_TIPOVALOR, ZBA_BANCO' +
    ' WHERE VA_IDEMPDEUDORA = ' + SqlValue(fraEmpresaDeudora.Value) +
    	' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND VA_IDBANCO = BA_ID(+)' +
      ' AND VA_ESTADO = ''01'' ' +
      ' AND VA_IDCONCEPTOVALOR = ' + SqlValue(IDCONCEPTOVALOR_RECUPEROSIN);
  OpenQuery(sdqCheques, sSql);
  
  //Setea los controles para mostrar la pantalla
  edMontoADeducir.Value := 0;
  VCLExtra.LockControls([edMontoDisponible], True);

  if fpCheques.ShowModal = mrOk then
    DoGuardarRegistro('alta', True);
end;

procedure TfrmCargaCuotasLeg.btnAceptar2Click(Sender: TObject);
var
  Validar: Boolean;
  CantRegistros: Integer;
  sSQL: String;
begin
  Validar := True;
  Verificar(edMontoADeducir.Value <= 0, edMontoADeducir, 'El monto a deducir debe ser superior a cero.');
  Verificar((edMontoDisponible.Value < edMontoADeducir.Value), edMontoADeducir, 'El monto a deducir no puede ser mayor al monto disponible.');

  sSQL := 'SELECT 1 ' +
            'FROM LXV_RECUPEROVALOR ' +
           'WHERE XV_IDVALOR = :VALOR ' +
             'AND XV_IDCUOTA IN ( SELECT XC_ID ' +
                                   'FROM LXC_RECUPEROCUOTA ' +
                                  'WHERE XC_IDPLANPAGO = :PLAN ) ' +
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

  if Validar then
    fpCheques.ModalResult := mrOk;
end;

procedure TfrmCargaCuotasLeg.sdqChequesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ActualizarMontoDisponible;
end;

procedure TfrmCargaCuotasLeg.ActualizarMontoDisponible;
var
  MontoUtilizado: Double;
begin
  if sdqCheques.Active and not sdqCheques.IsEmpty then
  begin
    MontoUtilizado := ValorSqlEx('SELECT NVL(SUM(XV_IMPORTE), 0)' +
                                	' FROM LXV_RECUPEROVALOR' +
                                 ' WHERE XV_IDVALOR = :p1' +
                                	 ' AND XV_IDCUOTA NOT IN (SELECT XC_ID' +
                                                        		' FROM LXC_RECUPEROCUOTA' +
                                                         	 ' WHERE XC_IDPLANPAGO = :p2)',
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

procedure TfrmCargaCuotasLeg.ABMRelacion(TipoABM: String; Query: TSDQuery; IDPlanCuota, IDRelacion: String; TipoValor: Integer);
var
  SqlRelacion, SqlValor: TSql;
begin
  SqlRelacion := TSql.Create('LXV_RECUPEROVALOR');
  SqlValor    := TSql.Create('ZVA_VALOR');
  try
    //De acuerdo al tipo de registro se comporta de forma diferente
    //los tipos son Valor normal, Cheque Judicial y Remesa
    ////////////
    //  ALTA  //
    ////////////
    if TipoABM = 'alta' then
    begin
      //Creo la relacion en la LXV_RECUPEROVALOR
      SqlRelacion.SqlType := stInsert;
      SqlRelacion.PrimaryKey.Add('XV_ID',      'SEQ_LXV_ID.NEXTVAL', False);
      SqlRelacion.Fields.Add('XV_IDCUOTA',     IDPlanCuota, False);
      SqlRelacion.Fields.Add('XV_IMPORTE',     Query.FieldByName('VA_IMPORTE').AsString, dtNumber);
      SqlRelacion.Fields.Add('XV_USUALTA',     Sesion.UserID);
      SqlRelacion.Fields.Add('XV_FECHAALTA',   'ACTUALDATE', False);
      //Id correspondiente
      SqlRelacion.Fields.Add('XV_IDVALOR',     Query.FieldByName('VA_IDVALOR').AsString, False);
      EjecutarSqlST( SqlRelacion.Sql );

      if TipoValor = 1 then
      begin
        SqlValor.SqlType := stInsert;
        SqlValor.PrimaryKey.Add('VA_ID',         Query.FieldByName('VA_IDVALOR').AsString, False);
        SqlValor.Fields.Add('VA_IDTIPOVALOR',    Query.FieldByName('VA_TIPO').AsInteger);
        SqlValor.Fields.Add('VA_IMPORTE',        Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_IMPOSINIMPUTAR', Query.FieldByName('VA_IMPORTE').AsFloat, dtNumber);
        SqlValor.Fields.Add('VA_ESTADO',         Query.FieldByName('VA_ESTADO').AsString);
        SqlValor.Fields.Add('VA_IDEMPDEUDORA',   fraEmpresaDeudora.Value);
        SqlValor.Fields.Add('VA_IDCONCEPTOVALOR',IDCONCEPTOVALOR_RECUPEROSIN);

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
      //modifico la relacion en la LXV_RECUPEROVALOR
      SqlRelacion.SqlType := stUpdate;
      SqlRelacion.PrimaryKey.Add('XV_ID',      IDRelacion, False);
      SqlRelacion.Fields.Add('XV_IMPORTE',     Query.FieldByName('VA_IMPORTE').AsString, dtNumber);
      SqlRelacion.Fields.Add('XV_USUMODIF',    Sesion.UserID);
      SqlRelacion.Fields.Add('XV_FECHAMODIF',  'ACTUALDATE', False);
      EjecutarSqlST(SqlRelacion.Sql);

      if TipoValor = 1 then
      begin
        SqlValor.SqlType := stUpdate;
        SqlValor.PrimaryKey.Add('VA_ID',         Query.FieldByName('VA_IDVALOR').AsString, False);
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
      //elimino la relacion en la LXV_RECUPEROVALOR
      SqlRelacion.SqlType := stDelete;
      SqlRelacion.PrimaryKey.Add('XV_ID', IDRelacion, False);
      EjecutarSqlST(SqlRelacion.Sql);

      if (TipoValor = 1) and (not Query.FieldByName('XV_IDVALOR').IsNull) then
      begin
        SqlValor.SqlType := stDelete;
        SqlValor.PrimaryKey.Add('VA_ID',  Query.FieldByName('XV_IDVALOR').AsInteger, False);
        EjecutarSqlST(SqlValor.Sql);
      end;
    end;

  finally
    SqlValor.Free;
    SqlRelacion.Free;
  end;
end;

procedure TfrmCargaCuotasLeg.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

function TfrmCargaCuotasLeg.Do_GrabarAntesImpresion: Boolean;
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

procedure TfrmCargaCuotasLeg.mnuImprimirPlanClick(Sender: TObject);
var
  Tipo: String;
begin
  if Do_GrabarAntesImpresion then
  begin
    Tipo := fraXP_ESTADO.Especial2;

    if Tipo = 'P' then
    begin
      with TfrmQrPlanFinanciamientoLeg.Create(Self) do
      begin
        Preparar(fIDPlanPago);
        Free;
      end;
    end;
  end;
end;

procedure TfrmCargaCuotasLeg.GridCuotasGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont;
																				    			 	 var AAlignment: TAlignment; var Background: TColor;
                                                     Highlight: Boolean);
begin
  inherited;

  if ACol in [2..3] then  // columnas de importes
    AAlignment := taRightJustify
  else if ACol = 1 then
    AAlignment := taCenter;
end;

procedure TfrmCargaCuotasLeg.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
  	TFloatField(sdqConsulta.FieldByName('VA_IMPORTE')).DisplayFormat := '#,##0.00';
end;

procedure TfrmCargaCuotasLeg.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

procedure TfrmCargaCuotasLeg.mnuImprimirReciboClick(Sender: TObject);
begin
  DoReImprimirRecibosPlan(StrToInt(fIdPlanPago), 3, False, trPlanPagoRecup);
end;

function TfrmCargaCuotasLeg.Get_TotalValores(Cuota: Integer = -1): Currency;
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

function TfrmCargaCuotasLeg.Is_ValoresCargados(CondicionExtra: String = ''): Boolean;
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

procedure TfrmCargaCuotasLeg.Do_BorrarValores;
var
  sSql: String;
begin
  sSql :=
  	'DELETE FROM TVA_VALOR' +
    		 ' WHERE VA_USUARIO = :p1';

  EjecutarSqlEx(sSql, [Sesion.UserID]);
end;

function TfrmCargaCuotasLeg.Validar_Valor: Boolean;
var
  bEsRedondeo: Boolean;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');

  bEsRedondeo := (sdqConsulta.FieldByName('CODIGOTIPOVALOR').AsString = 'RED');

  Verificar(bEsRedondeo and (fraXP_ESTADO.Especial1 = 'N'), nil, 'No se puede modificar el redondeo.');
  Verificar(not bEsRedondeo and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01'), nil, 'El valor ha sido ingresado en tesorería.');
  Verificar(not bEsRedondeo and not sdqConsulta.FieldByName('FECHAIMPRRECIBO').IsNull, nil, 'El valor ya ha sido impreso en un recibo.');

  Result := True;
end;

procedure TfrmCargaCuotasLeg.btnAgregarCuotaClick(Sender: TObject);
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

  if iCantidadCuotas > 0 then
  begin
    Verificar(StrToDate(GridCuotas.Cells [1,GridCuotas.RowCount - 1]) >= cmbVencimiento.Date, cmbVencimiento, 'La fecha de vencimiento debe ser posterior a la última ingresada.');
    GridCuotas.RowCount := GridCuotas.RowCount + 1;
  end
  else
  begin
    if cmbVencimiento.Date <> DBDate() then
      begin
        GridCuotas.Cells [0,GridCuotas.RowCount - 1] := IntToStr(0);
        GridCuotas.Cells [1,GridCuotas.RowCount - 1] := DateToStr(DBDate());
        GridCuotas.Cells [2,GridCuotas.RowCount - 1] := ToStr(0);
        GridCuotas.Cells [3,GridCuotas.RowCount - 1] := ToStr(edDeudaInicialLEGALES.Value);
        Inc(iCantidadCuotas);
        GridCuotas.RowCount := GridCuotas.RowCount + 1;
      end
  end;

  GridCuotas.Cells [0,GridCuotas.RowCount - 1] := IntToStr(GridCuotas.RowCount - 2);
  GridCuotas.Cells [1,GridCuotas.RowCount - 1] := DateToStr(cmbVencimiento.Date);
  GridCuotas.Cells [2,GridCuotas.RowCount - 1] := ToStr(edCuota.Value);
  GridCuotas.Cells [3,GridCuotas.RowCount - 1] := ToStr(fSaldo);
  Inc(iCantidadCuotas);
  CuotaActual := IntToStr(iCantidadCuotas - 1);

  edDeudaTotalLEGALES.Value := edDeudaTotalLEGALES.Value + edCuota.Value;
  btnQuitarCuota.Enabled := True;
  fGenerarCuotas := True;
end;

procedure TfrmCargaCuotasLeg.btnQuitarCuotaClick(Sender: TObject);
begin
  if iCantidadCuotas > 0 then
  begin
    Dec(iCantidadCuotas);

    edDeudaTotalLEGALES.Value := edDeudaTotalLEGALES.Value - ToFloat(GridCuotas.Cells [2,GridCuotas.RowCount - 1]);

    GridCuotas.Cells[0,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[1,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[2,GridCuotas.RowCount - 1] := '';
    GridCuotas.Cells[3,GridCuotas.RowCount - 1] := '';

    if iCantidadCuotas > 0 then
      GridCuotas.RowCount := GridCuotas.RowCount - 1
    else
      btnQuitarCuota.Enabled := False;
  end else
    InfoHint(btnQuitarCuota, 'No quedan cuotas para quitar.');
end;

function TfrmCargaCuotasLeg.CanCuotaManual(): Boolean;
begin
  Result := True; (*Is_SectorLegal()*)
end;

// esta función no se está usando
function TfrmCargaCuotasLeg.Validar_RedondeoTotal: Boolean;
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
  dDeudaTotal   := edDeudaTotalLEGALES.Value;

  Result := (Abs(dTotalRedondeos) <= RoundNumber(dDeudaTotal * dPorcRedondeo / 100, 2));
end;

procedure TfrmCargaCuotasLeg.Validar_ImportesCuota;
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
    	Verificar(CompareFloat2(Importe, ToFloat(GridCuotas.Cells[2, iCuotaActual + 1] )) > 0, GridValores, 'La suma de los importes de los valores exceden el valor de la cuota ' + IntToStr(iCuotaActual) + '.');
    end;
  end;
end;

procedure TfrmCargaCuotasLeg.Validar_DatosValoresYRedondeo;
begin
  Validar_ImportesCuota();
//  Validar_RedondeoCuota();
//  Verificar(not Validar_RedondeoTotal(), GridValores, 'Los redondeos cargados superan el porcentaje máximo permitido sobre la deuda final.');
end;

// esta función no se está usando
procedure TfrmCargaCuotasLeg.Validar_RedondeoCuota;
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

      dTotalCuota := ToFloat(GridCuotas.Cells[2, iNroCuota + 1]);

      Verificar(Abs(dTotalRedondeosCuota ) > RoundNumber(dTotalCuota * dPorcRedondeoCuota / 100, 2), GridValores, 'Los redondeos cargados para la cuota ' + IntToStr( iNroCuota ) + ' superan el porcentaje máximo permitido sobre el total de la cuota.');

      Next;
    end;
  finally
  	Free;
  end;
end;

procedure TfrmCargaCuotasLeg.chkSoloActivosClick(Sender: TObject);
begin
  SetCuotaActual(fCuotaActual);
end;

function TfrmCargaCuotasLeg.VerificarPreacuerdoConValores(IDPlanPago: TTableId): Boolean;
begin
  Result := ExisteSqlEx('SELECT 1 ' +
                          'FROM CTB_TABLAS, LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN ' +
                         'WHERE XC_IDPLANPAGO = XP_ID ' +
                           'AND XV_IDCUOTA = XC_ID ' +
                           'AND XP_ID = :PPID ' +
                           'AND XV_FECHABAJA IS NULL ' +
                           'AND TB_CLAVE = ''ESPLR'' ' +
                           'AND TB_CODIGO = XP_ESTADO ' +
                           'AND TB_ESPECIAL2 = ''A''', [IDPlanPago]);
end;

procedure TfrmCargaCuotasLeg.tbNuevoClick(Sender: TObject);
begin
  if DoGuardar then
    DoCargar(fIDPlanPago);
end;

procedure TfrmCargaCuotasLeg.FSFormDestroy(Sender: TObject);
begin
  inherited;

  DecimalSeparator  := fOldDecimalSeparator;
  ThousandSeparator := fOldThousandSeparator;
end;

end.

