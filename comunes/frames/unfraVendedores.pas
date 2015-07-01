unit unfraVendedores;

interface
 
uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ArtComboBox, RxToolEdit;

type
  TfraVendedores = class(TfraCodigoDescripcion)
  private
    FFiltraBanco: Boolean;
    FShowBajasEntVend: Boolean;

    function GetEntidad: TTableId;
    function GetEsBanco: Boolean;

    procedure SetEntidad(const AValue: TTableId);
  protected
    FEntidad: TTableId;

    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; override;

    // Estas propiedades permite manejar a las entidades y vendedores del banco como si fueran uno solo
    property EsBanco         : Boolean read GetEsBanco;
    property FiltraBanco     : Boolean read FFiltraBanco      write FFiltraBanco;
    property ShowBajasEntVend: Boolean read FShowBajasEntVend write FShowBajasEntVend default True;
  published
    property Entidad: TTableId read GetEntidad write SetEntidad;
  end;

implementation

uses
  unDmPrincipal, AnsiSql, SQLFuncs, General;

{$R *.DFM}

procedure TfraVendedores.Clear;
begin
  inherited;
//  FEntidad := ART_EMPTY_ID;
end;

constructor TfraVendedores.Create(AOwner: TComponent);
begin
  inherited;

  TableName   := 'xve_vendedor' + GetDBLink();
  FieldID     := 've_id';
  FieldCodigo := 've_vendedor';
  FieldDesc   := 've_nombre';
  FieldBaja   := 've_fechabaja';

  FFiltraBanco      := False;
  FShowBajasEntVend := True
end;

function TfraVendedores.GetEntidad: TTableId;
begin
  if IsSelected then
    Result := sdqDatos.FieldByName('en_id').AsInteger
  else
    Result := FEntidad;
end;

function TfraVendedores.GetEsBanco: boolean;
var
  sSql: String;
begin
  Result := False;

  if FEntidad <> ART_EMPTY_ID then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM xen_entidad' + GetDBLink() +
      ' WHERE en_id = :id' +
        ' AND en_modoliq = ''03''';
    Result := ExisteSqlEx(sSql, [SqlValue(FEntidad)]);
  end;
end;

function TfraVendedores.GetSql: String;
var
  sCadena: String;
  sExtraFields: String;
  sSql: String;
begin
  if FSql = '' then
  begin
    if FEntidad <> ART_EMPTY_ID then
    begin
      //Si la entidad es el banco, hay que mostrar TODOS los vendedores
      //sin hacer distincion de la sucursal en la que están
      //18/02/04
      sSql :=
        'SELECT ve_id ' + CD_ALIAS_ID + ',' +
              ' ve_vendedor ' + CD_ALIAS_CODIGO + ',' +
              ' ve_nombre ' + CD_ALIAS_DESC + ',' +
              ' ve_fechabaja ' + CD_ALIAS_BAJA + ',' +
              ' ev_identidad, ev_id, en_id ' + FExtraFields;

      if EsBanco and FFiltraBanco then
        sSql := sSql +
          ' FROM xev_entidadvendedor' + GetDBLink() + ', xve_vendedor' + GetDBLink() + ', xen_entidad' + GetDBLink() +
         ' WHERE ve_id = ev_idvendedor' +
           ' AND ev_identidad = en_id' +
           ' AND en_modoliq = ''03'''
      else
        sSql := sSql +
          ' FROM xev_entidadvendedor' + GetDBLink() + ', xve_vendedor' + GetDBLink() + ', xen_entidad' + GetDBLink() +
         ' WHERE ve_id = ev_idvendedor' +
           ' AND en_id = ev_identidad' +
           ' AND ev_identidad = ' + SqlInt(FEntidad);

      sSql := sSql + IIF(not FShowBajasEntVend, ' AND ev_fechabaja IS NULL ', ' ');

      //Termino con el Sql
      sSql := sSql + ExtraCondition;
    end
    else
    begin
      if (edCodigo.Text > '') and (edCodigo = Screen.ActiveControl) then
        sCadena := ' AND ve_vendedor LIKE ' + SqlValue(edCodigo.Text + '%')
      else if (cmbDescripcion.Text > '') then
        sCadena := ' AND ve_nombre LIKE ' + SqlValue(cmbDescripcion.Text + '%')
      else
        sCadena := '';

      ExtraCondition := ExtraCondition + sCadena;

      sExtraFields := FExtraFields;
      FExtraFields := FExtraFields + ', en_id, ev_id ';

      sSql := inherited GetSql;
      SqlAddJoin(sSql, 'XEV_ENTIDADVENDEDOR' + GetDBLink(), 'VE_ID', 'EV_IDVENDEDOR', jtOuter);
      if not FShowBajasEntVend then
        AddCondition(sSQL, 'EV_FECHABAJA(+) IS NULL');
      SqlAddJoin(sSQL, 'XEN_ENTIDAD' + GetDBLink(), 'EV_IDENTIDAD', 'EN_ID', jtOuter);
      FExtraFields := sExtraFields;

      ExtraCondition := Copy(ExtraCondition, 1, Length(ExtraCondition) - Length(sCadena));
    end;
  end
  else
    sSql := FSql;

  Result := sSql;
end;

procedure TfraVendedores.SetEntidad(const AValue: TTableId);
var
  aField: TField;
  sSql: String;
begin
  if FEntidad <> AValue then
  begin
    FEntidad := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then
    begin
      aField := sdqDatos.Fields.FindField('ev_identidad');
      if EsBanco and FFiltraBanco then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM xen_entidad ' + GetDBLink() + ', xev_entidadvendedor' + GetDBLink() +
          ' WHERE en_id = ev_identidad' +
            ' AND ev_fechabaja IS NULL' +
            ' AND ev_idvendedor = :idvendedor' +
            ' AND en_modoliq = ''03''';
        if not ExisteSqlEx(sSql, [GetValue]) then
          Clear;
      end
      else if Assigned(aField) then
      begin
        if (aField.AsInteger <> FEntidad) then
        begin
          Clear;
          FEntidad := AValue;
        end;
      end
      else if not ExisteSqlEx('SELECT 1' +
                               ' FROM xev_entidadvendedor' + GetDBLink() +
                              ' WHERE ev_idvendedor = :idvendedor' +
                                ' AND ev_fechabaja IS NULL' +
                                ' AND ev_identidad = :identidad', [GetValue, FEntidad]) then
        inherited Clear;
    end;
  end;
end;

end.