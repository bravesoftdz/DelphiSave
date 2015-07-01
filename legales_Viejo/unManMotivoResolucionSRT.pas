unit unManMotivoResolucionSRT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivoResolucionSRT = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    lbDescripcion: TLabel;
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
  frmManMotivoResolucionSRT: TfrmManMotivoResolucionSRT;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{ TfrmManObservaciones }

procedure TfrmManMotivoResolucionSRT.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManMotivoResolucionSRT.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MR_ID').AsInteger;
      Sql.Fields.Add('MR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MR_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LMR_ID');
        Sql.Fields.Add('MR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('MR_ID').AsInteger;
        Sql.Fields.Add('MR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MR_USUBAJA', exNull );
        Sql.Fields.Add('MR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;

end;

procedure TfrmManMotivoResolucionSRT.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MR_FECHABAJA';
  Sql.TableName := 'LEGALES.LMR_MOTIVORESOLUCIONSRT';
end;

procedure TfrmManMotivoResolucionSRT.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('MR_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('MR_DESCRIPCION').AsString;
end;

function TfrmManMotivoResolucionSRT.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;


end.
