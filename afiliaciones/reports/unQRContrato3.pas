unit unQRContrato3;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  QRPrntr;

type
  TQRContrato3 = class(TQuickRep)
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
    QRLabel29: TQRLabel;
    lbNivel: TQRLabel;
    lbContrato: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel32: TQRLabel;
    QRShape7: TQRShape;
    QRLabel33: TQRLabel;
    lbSumaFija: TQRLabel;
    QRLabel35: TQRLabel;
    lbPorcVariable: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel43: TQRLabel;
    QRShape13: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape14: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
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
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
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
    ChildBand1: TQRChildBand;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel1: TQRLabel;
    QRShape23: TQRShape;
    QRLabel2: TQRLabel;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRLabel3: TQRLabel;
    lbPuesto1: TQRLabel;
    lbPersona1: TQRLabel;
    QRLabel9: TQRLabel;
    lbPersona2: TQRLabel;
    lbPuesto2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrFirma1: TQRImage;
    qrFirma2: TQRImage;
    procedure bTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRLabel43Print(Sender: TObject; var Value: String);
  private
    FEndoso: Integer;
    FImprimeMembrete: Boolean;
    FImprimirClausulas: Boolean;
    FMostrarCabecera: Boolean;

    procedure CargarControles(const aLeyenda: String);
    procedure CargarFirma;
  public
    procedure Preparar(const aLeyenda: String; const aCantCopias: Integer; const aImprimir: Boolean = False;
                       const aNombreArchivo: String = '');

    property Endoso: Integer            read FEndoso            write FEndoso;
    property ImprimeMembrete: Boolean   read FImprimeMembrete   write FImprimeMembrete;
    property ImprimirClausulas: Boolean read FImprimirClausulas write FImprimirClausulas;
  end;

var
  QRContrato3: TQRContrato3;

implementation

uses
  CUIT, unDmPrincipal, Printers, General, unExportPDF;

{$R *.DFM}

procedure TQRContrato3.CargarControles(const aLeyenda: String);
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
    lbNivel.Caption         := FieldByName('nivel').AsString;
    lbSumaFija.Caption      := '$ ' + FieldByName('ht_alicuotapesos').AsString;
    lbPorcVariable.Caption  := '% ' + FieldByName('ht_porcmasa').AsString;
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
    lbTipoImpresion.Caption := ValorSqlEx(sSql, [FieldByName('contrato').AsInteger]);
    lbLeyenda.Caption       := aLeyenda;
  end;
end;

procedure TQRContrato3.CargarFirma;
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
      lbPersona1.Caption := ' ';
      lbPuesto1.Caption  := ' ';
      lbPersona2.Caption := ' ';
      lbPuesto2.Caption  := ' ';
    end
    else
    begin
      lbPersona1.Caption := FieldByName('fi_firmante').AsString;
      lbPersona2.Caption := lbPersona1.Caption;
      lbPuesto1.Caption := FieldByName('fi_caracter').AsString;
      lbPuesto2.Caption := lbPuesto1.Caption;

      if not FieldByName('fi_firma').IsNull then
      begin
        qrFirma1.Picture.Assign(FieldByName('fi_firma'));
        qrFirma2.Picture.Assign(FieldByName('fi_firma'));
      end;
    end;
  finally
    Free;
  end;
end;

procedure TQRContrato3.Preparar(const aLeyenda: String; const aCantCopias: Integer; const aImprimir: Boolean = False;
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
    FileToPDFSvr(QRContrato3, ExtractFileDir(aNombreArchivo), aNombreArchivo, True);
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

procedure TQRContrato3.bTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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

procedure TQRContrato3.ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := FImprimirClausulas;
end;

procedure TQRContrato3.QRLabel43Print(Sender: TObject; var Value: String);
begin
  if (sdqQuery.FieldByName('contrato').AsInteger = 136481) or
     (sdqQuery.FieldByName('contrato').AsInteger = 136445) or
     (sdqQuery.FieldByName('contrato').AsInteger = 136439) then
    Value := 'incumplimiento de denuncias del empleador: $ 2.500 '
  else
    Value := 'incumplimiento de denuncias del empleador: $ 100.000 '
end;

end.
