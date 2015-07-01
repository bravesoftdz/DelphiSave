unit unConsultaCotizacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad,
  ToolEdit, DateComboBox, Mask, unFraCodigoDescripcion, unFraUsuario, unFraStaticCTB_TABLAS, FormPanel, unArtDBAwareFrame, PatternEdit, IntEdit, unFraEntidades, unFraCanal, ComboEditor,
  CheckCombo, DBCheckCombo, unFraCodDesc, Menus, JvHint, Math, RxToolEdit, RxPlacemnt;

type
  TfrmConsultaCotizacion = class(TfrmCustomConsulta)
    tbPrevencion: TToolButton;
    tbAprobar: TToolButton;
    tbCerrarCotizacion: TToolButton;
    gbEmpresa: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edCO_CUIT: TMaskEdit;
    edCO_RAZONSOCIAL: TEdit;
    GroupBox1: TGroupBox;
    fraUsuarioAsignado: TfraUsuarios;
    gbTipo: TGroupBox;
    rbAmbos: TRadioButton;
    rbCotizaciones: TRadioButton;
    rbSolicitudes: TRadioButton;
    gbConfeccion: TGroupBox;
    Label7: TLabel;
    cmbCO_FECHACONFECCIONODesde: TDateComboBox;
    cmbCO_FECHACONFECCIONOHasta: TDateComboBox;
    fraCO_IDACTIVIDAD: TfraStaticActividad;
    Label5: TLabel;
    Label6: TLabel;
    gbEstado: TGroupBox;
    tbAsignar: TToolButton;
    fpAsignar: TFormPanel;
    Bevel1: TBevel;
    Label22: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    frafpSC_USUASIGNADO: TfraUsuarios;
    GroupBox4: TGroupBox;
    rbCostoSi: TRadioButton;
    rbCostoNo: TRadioButton;
    rbCostoTodos: TRadioButton;
    fpCierre: TFormPanel;
    Bevel2: TBevel;
    Label39: TLabel;
    btnAceptar3: TButton;
    btnCancelar3: TButton;
    edSC_OBSERVACIONESCIERRE: TMemo;
    tbSolicitudInfo: TToolButton;
    fpMail: TFormPanel;
    Bevel3: TBevel;
    btnEnviarMail: TButton;
    btnCancelarMail: TButton;
    edMail: TMemo;
    Label8: TLabel;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cmbCO_FECHACERRADODesde: TDateComboBox;
    cmbCO_FECHACERRADOHasta: TDateComboBox;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    cmbSC_FECHASOLICITUDDesde: TDateComboBox;
    cmbSC_FECHASOLICITUDHasta: TDateComboBox;
    GroupBox9: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    cmbSC_FECHASUSPDESDE: TDateComboBox;
    cmbSC_FECHASUSPHASTA: TDateComboBox;
    GroupBox10: TGroupBox;
    tbSumatoria: TToolButton;
    edCantRegistros: TIntEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label52: TLabel;
    edSC_NROSOLICITUD: TIntEdit;
    edCO_NROCOTIZACION: TIntEdit;
    GroupBox11: TGroupBox;
    fraSC_CANAL: TfraCanal;
    GroupBox12: TGroupBox;
    fraSC_ENTIDAD: TfraEntidades;
    cmbSC_Estado: TDBCheckCombo;
    dsEstado: TDataSource;
    sdqEstado: TSDQuery;
    GroupBox13: TGroupBox;
    chkCantTrab1: TCheckBox;
    chkCantTrab2: TCheckBox;
    chkCantTrab4: TCheckBox;
    chkCantTrab5: TCheckBox;
    chkCantTrab6: TCheckBox;
    chkSoloTecnica: TCheckBox;
    gbMotivoCancelacion: TGroupBox;
    fraMotivoCancelacion: TfraStaticCTB_TABLAS;
    GroupBox2: TGroupBox;
    chkcmbArtAnterior: TCheckCombo;
    GroupBox3: TGroupBox;
    fraHoldingBuscar: TfraCodDesc;
    tbCambiarUsuarioAutorizacion: TToolButton;
    tbNoSeCotiza: TToolButton;
    popupImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuMinuta: TMenuItem;
    GroupBox14: TGroupBox;
    checkConTarifaCargada: TCheckBox;
    tbAutorizarYNotificar: TToolButton;
    fpHintColores: TFormPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    tbColores: TToolButton;
    btnCerrar: TButton;
    Bevel4: TBevel;
    tbSRT: TToolButton;
    fpSRT: TFormPanel;
    btnImportar: TButton;
    btnCancelar: TButton;
    Bevel5: TBevel;
    rbDia: TRadioButton;
    rbSemana: TRadioButton;
    rbMes: TRadioButton;
    rbEntreFechas: TRadioButton;
    gbEntreFechas: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    edFechaImportacionSrtDesde: TDateComboBox;
    edFechaImportacionSrtHasta: TDateComboBox;
    Label28: TLabel;
    lbProcesando: TLabel;
    chkCantTrab3: TCheckBox;
    GroupBox8: TGroupBox;
    rbTieneHoldingIndistinto: TRadioButton;
    rbTieneHoldingSi: TRadioButton;
    rbTieneHoldingNo: TRadioButton;
    chkCantTrab7: TCheckBox;
    edOtrosDesde: TIntEdit;
    edOtrosHasta: TIntEdit;
    GroupBox15: TGroupBox;
    fraProbabilidadCierreNegocio: TfraCodDesc;
    Label1: TLabel;
    Label2: TLabel;
    Shape5: TShape;
    Label13: TLabel;
    Shape6: TShape;
    Label14: TLabel;
    Shape7: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    fpCambiarUsuarioAutorizacion: TFormPanel;
    Bevel6: TBevel;
    btnAceptar: TButton;
    btnCancelar4: TButton;
    fraUsuario: TfraCodDesc;
    Label24: TLabel;
    fraUsuarioAutorizacion: TfraCodDesc;
    Label21: TLabel;
    Label25: TLabel;
    GroupBox5: TGroupBox;
    fraEN_IDEJECUTIVO: TfraCodDesc;
    tbCambiarUsuarioAutorizacion2: TToolButton;
    edOrden: TIntEdit;
    tbBuscarEmails: TToolButton;
    GroupBox16: TGroupBox;
    checkPrestacionesEspeciales: TCheckBox;
    Label38: TLabel;
    fraMotivo: TfraCodDesc;
    GroupBox17: TGroupBox;
    fraMotivoSuspension: TfraCodDesc;
    fraDestinatario: TfraCodDesc;
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPrevencionClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbCerrarCotizacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAsignarClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure tbSolicitudInfoClick(Sender: TObject);
    procedure btnEnviarMailClick(Sender: TObject);
    procedure btnCancelarMailClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fraSC_CANALExit2(Sender: TObject);
    procedure fraSC_ENTIDADExit(Sender: TObject);
    procedure edCO_CUITExit(Sender: TObject);
    procedure tbCambiarUsuarioAutorizacionClick(Sender: TObject);
    procedure tbNoSeCotizaClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure mnuMinutaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure tbAutorizarYNotificarClick(Sender: TObject);
    procedure fpHintColoresKeyPress(Sender: TObject; var Key: Char);
    procedure tbColoresClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure tbSRTClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure EnableEntreFechasSRT(Sender: TObject);
    procedure fpSRTBeforeShow(Sender: TObject);
    procedure fpMailBeforeShow(Sender: TObject);
    procedure btnCancelar4Click(Sender: TObject);
    procedure fpCambiarUsuarioAutorizacionShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbCambiarUsuarioAutorizacion2Click(Sender: TObject);
    procedure edCO_NROCOTIZACIONKeyPress(Sender: TObject; var Key: Char);
    procedure tbBuscarEmailsClick(Sender: TObject);
    procedure CambiarMotivoSuspension(Sender: TObject);
  private
    FRegistrosSeleccionados: TStringList;

    function NotificarAComercial: Boolean;
    function TieneUsuarioAsignado(const aIdCotizacion: Integer): Boolean;

    procedure AprobarCotizacion;
    procedure CalcTotales;
    procedure CargarArtAnteriores;
    procedure FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
  protected
    procedure ActualizaConsulta;
    procedure EnableButtons(AEnabled: Boolean); override;
  public
    procedure Suspender(const aConTransaccion: Boolean = False);
  end;

var
  frmConsultaCotizacion: TfrmConsultaCotizacion;

implementation

{$R *.DFM}

uses
  unPrincipal, unDmPrincipal, unAdminCotizacion, unCustomPanelABM, unART, unFiltros, CustomDlgs, unDatosPrevencion, AnsiSql, VCLExtra, General, StrFuncs, DBFuncs, CUIT,
  unSesion, unCotizacion, unRptMinutaComite, SqlFuncs, unImportFromSRT, unConsultaSolicitud, unElementosEnviados;

const
  MAXCOLS = 5;

var
  TotalConsulta: Array of Extended;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('CO_COSTOFINALANTERIOR', 'TC_COSTOFINAL', 'CO_MASASALARIAL', 'CO_CANTTRABAJADOR', 'DIFPLATA', 'DIFPLATAMENSUAL');

procedure TfrmConsultaCotizacion.tbModificarClick(Sender: TObject);
var
  PendienteCotizar: Boolean;
begin
  with sdqConsulta do
  begin
    PendienteCotizar := (FieldByName('co_estado').AsString = EC_PEND_COTIZ) or (FieldByName('co_estado').AsString = EC_CON_ERRORES) or (FieldByName('co_estado').AsString = EC_ASIGNADA);

    Verificar(((FieldByName('co_estado').AsString = EC_CANCELADA) or
               (FieldByName('co_estado').AsString = EC_NO_SE_COTIZA) or
               (FieldByName('co_estado').AsString = EC_CERRADA_SIN_INFORMACION)) and
               (FieldByName('co_id').AsInteger = 0), nil, 'La solicitud ha sido cancelada sin generar cotización.');

    Verificar(FieldByName('usuasignado').AsString = '', nil, 'La solicitud no posee ningún usuario asignado.');
    Verificar(PendienteCotizar and (FieldByName('usuasignado').AsString <> Sesion.UserID), nil, 'El usuario asignado no es correcto.');

    frmAdminCotizacion.Free;
    frmAdminCotizacion := TfrmAdminCotizacion.Create(Self);

    if FieldByName('co_id').AsInteger = 0 then
      frmAdminCotizacion.DoCargar(FieldByName('sc_id').AsInteger, 'altasolicitud')
    else
      frmAdminCotizacion.DoCargar(FieldByName('co_id').AsInteger, 'consulta');
  end;
end;

