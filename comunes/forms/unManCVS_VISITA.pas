
unit unManCVS_VISITA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt, AdvGroupBox, AdvOfficeButtons;

type
  TfrmManCVS_VISITA = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    sdqConsultaVS_ID: TFloatField;
    sdqConsultaVS_DESCRIPCION: TStringField;
    sdqConsultaVS_FECHAALTA: TDateTimeField;
    sdqConsultaVS_USUALTA: TStringField;
    sdqConsultaVS_FECHAMODIF: TDateTimeField;
    sdqConsultaVS_USUMODIF: TStringField;
    sdqConsultaVS_FECHABAJA: TDateTimeField;
    sdqConsultaVS_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    edVS_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    rgAccion: TAdvOfficeRadioGroup;
    gbTarea: TAdvOfficeRadioGroup;
    sdqMotivosDeIngreso: TSDQuery;
    sdqConsultaVS_IDTIPOEVENTO: TFloatField;
    sdqConsultaVS_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaTE_DESCRIPCION: TStringField;
    sdqConsultaMI_DESCRIPCION: TStringField;
    pnlTarea: TPanel;
    lblMotivoIngreso: TLabel;
    lblTarea: TLabel;
    fraNuevaTarea: TfraCodDesc;
    fraTC_IDMOTIVOINGRESO: TfraCodDesc;
    rgDestinatario: TAdvOfficeRadioGroup;
    sdqConsultaVS_DESTINATARIO: TFloatField;
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
  frmManCVS_VISITA: TfrmManCVS_VISITA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt;

{$R *.dfm}

procedure TfrmManCVS_VISITA.ClearControls;
begin
  ClearComponentData(fpAbm);
  rgDestinatario.ItemIndex := -1;
  rgAccion.ItemIndex := -1;
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
end;

procedure TfrmManCVS_VISITA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCVS_VISITA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('VS_ID', sdqConsulta.FieldByName('VS_ID').AsInteger);
     Sql.Fields.Add('VS_FECHABAJA', exDate);
     Sql.Fields.Add('VS_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('VS_ID', ValorSQLInteger('SELECT NVL(MAX(VS_ID), 0) FROM COMERCIAL.CVS_VISITA') + 1);
       Sql.Fields.Add('VS_FECHAALTA', exDate);
       Sql.Fields.Add('VS_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('VS_ID', sdqConsulta.FieldByName('VS_ID').AsInteger);
       Sql.Fields.Add('VS_FECHAMODIF', exDate);
       Sql.Fields.Add('VS_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('VS_FECHABAJA', exNull);
       Sql.Fields.Add('VS_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('VS_DESCRIPCION', edDescripcion.Text);
     Sql.Fields.Add('VS_DESTINATARIO', rgDestinatario.ItemIndex);
     Sql.Fields.Add('VS_IDTIPOEVENTO', fraNuevaTarea.Value, True);
     Sql.Fields.Add('VS_IDMOTIVOINGRESO', fraTC_IDMOTIVOINGRESO.Value, True);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCVS_VISITA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CVS_VISITA';
  FieldBaja := 'VS_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  AutoColWidths := True;
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
end;

procedure TfrmManCVS_VISITA.fraNuevaTareaPropiedadesChange(Sender: TObject);
begin
  fraTC_IDMOTIVOINGRESO.Propiedades.Sql := sdqMotivosDeIngreso.SQL.Text + ' AND idtipoevento = ' + SqlInteger(fraNuevaTarea.Id, True);
end;

procedure TfrmManCVS_VISITA.LoadControls;
begin
  edDescripcion.Text := sdqConsulta.FieldByName('VS_DESCRIPCION').AsString;
  fraNuevaTarea.Value := sdqConsulta.FieldByName('VS_IDTIPOEVENTO').AsInteger;
  fraNuevaTareaPropiedadesChange(nil);
  fraTC_IDMOTIVOINGRESO.Value := sdqConsulta.FieldByName('VS_IDMOTIVOINGRESO').AsInteger;
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

  rgDestinatario.ItemIndex := sdqConsulta.FieldByName('VS_DESTINATARIO').AsInteger;
end;

procedure TfrmManCVS_VISITA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManCVS_VISITA.rgAccionClick(Sender: TObject);
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

function TfrmManCVS_VISITA.Validar: Boolean;
begin
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'Debe completar la descripción.');
  Verificar(rgDestinatario.ItemIndex = -1, rgDestinatario, 'Debe elegir una opción.');
  Verificar(rgAccion.ItemIndex = -1, rgAccion, 'Debe elegir una opción.');
  Verificar((rgAccion.ItemIndex = 0) and (fraNuevaTarea.IsEmpty), fraNuevaTarea, 'Debe seleccionar una tarea.');
  Verificar((rgAccion.ItemIndex = 0) and (fraTC_IDMOTIVOINGRESO.IsEmpty), fraTC_IDMOTIVOINGRESO, 'Debe seleccionar un motivo de ingreso.');
  Result := True;
end;

procedure TfrmManCVS_VISITA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
