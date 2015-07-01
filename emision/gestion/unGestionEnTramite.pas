unit unGestionEnTramite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvWizardRouteMapList, JvWizardRouteMapSteps, JvWizard,
  JvWizardRouteMapNodes, JvExControls, JvComponent, unCustomForm, RXCtrls,
  StdCtrls, CheckLst, ARTCheckListBox, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, JvExComCtrls, JvComCtrls, ToolWin,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unSesion,
  FormPanel, unComunesGestion, Mask, PatternEdit, IntEdit, ExtCtrls,
  Printers, unComunes, JvProgressBar, ValEdit, Buttons, FolderDialog;

type
  TInfoGestion = class
  private
    FIdDetalle: integer;
    FIdGestionable: integer;
    FObligatorio: boolean;
    FTipoDetalle: String;
    FSalida: integer;
    FMailSalida: String;
  public
    property IdGestionable: integer read FIdGestionable write FIdGestionable;
    property Obligatorio: boolean read FObligatorio write FObligatorio;
    property IdDetalle: integer read FIdDetalle write FIdDetalle;
    property TipoDetalle: String read FTipoDetalle write FTipoDetalle;
    property Salida: integer read FSalida write FSalida;
    property MailSalida: String read FMailSalida write FMailSalida;
    constructor Create(aIdGestionable: Integer; aObligatorio: boolean; aIdDetalle: Integer; aTipoDetalle: String; aSalida: integer; aMailSalida: String); overload;
  end;

  TfrmGestionEnTramite = class(TfrmCustomForm)
    JvWizard: TJvWizard;
    pgSeleccionarGestion: TJvWizardInteriorPage;
    pgFinalizarGestion: TJvWizardInteriorPage;
    JvWizardRouteMapList: TJvWizardRouteMapList;
    gbSalidas: TGroupBox;
    chkSalidas: TARTCheckListBox;
    gbAntecedentes: TGroupBox;
    lblAntecedentes: TListBox;
    gbItemsGestionables: TGroupBox;
    chkGestionables: TARTCheckListBox;
    pcDetalleGestion: TJvPageControl;
    tbDemo: TTabSheet;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    tbLimpiar: TToolButton;
    tbAplicarRegistro: TToolButton;
    tbAplicarGrilla: TToolButton;
    tbAplicarGestion: TToolButton;
    GroupBox1: TGroupBox;
    fraResultado: TfraCodigoDescripcion;
    edObservacion: TMemo;
    fpMailSalida: TFormPanel;
    btnAceptarMailContacto: TButton;
    btnCancelarMailContacto: TButton;
    chkMailContrato: TCheckBox;
    chkMailEmision: TCheckBox;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    cmbImpresoras: TComboBox;
    BarProgreso: TJvProgressBar;
    fpParametros: TFormPanel;
    btnAceptarParametro: TButton;
    btnCancelarParametro: TButton;
    ParamList: TValueListEditor;
    btnDefinirParametros: TSpeedButton;
    folderDialog: TFolderDialog;
    fraContactoSelected: TfraCodigoDescripcion;
    lblContacto: TLabel;
    tbContacto: TToolButton;
    ToolButton1: TToolButton;
    btnPegar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure JvWizardActivePageChanging(Sender: TObject;
      var ToPage: TJvWizardCustomPage);
    procedure FormDestroy(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAplicarRegistroClick(Sender: TObject);
    procedure JvWizardCancelButtonClick(Sender: TObject);
    procedure JvWizardFinishButtonClick(Sender: TObject);
    procedure tbAplicarGrillaClick(Sender: TObject);
    procedure tbAplicarGestionClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure chkGestionablesClick(Sender: TObject);
    procedure chkSalidasClickCheck(Sender: TObject);
    procedure btnAceptarMailContactoClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure btnDefinirParametrosClick(Sender: TObject);
    procedure CargarParametros;
    procedure tbContactoClick(Sender: TObject);
    procedure fraContactoSelectedcmbDescripcionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPegarClick(Sender: TObject);
  private
    FContrato: integer;
    FNroGestion: integer;
    InfoExtraSalida: TInfoExtraSalida;
    FVerificoParametros: Boolean;
    procedure CargarFinalizarGestion;
    function ValidarPasarAFinalizarGestion: boolean;
    function ValidarFinalizar: boolean;
    function FaltanResultados: boolean;
    procedure GetSalidaGestionable(aIdDetalleGestion: integer; var aSalida: integer; var aMailNotificacion: String);
    procedure CargarSeleccionarGestion;
    procedure ActivarResultado(aActivar: boolean);
    procedure RegistrarResultado(aIdDetalleGestion, aIdResultado, aIdEstado, diasaincrementar: integer; aObservacion: String);
    procedure CargarSalida;
    procedure ProcesarSalidas;
    procedure CargarImpresoras;
    function ExistsSalidaImpresion: boolean;
    function ExistsSalidaVentanilla: boolean;
    function ExistsSalidaChecked(aSalida: integer): boolean;
    function ValidarRegistrarResultado: boolean;

  public
    procedure CargarFormulario(aContrato: integer);
  end;

var
  frmGestionEnTramite: TfrmGestionEnTramite;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, unConstEmision, General, unFraDetalleGestion, VclExtra, CustomDlgs, unFuncionesEmision,
  unContratoContactoEmi, unContratoContacto, Clipbrd;

{$R *.dfm}

procedure TfrmGestionEnTramite.CargarFinalizarGestion;
var
  i, j: integer;
  auxTabSheet:  TTabSheet;
begin
  ActivarResultado(false);

  LockControl(chkGestionables, true);

  for i:= pcDetalleGestion.PageCount -1 downto 0 do
    pcDetalleGestion.Pages[i].Free;

  j := 0;
  for i:= 0 to chkGestionables.Items.Count-1 do
  begin
    if chkGestionables.Checked[i] then
    begin
      auxTabSheet := TTabSheet.Create(pcDetalleGestion);
      with auxTabSheet do
      begin
        Name := 'tabsheet_' + IntToStr(i);
        Parent := pcDetalleGestion;
        PageControl := pcDetalleGestion;
        Caption := StringReplace(chkGestionables.Items[i], ' (Obligatorio)', '', [rfIgnoreCase]);
        PageIndex := pcDetalleGestion.PageCount-1;
      end;
      with TfraDetalleGestion.Create(auxTabSheet) do
      begin
        CargarGestion(TInfoGestion(chkGestionables.Items.Objects[i]).IdDetalle, TInfoGestion(chkGestionables.Items.Objects[i]).IdGestionable, TInfoGestion(chkGestionables.Items.Objects[i]).TipoDetalle);
        Parent := auxTabSheet;
        Align := alClient;
        Name := 'fraDetalleGestion_' + IntToStr(j);
      end;
      j := j + 1; 
    end;
  end;
end;

procedure TfrmGestionEnTramite.CargarFormulario(aContrato: integer);
var
  sSql: String;
begin
  FContrato := aContrato;

  sSql  := ' SELECT distinct ds_id, dg_idgestionable, ge_descripcion, nvl(ge_obligatorio, ''N'') obliga, ' +
           '        dg_salidagestion, dg_mailnotificacion, ge_tipodetallegestion ' +
           ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
           '      art.use_usuarios, emi.isl_sublote sublote, emi.ilo_lote ' +
           ' WHERE sublote.sl_idlote = lo_id ' +
           '   AND se_id = sl_idusuariogestion ' +
           '   AND ds_idsublote = sublote.sl_id ' +
           '   AND dg_iddetallesublote = ds_id ' +
           '   AND ge_id = dg_idgestionable ' +
           '   AND sublote.sl_fechabaja is null ' +
           '   AND ds_fechabaja is null ' +
           '   AND dg_fechabaja is null ' +
           '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
           '   AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
           '   AND ds_contrato = ' + SqlValue(aContrato);

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
//      if (chkGestionables.Items.Count = 0) or (chkGestionables.Items.IndexOfObject(TObject(FieldByName('dg_idgestionable').AsInteger)) < 0) then
//      begin
      chkGestionables.Items.AddObject(FieldByName('ge_descripcion').AsString + iif(FieldByName('obliga').AsString = 'S', ' (Obligatorio)', ''),
                                      TInfoGestion.Create(FieldByName('dg_idgestionable').AsInteger, (FieldByName('obliga').AsString = 'S'),
                                                          FieldByName('ds_id').AsInteger, FieldByName('ge_tipodetallegestion').AsString,
                                                          FieldByName('dg_salidagestion').AsInteger, FieldByName('dg_mailnotificacion').AsString));
      chkGestionables.Checked[chkGestionables.Items.Count-1] := true;
      chkGestionables.ItemEnabled[chkGestionables.Items.Count-1] := (FieldByName('obliga').AsString = 'N');

//      end;
//      chkSalidas.Check(FieldByName('sl_idsubaccion').AsString);
      Next;
    end;
  finally
    free;
  end;
  chkGestionables.ItemIndex := 0;
  chkGestionablesClick(Self);

  with fraContactoSelected do
  begin
    TableName := 'afi.act_contacto';
    FieldID := 'ct_id';
    FieldCodigo := 'ct_id';
    FieldDesc := 'ct_contacto';
    FieldBaja := 'ct_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' and ct_idempresa in (select co_idempresa from afi.aco_contrato where co_contrato =' + SqlValue(FContrato)  + ')';
  end;
end;

procedure TfrmGestionEnTramite.CargarSeleccionarGestion;
begin
  LockControl(chkGestionables, false);
end;

procedure TfrmGestionEnTramite.FormCreate(Sender: TObject);
begin
  chkSalidas.SQL := 'SELECT MN_DESCRIPCION, MN_ID FROM COMUNES.CMN_MODONOTIFICACION ORDER BY MN_PRIORIDADDEFECTO';
  with fraResultado do
  begin
    TableName := 'emi.irg_resultadogestion';
    FieldID := 'rg_id';
    FieldCodigo := 'rg_codigo';
    FieldDesc := 'rg_descripcion';
    FieldBaja := 'rg_fechabaja';
    ExtraFields := ', rg_idestadoaaplicar, rg_diasaincrementar ';
    ShowBajas := false;
  end;
end;

function TfrmGestionEnTramite.ValidarPasarAFinalizarGestion: boolean;
var
  i: integer;
begin
  result := true;
  if (chkGestionables.CheckCount = 0) then
  begin
    InvalidMsg(chkGestionables, 'Debe seleccionar un ítem de gestión.');
    result := false;
  end;
//  Verificar(not FVerificoParametros and (ParamList.Strings.Count > 0), btnDefinirParametros, 'Debe verificar los parámetros de salida.');

  if not FVerificoParametros then
  begin
    for i:=0 to ParamList.Strings.Count-1 do
      if  trim(Copy(ParamList.Strings[i],
               Pos('=', ParamList.Strings[i])-1,
               1)) = 'S' then
        Verificar(true, btnDefinirParametros, 'Existen parámetros obligatorios en la gestión, que al menos debe verificar.');
  end;

  if ParamList.Enabled then
    for i:=0 to ParamList.Strings.Count-1 do
      if  trim(Copy(ParamList.Strings[i],
               Pos('=', ParamList.Strings[i])+1,
               Length(ParamList.Strings[i])-Pos('=', ParamList.Strings[i])+1)) = '' then
        Verificar(true, btnDefinirParametros, 'Debe definir todos los parámetros.');

  for i:= 0 to chkGestionables.Items.Count-1 do
    if chkGestionables.Checked[i] then
    begin
       if (get_tipocontacto(TInfoGestion(chkGestionables.Items.Objects[i]).Salida) = TIPO_CONTACTO_MAIL) then
       begin
         Verificar((TInfoGestion(chkGestionables.Items.Objects[i]).MailSalida = 'C') and (get_mailcontrato(FContrato)= ''), chkSalidas, 'Esta empresa no tiene email corporativo.');
         Verificar((TInfoGestion(chkGestionables.Items.Objects[i]).MailSalida = 'E') and (not ExisteMailContacto(FContrato)), chkSalidas, 'Esta empresa no tiene un contacto con email.');
         Verificar((TInfoGestion(chkGestionables.Items.Objects[i]).MailSalida = 'A') and (get_mailcontrato(FContrato)= '') and (get_mailcontrato(FContrato)= ''), chkSalidas, 'Esta empresa no tiene email corporativo.');
       end;
    end;
end;

procedure TfrmGestionEnTramite.JvWizardActivePageChanging(Sender: TObject;
  var ToPage: TJvWizardCustomPage);
begin
  inherited;
  if (JvWizard.ActivePageIndex <> -1) then
  begin
    if ToPage.Name = 'pgFinalizarGestion' then
    begin
      if not ValidarPasarAFinalizarGestion then
        ToPage := JvWizard.ActivePage
      else
        CargarFinalizarGestion
    end
    else begin
      if ToPage.Name = 'pgSeleccionarGestion' then
        CargarSeleccionarGestion;
    end;
  end;
end;

{ TInfoGestion }

constructor TInfoGestion.Create(aIdGestionable: Integer;
  aObligatorio: boolean; aIdDetalle: Integer; aTipoDetalle: String;
  aSalida: integer; aMailSalida: String);
begin
  inherited Create;
  FIdGestionable := aIdGestionable;
  FObligatorio := aObligatorio;
  FIdDetalle := aIdDetalle;
  FTipoDetalle := aTipoDetalle;
  FSalida := aSalida;
  FMailSalida := aMailSalida;
end;

procedure TfrmGestionEnTramite.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to chkGestionables.Items.Count-1 do
    chkGestionables.Items.Objects[i].Free;
  inherited;
end;

procedure TfrmGestionEnTramite.ActivarResultado(aActivar: boolean);
begin
  fraResultado.Clear;
  edObservacion.Clear;

  fraResultado.Locked := not aActivar;
  LockControl(edObservacion, not aActivar);
  fraContactoSelected.Locked := not aActivar;

  if not fraContactoSelected.Locked then
    fraContactoSelected.Locked := not ExistsSalidaChecked(CONTACTO_TELEFONICO);

  tbAplicarRegistro.Enabled := aActivar;
  tbAplicarGrilla.Enabled := aActivar;
  tbAplicarGestion.Enabled := aActivar;
  tbLimpiar.Enabled := aActivar;

  tbNuevo.Enabled := not aActivar;
  tbModificar.Enabled := not aActivar;
  tbEliminar.Enabled := not aActivar;
  if aActivar then
    fraResultado.edCodigo.SetFocus;
end;

procedure TfrmGestionEnTramite.tbNuevoClick(Sender: TObject);
begin
  inherited;
  ActivarResultado(true);
end;

procedure TfrmGestionEnTramite.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  ActivarResultado(false);
  fraContactoSelected.Clear;
end;

procedure TfrmGestionEnTramite.RegistrarResultado(aIdDetalleGestion,
  aIdResultado, aIdEstado, diasaincrementar: integer; aObservacion: String);
var
  Salida: integer;
  MailNotificacion: String;
begin
  GetSalidaGestionable(aIdDetalleGestion, Salida, MailNotificacion);
  if aIdResultado <> 0 then
  begin
    if (FNroGestion = 0) and (diasaincrementar <= 0) then
      FNroGestion := GetSecNextVal('emi.seq_idg_gestion');
    EjecutarSqlSTEx(' UPDATE emi.idg_detallesubloteengestion ' +
                   '  SET dg_idresultadogestion = :idresultado, ' +
                   '      dg_idestadogestion = :idestado, ' +
                   '      dg_observacion = :observacion, ' +
                   '      dg_fechagestion = SYSDATE, ' +
                   '      dg_usuariogestion = :usugestion, ' +
                   '      dg_fechamodif = SYSDATE, ' +
                   '      dg_salidagestion = :salida, ' +
                   '      dg_mailnotificacion = :mailnotif, ' +
                   '      dg_idcontacto = ' + SqlInt(integer(iif(ExistsSalidaChecked(CONTACTO_TELEFONICO), fraContactoSelected.Value, 0)), true) + ', ' +
                          iif(diasaincrementar <> 0,
                              ' dg_fechaagendado = art.actualdate + ' + SqlValue(diasaincrementar) + ', dg_numerogestion = null, ',
                              ' dg_fechaagendado = null, dg_numerogestion = ' + SqlValue(FNroGestion) +  ', ')  +
                   '      dg_usumodif = :usumodif ' +
                   ' WHERE dg_id = :iddetalle ', [aIdResultado, aIdEstado, aObservacion,
                                                  Sesion.LoginName, Salida, MailNotificacion,
                                                  Sesion.LoginName, aIdDetalleGestion])
  end
  else
    EjecutarSqlSTEx(' UPDATE emi.idg_detallesubloteengestion ' +
                   '  SET dg_idresultadogestion = null, ' +
                   '      dg_idestadogestion = 1, ' +
                   '      dg_numerogestion = null, ' +
                   '      dg_observacion = null, ' +
                   '      dg_idcontacto = null, ' +
                   '      dg_fechagestion = null, ' +
                   '      dg_usuariogestion = null, ' +
                   '      dg_fechaagendado = null, ' +
                   '      dg_fechamodif = null, ' +
                   '      dg_usumodif = null ' +
                   ' WHERE dg_id = :iddetalle ', [aIdDetalleGestion])

end;

procedure TfrmGestionEnTramite.tbAplicarRegistroClick(Sender: TObject);
var
  fraDetalleGestion: TfraDetalleGestion;
begin
  inherited;
  if ValidarRegistrarResultado then
  begin
    fraDetalleGestion := TfraDetalleGestion(pcDetalleGestion.ActivePage.FindChildControl('fraDetalleGestion_' +  IntToStr(pcDetalleGestion.ActivePageIndex)));
    if fraResultado.Value <> 0 then
      RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, fraResultado.Value, fraResultado.sdqDatos.FieldByName('rg_idestadoaaplicar').AsInteger, fraResultado.sdqDatos.FieldByName('rg_diasaincrementar').AsInteger, edObservacion.Text)
    else
      RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, 0,  0, 0, '');
    fraDetalleGestion.sdqDatos.Refresh;
    DynColWidthsByData(fraDetalleGestion.dbgDetalle);
    ActivarResultado(false);
  end;
