unit unRptAnexoRes365;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, ArtQReports,
  DB, SDEngine;

type
  TProcedureParameter = procedure of object;

  TqrAnexoRes365 = class(TQuickRep)
    sdqContrato: TSDQuery;
    b1: TQRBand;
    imgLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lbRazonSocial: TQRLabel;
    QRLabel4: TQRLabel;
    lbCuit: TQRLabel;
    QRLabel6: TQRLabel;
    lbContrato: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    imgFirma: TQRImage;
    lbFirmante: TQRLabel;
    lbCaracter: TQRLabel;
    lbOrigen: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRMemo2: TQRMemo;
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure AfterSendEmail(Sender: TObject);
    procedure BeforeSendEmail(Sender: TObject);
    procedure b1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FContrato: Integer;
    FImprimirDirectamente: Boolean;
    FOrigen: Integer;

    procedure LoadFirma;
    procedure UpdateHistoricoImpresion(const aDireccionesEmail: String = '');
  public
    procedure Preparar(const aContrato: Integer; const aImprimirDirectamente: Boolean = False);
  end;

var
  qrAnexoRes365: TqrAnexoRes365;

implementation

uses
  unVisualizador, unSesion, CUIT, unDmPrincipal, AnsiSql, General;

{$R *.DFM}

procedure TqrAnexoRes365.LoadFirma;
const
  FIRMANTE_ACTUAL = 446;
var
  sSql: String;
begin
  sSql := 'SELECT fi_caracter, fi_firma, fi_firmante' +
           ' FROM cfi_firma' +
          ' WHERE fi_id = ' + SqlInt(FIRMANTE_ACTUAL);
  with GetQuery(sSql) do
  try
    imgFirma.Enabled := not IsEmpty;
    lbFirmante.Enabled := imgFirma.Enabled;
    lbCaracter.Enabled := imgFirma.Enabled;

    if imgFirma.Enabled then
    begin
      imgFirma.Picture.Assign(FieldByName('FI_FIRMA'));
      lbFirmante.Caption := FieldByName('FI_FIRMANTE').AsString;
      lbCaracter.Caption := FieldByName('FI_CARACTER').AsString;
    end;
  finally
    Free;
  end;
end;

procedure TqrAnexoRes365.Preparar(const aContrato: Integer; const aImprimirDirectamente: Boolean = False);
begin
  FContrato := aContrato;
  FImprimirDirectamente := aImprimirDirectamente;
  FOrigen := 1;

  try
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  with sdqContrato do
  begin
    ParamByName('contrato').AsInteger := aContrato;
    Open;

    lbRazonSocial.Caption := FieldByName('EM_NOMBRE').AsString;
    lbCuit.Caption        := PonerGuiones(FieldByName('EM_CUIT').AsString);
  end;

  lbContrato.Caption := IntToStr(aContrato);

  LoadFirma;

  if aImprimirDirectamente then
    Print
  else
    Visualizar(Self, GetValores('Contrato ' + IntToStr(aContrato), '', aContrato),
              [oAlwaysShowDialog, oForceDB, oForceShowModal], True, 'AfterSendEmail', 'BeforeSendEmail');
end;

procedure TqrAnexoRes365.UpdateHistoricoImpresion(const aDireccionesEmail: String = '');
var
  sSql: String;
begin
  sSql :=
    'INSERT INTO afi.aan_anexo365' +
               ' (an_id, an_contrato, an_idendoso, an_fechaimpresion, an_usuimpresion, an_idorigenanexo365, an_email)' +
        ' VALUES (:ID, :contrato, (SELECT MAX(en_id)' +
                                   ' FROM aen_endoso' +
                                  ' WHERE en_contrato = :contrato), SYSDATE, :usuario, :origen, :email)';
  EjecutarSqlEx(sSql, [GetSecNextVal('AFI.SEQ_AAN_ID'), FContrato, FContrato, Sesion.UserID, IIF((aDireccionesEmail = ''), 1, 2), aDireccionesEmail]);
end;

procedure TqrAnexoRes365.QuickRepAfterPrint(Sender: TObject);
begin
  UpdateHistoricoImpresion;
end;

procedure TqrAnexoRes365.AfterSendEmail(Sender: TObject);
begin
  UpdateHistoricoImpresion(ValoresART.DireccionesEmailEnviado);
  PrinterSettings.Copies := 2;
end;

procedure TqrAnexoRes365.BeforeSendEmail(Sender: TObject);
begin
  FOrigen := 2;
  PrinterSettings.Copies := 1;
end;

procedure TqrAnexoRes365.b1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbOrigen.Caption := IntToStr(FOrigen);
end;

end.
