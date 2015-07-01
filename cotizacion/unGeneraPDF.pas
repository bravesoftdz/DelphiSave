unit unGeneraPDF;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   02-10-03
}

interface

function GetPrinterPDF: Integer;
function SetNombrePDF(sNombrePDF: String): Boolean;

implementation

uses
  IniFiles, FileCtrl, Dialogs, SysUtils, Printers;

function SetNombrePDF(sNombrePDF: String): Boolean;
var
  fIniFile: TIniFile;
  sPathDoc: String;
  iIndex: Integer;
begin
  Result := False;
  fIniFile := nil;
  sPathDoc := sNombrePDF;
//  if not DirectoryExists(sPathDoc) then
//    if not ForceDirectories(sPathDoc) then
//      MessageDlg('No se pudo crear el directorio ''' + sPathDoc + '''', mtError, [mbOK], 0);
  try
    fIniFile := TIniFile.Create('c:\windows\system\PdfWritr.ini');
    fIniFile.WriteString('Acrobat PDFWriter', 'PDFFileName', sPathDoc);
    iIndex := GetPrinterPDF;
    if iIndex = -1 then
      raise Exception.Create('No se encontró la Impresora PDF.');
    Result :=  True;
  finally
    fIniFile.Free;
  end;
end;

function GetPrinterPDF: Integer;
var
  iIndexPrint: Integer;
begin
  iIndexPrint := 0;
  while iIndexPrint <= Printer.Printers.Count - 1 do
  begin
    if pos('PDFWrit', Printer.Printers.Strings[iIndexPrint]) > 0 then
    begin
      Result := iIndexPrint;
      Exit;
    end;
    Inc(iIndexPrint);
  end;
  Result := -1
end;

end.
