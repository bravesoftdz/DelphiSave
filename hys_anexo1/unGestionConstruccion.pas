unit unGestionConstruccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, DBCtrls, StdCtrls, ExtCtrls, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, unRptNotificacion,
  Menus, PatternEdit, unArtDbFrame, unFraEmpresa, unfraCtbTablas, unGrids;

type
  TfrmGestionConstruccion = class(TfrmCustomGridABM)
    edFecha: TDateComboBox;
    Label1: TLabel;
    edObservacion: TRichEdit;
    ToolButton1: TToolButton;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodos: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    rgAvisodeObra: TRadioGroup;
    fraResolucion: TfraCodigoDescripcion;
    lblRiesgos: TLabel;
    pmnuOrden: TPopupMenu;
    mnuOrdSinOrdenRec: TMenuItem;
    N1: TMenuItem;
    mnuOrdEmpresa: TMenuItem;
    fraEmpresaFiltro: TfraEmpresa;
    Label19: TLabel;
    edEstablecimiento: TPatternEdit;
    Label14: TLabel;
    Label16: TLabel;
    edNombreEstableci: TPatternEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edFechaReclamoDesde: TDateComboBox;
    edFechaReclamoHasta: TDateComboBox;
    Label2: TLabel;
    fraObservacion: TfraCodigoDescripcion;
    cbSinReclamos: TCheckBox;
    Label6: TLabel;
    fraObservacionFiltro: TfraCodigoDescripcion;
    cbImprimirReclamos: TCheckBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    edFechaVencimientoDesde: TDateComboBox;
    edFechaVencimientoHasta: TDateComboBox;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaES_LOCALIDAD: TStringField;
    sdqConsultaES_PROVINCIA: TStringField;
    sdqConsultaPV_DESCRIPCION: TStringField;
    sdqConsultaFECHARECLAMO: TDateTimeField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaES_NROESTABLECI: TFloatField;
    sdqConsultaOR_DESCRIPCION: TStringField;
    sdqConsultaOBSERVACION: TStringField;
    sdqConsultaFECHAVENC: TDateTimeField;
    sdqConsultaSELECTED: TStringField;
    sdqConsultaID: TFloatField;
    sdqConsultaDC_TELEFONOS: TStringField;
    fraTipoFiltroSRT: TfraCtbTablas;
    Label3: TLabel;
    sdqConsultaTIPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodosClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbImprimirSeleccionadosClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuOrdEmpresaClick(Sender: TObject);
    procedure mnuOrdSinOrdenRecClick(Sender: TObject);
    procedure rgAvisodeObraClick(Sender: TObject);
  private
    { Private declarations }
    FAviso : Integer;
    SelectedList: TBookMarkLst;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmGestionConstruccion: TfrmGestionConstruccion;

implementation
  uses
    SqlOracle, unCustomConsulta, unDmPrincipal, SqlFuncs, CustomDlgs, VclExtra,
    unVisualizador, unRptActividades, unRptActividades51,  ArchFuncs, unExportPDF,
  unMoldeEnvioMail;

{$R *.dfm}

{ TfrmGestionConstruccion }

procedure TfrmGestionConstruccion.ClearControls;
begin
  inherited;
  edFecha.Clear;
  edObservacion.Clear;
end;

function TfrmGestionConstruccion.DoABM: Boolean;
var
 sSQL, cuit,contrato, telefono,empresa,estableci, domicilio, resolucion,
 tipo, operativo, PathPDFNotifiacion, PathActividad{, localidad, provincia} : string;
 i, nroEstableci : Integer;
 ArchivosPdf : TArrayOfAttach;
