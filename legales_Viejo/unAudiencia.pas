unit unAudiencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel,  Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, CustomDlgs,
  unArtDBAwareFrame, unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox,
  unfraJuzgados,unTestigoAudiencia, unDmPrincipal, unSesion, sqlFuncs,
  General,unEventoAudiencia, PatternEdit, IntEdit, Strfuncs, RxToolEdit,
  RxPlacemnt;

type
  TfrmAudiencia = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraJuicio: TfraCodigoDescripcion;
    Label2: TLabel;
    lbDemandante: TLabel;
    fraDatosJuzgado: TfraJuzgados;
    Label3: TLabel;
    lbEstudio: TLabel;
    Label4: TLabel;
    fraTipoAudiencia: TfraCodigoDescripcion;
    Label5: TLabel;
    Label6: TLabel;
    edFechaAudiencia: TDateComboBox;
    edHora: TDateTimePicker;
    Label7: TLabel;
    fraPInternoAsig: TfraCodigoDescripcion;
    edObservacion: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    gbPericias: TGroupBox;
    cbPC: TCheckBox;
    cbPM: TCheckBox;
    cbPAS: TCheckBox;
    cbPP: TCheckBox;
    cbPT: TCheckBox;
    cbPO: TCheckBox;
    PageControl: TPageControl;
    tbEventos: TTabSheet;
    tbTestigos: TTabSheet;
    cbEventos: TCoolBar;
    tbrEventos: TToolBar;
    tbNuevoEvento: TToolButton;
    tbModificarEvento: TToolButton;
    tbEliminarEvento: TToolButton;
    dbgEventos: TRxDBGrid;
    cbTestigos: TCoolBar;
    tbrTestigos: TToolBar;
    tbNuevoTestigo: TToolButton;
    ToolButton7: TToolButton;
    tbEliminarTestigo: TToolButton;
    Label10: TLabel;
    edObservacionTestigo: TMemo;
    dbgTestigos: TRxDBGrid;
    btNotificarAudiencia: TButton;
    dsTestigo: TDataSource;
    sdqEvento: TSDQuery;
    dsEvento: TDataSource;
    sdqTestigo: TSDQuery;
    ShortCutControl1: TShortCutControl;
    edFechaNotificacion: TDateComboBox;
    tbMail: TToolButton;
    fraJuicioFiltro: TfraCodigoDescripcion;
    Label11: TLabel;
    btnCerrar: TButton;
    Label12: TLabel;
    edFechaAudienciaDesdeFiltro: TDateComboBox;
    edHoraDesdeFiltro: TDateTimePicker;
    Label13: TLabel;
    fraPInternoAsigFiltro: TfraCodigoDescripcion;
    Label14: TLabel;
    fraEstudioFiltro: TfraCodigoDescripcion;
    Label15: TLabel;
    fraDatosJuzgadoFiltro: TfraJuzgados;
    Label16: TLabel;
    edFechaCargaFiltro: TDateComboBox;
    fraAnalista: TfraCodigoDescripcion;
    Label17: TLabel;
    fraAnalistaFiltro: TfraCodigoDescripcion;
    Label18: TLabel;
    fraTipoAudienciaFiltro: TfraCodigoDescripcion;
    Label19: TLabel;
    Label20: TLabel;
    lbHasta: TLabel;
    edFechaAudienciaHastaFiltro: TDateComboBox;
    Label21: TLabel;
    Label22: TLabel;
    edHoraHastaFiltro: TDateTimePicker;
    edNroAudiencia: TIntEdit;
    lblCarpeta: TLabel;
    Label23: TLabel;
    edSiniestros: TEdit;
    tbEdicionAbogado: TToolBar;
    tbNuevoAbogado: TToolButton;
    sdqModificacionRegistro: TSDQuery;
    sdqConsultaRegistro: TSDQuery;
    ToolButton1: TToolButton;
    procedure tbNuevoTestigoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraJuicioChange(Sender: TObject);
    procedure tbNuevoEventoClick(Sender: TObject);
    procedure tbModificarEventoClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure dbgTestigosDblClick(Sender: TObject);
    procedure dbgEventosDblClick(Sender: TObject);
    procedure tbEliminarEventoClick(Sender: TObject);
    procedure tbEliminarTestigoClick(Sender: TObject);
    procedure dbgEventosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgTestigosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btNotificarAudienciaClick(Sender: TObject);
    procedure tbMailClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraDatosJuzgadobtnMasDatosJuzgadoClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure tbNuevoAbogadoClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);

  private
    { Private declarations }
    FIDAudiencia : Integer;
  public
    procedure ModoVista (idJuicio : Integer);
    { Public declarations }
  protected
    function DoABM: Boolean;override;
    function Validar: Boolean;override;
    procedure ClearControls;override;
    procedure LoadControls;override;
  end;

var
  frmAudiencia: TfrmAudiencia;

implementation

uses
  DateTimeFuncs, unCustomConsulta, Math, VclExtra, AnsiSql, unConstLegales,
  unPrincipal, DBSql, unMoldeEnvioMail, unABMSeguimientoJuiciosParteDemandada, SDCommon,
  unABMSeguimientoJuicios;

{$R *.dfm}



procedure TfrmAudiencia.ClearControls;
begin
  edNroAudiencia.Clear;
  fraJuicio.Clear;
  lbDemandante.Caption := '';
  lbEstudio.Caption := '';
  fraDatosJuzgado.Limpiar;
  fraAnalista.Clear;
  fraTipoAudiencia.Clear;
  edFechaNotificacion.Clear;
  edFechaAudiencia.Clear;
  edHora.Time := StrToTime('00:00:00');
  fraPInternoAsig.Clear;
  edObservacion.Clear;
  cbPC.Checked := False;
  cbPM.Checked := False;
  cbPAS.Checked := False;
  cbPP.Checked := False;
  cbPT.Checked := False;
  cbPO.Checked := False;
  edObservacionTestigo.Clear;
  if ModoABM = maAlta then
  begin
    vclExtra.LockControls([tbrEventos,tbrTestigos,btNotificarAudiencia],True);
    sdqEvento.ParamByName('idaud').AsInteger := 0;
    sdqTestigo.ParamByName('idaud').AsInteger := 0;
    fraJuicioChange(nil);
    sdqEvento.Refresh;
    sdqTestigo.Refresh;
  end
  else
    vclExtra.LockControls([tbrEventos,tbrTestigos,btNotificarAudiencia],False);
  PageControl.ActivePageIndex := 0;
  BeginTrans(True);
end;


function TfrmAudiencia.DoABM: Boolean;
var
  observacion : TStrings;
  NroAudiencia : Integer;
  textoareemplazar : String;
