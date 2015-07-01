unit unContratoEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unFraActividad, Mask, ToolEdit, DateComboBox, HotKeyControl, unFraDomicilio, ShortCutControl, unART, IntEdit,
  QueryPrint, unFraDomicilioTrab, unFraEstablecimiento, ExtCtrls, FormPanel, artSeguridad, QueryToFile, ExportDialog,
  unFraTelefono, unArtDBAwareFrame, Buttons, unFraCodDesc, RxCurrEdit,
  RxToolEdit, SortDlg;

type
  TfrmContratoEstablecimiento = class(TForm)
    tlbControl: TToolBar;
    Grid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    grbDomicilio: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    edES_CODAREAFAX: TPatternEdit;
    edES_FAX: TPatternEdit;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    edES_NOMBRE: TEdit;
    lbNombre: TLabel;
    lbAlta: TLabel;
    edES_FEINICACTIV: TDateComboBox;
    Label1: TLabel;
    edES_FECHAINICEST: TDateComboBox;
    fraActividad: TfraActividad;
    lbActividad: TLabel;
    lbCantEmpleados: TLabel;
    edES_EMPLEADOS: TIntEdit;
    lbMasaSalarial: TLabel;
    edES_MASA: TCurrencyEdit;
    lbNivel: TLabel;
    edES_NIVEL: TPatternEdit;
    Label2: TLabel;
    edES_OBSERVACIONES: TMemo;
    grbSolicitud: TGroupBox;
    ShortCutControl: TShortCutControl;
    tlbNuevo: TToolButton;
    ToolButton2: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    cbES_EVENTUAL: TCheckBox;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    edES_DOMICILIO: TEdit;
    Label3: TLabel;
    fpBusqueda: TFormPanel;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraEstablecimientoBusqueda: TfraEstablecimiento;
    Label4: TLabel;
    ToolButton1: TToolButton;
    tlbBuscar: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    edES_FORMULARIO: TIntEdit;
    tlbReactivar: TToolButton;
    Seguridad: TSeguridad;
    tbExportar: TToolButton;
    ExportDialog: TExportDialog;
    fraTelefono: TfraTelefono;
    Label5: TLabel;
    edES_FECHARECEPCIONBAJA: TDateComboBox;
    fraDomicilio: TfraDomicilio;
    tbHistorico: TToolButton;
    ToolButton3: TToolButton;
    Label6: TLabel;
    dcbFechaBajaEstablecimiento: TDateComboBox;
    fpTraspasoTrabajadores: TFormPanel;
    rbTraspasar: TRadioButton;
    rbDarBaja: TRadioButton;
    Bevel2: TBevel;
    btnAceptar2: TBitBtn;
    btnCancelar2: TBitBtn;
    fraEstablecimientoNuevo: TfraEstablecimiento;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edDescripcionActividad: TEdit;
    edSuperficie: TCurrencyEdit;
    tbReplicar: TToolButton;
    tbBajaMultiple: TToolButton;
    edFechaSuspActiv: TDateComboBox;
    Label10: TLabel;
    Label11: TLabel;
    edFechaReinicioActiv: TDateComboBox;
    fraMotivoBaja: TfraCodigoDescripcion;
    Label12: TLabel;
    fraEstabEventual: TfraCodigoDescripcion;
    tbEstabTipoEventual: TToolButton;
    sdqEstabTipoEventual: TSDQuery;
    dsEstabTipoEventual: TDataSource;
    cbSinPersonal: TCheckBox;
    cbSinDatos: TCheckBox;
    fraOrigen: TfraCodDesc;
    Label13: TLabel;
    tbOrdenar: TToolButton;
    SortDialog: TSortDialog;
    procedure FormCreate(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbBuscarClick(Sender: TObject);
    procedure tlbReactivarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure rbTraspasarClick(Sender: TObject);
    procedure rbDarBajaClick(Sender: TObject);
    procedure fpTraspasoTrabajadoresBeforeShow(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbReplicarClick(Sender: TObject);
    procedure tbBajaMultipleClick(Sender: TObject);
    procedure CambiaActividad(Sender: TObject);
    procedure cbES_EVENTUALClick(Sender: TObject);
    procedure fraEstabEventualcmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                          var Background: TColor; Highlight: Boolean);
    procedure tbEstabTipoEventualClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
  private
    FAutoCommit: Boolean;
    FContrato: TTableId;
    FFuncion: TFuncionShowForm;
    FIdEstablecimiento: TTableId;
    FInitFrameTelefono: Boolean;
    FOrigenAnterior: String;
    FIDAvisoObraWeb : Integer;
    function GetAutoCommit: Boolean;
    function GetNombreOriginal(aNombre: String): String;
    function PermitirBajaEstablecimiento(const aContrato: Integer): Boolean;
    function TraspasarTrabajadores(const aAutoCommit: Boolean; const aContrato, aEstablecimiento: Integer): Boolean;

    procedure OnfraEstablecimientoChange(Sender: TObject);
    procedure ReactivarEstablecimiento;
    procedure SeleccionEstablecimiento;
    procedure SetFuncion(F: TFuncionShowForm);
    procedure Validar;

    property AutoCommit: Boolean read GetAutoCommit;
    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    procedure SetIDAvisoObraWeb(aValue :Integer);
    procedure DoCargarDatos(const aContrato: TTableID; aFuncion: TFuncionShowForm); overload;
    procedure DoCargarDatos(const aContrato: TTableId); overload;
    procedure SetAutoCommit(aValue :Boolean);
  end;

implementation

uses
  VCLExtra, unDmPrincipal, General, CustomDlgs, AnsiSQL, SqlFuncs, unPrincipal, Strfuncs, unHistoricoEstablecimiento,
  unSesion, unAfiliaciones, unEnvioMail, unMoldeEnvioMail, CUIT, Math, unABMEstabTipoEventual, unComunesFet;

{$R *.DFM}

const
  CaptionBase: String = 'Contrato Establecimientos';

procedure TfrmContratoEstablecimiento.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption := CaptionBase;
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsAgregar:
    begin
      Caption := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsModificar:
    begin
      Caption := CaptionBase + ' [MODIFICACION]';
      tlbBaja.Enabled := True;
      tlbImprimir.Enabled := True;
    end;
    fsConsultar:
    begin
      Caption := CaptionBase + ' [CONSULTA]';
      tlbNuevo.Enabled     := False;
      tlbReactivar.Enabled := False;
      tlbGuardar.Enabled   := False;
      tlbBaja.Enabled      := False;
      tlbBuscar.Enabled    := True;
      tlbImprimir.Enabled  := True;
      LockControls([grbIdentifica, grbDomicilio], True);
    end;
  end;
end;

procedure TfrmContratoEstablecimiento.FormCreate(Sender: TObject);
begin
  inherited;

  fraActividad.OnChange := CambiaActividad;

  FIDAvisoObraWeb := 0;

  LockControl(fraEstabEventual);
  with fraEstabEventual do
  begin
    TableName    := 'hys.pev_estabeventual';
    FieldCodigo  := 'ev_id';
    FieldID      := 'ev_id';
    FieldBaja    := 'ev_fechabaja';
    FieldDesc    := 'ev_descripcion';
    ShowBajas    := True;
  end;

  if not cbES_EVENTUAL.Checked then
    LockControl(fraEstabEventual.cmbDescripcion);

  with fraMotivoBaja do
  begin
    TableName    := 'afi.amb_motivobajaestab';
    FieldID      := 'mb_id';
    FieldCodigo  := 'mb_codigo';
    FieldDesc    := 'mb_detalle';
    FieldBaja    := 'mb_fechabaja';
  end;
  FAutoCommit := False;
  FInitFrameTelefono := False;

  fraEstablecimientoBusqueda.OnChange := OnfraEstablecimientoChange;
  LockControls([edES_FORMULARIO], True);
  Grid.MultiSelect := tbBajaMultiple.Enabled;
end;

procedure TfrmContratoEstablecimiento.DoCargarDatos(const aContrato: TTableID; aFuncion: TFuncionShowForm);
begin
  Funcion := aFuncion;
  DoCargarDatos(aContrato);
end;

procedure TfrmContratoEstablecimiento.DoCargarDatos(const aContrato: TTableID);
begin
  if Funcion <> fsConsultar then
    Funcion := fsAgregar;
  FContrato := aContrato;

  edES_FORMULARIO.Value := aContrato;

  sdqDatos.SQL.Text :=
    'SELECT   es_descripcionactividad,' +
            ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL)' +
            ' || art.utiles.armar_localidad(es_cpostal, NULL, es_localidad, es_provincia) domicilio,' +
            ' (SELECT COUNT(*)' +
               ' FROM cre_relacionestablecimiento' +
              ' WHERE re_idestablecimiento = es_id) empleadosnomina, es_calle, es_codareafax, es_codareatelefonos,' +
            ' es_fechasuspensionactiv, es_fechareinicioactiv, es_idmotivobaja, es_contrato, es_cpostal, es_cpostala,' +
            ' es_departamento, es_domicilio, es_empleados, es_eventual, es_fax, TRUNC(es_fechaalta) es_fechaalta,' +
            ' es_fechabaja, es_fechabajareal, es_fechainicest, es_fecharecepcionbaja, es_feinicactiv, es_id,' +
            ' es_idactividad, es_legal, es_localidad, es_masa, es_nivel, es_nombre, es_nroestableci, es_numero,' +
            ' es_observaciones, es_piso, es_provincia, es_superficie, es_telefonos, es_usualta, es_usubaja,' +
            ' pv_descripcion, es_usumodif, ur_sucursal, es_idestabeventual, es_sinpersonal, es_sindatos,' +
            ' es_origendato, odest.tb_descripcion odest' +
       ' FROM aes_establecimiento, cpv_provincias, emi.iur_ultimoregistrodom, ctb_tablas odest' +
      ' WHERE es_provincia = pv_codigo(+)' +
        ' AND ur_id(+) = es_iur_id' +
        ' AND odest.tb_clave(+) = ''ODEST''' +
        ' AND odest.tb_codigo(+) = es_origendato' +
        ' AND es_contrato = :contrato' +
   ' ORDER BY es_nroestableci';

  OpenQueryEx(sdqDatos, [aContrato]);
  fraEstablecimientoBusqueda.Contrato := aContrato;
