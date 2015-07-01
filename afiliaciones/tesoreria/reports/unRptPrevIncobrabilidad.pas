unit unRptPrevIncobrabilidad;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptPrevIncobrabilidad = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    sdqDatosPrevIncobrabilidad: TSDQuery;
    qrMun_DT: TQRLabel;
    qrMun_DS: TQRLabel;
    qrMun_BI: TQRLabel;
    qrMun_TU: TQRLabel;
    qrMun_CO: TQRLabel;
    qrMun_OS: TQRLabel;
    qrMun_TOTPREV: TQRLabel;
    qrOPu_DT: TQRLabel;
    qrOPu_DS: TQRLabel;
    qrOPu_BI: TQRLabel;
    qrOPu_TU: TQRLabel;
    qrOPu_OS: TQRLabel;
    qrOPu_CO: TQRLabel;
    qrOPu_TOTPREV: TQRLabel;
    qrSPr_DT: TQRLabel;
    qrSPr_DS: TQRLabel;
    qrSPr_BI: TQRLabel;
    qrSPr_TU: TQRLabel;
    qrSPr_OS: TQRLabel;
    qrSPr_CO: TQRLabel;
    qrSPr_TOTPREV: TQRLabel;
    qrTot_DT: TQRLabel;
    qrTot_DS: TQRLabel;
    qrTot_BI: TQRLabel;
    qrTot_TU: TQRLabel;
    qrTot_OS: TQRLabel;
    qrTot_CO: TQRLabel;
    qrTot_TOTPREV: TQRLabel;
    qrPorc_OS: TQRLabel;
    qrPorc_TU: TQRLabel;
    qrPorc_CO: TQRLabel;
    qriLogo: TQRImage;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrMun_SD: TQRLabel;
    qrMun_SA: TQRLabel;
    qrOPu_SD: TQRLabel;
    qrOPu_SA: TQRLabel;
    qrSPr_SD: TQRLabel;
    qrSPr_SA: TQRLabel;
    qrTot_SD: TQRLabel;
    qrTot_SA: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel15: TQRLabel;
    qrGPBA_SD: TQRLabel;
    qrGPBA_SA: TQRLabel;
    qrGPBA_DT: TQRLabel;
    qrGPBA_DS: TQRLabel;
    qrGPBA_BI: TQRLabel;
    qrGPBA_TU: TQRLabel;
    qrGPBA_OS: TQRLabel;
    qrGPBA_CO: TQRLabel;
    qrGPBA_TOTPREV: TQRLabel;
    procedure FormatoCampo(Sender: TObject; var Value: String);
    procedure FormatoCampoPorc(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirPrevIncobrabilidad(Periodo: String);
  
var
  rptPrevIncobrabilidad: TrptPrevIncobrabilidad;

implementation

uses
  unVisualizador, unDmPrincipal, Periodo, StrFuncs, Numeros, CustomDlgs;

{$R *.DFM}

{------------------------------------------------------------------------------}
procedure DoImprimirPrevIncobrabilidad(Periodo: String);
var
  rpt: TrptPrevIncobrabilidad;
begin
  rpt := TrptPrevIncobrabilidad.Create( nil );

  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
      qrlTitulo.Caption := 'PREVISION INCOBRABILIDAD DEUDORES POR PREMIOS AL ' + DateToSTr( LastDayOfPeriodo( Periodo ) );

      sdqDatosPrevIncobrabilidad.ParamByName( 'Periodo' ).AsString := Periodo;
      OpenQuery( sdqDatosPrevIncobrabilidad );

      with sdqDatosPrevIncobrabilidad do
        if Eof then
          InvalidMsg(nil, 'No se encontraron datos.')
        else
          begin
            while not Eof do
              begin
                case FieldByName('CODSECTOR').AsInteger of
                  1: begin  // Gobernación de Bs. As.
                       qrGPBA_SD.Caption      := FieldByName('SALDO_DEUDOR').AsString;
                       qrGPBA_SA.Caption      := FieldByName('SALDO_ACREEDOR').AsString;
                       qrGPBA_DT.Caption      := FieldByName('DEUDA_TOTAL').AsString;
                       qrGPBA_DS.Caption      := FieldByName('DEUDA_SUJETA').AsString;
                       qrGPBA_BI.Caption      := FieldByName('BASE_IMPONIBLE').AsString;
                       qrGPBA_TU.Caption      := FieldByName('TASA_UNIFORME').AsString;
                       qrGPBA_CO.Caption      := FieldByName('COMISIONES').AsString;
                       qrGPBA_TOTPREV.Caption := FieldByName('TOTAL_PREVISION').AsString;
                     end;
                  2: begin	// Municipalidades
                       qrMun_SD.Caption      := FieldByName('SALDO_DEUDOR').AsString;
                       qrMun_SA.Caption      := FieldByName('SALDO_ACREEDOR').AsString;
                       qrMun_DT.Caption      := FieldByName('DEUDA_TOTAL').AsString;
                       qrMun_DS.Caption      := FieldByName('DEUDA_SUJETA').AsString;
                       qrMun_BI.Caption      := FieldByName('BASE_IMPONIBLE').AsString;
                       qrMun_TU.Caption      := FieldByName('TASA_UNIFORME').AsString;
                       qrMun_CO.Caption      := FieldByName('COMISIONES').AsString;
                       qrMun_TOTPREV.Caption := FieldByName('TOTAL_PREVISION').AsString;
                     end;
                  3: begin	// Resto del Sector Público
                       qrOPu_SD.Caption      := FieldByName('SALDO_DEUDOR').AsString;
                       qrOPu_SA.Caption      := FieldByName('SALDO_ACREEDOR').AsString;
                       qrOPu_DT.Caption      := FieldByName('DEUDA_TOTAL').AsString;
                       qrOPu_DS.Caption      := FieldByName('DEUDA_SUJETA').AsString;
                       qrOPu_BI.Caption      := FieldByName('BASE_IMPONIBLE').AsString;
                       qrOPu_TU.Caption      := FieldByName('TASA_UNIFORME').AsString;
                       qrOPu_CO.Caption      := FieldByName('COMISIONES').AsString;
                       qrOPu_TOTPREV.Caption := FieldByName('TOTAL_PREVISION').AsString;
                     end;
                  4: begin	// Sector Privado
                       qrSPr_SD.Caption      := FieldByName('SALDO_DEUDOR').AsString;
                       qrSPr_SA.Caption      := FieldByName('SALDO_ACREEDOR').AsString;
                       qrSPr_DT.Caption      := FieldByName('DEUDA_TOTAL').AsString;
                       qrSPr_DS.Caption      := FieldByName('DEUDA_SUJETA').AsString;
                       qrSPr_BI.Caption      := FieldByName('BASE_IMPONIBLE').AsString;
                       qrSPr_TU.Caption      := FieldByName('TASA_UNIFORME').AsString;
                       qrSPr_CO.Caption      := FieldByName('COMISIONES').AsString;
                       qrSPr_TOTPREV.Caption := FieldByName('TOTAL_PREVISION').AsString;
                     end;
                end;

                Next;
              end;

            qrTot_SD.Caption      := FloatToStr(StrToFloat(qrGPBA_SD.Caption) + StrToFloat(qrMun_SD.Caption) + StrToFloat(qrOPu_SD.Caption) + StrToFloat(qrSPr_SD.Caption));
            qrTot_SA.Caption      := FloatToStr(StrToFloat(qrGPBA_SA.Caption) + StrToFloat(qrMun_SA.Caption) + StrToFloat(qrOPu_SA.Caption) + StrToFloat(qrSPr_SA.Caption));
            qrTot_DT.Caption      := FloatToStr(StrToFloat(qrGPBA_DT.Caption) + StrToFloat(qrMun_DT.Caption) + StrToFloat(qrOPu_DT.Caption) + StrToFloat(qrSPr_DT.Caption));
            qrTot_DS.Caption      := FloatToStr(StrToFloat(qrGPBA_DS.Caption) + StrToFloat(qrMun_DS.Caption) + StrToFloat(qrOPu_DS.Caption) + StrToFloat(qrSPr_DS.Caption));
            qrTot_BI.Caption      := FloatToStr(StrToFloat(qrGPBA_BI.Caption) + StrToFloat(qrMun_BI.Caption) + StrToFloat(qrOPu_BI.Caption) + StrToFloat(qrSPr_BI.Caption));
            qrTot_TU.Caption      := FloatToStr(StrToFloat(qrGPBA_TU.Caption) + StrToFloat(qrMun_TU.Caption) + StrToFloat(qrOPu_TU.Caption) + StrToFloat(qrSPr_TU.Caption));
            qrTot_CO.Caption      := FloatToStr(StrToFloat(qrGPBA_CO.Caption) + StrToFloat(qrMun_CO.Caption) + StrToFloat(qrOPu_CO.Caption) + StrToFloat(qrSPr_CO.Caption));
            qrTot_TOTPREV.Caption := FloatToStr(StrToFloat(qrGPBA_TOTPREV.Caption) + StrToFloat(qrMun_TOTPREV.Caption) + StrToFloat(qrOPu_TOTPREV.Caption) + StrToFloat(qrSPr_TOTPREV.Caption));

            qrPorc_TU.Caption     := FloatToStr(RoundNumber(StrToFloat(qrTot_TU.Caption)/StrToFloat(qrTot_BI.Caption)*100));
            qrPorc_CO.Caption     := FloatToStr(RoundNumber(StrToFloat(qrTot_CO.Caption)/StrToFloat(qrTot_DS.Caption)*100));

            Visualizar( rpt, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal] );
          end;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TrptPrevIncobrabilidad.FormatoCampo(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value );
end;
{------------------------------------------------------------------------------}
procedure TrptPrevIncobrabilidad.FormatoCampoPorc(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value, '%' );
end;
{------------------------------------------------------------------------------}
end.

