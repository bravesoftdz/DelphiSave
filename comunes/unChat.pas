unit unChat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm,
  Vcl.ImgList, XPMenu, RxPlacemnt, Vcl.StdCtrls, Vcl.ExtCtrls, JvExForms, JvScrollBox, JvExControls, JvLabel, Data.DB, Winapi.ShellAPI,
  FormPanel, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Vcl.Buttons, JvAppEvent, JvAppAnimatedIcon, JvFormAnimatedIcon,
  JvAnimTitle, JvComponentBase, JvFormMagnet, JvGradientCaption, SDEngine;

type
  TfrmChat = class(TfrmCustomForm)
    pnBottom: TPanel;
    memoMensaje: TMemo;
    btnEnviar: TButton;
    pnDatosUsuario: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edFechaConexionUsuario: TEdit;
    edConectadoDesde: TEdit;
    edNombreUsuario: TEdit;
    edFechaConexionOperador: TEdit;
    edDniUsuario: TEdit;
    pnMensajes: TPanel;
    scrollMensajes: TScrollBox;
    tMensajes: TTimer;
    fpVentanaInicial: TFormPanel;
    Label6: TLabel;
    rbTomarlo: TRadioButton;
    rbDerivarlo: TRadioButton;
    fraSectores: TfraCodDesc;
    btnAceptar: TBitBtn;
    Bevel11: TBevel;
    tInicial: TTimer;
    gcForm: TJvGradientCaption;
    procedure LabelArchivoClick(Sender: TObject);
    procedure LabelArchivoMouseEnter(Sender: TObject);
    procedure LabelArchivoMouseLeave(Sender: TObject);
    procedure scrollMensajesMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure scrollMensajesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnEnviarClick(Sender: TObject);
    procedure memoMensajeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tMensajesTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fpVentanaInicialBeforeShow(Sender: TObject);
    procedure rbTomarloClick(Sender: TObject);
    procedure rbDerivarloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tInicialTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure fpVentanaInicialClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FChatTomadoPorOtroUsuario: Boolean;
    FIdSesion: Integer;
    FMostrarVentanaInicial: Boolean;
    FPreguntarAlCerrar: Boolean;
    FUltimoMensaje: TLabel;

    function GetMensajeArchivo(const aIdArchivo: Integer): String;

    procedure ActivarAlerta;
    procedure CerrarChat;
    procedure DesactivarAlerta;
    procedure EscribirMensaje(const aCampos: TFields);
    procedure SetIdSesion(const Value: Integer);
  public
    procedure Mostrar;

    property IdSesion: Integer read FIdSesion write SetIdSesion;
  end;

var
  frmChat: TfrmChat;

procedure ActualizarEstadoOperador;

implementation

uses
  unSesion, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, ArtDatabase;

{$R *.dfm}

function TfrmChat.GetMensajeArchivo(const aIdArchivo: Integer): String;
var
  sMensajeArchivo: String;
  sSql: String;
begin
  sMensajeArchivo := 'El usuario ha agregado el archivo @FILE@.';

  sSql :=
    'SELECT ac_nombreoriginal' +
     ' FROM web.wac_archivoschat' +
    '	WHERE ac_id = :id';
  Result := StringReplace(sMensajeArchivo, '@FILE@', ValorSqlEx(sSql, [aIdArchivo]), [rfReplaceAll]);
end;

procedure TfrmChat.btnAceptarClick(Sender: TObject);
begin
  fpVentanaInicial.Close;
end;

procedure TfrmChat.btnEnviarClick(Sender: TObject);
var
  sSql: String;
