unit unControlErgonomia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraEstablecimiento,
  ToolEdit, unFraTrabajador, unFraTrabajadorSiniestro,
  unFraCodigoDescripcion, Mask, PatternEdit, unFraDomicilio, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ComboEditor, CheckCombo,
  unFraTrabajadorSiniestro_D5, unFraTrabajadorSinGrave, unPersonasEntrevistadas,
  DateComboBox;

type
  TfrmControlErgonomia = class(TfrmCustomGridABM)
    PageControl: TPageControl;
    tbSiniestro: TTabSheet;
    ScrollBoxSiniestro: TScrollBox;
    gbDatosEmpresa: TGroupBox;
    lbCUIT: TLabel;
    lbDomicilioempresa: TLabel;
    lbTelefonoEmpresa: TLabel;
    lbCIIU: TLabel;
    lbDescripcion: TLabel;
    fraEmpresaSiniestro: TfraEmpresa;
    fraDomicilioEmpresa: TfraDomicilio;
    edTelefonoEmpresa: TPatternEdit;
    edCIIU: TEdit;
    edCiiuDescripcion: TEdit;
    gbDatosTrabajador: TGroupBox;
    Label1: TLabel;
    lbTelefono: TLabel;
    lbCalle: TLabel;
    fraDomicilioAccidente: TfraDomicilio;
    edTelefonoAccidente: TPatternEdit;
    fraTrabajadorABM: TfraTrabajadorSiniestro;
    gbDescripciones: TGroupBox;
    lbBreveDescripcion: TLabel;
    lbObservacionExpediente: TLabel;
    lbDescripcionDenuncia: TLabel;
    lbObservacionDenuncia: TLabel;
    lbDescripcionOtros: TLabel;
    lbObservacionOtros: TLabel;
    edObservacionesExpediente: TMemo;
    edDescripcionDenuncia: TMemo;
    edObservacionDenuncia: TMemo;
    edDescripcionOtros: TMemo;
    edObservacionOtros: TMemo;
    tbInvestigacion: TTabSheet;
    ScrollBox1: TScrollBox;
    gbEmpresa: TGroupBox;
    gbLugarInvestigacion: TGroupBox;
    lbEstablecimientoTrabajador: TLabel;
    fraEstablecimientoTrabajador: TfraEstablecimiento;
    fraDomicilioEstablecimiento: TfraDomicilio;
    gbPreventor: TGroupBox;
    lbPreventorAsignado: TLabel;
    fraPreventorAsignado: TfraCodigoDescripcion;
    gbDatos: TGroupBox;
    gbhechos: TGroupBox;
    lbObservaciones: TLabel;
    edHechos: TMemo;
    fraEmpresaInvestigacion: TfraEmpresa;
    Label7: TLabel;
    cbAprobadoSI: TCheckBox;
    lbFechaInvestigacion: TLabel;
    edFechaInvestigacion: TDateEdit;
    Label2: TLabel;
    edHorarioDesde: TDateTimePicker;
    Label4: TLabel;
    edHorarioHasta: TDateTimePicker;
    cbHorasExtras: TCheckBox;
    cbTurnoRotativo: TCheckBox;
    ToolBar1: TToolBar;
    tbManPuesto: TToolButton;
    fraPuesto: TfraCodigoDescripcion;
    Label5: TLabel;
    Panel1: TPanel;
    fraProcedencia: TfraCodigoDescripcion;
    Label6: TLabel;
    cbAprobadoNo: TCheckBox;
    Label8: TLabel;
    ShortCutControl1: TShortCutControl;
    GroupBox1: TGroupBox;
    lbFechaAccidente: TLabel;
    edFechaAccidente: TDateEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    fraEmpresaFiltro: TfraEmpresa;
    Label3: TLabel;
    Label10: TLabel;
    edFechaCargaHasta: TDateEdit;
    Label11: TLabel;
    edFechaCargaDesde: TDateEdit;
    Label9: TLabel;
    lbFecha: TLabel;
    lbEstadoFiltro: TLabel;
    cbNoInvestigado: TCheckBox;
    cbAprobado: TCheckBox;
    cbNoAprobado: TCheckBox;
    fraCiiu: TfraCodigoDescripcion;
    fraCie10Filtro: TfraCodigoDescripcion;
    tsPersonasEntrevistadas: TTabSheet;
    tbTieneRiesgo: TToolButton;
    fpRelevamiento: TFormPanel;
    Bevel1: TBevel;
    btnCancelarCambioPreventor: TButton;
    lbRelevamientos: TLabel;
    lbRiesgo: TListBox;
    fraTrabajadorFiltro: TfraTrabajadorSiniestro;
    Label12: TLabel;
    fraPuestoFiltro: TfraCodigoDescripcion;
    Label13: TLabel;
    gbEstado: TGroupBox;
    lbEstado: TLabel;
    fraEstado: TfraCodigoDescripcion;
    edObservacionesEstado: TMemo;
    lbObservacionesEstado: TLabel;
    cmbEstado: TCheckCombo;
    Label14: TLabel;
    TabSheet3: TTabSheet;
    edFechaAgendado: TDateComboBox;
    Label15: TLabel;
    edHoraAgendado: TDateTimePicker;
    Label16: TLabel;
    Label17: TLabel;
    edContacto: TEdit;
    Label18: TLabel;
    edFechaAgendadaDesde: TDateComboBox;
    edFechaAgendadaHasta: TDateComboBox;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbAprobadoSIClick(Sender: TObject);
    procedure cbAprobadoNoClick(Sender: TObject);
    procedure tbManPuestoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbTieneRiesgoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    frmPersonasEntrevistadas : TfrmPersonasEntrevistadas;
    procedure BloquearSiniestro(valor : Boolean);
    procedure BorrarSiniestro;
    procedure CargarSiniestro;
    procedure CargarInvestigacion;
    procedure BloquearInvestigacion(valor: Boolean);
    procedure fraEstablecimientoOnChange(Sender: TObject);
    procedure BorrarInvestigacion;
    procedure EnviarMailErgonomia;
  public
    { Public declarations }
  protected
    procedure LoadControls; override;
    procedure ClearControls;override;
    function Validar: Boolean; override;
    function DoABM: Boolean;override;
  end;

