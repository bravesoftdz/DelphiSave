unit unManCTB_MOTEN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDBAwareFrame;

type
  TfrmManCTB_MOTEN = class(TfrmManCtbTablas)
    chkEnvio: TCheckBox;
    GroupBox1: TGroupBox;
    rbMovimiento: TRadioButton;
    rbEndoso: TRadioButton;
    GroupBox2: TGroupBox;
    rbEnvioSi: TRadioButton;
    rbEnvioNo: TRadioButton;
    rbEnvioTodos: TRadioButton;
    GroupBox3: TGroupBox;
    rbNotaSi: TRadioButton;
    rbNotaNo: TRadioButton;
    rbNotaTodos: TRadioButton;
    GroupBox4: TGroupBox;
    rbCartaSi: TRadioButton;
    rbCartaNo: TRadioButton;
    rbCartaTodos: TRadioButton;
    GroupBox5: TGroupBox;
    rbEndosoSi: TRadioButton;
    rbEndosoNo: TRadioButton;
    rbEndosoTodos: TRadioButton;
    rbTipoTodos: TRadioButton;
    chkNota: TCheckBox;
    chkCarta: TCheckBox;
    chkEndoso: TCheckBox;
    fraTB_ESPECIAL1: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    GroupBox6: TGroupBox;
    rbVigenciaSi: TRadioButton;
    rbVigenciaNo: TRadioButton;
    rbVigenciaTodos: TRadioButton;
    chkVigencia: TCheckBox;
    Label2: TLabel;
    edTipo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure CambiaClasificacion(Sender: TObject);
  protected
    function GetSql: String; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure DoABMAddFields; override;
    procedure LoadControls; override;
    procedure SetEspecialVisible(const Value: Boolean); override;
  public
  end;

var
  frmManCTB_MOTEN: TfrmManCTB_MOTEN;

implementation

uses
  VCLExtra, CustomDlgs, undmPrincipal, AnsiSql, unPrincipal;

{$R *.DFM}

procedure TfrmManCTB_MOTEN.ClearControls;
begin
  inherited;

  chkEnvio.Checked  := False;
  chkNota.Checked   := False;
  chkCarta.Checked  := False;
  chkEndoso.Checked := False;
  fraTB_ESPECIAL1.Clear;
end;

procedure TfrmManCTB_MOTEN.LoadControls;
begin
  inherited;

  with sdqConsulta do
  begin
    chkEnvio.Checked    := (FieldByName('enviosrt').AsString = 'S');
    chkNota.Checked     := (FieldByName('notasrt').AsString = 'S');
    chkCarta.Checked    := (FieldByName('carta').AsString = 'S');
    chkEndoso.Checked   := (FieldByName('endoso').AsString = 'S');
    chkVigencia.Checked := (FieldByName('vigencia').AsString = 'S');
    if FieldByName('tb_especial1').AsString <> '' then
      fraTB_ESPECIAL1.Value := FieldByName('tb_especial1').AsString;
  end;
  
  CambiaClasificacion(nil);
end;

procedure TfrmManCTB_MOTEN.SetEspecialVisible(const Value: Boolean);
begin
  inherited;

  edEspecial.Visible := False;
  lbEspecial.Visible := False;
end;

procedure TfrmManCTB_MOTEN.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := True;
  Clave := 'MOTEN';
  EspecialVisible := True;

  with fraTB_ESPECIAL1 do
  begin
    Clave     := 'FEEND';
    ShowBajas := True;
    OnChange  := CambiaClasificacion;
  end;
  VCLExtra.LockControls(edTipo, True);
end;

procedure TfrmManCTB_MOTEN.tbLimpiarClick(Sender: TObject);
begin
  rbMovimiento.Checked    := False;
  rbEndoso.Checked        := False;
  rbTipoTodos.Checked     := True;
  rbEnvioSi.Checked       := False;
  rbEnvioNo.Checked       := False;
  rbEnvioTodos.Checked    := True;
  rbNotaSi.Checked        := False;
  rbNotaNo.Checked        := False;
  rbNotaTodos.Checked     := True;
  rbCartaSi.Checked       := False;
  rbCartaNo.Checked       := False;
  rbCartaTodos.Checked    := True;
  rbEndosoSi.Checked      := False;
  rbEndosoNo.Checked      := False;
  rbEndosoTodos.Checked   := True;
  rbVigenciaSi.Checked    := False;
  rbVigenciaNo.Checked    := False;
  rbVigenciaTodos.Checked := True;
