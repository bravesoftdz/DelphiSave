unit unControlDenunciasRiesgos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDbFrame, unFraEmpresa,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, Mask, ToolEdit,
  DateComboBox;

type
  TfrmControlDenunciasRiesgos = class(TfrmCustomGridABM)
    Label1: TLabel;
    lblCUIT: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edFechaAltaDesde: TDateComboBox;
    fraUsuarioAlta: TfraCodigoDescripcion;
    fraEmpresa: TfraEmpresa;
    edFechaModifHasta: TDateComboBox;
    fraUsuarioModif: TfraCodigoDescripcion;
    edFechaAltaHasta: TDateComboBox;
    edFechaModifDesde: TDateComboBox;
    edFechaEnvioHasta: TDateComboBox;
    fraUsuarioEnvio: TfraCodigoDescripcion;
    edFechaEnvioDesde: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    fpCopiarArchivo: TFormPanel;
    lbDirectorio: TLabel;
    edDirectorio: TDirectoryEdit;
    Button1: TButton;
    btnAceptarCopiarArchivo: TButton;
    tbMarcarComoEnviado: TToolButton;
    tbCopiarArchivo: TToolButton;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    sdqConsultaNR_ID: TFloatField;
    sdqConsultaNR_CONTRATO: TFloatField;
    sdqConsultaNR_FECHAENVIO: TDateTimeField;
    sdqConsultaNR_USUENVIO: TStringField;
    sdqConsultaNR_FECHAALTA: TDateTimeField;
    sdqConsultaNR_USUALTA: TStringField;
    sdqConsultaNR_FECHAMODIF: TDateTimeField;
    sdqConsultaNR_USUMODIF: TStringField;
    sdqConsultaNR_FECHABAJA: TDateTimeField;
    sdqConsultaNR_USUBAJA: TStringField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaSELECTED: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaFECHAALTA: TDateTimeField;
    tbReprocesar: TToolButton;
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

  private
    { Private declarations }
    SelectedList: TStringList;
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
  frmControlDenunciasRiesgos: TfrmControlDenunciasRiesgos;

implementation

{$R *.dfm}

uses
  unSesion, unCustomConsulta, AnsiSql, unDmPrincipal, CustomDlgs, Strfuncs, unRptNotaDenunciaRiegoInvalido;

procedure TfrmControlDenunciasRiesgos.ClearControls;
begin
  inherited;

end;

function TfrmControlDenunciasRiesgos.DoABM: Boolean;
begin
  result := True;
end;

procedure TfrmControlDenunciasRiesgos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'nr_fechabaja';
  SelectedList := TStringList.Create;
  Sql.TableName := 'HYS.hnr_notasdenunciariesgo';
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
  fraUsuarioAlta.Codigo := Sesion.UserID;
  edFechaAltaDesde.Date := DBDate;

  tbMarcarComoEnviado.Left := tbSalir.Left -1 ;
  tbCopiarArchivo.Left := tbSalir.Left- 1;
  tbSeleccionarTodo.Left := tbSalir.Left -1 ;
  tbDesSeleccionarTodo.Left := tbSalir.Left -1 ;
end;

procedure TfrmControlDenunciasRiesgos.LoadControls;
begin
  inherited;

end;

function TfrmControlDenunciasRiesgos.Validar: Boolean;
begin
  result := True;
end;

procedure TfrmControlDenunciasRiesgos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraUsuarioAlta.Clear;
  fraUsuarioModif.Clear;
  fraUsuarioEnvio.Clear;
  fraEmpresa.Contrato;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaModifDesde.Clear;
  edFechaModifHasta.Clear;
  edFechaEnvioDesde.Clear;
  edFechaEnvioHasta.Clear;
  fraUsuarioAlta.Codigo := Sesion.UserID;
end;

procedure TfrmControlDenunciasRiesgos.RefreshData;
var
  sSQL : String;
