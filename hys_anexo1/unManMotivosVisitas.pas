unit unManMotivosVisitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivosVisitas = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManMotivosVisitas: TfrmManMotivosVisitas;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, SqlOracle,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql;
{$R *.dfm}

procedure TfrmManMotivosVisitas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MO_FECHABAJA';
  Sql.TableName := 'PMO_MOTIVOS';
end;

procedure TfrmManMotivosVisitas.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManMotivosVisitas.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MO_ID').AsInteger;
      Sql.Fields.Add('MO_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MO_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('ART.SEQ_PMO_ID');
        Sql.Fields.Add('MO_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MO_FECHAALTA', exDateTime );
        Sql.Fields.Add('MO_CODIGO', iIdCodigo );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('MO_ID').AsInteger;
        Sql.Fields.Add('MO_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MO_USUBAJA', exNull );
        Sql.Fields.Add('MO_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MO_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManMotivosVisitas.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('MO_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MO_DESCRIPCION').AsString;
end;

function TfrmManMotivosVisitas.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
