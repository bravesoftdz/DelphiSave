unit unFraPrestadorFueraDeContrato;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unfraCPR_PRESTADOR, DB, SDEngine,
  PatternEdit, IntEdit, StdCtrls, ArtComboBox, Mask, JvExControls, JvComponent, JvDBLookup, ExtCtrls, unArtFrame,
  unFraDomicilio, JvgGroupBox, DBCtrls;

type
  TfraPrestadorFueraDeContrato = class(TfraCPR_PRESTADOR)
    gbPrestadorFueraDeContrato: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    fraDomicilioExtra: TfraDomicilio;
    edNombre: TPatternEdit;
    edTelefono: TPatternEdit;
  protected
    FPrefijoTabla: string;

    procedure ClearExtra;
    procedure SetLocked(const Value: Boolean); override;
    function  PrestadorDespliegaDetalle(Identificador: integer): Boolean;

    procedure UpdateData(Sender: TObject); override;
    procedure DataChange(Sender: TObject); override;
    procedure LoadValues( DoChanges : boolean = False); override;
  public
    procedure Change; override;
    constructor Create(AOwner: TComponent); override;
    procedure PrestadorFueraDeContratoOnChange(Sender: TObject);

    property PrefijoTabla: string read FPrefijoTabla write FPrefijoTabla;
  end;

var
  fraPrestadorFueraDeContrato: TfraPrestadorFueraDeContrato;

implementation

uses
  VCLExtra, unArt, CustomDlgs, unArtDBAwareFrame, General, unDmPrincipal, unSinForm;

{$R *.dfm}

{ TfraPrestadorFueraDeContrato }

procedure TfraPrestadorFueraDeContrato.ClearExtra;
begin
  edNombre.Clear;
  edTelefono.Clear;
  fraDomicilioExtra.Clear;
end;

constructor TfraPrestadorFueraDeContrato.Create(AOwner: TComponent);
begin
  inherited;
  VCLExtra.LockControls([edCA_DOMICILIO, edCA_LOCALIDAD, edCA_CODPOSTAL, edNombre, edTelefono, fraDomicilioExtra]);
  OnChange := PrestadorFueraDeContratoOnChange;
end;

procedure TfraPrestadorFueraDeContrato.PrestadorFueraDeContratoOnChange(Sender: TObject);
begin
  if not PrestadorDespliegaDetalle(Identificador) then
  begin
    VCLExtra.LockControls([edNombre, edTelefono]);
    fraDomicilioExtra.Locked := True;
    ClearExtra;

    if not gbPrestadorFueraDeContrato.Collapsed then
    begin
      gbPrestadorFueraDeContrato.Collapsed := True;
      Parent.Height := 152 - 72;
      Height := 128 - 72;
    end;
  end else
  begin
    if gbPrestadorFueraDeContrato.Collapsed then
    begin
      Parent.Height := 152;
      Height := 128;
      gbPrestadorFueraDeContrato.Collapsed := False;
    end;

    VCLExtra.LockControls([edNombre, edTelefono], False);
    fraDomicilioExtra.Locked := False;

    with DataSource.DataSet do
    if Active and (State in dsEditModes) and (edNombre.Text = '') then
      if Assigned(Sender) and edNombre.CanFocus then
        edNombre.SetFocus;
  end;

  if FormPadre.InheritsFrom(TSinForm) then
    TSinForm(FormPadre).CambioTamanio(nil);

  if Locked then
    VCLExtra.LockControls([edNombre, edTelefono, fraDomicilioExtra]);
end;

procedure TfraPrestadorFueraDeContrato.SetLocked(const Value: Boolean);
begin
  inherited;
//  Se lockea desde el frame al crearse el frame, no hace falta hacerlo aca..FFFF :P
//  VCLExtra.LockControls([fraDomicilioExtra.edProvincia]);
  PrestadorFueraDeContratoOnChange(nil);
end;

