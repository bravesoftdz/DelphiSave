unit unAfiGeneracionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, unArtFrame, unArtDbFrame,
  unFraEmpresa, unFraEmpresaAfi, Placemnt, artSeguridad, unFraCodigoDescripcion, unfraCtbTablas, Grids, StaticGrid,
  RxRichEd, unFraToolbarRTF, SDEngine, Db, unArt, unFraEmpresaSolicitud, CurrEdit, Mask, ToolEdit, DateComboBox,
  PeriodoPicker, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArtDBAwareFrame, Variants, unFraUsuario,
  unfraCodigoDescripcionExt, FormPanel, FolderDialog, RxPlacemnt, RxCurrEdit,
  RxToolEdit;

type
  TAccion = (taSolicitudesAceptar, taSolicitudesRechazar, taSolicitudesNoAceptar,
             taFormularioEndoso, taTemporal, taAdminCartas, taEventoAlta, taEventoModificacion);

  TfrmAfiGeneracionCartas = class(TForm)
    Seguridad1: TSeguridad;
    FormPlacement1: TFormPlacement;
    sdqDatos: TSDQuery;
    sduDatos: TSDUpdateSQL;
    PanelSup: TPanel;
    pnEmpresa: TPanel;
    Label1: TLabel;
    fraEmpresaCartaDoc: TfraEmpresaSolicitud;
    pnEstado: TPanel;
    lbEstado: TLabel;
    fraEstado: TfraStaticCTB_TABLAS;
    pnEventos: TPanel;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cmbFecha: TDateComboBox;
    edDeuda: TCurrencyEdit;
    edObsEvento: TMemo;
    edTI_PERIODO: TPeriodoPicker;
    fraEventos: TfraStaticCTB_TABLAS;
    pnlDatos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraCtbTablasCorreo: TfraStaticCTB_TABLAS;
    fraCodigoCodTexto: TfraStaticCodigoDescripcion;
    fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS;
    fraCodigoModulo: TfraStaticCodigoDescripcion;
    fraCodigoCodFirmante: TfraStaticCodigoDescripcion;
    Panel1: TPanel;
    Label7: TLabel;
    edObservaciones: TMemo;
    PanelInf: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnImprimir: TButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Panel2: TPanel;
    fraToolbarRTF: TfraToolbarRTF;
    edTexto: TRxRichEdit;
    Splitter1: TSplitter;
    lbEntregaMano: TLabel;
    fraEntregaMano: TfraUsuarios;
    folderDialog: TFolderDialog;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FAccion: TAccion;
    FIdCarta: TTableId;
    FIdEndoso: TTableId;
    FIdFormulario: TTableId;
    FIdsFormulario: Array of Integer;
    FIdTraspasoIngreso: String;
    FImprimeCarta: Boolean;
    FLockearTextoYModulo: Boolean;
    FpbExisteTextoFinal: Boolean;
    FSA_ID: TTableId;
    FUltimoId_fraCodigoCodTexto: TTableId;

    function Ejecutar(aAccion: TAccion): Boolean;
    function IsDatosValidosCartaDoc(aEsAlta: Boolean): Boolean;
    function IsValidarParaEvento: Boolean;

    procedure AceptarClickAdminCartas(Sender: TObject);
    procedure AceptarClickFormTemp(Sender: TObject);
    procedure AceptarClickModifSolic(Sender: TObject);
    procedure AceptarClickModifTrasIngreso(Sender: TObject);
    procedure DoHabilitarTextoCartaYFirmante(aCartaDocImpresa: Boolean);
    procedure fraCodigoCodTextoOnChange(Sender: TObject);
    procedure fraCodigoModuloOnChange(Sender: TObject);
    procedure CambiaCorreo(Sender: TObject);
    procedure CambiaEntregaEnMano(Sender: TObject);
    procedure CambiaFormato(Sender: TObject);
    procedure IntentarEnviarCartaSrt;
    procedure CargarDatosEndosoTarifario(const aIdEndosoTarifario: TTableId);
  public
    // Con este Execute es llamado desde unConsultaSolicitud
    function Execute(aAccion: TAccion; aIdsFormulario: Array of Integer; aSA_ID: TTableId; aEstadoSolicitud: String): Boolean; overload;

    // Con este Execute es llamado desde TAfiAdministracionCartas
    function Execute(aIdCarta: TTableId = ART_EMPTY_ID): Boolean; overload; // Si AIdCarta = ART_EMPTY_ID es un alta, sinó modificación

    // Con este Execute es llamado desde TfrmModificacionContrato y unCuadroTarifarioContrato
    function Execute(aIdFormulario, aIdEndoso, aCodigoContrato: TTableId; aEsTarifa: Boolean; aEsEndosoTemporal: Boolean; aIdEndosoTarifario: TTableId = ART_EMPTY_ID): Boolean; overload;

    // Con este Execute es llamado desde TfrmModificaTraspasoIngresos
    function ExecuteIngreso(aInSql: String; aEvento: String; aFuncion: TFuncionShowForm; var aCargarValores: Boolean;
                            aImprimir: Boolean = False; aCantidadCopias: Integer = -1): Boolean;

    // Con este Execute es llamado desde TfrmModificaTraspasoIngresos
    function ExecuteEgreso(aInSql: String; aEvento: String; aFuncion: TFuncionShowForm; var aCargarValores: Boolean;
                           aImprimir: Boolean = False; aCantidadCopias: Integer = -1): Boolean;
    // Con este Execute es llamado desde TfrmManAMS_MOVIMIENTOSTOCK
    function ExecuteEntregaMaterial(const aInSql: String; const aIdFormulario, aIdFirmante: Integer; aImprimir : boolean = false): Boolean;

    property IdCarta: TTableId read FIdCarta write FIdCarta;
  end;

implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, VCLExtra, DBFuncs, unDmPrincipal, General, unAfiliaciones, unCustomDataModule,
  unRptCartaDocHeader, unComunes, unRptCartaDocumento, unrptCartDocTraspasoIngreso, SqlFuncs, unAfiCartasDoc,
  unImportCryptoSrt, unSeleccionarCarpetaSrt;

{$R *.DFM}

procedure Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
begin
  if Condicion then
  begin
    InvalidMsg(AControl, AText);
    Abort;
  end;
end;

procedure TfrmAfiGeneracionCartas.btnAceptarClick(Sender: TObject);
begin
  FImprimeCarta := (Sender = btnImprimir);
  case Faccion of
    taSolicitudesAceptar, taSolicitudesRechazar, taSolicitudesNoAceptar:
      // TfrmAfiGeneracionCartas ejecutado desde unConsultaSolicitud
      AceptarClickModifSolic(Sender);

    taFormularioEndoso, taTemporal:
      // TfrmAfiGeneracionCartas ejecutado desde TfrmModificacionContrato
      // o desde unCuadroTarifarioContrato
      AceptarClickFormTemp(Sender);

    taAdminCartas:
      // TfrmAfiGeneracionCartas ejecutado desde TfrmAfiAdministracionCartas
      AceptarClickAdminCartas(Sender);

    taEventoAlta:
      if isValidarParaEvento then
        ModalResult := mrOk;//lo maneja el execute correspondiente

    taEventoModificacion:
      // TfrmAfiGeneracionCartas ejecutado desde TfrmModificaTraspasoIngresos
      AceptarClickModifTrasIngreso(Sender);
  end;
  if FImprimeCarta then
    IntentarEnviarCartaSrt;
end;

procedure TfrmAfiGeneracionCartas.AceptarClickAdminCartas(Sender: TObject);
var
  bEsAlta: Boolean;
