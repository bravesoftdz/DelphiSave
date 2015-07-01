unit unArbolSectores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, ExtCtrls, DB,
  SDEngine, ComCtrls, Menus, FormPanel, DBCtrls, JvExComCtrls, JvComponent,
  JvDBTreeView, AdvGlowButton;

type
  TfrmArbolSectores = class(TfrmCustomForm)
    tvSectores: TJvDBTreeView;
    ilSectores: TImageList;
    sdqSectores: TSDQuery;
    sdqSectoresPrioridad: TIntegerField;
    sdqSectoresId: TIntegerField;
    sdqSectoresIdPadre: TIntegerField;
    sdqSectoresDESCRIPCION: TStringField;
    sdqSectoresUSUALTA: TStringField;
    sdqSectoresFECHAALTA: TDateTimeField;
    sdqSectoresUSUMODIF: TStringField;
    sdqSectoresFECHAMODIF: TDateTimeField;
    sdqSectoresUSUBAJA: TStringField;
    sdqSectoresFECHABAJA: TDateTimeField;
    sdqSectoresORDEN: TStringField;
    sdqSectoresSE_ID: TFloatField;
    sdqSectoresSE_IDSECTORPADRE: TFloatField;
    sdqSectoresNIVEL: TFloatField;
    dsSectores: TDataSource;
    pnlBottom: TPanel;
    btnImprimir: TButton;
    btnCerrar: TButton;
    Button1: TButton;
    pmuArbol: TPopupMenu;
    mnuColapsarTodo: TMenuItem;
    mnuDesplegarTodo: TMenuItem;
    sdqModoAgenda: TSDQuery;
    pnlAgenda: TPanel;
    sdqSectoresPRIVACIDAD: TStringField;
    sdqSectoresOPERACION: TStringField;
    sdqSectoresTIPO: TStringField;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    mnuEditarPropiedades: TMenuItem;
    mnuSeparador: TMenuItem;
    sduSectores: TSDUpdateSQL;
    fpDatos: TFormPanel;
    BevelAbm: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    btnAceptarDatos: TButton;
    btnCancelarDatos: TButton;
    cmbPrivacidad: TComboBox;
    chkHito: TCheckBox;
    chkRequiereRespuesta: TCheckBox;
    cmbOperacion: TComboBox;
    chkObligatorio: TCheckBox;
    mnuActualizar: TMenuItem;
    N1: TMenuItem;
    sdqSectoresTE_ID: TFloatField;
    btnActualizar: TAdvGlowButton;
    chkRequiereRespuestaTabulada: TCheckBox;
    procedure btnAceptarDatosClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure sdqSectoresCalcFields(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure mnuActualizarClick(Sender: TObject);
    procedure mnuColapsarTodoClick(Sender: TObject);
    procedure mnuDesplegarTodoClick(Sender: TObject);
    procedure mnuEditarPropiedadesClick(Sender: TObject);
    procedure pmuArbolPopup(Sender: TObject);
    procedure tvSectoresDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvSectoresDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvSectoresKeyPress(Sender: TObject; var Key: Char);
    procedure tvSectoresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvSectoresStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure chkRequiereRespuestaTabuladaClick(Sender: TObject);
    procedure chkRequiereRespuestaClick(Sender: TObject);
  private
    FModoAgenda: Boolean;
    FNivel: Integer;
    function GetIdSectorSeleccionado: Integer;
    function GetModoAgenda: Boolean;
    procedure SetModoAgenda(const Value: Boolean);
  public
    procedure MostrarEventoTarea(AIdEventoTarea: Integer = 0);
    procedure MostrarSector(ASector: Integer = 0);
    property  IdSectorSeleccionado: Integer read GetIdSectorSeleccionado;
    property  ModoAgenda: Boolean read GetModoAgenda write SetModoAgenda;     
  end;

var
  frmArbolSectores: TfrmArbolSectores;

implementation

uses
  unDmPrincipal, CustomDlgs, unArt, Strfuncs, General, SqlFuncs, AnsiSql,
  unSesion;

{$R *.dfm}


procedure TfrmArbolSectores.btnAceptarDatosClick(Sender: TObject);
begin
  Verificar(cmbPrivacidad.ItemIndex = -1, cmbPrivacidad, 'Debe indicar la privacidad del elemento.');
  Verificar(cmbOperacion.ItemIndex = -1, cmbOperacion, 'Debe indicar el tipo de operación del elemento.');
  Verificar(chkHito.State = cbGrayed, chkHito, 'Debe indicar si el elemento representa un hito o no.');
  Verificar(chkRequiereRespuesta.State = cbGrayed, chkRequiereRespuesta, 'Debe indicar si el elemento requiere respuesta.');
  Verificar(chkRequiereRespuestaTabulada.State = cbGrayed, chkRequiereRespuestaTabulada, 'Debe indicar si el elemento requiere respuesta tabulada.');  
//  Verificar(chkObligatorio.State = cbGrayed, chkObligatorio, 'Debe indicar si el elemento es obligatorio o no.');
  fpDatos.ModalResult := mrOk;
end;

procedure TfrmArbolSectores.btnActualizarClick(Sender: TObject);
begin
  if Assigned(sdqSectores.FindField('TE_ID')) and not sdqSectores.FindField('TE_ID').IsNull then
    MostrarEventoTarea(sdqSectores.FieldByName('TE_ID').AsInteger)
  else
    MostrarSector(sdqSectores.FieldByName('SE_ID').AsInteger);
end;

procedure TfrmArbolSectores.MostrarSector(ASector: Integer = 0);
begin
  sdqSectores.Close;
  OpenQuery(sdqSectores);
  mnuDesplegarTodo.Click;
  if ASector > 0 then
    sdqSectores.Locate('SE_ID', ASector, []);
end;

procedure TfrmArbolSectores.MostrarEventoTarea(AIdEventoTarea: Integer = 0);
begin
  sdqSectores.Close;
  OpenQuery(sdqSectores);
//  mnuDesplegarTodo.Click;
  if AIdEventoTarea > 0 then
    sdqSectores.Locate('TE_ID', AIdEventoTarea, []);
end;

procedure TfrmArbolSectores.sdqSectoresCalcFields(DataSet: TDataSet);
begin
  inherited;
  sdqSectoresPrioridad.AsInteger := sdqSectoresNIVEL.AsInteger - 1;
  {
  sdqSectoresId.AsInteger := sdqSectoresID.AsInteger;
  sdqSectoresIdPadre.AsInteger := sdqSectoresIDPADRE.AsInteger;
  }
end;

procedure TfrmArbolSectores.btnImprimirClick(Sender: TObject);
begin
  inherited;
  InfoHint(btnImprimir, 'Aún no está disponible esta funcionalidad.');
{
  Printer.BeginDoc;
  Printer.Canvas.Draw(0, 0, tvSectores.Canvas);
  Printer.EndDoc;
}
end;

procedure TfrmArbolSectores.btnCerrarClick(Sender: TObject);
begin
  inherited;
  sdqSectores.Close;
  ModalResult := mrCancel;
end;

function TfrmArbolSectores.GetIdSectorSeleccionado: Integer;
begin
  if sdqSectores.Active and (not sdqSectores.IsEmpty) then
    Result := sdqSectores.FieldByName('SE_ID').AsInteger
  else
    Result := -1;
end;

procedure TfrmArbolSectores.mnuColapsarTodoClick(Sender: TObject);
begin
  inherited;
  tvSectores.FullCollapse;
end;

procedure TfrmArbolSectores.mnuDesplegarTodoClick(Sender: TObject);
begin
  inherited;
  sdqSectores.OnCalcFields := nil;
  try
    tvSectores.FullExpand;
  finally
    sdqSectores.OnCalcFields := sdqSectoresCalcFields;
  end;
end;

function TfrmArbolSectores.GetModoAgenda: Boolean;
begin
  Result := FModoAgenda;
end;

procedure TfrmArbolSectores.mnuActualizarClick(Sender: TObject);
begin
  inherited;
  OpenQuery(sdqSectores);
  mnuDesplegarTodo.Click;
end;

procedure TfrmArbolSectores.SetModoAgenda(const Value: Boolean);
begin
  FModoAgenda := Value;

  if Value then
  begin
    sdqSectores.SQL.Text := sdqModoAgenda.SQL.Text;
    tvSectores.DragMode := dmAutomatic;
    pnlAgenda.Show;
  end;
end;

procedure TfrmArbolSectores.mnuEditarPropiedadesClick(Sender: TObject);
begin
  inherited;
  with GetQueryEx('SELECT * FROM AGENDA.ATS_TIPOEVENTOSECTOR WHERE TS_ID = :ID', [sdqSectoresSE_ID.AsInteger]) do
  try
    cmbPrivacidad.ItemIndex := iif(FieldByName('TS_PRIVACIDAD').AsString = 'PR',
                                   0,
                                   iif(FieldByName('TS_PRIVACIDAD').AsString = 'PG',
                                       1,
                                       iif(FieldByName('TS_PRIVACIDAD').AsString = 'PU',
                                           2,
                                           iif(FieldByName('TS_PRIVACIDAD').AsString = 'SE',
                                               3,
                                               iif(FieldByName('TS_PRIVACIDAD').AsString = 'JE',
                                                   4,
                                                   iif(FieldByName('TS_PRIVACIDAD').AsString = 'GE',
                                                       5,
                                                       -1))))));
    cmbOperacion.ItemIndex := iif(FieldByName('TS_TIPOOPERACION').AsString = 'A', 0, 1);
    chkRequiereRespuesta.Checked := FieldByName('TS_REQUIERERESPUESTA').AsString = 'S';
    chkRequiereRespuestaTabulada.Checked := FieldByName('TS_REQUIERERESPUESTATABULADA').AsString = 'S';
    chkObligatorio.Checked := FieldByName('TS_OBLIGATORIO').AsString = 'S';
    chkHito.Checked := FieldByName('TS_HITO').AsString = 'S';
  finally
    Free;
  end;

  if fpDatos.ShowModal = mrOK then
  begin
    EjecutarSQLSTEx('UPDATE AGENDA.ATS_TIPOEVENTOSECTOR ' +
                      ' SET TS_PRIVACIDAD = ' + SqlString(StrLeft(cmbPrivacidad.Items[cmbPrivacidad.ItemIndex], 2), True) + ' ,' +
                          ' TS_TIPOOPERACION = ' + SqlString(iif(cmbOperacion.ItemIndex = 0, 'A', 'M'), True) + ' ,' +
                          ' TS_REQUIERERESPUESTA = ' + SqlBoolean(chkRequiereRespuesta.Checked, True) + ' ,' +
                          ' TS_REQUIERERESPUESTATABULADA = ' + SqlBoolean(chkRequiereRespuestaTabulada.Checked, True) + ' ,' +                          
                          ' TS_OBLIGATORIO = ' + SqlBoolean(chkObligatorio.Checked, True) + ' ,' +
                          ' TS_HITO = ' + SqlBoolean(chkHito.Checked, True) + ' ,' +
                          ' TS_FECHAMODIF = SYSDATE, ' +
                          ' TS_USUMODIF = :USUARIO ' +
                     'WHERE TS_ID = :ID', [Sesion.UserID, sdqSectoresSE_ID.AsInteger]);

    sdqSectores.Refresh;
  end;
end;

procedure TfrmArbolSectores.pmuArbolPopup(Sender: TObject);
begin
  inherited;
  mnuEditarPropiedades.Visible := Assigned(tvSectores.Selected) and ModoAgenda and (sdqSectoresNIVEL.AsInteger > 4);
  mnuSeparador.Visible := mnuEditarPropiedades.Visible;
end;

procedure TfrmArbolSectores.tvSectoresDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  tnItemDestino: TTreeNode;
begin
  tnItemDestino := (Source as TJvDBTreeView).GetNodeAt(X, Y);
  if Assigned(tnItemDestino) and (tnItemDestino.ImageIndex < 4) and (FNivel > 3) then
    Accept := ModoAgenda and (Source is TJvDBTreeView) and (Sender is TJvDBTreeView) and (tnItemDestino.ImageIndex < 4)
  else
    Accept := False;
end;

procedure TfrmArbolSectores.tvSectoresDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  tnItemDestino: TJvDBTreeNode;
  iSector: Integer;
begin
  if ModoAgenda and (Sender is TJvDBTreeView) and (Source is TJvDBTreeView) and (sdqSectoresNIVEL.AsInteger >= 4) then
  begin
    tnItemDestino := TJvDBTreeNode((Source as TJvDBTreeView).GetNodeAt(X, Y));
    iSector := sdqSectoresSE_ID.AsInteger;

    if MsgAsk(Format('¿Confirma que desea mover el %s %s' + CRLF + 'de %s a %s?', [sdqSectoresTIPO.AsString, sdqSectoresDESCRIPCION.AsString, (Source as TJvDBTreeView).Selected.Parent.Text, tnItemDestino.Text])) then
      EjecutarSQLSTEx('UPDATE AGENDA.ATS_TIPOEVENTOSECTOR ' +
                         'SET TS_IDSECTOR = :SECTOR ' +
                       'WHERE TS_ID = :ID', [tnItemDestino.MasterValue, sdqSectoresSE_ID.AsInteger]);

    sdqSectores.Refresh;
    sdqSectores.Locate('SE_ID', iSector, []);
  end;
end;

procedure TfrmArbolSectores.tvSectoresKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Ord(Key) = VK_F5 then
    mnuActualizarClick(nil);
end;

procedure TfrmArbolSectores.tvSectoresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssRight in Shift then
  begin
    if Assigned(tvSectores.GetNodeAt(X, Y)) then
      tvSectores.GetNodeAt(X, Y).Selected := True
    else
      tvSectores.Selected := nil;

    pmuArbol.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TfrmArbolSectores.tvSectoresStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  inherited;
  if ModoAgenda and (Sender is TJvDBTreeView) and Assigned((Sender as TJvDBTreeView).Selected) then
    FNivel := (Sender as TJvDBTreeView).Selected.ImageIndex;
end;

procedure TfrmArbolSectores.chkRequiereRespuestaTabuladaClick(Sender: TObject);
begin
  if chkRequiereRespuestaTabulada.Checked then
    chkRequiereRespuesta.Checked := True;
end;

procedure TfrmArbolSectores.chkRequiereRespuestaClick(Sender: TObject);
begin
  if not chkRequiereRespuesta.Checked then
    chkRequiereRespuestaTabulada.Checked := False;
end;

end.
