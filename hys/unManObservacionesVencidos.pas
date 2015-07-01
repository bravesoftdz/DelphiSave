unit unManObservacionesVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmManObservacionVencidos = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edObservacion: TEdit;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManObservacionVencidos: TfrmManObservacionVencidos;

implementation

uses unCustomConsulta, CustomDlgs,unDmPrincipal, unSesion, SqlFuncs, Math, VclExtra;

{$R *.dfm}

{ TfrmManZonaCotizacion }

procedure TfrmManObservacionVencidos.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edObservacion.Clear;
end;

function TfrmManObservacionVencidos.DoABM: Boolean;
var
  idCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      idCodigo := sdqConsulta.FieldByName('OH_ID').AsInteger;
      Sql.Fields.Add('OH_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('OH_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin

      Sql.Fields.Add('OH_OBSERVACION', edObservacion.Text);
      Sql.Fields.Add('OH_MODULO', 'AV');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        idCodigo := GetSecNextVal('hys.seq_hoh_id');
        Sql.Fields.Add('OH_USUALTA', Sesion.UserID );
        Sql.Fields.Add('OH_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        idCodigo := sdqConsulta.FieldByName('OH_ID').AsInteger;
//        Sql.Fields.Add('OH_USUMODIF', Sesion.UserID);
//        Sql.Fields.Add('OH_FECHAMODIF', exDateTime );
        Sql.Fields.Add('OH_USUBAJA', exNull );
        Sql.Fields.Add('OH_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('OH_ID', idCodigo);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManObservacionVencidos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'OH_FECHABAJA';
  Sql.TableName := 'hys.hoh_observacionhys';
  vclExtra.LockControls([edCodigo],True);
end;

procedure TfrmManObservacionVencidos.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('OH_ID').AsString;
  edObservacion.Text := sdqConsulta.FieldByName('OH_OBSERVACION').AsString;
end;

function TfrmManObservacionVencidos.Validar: Boolean;
begin
  Verificar(edObservacion.Text = '', edObservacion, 'Debe ingresar la descripción.');
  Result := True;
end;

end.