procedure TfrmConsultaCotizacion.FormCreate(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados := TStringList.Create;

  CheckButtons;

  edCO_NROCOTIZACION.Clear;
  edOrden.Clear;

  fraMotivo.Propiedades.Sql :=
    'SELECT baja, codigo, descripcion, id' +
     ' FROM (SELECT null ' + CD_ALIAS_BAJA + ', 1 ' + CD_ALIAS_CODIGO + ', 1 ' + CD_ALIAS_ID + ', ''Indicación de Comité'' ' + CD_ALIAS_DESC + ' FROM DUAL' +
        ' UNION ALL' +
           ' SELECT null, 2, 2, ''Pedir información a Prevención'' FROM DUAL' +
        ' UNION ALL' +
           ' SELECT null, 3, 3, ''Pedir información a Comercial'' FROM DUAL) tabla' +
    ' WHERE 1 = 1';
  fraMotivo.OnChange := CambiarMotivoSuspension;

  fraMotivoSuspension.Propiedades.Sql :=
    'SELECT baja, codigo, descripcion, id' +
     ' FROM (SELECT null ' + CD_ALIAS_BAJA + ', 1 ' + CD_ALIAS_CODIGO + ', 1 ' + CD_ALIAS_ID + ', ''Indicación de Comité'' ' + CD_ALIAS_DESC + ' FROM DUAL' +
        ' UNION ALL' +
           ' SELECT null, 2, 2, ''Pedir información a Prevención'' FROM DUAL' +
        ' UNION ALL' +
           ' SELECT null, 3, 3, ''Pedir información a Comercial'' FROM DUAL) tabla' +
    ' WHERE 1 = 1';

  frafpSC_USUASIGNADO.ExtraCondition := ' AND se_sector IN (''GERTEAC'', ''TECNICO'')';
//  frafpSC_USUASIGNADO.Sector := 'TECNICO';
  frafpSC_USUASIGNADO.Value  := frmPrincipal.DBLogin.UserID;

  fraSC_CANAL.FiltraUsuario := False;

  fraUsuarioAsignado.ExtraCondition := ' AND se_sector IN (''GERTEAC'', ''TECNICO'')';
//  fraUsuarioAsignado.Sector := 'TECNICO';
  fraUsuarioAsignado.Value := Sesion.UserID;

  fraUsuarioAutorizacion.Propiedades.Sql :=
    'SELECT id, codigo, descripcion, baja' +
     ' FROM (SELECT tb_codigo ' + CD_ALIAS_ID + ', ac_usuario ' + CD_ALIAS_CODIGO + ', tb_descripcion ' + CD_ALIAS_DESC + ', ac_fechabaja ' + CD_ALIAS_BAJA +
             ' FROM art.aac_autorizacotiza aac, ctb_tablas' +
            ' WHERE tb_clave = ''REUSA''' +
              ' AND ac_puesto = tb_codigo) tabla' +
    ' WHERE 1 = 1';

  //Ordeno los botones
  tbSumatoria.Left                  := 31;
  tbSalir.Left                      := 31;
  tbMostrarOcultarColumnas.Left     := 31;
  ToolButton8.Left                  := 31;
  tbSRT.Left                        := 31;
  tbPrevencion.Left                 := 31;
  ToolButton6.Left                  := 31;
  tbColores.Left                    := 31;
  ToolButton3.Left                  := 31;
  tbBuscarEmails.Left               := 31;
  tbExportar.Left                   := 31;
  tbImprimir.Left                   := 31;
  tbOrdenar.Left                    := 31;
  tbLimpiar.Left                    := 31;
  ToolButton4.Left                  := 31;
  tbCambiarUsuarioAutorizacion2.Left:= 31;
  tbCambiarUsuarioAutorizacion.Left := 31;
  tbCerrarCotizacion.Left           := 31;
  tbAutorizarYNotificar.Left        := 31;
  tbAprobar.Left                    := 31;
  tbNoSeCotiza.Left                 := 31;
  tbEliminar.Left                   := 31;
  tbSolicitudInfo.Left              := 31;
  tbAsignar.Left                    := 31;
  tbModificar.Left                  := 31;
  tbNuevo.Left                      := 31;


  //Campos Sumatoria
  SetLength(TotalConsulta, MAXCOLS + 1);
  VCLExtra.LockControls([edCantRegistros], True);
  OpenQuery(sdqEstado);

  CargarArtAnteriores;
end;

procedure TfrmConsultaCotizacion.tbRefrescarClick(Sender: TObject);
var
  bHayFiltros: Boolean;
  EsCotizacion: Boolean;
  EsSolicitud: Boolean;
  iLoop: Integer;
  sArtAnteriores: String;
  sCantTrab: String;
  sSql: String;
  sSqlFinal: String;
  sUnion: String;
  sWhere: String;
begin
  Verificar((edCO_CUIT.Text > '') and not(isCuit(edCO_CUIT.Text)), edCO_CUIT, 'La C.U.I.T. no es correcta.');
  Verificar((chkCantTrab7.Checked) and (edOtrosDesde.IsEmpty), edOtrosDesde, 'Debe indicar un valor en este campo.');
  Verificar((chkCantTrab7.Checked) and (edOtrosHasta.IsEmpty), edOtrosHasta, 'Debe indicar un valor en este campo.');

  sCantTrab := '';
  FRegistrosSeleccionados.Clear;

  if chkCantTrab1.Checked or chkCantTrab2.Checked or chkCantTrab3.Checked or chkCantTrab4.Checked or chkCantTrab5.Checked or chkCantTrab6.Checked or chkCantTrab7.Checked then
  begin
    sCantTrab := ' AND ( 1=2 ';

    if chkCantTrab1.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN 1 AND 10 ';

    if chkCantTrab2.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN 11 AND 25 ';

    if chkCantTrab3.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN 26 AND 50 ';

    if chkCantTrab4.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN 51 AND 100 ';

    if chkCantTrab5.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN 101 AND 500 ';

    if chkCantTrab6.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador > 500';

    if chkCantTrab7.Checked then
      sCantTrab := sCantTrab + ' OR co_canttrabajador BETWEEN ' + SqlValue(edOtrosDesde.Value) + ' AND ' + SqlValue(edOtrosHasta.Value);

    sCantTrab := sCantTrab + ' ) ';
  end;

  sArtAnteriores := '';

  if chkcmbArtAnterior.Text <> '' then
  begin
   sArtAnteriores := sArtAnteriores + ' AND sc_idartanterior IN (';
   for iLoop := 0 to chkcmbArtAnterior.Items.count - 1 do
     if chkcmbArtAnterior.Checked[iLoop] then
       sArtAnteriores := sArtAnteriores + TCadena(chkcmbArtAnterior.Items.Objects[iLoop]).Valor + ',';
   sArtAnteriores := Copy(sArtAnteriores, 1, Length(sArtAnteriores) - 1);
   sArtAnteriores := sArtAnteriores + ')';
  end;


  ////////////////////
  //  COTIZACIONES  //
  ////////////////////
  sSql := '';
  sWhere := '';
  sSql :=
    'SELECT null checkbox, co_fechavigencia, co_autorizagerencia, cotizaciones.co_estado, acoes.tb_descripcion estado,' +
          ' co_id, sc_id, sc_nrosolicitud, co_nrocotizacion, co_cuit, co_razonsocial,' +
          ' co_usuariosolicitado ususolicito, co_usucerrado, ac_descripcion, ac_codigo codactividad, co_masasalarial,' +
          ' co_canttrabajador, sc_usuasignado usuasignado, tc_costofinal,' +
          ' DECODE(NVL(tc_sumafija, 0), 0, 0.6, tc_sumafija) tc_sumafija, tc_porcvariable,' +
          ' DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)) co_costofinalanterior,' +
          ' DECODE(cz_competenciacostofijo, NULL, co_sumafijaanterior, DECODE(cz_competenciacostofijo, 0, 0, cz_competenciacostofijo + 0.6)) co_sumafijaanterior,' +
          ' NVL(cz_competenciacostovariable, co_porcvariableanterior) co_porcvariableanterior,' +
          ' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_CANCELADA) + ', sc_observacionescierre, null) motivo_cancelacion,' +
          ' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', sc_observacionescierre, null) motivo_no_se_cotiza,' +
          ' ca_descripcion, sc_fechasolicitud, co_fechacerrado, sc_fecharespuesta, sc_fechasuspdesde, sc_fechasusphasta,' +
          ' sc_fechabaja,' +


          ' DECODE(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)),' +
                 ' 0, 0,' +
                 ' DECODE(NVL(tc_costofinal, 0), 0, 0,' +
                 ' tc_costofinal - DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)))) difplata,' +




          ' DECODE(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)),' +
                 ' 0, 0,' +
                 ' (DECODE(NVL(tc_costofinal, 0), 0, 0,' +
                  ' tc_costofinal / TO_NUMBER(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)))' +
                  ' - 1)) * 100) difporc,' +


          ' DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL),' +
                 ' DECODE(TO_NUMBER(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6))),' +
                        ' 0, 0,' +
                        ' (DECODE(NVL(tc_costofinal, 0), 0, 0,' +
                         ' tc_costofinal - TO_NUMBER(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6)))))' +
                        ' * co_canttrabajador)) difplatamensual,' +


          ' to_number(utiles.iif_compara(''<'', co_canttrabajador,' +
                            ' (SELECT to_number(tb_codigo) FROM art.ctb_tablas WHERE tb_clave = ''CLTAC''),' +
                            ' DECODE(NVL(co_autocostofinal, 0), 0, 0, (tc_costofinal - co_autocostofinal)),' +
                            ' DECODE(NVL(co_costotecnico, 0), 0, 0, (tc_costofinal - co_costotecnico - 0.60)))) costotecnicovscotizada,' +


          ' DECODE(tc_costofinal, 0, TO_NUMBER(NULL), tc_costofinal * co_canttrabajador) primamensual,' +


          ' DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL),' +
                 ' (TO_NUMBER(DECODE(NVL(cz_competenciacostovariable, 0), 0, co_costofinalanterior, ((cz_competenciacostovariable * (co_masasalarial / co_canttrabajador) / 100) + cz_competenciacostofijo + 0.6))) * co_canttrabajador)) primamensualcomp,' +
          ' sc_motivosuspension, contratos.co_contrato, sc_fecharevision, sc_usuariorevision,' +
          ' cotre.tb_descripcion cotre, sc_fechaexcepcion, sc_usuarioexcepcion, cotex.tb_descripcion motivoexcepcion,' +
          ' sc_idartanterior, co_fechaconfecciono, en_nombre, co_estadoanterior, sc_fechacierre,' +
          ' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_CANCELADA) + ', cotmc.tb_descripcion, null) cotmc,' +
					' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', cotba.tb_descripcion, null) cotba,' +
					' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_CANCELADA) + ', co_fechacerrado, null) fechacancelacion,' +
          ' DECODE(cotizaciones.co_estado, ' + SqlValue(EC_CANCELADA) + ', co_usucerrado, null) usuariocancelacion,' +
            ' cotizaciones.co_autocostofinal, cotizaciones.co_autosumafija, cotizaciones.co_autoporcvariable,' +
          ' DECODE(NVL(cotizaciones.co_costotecnico, 0), 0, 0, cotizaciones.co_costotecnico + 0.60) co_costotecnico,' +
          ' co_comision, stsrtso.tb_descripcion sc_statussrt, stbcrso.tb_descripcion sc_statusbcra,' +
          ' (SELECT DISTINCT tb_especial1' +
             ' FROM tss_solicitudsrt a, ctb_tablas' +
            ' WHERE ss_operacion = tb_codigo' +
              ' AND tb_clave = ''COPER''' +
              ' AND ss_vigenciadesde = (SELECT MAX(b.ss_vigenciadesde)' +
                                        ' FROM tss_solicitudsrt b' +
                                       ' WHERE b.ss_idcotizacion = co_id' +
                                         ' AND b.ss_fechabaja IS NULL)' +
              ' AND a.ss_idcotizacion = co_id' +
              ' AND a.ss_fechabaja IS NULL' +
              ' AND ROWNUM = 1) statussrttecnica,' +
          ' stbcrco.tb_descripcion co_statusbcra, reusa.tb_descripcion usuarioautorizacion,' +
          ' DECODE(cotizaciones.co_estado, ''05'', NULL, DECODE(cotizaciones.co_estado, ''10'', NULL,' +
                 ' co_usucerrado)) usuarionotificacion, co_establecimientos, ge_descripcion, cz_actividadreal,' +
          ' zg_descripcion, cp_localidadcap, cz_empresatestigo, cz_muestra1, cz_muestra2, cz_muestra3, cz_muestra4,' +
          ' cz_muestra5, cz_muestra6, cz_muestra7, cz_muestra8, cz_muestra9, dt_frecuencia, cz_frecuenciaesperada,' +
          ' su_descripcion, sc_fechaalta, sc_statussrt idstatussrt, NVL(co_statusbcra, sc_statusbcra) idstatusbcra,' +
          ' co_usuarioautorizacion, cotizaciones.co_idactividad, co_puestoautorizacion,' +
          ' NVL(DECODE(sc_porcdescuento, -1, 0, sc_porcdescuento), 0) descuentoaplicado, sc_motivonoautocotizacion,' +
          ' sc_idusuarioweb, sc_identidad, NVL(co_statussrt, sc_statussrt) co_statussrt, co_usuarioconfecciono,' +
          ' cotizaciones.co_nivel,' +
          ' art.cotizacion.get_valor_rc(sc_cuit,' +
                                      ' NVL(co_canttrabajador, sc_canttrabajador),' +
                                      ' NVL(co_masasalarial, sc_masasalarial),' +
                                      ' sc_finalporcmasa,' +
                                      ' sc_finalsumafija - 0.6,' +
                                      ' NVL(sc_idzonageografica, 1),' +
                                      ' sc_idcotizacion,' +
                                      ' sc_sumaasegurada_rc,' +
                                      ' 0) valor_rc, ec_nombre,' +
          ' (SELECT ce_fecha' +
              ' FROM ace_cotizacionevento' +
          '  WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) fechaultimoevento,' +
          ' (SELECT ce_descripcion' +
             ' FROM ace_cotizacionevento' +
           '  WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) descripcionultimoevento,' +
           ' (SELECT NULLIF(GREATEST(FLOOR((cotizaciones.co_fechacerrado + 1 + CASE WHEN(ca_tipo = ''B'') THEN 60 ELSE 30 END) - SYSDATE),-1),-1) FROM DUAL) as DiasVencimiento,' +
           ' co_nrocotizacion || ''/'' || co_orden nrocotiorden,' +
           ' DECODE(sc_motivoclonacion, 1, ''Mantener misma cotización.'', DECODE(sc_motivoclonacion, 2, ''Incrementar cotización.'', DECODE(sc_motivoclonacion, 3, ''Reducir cotización'', ''''))) motivoclonacion,' +
           ' co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso,' +
           ' DECODE(co_chek_iltempleador, ''S'', ''Sí'', NULL) iltempleador, co_indicecombinado indicecombinado,' +
           ' NVL(DECODE(sc_porcaumento, -1, 0, sc_porcaumento), 0) aumentoaplicado, co_acpo, DECODE(sc_prestaciones_especiales, ''S'', ''SI'', ''NO'') prestacionesespeciales,' +
           ' NVL(cz_explotacionfijos, 0) explotacionfijos, DECODE(sc_campania931, ''S'', ''Sí'', ''No'') campania931, co_cargamanualic, ve_nombre, ve_vendedor, en_codbanco,' +
           ' DECODE(sc_cod_motivosuspension, 1, ''Indicación de Comité'', 2, ''Pedir información a Prevención'', 3, ''Pedir información a Comercial'', NULL) motivosuspension' +
     ' FROM asc_solicitudcotizacion, aco_cotizacion cotizaciones, cac_actividad, aco_contrato contratos, atc_tarifacobrar, ctb_tablas acoes, ctb_tablas cotba, ctb_tablas cotmc,' +
          ' ctb_tablas cotre, ctb_tablas cotex, aca_canal, xen_entidad, acz_cotizador, ctb_tablas stsrtso, ctb_tablas stbcrso, ctb_tablas stbcrco, age_grupoeconomico,' +
          ' afi.azg_zonasgeograficas, art.ccp_codigopostal, adt_datotarifador, asu_sucursal, ctb_tablas reusa, aec_ejecutivocuenta, xve_vendedor' +
    ' WHERE ac_id = cotizaciones.co_idactividad' +
      ' AND acoes.tb_clave = ''ACOES''' +
      ' AND acoes.tb_codigo = cotizaciones.co_estado' +
      ' AND (   (sc_error IS NULL)' +
           ' OR (sc_error = ''0'')' +
           ' OR (sc_fechaexcepcion IS NOT NULL))' +
      ' AND cotba.tb_clave(+) = ''COTBA''' +
      ' AND cotba.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotmc.tb_clave(+) = ''COTMC''' +
      ' AND cotmc.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotre.tb_clave(+) = ''COTRE''' +
      ' AND cotre.tb_codigo(+) = sc_codmotivorevision' +
      ' AND cotex.tb_clave(+) = ''COTEX''' +
      ' AND cotex.tb_codigo(+) = sc_codmotivoexcepcion' +
      ' AND stsrtso.tb_clave(+) = ''STSRT''' +
      ' AND stsrtso.tb_codigo(+) = sc_statussrt' +
      ' AND stbcrso.tb_clave(+) = ''STBCR''' +
      ' AND stbcrso.tb_codigo(+) = sc_statusbcra' +
      ' AND stbcrco.tb_clave(+) = ''STBCR''' +
      ' AND stbcrco.tb_codigo(+) = co_statusbcra' +
      ' AND sc_idcotizacion = co_id' +
      ' AND acoes.tb_codigo <> ' + SqlValue(EC_SOLIC_A_REVISAR) +
      ' AND sc_canal = ca_id' +
      ' AND sc_identidad = en_id' +
      ' AND cz_idcotizacion(+) = cotizaciones.co_id' +
      ' AND contratos.co_contrato(+) = afiliacion.get_contratovigente(co_cuit)' +
      ' AND co_idgrupoeconomico = ge_id(+)' +
      ' AND cz_idzonageografica = zg_id(+)' +
      ' AND cz_idlocalidad = cp_id(+)' +
      ' AND cotizaciones.co_idactividad = dt_idactividad(+)' +
      ' AND sc_idsucursal = su_id(+)' +
      ' AND ((sc_idusuarioweb IS NULL)' +
          ' OR ((sc_idusuarioweb IS NOT NULL) AND (sc_estado <> ' + SqlValue(EC_CON_ERRORES) + ')))' +
      ' AND reusa.tb_clave(+) = ''REUSA''' +
      ' AND reusa.tb_codigo(+) = co_puestoautorizacion' +
      ' AND sc_statussrt IS NOT NULL' +
      ' AND tc_id(+) = art.cotizacion.get_idultimatarifa(co_id)' +
      ' AND en_idejecutivo = ec_id(+)' +
      ' AND sc_idvendedor = ve_id(+)';

  if edCO_CUIT.Text <> '' then
    sWhere := sWhere + ' AND co_cuit = ' + SqlValue(edCO_CUIT.Text);

  if Trim(edCO_RAZONSOCIAL.Text) <> '' then
    sWhere := sWhere + ' AND co_razonsocial LIKE ''' + edCO_RAZONSOCIAL.Text + '%''';

  sWhere := sWhere + DoFiltroComponente(fraCO_IDACTIVIDAD, 'COTIZACIONES.CO_IDACTIVIDAD');
  sWhere := sWhere + DoFiltroComponente(cmbCO_FECHACONFECCIONODesde, 'CO_FECHACONFECCIONO', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbCO_FECHACONFECCIONOHasta, 'CO_FECHACONFECCIONO', '<=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASOLICITUDDesde, 'SC_FECHASOLICITUD', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASOLICITUDHasta, 'SC_FECHASOLICITUD', '<=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASUSPDESDE, 'SC_FECHASUSPDESDE', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASUSPHASTA, 'SC_FECHASUSPHASTA', '<=');
  sWhere := sWhere + DoFiltroComponente(cmbCO_FECHACERRADODesde, 'CO_FECHACERRADO', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbCO_FECHACERRADOHasta, 'CO_FECHACERRADO', '<=');
  sWhere := sWhere + DoFiltroComponente(edCO_NROCOTIZACION, 'CO_NROCOTIZACION');
  sWhere := sWhere + DoFiltroComponente(edSC_NROSOLICITUD, 'SC_NROSOLICITUD');
  sWhere := sWhere + DoFiltroComponente(fraUsuarioAutorizacion, 'CO_PUESTOAUTORIZACION');
  sWhere := sWhere + DoFiltroComponente(fraMotivoSuspension, 'SC_COD_MOTIVOSUSPENSION');

  if not edOrden.IsEmpty then
    sWhere := sWhere + ' AND co_orden = ' + SqlValue(edOrden.Value);

  if fraUsuarioAsignado.IsSelected then
    sWhere := sWhere + ' AND sc_usuasignado = ' + SqlValue(fraUsuarioAsignado.Value);

  if fraSC_CANAL.IsSelected then
    sWhere := sWhere + ' AND sc_canal = ' + SqlValue(fraSC_CANAL.Value);

  if fraSC_ENTIDAD.IsSelected then
    sWhere := sWhere + ' AND sc_identidad = ' + SqlValue(fraSC_ENTIDAD.Value);

  if not fraHoldingBuscar.IsEmpty then
    sWhere := sWhere + ' AND co_idgrupoeconomico = ' + SqlValue(fraHoldingBuscar.Value);

  if rbTieneHoldingSi.Checked then
    sWhere := sWhere + ' AND co_idgrupoaconomico IS NOT NULL';

  if rbTieneHoldingNo.Checked then
    sWhere := sWhere + ' AND co_idgrupoaconomico IS NULL';

  if checkConTarifaCargada.Checked then
    sWhere := sWhere + ' AND NVL(tc_costofinal, 0) > 0';

  if checkPrestacionesEspeciales.Checked then
    sWhere := sWhere + ' AND sc_prestaciones_especiales = ''S''';

  if not fraProbabilidadCierreNegocio.IsEmpty then
    sWhere := sWhere + ' AND sc_idprobabilidadcierre = ' + SqlValue(fraProbabilidadCierreNegocio.Value);

  if chkSoloTecnica.Checked then
