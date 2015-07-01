unit unFrmEstadoCuentaEmision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraInfoEmpresa, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, StdCtrls, ComCtrls, ToolWin, ExtCtrls, PeriodoPicker,
  unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraStaticActividad,
  ShortCutControl, Placemnt, artSeguridad, SortDlg, QueryPrint, DB,
  SDEngine;

type
  TFrmEstadoCuentaEmision = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    tbOrdenar: TToolButton;
    tbSeparador: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    ColorDialog: TColorDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    SortDialog: TSortDialog;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    tbRefrescar: TToolButton;
    tbNominas: TToolButton;
    chkTodosContratos: TCheckBox;
    ToolButton2: TToolButton;
    StatusBar1: TStatusBar;
    pnFiltro: TPanel;
    Grid: TArtDBGrid;
    pnExtra: TPanel;
    gbInformacionEmpresa: TGroupBox;
    fraInfoEmpresa: TfraInfoEmpresa;
    gbRazonSocial: TGroupBox;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    edtMotivoBaja: TEdit;
    fraActividad: TfraStaticActividad;
    edDC_TELEFONOS: TEdit;
    edtDomicilio: TEdit;
    cmbFechaBaja: TDateComboBox;
    fraContrato: TfraEmpresa;
    edtEstado: TEdit;
    cmbFechaVigenciaDesde: TDateComboBox;
    cmbFechaVigenciaHasta: TDateComboBox;
    gbPeriodos: TGroupBox;
    Label19: TLabel;
    Label18: TLabel;
    edtPeriodoDesde: TPeriodoPicker;
    edtPeriodoHasta: TPeriodoPicker;
    cmbFECHACONTABLE_AL: TDateComboBox;
    lblFechaContableAl: TLabel;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PeriodoPicker1: TPeriodoPicker;
    tbOcultarFiltros: TToolButton;
    ToolButton5: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbNominasClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure chkSumatoriaClick(Sender: TObject);
    procedure tbOcultarFiltrosClick(Sender: TObject);
  private

    FSqlAnterior: string;
    FPeriodoDesdeAnterior: string;
    FPeriodoHastaAnterior: string;
    FIncluirGestion: boolean;
    FSaldoAcreedor: boolean;
    FSaldoDeudor: boolean;
    FFechaQuiebra: TDateTime;
    NombreCampos: array of string;
    TotalResumen, TotalDetalle : array of extended;
    procedure DoCargar(Contrato: Integer; Cuit : string);
    function Get_SqlDetalle(Contrato: Integer; Cuit,
      CompSaldo: String): String;
    procedure DoCargarDetalle(Contrato: Integer; Cuit : string);
    procedure CalcTotales;
    procedure MostrarOcultarFiltros;
    { Private declarations }
  public
    { Public declarations }
    procedure CargarCabecera(Contrato: Integer);
  end;

var
  FrmEstadoCuentaEmision: TFrmEstadoCuentaEmision;

implementation

Uses
  unDmPrincipal, VCLExtra,
  AnsiSql, dbFuncs, CustomDlgs, General, unComunes, StrFuncs, Numeros, unArt, unDmEmision;

Const
  MAXCOLS_RESUMEN = 6;
  MAXCOLS_DETALLE = 1;

  CAMPOS_RESUMEN : array [0..MAXCOLS_RESUMEN] of string = ('DEVENGADOS', 'PAGOS', 'DEUDA_TOTAL', 'MONTOREFINANCIADO', 'INTERES' , 'DEUDA_CONSOLIDADA', 'IMPORTERECLAMOAFIP');
  CAMPOS_DETALLE : array [0..MAXCOLS_DETALLE] of string = ('DEVENGADOS','PAGOS');



{$R *.dfm}

{--------------------------------------------------------------------------------------------}
procedure TFrmEstadoCuentaEmision.CargarCabecera( Contrato: Integer );
var
  sSql: string;
  Query: TSDquery;
