unit unManIncumplimientoEspecifico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManIncumplimientoEspecifico = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    fraAreas: TfraCodigoDescripcion;
    lblArea: TLabel;
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
  frmManIncumplimientoEspecifico: TfrmManIncumplimientoEspecifico;

implementation

{$R *.dfm}

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

procedure TfrmManIncumplimientoEspecifico.ClearControls;
begin
  inherited;
  edDescripcion.Text := '';
  fraAreas.Clear;
end;

function TfrmManIncumplimientoEspecifico.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('TI_ID', sdqConsulta.FieldByName('TI_ID').AsInteger);
    Sql.Fields.Add('TI_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('TI_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('TI_DESCRIPCION', edDescripcion.Text);
    Sql.Fields.Add('TI_AREA', fraAreas.Codigo);

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('TI_ID', GetSecNextVal('LEGALES.SEQ_LTI_ID') );
      Sql.Fields.Add('TI_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('TI_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('TI_ID', sdqConsulta.FieldByName('TI_ID').AsInteger);
      Sql.Fields.Add('TI_USUMODIF', Sesion.LoginName );
      Sql.Fields.Add('TI_FECHAMODIF', exDateTime );
      Sql.Fields.Add('TI_USUBAJA', exNull );
      Sql.Fields.Add('TI_FECHABAJA', exNull );
    end;
  end;
  Result := inherited DoABM;
end;


procedure TfrmManIncumplimientoEspecifico.LoadControls;
begin
  inherited;
    edDescripcion.Text := sdqConsulta.FieldByName('TI_DESCRIPCION').AsString;
    fraAreas.Codigo := sdqConsulta.FieldByName('TI_AREA').AsString;

end;

function TfrmManIncumplimientoEspecifico.Validar: Boolean;
begin
  Result := true;
  Verificar(edDescripcion.Text = '', edDescripcion,'Debe ingresar una descripción.');
  Verificar(not fraAreas.IsSelected, fraAreas,'Debe seleccionar un área.');
end;



procedure TfrmManIncumplimientoEspecifico.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TI_FECHABAJA';
  Sql.TableName := 'LEGALES.lti_tipoincumplimiento';

  with fraAreas do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'sc_id';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ExtraCondition := ' AND EXISTS (SELECT 1 FROM legales.lss_sectorsumario WHERE  ss_fechabaja is null AND ss_idsector = sc_id) ';
    ShowBajas := true;
  end;
end;

end.
