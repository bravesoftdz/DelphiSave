unit unfraEntidadCUIT;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   22-01-2003
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, RxToolEdit;

type
  TfraEntidadCUIT = class (TfraCodigoDescripcion)
    Label2: TLabel;
    Label1: TLabel;
    mskCuit: TMaskEdit;
    lbRSocial: TLabel;
    edEN_CODBANCO: TPatternEdit;
    Label3: TLabel;
    procedure mskCuitKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure mskCuitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edEN_CODBANCOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskCuitExit(Sender: TObject);
  private
    FCodBanco: String;
    FCUIT    : String;
    FSql     : String;
    FVendedor: TTableId;

    function GetCodBanco: String;
    function GetCUIT: String;    
  protected
    function GetSql: String; override;

    procedure LoadValues(DoChanges: Boolean = False); override;
    procedure SetCodBanco(const Value: String);
    procedure SetCUIT(const Value: String; DoChanges: Boolean = False);
    procedure SetVendedor(const AValue: TTableId);
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; override;
  published
    property CodBanco: String  	read GetCodBanco  write SetCodBanco;
    property CUIT    : String  	read GetCUIT;
    property Sql     : String  	read GetSql       write FSql;
    property Vendedor: TTableId read FVendedor    write SetVendedor;
  end;

implementation

uses
  unDmPrincipal, AnsiSql, VCLExtra, SqlFuncs, CustomDlgs, CUIT;

const
  CD_ALIAS_CODIGOBANCO: String = 'CODBANCO';
  CD_ALIAS_CUIT: String = 'CUIT';

{$R *.DFM}
{ TfraCodigoDescripcionCUIT }

constructor TfraEntidadCUIT.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'XEN_ENTIDAD' + GetDBLink();
  FieldID     := 'EN_ID';
  FieldCodigo := 'EN_ID';
  FieldDesc   := 'EN_NOMBRE';
  FieldBaja   := 'EN_FECHABAJA';
  VCLExtra.LockControls([edCodigo], True);
end;

function TfraEntidadCUIT.GetCUIT: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString
  else
    Result := '';
end;

function TfraEntidadCUIT.GetSql: String;
var
  sCadena: String;
begin
  if FSql = '' then
    if FVendedor <> ART_EMPTY_ID then
      Result := 'SELECT ' + FieldId + ' AS ' + CD_ALIAS_ID + ', ' +
                            FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                            FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                            'EN_CUIT AS ' + CD_ALIAS_CUIT + ', ' +
                            'EN_CODBANCO AS ' + CD_ALIAS_CODIGOBANCO + ', ' +
                            FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ', ' +
                           'EV_IDENTIDAD, EV_ID ' + FExtraFields +
                ' FROM XEN_ENTIDAD' + GetDBLink() + ', XEV_ENTIDADVENDEDOR' + GetDBLink() + ' ' +
               ' WHERE EN_ID = EV_IDENTIDAD ' +
                  'AND EV_IDVENDEDOR = ' + SqlInt(FVendedor) + ExtraCondition
    else
    begin
      if (mskCUIT = Screen.ActiveControl) then
        sCadena := ' AND EN_CUIT like ''' + mskCuit.Text + '%''';

      if (edCodigo = Screen.ActiveControl) then
        sCadena := ' AND EN_CODBANCO like ''' + edCodigo.Text + '%''';


      if (mskCUIT.Text > '') and (mskCUIT = Screen.ActiveControl) then
        ExtraCondition := ExtraCondition + sCadena;
      if (edCodigo.Text > '') and (edCodigo = Screen.ActiveControl) then
        ExtraCondition := ExtraCondition + sCadena;

      Result := inherited GetSql;
      AddField(Result, 'EN_CUIT', CD_ALIAS_CUIT);
      AddField(Result, 'EN_CODBANCO', CD_ALIAS_CODIGOBANCO);

      ExtraCondition := Copy(ExtraCondition, 1, Length(ExtraCondition) - Length(sCadena));

      if (edCodigo = Screen.ActiveControl) or (mskCUIT = Screen.ActiveControl) then
      	ExtraCondition := Copy(ExtraCondition, 1, Length(ExtraCondition) - Length(sCadena));
    end
  else
     Result := FSql;
