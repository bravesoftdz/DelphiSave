unit unManEmailsComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEmailsComercial = class(TfrmCustomGridABM)
    sGrid: TStringGrid;
    Label1: TLabel;
    edEmail: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FEmails: TStringList;

    procedure FillGrid;
    procedure GetData;
    procedure UpdateDB;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure CheckButtons; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManEmailsComercial: TfrmManEmailsComercial;

implementation

uses
  CustomDlgs, unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs;

{$R *.DFM}

function TfrmManEmailsComercial.DoABM: Boolean;
begin
  try
    if Sql.SqlType = stInsert then
      FEmails.Add(edEmail.Text)
    else
      FEmails.Strings[sGrid.Row - 1] := edEmail.Text;

    UpdateDB;
    Result := True;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Result := False;
    end;
  end;
end;

function TfrmManEmailsComercial.Validar: Boolean;
begin
  Verificar(edEmail.Text = '', edEmail, 'La dirección de e-mail es obligatoria.');
  Result := True;
end;


procedure TfrmManEmailsComercial.CheckButtons;
begin
  tbModificar.Enabled := (FEmails.Count > 0);
  tbEliminar.Enabled := (FEmails.Count > 0);
end;

procedure TfrmManEmailsComercial.ClearControls;
begin
  edEmail.Clear;
end;

procedure TfrmManEmailsComercial.FillGrid;
var
  iLoop: Integer;
begin
  sGrid.ColCount := 1;
  sGrid.RowCount := FEmails.Count + 1;
  sGrid.Cells[0, 0] := 'E-mail';

  for iLoop := 0 to FEmails.Count - 1 do
    sGrid.Cells[0, iLoop + 1] := FEmails.Strings[iLoop];

  sGrid.Row := 1;    
end;

procedure TfrmManEmailsComercial.GetData;
begin
  with sdqConsulta do
  begin
    if Active then
      Close;
    Open;
  end;

  with FEmails do
    CommaText := Trim(StringReplace(sdqConsulta.FieldByName('tb_especial1').AsString, ';', ',', [rfReplaceAll]));
end;

procedure TfrmManEmailsComercial.LoadControls;
begin
  edEmail.Text := sGrid.Cells[sGrid.Col, sGrid.Row];
end;

procedure TfrmManEmailsComercial.UpdateDB;
var
  sSql: String;
begin
  sSql :=
    'UPDATE ctb_tablas' +
      ' SET tb_especial1 = :especial1' +
    ' WHERE tb_clave = ''DIREL''' +
      ' AND tb_codigo = ''04''';
  EjecutarSqlEx(sSql, [FEmails.CommaText]);
end;

procedure TfrmManEmailsComercial.FormCreate(Sender: TObject);
begin
  inherited;

  FEmails := TStringList.Create;
  FEmails.Sorted := True;

  GetData;
  FillGrid;
end;

procedure TfrmManEmailsComercial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FEmails.Free;
end;

procedure TfrmManEmailsComercial.tbEliminarClick(Sender: TObject);
var
  iIndex: Integer;
begin
  if FEmails.Count = 1 then
  begin
    MsgBox('Debe quedar al menos una dirección de e-mail!', MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;

  if MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = idNo then
    Exit;

  iIndex := FEmails.IndexOf(sGrid.Cells[sGrid.Col, sGrid.Row]);
  if iIndex > -1 then
  begin
    FEmails.Delete(iIndex);

    UpdateDB;
    FillGrid;
    CheckButtons;
  end;
end;

procedure TfrmManEmailsComercial.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoABM then
  begin
    FillGrid;
    CheckButtons;

    fpABM.ModalResult := mrOk;
  end;
end;

procedure TfrmManEmailsComercial.tbRefrescarClick(Sender: TObject);
begin
  GetData;
  FillGrid;
end;

end.
