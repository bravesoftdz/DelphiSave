unit unRptResumenRepositorio;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrResumenRepositorio = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    sdqDatos: TSDQuery;
    qrbDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape8: TQRShape;
    qrlPagina: TQRLabel;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRDBText4: TQRDBText;
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  public
  end;

  procedure DoImprimirResumenRepositorio(SqlFromWhere: String);

implementation

{$R *.DFM}
uses
  unDmPrincipal, unVisualizador;

procedure DoImprimirResumenRepositorio(SqlFromWhere: String);
var
  rpt: TqrResumenRepositorio;
  sSql: String;
begin
  rpt := TqrResumenRepositorio.Create(nil);

  with rpt do
    try
      sSql := 'SELECT B.DESCRTIPOARCH TIPOARCHIVO, B.CD NROMEDIO, ' +
                    'MIN(FECHAALTAREPOS) FECHAALTA, COUNT(*) CANTIDAD ' +
                'FROM (' + SqlFromWhere + ') B ' +
               'WHERE B.CD >= 10000 ' +
               'GROUP BY B.DESCRTIPOARCH, B.CD ' +
               'ORDER BY 2';
      OpenQuery(sdqDatos, sSql);

      Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
    finally
      Free;
    end;
end;

procedure TqrResumenRepositorio.PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Pág. ' + IntToStr(Self.PageNumber);
end;

end.
