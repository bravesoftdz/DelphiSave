{-----------------------------------------------------------------------------
 Unit Name: unFrmEntregaCarpetaSolicitada
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz para la entrega o devolución de una carpeta dependiendo
            del usuario y la localización actual de la carpeta.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}
unit unFrmEntregaCarpetaSolicitada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, unFraDetalleArchivo, AnsiSql, SqlFuncs, CustomDlgs;

type
  TFrmEntregaCarpetaSolicitada = class(TForm)
    fraDetalleArchivoEntregaCarpeta: TfraDetalleArchivo;
    btnEnviarCarpeta: TButton;
    btnMailOmitir: TButton;
    BevelAbm: TBevel;
    procedure btnEnviarCarpetaClick(Sender: TObject);
  private
  public
    class procedure DevolverCarpeta(AOwner : TComponent; AIdArchivo: Integer);
  end;

implementation

uses
  unDmPrincipal, unConstantArchivo, unCustomDataModule, StrFuncs, VCLExtra,
  DBFuncs, unArt, unArchivo;

{$R *.dfm}

procedure TFrmEntregaCarpetaSolicitada.btnEnviarCarpetaClick(Sender: TObject);
begin
  if (MessageBox(0, '¿Confirma la entrega de la Carpeta segun los datos anteriores?',
                    'Confirmación de Entrega', MB_ICONWARNING or MB_YESNO) = idYes) then
  begin
    if fraDetalleArchivoEntregaCarpeta.edFechaVencimiento.Enabled then
    begin
      VerificarMultiple(['Verificación de Transferencia de Carpeta',
            fraDetalleArchivoEntregaCarpeta.edFechaVencimiento,
            fraDetalleArchivoEntregaCarpeta.edFechaVencimiento.Date >= DBDate,
            'La fecha debe ser posterior o igual a la fecha actual']);
      EjecutarSql('update rsc_solicitudcarpeta '  +
                '   set sc_fechaprevistadevolucion = ' +
                    SqlValue(fraDetalleArchivoEntregaCarpeta.edFechaVencimiento.Date) +
                ' where sc_id = ' + SqlValue(fraDetalleArchivoEntregaCarpeta.IdSolicitud));
    end
    else begin

      //Cuando entrega la documentación al usuario que la solicita, calcula la
      // fecha prevista de devolución. Esta fecha puede ser corregida editando este valor.
      VerificarMultiple(['Verificación de Transferencia de Carpeta',
            fraDetalleArchivoEntregaCarpeta.edFechaVencimiento,
            fraDetalleArchivoEntregaCarpeta.edFechaVencimiento.Date <= DBDate,
            'La fecha de recepción no puede ser fijada en el futuro.']);

      EjecutarSql('update rsc_solicitudcarpeta '  +
                '   set sc_fecharecepcion = SYSDATE, ' +
                '       sc_fechaprevistadevolucion = ' + SqlDate(DBDate + VALOR_PARAMETRO_DIASRETENCION) +
                ' where sc_id = ' + SqlValue(fraDetalleArchivoEntregaCarpeta.IdSolicitud));
    end;
  end;
end;

class procedure TFrmEntregaCarpetaSolicitada.DevolverCarpeta(AOwner: TComponent; AIdArchivo: Integer);
begin
  with TFrmEntregaCarpetaSolicitada.Create(AOwner) do
  begin
    fraDetalleArchivoEntregaCarpeta.CargarDetalleArchivo(AIdArchivo);
    ShowModal;
  end;
end;

end.
