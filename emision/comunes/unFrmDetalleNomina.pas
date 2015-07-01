unit unFrmDetalleNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, JvExControls,
  JvComponent, JvScrollMax, ExtCtrls, JvExExtCtrls, DB, SDEngine, StdCtrls,
  ComCtrls, ToolWin, PeriodoPicker, Mask, ToolEdit, CurrEdit, Placemnt,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraTrabajador,
  PatternEdit, ComboEditor, CheckCombo, QueryToFile, ExportDialog,
  QueryPrint, unArt, FieldHider, SortDlg, JvgGroupBox, FormPanel,
  unContratoTrabajador;

type
  TFormDetalleNomina = class(TForm)
    ScrollDetall: TJvScrollMax;
    sbDetalleTrabajadores: TJvScrollMaxBand;
    sbMovimientosGenerados: TJvScrollMaxBand;
    dbgDevengado: TArtDBGrid;
    sbObservaciones: TJvScrollMaxBand;
    dbgObservaciones: TArtDBGrid;
    sdqTrabajadores: TSDQuery;
    dsTrabajadores: TDataSource;
    sdqDevengados: TSDQuery;
    dsDevengados: TDataSource;
    dsObservacionesGeneradas: TDataSource;
    sdqObservacionesGeneradas: TSDQuery;
    sbGeneral: TJvScrollMaxBand;
    sdqRecepciones: TSDQuery;
    pnGeneral: TPanel;
    lblOrigenNomina: TLabel;
    lblCantTrabajadores: TLabel;
    lblMasa: TLabel;
    lblEnCero: TLabel;
    lblPresentacion: TLabel;
    lblContacto: TLabel;
    lblPeriodo: TLabel;
    lblFormulario: TLabel;
    lblCondicion: TLabel;
    edtOrigen: TEdit;
    edtCantidadTrabajadores: TEdit;
    edtEnCero: TEdit;
    edtFechaPresentacion: TEdit;
    edtContrato: TEdit;
    edtPeriodo: TEdit;
    edtFormulario: TEdit;
    edtSUSS: TEdit;
    tbComandosDelcaracionesJuradas: TToolBar;
    tbExportar: TToolButton;
    tbSalir: TToolButton;
    pnSeparador: TPanel;
    tbImprimir: TToolButton;
    lblActiva: TLabel;
    gbDetalleEmision: TGroupBox;
    lblFijo: TLabel;
    edtSumaFijaCalculo: TEdit;
    lblVariablre: TLabel;
    edtSumaVariableCalculo: TEdit;
    lblCantidadTrabajadores: TLabel;
    edtCantidadTrabajadoresCalculo: TEdit;
    lblMasaTrabajadores: TLabel;
    lblCuota: TLabel;
    edtCuotaCalculadaCalculo: TEdit;
    lblFechaEndoso: TLabel;
    edtFechaEndosoCalculo: TEdit;
    gbTotalesCalculo: TGroupBox;
    lblTrabajadoresDeclarados: TLabel;
    edtTrabajadoresDeclarado: TEdit;
    lblTrabajorCalculo: TLabel;
    edtTrabajadoresCalculo: TEdit;
    lblTotalesParaCalculo: TLabel;
    lblMaso: TLabel;
    lblDeclarados: TLabel;
    lblMasaDeclarados: TLabel;
    lblNoActivos: TLabel;
    edtTrabajadoresNoActivos: TEdit;
    lblCodigoRectificativaOriginal: TLabel;
    edtCodRectifOriginal: TEdit;
    lblRecticativa: TLabel;
    pnSeparador2: TPanel;
    lblMetodo: TLabel;
    edtMetodo: TEdit;
    pn: TPanel;
    lblReferenciaPeriodoEstimado: TLabel;
    pnColorTrabajadorNoTomadoEnCuenta: TPanel;
    lblTrabajadorNoTomadoCuenta: TLabel;
    lblCuotaSegunMetodo: TLabel;
    edtCuotaMetodo: TEdit;
    sbGestionesRealizadas: TJvScrollMaxBand;
    dbgGestionesRealizadas: TArtDBGrid;
    dsGestionesRealizadas: TDataSource;
    sdqGestionesRealizadas: TSDQuery;
    tbPeriodoAnterior: TToolButton;
    tbPeriodoPosterior: TToolButton;
    ToolButton3: TToolButton;
    ppPeriodo: TPeriodoPicker;
    tbNominaAnteriorPeriodo: TToolButton;
    tbNominaPosteriorPeriodo: TToolButton;
    edtMasa: TCurrencyEdit;
    edtTotalMasaCalculo: TCurrencyEdit;
    edtMasaDeclarada: TCurrencyEdit;
    edtMasaSalarialCalculo: TCurrencyEdit;
    edtModoCarga: TEdit;
    lblModoCarga: TLabel;
    sbEstadosYVariables: TJvScrollMaxBand;
    dbgVariables: TArtDBGrid;
    dbgEstados: TArtDBGrid;
    sdEstados: TDataSource;
    dsVariables: TDataSource;
    spVariables: TSDStoredProc;
    spEstados: TSDStoredProc;
    pnAutorizaciones: TPanel;
    lblReqAutorizacion: TLabel;
    lblTipoAutorizacion: TLabel;
    lblFechaCumplimiento: TLabel;
    edtRequiereAutorizacion: TEdit;
    edtTipoAutorizacion: TEdit;
    edCumplimiento: TEdit;
    pnNota: TPanel;
    lblFechaNota: TLabel;
    lblBibliorato: TLabel;
    lblSecuencia: TLabel;
    edtFechaNotaAplicada: TEdit;
    edtBibliorato: TEdit;
    edtSecuencia: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    FormStorage: TFormStorage;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cmbTipo: TCheckCombo;
    fraTrabajador: TfraTrabajador;
    ToolBarNominas: TToolBar;
    tbRefrescar: TToolButton;
    dbgDetalleTrabajadores: TArtDBGrid;
    ExportDialog: TExportDialog;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    lblInfoAdicional: TLabel;
    edtInfoAdicional: TEdit;
    tbMostrarOcultarColumnas: TToolButton;
    FieldHider: TFieldHider;
    tbOrdenar: TToolButton;
    SortDialog: TSortDialog;
    Label2: TLabel;
    edMotivo: TEdit;
    edObservacionAuto: TMemo;
    Label3: TLabel;
    ToolBar: TToolBar;
    tbAutoAnt: TToolButton;
    tbAutoSig: TToolButton;
    sbTrabajadoresporSituacion: TJvScrollMaxBand;
    dbgTrabPorSit: TArtDBGrid;
    sdqTrabPorSit: TSDQuery;
    dsTrabPorSit: TDataSource;
    lbltiponom: TLabel;
    edTipoNomina: TEdit;
    sbTrabajadoresporActividad: TJvScrollMaxBand;
    dbgTrabPorAct: TArtDBGrid;
    sdqTrabPorAct: TSDQuery;
    dsTrabPorAct: TDataSource;
    Panel2: TPanel;
    Label4: TLabel;
    tbObservaciones: TToolButton;
    fpObservacionTrabajador: TFormPanel;
    Bevel2: TBevel;
    btnCerrar: TButton;
    gdbObservacionTrabajador: TArtDBGrid;
    sdqObservacionTrabajador: TSDQuery;
    dsObservacionTrabajador: TDataSource;
    tbManTrab: TToolButton;
    ToolButton1: TToolButton;
    ppPeriodoHasta: TPeriodoPicker;
    ToolButton2: TToolButton;
    pnlDDJJInactiva: TPanel;
    lblDDJJInactiva: TLabel;
    procedure tbSalirClick(Sender: TObject);
    procedure dbgDevengadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDetalleTrabajadoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqDevengadosAfterScroll(DataSet: TDataSet);
    procedure tbPeriodoAnteriorClick(Sender: TObject);
    procedure tbPeriodoPosteriorClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqTrabajadoresAfterOpen(DataSet: TDataSet);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNominaPosteriorPeriodoClick(Sender: TObject);
    procedure ppPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbAutoAntClick(Sender: TObject);
    procedure tbAutoSigClick(Sender: TObject);
    procedure sdqTrabPorActAfterOpen(DataSet: TDataSet);
    procedure sdqTrabPorSitAfterOpen(DataSet: TDataSet);
    procedure tbObservacionesClick(Sender: TObject);
    procedure sdqTrabajadoresAfterScroll(DataSet: TDataSet);
    procedure dbgDetalleTrabajadoresDblClick(Sender: TObject);
    procedure tbManTrabClick(Sender: TObject);
    procedure ppPeriodoHastaKeyPress(Sender: TObject; var Key: Char);
  private
    FContrato, FCodigoRectif : Integer;
    FPeriodo : string;
    FPeriodoHasta : string;
    QAuto : TSDQuery;
    pbNominaActual: Boolean;
    pIdDDJJ: TTAbleId;
    FBuscaPorDesdeHasta: Boolean;
    procedure SetearAutorizacionRequerida(AIdddjj : Integer);
    procedure MostrarPeriodoAnterior(AContrato : integer; var APeriodo: String);
    procedure MostrarPeriodoPosterior(AContrato: Integer;  var APeriodo: String);
    procedure CargarNominas(Contrato, CodigoRectif: Integer; Periodo, PeriodoHasta, Cuil: String);
    procedure CargarTrabPorSituacion(Contrato, CodigoRectif: Integer; Periodo: String);
    procedure CargarTrabPorActividad(Contrato, CodigoRectif: Integer; Periodo: String);
    function Get_CodigoRectificativa(IdDDJJ: TTableId): Integer;
    function Get_IdDDJJ(Contrato, CodigoRectif: Integer; Periodo: String): TTableId;
    function Get_Periodo(IdDDJJ: TTableId): String;
    function Is_CambioDDJJ: Boolean;
    procedure Limpiar;
    procedure CerrarConsultas;
    procedure VisualizarAutoriz;
    procedure CargarTrabajador;
  public
    procedure MostrarDetalle(ADeclaracion: Integer);
  end;