var
  frmControlErgonomia: TfrmControlErgonomia;

implementation

{$R *.dfm}

uses SqlOracle, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, General, vclExtra,
  unCustomConsulta, DateTimeFuncs, unManPuesto, unReasignacionCP, SinEdit,
  unMoldeEnvioMail,unComunes;

procedure TfrmControlErgonomia.BloquearSiniestro(valor: Boolean);
begin
  vclExtra.LockControls([fraEmpresaSiniestro,fraDomicilioEmpresa,edTelefonoEmpresa,
                         edCIIU, edCiiuDescripcion, fraTrabajadorABM, 
                         edTelefonoAccidente, fraDomicilioAccidente,
                         edFechaAccidente, edObservacionesExpediente, edDescripcionDenuncia,
                         edObservacionDenuncia, edDescripcionOtros,
                         edObservacionOtros],valor);
end;

procedure TfrmControlErgonomia.BloquearInvestigacion(valor: Boolean);
begin
  vclExtra.LockControls([fraEmpresaInvestigacion,fraDomicilioEstablecimiento],valor);
end;

procedure TfrmControlErgonomia.BorrarSiniestro;
begin
  fraEmpresaSiniestro.Clear;
  fraDomicilioEmpresa.Clear;
  edTelefonoEmpresa.Clear;
  edCIIU.Clear;
  edCiiuDescripcion.Clear;
  fraTrabajadorABM.Clear;
  edTelefonoAccidente.Clear;
  fraDomicilioAccidente.Clear;
  edFechaAccidente.Clear;
  edObservacionesExpediente.Clear;
  edDescripcionDenuncia.Clear;
  edObservacionDenuncia.Clear;
  edDescripcionOtros.Clear;
  edObservacionOtros.Clear;
end;

procedure TfrmControlErgonomia.BorrarInvestigacion;
begin
  fraProcedencia.Clear;
  fraEmpresaInvestigacion.Clear;
  fraEstablecimientoTrabajador.Clear;
  fraDomicilioEstablecimiento.Clear;
  cbAprobadoSI.Checked := False;
  cbAprobadoNO.Checked := False;
  edFechaInvestigacion.Clear;
  fraEstado.Clear;
  edFechaAgendado.Clear;
  edHoraAgendado.Time := StrToTime('00:00:00');
  edContacto.Clear;
  edObservacionesEstado.Clear;
  cbTurnoRotativo.Checked := False;
  edHorarioDesde.Time := StrToTime('00:00:00');
  edHorarioHasta.Time := StrToTime('00:00:00');
  cbHorasExtras.Checked := False;
  fraPuesto.Clear;
  fraPreventorAsignado.Clear;
  edHechos.Clear;
end;

procedure TfrmControlErgonomia.CargarSiniestro;
begin
  fraEmpresaSiniestro.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraDomicilioEmpresa.Cargar(sdqConsulta.FieldByName('dc_calle').AsString, sdqConsulta.FieldByName('dc_cpostal').AsString,
    sdqConsulta.FieldByName('dc_localidad').AsString,sdqConsulta.FieldByName('dc_numero').AsString, sdqConsulta.FieldByName('dc_piso').AsString,
    sdqConsulta.FieldByName('dc_departamento').AsString,sdqConsulta.FieldByName('dc_provincia').AsString,sdqConsulta.FieldByName('dc_cpostala').AsString);
  edTelefonoEmpresa.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  edCIIU.Text := sdqConsulta.FieldByName('ac_relacion').AsString;
  edCiiuDescripcion.Text := sdqConsulta.FieldByName('ac_descripcion').AsString;
  edObservacionesExpediente.Text := sdqConsulta.FieldByName('ex_observaciones').AsString;
  edDescripcionDenuncia.Text := sdqConsulta.FieldByName('de_descripcion').AsString;
  edObservacionDenuncia.Text := sdqConsulta.FieldByName('de_observaciones').AsString;
  edDescripcionOtros.Text := sdqConsulta.FieldByName('sa_descripcion').AsString;
  edObservacionOtros.Text := sdqConsulta.FieldByName('sa_observaciones').AsString;
  fraTrabajadorABM.IdSiniestro :=  sdqConsulta.FieldByName('ex_id').AsInteger;
  edTelefonoAccidente.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  fraDomicilioAccidente.Cargar(sdqConsulta.FieldByName('UD_CALLE').AsString,sdqConsulta.FieldByName('UD_CPOSTAL').AsString,
    sdqConsulta.FieldByName('UD_LOCALIDAD').AsString,sdqConsulta.FieldByName('UD_NUMERO').AsString,
    sdqConsulta.FieldByName('UD_PISO').AsString, sdqConsulta.FieldByName('UD_DEPARTAMENTO').AsString,
    sdqConsulta.FieldByName('UD_PROVINCIA').AsString, sdqConsulta.FieldByName('UD_CPOSTALA').AsString);
  edFechaAccidente.Date := sdqConsulta.FieldByName('fechaaccidente').AsDateTime;
