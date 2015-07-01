unit unQRContratoPCP;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  QRPrntr, qrpctrls, qrcb_run;

type
  TQRContratoPCP = class(TQuickRep)
    sdqQuery: TSDQuery;
    bTitle: TQRBand;
    lbTitulo1: TQRLabel;
    lbTitulo2: TQRLabel;
    lbTitulo3: TQRLabel;
    lbCodigoArt: TQRLabel;
    lbTitulo5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    lbRazonSocial: TQRLabel;
    QRLabel10: TQRLabel;
    lbDomicilio: TQRLabel;
    QRLabel12: TQRLabel;
    lbCiiu1: TQRLabel;
    lbCiiuDetalle1: TQRLabel;
    lbCiiu2: TQRLabel;
    lbCiiuDetalle2: TQRLabel;
    lbCiiu3: TQRLabel;
    lbCiiuDetalle3: TQRLabel;
    QRLabel19: TQRLabel;
    lbSolicitud: TQRLabel;
    qrLogo: TQRImage;
    QRShape1: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lbVigenciaDesde: TQRLabel;
    QRLabel25: TQRLabel;
    lbVigenciaHasta: TQRLabel;
    QRLabel27: TQRLabel;
    lbCuit: TQRLabel;
    lbContrato: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel32: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape14: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape15: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel68: TQRLabel;
    QRShape21: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    memoCondicionesGenerales: TQRMemo;
    lbLeyenda: TQRLabel;
    QRShape22: TQRShape;
    lbTipoImpresion: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    lbClausula: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel24: TQRLabel;
    ChildBand1: TQRChildBand;
    qrFirma2: TQRImage;
    QRLabel1: TQRLabel;
    lbPersona2: TQRLabel;
    lbPuesto2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel17: TQRLabel;
    lbCantTrabMenosDe12: TQRLabel;
    lbCantTrabDe12a16: TQRLabel;
    lbCantTrabMasDe16: TQRLabel;
    lbAlicuotaMenosDe12: TQRLabel;
    lbAlicuotaDe12a16: TQRLabel;
    lbAlicuotaMasDe16: TQRLabel;
    lbCuotaInicial: TQRLabel;
    lbMontoClausulaPenal: TQRLabel;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel2: TQRLabel;
    QRRichText2: TQRRichText;
    QRShape23: TQRShape;
    QRLabel3: TQRLabel;
    qrFirma1: TQRImage;
    lbPersona1: TQRLabel;
    lbPuesto1: TQRLabel;
    QRLabel26: TQRLabel;
    procedure bTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRLabel43Print(Sender: TObject; var Value: String);
  private
    FEndoso: Integer;
    FImprimeMembrete: Boolean;
    FImprimirClausulas: Boolean;
    FMostrarCabecera: Boolean;

    procedure CargarControles(const aLeyenda: String);
    procedure CargarTarifarioPCP(const aIdFormulario: Integer);
    procedure CargarFirma;
  public
    procedure Preparar(const aLeyenda: String; const aCantCopias: Integer; const aImprimir: Boolean = False;
                       const aNombreArchivo: String = '');

    property Endoso: Integer            read FEndoso            write FEndoso;
    property ImprimeMembrete: Boolean   read FImprimeMembrete   write FImprimeMembrete;
    property ImprimirClausulas: Boolean read FImprimirClausulas write FImprimirClausulas;
  end;

var
  QRContratoPCP: TQRContratoPCP;

implementation

uses
  CUIT, unDmPrincipal, Printers, General, unExportPDF;

{$R *.DFM}

procedure TQRContratoPCP.CargarControles(const aLeyenda: String);
var
  aDay: Word;
  aMonth: Word;
  aYear: Word;
  sSql: String;