end;

procedure TfrmGestionEnTramite.JvWizardCancelButtonClick(Sender: TObject);
begin
  inherited;
  RollBackUpdates;
  ModalResult := mrCancel;
end;

procedure TfrmGestionEnTramite.JvWizardFinishButtonClick(Sender: TObject);
begin
  inherited;
  if ValidarFinalizar then
  begin
    CargarImpresoras;
    GuardarParametros(FNroGestion, ParamList);
    if (ExisteGestionFinalizada(FNroGestion)) and ((not ExistsSalidaImpresion) or (fpOpcionesImpresion.ShowModal = mrOk)) then
    begin
      if (not ExistsSalidaVentanilla) or (folderDialog.Execute) then
        InfoExtraSalida.PathPdf := folderDialog.Directory;
      ProcesarSalidas;
      BeginTrans(true);
      CommitTrans(true);
      ModalResult := mrOk;
    end
    else begin
      if not (ExisteGestionFinalizada(FNroGestion)) then
      begin
        BeginTrans(true);
        CommitTrans(true);
        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TfrmGestionEnTramite.tbAplicarGrillaClick(Sender: TObject);
var
  fraDetalleGestion: TfraDetalleGestion;
begin
  inherited;
  if ValidarRegistrarResultado then
  begin
    fraDetalleGestion := TfraDetalleGestion(pcDetalleGestion.ActivePage.FindChildControl('fraDetalleGestion_' +  IntToStr(pcDetalleGestion.ActivePageIndex)));
    fraDetalleGestion.sdqDatos.First;
    while not fraDetalleGestion.sdqDatos.Eof do
    begin
      if fraResultado.Value <> 0 then
        RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, fraResultado.Value, fraResultado.sdqDatos.FieldByName('rg_idestadoaaplicar').AsInteger, fraResultado.sdqDatos.FieldByName('rg_diasaincrementar').AsInteger, edObservacion.Text)
      else
        RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, 0,  0, 0, '');
      fraDetalleGestion.sdqDatos.Next;
    end;
    fraDetalleGestion.sdqDatos.Refresh;
    DynColWidthsByData(fraDetalleGestion.dbgDetalle);
    ActivarResultado(false);
  end;
