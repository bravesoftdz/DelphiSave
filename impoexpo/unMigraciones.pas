unit unMigraciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ExtCtrls, StdCtrls, unArtFrame,
  unFraCodigoDescripcion, ImgList, XPMenu, Placemnt, unArtDBAwareFrame;

type
  TfrmMigraciones = class(TfrmCustomForm)
    fraProceso: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbOrigen: TComboBox;
    cmbDestino: TComboBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure cmbOrigenChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
  public
  end;

var
  frmMigraciones: TfrmMigraciones;

implementation

uses
  unSesion, unDmPrincipal, CustomDlgs, unART;

{$R *.DFM}

procedure TfrmMigraciones.FormCreate(Sender: TObject);
begin
  inherited;
  with fraProceso do
  begin
    FieldID       := 'PR_ID';
    FieldCodigo   := 'PR_CODIGO';
    FieldDesc     := 'PR_DESCRIPCION';
    FieldBaja     := 'PR_FECHABAJA';
    CaseSensitive := False;
    ShowBajas     := True;
  end;
  cmbOrigen.ItemIndex := 0;
  cmbOrigenChange(nil);
end;

procedure TfrmMigraciones.cmbOrigenChange(Sender: TObject);
begin
{
  if cmbOrigen.ItemIndex = 1 then
    cmbDestino.ItemIndex := 0
  else
    cmbDestino.ItemIndex := 1;
}
  fraProceso.TableName := 'IMPOEXPO.IPR_PROCESO@' + cmbOrigen.Text;
end;

procedure TfrmMigraciones.btnAceptarClick(Sender: TObject);
var
  sSQL: string;
begin
  Verificar(cmbOrigen.ItemIndex = cmbDestino.ItemIndex, cmbOrigen, 'La base de origen y destino deben ser distintas.');
  if MsgAsk(Format('¿Está seguro que desea realizar la migración del proceso %s?', [fraProceso.Descripcion])) then
  begin
    sSQL := 'SELECT 1 FROM IMPOEXPO.IPR_PROCESO@' + cmbDestino.Text + ' WHERE PR_CODIGO = :CODIGO';
    if ExisteSQLEx(sSQL, [fraProceso.Codigo]) then
    begin
      if not MsgAsk('El proceso seleccionado existe en la base de destino ' + cmbDestino.Text + '.' + CRLF +
                    'Para poder efectuar la migración debe eliminarlo.' + CRLF +
                    '¿Desea hacerlo ahora?') then
        Abort;

      EjecutarStoreEx('ART.VARIOS.Do_BorrarProcesosImpoEmpo(:Proceso, :Destino);',
                      [fraProceso.Codigo, cmbDestino.Text]);
    end;

    EjecutarStoreEx('ART.VARIOS.do_migracion(:Proceso, :Origen, :Destino, :Usuario);',
                    [fraProceso.Codigo, cmbOrigen.Text, cmbDestino.Text, Sesion.UserID]);
    InfoHint(btnAceptar, 'El proceso de migración ha finalizado con éxito.');                    
  end else
    InfoHint(btnAceptar, 'Se canceló el proceso de migración.');
end;

procedure TfrmMigraciones.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
