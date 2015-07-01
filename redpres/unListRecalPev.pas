unit unListRecalPev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, ImgList, StdCtrls,
  CheckCombo, Mask, ToolEdit, DateComboBox, DBCheckCombo,
  unFraEmpresa, unArtDBAwareFrame, unArtDbFrame, PatternEdit, ComboEditor,
  General;

type
  TfrmListRecalPev = class(TfrmCustomConsulta)
    imgGenBW: TImageList;
    imgGenColor: TImageList;
    SDQEventos: TSDQuery;
    Label1: TLabel;
    EvDde: TDateComboBox;
    Label2: TLabel;
    EvHta: TDateComboBox;
    Label3: TLabel;
    Evento: TDBCheckCombo;
    DSEventos: TDataSource;
    fraProf: TfraCodigoDescripcion;
    Label4: TLabel;
    Label5: TLabel;
    fraEmpresa: TfraEmpresa;
    Evcon: TDBCheckCombo;
    Evsin: TDBCheckCombo;
    Label7: TLabel;
    Label6: TLabel;
    LblTotal: TLabel;
    cmbResponsable: TDBCheckCombo;
    dsResponsables: TDataSource;
    sdqResponsables: TSDQuery;
    StatusBar: TStatusBar;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbMostrarFiltrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListRecalPev: TfrmListRecalPev;

implementation

uses unPrincipal, AnsiSql, SqlFuncs;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmListRecalPev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalPev.FormCreate(Sender: TObject);
begin
  inherited;
  SDQEventos.Open;
  sdqResponsables.Open;

  fraProf.TableName    := 'MAU_AUDITORES';
  fraProf.FieldID      := 'AU_AUDITOR';
  fraProf.FieldCodigo  := 'AU_AUDITOR';
  fraProf.FieldDesc    := 'AU_NOMBRE';
  fraProf.FieldBaja    := 'AU_FBAJA';
  fraProf.ShowBajas    := True;

  tbMostrarFiltros.ImageIndex := 18;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalPev.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  Evento.Clear;
  Evento.ClearChecks;
  Evcon.Clear;
  Evcon.ClearChecks;
  Evsin.Clear;
  Evsin.ClearChecks;
  Evdde.Clear;
  Evhta.Clear;
  cmbResponsable.Clear;
  fraProf.Clear;
  fraEmpresa.Clear;
  evento.SetFocus;
  StatusBar.Panels[0].Text := '';
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalPev.tbRefrescarClick(Sender: TObject);
var
   sSql:String;
begin
  sSql := 'SELECT er_siniestro Siniestro, er_orden Orden, tj_nombre Nombre, ' +
                ' ex_fechaaccidente Accidente, er_codigo Evento, er_fecha Fecha, ' +
                ' re_nombre Responsable, au_nombre Profesional, ' +
                ' gp_nombre g_trabajo, lg_nombre delegacion, ex_cuit, em_nombre, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor ' + 
            'FROM aem_empresa, ctj_trabajadores, sex_expedientes, mau_auditores, ' +
                ' mre_responsable, mgp_gtrabajo, dlg_delegaciones, ser_evemedrecalif a ' +
          ' WHERE ex_recaida = 0 ' +
            ' AND em_cuit = ex_cuit ' +
            ' AND tj_cuil = ex_cuil ' +
            ' AND ex_gtrabajo = gp_codigo ' +
            ' AND ex_delegacion = lg_codigo ' +
            ' AND er_evento > 0 ' +
            ' AND er_auditor = au_auditor(+) ' +
            ' AND er_responsable = re_responsable(+) ' +
            ' AND er_siniestro = ex_siniestro ' +
            ' AND er_orden = ex_orden ';

  if Evento.InSql <> '' then
    sSql := sSql + ' AND er_codigo ' + Evento.InSql;

  sSql := sSql + SqlBetweenDateTime(' AND er_fecha ', Evdde.Date, Evhta.Date, True);
{
  if (not Evdde.IsEmpty) and (not EvHta.IsEmpty) then
    sSql:= sSql + ' AND er_fecha BETWEEN ' + Evdde.SqlText + ' AND ' + Evhta.SqlText;
}
  if (cmbResponsable.CheckedCount > 0) then
    sSql:= sSql + ' AND er_responsable ' + cmbResponsable.InSql;

  if not fraProf.IsEmpty then
    sSql:= sSql + ' AND er_auditor = ' + fraProf.edCodigo.Text;

  if not fraEmpresa.IsEmpty then
  begin
    sSql:= sSql + ' AND ex_cuit = ' + SQLValue(fraEmpresa.CUIT);
    queryprint.SubTitle.Text := 'Empresa: ' + fraEmpresa.RazonSocial;
  end;

  if (Evcon.InSql <> '') then
    sSql:= sSql + ' AND EXISTS (SELECT 1 FROM ser_evemedrecalif b ' +
                                      ' WHERE a.er_siniestro = b.er_siniestro ' +
                                        ' AND a.er_orden = b.er_orden ' +
                                        ' AND b.er_evento > 0 ' +
                                        ' AND b.er_codigo ' + Evcon.InSql  + ')';

  if (Evsin.InSql <> '') then
    sSql:= sSql + ' AND NOT EXISTS (SELECT 1 FROM ser_evemedrecalif c ' +
                                          ' WHERE a.er_siniestro = c.er_siniestro ' +
                                            ' AND a.er_orden = c.er_orden ' +
                                            ' AND c.er_evento > 0 ' +
                                            ' AND c.er_codigo ' + Evsin.InSql  + ')';

  sdqconsulta.SQL.Text := sSql;
  inherited;

  StatusBar.Panels[0].Text := iif (sdqConsulta.IsEmpty, '', 'Registros: ' + IntToStr(sdqConsulta.RecordCount))
  //lbltotal.caption:= 'Registros: ' + inttostr(sdqconsulta.RecordCount);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalPev.tbMostrarFiltrosClick(Sender: TObject);
begin
  inherited;
//  if tbMostrarFiltros.Down then begin
//     pnlFiltros.Visible    := False;
//     tbMostrarFiltros.Hint := 'Mostrar Filtros';
//     tbMostrarFiltros.ImageIndex := 17;
//     if Visible and DBGrid.CanFocus then
//        DBGrid.SetFocus;
//  end else begin
//     pnlFiltros.Visible    := True;
//     tbMostrarFiltros.Hint := 'Ocultar Filtros';
//     tbMostrarFiltros.ImageIndex := 18;
//     if Visible then
//        SelectNext(pnlFiltros, True, True);
//  end;
end;
{-------------------------------------------------------------------------------}
end.





