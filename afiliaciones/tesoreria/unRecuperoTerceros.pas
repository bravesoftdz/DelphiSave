unit unRecuperoTerceros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, SinEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmRecuperoTerceros = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbFecha: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbHolding: TGroupBox;
    fraHolding: TfraCodDesc;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
  public
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmRecuperoTerceros: TfrmRecuperoTerceros;
  TotalConsulta: Array of Extended;

implementation

{$R *.dfm}

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, StrFuncs;

procedure TfrmRecuperoTerceros.ClearData;
begin
  inherited;

  fraEmpresa.Clear;
  fraHolding.Clear;
  edSiniestro.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

procedure TfrmRecuperoTerceros.RefreshData;
var
  sSqlWhere, sSql: String;
begin
  sSql := 'SELECT RV_FECHA FECHARECIBO, TO_CHAR(RV_SERIE, ''FM0999'') || ''-'' || TO_CHAR(RV_NUMERO, ''FM09999999'') NRORECIBO, ' +
                 'RS_SINIESTRO SINIESTRO, RS_ORDEN ORDEN, EM_CUIT CUIT, EM_NOMBRE EMPRESA, CO_CONTRATO CONTRATO, ' +
                 'TJ_CUIL CUIL, TJ_NOMBRE TRABAJADOR, TV_DESCRIPCION TIPO, XV_IMPORTE IMPORTE, VA_NROCHEQUE NROCHEQUE, ' +
                 'VA_VENCIMIENTO VENCIMIENTOCHEQUE, EST.TB_DESCRIPCION ESTADO, MRECH.TB_DESCRIPCION MOTIVORECHAZO, ' +
                 'XP_ID NROPLAN, XC_NROCUOTA NROCUOTA, GE_DESCRIPCION GRUPOECONOMICO ' +
            'FROM AGE_GRUPOECONOMICO, AEM_EMPRESA, ACO_CONTRATO, CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ' +
                 'ART.LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN, LXC_RECUPEROCUOTA, RRV_RECIBOVALOR, LXV_RECUPEROVALOR, ' +
                 'ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR, ART.CTB_TABLAS EST, ART.CTB_TABLAS MRECH ' +
           'WHERE XC_ID = XV_IDCUOTA ' +
             'AND XP_ID = XC_IDPLANPAGO ' +
             'AND RS_ID = XP_IDRECUPEROSINIESTRO ' +
             'AND TJ_ID = EX_IDTRABAJADOR ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND EM_IDGRUPOECONOMICO = GE_ID(+) ' +
             'AND CO_CONTRATO = EX_CONTRATO ' +
             'AND EX_SINIESTRO = RS_SINIESTRO ' +
             'AND EX_ORDEN = RS_ORDEN ' +
             'AND EX_RECAIDA = 0 ' +
             'AND VA_IDBANCO = BA_ID(+) ' +
             'AND VA_IDTIPOVALOR = TV_ID ' +
             'AND MRECH.TB_CLAVE(+) = ''MRECH'' ' +
             'AND VA_MOTIVORECHAZO = MRECH.TB_CODIGO(+) ' +
             'AND EST.TB_CLAVE = ''ESVAL'' ' +
             'AND VA_ESTADO = EST.TB_CODIGO ' +
             'AND VA_ID = XV_IDVALOR ' +
             'AND XV_IDRECIBO = RV_ID ' +
             'AND XV_FECHABAJA IS NULL';

  sSqlWhere := SqlBetweenDateTime(' AND RV_FECHA ', edFechaDesde.Date, edFechaHasta.Date);

  if not fraEmpresa.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  if not fraHolding.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND GE_ID = ' + SqlValue(fraHolding.Value);

  if not edSiniestro.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND RS_SINIESTRO = ' + SqlValue(edSiniestro.Siniestro) +
                             ' AND RS_ORDEN = ' + SqlValue(edSiniestro.Orden);

  sdqConsulta.Sql.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmRecuperoTerceros.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);

  fraHolding.ShowBajas := True;
  fraEmpresa.ShowBajas := True;
end;

procedure TfrmRecuperoTerceros.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmRecuperoTerceros.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmRecuperoTerceros.tbSumatoriaClick(Sender: TObject);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

end.
 