procedure VerDetalleNominaSeleccionada(AIdDDJJ, Contrato: Integer; Periodo: String); overload;
procedure VerDetalleNominaSeleccionada(AContrato: integer; APeriodo : string); overload;

var
  FormDetalleNomina: TFormDetalleNomina;

implementation

uses unDmEmision, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General, StrFuncs,
     unFuncionesEmision, Math, Periodo, unCustomConsulta;

{$R *.dfm}

procedure VerDetalleNominaSeleccionada(AIdDDJJ, Contrato: Integer; Periodo: String);
begin
  Screen.Cursor := crHourglass;

  with TFormDetalleNomina.Create(nil) do
  try
    Limpiar;
    Screen.Cursor := crDefault;

    ppPeriodo.Periodo.Valor := Periodo;
    ppPeriodoHasta.Periodo.Valor := Periodo;
    FContrato     := Contrato;
    if AIdDDJJ <> ART_EMPTY_ID then
    begin
      FCodigoRectif  := Get_CodigoRectificativa(AIdDDJJ);
      FPeriodo       := Get_Periodo(AIdDDJJ);
      FPeriodoHasta  := FPeriodo;

      pbNominaActual := True;
      pIdDDJJ        := AIdDDJJ;
    end
    else begin
      AIdDDJJ := Get_IdDeclaracionPotencial(Contrato, Periodo);
      FCodigoRectif := Get_CodigoRectificativa(AIdDDJJ);
      FPeriodo      := Periodo;
      FPeriodoHasta := Periodo;
    end;

    MostrarDetalle(AIdDDJJ);

    Showmodal;
  finally
    free;
  end;
end;

procedure VerDetalleNominaSeleccionada(AContrato : Integer; APeriodo : String);
var
 IdDDJJ : integer;
begin
  IdDDJJ := get_ultimaiddeclaracion(Acontrato, APeriodo);
  if IdDDJJ > 0 then
    VerDetalleNominaSeleccionada(IdDDJJ, Acontrato, APeriodo);
end;

procedure TFormDetalleNomina.MostrarDetalle(ADeclaracion: Integer);
begin
  Limpiar;

  if not ((cmbtipo.CheckedCount = 0) or (FPeriodo = '')) then
    begin
      sdqRecepciones.ParamByName('id').AsInteger := ADeclaracion;
      sdqRecepciones.Open;

      if sdqRecepciones.RecordCount > 0 then
      begin
        FCodigoRectif := Get_CodigoRectificativa(ADeclaracion);
        FPeriodo      := sdqRecepciones.FieldByName('periodo').AsString;
        FPeriodoHasta  := ppPeriodoHasta.Periodo.Valor;

        ppPeriodo.Periodo.Valor       := sdqRecepciones.FieldByName('periodo').AsString;

        edtContrato.text              := sdqRecepciones.FieldByName('contrato').AsString;
        edtPeriodo.text               := sdqRecepciones.FieldByName('periodo').AsString;
        edtCantidadTrabajadores.text  := sdqRecepciones.FieldByName('empleados').AsString;
        edtMasa.Text                  := sdqRecepciones.FieldByName('masasalarial').AsString;
        edtEnCero.Text                := sdqRecepciones.FieldByName('encero').AsString;
        edtOrigen.Text                := sdqRecepciones.FieldByName('ORIGEN').AsString;
        edtFechaPresentacion.Text     := sdqRecepciones.FieldByName('fecha_presentacion').AsString;
        edtModoCarga.Text             := sdqRecepciones.FieldByName('modo_carga').AsString;
        edTipoNomina.Text             := sdqRecepciones.FieldByName('tiponomina').AsString;

        if (sdqRecepciones.FieldByName('Activa').AsString = 'S') then
          lblActiva.Caption := 'Activa'
        else
          lblActiva.Caption := 'No Activa';

        lblRecticativa.Caption := sdqRecepciones.FieldByName('rectificativa').AsString;

        edtFormulario.Text     := sdqRecepciones.FieldByName('tipoformulario').AsString;
        edtInfoAdicional.Text  := sdqRecepciones.FieldByName('info_adicional').AsString;

        if not sdqRecepciones.FieldByName('nota').isnull then
        begin
          pnNota.Visible     := true;
          edtBibliorato.Text := sdqRecepciones.FieldByName('bibliorato').asstring;
          edtSecuencia.Text  := sdqRecepciones.FieldByName('secuencia').asstring;
          edtFechaNotaAplicada.Text := FormatDateTime('dd/mm/yyyy', sdqRecepciones.FieldByName('NO_FECHAAPLICACION').AsDateTime);
        end
        else
          pnNota.Visible := false;

        edtCodRectifOriginal.Text := sdqRecepciones.FieldByName('dj_codigorectificativaoriginal').asstring;

        edtTrabajadoresCalculo.text := sdqRecepciones.FieldByName('empleados').asstring;
        edtTotalMasaCalculo.text    := sdqRecepciones.FieldByName('masasalarial').asstring;

        edtTrabajadoresDeclarado.text := sdqRecepciones.FieldByName('dj_empleadosdeclarados').asstring;
        edtTrabajadoresNoActivos.text := sdqRecepciones.FieldByName('dj_empleadosdeclaradosnoactivo').asstring;
        edtMasaDeclarada.text         := sdqRecepciones.FieldByName('dj_masadeclarada').asstring;
        edtSUSS.Text                  := sdqRecepciones.FieldByName('SUSS').asstring;

        sdqObservacionesGeneradas.ParamByName('DJ_ID').AsInteger := ADeclaracion;
        sdqObservacionesGeneradas.Open;

//        sdqGestionesRealizadas.ParamByName('idddjj').AsInteger := ADeclaracion;
//        sdqGestionesRealizadas.Open;

      end;

      sdqDevengados.ParamByName('contrato').AsInteger    := FContrato;
      sdqDevengados.ParamByName('periodo').AsString      := FPeriodo;
      sdqDevengados.ParamByName('declaracion').AsInteger := ADeclaracion;
      sdqDevengados.Open;

      SetearAutorizacionRequerida(ADeclaracion);

      CargarNominas(FContrato, FCodigoRectif, FPeriodo, FPeriodoHasta, fraTrabajador.Cuil);
      CargarTrabPorSituacion(FContrato, FCodigoRectif, FPeriodo);
      CargarTrabPorActividad(FContrato, FCodigoRectif, FPeriodo);
    end;
end;

