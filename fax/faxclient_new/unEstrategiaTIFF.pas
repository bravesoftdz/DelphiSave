unit unEstrategiaTIFF;

{*-----------------------------------------------------------------------------
 Estrategias para mostrar los tiff, el form que muestra los fax instancia una
 estrategia distinta dependiendo del discriminador MULTIPAGINAS de la tabla
 de esta manera instancia la estrategia correcta. Al ejecutar un metodo ejecuta
 la funcionalidad del metodo dependiendo la estrategia elegida.

@author slipchak
@version 0.1 inicial
------------------------------------------------------------------------------}

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxCurrEdit, rxToolEdit, {$ELSE} Placemnt, CurrEdit, ToolEdit, {$ENDIF}
  Graphics, AxCtrls, OleCtrls, Forms, DateComboBox, StdCtrls, Mask, PatternEdit, DateTimeEditors, ExtCtrls, FieldHider,
  ShortCutControl, Dialogs, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, Controls, ComCtrls, ToolWin, Classes, Menus, IntEdit, unCustomGridABM, FormPanel, SysUtils,
  CustomDlgs, General, AnsiSql, Windows, unFraVistaTIFF;

type
  TEstrategiaTiff = class(TComponent)
  private
    fraVista: TFraVistaTIFF;
    
    procedure SetFraVista(const Value: TFraVistaTIFF);
  public
    constructor Create(AOwner: TComponent); override;

    property Vista: TFraVistaTIFF read fraVista write SetFraVista;
  published
    procedure FirstImage(Sender: TObject); virtual; abstract;
    procedure imgFaxLoad(); virtual; abstract;
    procedure LastImage(Sender: TObject); virtual; abstract;
    procedure NextImage(Sender: TObject); virtual; abstract;
    procedure PrintRecord(AHandleErrors, AIgnoreErrors: Boolean); virtual; abstract;
    procedure PriorImage(Sender: TObject); virtual; abstract;
    procedure SetPage(AValue: Integer); virtual; abstract;
  end;

  TEstrategiaTiffMulti = class(TEstrategiaTiff)    {viejos fax}
    procedure FirstImage(Sender: TObject); override;
    procedure imgFaxLoad(); override;
    procedure LastImage(Sender: TObject); override;
    procedure NextImage(Sender: TObject); override;
    procedure PrintRecord(AHandleErrors, AIgnoreErrors: Boolean); override;
    procedure PriorImage(Sender: TObject); override;
    procedure SetPage(AValue: Integer); override;
  end;

  TEstrategiaTiffSimple = class(TEstrategiaTiff)  {nuevos fax}
    procedure FirstImage(Sender: TObject); override;
    procedure imgFaxLoad(); override;
    procedure LastImage(Sender: TObject); override;
    procedure NextImage(Sender: TObject); override;
    procedure PrintRecord(AHandleErrors, AIgnoreErrors: Boolean); override;
    procedure PriorImage(Sender: TObject); override;
    procedure SetPage(AValue: Integer); override;
  end;

implementation

uses
  unDmPrincipal, unPrincipal, Printers, QuickRpt, QRCtrls, unImageFunctions, unSesion;

procedure TEstrategiaTiffMulti.imgFaxLoad;
begin
  with Vista do
  begin
    edPage.Value        := Page;
    edPage.MaxValue     := PageCount;
    edPageCount.Value   := PageCount;
    edZoom.Value        := Zoom;

    tbZoomDec.Enabled   := edZoom.Value > 10;
    tbZoomInc.Enabled   := edZoom.Value < 400;

    tbPageFirst.Enabled := Page > 1;
    tbPagePrior.Enabled := Page > 1;

    tbPageNext.Enabled  := Page < PageCount;
    tbPageLast.Enabled  := Page < PageCount;
  end;
end;

procedure TEstrategiaTiffMulti.SetPage(AValue: Integer);
begin
  Vista.Page := AValue;
end;

procedure TEstrategiaTiffMulti.FirstImage(Sender: TObject);
begin
  SetPage(1);
end;

procedure TEstrategiaTiffMulti.LastImage(Sender: TObject);
begin
  SetPage(Vista.edPageCount.Value);
end;

