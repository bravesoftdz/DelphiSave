unit unGeneracionLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvgGroupBox, Buttons, ComCtrls, CheckLst,
  Mask, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ExComboBox, Menus, unCustomForm,
  ImgList, XPMenu, Placemnt, DB, SDEngine, ToolWin, ARTCheckListBox,
  listlink, unDmPrincipal, JvExComCtrls, JvComCtrls, unFuncionesEmision,
  ValEdit, unComunesGestion, unImpoExpoWizard;

type

  TUsuarioAsignado = class
    private
      FId: integer;
      FNew: boolean;
    public
      property Id: integer read FId write FId;
      property IsNew: boolean read FNew write FNew;
      constructor Create(aId: Integer; aIsNew: boolean); overload;
  end;

  TInfoGestionable = class
  private
    FIdGestionable: integer;
    FSalida: integer;
    FMailSalida: string;
  public
    property IdGestionable: integer read FIdGestionable write FIdGestionable;
    property Salida: integer read FSalida write FSalida;
    property MailSalida: String read FMailSalida write FMailSalida;
    constructor Create(aIdGestionable: Integer; aSalida: integer; aMailSalida: string); overload;
  end;

  TfrmGeneracionLote = class(TfrmCustomForm)
    gbCabeceraLote: TJvgGroupBox;
    Shape5: TShape;
    pnlLeft: TPanel;
    pnlMiddle: TPanel;
    tvCondiciones: TTreeView;
    lblCondicionesGenerales: TLabel;
    btnAddCondicion: TSpeedButton;
    btnDeleteCondicion: TSpeedButton;
    chkGestionables: TARTCheckListBox;
    lblGestionables: TLabel;
    gbMed: TJvgGroupBox;
    Shape1: TShape;
    pnlSalida: TPanel;
    lblSalidas: TLabel;
    PanelDesc: TPanel;
    chkSalidas: TARTCheckListBox;
    lblFechaVencimiento: TLabel;
    edFechaVencimiento: TDateComboBox;
    lblFechaInicio: TLabel;
    edFechaInicio: TDateComboBox;
    lblAgendado: TLabel;
    edAgendado: TDateComboBox;
    fraResponsable: TfraCodigoDescripcionExt;
    lblResponsable: TLabel;
    fraEstado: TfraCodigoDescripcionExt;
    lblEstado: TLabel;
    lblObservacion: TLabel;
    edObservacion: TMemo;
    pnlRight: TPanel;
    lblAsignarPor: TLabel;
    chkAsignarPor: TARTCheckListBox;
    pnlBottom: TPanel;
    btnProcesar: TButton;
    btnCancelar: TButton;
    fpABMCondicion: TFormPanel;
    Bevel4: TBevel;
    lblCondicion: TLabel;
    btnAceptarReproceso: TButton;
    btnCancelarReproceso: TButton;
    fraCondicion: TfraCodigoDescripcionExt;
    edValor: TEdit;
    lblValor: TLabel;
    cmbOperador: TExComboBox;
    lblOperador: TLabel;
    edSentencia: TEdit;
    lblSentencia: TLabel;
    btnAnd: TButton;
    bttOr: TButton;
    btnNot: TButton;
    btnParentesis: TButton;
    PopupMenuAndOr: TPopupMenu;
    mnuAND: TMenuItem;
    mnuOR: TMenuItem;
    lblFormato: TLabel;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    tbarSimulacion: TToolBar;
    btnLimpiarSentencia: TToolButton;
    fpUsuarios: TFormPanel;
    lblUsuarios: TLabel;
    lstUsuarios: TListBox;
    lblUsuariosAAsignar: TLabel;
    lstUsuariosAsignar: TListBox;
    btnPasarSel: TButton;
    btnSacarSel: TButton;
    btnPasarTodos: TButton;
    btnSacarTodos: TButton;
    btnAceptarUsuario: TButton;
    btnCancelarUsuario: TButton;
    fraSector: TfraCodigoDescripcionExt;
    lblSector: TLabel;
    ListLink: TListLink;
    edNro: TEdit;
    edDescripcion: TEdit;
    lblNro: TLabel;
    lblDescripcion: TLabel;
    pnlData: TPanel;
    dbgDetalleLote: TArtDBGrid;
    pcDetalleLote: TJvPageControl;
    tbDDJJ: TTabSheet;
    tbNotas: TTabSheet;
    tbCuiles: TTabSheet;
    dbgDetalleDDJJ: TArtDBGrid;
    dbgDetalleNotas: TArtDBGrid;
    dbgDetalleCuiles: TArtDBGrid;
    sdqDetalleDDJJ: TSDQuery;
    dsDetalleDDJJ: TDataSource;
    sdqDetalleNotas: TSDQuery;
    dsDetalleNotas: TDataSource;
    sdqDetalleCuiles: TSDQuery;
    dsDetalleCuiles: TDataSource;
    btnDefinirParametros: TSpeedButton;
    fpParametros: TFormPanel;
    btnAceptarParametro: TButton;
    btnCancelarParametro: TButton;
    ParamList: TValueListEditor;
    fpMailSalida: TFormPanel;
    btnAceptarMailContacto: TButton;
    btnCancelarMailContacto: TButton;
    chkMailContrato: TCheckBox;
    chkMailEmision: TCheckBox;
    lbArchivoOrigen: TLabel;
    edArchOrigen: TFilenameEdit;
    procedure btnAddCondicionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarReprocesoClick(Sender: TObject);
    procedure cmbOperadorChange(Sender: TObject);
    procedure mnuANDClick(Sender: TObject);
    procedure mnuORClick(Sender: TObject);
    procedure btnAndClick(Sender: TObject);
    procedure bttOrClick(Sender: TObject);
    procedure btnNotClick(Sender: TObject);
    procedure btnParentesisClick(Sender: TObject);
    procedure btnLimpiarSentenciaClick(Sender: TObject);
    procedure btnDeleteCondicionClick(Sender: TObject);
    procedure chkAsignarPorClickCheck(Sender: TObject);
    procedure btnAceptarUsuarioClick(Sender: TObject);
    procedure btnCancelarUsuarioClick(Sender: TObject);
    procedure lblAsignarPorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkAsignarPorDblClick(Sender: TObject);
    procedure lstUsuariosDblClick(Sender: TObject);
    procedure lstUsuariosAsignarDblClick(Sender: TObject);
    procedure fpUsuariosShow(Sender: TObject);
    procedure btnSacarSelClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure lblAsignarPorMouseEnter(Sender: TObject);
    procedure lblAsignarPorMouseLeave(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure dbgDetalleLoteGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnDefinirParametrosClick(Sender: TObject);
    procedure chkSalidasClickCheck(Sender: TObject);
    procedure btnAceptarMailContactoClick(Sender: TObject);
    procedure chkGestionablesClick(Sender: TObject);
  private
    FSentencia: string;
    FSentenciaPreview: string;
    FIndexChecked: integer;
    FIdLote: integer;
    FNroLote: integer;
    FVerificoParametros: boolean;
    FTieneArchivo : Boolean;
    function EsVacio: Boolean;
    function GetOperadorValor(aIdOperador, aValor, aTipo, aSubConsulta: string): string;
    function GetFormatoPorTipo(aValor, aTipo: string): string;
    function GenerarCabeceraLote(aIdLote: integer): integer;
    procedure ValidarCondicion;
    procedure ValidarGeneracionLote;
    procedure AgregarSentencia(aOperadorLogico: string = ''; aCondicionInterna: boolean = true);
    procedure fraCondicionChange(Sender: TObject);
    procedure fraSectorChange(Sender: TObject);
    procedure LimpiarFp;
    procedure BorrarOperadorFinal;
    procedure CargarUsuarios(aTipoAsignacion: integer; aSector: String);
    procedure LiberarObjetos(aListBox: TListBox);
    procedure GuardarCondicionesGenerales(aIdLote: integer);
    procedure GuardarGestionables(aIdLote: integer);
    procedure GuardarUsuarios(aIdLote: integer);
    procedure GuardarSalidas(aIdLote: integer);
    procedure GuardarParametros(aIdLote: integer);
    procedure ProcesarLote(aIdLote: integer);
    procedure GenerarTareas(aIdLote: Integer);
    procedure CargarDetalleLote(aIdLote: integer);
    procedure CargarCondicionesLote(aIdLote: integer);
    procedure CargarGestionablesLote(aIdLote: integer);
    procedure CargarUsuariosLote(aIdLote: integer);
    procedure CargarSalidasLote(aIdLote: integer);
    procedure CargarCabeceraLote(aIdLote: integer);
    procedure ArchivoProcesar;
    procedure GuardarLoteArchivo(vIdLote: Integer);
  public
    procedure HabilitarControles(aActive: boolean);
    procedure CargarLote(aIdLote: integer);
  end;

const
  DIV_ASESORES   = '1';
  DIV_EJECUTIVOS = '2';
  DIV_GESTOR     = '3';
  DIV_USUARIOS   = '4';
  DIV_AUTOMATICA = '5';

var
  frmGeneracionLote: TfrmGeneracionLote;


implementation

{$R *.dfm}

uses
  unPrincipal, CustomDlgs, AnsiSql, Strfuncs, General, StrUtils, unSesion, VclExtra, unConstEmision, unSIC;

procedure TfrmGeneracionLote.AgregarSentencia(aOperadorLogico: string = ''; aCondicionInterna: boolean = true);
var
  CampoCondicion: String;
  sValor : String;
begin
  if (aOperadorLogico = '()') then
  begin
    FSentencia := '(' + FSentencia + ')';
    FSentenciaPreview := '(' + FSentenciaPreview + ')';
  end
  else begin
    if (aOperadorLogico = 'NOT') then
    begin
      FSentencia := ' NOT (' + FSentencia + ')';
      FSentenciaPreview := ' NO (' + FSentenciaPreview + ')';
    end
    else begin
      if not EsVacio then
      begin
        CampoCondicion := fraCondicion.sdqDatos.fieldbyName('CG_CAMPOCONDICION').AsString;

        if CampoCondicion = '<VALOR>' then
        begin
          CampoCondicion := GetFormatoPorTipo(edValor.Text, fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString);
        end;

        if (cmbOperador.Value = 'AR') or (cmbOperador.Value = 'NAR') then
        begin
          ArchivoProcesar;
          sValor := 'SELECT AL_CONTRATO FROM EMI.IAL_ARCHIVOLOTE WHERE AL_USUALTA = '+SqlValue(Sesion.UserID)+
                '   AND AL_NROPC = '+SqlValue(Sesion.WindowsComputerName)+
                '   AND AL_IDLOTE is NULL'; 
        end
        else
          sValor := edValor.Text;



        FSentencia := iif(aCondicionInterna, '', ' ' + aOperadorLogico + ' (') + FSentencia + CampoCondicion +
                      GetOperadorValor(cmbOperador.Value, sValor, fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString, fraCondicion.sdqDatos.fieldbyName('CG_SUBCONSULTA').AsString) +
                      iif(not aCondicionInterna, ')', ' ' + aOperadorLogico + ' ');
        FSentenciaPreview := iif(aCondicionInterna, '', ' ' + aOperadorLogico + ' (') + FSentenciaPreview + fraCondicion.Descripcion +
                             GetOperadorValor(cmbOperador.Value, sValor, fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString, ''(*fraCondicion.sdqDatos.fieldbyName('CG_SUBCONSULTA').AsString*)) +
                             iif(not aCondicionInterna, ')', ' ' + aOperadorLogico + ' ');
      end
      else begin
        FSentencia := iif(aCondicionInterna, '', ' ' + aOperadorLogico + ' (') + FSentencia + iif(not aCondicionInterna, ')', ' ' + aOperadorLogico + ' ');
        FSentenciaPreview := iif(aCondicionInterna, '', ' ' + aOperadorLogico + ' (') + FSentenciaPreview + iif(not aCondicionInterna, ')', ' ' + aOperadorLogico + ' ');
      end;
    end;
  end;
end;

procedure TfrmGeneracionLote.btnAddCondicionClick(Sender: TObject);
var
  strlist: TStringList;
begin
  LimpiarFp;
  FSentenciaPreview := '';
  FSentencia := '';
  if fpABMCondicion.ShowModal = mrOk then
  begin
    with tvCondiciones.Items.AddChild(nil, FSentenciaPreview) do
    begin
      SelectedIndex :=   51;
      ImageIndex := 51;
      strlist:= TStringList.Create;
      strlist.Add(FSentencia);
      Data := TObject(strlist);
    end;
  end;
end;

procedure TfrmGeneracionLote.ValidarCondicion;
begin
  Verificar(not fraCondicion.IsSelected, fraCondicion.cmbDescripcion, 'Debe seleccionar una condición.');
  Verificar((cmbOperador.ItemIndex = -1), cmbOperador, 'Debe seleccionar un operador.');
  if (cmbOperador.Value = 'AR') or (cmbOperador.Value = 'NAR') then
    Verificar((edArchOrigen.Enabled) and (edArchOrigen.Text = ''), edArchOrigen, 'Debe seleccionar un archivo.')
  else
    Verificar((edValor.Enabled) and (edValor.Text = ''), edValor, 'Debe seleccionar un valor.');
end;

procedure TfrmGeneracionLote.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  FTieneArchivo := False;
  with fraCondicion do
  begin
    TableName   := 'EMI.ICG_CONDICIONGENERAL';
    FieldID     := 'CG_ID';
    FieldCodigo := 'CG_ID';
    FieldDesc   := 'CG_DESCRIPCION';
    FieldBaja   := 'CG_FECHABAJA';
    ExtraFields := ', CG_CAMPOCONDICION, CG_TIPODATO, CG_SUBCONSULTA ';
    OrderBy     := 'CG_ORDEN';
    ShowBajas   := false;
    OnChange    := fraCondicionChange;
  end;

 with fraSector do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas   := false;
    ExtraCondition := ' AND SC_MOSTRAR = ''S''';
    OnChange    := fraSectorChange;
  end;

 with fraEstado do
  begin
    TableName   := 'EMI.IEL_ESTADOLOTE';
    FieldID     := 'EL_ID';
    FieldCodigo := 'EL_ID';
    FieldDesc   := 'EL_DESCRIPCION';
    FieldBaja   := 'EL_FECHABAJA';
    ShowBajas   := false;
    Locked      := true;
  end;

 with fraResponsable do
  begin
    TableName   := 'ART.USE_USUARIOS';
    FieldID     := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N''';
    ShowBajas   := false;
  end;


  chkGestionables.SQL := 'SELECT GE_DESCRIPCION, GE_ID FROM EMI.IGE_GESTIONABLE WHERE GE_FECHABAJA IS NULL AND GE_MANUAL = ''S'' ORDER BY GE_ID';
  for i:=0 to chkGestionables.Count-1 do
    chkGestionables.Items.Objects[i] := TInfoGestionable.Create(StrToInt(chkGestionables.Values[i]),-1, '');
  chkGestionables.ItemIndex := 0;

  chkSalidas.SQL := 'SELECT MN_DESCRIPCION, MN_ID FROM COMUNES.CMN_MODONOTIFICACION ORDER BY MN_PRIORIDADDEFECTO';
  FIndexChecked := -1;

  HabilitarControles(true);

  tbNotas.TabVisible := false;
  tbDDJJ.TabVisible := false;
  tbCuiles.TabVisible := false;

  tbDDJJ.Visible := false;
  tbNotas.Visible := false;
  tbCuiles.Visible := false;

end;

procedure TfrmGeneracionLote.btnAceptarReprocesoClick(Sender: TObject);
begin
  if not EsVacio then
    ValidarCondicion;

  if tvCondiciones.Items.Count > 0 then
    PopupMenuAndOr.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y)
  else begin
    AgregarSentencia('AND', false);
    BorrarOperadorFinal;
    fpABMCondicion.ModalResult := mrOk;
  end;

end;

function TfrmGeneracionLote.GetOperadorValor(aIdOperador, aValor, aTipo, aSubConsulta: string): string;
var
  strlist: TStringList;
  i: integer;
begin
  if (aIdOperador = 'I') then
    Result := ' = ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'D') then
    Result := ' <> ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'MA') then
    Result := ' > ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'ME') then
    Result := ' < ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'MAI') then
    Result := ' >= ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'MEI') then
    Result := ' <= ' + GetFormatoPorTipo(aValor, aTipo);
  if (aIdOperador = 'CC') then
    Result := ' LIKE ' + GetFormatoPorTipo(aValor + '%', aTipo);
  if (aIdOperador = 'TC') then
    Result := ' LIKE ' + GetFormatoPorTipo('%' + aValor, aTipo);
  if (aIdOperador = 'C') then
    Result := ' LIKE ' + GetFormatoPorTipo('%' + aValor + '%', aTipo);
  if (aIdOperador = 'LI') then
  begin
    strlist := TStringList.Create;
    try
      Split(aValor, ',', strlist);
      for i:=0 to strlist.Count-1 do
      begin
        if (Result <> '') then
          Result := Result + ', ';
        Result := Result + GetFormatoPorTipo(trim(strlist.Strings[i]), aTipo);
      end;
      Result := ' IN (' + Result + ')';
    finally
      strlist.Free;
    end;
  end;
  if (aIdOperador = 'NLI') then
  begin
    strlist := TStringList.Create;
    try
      Split(aValor, ',', strlist);
      for i:=0 to strlist.Count-1 do
      begin
        if (Result <> '') then
          Result := Result + ', ';
        Result := Result + GetFormatoPorTipo(trim(strlist.Strings[i]), aTipo);
      end;
      Result := ' NOT IN (' + Result + ')';
    finally
      strlist.Free;
    end;
  end;
  if (aIdOperador = 'AR') then
  begin
    Result := ' IN (' + aValor + ')';
  end;
  if (aIdOperador = 'NAR') then
  begin
    Result := ' NOT IN (' + aValor + ')';
  end;

  if (aSubConsulta <> '') then
    Result := ' IN (' + aSubConsulta + ')';
end;

function TfrmGeneracionLote.GetFormatoPorTipo(aValor,
  aTipo: string): string;
var
   fs: TFormatSettings;
begin
  fs.DecimalSeparator  := DecimalSeparator;
  fs.ThousandSeparator := ThousandSeparator;
  fs.DateSeparator     := DateSeparator;
  fs.ShortTimeFormat   := ShortTimeFormat;
  fs.LongTimeFormat    := LongTimeFormat;
  fs.ShortDateFormat   := ShortDateFormat;

  if (aTipo = 'I') then
    result := SqlInteger(aValor);
  if (aTipo = 'S') then
    result := SqlString(aValor, true);
  if (aTipo = 'R') then
    result := SqlNumber(aValor);
  if (aTipo = 'F') then
    result := SqlDate(StrToDate(aValor, fs));
  if (aTipo = 'H') then
    result := SqlDate(StrToDateTime(aValor, fs));
end;

procedure TfrmGeneracionLote.cmbOperadorChange(Sender: TObject);
begin

  vclextra.LockControls([edValor],(cmbOperador.Value = 'IN') or (cmbOperador.Value = 'INN')or
                          (cmbOperador.Value = 'AR') or (cmbOperador.Value = 'NAR'));
  vclExtra.LockControls([edArchOrigen],not( (cmbOperador.Value = 'AR') or (cmbOperador.Value = 'NAR')));
  if not ((cmbOperador.Value = 'LI') or (cmbOperador.Value = 'NLI')) then
  begin
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'I') then
      lblFormato.Caption := 'Formato: 9999999';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'S') then
      lblFormato.Caption := 'Formato: XXXXXXX';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'R') then
      lblFormato.Caption := 'Formato: 9999,99';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'F') then
      lblFormato.Caption := 'Formato: DD/MM/AAAA';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'H') then
      lblFormato.Caption := 'Formato: DD/MM/AAAA HH24:MI:SS';
  end
  else begin
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'I') then
      lblFormato.Caption := 'Formato: 9999999, 9999999';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'S') then
      lblFormato.Caption := 'Formato: XXXXXXX, XXXXXXX';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'R') then
      lblFormato.Caption := 'Formato: No permitido';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'F') then
      lblFormato.Caption := 'Formato: No permitido';
    if (fraCondicion.sdqDatos.fieldbyName('CG_TIPODATO').AsString = 'H') then
      lblFormato.Caption := 'Formato: No permitido';
  end;

end;

procedure TfrmGeneracionLote.fraCondicionChange(Sender: TObject);
begin
  if (cmbOperador.ItemIndex > -1) then
    cmbOperadorChange(Sender); 
end;

procedure TfrmGeneracionLote.mnuANDClick(Sender: TObject);
begin
  AgregarSentencia('AND', false);
  BorrarOperadorFinal;
  fpABMCondicion.ModalResult := mrOk;
end;

procedure TfrmGeneracionLote.mnuORClick(Sender: TObject);
begin
  AgregarSentencia('OR', false);
  BorrarOperadorFinal;
  fpABMCondicion.ModalResult := mrOk;
end;

procedure TfrmGeneracionLote.btnAndClick(Sender: TObject);
begin
  ValidarCondicion;
  AgregarSentencia('AND');
  LimpiarFp;
  edSentencia.Text := FSentenciaPreview;
end;

procedure TfrmGeneracionLote.bttOrClick(Sender: TObject);
begin
  ValidarCondicion;
  AgregarSentencia('OR');
  LimpiarFp;
  edSentencia.Text := FSentenciaPreview;
end;

procedure TfrmGeneracionLote.btnNotClick(Sender: TObject);
begin
  AgregarSentencia('NOT');
  LimpiarFp;
  edSentencia.Text := FSentenciaPreview;
end;

procedure TfrmGeneracionLote.btnParentesisClick(Sender: TObject);
begin
  AgregarSentencia('()');
  LimpiarFp;
  edSentencia.Text := FSentenciaPreview;
end;

procedure TfrmGeneracionLote.LimpiarFp;
begin
  lblFormato.Caption := 'Formato:';
  fraCondicion.Limpiar;
  cmbOperador.ItemIndex := -1;
  edValor.Text := '';
  edSentencia.Text := '';
end;

procedure TfrmGeneracionLote.btnLimpiarSentenciaClick(Sender: TObject);
begin
  FSentencia := '';
  FSentenciaPreview := '';
  LimpiarFp;
end;

function TfrmGeneracionLote.EsVacio: Boolean;
begin
  result := (not fraCondicion.IsSelected) and (cmbOperador.ItemIndex = -1) and (edValor.Text = ''); 
end;

procedure TfrmGeneracionLote.BorrarOperadorFinal;
begin
   if (RightStr(FSentencia, 6) = ' AND )') then
   begin
    Delete(FSentencia, length(FSentencia)-5, 5);
    Delete(FSentenciaPreview, length(FSentenciaPreview)-5, 5);
   end;

   if (RightStr(FSentencia, 5) = ' OR )') then
   begin
    Delete(FSentencia, length(FSentencia)-4, 4);
    Delete(FSentenciaPreview, length(FSentenciaPreview)-4, 4);
   end;
end;

procedure TfrmGeneracionLote.btnDeleteCondicionClick(Sender: TObject);
begin
  if (tvCondiciones.SelectionCount > 0) then
  begin
    if MsgAsk('¿Esta seguro de eliminar la condición?') then
    begin
      TObject(tvCondiciones.Selected.Data).Free;
      tvCondiciones.Selected.Delete;
    end;
  end;
end;

procedure TfrmGeneracionLote.chkAsignarPorClickCheck(Sender: TObject);
begin
  lstUsuariosAsignar.Items.Clear;
  if FIndexChecked <> -1 then
    chkAsignarPor.Checked[FIndexChecked] := false;
  if chkAsignarPor.ItemsChecked.Count > 0 then
    FIndexChecked := chkAsignarPor.Items.IndexOf(chkAsignarPor.ItemsChecked[0])
  else
    FIndexChecked := -1;
  if (FIndexChecked <> -1) then
  begin
    CargarUsuarios(FIndexChecked, fraSector.Codigo);
    fraSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    lblSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    fpUsuarios.ShowModal;
  end;
end;

procedure TfrmGeneracionLote.fraSectorChange(Sender: TObject);
begin
  CargarUsuarios(FIndexChecked, fraSector.Codigo);
end;

procedure TfrmGeneracionLote.CargarUsuarios(aTipoAsignacion: integer; aSector: String);
var
  sSQL: String;
  sNotIn: String;
  i: integer;
begin
  LiberarObjetos(lstUsuarios);
  lstUsuarios.Items.Clear;

  sNotIn := '';
  sSQL := ' SELECT SE_USUARIO, SE_NOMBRE, SE_ID ' +
          ' FROM ART.USE_USUARIOS ' +
          ' WHERE SE_FECHABAJA IS NULL ' +
          ' AND SE_USUARIOGENERICO = ''N''';

  if (chkAsignarPor.Values[aTipoAsignacion] = DIV_ASESORES) then
    sSQL := sSQL + ' AND EXISTS (SELECT 1 FROM EMI.IAS_ASESOREMISION WHERE AS_USUARIO = SE_USUARIO AND AS_FECHABAJA IS NULL) ';

  if (chkAsignarPor.Values[aTipoAsignacion] = DIV_EJECUTIVOS) then
    sSQL := sSQL + ' AND EXISTS (SELECT 1 FROM AFI.AEC_EJECUTIVOCUENTA WHERE EC_IDUSUARIO = SE_ID AND EC_FECHABAJA IS NULL) ';

  if (chkAsignarPor.Values[aTipoAsignacion] = DIV_GESTOR) then
    sSQL := sSQL + ' AND EXISTS (SELECT 1 FROM AGC_GESTORCUENTA WHERE GC_USUARIO = SE_USUARIO AND GC_FECHABAJA IS NULL) ';

  if (chkAsignarPor.Values[aTipoAsignacion] = DIV_USUARIOS) AND (aSector <> '') then
    sSQL := sSQL + ' AND SE_SECTOR = ' + SqlValue(aSector);

  for i:=0 to lstUsuariosAsignar.Items.Count-1 do
  begin
    if (sNotIn <> '') then
      sNotIn := sNotIn + ', ';
    sNotIn := sNotIn + SqlInt(TUsuarioAsignado(lstUsuariosAsignar.Items.Objects[i]).Id);
  end;

  if (sNotIn <> '') then
    sSQL := sSQL + ' AND SE_ID NOT IN (' + sNotIn + ') ';

  sSQL := sSQL + ' ORDER BY SE_SECTOR, SE_NOMBRE';

    with GetQuery(sSQL) do
    try
      while not Eof do
      begin
        lstUsuarios.AddItem(FieldByName('SE_NOMBRE').AsString + ' - (' + FieldByName('SE_USUARIO').AsString + ')', TUsuarioAsignado.Create(FieldByName('SE_ID').AsInteger, true));
        Next;
      end;
    finally
      free;
    end;
end;

procedure TfrmGeneracionLote.btnAceptarUsuarioClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to lstUsuariosAsignar.Count-1 do
    if TUsuarioAsignado(lstUsuariosAsignar.Items.Objects[i]).IsNew then
      TUsuarioAsignado(lstUsuariosAsignar.Items.Objects[i]).IsNew := false;
  fpUsuarios.ModalResult := mrOk;
end;

procedure TfrmGeneracionLote.btnCancelarUsuarioClick(Sender: TObject);
var
  i: integer;
begin
  if btnAceptarUsuario.Enabled then
    for i:= lstUsuariosAsignar.Count-1  downto 0 do
      if TUsuarioAsignado(lstUsuariosAsignar.Items.Objects[i]).IsNew then
      begin
        lstUsuariosAsignar.Items.Objects[i].Free;
        lstUsuariosAsignar.Items.Delete(i);
      end;

  fpUsuarios.ModalResult := mrCancel;
end;

{ TUsuarioAsignado }
constructor TUsuarioAsignado.Create(aId: Integer; aIsNew: boolean);
begin
  inherited Create;
  FId := aId;
  FNew := aIsNew; 
end;

procedure TfrmGeneracionLote.lblAsignarPorClick(Sender: TObject);
begin
  if (FIndexChecked <> -1) then
  begin
    CargarUsuarios(FIndexChecked, fraSector.Codigo);
    fraSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    lblSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    fpUsuarios.ShowModal;
  end;
end;

procedure TfrmGeneracionLote.LiberarObjetos(aListBox: TListBox);
var
  i: integer;
begin
  for i:=0 to aListBox.Items.Count-1 do
    aListBox.Items.Objects[i].Free;
end;

procedure TfrmGeneracionLote.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  LiberarObjetos(lstUsuariosAsignar);
  for i:=0 to tvCondiciones.Items.Count-1 do
    TObject(tvCondiciones.Items[i].Data).Free;
  inherited;
end;

procedure TfrmGeneracionLote.chkAsignarPorDblClick(Sender: TObject);
begin
  if (FIndexChecked <> -1) then
  begin
    CargarUsuarios(FIndexChecked, fraSector.Codigo);
    fraSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    lblSector.Visible := (chkAsignarPor.Values[FIndexChecked] = DIV_USUARIOS);
    fpUsuarios.ShowModal;
  end;
end;

procedure TfrmGeneracionLote.lstUsuariosDblClick(Sender: TObject);
begin
  btnPasarSel.Click;
end;

procedure TfrmGeneracionLote.lstUsuariosAsignarDblClick(Sender: TObject);
begin
  btnSacarSel.Click;
end;

procedure TfrmGeneracionLote.fpUsuariosShow(Sender: TObject);
begin
  inherited;
  if not fraSector.Visible then
    fraSector.Limpiar;
end;

procedure TfrmGeneracionLote.btnSacarSelClick(Sender: TObject);
begin
  CargarUsuarios(FIndexChecked, fraSector.Codigo);
end;

procedure TfrmGeneracionLote.ValidarGeneracionLote;
var
  i: integer;
begin
  Verificar(trim(edDescripcion.Text) = '', edDescripcion, 'Debe especificar una descripción.');
  Verificar(chkGestionables.CheckCount = 0, chkGestionables, 'Debe seleccionar un ítem de gestión.');
  Verificar(chkAsignarPor.CheckCount = 0, chkAsignarPor, 'Debe seleccionar alguien para asignar.');
  Verificar(lstUsuariosAsignar.Items.Count = 0, lblAsignarPor, 'Debe seleccionar alguien para asignar.');
//  Verificar(chkSalidas.CheckCount = 0, chkSalidas, 'Debe seleccionar una salida.');
  Verificar(edFechaInicio.Date = 0, edFechaInicio, 'Debe especificar la fecha de inicio.');
  Verificar(edFechaVencimiento.Date = 0, edFechaVencimiento, 'Debe especificar una fecha de vencimiento.');
  Verificar(edFechaVencimiento.Date < edFechaInicio.Date, edFechaVencimiento, 'La fecha de vencimiento debe ser mayor a la de inicio.');
  Verificar(not fraResponsable.IsSelected, fraResponsable, 'Debe especificar un responsable del lote.');
//  Verificar(not FVerificoParametros and (ParamList.Strings.Count > 0), btnDefinirParametros, 'Debe verificar los parámetros de salida.');

  if ParamList.Enabled then
    for i:=0 to ParamList.Strings.Count-1 do
      if  trim(Copy(ParamList.Strings[i],
               Pos('=', ParamList.Strings[i])+1,
               Length(ParamList.Strings[i])-Pos('=', ParamList.Strings[i])+1)) = '' then
        Verificar(true, btnDefinirParametros, 'Debe definir todos los parámetros.');

  for i:=0 to chkGestionables.Count -1 do
    if chkGestionables.Checked[i] then
      Verificar(TInfoGestionable(chkGestionables.Items.Objects[i]).Salida < 0, chkGestionables, 'Falta definir la salida de algún ítem gestionable.');
end;

procedure TfrmGeneracionLote.btnProcesarClick(Sender: TObject);
begin
  ValidarGeneracionLote;
  BeginTrans(true);
  try
    FIdLote := GenerarCabeceraLote(FIdLote);
    GuardarCondicionesGenerales(FIdLote);
    GuardarGestionables(FIdLote);
    GuardarUsuarios(FIdLote);
    GuardarParametros(FIdLote);
    ProcesarLote(FIdLote);
    GuardarSalidas(FIdLote);
    GenerarTareas(FIdLote);
    if FTieneArchivo then
      GuardarLoteArchivo(FIdLote);
    CommitTrans(true);
    if (edNro.Text = '') then
    begin
      edNro.Text := IntToStr(FNroLote);
      MsgBox('El Lote ' + edNro.Text + ' ha sido generado con éxito.', MB_ICONINFORMATION, Self.Caption);
    end;
    CargarDetalleLote(FIdLote);
    HabilitarControles(false);
//    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      FIdLote := 0;
      Rollback(true);
      MsgBox('Error al guardar el lote. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption)
    end;
  end;

end;

procedure TfrmGeneracionLote.lblAsignarPorMouseEnter(Sender: TObject);
begin
  inherited;
  if (FIndexChecked <> -1) then
    lblAsignarPor.Font.Style := [fsBold];
end;

procedure TfrmGeneracionLote.lblAsignarPorMouseLeave(Sender: TObject);
begin
  inherited;
  lblAsignarPor.Font.Style := [];
end;

procedure TfrmGeneracionLote.GuardarCondicionesGenerales(aIdLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('delete from emi.icl_condicionlote where cl_idlote = ' + SqlValue(aIdLote));
  for i:=0 to tvCondiciones.Items.Count-1 do
    EjecutarStoreSTEx('emi.gestion.do_guardarcondicionlote(:idlote, :condicion, :condicionvisual);',
                      [aIdLote, TStringList(tvCondiciones.Items[i].Data).Strings[0], tvCondiciones.Items[i].Text]);
end;

function TfrmGeneracionLote.GenerarCabeceraLote(aIdLote: integer): integer;
begin
  if (aIdLote = 0) then
  begin
    with TSDStoredProc.Create(nil) do
    try
      DatabaseName := 'dbPrincipal';
      StoredProcName := 'emi.gestion.do_generarlote';
      Params.CreateParam(ftDateTime, 'fechainicio', ptInput);
      ParamByName('fechainicio').Value := edFechaInicio.Date;

      Params.CreateParam(ftDateTime, 'fechavencimiento', ptInput);
      ParamByName('fechavencimiento').Value := edFechaVencimiento.Date;

      Params.CreateParam(ftDateTime, 'fechaagendada', ptInput);
      ParamByName('fechaagendada').Value := edAgendado.Date;

      Params.CreateParam(ftString, 'observacion', ptInput);
      ParamByName('observacion').Value := edobservacion.Lines.Text;

      Params.CreateParam(ftinteger, 'idresponsable', ptInput);
      ParamByName('idresponsable').Value := fraResponsable.Value;

      Params.CreateParam(ftString, 'descripcion', ptInput);
      ParamByName('descripcion').Value := edDescripcion.Text;

      Params.CreateParam(ftinteger, 'tipoasignacion', ptInput);
      ParamByName('tipoasignacion').Value := strtoint(chkAsignarPor.ValuesChecked[0]);

      //Params.CreateParam(ftinteger, 'idestado', ptInput);

      //Params.CreateParam(ftinteger, 'generarnumlote', ptInput);

      Params.CreateParam(ftinteger, 'idlote', ptOutput);
      ExecProc;

      result := ParamByName('idlote').Value;
    finally
      Free;
    end;
    FNroLote := ValorSqlInteger('SELECT lo_numerolote FROM emi.ilo_lote WHERE lo_id = ' + SqlValue(result));
  end
  else
    result := FIdLote;
end;

procedure TfrmGeneracionLote.GuardarGestionables(aIdLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('delete from emi.igl_gestionablelote where gl_idlote = ' + SqlValue(aIdLote));
  for i:=0 to chkGestionables.CheckCount-1 do
    EjecutarStoreSTEx('emi.gestion.do_guardargestionablelote(:idlote, :idgestionable);',
                      [aIdLote, strtoint(chkGestionables.ValuesChecked[i])]);
end;

procedure TfrmGeneracionLote.GuardarUsuarios(aIdLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('delete from emi.iul_usuariolote where ul_idlote = ' + SqlValue(aIdLote));
  for i:=0 to lstUsuariosAsignar.Items.Count-1 do
    EjecutarStoreSTEx('emi.gestion.do_guardarusuariolote(:idlote, :idusuario);',
                      [aIdLote, TUsuarioAsignado(lstUsuariosAsignar.Items.Objects[i]).Id]);
end;

procedure TfrmGeneracionLote.GuardarSalidas(aIdLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('delete from emi.isl_subaccionlote where sl_idlote = ' + SqlValue(aIdLote));
  for i:=0 to chkGestionables.Count-1 do
    if chkGestionables.Checked[i] then
      EjecutarStoreSTEx('emi.gestion.do_guardarsalidalote(:idlote, :idgestionable, :idsalida, :mailnotificacion);',
                        [aIdLote,
                        TInfoGestionable(chkGestionables.Items.Objects[i]).IdGestionable,
                        TInfoGestionable(chkGestionables.Items.Objects[i]).Salida,
                        TInfoGestionable(chkGestionables.Items.Objects[i]).MailSalida]);
end;

procedure TfrmGeneracionLote.ProcesarLote(aIdLote: integer);
begin
  EjecutarStoreSTEx('emi.gestion.do_procesarlotegestion(:Idlote);', [aIdLote]);
end;

procedure TfrmGeneracionLote.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqDetalleDDJJ.Close;
  sdqDetalleNotas.Close;
  sdqDetalleCuiles.Close;
  sdqDetalleDDJJ.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
  sdqDetalleDDJJ.Open;
  if sdqDetalleDDJJ.IsEmpty then
  begin
    sdqDetalleNotas.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
    sdqDetalleNotas.Open;
    if sdqDetalleNotas.IsEmpty then
    begin
      sdqDetalleCuiles.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
      sdqDetalleCuiles.Open;
      if sdqDetalleCuiles.IsEmpty then
      begin
        tbDDJJ.Visible := false;
        tbNotas.Visible := false;
        tbCuiles.Visible := false;
      end
      else begin
        tbDDJJ.Visible := false;
        tbNotas.Visible := false;
        tbCuiles.Visible := true;
      end;
    end
    else begin
      tbDDJJ.Visible := false;
      tbNotas.Visible := true;
      tbCuiles.Visible := false;
    end;
  end
  else begin
    tbDDJJ.Visible := true;
    tbNotas.Visible := false;
    tbCuiles.Visible := false;
  end;

end;

procedure TfrmGeneracionLote.CargarDetalleLote(aIdLote: integer);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('idlote').AsInteger := aIdLote;
  sdqConsulta.Open;
end;

procedure TfrmGeneracionLote.HabilitarControles(aActive: boolean);
begin
  LockControls([chkAsignarPor, chkSalidas, tvCondiciones,
                chkGestionables, btnAceptarUsuario,
                btnPasarSel, btnSacarSel,
                btnPasarTodos, btnSacarTodos,
                lstUsuarios, lstUsuariosAsignar, fraSector,
                edDescripcion, edFechaInicio, edAgendado,
                edFechaVencimiento, fraResponsable, edObservacion,
                ParamList], not aActive);

  btnAddCondicion.Enabled := aActive;
  btnDeleteCondicion.Enabled := aActive;
  btnProcesar.Visible := aActive;
  if not btnProcesar.Visible then
    btnCancelar.Caption := '&Cerrar';
  btnAceptarParametro.Visible := aActive;
  if not btnAceptarParametro.Visible then
  begin
    ParamList.Options := ParamList.Options - [goEditing];
    btnCancelarParametro.Caption := '&Cerrar';
  end;
end;

procedure TfrmGeneracionLote.CargarLote(aIdLote: integer);
begin
  FIdLote := aIdLote; 
  HabilitarControles(false);
  CargarCabeceraLote(aIdLote);
  CargarCondicionesLote(aIdLote);
  CargarGestionablesLote(aIdLote);
  CargarUsuariosLote(aIdLote);
  CargarSalidasLote(aIdLote);
  CargarDetalleLote(aIdLote);
end;

procedure TfrmGeneracionLote.CargarCondicionesLote(aIdLote: integer);
var
  strlist: TStringList;
begin
  with GetQueryEx('select * from emi.icl_condicionlote where cl_idlote = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
      with tvCondiciones.Items.AddChild(nil, FieldByName('cl_condicion').AsString) do
      begin
        SelectedIndex :=   51;
        ImageIndex := 51;
        strlist:= TStringList.Create;
        strlist.Add(FieldByName('cl_condicionvisual').AsString);
        Data := TObject(strlist);
      end;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmGeneracionLote.CargarGestionablesLote(aIdLote: integer);
var
  i: integer;
//  SqlIn: String;
begin
(*
  with GetQueryEx('select * from emi.igl_gestionablelote where gl_idlote = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
      if SqlIn <> '' then
        SqlIn := SqlIn + ' ,';
      SqlIn := SqlIn + FieldByName('gl_idgestionable').AsString;
      Next;
    end;
  finally
    Free;
  end;
  chkGestionables.SQL := 'SELECT GE_DESCRIPCION, GE_ID FROM EMI.IGE_GESTIONABLE WHERE GE_ID IN ( ' + SqlIn + ') ';
  chkGestionables.CheckAll;
*)
(*
  with GetQueryEx('select * from emi.ige_gestionable, emi.igl_gestionablelote where ge_id = gl_idgestionable and gl_idlote = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
      if SqlIn <> '' then
        SqlIn := SqlIn + ' ,';
      SqlIn := SqlIn + FieldByName('gl_idgestionable').AsString;
      Next;
    end;
  finally
    Free;
  end;

  for i:=0 to chkGestionables.Count-1 do
    chkGestionables.Items.Objects[i] := TInfoGestionable.Create(StrToInt(chkGestionables.Values[i]),-1, '');
  chkGestionables.ItemIndex := 0;
*)

  chkGestionables.SQL := ' SELECT GE_DESCRIPCION, GE_ID ' +
                         ' FROM EMI.IGE_GESTIONABLE, EMI.ISL_SUBACCIONLOTE, EMI.IGL_GESTIONABLELOTE ' +
                         ' WHERE SL_IDGESTIONABLE = GE_ID AND ' +
                         '       SL_IDLOTE = GL_IDLOTE AND ' +
                         '       GE_ID = GL_IDGESTIONABLE AND ' +
                         '       GL_IDLOTE = ' + SqlValue(aIdLote);

  with GetQueryEx(' SELECT GE_ID, SL_IDSUBACCION, SL_MAILNOTIFICACION ' +
                  ' FROM EMI.IGE_GESTIONABLE, EMI.ISL_SUBACCIONLOTE, EMI.IGL_GESTIONABLELOTE ' +
                  ' WHERE SL_IDGESTIONABLE = GE_ID AND ' +
                  '       SL_IDLOTE = GL_IDLOTE AND ' +
                  '       GE_ID = GL_IDGESTIONABLE AND ' +
                  '       GL_IDLOTE = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
      i:=0;
      while (i <= chkGestionables.Count-1) and (chkGestionables.Values[i] <> FieldByName('GE_ID').AsString) do
        Inc(i);
      if (i <= chkGestionables.Count-1) then
         chkGestionables.Items.Objects[i] := TInfoGestionable.Create(StrToInt(chkGestionables.Values[i]), FieldByName('SL_IDSUBACCION').AsInteger, FieldByName('SL_MAILNOTIFICACION').AsString);
      Next;
    end;
  finally
    Free;
  end;
  chkGestionables.CheckAll;
  chkGestionables.ItemIndex := 0;
end;

procedure TfrmGeneracionLote.CargarUsuariosLote(aIdLote: integer);
begin
  with GetQueryEx('select * from art.use_usuarios, emi.iul_usuariolote where se_id = ul_idusuario and ul_idlote = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
      lstUsuariosAsignar.AddItem(FieldByName('SE_NOMBRE').AsString + ' - (' + FieldByName('SE_USUARIO').AsString + ')', TUsuarioAsignado.Create(FieldByName('SE_ID').AsInteger, true));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmGeneracionLote.CargarSalidasLote(aIdLote: integer);
begin
  chkGestionablesClick(self);
(*
  with GetQueryEx('select * from emi.isl_subaccionlote where sl_idlote = :idlote', [aIdLote]) do
  try
    while not Eof do
    begin
//      chkMailContrato.Checked := (FieldByName('sl_mailnotificacion').AsString = 'A') or (FieldByName('sl_mailnotificacion').AsString = 'C');
//      chkMailEmision.Checked  := (FieldByName('sl_mailnotificacion').AsString = 'A') or (FieldByName('sl_mailnotificacion').AsString = 'E');
//      chkSalidas.Check(FieldByName('sl_idsubaccion').AsString);
      Next;
    end;
  finally
    Free;
  end;
  chkSalidasClickCheck(self);
*)
end;

procedure TfrmGeneracionLote.CargarCabeceraLote(aIdLote: integer);
begin
  with GetQueryEx('select * from emi.ilo_lote where lo_id = :idlote', [aIdLote]) do
  try
    edNro.Text := FieldByName('lo_numerolote').AsString;
    edDescripcion.Text := FieldByName('lo_descripcion').AsString;
    edFechaInicio.Date := FieldByName('lo_fechainicio').AsDateTime;
    edAgendado.Date := FieldByName('lo_fechaagendada').AsDateTime;
    edFechaVencimiento.Date := FieldByName('lo_fechavencimiento').AsDateTime;
    fraEstado.Value := FieldByName('lo_idestado').AsInteger;
    fraResponsable.Value := FieldByName('lo_responsable').AsInteger;
    edObservacion.Text := FieldByName('lo_observacion').AsString;

    if (FieldByName('lo_tipoasignacion').AsString = DIV_AUTOMATICA) then
      chkAsignarPor.Add('Automático', '5');

    chkAsignarPor.Check(FieldByName('lo_tipoasignacion').AsString);

    FIndexChecked := chkAsignarPor.Items.IndexOf(chkAsignarPor.ItemsChecked[0]);
  finally
    Free;
  end;
end;

procedure TfrmGeneracionLote.dbgDetalleLoteGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (sdqConsulta.FieldByName('DS_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmGeneracionLote.btnDefinirParametrosClick(Sender: TObject);
begin
  FVerificoParametros := true;
  fpParametros.ShowModal;
end;

procedure TfrmGeneracionLote.chkSalidasClickCheck(Sender: TObject);
var
  i: integer;
begin
  Verificar((chkGestionables.ItemIndex < 0), chkGestionables, 'Debe seleccionar el ítem al cual definirá la salida.');
  if chkSalidas.CheckCount = 0 then
  begin
    TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida := -1;
    TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := '';
  end
  else begin
    if not ExisteSalida(TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).IdGestionable,
                               StrToInt(chkSalidas.CheckedValues[0])) then
    begin
      TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida := -1;
      TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := '';
      chkSalidas.UncheckAll;
      Verificar(true, chkSalidas, 'Este ítem de gestión no tiene un modo de notificación.');
    end
    else begin
      if TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida > -1 then
        chkSalidas.Checked[TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida-1] := false;
      TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida := StrToInt(chkSalidas.CheckedValues[0]);
    end;
  end;

  FVerificoParametros := false;

  ParamList.Strings.Clear;

  if (chkGestionables.CheckedValues.Text <> '') then
  begin
    for i:=0 to chkGestionables.Count-1 do
    if chkGestionables.Checked[i] then
      with GetQuery(' SELECT cp_id, cp_nombre, cp_tipo, cp_obligatorio, cp_valordefecto, pl_valor, pl_idlote ' +
                    '  FROM  emi.ipl_parametrolote, comunes.ccp_cartaparametro, comunes.cta_textoarea, comunes.ctc_textocarta, emi.igs_gestionablesalida ' +
                    ' WHERE tc_id = gs_idcartatexto ' +
                    '   AND tc_id = ta_idtextocarta ' +
                    '   AND cp_idtextocarta = tc_id ' +
                    '   AND cp_nombre = pl_parametro(+) ' +
                    '   AND pl_idlote (+) = ' + SqlValue(FIdLote) +
                    '   AND cp_fechabaja IS NULL ' +
                    '   AND ta_fechabaja IS NULL ' +
                    '   AND gs_idmodonotificacion = ' + SqlValue(TInfoGestionable(chkGestionables.Items.Objects[i]).Salida) +
                    '   AND gs_idgestionable = ' + SqlValue(TInfoGestionable(chkGestionables.Items.Objects[i]).IdGestionable) +
                    ' UNION ALL ' +
                    ' SELECT mp_id, mp_nombre, mp_tipo, mp_obligatorio, mp_valordefecto, pl_valor, pl_idlote ' +
                    '  FROM  emi.ipl_parametrolote, emi.imp_mailparametro, emi.igs_gestionablesalida ' +
                    ' WHERE mp_idgestionable = gs_idgestionable ' +
                    '   AND gs_idcartatexto IS NULL ' +
                    '   AND mp_fechabaja IS NULL ' +
                    '   AND mp_nombre = pl_parametro(+) ' +
                    '   AND pl_idlote (+) = ' + SqlValue(FIdLote) +
                    '   AND mp_idmodonotificacion = gs_idmodonotificacion ' +
                    '   AND gs_idmodonotificacion = ' + SqlValue(TInfoGestionable(chkGestionables.Items.Objects[i]).Salida) +
                    '   AND mp_idgestionable = ' + SqlValue(TInfoGestionable(chkGestionables.Items.Objects[i]).IdGestionable)) do
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

  ParamList.Enabled := (ParamList.Strings.Count <> 0);
  if ParamList.Enabled  and btnAceptarParametro.Visible then
    ParamList.Options := ParamList.Options + [goEditing]
  else
    ParamList.Options := ParamList.Options - [goEditing];

  //si es por mail debe especificarse si se utilizan los mails de emision, los del contrato o
  //ambos
//  if btnAceptarParametro.Visible then
//  begin
    chkMailContrato.Checked := (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'A') or
                               (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'C');
    chkMailEmision.Checked := (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'A') or
                               (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'E');

    if get_tipocontacto(TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida) = TIPO_CONTACTO_MAIL then
//    if chkSalidas.Checked[2] then
    begin
      if (not btnAceptarParametro.Visible) or (fpMailSalida.ShowModal = mrOk) then
      begin
        if chkMailContrato.Checked and chkMailEmision.Checked then
        begin
          lblSalidas.Caption := 'Salida - (Mail Contrato-Emisión)';
          TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'A';
        end
        else begin
          if chkMailContrato.Checked then
          begin
            lblSalidas.Caption := 'Salida - (Mail Contrato)';
            TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'C';
          end
          else begin
            lblSalidas.Caption := 'Salida - (Mail Emisión)';
            TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida := 'E';
          end;
        end;
      end
      else begin
        //chkSalidas.Checked[2] := false;
        chkSalidas.UncheckAll;
        lblSalidas.Caption := 'Salida';
      end;
    end
(*    else begin
      chkMailContrato.Checked := false;
      chkMailEmision.Checked := false;
      chkSalidas.UncheckAll;
//      chkSalidas.Checked[2] := false;
      lblSalidas.Caption := 'Salida';
    end;
//  end;
*)
end;

procedure TfrmGeneracionLote.GuardarParametros(aIdLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('delete from emi.ipl_parametrolote where pl_idlote = ' + SqlValue(aIdLote));
  if ParamList.Enabled then
    for i:=0 to ParamList.Strings.Count-1 do
      EjecutarStoreSTEx('emi.gestion.do_guardarparametrolote(:idlote, :idparametro, :valor);',
                        [aIdLote,
                        trim(Copy(ParamList.Strings[i], 1, Pos('=', ParamList.Strings[i])-1)),
                        trim(Copy(ParamList.Strings[i],
                             Pos('=', ParamList.Strings[i])+1,
                             Length(ParamList.Strings[i])-Pos('=', ParamList.Strings[i])+1))]);
end;

procedure TfrmGeneracionLote.btnAceptarMailContactoClick(Sender: TObject);
begin
  Verificar(not (chkMailContrato.Checked or chkMailEmision.Checked), chkMailContrato, 'Debe seleccionar el tipo de email de salida.');
  fpMailSalida.ModalResult := mrOk;
end;

{ TInfoGestionable }

constructor TInfoGestionable.Create(aIdGestionable, aSalida: integer; aMailSalida: string);
begin
  FIdGestionable := aIdGestionable;
  FSalida := aSalida;
  FMailSalida := aMailSalida; 
end;

procedure TfrmGeneracionLote.chkGestionablesClick(Sender: TObject);
begin
  inherited;
  chkSalidas.UncheckAll;
  chkSalidas.Check(IntToStr(TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida));
//  if chkSalidas.Checked[2] then
  if get_tipocontacto(TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).Salida) = TIPO_CONTACTO_MAIL then
  begin
    if (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'A') then
      lblSalidas.Caption := 'Salida - (Mail Contrato-Emisión)'
    else begin
      if (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'C') then
        lblSalidas.Caption := 'Salida - (Mail Contrato)'
      else begin
        if (TInfoGestionable(chkGestionables.Items.Objects[chkGestionables.ItemIndex]).MailSalida = 'E') then
          lblSalidas.Caption := 'Salida - (Mail Emisión)'
        else
          lblSalidas.Caption := 'Salida';
      end;
    end;
  end
  else
    lblSalidas.Caption := 'Salida';
end;

procedure TfrmGeneracionLote.GenerarTareas(aIdLote: Integer);
var
  idevento: integer;
  idtarea: integer;
  idtipoevento: integer;
  idtipotarea: integer;
  idmotivoingreso: integer;
  Obs, desctiposalida: String;
begin
  idevento := 0;
  with GetQueryEx(' SELECT DISTINCT se_id, se_usuario, se_mail, ds_contrato, dg_idgestionable, dg_salidagestion ' +
                  ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, art.use_usuarios, emi.isl_sublote, ' +
                  '      emi.ilo_lote ' +
                  ' WHERE sl_idlote = lo_id ' +
                  '   AND se_id = sl_idusuariogestion ' +
                  '   AND ds_idsublote = sl_id ' +
                  '   AND dg_iddetallesublote = ds_id ' +
                  '   AND ge_id = dg_idgestionable ' +
                  '   AND sl_fechabaja IS NULL ' +
                  '   AND ds_fechabaja IS NULL ' +
                  '   AND dg_fechabaja IS NULL ' +
                  '   AND dg_salidagestion NOT IN (3,4,6) ' +   //No sea mail ni correo ni ventanilla
                  '   AND lo_id = :idlote ', [aIdLote]) do
  try
    while not Eof do
    begin
      getinfoevento(FieldByName('dg_idgestionable').AsInteger, idtipoevento, idtipotarea, idmotivoingreso, Obs);
      if (idtipotarea > 0) then
      begin
        desctiposalida := get_desctipocontacto(FieldByName('dg_salidagestion').AsInteger);
        do_insertartarea(idtipotarea, idmotivoingreso, 0, idtarea, 0, 'N', 'N', FieldByName('se_usuario').AsString, Obs + '(' + desctiposalida + ')', idevento, 0, FieldByName('ds_contrato').AsInteger);
        do_asignartarea(FieldByName('se_id').AsInteger, FieldByName('se_mail').AsString, idtarea, False, False);
        EjecutarSqlSTEx(' UPDATE emi.idg_detallesubloteengestion ' +
                        ' SET dg_idtareasic = :idtarea ' +
                        ' WHERE dg_id in (SELECT dg_id ' +
                                          ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, art.use_usuarios, emi.isl_sublote, ' +
                                          '      emi.ilo_lote ' +
                                          ' WHERE sl_idlote = lo_id ' +
                                          '   AND se_id = sl_idusuariogestion ' +
                                          '   AND ds_idsublote = sl_id ' +
                                          '   AND dg_iddetallesublote = ds_id ' +
                                          '   AND ge_id = dg_idgestionable ' +
                                          '   AND sl_fechabaja IS NULL ' +
                                          '   AND ds_fechabaja IS NULL ' +
                                          '   AND dg_fechabaja IS NULL ' +
                                          '   AND dg_salidagestion NOT IN (3,4,6) ' +   //No sea mail ni correo ni ventanilla
                                          '   AND lo_id = :idlote ' +
                                          '   AND dg_idgestionable = :idgestionable ' +
                                          '   AND ds_contrato = :contrato)',[idtarea, aIdLote, FieldByName('dg_idgestionable').AsInteger, FieldByName('ds_contrato').AsInteger]);
      end;
      Next;
    end;
  finally
    free;
  end;

end;

procedure TfrmGeneracionLote.ArchivoProcesar;
var
  lista : TStringList;
  i : Integer;
begin

  EjecutarSqlST('DELETE EMI.IAL_ARCHIVOLOTE  WHERE AL_USUALTA = '+SqlValue(Sesion.UserID)+
                '   AND AL_NROPC = '+SqlValue(Sesion.WindowsComputerName)+
                '   AND AL_IDLOTE is NULL');

  lista := TStringList.Create;
  try
    lista.LoadFromFile(edArchOrigen.FileName);

    for i:=0 to lista.Count-1 do
    begin
      EjecutarSqlST(' INSERT INTO EMI.IAL_ARCHIVOLOTE( al_id, al_idlote, al_contrato, al_cuit, al_usualta, '+
                    '                                  al_fechaalta, al_nropc) '+
                    '      VALUES (emi.seq_ial_id.NEXTVAL, null, '+SqlValue(lista.Strings[i])+','+
                    '              (SELECT em_cuit FROM afi.aem_empresa, afi.aco_contrato WHERE co_idempresa = em_id '+
                    '                 AND co_contrato = '+SqlValue(lista.Strings[i])+'),'+SqlValue(Sesion.UserID)+','+
                    '              sysdate,'+SqlValue(Sesion.WindowsComputerName)+')');
    end;
    FTieneArchivo := True;
  finally
    lista.Free;
  end;

end;

procedure TfrmGeneracionLote.GuardarLoteArchivo(vIdLote : Integer);
begin
  EjecutarSqlST('UPDATE EMI.IAL_ARCHIVOLOTE SET AL_IDLOTE = '+SqlValue(vIdLote)+
                ' WHERE AL_USUALTA = '+SqlValue(Sesion.UserID)+
                '   AND AL_NROPC = '+SqlValue(Sesion.WindowsComputerName)+
                '   AND AL_IDLOTE is NULL');
end;

end.
