unit unPorcentajesHonorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, ToolEdit, CurrEdit;

type
  TfrmPorcentajesHonorarios = class(TfrmCustomGridABM)
    gbEstudio: TGroupBox;
    fraEstudio: TfraStaticCodigoDescripcion;
    gbEstudioAM: TGroupBox;
    frafpEstudio: TfraStaticCodigoDescripcion;
    edfpPorcentaje: TCurrencyEdit;
    Label1: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fpAbmEnter(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPorcentajesHonorarios: TfrmPorcentajesHonorarios;

implementation

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, Strfuncs, DbFuncs, unFraCodigoDescripcion,
  unArt, unPrincipal, unSesion, SqlFuncs, Numeros;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT GC_ID CODIGO, GC_NOMBRE ESTUDIO, HG_HONORARIO HONORARIO, TRUNC(HG_FECHABAJA) FECHA_BAJA, ' +
                 'HG_ID HGID ' +
            'FROM AGC_GESTORCUENTA, LHG_HONORARIOGESTOR ' +
           'WHERE GC_ID = HG_IDGESTOR ';

  if fraEstudio.IsSelected then
    sWhere := sWhere + ' AND GC_ID = ' + SqlValue(fraEstudio.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  ShowActived  := False;
  FieldBaja    := 'FECHA_BAJA';

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ',' +
          ' GC_ID ' + CD_ALIAS_CODIGO + ',' +
          ' GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
          ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S''';

  with fraEstudio do
    begin
      Sql := sSql;
      ShowBajas := True;
    end;

  with frafpEstudio do
    begin
      Sql := sSql;
      ShowBajas := False;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEstudio.Clear;

  fraEstudio.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  TFloatField(sdqConsulta.FieldByName('HONORARIO')).DisplayFormat := '% 0.00;-% 0.00';
end;
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.ClearControls;
begin
  frafpEstudio.Clear;
  edfpPorcentaje.Clear;
end;
{-------------------------------------------------------------------------------}
function TfrmPorcentajesHonorarios.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'LHG_HONORARIOGESTOR';

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('HG_ID',    sdqConsulta.FieldByName('HGID').AsInteger);
          Fields.Add('HG_FECHABAJA', exDateTime);
          Fields.Add('HG_USUBAJA',   Sesion.UserId);

          SqlType := stUpdate;
        end
      else if ModoABM = maAlta then
        begin
          PrimaryKey.AddExpression('HG_ID', 'SEQ_LHG_ID.NEXTVAL');
          Fields.Add('HG_FECHAALTA', exDateTime);
          Fields.Add('HG_USUALTA',   Sesion.UserId);

          Fields.Add('HG_IDGESTOR',  frafpEstudio.Value);
          Fields.Add('HG_HONORARIO', edfpPorcentaje.Value, dtNumber);

          SqlType := stInsert;
        end;
    end;

  Result := inherited DoABM;
end;
{-------------------------------------------------------------------------------}
function TfrmPorcentajesHonorarios.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(frafpEstudio.IsEmpty, frafpEstudio.edCodigo, 'El estudio es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM LHG_HONORARIOGESTOR ' +
           'WHERE HG_FECHABAJA IS NULL ' +
             'AND HG_IDGESTOR = :IdGestor';
  Verificar(ExisteSqlEx(sSql, [frafpEstudio.Value]), nil, 'Ya existe un registro activo para el estudio.');

  Verificar(edfpPorcentaje.Value <= 0, edfpPorcentaje, 'El porcentaje de honorarios es obligatorio.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmPorcentajesHonorarios.fpAbmEnter(Sender: TObject);
begin
  frafpEstudio.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
end.
