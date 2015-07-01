unit unPorcentajesGPBA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PeriodoPicker, Mask,
  PatternEdit, IntEdit, ToolEdit, CurrEdit;

type
  TfrmPorcentajesGPBA = class(TfrmCustomGridABM)
    gbPeriodo: TGroupBox;
    ppPeriodo: TPeriodoPicker;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    ppPeriodoCarga: TPeriodoPicker;
    Label1: TLabel;
    edCapitasGPBACarga: TIntEdit;
    Label2: TLabel;
    Label3: TLabel;
    edCapitasARTCarga: TIntEdit;
    edPorcentajeCarga: TCurrencyEdit;
    Label4: TLabel;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  protected
    procedure ClearControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPorcentajesGPBA: TfrmPorcentajesGPBA;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion;

{$R *.dfm}

procedure TfrmPorcentajesGPBA.ClearControls;
begin
  ppPeriodoCarga.Clear;
  edCapitasGPBACarga.Clear;
  edCapitasARTCarga.Clear;
  edPorcentajeCarga.Clear;
end;

function TfrmPorcentajesGPBA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
    begin
       Sql.PrimaryKey.Add('GP_ID',               sdqConsulta.FieldByName('ID').AsInteger);
       Sql.Fields.Add('GP_FECHABAJA',            exDateTime);
       Sql.Fields.Add('GP_USUBAJA',              Sesion.UserID);

       Sql.SqlType := stUpdate;
    end
  else
    begin
       if ModoABM = maAlta then
         begin
           Sql.PrimaryKey.Add('GP_ID',           GetSecNextVal('SEQ_OGP_ID'));
           Sql.Fields.Add('GP_FECHAALTA',        exDateTime);
           Sql.Fields.Add('GP_USUALTA',          Sesion.UserID);

           Sql.SqlType := stInsert;
         end;

       Sql.Fields.Add('GP_PERIODO',              ppPeriodoCarga.Periodo.Valor);
       Sql.Fields.Add('GP_CAPITASGPBA',          edCapitasGPBACarga.Value);
       Sql.Fields.Add('GP_CAPITASART',           edCapitasARTCarga.Value);
       Sql.Fields.Add('GP_PORCENTAJE',           edPorcentajeCarga.Value);
    end;

  Result := inherited DoABM;
end;

function TfrmPorcentajesGPBA.Validar: Boolean;
begin
  Verificar(ppPeriodoCarga.Periodo.Valor = '', ppPeriodoCarga, 'El periodo es obligatorio.');
  Verificar(edCapitasGPBACarga.Value <= 0, edCapitasGPBACarga, 'La cantidad de cápitas de GPBA es obligatoria.');
  Verificar(edCapitasARTCarga.Value <= 0, edCapitasARTCarga, 'La cantidad de cápitas de ART es obligatoria.');
  Verificar(edPorcentajeCarga.Value <= 0, edPorcentajeCarga, 'El porcentaje es obligatorio.');

  Result := True;
end;

procedure TfrmPorcentajesGPBA.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;
  ppPeriodo.Clear;

  inherited;
end;

procedure TfrmPorcentajesGPBA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OGP_GPBAPORCENTAJE';
  FieldBaja     := 'FECHA_BAJA';

  ShowActived := False;
end;

procedure TfrmPorcentajesGPBA.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sWhere := '';
  
  sSql := 'SELECT GP_PERIODO PERIODO, GP_CAPITASGPBA CAPITAS_GPBA, GP_CAPITASART CAPITAS_ART, ' +
                 'GP_PORCENTAJE PORCENTAJE, TRUNC(GP_FECHABAJA) FECHA_BAJA, GP_ID ID ' +
            'FROM OGP_GPBAPORCENTAJE ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND GP_FECHABAJA IS NULL';

  if ppPeriodo.Periodo.Valor <> '' then
    sWhere := sWhere + ' AND GP_PERIODO = ' + SqlValue(ppPeriodo.Periodo.Valor);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPorcentajesGPBA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('PORCENTAJE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCENTAJE')).DisplayFormat := '% 0.000;-% 0.000';
end;

end.

 