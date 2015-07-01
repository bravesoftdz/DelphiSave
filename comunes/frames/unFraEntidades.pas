unit unFraEntidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, unArt;

type
  TfraEntidades = class(TfraCodigoDescripcion)
  private
    FCanal: TTableId;
    FCanales: String;
    FCuit: TTableId;
    FEjecutivo: Integer;
    FFiltraBanco: Boolean;
    FVendedor: TTableId;

    function GetCanal: TTableId;
    function GetCuit: String;
    function GetEjecutivo: Integer;
    function GetEsBanco: Boolean;

    procedure SetCanal(const AValue: TTableId);
    procedure SetCanales(const AValue: String);
    procedure SetVendedor(const AValue: TTableId);
  protected
    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; override;

    // Esta propiedades permite manejar a las entidades y vendedores del banco como si fueran uno solo
    property EsBanco: Boolean read GetEsBanco;
    property FiltraBanco: Boolean read FFiltraBanco write FFiltraBanco;
  published
    property Canal: TTableId    read GetCanal     write SetCanal;
    property Canales: String                      write SetCanales;
    property Cuit: String       read GetCuit;
    property Ejecutivo: Integer read GetEjecutivo write FEjecutivo;
    property Vendedor: TTableId read FVendedor    write SetVendedor;
  end;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.DFM}

procedure TfraEntidades.Clear;
begin
  inherited;

  FEjecutivo := ART_EMPTY_ID;
  FVendedor := ART_EMPTY_ID;
//  FCanal    := ART_EMPTY_ID;
  FCuit     := ART_EMPTY_ID;
end;

constructor TfraEntidades.Create(AOwner: TComponent);
begin
  inherited;

  TableName   := 'xen_entidad';
  FieldID     := 'en_id';
  FieldCodigo := 'en_codbanco';
  FieldDesc   := 'en_nombre';
  FieldBaja   := 'en_fechabaja';
  ExtraFields := ', en_idcanal, en_cuit, en_requieresucursal, en_idejecutivo ';
  FFiltraBanco := False;
end;

function TfraEntidades.GetCanal: TTableId;
var
  Valor: TTableId;
begin
  if IsSelected and sdqDatos.Active then
    Valor := sdqDatos.FieldByName('en_idcanal').AsInteger
  else
    Valor := FCanal;

  Result := Valor;
end;

function TfraEntidades.GetCuit: String;
begin
  Result := '';

  if IsSelected and sdqDatos.Active then
    Result := sdqDatos.FieldByName('en_cuit').AsString;
end;

function TfraEntidades.GetEjecutivo: Integer;
begin
  Result := ART_EMPTY_ID;

  if IsSelected and sdqDatos.Active then
    Result := sdqDatos.FieldByName('en_idejecutivo').AsInteger;
end;

function TfraEntidades.GetEsBanco: boolean;
var
  sSql: String;
begin
  Result := False;
  if FVendedor <> ART_EMPTY_ID then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM xen_entidad, xev_entidadvendedor' +
      ' WHERE en_id = ev_identidad' +
        ' AND en_modoliq = ''03''' +
        ' AND ev_idvendedor = :idvendedor';
    Result := ExisteSqlEx(sSql, [FVendedor]);
  end;
end;

function TfraEntidades.GetSql: String;
var
  sSql: String;
begin
  if FSql = '' then
  begin
    sSql :=
      'SELECT en_id ' + CD_ALIAS_ID + ',' +
            ' en_codbanco ' + CD_ALIAS_CODIGO + ',' + { Antes tenía un TO_CHAR }
            ' en_nombre ' + CD_ALIAS_DESC + ',' +
            ' en_fechabaja ' + CD_ALIAS_BAJA +
              FExtraFields;

    if FVendedor <> ART_EMPTY_ID then
    begin
      if EsBanco and FFiltraBanco then  //muestra todas las sucursales del banco
        sSql := StringReplace(sSql, 'SELECT ', 'SELECT DISTINCT ', []) +
          ' FROM xen_entidad, xev_entidadvendedor' +
         ' WHERE en_id = ev_identidad' +
           ' AND ev_fechabaja IS NULL' +
           ' AND en_modoliq = ''03'''
      else
      begin
        sSql := sSql + ', ev_identidad, ev_id ';
        sSql := sSql + ' FROM xen_entidad, xev_entidadvendedor' +
                      ' WHERE en_id = ev_identidad' +
                        ' AND ev_fechabaja IS NULL' +
                        ' AND ev_idvendedor = ' + SqlInt(FVendedor);
      end;
    end
    else
      sSql := sSql + ' FROM xen_entidad WHERE 1 = 1 ';
  end
  else
     sSql := FSql;

  // Agrega la información del canal..
  if FCanal <> ART_EMPTY_ID then
    sSql := sSql + ' AND en_idcanal = ' + SqlValue(FCanal);

  // Agrega la información de los canales..
  if FCanales <> '' then
    sSql := sSql + ' AND en_idcanal IN (' + SqlString(FCanales) + ')';

  sSql := sSql + ExtraCondition;
  Result := sSql;
end;

procedure TfraEntidades.SetCanal(const AValue: TTableId);
var
  AField: TField;
begin
  if FCanal <> AValue then
  begin
    FCanal := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then
    begin
      AField := sdqDatos.Fields.FindField('en_idcanal');
      if Assigned(AField) then
      begin
        if(AField.AsInteger <> FCanal) then
          Clear;
      end;
    end;
  end;
end;

procedure TfraEntidades.SetCanales(const AValue: String);
begin
  if FCanales <> AValue then
    FCanales := AValue;
end;

procedure TfraEntidades.SetVendedor(const AValue: TTableId);
var
  aField: TField;
  sSql: String;
begin
  if FVendedor <> AValue then
  begin
    FVendedor := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then
    begin
      aField := sdqDatos.Fields.FindField('ev_idvendedor');
      if EsBanco and FFiltraBanco then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM xen_entidad, xev_entidadvendedor' +
          ' WHERE en_id = ev_identidad' +
            ' AND en_modoliq = ''03''' +
            ' AND ev_fechabaja IS NULL' +
            ' AND ev_idvendedor = :idvendedor';
        if not ExisteSqlEx(sSql, [FVendedor]) then
          Clear;
      end
      else if Assigned(aField) then
      begin
        if(aField.AsInteger <> FVendedor) then
          Clear;
      end
      else if not ExisteSqlEx('SELECT 1' +
                               ' FROM xev_entidadvendedor' +
                              ' WHERE ev_identidad = :identidad' +
                                ' AND ev_fechabaja IS NULL' +
                                ' AND ev_idvendedor = :idvendedor', [GetValue, FVendedor]) then
      	Clear;
    end;
  end;
end;

end.
