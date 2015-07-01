unit unContratosGuarda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc;

type
  TfrmContratosGuarda = class(TfrmCustomGridABM)
    sdqConsultaCampos: TSDQuery;
    dsConsultaCampos: TDataSource;
    Label9: TLabel;
    Label1: TLabel;
    edContrato: TIntEdit;
    edRazonSocial: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edContratoChange(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmContratosGuarda: TfrmContratosGuarda;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame,
  VCLExtra, General, unUtilsArchivo, unConstantArchivo, unComunesArchivo, unArt;

{$R *.dfm}

function TfrmContratosGuarda.DoABM: Boolean;
var
  sContrato: String;
  IdArchivo: TTableId;
begin
  Result := False;

  BeginTrans;
  try
    Sql.Clear;
    Sql.TableName := 'art.aga_guardaafiliacion';

    if ModoABM = maBaja then
      begin
        Sql.PrimaryKey.Add('ga_id',       sdqConsulta.FieldByName('ga_id').AsInteger, False);
        Sql.Fields.Add('ga_fechabaja',    SQL_DATETIME, False);
        Sql.Fields.Add('ga_usubaja',      Sesion.UserID);
        Sql.SqlType := stUpdate;
      end
    else if ModoABM = maAlta then
      begin
        Sql.PrimaryKey.Add('ga_id',       exNull);
        Sql.Fields.Add('ga_fechaalta',    SQL_DATETIME, False);
        Sql.Fields.Add('ga_usualta',      Sesion.UserID);
        Sql.Fields.Add('ga_fechabaja',    exNull);
        Sql.Fields.Add('ga_contrato',     edContrato.Value, True);
        Sql.Fields.Add('ga_usubaja',      exNull);
      end;

    Result := inherited DoABM;

    if ModoABM = maAlta then
      begin
        sContrato := Trim(edContrato.Text);
        if not Is_CarpetaEstadoUsuario(ID_CARPETA_AFILIAC, sContrato, ESTADOCARPETA_PODERUSUARIO, Sesion.UserId) then
          begin
            IdArchivo := GetIdArchivo(ID_CARPETA_AFILIAC, sContrato);

            DoRecepcionarCarpetaUsuario(IdArchivo, Sesion.UserId);
            DoModificarEstadoCarpeta(IdArchivo, ESTADOCARPETA_PODERUSUARIO, False, 0, '', True);
          end;
      end;

    CommitTrans;
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

function TfrmContratosGuarda.Validar: Boolean;
begin
  Verificar(edContrato.IsEmpty, edContrato, 'Debe indicar el contrato.');

  Result := True;
end;


procedure TfrmContratosGuarda.ClearControls;
begin
  edContrato.Clear;
  edRazonSocial.Clear;
end;

procedure TfrmContratosGuarda.LoadControls;
begin
  with sdqConsulta do
  begin
    edContrato.Value   := FieldByName('ga_contrato').AsInteger;
    edRazonSocial.Text := FieldByName('em_nombre').AsString;
  end;
end;

procedure TfrmContratosGuarda.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT aga.*, em_nombre' +
     ' FROM art.aga_guardaafiliacion aga, aco_contrato, aem_empresa' +
    ' WHERE aga.ga_contrato = co_contrato' +
      ' AND co_idempresa = em_id';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmContratosGuarda.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ga_fechabaja';
end;

procedure TfrmContratosGuarda.edContratoChange(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_nombre' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE em_id = co_idempresa' +
      ' AND co_contrato = :contrato';
  edRazonSocial.Text := ValorSqlEx(sSql, [edContrato.Text]);
end;

end.
