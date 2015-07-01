unit unVerImagenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame, unFraFiltroArchivo,
  StdCtrls, Buttons, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraEstablecimiento,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, PatternEdit,
  IntEdit, unFraTrabajador, unFraTrabajadorSiniestro, ComCtrls,
  JvExComCtrls, JvComCtrls, unArt, CurrEdit, PeriodoPicker, RxCurrEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmVerImagenes = class(TfrmCustomForm)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pcFiltros: TJvPageControl;
    tsCartasDoc: TTabSheet;
    gbCartaDoc: TGroupBox;
    edCartaDocBusq: TPatternEdit;
    gbEmprTrabSinCartasDoc: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    fraEmpresaTrabSinCDBusq: TfraEmpresa;
    fraTrabajadorSinCDBusq: TfraTrabajadorSiniestro;
    tsConstrucciones: TTabSheet;
    gbEmprEst: TGroupBox;
    Label1: TLabel;
    fraEmpresaEstConstrBusq: TfraEmpresa;
    tsCuentasPagarViaticos: TTabSheet;
    gbLegajo: TGroupBox;
    fraLegajoCtaPagBusq: TfraCodigoDescripcion;
    tsEmisionNotas: TTabSheet;
    gbFechaAltaNota: TGroupBox;
    edFechaAltaNotaBusq: TDateComboBox;
    tsMedicinaLaboral: TTabSheet;
    gbEmprTrab: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    fraEmpresaTrabMLBusq: TfraEmpresa;
    fraTrabajadorMLBusq: TfraTrabajador;
    gbFechaExamen: TGroupBox;
    edFechaExamenMLBusq: TDateComboBox;
    tsOficios: TTabSheet;
    gbAutosOfic: TGroupBox;
    lblContra: TLabel;
    lblCaratula: TLabel;
    edCaratulaOficBusq: TEdit;
    edDemandanteOficBusq: TEdit;
    edDemandadoOficBusq: TEdit;
    tsTesoreriaOP: TTabSheet;
    gbChequeTesoOP: TGroupBox;
    edChequeTesoOPBusq: TPatternEdit;
    gbBeneficiarioTesoOP: TGroupBox;
    edBeneficiarioTesoOPBusq: TEdit;
    gbFechaSalidaOfic: TGroupBox;
    edFechaSalidaOficBusq: TDateComboBox;
    gbFechaPagoTesoOP: TGroupBox;
    edFechaPagoTesoOPBusq: TDateComboBox;
    tsExtractosBancarios: TTabSheet;
    gbHojaExtrBanc: TGroupBox;
    edHojaExtrBancBusq: TIntEdit;
    gbFechaExtrBanc: TGroupBox;
    Label6: TLabel;
    edFechaDesdeExtrBancBusq: TDateComboBox;
    edFechaHastaExtrBancBusq: TDateComboBox;
    btnLimpiarFiltros: TBitBtn;
    gbMontoTesoOP: TGroupBox;
    Label7: TLabel;
    edMontoDesdeTesoOPBusq: TCurrencyEdit;
    edMontoHastaTesoOPBusq: TCurrencyEdit;
    gbNroOperacionGTTesoOP: TGroupBox;
    gbFechaGTTesoOP: TGroupBox;
    edFechaGTTesoOP: TDateComboBox;
    tsCajasGirosTransferencias: TTabSheet;
    gbChequeCajaGT: TGroupBox;
    edChequeCajaGTBusq: TPatternEdit;
    gbBeneficiarioCajaGT: TGroupBox;
    edBeneficiarioCajaGTBusq: TEdit;
    gbFechaPagoCajaGT: TGroupBox;
    edFechaPagoCajaGTBusq: TDateComboBox;
    gbMontoCajaGT: TGroupBox;
    Label8: TLabel;
    edMontoDesdeCajaGTBusq: TCurrencyEdit;
    edMontoHastaCajaGTBusq: TCurrencyEdit;
    gbNroOperacionGTCajaGT: TGroupBox;
    gbFechaGTCajaGT: TGroupBox;
    edFechaGTCajaGT: TDateComboBox;
    gbOrdenPagoCajaGT: TGroupBox;
    edOrdenPagoCajaGTBusq: TIntEdit;
    edNroOperacionGTCajaGT: TPatternEdit;
    edNroOperacionGTTesoOP: TPatternEdit;
    tsHigieneYSeguridad: TTabSheet;
    gbFVisitaHySBusq: TGroupBox;
    edFDesdeVisitaHySBusq: TDateComboBox;
    gbFechasCtaPag: TGroupBox;
    Label9: TLabel;
    edFechaDesdeCtaPagBusq: TDateComboBox;
    edFechaHastaCtaPagBusq: TDateComboBox;
    Label10: TLabel;
    edFHastaVisitaHySBusq: TDateComboBox;
    chkBenefIgualTesoOPBusq: TCheckBox;
    chkBenefIgualCajaGTBusq: TCheckBox;
    chkNoTransfTesoOPBusq: TCheckBox;
    gbNumeroML: TGroupBox;
    Label11: TLabel;
    edNroDesdeMLBusq: TPatternEdit;
    edNroHastaMLBusq: TPatternEdit;
    gbOperativo: TGroupBox;
    edOperativoMLBusq: TPeriodoPicker;
    fraFiltroArchivoImagenes: TfraFiltroArchivo;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    {$IFDEF RED_PRES}
    procedure OnEmpresaEstConstrBusqChange(Sender: TObject);
    procedure OnEmpresaTrabMLBusqChange(Sender: TObject);
    {$ENDIF}
    procedure OnTrabajadorMLBusqChange(Sender: TObject);
    procedure OnEmpresaTrab2MLBusqChange(Sender: TObject);
    procedure OnTrabajadorSinCDBusqChange(Sender: TObject);
    procedure OnEmpresaTrabSinCDBusqChange(Sender: TObject);
    procedure fraTipoArchivoPropiedadesChange(Sender: TObject);
    procedure fraFiltroArchivoImagenesExit(Sender: TObject);
    procedure btnLimpiarFiltrosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fraEstablecimientoConstrBusq, fraEstablTrabMLBusq: TfraEstablecimiento;
    procedure DoActivarHoja(TipoArchivo: TTableId);
    function TipoArchivoToTabSheet(TipoArchivo: TTableId): TTabSheet;
    procedure DoLimpiarHojas;
    function Get_SQLInsertImagenArchivo: String;
    function IsFiltrosAdicionalesSeleccionados(TipoArchivo: TTableId): Boolean;
    function Get_SQLWhereFiltrosAdicionales(TipoArchivo: TTableId; var Sql: String): Boolean;
    function Validar(var FiltrosAdicionales, BusquedaPorCarpeta: Boolean): Boolean;
  public
  end;

