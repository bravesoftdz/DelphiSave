unit unListRecalSeguimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, CheckPanel,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmListRecalSeguimiento = class(TfrmCustomConsulta)
    chkFechaAmerita: TCheckPanel;
    Label1: TLabel;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    sdqResponsables: TSDQuery;
    dsResponsables: TDataSource;
    chkResponsable: TCheckPanel;
    cmbResponsable: TDBCheckCombo;
    chkEmpresa: TCheckPanel;
    fraEmpresa: TfraEmpresa;
    procedure tbRefrescarClick(Sender: TObject);
    procedure chkFechaAmeritaChange(Sender: TObject);
    procedure chkResponsableChange(Sender: TObject);
    procedure chkEmpresaChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    function Validar: boolean;
  public
    { Public declarations }
  end;

var
  frmListRecalSeguimiento: TfrmListRecalSeguimiento;

implementation

uses AnsiSql, CustomDlgs;

{$R *.dfm}

procedure TfrmListRecalSeguimiento.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  if Validar then
  begin
      sSql := ' SELECT a.er_codigo, a.er_siniestro, a.er_orden, art.reca.get_recaida_pme(a.er_siniestro,a.er_orden) recaida, ' +
                     ' art.consultas.get_nombre_trabajador(ex_cuil) nombretrab, ' +
                     ' art.consultas.get_localidad_trabajador(ex_cuil) localidadtrab, ' +
                     ' art.utiles.armar_cuit(ex_cuit) cuit, ' +
                     ' art.afiliacion.get_nombreempresa(ex_cuit) nombreempresa, ' +
                     ' dc_localidad localidademp, art.reca.get_responsableevento(a.er_siniestro, a.er_orden, ''095'', ''093'') responsable, ' +
                     ' art.reca.get_fecharecapresunta(a.er_siniestro,a.er_orden) fechaamerita, ' +
                     ' art.reca.get_fechaulteventoreca(ex_siniestro, ex_orden) fecultev, ' +
                     ' art.reca.get_codigoulteventoreca(ex_siniestro, ex_orden) codigoultev, ' +
                     ' (art.actualdate - art.reca.get_fechaulteventoreca(ex_siniestro, ex_orden)) diferenciadias, ' +   
                     ' art.utiles.armar_cuit (ex_cuil) cuil, ex_fechaaccidente, art.discoverer.get_eventoreca (''FECHA'', ' +
                                                                                ' ex_siniestro, ex_orden, ''100'') fecha100, ' +
                     ' (SELECT MAX (er_fecha) ' +
                        ' FROM art.ser_evemedrecalif, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0) ultfechaseguim, ' +
                     ' (SELECT MAX (er_fecha) ' +
                        ' FROM art.ser_evemedrecalif c, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0 ' +
                         ' AND EXISTS (SELECT 1 ' +
                                       ' FROM art.ser_evemedrecalif d, SIN.sem_eventomedicoreca ' +
                                      ' WHERE d.er_siniestro = c.er_siniestro ' +
                                        ' AND d.er_orden = c.er_orden ' +
                                        ' AND d.er_codigo = em_codigo ' +
                                        ' AND em_seguimientolistado = ''S'' ' +
                                        ' AND d.er_evento > c.er_evento)) anteultfechaseguim, ' +
                     ' (SELECT er_observaciones ' +
                        ' FROM art.ser_evemedrecalif e, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0 ' +
                         ' AND er_evento = ' +
                                ' (SELECT MAX (f.er_evento) ' +
                                   ' FROM art.ser_evemedrecalif f, SIN.sem_eventomedicoreca ' +
                                  ' WHERE f.er_siniestro = e.er_siniestro ' +
                                    ' AND f.er_orden = e.er_orden ' +
                                    ' AND f.er_codigo = em_codigo ' +
                                    ' AND em_seguimientolistado = ''S'')) observultseguim, ' +
                     ' (SELECT MAX (er_fecha) ' +
                        ' FROM art.ser_evemedrecalif, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0) ' +
                   ' - (SELECT MAX (er_fecha) ' +
                        ' FROM art.ser_evemedrecalif c, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0 ' +
                         ' AND EXISTS ( ' +
                                ' SELECT 1 ' +
                                  ' FROM art.ser_evemedrecalif d, SIN.sem_eventomedicoreca ' +
                                 ' WHERE d.er_siniestro = c.er_siniestro ' +
                                   ' AND d.er_orden = c.er_orden ' +
                                   ' AND d.er_codigo = em_codigo ' +
                                   ' AND em_seguimientolistado = ''S'' ' +
                                   ' AND d.er_evento > c.er_evento)) diasultanteultseguim, art.actualdate ' +
                   ' - (SELECT MAX (er_fecha) ' +
                        ' FROM art.ser_evemedrecalif, SIN.sem_eventomedicoreca ' +
                       ' WHERE er_siniestro = ex_siniestro ' +
                         ' AND er_orden = ex_orden ' +
                         ' AND er_codigo = em_codigo ' +
                         ' AND em_seguimientolistado = ''S'' ' +
                         ' AND er_evento > 0) diassin115, ' +
                      ' art.discoverer.get_eventoreca (''FECHA'', ex_siniestro, ex_orden, ''054'') fecha054, ' +
                      ' art.reca.get_usuariocarga (ex_siniestro, ex_orden, ''042'') usuario042, ' +
                     ' NVL(art.discoverer.get_eventoreca(''FECHA'', ex_siniestro, ex_orden, ''095''), ' +
                     ' art.discoverer.get_eventoreca(''FECHA'', ex_siniestro, ex_orden, ''093'')) fecha095093, ' +
                     ' pe_fechaaltamedica, pe_fechaaltalaboral, ' +
                     ' art.discoverer.get_eventoreca(''CAPI'', ex_siniestro, ex_orden, ''054'') capint' +

                ' FROM art.sex_expedientes, aem_empresa, art.mre_responsable, art.ser_evemedrecalif a, adc_domiciliocontrato, ' +
                     ' SIN.spe_partedeegreso, SIN.sem_eventomedicoreca b ' +
               ' WHERE ex_id = pe_idexpediente ' +
                 ' AND er_codigo = em_codigo ' +
                 ' AND ex_cuit = em_cuit ' +
                 '  AND NOT EXISTS ( SELECT 1 ' +
                                     ' FROM art.ser_evemedrecalif c, SIN.sem_eventomedicoreca d ' +
                                    ' WHERE a.er_siniestro = c.er_siniestro ' +
                                      ' AND a.er_orden = c.er_orden ' +
                                      ' AND c.er_codigo = d.em_codigo ' +
                                      ' AND d.em_seguimientosin = ''S''  ' +
                                      ' AND c.er_evento > 0) ' +
                  ' AND dc_tipo = ''P''  ' +
                  ' AND dc_contrato = art.get_vultcontrato(em_cuit) ' +
                  ' AND a.er_responsable = re_responsable  ' +
                  ' AND ex_siniestro = er_siniestro  ' +
                  ' AND ex_orden = er_orden  ' +
               //   ' AND ex_recaida = 0  ' +          // Sole quiere ver todas las recaidas, porque sino no salen algunos siniestros que tienen recaida mayor a cero y son de recalificacion (pe_recalificacion = 'S').
                  ' AND er_evento > 0  ' +
                  ' AND pe_recalificacion = ''S'' ' +
                  ' AND art.reca.get_recaida_pme(er_siniestro,er_orden) = ex_recaida ' +
                  ' AND em_altareca = ''S'' ' +
                  ' AND er_fecha BETWEEN ' + deFechaDesde.SqlText +
                                   ' AND ' + deFechaHasta.SqlText;

               // tarda mucho por la spe...

      if chkResponsable.Checked and (cmbResponsable.CheckedCount > 0) then
        sSql := sSql + ' AND A.er_responsable ' + cmbResponsable.InSql;
      if chkEmpresa.Checked and (not fraEmpresa.IsEmpty) then
        sSql := sSql + ' AND ex_cuit = ' + SQLValue(fraEmpresa.CUIT);

      sdqConsulta.SQL.Text := sSql;
      inherited;
  end;
