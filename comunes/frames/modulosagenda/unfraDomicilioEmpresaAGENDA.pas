unit unfraDomicilioEmpresaAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, DB, SDEngine, ExtCtrls, StdCtrls, unArtFrame,
  unFraDomicilio, unFraDomicilioGIS, JvExExtCtrls, JvRadioGroup, unAgenda,
  AdvOfficeButtons, AdvGroupBox;

type
  TfraDomicilioEmpresaAGENDA = class(TArtDbFrame, IModuloAgenda)
    fraDomicilioGISEmpresa: TfraDomicilioGIS;
    lbDomicilioEmpresa: TLabel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    chkRequiereDomicilio: TAdvOfficeCheckBox;
    rgLegalPostal: TAdvOfficeRadioGroup;
    procedure chkRequiereDomicilioClick(Sender: TObject);
    procedure rgLegalPostalClick(Sender: TObject);
  private
    FCUIT: String;
    FfraEmpresa: TfraEmpresa;
    FIsRequired: Boolean;
    FUbicacionContrato: Char;
    function  GetCUIT: String;
    function GetIsRequired: Boolean;
    function GetLegal: Boolean;
    function GetParamName: String;
    function GetPostal: Boolean;
    function GetRequiereDomicilio: Boolean;
    function GetVisible: Boolean;
    procedure SetCUIT(const Value: String);
    procedure SetfraEmpresa(const Value: TfraEmpresa);
    procedure SetIsRequired(const Value: Boolean);
    procedure SetRequiereDomicilio(const Value: Boolean);
    procedure SetUbicacionContrato(const Value: Char);
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    function Validate: Boolean;
    property CUIT: String read GetCUIT write SetCUIT;
    {Vínculos con otros frames}
    property FrameEmpresa: TfraEmpresa read FfraEmpresa write SetfraEmpresa;
    property Legal             : Boolean read GetLegal;
    property ParamName: String read GetParamName;
    property Postal            : Boolean read GetPostal;
    property RequiereDomicilio : Boolean read GetRequiereDomicilio write SetRequiereDomicilio;
    property UbicacionContrato : Char    read FUbicacionContrato   write SetUbicacionContrato;
  end;

var
  fraDomicilioEmpresaAGENDA: TfraDomicilioEmpresaAGENDA;

implementation

uses VCLExtra, CustomDlgs, unDmPrincipal, General, unArt;

{$R *.dfm}

procedure TfraDomicilioEmpresaAGENDA.chkRequiereDomicilioClick(Sender: TObject);
begin
  if Assigned(FfraEmpresa) then
  begin
    if not chkRequiereDomicilio.Checked then
      rgLegalPostal.ItemIndex := -1
    else
    begin
      if fraDomicilioGISEmpresa.CanFocus then
        fraDomicilioGISEmpresa.SetFocus;
        
      if not FfraEmpresa.IsSelected then
      begin
        InvalidMsg(FfraEmpresa, 'Debe seleccionar una empresa.');
        chkRequiereDomicilio.Checked := False;
        Abort;
      end;
    end;
    VCLExtra.LockControls(rgLegalPostal, not chkRequiereDomicilio.Checked);
    pnlBottom.Visible := chkRequiereDomicilio.Checked;
    rgLegalPostal.ItemIndex := 0;    
    rgLegalPostalClick(nil);
  end;
end;

procedure TfraDomicilioEmpresaAGENDA.rgLegalPostalClick(Sender: TObject);
var
  sSQL: String;
begin
  if (rgLegalPostal.ItemIndex = -1) or (FfraEmpresa.Contrato = ART_EMPTY_ID) then
    fraDomicilioGISEmpresa.Clear
  else begin
    sSQL := 'SELECT dc_numero, dc_piso, dc_departamento, dc_cpostala, dc_calle, ' +
                   'dc_localidad, dc_cpostal, dc_provincia ' +
              'FROM afi.adc_domiciliocontrato ' +
             'WHERE dc_contrato = :contrato ' +
               'AND dc_tipo = :tipo';

    with GetQueryEx(sSQL, [FfraEmpresa.Contrato, iif(rgLegalPostal.ItemIndex = 0, 'L', 'P')]) do
    try
      fraDomicilioGISEmpresa.Cargar(FieldByName('dc_calle').AsString,
                                    FieldByName('dc_cpostal').AsString,
                                    FieldByName('dc_localidad').AsString,
                                    FieldByName('dc_numero').AsString,
                                    FieldByName('dc_piso').AsString,
                                    FieldByName('dc_departamento').AsString,
                                    FieldByName('dc_provincia').AsString,
                                    FieldByName('dc_cpostala').AsString);
    finally
      Free;
    end;
  end;
