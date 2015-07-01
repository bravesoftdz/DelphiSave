unit unFraEmpresaHolding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraEmpresa, ExtCtrls, DB,
  SDEngine, ToolEdit, ArtComboBox, PatternEdit, IntEdit, StdCtrls, Mask, unArt,
  RxToolEdit;

type
  TfraEmpresaHolding = class(TfraEmpresa)
    Label1: TLabel;
    cmbHolding: TArtComboBox;
    procedure cmbHoldingDropDown(Sender: TObject);
    procedure cmbHoldingCloseUp(Sender: TObject);
  protected
    procedure SetEditorsValues; override;
  public
  	constructor Create(AOwner: TComponent); override;
    function  GetSUSS: Integer;
   	procedure Clear; override;
  published
    property SUSS: Integer read GetSUSS;
  end;

const
  { Nombres por default de los campos }
  EMP_FIELD_HOLDING      : String = 'EM_IDGRUPOECONOMICO';
  EMP_FIELD_HOLDING_DESC : String = 'HOLDING';
  EMP_FIELD_SUSS         : String = 'EM_SUSS';

var
  fraEmpresaHolding: TfraEmpresaHolding;

implementation

uses
  AnsiSQL, unDmPrincipal, CustomDlgs, Numeros, General, unConfidencial
  {$IFDEF ORACLE}, unVisualizadorDigitalizacion{$ENDIF}, unSesion;

{$R *.dfm}

procedure TfraEmpresaHolding.cmbHoldingDropDown(Sender: TObject);
var
  sSql: String;
begin
  if (Length(Trim(cmbHolding.Text)) < MinLength) then
  begin
    Clear;
    InvalidHint(cmbHolding, Format(SMinLength, [LowerCase(NumLetras( MinLength ))]), 'Advertencia', blnWarning);
    Change;
  end
  else
  begin
    sSql := GetSql +
            ' AND ' + EMP_FIELD_HOLDING + ' IN (SELECT GE_ID FROM AGE_GRUPOECONOMICO WHERE GE_DESCRIPCION LIKE ' + SQL_QUOTE + cmbHolding.Text + SQL_WILLCARD + SQL_QUOTE + ') ' +
            GetSqlWhere + GetSqlOrderBy;

    OpenQuery(sdqDatos, sSql, True);

    if mskCUIT.Text <> '' Then
      sdqDatos.Locate(EMP_ALIAS_CUIT, mskCUIT.Text, [])

    else if edContrato.Value > 0 Then
      sdqDatos.Locate(EMP_ALIAS_CONTRATO, edContrato.Value, []);
  end;
end;

constructor TfraEmpresaHolding.Create(AOwner: TComponent);
begin
  inherited;
  ExtraFields := ', ' + EMP_FIELD_HOLDING + ', (SELECT GE_DESCRIPCION FROM AGE_GRUPOECONOMICO WHERE GE_ID = ' + EMP_FIELD_HOLDING + ') as ' + EMP_FIELD_HOLDING_DESC + ', EM_SUSS as ' + EMP_FIELD_SUSS + ' ';
end;

procedure TfraEmpresaHolding.SetEditorsValues;
begin
  inherited;
  cmbHolding.Text := sdqDatos.FieldByName(EMP_FIELD_HOLDING_DESC).AsString;
end;

procedure TfraEmpresaHolding.Clear;
begin
  inherited;
  cmbHolding.Text := '';
end;

procedure TfraEmpresaHolding.cmbHoldingCloseUp(Sender: TObject);
begin
  if cmbHolding.Text = '' Then
    Clear
  else
    LoadValues(True);
end;

function TfraEmpresaHolding.GetSUSS: Integer;
begin
  Result := sdqDatos.FieldByName(EMP_FIELD_SUSS).AsInteger;
end;

end.