begin
  bEsAlta := (FIdCarta = ART_EMPTY_ID);

  if IsDatosValidosCartaDoc(bEsAlta) then
  try
    BeginTrans;

    with sdqDatos do
    begin
      if bEsAlta then  // es un alta
      begin
        sdqDatos.Insert;
        FIdCarta := GetSecNextVal('SEQ_CCA_ID');
        FieldByName('ca_id').AsInteger           := FIdCarta;
        FieldByName('ca_idformulario').AsInteger := fraEmpresaCartaDoc.Value;
        FieldByName('ca_iddelegacion').AsInteger := frmPrincipal.DBLogin.Delegacion;
        FieldByName('ca_usualta').AsString       := frmPrincipal.DBLogin.UserID;
        FieldByName('ca_fechaalta').AsDateTime   := Date;
      end
      else // es una modificación
      begin
        Edit;
        FieldByName('ca_id').AsInteger           := FIdCarta;
        FieldByName('ca_usumodif').AsString      := frmPrincipal.DBLogin.UserID;
        FieldByName('ca_fechamodif').AsDateTime  := Date;
      end;

      FieldByName('ca_manual').AsString           := 'S';
      FieldByName('ca_idareatexto').AsInteger     := fraCodigoModulo.Value;
      FieldByName('ca_idtextocarta').AsInteger    := fraCodigoCodTexto.Value;
      FieldByName('ca_correo').AsString           := fraCtbTablasCorreo.Value;
      FieldByName('ca_usuentregaenmano').AsString := fraEntregaMano.Value;
      FieldByName('ca_idfirma').AsInteger         := fraCodigoCodFirmante.Value;
      FieldByName('ca_tiposalida').AsString       := fraCtbTablasTipoSalida.Value;
      FieldByName('ca_observaciones').AsString    := edObservaciones.Text;

      if edTexto.Modified then
        TStringToField(edTexto.Lines, FieldByName('ca_textofinal'))
      else if not FpbExisteTextoFinal then
        FieldByName('ca_textofinal').AsVariant := Null;

      sdqDatos.Post;
      sdqDatos.ApplyUpdates;
    end;

    if FImprimeCarta then
      with TAfiCartasDoc.Create do
      try
        MostrarCartaDocumento(FIdCarta, tmNone);
      finally
        Free;
      end;

    CommitTrans;
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la carta documento.');
    end;
  end;
end;

procedure TfrmAfiGeneracionCartas.AceptarClickModifSolic(Sender: TObject);
var
  I: Integer;
begin
  if IsDatosValidosCartaDoc(True) then
  begin
    //BeginTrans;
    try
      for I := Low(FIdsFormulario) to High(FIdsFormulario) do
      begin
        sdqDatos.Insert;
        sdqDatos.FieldByName('ca_iddelegacion').AsInteger    := frmPrincipal.DBLogin.Delegacion;
        sdqDatos.FieldByName('ca_usualta').AsString          := frmPrincipal.DBLogin.UserID;
        sdqDatos.FieldByName('ca_fechaalta').AsDateTime      := Date;
        sdqDatos.FieldByName('ca_manual').AsString           := 'N';
        sdqDatos.FieldByName('ca_idareatexto').AsInteger     := fraCodigoModulo.Value;
        sdqDatos.FieldByName('ca_idtextocarta').AsInteger    := fraCodigoCodTexto.Value;
        sdqDatos.FieldByName('ca_correo').AsString           := fraCtbTablasCorreo.Value;
        sdqDatos.FieldByName('ca_usuentregaenmano').AsString := fraEntregaMano.Value;
        sdqDatos.FieldByName('ca_idfirma').AsInteger         := fraCodigoCodFirmante.Value;
        sdqDatos.FieldByName('ca_tiposalida').AsString       := fraCtbTablasTipoSalida.Value;
        sdqDatos.FieldByName('ca_observaciones').AsString    := edObservaciones.Text;

        if edTexto.Modified then
          TStringToField(edTexto.Lines, sdqDatos.FieldByName('ca_textofinal'))
        else if not FpbExisteTextoFinal then
          sdqDatos.FieldByName('ca_textofinal').AsVariant := Null;

        FIdCarta := GetSecNextVal('SEQ_CCA_ID');
        sdqDatos.FieldByName('ca_id').AsInteger           := FIdCarta;
        sdqDatos.FieldByName('ca_idformulario').AsInteger := FIdsFormulario[I];
        sdqDatos.Post;
        sdqDatos.ApplyUpdates;

        if FImprimeCarta then
          with TAfiCartasDoc.Create do
          try
            MostrarCartaDocumento(FIdCarta, tmNone);
          finally
            Free;
          end;
      end;

      //CommitTrans;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        //RollBack;
        ErrorMsg(E, 'Error al grabar la carta documento');
      end;
    end;
  end;
end;

procedure TfrmAfiGeneracionCartas.AceptarClickFormTemp(Sender: TObject);
begin
  if IsDatosValidosCartaDoc(true) then
  begin
    //BeginTrans;
    try
      sdqDatos.Insert;
      FIdCarta := GetSecNextVal('SEQ_CCA_ID');
      sdqDatos.FieldByName('ca_id').AsInteger              := FIdCarta;
      sdqDatos.FieldByName('ca_iddelegacion').AsInteger    := frmPrincipal.DBLogin.Delegacion;
      sdqDatos.FieldByName('ca_usualta').AsString          := frmPrincipal.DBLogin.UserID;
      sdqDatos.FieldByName('ca_fechaalta').AsDateTime      := Date;
      sdqDatos.FieldByName('ca_manual').AsString           := 'N';
      sdqDatos.FieldByName('ca_idareatexto').AsInteger     := fraCodigoModulo.Value;
      sdqDatos.FieldByName('ca_idtextocarta').AsInteger    := fraCodigoCodTexto.Value;
      sdqDatos.FieldByName('ca_correo').AsString           := fraCtbTablasCorreo.Value;
      sdqDatos.FieldByName('ca_usuentregaenmano').AsString := fraEntregaMano.Value;
      sdqDatos.FieldByName('ca_idfirma').AsInteger         := fraCodigoCodFirmante.Value;
      sdqDatos.FieldByName('ca_tiposalida').AsString       := fraCtbTablasTipoSalida.Value;
      sdqDatos.FieldByName('ca_observaciones').AsString    := edObservaciones.Text;
      sdqDatos.FieldByName('ca_idformulario').AsInteger    := FIdFormulario;

      if edTexto.Modified then
        TStringToField(edTexto.Lines, sdqDatos.FieldByName('ca_textofinal'))
      else if not FpbExisteTextoFinal then
        sdqDatos.FieldByName('ca_textofinal').AsVariant := Null;

      if FAccion = taFormularioEndoso then
        sdqDatos.FieldByName('ca_idendoso').AsInteger := FIdEndoso;
      if FAccion = taTemporal then //, CCA_CARTA.CA_IDENDOSO queda en NULL
        sdqDatos.FieldByName('ca_idendosotemp').AsInteger := FIdEndoso;

      sdqDatos.Post;
      sdqDatos.ApplyUpdates;

      if FImprimeCarta then
        with TAfiCartasDoc.Create do
        try
          MostrarCartaDocumento(FIdCarta, tmNone, False, -1, False, True, False, False, True, False, False);
        finally
          Free;
        end;

      //CommitTrans;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        //RollBack;
        ErrorMsg(E, 'Error al grabar la carta documento');
      end;
    end;
  end;
end;

procedure TfrmAfiGeneracionCartas.AceptarClickModifTrasIngreso(Sender: TObject);
var
  sSql: String;
begin
  // En el MODIFICAR el FID contiene el TI_ID
  try
    sSql :=
      'UPDATE ati_traspasoingreso' +
        ' SET ti_observaciones = :observaciones,' +
            ' ti_usumodif = :usumodif,' +
            ' ti_fechamodif = SYSDATE' +
      ' WHERE ti_id = :id';
    EjecutarSqlEx(sSql, [edObsEvento.Text, frmPrincipal.DBLogin.UserId, FIdTraspasoIngreso]);
    
    MsgBox('La operación se realizó con éxito.');
    ModalResult := mrOk;
  except
    on E: Exception do
      ErrorMsg(E, 'Se produjo un error en la actualización.');
  end;
end;

