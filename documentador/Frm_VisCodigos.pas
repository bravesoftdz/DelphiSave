unit Frm_VisCodigos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ToolWin, ComCtrls, Menus, Db, SDEngine, ImgList,
  mwHighlighter, mwSqlSyn, mwCustomEdit;

type
  TFrm_VisCodigo = class(TForm)
    ToolBar1: TToolBar;
    Sdq_Owner: TSDQuery;
    Ds_Owner: TDataSource;
    Sdq_Nombre: TSDQuery;
    Ds_Nombre: TDataSource;
    Tb_Imprimir: TToolButton;
    IL_ListImag: TImageList;
    Tb_VistaPrevia: TToolButton;
    Tb_Salir: TToolButton;
    Memo_Codigo: TmwCustomEdit;
    mwSqlSyn: TmwSqlSyn;
    Sdq_OwnerUSERNAME: TStringField;
    Sdq_NombreNAME: TStringField;
    tbCompilar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Label1: TLabel;
    Dbc_Owner: TDBLookupComboBox;
    Label2: TLabel;
    Cmb_Tipo: TComboBox;
    Label3: TLabel;
    Dbc_Nombre: TDBLookupComboBox;
    BarraDeEstado: TStatusBar;
    sdqConsulta: TSDQuery;
    StringField1: TStringField;
    procedure Dbc_OwnerCloseUp(Sender: TObject);
    procedure Ejecutar(sFuncion, sOwner, sTipo: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VerMemos(Sql: string; Titulo: string = '');
    procedure Dbc_NombreCloseUp(Sender: TObject);
    procedure Tb_ImprimirClick(Sender: TObject);
    procedure Tb_SalirClick(Sender: TObject);
    procedure tbCompilarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word;
      Shift: TShiftState);
  private
    function BuscarPosError(ErrorMsg: string): integer;
  public
    { Public declarations }
  end;

var
  Frm_VisCodigo: TFrm_VisCodigo;

implementation

uses
  QRpt_RepDescripciones, BaseDeDatos;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.Dbc_OwnerCloseUp(Sender: TObject);
begin
  Sdq_Nombre.Close;
  Sdq_Nombre.ParamByName('sOwner').Text := Dbc_Owner.Text;
  Sdq_Nombre.ParamByName('sTipo').Text := Cmb_Tipo.Text;
  Sdq_Nombre.Open;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.Ejecutar(sFuncion, sOwner, sTipo: string);
begin
  if sTipo = 'PROCEDURE' then
    Cmb_Tipo.ItemIndex := 0
  else if sTipo = 'FUNCTION' then
    Cmb_Tipo.ItemIndex := 1
  else if sTipo = 'PACKAGE BODY' then
    Cmb_Tipo.ItemIndex := 2
  else if sTipo = 'PACKAGE' then
    Cmb_Tipo.ItemIndex := 3;

  Caption := Cmb_Tipo.Text + ' ' + sOwner + '.' + sFuncion;
  Sdq_Owner.Open;
  Dbc_Owner.KeyValue := sOwner;
  Dbc_OwnerCloseUp(Self);
  Dbc_Nombre.KeyValue := sFuncion;

  Dbc_NombreCloseUp(Self);
  Self.Visible := true;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.Dbc_NombreCloseUp(Sender: TObject);
var
  Cursor: TSDQuery;
  Renglon: string;
  NamePos: integer;
