unit unManPoliza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, Mask, PatternEdit, IntEdit, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CurrEdit, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraCodigoDescripcion, Menus;

type
  TfrmManPolizas = class(TfrmCustomGridABM)
    lbNumero: TLabel;
    edSM_NUMEROPOLIZA: TEdit;
    fraSM_IDCOMPANIA: TfraStaticCodigoDescripcion;
    lbCA: TLabel;
    edSM_VIGENCIADESDE: TDateComboBox;
    edSM_VIGENCIAHASTA: TDateComboBox;
    lbFD: TLabel;
    lbFH: TLabel;
    edSM_FRANQUICIA: TCurrencyEdit;
    edSM_SUMAASEGURADA: TCurrencyEdit;
    lbSA: TLabel;
    lbF: TLabel;
    sdqConsultaCS_ID: TFloatField;
    sdqConsultaCS_NOMBRE: TStringField;
    sdqConsultaSM_ID: TFloatField;
    sdqConsultaSM_PRESTADOR: TFloatField;
    sdqConsultaSM_NUMEROPOLIZA: TStringField;
    sdqConsultaSM_IDCOMPANIA: TFloatField;
    sdqConsultaSM_VIGENCIADESDE: TDateTimeField;
    sdqConsultaSM_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaSM_SUMAASEGURADA: TFloatField;
    sdqConsultaSM_FRANQUICIA: TFloatField;
    sdqConsultaSM_CANTIDADCUOTAS: TFloatField;
    sdqConsultaSM_CANTIDADCUOTASPAGAS: TFloatField;
    sdqConsultaSM_FECHAALTA: TDateTimeField;
    sdqConsultaSM_USUALTA: TStringField;
    sdqConsultaSM_FECHABAJA: TDateTimeField;
    sdqConsultaSM_USUBAJA: TStringField;
    sdqConsultaESTADO: TStringField;
    sdqConsultaVENCIMIENTO: TDateTimeField;
    cmbSM_MONEDASUMA: TComboBox;
    cmbSM_MONEDAFRANQUICIA: TComboBox;
    sdqConsultaMONEDASUMA: TStringField;
    sdqConsultaMONEDAFRANQUICIA: TStringField;
    sdqConsultaSM_MONEDASUMA: TStringField;
    sdqConsultaSM_MONEDAFRANQUICIA: TStringField;
    Label1: TLabel;
    edSM_PRIMA: TCurrencyEdit;
    cmbSM_MONEDAPRIMA: TComboBox;
    sdqConsultaSM_PRIMA: TFloatField;
    sdqConsultaSM_MONEDAPRIMA: TStringField;
    sdqConsultaMONEDAPRIMA: TStringField;
    Label2: TLabel;
    edSM_ADELANTO: TCurrencyEdit;
    cmbSM_MONEDAADELANTO: TComboBox;
    sdqConsultaSM_ADELANTO: TFloatField;
    sdqConsultaSM_MONEDAADELANTO: TStringField;
    sdqConsultaMONEDAADELANTO: TStringField;
    Label3: TLabel;
    sdqConsultaSM_IDTIPOPOLIZA: TFloatField;
    sdqConsultaTIPOPOLIZA: TStringField;
    fraTipoPoliza: TfraCodigoDescripcion;
    sdqConsultaTP_EXIGEPLAN: TStringField;
    fpMail: TFormPanel;
    gbMotivoMail: TGroupBox;
    rbSinPoliza: TRadioButton;
    rbVencida: TRadioButton;
    rbRetrasados: TRadioButton;
    Bevel1: TBevel;
    btnCancelarMail: TButton;
    btnAceptarMail: TButton;
    Label4: TLabel;
    edNroSeguro: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                var Background: TColor; Highlight: Boolean);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure btnAceptarMailClick(Sender: TObject);
    procedure fpMailBeforeShow(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
  private
    FPrestador: integer;
    ExtendiendoVigencia: boolean;
    procedure SetPrestador(const Value: integer);
    procedure ControlarPolizaActiva;
    function PolizaVencida: boolean;
    function GetMotivoMail :String;
    function GetCuerpoMail :String;
  protected
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    procedure RefreshData; override;
  public
    property  Prestador: integer read FPrestador write SetPrestador;
  end;

var
  frmManPolizas: TfrmManPolizas;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unSesion, unDmPrincipal, unART, unPlanDePagosDePolizas,
  Strfuncs, unMoldeEnvioMail, unCustomConsulta;

{$R *.DFM}

{ TfrmManPolizas }
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.ClearControls;
begin
  edSM_NUMEROPOLIZA.Clear;
  fraSM_IDCOMPANIA.Clear;
  fraTipoPoliza.Clear;
  edSM_VIGENCIADESDE.Clear;
  edSM_VIGENCIAHASTA.Clear;
  edSM_SUMAASEGURADA.Clear;
  edSM_FRANQUICIA.Clear;
  edSM_PRIMA.Clear;
  edSM_ADELANTO.Clear;
  cmbSM_MONEDASUMA.ItemIndex       := 0;
  cmbSM_MONEDAFRANQUICIA.ItemIndex := 0;
  cmbSM_MONEDAPRIMA.ItemIndex      := 0;
  cmbSM_MONEDAADELANTO.ItemIndex   := 0;
end;
{-------------------------------------------------------------------------------}
function TfrmManPolizas.DoABM: Boolean;
var
  fID: integer; bResultPlanPagos: boolean;
begin
  fID := 1;
  bResultPlanPagos := true;
  Sql.Clear;
  Sql.TableName := 'MSM_SEGUROMALAPRAXIS';
  try
    BeginTrans(true);
    case ModoABM of
      maBaja:
      begin
        Sql.SqlType := stUpdate;
        fID         := sdqConsulta.FieldByName('SM_ID').AsInteger;
        Sql.Fields.Add ('SM_USUBAJA', Sesion.UserID);
        Sql.Fields.Add ('SM_FECHABAJA', SQL_ACTUALDATE, False);
      end;
      maAlta:
      begin
        Sql.SqlType := stInsert;
        fID         := GetSecNextVal('SEQ_MSM_ID');
        Sql.Fields.Add ('SM_USUALTA', Sesion.UserID);
        Sql.Fields.Add ('SM_FECHAALTA', SQL_ACTUALDATE, False);
      end;
      maModificacion:
      begin
        Sql.SqlType := stUpdate;
        fID         := sdqConsulta.FieldByName('SM_ID').AsInteger;
        Sql.Fields.Add ('SM_USUBAJA', SQL_NULL, False);
        Sql.Fields.Add ('SM_FECHABAJA', SQL_NULL, False);
      end;
    end;

    if ModoABM <> maBaja then
    begin
      Sql.Fields.Add('SM_PRESTADOR', Prestador, dtNumber);
      Sql.Fields.Add('SM_IDTIPOPOLIZA', fraTipoPoliza.Value, dtNumber);
      Sql.Fields.Add('SM_NUMEROPOLIZA', edSM_NUMEROPOLIZA.Text);
      Sql.Fields.Add('SM_IDCOMPANIA', fraSM_IDCOMPANIA.Value, dtNumber);
      Sql.Fields.Add('SM_VIGENCIADESDE', edSM_VIGENCIADESDE.SqlText, False);
      Sql.Fields.Add('SM_VIGENCIAHASTA', edSM_VIGENCIAHASTA.SqlText, False);
      Sql.Fields.Add('SM_SUMAASEGURADA', edSM_SUMAASEGURADA.Value, dtNumber);
      Sql.Fields.Add('SM_FRANQUICIA', edSM_FRANQUICIA.Value, dtNumber);
      Sql.Fields.Add('SM_PRIMA', edSM_PRIMA.Value, dtNumber);
      Sql.Fields.Add('SM_ADELANTO', edSM_ADELANTO.Value, dtNumber);
      Sql.Fields.Add('SM_MONEDASUMA', cmbSM_MONEDASUMA.ItemIndex, dtNumber);
      Sql.Fields.Add('SM_MONEDAFRANQUICIA', cmbSM_MONEDAFRANQUICIA.ItemIndex, dtNumber);
      Sql.Fields.Add('SM_MONEDAPRIMA', cmbSM_MONEDAPRIMA.ItemIndex, dtNumber);
      Sql.Fields.Add('SM_MONEDAADELANTO', cmbSM_MONEDAADELANTO.ItemIndex, dtNumber);
    end;

    Sql.PrimaryKey.Add('SM_ID', fID, False);

    Result := inherited DoABM;

    sdqConsulta.Refresh;
    sdqConsulta.Locate('sm_id', fID, [loCaseInsensitive]);

    if (Result = true) and (ModoABM = maAlta) and (sdqConsultaTP_EXIGEPLAN.AsString = 'S') then
      with TfrmPlanDePagosDePolizas.Create(Self) do
      begin
        IDSeguro      := Self.sdqConsulta.FieldByName('SM_ID').AsInteger;
        VigenciaHasta := Self.sdqConsulta.FieldByName('SM_VIGENCIAHASTA').AsDateTime;
        VigenciaDesde := Self.sdqConsulta.FieldByName('SM_VIGENCIADESDE').AsDateTime;
        ValorPrima    := Self.sdqConsulta.FieldByName('SM_PRIMA').AsCurrency -
                         Self.sdqConsulta.FieldByName('SM_ADELANTO').AsCurrency;
        if ShowModal(Self.sdqConsulta.FieldByName('SM_FECHABAJA').IsNull) = mrOK then
          bResultPlanPagos := true
        else
        begin
          bResultPlanPagos := false;
          self.fpAbm.ModalResult := mrCancel;
        end;
        Free;
      end;

    if bResultPlanPagos then
      CommitTrans(True)
    else
      Rollback(True);

  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar dar de alta la póliza o el plan de pagos');
      Result := false;
    end;
  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.LoadControls;
begin
  fraTipoPoliza.Value      := sdqConsulta.FieldByName('SM_IDTIPOPOLIZA').AsString;
  edSM_NUMEROPOLIZA.Text   := sdqConsulta.FieldByName('SM_NUMEROPOLIZA').AsString;
  fraSM_IDCOMPANIA.Value   := sdqConsulta.FieldByName('SM_IDCOMPANIA').AsString;
  edSM_SUMAASEGURADA.Value := sdqConsulta.FieldByName('SM_SUMAASEGURADA').AsCurrency;
  edSM_FRANQUICIA.Value    := sdqConsulta.FieldByName('SM_FRANQUICIA').AsCurrency;
  edSM_PRIMA.Value         := sdqConsulta.FieldByName('SM_PRIMA').AsCurrency;
  edSM_ADELANTO.Value      := sdqConsulta.FieldByName('SM_ADELANTO').AsCurrency;

  cmbSM_MONEDASUMA.ItemIndex       := sdqConsulta.FieldByName('SM_MONEDASUMA').AsInteger;
  cmbSM_MONEDAFRANQUICIA.ItemIndex := sdqConsulta.FieldByName('SM_MONEDAFRANQUICIA').AsInteger;
  cmbSM_MONEDAPRIMA.ItemIndex      := sdqConsulta.FieldByName('SM_MONEDAPRIMA').AsInteger;
  cmbSM_MONEDAADELANTO.ItemIndex   := sdqConsulta.FieldByName('SM_MONEDAADELANTO').AsInteger;

  if ExtendiendoVigencia then
  begin
    ExtendiendoVigencia := False;
    edSM_VIGENCIADESDE.Clear;
    edSM_VIGENCIAHASTA.Clear;
    btnCancelar.Enabled := False;
  end
  else begin
    edSM_VIGENCIADESDE.Date  := sdqConsulta.FieldByName('SM_VIGENCIADESDE').AsDateTime;
    edSM_VIGENCIAHASTA.Date  := sdqConsulta.FieldByName('SM_VIGENCIAHASTA').AsDateTime;
    btnCancelar.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmManPolizas.Validar: Boolean;
begin
  Verificar(fraTipoPoliza.IsEmpty, fraTipoPoliza, 'Debe seleccionar el tipo de póliza.');
  if (fraTipoPoliza.sdqDatos.FieldByName('TP_EXIGEPLAN').AsString = 'S') then
  begin
    Verificar((edSM_NUMEROPOLIZA.Text = ''), edSM_NUMEROPOLIZA, 'Debe indicar el número de póliza.');
    Verificar(fraSM_IDCOMPANIA.IsEmpty, fraSM_IDCOMPANIA.edCodigo, 'Debe seleccionar la compañía aseguradora.');
    Verificar(edSM_VIGENCIADESDE.IsEmpty, edSM_VIGENCIADESDE, 'Debe indicar el inicio de la vigencia.');
    Verificar(edSM_VIGENCIAHASTA.IsEmpty, edSM_VIGENCIAHASTA, 'Debe indicar el fin de la vigencia.');
    Verificar(edSM_VIGENCIADESDE.Date >= edSM_VIGENCIAHASTA.Date, edSM_VIGENCIAHASTA,
              'La fecha de inicio no puede ser mayor a la fecha de finalización de cobertura.');
    Verificar((edSM_SUMAASEGURADA.Value <= 0), edSM_SUMAASEGURADA, 'Debe indicar el monto de la suma asegurada.');
    Verificar((edSM_SUMAASEGURADA.Value < edSM_FRANQUICIA.Value), edSM_FRANQUICIA,
              'El monto de la franquicia no puede superar al monto de la suma asegurada.');
    Verificar((fraTipoPoliza.sdqDatos.FieldByName('TP_PLANAUTOMATICO').AsString  = 'N') and
              (edSM_PRIMA.Value <= 0), edSM_PRIMA, 'El monto del premio debe ser mayor que cero.');
    Verificar((edSM_PRIMA.Value <= edSM_ADELANTO.Value) and (edSM_ADELANTO.Value > 0),
              edSM_ADELANTO, 'El adelanto debe ser menor que el premio.');
    Verificar(cmbSM_MONEDASUMA.ItemIndex = -1, cmbSM_MONEDASUMA, 'Debe indicar la divisa de la suma asegurada.');
    Verificar(cmbSM_MONEDAFRANQUICIA.ItemIndex = -1, cmbSM_MONEDAFRANQUICIA, 'Debe indicar la divisa de la franquicia.');
    Verificar(cmbSM_MONEDAPRIMA.ItemIndex = -1, cmbSM_MONEDAPRIMA, 'Debe indicar la divisa del premio.');
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.FormCreate(Sender: TObject);
begin
  inherited;
  // El botón de limpiar es el de Extender Vigencia
  tbLimpiar.ImageIndex := 16;
  ExtendiendoVigencia := False;

  with fraSM_IDCOMPANIA do
  begin
    TableName   := 'MCS_COMPANIASEGURO';
    FieldCodigo := 'CS_ID';
    FieldID     := 'CS_ID';
    FieldDesc   := 'CS_NOMBRE';
    ShowBajas   := True;
  end;

  with fraTipoPoliza do
  begin
    TableName   := 'MTP_TIPOPOLIZA';
    FieldCodigo := 'TP_ID';
    FieldID     := 'TP_ID';
    FieldDesc   := 'TP_DESCRIPCION';
    FieldBaja   := 'TP_FECHABAJA';
    ShowBajas   := False;
    OrderBy     := 'TP_ID';
    ExtraFields := ', TP_PLANAUTOMATICO, TP_EXIGEPLAN ';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.SetPrestador(const Value: integer);
begin
  FPrestador := Value;
  sdqConsulta.ParamByName('PRESTADOR').AsInteger := Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), nil,
            'Debe seleccionar un seguro de mala práxis para poder acceder a su plan de pagos.');
  Verificar((sdqConsultaTP_EXIGEPLAN.AsString = 'N'), nil,
            'Al tipo de póliza seleccionada no se le puede cargar plan de pagos.');

  if not sdqConsulta.FieldByName('SM_FECHABAJA').IsNull then
    MsgBox('Tenga en cuenta que está ingresando a un plan de pagos de un seguro que no es activo');

  //Plan de Pagos
  with TfrmPlanDePagosDePolizas.Create(Self) do
  begin
    IDSeguro      := Self.sdqConsulta.FieldByName('SM_ID').AsInteger;
    VigenciaHasta := Self.sdqConsulta.FieldByName('SM_VIGENCIAHASTA').AsDateTime;
    VigenciaDesde := Self.sdqConsulta.FieldByName('SM_VIGENCIADESDE').AsDateTime;
    ValorPrima    := Self.sdqConsulta.FieldByName('SM_PRIMA').AsCurrency -
                     Self.sdqConsulta.FieldByName('SM_ADELANTO').AsCurrency;
    ShowModal(Self.sdqConsulta.FieldByName('SM_FECHABAJA').IsNull);
  end;
  RefreshData;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbLimpiar.Enabled := Seguridad.Activar(tbLimpiar) and (sdqConsulta.FieldByName('Estado').AsString = vSI);