begin
  sSQL := 'SELECT a.*, b.*, c.*, TRUNC(nr_fechaalta) fechaalta '+
          '  FROM hys.hnr_notasdenunciariesgo a, afi.aco_contrato b, afi.aem_empresa c '+
          ' WHERE nr_contrato = co_contrato '+
          '   AND co_idempresa = em_id ';
  if fraEmpresa.IsSelected then
    sSQL := sSQL + ' AND nr_contrato = '+ SqlValue(fraEmpresa.Contrato);
  if fraUsuarioAlta.IsSelected then
    sSQL := sSQL + ' AND nr_usualta = '+ SqlValue(fraUsuarioAlta.Codigo);
  if fraUsuarioModif.IsSelected then
    sSQL := sSQL + ' AND nr_usumodif = '+ SqlValue(fraUsuarioModif.Codigo);
  if fraUsuarioEnvio.IsSelected then
    sSQL := sSQL + ' AND nr_usuenvio = '+ SqlValue(fraUsuarioEnvio.Codigo);

  if edFechaAltaDesde.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechaalta >= '+ SqlValue(edFechaAltaDesde.Date);
  if edFechaAltaHasta.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechaalta <= '+ SqlValue(edFechaAltaHasta.Date);
  if edFechaModifDesde.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechamodif >= '+ SqlValue(edFechaModifDesde.Date);
  if edFechaModifHasta.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechamodif <= '+ SqlValue(edFechaModifHasta.Date);
  if edFechaEnvioDesde.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechaenvio >= '+ SqlValue(edFechaEnvioDesde.Date);
  if edFechaEnvioHasta.Date <> 0 then
    sSQL := sSQL + ' AND nr_fechaenvio <= '+ SqlValue(edFechaEnvioHasta.Date);

  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmControlDenunciasRiesgos.tbMarcarComoEnviadoClick(
  Sender: TObject);
var
  j : Integer;
  idNota : String;
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) then
  begin
    for j:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(Pointer(SelectedList.Objects[j]));
      idNota := SelectedList.Strings[j];

      EjecutarSql(' UPDATE hys.hnr_notasdenunciariesgo '+
                  '    SET nr_fechaenvio = sysdate, '+
                  '        nr_usuenvio = '+SqlValue(Sesion.UserID)+
                  '  WHERE nr_id = '+SqlValue(idNota));
    end;
    tbDesSeleccionarTodoClick(nil);
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmControlDenunciasRiesgos.tbCopiarArchivoClick(
  Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) then
    fpCopiarArchivo.ShowModal;
end;

procedure TfrmControlDenunciasRiesgos.btnAceptarCopiarArchivoClick(
  Sender: TObject);
var
  valorContrato, NomArch : String;
  PathBase, PathOrigen, sCuit, sContrato, idNota : STring;
  j  : Integer;
begin
  inherited;
  if not DirectoryExists(edDirectorio.Text) then
    InvalidMsg(edDirectorio, 'El directorio de exportación es inexistente.')
  else
  begin
    PathBase := ValorSql(
        ' SELECT pa_valor '+
        '   FROM hys.hpa_parametro '+
        '  WHERE pa_clave = ''CARPETASERVICIO'' ');
    for j:=0 to SelectedList.Count-1 do
    begin
      PathOrigen := PathBase;
      DBGrid.DataSource.DataSet.GotoBookmark(Pointer(SelectedList.Objects[j]));
      idNota := SelectedList.Strings[j];

      sContrato := ValorSql('SELECT nr_contrato FROM hys.hnr_notasdenunciariesgo WHERE nr_id = '+SqlValue(idNota));

      sCuit := ValorSql('SELECT em_cuit FROM afi.aem_empresa, afi.aco_contrato WHERE em_id = co_idempresa '+
                      ' AND co_contrato = '+SqlValue(sContrato));
      NomArch := sCuit+'_NotaDenunciaRiesgoInvalido.pdf';

      valorContrato := LPad(copy(sContrato,
                          Length(sContrato)-2,3),'0',3);
      PathOrigen := IncludeTrailingBackslash(PathOrigen)+valorContrato+'\'+NomArch;

      CopyFile(PChar(PathOrigen), PChar(edDirectorio.text+'\'+NomArch), True);
    end;
    fpCopiarArchivo.ModalResult := mrOK;
    tbDesSeleccionarTodoClick(nil);
  end;
end;

procedure TfrmControlDenunciasRiesgos.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('nr_id').AsString) = -1 then
      SelectedList.Add(sdqConsulta.FieldByName('nr_id').AsString)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('nr_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmControlDenunciasRiesgos.FSFormDestroy(Sender: TObject);
begin
  inherited;
  SelectedList.Free;
end;

procedure TfrmControlDenunciasRiesgos.GridDrawColumnCell(Sender: TObject;
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
    if SelectedList.IndexOf(sdqConsulta.FieldByName('nr_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmControlDenunciasRiesgos.tbDesSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
begin
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmControlDenunciasRiesgos.tbSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('nr_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('nr_id').AsString, TObject(sdqConsulta.GetBookmark));
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmControlDenunciasRiesgos.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmControlDenunciasRiesgos.tbReprocesarClick(Sender: TObject);
begin
  with TrptNotaDenunciaRiesgoInvalido.Create(Self) do
  try
    Load(sdqConsulta.fieldbyname('em_cuit').AsString);
  finally
    Free;
  end;

end;

end.
