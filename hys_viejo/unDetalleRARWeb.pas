unit unDetalleRARWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Data.DB, SDEngine,
  unfraEstablecimientoDomic, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox,
  ArtDBGrid, Vcl.ImgList, XPMenu, RxPlacemnt, Vcl.ComCtrls, Vcl.ToolWin,
  ToolPanels, Vcl.ExtCtrls, unFraCodigoDescripcion, unFraCodDesc, unfraCtbTablas,
  FormPanel;

type
  TfrmDetalleRARWeb = class(TfrmCustomForm)
    Grid: TArtDBGrid;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    Panel1: TPanel;
    btnProcesar: TButton;
    btnRechazar: TButton;
    pnlBottom: TPanel;
    AdvToolPanelTab: TAdvToolPanelTab;
    AdvToolPanelAdjuntos: TAdvToolPanel;
    dbgESOP: TArtDBGrid;
    tsDatos: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    fraEstableci: TfraEstablecimientoDomic;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edTipoNomina: TEdit;
    fraActividad: TfraCodigoDescripcion;
    edDescripcionEstab: TMemo;
    edTipoEstab: TEdit;
    TabSheet3: TTabSheet;
    tsResponsables: TPageControl;
    HYS: TTabSheet;
    Empresa: TTabSheet;
    Contacto: TTabSheet;
    edApellidoRespHYS: TEdit;
    edNombreRespHYS: TEdit;
    fraCargoRespHYS: TfraCtbTablas;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edEmailRespHYS: TEdit;
    lbeMail: TLabel;
    edCodAreaRespHYS: TEdit;
    Label9: TLabel;
    edTelefonoRespHYS: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edInternoRespHYS: TEdit;
    cbPrincipalRespHYS: TCheckBox;
    fraTipoTelefonoRespHYS: TfraCodDesc;
    lbTipoTelefono: TLabel;
    Label12: TLabel;
    edTipoDocumentoRespHYS: TEdit;
    Label13: TLabel;
    edDocumentoRespHYS: TEdit;
    Label14: TLabel;
    edSexoRespHYS: TEdit;
    Label15: TLabel;
    edObservacionRespHYS: TMemo;
    edApellidoRespEmpresa: TEdit;
    edNombreRespEmpresa: TEdit;
    fraCargoRespEmpresa: TfraCtbTablas;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edEmailRespEmpresa: TEdit;
    Label19: TLabel;
    edCodAreaRespEmpresa: TEdit;
    Label20: TLabel;
    edTelefonoRespEmpresa: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edInternoRespEmpresa: TEdit;
    cbPrincipalRespEmpresa: TCheckBox;
    fraTipoTelRespEmpresa: TfraCodDesc;
    Label23: TLabel;
    Label24: TLabel;
    edTipoDocRespEmpresa: TEdit;
    Label25: TLabel;
    edDocumentoRespEmpresa: TEdit;
    Label26: TLabel;
    edSexoRespEmpresa: TEdit;
    Label27: TLabel;
    edObservacionRespEmpresa: TMemo;
    edApellidoContacto: TEdit;
    edNombreContacto: TEdit;
    fraCargoContacto: TfraCtbTablas;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edEmailContacto: TEdit;
    Label31: TLabel;
    edCodAreaContacto: TEdit;
    Label32: TLabel;
    edTelefonoContacto: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    edInternoContacto: TEdit;
    cbPrincipalContacto: TCheckBox;
    fraTipoTelContacto: TfraCodDesc;
    Label35: TLabel;
    Label36: TLabel;
    edTipoDocContacto: TEdit;
    Label37: TLabel;
    edDocumentoContacto: TEdit;
    Label38: TLabel;
    edSexoContacto: TEdit;
    Label39: TLabel;
    edObservacionContacto: TMemo;
    sdqEsop: TSDQuery;
    dsEsop: TDataSource;
    fraEmpresa: TfraEmpresa;
    fpMotivoRechazo: TFormPanel;
    Bevel5: TBevel;
    Label49: TLabel;
    btnAceptarCambioTipoPrev: TButton;
    btnCancelarCambioTipoPrev: TButton;
    fraMotivoRechazo: TfraCodigoDescripcion;
    Label40: TLabel;
    edObservacionRechazo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnRechazarClick(Sender: TObject);
    procedure btnAceptarCambioTipoPrevClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    FIDCabecera    : Integer;
    FSinExpuesto   : Boolean;
    procedure OnEmpresaFiltroChange(Sender: TObject);
    procedure CargarDatosEmpresaActividad(iIdCabecera: Integer);
    procedure CargarDatosResponsable(iIdCabecera: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure Load(iIdCabecera: Integer);
  end;

var
  frmDetalleRARWeb: TfrmDetalleRARWeb;


implementation

{$R *.dfm}

uses
  AnsiSql, unDmPrincipal, VclExtra, CustomDlgs, unMoldeEnvioMail, unSesion, unComunesFet, unComunes;


procedure TfrmDetalleRARWeb.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.OnChange       := OnEmpresaFiltroChange;
  fraEmpresa.ShowBajas      := True;
  fraEmpresa.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';
  fraEstableci.ShowBajas := True;
  fraCargoRespHYS.Clave     := 'CARGO';
  fraCargoRespEmpresa.Clave := 'CARGO';
  fraCargoContacto.Clave    := 'CARGO';
  with fraActividad do
  begin
    TableName   := 'CAC_ACTIVIDAD';
    FieldID     := 'AC_ID';
    FieldCodigo := 'AC_CODIGO';
    FieldDesc   := 'AC_DESCRIPCION';
    ShowBajas   := True;
  end;
  with fraMotivoRechazo do
  begin
    TableName   := 'HYS.HMR_MOTIVORECHAZONOMINA';
    FieldID     := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldDesc   := 'MR_DESCRIPCION';
    ShowBajas   := True;
  end;

  tsDatos.ActivePageIndex := 0;
  tsResponsables.ActivePageIndex := 0;
  VclExtra.LockControls([fraEmpresa, fraEstableci, edTipoEstab, edTipoNomina, fraActividad, edDescripcionEstab,
                         edNombreRespHYS, edApellidoRespHYS, fraCargoRespHYS, edCodAreaRespHYS, edTelefonoRespHYS, edInternoRespHYS,
                         fraTipoTelefonoRespHYS, cbPrincipalRespHYS, edTipoDocumentoRespHYS, edSexoRespHYS, edEmailRespHYS,edObservacionRespHYS,
                         edNombreRespEmpresa, edApellidoRespEmpresa, fraCargoRespEmpresa, edCodAreaRespEmpresa, edTelefonoRespEmpresa, edInternoRespEmpresa,
                         fraTipoTelRespEmpresa, cbPrincipalRespEmpresa, edTipoDocRespEmpresa, edSexoRespEmpresa, edEmailRespEmpresa,edObservacionRespEmpresa,
                         edNombreContacto, edApellidoContacto, fraCargoContacto, edCodAreaContacto, edTelefonoContacto, edInternoContacto,
                         fraTipoTelContacto, cbPrincipalContacto, edTipoDocContacto, edSexoContacto, edEmailContacto,edObservacionContacto,
                         edDocumentoRespHYS,edDocumentoRespEmpresa,edDocumentoContacto
                          ],True);
end;

procedure TfrmDetalleRARWeb.OnEmpresaFiltroChange(Sender: TObject);
begin
  fraEstableci.CUIT := fraEmpresa.mskCUIT.Text;
end;

procedure TfrmDetalleRARWeb.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqEsop.Close;
  sdqEsop.ParamByName('iddetallenomina').Value := sdqConsulta.FieldByName('DW_ID').AsInteger;
  sdqEsop.Open;
end;

procedure TfrmDetalleRARWeb.Load(iIdCabecera : Integer);
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('idestablecimientoweb').Value := iIdCabecera;
  sdqConsulta.Open;
  FIDCabecera := iIdCabecera;
  CargarDatosEmpresaActividad(iIdCabecera);
  CargarDatosResponsable(iIdCabecera);
  VclExtra.LockControls([btnProcesar,btnRechazar],ExisteSql('SELECT 1 FROM hys.hew_establecimientoweb '+
                                               ' WHERE ew_id = '+SqlValue(FIDCabecera)+
                                               '   AND EW_ESTADO in (''R'',''T'') '));
end;

procedure TfrmDetalleRARWeb.btnAceptarCambioTipoPrevClick(Sender: TObject);
begin
  Verificar(not fraMotivoRechazo.IsSelected, fraMotivoRechazo, 'Debe seleccionar el motivo de rechazo.');
  fpMotivoRechazo.ModalResult := mrOk;
end;

procedure TfrmDetalleRARWeb.btnProcesarClick(Sender: TObject);
var
  IdCabeceraNomina : Integer;
  FAsunto,
  FBody,
  FListaMail: String;
  conSemestral : Boolean;
  FFechaRelev, ultrelev: TDate;
  FCUIT : STRING;
  FNroEstableci : Integer;
  iIDEmpresa    : Integer;
begin
  BeginTrans(True);
  if not(FSinExpuesto) then
  begin
    with GetQuery('SELECT ew_cuit, '+
                  '       dw_cuil, '+
                  '       dw_nombre, '+
                  '       TRUNC (ew_fechaalta) frelev, '+
                  '       dw_fechaingreso, '+
                  '       ew_estableci, '+
                  '       dw_sectortrab, '+
                  '       dw_puestotrab'+
                  '  FROM hys.hdw_detallenominaweb, '+
                  '       hys.hcw_cabeceranominaweb, '+
                  '       hys.hew_establecimientoweb '+
                  ' WHERE ew_id = cw_idestablecimientoweb '+
                  '   AND cw_id = dw_idcabeceranomina '+
                  '   AND ew_fechabaja IS NULL '+
                  '   AND cw_fechabaja IS NULL '+
                  '   AND dw_fechabaja IS NULL '+
                  '   AND ew_id = '+SqlValue(FIDCabecera)) do
    try
      while not Eof do
      begin
        EjecutarStoreST(' art.hys.do_actualizarrelaclabexpuestos ('+SqlValue(FieldByName('ew_cuit').AsString)+','+
                                                                    SqlValue(FieldByName('dw_cuil').AsString)+','+
                                                                    SqlValue(FieldByName('dw_nombre').AsString)+','+
                                                                    SqlValue(FieldByName('frelev').AsDateTime)+','+
                                                                    SqlValue(FieldByName('dw_fechaingreso').AsDateTime)+','+
                                                                    SqlValue(FieldByName('ew_estableci').AsString)+','+
                                                                    SqlValue(FieldByName('dw_sectortrab').AsString)+','+
                                                                    SqlValue(FieldByName('dw_puestotrab').AsString)+','+
                                                                    SqlValue(Sesion.LoginName)+');');
        Next;
      end;
    finally
      Free;
    end;

    if  ExisteSql( 'SELECT 1 '+
                   '  FROM hys.hdw_detallenominaweb, '+
                   '       hys.hcw_cabeceranominaweb, '+
                   '       hys.hew_establecimientoweb '+
                   ' WHERE ew_id = cw_idestablecimientoweb '+
                   '   AND cw_id = dw_idcabeceranomina '+
                   '   AND ew_fechabaja IS NULL '+
                   '   AND cw_fechabaja IS NULL '+
                   '   AND dw_fechabaja IS NULL '+
                   '   AND ew_id = '+SqlValue(FIDCabecera)+
                   '   AND afiliacion.check_cobertura (ew_cuit, dw_cuil, TRUNC (ew_fechaalta)) IN '+
                   '                                                             (21, 22, 23, 35) ') then
    begin
      EjecutarSqlST( ' INSERT INTO hys.hir_importacionrechazada '+
                     '             (ir_id, ir_cuit, ir_estableci, ir_cuil, ir_nombre, ir_fechainicio, '+
                     '              ir_fechaingreso, ir_tarea, ir_sector, ir_usualta, ir_fechaalta, '+
                     '              ir_fecharelev) '+
                     '      SELECT hys.seq_hir_id.NEXTVAL, ew_cuit, ew_estableci, dw_cuil, dw_nombre, '+
                     '             fechainicio, fechaingreso, puestotrab, dw_sectortrab, '+
                                   SqlValue(Sesion.UserID)+' , SYSDATE, fecharelev '+
                     '        FROM (SELECT DISTINCT ew_cuit, ew_estableci, dw_cuil, dw_nombre, '+
                     '                              dw_fechaingreso fechainicio, '+
                     '                              dw_fechaingreso fechaingreso, '+
                     '                              (SELECT pn_descripcion '+
                     '                                 FROM hys.hpn_puestonomina '+
                     '                                WHERE pn_id = dw_puestotrab) puestotrab, '+
                     '                              dw_sectortrab, TRUNC (ew_fechaalta) fecharelev '+
                     '                         FROM hys.hdw_detallenominaweb, '+
                     '                              hys.hcw_cabeceranominaweb, '+
                     '                              hys.hew_establecimientoweb '+
                     '                        WHERE ew_id = cw_idestablecimientoweb '+
                     '                          AND cw_id = dw_idcabeceranomina '+
                     '                          AND ew_fechabaja IS NULL '+
                     '                          AND cw_fechabaja IS NULL '+
                     '                          AND dw_fechabaja IS NULL '+
                     '                          AND ew_id = '+SqlValue(FIDCabecera)+
                     '                          AND afiliacion.check_cobertura (ew_cuit, '+
                     '                                                          dw_cuil, '+
                     '                                                          TRUNC (ew_fechaalta) '+
                     '                                                         ) IN (21, 22, 23, 35)) ');
    end;

    IdCabeceraNomina := ValorSqlInteger(
            ' SELECT cn_id '+
            '   FROM hys.hew_establecimientoweb,hys.hcn_cabeceranomina '+
            '  WHERE cn_cuit = ew_cuit'+
            '    AND cn_estableci = ew_estableci'+
            '    AND CN_FECHARELEVAMIENTO = TRUNC (ew_fechaalta)'+
            '    AND  ew_id = '+SqlValue(FIDCabecera));
    with GetQuery(' SELECT TRUNC (ew_fechaalta) fecharelev, ew_cuit, ew_estableci '+
                  '   FROM hys.hew_establecimientoweb WHERE ew_id = '+SqlValue(FIDCabecera)) do
    try
      FFechaRelev   := FieldByName('fecharelev').AsDateTime;
      FCUIT         := FieldByName('ew_cuit').AsString;
      FNroEstableci := FieldByName('ew_estableci').AsInteger;
    finally
      Free;
    end;

    if IdCabeceraNomina = 0  then
    begin
      IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');

      ActualizarAsignacionLote(IdCabeceraNomina,FFechaRelev, FCUIT, FNroEstableci);
    end
    else
    begin
      if ExisteSqlEx ('SELECT 1 ' +
                      '  FROM hys.hcn_cabeceranomina ' +
                      ' WHERE cn_id = :id ' +
                      '   AND cn_idestado = 1 ',
                      [IdCabeceraNomina]) and
        ExisteSqlEx ('SELECT 1 ' +
                     '  FROM afi.aem_empresa, ' +
                     '       afi.aco_contrato, ' +
                     '       afi.aes_establecimiento, ' +
                     '       hys.hde_descripcionestadolote, ' +
                     '       hys.hrl_relevamientolote, ' +
                     '       hys.hel_estadolote hel ' +
                     ' WHERE em_cuit = :pcuit ' +
                     '   AND em_id = co_idempresa ' +
                     '   AND co_contrato = es_contrato ' +
                     '   AND es_id = rl_idestableci ' +
                     '   AND de_tipoestado = ''A'' ' +
                     '   AND de_codigo = el_estado ' +
                     '   AND rl_nroestableci = :pestableci ' +
                     '   AND rl_id = el_rlid ' +
                     '   AND el_estado NOT IN (''T'', ''L'') ' +
                     '   AND el_operativo <> ''R''',
                          [FCUIT, FNroEstableci]) then
      begin
        FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TNC'));
        if FListaMail <> '' then
        begin
          FAsunto := 'Nuevo trabajador en nómina activa del CUIT ' + FCUIT +
                     '- Estab.' + IntToStr(FNroEstableci);
          FBody := 'Se han incoporado los trabajadores con CUIL '+
                   ValorSql( ' SELECT listagg (dw_cuil, '', '') '+
                             '        WITHIN GROUP (ORDER BY dw_cuil) '+
                             ' FROM   hys.hdw_detallenominaweb, '+
                             '        hys.hcw_cabeceranominaweb, '+
                             '        hys.hew_establecimientoweb '+
                             '  WHERE ew_id = cw_idestablecimientoweb '+
                             '    AND cw_id = dw_idcabeceranomina '+
                             '    AND ew_fechabaja IS NULL '+
                             '    AND cw_fechabaja IS NULL '+
                             '    AND dw_fechabaja IS NULL '+
                             '    AND ew_id = '+SqlValue(IdCabeceraNomina)) +
                   ' en la nómina de referencia con fecha de relevamiento ' + DateToStr(FFechaRelev );

          EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false)
        end
      end
    end;

    EjecutarSqlST(' INSERT INTO art.prt_riestrab '+
                  '             (rt_cuit, rt_id, rt_estableci, rt_fecha, rt_fechainiexpo, '+
                  '             rt_riesgo, rt_cuil, rt_nombre, rt_usualta, rt_fechaalta, '+
                  '             rt_repetido, rt_idrg, RT_SECTOR, RT_PUESTO, RT_IDCABECERANOMINA) '+
                  '   SELECT ew_cuit, ART.SEQ_PRT_ID.nextval, ew_estableci, '+
                  '          TRUNC (ew_fechaalta) fecharelev, dw_fechaingreso, rg_codigo, '+
                  '          dw_cuil, dw_nombre, '+SqlValue(Sesion.UserID)+', SYSDATE, '+
                  '          NVL ((SELECT DISTINCT ''S'' '+
                  '                           FROM art.prt_riestrab prt1 '+
                  '                          WHERE prt1.rt_cuit = ew_cuit '+
                  '                            AND prt1.rt_cuil = dw_cuil '+
                  '                            AND prt1.rt_estableci <> ew_estableci '+
                  '                            AND prt1.rt_fecha = '+
                  '                                   (SELECT MAX (prt2.rt_fecha) '+
                  '                                      FROM art.prt_riestrab prt2 '+
                  '                                     WHERE prt2.rt_cuit = prt1.rt_cuit '+
                  '                                       AND prt2.rt_cuil = prt1.rt_cuil)), '+
                  '               ''N'' '+
                  '              ) repetido, '+
                  '          rg_id, DW_SECTORTRAB, (SELECT pn_descripcion FROM hys.hpn_puestonomina WHERE pn_id = dw_puestotrab),'+SqlValue(IdCabeceraNomina)+
                  '     FROM hys.hdw_detallenominaweb, '+
                  '          hys.hcw_cabeceranominaweb, '+
                  '          hys.hew_establecimientoweb, '+
                  '          hys.hrt_riestrabweb, '+
                  '          art.prg_riesgos '+
                  '    WHERE ew_id = cw_idestablecimientoweb '+
                  '      AND cw_id = dw_idcabeceranomina '+
                  '      AND rt_iddetallenomina = dw_id '+
                  '      AND rt_idriesgo = rg_id '+
                  '      AND ew_fechabaja IS NULL '+
                  '      AND cw_fechabaja IS NULL '+
                  '      AND dw_fechabaja IS NULL '+
                  '      AND rt_fechabaja IS NULL '+
                  '      AND rg_fechabaja IS NULL '+
                  '      AND afiliacion.check_cobertura (ew_cuit, dw_cuil, TRUNC (ew_fechaalta)) not IN '+
                  '                                                             (21, 22, 23, 35) '+
                  '      AND ew_id = '+SqlValue(FIDCabecera));

    // La nómina ya existe, si está activa y tiene algún lote activo asociado,
    // notifica el alta del trabajador a la misma

    conSemestral := ValorSql(
            ' SELECT DISTINCT ''S'' '+
            '   FROM art.aer_estriesg, art.prt_riestrab, hys.hcn_cabeceranomina '+
            '  WHERE rt_riesgo = er_riesgo '+
            '    AND er_fechabaja IS NULL '+
            '    AND cn_cuit = '+SqlValue(FCUIT)+
            '    AND cn_estableci = '+SqlValue(FNroEstableci)+
            '    AND cn_fecharelevamiento = '+SqlValue(FFechaRelev)+
            '    AND cn_id = rt_idcabeceranomina '+
            '   AND er_periodicidad = 6 ') = 'S';

    EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina '+
                  '    SET cn_consemestral = '+SqlBoolean(conSemestral)+','+
                  '        cn_idrelevasociado = '+SqlValue(FIDCabecera)+
                  '  WHERE cn_id = '+SqlValue(IdCabeceraNomina));

    // El trabajador está repetido en otro establecimiento para el mismo operativo
    if ExisteSql(
        ' SELECT DISTINCT ''S'' '+
        '   FROM art.prt_riestrab prt1, '+
        '        hys.hdw_detallenominaweb, '+
        '        hys.hcw_cabeceranominaweb, '+
        '        hys.hew_establecimientoweb '+
        '  WHERE prt1.rt_cuit = ew_cuit '+
        '    AND prt1.rt_cuil = dw_cuil '+
        '    AND prt1.rt_estableci <> ew_estableci '+
        '    AND prt1.rt_fecha = '+
        '           (SELECT MAX (prt2.rt_fecha) '+
        '              FROM art.prt_riestrab prt2 '+
        '             WHERE prt2.rt_cuit = prt1.rt_cuit '+
        '               AND prt2.rt_cuil = prt1.rt_cuil) '+
        '    AND ew_id = cw_idestablecimientoweb '+
        '    AND cw_id = dw_idcabeceranomina '+
        '    AND ew_fechabaja IS NULL '+
        '    AND cw_fechabaja IS NULL '+
        '    AND dw_fechabaja IS NULL '+
        '    AND ew_id = '+SqlValue(IdCabeceraNomina)) then
    begin
      FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TDE'));
      if FListaMail <> '' then
      begin
        FAsunto := 'Trabajador existente con riesgo en otro establecimiento para el último relevamiento.';
        FBody := 'Los trabajadores con CUIL '+
                 ValorSql(' SELECT listagg (dw_cuil, '', '') '+
                          '        WITHIN GROUP (ORDER BY dw_cuil) '+
                          '   FROM art.prt_riestrab prt1, '+
                          '        hys.hdw_detallenominaweb, '+
                          '        hys.hcw_cabeceranominaweb, '+
                          '        hys.hew_establecimientoweb '+
                          '  WHERE prt1.rt_cuit = ew_cuit '+
                          '    AND prt1.rt_cuil = dw_cuil '+
                          '    AND prt1.rt_estableci <> ew_estableci '+
                          '    AND prt1.rt_fecha = '+
                          '           (SELECT MAX (prt2.rt_fecha) '+
                          '              FROM art.prt_riestrab prt2 '+
                          '             WHERE prt2.rt_cuit = prt1.rt_cuit '+
                          '               AND prt2.rt_cuil = prt1.rt_cuil) '+
                          '    AND ew_id = cw_idestablecimientoweb '+
                          '    AND cw_id = dw_idcabeceranomina '+
                          '    AND ew_fechabaja IS NULL '+
                          '    AND cw_fechabaja IS NULL '+
                          '    AND dw_fechabaja IS NULL '+
                          '    AND ew_id = '+SqlValue(IdCabeceraNomina))+
                 ' ya existen con riesgo en otro establecimiento para el último relevamiento.';

        EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false);
      end;
    end;
  end
  else
  begin
    with GetQuery(' SELECT TRUNC (ew_fechaalta) fecharelev, ew_cuit, ew_estableci, em_id '+
                  '   FROM hys.hew_establecimientoweb, afi.aem_empresa WHERE em_cuit = ew_cuit '+
                  '    AND ew_id = '+SqlValue(FIDCabecera)) do
    try
      FFechaRelev   := FieldByName('fecharelev').AsDateTime;
      FCUIT         := FieldByName('ew_cuit').AsString;
      FNroEstableci := FieldByName('ew_estableci').AsInteger;
      iIDEmpresa    := FieldByName('em_id').AsInteger;
    finally
      Free;
    end;
    ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                    '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                    '          FROM hys.hcn_cabeceranomina ' +
                                    '         WHERE cn_cuit = :cuit ' +
                                    '           AND cn_estableci = :estab ' +
                                    '           AND cn_idestado <> 6 ' +
                                    '        UNION ALL ' +
                                    '        SELECT sr_fecha fecha ' +
                                    '          FROM art.psr_sinriesgo ' +
                                    '         WHERE sr_cuit = :cuit ' +
                                    '           AND sr_estableci = :estab'+
                                    '        UNION ALL '+
                                    '        SELECT ir_fecha fecha' +
                                    '          FROM hys.hir_invalidoriesgo '+
                                    '         WHERE ir_cuit = :cuit'+
                                    '           AND ir_estableci = :estab '+
                                    '             AND ir_fechabaja IS NULL ) a ',[FCUIT, FNroEstableci]);

    EjecutarSqlST(' INSERT INTO art.PSR_SINRIESGO '+
                  '             (SR_CUIT, SR_ESTABLECI, SR_FECHA, SR_USUALTA, SR_FECHAALTA, SR_IDRELEVASOCIADOWEB) '+
                  '   SELECT ew_cuit, ew_estableci, TRUNC (ew_fechaalta) fecharelev, '+SqlValue(Sesion.UserID)+', SYSDATE, '+
                             SqlValue(FIDCabecera)+
                  '     FROM hys.hew_establecimientoweb '+
                  '    WHERE ew_id = '+SqlValue(FIDCabecera)+
                  '      AND ew_fechabaja IS NULL ');

    if (ultrelev < FFechaRelev) then
    begin
      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                       '   SET al_idcabrelevamientoactivo = NULL, ' +
                       '       al_usumodif = :pusuario, ' +
                       '       al_fechamodif = SYSDATE ' +
                       ' WHERE al_idempresa = :pidempresa ' +
                       '   AND al_nroestableci = :pnroestableci ',
                       [Sesion.UserID, iIDEmpresa, FNroEstableci]);
      ActualizarUltRelevamiento (FCUIT, FNroEstableci, FFechaRelev, 'S');
    end;
  end;
  ActualizarRelevamientos(FCUIT, FNroEstableci);
  EjecutarSqlST('UPDATE hys.hew_establecimientoweb '+
                  '   SET EW_ESTADO = ''T'', '+
                  '       EW_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                  '       EW_IDMOTIVORECHAZO = '+SqlValue(fraMotivoRechazo.Value)+', '+
                  '       EW_FECHAMODIF = SYSDATE '+
                  ' WHERE ew_id = '+SqlValue(FIDCabecera));
  CommitTrans(True);
  ModalResult := mrOk;
