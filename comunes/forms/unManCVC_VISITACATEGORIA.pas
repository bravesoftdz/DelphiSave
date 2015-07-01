unit unManCVC_VISITACATEGORIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt;

type
  TfrmManCVC_VISITACATEGORIA = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    sdqConsultaVC_ID: TFloatField;
    sdqConsultaVC_DESCRIPCION: TStringField;
    sdqConsultaVC_FECHAALTA: TDateTimeField;
    sdqConsultaVC_USUALTA: TStringField;
    sdqConsultaVC_FECHAMODIF: TDateTimeField;
    sdqConsultaVC_USUMODIF: TStringField;
    sdqConsultaVC_FECHABAJA: TDateTimeField;
    sdqConsultaVC_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    edVC_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    lbVisitaFiltro: TLabel;
    Label1: TLabel;
    fraVisita: TfraCodDesc;
    fraCategoriaPadre: TfraCodDesc;
    Label2: TLabel;
    sdqConsultaVC_IDPADRE: TFloatField;
    sdqConsultaCATPADRE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraVisitaPropiedadesChange(Sender: TObject);
  private
    FSQL: String;
    Procedure FiltrarFraCategoriaPadre;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCVC_VISITACATEGORIA: TfrmManCVC_VISITACATEGORIA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt;

{$R *.dfm}

procedure TfrmManCVC_VISITACATEGORIA.ClearControls;
begin
  ClearComponentData(fpAbm);
  FiltrarFraCategoriaPadre;
end;

procedure TfrmManCVC_VISITACATEGORIA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCVC_VISITACATEGORIA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('VC_ID', sdqConsulta.FieldByName('VC_ID').AsInteger);
     Sql.Fields.Add('VC_FECHABAJA', exDate);
     Sql.Fields.Add('VC_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('VC_ID', ValorSQLInteger('SELECT NVL(MAX(VC_ID), 0) FROM COMERCIAL.CVC_VISITACATEGORIA') + 1);
       Sql.Fields.Add('VC_FECHAALTA', exDate);
       Sql.Fields.Add('VC_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('VC_ID', sdqConsulta.FieldByName('VC_ID').AsInteger);
       Sql.Fields.Add('VC_FECHAMODIF', exDate);
       Sql.Fields.Add('VC_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('VC_FECHABAJA', exNull);
       Sql.Fields.Add('VC_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('VC_IDVISITA', fraVisita.Value);
     Sql.Fields.Add('VC_DESCRIPCION', edDescripcion.Text);
     Sql.Fields.Add('VC_IDPADRE', fraCategoriaPadre.Codigo);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCVC_VISITACATEGORIA.FiltrarFraCategoriaPadre;
begin
  fraCategoriaPadre.Propiedades.ExtraCondition := 'AND VC_IDVISITA = ' + SqlValue(fraVisita.Value);
end;

procedure TfrmManCVC_VISITACATEGORIA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CVC_VISITACATEGORIA';
  FieldBaja := 'VC_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  AutoColWidths := True;
end;

procedure TfrmManCVC_VISITACATEGORIA.fraVisitaPropiedadesChange(
  Sender: TObject);
begin
  FiltrarFraCategoriaPadre;
end;

procedure TfrmManCVC_VISITACATEGORIA.LoadControls;
begin
  fraVisita.Value := sdqConsulta.FieldByName('VC_IDVISITA').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('VC_DESCRIPCION').AsString;

  fraCategoriaPadre.Propiedades.ExtraCondition := 'AND VC_IDVISITA = ' + SqlValue(fraVisita.Value);
  FiltrarFraCategoriaPadre;
  fraCategoriaPadre.Propiedades.ExtraCondition := fraCategoriaPadre.Propiedades.ExtraCondition + ' AND VC_ID <> ' + SqlValue(SdqConsulta.FieldByName('VC_ID').AsInteger);

  fraCategoriaPadre.Value := sdqConsulta.FieldByName('VC_IDPADRE').AsInteger;
end;

procedure TfrmManCVC_VISITACATEGORIA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCVC_VISITACATEGORIA.Validar: Boolean;
begin
  Verificar(fraVisita.IsEmpty, fraVisita, 'Debe seleccionar la visita.');
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCVC_VISITACATEGORIA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