procedure TfraPrestadorFueraDeContrato.UpdateData(Sender: TObject);
begin
  inherited;

  with DataSource.DataSet do
  if Active and (State in dsEditModes) then
  begin
    FieldByName(PrefijoTabla + 'PRESTADOR_NOMBRE').AsString := edNombre.Text;
    FieldByName(PrefijoTabla + 'PRESTADOR_TELEFONOS').AsString := edTelefono.Text;

    with fraDomicilioExtra do
    begin
      FieldByName(PrefijoTabla + 'PRESTADOR_CALLE').AsString        := Calle;
      FieldByName(PrefijoTabla + 'PRESTADOR_NUMERO').AsString       := IIF(Numero = 'S/N', '', Numero);
      FieldByName(PrefijoTabla + 'PRESTADOR_PISO').AsString         := Piso;
      FieldByName(PrefijoTabla + 'PRESTADOR_DEPARTAMENTO').AsString := Departamento;
      FieldByName(PrefijoTabla + 'PRESTADOR_CPOSTAL').AsString      := CodigoPostal;
      FieldByName(PrefijoTabla + 'PRESTADOR_CPOSTALA').AsString     := CPA;
      FieldByName(PrefijoTabla + 'PRESTADOR_LOCALIDAD').AsString    := IIF(CodigoPostal = '', '', Localidad);
      FieldByName(PrefijoTabla + 'PRESTADOR_PROVINCIA').AsString    := IIF(Prov = -1, '', IntToStr(Prov));
    end;
  end;
end;

procedure TfraPrestadorFueraDeContrato.DataChange(Sender: TObject);
begin
  inherited;
  PrestadorFueraDeContratoOnChange(nil);

  with DataSource.DataSet do
  if Active and not (State in dsEditModes) then
  begin
    edNombre.Text := FieldByName(PrefijoTabla + 'PRESTADOR_NOMBRE').AsString;
    edTelefono.Text := FieldByName(PrefijoTabla + 'PRESTADOR_TELEFONOS').AsString;

    with fraDomicilioExtra do
    begin
      Calle        := FieldByName(PrefijoTabla + 'PRESTADOR_CALLE').AsString;
      Numero       := IIF(FieldByName(PrefijoTabla + 'PRESTADOR_NUMERO').IsNull, 'S/N', FieldByName(PrefijoTabla + 'PRESTADOR_NUMERO').AsString);
      Piso         := FieldByName(PrefijoTabla + 'PRESTADOR_PISO').AsString;
      Departamento := FieldByName(PrefijoTabla + 'PRESTADOR_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName(PrefijoTabla + 'PRESTADOR_CPOSTAL').AsString;
      CPA          := FieldByName(PrefijoTabla + 'PRESTADOR_CPOSTALA').AsString;
      Localidad    := FieldByName(PrefijoTabla + 'PRESTADOR_LOCALIDAD').AsString;
      Provincia    := ValorSQLEx('SELECT PV_DESCRIPCION FROM CPV_PROVINCIAS WHERE PV_CODIGO = :VALOR', [FieldByName(PrefijoTabla + 'PRESTADOR_PROVINCIA').AsString]);
    end;
  end;
end;

procedure TfraPrestadorFueraDeContrato.Change;
begin
  UpdateData(nil);
  inherited;
end;

procedure TfraPrestadorFueraDeContrato.LoadValues(DoChanges: boolean);
begin
  inherited;
  with DataSource.DataSet do
  if Active and (State in dsEditModes) and PrestadorDespliegaDetalle(Identificador) and (edNombre.Text = '') then
    if DoChanges and edNombre.CanFocus then
      edNombre.SetFocus;
end;

function TfraPrestadorFueraDeContrato.PrestadorDespliegaDetalle(Identificador: integer): Boolean;
begin
  case Identificador of
    10178:
      Result := True;
    else
      Result := False;
  end;
end;

end.