var
  frmVerImagenes: TfrmVerImagenes;

implementation

uses
  CustomDlgs, unFrmDetalleArchivo, unUtilsArchivo, unSiniestros, unConstantArchivo,
  unDmPrincipal, StrFuncs, AnsiSql, General, unArchivo, unMensajeAlertaAGA;

{$R *.dfm}

function TfrmVerImagenes.Validar(var FiltrosAdicionales, BusquedaPorCarpeta: Boolean): Boolean;
begin
  Verificar(not fraFiltroArchivoImagenes.IsSelected, fraFiltroArchivoImagenes.fraTipoArchivo.cmbDescripcion, 'Debe indicar el tipo de archivo.');
  FiltrosAdicionales := IsFiltrosAdicionalesSeleccionados(fraFiltroArchivoImagenes.Tipo);

  Verificar(not FiltrosAdicionales and fraFiltroArchivoImagenes.IsCompleted and (fraFiltroArchivoImagenes.IdArchivo = -1), fraFiltroArchivoImagenes.fraTipoArchivo.cmbDescripcion, 'La clave de la carpeta no existe.');
  Verificar(FiltrosAdicionales and fraFiltroArchivoImagenes.IsTipoArchivoExtractosBancarios and not (fraFiltroArchivoImagenes.fraBancoExtracto.IsSelected and fraFiltroArchivoImagenes.fraCuentaBancariaExtracto.IsSelected), fraFiltroArchivoImagenes, 'Si eligió filtros adicionales de Extractos Bancarios, entonces debe indicar el Banco y la Cuenta.');
  Verificar(not fraFiltroArchivoImagenes.IsCompleted and not FiltrosAdicionales, fraFiltroArchivoImagenes.fraTipoArchivo.cmbDescripcion, 'Debe indicar algún dato a buscar.');

  BusquedaPorCarpeta := (fraFiltroArchivoImagenes.IsCompleted and not FiltrosAdicionales);

  Result := True;
end;

procedure TfrmVerImagenes.btnAceptarClick(Sender: TObject);
var
  bFiltrosAdicionales, bBusquedaPorCarpeta: Boolean;
  sSql, sSqlFinal, sSqlInsert, sSqlFiltros: String;
begin
  if Validar(bFiltrosAdicionales, bBusquedaPorCarpeta) then
    begin
      if bBusquedaPorCarpeta then
        TFrmDetalleArchivo.MostrarDetalleArchivo(Self, fraFiltroArchivoImagenes.IdArchivo, True)
      else if bFiltrosAdicionales then
        begin
          sSqlInsert := Get_SQLInsertImagenArchivo();
          Get_SQLWhereFiltrosAdicionales(fraFiltroArchivoImagenes.Tipo, sSqlFiltros);

          sSql := 'DELETE FROM TIA_IMAGENARCHIVO';
          EjecutarSql(sSql);

          sSqlFinal := sSqlInsert +
                       ' AND RA_ID IN (' + sSqlFiltros + ')';
          EjecutarSql(sSqlFinal);

          sSql := 'SELECT ''S'' ' +
                    'FROM DUAL ' +
                   'WHERE EXISTS(SELECT 1 ' +
                                  'FROM TIA_IMAGENARCHIVO)';
          Verificar(not ExisteSql(sSql), btnAceptar, 'No se encontraron imágenes con los filtros indicados.');

          TFrmDetalleArchivo.MostrarDetalleImagenes(Self);
        end;
    end;
