unit unMonitorSincronizacionSML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, StdCtrls, Mask, ToolEdit, DBCtrls, AdvGroupBox,
  AdvOfficeButtons, ImgList;

type
  TfrmMonitorSincronizacionSML = class(TfrmCustomConsulta)
    fraNOMBRE: TfraCodDesc;
    lblTransaccion: TLabel;
    lblEstado: TLabel;
    fraESTADO: TfraCodDesc;
    tbReprocesar: TToolButton;
    edFECHADesde: TDateEdit;
    edFECHAHasta: TDateEdit;
    lblFecha: TLabel;
    lblHasta: TLabel;
    pnlBottom: TPanel;
    lblError: TLabel;
    edXML_ERROR: TDBEdit;
    lblXML: TLabel;
    rgTIPO: TAdvOfficeRadioGroup;
    ilGrid: TImageList;
    rgERRORES: TAdvOfficeRadioGroup;
    ShortCutControlHijo: TShortCutControl;
    sdqReprocesar: TSDQuery;
    edXML_CONTENT: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var
        Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbReprocesarClick(Sender: TObject);
  private
    FSQL: string;
  protected
    procedure ClearData; override;
		procedure RefreshData; override;
  end;

var
  frmMonitorSincronizacionSML: TfrmMonitorSincronizacionSML;

implementation

uses VCLExtra, unFiltros, unDmPrincipal, General, unArt, CustomDlgs;

{$R *.dfm}

procedure TfrmMonitorSincronizacionSML.ClearData;
begin
  ClearComponentData(pnlFiltros);
end;

procedure TfrmMonitorSincronizacionSML.FormCreate(Sender: TObject);
begin
  edFECHADesde.Date := DBDate;
  inherited;
  FSQL := sdqConsulta.Sql.Text;
  VCLExtra.LockControls([edXML_ERROR, edXML_CONTENT], True);
  tbReprocesar.Left := tbPropiedades.Left;
  rgERRORES.ItemIndex := 1;
end;

procedure TfrmMonitorSincronizacionSML.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  bitmap: TBitmap;
  fixRect: TRect;
  bmpWidth: integer;
  imgIndex: integer;
begin
  fixRect := Rect;

  if Column.Field = sdqConsulta.FieldByName('TIPO') then
  begin
    //adding some logic to grab the required image
    if sdqConsulta.FieldByName('TIPO').AsString = 'ENTRANTE' then
      imgIndex := 0
    else if sdqConsulta.FieldByName('TIPO').AsString = 'SALIENTE' then
      imgIndex := 1
    else
      imgIndex := -1;

    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList 
      //(using the "Salary" field's value)
      ilGrid.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      Grid.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle, 
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  //draw default text (fixed position)
  Grid.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TfrmMonitorSincronizacionSML.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['ERROR']) then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if (Field.Value = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmMonitorSincronizacionSML.RefreshData;
var
  sWhere: String;
begin
  case rgTIPO.ItemIndex of
    1: sWhere := ' AND TIPO = ''ENTRANTE'' ';
    2: sWhere := ' AND TIPO = ''SALIENTE'' ';
  end;

  case rgERRORES.ItemIndex of
    1: sWhere := sWhere + ' AND ESTADO <> 100 ';
    2: sWhere := sWhere + ' AND ESTADO = 100 ';
  end;

  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + sWhere + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmMonitorSincronizacionSML.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  Grid.ColumnByField['TIPO'].Width := Grid.ColumnByField['TIPO'].Width + 18; 
end;

procedure TfrmMonitorSincronizacionSML.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbReprocesar.Enabled := (not DataSet.IsEmpty) and (not DataSet.FieldByName('XML_ERROR').IsNull);
end;

procedure TfrmMonitorSincronizacionSML.tbReprocesarClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(sdqConsulta.IsEmpty or (sdqConsulta.FieldByName('TIPO').AsString <> 'ENTRANTE'), nil, 'Debe seleccionar una transacción entrante.'); 
  with sdqReprocesar do
  begin
    Prepare;
    ParamByName('secuencia').AsInteger := sdqConsulta.FieldByName('secuencia').AsInteger;
    ParamByName('tipo').AsString  := sdqConsulta.FieldByName('tipo').AsString;
    ParamByName('mensaje').ParamType := ptOutput;
    ParamByName('mensaje').DataType := ftString;
    for i := Params.Count -1 downto 0 do
      if (Params[i].Name = '=') or
         (Params[i].Name = '') then
        Params.Delete(i);
    ExecSQL;
    InfoHint(nil, ParamByName('mensaje').AsString);
  end;
  sdqConsulta.Refresh;
end;

end.