begin
  memoMensaje.Lines.Text := Trim(memoMensaje.Lines.Text);
  memoMensaje.Lines.Text := InitCap(Copy(memoMensaje.Lines.Text, 1, 1)) + Copy(memoMensaje.Lines.Text, 2, 1000);

  if memoMensaje.Lines.Text = '' then
    Exit;

  sSql :=
    'INSERT INTO web.wmc_mensajeschat (mc_enviadopor, mc_fechaenvio, mc_idsesion, mc_leidoporoperador, mc_leidoporusuario, mc_mensaje)' +
                             ' VALUES (''O'', SYSDATE, :idsesion, ''S'', ''N'', :mensaje)';
  EjecutarSqlEx(sSql, [FIdSesion, memoMensaje.Lines.Text]);

  sSql :=
    'SELECT mc_enviadopor, mc_id, mc_idarchivo, mc_mensaje, mc_tipomensaje' +
     ' FROM web.wmc_mensajeschat' +
   '	WHERE mc_idsesion = :idsesion' +
      ' AND mc_enviadopor = ''O''' +
 ' ORDER BY mc_id DESC';
  with GetQueryEx(sSql, [FIdSesion]) do
  try
    EscribirMensaje(Fields);
    memoMensaje.Clear;
  finally
    Free;
  end;
end;

procedure TfrmChat.CerrarChat;
var
  sMsgFinal: String;
  sSql: String;
begin
  sSql := 'SELECT cc_mensajefinal FROM web.wcc_constanteschat';
  sMsgFinal := ValorSql(sSql);

  BeginTrans;

  try
    sSql :=
      'INSERT INTO web.wmc_mensajeschat (mc_enviadopor, mc_fechaenvio, mc_idsesion, mc_leidoporoperador, mc_leidoporusuario, mc_mensaje, mc_tipomensaje)' +
                               ' VALUES (''O'', SYSDATE, :idsesion, ''S'', ''N'', :mensaje, ''F'')';
    EjecutarSqlSTEx(sSql, [FIdSesion, sMsgFinal]);

    sSql :=
      'UPDATE web.wsc_sesioneschat' +
        ' SET sc_estado = 4,' +
            ' sc_fechacierreconexion = SYSDATE,' +
            ' sc_generadordesconexion = ''O''' +
      ' WHERE sc_id = :id';
    EjecutarSqlSTEx(sSql, [FIdSesion]);
    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;

  FIdSesion := -1;
end;

procedure TfrmChat.EscribirMensaje(const aCampos: TFields);
var
  aLabel: TLabel;
  iTop: Integer;
begin
  iTop := 8;
  if FUltimoMensaje <> nil then
    iTop := FUltimoMensaje.Top + FUltimoMensaje.Height + 8;

  aLabel := TLabel.Create(Self);
  with aLabel do
  begin
    AutoSize := False;
    Font.Size := 10;
    Name := 'lb_' + aCampos.FieldByName('mc_id').AsString;
    Parent := scrollMensajes;
    ParentColor := False;
    ParentFont := False;
    Transparent := False;
    Top := iTop;
    WordWrap := True;

    if aCampos.FieldByName('mc_tipomensaje').AsString = 'A' then   // Es un archivo..
    begin
      Alignment := taRightJustify;
      Cursor := crHandPoint;
      Left := 8;
      Tag := aCampos.FieldByName('mc_idarchivo').AsInteger;

      Caption := GetMensajeArchivo(aCampos.FieldByName('mc_idarchivo').AsInteger);
      Height := 16;
      AutoSize := True;
      AutoSize := False;
      Width := 436;

      OnClick := LabelArchivoClick;
      OnMouseEnter := LabelArchivoMouseEnter;
      OnMouseLeave := LabelArchivoMouseLeave;
    end;

    if (aCampos.FieldByName('mc_tipomensaje').AsString = 'C') then		// Es un mensaje común..
    begin
      if (aCampos.FieldByName('mc_enviadopor').AsString = 'O') then		// Es un mensaje del operador..
      begin
        Color := clGray;
        Font.Color := clWhite;
        Left := 4;

        Caption := aCampos.FieldByName('mc_mensaje').AsString;
        Height := 16;
        AutoSize := True;
        AutoSize := False;
        Width := 444;
      end;

      if (aCampos.FieldByName('mc_enviadopor').AsString = 'U') then		// Es un mensaje del usuario..
      begin
        Color := clOlive;
        Font.Color := clWhite;
        Left := 200;

        Caption := aCampos.FieldByName('mc_mensaje').AsString;
        Height := 16;
        AutoSize := True;
        AutoSize := False;
        Width := 248;
      end;
    end;

    if (aCampos.FieldByName('mc_tipomensaje').AsString = 'F') then		// Es un mensaje de finalización de la conexión..
    begin
      Alignment := taRightJustify;
      Font.Color := clRed;
      Left := 8;

      Caption := aCampos.FieldByName('mc_mensaje').AsString;
      Height := 16;
      AutoSize := True;
      AutoSize := False;
      Width := 436;
    end;

    OnMouseMove := scrollMensajesMouseMove;
  end;

  scrollMensajes.VertScrollBar.Position := 99999999;
  memoMensaje.SetFocus;

  FUltimoMensaje := aLabel;
