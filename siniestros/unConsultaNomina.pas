unit unConsultaNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, JvgGroupBox, Mask, PatternEdit;

type
  TfrmConsultaNomina = class(TfrmCustomConsulta)
    ShortCutControlChild: TShortCutControl;
    pnlBottom: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pnlBottomFind: TPanel;
    gbArchivo: TJvgGroupBox;
    Label1: TLabel;
    edNombre: TEdit;
    Label2: TLabel;
    edCUIT: TPatternEdit;
    lbFiltro: TLabel;
    btnBuscar: TButton;
    chkBusquedaActiva: TCheckBox;
    procedure edNombreChange(Sender: TObject);
    procedure edCUITChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkBusquedaActivaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure HitEnter(Sender: TObject; var Key: Char);
    procedure HitDownKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    APalabras: TStringList;
    FContrato: integer;
  public
    procedure RefreshData; override;
    property  Contrato: integer read FContrato write FContrato;
  end;

var
  frmConsultaNomina: TfrmConsultaNomina;

implementation

uses
  AnsiSql, VCLExtra, unArt, Strfuncs, CustomDlgs, unGrids;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.RefreshData;
begin
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  sdqConsulta.SQL.Text := 'SELECT TJ_CUIL, TJ_NOMBRE, RL_FECHAINGRESO, ' +
                          '       TO_DATE (NULL) Egreso, ''S'' Activo' +
                          '  FROM CTJ_TRABAJADOR, CRL_RELACIONLABORAL' +
                          ' WHERE RL_CONTRATO = ' + SQLValue(Contrato) +
                          '   AND RL_IDTRABAJADOR = TJ_ID' +
                          ' UNION ALL ' +
                          'SELECT TJ_CUIL, TJ_NOMBRE, HL_FECHAINGRESO, ' +
                          '       HL_FECHAEGRESO, ''N'' ' +
                          '  FROM CTJ_TRABAJADOR, CHL_HISTORICOLABORAL' +
                          ' WHERE HL_CONTRATO = ' + SQLValue(Contrato) +
                          '   AND HL_IDTRABAJADOR = TJ_ID';

  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + SortDialog.OrderBy;
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    DynColWidthsByData(Grid);
  if edNombre.CanFocus then
    edNombre.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.edNombreChange(Sender: TObject);
begin
  if ( ( Length(edNombre.Text) >= 5 ) and chkBusquedaActiva.Checked) or ( ( Length(edNombre.Text) >= 5) and not Assigned(Sender)) then
    try
      sdqConsulta.Filtered := True;

      if sdqConsulta.Locate('TJ_NOMBRE', edNombre.Text, [loPartialKey{, loCaseInsensitive}]) then
      begin
        lbFiltro.Caption := 'Encontrado';
        lbFiltro.Font.Color := clTeal;
      end else
      begin
        sdqConsulta.Refresh;
        lbFiltro.Caption := 'No encontrado';
        lbFiltro.Font.Color := clMaroon;
      end;
    except
    end
  else
  begin
    sdqConsulta.MoveBy(30);
    sdqConsulta.MoveBy(-30);
    lbFiltro.Caption := 'Faltan ' + IntToStr(5 - Length(edNombre.Text)) + ' letras para activar la búsqueda.';
    lbFiltro.Font.Color := clNavy;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.edCUITChange(Sender: TObject);
begin
  if ( ( Length(edCUIT.Text) >= 5 ) and chkBusquedaActiva.Checked) or ( ( Length(edCUIT.Text) >= 5) and not Assigned(Sender)) then
    try
      sdqConsulta.Filtered := True;

      if sdqConsulta.Locate('TJ_CUIL', edCUIT.Text, [loPartialKey{, loCaseInsensitive}]) then
      begin
        lbFiltro.Caption := 'Encontrado';
        lbFiltro.Font.Color := clTeal;
      end else
      begin
        sdqConsulta.Refresh;
        lbFiltro.Caption := 'No encontrado';
        lbFiltro.Font.Color := clMaroon;
      end;
    except
    end
  else
  begin
    sdqConsulta.MoveBy(30);
    sdqConsulta.MoveBy(-30);
    lbFiltro.Caption := 'Faltan ' + IntToStr(5 - Length(edCUIT.Text)) + ' dígitos para activar la búsqueda.';
    lbFiltro.Font.Color := clNavy;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.FormCreate(Sender: TObject);
begin
  inherited;
  lbFiltro.Caption := '';
  APalabras := TStringList.Create;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.FSFormShow(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.Active then
    RefreshData;  
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  i: byte;
begin
  inherited;

  if (Length(edNombre.Text) < 5) or not chkBusquedaActiva.Checked then
  begin
    if (Length(edCUIT.Text) < 5) or not chkBusquedaActiva.Checked then
    begin
      Accept := True;
    end else if DataSet.Active and Assigned(DataSet.FindField('TJ_CUIL')) then
    begin
      APalabras.Clear;
      Split(edCUIT.Text, '%', APalabras);

      for i := 0 to APalabras.Count - 1 do
      begin
        Accept := Accept and (Pos(APalabras[i], DataSet.FieldByName('TJ_CUIL').AsString) > 0);
      end;
    end;
  end else
  if DataSet.Active and Assigned(DataSet.FindField('TJ_NOMBRE')) then
  begin
    APalabras.Clear;
    Split(edNombre.Text, '%', APalabras);

    for i := 0 to APalabras.Count - 1 do
    begin
      Accept := Accept and (Pos(APalabras[i], DataSet.FieldByName('TJ_NOMBRE').AsString) > 0);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  APalabras.Free;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.chkBusquedaActivaClick(Sender: TObject);
begin
  inherited;
  btnBuscar.Enabled := not btnBuscar.Enabled;
  edCUITChange(nil);
  edNombreChange(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if Screen.ActiveControl = edCUIT then
    edCUITChange(nil)
  else
    edNombreChange(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.HitEnter(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnBuscar.Click
  else if Key = #9 then
    TChangeEdit(Screen.ActiveControl).Change;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.HitDownKey(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
    if Grid.CanFocus then
      Grid.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsultaNomina.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Width := GetColumnWidths(Grid, True);
end;
{------------------------------------------------------------------------------}
end.
