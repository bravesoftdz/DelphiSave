unit unManSiniestralidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManSiniestralidad = class(TfrmCustomGridABM)
    Label2: TLabel;
    Label3: TLabel;
    edValorRC: TCurrencyEdit;
    Label1: TLabel;
    edHasta: TCurrencyEdit;
    edDesde: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmManSiniestralidad: TfrmManSiniestralidad;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal;

{$R *.dfm}

function TfrmManSiniestralidad.DoABM: Boolean;
begin
  Validar;
  Sql.Clear;
  Sql.TableName := 'art.arj_rc_juicio';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('rj_id',    sdqConsulta.FieldByName('rj_id').AsInteger, False);
    Sql.Fields.Add('rj_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('rj_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
    //  Sql.PrimaryKey.Add('rj_id',    'AFI.SEQ_RC_ARS_SINI.NEXVAL);  //Gen
      Sql.Fields.Add('rj_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('rj_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('rj_id',     sdqConsulta.FieldByName('rj_id').AsInteger, False);
      Sql.Fields.Add('rj_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('rj_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('rj_desde', edDesde.Value);
    Sql.Fields.Add('rj_hasta', edHasta.Value);
    Sql.Fields.Add('rj_valor', edValorRc.Value);
  end;

  Result := inherited DoABM;
end;

function TfrmManSiniestralidad.Validar: Boolean;
var
  sSql: String;
begin
  if ModoABM <> maBaja then
  begin
    //Verificar en desde no pongan un valor superior que en hasta.
    Verificar((edDesde.Value >= edHasta.Value), edHasta, 'El valor hasta no puede ser igual o menor a desde.');

    //Verificar que no se superponga con ningun otro tanto para modificaciones y altas
    sSql :=
      'SELECT rj_id' +
       ' FROM art.arj_rc_juicio' +
      ' WHERE (   (:desde BETWEEN rj_desde AND rj_hasta)' +
             ' OR (:hasta BETWEEN rj_desde AND rj_hasta)' +
             ' OR (    :desde < rj_desde' +
                 ' AND :hasta > rj_hasta)' +
             ' OR (    :desde > rj_desde' +
                 ' AND :hasta < rj_hasta))' +
        ' AND rj_fechabaja IS NULL';

    if ModoABM = maModificacion then
      sSql:= sSql + ' AND ' + sdqConsulta.FieldByName('rj_id').AsString + ' <> rj_id';

    Verificar(ExisteSqlEx(sSql, [edDesde.Value, edHasta.Value]), btnAceptar, 'El rango desde/hasta se superpone con otro registro.');
  end;

  Result := True;
end;


procedure TfrmManSiniestralidad.ClearControls;
begin
  edDesde.Clear;
  edHasta.Clear;
  edValorRc.Clear;
end;

procedure TfrmManSiniestralidad.LoadControls;
begin
  with sdqConsulta do
  begin
    edDesde.Value   := FieldByName('rj_desde').AsFloat;
    edHasta.Value   := FieldByName('rj_hasta').AsFloat;
    edValorRC.Value := FieldByName('rj_valor').AsFloat;
  end;
end;

procedure TfrmManSiniestralidad.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.arj_rc_juicio' +
    ' WHERE 1 = 1';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;


procedure TfrmManSiniestralidad.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'rj_fechabaja';
end;

procedure TfrmManSiniestralidad.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    TFloatField(FieldByName('rj_desde')).DisplayFormat := ',0.00';
    TFloatField(FieldByName('rj_hasta')).DisplayFormat := ',0.00';
    TFloatField(FieldByName('rj_valor')).DisplayFormat := ',0.00';
  end;
end;

procedure TfrmManSiniestralidad.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rj_fechabaj').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

procedure TfrmManSiniestralidad.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rj_fechabaj').IsNull, tbEliminar, 'Este registro ya está dado de baja.');
  inherited;
end;

end.
