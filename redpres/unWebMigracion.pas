unit unWebMigracion;

{********************************************************}
{                                                        }
{    TfrmWebMigracion - Migración de datos de la Web     }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 08/2003                                      }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox, unFraTrabajador, unArtDbFrame, unFraEmpresa, SinEdit,
  unfraPrestador, PatternEdit, DateTimeEditors, DataExport, DataToAscii, unArtDBAwareFrame, Provider, DBClient,
  unFraDomicilio, unFraCIE10, unFraCodigoDescripcion, unFraCodDesc, unredpres,
  IntEdit;

type
  TfrmWebMigracion = class(TfrmCustomGridABM)
    fraMW_DOCUMENTO: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    fraMW_ACCION: TfraStaticCTB_TABLAS;
    Label2: TLabel;
    Label3: TLabel;
    edMW_FECHARECEPCIONDesde: TDateComboBox;
    edMW_FECHARECEPCIONHasta: TDateComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edEMPRESA: TEdit;
    fraCUIT: TfraEmpresa;
    Bevel1: TBevel;
    Label6: TLabel;
    edTRABAJADOR: TEdit;
    Bevel2: TBevel;
    fraCUIL: TfraTrabajador;
    Label7: TLabel;
    fraPRESTADOR: TfraPrestador;
    Bevel3: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    edDIAGNOSTICO: TEdit;
    edSINIESTRO: TSinEdit;
    Label10: TLabel;
    edNOM_PRESTADOR: TEdit;
    fpAccion: TFormPanel;
    Bevel4: TBevel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    Label11: TLabel;
    fraCTB_ACWEB: TfraStaticCTB_TABLAS;
    sdqReporte: TSDQuery;
    qpReporte: TQueryPrint;
    dsReporte: TDataSource;
    ascNovedades: TDataToAscii;
    cdReporte: TClientDataSet;
    provReporte: TDataSetProvider;
    fraDomicilioTrab: TfraDomicilio;
    fraCIE10: TfraCodDesc;
    Label12: TLabel;
    fraGravedadCIE10: TfraStaticCTB_TABLAS;
    Label13: TLabel;
    sduConsulta: TSDUpdateSQL;
    Label14: TLabel;
    fraGravedad: TfraStaticCTB_TABLAS;
    Label15: TLabel;
    edTelefonoTrab: TEdit;
    edFEC_SINI: TDateComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Timer: TTimer;
    Label18: TLabel;
    tbMigracion: TToolButton;
    tbSalir2: TToolButton;
    ToolButton7: TToolButton;
    edObservaciones: TEdit;
    lblObservaciones: TLabel;
    fraTipoAccidente: TfraStaticCTB_TABLAS;
    Bevel5: TBevel;
    Label19: TLabel;
    edMW_TRANSACCION: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure tbAccionClick(Sender: TObject);
    procedure tbMigracionClick(Sender: TObject);
    procedure qpReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                     var ABackground: TColor; var AAlignment: TAlignment);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure fraCTB_ACWEBExit(Sender: TObject);
    procedure fraACWEBChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    sSqlWhere: String;
    iRegistros, iDenuncias, iPMI, iPME, iPEV, iSAS, iNSini, iNOrden, iNRecaida, iSinAccion, iSinExistente: Integer;
    procedure DoImprimirReporte;
    procedure DoImprimirResumen;
    procedure DoLimpiarCantidades;
    procedure DoContarAccion(sAccion: String);
    procedure DoCargarComboTipoAcc;
    procedure DoEnviarAvisoNC_Prestador(sIdPrestador: String);       // TK 7970
    function GetTipoAcc(sTextTipoAcc:String):String;
    function EsIngresadoPorConexia(iNroTransaccion:Integer):boolean;  // TK 7970
  protected
    function GetSqlABM: String; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure CreateSql; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, VclExtra, StrFuncs, CustomDlgs, General, DBFuncs, unRptDenuncia, ArchFuncs,
  IniFiles, unRptParteMedicoIngreso, unRptParteMedicoEgreso, unRptParteEvolutivo, unSesion, unCustomConsulta,
  DateTimeFuncs, unRptSolicitudAsistencia, unMoldeEnvioMail, StrUtils, uncomunes;
