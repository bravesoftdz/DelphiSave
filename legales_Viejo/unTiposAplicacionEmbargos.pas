unit unTiposAplicacionEmbargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmTiposAplicacionEmbargos = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label3: TLabel;
    rbSuma: TRadioButton;
    rbResta: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmTiposAplicacionEmbargos: TfrmTiposAplicacionEmbargos;

implementation

uses
	unSesion, SqlFuncs, General, unDmPrincipal, CustomDlgs, AnsiSql;

{$R *.dfm}

function TfrmTiposAplicacionEmbargos.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
  	Sql.PrimaryKey.Add('TA_ID', 	 sdqConsulta.FieldByName('TA_ID').AsInteger);
    Sql.Fields.Add('TA_USUBAJA', 	 Sesion.LoginName);
    Sql.Fields.Add('TA_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    Sql.Fields.Add('TA_CODIGO', 		 edCodigo.Text);
    Sql.Fields.Add('TA_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('TA_OPERACION', 	 Integer(IIF(rbSuma.Checked, 1, -1)));

    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('TA_ID', 	 GetSecNextVal('LEGALES.SEQ_LTA_ID'));
      Sql.Fields.Add('TA_USUALTA', 	 Sesion.LoginName);
      Sql.Fields.Add('TA_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('TA_ID', 		sdqConsulta.FieldByName('TA_ID').AsInteger);
      Sql.Fields.Add('TA_USUMODIF', 	Sesion.LoginName);
      Sql.Fields.Add('TA_FECHAMODIF', exDateTime);
      Sql.Fields.Add('TA_USUBAJA', 		exNull);
      Sql.Fields.Add('TA_FECHABAJA', 	exNull);
    end;
  end;
  Result := inherited DoABM;
end;

function TfrmTiposAplicacionEmbargos.Validar: Boolean;
var
	sSql: String;
begin
	Verificar((edCodigo.Text = ''), edCodigo, 'El campo Código es obligatorio.');

  sSql :=
  	'SELECT 1' +
     ' FROM legales.lta_tipoaplicacionembargo' +
    ' WHERE ta_codigo = ' + SqlValue(edCodigo.Text);
  Verificar(ExisteSql(sSql), edCodigo, 'Ese código ya existe en la base de datos.');

  Verificar((edDescripcion.Text = ''), edDescripcion, 'El campo Descripción es obligatorio.');
  Verificar((not rbSuma.Checked) and (not rbResta.Checked), rbSuma, 'El campo Operación es obligatorio.');

  Result := True;
end;


procedure TfrmTiposAplicacionEmbargos.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
  rbSuma.Checked := False;
  rbResta.Checked := False;
end;

procedure TfrmTiposAplicacionEmbargos.LoadControls;
begin
  with sdqConsulta do
  begin
    edCodigo.Text         := FieldByName('TA_CODIGO').AsString;
    edDescripcion.Text    := FieldByName('TA_DESCRIPCION').AsString;
		rbSuma.Checked 				:= (FieldByName('TA_OPERACION').AsInteger = 1);
    rbResta.Checked 			:= (FieldByName('TA_OPERACION').AsInteger = -1);
  end;
end;

procedure TfrmTiposAplicacionEmbargos.FormCreate(Sender: TObject);
begin
  inherited;

  CheckPK := True;
  FieldBaja := 'TA_FECHABAJA';
  Sql.TableName := 'LEGALES.LTA_TIPOAPLICACIONEMBARGO';

  tbRefrescarClick(nil);
end;

procedure TfrmTiposAplicacionEmbargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
end;

end.