begin
  Sql.Clear;
  BeginTrans(True);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if FAviso = 0 then
      begin
        Sql.TableName := 'ART.pao_avisoobra';
        Sql.PrimaryKey.Add('ao_id',SelectedList.Strings[i]);
        Sql.Fields.Add('ao_fechareclamo',edFecha.Date);
        Sql.Fields.Add('ao_observacionesreclamo',edObservacion.Text);
        Sql.Fields.Add('ao_observacionid',fraObservacion.Codigo);
        sSQL :=
          ' SELECT aem.em_nombre, em_cuit, co_contrato, es_nroestableci,'+
          '        (''('' || DC_CODAREATELEFONOS || '') '' || dc_telefonos '+
          '        ) AS dc_telefonos, (es_nroestableci||'' - '' || es_nombre) as es_nombre, '+
          '         (  es_calle '+
          '         || '' '' '+
          '         || es_numero '+
          '         || '' '' '+
          '         || NVL2 (es_piso, ''PISO '' || es_piso || '' '', '''') '+
          '         || NVL2 (es_departamento, ''DEPARTAMENTO '' || es_departamento, '''')'+
          '         || CHR (10) || es_localidad || ''  '' ||  pv_descripcion '+
          '            ) AS domicilio,ao_tipo as tipo, ao_operativo as operativo, '+
          '        es_localidad, pv_descripcion '+
          '   FROM afi.aem_empresa aem, '+
          '        afi.aco_contrato aco, '+
          '        afi.aes_establecimiento aes, '+
          '        afi.adc_domiciliocontrato, '+
          '        art.pao_avisoobra, '+
          '        art.cpv_provincias '+
          '  WHERE co_contrato = art.get_vultcontrato (em_cuit) '+
          '    AND aem.em_id = aco.co_idempresa '+
          '    AND aco.co_contrato = aes.es_contrato '+
          '    AND aco.co_contrato = dc_contrato '+
          '    AND dc_tipo = ''L'' '+
          '    AND aes.es_fechabaja IS NULL '+
          '    AND NVL (co_estado, '''') = ''1'' '+
          '    AND ao_id = '+SqlValue(SelectedList.Strings[i])+
          '    AND ao_cuit = em_cuit '+
          '    AND es_provincia = pv_codigo(+) '+
          '    AND ao_estableci = aes.es_nroestableci ';
      end
      else if FAviso = 1 then
      begin
        Sql.TableName := 'hys.hps_programaseguridad';
        Sql.PrimaryKey.Add('ps_id',SelectedList.Strings[i]);
        Sql.Fields.Add('ps_fechareclamo',edFecha.Date);
        Sql.Fields.Add('ps_observacionreclamo',edObservacion.Text);
        Sql.Fields.Add('ps_observacionid',fraObservacion.Codigo);
        sSQL :=
          ' SELECT aem.em_nombre, em_cuit, co_contrato, , es_nroestableci'+
          '        (''('' || DC_CODAREATELEFONOS || '') '' || dc_telefonos '+
          '        ) AS dc_telefonos, (es_nroestableci ||'' - '' || es_nombre) as es_nombre, '+
          '         (  es_calle '+
          '         || '' '' '+
          '         || es_numero '+
          '         || '' '' '+
          '         || NVL2 (es_piso, ''PISO '' || es_piso || '' '', '''') '+
          '         || NVL2 (es_departamento, ''DEPARTAMENTO '' || es_departamento, '''')'+
          '         || CHR (10) || es_localidad || ''  '' ||  pv_descripcion '+
          '            ) AS domicilio, ps_resolucion, '+
          '        art.hys.get_tipo_estab_srt(em_cuit, es_nroestableci) AS tipo, '+
          '        art.hys.get_operativovigente_empresa(em_cuit) AS operativo '+
          '        es_localidad,  pv_descripcion '+
          '   FROM afi.aem_empresa aem, '+
          '        afi.aco_contrato aco, '+
          '        afi.aes_establecimiento aes, '+
          '        afi.adc_domiciliocontrato, '+
          '        hys.hps_programaseguridad, '+
          '        art.cpv_provincias '+
          '  WHERE co_contrato = art.get_vultcontrato (em_cuit) '+
          '    AND aem.em_id = aco.co_idempresa '+
          '    AND aco.co_contrato = aes.es_contrato '+
          '    AND aes.es_fechabaja IS NULL '+
          '    AND aco.co_contrato = dc_contrato '+
          '    AND dc_tipo = ''L'' '+
          '    AND NVL (co_estado, '''') = ''1'' '+
          '    AND es_provincia = pv_codigo(+) '+
          '    AND ps_id = '+SqlValue(SelectedList.Strings[i])+
          '    AND ps_cuit = em_cuit '+
          '    AND ps_establecimiento = aes.es_nroestableci ';
      end;
      Sql.SqlType := stUpdate;
      EjecutarSQLST(Sql.Sql);
      with GetQuery(sSQL) do
      try
        empresa      := FieldByName('em_nombre').AsString;//Nombre de la empresa(em_nombre)
        cuit         := FieldByName('em_cuit').AsString;
        contrato     := FieldByName('co_contrato').AsString;
        telefono     := FieldByName('dc_telefonos').AsString;
        nroEstableci := FieldByName('es_nroestableci').AsInteger;
        estableci    := FieldByName('es_nombre').AsString;//Nombre del establecimiento(es_nombre)
        domicilio    := FieldByName('domicilio').AsString;//Domicilio del establecimiento (domicilio)
        tipo         := FieldByName('tipo').AsString;
        operativo    := FieldByName('operativo').AsString;
        if FAviso = 1 then
          resolucion := fieldByName('ps_resolucion').AsString
        else
          resolucion := '';
        //localidad := FieldByName('es_localidad').AsString;//Localidad del establecimiento (es_localidad)
        //provincia := FieldByName('pv_descripcion').AsString;//Provincia donde se encuentra el establecimiento(pv_descripcion)
      finally
        Free;
      end;
      with TrptNotificacion.Create(Self) do
      try
        Load(empresa,cuit,contrato,telefono, estableci, domicilio, FAviso);
        qrResolucion.Prepare;
        if cbImprimirReclamos.Checked then
          qrResolucion.Print
        else
        begin
          //Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
          PathPDFNotifiacion := TempPath +'Notificacion.pdf';
          if FileExists(PathPDFNotifiacion) then
          begin
            DeleteFile(PathPDFNotifiacion);
          end;
          ExportarPDF(qrResolucion, PathPDFNotifiacion);
        end;
      finally
        Free;
      end;
      if (resolucion = '2') or (Resolucion = '3') or (Resolucion = '') then
      begin
        with TrptActividades51.Create(Self) do
        try
          cambioResolucion(Resolucion);
          PathActividad := GuardarenPDF(cuit, nroEstableci, tipo, operativo);
          //Load(cuit, nroEstableci, tipo, operativo);
        finally
          Free;
        end;
      end
      else
      if resolucion = '1' then
      begin
        with TrptActividades.Create(Self) do
        try
          PathActividad := GuardarenPDF(cuit, nroEstableci, tipo, operativo);
        finally
          Free;
        end;
      end;
      Sql.Clear;
      sSQL := '';
    end;
    SetLength(ArchivosPdf,2);
    ArchivosPdf[0] := GetAttach(PathPDFNotifiacion,0);
    ArchivosPdf[1] := GetAttach(PathActividad,0);
    EnviarMailBD('','Provincia ART - Notificación y Actividades',
                           [oAlwaysShowDialog,oShowDialogIfEmpty,oAutoFirma,oDeleteAttach],
                            '', ArchivosPdf,StrToInt(contrato),tcDefault,False );

    CommitTrans(True);
    SelectedList.Clear;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al imprimir preventores Referentes.');
    end;
  end;
  result:= true;