begin
   Observacion := TStringList.Create;
   NroAudiencia := 0;
   try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      FIDAudiencia := sdqConsulta.FieldByName('AU_ID').AsInteger;
      Sql.Fields.Add('AU_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('AU_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('AU_IDJUICIO', fraJuicio.Value );
      Sql.Fields.Add('AU_IDTIPOAUDIENCIA', fraTipoAudiencia.Codigo );
      Sql.Fields.Add('AU_IDANALISTA', fraAnalista.Value );
      Sql.Fields.Add('AU_FECHAAUDIENCIA', edFechaAudiencia.Date );
      Sql.Fields.Add('AU_FECHANOTIFICACION', edFechaNotificacion.Date );
      Sql.Fields.Add('AU_HORA', FormatDateTime('HH:NN',edHora.Time) );
      Sql.Fields.AddInteger('AU_IDPERSONAINTERNA', fraPInternoAsig.Value, True  );
      Sql.Fields.Add('AU_OBSERVACION', edObservacion.Text );
      Sql.Fields.Add('AU_OBSERVACIONTESTIGO', edObservacionTestigo.Text );
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        FIDAudiencia := GetSecNextVal('LEGALES.SEQ_LAU_ID');
        Sql.Fields.Add('AU_USUALTA', Sesion.UserID );
        Sql.Fields.Add('AU_FECHAALTA', exDateTime );
        NroAudiencia := ValorSqlInteger(
                       'SELECT MAX(NVL(au_nroaudiencia,0))+1 FROM LEGALES.LAU_AUDIENCIA');
        Sql.Fields.Add('AU_NROAUDIENCIA', NroAudiencia);
      end else begin
        Sql.SqlType := stUpdate;
        Sql.Fields.Add('AU_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('AU_FECHAMODIF', exDateTime );
        Sql.Fields.Add('AU_USUBAJA', exNull );
        Sql.Fields.Add('AU_FECHABAJA', exNull );
      end;
    end;
    Sql.PrimaryKey.Add('AU_ID', FIDAudiencia);
    EjecutarSQLST(Sql.Sql);

    observacion.Text := '';

    if not (ModoABM = maBaja) then
    begin
      Observacion.Add('Fecha Audiencia: '+edFechaAudiencia.Text+'       Hora Audiencia: '+TimeToStr(edHora.Time));
      Observacion.Add('Tipo Audiencia: '+fraTipoAudiencia.Descripcion);

      with GetQuery(
        'SELECT ta_descripcion, ae_fecha,AE_MONTOANEGOCIAR,DECODE(NVL(LENGTH(ae_respuesta), 0), 0, ''NO'', ''SI'') AS respuesta '+
        '  FROM legales.lae_audienciaevento, legales.lta_tipoeventoaudiencia '+
        ' WHERE ae_idtipoevento = ta_id '+
        '   AND ae_idaudiencia = '+SqlValue(FIDAudiencia)) do
      try
        while not Eof do
        begin
          observacion.Add('Evento: '+FieldByName('ta_descripcion').AsString+
                          '    Fecha: '+FieldByName('ae_fecha').AsString +
                          '    Monto a Negociar: '+FieldByName('AE_MONTOANEGOCIAR').AsString+
                          '    Respuesta: '+FieldByName('respuesta').AsString);
          Next;
        end;
      finally
        Free;
      end;

      if not ExisteSql(
        'SELECT 1 '+
        '  FROM legales.let_eventojuicioentramite '+
        ' WHERE et_idjuicioentramite = '+SqlValue(fraJuicio.Value)+
        '   AND et_idtipoevento = 681'+
        '   AND ET_IDAUDIENCIA = '+SqlValue(FIDAudiencia)+
        '   AND et_fechaevento = '+SqlValue(edFechaAudiencia.Date)) then
        EjecutarSqlST(
          'INSERT INTO legales.let_eventojuicioentramite '+
          '    (et_id, et_fechaevento, et_idjuicioentramite, et_idtipoevento, '+
          '     et_usualta, et_fechaalta,ET_IDAUDIENCIA) '+
          '     VALUES (legales.seq_let_id.NEXTVAL, '+
          SqlDateTime(edFechaAudiencia.Date)+','+SqlValue(fraJuicio.Value)+',681,'+SqlValue(Sesion.UserID)+
          ', SYSDATE,'+SqlValue(FIDAudiencia)+')')
      else
        EjecutarSqlST('UPDATE legales.let_eventojuicioentramite' +
                      '   SET et_fechabaja = NULL, '+
                      '       et_usubaja = NULL, '+
                      '       et_fechamodif = sysdate, ' +
                      '       et_usumodif = '+SqlValue(Sesion.LoginName)+
                      ' WHERE et_idjuicioentramite = '+SqlValue(fraJuicio.Value)+
                      '   AND ET_IDAUDIENCIA = '+SqlValue(FIDAudiencia)+
                      '   AND et_idtipoevento = 681'+
                      '   AND et_fechaevento = '+SqlValue(edFechaAudiencia.Date));

      textoareemplazar := observacion.Text;
      textoareemplazar := StringReplace( textoareemplazar,'<','',[rfReplaceAll, rfIgnoreCase]);
      textoareemplazar := StringReplace( textoareemplazar,'>','',[rfReplaceAll, rfIgnoreCase]);
      observacion.Text := textoareemplazar;

      SaveBlob('SELECT et_observaciones ' +
              '   FROM legales.let_eventojuicioentramite ' +
              '  WHERE et_idjuicioentramite = '+SqlValue(fraJuicio.Value)+
              '    AND et_idtipoevento = 681'+
              '   AND ET_IDAUDIENCIA = '+SqlValue(FIDAudiencia)+
              '    AND et_fechaevento = '+SqlValue(edFechaAudiencia.Date),
              'UPDATE legales.let_eventojuicioentramite' +
              '   SET et_observaciones = :et_observaciones ' +
              ' WHERE et_idjuicioentramite = '+SqlValue(fraJuicio.Value)+
              '   AND ET_IDAUDIENCIA = '+SqlValue(FIDAudiencia)+
              '   AND et_idtipoevento = 681'+
              '   AND et_fechaevento = '+SqlValue(edFechaAudiencia.Date),
             'et_observaciones', observacion);
    end
    else
      EjecutarSqlST('UPDATE legales.let_eventojuicioentramite' +
      '   SET et_fechabaja = sysdate, ' +
      '       et_usubaja = '+SqlValue(Sesion.LoginName)+
      ' WHERE et_idjuicioentramite = '+SqlValue(fraJuicio.Value)+
      '   AND ET_IDAUDIENCIA = '+SqlValue(FIDAudiencia)+
      '   AND et_idtipoevento = 681'+
      '   AND et_fechaevento = '+SqlValue(edFechaAudiencia.Date));

    if ModoABM = maAlta then
    begin
      ModoABM := maModificacion;
      Result := False;
      vclExtra.LockControls([tbrEventos,tbrTestigos,btNotificarAudiencia],False);
      sdqEvento.ParamByName('idaud').AsInteger := FIDAudiencia;
      sdqTestigo.ParamByName('idaud').AsInteger := FIDAudiencia;
      sdqEvento.Refresh;
      sdqTestigo.Refresh;
      MessageDlg('Se generó la Audiencia Nº ' + Inttostr(NroAudiencia), mtInformation, [mbOK], 0);
    end
    else
      Result := True;

    CommitTrans(True);
    observacion.Free;
  except
    on E: Exception do begin
      Rollback(True);
      ErrorMsg( E );                                  // Muestra el mensaje de error.
      Result := False;
      observacion.Free;
    end;
  end;
end;

procedure TfrmAudiencia.LoadControls;
begin
  ClearControls;
  edNroAudiencia.Value        := sdqConsulta.FieldByName('AU_NROAUDIENCIA').AsInteger;
  fraJuicio.Value             := sdqConsulta.FieldByName('AU_IDJUICIO').AsInteger;
  fraTipoAudiencia.Codigo     := sdqConsulta.FieldByName('AU_IDTIPOAUDIENCIA').AsString;
  fraAnalista.Value           := sdqConsulta.FieldByName('AU_IDANALISTA').AsInteger;
  edFechaAudiencia.Date       := sdqConsulta.FieldByName('AU_FECHAAUDIENCIA').AsDateTime;
  edFechaNotificacion.Date    := sdqConsulta.FieldByName('AU_FECHANOTIFICACION').AsDateTime;
  edHora.Time                 := StrToTime(sdqConsulta.FieldByName('AU_HORA').AsString);
  fraPInternoAsig.Value       := sdqConsulta.FieldByName('AU_IDPERSONAINTERNA').AsInteger;
  edObservacion.Text          := sdqConsulta.FieldByName('AU_OBSERVACION').AsString;
  edObservacionTestigo.Text   := sdqConsulta.FieldByName('AU_OBSERVACIONTESTIGO').AsString;
  FIDAudiencia := sdqConsulta.FieldByName('AU_ID').AsInteger;
  sdqEvento.ParamByName('idaud').AsInteger := sdqConsulta.FieldByName('AU_ID').AsInteger;
  sdqTestigo.ParamByName('idaud').AsInteger := sdqConsulta.FieldByName('AU_ID').AsInteger;
  fraJuicioChange(nil);
  sdqEvento.Refresh;
  sdqTestigo.Refresh;
end;

procedure TfrmAudiencia.tbNuevoTestigoClick(Sender: TObject);
begin
  with TfrmTestigoAudiencia.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    Clear;
    idAudiencia:= FIDAudiencia;
    ShowModal;
  end;
  sdqTestigo.Refresh;
end;

function TfrmAudiencia.Validar: Boolean;
begin
  Verificar(not fraJuicio.IsSelected, fraJuicio,'Se debe Completar el juicio.');
  Verificar(not fraTipoAudiencia.IsSelected, fraTipoAudiencia,'Se debe Completar el tipo de audiencia.');
  Verificar(not fraAnalista.IsSelected, fraAnalista,'Se debe Completar el Analista.');
  Verificar(edFechaAudiencia.Date = 0, edFechaAudiencia,'Se debe Completar la fecha de audiencia.');
  Verificar(edFechaNotificacion.Date = 0, edFechaNotificacion,'Se debe Completar la fecha de notificación.');
  Verificar(TimeToStr(edHora.Time) = '0:00:00', edHora,'Se debe Completar la hora.');
  Result := true;
end;

procedure TfrmAudiencia.btnCancelarClick(Sender: TObject);
begin
  Rollback(True);
  inherited;
end;

procedure TfrmAudiencia.FormCreate(Sender: TObject);
begin
  inherited;
  with fraJuicio do
  begin
    TableName   := 'legales.ljt_juicioentramite';
    FieldID     := 'jt_id';
    FieldCodigo := 'jt_numerocarpeta';
    FieldDesc   := 'jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula';
    FieldBaja   := 'jt_fechabaja';
    Showbajas   := false;
    ExtraCondition := ' AND jt_estadomediacion = ''J'' ';
    OnChange    := fraJuicioChange;
  end;
  with fraEstudioFiltro do
  begin
    TableName   := 'legales.lbo_abogado';
    FieldID     := 'bo_id';
    FieldCodigo := 'bo_id';
    FieldDesc   := 'bo_nombre';
    FieldBaja   := 'bo_fechabaja';
    ShowBajas   := True;
  end;
  with fraJuicioFiltro do
  begin
    TableName   := 'legales.ljt_juicioentramite';
    FieldID     := 'jt_id';
    FieldCodigo := 'jt_numerocarpeta';
    FieldDesc   := 'jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula';
    FieldBaja   := 'jt_fechabaja';
    Showbajas   := false;
    ExtraCondition := ' AND jt_estadomediacion = ''J'' ';
    OnChange    := fraJuicioChange;
  end;
  with fraTipoAudiencia do
  begin
    TableName   := 'legales.lta_tipoaudiencia';
    FieldID     := 'ta_id';
    FieldCodigo := 'ta_id';
    FieldDesc   := 'ta_descripcion';
    FieldBaja   := 'ta_fechabaja';
    Showbajas   := True;
  end;
  with fraTipoAudienciaFiltro do
  begin
    TableName   := 'legales.lta_tipoaudiencia';
    FieldID     := 'ta_id';
    FieldCodigo := 'ta_id';
    FieldDesc   := 'ta_descripcion';
    FieldBaja   := 'ta_fechabaja';
    Showbajas   := True;
  end;
  with fraPInternoAsig do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' ';
    Showbajas   := False;
  end;
  with fraPInternoAsigFiltro do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' ';
    Showbajas   := False;
  end;
  with fraAnalistaFiltro do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' AND se_sector = ''LEGAL'' ';
    Showbajas   := False;
  end;
  with fraAnalista do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' AND se_sector = ''LEGAL'' ';
    Showbajas   := False;
  end;


  fraDatosJuzgado.Init(PERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);
  fraDatosJuzgadoFiltro.Init(PERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);

  Sql.TableName := 'LEGALES.LAU_AUDIENCIA';
  FieldBaja := 'AU_USUBAJA';
  sdqEvento.ParamByName('idaud').AsInteger := 0;
  sdqTestigo.ParamByName('idaud').AsInteger := 0;
  sdqEvento.Open;
  sdqTestigo.Open;
  vclExtra.LockControls([fraDatosJuzgado.fraJurisdiccion,fraDatosJuzgado.fraFuero,
                         fraDatosJuzgado.fraJuzgado,fraDatosJuzgado.fraSecretaria,
                         fraDatosJuzgado.btnInstanciasAnteriores,fraDatosJuzgado.edNroExpediente,
                         fraDatosJuzgado.edAnioExpediente,fraDatosJuzgado.cbSinExpediente,
                         fraDatosJuzgado.dteFechaIngreso,gbPericias],True);

end;

procedure TfrmAudiencia.fraJuicioChange(Sender: TObject);
var
  sSql : String;
begin

  sSql :=
    ' SELECT (SELECT bo_nombre '+
    '           FROM legales.lbo_abogado'+
    '          WHERE bo_id = jt_idabogado ) AS estudio, '+
    '        jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula AS caratula, '+
    '        jt_idjurisdiccion, jt_idfuero, jt_idjuzgado, jt_idsecretaria, jt_expediente, '+
    '        jt_nroexpediente, jt_anioexpediente, jt_sinexpediente, jt_fechaingreso, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id'+
    '            AND pj_idtipopericia = 3) AS pc, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id '+
    '            AND pj_idtipopericia = 1) AS pm, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id '+
    '            AND pj_idtipopericia = 6) AS pas, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id '+
    '            AND pj_idtipopericia = 2) AS pp, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id '+
    '            AND pj_idtipopericia = 4) AS pt, '+
    '        (SELECT DISTINCT ''S'' '+
    '           FROM legales.lpj_peritajejuicio '+
    '          WHERE pj_idjuicioentramite = jt_id '+
    '            AND pj_idtipopericia IN(5, 7)) AS po '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+ SqlValue(fraJuicio.Value);
  with GetQuery(sSql) do
  try
    lbDemandante.Caption := FieldByName('Caratula').AsString;
    fraDatosJuzgado.cbSinExpediente.Visible := True;
    fraDatosJuzgado.Cargar(FieldByName('jt_idjurisdiccion').AsInteger,
                           FieldByName('jt_idfuero').AsInteger,
                           FieldByName('jt_idjuzgado').AsInteger,
                           FieldByName('jt_idsecretaria').AsInteger);
    fraDatosJuzgado.Expediente := FieldByName('jt_expediente').AsString;
    fraDatosJuzgado.NroExpediente := FieldByName('jt_nroexpediente').AsString;
    fraDatosJuzgado.AnioExpediente := FieldByName('jt_anioexpediente').AsString;
    fraDatosJuzgado.SinExpediente := FieldByName('jt_sinexpediente').AsString = 'S';
    fraDatosJuzgado.FechaIngreso := FieldByName('jt_fechaingreso').AsDateTime;
    lbEstudio.Caption := FieldByName('estudio').AsString;
    cbPC.Checked  := FieldByName('PC').AsString = 'S';
    cbPM.Checked  := FieldByName('PM').AsString = 'S';
    cbPAS.Checked := FieldByName('PAS').AsString = 'S';
    cbPP.Checked  := FieldByName('PP').AsString = 'S';
    cbPT.Checked  := FieldByName('PT').AsString = 'S';
    cbPO.Checked  := FieldByName('PO').AsString = 'S';
  finally
    Free;
  end;

  edSiniestros.Clear;

  sSql :=
    ' SELECT ex_siniestro, ex_orden, ex_recaida '+
    '   FROM legales.ljt_juicioentramite, legales.lod_origendemanda, '+
    '        legales.lsj_siniestrosjuicioentramite, art.sex_expedientes '+
    '  WHERE od_idjuicioentramite = jt_id '+
    '    AND sj_idorigendemanda = od_id '+
    '    AND sj_idsiniestro = ex_id '+
    '    AND jt_id = '+SqlValue(fraJuicio.Value);
  with GetQuery(sSql) do
  try
    if edSiniestros.Text = '' then
      edSiniestros.Text := FieldByName('ex_siniestro').AsString+'/'+
                           FieldByName('ex_orden').AsString+'/'+
                           FieldByName('ex_recaida').AsString
    else
      edSiniestros.Text := edSiniestros.Text+' - '+FieldByName('ex_siniestro').AsString+'/'+
                           FieldByName('ex_orden').AsString+'/'+
                           FieldByName('ex_recaida').AsString;
  finally
    Free;
  end;

  vclExtra.LockControls([fraDatosJuzgado.edNroExpediente,fraDatosJuzgado.edAnioExpediente],True);
end;

procedure TfrmAudiencia.tbNuevoEventoClick(Sender: TObject);
begin
  with TfrmEventoAudiencia.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    ModoForm := mfAlta;
    idAudiencia:= FIDAudiencia;
    ModoNotificacion(False);
    ShowModal;
  end;
  sdqEvento.Refresh;
end;

procedure TfrmAudiencia.tbModificarEventoClick(Sender: TObject);
begin
  with TfrmEventoAudiencia.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    ModoForm := mfModificacion;
    LoadControls(sdqEvento.FieldByName('AE_ID').AsInteger);
    ModoNotificacion(sdqEvento.FieldByName('ta_tipo').AsString = 'N');
    if not(Self.btnAceptar.Visible) then
      ModoVista;
    ShowModal;
  end;
  sdqEvento.Refresh;

end;

procedure TfrmAudiencia.ToolButton7Click(Sender: TObject);
begin
  inherited;
  with TfrmTestigoAudiencia.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    CargarDatos(self.sdqTestigo.FieldByName('AT_ID').AsInteger);
    if not Self.btnAceptar.Visible then
      ModoVista;
    ShowModal;
  end;
  sdqTestigo.Refresh;
end;

procedure TfrmAudiencia.dbgTestigosDblClick(Sender: TObject);
begin
  inherited;
  ToolButton7Click(Sender);
end;

procedure TfrmAudiencia.dbgEventosDblClick(Sender: TObject);
begin
  inherited;
  tbModificarEventoClick(Sender);
end;

procedure TfrmAudiencia.tbEliminarEventoClick(Sender: TObject);
var Sql: TCustomSql;
begin
  //inherited;
  if msgask('Desea eliminar el evento?') then
  begin
    Sql := TDBSql.Create;
    Sql.TableName := 'legales.lae_audienciaevento';
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('AE_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AE_FECHABAJA', exDateTime);
    Sql.PrimaryKey.Add('AE_ID', sdqEvento.FieldByName('AE_ID').AsInteger);
    TDBSql(Sql).ExecuteST;
  end;
  sdqEvento.Refresh;
end;

procedure TfrmAudiencia.tbEliminarTestigoClick(Sender: TObject);
var Sql: TCustomSql;
begin
  //inherited;
  if msgask('Desea eliminar el testigo?') then
  begin
    Sql := TDBSql.Create;
    Sql.TableName := 'legales.lat_audienciatestigo';
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('AT_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AT_FECHABAJA', exDateTime);
    Sql.PrimaryKey.Add('AT_ID', sdqTestigo.FieldByName('AT_ID').AsInteger);
    TDBSql(Sql).ExecuteST;
  end;
  sdqTestigo.Refresh;
end;


procedure TfrmAudiencia.dbgEventosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not Field.DataSet.FieldByName('ae_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmAudiencia.dbgTestigosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not Field.DataSet.FieldByName('at_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmAudiencia.btNotificarAudienciaClick(Sender: TObject);
var
  mail,mailPInterno, mailEstudio: String; //MailTestigos
  Body, siniestro, fechasiniestro : String;
  infoemail : TResultadoEnvio;
begin
  inherited;
  {Body := ValorSql(
    ' SELECT ae_instruccion '+
    '   FROM legales.lae_audienciaevento a '+
    '  WHERE ae_id = (SELECT MAX(b.ae_id) '+
    '                   FROM legales.lae_audienciaevento b '+
    '                  WHERE b.ae_idaudiencia = a.ae_idaudiencia '+
    '                    AND b.ae_fechabaja IS NULL '+
    '                    AND ae_idtipoevento = (SELECT MAX(ae_idtipoevento) '+
    '                                             FROM legales.lae_audienciaevento c '+
    '                                            WHERE c.ae_idaudiencia = b.ae_idaudiencia '+
    '                                              AND ae_idtipoevento IN(1, 2, 3))) '+
    '    AND ae_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger));
  }
  siniestro := '';
  fechasiniestro := '';
  with GetQuery('   SELECT DISTINCT ex_siniestro || ''/'' || ex_orden || ''/'' || '+
                '                   ex_recaida siniestro, ex_fechaaccidente '+
                '     FROM legales.ljt_juicioentramite, legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, '+
                '          art.sex_expedientes '+
                '    WHERE jt_id =  '+SqlValue(fraJuicio.Value)+
                '      AND jt_id = od_idjuicioentramite '+
                '      AND od_id = sj_idorigendemanda '+
                '      AND sj_idsiniestro = ex_id '+
                ' ORDER BY 1 ') do
  try
    while not Eof do
    begin
      if siniestro <> '' then
      begin
        siniestro := siniestro+','+FieldByName('siniestro').AsString;
        fechasiniestro := fechasiniestro+','+FieldByName('ex_fechaaccidente').AsString;
      end
      else
      begin
        siniestro := FieldByName('siniestro').AsString;
        fechasiniestro := FieldByName('ex_fechaaccidente').AsString;
      end;
      Next;
      if siniestro = '' then
      begin
        siniestro := '................';
        fechasiniestro := '................';
      end;

   	end;
  finally
    Free;
  end;

  {with GetQuery(
    ' SELECT se_mail '+
    '   FROM art.use_usuarios, legales.lat_audienciatestigo '+
    '  WHERE se_id = at_idusuario '+
    '    AND at_fechabaja IS NULL '+
    '    AND at_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger))do
  try
    MailTestigos := '';
    while not Eof do
    begin
      if MailTestigos <> '' then
        MailTestigos := MailTestigos+','+FieldByName('se_mail').AsString
      else
        MailTestigos := FieldByName('se_mail').AsString;
      Next;
   	end;
  finally
    Free;
  end;
  }

  mailPInterno := ValorSql('SELECT se_mail FROM art.use_usuarios WHERE se_usuario = '+SqlValue(fraPInternoAsig.Codigo));
  with GetQuery(
    'SELECT EA_EMAIL '+
    '  FROM legales.lea_emailabogado '+
    ' WHERE ea_fechabaja IS NULL '+
    '   AND ea_idabogado IN(SELECT jt_idabogado '+
    '                         FROM legales.ljt_juicioentramite '+
    '                        WHERE jt_numerocarpeta = '+SqlValue(fraJuicio.Codigo)+
    '                          AND jt_estadomediacion = ''J'' )')  do
  try
    while not Eof do
    begin
      if mailEstudio <> '' then
        mailEstudio := mailEstudio+','+FieldByName('EA_EMAIL').AsString
      else
        mailEstudio := FieldByName('EA_EMAIL').AsString;
      Next;
   	end;
  finally
    Free;
  end;

  with GetQuery('SELECT * FROM legales.ljt_juicioentramite , legales.lfu_fuero, legales.lju_jurisdiccion, legales.ljz_juzgado, legales.lbo_abogado '+
                ' WHERE jt_id = '+SqlValue(fraJuicio.Value)+' AND jt_idfuero = fu_id AND jt_idjuzgado = jz_id '+
                '   AND jt_idjurisdiccion = ju_id AND jt_idabogado = bo_id') do
  begin
    Body := 'JD N°: '+FieldByName('jt_numerocarpeta').AsString+' '+FieldByName('jt_demandante').AsString +' C/ '+FieldByName('jt_demandado').AsString+
            '.'+#13#10+'Expte Nº'+FieldByName('JT_NROEXPEDIENTE').AsString+'/'+FieldByName('JT_ANIOEXPEDIENTE').AsString+#13#10+
            FieldByName('FU_DESCRIPCION').AsString+' N°: '+FieldByName('JZ_DESCRIPCION').AsString+#13#10+
            FieldByName('JZ_DIRECCION').AsString+', de '+FieldByName('JU_DESCRIPCION').AsString+'.'+#13#10+#13#10+
            //'Mail Testigos: '+ MailTestigos +#13#10+#13#10+
            'Estudio: '+ lbEstudio.Caption+ ' - '+mailEstudio +#13#10+
            'Personal Interno: '+ fraPInternoAsig.Descripcion+ ' - '+mailPInterno +#13#10+#13#10+

            'Estimados/as:'+#13#10+#13#10+
            'En relación al juicio de referencia, tenemos fijada una AUDIENCIA DE '+fraTipoAudiencia.Descripcion+
            ', la cual se celebrará  el día '+edFechaAudiencia.Text+' a las '+FormatDateTime('hh:mm:ss', edHora.Time)+'hs.'+#13#10+#13#10+
            'Les pido que nos confirmen si es necesaria la asistencia personal de las partes. '+#13#10+#13#10+
            'El actor reclama por un accidente de laboral ocurrido el '+fechasiniestro+' , siniestro Nº '+siniestro+
            ' que fue denunciado en nuestra compañía en los términos de la ley 24557.'+#13#10+#13#10+

            'También recordar que la compañía no cubre rubros provenientes del  pedido de reparación '+
            'integral del C.C. '+#13#10+#13#10+

            'Sin perjuicio de eso, recuerden que no ofrecemos turnos médicos con los médicos de la compañía '+
            'ni expedimos certificados para el caso de llegar a un acuerdo. '+#13#10+#13#10+

            'Por lo tanto como la audiencia es conciliatoria las instrucciones que les enviamos es '+
            'pedir que se solo se sortee perito médico de oficio para en su caso hacer ofrecimiento '+
            'solo por el rubro incapacidad. Asimismo soliciten la suspensión de las demás pruebas. '+
            'Les recordamos también que cuando se produzcan las pruebas es necesario por un tema de '+
            'reservas a los fines contables contar en soporte papel: con la pericia contable y en su '+
            'con la respectiva impugnación y con la pericia médica y su respectiva impugnación. '+#13#10+#13#10+

            'Además con el resultado de esas pruebas les pedimos por favor que nos envíen un análisis '+
            'del riesgo judicial y  la opinión de vuestro Estudio en el sentido de la conveniencia o no '+
            'de arribar a un acuerdo según el pleito como mínimo tres días antes de la celebración de la '+
            'audiencia. '+#13#10+#13#10+

            'Además que nos mantengan informados sobre los pasos procesales relevantes del expediente. '+#13#10+#13#10+

            'Quedamos a vuestra entera disposición ante cualquier duda o aclaración.'+#13#10+#13#10+
            'Muchas gracias por vuestra colaboración.'+#13#10+#13#10+
            'Cordiales Saludos.'+#13#10+#13#10;
  end;


  if mailPInterno <> '' then
    mail := mailPInterno +','+mailEstudio
  else
    mail := mailEstudio;

  infoemail := EnviarMailBDWithResults(mail, 'AUDIENCIA DE CONCILIACION: '+fraJuicio.Descripcion, [oAlwaysShowDialog, oAutoFirma],Body,nil,0,tcDefault,False);

  if infoemail.EnvioOk then
  begin
    if not ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lae_audienciaevento '+
      '  WHERE ae_idaudiencia = '+SqlValue(FIDAudiencia)+
      '    AND ae_idtipoevento = 4 '+
      '    AND ae_fecha = art.actualdate') then
      EjecutarSqlST(
        'INSERT INTO legales.lae_audienciaevento '+
        '            (ae_id, ae_idtipoevento, ae_idaudiencia, ae_fecha, ae_usualta, ae_fechaalta, ae_idemail) '+
        '     VALUES (legales.seq_lae_audiencia_id.NEXTVAL, 4, '+SqlValue(FIDAudiencia) +
                   ' , art.actualdate, '+SqlValue(Sesion.UserID)+', SYSDATE,'+SqlValue(infoemail.MensajeId)+')')
    else
      EjecutarSqlST(
        'UPDATE legales.lae_audienciaevento '+
        '   SET ae_idemail = '+SqlValue(infoemail.MensajeId)+','+
        '       ae_usumodif = '+SqlValue(Sesion.UserID)+','+
        '       ae_fechamodif = sysdate '+
        ' WHERE ae_idaudiencia = '+SqlValue(FIDAudiencia)+
        '   AND ae_idtipoevento = 4 '+
        '   AND ae_fecha = art.actualdate');
    sdqEvento.Refresh;
  end;
end;

procedure TfrmAudiencia.tbMailClick(Sender: TObject);
var
  Mail : String; //, MailEstudio
  Body, Testigos : String;
  infoemail : TResultadoEnvio;
begin
  inherited;
  Verificar(sdqTestigo.IsEmpty,dbgTestigos, 'No hay testigos');
//  Verificar(not sdqTestigo.FieldByName('at_fechabaja').IsNull,dbgTestigos, 'El testigo esta dado de baja.');
  Testigos := '';
  with GetQuery(
    ' SELECT * '+
    '   FROM art.use_usuarios, legales.lat_audienciatestigo '+
    '  WHERE se_id = at_idusuario '+
    '    AND at_fechabaja IS NULL '+
    '    AND at_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger)) do
  try
    while not Eof do
    begin
      if Testigos <> '' then
        Testigos := Testigos+FieldByName('se_nombre').AsString+':'+FieldByName('AT_FECHAPRESENTACION').AsString+ ' a las '+
                    FieldByName('AT_HORAPRESENTACION').AsString+' hs.'+#13#10
      else
        Testigos := FieldByName('se_nombre').AsString+':'+FieldByName('AT_FECHAPRESENTACION').AsString+ ' a las '+
                    FieldByName('AT_HORAPRESENTACION').AsString+' hs.'+#13#10;
      Next;
   	end;
  finally
    Free;
  end;
 {
  MailEstudio := ValorSql('SELECT se_mail FROM art.use_usuarios WHERE se_usuario = '+SqlValue(fraPInternoAsig.Codigo));
  with GetQuery(
    'SELECT EA_EMAIL '+
    '  FROM legales.lea_emailabogado '+
    ' WHERE ea_fechabaja IS NULL '+
    '   AND ea_idabogado IN(SELECT jt_idabogado '+
    '                         FROM legales.ljt_juicioentramite '+
    '                        WHERE jt_numerocarpeta = '+SqlValue(fraJuicio.Codigo)+')')  do
  try
    while not Eof do
    begin
      if MailEstudio <> '' then
        MailEstudio := MailEstudio+','+FieldByName('EA_EMAIL').AsString
      else
        MailEstudio := FieldByName('EA_EMAIL').AsString;
      Next;
   	end;
  finally
    Free;
  end;
  }

  with GetQuery('SELECT * FROM legales.ljt_juicioentramite , legales.lfu_fuero, legales.lju_jurisdiccion, legales.ljz_juzgado, legales.lbo_abogado '+
                ' WHERE jt_id = '+SqlValue(fraJuicio.Value)+' AND jt_idfuero = fu_id AND jt_idjuzgado = jz_id '+
                '   AND jt_idjurisdiccion = ju_id AND jt_idabogado = bo_id') do
  begin
    Body := ' Estimados: '+#13#10#9+'Les comunico que han sido citados para prestar declaración testimonial en los autos caratulados: '+
            FieldByName('jt_demandante').AsString +' C/ '+FieldByName('jt_demandado').AsString+' '+FieldByName('jt_caratula').AsString+
            '. Expte Nº'+FieldByName('JT_NROEXPEDIENTE').AsString+'/'+FieldByName('JT_ANIOEXPEDIENTE').AsString+' que tramitan ante el '+
            FieldByName('FU_DESCRIPCION').AsString+' N°: '+FieldByName('JZ_DESCRIPCION').AsString+', sito en '+
            FieldByName('JZ_DIRECCION').AsString+',de '+FieldByName('JU_DESCRIPCION').AsString+'. Es por ello que les solicito que con anterioridad se comuniquen con el estudio '+
            FieldByName('BO_NOMBRE').AsString+', quien nos lee en copia, al teléfono '+FieldByName('BO_TELEFONO').AsString+
            '.'+//Mail del estudio :'+MailEstudio+#13#10+
            'Les paso a señalar las fechas en las que han sido convocados:'+#13#10+#13#10+ Testigos;
  end;
  Mail := '';
  with GetQuery(
    ' SELECT se_mail '+
    '   FROM art.use_usuarios, legales.lat_audienciatestigo '+
    '  WHERE se_id = at_idusuario '+
    '    AND at_fechabaja IS NULL '+
    '    AND at_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger))do
  try
    while not Eof do
    begin
      if Mail <> '' then
        Mail := Mail+','+FieldByName('se_mail').AsString
      else
        Mail := FieldByName('se_mail').AsString;
      Next;
   	end;
  finally
    Free;
  end;

  infoemail := EnviarMailBDWithResults(mail, 'AUDIENCIA DE TESTIMONIAL: '+fraJuicio.Descripcion, [oAlwaysShowDialog, oAutoFirma],Body,nil,0,tcDefault,False);

  if infoemail.EnvioOk then
  begin
    if not ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lae_audienciaevento '+
      '  WHERE ae_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger)+
      '    AND ae_idtipoevento = 5 '+
      '    AND ae_fecha = art.actualdate') then
      EjecutarSqlST(
        'INSERT INTO legales.lae_audienciaevento '+
        '            (ae_id, ae_idtipoevento, ae_idaudiencia, ae_fecha, ae_usualta, ae_fechaalta, ae_idemail) '+
        '     VALUES (legales.seq_lae_audiencia_id.NEXTVAL, 5, '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger) +
                   ' , art.actualdate, '+SqlValue(Sesion.UserID)+', SYSDATE,'+SqlValue(infoemail.MensajeId)+')')
    else
      EjecutarSqlST(
        'UPDATE legales.lae_audienciaevento '+
        '   SET ae_idemail = '+SqlValue(infoemail.MensajeId)+','+
        '       ae_usumodif = '+SqlValue(Sesion.UserID)+','+
        '       ae_fechamodif = sysdate '+
        ' WHERE ae_idaudiencia = '+SqlValue(sdqConsulta.FieldByName('AU_ID').AsInteger)+
        '   AND ae_idtipoevento = 5 '+
        '   AND ae_fecha = art.actualdate');
    sdqEvento.Refresh;
  end;
end;

procedure TfrmAudiencia.tbRefrescarClick(Sender: TObject);
var
  sSQL, sWhere : String;
begin
  sWhere := '';
  sSQL :=
    ' SELECT au_id, au_idjuicio, au_idtipoaudiencia, au_fechaaudiencia, au_fechanotificacion, au_hora, au_idpersonainterna, '+
    '        au_observacion, au_observaciontestigo, jt_numerocarpeta,au_idanalista,au_nroaudiencia,au_fechaalta,au_usualta, '+
    '        (SELECT bo_nombre '+
    '           FROM legales.lbo_abogado '+
    '          WHERE bo_id = jt_idabogado) AS estudio,AU_FECHABAJA, AU_USUBAJA, '+
    '        jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula AS caratula, jt_idjurisdiccion, jt_idfuero, jt_idjuzgado, '+
    '        jt_idsecretaria, jt_expediente, jt_nroexpediente, jt_anioexpediente, jt_sinexpediente,jt_fechaingreso, ta_descripcion, se_usuario, '+
    '        ju_descripcion, jz_descripcion, jz_direccion,fu_descripcion, sc_descripcion '+
    '   FROM art.use_usuarios, legales.ljt_juicioentramite, legales.lta_tipoaudiencia, legales.lau_audiencia, '+
    '        legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lfu_fuero, legales.lsc_secretaria '+
    '  WHERE au_idjuicio = jt_id '+
    '    AND au_idtipoaudiencia = ta_id '+
    '    AND jt_idjuzgado = jz_id(+) '+
    '    AND jt_idjurisdiccion = ju_id(+) '+
    '    AND au_idpersonainterna = se_id(+) '+
    '    AND jt_idfuero = fu_id(+) '+
    '    AND jt_idsecretaria = sc_id(+)';
  if fraJuicioFiltro.IsSelected then
    sWhere := sWhere + 'AND au_idjuicio = '+SqlValue(fraJuicioFiltro.Value);

  if fraEstudioFiltro.IsSelected then
    sWhere := sWhere + 'AND jt_idabogado = '+SqlValue(fraEstudioFiltro.Value);

  if fraPInternoAsigFiltro.IsSelected then
    sWhere := sWhere + 'AND au_idpersonainterna = '+SqlValue(fraPInternoAsigFiltro.Value);

  if fraAnalistaFiltro.IsSelected then
    sWhere := sWhere + 'AND AU_IDANALISTA = '+SqlValue(fraAnalistaFiltro.Value);

  If fraTipoAudienciaFiltro.IsSelected then
    sWhere := sWhere + 'AND au_idtipoaudiencia = '+SqlValue(fraTipoAudienciaFiltro.Value);

  if edFechaCargaFiltro.Date <> 0 then
    sWhere := sWhere + 'AND trunc(au_fechaalta) = '+SqlDate(edFechaCargaFiltro.Date);

  if (edFechaAudienciaDesdeFiltro.Date <> 0) and
     (edFechaAudienciaDesdeFiltro.Date = edFechaAudienciaHastaFiltro.Date) then
    sWhere := sWhere + 'AND AU_FECHAAUDIENCIA = '+SqlDate(edFechaAudienciaDesdeFiltro.Date)
  else
  begin
    if edFechaAudienciaDesdeFiltro.Date <> 0 then
      sWhere := sWhere + 'AND AU_FECHAAUDIENCIA >= '+SqlDate(edFechaAudienciaDesdeFiltro.Date);

    if edFechaAudienciaHastaFiltro.Date <> 0 then
      sWhere := sWhere + 'AND AU_FECHAAUDIENCIA <= '+SqlDate(edFechaAudienciaHastaFiltro.Date);
  end;

  if (FormatDateTime('HH:NN',edHoraDesdeFiltro.Time) <> '00:00') and
     (edHoraDesdeFiltro.Time = edHoraHastaFiltro.Time) then
    sWhere := sWhere + 'AND AU_HORA = '+SqlValue(FormatDateTime('HH:NN',edHoraDesdeFiltro.Time))
  else
  begin
    if FormatDateTime('HH:NN',edHoraDesdeFiltro.Time) <> '00:00' then
      sWhere := sWhere + 'AND AU_HORA >= '+SqlValue(FormatDateTime('HH:NN',edHoraDesdeFiltro.Time));

    if FormatDateTime('HH:NN',edHoraHastaFiltro.Time) <> '00:00' then
      sWhere := sWhere + 'AND AU_HORA <= '+SqlValue(FormatDateTime('HH:NN',edHoraHastaFiltro.Time));
  end;


  if fraDatosJuzgadoFiltro.fraJurisdiccion.IsSelected then
  begin
    sWhere := sWhere + 'AND JT_IDJURISDICCION = '+SqlValue(fraDatosJuzgadoFiltro.fraJurisdiccion.Value);
    if fraDatosJuzgadoFiltro.fraFuero.IsSelected then
    begin
      sWhere := sWhere + 'AND JT_IDFUERO = '+SqlValue(fraDatosJuzgadoFiltro.fraFuero.Value);
      if fraDatosJuzgadoFiltro.fraJuzgado.IsSelected then
      begin
        sWhere := sWhere + 'AND JT_IDJUZGADO = '+SqlValue(fraDatosJuzgadoFiltro.fraJuzgado.Value);
        if fraDatosJuzgadoFiltro.fraSecretaria.IsSelected then
          sWhere := sWhere + 'AND JT_IDSECRETARIA = '+SqlValue(fraDatosJuzgadoFiltro.fraSecretaria.Value);
      end;
    end;
  end;

  sdqConsulta.SQL.Text := sSQL+sWhere;
  sdqConsulta.SQL.Add(SortDialog.OrderBy);

  inherited;
  if (Assigned(Sender)) and (sdqConsulta.RecordCount = 1) and (tbModificar.Enabled) then
    tbModificarClick(nil);
end;

procedure TfrmAudiencia.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraJuicioFiltro.Clear;
  fraEstudioFiltro.Clear;
  fraPInternoAsigFiltro.Clear;
  fraAnalistaFiltro.Clear;
  fraTipoAudienciaFiltro.Clear;
  edFechaCargaFiltro.Clear;
  edFechaAudienciaDesdeFiltro.Clear;
  edFechaAudienciaHastaFiltro.Clear;
  edHoraDesdeFiltro.Time := StrToTime('00:00:00');
  edHoraHastaFiltro.Time := StrToTime('00:00:00');
  fraDatosJuzgadoFiltro.Limpiar;
end;

procedure TfrmAudiencia.ModoVista(idJuicio: Integer);
begin
  fraJuicioFiltro.Value := idJuicio;
  VclExtra.LockControls([fraJuicioFiltro, fraJuicio,fraAnalista,fraTipoAudiencia,edFechaNotificacion,edFechaAudiencia,
                        edHora,fraPInternoAsig,edObservacion,edObservacionTestigo]);
  tbNuevo.Visible := False;
  tbEliminar.Visible := False;
  tbLimpiar.Visible := False;
  btNotificarAudiencia.Visible := False;
  btnAceptar.Visible := False;
  btnCancelar.Visible := False;
  btnCerrar.Visible := True;
  tbNuevoEvento.Visible := False;
  tbEliminarEvento.Visible := False;
  tbNuevoTestigo.Visible := False;
  tbEliminarTestigo.Visible := False;
  tbMail.Visible := False;
  tbRefrescarClick(nil);

  if fraJuicioFiltro.ReadOnly and (tbModificar.Enabled) then
  begin
    if (sdqConsulta.RecordCount = 1) then
      tbModificarClick(nil)
    else if (sdqConsulta.RecordCount > 1) then
      ShowModal;

  end;
end;

procedure TfrmAudiencia.fraDatosJuzgadobtnMasDatosJuzgadoClick(
  Sender: TObject);
begin
  inherited;
  fraDatosJuzgado.btnMasDatosJuzgadoClick(Sender);

end;

procedure TfrmAudiencia.btnCerrarClick(Sender: TObject);
begin
  inherited;
  fpAbm.ModalResult := mrCancel;
  ModalResult := mrCancel;
end;

procedure TfrmAudiencia.tbNuevoAbogadoClick(Sender: TObject);
begin
  if fraJuicio.IsSelected then
  begin
    with TfrmAdminstracionJuicioParteDemandanda.Create(Self) do
    try
      sdqModificacionRegistro.ParamByName('jt_id').AsInteger := fraJuicio.Value;
      try
        sdqModificacionRegistro.Open;
        tbGuardar.Enabled := False;
        Modificacion(sdqModificacionRegistro);
        except
        on E : ESDEngineError do
        begin
          if E.NativeError = 54 then
          begin
            Rollback(true);
            MessageDlg('El registro está siendo utilizado por el usuario ' + GetInfoBloqueo(fraJuicio.Value, 'J') + '.' + #13#10 + 'Por esa razón no podrá guardar ningún cambio.', mtWarning, [mbOK], 0);
            sdqConsultaRegistro.ParamByName('jt_id').AsInteger := fraJuicio.Value;
            sdqConsultaRegistro.Open;
            tbGuardar.Enabled := False;
            ConsultarJuicio(sdqConsultaRegistro);
          end;
        end;
      end;
    finally
      sdqModificacionRegistro.Close;
      sdqConsultaRegistro.Close;
      sdqConsulta.Refresh;
      Free;
    end;
  end;
end;

procedure TfrmAudiencia.ToolButton1Click(Sender: TObject);
//var
 // observacion : TStrings;
 // idaud :integer;
 // queryexterno,queryinterno : TSDQuery;
begin
  inherited;
  EjecutarSql(' delete legales.lps_pagosumario where PS_ID in (9322)');
{  Observacion := TStringList.Create;
  queryexterno := GetQuery('SELECT * FROM legales.lau_audiencia, legales.lta_tipoaudiencia WHERE au_idtipoaudiencia = ta_id and au_fechabaja is null');
  try
    BeginTrans();

    while not queryexterno.Eof do
    begin
      observacion.Text := '';
      Observacion.Add('Fecha Audiencia: '+DateToStr(queryexterno.FieldByName('AU_FECHAAUDIENCIA').AsDateTime)+
                    '       Hora Audiencia: '+queryexterno.FieldByName('AU_HORA').AsString);
      Observacion.Add('Tipo Audiencia: '+queryexterno.FieldByName('TA_DESCRIPCION').AsString);
      idaud := queryexterno.FieldByName('AU_ID').AsInteger;


      queryinterno := GetQuery(
        'SELECT ta_descripcion, ae_fecha,AE_MONTOANEGOCIAR,DECODE(NVL(LENGTH(ae_respuesta), 0), 0, ''NO'', ''SI'') AS respuesta '+
        '  FROM legales.lae_audienciaevento, legales.lta_tipoeventoaudiencia '+
        ' WHERE ae_idtipoevento = ta_id '+
        '   AND ae_idaudiencia = '+SqlValue(idaud));

      while not queryinterno.Eof do
      begin
        observacion.Add('Evento: '+queryinterno.FieldByName('ta_descripcion').AsString+
                        '    Fecha: '+queryinterno.FieldByName('ae_fecha').AsString +
                        '    Monto a Negociar: '+queryinterno.FieldByName('AE_MONTOANEGOCIAR').AsString+
                        '    Respuesta: '+queryinterno.FieldByName('respuesta').AsString);
        queryinterno.Next;
      end;
      queryinterno.Free;

      SaveBlob('SELECT et_observaciones ' +
              '   FROM legales.let_eventojuicioentramite ' +
              '  WHERE et_idjuicioentramite = '+SqlValue(queryexterno.FieldByName('AU_IDJUICIO').AsInteger)+
              '    AND et_idtipoevento = 681'+
              '   AND ET_IDAUDIENCIA = '+SqlValue(queryexterno.FieldByName('AU_ID').AsInteger)+
              '    AND et_fechaevento = '+SqlDateTime(queryexterno.FieldByName('AU_FECHAAUDIENCIA').AsDateTime),
              'UPDATE legales.let_eventojuicioentramite' +
              '   SET et_observaciones = :et_observaciones ' +
              ' WHERE et_idjuicioentramite = '+SqlValue(queryexterno.FieldByName('AU_IDJUICIO').AsInteger)+
              '   AND ET_IDAUDIENCIA = '+SqlValue(queryexterno.FieldByName('AU_ID').AsInteger)+
              '   AND et_idtipoevento = 681'+
              '   AND et_fechaevento = '+SqlDateTime(queryexterno.FieldByName('AU_FECHAAUDIENCIA').AsDateTime),
             'et_observaciones', observacion);
      queryexterno.next;
    end;
  finally
    CommitTrans();
    queryexterno.Free;
    observacion.Free;
  end;
 }
end;

end.
