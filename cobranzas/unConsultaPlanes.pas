unit unConsultaPlanes;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   20-07-03
 ULTIMA MODIFICACION: 13-11-03
}
interface
                   
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, CardinalEdit,
  unArtFrame, unArtDbFrame, unFraEmpresa, IntEdit, FormPanel, Menus, ComboEditor, CheckCombo, DBCheckCombo,
  unFraStaticCTB_TABLAS, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unSeleccionDestinatarios, unArt,
  unFraCodigoDescripcion, RxToolEdit, RxPlacemnt;

type
  TfrmConsultaPlanes = class(TfrmCustomConsulta)
    grbConvenio: TGroupBox;
    cmbPP_FECHAAPROBADODesde: TDateComboBox;
    Label3: TLabel;
    cmbPP_FECHAAPROBADOHasta: TDateComboBox;
    Label4: TLabel;
    grbPreAcuerdo: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cmbPP_FECHAALTADesde: TDateComboBox;
    cmbPP_FECHAALTAHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    fraPP_CONTRATO: TfraEmpresa;
    tbConvertir: TToolButton;
    tbSeparador: TToolButton;
    edPP_ID: TIntEdit;
    Label7: TLabel;
    chkActivos: TCheckBox;
    mnuImprimir: TPopupMenu;
    mnuImprimirPlan: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirEstadodeCuenta: TMenuItem;
    chkCuotasVencidas: TCheckBox;
    GroupBox5: TGroupBox;
    rbTodosGestores: TRadioButton;
    rbGestorActual: TRadioButton;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    mnuEnviarPlanConvenio: TMenuItem;
    mnuEnviarEstadodeCuenta: TMenuItem;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    grbSector: TGroupBox;
    edEM_SECTOR: TDBCheckCombo;
    sdqSectores: TSDQuery;
    dsSectores: TDataSource;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    tbModificarGestor: TToolButton;
    fpGestor: TFormPanel;
    fraPP_IDGESTOR: TfraStaticCodigoDescripcion;
    Label8: TLabel;
    BordeInferior: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    mnuImprimirRecibo: TMenuItem;
    mnuConvertirPreaCuerdoEn: TPopupMenu;
    mnuConvertirPreaCuerdoEnPlan: TMenuItem;
    mnuConvertirPreaCuerdoEnConvenio: TMenuItem;
    mnuConvertirPreaCuerdoEnCobroEstDeuda: TMenuItem;
    cmbPP_ESTADO: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    tbCancelar: TToolButton;
    tbBibliorato: TToolButton;
    fpBibliorato: TFormPanel;
    Label9: TLabel;
    Bevel1: TBevel;
    btnAceptarBibliorato: TButton;
    btnCancelarBibliorato: TButton;
    edPP_Bibliorato: TIntEdit;
    fraEstudio: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    gbSector: TGroupBox;
    rbCobranzas: TRadioButton;
    rbLegales: TRadioButton;
    rgOperacion: TRadioGroup;
    GroupBox1: TGroupBox;
    rbSectorTodos: TRadioButton;
    rbSectorCob: TRadioButton;
    rbSectorLeg: TRadioButton;
    mnuEnviarPlanConvenioEstCta: TMenuItem;
    mnuConvertirPreaCuerdoEnConvenioCuotaBonif: TMenuItem;
    tbImagenes: TToolButton;
    mnuImagenes: TPopupMenu;
    mnuImagenesCargar: TMenuItem;
    mnuImagenesVisualizar: TMenuItem;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuImprimirPlanClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirEstadodeCuentaClick(Sender: TObject);
    procedure ActualizarGestor(Sender: TObject);
    procedure mnuEnviarPlanConvenioClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbModificarGestorClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpGestorBeforeShow(Sender: TObject);
    procedure mnuImprimirReciboClick(Sender: TObject);
    procedure mnuConvertirPreaCuerdoEnPlanClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbCancelarClick(Sender: TObject);
    procedure mnuConvertirPreaCuerdoEnPopup(Sender: TObject);
    procedure tbConvertirClick(Sender: TObject);
    procedure tbBiblioratoClick(Sender: TObject);
    procedure btnAceptarBiblioratoClick(Sender: TObject);
    procedure fpBiblioratoBeforeShow(Sender: TObject);
    procedure rgOperacionClick(Sender: TObject);
    procedure tbImagenesClick(Sender: TObject);
    procedure mnuImagenesCargarClick(Sender: TObject);
    procedure mnuImagenesVisualizarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    fIDGestorActual: string;

    procedure CalcTotales;
    procedure Do_CancelarPlan(IdPlan: TTableId);
    procedure EnvioMail;
    function PermitirConsultaPlanesCob: Boolean;
    function Is_ExisteArchivoPlanFilaActual(var NombreArchivo: String): Boolean;
  protected
    procedure EnableButtons( AEnabled : Boolean = True); override;
  end;

  TEnvioPDF = (ePlanConvenio, eEstadoCuenta, ePlanConvenioConEstadoCuenta);