end;

procedure TfrmGestionEnTramite.tbAplicarGestionClick(Sender: TObject);
var
  fraDetalleGestion: TfraDetalleGestion;
  i: integer;
begin
  inherited;
  if ValidarRegistrarResultado then
  begin
    for i:=0 to pcDetalleGestion.PageCount-1 do
    begin
      fraDetalleGestion := TfraDetalleGestion(pcDetalleGestion.Pages[i].FindChildControl('fraDetalleGestion_' +  IntToStr(i)));
      fraDetalleGestion.sdqDatos.First;
      while not fraDetalleGestion.sdqDatos.Eof do
      begin
        if fraResultado.Value <> 0 then
          RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, fraResultado.Value, fraResultado.sdqDatos.FieldByName('rg_idestadoaaplicar').AsInteger, fraResultado.sdqDatos.FieldByName('rg_diasaincrementar').AsInteger, edObservacion.Text)
        else
          RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, 0,  0, 0, '');
        fraDetalleGestion.sdqDatos.Next;
      end;
      fraDetalleGestion.sdqDatos.Refresh;
      DynColWidthsByData(fraDetalleGestion.dbgDetalle);
    end;
    ActivarResultado(false);
  end;
end;

procedure TfrmGestionEnTramite.tbEliminarClick(Sender: TObject);
var
  fraDetalleGestion: TfraDetalleGestion;