end;

procedure TfrmContratoEstablecimiento.tlbNuevoClick(Sender: TObject);
var
  sSQL : String;
begin
  if Funcion <> fsConsultar then
    Funcion := fsAgregar;
  FOrigenAnterior := '';

  // Grupo Identificación del Establecimiento
  edES_NOMBRE.Clear;
  edES_NOMBRE.Tag := 0;
  fraActividad.Clear;
  edES_NIVEL.Clear;
  edES_FEINICACTIV.Clear;
  edES_FECHAINICEST.Clear;
  dcbFechaBajaEstablecimiento.Clear;
  edES_EMPLEADOS.Clear;
  edES_MASA.Clear;
  cbES_EVENTUAL.Checked := False;
  edES_FECHARECEPCIONBAJA.Clear;
  edSuperficie.Clear;
  edDescripcionActividad.Clear;
  edES_OBSERVACIONES.Clear;
  edFechaSuspActiv.Clear;
  edFechaReinicioActiv.Clear;
  fraMotivoBaja.Clear;
  fraOrigen.Clear;

  // Grupo Domicilio
  fraDomicilio.Clear;
  fraTelefono.Clear(True);
  edES_CODAREAFAX.Clear;
  edES_FAX.Clear;
  edES_DOMICILIO.Clear;
  edES_NOMBRE.SetFocus;

  if FIDAvisoObraWeb > 0 then
  begin
    cbES_EVENTUAL.Checked := True;
    fraEstabEventual.Codigo := '1';
    fraOrigen.Codigo := '07';
    sSQL := 'SELECT * FROM hys.haw_avisoobraweb WHERE AW_ID = '+SqlValue(FIDAvisoObraWeb);
    with getquery(sSQL) do
    try
      fraDomicilio.Cargar(FieldByName('AW_CALLE').AsString,FieldByName('aw_cpostal').AsString,FieldByName('AW_LOCALIDAD').AsString,
                          FieldByName('AW_NUMERO').AsString,'','',
                          FieldByName('AW_PROVINCIA').AsString,FieldByName('AW_CPA').AsString);

    finally
      Free;
    end;

  end;

end;

