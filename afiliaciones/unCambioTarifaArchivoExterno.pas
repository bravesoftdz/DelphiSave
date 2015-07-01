unit unCambioTarifaArchivoExterno;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Dialogs;

type
  TfrmCambioTarifaArchivoExterno = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    OpenDialog: TOpenDialog;
    edFilename: TFilenameEdit;
    cbEN_ENVIOSRT: TCheckBox;
    cbEN_ENVIOCARTA: TCheckBox;
    cbEN_NOTASRT: TCheckBox;
    procedure OKBtnClick(Sender: TObject);
  private
    FIdsContratos: Array of Integer;
  public
    procedure DoCargarDatos(IdsContratos: Array of Integer);
  end;


implementation

uses
  CustomDlgs;

{$R *.DFM}

procedure TfrmCambioTarifaArchivoExterno.DoCargarDatos(IdsContratos: Array of Integer);
var
  I: Integer;
begin
  SetLength(FIdsContratos, High(IdsContratos) + 1);
  for I := Low(IdsContratos) to High(IdsContratos) do
    FIdsContratos[I] := IdsContratos[I];
end;

procedure TfrmCambioTarifaArchivoExterno.OKBtnClick(Sender: TObject);
begin
  if edFilename.Text = '' then
  begin
    InvalidMsg(edFilename, 'Debe elegir un archivo externo.');
    Abort;
  end;
  // Guardar contrato, empresa, domicilio legal, domicilio postal y endoso
  // como se hace en GuardarContrato de unModificaContrato
end;

end.
