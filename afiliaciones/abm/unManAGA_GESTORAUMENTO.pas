unit unManAGA_GESTORAUMENTO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  unFraCodigoDescripcion, unFraUsuario, Mask, unFraDomicilioTrab;

type
  TfrmManAGA_GESTORAUMENTO = class(TfrmCustomGridABM)
    Label1: TLabel;
    edGA_NOMBRE: TEdit;
    Label2: TLabel;
    edGA_CODAREATELEFONOS: TIntEdit;
    edGA_TELEFONOS: TPatternEdit;
    Label3: TLabel;
    edGA_CODAREAFAX: TIntEdit;
    edGA_FAX: TPatternEdit;
    Label4: TLabel;
    edGA_ID: TEdit;
    lbCUIT: TLabel;
    edGA_CUIT: TMaskEdit;
    lblDirElectronica: TLabel;
    edGA_DIRELECTRONICA: TEdit;
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
  frmManAGA_GESTORAUMENTO: TfrmManAGA_GESTORAUMENTO;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, CUIT, Internet, Strfuncs;

{$R *.DFM}

procedure TfrmManAGA_GESTORAUMENTO.ClearControls;
begin
  edGA_ID.Clear;
  edGA_NOMBRE.Clear;
  edGA_CUIT.Clear;

  // Habilito el control
  edGA_NOMBRE.Color    := clWindow;
  edGA_NOMBRE.ReadOnly := False;

  fraDomicilio.Clear;
  edGA_CODAREATELEFONOS.Clear;
  edGA_TELEFONOS.Clear;
  edGA_CODAREAFAX.Clear;
  edGA_FAX.Clear;
  edGA_DIRELECTRONICA.Clear;
end;

function TfrmManAGA_GESTORAUMENTO.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ga_id',    sdqConsulta.FieldByName('ga_id').AsInteger);
    Sql.Fields.Add('ga_fechabaja', exDateTime);
    Sql.Fields.Add('ga_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('ga_id', 'AFI.SEQ_AGA_ID.NEXTVAL');
      Sql.Fields.Add('ga_fechaalta',        exDateTime);
      Sql.Fields.Add('ga_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ga_id',     sdqConsulta.FieldByName('ga_id').AsInteger);
      Sql.Fields.Add('ga_fechamodif', exDateTime);
      Sql.Fields.Add('ga_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('ga_cuit', edGA_CUIT.Text);
    Sql.Fields.Add('ga_nombre', edGA_NOMBRE.Text);

    with fraDomicilio do
    begin
      Sql.Fields.Add('ga_cpostal',   CodigoPostal);
      Sql.Fields.Add('ga_calle',     Calle);
      Sql.Fields.Add('ga_localidad', Localidad);

      sSql :=
        'SELECT pv_codigo' +
         ' FROM cpv_provincias' +
        ' WHERE pv_descripcion = :provincia';
      Sql.Fields.Add('ga_provincia', ValorSqlEx(sSql, [Provincia]), dtString);

      Sql.Fields.Add('ga_numero',       Numero);
      Sql.Fields.Add('ga_piso',         Piso);
      Sql.Fields.Add('ga_departamento', Departamento);
      Sql.Fields.Add('ga_cpostala',     CPA);
    end;

    Sql.Fields.Add('ga_codareatelefonos', edGA_CODAREATELEFONOS.Text);
    Sql.Fields.Add('ga_telefonos',        edGA_TELEFONOS.Text);
    Sql.Fields.Add('ga_codareafax',       edGA_CODAREAFAX.Text);
    Sql.Fields.Add('ga_fax',              edGA_FAX.Text);
    Sql.Fields.Add('ga_direlectronica',   edGA_DIRELECTRONICA.Text);
   end;

   Result := inherited DoABM;
end;

procedure TfrmManAGA_GESTORAUMENTO.LoadControls;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    edGA_ID.Text     := FieldByName('ga_id').AsString;
    edGA_NOMBRE.Text := FieldByName('ga_nombre').AsString;
    edGA_CUIT.Text   := FieldByName('ga_cuit').AsString;

    // Inhabilito el control
    edGA_NOMBRE.Color    := clBtnFace;
    edGA_NOMBRE.ReadOnly := True;

    with fraDomicilio do
    begin
      Numero       := FieldByName('ga_numero').AsString;
      Piso         := FieldByName('ga_piso').AsString;
      Departamento := FieldByName('ga_departamento').AsString;
      CPA          := FieldByName('ga_cpostala').AsString;
      CodigoPostal := FieldByName('ga_cpostal').AsString;
      Calle        := FieldByName('ga_calle').AsString;
      Localidad    := FieldByName('ga_localidad').AsString;

      if FieldByName('ga_provincia').AsString <> '' then
      begin
        sSql :=
          'SELECT pv_descripcion' +
           ' FROM cpv_provincias' +
          ' WHERE pv_codigo = :provincia';
        Provincia := ValorSqlEx(sSql, [FieldByName('ga_provincia').AsString]);
      end;
    end;
    edGA_CODAREATELEFONOS.Text := FieldByName('ga_codareatelefonos').AsString;
    edGA_TELEFONOS.Text        := FieldByName('ga_telefonos').AsString;
    edGA_CODAREAFAX.Text       := FieldByName('ga_codareafax').AsString;
    edGA_FAX.Text              := FieldByName('ga_fax').AsString;
    edGA_DIRELECTRONICA.Text   := FieldByName('ga_direlectronica').AsString;
  end;
end;

function TfrmManAGA_GESTORAUMENTO.Validar: Boolean;
begin
  Verificar((Trim(edGA_NOMBRE.Text) = ''), edGA_NOMBRE, 'El nombre es obligatorio.');
  Verificar((edGA_CUIT.Text <> '') and (not IsCuit(edGA_CUIT.Text)), edGA_CUIT, 'La C.U.I.T. es incorrecta.');
  Verificar((Trim(edGA_DIRELECTRONICA.Text) <> '') and not IsEMail( edGA_DIRELECTRONICA.Text ), edGA_DIRELECTRONICA, 'El e-Mail es incorrecto.');

  Result := True;
end;

procedure TfrmManAGA_GESTORAUMENTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuManGestorDeAumento.Enabled := True;
end;

procedure TfrmManAGA_GESTORAUMENTO.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;

procedure TfrmManAGA_GESTORAUMENTO.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'aga_gestoraumento';
  FieldBaja     := 'ga_fechabaja';
end;

end.
