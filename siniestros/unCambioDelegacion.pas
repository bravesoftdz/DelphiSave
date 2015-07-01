unit unCambioDelegacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion, ImgList, XPMenu, Placemnt,
  StdCtrls, ExtCtrls, SinEdit, unfraSectores;

type
  TfrmCambioDelegacion = class(TfrmCustomForm)
    fraEX_DELEGACION: TfraDelegacion;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    edSiniestro: TSinEdit;
    Label2: TLabel;
    fraEX_SECTOR: TfraSectores;
    Label3: TLabel;
    Label4: TLabel;
    fraNuevaDelegacion: TfraDelegacion;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FIdExpediente: integer;
  public
    procedure LoadControls(IdExpediente: integer); 
  end;

var
  frmCambioDelegacion: TfrmCambioDelegacion;

implementation

uses
  VCLExtra, CustomDlgs, unDmPrincipal, unSesion;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmCambioDelegacion.FormCreate(Sender: TObject);
begin
  inherited;
  fraNuevaDelegacion.ShowBajas := False;
  VCLExtra.LockControls([edSiniestro, fraEX_SECTOR, fraEX_DELEGACION], True);
end;
{------------------------------------------------------------------------------}
procedure TfrmCambioDelegacion.LoadControls(IdExpediente: integer);
var
  sSQL: string;
begin
  FIdExpediente := IdExpediente;
  sSQL := 'SELECT EX_SECTOR, EX_DELEGACION, EX_SINIESTRO, EX_ORDEN, EX_RECAIDA ' +
            'FROM SEX_EXPEDIENTES ' +
           'WHERE EX_ID = :ID';

  with GetQueryEx(sSQL, [IdExpediente]) do
  try
    if RecordCount <> 1 then
    begin
      InvalidMsg(btnAceptar, 'La consulta devolvió una cantidad errónea de registros.');
      btnAceptar.Enabled := False;
    end;

    fraEX_DELEGACION.Code := FieldByName('EX_DELEGACION').AsString;
    fraEX_SECTOR.Cargar(FieldByName('EX_SECTOR').AsString);
    edSiniestro.SetValues(FieldByName('EX_SINIESTRO').AsInteger,
                          FieldByName('EX_ORDEN').AsInteger,
                          FieldByName('EX_RECAIDA').AsInteger);
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCambioDelegacion.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraNuevaDelegacion.IsEmpty, fraNuevaDelegacion.edCodigo, 'Debe ingresar la nueva delegación que se asignará al expediente.');
  EjecutarStoreEx('ART.SINIESTRO.DO_GRABARSECTOR(:V1, :V2, :V3, :V4);', [FIdExpediente, fraNuevaDelegacion.Codigo, Sesion.Sector, Sesion.UserID]); 
  ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
end.