//    sWhere := sWhere + ' AND ((sc_usuasignado IS NOT NULL) OR (sc_estado = ' + SqlValue(EC_PEND_COTIZ) + ')) ';
    sWhere := sWhere + ' AND sc_idcotizacion IS NOT NULL';

  if not cmbSC_ESTADO.IsEmpty then
    sWhere := sWhere + ' AND cotizaciones.co_estado ' + cmbSC_ESTADO.InSql;

  if rbCostoNo.Checked then
    sWhere := sWhere + ' AND sc_form931 IS NULL';

  if rbCostoSi.Checked then
    sWhere := sWhere + ' AND sc_form931 IS NOT NULL';

  if not fraEN_IDEJECUTIVO.IsEmpty then
    sWhere := sWhere + ' AND ec_id  = '+ SqlValue(fraEN_IDEJECUTIVO.Codigo);

  sSql := sSql + sWhere + sCantTrab + sArtAnteriores;
  bHayFiltros := (sWhere <> '') or (sCantTrab <> '') or (sArtAnteriores <> '');

  ///////////////////
  //  SOLICITUDES  //
  ///////////////////
  sUnion := '';
  sWhere := '';
  sUnion := sUnion +
    'SELECT NULL checkbox, actualdate co_fechavigencia, ''N'' co_autorizagerencia, sc_estado co_estado, acoes.tb_descripcion estado,' +
          ' TO_NUMBER(NULL) co_id, sc_id, sc_nrosolicitud, TO_NUMBER(NULL) co_nrocotizacion, sc_cuit co_cuit,' +
          ' sc_razonsocial co_razonsocial, sc_usuariosolicitud ususolicito, NULL co_usucerrado, ac_descripcion,' +
          ' ac_codigo codactividad, sc_masasalarial co_masasalarial, sc_canttrabajador co_canttrabajador, sc_usuasignado usuasignado,' +
          ' sc_finalportrabajador AS tc_costofinal, sc_finalsumafija AS tc_sumafija, sc_finalporcmasa AS tc_porcvariable,' +
          ' DECODE(sc_form931,' +
                 ' ''A'', sc_costofinalpagomensual,' +
                 ' DECODE(sc_form931, ''S'', sc_costofinalform931, DECODE(sc_form931, ''N'', sc_costofinal, 0))) co_costofinalanterior,' +
          ' DECODE(sc_form931,' +
                 ' ''A'', sc_sumafijacompetencia,' +
                 ' DECODE(sc_form931, ''S'', sc_sumafijaform931, DECODE(sc_form931, ''N'', sc_sumafija, 0))) co_sumafijaanterior,' +
          ' DECODE(sc_form931,' +
                 ' ''A'', sc_porcvariablecompetencia,' +
                 ' DECODE(sc_form931, ''S'', sc_porcvariableform931, DECODE(sc_form931, ''N'', sc_porcvariable, 0)))' +
                                                                                                           ' co_porcvariableanterior,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', sc_observacionescierre, NULL) motivo_cancelacion,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', sc_observacionescierre, NULL) motivo_no_se_cotiza, ca_descripcion,' +
          ' sc_fechasolicitud, sc_fechavigencia co_fechacerrado, sc_fecharespuesta, sc_fechasuspdesde, sc_fechasusphasta,' +
          ' sc_fechabaja,' +
          ' DECODE(TO_NUMBER(DECODE(sc_form931,' +
                                  ' ''A'', sc_costofinalpagomensual,' +
                                  ' DECODE(sc_form931, ''S'', sc_costofinalform931, DECODE(sc_form931, ''N'', sc_costofinal, 0)))),' +
                 ' 0, 0,' +
                 ' (sc_finalportrabajador' +
                  ' - DECODE(sc_form931,' +
                           ' ''A'', sc_costofinalpagomensual,' +
                           ' DECODE(sc_form931, ''S'', sc_costofinalform931, DECODE(sc_form931, ''N'', sc_costofinal, 0))))) difplata,' +
          ' TO_NUMBER(DECODE(sc_fechavigencia,' +
                           ' NULL, NULL,' +
                           ' DECODE(sc_form931,' +
                                  ' ''A'', DECODE(sc_costofinalpagomensual,' +
                                              ' 0, NULL,' +
                                              ' ((sc_finalportrabajador / sc_costofinalpagomensual) - 1) * 100),' +
                                  ' DECODE(sc_form931,' +
                                         ' ''S'', DECODE(sc_costofinalform931,' +
                                                     ' 0, NULL,' +
                                                     ' ((sc_finalportrabajador / sc_costofinalform931) - 1) * 100),' +
                                         ' DECODE(sc_costofinal, 0, NULL,((sc_finalportrabajador / sc_costofinal) - 1) * 100)))))' +
                                                                                                                           ' difporc,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, TO_NUMBER(NULL),' +
                 ' DECODE(TO_NUMBER(DECODE(sc_form931,' +
                                         ' ''A'', sc_costofinalpagomensual,' +
                                         ' DECODE(sc_form931, ''S'', sc_costofinalform931, sc_costofinal))' +
                                  ' * sc_canttrabajador),' +
                        ' 0, TO_NUMBER(NULL),' +
                        ' (sc_masasalarial / sc_canttrabajador *(sc_finalporcmasa / 100) + sc_finalsumafija) * sc_canttrabajador))' +
          ' - TO_NUMBER(DECODE(sc_form931,' +
                             ' ''A'', sc_costofinalpagomensual,' +
                             ' DECODE(sc_form931, ''S'', sc_costofinalform931, sc_costofinal))' +
                      ' * sc_canttrabajador) difplatamensual,' +
          ' NULL costotecnicovscotizada,' +
          ' (sc_masasalarial / sc_canttrabajador *(sc_finalporcmasa / 100) + sc_finalsumafija) * sc_canttrabajador primamensual,' +
          ' TO_NUMBER(DECODE(sc_form931,' +
                           ' ''A'', sc_costofinalpagomensual,' +
                           ' DECODE(sc_form931, ''S'', sc_costofinalform931, sc_costofinal))' +
                    ' * sc_canttrabajador) primamensualcomp,' +
          ' sc_motivosuspension, contratos.co_contrato, sc_fecharevision, sc_usuariorevision, cotre.tb_descripcion cotre,' +
          ' sc_fechaexcepcion, sc_usuarioexcepcion, cotex.tb_descripcion motivoexcepcion, sc_idartanterior,' +
          ' TO_DATE(NULL) co_fechaconfecciono, en_nombre, sc_estadoanterior co_estadoanterior, sc_fechacierre,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', cotmc.tb_descripcion, NULL) cotmc,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', cotba.tb_descripcion, NULL) cotba,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', sc_fechacierre, NULL) fechacancelacion,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', sc_usubaja, NULL) usuariocancelacion, NULL co_autocostofinal,' +
          ' NULL co_autosumafija, NULL co_autoporcvariable, NULL co_costotecnico, sc_porccomision co_comision,' +
          ' stsrtso.tb_descripcion sc_statussrt, stbcrso.tb_descripcion sc_statusbcra, NULL statussrttecnica, NULL co_statusbcra,' +
          ' NULL usuarioautorizacion, NULL usuarionotificacion, sc_establecimientos co_establecimientos, ge_descripcion,' +
          ' NULL cz_actividadreal, NULL zg_descripcion, NULL cp_localidadcap, NULL cz_empresatestigo, NULL cz_muestra1,' +
          ' NULL cz_muestra2, NULL cz_muestra3, NULL cz_muestra4, NULL cz_muestra5, NULL cz_muestra6, NULL cz_muestra7,' +
          ' NULL cz_muestra8, NULL cz_muestra9, NULL dt_frecuencia, NULL cz_frecuenciaesperada, su_descripcion, sc_fechaalta,' +
          ' sc_statussrt idstatussrt, sc_statusbcra idstatusbcra, NULL co_usuarioautorizacion, sc_idactividad co_idactividad,' +
          ' NULL co_puestoautorizacion, NVL(DECODE(sc_porcdescuento, -1, 0, sc_porcdescuento), 0) descuentoaplicado,' +
          ' sc_motivonoautocotizacion, sc_idusuarioweb, sc_identidad, sc_statussrt co_statussrt, NULL co_usuarioconfecciono,' +
          ' NULL co_nivel,' +
          ' art.cotizacion.get_valor_rc(sc_cuit, sc_canttrabajador, sc_masasalarial, sc_finalporcmasa,' +
                                      ' sc_finalsumafija - 0.6, NVL(sc_idzonageografica, 1), sc_idcotizacion,' +
                                      ' sc_sumaasegurada_rc, 0) valor_rc,' +
          ' ec_nombre, (SELECT ce_fecha' +
                        ' FROM ace_cotizacionevento' +
                       ' WHERE ce_id = (SELECT MAX(ce_id)' +
                                        ' FROM ace_cotizacionevento' +
                                       ' WHERE ce_idsolicitudcotizacion = sc_id' +
                                         ' AND ce_fechabaja IS NULL)) fechaultimoevento,' +
          ' (SELECT ce_descripcion' +
             ' FROM ace_cotizacionevento' +
            ' WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) descripcionultimoevento, NULL diasvencimiento,' +
          ' NULL nrocotiorden,' +
          ' DECODE(sc_motivoclonacion, 1, ''Mantener misma cotización.'', DECODE(sc_motivoclonacion, 2, ''Incrementar cotización.'', DECODE(sc_motivoclonacion, 3, ''Reducir cotización'', ''''))) motivoclonacion,' +
          ' NULL co_sumafijapiso, NULL co_porcvariablepiso, NULL co_costofinalpiso, NULL co_comisionpiso,' +
          ' NULL iltempleador, NULL indicecombinado,' +
          ' NVL(DECODE(sc_porcaumento, -1, 0, sc_porcaumento), 0) aumentoaplicado, NULL co_acpo, DECODE(sc_prestaciones_especiales, ''S'', ''SI'', ''NO'') prestacionesespeciales,' +
          ' NULL cz_explotacionfijos, DECODE(sc_campania931, ''S'', ''Sí'', ''No'') campania931, NULL co_cargamanualic, ve_nombre, ve_vendedor, en_codbanco,' +
          ' DECODE(sc_cod_motivosuspension, 1, ''Indicación de Comité'', 2, ''Pedir información a Prevención'', 3, ''Pedir información a Comercial'', NULL) motivosuspension' +
     ' FROM asc_solicitudcotizacion, cac_actividad, ctb_tablas acoes, ctb_tablas cotba, ctb_tablas cotmc, ctb_tablas cotre, ctb_tablas cotex, aca_canal, aco_contrato contratos,' +
          ' xen_entidad, ctb_tablas stsrtso, ctb_tablas stbcrso, age_grupoeconomico, asu_sucursal, aec_ejecutivocuenta, xve_vendedor' +
    ' WHERE ac_id(+) = sc_idactividad' +
      ' AND acoes.tb_clave = ''ACOES''' +
      ' AND sc_canal = ca_id' +
      ' AND (   (sc_error IS NULL)' +
           ' OR (sc_error = ''0'')' +
           ' OR (sc_fechaexcepcion IS NOT NULL))' +
      ' AND cotba.tb_clave(+) = ''COTBA''' +
      ' AND cotba.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotmc.tb_clave(+) = ''COTMC''' +
      ' AND cotmc.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotre.tb_clave(+) = ''COTRE''' +
      ' AND cotre.tb_codigo(+) = sc_codmotivorevision' +
      ' AND stsrtso.tb_clave(+) = ''STSRT''' +
      ' AND stsrtso.tb_codigo(+) = sc_statussrt' +
      ' AND stbcrso.tb_clave(+) = ''STBCR''' +
      ' AND stbcrso.tb_codigo(+) = sc_statusbcra' +
      ' AND acoes.tb_codigo = sc_estado' +
      ' AND acoes.tb_codigo <> ' + SqlValue(EC_SOLIC_A_REVISAR) +
      ' AND cotex.tb_clave(+) = ''COTEX''' +
      ' AND cotex.tb_codigo(+) = sc_codmotivoexcepcion' +
      ' AND sc_identidad = en_id' +
      ' AND contratos.co_contrato(+) = afiliacion.get_contratovigente(sc_cuit)' +
      ' AND (   (sc_idusuarioweb IS NULL)' +
           ' OR (    (sc_idusuarioweb IS NOT NULL)' +
               ' AND (sc_estado <> ' + SqlValue(EC_CON_ERRORES) + '))' +
           ' OR (sc_estado = ' + SqlValue(EC_NOTIF_CLIENTE) + '))' +
      ' AND sc_idgrupoeconomico = ge_id(+)' +
      ' AND sc_idsucursal = su_id(+)' +
      ' AND sc_statussrt IS NOT NULL' +
      ' AND sc_idcotizacion IS NULL' +
      ' AND en_idejecutivo = ec_id(+)' +
      ' AND sc_idvendedor = ve_id(+)';

  if edCO_CUIT.Text <> '' then
    sWhere := sWhere + ' AND sc_cuit = ' + SqlValue(edCO_CUIT.Text);

  if Trim(edCO_RAZONSOCIAL.Text) <> '' then
    sWhere := sWhere + ' AND sc_razonsocial LIKE ''' + edCO_RAZONSOCIAL.Text + '%''';

  if (not cmbCO_FECHACERRADODesde.IsEmpty) and (not cmbCO_FECHACERRADOHasta.IsEmpty) then
    sWhere := sWhere + ' AND sc_fechavigencia BETWEEN ' + SqlDate(cmbCO_FECHACERRADODesde.Date) + ' AND ' + SqlDate(cmbCO_FECHACERRADOHasta.Date + 1)
  else if not cmbCO_FECHACERRADODesde.IsEmpty then
    sWhere := sWhere + ' AND sc_fechavigencia >= ' + SqlDate(cmbCO_FECHACERRADODesde.Date)
  else if not cmbCO_FECHACERRADOHasta.IsEmpty then
    sWhere := sWhere + ' AND sc_fechavigencia <= ' + SqlDate(cmbCO_FECHACERRADOHasta.Date + 1);

  sWhere := sWhere + DoFiltroComponente(fraCO_IDACTIVIDAD, 'SC_IDACTIVIDAD');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASOLICITUDDesde, 'SC_FECHASOLICITUD', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASOLICITUDHasta, 'SC_FECHASOLICITUD', '<=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASUSPDESDE, 'SC_FECHASUSPDESDE', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbSC_FECHASUSPHASTA, 'SC_FECHASUSPHASTA', '<=');
  sWhere := sWhere + DoFiltroComponente(edSC_NROSOLICITUD, 'SC_NROSOLICITUD');
  sWhere := sWhere + DoFiltroComponente(fraMotivoSuspension, 'SC_COD_MOTIVOSUSPENSION');

  if not cmbSC_ESTADO.IsEmpty then
    sWhere := sWhere + ' AND sc_estado ' + cmbSC_ESTADO.InSql;

  if fraUsuarioAsignado.IsSelected then
    sWhere := sWhere + ' AND sc_usuasignado = ' + SqlValue(fraUsuarioAsignado.Value);

  if rbCostoNo.Checked then
    sWhere := sWhere + ' AND sc_idartanterior IS NULL';

  if rbCostoSi.Checked then
    sWhere := sWhere + ' AND sc_idartanterior IS NOT NULL';

  if fraSC_CANAL.IsSelected then
    sWhere := sWhere + ' AND sc_canal = ' + SqlValue(fraSC_CANAL.Value);

  if fraSC_ENTIDAD.IsSelected then
    sWhere := sWhere + ' AND sc_identidad = ' + SqlValue(fraSC_ENTIDAD.Value);

  if not fraHoldingBuscar.IsEmpty then
    sWhere := sWhere + ' AND sc_idgrupoeconomico = ' + SqlValue(fraHoldingBuscar.Value);

  if rbTieneHoldingSi.Checked then
    sWhere := sWhere + ' AND sc_idgrupoeconomico IS NOT NULL';

  if rbTieneHoldingNo.Checked then
    sWhere := sWhere + ' AND sc_idgrupoeconomico IS NULL';

  if checkConTarifaCargada.Checked then
    sWhere := sWhere + ' AND 1 = 2';    // Que no muestre solicitudes en este caso..

  if checkPrestacionesEspeciales.Checked then
    sWhere := sWhere + ' AND sc_prestaciones_especiales = ''S''';

  if not fraProbabilidadCierreNegocio.IsEmpty then
    sWhere := sWhere + ' AND sc_idprobabilidadcierre = ' + SqlValue(fraProbabilidadCierreNegocio.Value);

  if chkSoloTecnica.Checked then
