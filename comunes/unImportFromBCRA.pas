unit unImportFromBCRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ExtCtrls, StdCtrls,
  JvExControls, JvComponent, JvSpecialProgress, FormPanel, Mask, ImgList, XPMenu, Placemnt, Buttons, OleCtrls,
  SHDocVw, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TDatosDeuda = Array[0..6] of String;

type
  TResultImportFromBCRA = record
    CuitExistente: Array of Boolean;
    Error: String;
    Html: Array of String;
    ProcesoCancelado: Boolean;
    SituacionMasComprometida: Array of String;
  end;

type
  TfrmImportFromBCRA = class(TfrmCustomForm)
    Label1: TLabel;
    Label2: TLabel;
    edCuitDesde: TMaskEdit;
    edCuitHasta: TMaskEdit;
    BevelAbm: TBevel;
    btnIniciar: TButton;
    btnCancelar: TButton;
    fpProcesar: TFormPanel;
    progress: TJvSpecialProgress;
    lbAccion: TLabel;
    btnCancelar3: TButton;
    t1: TTimer;
    t2: TTimer;
    fpCodigoSeguridad: TFormPanel;
    wbCodigo: TWebBrowser;
    pnBottom: TPanel;
    edCodigoSeguridad: TEdit;
    btnAceptar: TBitBtn;
    btnCambiarImagen: TBitBtn;
    IdHTTP1: TIdHTTP;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpProcesarShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure t2Timer(Sender: TObject);
    procedure btnCambiarImagenClick(Sender: TObject);
    procedure fpCodigoSeguridadBeforeShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FAutoProcesar: Boolean;
    FCancelarProceso: Boolean;
    FCuitExistente: Array of Boolean;
    FError: String;
    FHtml: Array of String;
    FMostrarMensajes: Boolean;
    FSituacionMasComprometida: Array of String;

    function ParsearHtml(const aCuit, aTexto: String): Boolean;
    function QuitarTags(aHtml: String): String;
    function Validar: Boolean;

    procedure AsignarArray(const aOrigen: Array of Boolean; var aDestino: Array of Boolean); overload;
    procedure AsignarArray(const aOrigen: Array of String; var aDestino: Array of String); overload;
    procedure BuscarCuits;
    procedure ClearControls;
    procedure GuardarDeuda(const aCuit: String; aDatos: TDatosDeuda);
  public
  end;

const
  PATH_CAPTCHA = '\\ntintraweb\Storage_Extranet\status_bcra\';
  URL_1 = 'http://www.bcra.gov.ar/cenries/cr010000.asp?error=0?';
  URL_2 = 'http://www.bcra.gov.ar/cenries/generate-captcha.asp?rnd=%s';
  URL_3 = 'http://www.bcra.gov.ar/cenries/cr010000.asp';

function ImportFromBCRA(const aCuit: String; const aAutoProcesar: Boolean = False; const aMostrarMensajes: Boolean = True): TResultImportFromBCRA; overload;
function ImportFromBCRA(const aCuitDesde, aCuitHasta: String; const aAutoProcesar: Boolean = False;
                       const aMostrarMensajes: Boolean = True): TResultImportFromBCRA; overload;

implementation

uses
  CUIT, unDmPrincipal, CustomDlgs, Strfuncs, AnsiSql, DateTimeFuncs, SqlFuncs, unSesion;

{$R *.dfm}

function ImportFromBCRA(const aCuit: String; const aAutoProcesar: Boolean = False; const aMostrarMensajes: Boolean = True): TResultImportFromBCRA; overload;
begin
  Result := ImportFromBCRA(aCuit, aCuit, aAutoProcesar, aMostrarMensajes);
end;

function ImportFromBCRA(const aCuitDesde, aCuitHasta: String; const aAutoProcesar: Boolean = False;
                       const aMostrarMensajes: Boolean = True): TResultImportFromBCRA; overload;
var
  frmImportFromBCRA: TfrmImportFromBCRA;
begin
  Result.Error := '';
  Result.ProcesoCancelado := False;

  SetLength(Result.CuitExistente, 0);
  SetLength(Result.Html, 0);
  SetLength(Result.SituacionMasComprometida, 0);

  Application.CreateForm(TfrmImportFromBCRA, frmImportFromBCRA);
  with frmImportFromBCRA do
  try
    FAutoProcesar := aAutoProcesar;
    FMostrarMensajes := aMostrarMensajes;

    if aCuitDesde <> '' then
      edCuitDesde.Text := aCuitDesde;

    if aCuitHasta <> '' then
      edCuitHasta.Text := aCuitHasta;

    if (not FAutoProcesar) or (FAutoProcesar and Validar) then
    begin
      frmImportFromBCRA.ShowModal;

      Result.Error            := FError;
      Result.ProcesoCancelado := FCancelarProceso;

      SetLength(Result.CuitExistente, Length(FCuitExistente));
      AsignarArray(FCuitExistente, Result.CuitExistente);

      SetLength(Result.Html, Length(FHtml));
      AsignarArray(FHtml, Result.Html);

      SetLength(Result.SituacionMasComprometida, Length(FSituacionMasComprometida));
      AsignarArray(FSituacionMasComprometida, Result.SituacionMasComprometida);
    end
  finally
    FreeAndNil(frmImportFromBCRA);
  end;
