unit unCargaSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unFraActividad, Mask, ToolEdit, DateComboBox, HotKeyControl, IntEdit, unFraEmpresa, unfraCtbTablas, unArtDbFrame,
  ShortCutControl, unFraStaticCodigoDescripcion, unfraStaticActividad, unFraStaticCTB_TABLAS, unArtDBAwareFrame,
  artSeguridad;
  
type
  TfrmCargaSRT = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbEstablecimiento: TToolButton;
    tlbSolicitud: TToolButton;
    tlbNomina: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    grid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    ToolButton1: TToolButton;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    grbEmpresa: TGroupBox;
    lbCUIT: TLabel;
    edCUIT: TMaskEdit;
    lbRazonSocial: TLabel;
    edRazonSocial: TEdit;
    sdqCUIT: TSDQuery;
    lbART: TLabel;
    lbOperacion: TLabel;
    lbActividadUno: TLabel;
    lbActividadDos: TLabel;
    lbActividadTres: TLabel;
    fraIS_ACTIVIDAD1: TfraStaticActividad;
    fraIS_ACTIVIDAD2: TfraStaticActividad;
    fraIS_ACTIVIDAD3: TfraStaticActividad;
    tlbBaja: TToolButton;
    grbSolicitud: TGroupBox;
    edSA_FORMULARIO: TEdit;
    ShortCutControl: TShortCutControl;
    fraIS_ART: TfraStaticCodigoDescripcion;
    fraIS_OPERACION: TfraStaticCTB_TABLAS;
    fraIS_RESCISION: TfraStaticCTB_TABLAS;
    Label2: TLabel;
    lbContrato: TLabel;
    Label1: TLabel;
    edIS_CONTRATO: TIntEdit;
    edIS_NIVEL: TPatternEdit;
    lbIS_VIGENCIADESDE: TLabel;
    lbVigHasta: TLabel;
    edIS_VIGENCIADESDE: TDateComboBox;
    edIS_VIGENCIAHASTA: TDateComboBox;
    lbFRegularizacion: TLabel;
    lbFechaExtincion: TLabel;
    edIS_FECHAREGULARIZACION: TDateComboBox;
    edIS_FECHAEXTINCION: TDateComboBox;
    Seguridad: TSeguridad;
    tbSrt: TToolButton;
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edIS_VIGENCIADESDEExit(Sender: TObject);
    procedure edIS_FECHAEXTINCIONExit(Sender: TObject);
    procedure edIS_FECHAREGULARIZACIONExit(Sender: TObject);
    procedure edIS_VIGENCIAHASTAExit(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure gridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbEstablecimientoClick(Sender: TObject);
    procedure tlbSolicitudClick(Sender: TObject);
    procedure tlbNominaClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tbSrtClick(Sender: TObject);
  private
    FCancelarNuevo: Boolean;
    FIdFormulario: Integer;
    FIdSolicitud: Integer;

    function isValidar: Boolean;

    procedure CambioRescision(Sender: TObject);
    procedure CancelarAlta;
    procedure DoGuardarSRT;
  public
    procedure DoCargaIDSolicitud(aId: Integer);
  end;

var
  frmCargaSRT: TfrmCargaSRT;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, DateTimeFuncs, unCargaEstablecimiento,
  unCargaSolicitud, unCargaTrabajador, unRptSRT, VCLExtra, unAfiliaciones, unImportCryptoSRT, unSesion;

const
  SRT_ALTA        : String = 'Carga de S.R.T. [ALTA]';
  SRT_MODIFICACION: String = 'Carga de S.R.T. [MODIFICACION]';
  SRT_BAJA        : String = 'Carga de S.R.T. [BAJA]';

{$R *.DFM}

procedure TfrmCargaSRT.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaSRT.CancelarAlta;
begin
  tlbNuevo.ImageIndex := 6;
  tlbNuevo.Hint := 'Cancelar alta (Ctrl - N)';
  EnableControls([tlbBaja, tlbNomina, tlbSolicitud, tlbEstablecimiento, tlbImprimir], True);
  grid.SetFocus;
end;

procedure TfrmCargaSRT.tlbNuevoClick(Sender: TObject);
begin
  if FCancelarNuevo then
  begin
    CancelarAlta;
    sdqDatosAfterScroll(nil);
    FCancelarNuevo := False;
  end
  else
  begin
    tlbNuevo.ImageIndex := 8;
    tlbNuevo.Hint := 'Nuevo (Ctrl - N)';
    EnableControls([tlbBaja, tlbEstablecimiento, tlbSolicitud, tlbNomina, tlbImprimir], False);
    FCancelarNuevo := True;

    // Limpiar todo.
    fraIS_ART.Clear;
    edIS_CONTRATO.Clear;
    edIS_VIGENCIADESDE.Clear;
    edIS_VIGENCIAHASTA.Clear;
    fraIS_OPERACION.Clear;
    fraIS_RESCISION.Clear;
    edIS_NIVEL.Clear;
    fraIS_ACTIVIDAD1.Clear;
    fraIS_ACTIVIDAD2.Clear;
    fraIS_ACTIVIDAD3.Clear;
    edIS_FECHAEXTINCION.Clear;
    edIS_FECHAREGULARIZACION.Clear;
    Caption := SRT_ALTA;
    fraIS_ART.edCodigo.SetFocus;
  end;
end;

procedure TfrmCargaSRT.tlbGuardarClick(Sender: TObject);
begin
  if Caption = SRT_MODIFICACION then
    Verificar((not sdqDatos.Eof) and (sdqDatos.FieldByName('is_usubaja').AsString <> ''), Grid, 'Este registro se encuentra dado de baja.');

  // Control..
  if IsValidar then
    DoGuardarSRT;
end;

function TfrmCargaSRT.isValidar: Boolean;
begin
  Verificar(fraIS_ART.IsEmpty, fraIS_ART.edCodigo, 'La ART es obligatoria.');
  Verificar(edIS_CONTRATO.IsEmpty, edIS_CONTRATO, 'El Contrato es obligatorio.');
  Verificar(edIS_VIGENCIADESDE.IsEmpty, edIS_VIGENCIADESDE, 'La Vigencia Desde es obligatoria.');

  if not edIS_VIGENCIAHASTA.IsEmpty then
  begin
    Verificar(edIS_VIGENCIADESDE.IsEmpty, edIS_VIGENCIAHASTA, 'La fecha de vigencia desde no puede quedar en blanco.');
    Verificar(edIS_VIGENCIADESDE.Date >= edIS_VIGENCIAHASTA.Date, edIS_VIGENCIAHASTA, 'La fecha de vigencia hasta no puede ser menor igual a la fecha desde.');
  end;

  Verificar(fraIS_OPERACION.IsEmpty, fraIS_OPERACION.edCodigo, 'La Operación es obligatoria.');
  Verificar((fraIS_OPERACION.Value = '2') and fraIS_RESCISION.IsEmpty, fraIS_OPERACION.edCodigo, 'El tipo de rescisión es obligatorio si la operación es rescisión.');
  Verificar(edIS_NIVEL.Text = '', edIS_NIVEL, 'El nivel es obligatorio.');
  Verificar(fraIS_ACTIVIDAD1.IsEmpty, fraIS_ACTIVIDAD1.edCodigo, 'La Actividad es obligatoria.');
  Verificar((not edIS_FECHAREGULARIZACION.IsEmpty) and (edIS_FECHAEXTINCION.IsEmpty), edIS_FECHAEXTINCION, 'La fecha de Extinción debe ser cargada.');
  Verificar((not edIS_FECHAEXTINCION.IsEmpty) and (edIS_FECHAEXTINCION.Date <= StrToDate('01/07/1996')), edIS_FECHAEXTINCION, 'La fecha de Extinción debe ser posterior al 01/07/1996.');
  Verificar((not edIS_FECHAREGULARIZACION.IsEmpty) and (edIS_FECHAREGULARIZACION.Date <= StrToDate('01/07/1996')), edIS_FECHAREGULARIZACION, 'La fecha de Regularización debe ser posterior al 01/07/1996.');
  Verificar((not edIS_FECHAREGULARIZACION.IsEmpty) and (edIS_FECHAREGULARIZACION.Date <= edIS_FECHAEXTINCION.Date), edIS_FECHAREGULARIZACION, 'La fecha de Regularización debe ser posterior a al fecha de Extinción.');

  Result := True;
end;

procedure TfrmCargaSRT.DoGuardarSRT;
var
  aSqlTrans: TSql;
  iIdSrt: Integer;
begin
  aSqlTrans := TSQL.Create('ais_informacionsrt');

  with aSqlTrans do
  begin
    Fields.Add('is_idactividad1',        fraIS_ACTIVIDAD1.Value);
    Fields.Add('is_idactividad2',        fraIS_ACTIVIDAD2.Value);
    Fields.Add('is_idactividad3',        fraIS_ACTIVIDAD3.Value);
    Fields.Add('is_idart',               fraIS_ART.Value);
    Fields.Add('is_contrato',            edIS_CONTRATO.Text);
    Fields.Add('is_fechaextincion',      edIS_FECHAEXTINCION.Date);
    Fields.Add('is_fecharegularizacion', edIS_FECHAREGULARIZACION.Date);
    Fields.Add('is_idformulario',        FIdFormulario);
    Fields.Add('is_nivel',               edIS_NIVEL.Text);
    Fields.Add('is_operacion',           fraIS_OPERACION.Value);
    Fields.Add('is_rescision',           fraIS_RESCISION.Value);
    Fields.Add('is_vigenciadesde',       edIS_VIGENCIADESDE.Date);
    Fields.Add('is_vigenciahasta',       edIS_VIGENCIAHASTA.Date);

    if Caption = SRT_ALTA then
    begin
      iIdSrt := ValorSql('SELECT afi.seq_ais_id.NEXTVAL FROM DUAL');
      PrimaryKey.Add('is_id',     iIdSrt, False);
      Fields.Add('is_fechaalta', 'Actualdate', False);
      Fields.Add('is_usualta',    frmPrincipal.DBLogin.UserId);
      SqlType := stInsert;
    end
    else if Caption = SRT_MODIFICACION then
    begin
      PrimaryKey.Add('is_id',     sdqDatos.FieldByName('is_id').asInteger, False);
      Fields.Add('is_fechamodif', 'Actualdate', False);
      Fields.Add('is_usumodif',   frmPrincipal.DBLogin.UserId);
      SqlType := stUpdate;
    end;
  end;

  try
    BeginTrans;
    try
      EjecutarSQLST(aSqlTrans.Sql);
      ActualizarEstadoSolicitud(FIdSolicitud);
      CommitTrans;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      sdqDatos.Close;
      sdqDatos.Open;
    except
      raise;

      RollBack;
    end;
  finally
    aSqlTrans.Free;
  end;
end;

procedure TfrmCargaSRT.DoCargaIDSolicitud(aId: Integer);
begin
  FIdSolicitud := aId;
  sdqCUIT.ParamByName('sa_id').AsInteger := FIdSolicitud;
  sdqCUIT.Open;

  edCUIT.Text          := sdqCUIT.FieldByName('sa_cuit').AsString;
  edRazonSocial.Text   := sdqCUIT.FieldByName('sa_nombre').AsString;
  FIdFormulario        := sdqCUIT.FieldByName('sa_idformulario').AsInteger;
  edSA_FORMULARIO.Text := sdqCUIT.FieldByName('fo_formulario').AsString;
  sdqCUIT.Close;

  sdqDatos.ParamByName('is_idformulario').AsInteger := FIdFormulario;
  sdqDatos.Open;
  if sdqDatos.Eof then
    Caption := SRT_ALTA
  else
    Caption := SRT_MODIFICACION;
end;

procedure TfrmCargaSRT.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  with sdqDatos do
  begin
    fraIS_ACTIVIDAD1.Value        := FieldByName('is_idactividad1').AsInteger;
    fraIS_ACTIVIDAD2.Value        := FieldByName('is_idactividad2').AsInteger;
    fraIS_ACTIVIDAD3.Value        := FieldByName('is_idactividad3').AsInteger;
    fraIS_ART.Value               := FieldByName('is_idart').AsInteger;
    edIS_CONTRATO.Value           := FieldByName('is_contrato').AsInteger;
    edIS_FECHAEXTINCION.Date      := FieldByName('is_fechaextincion').AsDateTime;
    edIS_FECHAREGULARIZACION.Date := FieldByName('is_fecharegularizacion').AsDateTime;
    edIS_NIVEL.Text               := FieldByName('is_nivel').AsString;
    fraIS_OPERACION.Value         := FieldByName('is_operacion').AsString;
    fraIS_RESCISION.Value         := FieldByName('is_rescision').AsString;
    edIS_VIGENCIADESDE.Date       := FieldByName('is_vigenciadesde').AsDateTime;
    edIS_VIGENCIAHASTA.Date       := FieldByName('is_vigenciahasta').AsDateTime;
  end;

  Caption := SRT_MODIFICACION;
  if FCancelarNuevo then
  begin
    CancelarAlta;
    FCancelarNuevo := false;
  end;
  CambioRescision(nil);
end;

procedure TfrmCargaSRT.FormCreate(Sender: TObject);
begin
  inherited;

  FCancelarNuevo := False;

  fraIS_OPERACION.Clave := 'COPER';
  fraIS_OPERACION.OnChange := CambioRescision;
  fraIS_RESCISION.Clave := 'TRESC';

  fraIS_ART.TableName   := 'aar_art';
  fraIS_ART.FieldID     := 'ar_id';
  fraIS_ART.FieldCodigo := 'ar_id';
  fraIS_ART.FieldDesc   := 'ar_nombre';
  fraIS_ART.FieldBaja   := 'ar_fechabaja';
  CambioRescision(nil);
end;

procedure TfrmCargaSRT.edIS_VIGENCIADESDEExit(Sender: TObject);
begin
  Verificar((not edIS_VIGENCIADESDE.IsEmpty) and (edIS_VIGENCIADESDE.Date < StrToDate('01/07/1996')), edIS_VIGENCIADESDE, 'La Vigencia Desde debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRT.edIS_FECHAEXTINCIONExit(Sender: TObject);
begin
  Verificar((not edIS_FECHAEXTINCION.IsEmpty) and (edIS_FECHAEXTINCION.Date <= StrToDate('01/07/1996')), edIS_FECHAEXTINCION, 'La Fecha de Extinción debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRT.edIS_FECHAREGULARIZACIONExit(Sender: TObject);
begin
  Verificar((not edIS_FECHAREGULARIZACION.IsEmpty) and (edIS_FECHAREGULARIZACION.Date <= StrToDate('01/07/1996')), edIS_FECHAREGULARIZACION, 'La Fecha de Regulación debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRT.edIS_VIGENCIAHASTAExit(Sender: TObject);
begin
  if not edIS_VIGENCIAHASTA.IsEmpty then
  begin
    Verificar(edIS_VIGENCIADESDE.IsEmpty, edIS_VIGENCIAHASTA, 'La fecha de vigencia desde no puede quedar en blanco.');
    Verificar(edIS_VIGENCIADESDE.Date >= edIS_VIGENCIAHASTA.Date, edIS_VIGENCIAHASTA, 'La fecha de vigencia hasta no puede ser menor igual a la fecha desde.');
  end;
end;

procedure TfrmCargaSRT.tlbBajaClick(Sender: TObject);
begin
  Verificar(not sdqDatos.Eof and (sdqDatos.FieldByName('is_usubaja').AsString <> ''), tlbControl, 'Este registro se encuentra dado de baja.');

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSQL.Create('ais_informacionsrt') do
      try
        PrimaryKey.Add('is_id',     sdqDatos.fieldByName('is_id').asInteger, False);
        Fields.Add('is_fechabaja', 'Actualdate', False);
        Fields.Add('is_usubaja',    frmPrincipal.DBLogin.UserId);
        SqlType := stUpdate;

        EjecutarSQL(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

        sdqDatos.Close;
        sdqDatos.Open;
      finally
        Free;
      end;
end;

procedure TfrmCargaSRT.gridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                         Highlight: Boolean);
begin
  if sdqDatos.FieldByName('is_usubaja').AsString <> '' then
    AFont.Color:= clRed;
end;

procedure TfrmCargaSRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action      := caFree;
  frmCargaSRT := nil;
end;

procedure TfrmCargaSRT.tlbEstablecimientoClick(Sender: TObject);
begin
  try
    frmCargaEstablecimiento.Show;
  except
    frmCargaEstablecimiento := TfrmCargaEstablecimiento.Create(frmPrincipal);
  end;
  frmCargaEstablecimiento.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaSRT.tlbSolicitudClick(Sender: TObject);
begin
  frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
  frmCargaSolicitudes.Mostrar(True);
  frmCargaSolicitudes.DoCargaDatosSolicitud(FIdSolicitud);
end;

procedure TfrmCargaSRT.tlbNominaClick(Sender: TObject);
begin
  try
    frmCargaTrabajador.Show
  except
    frmCargaTrabajador := TfrmCargaTrabajador.Create(frmPrincipal);
  end;
  frmCargaTrabajador.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaSRT.tlbImprimirClick(Sender: TObject);
begin
  rptSRT := TrptSRT.Create(Self);
  try
    rptSRT.sdqReporte.ParamByName('is_idformulario').AsInteger := FIdFormulario;
    rptSRT.sdqReporte.Open;
    if not rptSRT.sdqReporte.Eof then
      rptSRT.Print
    else
      MessageDlg('No hay datos disponibles para la impresión.', mtError, [mbOK], 0);
  finally
    rptSRT.Free;
  end;
end;

procedure TfrmCargaSRT.CambioRescision(Sender: TObject);
begin
  LockControl(fraIS_RESCISION, fraIS_OPERACION.Locked or (not fraIS_OPERACION.IsSelected) or (fraIS_OPERACION.Value <> '2'));
  if (fraIS_OPERACION.Value <> '2') then
    fraIS_RESCISION.Clear;
end;

procedure TfrmCargaSRT.tbSrtClick(Sender: TObject);
var
  sSql: String;
  aSql: TSql;
  Vig : TCuilSRT;
  i : Integer;
  sRegularizacion : String;
  iOperacion, iIdArt, iCiiu : Integer;
begin
  Vig := ConsultarVigencia(SacarGuiones(edCUIT.Text));
  if Vig.Error = '' then
  begin
    BeginTrans;
    try
      // Doy de baja los registros anteriores para esa cotizacion..
      sSql :=
        'UPDATE ais_informacionsrt' +
          ' SET is_usubaja = :usubaja,' +
              ' is_fechabaja = SYSDATE' +
        ' WHERE is_idformulario = :idformulario';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, FIdFormulario]);

      // Inserto los registros recuperados de la SRT..

      for i := 0 to Length(Vig.Historial) -1  do
      begin

        sSql :=
            'SELECT tb_codigo' +
            ' FROM ctb_tablas' +
            ' WHERE tb_clave = ''COPER''' +
            ' AND UPPER(TRIM(art.utiles.reemplazar_acentos(tb_descripcion))) = UPPER(TRIM(art.utiles.reemplazar_acentos(:p1)))';
        with GetQueryEx(sSql, [Vig.Historial[i].OperacionHasta]) do
        try
          if not FieldByName('TB_CODIGO').IsNull then
            iOperacion  := FieldByName('TB_CODIGO').AsInteger
          else
            iOperacion := 1;
        finally
          Free;
        end;

        if Vig.Historial[i].Regularizacion = 'PAGO DE LA DEUDA' then
          sRegularizacion :=  '03' else
        if Vig.Historial[i].Regularizacion = 'POR EL TRANSCURSO DE UN AÑO' then
          sRegularizacion :=  '02' else
        if Vig.Historial[i].Regularizacion = 'CONTRATO EXTINGUIDO' then
          sRegularizacion :=  '01' else
        if Vig.Historial[i].Regularizacion = '' then
          sRegularizacion :=  '01';

        iIdArt := ValorSqlEx('SELECT ar_id FROM aar_art WHERE ar_codigosrt =:cod',[Vig.Historial[i].Aseguradora]);

        if Length(Vig.Historial[i].Ciiu) = 5 then                   //SRT no me manda los 0s no significativos.
          Vig.Historial[i].Ciiu := '0' + Vig.Historial[i].Ciiu;
        iCiiu  := ValorSqlEx('SELECT ac_id FROM cac_actividad WHERE ac_codigo =:ciiu AND ROWNUM < 2', [Vig.Historial[i].Ciiu]);
        aSql := TSql.Create('AIS_INFORMACIONSRT');
        try
          aSql.SqlType := stInsert;
          aSql.PrimaryKey.Add('IS_ID',           'afi.seq_ais_id.NEXTVAL', False);
          aSql.Fields.Add('IS_IDFORMULARIO',          FIdFormulario);
          aSql.Fields.Add('IS_CONTRATO',          Vig.Historial[i].Contrato);
          aSql.Fields.Add('IS_IDART',          iIdArt);
          aSql.Fields.Add('IS_VIGENCIADESDE', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionDesde,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_VIGENCIAHASTA', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionHasta,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_OPERACION',  iOperacion);
          aSql.Fields.Add('IS_NIVEL', Vig.Historial[i].Nivel);
          aSql.Fields.Add('IS_USUALTA', Sesion.UserID);
          aSql.Fields.Add('IS_FECHAALTA', SQL_DATETIME, False);
          aSql.Fields.Add('IS_IDACTIVIDAD1', iCiiu);
          aSql.Fields.Add('IS_FECHAEXTINCION', StrToDateDef(Copy(Vig.Historial[i].FechaExtincion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_FECHAREGULARIZACION', StrToDateDef(Copy(Vig.Historial[i].FechaRegularizacion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_RESCISION', sRegularizacion);

          EjecutarSqlSt(aSql.Sql);
        finally
          aSql.Free;
        end;
      end;
      CommitTrans;
      sdqDatos.Refresh;
      sdqDatos.First;
      if not(Sender = Nil) then  //no quiero que salga el mensaje si sale todo bien ya que esto es llamado desde Recepcion Solicitud
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    except
      raise;
      RollBack;
    end;
  end;
end;

end.