//    sWhere := sWhere + ' AND ((sc_usuasignado IS NOT NULL) OR (sc_estado = ' + SqlValue(EC_PEND_COTIZ) + ')) ';
    sWhere := sWhere + ' AND sc_idcotizacion IS NOT NULL';
  if not fraEN_IDEJECUTIVO.IsEmpty then
    sWhere := sWhere + ' AND ec_id  = '+ SqlValue(fraEN_IDEJECUTIVO.Codigo);


  // Reemplazo el nombre de la columna en las solicitudes para no repetir todo el lío que hice arriba para armar
  // el sCantTrab -> AND (1=2, or CO_... = ..., ...)
  ReplaceString(sCantTrab, 'co_canttrabajador', 'sc_canttrabajador');

  sUnion := sUnion + sWhere + sCantTrab + sArtAnteriores;
  bHayFiltros := (bHayFiltros) or (sWhere <> '') or (sCantTrab <> '') or (sArtAnteriores <> '');

  EsCotizacion := rbCotizaciones.Checked or ((not cmbCO_FECHACONFECCIONODesde.IsEmpty) or
                                             (not cmbCO_FECHACONFECCIONOHasta.IsEmpty)) or
                                             (not edCO_NROCOTIZACION.IsEmpty) or
                                             (not fraUsuarioAutorizacion.IsEmpty);
  EsSolicitud  := rbSolicitudes.Checked;
  if EsCotizacion then
    sSqlFinal := sSql
  else if EsSolicitud then
    sSqlFinal := sUnion
  else
    sSqlFinal := sSql + ' UNION ALL ' + sUnion;

  if not bHayFiltros then
    if not MsgAsk('Está a punto de hacer una búsqueda sin filtros y eso puede demorar varios minutos.' + #13#10 + '¿ Realmente desea continuar ?') then
      Exit;


  sdqConsulta.Sql.Clear;

  // Cargo el Query
  OpenQuery(sdqConsulta, sSqlFinal + SortDialog.OrderBy, True);
  CalcTotales;
  CheckButtons;
end;

procedure TfrmConsultaCotizacion.tbEliminarClick(Sender: TObject);
var
  sDirecciones: String;
  sMensaje: String;
  sObservacionesParaComercial: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if (Active) and (not Eof) then
    begin
      Verificar((FieldByName('co_estado').AsString = EC_NOTIF_COMERCIAL) or
                (FieldByName('co_estado').AsString = EC_NOTIF_CLIENTE) or
                (FieldByName('co_estado').AsString = EC_CERRADA_MAL), nil,
                'La cotización ya fue enviada a comercial.');
                
      Verificar((FieldByName('co_estado').AsString = EC_CANCELADA) or
                (FieldByName('co_estado').AsString = EC_NO_SE_COTIZA) or
                (FieldByName('co_estado').AsString = EC_CERRADA_SIN_INFORMACION) or
                (FieldByName('co_estado').AsString = EC_CERRADO_AUTOMATICO), nil,
                'La cotización ya ha sido cerrada.');

      if (MsgBox('¿ Realmente desea cancelar esta cotización ?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
//          fraMotivoCancelacion.Hide;
          fraMotivoCancelacion.Clave := 'COTMC';
          fraMotivoCancelacion.ExtraCondition := 'AND tb_codigo IN (''03'', ''05'')';
          fraMotivoCancelacion.ClearGrid;

          edSC_OBSERVACIONESCIERRE.Lines.Clear;
          fpCierre.Caption := 'Cerrando solicitud';
          if fpCierre.ShowModal = mrOk then
          begin
            sSql :=
              'UPDATE asc_solicitudcotizacion' +
                ' SET sc_observacionescierre = :observacionescierre,' +
                    ' sc_usubaja = :usubaja,' +
                    ' sc_motcancelacion = ''03'',' +
                    ' sc_estado = :estado,' +
                    ' sc_fechacierre = SYSDATE,' +
                    ' sc_fechavigencia = SYSDATE' +
              ' WHERE sc_id = :id';
            EjecutarSqlSTEx(sSql, [edSC_OBSERVACIONESCIERRE.Lines.Text, Sesion.UserID, EC_CANCELADA, FieldByName('sc_id').AsInteger]);
            sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
            EjecutarSqlSTEx(sSql, [FieldByName('sc_id').AsInteger]);

            // Cierra la cotizacion..
            sSql :=
              'UPDATE aco_cotizacion' +
                ' SET co_estado = :estado,' +
                    ' co_fechacerrado = SYSDATE,' +
                    ' co_usucerrado = :usucerrado' +
              ' WHERE co_id = :id';
            EjecutarSqlSTEx(sSql, [EC_CANCELADA, Sesion.UserID, FieldByName('co_id').AsInteger]);

            if not FieldByName('co_id').IsNull then
              UpdateCO_ESTADO(FieldByName('co_id').AsInteger, EC_CANCELADA, False);

            sSql :=
              'SELECT NVL(se_mail, se_usuario) email' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario = :usuario' +
          ' UNION ALL' +
             ' SELECT uw_mailavisoart' +
               ' FROM auw_usuarioweb' +
              ' WHERE uw_usuario = :usuario2';
            sDirecciones := ValorSqlEx(sSql, [FieldByName('ususolicito').AsString, Copy(FieldByName('ususolicito').AsString, 3, 1000)]);

            sSql :=
              'SELECT   tc_observaciones' +
                 ' FROM atc_tarifacobrar' +
                ' WHERE tc_idcotizacion = :idcotizacion' +
             ' ORDER BY tc_id DESC';
            sObservacionesParaComercial := ValorSqlEx(sSql, [FieldByName('co_id').AsInteger]);

            sMensaje := 'Nro. Solicitud: ' + FieldByName('sc_nrosolicitud').AsString + CRLF +
                        'CUIT: ' + FieldByName('co_cuit').AsString + CRLF +
                        'Razón Social: ' + FieldByName('co_razonsocial').AsString + CRLF +
                        'Motivo No Cotización: Error de carga' + CRLF +
                        'Canal: ' + FieldByName('ca_descripcion').AsString + CRLF +
                        'Entidad: ' + FieldByName('en_nombre').AsString + CRLF +
                        'Sucursal: ' + FieldByName('su_descripcion').AsString + CRLF +
                        'Observaciones: ' + edSC_OBSERVACIONESCIERRE.Lines.Text + CRLF + CRLF +
                        'Observaciones para el Área Comercial: ' + sObservacionesParaComercial + CRLF + CRLF;
            NotificacionPorMail('COMERCIAL', sMensaje, 'Cotización cancelada', 'ASC', FieldByName('sc_id').AsInteger, sDirecciones);
          end;
          CommitTrans;
          ActualizaConsulta;
//          fraMotivoCancelacion.Show;
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.tbPrevencionClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.Eof) then
  begin
    try
      frmDatosPrevencion.Show;
    except
      frmDatosPrevencion := TfrmDatosPrevencion.Create(Self);
    end;

    frmDatosPrevencion.DoCargar(sdqConsulta.FieldByName('co_id').AsInteger);
  end;
end;

procedure TfrmConsultaCotizacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Clear;

  chkSoloTecnica.Checked := False;

  cmbCO_FECHACONFECCIONODesde.Clear;
  cmbCO_FECHACONFECCIONOHasta.Clear;

  cmbSC_FECHASUSPDESDE.Clear;
  cmbSC_FECHASUSPHASTA.Clear;

  cmbSC_FECHASOLICITUDDesde.Clear;
  cmbSC_FECHASOLICITUDHasta.Clear;
  cmbCO_FECHACERRADODesde.Clear;
  cmbCO_FECHACERRADOHasta.Clear;

  fraCO_IDACTIVIDAD.Clear;
  edCO_RAZONSOCIAL.Clear;
  edCO_CUIT.Clear;
  rbAmbos.Checked := True;
  cmbSC_ESTADO.Clear;
  rbCostoTodos.Checked := True;
  fraUsuarioAutorizacion.Clear;
  fraMotivoSuspension.Clear;
  edCantRegistros.Clear;
  chkcmbArtAnterior.Clear;
  fraHoldingBuscar.Clear;
  rbTieneHoldingIndistinto.Checked :=  True;
  checkConTarifaCargada.Checked := False;
  checkPrestacionesEspeciales.Checked := False;
  fraProbabilidadCierreNegocio.Clear;
  fraSC_ENTIDAD.Clear;
  fraUsuarioAsignado.Clear;
  fraSC_CANAL.Clear;
  fraEN_IDEJECUTIVO.Clear;
  chkCantTrab1.Checked := False;
  chkCantTrab2.Checked := False;
  chkCantTrab3.Checked := False;
  chkCantTrab4.Checked := False;
  chkCantTrab5.Checked := False;
  chkCantTrab6.Checked := False;
  chkCantTrab7.Checked := False;
  edOtrosDesde.Clear;
  edOtrosHasta.Clear;
end;

procedure TfrmConsultaCotizacion.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbNoSeCotiza.Enabled               	  := AEnabled and Seguridad.Activar(tbNoSeCotiza);
  tbCerrarCotizacion.Enabled            := AEnabled and Seguridad.Activar(tbCerrarCotizacion);
  tbPrevencion.Enabled                  := AEnabled and Seguridad.Activar(tbPrevencion);
  tbAutorizarYNotificar.Enabled         := AEnabled and Seguridad.Activar(tbAutorizarYNotificar);
  tbAsignar.Enabled                     := AEnabled and Seguridad.Activar(tbAsignar);
  tbSolicitudInfo.Enabled               := AEnabled and Seguridad.Activar(tbSolicitudInfo);
  tbCambiarUsuarioAutorizacion2.Enabled := Seguridad.Claves.IsActive('CambiarUsuarioAutorizacionAlternativo');
end;

procedure TfrmConsultaCotizacion.AprobarCotizacion;
var
  aFrmAdminCotizacion: TfrmAdminCotizacion;
  aSqlTarifa: TSql;
  cPorcSSN: Currency;
  cTarSSN: Currency;
  eIndiceCombinado: Extended;
  iIdTarifa: Integer;
  iLoop: Integer;
  sIdTipoRiesgo: String;
  sSql: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'Debe seleccionar algún registro.');

  if frmAdminCotizacion = nil then
  begin
    aFrmAdminCotizacion := TfrmAdminCotizacion.Create(Self);
    aFrmAdminCotizacion.Left := 2607;
    aFrmAdminCotizacion.Top := 2607;
  end
  else
    aFrmAdminCotizacion := frmAdminCotizacion;

  sdqConsulta.DisableControls;
  with sdqConsulta do
  try
    // Valido..
    for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
    begin
      First;
      Verificar((not Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

      Verificar((FieldByName('co_estado').AsString <> EC_PEND_AUTORIZ) and
                (FieldByName('co_estado').AsString <> EC_AUTORIZADA), nil,
                Format('[Cotización Nº %s] El estado no es "Pendiente Autorización" o "Autorizada".', [FieldByName('nrocotiorden').AsString]));

      sSql :=
        'SELECT ac_idtiporiesgo' +
         ' FROM cac_actividad' +
        ' WHERE ac_id = :codigo';
      sIdTipoRiesgo := ValorSqlEx(sSql, [FieldByName('co_idactividad').AsInteger]);

{
Se comenta esta validación el 8.11.2011 a pedido de MMAGALLANES por vía telefónica..
      sSql :=
        'SELECT 1' +
         ' FROM art.aac_autorizacotiza' +
        ' WHERE :p1 BETWEEN ac_capitasdesde AND ac_capitashasta' +
          ' AND INSTR('','' || ac_srt || '','', :p2) > 0' +
          ' AND INSTR('','' || ac_bcra || '','', :p3) > 0' +
          ' AND INSTR('','' || ac_riesgo || '','', :p4) > 0' +
          ' AND INSTR('','' || ac_usuarionotificacion || '','', :p5) > 0' +
          ' AND ac_fechabaja IS NULL';
      Verificar(not ExisteSqlEx(sSql, [FieldByName('co_canttrabajador').AsInteger,
                                       ',' + FieldByName('co_statussrt').AsString + ',',
                                       ',' + FieldByName('idstatusbcra').AsString + ',',
                                       ',' + sIdTipoRiesgo + ',',
                                       Sesion.UserID]), nil, Format('[Cotización Nº %s] Usted no tiene nivel para autorizar esta cotización.', [FieldByName('nrocotiorden').AsString]));
}

      Verificar(FieldByName('tc_sumafija').AsFloat < 0, nil, Format('[Cotización Nº %s] La suma fija debe ser superior o igual a cero.', [FieldByName('nrocotiorden').AsString]));
      Verificar(FieldByName('tc_porcvariable').AsFloat < 0, nil, Format('[Cotización Nº %s] El porcentaje debe ser superior o igual a cero.', [FieldByName('nrocotiorden').AsString]));
      Verificar(FieldByName('tc_porcvariable').AsFloat > 100, nil, Format('[Cotización Nº %s] El porcentaje debe ser inferior a 100.', [FieldByName('nrocotiorden').AsString]));
      Verificar(FieldByName('tc_costofinal').AsFloat <= 0, nil, Format('[Cotización Nº %s] El costo final debe ser superior a cero.', [FieldByName('nrocotiorden').AsString]));
{
      if (FieldByName('co_cargamanualic').AsString <> 'S') then
        eIndiceCombinado := aFrmAdminCotizacion.CalcularIndiceCombinado(FieldByName('co_canttrabajador').AsInteger,
                                                                        FieldByName('co_idactividad').AsInteger,
                                                                        FieldByName('co_id').AsInteger,
                                                                        FieldByName('co_masasalarial').AsFloat,
                                                                        FieldByName('tc_costofinal').AsFloat);
      Verificar((eIndiceCombinado < 100) and (FieldByName('co_porcvariablepiso').AsFloat > FieldByName('tc_porcvariable').AsFloat), nil, Format('[Cotización Nº %s] El costo variable de la tarifa piso tiene que ser menor al costo variable de la tarifa sugerida.', [FieldByName('nrocotiorden').AsString]));
}
      TarifaSSN(FieldByName('co_nivel').AsString, FieldByName('co_idactividad').AsInteger, Date, cTarSSN, cPorcSSN);
      cTarSSN := cTarSSN * 1.15 + 0.60;
      cPorcSSN := cPorcSSN * 1.15;

      sSql :=
        'SELECT 1' +
         ' FROM acz_cotizador' +
        ' WHERE ((:sumafija - 0.6) / (:masasalarial / :canttrabajador * 100) + :porcvariable) BETWEEN cz_limitessnminimo AND cz_limitessnmaximo' +
          ' AND cz_idcotizacion = :idcotizacion';
      if not ExisteSqlEx(sSql, [FieldByName('tc_sumafija').AsFloat,
                                FieldByName('co_masasalarial').AsFloat,
                                FieldByName('co_canttrabajador').AsInteger,
                                FieldByName('tc_porcvariable').AsFloat,
                                FieldByName('co_id').AsInteger]) then
        if MsgBox(Format('[Cotización Nº %s] El porcentaje variable se encuentra por fuera de los límites de la SSN según la resolución 38064/2013. ¿ Desea continuar ?', [FieldByName('nrocotiorden').AsString]), MB_YESNO + MB_ICONSTOP, 'Aviso importante') <> MRYES then
          Abort;

      if FieldByName('tc_sumafija').AsFloat > cTarSSN then
        Verificar(not MsgAsk(Format('[Cotización Nº %s] La suma fija se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', [FieldByName('nrocotiorden').AsString])), nil, '');

      if FieldByName('tc_porcvariable').AsFloat > cPorcSSN then
        Verificar(not MsgAsk(Format('[Cotización Nº %s] El porcentaje se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', [FieldByName('nrocotiorden').AsString])), nil, '');
    end;

    // Autorizo..
    aSqlTarifa := TSql.Create('atc_tarifacobrar');
    try
      BeginTrans;

      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      try
        First;
        Verificar((not Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

        sSql :=
          'SELECT MAX(tc_id)' +
           ' FROM atc_tarifacobrar' +
          ' WHERE tc_idcotizacion = :idcotizacion';
        iIdTarifa := ValorSqlIntegerEx(sSql, [FieldByName('co_id').AsInteger]);

        aSqlTarifa.Clear;
        aSqlTarifa.SqlType := stUpdate;
        aSqlTarifa.PrimaryKey.Add('tc_id', iIdTarifa, False);

        aSqlTarifa.Fields.Add('tc_fechaautorizacion', SQL_ACTUALDATE, False);
        aSqlTarifa.Fields.Add('tc_usuautorizacion',   FieldByName('co_usuarioautorizacion').AsString);

        EjecutarSqlST(aSqlTarifa.Sql);

        // Actualizo el indice combinado..
        if (FieldByName('co_cargamanualic').AsString <> 'S') then
        begin
          eIndiceCombinado := aFrmAdminCotizacion.CalcularIndiceCombinado(FieldByName('co_canttrabajador').AsInteger,
                                                                          FieldByName('co_idactividad').AsInteger,
                                                                          FieldByName('co_id').AsInteger,
                                                                          FieldByName('co_masasalarial').AsFloat,
                                                                          FieldByName('tc_costofinal').AsFloat);
          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET co_indicecombinado = :indicecombinado' +
            ' WHERE co_id = :id';
          EjecutarSqlSTEx(sSql, [eIndiceCombinado, FieldByName('co_id').AsInteger]);
        end;

        // Actualizo el estado de la cotización..
        sSql :=
          'UPDATE aco_cotizacion' +
            ' SET co_estado = :estado,' +
                ' co_comision = :comision' +
          ' WHERE co_id = :id';
        EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, FieldByName('co_comision').AsFloat, FieldByName('co_id').AsInteger]);

        // Actualizo el estado de la solicitud asociada..
        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado' +
          ' WHERE sc_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, FieldByName('co_id').AsInteger]);
        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [FieldByName('co_id').AsInteger]);
      except
        on E: Exception do
        begin
          RollBack;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;

      CommitTrans;

      tbRefrescarClick(nil);

      MsgBox('Las cotizaciones han sido autorizadas correctamente.');
    finally
      aSqlTarifa.Free;
    end;
  finally
    EnableControls;

    if frmAdminCotizacion = nil then
      FreeAndNil(aFrmAdminCotizacion);
  end;
end;

procedure TfrmConsultaCotizacion.tbAprobarClick(Sender: TObject);
begin
  AprobarCotizacion;
end;

procedure TfrmConsultaCotizacion.tbCerrarCotizacionClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  with sdqConsulta do
  begin
    DisableControls;
    try
      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        First;
        Verificar((not Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));
        Verificar(FieldByName('co_estado').AsString <> EC_AUTORIZADA, Grid, Format('[Cotización Nº %s] El estado no es "Autorizada".', [FieldByName('nrocotiorden').AsString]));
        Verificar((FieldByName('tc_costofinal').AsCurrency < 0.6), Grid, Format('[Cotización Nº %s] La Prima x Persona no puede ser inferior a $0,60.', [FieldByName('nrocotiorden').AsString]));
        Verificar((FieldByName('tc_sumafija').AsCurrency < 0.6), Grid, Format('[Cotización Nº %s] La Suma Fija no puede ser inferior a $0,60.', [FieldByName('nrocotiorden').AsString]));
        // Se cambio el AsFloat por AsCurrency ya que sino aproxima mal el 0.6 (5.9999999..)

        if Sesion.UserID <> 'FMFIRENZE' then
        begin
          sSql :=
            'SELECT   tc_usualta' +
               ' FROM atc_tarifacobrar' +
              ' WHERE tc_idcotizacion = :idcotizacion' +
           ' ORDER BY tc_fechaalta DESC';
          Verificar((ValorSqlEx(sSql, [FieldByName('co_id').AsInteger]) = Sesion.UserID), Grid,
                     Format('[Cotización Nº %s] El usuario de carga de tarifa fue usted.', [FieldByName('nrocotiorden').AsString]));
        end;
      end;

      if MsgBox('¿ Realmente desea notificar a Comercial ?', MB_YESNO) = mrYes then
      begin
        BeginTrans;
        try
          for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
          begin
            First;
            Verificar((not Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

            if not NotificarAComercial then
              raise Exception.Create('El servidor de PDF no está disponible, reintente en unos minutos.');
          end;
          CommitTrans(True);
          MessageDlg('La operación se ha efectuado correctamente.', mtInformation, [mbOK], 0);
          ActualizaConsulta;
        except
          on E: Exception do
          begin
            RollBack(True);
            MessageDlg('ERROR FATAL, por favor informe a Sistemas.' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  sEstado: String;
  sSql: String;
begin
  inherited;

  AFont.Size  := 8;
  AFont.Style := [];

  if HighLight then
    AFont.Color := clWhite
  else
  begin
    sEstado := sdqConsulta.FieldByName('co_estado').AsString;

    if (sEstado = EC_ASIGNADA) or (sEstado = EC_PEND_COTIZ) or (sEstado = EC_CLONADA) then
      AFont.Color := clGray;

    if (sEstado = EC_AUTORIZADA) or (sEstado = EC_EN_PREPARACION) or (sEstado = EC_SUSPENDIDA) then
      AFont.Color := clBlack;

    if (sEstado = EC_SOLICITUD_AFILIACION_TRAMITE) or (sEstado = EC_TRASPASO_TRAMITE) or (sEstado = EC_CERRADA_BIEN) or
       (sEstado = EC_CERRADA_CONTRATO_ART) or (sEstado = EC_TARIFA_APROBADA) then
      AFont.Color := clGreen;

    if (sEstado = EC_CANCELADA) or (sEstado = EC_CON_ERRORES) or (sEstado = EC_NO_SE_COTIZA) or
       (sEstado = EC_SOLIC_AFI_ANULADA) or (sEstado = EC_SOLICITUD_RECHAZADA_DEUDA) or
       (sEstado = EC_CERRADA_SIN_INFORMACION) or (sEstado = EC_DATOS_FALTANTES) then
      AFont.Color := clRed;

    if (sEstado = EC_PEND_AUTORIZ) then
      AFont.Color := TColor($4080FF);

    if (sEstado = EC_NOTIF_COMERCIAL) or (sEstado = EC_NOTIF_CLIENTE) then
      AFont.Color := clPurple;

    if (sEstado = EC_CERRADA_TRASPASO_OBJETADO) or (sEstado = EC_CERRADA_VENCIDA_CON_IMPRESION) or
       (sEstado = EC_CERRADA_VENCIDA_SIN_IMPRESION) or (sEstado = EC_CERRADA_COMERCIALIZADOR) or
       (sEstado = EC_CERRADO_AUTOMATICO) or (sEstado = EC_CERRADA_SOLICITA_NUEVA) or (sEstado = EC_CERRADA_MAL) then
      AFont.Color := clBlue;

    if (Field <> nil) and (Field.FieldName = 'CO_CUIT') then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM art.acn_cuitnoautomatico' +
        ' WHERE cn_cuit = :cuit' +
          ' AND cn_fechabaja IS NULL';
      if ExisteSqlEx(sSql, [Field.AsString]) then
      begin
        AFont.Color := StringToColor('$00CF23E2');
        AFont.Size  := 10;
        AFont.Style := [fsBold];
      end;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.tbAsignarClick(Sender: TObject);
var
  iLoop: Integer;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'Debe seleccionar algún registro.');

  with sdqConsulta do
  begin
    DisableControls;
    try
      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        First;
        Verificar((not Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

        Verificar((not Active) or (Eof) or
                  (((FieldByName('co_estado').AsString <> EC_PEND_COTIZ) and
                    (FieldByName('co_estado').AsString <> EC_SOLIC_A_REVISAR) and
                    (FieldByName('co_estado').AsString <> EC_ASIGNADA) and
                    (FieldByName('co_estado').AsString <> EC_CON_ERRORES) and
                    (FieldByName('co_estado').AsString <> EC_EN_PREPARACION))), Grid,
                  Format('[Solicitud Nº %d] El estado no es correcto para asignar usuario.', [FieldByName('sc_nrosolicitud').AsInteger]));
      end;
    finally
      EnableControls;
    end;

    frafpSC_USUASIGNADO.Value := FieldByName('usuasignado').AsString;
    fpAsignar.ShowModal;
  end;
end;

procedure TfrmConsultaCotizacion.btnAceptar2Click(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  if frafpSC_USUASIGNADO.IsEmpty then
    Verificar((sdqConsulta.FieldByName('co_estado').AsString <> EC_ASIGNADA) and
              (sdqConsulta.FieldByName('co_estado').AsString <> EC_EN_PREPARACION) and
              (sdqConsulta.FieldByName('co_estado').AsString <> EC_PEND_COTIZ), btnAceptar2,
              Format('Una solicitud en estado %s no puede quedar desasiganda.', [sdqConsulta.FieldByName('estado').AsString]));

  sdqConsulta.DisableControls;
  BeginTrans;
  try
    try
      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        sdqConsulta.First;
        Verificar((not sdqConsulta.Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_usuasignado = :usuasignado,' +
                ' sc_estado = :estado' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [frafpSC_USUASIGNADO.Value, IIF(frafpSC_USUASIGNADO.IsEmpty, EC_PEND_COTIZ, EC_ASIGNADA),
                               sdqConsulta.FieldByName('sc_id').AsInteger]);
        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

        sSql :=
          'UPDATE aco_cotizacion' +
            ' SET co_estado = :p1' +
          ' WHERE co_id = :p2';
        EjecutarSqlSTEx(sSql, [IIF(frafpSC_USUASIGNADO.IsEmpty, EC_PEND_COTIZ, EC_ASIGNADA),
                               sdqConsulta.FieldByName('co_id').AsInteger]);
      end;
      CommitTrans;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);

      if frafpSC_USUASIGNADO.IsEmpty then
        InfoHint(btnAceptar2, 'Se ha desasignado la solicitud.', False, 'Información', blnInfo, 5);

      ActualizaConsulta;
      fpAsignar.ModalResult := mrOk;
    except
      on E:Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmConsultaCotizacion.btnCancelar2Click(Sender: TObject);
begin
  inherited;

  fpAsignar.ModalResult := mrCancel;
end;

procedure TfrmConsultaCotizacion.btnCancelar3Click(Sender: TObject);
begin
  fpCierre.ModalResult := mrCancel;
end;

procedure TfrmConsultaCotizacion.btnAceptar3Click(Sender: TObject);
begin
  Verificar((fraMotivoCancelacion.Visible) and (fraMotivoCancelacion.IsEmpty), fraMotivoCancelacion.edCodigo, 'El campo Motivo es obligatorio.');
  Verificar((Trim(edSC_OBSERVACIONESCIERRE.Lines.Text) = ''), edSC_OBSERVACIONESCIERRE, 'El campo Observaciones es obligatorio.');

  fpCierre.ModalResult := mrOk;
end;

procedure TfrmConsultaCotizacion.tbSolicitudInfoClick(Sender: TObject);
var
  sEstado: String;
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.Eof, nil, 'Debe elegir un registro.');
  Verificar((FRegistrosSeleccionados.Count <> 1), Grid, 'Debe seleccionar solo un registro.');

  sdqConsulta.First;
  Verificar((not sdqConsulta.Locate('sc_id', FRegistrosSeleccionados[0], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[0]]));

  sEstado := sdqConsulta.FieldByName('co_estado').AsString;
  Verificar((sEstado = EC_NOTIF_COMERCIAL) or (sEstado = EC_CANCELADA) or (sEstado = EC_NOTIF_CLIENTE) or
            (sEstado = EC_CERRADA_MAL) or (sEstado = EC_CERRADA_BIEN) or (sEstado = EC_CON_ERRORES) or
            (sEstado = EC_NO_SE_COTIZA) or (sEstado = EC_CERRADA_SIN_INFORMACION) or (sEstado = EC_CERRADO_AUTOMATICO), nil,
            'La solicitud no se encuentra en el estado correcto.');

  if (sEstado = EC_SUSPENDIDA) then
  begin
    if MsgAsk('¿ Realmente desea levantar la suspensión ?') then
    begin
      BeginTrans;
      try
        UpdateCO_ESTADO(sdqConsulta.FieldByName('co_id').AsInteger, sdqConsulta.FieldByName('co_estadoanterior').AsString, False);

        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado,' +
                ' sc_fechasusphasta = SYSDATE' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('co_estadoanterior').AsString, sdqConsulta.FieldByName('sc_id').AsInteger]);
        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

        CommitTrans;
        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        ActualizaConsulta;
      except
        on E: Exception do
        begin
          Rollback;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
  end
  else
    Suspender;
end;

procedure TfrmConsultaCotizacion.btnEnviarMailClick(Sender: TObject);
begin
  Verificar(fraMotivo.IsEmpty, fraMotivo.edCodigo, 'Debe seleccionar el motivo del mensaje.');
  Verificar(fraDestinatario.IsEmpty, fraDestinatario.edCodigo, 'Debe seleccionar el destinatario del mensaje.');
  Verificar((fraMotivo.Value = 2) and (fraDestinatario.Codigo <> 'GRUPO'), fraDestinatario.edCodigo, 'Si seleccionó "Pedir información a Prevención" debe seleccionar como destinatario al GRUPO.');
  Verificar((fraMotivo.Value <> 2) and (fraDestinatario.Codigo = 'GRUPO'), fraDestinatario.edCodigo, 'Si seleccionó "' + fraMotivo.Descripcion + '" no puede seleccionar como destinatario al GRUPO.');
  Verificar(edMail.Lines.Text = '', edMail, 'Debe ingresar el texto del mensaje.');
  fpMail.ModalResult := mrOk;
end;

procedure TfrmConsultaCotizacion.btnCancelarMailClick(Sender: TObject);
begin
  fpMail.ModalResult := mrCancel;
end;

procedure TfrmConsultaCotizacion.ActualizaConsulta;
begin
  if sdqConsulta.Active then
  begin
    sdqConsulta.Refresh;
    CheckButtons;
    btnDesmarcarTodos(nil);
  end
  else
    tbRefrescarClick(nil);
end;

procedure TfrmConsultaCotizacion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '$ ');
end;

procedure TfrmConsultaCotizacion.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
      begin
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
        edCantRegistros.Value := sdqConsulta.RecordCount;
      end
      else
        edCantRegistros.Value := 0;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmConsultaCotizacion.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmConsultaCotizacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
  begin
    if Active and not Eof then
    begin
      FieldByName('co_autocostofinal').OnGetText       := FormateaTexto;
      FieldByName('co_autoporcvariable').OnGetText     := FormateaTexto;
      FieldByName('co_autosumafija').OnGetText         := FormateaTexto;
      FieldByName('co_costofinalanterior').OnGetText   := FormateaTexto;
      FieldByName('co_costotecnico').OnGetText         := FormateaTexto;
      FieldByName('co_masasalarial').OnGetText         := FormateaTexto;
      FieldByName('co_porcvariableanterior').OnGetText := FormateaTexto;
      FieldByName('co_sumafijaanterior').OnGetText     := FormateaTexto;
      FieldByName('costotecnicovscotizada').OnGetText  := FormateaTexto;

      FieldByName('difplata').OnGetText                := FormateaTexto;
      FieldByName('difplatamensual').OnGetText         := FormateaTexto;
      FieldByName('primamensual').OnGetText            := FormateaTexto;
      FieldByName('primamensualcomp').OnGetText        := FormateaTexto;
      FieldByName('tc_costofinal').OnGetText           := FormateaTexto;
      FieldByName('tc_porcvariable').OnGetText         := FormateaTexto;
      FieldByName('tc_sumafija').OnGetText             := FormateaTexto;


      TDateTimeField(FieldByName('sc_fechasolicitud')).DisplayFormat := 'dd/mm/yyyy hh:nn';
      TDateTimeField(FieldByName('co_fechacerrado')).DisplayFormat   := 'dd/mm/yyyy hh:nn';
      TDateTimeField(FieldByName('sc_fecharespuesta')).DisplayFormat := 'dd/mm/yyyy hh:nn';
      TDateTimeField(FieldByName('sc_fechasuspdesde')).DisplayFormat := 'dd/mm/yyyy hh:nn';
      TDateTimeField(FieldByName('sc_fechasusphasta')).DisplayFormat := 'dd/mm/yyyy hh:nn';
      TDateTimeField(FieldByName('sc_fechabaja')).DisplayFormat      := 'dd/mm/yyyy hh:nn';

      TFloatField(FieldByName('aumentoaplicado')).DisplayFormat       := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('co_acpo')).DisplayFormat               := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('co_comision')).DisplayFormat           := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('co_comisionpiso')).DisplayFormat       := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('co_costofinalpiso')).DisplayFormat     := '$ ,0.00;$ -,0.00';
      TFloatField(FieldByName('co_porcvariablepiso')).DisplayFormat   := ',0.000 %;-,0.000 %';
      TFloatField(FieldByName('co_sumafijapiso')).DisplayFormat       := '$ ,0.00;$ -,0.00';
      TFloatField(FieldByName('explotacionfijos')).DisplayFormat      := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('cz_frecuenciaesperada')).DisplayFormat := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('descuentoaplicado')).DisplayFormat     := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('difporc')).DisplayFormat               := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('dt_frecuencia')).DisplayFormat         := ',0.00 %;-,0.00 %';
      TFloatField(FieldByName('indicecombinado')).DisplayFormat       := ',0.00 %;-,0.00 %';
    end;
  end;