function TfrmAfiGeneracionCartas.IsDatosValidosCartaDoc(aEsAlta: Boolean): Boolean;
begin
  // debe ingresar el nro. de formulario
  // condicion agregada por RCh para que no se realice esta validacion cuando se llega desde ModificacionSolicitud
  Verificar(not (FAccion in [taSolicitudesAceptar, taSolicitudesRechazar, taSolicitudesNoAceptar]) and aEsAlta and not fraEmpresaCartaDoc.IsSelected, fraEmpresaCartaDoc.edFormulario, 'El formulario es obligatorio.');

  // debe ingresar el módulo
  Verificar(aEsAlta and fraCodigoModulo.IsEmpty, fraCodigoModulo.edCodigo, 'El módulo es obligatorio.');

  // debe ingresar el código del texto de la carta
  Verificar(aEsAlta and fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto.edCodigo, 'El texto es obligatorio.');

  // debe ingresar el firmante
  Verificar(fraCodigoCodFirmante.IsEmpty, fraCodigoCodFirmante.edCodigo, 'El firmante es obligatorio.');

  // debe ingresar el tipo de salida de la carta
  Verificar(aEsAlta and fraCtbTablasTipoSalida.IsEmpty, fraCtbTablasTipoSalida.edCodigo, 'El formato es obligatorio.');

  if fraCtbTablasTipoSalida.Codigo = 'CC' then
    Verificar(fraCtbTablasCorreo.IsEmpty and fraEntregaMano.IsEmpty, fraCtbTablasCorreo.edCodigo, 'Debe indicar el correo o el usuario que entregó en mano.')
  else
    Verificar(fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo.edCodigo, 'El correo es obligatorio.');

  // debe haber algún texto
  Verificar(Trim(EdTexto.Text) = '', EdTexto, 'El texto de la carta no puede quedar en blanco.');

  Result := True;
end;

function TfrmAfiGeneracionCartas.IsValidarParaEvento: Boolean;
begin
  Verificar(fraCodigoModulo.IsEmpty, fraCodigoModulo, 'El módulo es obligatorio.');
  Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto, 'El texto es obligatorio.');
  Verificar(fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo, 'El correo es obligatorio.');
  Verificar(fraCodigoCodFirmante.IsEmpty, fraCodigoCodFirmante, 'El firmante es obligatorio.');
  Verificar(fraCtbTablasTipoSalida.IsEmpty, fraCtbTablasTipoSalida, 'El formato es obligatorio.');

  Result := True;
end;

procedure TfrmAfiGeneracionCartas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  FUltimoId_fraCodigoCodTexto := ART_EMPTY_ID;
  FpbExisteTextoFinal         := False;
  FLockearTextoYModulo        := False;

  with fraCodigoModulo do
  begin
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_modulo';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'at_fechabaja';
    ShowBajas   := False;
    Sql         := 'SELECT DISTINCT at_id ' + CD_ALIAS_ID + ',' +
                         ' at_modulo ' + CD_ALIAS_CODIGO + ',' +
                         ' at_descripcion ' + CD_ALIAS_DESC + ',' +
                         ' at_fechabaja ' + CD_ALIAS_BAJA +
                    ' FROM cat_areatexto, cau_areausuario' +
                   ' WHERE at_id = au_idareatexto' +
                     ' AND au_usuario = ' + SqlValue(frmPrincipal.DBLogin.UserId) +
                     ' AND au_fechabaja IS NULL' +
                     ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    OnChange    := fraCodigoModuloOnChange;
  end;

  with fraCodigoCodTexto do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := False;
    OnChange    := fraCodigoCodTextoOnChange;
  end;

  with fraCtbTablasCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
    OnChange  := CambiaCorreo;
  end;

  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''CORRE''' +
      ' AND tb_especial1 = ''D''';
  fraCtbTablasCorreo.Value := ValorSql(sSql);

  with fraEntregaMano do
  begin
    Sql :=
      'SELECT   se_usuario as ' + CD_ALIAS_ID + ', se_usuario as ' + CD_ALIAS_CODIGO + ', se_nombre as ' + CD_ALIAS_DESC + ', se_fechabaja as ' + CD_ALIAS_BAJA +
         ' FROM art.use_usuarios, art.usc_sectores' +
        ' WHERE se_sector = sc_codigo' +
          ' AND (   se_sector IN(''COME'', ''TECNICO'')' +
               ' OR sc_delegacion <> 840' +
               ' OR se_usuario IN (''JBALESTRINI'', ''MCLERICI'', ''FMFIRENZE'',  ''JISABELLA'', ''LSARTORI'')' +
               ' OR se_idsector = 33042)' +    // Sector Afiliaciones, según ticket 22382..
          ' AND se_fechabaja IS NULL' +
          ' AND se_usuariogenerico = ''N''';

    OnChange := CambiaEntregaEnMano;
  end;

  with fraCodigoCodFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  with fraCtbTablasTipoSalida do
  begin
    Clave     := 'TSCDO';
    ShowBajas := False;
    OnChange  := CambiaFormato;
  end;

  fraEmpresaCartaDoc.ShowBajas := True;

  Width := Trunc(Screen.Width * 0.9);
  Height := Trunc(Screen.Height * 0.9);

  fraToolbarRTF.Edit := edTexto;
end;

{ Habilita o deshabilita el ingreso del código del texto de la carta y del firmante }
procedure TfrmAfiGeneracionCartas.DoHabilitarTextoCartaYFirmante(aCartaDocImpresa: Boolean);
var
  bDesHabilitar: Boolean;
  bDesHabilitarTexto: Boolean;
begin
  if (FLockearTextoYModulo) and (not aCartaDocImpresa) then
  begin
    VCLExtra.LockControls(edTexto, True);
    VCLExtra.Lockcontrols([fraCodigoModulo], True);
  end
  else
  begin
    bDesHabilitar := not fraCodigoModulo.IsSelected;

    fraCodigoCodTexto.Locked    := bDesHabilitar;
    fraCodigoCodFirmante.Locked := bDesHabilitar;
    bDesHabilitarTexto          := (bDesHabilitar or aCartaDocImpresa);
    VCLExtra.LockControls(edTexto, bDesHabilitarTexto);
    fraToolBarRTF.Enabled := not bDesHabilitarTexto;

    if bDesHabilitar then
    begin
      fraCodigoCodTexto.Clear;
      fraCodigoCodFirmante.Clear;
      edTexto.Clear;
      edTexto.Modified := False;
      FUltimoId_fraCodigoCodTexto := ART_EMPTY_ID;
    end;
  end;
end;

procedure TfrmAfiGeneracionCartas.fraCodigoModuloOnChange(Sender: TObject);
begin
  fraCodigoCodTexto.Sql := 'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
                                 ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
                                 ' tc_nombre ' + CD_ALIAS_DESC + ',' +
                                 ' tc_fechabaja ' + CD_ALIAS_BAJA +
                            ' FROM ctc_textocarta, cta_textoarea' +
                           ' WHERE tc_id = ta_idtextocarta' +
                             ' AND ta_fechabaja IS NULL' +
                             ' AND ta_idareatexto = ' + SqlValue(fraCodigoModulo.Value);
  if (sdqDatos.IsEmpty and (FAccion = taAdminCartas)) then
    fraCodigoCodTexto.Sql := fraCodigoCodTexto.Sql + ' AND tc_rpt IS NULL ';

  fraCodigoCodFirmante.Sql := 'SELECT fi_id ' + CD_ALIAS_ID + ',' +
                                    ' fi_id ' + CD_ALIAS_CODIGO + ',' +
                                    ' fi_firmante ' + CD_ALIAS_DESC + ',' +
                                    ' fi_fechabaja ' + CD_ALIAS_BAJA +
                               ' FROM cfi_firma, cfa_firmantearea' +
                              ' WHERE fa_idfirmante = fi_id' +
                                ' AND fa_fechabaja IS NULL' +
                                ' AND fa_idareatexto = ' + SqlValue(fraCodigoModulo.Value);

  if Assigned(Sender) then
    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('ca_fechaimpresion').IsNull);
end;

procedure TfrmAfiGeneracionCartas.fraCodigoCodTextoOnChange(Sender: TObject);
var
  bCargarTexto: Boolean;
  bModificaTexto: Boolean;
  iIdHistoricoTextoCarta: Integer;
  sdqTexto: TSDQuery;
  sSql: String;
