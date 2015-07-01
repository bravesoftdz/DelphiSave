{*-----------------------------------------------------------------------------
 Estrategias para mostrar los tiff, el form que muestra los fax instancia una
 estrategia distinta dependiendo del discriminador MULTIPAGINAS de la tabla
 de esta manera instancia la estrategia correcta. Al ejecutar un metodo ejecuta
 la funcionalidad del metodo dependiendo la estrategia elegida.

@author slipchak
@version 0.1 inicial
------------------------------------------------------------------------------}
unit unEstrategiaTIFF;

interface

uses
  Graphics, AxCtrls, OleCtrls, ImgeditLib_TLB, Forms, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit,
  DateTimeEditors, ExtCtrls, FieldHider, ShortCutControl, Dialogs, Placemnt, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Controls, ComCtrls, ToolWin, Classes, Menus,
  IntEdit, CurrEdit, unCustomGridABM, FormPanel, SysUtils, CustomDlgs, General, AnsiSql, Windows;

type
  TEstrategiaTiff = class(TComponent)
    procedure imgFaxLoad(); virtual; abstract;
    procedure SetPage(AValue: Integer); virtual; abstract;
    procedure tbPageFirstClick(Sender: TObject); virtual; abstract;
    procedure tbPagePriorClick(Sender: TObject); virtual; abstract;
    procedure tbPageNextClick(Sender: TObject); virtual; abstract;
    procedure tbPageLastClick(Sender: TObject); virtual; abstract;
    procedure ImprimirRegistro(AHandleErrors, AIgnoreErrors: Boolean); virtual; abstract;
  end;

  TEstrategiaTiffMulti = class(TEstrategiaTiff)    {viejos fax}
    procedure imgFaxLoad(); override;
    procedure SetPage(AValue: Integer); override;
    procedure tbPageFirstClick(Sender: TObject); override;
    procedure tbPagePriorClick(Sender: TObject); override;
    procedure tbPageNextClick(Sender: TObject); override;
    procedure tbPageLastClick(Sender: TObject); override;
    procedure ImprimirRegistro(AHandleErrors, AIgnoreErrors: Boolean); override;
  end;

  TEstrategiaTiffSimple = class(TEstrategiaTiff)  {nuevos fax}
    procedure imgFaxLoad(); override;
    procedure SetPage(AValue: Integer); override;
    procedure tbPageFirstClick(Sender: TObject); override;
    procedure tbPagePriorClick(Sender: TObject); override;
    procedure tbPageNextClick(Sender: TObject); override;
    procedure tbPageLastClick(Sender: TObject); override;
    procedure ImprimirRegistro(AHandleErrors, AIgnoreErrors: Boolean); override;
  end;

implementation

uses
  unConsFax, unDmPrincipal, unPrincipal, Printers;

{----------------------------------------------------------------------------------------------------------------------}
{ TEstrategiaTiffMulti }

procedure TEstrategiaTiffMulti.imgFaxLoad;
begin
  with (Owner as TfrmConsFax) do
  begin
    edPage.Value        := imgFax.Page;
    edPage.MaxValue     := imgFax.PageCount;
    edPageCount.Value   := imgFax.PageCount;
    edZoom.Value        := imgFax.Zoom;

    tbZoomDec.Enabled   := edZoom.Value > 10;
    tbZoomInc.Enabled   := edZoom.Value < 400;

    tbPageFirst.Enabled := imgFax.Page > 1;
    tbPagePrior.Enabled := imgFax.Page > 1;

    tbPageNext.Enabled  := imgFax.Page < imgFax.PageCount;
    tbPageLast.Enabled  := imgFax.Page < imgFax.PageCount
  end;
end;

procedure TEstrategiaTiffMulti.SetPage(AValue: Integer);
begin
  with (Owner as TfrmConsFax) do
  begin
    imgFax.Page := AValue;
    imgFax.Display
  end;
end;

procedure TEstrategiaTiffMulti.tbPageFirstClick(Sender: TObject);
begin
  SetPage(1);
end;

procedure TEstrategiaTiffMulti.tbPageLastClick(Sender: TObject);
begin
  SetPage((Owner as TfrmConsFax).edPageCount.Value);
end;

procedure TEstrategiaTiffMulti.tbPageNextClick(Sender: TObject);
begin
  SetPage((Owner as TfrmConsFax).edPage.Value + 1);
end;

procedure TEstrategiaTiffMulti.tbPagePriorClick(Sender: TObject);
begin
  SetPage((Owner as TfrmConsFax).edPage.Value - 1);
end;

{ TEstrategiaTiffSimple }