end;
{-------------------------------------------------------------------------------}
function TfrmManPolizas.PolizaVencida: boolean;
begin
  Result := not(sdqConsulta.FieldByName('SM_VIGENCIAHASTA').IsNull) and
            (sdqConsulta.FieldByName('SM_VIGENCIAHASTA').AsDateTime < DBDateTime);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), nil,
            'Debe seleccionar una póliza para poder modificarla.');
  Verificar(not(sdqConsulta.FieldByName('SM_FECHABAJA').IsNull), nil, 'La póliza ha sido dada de baja.');
  Verificar(PolizaVencida, nil, 'La vigencia de la póliza ha expirado.');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.tbLimpiarClick(Sender: TObject);
var
  ID: integer;
begin
  Verificar(not(sdqConsulta.FieldByName('SM_FECHABAJA').IsNull), nil, 'La póliza ha sido dada de baja.');
  Verificar(sdqConsulta.FieldByName('SM_FECHABAJA').IsNull and
            not(Seguridad.Claves.IsActive('PermisoExtenderVigencia')), nil,
            'Ud. no tiene permiso para extender la vigencia de una póliza.');
  Verificar(not Seguridad.Activar(tbModificar), nil,
            'Ud. no tiene permiso para modificar la extención de la póliza. No se extenderá la misma.');

  ControlarPolizaActiva;

  ID := GetSecNextVal('SEQ_MSM_ID');
  EjecutarSqlEx('INSERT INTO msm_seguromalapraxis' +
                ' (sm_id, sm_prestador, sm_numeropoliza, sm_idcompania, sm_vigenciadesde, ' +
                ' sm_vigenciahasta, sm_usualta, sm_fechaalta, sm_idtipopoliza)' +
                ' (SELECT :nuevoid, sm_prestador, sm_numeropoliza, sm_idcompania, ' +
                        ' TRUNC(sm_vigenciahasta + 1), TRUNC(sm_vigenciahasta + 1 + (sm_vigenciahasta - sm_vigenciadesde)), ' +
                        ' :user, art.actualdate, sm_idtipopoliza' +
                   ' FROM msm_seguromalapraxis' +
                  ' WHERE sm_prestador = :prestador' +
                    ' AND sm_id = :id)', [ID, Sesion.UserID, Prestador, sdqConsulta.FieldByName('SM_ID').AsInteger]);
  RefreshData;
  ExtendiendoVigencia := True;
  if sdqConsulta.Locate('SM_ID', ID, []) then
    tbModificar.Click;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.tbNuevoClick(Sender: TObject);
