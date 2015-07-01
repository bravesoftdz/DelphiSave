unit unABMSeguimientoJuiciosParteActora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unABMSeguimientoJuicios, QueryPrint, DBClient, Menus, DB,
  SDEngine, ImgList, JvTFManager, JvComponent, JvTFAlarm, ShortCutControl,
  Placemnt, artSeguridad, ArtComboBox, ArtDBGrid, unFraPuntosRevision,
  AdvEdit, StdCtrls, ExComboBox, ComCtrls, CardinalEdit, ExtCtrls,
  JvExControls, JvCalendar, JvTFDays, JvTFMonths, JvTFGlance, JvTFWeeks,
  JvExExtCtrls, JvNetscapeSplitter, unFraReclamoSentencia, CurrEdit,
  FormPanel, Grids, DBGrids, RXDBCtrl, PatternEdit, RxRichEd,
  unfraCodigoDescripcionExt, IntEdit, ToolWin, unfraAbogadosLegales, Mask,
  ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame, unGastos,
  unMedidasCautelares, unFraCodigoDescripcion, unfraJuzgados, JvEnterTab,
  unFijarImportesSentenciaActora, unLiquidacionFinal, unArt, JvExStdCtrls,
  JvEdit, JvValidateEdit, SortDlg, RxPlacemnt, JvComponentBase, RxCurrEdit,
  RxToolEdit;

type
  TfrmAdminstracionJuicioParteActora = class(TfrmAdminstracionJuicio)
    tbLiquidacionFinal: TToolButton;
    tsGastos: TTabSheet;
    tsMedidasCautelares: TTabSheet;
    chkDemInterruptiva: TCheckBox;
    lblEventoRE: TLabel;
    lbSumatoria: TLabel;
    lblSumatoriaPagosConRet: TEdit;
    lblSumatoriaPagosSinRet: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEdicionOrigenDemandaClick(Sender: TObject);override;
    procedure tbNuevoOrigenDemandaClick(Sender: TObject);override;
    procedure tbFijarSentenciaClick(Sender: TObject);override;
    procedure fraDatosJuzgadobtnInstanciasAnterioresClick(Sender: TObject);override;
    procedure tbLiquidacionFinalClick(Sender: TObject);
    procedure tbVerImagenesClick(Sender: TObject);
    procedure tbEdicionPagoClick(Sender: TObject);
    procedure tbIngresoPagoClick(Sender: TObject);
    procedure pgDetallesJuicioChange(Sender: TObject);override;
    procedure tbModificarEventoClick(Sender: TObject);
    procedure dbgEventosJuicioEnTramiteDblClick(Sender: TObject);
    procedure tbEliminarEventoClick(Sender: TObject);
    procedure dbgPagosEfectuadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    frmGastos            : TfrmGastos;
    frmMedidasCautelares : TfrmMedidasCautelares;
  protected
    procedure DoCargarDatos(AQuery: TDataSet);override;
    procedure GuardarJuicio;override;
    procedure LimpiarCampos;
    procedure ObtenerNumeroCarpeta;override;
    procedure ActivarControlesAlta(activar: boolean); override;
    procedure MostrarArchivosAsociados; override;
    procedure SumatoriaImportes;
    procedure CalcControlWidthLeft;
  public
    function AltaJuicio: Boolean;override;
    procedure Modificacion(Tabla: TSDQuery);override;
  end;

var
  frmAdminstracionJuicioParteActora: TfrmAdminstracionJuicioParteActora;

resourcestring
  LJT_GESTION_ALTA = 'Alta... (Administración de Juicios Parte Actora)';
  LJT_GESTION_MODIF = 'Modificación... (Administración de Juicios Parte Actora)';
  LJT_GESTION_ALTAMEDIACION = 'Alta... (Administración de Mediaciones Parte Actora)';
  LJT_GESTION_MODIFMEDIACION = 'Modificación... (Administración de Mediaciones Parte Actora)';
  LJT_GESTION_CONSJUICIO = 'Consulta... (Administración de Juicios Parte Actora)';
  LJT_GESTION_CONSMEDIACION = 'Consulta... (Administración de Mediaciones Parte Actora)';

implementation

