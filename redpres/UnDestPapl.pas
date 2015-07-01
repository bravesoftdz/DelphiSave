unit UnDestPapl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IntEdit, ExtCtrls, Mask,
  PatternEdit, Buttons, AdvGlowButton;

type
  //TDestinoPapel = (dpDigitalizacion, dpGuarda, dpArchivoART, dpSinPapel);
  TFrmDestinoPapel = class(TForm)
    TxtQHojas: TIntEdit;
    Label1: TLabel;
    DestPapel: TRadioGroup;
    LblCDoc: TPanel;
    btnAceptar: TAdvGlowButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCantHojas: Integer;
    FDestinoPapel: String;
    FPermitirSinPapel: Boolean;

    procedure SetCantHojas(const Value: Integer);
    procedure SetPermitirSinPapel(const Value: Boolean);
  public
    property CantHojas   : Integer      read FCantHojas          write SetCantHojas;
    property DestinoPapel: String       read FDestinoPapel       write FDestinoPapel;
    property PermitirSinPapel: Boolean  read FPermitirSinPapel   write SetPermitirSinPapel default True;
  end;

var
  FrmDestinoPapel: TFrmDestinoPapel;

const
  DP_DIGITALIZACION = 'D';
  DP_GUARDA         = 'G';
  DP_ARCHIVOART     = 'A';
  DP_SINPAPEL       = 'S';

implementation

uses CustomDlgs;

{$R *.DFM}

const
  DESTINO_PAPEL = DP_DIGITALIZACION + DP_GUARDA + DP_ARCHIVOART + DP_SINPAPEL;

{ By Fede}
procedure TFrmDestinoPapel.btnAceptarClick(Sender: TObject);
begin
  FDestinoPapel := Copy(DESTINO_PAPEL, DestPapel.ItemIndex + 1, 1);
  FCantHojas    := TxtQHojas.Value;
  Verificar(DestPapel.ItemIndex = 2, DestPapel, 'La opción Archivo ART se encuentra momentáneamente deshabilitada.');
  ModalResult   := mrOK;
end;

procedure TFrmDestinoPapel.SetCantHojas(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create('La cantidad de Hojas no puede ser negativa.')
  else
     FCantHojas := Value;
end;

procedure TFrmDestinoPapel.FormCreate(Sender: TObject);
begin
  FPermitirSinPapel := True;
end;

procedure TFrmDestinoPapel.SetPermitirSinPapel(const Value: Boolean);
begin
  if FPermitirSinPapel <> Value then
    begin
      FPermitirSinPapel    := Value;
      TRadioButton(DestPapel.Controls[3]).Enabled := False;
    end;
end;

end.