procedure TEstrategiaTiffSimple.imgFaxLoad;
begin
  with (Owner as TfrmConsFax) do
  begin
    edPage.Value        := QPaginas.RecNo + 1;
    edPage.MaxValue     := sdqConsulta.FieldByName('FE_PAGINAS').AsInteger;
    edPageCount.Value   := sdqConsulta.FieldByName('FE_PAGINAS').AsInteger;
    edZoom.Value        := imgFax.Zoom;

    tbZoomDec.Enabled   := edZoom.Value > 10;
    tbZoomInc.Enabled   := edZoom.Value < 400;

    tbPageFirst.Enabled := QPaginas.RecNo + 1 > 1;
    tbPagePrior.Enabled := QPaginas.RecNo + 1 > 1;

    tbPageNext.Enabled  := QPaginas.RecNo + 1 < sdqConsulta.FieldByName('FE_PAGINAS').AsInteger;
    tbPageLast.Enabled  := QPaginas.RecNo + 1 < sdqConsulta.FieldByName('FE_PAGINAS').AsInteger;
  end;
end;

procedure TEstrategiaTiffSimple.SetPage(AValue: Integer);
begin
  with (Owner as TfrmConsFax) do
  begin
    if FileExists(QPaginas.FieldByName('FE_ARCHIVOIMAGEN').AsString) Then
    begin
      tbAbrirImagen.Enabled := True;
      imgFax.ClearDisplay;
      imgFax.Image := QPaginas.FieldByName('FE_ARCHIVOIMAGEN').AsString;
      pnlImgStatus.Font.Color := clWindowText;
      Try
        imgFax.Display;
        pnlImgStatus.Caption := Format('Archivo:%s Alto:%d Ancho:%d', [ExtractFileName(imgFax.Image), imgFax.ImageHeight, imgFax.ImageWidth]);
      except
        on E: Exception do
        begin
          pnlImgStatus.Font.Color := clRed;
          pnlImgStatus.Caption := 'Error al recuperar la imagen ' + ExtractFileName(imgFax.Image) + ':' + StringReplace(StringReplace(E.Message, #13, ', ', [rfReplaceAll]), #10, #0, [rfReplaceAll]);
        end;
      end;
    end
    else
    begin
      tbAbrirImagen.Enabled := False;
      pnlImgStatus.Font.Color := clRed;
      pnlImgStatus.Caption := 'El archivo no Existe (' + ExtractFileName(imgFax.Image) + ')';
    end;
  end;
end;

procedure TEstrategiaTiffSimple.tbPageFirstClick(Sender: TObject);
begin
  with (Owner as TfrmConsFax) do
    QPaginas.First;
  SetPage(0);
end;

procedure TEstrategiaTiffSimple.tbPageLastClick(Sender: TObject);
begin
  with (Owner as TfrmConsFax) do
    QPaginas.Last;
  SetPage(0);
end;

procedure TEstrategiaTiffSimple.tbPageNextClick(Sender: TObject);
begin
  with (Owner as TfrmConsFax) do
    QPaginas.Next;
  SetPage(0);
end;

procedure TEstrategiaTiffSimple.tbPagePriorClick(Sender: TObject);
begin
  with (Owner as TfrmConsFax) do
    QPaginas.Prior;
  SetPage(0);
end;

procedure TEstrategiaTiffMulti.ImprimirRegistro(AHandleErrors: Boolean; AIgnoreErrors: Boolean);
var
  ADevice,
  ADriver,
  APort: Array[0..79] of Char;
  ADeviceMode: THandle;
  iPage,
  iIntentos,
  AOutputFormat: Integer;
  bImprimir: Boolean;
const
  IEF_PIXELTOPIXEL = 0; { Pixel to pixel }
  IEF_INCHTOINCH   = 1; { Inch to inch }
  IEF_FITTOPAGE    = 2; { Fit to page }
  MAX_INTENTOS     = 5;
begin
	iIntentos := 0;

  with (Owner as TfrmConsFax) do
  begin
    WriteStatusText('Asignando Impresora...');
    Printer.PrinterIndex := Printer.PrinterIndex;

    WriteStatusText('Leyendo información de la Impresora...');
    Printer.GetPrinter(ADevice, ADriver, APort, ADeviceMode);
    if hScale = 0 Then
      hScale := (GetDeviceCaps(GetWindowDC(imgFax.Handle), LOGPIXELSX) / GetDeviceCaps(Printer.Handle, LOGPIXELSX));

    try
      for iPage := 1 to imgFax.PageCount do
      begin
          bImprimir := True;
          try
            imgFax.Page := iPage;
            imgFax.Display;
          except
            on E: Exception do
            begin
              if AIgnoreErrors Then
              begin
                bImprimir := False;
                if cmbErrores.ItemIndex <> 2 Then
                  ErrorMsgFmt(E, 'Error al imprimir la página %d.'#13#10'La página será marcada como impresa', [iPage]);
//              end else
//                raise;
              end;
            end;
          end;

          if bImprimir Then
          begin
            if imgFax.ImageHeight > (Printer.PageHeight * hScale) Then
              AOutputFormat := IEF_FITTOPAGE
            else
              AOutputFormat := IEF_INCHTOINCH;

            iIntentos := 0;
            repeat
              try
                Printer.GetPrinter(ADevice, ADriver, APort, ADeviceMode);

                if IsWinXP or ((iIntentos mod 2) = 0) then
                begin
                  ADriver[0] := 'W';
                  ADriver[1] := 'I';
                  ADriver[2] := 'N';
                  ADriver[3] := 'S';
                  ADriver[4] := 'P';
                  ADriver[5] := 'O';
                  ADriver[6] := 'O';
                  ADriver[7] := 'L';
                end;

                try
                  WriteStatusText(Format('Imprimiendo Imagen %d... (Device:"%s", Driver:"%s", Port:"%s", Format:"%d", Intento:"%d")', [iPage, string(ADevice), string(ADriver), string(APort), AOutputFormat, iIntentos]));
                  WriteRefFile(ARefFile, Format('SERIAL=%s FORM=%s N=%s Pag=%d/%s  -   F. Impr.: %s',
                       [sdqConsulta.FieldByName('FE_ID').AsString,
                        sdqConsulta.FieldByName('FE_IDFORMULARIO').AsString,
                        sdqConsulta.FieldByName('FE_NROORDEN').AsString, iPage,
                        sdqConsulta.FieldByName('FE_PAGINAS').AsString, FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime)]));

                  imgFax.AnnotationFont.Size  := 20;  //Round(40 * 100 / imgFax.ImageResolutionX );
                  imgFax.AnnotationFont.Color := clBlack;
                  imgFax.AnnotationFont.Style := [fsBold];
                  imgFax.AnnotationFillStyle  := wiOpaque;
                  imgFax.AnnotationTextFile := ARefFile;
                  imgFax.AnnotationType     := wiTextFromFile;
                  imgFax.Draw(0, 0, imgFax.ImageWidth, imgFax.ImageHeight);
                  imgFax.BurnInAnnotations(0, 0, 'imagen');
                  if not IsWinXP then
                    Delay(2000);

                  imgFax.PrintImage(iPage, iPage, AOutputFormat, True, String(ADevice), String(ADriver), String(APort));
                finally
                  try
                    imgFax.AnnotationType := wiNone;
                  except
                  end;
                  Application.HandleMessage;
                  Delay(500);
                end;
                iIntentos := MAX_INTENTOS;
              except
                Inc(iIntentos);
                if iIntentos = MAX_INTENTOS Then
                  raise;
              end;
            until iIntentos = MAX_INTENTOS;
          end;
      end;

      WriteStatusText('Marcando Imagen Impresa...');
      EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                     'SET FE_USUIMPRESION = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                         'FE_FECHAIMPRESION = SYSDATE ' +
                   'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_ID').AsInteger));
    except
      on E: Exception do
      begin
        if AHandleErrors Then
        begin
          WriteStatusText('Marcando Imagen como Errónea...');
          EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                         'SET FE_ERRORDESCRIPCION = SUBSTR(' + SqlValue(E.Message + #13#10 + StatusBar.SimpleText) + ', 1, 255), ' +
                             'FE_ERRORFECHA = SYSDATE ' +
                       'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_ID').AsInteger));
        end
        else
          raise;
      end;
    end;
    WriteStatusText(Format('Se realizaron %d intentos !', [iIntentos]));
  end;
