unit unCobAdministracionCartas;

interface
                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unBaseAdministracionCartas, SDEngine, Menus,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, ComCtrls,
  StdCtrls, unFraDomicilioTrab, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CardinalEdit,
  ToolWin, ToolEdit, DateComboBox, unFraUsuario, ComboEditor, CheckCombo, unFraStaticCTB_TABLAS, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit, unArtDbFrame, unFraEmpresa,
  unfraEmpresaDeudora, unArt, unFraCodigoDescripcion, unImpoExpoWizard, DBCheckCombo, unfraCtbTablas, unfraFirmante,
  unFraSDA_DETALLEARCHIVO, unEsperaSimple, RxPlacemnt, RxToolEdit;

type
  TfrmCobAdministracionCartas = class(TfrmBaseAdministracionCartas)
    rbEmpNormal: TRadioButton;
    rbEmpDeudora: TRadioButton;
    fraEmpresaDeudora: TfraEmpresaDeudora;                                                     
    fraEmpresaDatosCartaDoc: TfraEmpresa;
    fraEmpresaDatosActuales: TfraEmpresa;
    mnuImprimirEstadoCuenta: TMenuItem;
    tbCambiarFirmante: TToolButton;
    fpNuevoFirmante: TFormPanel;
    Bevel4: TBevel;
    btnNuevoFirmanteAceptar: TButton;
    btnNuevoFirmanteCancelar: TButton;
    fraNuevoFirmante: TfraStaticCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    rgIntimacion: TRadioGroup;
    rgDatos: TRadioGroup;
    chkFirma: TCheckBox;
    lbFirmante: TLabel;
    procedure FiltroEmpresa(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure mnuImprimirEstadoCuentaClick(Sender: TObject);
    procedure pmnuImprimirPopup(Sender: TObject);
    procedure tbCambiarFirmanteClick(Sender: TObject);
    procedure btnNuevoFirmanteAceptarClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure OpcionesImpresion(Sender: TObject);
  private
    function Is_ExisteArchivoEstCuentaFilaActual(var NombreArchivo: String): Boolean;
  protected
    function GetSql: String; override;
    function GetWhere: String; override;

    procedure DoCargarDatosCartaDoc(IdEndoso: TTableId); override;
    procedure DoCargarDatosActuales(IdEndoso: TTableId); override;
    procedure InicializarComponentes; override;
    procedure NuevaCarta(Sender: TObject); override;
    procedure ValidacionesAdicRegistrosImpresionCartaDoc; override;
    procedure ValidacionesAdicRegistrosEnvioVentElectronica; override;
  public
    procedure MostrarCarta(IdCarta: integer); override;
  end;

implementation

uses
  AnsiSql, unComunes, unCustomDataModule, unRptCartaDocumento, unCobranzas, unDmPrincipal, unGeneracionCartasAdmin,
  CustomDlgs, unPrincipal, unEstadoCuenta, unOpcionesDeImpresion, unSesion, Printers, VCLExtra,
  General;

{$R *.DFM}
                    
procedure TfrmCobAdministracionCartas.DoCargarDatosActuales( IdEndoso: TTableId );
var
  sSql: String;
begin
  inherited;
  // datos de la empresa
  sSql := 'SELECT HM_NOMBRE RSOCIAL, HM_CUIT CUIT, FO_FORMULARIO FORMULARIO, HC_CONTRATO CONTRATO ' +
            'FROM AHM_HISTORICOEMPRESA, AHC_HISTORICOCONTRATO, AEN_ENDOSO, AFO_FORMULARIO ' +
           'WHERE EN_ID=' + SqlValue(IdEndoso) + ' ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND HC_IDFORMULARIO=FO_ID';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      with fraEmpresaDatosActuales do
      begin
        mskCUIT.Text     := FieldByName('CUIT').AsString;
        cmbRSocial.Text  := FieldByName('RSOCIAL').AsString;
        edContrato.Value := FieldByName('CONTRATO').AsInteger;
      end;
  finally
    Free;
  end;
end;

procedure TfrmCobAdministracionCartas.DoCargarDatosCartaDoc(IdEndoso: TTableId);
var
  sSql: String;
begin
  inherited;
  // datos de la empresa
  sSql := 'SELECT HM_NOMBRE RSOCIAL, HM_CUIT CUIT, FO_FORMULARIO FORMULARIO, HC_CONTRATO CONTRATO ' +
            'FROM AHM_HISTORICOEMPRESA, AHC_HISTORICOCONTRATO, AEN_ENDOSO, AFO_FORMULARIO ' +
           'WHERE EN_ID=' + SqlValue(IdEndoso) + ' ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND HC_IDFORMULARIO=FO_ID';

  with GetQuery(sSql) do
  try
    if not IsEmpty then
      with fraEmpresaDatosCartaDoc do
      begin
        mskCUIT.Text     := FieldByName('CUIT').AsString;
        cmbRSocial.Text  := FieldByName('RSOCIAL').AsString;
        edContrato.Value := FieldByName('CONTRATO').AsInteger;
      end;
  finally
    Free;
  end;
end;

function TfrmCobAdministracionCartas.GetSql: String;
var
  sSql, sCAT, sOuterCRC: String;
  bPorEmpresa, bPorEmpresaDeudora, bPorTrackTrace: Boolean;
begin
  bPorEmpresa        := (rbEmpNormal.Checked and not fraEmpresaDeudora.IsEmpty);
  bPorEmpresaDeudora := (rbEmpDeudora.Checked and not fraEmpresaDeudora.IsEmpty);
  bPorTrackTrace     := (Trim(edTrackTrace.Text)<>'');

  if bPorEmpresa then
    sCAT :=''''' || '  // para que no utilice el índice por AT_AREA
  else
    sCAT := '';

  if bPorTrackTrace then
    sOuterCRC := ''
  else
    sOuterCRC := '(+)';

  sSql := 'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(HM_CUIT) CUIT, ' +
                 'HM_NOMBRE EMPRESA, HC_CONTRATO CONTRATO, FO_FORMULARIO FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                 'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, ' +
                 'DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, ' +
                 'CODRE.TB_DESCRIPCION DESC_RECEPCION, TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, ' +
                 'TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, ' +
                 'CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, CA_IDRECEPCIONCARTADOC, ' +
                 'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, ' +
                 'TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, ' +
                 'AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA, CA_IDAREATEXTO, RC_CODIGOBARRAS_CD TRACKYTRACE, AT_AREA, ' +
                 'CA_OBSERVRECEPCION, AT_MODULO MODULO, CA_IDAVALDIGITAL, NVL(CA_VENTANILLA, ''N'') CA_VENTANILLA, CA_IDTEXTOCARTA, ' +
                 'DECODE(NVL(CA_VENTANILLA, ''N''), ''S'', ''Sí'', ''N'', ''No'', ''P'', ''Pendiente Envío'', ''E'', ''Enviada'') DESCR_VENTANILLA, ' +
                 'SRT.UTILES.GET_ULTESTADOCARTAVENTANILLA(CA_ID) ULTESTADOCARTAVENTANILLA, SRT.UTILES.GET_ULTFESTADOCARTAVENTANILLA(CA_ID) ULTFESTADOCARTAVENTANILLA, ' +
                 'AT_MODULO, SALIDA.TB_DESCRIPCION DESCR_TIPOSALIDA ' +
            'FROM CRC_RECEPCIONCARTADOC, AEN_ENDOSO, AHC_HISTORICOCONTRATO, AHM_HISTORICOEMPRESA,  AFO_FORMULARIO, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                 'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDAREATEXTO=AT_ID ' +
             'AND CA_IDAREATEXTO=AT_ID ' +   // por ahora va esta condición, la agregué porque cuando buscaba una carta de compensación, me la triplicaba en la grilla
             'AND ' + sCAT + 'AT_AREA IN ('+ Area + ') ' +
             'AND CORREO.TB_CODIGO(+) = NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND CORREO.TB_CLAVE(+) = ''CORRE'' ' +
             'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
             'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
             'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
             'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
             'AND HC_IDFORMULARIO=FO_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
             'AND CA_IDENDOSO=EN_ID ' +
             'AND CA_IDDELEGACION=EL_ID ' +
             'AND CA_IDENDOSO IS NOT NULL ' +
             'AND CA_IDRECEPCIONCARTADOC=RC_ID ' + sOuterCRC + ' ' +
            GetWhere;

  if bPorEmpresa then
    sSql := sSql + ' AND HM_IDEMPRESA=' + SqlValue(fraEmpresaDeudora.Value);

  if not bPorEmpresa or bPorEmpresaDeudora then
  begin
    sSql := sSql + ' UNION ALL ';
    sSql := sSql + 'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(ED_CUIT) CUIT, ' +
                   'ED_NOMBRE EMPRESA, TO_NUMBER(NULL) CONTRATO, NULL FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                   'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, ' +
                   'DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, ' +
                   'CODRE.TB_DESCRIPCION DESC_RECEPCION, TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, ' +
                   'TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, ' +
                   'CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, CA_IDRECEPCIONCARTADOC, ' +
                   'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, ' +
                   'TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, ' +
                   'AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA, CA_IDAREATEXTO, RC_CODIGOBARRAS_CD TRACKYTRACE, AT_AREA, ' +
                   'CA_OBSERVRECEPCION, AT_MODULO MODULO, CA_IDAVALDIGITAL, NVL(CA_VENTANILLA, ''N'') CA_VENTANILLA, CA_IDTEXTOCARTA, ' +
                   'DECODE(NVL(CA_VENTANILLA, ''N''), ''S'', ''Sí'', ''N'', ''No'', ''P'', ''Pendiente Envío'', ''E'', ''Enviada'') DESCR_VENTANILLA, ' +
                   'SRT.UTILES.GET_ULTESTADOCARTAVENTANILLA(CA_ID) ULTESTADOCARTAVENTANILLA, SRT.UTILES.GET_ULTFESTADOCARTAVENTANILLA(CA_ID) ULTFESTADOCARTAVENTANILLA, ' +
                   'AT_MODULO, SALIDA.TB_DESCRIPCION DESCR_TIPOSALIDA ' +
              'FROM CRC_RECEPCIONCARTADOC, RED_EMPDEUDORA, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                   'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA ' +
             'WHERE CA_IDTEXTOCARTA=TC_ID ' +
               'AND TA_IDTEXTOCARTA=TC_ID ' +
               'AND TA_IDAREATEXTO=AT_ID ' +
               'AND CA_IDAREATEXTO=AT_ID ' +   // por ahora va esta condición, la agregué porque cuando buscaba una carta de compensación, me la triplicaba en la grilla
               'AND '''' || AT_AREA IN ('+ Area + ') ' +
               'AND CORREO.TB_CODIGO(+) = NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
               'AND CORREO.TB_CLAVE(+) = ''CORRE'' ' +
               'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
               'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
               'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
               'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
               'AND CA_IDEMPDEUDORA = ED_ID ' +
               'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
               'AND CA_IDDELEGACION=EL_ID ' +
               'AND CA_IDRECEPCIONCARTADOC=RC_ID ' + sOuterCRC + ' ' +
              GetWhere;

    if bPorEmpresaDeudora then
      sSql := sSql + ' AND ED_ID=' + SqlValue(fraEmpresaDeudora.Value);
  end;

  Result := sSql;
end;

function TfrmCobAdministracionCartas.GetWhere: String;
begin
  Result := inherited GetWhere;
end;

procedure TfrmCobAdministracionCartas.InicializarComponentes;
begin
  inherited;
  fraEmpresaDatosCartaDoc.Locked := True;
  fraEmpresaDatosActuales.Locked := True;
  fraEmpresaDeudora.ShowBajas := True;
end;

procedure TfrmCobAdministracionCartas.MostrarCarta(IdCarta: integer);
begin
  inherited;
end;

procedure TfrmCobAdministracionCartas.FiltroEmpresa(Sender: TObject);
begin
  fraEmpresaDeudora.IsDeudora := rbEmpDeudora.Checked;
end;

procedure TfrmCobAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  NuevaCarta(Sender);
end;

procedure TfrmCobAdministracionCartas.NuevaCarta(Sender: TObject);
begin
  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    if Sender = tbNuevo Then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

    CodArea := Self.Area;
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmCobAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  tbCambiarFirmante.left := tbTrackTrace.left;

  with fraNuevoFirmante do
    begin
      TableName   := 'CFI_FIRMA';
      FieldID     := 'FI_ID';
      FieldCodigo := 'FI_ID';
      FieldDesc   := 'FI_FIRMANTE';
      FieldBaja   := 'FI_FECHABAJA';
      ShowBajas   := False;
    end;

  EnviarPorVentanilla := True;    
end;

procedure TfrmCobAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaDeudora.Clear;
end;

procedure TfrmCobAdministracionCartas.tbRecepcionMasivaClick(Sender: TObject);
begin
  ImpoExpoWizard('RECCD');
end;

procedure TfrmCobAdministracionCartas.mnuImprimirEstadoCuentaClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar((Grid.SelectedRows.Count > 1), Grid, 'No puede seleccionar más de un registro en la grilla.');

  if Is_ExisteArchivoEstCuentaFilaActual(sNombreArchivo) then
    Do_ImprimirArchivoEstCuenta(sNombreArchivo);
end;

function TfrmCobAdministracionCartas.Is_ExisteArchivoEstCuentaFilaActual(var NombreArchivo: String): Boolean;
var
  IdSeleccion, IdAccion: TTableId;
  Contrato: Integer;
  bExiste: Boolean;
  sSql: String;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
    sSql := 'SELECT CS_IDSELECCIONPLAN ' +
              'FROM ZCS_CONTRATOSELECCIONADOPLAN ' +
             'WHERE (CS_IDCARTACOMESTADOCTA = :IdCarta OR CS_IDCARTARESCISION = :IdCarta)';
    IdSeleccion := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('CA_ID').AsInteger, sdqConsulta.FieldByName('CA_ID').AsInteger], ART_EMPTY_ID);

    if IdSeleccion = ART_EMPTY_ID then
      bExiste := False
    else
    begin
      sSql := 'SELECT DEUDA.GET_IDACCIONPLANESTCTA(:IdCarta) ' +
                'FROM DUAL';

      IdAccion := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('CA_ID').AsInteger], ART_EMPTY_ID);
      Contrato := sdqConsulta.FieldByName('CONTRATO').AsInteger;
      bExiste  := Is_ExisteArchivoEstCuenta(IdSeleccion, IdAccion, Contrato, NombreArchivo);
    end;
  end
  else
    bExiste := False;

  Result := bExiste;
