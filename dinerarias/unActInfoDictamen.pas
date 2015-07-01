unit unActInfoDictamen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  SinEdit, ansisql, DateComboBox, ToolEdit, sqlfuncs;

type
  TfrmActInfoDictamen = class(TfrmCustomGridABM)
    gbIDdictamen: TGroupBox;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    ieIdDictamen: TIntEdit;
    chkNoLiquidar: TCheckBox;
    Label1: TLabel;
    deFechaSusp: TDateEdit;
    chkFechaSusp: TCheckBox;
    Label2: TLabel;
    sdqConsultaEV_SINIESTRO: TFloatField;
    sdqConsultaEV_ORDEN: TFloatField;
    sdqConsultaID_ID: TFloatField;
    sdqConsultaID_CUIL: TStringField;
    sdqConsultaID_NOMBRE: TStringField;
    sdqConsultaID_FECHARECEPCION: TDateTimeField;
    sdqConsultaID_FECHAALTA: TDateTimeField;
    sdqConsultaID_USUALTA: TStringField;
    sdqConsultaID_FECHABAJA: TDateTimeField;
    sdqConsultaID_USUBAJA: TStringField;
    sdqConsultaID_FECHACARGADICTA: TDateTimeField;
    sdqConsultaID_FECHAAPRODICTA: TDateTimeField;
    sdqConsultaID_FECHANOAPRODICTA: TDateTimeField;
    sdqConsultaID_FECHALIQUI: TDateTimeField;
    sdqConsultaID_FECHAAPROLIQUI: TDateTimeField;
    sdqConsultaID_FECHAMODIF: TDateTimeField;
    sdqConsultaID_USUMODIF: TStringField;
    sdqConsultaID_IDMOTIVOBAJA: TFloatField;
    sdqConsultaID_CORRESPONDEAPRO: TStringField;
    sdqConsultaID_LIQUIREFERENCIA: TFloatField;
    sdqConsultaID_CORRESPONDELIQUI: TStringField;
    sdqConsultaID_MOTIVONOLIQUI: TStringField;
    sdqConsultaID_FECHASUSPENDIDO: TDateTimeField;
    sdqConsultaID_MOTIVOSUSPENDIDO: TStringField;
    edMotNoLiqui: TMemo;
    edMotSusp: TMemo;
    rgOpciones: TRadioGroup;
    gbFechaRecepcion: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbFechaRecepDesde: TDateComboBox;
    cbFechaRecepHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure fpAbmShow(Sender: TObject);
    procedure chkNoLiquidarClick(Sender: TObject);
    procedure chkFechaSuspClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActInfoDictamen: TfrmActInfoDictamen;

implementation

uses unPrincipal, unCustomConsulta, customdlgs, vclextra;

{$R *.dfm}

procedure TfrmActInfoDictamen.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'sin.sid_informacion_dictamen';
  FieldBaja := 'ID_FECHABAJA';
  ShowActived := false;
end;

procedure TfrmActInfoDictamen.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' SELECT DISTINCT ev_siniestro, ev_orden, SIN.sid_informacion_dictamen.* ' +
          ' FROM art.sev_eventosdetramite, SIN.sid_informacion_dictamen ' +
          ' WHERE id_id = ev_idseg_dictamen ' +
          ' AND id_fechabaja IS NULL ' +
          ' AND ev_evento > 0 ';

  if not edSiniestro.IsEmpty then
    ssql := ssql + ' AND ev_siniestro = ' + sqlint(edSiniestro.Siniestro) +
                   ' AND ev_orden = ' + sqlint(edSiniestro.Orden);

  if not ieIdDictamen.IsEmpty then
    ssql := ssql + ' AND id_id = ' + sqlint(ieIdDictamen.Value);

  if rgOpciones.ItemIndex = 0 then
    ssql := ssql + ' AND id_fechasuspendido is not null ';

  if rgOpciones.ItemIndex = 1 then
    ssql := ssql + ' AND id_correspondeliqui = ''N'' ';

  if not cbFechaRecepDesde.IsEmpty then
    ssql := ssql + ' AND ID_FECHARECEPCION >= ' + SqlDate(cbFechaRecepDesde.Date);

  if not cbFechaRecepHasta.IsEmpty then
    ssql := ssql + ' AND ID_FECHARECEPCION <= ' + SqlDate(cbFechaRecepHasta.Date);

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmActInfoDictamen.tbModificarClick(Sender: TObject);
begin
  if (not sdqConsulta.FieldByName('id_fechaaprodicta').IsNull) and (sdqConsulta.FieldByName('id_fechanoaprodicta').IsNull) and
     (sdqConsulta.FieldByName('id_correspondeliqui').AsString = 'S') then
    inherited
  else
    msgbox('El registro seleccionado no es modificable');
