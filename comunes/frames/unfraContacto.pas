unit unfraContacto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, IntEdit, PatternEdit,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unART, Mask, unArtDBAwareFrame, unFraTelefono, artSeguridad,
  StdCtrls, unArtDbFrame, DB, SDEngine;

type
  TfraContacto = class(TArtDbFrame)
    fraTelefonos: TfraTelefono;
    procedure fraTelefonosbtnABMTelefonosClick(Sender: TObject);
  private
    FContactoId: TTableID;
    FContrato: TTableID;
    FEmpresa: TTableID;

    function GetArea: TCtbCodigo;
    function GetAreaFax: String;
    function GetCargo: TCtbCodigo;
    function GetContacto: String;
    function GetContactoId: TTableID;
    function GetEmail: String;
    function GetFax: String;
    function GetRemitenteCarta: Boolean;
    function GetColorContacto: TColor;
    function GetColorCargoCod: TColor;
    function GetColorCargoDesc: TColor;
    function GetColorAreaCod: TColor;
    function GetColorAreaDesc: TColor;
    function GetColorTelefono: TColor;
    function GetColorAreaFax: TColor;
    function GetColorFax: TColor;
    function GetColorEmail: TColor;

    procedure SetArea(const Value: TCtbCodigo);
    procedure SetAreaFax(const Value: String);
    procedure SetCargo(const Value: TCtbCodigo);
    procedure SetContacto(const Value: String);
    procedure SetContactoId(const Value: TTableID);
    procedure SetContrato(const Value: TTableID);
    procedure SetEmail(const Value: String);
    procedure SetEmpresa(const Value: TTableID);
    procedure SetFax(const Value: String);
    procedure SetRemitenteCarta(const Value: Boolean);
    procedure SetIdEmpresa(const Value: TTableID);
    procedure SetColorContacto(const Value: TColor);
    procedure SetColorCargoCod(const Value: TColor);
    procedure SetColorCargoDesc(const Value: TColor);
    procedure SetColorAreaCod(const Value: TColor);
    procedure SetColorAreaDesc(const Value: TColor);
    procedure SetColorTelefono(const Value: TColor);
    procedure SetColorAreaFax(const Value: TColor);
    procedure SetColorFax(const Value: TColor);
    procedure SetColorEmail(const Value: TColor);
  protected
    chkRemitenteCarta: TCheckBox;
    edAreaFax: TPatternEdit;
    edContacto: TEdit;
    edEmail: TEdit;
    edFax: TPatternEdit;
    fraArea: TfraStaticCTB_TABLAS;
    fraCargo: TfraStaticCTB_TABLAS;
    lbArea: TLabel;
    lbCAFAX: TLabel;
    lbCargo: TLabel;
    lbContacto: TLabel;
    lbeMail: TLabel;
    lbFAX: TLabel;
    FBaja: Boolean;

    function GetSqlOrderBy: string; override;
    function GetSqlWhere: string; override;
    function IsBaja: Boolean; override;
    procedure LoadValues(DoChanges: Boolean = False); override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

    function IsValid: Boolean;

    procedure Clear; {By Fede} override;{By Fede}
    procedure FocusCargo;
    procedure FocusEmail;
    procedure LoadContrato(AContrato: Integer);

    property Area          : TCtbCodigo read GetArea           write SetArea;
    property AreaFax       : String     read GetAreaFax        write SetAreaFax;
    property Cargo         : TCtbCodigo read GetCargo          write SetCargo;
    property Contacto      : String     read GetContacto       write SetContacto;
    property ContactoId    : TTableID   read GetContactoId     write SetContactoId;
    property Contrato      : TTableID   read fContrato         write SetContrato;
    property Email         : String     read GetEmail          write SetEmail;
    property Empresa       : TTableID   read fEmpresa          write SetEmpresa;
    property Fax           : String     read GetFax            write SetFax;
    property IdEmpresa     : TTableID   read FEmpresa          write SetIdEmpresa;
    property RemitenteCarta: Boolean    read GetRemitenteCarta write SetRemitenteCarta;
    property ColorContacto : TColor     read GetColorContacto  write SetColorContacto;
    property ColorCargoCod : TColor     read GetColorCargoCod  write SetColorCargoCod;
    property ColorCargoDesc: TColor     read GetColorCargoDesc write SetColorCargoDesc;
    property ColorAreaCod  : TColor     read GetColorAreaCod   write SetColorAreaCod;
    property ColorAreaDesc : TColor     read GetColorAreaDesc  write SetColorAreaDesc;
    property ColorTelefono : TColor     read GetColorTelefono  write SetColorTelefono;
    property ColorAreaFax  : TColor     read GetColorAreaFax   write SetColorAreaFax;
    property ColorFax      : TColor     read GetColorFax       write SetColorFax;
    property ColorEmail    : TColor     read GetColorEmail     write SetColorEmail;
  end;