Procedure TFormDetalleNomina.SetearAutorizacionRequerida(AIdddjj : Integer);
//var
// Q : TSDQuery;
begin
(*
   Q := GetQuery('SELECT isa.*, ina.na_descripcion, ita.ta_descripcion,      ' +
                  '       decode(isa.sa_tipocumplimiento,                   ' +
                  '       ''A'', ''Aprobada'',                              ' +
                  '       ''N'', ''No Aprobada'',                           ' +
                  '       ''D'', ''Derivada'',                              ' +
                  '       ''E'', ''Eliminada'',                             ' +
                  '       ''M'', ''Mixto'',                                 ' +
                  '       ''Pendiente'') Estado,                            ' +
                  '       ma_descripcion                                    ' +
                  ' FROM emi.isa_solicitudautorizacion isa,                 ' +
                  '      emi.ina_nivelautorizacion ina,                     ' +
                  '      emi.ita_tipoautorizacion ita,                      ' +
                  '       emi.ima_motivoautorizacion,                       ' +
                  '      emi.idj_ddjj idj ' +
                  ' WHERE isa.sa_idnivelautorizacion = ina.na_id            ' +
//                  ' AND isa.sa_contrato = ' + SqlValue(AContrato)             +
                  ' AND  isa.sa_idtipoautorizacion = ita.ta_id              ' +
                  ' AND  isa.sa_id = idj.dj_idsolicitudautorizacion         ' +
                  ' AND  isa.sa_idmotivo =  ma_id(+)                        ' +
                  ' AND  idj.dj_id = ' + SqlValue(AIdddjj));
//                  ' AND  isa.sa_fechacumplimiento is null                   ' +
//                  ' AND EXISTS (                                            ' +
//                  '           SELECT 1                                      ' +
//                  '             FROM emi.isp_solicitudautorizperiodo        ' +
//                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
//                  '                  AND sp_periodo = '+ SqlValue(APeriodo)   +
//                  ')');
*)

  QAuto := GetQuery(' SELECT   do_fechamotivo fechacumpli, do_usumotivo usucumpli, ''Autorización/Rechazo Manual'' tipoauto, do_observacion obs, ' +
                '          DECODE(ma_tipo, ''A'', ''Restablecida'', ''R'', ''Rechazada'') estado, NULL autreq, ma_descripcion motivo ' +
                '    FROM emi.ida_ddjjaceptacionrech, emi.ima_motivoaceprech ' +
                '   WHERE da_idmotivo = ma_id ' +
                '     AND da_idddjj = ' + SqlValue(AIdddjj) +
                ' UNION ALL ' +
                ' SELECT   sa_fechacumplimiento fechacumpli, sa_usuariocumplimiento usucumpli, ta_descripcion tipoauto, sa_observacion obs, ' +
                '          DECODE(isa.sa_tipocumplimiento, ' +
                '                ''A'', ''Aprobada'', ' +
                '                ''N'', ''No Aprobada'', ' +
                '                ''U'', ''Aprobada Agendada'', ' +
                '                ''O'', ''No Aprobada Agendada'', ' +
                '                ''D'', ''Derivada'', ' +
                '                ''E'', ''Eliminada'', ' +
                '                ''M'', ''Mixto'', ' +
                '                ''Pendiente'') estado, ' +
                '          na_descripcion autreq, ma_descripcion motivo ' +
                '    FROM emi.isa_solicitudautorizacion isa, emi.ina_nivelautorizacion ina, emi.ita_tipoautorizacion ita, ' +
                '         emi.ima_motivoautorizacion, emi.idj_ddjj idj ' +
                '   WHERE isa.sa_idnivelautorizacion = ina.na_id ' +
                '     AND isa.sa_idtipoautorizacion = ita.ta_id ' +
                '     AND isa.sa_id = idj.dj_idsolicitudautorizacion ' +
                '     AND isa.sa_idmotivo = ma_id(+) ' +
                '     AND idj.dj_id = ' + SqlValue(AIdddjj) +
                ' ORDER BY 1 DESC ');

//   try
   if QAuto.RecordCount > 0 then
   begin
      pnAutorizaciones.visible     := true;
      VisualizarAutoriz;
(*
      edtRequiereAutorizacion.Text := iif(QAuto.FieldByName('autreq').asstring <> '', QAuto.FieldByName('autreq').asstring + ' - ', '') + iif(not QAuto.FieldByName('usucumpli').IsNull, QAuto.FieldByName('usucumpli').asstring, '');
      edtTipoAutorizacion.Text     := QAuto.FieldByName('tipoauto').asstring;
      edCumplimiento.Text          := QAuto.FieldByName('estado').asstring  +  iif(not QAuto.FieldByName('fechacumpli').IsNull, ' - ' + QAuto.FieldByName('fechacumpli').asstring, '');
      edMotivo.Text                := QAuto.FieldByName('motivo').asstring;
      edObservacionAuto.Text       := QAuto.FieldByName('obs').asstring;
*)
   end else
      pnAutorizaciones.visible := false;
//   finally
//     Q.free;
//   end;

   (*
   try
     if Q.RecordCount > 0 then
     begin
        pnAutorizaciones.visible     := true;
        edtRequiereAutorizacion.Text := Q.FieldByName('na_descripcion').asstring + iif(not Q.FieldByName('sa_usuariocumplimiento').IsNull, ' - ' +  Q.FieldByName('sa_usuariocumplimiento').asstring, '');
        edtTipoAutorizacion.Text     := Q.FieldByName('ta_descripcion').asstring;
        edCumplimiento.Text          := Q.FieldByName('Estado').asstring  +  iif(not Q.FieldByName('sa_fechacumplimiento').IsNull, ' - ' + Q.FieldByName('sa_fechacumplimiento').asstring, '');
        edMotivo.Text                := Q.FieldByName('ma_descripcion').asstring;
        edObservacionAuto.Text       := Q.FieldByName('sa_observacion').asstring;
     end else
        pnAutorizaciones.visible := false;
   finally
     Q.free;
   end;
*)
end;


procedure TFormDetalleNomina.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TFormDetalleNomina.dbgDevengadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqDevengados.FieldByName('UsaDeclaracionVista').AsString = 'S' then
    if Not Highlight then
      Background := $00E1FFFF
    else
      Background := clTeal;
end;

procedure TFormDetalleNomina.dbgDetalleTrabajadoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqTrabajadores.FieldByName('Activo').AsString = 'N') then
    AFont.Color := clRed;

  if (sdqTrabajadores.FieldByName('SINCONILT').AsString = 'S') then
    AFont.Style := [fsBold];

  if (sdqTrabajadores.FieldByName('Emite').AsString = 'No') then
  begin
    if Not Highlight then
      Background := $00E1FFFF
    else
      Background := clTeal;
  end;

  if (sdqTrabajadores.FieldByName('EV_ESTADO').AsString <> 'A') then
  begin
    if Not Highlight then
      Background := pnlDDJJInactiva.Color
    else
      Background := clTeal;
  end;
end;

procedure TFormDetalleNomina.sdqDevengadosAfterScroll(DataSet: TDataSet);
begin
  edtCantidadTrabajadoresCalculo.Text := DataSet.FieldByName('dj_empleados').Asstring;
  edtMasaSalarialCalculo.Value        := DataSet.FieldByName('dj_masasalarial').AsCurrency;
  edtSumaFijaCalculo.Text             := DataSet.FieldByName('ht_sumafija').Asstring;
  edtSumaVariableCalculo.Text         := DataSet.FieldByName('ht_porcmasa').Asstring;
  edtFechaEndosoCalculo.Text          := DataSet.FieldByName('ht_vigenciatarifa').Asstring;

  //FIXME... Agregár el método de cálculo.
  edtMetodo.Text := '';

  edtCuotaMetodo.Text           := CurrToStr(RoundTo(get_devengadoprevisto(DataSet.FieldByName('dj_id').AsInteger),-2));
  edtCuotaCalculadaCalculo.Text :=  CurrToStr(RoundTo((DataSet.FieldByName('dj_masasalarial').AsCurrency *
                                   DataSet.FieldByName('ht_porcmasa').AsFloat / 100) +
                                   (DataSet.FieldByName('dj_empleados').AsInteger  * DataSet.FieldByName('ht_sumafija').AsFloat), -2));
end;

procedure TFormDetalleNomina.tbPeriodoAnteriorClick(Sender: TObject);
begin
  if Is_CambioDDJJ() then
    MostrarPeriodoAnterior(FContrato, FPeriodo);
end;

procedure TFormDetalleNomina.tbPeriodoPosteriorClick(Sender: TObject);
begin
  if Is_CambioDDJJ() then
    MostrarPeriodoPosterior(FContrato, FPeriodo);
end;

procedure TFormDetalleNomina.MostrarPeriodoAnterior(AContrato : Integer; var APeriodo : String);
var
  Declaracion : integer;
  Periodo : String;
  contador : integer;
  encontrado  : boolean;
begin
  Periodo := APeriodo;
  contador := 0;
  encontrado := false;
  repeat
    inc(contador);

    Declaracion := get_idultimanominaperiodoanterior(AContrato, Periodo);

    if Periodo <> '' then
    begin
      if Periodo < APeriodo then
      begin
        ppPeriodo.Periodo.Valor := Periodo;
        ppPeriodoHasta.Periodo.Valor := Periodo;
        APeriodo := Periodo;
        pbNominaActual := False;
        MostrarDetalle(Declaracion);
        encontrado := true;
      end
      else
        Periodo := AddPeriodo(Periodo, -1 * contador);
    end;
  until encontrado or (Periodo = '') or (Periodo < '199601');
end;

procedure TFormDetalleNomina.MostrarPeriodoPosterior(AContrato : Integer; var APeriodo : String);
var
  Declaracion : integer;
  Periodo : String;
  contador : integer;
  encontrado : boolean;