procedure TEstrategiaTiffMulti.NextImage(Sender: TObject);
begin
  SetPage(Vista.edPage.Value + 1);
end;

procedure TEstrategiaTiffMulti.PriorImage(Sender: TObject);
begin
  SetPage(Vista.edPage.Value - 1);
end;

procedure TEstrategiaTiffSimple.imgFaxLoad;
begin
  with Vista do
  begin
    edPage.Value        := sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF};
    edPage.MaxValue     := PageCount;
    edPageCount.Value   := PageCount;

    tbZoomDec.Enabled   := edZoom.Value > 10;
    tbZoomInc.Enabled   := edZoom.Value < 400;

    tbPageFirst.Enabled := sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF} > 1;
    tbPagePrior.Enabled := sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF} > 1;

    tbPageNext.Enabled  := sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF} < PageCount;
    tbPageLast.Enabled  := sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF} < PageCount;
  end;
end;

procedure TEstrategiaTiffSimple.SetPage(AValue: Integer);
begin
  with Vista do
  begin
    if FileExists(sdqPaginas.FieldByName('fe_archivoimagen').AsString) then
    begin
      Page := AValue;
      tbAbrirImagen.Enabled := True;
      Image := sdqPaginas.FieldByName('fe_archivoimagen').AsString;

      try
        with GetFileInfo(sdqPaginas.FieldByName('fe_archivoimagen').AsString, 1) do
          Mensaje := Format('Archivo: %s Alto: %d Ancho: %d', [ExtractFileName(sdqPaginas.FieldByName('fe_archivoimagen').AsString), ImageHeight, ImageWidth]);
      except
        on E: Exception do
          Mensaje := 'Error al recuperar la imagen ' + ExtractFileName(Image) + ': ' + StringReplace(StringReplace(E.Message, #13, ', ', [rfReplaceAll]), #10, #0, [rfReplaceAll]);
      end;
    end
    else
    begin
      tbAbrirImagen.Enabled := False;
      Mensaje := 'Error: El archivo no existe (' + ExtractFileName(Image) + ')';
    end;
  end;
end;

procedure TEstrategiaTiffSimple.FirstImage(Sender: TObject);
begin
  Vista.sdqPaginas.First;
  SetPage(Vista.sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF});
end;

procedure TEstrategiaTiffSimple.LastImage(Sender: TObject);
begin
  Vista.sdqPaginas.Last;
  SetPage(Vista.sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF});
end;

procedure TEstrategiaTiffSimple.NextImage(Sender: TObject);
begin
  Vista.sdqPaginas.Next;
  SetPage(Vista.sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF});
end;

procedure TEstrategiaTiffSimple.PriorImage(Sender: TObject);
begin
  Vista.sdqPaginas.Prior;
  SetPage(Vista.sdqPaginas.RecNo {$IFDEF VER150}+ 1{$ENDIF});
end;

procedure TEstrategiaTiffMulti.PrintRecord(AHandleErrors: Boolean; AIgnoreErrors: Boolean);
var
//  iBrilloanterior: Integer;
  iIntentos: Integer;
  iPage: Integer;
  sEncabezado: String;
const
  IEF_PIXELTOPIXEL = 0; { Pixel to pixel }
  IEF_INCHTOINCH   = 1; { Inch to inch }
  IEF_FITTOPAGE    = 2; { Fit to page }
  MAX_INTENTOS     = 5;