end;

procedure TfrmVerImagenes.FormCreate(Sender: TObject);
begin
  inherited;

  with Self, Self.Constraints do
    begin
      MaxHeight := 338;
      MaxWidth  := 640;
      MinHeight := 338;
      MinWidth  := 640;
      Width     := 640;
      Height    := 338;
    end;

  fraEmpresaEstConstrBusq.ShowBajas := True;

  // por compatibilidad con RedPres
  fraEstablecimientoConstrBusq := TfraEstablecimiento.Create(Self);
  with fraEstablecimientoConstrBusq do
    begin
      Parent   := gbEmprEst;
      Name     := 'fraEstablecimientoConstrBusq';

      {$IFDEF RED_PRES}
      Left     := 5;
      Width    := 613;
      fraEmpresaEstConstrBusq.OnChange := OnEmpresaEstConstrBusqChange;
      {$ELSE}
      Left     := 40;
      Width    := 582;
      with TLabel.Create(Self) do
      begin
        Parent   := gbEmprEst;
        Autosize := True;
        Top      := 44;
        Left     := 5;
        Caption  := 'Establ.';
      end;
      fraEmpresa := fraEmpresaEstConstrBusq;
      {$ENDIF}

      Top      := 40;
      Height   := 23;
      Anchors  := [akLeft,akTop,akRight];
      TabOrder := fraEmpresaEstConstrBusq.TabOrder + 1;

      ShowBajas  := True;
    end;

  // por compatibilidad con RedPres
  fraEstablTrabMLBusq := TfraEstablecimiento.Create(Self);
  with fraEstablTrabMLBusq do
    begin
      Parent   := gbEmprTrab;

      {$IFDEF RED_PRES}
      Left     := 5;
      Width    := fraEmpresaTrabMLBusq.Width + 37;
      fraEmpresaTrabMLBusq.OnChange := OnEmpresaTrabMLBusqChange;
      {$ELSE}
      Left     := 40;
      Width    := fraEmpresaTrabMLBusq.Width + 5;
      with TLabel.Create(Self) do
      begin
        Parent   := gbEmprTrab;
        Autosize := True;
        Top      := 41;
        Left     := 5;
        Caption  := 'Establ.';
      end;
      fraEmpresa := fraEmpresaTrabMLBusq;
      {$ENDIF}

      Top      := 38;
      Height   := 23;
      Anchors  := [akLeft,akTop,akRight];
      TabOrder := fraEmpresaTrabMLBusq.TabOrder + 1;

      ShowBajas  := True;
    end;

  with fraLegajoCtaPagBusq do
    begin
      TableName      := 'USE_USUARIOS';
      FieldID        := 'SE_LEGAJORRHH';
      FieldCodigo    := 'SE_LEGAJORRHH';
      FieldDesc      := 'UPPER(SE_NOMBRE)';
      FieldBaja      := 'SE_FECHABAJA';
      ExtraCondition := ' AND NVL(SE_LEGAJORRHH, 0) > 0';
      ShowBajas      := True;
    end;

  with fraTrabajadorMLBusq do
    begin
      OnChange   := OnTrabajadorMLBusqChange;
      ShowBajas  := True;
    end;

  with fraEmpresaTrabMLBusq do
    begin
      OnChange   := OnEmpresaTrab2MLBusqChange;
      ShowBajas  := True;
    end;

  with fraEmpresaTrabSinCDBusq do
    begin
      OnChange  := OnEmpresaTrabSinCDBusqChange;
      ShowBajas := True;
    end;

  with fraTrabajadorSinCDBusq do
    begin
      OnChange           := OnTrabajadorSinCDBusqChange;
      MostrarRelaLaboral := True;
      SinEstablecimiento := True;
      SoloSiniestrados   := True;
    end;

  fraFiltroArchivoImagenes.fraTipoArchivo.Propiedades.OnChange := fraTipoArchivoPropiedadesChange;
  fraFiltroArchivoImagenes.OnExit  := fraFiltroArchivoImagenesExit;
  fraTipoArchivoPropiedadesChange(nil);

  {$IFNDEF ADMGRALARCHIVO}
  DoIniciarCarpetasEnTransitoUsu;
  {$ENDIF}
end;

{$IFDEF RED_PRES}
procedure TfrmVerImagenes.OnEmpresaEstConstrBusqChange(Sender: TObject);
begin
  fraEstablecimientoConstrBusq.Contrato := fraEmpresaEstConstrBusq.Contrato;
