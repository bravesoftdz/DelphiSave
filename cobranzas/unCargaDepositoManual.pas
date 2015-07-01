unit unCargaDepositoManual;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   25-08-03
 ULTIMA MODIFICACION: 11-28-03
}
interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unArtDbFrame, unFraEmpresa, Mask,
  PatternEdit, IntEdit, unFraStaticCodigoDescripcion, ToolEdit,
  DateComboBox, CurrEdit, StaticGrid, PeriodoPicker,
  unfraCuentaBancaria, unArt, unfraCuentaBancariaRemesa,
  unFraUsuario, unfraAGC_GESTORCUENTA, unArtDBAwareFrame,
  unFraCodigoDescripcion, Menus, RxCurrEdit, RxToolEdit, RxPlacemnt,
  unFraTipoRegimen;

type
  TTipoAsignacion = (taNone, taConvenio, taPeriodoCobertura);

  TfrmCargaDepositoManual = class(TfrmCustomGridABM)
    gmEmpresa: TGroupBox;
    fraDM_CONTRATO: TfraEmpresa;
    Label3: TLabel;
    gbFechaDeposito: TGroupBox;
    Label4: TLabel;
    cmbDM_FECHADEPOSITODesde: TDateComboBox;
    Label5: TLabel;
    cmbDM_FECHADEPOSITOHasta: TDateComboBox;
    gbDM_USUAPROBACION: TGroupBox;
    rbSinAprobar: TRadioButton;
    rbAprobadas: TRadioButton;
    rbAmbos: TRadioButton;
    gbDeposito: TGroupBox;
    edDM_NRODEPOSITO: TIntEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    edfpDM_FECHADEPOSITO: TDateComboBox;
    Label9: TLabel;
    edfpDM_IMPORTE: TCurrencyEdit;
    Label10: TLabel;
    edfpDM_OBSERVACIONES: TMemo;
    Label11: TLabel;
    Label7: TLabel;
    gbPeriodos: TGroupBox;
    GroupBox1: TGroupBox;
    frafpDM_CONTRATO: TfraEmpresa;
    Label12: TLabel;
    edPeriodo: TPeriodoPicker;
    btnAgregar: TButton;
    btnEliminar: TButton;
    lstPeriodos: TListBox;
    gbImporte: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edDM_IMPORTEDesde: TCurrencyEdit;
    edDM_IMPORTEHasta: TCurrencyEdit;
    edfpDM_NRODEPOSITO: TPatternEdit;
    tbSumatoria: TToolButton;
    fraRM_IDCUENTABANCARIA: TfraCuentaBancaria;
    chkExclusionFRemesa: TCheckBox;
    frafpDM_IDREMESA: TfraCuentaBancariaRemesa;
    edImporte: TCurrencyEdit;
    rgTipo: TRadioGroup;
    gbConvenios: TGroupBox;
    dbgCuotas: TArtDBGrid;
    sdqCuotas: TSDQuery;
    dsCuotas: TDataSource;
    gbFechaAlta: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    cmbDM_FECHAALTADesde: TDateComboBox;
    cmbDM_FECHAALTAHasta: TDateComboBox;
    gbUsuarioAlta: TGroupBox;
    fraDM_USUALTA: TfraUsuarios;
    Label16: TLabel;
    edfpDM_FECHARECEPCION: TDateComboBox;
    tbAprobar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    frafpDM_IDGESTORCUENTA: TfraAGC_GESTORCUENTA;
    lbGestor: TLabel;
    rgAsignacionDeposito: TRadioGroup;
    pnlSaldo: TPanel;
    Label17: TLabel;
    edSaldo: TCurrencyEdit;
    fpRedevegarPeriodos: TFormPanel;
    Bevel1: TBevel;
    btnAceptarRedevengar: TButton;
    btnCancelarRedevengar: TButton;
    GridPeriodos: TArtDBGrid;
    dsPeriodos: TDataSource;
    sdqPeriodos: TSDQuery;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbRevertir: TToolButton;
    fraTipoReg: TfraTipoRegimen;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbEliminarClick(Sender: TObject);
    procedure chkExclusionFRemesaClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure edfpDM_FECHADEPOSITOExit(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure sdqCuotasAfterOpen(DataSet: TDataSet);
    procedure frafpDM_CONTRATOOnChange(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure ActualizarSaldoPeriodosCobertura(Sender: TObject);
    procedure btnAceptarRedevengarClick(Sender: TObject);
    procedure frafpDM_IDREMESAChange(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbRevertirClick(Sender: TObject);
  private
    fIDDeposito: string;
    procedure LoadPeriodos;
    procedure AgregarPeriodo(Periodo: String; Importe: Currency; CodTipoImputacion, CodTipoRegimen: String);
    procedure AgregarPer(Periodo: String; Importe: Currency; CodTipoImputacion, CodTipoRegimen: String);
    procedure CalcTotales;
    procedure DoActualizarMontoSinImputarNomina(IdRemesa: TTableId; ImporteAnterior, ImporteNuevo: Currency);
    procedure DoSepararItem_PeriodoImporteTipoImputacion(Item: String; var Periodo: String; var Importe: Currency; var DescrTipoImputacion, CodTipoRegimen: String);
    procedure DoLimpiarPeriodoImporte;
    procedure DoCargarCuotasPlan(NroContrato: Integer);
    function GetTipoAsignacion: TTipoAsignacion;
    function ValidarDatos(TipoAsignacion: TTipoAsignacion): Boolean;
    function DoABMDatos(TipoAsignacion: TTipoAsignacion): Boolean;
    procedure DoLimpiarDatosTipoAsignacion;
    function GetTipoAsignacionDeposito(IdDeposito: TTableId): TTipoAsignacion;
    procedure DoBorrarPeriodosDeposito(IdDeposito: TTableId);
    procedure DoHabilitarControlesDeposito(Habilitar: Boolean);
    function IsDatosValidosAprobar: Boolean;
    function IsDatosValidosBaja: Boolean;
    function DoCrearTablaTemporalRegSeleccionados: Boolean;
    function Get_TotalContratosPeriodosRedevengar: Integer;
    procedure DoRedevengarTodos;
    procedure DoConciliarReg;
    procedure DoProcesarPeriodosCobertura;
    function DoCrearTablaTemporalConvenio: Boolean;
    function DoActualizarTablaTemporalImpSinImputarConvenio: Boolean;
    procedure DoProcesarConvenio;
    function ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo, CodTipoRegimen: String): Boolean;
    function GetCodTipoImputacion: String;
    function GetDescripcionCodTipoImputacion(CodTipoImputacion: String): String;
    function GetCodTipoImputacionDescr(DescrTipoImputacion: String): String;
    function GetTotalPeriodosCobertura: Currency;
    function IsDatosValidosRevertir: Boolean;
    procedure DoRevertirMovimientos(Contrato: Integer; Periodo: String; IdRemesa: TTableId; Usuario: String);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  TotalConsulta : array of extended;
  frmCargaDepositoManual: TfrmCargaDepositoManual;

const
  CAMPOS_SUMA : array [0..0] of string = ('DM_IMPORTE');
  MAXCOLS = 0;

implementation
{$R *.DFM}
Uses
  unPrincipal, undmPrincipal, unFiltros, VCLExtra, strFuncs,
  SqlFuncs, AnsiSql, DBFuncs, CustomDlgs, General, unCobranzas,
  Math, Periodo, Numeros, unAfiliaciones;

Const
  COL_CODIGO : integer = 0;
  SEPARADORLISTA_CAMPOS      : String = ' - ';
  SEPARADORLISTA_TIPOIMPUT1  : String = ' (';
  SEPARADORLISTA_TIPOIMPUT2  : String = ')';
  TIPOIMPUTACION_CUOTA       : String = 'Cuota';
  TIPOIMPUTACION_INTERES     : String ='Interés';

procedure TfrmCargaDepositoManual.CalcTotales;
Var PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active Then
      begin
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
      end;
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmCargaDepositoManual.FormCreate(Sender: TObject);
begin
  inherited;
  frmPrincipal.mnuDeposito.Enabled := False;
  ShowActived := False;
  fraDM_CONTRATO.ShowBajas   := True;
  frafpDM_CONTRATO.ShowBajas := True;
  SetLength( TotalConsulta,  MAXCOLS  + 1);

  frafpDM_IDREMESA.RangoDeposito := 7;
  frafpDM_IDREMESA.OnChange      := frafpDM_IDREMESAChange;
  
  fraDM_USUALTA.Sector           := 'COB';   // Cobranzas
  frafpDM_CONTRATO.OnChange      := frafpDM_CONTRATOOnChange;
end;

procedure TfrmCargaDepositoManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuDeposito.Enabled := True;
  Action := caFree;
  frmCargaDepositoManual := nil;
end;

procedure TfrmCargaDepositoManual.tbRefrescarClick(Sender: TObject);
var
  sSql1, sSql2, sWhere: string;
begin
  sSql1 := 'SELECT DM_ID, EM_NOMBRE, DM_NRODEPOSITO, DM_FECHADEPOSITO, DP_PERIODO, DP_IMPORTE DM_IMPORTE, DM_CONTRATO, ' +
                  'DM_IDPLANVALOR, DM_USUAPROBACION, DM_OBSERVACIONES, DM_USUALTA, DM_FECHAALTA, DECODE(DP_TIPOIMPUTACION, ''C'', ''Cuota'', ''Interés'') TIPOIMPUTACION, ' +
                  'DM_FECHARECEPCION, DM_IDGESTORCUENTA, BA_CODIGO, BA_NOMBRE, CB_NUMERO, PV_IDPLANCUOTA, AFILIACION.GET_CODREGIMEN(DP_IDTIPOREGIMEN) CODREG, ' +
                  'RM_ID, RM_FECHA, PP_ID, DM_IMPORTE IMPORTE, TRUNC(DM_FECHAAPROBACION) FECHAAPROBACION, ' +
                  'AFILIACION.GET_CONTRATOVIGENTEREGIMEN(DM_CONTRATO, NULL, DP_IDTIPOREGIMEN) CONTRATOEXT ' +
             'FROM ZDP_DEPOSITOMANUALPERIODO, ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, ZCB_CUENTABANCARIA, ' +
                  'ZBA_BANCO, ACO_CONTRATO, AEM_EMPRESA, RRM_REMESA, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
            'WHERE CB_ID = RM_IDCUENTABANCARIA ' +
              'AND CB_IDBANCO = BA_ID ' +
              'AND CO_CONTRATO = DM_CONTRATO ' +
              'AND CO_IDEMPRESA = EM_ID ' +
              'AND DM_IDREMESA = RM_ID ' +
              'AND DM_IDPLANVALOR = PV_ID(+) ' +
              'AND PV_IDPLANCUOTA = PC_ID(+) ' +
              'AND PC_IDPLANPAGO = PP_ID(+) ' +
              'AND DP_IDDEPOSITOMANUAL = DM_ID ';

  sSql2 := 'SELECT DM_ID, EM_NOMBRE, DM_NRODEPOSITO, DM_FECHADEPOSITO, NULL, DM_IMPORTE, DM_CONTRATO, ' +
                  'DM_IDPLANVALOR, DM_USUAPROBACION, DM_OBSERVACIONES, DM_USUALTA, DM_FECHAALTA, NULL DP_TIPOIMPUTACION, ' +
                  'DM_FECHARECEPCION, DM_IDGESTORCUENTA, BA_CODIGO, BA_NOMBRE, CB_NUMERO, PV_IDPLANCUOTA, NULL CODREG,' +
                  'RM_ID, RM_FECHA, PP_ID, DM_IMPORTE IMPORTE, TRUNC(DM_FECHAAPROBACION) FECHAAPROBACION, ' +
                  'DM_CONTRATO CONTRATOEXT ' +
             'FROM ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, ZCB_CUENTABANCARIA, ' +
                  'ZBA_BANCO, ACO_CONTRATO, AEM_EMPRESA, RRM_REMESA, ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
            'WHERE CB_ID = RM_IDCUENTABANCARIA ' +
              'AND CB_IDBANCO = BA_ID ' +
              'AND CO_CONTRATO = DM_CONTRATO ' +
              'AND CO_IDEMPRESA = EM_ID ' +
              'AND DM_IDREMESA = RM_ID ' +
              'AND DM_IDPLANVALOR = PV_ID ' +
              'AND PV_IDPLANCUOTA = PC_ID ' +
              'AND PC_IDPLANPAGO = PP_ID ';

  sWhere := '';

  if fraDM_CONTRATO.IsSelected then
    sWhere := sWhere + ' AND DM_CONTRATO = ' + IntToStr(fraDM_CONTRATO.edContrato.Value);

  if edDM_NRODEPOSITO.Value <> 0 then
    sWhere := sWhere + ' AND DM_NRODEPOSITO = ' + IntToStr(edDM_NRODEPOSITO.Value);

 if fraRM_IDCUENTABANCARIA.IsSelected then
    sWhere := sWhere + ' AND RM_IDCUENTABANCARIA = ' + fraRM_IDCUENTABANCARIA.AsString;

  if rbSinAprobar.Checked then
    sWhere := sWhere + ' AND DM_USUAPROBACION IS NULL ';

  if rbAprobadas.Checked then
    sWhere := sWhere + ' AND DM_USUAPROBACION IS NOT NULL ';

  sWhere := sWhere + DoFiltro(gbFechaDeposito);
  sWhere := sWhere + DoFiltro(gbImporte);
  sWhere := sWhere + DoFiltro(gbFechaAlta);

  if fraDM_USUALTA.IsSelected then
    sWhere := sWhere + ' AND DM_USUALTA = ' + SqlValue( fraDM_USUALTA.Value );

  sdqConsulta.SQL.Text := sSql1 + sWhere + 'UNION ' + sSql2 + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;

  if sdqConsulta.IsEmpty then
  begin
    MessageDlg('No existen datos para esta selección', mtWarning, [mbOK], 0);
    VCLExtra.EnableControls([tbPropiedades, tbImprimir, tbExportar], false);
  end
  else
    VCLExtra.EnableControls([tbPropiedades, tbImprimir, tbExportar]);
end;

procedure TfrmCargaDepositoManual.ClearControls;
begin
  DoHabilitarControlesDeposito( True );
  frafpDM_IDREMESA.ShowBajas := False;

  fIDDeposito := '';
  frafpDM_CONTRATO.Clear;
  edfpDM_NRODEPOSITO.Clear;
  edfpDM_FECHADEPOSITO.Clear;
  frafpDM_IDREMESA.Clear;
  edfpDM_IMPORTE.Clear;
  edfpDM_FECHARECEPCION.Clear;
  frafpDM_IDGESTORCUENTA.Clear;
  edfpDM_OBSERVACIONES.Clear;
  chkExclusionFRemesa.Checked := False;
  DoLimpiarPeriodoImporte;

  rgTipo.ItemIndex := 1;  // Periodo Cobertura
  rgTipoClick( Nil );
end;

procedure TfrmCargaDepositoManual.LoadControls;
begin
  if sdqConsulta.FieldByName( 'DM_USUAPROBACION' ).IsNull then
    begin
      DoLimpiarPeriodoImporte;
      DoHabilitarControlesDeposito( False );

      chkExclusionFRemesa.Checked     := True;
      frafpDM_IDREMESA.ShowBajas      := True;

      fIDDeposito                     := sdqConsulta.FieldByName('DM_ID').AsString;
      frafpDM_CONTRATO.Contrato       := sdqConsulta.FieldByName('DM_CONTRATO').AsInteger;
      edfpDM_NRODEPOSITO.Text         := sdqConsulta.FieldByName('DM_NRODEPOSITO').AsString;
      frafpDM_IDREMESA.Value          := sdqConsulta.FieldByName('RM_ID').AsInteger;
      edfpDM_FECHADEPOSITO.Date       := sdqConsulta.FieldByName('DM_FECHADEPOSITO').AsDateTime;
      edfpDM_IMPORTE.Value            := sdqConsulta.FieldByName('IMPORTE').AsFloat;
      frafpDM_IDGESTORCUENTA.Value    := sdqConsulta.FieldByName('DM_IDGESTORCUENTA').AsInteger;
      edfpDM_FECHARECEPCION.Date      := sdqConsulta.FieldByName('DM_FECHARECEPCION').AsDateTime;
      edfpDM_OBSERVACIONES.Lines.Text := sdqConsulta.FieldByName('DM_OBSERVACIONES').AsString;

      case GetTipoAsignacionDeposito( StrToInt( fIDDeposito ) ) of
        taConvenio:
          begin
            rgTipo.ItemIndex := 0;
            rgTipoClick( Nil );

            sdqCuotas.Locate( 'PC_ID', sdqConsulta.FieldByName( 'PV_IDPLANCUOTA').AsInteger, [loCaseInsensitive] );
          end;

        taPeriodoCobertura:
          begin
            rgTipo.ItemIndex := 1;

            //Carga los periodos
            LoadPeriodos;
          end;
      end;

    end
  else
    InvalidMsg( nil, 'El depósito ya ha sido aprobado' );
end;

function TfrmCargaDepositoManual.ValidarDatos(TipoAsignacion: TTipoAsignacion): Boolean;
var
  rTotImporte, rImporteAnterior: Currency;
begin
  Result := False;

  if ModoABM = maAlta then
    rImporteAnterior := 0
  else
    rImporteAnterior := sdqConsulta.FieldByName('IMPORTE').AsCurrency;

  if (TipoAsignacion = taConvenio) and (not sdqCuotas.Active or sdqCuotas.IsEmpty) then
    InvalidMsg( dbgCuotas, 'No existen cuotas en la grilla.' )

  else if (TipoAsignacion = taPeriodoCobertura) and (lstPeriodos.Items.Count = 0) then
    InvalidMsg( edPeriodo, 'Debe ingresar el o los períodos que corresponden al depósito.' )

  else if frafpDM_CONTRATO.IsEmpty then
    InvalidMsg( frafpDM_CONTRATO.edContrato, 'El número de contrato es obligatorio.' )

  else if (Trim(edfpDM_NRODEPOSITO.Text) = '')  then
    InvalidMsg( edfpDM_NRODEPOSITO, 'El número de boleta es obligatorio.' )

  else if edfpDM_FECHADEPOSITO.IsEmpty then
    InvalidMsg( edfpDM_FECHADEPOSITO, 'La fecha de depósito es obligatoria.' )

  else if frafpDM_IDREMESA.IsEmpty then
    InvalidMsg( frafpDM_IDREMESA.edCodigo, 'La remesa es obligatoria.' )

  else if edfpDM_IMPORTE.Value <= 0 then
    InvalidMsg( edfpDM_IMPORTE, 'El importe debe ser mayor a 0.' )

  else if CompareFloat2(edfpDM_IMPORTE.Value, rImporteAnterior + frafpDM_IDREMESA.MontoSinImputar) > 0 then
    InvalidMsg( edfpDM_IMPORTE, 'El importe debe ser menor o igual al monto sin imputar de la remesa: ' + FloatToStr( rImporteAnterior + frafpDM_IDREMESA.MontoSinImputar ) )

  else if (TipoAsignacion = taConvenio) and (CompareFloat2(edfpDM_IMPORTE.Value, rImporteAnterior + sdqCuotas.FieldByName( 'SALDO' ).AsCurrency) > 0) then
    InvalidMsg( edfpDM_IMPORTE, 'El importe debe ser menor o igual al saldo de la cuota: ' + FloatToStr( rImporteAnterior + sdqCuotas.FieldByName( 'SALDO' ).AsCurrency ) )

  else if edfpDM_FECHARECEPCION.IsEmpty then
    InvalidMsg( edfpDM_FECHARECEPCION, 'La fecha de recepción es obligatoria.' )

  else if edfpDM_FECHARECEPCION.Date < edfpDM_FECHADEPOSITO.Date then
    InvalidMsg( edfpDM_FECHARECEPCION, 'La fecha de recepción debe ser mayor o igual a la fecha de depósito.' )

  else if edfpDM_FECHARECEPCION.Date > DBDate then
    InvalidMsg( edfpDM_FECHARECEPCION, 'La fecha de recepción debe ser menor o igual a la fecha actual.' )

  else
    begin
      if TipoAsignacion = taPeriodoCobertura then
        begin
          rTotImporte := GetTotalPeriodosCobertura();

          if Abs(edfpDM_IMPORTE.Value-rTotImporte) > ErrorPrecisionReales then
            InvalidMsg( edPeriodo, 'La suma de los importes de los periodos ($ ' + FloatToStr(rTotImporte) + ') es distinto al importe total')
          else
            Result := True;
        end
      else
        Result := True;
    end;
end;

function TfrmCargaDepositoManual.DoABMDatos(TipoAsignacion: TTipoAsignacion): Boolean;
var
  SqlPeriodo, SqlPlanValor: TSql;
  iloop: integer;
  sCodTipoRegimen, Periodo, sDescrTipoImputacion: string;
  rImporte, rImporteAnteriorRemesa: Currency;
  IdPlanValor: TTableId;
begin
  Result := True;

  Sql.Clear;
  Sql.TableName := 'ZDM_DEPOSITOMANUAL';

  BeginTrans;
  try
    SqlPlanValor := TSql.Create( 'ZPV_PLANVALOR' );
    try
      if ModoABM = maAlta then
      begin
        fIDDeposito            := IntToStr( GetSecNextVal( ' SEQ_ZDM_ID' ) );
        rImporteAnteriorRemesa := 0;
        IdPlanValor            := GetSecNextVal( ' SEQ_ZPV_ID' );

        // TABLA ZDM_DEPOSITOMANUAL
        Sql.Fields.Add( 'DM_FECHAALTA', SQL_ACTUALDATE, False );
        Sql.Fields.Add( 'DM_USUALTA', frmPrincipal.DBLogin.UserID );

        if TipoAsignacion = taConvenio then
          begin
            // TABLA ZPV_PLANVALOR
            SqlPlanValor.Fields.Add( 'PV_FECHAALTA', SQL_ACTUALDATE, False );
            SqlPlanValor.Fields.Add( 'PV_USUALTA', frmPrincipal.DBLogin.UserID );

            SqlPlanValor.SqlType := stInsert;
          end;
      end
      else
      begin
        rImporteAnteriorRemesa := sdqConsulta.FieldByName( 'IMPORTE' ).AsCurrency;
        IdPlanValor            := sdqConsulta.FieldByName( 'DM_IDPLANVALOR' ).AsInteger;

        // TABLA ZDM_DEPOSITOMANUAL
        Sql.Fields.Add( 'DM_FECHAMODIF', SQL_ACTUALDATE, False );
        Sql.Fields.Add( 'DM_USUMODIF', frmPrincipal.DBLogin.UserID );

        if TipoAsignacion = taConvenio then
          begin
            // TABLA ZPV_PLANVALOR
            SqlPlanValor.Fields.Add( 'PV_FECHAMODIF', SQL_ACTUALDATE, False );
            SqlPlanValor.Fields.Add( 'PV_USUMODIF', frmPrincipal.DBLogin.UserID );

            SqlPlanValor.SqlType := stUpdate;
          end;
      end;


      if TipoAsignacion = taConvenio then
        begin
          // TABLA ZPV_PLANVALOR
          SqlPlanValor.PrimaryKey.Add ( 'PV_ID', IdPlanValor, False );
          SqlPlanValor.Fields.Add( 'PV_IDPLANCUOTA', sdqCuotas.FieldByName( 'PC_ID' ).AsInteger , False );
          SqlPlanValor.Fields.Add( 'PV_IMPORTE', edfpDM_IMPORTE.Value, dtNumber );
          SqlPlanValor.Fields.Add( 'PV_IDREMESA', frafpDM_IDREMESA.Value , False );
          SqlPlanValor.Fields.Add( 'PV_ORIGEN', '3' );

          EjecutarSqlST( SqlPlanValor.Sql );
        end;


      // TABLA ZDM_DEPOSITOMANUAL (cont.)
      Sql.PrimaryKey.Add ( 'DM_ID', fIDDeposito, False );
      Sql.Fields.Add( 'DM_CONTRATO', frafpDM_CONTRATO.Contrato );
      Sql.Fields.Add( 'DM_NRODEPOSITO', edfpDM_NRODEPOSITO.Text );
      Sql.Fields.Add( 'DM_IDREMESA', frafpDM_IDREMESA.Value, False );

      if TipoAsignacion = taConvenio then
        begin
          Sql.Fields.Add( 'DM_IDPLANVALOR', IdPlanValor, False );
          Sql.Fields.Add( 'DM_IDGESTORCUENTA', frafpDM_IDGESTORCUENTA.Value, True );
        end;

      Sql.Fields.Add( 'DM_FECHADEPOSITO', edfpDM_FECHADEPOSITO.Date );
      Sql.Fields.Add( 'DM_IMPORTE', edfpDM_IMPORTE.Value, dtNumber );
      Sql.Fields.Add( 'DM_FECHARECEPCION', edfpDM_FECHARECEPCION.Date );
      Sql.Fields.Add( 'DM_OBSERVACIONES', edfpDM_OBSERVACIONES.Lines.Text );
      EjecutarSqlST ( Sql.Sql );


      //TABLA ZDP_DEPOSITOMANUALPERIODO
      DoBorrarPeriodosDeposito( StrToInt( fIDDeposito ) );


      if TipoAsignacion = taPeriodoCobertura then
        begin
          SqlPeriodo := TSql.Create( 'ZDP_DEPOSITOMANUALPERIODO' );

          try
            for iloop := 0 to lstPeriodos.Items.Count-1 do
            begin
              DoSepararItem_PeriodoImporteTipoImputacion( lstPeriodos.Items.Strings[iloop], Periodo, rImporte, sDescrTipoImputacion, sCodTipoRegimen );

              // TABLA ZDP_DEPOSITOMANUALPERIODO
              SqlPeriodo.SqlType := stInsert;
              SqlPeriodo.Clear;
              SqlPeriodo.TableName := 'ZDP_DEPOSITOMANUALPERIODO';
              SqlPeriodo.PrimaryKey.Add ( 'DP_ID', 'SEQ_ZDP_ID.NEXTVAL', False );
              SqlPeriodo.Fields.Add( 'DP_IDDEPOSITOMANUAL', fIDDeposito, False );
              SqlPeriodo.Fields.Add( 'DP_PERIODO', Periodo );
              SqlPeriodo.Fields.Add( 'DP_IMPORTE', rImporte, dtNumber );
              SqlPeriodo.Fields.Add( 'DP_TIPOIMPUTACION', String( GetCodTipoImputacionDescr( sDescrTipoImputacion ) ) );
              SqlPeriodo.Fields.Add( 'DP_IDTIPOREGIMEN', Get_IdTipoRegimen(sCodTipoRegimen));
              SqlPeriodo.Fields.Add( 'DP_FECHAALTA', SQL_ACTUALDATE, False);
              SqlPeriodo.Fields.Add( 'DP_USUALTA', frmPrincipal.DBLogin.UserID);
              EjecutarSqlST( SqlPeriodo.Sql );
            end;
          finally
            SqlPeriodo.Free;
          end;
        end;

      DoActualizarMontoSinImputarNomina( frafpDM_IDREMESA.Value, rImporteAnteriorRemesa, edfpDM_IMPORTE.Value );

      CommitTrans;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    finally
      SqlPlanValor.Free;
    end;
  except
    on E:Exception do
    begin
      Rollback;
      
      Raise Exception.Create( E.Message );
    end;
  end;
end;

procedure TfrmCargaDepositoManual.btnAgregarClick(Sender: TObject);
begin
  AgregarPeriodo( edPeriodo.Periodo.Valor, edImporte.Value, GetCodTipoImputacion(), fraTipoReg.Codigo);
  ActualizarSaldoPeriodosCobertura( nil );
end;

procedure TfrmCargaDepositoManual.AgregarPeriodo(Periodo: String; Importe: Currency; CodTipoImputacion, CodTipoRegimen: String);
var
  iloop: integer;
  sDescrTipoImputacion: string;
begin
  if frafpDM_CONTRATO.IsEmpty then
    InvalidMsg( frafpDM_CONTRATO.edContrato, 'Debe ingresar el contrato' )

  else if rgAsignacionDeposito.ItemIndex = -1  then
    InvalidMsg( rgAsignacionDeposito, 'Debe indicar a dónde se imputará el período' )

  else if Periodo = '' then
    InvalidMsg( edPeriodo, 'El período no es válido' )

  else if PeriodoSacarBarra(Periodo) >= AddPeriodo(GetPeriodo(DBDate(), fpAnioMes), 6) then
    InvalidMsg( edPeriodo, 'No se pueden hacer imputaciones para este periodo' )

  else if Importe <= 0 then
    InvalidMsg( edImporte, 'El importe debe ser mayor a 0' )

  else if fraTipoReg.IsEmpty then
    InvalidMsg( fraTipoReg, 'Debe indicar el tipo de régimen' )

  else if ValidarCoberturaPeriodo(frafpDM_CONTRATO.edContrato.Value, frafpDM_CONTRATO.mskCUIT.Text, Periodo, CodTipoRegimen) then
    //Busca el valor para ver si lo tiene que agregar o no
    begin
      sDescrTipoImputacion :=  GetDescripcionCodTipoImputacion( CodTipoImputacion );

      for iloop := 0 to lstPeriodos.Items.Count - 1 do
        if (StrLeft( lstPeriodos.Items[iloop], 7 ) = Periodo) and (InStr(lstPeriodos.Items[iloop], sDescrTipoImputacion) > 0) and (InStr(lstPeriodos.Items[iloop], SEPARADORLISTA_CAMPOS + CodTipoRegimen) > 0) then
          begin
            InvalidMsg( edPeriodo, 'El período ' + Periodo + ', el tipo de imputación ' + sDescrTipoImputacion + ' y el régimen ' + CodTipoRegimen + ' ya han sido incluídos' );
            Exit;
          end;

      //si llego hasta aca, quiere decir que no lo encontró y lo tiene que agregar
      AgregarPer( Periodo, Importe, CodTipoImputacion, CodTipoRegimen );
    end;
end;

procedure TfrmCargaDepositoManual.AgregarPer(Periodo: String; Importe: Currency; CodTipoImputacion, CodTipoRegimen: String);
var
  sDescrTipoImputacion: string;
begin
  sDescrTipoImputacion :=  GetDescripcionCodTipoImputacion( CodTipoImputacion );

  lstPeriodos.Items.Add( Periodo + SEPARADORLISTA_CAMPOS + Trim( Format('%12.2f', [Importe] ) ) + SEPARADORLISTA_TIPOIMPUT1 + sDescrTipoImputacion + SEPARADORLISTA_TIPOIMPUT2 + SEPARADORLISTA_CAMPOS + CodTipoRegimen );
end;

procedure TfrmCargaDepositoManual.btnEliminarClick(Sender: TObject);
begin
  if lstPeriodos.ItemIndex <> -1 then
    begin
      lstPeriodos.Items.Delete ( lstPeriodos.ItemIndex );
      ActualizarSaldoPeriodosCobertura( nil );
    end;
end;

procedure TfrmCargaDepositoManual.LoadPeriodos;
var
  Query: TSDQuery;
  sPeriodo: string;
begin
  lstPeriodos.Clear;
  Query := GetQuery( 'SELECT DP_PERIODO, DP_IMPORTE, DP_TIPOIMPUTACION, TR_CODIGO FROM ATR_TIPOREGIMEN, ZDP_DEPOSITOMANUALPERIODO WHERE DP_IDTIPOREGIMEN = TR_ID AND DP_IDDEPOSITOMANUAL = ' + SqlValue(StrToInt( fIDDeposito )) + ' ORDER BY DP_PERIODO, DP_TIPOIMPUTACION');
  try
    while not Query.Eof do
    begin
      sPeriodo := FormatPeriodo(Query.FieldByName( 'DP_PERIODO' ).AsString);
      AgregarPer( sPeriodo, Query.FieldByName( 'DP_IMPORTE' ).AsCurrency, Query.FieldByName( 'DP_TIPOIMPUTACION' ).AsString, Query.FieldByName( 'TR_CODIGO' ).AsString );

      Query.Next;
    end;

    ActualizarSaldoPeriodosCobertura( nil );
  finally
    Query.Free;
  end;
end;

procedure TfrmCargaDepositoManual.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraDM_CONTRATO.Clear;
  edDM_NRODEPOSITO.Clear;
  fraRM_IDCUENTABANCARIA.Clear;
  edDM_IMPORTEDesde.Clear;
  edDM_IMPORTEHasta.Clear;
  rbAmbos.Checked := True;
  cmbDM_FECHADEPOSITODesde.Clear;
  cmbDM_FECHADEPOSITOHasta.Clear;
  cmbDM_FECHAALTADesde.Clear;
  cmbDM_FECHAALTAHasta.Clear;
  fraDM_USUALTA.Clear;
  
  fraDM_CONTRATO.mskCUIT.SetFocus;
end;

procedure TfrmCargaDepositoManual.fpAbmShow(Sender: TObject);
begin
  inherited;

  if ModoABM = maModificacion then
     VCLExtra.LockControls ( edfpDM_NRODEPOSITO, True )
  else
     VCLExtra.LockControls ( edfpDM_NRODEPOSITO, False );
end;

procedure TfrmCargaDepositoManual.btnAceptarClick(Sender: TObject);
var
  TipoAsignacion: TTipoAsignacion;
begin
  TipoAsignacion := GetTipoAsignacion;

  if ValidarDatos( TipoAsignacion ) and DoABMDatos( TipoAsignacion ) Then
    begin
      tbRefrescarClick( Nil );
      CheckButtons;
      fpABM.ModalResult := mrOk;
    end;
end;

procedure TfrmCargaDepositoManual.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName( 'DM_IMPORTE' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
     TFloatField( sdqConsulta.FieldByName( 'DM_IMPORTE' ) ).Currency := True;
end;

procedure TfrmCargaDepositoManual.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmCargaDepositoManual.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := '$ ' + FloatToStr(TotalConsulta[iPos]);
end;

function TfrmCargaDepositoManual.IsDatosValidosBaja: Boolean;
var
  i: Integer;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      MessageDlg( 'Debe seleccionar al menos una fila de la grilla', mtError, [mbOK], 0 );
      Exit;
    end;

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      if not sdqConsulta.FieldByName( 'DM_USUAPROBACION' ).IsNull then
        begin
          MessageDlg( 'Uno de los depósitos ya ha sido aprobado', mtError, [mbOK], 0 );
          Exit;
        end;
    end;

  Result := True;
end;

procedure TfrmCargaDepositoManual.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  IdDeposito, IdRemesa: TTableId;
  TipoAsignacionDeposito: TTipoAsignacion;
  i: Integer;
begin
  if IsDatosValidosBaja() then
    if MsgBox( '¿Desea dar de baja los registros seleccionados?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
      begin
        try
          BeginTrans;

          for i := 0 to Grid.SelectedRows.Count - 1 do
            begin
              sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

              IdDeposito := sdqConsulta.FieldByName( 'DM_ID' ).AsInteger;
              IdRemesa   := sdqConsulta.FieldByName( 'RM_ID' ).AsInteger;

              sSql := 'DELETE FROM ZDM_DEPOSITOMANUAL ' +
                       'WHERE DM_ID=' + SqlValue( IdDeposito );
              EjecutarSqlST( sSql );

              TipoAsignacionDeposito := GetTipoAsignacionDeposito( IdDeposito );

              case TipoAsignacionDeposito of
                taPeriodoCobertura: DoBorrarPeriodosDeposito( IdDeposito );
                taConvenio        :
                  begin
                    sSql := 'UPDATE ZPV_PLANVALOR ' +
                               'SET PV_USUBAJA=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                                   'PV_FECHABAJA=SYSDATE ' +
                             'WHERE PV_ID=' + SqlValue( sdqConsulta.FieldByName( 'DM_IDPLANVALOR' ).AsInteger );
                    EjecutarSqlST( sSql );
                  end;
              end;

              DoActualizarMontoSinImputarNomina( IdRemesa, sdqConsulta.FieldByName( 'IMPORTE' ).AsCurrency, 0 );
            end;

          CommitTrans;
          MessageDlg( 'Los datos de los depósitos se eliminaron correctamente', mtInformation, [mbOK], 0 );

          RefreshData;
        except
          on E: Exception do
            begin
              RollBack;

              Raise Exception.Create ( E.Message + CRLF + 'Error al eliminar los depósitos' );
            end;
        end;
      end;
end;

procedure TfrmCargaDepositoManual.DoActualizarMontoSinImputarNomina(IdRemesa: TTableId; ImporteAnterior, ImporteNuevo: Currency);
var
  sSql: String;
begin
  sSql := 'UPDATE RRM_REMESA ' +
             'SET RM_MONTOSINIMPUTAR=RM_MONTOSINIMPUTAR+' + SqlValue( ImporteAnterior-ImporteNuevo ) + ' ' +
           'WHERE RM_ID=' + SqlValue( IdRemesa );

  EjecutarSqlST( sSql );
end;

procedure TfrmCargaDepositoManual.chkExclusionFRemesaClick(Sender: TObject);
begin
  if chkExclusionFRemesa.Checked or edfpDM_FECHADEPOSITO.IsEmpty then
    frafpDM_IDREMESA.FechaDeposito := 0
  else
    frafpDM_IDREMESA.FechaDeposito := edfpDM_FECHADEPOSITO.Date;
end;

procedure TfrmCargaDepositoManual.fpAbmEnter(Sender: TObject);
begin
  inherited;

  chkExclusionFRemesaClick( Nil );
end;

procedure TfrmCargaDepositoManual.DoSepararItem_PeriodoImporteTipoImputacion(Item: String; var Periodo: String; var Importe: Currency; var DescrTipoImputacion, CodTipoRegimen: String);
var
  iPosTipo3, iPosImporte, iPosTipoImput1, iPosTipoImput2, iPosDatoTipoImput: Integer;
begin
  Periodo := PeriodoSacarBarra( StrLeft(Item, 7 ) );

  iPosImporte := InStr( Item, SEPARADORLISTA_CAMPOS ) + Length(SEPARADORLISTA_CAMPOS);
  iPosTipoImput1 := InStr( Item, SEPARADORLISTA_TIPOIMPUT1);
  iPosTipoImput2 := InStr( Item, SEPARADORLISTA_TIPOIMPUT2);
  iPosTipo3      := InStrX( Item, SEPARADORLISTA_CAMPOS, iPosTipoImput2 + 1 );

  iPosDatoTipoImput := iPosTipoImput1 + Length(SEPARADORLISTA_TIPOIMPUT1);

  Importe := StrToFloat( strMid( Item, iPosImporte, iPosTipoImput1 -  iPosImporte));
  DescrTipoImputacion := strMid( Item, iPosDatoTipoImput, iPosTipoImput2 - iPosDatoTipoImput);
  CodTipoRegimen := strMid( Item, iPosTipo3 + Length(SEPARADORLISTA_CAMPOS) - 1);
end;

procedure TfrmCargaDepositoManual.DoLimpiarPeriodoImporte;
begin
  edPeriodo.Periodo.Valor := '';
  edImporte.Clear;
  fraTipoReg.Clear;
end;

procedure TfrmCargaDepositoManual.tbNuevoClick(Sender: TObject);
begin
  frafpDM_IDREMESA.MostrarRemesasSinImputar := True;
  frafpDM_IDREMESA.Actualizar;

  inherited;
end;

procedure TfrmCargaDepositoManual.tbModificarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count > 1 then
    InvalidMsg ( Grid, 'Debe seleccionar solo un registro a modificar' )
  else
    begin
      frafpDM_IDREMESA.MostrarRemesasSinImputar := False;
      frafpDM_IDREMESA.Actualizar;

      inherited;
    end;
end;

procedure TfrmCargaDepositoManual.edfpDM_FECHADEPOSITOExit(Sender: TObject);
begin
  chkExclusionFRemesaClick(Nil);
end;

procedure TfrmCargaDepositoManual.rgTipoClick(Sender: TObject);
var
  bEsConvenio: Boolean;
begin
  inherited;

  DoLimpiarDatosTipoAsignacion;

  bEsConvenio := (GetTipoAsignacion = taConvenio);

  gbConvenios.Visible := bEsConvenio;
  gbPeriodos.Visible  := not bEsConvenio;
  pnlSaldo.Visible    := not bEsConvenio;

  frafpDM_IDGESTORCUENTA.Locked := not bEsConvenio;

  rgAsignacionDeposito.ItemIndex := -1;

  if bEsConvenio then
    begin
      if not frafpDM_CONTRATO.IsEmpty then
        DoCargarCuotasPlan( frafpDM_CONTRATO.Contrato );
    end;
end;

procedure TfrmCargaDepositoManual.sdqCuotasAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqCuotas.FieldByName( 'TOTALCUOTA' ) is TFloatField then
    TFloatField( sdqCuotas.FieldByName( 'TOTALCUOTA' )).Currency := True;

  if sdqCuotas.FieldByName( 'SALDO' ) is TFloatField then
    TFloatField( sdqCuotas.FieldByName( 'SALDO' )).Currency := True;
end;

procedure TfrmCargaDepositoManual.frafpDM_CONTRATOOnChange(Sender: TObject);
var
  sCodReg: String;
begin
  DoCargarCuotasPlan( frafpDM_CONTRATO.Contrato );

  if frafpDM_CONTRATO.IsSelected then
    begin
      sCodReg := Get_CodRegimenContratoAfi(frafpDM_CONTRATO.Contrato);

      if sCodReg = 'MIX' then
        fraTipoReg.Clear
      else
        fraTipoReg.Codigo := sCodReg;
    end;
end;

procedure TfrmCargaDepositoManual.DoCargarCuotasPlan(NroContrato: Integer);
begin
  sdqCuotas.ParamByName( 'pEsModificacion').AsInteger := Iif( ModoABM = maModificacion, 1, 0 );
  sdqCuotas.ParamByName( 'pContrato').AsInteger       := NroContrato;

  OpenQuery( sdqCuotas );
end;

function TfrmCargaDepositoManual.DoABM: Boolean;
begin
  Result := Null;
end;

function TfrmCargaDepositoManual.Validar: Boolean;
begin
  Result := Null;
end;

function TfrmCargaDepositoManual.GetTipoAsignacion: TTipoAsignacion;
begin
  case rgTipo.ItemIndex of
   0: Result := taConvenio;           // Convenio
   1: Result := taPeriodoCobertura;   // Periodo Cobertura
  else
    Result := taNone;
  end;
end;

procedure TfrmCargaDepositoManual.DoLimpiarDatosTipoAsignacion;
var
  TipoAsignacion: TTipoAsignacion;
begin
  TipoAsignacion := GetTipoAsignacion;

  case TipoAsignacion of
    taConvenio:
      sdqCuotas.Close;

    taPeriodoCobertura:
      begin
        lstPeriodos.Clear;
        rgAsignacionDeposito.ItemIndex := -1;
        edSaldo.Value := 0;
      end;  
  end;
end;

function TfrmCargaDepositoManual.GetTipoAsignacionDeposito(IdDeposito: TTableId): TTipoAsignacion;
begin
  if sdqConsulta.FieldByName( 'DM_IDPLANVALOR' ).IsNull then
    Result := taPeriodoCobertura
  else
    Result := taConvenio;
end;

procedure TfrmCargaDepositoManual.DoBorrarPeriodosDeposito(IdDeposito: TTableId);
var
  sSql: String;
begin
  sSql := 'DELETE FROM ZDP_DEPOSITOMANUALPERIODO ' +
           'WHERE DP_IDDEPOSITOMANUAL=' + SqlValue( IDDeposito );

  EjecutarSqlST ( sSql );
end;

procedure TfrmCargaDepositoManual.DoHabilitarControlesDeposito(Habilitar: Boolean);
begin
  VCLExtra.LockControls([frafpDM_IDREMESA, chkExclusionFRemesa, frafpDM_CONTRATO], not Habilitar);
  rgTipo.Enabled      := Habilitar;
  gbConvenios.Enabled := Habilitar;
end;

procedure TfrmCargaDepositoManual.tbAprobarClick(Sender: TObject);
var
  sSql: String;
  iTotalContrPer: Integer;
begin
  if IsDatosValidosAprobar() then
    begin
      if MsgBox( '¿Confirma la aprobación de ' + IntToStr( Grid.SelectedRows.Count ) + ' movimiento/s? ' + CRLF + '(En el caso de períodos de cobertura, se aprobarán todos los períodos del depósito)', MB_ICONQUESTION + MB_OKCANCEL ) = IDOK then
        begin
          if DoCrearTablaTemporalRegSeleccionados and DoCrearTablaTemporalConvenio and
             DoActualizarTablaTemporalImpSinImputarConvenio then
            begin
              try
                BeginTrans;

                // genero movimientos en zmo_Movimiento para los reg. seleccionados con
                // tipo de asignación: Periodo de Cobertura
                DoProcesarPeriodosCobertura;

                // actualizo resumen de cobranzas, tablas de planes de pago, y genero
                // movimientos en zmo_Movimiento para los reg. seleccionados con
                // tipo de asignación: Convenio
                DoProcesarConvenio;

                // actualizo fecha y usuario de aprobación
                sSql := 'UPDATE ZDM_DEPOSITOMANUAL ' +
                           'SET DM_USUAPROBACION=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                               'DM_FECHAAPROBACION=' + SQL_DATETIME + ' ' +
                         'WHERE DM_ID IN (SELECT DS_IDDEPOSITOMANUAL ' +
                                           'FROM TDS_DEPOSITOMANUALSINAPROBADOS ' +
                                           'WHERE DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ')';
                EjecutarSqlST( sSql );


                iTotalContrPer := Get_TotalContratosPeriodosRedevengar();
                if iTotalContrPer > 0 then
                  DoRedevengarTodos;

                // se concilian todos los periodos involucrados (tanto de convenio como de periodo de cobertura)
                DoConciliarReg;

                CommitTrans;
                MsgBox( 'Los movimientos se aprobaron correctamente', MB_OK+MB_ICONINFORMATION );
                RefreshData;
              except
                on E: Exception do
                  begin
                    RollBack;
                    Raise Exception.Create( E.Message + CRLF + 'Error al aprobar los movimientos' );
                  end;
              end;
            end;
        end;
    end;
end;

function TfrmCargaDepositoManual.IsDatosValidosAprobar: Boolean;
var
  i: Integer;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      InvalidMsg ( Grid, 'Debe seleccionar al menos una fila de la grilla' );
      Exit;
    end  
  else
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if not sdqConsulta.FieldByName( 'DM_USUAPROBACION' ).IsNull then
          begin
            MessageDlg( 'Uno de los depósitos ya ha sido aprobado', mtError, [mbOK], 0 );
            Exit;
          end;
      end;

  Result := True;
end;

function TfrmCargaDepositoManual.DoCrearTablaTemporalRegSeleccionados: Boolean;
var
  i: Integer;
  sSql: String;
begin
  Result := False;

  with TStringList.Create do
    try
      Sorted     := True;
      Duplicates := dupIgnore;

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
          Add( sdqConsulta.FieldByName('DM_ID').AsString );
        end;

      try
        BeginTrans;

        sSql := 'DELETE FROM TDS_DEPOSITOMANUALSINAPROBADOS ' +
                 'WHERE DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID );
        EjecutarSqlST( sSql );

        for i := 0 to Count - 1 do
          begin
            sSql := 'INSERT INTO TDS_DEPOSITOMANUALSINAPROBADOS(DS_USUARIO, DS_IDDEPOSITOMANUAL) ' +
                         'VALUES(' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                                     SqlInteger( Strings[i] ) + ')';
            EjecutarSqlST( sSql );
          end;

        CommitTrans;
        Result := True;
      except
        On E: Exception do
          begin
            RollBack;

            Raise Exception.Create( E.Message );
          end;
      end;
    finally
      Free
    end;
end;

function TfrmCargaDepositoManual.Get_TotalContratosPeriodosRedevengar: Integer;
var
  sSql: String;
begin
  sSql := 'SELECT COUNT(*) ' +
          'FROM ' +
         '(SELECT 1 ' +
            'FROM TDS_DEPOSITOMANUALSINAPROBADOS, ZDM_DEPOSITOMANUAL, ZDP_DEPOSITOMANUALPERIODO ' +
           'WHERE DP_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
        'GROUP BY DM_CONTRATO, DP_PERIODO ' +
           'UNION ALL ' +
          'SELECT 1 ' +
            'FROM TPP_PLANDEUDAPENDIENTES ' +
           'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
             'AND PP_TIPO IS NOT NULL ' +    // registros a los que se les asignó algún pp_ImporteImputar
        'GROUP BY PP_CONTRATO, PP_PERIODO)';

  Result := ValorSqlInteger( sSql );
end;

procedure TfrmCargaDepositoManual.DoRedevengarTodos;
var
  sSql, sPeriodo: String;
  iContrato: Integer;
begin
  // relacionado con Get_TotalContratosPeriodosRedevengar y con DoSeleccionarRedevengar
  sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTEREGIMEN(DM_CONTRATO, NULL, DP_IDTIPOREGIMEN) CONTRATO, DP_PERIODO PERIODO ' +
            'FROM TDS_DEPOSITOMANUALSINAPROBADOS, ZDM_DEPOSITOMANUAL, ZDP_DEPOSITOMANUALPERIODO ' +
           'WHERE DP_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
        'GROUP BY DM_CONTRATO, DP_IDTIPOREGIMEN, DP_PERIODO ' +
           'UNION ' +
          'SELECT PP_CONTRATO CONTRATO, PP_PERIODO PERIODO ' +
            'FROM TPP_PLANDEUDAPENDIENTES ' +
           'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
             'AND PP_TIPO IS NOT NULL ' +    // registros a los que se les asignó algún pp_ImporteImputar
        'GROUP BY PP_CONTRATO, PP_PERIODO';

  with GetQuery( sSql ) do
    begin
      try
        while not EOF do
          begin
            iContrato := FieldByName( 'CONTRATO' ).AsInteger;
            sPeriodo  := FieldByName( 'PERIODO' ).AsString;

            Do_RedevengarConciliar( iContrato, sPeriodo, frmPrincipal.DBLogin.UserID, True, False, False );

            Next;
          end;
      finally
        free;
      end;
    end;
end;

procedure TfrmCargaDepositoManual.DoConciliarReg;
var
  sSql, sPeriodo: String;
  iContrato: Integer;
begin
  // relacionado con Get_TotalContratosPeriodosRedevengar
  sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTEREGIMEN(DM_CONTRATO, NULL, DP_IDTIPOREGIMEN) CONTRATO, DP_PERIODO PERIODO ' +
            'FROM TDS_DEPOSITOMANUALSINAPROBADOS, ZDM_DEPOSITOMANUAL, ZDP_DEPOSITOMANUALPERIODO ' +
           'WHERE DP_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
        'GROUP BY DM_CONTRATO, DP_IDTIPOREGIMEN, DP_PERIODO ' +
           'UNION ' +
          'SELECT PP_CONTRATO CONTRATO, PP_PERIODO PERIODO ' +
            'FROM TPP_PLANDEUDAPENDIENTES ' +
           'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
             'AND PP_TIPO IS NOT NULL ' +    // registros a los que se les asignó algún pp_ImporteImputar
        'GROUP BY PP_CONTRATO, PP_PERIODO';

  with GetQuery( sSql ) do
    begin
      try
        while not EOF do
          begin
            iContrato := FieldByName( 'CONTRATO' ).AsInteger;
            sPeriodo  := FieldByName( 'PERIODO' ).AsString;

            Do_RedevengarConciliar( iContrato, sPeriodo, frmPrincipal.DBLogin.UserID, False, False, True );

            Next;
          end;
      finally
        free;
      end;
    end;
end;

procedure TfrmCargaDepositoManual.DoProcesarPeriodosCobertura;
var
  sSql, sSql2, sPeriodo, sUsuAlta, sNroDeposito: String;
  dFechaDeposito, dFechaRecepcion, dFeDis: TDateTime;
  IdRemesa: TTableId;
  iContrato: Integer;
  rImporte: Currency;
begin
  dFeDis := Get_FechaDistribucion;

  sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTEREGIMEN(DM_CONTRATO, NULL, DP_IDTIPOREGIMEN) CONTRATO, DM_FECHADEPOSITO, DM_IDREMESA, DM_FECHARECEPCION, ' +
                 'DM_USUALTA, DM_NRODEPOSITO, DP_PERIODO, DP_IMPORTE, DP_TIPOIMPUTACION ' +
            'FROM TDS_DEPOSITOMANUALSINAPROBADOS, ZDM_DEPOSITOMANUAL, ZDP_DEPOSITOMANUALPERIODO ' +
           'WHERE DP_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_IDDEPOSITOMANUAL=DM_ID ' +
             'AND DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
        'ORDER BY DM_CONTRATO, DP_PERIODO, DP_TIPOIMPUTACION';

  with GetQuery( sSql ) do
    begin
      try
        while not EOF do
          begin
            iContrato       := FieldByName( 'CONTRATO' ).AsInteger;
            dFechaDeposito  := FieldByName( 'DM_FECHADEPOSITO' ).AsDateTime;
            IdRemesa        := FieldByName( 'DM_IDREMESA' ).AsInteger;
            dFechaRecepcion := FieldByName( 'DM_FECHARECEPCION' ).AsDateTime;
            sUsuAlta        := FieldByName( 'DM_USUALTA' ).AsString;
            sPeriodo        := FieldByName( 'DP_PERIODO' ).AsString;
            rImporte        := FieldByName( 'DP_IMPORTE' ).AsCurrency;
            sNroDeposito    := FieldByName( 'DM_NRODEPOSITO' ).AsString;

            if FieldByName( 'DP_TIPOIMPUTACION' ).AsString = 'C' then  // Cuota
              sSql2 := 'COBRANZA.DOASIGNARMOVIMCUOTACONTRPER(' + SqlValue( iContrato ) + ', ' +
                          SqlValue( sPeriodo ) + ', ' + SqlNumber( rImporte ) + ', ' +
                          SqlValue( sUsuAlta ) + ', ' + SqlValue( IdRemesa ) + ', ' +
                          SqlValue( dFeDis ) + ', ' + SqlValue( dFechaDeposito ) + ', ' +
                          ''''', ''2'', ' + SqlValue( dFechaRecepcion ) + ', ' +
                          SqlValue( frmPrincipal.DBLogin.UserID ) + ', Null, Null, ' +
                          SqlValue( sNroDeposito ) + ');'
            else  // Interés
              sSql2 := 'COBRANZA.DOASIGNARMOVIMINTERESCONTRPER(' + SqlValue( iContrato ) + ', ' +
                          SqlValue( sPeriodo ) + ', ' + SqlNumber( rImporte ) + ', ' +
                          SqlValue( sUsuAlta ) + ', ' + SqlValue( IdRemesa ) + ', ' +
                          SqlValue( dFeDis ) + ', ' + SqlValue( dFechaDeposito ) + ', ' +
                          ''''', ''2'', ' + SqlValue( dFechaRecepcion ) + ', ' +
                          SqlValue( frmPrincipal.DBLogin.UserID ) + ', Null, Null, ' +
                          SqlValue( sNroDeposito ) + ');';

            EjecutarStoreST( sSql2 );

            Next;
          end;
      finally
        free;
      end;
    end;
end;

function TfrmCargaDepositoManual.DoCrearTablaTemporalConvenio: Boolean;
var
  sSql: String;
begin
  // ver CONT.Do_GenerarPlanDeudaPendientes
  try
    BeginTrans;

    sSql := 'DELETE FROM TPP_PLANDEUDAPENDIENTES ' +
             'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID );
    EjecutarSqlST( sSql );

    sSql := 'INSERT INTO TPP_PLANDEUDAPENDIENTES(PP_USUARIO, PP_IDDEPOSITOMANUAL, PP_IDPLANDEUDA, ' +
                   'PP_PERIODO, PP_IMPORTEIMPUTAR, PP_SALDODEUDANOMINAL, PP_CONTRATO) ' +  // PP_ID va por trigger
            'SELECT ' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', DM_ID, PD_ID, PD_PERIODO, ' +
                    '0, MAX(PD_SALDODEUDANOMINAL), PD_CONTRATO_EXT ' +
              'FROM TDS_DEPOSITOMANUALSINAPROBADOS, ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, ' +
                   'ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
             'WHERE DS_IDDEPOSITOMANUAL=DM_ID ' +
               'AND DM_IDPLANVALOR=PV_ID ' +
               'AND PV_IDPLANCUOTA=PC_ID ' +
               'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
               'AND DS_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
          'GROUP BY DM_ID, PD_ID, PD_PERIODO, PD_CONTRATO_EXT';
    EjecutarSqlST( sSql );

    CommitTrans;
    Result := True;
  except
    On E: Exception do
      begin
        RollBack;

        Raise Exception.Create( E.Message );
      end;
  end;
end;

function TfrmCargaDepositoManual.DoActualizarTablaTemporalImpSinImputarConvenio: Boolean;
var
  sSql, sSql2, sSql3: String;
  IdDeposManual, IdPlanDeudaPendientes, IdPlanDeuda, IdPlanPago: TTableId;
  rImporteDeposManual, rImporteSaldo, rImporteImputar, rSaldoIntMora: Currency;
begin
  // ver CONT.Do_ActPlanDeudaPendientes
  try
    BeginTrans;

    sSql := 'SELECT DM_ID, MAX(DM_IMPORTE) DMIMPORTE ' +
              'FROM TPP_PLANDEUDAPENDIENTES, ZDM_DEPOSITOMANUAL ' +
             'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
               'AND PP_IDDEPOSITOMANUAL=DM_ID ' +
          'GROUP BY DM_ID';

    with GetQuery( sSql ) do  // recorro por depósito manual seleccionado
      try
        while not EOF do
          begin
            IdDeposManual         := FieldByName( 'DM_ID' ).AsInteger;
            rImporteDeposManual   := FieldByName( 'DMIMPORTE' ).AsCurrency;

            sSql2 := 'SELECT PP_ID, PP_SALDODEUDANOMINAL, PP_IDPLANDEUDA ' +
                       'FROM TPP_PLANDEUDAPENDIENTES ' +
                      'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
                        'AND PP_IDDEPOSITOMANUAL=' + SqlValue( IdDeposManual ) + ' ' +
                        'AND PP_SALDODEUDANOMINAL>0 ' +
                   'ORDER BY PP_PERIODO';

            with GetQuery( sSql2 ) do  // proceso periodos del estado de cuenta del plan de pago correspondiente al depósito manual seleccionado
              try
                while (not EOF) and (rImporteDeposManual > 0) do
                  begin
                    rImporteSaldo := FieldByName( 'PP_SALDODEUDANOMINAL' ).AsCurrency;

                    if rImporteSaldo > 0 then    // pongo esta condición porque el saldo pudo haber cambiado por los updates que hago a continuación
                      begin
                        rImporteImputar       := Math.Min(rImporteSaldo, rImporteDeposManual);
                        IdPlanDeudaPendientes := FieldByName( 'PP_ID' ).AsInteger;
                        IdPlanDeuda           := FieldByName( 'PP_IDPLANDEUDA' ).AsInteger;

                        sSql3 := 'UPDATE TPP_PLANDEUDAPENDIENTES ' +
                                    'SET PP_IMPORTEIMPUTAR=' + SqlNumber(rImporteImputar) + ', ' +
                                        'PP_SALDODEUDANOMINAL=PP_SALDODEUDANOMINAL-' + SqlNumber(rImporteImputar) + ', ' +
                                        'PP_TIPO=''C'' ' +
                                  'WHERE PP_ID=' + SqlValue( IdPlanDeudaPendientes );
                        EjecutarSqlST( sSql3 );

                        // Esto lo hago porque si selecciona en la grilla dos depósitos manuales (dm_id, tpp.pp_IdDepositoManual) que corresponden
                        // al mismo plan (zpp_PlanPago.pp_Id), entonces van a estar duplicados los estados de cuenta (zpd_PlanDeuda) para cada dm_id.
                        // Entonces, actualizo también el saldo del estado de cuenta (tpp.pp_SaldoDeudaNominal), para el resto de los mismos periodos,
                        // o sea, aquellos registros con igual tpp.pp_IdPlanDeuda (zpd_PlanDeuda.pd_Id)
                        sSql3 := 'UPDATE TPP_PLANDEUDAPENDIENTES ' +
                                    'SET PP_SALDODEUDANOMINAL=PP_SALDODEUDANOMINAL-' + SqlNumber(rImporteImputar) + ' ' +
                                  'WHERE PP_USUARIO=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ' ' +
                                    'AND PP_IDPLANDEUDA=' + SqlValue( IdPlanDeuda ) + ' ' +
                                    'AND PP_ID<>' + SqlValue( IdPlanDeudaPendientes );
                        EjecutarSqlST( sSql3 );

                        rImporteDeposManual := rImporteDeposManual - rImporteImputar;
                      end;

                    Next;
                  end;

                // análisis de intereses
                if rImporteDeposManual > 0 then  // primero, el dinero que queda se imputa al último periodo como intereses por mora
                  begin
                    sSql3 := 'SELECT PC_IDPLANPAGO ' +
                               'FROM ZPC_PLANCUOTA, ZPV_PLANVALOR, ZDM_DEPOSITOMANUAL ' +
                              'WHERE DM_IDPLANVALOR=PV_ID ' +
                                'AND PV_IDPLANCUOTA=PC_ID ' +
                                'AND DM_ID=' + SqlValue( IdDeposManual );
                    IdPlanPago := ValorSqlInteger( sSql3, ART_EMPTY_ID );

                    sSql3 := 'SELECT COBRANZA.GET_SALDOINTMORA_PLAN(' + SqlValue( IdPlanPago ) + ', ' + SqlValue( frmPrincipal.DBLogin.UserID ) + ') ' +
                               'FROM DUAL';
                    rSaldoIntMora := ValorSqlExtended( sSql3 );

                    rImporteImputar := Math.Min(rSaldoIntMora, rImporteDeposManual);

                    if rImporteImputar > 0 then
                      begin
                        sSql3 := 'INSERT INTO TPP_PLANDEUDAPENDIENTES(PP_USUARIO, PP_IDDEPOSITOMANUAL, ' +
                                        'PP_IDPLANDEUDA, PP_PERIODO, PP_IMPORTEIMPUTAR, PP_CONTRATO, ' +
                                        'PP_TIPO) ' +   // PP_ID va por trigger
                                 'SELECT ' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                                         'DM_ID, MAX(PD_ID), MAX(PD_PERIODO), ' + SqlNumber( rImporteImputar ) + ', ' +
                                         'PD_CONTRATO_EXT, ''M'' ' +
                                   'FROM ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
                                  'WHERE DM_IDPLANVALOR=PV_ID ' +
                                    'AND PV_IDPLANCUOTA=PC_ID ' +
                                    'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
                                   'AND DM_ID=' + SqlValue( IdDeposManual ) + ' ' +
                              'GROUP BY DM_ID, PD_CONTRATO_EXT';
                        EjecutarSqlST( sSql3 );

                        rImporteDeposManual := rImporteDeposManual - rImporteImputar;
                      end;
                  end;

                if rImporteDeposManual > 0 then  // y finalmente, el resto del dinero que queda se imputa al último periodo como intereses por financiación
                  begin
                    sSql3 := 'INSERT INTO TPP_PLANDEUDAPENDIENTES(PP_USUARIO, PP_IDDEPOSITOMANUAL, ' +
                                    'PP_IDPLANDEUDA, PP_PERIODO, PP_IMPORTEIMPUTAR, PP_CONTRATO, ' +
                                    'PP_TIPO) ' +   // PP_ID va por trigger
                             'SELECT ' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                                     'DM_ID, MAX(PD_ID), MAX(PD_PERIODO), ' + SqlNumber( rImporteDeposManual ) + ', ' +
                                     'PD_CONTRATO_EXT, ''F'' ' +
                               'FROM ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
                              'WHERE DM_IDPLANVALOR=PV_ID ' +
                                'AND PV_IDPLANCUOTA=PC_ID ' +
                                'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
                               'AND DM_ID=' + SqlValue( IdDeposManual ) + ' ' +
                          'GROUP BY DM_ID, PD_CONTRATO_EXT';
                    EjecutarSqlST( sSql3 );
                  end;
              finally
                free;
              end;

            Next;
          end;
      finally
        free;
      end;

    CommitTrans;
    Result := True;
  except
    On E: Exception do
      begin
        RollBack;

        Raise Exception.Create( E.Message );
      end;
  end;
end;

procedure TfrmCargaDepositoManual.DoProcesarConvenio;
var
  sSql: String;
begin
  sSql := 'COBRANZA.DO_PROCESARCONVENIODEPOSMANUAL(' + SqlValue( frmPrincipal.DBLogin.UserID ) + ');';
  EjecutarStoreST( sSql );
end;

function TfrmCargaDepositoManual.ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo, CodTipoRegimen: String): Boolean;
var
  sSql: String;
  iContratoVigente: Integer;
begin
  Periodo := PeriodoSacarBarra(Periodo);
  sSql := 'SELECT COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(' + SqlValue( Contrato ) + ', ' + SqlValue( Periodo ) + ') ' +
           'FROM DUAL';

  If ValorSqlInteger( sSql ) = 1 then
    Result := True
  else
    begin
      sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTE(' + SqlValue( Cuit ) + ', ' + SqlValue( Periodo ) + ', AFILIACION.GET_IDREGIMEN(' + SqlValue( CodTipoRegimen ) + ')) ' +
                'FROM DUAL';

      iContratoVigente := ValorSqlInteger( sSql );

      if iContratoVigente = 0 then
        InvalidMsg( edPeriodo, 'El periodo indicado no corresponde a ningún contrato de la empresa para el régimen seleccionado' )
      else if iContratoVigente = Contrato then
        InvalidMsg( edPeriodo, 'Para el periodo indicado, el contrato no se encuentra activo' )
      else
        begin
          sSql := 'SELECT AFILIACION.GET_CONTRATOPRINCIPAL(:Contrato, :Periodo) ' +
                    'FROM DUAL';

          InvalidMsg( edPeriodo, 'El período indicado corresponde al contrato ' + ValorSqlEx(sSql, [iContratoVigente, Periodo] ) + '.' );
        end;

      Result := False;
    end;
end;

function TfrmCargaDepositoManual.GetCodTipoImputacion: String;
begin
  if rgAsignacionDeposito.ItemIndex = 0 then
    Result := 'C'     // Cuota
  else
    Result := 'I';    // Interés
end;

function TfrmCargaDepositoManual.GetCodTipoImputacionDescr(DescrTipoImputacion: String): String;
begin
  if DescrTipoImputacion = TIPOIMPUTACION_CUOTA then
    Result := 'C'     // Cuota
  else
    Result := 'I';    // Interés
end;

function TfrmCargaDepositoManual.GetDescripcionCodTipoImputacion(CodTipoImputacion: String): String;
begin
  if CodTipoImputacion = 'C' then
    Result := TIPOIMPUTACION_CUOTA
  else
    Result := TIPOIMPUTACION_INTERES;
end;

function TfrmCargaDepositoManual.GetTotalPeriodosCobertura: Currency;
var
  iLoop: integer;
  sCodTipoRegimen, sPeriodo, sDescrTipoImputacion: string;
  rTotImporte, rImporte: Currency;
begin
  rTotImporte := 0;

  for iLoop := 0 to lstPeriodos.Items.Count-1 do
    begin
      DoSepararItem_PeriodoImporteTipoImputacion( lstPeriodos.Items.Strings[iLoop], sPeriodo, rImporte, sDescrTipoImputacion, sCodTipoRegimen );

      rTotImporte := rTotImporte + rImporte;
    end;

  Result := rTotImporte;
end;

procedure TfrmCargaDepositoManual.ActualizarSaldoPeriodosCobertura(Sender: TObject);
begin
  edSaldo.Value := edfpDM_IMPORTE.Value - GetTotalPeriodosCobertura();

  if edSaldo.Value = 0 then
    edSaldo.Font.Color := clGreen
  else if edSaldo.Value < 0 then
    edSaldo.Font.Color := clRed
  else
    edSaldo.Font.Color := clWindowText;
end;

procedure TfrmCargaDepositoManual.btnAceptarRedevengarClick(Sender: TObject);
begin
  if GridPeriodos.SelectedRows.Count = 0 then
    begin
      MessageDlg( 'Debe seleccionar al menos una fila de la grilla', mtError, [mbOK], 0 );
      Exit;
    end;

  fpRedevegarPeriodos.ModalResult := mrOk;
end;

procedure TfrmCargaDepositoManual.frafpDM_IDREMESAChange(Sender: TObject);
begin
  edfpDM_IMPORTE.Value := frafpDM_IDREMESA.MontoSinImputar;
end;

procedure TfrmCargaDepositoManual.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmCargaDepositoManual.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

function TfrmCargaDepositoManual.IsDatosValidosRevertir: Boolean;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      MessageDlg( 'Debe seleccionar una fila de la grilla', mtError, [mbOK], 0 );
      Exit;
    end;

  if Grid.SelectedRows.Count > 1 then
    begin
      MessageDlg( 'Debe seleccionar solo una fila de la grilla', mtError, [mbOK], 0 );
      Exit;
    end;

  if sdqConsulta.FieldByName( 'DM_USUAPROBACION' ).IsNull then
    begin
      MessageDlg( 'El depósito no ha sido aún aprobado', mtError, [mbOK], 0 );
      Exit;
    end;

  if not sdqConsulta.FieldByName( 'DM_IDPLANVALOR' ).IsNull then
    begin
      MessageDlg( 'El depósito no puede ser por convenio', mtError, [mbOK], 0 );
      Exit;
    end;

  Result := True;
end;

procedure TfrmCargaDepositoManual.tbRevertirClick(Sender: TObject);
var
  iContrato: Integer;
  sSql, sPeriodo: String;
  IdDeposito, IdRemesa: TTableId;
begin
  if IsDatosValidosRevertir() then
    begin
      if MsgBox( '¿Confirma la reversión de los movimientos de todos los periodos de la boleta de depósito?', MB_ICONQUESTION + MB_OKCANCEL ) = IDOK then
        begin
          try
            BeginTrans;

            iContrato  := sdqConsulta.FieldByName( 'CONTRATOEXT' ).AsInteger;
            IdRemesa   := sdqConsulta.FieldByName( 'RM_ID' ).AsInteger;
            IdDeposito := sdqConsulta.FieldByName( 'DM_ID' ).AsInteger;

            sSql := 'SELECT DP_PERIODO, DP_IMPORTE ' +
                      'FROM ZDP_DEPOSITOMANUALPERIODO ' +
                     'WHERE DP_IDDEPOSITOMANUAL=:IdDeposito ' +
                  'ORDER BY DP_PERIODO';
            with GetQueryEx( sSql, [IdDeposito] ) do
              begin
                try
                  while not EOF do
                    begin
                      sPeriodo  := FieldByName( 'DP_PERIODO' ).AsString;

                      DoRevertirMovimientos( iContrato, sPeriodo, IdRemesa, frmPrincipal.DBLogin.UserID );
                      Do_RedevengarConciliar( iContrato, sPeriodo, frmPrincipal.DBLogin.UserID, True, False, True );

                      Next;
                    end;
                finally
                  free;
                end;
              end;

            sSql := 'UPDATE ZDM_DEPOSITOMANUAL ' +
                       'SET DM_USUAPROBACION=NULL, ' +
                           'DM_FECHAAPROBACION=NULL '+ 
                     'WHERE DM_ID=:IdDeposito';
            EjecutarSqlSTEx( sSql, [IdDeposito] );

            CommitTrans;
            MsgBox( 'Los movimientos del depósito se revirtieron correctamente', MB_OK+MB_ICONINFORMATION );
            RefreshData;
          except
            on E: Exception do
              begin
                RollBack;
                Raise Exception.Create( E.Message + CRLF + 'Error al revertir los movimientos del depósito' );
              end;
          end;
        end;
    end;
end;

procedure TfrmCargaDepositoManual.DoRevertirMovimientos(Contrato: Integer; Periodo: String; IdRemesa: TTableId; Usuario: String);
var
  sSql: String;
begin
  sSql := 'COBRANZA.DO_REVERTIRMOVDEPMANUAL(:iContrato, :sPeriodo, :IdRemesa, :sUsuario);';
  EjecutarStoreSTEx( sSql, [Contrato, Periodo, IdRemesa, Usuario] );
end;

end.