begin
  with Vista do
  begin
    iIntentos := 0;
    WriteStatusText('Asignando Impresora...');
    Printer.PrinterIndex := Printer.PrinterIndex;

    WriteStatusText('Leyendo información de la Impresora...');

    try
      for iPage := 1 to PageCount do
      begin
        sEncabezado := Format('SERIAL=%d FORM=%d N=%s Pag=%d/%d  -   F. Impr.: %s',
                              [ID, IDFormulario, NroOrden, iPage, PageCount,
                               FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime)]);

        PrintImage(imgVista, 100, sEncabezado, GetFileInfo(Image, 2).Xdpi, GetFileInfo(Image, 2).Ydpi);
      end;

      WriteStatusText('Marcando Imagen Impresa...');
      EjecutarSqlEx('UPDATE ffe_faxentrantes' +
                      ' SET fe_usuimpresion = :usuimpresion,' +
                          ' fe_fechaimpresion = SYSDATE' +
                    ' WHERE fe_id = :id', [Sesion.UserID, ID]);
    except
      on E: Exception do
      begin
        if AHandleErrors Then
        begin
          WriteStatusText('Marcando Imagen como Errónea...');
          EjecutarSqlEx('UPDATE ffe_faxentrantes' +
                          ' SET fe_errordescripcion = SUBSTR(:errordescripcion, 1, 255),' +
                              ' fe_errorfecha = SYSDATE' +
                        ' WHERE fe_id = :id', [E.Message + #13#10 + GetTextoStatus, ID]);
        end
        else
          raise;
      end;
    end;
    WriteStatusText(Format('Se realizaron %d intentos !', [iIntentos]));
  end;
end;

procedure TEstrategiaTiffSimple.PrintRecord(AHandleErrors: Boolean; AIgnoreErrors: Boolean);
var
  ADevice,
  ADriver,
  APort: Array[0..79] of Char;
  ADeviceMode: THandle;
//  iBrilloanterior,
  iPage,
  iIntentos{,
  AOutputFormat}: Integer;
  bImprimir: Boolean;
  sEncabezado: String;
const
  IEF_PIXELTOPIXEL = 0; { Pixel to pixel }
  IEF_INCHTOINCH   = 1; { Inch to inch }
  IEF_FITTOPAGE    = 2; { Fit to page }
  MAX_INTENTOS     = 5;
begin
  with Vista do
  begin
    WriteStatusText('Asignando Impresora...');
    Printer.PrinterIndex := Printer.PrinterIndex;

    WriteStatusText('Leyendo información de la Impresora...');
    Printer.GetPrinter(ADevice, ADriver, APort, ADeviceMode);
    iIntentos := 0;

    try
      sdqPaginas.First;
      for iPage := 1 to sdqPaginas.RecordCount do
      begin
        bImprimir := True;
        try
          Self.SetPage(1);
        except
          on E: Exception do
          begin
            if AIgnoreErrors then
            begin
              bImprimir := False;
            end;
          end;
        end;

        if bImprimir then
        begin
          sEncabezado := Format('SERIAL=%d FORM=%d N=%s Pag=%d/%d  -   Impresión= %s',
                                [ID, IDFormulario, NroOrden, iPage, PageCount,
                                 FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime)]);

          iIntentos := 0;
          repeat
            try
              PrintImage(imgVista, 100, sEncabezado, GetFileInfo(Image, 2).Xdpi, GetFileInfo(Image, 2).Ydpi);

              WriteStatusText('Marcando Imagen Impresa...');
              EjecutarSqlEx('UPDATE ffe_faxentrantes' +
                              ' SET fe_usuimpresion = :usuimpresion,' +
                                  ' fe_fechaimpresion = SYSDATE' +
                            ' WHERE fe_nroorden = :nroorden' +
                              ' AND fe_nropagina = :nropagina', [Sesion.UserID, NroOrden, iPage]);

              iIntentos := MAX_INTENTOS;
            except
              on E: Exception do
              begin
                Inc(iIntentos);
                if iIntentos = MAX_INTENTOS then
                begin
                  WriteStatusText('Marcando Imagen como Errónea...');
                  EjecutarSqlEx('UPDATE ffe_faxentrantes' +
                                  ' SET fe_errordescripcion = SUBSTR(:errordescripcion, 1, 255),' +
                                      ' fe_errorfecha = SYSDATE' +
                                ' WHERE fe_id = :id', [E.Message + #13#10 + GetTextoStatus, ID]);
                end;
                if AHandleErrors then
                  raise;
              end;
            end;
          until iIntentos = MAX_INTENTOS;
        end;
        sdqPaginas.Next;
      end;
    except
      on E: Exception do
      begin
        if AHandleErrors then
          WriteStatusText('Hay imágenes marcadas como erróneas...')
        else
          raise;
      end;
    end;
    WriteStatusText(Format('Se realizaron %d intentos !', [iIntentos]));
  end;
end;

constructor TEstrategiaTiff.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TEstrategiaTiff.SetFraVista(const Value: TFraVistaTIFF);
begin
  fraVista := Value;
  Vista.Page := 1;
end;

end.
