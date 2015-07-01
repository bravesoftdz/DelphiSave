{-----------------------------------------------------------------------------
 Unit Name: unAbmAnalisis
 Author:    racastro
 Date:      07-May-2008
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit unAbmAnalisis;

interface
                                   
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unMoldeAbmAnalisis, Menus, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, ShortCutControl, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unFraEmpresa, AnsiSql,
  unfraPrestadorAMP, unfraCtbTablas, unFraTipoEstudio, StdCtrls, Mask,
  ToolEdit, DateComboBox, unFraCodigoDescripcion, unFraEstudio, General,
  unArtDBAwareFrame, unArtDbFrame, unfraEstablecimiento_OLD, unArtFrame,
  unfraOperativo, unFraTrabajadorAMP, Buttons, ExtCtrls, ComCtrls, ToolWin,
  ImgList, unDMPrincipal, FormPanel, PatternEdit, IntEdit, JvgGroupBox,
  JvExExtCtrls, JvNavigationPane, unArt;

type
  TfrmAbmAnalisis = class(TfrmMoldeAbmAnalisis)
    fraEmpresaHijo: TfraEmpresa;
    Label3: TLabel;
    fraTrabajadorHijo: TfraTrabajadorAMP;
    JvOutlookSplitter1: TJvOutlookSplitter;
    gbPendientesLote: TJvgGroupBox;
    tbFiltro: TToolBar;
    tbTrabajadores: TToolBar;
    tbRefrescarTrab: TToolButton;
    dbgLotes: TArtDBGrid;
    dsLotes: TDataSource;
    sdqLotes: TSDQuery;
    tbOrdenarLote: TToolButton;
    tbLimpiarLotes: TToolButton;
    pnlFiltroLote: TPanel;
    edDL_IDLOTE: TIntEdit;
    Label10: TLabel;
    fraTJ_CUIL: TfraTrabajadorAMP;
    SortDialogLotes: TSortDialog;
    Label11: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    chkPendientes: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    sdqOperativosDups: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTrabajadorClick(Sender: TObject);
    procedure dbgLotesDblClick(Sender: TObject);
    procedure dbgLotesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edDL_IDLOTEChange(Sender: TObject);
    procedure fraTrabajadorHijoEnter(Sender: TObject);
    procedure fraTrabajadorHijocmbNombreEnter(Sender: TObject);
    procedure edFechaChange(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure fraTJ_CUILmskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure tbRefrescarTrabClick(Sender: TObject);
    procedure sdqLotesAfterScroll(DataSet: TDataSet);
    procedure tbAgregarClick(Sender: TObject);
    procedure tbLimpiarLotesClick(Sender: TObject);
    procedure tbOrdenarLoteClick(Sender: TObject);
  private
    FSQLLote: string;
    procedure CargarOperativo (CargaPorFecha : Boolean);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure OnfraEstablecimientoChange(Sender: TObject);
  public
  end;

var
  frmAbmAnalisis: TfrmAbmAnalisis;

implementation

uses
  unPrincipal, unContratoTrabajador, unFraEstablecimiento, unFormEstudios,
  unSesion, DateTimeFuncs, unFiltros, unConstantArchivo;

{$R *.dfm}

{-----------------------------------------------------------------------------
  Procedure: FormCreate
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Creación del form
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.FormCreate(Sender: TObject);
begin
  fraEmpresa    := fraEmpresaHijo;
  fraTrabajador := fraTrabajadorHijo;
  FSQLLote := sdqLotes.SQL.Text;
  inherited;

  fraEmpresaHijo.ContratoActivo := false;
  fraTrabajadorHijo.OnChange := OnTrabajadorChange;

  fraEstablecimiento.OnChange  := OnfraEstablecimientoChange;

  fraEstudio.ExtraCondition := ' AND ES_TIPOARCHIVO IN (' + SqlValue(ID_CARPETA_ML_GRAL) + ', ' +
                                                            SqlValue(ID_CARPETA_ML_RX) + ', ' +
                                                            SqlValue(ID_CARPETA_ML_EGRESOS) + ')';
end;

procedure TfrmAbmAnalisis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuHistoriasClinicas.Enabled := True;
end;

{-----------------------------------------------------------------------------
  Procedure: OnTrabajadorChange
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.OnTrabajadorChange(Sender: TObject);
var
  BusqCUIT,
  BusqEstab,
  sCUIL: String;
  CantEstab,
  BusqContrato: integer;
begin
  // Analiza si se cargo su Documento o su CUIL
  case Length(fraTrabajadorHijo.CUIL) of
    6..8: begin
      SCUIL:= ValorSql ('SELECT TJ_CUIL ' +
                        '  FROM CTJ_TRABAJADORES ' +
                        ' WHERE TJ_DOCUMENTO = ' + SqlValue (fraTrabajadorHijo.CUIL));
      fraTrabajador.VerRLaboral := false
    end;
    11: begin
      sCUIL:= fraTrabajadorHijo.CUIL;
      fraTrabajador.VerRLaboral := true
    end;
    else  sCUIL:= '';
  end;

  // CUIL no definido/encontrado
  if sCUIL = '' then
    Exit;

  // CUIT a buscar
  BusqCUIT := fraTrabajador.CUIT;

  // Contrato a buscar
  if fraTrabajador.sdqTrabajador.FieldByName('co_contrato').IsNull then
    BusqContrato := 0
  else
    BusqContrato := fraTrabajador.sdqTrabajador.FieldByName('co_contrato').AsInteger;

  // Carga Empresa
  fraEmpresaHijo.Contrato := BusqContrato;

  // Carga trabajador
  //esto es un quilombo lo agrego aca porque el codigo es un desastre
  if (fraTrabajador.CUIL <> sCUIL) or (fraTrabajador.CUIT <> BusqCUIT) then
  begin
    fraTrabajador.CUIL := sCUIL;
    fraTrabajador.CUIT := BusqCUIT;
  end;

  // Busca el establecimiento en base a auditoría de lotes de estudio, en base
  // al CUIT y CUIL
  BusqEstab := ValorSqlEx('SELECT DISTINCT es_nroestableci ' +
                          '           FROM afi.aes_establecimiento, ' +
                          '                comunes.ctj_trabajador, ' +
                          '                afi.aem_empresa, ' +
                          '                hys.hdl_detallelote hdl1 ' +
                          '          WHERE es_id = dl_idestableci ' +
                          '            AND em_cuit = :pcuit ' +
                          '            AND tj_cuil = :cuil ' +
                          '            AND tj_id = dl_idtrabajador ' +
                          '            AND em_id = dl_idempresa ' +
                          '            AND dl_fecharealizacion IS NOT NULL ' +
                          '            AND dl_idlote = ' +
                          '                   (SELECT MAX (dl_idlote) ' +
                          '                      FROM hys.hdl_detallelote hdl2 ' +
                          '                     WHERE hdl2.dl_idempresa = hdl1.dl_idempresa ' +
                          '                       AND hdl2.dl_idtrabajador = hdl1.dl_idtrabajador) ',
                          [BusqCUIT, sCUIL]);


  // Establecimiento no encontrado
  if BusqEstab = '' then
    // Obtiene el 1er. establecimiento que encuentra para el último relevamiento
    BusqEstab := ValorSqlEx('SELECT rt_estableci ' +
                            '  FROM art.prt_riestrab a ' +
                            ' WHERE rt_cuil = :pcuil ' +
                            '   AND rt_cuit = :pcuit ' +

                            '   AND rt_fecha = (SELECT MAX(rt_fecha) ' +
                            '                     FROM art.prt_riestrab b ' +
                            '                    WHERE b.rt_cuil = a.rt_cuil ' +
                            '                      AND b.rt_cuit = a.rt_cuit) ' +

                            '   AND ROWNUM = 1',
                            [sCUIL, BusqCUIT]);

  // Cantidad de establecimientos encontrados para el último relevamiento
  CantEstab := ValorSqlEx('SELECT COUNT(DISTINCT rt_estableci) ' +
                          '  FROM art.prt_riestrab a ' +
                          ' WHERE rt_cuil = :pcuil ' +
                          '   AND rt_cuit = :pcuit ' +
                          '   AND rt_fecha = (SELECT MAX(rt_fecha) ' +
                          '                     FROM art.prt_riestrab b ' +
                          '                    WHERE b.rt_cuil = a.rt_cuil ' +
                          '                      AND b.rt_cuit = a.rt_cuit) ',
                          [sCUIL, BusqCUIT]);

  // Se encontró un establecimiento
  if BusqEstab <> '' then
  begin
    fraEstablecimiento.Cargar(BusqCUIT, BusqEstab);

    //esto es un quilombo lo agrego aca porque el codigo es un desastre
    if (fraTrabajador.CUIL <> sCUIL) or (fraTrabajador.CUIT <> BusqCUIT) then
    begin
      fraTrabajador.CUIL := sCUIL;
      fraTrabajador.CUIT := BusqCUIT;
    end;

    fraOperativo.Cargar (ValorSqlEx('SELECT (EXTRACT(YEAR FROM le_fechaalta) ' +
                                    '        || DECODE(el_operativo, ''A'', ''01'', ''06'')) ult_operativo ' +
                                    '  FROM aes_establecimiento, hys.hrl_relevamientolote, hys.hel_estadolote, ' +
                                    '       hys.hle_loteestudio ' +
                                    ' WHERE es_contrato = :pcontrato ' +
                                    '   AND es_nroestableci = :pestableci ' +
                                    '   AND rl_id = el_rlid ' +
                                    '   AND el_idlote = art.amp.get_ultimolote_no_anulado(rl_idestableci) ' +
                                    '   AND rl_idestableci = es_id ' +
                                    '   AND le_id = el_idlote',
                                    [BusqContrato, BusqEstab]));
    fraTipoEstudio.PeriodoOriginal := fraOperativo.edPeriodo.Text;
    ActiveControl := fraEstudio
  end;

  if CantEstab > 1 then
    MsgBox('Para el último relevamiento, hay ' + IntToStr(CantEstab) +
           ' establecimientos posibles para este trabajador. ' + #13 +
           'Verifique si es el correcto antes de proceder.', MB_ICONWARNING);
end;

{-----------------------------------------------------------------------------
  Procedure: CargarOperativo
  Author:    racastro
  Date:      07-May-2008
  Arguments: CargaPorFecha : Boolean
  Result:    None
  Purpose:   Recupera el operativo
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.CargarOperativo (CargaPorFecha : Boolean);

begin
  if chbAnclarDatos.Checked then
    Exit;

  fraOperativo.Cargar (ValorSqlEx('SELECT (EXTRACT(YEAR FROM le_fechaalta) ' +
                                '        || DECODE(el_operativo, ''A'', ''01'', ''06'')) ult_operativo ' +
                                '  FROM aes_establecimiento, hys.hrl_relevamientolote, hys.hel_estadolote, ' +
                                '       hys.hle_loteestudio ' +
                                ' WHERE es_contrato = :pcontrato ' +
                                '   AND es_nroestableci = :pestableci ' +
                                '   AND rl_id = el_rlid ' +
                                iif (CargaPorFecha,
                                     '   AND EXTRACT(YEAR FROM le_fechaalta) = EXTRACT(YEAR FROM ' + edFecha.SqlText + ') ' +
                                     '   AND el_fechabaja IS NULL ',
                                     '   AND el_idlote = art.amp.get_ultimolote_no_anulado(rl_idestableci) ') +
                                '   AND rl_idestableci = es_id ' +
                                '   AND le_id = el_idlote',
                                [fraEstablecimiento.Contrato, fraEstablecimiento.edCodigo.Value]));

  fraTipoEstudio.PeriodoOriginal := fraOperativo.edPeriodo.Text;
end;

{-----------------------------------------------------------------------------
  Procedure: OnfraEstablecimientoChange
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Al cambiar de Establecimiento se carga el operativo correspondiente
             sin tener en cuenta la fecha
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.OnfraEstablecimientoChange(Sender: TObject);
begin
  inherited;

  CargarOperativo (false);
end;

procedure TfrmAbmAnalisis.btnTrabajadorClick(Sender: TObject);
begin
  DoContratoTrabajador(0,0)
end;

procedure TfrmAbmAnalisis.dbgLotesDblClick(Sender: TObject);
begin
  tbAgregar.Click;
end;

procedure TfrmAbmAnalisis.dbgLotesGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
    var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqLotes.FieldByName ('fechaexamen').IsNull then
  begin
    if sdqLotes.FieldByName ('dl_debito').AsString <> 'S' then
      AFont.Color := clBlue
    else
      AFont.Color := clTeal;

    if sdqLotes.FieldByName ('factura').IsNull then
      AFont.Style := []
    else
      AFont.Style := [fsBold];
  end;

  if not sdqLotes.FieldByName('dl_fecha_cargaamp').IsNull then
    AFont.Color := clPurple;

  if Highlight then
  begin
    AFont.Color := clLime;
    Background := clNavy
  end;

end;

procedure TfrmAbmAnalisis.edDL_IDLOTEChange(Sender: TObject);
begin
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: fraTrabajadorHijoEnter
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Por defecto, se verán los datos de la relación laboral del
             trabajador
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.fraTrabajadorHijoEnter(Sender: TObject);
begin
  fraTrabajador.VerRLaboral := true;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: fraTrabajadorHijocmbNombreEnter
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Se visualizan datos de relación laboral del trabajador si se
             ingresó su CUIT
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.fraTrabajadorHijocmbNombreEnter(Sender: TObject);
begin
  fraTrabajador.VerRLaboral := Length(fraTrabajador.mskCUIL.Text) = 11;

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: edFechaChange
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Determina el operativo si no está definido y la fecha es válida
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.edFechaChange(Sender: TObject);
begin
  inherited;

  if edFecha.IsValid and (fraOperativo.edPeriodo.Text = '') then
    CargarOperativo (true)
end;

{-----------------------------------------------------------------------------
  Procedure: edFechaExit
  Author:    racastro
  Date:      07-May-2008
  Arguments: Sender: TObject
  Result:    None
  Purpose:   Si el operativo no está definido, lo determina en base a la
             fecha
-----------------------------------------------------------------------------}
procedure TfrmAbmAnalisis.edFechaExit(Sender: TObject);
begin
  inherited;

  if fraOperativo.edPeriodo.Text = '' then
    CargarOperativo (not edFecha.IsEmpty)
end;

procedure TfrmAbmAnalisis.fraTJ_CUILmskCUILKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    fraTJ_CUIL.cmbNombre.Text := EmptyStr;
    fraTJ_CUIL.Cargar(fraTJ_CUIL.Value);
  end;
end;

procedure TfrmAbmAnalisis.tbRefrescarTrabClick(Sender: TObject);
begin
  inherited;
  sdqLotes.SQL.Text :=
      FSQLLote +
      DoFiltro(pnlFiltroLote) +
      IIF(chkPendientes.Checked, ' AND hdl.dl_fecha_cargaamp is null ', ' ') +
      SortDialogLotes.OrderBy;
  OpenQuery(sdqLotes);
  if Assigned(sdqConsulta) then
    sdqConsulta.Close;
end;

procedure TfrmAbmAnalisis.sdqLotesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fraEmpresaHijo.Contrato := sdqLotes.FieldByName('es_contrato').AsInteger;

  fraEstablecimiento.Cargar(
      sdqLotes.FieldByName('em_cuit').AsString,
      sdqLotes.FieldByName('es_nroestableci').AsInteger
  );

  fraTrabajadorHijo.Clear;
  fraTrabajadorHijo.CUIL := sdqLotes.FieldByName('tj_cuil').AsString;

  fraEstudio.Codigo := sdqLotes.FieldByName('est_cod').AsString;
  
  if (not (sdqLotes.FieldByName('el_fecharecibido').IsNull)) and
      (not chbAnclarDatos.Checked) then
    edFechaRPrest.Date := sdqLotes.FieldByName('el_fecharecibido').AsDateTime;

  if (not (sdqLotes.FieldByName('fecharecepmedlab').IsNull)) and
      (not chbAnclarDatos.Checked) then
    edFechaRML.Date := sdqLotes.FieldByName('fecharecepmedlab').AsDateTime;

  if not (sdqLotes.FieldByName('fechaexamen').IsNull) then
    edFecha.Date := sdqLotes.FieldByName('fechaexamen').AsDateTime;

  fraTipoEstudio.Codigo := sdqLotes.FieldByName('est_tipo').AsString;

  sdqOperativosDups.Close;
  sdqOperativosDups.ParamByName('id_estab').AsInteger := sdqLotes.FieldByName('dl_idestableci').AsInteger;
  sdqOperativosDups.ParamByName('anio').AsString := sdqLotes.FieldByName('fechaalta').AsString;
  sdqOperativosDups.ParamByName('operativo').AsString := sdqLotes.FieldByName('el_operativo').AsString;
  sdqOperativosDups.Open;

  if not sdqOperativosDups.IsEmpty then
    fraOperativo.Cargar(IntToStr((StrToInt(sdqLotes.FieldByName('ult_operativo').AsString) +100)))
  else
    fraOperativo.Cargar(sdqLotes.FieldByName('ult_operativo').AsString);

  fraPrestador.Cargar(sdqLotes.FieldByName('le_idprestador').AsString);
  application.ProcessMessages;
end;

procedure TfrmAbmAnalisis.tbAgregarClick(Sender: TObject);
var
  bkMark: TBookmark;
begin
  inherited;
  if Self.EstudiosOK then begin
    try
      EjecutarSqlEx(
 '       UPDATE hys.hdl_detallelote  	'
+'       SET DL_FECHA_CARGAAMP = :fechacarga, DL_USUCARGAAMP = :usuariocarga  	'
+'       WHERE dl_id = ( 	'
+'           SELECT hdl.dl_id  	'
+'                  FROM comunes.ctj_trabajador,  	'
+'                       afi.aem_empresa,  	'
+'                       afi.aco_contrato,  	'
+'                       afi.aes_establecimiento aes,  	'
+'                       hys.hle_loteestudio,  	'
+'                       hys.hel_estadolote,  	'
+'                       hys.hdl_detallelote hdl  	'
+'                       WHERE ((dl_fechabaja IS NULL)  	'
+'                     OR ((dl_fechabaja IS NOT NULL)  	'
+'                     AND EXISTS (SELECT 1  	'
+'                                   FROM hys.hel_estadolote,  	'
+'                                        hys.hrl_relevamientolote  	'
+'                                  WHERE el_estado IN (SELECT de_codigo  	'
+'                                                        FROM hys.hde_descripcionestadolote  	'
+'                                                       WHERE de_versegestudio = ''S'')  	'
+'                                    AND rl_id = el_rlid  	'
+'                                    AND rl_idestableci = dl_idestableci  	'
+'                                    AND el_idlote = dl_idlote)))  	'
+'                   AND tj_id = dl_idtrabajador  	'
+'                   AND aes.es_id = dl_idestableci  	'
+'                   AND co_contrato = es_contrato  	'
+'                   AND em_id = co_idempresa  	'
+'                   AND el_idlote = dl_idlote  	'
+'                   AND el_idlote = le_id  	'
+'                   AND EM_CUIT = :cuit  	'
+'                   AND AES.es_nroestableci = :estableci  	'
+'                   AND tj_cuil = :cuil  	'
+'                   AND hdl.dl_idestudio = :idestudio  	'
+'                   AND DECODE(el_operativo, ''R'', ''R'', ''EP'') = :tipo  	'
+'                   AND (EXTRACT(YEAR FROM le_fechaalta)  	'
+'                        || DECODE(el_operativo, ''A'', ''01'', ''06'')) = :operativo  	'
+'                   AND le_idprestador = :prestador  '
+'                   AND ((hdl.dl_fecharealizacion = :fecha)  '
+'                     OR (hdl.dl_fecharealizacion IS NULL))  '
+'       ) 	',
        [ TDateTimeEx.Create(DBDateTime),
          Sesion.UserID,
          fraEmpresaHijo.CUIT,
          fraEstablecimiento.Value,
          fraTrabajadorHijo.CUIL,
          fraEstudio.ID,
          fraTipoEstudio.Codigo,
          fraOperativo.edPeriodo.Text,
          fraPrestador.edCodigo.Value,
          TDateTimeEx.Create(edFecha.Date)
        ]
      );

      if sdqLotes.Active and not sdqLotes.IsEmpty then
      begin
        sdqLotes.DisableControls;
        bkMark := sdqLotes.GetBookmark;
        OpenQuery(sdqLotes);
        try
          sdqLotes.GotoBookmark(bkMark);
        except
        end;
        sdqLotes.EnableControls;
      end;
    finally
      Self.EstudiosOK := False;
    end;
  end;
end;

procedure TfrmAbmAnalisis.tbLimpiarLotesClick(Sender: TObject);
begin
  inherited;
  fraTJ_CUIL.Limpiar;
  edDL_IDLOTE.Clear;
  sdqLotes.Close;
end;

procedure TfrmAbmAnalisis.tbOrdenarLoteClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialogLotes.SortFields, dbgLotes.Columns);
  SortDialogLotes.Execute ;
end;

end.


