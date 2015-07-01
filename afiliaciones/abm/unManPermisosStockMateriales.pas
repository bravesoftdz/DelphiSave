unit unManPermisosStockMateriales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraUsuarios, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, CustomDlgs;

type
  TfrmManPermisosStockMateriales = class(TfrmCustomGridABM)
    chkAlta: TCheckBox;
    chkAjuste: TCheckBox;
    chkMovEntreDepositos: TCheckBox;
    chkEntregaMateriales: TCheckBox;
    chkDevolucion: TCheckBox;
    fraDeposito: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    fraUsuarios: TfraUsuario;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSqlString;
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManPermisosStockMateriales: TfrmManPermisosStockMateriales;

implementation

uses unPrincipal, unDmPrincipal, SQLFuncs, General;
{$R *.dfm}

{ TfrmManPermisosStockMateriales }

procedure TfrmManPermisosStockMateriales.ClearControls;
begin
  inherited;
  fraUsuarios.Clear;
  fraDeposito.Clear;
  chkAlta.Checked              := False;
  chkAjuste.Checked            := False;
  chkMovEntreDepositos.Checked := False;
  chkEntregaMateriales.Checked := False;
  chkDevolucion.Checked        := False;
end;

function TfrmManPermisosStockMateriales.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aum_usuariomateriales';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('um_id',    sdqConsulta.FieldByName('um_id').AsInteger);
    Sql.Fields.Add('um_fechabaja', exDateTime);
    Sql.Fields.Add('um_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('um_fechaalta',        exDateTime);
      Sql.Fields.Add('um_usualta',          frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('um_id',     sdqConsulta.FieldByName('um_id').AsInteger);
      Sql.Fields.Add('um_fechamodif', exDateTime);
      Sql.Fields.Add('um_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;
    Sql.Fields.Add('um_usuario', fraUsuarios.UserID);
    Sql.Fields.Add('um_ideposito', fraDeposito.Value);

    Sql.Fields.Add('um_alta',       IIF(chkAlta.Checked,'S','N'), dtString);
    Sql.Fields.Add('um_ajuste',     IIF(chkAjuste.Checked,'S','N'), dtString);
    Sql.Fields.Add('um_movimiento', IIF(chkMovEntreDepositos.Checked,'S','N'), dtString);
    Sql.Fields.Add('um_entrega',    IIF(chkEntregaMateriales.Checked,'S','N'), dtString);
    Sql.Fields.Add('um_devolucion', IIF(chkDevolucion.Checked,'S','N'), dtString);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManPermisosStockMateriales.LoadControls;
begin
  inherited;
  fraUsuarios.edCodigo.Text := sdqConsulta.FieldByName('um_usuario').AsString;
  fraDeposito.Value  := sdqConsulta.FieldByName('um_ideposito').AsInteger;
  chkAlta.Checked    :=           IIF(sdqConsulta.FieldByName('um_alta').AsString = 'S',       True, False);
  chkAjuste.Checked  :=           IIF(sdqConsulta.FieldByName('um_ajuste').AsString = 'S',     True, False);
  chkMovEntreDepositos.Checked := IIF(sdqConsulta.FieldByName('um_movimiento').AsString = 'S', True, False);
  chkEntregaMateriales.Checked := IIF(sdqConsulta.FieldByName('um_entrega').AsString = 'S',    True, False);
  chkDevolucion.Checked :=        IIF(sdqConsulta.FieldByName('um_devolucion').AsString = 'S', True, False);
end;

procedure TfrmManPermisosStockMateriales.LoadSqlString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT um_id, um_usuario, um_ideposito, um_fechaalta, um_usualta, um_fechamodif, um_usumodif, um_fechabaja, um_usubaja,' +
    '       de_descripcion, um_alta, um_ajuste, um_movimiento, um_entrega, um_devolucion' +
    '   FROM afi.aum_usuariomateriales' +
    '     LEFT JOIN afi.ade_deposito ON um_ideposito = de_id';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManPermisosStockMateriales.RefreshData;
begin
  LoadSqlString;
  inherited;
end;

function TfrmManPermisosStockMateriales.Validar: Boolean;
var
  sSql : String;
begin
  Verificar(fraUsuarios.IsEmpty, fraUsuarios, 'Es necesario el nombre de usuario');
  Verificar(fraDeposito.IsEmpty, fraDeposito, 'Es necesario el depósito');
  sSql := 'SELECT 1' +
          '  FROM afi.aum_usuariomateriales' +
          ' WHERE um_usuario =:usuario' +
          '  AND um_ideposito = :depo' +
          '  AND um_fechabaja IS NULL';
  if ModoABM = maAlta then
    Verificar(ExisteSqlEx(sSql, [fraUsuarios.UserID, fraDeposito.Value]), fraUsuarios, 'Este usuario y depósito ya están definidos')
  else
    Verificar(ExisteSqlEx(sSql + ' AND um_id <> :id', [fraUsuarios.UserID, fraDeposito.Value, sdqConsulta.FieldByName('um_id').AsInteger]),
                          fraUsuarios, 'Este usuario y depósito ya están definidos');
  Result := True;

end;

procedure TfrmManPermisosStockMateriales.FormCreate(Sender: TObject);
begin
  LoadSqlString;
  inherited;
  Sql.TableName := 'afi.aum_usuariomateriales';
  FieldBaja := 'um_fechabaja';

  with fraDeposito do
  begin
    TableName   := 'afi.ade_deposito';
    FieldID     := 'de_id';
    FieldCodigo := 'de_codigo';
    FieldDesc   := 'de_descripcion';
    FieldBaja   := 'de_fechabaja';
  end;
end;

procedure TfrmManPermisosStockMateriales.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('um_fechabaja').IsNull, tbModificar, 'Este registro esta dado de baja');
  inherited;
end;

procedure TfrmManPermisosStockMateriales.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('um_fechabaja').IsNull, tbModificar, 'Este registro esta dado de baja');
  inherited;
end;

end.
