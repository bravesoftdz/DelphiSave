unit unQrEtiquetasDocCarpetas;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, ArtQReports, unArt;

type
  TqrEtiquetasDocCarpetas = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    qrlInfoAdicional1: TQRLabel;
    qrlInfoAdicional2: TQRLabel;
  private
  public
  end;

  procedure DoImprimirEtiquetaDocCarpeta(CodBarras: String; Copias: Integer = 1);
  procedure DoImprimirEtiquetaDocCarpetaSubClave(CodDocumento: String; SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''; Copias: Integer = 1);
  procedure DoImprimirEtiquetaDocCarpetaClave(CodDocumento: String; Clave: String; Copias: Integer = 1);

  procedure DoImprimirEtiquetaSecuenciaTrazabilidad(SecTrazabilidad: Integer; Copias: Integer = 1; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; NroPagina: String = '');
  // estas dos rutinas por ahora no se usan...
  procedure DoImprimirEtiquetaSecuenciaTrazabilidad_Pagina(SecTrazabilidad: Integer; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; CantPaginas: Integer = 1; Pagina: Integer = 1);
  procedure DoImprimirEtiquetaSecuenciaTrazabilidad_Paginas(SecTrazabilidad: Integer; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; CantPaginas: Integer = 1);

implementation

{$R *.DFM}

uses
  unArchivo, General, Printers, Numeros, unConstantArchivo, unUtilsArchivo, unDmPrincipal,
  Strfuncs, AnsiSql;

procedure DoImprimirEtiquetaDocCarpeta(CodBarras: String; Copias: Integer = 1);
var
  rpt: TqrEtiquetasDocCarpetas;
  iLong, iAnchoPag, iIndexPrintAct, iIndexPrintEtiq: Integer;
begin
  iIndexPrintEtiq := GetPrinterEtiquetas();

  if iIndexPrintEtiq = -1 then
    MsgBox('No se ha encontrado la impresora de etiquetas.', MB_ICONERROR + MB_OK)
  else
    begin
      rpt := TqrEtiquetasDocCarpetas.Create(nil);
      with rpt do
        begin
          iIndexPrintAct := PrinterSettings.PrinterIndex;
          try
            with PrinterSettings do
              begin
                PrinterIndex := iIndexPrintEtiq;
                Copies       := Copias;
              end;

            CodBarras := Trim(CodBarras);

            with qrlNumero do
              begin
                Caption := CodBarras;
                Left    := 1;
              end;

            with qrlBarras do
              begin
                Caption := '*' + qrlNumero.Caption + '*';
                Left    := 1;
                iLong   := Round(Get_PrintermmPerFontx(iIndexPrintEtiq, Font.Name, Font.Size, [], Caption));
              end;

            qrlInfoAdicional1.Enabled := False;
            qrlInfoAdicional2.Enabled := False;

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

            Dec(iAnchoPag);
            qrlNumero.Size.Width := iAnchoPag;
            qrlBarras.Size.Width := iAnchoPag;

            Print;
          finally
            PrinterSettings.PrinterIndex := iIndexPrintAct;
            Free;
          end;
        end;
    end;
end;

procedure DoImprimirEtiquetaDocCarpetaSubClave(CodDocumento: String; SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''; Copias: Integer = 1);
var
  CodBarras: String;
begin
  CodBarras := GetCodBarrasClave(CodDocumento, SubClave1, SubClave2, SubClave3, SubClave4);

  DoImprimirEtiquetaDocCarpeta(CodBarras, Copias);
end;

procedure DoImprimirEtiquetaDocCarpetaClave(CodDocumento: String; Clave: String; Copias: Integer = 1);
var
  sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
