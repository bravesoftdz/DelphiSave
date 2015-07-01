unit unBuscarJuicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmBuscarJuicio = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    procedure GridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  	FImporte: Extended;
    FJuicioId: Integer;
  protected
  	procedure RefreshData; override;
  public
  	function Buscar(const aJuicioId: Integer = -1): Boolean;

  	property JuicioId: Integer read FJuicioId;
  	property Importe: Extended read FImporte;
  end;

var
  frmBuscarJuicio: TfrmBuscarJuicio;

implementation

{$R *.dfm}

uses
	AnsiSql;

function TfrmBuscarJuicio.Buscar(const aJuicioId: Integer = -1): Boolean;
begin
	FJuicioId := aJuicioId;
	ShowModal;

	Result := (FJuicioId > 0);
end;

procedure TfrmBuscarJuicio.RefreshData;
var
	sSql: String;
begin
	sSql := 'SELECT jt_numerocarpeta carpeta, jt_demandante demandante, jt_demandado demandado, jt_caratula caratula, ' +
                 'ju_descripcion jurisdiccion, fu_descripcion fuero, jz_descripcion juzgado, in_descripcion instancia, ' +
                 'sc_descripcion secretaria, jt_importerecursoextraord importe, ' +
                 'ej_descripcion estado, jt_id, TRUNC(jt_fechabaja) fechabaja ' +
            'FROM legales.ljt_juicioentramite, legales.lju_jurisdiccion, legales.lfu_fuero, ' +
                 'legales.ljz_juzgado, legales.lin_instancia, legales.lsc_secretaria, legales.lej_estadojuicio ' +
           'WHERE ej_id = jt_idestado ' +
             'AND in_id = jz_idinstancia ' +
             'AND ju_id = jt_idjurisdiccion ' +
             'AND fu_id = jt_idfuero ' +
             'AND jz_id = jt_idjuzgado ' +
             'AND sc_id = jt_idsecretaria ' +
             'AND jt_fechabaja IS NULL ' +
             'AND jt_importerecursoextraord <> 0 ';

	if FJuicioId > -1 then
  begin
  	sSql := sSql + ' AND jt_id = ' + SqlValue(FJuicioId);
  end;

	sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

	inherited;
end;

procedure TfrmBuscarJuicio.GridDblClick(Sender: TObject);
begin
	if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
  	FJuicioId := sdqConsulta.FieldByName('jt_id').AsInteger;
    FImporte 	:= sdqConsulta.FieldByName('importe').AsFloat;
  	Close;
  end;
end;

procedure TfrmBuscarJuicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
	Action := caFree;
end;

procedure TfrmBuscarJuicio.FormCreate(Sender: TObject);
begin
  inherited;

  FJuicioId := 0;
  FImporte := 0;
end;

procedure TfrmBuscarJuicio.FSFormShow(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmBuscarJuicio.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
	TFloatField(sdqConsulta.FieldByName('Importe')).Currency := True;
end;

end.