Uses
  Strfuncs, AnsiSql, unSesion, CustomDlgs,unDmPrincipal, SqlFuncs, unDmLegales, unCustomDataModule,
  unConstLegales, unABMOrigenDemanda, unInstanciasJuicio, VclExtra, unComunesArchivo, unConstantArchivo,
  unFrmPagoConceptosLegalesRegulados, unArchivosAsociados;

{$R *.dfm}
procedure TfrmAdminstracionJuicioParteActora.LimpiarCampos;
begin
  inherited;
end;

procedure TfrmAdminstracionJuicioParteActora.DoCargarDatos(AQuery: TDataSet);
begin
  inherited;
  edFECHANOTIFICACION.Date     := AQuery.FieldByName('JT_FECHAINIJUICIO').AsDateTime;

  fraDatosJuzgado.Cargar(FIdJuicioEnTramite);

  frmGastos.Load(FIdJuicioEnTramite);
  frmMedidasCautelares.Load(FIdJuicioEnTramite);
  chkDemInterruptiva.Checked := AQuery.FieldByName('JT_DEMINTERRUPTIVA').AsString = 'S';
  fraReclamoSentenciaReclamo.fraReclamo.ExtraCondition := ' AND RC_ETAPA like ''%A%'' ';
  SumatoriaImportes;
end;

procedure TfrmAdminstracionJuicioParteActora.GuardarJuicio;
var
	sSqlTrans: TSql;
