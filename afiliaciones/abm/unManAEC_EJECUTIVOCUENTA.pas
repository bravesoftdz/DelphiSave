unit unManAEC_EJECUTIVOCUENTA;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   06-01-2003
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  Mask, unFraDomicilioTrab, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario;

type
  TfrmManAEC_EJECUTIVOCUENTA = class(TfrmCustomGridABM)
    Label4: TLabel;
    edEC_ID: TEdit;
    edEC_NOMBRE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edEC_CODAREATELEFONOS: TIntEdit;
    edEC_TELEFONOS: TPatternEdit;
    Label3: TLabel;
    edEC_CODAREAFAX: TIntEdit;
    edEC_FAX: TPatternEdit;
    fraDomicilio: TfraDomicilio;
    fraUsuarioEC: TfraUsuarios;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure PrintResults; override;
  public
  end;

var
  frmManAEC_EJECUTIVOCUENTA: TfrmManAEC_EJECUTIVOCUENTA;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs;

{$R *.DFM}

procedure TfrmManAEC_EJECUTIVOCUENTA.ClearControls;
begin
  edEC_ID.Clear;
  edEC_NOMBRE.Clear;

  // Habilito el control
  edEC_NOMBRE.ReadOnly := False;
  edEC_NOMBRE.Color    := clWindow;

  fraDomicilio.Clear;
  edEC_CODAREATELEFONOS.Clear;
  edEC_TELEFONOS.Clear;
  edEC_CODAREAFAX.Clear;
  edEC_FAX.Clear;
  fraUsuarioEC.Clear;
end;

function TfrmManAEC_EJECUTIVOCUENTA.DoABM: Boolean;
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
    Sql.Fields.Add('ec_usuario',          fraUsuarioEC.Value);
  end;

   Result := inherited DoABM;
end;

procedure TfrmManAEC_EJECUTIVOCUENTA.LoadControls;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    edEC_ID.Text     := FieldByName('ec_id').AsString;
    edEC_NOMBRE.Text := FieldByName('ec_nombre').AsString;

    // Inhabilito el control
    edEC_NOMBRE.Color    := clBtnFace;
    edEC_NOMBRE.ReadOnly := True;

    with fraDomicilio do
    begin
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

      Numero       := FieldByName('ec_numero').AsString;
      Piso         := FieldByName('ec_piso').AsString;
      Departamento := FieldByName('ec_departamento').AsString;
      CPA          := FieldByName('ec_cpostala').AsString;
    end;

    edEC_CODAREATELEFONOS.Text := FieldByName('ec_codareatelefonos').AsString;
    edEC_TELEFONOS.Text        := FieldByName('ec_telefonos').AsString;
    edEC_CODAREAFAX.Text       := FieldByName('ec_codareafax').AsString;
    edEC_FAX.Text              := FieldByName('ec_fax').AsString;
    fraUsuarioEC.Value         := FieldByName('ec_usuario').AsString;
  end;
end;

function TfrmManAEC_EJECUTIVOCUENTA.Validar: Boolean;
begin
  Result := False;

  if Trim(edEC_NOMBRE.Text) = '' then
    InvalidMsg(edEC_NOMBRE, 'El nombre es obligatorio.')
  else
    Result := fraDomicilio.IsValid;
end;

procedure TfrmManAEC_EJECUTIVOCUENTA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuManEjecutivoDeCuenta.Enabled := True;
end;

procedure TfrmManAEC_EJECUTIVOCUENTA.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

procedure TfrmManAEC_EJECUTIVOCUENTA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'aec_ejecutivocuenta';
  FieldBaja     := 'ec_fechabaja';
end;

end.
