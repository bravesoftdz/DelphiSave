unit unCalendarioMediosDeTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, JvExControls, JvComponent, JvCalendar,
  unFraCodigoDescripcion, unFraCodDesc, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador, StdCtrls, JvExComCtrls, JvMonthCalendar,
  Mask, Spin, FormPanel, DBCtrls, RxPlacemnt;

type
  TfrmCalendarioMediosDeTransporte = class(TfrmCustomConsulta)
    sdqConsultaCT_ID: TFloatField;
    sdqConsultaCT_IDPRESTADOR: TFloatField;
    sdqConsultaCT_IDDETALLETRANSPORTE: TFloatField;
    sdqConsultaCT_FECHAHORA: TDateTimeField;
    sdqConsultaCT_NUMERO: TFloatField;
    sdqConsultaCT_IDTURNOPRESTACION: TFloatField;
    sdqConsultaCT_IDTRASLADO: TFloatField;
    sdqConsultaCT_USUGENERACION: TStringField;
    sdqConsultaCT_FECHAGENERACION: TDateTimeField;
    sdqConsultaCT_USUASIGNACION: TStringField;
    sdqConsultaCT_FECHAASIGNACION: TDateTimeField;
    sdqConsultaPRESTADOR_PRESTACION: TStringField;
    sdqConsultaPRESTADOR_TRASLADO: TStringField;
    sdqConsultaEX_ID: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaAU_ID: TFloatField;
    sdqConsultaAU_NUMAUTO: TFloatField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaTJ_ID: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraPRESTADOR_PRESTACION_ID: TfraPrestador;
    fraPRESTADOR_TRASLADO_ID: TfraPrestador;
    fraDT_ID: TfraCodDesc;
    sdqConsultaCT_FECHA: TDateTimeField;
    edCT_FECHAHORA: TJvMonthCalendar;
    ShortCutControlHijo: TShortCutControl;
    pnlAnulado: TPanel;
    Panel2: TPanel;
    pnlReservado: TPanel;
    pnlDisponible: TPanel;
    fpAbm: TFormPanel;
    BevelAbm: TBevel;
    Label4: TLabel;
    Label7: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraCT_IDPRESTADOR: TfraPrestador;
    GridPacientes: TArtDBGrid;
    sdqPacientes: TSDQuery;
    dsPacientes: TDataSource;
    sdqConsultaCT_USUANULACION: TStringField;
    sdqConsultaCT_FECHAANULACION: TDateTimeField;
    sdqPacientesTJ_CUIL: TStringField;
    sdqPacientesTJ_NOMBRE: TStringField;
    sdqPacientesDOMICILIO: TStringField;
    sdqPacientesAU_TURNOHORA: TStringField;
    sdqPacientesPR_DESCRIPCION: TStringField;
    sdqPacientesSINIESTRO: TStringField;
    sdqPacientesAU_NUMAUTO: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    edPRESTADOR_TRASLADO: TDBEdit;
    edDT_DESCRIPCION: TDBEdit;
    sdqConsultaDT_DESCRIPCION: TStringField;
    pnlPendientes: TPanel;
    pnlEnCondiciones: TPanel;
    sdqPacientesAU_ESTADO: TStringField;
    sdqConsultaPRESTADOR_TRASLADO_ID: TFloatField;
    sdqPacientesEX_ID: TFloatField;
    sdqPacientesTJ_CALLE: TStringField;
    sdqPacientesTJ_NUMERO: TStringField;
    sdqPacientesTJ_PISO: TStringField;
    sdqPacientesTJ_DEPARTAMENTO: TStringField;
    sdqPacientesTJ_LOCALIDAD: TStringField;
    sdqPacientesTJ_PROVINCIA: TStringField;
    sdqPacientesCA_CALLE: TStringField;
    sdqPacientesCA_NUMERO: TStringField;
    sdqPacientesCA_PISO: TFloatField;
    sdqPacientesCA_DEPARTAMENTO: TStringField;
    sdqPacientesCA_LOCALIDAD: TStringField;
    sdqPacientesCA_PROVINCIA: TStringField;
    sdqPacientesEX_SINIESTRO: TFloatField;
    sdqPacientesEX_ORDEN: TFloatField;
    sdqPacientesEX_RECAIDA: TFloatField;
    sdqPacientesTJ_CPOSTAL: TStringField;
    sdqPacientesCA_CODPOSTAL: TStringField;
    sdqConsultaPRESTADOR_PRESTACION_ID: TFloatField;
    sdqPacientesEX_GTRABAJO: TStringField;
    sdqPacientesAU_ID: TFloatField;
    sdqConsultaDISPONIBILIDAD: TFloatField;
    cmbDISPONIBILIDAD: TComboBox;
    Label8: TLabel;
    tbImprimirReporte: TToolButton;
    Panel1: TPanel;
    sdqConsultaCORREO: TStringField;
    sdqConsultaDT_ID: TFloatField;
    sdqConsultaDOMICILIO: TStringField;
    Panel3: TPanel;
    edCT_FECHA: TDBText;
    Panel4: TPanel;
    sdqPacientesAU_OBSERVACIONES: TStringField;
    sdqPacientesTRANSPORTISTA: TStringField;
    sdqPacientesTRASLADO: TStringField;
    edDOMICILIO: TDBEdit;
    Label9: TLabel;
    edTRANSPORTISTA: TDBEdit;
    Label10: TLabel;
    fpAnular: TFormPanel;
    Bevel5: TBevel;
    Label18: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    sdqPacientesFECHA: TStringField;
    sdqPacientesHORA: TStringField;
    sdqPacientesCA_IDENTIFICADOR: TFloatField;
    sdqPacientesAU_AVAL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqPacientesAfterOpen(DataSet: TDataSet);
    procedure fpAbmShow(Sender: TObject);
    procedure GridPacientesGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure tbImprimirReporteClick(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure fpAnularShow(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;    
  end;

var
  frmCalendarioMediosDeTransporte: TfrmCalendarioMediosDeTransporte;

implementation

{$R *.dfm}

uses
  SqlFuncs, AnsiSql, CustomDlgs, DateTimeFuncs, General, unSesion, unDmPrincipal, unFiltros, VCLExtra, unART,
  unRedPres, unRptTrasladosMediosDeTransporte, unVisualizador, Math,
  unFraDomicilio;

procedure TfrmCalendarioMediosDeTransporte.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  fraPRESTADOR_PRESTACION_ID.ExtraCondition := ' and ca_permitetransporte = ''S'' ';
  fraPRESTADOR_TRASLADO_ID.ExtraCondition := ' and ca_especialidad = ''063'' ';
  fraPRESTADOR_PRESTACION_ID.OnChange := tbRefrescarClick;
  fraPRESTADOR_TRASLADO_ID.OnChange := tbRefrescarClick;
  inherited;
  edCT_FECHAHORA.Date := DBDate;
  with fraMotivoAnulacion do
  begin
    ShowBajas   := False;
    TableName   := 'SMT_MOTANULTRASLADOS';
    FieldID     := 'MT_ID';
    FieldCodigo := 'MT_CODIGO';
    FieldDesc   := 'MT_DESCRIPCION';
    FieldBaja   := 'MT_FECHABAJA';
    ExtraFields := ', MT_PERMITELIQUIDAR ';
  end
end;

procedure TfrmCalendarioMediosDeTransporte.ClearData;
begin
  fraPRESTADOR_PRESTACION_ID.Clear;
  fraPRESTADOR_TRASLADO_ID.Clear;
  fraDT_ID.Clear;
  edCT_FECHAHORA.Date := DBDate;
  cmbDISPONIBILIDAD.ItemIndex := -1;
  inherited;
end;

procedure TfrmCalendarioMediosDeTransporte.RefreshData;
var
  sSQL: String;
begin
  sSQL := FSQL + DoFiltro(pnlFiltros);

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmCalendarioMediosDeTransporte.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    sdqConsulta.First;

  Grid.ColumnByField['PRESTADOR_PRESTACION'].Visible := fraPRESTADOR_PRESTACION_ID.IsEmpty;
  Grid.ColumnByField['CT_IDPRESTADOR'].Visible := fraPRESTADOR_PRESTACION_ID.IsEmpty;
  Grid.ColumnByField['PRESTADOR_TRASLADO'].Visible := fraPRESTADOR_TRASLADO_ID.IsEmpty;
end;

procedure TfrmCalendarioMediosDeTransporte.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  DynColWidthsByData(Grid);
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    sdqConsulta.First;
end;

procedure TfrmCalendarioMediosDeTransporte.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if AreIn(Field.FullName, ['CT_NUMERO']) then
  begin
    if sdqConsulta.FieldByName('CT_FECHAASIGNACION').IsNull then
      Background := pnlDisponible.Color
    else if not sdqConsulta.FieldByName('CT_FECHAANULACION').IsNull then
      Background := pnlAnulado.Color
    else
      Background := pnlReservado.Color;
  end;
  if AreIn(Field.FullName, ['TJ_NOMBRE', 'AU_NUMAUTO', 'SINIESTRO']) then
  begin
    if not sdqConsulta.FieldByName('CT_FECHAANULACION').IsNull then
    begin
      AFont.Color := pnlAnulado.Color;
      AFont.Style := AFont.Style + [fsStrikeOut];
    end else
    begin
      AFont.Color := clBlack;
      AFont.Style := AFont.Style - [fsStrikeOut];
    end;
  end;
end;

procedure TfrmCalendarioMediosDeTransporte.tbNuevoClick(Sender: TObject);
begin
  inherited;
  fpAbm.ShowModal;
end;

procedure TfrmCalendarioMediosDeTransporte.btnAceptarClick(Sender: TObject);
var
  nIdTurno, nNumAuto, nIdTurnoTraslado, iAnulados: Integer;
  sFecha, sHora, sSQL, sWhere: String;
begin
  inherited;
  Verificar(not sdqPacientes.Active or sdqPacientes.IsEmpty, btnAceptar, 'Debe seleccionar un paciente para asociarlo al viaje en el medio de transporte seleccionado.');
  Verificar(sdqPacientes.FieldByName('AU_ESTADO').AsString = 'P', btnAceptar, 'Debe seleccionar una prestación que esté en condiciones de realizarse.' + CRLF + 'La autorización de esta prestación se encuentra pendiente de aprobar.');
  Verificar(sdqPacientes.FieldByName('TJ_CPOSTAL').AsInteger > MAXCODCAPFED, btnAceptar, 'Debe seleccionar un paciente que resida en Capital Federal.');
  nIdTurno := sdqConsultaCT_ID.AsInteger;

  BeginTrans(True);
  with sdqPacientes do
  try
    try
      if FieldByName('TRASLADO').AsString = vSI then
      begin
        iAnulados := CantTurnosBaja(FieldByName('AU_ID').AsInteger, 1, FieldByName('AU_ESTADO').AsString);

        if (iAnulados = 1) and
        not MsgAsk('Tenga en cuenta que no se pueden anular todos los turnos para esta autorización.' + CRLF + '¿Desea continuar?') then
          Abort;

        if ((iAnulados = 2) or (iAnulados = 3)) and
        not MsgAsk('Tenga en cuenta que no se pueden anular más turnos que los consumidos parcialmente para esta autorización.' + CRLF + '¿Desea continuar?') then
          Abort;

        if (iAnulados = 0) and MsgAsk(Format('¿Desea anular el traslado seleccionado contratado con %s?', [FieldByName('TRANSPORTISTA').AsString])) then
        begin
          sFecha := FieldByName('FECHA').AsString;
          sHora  := FieldByName('HORA').AsString;
          sWhere := ' WHERE tr_idauto = ' + SqlInt(FieldByName('AU_ID').AsInteger) +
                      ' AND tr_fecha = to_date(''' + sFecha + ''', ''dd/mm/yyyy'') ' +
                      ' AND tr_hora = ''' + sHora + '''';
          sSQL := 'SELECT 1 FROM art.str_traslados ' + sWhere + ' AND tr_fechaanulacion IS NOT NULL ';
          if not ExisteSql(sSQL) then  //si no está ya dado de baja
            if (fpAnular.ShowModal = mrOk) then
              try
                sSQL := ' UPDATE art.str_traslados ' +
                           ' SET tr_fechaanulacion = art.actualdate, ' +
                               ' tr_usuanulacion = ' + SqlValue(Sesion.UserID) + ',' +
                               ' tr_codanulacion = ' + SqlValue(fraMotivoAnulacion.Codigo) + sWhere;
                EjecutarSqlST(sSQL);
                if (fraMotivoAnulacion.sdqDatos.FieldByName('MT_PERMITELIQUIDAR').AsString = 'N') then
                begin
                  sSQL := ' UPDATE art.sau_autorizaciones ' +
                             ' SET au_cantapro = au_cantapro - 1, ' +
                                 ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                                 ' au_fechamodif = art.actualdate ' +
                           ' WHERE au_id = ' + SqlInt(FieldByName('AU_ID').AsInteger);
                  EjecutarSqlST(sSQL);
                end;

                if  (FieldByName('AU_ESTADO').AsString = 'C')
                and (CantTurnosBaja(FieldByName('AU_ID').AsInteger, 1, FieldByName('AU_ESTADO').AsString) = 3) then
                begin
                  sSql := 'UPDATE sau_autorizaciones ' +
                            ' SET au_estado = ''L'' ' +
                          ' WHERE au_id = ' + SqlInt(FieldByName('AU_ID').AsInteger);
                  EjecutarSqlST(sSQL)
                end;
              except
                on E:Exception do
                begin
                  MsgBox('No se pudo anular el último turno debido al siguiente error:' + #13 + #13 + E.Message);
                  if InTransaction then
                    Rollback;
                end;
              end
            else
              Abort;
        end;
      end else
        MsgBox('Recuerde que puede que tenga que anular el traslado de este paciente, ' + CRLF +
               'en caso de que éste ya tuviera reservado un remis o similar para la realización de esta prestación.');

      nNumAuto := InsertarAutorizacion(FieldByName('EX_ID').AsInteger, FieldByName('EX_SINIESTRO').AsInteger, FieldByName('EX_ORDEN').AsInteger, FieldByName('EX_RECAIDA').AsInteger, FieldByName('AU_ID').AsInteger,
                                       sdqConsulta.FieldByName('PRESTADOR_PRESTACION_ID').AsInteger, sdqConsulta.FieldByName('PRESTADOR_TRASLADO_ID').AsInteger,
                                       0, FieldByName('CA_IDENTIFICADOR').AsInteger,
                                       '' {sPrestacion}, 'A' {sEstado}, FieldByName('EX_GTRABAJO').AsString{sGrupoTrabajo}, 1 {nCantidad}, 1{iCantCombi}, 0{iCantRemis},
                                       FieldByName('AU_AVAL').AsInteger, 'P'{sTipoTraslado}, 'P'{sSolicitante}, 'T'{sDesde}, 'P'{sHasta},
                                       FieldByName('TJ_CALLE').AsString, FieldByName('TJ_NUMERO').AsString, FieldByName('TJ_PISO').AsString,
                                       FieldByName('TJ_DEPARTAMENTO').AsString, FieldByName('TJ_CPOSTAL').AsString,
                                       FieldByName('TJ_LOCALIDAD').AsString, FieldByName('TJ_PROVINCIA').AsString,
                                       FieldByName('CA_CALLE').AsString, FieldByName('CA_NUMERO').AsString, FieldByName('CA_PISO').AsString,
                                       FieldByName('CA_DEPARTAMENTO').AsString, FieldByName('CA_CODPOSTAL').AsString,
                                       FieldByName('CA_LOCALIDAD').AsString, FieldByName('CA_PROVINCIA').AsString,
                                       False, False{bConAcompaniante}, False{bConEspera}, False{bConRetorno}, False, False);

      nIdTurnoTraslado := InsertarTraslado(FieldByName('EX_SINIESTRO').AsInteger, FieldByName('EX_ORDEN').AsInteger,
                                           FieldByName('EX_RECAIDA').AsInteger, nNumAuto,
                                           sdqConsulta.FieldByName('CT_FECHAHORA').AsDateTime, False);

      AgendarViaje(0, nIdTurnoTraslado, nIdTurno, Sesion.UserID, False);
      CommitTrans(True);
    except
      RollBack(True);
    end;
  finally
    fpABM.ModalResult := mrOK;
  end;

  RefreshData;
  try
    sdqConsulta.Locate('CT_ID', nIdTurno, []);
  except
  end;
end;

procedure TfrmCalendarioMediosDeTransporte.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  tbNuevo.Enabled := False;
end;

procedure TfrmCalendarioMediosDeTransporte.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with sdqConsulta do
    tbNuevo.Enabled := Seguridad.Activar(tbNuevo) and FieldByName('CT_FECHAASIGNACION').IsNull and FieldByName('CT_FECHAANULACION').IsNull;
end;

procedure TfrmCalendarioMediosDeTransporte.sdqPacientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(GridPacientes);
  if sdqPacientes.Active and not sdqPacientes.IsEmpty then
    sdqPacientes.First;

  fpAbm.Width := Min(GridPacientes.Width + 24, 800);
end;

procedure TfrmCalendarioMediosDeTransporte.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraCT_IDPRESTADOR, edPRESTADOR_TRASLADO, edDT_DESCRIPCION, edDOMICILIO, edTRANSPORTISTA], True);
  fraCT_IDPRESTADOR.Cargar(sdqConsultaCT_IDPRESTADOR.AsInteger);
  OpenQueryEx(sdqPacientes, [TDateTimeEx.Create(sdqConsultaCT_FECHA.AsDateTime), sdqConsultaCT_IDPRESTADOR.AsInteger]);
end;

procedure TfrmCalendarioMediosDeTransporte.GridPacientesGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  if AreIn(Field.FullName, ['PR_DESCRIPCION']) then
  begin
    if sdqPacientes.FieldByName('AU_ESTADO').AsString = 'P' then
      Background := pnlPendientes.Color
    else
      Background := pnlEnCondiciones.Color;
  end;
  if AreIn(Field.FullName, ['TRASLADO']) then
  begin
    if sdqPacientes.FieldByName('TRASLADO').AsString = vSI then
      AFont.Color := clMoneyGreen
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmCalendarioMediosDeTransporte.tbImprimirReporteClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbImprimirReporte, 'No hay datos disponibles para el envío.');
  qrTrasladosMediosDeTransporte := TqrTrasladosMediosDeTransporte.Create(Self);
  with qrTrasladosMediosDeTransporte do
  try
    OpenQueryEx(sdqDatos, [sdqConsulta.FieldByName('PRESTADOR_TRASLADO_ID').AsInteger, TDateTimeEx.Create(sdqConsulta.FieldByName('CT_FECHA').AsDateTime)]);
    Visualizar(qrTrasladosMediosDeTransporte,
               GetValores(sdqConsulta.FieldByName('PRESTADOR_TRASLADO').AsString,
                          sdqConsulta.FieldByName('CORREO').AsString, 0, 0, ''), [oAlwaysShowDialog, oAutoFirma, oForceShowModal, oForceDB]);
  finally
    Free;
  end;
end;

procedure TfrmCalendarioMediosDeTransporte.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe seleccionar un motivo.');
  fpAnular.ModalResult := mrOk;
end;

procedure TfrmCalendarioMediosDeTransporte.fpAnularShow(Sender: TObject);
begin
  fraMotivoAnulacion.Clear;
end;

end.
