unit unManNomenclador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraNomenclador, Db, SDEngine, PatternEdit, DBIncrementalSearch,
  StdCtrls, Mask, ToolEdit, ArtComboBox, ComCtrls, ToolWin, ExtCtrls,
  Buttons, IntEdit, CurrEdit, Placemnt, artSeguridad, ShortCutControl,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtDBGrid, unArtFrame,
  unFraCodigoDescripcion, unArtDBAwareFrame, QueryToFile, ExportDialog,
  unfraCtbTablas, strutils;

type
  TABMEstado = (aeNone, aeAlta, aeEdicion);

  TfrmManNomenclador = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbAgregar: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    SEP1: TToolButton;
    tbLimpiar: TToolButton;
    SEP2: TToolButton;
    tbImprimir: TToolButton;
    SEP3: TToolButton;
    tbSalir: TToolButton;
    pnlDatos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edCodigo: TPatternEdit;
    Bevel1: TBevel;
    Label5: TLabel;
    fraNomencladorABM: TfraNomenclador;
    edDescripcion: TEdit;
    btnCancelar: TBitBtn;
    btnGuardar: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label8: TLabel;
    esUnEspecialistas: TCurrencyEdit;
    Label9: TLabel;
    edCantAyudantes: TIntEdit;
    edUnAyudantes: TCurrencyEdit;
    edUnAnestesistas: TCurrencyEdit;
    pnlUnidades: TPanel;
    pnlCantidad: TPanel;
    pnlCantEspecialistas: TPanel;
    pnlCantAnestesistas: TPanel;
    Label10: TLabel;
    edUnHonorarios: TCurrencyEdit;
    pnlCantHonorarios: TPanel;
    Bevel4: TBevel;
    Honorarios: TLabel;
    cmbTipoHonorario: TArtComboBox;
    sdqTipoHonorario: TSDQuery;
    dsTipoHonorario: TDataSource;
    Label11: TLabel;
    pnlGastos: TPanel;
    edUnGastos: TCurrencyEdit;
    cmbTipoGastos: TArtComboBox;
    pnlTipoAnestesistas: TPanel;
    pnlTipoAyudantes: TPanel;
    pnlTipoEspecialistas: TPanel;
    pnlTipo: TPanel;
    pnlIncExc: TPanel;
    pnlIncluye: TPanel;
    pnlExcluye: TPanel;
    edIncluye: TMemo;
    edExcluye: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    ShortCutControl: TShortCutControl;
    chkAnestesia: TCheckBox;
    chkHIV: TCheckBox;
    chkAntitetanica: TCheckBox;
    LblQSesiones: TLabel;
    edQSesiones: TIntEdit;
    btnInclusiones: TBitBtn;
    dsInclusiones: TDataSource;
    sdqInclusiones: TSDQuery;
    sdqInclusionesIM_IDNOMENCLADOR: TFloatField;
    sdqInclusionesIM_IDPRACTICAMODULO: TFloatField;
    sdqInclusionesIM_TOPE: TFloatField;
    sdqInclusionesIM_OBSERVACION: TStringField;
    sdqInclusionesIM_EXCLUYENTE: TStringField;
    sdqInclusionesPRACTICA: TStringField;
    sdqInclusionesIM_ESPRACTICA: TStringField;
    ScrollBox1: TScrollBox;
    fpInclusiones: TFormPanel;
    Panel3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel5: TBevel;
    fraNomencladorPrac: TfraNomenclador;
    fraPractica: TfraCodigoDescripcion;
    edTope: TIntEdit;
    chkExcluyente: TCheckBox;
    edObservacion: TEdit;
    rbPractica: TRadioButton;
    rbNomenclador: TRadioButton;
    btnCerrarInclusion: TBitBtn;
    btnQuitarInclusion: TBitBtn;
    btnAgregarInclusion: TBitBtn;
    Panel2: TPanel;
    dbgInclusiones: TArtDBGrid;
    fpHistInclusiones: TFormPanel;
    dgHistInclusiones: TArtDBGrid;
    btnCerrarHist: TBitBtn;
    Bevel6: TBevel;
    sdqHistInclusiones: TSDQuery;
    dsHistInclusiones: TDataSource;
    btnExportarHist: TBitBtn;
    edHistorial: TExportDialog;
    sdqHistInclusionesIM_IDNOMENCLADOR: TFloatField;
    sdqHistInclusionesIM_IDPRACTICAMODULO: TFloatField;
    sdqHistInclusionesIM_TOPE: TFloatField;
    sdqHistInclusionesIM_OBSERVACION: TStringField;
    sdqHistInclusionesIM_EXCLUYENTE: TStringField;
    sdqHistInclusionesPRACTICA: TStringField;
    sdqHistInclusionesIM_ESPRACTICA: TStringField;
    sdqHistInclusionesIM_FECHAALTA: TDateTimeField;
    sdqHistInclusionesIM_USUALTA: TStringField;
    sdqHistInclusionesIM_FECHABAJA: TDateTimeField;
    sdqHistInclusionesIM_USUBAJA: TStringField;
    fraTipo: TfraCtbTablas;
    fraCapitulo: TfraCtbTablas;
    Panel4: TPanel;
    btnHistInclusiones: TSpeedButton;
    Bevel7: TBevel;
    btnHistIncluye: TSpeedButton;
    Bevel8: TBevel;
    btnHistExcluye: TSpeedButton;
    Label12: TLabel;
    Bevel9: TBevel;
    fpHistIncluyeExcluye: TFormPanel;
    Bevel10: TBevel;
    ArtDBGrid1: TArtDBGrid;
    btnCerrarHistIncluyeExcluye: TBitBtn;
    btnExportarHistIncluyeExcluye: TBitBtn;
    dsHistIncluyeExcluye: TDataSource;
    sdqHistIncluyeExcluye: TSDQuery;
    edHistIncluyeExcluye: TExportDialog;
    dsTipoGasto: TDataSource;
    sdqTipoGasto: TSDQuery;
    sdqHistIncluyeExcluyeHN_ID: TFloatField;
    sdqHistIncluyeExcluyeCAMBIO: TStringField;
    sdqHistIncluyeExcluyeHN_INCLUYE: TStringField;
    sdqHistIncluyeExcluyeHN_EXCLUYE: TStringField;
    sdqHistIncluyeExcluyeHN_USUALTA: TStringField;
    sdqHistIncluyeExcluyeFECHAALTA: TDateTimeField;
    Bevel11: TBevel;
    chkCabecera: TCheckBox;
    edUnBioquimica: TCurrencyEdit;
    pnlUnidBioquimica: TPanel;
    Label15: TLabel;
    cmbTipoUnidadBioquimica: TArtComboBox;
    sdqTipoUnidadBioquimica: TSDQuery;
    dsTipoUnidadBioquimica: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAgregarClick(Sender: TObject);
    procedure SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edCodigoEnter(Sender: TObject);
    procedure edUnHonorariosEnter(Sender: TObject);
    procedure btnInclusionesClick(Sender: TObject);
    procedure fpInclusionesClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAgregarInclusionClick(Sender: TObject);
    procedure btnQuitarInclusionClick(Sender: TObject);
    procedure rbPracticaClick(Sender: TObject);
    procedure btnHistInclusionesClick(Sender: TObject);
    procedure btnExportarHistClick(Sender: TObject);
    procedure OnFraCapituloChange(Sender: TObject);
    procedure btnHistIncluyeClick(Sender: TObject);
    procedure btnExportarHistIncluyeExcluyeClick(Sender: TObject);
    procedure chkCabeceraClick(Sender: TObject);
    procedure edUnBioquimicaChange(Sender: TObject);
  private
    ABMEstado :TABMEstado;
    IdNomenclador :Integer;
    bEsNomenclador :Boolean;
    procedure OnNomencladorChange(Sender: TObject);
    procedure LockControls(ALoked : Boolean = True; ALockPK : Boolean = True);
    procedure LockDetValores(ALoked : Boolean = True);
    function Validar : Boolean;
    function ValidarInclusion :Boolean;
    procedure EnableButtons(Enabled : Boolean = True);
    procedure SetBotonCargar;
    procedure AgregarInclusion;
    procedure RefrescarPracticas;
    procedure DoHabilitarBotones;
    procedure Do_BloquearHonorariosYGastos_PorCabecera(bCheckCabecera:Boolean);
    procedure Do_BloquearUnBioquimica_PorCabecera(bCheckCabecera:Boolean);
  public
  end;

