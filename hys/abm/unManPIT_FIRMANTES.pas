unit unManPIT_FIRMANTES;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, DBCtrls, PatternEdit, ExComboBox;

type
  TfrmManPIT_FIRMANTES = class(TfrmCustomGridABM)
    edIT_CODIGO: TPatternEdit;
    edIT_NOMBRE: TPatternEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    edIT_MATRICULA: TPatternEdit;
    Label3: TLabel;
    cmbIT_TIPO_MATRICULA: TExComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edIT_INSTITUCION_OTORGANTE: TPatternEdit;
    Label6: TLabel;
    edIT_TITULO: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmbIT_TIPO_MATRICULAKeyPress(Sender: TObject; var Key: Char);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

procedure TfrmManPIT_FIRMANTES.ClearControls;
begin
  LockControl(edIT_CODIGO, False);
  edIT_CODIGO.Clear;
  edIT_NOMBRE.Clear;
  edIT_MATRICULA.Clear;
  cmbIT_TIPO_MATRICULA.Value := '';
  edIT_INSTITUCION_OTORGANTE.Clear;
  edIT_TITULO.Clear;
end;

function TfrmManPIT_FIRMANTES.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('IT_CODIGO', sdqConsulta.FieldByName('IT_CODIGO').AsString);
    Sql.Fields.Add('IT_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('IT_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('IT_CODIGO', edIT_CODIGO.Text);
      Sql.Fields.Add('IT_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('IT_FECHAALTA', exDateTime);
    end
    else
    begin
    Sql.PrimaryKey.Add('IT_CODIGO', sdqConsulta.FieldByName('IT_CODIGO').AsString);
      Sql.Fields.Add('IT_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('IT_FECHAMODIF', exDateTime);
      Sql.Fields.Add('IT_USUBAJA', exNull);
      Sql.Fields.Add('IT_FECHABAJA', exNull);
    end;

    Sql.Fields.Add('IT_NOMBRE',  edIT_NOMBRE.Text);
    Sql.Fields.Add('IT_MATRICULA', edIT_MATRICULA.Text);
    Sql.Fields.Add('IT_TIPO_MATRICULA', cmbIT_TIPO_MATRICULA.Value);
    Sql.Fields.Add('IT_INSTITUCION_OTORGANTE', edIT_INSTITUCION_OTORGANTE.Text);
    Sql.Fields.Add('IT_TITULO', edIT_TITULO.Text);
  end;


  Result := inherited DoABM;
end;

procedure TfrmManPIT_FIRMANTES.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'IT_FECHABAJA';
  Sql.TableName := 'PIT_FIRMANTES';
end;

procedure TfrmManPIT_FIRMANTES.LoadControls;
begin
  LockControl(edIT_CODIGO, True);
  edIT_CODIGO.Text := sdqConsulta.FieldByName('IT_CODIGO').AsString;
  edIT_NOMBRE.Text := sdqConsulta.FieldByName('IT_NOMBRE').AsString;
  edIT_MATRICULA.Text := sdqConsulta.FieldByName('IT_MATRICULA').AsString;
  cmbIT_TIPO_MATRICULA.Value := sdqConsulta.FieldByName('IT_TIPO_MATRICULA').AsString;
  edIT_INSTITUCION_OTORGANTE.Text := sdqConsulta.FieldByName('IT_INSTITUCION_OTORGANTE').AsString;
  edIT_TITULO.Text := sdqConsulta.FieldByName('IT_TITULO').AsString;
end;

function TfrmManPIT_FIRMANTES.Validar: Boolean;
begin
  Result := False;
  if (ModoABM = maAlta) and ExisteSqlEx('SELECT 1 FROM PIT_FIRMANTES WHERE IT_CODIGO = :P', [edIT_CODIGO.Text]) Then
    InvalidMsg(edIT_CODIGO, 'Ya existe un firmante con el código seleccionado')

  else if IsEmptyString(edIT_NOMBRE.Text) then
    InvalidMsg(edIT_NOMBRE, 'Debe ingresar el apellido y el nombre')

  else
    Result := True;
end;

procedure TfrmManPIT_FIRMANTES.cmbIT_TIPO_MATRICULAKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 Then
    cmbIT_TIPO_MATRICULA.Value := '';
end;

end.