end;

procedure TfrmChat.FormActivate(Sender: TObject);
begin
  inherited;

  DesactivarAlerta;
end;

procedure TfrmChat.FormClose(Sender: TObject; var Action: TCloseAction);
var
  bCerrarChar: Boolean;
  bSesionAbierta: Boolean;
  sSql: String;
begin
  if FChatTomadoPorOtroUsuario then
    Action := caFree
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM web.wsc_sesioneschat' +
      ' WHERE sc_id = :id' +
        ' AND sc_estado <> 4';
    bSesionAbierta := ExisteSqlEx(sSql, [FIdSesion]);

    if bSesionAbierta and FPreguntarAlCerrar then
      bCerrarChar := MsgAsk('¿ Realmente desea finalizar la sesión de chat ?', 'CONFIRMACIÓN')
    else
      bCerrarChar := True;

    if bCerrarChar then
    begin
      CerrarChat;
      inherited;
    end
    else
      Action := caNone;
  end;
end;

procedure TfrmChat.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  FChatTomadoPorOtroUsuario := False;
  FPreguntarAlCerrar := True;

  sSql :=
    'SELECT oc_idsector' +
     ' FROM web.woc_operadoreschat' +
    ' WHERE oc_idusuario = :idusuario';
  fraSectores.Propiedades.ExtraCondition := ' AND se_id <> ' + SqlValue(String(ValorSqlEx(sSql, [Sesion.ID])));

  inherited;
end;

procedure TfrmChat.FormDestroy(Sender: TObject);
var
  sSql: String;
begin
  if not FChatTomadoPorOtroUsuario then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM web.wsc_sesioneschat' +
      ' WHERE sc_estado <> 4' +
        ' AND sc_id = :id';
    if ExisteSqlEx(sSql, [FIdSesion]) then
      CerrarChat;
  end;

  inherited;
end;

procedure TfrmChat.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  DesactivarAlerta;
end;

procedure TfrmChat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not memoMensaje.Focused then
  begin
    memoMensaje.SelStart := 300;
    memoMensaje.SetFocus;
    memoMensaje.Lines.Text := memoMensaje.Lines.Text + Key;
    memoMensaje.SelStart := 300;
    memoMensaje.SetFocus;
  end;
end;

procedure TfrmChat.FormShow(Sender: TObject);
begin
  tInicial.Enabled := True;
end;

procedure TfrmChat.fpVentanaInicialBeforeShow(Sender: TObject);
begin
  rbTomarlo.Checked := False;
  rbDerivarlo.Checked := False;
  fraSectores.Clear;
  fraSectores.Enabled := False;
end;

procedure TfrmChat.fpVentanaInicialClose(Sender: TObject; var Action: TCloseAction);
var
  sSql: String;
