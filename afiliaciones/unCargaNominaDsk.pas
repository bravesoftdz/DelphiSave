unit unCargaNominaDsk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, unArtDbFrame, unFraEmpresa,
  unFraEmpresaAfi, StdCtrls, unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, ComCtrls, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, PatternEdit, IntEdit, PeriodoPicker, ExtCtrls, StaticGrid, Db, SDEngine, unFraEstablecimiento,
  QueryPrint, DBFileReader, FileReader, unArtDBAwareFrame, DataExport, DataToXLS, QueryToFile, ExportDialog, Buttons,
  CurrEdit, Placemnt, FormPanel, JvExControls, JvComponent, JvSpecialProgress, artSeguridad,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Variants, Math, Excel2000, OleServer, unFraCodDesc,
  Menus, ToolWin, FieldHider, SortDlg, RxPlacemnt, RxCurrEdit, RxToolEdit;

type
  TResultado = record
    AltasDSK: Integer;
    BajasDB: Integer;
    BajasDsk: Integer;
    AltasPotenciales: Integer;
    Errores: Integer;
    Estado: String;
    MasaAltaDSK: Extended;
    MasaBajaDSK: Extended;
    MasaDB: Extended;
    MasaDsk: Extended;
    Resultado: Boolean;
    Total: Integer;
  end;

type
  TResultadoRelacionLaboralAnterior = record
    ExistioRelacion: String;
    FechaBaja : String; //Son string porque lo necesito asi para el excel.
    MotivoBaja : String;
  end;

type
  TValidationArray = Array['A'..'G'] of String;

