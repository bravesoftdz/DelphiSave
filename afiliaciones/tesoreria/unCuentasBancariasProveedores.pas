unit unCuentasBancariasProveedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, unArtFrame, unArtDbFrame,
  unFraEmpresa, unFraOPV_PROVEEDOR, unArtDBAwareFrame;

type
  TfrmCuentasBancariasProveedores = class(TForm)
    btnCargar: TBitBtn;
    btnSalir: TBitBtn;
    gpProveedor: TGroupBox;
    fraProveedorCtaBanc: TfraOPV_PROVEEDOR;
    lblCuit: TLabel;
    procedure btnCargarClick(Sender: TObject);
  private
  public
  end;

implementation

uses
  unPrincipal, unManCCP_CUENTAPAGO, General;

{$R *.DFM}

procedure TfrmCuentasBancariasProveedores.btnCargarClick(Sender: TObject);
begin
  if not fraProveedorCtaBanc.IsEmpty then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    try
      Execute('PV', fraProveedorCtaBanc.Value, '')
    finally
      Free;
    end
  else
    MsgBox('No ha seleccionado ningún proveedor.', MB_OK, 'Cuentas bancarias');
end;

end.
