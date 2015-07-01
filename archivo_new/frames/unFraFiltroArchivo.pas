unit unFraFiltroArchivo;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, unfraArchJuicio, IntEdit, unFraCodigoDescripcion, SinEdit, CustomDlgs,
  unArtDbFrame, unFraEmpresa, ComCtrls, StdCtrls, Mask,  PatternEdit, ComboEditor,
  DBComboGrid, Db, SDEngine, DBGrids, unfraEstablecimiento, unArtDBAwareFrame, ExtCtrls,
  JvExComCtrls, JvComCtrls, unSesion, unFraTrabajador, ToolEdit, DateComboBox, Buttons,
  JvExControls, JvComponent, JvXPCore, JvXPButtons, unArt, unfraProveedor,
  unfraVendedoresCUIT, unfraEntidadCUIT, unfraVendedores,
  unFraStaticCodigoDescripcion, PeriodoPicker, unFraCodDesc, unfraPrestador,
  RxToolEdit, Vcl.ToolWin, Vcl.ImgList;

type
  TFormulario = (ftNone, ftCuit, ftSiniestro, ftTipoNumero, ftNumero, ftJuicio, ftCuitEstableci, ftBiblioratoSecuencia, ftFecha, ftProveedor, ftEntidadVendedor, ftVendedor, ftCuil, ftContratoCuil, ftExtractoBancario, ftAnioPeriodo, ftCBU, ftPrestador, ftTexto, ftLegajoPers);
  TfraFiltroArchivo = class(TArtFrame)
    lbTipoArchivo: TLabel;
    pcFormulario: TJvPageControl;
    tsNone: TTabSheet;
    tsCuitEstableci: TTabSheet;
    tsSiniestro: TTabSheet;
    tsTipoNumero: TTabSheet;
    lblSiniestro: TLabel;
    edSiniestro: TIntEdit;
    lblOrden: TLabel;
    tsNumero: TTabSheet;
    lblNumero: TLabel;
    tsJuicio: TTabSheet;
    Juicio: TLabel;
    fraJuicio: TfraArchJuicio;
    edOrden: TIntEdit;
    tsBiblioratoNota: TTabSheet;
    edBibliorato: TIntEdit;
    lblBilbliorato: TLabel;
    lblNota: TLabel;
    edNota: TIntEdit;
    pnSeleccionArchivo: TPanel;
    fraEmpresaSiniestro: TfraEmpresa;
    fraEmpresaNota: TfraEmpresa;
    edObservaciones: TEdit;
    lbCUIT: TLabel;
    lblFechaSiniestro: TLabel;
    edFechaSiniestro: TDateComboBox;
    tsCuit: TTabSheet;
    fraEmpresaCUIT: TfraEmpresa;
    Label1: TLabel;
    edNumero: TIntEdit;
    Label2: TLabel;
    fraCodDescTipo: TfraCodigoDescripcion;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbEmprCuitEstableci: TLabel;
    fraEmpresaEmpresa: TfraEmpresa;
    btnCargarCodigoBarras: TJvXPButton;
    lbCUIL: TLabel;
    fraTrabajadorSiniestro: TfraTrabajador;
    edNumNumeroDesde: TPatternEdit;
    edDemandante: TEdit;
    lblContra: TLabel;
    edDemandado: TEdit;
    edInfoAdicionalNro: TMemo;
    tsFecha: TTabSheet;
    lblFecha: TLabel;
    edFecha: TDateComboBox;
    tsProveedor: TTabSheet;
    fraProveedor: TfraProveedor;
    edJuicio: TEdit;
    lbRSocial: TLabel;
    tsEntidadVendedor: TTabSheet;
    fraEntidadCUIT: TfraEntidadCUIT;
    fraVendedorCUIT: TfraVendedoresCUIT;
    tsVendedor: TTabSheet;
    fraVendedoresCUIT: TfraVendedoresCUIT;
    tsTrabajador: TTabSheet;
    fraTrabajad: TfraTrabajador;
    Label8: TLabel;
    tsEmpresaTrab: TTabSheet;
    fraEmpresaTrab: TfraEmpresa;
    CUIL: TLabel;
    Label9: TLabel;
    fraTrabajadorTrab: TfraTrabajador;
    tsExtractoBanc: TTabSheet;
    lbBanco: TLabel;
    fraBancoExtracto: TfraStaticCodigoDescripcion;
    lbCuenta: TLabel;
    fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    edFechaExtracto: TDateComboBox;
    tsAnioPeriodo: TTabSheet;
    edAnioPeriodo: TPeriodoPicker;
    Label11: TLabel;
    tsCBU: TTabSheet;
    fraCuentaPago: TfraCodigoDescripcion;
    Label12: TLabel;
    fraTipoArchivo: TfraCodDesc;
    tsPrestador: TTabSheet;
    fraPrestador: TfraPrestador;
    tsTexto: TTabSheet;
    Label6: TLabel;
    edTexto: TEdit;
    ToolBarSiniestro: TToolBar;
    tbBuscarSiniestro: TToolButton;
    ImageList: TImageList;
    tsTipo: TTabSheet;
    lblCodTipo: TLabel;
    fraCodTipo: TfraCodigoDescripcion;
    procedure OnArchivoChange(Sender: TObject);
    procedure edSiniestroExit(Sender: TObject);
    procedure edOrdenExit(Sender: TObject);
    procedure btnCargarCodigoBarrasClick(Sender: TObject);
    procedure edNotaExit(Sender: TObject);
    procedure edNotaKeyPress(Sender: TObject; var Key: Char);
    procedure fraJuicioChange(Sender: TObject);
    procedure edNumNumeroDesdeExit(Sender: TObject);
    procedure edNumNumeroDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure framesInternosDataChange(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure edNumeroExit(Sender: TObject);
    procedure edFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure fraEntidadCUITExit(Sender: TObject);
    procedure fraVendedorCUITExit(Sender: TObject);
    procedure edAnioPeriodoExit(Sender: TObject);
    procedure edOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure edSiniestroKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure tbBuscarSiniestroClick(Sender: TObject);
    // prcedure OnChange   Está programado. Cada vez que se agregue un componente nuevo de ingreso de datos
    //                     de un tipo de archivo (edit, frame, etc) hay que programar el exit/keypress/change
    //                     según corresponda
  private
    FFormulario: TFormulario;
    FReadOnly: boolean;
    FCodigoBarrasOk: boolean;
    FCodigoBarrasPorCartaDoc: Boolean;
    FPermitirRelLaboralInexistente: boolean;
    pvMaxPeriodo: Integer;
    FHuboError: Boolean;
    FCartasDocPermiteBajas: Boolean;
    function GetTableName: string;
    procedure OnfraEmpresaChange(Sender: TObject);
    procedure OnfraEmpresaTrabChange(Sender: TObject);
    procedure OnfraTrabajadorTrabChange(Sender: TObject);
    function GetIsSelected: boolean;
    procedure SetFormulario(const Value: TFormulario);
    function GetClave: string;
    function GetTipo: Integer;
    function GetIsCompleted: boolean;
    function GetExists: boolean;
    procedure VerificarSiniestro;
    function GetIdArchivo: integer;
    procedure SetIdArchivo(const Value: integer);
    procedure SetTipo(const Value: Integer);
    function GetReadOnly: boolean;
    procedure ClearData;
    function StrToFormulario(AValue: string): TFormulario;
    procedure SetearFoco;
    procedure DoCargarDatosNotaEmision(Bibliorato: Integer; Secuencia: TTableId);
    function GetIdTipoArchivo: Integer;
    function GetClaveCartaDoc: string;
    function FormularioToPageIndex(AValue: TFormulario): Integer;
    procedure OnfraBancoExtractoChange(Sender: TObject);
    procedure OnfraCuentaBancariaExtractoChange(Sender: TObject);
    function GetDescripcionTipo: string;
    function IsFechaValida(Fecha: TDateTime): Boolean;
    function IsPeriodoValido(Periodo: String): Boolean;
    function IsFormularioNumeroValido(TipoArchivo: Integer; Numero: String): Boolean;
    function IsFormularioTextoValido(TipoArchivo: Integer; Texto: String): Boolean;
    function GetCodigo: String;
  protected
    procedure SetReadOnly(const Value: boolean); override;
  public
    fraEstablecimiento: TfraEstablecimiento;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    procedure ResetSelection;
    procedure ClearArchivo(AGetFocus: Boolean = True);
    procedure DoCargarDatosNumero(Tabla, Numero: String; TipoArchivo: Integer; NroEstableci: Integer = 0);
    procedure DoCargarClaveArchivo(ATipo: Integer; ACadena: String);
    function CodBarrasASubClaves(FormularioAct: TFormulario; CodBarras: String; var SubClave1, SubClave2, SubClave3, SubClave4: String): Boolean;
    function IsCartaDocumento: Boolean;
    function IsHigYSeguridad: Boolean;
    function IsAMP: Boolean;
    function IsConstrucciones: Boolean;
    function IsTipoCartaDocumento: Boolean;
    function IsTipoArchivoCartaDocumento: Boolean;
    function IsTipoArchivoCartaComercial: Boolean;
    function IsTesoreria: Boolean;
    function IsSiniestro: Boolean;
    function IsCartaComercialCobranzas: Boolean;
    function IsTipoArchivoCaja: Boolean;
    function IsTipoArchivoSiniestros: Boolean;
    function IsTipoArchivoVendedores: Boolean;
    function IsTipoArchivoExamenesPreocupacionales: Boolean;
    function IsTipoArchivoExtractosBancarios: Boolean;
    function IsTipoArchivoCuentasPagarViaticos: Boolean;
    function IsTipoArchivoCajaGirosTransferencias: Boolean;
    function IsTipoArchivoBalance: Boolean;
    function IsTipoArchivoAfiliaciones: Boolean;
    function IsTipoArchivoIncapacidades: Boolean;
    function IsTipoArchivoCDSIN: Boolean;
    function IsTipoArchivoCDAFI: Boolean;
    function IsTipoArchivoCDHYS: Boolean;
    function IsTipoArchivoOPTesoreria: Boolean;
    function IsTipoArchivoExtractoBancario: Boolean;
    function IsTipoArchivoMedLaboralRX: Boolean;
    function IsTipoArchivoCartasDocumento: Boolean;
    function IsTipoArchivoTransferenciasBanc: Boolean;
    function IsTipoArchivoExamenesPreocupacionalesRX: Boolean;
    function IsTipoArchivoRX: Boolean;
    function IsTipoArchivoHigieneYSeguridad: Boolean;
    function IsTipoArchivoCompras: Boolean;
    function IsFormularioArchivoContratos: Boolean;
    function IsCartaDocumentoValida(CartaDoc: String; ControlFoco: TControl = nil; MostrarErrores: Boolean = True; PermitirBajas: Boolean = False): Boolean;

    property Formulario: TFormulario read FFormulario write SetFormulario default ftNone;
    property TableName: string read GetTableName;
    property IsSelected: boolean read GetIsSelected;     // Verifica que se haya seleccionado un tipo de archivo.
    property IsCompleted: boolean read GetIsCompleted;   // Verifica que se haya ingresado la info correspondiente al tipo de archivo
    property Exists: boolean read GetExists;             // Verifica que lo ingresado corresponda con un tipo de registro existente del mundo real :D
    property Clave: string read GetClave;
    property Tipo: Integer read GetTipo write SetTipo;
    property DescripcionTipo: string read GetDescripcionTipo;
    property IdArchivo: integer read GetIdArchivo write SetIdArchivo;
    property ReadOnly: boolean read GetReadOnly write SetReadOnly;
    property CodigoBarrasOk: boolean read FCodigoBarrasOk write FCodigoBarrasOk;
    property IdTipoArchivo: Integer read GetIdTipoArchivo;
    property CodigoBarrasPorCartaDoc: Boolean read FCodigoBarrasPorCartaDoc write FCodigoBarrasPorCartaDoc default False;
    property ClaveCartaDoc: string read GetClaveCartaDoc;
    property PermitirRelLaboralInexistente : boolean read FPermitirRelLaboralInexistente write FPermitirRelLaboralInexistente default True;
    property HuboError: Boolean read FHuboError write FHuboError default False;
    property Codigo: String read GetCodigo;
    property CartasDocPermiteBajas: Boolean read FCartasDocPermiteBajas write FCartasDocPermiteBajas default False;
  end;

function TipoArchivoToFormulario(ATipoArchivo: TTableId): TFormulario;
function ClaveACodBarras(ATipoArchivo: TTableId; AClave: String; var CodBarras: String): Boolean;
function GetTablaCartasDoc(APermitirBajas: Boolean): String;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, unArchivo, unConstantArchivo,
  unCapturarCodigoBarras, StrFuncs, General, VclExtra, DateTimeFuncs, unUtilsArchivo,
  CUIT, unComisiones, unSiniestros, unTercerizadoras, unDmFinancials, Periodo,
  unComunes, Numeros, unDlgBusSiniestro;

{$R *.DFM}

{------------------------------------------------------------------------------}
function TfraFiltroArchivo.FormularioToPageIndex(AValue: TFormulario): Integer;
begin
  Result := Integer(AValue);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.StrToFormulario(AValue: string): TFormulario;
begin
  if AValue = 'CUIT' Then
    Result := ftCuit
  else if AValue = 'SIN' Then
    Result := ftSiniestro
  else if AValue = 'TN' Then
    Result := ftTipoNumero
  else if AValue = 'N' Then
    Result := ftNumero
  else if AValue = 'JA' Then
    begin
      fraJuicio.ExtraCondition := ' AND JT_ESTADOMEDIACION = ''A'' ';
      Result := ftJuicio;
    end
  else if AValue = 'JD' Then
    begin
      fraJuicio.ExtraCondition := ' AND JT_ESTADOMEDIACION = ''J'' ';
      Result := ftJuicio;
    end
  else if AValue = 'JUIE' Then
    begin
      fraJuicio.ExtraCondition := ' AND EXISTS (SELECT 1 FROM LEGALES.LEM_EMBARGO' + GetDBLink() + ' WHERE EM_IDJUICIO = JT_ID) ';
      Result := ftJuicio;
    end
  else if AValue = 'CE' Then
    Result := ftCuitEstableci
  else if AValue = 'BS' Then
    Result := ftBiblioratoSecuencia
  else if AValue = 'FECHA' Then
    Result := ftFecha
  else if AValue = 'PROV' Then
    Result := ftProveedor
  else if AValue = 'EV' Then
    Result := ftEntidadVendedor
  else if AValue = 'VEND' Then
    Result := ftVendedor
  else if AValue = 'CUIL' Then
    Result := ftCuil
  else if AValue = 'CT' Then
    Result := ftContratoCuil
  else if AValue = 'EB' Then
    Result := ftExtractoBancario
  else if AValue = 'TRI' Then
    begin
      pvMaxPeriodo := 3;
      Result       := ftAnioPeriodo;
    end
  else if AValue = 'CC' Then
    Result := ftCBU
  else if AValue = 'PREST' Then
    Result := ftPrestador
  else if AValue = 'T' Then
    Result := ftTexto
  else if AValue = 'LP' Then
    Result := ftLegajoPers
  else
    Result := ftNone;
end;
{------------------------------------------------------------------------------}
constructor TfraFiltroArchivo.Create(AOwner: TComponent);
begin
  inherited;
  FHuboError := False;
  pcFormulario.ActivePage := tsNone;

  fraEstablecimiento := TfraEstablecimiento.Create(Self);
  with fraEstablecimiento do
  begin
    Parent   := tsCuitEstableci;
    Top      := fraEmpresaEmpresa.Top + fraEmpresaEmpresa.Height + 4;
    TabOrder := fraEmpresaEmpresa.TabOrder + 1;
    Anchors  := [akLeft,akTop,akRight];
    {$IFDEF RED_PRES}
    Left  := 17;
    Width := fraEmpresaEmpresa.Width + 40;
    {$ELSE}
    Left  := fraEmpresaEmpresa.Left - 1;
    Width := fraEmpresaEmpresa.Width + 6;
    with TLabel.Create(Self) do
    begin
      Parent   := tsCuitEstableci;
      Autosize := True;
      Top      := lbEmprCuitEstableci.Top + 24;
      Left     := 2;
      Caption  := 'Establec.';
    end;
    {$ENDIF}
  end;

  with fraBancoExtracto do
    begin
      ShowBajas   := True;
      TableName   := 'ZBA_BANCO' + GetDBLink();
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA' + GetDBLink() + ' WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancariaExtracto do
    begin
      ShowBajas   := True;
      TableName   := 'ZCB_CUENTABANCARIA' + GetDBLink();
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_NUMERO';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
    end;

  with fraCuentaPago do
    begin
      ShowBajas   := True;
      TableName   := 'ART.V_CCP_CUENTAPAGO' + GetDBLink();
      FieldID     := 'CP_ID';
      FieldCodigo := 'CP_CUITCUIL';
      FieldDesc   := 'CP_NOMBRE';
      FieldBaja   := 'CP_FECHABAJA';
      ExtraCondition := ' AND CP_FECHAAPROBADO IS NOT NULL AND CP_CBU1 IS NOT NULL';
    end;

  fraEmpresaCUIT.ShowBajas         := True;
  fraEmpresaSiniestro.ShowBajas    := True;

  with fraTrabajadorSiniestro do
    begin
      AutoExit  := False;
      ShowBajas := True;
    end;

  fraEmpresaEmpresa.ShowBajas         := True;
  fraEstablecimiento.ShowBajas        := True;
  fraEmpresaNota.ShowBajas            := True;
  fraProveedor.ShowBajas              := True;
  fraEntidadCUIT.ShowBajas            := True;
  fraVendedorCUIT.ShowBajas           := True;
  fraTrabajad.ShowBajas               := True;
  fraEmpresaTrab.ShowBajas            := True;
  fraTrabajadorTrab.ShowBajas         := True;
  fraPrestador.ShowBajas              := True;

  fraPrestador.ShowMensajes           := False;

  with fraVendedoresCUIT do
    begin
      ExtraCondition := ' AND VE_CUIT IS NOT NULL';
      ShowBajas      := True;
    end;

  fraEmpresaNota.OnChange     := framesInternosDataChange;
  fraEmpresaCUIT.OnChange     := framesInternosDataChange;
  fraEstablecimiento.OnChange := framesInternosDataChange;
  fraProveedor.OnChange       := framesInternosDataChange;
  fraCodDescTipo.OnChange     := framesInternosDataChange;
  fraEntidadCUIT.OnChange     := framesInternosDataChange;
  fraVendedorCUIT.OnChange    := framesInternosDataChange;
  fraVendedoresCUIT.OnChange  := framesInternosDataChange;
  fraTrabajad.OnChange        := framesInternosDataChange;
  edAnioPeriodo.OnChange      := framesInternosDataChange;
  fraCuentaPago.OnChange      := framesInternosDataChange;
  fraPrestador.OnChange       := framesInternosDataChange;

  fraEmpresaEmpresa.OnChange  := OnfraEmpresaChange;
  fraEmpresaTrab.OnChange     := OnfraEmpresaTrabChange;
  fraTrabajadorTrab.OnChange  := OnfraTrabajadorTrabChange;
  fraBancoExtracto.OnChange   := OnfraBancoExtractoChange;
  fraCuentaBancariaExtracto.OnChange := OnfraCuentaBancariaExtractoChange;

  with fraJuicio do
    begin
      ShowBajas := True;
      OnChange  := fraJuicioChange;
    end;

  fraTipoArchivo.Propiedades.ExtraCondition := ' AND EXISTS(SELECT 1 ' +
                                                             'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                                            'WHERE AU_FECHABAJA IS NULL ' +
                                                              'AND AU_IDTIPOARCHIVO = TA_ID ' +
                                                              'AND AU_USUARIO = ' + SqlValue(Sesion.UserId) + ')';

  ResetSelection;

  FCodigoBarrasOk                := False;
  FCodigoBarrasPorCartaDoc       := False;
  FPermitirRelLaboralInexistente := True;
  FCartasDocPermiteBajas         := False;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.ResetSelection;
begin
  pnSeleccionArchivo.Visible := visible;

  Formulario := ftNone;
  ReadOnly   := false;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnArchivoChange(Sender: TObject);
begin
  fraEmpresaEmpresa.TabOrder := 0;

  if fraTipoArchivo.sdqDatos.Active and (not fraTipoArchivo.sdqDatos.IsEmpty) and (pcFormulario.ActivePageIndex <> FormularioToPageIndex(StrToFormulario(fraTipoArchivo.sdqDatos.FieldByName('TA_FORMULARIO').AsString))) then
    ClearData;

  if fraTipoArchivo.IsSelected then
    begin
      Formulario := StrToFormulario(fraTipoArchivo.sdqDatos.FieldByName('TA_FORMULARIO').AsString);
      pcFormulario.ActivePageIndex := FormularioToPageIndex(Formulario);

      case Formulario of
        ftLegajoPers:
          begin
            with fraCodTipo do
              begin
                TableName      := 'USE_USUARIOS';
                FieldID        := 'SE_LEGAJORRHH';
                FieldCodigo    := 'SE_LEGAJORRHH';
                FieldDesc      := 'UPPER(SE_NOMBRE)';
                FieldBaja      := 'SE_FECHABAJA';
                ExtraCondition := ' AND NVL(SE_LEGAJORRHH, 0) > 0 AND SE_CONTRATO = 1';   // 1: Empleado
                ShowBajas      := True;

                cmbDescripcion.CharCase := ecUpperCase;
              end;

            lblCodTipo.Caption := 'Legajo';
          end;
      end;
    end
  else
    Formulario := ftNone;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.SetFormulario(const Value: TFormulario);
begin
  if FFormulario = Value then
    pcFormulario.ActivePageIndex := FormularioToPageIndex(Value)
  else
    begin
      FFormulario := Value;
      fraEstablecimiento.Visible   := FFormulario = ftCuitEstableci;
      pcFormulario.ActivePageIndex := FormularioToPageIndex(Value);
      pcFormulario.Refresh;
    end;

  Change;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetTableName: string;
begin
  if fraTipoArchivo.IsSelected then
    Result := fraTipoArchivo.sdqDatos.FieldByName('TA_TABLA').AsString
  else
    Result := '';
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.Clear;
begin
  ClearData;
  fraTipoArchivo.Clear;
  pcFormulario.ActivePageIndex := 0;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.SetearFoco;
begin
  case Formulario of
    ftCuit:                fraEmpresaCUIT.edContrato.SetFocus;
    ftSiniestro:           edSiniestro.SetFocus;
    ftTipoNumero:          edNumero.SetFocus;
    ftNumero:              edNumNumeroDesde.SetFocus;
    ftJuicio:              fraJuicio.edCodigo.SetFocus;
    ftCuitEstableci:       fraEmpresaEmpresa.edContrato.SetFocus;
    ftBiblioratoSecuencia: edBibliorato.SetFocus;
    ftFecha:               edFecha.SetFocus;
    ftProveedor:           fraproveedor.mskCUIT.SetFocus;
    ftEntidadVendedor:     fraEntidadCUIT.mskCUIT.SetFocus;
    ftVendedor:            fraVendedoresCUIT.mskCUIT.SetFocus;
    ftCuil:                fraTrabajad.mskCUIL.SetFocus;
    ftContratoCuil:        fraEmpresaTrab.mskCUIT.SetFocus;
    ftExtractoBancario:    fraBancoExtracto.edCodigo.SetFocus;
    ftAnioPeriodo:         edAnioPeriodo.SetFocus;
    ftCBU:                 fraCuentaPago.edCodigo.SetFocus;
    ftPrestador:           fraPrestador.CuitFocus;
    ftTexto:               edTexto.SetFocus;
    ftLegajoPers:          fraCodTipo.edCodigo.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.ClearData;
begin
  FHuboError := False;

  case Formulario of
    ftCuit:
      fraEmpresaCUIT.Clear;
    ftSiniestro:
      begin
        edSiniestro.Clear;
        edOrden.Value := 1;
        fraEmpresaSiniestro.Clear;
        fraTrabajadorSiniestro.Clear;
        edFechaSiniestro.Clear;
        edJuicio.Clear;
      end;
    ftTipoNumero:
      begin
        edNumero.Clear;
        fraCodDescTipo.Clear;
      end;
    ftNumero:
      begin
        edNumNumeroDesde.Clear;
        edInfoAdicionalNro.Clear;
      end;
    ftJuicio:
      begin
        fraJuicio.Clear;
        edDemandante.Clear;
        edDemandado.Clear;
      end;
    ftCuitEstableci:
      begin
        fraEmpresaEmpresa.Clear;
        fraEstablecimiento.Clear;
      end;
    ftBiblioratoSecuencia:
      begin
        edBibliorato.Clear;
        edNota.Clear;
        fraEmpresaNota.Clear;
        edObservaciones.Clear;
      end;
    ftFecha:
      edFecha.Clear;
    ftProveedor:
      fraProveedor.Clear;
    ftEntidadVendedor:
      begin
        fraEntidadCUIT.Clear;
        fraVendedorCUIT.Clear;
        fraVendedorCUIT.Entidad := ART_EMPTY_ID;
      end;
    ftVendedor:
      fraVendedoresCUIT.Clear;
    ftCuil:
      fraTrabajad.Clear;
    ftContratoCuil:
      begin
        fraEmpresaTrab.Clear;
        fraTrabajadorTrab.Clear;
      end;
    ftExtractoBancario:
      begin
        fraBancoExtracto.Clear;
        fraCuentaBancariaExtracto.Clear;
        edFechaExtracto.Clear;
      end;
    ftAnioPeriodo:
      edAnioPeriodo.Clear;
    ftCBU:
      fraCuentaPago.Clear;
    ftPrestador:
      fraPrestador.Clear;
    ftTexto:
      edTexto.Clear;
    ftLegajoPers:
      fraCodTipo.Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnfraEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.Contrato := fraEmpresaEmpresa.Contrato;

  framesInternosDataChange(Self);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.SetTipo(const Value: Integer);
begin
  {$IFDEF ART2}
  fraTipoArchivo.Value := Value;
  {$ELSE}
  fraTipoArchivo.Value := IntToStr(Value);
  {$ENDIF}
  if fraTipoArchivo.sdqDatos.Active and not fraTipoArchivo.sdqDatos.IsEmpty then
    Formulario := StrToFormulario(fraTipoArchivo.sdqDatos.FieldByName('TA_FORMULARIO').AsString)
  else
    raise Exception.Create('Ud. no tiene permiso para visualizar el tipo de archivo indicado. Consulte con el sector de Guarda & Digitalización');

  if Self.Visible and pcFormulario.Visible then
    SetearFoco;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetTipo: Integer;
begin
  if fraTipoArchivo.IsSelected then
    Result := StrToIntDef(fraTipoArchivo.ID, 0)
  else
    Result := 0;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetExists: boolean;
var
  bExiste: Boolean;
begin
  bExiste := False;

  if GetIsCompleted then
    begin
      case Formulario of
        ftCuit:
          bExiste := fraEmpresaCUIT.IsSelected;
        ftCuitEstableci:
          bExiste := fraEmpresaEmpresa.IsSelected and fraEstablecimiento.IsSelected;
        ftSiniestro:
          bExiste := fraEmpresaSiniestro.IsSelected;
        ftTipoNumero:
          bExiste := not edNumero.IsEmpty and fraCodDescTipo.IsSelected;
        ftNumero:
          bExiste := not IsEmptyString(edNumNumeroDesde.Text) and IsFormularioNumeroValido(Tipo, Trim(edNumNumeroDesde.Text));
        ftJuicio:
          bExiste := fraJuicio.IsSelected;
        ftBiblioratoSecuencia:
          bExiste := not edBibliorato.IsEmpty and not edNota.IsEmpty and fraEmpresaNota.IsSelected;
        ftFecha:
          bExiste := not edFecha.IsEmpty and IsFechaValida(edFecha.Date);
        ftProveedor:
          bExiste := fraProveedor.IsSelected;
        ftEntidadVendedor:
          bExiste := fraEntidadCUIT.IsSelected and fraVendedorCUIT.IsSelected;
        ftVendedor:
          bExiste := fraVendedoresCUIT.IsSelected;
        ftCuil:
          bExiste := fraTrabajad.IsSelected;
        ftContratoCuil:
          bExiste := fraEmpresaTrab.IsSelected and fraTrabajadorTrab.IsSelected;
        ftExtractoBancario:
          bExiste := fraBancoExtracto.IsSelected and fraCuentaBancariaExtracto.IsSelected and not edFechaExtracto.IsEmpty and IsFechaValida(edFechaExtracto.Date);
        ftAnioPeriodo:
          bExiste := not IsEmptyString(edAnioPeriodo.Periodo.Valor) and IsPeriodoValido(edAnioPeriodo.Periodo.Valor);
        ftCBU:
          bExiste := fraCuentaPago.IsSelected;
        ftPrestador:
          bExiste := fraPrestador.IsSelected;
        ftTexto:
          bExiste := not IsEmptyString(edTexto.Text) and IsFormularioTextoValido(Tipo, Trim(edTexto.Text));
        ftLegajoPers:
          bExiste := fraCodTipo.IsSelected;
      end;
    end;

  Result := bExiste;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetIsSelected: boolean;
begin
  result := fraTipoArchivo.IsSelected;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetIsCompleted: boolean;
begin
  result := false;
  if GetIsSelected then
  begin
    case Formulario of
      ftCuit:
        result := fraEmpresaCUIT.IsSelected;
      ftCuitEstableci:
        result := fraEmpresaEmpresa.IsSelected and fraEstablecimiento.IsSelected;
      ftSiniestro:
        result := not edSiniestro.IsEmpty and not edOrden.IsEmpty;
      ftTipoNumero:
        result := not edNumero.IsEmpty and fraCodDescTipo.IsSelected;
      ftNumero:
        result := not IsEmptyString(edNumNumeroDesde.Text);  // not edNumNumeroDesde.IsEmpty;
      ftJuicio:
        result := fraJuicio.IsSelected;
      ftBiblioratoSecuencia:
        result := not edBibliorato.IsEmpty and not edNota.IsEmpty and fraEmpresaNota.IsSelected;
      ftFecha:
        result := not edFecha.IsEmpty;
      ftProveedor:
        result := fraProveedor.IsSelected;
      ftEntidadVendedor:
        result := fraEntidadCUIT.IsSelected and fraVendedorCUIT.IsSelected;
      ftVendedor:
        result := fraVendedoresCUIT.IsSelected;
      ftCuil:
        result := fraTrabajad.IsSelected;
      ftContratoCuil:
        result := fraEmpresaTrab.IsSelected and fraTrabajadorTrab.IsSelected;
      ftExtractoBancario:
        result := fraBancoExtracto.IsSelected and fraCuentaBancariaExtracto.IsSelected and not edFechaExtracto.IsEmpty;
      ftAnioPeriodo:
        result := not IsEmptyString(edAnioPeriodo.Periodo.Valor);
      ftCBU:
        result := fraCuentaPago.IsSelected;
      ftPrestador:
        result := fraPrestador.IsSelected;
      ftTexto:
        result := not IsEmptyString(edTexto.Text);
      ftLegajoPers:
        result := fraCodTipo.IsSelected;
    end;
  end
  else result := false;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetClave: string;
var
  sCad: String;
begin
  if IsSelected then
  begin
    case Formulario of
      ftCuit:
        sCad := fraEmpresaCUIT.edContrato.Text;
      ftCuitEstableci:
        sCad := fraEmpresaEmpresa.edContrato.Text + '|' + fraEstablecimiento.edCodigo.Text;
      ftSiniestro:
        sCad := Iif(edSiniestro.Value = 0, '', IntToStr(edSiniestro.Value)) + '|' + Iif(edSiniestro.Text = '', '', Iif(edOrden.Value = 0, '', IntToStr(edOrden.Value)));  // esto es porque por defecto el orden viene ahora con 1
      ftTipoNumero:
        sCad := edNumero.Text + '|' + fraCodDescTipo.Codigo;
      ftNumero:
        sCad := edNumNumeroDesde.Text;
      ftJuicio:
        sCad := fraJuicio.Codigo;
      ftBiblioratoSecuencia:
        sCad := edBibliorato.Text + '|' + edNota.Text + '|' + fraEmpresaNota.edContrato.Text;
      ftFecha:
        sCad := Iif(edFecha.IsEmpty, '', edFecha.Text);
      ftProveedor:
        sCad := fraProveedor.edIdentificador.Text;
      ftEntidadVendedor:
        sCad := fraEntidadCUIT.CodBanco + '|' + fraVendedorCUIT.Codigo;
      ftVendedor:
        sCad := fraVendedoresCUIT.CUIT;
      ftCuil:
        sCad := fraTrabajad.CUIL;
      ftContratoCuil:
        sCad := fraEmpresaTrab.edContrato.Text + '|' + fraTrabajadorTrab.CUIL;
      ftExtractoBancario:
        sCad := fraBancoExtracto.Codigo + '|' + fraCuentaBancariaExtracto.Codigo + '|' + Iif(edFechaExtracto.IsEmpty, '', edFechaExtracto.Text);
      ftAnioPeriodo:
        sCad := Iif(edAnioPeriodo.Periodo.Ano = 0, '', IntToStr(edAnioPeriodo.Periodo.Ano)) + '|' + Iif(edAnioPeriodo.Periodo.Mes = 0, '', IntToStr(edAnioPeriodo.Periodo.Mes));
      ftCBU:
        sCad := fraCuentaPago.Codigo;
      ftPrestador:
        sCad := Trim(IntToStr(fraPrestador.IDPrestador));
      ftTexto:
        sCad := edTexto.Text;
      ftLegajoPers:
        sCad := fraCodTipo.Codigo;
    end;
  end
  else
    sCad := '';

  if Instr(sCad, '||') > 0 then
    sCad := strReplace(sCad, '||', '|');

  Result := sCad;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.VerificarSiniestro;
var
 sSql : string;
 bEsUsuarioTercerizadora: Boolean;
begin
  FHuboError := False;
  bEsUsuarioTercerizadora := EsUsuarioDeTercerizadora();

  fraEmpresaSiniestro.Clear;
  fraTrabajadorSiniestro.Clear;
  edFechaSiniestro.Clear;
  edJuicio.Clear;

  sSql := 'SELECT ex_cuil, ex_fechaaccidente, ex_contrato Contrato,' +
                 'ART.SIN.Get_ListaNrosJuicioExp(ex_siniestro, ex_orden, ex_recaida) juicio ' +
            'FROM art.sex_expedientes' + GetDBLink() + ' sex ' +
           'WHERE sex.ex_siniestro = :siniestro ' +
             'AND sex.ex_orden = :orden ' +
             'AND sex.ex_recaida = 0 ' +
             Iif(bEsUsuarioTercerizadora, 'AND art.siniestro.is_sinitercerizado(ex_siniestro, ex_orden, ex_recaida) = ''S''', '');

  if not edSiniestro.IsEmpty and not edOrden.IsEmpty then
    with GetQueryEx(sSql, [edSiniestro.Text, edOrden.Text]) do
      try
        if eof then
          begin
            if bEsUsuarioTercerizadora then
              begin
                MsgBox('Usted no tiene permiso para ver este siniestro', MB_ICONERROR + MB_OK);
                edSiniestro.Clear;
                edOrden.Value := 1;
                FHuboError := True;
              end;
          end
        else
          begin
            fraEmpresaSiniestro.Contrato := FieldByName('contrato').AsInteger;
            fraTrabajadorSiniestro.CUIL  := FieldByName('ex_cuil').AsString;
            edFechaSiniestro.Date        := FieldByName('ex_fechaaccidente').AsDateTime;
            edJuicio.Text                := FieldByName('juicio').AsString;
          end;
      finally
        free;
      end;

  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edSiniestroExit(Sender: TObject);
begin
  VerificarSiniestro;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edOrdenExit(Sender: TObject);
begin
  VerificarSiniestro;
end;
{------------------------------------------------------------------------------}
destructor TfraFiltroArchivo.Destroy;
begin
  fraEstablecimiento.Free;
  inherited;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetIdArchivo: integer;
var
 sSql : string;
begin
  sSql := 'select ar_id from rar_archivo where ar_tipo = :tipo and ar_clave = :clave';
  result := ValorSqlEx(sSql, [Tipo, Clave], '-1');
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.DoCargarClaveArchivo(ATipo: Integer; ACadena: String);
var
 scadizq, scadcentr, scadder: string;
 posicion: integer;
begin
  posicion := pos('|', ACadena);
  if posicion > 0 then
    begin
      scadizq := trim(copy(ACadena, 0, posicion - 1));
      scadder := trim(copy(ACadena, posicion + 1, length(ACadena) - posicion + 1));

      posicion := pos('|', scadder);
      if posicion > 0 then
        begin
          scadcentr := trim(copy(scadder, 0, posicion - 1));
          scadder   := trim(copy(scadder, posicion + 1, length(scadder) - posicion + 1));
        end;
    end;

  case Formulario of
    ftCuit:
      fraEmpresaCUIT.Contrato := StrToIntDef(ACadena, 0);
    ftCuitEstableci:
      begin
        fraEmpresaEmpresa.Contrato := StrToIntDef(scadizq, 0);
        OnFraEmpresaChange(nil);
        if fraEmpresaEmpresa.IsSelected then
          fraEstablecimiento.Codigo := scadder
        else
          fraEstablecimiento.Clear;
      end;
    ftSiniestro:
      begin
        edSiniestro.Text := scadizq;
        edOrden.Text     := scadder;
        edOrdenExit( nil );
      end;
    ftTipoNumero:
      begin
        edNumero.Text         := scadizq;
        fraCodDescTipo.Codigo := scadder;
      end;
    ftNumero:
      begin
        edNumNumeroDesde.Text := ACadena;
        DoCargarDatosNumero(TableName, edNumNumeroDesde.Text, ATipo);
      end;
    ftJuicio:
      begin
        fraJuicio.Codigo := ACadena;
        fraJuicioChange( nil );
      end;
    ftBiblioratoSecuencia:
      begin
        edBibliorato.Text       := scadizq;
        edNota.Text             := scadcentr;
        fraEmpresaNota.Contrato := StrToIntDef(scadder, 0);
        DoCargarDatosNotaEmision(edBibliorato.Value, edNota.Value);
      end;
    ftFecha:
      edFecha.Date := Iif(Is_FechaValida(ACadena), StrToDate(ACadena), 0);
    ftProveedor:
      fraProveedor.Value := StrToIntDef(ACadena, 0);
    ftEntidadVendedor:
      begin
        fraEntidadCUIT.CodBanco := scadizq;
        fraVendedorCUIT.Entidad := StrToIntDef(fraEntidadCUIT.Codigo, 0);
        fraVendedorCUIT.Codigo  := scadder;
      end;
    ftVendedor:
      fraVendedoresCUIT.Value := Get_IdVendedor(ACadena);
    ftCuil:
      fraTrabajad.CUIL := ACadena;
    ftContratoCuil:
      begin
        fraEmpresaTrab.Contrato := StrToIntDef(scadizq, 0);
        OnfraEmpresaTrabChange(nil);
        fraTrabajadorTrab.CUIL  := scadder;
        OnfraTrabajadorTrabChange(nil);
      end;
    ftExtractoBancario:
      begin
        fraBancoExtracto.Codigo          := scadizq;
        OnfraBancoExtractoChange(nil);
        fraCuentaBancariaExtracto.Codigo := scadcentr;
        OnfraCuentaBancariaExtractoChange(nil);
        edFechaExtracto.Date             := Iif(Is_FechaValida(scadder), StrToDate(scadder), 0);
      end;
    ftAnioPeriodo:
      begin
        edAnioPeriodo.Periodo.Ano := StrToIntDef(scadizq, 0);
        edAnioPeriodo.Periodo.Mes := StrToIntDef(scadder, 0);
      end;
    ftCBU:
      fraCuentaPago.Codigo := ACadena;
    ftPrestador:
      fraPrestador.Value := StrToIntDef(ACadena, 0);
    ftTexto:
      edTexto.Text := ACadena;
    ftLegajoPers:
      fraCodTipo.Codigo := ACadena;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.SetIdArchivo(const Value: integer);
var
 Cadena, sSql: string;
 Q: TSDQuery;
begin
  sSql := 'select ar_clave, ar_tipo from rar_archivo where ar_id = :ar_id';
  Q    := GetQueryEx(sSql, [Value]);

  if Q.RecordCount > 0 then
  begin
    Tipo   := Q.FieldByName('ar_tipo').AsInteger;
    Cadena := Q.FieldByName('ar_clave').AsString;

    DoCargarClaveArchivo(Tipo, Cadena);
  end;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetReadOnly: boolean;
begin
  result := FReadOnly;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.SetReadOnly(const Value: boolean);
begin
  if FReadOnly <> Value then
    begin
      VclExtra.LockControls([fraEmpresaCUIT, edBibliorato, edNota, fraEmpresaNota,
                             fraEmpresaEmpresa, fraEstablecimiento, fraJuicio, edNumNumeroDesde,
                             edSiniestro, edOrden, edNumero, fraCodDescTipo, fraEntidadCUIT,
                             fraVendedorCUIT, fraVendedoresCUIT, fraTrabajad, fraEmpresaTrab,
                             fraTrabajadorTrab, fraBancoExtracto, fraCuentaBancariaExtracto,
                             edFechaExtracto, edAnioPeriodo, fraCuentaPago, fraTipoArchivo,
                             btnCargarCodigoBarras], Value);

      FReadOnly := Value;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.ClearArchivo(AGetFocus: Boolean = True);
var
  iTipo: integer;
begin
  iTipo := Tipo;
  Clear;
  if AGetFocus then
  begin
    {$IFDEF ART2}
    fraTipoArchivo.Value := iTipo;
    {$ELSE}
    fraTipoArchivo.Value := IntToStr(iTipo);
    {$ENDIF}
    Formulario := StrToFormulario(fraTipoArchivo.sdqDatos.FieldByName('TA_FORMULARIO').AsString);
  end else
    Tipo := iTipo;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsCartaDocumento: Boolean;
begin
  Result := (IsSelected and CartaDocumento(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsHigYSeguridad: Boolean;
begin
  Result := (IsSelected and (TableName = 'RHS_HYS_ARCHIVO'));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsAMP: Boolean;
begin
  Result := (IsSelected and (TableName = 'HCE_CARPETAESTAMP'));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsConstrucciones: Boolean;
begin
  Result := (IsSelected and (TableName = 'HAR_AVISOOBRANRORECEPCION'));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.DoCargarDatosNotaEmision(Bibliorato: Integer; Secuencia: TTableId);
var
  sSql: String;
begin
  fraEmpresaNota.Clear;

  if (Bibliorato > 0) and (Secuencia > 0) then
    begin
      sSql := 'SELECT NO_CONTRATO, NO_OBSERVACIONES ' +
                'FROM EMI.INO_NOTA' + GetDBLink() + ' ' +
               'WHERE NO_BIBLIORATO = :Biblio ' +
                 'AND NO_SECUENCIA = :Sec';

      with GetQueryEx(sSql, [Bibliorato, Secuencia]) do
        try
          if not Eof then
            begin
              fraEmpresaNota.Contrato := FieldByName('NO_CONTRATO').AsInteger;
              edObservaciones.Text    := FieldByName('NO_OBSERVACIONES').AsString;
            end;
        finally
          Free;
        end;
    end;

  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNotaExit(Sender: TObject);
begin
  if not edBibliorato.ReadOnly and not edNota.ReadOnly then
    DoCargarDatosNotaEmision(edBibliorato.Value, edNota.Value);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNotaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edBibliorato.ReadOnly) and (not edNota.ReadOnly) then
    DoCargarDatosNotaEmision(edBibliorato.Value, edNota.Value);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetIdTipoArchivo: Integer;
begin
  Result := StrToIntDef(fraTipoArchivo.ID, 0);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetClaveCartaDoc: string;
var
  sCad: String;
begin
  if FCodigoBarrasPorCartaDoc and IsSelected then
    sCad := edNumNumeroDesde.Text
  else
    sCad := '';

  if Instr(sCad, '||') > 0 then
    sCad := strReplace(sCad, '||', '|');

  Result := sCad;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoCartaDocumento: Boolean;
begin
  Result := (IsSelected and TipoCartaDocumento(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCartaDocumento: Boolean;
begin
  Result := (IsSelected and TipoArchivoCartaDocumento(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTesoreria: Boolean;
begin
  Result := (IsSelected and (TableName = 'RCE_CHEQUEEMITIDO'));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.fraJuicioChange(Sender: TObject);
var
 sSql : string;
begin
  sSql := 'SELECT jt_demandante demandante, jt_demandado demandado ' +
          '  FROM legales.ljt_juicioentramite' + GetDBLink() + ' ' +
          ' WHERE jt_id = :IdJuicio';

  if fraJuicio.IsSelected then
    with GetQueryEx(sSql, [fraJuicio.ID]) do
      try
        if eof then
          begin
            edDemandante.Clear;
            edDemandado.Clear;
          end
        else
          begin
            edDemandante.Text := FieldByName('demandante').AsString;
            edDemandado.Text  := FieldByName('demandado').AsString;
          end;
      finally
        free;
      end
  else
    begin
      edDemandante.Clear;
      edDemandado.Clear;
    end;

  framesInternosDataChange(Self);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.DoCargarDatosNumero(Tabla, Numero: String; TipoArchivo: Integer; NroEstableci: Integer = 0);
var
  sSql: String;
  bCargar: Boolean;
begin
  bCargar := True;

  if Tabla = 'HCE_CARPETAESTAMP' then
    sSql := 'SELECT ''CUIT: '' || UTILES.ARMAR_CUIT(CE_CUIT) || '' - R. Social: '' || EM_NOMBRE || '' - Contrato: '' || TRIM(TO_CHAR(CO_CONTRATO)) || ' +
                   ''' // Est.: '' || TRIM(TO_CHAR(ES_NROESTABLECI)) || '': '' || ES_NOMBRE || '' // Trab.: '' || TJ_NOMBRE || '' - CUIL: '' || UTILES.ARMAR_CUIT(CE_CUIL) ' +
              'FROM CTJ_TRABAJADOR, AES_ESTABLECIMIENTO, ACO_CONTRATO, AEM_EMPRESA, HYS.HCE_CARPETAESTAMP ' +
             'WHERE CE_CUIT = EM_CUIT ' +
               'AND CO_IDEMPRESA = EM_ID ' +
               'AND CO_CONTRATO = AFILIACION.GET_CONTRATOVIGENTE(CE_CUIT, CE_FECHAALTA) ' +
               'AND CO_CONTRATO = ES_CONTRATO ' +
               'AND ES_NROESTABLECI = CE_ESTABLECI ' +
               'AND CE_CUIL = TJ_CUIL ' +
               'AND CE_ID = :Id'

  else if Tabla = 'HAR_AVISOOBRANRORECEPCION' then
    sSql := 'SELECT ''Contrato: '' || TRIM(TO_CHAR(CO_CONTRATO)) || '' // Est.: '' || TRIM(TO_CHAR(ES_NROESTABLECI)) || '': '' || ES_NOMBRE || '' // Dirección: '' || ' +
                     'ART.UTILES.ARMAR_DOMICILIO(ES_CALLE, ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, NULL) || '' - '' || ' +
                     'ART.UTILES.ARMAR_LOCALIDAD(ES_CPOSTAL, DECODE(ES_CPOSTALA, ''99999999'', NULL, ES_CPOSTALA), ES_LOCALIDAD, ES_PROVINCIA) ' +
                'FROM AFI.AES_ESTABLECIMIENTO, AFI.ACO_CONTRATO, AFI.AEM_EMPRESA, HYS.HAR_AVISOOBRANRORECEPCION ' +
               'WHERE EM_CUIT = AR_CUIT ' +
                 'AND CO_CONTRATO = ART.AFILIACION.GET_CONTRATOVIGENTE(AR_CUIT, AR_FECHAALTA) ' +
                 'AND ES_CONTRATO = CO_CONTRATO ' +
                 'AND ES_NROESTABLECI = AR_ESTABLECI ' +
                 'AND AR_NRORECEPCION = :Id ' +
                 Iif(NroEstableci >= 1, 'AND AR_ESTABLECI = ' + SqlValue(NroEstableci), '')

  else if Tabla = 'VCD_CARTASDOC' then
    sSql := 'SELECT ''CUIT: '' || UTILES.ARMAR_CUIT(CUIT) || '' - R. Social: '' || NOMBREEMP || '' - Contrato: '' || TRIM(TO_CHAR(CONTRATO)) || '' // Trab.: '' || NOMBRETRAB || '' - CUIL: '' || UTILES.ARMAR_CUIT(CUIL) ' +
              'FROM (SELECT CA_NROCARTADOC NROCARTADOC, CA_CUIT CUIT, CA_RAZON_SOCIAL NOMBREEMP, CA_CONTRATO CONTRATO, CA_NOMBRE_TRABAJADOR NOMBRETRAB, CA_CUIL CUIL ' +
                      'FROM ARCHIVO.VCA_CARTA ' +
                     'WHERE CA_NROCARTADOC = :Id)'

  else if IsTipoArchivoCaja() then
    sSql := 'SELECT AR_OBSERVACIONES ' +
              'FROM RAR_ARCHIVO ' +
             'WHERE AR_TIPO = ' + SqlValue(TipoArchivo) + ' ' +
               'AND AR_CLAVE = :Clave'

  else if Tabla = 'LEGALES.LME_MEDIACION' then
     sSql := 'SELECT ME_DEMANDANTE || '' C/ '' || ME_DEMANDADO ' +
               'FROM LEGALES.LME_MEDIACION ' +
              'WHERE ME_NUMEROFOLIO = :Id'

  else
    begin
      edInfoAdicionalNro.Clear;
      bCargar := False;
    end;

  if bCargar then
    edInfoAdicionalNro.Text := ValorSqlEx(sSql, [Numero]);

  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNumNumeroDesdeExit(Sender: TObject);
begin
  if not edNumNumeroDesde.ReadOnly then
    DoCargarDatosNumero(TableName, edNumNumeroDesde.Text, Tipo);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNumNumeroDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not edNumNumeroDesde.ReadOnly then
    DoCargarDatosNumero(TableName, edNumNumeroDesde.Text, Tipo);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsSiniestro: Boolean;
begin
  Result := (IsSelected and (TableName = 'SEX_EXPEDIENTES'));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsCartaComercialCobranzas: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_CC_COBR));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCartaComercial: Boolean;
begin
  Result := IsCartaComercialCobranzas();
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCaja: Boolean;
begin
  Result := (IsSelected and unUtilsArchivo.Is_TipoArchivoCaja(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoSiniestros: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_SINIESTRO));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoVendedores: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_VENDEDOR));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoExamenesPreocupacionales: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_EXAMENPREOC));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoExtractosBancarios: Boolean;
begin
  Result := (IsSelected and TipoArchivoExtractosBancarios(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCuentasPagarViaticos: Boolean;
begin
  Result := (IsSelected and TipoArchivoCuentasPagarViaticos(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCajaGirosTransferencias: Boolean;
begin
  Result := (IsSelected and TipoArchivoCajaGirosTransferencias(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoBalance: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_BALANCE));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoAfiliaciones: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_AFILIAC));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoIncapacidades: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_INCAPACID));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCDSIN: Boolean;
begin
  Result := (IsSelected and ((IdTipoArchivo = ID_CARPETA_CD_SIN) or (IdTipoArchivo = ID_CARPETA_CD_INCA) or
                             (IdTipoArchivo = ID_CARPETA_CD_PRDINSIN) or (IdTipoArchivo = ID_CARPETA_CD_LEGSIN)));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCDAFI: Boolean;
begin
  Result := (IsSelected and ((IdTipoArchivo = ID_CARPETA_CD_AFI) or (IdTipoArchivo = ID_CARPETA_CD_COB) or
                             (IdTipoArchivo = ID_CARPETA_CD_LEGCONTR) or (IdTipoArchivo = ID_CARPETA_CD_PRDINCON)));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCDHYS: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_CD_HYS));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.framesInternosDataChange(Sender: TObject);
begin
  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edFechaExit(Sender: TObject);
begin
  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edFechaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not edFecha.ReadOnly then
    inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNumeroExit(Sender: TObject);
begin
  inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not edNumero.ReadOnly then
    inherited Change;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.fraEntidadCUITExit(Sender: TObject);
begin
  inherited;
  fraEntidadCUIT.FrameExit(Sender);
  fraVendedorCUIT.Entidad := StrToIntDef(fraEntidadCUIT.Codigo, 0);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.fraVendedorCUITExit(Sender: TObject);
begin
  inherited;
  fraVendedorCUIT.FrameExit(Sender);

  if fraVendedorCUIT.IsSelected then
    fraEntidadCUIT.Codigo := IntToStr(fraVendedorCUIT.Entidad);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsFormularioArchivoContratos: Boolean;
begin
  Result := (IsSelected and (Formulario = ftCuit));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnfraEmpresaTrabChange(Sender: TObject);
begin
  if Assigned(Sender) then   // Si no fue llamado desde FraTrabajadorChange
    fraTrabajadorTrab.Clear;

  framesInternosDataChange(Self);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnfraTrabajadorTrabChange(Sender: TObject);
var
  bExisteRelLab: Boolean;
begin
  if fraEmpresaTrab.IsSelected and fraTrabajadorTrab.IsSelected then
    begin
      bExisteRelLab := Is_RelacionLaboralActual_o_Historica(fraEmpresaTrab.CUIT, fraTrabajadorTrab.CUIL);

      if not PermitirRelLaboralInexistente and not bExisteRelLab then
        begin
          InfoHint(fraTrabajadorTrab, 'El trabajador ' + fraTrabajadorTrab.Nombre + ' (' + fraTrabajadorTrab.CUIL + ') no pertenece ni ha pertenecido a la empresa seleccionada.');
          fraTrabajadorTrab.Clear;
        end;
    end;

  framesInternosDataChange(Self);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnfraBancoExtractoChange(Sender: TObject);
begin
  fraCuentaBancariaExtracto.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBancoExtracto.IsSelected then
    fraCuentaBancariaExtracto.ExtraCondition := fraCuentaBancariaExtracto.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBancoExtracto.Value)
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.OnfraCuentaBancariaExtractoChange(Sender: TObject);
begin
  if not fraBancoExtracto.IsSelected and fraCuentaBancariaExtracto.IsSelected then
    {$IFDEF ART2}
    fraBancoExtracto.Value := StrToIntDef(fraCuentaBancariaExtracto.cmbDescripcion.Cells[5, fraCuentaBancariaExtracto.cmbDescripcion.Row], 0);
    {$ELSE}
    fraBancoExtracto.Value := fraCuentaBancariaExtracto.cmbDescripcion.Cells[5, fraCuentaBancariaExtracto.cmbDescripcion.Row];
    {$ENDIF}
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edAnioPeriodoExit(Sender: TObject);
var
  bPerInvalido: Boolean;
begin
  inherited;
  bPerInvalido := (edAnioPeriodo.Periodo.Mes > pvMaxPeriodo);
  if bPerInvalido then
    begin
      edAnioPeriodo.Periodo.Mes := 1;
      Verificar(True, edAnioPeriodo, 'El periodo debe ser menor o igual a ' + IntToStr(pvMaxPeriodo));
    end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.FrameExit(Sender: TObject);
begin
  inherited;
  FHuboError := False;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.CodBarrasASubClaves(FormularioAct: TFormulario; CodBarras: String; var SubClave1, SubClave2, SubClave3, SubClave4: String): Boolean;
var
  sCad, sNroEstabl, sNroContrato, sNroSin, sNroOrd: String;
  sAnio, sPer, sCuil, sCodBanco, sCodVend: String;
  iLongCodBarras, iPosSeparador: Integer;
  Ok: Boolean;
  function GetPosSeparador(Codigo: String): Integer;
  var
    iPosSep: Integer;
  begin
    iPosSep := Instr(CodBarras, '-');
    if iPosSep = 0 then
      begin
        iPosSep  := Instr(CodBarras, '''');   // tuve problemas porque los guiones los lee como tildes
        if iPosSep = 0 then
          iPosSep := Instr(CodBarras, ' ');
      end;

    Result := iPosSep;
  end;
  function SacarGuiones_Especiales(Codigo: String): String;
  var
    sCod: String;
  begin
    sCod := SacarGuiones(Codigo);
    sCod := StringReplace(sCod, '''', '', [rfReplaceAll]);   // tuve problemas porque los guiones los lee como tildes

    Result := sCod;
  end;
begin
  SubClave1 := '';
  SubClave2 := '';
  SubClave3 := '';
  SubClave4 := '';

  if IsEmptyString(CodBarras) then
    Ok := False
  else
    begin
      Ok := True;

      case FormularioAct of
        ftFecha, ftProveedor, ftCuit, ftPrestador, ftLegajoPers:
          SubClave1 := CodBarras;
        ftSiniestro:
          begin
            iPosSeparador  := GetPosSeparador(CodBarras);
            iLongCodBarras := Length(CodBarras);

            if iPosSeparador > 0 then
              begin
                sNroSin := StrLeft(CodBarras, iPosSeparador-1);
                sNroOrd := StrMid(CodBarras, iPosSeparador+1);
              end
            else if iLongCodBarras = 11 then
              begin
                sNroSin := StrLeft(CodBarras, 8);
                sNroOrd := StrRight(CodBarras, 3);
              end
            else
              begin
                sNroSin := StrLeft(CodBarras, iLongCodBarras-3);
                sNroOrd := StrRight(CodBarras, 3);
              end;

            SubClave1 := sNroSin;
            SubClave2 := sNroOrd;
          end;
        ftTipoNumero:
          begin
            SubClave1 := StrLeft(CodBarras, 7);
            SubClave2 := StrRight(CodBarras, 3);
          end;
        ftNumero:
          SubClave1 := Trim(StrLeft(CodBarras, 13));
        ftJuicio:
          SubClave1 := StrLeft(CodBarras, 8);
        ftCuitEstableci:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                sNroContrato := StrLeft(CodBarras, iPosSeparador-1);
                sNroEstabl   := StrMid(CodBarras, iPosSeparador+1);

                SubClave1 := sNroContrato;
                SubClave2 := sNroEstabl;
              end
            else
              Ok := False;
          end;
        ftBiblioratoSecuencia:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                SubClave1 := StrLeft(CodBarras, iPosSeparador-1);

                sCad          := StrMid(CodBarras, iPosSeparador+1);
                iPosSeparador := GetPosSeparador(sCad);
                if iPosSeparador > 0 then
                  begin
                    SubClave2 := StrLeft(sCad, iPosSeparador-1);
                    SubClave3 := StrMid(sCad, iPosSeparador+1);
                  end
                else
                  Ok := False;
              end
            else
              Ok := False;
          end;
        ftEntidadVendedor:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                sCodBanco := StrLeft(CodBarras, iPosSeparador-1);
                sCodVend  := StrMid(CodBarras, iPosSeparador+1);

                SubClave1 := sCodBanco;
                SubClave2 := sCodVend;
              end
            else
              Ok := False;
          end;
        ftVendedor:
          SubClave1 := IntToStr(Get_IdVendedor(SacarGuiones_Especiales(CodBarras)));
        ftCuil:
          SubClave1 := SacarGuiones_Especiales(CodBarras);
        ftContratoCuil:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                sNroContrato := StrLeft(CodBarras, iPosSeparador-1);
                sCuil        := StrMid(CodBarras, iPosSeparador+1);

                SubClave1 := sNroContrato;
                SubClave2 := SacarGuiones_Especiales(sCuil);
              end
            else
              Ok := False;
          end;
        ftExtractoBancario:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                SubClave1 := StrLeft(CodBarras, iPosSeparador-1);

                sCad           := StrMid(CodBarras, iPosSeparador+1);
                iPosSeparador  := GetPosSeparador(sCad);
                if iPosSeparador > 0 then
                  begin
                    SubClave2 := StrLeft(sCad, iPosSeparador-1);
                    SubClave3 := StrMid(sCad, iPosSeparador+1);
                  end
                else
                  Ok := False;
              end
            else
              Ok := False;
          end;
        ftAnioPeriodo:
          begin
            iPosSeparador := GetPosSeparador(CodBarras);

            if iPosSeparador > 0 then
              begin
                sAnio := StrLeft(CodBarras, iPosSeparador-1);
                sPer  := StrMid(CodBarras, iPosSeparador+1);

                SubClave1 := sAnio;
                SubClave2 := sPer;
              end
            else
              Ok := False;
          end;
        ftCBU:
          SubClave1 := SacarGuiones_Especiales(CodBarras);
        ftTexto:
          SubClave1 := StrLeft(CodBarras, 100);
      else
        Ok := False;
      end;

      SubClave1 := Trim(SubClave1);
      SubClave2 := Trim(SubClave2);
      SubClave3 := Trim(SubClave3);
      SubClave4 := Trim(SubClave4);
    end;

  Result := Ok and (not IsEmptyString(SubClave1));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.btnCargarCodigoBarrasClick(Sender: TObject);
var
  sCodBarras: String;
  sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
  FormularioAct: TFormulario;
begin
  try
    if Formulario = ftNone then
      MsgBox('Debe indicar un tipo de archivo', MB_OK + MB_ICONERROR)
    else
      begin
        sCodBarras := Trim(Get_CodigoBarras(Sender));

        if IsEmptyString(sCodBarras) then
          FCodigoBarrasOk := False
        else
          begin
            FormularioAct := FFormulario;
            if FCodigoBarrasPorCartaDoc then
              FormularioAct := ftNumero;

            FCodigoBarrasOk := CodBarrasASubClaves(FormularioAct, sCodBarras, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

            if FCodigoBarrasOk then
              begin
                case FormularioAct of
                  ftCuit:
                    fraEmpresaCUIT.Contrato := StrToInt(sSubClave1);
                  ftSiniestro:
                    begin
                      edSiniestro.Value := StrToInt(sSubClave1);  // para sacar los 0 de la izq.
                      if not IsEmptyString(sSubClave2) then
                        begin
                          edOrden.Value := StrToInt(sSubClave2);

                          edOrdenExit( nil );
                        end;
                    end;
                  ftTipoNumero:
                    begin
                      edNumero.Value        := StrToInt(sSubClave1);
                      fraCodDescTipo.Codigo := sSubClave2;
                    end;
                  ftNumero:
                    begin
                      edNumNumeroDesde.Text := sSubClave1;
                      DoCargarDatosNumero(TableName, edNumNumeroDesde.Text, Tipo);
                    end;
                  ftJuicio:
                    begin
                      fraJuicio.Codigo := sSubClave1;
                      fraJuicioChange( nil );
                    end;
                  ftCuitEstableci:
                    begin
                      fraEmpresaEmpresa.Contrato  := StrToInt(sSubClave1);  // para sacar los 0 de la izq.
                      OnFraEmpresaChange(nil);
                      if not IsEmptyString(sSubClave2) then
                        fraEstablecimiento.Codigo := sSubClave2;
                    end;
                  ftBiblioratoSecuencia:
                    begin
                      edBibliorato.Value := StrToInt(sSubClave1);
                      if not IsEmptyString(sSubClave2) then
                        begin
                          edNota.Value := StrToInt(sSubClave2);
                          if not IsEmptyString(sSubClave3) then
                            fraEmpresaNota.Contrato := StrToInt(sSubClave3);
                        end;
                      DoCargarDatosNotaEmision(edBibliorato.Value, edNota.Value);
                    end;
                  ftFecha:
                    // edFecha.Date := ToDate(sSubClave1, 'dd/mm/yyyy');
                    edFecha.Date := Iif(Is_FechaValida(sSubClave1), StrToDate(sSubClave1), 0);
                  ftProveedor:
                    fraProveedor.Value := StrToInt(sSubClave1);
                  ftEntidadVendedor:
                    begin
                      fraEntidadCUIT.CodBanco := sSubClave1;
                      fraVendedorCUIT.Entidad := StrToIntDef(fraEntidadCUIT.Codigo, 0);
                      if not IsEmptyString(sSubClave2) then
                        fraVendedorCUIT.Codigo := sSubClave2;
                    end;
                  ftVendedor:
                    fraVendedoresCUIT.Value := StrToInt(sSubClave1);
                  ftCuil:
                    fraTrabajad.CUIL := sSubClave1;
                  ftContratoCuil:
                    begin
                      fraEmpresaTrab.Contrato := StrToInt(sSubClave1);  // para sacar los 0 de la izq.
                      fraTrabajadorTrab.CUIL  := sSubClave2;
                    end;
                  ftExtractoBancario:
                    begin
                      fraBancoExtracto.Codigo          := sSubClave1;
                      OnfraBancoExtractoChange(nil);
                      fraCuentaBancariaExtracto.Codigo := sSubClave2;
                      OnfraCuentaBancariaExtractoChange(nil);
                      edFechaExtracto.Date             := Iif(Is_FechaValida(sSubClave3), StrToDate(sSubClave3), 0);
                    end;
                  ftAnioPeriodo:
                    begin
                      edAnioPeriodo.Periodo.Ano := StrToInt(sSubClave1);
                      if not IsEmptyString(sSubClave2) then
                        edAnioPeriodo.Periodo.Mes := StrToInt(sSubClave2);
                    end;
                  ftCBU:
                    fraCuentaPago.Codigo := sSubClave1;
                  ftPrestador:
                    fraPrestador.Value := StrToInt(sSubClave1);
                  ftTexto:
                    edTexto.Text := sSubClave1;
                  ftLegajoPers:
                    fraCodTipo.Codigo := sSubClave1;
                end;
              end
            else
              MsgBox('Error al intentar leer el código de barras - Posiblemente el formato no sea el que corresponda.', MB_OK + MB_ICONERROR);
          end;
      end;
  except
    on E: Exception do
      ErrorMsg(E, 'Error al intentar leer el código de barras - Posiblemente el formato no sea el que corresponda.');
  end;
end;
{------------------------------------------------------------------------------}
function TipoArchivoToFormulario(ATipoArchivo: TTableId): TFormulario;
var
  sFormulario, sSql: String;
begin
  sSql := 'SELECT TA_FORMULARIO ' +
            'FROM RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = :Id';
  sFormulario := ValorSqlEx(sSql, [ATipoArchivo]);

  if sFormulario = 'CUIT' Then
    Result := ftCuit
  else if sFormulario = 'SIN' Then
    Result := ftSiniestro
  else if sFormulario = 'TN' Then
    Result := ftTipoNumero
  else if sFormulario = 'N' Then
    Result := ftNumero
  else if AreIn(sFormulario,  ['JA', 'JD', 'JUIE']) Then
    Result := ftJuicio
  else if sFormulario = 'CE' Then
    Result := ftCuitEstableci
  else if sFormulario = 'BS' Then
    Result := ftBiblioratoSecuencia
  else if sFormulario = 'FECHA' Then
    Result := ftFecha
  else if sFormulario = 'PROV' Then
    Result := ftProveedor
  else if sFormulario = 'EV' Then
    Result := ftEntidadVendedor
  else if sFormulario = 'VEND' Then
    Result := ftVendedor
  else if sFormulario = 'CUIL' Then
    Result := ftCuil
  else if sFormulario = 'CT' Then
    Result := ftContratoCuil
  else if sFormulario = 'EB' Then
    Result := ftExtractoBancario
  else if sFormulario = 'TRI' Then
    Result := ftAnioPeriodo
  else if sFormulario = 'CC' Then
    Result := ftCBU
  else if sFormulario = 'PREST' Then
    Result := ftPrestador
  else if sFormulario = 'T' Then
    Result := ftTexto
  else if sFormulario = 'LP' Then
    Result := ftLegajoPers
  else
    Result := ftNone;
end;
{------------------------------------------------------------------------------}
function ClaveACodBarras(ATipoArchivo: TTableId; AClave: String; var CodBarras: String): Boolean;
var
  FormularioAct: TFormulario;
  sCodBarras, sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
  Ok: Boolean;
begin
  Ok := True;

  GetSubClaves(AClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
  FormularioAct := TipoArchivoToFormulario(ATipoArchivo);

  case FormularioAct of
    ftCuit, ftNumero, ftJuicio, ftFecha, ftProveedor, ftPrestador, ftTexto, ftLegajoPers:
      CodBarras := sSubClave1;
    ftSiniestro:
      CodBarras := LPad(sSubClave1, '0', 8) + LPad(sSubClave2, '0', 3);
    ftTipoNumero:
      CodBarras := LPad(sSubClave1, '0', 7) + LPad(sSubClave2, '0', 3);
    ftCuitEstableci:
      CodBarras := sSubClave1 + '-' + sSubClave2;
    ftBiblioratoSecuencia:
      CodBarras := sSubClave1 + '-' + sSubClave2 + '-' + sSubClave3;
    ftEntidadVendedor:
      CodBarras := sSubClave1 + '-' + sSubClave2;
    ftVendedor:
      CodBarras := PonerGuiones(sSubClave1);
    ftCuil:
      CodBarras := PonerGuiones(sSubClave1);
    ftContratoCuil:
      CodBarras := sSubClave1 + '-' + PonerGuiones(sSubClave2);
    ftExtractoBancario:
      CodBarras := sSubClave1 + '-' + sSubClave2 + '-' + sSubClave3;
    ftAnioPeriodo:
      CodBarras := sSubClave1 + '-' + sSubClave2;
    ftCBU:
      CodBarras := PonerGuiones(sSubClave1);
  else
    Ok := False;
  end;

  sCodBarras := Trim(CodBarras);

  Result := Ok and (sCodBarras <> '') and not AreIn(sCodBarras,  ['-', '--', '---']);
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edOrdenKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edOrden.ReadOnly) then
  begin
    VerificarSiniestro;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.edSiniestroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edSiniestro.ReadOnly) then
  begin
    VerificarSiniestro;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetDescripcionTipo: string;
begin
  if fraTipoArchivo.IsSelected then
    Result := fraTipoArchivo.cmbDescripcion.Text
  else
    Result := '';
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsFechaValida(Fecha: TDateTime): Boolean;
begin
  Result := (Fecha >= ART_MINFECHA) and (Fecha <= ART_MAXFECHA);
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsPeriodoValido(Periodo: String): Boolean;
begin
  Result := (Periodo >= GetPeriodo(ART_MINFECHA, fpAnioMes)) and (Periodo <= GetPeriodo(ART_MAXFECHA, fpAnioMes));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsFormularioNumeroValido(TipoArchivo: Integer; Numero: String): Boolean;
var
  sWhere, sTabla, sSql: String;
begin
  sTabla := '';
  sSql   := 'SELECT 1';

  if TipoArchivoMedicinaLaboral(TipoArchivo) then
    begin
      sTabla := 'HYS.HCE_CARPETAESTAMP' + GetDBLink();
      sWhere := 'CE_ID = :Id';
    end
  else
    case TipoArchivo of
      ID_CARPETA_CD:
        begin
          sTabla := GetTablaCartasDoc(CartasDocPermiteBajas) + GetDBLink();
          sWhere := 'CA_NROCARTADOC = :NroCarta AND CA_TIPOSALIDA = ''C''';
        end;

      ID_CARPETA_TESORERIA:
        begin
          sTabla := 'RCE_CHEQUEEMITIDO' + GetDBLink();
          sWhere := 'CE_ORDENPAGO = :OP';
        end;

      ID_CARPETA_CONSTRUCC:
        begin
          sTabla := 'HYS.HAR_AVISOOBRANRORECEPCION' + GetDBLink();
          sWhere := 'AR_NRORECEPCION = (CASE WHEN TO_NUMBER(:Rec) BETWEEN 30000 AND 32000 THEN TO_CHAR(AR_NRORECEPCION) ' +  // TK 31825
                                       'ELSE :Rec END)';
        end;

      ID_CARPETA_SUMARIOS:
        begin
          sTabla := 'LEGALES.LSU_SUMARIO' + GetDBLink();
          sWhere := 'SU_NUMEROSUMARIO = :NroSum';
        end;

      ID_CARPETA_OFICIOS:
        begin
          sTabla := 'LEGALES.LOJ_OFICIOJUDICIAL' + GetDBLink();
          sWhere := 'OJ_NUMEROOFICIO = :NroOfic';
        end;

      ID_CARPETA_CC_COBR:
        begin
          sTabla := 'ARCHIVO.VCA_CARTA' + GetDBLink();
          sWhere := 'CA_NROCARTADOC = :NroCarta AND CA_TIPOSALIDA = ''CC'' AND CA_COD_AREA = ' + SqlValue(AREA_COB);
        end;

      ID_CARPETA_COMPRAS:
        begin
          sTabla := 'APPS.PO_HEADERS_ALL' + GetDBLinkFNCL();
          sWhere := 'SEGMENT1 = :Segm';
        end;

      ID_CARPETA_MEDIACIONES:
        begin
          sTabla := 'LEGALES.LME_MEDIACION' + GetDBLink();
          sWhere := 'ME_NUMEROFOLIO = :NroFolio';
        end;
    end;

  if IsEmptyString(sTabla) then
    Result := True
  else
    begin
      sSql := sSql + ' FROM ' + sTabla + ' WHERE ' + sWhere;

      if TipoArchivo = ID_CARPETA_COMPRAS then
        begin
          if not Assigned(dmFinancials) then
            Application.CreateForm(TdmFinancials, dmFinancials);

          dmFinancials.Conectar;
          try
            Result := dmFinancials.ExisteSqlEx(sSql, [Numero]);
          finally
            dmFinancials.Desconectar;
          end;
        end
      else
        Result := ExisteSqlEx(sSql, [Numero]);
    end;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsFormularioTextoValido(TipoArchivo: Integer; Texto: String): Boolean;
var
  bOk: Boolean;
  sCod, sSql: String;
begin
  bOk := False;

  case TipoArchivo of
    ID_CARPETA_TRBANC:
      begin
        sCod := StrLeft(Texto, 2);

        sSql := 'SELECT 1 ' +
                  'FROM ZBA_BANCO ' +
                 'WHERE BA_ABREVIATURA = :Cod';
        bOk := ExisteSqlEx(sSql, [sCod]);

        if bOk then
          begin
            sCod := StrMid(Texto, 3);
            bOk  := IsNumber(sCod);
          end;
      end;
  end;

  Result := bOk;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsCartaDocumentoValida(CartaDoc: String; ControlFoco: TControl = nil; MostrarErrores: Boolean = True; PermitirBajas: Boolean = False): Boolean;
var
  sTablaCarta, sSql: String;
  bError: Boolean;
  iEstableci, iContrato: Integer;
begin
  Result := False;

  if IsTipoCartaDocumento() then
    begin
      CartaDoc := Trim(CartaDoc);

      bError := (CartaDoc = '');
      if bError then
        if MostrarErrores then
          Verificar(True, ControlFoco, 'Debe ingresar el Nro. de Carta Documento')
        else
          Exit;

      sTablaCarta := GetTablaCartasDoc(PermitirBajas);

      sSql := 'SELECT 1 ' +
                'FROM ' + sTablaCarta + GetDBLink() + ' ' +
               'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                 'AND CA_TIPOSALIDA = ''C''';

      bError := not ExisteSqlEx(sSql, [CartaDoc]);
      if bError then
        if MostrarErrores then
          Verificar(True, ControlFoco, 'El Nro. de Carta Documento no existe')
        else
          Exit;

      if IsTipoArchivoCDSIN() then
        begin
          sSql := 'SELECT 1 ' +
                    'FROM ' + sTablaCarta + GetDBLink() + ' ' +
                   'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                     'AND CA_SINI = :Sin ' +
                     'AND CA_ORD = :Ord';

          bError := not ExisteSqlEx(sSql, [CartaDoc, edSiniestro.Value, edOrden.Value]);
          if bError then
            if MostrarErrores then
              Verificar(True, ControlFoco, 'El Nro. de Carta Documento no corresponde al expediente')
            else
              Exit;
        end
      else if IsTipoArchivoCDAFI() or IsTipoArchivoCDHYS() then
        begin
          sSql := 'SELECT 1 ' +
                    'FROM ' + sTablaCarta + GetDBLink() + ' ' +
                   'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                     'AND CA_CONTRATO = :Contrato';

          if IsTipoArchivoCDHYS() then   // es frame contrato+establecimiento
            iContrato := fraEmpresaEmpresa.Contrato
          else
            iContrato := fraEmpresaCUIT.Contrato;

          bError := not ExisteSqlEx(sSql, [CartaDoc, iContrato]);
          if bError then
            begin
              if MostrarErrores then
                Verificar(True, ControlFoco, 'El Nro. de Carta Documento no corresponde al contrato')
              else
                Exit;
            end
          else
            begin
              if IsTipoArchivoCDHYS() then
                begin
                  sSql := 'SELECT 1 ' +
                            'FROM ' + sTablaCarta + GetDBLink() + ' ' +
                           'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                             'AND CA_CONTRATO = :Contrato ' +
                             'AND NVL(CA_NROESTABLECIMIENTO, 1) = :NroEstableci';

                  if fraEstablecimiento.IsSelected then
                    begin
                      iEstableci := StrToInt(fraEstablecimiento.Codigo);
                      bError     := not ExisteSqlEx(sSql, [CartaDoc, iContrato, iEstableci]);
                    end
                  else
                    bError := True;

                  if bError then
                    if MostrarErrores then
                      Verificar(True, ControlFoco, 'El Nro. de Carta Documento no corresponde al establecimiento')
                    else
                      Exit;
                end;
            end;
        end;
    end;

  Result := True;
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.GetCodigo: String;
begin
  Result := fraTipoArchivo.Codigo;
end;
{------------------------------------------------------------------------------}
function GetTablaCartasDoc(APermitirBajas: Boolean): String;
begin
  Result := 'ARCHIVO.' + Iif(APermitirBajas, 'VCA_CARTA_ALL', 'VCA_CARTA');
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoOPTesoreria: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_TESORERIA));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoExtractoBancario: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_EXTRBANC));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoMedLaboralRX: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_ML_RX));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCartasDocumento: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_CD));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoTransferenciasBanc: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_TRBANC));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoExamenesPreocupacionalesRX: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_EXAMENPREOC_RX));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoRX: Boolean;
begin
  Result := (IsSelected and unUtilsArchivo.Is_TipoArchivoRX(IdTipoArchivo));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoHigieneYSeguridad: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_HYS));
end;
{------------------------------------------------------------------------------}
function TfraFiltroArchivo.IsTipoArchivoCompras: Boolean;
begin
  Result := (IsSelected and (IdTipoArchivo = ID_CARPETA_COMPRAS));
end;
{------------------------------------------------------------------------------}
procedure TfraFiltroArchivo.tbBuscarSiniestroClick(Sender: TObject);
var
  IdSiniestro: TTableId;
  iSiniestro, iOrden, iRecaida: Integer;
begin
  IdSiniestro := unDlgBusSiniestro.GetIdSiniestro(ART_EMPTY_ID, ART_EMPTY_ID, ART_EMPTY_ID, ART_MINFECHA, True, False);

  if IdSiniestro <> ART_EMPTY_ID then
    begin
      DecodeIdSiniestro(IdSiniestro, iSiniestro, iOrden, iRecaida);

      edSiniestro.Value := iSiniestro;
      edSiniestro.OnExit(nil);

      edOrden.Value     := iOrden;
      edOrden.OnExit(nil);
    end;
end;
{------------------------------------------------------------------------------}
end.

