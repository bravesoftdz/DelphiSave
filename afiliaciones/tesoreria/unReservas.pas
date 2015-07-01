unit unReservas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, PeriodoPicker, StdCtrls, Menus, FormPanel,
  unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmReservas = class(TfrmCustomConsulta)
    gbPeriodo: TGroupBox;
    ppPeriodo: TPeriodoPicker;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbSector: TGroupBox;
    fraSector: TfraStaticCTB_TABLAS;
    gbHolding: TGroupBox;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirCalcReservas: TMenuItem;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbGenerarTabla: TToolButton;
    ToolButton2: TToolButton;
    fpGenerarTabla: TFormPanel;
    Label1: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    ppPeriodoReserva: TPeriodoPicker;
    tbTotalesRegGrilla: TToolButton;
    fraHolding: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbGenerarTablaClick(Sender: TObject);
    procedure mnuImprimirCalcReservasClick(Sender: TObject);
  private
  public
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 6;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('MASA_ILT', 'MASA_PROM_ILT', 'ILT', 'PRIMA_IBNR', 'IBNR', 'PRIMA_IBNER',
  																						 'IBNER');

var
  frmReservas: TfrmReservas;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, unrptCalculoReservas, StrFuncs, unPrincipal;

{$R *.DFM}

procedure TfrmReservas.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;

  with fraSector do
  begin
  	Clave     := 'SECT';
    ShowBajas := True;
  end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmReservas.RefreshData;
var
  sSql: String;
begin
  Verificar(ppPeriodo.Periodo.IsNull, ppPeriodo, 'Debe ingresar un periodo.');

  sSql :=
  	'SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, AFILIACION.GET_ULTCONTRATO(EM_CUIT) CONTRATO, EM_SECTOR SECTOR,' +
    			' GE_CODIGO HOLDING, RC_MASAILT MASA_ILT, RC_MASAPROMILT MASA_PROM_ILT, RC_ILT ILT,' +
          ' RC_PRIMAIBNR PRIMA_IBNR, RC_IBNR IBNR, RC_PRIMAIBNER PRIMA_IBNER, RC_IBNER IBNER' +
     ' FROM AEM_EMPRESA, ORC_RESERVACUIT, AGE_GRUPOECONOMICO' +
    ' WHERE EM_CUIT = RC_CUIT' +
    	' AND EM_IDGRUPOECONOMICO = GE_ID(+)' +
    	' AND RC_PERIODO = ' + SqlValue(ppPeriodo.Periodo.Valor) + ' ';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND EM_CUIT = ' + SqlValue(fraEmpresa.CUIT);

  if not fraSector.IsEmpty then
    sSql := sSql + ' AND EM_SECTOR = ' + SqlValue(fraSector.Value);

  if not fraHolding.IsEmpty then
    sSql := sSql + ' AND EM_IDGRUPOECONOMICO = ' + SqlValue(fraHolding.Value);

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;
  
  inherited;
end;

procedure TfrmReservas.ClearData;
begin
  inherited;

  ppPeriodo.Clear;
  fraEmpresa.Clear;
  fraSector.Clear;
  fraHolding.Clear;

  ppPeriodo.SetFocus
end;

procedure TfrmReservas.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																			 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmReservas.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  iLoop: Integer;
begin
  inherited;

  for iLoop := 0 to MAXCOLS do
    if sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop]) is TFloatField then
      TFloatField(sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop])).Currency := True;
end;

procedure TfrmReservas.tbTotalesRegGrillaClick(Sender: TObject);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbTotalesRegGrilla.Down;
      if tbTotalesRegGrilla.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmReservas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmReservas.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmReservas.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(ppPeriodoReserva.Periodo.IsNull, ppPeriodoReserva, 'Debe ingresar el periodo.');

  try
    IniciarEspera;

    sSql := 'CONT.DO_TABLASRESERVAS(:Periodo);';
    EjecutarStoreEx(sSql, [ppPeriodoReserva.Periodo.Valor]);

    MsgBox('Proceso finalizado.', MB_OK + MB_ICONINFORMATION);

    fpGenerarTabla.ModalResult := mrOk;
  finally
    FinalizarEspera;
  end;
end;

procedure TfrmReservas.btnCancelarClick(Sender: TObject);
begin
  fpGenerarTabla.ModalResult := mrCancel;
end;

procedure TfrmReservas.tbGenerarTablaClick(Sender: TObject);
begin
  if fpGenerarTabla.ShowModal = mrOk then
    if not ppPeriodo.Periodo.IsNull then
      RefreshData;
end;

procedure TfrmReservas.mnuImprimirCalcReservasClick(Sender: TObject);
begin
  DoImprimirCalculoReservas( ppPeriodo.Periodo.Valor );
end;

end.
