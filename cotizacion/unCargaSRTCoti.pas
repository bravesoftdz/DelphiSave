unit unCargaSRTCoti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine,
  PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, HotKeyControl, IntEdit, unArtDbFrame, ShortCutControl,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unFraStaticCTB_TABLAS, unArtDBAwareFrame, ExtCtrls, FormPanel;

type
  TModoABMSRT = (maAltaSRT, maModificacionSRT, maNoneSRT, maConsultaSRT);
  TfrmCargaSRTCoti = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tblSeparador1: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    lbART: TLabel;
    lbOperacion: TLabel;
    Label1: TLabel;
    lbActividadUno: TLabel;
    lbActividadDos: TLabel;
    lbActividadTres: TLabel;
    fraSS_ACTIVIDAD1: TfraStaticActividad;
    fraSS_ACTIVIDAD2: TfraStaticActividad;
    fraSS_ACTIVIDAD3: TfraStaticActividad;
    edSS_NIVEL: TPatternEdit;
    tlbBaja: TToolButton;
    ShortCutControl: TShortCutControl;
    fraSS_ART: TfraStaticCodigoDescripcion;
    fraSS_OPERACION: TfraStaticCTB_TABLAS;
    gbVigencia: TGroupBox;
    lbSS_VIGENCIADESDE: TLabel;
    edSS_VIGENCIADESDE: TDateComboBox;
    lbVigHasta: TLabel;
    edSS_VIGENCIAHASTA: TDateComboBox;
    GroupBox1: TGroupBox;
    lbFRegularizacion: TLabel;
    edSS_FECHAREGULARIZACION: TDateComboBox;
    lbFechaExtincion: TLabel;
    edSS_FECHAEXTINCION: TDateComboBox;
    tlbModificar: TToolButton;
    Label2: TLabel;
    fraSS_RESCISION: TfraStaticCTB_TABLAS;
    chkEmpresaSRT: TCheckBox;
    tbObtenerHistorial: TToolButton;
    fpArt: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    Label3: TLabel;
    fraArtWeb: TfraStaticCodigoDescripcion;
    Label4: TLabel;
    edNombreWeb: TEdit;
    ToolButton1: TToolButton;
    tbSRT: TToolButton;
    fpOperacion: TFormPanel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    btnAceptarOP: TButton;
    btnCancelarOP: TButton;
    edLineaOperacionWeb: TEdit;
    fraOperacionWeb: TfraStaticCTB_TABLAS;
    Label7: TLabel;
    edNombreOperacionWeb: TComboBox;
    fpTipoOperacion: TFormPanel;
    Bevel3: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    btnAceptarTOP: TButton;
    btnCancelarTOP: TButton;
    edNombreTipoOperacionWeb: TEdit;
    fraTipoOperacionWeb: TfraStaticCTB_TABLAS;
    tbNavegarSRT: TToolButton;
    Label10: TLabel;
    lbFechaUltimaActualizacionSRT: TLabel;
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edSS_VIGENCIADESDEExit(Sender: TObject);
    procedure edSS_FECHAEXTINCIONExit(Sender: TObject);
    procedure edSS_FECHAREGULARIZACIONExit(Sender: TObject);
    procedure edSS_VIGENCIAHASTAExit(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbModificarClick(Sender: TObject);
    procedure chkEmpresaSRTClick(Sender: TObject);
    procedure tbObtenerHistorialClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAceptarOPClick(Sender: TObject);
    procedure edLineaOperacionWebExit(Sender: TObject);
    procedure btnAceptarTOPClick(Sender: TObject);
    procedure tbNavegarSRTClick(Sender: TObject);
    procedure tbSRTClick(Sender: TObject);
  private
    FCancelarNuevo: Boolean;
    FCuit: String;
    FHuboCambios: Boolean;
    FIdCotizacion: Integer;
    FLockForm: Boolean;
    FModoABM: TModoABMSRT;

    function GetEmpresaNueva: Boolean;
    function GetLockForm: Boolean;
    function GetStatusStr(const aCodigoOperacion: String): String;
    function IsValidar: Boolean;

    procedure ActualizarBotones(Cambiar: Boolean = False);
    procedure ActualizarFechaUltimaActualizacionSRT;
    procedure CambioRescision(Sender: TObject);
    procedure ClearControls;
    procedure ClipboardToDB;
    procedure DoGuardarSRT;
    procedure SetEmpresaNueva(const Value: Boolean);
    procedure SetLockForm(AValue: Boolean);
    procedure SetModoABM(const Value: TModoABMSRT);

    property ModoABM: TModoABMSRT read FModoABM write SetModoABM;
  public
    procedure Clear;
    procedure DoCargar(aIdCotizacion: Integer);
    procedure EliminarRegistrosSRT;
    procedure GuardarCambios;

    property Cuit: String          read fCuit           write fCuit;
    property EmpresaNueva: Boolean read GetEmpresaNueva write SetEmpresaNueva;
    property HuboCambios: Boolean  read FHuboCambios    write FHuboCambios;
    property LockForm: Boolean     read GetLockForm     write SetLockForm;
  end;

var
  frmCargaSRTCoti: TfrmCargaSRTCoti;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, DateTimeFuncs, VCLExtra, StrFuncs,
  ClipBrd, ShellApi, unImportFromSRT, unSesion, unImportCryptoSrt;

const
  SRT_ALTA        : String = 'Carga de S.R.T. [ALTA]';
  SRT_MODIFICACION: String = 'Carga de S.R.T. [MODIFICACION]';
  SRT_BAJA        : String = 'Carga de S.R.T. [BAJA]';

{$R *.DFM}

function TfrmCargaSRTCoti.GetLockForm: Boolean;
begin
  Result := FLockForm;
end;

procedure TfrmCargaSRTCoti.SetLockForm(AValue: Boolean);
begin
  if FLockForm <> AValue then
  begin
    FLockForm := AValue;
    if AValue then
      ModoABM := maConsultaSRT
    else
      ModoABM := maNoneSRT;
  end;
end;

procedure TfrmCargaSRTCoti.ClearControls;
begin
  fraSS_ART.Clear;
  edSS_VIGENCIADESDE.Clear;
  edSS_VIGENCIAHASTA.Clear;
  fraSS_OPERACION.Clear;
  fraSS_RESCISION.Clear;
  edSS_NIVEL.Clear;
  fraSS_ACTIVIDAD1.Clear;
  fraSS_ACTIVIDAD2.Clear;
  fraSS_ACTIVIDAD3.Clear;
  edSS_FECHAEXTINCION.Clear;
  edSS_FECHAREGULARIZACION.Clear;
end;

procedure TfrmCargaSRTCoti.Clear;
begin
  ClearControls;
  sdqDatos.Close;
end;

procedure TfrmCargaSRTCoti.tlbNuevoClick(Sender: TObject);
begin
  if ModoABM <> maAltaSRT then
    ModoABM := maAltaSRT
  else
    ModoABM := maConsultaSRT;
end;

procedure TfrmCargaSRTCoti.tlbGuardarClick(Sender: TObject);
begin
  if isValidar then
    DoGuardarSRT;
end;

function TfrmCargaSRTCoti.IsValidar: Boolean;
begin
  Verificar(fraSS_ART.IsEmpty, fraSS_ART.edCodigo, 'La ART es obligatoria.');
  Verificar(fraSS_OPERACION.IsEmpty, fraSS_OPERACION.edCodigo, 'La Operación es obligatoria.');
  Verificar((fraSS_OPERACION.Value = '2') and fraSS_RESCISION.IsEmpty, fraSS_OPERACION.edCodigo, 'El Tipo de Rescisión es obligatorio si la operación es rescisión.');
  Verificar(edSS_NIVEL.Text = '', edSS_NIVEL, 'El Nivel es obligatorio.');
  Verificar(fraSS_ACTIVIDAD1.IsEmpty, fraSS_ACTIVIDAD1.edCodigo, 'La Actividad es obligatoria.');
  Verificar(edSS_VIGENCIADESDE.IsEmpty, edSS_VIGENCIADESDE, 'La Vigencia Desde es obligatoria.');
  
  if not edSS_VIGENCIAHASTA.IsEmpty then
  begin
    Verificar(edSS_VIGENCIADESDE.IsEmpty, edSS_VIGENCIAHASTA, 'La Fecha de Vigencia Desde no puede quedar en blanco.');
    Verificar((edSS_VIGENCIADESDE.Date >= edSS_VIGENCIAHASTA.Date), edSS_VIGENCIAHASTA, 'La Fecha de Vigencia Hasta no puede ser menor igual a la fecha desde.');
  end;

  Verificar((not edSS_FECHAREGULARIZACION.IsEmpty) and (edSS_FECHAEXTINCION.IsEmpty), edSS_FECHAEXTINCION, 'La Fecha de Extinción debe ser cargada.');
  Verificar((not edSS_FECHAEXTINCION.IsEmpty) and (edSS_FECHAEXTINCION.Date <= StrToDate('01/07/1996')), edSS_FECHAEXTINCION, 'La Fecha de Extinción debe ser posterior al 01/07/1996.');
  Verificar((not edSS_FECHAREGULARIZACION.IsEmpty) and (edSS_FECHAREGULARIZACION.Date <= StrToDate('01/07/1996')), edSS_FECHAREGULARIZACION, 'La Fecha de Regularización debe ser posterior al 01/07/1996.');
  Verificar((not edSS_FECHAREGULARIZACION.IsEmpty) and (edSS_FECHAREGULARIZACION.Date <= edSS_FECHAEXTINCION.Date), edSS_FECHAREGULARIZACION, 'La Fecha de Regularización debe ser posterior a al fecha de Extinción.');

  Result := True;
end;

procedure TfrmCargaSRTCoti.DoGuardarSRT;
var
  aSqlTrans: TSql;
  iSRT_ID: Integer;
  sSql: String;
begin
  aSqlTrans := TSQL.Create('tss_solicitudsrt');
  //...
  aSqlTrans.Fields.Add('ss_idcotizacion',        FIdCotizacion);
  aSqlTrans.Fields.Add('ss_idart',               fraSS_ART.Value);
  aSqlTrans.Fields.Add('ss_idactividad1',        fraSS_ACTIVIDAD1.Value);
  aSqlTrans.Fields.Add('ss_idactividad2',        fraSS_ACTIVIDAD2.Value);
  aSqlTrans.Fields.Add('ss_idactividad3',        fraSS_ACTIVIDAD3.Value);
  aSqlTrans.Fields.Add('ss_fechaextincion',      edSS_FECHAEXTINCION.Date);
  aSqlTrans.Fields.Add('ss_fecharegularizacion', edSS_FECHAREGULARIZACION.Date);
  aSqlTrans.Fields.Add('ss_nivel',               edSS_NIVEL.Text);
  aSqlTrans.Fields.Add('ss_operacion',           fraSS_OPERACION.Value);
  aSqlTrans.Fields.Add('ss_rescision',           fraSS_RESCISION.Value);
  aSqlTrans.Fields.Add('ss_vigenciadesde',       edSS_VIGENCIADESDE.Date);
  aSqlTrans.Fields.Add('ss_vigenciahasta',       edSS_VIGENCIAHASTA.Date);
  if Caption = SRT_ALTA then
  begin
    iSRT_ID := ValorSql('SELECT afi.seq_ass_id.NEXTVAL FROM DUAL');
    aSqlTrans.PrimaryKey.Add('ss_id',     iSRT_ID, False);
    aSqlTrans.Fields.Add('ss_fechaalta', 'ACTUALDATE', False);
    aSqlTrans.Fields.Add('ss_usualta',    frmPrincipal.DBLogin.UserId);
    aSqlTrans.SqlType := stInsert;
  end
  else if Caption = SRT_MODIFICACION then
  begin
    aSqlTrans.PrimaryKey.Add('ss_id',     sdqDatos.FieldByName('ss_id').AsInteger, False);
    aSqlTrans.Fields.Add('ss_fechamodif', 'ACTUALDATE', False);
    aSqlTrans.Fields.Add('ss_usumodif',   frmPrincipal.DBLogin.UserId);
    aSqlTrans.SqlType := stUpdate;
  end;

  try
    BeginTrans;
    try
      EjecutarSQLST(aSqlTrans.Sql);

      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_statussrt = ' + SqlString(GetStatusStr(fraSS_OPERACION.Value), True, True) +
        ' WHERE co_id = :id';
      EjecutarSqlSTEx(sSql, [FIdCotizacion]);

      CommitTrans;
      HuboCambios := True;
      
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

procedure TfrmCargaSRTCoti.GuardarCambios;
var
  sSql: String;
begin
  //No usa el BeginTrans porque este se ejecutó en unAdminCotizacion
  if EmpresaNueva then
    EliminarRegistrosSRT
  else
  begin
    //Graba los registros agregados para la cotizacion dada
    //Borra los registros anteriores
    sSql :=
      'DELETE FROM ass_solicitudsrt' +
           ' WHERE ss_idcotizacion = :idcotizacion';
    EjecutarSqlSTEx(sSql, [FIdCotizacion]);

    //Genera los registros
    sSql :=
      'INSERT INTO ass_solicitudsrt' +
                 ' (ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion,' +
                  ' ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja,' +
                  ' ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision)' +
       ' (SELECT ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion,' +
               ' ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja,' +
               ' ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision' +
          ' FROM tss_solicitudsrt' +
         ' WHERE ss_idcotizacion = :idcotizacion)';
    EjecutarSqlSTEx(sSql, [FIdCotizacion]);
  end;
end;

procedure TfrmCargaSRTCoti.DoCargar(aIdCotizacion: Integer);
var
  sSql: String;
begin
  //ModoABM := maNoneSRT;
  FIdCotizacion := aIdCotizacion;
  HuboCambios := False;

  ActualizarFechaUltimaActualizacionSRT;

  BeginTrans;
  try
    //Borra los registros temporales anteriores
    sSql :=
      'DELETE FROM tss_solicitudsrt' +
           ' WHERE ss_idcotizacion = :idcotizacion';
    EjecutarSqlSTEx(sSql, [aIdCotizacion]);

    //Genera los registros temporales
    sSql :=
      'INSERT INTO tss_solicitudsrt' +
                 ' (ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion,' +
                  ' ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja,' +
                  ' ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision)' +
       ' (SELECT ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion,' +
               ' ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja,' +
               ' ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision' +
          ' FROM ass_solicitudsrt' +
         ' WHERE ss_idcotizacion = :idcotizacion)';
    EjecutarSqlSTEx(sSql, [aIdCotizacion]);

    CommitTrans;
  except
    on E:Exception do
    begin
      Rollback;
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  end;

  // Obtiene los registros temporales
  sdqDatos.ParamByName('ss_idcotizacion').AsInteger := FIdCotizacion;
  sdqDatos.Close;
  OpenQuery(sdqDatos);
  sdqDatosAfterScroll(nil);

  ModoABM := maConsultaSRT;
end;

procedure TfrmCargaSRTCoti.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  if sdqDatos.Active and not sdqDatos.Eof then
  begin
    fraSS_ACTIVIDAD1.Value        := sdqDatos.FieldByName('ss_idactividad1').AsInteger;
    fraSS_ACTIVIDAD2.Value        := sdqDatos.FieldByName('ss_idactividad2').AsInteger;
    fraSS_ACTIVIDAD3.Value        := sdqDatos.FieldByName('ss_idactividad3').AsInteger;
    fraSS_ART.Value               := sdqDatos.FieldByName('ss_idart').AsInteger;
    edSS_FECHAEXTINCION.Date      := sdqDatos.FieldByName('ss_fechaextincion').AsDateTime;
    edSS_FECHAREGULARIZACION.Date := sdqDatos.FieldByName('ss_fecharegularizacion').AsDateTime;
    edSS_NIVEL.Text               := sdqDatos.FieldByName('ss_nivel').AsString;
    fraSS_OPERACION.Value         := sdqDatos.FieldByName('ss_operacion').AsString;
    fraSS_RESCISION.Value         := sdqDatos.FieldByName('ss_rescision').AsString;
    edSS_VIGENCIADESDE.Date       := sdqDatos.FieldByName('ss_vigenciadesde').AsDateTime;
    edSS_VIGENCIAHASTA.Date       := sdqDatos.FieldByName('ss_vigenciahasta').AsDateTime;
    Caption                       := SRT_MODIFICACION;
    ModoABM := maConsultaSRT;
  end
  else
  begin
    ClearControls;
    ModoABM := maNoneSRT;
  end;
end;

procedure TfrmCargaSRTCoti.FormCreate(Sender: TObject);
begin
  fraSS_OPERACION.Clave := 'COPER';
  fraSS_OPERACION.OnChange := CambioRescision;
  fraSS_RESCISION.Clave := 'TRESC';

  fraSS_ART.TableName   := 'aar_art';
  fraSS_ART.FieldID     := 'ar_id';
  fraSS_ART.FieldCodigo := 'ar_id';
  fraSS_ART.FieldDesc   := 'ar_nombre';
  fraSS_ART.FieldBaja   := 'ar_fechabaja';
  fraSS_ART.ShowBajas   := True;

  fraArtWeb.TableName   := 'aar_art';
  fraArtWeb.FieldID     := 'ar_id';
  fraArtWeb.FieldCodigo := 'ar_id';
  fraArtWeb.FieldDesc   := 'ar_nombre';
  fraArtWeb.FieldBaja   := 'ar_fechabaja';

  fraOperacionWeb.Clave    := 'COPER';
  fraOperacionWeb.OnChange := CambioRescision;

  fraTipoOperacionWeb.Clave := 'TRESC';
end;

procedure TfrmCargaSRTCoti.edSS_VIGENCIADESDEExit(Sender: TObject);
begin
  Verificar((not edSS_VIGENCIADESDE.IsEmpty) and (edSS_VIGENCIADESDE.Date < StrToDate('01/07/1996')), edSS_VIGENCIADESDE, 'La Vigencia Desde debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRTCoti.edSS_FECHAEXTINCIONExit(Sender: TObject);
begin
  Verificar((not edSS_FECHAEXTINCION.IsEmpty) and (edSS_FECHAEXTINCION.Date <= StrToDate('01/07/1996')), edSS_FECHAEXTINCION, 'La Fecha de Extinción debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRTCoti.edSS_FECHAREGULARIZACIONExit(Sender: TObject);
begin
  Verificar((not edSS_FECHAREGULARIZACION.IsEmpty) and (edSS_FECHAREGULARIZACION.Date <= StrToDate('01/07/1996')), edSS_FECHAREGULARIZACION, 'La Fecha de Regulación debe ser posterior al 01/07/1996.');
end;

procedure TfrmCargaSRTCoti.edSS_VIGENCIAHASTAExit(Sender: TObject);
begin
  if not edSS_VIGENCIAHASTA.IsEmpty then
  begin
    Verificar(edSS_VIGENCIADESDE.IsEmpty, edSS_VIGENCIAHASTA, 'La Fecha de Vigencia Fesde no puede quedar en blanco.');
    Verificar((edSS_VIGENCIADESDE.Date >= edSS_VIGENCIAHASTA.Date), nil, 'La Fecha de Vigencia Hasta no puede ser menor igual a la Fecha Desde.');
  end;
end;

procedure TfrmCargaSRTCoti.tlbBajaClick(Sender: TObject);
var
  aSqlTrans: TSql;
begin
  if (not sdqDatos.Eof) and (sdqDatos.FieldByName('ss_usubaja').AsString <> '') then
  begin
    MsgBox('Este registro se encuentra dado de baja.');
    Abort;
  end;

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
    begin
      aSqlTrans := TSQL.Create('tss_solicitudsrt');
      aSqlTrans.PrimaryKey.Add('ss_id', sdqDatos.fieldByName('ss_id').asInteger, False);
      aSqlTrans.Fields.Add('ss_fechabaja', 'ACTUALDATE', False);
      aSqlTrans.Fields.Add('ss_usubaja', frmPrincipal.DBLogin.UserId);
      aSqlTrans.SqlType := stUpdate;
      try
        EjecutarSQL(aSqlTrans.Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        sdqDatos.Open;
      finally
        aSqlTrans.Free;
      end;
    end;
end;

procedure TfrmCargaSRTCoti.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
begin
  if sdqDatos.FieldByName('ss_usubaja').AsString <> '' then
    AFont.Color:= clRed;
end;

procedure TfrmCargaSRTCoti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmCargaSRTCoti := nil;

  inherited;
end;

procedure TfrmCargaSRTCoti.ActualizarBotones(Cambiar: Boolean = False);
begin
  if ModoABM = maAltaSRT then
  begin
    tlbNuevo.ImageIndex := 28;
    tlbNuevo.Hint := 'Cancelar Alta (Ctrl - N)';
    EnableControls([tlbBaja, tlbModificar, tbObtenerHistorial, tbSRT, tbNavegarSRT], False);
    EnableControls([tlbNuevo, tlbGuardar], True);
    FCancelarNuevo := True;

    // Limpiar todo.
    ClearControls;
    Caption := SRT_ALTA;

    VCLExtra.LockControls(grbIdentifica, False);
    VCLExtra.LockControls(chkEmpresaSRT, True);
  end
  else if ModoABM = maModificacionSRT then
  begin
    tlbModificar.ImageIndex := 28;
    tlbModificar.Hint := 'Cancelar Modificacion (Ctrl + M)';
    EnableControls([tlbNuevo, tlbBaja, tbObtenerHistorial, tbSRT, tbNavegarSRT], False);
    EnableControls([tlbModificar, tlbGuardar], True);
    VCLExtra.LockControls (grbIdentifica, False);
    VCLExtra.LockControls (chkEmpresaSRT, True);
    Caption := SRT_MODIFICACION;
  end
  else if (ModoABM = maNoneSRT) or FLockForm then
  begin
    Caption := 'Carga de S.R.T. [CONSULTA]';
    tlbNuevo.ImageIndex := 6;
    tlbNuevo.Hint := 'Alta (Ctrl - N)';

    tlbModificar.ImageIndex := 7;
    tlbModificar.Hint := 'Modificar (Ctrl + M)';

    EnableControls([tlbNuevo, tbObtenerHistorial, tbSRT, tbNavegarSRT], False);
    EnableControls([tlbBaja, tlbModificar], False);
    EnableControls([tlbGuardar], False);

    VCLExtra.LockControls (grbIdentifica, True);
    VCLExtra.LockControls (chkEmpresaSRT, True);
  end
  else // maConsultaSRT
  begin
    Caption := 'Carga de S.R.T. [CONSULTA]';
    tlbNuevo.ImageIndex := 6;
    tlbNuevo.Hint := 'Alta (Ctrl - N)';
    tlbModificar.ImageIndex := 7;
    tlbModificar.Hint := 'Modificar (Ctrl + M)';
    EnableControls([tlbNuevo, tbObtenerHistorial, tbSRT, tbNavegarSRT], True and not EmpresaNueva);
    EnableControls([tlbBaja, tlbModificar], not sdqDatos.Eof and not EmpresaNueva);
    EnableControls([tlbGuardar], False);

    VCLExtra.LockControls (grbIdentifica, True);
    VCLExtra.LockControls (chkEmpresaSRT, False);
  end;
  CambioRescision(nil);
end;

procedure TfrmCargaSRTCoti.tlbModificarClick(Sender: TObject);
begin
  Verificar(sdqDatos.FieldByName('ss_usubaja').AsString <> '', nil, 'No se puede modificar un registro dado de baja.');

  if ModoABM = maModificacionSRT then
    ModoABM := maConsultaSRT
  else
    ModoABM := maModificacionSRT;
end;

procedure TfrmCargaSRTCoti.CambioRescision(Sender: TObject);
begin
  LockControl(fraSS_RESCISION, fraSS_OPERACION.Locked or (not fraSS_OPERACION.IsSelected) or (fraSS_OPERACION.Value <> '2'));
  if (fraSS_OPERACION.Value <> '2') then
    fraSS_RESCISION.Clear;
end;

function TfrmCargaSRTCoti.GetEmpresaNueva: Boolean;
begin
  Result := chkEmpresaSRT.Checked;
end;

procedure TfrmCargaSRTCoti.SetEmpresaNueva(const Value: Boolean);
begin
  if chkEmpresaSRT.Checked <> Value then
    chkEmpresaSRT.Checked := Value;
    
  if Value then
  begin
    ModoABM := maNoneSRT;
    VCLExtra.LockControls([chkEmpresaSRT], False);
  end
  else
    ModoABM := maConsultaSRT;
end;

procedure TfrmCargaSRTCoti.chkEmpresaSRTClick(Sender: TObject);
begin
  EmpresaNueva := chkEmpresaSRT.Checked;
  HuboCambios := True;
end;

procedure TfrmCargaSRTCoti.EliminarRegistrosSRT;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM tss_solicitudsrt' +
    ' WHERE ss_idcotizacion = :idcotizacion' +
      ' AND ss_fechabaja IS NULL';

  // Borra los registros de la SRT para empresas que son nuevas al regimen
  if ExisteSqlEx(sSql, [FIdCotizacion]) then
  begin
    Verificar(not MsgAsk('Al indicar que la empresa es Nueva al Regimen se eliminará la ' +
                         'información correspondiente a la SRT. ¿ Realmente desea continuar ?'),
              nil, 'Ha decidido cancelar la operación.');

    // Elimina los registros temporales y los permanentes de la SRT
    sSql :=
      'DELETE FROM tss_solicitudsrt' +
           ' WHERE ss_idcotizacion = :idcotizacion';
    EjecutarSQLSTEx(sSql, [FIdCotizacion]);

    sSql :=
      'DELETE FROM ass_solicitudsrt' +
           ' WHERE ss_idcotizacion = :idcotizacion';
    EjecutarSqlSTEx(sSql, [FIdCotizacion]);
  end;
end;

procedure TfrmCargaSRTCoti.SetModoABM(const Value: TModoABMSRT);
begin
  FModoABM := Value;
  ActualizarBotones;
end;

procedure TfrmCargaSRTCoti.tbObtenerHistorialClick(Sender: TObject);
begin
//  InfoHint(tbObtenerHistorial, 'Es recomendable utilizar el botón "Obtener datos desde la web de la SRT" (siguiente botón hacia la derecha).', False, 'Aviso', blnInfo, 5, False);
  ClipboardToDB;
end;

procedure TfrmCargaSRTCoti.ClipboardToDB;
var
  ListaDatos: TStringList;
  Cadena: TDynStringArray;
  nCantRescisiones, Fila, FilaFinal: Integer;
  Encontro: Boolean;
  Linea, LineaAux: String;
  iloop: Integer;
  OldIDArt, IDArt, Contrato, Desde, Operacion1,
  Hasta, Operacion2, Nivel, Ciiu, Campo,
  DetalleDesde, DetalleHasta, DetalleRegularizacion: String;
  aSqlTrans: TSql;
  sSql: String;
  EsDesdeValida, EsHastaValida: Boolean;

  function ObtenerValor(Clave: String; var ArrayValores: TDynStringArray; PosIzq: Boolean = False): Integer;
  var
    iloop2: Integer;
    Posicion: Integer;
    Valor, Aux: String;
  begin
    // Esta funcion busca la cadena de caracteres en la lista y si la encuentra
    // devuelve el string que le sigue hasta el final de la linea
    Result := -1;
    for iloop2 := 0 to ListaDatos.Count - 1 do
    begin
      Aux := ListaDatos.Strings[iloop2];
      Posicion := Pos(Clave, Aux);
      if Posicion > 0 then
      begin
        if PosIzq then // La informacion esta a la izquierda de la clave
          Valor := Copy(Aux, 0, Posicion)
        else
          Valor := Copy(Aux, Posicion + Length(Clave), Length(Aux));
        ArrayValores := ParseText(Trim(Valor), ' ');
        FixCadena(ArrayValores, 'D.', '590/97');
        FixCadena(ArrayValores, 'Absorción', 'SRT');

        // Devuelve la fila en que encontró la cadena
        Result := iloop2;

        // se queda con la primera que encuentra
        Break;
      end;
    end;
    Verificar((High(ArrayValores) = -1) or (ArrayValores[0] = ''), nil, 'El texto en el portapapeles no es válido.');
  end;

  function ObtenerIdArtFromNombre(NombreArt: String): String;
  var
    iloop3: Integer;
    CantEmpresas: Integer;
    NombreParcial: String;
    IdArt, sSQL: String;
  begin
    //Por cada porcion del nombre que es separada por espacios, busca que una sola
    //ART cumpla con el criterio
    IdArt  := '0';
    iloop3 := 0;
    while (iloop3 < Length(NombreArt)) do
    begin
      inc(iloop3);
      if (NombreArt[iloop3] = ' ') then
      begin
        NombreParcial := Copy(NombreArt, 1, iloop3);
        sSql :=
          'SELECT COUNT(*)' +
           ' FROM aar_art' +
          ' WHERE ar_nombre LIKE :nombre';
        CantEmpresas  := ValorSqlIntegerEx(sSql, ['%' + NombreParcial + '%']);
        if CantEmpresas = 1 then
        begin
          sSql :=
            'SELECT ar_id' +
             ' FROM aar_art' +
            ' WHERE ar_nombre LIKE :nombre';
          IdArt := ValorSqlEx(sSql, ['%' + NombreParcial + '%']);
          Break;
        end;
      end;
    end;

    if IdArt = '0' then
    begin
      sSql :=
        'SELECT ar_id' +
         ' FROM aar_art' +
        ' WHERE ar_artweb = :artweb';
      IdArt := ValorSqlEx(sSQL, [Trim(NombreART)]);
      if IdArt = '' then
        IdArt := '0';
    end;

    if IdArt = '0' then
    begin
      VCLExtra.LockControls([edNombreWeb], True);
      fraArtWeb.Clear;
      edNombreWeb.Text := NombreArt;
      if fpArt.ShowModal <> mrOk then
        raise Exception.Create('No se reconoció la ART ' + SqlValue(NombreART) + '.')
      else
      begin
        sSql :=
          'UPDATE aar_art' +
            ' SET ar_artweb = :artweb' +
          ' WHERE ar_id = :id';
        EjecutarSqlSTEx(sSQL,[Trim(NombreART), fraARTWeb.Value]);
        IdArt := fraArtWeb.AsString;
      end;
    end;
    Result := IdArt;
  end;

  {$WARNINGS OFF}
  procedure ConvierteFormatoOperacion(var sAux: String; Sentido: Boolean);
  var
    acCadena: TDynStringArray;
    MAX_OP: Byte;
    nCantOperaciones: Byte;
    sOperacion: String;
    sSql: String;
    sTmp: String;
  begin
    //Esta funcion tiene como objetivo recorrer todas las operaciones que se pueden dar
    //y reemplazar en el caso que sea necesario el ' ' que viene en la operacion
    //por un '_' de tal manera que al realizar la conversion a vector, no identifique
    //campos de mas

    if Sentido then
      MAX_OP := 2
    else
      MAX_OP := 1;

    nCantOperaciones := 0;

    repeat
      sSql :=
        'SELECT tb_especial1' +
         ' FROM ctb_tablas' +
        ' WHERE tb_clave = :clave' +
          ' AND tb_codigo <> :codigo';

      with GetQueryEx(sSQL, ['COPER', '0']) do
      try
        First;
        while not Eof do
        begin
          sOperacion := FieldByName('tb_especial1').AsString;

          if (Pos(StrReplace(sOperacion, ' ', '_'), sAux) > 0) or
             (Pos(StrReplace(sOperacion, '_', ' '), sAux) > 0) then
          begin
            Inc(nCantOperaciones);

            if Sentido then
              sAux := StrReplace(sAux, sOperacion, StrReplace(sOperacion, ' ', '_'))
            else
              sAux := StrReplace(sAux, StrReplace(sOperacion, ' ', '_'), sOperacion);
          end;
          Next;
        end
      finally
        Free;
      end;

      while (nCantOperaciones < MAX_OP) do
      begin
        VCLExtra.LockControls([edLineaOperacionWeb], True);
        fraOperacionWeb.Clear;

        //Parsea la cadena a un vector de cadenas (separado por palabras)
        acCadena := ParseText(sAux, ' ');
        FixCadena(acCadena, 'D.', '590/97');
        FixCadena(acCadena, 'Absorción', 'SRT');

        if Sentido then
        begin
          edLineaOperacionWeb.Text := Trim(acCadena[2]) + ' / ' + Trim(acCadena[4]);
          edNombreOperacionWeb.Items.Clear;
          edNombreOperacionWeb.Items.Add(Trim(acCadena[2]));
          edNombreOperacionWeb.Items.Add(Trim(acCadena[4]));
          sTmp := ' AND (tb_especial1 = ' + SqlValue(Trim(acCadena[2])) + ' OR tb_especial1 = ' + SqlValue(Trim(acCadena[4])) + ')';
        end
        else
        begin
          edLineaOperacionWeb.Text := Trim(acCadena[0]);
          edNombreOperacionWeb.Items.Clear;
          edNombreOperacionWeb.Items.Add(Trim(acCadena[0]));
          sTmp := ' AND tb_especial1 = ' + SqlValue(Trim(acCadena[0]));
        end;

        sSql :=
          'SELECT 1' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''COPER''' +
                  sTmp;
        if ExisteSql(sSql) then
          Inc(nCantOperaciones)
        else
        begin
          if fpOperacion.ShowModal <> mrOk then
            raise Exception.Create('No se reconoció la operación ' + sOperacion)
          else
          begin
            sSql :=
              'UPDATE ctb_tablas' +
                ' SET tb_especial1 = :especial1' +
              ' WHERE tb_clave = :clave' +
                ' AND tb_codigo = :codigo';
            EjecutarSqlSTEx(sSQL,[Trim(edNombreOperacionWeb.Text), 'COPER', fraOperacionWeb.Value]);
            sAux := StrReplace(sAux, edNombreOperacionWeb.Text, StrReplace(edNombreOperacionWeb.Text, ' ', '_'));
            Inc(nCantOperaciones);
          end;
        end;
      end;
    until nCantOperaciones = MAX_OP;
  end;
  {$WARNINGS ON}

begin
  //lo meto en un stringlist para manejarlo mas facil
  ListaDatos := TStringList.Create;
  aSqlTrans  := TSQL.Create('tss_solicitudsrt');

  nCantRescisiones := 0;

  try
    ListaDatos.Text := Clipboard.AsText;

    // Obtengo el Cuit de la empresa
    ObtenerValor('Cuit: ', Cadena);
    if Trim(Cadena[0]) <> fCuit then
      raise Exception.Create('La C.U.I.T. obtenida no es la ingresada en el formulario.');

    // Busco la fila en la que empieza el encabezado
    Fila      := ObtenerValor('Aseguradora ', Cadena);
    FilaFinal := ObtenerValor('Registro de Contratos', Cadena);

    // busco el primer dato
    Encontro := False;
    BeginTrans;
    try
      //Borra los registros anteriores
      sSql :=
        'DELETE FROM tss_solicitudsrt' +
             ' WHERE ss_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [FIdCotizacion]);
      while (Fila <= FilaFinal) do
      begin
        Inc(Fila);
        Linea := Trim(ListaDatos.Strings[Fila]);
        if (Linea <> '') and (Copy(Linea, 1, 1) <> '-') and (Copy(Linea, 1, 21) <> 'Registro de Contratos') then
        begin
          //Encontro una ART
          Encontro := True;
          iloop    := 0;

          //Obtengo el nombre y el Id
          while (iloop < Length(Linea)) do
          begin
            //primero busco un nro, eso me va a indicar que inicia el contrato
            //y por lo tanto lo que esta antes es el nombre de la ART
            if AreIn(Linea[iloop], ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
            begin
              Campo := Copy(Trim(Linea), 1, iloop - 1);
              if (Campo <> '') and (Campo <> '0') then
              begin
                IDArt  := ObtenerIdArtFromNombre(Campo);
                OldIDArt := IDArt;
              end
              else
              begin
                IDArt := OldIDArt;
                //con esto ajusto en caso que venga un espacio como nombre de la
                //ART
                Linea := '0 ' + Linea;
              end;
              Linea := Trim(Copy(Linea, iloop, Length(Linea)));
              Linea := StrReplace(Linea, '  ', ' ');
              // Con esto convierto la cadena con espacios a vector, lo cual hace mas facil manejarlo
              // Antes de hacerlo hay que reemplazar los espacios por '_' cuando corresponda
              ConvierteFormatoOperacion(Linea, True);

              // Si hubo algún asterisco se lo saco, no me interesan las aclaraciones
              ReplaceString(Linea, '(*) ', '');

              //Parsea la cadena a un vector de cadenas (separado por palabras)
              Cadena := ParseText(Linea, ' ');
              FixCadena(Cadena, 'D.', '590/97');
              FixCadena(Cadena, 'Absorción', 'SRT');
              FixCadena(Cadena, 'Cesión', 'SRT');

              //Obtengo los otros campos
              Contrato   := Trim(Cadena[0]); //no se usa
              Desde      := Trim(Cadena[1]);
              Operacion1 := Trim(Cadena[2]); //no se usa
              Hasta      := Trim(Cadena[3]);
              Operacion2 := Trim(Cadena[4]);
              Nivel      := Trim(Cadena[5]);
              Ciiu       := Trim(Cadena[6]);

              //Vuelvo a reemplazar el '_' por un espacio
              ConvierteFormatoOperacion(Operacion1, False);
              ConvierteFormatoOperacion(Operacion2, False);

              {
              //Estos campos los trae la pagina pero no los grabamos
              if High(Cadena) > 6 then
                SumaFija   := Cadena[7];
              if High(Cadena) > 7 then
                PorcVar    := Cadena[8];
              if High(Cadena) > 8 then
                FFE        := Cadena[9];
              }

              //////////////////
              ///GRABA LA INFO
              //////////////////

              ClearControls;
              fraSS_ART.Value        := StrToInt(IDArt);
              edSS_NIVEL.Text        := Nivel;

              sSql :=
                'SELECT tb_codigo' +
                 ' FROM ctb_tablas' +
                ' WHERE tb_clave = :clave' +
                  ' AND tb_especial1 = :especial1';
              fraSS_OPERACION.Value  := ValorSqlEx(sSql, ['COPER', Trim(Operacion2)]);

              sSql :=
                'SELECT ac_id' +
                 ' FROM cac_actividad' +
                ' WHERE ac_codigo = :codigo';
              fraSS_ACTIVIDAD1.Value := ValorSqlEx(sSql, [Trim(Ciiu)]);
              if Desde <> '' then
                edSS_VIGENCIADESDE.Date := StrToDate(Desde)
              else
                edSS_VIGENCIADESDE.Clear;

              if Hasta <> '' then
                edSS_VIGENCIAHASTA.Date := StrToDate(Hasta)
              else
                edSS_VIGENCIAHASTA.Clear;

              EsDesdeValida := False;
              EsHastaValida := False;

              if fraSS_OPERACION.Value = '2' then
              begin
                Inc(nCantRescisiones);
                LineaAux := Trim(ListaDatos.Strings[ FilaFinal + 4 + nCantRescisiones]);

                DetalleDesde := StrLeft(LineaAux, 10);
                DetalleHasta := StrRight(LineaAux, 10);

                EsDesdeValida := Is_FechaValida(DetalleDesde);
                EsHastaValida := Is_FechaValida(DetalleHasta);

                if EsDesdeValida and  EsHastaValida then
                  DetalleRegularizacion := StrMid(LineaAux, 11, Length(LineaAux) - 20)
                else if EsDesdeValida then
                  DetalleRegularizacion := StrRight(LineaAux, Length(LineaAux) - 10)
                else if EsHastaValida then
                  DetalleRegularizacion := StrLeft(LineaAux, Length(LineaAux) - 10)
                else
                  DetalleRegularizacion := LineaAux;

                sSql :=
                  'SELECT tb_codigo' +
                   ' FROM ctb_tablas' +
                  ' WHERE tb_clave = :clave' +
                    ' AND tb_especial1 = :especial';
                fraSS_RESCISION.Value := ValorSqlEx(sSql, ['TRESC', Trim(DetalleRegularizacion)]);

                if fraSS_RESCISION.IsEmpty then
                begin
                  edNombreTipoOperacionWeb.Text := DetalleRegularizacion;

                  if fpTipoOperacion.ShowModal <> mrOk then
                    raise Exception.Create('No se reconoció el tipo de operación ' + DetalleRegularizacion + '.')
                  else
                  begin
                    fraSS_RESCISION.Value := fraTipoOperacionWeb.Value;
                    sSql :=
                      'UPDATE ctb_tablas' +
                        ' SET tb_especial1 = :especial1' +
                      ' WHERE tb_clave = :clave' +
                        ' AND tb_codigo = :codigo';
                    EjecutarSqlSTEx(sSQL,[Trim(edNombreTipoOperacionWeb.Text), 'TRESC', fraTipoOperacionWeb.Value]);
                  end;
                end;
              end;

//              sdqDatos.First;

              if IsValidar then
              begin
                aSqlTrans.Clear;
                aSqlTrans.PrimaryKey.Add('ss_id',       'AFI.SEQ_ASS_ID.NEXTVAL', False);
                aSqlTrans.Fields.Add('ss_idcotizacion', FIdCotizacion);
                aSqlTrans.Fields.Add('ss_idart',        fraSS_ART.Value);
                aSqlTrans.Fields.Add('ss_idactividad1', fraSS_ACTIVIDAD1.Value);
                aSqlTrans.Fields.Add('ss_nivel',        edSS_NIVEL.Text);
                aSqlTrans.Fields.Add('ss_operacion',    fraSS_OPERACION.Value);
                aSqlTrans.Fields.Add('ss_rescision',    fraSS_RESCISION.Value);

                if EsDesdeValida then
                  aSqlTrans.Fields.Add('ss_fechaextincion', StrToDateTime(DetalleDesde));

                if EsHastaValida then
                  aSqlTrans.Fields.Add('ss_fecharegularizacion', StrToDateTime(DetalleHasta));

                aSqlTrans.Fields.Add('ss_vigenciadesde', edSS_VIGENCIADESDE.Date);
                aSqlTrans.Fields.Add('ss_vigenciahasta', edSS_VIGENCIAHASTA.Date);
                aSqlTrans.Fields.Add('ss_fechaalta',     'ACTUALDATE', False);
                aSqlTrans.Fields.Add('ss_usualta',       frmPrincipal.DBLogin.UserId);

                aSqlTrans.SqlType := stInsert;
                EjecutarSQLST(aSqlTrans.Sql);
              end;
              Break;
            end;
            Inc(iloop);
          end;
        end;
      end;

      if not Encontro then
        raise Exception.Create('El texto en el portapapeles no es válido.');

      CommitTrans;
      HuboCambios := True;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      sdqDatos.Close;
      sdqDatos.Open;
    except
      on E:Exception do
      begin
        RollBack;

        //Muestra el mensaje solo si no es el que dice que el portapapeles es invalido...etc
        if Encontro then
          MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    ListaDatos.Free;
    aSqlTrans.Free;
  end;
end;

procedure TfrmCargaSRTCoti.btnAceptarClick(Sender: TObject);
begin
  if fraArtWeb.IsEmpty then
    raise Exception.Create('La ART no puede quedar vacía.')
  else
    fpArt.ModalResult := mrOk;
end;

procedure TfrmCargaSRTCoti.btnAceptarOPClick(Sender: TObject);
begin
  if fraOperacionWeb.IsEmpty then
    raise Exception.Create('La Operación no puede quedar vacía.')
  else
    fpOperacion.ModalResult := mrOk;
end;

procedure TfrmCargaSRTCoti.edLineaOperacionWebExit(Sender: TObject);
begin
  edNombreOperacionWeb.Text := edLineaOperacionWeb.SelText;
end;

procedure TfrmCargaSRTCoti.btnAceptarTOPClick(Sender: TObject);
begin
  if fraTipoOperacionWeb.IsEmpty then
    raise Exception.Create('El tipo de rescisión es obligatorio para el tipo de operación seleccionado.')
  else
    fpTipoOperacion.ModalResult := mrOk;
end;

procedure TfrmCargaSRTCoti.tbNavegarSRTClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.arts.gov.ar/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmCargaSRTCoti.tbSRTClick(Sender: TObject);
var
  sSql: String;
  aSql: TSql;
  Vig : TCuilSRT;
  i : Integer;
  sRegularizacion : String;
  iOperacion, iIdArt, iCiiu : Integer;
begin
  Vig := ConsultarVigencia(FCuit);
  if Vig.Error = '' then
  begin
    BeginTrans;

    try
      // Doy de baja los registros anteriores para esa cotizacion..
      sSql :=
        'UPDATE tss_solicitudsrt' +
          ' SET ss_usubaja = :usubaja,' +
              ' ss_fechabaja = SYSDATE' +
        ' WHERE ss_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, FIdCotizacion]);

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
          sRegularizacion := '02' else sRegularizacion := '';

        iIdArt := ValorSqlEx('SELECT ar_id FROM aar_art WHERE ar_codigosrt =:cod',[Vig.Historial[i].Aseguradora]);
        iCiiu  := ValorSqlEx('SELECT ac_id FROM cac_actividad WHERE ac_codigo =:ciiu AND ROWNUM < 2', [Vig.Historial[i].Ciiu]);
        aSql := TSql.Create('TSS_SOLICITUDSRT');
        try
          aSql.SqlType := stInsert;
          aSql.PrimaryKey.Add('SS_ID',           'afi.seq_ass_id.NEXTVAL', False);
          aSql.Fields.Add('SS_IDCOTIZACION',          FIdCotizacion);
          aSql.Fields.Add('SS_IDART',          iIdArt);
          aSql.Fields.Add('SS_VIGENCIADESDE', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionDesde,1,10), 0), dmDateTime);
          aSql.Fields.Add('SS_VIGENCIAHASTA', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionHasta,1,10), 0), dmDateTime);
          aSql.Fields.Add('SS_OPERACION',  iOperacion);
          aSql.Fields.Add('SS_NIVEL', Vig.Historial[i].Nivel);
          aSql.Fields.Add('SS_USUALTA', Sesion.UserID);
          aSql.Fields.Add('SS_FECHAALTA', SQL_DATETIME, False);
          aSql.Fields.Add('SS_IDACTIVIDAD1', iCiiu);
          aSql.Fields.Add('SS_FECHAEXTINCION', StrToDateDef(Copy(Vig.Historial[i].FechaExtincion,1,10), 0), dmDateTime);
          aSql.Fields.Add('SS_FECHAREGULARIZACION', StrToDateDef(Copy(Vig.Historial[i].FechaRegularizacion,1,10), 0), dmDateTime);
          aSql.Fields.Add('SS_RESCISION', sRegularizacion);

          EjecutarSqlSt(aSql.Sql);
        finally
          aSql.Free;
        end;
      end;
      CommitTrans;

      ActualizarFechaUltimaActualizacionSRT;

      HuboCambios := True;
      sdqDatos.Refresh;
      sdqDatos.First;
    except
      raise;
      RollBack;
    end;
  end
  else
    ShowMessage('No se pudieron recuperar los datos. ' + Vig.Error);
end;

procedure TfrmCargaSRTCoti.ActualizarFechaUltimaActualizacionSRT;
var
  aFechaActualizacionSRT: TDateTime;
  sSql: String;
begin
  // Obtengo la fecha de última actualización de vigencias para este contrato..
  sSql :=
    'SELECT NVL(hv_fechamodif, hv_fechaalta)' +
     ' FROM srt.shv_historialvigencias, srt.sem_empresas, aco_cotizacion' +
    ' WHERE hv_idempresa = em_id' +
      ' AND em_cuit = co_cuit' +
      ' AND co_id = :id '+ 
      ' ORDER BY 1 DESC';
  aFechaActualizacionSRT := ValorSqlDateTimeEx(sSql, [FIdCotizacion]);

  if aFechaActualizacionSRT > 5 then
    lbFechaUltimaActualizacionSRT.Caption := FormatDateTime('dd/mm/yyyy', aFechaActualizacionSRT)
  else
    lbFechaUltimaActualizacionSRT.Caption := 'NUNCA';

  if Trunc(aFechaActualizacionSRT) = Trunc(DBDate) then
    lbFechaUltimaActualizacionSRT.Font.Color := clGreen
  else if (Trunc(aFechaActualizacionSRT) >= Trunc(DBDate - 3)) and (Trunc(aFechaActualizacionSRT) <= Trunc(DBDate - 1)) then
    lbFechaUltimaActualizacionSRT.Font.Color := StringToColor('$0055FFFF')
  else
    lbFechaUltimaActualizacionSRT.Font.Color := clRed;
end;

function TfrmCargaSRTCoti.GetStatusStr(const aCodigoOperacion: String): String;
begin
  case StrToIntDef(aCodigoOperacion, 0) of
    7:                 Result := '1';
    1, 14:             Result := '2';
    5, 9, 13, 16, 21:  Result := '3';
    8, 17:             Result := '4';
    2, 20, 22:         Result := '5';
  else
    Result := '';
  end;
end;

end.
