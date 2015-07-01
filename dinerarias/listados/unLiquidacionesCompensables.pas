unit unLiquidacionesCompensables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, Menus;

type
  TfrmLiquidacionesCompensables = class(TfrmCustomConsulta)
    gbFechaAutorizacion: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFechaAutorizDesde: TDateComboBox;
    edFechaAutorizHasta: TDateComboBox;
    rgTipoEmpresa: TRadioGroup;
    ShortCutControl1: TShortCutControl;
    mnuImprimir: TPopupMenu;
    mnuLiquidaciones: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuLiquidacionesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    psFiltros, psSql: String;
    procedure Validar;
  public
  end;

var
  frmLiquidacionesCompensables: TfrmLiquidacionesCompensables;

implementation
{$R *.dfm}

uses
  CustomDlgs, unComunes, unSesion, DateTimeFuncs, unDmPrincipal, AnsiSql, General,
  unRptLiquidacionesCompensables;

procedure TfrmLiquidacionesCompensables.tbRefrescarClick(Sender: TObject);
var
  sOrden, sTipoList, sSql: String;
begin
  Validar;

  Do_LimpiarTablaTemporal('TMP_LIQCOMPENSABLES', 'MP_USUARIO', Sesion.UserId);

  if rgTipoEmpresa.ItemIndex = 1 then   // sin deuda
  begin
    Do_LimpiarTablaTemporal('TMP_LIQCOMPENSABLESCUIT', 'MP_USUARIO', Sesion.UserId);

    sSql := 'INSERT INTO tmp_liqcompensablescuit(mp_usuario, mp_cuit, mp_deudaactual, ' +
                                                'mp_cuotapromedio, mp_cobertura) ' +
              'SELECT :Usuario, ex_cuit, ' +
                     'compdeuda.get_deuda(afiliacion.get_ultcontrato(ex_cuit), ''D'', ''S'', ''N''), ' +
                     'compdeuda.get_cuotapromedio(afiliacion.get_ultcontrato(ex_cuit), ''E'', ' +
                     'utiles.periodo_anterior(cobranza.get_ultperiododevengado(''E''), 12), cobranza.get_ultperiododevengado(''E''), ''S''), ' +
                     'afiliacion.check_cobertura(ex_cuit) ' +
               'FROM sex_expedientes, sle_liquiempsin ' +
              'WHERE le_faprobcobranzas >= :FDesde ' +
                'AND le_faprobcobranzas <= :FHasta ' +
                'AND NVL(le_estado, '''') = ''V'' ' +    // COMPENSABLE
                'AND le_imporperi <> 0 ' +
                'AND le_siniestro = ex_siniestro ' +
                'AND le_orden = ex_orden ' +
                'AND le_recaida = ex_recaida ' +
              'GROUP BY ex_cuit';
    EjecutarSqlEx(sSql, [Sesion.UserId, TDateTimeEx.Create(edFechaAutorizDesde.Date),
                         TDateTimeEx.Create(edFechaAutorizHasta.Date)]);

    sSql := 'UPDATE tmp_liqcompensablescuit ' +
               'SET mp_condeuda = ''N'' ' +
             'WHERE mp_usuario = :Usuario ' +
               'AND compdeuda.is_contratocondeuda(afiliacion.get_ultcontrato(mp_cuit), Null, Null, mp_cuotapromedio) = ''S'' ';
    EjecutarSqlEx(sSql, [Sesion.UserId]);
  end;

  sSql := 'INSERT INTO tmp_liqcompensables(mp_usuario, mp_siniestro, mp_orden, mp_recaida, ' +
                                          'mp_numliqui, mp_sincompleto) ' +
             'SELECT :Usuario, le_siniestro, le_orden, le_recaida, le_numliqui, ' +
                    'utiles.armar_siniestro(le_siniestro, le_orden, le_recaida) ';

  if rgTipoEmpresa.ItemIndex = 0 then   // todas
    begin
      sTipoList := 'Todas las empresas';

      sSql := sSql + 'FROM sex_expedientes, sle_liquiempsin ';
    end
  else
    begin
      sSql := sSql + 'FROM tmp_liqcompensablescuit, sex_expedientes, sle_liquiempsin ';

      sTipoList := 'Empresas sin deuda';
    end;
  psFiltros := sTipoList + ' - F. Autorización Desde: ' + edFechaAutorizDesde.Text + ' - Hasta: ' + edFechaAutorizHasta.Text;

  sSql := sSql + 'WHERE le_faprobcobranzas >= :FDesde ' +
                   'AND le_faprobcobranzas <= :FHasta ' +
                   'AND NVL(le_estado, '''') = ''V'' ' +    // COMPENSABLE
                   'AND le_imporperi <> 0 ' +
                   'AND le_siniestro = ex_siniestro ' +
                   'AND le_orden = ex_orden ' +
                   'AND le_recaida = ex_recaida ';

  if rgTipoEmpresa.ItemIndex = 1 then   // sin deuda
    sSql := sSql + 'AND ex_cuit = mp_cuit ' +
                   'AND mp_usuario = ' + SqlValue(Sesion.UserId) + ' ' +
                   'AND mp_condeuda = ''N''';     // sólo las empresas que no tienen deuda, según el criterio definido anteriormente

  EjecutarSqlEx(sSql, [Sesion.UserId, TDateTimeEx.Create(edFechaAutorizDesde.Date),
                      TDateTimeEx.Create(edFechaAutorizHasta.Date)]);

  sSql := 'SELECT mp_sincompleto, le_numliqui, ex_cuit, em_nombre, ex_cuil, tj_nombre, ' +
                 'le_fechades, le_fechahas, le_imporperi, le_faprobcobranzas, le_fproceso, ' +
                 'utiles.armar_cuit(ex_cuit) cuit, utiles.armar_cuit(ex_cuil) cuil ' +
            'FROM ctj_trabajador, aem_empresa, sex_expedientes, sle_liquiempsin, tmp_liqcompensables ' +
           'WHERE mp_usuario = ' + SqlValue(Sesion.UserId) + ' ' +
             'AND mp_siniestro = le_siniestro ' +
             'AND mp_orden = le_orden ' +
             'AND mp_recaida = le_recaida ' +
             'AND mp_numliqui = le_numliqui ' +
             'AND le_siniestro = ex_siniestro ' +
             'AND le_orden = ex_orden ' +
             'AND le_recaida = ex_recaida ' +
             'AND em_cuit = ex_cuit ' +
             'AND tj_cuil = ex_cuil ';

  sOrden := ' ORDER BY mp_sincompleto, le_numliqui';
  psSql  := sSql + sOrden;

  sdqConsulta.SQL.Text := sSql + NVL(SortDialog.OrderBy, sOrden);
  inherited;
