unit unAfiCartasDoc;

{********************************************************}
{                                                        }
{    Cartas Documento de Afiliaciones                    }
{    En esta unit se deben alojar todas las funciones    }
{    relacionadas con es uso de cartas documento desde   }
{    el proyecto de afiliaciones.                        }
{                                                        }
{********************************************************}

interface

uses
  unArt, unDmPrincipal, Sysutils, General, QRPrntr;

type
  TAfiCartasDoc = class(TObject)
  private
  public
    function EsCambioCIIUCambioTarifario(const aCartaId: TTableId): Boolean;

    procedure MostrarCartaDocumento(const aIdCarta: TTableId; const aTransactionMode: TTransactionMode;
                                    const aImprimir: Boolean = False; const aCantidadCopias: Integer = -1;
                                    const aActualizarEndosoReimpresion: Boolean = False;
                                    const aImprimir_Firma: Boolean = True;
                                    const aEstadoCuentaCartaComercial: Boolean = False;
                                    const aImprimirFirmaSoloAlFinal: Boolean = False;
                                    const aImprimirDNI: Boolean = True; const aMostrarLogo: Boolean = False;
                                    const aForzarFirmantePie: Boolean = False; const aTraspasoEgreso: Boolean = False;
                                    const aNombreReporte: String = ''; const aSoloVisualizar: Boolean = False;
                                    const aPdfFileName: String = ''; const aMostrarEspera : Boolean = True);
  end;

implementation

uses
  AnsiSql, Printers, StrFuncs, unComunes, unRptCartaDocHeader, unRptCartaDocumento, unQREndoso1,
  unrptCartDocTraspasoIngreso, unrptCartDocTraspasoEgreso, unrptCartaDocTarifa, unrptCartDocTraspasoEgreso2,
  unVisualizador, unQREndoso0, Controls, QuickRpt, unExportPDF, Forms,
  unQREndosoBase, unQREntregaMaterial;

function TAfiCartasDoc.EsCambioCIIUCambioTarifario(const aCartaId: TTableId): Boolean;
var
  sMotivoEndoso: String;
  sSql: String;
begin
  sSql :=
    'SELECT en_motivo' +
     ' FROM aen_endoso, cca_carta' +
    ' WHERE en_id = ca_idendoso' +
      ' AND ca_idareatexto = ''06''' +
      ' AND ca_id = :id';
  sMotivoEndoso := ValorSqlEx(sSql, [aCartaId]);

  Result := (sMotivoEndoso = '01.11') or (sMotivoEndoso = '01.12');
end;

procedure TAfiCartasDoc.MostrarCartaDocumento(const aIdCarta: TTableId; const aTransactionMode: TTransactionMode;
                                              const aImprimir: Boolean = False; const aCantidadCopias: Integer = -1;
                                              const aActualizarEndosoReimpresion: Boolean = False;
                                              const aImprimir_Firma: Boolean = True;
                                              const aEstadoCuentaCartaComercial: Boolean = False;
                                              const aImprimirFirmaSoloAlFinal: Boolean = False;
                                              const aImprimirDNI: Boolean = True; const aMostrarLogo: Boolean = False;
                                              const aForzarFirmantePie: Boolean = False;
                                              const aTraspasoEgreso: Boolean = False; const aNombreReporte: String = '';
                                              const aSoloVisualizar: Boolean = False; const aPdfFileName: String = '';
                                              const aMostrarEspera : Boolean = True);
var
  aRptCartaDocTarifa: TrptCartaDocTarifa;
  aSalidaReporte: TSalidaReport;
  aTipoModulo: TTipoModulo;
  bEsCartaDocumento: Boolean;
  bTieneEndosoTemp: Boolean;
  iEndosoId: Integer;
  iNroImpresora: Integer;
  sMotivoEndoso: String;
  sNombreReporte: String;
  sSql: String;
