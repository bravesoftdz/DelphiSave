unit unMotivosCancelacionRevisionPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmMotivosCancelacionRevisionPrecios = class(TfrmCustomGridABM)
    Label1: TLabel;
    edDetalle: TEdit;
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmMotivosCancelacionRevisionPrecios: TfrmMotivosCancelacionRevisionPrecios;

implementation

uses
  unSesion, CustomDlgs;

{$R *.dfm}

function TfrmMotivosCancelacionRevisionPrecios.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'amc_motivocancelsolicreafi';

  if ModoABM = maBaja then
  begin
    iId := sdqConsulta.FieldByName('mc_id').AsInteger;
    Sql.Fields.Add('mc_usubaja',    Sesion.UserID);
    Sql.Fields.Add('mc_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      iId := -1;
      Sql.Fields.Add('mc_usualta',    Sesion.UserID);
      Sql.Fields.Add('mc_fechaalta', 'SYSDATE', False);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('mc_id').AsInteger;
      Sql.Fields.Add('mc_usumodif',   Sesion.UserID);
      Sql.Fields.Add('mc_fechamodif', 'SYSDATE', False);
      Sql.Fields.Add('mc_usubaja',    'NULL', False);
      Sql.Fields.Add('mc_fechabaja',  'NULL', False);
    end;
    Sql.Fields.Add('mc_detalle', edDetalle.Text);
  end;
  Sql.PrimaryKey.Add('mc_id', iId, False);

  Result := inherited DoABM;
end;

function TfrmMotivosCancelacionRevisionPrecios.Validar: Boolean;
begin
  Verificar((edDetalle.Text = ''), edDetalle, 'El motivo es obligatorio.');

  Result := True;
end;


procedure TfrmMotivosCancelacionRevisionPrecios.ClearControls;
begin
  edDetalle.Clear;
end;

procedure TfrmMotivosCancelacionRevisionPrecios.LoadControls;
begin
  edDetalle.Text := sdqConsulta.FieldByName('mc_detalle').AsString;
end;

procedure TfrmMotivosCancelacionRevisionPrecios.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                                  var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmMotivosCancelacionRevisionPrecios.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'mc_fechabaja';
end;

procedure TfrmMotivosCancelacionRevisionPrecios.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('mc_fechabaja').IsNull, Grid, 'No se puede modificar un registro dado de baja.');

  inherited;
end;

procedure TfrmMotivosCancelacionRevisionPrecios.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('mc_fechabaja').IsNull, Grid, 'No se puede eliminar un registro dado de baja.');

  inherited;
end;

end.