const
  TIPOHON_SINHONORARIOS = '12';
  TIPOGS_SINGASTOS      = '11';
  TIPOUNIDADBIOQUIMICA  = '42';  // TK 33995

var
  frmManNomenclador: TfrmManNomenclador;

implementation

uses CustomDlgs, unDmPrincipal, unSesion, General, AnsiSql, StrFuncs, unPrincipal,
     VCLExtra, unRedPres;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuNomencladorCargaManual.Enabled := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.FormCreate(Sender: TObject);
begin
  tbLimpiarClick(Nil);
  fraNomencladorABM.ShowBajas           := True;
  fraNomencladorABM.PresupSinPrestador  := True;
  fraNomencladorABM.OnChange            := OnNomencladorChange;
  fraNomencladorPrac.SoloEspecial1      := True;
  cmbTipoUnidadBioquimica.ReadOnly      := True;       // TK 33995
  cmbTipoUnidadBioquimica.Color         := clBtnFace;

  with fraPractica do
  begin
    TableName    := 'AMED.MPM_PRACTICAMODULO';
    FieldID      := 'PM_ID';
    FieldCodigo  := 'PM_ID';
    FieldDesc    := 'PM_DESCRIPCION';
    FieldBaja    := 'PM_FECHABAJA';
    ShowBajas    := False;
    OrderBy      := 'DESCRIPCION';
  end;

  fraTipo.Clave         := 'NOMEN';
  fraTipo.ShowBajas     := False;

  fraCapitulo.Clave     := 'TNOME';
  fraCapitulo.ShowBajas := False;
  fraCapitulo.OnChange  := OnFraCapituloChange;
  fraNomencladorABM.ShowCabecera := True;

  try
    OpenQuery(sdqTipoHonorario);
    OpenQuery(sdqTipoGasto);
    OpenQuery(sdqTipoUnidadBioquimica);
  except
    on E: Exception do ErrorMsg(E);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.OnNomencladorChange(Sender: TObject);
