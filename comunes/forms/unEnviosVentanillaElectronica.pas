unit unEnviosVentanillaElectronica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider, ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls, FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask,
  RxToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Vcl.CheckLst, ARTCheckListBox,unImportCryptoSrt, unArtDbFrame,
  unFraEmpresa, unfraEmpresaAGENDA, unFraEstablecimientoAGENDA, unFraTrabajadorAGENDA;

type
  TfrmEnviosVentanillaElectronica = class(TfrmCustomGridABM)
    Panel1: TPanel;
    fraEV_USUARIOALTA: TfraCodDesc;
    Label17: TLabel;
    Panel2: TPanel;
    edVE_FECHAALTAHasta: TDateComboBox;
    Label9: TLabel;
    edVE_FECHAALTADesde: TDateComboBox;
    Label8: TLabel;
    Panel3: TPanel;
    fraEV_USUARIOMODIF: TfraCodDesc;
    Label1: TLabel;
    fraEV_USUENVIO: TfraCodDesc;
    Label2: TLabel;
    edVE_FECHAMODIFHasta: TDateComboBox;
    Label3: TLabel;
    edVE_FECHAMODIFDesde: TDateComboBox;
    Label4: TLabel;
    edVE_FECHAENVIOHasta: TDateComboBox;
    Label5: TLabel;
    edVE_FECHAENVIODesde: TDateComboBox;
    Label6: TLabel;
    Panel5: TPanel;
    Panel4: TPanel;
    cblEV_IDESTADO: TARTCheckListBox;
    Panel6: TPanel;
    Panel7: TPanel;
    cblEV_IDTIPOENVIO: TARTCheckListBox;
    sdqConsultaEV_ID: TFloatField;
    sdqConsultaEV_CUIT: TStringField;
    sdqConsultaCATEGORIA: TStringField;
    sdqConsultaTIPOCOMUNICACION: TStringField;
    sdqConsultaEV_FECHAENVIO: TDateTimeField;
    sdqConsultaUSUARIOENVIO: TStringField;
    sdqConsultaESTADO: TStringField;
    sdqConsultaEV_FECHAALTA: TDateTimeField;
    sdqConsultaUSUARIOALTA: TStringField;
    sdqConsultaEV_FECHAMODIF: TDateTimeField;
    sdqConsultaEV_USUMODIF: TStringField;
    sdqConsultaEV_FECHABAJA: TDateTimeField;
    sdqConsultaUSUARIOBAJA: TStringField;
    sdqConsultaUSUARIOMODIF: TStringField;
    sdqConsultaFECHAALTA: TDateTimeField;
    sdqConsultaFECHAMODIF: TDateTimeField;
    sdqConsultaFECHABAJA: TDateTimeField;
    sdqConsultaEV_IDESTABLECI: TFloatField;
    sdqConsultaEV_CUIL: TStringField;
    sdqConsultaEV_IDCATEGORIA: TFloatField;
    sdqConsultaEV_IDTIPOCOMUNICACION: TFloatField;
    sdqConsultaEV_ARCHIVO: TStringField;
    sdqConsultaEV_USUENVIO: TStringField;
    sdqConsultaEV_IDESTADO: TFloatField;
    sdqConsultaEV_USUALTA: TStringField;
    sdqConsultaEV_USUBAJA: TStringField;
    sdqConsultaEV_IDENVIO: TFloatField;
    sdqConsultaEV_IDTIPOENVIO: TFloatField;
    sdqConsultaCUIT: TStringField;
    pnlDatos: TPanel;
    Label10: TLabel;
    fraCategoria: TfraCodDesc;
    fraTipo: TfraCodDesc;
    Label11: TLabel;
    edFechaEnvio: TDateComboBox;
    Label12: TLabel;
    fraUsuarioEnvio: TfraCodDesc;
    Label13: TLabel;
    fraEstado: TfraCodDesc;
    Label14: TLabel;
    fraTipoEnvio: TfraCodDesc;
    Label15: TLabel;
    pnlGen: TPanel;
    pnlEstablecimientoEnvio: TPanel;
    pnlContactoEnvio: TPanel;
    pnlEmpresaEnvio: TPanel;
    sdqInsert: TSDQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField2: TDateTimeField;
    StringField6: TStringField;
    DateTimeField3: TDateTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    DateTimeField4: TDateTimeField;
    StringField9: TStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    FloatField2: TFloatField;
    StringField10: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField5: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField15: TStringField;
    sdqEnvio: TSDQuery;
    FloatField8: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    DateTimeField8: TDateTimeField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateTimeField9: TDateTimeField;
    StringField21: TStringField;
    DateTimeField10: TDateTimeField;
    StringField22: TStringField;
    StringField23: TStringField;
    DateTimeField11: TDateTimeField;
    StringField24: TStringField;
    DateTimeField12: TDateTimeField;
    DateTimeField13: TDateTimeField;
    DateTimeField14: TDateTimeField;
    FloatField9: TFloatField;
    StringField25: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField26: TStringField;
    StringField27: TStringField;
    FloatField12: TFloatField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField30: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    FSQL: String;
    fraEmpresaEnvio: TfraEmpresaAGENDA;
    fraEstablecimientoEnvio: TfraEstablecimientoAGENDA;
    fraContactoEnvio: TfraTrabajadorAGENDA;
    procedure AjustarAlto;
  public