begin
  if fraCodigoCodTexto.IsEmpty then
    edTexto.Clear
  else
  begin
    if edTexto.Modified or FpbExisteTextoFinal then
    begin
      if MsgBox('Se reemplazará el texto modificado manualmente por el que ha seleccionado.', MB_OK + MB_ICONINFORMATION + MB_YESNO) = IDYES then
        bCargarTexto := True
      else
      begin
        bCargarTexto := False;
        fraCodigoCodTexto.Value := FUltimoId_fraCodigoCodTexto;
      end
    end
    else
      bCargarTexto := True;

    if bCargarTexto then
    begin
      FUltimoId_fraCodigoCodTexto := fraCodigoCodTexto.Value;

      if FIDCarta = ART_EMPTY_ID then
      begin
        sdqTexto := GetQueryEx('SELECT tc_texto FROM ctc_textocarta WHERE tc_id = :id', [FUltimoId_fraCodigoCodTexto]);
        try
          FieldToTString(sdqTexto.FieldByName('tc_texto'), edTexto.Lines);

          // Permite editar o no el campo segun esté frente a un reporte automatico o no
          sSql :=
            'SELECT tc_rpt' +
             ' FROM ctc_textocarta' +
            ' WHERE tc_id = :id';
          bModificaTexto := (ValorSqlEx(sSql, [FUltimoId_fraCodigoCodTexto]) <> '');
        finally
          sdqTexto.Free;
        end;
      end
      else
      begin
        sSql :=
          'SELECT ca_idhistoricotextocarta' +
           ' FROM cca_carta' +
          ' WHERE ca_id = :id';
        iIdHistoricoTextoCarta := ValorSqlIntegerEx(sSql, [FIdCarta]);

        sSql :=
          'SELECT ht_texto' +
           ' FROM comunes.cht_historicotextocarta' +
          ' WHERE ht_id = :id';
        sdqTexto := GetQueryEx(sSql, [iIdHistoricoTextoCarta]);
        try
          FieldToTString(sdqTexto.FieldByName('ht_texto'), edTexto.Lines);

          // Permite editar o no el campo segun esté frente a un reporte automatico o no
          sSql :=
            'SELECT ht_rpt' +
             ' FROM comunes.cht_historicotextocarta' +
            ' WHERE ht_id = :id';
          bModificaTexto := (ValorSqlEx(sSql, [iIdHistoricoTextoCarta]) <> '');
        finally
          sdqTexto.Free;
        end;
      end;

      if not edTexto.ReadOnly then
        VCLExtra.LockControls(edTexto, bModificaTexto);

      edTexto.Modified    := False;
      FpbExisteTextoFinal := False;
    end;
  end;
end;

function TfrmAfiGeneracionCartas.Execute(aIdCarta: TTableId): Boolean;
begin
  FAccion := taAdminCartas;
  pnEstado.Visible := False;
  pnEventos.Visible := False;

  FIdCarta := aIdCarta;
  sdqDatos.Sql.Text :=
    'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ca_observaciones, ca_manual, ca_textofinal,' +
          ' ca_iddelegacion, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ca_idfirmareimpresion,' +
          ' ca_correoreimpresion, ca_idareatexto, ca_fechaimpresion, ca_iddelegacion, ca_idempdeudora, ca_idendoso,' +
          ' ca_idformulario, ca_idendosotemp, ca_usuentregaenmano' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';
  OpenQueryEx(sdqDatos, [aIdCarta]);

  if sdqDatos.IsEmpty then
  begin
    Caption := 'Nueva Carta';
    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('ca_fechaimpresion').IsNull);
  end
  else
  begin
    Caption := 'Modificación de la Carta';

    fraEmpresaCartaDoc.Value := sdqDatos.FieldByName('ca_idformulario').AsInteger;
    fraCodigoModulo.Value := sdqDatos.FieldByName('ca_idareatexto').AsInteger;
    fraCodigoModuloOnChange(nil);

    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('ca_fechaimpresion').IsNull);

    if sdqDatos.FieldByName('ca_fechaimpresion').IsNull then
    begin
      fraCodigoCodFirmante.Value := sdqDatos.FieldByName('ca_idfirma').AsInteger;
      fraCtbTablasCorreo.Value   := sdqDatos.FieldByName('ca_correo').AsString;
    end
    else
    begin
      fraCodigoModulo.Locked        := True;
      fraCodigoCodTexto.Locked      := True;
      fraCtbTablasTipoSalida.Locked := True;

      fraCodigoCodFirmante.Value := NVL(sdqDatos.FieldByName('ca_idfirmareimpresion').Value, sdqDatos.FieldByName('ca_idfirma').Value);
      fraCtbTablasCorreo.Value   := NVL(sdqDatos.FieldByName('ca_correoreimpresion').AsString, sdqDatos.FieldByName('ca_correo').AsString);
    end;

    fraCodigoCodTexto.Value      := sdqDatos.FieldByName('ca_idtextocarta').AsInteger;
    FUltimoId_fraCodigoCodTexto  := fraCodigoCodTexto.Value;
    fraCtbTablasTipoSalida.Value := sdqDatos.FieldByName('ca_tiposalida').AsString;
    fraEntregaMano.Value         := sdqDatos.FieldByName('ca_usuentregaenmano').AsString;
    edObservaciones.Text         := sdqDatos.FieldByName('ca_observaciones').AsString;

    fraEmpresaCartaDoc.Locked    := True;

    FieldToTString( sdqDatos.FieldByName('ca_textofinal'), edTexto.Lines);
    if edTexto.Lines.Count = 0 then
    begin
      FpbExisteTextoFinal := False;
      fraCodigoCodTextoOnChange(nil);
    end
    else
      FpbExisteTextoFinal := True;

    edTexto.Modified := False;
  end;

  Result := (ShowModal = mrOk);
end;

function TfrmAfiGeneracionCartas.Execute(aAccion: TAccion; aIdsFormulario: Array of Integer; aSA_ID: TTableId;
                                         aEstadoSolicitud: String): Boolean;
var
  I: Integer;
  sSql: String;
begin
  SetLength(FIdsFormulario, High(aIdsFormulario) + 1);
  for I := Low(aIdsFormulario) to High(aIdsFormulario) do
    FIdsFormulario[I] := aIdsFormulario[I];
  FSA_ID := aSA_ID;
  Label1.Visible := False;
  fraEmpresaCartaDoc.Visible := False;
  pnEmpresa.Visible := False;
  pnEventos.Visible := False;
  pnEstado.Visible := False;

  if (aEstadoSolicitud = '2.2') or (aEstadoSolicitud = '2.3') or (aEstadoSolicitud = '2.4') or
     (aEstadoSolicitud = '2.5') or (aEstadoSolicitud = '2.6') then
  begin
    fraCodigoModulo.Value := AREATEXTO_ADMINSOLICITUD;
    fraCodigoModuloOnChange(nil);

    sSql :=
      'SELECT NVL(tb_especial2, 0)' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''ESSOL''' +
        ' AND tb_codigo = :codigo';
    fraCodigoCodTexto.Value := ValorSqlIntegerEx(sSql, [aEstadoSolicitud]);
    fraCodigoCodTextoOnChange(nil);
  end;

  if aAccion = taSolicitudesRechazar then
  begin
    lbEstado.Visible := True;
    fraEstado.Visible := True;
    fraEstado.Clave := 'ESSOL';
    fraEstado.ExtraCondition := ' AND tb_codigo <> ''4.1''' +
                                ' AND SUBSTR(tb_codigo, 1, 1) = ''4'' ';
  end;
  
  Result := Ejecutar(aAccion);
end;

function TfrmAfiGeneracionCartas.Execute(aIdFormulario, aIdEndoso, aCodigoContrato: TTableId; aEsTarifa: Boolean;
                                         aEsEndosoTemporal: Boolean; aIdEndosoTarifario: TTableId = ART_EMPTY_ID): Boolean;
begin
  FIdFormulario := aIdFormulario;
  FIdEndoso := aIdEndoso;
  pnEstado.Visible := False;
  pnEventos.Visible := False;
  fraEmpresaCartaDoc.Contrato := aCodigoContrato;
  LockControl(fraEmpresaCartaDoc);

  if aEsTarifa then
  begin
    fraCodigoModulo.Value := AREATEXTO_CAMBIOTARIFA;
    fraCodigoModuloOnChange(nil);
    fraCodigoCodTexto.Value := TEXTO_CAMBIOTARIFA;
    fraCodigoCodTextoOnChange(nil);
    FLockearTextoYModulo := True;
  end;

  if aIdEndosoTarifario <> ART_EMPTY_ID then //Si tiene un endosoTarifario hay que cargar los datos desde la afi.aet_endosotarifario
  begin
    CargarDatosEndosoTarifario(aIdEndosoTarifario);
  end;

  if aEsEndosoTemporal then
    Result := Ejecutar(taTemporal)
  else
    Result := Ejecutar(taFormularioEndoso);
