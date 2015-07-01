unit unSeguimientoPQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql, Mask,
  ToolEdit, DateComboBox, PatternEdit, IntEdit, RxRichEd, DBRichEd,
  JvgGroupBox, ShellAPI;

type
  TfrmSeguimientoPQ = class(TfrmCustomGridABM)
    JvgGroupBox1: TJvgGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dcbAltaDesde: TDateComboBox;
    dcbAltaHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dcbEnvioDesde: TDateComboBox;
    dcbEnvioHasta: TDateComboBox;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    PedidoHasta: TIntEdit;
    PedidoDesde: TIntEdit;
    edUsuAlta: TEdit;
    chkBajas: TCheckBox;
    chkSinProcesar: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    chkSinErrores: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ShortCutControlShortCuts9ShortCutPress(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeguimientoPQ: TfrmSeguimientoPQ;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoPQ.ClearControls;
begin
  // Nada
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmSeguimientoPQ.DoABM: Boolean;
begin
  Result := true
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoPQ.LoadControls;
begin
  // Nada
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmSeguimientoPQ.Validar: Boolean;
begin
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmSeguimientoPQ.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PR_FECHABAJA';
  Sql.TableName := 'hys.hpr_pedidosreporte';
  CheckPK := True;

  dcbAltaDesde.Date := Date - 1;
  dcbAltaHasta.Date := Date;

  tbRefrescarClick(Sender);
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmSeguimientoPQ.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(
    ' SELECT DISTINCT (SELECT DISTINCT TO_NUMBER(pp_valor) '+
    '                    FROM hys.hpp_parametrospedido '+
    '                   WHERE pp_parametro = ''LOTEFILTRO'' '+
    '                     AND pp_idpedidoreporte = pr_id) AS lote, '+
    '                 NVL(LOWER((SELECT DISTINCT pp_valor '+
    '                                       FROM hys.hpp_parametrospedido '+
    '                                      WHERE pp_parametro = ''EMAILFILTRO'' '+
    '                                        AND pp_idpedidoreporte = pr_id)), pr_emailrespuesta) pr_emailrespuesta, '+
    '                 pr_fechaalta, pr_usualta, NVL2(pr_fechaenvio, ''SI'', ''NO'') procesado, pr_descripcionerror, ee_fechaenvio, '+
    '                 pr_fechabaja, ea_nombreadjunto, ea_path '+
    '            FROM hys.hpr_pedidosreporte pr, comunes.cee_emailaenviar ee, comunes.cea_emailadjunto '+
    '           WHERE ee.ee_id(+) = pr.pr_idemailaenviar '+
    '             AND pr_origenpedido = ''A'' '+
    '             AND pr_fechabaja IS NULL '+
    '             AND ea_idemailaenviar(+) = ee_id '+
    '             AND pr_fechabaja IS NULL '+
    '             AND pr_pedidovacio = ''N'' ');

  if not dcbAltaDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND pr_fechaalta >= ' + SqlValue (dcbAltaDesde.Date));

  if not dcbAltaHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND pr_fechaalta < ' + SqlValue (dcbAltaHasta.Date) + ' + 1');

  if not dcbEnvioDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND ee_fechaenvio >= ' + SqlValue (dcbEnvioDesde.Date));

  if not dcbEnvioHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND ee_fechaenvio < ' + SqlValue (dcbEnvioHasta.Date) + ' + 1');

  if not IsEmptyString (edUsuAlta.Text) then
    sdqConsulta.SQL.Add('   AND pr_usualta = ' + SqlValue (edUsuAlta.Text));

  if not chkBajas.Checked then
    sdqConsulta.SQL.Add('   AND pr_fechabaja IS NULL');

  if chkSinProcesar.Checked then
    sdqConsulta.SQL.Add('   AND pr_fechaenvio IS NULL');

  if chkSinErrores.Checked then
    sdqConsulta.SQL.Add('   AND pr_error = ''N'' ');

  if PedidoDesde.Value > 0 then
    sdqConsulta.SQL.Add('   AND pr_id >= ' + SqlInteger (PedidoDesde.Value));

  if PedidoHasta.Value > 0 then
    sdqConsulta.SQL.Add('   AND pr_id <= ' + SqlInteger (PedidoHasta.Value));

  sdqConsulta.SQL.Add('ORDER BY 1 DESC');

  inherited;
end;

procedure TfrmSeguimientoPQ.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('procesado').AsString = 'SI' then begin
    AFont.Color := clBlue;
    Background  := clWhite;
  end;

  if not sdqConsulta.FieldByName('pr_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmSeguimientoPQ.ShortCutControlShortCuts9ShortCutPress(
  Sender: TObject);
begin
  JvgGroupBox1.Collapsed := not JvgGroupBox1.Collapsed
end;

procedure TfrmSeguimientoPQ.GridDblClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ea_path').IsNull then
    Exit;

  if FileExists (sdqConsulta.FieldByName('ea_path').AsString) then
    ShellExecute(Application.Handle, nil, PChar(sdqConsulta.FieldByName('ea_path').AsString), '', '', SW_SHOWNORMAL)
  else
    MsgBox('El archivo no existe.', MB_ICONERROR + MB_OK);
end;

end.