//    function Envio(AComunicacion: String; APathPDFNotifiacion: String; ACuit: String; ATipoComunicacion: Integer; AIdCarta: Integer): TResultArchivosSrt;
    function GenerarEnvioVentanilla(AIdTipoComunicacion: Integer; AIdTipoEnvio: Integer; AComunicacion: String; AIdEnvio: Integer = 0; AFileName: String = ''; ACUIT: String = ''; AIdEstablecimiento: Integer = 0; ACUIL: String = ''; AEnviarAhora: Boolean = False): Boolean;
    function EnviarPorVentanilla(AIdEnvio: Integer; AFileName: String = ''): Boolean;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmEnviosVentanillaElectronica: TfrmEnviosVentanillaElectronica;

implementation

uses
  unFiltros, Cuit, unDmPrincipal, unFraEstablecimiento, AnsiSql, General;

{$R *.dfm}

{ TfrmEnviosVentanillaElectronica }

procedure TfrmEnviosVentanillaElectronica.ClearControls;
begin
  inherited;

end;

procedure TfrmEnviosVentanillaElectronica.ClearData;
begin
  inherited;

end;

function TfrmEnviosVentanillaElectronica.DoABM: Boolean;
begin
  Result := False;
end;

function TfrmEnviosVentanillaElectronica.GenerarEnvioVentanilla(AIdTipoComunicacion: Integer; AIdTipoEnvio: Integer; AComunicacion: String;
                                                                AIdEnvio: Integer = 0; AFileName: String = ''; ACUIT: String = '';
                                                                AIdEstablecimiento: Integer = 0; ACUIL: String = ''; AEnviarAhora: Boolean = False): Boolean;
var
  nIdEstado, iIdCategoria: Integer;
  sSql: String;
begin
  if not FileExists(AFileName) or (not AEnviarAhora) then
    nIdEstado := 1
  else
    nIdEstado := 2;

  // El EV_IDCATEGORIA se calcula en forma automática en base a la tabla SET_ESERVICIOSTIPOS entrando por EV_IDTIPOCOMUNICACION
  iIdCategoria := ValorSqlIntegerEx('select et_idcategoria from SET_ESERVICIOSTIPOS where et_id = :et_id', [AIdTipoComunicacion]);
  sSql := sdqInsert.SQL.Text;
  EjecutarSqlSTEx(sSql, [ACUIT, AIdEstablecimiento, ACUIL, iIdCategoria, AFileName, AIdEnvio, AIdTipoEnvio, AComunicacion]);

  if nIdEstado = 2 then
    EnviarPorVentanilla(AIdEnvio, AFileName);

  Result := False;
end;

function TfrmEnviosVentanillaElectronica.EnviarPorVentanilla(AIdEnvio: Integer; AFileName: String): Boolean;
var
  //ResultadoSrt: TResultArchivosSrt;
  sComunicacion, sCuit: String;
  iTipoComunicacion, iIdCarta: Integer;
begin
  OpenQueryEx(sdqEnvio, [AIdEnvio]);

{
  while not sdqEnvio.Eof do
  begin


  ***** Falta definir el manejo de errores en envíos múltiples *****


}


    //si AFileName no existe lo traigo de la tabla...
    if not FileExists(AFileName) then
      AFileName := sdqEnvio.FieldByName('EV_ARCHIVO').AsString;

    sComunicacion := sdqEnvio.FieldByName('EV_COMUNICACION').AsString;
    sCuit := sdqEnvio.FieldByName('EV_CUIT').AsString;
    iTipoComunicacion := sdqEnvio.FieldByName('EV_IDTIPOCOMUNICACION').AsInteger;
    iIdCarta := sdqEnvio.FieldByName('EV_IDCARTA').AsInteger;
    //invoco al WS con el objeto del pájaro







    Result := EnviarSrtResult(AFileName, sComunicacion, sCuit, iTipoComunicacion, -1, iIdCarta);
    //el objeto devuelve los errores, queda pendiente como los tratamos y en dónde los guardamos

    //sdqEnvio.Next;
