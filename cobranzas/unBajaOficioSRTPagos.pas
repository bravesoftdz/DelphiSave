unit unBajaOficioSRTPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls, Buttons, RxPlacemnt;

type
  TfrmBajaOficioSRTPagos = class(TfrmCustomForm)
    gbEmpresa1: TGroupBox;
    Label1: TLabel;
    fraContratoBaja: TfraEmpresa;
    gbEmpresa2: TGroupBox;
    Label2: TLabel;
    fraContratoActivo: TfraEmpresa;
    btnAceptar: TBitBtn;
    btnSalir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraContratoBajaOnChange(Senter: TObject);
  private
    function Validar: Boolean;
  public
  end;

var
  frmBajaOficioSRTPagos: TfrmBajaOficioSRTPagos;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, unArt, General;

{$R *.dfm}

procedure TfrmBajaOficioSRTPagos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraContratoBaja do
    begin
      ShowBajas         := True;
      ExtraCondition    := ' AND CO_ESTADO = ''6''';    // EMPRESA DADA DE BAJA
      OnChange          := fraContratoBajaOnChange;
      VerTodosRegimenes := True;
    end;

  with fraContratoActivo do
    begin
      ShowBajas         := True;
      ExtraCondition    := ' AND (CO_ESTADO = ''1'' OR CO_MOTIVOBAJA = ''07'')';    // 1: ACTIVO - 07: Baja por Traspaso
      VerTodosRegimenes := True;
    end;
end;

procedure TfrmBajaOficioSRTPagos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBajaOficioSRTPagos.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if Validar() then
    try
      sSql := 'COBRANZA.DO_PASAJEPAGOSCONTRATOANTERIOR(:ContratoBaja, :ContratoActivo, :Usuario);';
      EjecutarStoreEx(sSql, [fraContratoBaja.Contrato, fraContratoActivo.Contrato, Sesion.UserID]);

      MsgBox('Proceso finalizado correctamente.', MB_ICONINFORMATION);
    except
      on E: Exception do
        raise Exception.Create(E.Message + CRLF + 'Error al pasar los pagos del contrato dado de baja al contrato activo.');
    end;
end;

function TfrmBajaOficioSRTPagos.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraContratoBaja.IsEmpty, fraContratoBaja.mskCUIT, 'Debe ingresar el contrato dado de baja.');
  Verificar(fraContratoActivo.IsEmpty, fraContratoActivo.mskCUIT, 'Debe ingresar un contrato activo o dado de baja por traspaso.');
  Verificar(fraContratoBaja.Id <> fraContratoActivo.Id, fraContratoBaja.mskCUIT, 'Los contratos seleccionados no corresponden a la misma empresa.');
  Verificar(fraContratoBaja.Contrato < fraContratoActivo.Contrato, fraContratoBaja.mskCUIT, 'El contrato dado de baja debe ser posterior al activo / dado de baja por traspaso.');

  sSql := 'SELECT 1 ' +
            'FROM ABC_BAJADECONTRATO ' +
           'WHERE BC_CONTRATO = :Contrato';
  Verificar(ExisteSqlEx(sSql, [fraContratoBaja.ContratoExt]), fraContratoBaja.mskCUIT, 'Ya se ha realizado el pasaje de este contrato-régimen.');

  Verificar(fraContratoBaja.CodRegimen <> fraContratoActivo.CodRegimen, fraContratoBaja.mskCUIT, 'Los contratos seleccionados deben tener el mismo régimen.');

  Result := True;
end;

procedure TfrmBajaOficioSRTPagos.fraContratoBajaOnChange(Senter: TObject);
begin
 fraContratoActivo.CUIT := fraContratoBaja.CUIT;
end;

end.
