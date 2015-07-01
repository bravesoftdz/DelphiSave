unit unPrestadorAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador;

type
  TfrmPrestadorAuditoria = class(TfrmCustomGridABM)
    gbPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    gbPrestadorFiltro: TGroupBox;
    fraPrestadorFiltro: TfraPrestador;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
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
  frmPrestadorAuditoria: TfrmPrestadorAuditoria;

implementation

uses unPrincipal, undmprincipal, sqlfuncs, customdlgs, unCustomConsulta, ansisql;

{$R *.dfm}

procedure TfrmPrestadorAuditoria.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'sin.spa_prestadoresauditoria';
  FieldBaja := 'PA_FECHABAJA';
end;

procedure TfrmPrestadorAuditoria.ClearControls;
begin
  inherited;
  fraPrestador.Clear;
end;


function TfrmPrestadorAuditoria.DoABM: boolean;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      Sql.Fields.Add('PA_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PA_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PA_FECHAALTA', exDateTime);
    end;
    {maModificacion:
    begin
      sdqConsulta.Locate('pa_idprestador', fraPrestador.IDPrestador, []);
      Sql.PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsString);
      Sql.Fields.Add('PA_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PA_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PA_FECHAALTA', exDateTime);
      Sql.Fields.Add('PA_USUBAJA', '');
      Sql.Fields.Add('PA_FECHABAJA', '');
      Sql.SqlType := stUpdate;
    end; }
    maBaja:
    begin
      Sql.PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsString);
      Sql.Fields.Add('PA_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PA_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmPrestadorAuditoria.Validar: boolean;
var ssql: string;
begin
  verificar(fraPrestador.IsEmpty, fraPrestador, 'Debe ingresar un prestador válido');

  if ModoABM = maAlta then
  begin
    ssql := ' select pa_id from sin.spa_prestadoresauditoria ' +
            ' where pa_idprestador = :id and pa_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [fraPrestador.IDPrestador]), fraprestador, 'El prestador ingresado ya existe');
  end;

  {if ExisteSqlEx(' select pa_id from sin.spa_prestadoresauditoria ' +
                 '  where pa_idprestador = :id and pa_fechabaja is not null ', [fraPrestador.IDPrestador]) then
    ModoABM := maModificacion;}

  result := true;
end;

procedure TfrmPrestadorAuditoria.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' SELECT ca_identificador, ca_clave, ca_descripcion, ca_nombrefanta, ' +
                 ' pa_fechabaja, pa_usubaja, pa_id, pa_idprestador, pa_fechaalta ' +
           '  FROM sin.spa_prestadoresauditoria, art.cpr_prestador ' +
           ' WHERE pa_idprestador = ca_identificador ';


  if not fraPrestadorFiltro.IsEmpty then
    ssql := ssql + ' AND ca_identificador = ' + sqlint(fraPrestadorFiltro.IDPrestador);


  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmPrestadorAuditoria.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPrestador.Clear;
  fraPrestadorFiltro.clear;
end;

end.
