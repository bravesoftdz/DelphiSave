unit unImpresionRelevamientoRiesgosLaborales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  unfraEstablecimientoDomic, Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unGrids, AcroPDFLib_TLB,
  unRelevGestion463, unExportPDF;

type
  TfrmImpresionRelevamientoRiesgosLaborales = class(TfrmCustomConsulta)
    fraEmpresaFiltro: TfraEmpresa;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    Label1: TLabel;
    fraEstablecimientoFiltro: TfraEstablecimientoDomic;
    cbEmpleadorFiltro: TCheckBox;
    cbPreventorFiltro: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edFechaFormularioDesde: TDateComboBox;
    edFechaFormularioHasta: TDateComboBox;
    sdqConsultaRL_ID: TFloatField;
    sdqConsultaRL_CONTRATO: TFloatField;
    sdqConsultaRL_ESTABLECI: TFloatField;
    sdqConsultaRL_FECHARECEPCION: TDateTimeField;
    sdqConsultaRL_VALIDO: TStringField;
    sdqConsultaRL_VIGENCIA: TStringField;
    sdqConsultaRL_FECHAALTA: TDateTimeField;
    sdqConsultaRL_USUALTA: TStringField;
    sdqConsultaRL_PROCEDENCIA: TStringField;
    sdqConsultaPROCEDENCIA: TStringField;
    sdqConsultaSELECTED: TStringField;
    tbDesmarcarSeleccion: TToolButton;
    tbSeleccionarTodo: TToolButton;
    tbProcesarTodo: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbGenerarArchivo: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbDesmarcarSeleccionClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbProcesarTodoClick(Sender: TObject);
    procedure tbGenerarArchivoClick(Sender: TObject);
  private
    { Private declarations }
    SelectedList: TBookMarkLst;
    procedure OnEmpresaChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmImpresionRelevamientoRiesgosLaborales: TfrmImpresionRelevamientoRiesgosLaborales;


implementation

{$R *.dfm}

uses
  AnsiSql, unComunesFet, unVisorPDF, unDmprincipal;