begin
  Verificar((not rbTomarlo.Checked) and (not rbDerivarlo.Checked), nil, 'Debe indicar la acción a tomar.');
  Verificar((rbDerivarlo.Checked) and (fraSectores.IsEmpty), fraSectores.edCodigo, 'Debe indicar el sector al cual quiere derivar el chat.');

  if rbDerivarlo.Checked then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM web.woc_operadoreschat' +
      ' WHERE oc_estado = ''A''' +
        ' AND oc_fechabaja IS NULL' +
        ' AND TO_DATE(TO_CHAR(SYSDATE, ''hh24:mi''), ''hh24:mi'') BETWEEN TO_DATE(NVL(oc_horarioatencioninicio, ''00:00''), ''hh24:mi'') AND TO_DATE(NVL(oc_horarioatencionfin, ''23:59''), ''hh24:mi'')' +
        ' AND oc_idsector = :idsector';
    Verificar((not ExisteSqlEx(sSql, [fraSectores.Value])), fraSectores.edCodigo, 'Este sector no cuenta con operadores disponibles.');
  end;

  inherited;
end;

procedure TfrmChat.LabelArchivoClick(Sender: TObject);
const
  SERVER_DESARROLLO = '\\ntwebart3\';
  SERVER_PRODUCCION = '\\ntwebart1\';
var
  iResult: Integer;
  sRuta: String;
  sSql: String;