begin
  inherited;
  fraDetalleGestion := TfraDetalleGestion(pcDetalleGestion.ActivePage.FindChildControl('fraDetalleGestion_' +  IntToStr(pcDetalleGestion.ActivePageIndex)));
  if fraResultado.Value <> 0 then
    RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, fraResultado.Value, fraResultado.sdqDatos.FieldByName('rg_idestadoaaplicar').AsInteger, fraResultado.sdqDatos.FieldByName('rg_diasaincrementar').AsInteger, edObservacion.Text)
  else
    RegistrarResultado(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, 0,  0, 0, '');
  fraDetalleGestion.sdqDatos.Refresh;
  DynColWidthsByData(fraDetalleGestion.dbgDetalle);
end;

function TfrmGestionEnTramite.ValidarFinalizar: boolean;
begin
  Verificar(not fraResultado.Locked, fraResultado, 'Debe tomar alguna decisión con el resultado.');
  Verificar(FaltanResultados, pcDetalleGestion, 'Todas las gestiones deben tener un resultado.');
  result := true;
end;

function TfrmGestionEnTramite.FaltanResultados: boolean;
var
  i: integer;
  sSql, sIn: String;
begin
  sIn := '';
  sSql  := ' SELECT 1 ' +
           ' FROM emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
           '      art.use_usuarios, emi.isl_sublote sublote, emi.isl_subaccionlote subaccion, emi.ilo_lote ' +
           ' WHERE sublote.sl_idlote = lo_id ' +
           '   AND se_id = sl_idusuariogestion ' +
           '   AND ds_idsublote = sublote.sl_id ' +
           '   AND dg_iddetallesublote = ds_id ' +
           '   AND lo_id = subaccion.sl_idlote ' +
           '   AND sublote.sl_fechabaja is null ' +
           '   AND ds_fechabaja is null ' +
           '   AND dg_fechabaja is null ' +
           '   AND dg_idresultadogestion is null ' ;