end;

procedure TfrmGestionConstruccion.FormCreate(Sender: TObject);
begin
  //sdqConsulta.ParamByName('resolucion').AsString := '';
  SelectedList := TBookMarkLst.Create;
  FAviso := -1;

  fraTipoFiltroSRT.Clave := 'TFET';

  with fraResolucion do
  begin
    TableName   := 'hys.hor_obrasresolucion';
    FieldID     := 'or_id';
    FieldCodigo := 'or_id';
    FieldDesc   := 'or_descripcion';
    Showbajas   := true;
    FieldBaja   := 'or_fechabaja';
  end;
  with fraObservacion do
  begin
    TableName   := 'hys.hor_observacionreclamo';
    FieldID     := 'or_codigo';
    FieldCodigo := 'or_codigo';
    FieldDesc   := 'or_descripcion';
    Showbajas   := false;
    FieldBaja   := 'or_fechabaja';
  end;
  with fraObservacionFiltro do
  begin
    TableName   := 'hys.hor_observacionreclamo';
    FieldID     := 'or_codigo';
    FieldCodigo := 'or_codigo';
    FieldDesc   := 'or_descripcion';
    Showbajas   := true;
    FieldBaja   := 'or_fechabaja';
  end;
  cbSinReclamos.Checked := True;

  inherited;
