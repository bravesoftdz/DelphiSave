unit unPuestaDisposicion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ExtCtrls, ImgList, XPMenu, Placemnt, StdCtrls,
  Mask, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, unFraTrabajador, SinEdit, unfraFirmantes,
  DB, SDEngine, SortDlg, ShortCutControl, FormPanel, unFraCodigoDescripcion,
  QueryToFile, ExportDialog, QueryPrint, unfraFirmante, Menus, unArt,
  RxToolEdit, RxPlacemnt;

type
  TfrmPuestaDisposicion = class(TfrmCustomForm)
    pnlTop: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbSeparador3: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton5: TToolButton;
    tbGenerarCD: TToolButton;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton2: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbSalir: TToolButton;
    gbFAprobLiq: TGroupBox;
    deFechaAprobLiqDesde: TDateComboBox;
    Label1: TLabel;
    deFechaAprobLiqHasta: TDateComboBox;
    Label3: TLabel;
    gbFImpCD: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    deFechaImpCDDesde: TDateComboBox;
    deFechaImpCDHasta: TDateComboBox;
    gbFGenCD: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    deFechaGenCDDesde: TDateComboBox;
    deFechaGenCDHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label7: TLabel;
    gbTrabajador: TGroupBox;
    Label8: TLabel;
    fraTrabajador: TfraTrabajador;
    Label9: TLabel;
    edSiniestro: TSinEdit;
    Label10: TLabel;
    edNroCartaDoc: TMaskEdit;
    Label11: TLabel;
    gbGPBA: TGroupBox;
    rbGPBASi: TRadioButton;
    rbGPBANo: TRadioButton;
    rbGPBATodos: TRadioButton;
    gbRecepcionOK: TGroupBox;
    rbRecSi: TRadioButton;
    rbRecNo: TRadioButton;
    rbRecTodos: TRadioButton;
    rbSinAc: TRadioButton;
    gbFirmante: TGroupBox;
    Label12: TLabel;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    cbEstadoCD: TComboBox;
    sdGrilla: TSortDialog;
    ShortCutControl1: TShortCutControl;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ExportDialog: TExportDialog;
    fpFirmantes: TFormPanel;
    BevelAbm: TBevel;
    Label13: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraFirmantesfp: TfraFirmantes;
    fraFirmantesFiltro: TfraFirmantes;
    gbTipoLiq: TGroupBox;
    cbILP: TCheckBox;
    cbILT: TCheckBox;
    cbOP: TCheckBox;
    cbMort: TCheckBox;
    Grid: TArtDBGrid;
    pmNuevo: TPopupMenu;
    mnuNuevoILP: TMenuItem;
    mnuNuevoILT: TMenuItem;
    mnuNuevoMort: TMenuItem;
    mnuNuevoOP: TMenuItem;
    fpBaja: TFormPanel;
    Bevel1: TBevel;
    Label14: TLabel;
    btnAceptarBaja: TButton;
    btnCancelarBaja: TButton;
    fraMotBaja: TfraCodigoDescripcion;
    chkUltimoPago: TCheckBox;
    rgBajas: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    function DoCargarFiltros(var sql: string; var sql2: string): string;
    procedure tbLimpiarClick(Sender: TObject);
    function HayRegistroActivo :Boolean;
    procedure FormCreate(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbNuevoClick(Sender: TObject; iTipoLiq: integer);
    procedure tbModificarClick(Sender: TObject);
    procedure tbGenerarCDClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    function HayRegSeleccionado: boolean;
    procedure btnAceptarClick(Sender: TObject);
    procedure fpFirmantesShow(Sender: TObject);
    function VerificarVencidos: boolean;
    function VerificarSeleccion: boolean;
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure mnuNuevoILPClick(Sender: TObject);
    procedure mnuNuevoILTClick(Sender: TObject);
    procedure mnuNuevoMortClick(Sender: TObject);
    procedure mnuNuevoOPClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure fpBajaShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPuestaDisposicion: TfrmPuestaDisposicion; RegSelec: TStringList; bUltimoPago: boolean;

implementation

uses unDmPrincipal, unDireccionCDO, unSesion, unComunes, CustomDlgs,
  unRptCartaDocHeader, General, vclextra;

{$R *.dfm}


procedure TfrmPuestaDisposicion.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if RegSelec.IndexOf(sdqConsulta.FieldByName('cp_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmPuestaDisposicion.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);

end;

procedure TfrmPuestaDisposicion.GridCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if RegSelec.IndexOf(sdqConsulta.FieldByName('cp_id').AsString) > -1 then
      RegSelec.Delete(RegSelec.IndexOf(sdqConsulta.FieldByName('cp_id').AsString))
    else
      RegSelec.Add(sdqConsulta.FieldByName('cp_id').AsString);
    Grid.Repaint;
  end;
end;


function TfrmPuestaDisposicion.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.IsEmpty;
end;

procedure TfrmPuestaDisposicion.tbRefrescarClick(Sender: TObject);
var ssqlOp, ssqlIlMort, ssql: string;
begin

  ssqlOp := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, cp_numliqui nroliq,' +
            '       ex_fechaaccidente faccid, art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, ex_contrato contrato,' +
            '       art.utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa, pr_faprobado faprob, cp_conpago, cp_denpago conpago,' +
            '       pr_imporpago importe, pr_fechadesde fdesde, pr_fechahasta fhasta, pd_fvencimiento fvencimiento,' +
            '       art.utiles.armar_domicilio(pd_calle, pd_numero, pd_piso, pd_departamento, pd_localidad, NULL) dompostal,' +
            '       DECODE (ca_id, NULL, DECODE(GREATEST(pr_faprobado + 7, art.actualdate), art.actualdate, ''Vencida'', ''Pendiente''), ' +
            '       DECODE (ca_fechaimpresion, NULL, ''Generada'', ''Impresa'')) estado, ' +
            '       tc_codigo codcarta, ca_fechaimpresion fimpresion, ca_fecharecepcion facuse, DECODE(ca_recepcionok,' +
            '       NULL, ''Sin acuse'', ''S'', ''Recepción ok'', ''N'', ''Recepción no'') estadoacuse,' +
            '       art.utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocarta, fi_firmante firmante, cp_id, ex_id, pr_numpago le_numliqui, ' +
            '       ex_siniestro, ex_orden, ex_recaida, tj_id, cp_idcarta, cp_tipo, cp_anticipo, ca_idendoso, ce_beneficiario, ' +
            '       NULL grupofam, cp_fechabaja, mp_descripcion ' +
            '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, SIN.smp_motivosbajapuesta, art.sex_expedientes,' +
            '       art.spr_pagoexpesin, ctj_trabajador, aem_empresa, art.scp_conpago, cca_carta, ctc_textocarta, cfi_firma, ' +
            '       teso.rce_chequeemitido ' +
            ' WHERE pd_idexpediente = ex_id' +
            '   AND cp_idexpediente = pd_idexpediente' +
            '   AND cp_idexpediente = pr_idexpediente' +
            '   AND cp_numliqui = pr_numpago' +
            '   AND cp_tablaliqui = ''SPR''' +
            '   AND cp_idmotivobaja = mp_id(+)' +
            '   AND ex_idtrabajador = tj_id' +
            '   AND ex_cuit = em_cuit' +
            '   AND pr_conpago = cp_conpago' +
            '   AND cp_idcarta = ca_id(+)' +
            '   AND ca_idtextocarta = tc_id(+)' +
            '   AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id(+)' +
            '   AND ca_fechabaja(+) IS NULL' +
            '   AND pd_fechabaja IS NULL ' +
          //  '   AND cp_fechabaja IS NULL ' +
            '   AND NVL(pr_estado, '' '') IN (''E'', ''P'') ' +
            '   AND pr_idchequeemitido = ce_id(+) ';

  ssqlIlMort := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, cp_numliqui nroliq,' +
                '       ex_fechaaccidente faccid, art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, ex_contrato contrato,' +
                '       art.utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa, le_faprobado faprob, cp_conpago, cp_denpago conpago,' +
                '       le_imporperi importe, le_fechades fdesde, le_fechahas fhasta, pd_fvencimiento fvencimiento,' +
                '       art.utiles.armar_domicilio(pd_calle, pd_numero, pd_piso, pd_departamento, pd_localidad, NULL) dompostal,' +
                '       DECODE (ca_id, NULL, DECODE(GREATEST(le_faprobado + 7, art.actualdate), art.actualdate, ''Vencida'', ''Pendiente''), ' +
                '       DECODE (ca_fechaimpresion, NULL, ''Generada'', ''Impresa'')) estado, ' +
                '       tc_codigo codcarta, ca_fechaimpresion fimpresion, ca_fecharecepcion facuse, DECODE(ca_recepcionok,' +
                '       NULL, ''Sin acuse'', ''S'', ''Recepción ok'', ''N'', ''Recepción no'') estadoacuse,' +
                '       art.utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocarta, fi_firmante firmante, cp_id, ex_id, le_numliqui, ' +
                '       ex_siniestro, ex_orden, ex_recaida, tj_id, cp_idcarta, cp_tipo, cp_anticipo, ca_idendoso, ce_beneficiario, ' +
                      '(SELECT DISTINCT eb_grupofamiliar' +
                      '   FROM art.seb_beneficiarios, art.sbl_beneficiarioliquidacion' +
                      '  WHERE eb_codigo = bl_beneficiario' +
                      '    AND eb_siniestro = bl_siniestro' +
                      '    AND eb_orden = bl_orden' +
                      '    AND eb_recaida = bl_recaida' +
                      '    AND bl_siniestro = le_siniestro' +
                      '    AND bl_orden = le_orden' +
                      '    AND bl_recaida = le_recaida' +
                      '    AND bl_numliq = le_numliqui) grupofam, cp_fechabaja, mp_descripcion ' +
                '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, SIN.smp_motivosbajapuesta, art.sex_expedientes,' +
                '       art.sle_liquiempsin, ctj_trabajador, aem_empresa, art.scp_conpago, cca_carta, ctc_textocarta, cfi_firma, ' +
                '       teso.rce_chequeemitido ' +
                ' WHERE pd_idexpediente = ex_id' +
                '   AND cp_idexpediente = pd_idexpediente' +
                '   AND cp_idexpediente = le_idexpediente' +
                '   AND cp_numliqui = le_numliqui' +
                '   AND cp_tablaliqui = ''SLE''' +
                '   AND cp_idmotivobaja = mp_id(+)' +
                '   AND ex_idtrabajador = tj_id' +
                '   AND ex_cuit = em_cuit' +
                '   AND le_conpago = cp_conpago' +
                '   AND cp_idcarta = ca_id(+)' +
                '   AND ca_idtextocarta = tc_id(+)' +
                '   AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id(+)' +
                '   AND ca_fechabaja(+) IS NULL' +
                '   AND pd_fechabaja IS NULL ' +
             //   '   AND cp_fechabaja IS NULL ' +
                '   AND NVL(le_estado, '' '') IN (''E'', ''P'') ' +
                '   AND le_idchequeemitido = ce_id(+) ';


  ssql := DoCargarFiltros(ssqlIlMort, ssqlOp);
  ssql := ssql + sdGrilla.OrderBy;

  OpenQuery(sdqConsulta, sSql);

end;

function TfrmPuestaDisposicion.DoCargarFiltros(var sql: string; var sql2: string): string;
var esILMort, esOP: boolean;
begin
  RegSelec.Clear;

  if cbILP.checked or cbILT.checked or cbMort.checked then
    esILMort := true
  else
    esILMort := false;

  if cbOP.Checked then
    esOP := true
  else
    esOP := false;

  Verificar(not esILMort and not esOP, gbTipoLiq, 'Debe seleccionar un tipo de liquidación');

  if esILMort then
  begin
    if not deFechaAprobLiqDesde.IsEmpty then
      sql := sql + ' AND le_faprobado >= ' + deFechaAprobLiqDesde.SqlText;
    if not deFechaAprobLiqHasta.IsEmpty then
      sql := sql + ' AND le_faprobado <= ' + deFechaAprobLiqHasta.SqlText;

    if not deFechaImpCDDesde.IsEmpty then
      sql := sql + ' AND ca_fechaimpresion >= ' + deFechaImpCDDesde.SqlText;
    if not deFechaImpCDHasta.IsEmpty then
      sql := sql + ' AND ca_fechaimpresion <= ' + deFechaImpCDHasta.SqlText;
    if not deFechaGenCDDesde.IsEmpty then
      sql := sql + ' AND ca_fechaalta >= ' + deFechaGenCDDesde.SqlText;
    if not deFechaGenCDHasta.IsEmpty then
      sql := sql + ' AND ca_fechaalta <= ' + deFechaGenCDHasta.SqlText;

    if not edSiniestro.IsEmpty then
    begin
      sql := sql + ' AND ex_siniestro = ' + edSiniestro.SiniestroS;
      sql := sql + ' AND ex_orden = ' + edSiniestro.OrdenS;
      sql := sql + ' AND ex_recaida = ' + edSiniestro.RecaidaS;
    end;

    if cbEstadoCD.ItemIndex <> 0 then
      sql := sql + ' AND DECODE (ca_id, NULL, DECODE(GREATEST(le_faprobado + 7, art.actualdate), art.actualdate, ''Vencida'', ''Pendiente''), ' +
                   '     DECODE (ca_fechaimpresion, NULL, ''Generada'', ''Impresa'')) = ' + QuotedStr(cbEstadoCD.Text);

    if edNroCartaDoc.Text <> '3779' then
      sql := sql + ' AND ca_nrocartadoc = ' + edNroCartaDoc.Text;

    if not fraTrabajador.IsEmpty then
      sql := ' AND tj_cuil = ' + fraTrabajador.CUIL;

    if not fraEmpresa.IsEmpty then
      sql := sql + ' AND em_cuit = ' + fraEmpresa.CUIT;

    if not fraFirmantesFiltro.IsEmpty then
      sql := sql + 'AND fi_id = ' + IntToStr(fraFirmantesFiltro.Value);

    if rbGPBASi.Checked then
      sql := sql + ' AND ex_siniestro >= 5000000';

    if rbGPBANo.Checked then
      sql := sql + ' AND ex_siniestro < 5000000';

    if rbRecSi.Checked then
      sql := sql + ' AND ca_recepcionok = ''S''';

    if rbRecNo.Checked then
      sql := sql + ' AND ca_recepcionok = ''N''';

    if rbSinAc.Checked then
      sql := sql + ' AND ca_usurecepcion IS NULL';

    case rgBajas.ItemIndex of
      0: sql := sql + ' AND cp_fechabaja IS NOT NULL';
      1: sql := sql + ' AND cp_fechabaja IS NULL';
    end;

    if esILMort then
    begin
      sql := sql + ' AND (';

      if cbILP.Checked then
        sql := sql + ' cp_tipo = ''P'' ' + iif(cbILT.Checked or cbMort.Checked, ' OR ', ''); //ILP
      if cbILT.Checked then
        sql := sql + ' cp_tipo = ''I'' ' + iif(cbMort.Checked, ' OR ', ''); //ILT
      if cbMort.Checked then
        sql := sql + ' cp_tipo = ''M'' '; //Mortales

      sql := sql + ')';
    end;

  end;

  if esOP then
  begin
    if not deFechaAprobLiqDesde.IsEmpty then
      sql2 := sql2 + ' AND pr_faprobado >= ' + deFechaAprobLiqDesde.SqlText;
    if not deFechaAprobLiqHasta.IsEmpty then
      sql2 := sql2 + ' AND pr_faprobado <= ' + deFechaAprobLiqHasta.SqlText;

    if not deFechaImpCDDesde.IsEmpty then
      sql2 := sql2 + ' AND ca_fechaimpresion >= ' + deFechaImpCDDesde.SqlText;
    if not deFechaImpCDHasta.IsEmpty then
      sql2 := sql2 + ' AND ca_fechaimpresion <= ' + deFechaImpCDHasta.SqlText;
    if not deFechaGenCDDesde.IsEmpty then
      sql2 := sql2 + ' AND ca_fechaalta >= ' + deFechaGenCDDesde.SqlText;
    if not deFechaGenCDHasta.IsEmpty then
      sql2 := sql2 + ' AND ca_fechaalta <= ' + deFechaGenCDHasta.SqlText;

    if not edSiniestro.IsEmpty then
    begin
      sql2 := sql2 + ' AND ex_siniestro = ' + edSiniestro.SiniestroS;
      sql2 := sql2 + ' AND ex_orden = ' + edSiniestro.OrdenS;
      sql2 := sql2 + ' AND ex_recaida = ' + edSiniestro.RecaidaS;
    end;

    if cbEstadoCD.ItemIndex <> 0 then
      sql2 := sql2 + ' AND DECODE (ca_id, NULL, DECODE(GREATEST(pr_faprobado + 7, art.actualdate), art.actualdate, ''Vencida'', ''Pendiente''), ' +
                     '     DECODE (ca_fechaimpresion, NULL, ''Generada'', ''Impresa'')) = ' + QuotedStr(cbEstadoCD.Text);

    if edNroCartaDoc.Text <> '3779' then
      sql2 := sql2 + ' AND ca_nrocartadoc = ' + edNroCartaDoc.Text;

    if not fraTrabajador.IsEmpty then
      sql2 := ' AND tj_cuil = ' + fraTrabajador.CUIL;

    if not fraEmpresa.IsEmpty then
      sql2 := sql2 + ' AND em_cuit = ' + fraEmpresa.CUIT;

    if not fraFirmantesFiltro.IsEmpty then
      sql2 := sql2 + 'AND fi_id = ' + IntToStr(fraFirmantesFiltro.Value);

    if rbGPBASi.Checked then
      sql2 := sql2 + ' AND ex_siniestro >= 5000000';

    if rbGPBANo.Checked then
      sql2 := sql2 + ' AND ex_siniestro < 5000000';

    if rbRecSi.Checked then
      sql2 := sql2 + ' AND ca_recepcionok = ''S''';

    if rbRecNo.Checked then
      sql2 := sql2 + ' AND ca_recepcionok = ''N''';

    if rbSinAc.Checked then
      sql2 := sql2 + ' AND ca_usurecepcion IS NULL';

    case rgBajas.ItemIndex of
      0: sql2 := sql2 + ' AND cp_fechabaja IS NOT NULL';
      1: sql2 := sql2 + ' AND cp_fechabaja IS NULL';
    end;

  end;

  if esILMort and esOP then
    DoCargarFiltros := sql + ' union ' + sql2
  else
    if esILMort then
      DoCargarFiltros := sql
    else
      DoCargarFiltros := sql2;

end;

procedure TfrmPuestaDisposicion.tbLimpiarClick(Sender: TObject);
begin
  cbEstadoCD.ItemIndex := 0;
  rbGPBATodos.Checked := True;
  rbRecTodos.Checked := True;
  fraTrabajador.Clear;
  fraEmpresa.Clear;
  edSiniestro.Clear;
  edNroCartaDoc.Text := '3779';
  fraFirmantesFiltro.Limpiar;
  deFechaAprobLiqDesde.Clear;
  deFechaAprobLiqHasta.Clear;
  deFechaImpCDDesde.Clear;
  deFechaImpCDHasta.Clear;
  deFechaGenCDDesde.Clear;
  deFechaGenCDHasta.Clear;
  RegSelec.Clear;
  cbILP.Checked := true;
  cbILT.Checked := true;
  cbOP.Checked := true;
  cbMort.Checked := true;
  rgBajas.ItemIndex := 1;
  sdqConsulta.Close;
end;


procedure TfrmPuestaDisposicion.FormCreate(Sender: TObject);
begin
  RegSelec := TStringList.Create;
  fraFirmantesfp.Area := AREA_DIN;
  fraFirmantesfp.Modulo := '82';
  fraFirmantesFiltro.Area := AREA_DIN;
  fraFirmantesFiltro.Modulo := '82';
  with fraMotBaja do
  begin
    TableName := 'SIN.smp_motivosbajapuesta';
    FieldID := 'mp_id';
    FieldBaja := 'mp_fechabaja';
    FieldCodigo := 'mp_codigo';
    FieldDesc := 'mp_descripcion';
    ShowBajas := false; 
  end;
end;

procedure TfrmPuestaDisposicion.tbNuevoClick(Sender: TObject; iTipoLiq: integer);
begin
  with TfrmDireccionCDO.Create(nil) do
  try
    BeginTrans;
    case iTipoLiq of
      0: Mostrar(0, 0, 'ILP', oAlta);
      1: Mostrar(0, 0, 'ILT', oAlta);
      2: Mostrar(0, 0, 'M', oAlta);
      3: Mostrar(0, 0, 'OP', oAlta);
    end;
    CommitTrans;
  except
    on e: exception do
    begin
      Rollback;
      ErrorMsg(e, e.Message);
    end;
  end;

end;

procedure TfrmPuestaDisposicion.tbModificarClick(Sender: TObject);
begin
  with TfrmDireccionCDO.Create(nil) do
  try
    BeginTrans;
    if sdqConsulta.FieldByName('cp_tipo').AsString = 'P' then
      Mostrar(sdqConsulta.fieldbyname('ex_id').AsInteger, sdqConsulta.fieldbyname('le_numliqui').AsInteger, 'ILP', oModif)
    else
      if sdqConsulta.FieldByName('cp_tipo').AsString = 'I' then
        Mostrar(sdqConsulta.fieldbyname('ex_id').AsInteger, sdqConsulta.fieldbyname('le_numliqui').AsInteger, 'ILT', oModif)
      else
        if sdqConsulta.FieldByName('cp_tipo').AsString = 'M' then
          Mostrar(sdqConsulta.fieldbyname('ex_id').AsInteger, sdqConsulta.fieldbyname('le_numliqui').AsInteger, 'M', oModif)
        else
          Mostrar(sdqConsulta.fieldbyname('ex_id').AsInteger, sdqConsulta.fieldbyname('le_numliqui').AsInteger, 'OP', oModif);

    CommitTrans;
  except
    on e: exception do
    begin
      Rollback;
      ErrorMsg(e, e.Message);
    end;
  end;
end;

procedure TfrmPuestaDisposicion.tbGenerarCDClick(Sender: TObject);
var ssql: string; iIdCarta, i, iIdFormato: integer;
begin
  if VerificarSeleccion and (fpFirmantes.ShowModal = mrOk) then
    try
      iIdFormato := ValorSql('SELECT tc_id FROM ctc_textocarta WHERE tc_codigo = ''PD01'' AND tc_fechabaja IS NULL');
      sdqConsulta.Locate('cp_id', RegSelec[0], []);
      BeginTrans;
      iIdCarta := DoInsertarCarta(iIdFormato, sdqConsulta.fieldbyname('ex_siniestro').AsInteger, sdqConsulta.fieldbyname('ex_orden').AsInteger,
                                  sdqConsulta.fieldbyname('ex_recaida').AsInteger, fraFirmantesfp.Codigo,
                                  AREA_DIN, False, sdqConsulta.fieldbyname('tj_id').AsInteger, tdTrabajador);

      for i := 0 to RegSelec.Count - 1 do
      begin
        ssql := ' update SIN.scp_casospuestadisp ' +
                '    set cp_idcarta = :idca, ' +
                '        cp_ultimopago = :ultp, ' +
                '        cp_fechamodif = trunc(sysdate), ' +
                '        cp_usumodif = :usu ' +
                '  where cp_id = :cpid ';
        EjecutarSqlSTEx(ssql, [iIdCarta, IIF(chkUltimoPago.Checked, 'S', 'N'), Sesion.UserID, RegSelec[i]]);
      end;

      if (ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''P'', ''N'') from dual', [iIdCarta]) = 'S') and
         (sdqConsulta.FieldByName('cp_anticipo').AsString = 'S') then
      begin
        iIdFormato := ValorSql('SELECT tc_id FROM ctc_textocarta WHERE tc_codigo = ''PD02'' AND tc_fechabaja IS NULL');
        DoInsertarCarta(iIdFormato, sdqConsulta.fieldbyname('ex_siniestro').AsInteger, sdqConsulta.fieldbyname('ex_orden').AsInteger,
                                    sdqConsulta.fieldbyname('ex_recaida').AsInteger, fraFirmantesfp.Codigo,
                                    AREA_DIN, False, sdqConsulta.FieldByName('ca_idendoso').AsInteger, tdEmpresa);
      end;

      CommitTrans;
      MsgBox('CD generada correctamente');
    except
      on e: exception do
      begin
        Rollback;
        MsgBox('Error: ' + e.Message);
      end;
    end;

  tbRefrescarClick(nil);  
end;

procedure TfrmPuestaDisposicion.tbEliminarClick(Sender: TObject);
var ssql: string; i: integer;
begin
  if fpBaja.ShowModal = mrOk then
  begin
    for i := 0 to RegSelec.Count - 1 do
    begin
      BeginTrans;
      try
        ssql := ' update SIN.scp_casospuestadisp ' +
                '    set cp_idmotivobaja = :mot, ' +
                '        cp_fechabaja = trunc(sysdate), ' +
                '        cp_usubaja = :usu ' +
                '  where cp_id = :idcaso ';

        EjecutarSqlSTEx(ssql, [fraMotBaja.Codigo, Sesion.UserID, RegSelec[i]]);

        sdqConsulta.Locate('cp_id', RegSelec[i], []);

        sSql := ' select ca_fechabaja ' +
                  ' from cca_carta ' +
                 ' where ca_id = :idcarta ';

        if (sdqConsulta.FieldByName('cp_idcarta').AsString <> '') and
           (ValorSqlDateTimeEx(sSql, [sdqConsulta.FieldByName('cp_idcarta').AsString]) = 0) then
        begin
          MsgBox('No se puede dar de baja: El caso seleccionado posee una Carta Documento generada y activa.');
          Rollback;
        end
        else
          CommitTrans;

      except
        on e: exception do
        begin
          Rollback;
          MsgBox('Error: ' + e.Message)
        end;
      end;
    end;

  end;

end;

procedure TfrmPuestaDisposicion.btnAceptarBajaClick(Sender: TObject);
begin
  verificar(fraMotBaja.IsEmpty, fraMotBaja, 'Debe seleccionar un motivo de baja');
  fpBaja.ModalResult := mrOk;
end;

function TfrmPuestaDisposicion.HayRegSeleccionado: boolean;
begin
  HayRegSeleccionado := RegSelec.Count > 0;
end;

procedure TfrmPuestaDisposicion.btnAceptarClick(Sender: TObject);
begin
  verificar(fraFirmantesfp.IsEmpty, fraFirmantesfp, 'Debe seleccionar un firmante');
  fpFirmantes.ModalResult := mrOk;
  
end;

procedure TfrmPuestaDisposicion.fpFirmantesShow(Sender: TObject);
var sIdFir: string; bTieneILT: boolean; i:integer;
begin
  chkUltimoPago.Checked := false;
  sIdFir := ValorsqlEx('select fi_id from cfi_firma where fi_codusuario = :cod and fi_fechabaja is null', [Sesion.UserID]);
  if sIdFir <> '' then
    fraFirmantesfp.Cargar(StrToInt(sIdFir), True)
  else
    fraFirmantesfp.Limpiar;

  i := 0;
  bTieneILT := false;
  while (i <= RegSelec.Count - 1) and not bTieneILT do
  begin
    sdqConsulta.Locate('cp_id', RegSelec[i], []);
    bTieneILT := sdqConsulta.FieldByName('cp_tipo').AsString = 'I';
    i := i + 1;
  end;

  vclextra.LockControls(chkUltimoPago, not bTieneILT);

end;

function TfrmPuestaDisposicion.VerificarVencidos: boolean;
var i: integer; bGenera: boolean;
begin
  i := 0;
  bGenera := False;
  while (i <= RegSelec.Count - 1) and (bGenera = false) do
  begin
    bGenera := ValorSqlEx('select art.dinerarias.get_generacartapuestadisp(:idcaso) from dual', [RegSelec[i]]) = 'S';
    i := i + 1;
  end;

  VerificarVencidos := bGenera;
end;

function TfrmPuestaDisposicion.VerificarSeleccion: boolean;
var i, iIdExpActual:integer; bIguales: boolean;
begin
  bIguales := True;
  Verificar(not HayRegSeleccionado, tbGenerarCD, 'Debe seleccionar un registro');
  Verificar(not VerificarVencidos, tbGenerarCD, 'Hay casos vencidos pendientes de generar');
  //Verificar(sdqConsulta.fieldbyname('cp_idcarta').AsString <> '', tbGenerarCD, 'La CD ya se generó anteriormente');
  //Verificar(not(AreIn(sdqConsulta.fieldbyname('estado').AsString, ['Pendiente', 'Vencida'])), tbGenerarCD, 'La CD ya se generó anteriormente');
  if RegSelec.Count > 1 then
  begin
    sdqConsulta.Locate('cp_id', RegSelec[0], []);
    iIdExpActual := sdqConsulta.fieldbyname('ex_id').AsInteger;
    for i := 1 to RegSelec.Count - 1 do
    begin
      sdqConsulta.Locate('cp_id', RegSelec[i], []);
      bIguales := bIguales and (sdqConsulta.fieldbyname('ex_id').AsInteger = iIdExpActual) and
                               (AreIn(sdqConsulta.fieldbyname('estado').AsString, ['Pendiente', 'Vencida']));
      iIdExpActual := sdqConsulta.fieldbyname('ex_id').AsInteger;
    end;
    if bIguales = false then
      InvalidHint(tbGenerarCD, 'Los registros seleccionados deben pertenecer a un mismo siniestro ' +
                               'y no tener CD generada');
  end;

  VerificarSeleccion := bIguales;

end;

procedure TfrmPuestaDisposicion.tbExportarClick(Sender: TObject);
begin

  if ExportDialog.Fields.Count = 0 then
    ExportDialog.Fields.Assign(Grid.Columns);
    
  ExportDialog.Execute;
  
  //if ExportDialog.Fields.Count = 0 then
    //ExportDialog.Fields.Clear;

end;

procedure TfrmPuestaDisposicion.tbImprimirClick(Sender: TObject);
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección para poder imprimirla.');
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
    QueryPrint.Print;
end;

procedure TfrmPuestaDisposicion.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPuestaDisposicion.mnuNuevoILPClick(Sender: TObject);
begin
  tbNuevoClick(Sender, 0);
end;

procedure TfrmPuestaDisposicion.mnuNuevoILTClick(Sender: TObject);
begin
  tbNuevoClick(Sender, 1);
end;

procedure TfrmPuestaDisposicion.mnuNuevoMortClick(Sender: TObject);
begin
  tbNuevoClick(Sender, 2);
end;

procedure TfrmPuestaDisposicion.mnuNuevoOPClick(Sender: TObject);
begin
  tbNuevoClick(Sender, 3);
end;

procedure TfrmPuestaDisposicion.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields( sdGrilla.SortFields, Grid.Columns );
  sdGrilla.Execute;

end;

procedure TfrmPuestaDisposicion.fpBajaShow(Sender: TObject);
begin
  fraMotBaja.Clear;

end;

procedure TfrmPuestaDisposicion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('cp_fechabaja').IsNull then
    AFont.Color := clRed;

end;

end.