begin
  if ExisteSQLEx('SELECT 1' +
                  ' FROM msm_seguromalapraxis' +
                 ' WHERE sm_prestador = :PRESTADOR' +
                   ' AND sm_fechabaja IS NULL', [Prestador]) then
  begin
    ControlarPolizaActiva;
    inherited;
  end
  else
    inherited;
    
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.ControlarPolizaActiva;
begin
  if   MsgAsk('El prestador tiene una póliza con cobertura al día de la fecha (puede estar o no vencida).' + CRLF +
              'Debe darla de baja antes de continuar. ¿Desea hacerlo ahora?')
  then EjecutarSQLEx('UPDATE msm_seguromalapraxis' +
                       ' SET sm_fechabaja = SYSDATE,' +
                           ' sm_usubaja = :USUARIO' +
                     ' WHERE sm_prestador = :PRESTADOR' +
                       ' AND sm_fechabaja IS NULL', [Sesion.UserID, Prestador])
  else Abort;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                           var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.DataSet.FieldByName('SM_FECHABAJA').IsNull then
  begin
    Background := clInfoBK;
    AFont.Color := clNavy;
  end
  else AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.RefreshData;
var
  sSQL: string;
begin
  sSQL := 'SELECT mcs_companiaseguro.*, msm_seguromalapraxis.*, ' +
                ' tp_descripcion tipopoliza, tp_exigeplan, ' +
                ' DECODE(siniestro.get_seguromalapraxisactivo(sm_prestador), sm_id, ''ü'', ''û'') as ESTADO,' +
                ' DECODE(siniestro.get_seguromalapraxisactivo(sm_prestador), sm_id, siniestro.get_seguroproximovencimiento(sm_prestador), null) as VENCIMIENTO,' +
                ' DECODE(sm_monedasuma, 0, ''$'', ''U$S'') as MONEDASUMA,' +
                ' DECODE(sm_monedafranquicia, 0, ''$'', ''U$S'') as MONEDAFRANQUICIA,' +
                ' DECODE(sm_monedaprima, 0, ''$'', ''U$S'') as MONEDAPRIMA, ' +
                ' DECODE(sm_monedaadelanto, 0, ''$'', ''U$S'') as MONEDAADELANTO' +
           ' FROM mcs_companiaseguro, msm_seguromalapraxis, mtp_tipopoliza ' +
          ' WHERE sm_idcompania = cs_id(+) ' +
            ' AND sm_idtipopoliza = tp_id(+) ' +
            ' AND sm_prestador = :PRESTADOR';
  sdqConsulta.Sql.Text := sSQL + SortDialog.OrderBy;
  inherited;
  tbEnviarMail.Enabled := Seguridad.Activar(tbEnviarMail);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  edSM_VIGENCIADESDE.Enabled := (ModoABM = maAlta) or not ExtendiendoVigencia;
  edSM_VIGENCIAHASTA.Enabled := (ModoABM = maAlta) or not ExtendiendoVigencia;
  fraSM_IDCOMPANIA.Enabled   := (ModoABM = maAlta);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.btnAceptarMailClick(Sender: TObject);
