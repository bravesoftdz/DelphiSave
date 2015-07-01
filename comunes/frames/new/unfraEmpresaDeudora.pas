unit unfraEmpresaDeudora;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   10-10-03
 ULTIMA MODIFICACION: 14-11-03

 Modificado por FFirenze 01/2004
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraEmpresa, Db, SDEngine, ToolEdit, ArtComboBox, PatternEdit, IntEdit,
  StdCtrls, Mask, ExtCtrls, RxToolEdit;

type
  TfraEmpresaDeudora = class(TfraEmpresa)
    Label6: TLabel;
  private
    fDeudora: boolean;
    procedure SetDeudora(const Value: boolean);
    function GetContratoVisible: Boolean; {By Fede}
    procedure SetContratoVisible(const Value: Boolean); {By Fede}
  public
    property IsDeudora: boolean read fDeudora write SetDeudora;
    property ContratoVisible: Boolean read GetContratoVisible write SetContratoVisible;
  end;

implementation

{$R *.DFM}

{ TfraEmpresaDeudora }

function TfraEmpresaDeudora.GetContratoVisible: Boolean;
begin
  Result := lbContrato.Visible;
end;

procedure TfraEmpresaDeudora.SetContratoVisible(const Value: Boolean);
begin
  lbContrato.Visible := Value;
  edContrato.Visible := Value;

  if Value Then
    cmbRSocial.Width := lbContrato.Left - cmbRSocial.Left - 5
  else
    cmbRSocial.Width := edContrato.Left + edContrato.Width - cmbRSocial.Left;
end;

procedure TfraEmpresaDeudora.SetDeudora(const Value: boolean);
begin
  if Value <> fDeudora then
  begin
    fDeudora := Value;
      Clear;

    SetContratoVisible(not fDeudora);

    if fDeudora then
    begin    // es empresa deudora
      //LockControl( edContrato );
      cmbRSocial.Columns.Items[1].Visible := False;

      Sql := 'SELECT ED_ID AS '        + EMP_ALIAS_ID                 + ', ' +
                    'ED_CUIT AS '      + EMP_ALIAS_CUIT               + ', ' +
                    'ED_NOMBRE AS '    + EMP_ALIAS_NOMBRE             + ', ' +
                    'NULL AS '         + EMP_ALIAS_CONTRATO           + ', ' +
                    'ED_FECHABAJA AS ' + EMP_ALIAS_BAJA               + ', ' +
                    'NULL '            + EMP_ALIAS_VIP                + ', ' +
                    'DECODE(ED_FECHABAJA, NULL, 1, 2) ' + EMP_ALIAS_COBERTURA + ', ' +
                    '1 '               + EMP_ALIAS_ORDEN              + ', ' +
                    'NULL '            + EMP_ALIAS_CODREG             + ', ' +
                    'TO_NUMBER(NULL) ' + EMP_ALIAS_CONTRATOEXT        + ', ' +
                    'TO_NUMBER(NULL) ' + EMP_ALIAS_IDTIPOREGIMEN_ORIG + ' ' +
               'FROM RED_EMPDEUDORA '  +
              'WHERE 1=1 ' ;

      FieldId       := 'ED_ID';
      FieldCUIT     := 'ED_CUIT';
      FieldNombre   := 'ED_NOMBRE';
      FieldBaja     := 'ED_FECHABAJA';

      MinLength := 0;
    end
    else
    begin                        // es empresa normal
      //LockControl( edContrato, False );
      cmbRSocial.Columns.Items[1].Visible := True;

      Sql := '';

      FieldId          := EMP_FIELD_ID;
      FieldCUIT        := EMP_FIELD_CUIT;
      FieldNombre      := EMP_FIELD_NOMBRE;
      FieldBaja        := EMP_FIELD_BAJA;
      FieldCodReg      := EMP_FIELD_CODREG;
      FieldContratoExt := EMP_FIELD_CONTRATOEXT;

      MinLength := 2;
    end;
  end;
end;

end.
