unit unManAEC_ESTUDIOCONTABLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  unFraCodigoDescripcion, unFraUsuario, Mask, unFraDomicilioTrab;

type
  TfrmManAEC_ESTUDIOCONTABLE = class(TfrmCustomGridABM)
    Label1: TLabel;
    edEC_NOMBRE: TEdit;
    Label2: TLabel;
    edEC_CODAREATELEFONOS: TIntEdit;
    edEC_TELEFONOS: TPatternEdit;
    Label3: TLabel;
    edEC_CODAREAFAX: TIntEdit;
    edEC_FAX: TPatternEdit;
    Label4: TLabel;
    edEC_ID: TEdit;
    lbCUIT: TLabel;
    edEC_CUIT: TMaskEdit;
    lblDirElectronica: TLabel;
    edEC_DIRELECTRONICA: TEdit;
    fraDomicilio: TfraDomicilio;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure PrintResults; override;
  public
  end;

var
  frmManAEC_ESTUDIOCONTABLE: TfrmManAEC_ESTUDIOCONTABLE;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, CUIT, Internet, Strfuncs;

{$R *.DFM}

procedure TfrmManAEC_ESTUDIOCONTABLE.ClearControls;
begin
  edEC_ID.Clear;
  edEC_NOMBRE.Clear;
  edEC_CUIT.Clear;

  // Habilito el control
  edEC_NOMBRE.Color    := clWindow;
  edEC_NOMBRE.ReadOnly := False;

  fraDomicilio.Clear;
  edEC_CODAREATELEFONOS.Clear;
  edEC_TELEFONOS.Clear;
  edEC_CODAREAFAX.Clear;
  edEC_FAX.Clear;
  edEC_DIRELECTRONICA.Clear;
end;

function TfrmManAEC_ESTUDIOCONTABLE.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ec_id',    sdqConsulta.FieldByName('ec_id').AsInteger);
    Sql.Fields.Add('ec_fechabaja', exDateTime);
    Sql.Fields.Add('ec_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('ec_id', 'AFI.SEQ_AEC_ID.NEXTVAL');
      Sql.Fields.Add('ec_fechaalta',        exDateTime);
      Sql.Fields.Add('ec_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ec_id',     sdqConsulta.FieldByName('ec_id').AsInteger);
      Sql.Fields.Add('ec_fechamodif', exDateTime);
      Sql.Fields.Add('ec_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('ec_cuit',   edEC_CUIT.Text);
    Sql.Fields.Add('ec_nombre', edEC_NOMBRE.Text);

    with fraDomicilio do
    begin
      Sql.Fields.Add('ec_cpostal',   CodigoPostal);
      Sql.Fields.Add('ec_calle',     Calle);
      Sql.Fields.Add('ec_localidad', Localidad);

      sSql :=
        'SELECT pv_codigo' +
         ' FROM cpv_provincias' +
        ' WHERE pv_descripcion = :provincia';
      Sql.Fields.Add('ec_provincia', ValorSqlEx(sSql, [Provincia]), dtString);
      
      Sql.Fields.Add('ec_numero',       Numero);
      Sql.Fields.Add('ec_piso',         Piso);
      Sql.Fields.Add('ec_departamento', Departamento);
      Sql.Fields.Add('ec_cpostala',     CPA);
    end;

    Sql.Fields.Add('ec_codareatelefonos', edEC_CODAREATELEFONOS.Text);
    Sql.Fields.Add('ec_telefonos',        edEC_TELEFONOS.Text);
    Sql.Fields.Add('ec_codareafax',       edEC_CODAREAFAX.Text);
    Sql.Fields.Add('ec_fax',              edEC_FAX.Text);
    Sql.Fields.Add('ec_direlectronica',   edEC_DIRELECTRONICA.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManAEC_ESTUDIOCONTABLE.LoadControls;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    edEC_ID.Text     := FieldByName('ec_id').AsString;
    edEC_NOMBRE.Text := FieldByName('ec_nombre').AsString;
    edEC_CUIT.Text   := FieldByName('ec_cuit').AsString;

    // Inhabilito el control
    edEC_NOMBRE.Color    := clBtnFace;
    edEC_NOMBRE.ReadOnly := True;

    with fraDomicilio do
    begin
      Numero       := FieldByName('ec_numero').AsString;
      Piso         := FieldByName('ec_piso').AsString;
      Departamento := FieldByName('ec_departamento').AsString;
      CPA          := FieldByName('ec_cpostala').AsString;
      CodigoPostal := FieldByName('ec_cpostal').AsString;
      Calle        := FieldByName('ec_calle').AsString;
      Localidad    := FieldByName('ec_localidad').AsString;

      if FieldByName('ec_provincia').AsString <> '' then
      begin
        sSql :=
          'SELECT pv_descripcion' +
           ' FROM cpv_provincias' +
          ' WHERE pv_codigo = :provincia';
        Provincia := ValorSqlEx(sSql, [FieldByName('ec_provincia').AsString]);
      end;
    end;

    edEC_CODAREATELEFONOS.Text := FieldByName('ec_codareatelefonos').AsString;
    edEC_TELEFONOS.Text        := FieldByName('ec_telefonos').AsString;
    edEC_CODAREAFAX.Text       := FieldByName('ec_codareafax').AsString;
    edEC_FAX.Text              := FieldByName('ec_fax').AsString;
    edEC_DIRELECTRONICA.Text   := FieldByName('ec_direlectronica').AsString;
  end;
end;

function TfrmManAEC_ESTUDIOCONTABLE.Validar: Boolean;
begin
  Verificar((Trim(edEC_NOMBRE.Text) = ''), edEC_NOMBRE, 'El nombre es obligatorio.');
  Verificar((edEC_CUIT.Text <> '') and (not IsCuit(edEC_CUIT.Text)), edEC_CUIT, 'La C.U.I.T. es incorrecta.');
  Verificar((Trim(edEC_DIRELECTRONICA.Text) <> '') and not IsEMail(edEC_DIRELECTRONICA.Text), edEC_DIRELECTRONICA, 'El e-Mail es incorrecto.');

  Result := fraDomicilio.IsValid;
end;

procedure TfrmManAEC_ESTUDIOCONTABLE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuManEstudiosContables.Enabled := True;
end;

procedure TfrmManAEC_ESTUDIOCONTABLE.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;

procedure TfrmManAEC_ESTUDIOCONTABLE.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'aec_estudiocontable';
  FieldBaja     := 'ec_fechabaja';
end;

end.
