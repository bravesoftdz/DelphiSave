unit unManEstadoErgonomia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEstadoErgonomia = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    lbDescripcion: TLabel;
    edCodigo: TEdit;
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
  frmManEstadoErgonomia: TfrmManEstadoErgonomia;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;



procedure TfrmManEstadoErgonomia.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManEstadoErgonomia.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('EE_ID').AsInteger;
      Sql.Fields.Add('EE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EE_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HEE_ERG_ID');
        Sql.Fields.Add('EE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('EE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('EE_ID').AsInteger;
        Sql.Fields.Add('EE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EE_USUBAJA', exNull );
        Sql.Fields.Add('EE_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('EE_ID', iIdCodigo);

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

procedure TfrmManEstadoErgonomia.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EE_FECHABAJA';
  Sql.TableName := 'HYS.HEE_ESTADOERGONOMIA';
end;

procedure TfrmManEstadoErgonomia.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('EE_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('EE_DESCRIPCION').AsString;
end;

function TfrmManEstadoErgonomia.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