//           '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
//           '   AND dg_idestadogestion = ' + SqlValue(GESTION_PENDIENTE) +
//           '   AND ds_contrato = ' + SqlValue(FContrato);

  for i:= 0 to chkGestionables.Items.Count-1 do
    if chkGestionables.Checked[i] then
    begin
      if (sIn <> '') then
        sIn := sIn + ', ';
      sIn := sIn + inttostr(TInfoGestion(chkGestionables.Items.Objects[i]).IdDetalle);
    end;

  result := ExisteSql(sSql + ' AND ds_id IN (' +  sIn + ')');
end;

procedure TfrmGestionEnTramite.chkGestionablesClick(Sender: TObject);
begin
  CargarSalida;
end;

procedure TfrmGestionEnTramite.CargarSalida;
begin
  chkSalidas.UncheckAll;
  chkSalidas.Check(IntToStr(TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida));
//  if chkSalidas.Checked[2] then
  if get_tipocontacto(TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida) = TIPO_CONTACTO_MAIL then
  begin
    if (TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'A') then
      gbSalidas.Caption := '         Salida por Gestionable - (Mail Contrato-Emisión)'
    else begin
      if (TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'C') then
        gbSalidas.Caption := '         Salida por Gestionable - (Mail Contrato)'
      else begin
        if (TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'E') then
          gbSalidas.Caption := '         Salida por Gestionable - (Mail Emisión)'
        else
          gbSalidas.Caption := '         Salida por Gestionable';
      end;
    end;
  end
  else
    gbSalidas.Caption := '         Salida por Gestionable';
  CargarParametros;
