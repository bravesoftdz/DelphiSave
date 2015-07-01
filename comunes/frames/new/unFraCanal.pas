unit unFraCanal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, Mask, PatternEdit, SDEngine, Db;

type
  TfraCanal = class(TfraStaticCodigoDescripcion)
  private
    fFiltraUsuario: boolean;

    function GetEsDelegacion: Boolean;
    function GetIngresaVendedores: Boolean;
    function GetTipo: String;

    procedure SetFiltraUsuario(const Value: Boolean);
  protected
    FColEsDelegacion: Integer;
    FColTipo: Integer;
    FColVendedor: Integer;

    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); override;

    {Oculta las Propiedades}
    property ExtraFields;
    property FieldBaja;
    property FieldCodigo;
    property FieldDesc;
    property FieldID;
    property TableName;
  public
    constructor Create(AOwner: TComponent); override;

    property EsDelegacion: Boolean      read GetEsDelegacion;
    property FiltraUsuario: Boolean     read fFiltraUsuario write SetFiltraUsuario;
    property IngresaVendedores: Boolean read GetIngresaVendedores;
    property Tipo: String               read GetTipo;
  end;

var
  fraCanal: TfraCanal;

implementation

uses
  unPrincipal, AnsiSql, unSesion;
{$R *.DFM}

{ TfraCanal }

constructor TfraCanal.Create(AOwner: TComponent);
begin
  inherited;

  TableName        := 'ACA_CANAL';
  FieldID          := 'CA_ID';
  FieldCodigo      := 'CA_CODIGO';
  FieldDesc        := 'CA_DESCRIPCION';
  FieldBaja        := 'CA_FECHABAJA';
  ExtraFields      := ', CA_VENDEDORES, CA_TIPO, CA_ESDELEGACION ';
  FiltraUsuario    := True;
  FColVendedor     := FColBaja + 1;
  FColTipo         := FColBaja + 2;
  FColEsDelegacion := FColBaja + 3;
end;

function TfraCanal.GetEsDelegacion: Boolean;
begin
  Result := (cmbDescripcion.Cells[FColEsDelegacion, cmbDescripcion.Row] = 'S');
end;

function TfraCanal.GetIngresaVendedores: Boolean;
begin
  Result := (cmbDescripcion.Cells[FColVendedor, cmbDescripcion.Row] = 'S');
end;

function TfraCanal.GetTipo: String;
begin
  Result := cmbDescripcion.Cells[FColTipo, cmbDescripcion.Row];
end;

procedure TfraCanal.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;

  cmbDescripcion.Cells[FColVendedor, ARow]     := ADataSet.FieldByName('CA_VENDEDORES').AsString;
  cmbDescripcion.Cells[FColTipo, ARow]         := ADataSet.FieldByName('CA_TIPO').AsString;
  cmbDescripcion.Cells[FColEsDelegacion, ARow] := ADataSet.FieldByName('CA_ESDELEGACION').AsString;
end;

procedure TfraCanal.SetFiltraUsuario(const Value: Boolean);
begin
  fFiltraUsuario := Value;
  if fFiltraUsuario then
    ExtraCondition := ' AND EXISTS (SELECT 1' +
                                    ' FROM AUC_USUARIOCANAL' +
                                   ' WHERE UC_USUARIO = ' + SqlValue(Sesion.UserID) +
                                     ' AND UC_IDCANAL = CA_ID' +
                                     ' AND UC_FECHABAJA IS NULL)'
  else
    ExtraCondition  := '';
end;

end.
