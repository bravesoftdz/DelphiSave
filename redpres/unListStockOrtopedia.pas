unit unListStockOrtopedia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Mask, ToolEdit, DateComboBox, FormPanel;

type
  TfrmListStockOrtopedia = class(TfrmCustomConsulta)
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dcHastaAlta: TDateComboBox;
    dcDesdeAlta: TDateComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dcHastaModif: TDateComboBox;
    dcDesdeModif: TDateComboBox;
    gbEstado: TGroupBox;
    cmbEstado: TComboBox;
    fpDetalle: TFormPanel;
    Bevel2: TBevel;
    btnCancelarDetalle: TButton;
    dgDetalle: TArtDBGrid;
    sdqDetalle: TSDQuery;
    dsDetalle: TDataSource;
    fpAlta: TFormPanel;
    Label2: TLabel;
    Label3: TLabel;
    edMaterialAlta: TMemo;
    edObservAlta: TMemo;
    Bevel1: TBevel;
    btnCancelarAlta: TButton;
    btnAceptarAlta: TButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function HayRegistroActivo :Boolean;
  public
    { Public declarations }
  end;

var
  frmListStockOrtopedia: TfrmListStockOrtopedia;

implementation

uses CustomDlgs, Strfuncs, AnsiSql, unSesion, unDmPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT so_id, so_descripcion, so_estado, ' +
                ' DECODE(so_origen, ''R'', ''Recupero'', ''C'', ''Compra'') origen, ' +
                ' DECODE(so_estado, ''A'', ''Activo'', ''B'', ''Baja'', ''E'', ''Entregado'') estado, ' +
                ' so_observaciones, so_fechaalta, so_fechamodif, so_fechabaja ' +
           ' FROM amed.mso_stock_ortopedia ' +
          ' WHERE so_fechabaja IS NULL';

  if not(dcDesdeAlta.IsEmpty) then
    sSql := sSql + ' AND so_fechaalta >= ' + dcDesdeAlta.SqlText;

  if not(dcHastaAlta.IsEmpty) then
    sSql := sSql + ' AND so_fechaalta <= ' + dcHastaAlta.SqlText;

  if not(dcDesdeModif.IsEmpty) then
    sSql := sSql + ' AND so_fechamodif >= ' + dcDesdeModif.SqlText;

  if not(dcHastaModif.IsEmpty) then
    sSql := sSql + ' AND so_fechamodif <= ' + dcHastaModif.SqlText;

  case cmbEstado.ItemIndex of
    1: sSql := sSql + ' AND so_estado = ''A'' ';
    2: sSql := sSql + ' AND so_estado = ''B'' ';
    3: sSql := sSql + ' AND so_estado = ''E'' ';
  end;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  tbPropiedades.Enabled := HayRegistroActivo;  
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbModificarClick(Sender: TObject);
begin
  with sdqDetalle do
  begin
    Close;
    ParamByName('pIdStock').AsInteger := sdqConsulta.FieldByName('SO_ID').AsInteger;
    Open;
  end;
  fpDetalle.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbLimpiarClick(Sender: TObject);
begin
  cmbEstado.ItemIndex := 0;
  dcDesdeAlta.Clear;
  dcHastaAlta.Clear;
  dcDesdeModif.Clear;
  dcHastaModif.Clear;
  tbPropiedades.Enabled := False;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbNuevoClick(Sender: TObject);
begin
  edMaterialAlta.Clear;
  edObservAlta.Clear;
  fpAlta.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.btnAceptarAltaClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(IsEmptyString(Trim(edMaterialAlta.Lines.Text)), edMaterialAlta,
            'Debe ingresar la descripción del material');

  sSql := 'INSERT INTO amed.mso_stock_ortopedia ' +
          '(so_id, so_descripcion, so_origen, so_estado, so_observaciones, ' +
          ' so_fechaalta, so_usualta) VALUES ( ' +
          ' amed.seq_mso_id.nextval, ' + SqlValue(edMaterialAlta.Lines.Text) + ',' +
          ' ''C'', ''A'', ' + SqlValue(edObservAlta.Lines.Text) + ',' +
          ' ActualDate, ' + SqlValue(Sesion.UserID) + ')';
  EjecutarSql(sSql);
  fpAlta.ModalResult := mrOk;
  tbRefrescarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  if HayRegistroActivo and
     (MsgBox('Se dispone a dar de baja el registro.' + #13 + '¿Esta usted seguro?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sSql := 'UPDATE amed.mso_stock_ortopedia ' +
              ' SET so_fechabaja = actualdate, ' +
                  ' so_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE so_id = ' + SqlInt(sdqConsulta.FieldByName('SO_ID').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmListStockOrtopedia.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.tbPropiedadesClick(Sender: TObject);
var
  sSql :String;
begin
  if HayRegistroActivo and
    (sdqConsulta.FieldByName('SO_ESTADO').AsString <> 'B') and
     (MsgBox('Se dispone a dar de baja por desgaste el registro.' + #13 + '¿Esta usted seguro?',
              MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    sSql := 'UPDATE amed.mso_stock_ortopedia ' +
              ' SET so_fechamodif = actualdate, ' +
                  ' so_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' so_estado = ''B'' ' +
            ' WHERE so_id = ' + SqlInt(sdqConsulta.FieldByName('SO_ID').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.FormCreate(Sender: TObject);
begin
  inherited;
  tbPropiedades.ImageIndex  := 45;
  cmbEstado.ItemIndex       := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(Highlight) and
    (sdqConsulta.FieldByName('SO_ESTADO').AsString = 'B') then
    AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListStockOrtopedia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