end;

procedure TfrmGestionConstruccion.LoadControls;
begin
  inherited;
  //asd
end;

function TfrmGestionConstruccion.Validar: Boolean;
begin
  Verificar(edFecha.Date = 0, edFecha, 'No Puede estar vacia la fecha de reclamo.');
  result:= true;
end;

procedure TfrmGestionConstruccion.tbRefrescarClick(Sender: TObject);
var
  sSQL : string;

begin
  if rgAvisodeObra.ItemIndex = 0  then
  begin
    sSQL :=
      ' SELECT aem.em_nombre, es_nombre, '+
      '        NVL (es_domicilio, '+
      '             art.afi.armar_domicilio (es_calle, '+
      '                                      es_numero, '+
      '                                      es_piso, '+
      '                                      es_departamento, '+
      '                                      es_localidad '+
      '                                     ) '+
      '            ) AS domicilio, '+
      '        es_localidad, es_provincia, pv_descripcion, ao_id as id, ao_fechareclamo as fechareclamo,'+
      '        co_contrato, em_cuit, es_nroestableci, or_descripcion, ao_observacionesreclamo as observacion,'+
      '        ao_fechavencprog as fechavenc,dc_telefonos, ao_tipo tipo '+
      '   FROM afi.aem_empresa aem, '+
      '        afi.aco_contrato aco, '+
      '        afi.aes_establecimiento aes, '+
      '        afi.adc_domiciliocontrato, '+
      '        art.pao_avisoobra, '+
      '        art.cpv_provincias, '+
      '        hys.hor_observacionreclamo '+
      '  WHERE co_contrato = art.get_vultcontrato (em_cuit) '+
      '    AND aem.em_id = aco.co_idempresa '+
      '    AND aco.co_contrato = aes.es_contrato '+
      '    AND aco.co_contrato = dc_contrato '+
      '    AND dc_tipo = ''L'' '+
      '    AND aes.es_fechabaja IS NULL '+
      '    AND NVL (co_estado, '''') = ''1'' '+
      '    AND es_provincia = pv_codigo(+) '+
      '    AND ao_observacionid = or_codigo(+) '+
      '    AND ao_fechabaja IS NULL '+
      '    AND ao_requiereprog = ''S'' '+
      '    AND ao_cuit = em_cuit '+
      '    AND ao_estableci = aes.es_nroestableci '+
      '    AND NOT EXISTS ( '+
      '                  SELECT 1 '+
      '                    FROM hys.hps_programaseguridad '+
      '                   WHERE ao_cuit = ps_cuit '+
      '                     AND ao_estableci = ps_establecimiento '+
      '                     AND ps_fechabaja IS NULL) ';
    if edFechaReclamoDesde.Date <> 0 then
      sSQL := sSQL + ' AND ao_fechareclamo >= '+SqlDate(edFechaReclamoDesde.Date);
    if edFechaReclamoHasta.Date <> 0 then
      sSQL := sSQL + ' AND ao_fechareclamo <= '+SqlDate(edFechaReclamoHasta.Date);
    if edFechaVencimientoDesde.Date <> 0 then
      sSQL := sSQL + ' AND AO_FECHAVENCPROG >= '+SqlDate(edFechaVencimientoDesde.Date);
    if edFechaVencimientoHasta.Date <> 0 then
      sSQL := sSQL + ' AND AO_FECHAVENCPROG <= '+SqlDate(edFechaVencimientoHasta.Date);
    if not fraEmpresaFiltro.IsEmpty then
      sSQL := sSQL + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
    if edEstablecimiento.Text <> '' then
      sSQL := sSQL + ' AND es_nroestableci = '+SqlValue(edEstablecimiento.Text);
    if edNombreEstableci.Text <> '' then
      sSQL := sSQL + ' AND es_nombre like ''%'+edNombreEstableci.Text+'%''';
    if not fraResolucion.IsEmpty then
      sSQL := sSQL + ' AND ao_nroresolucion = '+ SqlValue(fraResolucion.Codigo);
    if not fraObservacionFiltro.IsEmpty then
      sSQL := sSQL + ' AND ao_observacionid = '+ sqlvalue(fraObservacionFiltro.Codigo);
    if cbSinReclamos.Checked then
      sSQL := sSQL + ' AND ao_fechareclamo is null ';
    if fraTipoFiltroSRT.IsSelected then
      sSQL := sSQL + ' AND ao_tipo = '+SqlValue(fraTipoFiltroSRT.Codigo);
    sdqConsulta.SQL.Text := sSQL;
  end
  else if rgAvisodeObra.ItemIndex = 1 then
  begin
    sSQL :=
      ' SELECT aem.em_nombre, es_nombre, '+
      '        NVL (es_domicilio, '+
      '             art.afi.armar_domicilio (es_calle, '+
      '                                      es_numero, '+
      '                                      es_piso, '+
      '                                      es_departamento, '+
      '                                      es_localidad '+
      '                                     ) '+
      '            ) AS domicilio, '+
      '        es_localidad, es_provincia, pv_descripcion, ps_id as id, ps_fechareclamo as fechareclamo,'+
      '        co_contrato, em_cuit, es_nroestableci, or_descripcion, ps_observacionreclamo as observacion, '+
      '        to_date(NULL, ''dd/mm/yyyy'') as fechavenc, dc_telefonos, (SELECT ep_tipo FROM hys.hep_estabporpreventor '+
      '   WHERE ep_cuit = ps_cuit AND ep_estableci = ps_establecimiento) tipo '+
      '   FROM afi.aem_empresa aem, '+
      '        afi.aco_contrato aco, '+
      '        afi.aes_establecimiento aes, '+
      '        afi.adc_domiciliocontrato, '+
      '        hys.hps_programaseguridad, '+
      '        art.cpv_provincias, '+
      '        hys.hor_observacionreclamo '+
      '  WHERE co_contrato = art.get_vultcontrato (em_cuit) '+
      '    AND aem.em_id = aco.co_idempresa '+
      '    AND aco.co_contrato = aes.es_contrato '+
      '    AND aco.co_contrato = dc_contrato '+
      '    AND dc_tipo = ''L'' '+
      '    AND aes.es_fechabaja IS NULL '+
      '    AND NVL (co_estado, '''') = ''1'' '+
      '    AND es_provincia = pv_codigo(+) '+
      '    AND ps_observacionid = or_codigo(+) '+
      '    AND ps_fechabaja IS NULL '+
      '    AND ps_cuit = em_cuit '+
      '    AND ps_establecimiento = aes.es_nroestableci '+
      '    AND NOT EXISTS ( '+
      '                  SELECT 1 '+
      '                    FROM art.pao_avisoobra '+
      '                   WHERE ao_cuit = ps_cuit '+
      '                     AND ao_estableci = ps_establecimiento '+
      '                     AND ao_fechabaja IS NULL) ';
    if edFechaReclamoDesde.Date <> 0 then
      sSQL := sSQL + ' AND ps_fechareclamo >= '+SqlDate(edFechaReclamoDesde.Date);
    if edFechaReclamoHasta.Date <> 0 then
      sSQL := sSQL + ' AND ps_fechareclamo <= '+SqlDate(edFechaReclamoHasta.Date);
    if not fraEmpresaFiltro.IsEmpty then
      sSQL := sSQL + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
    if edEstablecimiento.Text <> '' then
      sSQL := sSQL + ' AND es_nroestableci = '+SqlValue(edEstablecimiento.Text);
    if edNombreEstableci.Text <> '' then
      sSQL := sSQL + ' AND es_nombre like ''%'+edNombreEstableci.Text+'%''';
    if not fraResolucion.IsEmpty then
      sSQL := sSQL + '    AND ps_resolucion = '+ SqlValue(fraResolucion.Codigo);
    if not fraObservacionFiltro.IsEmpty then
      sSQL := sSQL + ' AND ps_observacionid = '+ sqlvalue(fraObservacionFiltro.Codigo);
    if cbSinReclamos.Checked then
      sSQL := sSQL + ' AND ps_fechareclamo is null ';
    sdqConsulta.SQL.Text := sSQL;
  end;
  FAviso := rgAvisodeObra.ItemIndex;
  SelectedList.Clear;
  inherited;