end;

procedure TfrmVerImagenes.OnEmpresaTrabMLBusqChange(Sender: TObject);
begin
  fraEstablTrabMLBusq.Contrato := fraEmpresaTrabMLBusq.Contrato;
end;
{$ENDIF}

procedure TfrmVerImagenes.OnEmpresaTrab2MLBusqChange(Sender: TObject);
begin
  fraEstablTrabMLBusq.Clear;
  fraTrabajadorMLBusq.Clear;
  inherited;
end;

procedure TfrmVerImagenes.OnTrabajadorMLBusqChange(Sender: TObject);
var
  bExisteRelLab: Boolean;
begin
  if fraEmpresaTrabMLBusq.IsSelected and fraTrabajadorMLBusq.IsSelected then
    begin
      bExisteRelLab := Is_RelacionLaboralActual_o_Historica(fraEmpresaTrabMLBusq.CUIT, fraTrabajadorMLBusq.CUIL);

      if not bExisteRelLab then
        begin
          InfoHint(fraTrabajadorMLBusq, 'El trabajador ' + fraTrabajadorMLBusq.Nombre + ' (' + fraTrabajadorMLBusq.CUIL + ') no pertenece ni ha pertenecido a la empresa seleccionada.');
          fraTrabajadorMLBusq.Clear;
        end;
    end;
end;

procedure TfrmVerImagenes.OnEmpresaTrabSinCDBusqChange(Sender: TObject);
begin
  fraTrabajadorSinCDBusq.Clear;
  fraTrabajadorSinCDBusq.CUIT := fraEmpresaTrabSinCDBusq.CUIT;
end;

procedure TfrmVerImagenes.OnTrabajadorSinCDBusqChange(Sender: TObject);
begin
  fraEmpresaTrabSinCDBusq.Value := fraTrabajadorSinCDBusq.IdEmpresa;
end;

function TfrmVerImagenes.TipoArchivoToTabSheet(TipoArchivo: TTableId): TTabSheet;
var
  ts: TTabSheet;
begin
  if TipoArchivoCartaDocumento(TipoArchivo) then
    ts := tsCartasDoc
  else if TipoArchivoMedicinaLaboral(TipoArchivo) then
    ts := tsMedicinaLaboral
  else
    case TipoArchivo of
      ID_CARPETA_CONSTRUCC:   ts := tsConstrucciones;
      ID_CARPETA_CPAGARVIAT:  ts := tsCuentasPagarViaticos;
      ID_CARPETA_EMISNOTAS:   ts := tsEmisionNotas;
      ID_CARPETA_OFICIOS:     ts := tsOficios;
      ID_CARPETA_TESORERIA:   ts := tsTesoreriaOP;
      ID_CARPETA_EXTRBANC:    ts := tsExtractosBancarios;
      ID_CARPETA_CAJAS_GT:    ts := tsCajasGirosTransferencias;
      ID_CARPETA_HYS:         ts := tsHigieneYSeguridad;
    else
      ts := nil;
    end;

  Result := ts;
end;

procedure TfrmVerImagenes.DoActivarHoja(TipoArchivo: TTableId);
var
  i: Integer;
  ts: TTabSheet;
begin
  ts := TipoArchivoToTabSheet(TipoArchivo);

  with pcFiltros do
    if Assigned(ts) then
      begin
        for i := 0 to PageCount -1 do
          Pages[i].TabVisible := (ts.Name = Pages[i].Name);

        ActivePage := ts;
        Visible    := True;
      end
    else
      Visible := False;
end;

procedure TfrmVerImagenes.fraTipoArchivoPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraFiltroArchivoImagenes.OnArchivoChange(Sender);

  DoLimpiarHojas;
  DoActivarHoja(fraFiltroArchivoImagenes.Tipo);

  btnLimpiarFiltros.Visible := pcFiltros.Visible;
end;

