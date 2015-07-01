unit unManTipoGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManTipoGasto = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    edDescripcion: TEdit;
    lbDescripcion: TLabel;
    lbCodigo: TLabel;
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
  frmManTipoGasto: TfrmManTipoGasto;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{ TfrmManObservaciones }

procedure TfrmManTipoGasto.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManTipoGasto.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TG_ID').AsInteger;
      Sql.Fields.Add('TG_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TG_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TG_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LTG_ID');
        Sql.Fields.Add('TG_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TG_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TG_ID').AsInteger;
        Sql.Fields.Add('TG_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TG_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TG_USUBAJA', exNull );
        Sql.Fields.Add('TG_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TG_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;

end;

procedure TfrmManTipoGasto.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TG_FECHABAJA';
  Sql.TableName := 'LEGALES.LTG_TIPOGASTO';
end;

procedure TfrmManTipoGasto.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('TG_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('TG_DESCRIPCION').AsString;
end;

function TfrmManTipoGasto.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
