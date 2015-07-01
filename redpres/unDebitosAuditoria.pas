unit unDebitosAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, SinEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, CurrEdit, unfraNomenclador,
  Mask, ToolEdit, DateComboBox, DBCtrls;

type
  TfrmDebitosAuditoria = class(TfrmCustomGridABM)
    ToolButton1: TToolButton;
    pnlVolante: TPanel;
    fraMotivoABM: TfraCodigoDescripcion;
    edSiniestroABM: TSinEdit;
    edDebitoABM: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblDatSin: TLabel;
    tbFinAuditoria: TToolButton;
    tbAvalarDebitos: TToolButton;
    tbRechazarDebitos: TToolButton;
    ToolButton10: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    ToolButton2: TToolButton;
    tbAplicarDebito: TToolButton;
    ToolButton9: TToolButton;
    chkObsIntABM: TCheckBox;
    dcFPrestacionABM: TDateComboBox;
    Label4: TLabel;
    fraNomencladorABM: TfraNomenclador;
    lbPrestacion: TLabel;
    edValorABM: TCurrencyEdit;
    Label5: TLabel;
    edCantidadABM: TCurrencyEdit;
    Label6: TLabel;
    rgOriginal: TRadioGroup;
    btnVerOrig: TButton;
    Label7: TLabel;
    sdqOriginales: TSDQuery;
    dsOriginales: TDataSource;
    fpObsDebOriginal: TFormPanel;
    mObservDebOrig: TMemo;
    Label8: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    cmbOriginales: TArtComboBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure edSiniestroABMExit(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbFinAuditoriaClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbAvalarDebitosClick(Sender: TObject);
    procedure tbRechazarDebitosClick(Sender: TObject);
    procedure tbAplicarDebitoClick(Sender: TObject);
    procedure chkObsIntABMClick(Sender: TObject);
    procedure fraNomencladorABMcmbDescripcionButtonClick(Sender: TObject);
    procedure OnNomencladorChange(Sender: TObject);
    procedure dcFPrestacionABMExit(Sender: TObject);
    procedure dcFPrestacionABMEnter(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure edCantidadABMEnter(Sender: TObject);
    procedure edCantidadABMExit(Sender: TObject);
    procedure btnVerOrigClick(Sender: TObject);
    procedure rgOriginalClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    FVolante, FIdAplicado, FSiniestro, FOrden, FRecaida, FPrestadorVol: Integer;
    FEstado: String;
    FAvalar, FSoloLectura, FMostrarInternos: Boolean;
    dTempo: TDate;
    eCantidad: Extended;
    procedure SetVolante(const Value: Integer);
    procedure SetNuevoEstado(sEstado: String; bAuditado, bAuditConDebito,
                             bNoRequiereAud, bCerrar: Boolean);
    procedure DoHabilitarBotones;
    procedure DoCalcularValorPrestacion;
    function IsVolanteModificarBorrar: Boolean;
    function IsPendienteAuditoria: Boolean;
    function IsMismoUsuarioAuditor: Boolean;
    function IsEstadoUsuarioCorrecto: Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    property Volante: Integer         read FVolante         write SetVolante;
    property Avalar: Boolean          read FAvalar          write FAvalar;
    property SoloLectura: Boolean     read FSoloLectura     write FSoloLectura;
    property Estado: String           read FEstado          write FEstado;
    property Siniestro: Integer       read FSiniestro       write FSiniestro;
    property Orden: Integer           read FOrden           write FOrden;
    property Recaida: Integer         read FRecaida         write FRecaida;
    property PrestadorVol: Integer    read FPrestadorVol    write FPrestadorVol;
    property MostrarInternos: Boolean read FMostrarInternos write FMostrarInternos;
  public
    function Execute(iVolante, iSiniestro, iOrden, iRecaida: Integer;
                     sEstado: String; bAvalar, bSoloLectura, bMostrarInternos: Boolean): Boolean;
    property IdAplicado: Integer    read FIdAplicado    write FIdAplicado;
  end;

var
  frmDebitosAuditoria: TfrmDebitosAuditoria;

implementation

uses unCustomConsulta, AnsiSql, SqlFuncs, unDmPrincipal, CustomDlgs, unSesion,
     General, Math, vclextra, DateUtils;      //, SysInit

{$R *.dfm}

{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.Execute(iVolante, iSiniestro, iOrden, iRecaida: Integer;
                                      sEstado: String; bAvalar, bSoloLectura, bMostrarInternos: Boolean): Boolean;
begin
  Estado          := sEstado;
  Avalar          := bAvalar;
  SoloLectura     := bSoloLectura;
  Siniestro       := iSiniestro;
  Orden           := iOrden;
  Recaida         := iRecaida;
  IdAplicado      := 0;
  Volante         := iVolante;
  MostrarInternos := bMostrarInternos;
  PrestadorVol    := ValorSqlIntegerEx('SELECT vo_prestador ' +
                                        ' FROM svo_volantes ' +
                                       ' WHERE vo_volante = :vol', [Volante]);
  tbRefrescarClick(Nil);
  TFloatField(sdqConsulta.FieldByName('dv_valorprestacion')).Currency := True;
  Result := ShowModal = mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.SetVolante(const Value: Integer);
begin
  if (Value <> FVolante) then
  begin
    FVolante            := Value;
    pnlVolante.Caption  := 'Volante actual: ' + IntToStr(FVolante);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT dv_id, dv_siniestro, dv_orden, dv_recaida, dv_observacion, ' +
                 ' DECODE(dv_aplicado, ''S'', ''Aplicado'', ''Sin aplicar'') estado, ma_descripcion, ' +
                 ' art.utiles.armar_siniestro(dv_siniestro, dv_orden, dv_recaida) siniestro, ' +
                 ' dv_aplicado, se_nombre, ma_codigo, ma_id,  dv_fechabaja, tj_nombre, ' +
                 ' dv_numpago, dv_observacioninterna, dv_fechaprestacion, dv_idnomenclador, ' +
                 ' dv_valorprestacion, on_nomenclador, on_capitulo, on_codigo, ' +
                 ' on_nomenclador || ''-'' || on_capitulo || ''-'' || on_codigo prestacion, ' +
                 ' on_descripcion descripcionprest, dv_cantprestacion, dv_original, dv_codoriginal ' +
            ' FROM SIN.sdv_debitosvolantes, SIN.sma_motivosdebitosauditoria, art.use_usuarios, ' +
                 ' art.sex_expedientes, ctj_trabajador, son_nomenclador ' +
           ' WHERE dv_idmotivo = ma_id ' +
             ' AND dv_usualta = se_usuario ' +
             ' AND dv_siniestro = ex_siniestro ' +
             ' AND dv_orden = ex_orden ' +
             ' AND dv_recaida = ex_recaida ' +
             ' AND ex_idtrabajador = tj_id ' +
             ' AND dv_idnomenclador = on_id(+) ' +
             ' AND dv_volante = ' + SqlInt(Volante);

  if not MostrarInternos then
    sSql := sSql + ' AND dv_observacioninterna = ''N'' ';

  if (Siniestro > 0) then
    sSql := sSql  + ' AND dv_siniestro = ' + SqlInt(Siniestro) +
                    ' AND dv_orden = ' + SqlInt(Orden) +
                    ' AND dv_recaida = ' + SqlInt(Recaida);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  DoHabilitarBotones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.FormCreate(Sender: TObject);
begin
  inherited;
  with fraMotivoABM do
  begin
    TableName   := 'sin.sma_motivosdebitosauditoria';
    FieldID     := 'ma_id';
    FieldCodigo := 'ma_codigo';
    FieldDesc   := 'ma_descripcion';
    FieldBaja   := 'ma_fechabaja';
    ShowBajas   := False;
  end;
  fraNomencladorABM.OnChange    := OnNomencladorChange;
  ShowActived                   := False;
  FieldBaja                     := 'dv_fechabaja';
  tbFinAuditoria.ImageIndex     := 40;
  tbAvalarDebitos.ImageIndex    := 34;
  tbRechazarDebitos.ImageIndex  := 48;
  tbAplicarDebito.ImageIndex    := 49;
  tbSalir2.ImageIndex           := 8;
  vclextra.LockControls([cmbOriginales, btnVerOrig, mObservDebOrig]);
  
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbNuevoClick(Sender: TObject);
begin
  if IsEstadoUsuarioCorrecto then
  begin
    LockControl(edSiniestroABM, False);
    inherited;
    DoHabilitarBotones;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.ClearControls;
begin
  edSiniestroABM.Clear;
  fraMotivoABM.Clear;
  edDebitoABM.Lines.Clear;
  lblDatSin.Caption     := '';
  chkObsIntABM.Checked  := False;
  rgOriginal.ItemIndex := 0;
  vclextra.LockControls([cmbOriginales, btnVerOrig]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.LoadControls;
begin
  with sdqconsulta do
  begin
    edSiniestroABM.SetValues(FieldByName('dv_siniestro').AsInteger,
                             FieldByName('dv_orden').AsInteger,
                             FieldByName('dv_recaida').AsInteger);
    edSiniestroABMExit(nil);
    fraMotivoABM.Value     := FieldByName('ma_id').AsString;
    edDebitoABM.Lines.Text := FieldByName('dv_observacion').AsString;
    chkObsIntABM.Checked   := (FieldByName('dv_observacioninterna').AsString = 'S');
    dcFPrestacionABM.Date  := FieldByName('dv_fechaprestacion').AsDateTime;
    edCantidadABM.Value    := FieldByName('dv_cantprestacion').AsCurrency; 
    fraNomencladorABM.Cargar(FieldByName('dv_idnomenclador').AsInteger);
    edValorABM.Value       := FieldByName('dv_valorprestacion').AsCurrency;
    if FieldByName('dv_original').AsString  = 'S' then
      rgOriginal.ItemIndex := 0
    else if FieldByName('dv_original').AsString  = 'N' then
    begin
      rgOriginal.ItemIndex := 1;
      cmbOriginales.FieldValue := FieldByName('dv_codoriginal').AsString;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.Validar: Boolean;
begin
  Verificar(edSiniestroABM.IsEmpty, edSiniestroABM, 'Debe ingresar el siniestro.');
  Verificar((rgOriginal.ItemIndex = -1) and (chkObsIntABM.Checked = false), rgOriginal, 'Debe seleccionar una opción');
  Verificar((rgOriginal.ItemIndex = 1) and (cmbOriginales.FieldValue = ''), cmbOriginales, 'Debe seleccionar un código de la lista');
  Verificar(fraMotivoABM.IsEmpty, fraMotivoABM, 'Debe seleccionar el motivo.');
  Verificar(chkObsIntABM.Checked and (edValorABM.Value = 0), edValorABM,
            'Si es una observación interna, debe ingresar el valor de la prestación observada.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.DoABM: Boolean;
var
  sSql, codigo, codoriginal: String;
  secuencia: integer;
begin
  codoriginal := '';
  secuencia := 0;
  if rgOriginal.ItemIndex = 0 then
  begin
    ssql := ' SELECT to_char(count(dv_codigo) + 1, ''00'') ' +
              ' FROM SIN.sdv_debitosvolantes ' +
             ' WHERE dv_fechabaja IS NULL ' +
               ' AND dv_siniestro = :sin ' +
               ' AND dv_orden = :ord ' +
               ' AND dv_recaida = :rec ' +
               ' AND dv_original = ''S'' ';

    codigo := inttostr(volante) + '-' + Trim(ValorSqlEx(ssql, [edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida]));
    secuencia := 1;
  end
  else
  begin
    ssql := ' SELECT DECODE (NVL (MAX (dv_secuencia), 0), 0, 2, MAX (dv_secuencia) + 1) ' +
              ' FROM SIN.sdv_debitosvolantes ' +
             ' WHERE dv_fechabaja IS NULL ' +
               ' AND dv_siniestro = :sin ' +
               ' AND dv_orden = :ord ' +
               ' AND dv_recaida = :rec ' +
               ' AND dv_codoriginal = :orig ';

    codigo := '';

    if cmbOriginales.FieldValue <> 'Sin original' then
    begin
      With GetQueryEx(ssql, [edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida, cmbOriginales.FieldValue]) do
        secuencia := Fields[0].AsInteger;

      codoriginal := cmbOriginales.FieldValue;
    end;
  end;
  try
    if (ModoABM = maAlta) then
      sSql := 'INSERT INTO sin.sdv_debitosvolantes ' +
              '(dv_volante, dv_siniestro, dv_orden, dv_recaida, dv_idmotivo, ' +
              ' dv_observacion, dv_observacioninterna, dv_fechaprestacion, ' +
              ' dv_idnomenclador, dv_cantprestacion, dv_valorprestacion, ' +
              ' dv_usualta, dv_fechaalta, dv_original, dv_codigo, dv_secuencia, dv_codoriginal) VALUES ( ' +
              SqlInt(Volante) + ',' + SqlInt(edSiniestroABM.Siniestro) + ',' +
              SqlInt(edSiniestroABM.Orden) + ',' + SqlInt(edSiniestroABM.Recaida) + ',' +
              SqlInt(fraMotivoABM.ID) + ',' + SqlValue(edDebitoABM.Lines.Text) + ',' +
              SqlBoolean(chkObsIntABM.Checked) + ',' + SqlDate(dcFPrestacionABM.Date) + ',' +
              SqlInt(fraNomencladorABM.IdNomenclador) + ',' + SqlNumber(edCantidadABM.Value) + ',' +
              SqlNumber(edValorABM.Value) + ',' + SqlValue(Sesion.UserID) + ', Actualdate' + ',' +
              iif(rgOriginal.ItemIndex = 0, QuotedStr('S'), QuotedStr('N')) + ',' + QuotedStr(codigo) + ',' + SqlInt(secuencia, true) + ',' + QuotedStr(codoriginal) + ')'
    else if (ModoABM = maModificacion) then
      sSql := 'UPDATE sin.sdv_debitosvolantes ' +
                ' SET dv_idmotivo = ' + SqlInt(fraMotivoABM.ID) + ',' +
                    ' dv_observacion = ' + SqlValue(edDebitoABM.Lines.Text) + ',' +
                    ' dv_observacioninterna = ' + SqlBoolean(chkObsIntABM.Checked) + ',' +
                    ' dv_fechaprestacion = ' + SqlDate(dcFPrestacionABM.Date) + ',' +
                    ' dv_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador) + ',' +
                    ' dv_cantprestacion = ' + SqlNumber(edCantidadABM.Value) + ',' +
                    ' dv_valorprestacion = ' + SqlNumber(edValorABM.Value) + ',' +
                    ' dv_codoriginal = ' +  QuotedStr(codoriginal) + ',' +
                    ' dv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' dv_fechamodif = ActualDate ' +
              ' WHERE dv_id = ' + SqlInt(sdqConsulta.FieldByName('dv_id').AsInteger)
    else if (ModoABM = maBaja) then
      sSql := 'UPDATE sin.sdv_debitosvolantes ' +
                ' SET dv_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' dv_fechabaja = ActualDate ' +
              ' WHERE dv_id = ' + SqlInt(sdqConsulta.FieldByName('dv_id').AsInteger);

    EjecutarSql(sSql);
    Result := True;
  except
    On E: Exception do
    begin
       ErrorMsg(E);
       Result := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.edSiniestroABMExit(Sender: TObject);
begin
  if edSiniestroABM.IsEmpty then
    lblDatSin.Caption := ''
  else begin
    lblDatSin.Caption := ValorSqlEx('SELECT tj_nombre || '' - '' || ex_fechaaccidente ' +
                                     ' FROM sex_expedientes, ctj_trabajador ' +
                                    ' WHERE ex_idtrabajador = tj_id ' +
                                      ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'') ' +
                                      ' AND ex_siniestro = :sini '  +
                                      ' AND ex_orden = :orden ' +
                                      ' AND ex_recaida = :reca ', [edSiniestroABM.Siniestro,
                                                                   edSiniestroABM.Orden,
                                                                   edSiniestroABM.Recaida]);
    if (lblDatSin.Caption = '') then
    begin
      MsgBox('El siniestro seleccionado no existe o bien se encuentra cerrado, ' +
             'por favor ingrese uno válido', MB_ICONINFORMATION);
      edSiniestroABM.Clear;
      edSiniestroABM.SetFocus;
    end;

    sdqOriginales.Close;
    sdqOriginales.ParamByName('siniestro').AsInteger := edSiniestroABM.Siniestro;
    sdqOriginales.ParamByName('orden').AsInteger := edSiniestroABM.Orden;
    sdqOriginales.ParamByName('recaida').AsInteger := edSiniestroABM.Recaida;
    sdqOriginales.Open;

  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                 var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not(sdqConsulta.FieldByName('dv_fechabaja').IsNull) then
    AFont.Color := clRed
  else if (sdqConsulta.FieldByName('dv_aplicado').AsString = 'S') then
    AFont.Color := clGreen;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbModificarClick(Sender: TObject);
begin
  if IsVolanteModificarBorrar then
  begin
    LockControl(edSiniestroABM, True);
    inherited;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbEliminarClick(Sender: TObject);
begin
  if IsVolanteModificarBorrar then inherited;
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.IsVolanteModificarBorrar: Boolean;
begin
  if IsEstadoUsuarioCorrecto then
    Verificar(not(sdqConsulta.FieldByName('dv_fechabaja').IsNull), nil,
              'El débito se encuentra dado de baja.');
    Verificar(sdqConsulta.FieldByName('dv_aplicado').AsString = 'S', nil,
              'El débito ya ha sido aplicado al volante.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.IsPendienteAuditoria: Boolean;
var
  bEspecial: Boolean;
begin
  bEspecial := (Estado = 'PV') and Seguridad.Claves.IsActive('PermisoEspecialABM');
  Verificar(not(bEspecial) and (Estado <> 'PA'), nil, 'El volante no se encuentra pendiente de auditar.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbFinAuditoriaClick(Sender: TObject);
//finalizar la auditoria, el volante queda en estado "Pendiente de Aval"
var
  sSql: String;
begin
  sSql := 'SELECT 1 FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_volante = :volante ' +
            ' AND dv_fechabaja IS NULL ';
  Verificar(not(ExisteSqlEx(sSql, [Volante])),
            nil, 'Aún no se ha ingresado ningún débito.');

  if IsEstadoUsuarioCorrecto and
     MsgAsk('¿Confirma finalizar la auditoría para el volante seleccionado?') then
    SetNuevoEstado('PV', True, True, False, True); //pendiente de aval
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.DoHabilitarBotones;
var
  bHayDebito, bEspecial: Boolean;
begin
  bHayDebito                := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
  bEspecial                 := Seguridad.Claves.IsActive('PermisoEspecialABM');
  tbNuevo.Enabled           := not(SoloLectura) and (bEspecial or not(Avalar)) and
                               Seguridad.Activar(tbNuevo);
  tbModificar.Enabled       := not(SoloLectura) and not(Avalar) and
                               Seguridad.Activar(tbModificar) and bHayDebito;
  tbEliminar.Enabled        := not(SoloLectura) and (bEspecial or not(Avalar)) and
                               Seguridad.Activar(tbEliminar) and bHayDebito;
  tbImprimir.Enabled        := Seguridad.Activar(tbImprimir) and bHayDebito;
  tbExportar.Enabled        := Seguridad.Activar(tbExportar) and bHayDebito;
  tbFinAuditoria.Enabled    := not(SoloLectura) and not(Avalar) and Seguridad.Activar(tbFinAuditoria) and bHayDebito;
  tbAvalarDebitos.Enabled   := not(SoloLectura) and Avalar and Seguridad.Activar(tbAvalarDebitos);
  tbRechazarDebitos.Enabled := not(SoloLectura) and Avalar and Seguridad.Activar(tbRechazarDebitos);
  tbAplicarDebito.Enabled   := (Siniestro > 0) and Seguridad.Activar(tbAplicarDebito);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbAvalarDebitosClick(Sender: TObject);
begin
  if MsgAsk('¿Confirma que los débitos ingresados para el volante son correctos?') then
    SetNuevoEstado('P', True, True, False, True); //el volante queda "Pendiente" - listo para liquidar..
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.SetNuevoEstado(sEstado: String; bAuditado, bAuditConDebito,
                                              bNoRequiereAud, bCerrar: Boolean);
var
  sSql, sAval: String;
begin
  try
    BeginTrans;

    if (sEstado = 'P') then
      sAval := ' vo_fechaavaldebito = ActualDate,' +
               ' vo_usuavaldebito = ' + SqlValue(Sesion.UserID) + ','
    else if (sEstado = 'PV') then
      sAval := ' vo_fechaauditoria = ActualDate, ' +
               ' vo_usuarioauditoria = ' + SqlValue(Sesion.UserID) + ',' +
               ' vo_usuauditor = Null, ' +
               ' vo_fecusuauditor = Null, '
    else if (sEstado = 'PA') then
      sAval := ' vo_fechamodif = ActualDate, ' +
               ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',';

    sSql := 'UPDATE svo_volantes' +
              ' SET vo_auditado = ' + SqlBoolean(bAuditado) + ',' +
                  ' vo_auditcondebito = ' + SqlBoolean(bAuditConDebito, True, 'S', '') + ',' + 
                  ' vo_norequiereaudi = ' + SqlBoolean(bNoRequiereAud) + ',' + sAval +
                  ' vo_estado = ' + SqlValue(sEstado) +
            ' WHERE vo_volante = ' + SqlInt(Volante);
    EjecutarSqlST(sSql);

    sSql := 'INSERT INTO SIN.shd_historicodebitos ' +
            '(hd_volante, hd_estado, hd_usualta, hd_fechaalta) VALUES ' +
            '(:volante, :estado, :usuario, SysDate)';
    EjecutarSqlSTEx(sSql, [Volante, sEstado, Sesion.UserID]);

    CommitTrans;
    if bCerrar then
    begin
      MsgBox('Cambio de estado del volante realizado exitosamente.', MB_ICONINFORMATION);
      ModalResult := mrOk;
    end;
  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar cambiar el estado del volante.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbRechazarDebitosClick(Sender: TObject);
begin
  if MsgAsk('¿Confirma RECHAZAR los débitos ingresados para el volante?') then
    SetNuevoEstado('PA', False, False, True, True); //vuelve a "Pendiente de auditar"
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.IsMismoUsuarioAuditor: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_fechabaja IS NULL ' +
            ' AND dv_volante = :vol ' +
            ' AND dv_usualta <> :usuario ';
  if not(Seguridad.Claves.IsActive('PermisoEspecialABM')) then
    Verificar(ExisteSqlEx(sSql, [Volante, Sesion.UserID]), nil,
              'El volante ya tiene débitos cargados por otro auditor.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.tbAplicarDebitoClick(Sender: TObject);
begin
  Verificar(Estado <> 'P', nil, 'El volante no se encuentra pendiente.');
  Verificar(not(sdqConsulta.Active) or sdqConsulta.Eof, Grid,
           'Debe seleccionar un registro.');
  Verificar(not(sdqConsulta.FieldByName('dv_fechabaja').IsNull), nil,
            'El débito se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('dv_aplicado').AsString = 'S', nil,
            'El débito ya ha sido aplicado al volante.');

  if MsgAsk('¿Confirma aplicar el débito seleccionado al volante?') then
  begin
    IdAplicado  := sdqConsulta.FieldByName('dv_id').AsInteger;
    ModalResult := mrOk;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmDebitosAuditoria.IsEstadoUsuarioCorrecto: Boolean;
begin
  Result := IsPendienteAuditoria and IsMismoUsuarioAuditor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.chkObsIntABMClick(Sender: TObject);
begin
  dcFPrestacionABM.Clear;
  fraNomencladorABM.Clear;
  edValorABM.Clear;
  if chkObsIntABM.Checked then
  begin
    edCantidadABM.Value := 1;
    rgoriginal.ItemIndex := -1;
    cmbOriginales.Clear;
    VclExtra.LockControls([rgOriginal, cmbOriginales, btnVerOrig]);
  end
  else
  begin
    edCantidadABM.Clear;
    VclExtra.LockControls([rgOriginal], false);
    rgOriginal.ItemIndex := 0;
  end;

  dcFPrestacionABM.Enabled  := chkObsIntABM.Checked;
  edCantidadABM.Enabled     := chkObsIntABM.Checked;
  fraNomencladorABM.Enabled := chkObsIntABM.Checked;
  edValorABM.Enabled        := chkObsIntABM.Checked;
  if chkObsIntABM.Checked and dcFPrestacionABM.CanFocus then
    dcFPrestacionABM.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.fraNomencladorABMcmbDescripcionButtonClick(Sender: TObject);
begin
  Verificar(edSiniestroABM.IsEmpty, edSiniestroABM, 'Debe cargar el siniestro.');
  Verificar(dcFPrestacionABM.IsEmpty, dcFPrestacionABM, 'Debe cargar la fecha de prestación.');
  Verificar(edCantidadABM.Value = 0, edCantidadABM, 'La cantidad debe ser mayor a 0.');
  fraNomencladorABM.Prestador       := PrestadorVol;
  fraNomencladorABM.Vigencia        := dcFPrestacionABM.Date;
  fraNomencladorABM.FechaSolicitud  := dcFPrestacionABM.Date;
  fraNomencladorABM.Siniestro       := edSiniestroABM.SiniestroClass;
  fraNomencladorABM.cmbDescripcionDropDown(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.OnNomencladorChange(Sender: TObject);
begin
  if (dcFPrestacionABM.IsEmpty) or (not fraNomencladorABM.IsSelected) then
    edValorABM.Clear
  else if not fraNomencladorABM.CompareValues(sdqConsulta.FieldByName('on_nomenclador').AsString,
                                              sdqConsulta.FieldByName('on_capitulo').AsString,
                                              sdqConsulta.FieldByName('on_codigo').AsString) then
    DoCalcularValorPrestacion;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.dcFPrestacionABMExit(Sender: TObject);
begin
  if (dTempo <> dcFPrestacionABM.Date) then
  begin
    fraNomencladorABM.Limpiar;
    fraNomencladorABM.OnChange(Nil);
    edValorABM.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.dcFPrestacionABMEnter(Sender: TObject);
begin
  dTempo := dcFPrestacionABM.Date;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.FSFormShow(Sender: TObject);
begin
  inherited;
  {a esto lo pongo aca debido al hermoso bug del componente que da prioridad
   al valor de la registry.....}
  Grid.Columns[9].Visible   := Seguridad.Activar(tbModificar);
  Grid.Columns[10].Visible  := Seguridad.Activar(tbModificar);
  Grid.Columns[11].Visible  := Seguridad.Activar(tbModificar);
  Grid.Columns[12].Visible  := Seguridad.Activar(tbModificar);
  Grid.Columns[13].Visible  := Seguridad.Activar(tbModificar);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.DoCalcularValorPrestacion;
var
  sSql: String;
begin
  try
    sSql := 'SELECT amebpba.get_val_prestacion(' + SqlValue(PrestadorVol) + ',' +
                                                   SqlString(fraNomencladorABM.Nomenclador, True)  + ', ' +
                                                   SqlString(fraNomencladorABM.Capitulo, True)  + ',' +
                                                   SqlString(fraNomencladorABM.Codigo, True)  + ', ' +
                                                   SqlInt(edSiniestroABM.Siniestro) + ',' +
                                                   SqlInt(edSiniestroABM.Orden) + ', ' +
                                                   SqlInt(edSiniestroABM.Recaida) + ',' +
                                                   SqlDate(dcFPrestacionABM.Date) + ')' +
               ' FROM DUAL';
    edValorABM.Value := edCantidadABM.Value * ValorSqlExtended(sSql);
  except
    on E: Exception do ErrorMsg(E, 'Error al calcular el monto convenido.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.edCantidadABMEnter(Sender: TObject);
begin
  eCantidad := edCantidadABM.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.edCantidadABMExit(Sender: TObject);
begin
  if (eCantidad <> edCantidadABM.Value) and fraNomencladorABM.IsSelected then
    DoCalcularValorPrestacion;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDebitosAuditoria.btnVerOrigClick(Sender: TObject);
var ssql: string;
begin
  if (cmbOriginales.FieldValue <> 'Sin original') and (cmbOriginales.FieldValue <> '') then
  begin
    ssql := ' SELECT dv_observacion ' +
             ' FROM SIN.sdv_debitosvolantes ' +
            ' WHERE dv_fechabaja IS NULL ' +
              ' AND dv_siniestro = :siniestro ' +
              ' AND dv_orden = :orden ' +
              ' AND dv_recaida = :recaida ' +
              ' AND dv_original = ''S'' ' +
              ' AND dv_codigo = :código ';

    mObservDebOrig.Lines.Text := ValorSqlEx(ssql, [edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida, cmbOriginales.FieldValue]);
    fpObsDebOriginal.ShowModal;
  end
  else
    InvalidHint(btnVerOrig, 'Debe seleccionar un código de la lista');
end;

procedure TfrmDebitosAuditoria.rgOriginalClick(Sender: TObject);
begin
  if rgOriginal.ItemIndex = 0 then
  begin
    cmbOriginales.Clear;
    vclextra.LockControls([cmbOriginales, btnVerOrig]);
  end
  else
    vclextra.LockControls([cmbOriginales, btnVerOrig], false);

end;

procedure TfrmDebitosAuditoria.fpAbmShow(Sender: TObject);
begin
  inherited;
  if ModoABM = maModificacion then
    vclextra.LockControls([rgOriginal])
  else
    vclextra.LockControls([rgOriginal], false);
end;

end.

