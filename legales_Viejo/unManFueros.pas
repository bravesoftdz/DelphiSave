unit unManFueros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmManFuero = class(TfrmCustomGridABM)
    Label1: TLabel;
    edNroJuzgado: TPatternEdit;
    Label2: TLabel;
    edDescripcion: TEdit;
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
  frmManFuero: TfrmManFuero;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

procedure TfrmManFuero.ClearControls;
begin
  inherited;
  edNroJuzgado.Clear;
  edDescripcion.Text := '';
end;

function TfrmManFuero.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('fu_id', sdqConsulta.FieldByName('fu_id').AsInteger);
    Sql.Fields.Add('fu_usubaja', Sesion.LoginName );
    Sql.Fields.Add('fu_fechabaja', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('fu_descripcion', edDescripcion.Text);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('fu_id', GetSecNextVal('LEGALES.SEQ_LFU_ID') );
      Sql.Fields.Add('fu_usualta', Sesion.LoginName );
      Sql.Fields.Add('fu_fechaalta', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('fu_id', sdqConsulta.FieldByName('fu_id').AsInteger);
      Sql.Fields.Add('fu_usumodif', Sesion.LoginName );
      Sql.Fields.Add('fu_fechamodif', exDateTime );
      Sql.Fields.Add('fu_usubaja', exNull );
      Sql.Fields.Add('fu_fechabaja', exNull );
    end;
  end;
  Result := inherited DoABM;
end;


procedure TfrmManFuero.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
    edNroJuzgado.Text           := FieldByName('fu_id').AsString;
    edDescripcion.Text          := FieldByName('fu_descripcion').AsString;
  end;
end;

function TfrmManFuero.Validar: Boolean;
begin
  Result := true;
  Verificar(edDescripcion.Text = '', edDescripcion,'Debe seleccionar una descripción.')
end;



procedure TfrmManFuero.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'FU_FECHABAJA';
  Sql.TableName := 'LEGALES.lfu_fuero';
end;


end.