var
  TotalConsulta : array of extended;
  pEnvioPDF: TEnvioPDF;
  frmConsultaPlanes : TfrmConsultaPlanes;

const
  MAXCOLS = 9;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('DEUDANOMINAL', 'INTERESMORA', 'DEUDATOTAL', 'GASTOADMINISTRATIVO', 'INTERESFINANC', 'TOTAL', 'SALDO', 'COMISIONGESTOR', 'ANTICIPO', 'DESCINTERESMORA');

implementation

uses
  unPrincipal, unFiltros, VCLExtra, unCargaPreAcuerdos, unCustomPanelABM, unDmPrincipal, CustomDlgs, unQrEstadoCuentaPlan,
  unQrPlanFinanciamiento, unQrConvenio, AnsiSql, unMoldeEnvioMail, unEnvioMail, unCobranzas, DbFuncs, General, StrFuncs,
  unConvertirEnConvenio, ArchFuncs, unSesion, unqrImpresionRecibo;

{$R *.DFM}

procedure TfrmConsultaPlanes.FormCreate(Sender: TObject);
var
  sSql: string;
  bHabilitarGestor, bHabilitarEstudio: boolean;
begin
  inherited;

  tbPropiedades.Left     := 100;
  tbCancelar.Left        := 100;
  tbSeparador.Left       := 31;
  tbImagenes.Left        := 31;
  tbBibliorato.Left      := 31;
  tbModificarGestor.Left := 31;
  tbConvertir.Left       := 31;

  fraPP_CONTRATO.ShowBajas := True;
  SetLength( TotalConsulta,  MAXCOLS  + 1);

  sSql := 'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                 'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
            'FROM USE_USUARIOS, AGC_GESTORCUENTA ' +
           'WHERE GC_USUARIO=SE_USUARIO(+) ' +
             'AND SE_SECTOR=''COB'' ';

  fraGestorCuenta.Sql := sSql;

  fIDGestorActual := ValorSql( 'SELECT NVL(GC_ID,''0'') FROM AGC_GESTORCUENTA WHERE GC_USUARIO = ' + '''' + Sesion.UserID + '''', '0');
  fraGestorCuenta.Value := StrToInt(fIDGestorActual);

  with fraPP_IDGESTOR do
    begin
      Sql       := sSql;
      ShowBajas := False;
    end;

  sSql := 'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                 'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
            'FROM AGC_GESTORCUENTA ' +
           'WHERE GC_USUARIO IS NULL ' +
             'AND GC_ESTUDIO = ''S'' ';

  fraEstudio.Sql := sSql;

  OpenQuery( sdqSectores );
  OpenQuery( sdqEstados );

  EnableButtons( False );

  bHabilitarGestor  := HabilitarGestor();
  bHabilitarEstudio := HabilitarEstudio();

  VCLExtra.LockControls( [rbTodosGestores, rbGestorActual, fraGestorCuenta], not bHabilitarGestor );
  VCLExtra.LockControl( fraEstudio, not bHabilitarEstudio);
  VCLExtra.LockControls( [rbSectorCob, rbSectorTodos], not PermitirConsultaPlanesCob());

  if bHabilitarEstudio then
    rbTodosGestores.Checked := True;

  tbLimpiarClick(nil);
end;

procedure TfrmConsultaPlanes.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere, sGroup: string;
begin
  sGroup := ' GROUP BY EM_NOMBRE, EM_CUIT, PP_TASAINTERESMENSUAL, PP_GASTOADMINISTRATIVO, PP_ID, PP_CONTRATO, ' +
                      'PP_ESTADO, PP_FECHABAJA, ESPLA.TB_DESCRIPCION, ESPLA.TB_ESPECIAL2, AFEST.TB_DESCRIPCION, PP_FECHAAPROBADO, ' +
                      'AGCESTUDIO.GC_ID, AGCESTUDIO.GC_NOMBRE, AGCGESTOR.GC_ID, AGCGESTOR.GC_NOMBRE, PP_MONTODESCINTERES, ' +
                      'PP_PORCDESCINTERES, PP_COMISIONGESTOR, PP_IDGESTOR, PP_FECHAMODIFGESTOR, PP_BIBLIORATO, ' +
                      'PP_SECTOR, PP_TIPOBIBLIORATO, PP_FECHAALTA, PP_OBSERVACIONES, PP_NOMBREARCHIVO, PP_USUBAJA ';

  sSql := 'SELECT EM_NOMBRE, EM_CUIT, PP_ID, PP_ESTADO, PP_FECHABAJA, ESPLA.TB_DESCRIPCION ESTADO, ' +
                 'ESPLA.TB_ESPECIAL2 TIPOPLANCONVENIO, AFEST.TB_DESCRIPCION ESTADOAFEST, PP_CONTRATO, PP_FECHAAPROBADO, ' +
                 'DEUDA.GET_CANTCUOTASPLAN (PP_ID) CANTCUOTAS, AGCGESTOR.GC_ID GCIDGESTOR, AGCGESTOR.GC_NOMBRE GCNOMBREGESTOR, ' +
                 'AGCESTUDIO.GC_ID GCIDESTUDIO, AGCESTUDIO.GC_NOMBRE GCNOMBREESTUDIO, ' +
                 'SUM(PD_DEUDANOMINAL) DEUDANOMINAL, ' +
                 'SUM(PD_INTERESMORA) INTERESMORA, ' +
                 '(SUM(PD_INTERESMORA) * (PP_PORCDESCINTERES / 100)) + PP_MONTODESCINTERES DESCINTERESMORA, ' +
                 'SUM(PD_DEUDANOMINAL)+(SUM(PD_INTERESMORA)*(1-PP_PORCDESCINTERES/100))-PP_MONTODESCINTERES DEUDATOTAL, PP_GASTOADMINISTRATIVO GASTOADMINISTRATIVO, ' +
                 'NVL(PP_COMISIONGESTOR, 0) COMISIONGESTOR, ' +
                 'DEUDA.GET_INTERESFINANCIACIONPLAN(PP_ID) INTERESFINANC, ' +
                 'SUM(PD_DEUDANOMINAL)+(SUM(PD_INTERESMORA)*(1-PP_PORCDESCINTERES/100))-PP_MONTODESCINTERES+PP_GASTOADMINISTRATIVO+NVL(PP_COMISIONGESTOR, 0)+DEUDA.GET_INTERESFINANCIACIONPLAN(PP_ID) TOTAL, ' +
                 'DEUDA.GET_VALORESPLAN(PP_ID) VALORES, DEUDA.GET_VALORESRECHAZADOSPLAN(PP_ID) VALORESRECH,' +
                 'DEUDA.GET_VALORESSALDOIMPUTARPLAN(PP_ID) SALDO, PP_OBSERVACIONES OBSERVACIONES, ' +
                 'SUM(PD_DEUDANOMINAL)+(SUM(PD_INTERESMORA)*(1-PP_PORCDESCINTERES/100))-PP_MONTODESCINTERES+PP_GASTOADMINISTRATIVO+NVL(PP_COMISIONGESTOR, 0)+DEUDA.GET_INTERESFINANCIACIONPLAN(PP_ID)-DEUDA.GET_VALORESPLAN(PP_ID) VALORESPENDIENTES, ' +
                 'DEUDA.GET_PROXCUOTAPLAN(PP_ID) CUOTAPROX, DEUDA.GET_VENCIMIENTOPROXCUOTAPLAN(PP_ID) CUOTAVENC, PP_IDGESTOR, PP_FECHAMODIFGESTOR, ' +
                 'COBRANZA.GETANTICIPOPLAN(PP_ID) ANTICIPO, PP_BIBLIORATO, PP_SECTOR, PP_TIPOBIBLIORATO, PP_FECHAALTA, AFILIACION.IS_EMPRESAVIP(PP_CONTRATO) ESVIP, ' +
                 'DECODE(PP_NOMBREARCHIVO, NULL, ''N'', ''S'') EXISTENOMBREARCHIVO, PP_USUBAJA ' +
            'FROM ACO_CONTRATO, AEM_EMPRESA, ZPD_PLANDEUDA, ZPP_PLANPAGO, CTB_TABLAS ESPLA, CTB_TABLAS AFEST, AGC_GESTORCUENTA AGCESTUDIO, AGC_GESTORCUENTA AGCGESTOR ' +
           'WHERE PD_IDPLANPAGO (+) = PP_ID ' +
             'AND ESPLA.TB_CLAVE = ''ESPLA'' ' +
             'AND ESPLA.TB_CODIGO = PP_ESTADO ' +
             'AND AFEST.TB_CLAVE = ''AFEST'' ' +
             'AND AFEST.TB_CODIGO = CO_ESTADO ' +
             'AND PP_CONTRATO = CO_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND PP_IDGESTOR = AGCGESTOR.GC_ID (+) ' +
             'AND PP_IDESTUDIO = AGCESTUDIO.GC_ID (+) ';

  sWhere := '';
  if edPP_ID.Value <> 0 then
    sWhere := sWhere + ' AND PP_ID = ' + IntToStr(edPP_ID.Value);

  if fraPP_CONTRATO.IsSelected then
    sWhere := sWhere + ' AND PP_CONTRATO = ' + IntToStr(fraPP_CONTRATO.edContrato.Value);

  if cmbPP_ESTADO.Text <> '' then
    sWhere := sWhere + ' AND PP_ESTADO ' + cmbPP_ESTADO.InSql;

  if rbGestorActual.Checked then
  begin
    if fraGestorCuenta.IsEmpty then
    begin
      InvalidMsg(fraGestorCuenta.edCodigo, 'Debe elegir un gestor.');
      Exit;
    end
    else
      sWhere := sWhere + ' AND PP_IDGESTOR = ' + SqlValue(fraGestorCuenta.Value) ;
  end;

  if fraEstudio.IsSelected then
    sWhere := sWhere + ' AND PP_IDESTUDIO = ' + SqlValue(fraEstudio.Value) ;

  if chkActivos.Checked then
    sWhere := sWhere + ' AND PP_FECHABAJA IS NULL';

  if chkCuotasVencidas.Checked then
    sWhere := sWhere + ' AND ART.DEUDA.GET_VENCIMIENTOPROXCUOTAPLAN(PP_ID) <= ART.ACTUALDATE';

  if rbSectorLeg.Checked then
    sWhere := sWhere + ' AND PP_IDGESTOR IS NULL '    // legales
  else if rbSectorCob.Checked then
    sWhere := sWhere + ' AND PP_IDGESTOR IS NOT NULL ';    // cobranzas

  sWhere := sWhere + DoFiltro(grbPreAcuerdo);
  sWhere := sWhere + DoFiltro(grbConvenio);

  if edEM_SECTOR.Text <> '' then
    sWhere := sWhere + ' AND EM_SECTOR ' + edEM_SECTOR.InSql;

  sdqConsulta.SQL.Text := sSql + sWhere + sGroup + SortDialog.OrderBy;
  inherited;
  CalcTotales;

  if sdqConsulta.IsEmpty then
    MessageDlg('No existen datos para esta selección.', mtWarning, [mbOK], 0);
end;

procedure TfrmConsultaPlanes.tbNuevoClick(Sender: TObject);
begin
  frmCargaPreAcuerdos.Free;
  frmCargaPreAcuerdos := TfrmCargaPreAcuerdos.Create ( Self );
  frmCargaPreAcuerdos.ModoABM := unCustomPanelABM.maAlta;
end;

procedure TfrmConsultaPlanes.tbModificarClick(Sender: TObject);
begin
  frmCargaPreAcuerdos.Free;
  frmCargaPreAcuerdos := TfrmCargaPreAcuerdos.Create ( Self );
  frmCargaPreAcuerdos.ModoABM := unCustomPanelABM.maModificacion;
  frmCargaPreAcuerdos.DoCargar(sdqConsulta.FieldByName( 'PP_ID' ).AsString);
end;

procedure TfrmConsultaPlanes.tbEliminarClick(Sender: TObject);
var
  sSql: string;
  IDPlanPago: integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty  then
  begin
    if sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString = 'A' then
    begin
      if (MsgBox('¿Está usted seguro de querer eliminar este preacuerdo?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
          IDPlanPago := sdqConsulta.FieldByName('PP_ID').AsInteger;

          sSql := 'UPDATE ZPP_PLANPAGO SET ' +
                  '       PP_FECHABAJA = ACTUALDATE, PP_USUBAJA = ' + SqlValue( frmPrincipal.DBLogin.UserID ) +
                  ' WHERE PP_ID = ' + SqlValue( IDPlanPago );
          EjecutarSqlST( sSql );

          CommitTrans;
          tbRefrescarClick ( nil );
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
    end
    else
      MessageDlg('El registro no corresponde a un preacuerdo.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmConsultaPlanes.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultaPlanes.EnableButtons( AEnabled : Boolean = True);
begin
  inherited;
  tbConvertir.Enabled := AEnabled;
end;

procedure TfrmConsultaPlanes.tbLimpiarClick(Sender: TObject);
var
  bHabilitarEstudio: Boolean;
begin
  inherited;

  fraPP_CONTRATO.Clear;
  edPP_ID.Clear;
  cmbPP_ESTADO.Clear;

  bHabilitarEstudio := HabilitarEstudio();
  if bHabilitarEstudio then
    rbTodosGestores.Checked := True
  else
    rbGestorActual.Checked := True;

  chkActivos.Checked := True;
  cmbPP_FECHAAPROBADODesde.Clear;
  cmbPP_FECHAAPROBADOHasta.Clear;
  cmbPP_FECHAALTADesde.Clear;
  cmbPP_FECHAALTAHasta.Clear;
  fraGestorCuenta.Value := StrToInt(fIDGestorActual);
  fraEstudio.Clear;

  if rbSectorTodos.Enabled then
    rbSectorTodos.Checked := True    // todos
  else
    rbSectorLeg.Checked := True;     // legales

  edEM_SECTOR.Clear;
  edTotalRegistros.Clear;
end;

procedure TfrmConsultaPlanes.mnuImprimirPlanClick(Sender: TObject);
var
  Tipo: string;
begin
  Tipo := sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsSTring;
             
  if Tipo = 'E' then
    MsgBox( 'No puede imprimir cuando se trata de un Cobro con Estado de Deuda', MB_OK + MB_ICONERROR )
  else
  begin
    if (Tipo = 'C') or (Tipo = 'B') then
    begin
      //Se trata de un convenio - convenio cuota bonificada
      with TQrConvenio.Create( self ) do
      begin
        Preparar( sdqConsulta.FieldByName('PP_ID').AsSTring );
        Free;
      end;
    end;

    with TfrmQrPlanFinanciamiento.Create( self ) do
    begin
      Preparar (sdqConsulta.FieldByName('PP_ID').AsString);
      Free;
    end;
  end;
end;

procedure TfrmConsultaPlanes.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick( nil );
end;

procedure TfrmConsultaPlanes.mnuImprimirEstadodeCuentaClick(Sender: TObject);
begin
  with TfrmQrEstadoCuenta.Create( self ) do
  begin
    Preparar (sdqConsulta.FieldByName('PP_ID').AsString);
    Free;
  end;
end;

procedure TfrmConsultaPlanes.ActualizarGestor(Sender: TObject);
begin
  fraGestorCuenta.edCodigo.Enabled       := rbGestorActual.Checked;
  fraGestorCuenta.cmbDescripcion.Enabled := rbGestorActual.Checked;
end;

procedure TfrmConsultaPlanes.mnuEnviarPlanConvenioClick(Sender: TObject);
var
  Tipo: String;
begin
  Tipo := sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsSTring;

  if Sender = mnuEnviarPlanConvenio then
    begin
      Verificar(Tipo = 'E', nil, 'No puede enviar por mail cuando se trata de un Cobro con Estado de Deuda');

      pEnvioPDF := ePlanConvenio
    end
  else if Sender = mnuEnviarEstadodeCuenta then
    pEnvioPDF := eEstadoCuenta
  else if Sender = mnuEnviarPlanConvenioEstCta then
    pEnvioPDF := ePlanConvenioConEstadoCuenta;

  EnvioMail;
end;

procedure TfrmConsultaPlanes.EnvioMail;
var
  Tipo, IDPlan, DescrTipo, NombreArchivoConvenio: string;
  NombreArchivoPlan, NombreArchivoEstCuenta, sSubject: string;
  vAdjuntos: TArrayOfAttach;
  iCantAdjuntos: Integer;
begin
  IDPlan := sdqConsulta.FieldByName('PP_ID').AsString;
  Tipo   := sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString;

  if pEnvioPDF in [ePlanConvenio, ePlanConvenioConEstadoCuenta] then
    begin
      //Genera el pdf del Convenio - Convenio cuota bonificada
      if (Tipo = 'C') or (Tipo = 'B') then
      begin
        NombreArchivoConvenio := TempPath + 'Convenio' + IDPlan + '.pdf';
        with TQrConvenio.Create( self ) do
        begin
          Preparar( IDPlan, NombreArchivoConvenio );
          Free;
        end;
      end;

      //Genera el pdf del Plan
      NombreArchivoPlan := TempPath + 'Plan' + IDPlan + '.pdf';
      with TfrmQrPlanFinanciamiento.Create( self ) do
      begin
        Preparar ( IDPlan, NombreArchivoPlan );
        Free;
      end;
    end;

  if pEnvioPDF in [eEstadoCuenta, ePlanConvenioConEstadoCuenta] then
    begin
      //Genera el pdf del Estado de Cuenta
      NombreArchivoEstCuenta := TempPath + 'EstCuenta' + IDPlan + '.pdf';
      with TfrmQrEstadoCuenta.Create( self ) do
      begin
        Preparar ( IDPlan, NombreArchivoEstCuenta );
        Free;
      end;
    end;

  if Tipo = 'C' then
    DescrTipo := 'Convenio'
  else if Tipo = 'P' then
    DescrTipo := 'Plan de Pago'
  else if Tipo = 'A' then
    DescrTipo := 'Preacuerdo'
  else if Tipo = 'E' then
    DescrTipo := 'Cobro con Estado de Deuda'
  else if Tipo = 'B' then
    DescrTipo := 'Convenio Cuota Bonificada'
  else
    DescrTipo := '';

  iCantAdjuntos := 0;

  if pEnvioPDF in [ePlanConvenio, ePlanConvenioConEstadoCuenta] then
    begin
      //Attachments
      if NombreArchivoPlan <> '' then
        begin
          inc(iCantAdjuntos);

          SetLength(vAdjuntos, iCantAdjuntos);
          vAdjuntos[iCantAdjuntos-1] := GetAttach(NombreArchivoPlan, 0);
        end;

      //Attachments
      if NombreArchivoConvenio <> '' then
        begin
          inc(iCantAdjuntos);

          SetLength(vAdjuntos, iCantAdjuntos);
          vAdjuntos[iCantAdjuntos-1] := GetAttach(NombreArchivoConvenio, 0);
        end;

      sSubject := DescrTipo + ' Nº ' + IDPlan;
      if pEnvioPDF = ePlanConvenioConEstadoCuenta then
        sSubject := sSubject + ', con Estado de Cuenta';
    end;

  if pEnvioPDF in [eEstadoCuenta, ePlanConvenioConEstadoCuenta] then
    begin
      //Attachments
      if NombreArchivoEstCuenta <> '' then
        begin
          inc(iCantAdjuntos);

          SetLength(vAdjuntos, iCantAdjuntos);
          vAdjuntos[iCantAdjuntos-1] := GetAttach(NombreArchivoEstCuenta, 0);
        end;

      if pEnvioPDF = eEstadoCuenta then
        sSubject := 'Estado de Cuenta - ' + DescrTipo + ' Nº ' + IDPlan;
    end;

  if unMoldeEnvioMail.EnviarMailBD( '', sSubject, [oAlwaysShowDialog, oAutoFirma, oDeleteAttach], 'Provincia ART', vAdjuntos, sdqConsulta.FieldByName('PP_CONTRATO').AsInteger, tcDefault, False ) then
    InfoHint(nil, 'El mail ha sido enviado con éxito.');
end;

procedure TfrmConsultaPlanes.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'COMISIONGESTOR' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'COMISIONGESTOR' )).Currency := True;

  if sdqConsulta.FieldByName( 'DEUDANOMINAL' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEUDANOMINAL' )).Currency := True;

  if sdqConsulta.FieldByName( 'INTERESMORA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'INTERESMORA' )).Currency := True;

  if sdqConsulta.FieldByName( 'DESCINTERESMORA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DESCINTERESMORA' )).Currency := True;

  if sdqConsulta.FieldByName( 'DEUDATOTAL' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEUDATOTAL' )).Currency := True;

  if sdqConsulta.FieldByName( 'GASTOADMINISTRATIVO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'GASTOADMINISTRATIVO' )).Currency := True;

  if sdqConsulta.FieldByName( 'INTERESFINANC' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'INTERESFINANC' )).Currency := True;

  if sdqConsulta.FieldByName( 'TOTAL' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'TOTAL' )).Currency := True;

  if sdqConsulta.FieldByName( 'VALORESRECH' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'VALORESRECH' )).Currency := True;

  if sdqConsulta.FieldByName( 'VALORES' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'VALORES' )).Currency := True;

  if sdqConsulta.FieldByName( 'SALDO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'SALDO' )).Currency := True;

  if sdqConsulta.FieldByName( 'ANTICIPO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ANTICIPO' )).Currency := True;

  if sdqConsulta.FieldByName( 'VALORESPENDIENTES' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'VALORESPENDIENTES' )).Currency := True;