end;

function TfrmAfiGeneracionCartas.ExecuteIngreso(aInSql: String; aEvento: String; aFuncion: TFuncionShowForm;
                                                var aCargarValores: Boolean; aImprimir: Boolean = False;
                                                aCantidadCopias: Integer = -1): Boolean;
var
  aSqlATI: TSQL;
  aSqlCCA: TSQL;
  aTextoFinal: TStringList;
  iIdCarta: Integer;
  sCodTexto: String;
  sNombreReporte: String;
  sSql: String;
  sParceInSql: String;
  AuxParceSql: String;
begin
  Result := False;

  pnEmpresa.Visible := False;
  pnEstado.Visible  := False;

  case aFuncion of
    fsAgregar:
    begin
      //Genero la carta
      fraEventos.Clave := 'EVTIN';
      fraEventos.Value := aEvento;
      pnEventos.Visible := False;
      pnEmpresa.Visible := False;

      sSql :=
        'SELECT NVL(tb_especial1, ''0'')' +
         ' FROM ctb_tablas' +
        ' WHERE tb_clave = ''EVTIN''' +
          ' AND tb_codigo = :codigo';
      sCodTexto := ValorSqlEx(sSql, [aEvento]);

      sSql :=
        'SELECT DISTINCT ta_idareatexto' +
                  ' FROM cat_areatexto, cta_textoarea' +
                 ' WHERE at_id = ta_idareatexto' +
                   ' AND ta_idtextocarta = :idtextocarta';
      fraCodigoModulo.Value := ValorSqlEx(sSql, [sCodTexto]);
      fraCodigoModuloOnChange(nil);
      
      fraCodigoCodTexto.Value := StrToIntDef(sCodTexto, 0);
      fraCodigoCodTextoOnChange(nil);

      sSql :=
        'SELECT tc_rpt' +
         ' FROM ctc_textocarta' +
        ' WHERE tc_id = :id';
      sNombreReporte := ValorSqlEx(sSql, [fraCodigoCodTexto.AsString]);
      //Panel2.Visible := not (NombreReporte <> '');

      LockControls([fraEventos, cmbFecha, edTI_PERIODO, edDeuda, fraCodigoModulo, fraCodigoCodTexto], True);
      LockControls([fraCtbTablasCorreo, fraEntregaMano, fraCodigoCodFirmante, fraCtbTablasTipoSalida, edObservaciones], False);
      LockControls([edObsEvento], False);

      Caption := 'Nueva Carta';
      FAccion := taEventoAlta;

      //iIdCarta := GetSecNextVal('SEQ_CCA_ID');

      sdqDatos.Sql.Text :=
        'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ca_observaciones, ca_manual,' +
              ' ca_textofinal, ca_iddelegacion, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif,' +
              ' ca_idfirmareimpresion, ca_correoreimpresion, ca_idareatexto, ca_fechaimpresion, ca_iddelegacion,' +
              ' ca_idempdeudora, ca_idendoso, ca_idformulario, ca_idendosotemp, ca_usuentregaenmano' +
         ' FROM cca_carta' +
        ' WHERE ca_id = :id';
      FIdCarta := ART_EMPTY_ID;
      OpenQueryEx(sdqDatos, [ART_EMPTY_ID]);



      if (not aCargarValores) or (ShowModal = mrOk) then
      begin
        aSqlCCA := TSQL.Create('cca_carta');
        aSqlATI := TSQL.Create('ati_traspasoingreso');
        try
          try
            BeginTrans;
            aSqlCCA.SqlType := stInsert;
            iIdCarta := GetSecNextVal('SEQ_CCA_ID');
            aSqlCCA.PrimaryKey.Add('ca_id', iIdCarta);

            //Si el tipo de carta es automatica entonces se graba el ID de la ART
            // donde estan actualmente las empresas, sino se graba ID de la AFO_Formulario
            // para identificar cada empresa por separado y hacer el JOIN con la ASA_SOLICITUDAFILIACION
            sSql :=
              'SELECT tc_rpt' +
               ' FROM ctc_textocarta' +
              ' WHERE tc_id = :id';
            if ValorSqlEx(sSql, [fraCodigoCodTexto.Value]) <> '' then
            begin //Carta Automatica
              sSql :=
                'SELECT ar_id' +
                 ' FROM ati_traspasoingreso, aar_art, asa_solicitudafiliacion' +
                ' WHERE sa_idartanterior = ar_id' +
                  ' AND ti_idformulario = sa_idformulario' +
                  ' AND ti_fechabaja IS NULL' +
                  ' AND ti_id IN(' + aInSql + ')';
              aSqlCCA.Fields.Add('ca_idart', ValorSqlInteger(sSql));
            end
            else
            begin //Carta Individual de Traspaso Ingreso
              sSql :=
                'SELECT sa_idformulario' +
                 ' FROM ati_traspasoingreso, asa_solicitudafiliacion' +
                ' WHERE ti_idformulario = sa_idformulario' +
                  ' AND ti_fechabaja IS NULL' +
                  ' AND ti_id IN(' + aInSql + ')';
              aSqlCCA.Fields.Add('ca_idformulario', ValorSqlInteger(sSql), False);
            end;

            aSqlCCA.Fields.Add('ca_idtextocarta',     fraCodigoCodTexto.Value);
            aSqlCCA.Fields.Add('ca_idareatexto',      fraCodigoModulo.Value);
            aSqlCCA.Fields.Add('ca_correo',           fractbTablasCorreo.Value);
            aSqlCCA.Fields.Add('ca_usuentregaenmano', fraEntregaMano.Value);
            aSqlCCA.Fields.Add('ca_tiposalida',       fractbTablasTipoSalida.Value);
            aSqlCCA.Fields.Add('ca_idfirma',          fraCodigoCodFirmante.Value);
            aSqlCCA.Fields.Add('ca_observaciones',    edObservaciones.Text);
            aSqlCCA.Fields.Add('ca_iddelegacion',     frmPrincipal.DBLogin.Delegacion);
            aSqlCCA.Fields.Add('ca_fechaalta',        SQL_ACTUALDATE, False);
            aSqlCCA.Fields.Add('ca_usualta',          frmPrincipal.DBLogin.UserID);
            aSqlCCA.Fields.Add('ca_manual',           'N');

            EjecutarSQLST(aSqlCCA.Sql);

            if edTexto.Modified then
            begin
              aTextoFinal := TStringList.Create;
              try
                aTextoFinal.Text := edTexto.Lines.Text;
                SaveBlob('SELECT ca_textofinal FROM cca_carta WHERE ca_id = ' + SqlInt(iIdCarta),
                         'UPDATE cca_carta SET ca_textofinal = :ca_textofinal WHERE ca_id = ' + SqlInt(iIdCarta),
                         'ca_textofinal', aTextoFinal);
              finally
                aTextoFinal.Free;
              end;
            end;


            //Actualizo los campos que corresponden al ID de la carta en la ATI_TRASPASOINGRESO
            sSql :=
              'UPDATE ati_traspasoingreso' +
                ' SET ti_idcarta = :idcarta' +
              ' WHERE ti_id IN (' + aInSql + ')';
            EjecutarSqlSTEx(sSql, [iIdCarta]);


        //*****  Ingresar Ids de relacion Ati -> cca
            AuxParceSql := aInSql;
            if Pos(',', AuxParceSql) > 0 then
            begin
              sParceInSql := Copy(AuxParceSql, 1, Pos(',', AuxParceSql));
            end
            else
              sParceInSql := AuxParceSql;

            while sParceInSql <> '' do
            begin
              sSql :=
                'SELECT 1 ' +
                '  FROM afi.art_relatraspingcarta' +
                ' WHERE rt_idcarta = :idcarta AND rt_idtraspasoingreso = :idtrasp';

              if not(ExisteSqlEx(sSql, [iIdCarta, StringReplace(sParceInSql, ',', '', [])])) then
              begin

                sSql :=
                  'INSERT INTO afi.art_relatraspingcarta' +
                    ' (rt_idcarta, rt_idtraspasoingreso, rt_fechaalta, rt_usualta) VALUES' +
                    ' (:idcarta, :idtrasp, SYSDATE, :usualta) ';
                EjecutarSqlSTEx(sSql, [iIdCarta, StringReplace(sParceInSql, ',', '', []), frmPrincipal.DBLogin.UserID]);
              end;

              AuxParceSql := StringReplace(AuxParceSql, sParceInSql, '', []);
              if Pos(',', AuxParceSql) = 1 then
                AuxParceSql := StringReplace(AuxParceSql, ',', '', []);

              if Pos(',', AuxParceSql) > 0 then
                sParceInSql := Copy(AuxParceSql, 1, Pos(',', AuxParceSql))
              else
                sParceInSql := AuxParceSql;
            end;
      //******  Fin ingreso de ids de cartas en rela ati -> carta


            //Muestro el report que la tiene que cargar
            if FImprimeCarta then
              with TAfiCartasDoc.Create do
              try
                MostrarCartaDocumento(iIdCarta, tmNone, aImprimir, aCantidadCopias);
              finally
                Free;
              end;
            aCargarValores := False;

            CommitTrans;
          except
            on E: Exception do
            begin
              aCargarValores := True;
              RollBack;
              ErrorMsg(E, 'Error al grabar la carta documento.');
            end;
          end;
        finally
          aSqlCCA.Free;
          aSqlATI.Free;
        end;
      end;
    end;
    fsModificar:
    begin
      sSql :=
        'SELECT ca_idareatexto, ca_idtextocarta, ca_correo, ca_idfirma, ca_tiposalida, ca_observaciones, ca_textofinal,' +
              ' ca_usuentregaenmano' +
         ' FROM ati_traspasoingreso, cca_carta' +
        ' WHERE ti_idcarta = ca_id' +
          ' AND ti_id IN(' + aInSql + ')';
      with GetQuery(sSql) do
      try
        fraCodigoModulo.Value        := FieldByName('ca_idareatexto').AsInteger;
        fraCodigoCodTexto.Value      := FieldByName('ca_idtextocarta').AsInteger;
        fraCodigoCodFirmante.Value   := FieldByName('ca_idfirma').AsInteger;
        fraCtbTablasTipoSalida.Value := FieldByName('ca_tiposalida').AsString;
        fraCtbTablasCorreo.Value     := FieldByName('ca_correo').AsString;
        fraEntregaMano.Value         := FieldByName('ca_usuentregaenmano').AsString;
        edObservaciones.Text         := FieldByName('ca_observaciones').AsString;
        FieldToTString(FieldByName('ca_textofinal'), edTexto.Lines);
      finally
        Free;
      end;

      LockControls([fraEventos, cmbFecha, edTI_PERIODO, edDeuda, fraCodigoModulo, fraCodigoCodTexto, fraCtbTablasCorreo,
                    fraEntregaMano, fraCodigoCodFirmante, fraCtbTablasTipoSalida, edObservaciones], True);
      LockControls([edObsEvento], False);
      Result := Ejecutar(taEventoModificacion);
    end;
  else
    Result := False; // sólo para evitar el warning
  end;
