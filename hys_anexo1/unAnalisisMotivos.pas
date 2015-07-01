unit unAnalisisMotivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql, Mask,
  ToolEdit, DateComboBox, PatternEdit, IntEdit, unCustomConsulta, General,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unfraCtbTablas, JvgGroupBox;

type
  TfrmAnalisisMotivos = class(TfrmCustomConsulta)
    JvgGroupBox1: TJvgGroupBox;
    Label1: TLabel;
    fraOperativo: TfraCodigoDescripcion;
    chkOperativoActual: TCheckBox;
    chkConVisitas: TCheckBox;
    Label7: TLabel;
    fraTipo: TfraCtbTablas;
    dcbFechaHasta: TDateComboBox;
    Label6: TLabel;
    dcbFechaDesde: TDateComboBox;
    Label5: TLabel;
    fraEmpresa: TfraEmpresa;
    Label2: TLabel;
    Label3: TLabel;
    fraRanking: TfraCodigoDescripcion;
    Label4: TLabel;
    fraPreventor: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ShortCutControlShortCuts9ShortCutPress(Sender: TObject);
  protected
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnalisisMotivos: TfrmAnalisisMotivos;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAnalisisMotivos.FormCreate(Sender: TObject);
begin
  inherited;

  // Frames
  fraTipo.Clave := 'TFET';

  with fraOperativo do
  begin
    TableName    := 'art.pop_operativo';
    FieldID      := 'OP_CODIGO';
    FieldCodigo  := 'OP_CODIGO';
    FieldDesc    := 'OP_DESCRIPCION';
    FieldBaja    := 'OP_FECHABAJA';
    ShowBajas    := True;
  end;

  with fraEmpresa do
  begin
    ShowBajas := true;
    ExtraCondition := '     AND co_contrato = '+
                      ' (SELECT MAX (b.co_contrato) '+
                      '    FROM aco_contrato b '+
                      '   WHERE b.co_idempresa = em_id '+
                      '     AND NOT EXISTS (SELECT 1 '+
                      '    FROM art.abc_bajadecontrato '+
                      '   WHERE b.co_contrato = bc_contrato)) ';
  end;

  with fraRanking do
  begin
    TableName    := 'HYS.HRK_RANKING';
    FieldID      := 'RK_ID';
    FieldCodigo  := 'RK_ID';
    FieldDesc    := 'RK_DESCRIPCION';
    FieldBaja    := 'RK_FECHABAJA';
    ShowBajas    := true;
  end;

  with fraPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAnalisisMotivos.tbRefrescarClick(Sender: TObject);