end;

procedure TfrmDetalleRARWeb.btnRechazarClick(Sender: TObject);
var
  sMailResp, sMailContacto, diaHoy :String;
begin
  inherited;
  fraMotivoRechazo.Clear;
  edObservacionRechazo.Clear;
  if fpMotivoRechazo.ShowModal = mrok then
  begin
    with TfrmMoldeEnvioMail.Create(Self) do
    begin
      FormStyle := fsNormal;
      Visible := False;
      Opciones := [oAlwaysShowDialog];
      if sMailResp <> '' then
      begin
        edDestinatario.Text := sMailResp;
        btAgregarDestinatarioClick(nil);
      end;
      if sMailContacto <> '' then
      begin
        edDestinatario.Text := sMailContacto;
        btAgregarDestinatarioClick(nil);
      end;
      edAsunto.Text := 'RAR No Recepcionado';

      diaHoy := ValorSql(' SELECT TO_CHAR (SYSDATE, ''DD'') '+
                         '        || '' de '' || TO_CHAR (SYSDATE, ''Month'') '+
                         '        || ''de '' || TO_CHAR (SYSDATE, ''YYYY'') '+
                         '   FROM DUAL ');

      reTextoCuerpo.Lines.Add(
        '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
        '\viewkind4\uc1\pard\qr\cf1\f0\fs18\par'+
        '\cf0 Ciudad Aut\''f3noma de Buenos Aires, '+diaHoy+'\cf1\par '+
        '\pard Estimado cliente:\par '+
        '\par '+
        '\pard\qj Ref.: \b\fs19 No corresponden ESOP con actividad declarada y/o el formulario presentado est\''e1 '+
        'incorrectamente confeccionado seg\''fan los datos consignados en el formulario de Resoluci\''f3n SRT 37/2010.\par '+
        '\par\par '+
        '\pard\sa160\sl252\slmult1\qj\cf0\b0\fs18 Por medio de la presente informamos que el formulario presentado esta '+
        'incorrectamente confeccionado por falta de datos o porque los ESOP declarados no se condicen con los sugeridos para '+
        'la actividad desarrollada por Ud. \par '+
        'En caso de querer avalar los ESOP declarados le solicitamos que env\''ede la documentaci\''f3n respaldatoria (mediciones '+
        'correspondientes), de lo contrario deber\''e1 presentar un nuevo formulario.\par '+
        'A continuaci\''f3n le detallaremos las inconsistencias del presentado:\par '+
        '\pard\sa160\sl252\slmult1\i\par '+
        // COMPLETAR
        '\pard\fs20\b '+fraEstableci.cmbDescripcion.Text+' - '+ fraMotivoRechazo.Descripcion+' \b0\par '+
        ' - No corresponde ESOP con actividad declarada por empresa.\par '+
        '- Formulario inv\''e1lido (corresponde a datos de firma, faltan datos de la empresa)]\par '+
        '\pard\sa160\sl252\slmult1\i0\fs18\par '+
        '\pard\sa160\sl252\slmult1\qj Quedamos a la espera de dicha documentaci\''f3n para dar por cumplida la presentaci\''f3n '+
        'seg\''fan la Res. 37/10.\par '+
        '\pard\qj\cf1 Ante cualquier duda o consulta comun\''edquese con el sector por mail a prevencion@provart.com.ar\par '+
        '\pard\sa200\sl276\slmult1\cf0\lang10\f1\fs22\par '+
        ' }');

    if ShowModal = mrOk then
    begin
      EjecutarSql('UPDATE hys.hew_establecimientoweb '+
                  '   SET EW_ESTADO = ''R'', '+
                  '       EW_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                  '       EW_IDMOTIVORECHAZO = '+SqlValue(fraMotivoRechazo.Value)+', '+
                  '       EW_OBSERVACIONESRECHAZO = '+SqlValue(trim(edObservacionRechazo.Lines.Text))+','+
                  '       EW_FECHAMODIF = SYSDATE '+
                  ' WHERE ew_id = '+SqlValue(FIDCabecera));

      if not ExisteSql('SELECT 1 FROM hys.hir_invalidoriesgo, hys.hew_establecimientoweb  '+
                       ' WHERE ir_cuit = ew_cuit '+
                       '   AND ir_estableci = ew_estableci '+
                       '   AND ir_fecha = TRUNC (ew_fechaalta)'+
                       '   AND ew_id = '+SqlValue(FIDCabecera)) then
      begin
        EjecutarSqlST(' INSERT INTO hys.hir_invalidoriesgo '+
                      '            (ir_cuit, ir_estableci, ir_fecha, ir_fechaalta, ir_usualta, ir_id, '+
                      '             ir_idmotivorechazonomina, ir_idestablecimientoweb) '+
                      '   SELECT ew_cuit, ew_estableci, TRUNC (ew_fechaalta), SYSDATE, '+SqlValue(Sesion.UserID)+','+
                                 sqlvalue(GetSecNextVal('HYS.SEQ_HIR_INVRIESGO_ID'))+','+SqlValue(fraMotivoRechazo.value)+', ew_id '+
                      '     FROM hys.hew_establecimientoweb '+
                      '    WHERE ew_id = '+SqlValue(FIDCabecera));
      end;
      //FALTA LA PARTE DE LA DENUNCIA
      {
      if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio '+
                   '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(fraEmpresa.CUIT)+')'+
                   '    AND ne_idtipodenuncia = 2 '+
                   '    AND ne_fechaenvio IS NULL ') then
        EjecutarSqlST(' UPDATE hys.hne_notasdenunciaenvio '+
                      '    SET ne_fechamodif = sysdate, '+
                      '        ne_usumodif = '+SqlValue(Sesion.UserID)+
                      '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(FCUIT)+')'+
                      '    AND ne_idtipodenuncia = 2 '+
                      '    AND ne_fechaenvio IS NULL ')
      else
        EjecutarSqlST('INSERT INTO hys.hne_notasdenunciaenvio (ne_id, ne_contrato, ne_fechaalta, ne_usualta, ne_idtipodenuncia) '+
                        '     VALUES (hys.seq_hne_id.NEXTVAL, art.get_vultcontrato ('+ SqlValue(FCUIT)+'), SYSDATE, '+
                      SqlValue(Sesion.UserID)+',2)');
      FGuardoInvalido := True;
      }

      MsgBox('El RAR web se ha marcado como Rechazado.', MB_OK , 'RAR Web');
    end;
  end;

  end;
