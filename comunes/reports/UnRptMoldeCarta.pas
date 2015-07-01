unit UnRptMoldeCarta;

interface   

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrMoldeCarta = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrbPageFooter: TQRBand;
    qrmDatosART: TQRMemo;
    qrlReferencia: TQRLabel;
    qrdbPrimeraReferencia: TQRDBText;
    qrlSaludo: TQRLabel;
    qrlDestinatario: TQRLabel;
    qrlFecha: TQRLabel;
    qriLogoGBP: TQRImage;
    sdqDatos: TSDQuery;
    qrbSummary: TQRBand;
    qrlSaludoFinal: TQRLabel;
    qriLogoART: TQRImage;
    procedure qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FEMail: String;
    FFecha: TDateTime;
    FLugar: String;
    FShowReferencia: Boolean;
    FDestinatario: String;

    function GetShowDatosART: Boolean;
    procedure SetShowDatosART(const Value: Boolean);
    function GetShowLogoART: Boolean;
    procedure SetShowLogoART(const Value: Boolean);
    function GetShowLogoGBP: Boolean;
    procedure SetShowLogoGBP(const Value: Boolean);
    procedure SetShowReferencia(const Value: Boolean);
    procedure SetDestinatario(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;

    property Fecha: TDateTime        read FFecha            write FFecha;
    property Lugar: String           read FLugar            write FLugar;
    property EMail: String           read FEMail            write FEMail;
    property Destinatario: String    read FDestinatario     write SetDestinatario;
    property ShowLogoGBP: Boolean    read GetShowLogoGBP    write SetShowLogoGBP;
    property ShowLogoART: Boolean    read GetShowLogoART    write SetShowLogoART;
    property ShowDatosART: Boolean   read GetShowDatosART   write SetShowDatosART;
    property ShowReferencia: Boolean read FShowReferencia   write SetShowReferencia   default True;
  end;

implementation

{$R *.DFM}

uses
  DateTimeFuncs, unDmPrincipal;

constructor TqrMoldeCarta.Create(AOwner: TComponent);
begin
  inherited;
  
  ShowLogoGBP    := True;
  ShowLogoART    := True;
  ShowDatosART   := True;
  ShowReferencia := True;

  FDestinatario := 'Señores';
  Fecha         := 0;
  Lugar         := 'Buenos Aires';
  try
    qriLogoART.Center   := True;
    qriLogoART.AutoSize := True;
    qriLogoART.Stretch  := False;

    qriLogoGBP.Center   := True;
    qriLogoGBP.AutoSize := True;
    qriLogoGBP.Stretch  := False;

    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
    qriLogoGBP.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GBP');

    qriLogoART.Left := Round((qrbTitle.Width - qriLogoART.Width)/ 2);
  except
  end;
end;

function TqrMoldeCarta.GetShowDatosART: boolean;
begin
  Result := qrmDatosART.Enabled;
end;

function TqrMoldeCarta.GetShowLogoART: boolean;
begin
  Result := qriLogoART.Enabled;
end;

function TqrMoldeCarta.GetShowLogoGBP: boolean;
begin
  Result := qriLogoGBP.Enabled;
end;

procedure TqrMoldeCarta.qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlFecha.Caption := Lugar + ', ' + Get_FechaFormatoLargo(Fecha);
end;

procedure TqrMoldeCarta.SetShowDatosART(const Value: Boolean);
begin
  qrmDatosART.Enabled := Value;
end;

procedure TqrMoldeCarta.SetShowLogoART(const Value: Boolean);
begin
  qriLogoART.Enabled := Value;
end;

procedure TqrMoldeCarta.SetShowLogoGBP(const Value: Boolean);
begin
  qriLogoGBP.Enabled := Value;
end;

procedure TqrMoldeCarta.SetShowReferencia(const Value: Boolean);
begin
  if FShowReferencia <> Value then
    begin
      FShowReferencia               := Value;
      qrlReferencia.Enabled         := Value;
      qrdbPrimeraReferencia.Enabled := Value;
    end;
end;

procedure TqrMoldeCarta.SetDestinatario(const Value: String);
begin
  if FDestinatario <> Value then
    begin
      FDestinatario           := Value;
      qrlDestinatario.Caption := Value;
    end;
end;

end.