procedure TfrmContratoEstablecimiento.SeleccionEstablecimiento;
begin
  if Funcion <> fsConsultar then
    Funcion := fsModificar;

  with sdqDatos do
  begin
    FIdEstablecimiento               := FieldByName('es_id').AsInteger;

    // Grupo Identificación del Establecimiento
    edES_NOMBRE.Tag                  := IIF((FieldByName('es_legal').AsString = 'T'), 1, 0);
    edES_NOMBRE.Text                 := GetNombreOriginal(FieldByName('es_nombre').AsString);
    fraActividad.Value               := FieldByName('es_idactividad').AsInteger;
    edES_NIVEL.Text                  := FieldByName('es_nivel').AsString;
    edES_FEINICACTIV.Date            := FieldByName('es_feinicactiv').AsDateTime;
    edES_FECHAINICEST.Date           := FieldByName('es_fechainicest').AsDateTime;
    dcbFechaBajaEstablecimiento.Date := FieldByName('es_fechabajareal').AsDateTime;
    edES_FECHARECEPCIONBAJA.Date     := FieldByName('es_fecharecepcionbaja').AsDateTime;
    edES_EMPLEADOS.Value             := FieldByName('es_empleados').AsInteger;
    edES_MASA.Value                  := FieldByName('es_masa').AsCurrency;
    cbES_EVENTUAL.Checked            := (FieldByName('es_eventual').AsString = 'S');
    cbSinPersonal.Checked            := (FieldByName('es_sinpersonal').AsString = 'S');
    cbSinDatos.Checked               := (FieldByName('es_sindatos').AsString = 'S');
    fraEstabEventual.Codigo          := FieldByName('es_idestabeventual').AsString;
    fraOrigen.Codigo                 := FieldByName('es_origendato').AsString;
    FOrigenAnterior                  := fraOrigen.Codigo;
    edSuperficie.Value               := FieldByName('es_superficie').AsFloat;
    edDescripcionActividad.Text      := FieldByName('es_descripcionactividad').AsString;
    edES_OBSERVACIONES.Text          := FieldByName('es_observaciones').AsString;
    edFechaSuspActiv.Date            := FieldByName('es_fechasuspensionactiv').AsDateTime;
    edFechaReinicioActiv.Date        := FieldByName('es_fechareinicioactiv').AsDateTime;
    fraMotivoBaja.Value              := FieldByName('es_idmotivobaja').AsInteger;

    // Grupo Domicilio
    //DIRECCION A LA ANTIGUA...
    fraDomicilio.Cargar(FieldByName('es_calle').AsString, FieldByName('es_cpostal').AsString,
                        FieldByName('es_localidad').AsString,
                        IIF((FieldByName('es_numero').AsString <> ''), FieldByName('es_numero').AsString, 'S/N'),
                        FieldByName('es_piso').AsString, FieldByName('es_departamento').AsString,
                        FieldByName('pv_descripcion').AsString, FieldByName('es_cpostala').AsString);
    fraTelefono.FillCombo(True, FieldByName('es_id').AsInteger);
    edES_CODAREAFAX.Text := FieldByName('es_codareafax').AsString;
    edES_FAX.Text        := FieldByName('es_fax').AsString;
    edES_DOMICILIO.Text  := FieldByName('es_domicilio').AsString;
  end;
end;

procedure TfrmContratoEstablecimiento.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  TFloatField(sdqDatos.FieldByName('es_masa')).DisplayFormat := '$ ,0.00;-$ ,0.00';

  SeleccionEstablecimiento;
end;