begin
  Periodo := APeriodo;
  contador := 0;
  encontrado := false;

  repeat
    inc(contador);

    Declaracion := get_idultimanominaperiodoproximo(AContrato, Periodo);
    if Periodo <> '' then
    begin
      if Periodo > APeriodo then
      begin
        ppPeriodo.Periodo.Valor := Periodo;
        ppPeriodoHasta.Periodo.Valor := Periodo;
        APeriodo := Periodo;
        pbNominaActual := False;
        MostrarDetalle(Declaracion);
        encontrado := true;
      end
      else
        Periodo := AddPeriodo(Periodo, contador);
    end;
  until encontrado or (Periodo = '') or (Periodo = GetPeriodo(DBDate, fpAnioMes));
end;

procedure TFormDetalleNomina.tbRefrescarClick(Sender: TObject);
var
  IdDDJJ: integer;
begin
  if FPeriodo <> ppPeriodo.Text then
    FPeriodo := ppPeriodo.Text;

  if Is_CambioDDJJ() and (FPeriodo <> '') then
    begin
      if pbNominaActual then
        IdDDJJ := pIdDDJJ
      else
        IdDDJJ := get_ultimaiddeclaracion(FContrato, FPeriodo);
    end
  else
    IdDDJJ := ART_EMPTY_ID;

  MostrarDetalle(IdDDJJ);

  if FBuscaPorDesdeHasta then Limpiar;
end;

procedure TFormDetalleNomina.sdqTrabajadoresAfterOpen(DataSet: TDataSet);
begin
  if sdqTrabajadores.FieldByName( 'REMTOT' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'REMTOT' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'APOBLISS' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'APOBLISS' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'APVOLSS' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'APVOLSS' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'SUELDO' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'SUELDO' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'SAC' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'SAC' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'EXTRAS' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'EXTRAS' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'ZONADES' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'ZONADES' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'VACACIONES' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'VACACIONES' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'REMIMSS' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'REMIMSS' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'PORCREDU' ) is TFloatField then
    TFloatField( sdqTrabajadores.FieldByName( 'PORCREDU' ) ).DisplayFormat := '% #,##0.00';

  if sdqTrabajadores.FieldByName( 'ADICTRI' ) is TFloatField then
    TFloatField( sdqTrabajadores.FieldByName( 'ADICTRI' ) ).DisplayFormat := '% #,##0.00';

  if sdqTrabajadores.FieldByName( 'RemAnt' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'RemAnt' ) ).Currency := True;

  if sdqTrabajadores.FieldByName( 'DT_REMUNERACIONCONFORMADA' ) is TFloatField then
     TFloatField( sdqTrabajadores.FieldByName( 'DT_REMUNERACIONCONFORMADA' ) ).Currency := True;

//  if sdqTrabajadores.FieldByName( 'REMBRUT' ) is TFloatField then
//     TFloatField( sdqTrabajadores.FieldByName( 'REMBRUT' ) ).Currency := True;
end;

procedure TFormDetalleNomina.tbExportarClick(Sender: TObject);
begin
  if sbDetalleTrabajadores.Expanded then
    begin
        with ExportDialog do
          begin
            Fields.Clear;
            DataSet := sdqTrabajadores;
            Fields.Assign(dbgDetalleTrabajadores.Columns);
            Execute;
          end;
    end;

  if sbTrabajadoresporSituacion.Expanded then
    begin
        with ExportDialog do
          begin
            Fields.Clear;
            DataSet := sdqTrabPorSit;
            Fields.Assign(dbgTrabPorSit.Columns);
            Execute;
          end;
    end;

  if sbTrabajadoresporActividad.Expanded then
    begin
        with ExportDialog do
          begin
            Fields.Clear;
            DataSet := sdqTrabPorAct;
            Fields.Assign(dbgTrabPorAct.Columns);
            Execute;
          end;
    end;

end;

procedure TFormDetalleNomina.tbImprimirClick(Sender: TObject);
var
  sSql, sSubTitulo: String;
  SqlResults: TStringList;
begin

  QueryPrint.Fields.Clear;

  if sbDetalleTrabajadores.Expanded then
    begin
      sSql := 'SELECT EM_NOMBRE, EM_CUIT ' +
                'FROM AEM_EMPRESA, ACO_CONTRATO ' +
               'WHERE CO_IDEMPRESA = EM_ID ' +
                 'AND CO_CONTRATO = ' + SqlValue(FContrato);

      SqlResults := ValoresColSql(sSql);
      try
        sSubTitulo := 'Empr.: ' + SqlResults[0] + '-CUIT: ' + SqlResults[1] + '-Contrato: ' + IntToStr(FContrato);
      finally
        SqlResults.Free;
      end;

      QueryPrint.DataSource := dsTrabajadores;
      PrintResultsNew(PrintDialog, dbgDetalleTrabajadores, dsTrabajadores, QueryPrint, tbImprimir, '', sSubTitulo);
    end;

  if sbTrabajadoresporSituacion.Expanded then
    begin
      sSql := 'SELECT EM_NOMBRE, EM_CUIT ' +
                'FROM AEM_EMPRESA, ACO_CONTRATO ' +
               'WHERE CO_IDEMPRESA = EM_ID ' +
                 'AND CO_CONTRATO = ' + SqlValue(FContrato);

      SqlResults := ValoresColSql(sSql);
      try
        sSubTitulo := 'Empr.: ' + SqlResults[0] + '-CUIT: ' + SqlResults[1] + '-Contrato: ' + IntToStr(FContrato);
      finally
        SqlResults.Free;
      end;

      QueryPrint.DataSource := dsTrabPorSit;
      PrintResultsNew(PrintDialog, dbgTrabPorSit, dsTrabPorSit, QueryPrint, tbImprimir, '', sSubTitulo);
    end;

end;

procedure TFormDetalleNomina.CargarNominas(Contrato, CodigoRectif: Integer; Periodo, PeriodoHasta, Cuil: String);
var
  sSql: String;
