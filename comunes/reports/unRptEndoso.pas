unit unRptEndoso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Db, SDEngine, ExtCtrls, Qrctrls;

type
  TfrmReporteEndoso = class(TForm)
    qrEndoso: TQuickRep;
    sdqQuery: TSDQuery;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlLugarFecha: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    qrNroEndoso: TQRDBText;
    qrVigenciaEndoso: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrCUIT: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrMotivo: TQRLabel;
    procedure qrlLugarFechaPrint(sender: TObject; var Value: String);
    procedure qrVigenciaEndosoPrint(sender: TObject; var Value: String);
    procedure qrCUITPrint(sender: TObject; var Value: String);
    procedure qrMotivoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; IDEndoso: string); reintroduce; virtual;
  end;

  
implementation

{$R *.DFM}

uses unDmPrincipal;

procedure TfrmReporteEndoso.qrlLugarFechaPrint(sender: TObject; var Value: String);
begin
  Value := FormatDateTime('"Buenos Aires, "d "de" mmmm "de" yyyy', Date);
end;

procedure TfrmReporteEndoso.qrVigenciaEndosoPrint(sender: TObject; var Value: String);
begin
  Value := FormatDateTime('"Fecha de inicio de vigencia del endoso: "d "de" mmmm "de" yyyy',
           sdqQuery.FieldByName('EN_VIGENCIAENDOSO').AsDateTime);
end;

procedure TfrmReporteEndoso.qrCUITPrint(sender: TObject;
  var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy(Value, 3, 8) + '-' + Copy(Value, 11, 1);
end;

procedure TfrmReporteEndoso.qrMotivoPrint(sender: TObject; var Value: String);
begin
  Value := 'Motivo: ' + sdqQuery.FieldByName('MOTIVO').AsString;
end;

constructor TfrmReporteEndoso.Create(AOwner: TComponent; IDEndoso: string);
begin
  inherited Create(AOwner);
  sdqQuery.SQL.Text :=
         'SELECT EN_ID,' +
               ' ACTUALDATE,' +
               ' EN_ENDOSO,' +
               ' ''Prueba de reporte de endoso'' AS MOTIVO,' +
               ' EN_VIGENCIAENDOSO,' +
               ' CO_CONTRATO,' +
               ' CO_VIGENCIADESDE,' +
               ' CO_VIGENCIAHASTA,' +
               ' HM_NOMBRE, HM_CUIT,' +
               ' ''ESTRADA 805'' AS DOMICILIO_POSTAL,' +
               ' ''(1625) - ESCOBAR'' AS LOCALIDAD,' +
               ' ''BUENOS AIRES'' AS PROVINCIA,' +
               ' ''741200'' AS CODIGO_ACTIVIDAD,' +
               ' ''Servicios de contabilidad y teneduría de libros, auditoría y asesoramiento'' AS DESCRIPCION_ACTIVIDAD,' +
               ' 1 AS NIVEL' +
          ' FROM AEN_ENDOSO, ACO_CONTRATO, AHC_HISTORICOCONTRATO, AHM_HISTORICOEMPRESA' +
         ' WHERE EN_IDHISTORICOCONTRATO = HC_ID' +
           ' AND HC_IDFORMULARIO = CO_IDFORMULARIO' +
           ' AND EN_IDHISTORICOEMPRESA = HM_ID' +
           ' AND EN_ID = ' + IDEndoso;
  OpenQuery(sdqQuery);
end;

end.
