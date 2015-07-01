unit unComisionesCerrarPagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, DateComboBox, ExtCtrls, Buttons, Placemnt;

type
  TfrmComisionesCerrarPagos = class(TForm)
    lbFechaCierre: TLabel;
    edFechaCierre: TDateComboBox;
    btnAceptar: TBitBtn;
    btnSalir: TBitBtn;
    Bevel1: TBevel;
    FormStorage: TFormStorage;
    rgAccion: TRadioGroup;
    procedure btnSalirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    function Validar: Boolean;
  public
    procedure DoCerrarPagos;
  end;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, unArt, DateTimeFuncs, unSesion;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmComisionesCerrarPagos.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmComisionesCerrarPagos.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if Validar() then
  begin
    try
      BeginTrans;

      case rgAccion.ItemIndex of
        0: sSql := 'COMISION.Do_CerrarPagos(:FechaCierre, :Usuario);';
        1: sSql := 'COMISION.Do_CerrarYLiquidar(:FechaCierre, :Usuario);';
      end;

      EjecutarStoreSTEx(sSql, [TDateTimeEx.Create(edFechaCierre.Date), Sesion.UserID]);

      CommitTrans;
      MsgBox('La operación se realizó exitosamente.');
    except
      on E: Exception do
      begin
        RollBack;
        Raise Exception.Create ( E.Message + CRLF + 'Error al realizar el cierre de los pagos' );
      end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmComisionesCerrarPagos.Validar: Boolean;
var
  sSql: String;
  dUltFechaCierre: TDateTime;
begin
  Result := False;

  if edFechaCierre.IsEmpty then
    begin
      InvalidMsg( edFechaCierre, 'La fecha de cierre es obligatoria.' );
      Exit;
    end
  else
    begin
      sSql := 'SELECT COMISION.Get_UltFechaCierre ' +
                'FROM DUAL';

      dUltFechaCierre := ValorSqlDateTime( sSql );

      if edFechaCierre.Date <= dUltFechaCierre then
        begin
          InvalidMsg( edFechaCierre, 'La fecha de cierre debe ser mayor a la última ingresada: ' + DateToStr( dUltFechaCierre ));
          Exit;
        end;
    end;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmComisionesCerrarPagos.DoCerrarPagos;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM XEN_ENTIDAD' +
          ' WHERE EN_MODOLIQ <> :MODOLIQ' +
            ' AND NVL(ART.COMISION.GET_ULTIMALIQUIDACION(EN_ID, :TIPO), To_Date(''01/01/1996'', ''DD/MM/YYYY'')) < ART.COMISION.GET_ULTFECHACIERRE';

  if ExisteSqlEx(sSql, ['03', 'E']) then
  begin
    if MsgAsk('Existen comisiones pendientes de liquidar del cierre de pagos anterior. ¿Desea continuar?') then
      ShowModal;
  end else
    ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
