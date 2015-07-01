unit unRptControlInterfaces;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unArt, DB, SDEngine;

type
  TrptControlInterfaces = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    sdqDatosSiart: TSDQuery;
    sdqDatosFinancials: TSDQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    sdqDatosSiartTIPO: TStringField;
    sdqDatosSiartCANTIDADILT: TFloatField;
    sdqDatosSiartTOTALILT: TFloatField;
    sdqDatosSiartTIPO_1: TStringField;
    sdqDatosSiartCANTIDADOC: TFloatField;
    sdqDatosSiartTOTALOC: TFloatField;
    sdqDatosSiartTIPO_2: TStringField;
    sdqDatosSiartCANTIDADCS: TFloatField;
    sdqDatosSiartTOTALCS: TFloatField;
    sdqDatosSiartTIPO_3: TStringField;
    sdqDatosSiartCANTIDADCOM: TFloatField;
    sdqDatosSiartTOTALCOM: TFloatField;
    sdqDatosSiartTIPO_4: TStringField;
    sdqDatosSiartCANTIDADPM: TFloatField;
    sdqDatosSiartTOTALPM: TFloatField;
    sdqDatosSiartTIPO_5: TStringField;
    sdqDatosSiartCANTIDADLEG: TFloatField;
    sdqDatosSiartTOTALLEG: TFloatField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    sdqDatosFinancialsTIPO: TStringField;
    sdqDatosFinancialsCANTIDADILT: TFloatField;
    sdqDatosFinancialsTOTALILT: TFloatField;
    sdqDatosFinancialsTIPO_1: TStringField;
    sdqDatosFinancialsCANTIDADOC: TFloatField;
    sdqDatosFinancialsTOTALOC: TFloatField;
    sdqDatosFinancialsTIPO_2: TStringField;
    sdqDatosFinancialsCANTIDADCS: TFloatField;
    sdqDatosFinancialsTOTALCS: TFloatField;
    sdqDatosFinancialsTIPO_3: TStringField;
    sdqDatosFinancialsCANTIDADCOM: TFloatField;
    sdqDatosFinancialsTOTALCOM: TFloatField;
    sdqDatosFinancialsTIPO_4: TStringField;
    sdqDatosFinancialsCANTIDADPM: TFloatField;
    sdqDatosFinancialsTOTALPM: TFloatField;
    sdqDatosFinancialsTIPO_5: TStringField;
    sdqDatosFinancialsCANTIDADLEG: TFloatField;
    sdqDatosFinancialsTOTALLEG: TFloatField;
    QRShape14: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRSysData1: TQRSysData;
    QRShape27: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    qrlCSCant: TQRLabel;
    qrlCSTot: TQRLabel;
    qrlILTCant: TQRLabel;
    qrlILTTot: TQRLabel;
    qrlOCCant: TQRLabel;
    qrlOCTot: TQRLabel;
    qrlCOMCant: TQRLabel;
    qrlCOMTot: TQRLabel;
    qrlPMCant: TQRLabel;
    qrlPMTot: TQRLabel;
    qrlLEGCant: TQRLabel;
    qrlLEGTot: TQRLabel;
    qrlSubtitulo: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    qriLogo: TQRImage;
    procedure FormatoCampo2(sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirControlInterfaces(Fecha: TDateTime; IdCompensacion: TTableId);

implementation

uses
  unVisualizador, unDmPrincipal, unDmFinancials, StrFuncs, DateTimeFuncs, General;

{$R *.DFM}

{------------------------------------------------------------------------------}
procedure DoImprimirControlInterfaces(Fecha: TDateTime; IdCompensacion: TTableId);
var
  rpt: TrptControlInterfaces;
  fFecha: TDateTimeEx;
begin
  dmFinancials.Conectar;
  try
    rpt := TrptControlInterfaces.Create( nil );

    with rpt do
      try
        qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );

        if Fecha = 0 then
          qrlSubtitulo.Caption := 'Proceso de Compensación: ' + IntToStr(IdCompensacion)
        else
          qrlSubtitulo.Caption := 'Fecha: ' + DateToStr(Fecha);

        fFecha := TDateTimeEx.Create(Fecha, False);
        try
          OpenQueryEx( sdqDatosSiart, [fFecha, fFecha, IdCompensacion] );
          dmFinancials.OpenQueryEx( sdqDatosFinancials, [fFecha, fFecha, Iif(IdCompensacion = ART_EMPTY_ID, '', IntToStr(IdCompensacion))] );
        finally
          fFecha.Free;
        end;

        qrlCSCant.Caption  := IntToStr((sdqDatosSiart.FieldByName('CANTIDADCS').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADCS').AsInteger));
        qrlCSTot.Caption   := FloatToStr((sdqDatosSiart.FieldByName('TOTALCS').AsCurrency - sdqDatosFinancials.FieldByName('TOTALCS').AsCurrency));

        qrlILTCant.Caption := IntToStr((sdqDatosSiart.FieldByName('CANTIDADILT').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADILT').AsInteger));
        qrlILTTot.Caption  := FloatToStr((sdqDatosSiart.FieldByName('TOTALILT').AsCurrency - sdqDatosFinancials.FieldByName('TOTALILT').AsCurrency));

        qrlOCCant.Caption  := IntToStr((sdqDatosSiart.FieldByName('CANTIDADOC').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADOC').AsInteger));
        qrlOCTot.Caption   := FloatToStr((sdqDatosSiart.FieldByName('TOTALOC').AsCurrency - sdqDatosFinancials.FieldByName('TOTALOC').AsCurrency));

        qrlCOMCant.Caption := IntToStr((sdqDatosSiart.FieldByName('CANTIDADCOM').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADCOM').AsInteger));
        qrlCOMTot.Caption  := FloatToStr((sdqDatosSiart.FieldByName('TOTALCOM').AsCurrency - sdqDatosFinancials.FieldByName('TOTALCOM').AsCurrency));
                        
        qrlPMCant.Caption  := IntToStr((sdqDatosSiart.FieldByName('CANTIDADPM').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADPM').AsInteger));
        qrlPMTot.Caption   := FloatToStr((sdqDatosSiart.FieldByName('TOTALPM').AsCurrency - sdqDatosFinancials.FieldByName('TOTALPM').AsCurrency));

        qrlLEGCant.Caption := IntToStr((sdqDatosSiart.FieldByName('CANTIDADLEG').AsInteger - sdqDatosFinancials.FieldByName('CANTIDADLEG').AsInteger));
        qrlLEGTot.Caption  := FloatToStr((sdqDatosSiart.FieldByName('TOTALLEG').AsCurrency - sdqDatosFinancials.FieldByName('TOTALLEG').AsCurrency));

        Visualizar( rpt, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal] );
      finally
        free;
      end;
  finally
    dmFinancials.Desconectar;
  end;
end;
{------------------------------------------------------------------------------}
procedure TrptControlInterfaces.FormatoCampo2(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value, '$' );
end;
{------------------------------------------------------------------------------}
end.