end;

procedure TfrmLiquidacionesCompensables.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFechaAutorizDesde.Clear;
  edFechaAutorizHasta.Clear;
  rgTipoEmpresa.ItemIndex := 0;
end;

procedure TfrmLiquidacionesCompensables.Validar;
begin
  Verificar(edFechaAutorizDesde.IsEmpty or edFechaAutorizHasta.IsEmpty, edFechaAutorizDesde,
            'Debe seleccionar las fechas Desde-Hasta de Autorización para realizar la consulta.');
end;

procedure TfrmLiquidacionesCompensables.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('LE_IMPORPERI') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('LE_IMPORPERI')).Currency := True;
end;

procedure TfrmLiquidacionesCompensables.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmLiquidacionesCompensables.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmLiquidacionesCompensables.mnuLiquidacionesClick(Sender: TObject);
begin
  if (psSql <> '') and sdqConsulta.Active and not sdqConsulta.IsEmpty then
    GenerarListLiquidacionesCompensables(psSql, psFiltros)
  else
    MsgBox('No se han producido resultados, ingrese otros filtros.', MB_ICONINFORMATION);
end;

procedure TfrmLiquidacionesCompensables.FormCreate(Sender: TObject);
begin
  inherited;
  psSql     := '';
  psFiltros := '';
end;

end.