end;

procedure TfrmDetalleRARWeb.CargarDatosEmpresaActividad(iIdCabecera : Integer);
begin
  with GetQuery(
          ' SELECT ew_cuit, ew_estableci, '+
          '        DECODE (ew_tipoestab, '+
          '        ''A'', ''Administrativo'', '+
          '        ''CM'', ''Comercio Minorista'', '+
          '        ''OC'', ''Obras en Construcción'', '+
          '        ''V'', ''Vehículo'', '+
          '        ''O'', ''Otros'') tipoestab, '+
          '        DECODE (ew_tiponomina, '+
          '                ''S'', ''Con Expuestos'', '+
          '                ''N'', ''Sin Expuestos'' '+
          '               ) tiponomina, '+
          '        ew_idactividad, ew_descripcionestab,ew_id, '+
          '        ew_tipoestab,ew_tiponomina, ew_idactividad, ew_descripcionestab '+
          '   FROM hys.hew_establecimientoweb '+
          '  WHERE  ew_id = '+SqlValue(iIdCabecera)+
          '    AND ew_fechabaja IS NULL ') do
  try
    fraEmpresa.CUIT := FieldByName('ew_cuit').AsString;
    OnEmpresaFiltroChange(nil);
    fraEstableci.Cargar(fraEmpresa.CUIT,
                          FieldByName('ew_estableci').AsString, false);
    edTipoEstab.Text        := FieldByName('tipoestab').AsString;
    edTipoNomina.Text       := FieldByName('tiponomina').AsString;
    fraActividad.Value      := FieldByName('ew_idactividad').AsInteger;
    edDescripcionEstab.Text := FieldByName('ew_descripcionestab').AsString;
    FSinExpuesto            := FieldByName('ew_tiponomina').AsString = 'N';
  finally
    Free;
  end;