var sSql: string;
begin
   if fraNomencladorABM.IdNomenclador = 0 then // edCodigo.Text = '' then
      tbLimpiarClick(Nil)
   else begin
      if Assigned(Sender) then
      begin // Cuando se cancela la Edicion, se refrescan los datos y no hace falta correr el Query
        IdNomenclador := fraNomencladorABM.IdNomenclador;
        sdqDatos.Close;
        sdqDatos.ParamByName('pIdNomenclador').AsInteger := IdNomenclador;
        sdqDatos.Open;
      end;
      fraTipo.Codigo              := fraNomencladorABM.Nomenclador;
      fraCapitulo.Codigo          := fraNomencladorABM.Capitulo;
      edCodigo.Text               := fraNomencladorABM.Codigo;
      edDescripcion.Text          := sdqDatos.FieldByName('ON_DESCRIPCION').AsString;
      edIncluye.Text              := AdjustLineBreaks(sdqDatos.FieldByName('ON_INCLUYE').AsString);
      edExcluye.Text              := AdjustLineBreaks(sdqDatos.FieldByName('ON_EXCLUYE').AsString);

      esUnEspecialistas.Value     := sdqDatos.FieldByName('ON_ESPECIALISTAS').AsCurrency;
      edCantAyudantes.Value       := sdqDatos.FieldByName('ON_CANTAYUDANTES').AsInteger;
      edUnAyudantes.Value         := sdqDatos.FieldByName('ON_AYUDANTES').AsCurrency;
      edUnAnestesistas.Value      := sdqDatos.FieldByName('ON_ANESTESISTAS').AsCurrency;
      edUnHonorarios.Value        := sdqDatos.FieldByName('ON_HONORARIOS').AsCurrency;
      cmbTipoHonorario.FieldValue := sdqDatos.FieldByName('ON_TIPOHONORARIO').AsString;
      edUnGastos.Value            := sdqDatos.FieldByName('ON_GASTOS').AsCurrency;
      cmbTipoGastos.FieldValue    := sdqDatos.FieldByName('ON_TIPOGASTO').AsString;

      tbModificar.Enabled         := tbModificar.Tag = 0;
      tbEliminar.Enabled          := tbEliminar.Tag  = 0;
      tbImprimir.Enabled          := tbImprimir.Tag  = 0;

      // TK 33995
      edUnBioquimica.Value               := sdqDatos.FieldByName('ON_UNIDADBIOQUIMICA').AsCurrency;
      cmbTipoUnidadBioquimica.FieldValue := sdqDatos.FieldByName('ON_TIPOUNIDADBIOQUIMICA').AsString;

      chkanestesia.Checked        := sdqDatos.FieldByName ('ON_ANESTESIA').AsString = 'S';
      chkHIV.Checked              := sdqDatos.FieldByName ('ON_HIV').AsString = 'S';
      chkantitetanica.Checked     := sdqDatos.FieldByName ('ON_ANTITETANICA').AsString = 'S';
      edQSesiones.text            := sdqDatos.FieldByName ('ON_SESIONES').AsString;
      chkCabecera.Checked         := sdqDatos.FieldByName ('ON_CABECERA').AsString = 'S';

      DoHabilitarBotones;

      sSql := 'select substr(tb_especial1, 2, 1) ' +
              '  from art.ctb_tablas ' +
              ' where tb_clave = ''TNOME'' and tb_codigo = :cod ';

      if (ValorSqlEx(sSql, [fraNomencladorABM.Capitulo]) = 'S') and (Seguridad.Claves.IsActive('ModifCapitulosNPNBNQNO') = false) then
        tbModificar.Enabled := false;

      {if (fraNomencladorABM.Capitulo = 'NP') or (fraNomencladorABM.Capitulo = 'NB') or (fraNomencladorABM.Capitulo = 'NQ') or (fraNomencladorABM.Capitulo = 'NO') then
      begin
        if Seguridad.Claves.IsActive('ModifCapitulosNPNBNQNO') = false then
          tbModificar.Enabled := false;
      end;}
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.LockControls(ALoked: Boolean = True; ALockPK : Boolean = True);
var
  AColor : TColor;
begin
  //------------------------------------------------------------------------
  // La PK
  //------------------------------------------------------------------------
  VCLExtra.LockControls([fraTipo, fraCapitulo, edCodigo], ALoked or ALockPK);

  //------------------------------------------------------------------------
  // Los Datos
  //------------------------------------------------------------------------
  edDescripcion.ReadOnly      := ALoked;
  edIncluye.ReadOnly          := ALoked;
  edExcluye.ReadOnly          := ALoked;

  if ALoked then
     LockDetValores(True)
  else
     LockDetValores((fraCapitulo.sdqDatos.Active and (leftstr(fraCapitulo.Especial1,1) = 'N')));

  if ALoked then
     AColor := clBtnFace
  else
     AColor := clWindow;

  edDescripcion.Color         := AColor;
  edIncluye.Color             := AColor;
  edExcluye.Color             := AColor;

  //------------------------------------------------------------------------
  btnCancelar.Enabled         := Not ALoked;
  btnGuardar.Enabled          := Not ALoked;
  btnAgregarInclusion.Enabled := Not Aloked;
  btnQuitarInclusion.Enabled  := Not Aloked;
  fraNomencladorABM.ReadOnly  := Not ALoked;

  //------------------------------------------------------------------------
  // Los Controles Nuevos (by Rama 23/9/2002)
  //------------------------------------------------------------------------
  chkAnestesia.Enabled := Not ALoked;
  chkHIV.Enabled := Not ALoked;
  chkAntitetanica.Enabled := Not ALoked;
  edQSesiones.ReadOnly      := ALoked;
  edQSesiones.Color := AColor;
  //------------------------------------------------------------------------
  //------------------------------------------------------------------------
  chkCabecera.Enabled := not ALoked;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.LockDetValores(ALoked: Boolean);
