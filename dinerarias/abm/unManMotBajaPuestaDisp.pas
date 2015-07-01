unit unManMotBajaPuestaDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmMotBajaPuestaDisp = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure fpAbmShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMotBajaPuestaDisp: TfrmMotBajaPuestaDisp;

implementation

uses unDmPrincipal, CustomDlgs, SqlFuncs, unSesion;

{$R *.dfm}


procedure TfrmMotBajaPuestaDisp.tbRefrescarClick(Sender: TObject);
var sSql:String;
begin
  sSql := 'SELECT MP_CODIGO, MP_DESCRIPCION, MP_FECHABAJA, MP_ID, MP_USUBAJA ' +
           ' FROM SIN.smp_motivosbajapuesta ';
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmMotBajaPuestaDisp.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

procedure TfrmMotBajaPuestaDisp.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('MP_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MP_DESCRIPCION').AsString;
end;

function TfrmMotBajaPuestaDisp.Validar: Boolean;
begin
  Verificar(trim(edCodigo.text) = '', edCodigo, 'Debe ingresar el Código');
  Verificar(trim(edDescripcion.text) = '', edDescripcion, 'Debe ingresar la Descripción');

  Result := True;
end;

procedure TfrmMotBajaPuestaDisp.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.smp_motivosbajapuesta';
  FieldBaja := 'MP_FECHABAJA';
end;

function TfrmMotBajaPuestaDisp.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;

    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        // PrimaryKey.Add('ML_ID', 'SEQ_ML_ID.NEXTVAL', False);
        Fields.Add('MP_USUALTA', Sesion.UserID);
        Fields.Add('MP_FECHAALTA', exDate);
        Fields.Add('MP_CODIGO', Trim(edCodigo.Text));
        Fields.Add('MP_DESCRIPCION', Trim(edDescripcion.Text));
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('MP_ID', sdqConsulta.FieldByName('MP_ID').AsInteger, False);
        Fields.Add('MP_USUMODIF', Sesion.UserID);
        Fields.Add('MP_FECHAMODIF', exDate);
        Fields.Add('MP_CODIGO', Trim(edCodigo.Text));
        Fields.Add('MP_DESCRIPCION', Trim(edDescripcion.Text));
        Fields.Add('MP_USUBAJA', '');
        Fields.Add('MP_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('MP_ID', sdqConsulta.FieldByName('MP_ID').AsInteger, False);
        Fields.Add('MP_USUBAJA', Sesion.UserID);
        Fields.Add('MP_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;



procedure TfrmMotBajaPuestaDisp.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maAlta then
  begin
    edCodigo.Text := ValorSql('select max(mp_codigo) + 1 from SIN.smp_motivosbajapuesta');
    edCodigo.Enabled := True;
  end
  else
    edcodigo.Enabled := False;

end;

end.
