unit unfraProspectosAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, DB, SDEngine, unAgenda, StdCtrls, ToolEdit,
  ArtComboBox, Mask, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraActividad, PatternEdit, IntEdit, CurrEdit, unART;

type
  TfraProspectosAGENDA = class(TArtDbFrame, IModuloAgenda)
    lbProspecto: TLabel;
    lbRSocial: TLabel;
    mskCUIT: TMaskEdit;
    lbCUIT: TLabel;
    edRazonSocial: TEdit;
    fraActividadReal: TfraActividad;
    lbActividad: TLabel;
    lbTrabajadores: TLabel;
    edTrabajadores: TIntEdit;
    lbMasaSalarial: TLabel;
    edMasaSalarial: TCurrencyEdit;
    procedure mskCUITExit(Sender: TObject);
  private
    FIsRequired: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure SetIsRequired(const Value: Boolean);
    function GetActividad: String;
    function GetCUIT: String;
    function GetMasaSalarial: Extended;
    function GetRazonSocial: String;
    function GetTrabajadores: Integer;
  protected
    function GetValue: TTableID; override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure LoadValues(ACUIT, ARazonSocial, AActividad: String; ATrabajadores: Integer; AMasaSalarial: Extended); reintroduce;
    function Validate: Boolean;

  published
    property CUIT: String read GetCUIT;
    property RazonSocial: String read GetRazonSocial;
    property Actividad: String read GetActividad;
    property Trabajadores: Integer read GetTrabajadores;
    property MasaSalarial: Extended read GetMasaSalarial;
  end;

var
  fraProspectosAGENDA: TfraProspectosAGENDA;

implementation

uses VCLExtra, CustomDlgs, Strfuncs, CUIT, unDmPrincipal;

{$R *.dfm}

procedure TfraProspectosAGENDA.Clear;
begin
  inherited;
  mskCUIT.Clear;
  edRazonSocial.Clear;
end;

constructor TfraProspectosAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  VCLExtra.LockControls([edRazonSocial], True);
end;

function TfraProspectosAGENDA.GetActividad: String;
begin
  if not fraActividadReal.IsEmpty and fraActividadReal.sdqDatos.Active then
    Result := fraActividadReal.sdqDatos.FieldByName('CODIGO').AsString;
end;

function TfraProspectosAGENDA.GetCUIT: String;
begin                                           //ver esto
  Result := StringReplace(mskCUIT.Text, '-', '', [rfReplaceAll]);
end;

function TfraProspectosAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraProspectosAGENDA.GetMasaSalarial: Extended;
begin
  Result := edMasaSalarial.Value;
end;

function TfraProspectosAGENDA.GetParamName: String;
begin
  Result := 'CUIT';
end;

function TfraProspectosAGENDA.GetRazonSocial: String;
begin
  Result := edRazonSocial.Text;
end;

function TfraProspectosAGENDA.GetTrabajadores: Integer;
begin
  Result := edTrabajadores.Value;
end;

function TfraProspectosAGENDA.GetValue: TTableID;
begin
  Result := StrToIntDef(Copy(CUIT, 2, 8), 0);
//  Result := CUIT;
end;

function TfraProspectosAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraProspectosAGENDA.LoadValues(ACUIT, ARazonSocial, AActividad: String; ATrabajadores: Integer; AMasaSalarial: Extended);
begin
  mskCUIT.Text            := ACUIT;
  edRazonSocial.Text      := ARazonSocial;
  fraActividadReal.Codigo := AActividad;
  edTrabajadores.Value    := ATrabajadores;
  edMasaSalarial.Value    := AMasaSalarial;
end;

procedure TfraProspectosAGENDA.mskCUITExit(Sender: TObject);
var
  sSQL, sMSG: String;
begin
  Verificar((Length(TMaskEdit(Sender).Text) = 11) and not(isCuit(TMaskEdit(Sender).Text)), TMaskEdit(Sender), 'El CUIT no es correcto.');
  sSql :=
    'SELECT RU.*, CA_DESCRIPCION CANAL, AC_DESCRIPCION ACTIVIDAD, EN_NOMBRE ENTIDAD, VE_NOMBRE VENDEDOR' +
     ' FROM ARU_RESERVACUIT RU, ACA_CANAL, CAC_ACTIVIDAD, XEN_ENTIDAD, XVE_VENDEDOR' +
    ' WHERE RU_IDCANAL = CA_ID(+)' +
    	' AND RU_IDACTIVIDAD = AC_ID(+)' +
    	' AND RU_IDENTIDAD = EN_ID(+)' +
    	' AND RU_IDVENDEDOR = VE_ID(+)' +
    	' AND RU_CUIT = :cuit' +
    	' AND RU_FECHABAJA IS NULL ' +
    	' AND ACTUALDATE BETWEEN RU_FECHADESDE AND RU_FECHAHASTA';

  with GetQueryEx(sSQL, [mskCUIT.Text]) do
  try
    if not Eof then
    begin
      sMsg := Format(
        'Este CUIT se encuentra reservado por ' + #13 + #10 +
        'CANAL: %s' + #13 + #10 +
        'ENTIDAD: %s',
        [
          FieldByName('CANAL').AsString,
          FieldByName('ENTIDAD').AsString
        ]);

      if FieldByName('VENDEDOR').AsString <> '' then
        sMsg := sMsg + #13 + #10 + 'VENDEDOR: ' + FieldByName('VENDEDOR').AsString;

      InvalidHint(mskCUIT, sMsg, 'ADVERTENCIA', blnInfo, 3, False);
      fraActividadReal.Value := FieldByName('RU_IDACTIVIDAD').{$IFDEF ART2}AsInteger{$ELSE}AsString{$ENDIF};
      //edfpSC_OBSERVACIONES.Lines.Text := FieldByName('RU_OBSERVACIONES').AsString;
    end;
  finally
    Free;
  end;

  sSQL := 'SELECT em_nombre ' +
            'FROM afi.aem_empresa ' +
           'WHERE em_cuit = :cuit' +
          ' UNION ALL ' +
          'SELECT sc_razonsocial ' +
            'FROM afi.asc_solicitudcotizacion ' +
           'WHERE sc_cuit = :cuit'; 
  edRazonSocial.Text := ValorSqlEx(sSQL, [mskCUIT.Text]);
  VCLExtra.LockControls([edRazonSocial], not IsEmptyString(edRazonSocial.Text));
  if not edRazonSocial.ReadOnly then
    edRazonSocial.SetFocus;
end;

procedure TfraProspectosAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbProspecto.Caption := 'Prospecto (*)'
  else
    lbProspecto.Caption := 'Prospecto';
end;

procedure TfraProspectosAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
end;

function TfraProspectosAGENDA.Validate: Boolean;
begin
  Verificar(IsEmptyString(mskCUIT.Text), mskCUIT, 'Debe indicar el CUIT de la empresa.');
  Verificar(IsEmptyString(edRazonSocial.Text), edRazonSocial, 'Debe indicar la razón social de la empresa.');
//  Verificar(fraActividadReal.IsEmpty, fraActividadReal.edCodigo, 'Debe indicar la actividad real de la empresa.');
//  Verificar(edTrabajadores.IsEmpty, edTrabajadores, 'Debe indicar la cantidad de trabajadores de la empresa.');
//  Verificar(edMasaSalarial.Value = 0, edMasaSalarial, 'Debe indicar la masa salarial de la empresa.');
  Result := True;
end;

end.