var
  AColor : TColor;
begin
  esUnEspecialistas.ReadOnly  := ALoked;
  edCantAyudantes.ReadOnly    := ALoked;
  edUnAyudantes.ReadOnly      := ALoked;
  edUnAnestesistas.ReadOnly   := ALoked;
  edUnHonorarios.ReadOnly     := ALoked;
  cmbTipoHonorario.ReadOnly   := ALoked;
  edUnGastos.ReadOnly         := ALoked;
  cmbTipoGastos.ReadOnly      := ALoked;
  edUnBioquimica.ReadOnly     := ALoked;       // TK 33995

  if ALoked then
     AColor := clBtnFace
  else
     AColor := clWindow;

  esUnEspecialistas.Color     := AColor;
  edCantAyudantes.Color       := AColor;
  edUnAyudantes.Color         := AColor;
  edUnAnestesistas.Color      := AColor;
  edUnHonorarios.Color        := AColor;
  cmbTipoHonorario.Color      := AColor;
  edUnGastos.Color            := AColor;
  cmbTipoGastos.Color         := AColor;
  edUnBioquimica.Color        := AColor;    // TK 33995

end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.tbLimpiarClick(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    ABMEstado := aeNone;
    fraNomencladorABM.Limpiar;
    fraNomencladorABM.SetFocus;
    tbModificar.Enabled      := False;
    tbEliminar.Enabled       := False;
    tbImprimir.Enabled       := False;
  end;
  IdNomenclador               := 0;
  fraTipo.Clear;
  fraCapitulo.Clear;
  edCodigo.Clear;
  edDescripcion.Clear;
  edIncluye.Lines.Clear;
  edExcluye.Lines.Clear;
  esUnEspecialistas.Clear;
  edCantAyudantes.Clear;
  edUnAyudantes.Clear;
  edUnAnestesistas.Clear;
  edUnHonorarios.Clear;
  edUnBioquimica.Clear;
  cmbTipoUnidadBioquimica.FieldValue := '';   // TK 33995
  cmbTipoHonorario.FieldValue := '';
  edUnGastos.Text             := '';
  cmbTipoGastos.FieldValue    := '';
  chkanestesia.Checked        := False;
  chkHIV.Checked              := False;
  chkantitetanica.Checked     := False;
  chkCabecera.Checked         := False;
  edQSesiones.text            := '1';
  RefrescarPracticas;
  LockControls;
  DoHabilitarBotones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.tbAgregarClick(Sender: TObject);
begin
  fraNomencladorABM.Limpiar;
  tbLimpiarClick(Nil);   // Limpia los Datos
  LockControls(False, False);   // Desbloquea los Controles
  ABMEstado := aeAlta;
  fraTipo.edCodigo.SetFocus;
  EnableButtons(False);
  IdNomenclador := ValorSqlInteger('SELECT max(on_id) + 1 FROM son_nomenclador');
  RefrescarPracticas;
  DoHabilitarBotones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
begin
   Component.Tag := 1; // Para el Toolbar
                       // Para no tener que ejecutar un Query c/vez que habilito on TToolButton
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.tbModificarClick(Sender: TObject);
begin
   if not fraNomencladorABM.sdqDatosON_FECHABAJA.IsNull then
      if MsgBox('El registro seleccionado esta dado de baja' + #13 + '¿Desea rehabilitarlo?', MB_ICONQUESTION + MB_YESNO) = IDNO then
         Exit;

   ABMEstado := aeEdicion;
   LockControls(False);
   EnableButtons(False);
   edDescripcion.SetFocus;

   // TK 33995
   edUnBioquimica.ReadOnly          := (fraNomencladorABM.Capitulo <> 'UB');
   if (fraNomencladorABM.Capitulo = 'UB') then
     edUnBioquimica.Color          := clWindow
   else
     edUnBioquimica.Color          := clBtnFace;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.tbEliminarClick(Sender: TObject);
var
  Sql : String;
begin
   if not fraNomencladorABM.sdqDatosON_FECHABAJA.IsNull then
      MsgBox('El registro seleccionado ya ha sido dado de baja con anterioridad.', MB_ICONEXCLAMATION)

   else if ExisteSql('SELECT 1 FROM svp_valorprestador ' +
                     ' WHERE vp_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador) +
                       ' AND vp_vigenciahasta IS NULL AND vp_fechabaja IS NULL ') then
      MsgBox('Existen prestadores con registros activos para este Nomenclador.', MB_ICONEXCLAMATION)

   else if MsgBox('Se dispone a dar de baja el registro.' + #13 + '¿Esta usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    try
      Sql := 'UPDATE son_nomenclador ' +
               ' SET on_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                   ' on_fechabaja = ActualDate ' +
             ' WHERE on_id = ' + SqlInt(IdNomenclador);
      EjecutarSql(Sql);
      fraNomencladorABM.SetColors(clRed);
    except
      on E: Exception do ErrorMsg(E);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnGuardarClick(Sender: TObject);
var
  Sql : String;
begin
   if Validar then
   begin
     if (edUnHonorarios.Value = 0) then
        cmbTipoHonorario.FieldValue := TIPOHON_SINHONORARIOS;

     if (edUnGastos.Value = 0) then
        cmbTipoGastos.FieldValue := TIPOGS_SINGASTOS;

     //-------------------------------------------------------------------------
     if ABMEstado = aeAlta then
     begin
        if edCodigo.ReadOnly then
        begin
            Sql := 'SELECT max(to_number(on_codigo)) FROM son_nomenclador ' +
                   ' WHERE on_nomenclador = ' + SqlValue(fraTipo.Codigo) +
                     ' AND on_capitulo = ' + SqlValue(fraCapitulo.Codigo);
            edCodigo.Text := IntToStr(IncSql(Sql)); // Lo hace así de sencillo porque se supone que este ABM lo va a manejar un solo Usuario
        end;
        //----------------------------------------------------------------------
        Sql := 'INSERT INTO son_nomenclador ' +
               '(on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion, ' +
               ' on_incluye, on_excluye, on_especialistas, on_cantayudantes, on_ayudantes, ' +
               ' on_anestesistas, on_honorarios, on_tipohonorario, on_gastos, on_tipogasto, ' +
               ' on_anestesia, on_hiv, on_antitetanica, on_sesiones, on_usualta, on_fechaalta, ' +
               ' on_cabecera, on_unidadbioquimica, on_tipoUnidadBioquimica ) VALUES ( ' +
               SqlInt(IdNomenclador) + ',' + SqlValue(fraTipo.Codigo) + ',' +
               SqlValue(fraCapitulo.Codigo) + ',' + SqlValue(edCodigo.Text) + ',' +
               SqlString(edDescripcion.Text, True) + ', ' + SqlString(edIncluye.Text, True) + ', ' +
               SqlString(edExcluye.Text, True) + ', ' + SqlNumber(esUnEspecialistas.Value) + ', ' +
               edCantAyudantes.TextSql + ', ' + SqlNumber(edUnAyudantes.Value) + ', ' +
               SqlNumber(edUnAnestesistas.Value) + ', ' + SqlNumber(edUnHonorarios.Value) + ', ''' +
               cmbTipoHonorario.FieldValue + ''', ' +  SqlNumber(edUnGastos.Value) + ', ''' +
               cmbTipoGastos.FieldValue + ''',' + SqlBoolean(chkanestesia.checked) + ',' +
               SqlBoolean(chkhiv.checked) + ',' + SqlBoolean(chkantitetanica.checked,True,'S','N') + ',' +
               edQSesiones.TextSql + ',' + SqlValue(Sesion.UserID) + ', ActualDate, ' +
               SqlBoolean(chkCabecera.checked) + ',' + SqlNumber(edUnBioquimica.Value) + ',''' + cmbTipoUnidadBioquimica.FieldValue + ''')';   // TK 33995
     end else if ABMEstado = aeEdicion then
        Sql := 'UPDATE son_nomenclador ' +
                 ' SET on_descripcion = ' + SqlString(edDescripcion.Text, True) + ', ' +
                     ' on_incluye = ' + SqlString(edIncluye.Text, True) + ', ' +
                     ' on_excluye = ' + SqlString(edExcluye.Text, True) + ', ' +
                     ' on_especialistas = ' + SqlNumber(esUnEspecialistas.Value) + ', ' +
                     ' on_cantayudantes = ' + edCantAyudantes.TextSql + ', ' +
                     ' on_ayudantes = ' + SqlNumber(edUnAyudantes.Value) + ', ' +
                     ' on_anestesistas = ' + SqlNumber(edUnAnestesistas.Value) + ', ' +
                     ' on_honorarios = ' + SqlNumber(edUnHonorarios.Value) + ', ' +
                     ' on_tipohonorario = ''' + cmbTipoHonorario.FieldValue + ''', ' +
                     ' on_gastos = ' + SqlNumber(edUnGastos.Value) + ', ' +
                     ' on_tipogasto = ''' + cmbTipoGastos.FieldValue + ''', ' +
                     ' on_unidadbioquimica = ' + SqlNumber(edUnBioquimica.Value) + ', ' +                // TK  33995
                     ' on_tipounidadbioquimica = ''' + cmbTipoUnidadBioquimica.FieldValue + ''', ' +
                     ' on_fechabaja = NULL '  + ', ' +
                     ' on_anestesia =' + SqlBoolean(chkanestesia.checked)  + ', ' +
                     ' on_cabecera = ' + SqlBoolean(chkCabecera.checked)   + ', ' +
                     ' on_hiv =' + SqlBoolean(chkhiv.checked)              + ', ' +
                     ' on_antitetanica =' + SqlBoolean(chkantitetanica.checked)  + ', ' +
                     ' on_sesiones =' + edQSesiones.TextSql      + ',' +
                     ' on_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                     ' on_fechamodif = ActualDate ' +
               ' WHERE on_id = ' + SqlInt(IdNomenclador);
     //----------------------------------------------------------------------
     try
       EjecutarSql(Sql);
       if (ABMEstado = aeAlta) and (edCodigo.ReadOnly) then
       begin
          fraNomencladorABM.Cargar(fraTipo.Codigo, fraCapitulo.Codigo, edCodigo.Text);
          MsgBox('El número de la prestación no nomenclada es ' + edCodigo.Text + '.', MB_ICONINFORMATION);
       end;
       ABMEstado := aeNone;       
       fraNomencladorABM.SetColors(clWindowText);
       OnNomencladorChange(Self);
       LockControls;
       EnableButtons;
     except
       on E: Exception do ErrorMsg(E, 'Error al guardar los cambios.');
     end;
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnCancelarClick(Sender: TObject);
begin
   if ABMEstado = aeAlta then
      tbLimpiarClick(Nil)
   else if ABMEstado = aeEdicion then
      OnNomencladorChange(Nil);

   LockControls;
   EnableButtons;
   ABMEstado := aeNone;
end;
{-------------------------------------------------------------------------------}
function TfrmManNomenclador.Validar: Boolean;
var
  Sql : String;
begin
  Sql := 'SELECT 1 FROM son_nomenclador ' +
         ' WHERE on_id = :idnom ';

  Result := False;
  if fraTipo.IsEmpty then
    InvalidMsg(fraTipo.edCodigo, 'Debe cargar el tipo de nomenclador')

  else if fraCapitulo.IsEmpty then
    InvalidMsg(fraCapitulo, 'Debe cargar el capítulo del nomenclador')

  else if chkCabecera.Checked and not EsCapituloNomencladorNacional(fraCapitulo.Codigo) then   // validacion por el capitulo NN
    InvalidMsg(fraCapitulo, 'Cuando se carga una Cabecera el Capítulo debe pertenecer al N.N.')

  else if (edCodigo.Text = '') and (not edCodigo.ReadOnly) then
    InvalidMsg(edCodigo, 'Debe cargar el código de prestación')

  else if (edDescripcion.Text = '') then
    InvalidMsg(edDescripcion, 'Debe cargar la descripción de la prestación')

  else if (ABMEstado = aeAlta) and ExisteSqlEx(Sql, [IdNomenclador]) then
    InvalidMsg(fraTipo.edCodigo, 'Ya existe una prestación con el mismo tipo, capítulo y código')

  else if (leftstr(fraCapitulo.Especial1,1) <> 'N') and (not chkCabecera.Checked) and
          (edUnHonorarios.Value = 0) and (edUnGastos.Value = 0) then
    InvalidMsg(edUnHonorarios, 'Debe cargar los honorarios o los gastos.')

  else if (leftstr(fraCapitulo.Especial1,1) <> 'N') and (edUnHonorarios.Value > 0) and
          (cmbTipoHonorario.FieldValue = '') then
    InvalidMsg(cmbTipoHonorario, 'Debe cargar el tipo de honorarios.')

  else if (leftstr(fraCapitulo.Especial1,1) <> 'N') and (edUnGastos.Value > 0) and
          (cmbTipoGastos.FieldValue = '') then
    InvalidMsg(cmbTipoGastos, 'Debe cargar el tipo de gastos.')

  else if (fraCapitulo.Value = 'UB') and ((edUnBioquimica.Value = 0) or (edUnBioquimica.Text = '')) then    // TK 33995
    InvalidMsg(edUnBioquimica, 'Debe completar la Unidad Bioquímica')

  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.FormResize(Sender: TObject);
begin
   pnlIncluye.Height := pnlIncExc.Height div 2 - 2;
   pnlExcluye.Top    := pnlIncluye.Height + 4;
   pnlExcluye.Height := pnlIncluye.Height;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.EnableButtons(Enabled: Boolean);
var
  bSelec : Boolean;
begin
  bSelec := fraNomencladorABM.IsSelected;
  tbAgregar.Enabled   := Enabled and (tbAgregar.Tag   = 0);
  tbModificar.Enabled := Enabled and (tbModificar.Tag = 0) and bSelec;
  tbEliminar.Enabled  := Enabled and (tbEliminar.Tag  = 0) and bSelec;
  tbLimpiar.Enabled   := Enabled and (tbLimpiar.Tag   = 0);
  tbImprimir.Enabled  := Enabled and (tbImprimir.Tag  = 0) and bSelec;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.edCodigoEnter(Sender: TObject);
begin
   if (ABMEstado = aeAlta) then
   begin
     if (fraCapitulo.Codigo = 'PN') then
     begin
        edCodigo.ReadOnly := True;
        edCodigo.Color    := clBtnFace;
        edCodigo.TabStop  := False;
        edCodigo.Text     := '';
     end
     else begin
        edCodigo.ReadOnly := False;
        edCodigo.Color    := clWindow;
        edCodigo.TabStop  := True;
     end;
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.edUnHonorariosEnter(Sender: TObject);
begin
  if (ABMEstado <> aeNone) and (not esUnEspecialistas.ReadOnly) and (not chkCabecera.checked) then
  begin
    if (esUnEspecialistas.Value <> 0) or (edUnAyudantes.Value <> 0) or (edUnAnestesistas.Value <> 0) then
    begin
       edUnHonorarios.ReadOnly := True;
       edUnHonorarios.Color    := clBtnFace;
       edUnHonorarios.TabStop  := False;
       edUnHonorarios.Value    := esUnEspecialistas.Value + edUnAyudantes.Value + edUnAnestesistas.Value;
    end
    else begin
       edUnHonorarios.ReadOnly := False;
       edUnHonorarios.Color    := clWindow;
       edUnHonorarios.TabStop  := True;
    end;
  end;
end;
{-------camarillo - inclusiones del nomenclador---------------------------------}
procedure TfrmManNomenclador.SetBotonCargar;
var
  sSql :String;
begin
  sSql := 'SELECT 1 FROM amed.mim_incluyemodulo ' +
          ' WHERE im_idnomenclador = :idnom ' +
            ' AND im_fechabaja IS NULL';
  btnInclusiones.Font.Color := IIF(ExisteSqlEx(sSql, [IdNomenclador]), clRed, clWindowText);
  btnInclusiones.Enabled    := Seguridad.Activar(btnInclusiones) and (IdNomenclador <> 0);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnInclusionesClick(Sender: TObject);
begin
  RefrescarPracticas;
  fpInclusiones.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.fpInclusionesClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqInclusiones.Close;
  SetBotonCargar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnAgregarInclusionClick(Sender: TObject);
begin
  if ValidarInclusion then AgregarInclusion;
end;
{-------------------------------------------------------------------------------}
function TfrmManNomenclador.ValidarInclusion :Boolean;
var
  sSql :String;
begin
  Verificar(not(bEsNomenclador) and fraPractica.IsEmpty,
            fraPractica, 'Debe ingresar la práctica.');
  Verificar(bEsNomenclador and (fraNomencladorPrac.IdNomenclador = 0),
            fraNomencladorPrac, 'Debe ingresar el nomenclador.');
  sSql := 'SELECT 1 FROM amed.mim_incluyemodulo ' +
          ' WHERE im_idnomenclador = ' + SqlInt(IdNomenclador) +
            ' AND im_idpracticamodulo = ' + IIF(bEsNomenclador,
                                                SqlValue(fraNomencladorPrac.IdNomenclador),
                                                SqlValue(fraPractica.edCodigo.Text)) +
            ' AND im_espractica = ' + IIF(bEsNomenclador, '''N''', '''S''') +
            ' AND im_fechabaja IS NULL ';
  if ExisteSql(sSql) then
  begin
    MsgBox('Ya existe ésta práctica para el nomenclador seleccionado.',MB_ICONEXCLAMATION);
    Result := False;
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.AgregarInclusion;
var
  sSql :String;
begin
  sSql := 'INSERT INTO amed.mim_incluyemodulo ' +
          '(im_idnomenclador, im_idpracticamodulo, im_tope, im_observacion, ' +
          ' im_excluyente, im_usualta, im_fechaalta, im_espractica) VALUES (' +
          SqlInt(IdNomenclador) + ',' +
          IIF(bEsNomenclador,
              SqlValue(fraNomencladorPrac.IdNomenclador),
              SqlValue(fraPractica.edCodigo.Text)) + ',' +
          SqlInt(edTope.Value) + ',' + SqlValue(edObservacion.Text) + ',' +
          '''' + IIF(chkExcluyente.Checked, 'S', 'N') + ''' , ' +
          SqlValue(Sesion.UserID) + ', ActualDate, ' +
          IIF(bEsNomenclador, '''N''', '''S''') + ')';
  EjecutarSql(sSql);
  RefrescarPracticas;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnQuitarInclusionClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqInclusiones.Active and
     not(sdqInclusiones.Eof) and
    (MsgBox('¿Confirma la baja de la Práctica seleccionada?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  then begin
    sSql := 'UPDATE amed.mim_incluyemodulo ' +
              ' SET im_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' im_fechabaja = Actualdate ' +
             'WHERE im_idnomenclador = ' + SqlInt(sdqInclusionesIM_IDNOMENCLADOR.AsInteger) +
              ' AND im_idpracticamodulo = ' + SqlInt(sdqInclusionesIM_IDPRACTICAMODULO.AsInteger) +
              ' AND im_espractica = ' + SqlValue(sdqInclusionesIM_ESPRACTICA.AsString);
    EjecutarSql(sSql);
    sdqInclusiones.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.RefrescarPracticas;
begin
  fraPractica.Clear;
  fraNomencladorPrac.Limpiar;
  edTope.Clear;
  chkExcluyente.Checked := False;
  edObservacion.Text    := '';
  sdqInclusiones.Close;
  sdqInclusiones.ParamByName('IdNomenclador').AsInteger := IdNomenclador;
  sdqInclusiones.Open;
  SetBotonCargar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.rbPracticaClick(Sender: TObject);
begin
  fraNomencladorPrac.Limpiar;
  fraPractica.Clear;
  fraNomencladorPrac.Visible := rbNomenclador.Checked;
  fraPractica.Visible        := rbPractica.Checked;
  bEsNomenclador             := rbNomenclador.Checked;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.DoHabilitarBotones;
var
  sSql, sAcc: String;
begin
  SetBotonCargar;
  sSql := 'SELECT 1 FROM amed.mim_incluyemodulo ' +
          ' WHERE im_idnomenclador = :idnom ' +
            ' AND im_fechabaja IS NOT NULL';
  btnHistInclusiones.Enabled := (ABMEstado = aeNone) and
                                 Seguridad.Activar(btnHistInclusiones) and
                                 ExisteSqlEx(sSql, [IdNomenclador]);
  sSql := 'SELECT 1 FROM art.shn_historiconomenclador ' +
          ' WHERE hn_idnomenclador = :idnom ';
  sAcc := ' AND hn_accion IN (''I'', ''T'') ';
  btnHistIncluye.Enabled := (ABMEstado = aeNone) and
                             Seguridad.Activar(btnHistIncluye) and
                             ExisteSqlEx(sSql + sAcc, [IdNomenclador]);
  sAcc := ' AND hn_accion IN (''E'', ''T'') ';
  btnHistExcluye.Enabled := (ABMEstado = aeNone) and
                             Seguridad.Activar(btnHistExcluye) and
                             ExisteSqlEx(sSql + sAcc, [IdNomenclador]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnHistInclusionesClick(Sender: TObject);
begin
  with sdqHistInclusiones do
  try
    ParamByName('idnomenclador').AsInteger := IdNomenclador;
    Open;
    fpHistInclusiones.ShowModal;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnExportarHistClick(Sender: TObject);
begin
  edHistorial.Title := 'Historial de inclusiones - Prestación: ' +
                        fraNomencladorABM.Nomenclador + ' ' + fraNomencladorABM.Capitulo + ' ' +
                        fraNomencladorABM.Codigo + ' ' + fraNomencladorABM.Descripcion;
  edHistorial.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.OnFraCapituloChange(Sender: TObject);
begin
  if ABMEstado <> aeNone then
    LockDetValores(leftstr(fraCapitulo.Especial1,1) = 'N');

  // TK 33995
  edUnBioquimica.ReadOnly := (fraCapitulo.Value <> 'UB');
  if (fraCapitulo.Value = 'UB') and not chkCabecera.Checked then       // TK 33995
  begin
    edUnBioquimica.Color             := clWindow;
    edUnBioquimica.ReadOnly          := False;
  end
  else begin
    edUnBioquimica.Value             := 0;
    edUnBioquimica.Color             := clBtnFace;
    edUnBioquimica.ReadOnly          := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnHistIncluyeClick(Sender: TObject);
begin
  with sdqHistIncluyeExcluye do
  try
    ParamByName('idnomenclador').AsInteger := IdNomenclador;
    Open;
    fpHistIncluyeExcluye.ShowModal;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.btnExportarHistIncluyeExcluyeClick(Sender: TObject);
begin
  edHistIncluyeExcluye.Title := 'Historial de incluye/excluye - Prestación: ' +
                                fraNomencladorABM.Nomenclador + ' ' + fraNomencladorABM.Capitulo + ' ' +
                                fraNomencladorABM.Codigo + ' ' + fraNomencladorABM.Descripcion;
  edHistIncluyeExcluye.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManNomenclador.chkCabeceraClick(Sender: TObject);
begin
  if chkCabecera.Checked then
  begin
    chkCabecera.Font.Style := chkCabecera.Font.Style + [fsBold];
    Do_BloquearHonorariosYGastos_PorCabecera(True);
    Do_BloquearUnBioquimica_PorCabecera(True);
  end
  else begin
    chkCabecera.Font.Style := chkCabecera.Font.Style - [fsBold];
    Do_BloquearHonorariosYGastos_PorCabecera(False);
    Do_BloquearUnBioquimica_PorCabecera(False);
  end;
end;

procedure TfrmManNomenclador.Do_BloquearHonorariosYGastos_PorCabecera(bCheckCabecera: Boolean);
  procedure HabilitarHyG(cColor:TColor; sTipoHon, sTipoGs: string; bReadOnly: boolean);
  begin
    edUnHonorarios.Color        := cColor;
    edUnGastos.Color            := cColor;
    cmbTipoHonorario.Color      := cColor;
    cmbTipoGastos.Color         := cColor;
    cmbTipoHonorario.FieldValue := sTipoHon;
    cmbTipoGastos.FieldValue    := sTipoGs;
    edUnHonorarios.ReadOnly     := bReadOnly;
    edUnGastos.ReadOnly         := bReadOnly;
    cmbTipoHonorario.ReadOnly   := bReadOnly;
    cmbTipoGastos.ReadOnly      := bReadOnly;
    edUnHonorarios.Value        := 0;
    edUnGastos.Value            := 0;
  end;

begin
  if bCheckCabecera then
    HabilitarHyG(clBtnFace, TIPOHON_SINHONORARIOS, TIPOGS_SINGASTOS, True)  // No habilita
  else begin
    if (fraCapitulo.Value = 'UB') then
      HabilitarHyG(clBtnFace, TIPOHON_SINHONORARIOS, TIPOGS_SINGASTOS, True)  // No habilita
    else
      HabilitarHyG(clWindow, '', '', False)   // Habilita
  end;
end;

procedure TfrmManNomenclador.Do_BloquearUnBioquimica_PorCabecera(bCheckCabecera: Boolean);
begin
  if bCheckCabecera then
  begin
    edUnBioquimica.Value             := 0;
    edUnBioquimica.Color             := clBtnFace;
    edUnBioquimica.ReadOnly          := True;
  end
  else // no es cabecera
  begin
    if (fraCapitulo.Value = 'UB') then
    begin
      edUnBioquimica.Color             := clWindow;            
      edUnBioquimica.ReadOnly          := False;
    end
    else begin
      edUnBioquimica.Value             := 0;
      edUnBioquimica.Color             := clBtnFace;
      edUnBioquimica.ReadOnly          := True;
    end;
  end;
end;

procedure TfrmManNomenclador.edUnBioquimicaChange(Sender: TObject);
begin
  if (edUnBioquimica.Value > 0) then
    cmbTipoUnidadBioquimica.FieldValue := TIPOUNIDADBIOQUIMICA      // esta hardcodeado, ver si en part es '42'
  else
    cmbTipoUnidadBioquimica.FieldValue := '';
end;

end.
