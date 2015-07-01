unit unPCP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomPanelABM, Data.DB, SDEngine,
  RxPlacemnt, artSeguridad, ShortCutControl, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ExtCtrls, AdvOfficeButtons, unArt, AnsiSql;

type
  TfrmPCP = class(TfrmCustomPanelABM)
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    cboxInstalacionesEdilicias: TGroupBox;
    cboxRiesgoQuimico: TGroupBox;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label2: TLabel;
    Otros: TLabel;
    edInsecticidas: TEdit;
    edRaticidas: TEdit;
    edOtrosQuimicos: TMemo;
    Label1: TLabel;
    Bevel1: TBevel;
    edTareasInteriores: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edTareasExteriores: TEdit;
    cboxRopa: TGroupBox;
    edIndumentaria: TEdit;
    Label7: TLabel;
    edProteccionPersonal: TEdit;
    Label8: TLabel;
    gboxDescripcionTareas: TGroupBox;
    edDescripcionTareas: TMemo;
    gboxRiesgoElectrico: TGroupBox;
    gboxRiesgoIncendio: TGroupBox;
    gboxExtintorDeIncendio: TGroupBox;
    Label9: TLabel;
    edOtrosExtintores: TEdit;
    GroupBox2: TGroupBox;
    edRazonSocial: TEdit;
    Label10: TLabel;
    edFormulario: TEdit;
    Label11: TLabel;
    rbExtintorPortatil: TRadioButton;
    rbExtintorTriclase: TRadioButton;
    rbExtintorDeAgua: TRadioButton;
    edContrato: TEdit;
    lbContrato: TLabel;
    rbProteccionElectricaSi: TRadioButton;
    rbProteccionElectricaNo: TRadioButton;
    Label12: TLabel;
    Label13: TLabel;
    rbExtintorSi: TRadioButton;
    rbExtintorNo: TRadioButton;
    Panel1: TPanel;
    rbInsecticidaSi: TRadioButton;
    rbInsecticidaNo: TRadioButton;
    Label14: TLabel;
    Panel2: TPanel;
    rbBencinaSi: TRadioButton;
    rbBencinaNo: TRadioButton;
    Label15: TLabel;
    Panel3: TPanel;
    rbRaticidaSi: TRadioButton;
    rbRaticidaNo: TRadioButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Panel4: TPanel;
    rbDesinfectanteSi: TRadioButton;
    rbDesinfectanteNo: TRadioButton;
    Panel5: TPanel;
    rbDetergenteSi: TRadioButton;
    rbDetergenteNo: TRadioButton;
    Panel6: TPanel;
    rbSodaCausticaSi: TRadioButton;
    rbSodaCausticaNo: TRadioButton;
    Panel7: TPanel;
    rbDesengrasanteSi: TRadioButton;
    rbDesengrasanteNo: TRadioButton;
    Panel8: TPanel;
    rbHipocloritoDeSodioSi: TRadioButton;
    rbHipocloritoDeSodioNo: TRadioButton;
    Panel9: TPanel;
    rbAmoniacoSi: TRadioButton;
    rbAmoniacoNo: TRadioButton;
    Panel10: TPanel;
    rbAcidoClorhidricoMuriaticoSi: TRadioButton;
    rbAcidoClorhidricoMuriaticoNo: TRadioButton;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel11: TPanel;
    rbProteccionEnLosasSi: TRadioButton;
    rbProteccionEnLosasNo: TRadioButton;
    Panel12: TPanel;
    rbTareasInterioresSi: TRadioButton;
    rbTareasInterioresNo: TRadioButton;
    Panel13: TPanel;
    rbTareasExterioresSi: TRadioButton;
    rbTareasExterioresNo: TRadioButton;
    Panel14: TPanel;
    rbEscalerasConBarandasSi: TRadioButton;
    rbEscalerasConBarandasNo: TRadioButton;
    Label28: TLabel;
    Label29: TLabel;
    Panel15: TPanel;
    rbIndumentariaSi: TRadioButton;
    rbIndumentariaNo: TRadioButton;
    Panel16: TPanel;
    rbProteccionPersonalSi: TRadioButton;
    rbProteccionPersonalNo: TRadioButton;
    procedure FSFormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure FSFormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure rbExtintorNoClick(Sender: TObject);
  private
    { Private declarations }
    FSQL : String;
    FIDRiesgo : Integer;
    FIDSolicitud, FIDFormulario, FContrato : Integer;
    procedure LoadSLQ(const aIdFormulario: TTableId);
  protected
    procedure LoadControls; override;
    procedure ClearControls(ClearPK : Boolean = False); override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
    procedure LoadData(const aIdFormulario: TTableId);
  end;

