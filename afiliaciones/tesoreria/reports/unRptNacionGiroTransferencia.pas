unit unRptNacionGiroTransferencia;

interface       

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptNacionGiroTransferencia = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    sdqDatos: TSDQuery;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlGirosTransf: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRExpr2: TQRExpr;
    qrlTextoInf: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel17: TQRLabel;
    qrlCantCheques: TQRLabel;
    QRMemo1: TQRMemo;
    qrlTitTipo: TQRLabel;
    qriLogo: TQRImage;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public

  end;

  procedure DoImprimirNacionGiroTransferencia(Tipo: String);

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure DoImprimirNacionGiroTransferencia(Tipo: String);
var
  sSql: String;
  rpt: TrptNacionGiroTransferencia;
begin
  rpt := TrptNacionGiroTransferencia.Create( nil );

  with rpt do                                 
    try
      if Tipo = 'G' then
        sSql := 'SELECT CE_NUMERO CHEQUE, CE_FECHACHEQUE FECHA, TJ_NOMBRE BENEFICIARIO, TJ_CUIL NRODOC, ' +
                     '''--'' NROCTA, SB_NOMBRE SUCURSAL, SB_CODIGO NROSUC, CE_MONTO IMPORTE ' +
                  'FROM ZSB_SUCURSALBANCO, CTJ_TRABAJADOR, RCE_CHEQUEEMITIDO, CCP_CUENTAPAGO ' +
                 'WHERE TJ_ID = CE_IDTRABAJADOR ' +
                   'AND CP_IDACREEDOR = CE_IDTRABAJADOR ' +
                   'AND CP_IDSUCURSAL = SB_ID ' +
                   'AND CP_TIPOACREEDOR = ''TA'' ' +
                   'AND CP_IDBANCO = 6 ' +
                   'AND CP_NROCUENTA IS NULL ' +
                   'AND CP_FECHABAJA IS NULL ' +
                   'AND CE_FECHAIMPRESIONNOTA IS NULL'
      else
        sSql := 'SELECT CE_NUMERO CHEQUE, CE_FECHACHEQUE FECHA, TJ_NOMBRE BENEFICIARIO, TJ_CUIL NRODOC, ' +
                       'CP_NROCUENTA NROCTA, SB_NOMBRE SUCURSAL, SB_CODIGO NROSUC, CE_MONTO IMPORTE ' +
                  'FROM ZSB_SUCURSALBANCO, CTJ_TRABAJADOR, RCE_CHEQUEEMITIDO, CCP_CUENTAPAGO ' +
                 'WHERE TJ_ID = CE_IDTRABAJADOR ' +
                   'AND CP_IDACREEDOR = CE_IDTRABAJADOR ' +
                   'AND CP_IDSUCURSAL = SB_ID ' +
                   'AND CP_TIPOACREEDOR = ''TA'' ' +
                   'AND CP_IDBANCO = 6 ' +
                   'AND CP_NROCUENTA IS NOT NULL ' +
                   'AND CP_FECHABAJA IS NULL ' +
                   'AND CE_FECHAIMPRESIONNOTA IS NULL';

      OpenQuery( sdqDatos, sSql );

      if not sdqDatos.Eof then
        begin
          qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );

          ReportTitle := Iif(Tipo = 'G', 'Banco Nación Giros', 'Banco Nación Transferencias');
          qrlTitTipo.Caption     := Iif(Tipo = 'G', 'Giros', 'Transferencias') + ' sobre:';
          qrlCantCheques.Caption := IntToStr(sdqDatos.RecordCount) + ' Cheque/s';

          Visualizar( rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal] );
        end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TrptNacionGiroTransferencia.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.
