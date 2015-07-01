unit unConsSaldoAcreedorTopes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, PeriodoPicker,
  Buttons;

type
  TfrmConsSaldoAcreedorTopes = class(TfrmCustomForm)
    GroupBox8: TGroupBox;
    Label11: TLabel;
    ppPeriodo: TPeriodoPicker;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
  end;

var
  frmConsSaldoAcreedorTopes: TfrmConsSaldoAcreedorTopes;

implementation

uses
  CustomDlgs, unSesion, unDmPrincipal;

{$R *.dfm}

procedure TfrmConsSaldoAcreedorTopes.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsSaldoAcreedorTopes.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(ppPeriodo.Periodo.Valor = '', ppPeriodo, 'Debe ingresar el periodo');

  sSql := 'EMI.CONSULTAS.Do_SaldoAcreedorVsTopes(:Usuario, :Periodo);';
  EjecutarStoreEx(sSql, [Sesion.UserId, ppPeriodo.Periodo.Valor]);

  MsgBox('El proceso ha finalizado.', MB_ICONINFORMATION);
end;

end.