//  end;
end;

//function TfrmEnviosVentanillaElectronica.Envio(AComunicacion: String; APathPDFNotifiacion: String; ACuit: String; ATipoComunicacion: Integer;
//                                               AIdCarta: Integer): TResultArchivosSrt;
//var
//  EnvioSrt : TEnvioArchivosSRT;
//  ResultadoSrt : TResultArchivosSrt;
//begin
//  setLength( EnvioSrt.Archivos,1);
//  setLength( EnvioSrt.Cuits,1);
//  EnvioSrt.Archivos[0] := APathPDFNotifiacion;
//  EnvioSrt.Cuits[0] := ACuit;
//  EnvioSrt.Comunicacion := AComunicacion;
//  EnvioSrt.TipoComunicacion := ATipoComunicacion;
//  EnvioSrt.IdConsulta := GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');
//  EnvioSrt.IdCarta := AIdCarta;
//  ResultadoSrt := EnviarCartaSRT(EnvioSrt);
//  Result :=  ResultadoSrt;
//end;


procedure TfrmEnviosVentanillaElectronica.FormCreate(Sender: TObject);
  procedure SetearFrame(AFrame: TFrame; AParent: TPanel);
  begin
    AFrame.Parent := AParent;
    AFrame.Align := alTop;
    AFrame.Top := 0;
    AParent.AutoSize := False;
    AParent.AutoSize := True;
  end;
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  AutoColWidths := True;
  fraEmpresaEnvio := TfraEmpresaAGENDA.Create(Self);
  fraEstablecimientoEnvio := TfraEstablecimientoAGENDA.Create(Self);
  fraContactoEnvio := TfraTrabajadorAGENDA.Create(Self);
  SetearFrame(fraEmpresaEnvio, pnlEmpresaEnvio);
  SetearFrame(fraEstablecimientoEnvio, pnlEstablecimientoEnvio);
  SetearFrame(fraContactoEnvio, pnlContactoEnvio);

  tbNuevo.Visible := False;
  tbEliminar.Visible := False;
end;

procedure TfrmEnviosVentanillaElectronica.LoadControls;
begin
  edFechaEnvio.Date             := sdqConsulta.FieldByName('EV_FECHAENVIO').AsDateTime;
  fraEmpresaEnvio.CUIT          := sdqConsulta.FieldByName('EV_CUIT').AsString;
  fraEstablecimientoEnvio.Value := sdqConsulta.FieldByName('EV_IDESTABLECI').AsInteger;
  fraContactoEnvio.CUIL         := sdqConsulta.FieldByName('EV_CUIL').AsString;
  fraCategoria.Codigo            := sdqConsulta.FieldByName('EV_IDCATEGORIA').AsString;
  fraTipo.Codigo                 := sdqConsulta.FieldByName('EV_IDTIPOCOMUNICACION').AsString;
  fraUsuarioEnvio.Codigo        := sdqConsulta.FieldByName('EV_USUENVIO').AsString;
  fraEstado.Codigo               := sdqConsulta.FieldByName('EV_IDESTADO').AsString;
  fraTipoEnvio.Codigo            := sdqConsulta.FieldByName('EV_IDTIPOENVIO').AsString;
  AjustarAlto;
end;

procedure TfrmEnviosVentanillaElectronica.AjustarAlto;
begin
  pnlEmpresaEnvio.Visible := not fraEmpresaEnvio.IsEmpty;
  pnlEmpresaEnvio.Tag := iif(pnlEmpresaEnvio.Visible, pnlEmpresaEnvio.Height, 0);
  pnlEstablecimientoEnvio.Visible := not fraEstablecimientoEnvio.IsEmpty;
  pnlEstablecimientoEnvio.Tag := iif(pnlEstablecimientoEnvio.Visible, pnlEstablecimientoEnvio.Height, 0);
  pnlContactoEnvio.Visible := not fraContactoEnvio.IsEmpty;
  pnlContactoEnvio.Tag := iif(pnlContactoEnvio.Visible, pnlContactoEnvio.Height, 0);
  fpAbm.Height := pnlDatos.Height + pnlEmpresaEnvio.Tag + pnlEstablecimientoEnvio.Tag + pnlContactoEnvio.Tag + 45;
end;

procedure TfrmEnviosVentanillaElectronica.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmEnviosVentanillaElectronica.Validar: Boolean;
begin
  Result := False;
end;

end.