end;

procedure TfrmCobAdministracionCartas.pmnuImprimirPopup(Sender: TObject);
var
  sNombreArchivo: String;
begin
  mnuImprimirEstadoCuenta.Visible := Is_ExisteArchivoEstCuentaFilaActual(sNombreArchivo);
end;

procedure TfrmCobAdministracionCartas.tbCambiarFirmanteClick(Sender: TObject);
var
  i: Integer;
  sArea, sModulo: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro en la grilla.');

  sdqConsulta.DisableControls;
  try
    sModulo := '';

    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if i = 0 then
          begin
            sArea   := sdqConsulta.FieldByName('AT_AREA').AsString;
            sModulo := sdqConsulta.FieldByName('MODULO').AsString;
          end
        else
          begin
            Verificar(sArea <> sdqConsulta.FieldByName('AT_AREA').AsString, nil, 'Todas las cartas seleccionadas deben corresponder al mismo area.');
            Verificar(sModulo <> sdqConsulta.FieldByName('MODULO').AsString, nil, 'Todas las cartas seleccionadas deben corresponder al mismo módulo.');
          end;

        Verificar(not sdqConsulta.FieldByName('FECHAREIMPRESION').IsNull, nil, 'No es posible cambiar el firmante, ya que alguna de las cartas seleccionadas ya ha sido re-impresa.');
        Verificar(not sdqConsulta.FieldByName('CA_FECHABAJA').IsNull, nil, 'Alguna de las cartas seleccionadas se encuentra dada de baja.');
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  fraNuevoFirmante.Clear;
  fraNuevoFirmante.Sql := 'SELECT FI_ID ' + CD_ALIAS_ID + ', ' +
                                 'FI_ID ' + CD_ALIAS_CODIGO + ', ' +
                                 'FI_FIRMANTE ' + CD_ALIAS_DESC + ', ' +
                                 'FI_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
                            'FROM CFI_FIRMA, CFA_FIRMANTEAREA, CAT_AREATEXTO ' +
                           'WHERE FA_IDFIRMANTE = FI_ID ' +
                             'AND FA_FECHABAJA IS NULL ' +
                             'AND FA_IDAREATEXTO = AT_ID ' +
                             'AND AT_AREA = ' + SqlValue(sArea) + ' ' +
                             'AND AT_MODULO = ' + SqlValue(sModulo);

  if fpNuevoFirmante.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmCobAdministracionCartas.btnNuevoFirmanteAceptarClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(fraNuevoFirmante.IsEmpty, fraNuevoFirmante, 'Debe indicar el nuevo firmante de las cartas.');

  if MsgBox('¿Confirma la modificación del firmante para las cartas seleccionadas?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      sdqConsulta.DisableControls;
      try
        BeginTrans;
        try
          for i := 0 to Grid.SelectedRows.Count - 1 do
            begin
              sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

              sSql := 'UPDATE CCA_CARTA ' +
                         'SET CA_IDFIRMA = :IdFirma ' +
                       'WHERE CA_ID = :Id';
              EjecutarSqlSTEx(sSql, [fraNuevoFirmante.Value, sdqConsulta.FieldByName('CA_ID').AsInteger]);
            end;

          CommitTrans;
          MsgBox('Firmantes modificados correctamente.', MB_OK + MB_ICONINFORMATION);
          fpNuevoFirmante.ModalResult := mrOk;
        except
          on E: Exception do
          begin
            RollBack;
            raise Exception.Create(E.Message + CRLF + 'Error al modificar el firmante de las cartas.');
          end;
        end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

procedure TfrmCobAdministracionCartas.ValidacionesAdicRegistrosImpresionCartaDoc;
begin
  Verificar((Sesion.Sector <> 'COB') and (Sesion.Sector <> 'COMPUTOS') and (sdqConsulta.FieldByName('FECHAIMPRESION').IsNull), Grid, 'La primera impresión de esta carta solo puede ser hecha por usuarios del sector Cobranzas.');
end;

procedure TfrmCobAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
var
  OldImpresora: Integer;
  i: integer;
  IdCarta: TTableId;
begin
  inherited;

  if ContinuarImpresion() then
    begin
      OldImpresora         := Printer.PrinterIndex;
      Printer.PrinterIndex := cmbImpresoras.ItemIndex;
      try
        PararImpresion   := False;
        btnParar.Enabled := True;

        if rbVentanilla.Checked then
          IniciarEspera('Enviando archivos por ventanilla electrónica...');
        try
          for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            Verificar(PararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

            sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

            MostrarCartaDocumentoCob(IdCarta, tmBeginEnd, rbImprimir.Checked,
                                     edCantCopias.Value, rgDatos.ItemIndex = 1,
                                     (rgIntimacion.ItemIndex = 1) or (rgIntimacion.ItemIndex = 2),
                                     (rgIntimacion.ItemIndex = 0) or (rgIntimacion.ItemIndex = 2),
                                     chkFirma.Checked, True, rbVentanilla.Checked, True,
                                     TipoComunicacionVE, ComunicacionVE);

            BarProgreso.Position := Round((i + 1) / Grid.SelectedRows.Count * 100);
            Application.ProcessMessages;
          end;

          fpOpcionesImpresion.ModalResult := mrOk;
          Grid.UnSelectAll;
          sdqConsulta.Refresh;
        finally
          if rbVentanilla.Checked then
            DetenerEspera;
        end;
      finally
        Printer.PrinterIndex := OldImpresora;
        btnParar.Enabled := False;
      end;
    end;
end;

procedure TfrmCobAdministracionCartas.OpcionesImpresion(Sender: TObject);
begin
  VCLExtra.LockControls([edCantCopias, cmbImpresoras], not rbImprimir.Checked);

  if rbVentanilla.Checked then
    rgIntimacion.ItemIndex := 0;    // Carta Documento

  VCLExtra.LockControls([rgIntimacion], rbVentanilla.Checked);
end;

procedure TfrmCobAdministracionCartas.ValidacionesAdicRegistrosEnvioVentElectronica;
begin
  Verificar(not ((sdqConsulta.FieldByName('AT_AREA').AsString = AREA_COB) and
                  AreIn(sdqConsulta.FieldByName('AT_MODULO').AsString, [MODULO_INTIMACION, MODULO_RESCISION, MODULO_ANULACIONRESCISION])),
            Grid, 'Solo se permite el envío de cartas de intimación, rescisión y anulación de rescisión.');
end;

end.

