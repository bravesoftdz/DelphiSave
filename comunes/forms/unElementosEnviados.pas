unit unElementosEnviados;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, JvExExtCtrls, JvSplitter, StdCtrls, RxRichEd, unArtFrame, unfraUsuarios, Mask,
  DateComboBox, AdvMemo, AdvmWS, JvNavigationPane, OleCtrls, SHDocVw, ImgList, unArt, PatternEdit, IntEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmElementosEnviados = class(TfrmCustomConsulta)
    fraEE_DIRECCIONORIGEN: TfraUsuario;
    Label1: TLabel;
    Label2: TLabel;
    edEE_MOTIVO_LIKE: TEdit;
    Label3: TLabel;
    edEE_DIRECCIONESDESTINO_LIKE: TEdit;
    gbFecha: TGroupBox;
    cmbEE_FECHAMENSAJEDesde: TDateComboBox;
    Label4: TLabel;
    cmbEE_FECHAMENSAJEHasta: TDateComboBox;
    lbAdjuntos: TListBox;
    pnlTitulos: TPanel;
    Label5: TLabel;
    lbArchivosAdjuntos: TLabel;
    chkVerAdjuntos: TCheckBox;
    Separador: TJvOutlookSplitter;
    Separador2: TJvOutlookSplitter;
    memoHTML: TMemo;
    ToolbarMailBody: TToolBar;
    tbPrintBody: TToolButton;
    ImageList: TImageList;
    tbPrinterSetup: TToolButton;
    tbPreviewBody: TToolButton;
    pnlBody: TPanel;
    reTextoCuerpo: TRxRichEdit;
    WebBrowser: TWebBrowser;
    edEE_ID: TIntEdit;
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure lbAdjuntosDblClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Separador2Moved(Sender: TObject);
    procedure chkVerAdjuntosClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbPrinterSetupClick(Sender: TObject);
    procedure tbPrintBodyClick(Sender: TObject);
    procedure tbPreviewBodyClick(Sender: TObject);
  private
    function GetNombreArchivoCompletoLista(Indice: Integer): String;
  protected
    FCheckOrigen: Boolean;
    FExtraCondition: String;
    FIdRegistro: Integer;
    FPathHTML: String;
    FSql: String;
    FTipoRegistro: String;

    function ValidarHTMLUserName(aHtml: String): String;    // Valida que el usuario que va a procesar el formulario HTML sea el mismo que está consultando el e-mail..

    procedure LimpiarExtra;
    procedure SetId(const Value: Integer);
  public
    procedure RefreshData; override;

    property CheckOrigen:    Boolean write FCheckOrigen;
    property ExtraCondition: String  write FExtraCondition;
    property IdCorreo:       Integer write SetId;
    property IdRegistro:     Integer write FIdRegistro;
    property TipoRegistro:   String  write FTipoRegistro;
  end;

  TArchivoCompleto = class
  public
    ArchivoCompleto: String;

    constructor Create(const AValue: String);
  end;

var
  frmElementosEnviados: TfrmElementosEnviados;

implementation

uses
  AnsiSQL, unDmPrincipal, ArchFuncs, ShellAPI, WinShell, unFiltros, unSesion, CustomDlgs, unEnvioMail, unMoldeEnvioMail, General, Internet, Printers, SqlFuncs, unArchivoVisor, unComunes;

{$R *.DFM}

procedure TfrmElementosEnviados.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  aStream: TStringStream;
  iCantTmp: Integer;
  sFileName: String;
  sSql: String;