begin
  LockWindowUpdate(Self.Handle);
  Cursor := TSDQuery.Create(Self);
  Cursor.Databasename := DM_BaseDeDatos.BaseDeDatos.DatabaseName;
  Cursor.SQL.Clear;
  Cursor.SQL.Add('SELECT TEXT ');
  Cursor.SQL.Add('FROM SYS.ALL_SOURCE ');
  Cursor.SQL.Add('WHERE OWNER = ''' + Dbc_Owner.Text + ''' ');
  Cursor.SQL.Add('AND NAME = ''' + Dbc_Nombre.Text + ''' ');
  Cursor.SQL.Add('AND TYPE = ''' + Cmb_Tipo.Text + ''' ');
  Cursor.SQL.Add('ORDER BY LINE ');

  Memo_Codigo.Lines.Clear;
  Memo_Codigo.Lines.Add('CREATE OR REPLACE');
  try
    Cursor.Open;
    while not Cursor.EOF do
    begin
      Renglon := Cursor.Fields[0].Text;
      if Ord(Renglon[length(Renglon)]) = 10 then
        Renglon := Copy(Renglon, 1, length(Renglon) - 1);
      if Memo_Codigo.LineCount = 1 then
      begin
        NamePos := Pos(UpperCase(Dbc_Nombre.Text), UpperCase(Renglon));
        if NamePos > 0 then
          Renglon := Copy(Renglon, 0, NamePos - 1) + Dbc_Owner.Text +
            '.' + Copy(Renglon, NamePos, 99999);
      end;
      Memo_Codigo.Lines.Add(Renglon);
      Cursor.Next;
    end;
  finally
    Cursor.Close;
    Cursor.Destroy;
  end;
  LockWindowUpdate(0);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.Tb_ImprimirClick(Sender: TObject);
begin
  Qrpt_Descripciones.ImprimirReporte(Cmb_Tipo.Text + ' ' +
    Dbc_Owner.Text + '.' + Dbc_Nombre.Text
    , 'Código Fuente', Memo_Codigo.Lines,
    TToolButton(Sender).ImageIndex);
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.Tb_SalirClick(Sender: TObject);
begin
  Close;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.VerMemos(Sql: string; Titulo: string = '');
var
  Cursor: TSDQuery;
begin
//  LockWindowUpdate (Self.Handle);
  Cursor := TSDQuery.Create(Self);
  Cursor.Databasename := DM_BaseDeDatos.BaseDeDatos.DatabaseName;
  Cursor.SQL.Text := Sql;
  try
    Cursor.Open;
    Memo_Codigo.Lines.Add(Cursor.Fields[0].AsString);
  finally
    Cursor.Close;
    Cursor.Destroy;
  end;
  ToolBar1.Visible := false;
  if not (Titulo = '') then
    Self.Caption := Titulo;

  Self.Visible := true;
//  LockWindowUpdate (0);

end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.tbCompilarClick(Sender: TObject);
begin
  try
    sdqConsulta.SQL.Text := Memo_Codigo.Lines.Text;
    sdqConsulta.ExecSQL;
  except
    on E: EDatabaseError do
    begin
      BarraDeEstado.SimpleText := e.Message;
      BuscarPosError(e.Message);
    end;
    on E: Exception do
      BarraDeEstado.SimpleText := 'Error al Compilar';
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TFrm_VisCodigo.BuscarPosError(ErrorMsg: string): integer;
var
  iPos, iEnter, iEspacio: integer;
const
  sMsgError = '(error offset:';
begin
  iPos := 0;
  if Pos(sMsgError, ErrorMsg) > 0 then
  begin
    iPos := Pos(sMsgError, ErrorMsg) + Length(sMsgError);
    iPos := StrToInt(Copy(ErrorMsg,
      iPos + 1,
      Pos(')', Copy(ErrorMsg, iPos, 255)) - 2
      )
      );

    if Trim(Memo_Codigo.SelText) <> '' then
      Memo_Codigo.SetSelStart(iPos + Memo_Codigo.GetSelStart)
    else
      Memo_Codigo.SetSelStart(iPos);

    iEspacio := Pos(' ', copy(Memo_Codigo.Text, iPos + 1, 255) + ' '); //-1
    iEnter := Pos(chr(13), copy(Memo_Codigo.Text, iPos + 1, 255) + ' '); //-1
    if iEspacio < iEnter then
      Memo_Codigo.SetSelEnd(iEspacio + Memo_Codigo.GetSelStart)
    else
      Memo_Codigo.SetSelEnd(iEnter + Memo_Codigo.GetSelStart)
  end;
  Result := iPos;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_VisCodigo.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if (Key = 120) then
    tbCompilarClick(nil);
end;

{----------------------------------------------------------------------------------------------------------------------}
end.