begin
  if cmbtipo.Checked[0] then
    begin
      sSql := 'SELECT ''DGI'' TIPO, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, TO_DATE(NULL) FECHAINGRESO, TO_DATE(NULL) FECHARECEPCION, DT_CUIL CUIL, TJ_NOMBRE, DJ_PERIODO PERIODO, ' +
                      'TO_DATE(NULL) FECHAEGRESO, ''1'' CODRECEPCION, DJ_FECHAPRESENTACION FECHA_PRESENTACION, DT_ZONA ZONA, DT_CODIGOCONDICION CONDICION, DT_ACTIVIDADES ACTIVIDAD, ' +
                      'DT_CODIGOOBRASOCIAL OBRASOCIAL, DT_MODOCONTRATACION MODCONTR, DJ_CODIGORECTIFICATIVA CODRECTIF, DT_CODIGOSITUACION CODSITU, DT_SECDJ SECDJ, DT_SECNOM SECNOM, ' +
                      'DT_NUMEROOBLIGACION NUMOBLE, DJ_SECUENCIAOBLIGACION SECOBLIG, DJ_BANCO BANCO, DT_PORCENTAJEREDUCCION PORCREDU, DT_REMUNERACIONTOTAL REMTOT, DT_ADICIONALTAREARIESGO ADICTRI, DT_APORTEOBLIGATORIOSS APOBLISS, ' +
                      'DT_APORTEVOLUNTARIOSS APVOLSS, DT_CODSINIESTRO CODSINI, CTBCODSIN.TB_DESCRIPCION DESCODSIN, DT_SITUACIONCUIL_1 SITUACION1, TO_CHAR(DT_FECHASITUACIONCUIL_1, ''DD'') DESDE1, DT_SITUACIONCUIL_2 SITUACION2, TO_CHAR(DT_FECHASITUACIONCUIL_2, ''DD'') DESDE2, ' +
                      'DT_SITUACIONCUIL_3 SITUACION3, TO_CHAR(DT_FECHASITUACIONCUIL_3, ''DD'') DESDE3, DT_SUELDO SUELDO, DT_SAC SAC, DT_HORASEXTRA EXTRAS, DT_ZONADESFAVORABLE ZONADES, DT_VACACIONES VACACIONES, ' +
                      'DT_DIASLABORALES LABORABLES, DT_REMUNERACION REMIMSS,  ' +
                      'CTBZONA.TB_DESCRIPCION DESZONA, CTBACTIV.TB_DESCRIPCION DESACTIV, OS_DESCRIPCION DESOSOCIAL, CTBMODCONTR.TB_DESCRIPCION DESMODCONTR, ' +
                      'EMI.UTILES.GET_DESCCODIGOSITUACION(DT_CODIGOSITUACION, DJ_PERIODO, ''D'') DESCODSITUACDDJJ, ' +
                      'EMI.UTILES.GET_DESCCODIGOSITUACION(DT_CODIGOSITUACIONMS, DJ_PERIODO, ''S'') DESCODSITUACMS, DT_CODIGOSITUACIONMS, ' +
                      'DECODE(DT_DEVENGABLE, ''S'', ''Si'', ''No'') EMITE, EMI.UTILES.GET_CODIGOSITUACIONACTIVO(NVL(DT_CODIGOSITUACIONMS, DT_CODIGOSITUACION), DJ_PERIODO, NVL2(DT_CODIGOSITUACIONMS, ''S'', ''D'')) ACTIVO, ' +
                      'DECODE(DT_TOPEOAPLICADO, 0, ''Sin Topeo'', 1, ''Mínimo'', 2, ''Máximo'', 3, ''Máximo y Mínimo'') TOPEOAPLICADO, EMI.UTILES.GET_SINIESTROCONILT(EM_CUIT, DT_CUIL) SINCONILT, DT_REMUNERACIONORIGINAL RemAnt, ' +
                      '(SELECT COUNT(*) ' +
                      'FROM emi.ito_ddjjtrabajadorobservacion ' +
                      'WHERE to_idddjjtrabajador = dt_id) Observaciones, dt_id, dt_adicionales, dt_premios, dt_noremunerativos, dt_presentismo, dt_bonus, dt_antiguedad, dt_viaticos, dt_refrigerio, dt_otrosconceptos, ev_estado, ' +
                      'DT_IDOPERACIONTOPEOMAX, DT_IDOPERACIONTOPEOMIN, DT_CALCULOTOPEOMAX, DT_CALCULOTOPEOMIN, OPERMAX.OT_DESCRIPCION DESCOPERMAX, OPERMIN.OT_DESCRIPCION DESCOPERMIN, DT_REMUNERACIONCONFORMADA ' +
                 'FROM EMI.IOT_OPERACIONTOPEO OPERMIN, EMI.IOT_OPERACIONTOPEO OPERMAX, EMI.IEV_ESTADOVERIFICADO, COS_OSOCIAL, CTB_TABLAS CTBCODSIN, CTB_TABLAS CTBMODCONTR, CTB_TABLAS CTBACTIV, CTB_TABLAS CTBZONA, EMI.IDT_DDJJTRABAJADOR, ' +
                 '     EMI.IDJ_DDJJ, CTJ_TRABAJADOR, AEM_EMPRESA, ACO_CONTRATO ' +
                'WHERE DT_CUIL=TJ_CUIL(+) ' +
                  'AND CO_CONTRATO=DJ_CONTRATO ' +
                  'AND DJ_ID=DT_IDDDJJ ' +
                  'AND DJ_ESTADO + 0 = EV_ID ' +
                  'AND CTBZONA.TB_CLAVE(+)=''NZONA'' ' +
                  'AND CTBZONA.TB_CODIGO(+)=DT_ZONA ' +
                  'AND CTBACTIV.TB_CLAVE(+)=''ACTIV'' ' +
                  'AND CTBACTIV.TB_CODIGO(+)=DT_ACTIVIDADES ' +
                  'AND DT_CODIGOOBRASOCIAL=OS_CODIGO(+) ' +
                  'AND CTBMODCONTR.TB_CLAVE(+)=''MCONT'' ' +
                  'AND CTBMODCONTR.TB_CODIGO(+)=DT_MODOCONTRATACION ' +
                  'AND CTBCODSIN.TB_CLAVE(+)=''CSIN'' ' +
                  'AND CTBCODSIN.TB_CODIGO(+)=DT_CODSINIESTRO ' +
                  'AND CO_IDEMPRESA=EM_ID ' +
                  'AND NVL(DT_IDOPERACIONTOPEOMAX, 99) = OPERMAX.OT_ID ' +
                  'AND NVL(DT_IDOPERACIONTOPEOMIN, 99) = OPERMIN.OT_ID ' +
                  'AND DJ_CONTRATO=' + SqlValue( Contrato ) +  ' ' +
                  'AND DJ_PERIODO>=' + SqlValue( Periodo ) + ' ' +
                  'AND DJ_PERIODO<=' + SqlValue( PeriodoHasta ) + ' ' +
                  iif(FBuscaPorDesdeHasta, '',  'AND DJ_CODIGORECTIFICATIVA=' + SqlValue( CodigoRectif )) +  ' ';

      if Cuil <> '' then
        sSql := sSql + ' AND DT_CUIL=' + SqlValue( Cuil );
    end;

  if cmbtipo.Checked[1] then
    begin
      if sSql <> '' then
        sSql := sSql + ' UNION ALL ';

      sSql := sSql + 'SELECT ''ART'' TIPO, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, RL_FECHAINGRESO FECHAINGRESO, RL_FECHARECEPCION FECHARECEPCION, TJ_CUIL CUIL, TJ_NOMBRE, NULL PERIODO, TO_DATE(NULL) FECHAEGRESO, ' +
                             'NULL CODRECEPCION, TO_DATE(NULL) FECHA_PRESENTACION, NULL ZONA, NULL CONDICION, NULL ACTIVIDAD, NULL OBRASOCIAL, NULL MODCONTR, TO_NUMBER(NULL) CODRECTIF, NULL CODSITU, NULL SECDJ, ' +
                             'NULL SECNOM, NULL NUMOBLE, TO_NUMBER(NULL) SECOBLIG, NULL BANCO, TO_NUMBER(NULL) PORCREDU, TO_NUMBER(NULL) REMTOT, TO_NUMBER(NULL) ADICTRI, TO_NUMBER(NULL) APOBLISS, ' +
                             'TO_NUMBER(NULL) APVOLSS, NULL CODSINI, NULL DESCODSIN, NULL SITUACION1, NULL DESDE1, NULL SITUACION2, NULL DESDE2, NULL SITUACION3, NULL DESDE3, TO_NUMBER(NULL) SUELDO, ' +
                             'TO_NUMBER(NULL) SAC, TO_NUMBER(NULL) EXTRAS, TO_NUMBER(NULL) ZONADES, TO_NUMBER(NULL) VACACIONES, TO_NUMBER(NULL) LABORABLES, TO_NUMBER(NULL) REMIMSS, NULL DESZONA, NULL DESACTIV, ' +
                             'NULL DESOSOCIAL, NULL DESMODCONTR, NULL DESCODSITUACDDJJ, NULL DESCODSITUACMS, NULL DT_CODIGOSITUACIONMS, ' +
                             'DECODE(EMI.UTILES.GET_DEVENGABLE(RL_CONTRATO, TO_CHAR(NVL(RL_FECHAINGRESO, NVL(RL_FECHARECEPCION, RL_FECHAALTA)), ''YYYYMM''), TJ_CUIL), ''S'', ''Si'', ''No'') EMITE, ''S'' ACTIVO, ' +
                             'TO_NUMBER(NULL) TOPEOAPLICADO, EMI.UTILES.GET_SINIESTROCONILT(EM_CUIT, TJ_CUIL) SINCONILT, ' +
                             'TO_NUMBER(NULL) RemAnt, TO_NUMBER(NULL) Observaciones, TO_NUMBER(NULL) dt_id, TO_NUMBER(NULL) dt_adicionales, TO_NUMBER(NULL) dt_premios, TO_NUMBER(NULL) dt_noremunerativos, ' +
                             'TO_NUMBER(NULL) dt_presentismo, TO_NUMBER(NULL) dt_bonus, TO_NUMBER(NULL) dt_antiguedad, TO_NUMBER(NULL) dt_viaticos, TO_NUMBER(NULL) dt_refrigerio, TO_NUMBER(NULL) dt_otrosconceptos, NULL ev_estado, ' +
                             'TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMAX, TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMIN, NULL DT_CALCULOTOPEOMAX, NULL DT_CALCULOTOPEOMIN, NULL DESCOPERMAX, NULL DESCOPERMIN, TO_NUMBER(NULL) DT_REMUNERACIONCONFORMADA ' +
                        'FROM CRL_RELACIONLABORAL, CTJ_TRABAJADOR, AEM_EMPRESA, ACO_CONTRATO ' +
                       'WHERE RL_IDTRABAJADOR=TJ_ID ' +
                         'AND RL_CONTRATO=CO_CONTRATO ' +
                         'AND CO_IDEMPRESA=EM_ID ' +
                         'AND CO_CONTRATO=' + SqlValue( Contrato ) +  ' ' +
                         'AND '''' || TJ_ORIGEN<>''S'' ';

      if fraTrabajador.Cuil  <> '' then
        sSql := sSql + ' AND TJ_CUIL=' + SqlValue( Cuil );
      sSql := sSql + ' UNION ALL ' +  { by NWK, 04/04/03 }
                'SELECT /*+INDEX(comunes.ctj_trabajador comunes.uk_ctj_cuil)*/ ''ART'' TIPO, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, TO_DATE(NULL) FECHAINGRESO, TO_DATE(NULL) FECHARECEPCION, TJ_CUIL CUIL, TJ_NOMBRE, NR_PERIOD PERIODO, ' +
                        'TO_DATE(NULL) FECHAEGRESO, NR_RECEP CODRECEPCION, NR_FECRE FECHA_PRESENTACION, ' +
                        'NR_ZONA ZONA, NR_CONDIC CONDICION, NR_ACTIV ACTIVIDAD, NR_OBRASOCIAL OBRASOCIAL, ' +
                        'NR_MODCONT MODCONTR, TO_NUMBER(NR_CODRECT) CODRECTIF, NR_CODSIT CODSITU, NR_SECDJ SECDJ, NR_SECNOM SECNOM, ' +
                        'NR_NUMOBLE NUMOBLE, NR_SECOBLIG SECOBLIG, NR_BANCO BANCO, NR_PORCREDU PORCREDU, NR_REMTOT REMTOT, ' +
                        'NR_ADICTRI ADICTRI, NR_APOBLISS APOBLISS, NR_APVOLSS APVOLSS, NR_CODSINI CODSINI, CTBCODSIN.TB_DESCRIPCION, ' +
                        'NR_SITUACION1 SITUACION1, NR_DESDE1 DESDE1, NR_SITUACION2 SITUACION2, NR_DESDE2 DESDE2, ' +
                        'NR_SITUACION3 SITUACION3, NR_DESDE3 DESDE3, NR_SUELDO SUELDO, NR_SAC SAC, NR_EXTRAS EXTRAS, ' +
                        'NR_ZONADES ZONADES, NR_VACACIONES VACACIONES, NR_LABORABLES LABORABLES, NR_REMIMSS REMIMSS, ' +
                        'CTBZONA.TB_DESCRIPCION DESZONA, CTBACTIV.TB_DESCRIPCION DESACTIV, OS_DESCRIPCION DESOSOCIAL, CTBMODCONTR.TB_DESCRIPCION DESMODCONTR, EMI.UTILES.GET_DESCCODIGOSITUACION(NR_CODSIT, NR_PERIOD, ''D'') DESCODSITUACDDJJ, ' +
                        'EMI.UTILES.GET_DESCCODIGOSITUACION(NR_CODIGOSITUACIONMS, NR_PERIOD, ''S'') DESCODSITUACMS, NULL DT_CODIGOSITUACIONMS, ' +
                        'DECODE(EMI.UTILES.GET_DEVENGABLE(CO_CONTRATO, NR_PERIOD, TJ_CUIL), ''S'', ''Si'', ''No'') EMITE, ''S'' ACTIVO, TO_NUMBER(NULL) TOPEOAPLICADO, EMI.UTILES.GET_SINIESTROCONILT(EM_CUIT, TJ_CUIL) SINCONILT, TO_NUMBER(NULL) RemAnt, ' +
                        'TO_NUMBER(NULL) Observaciones, TO_NUMBER(NULL) dt_id, TO_NUMBER(NULL) dt_adicionales, TO_NUMBER(NULL) dt_premios, TO_NUMBER(NULL) dt_noremunerativos, ' +
                        'TO_NUMBER(NULL) dt_presentismo, TO_NUMBER(NULL) dt_bonus, TO_NUMBER(NULL) dt_antiguedad, TO_NUMBER(NULL) dt_viaticos, TO_NUMBER(NULL) dt_refrigerio, TO_NUMBER(NULL) dt_otrosconceptos, NULL ev_estado, ' +
                        'TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMAX, TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMIN, NULL DT_CALCULOTOPEOMAX, NULL DT_CALCULOTOPEOMIN, NULL DESCOPERMAX, NULL DESCOPERMIN, TO_NUMBER(NULL) DT_REMUNERACIONCONFORMADA ' +
                   'FROM COS_OSOCIAL, CTB_TABLAS CTBCODSIN, CTB_TABLAS CTBMODCONTR, CTB_TABLAS CTBACTIV, CTB_TABLAS CTBZONA, AR1.ZNR_NOMREC, CTJ_TRABAJADOR, AEM_EMPRESA, ACO_CONTRATO ' +
                  'WHERE NR_CUIL=TJ_CUIL ' +
                    'AND EM_CUIT=NR_CUIT ' +
                    'AND CTBZONA.TB_CLAVE(+)=''NZONA'' ' +
                    'AND CTBZONA.TB_CODIGO(+)=NR_ZONA ' +
                    'AND CTBACTIV.TB_CLAVE(+)=''ACTIV'' ' +
                    'AND CTBACTIV.TB_CODIGO(+)=NR_ACTIV ' +
                    'AND NR_OBRASOCIAL=OS_CODIGO(+) ' +
                    'AND CTBMODCONTR.TB_CLAVE(+)=''MCONT'' ' +
                    'AND CTBMODCONTR.TB_CODIGO(+)=NR_MODCONT ' +
                    'AND CTBCODSIN.TB_CLAVE(+)=''CSIN'' ' +
                    'AND CTBCODSIN.TB_CODIGO(+)=NR_CODSINI ' +
                    'AND CO_IDEMPRESA=EM_ID ' +
                    'AND CO_CONTRATO=' + SqlValue( Contrato ) +  ' ' +
                    'AND NR_RECEP<>''1'' ';

      if Cuil  <> '' then
        sSql := sSql + ' AND TJ_CUIL=' + SqlValue( Cuil );
    end;

  if cmbtipo.Checked[2] then
    begin
      if sSql <> '' then
        sSql := sSql + ' UNION ALL ';

      sSql := sSql + 'SELECT ''Siniestros'' TIPO, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, RL_FECHAINGRESO FECHAINGRESO, RL_FECHARECEPCION FECHARECEPCION, TJ_CUIL CUIL, TJ_NOMBRE, NULL PERIODO, TO_DATE(NULL) FECHAEGRESO, ' +
                             'NULL CODRECEPCION, TO_DATE(NULL) FECHA_PRESENTACION, NULL ZONA, NULL CONDICION, NULL ACTIVIDAD, NULL OBRASOCIAL, NULL MODCONTR, TO_NUMBER(NULL) CODRECTIF, NULL CODSITU, NULL SECDJ, NULL SECNOM, NULL NUMOBLE, TO_NUMBER(NULL) SECOBLIG, NULL BANCO, ' +
                             'TO_NUMBER(NULL) PORCREDU, TO_NUMBER(NULL) REMTOT, TO_NUMBER(NULL) ADICTRI, TO_NUMBER(NULL) APOBLISS, TO_NUMBER(NULL) APVOLSS, NULL CODSINI, NULL DESCODSIN, NULL SITUACION1, NULL DESDE1, NULL SITUACION2, NULL DESDE2, NULL SITUACION3, ' +
                             'NULL DESDE3, TO_NUMBER(NULL) SUELDO, TO_NUMBER(NULL) SAC, TO_NUMBER(NULL) EXTRAS, TO_NUMBER(NULL) ZONADES, TO_NUMBER(NULL) VACACIONES, TO_NUMBER(NULL) LABORABLES, TO_NUMBER(NULL) REMIMSS, NULL DESZONA, NULL DESACTIV, ' +
                             'NULL DESOSOCIAL, NULL DESMODCONTR, NULL DESCODSITUACDDJJ, NULL DESCODSITUACMS, NULL DT_CODIGOSITUACIONMS, ' +
                             'DECODE(EMI.UTILES.GET_DEVENGABLE(RL_CONTRATO, TO_CHAR(NVL(RL_FECHAINGRESO, NVL(RL_FECHARECEPCION, RL_FECHAALTA)), ''YYYYMM''), TJ_CUIL), ''S'', ''Si'', ''No'') EMITE, ''S'' ACTIVO, NULL TOPEOAPLICADO, EMI.UTILES.GET_SINIESTROCONILT(EM_CUIT, TJ_CUIL) SINCONILT, ' +
                             'TO_NUMBER(NULL) RemAnt, TO_NUMBER(NULL) Observaciones, NULL dt_id, NULL dt_adicionales, NULL dt_premios, NULL dt_noremunerativos, ' +
                             'TO_NUMBER(NULL) dt_presentismo, TO_NUMBER(NULL) dt_bonus, TO_NUMBER(NULL) dt_antiguedad, TO_NUMBER(NULL) dt_viaticos, TO_NUMBER(NULL) dt_refrigerio, TO_NUMBER(NULL) dt_otrosconceptos, NULL ev_estado, ' +
                             'TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMAX, TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMIN, NULL DT_CALCULOTOPEOMAX, NULL DT_CALCULOTOPEOMIN, NULL DESCOPERMAX, NULL DESCOPERMIN, TO_NUMBER(NULL) DT_REMUNERACIONCONFORMADA ' +
                        'FROM CRL_RELACIONLABORAL, CTJ_TRABAJADOR, AEM_EMPRESA, ACO_CONTRATO ' +
                       'WHERE RL_IDTRABAJADOR=TJ_ID ' +
                         'AND RL_CONTRATO=CO_CONTRATO ' +
                         'AND CO_IDEMPRESA=EM_ID ' +
                         'AND CO_CONTRATO=' + SqlValue( Contrato )  +  ' ' +
                         'AND '''' || TJ_ORIGEN=''S'' ';

      if fraTrabajador.Cuil <> '' then
        sSql := sSql + ' AND TJ_CUIL=' + SqlValue( Cuil );
    end;

  if cmbtipo.Checked[3] then
    begin
      if sSql <> '' then
        sSql := sSql + ' UNION ALL ';

      sSql := sSql + 'SELECT ''Bajas'' TIPO, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, HL_FECHAINGRESO FECHAINGRESO, HL_FECHARECEPCION FECHARECEPCION, TJ_CUIL CUIL, TJ_NOMBRE, NULL PERIODO, HL_FECHAEGRESO FECHAEGRESO, NULL CODRECEPCION, ' +
                              'TO_DATE(NULL) FECHA_PRESENTACION, NULL ZONA, NULL CONDICION, NULL ACTIVIDAD, NULL OBRASOCIAL, NULL MODCONTR, TO_NUMBER(NULL) CODRECTIF, NULL CODSITU, NULL SECDJ, NULL SECNOM, NULL NUMOBLE, TO_NUMBER(NULL) SECOBLIG, NULL BANCO, ' +
                              'TO_NUMBER(NULL) PORCREDU, TO_NUMBER(NULL) REMTOT, TO_NUMBER(NULL) ADICTRI, TO_NUMBER(NULL) APOBLISS, TO_NUMBER(NULL) APVOLSS, NULL CODSINI, NULL DESCODSIN, NULL SITUACION1, NULL DESDE1, NULL SITUACION2, ' +
                              'NULL DESDE2, NULL SITUACION3, NULL DESDE3, TO_NUMBER(NULL) SUELDO, TO_NUMBER(NULL) SAC, TO_NUMBER(NULL) EXTRAS, TO_NUMBER(NULL) ZONADES, TO_NUMBER(NULL) VACACIONES, TO_NUMBER(NULL) LABORABLES, TO_NUMBER(NULL) REMIMSS, ' +
                              'NULL DESZONA, NULL DESACTIV, ' +
                              'NULL DESOSOCIAL, NULL DESMODCONTR, NULL DESCODSITUACDDJJ, NULL DESCODSITUACMS, NULL DT_CODIGOSITUACIONMS, ' +
                              'DECODE(EMI.UTILES.GET_DEVENGABLE(HL_CONTRATO, TO_CHAR(NVL(HL_FECHAINGRESO, NVL(HL_FECHARECEPCION, HL_FECHAALTA)), ''YYYYMM''), TJ_CUIL), ''S'', ''Si'', ''No'') EMITE, ''N'' ACTIVO, NULL TOPEOAPLICADO, EMI.UTILES.GET_SINIESTROCONILT(EM_CUIT, TJ_CUIL) SINCONILT, ' +
                              'TO_NUMBER(NULL) RemAnt, TO_NUMBER(NULL) Observaciones, NULL dt_id, NULL dt_adicionales, NULL dt_premios, NULL dt_noremunerativos, ' +
                              'TO_NUMBER(NULL) dt_presentismo, TO_NUMBER(NULL) dt_bonus, TO_NUMBER(NULL) dt_antiguedad, TO_NUMBER(NULL) dt_viaticos, TO_NUMBER(NULL) dt_refrigerio, TO_NUMBER(NULL) dt_otrosconceptos, NULL ev_estado, ' +
                              'TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMAX, TO_NUMBER(NULL) DT_IDOPERACIONTOPEOMIN, NULL DT_CALCULOTOPEOMAX, NULL DT_CALCULOTOPEOMIN, NULL DESCOPERMAX, NULL DESCOPERMIN, TO_NUMBER(NULL) DT_REMUNERACIONCONFORMADA ' +
                        'FROM CHL_HISTORICOLABORAL, CTJ_TRABAJADOR, AEM_EMPRESA, ACO_CONTRATO ' +
                        'WHERE HL_IDTRABAJADOR=TJ_ID ' +
                          'AND HL_CONTRATO=CO_CONTRATO ' +
                          'AND CO_IDEMPRESA=EM_ID ' +
                          'AND CO_CONTRATO=' + SqlValue( Contrato )  +  ' ' +
                          'AND HL_FECHAEGRESO IS NOT NULL ';

      if fraTrabajador.Cuil <> '' then
        sSql := sSql + ' AND TJ_CUIL=' + SqlValue( Cuil );
    end;

  OpenQuery( sdqTrabajadores, sSql + SortDialog.OrderBy );