procedure TfrmVerImagenes.DoLimpiarHojas;
begin
  fraEmpresaTrabSinCDBusq.Clear;
  fraTrabajadorSinCDBusq.Clear;
  edCartaDocBusq.Clear;

  fraEmpresaTrabMLBusq.Clear;
  fraEstablTrabMLBusq.Clear;
  fraTrabajadorMLBusq.Clear;
  edFechaExamenMLBusq.Clear;
  edNroDesdeMLBusq.Clear;
  edNroHastaMLBusq.Clear;
  edOperativoMLBusq.Clear;

  fraEmpresaEstConstrBusq.Clear;
  fraEstablecimientoConstrBusq.Clear;

  fraLegajoCtaPagBusq.Clear;
  edFechaDesdeCtaPagBusq.Clear;
  edFechaHastaCtaPagBusq.Clear;

  edFechaAltaNotaBusq.Clear;

  edDemandanteOficBusq.Clear;
  edDemandadoOficBusq.Clear;
  edCaratulaOficBusq.Clear;
  edFechaSalidaOficBusq.Clear;

  edChequeTesoOPBusq.Clear;
  edBeneficiarioTesoOPBusq.Clear;
  edFechaPagoTesoOPBusq.Clear;
  edMontoDesdeTesoOPBusq.Clear;
  edMontoHastaTesoOPBusq.Clear;
  edNroOperacionGTTesoOP.Clear;
  edFechaGTTesoOP.Clear;
  chkNoTransfTesoOPBusq.Checked   := True;
  chkBenefIgualTesoOPBusq.Checked := True;

  edHojaExtrBancBusq.Clear;
  edFechaDesdeExtrBancBusq.Clear;
  edFechaHastaExtrBancBusq.Clear;

  edChequeCajaGTBusq.Clear;
  edBeneficiarioCajaGTBusq.Clear;
  edOrdenPagoCajaGTBusq.Clear;
  edFechaPagoCajaGTBusq.Clear;
  edMontoDesdeCajaGTBusq.Clear;
  edMontoHastaCajaGTBusq.Clear;
  edNroOperacionGTCajaGT.Clear;
  edFechaGTCajaGT.Clear;
  chkBenefIgualCajaGTBusq.Checked := True;

  edFDesdeVisitaHySBusq.Clear;
  edFHastaVisitaHySBusq.Clear;
end;

function TfrmVerImagenes.Get_SQLInsertImagenArchivo: String;
var
  sSql: String;
begin
  sSql   := 'ART.ARCHIVO.Get_SQLInsertImagenArchivo';
  Result := ObtenerValor(sSql);
end;

function TfrmVerImagenes.IsFiltrosAdicionalesSeleccionados(TipoArchivo: TTableId): Boolean;
var
  Sql: String;
begin
  Result := Get_SQLWhereFiltrosAdicionales(TipoArchivo, Sql);
end;

function TfrmVerImagenes.Get_SQLWhereFiltrosAdicionales(TipoArchivo: TTableId; var Sql: String): Boolean;
var
  sOperador, sBeneficiario, sClaveCarpetaVirtual, sSql, sWhere: String;
  bPorNroCartaDoc, bPorClave: Boolean;
