unit unMAN_ABM_ART;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, unArtFrame,
  unFraDomicilio, PatternEdit, StdCtrls, Db, SDEngine, ShortCutControl, ExComboBox, Mask, unFraDomicilioTrab,
  artSeguridad;

type
  TfrmMAN_ABM_ART = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tlbGuardar: TToolButton;
    tblSeparador2: TToolButton;
    ToolButton1: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    Label1: TLabel;
    edAR_NOMBRE: TEdit;
    grbDomicilioLegal: TGroupBox;
    lbCA: TLabel;
    lbTel: TLabel;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    edAR_TELEFONOS: TPatternEdit;
    edAR_FAX: TPatternEdit;
    edAR_CODAREATELEFONOS: TPatternEdit;
    edAR_CODAREAFAX: TPatternEdit;
    lbObservacion: TLabel;
    edAR_OBSERVACIONES: TMemo;
    sdqDatos: TSDQuery;
    ShortCutControl1: TShortCutControl;
    ExComboBox1: TExComboBox;
    fraDomicilio: TfraDomicilio;
    Seguridad: TSeguridad;
    edAR_EMAIL: TEdit;
    Label2: TLabel;
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
  private
    FIdArt: Integer;

    function isValidar: Boolean;

    procedure DoGuardarART;
    procedure DoLimpiar;
  public
    procedure DoCargaIDART(aId: Integer);
  end;

const
  ART_ALTA        : String = 'ART [ALTA]';
  ART_MODIFICACION: String = 'ART [MODIFICACION]';
  ART_BAJA        : String = 'ART [BAJA]';

var
  frmMAN_ABM_ART: TfrmMAN_ABM_ART;

implementation

uses
  unPrincipal, unDmPrincipal, General, CustomDlgs, AnsiSQL, SqlFuncs, Strfuncs, Internet;

{$R *.DFM}

procedure TfrmMAN_ABM_ART.tlbSalirClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmMAN_ABM_ART.tlbGuardarClick(Sender: TObject);
begin
  if isValidar then
    DoGuardarART;
end;

function TfrmMAN_ABM_ART.isValidar: Boolean;
begin
  Result := True;

  if edAR_EMAIL.Text <> '' then
    if not IsEMails(edAR_EMAIL.Text + ';') then
    begin
      InvalidMsg(edAR_EMAIL, 'El correo electrónico no es válido.');
      Result := False;
    end;

  if edAR_NOMBRE.Text = '' then
  begin
    InvalidMsg(edAR_NOMBRE, 'El nombre de la ART no puede quedar en blanco.');
    Result := False;
  end;

  if not fraDOMICILIO.IsValid then
  begin
//    InvalidMsg(fraDOMICILIO.edCPostal, 'El código postal no puede quedar en blanco' );
    Result := False;
  end;
end;

procedure TfrmMAN_ABM_ART.DoGuardarART;
var
  sSql: String;
begin
  with TSql.Create('aar_art') do
  try
    Fields.Add('ar_nombre',    edAR_NOMBRE.Text);
    Fields.Add('ar_cpostal',   fraDomicilio.CodigoPostal);
    Fields.Add('ar_calle',     fraDomicilio.Calle);
    Fields.Add('ar_localidad', fraDomicilio.Localidad);

    sSql :=
      'SELECT pv_codigo' +
       ' FROM cpv_provincias' +
      ' WHERE pv_descripcion = :provincia';
    Fields.Add('ar_provincia', ValorSqlIntegerEx(sSql, [fraDomicilio.Provincia], 0), False);

    Fields.Add('ar_numero',           fraDOMICILIO.Numero);
    Fields.Add('ar_piso',             fraDOMICILIO.Piso);
    Fields.Add('ar_departamento',     fraDOMICILIO.Departamento);
    Fields.Add('ar_cpostala',         fraDOMICILIO.CPA);
    Fields.Add('ar_codareatelefonos', edAR_CODAREATELEFONOS.Text);
    Fields.Add('ar_telefonos',        edAR_TELEFONOS.Text);
    Fields.Add('ar_codareafax',       edAR_CODAREAFAX.Text);
    Fields.Add('ar_fax',              edAR_FAX.Text);
    Fields.Add('ar_observaciones',    edAR_OBSERVACIONES.Text);
    Fields.Add('ar_email',            edAR_EMAIL.Text);
    
    if Caption = ART_ALTA then
    begin
      SqlType := stInsert;
      PrimaryKey.Add('ar_id',    ValorSqlInteger('SELECT seq_aar_id.NEXTVAL FROM DUAL'), False);
      Fields.Add('ar_fechaalta', 'Actualdate', False);
      Fields.Add('AR_usualta',   frmPrincipal.DBLogin.UserId);
    end
    else if Caption = ART_MODIFICACION then
    begin
      SqlType := stUpdate;
      PrimaryKey.Add('ar_id',     sdqDatos.fieldByName('ar_id').asInteger, False);
      Fields.Add('ar_fechamodif', 'Actualdate', False);
      Fields.Add('ar_usumodif',   frmPrincipal.DBLogin.UserId);
    end;

    EjecutarSql(Sql);
    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    Close;
//    sdqDatos.Close;
//    sdqDatos.Open;
  finally
    Free;
  end;
end;

procedure TfrmMAN_ABM_ART.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ART_ALTA;
end;

procedure TfrmMAN_ABM_ART.DoCargaIDART(aId: Integer);
begin
  FIdArt := aId;

  with sdqDatos do
  begin
    ParamByName('iidparam').AsInteger := FIdArt;
    Open;

    edAR_NOMBRE.Text           := FieldByName('ar_nombre').AsString;
    fraDomicilio.CodigoPostal  := FieldByName('ar_cpostal').AsString;
    fraDomicilio.Calle         := FieldByName('ar_calle').AsString;
    fraDomicilio.Localidad     := FieldByName('ar_localidad').AsString;
    fraDomicilio.Provincia     := FieldByName('pv_descripcion').AsString;
    fraDOMICILIO.CPA           := FieldByName('ar_cpostala').AsString;
    fraDOMICILIO.Departamento  := FieldByName('ar_departamento').AsString;
    fraDOMICILIO.Numero        := FieldByName('ar_numero').AsString;
    fraDOMICILIO.Piso          := FieldByName('ar_piso').AsString;
    edAR_CODAREATELEFONOS.Text := FieldByName('ar_codareatelefonos').AsString;
    edAR_TELEFONOS.Text        := FieldByName('ar_telefonos').AsString;
    edAR_CODAREAFAX.Text       := FieldByName('ar_codareafax').AsString;
    edAR_FAX.Text              := FieldByName('ar_fax').AsString;
    edAR_OBSERVACIONES.Text    := FieldByName('ar_observaciones').AsString;
    edAR_EMAIL.Text            := FieldByName('ar_email').AsString;

    if Eof then
      Caption := ART_ALTA
    else
      Caption := ART_MODIFICACION;
  end;
end;

procedure TfrmMAN_ABM_ART.tlbNuevoClick(Sender: TObject);
begin
  DoLimpiar;
  Caption := ART_ALTA;
end;

procedure TfrmMAN_ABM_ART.DoLimpiar;
begin
  edAR_NOMBRE.Clear;
  fraDOMICILIO.Clear;
  edAR_CODAREATELEFONOS.Clear;
  edAR_TELEFONOS.Clear;
  edAR_CODAREAFAX.Clear;
  edAR_FAX.Clear;
  edAR_OBSERVACIONES.Clear;
end;

end.
