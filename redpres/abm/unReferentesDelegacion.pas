unit unReferentesDelegacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unfraUsuarios, vclextra, undmprincipal,
  general, sqlfuncs, customdlgs, unFraUsuario;

type
  TfrmReferentesDel = class(TfrmCustomGridABM)
    gbDelegacion: TGroupBox;
    fraDelegacionFiltro: TfraDelegacion;
    fraDelegacionABM: TfraDelegacion;
    lblDelegacion: TLabel;
    lblUsuario: TLabel;
    fraUsuarios: TfraUsuarios;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    fraTipoReferente: TfraCodigoDescripcion;
    fraTipoReferenteFiltro: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReferentesDel: TfrmReferentesDel;

implementation

uses unCustomConsulta, unPrincipal;

{$R *.dfm}

procedure TfrmReferentesDel.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'ART.RDE_REFERENTESDELEGACION';
  ShowActived := false;
  FieldBaja := 'DE_FECHABAJA';
  fraUsuarios.ShowBajas := false;
  fraUsuarios.MostrarGenericos := false;
  fraTipoReferente.TableName := 'SIN.STR_TIPOREFERENTE';
  fraTipoReferente.FieldID := 'TR_ID';
  fraTipoReferente.FieldCodigo := 'TR_CODIGO';
  fraTipoReferente.FieldDesc := 'TR_DESCRIPCION';
  fraTipoReferente.FieldBaja := 'TR_FECHABAJA';
  fraTipoReferenteFiltro.TableName := 'SIN.STR_TIPOREFERENTE';
  fraTipoReferenteFiltro.FieldID := 'TR_ID';
  fraTipoReferenteFiltro.FieldCodigo := 'TR_CODIGO';
  fraTipoReferenteFiltro.FieldDesc := 'TR_DESCRIPCION';
  fraTipoReferenteFiltro.FieldBaja := 'TR_FECHABAJA';

end;


procedure TfrmReferentesDel.ClearControls;
begin
  inherited;
  fraTipoReferente.Clear;
  fraDelegacionABM.Clear;
  fraUsuarios.Clear;
  vclextra.LockControls([fraDelegacionABM, fraUsuarios], false);
end;

procedure TfrmReferentesDel.LoadControls;
begin
  inherited;
  vclextra.LockControls([fraDelegacionABM, fraUsuarios], true);
  fraTipoReferente.Codigo := sdqConsulta.FieldByName('DE_TIPOREFERENTE').AsString;
  fraDelegacionABM.Value := sdqConsulta.FieldValues['DE_DELEGACION'];
  fraUsuarios.Value := sdqConsulta.FieldbyName('DE_REFERENTE').asstring;

end;

function TfrmReferentesDel.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  if ModoABM = maAlta Then
  begin
    proxID := GetSecNextVal('ART.SEQ_RDE_ID');
    Sql.PrimaryKey.Add('DE_ID', proxID);
    Sql.Fields.Add('DE_DELEGACION', fraDelegacionABM.Value);
    Sql.Fields.Add('DE_TIPOREFERENTE', fraTipoReferente.Codigo);
    Sql.Fields.Add('DE_REFERENTE', fraUsuarios.Value);
    Sql.Fields.Add('DE_USUALTA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('DE_FECHAALTA', exDateTime);
  end
  else
  begin
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('DE_ID', sdqConsulta.FieldByName('DE_ID').AsString);
      Sql.Fields.Add('DE_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('DE_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.PrimaryKey.Add('DE_ID', sdqConsulta.FieldByName('DE_ID').AsString);
      Sql.Fields.Add('DE_TIPOREFERENTE', fraTipoReferente.Codigo);
      Sql.Fields.Add('DE_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('DE_FECHAMODIF', exDateTime);
    end;
  end;
  result := inherited DoABM;
end;

function TfrmReferentesDel.Validar: boolean;
begin
  verificar(fraDelegacionABM.IsEmpty, fraDelegacionABM, 'Debe seleccionar una delegación');
  verificar(fraUsuarios.IsEmpty, fraUsuarios, 'Debe seleccionar un usuario');
  verificar(fraTipoReferente.IsEmpty, fraTipoReferente, 'Debe seleccionar un tipo de referente');
  result := true;
end;

procedure TfrmReferentesDel.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT DE_ID, DE_DELEGACION, EL_NOMBRE, DE_TIPOREFERENTE, DE_REFERENTE, DE_FECHABAJA ' +
            ' FROM ART.RDE_REFERENTESDELEGACION, ART.DEL_DELEGACION, SIN.STR_TIPOREFERENTE ' +
           ' WHERE DE_FECHABAJA IS NULL AND TR_FECHABAJA IS NULL ' +
             ' AND DE_DELEGACION = EL_ID AND DE_TIPOREFERENTE = TR_CODIGO ';

  if not fraDelegacionFiltro.IsEmpty then
    ssql := ssql + ' AND DE_DELEGACION = ' + fraDelegacionFiltro.Value;
    
  if not fraTipoReferenteFiltro.IsEmpty then
    ssql := ssql + ' AND DE_TIPOREFERENTE = ' + QuotedStr(fraTipoReferenteFiltro.Codigo);

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
  
end;

procedure TfrmReferentesDel.fpAbmShow(Sender: TObject);
begin
  inherited;
  fraDelegacionABM.edCodigo.SetFocus;
end;

procedure TfrmReferentesDel.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTipoReferenteFiltro.Clear;
  fraDelegacionFiltro.Clear;
end;

end.
