unit unRptEventosJuicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TrptEventosJuicio = class(TForm)
    sdqReporteCAB: TSDQuery;
    sdqEventosJuicio: TSDQuery;
    rptEventosJuicio: TQuickRep;
    qrbTitulo: TQRBand;
    qrdSiniestro: TQRDBText;
    qrdCuit: TQRDBText;
    qrlCarpeta: TQRLabel;
    qrlCaratula: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    qrbDetalle: TQRBand;
    qrdCodigo: TQRDBText;
    qrdDecripcionEvento: TQRDBText;
    qrdFechaEvento: TQRDBText;
    qrdObservaciones: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FIDJuicio : Integer;
  public
    { Public declarations }
    procedure Load(IdJuicio: Integer);
  end;

var
  rptEventosJuicio: TrptEventosJuicio;

implementation

uses
  SqlOracle, unCustomConsulta, SqlFuncs, CustomDlgs, VclExtra,
  unVisualizador;

{$R *.dfm}
procedure TrptEventosJuicio.FormCreate(Sender: TObject);
begin
  sdqReporteCAB.ParamByName('idjuicio').AsInteger := FIDJuicio;
  sdqEventosJuicio.ParamByName('idjuicio').AsInteger := FIDJuicio;
end;

procedure TrptEventosJuicio.Load(IdJuicio: Integer);
begin
  FIDJuicio := IdJuicio;
  sdqReporteCAB.ParamByName('idjuicio').AsInteger := FIDJuicio;
  sdqEventosJuicio.ParamByName('idjuicio').AsInteger := FIDJuicio;
  sdqReporteCAB.Open;
  sdqEventosJuicio.Open;
  rptEventosJuicio.PreviewModal;
//  Visualizar(rptEventosJuicio, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
end;

end.
