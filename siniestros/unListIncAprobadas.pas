unit unListIncAprobadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, StdCtrls, Buttons, Mask, ToolEdit, DateComboBox,
  QRCtrls, Db, SDEngine, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCtbTablas, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo, unFraTrabajador, unArtDbFrame, unFraEmpresa,
  RxToolEdit, CustomDlgs, unArt, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmListIncAprobadas = class(TForm)
    gbFAprobacion: TGroupBox;
    dcFecAccDesde: TDateComboBox;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    ScrollBox1: TScrollBox;
    qrIncApro: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    sdqInca: TSDQuery;
    dsInca: TDataSource;
    qrdbSiniestro: TQRDBText;
    qrdbOrden: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdbEmpresa: TQRDBText;
    QRLabel5: TQRLabel;
    qrlTipo: TQRLabel;
    sdqIncaEX_SINIESTRO: TFloatField;
    sdqIncaEX_ORDEN: TFloatField;
    sdqIncaTJ_NOMBRE: TStringField;
    sdqIncaEX_DIAGNOSTICOOMS: TStringField;
    sdqIncaINFOINCA: TStringField;
    QRLabel6: TQRLabel;
    qrlFecha: TQRLabel;
    QRLabel7: TQRLabel;
    qrlPorcent: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTotal: TQRLabel;
    QRShape2: TQRShape;
    gbTipoAccidente: TGroupBox;
    cmbTipoAccidente: TDBCheckCombo;
    sdqTipoAccidente: TSDQuery;
    dsTipoAccidente: TDataSource;
    qrlSumPorcent: TQRLabel;
    sdqIncaEV_PORCINCAPACIDAD: TFloatField;
    QRLabel10: TQRLabel;
    sdqIncaJUICIOSPD: TStringField;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    sdqIncaEXTENSIONILT: TStringField;
    gbEmpresa: TGroupBox;
    gbTrabajador: TGroupBox;
    dcFecAccHasta: TDateComboBox;
    lblFechas: TLabel;
    gbTipoEmpresa: TGroupBox;
    rbSuss: TRadioButton;
    rbNoSuss: TRadioButton;
    rbSussTodas: TRadioButton;
    GroupBox1: TGroupBox;
    rbExt_Si: TRadioButton;
    rbExt_No: TRadioButton;
    rbExt_Todos: TRadioButton;
    GroupBox2: TGroupBox;
    rbJuicio_Si: TRadioButton;
    rbJuicio_No: TRadioButton;
    rbJuicio_Todos: TRadioButton;
    GroupBox5: TGroupBox;
    dcTipoCon: TDBCheckCombo;
    dsTipoCon: TDataSource;
    sdqTipoCon: TSDQuery;
    GroupBox4: TGroupBox;
    dcConcepto: TDBCheckCombo;
    dsConcepto: TDataSource;
    sdqIncaEM_NOMBRE: TStringField;
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajador;
    ToolBar: TToolBar;
    tbLimpiar: TToolButton;
    sdqConcepto: TSDQuery;
    qrlSubtitulo: TQRLabel;
    rbSussMixto: TRadioButton;
    gbSector: TGroupBox;
    cmbSector: TDBCheckCombo;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    sdqIncaEV_FECHARECEPCION: TDateTimeField;
    QRLabel15: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    sdqIncaMEDIACION: TStringField;
    sdqIncaFAUTDICT: TStringField;
    sdqIncaPLURIEMP: TStringField;
    sdqIncaDIAS: TFloatField;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dcTipoConChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    function Validar: boolean;
    procedure OnfraEmpresaChange(Sender: TObject);
   // procedure OnfraTrabajadorChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmListIncAprobadas: TfrmListIncAprobadas;

implementation

uses unDmPrincipal, unPrincipal, AnsiSql, unTercerizadoras, unSesion, General;

{$R *.DFM}

procedure TfrmListIncAprobadas.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sTipo, sInca, sTmp :String;
begin
  qrlFecha.Caption    := '';
  qrlPorcent.Caption  := '';
  qrlTipo.Caption     := '';

  sInca := sdqIncaINFOINCA.AsString;
  if (sInca <> '') then
  begin
    sTmp  := Copy(sInca,22,1);
    if (sTmp = 'P') then
      sTipo := 'Parcial'
    else if (sTmp = 'T') then
      sTipo := 'Total'
    else if (sTmp = 'G') then
      sTipo := 'Gran Invalidez';

    sTmp  := Copy(sInca,23,1);
    if (sTmp = 'P') then
      sTipo := sTipo + ' Provisoria'
    else
      sTipo := sTipo + ' Definitiva';

    qrlTipo.Caption := sTipo;

    if (sTmp ='P') then
      qrlFecha.Caption := Copy(sInca,1,10)
    else
      qrlFecha.Caption := Copy(sInca,11,20);

    qrlPorcent.Caption := Copy(sInca,24,7);
  end;
end;

procedure TfrmListIncAprobadas.btnAceptarClick(Sender: TObject);
var
  sSql, sSqlSum, sFiltros: String;