var
  frmPCP: TfrmPCP;

implementation

uses unDmPrincipal, SqlFuncs, unSesion, General;

{$R *.dfm}

procedure TfrmPCP.btnAceptarClick(Sender: TObject);
begin
  if DoAbm then
    ModalResult := MrOk;
end;


procedure TfrmPCP.btnAplicarClick(Sender: TObject);
begin
  DoAbm;
end;

procedure TfrmPCP.btnCancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;


procedure TfrmPCP.ClearControls(ClearPK: Boolean);
begin
  FIDRiesgo := -1;
  FIDSolicitud := -1;
  FIDFormulario := -1;

  edRazonSocial.Clear;
  edFormulario.Clear;

  edDescripcionTareas.Clear;
 // chkProteccionElectrica.Checked := False;
 // chkExtintor.Checked := False;
  rbExtintorPortatil.Checked := False;
  rbExtintorTriclase.Checked := False;
  rbExtintorDeAgua.Checked := False;
  edOtrosExtintores.Clear;

  //chkInsecticidas.Checked := False;
  edInsecticidas.Clear;
  //chkBencina.Checked := False;
  //chkRaticidas.Checked := False;
  edRaticidas.Clear;
  //chkDesinfectantes.Checked := False;
  //chkDetergentes.Checked := False;
  //chkSodaCaustica.Checked := False;
  //chkDesengrasantes.Checked := False;
  //chkHipocloritoDeSodio.Checked := False;
  //chkAmoniaco.Checked := False;
  //chkAcidoClorhidricoMuriatico.Checked := False;
  edOtrosQuimicos.Clear;

  //chkProteccionEnLosas.Checked := False;
  //chkTareasInteriores.Checked := False;
  edTareasInteriores.Clear;
  //chkTareasExteriores.Checked := False;
  edTareasExteriores.Clear;
  //chkEscalerasConBarandas.Checked := False;

  //chkIndumentaria.Checked := False;
  edIndumentaria.Clear;
  //chkProteccionPersonal.Checked := False;
  edProteccionPersonal.Clear;
end;

function TfrmPCP.DoABM: Boolean;
var
  aSql: TSQL;
  iExtintor: Integer;