begin
  sSql := 'SELECT CO_CONTRATO, DC_TELEFONOS || DC_FAX DC_TELEFONOS, AC_CODIGO, ' +
          '       AFEST.TB_DESCRIPCION AS ESTADO, CO_IDACTIVIDAD, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION AS MOTIVO_BAJA, ' +
          '       NVL(DC_DOMICILIO, ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
          '       ||ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA)) AS DOM_POSTAL' +
          '  FROM ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE CO_CONTRATO     = DC_CONTRATO' +
          '   AND CO_IDACTIVIDAD  = AC_ID' +
          '   AND BAJ.TB_CLAVE(+) = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE  = ''AFEST''' +
          '   AND AFEST.TB_CODIGO = CO_ESTADO' +
          '   AND CO_CONTRATO     = ' + SqlValue(Contrato);
  Query := GetQuery( sSql );

  try
    if not Query.Eof then
    begin
      With Query do
      begin
        fraContrato.Showbajas         := true;
        fraContrato.Contrato          := Contrato;
        edtDomicilio.Text             := FieldByName('DOM_POSTAL').AsString;
        cmbFechaVigenciaDesde.Date    := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbFechaVigenciaHasta.Date    := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbFechaBaja.Date             := FieldByName('CO_FECHABAJA').AsDateTime;
        edtMotivoBaja.Text            := FieldByName('MOTIVO_BAJA').AsString;
        fraActividad.Value            := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edtEstado.Text                := FieldByName('ESTADO').AsString;
        fraInfoEmpresa.CargarContrato(IntToStr(Contrato), fraContrato.CUIT);

        tbRefrescarClick( self );
      end;
    end
    else
      MessageDlg('Los datos son incorrectos', mtWarning, [mbOK], 0);
  finally
    Query.Free;
  end;
end;

procedure TFrmEstadoCuentaEmision.DoCargar(Contrato: Integer; Cuit: string);
begin

  DoCargarDetalle(Contrato, Cuit);

  if sdqConsulta.IsEmpty then
    MessageDlg('No existen datos para esta consulta', mtWarning, [mbOK], 0);
end;

procedure TFrmEstadoCuentaEmision.DoCargarDetalle(Contrato: Integer; Cuit : string);
var
  sCompSaldo, sSql, sSqlAdic: string;
begin

    //Genero el Sql
    sSql := 'SELECT ZMO.MO_CONTRATO CONTRATO, ZMO.MO_PERIODO PERIODO, CM_CODIGO, CM_DESCRIPCION, ' +
            '       DECODE (CM_OPERACION, ''E'',MO_IMPORTE, 0) DEVENGADOS, ' +
            '       DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE' + sSqlAdic + ', 0) PAGOS,' +
            '       MO_FECHARECEPCION, MO_FECHADIST, MO_FECHARECA, ' +
            '       DECODE(MO_CODIGORECEPCION, ''1'', ''DGI'', ''2'', ''MANUAL'', ''4'', ''AUTOMÁTICO'', ''5'', ''AUTOMÁTICO'') TIPO_RECEP, ' +
            '       NVL(ZBA1.BA_NOMBRE, ZBA2.BA_NOMBRE) BANCO, CB_NUMERO CUENTA, VA_NROCHEQUE VALOR, ' +
            '       TB_DESCRIPCION ESTADO_VALOR, COBRANZA.GET_PLANPAGO(VA_ID, ZMO.MO_CONTRATO) PLANPAGO, ' +
            '       ZMO.MO_USUALTA, TRUNC(ZMO.MO_FECHAALTA) FECHAALTA, CP_FECHACIERRE, MO_FECHAAPROBADO, MO_USUAPROBADO, MO_NUMEROBOLETA ' +
            '  FROM XCP_CIERREPAGO, ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA, ZCM_CODIGOMOVIMIENTO, CTB_TABLAS, ' +
            '       ZBA_BANCO ZBA1, ZBA_BANCO ZBA2, ZCB_CUENTABANCARIA, RRM_REMESA, ZVA_VALOR ' +
            ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
            '   AND MO_CONTRATO = RC_CONTRATO ' +
            '   AND RC_PERIODO =  MO_PERIODO' +
            '   AND VA_ESTADO = TB_CODIGO(+)' +
            '   AND TB_CLAVE (+)= ''ESVAL''' +
            '   AND MO_IDVALOR = VA_ID (+)' +
            '   AND VA_IDBANCO = ZBA2.BA_ID (+)' +
            '   AND MO_IDREMESA = RM_ID (+)' +
            '   AND RM_IDCUENTABANCARIA = CB_ID (+)' +
            '   AND CB_IDBANCO = ZBA1.BA_ID (+)' +
            '   AND MO_IDCIERREPAGO=CP_ID(+)';

    sSql := sSql + Get_SqlDetalle(Contrato, Cuit, sCompSaldo);

    if not edtPeriodoDesde.Periodo.IsNull then
      sSql := sSql + ' AND MO_PERIODO >= ' + SqlValue(edtPeriodoDesde.Periodo.Valor);
    if not edtPeriodoHasta.Periodo.IsNull then
      sSql := sSql + ' AND MO_PERIODO <= ' + SqlValue(edtPeriodoHasta.Periodo.Valor);

    sSql := sSql + ' ORDER BY 1';
    
    sdqConsulta.SQL.Text := sSql;
    OpenQuery( sdqConsulta );
