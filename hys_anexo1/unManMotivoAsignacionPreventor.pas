unit unManMotivoAsignacionPreventor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit;

type
  TfrmMotivoAsignacionPreventor = class(TfrmCustomGridABM)
    edDiasVigencia: TIntEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    lbDiasVigencia: TLabel;
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
  frmMotivoAsignacionPreventor: TfrmMotivoAsignacionPreventor;

implementation
uses unCustomConsulta, CustomDlgs, unDmPrincipal, StrFuncs, VCLExtra, SqlOracle,
     unSesion, SQLFuncs;
{$R *.dfm}

procedure TfrmMotivoAsignacionPreventor.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'MA_FECHABAJA';
end;

procedure TfrmMotivoAsignacionPreventor.ClearControls;
begin
  inherited;
  edDescripcion.Clear;
  edDiasVigencia.Clear;
end;

procedure TfrmMotivoAsignacionPreventor.LoadControls;
begin
  inherited;
  ClearControls;
  edDescripcion.Text := sdqConsulta.FieldByName('MA_DESCRIPCION').AsString;
  edDiasVigencia.Text := sdqConsulta.FieldByName('MA_DIASVIGENCIA').AsString;
end;

function TfrmMotivoAsignacionPreventor.DoABM : Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'HYS.HMA_MOTIVOASIGPREV';
  if ModoABM = maBaja Then
  begin
    Sql.Fields.Add('MA_USUBAJA', Sesion.UserID );
    Sql.Fields.Add('MA_FECHABAJA', exDateTime );
    Sql.PrimaryKey.Add('MA_ID',sdqConsulta.fieldbyname('MA_ID').AsString);
    Sql.SqlType := stUpdate;
  end else
  begin
    Sql.Fields.Add('MA_DESCRIPCION',edDescripcion.Text);
    Sql.Fields.Add('MA_DIASVIGENCIA',edDiasVigencia.Text);
    if ModoABM = maAlta Then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add('MA_ID',GetSecNextVal('HYS.SEQ_HMA_ID'));
      Sql.Fields.Add('MA_USUALTA', Sesion.UserID );
      Sql.Fields.Add('MA_FECHAALTA', exDateTime );
    end else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('MA_ID',sdqConsulta.fieldbyname('MA_ID').AsString);
      Sql.Fields.Add('MA_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('MA_FECHAMODIF', exDateTime );
      Sql.Fields.Add('MA_USUBAJA', exNull );
      Sql.Fields.Add('MA_FECHABAJA', exNull );
    end;
  end;

  EjecutarSQL(Sql.Sql);
  result:= true;
end;

function TfrmMotivoAsignacionPreventor.Validar : Boolean;
begin
  inherited;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion,'Debe tener una descripción.');
  result := true;
end;

end.