end;

procedure TFormDetalleNomina.FormCreate(Sender: TObject);
begin
  cmbTipo.Checked[0] := True;
  pbNominaActual     := False;
  pIdDDJJ            := ART_EMPTY_ID;
  FBuscaPorDesdeHasta := False;
end;

procedure TFormDetalleNomina.tbNominaPosteriorPeriodoClick(Sender: TObject);
var
  sSql: String;
  IdDDJJ: TTableId;
  CodigoRectif: Integer;
begin
  if Is_CambioDDJJ() then
    begin
      CodigoRectif := FCodigoRectif;

      if Sender = tbNominaPosteriorPeriodo then
        sSql := 'SELECT NVL(MIN(DJ_CODIGORECTIFICATIVA), :CodigoRectif) ' +
                  'FROM EMI.IDJ_DDJJ ' +
                 'WHERE DJ_CONTRATO=:Contrato ' +
                    'AND DJ_PERIODO=:Periodo ' +
                    'AND DJ_CODIGORECTIFICATIVA>:CodigoRectif'
      else
        sSql := 'SELECT NVL(MAX(DJ_CODIGORECTIFICATIVA), :CodigoRectif) ' +
                  'FROM EMI.IDJ_DDJJ ' +
                 'WHERE DJ_CONTRATO=:Contrato ' +
                    'AND DJ_PERIODO=:Periodo ' +
                    'AND DJ_CODIGORECTIFICATIVA<:CodigoRectif';

      FCodigoRectif := ValorSqlIntegerEx(sSql, [FCodigoRectif, FContrato, FPeriodo, FCodigoRectif]);

      if pbNominaActual and (FCodigoRectif = CodigoRectif) then
        IdDDJJ := pIdDDJJ
      else
        begin
          pbNominaActual := False;
          IdDDJJ := Get_IdDDJJ(FContrato, FCodigoRectif, FPeriodo);
        end;

      MostrarDetalle(IdDDJJ);
    end;
