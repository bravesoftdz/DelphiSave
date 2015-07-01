unit Frm_Consulta;

interface

uses
   SysUtils, Classes,  Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ToolWin, ExtCtrls, Grids, DBGrids, Db, dbtables,
  SDEngine, mwCustomEdit, mwHighlighter, mwSqlSyn, QueryToFile, Registros, Windows,
  ExportDialog, Placemnt, QueryPrint;

type
  TFrm_Consultas = class(TForm)
    Dbg_Grilla: TDBGrid;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    TBtn_Ejecutar: TToolButton;
    IL_ListaDeImagenes: TImageList;
    BarraDeEstado: TStatusBar;
    Sdq_Consulta: TSDQuery;
    Ds_SQL: TDataSource;
    Tb_MoverUltimo: TToolButton;
    ToolButton2: TToolButton;
    Tb_MoverPrimero: TToolButton;
    Tb_MoverAnterior: TToolButton;
    Siguiente: TToolButton;
    Tb_Seleccion: TToolButton;
    ToolButton1: TToolButton;
    TBtn_Salir: TToolButton;
    Tb_SoloLectura: TToolButton;
    tbNuevo: TToolButton;
    tbAbrir: TToolButton;
    ToolButton5: TToolButton;
    tbGuardar: TToolButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Te_Sql: TmwCustomEdit;
    mwSqlSyn: TmwSqlSyn;
    tbExportar: TToolButton;
    QueryToFile: TQueryToFile;
    ExportDialog: TExportDialog;
    FormPlacement: TFormPlacement;
    tbImprimir: TToolButton;
    ToolButton4: TToolButton;
    QueryPrint: TQueryPrint;
    PrinterSetupDialog: TPrinterSetupDialog;
    tbAnalizarConsulta: TToolButton;
    procedure TBtn_EjecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tb_MoverUltimoClick(Sender: TObject);
    procedure Tb_MoverPrimeroClick(Sender: TObject);
    procedure Tb_MoverAnteriorClick(Sender: TObject);
    procedure SiguienteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBtn_SalirClick(Sender: TObject);
    procedure Tb_SoloLecturaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbAbrirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure FormPlacementRestorePlacement(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbAnalizarConsultaClick(Sender: TObject);
    procedure Tb_SeleccionClick(Sender: TObject);
  private
    sPath : String;
    Function BuscarPosError ( ErrorMsg : String ) : Integer;
  public
    Procedure GenerarSql(Tabla: String; Owner : String = '');
  end;

var
  frmConsultas: TFrm_Consultas;

  implementation

uses
  BaseDeDatos, General, strFuncs, CustomDlgs, unPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
Procedure TFrm_Consultas.GenerarSql(Tabla: String; Owner : String = '');
Var
   Cursor : TSDQuery;
   Texto : String;
begin
     Self.Visible := True;
     Cursor := TSDQuery.Create( Self );
     Try
        Cursor.Databasename := BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.DatabaseName   ;
        Cursor.Sql.Add (' SELECT COLUMN_NAME  FROM SYS.ALL_TAB_COLUMNS ' +
                        ' WHERE TABLE_NAME = ''' + Tabla + '''');
        If not (Owner = '') then
            Cursor.Sql.Add (' AND OWNER = ''' + OWNER + '''');
        Cursor.Sql.Add (' ORDER BY COLUMN_ID ');
        Cursor.Open ;

        Te_Sql.Lines.Add ('SELECT');
        while not Cursor.Eof do begin
            if Cursor.FieldByName('COLUMN_NAME').Value <> UpperCase(Cursor.FieldByName('COLUMN_NAME').Value) Then
                Texto := '        "' + Cursor.FieldByName('COLUMN_NAME').Value + '"'
            else
                Texto := '        ' + Cursor.FieldByName('COLUMN_NAME').Value;
            Cursor.Next;
            if not Cursor.Eof then
               Texto := Texto + ', ';
            Te_Sql.Lines.Add (Texto);
        end;
        if Tabla <> UpperCase(Tabla) Then
           Te_Sql.Lines.Add ('FROM ' + OWNER  + '."' + Tabla + '"')
        else
            Te_Sql.Lines.Add ('FROM ' + OWNER  + '.' + Tabla);
     finally
        TBtn_EjecutarClick ( Self );
        Cursor.Destroy;
     end;
     Self.Caption            := 'Consulta: ' + Tabla;
     ExportDialog.OutputFile := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.TBtn_EjecutarClick(Sender: TObject);
Var   i   : Integer;
begin
     BarraDeEstado.SimpleText := '';
     if Sdq_Consulta.Active then
        Sdq_Consulta.Close ;

     Sdq_Consulta.Sql.Clear ;

     IF Trim(Te_Sql.SelText) <> '' Then
         Sdq_Consulta.Sql.Add (Te_Sql.SelText)
     else
         Sdq_Consulta.Sql :=  Te_Sql.Lines ;
     try
        Sdq_Consulta.Params.Clear ;
        if Tb_Seleccion.Down then
          Sdq_Consulta.Open
        else
        begin
          BarraDeEstado.SimpleText := 'Ejecutando...';
          Sdq_Consulta.ExecSQL;
          BarraDeEstado.SimpleText := IntToStr(Sdq_Consulta.RowsAffected) + ' Rows Affected.';
        end;
     Except
{          on E: Exception do
              if not (E is ENoResultSet) Then
                 BarraDeEstado.SimpleText := 'Not Execute Available';}
          on E: EDatabaseError do begin
             BarraDeEstado.SimpleText := e.Message;
             BuscarPosError (e.Message)
          end;
     end;
     for i := 0 to Dbg_Grilla.Columns.Count -1 do begin
         if (Dbg_Grilla.Columns.Items[i].Width > 200) then
             Dbg_Grilla.Columns.Items[i].Width := 200;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TFrm_Consultas.BuscarPosError(ErrorMsg: String): Integer;
Var
   iPos, iEnter, iEspacio : Integer;
Const
   sMsgError = '(error offset:';
begin
     iPos := 0;
     if Pos(sMsgError, ErrorMsg) > 0 Then begin
        iPos := Pos(sMsgError, ErrorMsg) + Length( sMsgError ) ;
        iPos := StrToint( Copy( ErrorMsg,
                                iPos +1,
                                Pos(')', Copy(ErrorMsg, iPos ,255)) -2
                              )
                        );

        IF Trim(Te_Sql.SelText) <> '' Then
           Te_Sql.SetSelStart (iPos + Te_Sql.GetSelStart)
        else
            Te_Sql.SetSelStart (iPos ) ;

        iEspacio :=  Pos(' '    , copy(Te_Sql.Text, iPos + 1,255) + ' ') ; //-1
        iEnter   :=  Pos(chr(13), copy(Te_Sql.Text, iPos + 1,255) + ' ') ; //-1
        If iEspacio < iEnter then
             Te_Sql.SetSelEnd ( iEspacio +  Te_Sql.GetSelStart )
        else
             Te_Sql.SetSelEnd ( iEnter +  Te_Sql.GetSelStart )
     end;
     Result := iPos ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(frmPrincipal.mnuDocConsultas) then
    frmPrincipal.mnuDocConsultas.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.Tb_MoverUltimoClick(Sender: TObject);
begin
     Sdq_Consulta.Last ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.Tb_MoverPrimeroClick(Sender: TObject);
begin
     Sdq_Consulta.First ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.Tb_MoverAnteriorClick(Sender: TObject);
begin
     if not Sdq_Consulta.Bof then ;
          Sdq_Consulta.Prior ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.SiguienteClick(Sender: TObject);
begin
     if not Sdq_Consulta.Eof then ;
          Sdq_Consulta.Next ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key = 120 then
        TBtn_EjecutarClick( Sender );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.TBtn_SalirClick(Sender: TObject);
begin
     Self.Close ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.Tb_SoloLecturaClick(Sender: TObject);
begin
     With Tb_SoloLectura do
         If Down Then begin
             ImageIndex := 9;
             Dbg_Grilla.ReadOnly := True;
             Dbg_Grilla.Options := Dbg_Grilla.Options  - [DgEditing];
         end else begin
             ImageIndex := 8;
             Dbg_Grilla.Options := Dbg_Grilla.Options  + [DgEditing];
             Dbg_Grilla.ReadOnly := False;
         end;
//     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbNuevoClick(Sender: TObject);
begin
     Te_Sql.Lines.Clear ;
     Te_Sql.Lines.Add ('');
     Caption                 := 'Consultas' ;
     ExportDialog.OutputFile := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbAbrirClick(Sender: TObject);
begin
     if OpenDialog.Execute Then begin
        Te_Sql.Lines.LoadFromFile ( OpenDialog.FileName );
        Caption                 := 'Consulta desde el Archivo:' + OpenDialog.FileName;
        ExportDialog.OutputFile := ChangeFileExt(OpenDialog.FileName, IIF(ExportDialog.ExportFileType = etTextFile, '.txt', '.xls'));
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbGuardarClick(Sender: TObject);
begin
     SaveDialog.FileName := Copy(Caption,Pos(':', Caption) + 1,length(Caption));
     IF SaveDialog.Execute Then
        Te_Sql.Lines.SaveToFile ( SaveDialog.FileName );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbExportarClick(Sender: TObject);
Var
    sFile  : String;
begin
     if ExportDialog.OutputFile = '' Then begin
        sFile                   := Trim(Copy(Caption, Pos(':', Caption) + 1, length(Caption)));
        ExportDialog.OutputFile := sPath + ExtractFileName(sFile) + IIF(ExportDialog.ExportFileType = etTextFile, '.txt', '.xls');
     end;
     ExportDialog.Comment := Sdq_Consulta.SQL.Text ;
     ExportDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.FormPlacementRestorePlacement(Sender: TObject);
begin
     sPath := ExtractFilePath( ExportDialog.OutputFile );
     if sPath <> '' Then
        sPath := IncludeTrailingBackslash(sPath);
     ExportDialog.OutputFile := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbImprimirClick(Sender: TObject);
begin
  if ( GetKeyState( VK_CONTROL ) and $4000 ) = $4000 then
     QueryPrint.SubTitle.Lines.Assign( Sdq_Consulta.SQL )
  else
     QueryPrint.SubTitle.Lines.Clear ;

  if Sdq_Consulta.Active and (not Sdq_Consulta.IsEmpty) and  PrinterSetupDialog.Execute Then begin
     Enabled := False;
     Try
       QueryPrint.Footer.Text := BaseDeDatos.DM_BaseDeDatos.Usuario + '@' + BasedeDatos.DM_BaseDeDatos.BaseDeDatos.RemoteDatabase;
       QueryPrint.Title.Text  := Caption;
       QueryPrint.SetGridColumns( Dbg_Grilla, True, [baDetail, baHeader, baTotal, baSubTotal] );
       QueryPrint.Print ;
     finally
       Enabled := True;
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.tbAnalizarConsultaClick(Sender: TObject);
var
  AResult: TStringList;
  i: Integer;
begin
  TBtn_EjecutarClick(Nil);

  AResult := TStringList.Create;
  try
//    AResult.Add('Cantidad de Registros: ' + IntToStr(Sdq_Consulta.RecordCount));
    AResult.Add('Cantidad de Campos: ' + IntToStr(Sdq_Consulta.FieldCount));
    AResult.Add('Tamaño del Registro: ' + IntToStr(Sdq_Consulta.RecordSize) + ' bytes');
    AResult.Add('');
    AResult.Add('FieldName                 DataType        DataSize');
    for i := 0 to Sdq_Consulta.FieldCount - 1 do
      AResult.Add(Format('%25s %15s %6d', [Sdq_Consulta.Fields[i].FieldName,
                                           FieldTypeNames[Sdq_Consulta.Fields[i].DataType],
                                           Sdq_Consulta.Fields[i].DataSize]));

    InputMemoBox('Análisis', AResult, True);
  finally
    AResult.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrm_Consultas.Tb_SeleccionClick(Sender: TObject);
begin
  tbAnalizarConsulta.Enabled := Tb_Seleccion.Down;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
