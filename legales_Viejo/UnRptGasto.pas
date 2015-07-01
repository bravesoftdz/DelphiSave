unit UnRptGasto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TRptGasto = class(TQuickRep)
    sdqJuicio: TSDQuery;
    SDQGasto: TSDQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand2: TQRBand;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
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
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText18: TQRDBText;
  private
  public
    procedure VistaPrevia(ANroOrden, ANroGasto : Integer);
  end;


implementation

uses
  AnsiSql, unDmPrincipal;

{$R *.DFM}
procedure TRptGasto.VistaPrevia(ANroOrden, ANroGasto: Integer);
begin
  sdqJuicio.ParamByName('pNroOrden').AsInteger := ANroOrden;
  OpenQuery( sdqJuicio );

  SDQGasto.SQL.Text :='SELECT gs_nrogasto, cp_denpago, gs_fecha, gs_monto, ' +
                             'gs_beneficiario, gs_observaciones, gs_concepto,GS_FECHABAJA ' +
                        'FROM Scp_Conpago, Lgs_Gastosgdeuda ' +
                       'WHERE GS_CONCEPTO = cp_conpago ' +
//                         'AND CP_TIPO = ''L'' '+
                         'AND GS_NROORDEN = ' + SqlValue(ANroOrden) +
                         'AND GS_nrogasto = ' + SqlValue(ANroGasto);
  OpenQuery( SDQGasto );

  PreviewModal;
end;

end.
