unit unrptMovimientosDiarios;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptMovimientosDiarios = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    sdqMovimientos: TSDQuery;
    qrlTitulo: TQRLabel;
    qrlSubTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    qrlSaldoInicial: TQRLabel;
    QRLabel2: TQRLabel;
    qrlSaldoFinal: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qriLogo: TQRImage;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  procedure ImprimirMovDiarios(CodTipo, TipoDesc: String; Fecha: TDateTime);

var
  rptMovimientosDiarios: TrptMovimientosDiarios;

implementation

uses
  AnsiSql, General, DbFuncs, unDmPrincipal, unSesion, SqlFuncs, StrFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TrptMovimientosDiarios.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure ImprimirMovDiarios(CodTipo, TipoDesc: String; Fecha: TDateTime);
var
  sSql: String;
begin
  with TrptMovimientosDiarios.Create( nil ) do
    try
      qrlSubTitulo.Caption := 'Fondo Fijo de ' + TipoDesc + ' - Fecha: ' + DateToStr( Fecha );

      sSql := 'SELECT NVL(SUM(EF_MONTOINGRESO-EF_MONTOEGRESO), 0) ' +
                'FROM REF_EFECTIVO ' +
               'WHERE EF_FECHABAJA IS NULL ' +
                 'AND EF_TIPO = ' + SqlValue( CodTipo ) + ' ' +
                 'AND EF_FECHA < ' + SqlValue( Fecha );
      qrlSaldoInicial.Caption := Get_AjusteDecimales(ValorSql( sSql ), '$');

      sSql := 'SELECT NVL(SUM(EF_MONTOINGRESO-EF_MONTOEGRESO), 0) ' +
                'FROM REF_EFECTIVO ' +
               'WHERE EF_FECHABAJA IS NULL ' +
                 'AND EF_TIPO = ' + SqlValue( CodTipo ) + ' ' +
                 'AND EF_FECHA <= ' + SqlValue( Fecha );
      qrlSaldoFinal.Caption := Get_AjusteDecimales(ValorSql( sSql ), '$');

      sSql := 'SELECT EF_ORDENPAGO ORDEN_PAGO, M.TB_DESCRIPCION MOTIVO_EGRESO, EF_OBSERVACIONES OBSERVACIONES, ' +
                     'EF_MONTOINGRESO MONTO_INGRESO, EF_MONTOEGRESO MONTO_EGRESO ' +
                'FROM CTB_TABLAS M, CTB_TABLAS T, REF_EFECTIVO ' +
               'WHERE T.TB_CLAVE = ''TFFEF'' ' +
                 'AND T.TB_CODIGO = EF_TIPO ' +
                 'AND M.TB_CLAVE(+) = ''MEEFV'' ' +
                 'AND M.TB_CODIGO(+) = EF_MOTIVOEGRESO ' +
                 'AND EF_FECHABAJA IS NULL ' +
                 'AND EF_TIPO = ' + SqlValue( CodTipo ) + ' ' +
                 'AND EF_FECHA = ' + SqlValue( Fecha );
      OpenQuery( sdqMovimientos, sSql );

      Preview;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptMovimientosDiarios.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value,'$');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
