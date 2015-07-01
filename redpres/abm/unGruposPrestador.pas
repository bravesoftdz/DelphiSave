unit unGruposPrestador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, PatternEdit, IntEdit;

type
  TfrmGruposPrestador = class(TfrmCustomGridABM)
    edCodigo: TIntEdit;
    Label1: TLabel;
    edDescripcion: TEdit;
    Label2: TLabel;
    ShortCutControl1: TShortCutControl;
    sdqConsultaGP_ID: TFloatField;
    sdqConsultaGP_CODIGO: TStringField;
    sdqConsultaGP_DESCRIPCION: TStringField;
    sdqConsultaGP_USUBAJA: TStringField;
    sdqConsultaGP_FECHABAJA: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGruposPrestador: TfrmGruposPrestador;

implementation

{$R *.dfm}

uses CustomDlgs, unDmPrincipal, VCLExtra, unUsuariosPorGrupo, unPrincipal,
  SqlFuncs;

procedure TfrmGruposPrestador.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.sgp_gruposprestador';
  FieldBaja := 'GP_FECHABAJA';

end;

procedure TfrmGruposPrestador.fpAbmShow(Sender: TObject);
begin
  inherited;
  if ModoABM = maModificacion then
    vclextra.LockControl(edCodigo)
  else
    vclextra.LockControl(edCodigo, False)
end;

procedure TfrmGruposPrestador.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
end;

procedure TfrmGruposPrestador.LoadControls;
begin
  inherited;
  //vclextra.LockControls([fraDelegacionABM, fraUsuarios], true);
  edCodigo.Text := sdqConsulta.FieldByName('gp_codigo').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('gp_descripcion').AsString;
end;


function TfrmGruposPrestador.DoABM: boolean;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      //proxID := GetSecNextVal('SIN.seq_sap_pk');
      //Sql.PrimaryKey.Add('AP_ID', proxID);
      Sql.Fields.Add('GP_CODIGO', edCodigo.Text);
      Sql.Fields.Add('GP_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('GP_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GP_FECHAALTA', exDateTime);
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('GP_ID', sdqConsulta.FieldByName('GP_ID').AsString);
      if (not sdqConsulta.FieldByName('GP_FECHABAJA').IsNull) and
       MsgAsk('Va a modificar un registro dado de baja, al modificarlo se reactivará.' + #13 +
              '¿Desea seguír?') then
      begin
        Sql.Fields.Add('GP_USUBAJA', '');
        Sql.Fields.Add('GP_FECHABAJA', '');
      end;
      Sql.Fields.Add('GP_CODIGO', edCodigo.Text);
      Sql.Fields.Add('GP_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('GP_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GP_FECHAMODIF', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('GP_ID', sdqConsulta.FieldByName('GP_ID').AsString);
      Sql.Fields.Add('GP_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('GP_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmGruposPrestador.Validar: boolean;
var ssql, iId: string;
begin
  Verificar(edCodigo.IsEmpty, edCodigo, 'Debe seleccionar un prestador para asociar');
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe seleccionar un auditor');

  ssql := 'SELECT gp_id' +
          '  FROM SIN.sgp_gruposprestador ' +
          ' WHERE gp_codigo = :cod ';
//            '   AND gp_fechabaja IS NULL';
  iId := ValorSqlEx(ssql, [edCodigo.Text]);

  //verificar(ExisteSqlEx(ssql, [edCodigo.Text]), edCodigo, 'Código existente. Si el registro está dado de baja pulse ''Modificar'' para reactivarlo');

  verificar((ModoABM = maAlta) and (iId <> '') or ((ModoABM = maModificacion) and
            (iId <> sdqConsulta.FieldByName('gp_id').AsString)), edCodigo,
            'Código existente. Si el registro está dado de baja pulse ''Modificar'' para reactivarlo');

  result := true;
end;

procedure TfrmGruposPrestador.tbPropiedadesClick(Sender: TObject);
//var formUsu: TfrmUsuariosPorGrupo;
begin
  try
    TfrmUsuariosPorGrupo.Create(self)
  finally
    //formUsu.Free;
  end;

end;

procedure TfrmGruposPrestador.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' select gp_id, gp_codigo, gp_descripcion, gp_usubaja, gp_fechabaja ' +
          '   from SIN.sgp_gruposprestador ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

end.
