unit unManIAS_ASESOREMISION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unArtFrame;

type
  TfrmManIAS_ASESOREMISION = class(TfrmCustomGridABM)
    Label1: TLabel;
    edAS_NOMBRE: TEdit;
    edAS_INTERNO: TPatternEdit;
    Label5: TLabel;
    Label2: TLabel;
    edAS_MAIL: TEdit;
    rgTipo: TRadioGroup;
    fraAS_USUARIO: TfraUsuarios;
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManIAS_ASESOREMISION: TfrmManIAS_ASESOREMISION;

implementation

uses
  unSesion, SqlFuncs, CustomDlgs, General, AnsiSql, unDmPrincipal;

{$R *.DFM}

procedure TfrmManIAS_ASESOREMISION.ClearControls;
begin
  rgTipo.ItemIndex := -1;
  fraAS_USUARIO.Clear;
  edAS_NOMBRE.Clear;
  edAS_INTERNO.Clear;
  edAS_MAIL.Clear;
end;

function TfrmManIAS_ASESOREMISION.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('AS_ID',    sdqConsulta.FieldByName('AS_ID').AsInteger);
    Sql.Fields.Add('AS_FECHABAJA', exDate);
    Sql.Fields.Add('AS_USUBAJA',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddExpression('AS_ID', 'SEQ_IAS_ID.NEXTVAL');
      Sql.Fields.Add('AS_FECHAALTA',        exDate);
      Sql.Fields.Add('AS_USUALTA',          Sesion.UserID);
      Sql.SqlType := stInsert;
    end
    else if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('AS_ID',     sdqConsulta.FieldByName('AS_ID').AsInteger);
      Sql.Fields.Add('AS_FECHAMODIF', exDate);
      Sql.Fields.Add('AS_USUMODIF',   Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('AS_USUARIO',  fraAS_USUARIO.Value);
    Sql.Fields.Add('AS_NOMBRE',  String(Iif(rgTipo.ItemIndex = 0, UpperCase(fraAS_USUARIO.cmbDescripcion.Text), edAS_NOMBRE.Text)));
    Sql.Fields.Add('AS_INTERNO', edAS_INTERNO.Text);
    Sql.Fields.Add('AS_MAIL',    edAS_MAIL.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManIAS_ASESOREMISION.LoadControls;
begin
  if sdqConsulta.FieldByName('AS_USUARIO').AsString <> '' then
    rgTipo.ItemIndex := 0    // interno
  else
    rgTipo.ItemIndex := 1;   // externo

  rgTipoClick(nil);

  fraAS_USUARIO.Value := sdqConsulta.FieldByName('AS_USUARIO').AsString;
  edAS_NOMBRE.Text    := sdqConsulta.FieldByName('AS_NOMBRE').AsString;
  edAS_INTERNO.Text   := sdqConsulta.FieldByName('AS_INTERNO').AsString;
  edAS_MAIL.Text      := sdqConsulta.FieldByName('AS_MAIL').AsString;
end;

function TfrmManIAS_ASESOREMISION.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(rgTipo.ItemIndex = -1, rgTipo, 'Debe indicar el tipo de asesor.');
  Verificar((rgTipo.ItemIndex = 0) and fraAS_USUARIO.IsEmpty, fraAS_USUARIO, 'El asesor es obligatorio.');
  Verificar((rgTipo.ItemIndex = 1) and (Trim(edAS_NOMBRE.Text) = ''), edAS_NOMBRE, 'El nombre del asesor es obligatorio.');
  Verificar(Trim(edAS_INTERNO.Text) = '', edAS_INTERNO, 'El nro. de interno es obligatorio.');
  Verificar(Trim(edAS_MAIL.Text) = '', edAS_MAIL, 'La dirección de correo es obligatoria.');

  if rgTipo.ItemIndex = 0 then
    begin
      sSql := 'SELECT 1 ' +
                'FROM IAS_ASESOREMISION ' +
               'WHERE AS_USUARIO=:Usuario ' +
                 'AND AS_FECHABAJA IS NULL ' +
                 Iif(ModoABM = maModificacion, 'AND AS_ID <> ' + SqlValue(sdqConsulta.FieldByName('AS_ID').AsInteger), '');

      Verificar(ExisteSqlEx(sSql, [fraAS_USUARIO.Value]), fraAS_USUARIO, 'El asesor ya existe.');
    end;

  Result := True;
end;

procedure TfrmManIAS_ASESOREMISION.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'IAS_ASESOREMISION';
  FieldBaja     := 'AS_FECHABAJA';

  fraAS_USUARIO.Sector := 'EMI';
end;

procedure TfrmManIAS_ASESOREMISION.rgTipoClick(Sender: TObject);
var
  bHabilitarInt: Boolean;
begin
  bHabilitarInt := (rgTipo.ItemIndex = 0);    // interno

  fraAS_USUARIO.Visible := bHabilitarInt;
  edAS_NOMBRE.Visible   := not bHabilitarInt;

  fraAS_USUARIO.Clear;
  edAS_NOMBRE.Clear;
end;

end.

