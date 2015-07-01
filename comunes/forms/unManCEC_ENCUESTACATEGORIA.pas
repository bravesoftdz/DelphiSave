unit unManCEC_ENCUESTACATEGORIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt;

type
  TfrmManCEC_ENCUESTACATEGORIA = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    sdqConsultaEC_ID: TFloatField;
    sdqConsultaEC_DESCRIPCION: TStringField;
    sdqConsultaEC_FECHAALTA: TDateTimeField;
    sdqConsultaEC_USUALTA: TStringField;
    sdqConsultaEC_FECHAMODIF: TDateTimeField;
    sdqConsultaEC_USUMODIF: TStringField;
    sdqConsultaEC_FECHABAJA: TDateTimeField;
    sdqConsultaEC_USUBAJA: TStringField;
    ShortCutControlHijo: TShortCutControl;
    edEC_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    lbEncuestaFiltro: TLabel;
    Label1: TLabel;
    fraEncuesta: TfraCodDesc;
    fraEC_IDENCUESTA: TfraCodDesc;
    sdqConsultaEC_IDENCUESTA: TFloatField;
    sdqConsultaEN_ID: TFloatField;
    sdqConsultaEN_DESCRIPCION: TStringField;
    sdqConsultaEN_USUALTA: TStringField;
    sdqConsultaEN_FECHAALTA: TDateTimeField;
    sdqConsultaEN_USUMODIF: TStringField;
    sdqConsultaEN_FECHAMODIF: TDateTimeField;
    sdqConsultaEN_USUBAJA: TStringField;
    sdqConsultaEN_FECHABAJA: TDateTimeField;
    fraCategoriaPadre: TfraCodDesc;
    Label2: TLabel;
    sdqConsultaEC_IDPADRE: TFloatField;
    sdqConsultaCATPADRE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraEncuestaPropiedadesChange(Sender: TObject);
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
  frmManCEC_ENCUESTACATEGORIA: TfrmManCEC_ENCUESTACATEGORIA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt;

{$R *.dfm}

procedure TfrmManCEC_ENCUESTACATEGORIA.ClearControls;
begin
  ClearComponentData(fpAbm);
  FiltrarFraCategoriaPadre;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCEC_ENCUESTACATEGORIA.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EC_ID', sdqConsulta.FieldByName('EC_ID').AsInteger);
     Sql.Fields.Add('EC_FECHABAJA', exDate);
     Sql.Fields.Add('EC_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('EC_ID', ValorSQLInteger('SELECT NVL(MAX(EC_ID), 0) FROM COMERCIAL.CEC_ENCUESTACATEGORIA') + 1);
       Sql.Fields.Add('EC_FECHAALTA', exDate);
       Sql.Fields.Add('EC_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EC_ID', sdqConsulta.FieldByName('EC_ID').AsInteger);
       Sql.Fields.Add('EC_FECHAMODIF', exDate);
       Sql.Fields.Add('EC_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('EC_FECHABAJA', exNull);
       Sql.Fields.Add('EC_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EC_IDENCUESTA', fraEncuesta.Value);
     Sql.Fields.Add('EC_DESCRIPCION', edDescripcion.Text);
     Sql.Fields.Add('EC_IDPADRE', fraCategoriaPadre.Codigo);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.FiltrarFraCategoriaPadre;
begin
  fraCategoriaPadre.Propiedades.ExtraCondition := 'AND EC_IDENCUESTA = ' + SqlValue(fraEncuesta.Value);
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CEC_ENCUESTACATEGORIA';
  FieldBaja := 'EC_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  AutoColWidths := True;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.fraEncuestaPropiedadesChange(
  Sender: TObject);
begin
  FiltrarFraCategoriaPadre;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.LoadControls;
begin
  fraEncuesta.Value := sdqConsulta.FieldByName('EC_IDENCUESTA').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('EC_DESCRIPCION').AsString;

  fraCategoriaPadre.Propiedades.ExtraCondition := 'AND EC_IDENCUESTA = ' + SqlValue(fraEncuesta.Value);
  FiltrarFraCategoriaPadre;
  fraCategoriaPadre.Propiedades.ExtraCondition := fraCategoriaPadre.Propiedades.ExtraCondition + ' AND EC_ID <> ' + SqlValue(SdqConsulta.FieldByName('EC_ID').AsInteger);

  fraCategoriaPadre.Value := sdqConsulta.FieldByName('EC_IDPADRE').AsInteger;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCEC_ENCUESTACATEGORIA.Validar: Boolean;
begin
  Verificar(fraEncuesta.IsEmpty, fraEncuesta, 'Debe seleccionar la encuesta.');
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCEC_ENCUESTACATEGORIA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