end;

procedure TfrmControlErgonomia.CargarInvestigacion;
begin
  fraProcedencia.Codigo := sdqConsulta.FieldByName('ie_procedencia').AsString;
  fraEmpresaInvestigacion.Contrato := sdqConsulta.FieldByName('contratoinvestigacion').AsInteger;
  fraEstablecimientoTrabajador.IdEmpresa := fraEmpresaInvestigacion.ID;
  fraEstablecimientoTrabajador.Value := sdqConsulta.FieldByName('ie_estableci').AsInteger;
  with GetQuery(
      ' SELECT es_calle, es_numero, es_piso, es_departamento, es_cpostala, '+
      '        es_localidad, es_cpostal, es_provincia, pv_descripcion '+
      '   FROM aes_establecimiento, art.cpv_provincias '+
      '  WHERE es_id = '+SqlValue(sdqConsulta.FieldByName('ie_estableci').AsInteger)+' AND es_provincia = pv_codigo')do
  begin
    fraDomicilioEstablecimiento.Cargar(FieldByName('es_calle').AsString,FieldByName('es_cpostal').AsString,
      FieldByName('es_localidad').AsString, FieldByName('es_numero').AsString, FieldByName('es_piso').AsString,
      FieldByName('es_departamento').AsString, FieldByName('es_provincia').AsString, FieldByName('es_cpostala').AsString);
  end;
  cbAprobadoSI.Checked := sdqConsulta.FieldByName('ie_aprobado').AsString = 'S';
  cbAprobadoNo.Checked := sdqConsulta.FieldByName('ie_aprobado').AsString = 'N';
  edFechaInvestigacion.Date := sdqConsulta.FieldByName('ie_fechainvestigacion').AsDateTime;
  fraEstado.Codigo := sdqConsulta.FieldByName('IE_IDESTADOERGONOMIA').AsString;

  edFechaAgendado.Date := sdqConsulta.FieldByName('IE_FECHAAGENDADA').AsDateTime;
  edHoraAgendado.Time := EncodeTime( StrToInt(copy(sdqConsulta.FieldByName('IE_HORAAGENDADA').AsString,1,2)),
                                     StrToInt(copy(sdqConsulta.FieldByName('IE_HORAAGENDADA').AsString,4,2)),0,0);
  edContacto.Text := sdqConsulta.FieldByName('IE_CONTACTO').AsString;

  edObservacionesEstado.Text := sdqConsulta.FieldByName('IE_OBSERVACIONES').AsString;
  cbTurnoRotativo.Checked := sdqConsulta.FieldByName('ie_turnorotativo').AsString = 'S';
  edHorarioDesde.Time := EncodeTime( StrToInt(copy(sdqConsulta.FieldByName('ie_horadesde').AsString,1,2)),
                                     StrToInt(copy(sdqConsulta.FieldByName('ie_horadesde').AsString,4,2)),0,0);
  edHorarioHasta.Time := EncodeTime( StrToInt(copy(sdqConsulta.FieldByName('ie_horahasta').AsString,1,2)),
                                     StrToInt(copy(sdqConsulta.FieldByName('ie_horahasta').AsString,4,2)),0,0);
  cbHorasExtras.Checked := sdqConsulta.FieldByName('ie_horasextras').AsString = 'S';
  fraPuesto.Codigo := sdqConsulta.FieldByName('ie_idpuesto').AsString;
  fraPreventorAsignado.Codigo := sdqConsulta.FieldByName('IE_IDPREVENTOR').AsString;
  edHechos.Text := sdqConsulta.FieldByName('IE_HECHOS').AsString;
end;


procedure TfrmControlErgonomia.ClearControls;
begin
  inherited;
  BorrarSiniestro;
  BorrarInvestigacion;
end;

procedure TfrmControlErgonomia.EnviarMailErgonomia;
var
  cuerpo, sAprobado ,aprobado,direccion, direccionsin,asunto: String;
  siniestro, orden : String;
