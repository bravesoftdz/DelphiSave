unit unManRED_EMPDEUDORA;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               NELSON WILLY KUSTER
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, Mask, unArt, unArtFrame,
  unFraDomicilio;

type
  TfrmManRED_EMPDEUDORA = class(TfrmCustomGridABM)
    lbCuit: TLabel;
    mskCUITEmpDeudora: TMaskEdit;
    lbRSocial: TLabel;
    edRSocialEmpDeudora: TEdit;
    grbDomicilioLegal: TGroupBox;
    lbCA: TLabel;
    lbTel: TLabel;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    Label17: TLabel;
    edED_TELEFONOS: TPatternEdit;
    edED_FAX: TPatternEdit;
    edED_CODAREATELEFONOS: TPatternEdit;
    edED_CODAREAFAX: TPatternEdit;
    fraDOMICILIO_LEGAL: TfraDomicilio;
    edED_OBSERVACIONESLegal: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FIdEmpresaDeudoraAlta: TTableId;

    procedure SetIdEmpresaDeudoraAlta(const Value: TTableId);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property IdEmpresaDeudoraAlta: TTableId read FIdEmpresaDeudoraAlta write SetIdEmpresaDeudoraAlta default ART_EMPTY_ID;
  end;

var
  frmManRED_EMPDEUDORA: TfrmManRED_EMPDEUDORA;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, StrFuncs, VclExtra, Cuit,
  unSesion;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManRED_EMPDEUDORA }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRED_EMPDEUDORA.ClearControls;
begin
  VclExtra.LockControl(mskCUITEmpDeudora, False);

  fpAbm.ActiveControl := mskCUITEmpDeudora;  // setea el foco

  mskCUITEmpDeudora.Clear;
  edRSocialEmpDeudora.Clear;
  fraDOMICILIO_LEGAL.Clear;
  edED_CODAREATELEFONOS.Clear;
  edED_TELEFONOS.Clear;
  edED_CODAREAFAX.Clear;
  edED_FAX.Clear;
  edED_OBSERVACIONESLegal.Clear;
end;

procedure TfrmManRED_EMPDEUDORA.LoadControls;
begin
  VclExtra.LockControl(mskCUITEmpDeudora, True);

  fpAbm.ActiveControl := edRSocialEmpDeudora;

  with sdqConsulta do
  begin
    mskCUITEmpDeudora.Text   := FieldByName('ED_CUIT').AsString;
    edRSocialEmpDeudora.Text := FieldByName('ED_NOMBRE').AsString;

//  fraDOMICILIO_LEGAL.Ubicacion     := FieldByName('ED_IDUBICACION').AsInteger;
    fraDOMICILIO_LEGAL.Calle        := FieldByName('ED_CALLE').AsString;
    fraDOMICILIO_LEGAL.Numero       := FieldByName('ED_NUMERO').AsString;
    fraDOMICILIO_LEGAL.Piso         := FieldByName('ED_PISO').AsString;
    fraDOMICILIO_LEGAL.Departamento := FieldByName('ED_DEPARTAMENTO').AsString;
    fraDOMICILIO_LEGAL.CodigoPostal := FieldByName('ED_CPOSTAL').AsString;
    fraDOMICILIO_LEGAL.CPA          := FieldByName('ED_CPOSTALA').AsString;
    fraDOMICILIO_LEGAL.Localidad    := FieldByName('ED_LOCALIDAD').AsString;
    fraDOMICILIO_LEGAL.Provincia    := FieldByName('PV_DESCRIPCION').AsString;
    edED_CODAREATELEFONOS.Text      := FieldByName('ED_CODAREATELEFONOS').AsString;
    edED_TELEFONOS.Text             := FieldByName('ED_TELEFONOS').AsString;
    edED_CODAREAFAX.Text            := FieldByName('ED_CODAREAFAX').AsString;
    edED_FAX.Text                   := FieldByName('ED_FAX').AsString;
    edED_OBSERVACIONESLegal.Text    := FieldByName('ED_OBSERVACIONES').AsString;
  end;
end;

function TfrmManRED_EMPDEUDORA.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;
  fraDOMICILIO_LEGAL.FrameExit(nil);

  // Cuit
  if (mskCUITEmpDeudora.Text > '') and (not IsCuit(mskCUITEmpDeudora.Text)) then
    InvalidMsg( mskCUITEmpDeudora, 'La CUIT es inválida.')
  else
  begin
    if ModoABM in [maAlta, maModificacion] then
    begin
      sSql := 'SELECT 1 ' +
                'FROM RED_EMPDEUDORA ' +
               'WHERE ED_CUIT=' + SqlValue(mskCUITEmpDeudora.Text);

      if ModoABM = maModificacion then
        sSql := sSql + ' AND ED_CUIT <> ' + SqlValue(sdqConsulta.FieldByName('ED_CUIT').AsString);

      if ExisteSql(sSql) then
      begin
        InvalidMsg(mskCUITEmpDeudora, 'La CUIT ya existe.');
        Exit;
      end;
    end;

    // Razón social
    if Trim(edRSocialEmpDeudora.Text) = '' then
      InvalidMsg(edRSocialEmpDeudora, 'Debe ingresar la razón social.')
    else
      Result := True;
  end;
