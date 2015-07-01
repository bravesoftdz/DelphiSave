unit unfrmCuotasNoPagadas;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   03-03-2003
 ULTIMA MODIFICACION: 03-03-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVendedores, unfraVendedoresCUIT, unArtFrame, unFraCodigoDescripcion,
  unfraEntidadCUIT, StdCtrls, ExtCtrls, unArtDBAwareFrame;

type
  TfrmCuotasNoPagadas = class(TForm)
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox1: TGroupBox;
    fraEntidad: TfraEntidadCUIT;
    GroupBox2: TGroupBox;
    fraVendedor: TfraVendedoresCUIT;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
  private
  protected
    function Validar : boolean;
  public
  end;

var
  frmCuotasNoPagadas: TfrmCuotasNoPagadas;

implementation

Uses
   unPrincipal, unRPTCuotasNoPagadas, CustomDlgs;
{$R *.DFM}

procedure TfrmCuotasNoPagadas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCuotasNoPagadas.btnAceptarClick(Sender: TObject);
var
  Reporte : TfrmRPTCuotasNoPagadas;
begin
  if Validar then
  begin
    Reporte := TfrmRPTCuotasNoPagadas.Create ( Self );
    try
      Reporte.EntidadVendedor := fraVendedor.EntidadVendedor  ;
      if Reporte.Prepare then
        Reporte.qrCuotasNoPagadas.PreviewModal
      else
        MessageDlg('No hay registros!', mtError, [mbOK], 0);
    finally
      Reporte.Free;
    end;
  end;
end;

function TfrmCuotasNoPagadas.Validar: boolean;
begin
  result := False;
  if fraEntidad.Value = 0 then
    invalidMsg ( fraEntidad, 'Debe elegir una entidad')
  else if fraVendedor.Value = 0 then
    invalidMsg ( fraVendedor, 'Debe elegir un vendedor')
  else
    result := True;
end;

procedure TfrmCuotasNoPagadas.fraEntidadExit(Sender: TObject);
begin
  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;

end.