end;

procedure TfraEntidadCUIT.LoadValues(DoChanges: Boolean);
begin
  mskCuit.Text       := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString;
  edEN_CODBANCO.Text := sdqDatos.FieldByName(CD_ALIAS_CODIGOBANCO).AsString;
  inherited;
end;

procedure TfraEntidadCUIT.SetCUIT(const Value: String; DoChanges: Boolean);
var
	sSql: String;
begin
  FCUIT := Value;
  sSql := GetSql + GetSqlWhere + ' AND EN_CUIT = ' + SqlString(Value, True);

  if OpenQuery(sdqDatos, sSql, True) then
  	LoadValues(DoChanges);
end;

procedure TfraEntidadCUIT.mskCuitKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SetCUIT(mskCUIT.Text, True);
end;

procedure TfraEntidadCUIT.FrameExit(Sender: TObject);
begin
  if not ReadOnly then
  begin
    if not IsSelected then
      Clear
    else
    begin
    	if (not sdqDatos.Active) or (edEN_CODBANCO.Text <> sdqDatos.FieldByName(CD_ALIAS_CODIGOBANCO).AsString) or
       	 (edCodigo.Text <> sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString) or
         (mskCUIT.Text <> sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString) then
      	if (edCodigo.Text <> '') then
        	SetCodigo(edCodigo.Text, True)
        else if (mskCUIT.Text <> '') then
        	SetCUIT(mskCUIT.Text, True)
        else
        	SetCodBanco(edEN_CODBANCO.Text)
      else
      begin
      	edEN_CODBANCO.Text  := sdqDatos.FieldByName(CD_ALIAS_CODIGOBANCO).AsString;
        mskCuit.Text        := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString;
        cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString;
      end;
    end;
  end;
end;

procedure TfraEntidadCUIT.mskCuitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SetCUIT(mskCUIT.Text, True);

  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown;
end;

function TfraEntidadCUIT.GetCodBanco: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_CODIGOBANCO).AsString
  else
    Result := '';
end;

procedure TfraEntidadCUIT.SetCodBanco(const Value: String);
var
	sSql: String;
begin
  FCodBanco := Value;
  sSql := GetSql + GetSqlWhere + ' AND EN_CODBANCO = ' + SqlString(Value, True);

  if OpenQuery(sdqDatos, sSql, True) then
  	LoadValues(True);
end;

procedure TfraEntidadCUIT.edEN_CODBANCOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  	SetCodBanco(edEN_CODBANCO.Text);
  inherited;
end;

procedure TfraEntidadCUIT.Clear;
begin
  inherited;
  mskCuit.Text := '';
  edEN_CODBANCO.Text := '';
  FVendedor := ART_EMPTY_ID;
end;

procedure TfraEntidadCUIT.SetVendedor(const AValue: TTableId);
var
	AField: TField;
  sSql: String;
begin
  if FVendedor <> AValue then
  begin
    FVendedor := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then
    begin
      AField := sdqDatos.Fields.FindField('EV_IDVENDEDOR');
      if Assigned(AField) then
      begin
        if(AField.AsInteger <> FVendedor) then
          Clear;
      end
      else
      begin
      	sSql := 'SELECT 1' +
                 ' FROM XEV_ENTIDADVENDEDOR' + GetDBLink() +
                ' WHERE EV_IDENTIDAD = :p1' +
                  ' AND EV_IDVENDEDOR = :p2';
        if not ExisteSqlEx(sSql, [GetValue, FVendedor]) then
          Clear;
      end;
    end;
  end;
end;

procedure TfraEntidadCUIT.mskCuitExit(Sender: TObject);
begin
  inherited;
  if Length(mskCUIT.Text) = 11 then
    Verificar(not IsCUIT(mskCUIT.Text), mskCUIT, 'El número de CUIT ingresado no es válido.');
end;

end.