{
var
  fraContacto: TfraContacto;
}

implementation

uses
	unCustomDataModule, unDmPrincipal, AnsiSQL, unPrincipal, CustomDlgs, Internet, unRtti, VCLExtra;

{$R *.DFM}

constructor TfraContacto.Create(AOwner: TComponent);
begin
  inherited;
  Sql := sdqDatos.SQL.Text;

  edAreaFax         := TPatternEdit(Self.FindComponent('edAreaFax'));
  edContacto        := TEdit(Self.FindComponent('edContacto'));
  edEmail           := TEdit(Self.FindComponent('edEmail'));
  edFax             := TPatternEdit(Self.FindComponent('edFax'));
  fraArea           := TfraStaticCTB_TABLAS(Self.FindComponent('fraArea'));
  fraCargo          := TfraStaticCTB_TABLAS(Self.FindComponent('fraCargo'));
  chkRemitenteCarta := TCheckBox(Self.FindComponent('chkRemitenteCarta'));

  fraArea.Clave := 'CAREA';
  fraCargo.Clave := 'CARGO';
  fraCargo.ShowBajas := False;
  fraTelefonos.ShowCargaRapida := True;
end;


function TfraContacto.GetArea: TCtbCodigo;
begin
  Result := fraArea.Value;
end;

function TfraContacto.GetAreaFax: String;
begin
  Result := edAreaFax.Text;
end;

function TfraContacto.GetCargo: TCtbCodigo;
begin
  Result := fraCargo.Value;
end;

function TfraContacto.GetContacto: String;
begin
  Result := edContacto.Text;
end;

function TfraContacto.GetContactoId: TTableID;
begin
  Result := FContactoId;
end;

function TfraContacto.GetEmail: String;
begin
  Result := edEmail.Text;
end;

function TfraContacto.GetFax: String;
begin
  Result := edFax.Text;
end;

function TfraContacto.GetRemitenteCarta: Boolean;
begin
  Result := chkRemitenteCarta.Checked;
end;

function TfraContacto.GetSqlOrderBy: string;
begin
  Result := '';
end;

function TfraContacto.GetSqlWhere: string;
begin
  Result := '';
end;

function TfraContacto.IsBaja: Boolean;
begin
  Result := FBaja;
end;

function TfraContacto.GetColorCargoCod: TColor;
begin
  Result := fraCargo.edCodigo.Color;
end;

function TfraContacto.GetColorCargoDesc: TColor;
begin
  Result := fraCargo.cmbDescripcion.Color;
end;

function TfraContacto.GetColorContacto: TColor;
begin
  Result := edContacto.Color;
end;

function TfraContacto.GetColorAreaDesc: TColor;
begin
  Result := fraArea.edCodigo.Color;
end;

function TfraContacto.GetColorTelefono: TColor;
begin
  Result := fraTelefono.cmbTelefonos.Color;
end;

function TfraContacto.GetColorAreaCod: TColor;
begin
  Result := fraArea.edCodigo.Color;
end;

function TfraContacto.GetColorAreaFax: TColor;
begin
  Result := edAreaFax.Color;
end;

function TfraContacto.GetColorFax: TColor;
begin
  Result := edFax.Color;
end;

function TfraContacto.GetColorEmail: TColor;
begin
  Result := edEmail.Color;
end;

function TfraContacto.IsValid: Boolean;
begin
	// Contacto.
  Verificar((edContacto.Text = ''), edContacto, 'El contacto es obligatorio.');

  // Cargo.
  Verificar(fraCargo.IsEmpty, fraCargo.edCodigo, 'El cargo es obligatorio.');

  // E-mail
  Verificar((edeMail.Text <> '') and (not IsEMails(edeMail.Text)), edeMail, 'El e-Mail del contacto no es correcto.');

  Result := True;
end;


procedure TfraContacto.Clear;
begin
  edContacto.Clear;
  fraCargo.Clear;
  fraArea.Clear;
  fraTelefonos.Clear(True);
  edAreaFax.Clear;
  edFax.Clear;
  edeMail.Clear;

  FContactoId := ART_EMPTY_ID;
  FContrato   := ART_EMPTY_ID;
  FEmpresa    := ART_EMPTY_ID;
end;

procedure TfraContacto.FocusCargo;
begin
  if fraCargo.edCodigo.CanFocus then
    fraCargo.edCodigo.SetFocus;
end;

procedure TfraContacto.FocusEmail;
begin
  if edEmail.CanFocus then
    edEmail.SetFocus;
end;

procedure TfraContacto.LoadValues;
var
  sSql: String;