begin
  GetSubClaves(Clave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

  DoImprimirEtiquetaDocCarpetaSubClave(CodDocumento, sSubClave1, sSubClave2, sSubClave3, sSubClave4, Copias);
end;

procedure DoImprimirEtiquetaSecuenciaTrazabilidad(SecTrazabilidad: Integer; Copias: Integer = 1; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; NroPagina: String = '');
var
  sInfoAdicional1, sInfoAdicional2, sCodBarras: String;
  rpt: TqrEtiquetasDocCarpetas;
  iLongInfoAdic1, iLongInfoAdic2, iLong, iAnchoPag, iIndexPrintAct, iIndexPrintEtiq: Integer;
begin
  if SecTrazabilidad <> ART_EMPTY_ID then
    begin
      iIndexPrintEtiq := GetPrinterEtiquetas();

      if iIndexPrintEtiq = -1 then
        MsgBox('No se ha encontrado la impresora de etiquetas.', MB_ICONERROR + MB_OK)
      else
        begin
          if ImprimirSoloSecTrazabilidad then
            begin
              sInfoAdicional1 := InfoAdicional1;
              sInfoAdicional2 := InfoAdicional2;
            end
          else
            GetInfoAdicionalCodBarrasSecTrazabililidad(SecTrazabilidad, ART_EMPTY_ID, sInfoAdicional1, sInfoAdicional2);

          sInfoAdicional2 := InfoAdicional2 + Iif(IsEmptyString(NroPagina), '', ' ' + NroPagina);

          if not ImprimirSoloSecTrazabilidad and IsEmptyString(sInfoAdicional1) then
            sCodBarras := 'ERROR'
          else
            sCodBarras := Trim(IntToStr(SecTrazabilidad));

          rpt := TqrEtiquetasDocCarpetas.Create(nil);
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
                    Caption := sCodBarras;
                    Left    := 1;
                    Top     := 28;
                  end;

                with qrlBarras do
                  begin
                    Caption := '*' + qrlNumero.Caption + '*';
                    Left    := 1;
                    Top     := 7;
                    iLong   := Round(Get_PrintermmPerFontx(iIndexPrintEtiq, Font.Name, Font.Size, [], Caption));
                  end;

                with qrlInfoAdicional1 do
                  begin
                    Caption         := sInfoAdicional1;
                    Left            := 1;
                    Top             := 54;
                    Enabled         := True;
                    iLongInfoAdic1  := Round(Get_PrintermmPerFontx(iIndexPrintEtiq, Font.Name, Font.Size, [], Caption));
                  end;

                with qrlInfoAdicional2 do
                  begin
                    Caption         := sInfoAdicional2;
                    Left            := 1;
                    Top             := 71;
                    Enabled         := True;
                    iLongInfoAdic2  := Round(Get_PrintermmPerFontx(iIndexPrintEtiq, Font.Name, Font.Size, [], Caption));
                  end;

                iAnchoPag := Max(Max(iLong, Max(iLongInfoAdic1, iLongInfoAdic2)) + 10, 40);  // cada etiqueta, como mínimo de 4 cm de ancho

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

                Dec(iAnchoPag);
                qrlNumero.Size.Width         := iAnchoPag;
                qrlBarras.Size.Width         := iAnchoPag;
                qrlInfoAdicional1.Size.Width := iAnchoPag;
                qrlInfoAdicional2.Size.Width := iAnchoPag;

                Print;
              finally
                PrinterSettings.PrinterIndex := iIndexPrintAct;
                Free;
              end;
            end;
        end;
    end;
end;

procedure DoImprimirEtiquetaSecuenciaTrazabilidad_Pagina(SecTrazabilidad: Integer; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; CantPaginas: Integer = 1; Pagina: Integer = 1);
var
  sPag: String;
begin
  sPag := IntToStr(Pagina) + '/' + IntToStr(CantPaginas);
  DoImprimirEtiquetaSecuenciaTrazabilidad(SecTrazabilidad, 1, ImprimirSoloSecTrazabilidad, InfoAdicional1, InfoAdicional2, sPag);
end;

procedure DoImprimirEtiquetaSecuenciaTrazabilidad_Paginas(SecTrazabilidad: Integer; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = ''; CantPaginas: Integer = 1);
var
  i: Integer;
begin
  for i := 1 to CantPaginas do
    DoImprimirEtiquetaSecuenciaTrazabilidad_Pagina(SecTrazabilidad, ImprimirSoloSecTrazabilidad, InfoAdicional1, InfoAdicional2, CantPaginas, i);
end;

end.

