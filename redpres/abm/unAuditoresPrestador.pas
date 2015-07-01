unit unAuditoresPrestador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unFraCodigoDescripcion, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unfraPrestador, StdCtrls, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, undmprincipal,
  general, sqlfuncs, customdlgs, ansisql;

type
  TfrmAuditoresPorPrestador = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraAuditor: TfraCodigoDescripcion;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    fraAuditorFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    fraPrestadorFiltro: TfraPrestador;
    fraPrestador: TfraPrestador;
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
  frmAuditoresPorPrestador: TfrmAuditoresPorPrestador;

implementation

uses unFraEmpresa, unPrincipal, unCustomConsulta;

{$R *.dfm}

procedure TfrmAuditoresPorPrestador.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.SAP_AUDITORESPORPRESTADOR';
  FieldBaja := 'AP_FECHABAJA';

  with fraAuditor do
  begin
    TableName   := 'art.mau_auditores';
    FieldID     := 'au_auditor';
    FieldCodigo := 'au_auditor';
    FieldDesc   := 'au_nombre';
    FieldBaja   := 'au_fbaja';
    ShowBajas   := False;
  end;

  with fraAuditorFiltro do
  begin
    TableName   := 'art.mau_auditores';
    FieldID     := 'au_auditor';
    FieldCodigo := 'au_auditor';
    FieldDesc   := 'au_nombre';
    FieldBaja   := 'au_fbaja';
    ShowBajas   := False;
  end;
end;

procedure TfrmAuditoresPorPrestador.ClearControls;
begin
  inherited;
  fraPrestador.Clear;
  fraAuditor.Clear;
end;

procedure TfrmAuditoresPorPrestador.LoadControls;
begin
  inherited;
  //vclextra.LockControls([fraDelegacionABM, fraUsuarios], true);
  fraAuditor.Codigo := sdqConsulta.FieldByName('ap_auditor').AsString;
  fraPrestador.IDPrestador := sdqConsulta.FieldByName('ap_prestador').AsInteger;
end;


function TfrmAuditoresPorPrestador.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      proxID := GetSecNextVal('SIN.seq_sap_pk');
      Sql.PrimaryKey.Add('AP_ID', proxID);
      Sql.Fields.Add('AP_PRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('AP_AUDITOR', fraAuditor.Codigo);
      Sql.Fields.Add('AP_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AP_FECHAALTA', exDateTime);
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('AP_ID', sdqConsulta.FieldByName('AP_ID').AsString);
      if (not sdqConsulta.FieldByName('AP_FECHABAJA').IsNull) and
       MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
              '¿Desea reactivar el registro?') then
      begin
        Sql.Fields.Add('AP_USUBAJA', '');
        Sql.Fields.Add('AP_FECHABAJA', '');
      end;
      Sql.Fields.Add('AP_PRESTADOR', fraPrestador.IDPrestador);
      Sql.Fields.Add('AP_AUDITOR', fraAuditor.Codigo);
      Sql.Fields.Add('AP_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AP_FECHAMODIF', exDateTime);
      Sql.SqlType := stUpdate;
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('AP_ID', sdqConsulta.FieldByName('AP_ID').AsString);
      Sql.Fields.Add('AP_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AP_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmAuditoresPorPrestador.Validar: boolean;
var ssql: string;
begin
  verificar(fraPrestador.IsEmpty, fraPrestador, 'Debe seleccionar un prestador para asociar');
  verificar(fraAuditor.IsEmpty, fraAuditor, 'Debe seleccionar un auditor');

  //if (ModoABM = maAlta) or ((ModoABM = maModificacion) and (sdqConsulta.FieldByName('ap_fechabaja').AsString <> '')) then
  //begin

    ssql := 'SELECT 1' +
            '  FROM SIN.sap_auditoresporprestador' +
            ' WHERE ap_prestador = :idpres' +
            '   AND ap_auditor = :aud and ap_fechabaja IS NULL';

    verificar(ExisteSqlEx(ssql, [fraPrestador.IDPrestador, fraAuditor.Codigo]), fraPrestador, 'Auditor existente para ese prestador');
  //end;

  result := true;
end;

procedure TfrmAuditoresPorPrestador.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := 'SELECT AP_ID, AP_PRESTADOR, AP_AUDITOR, AU_NOMBRE, CA_DESCRIPCION, AP_FECHAALTA, AP_USUALTA, AP_FECHAMODIF,' +
          '       AP_USUMODIF, AP_FECHABAJA, AP_USUBAJA' +
          '  FROM SIN.SAP_AUDITORESPORPRESTADOR, ART.MAU_AUDITORES, ART.CPR_PRESTADOR' +
          ' WHERE AU_AUDITOR = AP_AUDITOR' +
          '   AND CA_IDENTIFICADOR = AP_PRESTADOR';


  if not fraPrestadorFiltro.IsEmpty then
    ssql := ssql + ' AND ap_prestador = ' + sqlint(fraPrestadorFiltro.IDPrestador);

  if not fraAuditorFiltro.IsEmpty then
    ssql := ssql + ' AND ap_auditor = ' + sqlvalue(fraAuditorFiltro.Codigo);

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmAuditoresPorPrestador.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPrestadorFiltro.Clear;
  fraAuditorFiltro.clear;
end;


end.