procedure TfrmContratoEstablecimiento.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                        var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('es_usubaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmContratoEstablecimiento.Validar;
  procedure Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
  begin
    if Condicion then
    begin
      InvalidMsg(AControl, AText);
      Abort;
    end;
  end;

  var
    sSql, CodPost: String;
    i : integer;
    error : Boolean;
begin
  // Grupo Identificación del Establecimiento
  Verificar((edES_NOMBRE.Text = ''), edES_NOMBRE, 'El nombre del establecimiento es obligatorio.');
  Verificar(fraActividad.IsEmpty, fraActividad, 'El código de actividad es obligatorio.');
  Verificar(fraActividad.IsBaja, fraActividad, 'El código de actividad está de baja.');
  Verificar((not edES_FECHARECEPCIONBAJA.IsEmpty) and (dcbFechaBajaEstablecimiento.IsEmpty), dcbFechaBajaEstablecimiento, 'La fecha de baja del establecimiento es obligatoria.');
  Verificar(((edES_EMPLEADOS.Value = 0) or edES_EMPLEADOS.IsEmpty ) and (not cbSinPersonal.Checked and not cbSinDatos.Checked), cbSinPersonal,'Debe indicar sin personal o sin datos.');
  Verificar((edES_EMPLEADOS.Value <> 0) and (cbSinPersonal.Checked or cbSinDatos.Checked), cbSinPersonal,'No puede tener empleados y ser sin personal o sin datos.');

  if FOrigenAnterior <> fraOrigen.Codigo then
    Verificar((Sesion.Sector = 'AFI') and ((fraOrigen.Codigo = '06') or (fraOrigen.Codigo = '07') or (fraOrigen.Codigo = '08')), fraOrigen.edCodigo, 'Usted no tiene permiso para guardar ese Origen.');

  if (Sesion.Sector = 'AFI') or (Sesion.Sector = 'AFINOM') or (Sesion.Sector = 'ATCLI') then
    Verificar(fraOrigen.IsEmpty, fraOrigen, 'El origen es obligatorio.');

  // Grupo Domicilio
  fraDomicilio.ValidarCalle('El nombre de la calle es obligatorio.');
  fraDomicilio.ValidarCodigoPostal('El código postal es obligatorio.');
  fraDomicilio.ValidarLocalidad('La localidad es obligatoria.');

  if fraDomicilio.CPA <> '' then
  begin
    Verificar((Length(fraDomicilio.CPA) <> 8), fraDomicilio, 'El CPA debe tener 8 caracteres.');
    if fraDomicilio.CPA <> '99999999' then
    begin
      error := False;
      CodPost := fraDomicilio.CPA;
      for i := 1 to Length(CodPost) do
      begin
        if i in [1,6,7,8] then
        begin
          if not ((CodPost[i] >= #65) and (CodPost[i] <= #90)) then
            error := True;
        end;
        if i in [2,3,4,5] then
        begin
          if not ((CodPost[i] >= #48) and (CodPost[i] <= #57)) then
            error := True;
        end;
      end;
      Verificar(error,fraDomicilio,'El CPA debe ser 1 letra, 4 numeros y 3 letras.');
    end;
  end;


  if not cbES_EVENTUAL.Checked then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM aes_establecimiento' +
      ' WHERE es_contrato = :contrato' +
        ' AND UPPER(es_calle) = UPPER(:calle)' +
        ' AND UPPER(es_numero) = UPPER(:numero)' +
        ' AND UPPER(NVL(es_piso, '' '')) = UPPER(:piso)' +
        ' AND UPPER(NVL(es_departamento, '' '')) = UPPER(:departamento)' +
        ' AND es_fechabaja IS NULL';

    if Funcion = fsModificar then
      sSql := sSql + ' AND es_id <> ' + SqlValue(FIdEstablecimiento);

    Verificar(ExisteSqlEx(sSql, [FContrato, fraDomicilio.Calle, fraDomicilio.Numero,
                                 String(IIF((fraDomicilio.Piso <> ''), fraDomicilio.Piso, ' ')),
                                 String(IIF((fraDomicilio.Departamento <> ''), fraDomicilio.Departamento, ' '))]),
                                 fraDomicilio, 'Ya existe un establecimiento con ese domicilio.');
  end;

  if cbES_EVENTUAL.Checked then
    Verificar(fraEstabEventual.edCodigo.Text = '', fraEstabEventual.edCodigo, 'Falta ingresar código de Tipo Eventual.');
end;

procedure TfrmContratoEstablecimiento.tlbGuardarClick(Sender: TObject);
var
  iNroEstableci: Integer;
  sBody: String;
  sSql: String;
  sSqlTrans: TSQL;
  Cuit: String;
begin
  Validar;
  sSqlTrans := TSQL.Create('aes_establecimiento');
  try
    case Funcion of
      fsAgregar:
      begin
        sSql :=
          'SELECT NVL(MAX(es_nroestableci), 0) + 1' +
           ' FROM aes_establecimiento' +
          ' WHERE es_contrato = :contrato';
        iNroEstableci := ValorSqlEx(sSql, [FContrato]);
        FIdEstablecimiento := GetSecNextVal('SEQ_AES_ID');

        sSqlTrans.Fields.Add('es_fechaalta',    SQL_DATETIME, false);
        sSqlTrans.Fields.Add('es_nombre',       edES_NOMBRE.Text);
        sSqlTrans.Fields.Add('es_nroestableci', iNroEstableci, false);
        sSqlTrans.Fields.Add('es_usualta',      frmPrincipal.DBLogin.UserId);
        sSqlTrans.SqlType := stInsert;
      end;
      fsModificar:
      begin
        sSqlTrans.Fields.Add('es_fechamodif', SQL_DATETIME, False);
        sSqlTrans.Fields.Add('es_nombre',     String(IIF((edES_NOMBRE.Tag = 1), edES_NOMBRE.Text + ' (LEGAL)', edES_NOMBRE.Text)));
        sSqlTrans.Fields.Add('es_usumodif',   frmPrincipal.DBLogin.UserId);
        iNroEstableci := sdqDatos.FieldByName('es_nroestableci').AsInteger;
        sSqlTrans.SqlType := stUpdate;
      end;
      else
        raise Exception.Create('ERROR FATAL: Acá debería haber llegado con Funcion en fsAgregar o fsModificar.');
    end;
    sSqlTrans.PrimaryKey.Add('es_id',               FIdEstablecimiento, false);
    sSqlTrans.Fields.Add('es_contrato',             FContrato);
    sSqlTrans.Fields.Add('es_idactividad',          fraActividad.Value);
    sSqlTrans.Fields.Add('es_nivel',                edES_NIVEL.Text);

    //DIRECCION A LA ANTIGUA...
    sSqlTrans.Fields.Add('es_cpostal',              fraDomicilio.CodigoPostal);
    sSqlTrans.Fields.Add('es_calle',                fraDomicilio.Calle);
    sSqlTrans.Fields.Add('es_localidad',            fraDomicilio.Localidad);
    sSqlTrans.Fields.Add('es_provincia',            ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                       ' FROM cpv_provincias' +
                                                                      ' WHERE pv_descripcion = :provincia',
                                                                      [fraDomicilio.Provincia], 0), False);
    sSqlTrans.Fields.Add('es_numero',               fraDomicilio.Numero);
    sSqlTrans.Fields.Add('es_piso',                 fraDomicilio.Piso);
    sSqlTrans.Fields.Add('es_departamento',         fraDomicilio.Departamento);
    sSqlTrans.Fields.Add('es_cpostala',             fraDomicilio.CPA);
    sSqlTrans.Fields.Add('es_codareafax',           edES_CODAREAFAX.Text);
    sSqlTrans.Fields.Add('es_fax',                  edES_FAX.Text);
    sSqlTrans.Fields.AddExtended('es_superficie',   edSuperficie.Value, 2, True);
    sSqlTrans.Fields.Add('es_descripcionactividad', edDescripcionActividad.Text);
    sSqlTrans.Fields.Add('es_observaciones',        edES_OBSERVACIONES.Text);
    sSqlTrans.Fields.Add('es_empleados',            edES_EMPLEADOS.Value);
    sSqlTrans.Fields.AddExtended('es_masa',         edES_MASA.Value, ALL_DECIMALS, False);
    sSqlTrans.Fields.Add('es_feinicactiv',          edES_FEINICACTIV.Date);
    sSqlTrans.Fields.Add('es_fechainicest',         edES_FECHAINICEST.Date);
    sSqlTrans.Fields.Add('es_fechasuspensionactiv', edFechaSuspActiv.Date);
    sSqlTrans.Fields.AddInteger('es_idmotivobaja',  fraMotivoBaja.Value, True);
    sSqlTrans.Fields.Add('es_fechareinicioactiv',   edFechaReinicioActiv.Date);
    sSqlTrans.Fields.Add('es_fechabajareal',        dcbFechaBajaEstablecimiento.Date);
    sSqlTrans.Fields.Add('es_fecharecepcionbaja',   edES_FECHARECEPCIONBAJA.Date);
    sSqlTrans.Fields.Add('es_eventual',             String(IIF(cbES_EVENTUAL.Checked, 'S', 'N')));
    sSqlTrans.Fields.Add('es_sinpersonal',          String(IIF(cbSinPersonal.Checked, 'S', 'N')));
    sSqlTrans.Fields.Add('es_sindatos',             String(IIF(cbSinDatos.Checked, 'S', 'N')));
    sSqlTrans.Fields.Add('es_idestabeventual',      Integer(IIF(cbES_EVENTUAL.Checked, fraEstabEventual.ID, 0)), True);
    sSqlTrans.Fields.Add('es_origendato',           fraOrigen.Codigo);

    try
      if not Self.AutoCommit then
        BeginTrans;
      fraTelefono.CopiarTempATelefonos(FIdEstablecimiento);

      sSql :=
        'SELECT SUBSTR(afi.get_telefonos(''ATE_TELEFONOESTABLECIMIENTO'', :idestablecimiento), 1, 60)' +
         ' FROM DUAL';
      sSqlTrans.Fields.Add('es_telefonos', String(ValorSqlEx(sSql, [FIdEstablecimiento])));

      EjecutarSQLST(sSqlTrans.Sql);

      sSql :=
          'SELECT em_cuit' +
           ' FROM aem_empresa, aco_contrato' +
          ' WHERE em_id = co_idempresa' +
            ' AND co_contrato = :contrato';
      Cuit := ValorSqlEx(sSql, [edES_FORMULARIO.Value]);
      saveHepEstabPrev(Cuit, iNroEstableci);

      if not Self.AutoCommit then
        CommitTrans;

      if (Funcion = fsModificar) and (edES_NOMBRE.Tag = 1) and (not Seguridad.Claves.IsActive('NoEnviarEmailAvisoModificacion')) then
      // Si es una modificación, el establecimiento LEGAL y hay que avisar la modificación..
      begin
        sSql :=
          'SELECT em_cuit, em_nombre' +
           ' FROM aem_empresa, aco_contrato' +
          ' WHERE em_id = co_idempresa' +
            ' AND co_contrato = :contrato';
        with GetQueryEx(sSql, [edES_FORMULARIO.Value]) do
        try
          sBody :=
            'Se han modificado datos de un establecimiento.' + #13#10 +
            'Los datos de la empresa son:' + #13#10#13#10 +
            'C.U.I.T.: ' + PonerGuiones(FieldByName('em_cuit').AsString) + #13#10 +
            'Contrato: ' + edES_FORMULARIO.Text + #13#10 +
            'Nº Establecimiento: ' + sdqDatos.FieldByName('es_nroestableci').AsString + #13#10 +
            'Razón social: ' + FieldByName('em_nombre').AsString + #13#10 +
            'Superficie: ' + FloatToStr(edSuperficie.Value) + ' mts2' + #13#10 +
            'Descripción de la actividad: ' + edDescripcionActividad.Text + #13#10#13#10 +
            'Los datos del domicilio del establecimiento son:' + #13#10 +
            'Calle: ' + fraDomicilio.Calle + #13#10 +
            'Número: ' + fraDomicilio.Numero + #13#10 +
            'Piso: ' + fraDomicilio.Piso + #13#10 +
            'Depto.: ' + fraDomicilio.Departamento + #13#10 +
            'Código Postal: ' + fraDomicilio.CodigoPostal + #13#10 +
            'CPA: ' + fraDomicilio.CPA + #13#10 +
            'Localidad: ' + fraDomicilio.Localidad + #13#10 +
            'Provincia: ' + fraDomicilio.Provincia + #13#10;
        finally
          Free;
        end;
        unEnvioMail.EnviarMailDB('callo@provart.com.ar,cfiorelli@provart.com.ar',
                                 'Modificación de datos de un establecimiento', [oAutoFirma, oSinNotaAlPie], sBody, nil,
                                 edES_FORMULARIO.Value);
      end;
      
      MessageDlg('Los datos se han grabado correctamente.', mtInformation, [mbOK], 0);

      sdqDatos.Refresh;
      if Funcion = fsAgregar then
        tlbNuevoClick(nil);
    except
      on E: Exception do
      begin
        if not Self.AutoCommit then
          RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmContratoEstablecimiento.tlbBajaClick(Sender: TObject);
var
  iEmpresaId: Integer;
  sCuerpoMail: String;
  sDireccionMail: String;
  sSql: String;
begin
  if Funcion = fsModificar then   // Este es el único caso en el que hay algún establecimiento seleccionado..
  begin
    Verificar((not sdqDatos.Eof) and (not sdqDatos.FieldByName('ES_FECHABAJA').IsNull), Grid, 'Este registro se encuentra dado de baja.');
    Verificar(edES_FECHARECEPCIONBAJA.IsEmpty, Grid, 'Antes de dar de baja un establecimiento, tiene que cargar la fecha de Recepción de la Baja.');
    Verificar(fraMotivoBaja.IsEmpty, Grid, 'Antes de dar de baja un establecimiento, tiene que cargar el motivo de la Baja.');
    Verificar((not edES_FECHARECEPCIONBAJA.IsEmpty) and (dcbFechaBajaEstablecimiento.IsEmpty), dcbFechaBajaEstablecimiento, 'La fecha de baja del establecimiento es obligatoria.');

    iEmpresaId := ValorSqlIntegerEx('SELECT co_idempresa FROM afi.aco_contrato WHERE co_contrato = :contrato', [FContrato]);

    sSql :=
      'SELECT DISTINCT 1' +
                ' FROM hys.hel_estadolote, hys.hrl_relevamientolote, hys.hde_descripcionestadolote' +
               ' WHERE rl_idestableci = :idestableci' +
                 ' AND rl_id = el_rlid' +
                 ' AND de_fechabaja IS NULL' +
                 ' AND de_tipoestado = ''A''' +
                 ' AND de_versegestudio = ''N''' +
                 ' AND el_fechabaja IS NULL' +
                 ' AND de_codigo = el_estado' +
                 ' AND el_operativo <> ''R''';
    if ExisteSqlEx(sSql, [FIdEstablecimiento]) then
      if MsgBox('Este establecimiento tiene lotes de medicina laboral activos.' + #13#10 +
                'Cualquier duda comuniquese con el sector UCAP.' + #13#10 +
                '¿ Desea continuar de todas formas ?', MB_ICONINFORMATION + MB_OKCANCEL ) = IDCANCEL then
      begin
        Exit;
      end
      else
      begin
        sSql :=
          'SELECT 1' +
           ' FROM art.use_usuarios' +
          ' WHERE se_sector = ''AFI''' +
            ' AND se_usuario = :usuario' +
            ' AND se_fechabaja IS NULL';
        if ExisteSqlEx(sSql, [Sesion.UserID]) then
        begin
          sSql :=
            'SELECT em_cuit, em_nombre' +
             ' FROM aem_empresa, aco_contrato' +
            ' WHERE em_id = co_idempresa' +
              ' AND co_contrato = :contrato';
          with GetQueryEx(sSql, [edES_FORMULARIO.Value]) do
          try
            sCuerpoMail :=
              'CUIT: ' + PonerGuiones(FieldByName('em_cuit').AsString) + #13#10 +
              'Contrato: ' + edES_FORMULARIO.Text + #13#10 +
              'Razón social: ' + FieldByName('em_nombre').AsString + #13#10 +
              'Nº Establecimiento: ' + sdqDatos.FieldByName('es_nroestableci').AsString + #13#10 +
              'Nombre Establecimiento: '+ sdqDatos.FieldByName('es_nombre').AsString;
          finally
            Free;
          end;
          sDireccionMail := ValorSql('SELECT art.varios.get_direccionesenviomail(''AMP_BEST'') FROM dual');
          EnviarMailBD(sDireccionMail, 'Baja de Establecimiento ', [], sCuerpoMail, nil, 0, tcDefault, False);
        end;
      end;

    sSql :=
      'SELECT art.hys.get_tienearchivoscargados(em_cuit, es_nroestableci)' +
       ' FROM afi.aco_contrato, afi.aes_establecimiento, afi.aem_empresa' +
      ' WHERE co_idempresa = em_id' +
        ' AND es_contrato = co_contrato' +
        ' AND es_nroestableci = :nroestableci' +
        ' AND co_contrato = :contrato';

    if ValorSqlEx(sSql, [sdqDatos.FieldByName('es_nroestableci').AsString, edES_FORMULARIO.Text]) = 'S' then
    begin
      if MsgBox('Este establecimiento tiene formularios de Higiene y Seguridad activos.' + #13#10 +
                'Cualquier duda comuniquese con el sector UCAP.' + #13#10 +
                '¿ Desea continuar de todas formas ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDCANCEL then
      begin
        Exit;
      end
      else
      begin
        sSql :=
          'SELECT em_cuit, em_nombre' +
           ' FROM aem_empresa, aco_contrato' +
          ' WHERE em_id = co_idempresa' +
            ' AND co_contrato = :contrato';
        with GetQueryEx(sSql, [edES_FORMULARIO.Value]) do
        try
          sCuerpoMail :=
            'CUIT: ' + PonerGuiones(FieldByName('em_cuit').AsString) + #13#10 +
            'Contrato: ' + edES_FORMULARIO.Text + #13#10 +
            'Razón social: ' + FieldByName('em_nombre').AsString + #13#10 +
            'Nº Establecimiento: ' + sdqDatos.FieldByName('es_nroestableci').AsString + #13#10 +
            'Nombre Establecimiento: '+ sdqDatos.FieldByName('es_nombre').AsString + #13#10 +
            'Usuario de Baja: ' + Sesion.Usuario;
        finally
          Free;
        end;

        sDireccionMail := ValorSql('SELECT art.varios.get_direccionesenviomail(''HYS_REF'') FROM dual');
        EnviarMailBD(sDireccionMail, 'Baja de Establecimiento ', [], sCuerpoMail, nil, 0, tcDefault, False);
      end;
    end;

    if PermitirBajaEstablecimiento(FContrato) then
    begin
      with TSql.Create('aes_establecimiento') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('es_id',              FIdEstablecimiento, False);
        Fields.Add('es_fechabaja',           SQL_DATETIME, False);
        Fields.Add('es_fechabajareal',       dcbFechaBajaEstablecimiento.Date);
        Fields.Add('es_fecharecepcionbaja',  edES_FECHARECEPCIONBAJA.Date);
        Fields.Add('es_usubaja',             frmPrincipal.DBLogin.UserId);
        Fields.AddInteger('es_idmotivobaja', fraMotivoBaja.Value, True);

        try
          if not Self.AutoCommit then
            BeginTrans;

          EjecutarSqlST(Sql);
          EjecutarStoreSTEx('hys.do_actualizarestado(:idempresa, :nroestablecimiento);',
                            [iEmpresaId, sdqDatos.FieldByName('es_nroestableci').AsInteger]);

          if not TraspasarTrabajadores(Self.AutoCommit, FContrato, FIdEstablecimiento) then
            Abort;

          if not Self.AutoCommit then
            CommitTrans;

          if not (Grid.SelectedRows.Count > 1) then
          begin
            sdqDatos.Close;
            OpenQuery(sdqDatos);
          end;
        except
          on E: Exception do
          begin
            if not Self.AutoCommit then
              RollBack;
            ErrorMsg(E, 'Error al guardar los datos.');
          end;
        end;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmContratoEstablecimiento.tlbImprimirClick(Sender: TObject);
begin
  try
    if sdqDatos.Active and (not sdqDatos.IsEmpty) and PrintDialog.Execute then
    begin
      QueryPrint.SubTitle.Lines.Add('Contrato: ' + IntToStr(FContrato));
      QueryPrint.SetGridColumns(Grid, True, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := CaptionBase;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmContratoEstablecimiento.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

function TfrmContratoEstablecimiento.PermitirBajaEstablecimiento(const aContrato: Integer): Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql :=
    'SELECT COUNT(*)' +
     ' FROM aes_establecimiento' +
    ' WHERE es_contrato = :contrato' +
      ' AND es_fechabaja IS NULL';
  if ValorSqlIntegerEx(sSql, [aContrato]) < 2 then
    MsgBox('La empresa no puede quedar sin establecimientos.')
  else
    Result := True;
end;

procedure TfrmContratoEstablecimiento.tlbBuscarClick(Sender: TObject);
begin
  fraEstablecimientoBusqueda.Clear;
  btnAceptar.Enabled := False;
  if fpBusqueda.ShowModal = mrOk then
    sdqDatos.Locate('ES_ID', fraEstablecimientoBusqueda.Value, []);
end;

procedure TfrmContratoEstablecimiento.OnfraEstablecimientoChange(Sender: TObject);
begin
  btnAceptar.Enabled := fraEstablecimientoBusqueda.IsSelected;
end;

procedure TfrmContratoEstablecimiento.tlbReactivarClick(Sender: TObject);
begin
  ReactivarEstablecimiento;
end;

procedure TfrmContratoEstablecimiento.ReactivarEstablecimiento;
var
  sSql: String;
  Cuit: String;
begin
  if not sdqDatos.Active or sdqDatos.Eof then
    raise Exception.Create('Debe elegir el establecimiento que desea reactivar.');

  if sdqDatos.FieldByName('es_usubaja').IsNull then
    raise Exception.Create('El establecimiento debe estar dado de baja para poder ser reactivado.');

  with TSQL.Create('aes_establecimiento') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('es_id',             FIdEstablecimiento, False);
    Fields.Add('es_fechabaja',          'NULL', False);
    Fields.Add('es_fechabajareal',      'NULL', False);
    Fields.Add('es_fechamodif',         SQL_DATETIME, False);
    Fields.Add('es_fecharecepcionbaja', 'NULL', False);
    Fields.Add('es_idmotivobaja',       'NULL', False);
    Fields.Add('es_usubaja',            'NULL', False);
    Fields.Add('es_usumodif',           frmPrincipal.DBLogin.UserId);

    try
      if not Self.AutoCommit then
        BeginTrans;
      EjecutarSQLST(Sql);
      sSql :=
          'SELECT em_cuit' +
           ' FROM aem_empresa, aco_contrato' +
          ' WHERE em_id = co_idempresa' +
            ' AND co_contrato = :contrato';
      Cuit := ValorSqlEx(sSql, [edES_FORMULARIO.Value]);
      saveHepEstabPrev(Cuit, sdqDatos.FieldByName('es_nroestableci').AsInteger);

      if not Self.AutoCommit then
        CommitTrans;

      sdqDatos.Close;
      OpenQuery(sdqDatos);
    except
      on E: Exception do
      begin
        if not Self.AutoCommit then
          RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoEstablecimiento.tbExportarClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (Grid.DataSource.DataSet.Active) and (not Grid.DataSource.DataSet.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      bAutoCols := (ExportDialog.Fields.Count = 0);
      try
        if bAutoCols then
          ExportDialog.Fields.Assign(Grid.Columns);

        ExportDialog.Execute;
      finally
        if bAutoCols then
          ExportDialog.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmContratoEstablecimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fraTelefono.QuitarTelefonosTemporales;
end;

procedure TfrmContratoEstablecimiento.FormShow(Sender: TObject);
begin
  if not FInitFrameTelefono then
    fraTelefono.Initialize(Self.AutoCommit, 'TE_IDESTABLECIMIENTO', 'TE', 'ATE_TELEFONOESTABLECIMIENTO');

  FInitFrameTelefono := True;
end;

procedure TfrmContratoEstablecimiento.tbHistoricoClick(Sender: TObject);
begin
  frmHistoricoEstablecimiento := TfrmHistoricoEstablecimiento.Create(Self);
  frmHistoricoEstablecimiento.CargarDatos(sdqDatos.FieldByName('es_contrato').AsInteger,
                                          sdqDatos.FieldByName('es_nroestableci').AsInteger);
end;

procedure TfrmContratoEstablecimiento.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );
  SortDialog.Execute;
end;

function TfrmContratoEstablecimiento.GetAutoCommit: Boolean;
begin
  Result := FAutoCommit;
end;

function TfrmContratoEstablecimiento.GetNombreOriginal(aNombre: String): String;
var
  iPos: Integer;
begin
  iPos := Pos(' (LEGAL)', aNombre);
  if iPos > 0 then
    Delete(aNombre, iPos, 8);
  Result := aNombre;
end;


procedure TfrmContratoEstablecimiento.SetAutoCommit(aValue :Boolean);
begin
  FAutoCommit := aValue;
end;

function TfrmContratoEstablecimiento.TraspasarTrabajadores(const aAutoCommit: Boolean; const aContrato,
                                                           aEstablecimiento: Integer): Boolean;
var
  iEstablecimientoId: Integer;
  sSql: String;
begin
  Result := False;

  if Seguridad.Claves.IsActive('PreguntarAlDarDeBaja') then
  begin
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM aes_establecimiento' +
      ' WHERE es_contrato = :contrato' +
        ' AND es_id <> :id' +
        ' AND es_fechabaja IS NULL';
    if ValorSqlIntegerEx(sSql, [FContrato, FIdEstablecimiento]) > 0 then
    begin
      if fpTraspasoTrabajadores.ShowModal = mrOk then
        Result := True;
    end
    else
    begin
      rbDarBaja.Checked := True;
      Result := True;
    end;
    iEstablecimientoId := fraEstablecimientoNuevo.Value;
  end
  else
  begin
    sSql :=
      'SELECT MIN(es_id)' +
       ' FROM aes_establecimiento' +
      ' WHERE es_contrato = :contrato' +
        ' AND es_nroestableci <> :establecimiento' +
        ' AND es_fechabaja IS NULL';
    iEstablecimientoId := ValorSqlIntegerEx(sSql, [FContrato, sdqDatos.FieldByName('es_nroestableci').AsInteger]);

    rbTraspasar.Checked := True;
    Result := True;
  end;

  if not Result then
    Exit;

  if rbTraspasar.Checked then
  begin
    if iEstablecimientoId <> 0 then
    begin
      sSql :=
        'UPDATE cre_relacionestablecimiento' +
          ' SET re_idestablecimiento = :idestablecimiento,' +
              ' re_usumodif = :usumodif,' +
              ' re_fechamodif = SYSDATE' +
        ' WHERE re_idestablecimiento = :estViejo' +
          ' AND re_idrelacionlaboral IN(SELECT rl_id' +
                                        ' FROM crl_relacionlaboral' +
                                       ' WHERE rl_contrato = :contrato)' +
          ' AND NOT EXISTS(SELECT 1' +
                           ' FROM cre_relacionestablecimiento cre' +
                          ' WHERE cre.re_idestablecimiento = ' + SqlNumber(iEstablecimientoId, True) +
                            ' AND cre.re_idrelacionlaboral = cre_relacionestablecimiento.re_idrelacionlaboral)';
      if aAutoCommit then
        EjecutarSqlEx(sSql, [iEstablecimientoId, Sesion.UserID, aEstablecimiento, aContrato])
      else
        EjecutarSqlSTEx(sSql, [iEstablecimientoId, Sesion.UserID, aEstablecimiento, aContrato]);
    end;

    sSql :=
      'DELETE FROM cre_relacionestablecimiento' +
           ' WHERE re_idestablecimiento = :idestablecimiento' +
             ' AND re_idrelacionlaboral IN(SELECT rl_id' +
                                           ' FROM crl_relacionlaboral' +
                                          ' WHERE rl_contrato = :contrato)';
    if aAutoCommit then
      EjecutarSqlEx(sSql, [aEstablecimiento, aContrato])
    else
      EjecutarSqlSTEx(sSql, [aEstablecimiento, aContrato]);
  end;

  if rbDarBaja.Checked then
  begin
    sSql :=
      'SELECT re_idrelacionlaboral' +
       ' FROM cre_relacionestablecimiento' +
      ' WHERE re_idestablecimiento = :establecimiento' +
        ' AND re_idrelacionlaboral IN(SELECT rl_id' +
                                      ' FROM crl_relacionlaboral' +
                                     ' WHERE rl_contrato = :contrato)';
    with GetQueryEx(sSql, [aEstablecimiento, aContrato]) do
    try
      while not Eof do
      begin
        if aAutoCommit then
          BeginTrans;

        try
          BorrarTrabajador(FieldByName('re_idrelacionlaboral').AsInteger, DBDateTime, Sesion.UserId);

          sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idrelacionlaboral, :usuario); END;';
          EjecutarSqlSTEx(sSql, [FieldByName('re_idrelacionlaboral').AsInteger, Sesion.UserID]);

          if aAutoCommit then
            CommitTrans;
        except
          on E:Exception do
          begin
            if aAutoCommit then
              RollBack;
            MessageDlg(E.Message, mtError, [mbOK], 0);
            Abort;
          end;
        end;
        Next;
        Application.ProcessMessages;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmContratoEstablecimiento.btnAceptar2Click(Sender: TObject);
begin
  Verificar((not rbTraspasar.Checked) and (not rbDarBaja.Checked), nil, 'Debe seleccionar la acción a llevar a cabo con los empleados.');
  Verificar(rbTraspasar.Checked and fraEstablecimientoNuevo.IsEmpty, fraEstablecimientoNuevo.edCodigo, 'Debe seleccionar el establecimiento.');

  fpTraspasoTrabajadores.ModalResult := mrOk;
end;

procedure TfrmContratoEstablecimiento.rbTraspasarClick(Sender: TObject);
begin
  fraEstablecimientoNuevo.Enabled := True;
end;

procedure TfrmContratoEstablecimiento.rbDarBajaClick(Sender: TObject);
begin
  fraEstablecimientoNuevo.Clear;
  fraEstablecimientoNuevo.Enabled := False;
end;

procedure TfrmContratoEstablecimiento.fpTraspasoTrabajadoresBeforeShow(Sender: TObject);
begin
  rbTraspasar.Checked := False;
  rbDarBaja.Checked := False;
  fraEstablecimientoNuevo.Clear;
  fraEstablecimientoNuevo.Contrato := FContrato;
end;

procedure TfrmContratoEstablecimiento.btnCancelar2Click(Sender: TObject);
begin
  fpTraspasoTrabajadores.ModalResult := mrCancel;
end;

procedure TfrmContratoEstablecimiento.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                         Column: TColumn; State: TGridDrawState);
begin
  if LowerCase(Column.FieldName) = 'es_superficie' then
    with Grid do
      if not DataSource.DataSet.FieldByName('es_superficie').IsNull then
      begin
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, DataSource.DataSet.FieldByName('es_superficie').AsString + ' mt2');
      end;
end;

procedure TfrmContratoEstablecimiento.tbReplicarClick(Sender: TObject);
begin
  if Funcion <> fsConsultar then
    Funcion := fsAgregar;

  // Grupo Domicilio
  fraDomicilio.Clear;
  fraTelefono.Clear(True);
  edES_CODAREAFAX.Clear;
  edES_FAX.Clear;
  edES_DOMICILIO.Clear;
  edES_NOMBRE.SetFocus;
end;

procedure TfrmContratoEstablecimiento.tbBajaMultipleClick(Sender: TObject);
var
  i: Integer;
  FRecepBaja, FBajaEstab: TDateTime;
  motivoBaja: String;
begin
  FRecepBaja := edES_FECHARECEPCIONBAJA.Date;
  FBajaEstab := dcbFechaBajaEstablecimiento.Date;
  motivoBaja :=fraMotivoBaja.Codigo;
  for i := 0 to Grid.SelectedRows.Count -1 do
  begin
    sdqDatos.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
    edES_FECHARECEPCIONBAJA.Date := FRecepBaja;
    dcbFechaBajaEstablecimiento.Date := FBajaEstab;
    fraMotivoBaja.Codigo := motivoBaja;
    tlbBajaClick(nil);
  end;
  sdqDatos.Close;
  OpenQuery(sdqDatos)
end;

procedure TfrmContratoEstablecimiento.CambiaActividad(Sender: TObject);
var
  iIdCiiuPosterior: Integer;
  sVersion, sSql: String;
begin
  iIdCiiuPosterior := 1;
  while iIdCiiuPosterior > 0 do
  begin
    sSql :=
      'SELECT MAX(ac_id)' +
      '  FROM cac_actividad' +
      ' WHERE ac_relacion = :relacion' +
      '   AND ac_codigo <> :codigo';
    iIdCiiuPosterior := ValorSqlIntegerEx(sSql, [fraActividad.Codigo, fraActividad.Codigo]);

    if iIdCiiuPosterior > 0 then
    begin
      sVersion := ValorSql('SELECT ac_revision FROM cac_actividad WHERE ac_id = '+SqlValue(iIdCiiuPosterior));
      if MsgAsk('El CIIU seleccionado es de una versión vieja.' + #13#10 + '¿ Desea seleccionar la versión '+sVersion+' de este CIIU  ?') then
        fraActividad.Value := iIdCiiuPosterior
      else
        exit;
    end;
  end;
end;

procedure TfrmContratoEstablecimiento.cbES_EVENTUALClick(Sender: TObject);
begin
  if cbES_EVENTUAL.Checked then
    LockControl(fraEstabEventual, False)
  else
  begin
    fraEstabEventual.Clear;
    LockControl(fraEstabEventual, True);
  end;
end;

procedure TfrmContratoEstablecimiento.fraEstabEventualcmbDescripcionGetCellParams(Sender: TObject; Field: TField;
                                                                                  AFont: TFont; var Background: TColor;
                                                                                  Highlight: Boolean);
begin
  if not fraEstabEventual.sdqDatos.FieldByName('baja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmContratoEstablecimiento.tbEstabTipoEventualClick(Sender: TObject);
var
  frmABMEstabTipoEventual: TfrmABMEstabTipoEventual;
begin
  try
    frmABMEstabTipoEventual := TfrmABMEstabTipoEventual.Create(Self);
    frmABMEstabTipoEventual.Visible := False;
    frmABMEstabTipoEventual.ShowModal;
  finally
    FreeAndNil(frmABMEstabTipoEventual);
  end;
end;

procedure TfrmContratoEstablecimiento.SetIDAvisoObraWeb(aValue: Integer);
begin
  FIDAvisoObraWeb := aValue;
end;

end.
