unit unrptImportacionNominas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine,unDmPrincipal;

type
  TrptImportacionNominas = class(TForm)
    qrResolucion: TQuickRep;
    DetailBand1: TQRBand;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    QRShape209: TQRShape;
    QRShape210: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    sdqEmpresa: TSDQuery;
    sdqRiesgos: TSDQuery;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape30: TQRShape;
    QRShape58: TQRShape;
    QRShape64: TQRShape;
    s: TQRShape;
    QRShape86: TQRShape;
    QRShape92: TQRShape;
    QRShape97: TQRShape;
    QRShape114: TQRShape;
    QRShape120: TQRShape;
    QRShape254: TQRShape;
    QRShape260: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    qrRazonSocial: TQRDBText;
    qrDomicilio: TQRDBText;
    qrCUIT: TQRDBText;
    qrCIIU: TQRDBText;
    qrLocalidad: TQRDBText;
    qrEstablecimiento: TQRDBText;
    qrCP: TQRDBText;
    qrNAfiliados: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrFecha: TQRLabel;
    QRImage1: TQRImage;
    procedure FormCreate(Sender: TObject);
  private
    FCuit         : String;
    FEstableci    : Integer;
//    FTipo         : String;
    FFecha        : TDate;
  public
    procedure Load(Cuit: String; Estableci: Integer; Fecha: TDate; pPath : String = '');
    procedure ExportPdf(Cuit: String; Estableci: Integer; Fecha: TDate; pPath : String);
  end;

var
  rptImportacionNominas: TrptImportacionNominas;

implementation

uses
  SqlOracle, unCustomConsulta, SqlFuncs, CustomDlgs, VclExtra,
  unVisualizador, ArchFuncs, unExportPDF;

Const
  LpH1 = 27;

{$R *.dfm}

procedure TrptImportacionNominas.ExportPdf(Cuit: String;
  Estableci: Integer; Fecha: TDate; pPath : String);
begin
  Load(Cuit,Estableci, Fecha,pPath);
end;

procedure TrptImportacionNominas.FormCreate(Sender: TObject);
begin
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqRiesgos.ParamByName('cuit').AsString := FCUIT;
  sdqRiesgos.ParamByName('estableci').AsInteger := FEstableci;
  sdqRiesgos.ParamByName('fecha').AsDate := FFecha;
end;


procedure TrptImportacionNominas.Load(Cuit: String; Estableci: Integer; Fecha: TDate; pPath : String = '');
var
  format : TFormatSettings;
  LineasNulas: Integer;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  FCuit       := Cuit;
  FEstableci  := Estableci;
  FFecha      := Fecha;
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqRiesgos.ParamByName('cuit').AsString := FCUIT;
  sdqRiesgos.ParamByName('estableci').AsInteger := FEstableci;
  sdqRiesgos.ParamByName('fecha').AsDate := FFecha;
  sdqEmpresa.Open;
  sdqRiesgos.Open;

  if sdqRiesgos.RecordCount = LpH1 then
      LineasNulas := 0
  else
    if (sdqRiesgos.RecordCount) mod LpH1 = 0 then
        LineasNulas := 0
      else
        LineasNulas := (LpH1 + 1) - (sdqRiesgos.RecordCount) mod LpH1;

    sdqRiesgos.Close;
    sdqRiesgos.SQL.Append(' UNION ALL ' +
                          'SELECT NULL rt_cuil, NULL nombre, NULL rl_fechaingreso, ' +
                          '       NULL rl_sector, NULL rt_fechainiexpo, NULL hl_fechaegreso, ' +
                          '       NULL riesgo1, NULL riesgo2, NULL riesgo3, ' +
                          '       NULL riesgo4, NULL riesgo5, NULL riesgo6, ' +
                          '       NULL riesgo7, NULL riesgo8, NULL riesgo9, ' +
                          '       NULL riesgo10, NULL riesgo11, NULL riesgo12 ' +
                          '  FROM aco_contrato ' +
                          ' WHERE ROWNUM <  ' + SqlInt(LineasNulas)+
                          ' ORDER BY 2');
    sdqRiesgos.Open;

  qrFecha.Caption := DateToStr(FFecha,format);
  if pPath = '' then
  begin
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB]);
  end
  else
  begin

    qrResolucion.Prepare;
    qrResolucion.QRPrinter.Title := pPath;
    qrResolucion.QRPrinter.Print;
    qrResolucion.QRPrinter.Free;
    qrResolucion.QRPrinter.Cleanup;
  end;
end;

end.