end;

procedure TfrmListRecalSeguimiento.chkFechaAmeritaChange(Sender: TObject);
begin
  deFechaDesde.Enabled := chkFechaAmerita.Checked;
  deFechaHasta.Enabled := chkFechaAmerita.Checked;

  if not chkFechaAmerita.Checked then
  begin
    deFechaDesde.Clear;
    deFechaHasta.Clear;
  end;
end;

procedure TfrmListRecalSeguimiento.chkResponsableChange(Sender: TObject);
begin
  cmbResponsable.Enabled := chkResponsable.Checked;
  if not chkResponsable.Checked then
    cmbResponsable.Clear;
end;

procedure TfrmListRecalSeguimiento.chkEmpresaChange(Sender: TObject);
begin
  fraEmpresa.Enabled := chkEmpresa.Checked;
  if not chkEmpresa.Checked then
    fraEmpresa.Clear;
end;

procedure TfrmListRecalSeguimiento.tbLimpiarClick(Sender: TObject);
begin
  chkFechaAmerita.Checked := False;
  chkResponsable.Checked  := False;
  chkEmpresa.Checked      := False;
  sdqConsulta.Close;
end;

function TfrmListRecalSeguimiento.Validar: boolean;
begin
  Verificar(deFechaDesde.IsEmpty or deFechaHasta.IsEmpty, chkFechaAmerita, 'Debe completar la Fecha Desde y Hasta de la Fecha Amerita');
  Result := True;
end;


end.
