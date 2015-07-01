unit unReemplazoCarpetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, unArtFrame,
  unFraFiltroArchivo, Buttons, RxPlacemnt;

type
  TfrmReemplazoCarpetas = class(TfrmCustomForm)
    Label1: TLabel;
    Label2: TLabel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    fraFiltroArchivoOrigen: TfraFiltroArchivo;
    fraFiltroArchivoDestino: TfraFiltroArchivo;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FHuboReemplazosCarpetas: Boolean;
    procedure DoLimpiarDatos;
  public
    property HuboReemplazosCarpetas: Boolean    read FHuboReemplazosCarpetas;
  end;

var
  frmReemplazoCarpetas: TfrmReemplazoCarpetas;

implementation

{$R *.dfm}

uses
  CustomDlgs, unUtilsArchivo;

procedure TfrmReemplazoCarpetas.btnAceptarClick(Sender: TObject);
begin
  Verificar(not fraFiltroArchivoOrigen.IsCompleted, fraFiltroArchivoOrigen.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta de origen.');
  Verificar(not fraFiltroArchivoOrigen.Exists, fraFiltroArchivoOrigen, 'La clave indicada no existe');
  Verificar(not fraFiltroArchivoDestino.IsCompleted, fraFiltroArchivoDestino.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta de destino.');
  Verificar(not fraFiltroArchivoDestino.Exists, fraFiltroArchivoDestino, 'La clave indicada no existe');
  Verificar(fraFiltroArchivoOrigen.Tipo <> fraFiltroArchivoDestino.Tipo, fraFiltroArchivoOrigen.fraTipoArchivo.cmbDescripcion, 'Las carpetas de origen y de destino deben ser del mismo tipo.');
  Verificar(fraFiltroArchivoOrigen.Clave = fraFiltroArchivoDestino.Clave, fraFiltroArchivoOrigen.fraTipoArchivo.cmbDescripcion, 'Las carpetas de origen y de destino no pueden ser exactamente las mismas.');

  if MsgBox('¿Confirma el reemplazo de las carpetas seleccionadas?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    begin
      if DoReemplazoCarpeta(fraFiltroArchivoOrigen.Clave, fraFiltroArchivoDestino.Clave, '', '', fraFiltroArchivoOrigen.Tipo, True) then
        begin
          MsgBox('Carpetas reemplazadas corectamente.', MB_ICONINFORMATION);
          FHuboReemplazosCarpetas := True;
          DoLimpiarDatos;
        end;
    end;
end;

procedure TfrmReemplazoCarpetas.DoLimpiarDatos;
begin
  fraFiltroArchivoOrigen.ClearArchivo;
  fraFiltroArchivoDestino.ClearArchivo;
end;

procedure TfrmReemplazoCarpetas.FormCreate(Sender: TObject);
begin
  inherited;

  FHuboReemplazosCarpetas := False;
end;

end.
 