end;

procedure TfrmConsultaCotizacion.FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  try
    if AreIn(Sender.FieldName, ['difplata', 'difplatamensual', 'co_masasalarial', 'co_sumafijaanterior',
                                'co_costofinalanterior', 'primamensualcomp', 'primamensual', 'co_autocostofinal',
                                'co_autosumafija', 'co_costotecnico', 'costotecnicovscotizada', 'co_sumafijapiso',
                                'co_costofinalpiso']) then
      Text := Get_AjusteDecimales(Sender.AsString, '$ ', 2, True)
    else if AreIn(Sender.FieldName,['tc_costofinal', 'tc_sumafija']) then
      Text := Get_AjusteDecimales(Sender.AsString, '$ ', 2, False)
    else if AreIn(Sender.FieldName, ['tc_porcvariable']) then
      Text := Get_AjusteDecimales(Sender.AsString, '% ', 4, False)
    else if AreIn(Sender.FieldName, ['co_porcvariableanterior', 'co_autoporcvariable', 'co_porcvariablepiso']) then
      Text := Get_AjusteDecimales(Sender.AsString, '% ', 4, True)
    else if AreIn(LowerCase(Sender.FieldName), ['co_comision', 'difporc', 'co_comisionpiso']) then
      Text := Get_AjusteDecimales(Sender.AsString, '% ', 2, True)
    else
      Text := Sender.AsString;
  except
    Text := Sender.AsString;
  end;

  if Trim(Text) = '' then
    Text := '0';