begin
  bTieneEndosoTemp := False;
  bEsCartaDocumento := False;
  iEndosoId := 0;
  sNombreReporte := '';

  sSql :=
    'SELECT ca_tiposalida, ht_rpt, ca_idendoso, ca_idendosotemp' +
     ' FROM comunes.cht_historicotextocarta, cca_carta' +
    ' WHERE ht_id = ca_idhistoricotextocarta' +
      ' AND ca_id = :id';
  with GetQueryEx(sSql, [aIdCarta]) do
  try
    if not IsEmpty then
    begin
      bTieneEndosoTemp := not FieldByName('ca_idendosotemp').IsNull;
      bEsCartaDocumento := (FieldByName('ca_tiposalida').AsString = 'C');
      iEndosoId        := FieldByName('ca_idendoso').AsInteger;
      sNombreReporte    := LCase(IIF((aNombreReporte = ''), FieldByName('ht_rpt').AsString, aNombreReporte));
    end;
  finally
    Free;
  end;

  iNroImpresora := Printer.PrinterIndex;
  if LCase(sNombreReporte) = 'traspaso_ingreso' then
  begin
    Application.CreateForm(TrptCartDocTraspasoIngreso, rptCartDocTraspasoIngreso);
    with rptCartDocTraspasoIngreso do
    try
      PuedeImprimir := not aSoloVisualizar;
      if Preparar(aIdCarta, aTransactionMode) then
      begin
        PrinterSettings.PrinterIndex := iNroImpresora;
        if aCantidadCopias <> -1 then
          PrinterSettings.Copies := aCantidadCopias
        else if bEsCartaDocumento then
          PrinterSettings.Copies := 3;

        if aPdfFileName <> '' then
          FileToPDFSvr(TQuickRep(rptCartDocTraspasoIngreso), ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera)
        else if aImprimir then
          Print
        else
          PreviewModal;
      end;
    finally
      FreeAndNil(rptCartDocTraspasoIngreso);
    end;
  end
  else if LCase(sNombreReporte) = 'traspaso_egreso' then
  begin
    Application.CreateForm(TrptCartDocTraspasoEgreso, rptCartDocTraspasoEgreso);
    with rptCartDocTraspasoEgreso do
    try
      PuedeImprimir := not aSoloVisualizar;
      if Preparar(aIdCarta, aTransactionMode) then
      begin
        PrinterSettings.PrinterIndex := iNroImpresora;
        if aCantidadCopias <> -1 then
          PrinterSettings.Copies := aCantidadCopias
        else if bEsCartaDocumento then
          PrinterSettings.Copies := 3;

        if aPdfFileName <> '' then
          FileToPDFSvr(TQuickRep(rptCartDocTraspasoEgreso), ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera)
        else if aImprimir then
          Print
        else
          PreviewModal;
      end;
    finally
      FreeAndNil(rptCartDocTraspasoEgreso);
    end;
  end
  else if LCase(sNombreReporte) = 'traspaso_egreso2' then
  begin
    Application.CreateForm(TrptCartDocTraspasoEgreso2, rptCartDocTraspasoEgreso2);
    with rptCartDocTraspasoEgreso2 do
    try
      PuedeImprimir := not aSoloVisualizar;
      if Preparar(aIdCarta, aTransactionMode) then
      begin
        PrinterSettings.PrinterIndex := iNroImpresora;
        if aCantidadCopias <> -1 then
          PrinterSettings.Copies := aCantidadCopias
        else if bEsCartaDocumento then
          PrinterSettings.Copies := 3;

        if aPdfFileName <> '' then
          FileToPDFSvr(TQuickRep(rptCartDocTraspasoEgreso2), ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera)
        else if aImprimir then
          Print
        else
          PreviewModal;
      end;
    finally
      FreeAndNil(rptCartDocTraspasoEgreso2);
    end;
  end
  else if LCase(sNombreReporte) = 'carta_tarifa' then
  begin
    Application.CreateForm(TrptCartaDocTarifa, aRptCartaDocTarifa);
    with aRptCartaDocTarifa do
    try
      RemitenteCorreo := True;
      MostrarLogo := aMostrarLogo;
      ImprimirFirma := aImprimir_Firma;

      PuedeImprimir := not aSoloVisualizar;
      if Preparar(aIdCarta, aTransactionMode) then
      begin
        PrinterSettings.PrinterIndex := iNroImpresora;
        if aCantidadCopias <> -1 then
          PrinterSettings.Copies := aCantidadCopias
        else if bEsCartaDocumento then
          PrinterSettings.Copies := 3;

        if aPdfFileName <> '' then
          FileToPDFSvr(TQuickRep(aRptCartaDocTarifa), ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera)
        else if aImprimir then
          Print
        else
          PreviewModal;
      end;
    finally
      FreeAndNil(aRptCartaDocTarifa);
    end;
  end
  else if LCase(sNombreReporte) = 'carta_tarifa_comercial' then
  begin
    Application.CreateForm(TQREndoso1, QREndoso1);
    with QREndoso1 do
    try
      ImprimeMembrete := aMostrarLogo;
      PrinterSettings.PrinterIndex := iNroImpresora;
      PuedeImprimir := not aSoloVisualizar;
      ImprimirFirma := aImprimir_Firma;

      PrepararImpresion(aIdCarta, aTransactionMode, aImprimir, aCantidadCopias, aPdfFileName, aMostrarEspera)
    finally
      FreeAndNil(QREndoso1);
    end;
  end
  else if LCase(sNombreReporte) = 'entregamateriales' then
  begin
    Application.CreateForm(TQREntregaMaterial, QREntregaMaterial);
    with QREntregaMaterial do
    try
      //ImprimeMembrete := aMostrarLogo;
      //PrinterSettings.PrinterIndex := iNroImpresora;
      //PuedeImprimir := not aSoloVisualizar;
      //ImprimirFirma := aImprimir_Firma;

      PrepararImpresion(aIdCarta, aTransactionMode, aImprimir, aCantidadCopias, aPdfFileName)
      //PrepararImpresion(aIdCarta, aTransactionMode, aImprimir, aCantidadCopias, aPdfFileName)
    finally
      FreeAndNil(QREntregaMaterial);
    end;
  end
  else if (EsCambioCIIUCambioTarifario(aIdCarta)) and (not aTraspasoEgreso) and (not bTieneEndosoTemp) then
  begin
    Application.CreateForm(TQREndoso0, QREndoso0);
    with QREndoso0 do
    try
      IdEndoso        := iEndosoId;
      Formato         := 0;
      ImprimeMembrete := True;
      ImprimeMembrete := aMostrarLogo;
      MotivoEndoso    := 'Cambio de Actividad';
      PuedeImprimir := not aSoloVisualizar;

      sSql :=
        'SELECT en_motivo' +
         ' FROM aen_endoso' +
        ' WHERE en_id = :id';
      sMotivoEndoso := ValorSqlEx(sSql, [iEndosoId]);

      if (sMotivoEndoso = '01.11') or (sMotivoEndoso = '01.12') then
      begin
        MostrarOtrosCIIU := True;
        MotivoEndoso := 'Cambio de Actividad';
      end;

      PrepararImpresion(aIdCarta, aTransactionMode, aImprimir, 1, aPdfFileName, aMostrarEspera);
    finally
      FreeAndNil(QREndoso0);
    end;
  end
  else
  begin
    {$IFDEF EMISION}
      aTipoModulo := taEmision;
    {$ELSE}
      aTipoModulo := taAfiliaciones;
    {$ENDIF}

    if aPdfFileName <> '' then
      aSalidaReporte := srPdf
    else if aImprimir then
      aSalidaReporte := srPrint
    else
      aSalidaReporte := srPreview;

    DoImprimirCarta(aIdCarta, aTipoModulo, aSalidaReporte, aTransactionMode, aCantidadCopias,
                    aActualizarEndosoReimpresion, aImprimir_Firma, aEstadoCuentaCartaComercial,
                    aImprimirFirmaSoloAlFinal, aImprimirDNI, aMostrarLogo, aForzarFirmantePie, False, False, False,
                    False, False, False, '', aSoloVisualizar, False, aPdfFileName, False, False, True, True, 0, '', False, aMostrarEspera);
  end;
end;

end.