begin
  BeginTrans;
  aSql := TSQL.Create('afi.arp_riesgo_pcp');
  try
    try
      if FIDRiesgo = -1 then
      begin
        aSql.SqlType := stInsert;
        aSql.Fields.Add('rp_usualta',   Sesion.UserID);
        aSql.Fields.Add('rp_fechaalta', SQL_DATETIME, False);
      end
      else
      begin
        aSql.SqlType := stUpdate;
        aSql.PrimaryKey.Add('rp_id',         FIDRiesgo);
        aSql.Fields.Add('rp_fechamodif', SQL_DATETIME, False);
        aSql.Fields.Add('rp_usumodif',   Sesion.UserID);
      end;

      aSql.Fields.Add('rp_idsolicitud',     FIdSolicitud, True);
      aSql.Fields.Add('rp_contrato',        FContrato, True);
      aSql.Fields.Add('rp_idformulario',    FIdFormulario);
      aSql.Fields.Add('rp_descripcion',    edDescripcionTareas.Text);
      aSql.Fields.Add('rp_electrico', IIF(rbProteccionElectricaSi.Checked, 'S', 'N'), dtString);
      aSql.Fields.Add('rp_incendio', IIF(rbExtintorSi.Checked, 'S', 'N'), dtString);

      if rbExtintorPortatil.Checked then
        iExtintor := 1
      else
      if rbExtintorTriclase.Checked then
        iExtintor := 2
      else
      if rbExtintorDeAgua.Checked then
        iExtintor := 3
      else
        iExtintor := -1;

      if iExtintor = -1 then
        aSql.Fields.Add('rp_extintor', 'NULL', False)
      else
        aSql.Fields.Add('rp_extintor', iExtintor);

      aSql.Fields.Add('rp_extintor_cual',    edOtrosExtintores.Text);

      aSql.Fields.Add('rp_insecticida', IIF(rbInsecticidaSi.Checked, 'S', 'N'), dtString);
      aSql.Fields.Add('rp_insecticida_cual',    edInsecticidas.Text );
      aSql.Fields.Add('rp_bencina', IIF(rbBencinaSi.Checked , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_raticida', IIF(rbRaticidaSi.Checked  , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_raticida_cual',    edRaticidas.Text);
      aSql.Fields.Add('rp_desinfectantes', IIF(rbDesinfectanteSi.Checked , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_detergentes', IIF(rbDetergenteSi.Checked , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_sodacaustica', IIF(rbSodaCausticaSi.Checked , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_desengrasante', IIF(rbDesengrasanteSi.Checked , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_hipocloritodesodio', IIF(rbHipocloritoDeSodioSi.Checked  , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_amoniaco', IIF(rbAmoniacoSi.Checked  , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_acidomuriatico', IIF(rbAcidoClorhidricoMuriaticoSi.Checked  , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_otroriesgoquimico', edOtrosQuimicos.Text);
      aSql.Fields.Add('rp_proteccionbalcones', IIF(rbProteccionEnLosasSi.Checked  , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_interioraltura', IIF(rbTareasInterioresSi.Checked   , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_interioraltura_cual', edTareasInteriores.Text);
      aSql.Fields.Add('rp_exterioraltura', IIF(rbTareasExterioresSi.Checked   , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_exterioraltura_cual', edTareasExteriores.Text);
      aSql.Fields.Add('rp_escalerabaranda', IIF(rbEscalerasConBarandasSi.Checked    , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_indumentaria', IIF(rbIndumentariaSi.Checked    , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_indumentaria_cual', edIndumentaria.Text );
      aSql.Fields.Add('rp_proteccionpersonal', IIF(rbProteccionPersonalSi.Checked    , 'S', 'N'), dtString);
      aSql.Fields.Add('rp_proteccionpersonal_cual', edProteccionPersonal.Text  );
      EjecutarSqlST(aSql.Sql);
      CommitTrans;
      Result := True;
      ShowMessage('Los datos se han guardado correctamente');
    except
      Rollback;
      ShowMessage('Ha ocurido un error al guardar los datos');
      Result := False;
    end;
  finally
    aSql.Free;
  end;
end;

procedure TfrmPCP.FSFormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  code: Cardinal;
  i: Integer;
  msg: Cardinal;
  n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n:= Mouse.WheelScrollLines;
  for i:= 1 to n do
    ScrollBox1.Perform(msg, code, 0);
  ScrollBox1.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmPCP.FSFormShow(Sender: TObject);
begin
  LockControls(False);
end;

procedure TfrmPCP.LoadControls;
var iExtintor : Integer;
begin
  sdqConsulta.Open;

  if sdqConsulta.FieldByName('sa_id').IsNull then
    FIdSolicitud := 0
  else
    FIdSolicitud  := sdqConsulta.FieldByName('sa_id').AsInteger;

  if sdqConsulta.FieldByName('co_contrato').IsNull then
  begin
    FContrato := 0;
    edContrato.Visible := False;
    lbContrato.Visible := False;
  end
  else
  begin
    FContrato  := sdqConsulta.FieldByName('co_contrato').AsInteger;
    edContrato.Visible := True;
    lbContrato.Visible := True;
  end;

  edContrato.Text := sdqConsulta.FieldByName('co_contrato').AsString;

  FIdFormulario := sdqConsulta.FieldByName('fo_id').AsInteger;

  if sdqConsulta.FieldByName('rp_id').IsNull then
    FIDRiesgo := -1
  else
    FIDRiesgo :=  sdqConsulta.FieldByName('rp_id').AsInteger;

  edRazonSocial.Text := sdqConsulta.FieldByName('nombre').AsString;

  edFormulario.Text :=  sdqConsulta.FieldByName('fo_formulario').AsString;
  edDescripcionTareas.Text               := sdqConsulta.FieldByName('rp_descripcion').AsString;
  if sdqConsulta.FieldByName('rp_electrico').AsString = 'S' then
    rbProteccionElectricaSi.Checked := True
  else
    rbProteccionElectricaNo.Checked := True;

  if sdqConsulta.FieldByName('rp_incendio').AsString = 'S' then
    rbExtintorSi.Checked := True
  else
    rbExtintorNo.Checked := True;

  if sdqConsulta.FieldByName('rp_extintor').IsNull then
    iExtintor := -1
  else
    iExtintor := sdqConsulta.FieldByName('rp_extintor').AsInteger;

  case iExtintor  of
    1: rbExtintorPortatil.Checked := True;
    2: rbExtintorTriclase.Checked := True;
    3: rbExtintorDeAgua.Checked := True;
  end;

  edOtrosExtintores.Text               := sdqConsulta.FieldByName('rp_extintor_cual').AsString;
  if sdqConsulta.FieldByName('rp_insecticida').AsString = 'S' then
    rbInsecticidaSi.Checked := True
  else
    rbInsecticidaNo.Checked := True;

  edInsecticidas.Text                  := sdqConsulta.FieldByName('rp_insecticida_cual').AsString;
  if sdqConsulta.FieldByName('rp_bencina').AsString = 'S' then
    rbBencinaSi.Checked := True
  else
    rbBencinaNo.Checked := True;
  if sdqConsulta.FieldByName('rp_raticida').AsString = 'S' then
    rbRaticidaSi.Checked := True
  else
    rbRaticidaNo.Checked := True;


  edRaticidas.Text                     := sdqConsulta.FieldByName('rp_raticida_cual').AsString;

  if sdqConsulta.FieldByName('rp_desinfectantes').AsString = 'S' then
    rbDesinfectanteSi.Checked := True
  else
    rbDesinfectanteNo.Checked := True;

  if sdqConsulta.FieldByName('rp_detergentes').AsString = 'S' then
    rbDetergenteSi.Checked := True
  else
    rbDetergenteNo.Checked := True;

  if sdqConsulta.FieldByName('rp_sodacaustica').AsString = 'S' then
    rbSodaCausticaSi.Checked := True
  else
    rbSodaCausticaNo.Checked := True;

  if sdqConsulta.FieldByName('rp_desengrasante').AsString = 'S' then
    rbDesengrasanteSi.Checked := True
  else
    rbDesengrasanteNo.Checked := True;

  if sdqConsulta.FieldByName('rp_hipocloritodesodio').AsString = 'S' then
    rbHipocloritoDeSodioSi.Checked := True
  else
    rbHipocloritoDeSodioNo.Checked := True;

  if sdqConsulta.FieldByName('rp_amoniaco').AsString = 'S' then
    rbAmoniacoSi.Checked := True
  else
    rbAmoniacoNo.Checked := True;

  if sdqConsulta.FieldByName('rp_acidomuriatico').AsString = 'S' then
    rbAcidoClorhidricoMuriaticoSi.Checked := True
  else
    rbAcidoClorhidricoMuriaticoNo.Checked := True;

  edOtrosQuimicos.Text                 := sdqConsulta.FieldByName('rp_otroriesgoquimico').AsString;

  if sdqConsulta.FieldByName('rp_proteccionbalcones').AsString = 'S' then
    rbProteccionEnLosasSi.Checked := True
  else
    rbProteccionEnLosasNo.Checked := True;

  if sdqConsulta.FieldByName('rp_interioraltura').AsString = 'S' then
    rbTareasInterioresSi.Checked := True
  else
    rbTareasInterioresNo.Checked := True;
  edTareasInteriores.Text              := sdqConsulta.FieldByName('rp_interioraltura_cual').AsString;

  if sdqConsulta.FieldByName('rp_exterioraltura').AsString = 'S'then
    rbTareasExterioresSi.Checked := True
  else
    rbTareasExterioresNo.Checked := True;

  edTareasExteriores.Text              := sdqConsulta.FieldByName('rp_exterioraltura_cual').AsString;

  if sdqConsulta.FieldByName('rp_escalerabaranda').AsString = 'S' then
    rbEscalerasConBarandasSi.Checked  := True
  else
    rbEscalerasConBarandasNo.Checked  := True;

  if sdqConsulta.FieldByName('rp_indumentaria').AsString = 'S' then
    rbIndumentariaSi.Checked := True
  else
    rbIndumentariaNo.Checked := True;

  edIndumentaria.Text                  := sdqConsulta.FieldByName('rp_indumentaria_cual').AsString;

  if sdqConsulta.FieldByName('rp_proteccionpersonal').AsString = 'S' then
    rbProteccionPersonalSi.Checked := True
  else
    rbProteccionPersonalNo.Checked := True;

  edProteccionPersonal.Text            := sdqConsulta.FieldByName('rp_proteccionpersonal_cual').AsString;

//  ShowMessage(sdqConsulta.FieldByName('sa_nombre').AsString);
  sdqConsulta.Close;
end;

procedure TfrmPCP.LoadData(const aIdFormulario: TTableId);
begin
  ClearControls;
  LoadSLQ(aIdFormulario);
  LoadControls;
end;

procedure TfrmPCP.LoadSLQ(const aIdFormulario: TTableId);
begin
  FSQL :=
      ' SELECT sa_id, rp_id, NVL(sa_nombre, em_nombre) nombre , fo_id, rp_descripcion, rp_electrico, rp_incendio, rp_extintor, rp_extintor_cual, ' +
      '        rp_insecticida, rp_insecticida_cual, rp_bencina, rp_raticida, rp_raticida_cual, rp_desinfectantes, rp_detergentes, ' +
      '        rp_sodacaustica, rp_desengrasante, rp_hipocloritodesodio, rp_amoniaco, rp_acidomuriatico, rp_otroriesgoquimico, ' +
      '        rp_proteccionbalcones, rp_interioraltura, rp_interioraltura_cual, rp_exterioraltura, rp_exterioraltura_cual, ' +
      '        rp_escalerabaranda, rp_indumentaria, rp_indumentaria_cual, rp_proteccionpersonal, rp_proteccionpersonal_cual, co_contrato, ' +
      '        fo_formulario ' +
      '  FROM afo_formulario ' +
      '   LEFT JOIN afi.asa_solicitudafiliacion on fo_id = sa_idformulario ' +
      '   LEFT JOIN afi.arp_riesgo_pcp ON fo_id = rp_idformulario ' +
      '   LEFT JOIN afi.aco_contrato ON fo_id = co_idformulario ' +
      '   LEFT JOIN aem_empresa ON co_idempresa = em_id ' +
      '  WHERE fo_id = ' + SQLValue(aIdFormulario);
  sdqConsulta.SQL.Text := FSQL;
end;

procedure TfrmPCP.rbExtintorNoClick(Sender: TObject);
begin
  if rbExtintorNo.Checked then
  begin
    rbExtintorPortatil.Checked := False;
    rbExtintorTriclase.Checked := False;
    rbExtintorDeAgua.Checked := False;
  end;
end;

procedure TfrmPCP.tbLimpiarClick(Sender: TObject);
begin
  ClearControls;
end;

end.