const
    ACCTRAB = 'Acc.Trab.';
    ENFPROF = 'Enf.Prof.';
    INITIN  = 'In Itinere';
    RECAIDA = 'Recaida';

{$R *.DFM}

procedure TfrmWebMigracion.ClearData;
begin
  fraMW_DOCUMENTO.Clear;
  fraMW_ACCION.Clear;
  edMW_FECHARECEPCIONDesde.Clear;
  edMW_FECHARECEPCIONHasta.Clear;
  edMW_TRANSACCION.Clear;
  inherited;
end;

procedure TfrmWebMigracion.FormCreate(Sender: TObject);
begin
  inherited;
  CheckPK                     := False;
  fraMW_DOCUMENTO.Clave       := 'DOWEB';
  fraMW_ACCION.Clave          := 'ACWEB';
  fraCTB_ACWEB.Clave          := 'ACWEB';
  fraCTB_ACWEB.OnChange       := fraACWEBChange;
  tbEliminar.ImageIndex       := 35;
  tbPropiedades.ImageIndex    := 21;
  ShowActived                 := False;
  fraGravedadCIE10.Clave      := 'GRAVC';
  fraGravedadCIE10.ShowBajas  := False;
  fraGravedad.Clave           := 'SGRAV';
  fraGravedad.ShowBajas       := False;
  fraTipoAccidente.Clave      := 'STIPO';
  fraTipoAccidente.OrderBy    := 'TB_CODIGO';
end;

procedure TfrmWebMigracion.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT mw_documento, mw_transaccion, mw_accion, mw_tipo, mw_cuit cuit, ' +
                ' art.afiliacion.get_contratovigente(mw_cuit, NVL(mw_fechasin, SYSDATE)) as contrato, ' +
                ' NVL(mw_cie10, ex_diagnosticooms) cie10, b.tb_descripcion parte, ' +
                ' nvl(em_nombre, mw_empresa) empresa, mw_cuil cuil, ' +
                ' nvl(tj_nombre, mw_trabajador) trabajador, mw_fechasin fec_sini, ' +
                ' mw_prestadorid prestador, nvl(ca_descripcion, mw_prestadornombre) nom_prestador, ' +
                ' nvl(mw_diagnostico, ex_diagnostico) diagnostico, mw_observacion observaciones, ' +
                ' mw_descripcion des_hecho, nvl(mw_grav_cie10, ex_gravedadcie10) gravcie10, ' +
                ' mw_bajamedica baja_med, mw_fechacontrol fec_control, ' +
                ' mw_altamedica alta_med, mw_fecharecepcion fec_recepcion, ' +
                ' art.web.is_documentocargado(mw_documento, mw_cuit, mw_cuil, mw_fechasin, ' +
                ' mw_prestadorid, mw_fechacontrol) doc_cargado, ' +
                ' a.tb_descripcion accion, mw_calle calletrab, mw_numero numerotrab, mw_piso pisotrab, ' +
                ' mw_departamento deptotrab, mw_cpostal cpostaltrab, mw_provincia, ' +
                ' mw_localidad localidadtrab, pv_descripcion provinciatrab, ' +
                ' art.utiles.armar_domicilio(mw_calle, mw_numero, mw_piso, mw_departamento, mw_localidad) domtrab, ' +
                ' nvl(mw_siniestro, ex_siniestro) siniestro, nvl(mw_orden, ex_orden) orden, ' +
                ' nvl(mw_recaida, ex_recaida) recaida, mw_gravedad, mw_telefono, ' +
                ' mw_sincompleto siniestro_completo, mw_trabajador, mw_idconexia, mw_usuaccion, mw_fechaaccion, ' +
                ' DECODE(art.siniestro.is_cargaexclusivatercerizada(em_id, art.actualdate), NULL, ''N'', ''S'') cargacolonia,  ' +
                ' art.siniestro.is_empresatercerizada(em_id, art.actualdate) empresa_terce, ex_id ' +     // TK 57263
           ' FROM aem_empresa, ctj_trabajador, cpr_prestador, v_tmp_smw_migracionweb, ' +
                ' ctb_tablas a, ctb_tablas b, cpv_provincias, sex_expedientes ' +
          ' WHERE mw_cuit = em_cuit(+) ' +
            ' AND mw_cuil = tj_cuil(+) ' +
            ' AND mw_prestadorid = ca_identificador(+) ' +
            ' AND a.tb_clave(+) = ''ACWEB'' ' +
            ' AND a.tb_codigo(+) = mw_accion ' +
            ' AND b.tb_clave(+) = ''DOWEB'' ' +
            ' AND b.tb_codigo(+) = mw_documento ' +
            ' AND pv_codigo(+) = mw_provincia ' +
            ' AND ex_siniestro(+) = NVL(mw_siniestro, DECODE(length(mw_sincompleto),15, SUBSTR(mw_sincompleto, 1, 8), 0)) ' +
            ' AND ex_orden(+) = NVL(mw_orden, DECODE(length(mw_sincompleto),15,SUBSTR(mw_sincompleto, 10, 3), 0)) ' +
            ' AND ex_recaida(+) = NVL(mw_recaida, DECODE(length(mw_sincompleto),15, SUBSTR(mw_sincompleto, 14, 2), 0)) ' +
            ' AND mw_nro_cecap IS NULL ';

  sSqlWhere := '';

  if fraMW_DOCUMENTO.IsSelected then
    sSqlWhere := sSqlWhere + ' AND mw_documento = ' + SqlValue(fraMW_DOCUMENTO.Value);

  if fraMW_ACCION.IsSelected then
    sSqlWhere := sSqlWhere + ' AND mw_accion = ' + SqlValue(fraMW_ACCION.Value);

  if edMW_FECHARECEPCIONDesde.Date > 0 then
    sSqlWhere := sSqlWhere + ' AND TRUNC(mw_fecharecepcion) >= ' + SqlValue(edMW_FECHARECEPCIONDesde.Date);

  if edMW_FECHARECEPCIONHasta.Date > 0 then
    sSqlWhere := sSqlWhere + ' AND TRUNC(mw_fecharecepcion) <= ' + SqlValue(edMW_FECHARECEPCIONHasta.Date);

  if edMW_TRANSACCION.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND mw_transaccion = ' + SqlInt(edMW_TRANSACCION.Value);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + ' ' + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmWebMigracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuLstWebMigracion.Enabled := True;