end;

function TFormDetalleNomina.Get_CodigoRectificativa(IdDDJJ: TTableId): Integer;
var
  CodigoRectif: Integer;
  sSql: String;
begin
  if IdDDJJ = ART_EMPTY_ID then
    CodigoRectif := -1
  else
    begin
      sSql := 'SELECT DJ_CODIGORECTIFICATIVA ' +
                'FROM EMI.IDJ_DDJJ ' +
               'WHERE DJ_ID=:djid';

      CodigoRectif := ValorSqlIntegerEx(sSql, [IdDDJJ]);
    end;

  Result := CodigoRectif;
end;

function TFormDetalleNomina.Get_IdDDJJ(Contrato, CodigoRectif: Integer; Periodo: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT DJ_ID ' +
            'FROM EMI.IDJ_DDJJ ' +
           'WHERE DJ_CONTRATO=:Contrato ' +
              'AND DJ_PERIODO=:Periodo ' +
              'AND DJ_CODIGORECTIFICATIVA=:CodigoRectif';

  Result := ValorSqlIntegerEx(sSql, [Contrato, Periodo, CodigoRectif]);
end;

function TFormDetalleNomina.Is_CambioDDJJ: Boolean;
begin
  Result := cmbtipo.Checked[0];
end;

procedure TFormDetalleNomina.Limpiar;
begin
  CerrarConsultas();

  edtPeriodo.text               := '';
  edtCantidadTrabajadores.text  := '';
  edtMasa.Text                  := '';
  edtEnCero.Text                := '';
  edtOrigen.Text                := '';
  edtFechaPresentacion.Text     := '';
  edtModoCarga.Text             := '';
  edTipoNomina.Text             := '';

  lblActiva.Caption      := '';
  lblRecticativa.Caption := '';

  edtFormulario.Text     := '';
  edtInfoAdicional.Text  := '';

  edtBibliorato.Text := '';
  edtSecuencia.Text  := '';
  pnNota.Visible := false;

  edtCodRectifOriginal.Text := '';

  edtTrabajadoresCalculo.text := '';
  edtTotalMasaCalculo.text    := '';

  edtTrabajadoresDeclarado.text := '';
  edtTrabajadoresNoActivos.text := '';
  edtMasaDeclarada.text         := '';
  edtSUSS.Text                  := '';
end;

procedure TFormDetalleNomina.CerrarConsultas;
begin
  sdqTrabPorAct.Close;
  sdqTrabPorSit.Close;
  sdqRecepciones.Close;

  if ppPeriodo.Text = ppPeriodoHasta.Text then
    sdqTrabajadores.Close;

  sdqDevengados.Close;
  sdqObservacionesGeneradas.Close;
//  sdqGestionesRealizadas.Close;
end;

procedure TFormDetalleNomina.ppPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    tbRefrescarClick(nil);
end;

function TFormDetalleNomina.Get_Periodo(IdDDJJ: TTableId): String;
var
  sPeriodo, sSql: String;
begin
  if IdDDJJ = ART_EMPTY_ID then
    sPeriodo := ''
  else
    begin
      sSql := 'SELECT DJ_PERIODO ' +
                'FROM EMI.IDJ_DDJJ ' +
               'WHERE DJ_ID=:djid';

      sPeriodo := ValorSqlEx(sSql, [IdDDJJ]);
    end;

  Result := sPeriodo;
end;

procedure TFormDetalleNomina.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  if sbDetalleTrabajadores.Expanded then
    FieldHider.Execute;
end;

procedure TFormDetalleNomina.tbOrdenarClick(Sender: TObject);
begin
  if sbDetalleTrabajadores.Expanded then
    begin
      LoadDynamicSortFields( SortDialog.SortFields, dbgDetalleTrabajadores.Columns );
      SortDialog.Execute;
    end;
end;

procedure TFormDetalleNomina.tbAutoAntClick(Sender: TObject);
begin
  if not QAuto.Eof then
  begin
    QAuto.Next;
    VisualizarAutoriz;
  end;
end;

procedure TFormDetalleNomina.tbAutoSigClick(Sender: TObject);
begin
  if not QAuto.Bof then
  begin
    QAuto.Prior;
    VisualizarAutoriz;
  end;
end;

procedure TFormDetalleNomina.VisualizarAutoriz;
begin
  edtRequiereAutorizacion.Text := iif(QAuto.FieldByName('autreq').asstring <> '', QAuto.FieldByName('autreq').asstring + ' - ', '') + iif(not QAuto.FieldByName('usucumpli').IsNull, QAuto.FieldByName('usucumpli').asstring, '');
  edtTipoAutorizacion.Text     := QAuto.FieldByName('tipoauto').asstring;
  edCumplimiento.Text          := QAuto.FieldByName('estado').asstring  +  iif(not QAuto.FieldByName('fechacumpli').IsNull, ' - ' + QAuto.FieldByName('fechacumpli').asstring, '');
  edMotivo.Text                := QAuto.FieldByName('motivo').asstring;
  edObservacionAuto.Text       := QAuto.FieldByName('obs').asstring;
end;

procedure TFormDetalleNomina.CargarTrabPorSituacion(Contrato,
  CodigoRectif: Integer; Periodo: String);
var
  Sql: String;
begin
  Sql := ' SELECT nvl(dt_codigosituacionms, dt_codigosituacion) codsit, ' +
         ' max(emi.utiles.get_desccodigosituacion(nvl(dt_codigosituacionms, dt_codigosituacion), dj_periodo, nvl2(dt_codigosituacionms, ''S'', ''D''))) descsit, ' +
         ' COUNT(*) canttrab, SUM(dt_remuneracion) remimpo, ' +
         ' SUM(NVL(dt_remuneraciontotal, 0)) total, SUM(NVL(dt_vacaciones, 0)) Vaca, SUM(NVL(dt_sac, 0)) SAC, ' +
         ' SUM(NVL(dt_remuneracionconformada, 0)) remuconf ' +
         ' FROM emi.idj_ddjj, emi.idt_ddjjtrabajador ' +
         ' WHERE dj_id = dt_idddjj ' +
         ' AND dj_contrato = :contrato ' +
         ' AND dj_periodo = :periodo ' +
         ' AND dj_codigorectificativa = :rectifica ' +
         ' GROUP BY nvl(dt_codigosituacionms, dt_codigosituacion) ';

  OpenQueryEx(sdqTrabPorSit, [Contrato, Periodo, CodigoRectif], Sql);
end;

procedure TFormDetalleNomina.CargarTrabPorActividad(Contrato,
  CodigoRectif: Integer; Periodo: String);
var
  Sql: String;
begin
  Sql := ' SELECT dt_actividades codact, ctbactiv.tb_descripcion descact, COUNT(*) canttrab, SUM(dt_remuneracion) remimpo, ' +
         ' SUM(NVL(dt_remuneraciontotal, 0)) total, SUM(NVL(dt_vacaciones, 0)) Vaca, SUM(NVL(dt_sac, 0)) SAC, SUM(NVL(dt_remuneracionconformada, 0)) remuconf ' +
         ' FROM ctb_tablas ctbactiv, emi.idj_ddjj, emi.idt_ddjjtrabajador ' +
         ' WHERE dj_id = dt_idddjj ' +
         ' AND ctbactiv.tb_clave(+)= ''ACTIV'' ' +
         ' AND ctbactiv.tb_codigo(+)= dt_actividades ' +
         ' AND dj_contrato = :contrato ' +
         ' AND dj_periodo = :periodo ' +
         ' AND dj_codigorectificativa = :rectifica ' +
         ' GROUP BY dt_actividades, ctbactiv.tb_descripcion ';

  OpenQueryEx(sdqTrabPorAct, [Contrato, Periodo, CodigoRectif], Sql);
end;

procedure TFormDetalleNomina.sdqTrabPorActAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FieldByName( 'remimpo' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'RemImpo' ) ).Currency := True;

  if DataSet.FieldByName( 'Vaca' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'Vaca' ) ).Currency := True;

  if DataSet.FieldByName( 'SAC' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'SAC' ) ).Currency := True;

  if DataSet.FieldByName( 'Total' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'Total' ) ).Currency := True;

  if DataSet.FieldByName( 'remuconf' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'remuconf' ) ).Currency := True;
