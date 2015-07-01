unit unManCEN_ENCUESTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt, AdvGroupBox, AdvOfficeButtons;

type
  TfrmManCEN_ENCUESTA = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    sdqConsultaEN_ID: TFloatField;
    sdqConsultaEN_DESCRIPCION: TStringField;
    sdqConsultaEN_FECHAALTA: TDateTimeField;
    sdqConsultaEN_USUALTA: TStringField;
    sdqConsultaEN_FECHAMODIF: TDateTimeField;
    sdqConsultaEN_USUMODIF: TStringField;
    sdqConsultaEN_FECHABAJA: TDateTimeField;
    sdqConsultaEN_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    edEN_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    rgAccion: TAdvOfficeRadioGroup;
    gbTarea: TAdvOfficeRadioGroup;
    sdqMotivosDeIngreso: TSDQuery;
    sdqConsultaEN_IDTIPOEVENTO: TFloatField;
    sdqConsultaEN_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaTE_DESCRIPCION: TStringField;
    sdqConsultaMI_DESCRIPCION: TStringField;
    pnlTarea: TPanel;
    lblMotivoIngreso: TLabel;
    lblTarea: TLabel;
    fraNuevaTarea: TfraCodDesc;
    fraTC_IDMOTIVOINGRESO: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraNuevaTareaPropiedadesChange(Sender: TObject);
    procedure rgAccionClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCEN_ENCUESTA: TfrmManCEN_ENCUESTA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt;

{$R *.dfm}

procedure TfrmManCEN_ENCUESTA.ClearControls;
begin
  ClearComponentData(fpAbm);
  rgAccion.ItemIndex := -1;
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
end;

procedure TfrmManCEN_ENCUESTA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCEN_ENCUESTA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EN_ID', sdqConsulta.FieldByName('EN_ID').AsInteger);
     Sql.Fields.Add('EN_FECHABAJA', exDate);
     Sql.Fields.Add('EN_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('EN_ID', ValorSQLInteger('SELECT NVL(MAX(EN_ID), 0) FROM COMERCIAL.CEN_ENCUESTA') + 1);
       Sql.Fields.Add('EN_FECHAALTA', exDate);
       Sql.Fields.Add('EN_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EN_ID', sdqConsulta.FieldByName('EN_ID').AsInteger);
       Sql.Fields.Add('EN_FECHAMODIF', exDate);
       Sql.Fields.Add('EN_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('EN_FECHABAJA', exNull);
       Sql.Fields.Add('EN_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EN_DESCRIPCION', edDescripcion.Text);
     if rgAccion.ItemIndex = 0 then
     begin
      Sql.Fields.Add('EN_IDTIPOEVENTO', fraNuevaTarea.Value);
      Sql.Fields.Add('EN_IDMOTIVOINGRESO', fraTC_IDMOTIVOINGRESO.value);
     end
     else
     begin
      Sql.Fields.Add('EN_IDTIPOEVENTO', exNull);
      Sql.Fields.Add('EN_IDMOTIVOINGRESO', exNull);
     end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCEN_ENCUESTA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CEN_ENCUESTA';
  FieldBaja := 'EN_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  AutoColWidths := True;
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
end;

procedure TfrmManCEN_ENCUESTA.fraNuevaTareaPropiedadesChange(Sender: TObject);
begin
  fraTC_IDMOTIVOINGRESO.Propiedades.Sql := sdqMotivosDeIngreso.SQL.Text + ' AND idtipoevento = ' + SqlInteger(fraNuevaTarea.Id, True);
end;

procedure TfrmManCEN_ENCUESTA.LoadControls;
begin
  edDescripcion.Text := sdqConsulta.FieldByName('EN_DESCRIPCION').AsString;
  fraNuevaTarea.Value := sdqConsulta.FieldByName('EN_IDTIPOEVENTO').AsInteger;
  fraNuevaTareaPropiedadesChange(nil);
  fraTC_IDMOTIVOINGRESO.Value := sdqConsulta.FieldByName('EN_IDMOTIVOINGRESO').AsInteger;
  if not fraNuevaTarea.IsEmpty then
  begin
    rgAccion.ItemIndex := 0;
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], False);
  end
  else
  begin
    rgAccion.ItemIndex := 1;
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
  end;
end;

procedure TfrmManCEN_ENCUESTA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManCEN_ENCUESTA.rgAccionClick(Sender: TObject);
begin
  if rgAccion.ItemIndex = 0 then
  begin
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], False);
  end
  else
  begin
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
    fraNuevaTarea.Clear;
    fraTC_IDMOTIVOINGRESO.Clear;
  end;
end;

function TfrmManCEN_ENCUESTA.Validar: Boolean;
begin
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'Debe completar la descripción.');
  Verificar(rgAccion.ItemIndex = -1, rgAccion, 'Debe elegir una opción.');
  Verificar((rgAccion.ItemIndex = 0) and (fraNuevaTarea.IsEmpty), fraNuevaTarea, 'Debe seleccionar una tarea.');
  Verificar((rgAccion.ItemIndex = 0) and (fraTC_IDMOTIVOINGRESO.IsEmpty), fraTC_IDMOTIVOINGRESO, 'Debe seleccionar un motivo de ingreso.');
  Result := True;
end;

procedure TfrmManCEN_ENCUESTA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
