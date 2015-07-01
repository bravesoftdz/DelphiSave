unit unRptMinutaComite;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrMinutaComite = class(TQuickRep)
    bPageHeader: TQRBand;
    qrLogo: TQRImage;
    sdqDatos: TSDQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    chbPageHeader: TQRChildBand;
    QRLabel8: TQRLabel;
    sbPresentes: TQRStringsBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    lbNumero: TQRLabel;
    QRLabel14: TQRLabel;
    lbUsuario: TQRLabel;
    QRLabel16: TQRLabel;
    bCotizaciones: TQRSubDetail;
    bTemasTratados: TQRStringsBand;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel32: TQRLabel;
    QRShape10: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure sbPresentesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText2Print(Sender: TObject; var Value: String);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure chbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    FNumeroPresente: Integer;

    procedure GetPresentes;
  public
    procedure Preparar(const aListaCotizaciones: TStringList);
  end;

var
  qrMinutaComite: TqrMinutaComite;

implementation

uses
  unVisualizador, unDmPrincipal, CUIT;

{$R *.DFM}

procedure TqrMinutaComite.GetPresentes;
var
  sSql: String;
begin 
  sbPresentes.Items.Clear;

  sSql :=
    'SELECT   se_nombre || '', '' || sc_descripcion presente' +
       ' FROM aur_usuariosreunioncomite, use_usuarios, usc_sectores' +
      ' WHERE ur_id = se_id' +
        ' AND se_sector = sc_codigo(+)' +
        ' AND ur_usubaja IS NULL' +
   ' ORDER BY ur_orden, se_nombre, sc_descripcion';
   
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      sbPresentes.Items.Add(FieldByName('presente').AsString);
      Next;
    end;
  finally
    Close;
  end;
end;

procedure TqrMinutaComite.Preparar(const aListaCotizaciones: TStringList);
var
  iLoop: Integer;
  sWhere: String;
begin
  qrLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_ARTCOLOR');

  GetPresentes;

  sWhere := '';
  for iLoop := 0 to aListaCotizaciones.Count - 1 do
    sWhere := sWhere + ' OR sc_id = ' + aListaCotizaciones[iLoop];

  Delete(sWhere, 1, 3);
  sdqDatos.SQL.Text := Format(sdqDatos.SQL.Text, [sWhere]);
  sdqDatos.Open;

  Visualizar(Self, GetValores(''), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
end;

procedure TqrMinutaComite.sbPresentesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Inc(FNumeroPresente);

  lbNumero.Caption := Format('%d    ', [FNumeroPresente]);
  lbUsuario.Caption := '  ' + sbPresentes.Item;
end;

procedure TqrMinutaComite.QRDBText2Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TqrMinutaComite.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  TFloatField(sdqDatos.FieldByName('PRIMAANUAL')).DisplayFormat      := '$ ,0.00;-$ ,0.00';
  TFloatField(sdqDatos.FieldByName('SALARIOPROMEDIO')).DisplayFormat := '$ ,0.00;-$ ,0.00';
  TFloatField(sdqDatos.FieldByName('TC_COSTOFINAL')).DisplayFormat   := '$ ,0.00;-$ ,0.00';  
  TFloatField(sdqDatos.FieldByName('TC_PORCVARIABLE')).DisplayFormat := ',0.00 %';
  TFloatField(sdqDatos.FieldByName('TC_SUMAFIJA')).DisplayFormat     := '$ ,0.00;-$ ,0.00';
end;

procedure TqrMinutaComite.chbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (QRPrinter.PageNumber = 1);
end;

procedure TqrMinutaComite.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FNumeroPresente := 0;
end;

end.