type
  TLineaExcelArray = Array['A'..'Y'] of String;

  TfrmCargaNominaDsk = class(TForm)
    gbContrato: TGroupBox;
    lbRSocial: TLabel;
    fraEmpresaAfi: TfraEmpresaAfi;
    gbEmpresa: TGroupBox;
    lbEstablecimento: TLabel;
    edFilename: TFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    lbFInicioAct: TLabel;
    cmbFechaRecepcion: TDateComboBox;
    chkBajas: TCheckBox;
    Label3: TLabel;
    cmbFechaBaja: TDateComboBox;
    edPeriodo: TPeriodoPicker;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edTotal: TIntEdit;
    Label5: TLabel;
    edError: TIntEdit;
    Label6: TLabel;
    edCorrectos: TIntEdit;
    Grid: TArtDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    fraEstablecimiento: TfraEstablecimiento;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    ExportDialog: TExportDialog;
    sbEstado: TStatusBar;
    Label7: TLabel;
    edBajasDSK: TIntEdit;
    Label8: TLabel;
    edBajasCausadas: TIntEdit;
    btnImprimirBajasPotenciales: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    edMasaResultante: TCurrencyEdit;
    edMasaDSK: TCurrencyEdit;
    FormStorage: TFormStorage;
    Label11: TLabel;
    edMasaAltasDSK: TCurrencyEdit;
    Label12: TLabel;
    edAltasDSK: TIntEdit;
    Label13: TLabel;
    edMasaBajasDSK: TCurrencyEdit;
    fpTrabajador: TFormPanel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    meCuil: TMaskEdit;
    edApellido: TEdit;
    dcbNacimiento: TDateComboBox;
    rgSexo: TRadioGroup;
    btnAceptar: TButton;
    btnCancelar: TButton;
    ceSueldo: TCurrencyEdit;
    Label15: TLabel;
    Seguridad: TSeguridad;
    btnVerFormato: TBitBtn;
    Bevel1: TBevel;
    Label19: TLabel;
    fraEstadoCivil: TfraStaticCTB_TABLAS;
    Label20: TLabel;
    fraProvincia: TfraCodigoDescripcion;
    Label21: TLabel;
    fraLocalidad: TfraCodigoDescripcion;
    sdspSaveTrabajador: TSDStoredProc;
    Label22: TLabel;
    edFechaIngreso: TDateComboBox;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    edModalidadPresentacion: TEdit;
    Label23: TLabel;
    fraOrigenDato: TfraCodDesc;
    Label24: TLabel;
    Label25: TLabel;
    edMiSimplificacion: TEdit;
    mnuGrid: TPopupMenu;
    mnuIgnorar: TMenuItem;
    GroupBox1: TGroupBox;
    btnProcesar: TButton;
    lbProceso: TLabel;
    btnCorrecciones: TButton;
    BarProgreso: TJvSpecialProgress;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    tbOcultarColumnas: TToolButton;
    FieldHider: TFieldHider;
    SortDialog: TSortDialog;
    tbMostrarFiltros: TToolButton;
    Panel1: TPanel;
    pnComputerUser: TPanel;
    btnVerHistorial: TButton;
    btnClearControls: TButton;
    btnGrabar: TButton;
    btnSalir: TButton;
    chkSoloEnBase: TCheckBox;
    tbIgnorar: TToolButton;
    edAltasPotenciales: TIntEdit;
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    GuardarExcel: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure chkBajasClick(Sender: TObject);
    procedure btnImprimirBajasPotencialesClick(Sender: TObject);
    procedure btnClearControlsClick(Sender: TObject);
    procedure edBajasCausadasChange(Sender: TObject);
    procedure btnCorreccionesClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnVerHistorialClick(Sender: TObject);
    procedure btnVerFormatoClick(Sender: TObject);
    procedure fraProvinciaExit(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuIgnorarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbOcultarColumnasClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMostrarFiltrosClick(Sender: TObject);
    procedure tbIgnorarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FEstadosCiviles: String;
    FIdDisketteNomina: Integer;
    FOcultar: Boolean;

    function EsNombreInvalido(aCadena: String): Boolean;
    function GetComputerAndUserName: String;
    //function GetCuilTrabajador(aNroDocumento, aSexo: String; aNacimiento: TDateTime): String;
    function GetMaximoSalario: Extended;
    function GetMinimoSalario: Extended;
    function GetUltimaLinea: Integer;
    function GuardarTrabajador(const aIdTrabajador: Integer; aQuery: TSDQuery): Integer;
    function IsEmptyLine(const aValores: TValidationArray): Boolean;
    function ProcesarArchivoXLS(AFileName: String): TResultado;
    function QuitarCaracteresInvalidos(const aCadena: String): String;
    function ExisteTrabajadorEnContrato(const aCuil: String): boolean;
    function GetRelacionLaboralAnterior(const aCuil: String; const aContrato: Integer):TResultadoRelacionLaboralAnterior;

    procedure CambiaEmpresa(Sender: TObject);
    procedure CargarQuery;
    procedure ClearControls;
    procedure ClearDatosTrabajador;
    procedure LimpiarResultados;
    procedure LoadFechaMiSimplificacion(const aCuit: String);
    procedure GenerarExcelAltasPotenciales;
    procedure SeleccionarFilas(const aShortCut : Integer);
  end;

var
  frmCargaNominaDsk: TfrmCargaNominaDsk;

const
  VectorFormatosFecha: Array[0..15] of String = ('DD/MM/AAAA','DMMAA','DDMMAAA','DDMMAAAA', 'AAAAMMDD', 'D/MM/AA',
                                                 'D-MM-AA', 'DD/MM/AA', 'DD-MM-AA', 'DD-MM-AAAA', 'AA/MM/D', 'AA/MM/DD',
                                                 'AAAA/MM/DD', 'MM/D/AA', 'MM/DD/AA', 'MM/DD/AAAA');
  VectorFormatosSexo: Array[0..3] of String = ('M/F', 'F/M', 'V/M', 'M/V');

  CANT_COLS_XLS = 7;

implementation

uses
  VCLExtra, unPrincipal, CUIT, unDmPrincipal, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, unAfiliaciones, DateTimeFuncs,
  unArt, unComunes, unSesion, ComObj, ArchFuncs, General, unRptBajasPotenciales, unCompatibilidad,
  unHistoricoCargaNomina;

{$R *.DFM}

procedure TfrmCargaNominaDsk.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  frmPrincipal.mnuCargaMasivaDiskette.Enabled := False;
  fraEstadoCivil.Clave := 'ESTAD';
  fraEmpresaAfi.OnChange := CambiaEmpresa;

  fraProvincia.TableName   := 'cpv_provincias';
  fraProvincia.FieldID     := 'pv_codigo';
  fraProvincia.FieldCodigo := 'pv_codigo';
  fraProvincia.FieldDesc   := 'pv_descripcion';

  fraLocalidad.TableName   := 'comunes.v_localidades';
  fraLocalidad.FieldID     := 'id';
  fraLocalidad.FieldCodigo := 'id';
  fraLocalidad.FieldDesc   := 'localidad';

  ClearControls;
  fraEmpresaAfi.ShowBajas := True;
  pnComputerUser.Caption := GetComputerAndUserName;

  edMiSimplificacion.Text := '';

  sSql :=
    'SELECT   tb_codigo, tb_descripcion' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''ESTAD''' +
        ' AND tb_codigo <> ''0''' +
   ' ORDER BY tb_codigo';
  with GetQuery(sSql) do
  try
    FEstadosCiviles := '';
    while not Eof do
    begin
      FEstadosCiviles := FEstadosCiviles + Format('%s=%s/', [FieldByName('tb_codigo').AsString,
                                                             FieldByName('tb_descripcion').AsString]);
      Next;
    end;
    System.Delete(FEstadosCiviles, Length(FEstadosCiviles), 2);
  finally
    Free;
  end;

  //*** Pidio GGROSSI y asegura que EVILA dio el Ok
  edModalidadPresentacion.Clear;
  edModalidadPresentacion.Color := clWindow;

  edMiSimplificacion.Clear;
  edMiSimplificacion.Color := clWindow;
  //****
end;

procedure TfrmCargaNominaDsk.btnProcesarClick(Sender: TObject);
var
  Registro: TResultado;
  Sql: TSql;
  sSql: String;
begin
  LimpiarResultados;
  edFilename.Text := Trim(StrReplace(edFilename.Text,'"',''));
  Verificar(fraEmpresaAfi.IsEmpty, fraEmpresaAfi.edContrato, 'Debe indicar la empresa a la que pertenecen los empleados.');
  Verificar(edPeriodo.Periodo.IsNull, edPeriodo, 'Debe indicar el período al que pertenece la nómina.');
  Verificar(fraEstablecimiento.IsEmpty, fraEstablecimiento.edCodigo, 'Debe indicar el establecimiento al que pertenecen los empleados.');
  Verificar(edFilename.Text = '', edFilename, 'Debe elegir un archivo para procesar.');
  Verificar(cmbFechaRecepcion.IsEmpty, cmbFechaRecepcion, 'Debe indicar la fecha de recepción de la nómina.');
  Verificar((cmbFechaRecepcion.Date > DBDate), cmbFechaRecepcion, 'La Fecha de Recepción no puede ser posterior al día de hoy.');
  Verificar(chkBajas.Checked and cmbFechaBaja.IsEmpty, cmbFechaBaja, 'Debe indicar la fecha de baja para los trabajadores.');

  gbContrato.Enabled := False;
  gbEmpresa.Enabled := False;

  if (UpperCase(ExtractFileExt(edFilename.Text)) = '.XLS') or (UpperCase(ExtractFileExt(edFilename.Text)) = '.XLSX') then
    Registro := ProcesarArchivoXLS(edFilename.Text);

  Sql := TSql.Create('adn_diskettenomina');
  try
    Sql.Clear;
    Sql.SqlType := stInsert;

    FIdDisketteNomina := ValorSqlInteger('SELECT seq_adn_id.NEXTVAL FROM DUAL');

    Sql.Fields.Add('dn_id',                  FIdDisketteNomina);
    Sql.Fields.Add('dn_contrato',            fraEmpresaAfi.Contrato);
    Sql.Fields.Add('dn_idestablecimiento',   fraEstablecimiento.Value);
    Sql.Fields.Add('dn_cantidadregistros',   Registro.Total);
    Sql.Fields.Add('dn_cantidadbajadsk',     Registro.BajasDsk);
    Sql.Fields.Add('dn_cantidadbajabase',    Registro.BajasDB);
    Sql.Fields.Add('dn_totalmasadsk',        Registro.MasaDSK);
    Sql.Fields.Add('dn_totalmasabase',       Registro.MasaDB);
    Sql.Fields.Add('dn_totalaltasdsk',       Registro.AltasDSK);
    Sql.Fields.Add('dn_totalmasaaltadsk',    Registro.MasaAltaDSK);
    Sql.Fields.Add('dn_cantidadddjj',        0);
    Sql.Fields.Add('dn_estado',              Registro.Estado);
    Sql.Fields.Add('dn_periodo',             StrReplace(edPeriodo.Periodo.Valor, '/', ''));
    Sql.Fields.Add('dn_fechabaja',           cmbFechaBaja.Date, dtDateTime);
    Sql.Fields.Add('dn_fecharecepcion',      cmbFechaRecepcion.Date, dtDateTime);
    Sql.Fields.Add('dn_actualizamovimiento', String(IIF(chkBajas.Checked, 'A', 'M')));
    Sql.Fields.Add('dn_usualta',             GetComputerAndUserName);
    Sql.Fields.Add('dn_fechaalta',           exDateTime);

    sSql :=
      'SELECT COUNT(*)' +
       ' FROM crl_relacionlaboral' +
      ' WHERE rl_contrato = :contrato';
    Sql.Fields.Add('dn_canttrab_ap',         ValorSqlIntegerEx(sSql, [fraEmpresaAfi.Contrato]));
    try
      EjecutarSql(Sql.Sql);
    except
      MessageDlg('Error al guardar los datos relacionados con la nómina.', mtError, [mbOK], 0);
    end;
  finally
    Sql.Free;
  end;
end;

procedure TfrmCargaNominaDsk.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaNominaDsk.ClearControls;
begin
  gbContrato.Enabled := True;
  gbEmpresa.Enabled := True;

  VCLExtra.LockControls([edTotal, edError, edCorrectos, edBajasDSK, edMasaBajasDSK, edBajasCausadas, edAltasPotenciales, edMasaDSK,
                         edMasaResultante, edAltasDSK, edMasaAltasDSK], True);
  VCLExtra.LockControls([btnGrabar], True);
  tbImprimir.Enabled := False;
  fraEmpresaAfi.Clear;
  edModalidadPresentacion.Clear;
  edPeriodo.Clear;
  fraEstablecimiento.Clear;
  edFilename.Clear;
  cmbFechaRecepcion.Clear;
  chkBajas.Checked := False;
  cmbFechaBaja.Clear;
  BarProgreso.Position := 0;
  lbProceso.Caption := '';
  edMiSimplificacion.Clear;
  edMiSimplificacion.Color := clWindow;
  edModalidadPresentacion.Color := clWindow; //pidio grossi

  LimpiarResultados;

  btnImprimirBajasPotenciales.Enabled := False;
end;

procedure TfrmCargaNominaDsk.LimpiarResultados;
begin
  edTotal.Clear;
  edError.Clear;
  edBajasDSK.Clear;
  edMasaBajasDSK.Clear;
  edBajasCausadas.Clear;
  edAltasPotenciales.Clear;
  edAltasDSK.Clear;
  edMasaAltasDSK.Clear;
  edMasaDSK.Clear;
  edMasaResultante.Clear;
  edCorrectos.Clear;
  sdqConsulta.Close;
end;

procedure TfrmCargaNominaDsk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuCargaMasivaDiskette.Enabled := True;
  frmCargaNominaDsk := nil;
  inherited;
end;

procedure TfrmCargaNominaDsk.CargarQuery;
var
  sSql: String;
begin
  sSql :=
    'SELECT   *' +
       ' FROM tmp_afinomi' +
      ' WHERE mp_usuario = :usuario' +
        ' AND mp_valido = ''N''' +
   ' ORDER BY mp_nrolinea';
  OpenQueryEx(sdqConsulta, [GetComputerAndUserName], sSql, True);
end;

procedure TfrmCargaNominaDsk.CambiaEmpresa(Sender: TObject);
var
  sSql: String;
begin
  if fraEmpresaAfi.IsSelected then
    fraEstablecimiento.Contrato := fraEmpresaAfi.Contrato
  else
    fraEstablecimiento.Clear;

  sSql :=
    'SELECT mp_descripcion, mp_id' +
     ' FROM emi.imp_modopresentacion' +
    ' WHERE mp_id = emi.utiles.get_modopresentacion(:idempresa, :periodo)';
  with GetQueryEx(sSql, [fraEmpresaAfi.ID, FormatDateTime('yyyymm', IncMonth(DBDate, -1))]) do
  try
    edModalidadPresentacion.Text := FieldByName('mp_descripcion').AsString;
    if FieldByName('mp_id').AsInteger = 1 then
      edModalidadPresentacion.Color := clRed
    else if FieldByName('mp_id').AsInteger = 2 then
      edModalidadPresentacion.Color := clGreen
    else if FieldByName('mp_id').AsInteger = 3 then
      edModalidadPresentacion.Color := clGreen
    else
      edModalidadPresentacion.Color := clBtnFace;
  finally
    Free;
  end;

  LoadFechaMiSimplificacion(fraEmpresaAfi.CUIT);

  If Is_DDJJEmptyUltPeriodo(fraEmpresaAfi.edContrato.Value) then
  begin
    MsgBox('La última DDJJ de este contrato, se encuentra sin empleados.', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmCargaNominaDsk.btnImprimirClick(Sender: TObject);
begin
  try
    if not sdqConsulta.IsEmpty and PrintDialog.Execute then
    begin
      QueryPrint.DataSource := dsConsulta;
      QueryPrint.SubTitle.Lines.Text := 'Errores en la carga masiva ' + #13 + #10;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
  end;
end;

procedure TfrmCargaNominaDsk.btnGrabarClick(Sender: TObject);
var
  bPermitirCargaTrab: Boolean;
  bTrabajadorMortal: Boolean;
  FechaBaja: TDateTime;
  dFechaMovimiento: TDateTime;
  iCantNoModificadosMort: Integer;
  iCantNoModificadosVivos: Integer;
  iIdRelacion: Integer;
  iIdRelEst: Integer;
  iIdTrabajador: Integer;
  iEstablecimientoId: Integer;
  iModalidadContratacionId: Integer;
  Query: TSDQuery;
  QueryBaja: TSDQuery;
  sCuil: String;
  sDescrPerConciliado: String;
  sMensaje: String;
  sNominaConsiderarDevengado: String;
  sPeriodo: String;
  SqlRelEstableci: TSql;
  SqlRelLaboral: TSql;
  sSql: String;
  Sueldo: Currency;
begin
  iIdTrabajador       := 0;
  sPeriodo            := StrReplace(edPeriodo.Periodo.Valor, '/', '');
  sDescrPerConciliado := Get_DescrPerConciliadoOLD(fraEmpresaAfi.edContrato.Value, sPeriodo);

  if sDescrPerConciliado = '' then
    sNominaConsiderarDevengado := 'S'     // la nómina se va a considerar en el devengado
  else
  begin
    MsgBox('El período se encuentra conciliado(' + sDescrPerConciliado + ')' + CRLF +
           'Se cargará la nómina sin considerarse para el nuevo devengado.', MB_ICONEXCLAMATION + MB_OK);
    sNominaConsiderarDevengado := 'N';     // la nómina no se va a considerar en el nuevo devengado
  end;

  if MsgBox('Esta acción guardará los registros en la base de datos.' + #13 + #10 +
            '¿ Está seguro de querer continuar ?', MB_ICONEXCLAMATION + MB_YESNO) = id_Yes then
  begin
    gbContrato.Enabled := False;
    gbEmpresa.Enabled := False;

    sSql :=
      'SELECT *' +
       ' FROM tmp_afinomi' +
      ' WHERE mp_usuario = :usuario' +
        ' AND mp_valido = ''S''';
    Query := GetQueryEx(sSql, [GetComputerAndUserName]);

    SqlRelLaboral   := TSql.Create('crl_relacionlaboral');
    SqlRelEstableci := TSql.Create('cre_relacionestablecimiento');
    iCantNoModificadosVivos := 0;
    iCantNoModificadosMort  := 0;

    try
      BarProgreso.Position := 0;
      BarProgreso.Minimum := 0;
      BarProgreso.Maximum := ValorSqlIntegerEx(StringReplace(sSql, 'SELECT *', 'SELECT COUNT(*)', []), [GetComputerAndUserName]);

      BeginTrans;
      while not Query.Eof do
      begin
        try
          lbProceso.Caption := Format('%d de %d', [BarProgreso.Position, BarProgreso.Maximum]);
          BarProgreso.StepIt;

          // Inicia la grabacion de los registros
          SqlRelLaboral.Clear;
          SqlRelEstableci.Clear;

          sCuil              := Query.FieldByName('mp_cuil').AsString;
          bPermitirCargaTrab := PermitirCargaNominaTrabajador(sCuil);
          bTrabajadorMortal  := Is_TrabajadorMortal(sCuil);

          if (bPermitirCargaTrab) or (not bTrabajadorMortal) then   // si no se permite la carga del trabajador y éste es mortal, entonces no se hace nada
          begin
            // Ingresa la fecha de recepcion como fecha de movimiento, si esta es NULL
            if not Query.FieldByName('mp_movimiento').IsNull then
              dFechaMovimiento := Query.FieldByName('mp_movimiento').AsDateTime
            else
              dFechaMovimiento := cmbFechaRecepcion.Date;

            // Doy de alta los registros correspondientes
            if (Query.FieldByName('mp_tipo').AsString <> 'B') then
            begin
              // Ingresa el sueldo
              if Query.FieldByName('mp_sueldo').AsString <> '' then
                Sueldo := StrToFloat(StrReplace(Query.FieldByName('mp_sueldo').AsString, '.', ','))
              else
                Sueldo := 0;

              iIdTrabajador := GetIdTrabajadorPorCuil(sCuil);

              if bPermitirCargaTrab then  // si el trabajador no existe, bPermitirCargaTrab da verdadero, entonces se da de alta
              begin
                //////////////////
                //  TRABAJADOR  //
                //////////////////

                if (iIdTrabajador = ART_EMPTY_ID) then
                  iIdTrabajador := GuardarTrabajador(-1, Query)
                else
                  GuardarTrabajador(iIdTrabajador, Query);
              end;


              ///////////////////////////
              //  CRL_RELACIONLABORAL  //
              ///////////////////////////
              iIdRelacion := GetIdRelacionLaboral(iIdTrabajador, fraEmpresaAfi.edContrato.Value);

              // Si el trabajador tiene fecha de baja POSTERIOR a la fecha de movimiento del registro que proceso, entonces no hace nada
              sSql :=
                'SELECT 1' +
                 ' FROM chl_historicolaboral' +
                ' WHERE hl_idtrabajador = :idtrabajador' +
                  ' AND hl_contrato = :contrato' +
                  ' AND hl_fechaegreso >= :fechaegreso';
              if not ExisteSqlEx(sSql, [iIdTrabajador, fraEmpresaAfi.edContrato.Value, TDateTimeEx.Create(cmbFechaRecepcion.Date)]) then
              begin
                sSql :=
                  'SELECT mc_id' +
                   ' FROM cmc_modalidadcontratacion' +
                  ' WHERE UPPER(mc_codigo) = UPPER(:codigo)';
                iModalidadContratacionId := ValorSqlIntegerEx(sSql, [Query.FieldByName('mp_tipocontrato').AsString]);

                if iIdRelacion = ART_EMPTY_ID then
                begin
                  SqlRelLaboral.SqlType := stInsert;
                  iIdRelacion := ValorSql('SELECT seq_crl_id.NEXTVAL FROM DUAL');
                  SqlRelLaboral.Fields.Add('rl_usualta',   Sesion.UserID);
                  SqlRelLaboral.Fields.Add('rl_fechaalta', cmbFechaRecepcion.Date);

                  if Query.FieldByName('mp_idorigendato').IsNull then
                    SqlRelLaboral.Fields.Add('rl_idorigendato', 2)
                  else
                    SqlRelLaboral.Fields.Add('rl_idorigendato', Query.FieldByName('mp_idorigendato').AsInteger);

                  if Query.FieldByName('mp_fechaingreso').AsString <> '' then
                    SqlRelLaboral.Fields.Add('rl_fechaingreso', Query.FieldByName('mp_fechaingreso').AsDateTime);
                end
                else
                begin
                  SqlRelLaboral.SqlType := stUpdate;
                  SqlRelLaboral.Fields.Add('rl_usumodif',   Sesion.UserID);
                  SqlRelLaboral.Fields.Add('rl_fechamodif', cmbFechaRecepcion.Date);
                  {Si el trabajador ya tenia una relacion y no se ingreso la fecha de movimiento
                   No hay que actualizar la fecha de Ingreso, sino dejarla como estaba
                   Con esto se queda con la fecha mas chica de las dos}
                  if not (Query.FieldByName('mp_fechaingreso').AsString = '') then
                    SqlRelLaboral.Fields.Add('rl_fechaingreso', 'LEAST(NVL(rl_fechaingreso, ACTUALDATE),' + SqlValue(Query.FieldByName('mp_fechaingreso').AsDateTime) + ')', False);
                end;
                SqlRelLaboral.PrimaryKey.Add('rl_id', iIdRelacion, False);

                // Campos
                SqlRelLaboral.Fields.Add('rl_contrato',       fraEmpresaAfi.edContrato.Value);
                SqlRelLaboral.Fields.Add('rl_idtrabajador',   iIdTrabajador, False);
                SqlRelLaboral.Fields.Add('rl_fecharecepcion', cmbFechaRecepcion.Date);

                if Query.FieldByName('mp_puesto').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_tarea', Query.FieldByName('mp_puesto').AsString);

                if Query.FieldByName('mp_sueldo').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_sueldo', Sueldo, dtNumber);

                if Query.FieldByName('mp_categoria').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_categoria', Query.FieldByName('mp_categoria').AsString);

                if Query.FieldByName('mp_examenpreexist').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_preexistente', Query.FieldByName('mp_examenpreexist').AsString);

                if Query.FieldByName('mp_examenpreocup').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_preocupacional', Query.FieldByName('mp_examenpreocup').AsString);

                if iModalidadContratacionId > 0 then
                  SqlRelLaboral.Fields.Add('rl_idmodalidadcontratacion', iModalidadContratacionId);

                if Query.FieldByName('mp_sector').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_sector', Query.FieldByName('mp_sector').AsString);

                if Query.FieldByName('mp_ciuo').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_ciuo', Query.FieldByName('mp_ciuo').AsString);

                if Query.FieldByName('mp_confirmapuesto').AsString <> '' then
                  SqlRelLaboral.Fields.Add('rl_confirmapuesto', Query.FieldByName('mp_confirmapuesto').AsString);


                if SqlRelLaboral.SqlType = stInsert then    // Si es un alta se llama al store procedure correspondiente..
                begin
                  sSql :=
                    'art.trabajador.insert_relacionlaboral(:idtrabajador, :fechaingreso, ' +
                                                           SqlNumber(Query.FieldByName('mp_sueldo').AsFloat, True) + ',' +
                                                         ' :puesto, :categoria, NULL, :ciuo, :sector, :fecharecepcion,' +
                                                         ' NULL, :contrato, :preexistente, :preocupacional,' +
                                                           SqlNumber(iModalidadContratacionId, True) + ', NULL, NULL,' +
                                                           IIF(Query.FieldByName('mp_idorigendato').IsNull, '2', SqlNumber(Query.FieldByName('mp_idorigendato').AsInteger, True)) + ',' +
                                                         ' :usuario, :idrelacion, SYSDATE, :confirma );';
                  EjecutarStoreSTEx(sSql, [iIdTrabajador,
                                           TDateTimeEx.Create(Query.FieldByName('mp_fechaingreso').AsDateTime),
                                           Query.FieldByName('mp_puesto').AsString,
                                           Query.FieldByName('mp_categoria').AsString,
                                           Query.FieldByName('mp_ciuo').AsString,
                                           Query.FieldByName('mp_sector').AsString,
                                           TDateTimeEx.Create(cmbFechaRecepcion.Date),
                                           fraEmpresaAfi.edContrato.Value,
                                           Query.FieldByName('mp_examenpreexist').AsString,
                                           Query.FieldByName('mp_examenpreocup').AsString,
                                           Sesion.UserID,
                                           iIdRelacion,
                                           Query.FieldByName('mp_confirmapuesto').AsString]);
                end
                else
                  EjecutarSqlST(SqlRelLaboral.Sql);


                ///////////////////////////////////
                //  CRE_RELACIONESTABLECIMIENTO  //
                ///////////////////////////////////
                sSql :=
                  'SELECT es_id' +
                   ' FROM aes_establecimiento' +
                  ' WHERE es_contrato = :contrato' +
                    ' AND es_nroestableci = :nro_establecimiento';
                iEstablecimientoId := ValorSqlIntegerEx(sSql, [fraEmpresaAfi.Contrato, StrToIntDef(Query.FieldByName('mp_establecimiento').AsString, StrToIntDef(fraEstablecimiento.edCodigo.Text, 0))]);

                // Primero traigo el ID del establecimiento que estoy procesando..
                sSql :=
                  'SELECT re_id' +
                   ' FROM cre_relacionestablecimiento' +
                  ' WHERE re_idrelacionlaboral = :idrelacion' +
                    ' AND re_idestablecimiento = :idestablecimiento';
                iIdRelEst := ValorSqlIntegerEx(sSql, [iIdRelacion, iEstablecimientoId]);

                // Si no existe, traigo el primer establecimiento que encuentro..
                if iIdRelEst < 1 then
                begin
                  sSql :=
                    'SELECT re_id' +
                     ' FROM cre_relacionestablecimiento' +
                    ' WHERE re_idrelacionlaboral = :idrelacionlaboral';
                  iIdRelEst := ValorSqlIntegerEx(sSql, [iIdRelacion]);
                end;

                if iIdRelEst < 1 then
                begin
                  SqlRelEstableci.SqlType := stInsert;
                  iIdRelEst := ValorSqlInteger('SELECT seq_cre_id.NEXTVAL FROM DUAL');
                  SqlRelEstableci.Fields.Add('re_usualta',   Sesion.UserID);
                  SqlRelEstableci.Fields.Add('re_fechaalta', cmbFechaRecepcion.Date);
                  if Query.FieldByName('mp_fechaingreso').AsString <> '' then
                    SqlRelEstableci.Fields.Add('re_fechaingreso', Query.FieldByName('mp_fechaingreso').AsDateTime);
                end
                else
                begin
                  SqlRelEstableci.SqlType := stUpdate;
                  SqlRelEstableci.Fields.Add('re_usumodif',   Sesion.UserID);
                  SqlRelEstableci.Fields.Add('re_fechamodif', cmbFechaRecepcion.Date);
                  if not (Query.FieldByName('mp_fechaingreso').AsString = '') then
                    SqlRelLaboral.Fields.Add('re_fechaingreso', 'LEAST(NVL(re_fechaingreso, ACTUALDATE),' + SqlValue(Query.FieldByName('mp_fechaingreso').AsDateTime) + ')', False);
                end;
                SqlRelEstableci.PrimaryKey.Add('re_id', iIdRelEst, False);

                // Campos
                SqlRelEstableci.Fields.Add('re_idestablecimiento', iEstablecimientoId);
                SqlRelEstableci.Fields.Add('re_idrelacionlaboral', iIdRelacion, False);
                EjecutarSqlST(SqlRelEstableci.Sql);

(* TKT 48134
   PMARRONE: Cambio esto porque esta modificando las nominas que se utilizan para devengar y no deberia hacerlo
                //////////////
                //  NOMINA  //
                //////////////
                sSql :=
                  'SELECT 1' +
                   ' FROM znr_nomrec' +
                  ' WHERE nr_cuil = :cuil' +
                    ' AND nr_period = :period' +
                    ' AND nr_cuit = :cuit';
                if not ExisteSqlEx(sSql, [sCuil, sPeriodo, fraEmpresaAfi.mskCUIT.Text]) then
                begin
                // Alta
                  sSql :=
                    'INSERT INTO znr_nomrec' +
                               ' (nr_cuit, nr_cuil, nr_period, nr_recep, nr_art, nr_fecreempre, nr_remimempre, nr_codrect)' +
                        ' VALUES (:cuit, :cuil, :periodo, ''3'', ''51'', actualdate, :sueldo, ''00'')';
                  EjecutarSqlSTEx(sSql, [fraEmpresaAfi.mskCUIT.Text, sCuil, sPeriodo, StrReplace(FloatToStr(Sueldo), ',', '.')]);
                end
                else
                begin
                // Update
                  sSql :=
                    'UPDATE znr_nomrec' +
                      ' SET nr_recep = iif_char(nr_remimss, NULL, ''3'', ''4''),' +
                          ' nr_fecreempre = actualdate,' +
                          ' nr_remimempre = :sueldo' +
                    ' WHERE nr_cuit = :cuit' +
                      ' AND nr_cuil = :cuil' +
                      ' AND nr_period = :period';
                  EjecutarSqlSTEx(sSql, [StrReplace(FloatToStr(Sueldo), ',', '.'), fraEmpresaAfi.mskCUIT.Text, sCuil,
                                         sPeriodo]);
                end;
*)
              end;
            end
            else
            begin
              sSql :=
                'SELECT rl_id' +
                 ' FROM crl_relacionlaboral, ctj_trabajador' +
                ' WHERE rl_idtrabajador = tj_id' +
                  ' AND rl_contrato = :contrato' +
                  ' AND tj_cuil = :cuil';
              iIdRelacion := ValorSqlIntegerEx(sSql, [fraEmpresaAfi.edContrato.Value, sCuil]);

              // Si no trae cargada la fecha de baja, uso la de movimiento
              if not Query.FieldByName('mp_fechabaja').IsNull then
                FechaBaja := Query.FieldByName('mp_fechabaja').AsDateTime
              else if not Query.FieldByName('mp_movimiento').IsNull then
                FechaBaja := dFechaMovimiento
              else
                FechaBaja := cmbFechaBaja.Date;

              BorrarTrabajador(iIdRelacion, FechaBaja, Sesion.UserId, 0, Query.FieldByName('mp_motivobaja').AsString);
            end;
          end;

          if not bPermitirCargaTrab then
          begin
            if bTrabajadorMortal then
              Inc(iCantNoModificadosMort)
            else
              Inc(iCantNoModificadosVivos);
          end;

          // Actualizo la recepcion del diskette
          sSql :=
            'UPDATE adn_diskettenomina' +
              ' SET dn_efectivamentegrabo = :efectivamentegrabo' +
            ' WHERE dn_id = :id';
          EjecutarSqlSTEx(sSql, ['S', FIdDisketteNomina]);

          // Genero el endoso del trabajador..
          sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idtrabajador, :usuario); END;';
          EjecutarSqlSTEx(sSql, [iIdTrabajador, Sesion.UserID]);

          if BarProgreso.Position mod 1000 = 0 then
          begin
            CommitTrans;
            BeginTrans;
          end;
          if BarProgreso.Position mod 100 = 0 then
            Application.ProcessMessages;
        except
          on E:Exception do
          begin
            RollBack;
            MessageDlg(E.Message, mtError, [mbOK], 0);
            Abort;
          end;
        end;

        // Toma el registro siguiente
        Query.Next;
      end;
      CommitTrans;

      //TKT 48134
      //PMARRONE: Cambio esto porque esta modificando las nominas que se utilizan para devengar y no deberia hacerlo
      // Genero el resumen de la nómina
      //Do_GenerarResumenIndividual(True, fraEmpresaAfi.mskCUIT.Text, sPeriodo, sNominaConsiderarDevengado, Sesion.UserId, True);

      if chkBajas.Checked then
      begin
        // Da de baja los trabajadores que pertenecen a la empresa que no estan en la nomina recien ingresada
        sSql :=
          'SELECT rl_id, rl_idtrabajador' +
           ' FROM crl_relacionlaboral' +
          ' WHERE rl_contrato = :p1' +
            ' AND NVL(rl_fechaingreso, :p2) <= :p3' +
            ' AND rl_idtrabajador NOT IN(SELECT tj_id' +
                                         ' FROM ctj_trabajador, tmp_afinomi' +
                                        ' WHERE tj_cuil = mp_cuil' +
                                          ' AND tj_id = rl_idtrabajador' +
                                          ' AND mp_usuario = :p4' +
                                          ' AND mp_valido = ''S'')';
        QueryBaja := GetQueryEx(sSql, [fraEmpresaAfi.edContrato.Value,
                                       TDateTimeEx.Create(1),
                                       TDateTimeEx.Create(cmbFechaBaja.Date),
                                       GetComputerAndUserName]);
        try
          while not QueryBaja.Eof do
          begin
            // Si no trae cargada la fecha de movimiento
            BeginTrans;
            try
              BorrarTrabajador(QueryBaja.FieldByName('rl_id').AsInteger, cmbFechaBaja.Date, Sesion.UserId);

              sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idtrabajador, :usuario); END;';
              EjecutarSqlSTEx(sSql, [QueryBaja.FieldByName('rl_idtrabajador').AsInteger, Sesion.UserID]);

              CommitTrans;
            except
              on E:Exception do
              begin
                RollBack;
                MessageDlg(E.Message, mtError, [mbOK], 0);
                Abort;
              end;
            end;
            QueryBaja.Next;
            Application.ProcessMessages;
          end;
        finally
          QueryBaja.Free;
        end;
      end;

      // Actualizo la cantidad de trabajadores que hay para el contrato procesado..
      sSql :=
        'UPDATE adn_diskettenomina' +
          ' SET dn_canttrab_dp = (SELECT COUNT(*)' +
                                  ' FROM crl_relacionlaboral' +
                                 ' WHERE rl_contrato = :contrato)' +
        ' WHERE dn_id = :id';
      EjecutarSqlEx(sSql, [fraEmpresaAfi.Contrato, FIdDisketteNomina]);

      sMensaje := 'Los datos se han guardado correctamente.';
      if (iCantNoModificadosVivos > 0) or (iCantNoModificadosMort > 0) then
        sMensaje := sMensaje + CRLF +
                    'No se ha actualizado la siguiente información:' + CRLF +
                    'Datos personales de trabajador/es siniestrado/s: ' + IntToStr(iCantNoModificadosVivos) + CRLF +
                    'Datos de trabajador/es siniestrado/s Mortal/es: ' + IntToStr(iCantNoModificadosMort);
      MessageDlg(sMensaje, mtInformation, [mbOK], 0);

      btnGrabar.Enabled := False;
    finally
      Query.Free;
      SqlRelLaboral.Free;
      SqlRelEstableci.Free;
    end;
  end;