begin
  VerificarMultiple (['Guardando Juicio',
                      fraTipoJuicio,
                      fraTipoJuicio.IsSelected,
                      'Debe seleccionar un tipo de juicio.',
                      edCARATULA,
                      not IsEmptyString(edDemandante.Text)
                      and not IsEmptyString(edDemandado.Text)
                      and not IsEmptyString(edCARATULA.Text),
                      'Debe completar la carátula del juicio.',
                      fraAbogadosPropios,
                      ((fraAbogadosPropios.Codigo <> '') and (edFECHAASIGNADO.Date > 0) or
                       (trim(fraAbogadosPropios.Codigo) = '') and (edFECHAASIGNADO.Date = 0)),
                      'Fecha de asignación y abogado deben completarse conjuntamente.',
                      edFECHANOTIFICACION,
                      edFECHANOTIFICACION.Date > 0,
                      'Debe completar la fecha de inicio del juicio.',
                      edFECHANOTIFICACION,
                      (edFECHANOTIFICACION.Date <= DBDateTime),
                      'La fecha de inicio del juicio no puede ser mayor que la fecha actual',
                      edFECHAASIGNADO,
                      not (edFECHAASIGNADO.Date > edFECHANOTIFICACION.Date),
                      'La fecha de asignación debe ser menor o igual que la de inicio del juicio',
                      edFECHAASIGNADO,
                      (edFECHAASIGNADO.Date <= DBDateTime),
                      'La fecha de asignación de juicio no puede ser mayor que la fecha actual',
                      fraEstado,
                      fraEstado.IsSelected,
                      'Debe seleccionar un Estado para el Juicio.',
                      edFECHAFINJUICIO,
                      (fraEstado.IsSelected) and (not ((fraEstado.Value = 91) or (fraEstado.Value = 92)) or (edFECHAFINJUICIO.Date > 0)),
                      'Debe especificar la fecha de fin.',
                      fraAbogadosPropios, fraAbogadosPropios.IsSelected, 'Se debe asignar un estudio/abogado.'  
                     ]);


  if fraEstado.ShowBajas then
    Verificar((FIdEstadoJuicio <> fraEstado.Value) and fraEstado.IsBaja, fraEstado, 'Debe seleccionar un Estado activo para el Juicio.');


	Verificar(((fraEstado.Value = 91) or (fraEstado.Value = 92)) and (ExisteSqlEx('SELECT 1 FROM LEM_EMBARGO WHERE EM_FECHABAJA IS NULL AND EM_IDESTADO <> 4 AND EM_IDJUICIO = :ID',
  					[FIdJuicioEnTramite])), fraEstado, 'No es posible dar por terminado el juicio ya que existen embargos activos.');

  {if fraDatosJuzgado.NroExpediente <> '' then
  begin
    if Fmodo = meAlta then
      Verificar(ExisteSql('SELECT 1 FROM legales.ljt_juicioentramite '+
                          'WHERE jt_nroexpediente = '+SqlValue(fraDatosJuzgado.NroExpediente)+
                          '  AND jt_estadomediacion = ''A'' ' ),
                fraDatosJuzgado,
                'Ya existe el Nro. de Expediente.')
    else
      Verificar(ExisteSql('SELECT 1 FROM legales.ljt_juicioentramite '+
                          'WHERE jt_id <> '+ SqlValue(FIdJuicioEnTramite)+
                          ' AND jt_nroexpediente = '+SqlValue(fraDatosJuzgado.NroExpediente)+
                          '  AND jt_estadomediacion = ''A'' '),
                fraDatosJuzgado,
                'Ya existe el Nro. de Expediente.');
  end;
  }
  Verificar(fraAbogadosPropios.IsBaja, fraAbogadosPropios, 'No puede Seleccionar un abogado dado de baja.');
  if FMediacion then
  begin
    VerificarMultiple (['Guardando Juicio',
                        fraTipoMediacion,
                        fraTipoMediacion.IsSelected,
                        'Debe seleccionar un tipo de Mediación.',
                        fraMediador,
                        fraMediador.IsSelected,
                        'Debe seleccionar un mediador',
                        edNroExpedienteMediacion,
                        not IsEmptyString(edNroExpedienteMediacion.Text),
                        'Debe completar un Nro de Expediente de la Mediación'
                       ]);
  end
  else
    ValidarDemanda;

  //Esto podria ser fraDatosJuzgado.Enabled solamente pero prefiero ser explícito.
  if (not FMediacion) or (FMediacion and (fraDatosJuzgado.Enabled)) then
  begin
   fraDatosJuzgado.ValidaExpediente := False;
   fraDatosJuzgado.validar('Guardando Juicio');
  end;

  VerificarMultiple (['Guardando Juicio',
                      fraDatosJuzgado.dteFechaIngreso,
                      (fraDatosJuzgado.dteFechaIngreso.Date >= edFECHANOTIFICACION.Date) or
                      (not fraDatosJuzgado.dteFechaIngreso.Visible) or (fraDatosJuzgado.dteFechaIngreso.Date = 0),
                      'La fecha de ingreso debe ser mayor o igual que la fecha de inicio del juicio.',
                      fraDatosJuzgado.dteFechaIngreso,
                      (fraDatosJuzgado.dteFechaIngreso.Date <= DBDate)  or
                      (not fraDatosJuzgado.dteFechaIngreso.Visible),
                      'La fecha de ingreso de expediente al juzgado no puede ser mayor a la fecha actual.'
                     ]);


  //Valido que no se hayan seleccionado registros dados de baja
  fraDatosJuzgado.ValidarSeleccionBajas('Guardando Juicio');

  BeginTrans(true);

  if (FModo = meAlta) then
  begin
    FIdJuicioEnTramite := GetSecNextVal('LEGALES.SEQ_LJT_ID');
    EjecutarSqlST('INSERT INTO LEGALES.LJT_JUICIOENTRAMITE (' +
                  '  jt_id, jt_idestado) ' +
                  'VALUES (' + SqlValue(FIdJuicioEnTramite) +  ',1)');
  end;

  //Guardo en el histórico de Estados
  GuardarCambioEstado;

  //Guardo el Histórico de Reservas
  //GuardarCambioReserva;

  sSqlTrans := TSql.Create('legales.ljt_juicioentramite');
  sSqlTrans.SqlType := stUpdate;
  sSqlTrans.PrimaryKey.Add('jt_id', FIdJuicioEnTramite);

  try
    sSqlTrans.Fields.AddString('jt_caratula', trim(edCARATULA.Text));
    sSqlTrans.Fields.AddString('jt_demandante', trim(edDemandante.Text));
    sSqlTrans.Fields.AddString('jt_demandado', trim(edDemandado.Text));
    sSqlTrans.Fields.AddInteger('jt_idabogado', fraAbogadosPropios.Codigo);
    sSqlTrans.Fields.addDate('JT_FECHAASIGN', edFECHAASIGNADO.Date);
    sSqlTrans.Fields.AddInteger('jt_idtipo', fraTipoJuicio.Codigo);

    if (Not FMediacion) or (FMediacion and (fraDatosJuzgado.Enabled)) then
    begin
      sSqlTrans.Fields.AddInteger('jt_idjurisdiccion', fraDatosJuzgado.Jurisdiccion);
      sSqlTrans.Fields.AddInteger('jt_idfuero', fraDatosJuzgado.Fuero);
      sSqlTrans.Fields.AddInteger('jt_idjuzgado', fraDatosJuzgado.Juzgado);
      sSqlTrans.Fields.AddInteger('jt_idsecretaria', fraDatosJuzgado.Secretaria);
      sSqlTrans.Fields.AddString('jt_nroexpediente', fraDatosJuzgado.NroExpediente);
      sSqlTrans.Fields.AddString('jt_anioexpediente', fraDatosJuzgado.AnioExpediente);
      if fraDatosJuzgado.NroExpediente <> '' then
        sSqlTrans.Fields.AddString('JT_EXPEDIENTE', '');
      if fraDatosJuzgado.SinExpediente then
        sSqlTrans.Fields.AddString('JT_SINEXPEDIENTE', 'S')
      else
        sSqlTrans.Fields.AddString('JT_SINEXPEDIENTE', 'N');
    end
    else
    begin
      sSqlTrans.Fields.AddInteger('jt_idjurisdiccion', 0);
      sSqlTrans.Fields.AddInteger('jt_idfuero', 0);
      sSqlTrans.Fields.AddInteger('jt_idjuzgado', 0);
      sSqlTrans.Fields.AddInteger('jt_idsecretaria', 0);
      sSqlTrans.Fields.AddString('jt_expediente', '');
    end;

    if (Not FMediacion) then
      sSqlTrans.Fields.AddDate('jt_fechaingreso', fraDatosJuzgado.FechaIngreso)
    else
      sSqlTrans.Fields.AddDate('jt_fechaingreso', 0);

    sSqlTrans.Fields.AddInteger('jt_idestado', fraEstado.Codigo);
    sSqlTrans.Fields.AddDate('JT_FECHAINIJUICIO', edFECHANOTIFICACION.Date);
    sSqlTrans.Fields.AddString('jt_descripcion', edtDescripcion.Text);
