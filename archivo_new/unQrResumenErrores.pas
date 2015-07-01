unit unQrResumenErrores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrResumenErrores = class(TQuickRep)
    qrbHeader: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlPagina: TQRLabel;
    sdqDatos: TSDQuery;
    qrgGerencia: TQRGroup;
    QRDBText1: TQRDBText;
    qrbDetalle: TQRBand;
    QRDBText2: TQRDBText;
    qrdbCantError: TQRDBText;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    qrbFooter: TQRBand;
    QRShape9: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    qreConteoRegistro: TQRExpr;
    SummaryBand1: TQRBand;
    QRShape10: TQRShape;
    QRLabel5: TQRLabel;
    QRShape8: TQRShape;
    QRExpr1: TQRExpr;
    QRShape12: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    qrlPorc: TQRLabel;
    qrlTotPorc: TQRLabel;
    qrlTotPorcGeneral: TQRLabel;
    QRShape6: TQRShape;
    qrlFiltros: TQRLabel;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlPorcPrint(sender: TObject; var Value: String);
    procedure qrlTotPorcPrint(sender: TObject; var Value: String);
    procedure qrgGerenciaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    piCantRegistros: Integer;
    pdTotPorc: Double;
  public
  end;

  procedure DoImprimirResumenErroresGcia(SqlFromWhere, DescrFiltros: String);

implementation

uses
  unDmPrincipal, unVisualizador, CustomDlgs, StrFuncs;

{$R *.DFM}

procedure TqrResumenErrores.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Pág. ' + IntToStr(Self.PageNumber);
end;
                                                       
procedure DoImprimirResumenErroresGcia(SqlFromWhere, DescrFiltros: String);
var
  rpt: TqrResumenErrores;
  sSql, sSql2: String;
begin
  rpt := TqrResumenErrores.Create(nil);

  with rpt do
    try
      qrlFiltros.Caption := DescrFiltros;

      sSql := 'SELECT SECT.SE_DESCRIPCION GERENCIA, TB_DESCRIPCION ERROR, SUM(EU_CANTERRORES) CANTERROR ' +
                SqlFromWhere + ' ' +
               'GROUP BY SECT.SE_DESCRIPCION, TB_DESCRIPCION ' +
               'ORDER BY 1, 2';
      OpenQuery(sdqDatos, sSql);

      if sdqDatos.IsEmpty then
        MsgBox('No se han encontrados datos.', MB_ICONINFORMATION)
      else
        begin
          pdTotPorc := 0;

          sSql2 := 'SELECT SUM(CANTERROR) ' +
                     'FROM (' + sSql + ')';
          piCantRegistros := ValorSqlInteger(sSql2);

          Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
        end;
    finally
      Free;
    end;
end;

procedure TqrResumenErrores.qrlPorcPrint(sender: TObject; var Value: String);
begin
  Value     := Get_AjusteDecimales(ToStr(sdqDatos.FieldByName('CANTERROR').AsInteger/piCantRegistros*100, 3), '', 3);
  pdTotPorc := pdTotPorc + StrToFloat(Value);
end;

procedure TqrResumenErrores.qrlTotPorcPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(ToStr(pdTotPorc, 3), '', 3);
end;

procedure TqrResumenErrores.qrgGerenciaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  pdTotPorc := 0;
end;

end.