procedure TfrmImpresionRelevamientoRiesgosLaborales.FormCreate(Sender: TObject);
begin
  inherited;
  SelectedList := TBookMarkLst.Create;
  With fraEmpresaFiltro do
  begin
    OnChange   := OnEmpresaChange;
    ShowBajas  := True;
  end;
  tbSalir.Left := tbGenerarArchivo.Left+10;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.FSFormDestroy(
  Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.GridCellClick(
  Column: TColumn);
var
 i :integer;
begin
  inherited;
  if Assigned(Column.Field) then
    if (Column.Field.FieldName = 'SELECTED') then
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('RL_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('RL_ID').AsString, sdqConsulta.GetBookmark)
      else begin
        {$IFDEF VER150}
        sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
        {$ENDIF}
        SelectedList.Delete(i);
      end;
      Column.Grid.Refresh;
    end;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.GridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('RL_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimientoFiltro.CUIT := fraEmpresaFiltro.mskCUIT.Text;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbDesmarcarSeleccionClick(
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
  Grid.Refresh;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbGenerarArchivoClick(
  Sender: TObject);
var
  i : Integer;
  PathDest : string;
  pathArch : String;
  pathQrp, pathDestino  : String;
begin
  inherited;

  for i:=0 to SelectedList.Count-1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
    pathdest := ArmarPathRelev463(sdqConsulta.FieldByName('rl_contrato').AsString,sdqConsulta.FieldByName('rl_vigencia').AsString,
                      sdqConsulta.FieldByName('rl_estableci').AsInteger);
    pathArch := sdqConsulta.FieldByName('rl_contrato').AsString +'_'+
                ValorSql(
                ' SELECT es_id '+
                '   FROM afi.aes_establecimiento '+
                '  WHERE es_contrato = '+SqlValue(sdqConsulta.FieldByName('rl_contrato').AsString)+
                '    AND es_nroestableci = '+SqlValue(sdqConsulta.FieldByName('rl_estableci').AsInteger))+'_'+
                sdqConsulta.FieldByName('rl_vigencia').AsString;
    if not FileExists(pathArch) then
    begin
      if existesql('SELECT   1 ' +
                   '    FROM hys.hcr_cumplimientorelev hcr ' +
                   '   WHERE cr_contrato = '+SqlValue(sdqConsulta.FieldByName('rl_contrato').AsString)+
                   '     AND cr_fechaalta = (SELECT MAX (a.cr_fechaalta) ' +
                   '                           FROM hys.hcr_cumplimientorelev a ' +
                   '                          WHERE hcr.cr_contrato = a.cr_contrato) ' +
                   '                          and cr_estado = ''A'' ') then
      begin
        pathQrp := do_generar_rpt_463(sdqConsulta.FieldByName('rl_contrato').AsInteger, sdqConsulta.FieldByName('rl_estableci').AsInteger,
                                      sdqConsulta.FieldByName('rl_vigencia').AsString);
        pathDestino := ArmarPathRelev463(sdqConsulta.FieldByName('rl_contrato').AsString,sdqConsulta.FieldByName('rl_vigencia').AsString,
                                         sdqConsulta.FieldByName('rl_estableci').AsInteger);
        if not FileToPDFSvr(pathQrp, pathDestino, '', false) then
          raise Exception.Create('Error al generar el PDF');
      end;
    end;
  end;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbLimpiarClick(
  Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edFechaFormularioDesde.Clear;
  edFechaFormularioHasta.Clear;
  cbEmpleadorFiltro.Checked := False;
  cbPreventorFiltro.Checked := False;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbProcesarTodoClick(
  Sender: TObject);
var
  i : Integer;
  PathDest : string;
  pathArch : String;
  pathQrp, pathDestino  : String;
begin
  inherited;

  for i:=0 to SelectedList.Count-1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
    pathdest := ArmarPathRelev463(sdqConsulta.FieldByName('rl_contrato').AsString,sdqConsulta.FieldByName('rl_vigencia').AsString,
                      sdqConsulta.FieldByName('rl_estableci').AsInteger);
    pathArch := sdqConsulta.FieldByName('rl_contrato').AsString +'_'+
                ValorSql(
                ' SELECT es_id '+
                '   FROM afi.aes_establecimiento '+
                '  WHERE es_contrato = '+SqlValue(sdqConsulta.FieldByName('rl_contrato').AsString)+
                '    AND es_nroestableci = '+SqlValue(sdqConsulta.FieldByName('rl_estableci').AsInteger))+'_'+
                sdqConsulta.FieldByName('rl_vigencia').AsString;
    if not FileExists(pathArch) then
    begin
      if existesql('SELECT   1 ' +
                   '    FROM hys.hcr_cumplimientorelev hcr ' +
                   '   WHERE cr_contrato = '+SqlValue(sdqConsulta.FieldByName('rl_contrato').AsString)+
                   '     AND cr_fechaalta = (SELECT MAX (a.cr_fechaalta) ' +
                   '                           FROM hys.hcr_cumplimientorelev a ' +
                   '                          WHERE hcr.cr_contrato = a.cr_contrato) ' +
                   '                          and cr_estado = ''A'' ') then
      begin
        pathQrp := do_generar_rpt_463(sdqConsulta.FieldByName('rl_contrato').AsInteger, sdqConsulta.FieldByName('rl_estableci').AsInteger,
                                      sdqConsulta.FieldByName('rl_vigencia').AsString);
        pathDestino := ArmarPathRelev463(sdqConsulta.FieldByName('rl_contrato').AsString,sdqConsulta.FieldByName('rl_vigencia').AsString,
                                         sdqConsulta.FieldByName('rl_estableci').AsInteger);
        if not FileToPDFSvr(pathQrp, pathDestino, '', false) then
          raise Exception.Create('Error al generar el PDF');
      end;
    end;

    ImprimirPDF(ChangeFileExt(pathDest+pathArch, '.pdf'));
  end;
end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbRefrescarClick(
  Sender: TObject);
var
  sSql, sWhere : String;
begin
  SelectedList.Clear;
  sSql := ' SELECT rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_valido, '+
          '        rl_vigencia, rl_fechaalta, rl_usualta, rl_procedencia, '+
          '        DECODE (rl_procedencia, ''E'', ''Empleador'', ''P'', ''Preventor'') procedencia '+
          '   FROM hys.hrl_relevriesgolaboral '+
          '  WHERE 1 = 1 ';

  sWhere := '';

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND rl_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);

  if fraEstablecimientoFiltro.IsSelected then
    sWhere := sWhere +' AND rl_estableci = '+SqlValue(fraEstablecimientoFiltro.edCodigo.Text);

  if edFechaAltaDesde.Date <> 0 then
    sWhere := sWhere +' AND rl_fechaalta >= '+SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date <> 0 then
    sWhere := sWhere +' AND rl_fechaalta <= '+SqlValue(edFechaAltaHasta.Date);

  if edFechaRecepcionDesde.Date <> 0 then
    sWhere := sWhere +' AND RL_FECHARECEPCION >= '+SqlValue(edFechaRecepcionDesde.Date);

  if edFechaRecepcionHasta.Date <> 0 then
    sWhere := sWhere +' AND RL_FECHARECEPCION <= '+SqlValue(edFechaRecepcionHasta.Date);

  if edFechaFormularioDesde.Date <> 0 then
    sWhere := sWhere +' AND RL_FECHAFORMULARIO >= '+SqlValue(edFechaFormularioDesde.Date);

  if edFechaFormularioHasta.Date <> 0 then
    sWhere := sWhere +' AND RL_FECHAFORMULARIO <= '+SqlValue(edFechaFormularioHasta.Date);

  if cbEmpleadorFiltro.Checked then
    sWhere := sWhere +' AND rl_procedencia = ''E'' ';

  if cbPreventorFiltro.Checked then
    sWhere := sWhere +' AND rl_procedencia = ''P'' ';

  sdqConsulta.SQL.Text := sSql +sWhere + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmImpresionRelevamientoRiesgosLaborales.tbSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('RL_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('RL_ID').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

end.