end;

procedure TfrmConsultaPlanes.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmConsultaPlanes.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));
end;

procedure TfrmConsultaPlanes.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmConsultaPlanes.tbModificarGestorClick(Sender: TObject);
var
  sSQL: string;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');

  if fpGestor.ShowModal = mrOk then
  begin
    sSQL := 'UPDATE ZPP_PLANPAGO ' +
               'SET PP_IDGESTOR = :IDGESTOR ' +
             'WHERE PP_ID = :ID';
    EjecutarSQLEx(sSQL, [fraPP_IDGESTOR.Value, sdqConsulta.FieldByName('PP_ID').AsInteger]);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsultaPlanes.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraPP_IDGESTOR.IsEmpty, fraPP_IDGESTOR.edCodigo, 'Debe seleccionar un gestor para guardar la modificación.');
  fpGestor.ModalResult := mrOk;
end;

procedure TfrmConsultaPlanes.fpGestorBeforeShow(Sender: TObject);
begin
  inherited;
  fraPP_IDGESTOR.Value := sdqConsulta.FieldByName('PP_IDGESTOR').AsInteger;
end;

procedure TfrmConsultaPlanes.mnuImprimirReciboClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    InvalidMsg ( Grid, 'No hay ninguna fila de la grilla seleccionada' )
  else
    DoReImprimirRecibosPlan( sdqConsulta.FieldByName( 'PP_ID' ).AsInteger, 1 );