end;


function TfrmImportFromBCRA.ParsearHtml(const aCuit, aTexto: String): Boolean;
var
  aDatosDeuda: TDatosDeuda;
  iLoop: Integer;
  sHtml: String;
  sHtmlColumna: String;
  sHtmlRegistro: String;
begin
  Result := False;

  FCuitExistente[Length(FCuitExistente) - 1] := True;

  // Si no tiene deudas..
  if Pos('No existen deudas registradas para el', aTexto) > 0 then
  begin
    FSituacionMasComprometida[Length(FSituacionMasComprometida) - 1] := '-1';
    Exit;
  end;


  FSituacionMasComprometida[Length(FSituacionMasComprometida) - 1] := '0';


  /////////////////////////////////
  //  **  OBTENGO LOS DATOS  **  //
  /////////////////////////////////

  // Limpio el html..
  sHtml := StringReplace(aTexto, '&nbsp;', '', [rfReplaceAll]);
  sHtml := Copy(sHtml, Pos('DENOMINACION DEL DEUDOR', sHtml), Length(sHtml));
  sHtml := Copy(sHtml, Pos('</tr>', sHtml) + 5, Length(sHtml));
  sHtml := Copy(sHtml, 1, Pos('<table', sHtml));

  while Pos('<tr>', sHtml) > 0 do
  begin
    sHtmlRegistro := Copy(sHtml, Pos('<tr>', sHtml), Pos('</tr>', sHtml) - Pos('<tr>', sHtml));
    sHtmlRegistro := Copy(sHtmlRegistro, Pos('<td', sHtmlRegistro) + 1, Length(sHtmlRegistro)) + '<td>';

    // En este while loopeo columna por columna..
    iLoop := 0;
    while Pos('<td', sHtmlRegistro) > 0 do
    begin
      sHtmlColumna := Copy(sHtmlRegistro, Pos('td', sHtmlRegistro), Pos('<td', sHtmlRegistro) - Pos('td', sHtmlRegistro));
      sHtmlColumna := Trim(QuitarTags('<' + sHtmlColumna));

      aDatosDeuda[iLoop] := sHtmlColumna;

      Inc(iLoop);
      sHtmlRegistro := Copy(sHtmlRegistro, Pos('<td', sHtmlRegistro) + 1, Length(sHtmlRegistro));
    end;

    if StrToIntDef(aDatosDeuda[3], 0) > StrToIntDef(FSituacionMasComprometida[Length(FSituacionMasComprometida) - 1], 0) then
      FSituacionMasComprometida[Length(FSituacionMasComprometida) - 1] := aDatosDeuda[3];

    GuardarDeuda(aCuit, aDatosDeuda);

    sHtml := Copy(sHtml, Pos('</tr>', sHtml) + 5, Length(sHtml));
    sHtml := Copy(sHtml, Pos('<tr bgcolor="#F2F2F2">', sHtml), Length(sHtml));
  end;

  Result := True;
end;

function TfrmImportFromBCRA.QuitarTags(aHtml: String): String;
const
  MAX_LOOPS = 20;
var
  iCount: Integer;
begin
  iCount := 0;

  while Pos('<', aHtml) > 0 do
  begin
    Delete(aHtml, Pos('<', aHtml), Pos('>', aHtml) - Pos('<', aHtml) + 1);
    Inc(iCount);

    // Hago esto para que no quede loopeando eternamente..
    if iCount > MAX_LOOPS then
      Break;
  end;

  Result := aHtml;
end;

function TfrmImportFromBCRA.Validar: Boolean;
begin
  Verificar(not IsCuit(edCuitDesde.Text), edCuitDesde, 'El campo CUIT Desde es inválido.');
  Verificar(not IsCuit(edCuitHasta.Text), edCuitHasta, 'El campo CUIT Hasta es inválido.');
  Verificar((StrToInt64(edCuitDesde.Text) > StrToInt64(edCuitHasta.Text)), edCuitHasta, 'El campo CUIT Hasta debe ser mayor al campo CUIT Desde.');

  Result := True;
end;


procedure TfrmImportFromBCRA.AsignarArray(const aOrigen: Array of Boolean; var aDestino: Array of Boolean);
var
  iLoop: Integer;
begin
  for iLoop := Low(aOrigen) to High(aOrigen) do
    aDestino[iLoop] := aOrigen[iLoop];
end;

procedure TfrmImportFromBCRA.AsignarArray(const aOrigen: Array of String; var aDestino: Array of String);
var
  iLoop: Integer;
begin
  for iLoop := Low(aOrigen) to High(aOrigen) do
    aDestino[iLoop] := aOrigen[iLoop];