end;

function TfrmCargaNominaDsk.EsNombreInvalido(aCadena: String): Boolean;
var
  iloopNombre: Integer;
  bNoValido: Boolean;
begin
  bNoValido := False;
  for iloopNombre := 1 to Length(aCadena) do
    if not(aCadena[iloopNombre] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', '.', ' ', '''']) then
    begin
      bNoValido := True;
      Break;
    end;

  Result := bNoValido;
end;

{function TfrmCargaNominaDsk.GetCuilTrabajador(aNroDocumento, aSexo: String; aNacimiento: TDateTime): String;
var
  bCUIL96: Boolean;
  sCuil: String;
  sCuilNuevo: String;
  sNroDocumentoConCeros: String;
  sSql: String;
begin
  sCuil := '';
  sNroDocumentoConCeros := LPad(aNroDocumento, '0', 8);

  sSql :=
    'SELECT   tj_cuil, tj_sexo, tj_fnacimiento' +
       ' FROM ctj_trabajador' +
      ' WHERE tj_documento = :documento' +
   ' ORDER BY tj_cuil';
  with GetQueryEx(sSql, [sNroDocumentoConCeros]) do
  try
    aSexo := Trim(UpperCase(aSexo));     // si no informa sexo o (el sexo informado coincide con el de la tabla y (la fecha de nacimiento no está informada o coincide con la de la tabla))

    while not Eof do
    begin
      if (aSexo = '') or ((FieldByName('tj_sexo').AsString = aSexo) and ((aNacimiento = 0) or (FieldByName('tj_fnacimiento').AsDateTime = aNacimiento))) then
      begin
        sCuil := FieldByName('tj_cuil').AsString;
        Break;
      end;

      Next;
    end;
  finally
    Free;
  end;

  if (sCuil = '') or Is_CUILIndeterminado(sCuil) then
  begin
    if aSexo = '' then
      bCUIL96 := True
    else
      begin
        bCUIL96 := not Is_GrabarCuilValido(sNroDocumentoConCeros, aSexo, sCuilNuevo);

        if not bCUIL96 then
          sCuil := sCuilNuevo;
      end;

    if bCUIL96 then
      sCuil := '96' + sNroDocumentoConCeros + '*';
  end;

  Result := sCuil;
end; }

procedure TfrmCargaNominaDsk.chkBajasClick(Sender: TObject);
begin
  if chkBajas.Checked then
    cmbFechaBaja.Enabled := True
  else
    cmbFechaBaja.Enabled := False;
end;

function TfrmCargaNominaDsk.ProcesarArchivoXLS(AFileName: String): TResultado;
var
  aCols: TLineaExcelArray;
  bCorrecionesAhora: Boolean;
  dFechaIngreso: TDateTime;
  dFechaBaja: TDateTime;
  dFechaNacimiento: TDateTime;
  eMaximoSalario: Extended;
  eMinimoSalario: Extended;
  iEdad: Integer;
  iLCid: Integer;
  iLoop: Integer;
  iLoop2: Integer;
  iRow: Integer;
  iUltimaLinea: Integer;
  sMensaje: String;
  sSql: String;

  function ProcesarLinea(const aNumeroLinea: Integer; aLinea: TLineaExcelArray; var Registro: TResultado): Boolean;
  var
    aSql: TSql;
    bEsBaja: Boolean;
    bEsGrave: Boolean;
    dFecha: TDateTime;
    eSueldo: Extended;
    sMensaje: String;
    sSexo: String;
    iIdOrigen : Integer;
  begin
    sMensaje := '';

    aSql := TSql.Create('tmp_afinomi');
    try
      bEsBaja := False;
      bEsGrave := True;
      dFechaNacimiento := 0;
      sSexo := '';

      aSql.Clear;
      aSql.SqlType := stInsert;
      aSql.Fields.Add('mp_movimiento', cmbFechaRecepcion.Date);
      aSql.Fields.Add('mp_tipo', 'A');


      // Apellido..
      aLinea['B'] := QuitarCaracteresInvalidos(aLinea['B']);
      if EsNombreInvalido(aLinea['B']) then
        sMensaje := sMensaje + 'El apellido contiene caracteres inválidos. '
      else if Length(aLinea['B']) > 60 then
        sMensaje := sMensaje + 'El apellido excedió el límite de 60 caracteres. ';
      aSql.Fields.Add('mp_apellido', Copy(UCase(aLinea['B']), 1, 60));

      // Sexo..
      if (aLinea['C'] <> 'F') and (aLinea['C'] <> 'M') then
      begin
        if aLinea['C'] <> '' then
          sMensaje := sMensaje + 'El sexo no es correcto. ';
      end
      else
      begin
        sSexo := aLinea['C'];
        aSql.Fields.Add('mp_sexo', aLinea['C']);
      end;

      // Nacionalidad..
      aSql.Fields.Add('mp_nacionalidad', Copy(UCase(aLinea['D']), 1, 60));

      // Fecha de Nacimiento..
      if aLinea['E'] <> '' then
      try
        dFechaNacimiento := ToDate(aLinea['E'], 'dd/mm/yyyy');
        iEdad            := Round((DBDate - dFechaNacimiento) / 365);
        if (iEdad < 16) then
          sMensaje := sMensaje + 'Fecha de nacimiento errónea, el trabajador tiene menos de 16 años. '
        else if (iEdad > 90) then
          sMensaje := sMensaje + 'Fecha de nacimiento errónea, el trabajador tiene más de 90 años. '
        else if (iEdad >= 80) then //tk 54072 siempre que la edad se encuentre entre 80 y 90 años consulte si es correcto
                                    //tk 57079 se quita la pregunta si quiere procesar.
          //if MsgBox('La edad del cuil ' + aLinea['A'] + ' es de ' + IntToStr(iEdad) +'.' + #13#10 +
                    //'¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
            sMensaje := sMensaje + 'La Edad es mayor a 80 años. ';
        aSql.Fields.Add('mp_nacimiento', dFechaNacimiento);
      except
        dFechaNacimiento := 0;
        sMensaje := sMensaje + 'La fecha de nacimiento no es correcta. ';
      end;

      // Estado Civil..
      if aLinea['F'] <> '' then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''ESTAD''' +
            ' AND tb_codigo = :codigo';
        if not ExisteSqlEx(sSql, [aLinea['F']]) then
          sMensaje := sMensaje + 'El estado civil es inválido. ';
      end;
      aSql.Fields.Add('mp_estadocivil', Copy(UCase(aLinea['F']), 1, 1));

      // Fecha de Ingreso..
      if aLinea['G'] <> '' then
      try
        dFechaIngreso := ToDate(aLinea['G'], 'dd/mm/yyyy');
        iEdad         := Round((DBDate - dFechaIngreso) / 365);
        if (iEdad > 60) then
          sMensaje := sMensaje + 'Fecha de ingreso errónea, el trabajador no pudo haber ingresado hace mas de 60 años. ';

        if (dFechaNacimiento > 0) and (dFechaIngreso > 0) then
          if dFechaNacimiento > dFechaIngreso then
            sMensaje := sMensaje + 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso. ';

        if ((Sesion.Sector = 'AFI') or (Sesion.Sector = 'ATCLI') or (Sesion.Sector = 'AFINOM')) and (UCase(aLinea['X']) <> 'INICIAL') then
        begin    //tk 57079 se quita la pregunta si quiere procesar.
          if not Is_FechaIngresoAltaRelacionLaboralOk(dFechaIngreso, aLinea['A'], fraEmpresaAfi.Contrato)then
          //  if MsgBox('Fecha de ingreso difiere en 2 meses o mas, a la fecha del registro actual en el Cuil ' + aLinea['A'] +'.' + #13#10 +
          //            '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
            sMensaje := sMensaje + 'Fecha de ingreso difiere en 2 meses o mas, a la fecha del registro actual. ';

          if (not Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(dFechaIngreso, fraEmpresaAfi.Contrato)) then
            //if MsgBox('La fecha de ingreso es menor a la vigencia desde del contrato ' + aLinea['A'] +'.' + #13#10 +
            //          '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
            sMensaje := sMensaje + 'Fecha de ingreso es menor a la fecha de vigencia desde del contrato. ';
        end;

        aSql.Fields.FieldByName['mp_movimiento'].Value := dFechaIngreso;
        aSql.Fields.Add('mp_fechaingreso', dFechaIngreso);
      except
        dFechaIngreso := 0;
        sMensaje := sMensaje + 'La fecha de ingreso no es correcta. ';
      end;

      // Establecimiento..
      aSql.Fields.Add('mp_establecimiento', Copy(UCase(aLinea['H']), 1, 100));

      // Tipo de Contrato..
      aSql.Fields.Add('mp_tipocontrato', Copy(UCase(aLinea['I']), 1, 100));

      // Tarea..
      aSql.Fields.Add('mp_puesto', Copy(UCase(aLinea['J']), 1, 50));

      // Sector..
      aSql.Fields.Add('mp_sector', Copy(UCase(aLinea['K']), 1, 150));

      // CIUO..
      aSql.Fields.Add('mp_ciuo', Copy(UCase(aLinea['L']), 1, 4));

      // Sueldo..
      if aLinea['M'] <> '' then
      try
        eSueldo := RoundTo(StrToFloat(StrReplace(aLinea['M'], '.', ',')), -2);
        eMaximoSalario := RoundTo(GetMaximoSalario, -2);
        eMinimoSalario := RoundTo(GetMinimoSalario, -2);

        if eSueldo < eMinimoSalario then
          eSueldo := eMinimoSalario;
        if eSueldo > eMaximoSalario then
          eSueldo := eMaximoSalario;

        aSql.Fields.Add('mp_sueldo', eSueldo);
        Registro.MasaDsk := Registro.MasaDsk + eSueldo;

        if bEsBaja then
          Registro.MasaBajaDSK := Registro.MasaBajaDSK + eSueldo;
      except
        sMensaje := sMensaje + 'El sueldo no es numérico. ';
      end;

      // Calle..
      aSql.Fields.Add('mp_calle', Copy(UCase(aLinea['N']), 1, 60));

      // Número..
      aSql.Fields.Add('mp_numero', Copy(UCase(aLinea['O']), 1, 6));

      // Piso..
      aSql.Fields.Add('mp_piso', Copy(UCase(aLinea['P']), 1, 6));

      // Departamento..
      aSql.Fields.Add('mp_departamento', Copy(UCase(aLinea['Q']), 1, 6));

      // Código Postal..
      aSql.Fields.Add('mp_codigopostal', Copy(UCase(aLinea['R']), 1, 8));

      // Localidad..
      aSql.Fields.Add('mp_localidad', Copy(UCase(aLinea['S']), 1, 85));

      // Provincia..
      if aLinea['T'] <> '' then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM cpv_provincias' +
          ' WHERE UPPER(pv_descripcion) = UPPER(:provincia)';
        if not ExisteSqlEx(sSql, [aLinea['T']]) then
          sMensaje := sMensaje + 'La provincia es inválida. ';
      end;
      aSql.Fields.Add('mp_provincia', Copy(UCase(aLinea['T']), 1, 50));

      // Domicilio completo..
      aSql.Fields.Add('mp_domiciliocompleto', Copy(UCase(aLinea['U']), 1, 255));

      // Fecha de Baja..
      if aLinea['V'] <> '' then
      try
        if (aLinea['G'] <> '') then
        begin
          dFechaIngreso := ToDate(aLinea['G'], 'dd/mm/yyyy');
          dFechaBaja    := ToDate(aLinea['V'], 'dd/mm/yyyy');
        end;
        if (dFechaIngreso > dFechaBaja) and (aLinea['G'] <> '') then
          sMensaje := sMensaje + 'Fecha de baja o ingreso errónea, el trabajador no pudo haber ingresado posteriormente a la baja. '
        else
        begin
          aSql.Fields.Add('mp_fechabaja', ToDate(aLinea['V'], 'dd/mm/yyyy'));
          if aSql.Fields.FieldByName['mp_tipo'].Value <> 'B' then
          begin
            aSql.Fields.FieldByName['mp_tipo'].Value := 'B';
            bEsBaja := True;
            Inc(Registro.BajasDsk);
          end;
        end;
      except
        sMensaje := sMensaje + 'La fecha de baja no es correcta. ';
      end;

      // Motivo de Baja..
      sSql :=
        'SELECT 1' +
         ' FROM ctb_tablas' +
        ' WHERE tb_clave = ''MOTIB''' +
          ' AND tb_codigo = :codigo';
      if ExisteSqlEx(sSql, [aLinea['W']]) then
        aSql.Fields.Add('mp_motivobaja', Copy(aLinea['W'], 1, 10))
      else
        aSql.Fields.Add('mp_motivobaja', exNull);

      //>>> Origen de dato >>>>
      if ((Length(aLinea['X']) >=2) and (aLinea['X'] <> '')) then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM afi.aod_origendato' +
          ' WHERE od_codigo = UPPER(:codigo)';
        if ExisteSqlEx(sSql, [aLinea['X']]) then //veo que exista lo que escribieron
        begin
          sSql :=
            'SELECT od_id' +
            ' FROM afi.aod_origendato' +
            ' WHERE od_codigo = UPPER(:codigo)';
          iIdOrigen := ValorSQLEx(sSql, [aLinea['X']]);  //recupero el id
          //tk 54128 pedido por callo/grossi
          if (Is_DDJJEmptyUltPeriodo(fraEmpresaAfi.edContrato.Value)) and (Is_EmpresaPagoSUSS(fraEmpresaAfi.edContrato.Value)) and (iIdOrigen <> 1) then
            sMensaje := sMensaje + 'Origen de datos incorrecto: DDJJ sin empleados y pago SUSS debe ser "MS". '
          else
            aSql.Fields.Add('mp_idorigendato', iIdOrigen); //si esta ok lo agrego
        end
        else
          sMensaje := sMensaje + 'Origen de datos incorrecto: ' + aLinea['X'] +'. '
      end
      else
        sMensaje := sMensaje + 'El Origen de datos es requerido. ';
     //<<<< Origen de dato <<<<

     // >>>Confirma Puesto..
      if (aLinea['Y'] <> 'S') and (aLinea['Y'] <> 'N') then
      begin
        if aLinea['Y'] <> '' then
          sMensaje := sMensaje + 'La confirmación de puesto no es correcta. ';
      end
      else
      begin
        sSexo := aLinea['Y'];
        aSql.Fields.Add('mp_confirmapuesto', aLinea['Y']);
      end;
     //<<<Confirma puesto<<<

     { if ((Length(aLinea['A']) <= 8) and (aLinea['A'] <> '') and (aLinea['A'] <> '0')) then
        aLinea['A'] := GetCuilTrabajador(aLinea['A'], sSexo, dFechaNacimiento);  }

      if not IsCuil(aLinea['A']) then
      begin
        sMensaje := sMensaje + 'El CUIL no es válido. ';

        sSql :=
          'SELECT tj_nombre, tj_cuil' +
           ' FROM ctj_trabajador' +
          ' WHERE tj_documento = :documento';
        with GetQueryEx(sSql, [Copy(aLinea['A'], 3, 8)]) do
        try
          if not IsEmpty then
            sMensaje := sMensaje + 'Posibles resultados:';

          while not Eof do
          begin
            sMensaje := sMensaje + ' ' +  Fields[0].AsString + ' (' + Fields[1].AsString + ') ';
            Next;
          end;
        finally
          Free;
        end;
      end
      else if (ValorSqlEx('SELECT art.sin.check_trabajadormuerto(:cuil) FROM DUAL', [aLinea['A']]) <> '0') then
        sMensaje := sMensaje + 'El trabajador figura como fallecido en nuestro sistema. ';


      if chkSoloEnBase.Checked then
        if not ExisteTrabajadorEnContrato(aLinea['A']) then
        begin
          sMensaje := 'El trabajador no figura en la base de datos. ' + sMensaje;
          edAltasPotenciales.Value := edAltasPotenciales.Value +1 ;
        end;
      aSql.Fields.Add('mp_cuil', aLinea['A']);

      // Ubico el trabajador y comparo las fechas...
      // Acá verifico que en caso de estar tildado 'Dar de baja a los trabajadores...'
      // no quede mal la fecha de baja con respecto a las fechas de nacimiento, recepción e ingreso...
      sSql :=
        'SELECT rl_id, tj_cuil, rl_fechaingreso, rl_fecharecepcion, tj_fnacimiento' +
         ' FROM crl_relacionlaboral, ctj_trabajador' +
        ' WHERE rl_idtrabajador = tj_id' +
          ' AND rl_contrato = :contrato' +
          ' AND tj_cuil = :cuil';
      with GetQueryEx(sSql, [fraEmpresaAfi.edContrato.Value, aLinea['A']]) do
      try
        if not IsEmpty then
        begin
          if chkBajas.Checked and (FieldByName('tj_fnacimiento').AsDateTime > cmbFechaBaja.Date) then
            sMensaje := sMensaje + 'La fecha de nacimiento no puede ser posterior a la fecha de baja. ';

          if bEsBaja and (FieldByName('rl_fechaingreso').AsDateTime > TDateTime(aSql.Fields.FieldByName['mp_fechabaja'].Value)) then
            sMensaje := sMensaje + 'La fecha de ingreso ' + FormatDateTime('dd/mm/yyyy', FieldByName('rl_fechaingreso').AsDateTime) + ' no puede ser posterior a la fecha de baja ' + FormatDateTime('dd/mm/yyyy', ToDate(aLinea['V'], 'dd/mm/yyyy')) + '. ';
          if bEsBaja and (FieldByName('tj_fnacimiento').AsDateTime > TDateTime(aSql.Fields.FieldByName['mp_fechabaja'].Value)) then
            sMensaje := sMensaje + 'La fecha de nacimiento no puede ser posterior a la fecha de baja. ';
        end
        else if bEsBaja then
        begin
          sSql :=
            'SELECT hl_fechaegreso' +
             ' FROM chl_historicolaboral, ctj_trabajador' +
            ' WHERE hl_contrato = :contrato' +
              ' AND hl_idtrabajador = tj_id' +
              ' AND tj_cuil = :cuil';
          dFecha := ValorSqlDateTimeEx(sSql, [fraEmpresaAfi.edContrato.Value, aLinea['A']]);
          if dFecha > 0 then
          begin
            bEsGrave := False;
            sMensaje := sMensaje + 'El trabajador ya figura dado de baja desde el ' + DateToStr(dFecha) + '.';
          end;
        end;
      finally
        Free;
      end;


      if sMensaje = '' then
      begin
        Result := True;
        aSql.Fields.Add('mp_valido', 'S');
      end
      else //Muestra el error
      begin
        Result := False;
        aSql.Fields.Add('mp_error', Copy(sMensaje, 1, 200));
        aSql.Fields.Add('mp_valido', 'N');
      end;

      if bEsGrave or (sMensaje > '') then
        aSql.Fields.Add('mp_grave', 'S')
      else
        aSql.Fields.Add('mp_grave', 'N');

      aSql.Fields.Add('mp_usuario', GetComputerAndUserName);
      aSql.Fields.Add('mp_nrolinea', aNumeroLinea);
      try
        EjecutarSqlST(aSql.Sql);
      except
        // Indica que se produjo un error inesperado al grabar los datos y permite continuar con el proceso
        on E:Exception do
        begin
          Result := False;
          sSql :=
            'INSERT INTO tmp_afinomi' +
                       ' (mp_usuario, mp_nrolinea, mp_error, mp_valido, mp_grave)' +
                ' VALUES (:usuario, :nrolinea, :error, ''N'', ''S'')';
          EjecutarSqlSTEx(sSql, [GetComputerAndUserName, aNumeroLinea, Copy(sMensaje + '-Error Inesperado: ' + E.Message, 1, 200)]);
        end;
      end;
    finally
      aSql.Free;
    end;
  end;

begin
  sbEstado.Panels[0].Text := 'Analizando archivo...';
  sbEstado.Update;

  // Reinicio la tabla
  EjecutarSqlEx('DELETE FROM tmp_afinomi WHERE mp_usuario = :usuario', [GetComputerAndUserName]);

  iLCid := GetUserDefaultLCID;
  try
    try
      ExcelApp.Workbooks.Open(AFileName, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      with ExcelWS do
      begin
        for iLoop := Ord('A') to Ord('Y') do
          aCols[Chr(iLoop)] := Range[Chr(iLoop) + '2', Chr(iLoop) + '2'].Value;

        iRow := 2;
        iUltimaLinea := GetUltimaLinea;

        Result.Errores := 0;
        Result.Total := iUltimaLinea;
        if (Result.Total < 1) then
          raise Exception.Create('El archivo no posee registros.');

        BarProgreso.Position := 0;
        BarProgreso.Minimum := 2;
        BarProgreso.Maximum := iUltimaLinea;

        sbEstado.Panels[0].Text := Format('%d registros a procesarse...', [iUltimaLinea - 1]);
        sbEstado.Update;
        edAltasPotenciales.Value := 0;

        BeginTrans;

        for iLoop := 2 to iUltimaLinea do
        begin
          // CUIL..
          aCols['A'] := SacarGuiones(aCols['A']);

          // Fecha Nacimiento..
          if (Trim(aCols['E']) > '') and (aCols['E'] <> '00/00/0000') and (aCols['E'] <> '  /  /    ') then
          try
            aCols['E'] := FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(aCols['E'], '''', '', [rfReplaceAll])));
          except
            //aCols['E'] := '';
            try
              dFechaNacimiento:= ToDate(aCols['E'], 'dd/mm/yyyy'); //testeo si anda esto
              aCols['E'] := DateToStr(dFechaNacimiento);
            except
              aCols['E'] := '';
            end;
          end
          else
            aCols['E'] := '';
          // Fecha Ingreso..
          if (Trim(aCols['G']) > '') and (aCols['G'] <> '00/00/0000') and (aCols['G'] <> '  /  /    ') then
          try
            aCols['G'] := FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(aCols['G'], '''', '', [rfReplaceAll])));
          except
            try
              dFechaIngreso := ToDate(aCols['G'], 'dd/mm/yyyy'); //testeo si anda esto
              aCols['G'] := DateToStr(dFechaIngreso);
            except
              aCols['G'] := '';
            end;
          end
          else
            aCols['G'] := '';

          // Sueldo..
          if Trim(aCols['M']) <> '' then
            aCols['M'] := Trim(aCols['M'])
          else
            aCols['M'] := '0';

          // Fecha Baja..
          if (Trim(aCols['V']) > '') and (aCols['V'] <> '00/00/0000') and (aCols['V'] <> '  /  /    ') then
          try
            aCols['V'] := FormatDateTime('DD/MM/YYYY', StrToFloat(StringReplace(aCols['V'], '''', '', [rfReplaceAll])));
          except
            //
          end;
          // Procesa el registro..
          if not ProcesarLinea(iLoop, aCols, Result) then
            Inc(Result.Errores);

          if BarProgreso.Position mod 1000 = 0 then
          begin
            CommitTrans;
            BeginTrans;
          end;

          lbProceso.Caption := Format('%d de %d', [BarProgreso.Position, BarProgreso.Maximum]);
          if BarProgreso.Position mod 100 = 0 then
            Forms.Application.ProcessMessages;
          BarProgreso.StepIt;

          Inc(iRow);
          for iLoop2 := Ord('A') to Ord('Y') do
            aCols[Chr(iLoop2)] := Range[Chr(iLoop2) + IntToStr(iRow), Chr(iLoop2) + IntToStr(iRow)].Value2;
        end;

        CommitTrans;
      end;
    except
      on E: Exception do
      begin
        Rollback(True);
        MsgBox('ERROR FATAL: ' + E.Message);
      end;
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Visible[0] := True;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;

  edBajasDSK.Value := Result.BajasDsk;
  edMasaDsk.Value := Result.MasaDsk;
  edMasaBajasDSK.Value := Result.MasaBajaDSK;
  edBajasCausadas.Value := 0;
  edMasaResultante.Value := 0;
  btnCorrecciones.Enabled := False;

  if chkBajas.Checked then
  begin
    sSql :=
      'SELECT mp_cuil, TRIM(mp_apellido || '' '' || mp_nombre), tj_cuil, tj_nombre' +
       ' FROM crl_relacionlaboral, ctj_trabajador, tmp_afinomi' +
      ' WHERE rl_contrato = :contrato' +
        ' AND rl_idtrabajador = tj_id' +
        ' AND tj_cuil <> mp_cuil' +
        ' AND tj_documento = SUBSTR(mp_cuil, 3, 8)' +
        ' AND SUBSTR(tj_cuil, 1, 2) = :prefijo' +
        ' AND mp_usuario = :usuario' +
        ' AND mp_valido = :valido';
    with GetQueryEx(sSql, [fraEmpresaAfi.Contrato, '96', GetComputerAndUserName, 'S']) do
    try
      if not IsEmpty then
      begin
        if MsgAsk('¿ Desea decidir sobre las correcciones de inconsistencias una por una ahora ?' + CRLF +
                  '(' + IIF(RecordCount = 1, 'Es ', 'Son ') + IntToStr(RecordCount) + ' inconsistencia' + IIF(RecordCount = 1, ')', 's)')) then
          bCorrecionesAhora := True
        else
          bCorrecionesAhora := False;

        BarProgreso.Position := 0;
        BarProgreso.Minimum := 0;
        BarProgreso.Maximum := RecordCount;

        while not Eof do
        begin
          lbProceso.Caption := Format('%d de %d', [BarProgreso.Position, BarProgreso.Maximum]);
          BarProgreso.StepIt;

          btnCorrecciones.Enabled := True;
          sSql :=
            'UPDATE tmp_afinomi' +
              ' SET mp_cuil = :cuil,' +
                  ' mp_valido = :valido,' +
                  ' mp_grave = :grave,' +
                  ' mp_error = :error' +
            ' WHERE mp_cuil = :cuil' +
              ' AND mp_usuario = :usuario';

          if bCorrecionesAhora and MsgAsk('El trabajador ' + Fields[3].AsString + ' (' + Fields[2].AsString + ') de nuestra base de datos difiere del trabajador ' + Fields[1].AsString + ' (' + Fields[0].AsString + ')' + CRLF + '¿ Desea realizar el cambio de CUIL en la base ?') then
          begin
            DoCambiarCuilBaseDatos(Fields[2].AsString, Fields[0].AsString, sMensaje);
            if sMensaje > '' then
              MsgBox('Error inesperado' + CRLF + sMensaje)
            else
              EjecutarSQLEx(sSql, [Fields[0].AsString, 'S', 'N', '', FieldByName('mp_cuil').AsString, GetComputerAndUserName]);
          end
          else
            EjecutarSQLEx(sSql, [FieldByName('mp_cuil').AsString, 'N', 'N',
                                 Copy('El trabajador ' + Fields[3].AsString + ' (' + Fields[2].AsString + ') de nuestra base de datos difiere' + CRLF + 'del trabajador ' + Fields[1].AsString + ' (' + Fields[0].AsString + ').', 1, 200),
                                 FieldByName('mp_cuil').AsString, GetComputerAndUserName]);
          Next;
          Application.ProcessMessages;
        end;
      end;
    finally
      Free;
    end;

    // Bajas Potenciales y Masa Potencial..
    sSql :=
      'SELECT COUNT(*), SUM(rl_sueldo)' +
       ' FROM crl_relacionlaboral' +
      ' WHERE rl_contrato = :p1' +
        ' AND NVL(rl_fechaingreso, :p2) <= :p3' +
        ' AND rl_idtrabajador NOT IN(SELECT tj_id' +
                                     ' FROM ctj_trabajador, tmp_afinomi' +
                                    ' WHERE (tj_cuil = mp_cuil' +
                                       ' OR (tj_documento = SUBSTR(mp_cuil, 3, 8) AND SUBSTR(mp_cuil, 1, 2) = :p4))' +
                                      ' AND tj_id = rl_idtrabajador' +
                                      ' AND mp_usuario = :p5' +
                                      ' AND mp_valido = :p6)';

    with GetQueryEx(sSql, [fraEmpresaAfi.edContrato.Value, TDateTimeEx.Create(1),
                           TDateTimeEx.Create(cmbfechabaja.Date), '96', GetComputerAndUserName, 'S']) do
    try
      Result.BajasDB := Fields[0].AsInteger;
      Result.MasaDB  := Fields[1].AsFloat;
    finally
      Free;
    end;
    edBajasCausadas.Value := Result.BajasDB;
    edMasaResultante.Value := Result.MasaDB;
  end;

  // Obtengo la cantidad de altas..
  sSql :=
    'SELECT COUNT(*), SUM(mp_sueldo)' +
     ' FROM ctj_trabajador, tmp_afinomi' +
    ' WHERE (tj_cuil = mp_cuil' +
       ' OR (tj_documento = SUBSTR(mp_cuil, 3, 8) AND SUBSTR(mp_cuil, 1, 2) = ''96''))' +
      ' AND mp_usuario = :usuario' +
      ' AND mp_valido = :valido' +
      ' AND tj_id NOT IN(SELECT rl_idtrabajador' +
                         ' FROM crl_relacionlaboral' +
                        ' WHERE rl_contrato = :contrato' +
                          ' AND tj_id = rl_idtrabajador)';

  with GetQueryEx(sSql, [GetComputerAndUserName, 'S', fraEmpresaAfi.edContrato.Value]) do
  try
    Result.AltasDSK    := Fields[0].AsInteger;
    Result.MasaAltaDSK := Fields[1].AsFloat;
  finally
    Free;
  end;

  edAltasDSK.Value  := Result.AltasDSK;
  edMasaAltasDSK.Value := Result.MasaAltaDSK;

  edTotal.Value := Result.Total - 1;
  edError.Value := Result.Errores;
  edCorrectos.Value := Result.Total - 1 - Result.Errores;
  CargarQuery;
  btnGrabar.Enabled := True;
  tbImprimir.Enabled := True;
  sbEstado.Panels[0].Text := 'Proceso finalizado.';
  sbEstado.Update;
  MessageDlg('El proceso ha terminado.', mtInformation, [mbOK], 0);

  Result.Resultado := btnGrabar.Enabled;

  if Result.Resultado then
  begin
    if Result.Errores > 0 then
      Result.Estado := '02'
    else
      Result.Estado := '01';
  end else
    Result.Estado := '03';

  sbEstado.Panels[0].Text := '';
end;

procedure TfrmCargaNominaDsk.btnImprimirBajasPotencialesClick(Sender: TObject);
begin
  with TqrBajasPotenciales.Create(Self) do
  try
    Ejecutar(fraEmpresaAfi.Contrato, GetComputerAndUserName, edPeriodo.Periodo.Valor, '96', cmbFechaBaja.Date, 1);
  except
    Free;
  end;
end;

procedure TfrmCargaNominaDsk.btnClearControlsClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmCargaNominaDsk.edBajasCausadasChange(Sender: TObject);
begin
  btnImprimirBajasPotenciales.Enabled := (edBajasCausadas.Value > 0) and (chkBajas.Checked);
end;

procedure TfrmCargaNominaDsk.btnCorreccionesClick(Sender: TObject);
var
  bCorrecionesManuales: Boolean;
  sMensaje: String;
  sSql: String;
begin
  if chkBajas.Checked then
  begin
    sSql :=
      'SELECT mp_cuil, TRIM(mp_apellido || '' '' || mp_nombre), tj_cuil, tj_nombre' +
       ' FROM crl_relacionlaboral, ctj_trabajador, tmp_afinomi' +
      ' WHERE rl_contrato = :contrato' +
        ' AND rl_idtrabajador = tj_id' +
        ' AND tj_cuil <> mp_cuil' +
        ' AND tj_documento = SUBSTR(mp_cuil, 3, 8)' +
        ' AND SUBSTR(tj_cuil, 1, 2) = :prefijo' +
        ' AND mp_usuario = :usuario' +
        ' AND mp_valido = :valido' +
        ' AND mp_grave = :grave';
    with GetQueryEx(sSql, [fraEmpresaAfi.Contrato, '96', GetComputerAndUserName, 'N', 'N']) do
    try
      if not IsEmpty then
      begin
        if MsgAsk('¿ Desea hacer las correcciones de las inconsistencias de los números de C.U.I.L. de nuestra base de datos una por una ?' + CRLF +
                  '(' + IIF(RecordCount = 1, 'Es ', 'Son ') + IntToStr(RecordCount) + ' inconsistencia' + IIF(RecordCount = 1, ')', 's)') + CRLF + CRLF +
                  'Si elige SI Ud. verá una pregunta por cada inconsistencia y decidirá que hacer.' + CRLF +
                  'Si elige NO las correciones se harán automáticamente.') then
          bCorrecionesManuales := True
        else
          bCorrecionesManuales := False;

        BarProgreso.Position := 0;
        BarProgreso.Minimum := 0;
        BarProgreso.Maximum := RecordCount;

        while not Eof do
        begin
          lbProceso.Caption := Format('%d de %d', [BarProgreso.Position, BarProgreso.Maximum]);
          BarProgreso.StepIt;

          sSql :=
            'UPDATE tmp_afinomi' +
              ' SET mp_cuil = :cuil,' +
                  ' mp_valido = :valido,' +
                  ' mp_grave = :grave,' +
                  ' mp_error = :error' +
            ' WHERE mp_cuil = :cuil' +
              ' AND mp_usuario = :usuario';

          if not bCorrecionesManuales or (bCorrecionesManuales and MsgAsk('El trabajador ' + Fields[3].AsString + ' (' + Fields[2].AsString + ') de nuestra base de datos difiere' + CRLF + 'del trabajador ' + Fields[1].AsString + ' (' + Fields[0].AsString + ').' + CRLF + '¿ Desea realizar el cambio de C.U.I.L. en la base ?')) then
          begin
            DoCambiarCuilBaseDatos(Fields[2].AsString, Fields[0].AsString, sMensaje);
            if sMensaje > '' then
              MsgBox('Error inesperado' + CRLF + sMensaje)
            else
              EjecutarSQLEx(sSql, [Fields[0].AsString, 'S', 'N', '', FieldByName('MP_CUIL').AsString, GetComputerAndUserName]);

            btnCorrecciones.Enabled := True;
          end
          else
          begin
            EjecutarSQLEx(sSql, [FieldByName('mp_cuil').AsString, 'N', 'N',
                                 Copy('El trabajador ' + Fields[3].AsString + ' (' + Fields[2].AsString + ') de nuestra base de datos difiere del trabajador ' + Fields[1].AsString + ' (' + Fields[0].AsString + ')', 1, 200),
                                 FieldByName('mp_cuil').AsString, GetComputerAndUserName]);
            btnCorrecciones.Enabled := False;
          end;

          Next;
          Application.ProcessMessages;
        end;
      end;
    finally
      Free;
    end;
  end;

  btnProcesar.Click;
end;

function TfrmCargaNominaDsk.GetMaximoSalario: Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT am_importope' +
     ' FROM cam_topeampos' +
    ' WHERE am_periodo = (SELECT MAX(a.am_periodo)' +
                          ' FROM cam_topeampos a' +
                         ' WHERE a.am_periodo <= :periodo)';
  Result := ValorSqlExtendedEx(sSql, [SqlValue(edPeriodo.Periodo.Ano) + SqlValue(edPeriodo.Periodo.Mes)]);
end;

function TfrmCargaNominaDsk.GetMinimoSalario: Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT am_importeminimo' +
     ' FROM cam_topeampos' +
    ' WHERE am_periodo = (SELECT MAX(a.am_periodo)' +
                          ' FROM cam_topeampos a' +
                         ' WHERE a.am_periodo <= :periodo)';
  Result := ValorSqlExtendedEx(sSql, [SqlValue(edPeriodo.Periodo.Ano) + SqlValue(edPeriodo.Periodo.Mes)]);
end;

function TfrmCargaNominaDsk.GetComputerAndUserName: String;
begin
  Result := Format('%s/%s', [frmPrincipal.DBLogin.WindowsComputerName, Sesion.UserID]);
end;

procedure TfrmCargaNominaDsk.GridDblClick(Sender: TObject);
begin
  with sdqConsulta do
  begin
    if (not Active) or (FieldByName('mp_nrolinea').AsInteger < 1) then
      Exit;

    ClearDatosTrabajador;

    meCuil.Text                := FieldByName('mp_cuil').AsString;
    edApellido.Text            := FieldByName('mp_apellido').AsString;
    dcbNacimiento.Date         := FieldByName('mp_nacimiento').AsDateTime;
    edFechaIngreso.Date        := FieldByName('mp_fechaingreso').AsDateTime;
    if FieldByName('mp_sexo').AsString = 'F' then
      rgSexo.ItemIndex         := 0
    else if FieldByName('mp_sexo').AsString = 'M' then
      rgSexo.ItemIndex         := 1;
    ceSueldo.Value             := FieldByName('mp_sueldo').AsCurrency;
    fraEstadoCivil.Value       := FieldByName('mp_estadocivil').AsString;
    fraProvincia.Value         := ValorSqlIntegerEx(
                                    'SELECT pv_codigo' +
                                     ' FROM cpv_provincias' +
                                    ' WHERE UPPER(pv_descripcion) = UPPER(:provincia)',
                                    [FieldByName('mp_provincia').AsString]);
    fraLocalidad.Value         := ValorSqlIntegerEx(
                                    'SELECT id' +
                                     ' FROM comunes.v_localidades' +
                                    ' WHERE UPPER(localidad) = UPPER(:localidad)',
                                    [FieldByName('mp_localidad').AsString]);
    fraOrigenDato.Value        := FieldByName('mp_idorigendato').AsInteger;
  end;
  fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''MS'', ''ANX'', ''DJMAN'', ''DKT'', ''INICIAL'')';


  fpTrabajador.ShowModal;
end;

procedure TfrmCargaNominaDsk.ClearDatosTrabajador;
begin
  meCuil.Clear;
  edApellido.Clear;
  dcbNacimiento.Clear;
  edFechaIngreso.Clear;
  rgSexo.ItemIndex := -1;
  ceSueldo.Clear;
  fraEstadoCivil.Clear;
  fraProvincia.Clear;
  fraLocalidad.Clear;
end;

procedure TfrmCargaNominaDsk.btnCancelarClick(Sender: TObject);
begin
  fpTrabajador.Close;
end;

procedure TfrmCargaNominaDsk.btnAceptarClick(Sender: TObject);
var
  dEdad: TDateTime;
  rMaximoSalario: Real;
  rMinimoSalario: Real;
  sSqlTrans: TSql;
begin
  Verificar(not IsCuil(meCuil.Text), meCuil, 'La C.U.I.L. ingresada es inválida.');
  Verificar((edApellido.Text <> QuitarCaracteresInvalidos(edApellido.Text)), edApellido, 'El apellido contiene caracteres inválidos.');

  Verificar(not dcbNacimiento.IsValid, dcbNacimiento, 'La fecha ingresada es inválida.');
  dEdad := Round((DBDate - dcbNacimiento.Date) / 365);
  Verificar((dEdad < 13) or (dEdad > 80), dcbNacimiento, 'El trabajador tiene que tener entre 13 y 80 años.');

  Verificar(edFechaIngreso.IsEmpty, edFechaIngreso, 'La fecha de ingreso es obligatoria');

  Verificar(not edFechaIngreso.IsValid, edFechaIngreso, 'La fecha ingresada es inválida.');
  dEdad := Round((DBDate - edFechaIngreso.Date) / 365);
  Verificar((dEdad > 60), edFechaIngreso, 'El trabajador no pudo haber ingresado hace mas de 60 años.');

  Verificar((dcbNacimiento.Date > 0) and (edFechaIngreso.Date > 0) and (dcbNacimiento.Date > edFechaIngreso.Date), edFechaIngreso, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso.');

  Verificar((rgSexo.ItemIndex = -1), rgSexo, 'Por favor, ingrese el sexo del trabajador.');

  rMaximoSalario := RoundTo(GetMaximoSalario, -2);
  rMinimoSalario := RoundTo(GetMinimoSalario, -2);
  Verificar((RoundTo(ceSueldo.Value, -2) > rMaximoSalario) or (RoundTo(ceSueldo.Value, -2) < rMinimoSalario), ceSueldo, 'El sueldo debe encontrarse entre ' + ToStr(rMinimoSalario) + ' y ' + ToStr(rMaximoSalario) + '.');
  Verificar(fraLocalidad.IsEmpty, fraLocalidad.cmbDescripcion, 'La localidad es obligatoria.');

  sSqlTrans := TSQL.Create('tmp_afinomi');
  try
    sSqlTrans.PrimaryKey.Add('mp_nrolinea', sdqConsulta.FieldByName('mp_nrolinea').AsInteger, False);
    sSqlTrans.SqlType := stUpdate;
    sSqlTrans.Fields.Clear;

    sSqlTrans.Fields.Add('mp_error',          '');
    sSqlTrans.Fields.Add('mp_valido',         'S');
    sSqlTrans.Fields.Add('mp_cuil',           meCuil.Text);
    sSqlTrans.Fields.Add('mp_apellido',       edApellido.Text);
    sSqlTrans.Fields.Add('mp_nacimiento',     dcbNacimiento.Date);
    sSqlTrans.Fields.Add('mp_fechaingreso',   edFechaIngreso.Date);
    sSqlTrans.Fields.Add('mp_sexo',           String(IIF((rgSexo.ItemIndex = 0), 'F', 'M')));
    sSqlTrans.Fields.AddExtended('mp_sueldo', ceSueldo.Value, 2, False);
    sSqlTrans.Fields.Add('mp_estadocivil',    fraEstadoCivil.Value);
    sSqlTrans.Fields.Add('mp_provincia',      fraProvincia.cmbDescripcion.Text);
    sSqlTrans.Fields.Add('mp_localidad',      fraLocalidad.Descripcion);
    if not fraOrigenDato.IsEmpty then
      sSqlTrans.Fields.Add('mp_idorigendato',   fraOrigenDato.Value);
    EjecutarSQL(sSqlTrans.Sql);
  finally
    sSqlTrans.Free;
  end;

  CargarQuery;

  fpTrabajador.Close;
end;

function TfrmCargaNominaDsk.QuitarCaracteresInvalidos(const aCadena: String): String;
var
  iLoop: Integer;
begin
  Result := '';

  for iLoop := 1 to Length(aCadena) do
    if aCadena[iLoop] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', '.', ' ', ''''] then
      Result := Result + aCadena[iLoop]
    else
    begin
      if (aCadena[iLoop] = 'á') or (aCadena[iLoop] = 'à') then
        Result := Result + 'a';
      if (aCadena[iLoop] = 'é') or (aCadena[iLoop] = 'è') then
        Result := Result + 'e';
      if (aCadena[iLoop] = 'í') or (aCadena[iLoop] = 'ì') then
        Result := Result + 'i';
      if (aCadena[iLoop] = 'ó') or (aCadena[iLoop] = 'ò') then
        Result := Result + 'o';
      if (aCadena[iLoop] = 'ú') or (aCadena[iLoop] = 'ù') then
        Result := Result + 'u';

      if (aCadena[iLoop] = 'Á') or (aCadena[iLoop] = 'À') then
        Result := Result + 'A';
      if (aCadena[iLoop] = 'É') or (aCadena[iLoop] = 'È') then
        Result := Result + 'E';
      if (aCadena[iLoop] = 'Í') or (aCadena[iLoop] = 'Ì') then
        Result := Result + 'I';
      if (aCadena[iLoop] = 'Ó') or (aCadena[iLoop] = 'Ò') then
        Result := Result + 'O';
      if (aCadena[iLoop] = 'Ú') or (aCadena[iLoop] = 'Ù') then
        Result := Result + 'U';

      if (aCadena[iLoop] = '¥') then
        Result := Result + 'Ñ';
    end;
end;

procedure TfrmCargaNominaDsk.btnVerHistorialClick(Sender: TObject);
begin
  Verificar((fraEmpresaAfi.Contrato < 1), fraEmpresaAfi, 'Debe ingresar el contrato.');

  FreeAndNil(frmHistoricoCargaNomina);
  frmHistoricoCargaNomina := TfrmHistoricoCargaNomina.Create(Self);
  frmHistoricoCargaNomina.Contrato := fraEmpresaAfi.Contrato;
end;

procedure TfrmCargaNominaDsk.btnVerFormatoClick(Sender: TObject);
begin
  MessageDlg(Format(
    'El Formato del archivo es:' + #13#10 +
    '* Extensión: .XLS o .XLSX' + #13#10 +
    '* Encabezado: Debe ingresarse encabezado' + #13#10 +
    '* Columnas:' + #13 + #10 +
    '           A) CUIL' + #13#10 +
    '           B) Apellido y Nombre' + #13#10 +
    '           C) Sexo (F/M)' + #13#10 +
    '           D) Nacionalidad' + #13#10 +
    '           E) Fecha Nacimiento (DD/MM/AAAA)' + #13#10 +
    '           F) Estado Civil (%s)' + #13#10 +
    '           G) Fecha Ingreso (DD/MM/AAAA)' + #13#10 +
    '           H) Nº Establecimiento' + #13#10 +
    '           I) Tipo Contrato (código)' + #13#10 +
    '           J) Tarea' + #13#10 +
    '           K) Sector' + #13#10 +
    '           L) Código CIUO' + #13#10 +
    '           M) Sueldo' + #13#10 +
    '           N) Calle' + #13#10 +
    '           O) Número' + #13#10 +
    '           P) Piso' + #13#10 +
    '           Q) Departamento' + #13#10 +
    '           R) Código Postal' + #13#10 +
    '           S) Localidad' + #13#10 +
    '           T) Provincia' + #13#10 +
    '           U) Domicilio Completo' + #13#10 +
    '           V) Fecha Baja (DD/MM/AAAA)' + #13#10 +
    '           W) Motivo Baja' + #13#10 +
    '           X) Origen de Dato (MS=Mi Simplifiación/ ANX=Anexo/ DJMAN=DDJJ Manual / INCIAL)' + #13#10 +
    '           Y) Confirmado en el Puesto (S/N)' +  #13#10 +
    '           Z) Relación Laboral Anterior con el contrato actual (S/N) (Este dato no se procesa)' + #13#10 +
    '          AA) Fecha de egreso de relación laboral anterior (Este dato no se procesa)' + #13#10 +
    '          AB) Código de Motivo de Egreso (Este dato no se procesa)',
    [FEstadosCiviles]), mtInformation, [mbOK], 0);
end;

procedure TfrmCargaNominaDsk.fraProvinciaExit(Sender: TObject);
begin
  fraProvincia.FrameExit(Sender);

  fraLocalidad.ExtraCondition := ' AND provincia = ' + SqlValue(fraProvincia.Value);
end;

function TfrmCargaNominaDsk.GuardarTrabajador(const aIdTrabajador: Integer; aQuery: TSDQuery): Integer;
var
  sNombreFinal: String;
  sProvinciaId: String;
  sSql: String;
begin
  // Junto el nombre con el apellido..
  sNombreFinal := Trim(aQuery.FieldByName('mp_apellido').AsString);
  if Trim(aQuery.FieldByName('mp_nombre').AsString) > '' then
    sNombreFinal := sNombreFinal + ' ' + Trim(aQuery.FieldByName('mp_nombre').AsString);

  sSql :=
    'SELECT pv_codigo' +
     ' FROM cpv_provincias' +
    ' WHERE UPPER(pv_descripcion) = UPPER(:descripcion)';
  sProvinciaId := ValorSqlEx(sSql, [aQuery.FieldByName('mp_provincia').AsString]);

  with sdspSaveTrabajador do
  begin
    ParamByName('id').Value             := IIF((aIdTrabajador = -1), NULL, aIdTrabajador);
    ParamByName('cuil').AsString        := aQuery.FieldByName('mp_cuil').AsString;
    ParamByName('domicilio').AsString   := aQuery.FieldByName('mp_domiciliocompleto').AsString;
    ParamByName('fechamovi').AsDateTime := cmbFechaRecepcion.Date;
    ParamByName('nombre').AsString      := sNombreFinal;
    ParamByName('origen').AsString      := 'X';
    ParamByName('usuario').AsString     := Sesion.UserID;

    //agregados los ParambyName('xx').Clear porque en esta version no se porque se queda con los datos anteriores.

    if aQuery.FieldByName('mp_calle').AsString <> '' then
      ParamByName('calle').AsString := aQuery.FieldByName('mp_calle').AsString
    else
      ParamByName('calle').Clear;

    if aQuery.FieldByName('mp_codigopostal').AsString <> '' then
      ParamByName('cpostal').AsString := aQuery.FieldByName('mp_codigopostal').AsString
    else
      ParamByName('cpostal').Clear;

    if aQuery.FieldByName('mp_departamento').AsString <> '' then
      ParamByName('departamento').AsString := aQuery.FieldByName('mp_departamento').AsString
    else
      ParamByName('departamento').Clear;

    if aQuery.FieldByName('mp_estadocivil').AsString <> '' then
      ParamByName('estadocivil').AsString := aQuery.FieldByName('mp_estadocivil').AsString
    else
      ParamByName('estadocivil').Clear;

    if aQuery.FieldByName('mp_nacimiento').AsString <> '' then
      ParamByName('fnacimiento').AsDateTime := aQuery.FieldByName('mp_nacimiento').AsDateTime
    else
      ParamByName('fnacimiento').Clear;

    if aQuery.FieldByName('mp_nacionalidad').AsString <> '' then
      ParamByName('idnacionalidad').AsInteger := ValorSqlIntegerEx('SELECT na_id FROM cna_nacionalidad WHERE na_descripcion = :nacionalidad', [aQuery.FieldByName('mp_nacionalidad').AsString], 7)
    else
      ParamByName('idnacionalidad').Clear;

    if aQuery.FieldByName('mp_localidad').AsString <> '' then
      ParamByName('localidad').AsString := aQuery.FieldByName('mp_localidad').AsString
    else
      ParamByName('localidad').Clear;

    if aQuery.FieldByName('mp_numero').AsString <> '' then
      ParamByName('numero').AsString := aQuery.FieldByName('mp_numero').AsString
    else
      ParamByName('numero').Clear;

    if aQuery.FieldByName('mp_piso').AsString <> '' then
      ParamByName('piso').AsString := aQuery.FieldByName('mp_piso').AsString
    else
      ParamByName('numero').Clear;

    if sProvinciaId <> '' then
      ParamByName('provincia').AsString := sProvinciaId
    else
      ParamByName('provincia').Clear;

    if aQuery.FieldByName('mp_sexo').AsString <> '' then
      ParamByName('sexo').AsString := aQuery.FieldByName('mp_sexo').AsString
    else
      ParamByName('sexo').Clear;

    //Confirma grossi que esto no se guarda mas en la ctj sino que paso a la RL
    //if aQuery.FieldByName('mp_confirmapuesto').AsString <> '' then
    //   ParamByName('confirmapuesto').AsString  := aQuery.FieldByName('mp_confirmapuesto').AsString;

    ExecProc;

    if ParamByName('error').AsInteger = 0 then
      Result := ParamByName('id').AsInteger
    else
      raise Exception.Create(Format('CUIL: %s - %s [%d]', [aQuery.FieldByName('mp_cuil').AsString,
                                                           ParamByName('desc_error').AsString,
                                                           ParamByName('error').AsInteger]));
  end;
end;

procedure TfrmCargaNominaDsk.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SeleccionarFilas(ShortCut(Key, Shift));
  if (Key = VK_F5) and (btnGrabar.Enabled) then
  begin
    sdqConsulta.Close;
    sdqConsulta.Open;
  end;
end;

function TfrmCargaNominaDsk.IsEmptyLine(const aValores: TValidationArray): Boolean;
var
  iLoop: Integer;
begin
  Result := True;

  for iLoop := Ord('A') to Ord('G') do
    if aValores[Chr(iLoop)] <> '' then
    begin
      Result := False;
      Break;
    end;
end;

function TfrmCargaNominaDsk.GetUltimaLinea: Integer;
const
  MAX_BLANCOS = 10;
var
  aCols: TValidationArray;
  bIsEndOfFile: Boolean;
  iLoop: Integer;
  iLoop2: Integer;
begin
  Result := 2;

  with ExcelWS do
  begin
    bIsEndOfFile := False;

    for iLoop := Ord('A') to Ord('G') do
      aCols[Chr(iLoop)] := Range[Chr(iLoop) + '2', Chr(iLoop) + '2'].Value2;

    while not bIsEndOfFile do
    begin
      // Si leí mas lineas que el máximo establecido para que sea EOF..
      if Result > MAX_BLANCOS then
      begin
        bIsEndOfFile := True;

        for iLoop := Result downto (Result - MAX_BLANCOS + 1) do
        begin
          for iLoop2 := Ord('A') to Ord('G') do
            aCols[Chr(iLoop2)] := Range[Chr(iLoop2) + IntToStr(iLoop), Chr(iLoop2) + IntToStr(iLoop)].Value2;

          if not IsEmptyLine(aCols) then
          begin
            bIsEndOfFile := False;
            Break;
          end;
        end;
      end;

      if not bIsEndOfFile then
      begin
        Inc(Result);

        for iLoop := Ord('A') to Ord('G') do
          try
            aCols[Chr(iLoop)] := Range[Chr(iLoop) + IntToStr(Result), Chr(iLoop) + IntToStr(Result)].Value2
          except
            ShowMessage('Error en el registro '+ IntToStr(Result) +' Columna '+Chr(iLoop));
          end;
      end;
    end;
  end;

  Result := Result - MAX_BLANCOS;
end;

procedure TfrmCargaNominaDsk.LoadFechaMiSimplificacion(const aCuit: String);
var
  sSql : String;
begin
  sSql :=
   // 'SELECT afiliacion.get_idultimatafechaMS(:cuit) as fecha from DUAL';
    'SELECT MAX(mi_fechamov) AS fecha' +                                    //Oracle decide no usar los indices
    '  FROM cmi_miregistro' +
    ' WHERE mi_cuit = :cuit';
  with GetQueryEx(sSql, [aCuit]) do
  try
    if Not(FieldByName('fecha').IsNull) then
    begin
      edMiSimplificacion.Text := FieldByName('fecha').AsString;
      edMiSimplificacion.Color := clBlue;
      edMiSimplificacion.Font.Color := clWhite;
    end
    else
    begin
      edMiSimplificacion.Text := 'NO';
      edMiSimplificacion.Color := clPurple;
      edMiSimplificacion.Font.Color := clWhite;
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaDsk.mnuIgnorarClick(Sender: TObject);
var
  sSql : String;
  iLoop : Integer;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    sSql := ' UPDATE tmp_afinomi SET mp_error = NULL, mp_valido = ''S'', mp_grave = ''N'' WHERE mp_cuil = :cuil AND mp_usuario = :usuario';
    EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('mp_cuil').AsString, GetComputerAndUserName]);
  end;
  sdqConsulta.Refresh;
end;

procedure TfrmCargaNominaDsk.tbExportarClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      bAutoCols := ExportDialog.Fields.Count = 0;
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

procedure TfrmCargaNominaDsk.tbImprimirClick(Sender: TObject);
begin
  try
    if not sdqConsulta.IsEmpty and PrintDialog.Execute then
    begin
      QueryPrint.DataSource := dsConsulta;
      QueryPrint.SubTitle.Lines.Text := 'Errores en la carga masiva ' + #13 + #10;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
  end;
end;

procedure TfrmCargaNominaDsk.tbOcultarColumnasClick(Sender: TObject);
begin
  FieldHider.Execute;
end;

procedure TfrmCargaNominaDsk.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );
  SortDialog.Execute;
end;

procedure TfrmCargaNominaDsk.tbLimpiarClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmCargaNominaDsk.tbMostrarFiltrosClick(Sender: TObject);
begin
  if FOcultar then
  begin
     gbContrato.Visible    := True;
     gbEmpresa.Visible    := True;
     tbMostrarFiltros.Hint := 'Mostrar Filtros';
     tbMostrarFiltros.ImageIndex := 10;
     FOcultar := False;
  end else
  begin
     gbEmpresa.Visible     := False;
     gbContrato.Visible    := False;
     tbMostrarFiltros.Hint := 'Ocultar Filtros';
     tbMostrarFiltros.ImageIndex := 11;
     FOcultar := True;
  end;
end;

procedure TfrmCargaNominaDsk.tbIgnorarClick(Sender: TObject);
begin
  mnuIgnorarClick(nil);
end;

function TfrmCargaNominaDsk.ExisteTrabajadorEnContrato(
  const aCuil: String): boolean;
var
  sSql : String;
begin
  sSql := 'SELECT 1 ' +
            '  FROM comunes.ctj_trabajador ' +
            '   JOIN crl_relacionlaboral ON rl_idtrabajador = tj_id ' +
            ' WHERE 1 = 1 ' +
            '  AND tj_cuil = :cuil' +
            '  AND rl_contrato = :contrato';

  Result := ExisteSQLEx(sSql, [aCuil, fraEmpresaAfi.Contrato]);
end;

procedure TfrmCargaNominaDsk.SpeedButton1Click(Sender: TObject);
begin
  GenerarExcelAltasPotenciales;
end;

procedure TfrmCargaNominaDsk.GenerarExcelAltasPotenciales;
var
  Excel, Libro: Variant;
  ColumnRange: OleVariant;
  i: integer;
  Nombre: string;
  sSql : String;
  ResultadoRelaAnterior : TResultadoRelacionLaboralAnterior;
begin
  Verificar(not chkSoloEnBase.Checked, chkSoloEnBase, 'Debe seleccionar Trabajadores que no se encuentren en base');
  try
    GuardarExcel.Execute;
    if (GuardarExcel.FileName <> '') then
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False; //Visibilidad del excel (util para ver como va andando)
      Nombre := GuardarExcel.FileName;
      Excel.DisplayAlerts := False;

      //Comienzo a llenar las celdas
      Excel.WorkBooks.Add();
      Excel.WorkBooks[1].WorkSheets[1].Name := 'Reporte';
      Libro := Excel.WorkBooks[1].WorkSheets['Reporte'];

      //Columnas Config
      ColumnRange := Excel.Workbooks[1].WorkSheets[1].Columns;
      ColumnRange.Columns[1].ColumnWidth := 30;

      sSql :=
            'SELECT  mp_cuil, mp_nombre, mp_sexo, mp_nacionalidad, mp_estadocivil, mp_fechaingreso, mp_establecimiento,' +
            '        mp_tipocontrato, mp_puesto, mp_sector, mp_ciuo, mp_sueldo, mp_calle, mp_numero, mp_piso, mp_departamento,' +
            '        mp_codigopostal, mp_localidad, mp_provincia, mp_domiciliocompleto, mp_fechabaja, mp_motivobaja, mp_idorigendato,' +
            '        mp_confirmapuesto, mp_apellido, mp_nacimiento, od_codigo' +
            '   FROM tmp_afinomi' +
            '   LEFT JOIN afi.aod_origendato ON mp_idorigendato = od_id' +
            ' WHERE mp_usuario = :usuario' +
           //  ' AND mp_valido = ''S''' +
            '   AND mp_error LIKE ''%El trabajador no figura en la base de datos.%''' +
            ' ORDER BY mp_nrolinea';

      with GetQueryEx(sSql, [GetComputerAndUserName]) do
      try
        i := 2;
        while not (eof) do
        begin
          Libro.Cells [i,1] := FieldByName('mp_cuil').AsString;
          Libro.Cells [i,2] := FieldByName('mp_nombre').AsString + ' ' + FieldByName('mp_apellido').AsString;
          Libro.Cells [i,3] := FieldByName('mp_sexo').AsString;
          Libro.Cells [i,4] := FieldByName('mp_nacionalidad').AsString;
          Libro.Cells [i,5] := FieldByName('mp_nacimiento').AsString;
          Libro.Cells [i,6] := FieldByName('mp_estadocivil').AsString;
          Libro.Cells [i,7] := FieldByName('mp_fechaingreso').AsString;
          Libro.Cells [i,8] := FieldByName('mp_establecimiento').AsString;
          Libro.Cells [i,9].NumberFormat := Chr(64); //Si no anda verificar Unicode (esto es para el delphi 7)
          Libro.Cells [i,9] := FieldByName('mp_tipocontrato').AsString; // se almacena el codigo
          Libro.Cells [i,10] := FieldByName('mp_puesto').AsString;
          Libro.Cells [i,11] := FieldByName('mp_sector').AsString;
          Libro.Cells [i,12] := FieldByName('mp_ciuo').AsString; //verificar
          Libro.Cells [i,13] := FieldByName('mp_sueldo').AsString;
          Libro.Cells [i,14] := FieldByName('mp_calle').AsString;
          Libro.Cells [i,15] := FieldByName('mp_numero').AsString;
          Libro.Cells [i,16] := FieldByName('mp_piso').AsString;
          Libro.Cells [i,17] := FieldByName('mp_departamento').AsString;
          Libro.Cells [i,18] := FieldByName('mp_codigopostal').AsString;
          Libro.Cells [i,19] := FieldByName('mp_localidad').AsString;
          Libro.Cells [i,20] := FieldByName('mp_provincia').AsString;  //verificar
          Libro.Cells [i,21] := FieldByName('mp_domiciliocompleto').AsString;
         // Libro.Cells [i,22] := FieldByName('mp_fechabaja').AsString;
         // Libro.Cells [i,23] := FieldByName('mp_motivobaja').AsString; //verificar
          Libro.Cells [i,24] := FieldByName('od_codigo').AsString; //verificar
          Libro.Cells [i,25] := FieldByName('mp_confirmapuesto').AsString;

          ResultadoRelaAnterior := GetRelacionLaboralAnterior(FieldByName('mp_cuil').AsString, fraEmpresaAfi.Contrato);
          Libro.Cells [i,26] := ResultadoRelaAnterior.ExistioRelacion;
          Libro.Cells [i,27] := ResultadoRelaAnterior.FechaBaja;
          Libro.Cells [i,28].NumberFormat := Chr(64); //Si no anda verificar Unicode (esto es para el delphi 7)
          Libro.Cells [i,28] := ResultadoRelaAnterior.MotivoBaja;

          i := i + 1;
          Next;
        end;
      finally
        Free;
      end;
      //DM.IBQuery_cob.Close;
      //Excel.SaveAs(Nombre,Null,Null,Null,false,false,xlNoChange,xlUserResolution,false,Null,Null,0)
      Libro.SaveAs(GuardarExcel.FileName);
    end;
    Excel.Quit;
  except
    Excel.Quit;
    ShowMessage('No se pudo crear el Objecto Excel.');
  end;
end;

function TfrmCargaNominaDsk.GetRelacionLaboralAnterior(const aCuil: String;
  const aContrato: Integer): TResultadoRelacionLaboralAnterior;
var
  sSql : String;
begin
  sSql := 'SELECT hl_fechaegreso, hl_motivobaja'+
            '  FROM ctj_trabajador' +
            '  JOIN chl_historicolaboral ON tj_id = hl_idtrabajador' +
            ' WHERE tj_cuil = :cuil AND hl_contrato = :contrato AND rownum < 2';

  with GetQueryEx(sSql, [aCuil, aContrato]) do
  try
    if Not(eof) then
    begin
      Result.ExistioRelacion := 'S';
      Result.FechaBaja := FieldByName('hl_fechaegreso').AsString;
      Result.MotivoBaja := FieldByName('hl_motivobaja').AsString;
    end
    else
    begin
      Result.ExistioRelacion := 'N';
      Result.FechaBaja := '';
      Result.MotivoBaja := '';
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaDsk.SeleccionarFilas(const aShortCut: Integer);
var
  Cell : TGridCoord;
  TitleOffset, DeltaY, Step, i: Integer;
begin
 if dgTitles in Grid.Options then  //offset del Titulo de la columna
    TitleOffset := 1
  else
    TitleOffset := 0;

  if (aShortCut <> 8227) and (aShortCut <> 8228) then //salgo si no son las teclas esperadas
    Exit;

  if aShortCut = 8227  then   //Si selecciona hacia arriba o hacia abajo
  begin
   DeltaY := Grid.DataSource.DataSet.RecordCount - Grid.DataSource.DataSet.RecNo;
   Step := 1
  end
  else
  begin
    DeltaY := Grid.DataSource.DataSet.RecNo;
    Step := -1;
  end;

  if (Grid.DataSource.DataSet.Active) then //que este activo
  begin
    if (dgMultiSelect in Grid.Options) then  //Veo que tenga la prop. multi
    begin
     if Cell.Y >= TitleOffset then  //si la grilla usa la fila de titulo uso ese offset
     begin
       try
         for i := 0 to DeltaY -1 do     //Selecciono
         begin
           Grid.DataSource.DataSet.MoveBy(Step);
           Grid.SelectedRows.CurrentRowSelected := True;
         end;
         if Step > 0 then //mover el cursor
           Grid.DataSource.DataSet.MoveBy(-DeltaY +1)
         else
           Grid.DataSource.DataSet.MoveBy(DeltaY);
       except
         ShowMessage('error al seleccionar');
       end;
     end;
  end
  else
    inherited;
  end;
end;

end.