//  sSqlTrans.Fields.AddExtended('JT_IMPORTERESERVAHONORARIOS', ceReservaHonorarios.Value, 2);
    sSqlTrans.Fields.AddExtended('JT_IMPORTEEMBARGO', 0);
//  sSqlTrans.Fields.AddExtended('JT_IMPORTERESERVA', ceReservaCapital.Value, 2);
    sSqlTrans.Fields.AddExtended('JT_IMPORTEDEMANDADO', fraReclamoSentenciaReclamo.TotalMontoDemandado, 2);
    if chkDemInterruptiva.Checked then
      sSqlTrans.Fields.AddString('JT_DEMINTERRUPTIVA', 'S')
    else
      sSqlTrans.Fields.AddString('JT_DEMINTERRUPTIVA', 'N');


    if FMediacion then
    begin
      sSqlTrans.Fields.AddInteger('JT_IDTIPOMEDIACION', fraTipoMediacion.Codigo);
      sSqlTrans.Fields.AddInteger('JT_IDORGANISMOMEDIACION', fraOrganismoMediacion.Codigo);
      sSqlTrans.Fields.AddInteger('JT_IDMEDIADOR', fraMediador.Codigo);
      sSqlTrans.Fields.AddString('JT_EXPEDIENTEMEDIACION', edNroExpedienteMediacion.text );
    end;

    if Fmodo = meAlta then
    begin
      sSqlTrans.Fields.AddDateTime('jt_fechaalta',DBDateTime);
      sSqlTrans.Fields.Add('jt_usualta', Sesion.LoginName);
      if FMediacion then
        sSqlTrans.Fields.Add('jt_estadomediacion', 'M')
      else
        sSqlTrans.Fields.Add('jt_estadomediacion', 'A');

      if (not FMediacion) then
      begin
        GuardarInstanciaInicioJuicion(FIdJuicioEnTramite,
                                      fraDatosJuzgado.Jurisdiccion,
                                      fraDatosJuzgado.Fuero,
                                      fraDatosJuzgado.Juzgado,
                                      fraDatosJuzgado.Secretaria,
                                      fraDatosJuzgado.Instancia,
                                      fraDatosJuzgado.NroExpediente,
                                      fraDatosJuzgado.AnioExpediente,
                                      fraDatosJuzgado.SinExpediente,
                                      fraDatosJuzgado.FechaIngreso,
                                      Sesion.LoginName);
      end;
    end
    else
    begin
      if not FMediacion then
      begin
        if fraDatosJuzgado.edNroExpediente.Modified or fraDatosJuzgado.edAnioExpediente.Modified or
           fraDatosJuzgado.dteFechaIngreso.Modified then
          ActualizarInstanciaJuicio(FIdJuicioEnTramite,
                                    fraDatosJuzgado.Jurisdiccion,
                                    fraDatosJuzgado.Fuero,
                                    fraDatosJuzgado.Juzgado,
                                    fraDatosJuzgado.Secretaria,
                                    fraDatosJuzgado.Instancia,
                                    fraDatosJuzgado.NroExpediente,
                                    fraDatosJuzgado.AnioExpediente,
                                    fraDatosJuzgado.SinExpediente,
                                    fraDatosJuzgado.FechaIngreso,
                                    Sesion.LoginName);
      end;
      sSqlTrans.Fields.AddDateTime ('jt_fechamodif', DBDateTime);
      sSqlTrans.Fields.Add('jt_usumodif', Sesion.LoginName);
      sSqlTrans.Fields.addDate('jt_fechafinjuicio', edFECHAFINJUICIO.Date);
      sSqlTrans.Fields.addDate('jt_fechasentencia', edFECHASENTENCIA.Date);
    end;
    EjecutarSQLST(sSqlTrans.Sql, tmNone);
    GuardarAsignacionAbogado;

    //ActualizarSiniestrosJuicio;

    if Fmodo = meAlta then
    	ObtenerNumeroCarpeta;

    CommitTrans(true);

  except
    on E: Exception do
    begin
      Rollback(true);
    	raise Exception.Create('Error al guardar juicio: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.ObtenerNumeroCarpeta;
var
 nroCarpeta : integer;
begin
    EjecutarStoreST('art.Legales.AsignarProximoNroCarpeta( ' + SqlInteger(FIdJuicioEnTramite) +  ',''A''); ');
    nroCarpeta := ValorSqlInteger('SELECT NVL(jt_numerocarpeta, 0) ' +
                                  '  FROM legales.ljt_juicioentramite ' +
                                  ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite) );
    CommitTrans(true);
    MessageDlg('Se generó la carpeta Nº ' + Inttostr(nroCarpeta), mtInformation, [mbOK], 0);
    edNroCarpeta.Text := Inttostr(nroCarpeta);