end;

procedure TfrmConsultaCotizacion.fraSC_CANALExit2(Sender: TObject);
begin
  inherited;

  fraSC_CANAL.FrameExit(Sender);
  fraSC_ENTIDAD.Canal := fraSC_CANAL.Value;
end;

procedure TfrmConsultaCotizacion.fraSC_ENTIDADExit(Sender: TObject);
begin
  inherited;

  fraSC_ENTIDAD.FrameExit(Sender);
end;

procedure TfrmConsultaCotizacion.edCO_CUITExit(Sender: TObject);
begin
  Verificar((Length(edCO_CUIT.Text) = 11) and not(IsCuit(edCO_CUIT.Text)), edCO_CUIT, 'La C.U.I.T. no es correcta.');
end;

procedure TfrmConsultaCotizacion.CargarArtAnteriores;
var
  ID: TCadena;
  sSql: String;
begin
  sSql :=
    'SELECT DISTINCT ar_id, ar_nombre' +
     ' FROM aar_art' +
 ' ORDER BY ar_nombre';

  with GetQuery(sSql) do
  try
    chkcmbArtAnterior.Items.Clear;
    while not Eof do
    begin
      ID := TCadena.Create();
      ID.Valor := FieldByName('ar_id').AsString;
      chkcmbArtAnterior.Items.AddObject(FieldByName('ar_id').AsString + ' - ' + FieldByName('ar_nombre').AsString, ID);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaCotizacion.tbCambiarUsuarioAutorizacionClick(Sender: TObject);
var
  sSql: String;
begin
  if fpCambiarUsuarioAutorizacion.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_autorizagerencia = ''S'',' +
            ' co_usuarioautorizacion = :usuarioautorizacion,' +
            ' co_puestoautorizacion = :puestoautorizacion,' +
            ' co_usuariocambiousuautoriza = :usuariocambio' +
      ' WHERE co_id = :id';
    EjecutarSqlEx(sSql, [fraUsuario.Descripcion,
                         fraUsuario.sdqDatos.FieldByName('ac_puesto').AsInteger,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('co_id').AsInteger]);
    ActualizaConsulta;
  end;
end;

procedure TfrmConsultaCotizacion.tbNoSeCotizaClick(Sender: TObject);
var
  Mensaje: String;
  sDirecciones: String;
  sObservacionesParaComercial: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if (Active) and (not Eof) then
    begin
      Verificar((FieldByName('co_estado').AsString = EC_NOTIF_COMERCIAL) or
                (FieldByName('co_estado').AsString = EC_NOTIF_CLIENTE) or
                (FieldByName('co_estado').AsString = EC_CERRADA_MAL), nil,
                'La cotización ya fue enviada a comercial.');

      Verificar((FieldByName('co_estado').AsString = EC_CANCELADA) or
                (FieldByName('co_estado').AsString = EC_NO_SE_COTIZA) or
                (FieldByName('co_estado').AsString = EC_CERRADA_SIN_INFORMACION) or
                (FieldByName('co_estado').AsString = EC_CERRADO_AUTOMATICO), nil,
                'La cotización ya ha sido cerrada.');

      if (MsgBox('¿ Realmente desea pasar esta cotización a estado "No se Cotiza" ?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
          fraMotivoCancelacion.Clave := 'COTMC';
          fraMotivoCancelacion.ClearGrid;
          edSC_OBSERVACIONESCIERRE.Lines.Clear;
          fpCierre.Caption := 'Cerrando solicitud';
          if fpCierre.ShowModal = mrOk then
          begin
            sSql :=
              'UPDATE asc_solicitudcotizacion' +
                ' SET sc_observacionescierre = :observacionescierre,' +
                    ' sc_usubaja = :usubaja,' +
                    ' sc_motcancelacion = :motcancelacion,' +
                    ' sc_estado = :estado,' +
                    ' sc_fechacierre = SYSDATE,' +
                    ' sc_fechavigencia = SYSDATE' +
              ' WHERE sc_id = :id';
            EjecutarSqlSTEx(sSql, [edSC_OBSERVACIONESCIERRE.Lines.Text, Sesion.UserID, fraMotivoCancelacion.Value, EC_NO_SE_COTIZA, FieldByName('sc_id').AsInteger]);
            sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
            EjecutarSqlSTEx(sSql, [FieldByName('sc_id').AsInteger]);

            // Cierra la cotizacion..
            sSql :=
              'UPDATE aco_cotizacion' +
                ' SET co_estado = :estado,' +
                    ' co_fechacerrado = SYSDATE,' +
                    ' co_usucerrado = :usucerrado' +
              ' WHERE co_id = :id';
            EjecutarSqlSTEx(sSql, [EC_NO_SE_COTIZA, Sesion.UserID, FieldByName('co_id').AsInteger]);

            if not sdqConsulta.FieldByName('co_id').IsNull then
              UpdateCO_ESTADO(FieldByName('co_id').AsInteger, EC_NO_SE_COTIZA, False);

            sSql :=
              'SELECT NVL(se_mail, se_usuario) email' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario = :usuario' +
          ' UNION ALL' +
             ' SELECT uw_mailavisoart' +
               ' FROM auw_usuarioweb' +
              ' WHERE uw_usuario = :usuario2';
            sDirecciones := ValorSqlEx(sSql, [FieldByName('ususolicito').AsString, Copy(FieldByName('ususolicito').AsString, 3, 1000)]);

            sSql :=
              'SELECT   tc_observaciones' +
                 ' FROM atc_tarifacobrar' +
                ' WHERE tc_idcotizacion = :idcotizacion' +
             ' ORDER BY tc_id DESC';
            sObservacionesParaComercial := ValorSqlEx(sSql, [FieldByName('co_id').AsInteger]);

            Mensaje := 'Nro. Solicitud: ' + FieldByName('sc_nrosolicitud').AsString + CRLF +
                       'C.U.I.T.: ' + FieldByName('co_cuit').AsString + CRLF +
                       'Razón Social: ' + FieldByName('co_razonsocial').AsString + CRLF +
                       'Motivo No Cotización: ' + fraMotivoCancelacion.cmbDescripcion.Text + CRLF +
                       'Canal: ' + FieldByName('ca_descripcion').AsString + CRLF +
                       'Entidad: ' + FieldByName('en_nombre').AsString + CRLF +
                       'Sucursal: ' + FieldByName('su_descripcion').AsString + CRLF +
                       'Observaciones: ' + edSC_OBSERVACIONESCIERRE.Lines.Text + CRLF + CRLF +
                       'Observaciones para el Área Comercial: ' + sObservacionesParaComercial + CRLF + CRLF;
            NotificacionPorMail('COMERCIAL', Mensaje, 'Cotización cancelada', 'ASC', FieldByName('sc_id').AsInteger, sDirecciones);
          end;
          CommitTrans;
          ActualizaConsulta;
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.mnuGrillaClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmConsultaCotizacion.mnuMinutaClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'No ha seleccionado ningún registro.');

  for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
  begin
    sSql :=
      'SELECT 1' +
       ' FROM asc_solicitudcotizacion, aco_cotizacion' +
      ' WHERE sc_idcotizacion = co_id' +
        ' AND co_estado IN (:p2, :p3)' +
        ' AND sc_id = :p4';
    Verificar(not ExisteSqlEx(sSql, [EC_NOTIF_CLIENTE, EC_NOTIF_COMERCIAL,
                                     SqlInt(FRegistrosSeleccionados[iLoop])]), Grid,
              'Solo puede seleccionar registros con cotización en estado ''Pendiente Autorización Comité'', ''Notificado al Cliente'' o ''Notificado a Comercial''.');
  end;

  Application.CreateForm(TqrMinutaComite, qrMinutaComite);
  try
    qrMinutaComite.Preparar(FRegistrosSeleccionados);
  finally
    FreeAndNil(qrMinutaComite);
  end;
end;

procedure TfrmConsultaCotizacion.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultaCotizacion.GridCellClick(Column: TColumn);
begin
  with sdqConsulta do
    if (Active) and (not IsEmpty) and (LowerCase(Column.FieldName) = 'checkbox') then
    begin
      if FRegistrosSeleccionados.IndexOf(FieldByName('sc_id').AsString) > -1 then
        FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(FieldByName('sc_id').AsString))
      else
        FRegistrosSeleccionados.Add(FieldByName('sc_id').AsString);
      Grid.Repaint;
    end;
end;

procedure TfrmConsultaCotizacion.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Item: TMenuItem;
  MenuGrilla: TPopUpMenu;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmConsultaCotizacion.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                    Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if LowerCase(Column.FieldName) = 'checkbox' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('sc_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmConsultaCotizacion.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('sc_id').AsString) > -1 then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;
end;

procedure TfrmConsultaCotizacion.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['checkbox']);
end;

procedure TfrmConsultaCotizacion.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;

procedure TfrmConsultaCotizacion.btnMarcarTodos(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('sc_id').AsString);
      Next;
    end;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;
end;