begin
  with sdqQuery do
  begin
    DecodeDate(FieldByName('vig_desde').AsDateTime, aYear, aMonth, aDay);

    lbContrato.Caption      := FieldByName('contrato').AsString;
    lbVigenciaDesde.Caption := FormatDateTime('dd/mm/yyyy', FieldByName('vig_desde').AsDateTime);
    lbVigenciaHasta.Caption := FormatDateTime('dd/mm/yyyy', FieldByName('vig_hasta').AsDateTime);
    lbRazonSocial.Caption   := FieldByName('nombre').AsString;
    lbCuit.Caption          := PonerGuiones(FieldByName('cuit').AsString);
    lbDomicilio.Caption     := FieldByName('domicilio_l').AsString;
    lbCiiu1.Caption         := FieldByName('cod_actividad1').AsString;
    lbCiiu2.Caption         := FieldByName('cod_actividad2').AsString;
    lbCiiu3.Caption         := FieldByName('cod_actividad3').AsString;
    lbCiiuDetalle1.Caption  := FieldByName('actividad1').AsString;
    lbCiiuDetalle2.Caption  := FieldByName('actividad2').AsString;
    lbCiiuDetalle3.Caption  := FieldByName('actividad3').AsString;
    lbSolicitud.Caption     := FieldByName('nro_formulario').AsString;
  // lbSumaFija.Caption      := '$ ' + FieldByName('ht_alicuotapesos').AsString;
  //  lbPorcVariable.Caption  := '% ' + FieldByName('ht_porcmasa').AsString;
    memoCondicionesGenerales.Lines.Text := Format(memoCondicionesGenerales.Lines.Text,
                                                  [aDay,
                                                   FormatDateTime('mmmm', FieldByName('vig_desde').AsDateTime),
                                                   aYear,
                                                   FieldByName('nombre').AsString,
                                                   PonerGuiones(FieldByName('cuit').AsString),
                                                   FieldByName('contacto').AsString,
                                                   FieldByName('numerodocumento').AsString,
                                                   FieldByName('domicilio_l').AsString]);
    sSql :=
      'SELECT afiliacion.get_impresion(:contrato)' +
       ' FROM DUAL';
    lbTipoImpresion.Caption         := ValorSqlEx(sSql, [FieldByName('contrato').AsInteger]);
    lbLeyenda.Caption               := aLeyenda;
    lbMontoClausulaPenal.Caption    := FieldByName('montopenal').AsString;
    CargarTarifarioPCP(FieldByName('hc_idformulario').AsInteger);
  end;
end;

procedure TQRContratoPCP.CargarFirma;
var
  sSql: String;
begin
  sSql :=
    'SELECT fi_caracter, fi_firma, fi_firmante' +
     ' FROM cfi_firma' +
    ' WHERE fi_id = 446';
  with GetQuery(sSql) do
  try
    if IsEmpty then
    begin
      lbPersona2.Caption := ' ';
      lbPersona1.Caption := ' ';
      lbPuesto2.Caption  := ' ';
      lbPuesto1.Caption  := ' ';
    end
    else
    begin
      lbPersona2.Caption := FieldByName('fi_firmante').AsString;
      lbPuesto2.Caption := FieldByName('fi_caracter').AsString;
      lbPersona1.Caption := FieldByName('fi_firmante').AsString;
      lbPuesto1.Caption  := FieldByName('fi_caracter').AsString;

      if not FieldByName('fi_firma').IsNull then
      begin
        qrFirma2.Picture.Assign(FieldByName('fi_firma'));
        qrFirma1.Picture.Assign(FieldByName('fi_firma'));
      end;
    end;
  finally
    Free;
  end;
end;

