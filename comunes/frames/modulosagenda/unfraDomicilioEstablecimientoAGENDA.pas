unit unfraDomicilioEstablecimientoAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, unArtFrame, unFraDomicilio, unFraDomicilioGIS,
  StdCtrls, ExtCtrls, DB, SDEngine, unAgenda, AdvOfficeButtons;

type
  TfraDomicilioEstablecimientoAGENDA = class(TArtDbFrame, IModuloAgenda)
    fraDomicilioGISEstablecimiento: TfraDomicilioGIS;
    lbDomicilioEmpresa: TLabel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    chkRequiereDomicilio: TAdvOfficeCheckBox;
    procedure chkRequiereDomicilioClick(Sender: TObject);
  private
    FfraEstablecimiento: TfraEstablecimiento;
    FIsRequired: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetRequiereDomicilio: Boolean;
    function GetVisible: Boolean;
    procedure SetFrameEstablecimiento(const Value: TfraEstablecimiento);
    procedure SetIsRequired(const Value: Boolean);
    procedure SetRequiereDomicilio(const Value: Boolean);
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    function Validate: Boolean;
    {Vínculos con otros frames}
    property FrameEstablecimiento: TfraEstablecimiento read FfraEstablecimiento write SetFrameEstablecimiento;
    property ParamName: String read GetParamName;
    property RequiereDomicilio : Boolean read GetRequiereDomicilio write SetRequiereDomicilio;
  end;

var
  fraDomicilioEstablecimientoAGENDA: TfraDomicilioEstablecimientoAGENDA;

implementation

uses CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfraDomicilioEstablecimientoAGENDA.chkRequiereDomicilioClick(Sender: TObject);
var
  sSQL: String;
begin
  if Assigned(FfraEstablecimiento) then
  begin
    if chkRequiereDomicilio.Checked then
    begin
      if FfraEstablecimiento.IsEmpty then
      begin
        InvalidMsg(FfraEstablecimiento, 'Debe seleccionar un establecimiento.');
        chkRequiereDomicilio.Checked := False;
        Abort;
      end;
      sSQL := ' SELECT es_numero, es_piso, es_departamento, es_cpostala, es_calle, ' +
              '        es_localidad, es_cpostal, es_provincia ' +
              '   FROM afi.aes_establecimiento ' +
              '  WHERE es_nroestableci = :establecimiento ' +
              '    AND es_contrato = :contrato ';
      with GetQueryEx(sSQL, [FfraEstablecimiento.NroEstablecimiento, FfraEstablecimiento.Contrato]) do
      try
        fraDomicilioGISEstablecimiento.Cargar(FieldByName('es_calle').AsString,
                                              FieldByName('es_cpostal').AsString,
                                              FieldByName('es_localidad').AsString,
                                              FieldByName('es_numero').AsString,
                                              FieldByName('es_piso').AsString,
                                              FieldByName('es_departamento').AsString,
                                              FieldByName('es_provincia').AsString,
                                              FieldByName('es_cpostala').AsString)
      finally
        Free;
      end;
    end
    else
      fraDomicilioGISEstablecimiento.Clear;
  end;
  pnlBottom.Visible := chkRequiereDomicilio.Checked;
end;

function TfraDomicilioEstablecimientoAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraDomicilioEstablecimientoAGENDA.GetParamName: String;
begin
  Result := 'IDESTABLECIMIENTO';
end;

function TfraDomicilioEstablecimientoAGENDA.GetRequiereDomicilio: Boolean;
begin
  Result := chkRequiereDomicilio.Checked;
end;

function TfraDomicilioEstablecimientoAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraDomicilioEstablecimientoAGENDA.SetFrameEstablecimiento(const Value: TfraEstablecimiento);
begin
  FfraEstablecimiento := Value;
end;

procedure TfraDomicilioEstablecimientoAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbDomicilioEmpresa.Caption := 'Domicilio del Establecimiento (*)'
  else
    lbDomicilioEmpresa.Caption := 'Domicilio del Establecimiento';
end;

procedure TfraDomicilioEstablecimientoAGENDA.SetRequiereDomicilio(const Value: Boolean);
begin
  chkRequiereDomicilio.Checked := Value;
  chkRequiereDomicilioClick(nil);
end;

procedure TfraDomicilioEstablecimientoAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
  chkRequiereDomicilio.Enabled := not Value;
end;                

constructor TfraDomicilioEstablecimientoAGENDA.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TfraDomicilioEstablecimientoAGENDA.Clear;
begin
  inherited;
  chkRequiereDomicilio.Checked := False;
  fraDomicilioGISEstablecimiento.Clear;
end;

function TfraDomicilioEstablecimientoAGENDA.Validate: Boolean;
begin
  Verificar(chkRequiereDomicilio.Checked and fraDomicilioGISEstablecimiento.IsEmpty, fraDomicilioGISEstablecimiento, 'No se seleccionó un domicilio válido.');
  Result := True;
end;

end.