begin
  if Validar then
  begin
    sFiltros := '';
    sSql := ' SELECT ex_siniestro, ex_orden, tj_nombre, em_nombre, ex_diagnosticooms, ev_porcincapacidad, ' +
                   ' liq.Get_InfoIncapacidad(ev_Siniestro, ev_Orden, ev_Fecha+1) InfoInca, art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida, ''T'') JUICIOSPD, ' +
                   ' art.inca.is_extensionilt(ex_id) ExtensionILT, ev_fecharecepcion, art.SIN.get_listanrosmediacionesexp (ex_id) mediacion, ' +
                   ' art.inca.get_fechaautorizado(ev_idevento) fautdict, ex_pluriempleo pluriemp, ' +
                   ' decode(art.inca.get_fechaautorizado (ev_idevento), '''', trunc(sysdate), to_date(art.inca.get_fechaautorizado (ev_idevento), ''dd/mm/yyyy'')) - to_date(ev_fecharecepcion, ''dd/mm/yyyy'') dias ' +
            '  FROM CTJ_TRABAJADOR, AEM_EMPRESA, ART.SEX_EXPEDIENTES, ART.SEV_EVENTOSDETRAMITE, SIN.SEI_EVENTOINCAPACIDAD' +
            ' WHERE EX_SINIESTRO = EV_SINIESTRO' +
            '   AND EX_ORDEN = EV_ORDEN' +
            '   AND EX_RECAIDA = 0' +
            '   AND EV_EVENTO > 0' +
            '   AND EV_CODIGO = EI_CODIGO' +
            '   AND EI_AUTORIZA = ''S''' +
            '   AND EV_FECHA between ' + SqlDate(dcFecAccDesde.Date) + ' and ' + SqlDate(dcFecAccHasta.Date) +  // Condicion de fecha de accidente obligatoria
            '   AND TJ_CUIL = EX_CUIL' +
            '   AND EM_CUIT = EX_CUIT';

    if EsUsuarioDeTercerizadora then
      sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';      // por Plan ioma (tercerizadoras)

    if not fraEmpresa.IsEmpty then
    begin
      sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);
      sFiltros := sFiltros + ' - Empresa: ' + fraEmpresa.NombreEmpresa;
    end;

    if not fraTrabajador.IsEmpty then
    begin
      sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);
      sFiltros := sFiltros + ' - Trabajador: ' + fraTrabajador.Nombre;
    end;

    if (cmbTipoAccidente.Text <> '') then
    begin
      sSql := sSql + ' AND ex_tipo ' + cmbTipoAccidente.InSql;
      sFiltros := sFiltros + ' - Tipo Acc: ' + cmbTipoAccidente.Text;
    end;

    if (cmbSector.InSql <> '') then
    begin
      sSql := sSql + ' AND NVL(em_sector, '''') ' +  cmbSector.InSql;
      sFiltros := sFiltros + ' - Sector: ' + cmbSector.Text;
    end;

    // Extensión ILT
    if rbExt_Si.Checked then
      sSql     := sSql + ' AND art.inca.is_extensionilt(ex_id) = ''S'' '
    else if rbExt_No.Checked then
      sSql := sSql + ' AND art.inca.is_extensionilt(ex_id) = ''N'' ';

    sFiltros := sFiltros + ' - Extensión ILT: ' + IIF(rbExt_Si.Checked, 'Sí', IIF(rbExt_No.Checked, 'No', 'Todos'));

    // Juicio
    if rbJuicio_Si.Checked then
      sSql := sSql + ' AND art.sin.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) is not null '
    else if rbJuicio_No.Checked then
      sSql := sSql + ' AND art.sin.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) is null ';

    sFiltros := sFiltros + ' - Juicio: ' + IIF(rbJuicio_Si.Checked, 'Sí', IIF(rbJuicio_No.Checked, 'No', 'Todos'));

    // Tipo Empresa (Suss..)
    if rbSuss.Checked then
      sSql := sSql + ' AND em_suss = 1 '
    else if rbNoSuss.Checked then
      sSql := sSql + ' AND em_suss = 2 '
    else if rbSussMixto.Checked then
      sSql := sSql + ' AND em_suss = 3 ';


    sFiltros := sFiltros + ' - Tipo Empresa: ' + IIF(rbSuss.Checked, 'SUSS', IIF(rbNoSuss.Checked, 'No SUSS', IIF(rbSussMixto.Checked, 'Mixto', 'Todas')));

    // Tipo Incapacidad
    if (dcConcepto.InSql <> '') then
      sSql := sSql + ' AND exists (SELECT 1 ' +                         // puede tener varias liquidaciones con ese conpago o con varios conpagos
                                   ' FROM art.sle_liquiempsin ' +
                                  ' WHERE le_siniestro = ex_siniestro ' +
                                    ' AND le_orden = ex_orden ' +
                                    ' AND le_recaida = ex_recaida ' +
                                    ' AND le_conpago ' + dcConcepto.InSql + ')'
    else if (dcTipoCon.InSql <> '') then
      sSql := sSql + ' AND exists (SELECT 1 ' +
                                   ' FROM art.sle_liquiempsin, art.scp_conpago ' +
                                  ' WHERE le_siniestro = ex_siniestro ' +
                                    ' AND le_orden = ex_orden ' +
                                    ' AND le_recaida = ex_recaida ' +
                                    ' AND le_conpago = cp_conpago ' +
                                    ' AND cp_tipo ' + dcTipoCon.InSql + ')';

    if (dcConcepto.InSql <> '') then
      sFiltros := sFiltros + ' - Concepto: ' + dcconcepto.Text;
    if (dcTipoCon.InSql <> '') then
      sFiltros := sFiltros + ' - Tipo Concepto: ' + dcTipoCon.Text;

    sSql := sSql + ' ORDER BY ex_siniestro';
    sdqInca.Close;
    sdqInca.SQL.Text := sSql;
    sdqInca.Open;
    qrlSubtitulo.Caption := ' F.Acc. Desde ' + dcFecAccDesde.Text + ' Hasta ' + dcFecAccHasta.Text + sFiltros;
    qrlTotal.Caption     := 'Total Aprobaciones: ' + IntToStr(sdqInca.RecordCount);

    // Obtiene la suma de los porcentajes de incapacidad. Lu TK 3950.
    sSqlSum := ' SELECT SUM(ev_porcincapacidad) SUMAPORC ' +
                '  FROM CTJ_TRABAJADOR, CMP_EMPRESAS, ART.SEX_EXPEDIENTES, ART.SEV_EVENTOSDETRAMITE, SIN.SEI_EVENTOINCAPACIDAD' +
                ' WHERE EX_SINIESTRO = EV_SINIESTRO' +
                '   AND EX_ORDEN = EV_ORDEN' +
                '   AND EX_RECAIDA = 0' +
                '   AND EV_EVENTO > 0' +
                '   AND EV_CODIGO = EI_CODIGO' +
                '   AND EI_AUTORIZA = ''S''' +
                '   AND EV_FECHA between ' + SqlDate(dcFecAccDesde.Date) + ' and ' + SqlDate(dcFecAccHasta.Date) +  // Condicion de fecha de accidente obligatoria
                '   AND TJ_CUIL = EX_CUIL' +
                '   AND MP_CUIT = EX_CUIT';

    if (cmbTipoAccidente.Text <> '') then
      sSqlSum := sSqlSum + ' AND ex_tipo ' + cmbTipoAccidente.InSql;
    with GetQuery(sSqlSum) do
    try
      qrlSumPorcent.Caption := FieldByName('SUMAPORC').AsString;
    finally
      free;
    end;

    qrIncApro.PreviewModal;
  end;