begin
  Verificar(not(rbSinPoliza.Checked) and not(rbVencida.Checked) and not(rbRetrasados.Checked), gbMotivoMail,
            'Debe seleccionar un motivo para el mail.');
  Verificar(not(rbSinPoliza.Checked) and not(sdqConsulta.Active) and not(sdqConsulta.IsEmpty),
            nil, 'Debe seleccionar un seguro de mala praxis.');
  Verificar(not(rbSinPoliza.Checked) and not(sdqConsulta.FieldByName('sm_fechabaja').IsNull),
            nil, 'El seguro seleccionado se encuentra dado de baja.');
  fpMail.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.fpMailBeforeShow(Sender: TObject);
var
  iEstado :Integer;
begin
  edNroSeguro.Text      := sdqConsultaSM_NUMEROPOLIZA.AsString;
  rbSinPoliza.Checked   := False;
  rbVencida.Checked     := False;
  rbRetrasados.Checked  := False;

  iEstado := ValorSqlIntegerEx('SELECT siniestro.get_estadoseguromalapraxis(:IdPres) ' +
                                ' FROM dual', [Prestador]);
{ Estados posibles del seguro de mala praxis:
    1 : póliza al dia     2 : póliza vencida     3 : sin póliza
    4 : cuotas vencidas   5 : no requiere poliza }
  rbSinPoliza.Enabled   := (iEstado = 3);
  rbVencida.Enabled     := (iEstado = 2);
  //rbVencer.Enabled      := (iEstado = 1) or (iEstado = 4);
  rbRetrasados.Enabled  := (iEstado = 4);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManPolizas.tbEnviarMailClick(Sender: TObject);
