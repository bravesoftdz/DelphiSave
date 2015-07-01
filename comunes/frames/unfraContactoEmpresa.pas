unit unfraContactoEmpresa;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   30-07-03
 ULTIMA MODIFICACION: 11-11-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, unArt;

type
  TfraContactoEmpresa = class(TfraCodigoDescripcion)
  private
    FContacto: TTableId;
    FEmpresa: TTableId;
  protected
    function GetSql: String; override;
    {Oculta las Propiedades}
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
    property FieldBaja;
    property ExtraFields;
    function GetContacto: TTableID;
    procedure SetContacto ( Value: TTableID );
    procedure SetEmpresa ( Value: TTableID );
    procedure SetValue(const Value: TValueType); override;    
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    property Contacto: TTableId read GetContacto write SetContacto;
    property Empresa: TTableId  read FEmpresa  write SetEmpresa  ;
  end;

implementation
{$R *.DFM}

Uses
    unDmPrincipal, AnsiSql;

{-----------------------------------------------------------------------------}
constructor TfraContactoEmpresa.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'ACT_CONTACTO';
  FFieldID     := 'CT_ID';
  FFieldCodigo := 'CT_ID';
  FFieldDesc   := 'CT_CONTACTO';
  FFieldBaja   := 'CT_FECHABAJA';
  fEmpresa     := ART_EMPTY_ID;
  fContacto    := ART_EMPTY_ID;
end;
{-----------------------------------------------------------------------------}
function TfraContactoEmpresa.GetSql: String;
var
  sSql: string;
begin
  sSql := 'SELECT CT_ID AS ' + CD_ALIAS_ID + ', ' +
                 ' CT_ID AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                 ' CT_CONTACTO AS ' + CD_ALIAS_DESC + ', ' +
                 ' CT_FECHABAJA AS ' + CD_ALIAS_BAJA + ', ' +
                 ' CARGO.TB_DESCRIPCION CARGODESC, CAREA.TB_DESCRIPCION CAREADESC, ' +
                 ' CT_FECHAALTA, CT_USUALTA, EM_NOMBRE, EM_ID ' + FExtraFields +
          ' FROM ACT_CONTACTO, CTB_TABLAS CARGO, CTB_TABLAS CAREA, AEM_EMPRESA ' +
            ' WHERE CT_IDEMPRESA = EM_ID ' +
              ' AND CARGO.TB_CLAVE=''CARGO'' ' +
              ' AND CARGO.TB_CODIGO=CT_CARGO ' +
              ' AND CAREA.TB_CLAVE (+)=''CAREA'' ' +
              ' AND CAREA.TB_CODIGO (+)=CT_AREA ' +
              ExtraCondition;
  if Contacto <> ART_EMPTY_ID Then
    sSql   := sSql + 'AND CT_ID = ' + SqlInt(Contacto);
  if Empresa <> ART_EMPTY_ID Then
    sSql   := sSql + 'AND EM_ID = ' + SqlInt(Empresa);

  Result := sSql;
end;
{-----------------------------------------------------------------------------}
function TfraContactoEmpresa.GetContacto: TTableID;
begin
  Result := GetValue;
end;
{-----------------------------------------------------------------------------}
procedure TfraContactoEmpresa.SetContacto ( Value: TTableID );
begin
  fContacto := Value;
  SetValue( Value );
end;
{-----------------------------------------------------------------------------}
procedure TfraContactoEmpresa.SetEmpresa ( Value: TTableID );
begin
  if Value = ART_EMPTY_ID then Clear;
  fEmpresa := Value;
end;
{-----------------------------------------------------------------------------}
procedure TfraContactoEmpresa.SetValue(const Value: TValueType);
var
  sSql : String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FTableName + '.' + FFieldID + ' = ' + SqlValue( Value );
  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues (False);
end;
{-----------------------------------------------------------------------------}
procedure TfraContactoEmpresa.Clear;
begin
  inherited;
  fContacto := ART_EMPTY_ID;
end;
{-----------------------------------------------------------------------------}
end.
