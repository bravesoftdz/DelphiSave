unit unListaEMail;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, unFraToolbarRTF, RxRichEd, Buttons, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, DBCtrls, FormPanel, Db, SDEngine,
  unCustomForm, ImgList, XPMenu, Placemnt, Menus, RXCtrls, QuickRpt,
  ImageListBox, Gauges, JvComponent, JvCaptionButton, JvExControls, unArt,
  JvWaitingProgress, ToolWin, artSeguridad, JvAnimatedImage, JvGIFCtrl;

type
  TResultadoEnvio = record
    EMailsDestino: TStringList;
    EnvioOk: Boolean;
    MensajeId: Integer;
end;

type
  TfrmListaEMail = class(TfrmCustomForm)
    btEnviar: TButton;
    btCancelar: TButton;
    edDestinatario: TEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    btQuitarDestinatario: TSpeedButton;
    btAgregarDestinatario: TSpeedButton;
    fpUsuarios: TFormPanel;
    Label4: TLabel;
    btnAgregar: TButton;
    btnCerrar: TButton;
    pnlSector: TPanel;
    cmbSectores: TDBLookupComboBox;
    Label5: TLabel;
    dbgUsuarios: TArtDBGrid;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    dsSectores: TDataSource;
    sdqSectores: TSDQuery;
    popupDestinatarios: TPopupMenu;
    mnuQuitarDestinatarios: TMenuItem;
    lbDestinatarios: TImageListBox;
    dsDisponibles: TDataSource;
    sdqDisponibles: TSDQuery;
    tbBotonera: TToolBar;
    tbLibreta: TToolButton;
    tbUsuarios: TToolButton;
    mnuQuitarTodosLosDestinatarios: TMenuItem;
    ToolBarFirma: TToolBar;
    Seguridad: TSeguridad;
    procedure btAgregarDestinatarioClick(Sender: TObject);
    procedure btQuitarDestinatarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDestinatarioKeyPress(Sender: TObject; var Key: Char);
    procedure tbUsuariosClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure cmbSectoresCloseUp(Sender: TObject);
    procedure cmbSectoresKeyPress(Sender: TObject; var Key: Char);
    procedure dbgUsuariosKeyPress(Sender: TObject; var Key: Char);
    procedure tbLibretaClick(Sender: TObject);
    procedure mnuQuitarTodosLosDestinatariosClick(Sender: TObject);
    procedure popupDestinatariosPopup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FResultadoEnvio: TResultadoEnvio;
  protected
    procedure ActualizarIconos;
  public
  end;

  procedure GenerarListaEMail(var sAddresses: string);

implementation

{$R *.DFM}

uses
  CustomDlgs, {$IFNDEF CAS}unSeleccionDestinatarios, {$ENDIF}Internet, unSesion,
  General, unDmPrincipal, SQLFuncs, DBFuncs, AnsiSQL, ShellAPI, ArchFuncs,
  unLibretaDeDirecciones{$IFNDEF SINSEGURIDAD}, unPrincipal{$ENDIF};

var
  frmListaEMail: TfrmListaEMail;

procedure GenerarListaEMail(var sAddresses: string);
var
  i: integer;
begin
  frmListaEMail := TfrmListaEMail.Create(nil);

  with frmListaEMail do
    try
      lbDestinatarios.Items.CommaText := StringReplace(StringReplace(sAddresses, ',,', ',', [rfReplaceAll]), '"', '', [rfReplaceAll]);
      ActualizarIconos;

      if frmListaEMail.ShowModal = mrOk then
      begin
        sAddresses := '';
        for i := 0 to lbDestinatarios.Items.Count-1 do
          sAddresses := sAddresses + iif (sAddresses = '', '', ', ') + lbDestinatarios.Items[i] 
      end
      else
        sAddresses := '';
    finally
      if (Assigned(frmListaEMail)) and (not frmListaEMail.Visible) then
        frmListaEMail.Close;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.btAgregarDestinatarioClick(Sender: TObject);
var
  tsl: TStringList;
  bSalir: boolean;
begin
  bSalir := False;

  Verificar(edDestinatario.Text = '', edDestinatario, 'No hay destinatario para agregar a la lista de destinatarios.');
  if not IsEMail(edDestinatario.Text) then
  begin
    edDestinatario.Text := UpperCase(edDestinatario.Text);
    with sdqDisponibles do
    try
      ParamByName('SE_MAIL').AsString := Trim('%' + edDestinatario.Text + '%');
      OpenQuery(sdqDisponibles);

      if IsEmpty then
      begin
        InvalidMsg(edDestinatario, 'El usuario ingresado no pertenece a la ART o bien la dirección ingresada no es correcta.');
        bSalir := True;
      end;
      if (RecordCount > 1) then
        bSalir := True;

      if not bSalir then
        edDestinatario.Text := FieldByName('SE_MAIL').AsString;
    finally
      Close;
    end;

    if bSalir then
      Abort;
  end
  else
    edDestinatario.Text := LowerCase(edDestinatario.Text);

  tsl := TStringList.Create;
  try
    tsl.Sorted := True;
    tsl.Duplicates := dupIgnore;
    tsl.CommaText := lbDestinatarios.Items.CommaText;
    tsl.Add(edDestinatario.Text);
    lbDestinatarios.Items.CommaText := tsl.CommaText;
    ActualizarIconos;
    edDestinatario.Clear;
  finally
    tsl.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.btQuitarDestinatarioClick(Sender: TObject);
