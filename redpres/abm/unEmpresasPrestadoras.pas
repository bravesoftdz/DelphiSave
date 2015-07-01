unit unEmpresasPrestadoras;

interface
                                                                       
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unfraUsuarios, vclextra, undmprincipal,
  general, sqlfuncs, customdlgs, unfraempresa, unArtDbFrame, ansisql;

type
  TfrmEmpresasPrestadoras = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraPrestadora: TfraCodigoDescripcion;
    GroupBox3: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    GroupBox4: TGroupBox;
    fraPrestadoraFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    rgEmpBaja: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresasPrestadoras: TfrmEmpresasPrestadoras;

implementation

uses unPrincipal, unCustomConsulta;

{$R *.dfm}


procedure TfrmEmpresasPrestadoras.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'art.aes_empresaservicio';
  FieldBaja := 'ES_FECHABAJA';
  fraEmpresa.ShowBajas := true;   //49924

  with fraPrestadora do
  begin
    TableName := 'art.aep_empresaprestadora';
    FieldID := 'ep_id';
    FieldCodigo := 'ep_codigo';
    FieldDesc := 'ep_descripcion';
  end;

  with fraPrestadoraFiltro do
  begin
    TableName := 'art.aep_empresaprestadora';
    FieldID := 'ep_id';
    FieldCodigo := 'ep_codigo';
    FieldDesc := 'ep_descripcion';
  end;
end;

procedure TfrmEmpresasPrestadoras.ClearControls;
begin
  inherited;
  fraPrestadora.Clear;
  fraEmpresa.Clear;
end;

procedure TfrmEmpresasPrestadoras.LoadControls;
begin
  inherited;
  //vclextra.LockControls([fraDelegacionABM, fraUsuarios], true);
  fraEmpresa.ID := sdqConsulta.FieldByName('es_idempresa').Asinteger;
  fraPrestadora.Codigo := sdqConsulta.FieldByName('es_idprestadora').AsString;  // Ticket JBruno
end;


function TfrmEmpresasPrestadoras.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      proxID := GetSecNextVal('ART.SEQ_AESEM_ID');
      Sql.PrimaryKey.Add('ES_ID', proxID);
      Sql.Fields.Add('ES_IDEMPRESA', fraEmpresa.Value);
      Sql.Fields.Add('ES_IDPRESTADORA', fraPrestadora.ID);
      Sql.Fields.Add('ES_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ES_FECHAALTA', exDateTime);
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsString);
      if (not sdqConsulta.FieldByName('ES_FECHABAJA').IsNull) and
       MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
              '¿Desea reactivar el registro?') then
      begin
        Sql.Fields.Add('ES_USUBAJA', '');
        Sql.Fields.Add('ES_FECHABAJA', '');
      end;
      Sql.Fields.Add('ES_IDEMPRESA', fraEmpresa.Value);
      Sql.Fields.Add('ES_IDPRESTADORA', fraPrestadora.ID);
      Sql.Fields.Add('ES_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ES_FECHAMODIF', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsString);
      Sql.Fields.Add('ES_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ES_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmEmpresasPrestadoras.Validar: boolean;
var ssql: string;
begin
  verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe seleccionar una empresa');
  verificar(fraPrestadora.IsEmpty, fraPrestadora, 'Debe seleccionar una prestadora para asociar');

  if (ModoABM = maAlta) or ((ModoABM = maModificacion) and (sdqConsulta.FieldByName('es_fechabaja').AsString <> '')) then
  begin
    {ssql := ' select 1 from art.aes_empresaservicio ' +
            ' where es_idprestadora = :prest and es_idempresa = :emp and es_fechabaja is null ';
    verificar(ExisteSqlEx(ssql, [fraEmpresa.CUIT]), fraEmpresa, 'La prestadora ya está asociada a la empresa');}

    ssql := ' select 1 from art.aes_empresaservicio, afi.aem_empresa ' +
            ' where es_idempresa = em_id and em_cuit = :emp and es_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [fraEmpresa.CUIT]), fraEmpresa, 'La CUIT ya está asociada a una prestadora');
  end;

  result := true;
end;

procedure TfrmEmpresasPrestadoras.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' SELECT es_id, es_idempresa, es_idprestadora, ep_descripcion, ' +
                 ' es_fechabaja, em_nombre, em_cuit ' +
           '  FROM art.aes_empresaservicio, art.aep_empresaprestadora, afi.aem_empresa ' +
           ' WHERE es_idprestadora = ep_id and em_id = es_idempresa ';


  if not fraPrestadoraFiltro.IsEmpty then
    ssql := ssql + ' AND es_idprestadora = ' + sqlint(fraPrestadoraFiltro.ID);

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND em_cuit = ' + sqlvalue(fraEmpresaFiltro.CUIT);

  if rgEmpBaja.ItemIndex = 1 then
    ssql := ssql + ' AND es_fechabaja IS NULL ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmEmpresasPrestadoras.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraPrestadoraFiltro.clear;
  rgEmpBaja.ItemIndex := 0;
end;

procedure TfrmEmpresasPrestadoras.fpAbmBeforeShow(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ES_FECHABAJA').isNull then
  begin
    fraEmpresa.mskCUIT.Font.Color    := clRed;
    fraEmpresa.cmbRSocial.Font.color := clRed;
    fraEmpresa.edContrato.Font.Color := clRed;
    fraPrestadora.Font.Color         := clRed;
  end
  else begin
    fraEmpresa.mskCUIT.Font.Color    := clWindowText;
    fraEmpresa.cmbRSocial.Font.color := clWindowText;
    fraEmpresa.edContrato.Font.Color := clWindowText;
    fraPrestadora.Font.Color         := clWindowText;
  end;
end;

end.

