unit unrptCalculoReservas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TfrmrptCalculoReservas = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlTotMSalarial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbMasaILT: TQRDBText;
    sdqDatosReserva: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    sdqCalculoReservaILT: TSDQuery;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlTotPrimaIBNR: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    sdqCalculoReservaIBNR: TSDQuery;
    QRLabel8: TQRLabel;
    qrlTotPrimaIBNER: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    sdqCalculoReservaIBNER: TSDQuery;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    qriLogo: TQRImage;
    procedure FormatoCampo2(sender: TObject; var Value: String);
    procedure FormatoCampo3(sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirCalculoReservas(Periodo: String);

implementation

uses
  unVisualizador, Periodo, unDmPrincipal, StrFuncs;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure DoImprimirCalculoReservas(Periodo: String);
var
  rpt: TfrmrptCalculoReservas;
  nCantMesesILT, nCantMesesIBNR, nCantMesesIBNER: Integer;
begin
  rpt := TfrmrptCalculoReservas.Create( nil );

  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
      qrlTitulo.Caption := 'CALCULO DE RESERVAS AL ' + DateToSTr( LastDayOfPeriodo( Periodo ) );

      sdqDatosReserva.ParamByName( 'Periodo' ).AsString := Periodo;
      OpenQuery( sdqDatosReserva );

      sdqCalculoReservaILT.ParamByName( 'VigenciaDesde' ).AsString := Periodo;
      OpenQuery( sdqCalculoReservaILT );
      nCantMesesILT  := sdqCalculoReservaILT.FieldByName( 'PERIODOSILT' ).AsInteger;
      qrlTotMSalarial.Caption := '1) Total M. Salarial Empresas Activas de Ultimos ' + IntToStr( nCantMesesILT ) + ' Meses';

      sdqCalculoReservaIBNR.ParamByName( 'VigenciaDesde' ).AsString := Periodo;
      OpenQuery( sdqCalculoReservaIBNR );
      nCantMesesIBNR  := sdqCalculoReservaIBNR.FieldByName( 'PERIODOSIBNR' ).AsInteger;
      qrlTotPrimaIBNR.Caption := '1) Total Prima Emitida en ' + IntToStr( nCantMesesIBNR ) + ' Meses';

      sdqCalculoReservaIBNER.ParamByName( 'VigenciaDesde' ).AsString := Periodo;
      OpenQuery( sdqCalculoReservaIBNER );
      nCantMesesIBNER  := sdqCalculoReservaIBNER.FieldByName( 'PERIODOSIBNER' ).AsInteger;
      qrlTotPrimaIBNER.Caption := '1) Total Prima Emitida en ' + IntToStr( nCantMesesIBNER ) + ' Meses';

      Visualizar( rpt, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal] );
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmrptCalculoReservas.FormatoCampo2(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value );
end;
{------------------------------------------------------------------------------}
procedure TfrmrptCalculoReservas.FormatoCampo3(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value, '%', 3 );
end;
{------------------------------------------------------------------------------}
end.