begin
  Verificar(lbDestinatarios.ItemIndex = -1, lbDestinatarios, 'No hay destinatario seleccionado.');
  lbDestinatarios.Items.Delete(lbDestinatarios.ItemIndex);
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.FormCreate(Sender: TObject);
begin
  {$IFNDEF SERVICE}
  Seguridad.Ejecutar;
  {$ENDIF}

  lbDestinatarios.Images := ilColor;
  KeyPreview := True;

  FResultadoEnvio.EMailsDestino := TStringList.Create;
  FResultadoEnvio.EnvioOk := False;
  FResultadoEnvio.MensajeId := -1;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.edDestinatarioKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(Key) of
    VK_RETURN: btAgregarDestinatario.Click;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.tbUsuariosClick(Sender: TObject);
begin
  OpenQuery(sdqSectores);
  if sdqSectores.Locate('SC_CODIGO', Sesion.Sector, []) then
  begin
    cmbSectores.KeyValue := sdqSectores.FieldByName('SC_CODIGO').AsString;
    cmbSectoresCloseUp(cmbSectores);
  end;
  OpenQuery(sdqUsuarios);
  fpUsuarios.ShowModal;

  sdqSectores.Close;
  sdqUsuarios.Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.btnAgregarClick(Sender: TObject);
var
  i: integer;
begin
  Verificar(dbgUsuarios.SelectedRows.Count = 0, btnAgregar, 'Debe seleccionar al menos un usuario.');

  for i := 0 to dbgUsuarios.SelectedRows.Count - 1 do
  begin
    sdqUsuarios.GotoBookmark(Pointer(dbgUsuarios.SelectedRows.Items[i]));
    edDestinatario.Text := sdqUsuarios.FieldByName('SE_MAIL').AsString;
    btAgregarDestinatario.Click;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.btnCerrarClick(Sender: TObject);
begin
  fpUsuarios.Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.cmbSectoresCloseUp(Sender: TObject);
begin
  sdqUsuarios.ParamByName('SE_SECTOR').AsString := sdqSectores.FieldByName('SC_CODIGO').AsString;
  if sdqSectores.FieldByName('SC_CODIGO').AsString = '[Todos]' then
    sdqUsuarios.ParamByName('SE_SECTOR').Value := Null;

  OpenQuery(sdqUsuarios);
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.cmbSectoresKeyPress(Sender: TObject; var Key: Char);
{
var
  wTecla: Word;
}
begin
//  wTecla := Ord(Key);
  case Ord(Key) of
    VK_ESCAPE:
      if sdqSectores.Locate('SC_CODIGO', '[Todos]', []) then
      begin
        cmbSectores.KeyValue := '[Todos]';
        cmbSectoresCloseUp(cmbSectores);
      end
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.ActualizarIconos;
var
  i: integer;
begin
  for i := 0 to lbDestinatarios.Items.Count - 1 do
  begin
    if lbDestinatarios.Items.Strings[i] = UpperCase(lbDestinatarios.Items.Strings[i]) then
      lbDestinatarios.ItemImage[i] := 19
    else
      lbDestinatarios.ItemImage[i] := 27;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.dbgUsuariosKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    btnAgregar.Click;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.tbLibretaClick(Sender: TObject);
var
  iPos: integer;
begin
  with TfrmLibretaDeDirecciones.Create(nil) do
  try
    BorderIcons := [biSystemMenu];
    Grid.MultiSelect := True;
    Grid.Options := Grid.Options + [dgIndicator, dgMultiSelect];
    pnlBottom.Visible := True;
    Caption := Caption + ' - Selección de contactos';

    if ShowModal = mrOk then
      for iPos := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iPos]));
        edDestinatario.Text := sdqConsulta.FieldByName('LD_MAIL').AsString;
        btAgregarDestinatario.Click;
      end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.mnuQuitarTodosLosDestinatariosClick(Sender: TObject);
begin
  lbDestinatarios.Items.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.popupDestinatariosPopup(Sender: TObject);
begin
  mnuQuitarDestinatarios.Enabled := lbDestinatarios.ItemIndex <> -1;
  mnuQuitarTodosLosDestinatarios.Enabled := lbDestinatarios.Items.Count > 0;
end;
{------------------------------------------------------------------------------}
procedure TfrmListaEMail.FormDestroy(Sender: TObject);
begin
  FResultadoEnvio.EMailsDestino.Free;
  inherited;
end;
{------------------------------------------------------------------------------}
end.