procedure TfrmConsultaCotizacion.FSFormDestroy(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Free;
end;

procedure TfrmConsultaCotizacion.tbAutorizarYNotificarClick(Sender: TObject);
var
  aFrmAdminCotizacion: TfrmAdminCotizacion;
  aSqlTarifa: TSql;
  eIndiceCombinado: Extended;
  iLoop: Integer;
//  sIdTipoRiesgo: String;
  sSql: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'Debe seleccionar algún registro.');

  if frmAdminCotizacion = nil then
  begin
    aFrmAdminCotizacion := TfrmAdminCotizacion.Create(Self);
    aFrmAdminCotizacion.Left := 2607;
    aFrmAdminCotizacion.Top := 2607;
  end
  else
    aFrmAdminCotizacion := frmAdminCotizacion;

  aSqlTarifa := TSql.Create('atc_tarifacobrar');
  aSqlTarifa.SqlType := stUpdate;

  sdqConsulta.DisableControls;

  try
    for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
    begin
      sdqConsulta.First;

      Verificar((not sdqConsulta.Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));
      Verificar((sdqConsulta.FieldByName('co_estado').AsString <> EC_PEND_AUTORIZ) and (sdqConsulta.FieldByName('co_estado').AsString <> EC_AUTORIZADA), Grid, Format('[Cotización Nº %s] El estado no está en "Pendiente Autorización".', [sdqConsulta.FieldByName('nrocotiorden').AsString]));
      Verificar((sdqConsulta.FieldByName('tc_costofinal').AsCurrency < 0.6), Grid, Format('[Cotización Nº %s] La Prima x Persona no puede ser inferior a $0,60.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));
      Verificar((sdqConsulta.FieldByName('tc_sumafija').AsCurrency < 0.6), Grid, Format('[Cotización Nº %s] La Suma Fija no puede ser inferior a $0,60.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));  //Ver que en el tbCerrarCotizacion la verificacion es <= Vila pidio cambiar solo ese.
      // Se cambio el AsFloat por AsCurrency ya que sino aproxima mal el 0.6 (5.9999999..)
{
Se comenta esta validación el 8.11.2011 a pedido de MMAGALLANES por vía telefónica..
      sSql :=
        'SELECT ac_idtiporiesgo' +
         ' FROM cac_actividad' +
        ' WHERE ac_id = :codigo';
      sIdTipoRiesgo := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_idactividad').AsInteger]);

      sSql :=
        'SELECT 1' +
         ' FROM art.aac_autorizacotiza' +
        ' WHERE :p1 BETWEEN ac_capitasdesde AND ac_capitashasta' +
          ' AND INSTR('','' || ac_srt || '','', :p2) > 0' +
          ' AND INSTR('','' || ac_bcra || '','', :p3) > 0' +
          ' AND INSTR('','' || ac_riesgo || '','', :p4) > 0' +
          ' AND INSTR('','' || ac_usuarionotificacion || '','', :p5) > 0' +
          ' AND ac_fechabaja IS NULL';
      Verificar(not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('co_canttrabajador').AsInteger,
                                       ',' + sdqConsulta.FieldByName('co_statussrt').AsString + ',',
                                       ',' + sdqConsulta.FieldByName('idstatusbcra').AsString + ',',
                                       ',' + sIdTipoRiesgo + ',',
                                       Sesion.UserID]), tbAutorizarYNotificar,
                                       Format('[Cotización Nº %s] Usted no tiene el nivel suficiente para realizar esta operación.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));
}
      if (Sesion.UserID <> 'FMFIRENZE') and (Sesion.UserID <> 'MMAGALLANES') then    // Excepciones pedidas por ticket 35971..
      begin
        sSql :=
          'SELECT   tc_usualta' +
             ' FROM atc_tarifacobrar' +
            ' WHERE tc_idcotizacion = :idcotizacion' +
         ' ORDER BY tc_fechaalta DESC';
        Verificar((ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]) = Sesion.UserID), Grid, Format('[Cotización Nº %s] El usuario de carga de tarifa fue usted.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));
      end;

      sSql :=
        'SELECT 1' +
         ' FROM acz_cotizador' +
        ' WHERE ((:sumafija - 0.6) / (:masasalarial / :canttrabajador * 100) + :porcvariable) BETWEEN cz_limitessnminimo AND cz_limitessnmaximo' +
          ' AND cz_idcotizacion = :idcotizacion';
      if not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('tc_sumafija').AsFloat,
                                sdqConsulta.FieldByName('co_masasalarial').AsFloat,
                                sdqConsulta.FieldByName('co_canttrabajador').AsInteger,
                                sdqConsulta.FieldByName('tc_porcvariable').AsFloat,
                                sdqConsulta.FieldByName('co_id').AsInteger]) then
        if MsgBox(Format('[Cotización Nº %s] El porcentaje variable se encuentra por fuera de los límites de la SSN según la resolución 38064/2013. ¿ Desea continuar ?', [sdqConsulta.FieldByName('nrocotiorden').AsString]), MB_YESNO + MB_ICONSTOP, 'Aviso importante') <> MRYES then
          Abort;

      // INICIO - Ticket 60746..
      Verificar((sdqConsulta.FieldByName('tc_costofinal').AsFloat < 0.6), Grid, Format('[Cotización Nº %s] El costo final no puede ser inferior a $0,60.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));

      if sdqConsulta.FieldByName('tc_porcvariable').AsFloat > (sdqConsulta.FieldByName('co_porcvariablepiso').AsFloat * 1.4) then
        Verificar(not MsgAsk(Format('[Cotización Nº %s] La diferencia entre el variable sugerido y el variable piso es mayor a 40%.' + #13#10 + ' ¿ Desea continuar de todas formas ?', [sdqConsulta.FieldByName('nrocotiorden').AsString])), Grid, '');
{
      if (sdqConsulta.FieldByName('co_cargamanualic').AsString <> 'S') then
        eIndiceCombinado := aFrmAdminCotizacion.CalcularIndiceCombinado(sdqConsulta.FieldByName('co_canttrabajador').AsInteger,
                                                                        sdqConsulta.FieldByName('co_idactividad').AsInteger,
                                                                        sdqConsulta.FieldByName('co_id').AsInteger,
                                                                        sdqConsulta.FieldByName('co_masasalarial').AsFloat,
                                                                        sdqConsulta.FieldByName('tc_costofinal').AsFloat);

      Verificar((eIndiceCombinado < 100) and (sdqConsulta.FieldByName('co_porcvariablepiso').AsFloat > sdqConsulta.FieldByName('tc_porcvariable').AsFloat), Grid, Format('[Cotización Nº %s] El costo variable de la tarifa piso tiene que ser menor al costo variable de la tarifa sugerida.', [sdqConsulta.FieldByName('nrocotiorden').AsString]));
}
      // FIN - Ticket 60746..
    end;


    BeginTrans;
    try
      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        sdqConsulta.First;
        Verificar((not sdqConsulta.Locate('sc_id', FRegistrosSeleccionados[iLoop], [])), nil, Format('Posible error en solicitud Nº %s.', [FRegistrosSeleccionados[iLoop]]));

        // Autorizar..
        sSql :=
          'SELECT tc_id' +
           ' FROM atc_tarifacobrar' +
          ' WHERE tc_idcotizacion = :idcotizacion' +
       ' ORDER BY tc_id DESC';

        aSqlTarifa.Fields.Clear;
        aSqlTarifa.PrimaryKey.Clear;
        aSqlTarifa.PrimaryKey.Add('tc_id',            ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]), False);
        aSqlTarifa.Fields.Add('tc_fechaautorizacion', SQL_ACTUALDATE, False);
        aSqlTarifa.Fields.Add('tc_usuautorizacion',   sdqConsulta.FieldByName('co_usuarioautorizacion').AsString);

        // Actualizo el indice combinado..
        if (sdqConsulta.FieldByName('co_cargamanualic').AsString <> 'S') then
        begin
          eIndiceCombinado := aFrmAdminCotizacion.CalcularIndiceCombinado(sdqConsulta.FieldByName('co_canttrabajador').AsInteger,
                                                                          sdqConsulta.FieldByName('co_idactividad').AsInteger,
                                                                          sdqConsulta.FieldByName('co_id').AsInteger,
                                                                          sdqConsulta.FieldByName('co_masasalarial').AsFloat,
                                                                          sdqConsulta.FieldByName('tc_costofinal').AsFloat);
          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET co_indicecombinado = :indicecombinado' +
            ' WHERE co_id = :id';
          EjecutarSqlSTEx(sSql, [eIndiceCombinado, sdqConsulta.FieldByName('co_id').AsInteger]);
        end;

        // Actualizo el estado de la cotización
        sSql :=
          'UPDATE aco_cotizacion' +
            ' SET co_estado = :estado,' +
                ' co_autorizagerencia = :autorizagerencia' +
          ' WHERE co_id = :id';
        EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, 'N', sdqConsulta.FieldByName('co_id').AsInteger]);

        // Actualizo el estado de la solicitud asociada
        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado' +
          ' WHERE sc_idcotizacion = :id';
        EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, sdqConsulta.FieldByName('co_id').AsInteger]);
        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);

        EjecutarSqlST(aSqlTarifa.Sql);

        if not NotificarAComercial then
          raise Exception.Create('El servidor de PDF no está disponible, reintente en unos minutos.');
      end;

      CommitTrans(True);

      MessageDlg('Las cotizaciones han sido autorizadas y notificadas correctamente.', mtInformation, [mbOK], 0);
      tbRefrescarClick(nil);
    except
      on E: Exception do
      begin
        RollBack(True);
        MessageDlg('ERROR FATAL, por favor informe a Sistemas.' + #13#10 + E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    sdqConsulta.EnableControls;
    aSqlTarifa.Free;

    if frmAdminCotizacion = nil then
      FreeAndNil(aFrmAdminCotizacion);
  end;
end;

function TfrmConsultaCotizacion.NotificarAComercial: Boolean;
var
  aConsultaSolicitud: TfrmConsultaSolicitud;
  aQuery: TSDQuery;
  sAdicional: String;
  sComision: String;
  sDirecciones: String;
  sFrecuenciaSiniestral: String;
  sIlp: String;
  sIltEmpleador: String;
  sIndiceCombinado: String;
  sJuicios: String;
  sMensaje: String;
  sPrecioCompetencia: String;
  sSql: String;
  sTarifaUnificada: String;
  sUsuarioSolicitud: String;
begin
  Result := True;

  try
    sAdicional := '';
    if (sdqConsulta.FieldByName('co_fechavigencia').AsString = '') then
      sAdicional := ' co_fechavigencia = TO_DATE(''' + DateTimeToStr(Now + 30) + ''', ''dd/mm/yyyy hh24:mi:ss''), ';

    //Cierra la cotizacion
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET ' + sAdicional +
            ' co_estado = :estado,' +
            ' co_fechacerrado = SYSDATE,' +
            ' co_usucerrado = :usucerrado' +
      ' WHERE co_id = :id';
    EjecutarSqlSTEx(sSql, [EC_NOTIF_COMERCIAL, Sesion.UserID, sdqConsulta.FieldByName('co_id').AsInteger]);

    //Actualiza la solicitud
    sSQL :=
      'SELECT tc_sumafija, tc_porcvariable, tc_costofinal, sc_idevento, sc_masasalarial, tc_observaciones' +
       ' FROM atc_tarifacobrar, aco_cotizacion, asc_solicitudcotizacion' +
      ' WHERE sc_idcotizacion = co_id(+)' +
        ' AND tc_id = (SELECT MAX(tc_id)' +
                       ' FROM atc_tarifacobrar' +
                      ' WHERE tc_idcotizacion = co_id)' +
        ' AND co_id = :id';
    aQuery := GetQueryEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);

    if aQuery.RecordCount > 0 then
    begin
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_estado = :estado,' +
              ' sc_finalsumafija = :suma,' +
              ' sc_finalporcmasa = :porcvariable,' +
              ' sc_finalportrabajador = :costofinal,' +
              ' sc_fechavigencia = actualdate' +
        ' WHERE sc_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [EC_NOTIF_COMERCIAL, aQuery.FieldByName('tc_sumafija').AsFloat,
                             aQuery.FieldByName('tc_porcvariable').AsFloat,
                             aQuery.FieldByName('tc_costofinal').AsFloat,
                             sdqConsulta.FieldByName('co_id').AsInteger]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);

      if not aQuery.FieldByName('sc_idevento').IsNull then
      begin
        sSql :=
          'UPDATE cse_seguimientoevento' +
            ' SET se_finalsumafija = :suma,' +
                ' se_finalporcmasa = :porcvariable,' +
                ' se_finalportrabajador = :costofinal' +
          ' WHERE se_id = :idevento';
        EjecutarSqlSTEx(sSql, [aQuery.FieldByName('tc_sumafija').AsFloat,
                               aQuery.FieldByName('tc_porcvariable').AsFloat,
                               aQuery.FieldByName('tc_costofinal').AsFloat,
                               aQuery.FieldByName('sc_idevento').AsInteger]);
      end;
    end;

    if sdqConsulta.FieldByName('valor_rc').AsFloat >= 0 then
    begin
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_valor_rc = :valor_rc' +
        ' WHERE sc_nrosolicitud = :nrosolicitud';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('valor_rc').AsFloat, sdqConsulta.FieldByName('sc_nrosolicitud').AsInteger]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_nrosolicitud').AsInteger]);
    end;


    sSql :=
      'SELECT sc_porccomision, co_comision' +
       ' FROM asc_solicitudcotizacion, aco_cotizacion' +
      ' WHERE sc_idcotizacion = co_id' +
        ' AND co_id = :id';
    with GetQueryEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]) do
    try
      sComision := '';
      if not IsEmpty then
      begin
        if RoundTo(FieldByName('sc_porccomision').AsFloat, -2) <> RoundTo(FieldByName('co_comision').AsFloat, -2) then
          sComision := 'La comisión cotizada es de ' + FormatFloat('0.00', FieldByName('co_comision').AsFloat) + '%.';
      end;
    finally
      Free;
    end;


    sSql :=
      'SELECT ''Alta Frecuencia Siniestral: '' || TO_CHAR(cz_frecuenciaesperada) || ''%''' +
       ' FROM aco_cotizacion, acz_cotizador' +
      ' WHERE co_id = cz_idcotizacion' +
        ' AND co_chek_frecuenciasin = ''S''' +
        ' AND co_id = :id';
    sFrecuenciaSiniestral := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''Alta Judicialidad: '' || TO_CHAR(cz_juiciosfrecvalorsuscriptor) || ''%''' +
       ' FROM aco_cotizacion, acz_cotizador' +
      ' WHERE co_id = cz_idcotizacion' +
        ' AND co_chek_juicios = ''S''' +
        ' AND co_id = :id';
    sJuicios := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''La tarifa es unificada para todo el grupo.''' +
       ' FROM aco_cotizacion' +
      ' WHERE co_checktarifaunificada = ''S''' +
        ' AND co_id = :id';
    sTarifaUnificada := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''Alta Frecuencia ILP: '' || TO_CHAR(cz_incap050frecvalorsuscriptor + cz_incap5066frecvalorsuscript + cz_incap66100frecvalorsuscript) || ''%''' +
       ' FROM aco_cotizacion, acz_cotizador' +
      ' WHERE co_id = cz_idcotizacion' +
        ' AND co_chek_ilp = ''S''' +
        ' AND co_id = :id';
    sIlp := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''Condiciones particulares de ILT a consignarse en la ADDENDA respectiva''' +
       ' FROM aco_cotizacion' +
      ' WHERE co_chek_iltempleador = ''S''' +
        ' AND co_id = :id';
    sIltEmpleador := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''El precio de la competencia es bajo para el riesgo a cotizar.''' +
       ' FROM aco_cotizacion' +
      ' WHERE co_chek_preciocomp = ''S''' +
        ' AND co_id = :id';
    sPrecioCompetencia := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    sSql :=
      'SELECT ''IC = '' || TO_CHAR(co_indicecombinado)' +
       ' FROM aco_cotizacion' +
      ' WHERE NVL(co_indicecombinado, 0) > 100' +
        ' AND SUBSTR(co_usuariosolicitado, 0, 2) <> ''W_''' +
        ' AND co_id = :id';
    sIndiceCombinado := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);


    // Notifico a comercial..
    if not sdqConsulta.FieldByName('sc_idusuarioweb').IsNull then
    begin
      sSql :=
        'SELECT uw_usuario || '' (web)''' +
         ' FROM auw_usuarioweb' +
        ' WHERE uw_id = :id';
      sUsuarioSolicitud := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_idusuarioweb').AsInteger]);
    end
    else
    begin
      sSql :=
        'SELECT se_nombre' +
         ' FROM use_usuarios' +
        ' WHERE se_usuario = :usuario';
      sUsuarioSolicitud := ValorSqlEx(sSql, [sdqConsulta.FieldByName('ususolicito').AsString]);
    end;

    sSql := 'SELECT art.cotizacion.get_mailnotificacomercial(''C'', :idsolicitud) FROM DUAL';
    sDirecciones := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

    sMensaje := 'Nº Cotización: ' + sdqConsulta.FieldByName('nrocotiorden').AsString + CRLF +
                'Nº Solicitud: ' + sdqConsulta.FieldByName('sc_nrosolicitud').AsString + CRLF +
                'C.U.I.T.: ' + sdqConsulta.FieldByName('co_cuit').AsString + CRLF +
                'Razón Social: ' + sdqConsulta.FieldByName('co_razonsocial').AsString + CRLF +
                'Entidad: ' + '(' + sdqConsulta.FieldByName('en_codbanco').AsString + ') ' + sdqConsulta.FieldByName('en_nombre').AsString + CRLF +
                'Vendedor: ' + '(' + sdqConsulta.FieldByName('ve_vendedor').AsString + ') ' + sdqConsulta.FieldByName('ve_nombre').AsString + CRLF +
                'Usuario Solicitud: ' + sUsuarioSolicitud + CRLF +
                'Observaciones para el Área Comercial: ' + aQuery.FieldByName('tc_observaciones').AsString + CRLF +
                sComision + CRLF +
                sFrecuenciaSiniestral + CRLF +
                sJuicios + CRLF +
                sTarifaUnificada + CRLF +
                sIlp + CRLF +
                sIltEmpleador + CRLF +
                sPrecioCompetencia + CRLF +
                sIndiceCombinado + CRLF + CRLF;
    NotificacionPorMail('COMERCIAL', sMensaje, 'Cotización efectuada', 'ASC', sdqConsulta.FieldByName('sc_id').AsInteger, sDirecciones);

    // Notifico al cliente..
    sSql := 'SELECT art.cotizacion.get_mailnotificacliente(''C'', :idsolicitud) FROM DUAL';
    sDirecciones := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);
    if sDirecciones <> '' then
    begin
      aConsultaSolicitud := TfrmConsultaSolicitud.Create(nil);
      try
        aConsultaSolicitud.FormStyle := fsNormal;
        aConsultaSolicitud.Hide;
        Result := aConsultaSolicitud.NotificarAlCliente(sdqConsulta.FieldByName('sc_id').AsInteger, 'T', False);
      finally
        FreeAndNil(aConsultaSolicitud);
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error al Notificar al Cliente' + CRLF + 'Detalle del error: ' + E.Message);
      Result := False;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.fpHintColoresKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpHintColores.Close;
end;

procedure TfrmConsultaCotizacion.tbColoresClick(Sender: TObject);
begin
  fpHintColores.ShowModal;