end;

function TfrmAfiGeneracionCartas.ExecuteEgreso(aInSql: String; aEvento: String; aFuncion: TFuncionShowForm;
                                               var aCargarValores: Boolean; aImprimir: Boolean = False;
                                               aCantidadCopias: Integer = -1): Boolean;
var
  iIdCarta: Integer;
  sSqlATE: TSQL;
  sSqlCCA: TSQL;
  sCodTexto: String;
  sNombreReporte: String;
  sSql: String;
begin
  pnEmpresa.Visible := False;
  pnEstado.Visible  := False;
  Result            := False;

  case aFuncion of
    fsAgregar:
    begin
      //Genero la carta
      fraEventos.Clave := 'EVTEG';
      fraEventos.Value := aEvento;
      pnEventos.Visible := False;
      pnEmpresa.Visible := False;
      //sCodTexto := ValorSql('SELECT NVL(tb_especial1,''0'') FROM ctb_tablas WHERE tb_clave = ''EVTEG'' AND tb_codigo = ''' + Evento + '''');
      sCodTexto := aEvento;

      sSql :=
        'SELECT DISTINCT ta_idareatexto' +
                  ' FROM cat_areatexto, cta_textoarea' +
                 ' WHERE at_id = ta_idareatexto' +
                   ' AND ta_idtextocarta = :idtextocarta';
      fraCodigoModulo.Value := ValorSqlIntegerEx(sSql, [sCodTexto]);
      fraCodigoModuloOnChange(nil);

      fraCodigoCodTexto.Value := StrToIntDef(sCodTexto, 0);
      fraCodigoCodTextoOnChange(nil);

      sSql :=
        'SELECT tc_rpt' +
         ' FROM ctc_textocarta' +
        ' WHERE tc_id = :id';
      sNombreReporte := ValorSqlEx(sSql, [fraCodigoCodTexto.AsString]);
      //Panel2.Visible := not (sNombreReporte <> '');

      LockControls([fraEventos, cmbFecha, edTI_PERIODO, edDeuda, fraCodigoModulo, fraCodigoCodTexto], True);
      LockControls([fraCtbTablasCorreo, fraEntregaMano, fraCodigoCodFirmante, fraCtbTablasTipoSalida, edObservaciones], False);
      LockControls([edObsEvento], False);

      Caption := 'Nueva Carta';
      FAccion := taEventoAlta;

      sdqDatos.Sql.Text :=
        'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ca_observaciones, ca_manual,' +
              ' ca_textofinal, ca_iddelegacion, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif,' +
              ' ca_idfirmareimpresion, ca_correoreimpresion, ca_idareatexto, ca_fechaimpresion, ca_iddelegacion,' +
              ' ca_idempdeudora, ca_idendoso, ca_idformulario, ca_idendosotemp, ca_usuentregaenmano' +
         ' FROM cca_carta' +
        ' WHERE ca_id = :id';
      FIdCarta := ART_EMPTY_ID;
      OpenQueryEx(sdqDatos, [ART_EMPTY_ID]);

      if (not aCargarValores) or (ShowModal = mrOk) then
      begin
        sSqlCCA := TSQL.Create('cca_carta');
        sSqlATE  := TSQL.Create('ate_traspasoegreso');
        try
          try
            BeginTrans;
            sSqlCCA.SqlType := stInsert;
            iIdCarta := GetSecNextVal('SEQ_CCA_ID');
            sSqlCCA.PrimaryKey.Add('ca_id', iIdCarta);

            //Si el tipo de carta es automatica entonces se graba el ID de la ART
            // donde estan actualmente las empresas, sino se graba ID de la AFO_Formulario
            // para identificar cada empresa por separado y hacer el JOIN con la ASA_SOLICITUDAFILIACION
            sSql :=
              'SELECT tc_rpt' +
               ' FROM ctc_textocarta' +
              ' WHERE tc_id = :id';
            if ValorSqlEx(sSql, [fraCodigoCodTexto.Value]) <> '' then
            begin //Carta Automatica
              sSql :=
                'SELECT NVL(ar_id, te_idartfutura)' +
                 ' FROM ate_traspasoegreso, aar_art, aco_contrato' +
                ' WHERE co_idartfutura = ar_id' +
                  ' AND te_contrato = co_contrato' +
                  ' AND te_id IN(' + aInSql + ')';
              sSqlCCA.Fields.Add('ca_idart', ValorSqlInteger(sSql));
            end
            else
            begin //Carta Individual de Traspaso egreso
              sSql :=
                'SELECT afiliacion.get_ultendoso(co_idformulario)' +
                 ' FROM ate_traspasoegreso, aco_contrato' +
                ' WHERE te_contrato = co_contrato' +
                  ' AND te_id IN(' + aInSql + ')';
              sSqlCCA.Fields.Add('ca_idendoso', ValorSqlInteger(sSql), False);
            end;

            sSqlCCA.Fields.Add('ca_idtextocarta',     fraCodigoCodTexto.Value);
            sSqlCCA.Fields.Add('ca_idareatexto',      fraCodigoModulo.Value);
            sSqlCCA.Fields.Add('ca_correo',           fractbTablasCorreo.Value);
            sSqlCCA.Fields.Add('ca_usuentregaenmano', fraEntregaMano.Value);
            sSqlCCA.Fields.Add('ca_tiposalida',       fractbTablasTipoSalida.Value);
            sSqlCCA.Fields.Add('ca_idfirma',          fraCodigoCodFirmante.Value);
            sSqlCCA.Fields.Add('ca_observaciones',    edObservaciones.Text);
            sSqlCCA.Fields.Add('ca_iddelegacion',     frmPrincipal.DBLogin.Delegacion);
            sSqlCCA.Fields.Add('ca_fechaalta',        SQL_ACTUALDATE, False);
            sSqlCCA.Fields.Add('ca_usualta',          frmPrincipal.DBLogin.UserID);
            sSqlCCA.Fields.Add('ca_manual',           'N');
            EjecutarSQLST(sSqlCCA.Sql);

            //Actualizo los campos que corresponden al ID de la carta en la ATI_TRASPASOINGRESO
            sSql :=
              'UPDATE ate_traspasoegreso' +
                ' SET te_idcarta = :idcarta' +
              ' WHERE te_id IN(' + aInSql + ')';
            EjecutarSqlSTEx(sSql, [iIdCarta]);

            //Muestro el report que la tiene que cargar
            if FImprimeCarta then
              with TAfiCartasDoc.Create do
              try
                MostrarCartaDocumento(iIdCarta, tmNone, aImprimir, aCantidadCopias);
              finally
                Free;
              end;
            aCargarValores := False;

            CommitTrans;
          except
            on E: Exception do
            begin
              RollBack;
              aCargarValores := True;
              ErrorMsg(E, 'Error al grabar la carta documento.');
            end;
          end;
        finally
          sSqlCCA.Free;
          sSqlATE.Free;
        end;
      end;
    end;
    fsModificar:
    begin
      sSql :=
        'SELECT ca_idareatexto, ca_idtextocarta, ca_correo, ca_idfirma, ca_tiposalida, ca_observaciones, ca_textofinal,' +
              ' ca_usuentregaenmano' +
         ' FROM ate_traspasoegreso, cca_carta' +
        ' WHERE te_idcarta = ca_id' +
          ' AND te_id IN(' + aInSql + ')';
      with GetQuery(sSql) do
      try
        fraCodigoModulo.Value        := FieldByName('ca_idareatexto').AsInteger;
        fraCodigoCodTexto.Value      := FieldByName('ca_idtextocarta').AsInteger;
        fraCodigoCodFirmante.Value   := FieldByName('ca_idfirma').AsInteger;
        fraCtbTablasTipoSalida.Value := FieldByName('ca_tiposalida').AsString;
        fraCtbTablasCorreo.Value     := FieldByName('ca_correo').AsString;
        fraEntregaMano.Value         := FieldByName('ca_usuentregaenmano').AsString;
        edObservaciones.Text         := FieldByName('ca_observaciones').AsString;
        FieldToTString(FieldByName('ca_textofinal'), edTexto.Lines);
      finally
        Free;
      end;

      LockControls([fraEventos, cmbFecha, edTI_PERIODO, edDeuda, fraCodigoModulo, fraCodigoCodTexto, fraCtbTablasCorreo,
                    fraEntregaMano, fraCodigoCodFirmante, fraCtbTablasTipoSalida, edObservaciones], True);
      LockControls([edObsEvento], False);
      Result := Ejecutar(taEventoModificacion);
    end;
  else
    Result := False; // sólo para evitar el warning
  end;
