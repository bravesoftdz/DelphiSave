unit unManActividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManActividades = class(TfrmCustomGridABM)
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
  frmManActividades: TfrmManActividades;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, SqlOracle,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql;
{$R *.dfm}
procedure TfrmManActividades.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'AC_FECHABAJA';
  Sql.TableName := 'PAC_ACTCAPACIT';
end;

procedure TfrmManActividades.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManActividades.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('AC_CODIGO').AsInteger;
      Sql.Fields.Add('AC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('AC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('AC_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('ART.SEQ_PAC_CODIGO');
        Sql.Fields.Add('AC_USUALTA', Sesion.UserID );
        Sql.Fields.Add('AC_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('AC_CODIGO').AsInteger;
        Sql.Fields.Add('AC_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('AC_FECHAMODIF', exDateTime );
        Sql.Fields.Add('AC_USUBAJA', exNull );
        Sql.Fields.Add('AC_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('AC_CODIGO', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManActividades.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('AC_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('AC_DESCRIPCION').AsString;
end;

function TfrmManActividades.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;
end.