end;

procedure TfrmGestionConstruccion.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('id').AsString, sdqConsulta.GetBookmark)
    else begin
      {$IFDEF VER150}
      sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[SelectedList.IndexOf(sdqConsulta.fieldbyname('id').AsString)]));
      {$ENDIF}
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.fieldbyname('id').AsString));
    end;
    Column.Grid.Refresh;
  end;
end;

procedure TfrmGestionConstruccion.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmGestionConstruccion.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGestionConstruccion.tbDesSeleccionarTodoClick(
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

procedure TfrmGestionConstruccion.tbSeleccionarTodosClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('id').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmGestionConstruccion.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmGestionConstruccion.tbImprimirSeleccionadosClick(
  Sender: TObject);
begin
  ModoABM := maModificacion;
  ModoABMToSqlType;
  LoadControls;
  fpABM.Caption := CAPTION_MODIFIC;
  edFecha.Date := DBDate;
  fpABM.ShowModal;
end;

procedure TfrmGestionConstruccion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if FAviso = 0 then
  begin
    if not sdqConsulta.FieldByName('fechareclamo').IsNull then
      AFont.Color := clBlue;
  end
  else if FAviso = 1 then
  begin
    if not sdqConsulta.FieldByName('fechareclamo').IsNull then
      AFont.Color := clBlue;
  end;


end;

procedure TfrmGestionConstruccion.mnuOrdEmpresaClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, DBGrid, 'No hay nada seleccionado.');
  tbImprimirSeleccionadosClick(nil);
end;

procedure TfrmGestionConstruccion.mnuOrdSinOrdenRecClick(Sender: TObject);
begin
  tbImprimirClick(nil);
end;

procedure TfrmGestionConstruccion.rgAvisodeObraClick(Sender: TObject);
begin
  if rgAvisodeObra.ItemIndex = 0 then
    VCLExtra.LockControls([edFechaVencimientoDesde, edFechaVencimientoHasta], false)
  else if rgAvisodeObra.ItemIndex = 1 then
  begin
    VCLExtra.LockControls([edFechaVencimientoDesde, edFechaVencimientoHasta], true);
    edFechaVencimientoDesde.Date := 0;
    edFechaVencimientoHasta.Date := 0;
  end;
end;

end.
