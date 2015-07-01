unit unManSumaAsegurada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManSumaAsegurada = class(TfrmCustomGridABM)
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
  frmManSumaAsegurada: TfrmManSumaAsegurada;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal;

{$R *.dfm}

function TfrmManSumaAsegurada.DoABM: Boolean;
begin
  Validar;
  Sql.Clear;
  Sql.TableName := 'art.ars_rc_sumaasegurada';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('rs_id',    sdqConsulta.FieldByName('rs_id').AsInteger, False);
    Sql.Fields.Add('rs_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('rs_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      //Sql.PrimaryKey.Add('rs_id',    -1, False);
      Sql.Fields.Add('rs_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('rs_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('rs_id',     sdqConsulta.FieldByName('rs_id').AsInteger, False);
      Sql.Fields.Add('rs_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('rs_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('rs_desde', edDesde.Value);
    Sql.Fields.Add('rs_hasta', edHasta.Value);
    Sql.Fields.Add('rs_valor', edValorRc.Value);
  end;

  Result := inherited DoABM;
end;

function TfrmManSumaAsegurada.Validar: Boolean;
var
  sSql: String;
begin
  if modoABM <> maBaja then
  begin
    Verificar((edDesde.Value >= edHasta.Value), edHasta, 'El valor hasta no puede ser menor o igual a desde.');

    sSql :=
      'SELECT rs_id' +
       ' FROM art.ars_rc_sumaasegurada' +
      ' WHERE (   (:desde BETWEEN rs_desde AND rs_hasta)' +
             ' OR (:hasta BETWEEN rs_desde AND rs_hasta)' +
             ' OR (    :desde < rs_desde' +
                 ' AND :hasta > rs_hasta)' +
             ' OR (    :desde > rs_desde' +
                 ' AND :hasta < rs_hasta))' +
        ' AND rs_fechabaja IS NULL';

    if modoABM = maModificacion then
      sSql:= sSql + ' AND ' + sdqConsulta.FieldByName('rs_id').AsString + ' <> rs_id';
    Verificar(ExisteSqlEx(sSql, [edDesde.Value, edHasta.Value]), btnAceptar, 'El rango desde/hasta se superpone con otro registro.');
  end;

  Result := True;
end;


procedure TfrmManSumaAsegurada.ClearControls;
begin
  edDesde.Clear;
  edHasta.Clear;
  edValorRc.Clear;
end;

procedure TfrmManSumaAsegurada.LoadControls;
begin
  with sdqConsulta do
  begin
    edDesde.Value   := FieldByName('rs_desde').AsInteger;
    edHasta.Value   := FieldByName('rs_hasta').AsInteger;
    edValorRC.Value := FieldByName('rs_valor').AsFloat;
  end;
end;

procedure TfrmManSumaAsegurada.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.ars_rc_sumaasegurada' +
    ' WHERE 1 = 1';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;


procedure TfrmManSumaAsegurada.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'rs_fechabaja';
end;

procedure TfrmManSumaAsegurada.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
  //  TFloatField(FieldByName('rs_desde')).DisplayFormat    := '';
  // TFloatField(FieldByName('rs_hasta')).DisplayFormat    := '';
    TFloatField(FieldByName('rs_valor')).DisplayFormat := ',0.00';
  end;
end;

procedure TfrmManSumaAsegurada.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rs_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

procedure TfrmManSumaAsegurada.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rs_fechabaja').IsNull, tbEliminar, 'Este registro ya está dado de baja.');
  inherited;
end;

end.