begin
  VerificarMultiple (['Consulta Análisis de Motivos',
                      fraOperativo,
                      chkOperativoActual.Checked or ((not chkOperativoActual.Checked) and fraOperativo.IsSelected),
                      'Debe especificar un Operativo o selecciona Operativo Actual',
                      dcbFechaDesde,
                      dcbFechaDesde.IsEmpty or ((not dcbFechaDesde.IsEmpty) and dcbFechaDesde.IsValid),
                      'Debe ingresar una fecha válida',
                      dcbFechaHasta,
                      dcbFechaHasta.IsEmpty or ((not dcbFechaHasta.IsEmpty) and dcbFechaHasta.IsValid),
                      'Debe ingresar una fecha válida',
                      dcbFechaDesde,
                      dcbFechaDesde.Date <= dcbFechaHasta.Date,
                      'Debe ingresar un rango de fechas válido'
                     ]);

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(
    'SELECT em_cuit, em_nombre, es_nroestableci, es_nombre, ' +

    '       (SELECT it_nombre ' +
    '          FROM art.pit_firmantes ' +
    '         WHERE it_codigo = art.hys.get_preventor_estab (em_cuit, es_nroestableci, SYSDATE)) preventor, ' +

(*
    '       (SELECT it_nombre ' +
    '          FROM art.pit_firmantes ' +
    '         WHERE it_codigo = art.hys.get_preventor_referente (em_cuit, SYSDATE)) preventorref, ' +
*)
    '       (select s.it_nombre from art.pit_firmantes p, art.pit_firmantes s ' +
    '        where p.it_idsupervisor = s.it_id and p.it_codigo = art.hys.get_preventor_estab (em_cuit, es_nroestableci, SYSDATE)) it_coordinador, ' +

    '       NVL (art.hys.get_tipo_empresa (em_cuit, es_nroestableci, SYSDATE), ''GB'') tipo, ' +
    '       (SELECT rk_descripcion ' +
    '          FROM hys.hrk_ranking ' +
    '         WHERE rk_id = art.hys.get_rankingempresa (em_id, SYSDATE)) ranking, ' +
    '       (SELECT COUNT (*) ' +
    '          FROM art.pcm_capacitemp ' +
    '         WHERE cm_cuit = em_cuit ' +
    '           AND cm_estableci = es_nroestableci ' +
    '           AND cm_fecha BETWEEN NVL ((SELECT po_vigenciadesde ' +
    '                                        FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                       WHERE op_id = po_idoperativo ' +
                                              iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                         AND po_tipoempresa = art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE)), ' +
    '                                     TRUNC (SYSDATE, ''YYYY'') ' +
    '                                    ) ' +
    '                            AND NVL ((SELECT NVL (po_vigenciahasta, art.actualdate + 1) ' +
    '                                        FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                       WHERE op_id = po_idoperativo ' +
                                              iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                         AND po_tipoempresa = ''EP''), ' +
    '                                     SYSDATE ' +
    '                                    )) capefec, ' +
    '       (SELECT COUNT (*) ' +
    '          FROM art.poe_obradendetalle ' +
    '         WHERE (   (oe_tipo = ''ET'' AND oe_rubro = 15) ' +
    '                OR (oe_tipo = ''EP'' AND oe_rubro = 16) ' +
    '                OR (oe_tipo = ''GB'' AND oe_rubro = 15) ' +
    '               ) ' +
    '           AND oe_cuit = em_cuit ' +
    '           AND oe_estableci = es_nroestableci ' +
                iif (chkOperativoActual.Checked, 'AND oe_operativo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND oe_operativo = ' + SqlValue (fraOperativo.Codigo)) +
    '           AND oe_tipo = ' + iif (fraTipo.IsSelected, SqlValue(fraTipo.Value), 'art.hys.get_tipo_empresa (em_cuit, es_nroestableci, sysdate)') + ') capafallida, ' +
    '       (  (SELECT COUNT (DISTINCT rt_fecha) ' +
    '             FROM art.prt_riestrab ' +
    '            WHERE rt_cuit = em_cuit ' +
    '              AND rt_estableci = es_nroestableci ' +
    '              AND rt_fecha BETWEEN NVL ((SELECT po_vigenciadesde ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE)), ' +
    '                                        TRUNC (SYSDATE, ''YYYY'') ' +
    '                                       ) ' +
    '                               AND NVL ((SELECT NVL (po_vigenciahasta, art.actualdate + 1) ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = ''EP''), ' +
    '                                        SYSDATE ' +
    '                                       )) ' +
    '        + (SELECT COUNT (DISTINCT sr_fecha) ' +
    '             FROM art.psr_sinriesgo ' +
    '            WHERE sr_cuit = em_cuit ' +
    '              AND sr_estableci = es_nroestableci ' +
    '              AND sr_fecha BETWEEN NVL ((SELECT po_vigenciadesde ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE)), ' +
    '                                        TRUNC (SYSDATE, ''YYYY'') ' +
    '                                       ) ' +
    '                               AND NVL ((SELECT NVL (po_vigenciahasta, art.actualdate + 1) ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = ''EP''), ' +
    '                                        SYSDATE ' +
    '                                       )) ' +
    '       ) relevefec, ' +
    '       (SELECT COUNT (*) ' +
    '          FROM art.poe_obradendetalle ' +
    '         WHERE (   (oe_tipo = ''ET'' AND oe_rubro = 50) ' +
    '                OR (oe_tipo = ''EP'' AND oe_rubro = 50) ' +
    '                OR (oe_tipo = ''GB'' AND oe_rubro = 50) ' +
    '               ) ' +
    '           AND oe_cuit = em_cuit ' +
    '           AND oe_estableci = es_nroestableci ' +
                iif (chkOperativoActual.Checked, 'AND oe_operativo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND oe_operativo = ' + SqlValue (fraOperativo.Codigo)) +
    '           AND oe_tipo = ' + iif (fraTipo.IsSelected, SqlValue(fraTipo.Value), 'art.hys.get_tipo_empresa (em_cuit, es_nroestableci, sysdate)') + ') relevfallido, ' +
    '       NVL (hco.co_operativo, TO_CHAR (SYSDATE, ''YYYY'') || ''01'') operativo, ' +
    '       art.hys.get_cantidadvisitas(em_cuit, es_nroestableci, ' +
            iif (not dcbFechaDesde.IsEmpty, SqlValue (dcbFechaDesde.Date) + ', ' + SqlValue (dcbFechaHasta.Date),
    '                                   NVL ((SELECT po_vigenciadesde ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE)), ' +
    '                                        TRUNC (SYSDATE, ''YYYY'') ' +
    '                                       ), ' +
    '                                   NVL ((SELECT NVL (po_vigenciahasta, art.actualdate + 1) ' +
    '                                           FROM art.pop_operativo, art.apo_periodosoperativo ' +
    '                                          WHERE op_id = po_idoperativo ' +
                                                 iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
    '                                            AND po_tipoempresa = ''EP''), ' +
    '                                        SYSDATE) ') +
    '                                       ) Visitas' +
    '  FROM afi.aem_empresa aem, ' +
    '       afi.aco_contrato aco, ' +
    '       afi.aes_establecimiento aes, ' +
    '       hys.hco_cuitoperativo hco ' +
    ' WHERE aem.em_id = aco.co_idempresa ' +
    '   AND aes.es_contrato = aco.co_contrato ' +
    '   AND aco.co_contrato = art.afiliacion.get_contratovigente (em_cuit, SYSDATE) ' +
    '   AND aes.es_fechabaja IS NULL ' +
    '   AND co_estado = 1 ' +
    '   AND not exists (select 1 ' +
    '                   from hys.hep_estabporpreventor ' +
    '                   where ep_cuit = em_cuit ' +
    '                   and ep_estableci = es_nroestableci ' +
    '                   and ep_fechabaja is not null) ' +
    '   AND em_cuit = hco.co_cuit(+) ');

    if chkConVisitas.Checked then
      sdqConsulta.SQL.Add(
        '  AND EXISTS ( ' +
        '         SELECT 1 ' +
        '           FROM art.prv_resvisitas ' +
        '          WHERE rv_cuit = em_cuit ' +
        '            AND rv_estableci = es_nroestableci ' +
        '            AND rv_fecha BETWEEN NVL ((SELECT po_vigenciadesde ' +
        '                                         FROM art.pop_operativo, art.apo_periodosoperativo ' +
        '                                        WHERE op_id = po_idoperativo ' +
                                                   iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
        '                                          AND po_tipoempresa = art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE)), ' +
        '                                      TRUNC (SYSDATE, ''YYYY'') ' +
        '                                     ) ' +
        '                             AND NVL ((SELECT NVL (po_vigenciahasta, art.actualdate + 1) ' +
        '                                         FROM art.pop_operativo, art.apo_periodosoperativo ' +
        '                                        WHERE op_id = po_idoperativo ' +
                                                   iif (chkOperativoActual.Checked, 'AND op_codigo = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND op_codigo = ' + SqlValue (fraOperativo.Codigo)) +
        '                                          AND po_tipoempresa = ''EP''), ' +
        '                                      SYSDATE ' +
        '                                     ))'
      );

    if fraTipo.IsSelected then
      sdqConsulta.SQL.Add('   AND NVL (art.hys.get_tipo_empresa (em_cuit, NULL, SYSDATE), ''GB'') = ' + SqlValue(fraTipo.Value));

    if fraPreventor.IsSelected then
      sdqConsulta.SQL.Add('   AND art.hys.get_preventor_estab (em_cuit, es_nroestableci, SYSDATE) = ' + SqlValue (fraPreventor.Codigo));

    if fraRanking.IsSelected then
      sdqConsulta.SQL.Add('   AND art.hys.get_rankingempresa (em_id, SYSDATE) = ' + fraRanking.Codigo);

    if fraEmpresa.IsSelected then
      sdqConsulta.SQL.Add('   AND em_cuit = ' + SqlValue (fraEmpresa.CUIT));

    sdqConsulta.SQL.Add(iif (chkOperativoActual.Checked, 'AND hco.co_operativo(+) = art.hys.get_operativovigente_empresa (em_cuit, SYSDATE)', 'AND hco.co_operativo(+) = ' + SqlValue (fraOperativo.Codigo))
  );

  inherited;
end;

procedure TfrmAnalisisMotivos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraOperativo.Clear;
  fraTipo.Clear;
  fraEmpresa.Clear;
  fraRanking.Clear;
  fraPreventor.Clear;
  chkOperativoActual.Checked := false;
  chkConVisitas.Checked := false;
end;

procedure TfrmAnalisisMotivos.ShortCutControlShortCuts9ShortCutPress(
  Sender: TObject);
begin
  JvgGroupBox1.Collapsed := not JvgGroupBox1.Collapsed
end;

end.

