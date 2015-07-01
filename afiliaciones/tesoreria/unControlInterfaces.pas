unit unControlInterfaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unCustomForm, ImgList, XPMenu, Placemnt, PatternEdit,
  IntEdit, Mask, ToolEdit, DateComboBox;

type
  TfrmControlInterfaces = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    edFecha: TDateComboBox;
    Label2: TLabel;
    edIdProceso: TIntEdit;
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;

var
  frmControlInterfaces: TfrmControlInterfaces;

implementation

uses
  unDmPrincipal, Printers, General, unPrincipal, CustomDlgs, unRptControlInterfaces;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmControlInterfaces.btnAceptarClick(Sender: TObject);
begin
  Verificar(edFecha.IsEmpty and edIdProceso.IsEmpty, nil, 'Debe ingresar la Fecha o el Proceso de Compensación.');
  Verificar(not edFecha.IsEmpty and not edIdProceso.IsEmpty, nil, 'Debe ingresar solo la Fecha o solo el Proceso de Compensación.');

  DoImprimirControlInterfaces(edFecha.Date, edIdProceso.Value);
end;
{------------------------------------------------------------------------------}
end.
