unit unControlDeEnvioNotasDenuncia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDbFrame, unFraEmpresa,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, Mask, ToolEdit,
  DateComboBox, FolderDialog, PatternEdit, ComboEditor, CheckCombo,
  unfraCtbTablas, unGrids, RxToolEdit, RxPlacemnt;

type
  TfrmControlDeEnvioNotasDenuncia = class(TfrmCustomGridABM)
    edFechaAltaDesde: TDateComboBox;
    Label1: TLabel;
    fraUsuarioAlta: TfraCodigoDescripcion;
    fraEmpresa: TfraEmpresa;
    lblCUIT: TLabel;
    Label2: TLabel;
    edFechaModifHasta: TDateComboBox;
    Label3: TLabel;
    fraUsuarioModif: TfraCodigoDescripcion;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edFechaAltaHasta: TDateComboBox;
    Label7: TLabel;
    edFechaModifDesde: TDateComboBox;
    Label8: TLabel;
    edFechaEnvioHasta: TDateComboBox;
    Label9: TLabel;
    fraUsuarioEnvio: TfraCodigoDescripcion;
    Label10: TLabel;
    Label11: TLabel;
    edFechaEnvioDesde: TDateComboBox;
    Label12: TLabel;
    tbMarcarComoEnviado: TToolButton;
    tbCopiarArchivo: TToolButton;
    OpenDialogCopiarArchivo: TOpenDialog;
    fpCopiarArchivo: TFormPanel;
    edDirectorio: TDirectoryEdit;
    Button1: TButton;
    lbDirectorio: TLabel;
    btnAceptarCopiarArchivo: TButton;
    ShortCutControl1: TShortCutControl;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    sdqConsultaNE_ID: TFloatField;
    sdqConsultaNE_CONTRATO: TFloatField;
    sdqConsultaNE_FECHAENVIO: TDateTimeField;
    sdqConsultaNE_USUENVIO: TStringField;
    sdqConsultaNE_FECHAALTA: TDateTimeField;
    sdqConsultaNE_USUALTA: TStringField;
    sdqConsultaNE_FECHAMODIF: TDateTimeField;
    sdqConsultaNE_USUMODIF: TStringField;
    sdqConsultaNE_FECHABAJA: TDateTimeField;
    sdqConsultaNE_USUBAJA: TStringField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaFECHAALTA: TDateTimeField;
    sdqConsultaSELECTED: TStringField;
    Label13: TLabel;
    cmbTipoDenuncia: TCheckCombo;
    tbReprocesar: TToolButton;
    sdqConsultaNE_IDTIPODENUNCIA: TFloatField;
    sdqConsultaNE_ESTABLECI: TFloatField;
    sdqConsultaNT_DESCRIPCION: TStringField;
    sdqConsultaNE_FECHADENUNCIA: TDateTimeField;
    sdqConsultaNE_OPERATIVO: TStringField;
    cmbEstado: TCheckCombo;
    Label14: TLabel;
    sdqConsultaNE_ESTADO: TStringField;
    sdqConsultaESTADO: TStringField;
    tbAprobarDenuncia: TToolButton;
    tbRechazar: TToolButton;
    edEstablecimiento: TPatternEdit;
    Label15: TLabel;
    sdqConsultaNE_TIPODATO: TStringField;
    sdqConsultaTIPODATO: TStringField;
    sdqConsultaES_NOMBRE: TStringField;
    StatusBar: TStatusBar;
    cbActivas: TCheckBox;
    cbBajas: TCheckBox;
    cbEmpresaVip: TCheckBox;
    fraTipoFiltroSRT: TfraCtbTablas;
    cmbTipoEmpresaPrev: TCheckCombo;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMarcarComoEnviadoClick(Sender: TObject);
    procedure tbCopiarArchivoClick(Sender: TObject);
    procedure btnAceptarCopiarArchivoClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbReprocesarClick(Sender: TObject);
    procedure tbAprobarDenunciaClick(Sender: TObject);
    procedure tbRechazarClick(Sender: TObject);
  private
    { Private declarations }
    SelectedList: TBookMarkLst;
    function ArmarFiltroEstab(Establecimientos: string): string;
    procedure AprobarProgramaSeguridadOAvisoObra(idnota : Integer;Progseg, PresTardia : Boolean);
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmControlDeEnvioNotasDenuncia: TfrmControlDeEnvioNotasDenuncia;

