unit unManPrestadoresPorGTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraPrestador,
  unFraGrupoTrabajo;

type
  TfrmPrestadoresPorGtrabajo = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraPrestador: TfraPrestador;
    GroupBox2: TGroupBox;
    fraGTrabajo: TfraCodigoDescripcion;
    GroupBox3: TGroupBox;
    fraPrestadorFiltro: TfraPrestador;
    GroupBox4: TGroupBox;
    fraGTrabajoFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrestadoresPorGtrabajo: TfrmPrestadoresPorGtrabajo;

implementation

uses unPrincipal, undmprincipal, ansisql, SQLfuncs, customdlgs;

{$R *.dfm}

procedure TfrmPrestadoresPorGtrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.spg_prestadoresxgrupo';
  FieldBaja := 'PG_FECHABAJA';
  //fraEmpresa.ShowBajas := true;   //49924

  with fraGTrabajo do
  begin
    TableName := 'art.mgp_gtrabajo';
    FieldID := 'gp_codigo';
    FieldCodigo := 'gp_codigo';
    FieldDesc := 'gp_nombre';
    FieldBaja := 'gp_fbaja';
    ShowBajas := false;
  end;

  with fraGTrabajoFiltro do
  begin
    TableName := 'art.mgp_gtrabajo';
    FieldID := 'gp_codigo';
    FieldCodigo := 'gp_codigo';
    FieldDesc := 'gp_nombre';
    FieldBaja := 'gp_fbaja';
    ShowBajas := false;
  end;
end;

procedure TfrmPrestadoresPorGtrabajo.ClearControls;
begin
  inherited;
  fraPrestador.Clear;
  fraGTrabajo.Clear;
end;

procedure TfrmPrestadoresPorGtrabajo.LoadControls;
begin
  inherited;
  //vclextra.LockControls([fraDelegacionABM, fraUsuarios], true);
  //fraEmpresa.ID := sdqConsulta.FieldByName('es_idempresa').Asinteger;
  //fraPrestadora.Codigo := sdqConsulta.FieldByName('es_idprestadora').AsString;  // Ticket JBruno
end;


function TfrmPrestadoresPorGtrabajo.DoABM: boolean;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      //proxID := GetSecNextVal('sin.seq_spg_idpres');
      //Sql.PrimaryKey.Add('PG_ID', proxID);
      Sql.Fields.Add('PG_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PG_CODGRUPO', fraGTrabajo.Codigo);
      Sql.Fields.Add('PG_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PG_FECHAALTA', exDateTime);
    end;
    {maModificacion:
    begin
      Sql.PrimaryKey.Add('PG_ID', sdqConsulta.FieldByName('ES_ID').AsString);
      if (not sdqConsulta.FieldByName('PG_FECHABAJA').IsNull) and
       MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
              '¿Desea reactivar el registro?') then
      begin
        Sql.Fields.Add('PG_USUBAJA', '');
        Sql.Fields.Add('PG_FECHABAJA', '');
      end;
      Sql.Fields.Add('PG_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PG_CODGRUPO', fraGTrabajo.Codigo);
      Sql.Fields.Add('PG_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PG_FECHAMODIF', exDateTime);
      Sql.SqlType := stUpdate;
    end;}
    maBaja:
    begin
      Sql.PrimaryKey.Add('PG_ID', sdqConsulta.FieldByName('PG_ID').AsString);
      Sql.Fields.Add('PG_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PG_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmPrestadoresPorGtrabajo.Validar: boolean;
var ssql: string;
begin
  verificar(fraPrestador.IsEmpty, fraPrestador, 'Debe seleccionar una prestador');
  verificar(fraGTrabajo.IsEmpty, fraGTrabajo, 'Debe seleccionar un grupo de trabajo');

  if ModoABM = maAlta then
  begin
    ssql := ' select 1 from SIN.spg_prestadoresxgrupo ' +
            ' where pg_codgrupo = :cod and pg_idprestador = :idpres and pg_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [fraGTrabajo.Value, fraPrestador.IDPrestador]), fraPrestador, 'Prestador/grupo de trabajo ya existente');
  end;

  result := true;
end;

procedure TfrmPrestadoresPorGtrabajo.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' select pg_id, pg_codgrupo, gp_nombre, pg_idprestador, ca_descripcion, pg_fechabaja, PG_FECHAALTA, pg_usualta ' +
            ' from SIN.spg_prestadoresxgrupo, mgp_gtrabajo, cpr_prestador ' +
           ' where pg_codgrupo = gp_codigo and pg_idprestador = ca_identificador ';


  if not fraPrestadorFiltro.IsEmpty then
    ssql := ssql + ' AND pg_idprestador = ' + SqlInt(fraPrestadorFiltro.IDPrestador);

  if not fraGTrabajoFiltro.IsEmpty then
    ssql := ssql + ' AND pg_codgrupo = ' + SqlValue(fraGTrabajoFiltro.Codigo);


  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmPrestadoresPorGtrabajo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPrestadorFiltro.Clear;
  fraGTrabajoFiltro.Clear;
end;


end.
