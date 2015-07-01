unit unCompileSchemas;

interface
     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, StdCtrls, CheckCombo, DBCheckCombo, ComCtrls,
  ToolWin, ExtCtrls, Grids, DBGrids, RXDBCtrl, ShortCutControl, SortDlg,
  Placemnt, FormPanel, Menus, Mask, PatternEdit, ComboEditor;

type
  TfrmCompInvalid = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cmbOwners: TDBCheckCombo;
    sdqOwners: TSDQuery;
    dsOwners: TDataSource;
    Label2: TLabel;
    cmbTipos: TCheckCombo;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbCompile: TToolButton;
    ToolButton1: TToolButton;
    tbSalir: TToolButton;
    dbGrid: TRxDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ShortCutControl: TShortCutControl;
    tbOrden: TToolButton;
    ToolButton4: TToolButton;
    SortDialog: TSortDialog;
    tbLimpiar: TToolButton;
    FormPlacement: TFormPlacement;
    fpProgreso: TFormPanel;
    lbProceso: TLabel;
    btnCancelar: TButton;
    ProgressBar: TProgressBar;
    sdqDatosOWNER: TStringField;
    sdqDatosOBJECT_TYPE: TStringField;
    sdqDatosOBJECT_NAME: TStringField;
    pMnuSeleccion: TPopupMenu;
    mnuSelectAll: TMenuItem;
    mnuClearSelect: TMenuItem;
    mnuInvertSelect: TMenuItem;
    chkExcluirBD: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbCompileClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuClearSelectClick(Sender: TObject);
    procedure mnuInvertSelectClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bCancel: boolean;
    function GetObjectTypes: string;
  public
  end;

var
  frmCompInvalid: TfrmCompInvalid;

implementation

uses BaseDeDatos, unPrincipal, General;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT OWNER, OBJECT_TYPE, OBJECT_NAME ' +
    'FROM SYS.ALL_OBJECTS ' +
    'WHERE STATUS != ''VALID'' ';

  if cmbOwners.Text <> '' then
    sSql := sSql + 'AND OWNER ' + cmbOwners.InSql;

  if cmbTipos.Text <> '' then
    sSql := sSql + 'AND OBJECT_TYPE ' + GetObjectTypes;

  if chkExcluirBD.Checked then
    sSql := sSql + 'AND OWNER NOT IN (''AURORA$JIS$UTILITY$'', ''CTXSYS'', ''DBSNMP'', ''MDSYS'', ''MTSSYS'', ' +
                                    ' ''ORDPLUGINS'', ''ORDSYS'', ''OSE$HTTP$ADMIN'', ''OUTLN'', ''SQLNTDATA'', ' +
                                    ' ''SYNCHRO'', ''SYS'', ''SYSTEM'') ';

  sdqDatos.Close;
  sdqDatos.Sql.Text := sSql + SortDialog.OrderBy;
  sdqDatos.Open;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.tbLimpiarClick(Sender: TObject);
begin
  cmbOwners.ClearChecks;
  cmbTipos.ClearChecks;
  sdqDatos.Close;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.tbSalirClick(Sender: TObject);
begin
  Close;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.FormCreate(Sender: TObject);
begin
  sdqOwners.Open;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.tbCompileClick(Sender: TObject);
var
  sSql, sBack: string;
  i: integer;
begin
  if not sdqDatos.Active or sdqDatos.IsEmpty then
    Abort;
    
  fpProgreso.ShowOnTop;
  try
    bCancel := false;
    ProgressBar.Max := dbGrid.SelectedRows.Count;
    for i := 0 to dbGrid.SelectedRows.Count - 1 do
    begin
      ProgressBar.Position := i;
      sdqDatos.GotoBookmark(Pointer(dbGrid.SelectedRows.Items[i]));
      lbProceso.Caption := sdqDatosOBJECT_TYPE.AsString + ' ' +
        sdqDatosOWNER.AsString + '.' +
        sdqDatosOBJECT_NAME.AsString;
      Application.ProcessMessages;
      if bCancel then
        Break;
        //---------------------------------------------------------------
      sBack := '';
      sSql := 'ALTER ';
      case ArrayPos(sdqDatosOBJECT_TYPE.AsString, ['PACKAGE', 'PACKAGE BODY']) of
        0, 1:
        begin
          sBack := 'BODY';
          sSql := sSql + 'PACKAGE';
        end;
        else
          sSql := sSql + sdqDatosOBJECT_TYPE.AsString;
      end;
      sSql := sSql + ' "' + sdqDatosOWNER.AsString + '"."' +
        sdqDatosOBJECT_NAME.AsString + '" COMPILE ' + sBack;

      try
        EjecutarSql(sSql, True);
      except
        On E: Exception do
        begin
          if Pos('ORA-24338', E.Message) = 0 then
            if MsgBox(E.Message, MB_ICONEXCLAMATION + MB_OKCANCEL) = ID_CANCEL then
              raise;
        end;
      end;
      if bCancel then
        Break;
    end;
  finally
    sdqDatos.Refresh;
    fpProgreso.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TfrmCompInvalid.GetObjectTypes: string;
var
  i: integer;
const
  IN_STR = 'IN (';
  SQL_SEPARATOR = ';';
begin
  Result := IN_STR;
  for i := 0 to cmbTipos.Items.Count - 1 do
    if cmbTipos.Checked[i] then
      if cmbTipos.Items[i] = 'PACKAGE' then
        Result := Result + '''PACKAGE'', ''PACKAGE BODY'','
      else
        Result := Result + '''' + cmbTipos.Items[i] + ''',';

  if Result = IN_STR then
    Result := ''
  else
  begin
    SetLength(Result, Length(Result) - 1);
    Result := Result + ')';
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.btnCancelarClick(Sender: TObject);
begin
  bCancel := true;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.mnuSelectAllClick(Sender: TObject);
begin
  dbGrid.SelectAll;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.mnuClearSelectClick(Sender: TObject);
begin
  dbGrid.UnselectAll;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.mnuInvertSelectClick(Sender: TObject);
begin
//    dbGrid.ToggleRowSelection;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.dbGridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: boolean);
begin
  if dbGrid.SelectedRows.CurrentRowSelected then
    Background := clNavy     // Color para la fila seleccionada
  else
  begin
    Background := clWhite;  // Color de fondo para la fila no seleccionada
    AFont.Color := clBlack;  // Color de la Fuente para la fila no seleccionada
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCompInvalid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(frmPrincipal.mnuDocCompiladorObjetos) then
    frmPrincipal.mnuDocCompiladorObjetos.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
