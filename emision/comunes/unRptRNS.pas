unit unRptRNS;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  ArtQReports, ArchFuncs, unFuncionesEmision, unExportPDF;

type
  TqrRNS = class(TQuickRep)
    bPrincipal: TQRBand;
    imgLogo: TQRImage;
    QRLabel2: TQRLabel;
    sdqDatos: TSDQuery;
    QRBand1: TQRBand;
    QRLabel99: TQRLabel;
    QRShape3: TQRShape;
    s: TQRShape;
    QRLabel50: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    qrRazonSocial: TQRLabel;
    qrCuit: TQRLabel;
    qrTelefono: TQRLabel;
    qrFax: TQRLabel;
    qrEmail: TQRLabel;
    QRShape17: TQRShape;
    QRLabel17: TQRLabel;
    QRShape18: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape21: TQRShape;
    sdqDatosNota: TSDQuery;
    qrPeriodo: TQRLabel;
    qrEmpleados: TQRLabel;
    qrRemuneracion: TQRLabel;
    qrBarras: TArtQRLabel;
    QRCodigoBarraTrad: TArtQRLabel;
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure qrBarrasPrint(sender: TObject; var Value: String);
  private
  public
    procedure Preparar(aIdNotaContratoPeriodo: Integer);
  end;

var
  qrRNS: TqrRNS;

implementation

uses
  unSesion, General, unDmPrincipal, AnsiSql, StrFuncs;

{$R *.DFM}

procedure TqrRNS.Preparar(aIdNotaContratoPeriodo: Integer);
var
  Path: String;
  PathDestino: String;
  Contrato, Periodo, Cuit, Secuencia: String;
begin
  try
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  with sdqDatos do
  begin
    Close;
    Open;
  end;

  with sdqDatosNota do
  begin
    ParamByName('idnotacontratoperiodo').AsInteger := aIdNotaContratoPeriodo;
    Open;
    if not Eof then
    begin
      qrRazonSocial.Caption := qrRazonSocial.Caption +  '   ' + fieldbyname('em_nombre').AsString;
      qrCuit.Caption := qrCuit.Caption + '   ' + fieldbyname('em_cuit').AsString;
      qrTelefono.Caption := qrTelefono.Caption + '   ' + fieldbyname('telefono').AsString;
      qrFax.Caption := qrFax.Caption + '   ' + fieldbyname('fax').AsString;
      qrEmail.Caption := qrEmail.Caption + '   ' + fieldbyname('we_mail').AsString;
      qrPeriodo.Caption := fieldbyname('np_periodo').AsString;
      qrEmpleados.Caption := fieldbyname('np_totalempleados').AsString;
      qrRemuneracion.Caption := Get_AjusteDecimales(fieldbyname('np_totalmasasalarial').AsString, '$');
      qrBarras.Caption := (*fieldbyname('em_cuit').AsString + '-' + *) fieldbyname('no_contrato').AsString  + ' ' + fieldbyname('no_secuencia').AsString;
      QRCodigoBarraTrad.Caption := (*fieldbyname('em_cuit').AsString + '-' +*) fieldbyname('no_contrato').AsString  + ' ' + fieldbyname('no_secuencia').AsString;
      
      Contrato := fieldbyname('no_contrato').AsString;
      Periodo := fieldbyname('np_periodo').AsString;
      Cuit := fieldbyname('em_cuit').AsString;
      Secuencia := fieldbyname('no_secuencia').AsString;
      Path := IncludeTrailingBackslash(TempPath) + fieldbyname('em_cuit').AsString + '_' + fieldbyname('no_contrato').AsString + '_' + fieldbyname('no_secuencia').AsString + '.qrp';
    end;
    Close;
  end;

  self.Prepare;

  self.QRPrinter.Save(Path);
  self.QRPrinter.Free;

  PathDestino := IncludeTrailingBackslash(get_parametrobyclave('PATHOP')) +  LPad(copy(contrato,Length(contrato)-2,3),'0',3) + '\' + Periodo;
  ForceDirectories(PathDestino);
  PathDestino := IncludeTrailingBackslash(PathDestino);

  if not FileToPDFSvr(Path,pathDestino) then
    raise Exception.Create('Error al generar el PDF');

  //Visualizar(Self, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
end;

procedure TqrRNS.QRDBText16Print(sender: TObject; var Value: String);
begin
  Value := '';
end;

procedure TqrRNS.qrBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + Value + '*'; 
end;

end.