end;

procedure TfrmListIncAprobadas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListIncAprobadas.dcTipoConChange(Sender: TObject);
var
  sWhere: String;
begin
  sWhere := IIF(dcTipoCon.InSql <> '', ' WHERE cp_tipo ' + dcTipoCon.InSql, '');
  with sdqConcepto do
  begin
    Close;
    SQL.Text := ' SELECT cp_conpago, cp_denpago ' +
                  ' FROM art.scp_conpago ' + sWhere +
              ' ORDER BY cp_denpago ';
    Open;
 end;
 inherited;
end;

procedure TfrmListIncAprobadas.FormCreate(Sender: TObject);
begin
  dcFecAccDesde.MaxDate := Date;
  dcFecAccHasta.MaxDate := Date;
  sdqTipoAccidente.Open;

  with fraEmpresa do
  begin
    OnChange  := OnfraEmpresaChange;
    ShowBajas := True;
  end;

  with fraTrabajador do
  begin
   // OnChange  := OnfraTrabajadorChange;
    ShowBajas := True;
  end;

end;

procedure TfrmListIncAprobadas.OnfraEmpresaChange(Sender: TObject);
begin
  if Assigned(Sender) then { Si no fue llamado desde FraTrabajadorChange }
    fraTrabajador.Contrato := fraEmpresa.Contrato;
end;

{procedure TfrmListIncAprobadas.OnfraTrabajadorChange(Sender: TObject);
begin
//
end; }

procedure TfrmListIncAprobadas.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  dcFecAccDesde.Clear;
  dcFecAccHasta.Clear;
  cmbTipoAccidente.Clear;
  rbExt_Todos.Checked    := True;
  rbJuicio_Todos.Checked := True;
  rbSussTodas.Checked    := True;
  dcTipoCon.Clear;
  dcConcepto.Clear;
  cmbSector.Clear;
end;

function TfrmListIncAprobadas.Validar: boolean;
begin
  Verificar((dcFecAccDesde.date = 0) or (dcFecAccHasta.date = 0), lblFechas, 'Debe completar las dos fechas Desde - Hasta');

  Result := True;
  //
end;

procedure TfrmListIncAprobadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuListIncAprobadas.Enabled := True;
  Action := caFree;
end;

end.
