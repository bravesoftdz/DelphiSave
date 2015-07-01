unit unManPrestadorUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unfraUsuarios, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraPrestador, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, RxPlacemnt;

type
  TfrmManPrestadorUsuario = class(TfrmCustomGridABM)
    gbPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    gbUsuario: TGroupBox;
    fraUsuario: TfraUsuario;
    GroupBox1: TGroupBox;
    fraPrestadorFiltro: TfraPrestador;
    GroupBox2: TGroupBox;
    fraUsuarioFiltro: TfraUsuario;
    rgVerBajas: TRadioGroup;
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
  frmManPrestadorUsuario: TfrmManPrestadorUsuario;

implementation

uses unFraEmpresa, undmprincipal, customdlgs, ansisql, unCustomConsulta,
  unPrincipal, sqlfuncs;

{$R *.dfm}


procedure TfrmManPrestadorUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'art.CPU_PRESTADORUSUARIO';
  FieldBaja := 'PU_FECHABAJA';
  fraPrestador.ShowBajas := false;
  fraUsuario.ShowBajas := false;
  fraUsuarioFiltro.ShowBajas := true;
  fraPrestadorFiltro.ShowBajas := true;
  fraUsuario.UsuariosGenericos := false;
  fraUsuarioFiltro.UsuariosGenericos := false;
end;

procedure TfrmManPrestadorUsuario.ClearControls;
begin
  inherited;
  fraPrestador.Clear;
  fraUsuario.Clear;
end;

procedure TfrmManPrestadorUsuario.LoadControls;
begin
  inherited;
  //fraPrestador.IDPrestador := sdqConsulta.FieldByName('PU_IDPRESTADOR').AsInteger;
  //fraUsuario.edCodigo.Text := sdqConsulta.FieldByName('PU_USUARIO').AsString;
  fraUsuario.Cargar(sdqConsulta.FieldByName('PU_USUARIO').AsString);
  fraPrestador.Cargar(sdqConsulta.FieldByName('PU_IDPRESTADOR').AsInteger);
end;


function TfrmManPrestadorUsuario.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      proxID := GetSecNextVal('ART.SEQ_CPU_ID');
      Sql.PrimaryKey.Add('PU_ID', proxID);
      Sql.Fields.Add('PU_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PU_USUARIO', fraUsuario.edCodigo.Text);
      Sql.Fields.Add('PU_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PU_FECHAALTA', exDateTime);
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('PU_ID', sdqConsulta.FieldByName('PU_ID').AsString);
      if (not sdqConsulta.FieldByName('PU_FECHABAJA').IsNull) and
       MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
              '¿Desea reactivar el registro?') then
      begin
        Sql.Fields.Add('PU_USUBAJA', '');
        Sql.Fields.Add('PU_FECHABAJA', '');
      end;
      Sql.Fields.Add('PU_IDPRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('PU_USUARIO', fraUsuario.edCodigo.Text);
      Sql.SqlType := stUpdate;
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('PU_ID', sdqConsulta.FieldByName('PU_ID').AsString);
      Sql.Fields.Add('PU_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('PU_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmManPrestadorUsuario.Validar: boolean;
var ssql, sSqlStandard: string;
begin
  verificar(fraPrestador.IsEmpty, fraPrestador, 'Debe seleccionar un prestador');
  verificar(fraUsuario.IsEmpty, fraUsuario, 'Debe seleccionar un usuario');

  if (ModoABM = maAlta) then //or ((ModoABM = maModificacion) and (sdqConsulta.FieldByName('es_fechabaja').AsString <> '')) then
  begin
    sSqlStandard := ' select 1 from art.cpu_prestadorusuario ' +
                     ' where pu_idprestador = ' + SqlInt(fraPrestador.IDPrestador);

    // Validacion nueva por ticket 62735
    ssql := sSqlStandard + ' and pu_fechabaja is null ';
    Verificar (ExisteSql(sSql), fraPrestador, 'El Prestador ya se encuentra asociado a un usuario.');

    ssql := sSqlStandard + ' and pu_usuario = :usu and pu_fechabaja is not null ';
    verificar(ExisteSqlEx(ssql, [fraUsuario.edCodigo.Text]), fraUsuario, 'La relación Usuario - Prestador ya existe, pero esta dada de baja.' +
                                                                         #13#10 + 'Debe modificar el registro para reactivarla.');
  end;

  result := true;
end;

procedure TfrmManPrestadorUsuario.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := 'SELECT PU_IDPRESTADOR, ART.UTILES.ARMAR_CUIT (CA_CLAVE) CUIT, CA_DESCRIPCION PRESTADOR, PU_USUARIO,' +
          '       PU_USUALTA, PU_FECHAALTA, PU_USUBAJA, PU_FECHABAJA, PU_ID' +
          '  FROM ART.CPU_PRESTADORUSUARIO, ART.CPR_PRESTADOR' +
          ' WHERE PU_IDPRESTADOR = CA_IDENTIFICADOR' ;

  if not fraPrestadorFiltro.IsEmpty then
    ssql := ssql + ' AND pu_idprestador = ' + sqlint(fraPrestadorFiltro.IDPrestador);

  if not fraUsuarioFiltro.IsEmpty then
    ssql := ssql + ' AND pu_usuario = ' + sqlvalue(fraUsuarioFiltro.edCodigo.Text);

  if rgVerBajas.ItemIndex = 1 then
    ssql := ssql + ' AND pu_fechabaja IS NULL ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmManPrestadorUsuario.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraUsuarioFiltro.Clear;
  fraPrestadorFiltro.clear;
  rgVerBajas.ItemIndex := 0;
end;

end.
