unit unImprimeContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, PatternEdit, CardinalEdit,
  ExtCtrls, Mask, ToolEdit, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Buttons,
  artSeguridad, RxToolEdit;

type
  TfrmImprimeContrato = class(TForm)
    Bevel1: TBevel;
    Label20: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    chkAnexo: TCheckBox;
    chkCliente: TCheckBox;
    chkAseguradora: TCheckBox;
    chkAseguradoraArchivo: TCheckBox;
    edCantCopias: TCardinalEdit;
    chkGeneraArchivoNomina: TCheckBox;
    chkContrato: TCheckBox;
    chkEndoso: TCheckBox;
    chkNomina: TCheckBox;
    Label1: TLabel;
    edNombre: TFilenameEdit;
    chkImprimirMembrete: TCheckBox;
    chkCartaBienvenida: TCheckBox;
    gbCartaBienvenida: TGroupBox;
    fraTexto: TfraStaticCodigoDescripcion;
    lbTexto: TLabel;
    fraFirmante: TfraStaticCodigoDescripcion;
    fraCorreo: TfraStaticCTB_TABLAS;
    lbFirmante: TLabel;
    lbCorreo: TLabel;
    btnEnviarPorEmail: TBitBtn;
    Seguridad: TSeguridad;
    chkImpresionContratoActual: TCheckBox;
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure ActualizaChecks(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkCartaBienvenidaClick(Sender: TObject);
    procedure btnEnviarPorEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FEsRenovacionAutomatica: Boolean;
    FNombreArchivoAnexoA: String;
    FNombreArchivoCartaBienvenida: String;
    FNombreArchivoCondiciones: String;
    FNombreArchivoContratoAseguradora: String;
    FNombreArchivoContratoAseguradoraArchivo: String;
    FNombreArchivoContratoCliente: String;
    FNombreArchivoEndoso: String;
    FNombreArchivoFormularioRectificacion: String;
    FNombreArchivoNomina: String;

    listContratos: TStringList;
    listEndosos: TStringList;
    listTipoEndosos: TStringList;

    function EsDomicilioPostalIgualLegal(const aIdEndoso: Integer): Boolean;
    function Get_TipoContrato(Contrato: Integer; FechaVigencia: TDateTime): String;
    function Get_EsPCP(const Contrato: Integer): boolean;
    function GetImprimeMembrete: Boolean;
    function GetNombreEmpresa(const aContrato: Integer): String;
    function Validar: Boolean;

    procedure Get_IdEndoso_FVigenciaDesde(Contrato: Integer; var IdEndoso: Integer; var FVigenciaDesde: TDateTime);
    procedure SetImprimeMembrete(const aValue: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Clear;
    procedure Do_ImprimirAnexoA(aContrato, aCantCopias: Integer; var aTieneEstablecimientos: Boolean;
                                const aNombreArchivo: String = '');
    procedure Do_ImprimirContrato(Contrato, CantCopias: Integer; ContratoCliente, ContratoAseguradora,
                                  ContratoAseguradoraArchivo: Boolean; const aImprimirClausulas: Boolean = False;
                                  const aNombreArchivoCliente: String = '';
                                  const aNombreArchivoAseguradora: String = '';
                                  const aNombreArchivoAseguradoraArchivo: String = '');
    procedure HabilitarBotonEnvioPorEmail;
    procedure Preparar(const aEnviarPorEmail: Boolean);

    //Propiedades
    property Contratos      : TStringList read listContratos      write listContratos;
    property Endosos        : TStringList read listEndosos        write listEndosos;
    property ImprimeMembrete: Boolean     read GetImprimeMembrete write SetImprimeMembrete;
    property TipoEndosos    : TStringList read listTipoEndosos    write listTipoEndosos;
  end;

const
  NOMBRE_ARCHIVO_CONDICIONES_DESARROLLO = '\\ntintraweb\webserver$\Development\Apps\modules\Afiliaciones\ImpresionContrato\Clausulas.pdf';
  NOMBRE_ARCHIVO_CONDICIONES_PRODUCCION = '\\ntintraweb\webserver$\Production\Apps\modules\Afiliaciones\ImpresionContrato\Clausulas.pdf';
  ARCHIVO_FRGRL_DESARROLLO = '\\ntintraweb\webserver$\Development\Apps\modules\General\FormularioRelevamientoGeneralRiesgoLaboral\frgrl.html';
  ARCHIVO_FRGRL_PRODUCCION = '\\ntintraweb\webserver$\Production\Apps\modules\General\FormularioRelevamientoGeneralRiesgoLaboral\frgrl.html';

var
  frmImprimeContrato: TfrmImprimeContrato;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, unQRContratoNomina, unArt, unQRContrato, unQRContrato2, unQRAnexoA,
  unQREndosoBase, unQREndoso0, unQREndoso1, Printers, SqlFuncs, unCustomDataModule, unRptCartaDocumento,
  unRptCartaDocHeader, unFraCodigoDescripcion, ArchFuncs, unEnvioMail, unMoldeEnvioMail, unPrincipal, unAfiliaciones,
  unQRContrato3, General, unSesion, unRptFormularioValidacionYRectificacionDatosEstablecimientos, unRptPlantillaRGRL,
  unSeleccionDestinatarios, unQrContratoPCP, unQrAnexoPCP;

{$R *.DFM}

procedure TfrmImprimeContrato.btnAceptar2Click(Sender: TObject);
var
  bImprimir: Boolean;
begin
  if not Validar then
    Exit;

  if chkContrato.Checked then
    bImprimir := (MsgBox('Coloque los Contratos pre-impresos de Afiliación (Carta) en la bandeja superior de la impresora y los Anexos (Carta) en la bandeja inferior ¿ Desea continuar ?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    bImprimir := True;

  if bImprimir then
    Preparar(False);
end;

procedure TfrmImprimeContrato.btnCancelar2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImprimeContrato.ActualizaChecks(Sender: TObject);
begin
  chkAseguradora.Enabled             := chkContrato.Checked;
  chkAseguradoraArchivo.Enabled      := chkContrato.Checked;
  chkCliente.Enabled                 := chkContrato.Checked;
  chkImpresionContratoActual.Enabled := chkContrato.Checked;

  chkGeneraArchivoNomina.Enabled  := chkNomina.Checked;
  edNombre.Enabled := chkGeneraArchivoNomina.Enabled and chkGeneraArchivoNomina.Checked;
  if not edNombre.Enabled then
    edNombre.FileName := '';

  HabilitarBotonEnvioPorEmail;
end;

procedure TfrmImprimeContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmImprimeContrato := nil;
  Action := caFree;
end;

procedure TfrmImprimeContrato.Preparar(const aEnviarPorEmail: Boolean);
var
  aBody: TStringList;
  aReporte: TQREndosoBase;
  aTextBody: String;
  bContratoAseguradora: Boolean;
  bContratoAseguradoraArchivo: Boolean;
  bContratoCliente: Boolean;
  bEnviarFormularioValidacionEmail : Boolean;
  bTieneEmpleados: Boolean;
  bTieneEstablecimientos: Boolean;
  CantCopias: Integer;
  EsDecreto1278: Boolean;
  EsMasivo: Boolean;
  EsTarifa: Boolean;
  FechaVigencia: TDateTime;
  iIdEndoso: Integer;
  iFormato: Integer;
  iloop: Integer;
  MotEndoso: String;
  sContrato: String;
  sMotivoEndoso: String;
  SqlResults: TStringList;
  sSql: String;
  TipoEndoso: String;
begin
  bContratoCliente            := chkCliente.Checked;
  bContratoAseguradora        := chkAseguradora.Checked;
  bContratoAseguradoraArchivo := chkAseguradoraArchivo.Checked;
  bTieneEstablecimientos      := False;

  for iloop := 0 to listContratos.Count - 1 do
  begin
    iIdEndoso   := StrToIntDef(Endosos.Strings[iloop], 0);
    sContrato  := Contratos.Strings[iloop];
    TipoEndoso := TipoEndosos.Strings[iloop];

    CantCopias := edCantCopias.Value;
    bEnviarFormularioValidacionEmail := False;

    if chkCartaBienvenida.Checked then
    begin
      FNombreArchivoCartaBienvenida := '';
      if aEnviarPorEmail then
        FNombreArchivoCartaBienvenida := Format(TempPath + 'Carta_Bienvenida_Contrato_%s.pdf', [sContrato]);
      Do_ImprimirCartaBienvenida(StrToInt(sContrato), {$IFDEF RED_PRES} StrToInt(fraTexto.Value) , StrToInt(fraFirmante.Value) {$ELSE} fraTexto.Value, fraFirmante.Value {$ENDIF}, edCantCopias.Value,
                                 fraCorreo.Value, FNombreArchivoCartaBienvenida);
    end;

    if chkContrato.Checked then
    begin
      FNombreArchivoCondiciones := '';
      FNombreArchivoContratoAseguradora := '';
      FNombreArchivoContratoAseguradoraArchivo := '';
      FNombreArchivoContratoCliente := '';
      if aEnviarPorEmail then
      begin
        FNombreArchivoContratoAseguradora        := Format(TempPath + 'Contrato_Aseguradora_%s.pdf', [sContrato]);
        FNombreArchivoContratoAseguradoraArchivo := Format(TempPath + 'Contrato_Aseguradora_Archivo_%s.pdf', [sContrato]);
        FNombreArchivoContratoCliente            := Format(TempPath + 'Contrato_Cliente_%s.pdf', [sContrato]);
        FNombreArchivoCondiciones                := Format(TempPath + 'Condiciones_Contrato_%s.pdf', [sContrato]);

//        if Is_ConectadoProduccion then
//          CopyFileExt(NOMBRE_ARCHIVO_CONDICIONES_PRODUCCION, FNombreArchivoCondiciones, False)
//        else
//          CopyFileExt(NOMBRE_ARCHIVO_CONDICIONES_DESARROLLO, FNombreArchivoCondiciones, False);
      end;
      Do_ImprimirContrato(StrToInt(sContrato), CantCopias, bContratoCliente, bContratoAseguradora,
                          bContratoAseguradoraArchivo, (FNombreArchivoCondiciones <> ''), FNombreArchivoContratoCliente,
                          FNombreArchivoContratoAseguradora, FNombreArchivoContratoAseguradoraArchivo);
    end;

    //Imprime el endoso
    if chkEndoso.Checked then
    begin
      /////////////////////////////////////
      //  Seteo las variables iniciales  //
      /////////////////////////////////////
      sSql :=
        'SELECT en_motivo, hc_origen, TRUNC(NVL(en_vigenciaendoso, en_fechaalta))' +
         ' FROM aen_endoso, ahc_historicocontrato' +
        ' WHERE en_idhistoricocontrato = hc_id' +
          ' AND en_id = ' + SqlValue(iIdEndoso);
      SqlResults := ValoresColSQL(sSql);
      try
        MotEndoso     := SqlResults[0];
        EsTarifa      := (MotEndoso = '02') or (MotEndoso = '10') or (Copy(MotEndoso, 0, 3) = '02.') or
                         (Copy(MotEndoso, 0, 3) = '03.') or (Copy(MotEndoso, 0, 3) = '09.') or
                         (Copy(MotEndoso, 0, 3) = '10.');
        EsDecreto1278 := (MotEndoso = '02.14');
        EsMasivo      := (SqlResults[1] = 'T');
        FechaVigencia := StrToDate(SqlResults[2]);
      finally
        SqlResults.Free;
      end;

      if EsTarifa then
      begin
        if FechaVigencia < StrToDate('01/03/2003') then
        begin
          if EsDecreto1278 or EsMasivo then
            iFormato := 3
          else
            iFormato := 2;
        end
        else
          iFormato := 4;
      end
      else
        iFormato := 0;

      case iFormato of
        0..1:
          aReporte := TQREndoso0.Create(Self);
      else
        aReporte := TQREndoso1.Create(Self);
      end;

      with aReporte do
      try
        Area := AREA_AFI;
        sSql :=
          'SELECT en_motivo' +
           ' FROM aen_endoso' +
          ' WHERE en_id = :id';
        sMotivoEndoso := ValorSqlEx(sSql, [iIdEndoso]);

        if (sMotivoEndoso = '01.11') or (sMotivoEndoso = '01.12') then
        begin
          // Por la forma en que toma su valor la variable iFormato solo entra por aca cuando el valor es 0 o 1..
          TQREndoso0(aReporte).MostrarOtrosCIIU := True;
          TQREndoso0(aReporte).MotivoEndoso := 'Cambio de Actividad';
        end;

        Formato := iFormato;
        IdEndoso  := iIdEndoso;
        ImprimeMembrete := GetImprimeMembrete;

        FNombreArchivoEndoso := '';
        if aEnviarPorEmail then
          FNombreArchivoEndoso := Format(TempPath + 'Endoso_%s_Contrato_%s.pdf', [sMotivoEndoso, sContrato]);

        case iFormato of
          0..1:
            TQREndoso0(aReporte).PrepararImpresion(0, tmNone, False, CantCopias, FNombreArchivoEndoso);
        else
          TQREndoso1(aReporte).PrepararImpresion(0, tmNone, False, CantCopias, FNombreArchivoEndoso);
        end;

//        TQREndoso0(aReporte).PrepararImpresion(0, tmNone, False, CantCopias, FNombreArchivoEndoso);
      finally
        Free;
      end;

      //Imprime Formulario de Rectificacion

      if (FEsRenovacionAutomatica) and (not EsDomicilioPostalIgualLegal(iIdEndoso)) then
      begin
        FNombreArchivoFormularioRectificacion := '';
        //if (MessageDlg('Contrato: '+ sContrato + #13#10 + '¿Desea agregar el formulario de Validación y Rectificación de Datos y Establecimientos?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
        if MsgAsk('Contrato: '+ sContrato + #13#10 + '¿Desea agregar el formulario de Validación y Rectificación de Datos y Establecimientos?') then
        begin
          Application.CreateForm(TqrFormularioValidacionYRectificacionDatosEstablecimientos, qrFormularioValidacionYRectificacionDatosEstablecimientos);
          try
            if aEnviarPorEmail then
            begin
              try
                aBody := TStringList.Create;

                if Is_ConectadoProduccion then
                  aBody.LoadFromFile(ARCHIVO_FRGRL_PRODUCCION)
                else
                  aBody.LoadFromFile(ARCHIVO_FRGRL_DESARROLLO);

                aTextBody := aBody.Text;
                aBody.Free;

                aTextBody := StringReplace(aTextBody, '{#RAZON_SOCIAL#}', GetNombreEmpresa(StrToInt(sContrato)), []);

                FNombreArchivoFormularioRectificacion := Format(TempPath + 'FormRec_Endoso_%s_Contrato_%s.pdf', [sMotivoEndoso, sContrato]);
                qrFormularioValidacionYRectificacionDatosEstablecimientos.FileName := FNombreArchivoFormularioRectificacion;
                bEnviarFormularioValidacionEmail := True;
              except
                ShowMessage('Error');
              end;
            end;
            qrFormularioValidacionYRectificacionDatosEstablecimientos.Preparar(StrToInt(sContrato), False, aEnviarPorEmail);

          finally
            FreeAndNil(qrFormularioValidacionYRectificacionDatosEstablecimientos);
          end;
        //  Application.CreateForm(TqrPlantillaRGRL, qrPlantillaRGRL);
        //  qrPlantillaRGRL.Preparar('Test');
        //  FreeAndNil(qrPlantillaRGRL);
        end;
      end;
    end;

    if chkNomina.Checked then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM aco_contrato, aem_empresa, ctj_trabajador, crl_relacionlaboral' +
        ' WHERE co_idempresa = em_id' +
          ' AND tj_id = rl_idtrabajador' +
          ' AND rl_contrato = co_contrato' +
          ' AND co_contrato = :contrato';
      bTieneEmpleados := ExisteSqlEx(sSql, [sContrato]);
      if bTieneEmpleados then
      begin
        Application.CreateForm(TqrContratoNomina, qrContratoNomina);
        with qrContratoNomina do
        try
          FNombreArchivoNomina := '';
          if aEnviarPorEmail then
            FNombreArchivoNomina := Format(TempPath + 'Nomina_Contrato_%s.pdf', [sContrato])
          else
            FNombreArchivoNomina := edNombre.FileName;

          ImprimeMembrete := GetImprimeMembrete;
          if Preparar(sContrato, FNombreArchivoNomina, aEnviarPorEmail) then
          begin
            if (FNombreArchivoNomina = '') then
              Preview;
          end
          else
            MessageDlg('Se produjo un error al imprimir la nómina.', mtError, [mbOK], 0);
        finally
          Free;
        end;
      end
      else
        MessageDlg('Impresión de Nómina: No hay trabajadores asociados a este contrato.', mtWarning, [mbOK], 0);
    end;

    if chkAnexo.Checked then
    begin
      FNombreArchivoAnexoA := '';
      if aEnviarPorEmail then
        FNombreArchivoAnexoA := Format(TempPath + 'Anexo_A_Contrato_%s.pdf', [sContrato]);

      Do_ImprimirAnexoA(StrToInt(sContrato), CantCopias, bTieneEstablecimientos, FNombreArchivoAnexoA);

      if not bTieneEstablecimientos then
        MessageDlg('Impresión del Anexo A: No hay establecimientos activos asociados a este contrato.', mtWarning, [mbOK], 0);
    end;

    // Envío un e-mail por contrato..
    if aEnviarPorEmail then
      begin
      if bEnviarFormularioValidacionEmail then
        unEnvioMail.EnviarMailBD('', 'Contrato Nº ' + Contratos[0], [oAlwaysShowDialog, oAutoFirma, oDeleteAttach, oDisableBody],
                                 [FNombreArchivoCartaBienvenida, FNombreArchivoContratoCliente,
                                  FNombreArchivoContratoAseguradora, FNombreArchivoContratoAseguradoraArchivo,
                                  FNombreArchivoCondiciones, FNombreArchivoEndoso, FNombreArchivoNomina,
                                  FNombreArchivoAnexoA, FNombreArchivoFormularioRectificacion], aTextBody,
                                  StrToIntDef(sContrato, 0), tcDefault, True, False, 2500, -1, [tdContactoContrato], '',
                                  True)
      else
        unEnvioMail.EnviarMailBD('', 'Contrato Nº ' + Contratos[0], [oAlwaysShowDialog, oAutoFirma, oDeleteAttach],
                                 [FNombreArchivoCartaBienvenida, FNombreArchivoContratoCliente,
                                  FNombreArchivoContratoAseguradora, FNombreArchivoContratoAseguradoraArchivo,
                                  FNombreArchivoCondiciones, FNombreArchivoEndoso, FNombreArchivoNomina,
                                  FNombreArchivoAnexoA, FNombreArchivoFormularioRectificacion]);
      end;

  end;
end;

constructor TfrmImprimeContrato.Create(AOwner: TComponent);
begin
  inherited;

  FNombreArchivoAnexoA                     := '';
  FNombreArchivoCartaBienvenida            := '';
  FNombreArchivoCondiciones                := '';
  FNombreArchivoContratoAseguradora        := '';
  FNombreArchivoContratoAseguradoraArchivo := '';
  FNombreArchivoContratoCliente            := '';
  FNombreArchivoEndoso                     := '';
  FNombreArchivoNomina                     := '';

  listEndosos     := TStringList.Create;
  listTipoEndosos := TStringList.Create;
  listContratos   := TStringList.Create;
  ActualizaChecks(nil);

  with fraTexto do
  begin
    TableName   := 'ctc_textocarta';
    ShowBajas   := False;
    Sql         :=
      'SELECT DISTINCT tc_id ID, tc_codigo codigo, tc_nombre descripcion, tc_fechabaja baja' +
                ' FROM ctc_textocarta, cta_textoarea' +
               ' WHERE tc_id = ta_idtextocarta' +
                 ' AND ta_fechabaja IS NULL' +
                 ' AND ta_idareatexto = ' +SqlValue(TEXTO_BIENVENIDA);
  end;

  with fraFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;

    Sql :=
      'SELECT DISTINCT fi_id ' + CD_ALIAS_ID + ', ' +
                      'fi_id ' + CD_ALIAS_CODIGO + ', ' +
                      'fi_firmante ' + CD_ALIAS_DESC + ', ' +
                      'fi_fechabaja ' + CD_ALIAS_BAJA +
                ' FROM cfi_firma, cfa_firmantearea, cat_areatexto' +
               ' WHERE fi_id = fa_idfirmante' +
                 ' AND at_id = fa_idareatexto' +
                 ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
  end;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
  end;
end;

destructor TfrmImprimeContrato.Destroy;
begin
  inherited;

  listEndosos.Free;
  listTipoEndosos.Free;
  listContratos.Free;
end;

procedure TfrmImprimeContrato.Clear;
begin
  listEndosos.Clear;
  listTipoEndosos.Clear;
  listContratos.Clear;
end;

procedure TfrmImprimeContrato.Do_ImprimirContrato(Contrato, CantCopias: Integer; ContratoCliente, ContratoAseguradora,
                                                  ContratoAseguradoraArchivo: Boolean;
                                                  const aImprimirClausulas: Boolean = False;
                                                  const aNombreArchivoCliente: String = '';
                                                  const aNombreArchivoAseguradora: String = '';
                                                  const aNombreArchivoAseguradoraArchivo: String = '');
var
  dVigenciaDesde: TDateTime;
  iIdEndoso: Integer;
  sSql: String;
  sTipoContrato: String;
  bEsPCP : Boolean;
begin
  Get_IdEndoso_FVigenciaDesde(Contrato, iIdEndoso, dVigenciaDesde);
  sTipoContrato := Get_TipoContrato(Contrato, dVigenciaDesde);
  bEsPCP := Get_EsPCP(Contrato);

  if sTipoContrato = 'E' then
  begin
    // Imprime el contrato..
    {$region 'Imprime Contrato E'}
    if bEsPCP then
    begin
      Application.CreateForm(TQRContratoPCP, QRContratoPCP);
      with QRContratoPCP do
      try
        Endoso := iIdEndoso;
        ImprimeMembrete := GetImprimeMembrete;
        ImprimirClausulas := aImprimirClausulas;

        if ContratoCliente then
          Preparar('PARA EL CLIENTE', CantCopias, True, aNombreArchivoCliente);
        if ContratoAseguradora then
          Preparar('PARA LA ASEGURADORA', CantCopias, True, aNombreArchivoAseguradora);
        if ContratoAseguradoraArchivo then
          Preparar('PARA LA ASEGURADORA - ARCHIVO', CantCopias, True, aNombreArchivoAseguradoraArchivo);
      finally
        Free;
      end;

      Application.CreateForm(TQRAnexoPCP, QRAnexoPCP);
      with QRAnexoPCP do
      try
        QrAnexoPCP.aContrato := Contrato;
        Preparar(CantCopias, True, aNombreArchivoAseguradoraArchivo);
      finally
        Free;
      end;
    end
    else
    begin
      Application.CreateForm(TQRContrato3, QRContrato3);
      with QRContrato3 do
      try
        if iIdEndoso = 2138113 then
          iIdEndoso := 2144988;
        Endoso := iIdEndoso;
        ImprimeMembrete := GetImprimeMembrete;
        ImprimirClausulas := aImprimirClausulas;

        if ContratoCliente then
          Preparar('PARA EL CLIENTE', CantCopias, True, aNombreArchivoCliente);
        if ContratoAseguradora then
          Preparar('PARA LA ASEGURADORA', CantCopias, True, aNombreArchivoAseguradora);
        if ContratoAseguradoraArchivo then
          Preparar('PARA LA ASEGURADORA - ARCHIVO', CantCopias, True, aNombreArchivoAseguradoraArchivo);
      finally
        Free;
      end;
    end;
    {$endregion}
  end
  else if sTipoContrato = 'C' then
  begin
    // Imprime el contrato..
    Application.CreateForm(TQRContrato2, QRContrato2);
    with QRContrato2 do
    try
      Endoso := IntToStr(iIdEndoso);
      ImprimeMembrete := GetImprimeMembrete;

      if ContratoCliente then
        Preparar('PARA EL CLIENTE', CantCopias, True, aNombreArchivoCliente);
      if ContratoAseguradora then
        Preparar('PARA LA ASEGURADORA', CantCopias, True, aNombreArchivoAseguradora);
      if ContratoAseguradoraArchivo then
        Preparar('PARA LA ASEGURADORA - ARCHIVO', CantCopias, True, aNombreArchivoAseguradoraArchivo);
    finally
      Free;
    end;
  end
  else
  begin
    // Imprime el contrato..
    Application.CreateForm(TQRContrato, QRContrato);
    with QRContrato do
    try
      if iIdEndoso = 2138113 then
        iIdEndoso := 2144988;

      Endoso := IntToStr(iIdEndoso);
      ImprimeMembrete := GetImprimeMembrete;

      if ContratoCliente then
        Preparar(sTipoContrato,'PARA EL CLIENTE', CantCopias, True, aNombreArchivoCliente);
      if ContratoAseguradora then
        Preparar(sTipoContrato,'PARA LA ASEGURADORA', CantCopias, True, aNombreArchivoAseguradora);
      if ContratoAseguradoraArchivo then
        Preparar(sTipoContrato,'PARA LA ASEGURADORA - ARCHIVO', CantCopias, True, aNombreArchivoAseguradoraArchivo);
    finally
      Free;
    end;
  end;

  BeginTrans;
  try
    sSql :=
      'SELECT 1' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato' +
        ' AND co_fechaimpresion IS NULL';

    if ExisteSqlEx(sSql, [Contrato]) then
    begin
      sSql :=
        'UPDATE aco_contrato' +
          ' SET co_fechaimpresion = ACTUALDATE,' +
              ' co_usuimpresion = :usuario' +
        ' WHERE co_contrato = :contrato';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, Contrato]);

      Do_ActualizarHistoricoContrato(Contrato, False);
    end
    else
    begin
      sSql :=
        'UPDATE aco_contrato' +
          ' SET co_fechareimpresion = ACTUALDATE,' +
              ' co_usureimpresion = :usuario' +
        ' WHERE co_contrato = :contrato';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, Contrato]);
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la fecha de impresión del contrato.');
    end;
  end;
end;

procedure TfrmImprimeContrato.Do_ImprimirAnexoA(aContrato, aCantCopias: Integer; var aTieneEstablecimientos: Boolean;
                                                const aNombreArchivo: String = '');
var
  dVigenciaDesde: TDateTime;
  iIdEndoso: Integer;
  sSql: String;
  sTipoContrato: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM aes_establecimiento' +
    ' WHERE es_contrato = :contrato' +
      ' AND es_fechabaja IS NULL';
  aTieneEstablecimientos := ExisteSqlEx(sSql, [aContrato]);

  if aTieneEstablecimientos then
  begin
    Get_IdEndoso_FVigenciaDesde(aContrato, iIdEndoso, dVigenciaDesde);
    sTipoContrato := Get_TipoContrato(aContrato, dVigenciaDesde);

    Application.CreateForm(TQRAnexoA, QRAnexoA);
    with QRAnexoA do
    try
      Contrato := aContrato;
      Preparar(aCantCopias, True, aNombreArchivo);
    finally
      Free;
    end;
  end;
end;

function TfrmImprimeContrato.Get_TipoContrato(Contrato: Integer; FechaVigencia: TDateTime): String;
var
  sTipoContrato: String;
begin
  // Define que contrato debe imprimir..
  if chkImpresionContratoActual.Checked then
    sTipoContrato := 'E'
  else if (FechaVigencia >= StrToDate('01/08/2009')) then
    sTipoContrato := 'E'
  else if (Contrato <= 42900) and (FechaVigencia < StrToDate('01/08/1997')) then
    sTipoContrato := 'C'
  else if (FechaVigencia < StrToDate('01/08/1997')) then
    sTipoContrato := 'V'
  else if (FechaVigencia < StrToDate('01/07/1998')) then
    sTipoContrato := 'A'
  else if (FechaVigencia < StrToDate('01/03/2003')) then
    sTipoContrato := 'B'
  else
    sTipoContrato := 'D';

  Result := sTipoContrato;
end;

function TfrmImprimeContrato.Get_EsPCP(const Contrato: Integer): boolean;
var
  sSql : String;
begin
  sSql :=
    'SELECT co_idtiporegimen ' +
    '   FROM aco_contrato ' +
    ' WHERE co_contrato = :contrato';
   Result :=  ValorSqlEx(sSql, [Contrato]) = 2;
end;

procedure TfrmImprimeContrato.Get_IdEndoso_FVigenciaDesde(Contrato: Integer; var IdEndoso: Integer;
                                                          var FVigenciaDesde: TDateTime);
var
  aSqlResults: TStringList;
  sSql: String;
begin
  //Busca el endoso correspondiente y la vig. desde
  sSql :=
    'SELECT en_id, hc_vigenciadesde' +
     ' FROM ahc_historicocontrato, aen_endoso' +
    ' WHERE en_contrato = ' + SqlValue(Contrato) +
      ' AND en_endoso = 0' +
      ' AND en_movimiento = 0' +
      ' AND en_idhistoricocontrato = hc_id';
  aSqlResults := ValoresColSQL(sSql);
  try
    IdEndoso       := StrToInt(aSqlResults[0]);
    FVigenciaDesde := StrToDate(aSqlResults[1]);
  finally
    aSqlResults.Free;
  end;
end;

procedure TfrmImprimeContrato.SetImprimeMembrete(const aValue: Boolean);
begin
  chkImprimirMembrete.Checked := aValue;
end;

function TfrmImprimeContrato.GetImprimeMembrete: Boolean;
begin
  Result := chkImprimirMembrete.Checked;
end;

procedure TfrmImprimeContrato.chkCartaBienvenidaClick(Sender: TObject);
begin
  lbTexto.Enabled := chkCartaBienvenida.Checked;
  fraTexto.Enabled := chkCartaBienvenida.Checked;

  lbFirmante.Enabled := chkCartaBienvenida.Checked;
  fraFirmante.Enabled := chkCartaBienvenida.Checked;

  lbCorreo.Enabled := chkCartaBienvenida.Checked;
  fraCorreo.Enabled := chkCartaBienvenida.Checked;


end;

procedure TfrmImprimeContrato.btnEnviarPorEmailClick(Sender: TObject);
begin
  if Validar then
    Preparar(True);
end;

procedure TfrmImprimeContrato.FormShow(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM aen_endoso' +
    ' WHERE en_id = :id' +
      ' AND en_motivo = ''11''';
  FEsRenovacionAutomatica := ExisteSqlEx(sSql, [listEndosos[0]]);
  HabilitarBotonEnvioPorEmail;
end;

procedure TfrmImprimeContrato.HabilitarBotonEnvioPorEmail;
begin
  btnEnviarPorEmail.Enabled := (FEsRenovacionAutomatica) and (not chkContrato.Checked) and (chkEndoso.Checked) and (not chkAnexo.Checked) and (not chkNomina.Checked);

  // Habilito el botón para enviar e-mails siempre..hasta que alguien chille..
  btnEnviarPorEmail.Enabled := True;
end;

function TfrmImprimeContrato.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(chkContrato.Checked and (not chkAseguradora.Checked) and (not chkAseguradoraArchivo.Checked) and (not chkCliente.Checked), btnAceptar2, 'Debe elegir a quien destina el contrato.');
  Verificar(chkGeneraArchivoNomina.Enabled and chkGeneraArchivoNomina.Checked and (edNombre.Filename = ''), btnAceptar2, 'Debe elegir el nombre del archivo donde quiere guardar la nómina.');
  Verificar(chkCartaBienvenida.Checked and fraTexto.IsEmpty, fraTexto, 'Por favor, escoja el texto de la carta de bienvenida.');
  Verificar(chkCartaBienvenida.Checked and fraFirmante.IsEmpty, fraFirmante, 'Por favor, escoja el firmante de la carta de bienvenida.');
  Verificar(chkCartaBienvenida.Checked and fraCorreo.IsEmpty, fraCorreo, 'Por favor, escoja el correo de la carta de bienvenida.');

  if Contratos.Count = 1 then
  begin
     if Get_TipoRegimen(StrToInt(Contratos[0])) = 2  then
       Verificar((chkCartaBienvenida.Checked) and (fraTexto.Codigo <> '993'),fraTexto ,'Por favor, seleccione texto 993 - Carta de Bienvenida Régimen Casas Particulares, para contratos con régimen especial.');
  end;

  sSql :=
    'SELECT 1' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato IN(' + IIF((listContratos.CommaText = ''), '-1', listContratos.CommaText)  + ')' +
      ' AND co_fechaimpresion IS NULL';
  if ExisteSql(sSql) then
    Verificar((chkContrato.Checked) and (not Seguridad.Claves.IsActive('ImprimirContrato')), chkContrato, 'Usted no tiene permiso para imprimir contratos.')
  else
    Verificar((chkContrato.Checked) and (not Seguridad.Claves.IsActive('ReImprimirContrato')), chkContrato, 'Usted no tiene permiso para reimprimir contratos.');

  Result := True;
end;

function TfrmImprimeContrato.EsDomicilioPostalIgualLegal(const aIdEndoso: Integer): Boolean;
var
  sSql : String;
begin
  sSql :=
    'SELECT ahd_legal.hd_calle AS calle_legal, ahd_postal.hd_calle AS calle_postal,' +
          ' ahd_legal.hd_numero AS numero_legal, ahd_postal.hd_numero AS numero_postal,' +
          ' ahd_legal.hd_piso as piso_legal, ahd_postal.hd_piso as piso_postal,' +
          ' ahd_legal.hd_departamento as departamento_legal, ahd_postal.hd_departamento as departamento_postal,' +
          ' ahd_legal.hd_cpostala as cpostala_legal, ahd_postal.hd_cpostala as cpostala_postal,' +
          ' ahd_legal.hd_localidad as localidad_legal, ahd_postal.hd_localidad as localidad_postal,' +
          ' ahd_legal.hd_provincia as provincia_legal, ahd_postal.hd_provincia as provincia_postal' +
     ' FROM aen_endoso aen' +
' LEFT JOIN ahd_historicodomicilio ahd_legal ON aen.en_idhistoricodomicilio = ahd_legal.hd_id' +
' LEFT JOIN ahd_historicodomicilio ahd_postal ON aen.en_idhistoricodomiciliopostal = ahd_postal.hd_id' +
    ' WHERE aen.en_id = :id';

  with GetQueryEx(sSql, [aIdEndoso]) do
    try
      if not Eof then
        Result := (Trim(FieldByName('calle_legal').AsString) = Trim(FieldByName('calle_postal').AsString)) and //Algunos domicilios son iguales
                   (Trim(FieldByName('numero_legal').AsString) = Trim(FieldByName('numero_postal').AsString)) and
                   (Trim(FieldByName('piso_legal').AsString) = Trim(FieldByName('piso_postal').AsString)) and
                   (Trim(FieldByName('departamento_legal').AsString) = Trim(FieldByName('departamento_postal').AsString)) and
                   (Trim(FieldByName('cpostala_legal').AsString) = Trim(FieldByName('cpostala_postal').AsString)) and
                   (Trim(FieldByName('localidad_legal').AsString) = Trim(FieldByName('localidad_postal').AsString)) and
                   (Trim(FieldByName('provincia_legal').AsString) = Trim(FieldByName('provincia_postal').AsString))
                                                                                                              //pero tienen atras espacios.
      else
        Result := False;
    finally
      Free;
    end;
end;

function TfrmImprimeContrato.GetNombreEmpresa(const aContrato: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT em_nombre' +
     ' FROM aco_contrato' +
' LEFT JOIN aem_empresa on co_idempresa = em_id' +
    ' WHERE co_contrato = :idcontrato';

  with GetQueryEx(sSql, [aContrato]) do
  try
    if not Eof then
      Result := FieldByName('em_nombre').AsString
    else
      Result := '';
  finally
    Free;
  end;
end;

end.