var
  sMail :String;
begin
  sMail := ValorSqlEx('SELECT ca_direlectronica ' +
                       ' FROM cpr_prestador ' +
                      ' WHERE ca_identificador = :IdPres', [Prestador]);
  if IsEmptyString(sMail) then
    MsgBox('El prestador no posee dirección de mail cargada.', MB_ICONINFORMATION)
  else if fpMail.ShowModal = mrOk then
    unMoldeEnvioMail.EnviarMailBD(sMail, GetMotivoMail, [oBodyIsRTF, {oAutoFirma,} oIncluirFax],
                                  GetCuerpoMail);
end;
{-------------------------------------------------------------------------------}
function TfrmManPolizas.GetMotivoMail :String;
begin
  if rbSinPoliza.Checked then
    Result := rbSinPoliza.Hint
  else if rbVencida.Checked then
    Result := rbVencida.Hint
  else
    Result := rbRetrasados.Hint;
end;
{-------------------------------------------------------------------------------}
function TfrmManPolizas.GetCuerpoMail :String;
var
  sRazon, sSql, sPEDIDOS, sPEDIDOSAD, sSALUDO, sATENCION, sSINPOLIZA, sVENCIDA, sVENCER, sRETRASA, sRETRASA2, sSALUDO2 :String;
begin             // TK 14269 los puse como variables locales porque tenia que agregar el usuario a una.
  sPEDIDOS   := 'Recordamos que dentro de la misma deben figurar: vigencia desde y hasta, monto asegurable, ' +
                'premio, número de póliza y cronograma de pagos (cantidad de cuotas, importes y vencimientos). ' + #13 + #13 +
                'En el caso que usted tenga el seguro a través de una asociación o colegio, deberá presentarnos constancia ' + #13 +
                'emitida por dicho organismo detallando la totalidad de los datos mencionados anteriormente.' + #13 +
                'A su vez agradeceremos el envío de los pagos de la misma (sólo seran válidos cuando tengan ' + #13 +
                'sello y/o recibo electrónico adjunto de bancos o entidades de cobro autorizadas). ' + #13 + #13;

  sPEDIDOSAD := 'El envío podrán hacerlo por cualquiera de las siguientes formas:' + #13 + #13 +   // Lu TK 5599
                ' - Correo electrónico: adjuntando los archivos digitalizados a polizas@provart.com.ar' + #13 +
                ' - Fax: (011)4819-2888 opción 444 ' + #13 +
                ' - Correo: Carlos Pellegrini 91, 2º piso (CP1009ABA) - Provincia ART - Sector Gestión de Prestadores' + #13 + #13 +
                'Quedamos a la espera de la documentación mencionada.' + #13 +
                'Anticipamos que en caso de incurrir en la falta de presentación de la documentación solicitada, se dará' + #13 +
                'prioridad al pago de las facturas de los prestadores que se encuentren al día con la misma.' + #13 + #13;

  sSALUDO    := 'Sin mas, saluda y agradece atte.' + #13 + #13 + Sesion.Usuario + #13 + 'Tel: (011)4819-2800' + #13 + 'E-Mail: polizas@provart.com.ar' + #13 + #13;

  sSALUDO2   := 'Sin mas, saluda y agradece atte.' + #13 + #13;

  sATENCION  := 'Atención: El presente es un mail automático generado por nuestro sistema, por lo cual si usted ya ha respondido al mismo o su caso se encuentra en vías de solución, por favor haga caso omiso al presente.' +#13;

  sSINPOLIZA := 'Sr. Prestador:' + #13 + #13 +
                'Buenos días; con motivo de no contar con la póliza del seguro de referencia cargada ' +
                'en nuestro sistema y a fin de actualizar nuestra base, necesitamos que nos envíen copia ' +
                'de la póliza vigente.' + #13 + sPEDIDOS + sPEDIDOSAD + sSALUDO;
  sVENCIDA   := 'Sr. Prestador:' + #13 + #13 +
                'Buenos días; me dirijo a Ud. con motivo de informar que la última póliza de seguro ha caducado, por lo tanto ' +
                'necesitamos que nos envíe copia de la póliza vigente. ' + #13 + sPEDIDOS + sPEDIDOSAD + sSALUDO;
  sVENCER    := 'Sres. %s:' + #13 + #13 +
                'Buenos días, me dirijo a ud. para recordarle que la póliza %s del seguro de referencia, ' +
                'caducará el %s, motivo por el cual le solicitamos que una vez hayan renovado la misma ' +
                'nos vuelvan a enviar la documentación correspondiente. ' + #13 + sPEDIDOS + sSALUDO;
  sRETRASA   := 'Sres. %s:' + #13 + #13 +
                'Buenos días, me dirijo a ud. con motivo de informarle que la última póliza del seguro de referencia que ' +
                'tenemos cargada en el sistema es la %s, a la misma le faltan los pagos actualizados, motivo por el cual solicitamos ' +
                'que nos los envíen.' + #13 + 'En el caso de que usted tenga el seguro a traves de una asociacion o colegio, ' +
                'debera presentanos constancia emitida por dicho organismo detallando la totalidad de los datos mencionados anteriormente.' + #13 +
                'A su vez agradeceremos el envio de la misma (solo seran validos cuando tengan sello y/o recibo electronico adjunto ' +
                ' de bancos o entidades de cobro autorizadas). ' + #13 + #13 + sPEDIDOSAD + sSALUDO2;
  sRETRASA2  := 'Sres. %s:' + #13 + #13 +
                'Buenos días, me dirijo a ud. con motivo de informarle que la última póliza del seguro de referencia que ' +
                'tenemos cargada en el sistema es la %s, a la misma le faltan los pagos actualizados, motivo por  ' +
                'el cual solicitamos que nos los envíen.' + #13 + 'Se consignará como constancia de pago válida ' +
                'el comprobante mensual de su matrícula. ' + #13 + #13 +
                'Sin mas, saluda y agradece atte. ';



  sRazon := ValorSqlEx('SELECT ca_descripcion ' +
                        ' FROM cpr_prestador ' +
                       ' WHERE ca_identificador = :IdPres', [Prestador]);
  if rbSinPoliza.Checked then
    Result := sSINPOLIZA
  else if rbVencida.Checked then
    Result := Format(sVENCIDA, [sdqConsulta.FieldByName('sm_numeropoliza').AsString,
                                sdqConsulta.FieldByName('sm_vigenciahasta').AsString])
  else begin
    sSql := 'SELECT tp_planautomatico ' +
             ' FROM mtp_tipopoliza ' +
            ' WHERE tp_id = :Tipo ';
    if (ValorSqlEx(sSql, [sdqConsulta.FieldByName('sm_idtipopoliza').AsInteger]) = 'S') then
      Result := Format(sRETRASA2, [sRazon, sdqConsulta.FieldByName('sm_numeropoliza').AsString])
    else
      Result := Format(sRETRASA, [sRazon, sdqConsulta.FieldByName('sm_numeropoliza').AsString]);
  end;
end;
{-------------------------------------------------------------------------------}
end.