end;

procedure TfrmImportFromBCRA.BuscarCuits;
var
  iCuitDesde: Cardinal;
  iCuitHasta: Cardinal;
  iLoop: Cardinal;
  iLoop2: Integer;
  sCuit: String;
  sHtml: String;
begin
  try
    iCuitDesde := StrToInt64(Copy(edCuitDesde.Text, 1, 10));
    iCuitHasta := StrToInt64(Copy(edCuitHasta.Text, 1, 10));
    progress.Maximum := iCuitHasta - iCuitDesde + 1;
    Application.ProcessMessages;


    for iLoop := iCuitDesde to iCuitHasta do
    try
      if FCancelarProceso then
        Break;

      for iLoop2 := 0 to 9 do
      begin
        sCuit := FloatToStr(iLoop) + IntToStr(iLoop2);
        if IsCuit(sCuit) then
          Break;
      end;


      lbAccion.Caption := Format('Descargando CUIT %s...', [PonerGuiones(sCuit)]);
      Application.ProcessMessages;

      if iLoop = iCuitDesde then
      begin
        // Ingreso a la primer URL para que el captcha ande bien..
        sHtml := IdHTTP1.Get(URL_1)
      end;

      // Muestro la imagen de seguridad..
      wbCodigo.Navigate(Format(URL_2, [FormatDateTime('yyyymmddhhnnss', DBDateTime)]));
      fpCodigoSeguridad.height := 160;
      fpCodigoSeguridad.width := 440;
      if fpCodigoSeguridad.ShowModal <> mrOk then
      begin
        FCancelarProceso := True;
        Exit;
      end;

      // Entro a la página que me interesa..
      sHtml := IdHTTP1.Get(Format('%s?CUIT=%s&strVerify=%s&B1=Enviar&primera_vez=1', [URL_3, sCuit, edCodigoSeguridad.Text]));

      lbAccion.Caption := Format('Examinando CUIT %s...', [PonerGuiones(sCuit)]);
      Application.ProcessMessages;

      SetLength(FCuitExistente, Length(FCuitExistente) + 1);
      SetLength(FHtml, Length(FHtml) + 1);
      SetLength(FSituacionMasComprometida, Length(FSituacionMasComprometida) + 1);

      FHtml[Length(FHtml) - 1] := sHtml;

      ParsearHtml(sCuit, sHtml);

      progress.StepIt;
    except
      on E: Exception do
        FError := E.Message;
    end;

    if FMostrarMensajes then
    begin
      if FCancelarProceso then
        MsgBox('El proceso ha sido cancelado.')
      else if FError = '' then
        MsgBox('El proceso ha finalizado exitosamente.')
      else
        MsgBox('Ha ocurrido el siguiente error: ' + FError);
    end;
  finally
    fpProcesar.ModalResult := mrOk;
  end;
end;

procedure TfrmImportFromBCRA.ClearControls;
begin
  edCuitDesde.Clear;
  edCuitHasta.Clear;
end;

procedure TfrmImportFromBCRA.GuardarDeuda(const aCuit: String; aDatos: TDatosDeuda);
begin
  // Si en algún momento se necesita guardar la información de la deuda hay que hacerlo acá..
end;


procedure TfrmImportFromBCRA.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportFromBCRA.btnIniciarClick(Sender: TObject);
begin
  if not Validar then
    Exit;

  FCancelarProceso := False;
  FError := '';

  SetLength(FCuitExistente, 0);
  SetLength(FHtml, 0);
  SetLength(FSituacionMasComprometida, 0);

  lbAccion.Caption := 'Procesando...';
  progress.Minimum := 0;
  progress.Position := 0;

  fpProcesar.ShowModal;
end;

procedure TfrmImportFromBCRA.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  BuscarCuits;
end;

procedure TfrmImportFromBCRA.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmImportFromBCRA.FormCreate(Sender: TObject);
begin
  inherited;

  FAutoProcesar := False;
  FMostrarMensajes := True;

  ClearControls;
end;

procedure TfrmImportFromBCRA.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmImportFromBCRA.FormShow(Sender: TObject);
begin
  inherited;

  if FAutoProcesar then
  begin
    btnIniciarClick(Sender);
    t2.Enabled := True;
  end;
end;

procedure TfrmImportFromBCRA.t2Timer(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportFromBCRA.btnCambiarImagenClick(Sender: TObject);
begin
  try
    wbCodigo.Refresh;
  except
    showmessage('error');
  end;
end;

procedure TfrmImportFromBCRA.fpCodigoSeguridadBeforeShow(Sender: TObject);
begin
  edCodigoSeguridad.Clear;
end;

procedure TfrmImportFromBCRA.btnAceptarClick(Sender: TObject);
begin
  Verificar((edCodigoSeguridad.Text = ''), edCodigoSeguridad, 'Por favor ingrese el código.');

  fpCodigoSeguridad.ModalResult := mrOk;
end;

end.