end;

procedure TfrmConsultaPlanes.mnuConvertirPreaCuerdoEnPlanClick(Sender: TObject);
var
  bConvertirOk: Boolean;
begin
  bConvertirOk := False;

  if sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString = 'A' then
    begin
      if (MsgBox('¿Está seguro de querer convertir este preacuerdo a ' + TMenuItem(Sender).Caption + ' ?', MB_YESNO + MB_ICONQUESTION) = mrYes) then
        begin
          // Si se trata de un preacuerdo lo convierte en plan
          if Sender = mnuConvertirPreaCuerdoEnPlan then
            bConvertirOk := Do_ConvertirPreacuerdo( sdqConsulta.FieldByName('PP_ID').AsInteger, True, frmPrincipal.DBLogin.UserID, 'P' )

          // Si se trata de un preacuerdo lo convierte en convenio, o en convenio cuota bonificada
          else if (Sender = mnuConvertirPreaCuerdoEnConvenio) or (Sender = mnuConvertirPreaCuerdoEnConvenioCuotaBonif) then
            begin
              with TfrmConvertirEnConvenio.Create( nil ) do
                try
                  ConTrans     := True;
                  Id           := sdqConsulta.FieldByName('PP_ID').AsInteger;
                  TipoConvenio := Iif(Sender = mnuConvertirPreaCuerdoEnConvenio, tcConvenio, tcConvenioCuotaBonif);

                  bConvertirOk := (ShowModal = mrOk);
                finally
                  free;
                end;
            end

          // Si se trata de un preacuerdo lo convierte en cobro con estado de deuda
          else if Sender = mnuConvertirPreaCuerdoEnCobroEstDeuda then
            bConvertirOk := Do_ConvertirPreacuerdo( sdqConsulta.FieldByName('PP_ID').AsInteger, True, frmPrincipal.DBLogin.UserID, 'E' );

          if bConvertirOk then
            begin
              MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
              tbRefrescar.Click;
            end;
        end;
    end
  else
    MessageDlg('El registro no corresponde a un preacuerdo.', mtWarning, [mbOK], 0);
