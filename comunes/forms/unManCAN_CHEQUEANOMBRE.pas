unit unManCAN_CHEQUEANOMBRE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCAN_CHEQUEANOMBRE = class(TfrmCustomGridABM)
    edAN_DESCRIPCION: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edAN_DESCEXTRA: TEdit;
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
    procedure RefreshData; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManCAN_CHEQUEANOMBRE: TfrmManCAN_CHEQUEANOMBRE;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, AnsiSql, SqlFuncs, VCLExtra,
  unCustomConsulta, General;

const
  cSECTOR_LIQUIDACIONES = 'LIQUI';  // por ticket 42504
  cSECTOR_REINTPRESTMED = 'REINTPM';

{$R *.dfm}

procedure TfrmManCAN_CHEQUEANOMBRE.ClearControls;
begin
  edAN_DESCRIPCION.Clear;
  edAN_DESCEXTRA.Clear;
end;

function TfrmManCAN_CHEQUEANOMBRE.DoABM: Boolean;
var sSector: string;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('an_id', sdqConsulta.FieldByName('an_id').AsInteger);
     Sql.Fields.Add('an_fechabaja', exDate);
     Sql.Fields.Add('an_usubaja', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.Fields.Add('an_fechaalta', exDate);
       Sql.Fields.Add('an_usualta', Sesion.UserID);

       if (Sesion.Sector = cSECTOR_LIQUIDACIONES) or (Sesion.Sector = cSECTOR_LIQUIDACIONES) then      // no lo hago con el IIF porque no me lo permite dentro del Sql.Fields.Add( ....
         sSector := 'L'
       else
         sSector := 'D';
       Sql.Fields.Add('an_areaperteneciente', sSector);  // TK 42504

       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('an_id', sdqConsulta.FieldByName('an_id').AsInteger);
       Sql.Fields.Add('an_fechamodif', exDate);
       Sql.Fields.Add('an_usumodif', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;
     Sql.Fields.Add('an_descripcion', edAN_DESCRIPCION.Text);
     Sql.Fields.Add('an_descextra', edAN_DESCEXTRA.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCAN_CHEQUEANOMBRE.LoadControls;
begin
  edAN_DESCRIPCION.Text := sdqConsulta.FieldByName('an_descripcion').AsString;
  edAN_DESCEXTRA.Text   := sdqConsulta.FieldByName('an_descextra').AsString;
end;

function TfrmManCAN_CHEQUEANOMBRE.Validar: Boolean;
begin
  Verificar(Trim(edAN_DESCRIPCION.Text) = '', edAN_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCAN_CHEQUEANOMBRE.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName      := 'can_chequeanombre';
  FieldBaja          := 'an_fechabaja';
end;

procedure TfrmManCAN_CHEQUEANOMBRE.RefreshData;
var sSql, sSqlWhere, sSectorUsu :string;
begin
  sSql := ' Select * from art.can_chequeanombre ';

  sSectorUsu := ValorSqlEx('SELECT se_sector FROM art.use_usuarios ' +       // TK 42504
                           ' WHERE se_usuario = :usu ', [Sesion.UserID]);

  if (sSectorUsu = cSECTOR_LIQUIDACIONES) or (Sesion.Sector = cSECTOR_LIQUIDACIONES) then // Si usuario del sector Liquidaciones, sólo vera los de an_areaperteneciente = 'L' (liquidaciones)
    sSqlWhere := ' AND an_areaperteneciente = ''L'' '
  else                                         // para cualquier otra area, se verá los de an_areaperteneciente = 'D' (dinerarias)
    sSqlWhere := ' AND an_areaperteneciente = ''D'' ';

  sSql := ' SELECT AN_ID, AN_DESCRIPCION, AN_DESCEXTRA, AN_FECHABAJA, AN_AREAPERTENECIENTE FROM art.can_chequeanombre ' +
           ' WHERE 1=1 ' + sSqlWhere;

  sdqConsulta.SQL.text := sSql;

  inherited RefreshData;
end;

end.