begin
  Sql    := '';
  sWhere := '';

  sClaveCarpetaVirtual := Get_ClaveCarpetaVirtual(TipoArchivo);

  if TipoArchivoCartaDocumento(TipoArchivo) then
    begin
      bPorNroCartaDoc := not IsEmptyString(edCartaDocBusq.Text);

      sSql := 'SELECT RA_ID ' +
                'FROM ARCHIVO.VCA_CARTA, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
               'WHERE RA_FECHABAJA IS NULL ' +
                 'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                 Iif(bPorNroCartaDoc, '', 'AND RAR2.AR_TIPO = ' + SqlValue(TipoArchivo) + ' ') +
                 'AND RA_NRODOCUMENTO = CA_NROCARTADOC';

      if fraTrabajadorSinCDBusq.IsSelected then
        sWhere := sWhere + ' AND CA_SINI = ' + SqlValue(fraTrabajadorSinCDBusq.Sin) +
                           ' AND CA_ORD = ' + SqlValue(fraTrabajadorSinCDBusq.Ord) +
                           ' AND CA_RECA = ' + SqlValue(fraTrabajadorSinCDBusq.Rec)
      else if fraEmpresaTrabSinCDBusq.IsSelected then
        sWhere := sWhere + ' AND CA_CONTRATO = ' + SqlValue(fraEmpresaTrabSinCDBusq.Contrato);

      if bPorNroCartaDoc then
        sWhere := sWhere + ' AND CA_NROCARTADOC = ' + SqlValue(Trim(edCartaDocBusq.Text));
    end

  else if TipoArchivoMedicinaLaboral(TipoArchivo) then
    begin
      sSql := 'SELECT RA_ID ' +
                'FROM ART.AET_ESTRAB, ACO_CONTRATO, AEM_EMPRESA, HYS.HCE_CARPETAESTAMP, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
               'WHERE RA_FECHABAJA IS NULL ' +
                 'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                 'AND RAR2.AR_TIPO = ' + SqlValue(TipoArchivo) + ' ' +
                 'AND RAR2.AR_CLAVE = TO_CHAR(CE_ID) ' +
                 'AND CE_CUIT = EM_CUIT ' +
                 'AND CO_IDEMPRESA = EM_ID ' +
                 'AND CO_CONTRATO = ART.AFILIACION.GET_CONTRATOVIGENTE(CE_CUIT, CE_FECHAALTA) ' +
                 'AND CE_ID = ET_IDCARPETAAMP';

      sWhere := SqlBetweenDateTime(' AND ET_FECHA', edFechaExamenMLBusq.Date, edFechaExamenMLBusq.Date) +
                SqlBetween(' AND RAR2.AR_CLAVE', edNroDesdeMLBusq.Text, edNroHastaMLBusq.Text);

      if fraEmpresaTrabMLBusq.IsSelected then
        begin
          sWhere := sWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresaTrabMLBusq.Contrato);

          if fraEstablTrabMLBusq.IsSelected then
            sWhere := sWhere + ' AND ET_ESTABLECI = ' + SqlValue(fraEstablTrabMLBusq.NroEstablecimiento);
        end;

      if fraTrabajadorMLBusq.IsSelected then
        sWhere := sWhere + ' AND CE_CUIL = ' + SqlValue(fraTrabajadorMLBusq.CUIL);

      if not IsEmptyString(edOperativoMLBusq.Periodo.Valor) then
        sWhere := sWhere + ' AND ET_PERIODO = ' + SqlValue(edOperativoMLBusq.Periodo.Valor);
    end

  else
    case TipoArchivo of
      ID_CARPETA_CONSTRUCC:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM ACO_CONTRATO, AEM_EMPRESA, HYS.HAR_AVISOOBRANRORECEPCION HAR, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_CONSTRUCC) + ' ' +
                     'AND RAR2.AR_CLAVE = TO_CHAR(HAR.AR_NRORECEPCION) ' +
                     'AND CO_IDEMPRESA = EM_ID ' +
                     'AND EM_CUIT = HAR.AR_CUIT';

          if fraEmpresaEstConstrBusq.IsSelected then
            begin
              sWhere := sWhere + ' AND ART.AFILIACION.GET_CONTRATOVIGENTE(HAR.AR_CUIT, HAR.AR_FECHAALTA) = CO_CONTRATO' +
                                 ' AND CO_CONTRATO = ' + SqlValue(fraEmpresaEstConstrBusq.Contrato);

              if fraEstablecimientoConstrBusq.IsSelected then
                sWhere := sWhere + ' AND HAR.AR_ESTABLECI = ' + SqlValue(fraEstablecimientoConstrBusq.NroEstablecimiento);
            end;
        end;

      ID_CARPETA_CPAGARVIAT:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_CPAGARVIAT);

          sWhere := SqlBetweenDateTime(' AND TO_DATE(DECODE(RAR2.AR_CLAVE, ' + SqlValue(sClaveCarpetaVirtual) + ', NULL, RAR2.AR_CLAVE), ''DD/MM/YYYY'')', edFechaDesdeCtaPagBusq.Date, edFechaHastaCtaPagBusq.Date);

          if fraLegajoCtaPagBusq.IsSelected then
            sWhere := sWhere + ' AND RA_LEGAJO = ' + SqlValue(fraLegajoCtaPagBusq.Value);
        end;

      ID_CARPETA_EMISNOTAS:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM EMI.INO_NOTA, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_EMISNOTAS) + ' ' +
                     'AND ART.ARCHIVO.GETCLAVEARMADA(3, TO_CHAR(NO_BIBLIORATO), TO_CHAR(NO_SECUENCIA), TO_CHAR(NO_CONTRATO), NULL) = RAR2.AR_CLAVE';

          sWhere := SqlBetweenDateTime(' AND NO_FECHAALTA', edFechaAltaNotaBusq.Date, edFechaAltaNotaBusq.Date);
        end;

      ID_CARPETA_OFICIOS:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM LEGALES.LOJ_OFICIOJUDICIAL, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_OFICIOS) + ' ' +
                     'AND RAR2.AR_CLAVE = TO_CHAR(OJ_NUMEROOFICIO)';

          sWhere := SqlBetweenDateTime(' AND OJ_FECHASALIDA', edFechaSalidaOficBusq.Date, edFechaSalidaOficBusq.Date);

          if not IsEmptyString(edDemandanteOficBusq.Text) then
            sWhere := sWhere + ' AND OJ_DEMANDANTE LIKE ' + SqlValue('%' + Trim(edDemandanteOficBusq.Text) + '%');

          if not IsEmptyString(edDemandadoOficBusq.Text) then
            sWhere := sWhere + ' AND OJ_DEMANDADO LIKE ' + SqlValue('%' + Trim(edDemandadoOficBusq.Text) + '%');

          if not IsEmptyString(edCaratulaOficBusq.Text) then
            sWhere := sWhere + ' AND OJ_CARATULA LIKE ' + SqlValue('%' + Trim(edCaratulaOficBusq.Text) + '%');
        end;

      ID_CARPETA_TESORERIA:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM ' + Iif(chkNoTransfTesoOPBusq.Checked, '', 'ARCHIVO.VGT_GIROSTRANSFERENCIAS, ') + 'RCE_CHEQUEEMITIDO, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_TESORERIA) + ' ' +
                     'AND RAR2.AR_CLAVE = TO_CHAR(CE_ORDENPAGO) ' +
                     Iif(chkNoTransfTesoOPBusq.Checked, '', 'AND CE_ID = GT_IDCHEQUEEMITIDO(+)');

          sWhere := SqlBetweenDateTime(' AND CE_FECHASITUACION', edFechaPagoTesoOPBusq.Date, edFechaPagoTesoOPBusq.Date) +
                    SqlBetween(' AND CE_MONTO', edMontoDesdeTesoOPBusq.Value, edMontoHastaTesoOPBusq.Value);

          if chkNoTransfTesoOPBusq.Checked then
            sWhere := sWhere + SqlBetweenDateTime(' AND CE_FECHACHEQUE', edFechaGTTesoOP.Date, edFechaGTTesoOP.Date)
          else
            sWhere := sWhere + SqlBetweenDateTime(' AND GT_FECHACHEQUE', edFechaGTTesoOP.Date, edFechaGTTesoOP.Date);

          if not IsEmptyString(edChequeTesoOPBusq.Text) then
            sWhere := sWhere + ' AND CE_NUMERO = ' + SqlValue(Trim(edChequeTesoOPBusq.Text));

          if not IsEmptyString(edNroOperacionGTTesoOP.Text) then
            begin
              if chkNoTransfTesoOPBusq.Checked then
                sWhere := sWhere + ' AND CE_GIRO = ' + SqlValue(edNroOperacionGTTesoOP.Text)
              else
                sWhere := sWhere + ' AND GT_NROOPERACION = ' + SqlValue(edNroOperacionGTTesoOP.Text);
            end;

          if not IsEmptyString(edBeneficiarioTesoOPBusq.Text) then
            begin
              if chkBenefIgualTesoOPBusq.Checked then
                begin
                  sBeneficiario := Trim(edBeneficiarioTesoOPBusq.Text);
                  sOperador     := '=';
                end
              else
                begin
                  sBeneficiario := '%' + Trim(edBeneficiarioTesoOPBusq.Text) + '%';
                  sOperador     := 'LIKE';
                end;

              if chkNoTransfTesoOPBusq.Checked then
                sWhere := sWhere + ' AND CE_BENEFICIARIO ' + sOperador + ' ' + SqlValue(sBeneficiario)
              else
                sWhere := sWhere + ' AND DECODE(ART.TESORERIA.IS_CHEQUETRANSFERENCIA(CE_ID), ''S'', GT_BENEFICIARIO, CE_BENEFICIARIO) ' + sOperador + ' ' + SqlValue(sBeneficiario);
            end;
        end;

      ID_CARPETA_EXTRBANC:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_EXTRBANC);

          if not edFechaDesdeExtrBancBusq.IsEmpty then
            sWhere := sWhere + ' AND TO_DATE(DECODE(ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 3), ' + SqlValue(sClaveCarpetaVirtual) + ', NULL, ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 3)), ''DD/MM/YYYY'') >= ' + SqlValue(edFechaDesdeExtrBancBusq.Date);

          if not edFechaHastaExtrBancBusq.IsEmpty then
            sWhere := sWhere + ' AND TO_DATE(DECODE(ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 3), ' + SqlValue(sClaveCarpetaVirtual) + ', NULL, ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 3)), ''DD/MM/YYYY'') <= ' + SqlValue(edFechaHastaExtrBancBusq.Date);

          if not edHojaExtrBancBusq.IsEmpty then
            sWhere := sWhere + ' AND RA_HOJA = ' + SqlValue(edHojaExtrBancBusq.Value);
        end;

      ID_CARPETA_CAJAS_GT:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM ARCHIVO.VGT_GIROSTRANSFERENCIAS, RCE_CHEQUEEMITIDO, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_CAJAS_GT) + ' ' +
                     'AND RA_NROOPERACION_GT = CE_GIRO(+) ' +
                     'AND CE_ID = GT_IDCHEQUEEMITIDO(+)';

          sWhere := SqlBetweenDateTime(' AND CE_FECHASITUACION', edFechaPagoCajaGTBusq.Date, edFechaPagoCajaGTBusq.Date) +
                    SqlBetween(' AND GT_IMPORTE', edMontoDesdeCajaGTBusq.Value, edMontoHastaCajaGTBusq.Value) +
                    SqlBetweenDateTime(' AND NVL(GT_FECHACHEQUE, RA_FECHAOPER_GT)', edFechaGTCajaGT.Date, edFechaGTCajaGT.Date);

          if not edOrdenPagoCajaGTBusq.IsEmpty then
            sWhere := sWhere + ' AND CE_ORDENPAGO = ' + SqlValue(edOrdenPagoCajaGTBusq.Value);

          if not IsEmptyString(edChequeCajaGTBusq.Text) then
            sWhere := sWhere + ' AND NVL(GT_CHEQUE, RA_NROCHEQUE_GT) = ' + SqlValue(Trim(edChequeCajaGTBusq.Text));

          if not IsEmptyString(edNroOperacionGTCajaGT.Text) then
            sWhere := sWhere + ' AND NVL(GT_NROOPERACION, RA_NROOPERACION_GT) = ' + SqlValue(edNroOperacionGTCajaGT.Text);

          if not IsEmptyString(edBeneficiarioCajaGTBusq.Text) then
            begin
              if chkBenefIgualCajaGTBusq.Checked then
                begin
                  sBeneficiario := Trim(edBeneficiarioCajaGTBusq.Text);
                  sOperador     := '=';
                end
              else
                begin
                  sBeneficiario := '%' + Trim(edBeneficiarioCajaGTBusq.Text) + '%';
                  sOperador     := 'LIKE';
                end;

              sWhere := sWhere + ' AND NVL(GT_BENEFICIARIO, RA_BENEFICIARIO_GT) ' + sOperador + ' ' + SqlValue(sBeneficiario);
            end;
        end;

      ID_CARPETA_HYS:
        begin
          sSql := 'SELECT RA_ID ' +
                    'FROM AEM_EMPRESA, ACO_CONTRATO, PRV_RESVISITAS, ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                   'WHERE RA_FECHABAJA IS NULL ' +
                     'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                     'AND RAR2.AR_TIPO = ' + SqlValue(ID_CARPETA_HYS) + ' ' +
                     'AND CO_IDEMPRESA = EM_ID ' +
                     'AND EM_CUIT = RV_CUIT ' +
                     'AND ART.AFILIACION.GET_CONTRATOVIGENTE(RV_CUIT, RV_FECHA) = CO_CONTRATO ' +
                     'AND CO_CONTRATO = ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 1) ' +
                     'AND RV_ESTABLECI = ART.ARCHIVO.GETSUBCLAVE(RAR2.AR_CLAVE, 2) ' +
                     'AND RV_FECHABAJA IS NULL';

          sWhere := SqlBetweenDateTime(' AND RV_FECHA', edFDesdeVisitaHySBusq.Date, edFHastaVisitaHySBusq.Date);
        end;
    end;

  // agrego el filtro por la clave (o parte) de la carpeta si se ingresó algo
  if fraFiltroArchivoImagenes.IsSelected then
    begin
      bPorClave := ((fraFiltroArchivoImagenes.Clave <> '|') and (fraFiltroArchivoImagenes.Clave <> ''));

      if bPorClave then
        begin
          if fraFiltroArchivoImagenes.IsCompleted then
            begin
              if not IsEmptyString(sWhere) then    // si no hay filtro adicional, va a filtrar por la Carpeta completa
                sWhere := sWhere + ' AND RAR2.AR_CLAVE = ' + SqlValue(fraFiltroArchivoImagenes.Clave);
            end
          else if InStr(fraFiltroArchivoImagenes.Clave, '|') > 0 then
            begin
              if StrLeft(fraFiltroArchivoImagenes.Clave, 1) = '|' then
                sWhere := sWhere + ' AND RAR2.AR_CLAVE LIKE ' + SqlValue('%' + fraFiltroArchivoImagenes.Clave)
              else
                sWhere := sWhere + ' AND RAR2.AR_CLAVE LIKE ' + SqlValue(fraFiltroArchivoImagenes.Clave + '%') ;

              if IsEmptyString(sSql) then
                sSql := 'SELECT RA_ID ' +
                          'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO, ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RAR_ARCHIVO RAR3 ' +
                         'WHERE RA_FECHABAJA IS NULL ' +
                           'AND RA_IDARCHIVO = RAR2.AR_ID ' +
                           'AND RAR2.AR_TIPO = ' + SqlValue(TipoArchivo);
            end;
        end;
    end;

  sSql := sSql + ' AND RAR2.AR_CLAVE = RAR3.AR_CLAVE' +
                 ' AND ARCHIVO.IS_TIPOARCHIVORELACIONADO(RAR2.AR_TIPO, RAR3.AR_TIPO) = ''S''';

  Sql := sSql + sWhere;

  Result := not IsEmptyString(sWhere);
end;

procedure TfrmVerImagenes.btnLimpiarFiltrosClick(Sender: TObject);
begin
  DoLimpiarHojas;
end;

procedure TfrmVerImagenes.FormDestroy(Sender: TObject);
begin
  fraEstablTrabMLBusq.Free;
  fraEstablecimientoConstrBusq.Free;
  inherited;
end;

procedure TfrmVerImagenes.fraFiltroArchivoImagenesExit(Sender: TObject);
begin
  if fraFiltroArchivoImagenes.IsCompleted then
    DoMostrarMensajesAdvertenciaCarpeta(fraFiltroArchivoImagenes.Tipo, fraFiltroArchivoImagenes.Clave);
end;

procedure TfrmVerImagenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$IFNDEF ADMGRALARCHIVO}
  DoSuspenderCarpetasEnTransitoUsu;
  {$ENDIF}
end;

end.

