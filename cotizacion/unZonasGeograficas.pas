unit unZonasGeograficas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmZonasGeograficas = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDescripcion: TEdit;
    edValorPorcentualJuiciosPrivados: TCurrencyEdit;
    edValorPorcentualJuiciosMunicipios: TCurrencyEdit;
    edValorPorcentualJuiciosOtros: TCurrencyEdit;
    edPonderadorFactorRiesgo: TCurrencyEdit;
    Label6: TLabel;
    fraProvinciaRelacionada: TfraCodDesc;
    Label7: TLabel;
    edJuicioFrecuencia: TCurrencyEdit;
    Label8: TLabel;
    edRespCivil: TCurrencyEdit;
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
  frmZonasGeograficas: TfrmZonasGeograficas;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs;

{$R *.dfm}

function TfrmZonasGeograficas.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.azg_zonasgeograficas';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('zg_id',    sdqConsulta.FieldByName('zg_id').AsInteger, False);
    Sql.Fields.Add('zg_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('zg_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('zg_id',    -1, False);
      Sql.Fields.Add('zg_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('zg_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('zg_id',     sdqConsulta.FieldByName('zg_id').AsInteger, False);
      Sql.Fields.Add('zg_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('zg_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('zg_descripcion',            edDescripcion.Text);
    Sql.Fields.Add('zg_valorjuiciosprivados',   edValorPorcentualJuiciosPrivados.Value, 2, True);
    Sql.Fields.Add('zg_valorjuiciosmunicipio',  edValorPorcentualJuiciosMunicipios.Value, 2, True);
    Sql.Fields.Add('zg_valorjuiciosotros',      edValorPorcentualJuiciosOtros.Value, 2, True);
    Sql.Fields.Add('zg_ponderadorfactorriesgo', edPonderadorFactorRiesgo.Value, 2, True);
    Sql.Fields.AddString('zg_idprovincia',      fraProvinciaRelacionada.Value, 'N', True);
    Sql.Fields.Add('zg_frecuenciajuicios',      edJuicioFrecuencia.Value, 2, True);
    Sql.Fields.Add('zg_valor_rc',               edRespCivil.Value, 2, True);
  end;

  Result := inherited DoABM;
end;

function TfrmZonasGeograficas.Validar: Boolean;
begin
  Verificar((edDescripcion.Text = ''), edDescripcion, 'El campo Descripción es obligatorio.');

  Result := True;
end;


procedure TfrmZonasGeograficas.ClearControls;
begin
  edDescripcion.Clear;
  edValorPorcentualJuiciosPrivados.Clear;
  edValorPorcentualJuiciosMunicipios.Clear;
  edValorPorcentualJuiciosOtros.Clear;
  edPonderadorFactorRiesgo.Clear;
  fraProvinciaRelacionada.Clear;
  edJuicioFrecuencia.Clear;
  edRespCivil.Clear;
end;

procedure TfrmZonasGeograficas.LoadControls;
begin
  with sdqConsulta do
  begin
    edDescripcion.Text                       := FieldByName('zg_descripcion').AsString;
    edValorPorcentualJuiciosPrivados.Value   := FieldByName('zg_valorjuiciosprivados').AsFloat;
    edValorPorcentualJuiciosMunicipios.Value := FieldByName('zg_valorjuiciosmunicipio').AsFloat;
    edValorPorcentualJuiciosOtros.Value      := FieldByName('zg_valorjuiciosotros').AsFloat;
    edPonderadorFactorRiesgo.Value           := FieldByName('zg_ponderadorfactorriesgo').AsFloat;
    fraProvinciaRelacionada.Value            := StrToIntDef(FieldByName('zg_idprovincia').AsString, 0);
    edJuicioFrecuencia.Value                 := FieldByName('zg_frecuenciajuicios').AsFloat;
    edRespCivil.Value                        := FieldByName('zg_valor_rc').AsFloat;
  end;
end;

procedure TfrmZonasGeograficas.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT azg.*, pv_descripcion' +
     ' FROM afi.azg_zonasgeograficas azg, cpv_provincias' +
    ' WHERE zg_idprovincia = pv_codigo(+)';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;


procedure TfrmZonasGeograficas.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'zg_fechabaja';
end;

procedure TfrmZonasGeograficas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    TFloatField(FieldByName('zg_valorjuiciosprivados')).DisplayFormat   := ',0.00%';
    TFloatField(FieldByName('zg_valorjuiciosmunicipio')).DisplayFormat  := ',0.00%';
    TFloatField(FieldByName('zg_valorjuiciosotros')).DisplayFormat      := ',0.00%';
    TFloatField(FieldByName('zg_ponderadorfactorriesgo')).DisplayFormat := ',0.00%';
    TFloatField(FieldByName('zg_frecuenciajuicios')).DisplayFormat      := ',0.00%';
    TFloatField(FieldByName('zg_valor_rc')).DisplayFormat               := ',0.00';
  end;
end;

procedure TfrmZonasGeograficas.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('zg_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

procedure TfrmZonasGeograficas.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('zg_fechabaja').IsNull, tbModificar, 'Este registro ya está dado de baja.');
  inherited;
end;

end.