end;

procedure TfrmAdminstracionJuicioParteActora.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTipoEvento do
  begin
    ExtraCondition := ' AND TE_ETAPA like ''%A%'' '
  end;
  with fraTipoResultadoJuicio do
  begin
    TableName   	 := 'legales.ltr_tiporesultadosentencia';
    FieldID     	 := 'tr_id';
    FieldCodigo 	 := 'tr_id';
    FieldDesc   	 := 'tr_descripcion';
    ExtraCondition := ' AND (tr_etapa LIKE ''%A%'') ';
    Showbajas   	 := True;
  end;

  fraJuicioRelacionado.ExtraCondition := ' AND JT_ESTADOMEDIACION = ''A'' AND JT_IDESTADO NOT IN (2,3)';
  tbLiquidacionFinal.Left := 91;
  frmGastos := TfrmGastos.Create( Self );
  frmGastos.Parent    := tsGastos;
  frmGastos.Visible   := True;
  frmGastos.Align     := alClient;
  frmMedidasCautelares := TfrmMedidasCautelares.Create( Self );
  frmMedidasCautelares.Parent    := tsMedidasCautelares;
  frmMedidasCautelares.Visible   := True;
  frmMedidasCautelares.Align     := alClient;
end;

function TfrmAdminstracionJuicioParteActora.AltaJuicio: Boolean;
begin
  FMediacion := false;
  Caption := LJT_GESTION_ALTA;
  fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
  VCLExtra.LockControls(fraDatosJuzgado, false);
  fraDatosJuzgado.Enabled := true;
  fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%A%''';
  psSentenciaMediacion.ActivePageIndex := 0;

  tbFijarSentencia.Enabled := false;
  tbVerPagosPendientes.Enabled := false;
  tbReasignarAbogado.Enabled := false;
  tbElevacionAJuicio.Enabled := false;
  tbBloquear.Enabled := false;

  result := Alta;
end;

procedure TfrmAdminstracionJuicioParteActora.CalcControlWidthLeft;
var
  I, sumWidth: Integer;
begin
    // Ticket 66098
    sumWidth := 20;
    for I := 0 to dbgPagosEfectuados.Columns.Count -1 do begin

      if dbgPagosEfectuados.Columns[I].FieldName = 'PL_IMPORTECONRETENCION' then  begin
        lblSumatoriaPagosConRet.Left := sumWidth;
        lblSumatoriaPagosConRet.Width := dbgPagosEfectuados.Columns[I].Width;
      end;
      if dbgPagosEfectuados.Columns[I].FieldName = 'PL_IMPORTEPAGO' then  begin
        lblSumatoriaPagosSinRet.Left := sumWidth;
        lblSumatoriaPagosSinRet.Width := dbgPagosEfectuados.Columns[I].Width;
      end;
      sumWidth := sumWidth + dbgPagosEfectuados.Columns[I].Width;

    end;
end;

procedure TfrmAdminstracionJuicioParteActora.Modificacion(Tabla: TSDQuery);
begin
  FModo := meModificacion;
  FIdJuicioEnTramite := Tabla.FieldByName('jt_id').AsInteger;
  FIdJuicioRelacionado := Tabla.FieldByName('jt_idjuiciorelacionado').AsInteger;
  LimpiarCampos;

  if Tabla.FieldByName('jt_estadomediacion').AsString = 'M' then
  begin
    Caption := LJT_GESTION_MODIFMEDIACION;
    FMediacion := True;
    psSentenciaMediacion.ActivePageIndex := 1;
    fraDatosJuzgado.Init(NOPERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%M%''';
    tbFijarSentencia.Enabled := False;
    tbVerPagosPendientes.Enabled := False;
  end
  else begin
    Caption := LJT_GESTION_MODIF;
    FMediacion := false;
    fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%A%''';
    psSentenciaMediacion.ActivePageIndex := 0;
    tbElevacionAJuicio.Enabled := False;
  end;

  DoCargarDatos(Tabla);
  Seguridad.Ejecutar;
  SetearControlesJuicio;
  ShowModal;

end;

procedure TfrmAdminstracionJuicioParteActora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmGastos.Free;
  frmMedidasCautelares.Free;
end;

procedure TfrmAdminstracionJuicioParteActora.tbEdicionOrigenDemandaClick(
  Sender: TObject);
begin
  inherited;
  with TfrmAbmOrigenDemanda.Create(self) do
  try
    TipoParte := True;
    ModificacionOrigenDemanda(sdqOrigenDemanda);
    sdqOrigenDemanda.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqOrigenDemanda.Refresh;
  finally
    free;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.tbNuevoOrigenDemandaClick(
  Sender: TObject);
begin
  with TfrmAbmOrigenDemanda.Create(self) do
  try
    TipoParte := True;

    AltaOrigenDemanda(FIdJuicioEnTramite);
    sdqOrigenDemanda.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqOrigenDemanda.Refresh;
  finally
    free;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.tbFijarSentenciaClick(
  Sender: TObject);
begin
  with TfrmFijarImportesSentenciaActora.Create(Self) do
  begin
    try
      PreValidarFijarSentencia;
      FijarSentencia(FIdJuicioEnTramite, FModo, edFECHANOTIFICACION.Date);

      if FModo <> meConsulta then
      begin
        ReCargarSentencia;

     {   if edIMPORTESENTENCIA.Value <> 0 then
          fraEstado.Codigo := ValorSql('SELECT EJ_ID' +
                                       '  FROM legales.lej_estadojuicio' +
                                       ' WHERE UPPER (ej_descripcion) LIKE UPPER (''SENT%FIRM%'')')
     }
      end
    finally
      free;
    end;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.fraDatosJuzgadobtnInstanciasAnterioresClick(
  Sender: TObject);
begin
  with TfrmInstanciasJuicio.Create(self) do
  try
    ParteActora := True;
    MostrarInstanciasJuicio(FIdJuicioEnTramite, edFECHANOTIFICACION.Date);
    fraDatosJuzgado.Cargar(FIdJuicioEnTramite);
    ReCargarSentencia;
  finally
    Free;
  end;

end;

procedure TfrmAdminstracionJuicioParteActora.tbLiquidacionFinalClick(
  Sender: TObject);
begin
  Verificar(ExisteSql(
    ' SELECT 1 '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+SqlValue(FIdJuicioEnTramite)+
    '    AND jt_fechasentencia IS NULL'),tbLiquidacionFinal,'Debe Ingresar la sentencia.');
  with TfrmLiquidacionFinal.Create(self) do
  try
    Load(FIdJuicioEnTramite);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.ActivarControlesAlta(activar: boolean);
begin
  inherited;
  tbLiquidacionFinal.Enabled := activar;
  VclExtra.LockControls([tsGastos, tsMedidasCautelares], not activar);
end;

procedure TfrmAdminstracionJuicioParteActora.tbVerImagenesClick(Sender: TObject);
begin
  if not VerificarClaveExiste(ID_CARPETA_JUICIOPA, edNroCarpeta.Text, FarId) then
    MsgBox('La Carpeta no existe.', MB_ICONERROR)
  else
    inherited;
end;

procedure TfrmAdminstracionJuicioParteActora.tbEdicionPagoClick(
  Sender: TObject);
begin
  inherited;
  with TfrmPagoConceptosLegalesRegulados.Create(self) do
  try
    ModoParteActora;
  	ModificacionPago(sdqPagoLegal);
    sdqPagoLegal.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqPagoLegal.Refresh;
  finally
  	Free;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.tbIngresoPagoClick(
  Sender: TObject);
begin
  inherited;
  with TfrmPagoConceptosLegalesRegulados.Create(self) do
  try
    ModoParteActora;
  	AltaPago(FIdJuicioEnTramite);
    sdqPagoLegal.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqPagoLegal.Refresh;
  finally
     free;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.pgDetallesJuicioChange(Sender: TObject);
begin
  inherited;
  case pgDetallesJuicio.ActivePageIndex of
  2:
    begin
      	with sdqEventoJuicioEnTramite do
      	if not Active then
        begin
          SQL.Text :=
          ' SELECT * FROM ('+
          'SELECT et_id, et_fechaevento, et_observaciones, et_fechavencimiento, TO_CHAR(et_idtipoevento) et_idtipoevento, lte_tipoevento.te_descripcion, '+
          '       et_fechabaja, NVL((SELECT DISTINCT ''S'' '+
          '                                     FROM legales.lea_eventoarchivoasociado '+
          '                                    WHERE ea_ideventojuicioentramite = et_id '+
          '                                      AND ea_fechabaja IS NULL), ''N'') tieneadjunto, ''J'' procedencia ' +
          '  FROM legales.let_eventojuicioentramite, legales.lte_tipoevento '+
          ' WHERE (et_idtipoevento = lte_tipoevento.te_id) '+
          '   AND et_idjuicioentramite = :idjuicioentramite '+
          ' UNION ALL ' +
          'SELECT re_id, re_fecha, TO_CLOB(re_observaciones), NULL, tb_codigo, UPPER(tb_descripcion), NULL, ' +
          '       NVL((SELECT DISTINCT ''S'' ' +
          '                       FROM legales.ler_eventoarchivorecupero ' +
          '                      WHERE er_ideventorecupero = re_id ' +
          '                        AND er_fechabaja IS NULL), ''N'') tieneadjunto, ''R'' procedencia ' +
          '  FROM legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, art.ctb_tablas, art.lre_recuperoeventos ' +
          ' WHERE tb_codigo = re_codigo ' +
          '   AND tb_clave = ''EVRES'' ' +
          '   AND od_idjuicioentramite = :idjuicioentramite ' +
          '   AND sj_idorigendemanda = od_id ' +
          '   AND sj_fechabaja IS NULL ' +
          '   AND od_fechabaja IS NULL ' +
          '   AND re_siniestro = sj_siniestro ' +
          '   AND re_orden = sj_orden ' +
          '   AND re_nroevento > 0 '+
          ' UNION ALL '+
          'SELECT ge_id, ge_fecha, TO_CLOB (ge_observaciones), NULL, ge_codigo, '+
          '       tb_descripcion, NULL, '+
          '       NVL ((SELECT DISTINCT ''S'' '+
          '                        FROM legales.leg_eventoarchivogd '+
          '                       WHERE eg_ideventogd = ge_id AND eg_fechabaja IS NULL), '+
          '            ''N'' '+
          '           ) tieneadjunto, '+
          '       ''GD'' procedencia '+
          '  FROM art.ctb_tablas, art.lge_eventosgdeuda, art.lgd_gestiondeuda '+
          ' WHERE tb_codigo = ge_codigo '+
          '   AND tb_clave = ''EVEGD'' '+
          '   AND ge_nroorden = gd_nroorden '+
          '   AND gd_contrato IN ( '+
          '          SELECT od_contrato '+
          '            FROM legales.lod_origendemanda '+
          '           WHERE od_idjuicioentramite = :idjuicioentramite '+
          '             AND od_fechabaja IS NULL) '+
          '   AND ge_nroevento > 0) '+ SortDialogEvento.OrderBy;
        	ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
    end;
  end;
end;

procedure TfrmAdminstracionJuicioParteActora.SumatoriaImportes;
begin
   CalcControlWidthLeft;

   lbSumatoria.Caption := 'Totales: ';

    // Ticket 66098
    lblSumatoriaPagosConRet.Text := ValorSql(
    ' SELECT LTRIM(TO_CHAR(NVL(art.legales.get_totalretenidopagosja('+SqlValue(FIdJuicioEnTramite)+'), 0)'+
           ' , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
    '   FROM DUAL ');

    lblSumatoriaPagosSinRet.Text := ValorSql(
    ' SELECT LTRIM(TO_CHAR(NVL(art.legales.get_totalpagosja('+SqlValue(FIdJuicioEnTramite)+'), 0)'+
           ' , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
    '   FROM DUAL ');


end;

procedure TfrmAdminstracionJuicioParteActora.tbModificarEventoClick(
  Sender: TObject);
begin
  if sdqEventoJuicioEnTramite.FieldByName('procedencia').AsString = 'R' then
  begin
    lblEventoRE.Visible := true;
    lblEventoRE.Caption := sdqEventoJuicioEnTramite.fieldbyname('te_descripcion').AsString;
    fraTipoEvento.Visible := false;
    btnAccAceptar.Enabled := false;
    tbAsociarDoc.Enabled := false;
    MsgBox('Este evento fue cargado desde Recuperos y no puede ser modificado en este módulo.', MB_ICONWARNING);
  end;
  if sdqEventoJuicioEnTramite.FieldByName('procedencia').AsString = 'GD' then
  begin
    lblEventoRE.Visible := true;
    lblEventoRE.Caption := sdqEventoJuicioEnTramite.fieldbyname('te_descripcion').AsString;
    fraTipoEvento.Visible := false;
    btnAccAceptar.Enabled := false;
    tbAsociarDoc.Enabled := false;
    MsgBox('Este evento fue cargado desde Gestion de deuda y no puede ser modificado en este módulo.', MB_ICONWARNING);
  end;
  inherited;
  btnAccAceptar.Enabled := true;
  tbAsociarDoc.Enabled := true;
  lblEventoRE.Visible := false;
  fraTipoEvento.Visible := true;
end;

procedure TfrmAdminstracionJuicioParteActora.dbgEventosJuicioEnTramiteDblClick(
  Sender: TObject);
begin
  tbModificarEventoClick(Sender);
end;

procedure TfrmAdminstracionJuicioParteActora.dbgPagosEfectuadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  CalcControlWidthLeft;
end;

procedure TfrmAdminstracionJuicioParteActora.tbEliminarEventoClick(
  Sender: TObject);
begin
  if sdqEventoJuicioEnTramite.FieldByName('procedencia').AsString = 'R' then
  begin
    MsgBox('Este evento fue cargado desde Recuperos y no puede ser eliminado en este módulo.', MB_ICONWARNING);
    Abort;
  end;
  inherited;
end;

procedure TfrmAdminstracionJuicioParteActora.MostrarArchivosAsociados;
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (FModoEventosSeguimientos = meModificacion) and (sdqEventoJuicioEnTramite.FieldByName('procedencia').AsString = 'R') then
    begin
      tbNuevo.Enabled := false;
      tbEliminar.Enabled := false;
    end;

    if (FModoEventosSeguimientos = meAlta) then
      cdsArchivosAsociados.EmptyDataSet;

      CargarArchivosAsociados(FIdJuicioEnTramite, FIdEventoJuicioEnTramite, cdsArchivosAsociados);
      RecargarArchivosAsociados(cdsArchivosAsociados);
      edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                   ' Archivos Asociados.';
  finally
    Free;
  end;
end;

end.

