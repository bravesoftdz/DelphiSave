unit unListRecalGen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  ImgList, StdCtrls, Mask, ToolEdit, DateComboBox, CheckPanel, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraDelegacion;

type
  TfrmListRecalGen = class(TfrmCustomConsulta)
    imgGenColor: TImageList;
    imgGenBW: TImageList;
    GroupBox1: TGroupBox;
    EgrHta: TDateComboBox;
    Label4: TLabel;
    EgrDde: TDateComboBox;
    Label3: TLabel;
    fraDelegacion: TfraDelegacion;
    Label1: TLabel;
    rgVer: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    procedure OptSAClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListRecalGen: TfrmListRecalGen;

implementation

uses AnsiSql;

{$R *.DFM}

{
  Ramiro:
     En este evento de acá abajo, no queda muy claro a simple vista, donde comienza y termina cada bloque, yo te diría
  que le dediques un tiempito y ordenes el código, como para que lo pueda entender cualquiera.
                                                                                   Fede (buchonazo!).

  Fede:
    No me hiché la' bola' loco, si está clarísimo....ademas, si me queres decir algo, decimelo en la cara.
                                                                                    Ramiro.
}

{-------------------------------------------------------------------------------}
procedure TfrmListRecalGen.tbRefrescarClick(Sender: TObject);
var
  sSql, pendFrom, pendWhere :String;
