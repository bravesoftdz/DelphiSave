unit unManObservaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManObservaciones = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    ShortCutControl1: TShortCutControl;
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
  frmManObservaciones: TfrmManObservaciones;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{ TfrmManObservaciones }

procedure TfrmManObservaciones.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);

end;

function TfrmManObservaciones.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('OR_CODIGO').AsInteger;
      Sql.Fields.Add('OR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('OR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('OR_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HOR_CODIGO');
        Sql.Fields.Add('OR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('OR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('OR_CODIGO').AsInteger;
        Sql.Fields.Add('OR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('OR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('OR_USUBAJA', exNull );
        Sql.Fields.Add('OR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('OR_CODIGO', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar las observaciones.');
    end;
  end;

end;

procedure TfrmManObservaciones.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'OR_FECHABAJA';
  Sql.TableName := 'HYS.HOR_OBSERVACIONRECLAMO';
end;

procedure TfrmManObservaciones.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('OR_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('OR_DESCRIPCION').AsString;
end;

function TfrmManObservaciones.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