end;


{----------------------------------------------------------------------------}
procedure TEstrategiaTiffSimple.ImprimirRegistro(AHandleErrors: Boolean; AIgnoreErrors: Boolean);
const
  IEF_PIXELTOPIXEL = 0; { Pixel to pixel }
  IEF_INCHTOINCH   = 1; { Inch to inch }
  IEF_FITTOPAGE    = 2; { Fit to page }
  MAX_INTENTOS     = 5;
var
  ADevice,
  ADriver,
  APort: array[0..79] of char;
  ADeviceMode: THandle;
  iPage,
  iIntentos,
  AOutputFormat: Integer;
  bImprimir: Boolean;
begin
	iIntentos := 0;

  with (Owner as TfrmConsFax) do
  begin
    WriteStatusText('Asignando Impresora...');
    Printer.PrinterIndex := Printer.PrinterIndex;

    WriteStatusText('Leyendo información de la Impresora...');
    Printer.GetPrinter(ADevice, ADriver, APort, ADeviceMode);
    if hScale = 0 Then
      hScale := (GetDeviceCaps(GetWindowDC(imgFax.Handle), LOGPIXELSX) / GetDeviceCaps(Printer.Handle, LOGPIXELSX));

    try
      QPaginas.First;
      for iPage := 1 to QPaginas.RecordCount do
      begin
        bImprimir := True;
        try
          //imgFax.Page := iPage; //fijo a uno porque es una pagina por archivo siempre lo que cambia son los registros.
          Self.SetPage(1);
          imgFax.Display;
        except
          on E: Exception do
          begin
            if AIgnoreErrors Then
            begin
              bImprimir := False;
              if cmbErrores.ItemIndex <> 2 Then
                ErrorMsgFmt(E, 'Error al imprimir la página %d.'#13#10'La página será marcada como impresa', [iPage]);
//              end else
//              raise;
            end;
          end;
        end;

        if bImprimir Then
        begin
          if imgFax.ImageHeight > (Printer.PageHeight * hScale) Then
            AOutputFormat := IEF_FITTOPAGE
          else
            AOutputFormat := IEF_INCHTOINCH;

          iIntentos := 0;
          repeat
            try
              Printer.GetPrinter(ADevice, ADriver, APort, ADeviceMode);

              if IsWinXP or ((iIntentos mod 2) = 0) then
              begin
                ADriver[0] := 'W';
                ADriver[1] := 'I';
                ADriver[2] := 'N';
                ADriver[3] := 'S';
                ADriver[4] := 'P';
                ADriver[5] := 'O';
                ADriver[6] := 'O';
                ADriver[7] := 'L';
              end;

              try
                WriteStatusText(Format('Imprimiendo Imagen %d... (Device:"%s", Driver:"%s", Port:"%s", Format:"%d", Intento:"%d")', [iPage, string(ADevice), string(ADriver), string(APort), AOutputFormat, iIntentos]));
                WriteRefFile(ARefFile, Format('SERIAL=%s FORM=%s N=%s Pag=%d/%s  -   F. Impr.: %s',
                     [sdqConsulta.FieldByName('FE_ID').AsString,
                      sdqConsulta.FieldByName('FE_IDFORMULARIO').AsString,
                      sdqConsulta.FieldByName('FE_NROORDEN').AsString, iPage,
                      sdqConsulta.FieldByName('FE_PAGINAS').AsString, FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime)]));

                imgFax.AnnotationFont.Size  := 20;  //Round(40 * 100 / imgFax.ImageResolutionX );
                imgFax.AnnotationFont.Color := clBlack;
                imgFax.AnnotationFont.Style := [fsBold];
                imgFax.AnnotationFillStyle  := wiOpaque;
                imgFax.AnnotationTextFile := ARefFile;
                imgFax.AnnotationType     := wiTextFromFile;
                imgFax.Draw(0, 0, imgFax.ImageWidth, imgFax.ImageHeight);
                imgFax.BurnInAnnotations(0, 0, 'imagen');
                if not IsWinXP then
                  Delay(2000);

                imgFax.PrintImage(1, 1, AOutputFormat, True, String(ADevice), String(ADriver), String(APort));
              //imgFax.PrintImage(0, 0, 1, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
              finally
                try
                  imgFax.AnnotationType := wiNone;
                except
                end;
                Application.HandleMessage;
                Delay(500);
              end;
              iIntentos := MAX_INTENTOS;
            except
              on E: Exception do
              begin
                Inc(iIntentos);
                if iIntentos = MAX_INTENTOS Then
                begin
                  WriteStatusText('Marcando Imagen como Errónea...');
                  EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                              'SET FE_ERRORDESCRIPCION = SUBSTR(' + SqlValue(E.Message + #13#10 + StatusBar.SimpleText) + ', 1, 255), ' +
                              'FE_ERRORFECHA = SYSDATE ' +
                      'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_ID').AsString));
                end;
                if AHandleErrors Then
                raise;
              end;
            end;
          until iIntentos = MAX_INTENTOS;
        end;
        QPaginas.Next;
      end;

      WriteStatusText('Marcando Imagen Impresa...');
      EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                     'SET FE_USUIMPRESION = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                         'FE_FECHAIMPRESION = SYSDATE ' +
                   'WHERE FE_NROORDEN = ' + SqlValue(sdqConsulta.FieldByName('FE_NROORDEN').AsString));
    except
      on E: Exception do
      begin
        if AHandleErrors Then
        begin
          WriteStatusText('Hay Imagenes marcadas como Erróneas...');
        end
        else
          raise;
      end;
    end;
    WriteStatusText(Format('Se realizaron %d intentos !', [iIntentos]));
  end;
end;


end.
