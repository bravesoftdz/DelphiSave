unit unManPRG_RIESGOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  General;

type
  TfrmManPRG_RIESGOS = class(TfrmCustomGridABM)
    Label1: TLabel;
    edRG_CODIGO: TPatternEdit;
    edRG_DESCRIPCION: TEdit;
    Label2: TLabel;
    chkRG_CANCERIGENO: TCheckBox;
    Label3: TLabel;
    edRG_ESOP: TPatternEdit;
    dbiBusqueda: TDBIncrementalSearch;
    Label4: TLabel;
    edRG_SufijoESOP: TPatternEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManPRG_RIESGOS }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPRG_RIESGOS.ClearControls;
begin
  edRG_CODIGO.Clear;
  edRG_DESCRIPCION.Clear;
  edRG_ESOP.Clear;
  chkRG_CANCERIGENO.Checked := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManPRG_RIESGOS.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('RG_CODIGO', sdqConsulta.FieldByName('RG_CODIGO').AsString);
    Sql.Fields.Add('RG_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('RG_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('RG_CODIGO', edRG_CODIGO.Text);
      Sql.Fields.Add('RG_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('RG_FECHAALTA', exDateTime);
      Sql.Fields.Add('RG_ID', ValorSqlInteger ('SELECT art.seq_rg_id.nextval FROM dual'));
    end
    else
    begin
      Sql.PrimaryKey.Add('RG_CODIGO', sdqConsulta.FieldByName('RG_CODIGO').AsString);
      Sql.Fields.Add('RG_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('RG_FECHAMODIF', exDateTime);
      Sql.Fields.Add('RG_USUBAJA', exNull);
      Sql.Fields.Add('RG_FECHABAJA', exNull);
    end;

    Sql.Fields.Add('RG_DESCRIPCION', edRG_DESCRIPCION.Text);
    Sql.Fields.Add('RG_ESOP', edRG_ESOP.Text);
    Sql.Fields.Add('RG_SufijoESOP', edRG_SufijoESOP.Text);
    Sql.Fields.Add('RG_CANCERIGENO', String(iif(chkRG_CANCERIGENO.Checked, 'S', 'N')));
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPRG_RIESGOS.LoadControls;
begin
  edRG_CODIGO.Text          := sdqConsulta.FieldByName('RG_CODIGO').AsString;
  edRG_DESCRIPCION.Text     := sdqConsulta.FieldByName('RG_DESCRIPCION').AsString;
  edRG_ESOP.Text            := sdqConsulta.FieldByName('RG_ESOP').AsString;
  edRG_SufijoESOP.Text      := sdqConsulta.FieldByName('RG_SufijoESOP').AsString;
  chkRG_CANCERIGENO.Checked := sdqConsulta.FieldByName('RG_CANCERIGENO').AsString = SQL_TRUE;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManPRG_RIESGOS.Validar: Boolean;
begin
  Result := False;
  if IsEmptyString(edRG_CODIGO.Text) Then
    InvalidMsg(edRG_CODIGO, 'Ingrese el Código del Riesgo')

  else if IsEmptyString(edRG_DESCRIPCION.Text) Then
    InvalidMsg(edRG_DESCRIPCION, 'Debe ingresar la Descripción del Riesgo')

  else if (Length(edRG_ESOP.Text)<>0) and (Length(edRG_ESOP.Text)<>5) Then
    InvalidMsg(edRG_ESOP, 'El Código de ESOP es inválido')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPRG_RIESGOS.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'PRG_RIESGOS';
  FieldBaja := 'RG_FECHABAJA';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPRG_RIESGOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuManPRG_RIESGOS.Enabled := True;
  inherited; {Action := caFree}
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