end;

procedure TfrmWebMigracion.ClearControls;
begin
  fraCUIT.Clear;
  edEMPRESA.Clear;
  edTelefonoTrab.Clear;
  fraCUIL.Clear;
  edTRABAJADOR.Clear;
  fraPRESTADOR.Clear;
  edSINIESTRO.Clear;
  edFEC_SINI.Clear;
  edFEC_SINI.ClearRange;
  edDIAGNOSTICO.Clear;
  fraDomicilioTrab.Clear;
  fraCIE10.Clear;
  fraGravedadCIE10.Clear;
  fraGravedad.Clear;
  fraTipoAccidente.Clear;
end;

procedure TfrmWebMigracion.LoadControls;
{  function Get_IdTipoAcc(sTipoAcc: string):Integer;
  begin
    if sTipoAcc = ACCTRAB       then Result := 1
    else if sTipoAcc = INITIN   then Result := 2
    else if sTipoAcc = ENFPROF  then Result := 3
    else if sTipoAcc = RECAIDA  then Result := 4
    else Result := 0;
  end;           }

begin
//  fraCUIT.CUIT          := sdqConsulta.FieldByName('CUIT').AsString;
  fraCUIT.Contrato        := sdqConsulta.FieldByName('CONTRATO').AsInteger;
  edEMPRESA.Text          := sdqConsulta.FieldByName('EMPRESA').AsString;
  edTelefonoTrab.Text     := sdqConsulta.FieldByName('MW_TELEFONO').AsString;
  edTRABAJADOR.Text       := sdqConsulta.FieldByName('MW_TRABAJADOR').AsString;
  fraPRESTADOR.Value      := sdqConsulta.FieldByName('PRESTADOR').AsInteger;
  edNOM_PRESTADOR.Text    := sdqConsulta.FieldByName('NOM_PRESTADOR').AsString;
 // iTipoAcc                := Get_IdTipoAcc(sdqConsulta.FieldByName('MW_TIPO').AsString);
 // cmbTipoAccABM.ItemIndex := iTipoAcc - 1;

  if (sdqConsulta.FieldByName('SINIESTRO').AsInteger = 0) and (sdqConsulta.FieldByName('ORDEN').AsInteger = 0)
      and (sdqConsulta.FieldByName('RECAIDA').AsInteger = 0) then
    edSINIESTRO.SetValues('','','')
  else
     edSINIESTRO.SetValues(sdqConsulta.FieldByName('SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('ORDEN').AsInteger,
                           sdqConsulta.FieldByName('RECAIDA').AsInteger);
  with edFEC_SINI do
  begin
    ClearRange;
    Clear;
    Date         := sdqConsulta.FieldByName('FEC_SINI').AsDateTime;
    MaxDate      := IIF(CompareDates(Date, DBDate) = -1, Date, DBDate);
  end;
  edDIAGNOSTICO.Text      := sdqConsulta.FieldByName('DIAGNOSTICO').AsString;
  fraGravedad.Codigo      := sdqConsulta.FieldByName('MW_GRAVEDAD').AsString;
  fraCIE10.Codigo         := sdqConsulta.FieldByName('CIE10').AsString;
  fraGravedadCIE10.Codigo := sdqConsulta.FieldByName('GRAVCIE10').AsString;
  //el domicilio del trabajador-----------
  fraDomicilioTrab.Cargar(sdqConsulta.FieldByName('CALLETRAB').AsString,
                          sdqConsulta.FieldByName('CPOSTALTRAB').AsString,
                          sdqConsulta.FieldByName('LOCALIDADTRAB').AsString,
                          sdqConsulta.FieldByName('NUMEROTRAB').AsString,
                          sdqConsulta.FieldByName('PISOTRAB').AsString,
                          sdqConsulta.FieldByName('DEPTOTRAB').AsString,
                          sdqConsulta.FieldByName('MW_PROVINCIA').AsString, '');
  //---------------------------------------
  VclExtra.LockControl(fraCUIT, fraCUIT.IsSelected);
  VclExtra.LockControl(fraPRESTADOR, not (fraPRESTADOR.IsEmpty and (not IsEmptyString(edNOM_PRESTADOR.Text))));
  Timer.Enabled := True;  // para utilidad del combo de Cuil en el fpAbm.
end;

function TfrmWebMigracion.Validar: Boolean;
begin
  Verificar(fraCUIT.IsEmpty, fraCUIT.mskCUIT, 'Debe seleccionar una Empresa.');
  Verificar(fraCUIL.IsEmpty, fraCUIL.mskCUIL, 'Debe seleccionar un Trabajador.');
  Result := True;
end;

function TfrmWebMigracion.GetSqlABM: String;
var param_bool: boolean;
  //  sTipoAcc: string;
begin
  param_bool := edSINIESTRO.IsEmpty;

 // sTipoAcc := GetTipoAcc(cmbTipoAccABM.Text);  // Lu TK 1254

  Result := 'BEGIN ' +
              'web.do_grabar_modificacion(' + SqlValue(sdqConsulta.FieldByName('MW_DOCUMENTO').AsString) + ',' +
                                              SqlValue(sdqConsulta.FieldByName('MW_TRANSACCION').AsString) + ',' +
                                              SqlValue(fraCUIT.CUIT) + ',' +
                                              SqlValue(fraCUIL.CUIL) + ',' +
                                              SqlValue(fraPRESTADOR.Value) + ',' +
                                              SqlInt(edSINIESTRO.Siniestro, param_bool) + ',' +
                                              SqlInt(edSINIESTRO.Orden, param_bool) + ',' +
                                              SqlInt(edSINIESTRO.Recaida, param_bool) + ',' +
                                              SqlValue(fraDomicilioTrab.Calle) + ',' +
                                              SqlValue(fraDomicilioTrab.Numero) + ',' +
                                              SqlValue(fraDomicilioTrab.Piso) + ',' +
                                              SqlValue(fraDomicilioTrab.Departamento) + ',' +
                                              SqlValue(fraDomicilioTrab.CodigoPostal) + ',' +
                                              SqlValue(fraDomicilioTrab.Localidad) + ',' +
                                              SqlValue(fraDomicilioTrab.Prov) + ',' +
                                              SqlValue(fraCIE10.Codigo) + ',' +
                                              SqlValue(fraGravedadCIE10.Codigo) + ',' +
                                              SqlValue(fraGravedad.Codigo) + ',' +
                                              SqlValue(edDIAGNOSTICO.Text) + ',' +
                                              SqlValue(edTelefonoTrab.Text) + ',' +
                                              SqlValue(fraTipoAccidente.codigo) + '); ' +
            'END;';

end;

procedure TfrmWebMigracion.btnAccAceptarClick(Sender: TObject);
  procedure ValidarTipo(ATipo: Integer);
  var
    iSiniestro, iOrden, iRecaida: Integer;
  begin
    if ATipo > 0 then
    begin
      DecodeSiniestro(sdqConsulta.FieldByName('SINIESTRO_COMPLETO').AsString, iSiniestro, iOrden, iRecaida, '/', -1);
      if iSiniestro = -1 then
        raise EInvalidExcept.Create('El registro seleccionado no tiene Siniestro.');

      if ATipo > 1 then
      begin
        if iOrden = -1 then
          raise EInvalidExcept.Create('El registro seleccionado no tiene Orden.');

        if ATipo > 2 then
        begin
          if iRecaida = -1 then
            raise EInvalidExcept.Create('El registro seleccionado no tiene Recaída.');

          if ATipo > 3 then
          begin
            if sdqConsulta.FieldByName('DOC_CARGADO').AsString = 'S' then
              raise EInvalidExcept.Create('El registro seleccionado no tiene el Documento Cargado.');
          end;
        end;
      end;
    end;
  end;

var
  sAccionAnterior: String; ncobertura: integer; requiereObservaciones: boolean;
begin
  if fraCTB_ACWEB.IsEmpty then
    InvalidExcept(fraCTB_ACWEB.edCodigo, 'Debe seleccionar una Acción.');

  ValidarTipo(ArrayPos(fraCTB_ACWEB.Value, ['NO', 'NR', 'SI', 'SA']));

  if (fraCTB_ACWEB.Value = 'NS') and (sdqConsulta.FieldByName('mw_idconexia').asstring <> '') then
  begin
    // Verificación del estado del TRABAJADOR
    nCobertura := ValorSQLIntegerEx('SELECT ART.AFILIACION.CHECK_COBERTURA(:CUIT, :CUIL, :FECHA) FROM DUAL', [sdqConsulta.FieldByName('cuit').value, sdqConsulta.FieldByName('cuil').value, TDateTimeEx.Create(sdqConsulta.FieldByName('fec_sini').value)]);
    if (nCobertura = TRABAJADOR_DE_BAJA) and
       (not MsgAsk(ValorSQLEx('SELECT ART.AFILIACION.MSG_COBERTURA(:CUIT, :CUIL, :FECHA) FROM DUAL',
                              [sdqConsulta.FieldByName('cuit').value, sdqConsulta.FieldByName('cuil').value,
                               TDateTimeEx.Create(sdqConsulta.FieldByName('fec_sini').value)]) + chr(13) + '¿Desea continuar?')) then
      abort;

  end;

  requiereObservaciones := ValorSqlEx('select substr(tb_especial2, 1, 1) from Ctb_Tablas where Tb_Clave=''ACWEB'' and tb_codigo = :codigo', [fraCTB_ACWEB.Codigo]) = 'S';
  Verificar(requiereObservaciones and (edObservaciones.Text = ''), edObservaciones, 'Debe completar una observación para la acción seleccionada');

  if (fraCTB_ACWEB.Codigo = 'NR') and (Is_SiniestroSinAltaReca(sdqConsulta.FieldByName('siniestro').AsInteger, sdqConsulta.FieldByName('orden').AsInteger)) then
    MsgBox('El siniestro posee recaídas anteriores sin alta de Recalificación.');

  sAccionAnterior := sdqConsulta.FieldByName('MW_ACCION').AsString;

  EjecutarStore('WEB.DO_GRABAR_ACCION(' + SqlValue(sdqConsulta.FieldByName('MW_DOCUMENTO').AsString) + ', ' +
                                          SqlValue(sdqConsulta.FieldByName('MW_TRANSACCION').AsString) + ', ' +
                                          SqlValue(fraCTB_ACWEB.Value) + ', ' +
                                          sqlvalue(edobservaciones.text) + ');');

  if (fraCTB_ACWEB.Value = 'NC') and (sAccionAnterior <> 'NC')           // TK 7970
     and (sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'SAS')
     and EsIngresadoPorConexia(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger)
     and MsgAsk('¿Desea enviar un mail de aviso al Prestador?')  then
    DoEnviarAvisoNC_Prestador(sdqConsulta.FieldByName('PRESTADOR').AsString);

  fpAccion.ModalResult := mrOk;
end;

procedure TfrmWebMigracion.tbAccionClick(Sender: TObject);
begin
  fraCTB_ACWEB.Clear;
  edobservaciones.text := '';
  if fpAccion.ShowModal = mrOk then sdqConsulta.Refresh;
end;

procedure TfrmWebMigracion.tbMigracionClick(Sender: TObject);
begin
  if sdqConsulta.Active and MsgAsk('¿Confirma la migración de los registros actuales?') then
  try
    DoLimpiarCantidades;
    with TDataCycler.Create(sdqConsulta) do
    try
      repeat
        if not sdqConsulta.FieldByName('MW_ACCION').IsNull then
        begin
          //aca no se utiliza una transaccion porque dentro de las funciones del paquete web
          //hay commits, deberiamos corregirlo para que quede mas prolijo
          EjecutarStore('WEB.DO_MIGRACION(' + SqlValue(sdqConsulta.FieldByName('MW_DOCUMENTO').AsString) + ', ' +
                                              SqlValue(sdqConsulta.FieldByName('MW_TRANSACCION').AsString) + ', ' +
                                              SqlValue(sdqConsulta.FieldByName('MW_ACCION').AsString) + ', ' +
                                              SqlValue(Sesion.UserId) + ');');
          DoContarAccion(sdqConsulta.FieldByName('MW_ACCION').AsString);
          DoImprimirReporte;
          EjecutarStore('WEB.DO_BORRARTEMPORAL(' + SqlValue(sdqConsulta.FieldByName('MW_DOCUMENTO').AsString) + ', ' +
                                                   SqlValue(sdqConsulta.FieldByName('MW_TRANSACCION').AsString) + ');');
          Inc(iRegistros);
        end;
      until not Cycle;
    finally
      Free;
    end;

    if iRegistros > 0 then
    begin
      DoImprimirResumen;
      EjecutarSql('UPDATE WLT_LOG_TRANSACCION_WEB ' +
                     'SET LT_RESPUESTAENVIADA = ''S'' ' +
                   'WHERE LT_RESPUESTAENVIADA = ''N'' ');
    end;

    MsgBoxFmt('Registros porcesados: %d', [iRegistros]);
    sdqConsulta.Refresh;
  except
    on E:Exception do
      ErrorMsg(E, 'Error al intentar realizar la migración');
  end;
end;

procedure TfrmWebMigracion.DoImprimirResumen;
var
  sSql: String;
begin

  sSql := 'SELECT ''TRANSACCIONES PROCESADAS'' TITULO, '''' SUBTITULO, ' + SqlValue(iRegistros) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT '''' TITULO, ''Denuncia de Siniestros'' SUBTITULO, ' + SqlValue(iDenuncias) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT '''' TITULO, ''Parte Médico de Egreso'' SUBTITULO, ' + SqlValue(iPME) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT '''' TITULO, ''Parte Médico de Ingreso'' SUBTITULO, ' + SqlValue(iPMI) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT '''' TITULO, ''Parte Evolutivo'' SUBTITULO, ' + SqlValue(iPMI) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT '''' TITULO, ''Solicitud de Asistencia'' SUBTITULO, ' + SqlValue(iSAS) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT ''SINIESTROS / RECAIDAS ABIERTOS'', '''', ' + SqlValue(iNSini + iNOrden + iNRecaida) + ' VALOR ' +
            'FROM DUAL ' +
          ' UNION ALL ' +
          'SELECT ''PARTES CARGADOS'', '''', ' + SqlValue(iNSini + iNOrden + iNRecaida + iSinExistente) + ' VALOR ' +
            'FROM DUAL ';

  if PrintDialog.Execute then
  begin
    OpenQuery(sdqReporte, sSql);
    qpReporte.DataSource := dsReporte;
    try
      qpReporte.Print;
    finally
      qpReporte.DataSource := Nil;
    end;

  end;
end;

procedure TfrmWebMigracion.qpReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                                  var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;

  if not sdqReporte.FieldByName('TITULO').IsNull then
  begin
    ABackground := $00D8D8D8;
    if Field.DataField = 'VALOR' Then
      AText := '';
  end;
end;

procedure TfrmWebMigracion.CreateSql;
begin
  Sql := TSql.Create;
end;

procedure TfrmWebMigracion.DoImprimirReporte;
begin
  if sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'DEN' then
  begin
    ImprimirDenunciaWeb(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger);
    Inc(iDenuncias);
  end
  else if sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'PMI' then
  begin
    ImprimirParteMedicoIngreso(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger);
    Inc(iPMI);
  end
  else if sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'PME' then
  begin
    ImprimirParteMedicoEgreso(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger);
    Inc(iPME);
  end
  else if sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'PEV' then
  begin
    ImprimirParteEvolutivo(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger);
    Inc(iPEV);
  end
  else if sdqConsulta.FieldByName('MW_DOCUMENTO').AsString = 'SAS' then
  begin
    ImprimirSolicitudAsistencia(sdqConsulta.FieldByName('MW_TRANSACCION').AsInteger, sdqConsulta.FieldByName('EX_ID').AsInteger);
    Inc(iSAS);
  end;
end;

procedure TfrmWebMigracion.DoLimpiarCantidades;
begin
  iRegistros    := 0;
  iDenuncias    := 0;
  iPMI          := 0;
  iPME          := 0;
  iPEV          := 0;
  iSAS          := 0;
  iNSini        := 0;
  iNOrden       := 0;
  iNRecaida     := 0;
  iSinAccion    := 0;
  iSinExistente := 0;
end;

procedure TfrmWebMigracion.DoContarAccion(sAccion :String);
begin
  if (sAccion = 'NS') then
    Inc(iNSini)
  else if (sAccion = 'NO') then
    Inc(iNOrden)
  else if (sAccion = 'NR') then
    Inc(iNRecaida)
  else if (sAccion = 'SA') then
    Inc(iSinAccion)
  else if (sAccion = 'SI') then
    Inc(iSinExistente);
end;

procedure TfrmWebMigracion.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  clearcontrols;
end;

// El timer fue colocado para que al cargar el formpanel el combo de Cuil se despliegue luego de aparecer la pantalla. 01/09/2008
procedure TfrmWebMigracion.TimerTimer(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
  fraCUIL.CUIL := sdqConsulta.FieldByName('CUIL').AsString;
  Timer.Enabled := False;
end;

procedure TfrmWebMigracion.DoCargarComboTipoAcc;
begin
 { cmbTipoAccABM.Items.Clear;
  with cmbTipoAccABM.Items do
  begin
    Add(ACCTRAB);
    Add(INITIN);
    Add(ENFPROF);    
    if (sdqConsulta.FieldByName('PARTE').AsString = 'Denuncia de Siniestros') then
      Add(RECAIDA);
  end;  }
  fraTipoAccidente.Clear;
  fraTipoAccidente.Codigo := GetTipoAcc(sdqConsulta.FieldByName('mw_tipo').AsString);
  fraTipoAccidente.Refresh;
end;

procedure TfrmWebMigracion.tbModificarClick(Sender: TObject);
begin
  DoCargarComboTipoAcc;
  inherited;
end;

function TfrmWebMigracion.GetTipoAcc(sTextTipoAcc: String): String;
begin
  if sTextTipoAcc = ACCTRAB then
    Result := '1'
  else if sTextTipoAcc = INITIN then
    Result := '2'
  else if sTextTipoAcc = ENFPROF then
    Result := '3'
  else
    Result := '';
end;

procedure TfrmWebMigracion.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmWebMigracion.DoEnviarAvisoNC_Prestador(sIdPrestador: String);  // TK 7970
var
  sIdEjecutable, sBody, sEMailPrestador, observaciones: string;
begin
  Try
    sIdEjecutable := ValorSql('SELECT ej_id FROM comunes.cej_ejecutable ' +
                               'WHERE UPPER(ej_proyecto) = ''REDPRES'' ' +
                                ' AND ej_fechabaja IS NULL');

    observaciones := IIF (MidStr(fraCTB_ACWEB.Especial2, 1, 1) = 'S', 'Motivo: ' + edObservaciones.Text + #13#10, '');

    sBody := 'No corresponde apertura del siguiente siniestro: ' + #13#10 + #13#10 +
             'Trabajador: ' + sdqConsulta.fieldByName('TRABAJADOR').AsString + #13#10 +
             'Cuil: ' + sdqConsulta.fieldByName('CUIL').AsString + #13#10 +
             'Fecha Siniestro: ' + sdqConsulta.fieldByName('FEC_SINI').AsString + #13#10 + #13#10 +
             observaciones +
             'Para mas informacion comunicarse con Sabrina Palazzo (spalazzo@provart.com.ar) o ' +    // TK 43249 reemplazo de leyendas
             'Veronica Manenti (vmanenti@provart.com.ar) al teléfono (011) 3753-5519.' +
             #13#10 + #13#10 + 'Mesa de Ingresos' +
             #13#10 + 'Gerencia de Prestaciones y Servicios' +
             #13#10 + 'Provincia ART';

    sEMailPrestador := ValorSqlEx('SELECT ca_direlectronica FROM cpr_prestador ' +
                                  ' WHERE ca_identificador = :IdPrest ', [sIdPrestador]);

    if (sEMailPrestador <> '') then
      EnviarMailBD(sEMailPrestador,'Siniestro No Corresponde - Provincia ART', [], sBody )
    else
      MsgBox('No se ha podido enviar el mail: El Prestador no posee Dirección electrónica cargada.', MB_ICONEXCLAMATION);

  Except
    on E: Exception do
    begin
      MsgBox('Ha ocurrido un error al intentar enviar el Mail: ' + E.Message );
    end;
  end;
end;

function TfrmWebMigracion.EsIngresadoPorConexia(iNroTransaccion: Integer): boolean;   // por TK 7970
var
  sSql: string;
begin
  sSql := 'SELECT aw_idconexia FROM tmp_ssaw_solicitudasistencia ' +
          ' WHERE aw_transaccion = :transac';
  Result := (ValorSqlEx(sSql, [iNroTransaccion]) <> '');
end;

procedure TfrmWebMigracion.fraCTB_ACWEBExit(Sender: TObject);
begin
  fraCTB_ACWEB.FrameExit(Sender);
end;

procedure TfrmWebMigracion.fraACWEBChange(Sender: TObject);
var
  requiereObservaciones: boolean;
begin
  inherited;
  edObservaciones.Clear;
  requiereObservaciones := MidStr(fraCTB_ACWEB.Especial2, 1, 1) = 'S';
  vclextra.LockControl(edObservaciones, not requiereObservaciones);

end;

procedure TfrmWebMigracion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('cargacolonia').AsString = 'S' then
    AFont.Color := clBlue
  else if (sdqconsulta.FieldByName('empresa_terce').AsString = 'S') then  // Pongo "else" para que no se pise con el anterior y darle prioridad al mismo  // TK 57263
    AFont.Color := clGreen;
end;

end.