end;

procedure TfrmConsultaCotizacion.btnCerrarClick(Sender: TObject);
begin
  fpHintColores.Close;
end;

procedure TfrmConsultaCotizacion.tbSRTClick(Sender: TObject);
begin
  fpSRT.ShowModal;
end;

procedure TfrmConsultaCotizacion.btnCancelarClick(Sender: TObject);
begin
  fpSRT.Close;
end;

procedure TfrmConsultaCotizacion.btnImportarClick(Sender: TObject);
var
//  aResultImportFromSRT: TResultImportFromSRT;
  sSql: String;
begin
  Verificar((not rbDia.Checked) and (not rbSemana.Checked) and (not rbMes.Checked) and (not rbEntreFechas.Checked), nil, 'Debe seleccionar el período a importar.');
  Verificar((rbEntreFechas.Checked) and (edFechaImportacionSrtDesde.IsEmpty), edFechaImportacionSrtDesde, 'Debe seleccionar la fecha desde.');
  Verificar((rbEntreFechas.Checked) and (edFechaImportacionSrtHasta.IsEmpty), edFechaImportacionSrtHasta, 'Debe seleccionar la fecha hasta.');

  if rbDia.Checked then
    sSql :=
      'SELECT DISTINCT sc_cuit' +
                ' FROM asc_solicitudcotizacion' +
               ' WHERE TO_DATE(sc_fechasolicitud) = TO_DATE(SYSDATE)';

  if rbSemana.Checked then
    sSql :=
      'SELECT DISTINCT sc_cuit' +
                ' FROM asc_solicitudcotizacion' +
               ' WHERE TO_DATE(sc_fechasolicitud) BETWEEN TO_DATE(SYSDATE - 7) AND TO_DATE(SYSDATE)';

  if rbMes.Checked then
    sSql :=
      'SELECT DISTINCT sc_cuit' +
                ' FROM asc_solicitudcotizacion' +
               ' WHERE TO_DATE(sc_fechasolicitud) BETWEEN TO_DATE(SYSDATE - 30) AND TO_DATE(SYSDATE)';

  if rbEntreFechas.Checked then
    sSql :=
      'SELECT DISTINCT sc_cuit' +
                ' FROM asc_solicitudcotizacion' +
               ' WHERE TO_DATE(sc_fechasolicitud) BETWEEN TO_DATE(' + SqlDate(edFechaImportacionSrtDesde.Date) + ') AND TO_DATE(' + SqlDate(edFechaImportacionSrtHasta.Date) + ')';

  with GetQuery(sSql) do
  try
    Verificar(IsEmpty, btnImportar, 'No se encontraron registros entre esas fechas.');

    while not Eof do
    begin
      lbProcesando.Caption := Format('Procesando %d/%d.', [RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]);
      Application.ProcessMessages;

{      aResultImportFromSRT := ImportFromSRT(FieldByName('sc_cuit').AsString, True, False);
      if aResultImportFromSRT.Error <> '' then
      begin
        lbProcesando.Caption := ' ';
        MsgBox('El proceso ha finalizado con el siguiente error: ' + aResultImportFromSRT.Error);
        Exit;
      end;
}
      Next;
    end;
  finally
    Free;
  end;

  lbProcesando.Caption := ' ';

  MsgBox('El proceso ha finalizado correctamente.');
end;

procedure TfrmConsultaCotizacion.EnableEntreFechasSRT(Sender: TObject);
begin
  gbEntreFechas.Enabled := (TRadioButton(Sender).Tag = 1);

  if not gbEntreFechas.Enabled then
  begin
    edFechaImportacionSrtDesde.Clear;
    edFechaImportacionSrtHasta.Clear;
  end;
end;

procedure TfrmConsultaCotizacion.fpSRTBeforeShow(Sender: TObject);
begin
  lbProcesando.Caption := ' ';
end;

procedure TfrmConsultaCotizacion.fpMailBeforeShow(Sender: TObject);
begin
  inherited;

  fraMotivo.Clear;
  fraDestinatario.Clear;
  edMail.Clear;

  fraDestinatario.Propiedades.Sql :=
    'SELECT id, codigo, descripcion, baja, se_perfil, se_sector, se_id, se_fechabaja' +
     ' FROM (SELECT se_id ID, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, se_perfil, se_sector, se_id, se_fechabaja' +
             ' FROM aec_ejecutivocuenta JOIN xen_entidad ON en_idejecutivo = ec_id' +
             ' JOIN art.use_usuarios ON se_usuario = ec_usuario' +
            ' WHERE en_id = ' + SqlValue(sdqConsulta.FieldByName('sc_identidad').AsInteger) +
            ' UNION' +
           ' SELECT -1 ID, ''GRUPO'' codigo, ''CSEMIK - GDRAGANI - RARREGUI'' descripcion, se_fechabaja baja, se_perfil, se_sector, se_id, se_fechabaja' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario = ''GDRAGANI''' +
            ' UNION' +
           ' SELECT se_id id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja, se_perfil, se_sector, se_id, se_fechabaja' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario IN(' + SqlValue(sdqConsulta.FieldByName('ususolicito').AsString) + ')) tabla' +
    ' WHERE 1 = 1';
//  fraDestinatario.Codigo := sdqConsulta.FieldByName('ususolicito').AsString;
end;

procedure TfrmConsultaCotizacion.btnCancelar4Click(Sender: TObject);
begin
  fpCambiarUsuarioAutorizacion.ModalResult := mrCancel;
end;

procedure TfrmConsultaCotizacion.fpCambiarUsuarioAutorizacionShow(Sender: TObject);
var
  iPrioridad: String;
  sIdTipoRiesgo: String;
  sSql: String;
begin
  sSql :=
    'SELECT ac_idtiporiesgo' +
     ' FROM cac_actividad' +
    ' WHERE ac_id = :id';
  sIdTipoRiesgo := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_idactividad').AsInteger]);

  sSql :=
    'SELECT   ac_prioridad' +
       ' FROM art.aac_autorizacotiza' +
      ' WHERE :capitas BETWEEN ac_capitasdesde AND ac_capitashasta' +
        ' AND INSTR('','' || ac_srt || '','', :srt) > 0' +
        ' AND INSTR('','' || ac_bcra || '','', :bcra) > 0' +
        ' AND INSTR('','' || ac_riesgo || '','', :riesgo) > 0' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_prioridad';
  iPrioridad := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_canttrabajador').AsInteger,
                                  ',' + sdqConsulta.FieldByName('co_statussrt').AsString + ',',
                                  ',' + sdqConsulta.FieldByName('idstatusbcra').AsString + ',',
                                  ',' + sIdTipoRiesgo + ',']);

  with fraUsuario do
  begin
    Propiedades.ExtraCondition := ' AND ac_prioridad >= 0' + SqlString(iPrioridad) + ' ';
    Clear;
  end;
end;

procedure TfrmConsultaCotizacion.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Por favor seleccione el usuario.');

  fpCambiarUsuarioAutorizacion.ModalResult := mrOk;
end;

function TfrmConsultaCotizacion.TieneUsuarioAsignado(const aIdCotizacion: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT co_id' +
     ' FROM aco_cotizacion' +
    ' WHERE co_usuarioautorizacion IS NOT NULL' +
      ' AND co_id = :id';

  with GetQueryEx(sSql, [aIdCotizacion]) do
  try
    if FieldByName('co_id').IsNull then
      Result := False
    else
      Result := True;
  finally
    Free;
  end;
end;

procedure TfrmConsultaCotizacion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  //Si tiene permiso y la cotizacion ya tiene un usuario de autorizacion
  // Debe poder cambiar.
  //lo pueda cambiar igual
  if TieneUsuarioAsignado(sdqConsulta.FieldByName('co_id').AsInteger) then
    if not (Seguridad.Claves.IsActive('CambiarUsuarioAutorizacion')) then
      tbCambiarUsuarioAutorizacion.Enabled := (sdqConsulta.FieldByName('co_estado').AsString = EC_PEND_AUTORIZ)
    else
      tbCambiarUsuarioAutorizacion.Enabled := True
  else
    tbCambiarUsuarioAutorizacion.Enabled := False;

end;

procedure TfrmConsultaCotizacion.tbCambiarUsuarioAutorizacion2Click(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty , Grid,'No hay registros para modificar.');
  Verificar(Grid.SelectedIndex= -1 , Grid, 'No hay registros seleccionados.');

  if fpCambiarUsuarioAutorizacion.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_autorizagerencia = ''S'',' +
            ' co_usuarioautorizacion = :usuarioautorizacion,' +
            ' co_puestoautorizacion = :puestoautorizacion,' +
            ' co_usuariocambiousuautoriza = :usuariocambio' +
      ' WHERE co_id = :id';
    EjecutarSqlEx(sSql, [fraUsuario.Descripcion,
                         fraUsuario.sdqDatos.FieldByName('ac_puesto').AsInteger,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('co_id').AsInteger]);
    ActualizaConsulta;
  end;
end;

procedure TfrmConsultaCotizacion.edCO_NROCOTIZACIONKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edOrden.SetFocus;
end;

procedure TfrmConsultaCotizacion.tbBuscarEmailsClick(Sender: TObject);
begin
  Verificar((FRegistrosSeleccionados.Count = 0), Grid, 'Debe seleccionar algún registro.');

  with TfrmElementosEnviados.Create(Self) do
  begin
    MenuItem := frmPrincipal.mnuElementosEnviados;
    FormStyle := fsMDIChild;

    IdRegistro := frmConsultaCotizacion.sdqConsulta.FieldByName('sc_id').AsInteger;
    TipoRegistro := 'ASC';
    RefreshData;
  end;
end;

procedure TfrmConsultaCotizacion.Suspender(const aConTransaccion: Boolean = False);
var
  sDirecciones: String;
  sMensaje: String;
  sObservacionesParaComercial: String;
  sSql: String;
  sUsuarioSolicitud: String;
begin
  if fpMail.ShowModal = mrOk then
  begin
    sSql :=
      'SELECT   tc_observaciones' +
         ' FROM atc_tarifacobrar' +
        ' WHERE tc_idcotizacion = :idcotizacion' +
     ' ORDER BY tc_id DESC';
    sObservacionesParaComercial := ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]);

    if fraDestinatario.Codigo = 'GRUPO' then
    begin
      sSql :=
        'BEGIN' +
         ' intraweb.do_solicpermisoprevencion(:idsolicitudcotizacion, :destinatarios, :usuario, :observaciones);' +
       ' END;';
      if aConTransaccion then
        EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger,
                             fraDestinatario.Codigo,
                             Nvl(sdqConsulta.FieldByName('usuasignado').AsString, Sesion.UserID),
                             sObservacionesParaComercial + CRLF + ' ' + edMail.Lines.Text])
      else
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger,
                               fraDestinatario.Codigo,
                               Nvl(sdqConsulta.FieldByName('usuasignado').AsString, Sesion.UserID),
                               sObservacionesParaComercial + CRLF + ' ' + edMail.Lines.Text]);
    end
    else
    begin
      if not sdqConsulta.FieldByName('sc_idusuarioweb').IsNull then
      begin
        sSql :=
          'SELECT uw_usuario || '' (web)''' +
           ' FROM auw_usuarioweb' +
          ' WHERE uw_id = :id';
        sUsuarioSolicitud := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_idusuarioweb').AsInteger]);
      end
      else
      begin
        sSql :=
          'SELECT se_nombre' +
           ' FROM use_usuarios' +
          ' WHERE se_usuario = :usuario';
        sUsuarioSolicitud := ValorSqlEx(sSql, [sdqConsulta.FieldByName('ususolicito').AsString]);
      end;

      sSql :=
        'SELECT co_cuit, co_razonsocial, co_nrocotizacion || ''/'' || co_orden nrocotiorden, sc_nrosolicitud' +
         ' FROM asc_solicitudcotizacion, aco_cotizacion' +
        ' WHERE sc_idcotizacion = co_id(+)' +
          ' AND sc_id = :id';

      with GetQueryEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]) do
      begin
        sMensaje := 'Nro. Cotización: ' + FieldByName('nrocotiorden').AsString + CRLF +
                    'Nro. Solicitud: ' + FieldByName('sc_nrosolicitud').AsString + CRLF +
                    'C.U.I.T.: ' + FieldByName('co_cuit').AsString + CRLF +
                    'Razón Social: ' + FieldByName('co_razonsocial').AsString + CRLF +
                    'Entidad: ' + '(' + sdqConsulta.FieldByName('en_codbanco').AsString + ') ' + sdqConsulta.FieldByName('en_nombre').AsString + CRLF +
                    'Vendedor: ' + '(' + sdqConsulta.FieldByName('ve_vendedor').AsString + ') ' + sdqConsulta.FieldByName('ve_nombre').AsString + CRLF +
                    'Usuario Solicitud: ' + sUsuarioSolicitud + CRLF +
                    'Mensaje: ' + edMail.Lines.Text;

        sSql :=
          'SELECT cz_licitacion' +
           ' FROM acz_cotizador' +
          ' WHERE cz_idcotizacion = :idcotizacion';
        if ValorSqlEx(sSql, [sdqConsulta.FieldByName('co_id').AsInteger]) = 'S' then
          sMensaje := sMensaje + CRLF + CRLF + 'LA CUENTA QUE SE ANALIZA ES UNA LICITACIÓN.' + CRLF;

        sDirecciones := '';
        sSql :=
          'SELECT NVL(se_mail, se_usuario) email' +
           ' FROM use_usuarios' +
          ' WHERE se_usuario = :usuario' +
      ' UNION ALL' +
         ' SELECT uw_mailavisoart' +
           ' FROM auw_usuarioweb' +
          ' WHERE ''W_'' || uw_usuario = :usuario';
        with GetQueryEx(sSql, [fraDestinatario.Codigo]) do
        try
          while not Eof do
          begin
            sDirecciones := sDirecciones + ',' + FieldByName('email').AsString;
            Next;
          end;
        finally
          Free;
        end;
        System.Delete(sDirecciones, 1, 1);

        NotificacionPorMail('', sMensaje, 'Pedido de información', 'ASC', sdqConsulta.FieldByName('sc_id').AsInteger, sDirecciones);
      end;
    end;

    BeginTrans(True);
    try
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_estado = :estado,' +
              ' co_estadoanterior = :estadoanterior' +
        ' WHERE co_id = :id';
      EjecutarSqlSTEx(sSql, [EC_SUSPENDIDA,
                             sdqConsulta.FieldByName('co_estado').AsString,
                             sdqConsulta.FieldByName('co_id').AsInteger]);

      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_cod_motivosuspension = :cod_motivosuspension,' +
              ' sc_estado = :estado,' +
              ' sc_estadoanterior = :estadoanterior,' +
              ' sc_fechasuspdesde = SYSDATE,' +
              ' sc_fechasusphasta = NULL,' +
              ' sc_motivosuspension = :motivosuspension' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [fraMotivo.Value, EC_SUSPENDIDA, sdqConsulta.FieldByName('co_estado').AsString, edMail.Lines.Text, sdqConsulta.FieldByName('sc_id').AsInteger]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

      CommitTrans(True);
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
      ActualizaConsulta;
    except
      on E: Exception do
      begin
        Rollback(True);
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TfrmConsultaCotizacion.CambiarMotivoSuspension(Sender: TObject);
var
  sSql: String;
begin
  if (fraMotivo.Value = 1) or (fraMotivo.Value = 3) then
  begin
    if Copy(sdqConsulta.FieldByName('ususolicito').AsString, 1, 2) = 'W_' then
    begin
      sSql :=
        'SELECT ec_usuario' +
         ' FROM asc_solicitudcotizacion, xen_entidad, aec_ejecutivocuenta' +
        ' WHERE sc_identidad = en_id' +
          ' AND en_idejecutivo = ec_id' +
          ' AND en_id = :id';
      fraDestinatario.Codigo := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_identidad').AsInteger]);
    end
    else
      fraDestinatario.Codigo := sdqConsulta.FieldByName('ususolicito').AsString;
  end;

  if fraMotivo.Value = 2 then
    fraDestinatario.Codigo := 'GRUPO';
end;

end.