end;

procedure TfrmDetalleRARWeb.CargarDatosResponsable(iIdCabecera : Integer);
begin
  with GetQuery(
    ' SELECT rw_tiporesp, rw_nombre, rw_apellido, rw_cargo, rw_codarea, rw_telefono, '+
    '        rw_tipotelefono, rw_interno, rw_principal, rw_observaciones, rw_email, '+
    '        rw_tipodocumento, rw_numerodocumento, rw_sexo, tb_descripcion '+
    '   FROM hys.hrw_responsablenominaweb, art.ctb_tablas '+
    '  WHERE rw_idrelevnomina = '+SqlValue(iIdCabecera)+
    '    AND tb_clave(+) = ''CARGO'' '+
    '    AND tb_codigo(+) = rw_cargo '+
    '    AND rw_fechabaja IS NULL ') do
  try
    while not Eof do
    begin
      if FieldByName('rw_tiporesp').AsString = 'H' then
      begin
        edNombreRespHYS.Text          := FieldByName('rw_nombre').AsString;
        edApellidoRespHYS.Text        := FieldByName('rw_apellido').AsString;
        fraCargoRespHYS.Codigo        := FieldByName('rw_cargo').AsString;
        edCodAreaRespHYS.Text         := FieldByName('rw_codarea').AsString;
        edTelefonoRespHYS.Text        := FieldByName('rw_telefono').AsString;
        edInternoRespHYS.Text         := FieldByName('rw_interno').AsString;
        fraTipoTelefonoRespHYS.Codigo := FieldByName('rw_tipotelefono').AsString;
        cbPrincipalRespHYS.Checked    := FieldByName('rw_principal').AsString = 'S';
        edTipoDocumentoRespHYS.Text   := FieldByName('rw_tipodocumento').AsString;
        edDocumentoRespHYS.Text       := FieldByName('rw_numerodocumento').AsString;
        edSexoRespHYS.Text            := FieldByName('rw_sexo').AsString;
        edEmailRespHYS.Text           := FieldByName('rw_email').AsString;
        edObservacionRespHYS.Text     := FieldByName('rw_observaciones').AsString;
      end;
      if FieldByName('rw_tiporesp').AsString = 'R' then
      begin
        edNombreRespEmpresa.Text          := FieldByName('rw_nombre').AsString;
        edApellidoRespEmpresa.Text        := FieldByName('rw_apellido').AsString;
        fraCargoRespEmpresa.Codigo        := FieldByName('rw_cargo').AsString;
        edCodAreaRespEmpresa.Text         := FieldByName('rw_codarea').AsString;
        edTelefonoRespEmpresa.Text        := FieldByName('rw_telefono').AsString;
        edInternoRespEmpresa.Text         := FieldByName('rw_interno').AsString;
        fraTipoTelRespEmpresa.Codigo      := FieldByName('rw_tipotelefono').AsString;
        cbPrincipalRespEmpresa.Checked    := FieldByName('rw_principal').AsString = 'S';
        edTipoDocRespEmpresa.Text         := FieldByName('rw_tipodocumento').AsString;
        edDocumentoRespEmpresa.Text       := FieldByName('rw_numerodocumento').AsString;
        edSexoRespEmpresa.Text            := FieldByName('rw_sexo').AsString;
        edEmailRespEmpresa.Text           := FieldByName('rw_email').AsString;
        edObservacionRespEmpresa.Text     := FieldByName('rw_observaciones').AsString;
      end;
      if FieldByName('rw_tiporesp').AsString = 'C' then
      begin
        edNombreContacto.Text          := FieldByName('rw_nombre').AsString;
        edApellidoContacto.Text        := FieldByName('rw_apellido').AsString;
        fraCargoContacto.Codigo        := FieldByName('rw_cargo').AsString;
        edCodAreaContacto.Text         := FieldByName('rw_codarea').AsString;
        edTelefonoContacto.Text        := FieldByName('rw_telefono').AsString;
        edInternoContacto.Text         := FieldByName('rw_interno').AsString;
        fraTipoTelContacto.Codigo      := FieldByName('rw_tipotelefono').AsString;
        cbPrincipalContacto.Checked    := FieldByName('rw_principal').AsString = 'S';
        edTipoDocContacto.Text         := FieldByName('rw_tipodocumento').AsString;
        edDocumentoContacto.Text       := FieldByName('rw_numerodocumento').AsString;
        edSexoContacto.Text            := FieldByName('rw_sexo').AsString;
        edEmailContacto.Text           := FieldByName('rw_email').AsString;
        edObservacionContacto.Text     := FieldByName('rw_observaciones').AsString;
      end;
      Next;
    end;
  finally
    Free;
  end;

end;



end.