end;

procedure TfrmConsultaPlanes.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
                     
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and not sdqConsulta.FieldByName('PP_FECHABAJA').IsNull then
    AFont.Color := clRed
  else if sdqConsulta.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;

  if Highlight then
    Background := clTeal
  else
    Background := clInfoBk;
end;

procedure TfrmConsultaPlanes.Do_CancelarPlan(IdPlan: TTableId);
var
  sSql: String;
begin
  sSql := 'COBRANZA.DO_CANCELARPLAN(:IdPlan, :Usuario);';
  EjecutarStoreStEx( sSql, [IdPlan, Sesion.UserId]);
end;

procedure TfrmConsultaPlanes.tbCancelarClick(Sender: TObject);
var
  sSql: string;
  IDPlanPago: integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty  then
  begin
    sSql := 'SELECT 1 ' +
             'FROM CTB_TABLAS ' +
            'WHERE TB_ESPECIAL1=''S'' ' +   // es modificable
              'AND TB_ESPECIAL2<>''A'' ' +  // no es preacuerdo
              'AND TB_CLAVE=''ESPLA'' ' +
              'AND TB_CODIGO=' + SqlValue(sdqConsulta.FieldByName('PP_ESTADO').AsString);

    if ExisteSql(sSql) then
    begin
      if (MsgBox('¿Está usted seguro de querer pasar este plan a No Cumplido?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
          IDPlanPago := sdqConsulta.FieldByName('PP_ID').AsInteger;

          Do_CancelarPlan( IDPlanPago );
          Do_AnularMontoRefinanciacionPlan( IDPlanPago );

          CommitTrans;
          tbRefrescarClick ( nil );
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
    end
    else
      MessageDlg('El registro no puede cancelarse.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmConsultaPlanes.mnuConvertirPreaCuerdoEnPopup(Sender: TObject);
var
  bPermitirConvCuotaBonif, bSinCuotas: Boolean;
begin
  inherited;

  bSinCuotas              := (sdqConsulta.FieldByName('CANTCUOTAS').AsInteger = 0);
  bPermitirConvCuotaBonif := (Seguridad.Claves.IsActive('PermitirConvenioCuotaBonificada') and (sdqConsulta.FieldByName('VALORES').AsInteger = 0));

  mnuConvertirPreaCuerdoEnPlan.Visible               := not bSinCuotas;
  mnuConvertirPreaCuerdoEnConvenio.Visible           := not bSinCuotas;
  mnuConvertirPreaCuerdoEnConvenioCuotaBonif.Visible := not bSinCuotas and bPermitirConvCuotaBonif;
  mnuConvertirPreaCuerdoEnCobroEstDeuda.Visible      := bSinCuotas;
end;

procedure TfrmConsultaPlanes.tbConvertirClick(Sender: TObject);
begin
  tbConvertir.CheckMenuDropdown;
end;

procedure TfrmConsultaPlanes.tbBiblioratoClick(Sender: TObject);
var
  sSQL: string;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  if fpBibliorato.ShowModal = mrOK then
    begin
      sSQL := 'UPDATE ZPP_PLANPAGO ' +
                 'SET PP_BIBLIORATO = :NroBibliorato, ' +
                     'PP_SECTOR = :Sector, ' +
                     'PP_TIPOBIBLIORATO = :Tipo ' +
               'WHERE PP_ID = :ID';

      case rgOperacion.ItemIndex of
        0: EjecutarSQLEx(sSql, [nil, nil, nil, sdqConsulta.FieldByName('PP_ID').AsInteger]); // Limpiar
        1: EjecutarSQLEx(sSql, [edPP_Bibliorato.Value, Sesion.Sector, Iif(rbCobranzas.Checked, 'C', 'L'), sdqConsulta.FieldByName('PP_ID').AsInteger]); // Cargar
      end;

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmConsultaPlanes.btnAceptarBiblioratoClick(Sender: TObject);
begin
  if rgOperacion.ItemIndex = 1 then  // Cargar
    begin
      Verificar(edPP_Bibliorato.Value <= 0, edPP_Bibliorato, 'Debe indicar el número de bibliorato para guardar la modificación.');
      Verificar(not (rbCobranzas.Checked or rbLegales.Checked), nil, 'Debe indicar el tipo de bibliorato.');
    end;

  fpBibliorato.ModalResult := mrOk;
end;

procedure TfrmConsultaPlanes.fpBiblioratoBeforeShow(Sender: TObject);
begin
  inherited;

  edPP_BIBLIORATO.Value := sdqConsulta.FieldByName('PP_BIBLIORATO').AsInteger;
  rbCobranzas.Checked   := (sdqConsulta.FieldByName('PP_TIPOBIBLIORATO').AsString = 'C');
  rbLegales.Checked     := (sdqConsulta.FieldByName('PP_TIPOBIBLIORATO').AsString = 'L');

  rgOperacion.ItemIndex := 1;  // Cargar
end;

procedure TfrmConsultaPlanes.rgOperacionClick(Sender: TObject);
begin
  VclExtra.LockControls([edPP_Bibliorato, rbCobranzas, rbLegales], rgOperacion.ItemIndex = 0);
end;

function TfrmConsultaPlanes.PermitirConsultaPlanesCob: Boolean;
begin
  Result := not Is_SectorLegal();
end;

procedure TfrmConsultaPlanes.tbImagenesClick(Sender: TObject);
begin
  tbImagenes.CheckMenuDropdown;
end;

procedure TfrmConsultaPlanes.mnuImagenesCargarClick(Sender: TObject);
var
  sSql, sNombreArchivoServidor, sNombreArchivo: String;
  IdPlan: TTableId;
  bContinuar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('PP_FECHABAJA').IsNull, nil, 'El plan se encuentra dado de baja.');

  if sdqConsulta.FieldByName('EXISTENOMBREARCHIVO').AsString = 'S' then
    bContinuar := (MsgBox('El plan de pagos ya tiene imágenes asociadas. ¿Desea sobreescribirlas?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    bContinuar := True;

  if bContinuar then
    with OpenDialog do
      begin
        Title      := 'Archivo del Plan de Pago';
        DefaultExt := 'pdf';
        Filter     := 'Archivos Adobe PDF (*.pdf)|*.pdf';

        if Execute then
          begin
            sNombreArchivo         := OpenDialog.FileName;
            IdPlan                 := sdqConsulta.FieldByName('PP_ID').AsInteger;
            sNombreArchivoServidor := Get_NombreArchivoEnvioPlanPago(IdPlan);

            CopyFileExt(sNombreArchivo, sNombreArchivoServidor, False);

            if FileExists(sNombreArchivoServidor) then
              begin
                sSql := 'UPDATE ZPP_PLANPAGO ' +
                           'SET PP_NOMBREARCHIVO = :NombreArch ' +
                         'WHERE PP_ID = :Id';
                EjecutarSqlEx(sSql, [sNombreArchivoServidor, IdPlan]);

                MsgBox('Imágenes del plan de pagos cargadas correctamente.', MB_ICONINFORMATION);
                RefreshData;
              end
            else
              MsgBox('Error al cargar las imágenes del plan de pagos ' + IntToStr(IdPlan), MB_ICONERROR);
          end;
      end;
end;

function TfrmConsultaPlanes.Is_ExisteArchivoPlanFilaActual(var NombreArchivo: String): Boolean;
var
  IdPlan: TTableId;
  bExiste: Boolean;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      IdPlan := sdqConsulta.FieldByName('PP_ID').AsInteger;

      bExiste := Is_ExisteArchivoPlanPago(IdPlan, NombreArchivo);
    end
  else
    bExiste := False;

  Result := bExiste;
end;

procedure TfrmConsultaPlanes.mnuImagenesVisualizarClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  if Is_ExisteArchivoPlanFilaActual(sNombreArchivo) then
    Do_ImprimirArchivoPlan(sNombreArchivo);
end;

procedure TfrmConsultaPlanes.tbPropiedadesClick(Sender: TObject);
var
  sSql: string;
  IDPlanPago: integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString <> 'A', nil, 'El registro no corresponde a un preacuerdo.');
  Verificar(sdqConsulta.FieldByName('PP_FECHABAJA').IsNull, nil, 'El preacuerdo no se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('PP_USUBAJA').AsString <> 'AUTOMATICO', nil, 'Solo puede reactivar preacuerdos dados de baja automáticamente.');

  if MsgBox('¿Está usted seguro de querer reactivar este preacuerdo?', MB_YESNO) = IDYES then
    begin
      IDPlanPago := sdqConsulta.FieldByName('PP_ID').AsInteger;

      sSql := 'UPDATE ZPP_PLANPAGO ' +
                 'SET PP_FECHABAJA = NULL, ' +
                     'PP_USUBAJA = NULL ' +
               'WHERE PP_ID = :IDPlanPago';
      EjecutarSqlEx(sSql, [IDPlanPago] );

      tbRefrescarClick(nil);
    end;
end;

end.