end;

procedure TfrmManCTB_MOTEN.DoABMAddFields;
var
  Cond: String;
begin
  //Es importante el orden en que se ejecuta esta rutina!!
  Cond := '';
  if chkEnvio.Checked then
    Cond := Cond + 'S'
  else
    Cond := Cond + 'N';

  if chkNota.Checked then
    Cond := Cond + 'S'
  else
    Cond := Cond + 'N';

  if chkCarta.Checked then
    Cond := Cond + 'S'
  else
    Cond := Cond + 'N';

  if chkEndoso.Checked then
    Cond := Cond + 'S'
  else
    Cond := Cond + 'N';

  if chkVigencia.Checked then
    Cond := Cond + 'S'
  else
    Cond := Cond + 'N';

  Sql.Fields.Add('tb_especial2',   Cond);
  Sql.Fields.Add('tb_descripcion', edDescripcion.Text);
  Sql.Fields.Add('tb_especial1',   fraTB_ESPECIAL1.Value);
end;

function TfrmManCTB_MOTEN.Validar: boolean;
begin
  Result := inherited Validar;

  if Result and fraTB_ESPECIAL1.IsEmpty then
  begin
    Result := False;
    InvalidMsg(fraTB_ESPECIAL1, 'La clasificación del endoso es obligatoria.');
  end;
end;

procedure TfrmManCTB_MOTEN.CambiaClasificacion(Sender: TObject);
var
  sSql: String;
begin
// Indica que tipo de Endoso es
  if fraTB_ESPECIAL1.IsEmpty then
    edTipo.Clear
  else
  begin
    sSql :=
      'SELECT iif_char(tb_especial1, ''1'', ''Endoso'', ''Movimiento'')' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''FEEND''' +
        ' AND tb_codigo = :codigo';
    edTipo.Text := ValorSqlEx(sSql, [fraTB_ESPECIAL1.Value]);
  end;
end;

function TfrmManCTB_MOTEN.GetSql: String;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT endo.tb_codigo tb_codigo, endo.tb_descripcion tb_descripcion, endo.tb_especial1 tb_especial1, ' +
          ' tipo.tb_descripcion clasificacion, iif_char(tipo.tb_especial1, ''1'', ''Endoso'', ''Movimiento'') tipo,' +
          ' endo.tb_modulo tb_modulo, endo.tb_baja tb_baja, endo.tb_fechabaja tb_fechabaja,' +
          ' SUBSTR(endo.tb_especial2, 1, 1) enviosrt, SUBSTR(endo.tb_especial2, 2, 1) notasrt,' +
          ' SUBSTR(endo.tb_especial2, 3, 1) carta, SUBSTR(endo.tb_especial2, 4, 1) endoso,' +
          ' SUBSTR(endo.tb_especial2, 5, 1) vigencia, endo.tb_especial2 tb_especial2' +
     ' FROM ctb_tablas endo, ctb_tablas tipo' +
    ' WHERE endo.tb_clave = :pclave' +
      ' AND (   endo.tb_modulo = :pmodulo' +
           ' OR :pmodulo IS NULL)' +
      ' AND endo.tb_codigo <> ''0''' +
      ' AND tipo.tb_clave = ''FEEND''' +
      ' AND tipo.tb_codigo = endo.tb_especial1';
  sWhere := '';

  if rbEnvioSi.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 1, 1) = ''S'''
  else if rbEnvioNo.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 1, 1) = ''N''';

  if rbNotaSi.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 2, 1) = ''S'''
  else if rbNotaNo.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 2, 1) = ''N''';

  if rbCartaSi.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 3, 1) = ''S'''
  else if rbCartaNo.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 3, 1) = ''N''';

  if rbEndosoSi.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 4, 1) = ''S'''
  else if rbEndosoNo.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 4, 1) = ''N''';

  if rbVigenciaSi.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 5, 1) = ''S'''
  else if rbVigenciaNo.Checked then
    sWhere := sWhere + ' and substr(endo.tb_especial2, 5, 1) = ''N''';

  if rbMovimiento.Checked then
    sWhere := sWhere + ' and tipo.tb_especial1 <> ''1'''
  else if rbEndoso.Checked then
    sWhere := sWhere + ' and tipo.tb_especial1 = ''1''';

  Result := sSql + sWhere + Sortdialog.OrderBy;
end;

end.