end;

function TfrmAfiGeneracionCartas.Ejecutar(aAccion: TAccion): Boolean;
begin
  Caption := 'Nueva Carta';
  FAccion := aAccion;

  sdqDatos.Sql.Text :=
    'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ca_observaciones, ca_manual, ca_textofinal,' +
          ' ca_iddelegacion, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ca_idfirmareimpresion,' +
          ' ca_correoreimpresion, ca_idareatexto, ca_fechaimpresion, ca_iddelegacion, ca_idempdeudora, ca_idendoso,' +
          ' ca_idformulario, ca_idendosotemp, ca_usuentregaenmano' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';
  FIdCarta := ART_EMPTY_ID;
  OpenQueryEx(sdqDatos, [ART_EMPTY_ID]);
  DoHabilitarTextoCartaYFirmante(False);

  Result := (ShowModal = mrOk);
end;

procedure TfrmAfiGeneracionCartas.CambiaFormato(Sender: TObject);
begin
  // Solo se habilita si es carta documento..
  lbEntregaMano.Enabled := (fraCtbTablasTipoSalida.Codigo = 'CC');
  fraEntregaMano.Enabled := lbEntregaMano.Enabled;
  if not fraEntregaMano.Enabled then
    fraEntregaMano.Clear;
end;

procedure TfrmAfiGeneracionCartas.CargarDatosEndosoTarifario(
  const aIdEndosoTarifario: TTableId);
var
  sSql : String;
begin
    sSql := 'SELECT et_firmado, et_entregamano, et_comunica, et_idtextocarta ' +
            '  FROM afi.aet_endosotarifario aet' +
            ' WHERE et_id =:id ';

    with GetQueryEx(sSql, [aIdEndosoTarifario]) do
    try
      fraCodigoCodTexto.Value := FieldByName('et_idtextocarta').AsInteger;
      {Cuando la opción del suscriptor sea Firma = SI, en el cuadro de la impresión
    	El firmante por DEFAULT es el 557 ACT. FLORENCIA FIRENZE (posibilidad de ser cambiado).
      Cuando la opción del suscriptor sea Firma = NO, en el cuadro de la impresión
      El firmante por DEFAULT es el 430 (.) (posibilidad de ser cambiado). }
      fraCodigoCodFirmante.Value   := IIF(FieldByName('et_firmado').AsString = 'SI', 557, 430);

      {Cuando la opción del suscriptor sea Comunicación = VE
      En el cuadro de la impresión en el dato Texto tiene que decir C  “Carta Documento”.
      En el formato VE “Ventanilla Electrónica”
      En el Correo 10 “Ventanilla Electrónica”. (posibilidad de ser cambiado).

      Cuando la opción del suscriptor sea Comunicación = C
      En el cuadro de la impresión en el dato Texto tiene que decir C “Carta Documento”,
      En el formato C “Carta Documento”
      En el Correo 01 “Correo Argentino”. (con la posibilidad de ser cambiado).

      Cuando la opción del suscriptor sea Comunicación = CC
      En el dato Texto tiene que decir CC “Carta Comercial”
      En el formato CC “Carta Comercial”
      En el Correo 01 “Correo Argentino”. (posibilidad de ser cambiado).

      Cuando la opción del suscriptor sea Comunicación = CC y Entrega en Mano <> NULL
      En el cuadro de la impresión en el dato Texto tiene que decir CC “Carta Comercial”,
      En el formato CC “Carta Comercial”,
      El Correo en blanco
      El usuario el seleccionado por el suscriptor. (posibilidad de ser cambiado).}

      if FieldByName('et_comunica').AsString = 'VE' then
      begin
       // fraCodigoCodTexto
       fraCtbTablasTipoSalida.Codigo := 'VE';
       fraCtbTablasCorreo.Codigo := '10';
      end
      else
      if FieldByName('et_comunica').AsString = 'C' then
      begin
        fraCtbTablasTipoSalida.Codigo := 'C';
        fraCtbTablasCorreo.Codigo := '01';
      end
      else
      if FieldByName('et_comunica').AsString = 'CC' then
      begin
        fraCtbTablasTipoSalida.Codigo := 'CC';
        fraCtbTablasCorreo.Codigo := '01';
      end;

      if (not FieldByName('et_entregamano').IsNull) and (FieldByName('et_comunica').AsString = 'CC') then
      begin
        fraCtbTablasCorreo.Clear;
        fraEntregaMano.Codigo :=  FieldByName('et_entregamano').AsString;
      end;
    finally
      Free;
    end;
