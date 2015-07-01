unit unBuscarEmbargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmBuscarEmbargo = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    procedure GridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  	FEmbargoId: Integer;
    FFecha: TDateTime;
  	FImporte: Extended;
    FJuicioId: Integer;
  protected
  	procedure RefreshData; override;
  public
  	function Buscar(const aJuicioId: Integer = -1): Boolean;

  	property EmbargoId: Integer read FEmbargoId;
    property Fecha: TDateTime read FFecha;
  	property Importe: Extended read FImporte;
  end;

var
  frmBuscarEmbargo: TfrmBuscarEmbargo;

implementation

{$R *.dfm}

uses
	AnsiSql;

function TfrmBuscarEmbargo.Buscar(const aJuicioId: Integer = -1): Boolean;
begin
	FJuicioId := aJuicioId;
	ShowModal;

	Result := (FEmbargoId > 0);
end;


procedure TfrmBuscarEmbargo.RefreshData;
var
	sSql: String;
begin
	sSql :=
    'SELECT jt_numerocarpeta carpeta, jt_demandante demandante, jt_demandado demandado,' +
    			' NVL(jt_caratula, em_caratula) caratula, ju_descripcion jurisdiccion, fu_descripcion fuero,' +
          ' jz_descripcion juzgado, in_descripcion instancia, sc_descripcion secretaria, ba_nombre banco,' +
          ' cb_numero cuenta, em_importe importe, em_fecha fecha, em_oficio oficio, ee_descripcion estado,' +
          ' em_repetido repetido, em_observaciones observaciones, em_id, TRUNC(em_fechabaja) fechabaja' +
     ' FROM zba_banco, zcb_cuentabancaria, legales.ljt_juicioentramite, legales.lju_jurisdiccion, legales.lfu_fuero,' +
          ' legales.ljz_juzgado, legales.lin_instancia, legales.lsc_secretaria, lee_estadoembargo, lem_embargo' +
    ' WHERE ee_id = em_idestado' +
      ' AND cb_id(+) = em_idcuentabancaria' +
      ' AND ba_id(+) = cb_idbanco' +
      ' AND jt_id = em_idjuicio' +
      ' AND in_id = jz_idinstancia' +
      ' AND ju_id = jt_idjurisdiccion' +
      ' AND fu_id = jt_idfuero' +
      ' AND jz_id = jt_idjuzgado' +
      ' AND sc_id = jt_idsecretaria' +
      ' AND em_fechabaja IS NULL';

	if FJuicioId > -1 then
  begin
  	sSql := sSql + ' AND em_idjuicio = ' + SqlValue(FJuicioId);
    sSql := sSql + ' AND ee_id = 3';
  end;

	sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

	inherited;
end;


procedure TfrmBuscarEmbargo.GridDblClick(Sender: TObject);
begin
	if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
  	FEmbargoId := sdqConsulta.FieldByName('em_id').AsInteger;
    FFecha 		 := sdqConsulta.FieldByName('fecha').AsDateTime;
    FImporte 	 := sdqConsulta.FieldByName('importe').AsFloat;
  	Close;
  end;
end;

procedure TfrmBuscarEmbargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
	Action := caFree;
end;

procedure TfrmBuscarEmbargo.FormCreate(Sender: TObject);
begin
  inherited;

  FEmbargoId := 0;
  FImporte := 0;
end;

procedure TfrmBuscarEmbargo.FSFormShow(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmBuscarEmbargo.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
	TFloatField(sdqConsulta.FieldByName('Importe')).Currency := True;
end;

end.