begin
  pendFrom := '';
  pendWhere := '';
  if rgVer.ItemIndex = 0 then     //Pendientes
  begin
    pendFrom := ' art.sau_autorizaciones, ';
    pendWhere := ' AND au_idexpediente = ex_id AND au_estado = ''P'' ';
  end;

  sSql := ' SELECT ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, er_fechaalta fecha, pe_fechaaltalaboral falta, ' +
                 ' tj_nombre trabajador, tj_localidad localidadtrab, NVL(ex_fecharecaida, ex_fechaaccidente) faccid, ' +
                 ' pe_diasbajatotales diasbaja, utiles.armar_cuit(ex_cuil) cuil, gp_nombre gtrabajo, lg_nombre delegacion, ' +
                 ' utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa, dc_localidad localidademp, ' +
                 ' siniestro.get_usuariogestor(ex_id) usugestor, em_descripcion evento, ' +
                 ' ex_diagnostico, ex_frechazomed, ' +
                 ' ex_rechazomed || decode(ex_rechazomed, null, null, '' - ''||tr_descripcion) AceptRech ' +  // TK 17916
            ' FROM sex_expedientes, ctj_trabajador, mgp_gtrabajo, dlg_delegaciones, ' +
                 ' aem_empresa, ser_evemedrecalif, adc_domiciliocontrato, ' + pendFrom +
                 ' sin.spe_partedeegreso, sin.sem_eventomedicoreca, str_tiporechazosin ' +   // TK 17916
           ' WHERE ex_id = pe_idexpediente ' +
             ' AND er_codigo = em_codigo ' +
             ' AND ex_cuil = tj_cuil ' +
             ' AND ex_gtrabajo = gp_codigo ' +
             ' AND ex_delegacion = lg_codigo ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND dc_tipo = ''P'' ' +
             ' AND dc_contrato = art.get_vultcontrato(em_cuit) ' +
             ' AND ex_siniestro = er_siniestro ' +
             ' AND ex_orden = er_orden ' +
           //  ' AND ex_recaida = 0 ' +           // por TK 24009
             ' AND er_evento > 0 ' +
             ' AND ex_rechazomed=tr_codigo(+) ' +  // TK 17916
             ' AND er_codigo IN (''002'', ''003'', ''005A'', ''006A'', ''006B'', ''006C'') ' +
             ' AND er_fechaalta BETWEEN ' + egrdde.SqlText  + ' AND ' + egrhta.SqlText  +
             pendWhere +
             ' AND NOT EXISTS(SELECT 1 ' +
                              ' FROM ser_evemedrecalif ' +
                             ' WHERE er_siniestro = ex_siniestro ' +
                               ' AND er_orden = ex_orden ' +
                               ' AND er_evento > 0 ' +
                               ' AND NVL(er_codigo, '' '') IN (''010'', ''011'', ''030'', ''033'', ''035'',  ' +
                                                             ' ''036'', ''042'', ''045'', ''052'', ''091'')) ' +
             ' AND ((pe_recalificacion = ''S'') or EXISTS(SELECT 1 FROM art.sev_eventosdetramite ' +      // TK 24009 (agrego todo este AND)
                                                         ' WHERE ev_siniestro = ex_siniestro ' +
                                                           ' AND ev_orden = ex_orden ' +
                                                           ' AND ev_recaida = ex_recaida ' +
                                                           ' AND ev_evento > 0 ' +
                                                           ' AND ev_recalificacion = ''S'')) ';
  if not(fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND NVL(ex_delegacion, '' '') = ' + SqlValue(fraDelegacion.Codigo);

  sSql := sSql +
   ' UNION ' +
   ' SELECT ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, ' +
         ' er_fechaalta fecha, pe_fechaaltalaboral falta, tj_nombre trabajador, ' +
         ' tj_localidad localidadtrab, ' +
         ' NVL (ex_fecharecaida, ex_fechaaccidente) faccid, ' +
         ' pe_diasbajatotales diasbaja, utiles.armar_cuit (ex_cuil) cuil, ' +
         ' gp_nombre gtrabajo, lg_nombre delegacion, ' +
         ' utiles.armar_cuit (ex_cuit) cuit, em_nombre empresa, ' +
         ' dc_localidad localidademp, siniestro.get_usuariogestor (ex_id) usugestor, ' +
         ' em_descripcion evento, ex_diagnostico, ex_frechazomed, ' +
         ' ex_rechazomed  || DECODE (ex_rechazomed, NULL, NULL, '' - '' || tr_descripcion) aceptrech ' +
    ' FROM sex_expedientes, ' +
         ' ctj_trabajador, ' +
         ' mgp_gtrabajo, ' +
         ' dlg_delegaciones, ' +
         ' aem_empresa, ' +
         ' ser_evemedrecalif a, ' +
         ' adc_domiciliocontrato, ' +
         ' SIN.spe_partedeegreso, ' +
         ' SIN.sem_eventomedicoreca, ' +
         ' str_tiporechazosin, ' + pendFrom +
         ' art.spv_parteevolutivo ' +
   ' WHERE ex_id = pe_idexpediente(+) ' +
     ' AND er_codigo = em_codigo ' +
     ' AND ex_cuil = tj_cuil ' +
     ' AND ex_gtrabajo = gp_codigo ' +
     ' AND ex_delegacion = lg_codigo ' +
     ' AND ex_cuit = em_cuit ' +
     ' AND dc_tipo = ''P'' ' +
     ' AND dc_contrato = art.get_vultcontrato (em_cuit) ' +
     ' AND ex_siniestro = er_siniestro ' +
     ' AND ex_orden = er_orden ' +
     ' AND ex_recaida = er_reca_evo ' +
     ' AND er_siniestro = pv_siniestro ' +
     ' AND er_orden = pv_orden ' +
     ' AND er_reca_evo = pv_recaida ' +
     ' AND er_evolutivo = pv_nroparte ' +
     ' AND pv_recalificacion = ''S'' ' +
     ' AND er_evento > 0 ' +
     ' AND ex_rechazomed = tr_codigo(+) ' +
     ' AND er_fechaalta BETWEEN ' + egrdde.SqlText  + ' AND ' + egrhta.SqlText  +
     pendWhere +
     ' AND NOT EXISTS ( ' +
            ' SELECT 1 ' +
             ' FROM ser_evemedrecalif b' +
            ' WHERE b.er_siniestro = ex_siniestro ' +
              ' AND b.er_orden = ex_orden ' +
              ' AND b.er_evento > 0 ' +
              ' AND b.er_fecha >= a.er_fecha ' +
              ' AND NVL (er_codigo, '' '') IN ' +
                     ' (''010'', ''011'', ''030'', ''033'', ''035'', ''036'', ''042'', ''045'', ''052'', ''091'')) ';

  if not(fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND NVL(ex_delegacion, '' '') = ' + SqlValue(fraDelegacion.Codigo);

    //camarillo - agregado de las citaciones con recaida, pero como ser_evemedrecalif no tiene recaida
    //se toman los eventos de apertura (1,2,3) que tienen fecha de sugerencia mayor que un evento
    //de cierre (95,93,35,36,33)
  sSql := sSql + ' UNION ' +    // TK 24009: saque el "all" al "union"
          ' SELECT ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, er_fechaalta fecha, pe_fechaaltalaboral falta, ' +
                 ' tj_nombre trabajador, tj_localidad localidadtrab, NVL(ex_fecharecaida, ex_fechaaccidente) faccid, ' +
                 ' pe_diasbajatotales diasbaja, utiles.armar_cuit(ex_cuil) cuil, gp_nombre gtrabajo, lg_nombre delegacion, ' +
                 ' utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa, dc_localidad localidademp, ' +
                 ' siniestro.get_usuariogestor(ex_id) usugestor, em_descripcion evento, ' +
                 ' ex_diagnostico, ex_frechazomed, ' +
                 ' ex_rechazomed || decode(ex_rechazomed, null, null, '' - ''||tr_descripcion) AceptRech ' +   // TK 17916
            ' FROM sex_expedientes, ctj_trabajador, mgp_gtrabajo, dlg_delegaciones, ' +
                 ' aem_empresa, ser_evemedrecalif a, adc_domiciliocontrato, ' + pendFrom +
                 ' sin.spe_partedeegreso, sin.sem_eventomedicoreca, str_tiporechazosin ' +   // TK 17916
           ' WHERE ex_id = pe_idexpediente ' +
             ' AND er_codigo = em_codigo ' +
             ' AND ex_cuil = tj_cuil ' +
             ' AND ex_gtrabajo = gp_codigo ' +
             ' AND ex_delegacion = lg_codigo ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND dc_tipo = ''P'' ' +
             ' AND dc_contrato = art.get_vultcontrato(em_cuit) ' +
             ' AND ex_siniestro = er_siniestro ' +
             ' AND ex_orden = er_orden ' +
           //  ' AND ex_recaida > 0 ' +             // por TK 24009
             ' AND ex_recaida = er_reca_pme ' +     // por TK 24009
             ' AND er_evento > 0 ' +
             ' AND ex_rechazomed=tr_codigo(+) ' +   // TK 17916
             ' AND er_codigo IN (''002'', ''003'', ''005A'', ''006A'', ''006B'', ''006C'') ' +
             ' AND er_fechaalta BETWEEN ' + egrdde.SqlText  + ' AND ' + egrhta.SqlText  +
             pendWhere +
             ' AND er_fecha > (SELECT NVL(MAX(er_fecha), TO_DATE(''01/01/1990'', ''dd/mm/yyyy'')) ' +
                               ' FROM ser_evemedrecalif e ' +
                              ' WHERE e.er_siniestro = ex_siniestro ' +
                                ' AND e.er_orden = ex_orden ' +
                                ' AND e.er_evento > 0 ' +
                                ' AND e.er_codigo IN (''095'', ''093'', ''035'', ''036'', ''033'')) ' +
             ' AND NOT EXISTS(SELECT 1 ' +
                              ' FROM ser_evemedrecalif b ' +
                             ' WHERE b.er_siniestro = ex_siniestro ' +
                               ' AND b.er_orden = ex_orden ' +
                               ' AND b.er_evento > 0 ' +
                               ' AND b.er_codigo IN (''010'', ''011'', ''030'', ''033'', ''035'',  ' +
                                                   ' ''036'', ''042'', ''045'', ''052'', ''091'') ' +
                               ' AND b.er_fecha >= a.er_fecha) ' +
             ' AND ((pe_recalificacion = ''S'') or EXISTS(SELECT 1 FROM art.sev_eventosdetramite ' +    // TK 24009 (agrego todo este AND)
                                                         ' WHERE ev_siniestro = ex_siniestro ' +
                                                           ' AND ev_orden = ex_orden ' +
                                                           ' AND ev_recaida = ex_recaida ' +
                                                           ' AND ev_evento > 0 ' +
                                                           ' AND ev_recalificacion = ''S'')) ';

  if not(fraDelegacion.IsEmpty) then
    sSql := sSql + ' AND NVL(ex_delegacion, '' '') = ' + SqlValue(fraDelegacion.Codigo);

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalGen.OptSAClick(Sender: TObject);
begin
  inherited;
  tbnuevo.down    := False;
  tbnuevo.enabled := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalGen.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  Egrdde.Clear;
  Egrhta.Clear;
  fraDelegacion.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListRecalGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
