unit unRptRemuneraciones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrRemuneraciones = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormatMonto(sender: TObject; var Value: String);
  private
  public
    procedure Preparar(Siniestro, Orden: Integer); 
  end;

implementation

uses
  unVisualizador, Strfuncs, unDmPrincipal;

{$R *.DFM}

procedure TqrRemuneraciones.Preparar(Siniestro, Orden: Integer);
begin
  qrlTitulo.Caption := 'Remuneraciones Declaradas (' + IntToStr(Siniestro) + '/' + IntToStr(Orden) + ')';

  sdqDatos.ParamByName('Siniestro').AsInteger := Siniestro;
  sdqDatos.ParamByName('Orden').AsInteger     := Orden;

  OpenQuery(sdqDatos);

  Visualizar(Self, GetValores('', ''), [oForceShowModal, oMailNotAllowed]);
end;

procedure TqrRemuneraciones.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