begin
  inherited;
  if FContactoId <> 0 then
  begin
    sSql :=
      'SELECT ct_id, ct_idempresa, ct_contacto, ct_cargo, ct_area, ct_codareatelefonos, ct_telefonos, ct_codareafax, ct_fax,' +
            ' ct_direlectronica, ct_fechabaja, ct_remitentecarta' +
       ' FROM act_contacto' +
      ' WHERE ct_id = :id';

    with GetQueryEx(sSql, [FContactoId], [qoUnidirectional]) do
    try
      if not Eof then
      begin
        edContacto.Text  := FieldByName('ct_contacto').AsString;
        fraCargo.Value   := FieldByName('ct_cargo').AsString;
        fraArea.Value    := FieldByName('ct_area').AsString;
        edAreaFax.Text   := FieldByName('ct_codareafax').AsString;
        edFax.Text       := FieldByName('ct_fax').AsString;
        edeMail.Text     := FieldByName('ct_direlectronica').AsString;
        FBaja            := not FieldByName('ct_fechabaja').IsNull;
        fraTelefonos.FillCombo(True, FieldByName('ct_id').AsInteger);
        chkRemitenteCarta.Checked  := (FieldByName('ct_remitentecarta').AsString = 'S');
      end
      else
        Clear;
    finally
      Free;
    end;
  end;
end;

procedure TfraContacto.SetArea(const Value: TCtbCodigo);
begin
  fraArea.Value := Value;
end;

procedure TfraContacto.SetAreaFax(const Value: String);
begin
  edAreaFax.Text := Value;
end;

procedure TfraContacto.SetCargo(const Value: TCtbCodigo);
begin
  fraCargo.Value := Value;
end;

procedure TfraContacto.SetContacto(const Value: String);
begin
  edContacto.Text := Value;
end;

procedure TfraContacto.SetContactoId(const Value: TTableID);
begin
  FContactoId := Value;
  LoadValues;
end;

procedure TfraContacto.SetContrato(const Value: TTableID);
var
  sSql: String;
begin
  FContrato := Value;

  sSql :=
    'SELECT co_idempresa' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  Empresa := ValorSqlIntegerEx(sSql, [FContrato], 0);
end;

procedure TfraContacto.SetEmail(const Value: String);
begin
  edEmail.Text := Value;
end;

procedure TfraContacto.SetEmpresa(const Value: TTableID);
var
  sSql: String;
begin
  FEmpresa := Value;

  sSql :=
    'SELECT ct_id' +
     ' FROM act_contacto' +
    ' WHERE ct_idempresa = :idempresa';

  ContactoId := ValorSqlIntegerEx(sSql, [FEmpresa], 0);
end;

procedure TfraContacto.SetFax(const Value: String);
begin
  edFax.Text := Value;
end;

procedure TfraContacto.fraTelefonosbtnABMTelefonosClick(Sender: TObject);
begin
  inherited;
  fraTelefonos.btnABMTelefonosClick(Sender);
end;

procedure TfraContacto.SetRemitenteCarta(const Value: Boolean);
begin
  chkRemitenteCarta.Checked := Value;
end;

procedure TfraContacto.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControl(chkRemitenteCarta, Value);
end;

procedure TfraContacto.SetIdEmpresa(const Value: TTableID);
begin
  FEmpresa := Value;
end;

procedure TfraContacto.LoadContrato(AContrato: Integer);
var
  sSql: String;
begin
  if FContrato <> AContrato then
  begin
    Clear;
    FContrato := AContrato;

    sSql :=
      'SELECT co_idempresa' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato';

    FEmpresa := ValorSqlIntegerEx(sSql, [FContrato], 0);
  end;
end;

procedure TfraContacto.SetColorContacto(const Value: TColor);
begin
  edContacto.Color := Value;
end;

procedure TfraContacto.SetColorCargoCod(const Value: TColor);
begin
  fraCargo.edCodigo.Color := Value;
end;

procedure TfraContacto.SetColorCargoDesc(const Value: TColor);
begin
  fraCargo.cmbDescripcion.Color := Value;
end;

procedure TfraContacto.SetColorAreaCod(const Value: TColor);
begin
  fraArea.edCodigo.Color := Value;
end;

procedure TfraContacto.SetColorAreaDesc(const Value: TColor);
begin
  fraArea.cmbDescripcion.Color := Value;
end;

procedure TfraContacto.SetColorTelefono(const Value: TColor);
begin
  fraTelefono.cmbTelefonos.Color := Value;
end;

procedure TfraContacto.SetColorAreaFax(const Value: TColor);
begin
  edAreaFax.Color := Value;
end;

procedure TfraContacto.SetColorFax(const Value: TColor);
begin
  edFax.Color := Value;
end;

procedure TfraContacto.SetColorEmail(const Value: TColor);
begin
  edEmail.Color := Value;
end;

initialization
  RegisterClasses([TEdit, TfraStaticCTB_TABLAS, TPatternEdit, TCheckBox]);
end.
