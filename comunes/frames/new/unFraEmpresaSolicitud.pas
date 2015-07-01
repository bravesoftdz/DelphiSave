unit unFraEmpresaSolicitud;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unFraEmpresaAfi, Db, SDEngine, PatternEdit, ArtComboBox, IntEdit, StdCtrls, Mask, unArt, ExtCtrls,
  RxToolEdit;

type
  TfraEmpresaSolicitud = class(TfraEmpresaAfi)
  private
    FIncluirContratos: Boolean;
  protected
    function GetSql: String; override;

    procedure InternalSetFormulario(aFormulario: String; aDoChanges: Boolean = False);
    procedure SetFormulario(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;

    property IncluirContratos: Boolean read FIncluirContratos write FIncluirContratos;
  published
    property Formulario: String write SetFormulario;
  end;

implementation

uses
  unFraEmpresa, AnsiSql, unDmPrincipal, Strfuncs;

{$R *.DFM}


constructor TfraEmpresaSolicitud.Create(AOwner: TComponent);
begin
  inherited;

  FIncluirContratos := True;
  FieldId := 'FO_ID';
end;


function TfraEmpresaSolicitud.GetSql: String;
var
  sSql: String;
begin
  {******************************************************************************
    Esto hay que probarlo con mas datos, porque posiblemente sea bastante lento,
    el problema es que para solucionarlo hay que cambiar todo el frame
  *******************************************************************************}

  if FSql <> '' then
     sSql := inherited GetSql
  else
  begin
    sSql := 'SELECT ' + SqlAlias(FieldId,              EMP_ALIAS_ID)            + ', ' +
                          SqlAlias(FieldCuit,          EMP_ALIAS_CUIT)          + ', ' +
                          SqlAlias(FieldNombre,        EMP_ALIAS_NOMBRE)        + ', ' +
                          SqlAlias(FieldContrato,      EMP_ALIAS_CONTRATO)      + ', ' +
                          SqlAlias(FieldCodReg,        EMP_ALIAS_CODREG)        + ', ' +
                          SqlAlias(FieldContratoExt,   EMP_ALIAS_CONTRATOEXT)   + ', ' +
                          SqlAlias(FieldIdRegimenOrig, EMP_ALIAS_IDTIPOREGIMEN_ORIG) + ', ' +
                          SqlAlias('VIP',              EMP_ALIAS_VIP)           + ', ' +
                          SqlAlias('CHECKCOBERTURA',   EMP_ALIAS_COBERTURA)     + ', ' +
                          SqlAlias('ORDENESTADO',      EMP_ALIAS_ORDEN)         + ', ' +
                          SqlAlias(FieldBaja,          EMP_ALIAS_BAJA)          + ', ' +
                          SqlAlias('FO_FORMULARIO',    EMP_ALIAS_FORMULARIO)    + ' '  +
              ' FROM ( SELECT ' + SqlAlias('FO_ID',           FieldId)          + ', ' +
                                  SqlAlias('SA_CUIT',         FieldCuit)        + ', ' +
                                  SqlAlias('SA_NOMBRE',       FieldNombre)      + ', ' +
                                  SqlAlias('TO_NUMBER(NULL)', FieldContrato)    + ', ' +
                                  SqlAlias('NULL',            FieldCodReg)      + ', ' +
                                  SqlAlias('TO_NUMBER(NULL)', EMP_ALIAS_CONTRATOEXT) + ', ' +
                                  SqlAlias('TO_NUMBER(NULL)', FieldIdRegimenOrig)    + ', ' +
                                  SqlAlias('''N''',           'VIP')            + ', ' +
                                  SqlAlias('1',               'CHECKCOBERTURA') + ', ' +
                                  SqlAlias('1',               'ORDENESTADO')    + ', ' +
                                  SqlAlias('TO_DATE(NULL)',   FieldBaja)        + ', ' +
                                  'FO_FORMULARIO ' +
                       ' FROM asa_solicitudafiliacion, afo_formulario' +
                      ' WHERE sa_idformulario = fo_id ';

    if fIncluirContratos then
      sSql := sSql + ' UNION '  + inherited GetSql + ' ) WHERE 1 = 1 '
    else
      sSql := sSql + ') WHERE 1=1 ';
  end;

  Result := sSql;
end;


procedure TfraEmpresaSolicitud.InternalSetFormulario(aFormulario: String; aDoChanges: Boolean = False);
var
  sSql: String;
begin
  if not IsEmptyString(aFormulario) then
  begin
    sSql := GetSql + GetSqlWhere + ' AND fo_formulario = ' + SqlString(aFormulario, True) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
    begin
      if sdqDatos.IsEmpty and Assigned(OnInvalidCuit) then
        OnInvalidCuit(Self)
      else
        if (sdqDatos.RecordCount > 1) and not UltContrato then
          cmbRSocial.DoDropDown(False)
        else
          LoadValues(aDoChanges);
    end;
  end else
    Clear;
end;

procedure TfraEmpresaSolicitud.SetFormulario(const Value: String);
begin
  InternalSetFormulario(Value, True);
end;

end.