end;

procedure TFormDetalleNomina.sdqTrabPorSitAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FieldByName( 'remimpo' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'remimpo' ) ).Currency := True;

  if DataSet.FieldByName( 'Vaca' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'Vaca' ) ).Currency := True;

  if DataSet.FieldByName( 'SAC' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'SAC' ) ).Currency := True;

  if DataSet.FieldByName( 'Total' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'Total' ) ).Currency := True;

  if DataSet.FieldByName( 'remuconf' ) is TFloatField then
     TFloatField( DataSet.FieldByName( 'remuconf' ) ).Currency := True;
end;

procedure TFormDetalleNomina.tbObservacionesClick(Sender: TObject);
begin
  sdqObservacionTrabajador.Close;
  sdqObservacionTrabajador.ParamByName('ID').AsInteger := sdqTrabajadores.fieldbyname('dt_id').AsInteger;
  sdqObservacionTrabajador.Open;
  fpObservacionTrabajador.ShowModal;
end;

procedure TFormDetalleNomina.sdqTrabajadoresAfterScroll(DataSet: TDataSet);
begin
  tbObservaciones.Enabled := sdqTrabajadores.Active and (sdqTrabajadores.FieldByName('Observaciones').AsInteger > 0);
end;

procedure TFormDetalleNomina.dbgDetalleTrabajadoresDblClick(
  Sender: TObject);
begin
  CargarTrabajador;
end;

procedure TFormDetalleNomina.CargarTrabajador;
var
  IdTrabajador: integer;
  IdRelacionLaboral: integer;
begin
  with GetQueryEx(' SELECT tj_id, rl_id ' +
                  '  FROM comunes.crl_relacionlaboral, comunes.ctj_trabajador ' +
                  ' WHERE rl_idtrabajador(+) = tj_id ' +
                  '   AND tj_cuil = :cuil ' +
                  '   AND rl_contrato(+) = :contrato ', [sdqTrabajadores.FieldByName('CUIL').AsString, FContrato]) do
  try
    IdTrabajador := Fieldbyname('tj_id').AsInteger;
    IdRelacionLaboral := Fieldbyname('rl_id').AsInteger;
  finally
    free;
  end;

  with TfrmContratoTrabajador.Create(self) do
  try
    CargarDatosTrabajador(IdTrabajador, IdRelacionLaboral);
    ShowModal;
  finally
    free;
  end;

end;

procedure TFormDetalleNomina.tbManTrabClick(Sender: TObject);
begin
  if not sdqTrabajadores.IsEmpty then CargarTrabajador
end;

procedure TFormDetalleNomina.ppPeriodoHastaKeyPress(Sender: TObject;
  var Key: Char);
begin
  FBuscaPorDesdeHasta := True;
end;

end.

