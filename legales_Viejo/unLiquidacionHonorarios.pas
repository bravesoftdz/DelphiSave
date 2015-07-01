unit unLiquidacionHonorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Placemnt, Mask, ToolEdit, DateComboBox;

type
  TfrmLiquidacionHonorarios = class(TForm)
    lbFechaCierre: TLabel;
    edFechaCierre: TDateComboBox;
    FormStorage: TFormStorage;
    btnAceptar: TBitBtn;
    btnSalir: TBitBtn;
    procedure btnAceptarClick(Sender: TObject);
  private
    function Validar: Boolean;
  public
    procedure DoLiquidarHonorarios;
  end;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, unArt, DateTimeFuncs, unSesion;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionHonorarios.DoLiquidarHonorarios;
begin
  ShowModal;
end;
{-------------------------------------------------------------------------------}
function TfrmLiquidacionHonorarios.Validar: Boolean;
var
  sSql: String;
  dUltFechaCierre: TDateTime;
begin
  Verificar(edFechaCierre.IsEmpty, edFechaCierre, 'La fecha de cierre es obligatoria.');

  sSql := 'SELECT LEGALES.Get_UltFechaCierre ' +
            'FROM DUAL';
  dUltFechaCierre := ValorSqlDateTime( sSql );

  Verificar(edFechaCierre.Date <= dUltFechaCierre, edFechaCierre, 'La fecha de cierre debe ser mayor a la última ingresada: ' + DateToStr( dUltFechaCierre ));
  Verificar(edFechaCierre.Date >= DBDate, edFechaCierre, 'La fecha de cierre debe ser menor a la fecha actual.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionHonorarios.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if Validar() then
    begin
      try
        sSql := 'LEGALES.DO_CERRARYLIQUIDAR(:FechaCierre, :Usuario);';
        EjecutarStoreEx(sSql, [TDateTimeEx.Create(edFechaCierre.Date), Sesion.UserID]);

        MsgBox('La operación se realizó exitosamente.');
      except
        on E: Exception do
          Raise Exception.Create ( E.Message + CRLF + 'Error al realizar el cierre' );
      end;
    end;
end;
{-------------------------------------------------------------------------------}
end.