end;

procedure TfrmActInfoDictamen.ClearControls;
begin
  ieIdDictamen.Clear;
  edMotNoLiqui.Clear;
  edMotSusp.Clear;
  deFechaSusp.Clear;
  edSiniestro.Clear;
  chkNoLiquidar.Checked := false;
  chkFechaSusp.Checked := false;
  chkFechaSusp.State := cbUnChecked;
end;

procedure TfrmActInfoDictamen.LoadControls;
begin
  edMotNoLiqui.Text := sdqConsulta.fieldbyname('id_motivonoliqui').AsString;
  edMotSusp.Text := sdqConsulta.fieldbyname('id_motivosuspendido').AsString;
  deFechaSusp.Date := sdqConsulta.fieldbyname('id_fechasuspendido').AsDateTime;
  chkNoLiquidar.Checked := false;
  if sdqConsulta.fieldbyname('id_fechasuspendido').AsString <> '' then
    chkFechaSusp.State := cbGrayed
  else
    chkFechaSusp.State := cbUnChecked;
end;

function TfrmActInfoDictamen.DoABM: Boolean;
begin
  sql.Clear;
  if (modoABM = maModificacion) and (chkNoLiquidar.Checked or chkFechaSusp.Checked) then
  begin
    Sql.PrimaryKey.Add('ID_ID', sdqConsulta.FieldByName('ID_ID').AsString);
    if chkNoLiquidar.Checked then
    begin
      Sql.Fields.Add('id_correspondeliqui', 'N');
      Sql.Fields.Add('id_motivonoliqui', edMotNoLiqui.Text);
    end;
    if chkFechaSusp.Checked then
    begin
      Sql.Fields.Add('id_fechasuspendido', deFechaSusp.Date);
      Sql.Fields.Add('id_motivosuspendido', edMotSusp.Text);
    end;
    Sql.Fields.Add('ID_USUMODIF', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('ID_FECHAMODIF', exDate);
    result := inherited DoABM;
  end
  else
  begin
    result := false;
    fpAbm.ModalResult := mrOK;
  end;
 
end;

function TfrmActInfoDictamen.Validar: Boolean;
begin
  if chkFechaSusp.Checked then
  begin
    verificar((deFechaSusp.text = '') or (deFechaSusp.Date < date), deFechaSusp, 'La fecha de suspensión debe ser mayor a la fecha actual');
    verificar(edMotSusp.Text = '', edMotSusp, 'Debe ingresar el motivo de la suspensión');
  end;
  if chkNoLiquidar.Checked then
    verificar(edMotNoLiqui.Text = '', edMotNoLiqui, 'Debe ingresar el motivo');

  result := true;
end;

procedure TfrmActInfoDictamen.fpAbmShow(Sender: TObject);
begin
  inherited;
  vclextra.lockcontrols([edMotNoLiqui, edMotSusp, deFechaSusp], true);
end;

procedure TfrmActInfoDictamen.chkNoLiquidarClick(Sender: TObject);
begin
  if chkNoLiquidar.Checked then
    vclextra.lockcontrol(edMotNoLiqui, false)
  else
    vclextra.lockcontrol(edMotNoLiqui, true);

end;

procedure TfrmActInfoDictamen.chkFechaSuspClick(Sender: TObject);
begin
  if chkFechaSusp.Checked then
    vclextra.lockcontrols([edMotSusp, deFechaSusp], false)
  else
    vclextra.lockcontrols([edMotSusp, deFechaSusp], true);

end;

procedure TfrmActInfoDictamen.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  rgOpciones.ItemIndex := 2;
  edSiniestro.Clear;
  ieIdDictamen.Clear;
  cbFechaRecepDesde.Clear;
  cbFechaRecepHasta.Clear;
end;

end.
