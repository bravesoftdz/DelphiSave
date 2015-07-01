unit unFraValidacionDatosEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unFraDomicilio, unFraDomicilioEmpresa, ExtCtrls,
  ToolPanels, StdCtrls, JvExExtCtrls, JvRadioGroup, unFraDomicilioGIS,
  AdvGlowButton, AdvGroupBox, AdvOfficeButtons;

type
  TfraValidacionDatosEmpresa = class(TArtFrame)
    AdvToolPanelValidacionDatos: TAdvToolPanel;
    btnCancelar: TAdvGlowButton;
    btnGuardar: TAdvGlowButton;
    edCorreoElectronico: TEdit;
    edCorreoElectronicoCorrecto: TEdit;
    edTelefonosCorrecto: TEdit;
    fraDomicilioCorrecto: TfraDomicilioGIS;
    fraDomicilioEmpresaLegal: TfraDomicilioEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    pnlBotones: TPanel;
    pnlCorreoTelefono: TPanel;
    pnlDomicilioCorrecto: TPanel;
    pnlDomicilioLegal: TPanel;
    pnlDomicilioOpciones: TPanel;
    rgCorreoElectronico: TAdvOfficeRadioGroup;
    rgDomicilio: TAdvOfficeRadioGroup;
    procedure btnGuardarClick(Sender: TObject);
    procedure rgCorreoElectronicoClick(Sender: TObject);
    procedure rgDomicilioClick(Sender: TObject);
 private
    FContrato: Integer;
    function Validar: Boolean;
 public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure SetContrato(AValue: Integer);
  end;

var
  fraValidacionDatosEmpresa: TfraValidacionDatosEmpresa;

implementation

uses
  VCLExtra, Strfuncs, Internet, CustomDlgs, SqlFuncs, AnsiSql, unSesion,
  unDmPrincipal, General;

{$R *.dfm}

procedure TfraValidacionDatosEmpresa.btnGuardarClick(Sender: TObject);
var
  sSQL: String;
begin
  if Validar then
  begin
    if rgCorreoElectronico.ItemIndex <> 0 then
    begin
      sSQL := 'UPDATE ACO_CONTRATO ' +
                 'SET CO_DIRELECTRONICA = :correo, ' +
                     'CO_SINDIRELECTRONICA = :indice, ' +
                     'CO_USUMODIF = :usuario, ' +
                     'CO_FECHAMODIF = ART.ACTUALDATE ' +
               'WHERE CO_CONTRATO = :contrato';
      EjecutarSQLEx(sSQL, [edCorreoElectronicoCorrecto.Text, rgCorreoElectronico.ItemIndex - 1, Sesion.UserID, FContrato]);

      sSQL := 'ART.AFILIACION.DOGENERARALTAENDOSO(:contrato, ART.ACTUALDATE, :motivo, ''N'', ''N'', ''S'', :usuario);';
      EjecutarStoreEx(sSQL, [FContrato, '13.4', Sesion.UserID]);
    end;

    sSQL := 'INSERT INTO vda_validaciondatos ' +
            '(da_id, da_idendoso, da_estadodomiciliolegal, da_estadodirelectronica, da_direlectronica, da_telefonos, ' +
            ' da_domicilio_ok, da_localidad_ok, da_cpostal_ok, da_provincia_ok, da_usualta, da_fechaalta) ' +
            'VALUES ' +
            '(art.seq_vda_id.nextval, afiliacion.get_ultidendoso(:contrato), ' +
            SqlDecode(IntToStr(rgDomicilio.ItemIndex), ['0', '1', '2'], ['CO', 'IN', 'NS'], 'NULL', [doValueAsString, doValuesAsString, doCompareAsString]) + ', ' +
            SqlDecode(IntToStr(rgCorreoElectronico.ItemIndex), ['0', '1', '2'], ['CO', 'IN', 'NP'], 'NULL', [doValueAsString, doValuesAsString, doCompareAsString]) + ', ' +
            ' :mail, :telefonos, :DomicilioCorrecto, :LocalidadCorrecta, :CPostalCorrecto, ' +
            String(iif(fraDomicilioCorrecto.Prov = -1, 'NULL', IntToStr(fraDomicilioCorrecto.Prov))) + ', ' +
            ' :usuario, sysdate)';
    EjecutarSQLEx(sSQL, [FContrato,
                         edCorreoElectronicoCorrecto.Text, edTelefonosCorrecto.Text,
                         Trim(fraDomicilioCorrecto.Calle + ' ' + fraDomicilioCorrecto.Numero + ' ' +
                              fraDomicilioCorrecto.Piso + ' ' + fraDomicilioCorrecto.Departamento),
                         fraDomicilioCorrecto.Localidad, fraDomicilioCorrecto.CodigoPostal, Sesion.UserID]);

    GetParentForm(Self).ModalResult := mrOk; 
  end;
end;

procedure TfraValidacionDatosEmpresa.rgCorreoElectronicoClick(Sender: TObject);
begin
  VCLExtra.LockControls([edCorreoElectronicoCorrecto], rgCorreoElectronico.ItemIndex <> 1);
end;

procedure TfraValidacionDatosEmpresa.rgDomicilioClick(Sender: TObject);
begin
  VCLExtra.LockControls([fraDomicilioCorrecto], rgDomicilio.ItemIndex = 0);
end;

function TfraValidacionDatosEmpresa.Validar: Boolean;
begin
  Verificar(rgDomicilio.ItemIndex = -1, rgDomicilio, 'Debe informar la validez de los datos del domicilio legal.');
  Verificar(rgCorreoElectronico.ItemIndex = -1, rgCorreoElectronico, 'Debe informar la validez de los datos del mail corporativo.');
  Verificar((not IsEmptyString(edCorreoElectronicoCorrecto.Text)) and (not IsEMail(edCorreoElectronicoCorrecto.Text)), edCorreoElectronicoCorrecto, 'La dirección de correo informada no es válida.');
  Verificar(IsEmptyString(edCorreoElectronicoCorrecto.Text) and IsEmptyString(edTelefonosCorrecto.Text), edCorreoElectronicoCorrecto, 'Debe informar algún dato de contacto con la empresa');
  Verificar((rgDomicilio.ItemIndex = 1) and fraDomicilioCorrecto.IsEmpty, fraDomicilioCorrecto, 'Debe informar todos los datos del domicilio correcto');
  if (rgDomicilio.ItemIndex = 1) and not fraDomicilioCorrecto.IsValid then
    Abort;
  Result := True;
end;

{ TfraValidacionDatosEmpresa }

constructor TfraValidacionDatosEmpresa.Create(AOwner: TComponent);
begin
  inherited;
  VCLExtra.LockControls([fraDomicilioEmpresaLegal, edCorreoElectronico]);
end;

procedure TfraValidacionDatosEmpresa.Clear;
begin
//
end;

procedure TfraValidacionDatosEmpresa.SetContrato(AValue: Integer);
begin
  FContrato := AValue;
end;

end.