end;

procedure TfrmGestionEnTramite.chkSalidasClickCheck(Sender: TObject);
begin
  if chkSalidas.CheckCount = 0 then
  begin
    InvalidMsg(chkSalidas, 'Debe seleccionar una salida para la gestión.');
    chkSalidas.Checked[TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida-1] := true;
  end
  else begin
    if TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida <> -1 then
      chkSalidas.Checked[TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida-1] := false;

    if not ExisteSalida(TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).IdGestionable,
                               StrToInt(chkSalidas.CheckedValues[0])) then
    begin
      TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida := -1;
      TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := '';
      chkSalidas.UncheckAll;
      Verificar(true, chkSalidas, 'Este ítem de gestión no tiene un modo de notificación.');
    end;

    if (chkSalidas.ValuesChecked.Count = 1) then
    begin
      TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida := StrToInt(chkSalidas.ValuesChecked[0]);
//      if chkSalidas.Checked[2] then
      if get_tipocontacto(TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida) = TIPO_CONTACTO_MAIL then
      begin
        if (fpMailSalida.ShowModal = mrOk) then
        begin
          if chkMailContrato.Checked and chkMailEmision.Checked then
          begin
            gbSalidas.Caption := '         Salida por Gestionable - (Mail Contrato-Emisión)';
            TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'A';
          end
          else begin
            if chkMailContrato.Checked then
            begin
              gbSalidas.Caption := '         Salida por Gestionable - (Mail Contrato)';
              TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'C';
            end
            else begin
              gbSalidas.Caption := '         Salida por Gestionable - (Mail Emisión)';
              TInfoGestion(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'E';
            end;
          end;
        end
        else begin
//          chkSalidas.Checked[2] := false;
          chkSalidas.UncheckAll;
          gbSalidas.Caption := '         Salida por Gestionable';
        end;
      end
      (*
      else begin
        chkMailContrato.Checked := false;
        chkMailEmision.Checked := false;
//        chkSalidas.Checked[2] := false;
        chkSalidas.UncheckAll;
        gbSalidas.Caption := '         Salida por Gestionable';
      end;
      *)
    end;
  end;
  CargarParametros;
end;


procedure TfrmGestionEnTramite.GetSalidaGestionable(
  aIdDetalleGestion: integer; var aSalida: integer;
  var aMailNotificacion: String);
var
  i: integer;
  idDetalle: integer;
begin
  aSalida := 0;
  aMailNotificacion := '';
  idDetalle := ValorSqlEx('select dg_iddetallesublote from emi.idg_detallesubloteengestion where dg_id = :iddetalle', [aIdDetalleGestion]);
  i := 0;
  while  (i <= chkGestionables.Items.Count-1) and (TInfoGestion(chkGestionables.Items.Objects[i]).IdDetalle <> idDetalle) do
    inc(i);
  if (i <= chkGestionables.Items.Count-1) then
  begin
    aSalida := TInfoGestion(chkGestionables.Items.Objects[i]).Salida;
    aMailNotificacion := TInfoGestion(chkGestionables.Items.Objects[i]).MailSalida;
  end
  else begin
    aSalida := -1;
    aMailNotificacion := '';
  end;
end;

procedure TfrmGestionEnTramite.btnAceptarMailContactoClick(
  Sender: TObject);
begin
  Verificar(not (chkMailContrato.Checked or chkMailEmision.Checked), chkMailContrato, 'Debe seleccionar el tipo de email de salida.');
  Verificar(chkMailContrato.Checked and (get_mailcontrato(FContrato)= ''), chkMailContrato, 'Esta empresa no tiene email corporativo.');
  Verificar(chkMailEmision.Checked and (not ExisteMailContacto(FContrato)), chkMailEmision, 'Esta empresa no tiene un contacto con email.');
  fpMailSalida.ModalResult := mrOk;
end;

procedure TfrmGestionEnTramite.ProcesarSalidas;
var
  fraDetalleGestion: TfraDetalleGestion;
  i: integer;
  Salida, IdEvento: integer;
  MailNotificacion: String;
  bGenerarEventoMasivo: Boolean;
begin
  BarProgreso.Visible := True;
  bGenerarEventoMasivo := True;
  BarProgreso.Position := 0;
  BarProgreso.Max := pcDetalleGestion.PageCount;
  self.FormStyle := fsNormal;

  Application.ProcessMessages;

  for i:=0 to pcDetalleGestion.PageCount-1 do
  begin
    fraDetalleGestion := TfraDetalleGestion(pcDetalleGestion.Pages[i].FindChildControl('fraDetalleGestion_' +  IntToStr(i)));
    fraDetalleGestion.sdqDatos.First;
    while not fraDetalleGestion.sdqDatos.Eof do
    begin
      if not fraDetalleGestion.sdqDatos.FieldByName('dg_numerogestion').IsNull then
      begin
        GetSalidaGestionable(fraDetalleGestion.sdqDatos.FieldByName('Iddetalle').AsInteger, Salida, MailNotificacion);
        ProcesarSalidaGestion(FContrato, FNroGestion, fraDetalleGestion.IdGestionable, Salida, MailNotificacion, InfoExtraSalida, fraDetalleGestion.IdContacto, bGenerarEventoMasivo, IdEvento);
        Break;
      end;
      BarProgreso.StepIt;
      fraDetalleGestion.sdqDatos.Next;
      Application.ProcessMessages;
    end;
  end;
  BarProgreso.Visible := false;
  self.FormStyle := fsMDIChild;
  Application.ProcessMessages;
end;

procedure TfrmGestionEnTramite.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmGestionEnTramite.btnAceptarImpresionClick(Sender: TObject);
begin
  inherited;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  if rbPreview.Checked then
    InfoExtraSalida.SalidaReporte := srPreview
  else
    InfoExtraSalida.SalidaReporte := srPrint;
  InfoExtraSalida.Copias := edCantCopias.Value;
end;

function TfrmGestionEnTramite.ExistsSalidaImpresion: boolean;
var
  i: integer;
  tiposalida: string;
begin
  result := false;
  for i:= 0 to chkGestionables.Items.Count-1 do
    if chkGestionables.Checked[i] then
      with TInfoGestion(chkGestionables.Items.Objects[i]) do
      begin
        tiposalida := get_tipocontacto(Salida);
        if (tiposalida = TIPO_CONTACTO_FAX) or (tiposalida = TIPO_CONTACTO_CORREO) or (tiposalida = TIPO_CONTACTO_FAX) or (tiposalida = TIPO_CONTACTO_PERSONAL) then
        begin
          result:= true;
          break;
        end;
      end;
end;

procedure TfrmGestionEnTramite.btnDefinirParametrosClick(Sender: TObject);
begin
  HideAllBalloons;
  FVerificoParametros := true;
  fpParametros.ShowModal;
end;

procedure TfrmGestionEnTramite.CargarParametros;
var
  i: integer;
  idLote: integer;
begin
  FVerificoParametros := false;
  ParamList.Strings.Clear;
  if (chkGestionables.ItemsChecked.Text <> '') then
  begin
    for i:=0 to chkGestionables.Count-1 do
    if chkGestionables.Checked[i] then
    begin
      idLote := ValorSqlInteger(' SELECT sl_idlote ' +
                                  ' FROM emi.ids_detallesublote, emi.isl_sublote ' +
                                  ' WHERE ds_idsublote = sl_id ' +
                                  ' AND ds_id = ' + SqlValue(TInfoGestion(chkGestionables.Items.Objects[i]).IdDetalle));
      with GetQuery(' SELECT cp_id, cp_nombre || ''                                                                       '' || cp_obligatorio  cp_nombre, ' +
                    '        cp_tipo, cp_obligatorio, cp_valordefecto, pl_valor, pl_idlote ' +
                    '  FROM  emi.ipl_parametrolote, comunes.ccp_cartaparametro, comunes.cta_textoarea, comunes.ctc_textocarta, emi.igs_gestionablesalida ' +
                    ' WHERE tc_id = gs_idcartatexto ' +
                    '   AND tc_id = ta_idtextocarta ' +
                    '   AND cp_idtextocarta = tc_id ' +
                    '   AND cp_nombre = pl_parametro(+) ' +
                    '   AND pl_idlote(+) = ' + SqlValue(idLote) +
                    '   AND cp_fechabaja IS NULL ' +
                    '   AND ta_fechabaja IS NULL ' +
                    '   AND gs_idmodonotificacion = ' + SqlValue(TInfoGestion(chkGestionables.Items.Objects[i]).Salida) +
                    '   AND gs_idgestionable = ' + SqlValue(TInfoGestion(chkGestionables.Items.Objects[i]).IdGestionable) +
                    ' UNION ALL ' +
                    ' SELECT mp_id, mp_nombre || ''                                                                       '' || mp_obligatorio  mp_nombre, ' +
                    '        mp_tipo, mp_obligatorio, mp_valordefecto, pl_valor, pl_idlote ' +
                    '  FROM  emi.ipl_parametrolote, emi.imp_mailparametro, emi.igs_gestionablesalida ' +
                    ' WHERE mp_idgestionable = gs_idgestionable ' +
                    '   AND gs_idcartatexto IS NULL ' +
                    '   AND mp_fechabaja IS NULL ' +
                    '   AND mp_nombre = pl_parametro(+) ' +
                    '   AND mp_idmodonotificacion = gs_idmodonotificacion ' +
                    '   AND pl_idlote(+) = ' + SqlValue(idLote) +
                    '   AND gs_idmodonotificacion = ' + SqlValue(TInfoGestion(chkGestionables.Items.Objects[i]).Salida) +
                    '   AND mp_idgestionable = ' + SqlValue(TInfoGestion(chkGestionables.Items.Objects[i]).IdGestionable)) do
      try
        while not Eof do
        begin
          if fieldbyname('pl_idlote').IsNull then
            ParamList.InsertRow(fieldbyname('cp_nombre').AsString, fieldbyname('cp_valordefecto').AsString, true)
          else
            ParamList.InsertRow(fieldbyname('cp_nombre').AsString, fieldbyname('pl_valor').AsString, true);
          Next;
        end;
      finally
        Free;
      end;
    end;
  end;

  if (ParamList.Strings.Count <> 0) then
    ParamList.Options := ParamList.Options + [goEditing]
  else
    ParamList.Options := ParamList.Options - [goEditing];
end;


function TfrmGestionEnTramite.ExistsSalidaVentanilla: boolean;
var
  i: integer;
begin
  result := false;
  for i:= 0 to chkGestionables.Items.Count-1 do
    if chkGestionables.Checked[i] then
      with TInfoGestion(chkGestionables.Items.Objects[i]) do
      if (Salida = CONTACTO_VENTANILLA) then
      begin
        result:= true;
        break;
      end;
end;

function TfrmGestionEnTramite.ExistsSalidaChecked(
  aSalida: integer): boolean;
var
  i: integer;
begin
  result := false;
  for i:= 0 to chkGestionables.Items.Count-1 do
  if chkGestionables.Checked[i] then
  begin
    if (TInfoGestion(chkGestionables.Items.Objects[i]).Salida = aSalida) then
    begin
      result := true;
      break;
    end;
  end;
end;

function TfrmGestionEnTramite.ValidarRegistrarResultado: boolean;
begin
  Verificar(fraResultado.IsSelected and (fraResultado.sdqDatos.FieldByName('rg_idestadoaaplicar').AsInteger = GESTION_FINALIZADA) and (not fraContactoSelected.Locked) and (not fraContactoSelected.IsSelected), fraContactoSelected, 'Debe seleccionar un contacto.');
  result := true;
end;

procedure TfrmGestionEnTramite.tbContactoClick(Sender: TObject);
begin
  inherited;
  with TfrmContratoContactoEmi.Create(self) do
  try
    AutoCommit := false;
    DoCargar(FContrato);
    ShowModal;
    fraContacto.Reload;
  finally
    free;
  end;

end;

procedure TfrmGestionEnTramite.fraContactoSelectedcmbDescripcionChange(
  Sender: TObject);
begin
  inherited;
  if (trim(fraContactoSelected.cmbDescripcion.Text) = '') then
    fraContactoSelected.Clear;
end;

procedure TfrmGestionEnTramite.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RollBackUpdates;
end;

procedure TfrmGestionEnTramite.btnPegarClick(Sender: TObject);
begin
  ParamList.Values[ParamList.Keys[ParamList.Row]] := StringReplace(StringReplace(Clipboard.AsText, #13, '', [rfReplaceAll]), #10,  '', [rfReplaceAll]);
end;

end.
