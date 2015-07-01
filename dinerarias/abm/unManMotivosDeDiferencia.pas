unit unManMotivosDeDiferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosDeDiferencia = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

  public
    { Public declarations }
  end;

var
  frmManMotivosDeDiferencia: TfrmManMotivosDeDiferencia;

implementation

uses SqlFuncs, unSesion, CustomDlgs, unDmPrincipal, VCLExtra;

{$R *.dfm}

{ TfrmManMotivosDeDiferencia }

procedure TfrmManMotivosDeDiferencia.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;

procedure TfrmManMotivosDeDiferencia.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('md_codigo').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('md_descripcion').AsString;
end;

function TfrmManMotivosDeDiferencia.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    case ModoABM of

      maAlta, maModificacion:
      begin
        if (ModoABM = maAlta) then
        begin
          SqlType := stInsert;
          Fields.Add('md_fechaalta', exDateTime);
          Fields.Add('md_usualta', Sesion.UserID);
        end
        else begin
          SqlType := stUpdate;
          PrimaryKey.Add('md_id', sdqConsulta.FieldByName('md_id').AsInteger, False);
          Fields.Add('md_usumodif', Sesion.UserID);
          Fields.Add('md_fechamodif', exDateTime);
        end;
        Fields.Add('md_codigo', edCodigo.Text);
        Fields.Add('md_descripcion', edDescripcion.Text);
      end;

      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('md_id',    sdqConsulta.FieldByName('md_id').AsString);
        Fields.Add('md_usubaja',   Sesion.UserID);
        Fields.Add('md_fechabaja', exDateTime);
      end;

    end;
    Result := inherited DoABM;
  end;
end;

function TfrmManMotivosDeDiferencia.Validar: Boolean;
begin
  Verificar(Trim(edCodigo.text) = '', edCodigo, 'Debe completar el Código');
  Verificar(Trim(edDescripcion.text) = '', edDescripcion, 'Debe completar la Descripción');
  Verificar((ModoABM = maAlta) and ExisteSqlEx('SELECT 1 FROM SIN.smd_motivodiferencia WHERE md_codigo = :cod', [Trim(edCodigo.Text)]),
    edCodigo, 'Este código ya existe en la tabla');
  Result := True;
end;

procedure TfrmManMotivosDeDiferencia.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  inherited;
  sSql := 'SELECT md_id, md_codigo, md_descripcion, md_usualta, md_fechaalta, md_usumodif, md_fechamodif, md_usubaja, md_fechabaja ' +
           ' FROM SIN.smd_motivodiferencia';

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;
end;

procedure TfrmManMotivosDeDiferencia.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  FieldBaja     := 'MD_FECHABAJA';
  Sql.TableName := 'SIN.SMD_MOTIVODIFERENCIA';
  LockControl(edCodigo, true);
  tbRefrescarClick(nil);
end;

procedure TfrmManMotivosDeDiferencia.fpAbmBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControl(edCodigo, (ModoABM = maModificacion));
  VCLExtra.LockControl(btnAceptar, (ModoABM = maModificacion) and not sdqConsulta.FieldByName('MD_FECHABAJA').IsNull);
end;

end.
