unit unVisualizarArchivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, unArtFrame, unFraCodigoDescripcion,
  ExtCtrls, ShortCutControl, ComCtrls, ToolWin, StdCtrls, FormPanel, FileReader, Db, SDEngine, unCustomForm,
  unArtDBAwareFrame, ImgList, XPMenu, Placemnt;

type
  TfrmVisualizarArchivos = class(TfrmCustomForm)
    pnlArchivo: TPanel;
    fraArchivo: TfraCodigoDescripcion;
    Grid: TStringGrid;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbAbrir: TToolButton;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    OpenDialog: TOpenDialog;
    fpProgreso: TFormPanel;
    btnCancelar: TButton;
    ProgressBar: TProgressBar;
    lbArchivo: TLabel;
    lbProgreso: TLabel;
    FileReader: TFileReader;
    tbLimites: TToolButton;
    ToolButton2: TToolButton;
    pnlBuffer: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbAbrirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FileReaderReadField(Sender: TObject; Line, Field: Integer; Value: String);
    procedure FileReaderReadLine(Sender: TObject; Number: Integer; var Line: String);
    procedure FileReaderStreamRead(Sender: TObject; Value: String; Position, Size: Integer);
  private
    iCol: Integer;

    procedure CargarCampos;
    procedure OnFraArchivoChange(Sender: TObject);
  public
  end;
{
var
  frmVisualizarArchivos: TfrmVisualizarArchivos;
}

implementation

uses
  AnsiSql, StrFuncs, unDmPrincipal, General, Math, CustomDlgs;

{$R *.DFM}

procedure TfrmVisualizarArchivos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraArchivo do
  begin
    FieldID     := 'AR_ID';
    FieldCodigo := 'AR_ID';
    FieldDesc   := 'AR_DESCRIPCION';
    FieldBaja   := 'AR_FECHABAJA';
    TableName   := 'IAR_ARCHIVO';
    ExtraFields := ', AR_ARCHIVONOMBRE, AR_ENCABEZADO, AR_SEPARADOR, AR_CAL_TEXTO, AR_EOL, AR_EOF, AR_REM ';
    OnChange    := OnFraArchivoChange;
  end;
end;

procedure TfrmVisualizarArchivos.tbLimpiarClick(Sender: TObject);
begin
  Grid.RowCount   := 2;
  Grid.ColCount   := 2;
  Grid.Cells[1, 0] := '';
  Grid.Cells[0, 1] := '';
  Grid.Cells[1, 1] := '';
  if Assigned(Sender) then
    fraArchivo.Clear;
end;

procedure TfrmVisualizarArchivos.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizarArchivos.OnFraArchivoChange(Sender: TObject);
begin
  tbLimpiarClick(nil);
end;

procedure TfrmVisualizarArchivos.tbAbrirClick(Sender: TObject);
var
  sFilter: String;
  i      : Integer;
begin
  if fraArchivo.IsEmpty then
  begin
    InvalidMsg(fraArchivo.edCodigo, 'Debe seleccionar el tipo de Archivo.');
    Exit;
  end;

  sFilter := '';
  for i := 0 to 99 do
    sFilter := sFilter + Format(fraArchivo.sdqDatos.FieldByName('AR_ARCHIVONOMBRE').AsString, [i]) + ';';
  SetLength(sFilter, Length(sFilter) - 1);

  OpenDialog.Filter := Format('%s|*.%s|Todos los Archivos|*.*', [ fraArchivo.cmbDescripcion.Text, sFilter ]);
  if OpenDialog.Execute then
  begin
    lbArchivo.Caption := 'Cargando ' + OpenDialog.FileName;
    fpProgreso.ShowOnTop;
    try
      with FileReader, fraArchivo.sdqDatos do
      begin
        //MaxRecords   := sdqConsultas.FieldByName('AR_MAXREGISTROS').AsInteger;
        InputFile    := OpenDialog.FileName;
        Separator    := GetChar(FieldByName('AR_SEPARADOR').AsString);
        Quote        := GetChar(FieldByName('AR_CAL_TEXTO').AsString);
//        EOLChar      := GetChar(FieldByName('AR_EOL').AsString);
//        EOFChar      := GetChar(FieldByName('AR_EOF').AsString);
        RemChar      := GetChar(FieldByName('AR_REM').AsString);
        if FieldByName('AR_ENCABEZADO').AsString = 'S' then
          HeaderRows := 1
        else
          HeaderRows := 0;

        if (Separator = #0) and (Quote = #0) then
          FileType   := ftFixed
        else
          FileType   := ftSeparated;
      end;
      CargarCampos;
      FileReader.ReadFile;

      if Grid.RowCount > 1 then
        Grid.FixedRows := 1;
    finally
      fpProgreso.Close;
    end;
  end;
end;

procedure TfrmVisualizarArchivos.CargarCampos;
var
  sSql     : String;
  sdqCampos: TSDQuery;
begin
  FileReader.Fields.Clear;
  sSql := 'SELECT AC_TITULO, AC_ANCHO ' +
            'FROM IAC_ARCHIVOCAMPO ' +
           'WHERE AC_IDARCHIVO = ' + SqlValue(fraArchivo.Value) +
       ' ORDER BY AC_ORDEN';
  sdqCampos  := GetQuery(sSql);
  try
    Grid.ColCount := sdqCampos.RecordCount + 1;
    Grid.Cells[0, 0]   := ''; {El Indicador}
    Grid.ColWidths[0]  := 28;
    Grid.RowHeights[0] := 18;
    iCol := 0;
    repeat
      Inc(iCol);
      Grid.Cells[iCol, 0]  := IIF(tbLimites.Down , IntToStr(iCol+1) + '-', '') + sdqCampos.FieldByName('AC_TITULO').AsString ;
      Grid.ColWidths[iCol] := Min(300, Max(Canvas.TextWidth(StringOfChar('e',
                                       sdqCampos.FieldByName('AC_ANCHO').AsInteger)),
                                       Canvas.TextWidth(sdqCampos.FieldByName('AC_TITULO').AsString)) + 4);

      FileReader.Fields.Add.Length := sdqCampos.FieldByName('AC_ANCHO').AsInteger;

      sdqCampos.Next;
    until sdqCampos.Eof;
  finally
    sdqCampos.Free;
  end;
end;

procedure TfrmVisualizarArchivos.btnCancelarClick(Sender: TObject);
begin
  FileReader.Cancel;
end;

procedure TfrmVisualizarArchivos.FileReaderReadField(Sender: TObject; Line, Field: Integer; Value: String);
begin
  try
    if tbLimites.Down and (Field < Grid.ColCount - 2) then
    begin
      if Value = '' then
        Grid.Cells[Field + 1, Line] := '[Null]'
      else
        Grid.Cells[Field + 1, Line] := '>' + Value + '<';
    end
    else
      Grid.Cells[Field + 1, Line] := Value;
  except
    //
  end;
end;

procedure TfrmVisualizarArchivos.FileReaderReadLine(Sender: TObject; Number: Integer; var Line: String);
begin
  try
    Grid.RowCount           := Number + 1;
    Grid.RowHeights[Number] := 18;
    Grid.Cells[0, Number]   := IntToStr(Number);
  except
    //
  end;
end;

procedure TfrmVisualizarArchivos.FileReaderStreamRead(Sender: TObject; Value: String; Position, Size: Integer);
begin
  pnlBuffer.Caption    := Value;
  ProgressBar.Max      := Size;
  ProgressBar.Position := Position;
  lbProgreso.Caption   := IntToStr(Position) + ' de ' + IntToStr(Size) + ' Bytes';
  Application.ProcessMessages;
end;

end.
