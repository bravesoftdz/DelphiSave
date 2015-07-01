unit unManMotivosMovEAS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql;

type
  TfrmManMotivosMovEAS = class(TfrmCustomGridABM)
    Label2: TLabel;
    edDescripcion: TEdit;
    rgTipo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManMotivosMovEAS: TfrmManMotivosMovEAS;
  
implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosMovEAS.ClearControls;
begin
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosMovEAS.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('MV_ID', sdqConsulta.FieldByName('MV_ID').AsInteger);
    Sql.Fields.Add('MV_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('MV_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('MV_TIPO', Copy ('IE', rgTipo.ItemIndex+1, 1));
    Sql.Fields.Add('MV_DESCRIPCION', edDescripcion.Text);
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('MV_ID', GetSecNextVal('HYS.SEQ_HMV_ID') );
      Sql.Fields.Add('MV_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('MV_FECHALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('MV_ID', sdqConsulta.FieldByName('MV_ID').AsInteger );
      Sql.Fields.Add('MV_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('MV_FECHAMODIF', exDateTime );
      Sql.Fields.Add('MV_USUBAJA', exNull );
      Sql.Fields.Add('MV_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosMovEAS.LoadControls;
begin
  rgTipo.ItemIndex  := Pos(sdqConsulta.FieldByName('MV_tipo').AsString, 'IE') - 1;
  edDescripcion.Text:= sdqConsulta.FieldByName('MV_descripcion').AsString
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosMovEAS.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Motivos Movimientos EAS',
                      edDescripcion, Trim(edDescripcion.Text) <> '', 'Debe ingresar la descripción']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosMovEAS.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'mv_FECHABAJA';
  Sql.TableName := 'hys.hmv_motivomoveas';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}

end.