end;


procedure TFrmEstadoCuentaEmision.tbRefrescarClick(Sender: TObject);
var
  Listado: string;
begin
  DoCargar( fraContrato.edContrato.Value, fraContrato.mskCUIT.Text);
end;

procedure TFrmEstadoCuentaEmision.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEstadoCuentaEmision.tbNominasClick(Sender: TObject);
begin

end;

{--------------------------------------------------------------------------------------------}
function TFrmEstadoCuentaEmision.Get_SqlDetalle(Contrato: Integer; Cuit, CompSaldo: String): String;
var
  sSql: string;
begin
  sSql := '';

  if chkTodosContratos.Checked then
    sSql := sSql + ' AND RC_CONTRATO IN ( SELECT CO_CONTRATO ' +
                                         '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                         ' WHERE CO_IDEMPRESA = EM_ID ' +
                                         '   AND EM_CUIT = ' + SqlValue(Cuit) + ')'
  else
    sSql := sSql + ' AND RC_CONTRATO = ' + SqlValue(Contrato);


  if not cmbFECHACONTABLE_AL.IsEmpty then
    sSql := sSql + ' AND MO_FECHADIST <= ' + SqlValue( cmbFECHACONTABLE_AL.Date );

  Result := sSql;
end;
{--------------------------------------------------------------------------------------------}

procedure TFrmEstadoCuentaEmision.chkSumatoriaClick(Sender: TObject);
begin
  inherited;
  CalcTotales;
end;
{--------------------------------------------------------------------------------------------}
procedure TFrmEstadoCuentaEmision.CalcTotales;
Var PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
        Grid.FooterBand := tbSumatoria.Down;
        if tbSumatoria.Down and sdqConsulta.Active Then
        begin
          SumFields( sdqConsulta, CAMPOS_DETALLE, TotalDetalle );
        end;
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TFrmEstadoCuentaEmision.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotales;
end;


procedure TFrmEstadoCuentaEmision.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
 iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_DETALLE);
  if (iPos > -1) and (iPos <= MAXCOLS_DETALLE) Then
    Value := '$ ' + ToStr(TotalDetalle[iPos]);
end;

procedure TFrmEstadoCuentaEmision.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
{
    if Field.AsString = vSI then
      AFont.Color := clGreen
    else if Field.AsString = vNO then
      AFont.Color := clMaroon;
}
{    if sdqConsulta.FieldByName('RC_IMPORTERECLAMADO').AsFloat > 0 then
    begin
      if not Highlight then
        Background := pnlColor0.Color;
    end
    else if sdqConsulta.FieldByName('ESCONCURSOQUIEBRA').AsString = 'S' then
    begin
      if not Highlight then
        Background := pnlColor1.Color;
    end;
}


end;

procedure TFrmEstadoCuentaEmision.tbOcultarFiltrosClick(Sender: TObject);
begin
  MostrarOcultarFiltros;
end;

procedure TFrmEstadoCuentaEmision.MostrarOcultarFiltros;
begin
  pnFiltro.Visible := tbOcultarFiltros.Down;

  if tbOcultarFiltros.Down then
    tbOcultarFiltros.ImageIndex := 11
  else
    tbOcultarFiltros.ImageIndex := 10;
end;




end.
