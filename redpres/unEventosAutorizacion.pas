unit unEventosAutorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls, Mask, ToolEdit, DateComboBox, ansisql, general, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo;

type
  TfrmEventosAutorizacion = class(TfrmCustomConsulta)
    gbEvento: TGroupBox;
    gbFecha: TGroupBox;
    deFechaDesde: TDateComboBox;
    Label1: TLabel;
    deFechaHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    rgVer: TRadioGroup;
    sdqEventos: TSDQuery;
    dsEventos: TDataSource;
    dbchkEvento: TDBCheckCombo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEventosAutorizacion: TfrmEventosAutorizacion;

implementation

{$R *.dfm}

procedure TfrmEventosAutorizacion.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT art.utiles.armar_siniestro(er_siniestro, er_orden, ' +
                 ' art.SIN.get_recaida_recalificacion (er_siniestro, er_orden)) siniestro, ' +
                 ' tj_nombre, re_nombre, er_evento, er_fecha, er_codigo ' +
            ' FROM SIN.sem_eventomedicoreca, art.sau_autorizaciones, ' +
                 ' art.ser_evemedrecalif, art.sex_expedientes, ' +
                 ' comunes.ctj_trabajador, art.mre_responsable ' +
           ' WHERE em_generaautorizacion = ''S'' ' +
             ' AND em_codigo = er_codigo ' +
             ' AND er_evento > 0 ' +
             ' AND ex_siniestro = er_siniestro ' +
             ' AND ex_orden = er_orden ' +
             ' AND ex_recaida = art.SIN.get_recaida_recalificacion (er_siniestro, er_orden) ' +
             ' AND tj_id = ex_idtrabajador ' +
             ' AND er_responsable = re_responsable(+) ' +
             ' AND ex_siniestro = au_siniestro ' +
             ' AND ex_orden = au_orden ' +
             ' AND ex_recaida = au_recaida ' +
             ' AND er_autorizacion = au_numauto ';

  if dbchkEvento.Text <> '' then
    ssql := ssql + ' AND er_codigo ' + dbchkEvento.InSql;

  if not deFechaDesde.IsEmpty then
    ssql := ssql + ' AND er_fecha >= ' + SqlValue(deFechaDesde.Text);

  if not deFechaHasta.IsEmpty then
    ssql := ssql + ' AND er_fecha <= ' + SqlValue(deFechaHasta.Text);

  if rgVer.ItemIndex = 0 then
    ssql := ssql + ' AND NVL(au_estado, '' '') = ''P'' ';

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

procedure TfrmEventosAutorizacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  dbchkEvento.Clear;
  deFechaDesde.Clear;
  deFechaHasta.Clear;
  rgVer.ItemIndex := 1;
end;

end.
