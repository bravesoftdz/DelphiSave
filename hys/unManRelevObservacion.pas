unit unManRelevObservacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExComboBox;

type
  TfrmManRelevObservaciones = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    cmbTipo: TExComboBox;
    lbTipo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
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
  frmManRelevObservaciones: TfrmManRelevObservaciones;

implementation

uses
  unDmPrincipal, SqlFuncs, ansiSql, VclExtra, CustomDlgs, unSesion, General;

{$R *.dfm}

procedure TfrmManRelevObservaciones.ClearControls;
begin
  inherited;
  edDescripcion.Clear;
  cmbTipo.ItemIndex := -1;
end;

function TfrmManRelevObservaciones.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('ob_id').AsInteger;
      Sql.Fields.Add('ob_usubaja', Sesion.UserID );
      Sql.Fields.Add('ob_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('ob_descripcion',edDescripcion.Text);
      Sql.Fields.Add('ob_tipo',cmbTipo.Value);
      Sql.Fields.Add('ob_formulario','R');
      Sql.Fields.Add('ob_tipooperacion','M');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HOB_ID');
        Sql.Fields.Add('ob_usualta', Sesion.UserID );
        Sql.Fields.Add('ob_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('ob_id').AsInteger;
        Sql.Fields.Add('ob_usumodif', Sesion.UserID);
        Sql.Fields.Add('ob_fechamodif', exDateTime );
        Sql.Fields.Add('ob_usubaja', exNull );
        Sql.Fields.Add('ob_fechabaja', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('ob_id', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManRelevObservaciones.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ob_fechabaja';
  Sql.TableName := 'hys.hob_observacion';

end;

procedure TfrmManRelevObservaciones.LoadControls;
begin
  inherited;
  ClearControls;
  edDescripcion.Text := sdqConsulta.FieldByName('ob_descripcion').AsString;
  cmbTipo.Value := sdqConsulta.FieldByName('ob_tipo').AsString;
end;

procedure TfrmManRelevObservaciones.tbRefrescarClick(Sender: TObject);
begin
  //null
end;

function TfrmManRelevObservaciones.Validar: Boolean;
begin
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe ingresar la descripción.');
  Verificar(cmbTipo.ItemIndex = -1, cmbTipo, 'Debe ingresar el tipo.');
  result := true;
end;

end.