end;

function TfraDomicilioEmpresaAGENDA.GetCUIT: String;
begin
  Result := FCUIT;
end;

function TfraDomicilioEmpresaAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraDomicilioEmpresaAGENDA.GetLegal: Boolean;
begin
  Result := rgLegalPostal.ItemIndex = 0;
end;

function TfraDomicilioEmpresaAGENDA.GetParamName: String;
begin
  Result := 'CONTRATO';
end;

function TfraDomicilioEmpresaAGENDA.GetPostal: Boolean;
begin
  Result := rgLegalPostal.ItemIndex = 1;
end;

function TfraDomicilioEmpresaAGENDA.GetRequiereDomicilio: Boolean;
begin
  Result := chkRequiereDomicilio.Checked;
end;

function TfraDomicilioEmpresaAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraDomicilioEmpresaAGENDA.SetCUIT(const Value: String);
begin
  FCUIT := Value;
  fraDomicilioGISEmpresa.CUIT := Value;
end;

procedure TfraDomicilioEmpresaAGENDA.SetfraEmpresa(const Value: TfraEmpresa);
begin
  FfraEmpresa := Value;
  chkRequiereDomicilioClick(nil);
end;

procedure TfraDomicilioEmpresaAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbDomicilioEmpresa.Caption := 'Domicilio de la Empresa (*)'
  else
    lbDomicilioEmpresa.Caption := 'Domicilio de la Empresa';
end;

procedure TfraDomicilioEmpresaAGENDA.SetRequiereDomicilio(const Value: Boolean);
begin
  chkRequiereDomicilio.Checked := Value;
end;

procedure TfraDomicilioEmpresaAGENDA.SetUbicacionContrato(const Value: Char);
var
  sSQL: String;
begin
  FUbicacionContrato := Value;
  sSQL := 'SELECT dc_numero, dc_piso, dc_departamento, dc_cpostala, dc_calle, ' +
                 'dc_localidad, dc_cpostal, dc_provincia ' +
            'FROM afi.adc_domiciliocontrato ' +
           'WHERE dc_contrato = :contrato ' +
             'AND dc_tipo = :tipo';

  if (FfraEmpresa.Contrato <> ART_EMPTY_ID) and AreIn(UbicacionContrato, ['L', 'P']) then
  begin
    chkRequiereDomicilio.Checked := True;
    rgLegalPostal.ItemIndex := iif(UbicacionContrato = 'L', 0, 1);
    with GetQueryEx(sSQL, [FfraEmpresa.Contrato, UbicacionContrato]) do
    try
      fraDomicilioGISEmpresa.Cargar(FieldByName('dc_calle').AsString,
                                    FieldByName('dc_cpostal').AsString,
                                    FieldByName('dc_localidad').AsString,
                                    FieldByName('dc_numero').AsString,
                                    FieldByName('dc_piso').AsString,
                                    FieldByName('dc_departamento').AsString,
                                    FieldByName('dc_provincia').AsString,
                                    FieldByName('dc_cpostala').AsString);
    finally
      Free;
    end;
    chkRequiereDomicilioClick(nil);
  end else
  begin
    chkRequiereDomicilio.Checked := False;
    fraDomicilioGISEmpresa.Clear;
    rgLegalPostal.ItemIndex := -1;
    chkRequiereDomicilioClick(nil);
  end;
end;

procedure TfraDomicilioEmpresaAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
  chkRequiereDomicilio.Enabled := not Value;
  rgLegalPostal.Enabled := not Value;
end;

constructor TfraDomicilioEmpresaAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  VCLExtra.LockControls(fraDomicilioGISEmpresa, True);
end;

procedure TfraDomicilioEmpresaAGENDA.Clear;
begin
  inherited;
  chkRequiereDomicilio.Checked := False;
  rgLegalPostal.ItemIndex := -1;
  fraDomicilioGISEmpresa.Clear;
  FUbicacionContrato := ' ';
end;

function TfraDomicilioEmpresaAGENDA.Validate: Boolean;
begin
  Verificar(chkRequiereDomicilio.Checked and (rgLegalPostal.ItemIndex < 0), rgLegalPostal,'Debe seleccionar si el domicilio es legal o postal.');
  Result := True;
end;

end.
