unit unCapturarCodigoBarras;
// relacionado con frmCapturarCodigoBarras de VB3
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, jpeg, ExtCtrls, Placemnt;

type
  TfrmCapturarCodigoBarras = class(TForm)
    btnCancelar: TBitBtn;
    imgImagen: TImage;
    lblCapturando: TLabel;
    FormStorage: TFormStorage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    Texto: String;
  public
  end;

function Get_CodigoBarras(Sender: TObject = nil): String;
procedure Get_DatosComprobantesAFIP(CodBarrasComprobante: String; var CUIT, CodTipoComprobante, PuntoVenta, CAI: String; var FechaVencimiento: TDateTime; var DigitoVerificador: Byte);

implementation

uses StrFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCapturarCodigoBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr( VK_RETURN )  then
    ModalResult := mrOK
  else
    Texto := Texto + Key;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCapturarCodigoBarras.FormCreate(Sender: TObject);
begin
  Texto := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function Get_CodigoBarras(Sender: TObject = nil): String;
begin
  with TfrmCapturarCodigoBarras.Create(TComponent(Sender)) do
    try
      if ShowModal = mrOk then
        Result := Texto
      else
        Result := '';
    finally
      free
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure Get_DatosComprobantesAFIP(CodBarrasComprobante: String; var CUIT, CodTipoComprobante, PuntoVenta, CAI: String; var FechaVencimiento: TDateTime; var DigitoVerificador: Byte);
begin
  CUIT               := StrLeft( CodBarrasComprobante, 11 );
  CodTipoComprobante := StrMid( CodBarrasComprobante, 12, 2 );
  PuntoVenta         := StrMid( CodBarrasComprobante, 14, 4 );
  CAI                := StrMid( CodBarrasComprobante, 18, 14 );
  // FechaVencimiento   := StrToDate( StrMid( CodBarrasComprobante, 32, 2 ) + DateSeparator + StrMid( CodBarrasComprobante, 34, 2 ) + DateSeparator + StrMid( CodBarrasComprobante, 36, 4 ) );
  FechaVencimiento   := StrToDate( StrMid( CodBarrasComprobante, 38, 2 ) + DateSeparator + StrMid( CodBarrasComprobante, 36, 2 ) + DateSeparator + StrMid( CodBarrasComprobante, 32, 4 ) );
  DigitoVerificador  := StrToInt( StrMid( CodBarrasComprobante, 40, 1 ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