begin
  inherited;

  with sdqConsulta do
    if Active and not IsEmpty then
    begin
      aStream := TStringStream.Create(FieldByName('ee_cuerpo').AsString);
      try
        LimpiarExtra;

        if (FieldByName('ee_tipocuerpo').AsString = 'H') or (FieldByName('ee_tipocuerpo').AsString = 'T') then
        begin
          iCantTmp := 0;
          WebBrowser.Stop;
          while FileExists(FPathHTML) and (iCantTmp < 10) do
          try
            if not DeleteFile(FPathHTML) then
              Sleep(200);
            Inc(iCantTmp);
          except
            //
          end;

          if FieldByName('ee_cuerpo').IsNull then
            BlobSql('SELECT ee_cuerpoex FROM comunes.cee_emailaenviar WHERE ee_id = ' + FieldByName('ee_id').AsString, memoHTML.Lines)
          else
            memoHTML.Lines.LoadFromStream(AStream);

          if FieldByName('ee_procesarformhtml').AsString = 'F' then
            memoHTML.Lines.Text := StringReplace(memoHTML.Lines.Text, 'action="', 'action="#"', [rfReplaceAll]);

          if FieldByName('ee_tipocuerpo').AsString <> 'H' then
            memoHTML.Lines.Text := StringReplace(
                                   StringReplace(
                                   StringReplace(
                                   StringReplace(ValidarHTMLUserName(memoHTML.Lines.Text),
                                                 #13#10, '<BR>', [rfReplaceAll]),
                                                 #10#13, '<BR>', [rfReplaceAll]),
                                                 #13, '<BR>', [rfReplaceAll]),
                                                 #10, '<BR>', [rfReplaceAll]);
                                                 
          memoHTML.Lines.SaveToFile(FPathHTML);

          reTextoCuerpo.Visible := False;
          reTextoCuerpo.Align   := alNone;
          reTextoCuerpo.SendToBack;
          WebBrowser.Visible    := True;
          WebBrowser.Align      := alClient;
          WebBrowser.Navigate(FPathHTML);
          tbPreviewBody.Enabled := True;
        end
        else
        begin
          WebBrowser.Visible    := False;
          WebBrowser.Align      := alNone;
          WebBrowser.SendToBack;
          reTextoCuerpo.Visible := True;
          reTextoCuerpo.Align   := alClient;
          tbPreviewBody.Enabled := False;

          if FieldByName('ee_cuerpo').IsNull then
            BlobSql('SELECT ee_cuerpoex FROM comunes.cee_emailaenviar WHERE ee_id = ' + FieldByName('ee_id').AsString, reTextoCuerpo.Lines)
          else
            reTextoCuerpo.Lines.LoadFromStream(AStream);
        end;

        sSql :=
          'SELECT ea_id, ea_nombreadjunto, ea_idemailaenviar, ea_cuerpoadjunto, ea_link, ea_path, ea_idformulario' +
           ' FROM comunes.cea_emailadjunto' +
          ' WHERE ea_idemailaenviar = :idemailaenviar';

        if chkVerAdjuntos.Checked then
          with GetQueryEx(sSql, [FieldByName('ee_id').AsInteger]) do
          try
            if not IsEmpty then
              while not Eof do
              try
                sFileName := TempPath + FieldByName('ea_nombreadjunto').AsString;

                if FieldByName('ea_link').AsString = 'N' then
                begin
                  if not FieldByName('ea_cuerpoadjunto').IsNull then
                    TBlobField(FieldByName('ea_cuerpoadjunto')).SaveToFile(sFileName)
                  else
                    sFileName := FieldByName('ea_path').AsString;
                end
                else
                  if FileExists(FieldByName('ea_path').AsString) then
                    sFileName := FieldByName('ea_path').AsString
                  else
                    CreateShellLink(FieldByName('ea_path').AsString , TempPath, FieldByName('ea_nombreasjunto').AsString);

                lbAdjuntos.Items.AddObject(ExtractFileName(sFileName), TArchivoCompleto.Create(sFileName));
                Next;
              except
                Break;
              end;
          finally
            Free;
          end;
      finally
        aStream.Free;
      end;
    end else
    begin
      LimpiarExtra;

      reTextoCuerpo.Visible := False;
      reTextoCuerpo.Align   := alNone;
      reTextoCuerpo.SendToBack;

      WebBrowser.Visible    := False;
      WebBrowser.Align      := alNone;
      WebBrowser.SendToBack;
    end;
end;

procedure TfrmElementosEnviados.lbAdjuntosDblClick(Sender: TObject);
var
  sArchivo: String;
begin
  inherited;

  if lbAdjuntos.ItemIndex > -1 then
  begin
    sArchivo := GetNombreArchivoCompletoLista(lbAdjuntos.ItemIndex);
    Verificar(not FileExists(sArchivo), lbAdjuntos, 'El archivo adjunto solicitado ya no se encuentra disponible on-line.' + #10#13 + 'Der ser necesario solicite a Mesa de Ayuda una copia de resguardo del mismo.');

    AbrirArchivoVisor(sArchivo, False);
  end;
end;

procedure TfrmElementosEnviados.tbLimpiarClick(Sender: TObject);
begin
  FTipoRegistro := '';
  FExtraCondition := '';

  fraEE_DIRECCIONORIGEN.Cargar(Sesion.UserID);
  edEE_MOTIVO_LIKE.Clear;
  edEE_DIRECCIONESDESTINO_LIKE.Clear;
  cmbEE_FECHAMENSAJEDesde.Date := DBDate;
  cmbEE_FECHAMENSAJEHasta.Clear;
  LimpiarExtra;

  sdqConsulta.Close;
  sdqConsultaAfterScroll(nil);
end;

procedure TfrmElementosEnviados.LimpiarExtra;
var
  iPos: Integer;
  sArchivo: String;
begin
  reTextoCuerpo.Lines.Clear;
  for iPos := 0 to lbAdjuntos.Items.Count - 1 do
    begin
      sArchivo := GetNombreArchivoCompletoLista(iPos);
      if UpperCase(ExtractFilePath(sArchivo)) = UpperCase(TempPath) then
        DeleteFile(sArchivo);
    end;

  for iPos := 0 to lbAdjuntos.Items.Count - 1 do
    begin
      lbAdjuntos.Items.Objects[iPos].Free;
      lbAdjuntos.Items.Objects[iPos] := nil;
    end;

  lbAdjuntos.Items.Clear;
end;

procedure TfrmElementosEnviados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimpiarExtra;
  inherited;
  Action := caFree;
end;

procedure TfrmElementosEnviados.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then
    LimpiarExtra;
end;

procedure TfrmElementosEnviados.FormCreate(Sender: TObject);
begin
  IdRegistro := -1;
  TipoRegistro := '';
  FExtraCondition := '';
  FCheckOrigen := True;
  FSql := sdqConsulta.SQL.Text;
  reTextoCuerpo.Align := alClient;
  reTextoCuerpo.Visible := True;
  WebBrowser.Visible := False;
  inherited;

  fraEE_DIRECCIONORIGEN.Cargar(Sesion.UserID);
  cmbEE_FECHAMENSAJEDesde.Date := DBDate;
  FPathHTML := IncludeTrailingPathDelimiter(TempPath) + 'CuerpoHTML.htm';

  {$IFDEF RED_PRES}
  tbPropiedades.ImageIndex := 22;
  {$ELSE}
  tbPropiedades.ImageIndex := 31;
  {$ENDIF}
end;

procedure TfrmElementosEnviados.Separador2Moved(Sender: TObject);
begin
  lbArchivosAdjuntos.Left := lbAdjuntos.Left + 3;
end;

procedure TfrmElementosEnviados.chkVerAdjuntosClick(Sender: TObject);
begin
  sdqConsultaAfterScroll(sdqConsulta);
end;

procedure TfrmElementosEnviados.tbPropiedadesClick(Sender: TObject);
var
  bUnCheck: Boolean;
  nPos: Integer;
  vArchivosAdjuntos: TArrayOfAttach;
begin
  with sdqConsulta do
  begin
    Verificar(not Active or IsEmpty, nil, 'Debe seleccionar un registro para reenviar el correo.');

    bUnCheck := False;
    if not chkVerAdjuntos.Checked then
    begin
      bUnCheck := True;
      chkVerAdjuntos.Checked := True;
    end;

    SetLength(vArchivosAdjuntos, lbAdjuntos.Items.Count);

    for nPos := 0 to lbAdjuntos.Items.Count - 1 do
      vArchivosAdjuntos[nPos] := GetAttach(GetNombreArchivoCompletoLista(nPos), 0);

    if FieldByName('ee_tipocuerpo').AsString = 'H' then
      unEnvioMail.EnviarMailBD(FieldByName('ee_direccionesdestino').AsString,
                               FieldByName('ee_motivo').AsString,
                               [oAlwaysShowDialog, oSinNotaAlPie, oDisableBody],
                               [vArchivosAdjuntos],
                               memoHTML.Lines.Text,
                               0,
                               tcDefault,
                               True,
                               False,
                               2500,
                               -1,
                               [],
                               '',
                               True,
                               '',
                               FieldByName('ee_tiporegistroasociado').AsString,
                               FieldByName('ee_idregistroasociado').AsInteger)
    else
      EnviarMailBD(FieldByName('ee_direccionesdestino').AsString, FieldByName('ee_motivo').AsString, [oAlwaysShowDialog, oAutoFirma, oBodyIsRTF], FieldByName('ee_cuerpo').AsString,
                   vArchivosAdjuntos);

    if bUnCheck then
      chkVerAdjuntos.Checked := False;
  end;
end;

procedure TfrmElementosEnviados.tbPrinterSetupClick(Sender: TObject);
begin
  with sdqConsulta do
    if Active and (not IsEmpty) then
    begin
      if FieldByName('ee_tipocuerpo').AsString = 'H' then
        WBPrintPageSetup(WebBrowser)
      else
        PrintDialog.Execute;
    end;
end;

procedure TfrmElementosEnviados.tbPrintBodyClick(Sender: TObject);
begin
  with sdqConsulta do
  begin
    if FieldByName('ee_tipocuerpo').AsString = 'H' then
      WBPrintNoDialog(WebBrowser)
    else
      reTextoCuerpo.Print('Correo electrónico enviado el ' + FieldByName('ee_fechaenvio').AsString + ' a los siguientes destinatarios: ' + FieldByName('ee_direccionesdestino').AsString);
  end;
end;

procedure TfrmElementosEnviados.tbPreviewBodyClick(Sender: TObject);
begin
  WBPrintPreview(WebBrowser);
end;

procedure TfrmElementosEnviados.RefreshData;
var
  {$IFNDEF SISTEMAS}
  iIdOrigen: Integer;
  {$ENDIF}
  sSql: String;
begin
  sSql := FSql;

  if FExtraCondition <> '' then
    AddCondition(sSql, FExtraCondition);

  if FTipoRegistro = '' then
  begin
    {$IFNDEF SISTEMAS}
    iIdOrigen := Get_IdEjecutable();
    if FCheckOrigen then   // A veces necesito que no se checkee y/o filtre por esto. //default true.  CVW.
      AddCondition(sSql, ' NVL(ee_idorigengeneracion, ' + SqlValue(iIdOrigen) + ') =  ' + SqlValue(iIdOrigen));
    {$ENDIF}
    sdqConsulta.SQL.Text := sSql + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  end
  else
  begin
    fraEE_DIRECCIONORIGEN.Limpiar;

    AddCondition(sSql, ' ee_tiporegistroasociado = ' + SqlValue(FTipoRegistro));
    AddCondition(sSql, ' ee_idregistroasociado = ' + SqlValue(FIdRegistro));
    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  end;

  inherited RefreshData;
end;

procedure TfrmElementosEnviados.SetId(const Value: Integer);
begin
  edEE_ID.Value := Value;
end;

function TfrmElementosEnviados.ValidarHTMLUserName(aHtml: String): String;
var
  iPosDesde: Integer;
  iPosHasta: Integer;
  sResultado: String;
  sUserName: String;
begin
  iPosDesde := Pos('USUVAL=', aHtml) + 7;
  iPosHasta := Pos('&USERNAME', aHtml);

  if iPosDesde = iPosHasta then    // Si es igual porque no es necesario validar al usuario..
    Result := aHtml
  else
  begin
    sUserName := Copy(aHtml, Pos('USERNAME=', aHtml) + 9, Length(aHtml));
    sUserName := Copy(sUserName, 0, Pos('"', sUserName) - 1);
    sResultado := IIF((sUserName = Sesion.UserID), 'T', 'F');

    Result := StringReplace(aHtml, 'USUVAL=F&', 'USUVAL=' + sResultado + '&', [rfReplaceAll]);
    Result := StringReplace(Result, 'USUVAL=T&', 'USUVAL=' + sResultado + '&', [rfReplaceAll]);
  end;
end;

function TfrmElementosEnviados.GetNombreArchivoCompletoLista(Indice: Integer): String;
begin
  if Indice >= 0 then
    Result := (lbAdjuntos.Items.Objects[Indice] as TArchivoCompleto).ArchivoCompleto;
end;

constructor TArchivoCompleto.Create(const AValue: String);
begin
  inherited Create;
  ArchivoCompleto := AValue;
end;

end.