begin
  if cbAprobadoSI.Checked THEN
  begin
    aprobado := 'S';
    sAprobado := 'Aprobado';
  end;
  if cbAprobadoNo.Checked then
  begin
    aprobado := 'N';
    sAprobado := 'No Aprobado';
  end;
  if (sdqConsulta.FieldByName('IE_APROBADO').AsString <> aprobado) or
     (sdqConsulta.FieldByName('IE_HECHOS').AsString <> edHechos.Text) then
  begin
    direccion := Get_DireccionesEnvioMail('HYSERG');
    siniestro := ValorSql( 'select ex_siniestro from sex_expedientes where ex_id ='+
                  sqlvalue(sdqConsulta.FieldByName('IE_IDEXPEDIENTE').AsString));
    orden := ValorSql( 'select ex_orden from sex_expedientes where ex_id ='+
                  sqlvalue(sdqConsulta.FieldByName('IE_IDEXPEDIENTE').AsString));
    asunto := 'Investigación Ergonómica';
    cuerpo := ' Se ha realizado la siguiente investigación ergonómica: '+#13#10+
            ' Siniestro: '+siniestro+'-'+orden+#13#10+
            ' Trabajador: '+fraTrabajadorABM.CUIL+' – '+fraTrabajadorABM.Nombre+#13#10+
            ' Empresa: '+fraEmpresaSiniestro.CUIT+' - '+fraEmpresaSiniestro.NombreEmpresa+#13#10+
            ' Contrato: '+ IntToStr(fraEmpresaSiniestro.Contrato)+#13#10+
            ' Establecimiento: '+fraEstablecimientoTrabajador.Codigo+' - '+fraEstablecimientoTrabajador.Descripcion+#13#10+
            ' Fecha Investigación: '+DateToStr(edFechaInvestigacion.Date)+#13#10+
            ' Evaluador: '+fraPreventorAsignado.Descripcion+#13#10+
            ' Resultado: '+sAprobado+#13#10+
            ' Puesto: '+fraPuesto.Descripcion+#13#10+
            ' Hechos: '+edHechos.Text+#13#10;

    with GetQuery(' SELECT se_mail email '+
        '   FROM art.use_usuarios, ces_emailsector, art.usc_sectores, art.del_delegacion, '+
        '        art.sex_expedientes '+
        '  WHERE ex_id = '+ SqlValue(sdqConsulta.FieldByName('IE_IDEXPEDIENTE').AsString)+
        '    AND ex_delegacion = el_id '+
        '    AND el_fechabaja IS NULL '+
        '    AND el_id = sc_delegacion '+
        '    AND sc_fechabaja IS NULL '+
        '    AND sc_codigo = es_sector '+
        '    AND es_fechabaja IS NULL '+
        '    AND es_responsable = ''S'' '+
        '    AND es_direlectronica = se_usuario '+
        '    AND se_fechabaja IS NULL '+
        '    AND se_mail IS NOT NULL '+
        '    AND ex_delegacion <> 840 ') do
    try
      while not Eof do
      begin
        if direccionsin <> '' then
        begin
          direccionsin := FieldByName('email').AsString;
        end
        else
          direccionsin := direccionsin +','+FieldByName('email').AsString;
        Next;
      end;
    finally
      Free;
    end;

    if direccion <> '' then
    begin
      if direccionsin <> '' then
      begin
        direccion := direccion + ','+ direccionsin;
      end;
    end
    else
      direccion := direccionsin;

    EnviarMailBD(Direccion,asunto,[], cuerpo,nil,0,tcDefault,False)
  end;
end;

function TfrmControlErgonomia.DoABM: Boolean;
var
  iIdCodigo, NuevoPE  : Integer;
  aprobado, sSqLSPV, observaciones, sMedico : String;
  siniestro, orden, recaida, nroParte : Integer;