end;

procedure TfrmAfiGeneracionCartas.CambiaCorreo(Sender: TObject);
begin
  if fraCtbTablasTipoSalida.Codigo = 'CC' then
    fraEntregaMano.Clear;
end;

procedure TfrmAfiGeneracionCartas.CambiaEntregaEnMano(Sender: TObject);
begin
  if fraCtbTablasTipoSalida.Codigo = 'CC' then
    fraCtbTablasCorreo.Clear;
end;

procedure TfrmAfiGeneracionCartas.IntentarEnviarCartaSrt;
var
  aFileName: String;
  sCarpetaDestino: String;
  iIdConsulta : Integer;
  frmSeleccionarCarpetaSrt : TfrmSeleccionarCarpetaSrt;
begin
  iIdConsulta := -1;
  if fraCtbTablasTipoSalida.Value = 'VE' then
  begin
    frmSeleccionarCarpetaSrt := TfrmSeleccionarCarpetaSrt.Create(Self);
    try
      if frmSeleccionarCarpetaSrt.ShowModal <> mrOk then
        Exit;

      aFileName := '';
      sCarpetaDestino := frmSeleccionarCarpetaSrt.CarpetaDestino;
      if sCarpetaDestino <> '' then
        aFileName := '';
        aFileName := Format('%s%s-%s.pdf', [IncludeTrailingBackslash(sCarpetaDestino),
                                        fraEmpresaCartaDoc.CUIT,
                                        fraEmpresaCartaDoc.edContrato.Text]);

      with TAfiCartasDoc.Create do
      try
        {MostrarCartaDocumento(FIdCarta, tmBeginEnd, False, 1, False, True, False, False, True,
                                True, True, False, '', True, aFileName);}

        if frmSeleccionarCarpetaSrt.EnviarSRT then
        begin
          iIdConsulta := GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');
          LogAuditEnvio(fraEmpresaCartaDoc.CUIT, 'Preparar para enviar', iIdConsulta, FidCarta)
        end;
        if FidCarta <> 0 then
        begin
          MostrarCartaDocumento(FIdCarta, tmBeginEnd, False, 1, False,
                                  True, False, False, True, True,
                                  True, False, '', False, aFileName);
          DeleteFile(Copy(aFileName, 0, Length(aFileName) - 3) + 'qrp');  //Borro el .qrp ya que no me interesa
        end;

        if frmSeleccionarCarpetaSrt.EnviarSRT then
          EnviarSRTResult(aFileName, frmSeleccionarCarpetaSrt.Comunicacion, fraEmpresaCartaDoc.CUIT, frmSeleccionarCarpetaSrt.TipoComunicacion, iIdConsulta, FidCarta);
      finally
        Free;
      end;
    finally
      frmSeleccionarCarpetaSrt.Free;
    end;
  end;
end;

function TfrmAfiGeneracionCartas.ExecuteEntregaMaterial(
  const aInSql: String; const aIdFormulario, aIdFirmante: Integer; aImprimir : boolean = false): boolean;
var
  sSql : String;
  sSqlCCA: TSQL;
  sNombreReporte : String;
  iIdCarta, iIdEndoso: Integer;
begin
  Result := False;
  pnEstado.Visible := False;
  pnEventos.Visible := False;
  fraEmpresaCartaDoc.Value := aIdFormulario;
  LockControl(fraEmpresaCartaDoc);

  sSql := 'SELECT ta_idareatexto ' +
                'FROM ctc_textocarta, cta_textoarea ' +
               'WHERE tc_id = ta_idtextocarta ' +
                  'AND ta_fechabaja IS NULL ' +
                // --AND ta_idareatexto = 132
                  'AND tc_codigo = ''999E''' +
                  'AND tc_fechabaja IS NULL';

      {sSql :=
        'SELECT DISTINCT ta_idareatexto' +
                  ' FROM cat_areatexto, cta_textoarea' +
                 ' WHERE at_id = ta_idareatexto' +
                   ' AND ta_idtextocarta = :idtextocarta'; }

  fraCodigoModulo.Value := ValorSqlIntegerEx(sSql, []);
  fraCodigoModuloOnChange(nil);


  sSql := 'SELECT tc_id ' +
                'FROM ctc_textocarta, cta_textoarea ' +
               'WHERE tc_id = ta_idtextocarta ' +
                  'AND ta_fechabaja IS NULL ' +
                // --AND ta_idareatexto = 132
                  'AND tc_codigo = ''999E''' +
                  'AND tc_fechabaja IS NULL';
  fraCodigoCodTexto.Value := ValorSqlIntegerEx(sSql, []);
  fraCodigoCodTextoOnChange(nil);
  fraCtbTablasTipoSalida.Codigo := 'CC';

  sSql :=
        'SELECT tc_rpt' +
         ' FROM ctc_textocarta' +
        ' WHERE tc_id = :id';
  sNombreReporte := ValorSqlEx(sSql, [fraCodigoCodTexto.AsString]);

  sSqlCCA := TSQL.Create('cca_carta');
  try
    sSqlCCA.SqlType := stInsert;
    iIdCarta := GetSecNextVal('SEQ_CCA_ID');
    sSqlCCA.PrimaryKey.Add('ca_id', iIdCarta);

    //Si el tipo de carta es automatica entonces se graba el ID de la ART
    // donde estan actualmente las empresas, sino se graba ID de la AFO_Formulario
    // para identificar cada empresa por separado y hacer el JOIN con la ASA_SOLICITUDAFILIACION
    sSql :=
            'SELECT afiliacion.get_ultendoso(:idformulario) ' +
                 ' FROM DUAL';
    iIdEndoso := ValorSqlIntegerEx(sSql,[aIdFormulario], -1);
    if iIdEndoso = -1 then
      Abort;

    sSql :=
          'SELECT tc_rpt' +
          ' FROM ctc_textocarta' +
          ' WHERE tc_id = :id';
    if ValorSqlEx(sSql, [fraCodigoCodTexto.Value]) <> '' then
    begin //Carta Automatica
      sSqlCCA.Fields.Add('ca_idtextocarta',     fraCodigoCodTexto.Value);
      sSqlCCA.Fields.Add('ca_idareatexto',      fraCodigoModulo.Value);
      sSqlCCA.Fields.Add('ca_correo',           fractbTablasCorreo.Value);
      sSqlCCA.Fields.Add('ca_usuentregaenmano', fraEntregaMano.Value);
      sSqlCCA.Fields.Add('ca_tiposalida',       fractbTablasTipoSalida.Value);
      sSqlCCA.Fields.Add('ca_idfirma',          aIdFirmante);
      sSqlCCA.Fields.Add('ca_observaciones',    edObservaciones.Text);
      sSqlCCA.Fields.Add('ca_iddelegacion',     frmPrincipal.DBLogin.Delegacion);
      sSqlCCA.Fields.Add('ca_fechaalta',        SQL_ACTUALDATE, False);
      sSqlCCA.Fields.Add('ca_usualta',          frmPrincipal.DBLogin.UserID);
      if iIdEndoso > 0 then
        sSqlCCA.Fields.Add('ca_idendoso',         iIdEndoso);
      sSqlCCA.Fields.Add('ca_manual',           'N');
      sSqlCCA.Fields.Add('ca_idformulario',     aIdFormulario);
      EjecutarSQLST(sSqlCCA.Sql);

      //Actualizo los campos que corresponden al ID de la carta en la ATI_TRASPASOINGRESO
      if aInSql <> '' then
      begin
        sSql :=
           'UPDATE afi.ams_movimientostock' +
              ' SET ms_idcarta = :idcarta' +
            ' WHERE ms_id IN(' + aInSql + ')';
        EjecutarSqlSTEx(sSql, [iIdCarta]);
      end;

      //Muestro el report que la tiene que cargar

      if aImprimir then
        with TAfiCartasDoc.Create do
          try                                     //Quieren ver el preview, cantidad de copias
            MostrarCartaDocumento(iIdCarta, tmNone, False, 1);
          finally
            Free;
          end;
      Result := True;
    end;
  finally
    sSqlCCA.Free;
  end;
end;

end.
