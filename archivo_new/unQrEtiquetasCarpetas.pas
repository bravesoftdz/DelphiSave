unit unQrEtiquetasCarpetas;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, ArtQReports, unArt;

type
  TqrEtiquetasCarpetas = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
  private
  public
  end;

  procedure DoImprimirEtiquetaCarpeta(CodBarras: String; Copias: Integer = 1);
  procedure DoImprimirEtiquetaCarpetaClave(TipoArchivo: TTableId; Clave: String; Copias: Integer = 1);

implementation

{$R *.DFM}

uses
  unArchivo, General, Printers, Numeros, CustomDlgs, unFraFiltroArchivo, unConstantArchivo;

procedure DoImprimirEtiquetaCarpeta(CodBarras: String; Copias: Integer = 1);
var
  rpt: TqrEtiquetasCarpetas;
  iLong, iAnchoPag, iIndexPrintAct, iIndexPrintEtiq: Integer;
begin
  iIndexPrintEtiq := GetPrinterEtiquetas();

  if iIndexPrintEtiq = -1 then
    MsgBox('No se ha encontrado la impresora de etiquetas.', MB_ICONERROR + MB_OK)
  else
    begin
      rpt := TqrEtiquetasCarpetas.Create(nil);
      with rpt do
        begin
          iIndexPrintAct := PrinterSettings.PrinterIndex;
          try
            with PrinterSettings do
              begin
                PrinterIndex := iIndexPrintEtiq;
                Copies       := Copias;
              end;  

            with qrlNumero do
              begin
                Caption := CodBarras;
                Left    := 1;
              end;

            with qrlBarras do
              begin
                Caption := '*' + qrlNumero.Caption + '*';
                Left    := 1;
              end;

            iLong     := Round(Get_PrintermmPerFontx(iIndexPrintEtiq, qrlBarras.Font.Name, qrlBarras.Font.Size, [], qrlBarras.Caption));
            iAnchoPag := Max(iLong + 10, 40);  // cada etiqueta, como mínimo de 4 cm de ancho

            {$IFDEF VER150}
            Page.Length := iAnchoPag;
            {$ELSE}
            with Page do
              begin
                Orientation := poLandScape;
                Length      := ANCHO_ETIQUETAS_MM;
                Width       := iAnchoPag;
              end;
            {$ENDIF}

            qrlNumero.Size.Width := iAnchoPag - 1;
            qrlBarras.Size.Width := iAnchoPag - 1;

            Print;
          finally
            PrinterSettings.PrinterIndex := iIndexPrintAct;
            Free;
          end;
        end;
    end;
end;

procedure DoImprimirEtiquetaCarpetaClave(TipoArchivo: TTableId; Clave: String; Copias: Integer = 1);
var
  CodBarras: String;
begin
  if ClaveACodBarras(TipoArchivo, Clave, CodBarras) then
    DoImprimirEtiquetaCarpeta(CodBarras, Copias)
  else
    Verificar(True, nil, 'Error al generar el código de barras de la clave: ' + Clave + '.');
end;

end.

