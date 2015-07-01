unit unManEstadoPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEstadoPresentacion = class(TfrmCustomGridABM)
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
  frmManEstadoPresentacion: TfrmManEstadoPresentacion;

implementation

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;
{$R *.dfm}

procedure TfrmManEstadoPresentacion.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManEstadoPresentacion.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('EP_ID').AsInteger;
      Sql.Fields.Add('EP_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EP_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HEP_ESTADO_ID');
        Sql.Fields.Add('EP_USUALTA', Sesion.UserID );
        Sql.Fields.Add('EP_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('EP_ID').AsInteger;
        Sql.Fields.Add('EP_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EP_USUBAJA', exNull );
        Sql.Fields.Add('EP_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('EP_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el estado de presentación.');
    end;
  end;

end;

procedure TfrmManEstadoPresentacion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EP_FECHABAJA';
  Sql.TableName := 'HYS.HEP_ESTADOPRESENTACION';
end;

procedure TfrmManEstadoPresentacion.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('EP_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('EP_DESCRIPCION').AsString;
end;

function TfrmManEstadoPresentacion.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