begin
  BeginTrans(True);
  try
    nroParte := 0;
    siniestro :=  sdqConsulta.FieldByName('ex_siniestro').AsInteger;
    orden := sdqConsulta.FieldByName('ex_orden').AsInteger;
    recaida := sdqConsulta.FieldByName('ex_recaida').AsInteger;
    {if cbAprobadoSI.Checked then
      sAprobado := 'Aprobado'
    else
      sAprobado := 'Desaprobado';
    }
    observaciones := {sAprobado + ' - '+ }edHechos.Text;

    sMedico := ValorSql(
      ' SELECT au_nombre '+
      '   FROM art.pit_firmantes, art.mau_auditores '+
      '  WHERE it_idauditor = au_auditor '+
      '    AND it_id = '+SqlValue(fraPreventorAsignado.ID));
    aprobado := '';
    if cbAprobadoSI.Checked THEN
    begin
      aprobado := 'S';
    end;
    if cbAprobadoNo.Checked then
    begin
      aprobado := 'N';
    end;
    if (sdqConsulta.FieldByName('IE_APROBADO').AsString <> aprobado) then
    begin
      if sdqConsulta.FieldByName('ie_nroparteevolutivo').IsNull then
      begin
        NuevoPE := ValorSqlInteger ('SELECT NVL(MAX(pv_nroparte), 0) + 1 ' +
                                    '  FROM spv_parteevolutivo ' +
                                  ' WHERE pv_siniestro = ' + SqlValue(siniestro) +
                                  '   AND pv_orden = ' + sqlvalue(orden) +
                                  '   AND pv_recaida = ' + sqlvalue(recaida));


        
        sSqLSPV := 'INSERT INTO spv_parteevolutivo ' +
                 '(pv_siniestro, pv_orden, pv_recaida, pv_nroparte, ' +
                 ' pv_identifprestador, pv_observaciones, pv_fechacontrol,' +
                 ' pv_fecharecepcion, pv_tipoparte, pv_usualta, pv_fechaalta, ' +
                 ' pv_fechacarga, pv_turno, pv_turnohora, pv_medico) VALUES (' +
                  SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                  SqlInt(NuevoPE) + ', 10667, ' + SqlValue(observaciones) + ',' +
                 ' art.actualdate,'+ SqlDate(edFechaInvestigacion.Date)+', ''Q'',' +
                 SqlValue(Sesion.UserID) + ', art.actualdate, sysdate, null,null, ' +
                 SqlString(sMedico, True, True) + ') ';

        nroParte := NuevoPE;
      end
      else
      begin
        sSqLSPV := ' UPDATE art.spv_parteevolutivo '+
                   '    SET pv_observaciones = '+SqlValue(observaciones)+','+
                   '        pv_fecharecepcion = '+SqlDate(edFechaInvestigacion.Date)+
                   '  WHERE pv_siniestro = '+SqlInt(Siniestro) +
                   '    AND pv_orden = '+SqlInt(Orden) +
                   '    AND pv_recaida = '+ SqlInt(Recaida)+
                   '    AND pv_nroparte = '+ SqlValue(sdqConsulta.FieldByName('ie_nroparteevolutivo').AsString);
        nroParte := sdqConsulta.FieldByName('ie_nroparteevolutivo').AsInteger;
      end;
      EnviarMailErgonomia;
      EjecutarSqlST(sSqLSPV);
    end;

    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('IE_ID').AsInteger;
      Sql.Fields.Add('IE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('IE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('IE_IDEMPRESA', fraEmpresaInvestigacion.Value);
      Sql.Fields.AddInteger('IE_NROPARTEEVOLUTIVO', nroParte,True);
      Sql.Fields.Add('IE_ESTABLECI', fraEstablecimientoTrabajador.Value);

      IF cbAprobadoSI.Checked THEN
      begin
        Sql.Fields.Add('IE_APROBADO', 'S');
        fraEstado.Codigo := '1';
      end
      else
      if cbAprobadoNo.Checked then
      begin
        Sql.Fields.Add('IE_APROBADO', 'N');
        fraEstado.Codigo := '1';
      end
      else
        Sql.Fields.Add('IE_APROBADO', exNull);


      Sql.Fields.Add('IE_FECHAAGENDADA', edFechaAgendado.Date);
      Sql.Fields.Add('IE_HORAAGENDADA', FormatDateTime('hh:nn',edHoraAgendado.Time ));
      Sql.Fields.Add('IE_CONTACTO', edContacto.Text);
      Sql.Fields.Add('IE_FECHAINVESTIGACION', edFechaInvestigacion.Date);
      Sql.Fields.Add('IE_IDESTADOERGONOMIA', fraEstado.Codigo);
      Sql.Fields.Add('IE_OBSERVACIONES', edObservacionesEstado.Text);
      if cbTurnoRotativo.Checked then
        Sql.Fields.Add('IE_TURNOROTATIVO', 'S')
      else
        Sql.Fields.Add('IE_TURNOROTATIVO', 'N');

      if cbHorasExtras.Checked then
        Sql.Fields.Add('IE_HORASEXTRAS', 'S')
      else
        Sql.Fields.Add('IE_HORASEXTRAS', 'N');

      Sql.Fields.Add('IE_HORADESDE',FormatDateTime('hh:nn',edHorarioDesde.Time ));
      Sql.Fields.Add('IE_HORAHASTA', FormatDateTime('hh:nn',edHorarioHasta.Time ));
      Sql.Fields.Add('IE_IDPUESTO', fraPuesto.ID);
      Sql.Fields.Add('IE_IDPREVENTOR', fraPreventorAsignado.ID);
      Sql.Fields.Add('IE_HECHOS', edHechos.Text);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HIE_ERG_ID');
        Sql.Fields.Add('IE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('IE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('IE_ID').AsInteger;
        Sql.Fields.Add('IE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('IE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('IE_USUBAJA', exNull );
        Sql.Fields.Add('IE_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('IE_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);

    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la ergonomia.');
    end;
  end;
end;

procedure TfrmControlErgonomia.FormCreate(Sender: TObject);
begin
  inherited;
  vclExtra.lockControls([fraProcedencia],True);
  BloquearSiniestro(True);
  BloquearInvestigacion(True);
  FieldBaja := 'IE_FECHABAJA';
  Sql.TableName := 'HYS.HIE_INVERGONOMIA';
  fraEmpresaSiniestro.ShowBajas := True;
  fraEmpresaInvestigacion.ShowBajas := True;
  fraEmpresaFiltro.ShowBajas := True;

  with fraProcedencia do
  begin
    TableName := 'hys.hpr_procedencia';
    FieldDesc := 'PR_DESCRIPCION';
    FieldID := 'PR_ID';
    FieldCodigo := 'PR_CODIGO';
    FieldBaja := 'PR_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCie10Filtro do
  begin
    TableName := 'art.cdg_diagnostico';
    FieldDesc := 'DG_DESCRIPCION';
    FieldID := 'DG_ID';
    FieldCodigo := 'DG_CODIGO';
    FieldBaja := 'DG_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCiiu do
  begin
    TableName := 'comunes.cac_actividad';
    FieldDesc := 'AC_DESCRIPCION';
    FieldID := 'AC_ID';
    FieldCodigo := 'AC_CODIGO';
    FieldBaja := 'AC_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := False;
  end;

  with fraPuesto do
  begin
    TableName := 'hys.hpu_puesto';
    FieldDesc := 'pu_descripcion';
    FieldID := 'pu_id';
    FieldCodigo := 'pu_id';
    FieldBaja := 'pu_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPuestoFiltro do
  begin
    TableName := 'hys.hpu_puesto';
    FieldDesc := 'pu_descripcion';
    FieldID := 'pu_id';
    FieldCodigo := 'pu_id';
    FieldBaja := 'pu_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPreventorAsignado do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraEstado do
  begin
    TableName := 'HYS.HEE_ESTADOERGONOMIA';
    FieldDesc := 'EE_DESCRIPCION';
    FieldID := 'EE_ID';
    FieldCodigo := 'EE_ID';
    FieldBaja := 'EE_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with GetQuery('SELECT * FROM hys.HEE_ESTADOERGONOMIA ORDER BY ee_id') do
  try
    while not Eof do
    begin
      cmbEstado.Items.AddObject(fieldbyname('EE_DESCRIPCION').AsString, TObject(fieldbyname('EE_ID').AsInteger));
      cmbEstado.Checked[fieldbyname('EE_ID').AsInteger-1] := True;
      Next;
    end;
  finally
    Free;
  end;

  frmPersonasEntrevistadas := TfrmPersonasEntrevistadas.Create( Self );
  frmPersonasEntrevistadas.Parent    := tsPersonasEntrevistadas;
  frmPersonasEntrevistadas.Visible   := True;
  frmPersonasEntrevistadas.Align     := alClient;

  fraEstablecimientoTrabajador.ShowBajas := True;
  fraEstablecimientoTrabajador.OnChange := fraEstablecimientoOnChange;
  tbTieneRiesgo.Left := tbSalir.Left -5;
end;

procedure TfrmControlErgonomia.fraEstablecimientoOnChange(Sender: TObject);
begin
  with GetQuery(
      ' SELECT es_calle, es_numero, es_piso, es_departamento, es_cpostala, '+
      '        es_localidad, es_cpostal, es_provincia, pv_descripcion '+
      '   FROM aes_establecimiento, art.cpv_provincias '+
      '  WHERE es_id = '+SqlValue(fraEstablecimientoTrabajador.Value)+' AND es_provincia = pv_codigo')do
  begin
    fraDomicilioEstablecimiento.Cargar(FieldByName('es_calle').AsString,FieldByName('es_cpostal').AsString,
      FieldByName('es_localidad').AsString,FieldByName('es_numero').AsString,FieldByName('es_piso').AsString,
      FieldByName('es_departamento').AsString,FieldByName('es_provincia').AsString,FieldByName('es_cpostala').AsString);
  end;
end;



procedure TfrmControlErgonomia.LoadControls;
begin
  ScrollBoxSiniestro.VertScrollBar.Position := 0;
  PageControl.ActivePageIndex := 1;
  frmPersonasEntrevistadas.Cargar(sdqConsulta.FieldByName('ie_id').AsInteger);
  CargarSiniestro;
  CargarInvestigacion;
  inherited;

end;

function TfrmControlErgonomia.Validar: Boolean;
begin
  if cbAprobadoSI.Checked or cbAprobadoNo.Checked then
  begin
    //Verificar(not cbAprobadoSI.Checked and not cbAprobadoNo.Checked ,cbAprobadoSI, 'Debe Seleccionar si esta o no aprobado');
    Verificar(edFechaInvestigacion.Date = 0,edFechaInvestigacion, 'Debe ingresar fecha de investigación.');
    Verificar(edFechaInvestigacion.Date > DBDate ,edFechaInvestigacion, 'La fecha no puede ser mayor a hoy.');
    Verificar(not fraPuesto.IsSelected,fraPuesto, 'Debe seleccionar un puesto.');
    Verificar(not fraPreventorAsignado.IsSelected,fraPreventorAsignado, 'Debe seleccionar un preventor.');
    Verificar(edHechos.Text = '',edHechos, 'Debe ingresar Hechos.');
    Verificar((edFechaInvestigacion.Date > 0) and fraEstablecimientoTrabajador.IsEmpty, fraEstablecimientoTrabajador, 'El establecimiento es obligatorio.');
  end;
  Result := true;
end;

procedure TfrmControlErgonomia.cbAprobadoSIClick(Sender: TObject);
begin
  inherited;
  if cbAprobadoSI.Checked then
    cbAprobadoNo.Checked := False;
end;

procedure TfrmControlErgonomia.cbAprobadoNoClick(Sender: TObject);
begin
  inherited;
  if cbAprobadoNo.Checked then
    cbAprobadoSI.Checked := False;
end;

procedure TfrmControlErgonomia.tbManPuestoClick(Sender: TObject);
begin
  inherited;
  with TfrmManPuesto.Create(nil) do
  try
    FormStyle := fsNormal;
    pnAceptarPuesto.Visible := True;
    Visible := false;
    ShowModal;
    if FIDPuesto <> 0 then
      fraPuesto.Codigo := IntToStr(FIDPuesto);
  finally
    Free;
  end;
end;

procedure TfrmControlErgonomia.tbRefrescarClick(Sender: TObject);
var
  sSQL : String;
  sWhere, sIn : String;
  i : Integer;
begin
  sWhere := '';
  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere+' AND ex_cuit = '+SqlValue(fraEmpresaFiltro.CUIT);
  if fraCiiu.IsSelected then
  begin
    sWhere := sWhere+' AND co_idactividad = '+SqlValue(fraCiiu.Value);
  end;
  if cbAprobado.Checked then
    sWhere := sWhere+' AND IE_APROBADO = ''S'' ';
  if cbNoAprobado.Checked then
    sWhere := sWhere+' AND IE_APROBADO = ''N'' ';
  if fraTrabajadorFiltro.IsSelected then
  begin
    sWhere := sWhere+' AND ex_siniestro = '+SqlValue(fraTrabajadorFiltro.edSiniestro.SiniestroS);
    sWhere := sWhere+' AND ex_orden = '+SqlValue(fraTrabajadorFiltro.edSiniestro.OrdenS);
    sWhere := sWhere+' AND ex_recaida = '+SqlValue(fraTrabajadorFiltro.edSiniestro.RecaidaS);
  end;
  if fraCie10Filtro.IsSelected then
  begin
    sWhere := sWhere+' AND EX_DIAGNOSTICOOMS = '+SqlValue(fraCie10Filtro.Codigo);
  end;

  if (edFechaCargaDesde.Date = edFechaCargaHasta.Date) and (edFechaCargaHasta.Date <> 0) then
    sWhere := sWhere+' AND IE_FECHAALTA = '+ SqlDate(edFechaCargaDesde.Date)
  else
  begin
    if edFechaCargaDesde.Date <> 0 then
    begin
      sWhere := sWhere+' AND IE_FECHAALTA >= '+ SqlDate(edFechaCargaDesde.Date);
    end;
    if edFechaCargaHasta.Date <> 0 then
    begin
      sWhere := sWhere+' AND IE_FECHAALTA <= '+ SqlDate(edFechaCargaHasta.Date);
    end;
  end;

  if (edFechaAgendadaDesde.Date = edFechaAgendadaHasta.Date) and (edFechaAgendadaHasta.Date <> 0) then
    sWhere := sWhere+' AND IE_FECHAAGENDADA = '+ SqlDate(edFechaAgendadaDesde.Date)
  else
  begin
    if edFechaAgendadaDesde.Date <> 0 then
    begin
      sWhere := sWhere+' AND IE_FECHAAGENDADA >= '+ SqlDate(edFechaAgendadaDesde.Date);
    end;
    if edFechaAgendadaHasta.Date <> 0 then
    begin
      sWhere := sWhere+' AND IE_FECHAAGENDADA <= '+ SqlDate(edFechaAgendadaHasta.Date);
    end;
  end;


  if cbNoInvestigado.Checked then
    sWhere := sWhere+' AND IE_FECHAINVESTIGACION IS NULL';

  if cmbEstado.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbEstado.Items.Count-1 do
      if cmbEstado.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbEstado.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sWhere := sWhere + '   AND IE_IDESTADOERGONOMIA + 0 in (' + sIn  + ')';

  if fraPuestoFiltro.IsSelected then
    sWhere := sWhere+' AND ie_idpuesto = '+SqlValue(fraPuestoFiltro.Codigo);

  sSQL :=
    ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id, ex_recaida, ex_siniestro, ex_orden, '+
    '        co_contrato, em_cuit, em_nombre, es_nroestableci, tj_cuil, tj_nombre, NVL(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, '+
    '        (SELECT ta_descripcion ' +
    '         FROM SIN.sta_tipoaccidente ' +
    '         WHERE sex.ex_tipo = ta_codigo) ta_descripcion, it_nombre, ud_calle, ud_numero, ud_piso, ud_departamento, ud_cpostal, ud_cpostala, ud_localidad, '+
    '        ud_provincia, provaccid.pv_descripcion AS provinciaaccidente, ie_idestadoergonomia, ie_observaciones, ee_descripcion, '+
    '        art.utiles.armar_telefono(ud_codareatelefonos, NULL, ud_telefonos) AS telaccidente, dc_calle, dc_numero, dc_piso, '+
    '        dc_departamento, dc_cpostal, dc_cpostala, dc_localidad, dc_provincia, provdomic.pv_descripcion AS provinciaemp, '+
    '        art.utiles.armar_telefono(dc_codareatelefonos, NULL, dc_telefonos) AS teldomicilio, art.hys.get_codactividadrevdos(ac_id, ac_revision) ac_relacion, ac_descripcion, '+
    '        ex_brevedescripcion, ex_observaciones, de_descripcion, de_observaciones, sa_descripcion, sa_observaciones, ie_id, '+
    '        ie_idempresa, ie_estableci, ie_idtrabajador, ie_idexpediente, ie_idcabeceranomina, ie_procedencia, ie_idreconfirmacion, '+
    '        ie_aprobado, ie_fechainvestigacion, ie_turnorotativo, NVL(ie_horadesde, ''00:00'') ie_horadesde,ie_fechaagendada, '+
    '        NVL(ie_horaagendada, ''00:00'') ie_horaagendada, ie_contacto, '+
    '        NVL(ie_horahasta, ''00:00'') ie_horahasta, ie_horasextras, ie_idpuesto, ie_hechos, ie_idpreventor, ie_usualta, '+
    '        ie_fechaalta, ie_fechabaja,ie_nroparteevolutivo, '+
    '        NVL((SELECT co_contrato '+
    '               FROM afi.aco_contrato '+
    '              WHERE co_idempresa = ie_idempresa '+
    '                AND co_contrato = art.afiliacion.get_contratovigente(ex_cuit, art.actualdate)), '+
    '        co_contrato) AS contratoinvestigacion, '+
    '        (SELECT pr_descripcion '+
    '           FROM hys.hpr_procedencia '+
    '          WHERE pr_codigo = ie_procedencia '+
    '            AND pr_fechabaja IS NULL) procedencia, (SELECT pu_descripcion '+
    '                                                      FROM hys.hpu_puesto '+
    '                                                     WHERE pu_id = ie_idpuesto '+
    '                                                       AND pu_fechabaja IS NULL) puesto, '+
    '        DECODE(ie_aprobado, ''S'', ''Si'', ''N'', ''No'') aprobado '+
    '   FROM art.cpv_provincias provdomic, art.cpv_provincias provaccid, aco_contrato aco, afi.adc_domiciliocontrato, aem_empresa, '+
    '        hys.hee_estadoergonomia, comunes.cac_actividad, comunes.ctj_trabajador, art.sex_expedientes sex, afi.aes_establecimiento, '+
    '        SIN.ssa_solicitudasistencia, SIN.sde_denuncia, SIN.sud_ubicaciondenuncia, art.pit_firmantes, hys.hie_invergonomia '+
    '  WHERE ie_idexpediente = ex_id '+
    '    AND dc_contrato = co_contrato '+
    '    AND es_id(+) = ie_estableci '+
    '    AND ee_id(+) = ie_idestadoergonomia '+
    '    AND dc_tipo = ''P'' '+
    '    AND ex_cuit = em_cuit '+
    '    AND aco.co_idempresa = em_id '+
    '    AND aco.co_contrato = art.afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente) '+
    '    AND ex_cuil = tj_cuil '+
    '    AND co_idactividad = ac_id '+
    '    AND ie_idpreventor = it_id(+) '+
    '    AND ex_id = sa_idexpediente(+) '+
    '    AND ex_id = de_idexpediente(+) '+
    '    AND ex_id = ud_idexpediente(+) '+
    '    AND ud_provincia = provaccid.pv_codigo(+) '+
    '    AND dc_provincia = provdomic.pv_codigo(+) '+
    '    AND ex_diagnosticooms in ( ''G56.0'', ''M65.4'', ''M65'', ''M75.1'', '+
    '                        ''M65.9'', ''M77.0'', ''M77.1'',''M53.1'', ''M75.2'') '+
    '    AND ie_procedencia = ''S'' '+sWhere;

  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmControlErgonomia.tbTieneRiesgoClick(Sender: TObject);
begin
  inherited;
  with GetQuery(
    ' SELECT   rt_estableci, rt_fecha,rt_id '+
    '     FROM art.prt_riestrab '+
    '    WHERE rt_riesgo IN(SELECT rg_codigo '+
    '                         FROM art.prg_riesgos '+
    '                        WHERE rg_esop = ''80004'' '+
    '                          AND rg_fechabaja IS NULL) '+
    '      AND rt_cuit = '+SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+
    '      AND rt_cuil = '+SqlValue(sdqConsulta.FieldByName('tj_cuil').AsString)+
    ' ORDER BY 1, 2 ') do
  try
    lbRiesgo.Clear;
    while not Eof do
    begin
      lbRiesgo.Items.AddObject(FieldByName('rt_estableci').AsString + ' - '+
                               FieldByName('rt_fecha').AsString ,
                               TObject(FieldByName('rt_id').AsInteger));

      Next;
    end;
  finally
    Free;
  end;
  Verificar(lbRiesgo.Count = 0, Grid, 'No hay relevamiento con ESOP 80004.');
  fpRelevamiento.ShowModal;
end;

procedure TfrmControlErgonomia.tbLimpiarClick(Sender: TObject);
var
  i : Integer;
begin
  fraEmpresaFiltro.Clear;
  fraCiiu.Clear;
  cbAprobado.Checked := False;
  cbNoAprobado.Checked := False;
  fraTrabajadorFiltro.Clear;
  fraCie10Filtro.Clear;
  edFechaCargaDesde.Clear;
  edFechaCargaHasta.Clear;
  cbNoInvestigado.Checked := False;
  fraPuestoFiltro.Clear;
  edFechaAgendadaDesde.Clear;
  edFechaAgendadaHasta.Clear;
  for i:=0 to cmbEstado.Items.Count-1 do
    cmbEstado.Checked[i] := True;
end;

end.