begin
  sSql :=
    'SELECT ac_ruta' +
		 ' FROM web.wac_archivoschat' +
	 '	WHERE ac_id = :id';
  if Is_ConectadoProduccion then
    sRuta := SERVER_PRODUCCION + Copy(ValorSqlEx(sSql, [TLabel(Sender).Tag]), 4, 1000)
  else
    sRuta := SERVER_DESARROLLO + Copy(ValorSqlEx(sSql, [TLabel(Sender).Tag]), 4, 1000);

  sRuta := StringReplace(sRuta, '/', '\', [rfReplaceAll]);


  iResult := ShellExecute(Handle, 'open', PChar(sRuta), nil, nil, SW_SHOWNORMAL);
  if iResult <= 32 then
    MsgBox('No se puede abrir el archivo.');
end;

procedure TfrmChat.LabelArchivoMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clBlue;
  TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TfrmChat.LabelArchivoMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWindowText;
  TLabel(Sender).Font.Style := [];
end;

procedure TfrmChat.memoMensajeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btnEnviarClick(Sender);
end;

procedure TfrmChat.Mostrar;
var
  iEstado: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT TO_CHAR(sc_fechaconexionoperador, ''HH24:MM:SS'') horaconexionoperador, TO_CHAR(sc_fechaconexionusuario, ''HH24:MM:SS'') horaconexionusuario,' +
          ' sc_dniusuario, sc_estado, sc_ipusuario, sc_nombreusuario' +
     ' FROM web.wsc_sesioneschat' +
    ' WHERE sc_id = :id';
  with GetQueryEx(sSql, [FIdSesion]) do
  try
    Caption := 'Chateando con ' + FieldByName('sc_nombreusuario').AsString;
    iEstado := FieldByName('sc_estado').AsInteger;
    FMostrarVentanaInicial := (iEstado = 1);

    edFechaConexionUsuario.Text  := FieldByName('horaconexionusuario').AsString;
    edConectadoDesde.Text        := FieldByName('sc_ipusuario').AsString;
    edDniUsuario.Text            := FieldByName('sc_dniusuario').AsString;
    edNombreUsuario.Text         := FieldByName('sc_nombreusuario').AsString;
    memoMensaje.Clear;
  finally
    Free;
  end;

  if iEstado = 1 then    // Si es la primera vez que entra..
  begin
    // Actualizo el estado..
    sSql :=
      'UPDATE web.wsc_sesioneschat' +
        ' SET sc_estado = 2,' +
            ' sc_fechaconexionoperador = SYSDATE,' +
            ' sc_idoperador = :idoperador' +
      ' WHERE sc_id = :id';
    EjecutarSqlEx(sSql, [Sesion.ID, FIdSesion]);

    sSql :=
      'SELECT TO_CHAR(sc_fechaconexionoperador, ''HH24:MM:SS'')' +
       ' FROM web.wsc_sesioneschat' +
      ' WHERE sc_id = :id';
    edFechaConexionOperador.Text := ValorSqlEx(sSql, [FIdSesion]);

    // Dibujo los mensajes..
    sSql :=
      'SELECT mc_enviadopor, mc_id, mc_idarchivo, mc_mensaje, mc_tipomensaje' +
       ' FROM web.wmc_mensajeschat' +
     '	WHERE mc_idsesion = :idsesion' +
   ' ORDER BY mc_id';
    with GetQueryEx(sSql, [FIdSesion]) do
    try
      while not Eof do
      begin
        EscribirMensaje(Fields);
        Next;
      end;
    finally
      Free;
    end;

    // Marco los mensajes como leidos..
    sSql :=
      'UPDATE web.wmc_mensajeschat' +
        ' SET mc_leidoporoperador = ''S''' +
      ' WHERE mc_idsesion = :idsesion';
    EjecutarSqlEx(sSql, [FIdSesion]);
  end;

  Show;
end;

procedure TfrmChat.rbDerivarloClick(Sender: TObject);
begin
  fraSectores.Enabled := True;
  fraSectores.SetFocus;
end;

procedure TfrmChat.rbTomarloClick(Sender: TObject);
begin
  fraSectores.Clear;
  fraSectores.Enabled := False;
end;

procedure TfrmChat.scrollMensajesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  DesactivarAlerta;
  scrollMensajes.SetFocus;
end;

procedure TfrmChat.scrollMensajesMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n := Mouse.WheelScrollLines;
  for i:= 1 to n do
    scrollMensajes.Perform(msg, code, 0);
  scrollMensajes.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmChat.SetIdSesion(const Value: Integer);
begin
  FIdSesion := Value;
end;

procedure TfrmChat.tInicialTimer(Sender: TObject);
var
  iSectorActual: Integer;
  sSql: String;
begin
  tInicial.Enabled := False;

  if FMostrarVentanaInicial then
  begin
    fpVentanaInicial.ShowModal;

    // Chequeo que el chat no haya sido tomado por otro operador..
    sSql :=
      'SELECT 1' +
       ' FROM web.wsc_sesioneschat' +
      ' WHERE sc_estado IN (3, 4)' +
        ' AND sc_id = :id';
    if ExisteSqlEx(sSql, [FIdSesion]) then
    begin
      FChatTomadoPorOtroUsuario := True;
      MsgBox('Este chat ha sido tomado por otro usuario.');
      Close;
    end;


    if rbTomarlo.Checked then
    begin
      // Actualizo el estado..
      sSql :=
        'UPDATE web.wsc_sesioneschat' +
          ' SET sc_estado = 3,' +
              ' sc_idoperador = :idoperador' +
        ' WHERE sc_id = :id';
      EjecutarSqlEx(sSql, [Sesion.ID, FIdSesion]);
    end;

    if rbDerivarlo.Checked then
    begin
      BeginTrans(True);
      try
        sSql :=
          'SELECT sc_idsectoroperador' +
           ' FROM web.wsc_sesioneschat' +
          ' WHERE sc_id = :id';
        iSectorActual := ValorSqlIntegerEx(sSql, [FIdSesion]);

        // Actualizo el estado..
        sSql :=
          'UPDATE web.wsc_sesioneschat' +
            ' SET sc_estado = 1,' +
                ' sc_fechaconexionoperador = NULL,' +
                ' sc_idsectoroperador = :idsectoroperador,' +
                ' sc_idoperador = NULL' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [fraSectores.Value, FIdSesion]);

        // Desmarco los mensajes como leidos..
        sSql :=
          'UPDATE web.wmc_mensajeschat' +
            ' SET mc_leidoporoperador = ''N''' +
          ' WHERE mc_idsesion = :idsesion';
        EjecutarSqlSTEx(sSql, [FIdSesion]);

        // Guardo la derivación..
        sSql :=
          'INSERT INTO web.wcd_chatsderivados (cd_fechaalta, cd_id, cd_idsectordesde, cd_idsectorhasta, cd_idsesion, cd_usualta)' +
                                     ' VALUES (SYSDATE, -1, :idsectordesde, :idsectorhasta, :idsesion, :usualta)';
        EjecutarSqlSTEx(sSql, [iSectorActual, fraSectores.Value, FIdSesion, Sesion.UserID]);

        CommitTrans(True);

        FPreguntarAlCerrar := False;
        Close;
      except
        on E: Exception do
        begin
          Rollback(True);
          MsgBox('No se pudo realizar la derivación. ' + E.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmChat.tMensajesTimer(Sender: TObject);
var
  bChatFinalizado: Boolean;
  bMensajesNuevos: Boolean;
  sSql: String;
begin
  bChatFinalizado := False;
  bMensajesNuevos := False;

  // Dibujo los mensajes..
  sSql :=
    'SELECT mc_enviadopor, mc_id, mc_idarchivo, mc_mensaje, mc_tipomensaje' +
     ' FROM web.wmc_mensajeschat' +
   '	WHERE mc_leidoporoperador = ''N''' +
      ' AND mc_idsesion = :idsesion' +
 ' ORDER BY mc_id';
  with GetQueryEx(sSql, [FIdSesion]) do
  try
    while not Eof do
    begin
      bMensajesNuevos := True;

      if FieldByName('mc_tipomensaje').AsString = 'F' then
        bChatFinalizado := True;

      EscribirMensaje(Fields);
      Next;
    end;
  finally
    Free;
  end;

  // Marco los mensajes como leidos..
  sSql :=
    'UPDATE web.wmc_mensajeschat' +
      ' SET mc_leidoporoperador = ''S''' +
    ' WHERE mc_idsesion = :idsesion';
  EjecutarSqlEx(sSql, [FIdSesion]);

  if bMensajesNuevos then
    ActivarAlerta;

  if bChatFinalizado then
  begin
    btnEnviar.Visible := False;
    memoMensaje.Enabled := False;
    DesactivarAlerta;
  end;
end;

procedure TfrmChat.ActivarAlerta;
begin
  gcForm.FormCaption := 'HAY NUEVOS MENSAJES DE ' + edNombreUsuario.Text;
  gcForm.Active := True;
end;

procedure TfrmChat.DesactivarAlerta;
begin
  gcForm.Active := False;
  gcForm.FormCaption := 'Chateando con ' + edNombreUsuario.Text;
  Caption := 'Chateando con ' + edNombreUsuario.Text;
end;

procedure ActualizarEstadoOperador;
  procedure SetParams(objConsulta: TSDQuery; AValues: Array of TVarRec);
  var
    i: Integer;
  begin
    with objConsulta do
    begin
      for i := Params.Count -1 downto 0 do
        if (Params[i].Name = '=') or (Params[i].Name = '') then
          Params.Delete(i);
      SetParamValues(AValues, Params);
    end;
  end;

var
  aDB: TArtDatabase;
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'UPDATE web.woc_operadoreschat' +
      ' SET oc_estado = ''A'',' +
          ' oc_fechamodif = SYSDATE,' +
          ' oc_usumodif = :usumodif' +
    ' WHERE oc_fechabaja IS NULL' +
      ' AND oc_idusuario = :idusuario';

  aDB := TArtDatabase.Create(nil);
  aQuery := TSDQuery.Create(nil);
  try
    aDB.DatabaseName := 'dbChat';
    aDB.IdleTimeOut := 1000 * 60 * 60;
    aDB.PasswordFile := dmPrincipal.sdbPrincipal.PasswordFile;
    aDB.RemoteDataBase := dmPrincipal.sdbPrincipal.RemoteDatabase;
    aDB.LoginPrompt := False;
    aDB.ServerType := stOracle;
    aDB.SessionName := 'chat';

    aDB.Close;
    aDB.Params.Clear;
    aDB.Open;

    aDB.StartTransaction;

    aQuery.DatabaseName := 'dbChat';
    aQuery.Close;
    aQuery.Params.Clear;
    aQuery.SQL.Clear;
    aQuery.SQL.Add(sSql);

    SetParams(aQuery, [Sesion.UserID, Sesion.ID]);

    aQuery.ExecSQL;

    aDB.Commit;
  finally
    aDB.Close;
    aDB.Free;
  end;
end;

end.
