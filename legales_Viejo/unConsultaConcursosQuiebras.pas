{
     Administracion de Concursos y Quiebras
     Creacion: 24/04/2002
     Autor: EJV.

     Modificado:
     FFirenze 29/05/2003
}
unit unConsultaConcursosQuiebras;

interface                              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, Mask, ToolEdit,
  DateComboBox, IntEdit, unFraCtbTablas, unFraEmpresa, StdCtrls, General,
  unfraUsuarios, Menus, unArtDbFrame, PatternEdit, unArtDBAwareFrame,
  RxToolEdit, RxPlacemnt;

type
  TfrmConsultaConcursosQuiebras = class(TfrmCustomConsulta)
    lbNroOrden: TLabel;
    edNroOrden: TEdit;
    fraEmpresa: TfraEmpresa;
    Label2: TLabel;
    fraFuero: TfraCtbTablas;
    Label3: TLabel;
    lbSindico: TLabel;
    lbJuzgado: TLabel;
    edGD_JUZGADO: TIntEdit;
    lbSecretaria: TLabel;
    edGD_SECRETARIA: TIntEdit;
    lbFechaConcurso: TLabel;
    edFechaConsursoDesde: TDateComboBox;
    Label5: TLabel;
    edFechaConsursoHasta: TDateComboBox;
    edFechaQuiebraHasta: TDateComboBox;
    LblCierrehta: TLabel;
    edFechaQuiebraDesde: TDateComboBox;
    lbFechaQuiebra: TLabel;
    lbAbogado: TLabel;
    edSindico: TEdit;
    fraAbogados: TfraAbogadosLegales;
    Label1: TLabel;
    fraEstado: TfraCtbTablas;
    Label4: TLabel;
    fraUsuario: TfraUsuario;
    Label6: TLabel;
    edFechaVto32Desde: TDateComboBox;
    Label8: TLabel;
    edFechaVto32Hasta: TDateComboBox;
    Label9: TLabel;
    edFechaVto200Desde: TDateComboBox;
    Label10: TLabel;
    edFechaVto200Hasta: TDateComboBox;
    fraUltimoEvento: TfraCtbTablas;
    Label11: TLabel;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    N1: TMenuItem;
    mnuListEstCuenta: TMenuItem;
    mnuListResSiniestros: TMenuItem;
    mnuListNomina: TMenuItem;
    Label12: TLabel;
    edFechaAsignDesde: TDateComboBox;
    edFechaAsignHasta: TDateComboBox;
    Label7: TLabel;
    chkSoloActivos: TCheckBox;
    Label13: TLabel;
    ShortCutControl1: TShortCutControl;
    tbVerUsuarioAlta: TToolButton;
    tbSeparador: TToolButton;
    fraJurisdiccion: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure DoCargaABM(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuListNominaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbVerUsuarioAltaClick(Sender: TObject);
  private
    function IsRegistroDadoDeBaja(): Boolean;
    function IsRegistroTerminado(): Boolean;
  public
  end;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, unABMConcursosQuiebras, unConsulta,
  VCLExtra, unABMAcuerdo, unQrEstadoCuentaDetalle, unVisualizador;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.FormCreate(Sender: TObject);
begin
  tbSeparador.Left      := 360;
  tbVerUsuarioAlta.Left := 360;

  fraFuero.Clave          := 'FUERO';
  fraFuero.ExtraCondition := ' AND TB_ESPECIAL1 IS NOT NULL ';

  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    Showbajas   := True;
  end;

  fraEstado.Clave         := 'ESTCQ';
  fraUltimoEvento.Clave   := 'EVCYQ';
  fraAbogados.Parte       := paPropia;
  fraEmpresa.ShowBajas    := true;
  fraEmpresa.UltContrato  := true;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbRefrescarClick(Sender: TObject);
var
  sSql,
  sWhere : String;
begin
  sSql := 'SELECT lcq.cq_nroorden, lcq.cq_cuit, cmp.mp_nombre, lcq.cq_deudanominal, ' +
          '       lcq.cq_deudatotal, lcq.cq_deudaverificada, lcq.cq_fechaverificacioncredito, lcq.cq_fechaconcurso, ' +
          '       lcq.cq_fechaquiebra, lcq.cq_fechaasign, lcq.cq_fechavtoart32, ' +
          '       lcq.cq_fechavtoart200, lcq.cq_montoprivilegio, lcq.cq_montoquirog, ' +
          '       lcq.cq_sindico, lcq.cq_direccionsind, lcq.cq_localidadsind, ' +
          '       lcq.cq_telefonosind, lcq.cq_juzgado, lcq.cq_secretaria, lcq.cq_fuero, ' +
          '       fue.tb_descripcion fue_descripcion, lcq.cq_jurisdiccion, ' +
          '       jur.ju_descripcion jur_descripcion, lcq.cq_abogado, lbo.bo_nombre, ' +
          '       lcq.cq_montohomolog, lcq.cq_estado, est.tb_descripcion est_estado, ' +
          '       lcq.cq_autorizacion, lcq.cq_ultperconcurso, lcq.cq_ultperquiebra, ' +
          '       lcq.cq_legajo, eve.tb_descripcion ultimo_evento, cmp.mp_contrato contrato, ' +
          '       lcq.cq_fechatomaconconcurso, lcq.cq_fechatomaconquiebra, ' +
          '       lcq.cq_usualta usualta, trunc(lcq.cq_fechaalta) fechaalta, ' +
          '       lcq.cq_usumodif usumodif, trunc(lcq.cq_fechamodif) fechamodif, ' +
          '       lcq.cq_fechafingestion, lcq.cq_nroexpediente || nvl2(lcq.cq_anioexpediente, ''/'' || lcq.cq_anioexpediente, '''') expediente ' +
          '  FROM ctb_tablas eve, ctb_tablas fue, ctb_tablas est, legales.lju_jurisdiccion jur, ' +
          '       cmp_empresas cmp, legales.lbo_abogado lbo, lcq_concyquiebra lcq ' +
          ' WHERE LCQ.CQ_FUERO = FUE.TB_CODIGO(+) ' +
          '   AND TO_NUMBER(LCQ.CQ_JURISDICCION) = JUR.JU_ID(+)' +
          '   AND LCQ.CQ_CUIT = CMP.MP_CUIT ' +
          '   AND LCQ.CQ_ABOGADO = LBO.BO_ID(+) ' +
          '   AND LCQ.CQ_ESTADO = EST.TB_CODIGO ' +
          '   AND LEGALES.GET_MAXEVENTOCQ(LCQ.CQ_NROORDEN) = EVE.TB_CODIGO(+) ' +
          '   AND EST.TB_CLAVE(+) = ''ESTCQ'' ' +
          '   AND FUE.TB_CLAVE(+) = ''FUERO'' ' +
          '   AND EVE.TB_CLAVE(+) = ''EVCYQ'' ';

     // Filtro.
    if fraAbogados.IsSelected then
        sWhere := sWhere + ' AND LCQ.CQ_ABOGADO = ' + SqlValue(fraAbogados.Codigo);
     if fraEmpresa.IsSelected then
        sWhere := sWhere + ' AND LCQ.CQ_CUIT = '+ SqlValue(fraEmpresa.CUIT);
     if fraFuero.IsSelected then
        sWhere := sWhere + ' AND LCQ.CQ_FUERO = '+ SqlString( fraFuero.Value, True );
     if chkSoloActivos.Checked then
        sWhere := sWhere + ' AND LCQ.CQ_ESTADO <> ''06''';
     if fraJurisdiccion.IsSelected then
        sWhere := sWhere + ' AND LCQ.CQ_JURISDICCION = '+ SqlString( fraJurisdiccion.Codigo, True );
     if edNroOrden.Text <> '' then
        sWhere := sWhere + ' AND LCQ.CQ_NROORDEN = '+ SqlString( edNroOrden.Text );
     if edGD_JUZGADO.Text <> '' then
        sWhere := sWhere + ' AND LCQ.CQ_JUZGADO = '+ SqlString( edGD_JUZGADO.Text, False );
     if edGD_SECRETARIA.Text <> '' then
        sWhere := sWhere + ' AND LCQ.CQ_SECRETARIA = '+ SqlString( edGD_SECRETARIA.Text, False );
     if edSindico.Text <> '' then
        sWhere := sWhere + ' AND UPPER( LCQ.CQ_SINDICO ) LIKE ''' + SqlString( edSindico.Text, False ) + '%''';
     if fraUltimoEvento.IsSelected Then
        sWhere := sWhere + ' AND LEGALES.GET_MAXEVENTOCQ( LCQ.CQ_NROORDEN ) = ' + SqlValue( fraUltimoEvento.Value );



     // Fecha de Concurso
     if not edFechaConsursoDesde.IsEmpty then begin
        if not edFechaConsursoHasta.IsEmpty then begin
                sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHACONCURSO', edFechaConsursoDesde.Date, edFechaConsursoHasta.Date);
        end else begin
                sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHACONCURSO',edFechaConsursoDesde.Date, 0);
        end;
     end else begin
            if not edFechaConsursoHasta.IsEmpty then begin
                sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHACONCURSO', 0, edFechaConsursoHasta.Date);
            end;
     end;
     // Fecha de Quiebras.
     if not edFechaQuiebraDesde.IsEmpty then begin
          if not edFechaQuiebraHasta.IsEmpty then begin
                  sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAQUIEBRA', edFechaQuiebraDesde.Date, edFechaQuiebraHasta.Date);
          end else begin
                  sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAQUIEBRA',edFechaQuiebraDesde.Date,0);
          end;
     end else begin
          if not edFechaQuiebraHasta.IsEmpty then begin
                  sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAQUIEBRA', 0, edFechaQuiebraHasta.Date);
          end;
     end;

     if not (edFechaAsignDesde.IsEmpty and edFechaAsignHasta.IsEmpty) Then
       sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAASIGN', edFechaAsignDesde.Date, edFechaAsignHasta.Date);

     if not (edFechaVto32Desde.IsEmpty and edFechaVto32Hasta.IsEmpty) Then
       sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAVTOART32', edFechaVto32Desde.Date, edFechaVto32Hasta.Date);

     if not (edFechaVto200Desde.IsEmpty and edFechaVto200Hasta.IsEmpty) Then
       sWhere := sWhere + ' AND ' + SqlBetween('LCQ.CQ_FECHAVTOART200', edFechaVto200Desde.Date, edFechaVto200Hasta.Date);

     // Estado.
     if fraEstado.value <> '' then
        sWhere := sWhere + ' AND LCQ.CQ_ESTADO = '+ SqlString( fraEstado.value, True );
     // Autorizo.
     if fraUsuario.edCodigo.Text <> '' then
        sWhere := sWhere + ' AND LCQ.CQ_AUTORIZACION = '+ SqlString( fraUsuario.edCodigo.Text, True );
     //
     sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
     inherited;
     //
     if sdqConsulta.IsEmpty then begin
        msgBox('No existen datos para esta selección...' );
        Abort;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbNuevoClick(Sender: TObject);
var
  frmABMConcursosQuiebras : TfrmABMConcursosQuiebras;
begin
  frmABMConcursosQuiebras := TfrmABMConcursosQuiebras.Create( Self );
  Try
    frmABMConcursosQuiebras.Caption := LGQ_CONQUIE_ALTA;
    if frmABMConcursosQuiebras.ShowModal = mrOK then
      tbRefrescarClick( Self );
  finally
    FreeAndNil( frmABMConcursosQuiebras );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbModificarClick(Sender: TObject);
begin
  DoCargaABM( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.DoCargaABM(Sender: TObject);
var
  frmABMConcursosQuiebras : TfrmABMConcursosQuiebras;
begin
  if NOT sdqConsulta.IsEmpty Then begin
    if IsRegistroDadoDeBaja() then
      MsgBox( 'El registro se encuentra dado de baja' )
    else
      begin
        frmABMConcursosQuiebras := TfrmABMConcursosQuiebras.Create( Self );
        Try
          frmABMConcursosQuiebras.Caption := LGQ_CONQUIE_MODIF;
          frmABMConcursosQuiebras.GetRecuperaDatos( sdqConsulta.FieldByName( 'CQ_NROORDEN' ).asInteger );
          if frmABMConcursosQuiebras.ShowModal = mrOK then
            tbRefrescarClick( Self );
        finally
          frmABMConcursosQuiebras.Free;
        end;
      end;  
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbLimpiarClick(Sender: TObject);
begin
  edNroOrden.Clear;
  fraEmpresa.CUIT :=  '';
  edSindico.Clear;
  chkSoloActivos.Checked := True;
  fraAbogados.Clear;
  fraFuero.Limpiar;
  fraJurisdiccion.Clear;
  edGD_JUZGADO.Clear;
  edGD_SECRETARIA.Clear;
  edFechaConsursoDesde.Clear;
  edFechaConsursoHasta.Clear;
  edFechaQuiebraDesde.Clear;
  edFechaQuiebraHasta.Clear;
  fraEstado.Limpiar;
  fraUsuario.Limpiar;
  edFechaAsignDesde.Clear;
  edFechaAsignHasta.Clear;
  edFechaVto32Desde.Clear ;
  edFechaVto32Hasta.Clear ;
  edFechaVto200Desde.Clear ;
  edFechaVto200Hasta.Clear ;
  fraUltimoEvento.Clear ;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuAdministracindeJuiciosCQ.Enabled := True;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.mnuImpResultadosClick( Sender: TObject);
begin
  PrintResults ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.mnuListNominaClick(Sender: TObject);
var
  frmConsulta : TfrmConsulta;
  sSql        : String;
begin

  DecimalSeparator := ',';
  ThousandSeparator := '.';

  if TMenuItem( Sender ).Tag = 0 then  // estado de cuenta
    begin
      if sdqConsulta.Active then
        begin
          if (sdqConsulta.FieldByName( 'CQ_ESTADO' ).AsString = '01') or (sdqConsulta.FieldByName( 'CQ_ESTADO' ).AsString = '03') then  // 01:	EN COBRANZAS / 03: NO INSINUADO
            begin
                with TfrmEstadoCuentaDetalle.Create( Self ) do
                  begin
                    try
//                      TipoResumen   := 'nosaldado';
                      TipoResumen   := 'saldodeudor';
                      PeriodoDesde  := '';
                      PeriodoHasta  := '';

                      if not sdqConsulta.FieldByName( 'CQ_FECHAQUIEBRA' ).IsNull then
                        Vencimiento := sdqConsulta.FieldByName( 'CQ_FECHAQUIEBRA' ).AsDateTime
                      else
                        Vencimiento := sdqConsulta.FieldByName( 'CQ_FECHACONCURSO' ).AsDateTime;

                      ClasficaDevengado  := False;
                      DeudaExtraJudicial := True;
                      ImprimePorCuit     := True;
                      AgrupaPorCodigo    := True;
                      FechaContable      := 0;
                      NoIncluirConcQuiebra := False;
                      NoIncluirReclamoAFIP := False;
                      InteresPerConcQuiebra := True;
                      DeudaExtraJudicial := False;
                      NoIncluirChequesRech  := True;

                      Contrato := sdqConsulta.FieldByName( 'CONTRATO' ).AsString;

                      if Execute then
                         Visualizar(qrEstadoCuentaDetalle, GetValores(), [oForceShowModal, oMailNotAllowed, oAlwaysShowDialog, oExportPDFNotAllowed])//Preview
                        //Print //Preview
                      else
                        MessageDlg( 'No hay datos para procesar el contrato ' + Contrato, mtError, [mbOK], 0 );
                    finally
                      free;
                    end;
                  end;
            end;
        end
      else
        MsgBox( 'No se encuentran datos en la grilla' );
    end
  else
    begin
      frmConsulta := TfrmConsulta.Create( Self );
      try
        Case TMenuItem( Sender ).Tag of
          { Copiado de RedPres.unConsSin: }
          1: sSql := 'SELECT UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, ''-'') "Siniestro", ' +
                            'EX_CUIL CUIL, TJ_NOMBRE "Apellido y Nombre",  EX_CUIT CUIT, MP_NOMBRE "Razón Social", ' +
                            'ex_fechaaccidente "F.Accidente", ex_fecharecaida "F.Recaída", ex_bajamedica "F.Baja", ' +
                            'ex_altamedica "F.Alta", EX_FECHAREASIGNACION "F.Reasignación", LG_NOMBRE "Delegación", ' +
                            'ex_diagnosticooms "CIE-10", ex_fechaalta "F.Carga", EX_SINIESTRORED "Sin.Mutual", ' +
                            'CA_DESCRIPCION "Prestador", CA_FECHABAJA, ca_localidad "Loc.Prestador", ' +
                            'pv_descripcion "Pcia. Prestador", GP_NOMBRE "Grupo de Trabajo", ' +
                            'ART.LIQ.Get_ImporteLiquidadoILT(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) ILT, ' +
                            'ART.LIQ.Get_ImporteLiquidadoILP(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) ILP, ' +
                            'ART.LIQ.Get_ImporteLiquidadoMortales(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) "Mortales", ' +
                            'ART.LIQ.Get_ImporteConceptos(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) "Otros Conceptos", ' +
                            'ART.SIN.GET_CANTDIASCAIDOS(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) "Días Caídos", ' +
                            'ART.AMEBPBA.Get_ImportePrestMedicas(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) "Prestaciones Médicas", ' +
                            'art.amebpba.Get_CategoriaTrab(ex_cuit, ex_cuil) "Categoria", EX_HORAACCIDENTE "Hora Acc.", ' +
                            GetDecodeFromCTB('EX_ESTADO', 'SIEST') + ' "Estado", ' +
                            GetDecodeFromCTB('EX_CAUSAFIN', 'CATER')  + ' "Causa Fin", ' +
                            GetDecodeFromCTB('EX_TIPO',     'STIPO', '1', True)   + ' "Tipo de Accidente", ' +
                            GetDecodeFromCTB('EX_GRAVEDAD', 'SGRAV', '1', True)   + ' "Gravedad" ' +
                      'FROM DLG_DELEGACIONES, MGP_GTRABAJO, CPV_PROVINCIAS, CPR_PRESTADOR, ' +
                           'CMP_EMPRESAS, CTJ_TRABAJADORES, SEX_EXPEDIENTES ' +
                     'WHERE EX_CUIL = TJ_CUIL ' +
                       'AND EX_CUIT = MP_CUIT ' +
                       'AND EX_PRESTADOR = CA_IDENTIFICADOR (+) ' +
                       'AND EX_GTRABAJO = GP_CODIGO ' +
                       'AND nvl(EX_CAUSAFIN, ''0'') not in (''99'',''95'') ' +
                       'AND EX_DELEGACION = LG_CODIGO ' +
                       'AND PV_CODIGO(+) = CA_PROVINCIA ' +
                       'AND EX_CUIT = ' + SqlValue( sdqConsulta.FieldByName('CQ_CUIT').AsString );

          { Copiado de ConsultART: }
          2: sSql := 'SELECT cuit_PonerGuiones(dl_Cuil) CUIL, UPPER(tj_nombre) "Apellido y Nombre", UPPER(TJ_SEXO) "Sexo", ' +
                            'UPPER(dl_categoria) "Categoría", UPPER(dl_tarea) "Tarea", dl_sueldo "Sueldo", ' +
                            'TO_CHAR(tj_fnacimiento, ''dd/mm/yyyy'') "F.Nacimiento", ' +
                            'TO_CHAR(dl_FecIngreso, ''dd/mm/yyyy'') "F.Ingreso", ' +
                            'cuit_PonerGuiones(dl_cuit) CUIL, mp_nombre "Razón Social", mp_contrato "Contrato",' +
                            'MP_CALLE || '' Nro. '' || MP_NUMERO || ''  Piso: '' || MP_PISO || '' Dpto: '' || MP_DEPARTAMENTO "Domicilio", ' +
                            'MP_LOCALIDAD "Localidad", mp_cpostal "C.P.", pv_descripcion "Localidad", ' +
                            'mp_Telefonos "Teléfonos", mp_Fax "Fax", Periodo_ponerbarra(mp_ultimaNomina) "Período" ' +
                       'FROM ctj_trabajadores, cdl_DatosLaborales, cmp_empresas, cpv_provincias ' +
                      'WHERE tj_cuil = dl_cuil ' +
                        'AND dl_cuit = ' + SqlValue( sdqConsulta.FieldByName('CQ_CUIT').AsString ) + ' ' +
                        'AND dl_FecEgreso IS NULL ' +
                        'AND dl_cuit = mp_cuit ' +
                        'AND pv_codigo = mp_provincia';
        end;
        frmConsulta.Caption := StringReplace( TMenuItem( Sender ).Caption, '&', '', []);
        frmConsulta.sdqConsulta.SQL.Text := sSql;
        frmConsulta.RefreshData;
        DynColWidthsByData( frmConsulta.Grid );
        frmConsulta.QueryPrint.PageOrientation := pxLandscape;

        frmConsulta.ShowModal ;
      finally
        frmConsulta.Free ;
      end;
    {
    // *** Resumen de Siniestros ******************
      if SqlCtbTipo = '' Then begin
      end;



    // *** Nómina ******************
    }
  end;

//  DecimalSeparator := '.';
//  ThousandSeparator := #0;

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaConcursosQuiebras.IsRegistroDadoDeBaja(): Boolean;
begin
  Result := (sdqConsulta.FieldByName( 'CQ_ESTADO' ).AsString = '06');
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaConcursosQuiebras.IsRegistroTerminado(): Boolean;
begin
  Result := (sdqConsulta.FieldByName( 'CQ_ESTADO' ).AsString = '05');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsRegistroDadoDeBaja() or IsRegistroTerminado() then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'CQ_DEUDANOMINAL' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CQ_DEUDANOMINAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'CQ_DEUDATOTAL' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CQ_DEUDATOTAL' ) ).Currency := True;

  //if sdqConsulta.FieldByName( 'CQ_DEUDAVERIFICADA' ) is TFloatField then
  //   TFloatField( sdqConsulta.FieldByName( 'CQ_DEUDAVERIFICADA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'CQ_MONTOPRIVILEGIO' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CQ_MONTOPRIVILEGIO' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'CQ_MONTOQUIROG' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CQ_MONTOQUIROG' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'CQ_MONTOHOMOLOG' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CQ_MONTOHOMOLOG' ) ).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaConcursosQuiebras.tbVerUsuarioAltaClick(Sender: TObject);
var
  bMostrar: Boolean;
begin
  bMostrar := tbVerUsuarioAlta.Down;

  Grid.ColumnByField['usualta'].Visible    := bMostrar;
  Grid.ColumnByField['fechaalta'].Visible  := bMostrar;
  Grid.ColumnByField['usumodif'].Visible   := bMostrar;
  Grid.ColumnByField['fechamodif'].Visible := bMostrar;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