end;

procedure TfrmManRED_EMPDEUDORA.FormCreate(Sender: TObject);
begin
  inherited;

  IdEmpresaDeudoraAlta := ART_EMPTY_ID;

  FieldBaja := 'ED_FECHABAJA';

  CheckPK   := False;

  CAPTION_ALTA    := 'Agregar Empresa Deudora';
  CAPTION_MODIFIC := 'Modificar Empresa Deudora';
  MSG_BAJA        := '¿Desea eliminar la empresa seleccionada?';
//  MSG_PK_VIOLATED := 'No se pudo ingresar el registro porque ya existe una empresa con la misma clave';
end;

function TfrmManRED_EMPDEUDORA.DoABM: Boolean;
var
  idEmpresa: TTableId;
begin
  with Sql do
  begin
    Clear;

    TableName := 'RED_EMPDEUDORA';

    if ModoABM = maBaja then
    begin
      PrimaryKey.Add( 'ED_ID',    sdqConsulta.FieldByName('ED_ID').AsInteger);
      Fields.Add( 'ED_FECHABAJA', exDateTime);
      Fields.Add( 'ED_USUBAJA',   Sesion.UserID);

      SqlType := stUpdate;
    end
    else
    begin
      if ModoABM = maAlta then
      begin
        idEmpresa := GetSecNextVal('SEQ_RED_ID');

        PrimaryKey.Add('ED_ID',    idEmpresa);
        Fields.Add('ED_FECHAALTA', exDateTime);
        Fields.Add('ED_USUALTA',   Sesion.UserID);

        SqlType := stInsert;

        FIdEmpresaDeudoraAlta := idEmpresa;
      end
      else
      begin
        PrimaryKey.Add('ED_ID',     sdqConsulta.FieldByName('ED_ID').AsInteger);
        Fields.Add('ED_FECHAMODIF', exDateTime);
        Fields.Add('ED_USUMODIF',   Sesion.UserID);

        SqlType := stUpdate;
      end;

      Fields.Add('ED_NOMBRE',           trim(edRSocialEmpDeudora.Text));
      Fields.Add('ED_CUIT',             mskCUITEmpDeudora.Text);
//      Fields.Add('ED_IDUBICACION',      fraDOMICILIO_LEGAL.Ubicacion);
      Fields.Add('ED_CALLE',            fraDOMICILIO_LEGAL.Calle);
      Fields.Add('ED_NUMERO',           fraDOMICILIO_LEGAL.Numero);
      Fields.Add('ED_PISO',             fraDOMICILIO_LEGAL.Piso);
      Fields.Add('ED_DEPARTAMENTO',     fraDOMICILIO_LEGAL.Departamento);
      Fields.Add('ED_CPOSTAL',          fraDOMICILIO_LEGAL.CodigoPostal);
      Fields.Add('ED_CPOSTALA',         fraDOMICILIO_LEGAL.CPA);
      Fields.Add('ED_LOCALIDAD',        fraDOMICILIO_LEGAL.Localidad);
      Fields.Add('ED_PROVINCIA',        ValorSqlInteger('SELECT PV_CODIGO' +
                                                         ' FROM CPV_PROVINCIAS' +
                                                        ' WHERE PV_DESCRIPCION = ' + SqlValue(fraDOMICILIO_LEGAL.Provincia), 0), False);
      Fields.Add('ED_CODAREATELEFONOS', edED_CODAREATELEFONOS.Text);
      Fields.Add('ED_TELEFONOS',        edED_TELEFONOS.Text);
      Fields.Add('ED_CODAREAFAX',       edED_CODAREAFAX.Text);
      Fields.Add('ED_FAX',              edED_FAX.Text);
      Fields.Add('ED_OBSERVACIONES',    edED_OBSERVACIONESLegal.Text);

      Fields.Add('ED_FECHABAJA', exNull);
      Fields.Add('ED_USUBAJA',   exNull);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManRED_EMPDEUDORA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  // para ponerle los guiones al CUIT
  sdqConsulta.FieldByName('ED_CUIT').EditMask := EMSK_CUIT;
end;

procedure TfrmManRED_EMPDEUDORA.SetIdEmpresaDeudoraAlta(const Value: TTableId);
begin
  if FIdEmpresaDeudoraAlta <> Value then
    FIdEmpresaDeudoraAlta := Value;
end;

end.
