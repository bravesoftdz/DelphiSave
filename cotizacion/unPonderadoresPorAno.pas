unit unPonderadoresPorAno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, CurrEdit, Mask,
  PatternEdit, IntEdit;

type
  TfrmPonderadoresPorAno = class(TfrmCustomGridABM)
    edAno: TIntEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edPonderador: TCurrencyEdit;
    edIBNR: TCurrencyEdit;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
                              var AlignFooter: TAlingFooter);
    procedure tbModificarClick(Sender: TObject);
  private
    function GetCanClose: Boolean;

    procedure CalcularTotales;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    property CanClose: Boolean read GetCanClose;
  end;

const
  MAXCOLS = 0;

var
  CamposSuma: Array[0..MAXCOLS] of String = ('PO_PONDERADOR');
  frmPonderadoresPorAno: TfrmPonderadoresPorAno;
  TotalConsulta: Array of Extended;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql;

{$R *.dfm}

function TfrmPonderadoresPorAno.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'comunes.cpo_ponderadoresporano';

  if ModoABM = maBaja then
  begin
    iId := sdqConsulta.FieldByName('po_id').AsInteger;
    Sql.Fields.Add('po_usubaja',    Sesion.UserID);
    Sql.Fields.Add('po_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      iId := -1;
      Sql.Fields.Add('po_usualta',    Sesion.UserID);
      Sql.Fields.Add('po_fechaalta', 'SYSDATE', False);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('po_id').AsInteger;
      Sql.Fields.Add('po_usumodif',   Sesion.UserID);
      Sql.Fields.Add('po_fechamodif', 'SYSDATE', False);
    end;

    Sql.Fields.Add('po_ano',        edAno.Value);
    Sql.Fields.Add('po_ponderador', edPonderador.Value);
    Sql.Fields.Add('po_ibnr',       edIBNR.Value);
  end;
  
  Sql.PrimaryKey.Add('po_id', iId, False);

  Result := inherited DoABM;

  if Result then
    RefreshData;
end;

function TfrmPonderadoresPorAno.GetCanClose: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT SUM(po_ponderador)' +
     ' FROM comunes.cpo_ponderadoresporano' +
    ' WHERE po_fechabaja IS NULL';
  Result := (ValorSqlExtended(sSql) = 100);
end;

function TfrmPonderadoresPorAno.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(edAno.IsEmpty, edAno, 'El Año es obligatorio.');
  Verificar((edAno.Value > 9999), edAno, 'El Año no puede ser mayor a 9999.');

  sSql :=
    'SELECT 1' +
     ' FROM comunes.cpo_ponderadoresporano' +
    ' WHERE po_ano = :ano' +
      ' AND po_fechabaja IS NULL';
  if ModoABM = maModificacion then
    sSql := sSql + ' AND po_id <> ' + SqlValue(sdqConsulta.FieldByName('po_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [edAno.Value]), edAno, 'Ya existe valores cargados para ese año.');

  Result := True;
end;


procedure TfrmPonderadoresPorAno.CalcularTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqConsulta.Active then
        SumFields(sdqConsulta, CamposSuma, TotalConsulta, 'PO_FECHABAJA');
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmPonderadoresPorAno.ClearControls;
begin
  edAno.Clear;
  edPonderador.Clear;
  edIBNR.Clear;
end;

procedure TfrmPonderadoresPorAno.LoadControls;
begin
  with sdqConsulta do
  begin
    edAno.Value        := FieldByName('po_ano').AsInteger;
    edPonderador.Value := FieldByName('po_ponderador').AsFloat;
    edIBNR.Value       := FieldByName('po_ibnr').AsFloat;
  end;
end;

procedure TfrmPonderadoresPorAno.RefreshData;
begin
  sdqConsulta.Sql.Text :=
    'SELECT cpo.*, NVL(po_fechamodif, po_fechaalta) fechamodif' +
     ' FROM comunes.cpo_ponderadoresporano cpo';
    SortDialog.OrderBy;

  inherited;

  CalcularTotales;
end;

procedure TfrmPonderadoresPorAno.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(DataSet.FieldByName('po_ponderador')).DisplayFormat := ',0.0000 %';
  TFloatField(DataSet.FieldByName('po_ibnr')).DisplayFormat       := ',0.0000 %';
end;

procedure TfrmPonderadoresPorAno.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'po_fechabaja';
  ShowActived := True;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmPonderadoresPorAno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not CanClose then
  begin
    InfoHint(Grid, 'La suma de la columna Ponderador debe ser igual a 100.');
    Action := caNone;
    Exit;
  end;

  inherited;
end;

procedure TfrmPonderadoresPorAno.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CamposSuma);

  if iPos = 0 then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '', 4)
  else if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '', 4);
end;

procedure TfrmPonderadoresPorAno.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('po_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

end.