implementation

uses
  unSesion, unCustomConsulta, AnsiSql, unDmPrincipal, CustomDlgs, Strfuncs, unRptNotaDenunciaRiegoInvalido,
  unRptNotificacion, unExportPdf, ArchFuncs, unImportCryptoSRT, unMoldeEnvioMail;
{$R *.dfm}


{ TfrmControlDeEnvioNotasDenuncia }

procedure TfrmControlDeEnvioNotasDenuncia.ClearControls;
begin
  inherited;

end;

function TfrmControlDeEnvioNotasDenuncia.DoABM: Boolean;
begin
  result := True;
end;

procedure TfrmControlDeEnvioNotasDenuncia.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ne_fechabaja';
  SelectedList := TBookMarkLst.Create;
  Sql.TableName := 'HYS.hne_notasdenunciaenvio';
  With fraUsuarioAlta do begin
    TableName      := 'art.use_usuarios';
    FieldID        := 'SE_ID';
    FieldCodigo    := 'SE_USUARIO';
    FieldDesc      := 'SE_NOMBRE';
    FieldBaja      := 'se_fechabaja';
    ShowBajas      := False;
    ExtraCondition := ' AND se_sector = ''HYS'' AND se_usuariogenerico = ''N'' ';
  end;
  With fraUsuarioModif do begin
    TableName      := 'art.use_usuarios';
    FieldID        := 'SE_ID';
    FieldCodigo    := 'SE_USUARIO';
    FieldDesc      := 'SE_NOMBRE';
    FieldBaja      := 'se_fechabaja';
    ShowBajas      := False;
    ExtraCondition := ' AND se_sector = ''HYS'' AND se_usuariogenerico = ''N'' ';
  end;
    With fraUsuarioEnvio do begin
    TableName      := 'art.use_usuarios';
    FieldID        := 'SE_ID';
    FieldCodigo    := 'SE_USUARIO';
    FieldDesc      := 'SE_NOMBRE';
    FieldBaja      := 'se_fechabaja';
    ShowBajas      := False;
    ExtraCondition := ' AND se_sector = ''HYS'' AND se_usuariogenerico = ''N'' ';
  end;

  with GetQuery('SELECT * FROM HYS.HNT_NOTASDENUNCIASTIPO WHERE NT_FECHABAJA IS NULL ') do
  try
    while not Eof do
    begin
      cmbTipoDenuncia.Items.AddObject(fieldbyname('NT_DESCRIPCION').AsString, TObject(fieldbyname('NT_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV WHERE TE_APLICA LIKE ''%C%''') do
  try
    while not Eof do
    begin
      cmbTipoEmpresaPrev.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  fraTipoFiltroSRT.Clave := 'TFET';

  cmbEstado.Items.AddObject('Pendiente', TObject('P'));
  cmbEstado.Items.AddObject('Aprobado', TObject('A'));
  cmbEstado.Items.AddObject('Rechazado', TObject('R'));
  cmbEstado.Items.AddObject('Denunciado', TObject('D'));
  fraUsuarioAlta.Codigo := Sesion.UserID;
  edFechaAltaDesde.Date := DBDate;
  tbMarcarComoEnviado.Left := tbSalir.Left -1 ;
  tbCopiarArchivo.Left := tbSalir.Left- 1;
  tbSeleccionarTodo.Left := tbSalir.Left -1 ;
  tbDesSeleccionarTodo.Left := tbSalir.Left -1 ;
  tbReprocesar.Left := tbSalir.Left -1 ;
  tbAprobarDenuncia.Left := tbSalir.Left -1 ;
  tbRechazar.Left := tbSalir.Left -1 ;
end;

procedure TfrmControlDeEnvioNotasDenuncia.LoadControls;
begin
  inherited;

end;

function TfrmControlDeEnvioNotasDenuncia.Validar: Boolean;
begin
  result := True;
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraUsuarioAlta.Clear;
  fraUsuarioModif.Clear;
  fraUsuarioEnvio.Clear;
  fraEmpresa.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaModifDesde.Clear;
  edFechaModifHasta.Clear;
  edFechaEnvioDesde.Clear;
  edFechaEnvioHasta.Clear;
  fraUsuarioAlta.Codigo := Sesion.UserID;
  cmbTipoDenuncia.Clear;
  cmbEstado.Clear;
  edEstablecimiento.Clear;
  cbActivas.Checked := False;
  cbBajas.Checked := False;
  cmbTipoEmpresaPrev.Clear;
  cbEmpresaVip.Checked := False;
end;

procedure TfrmControlDeEnvioNotasDenuncia.RefreshData;
var
  sSQL, sIn : String;
  i : Integer;
  {$IFDEF VER150}
  j: integer;
  {$ENDIF}
begin
{$IFDEF VER150}
  for j:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[j]));
{$ENDIF}
  SelectedList.Clear;
  sSQL := 'SELECT a.*, b.*, c.*, d.*, TRUNC(ne_fechaalta) fechaalta, DECODE(ne_estado, ''P'', ''Pendiente'', ''A'', ''Aprobado'', ''R'', ''Rechazado'',''D'',''Denunciado'') estado,  '+
          '       DECODE(ne_tipodato, ''D'', ''Denuncia'', ''V'', ''Ventanilla'') tipodato, es_nombre '+
          '  FROM hys.hne_notasdenunciaenvio a, afi.aco_contrato b, afi.aem_empresa c, '+
          '       HYS.HNT_NOTASDENUNCIASTIPO d, afi.aes_establecimiento'+
          ' WHERE ne_contrato = co_contrato '+
          '   AND co_idempresa = em_id '+
          '   AND NE_IDTIPODENUNCIA = nt_id'+
          '   AND ne_contrato = es_contrato(+) '+
          '   AND ne_estableci = es_nroestableci(+)';
  if fraEmpresa.IsSelected then
    sSQL := sSQL + ' AND ne_contrato = '+ SqlValue(fraEmpresa.Contrato);
  if fraUsuarioAlta.IsSelected then
    sSQL := sSQL + ' AND ne_usualta = '+ SqlValue(fraUsuarioAlta.Codigo);
  if fraUsuarioModif.IsSelected then
    sSQL := sSQL + ' AND ne_usumodif = '+ SqlValue(fraUsuarioModif.Codigo);
  if fraUsuarioEnvio.IsSelected then
    sSQL := sSQL + ' AND ne_usuenvio = '+ SqlValue(fraUsuarioEnvio.Codigo);

  if edEstablecimiento.Text <> '' then
    sSQL := sSQL + ' and NE_ESTABLECI in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';

  if cbActivas.Checked then
    sSQL := sSQL + ' and ne_fechabaja is null';

  if cbBajas.Checked then
    sSQL := sSQL + ' and ne_fechabaja is not null';

  if (cmbTipoDenuncia.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbTipoDenuncia.Items.Count-1 do
      if cmbTipoDenuncia.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbTipoDenuncia.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sSQL := sSQL + ' and nvl(nt_id,0) in (' + sIn  + ')';

  sIn := '';

  if (cmbEstado.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbEstado.Items.Count-1 do
      if cmbEstado.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(char(cmbEstado.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sSQL := sSQL + ' and ne_estado in (' + sIn  + ')';


  if fraTipoFiltroSRT.IsSelected then
    sSQL := sSQL + ' and art.hys.get_tipo_estab_srt(em_cuit ,NE_ESTABLECI) = ' + SqlValue(fraTipoFiltroSRT.Codigo);

  sIn := '';
  if (cmbTipoEmpresaPrev.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
      if cmbTipoEmpresaPrev.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbTipoEmpresaPrev.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sSQL := sSQL + ' and art.hys.get_tipo_empresa_prevencion(em_id) in (' + sIn  + ')';

  if cbEmpresaVip.Checked then
      sSQL := sSQL +
        ' AND EXISTS(SELECT DISTINCT 1 '+
        '        FROM comunes.cev_empresavip '+
        '       WHERE ev_idempresa = ep_idempresa '+
        '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';


  if edFechaAltaDesde.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechaalta >= '+ SqlValue(edFechaAltaDesde.Date);
  if edFechaAltaHasta.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechaalta <= '+ SqlValue(edFechaAltaHasta.Date);
  if edFechaModifDesde.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechamodif >= '+ SqlValue(edFechaModifDesde.Date);
  if edFechaModifHasta.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechamodif <= '+ SqlValue(edFechaModifHasta.Date);
  if edFechaEnvioDesde.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechaenvio >= '+ SqlValue(edFechaEnvioDesde.Date);
  if edFechaEnvioHasta.Date <> 0 then
    sSQL := sSQL + ' AND ne_fechaenvio <= '+ SqlValue(edFechaEnvioHasta.Date);



  sdqConsulta.SQL.Text := sSQL;
  inherited;
  StatusBar.SimpleText := ' La cantidad de filas es: '+IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbMarcarComoEnviadoClick(
  Sender: TObject);
var
  j : integer;
  idNota : String;
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) then
  begin
    for j:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[j]);
      idNota := SelectedList.Strings[j];
      EjecutarSql(' UPDATE hys.hne_notasdenunciaenvio '+
                  '    SET ne_fechaenvio = sysdate, '+
                  '        ne_usuenvio = '+SqlValue(Sesion.UserID)+
                  '  WHERE ne_id = '+SqlValue(idNota));

    end;
    tbDesSeleccionarTodoClick(nil);
    sdqConsulta.Refresh;
  end;    
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbCopiarArchivoClick(
  Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) then
    fpCopiarArchivo.ShowModal;
end;

procedure TfrmControlDeEnvioNotasDenuncia.btnAceptarCopiarArchivoClick(
  Sender: TObject);
var
  valorContrato, NomArch : String;
  PathBase, PathOrigen, sCuit, sContrato, idNota : STring;
  j, TipoDen : Integer;
begin
  inherited;
  if not DirectoryExists(edDirectorio.Text) then
    InvalidMsg(edDirectorio, 'El directorio de exportación es inexistente.')
  else
  begin
    for j:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[j]);
      idNota := SelectedList.Strings[j];
      TipoDen := ValorSqlInteger('SELECT NE_IDTIPODENUNCIA FROM hys.hne_notasdenunciaenvio WHERE ne_id = '+SqlValue(idNota));
      case TipoDen of
        1:
        begin
          PathBase := ValorSql(
            ' SELECT pa_valor '+
            '   FROM hys.hpa_parametro '+
            '  WHERE pa_clave = ''CARPETAREPORTES'' ');
            PathOrigen := PathBase;
            sContrato := ValorSql('SELECT ne_contrato FROM hys.hne_notasdenunciaenvio WHERE ne_id = '+SqlValue(idNota));
            sCuit := ValorSql('SELECT em_cuit FROM afi.aem_empresa, afi.aco_contrato WHERE em_id = co_idempresa '+
                              ' AND co_contrato = '+SqlValue(sContrato));
            NomArch := sCuit+'_NotaDenuncia.pdf';

            valorContrato := LPad(copy(sContrato, Length(sContrato)-2,3),'0',3);
            PathOrigen := IncludeTrailingBackslash(PathOrigen)+valorContrato+'\'+NomArch;
            CopyFile(PChar(PathOrigen), PChar(edDirectorio.text+'\'+NomArch), True);

        end;
        2:
        begin
          PathBase := ValorSql(
            ' SELECT pa_valor '+
            '   FROM hys.hpa_parametro '+
            '  WHERE pa_clave = ''CARPETASERVICIO'' ');
            PathOrigen := PathBase;

            sContrato := ValorSql('SELECT ne_contrato FROM hys.hne_notasdenunciaenvio WHERE ne_id = '+SqlValue(idNota));

            sCuit := ValorSql('SELECT em_cuit FROM afi.aem_empresa, afi.aco_contrato WHERE em_id = co_idempresa '+
                              ' AND co_contrato = '+SqlValue(sContrato));
            NomArch := sCuit+'_NotaDenunciaRiesgoInvalido.pdf';

            valorContrato := LPad(copy(sContrato,
                                Length(sContrato)-2,3),'0',3);
            PathOrigen := IncludeTrailingBackslash(PathOrigen)+valorContrato+'\'+NomArch;

            CopyFile(PChar(PathOrigen), PChar(edDirectorio.text+'\'+NomArch), True);
        end;
      end;
    end;

    fpCopiarArchivo.ModalResult := mrOK;
    tbDesSeleccionarTodoClick(nil);
  end;
end;

procedure TfrmControlDeEnvioNotasDenuncia.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if ((sdqConsulta.FieldByName('NE_IDTIPODENUNCIA').asInteger = 8) or
       (sdqConsulta.FieldByName('NE_IDTIPODENUNCIA').asInteger = 9)) and Existesql('SELECT 1 '+
                    '  FROM hys.hne_notasdenunciaenvio, afi.aco_contrato, afi.aem_empresa '+
                    ' WHERE em_id = co_idempresa AND ne_contrato = co_contrato AND ne_id = '+sdqConsulta.fieldbyname('ne_id').AsString+
                    ' and art.hys.get_tipo_empresa (em_cuit, NULL) in (''ET'',''EP'')') then
    begin
      if ExisteSql( ' SELECT 1 '+
                    '   FROM hys.hne_notasdenunciaenvio, afi.aco_contrato, afi.aem_empresa '+
                    '  WHERE ne_id = '+SqlValue(sdqConsulta.FieldByName('ne_id').AsInteger)+
                    '    AND ne_contrato = co_contrato '+
                    '    AND co_idempresa = em_id '+
                    '    AND art.hys.get_tipo_estab_srt (em_cuit, ne_estableci) IN (''ET'', ''EP'') ') then

        Verificar(not ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hee_eventoempresa, '+
          '        hys.hne_notasdenunciaenvio, '+
          '        afi.aem_empresa, '+
          '        afi.aco_contrato '+
          '  WHERE ee_idtipoevento IN (1, 2) '+
          '    AND ee_cuit = em_cuit '+
          '    AND ee_fechabaja IS NULL '+
          '    AND em_id = co_idempresa '+
          '    AND co_contrato = ne_contrato '+
          '    AND ne_operativo = ee_operativo '+
          '    AND ne_id = '+SqlValue(sdqConsulta.FieldByName('ne_id').AsInteger)),Grid,'No tiene cargado la notificación de ET/EP');
    end;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('ne_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('ne_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('ne_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmControlDeEnvioNotasDenuncia.FSFormDestroy(Sender: TObject);
begin
  inherited;
  SelectedList.Free;
end;

procedure TfrmControlDeEnvioNotasDenuncia.GridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ne_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;     
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbDesSeleccionarTodoClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
  valida : Boolean;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ne_id').AsString);
        if ((sdqConsulta.FieldByName('NE_IDTIPODENUNCIA').asInteger = 8) or
           (sdqConsulta.FieldByName('NE_IDTIPODENUNCIA').asInteger = 9)) and
           Existesql('SELECT 1 '+
                    '  FROM hys.hne_notasdenunciaenvio, afi.aco_contrato, afi.aem_empresa '+
                    ' WHERE em_id = co_idempresa AND ne_contrato = co_contrato AND ne_id = '+sdqConsulta.fieldbyname('ne_id').AsString+
                    ' and art.hys.get_tipo_empresa (em_cuit, NULL) in (''ET'',''EP'')') and
           not ExisteSql(
            ' SELECT 1 '+
            '   FROM hys.hee_eventoempresa, '+
            '        hys.hne_notasdenunciaenvio, '+
            '        afi.aem_empresa, '+
            '        afi.aco_contrato '+
            '  WHERE ee_idtipoevento IN (1, 2) '+
            '    AND ee_cuit = em_cuit '+
            '    AND ee_fechabaja IS NULL '+
            '    AND em_id = co_idempresa '+
            '    AND co_contrato = ne_contrato '+
            '    AND ne_operativo = ee_operativo '+
            '    AND ne_id = '+SqlValue(sdqConsulta.FieldByName('ne_id').AsInteger)) and
           ExisteSql( ' SELECT 1 '+
                      '   FROM hys.hne_notasdenunciaenvio, afi.aco_contrato, afi.aem_empresa '+
                      '  WHERE ne_id = '+SqlValue(sdqConsulta.FieldByName('ne_id').AsInteger)+
                      '    AND ne_contrato = co_contrato '+
                      '    AND co_idempresa = em_id '+
                      '    AND art.hys.get_tipo_estab_srt (em_cuit, ne_estableci) IN (''ET'', ''EP'') ')  then
        begin
          valida := false;
        end
        else
          valida := true;
        if (i = -1) and valida then
          SelectedList.AddObject(sdqConsulta.fieldbyname('ne_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;

end;

procedure TfrmControlDeEnvioNotasDenuncia.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbReprocesarClick(
  Sender: TObject);
begin
  if sdqConsulta.FieldByName('ne_idtipodenuncia').AsInteger = 2 then
  begin
    with TrptNotaDenunciaRiesgoInvalido.Create(Self) do
    try
      Load(sdqConsulta.fieldbyname('em_cuit').AsString);
    finally
      Free;
    end;
  end;
end;

procedure TfrmControlDeEnvioNotasDenuncia.tbAprobarDenunciaClick(
  Sender: TObject);
var
  j : integer;
  idNota : String;
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox('¿ Desea aprobar los registros seleccionados ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  BEGIN
    for j:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[j]);
      idNota := SelectedList.Strings[j];
      if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio WHERE ne_idtipodenuncia IN (12) AND ne_id = '+SqlValue(idNota)) then
      begin
        AprobarProgramaSeguridadOAvisoObra(strtoint(idNota),True,False);
      end
      else if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio WHERE ne_idtipodenuncia IN (11) AND ne_id = '+SqlValue(idNota)) then
      begin
        AprobarProgramaSeguridadOAvisoObra(strtoint(idNota),True,True);
      end;

      EjecutarSql('UPDATE hys.hne_notasdenunciaenvio SET NE_ESTADO = ''A'', ne_usumodif ='+ SqlValue(Sesion.UserID)+
                  ' , ne_fechamodif = SYSDATE WHERE NE_ESTADO = ''P''  AND NE_ID = '+SqlValue(idNota));

    end;
     tbDesSeleccionarTodoClick(nil);
  END;

end;

procedure TfrmControlDeEnvioNotasDenuncia.tbRechazarClick(Sender: TObject);
var
  j : integer;
  idNota : String;
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox('¿ Desea Rechazar los registros seleccionados ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  BEGIN
    for j:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[j]);
      idNota := SelectedList.Strings[j];

      EjecutarSql('UPDATE hys.hne_notasdenunciaenvio SET NE_ESTADO = ''R'', ne_usumodif ='+ SqlValue(Sesion.UserID)+
                  ' , ne_fechamodif = SYSDATE WHERE NE_ESTADO = ''P''  AND NE_ID = '+SqlValue(idNota));

    end;
     tbDesSeleccionarTodoClick(nil);
  END;
end;

procedure TfrmControlDeEnvioNotasDenuncia.AprobarProgramaSeguridadOAvisoObra(idnota : Integer;Progseg, PresTardia : Boolean);
var
 sSql, cuit,contrato, telefono,empresa,estableci, domicilio, PathPDFNotifiacion :String;
 nroEstableci : Integer;
 EnvioSrt : TEnvioArchivosSRT;
 ResultadoSrt : TResultArchivosSrt;
begin
  sSql :=
    ' SELECT ne_id, ne_estableci, em_nombre, em_cuit, co_contrato, es_nroestableci, '+
    '        (''('' || dc_codareatelefonos || '') '' || dc_telefonos) AS dc_telefonos, '+
    '        (  es_calle '+
    '         || '' '' '+
    '         || es_numero '+
    '         || '' '' '+
    '         || NVL2 (es_piso, ''PISO '' || es_piso || '' '', '''') '+
    '         || NVL2 (es_departamento, ''DEPARTAMENTO '' || es_departamento, '''')'+
    '         || CHR (10) || es_localidad || ''  '' ||  pv_descripcion '+
    '            ) AS domicilio, '+
    '        (es_nroestableci || '' - '' || es_nombre) AS es_nombre '+
    '   FROM hys.hne_notasdenunciaenvio, '+
    '        afi.aco_contrato, '+
    '        afi.aem_empresa, '+
    '        afi.aes_establecimiento aes, '+
    '        afi.adc_domiciliocontrato, '+
    '        art.cpv_provincias '+
    '  WHERE ne_contrato = co_contrato '+
    '    AND co_idempresa = em_id '+
    '    AND co_contrato = aes.es_contrato '+
    '    AND aes.es_fechabaja IS NULL '+
    '    AND co_contrato = dc_contrato '+
    '    AND dc_tipo = ''L'' '+
    '    AND es_provincia = pv_codigo(+) '+
    '    AND aes.es_nroestableci = ne_estableci '+
    '    AND ne_id = '+sqlvalue(idnota);
  with GetQuery(sSQL) do
  try
    empresa      := FieldByName('em_nombre').AsString;//Nombre de la empresa(em_nombre)
    cuit         := FieldByName('em_cuit').AsString;
    contrato     := FieldByName('co_contrato').AsString;
    telefono     := FieldByName('dc_telefonos').AsString;
    nroEstableci := FieldByName('es_nroestableci').AsInteger;
    estableci    := FieldByName('es_nombre').AsString;//Nombre del establecimiento(es_nombre)
    domicilio    := FieldByName('domicilio').AsString;//Domicilio del establecimiento (domicilio)
  finally
    Free;
  end;
  with TrptNotificacion.Create(Self) do
  try
    if Progseg then
    begin
      if PresTardia then
        Load(empresa,cuit,contrato,telefono, estableci, domicilio, 2)
      else
        Load(empresa,cuit,contrato,telefono, estableci, domicilio, 0);

    end
    else
      Load(empresa,cuit,contrato,telefono, estableci, domicilio, 1);
    qrResolucion.Prepare;
    PathPDFNotifiacion := TempPath + cuit+'-'+IntToStr(nroEstableci)+'Notificacion.pdf';
    //if FileExists(PathPDFNotifiacion) then
    //begin
    //  DeleteFile(PathPDFNotifiacion);
    //end;
    ExportarPDF(qrResolucion, PathPDFNotifiacion);
  finally
    Free;
  end;
  EnviarMailBD('','Provincia ART - Notificación y Actividades',
                           [oAlwaysShowDialog,oShowDialogIfEmpty,oAutoFirma],
                            '', GetAttachments(PathPDFNotifiacion, 0),StrToInt(contrato),tcDefault,False );

  setLength( EnvioSrt.Archivos,1);
  setLength( EnvioSrt.Cuits,1);
  EnvioSrt.Archivos[0] := PathPDFNotifiacion;
  EnvioSrt.Cuits[0] := cuit;
  if Progseg then
    if PresTardia then
    begin
       EnvioSrt.Comunicacion := 'Estimado cliente, '+chr(13)+chr(10)+
                             '      Se adjunta nota notificando la presentación tardía del Programa de Seguridad..'+
                             'Cordialmente.'
    end
    else
    begin
    EnvioSrt.Comunicacion := 'Estimado cliente, '+chr(13)+chr(10)+
                             '      Se adjunta nota solicitando la presentación del Programa de Seguridad.'+
                             'Cordialmente.'
    end
  else
    EnvioSrt.Comunicacion := 'Estimado cliente, '+chr(13)+chr(10)+
                             '      Se adjunta nota solicitando la presentación del Aviso de Obra firmado.'+
                             'Cordialmente.';
  EnvioSrt.TipoComunicacion := 9;
  EnvioSrt.IdConsulta := GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');
  EnvioSrt.IdCarta := -1;

  ResultadoSrt := EnviarCartaSRT(EnvioSrt);
  if not ResultadoSrt.EnvioCorrecto then
    MsgBox(resultadosrt.Error,MB_OK,'Error envio ventanilla');

end;

function TfrmControlDeEnvioNotasDenuncia.ArmarFiltroEstab(
  Establecimientos: string): string;
var
    i, j: integer;
    cotaMenor, cotaMayor: integer;
    tmpValores: string;
begin
    while (pos('-', Establecimientos) > 0) do
    begin
        i:= pos('-', Establecimientos);
        while (i > 0) and (Establecimientos[i] <> ',') do
            i := i - 1;

        cotaMenor := strtoint(copy(Establecimientos, i+1, pos('-', Establecimientos)-1 - i ));

        i:= pos('-', Establecimientos);
        while (i <= length(Establecimientos)) and (Establecimientos[i] <> ',') do
            i := i + 1;
        cotaMayor := strtoint(copy(Establecimientos, pos('-', Establecimientos)+1, i-1 - pos('-', Establecimientos)));

        tmpValores := '';

        for j:=cotaMenor to cotaMayor do
            tmpValores := tmpValores + ',' + IntToStr(j);

        Establecimientos := StringReplace(Establecimientos, '-', tmpValores + ',', []);
    end;

    result := Establecimientos;
end;

end.