procedure TQRContratoPCP.CargarTarifarioPCP(const aIdFormulario: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
  Sum : Currency;
begin
  lbCantTrabMenosDe12.Caption := '0';
  lbCantTrabDe12a16.Caption   := '0';
  lbCantTrabMasDe16.Caption   := '0';
  lbAlicuotaMenosDe12.Caption := '0';
  lbAlicuotaDe12a16.Caption   := '0';
  lbAlicuotaMasDe16.Caption   := '0';
  Sum := 0;
  sSql :=
       'SELECT pp_renglon, ap_canttrabajador, ap_alicuota ' +
       '  FROM afi.aap_alicuotas_pcp ' +
       '    LEFT JOIN afi.app_parametro_pcp ON ap_idparametro_pcp = pp_id AND NVL(ap_fechaalta, SYSDATE) BETWEEN pp_fechadesde AND pp_fechahasta  ' +
       ' WHERE ap_idformulario = :id ' ;

  aQuery := GetQueryEx(sSql, [aIdFormulario]);
  try
    while not aQuery.Eof do
    begin
      case aQuery.FieldByName('pp_renglon').AsInteger of
      1:
        begin
          lbCantTrabMenosDe12.Caption :=  aQuery.FieldByName('ap_canttrabajador').AsString;
          lbAlicuotaMenosDe12.Caption :=  aQuery.FieldByName('ap_alicuota').AsString;
          Sum :=  Sum + aQuery.FieldByName('ap_alicuota').AsCurrency;
        end;
        2:
        begin
          lbCantTrabDe12a16.Caption :=  aQuery.FieldByName('ap_canttrabajador').AsString;
          lbAlicuotaDe12a16.Caption :=  aQuery.FieldByName('ap_alicuota').AsString;
          Sum :=  Sum + aQuery.FieldByName('ap_alicuota').AsCurrency;
        end;
        3:
        begin
          lbCantTrabMasDe16.Caption :=  aQuery.FieldByName('ap_canttrabajador').AsString;
          lbAlicuotaMasDe16.Caption :=  aQuery.FieldByName('ap_alicuota').AsString;
          Sum :=  Sum + aQuery.FieldByName('ap_alicuota').AsCurrency;
        end;
      end;
      aQuery.Next;
    end;
    lbCuotaInicial.Caption := '$' + CurrToStr(Sum);
  finally
    aQuery.Free;
  end;
end;

procedure TQRContratoPCP.Preparar(const aLeyenda: String; const aCantCopias: Integer; const aImprimir: Boolean = False;
                                const aNombreArchivo: String = '');
begin
  OpenQueryEx(sdqQuery, [FEndoso]);
  CargarControles(aLeyenda);

  PrinterSettings.Copies := aCantCopias;
  PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

  // Agregado para que salga bien la carga de impresión masiva de contratos en la impresora LaserJet 4050 de Afiliaciones..
  if (IsWinXP) or (IsWindows7) then
  begin
    PrinterSettings.UseCustomBinCode := False;
    PrinterSettings.OutputBin := LexmarkAfiliacionesBin2;
    PrinterSettings.PaperSize := Letter;
  end;

  qrLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

  FMostrarCabecera := (aNombreArchivo <> '');   // Se muestra la cabecera siempre que se quiera exportar a PDF..

  CargarFirma;

  if aNombreArchivo <> '' then
  begin
    ImprimeMembrete := True;
    // Meter acá el código para imprimir las claúsulas que me tienen que pasar de afiliaciones..
    FileToPDFSvr(QRContratoPCP, ExtractFileDir(aNombreArchivo), aNombreArchivo, True);
  end
  else if aImprimir then
    Print
  else
    Preview;

  // Esto es porque esta impresora se queda con la ultima configuracion y el prox reporte me lo imprime por la bandeja 2. mal.
  if (IsWinXP) or (IsWindows7) then
  begin
    PrinterSettings.UseCustomBinCode := False;
    PrinterSettings.OutputBin := LexmarkAfiliacionesBin1;
    PrinterSettings.PaperSize := Letter;
  end;
end;

procedure TQRContratoPCP.bTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if FMostrarCabecera then
  begin
    lbCodigoArt.Enabled := True;
    lbTitulo1.Enabled   := True;
    lbTitulo2.Enabled   := True;
    lbTitulo3.Enabled   := True;
    lbTitulo5.Enabled   := True;
    qrLogo.Enabled      := True;
  end
  else
  begin
    qrLogo.Enabled      := ImprimeMembrete;
    lbCodigoArt.Enabled := ImprimeMembrete;
  end;
end;

procedure TQRContratoPCP.ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := FImprimirClausulas;
end;

procedure TQRContratoPCP.QRLabel43Print(Sender: TObject; var Value: String);
begin
  if (sdqQuery.FieldByName('contrato').AsInteger = 136481) or
     (sdqQuery.FieldByName('contrato').AsInteger = 136445) or
     (sdqQuery.FieldByName('contrato').AsInteger = 136439) then
    Value := 'incumplimiento de denuncias del empleador: $ 2.500 '
  else
    Value := 'incumplimiento de denuncias del empleador: $ 100.000 '
end;

end.
