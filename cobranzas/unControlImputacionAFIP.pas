unit unControlImputacionAFIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, PeriodoPicker, PatternEdit, CardinalEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmControlImputacionAFIP = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraMO_CONTRATO: TfraEmpresa;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    edMO_PERIODODesde: TPeriodoPicker;
    edMO_PERIODOHasta: TPeriodoPicker;
    gbFechaRecaudacion: TGroupBox;
    Label4: TLabel;
    cmbMO_FECHARECADesde: TDateComboBox;
    cmbMO_FECHARECAHasta: TDateComboBox;
    gbFechaContable: TGroupBox;
    Label2: TLabel;
    cmbMO_FECHADISTDesde: TDateComboBox;
    cmbMO_FECHADISTHasta: TDateComboBox;
    gbFechaRecepcion: TGroupBox;
    Label5: TLabel;
    cmbMO_FECHARECEPCIONDesde: TDateComboBox;
    cmbMO_FECHARECEPCIONHasta: TDateComboBox;
    gbFechaRemesa: TGroupBox;
    Label6: TLabel;
    cmbRM_FECHADesde: TDateComboBox;
    cmbRM_FECHAHasta: TDateComboBox;
    rgOperacion: TRadioGroup;
    rgFinanza: TRadioGroup;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    ShortCutControl1: TShortCutControl;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure QueryPrintReportBegin(Sender: TObject);
  private
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

var
  frmControlImputacionAFIP: TfrmControlImputacionAFIP;

const
  MAXCOLS = 1;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('PAGOS', 'DEVENGADOS');

  SQL_BASE =
    'SELECT ZMO.MO_CONTRATOPRINCIPAL CONTRATO, ZMO.MO_PERIODO PERIODO, CM_CODIGO, CM_DESCRIPCION,' +
          ' DECODE (CM_OPERACION, ''E'', MO_IMPORTE, 0 ) DEVENGADOS,' +
          ' DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE, 0) PAGOS, MO_FECHARECEPCION, MO_FECHADIST,' +
          ' MO_FECHARECA, MO_CODTIPOREGIMEN CODREG,' +
          ' DECODE (MO_CODIGORECEPCION, ''1'', ''DGI'', ''2'', ''MANUAL'', ''4'', ''AUTOMÁTICO'', ''5'', ''AUTOMÁTICO'') TIPO_RECEP,' +
          ' ZBA.BA_NOMBRE BANCO, ZCBREMESA.CB_NUMERO CUENTA, ZMO.MO_USUALTA, TRUNC (ZMO.MO_FECHAALTA) FECHAALTA,' +
          ' MO_FECHAAPROBADO, MO_USUAPROBADO, MO_NUMEROBOLETA, RC_PERIODONOMINA DDJJ, EM_NOMBRE RAZONSOCIAL,' +
          ' AFEST.TB_DESCRIPCION ESTADO, CO_FECHABAJA FECHABAJA, DECODE(RC_IMPORTERECLAMADO, 0, ''N'', ''S'') RECLAMO,' +
          ' MOTIB.TB_DESCRIPCION MOTIVOBAJA, SECTOR.TB_DESCRIPCION DESCRSECTOR ' +
     ' FROM CTB_TABLAS SECTOR, CTB_TABLAS MOTIB, CTB_TABLAS AFEST, AEM_EMPRESA, ACO_CONTRATO_EXT, ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA_EXT,' +
          ' ZCM_CODIGOMOVIMIENTO, ZBA_BANCO ZBA, ZCB_CUENTABANCARIA ZCBREMESA, RRM_REMESA' +
    ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
      ' AND MO_CONTRATO = RC_CONTRATO' +
      ' AND RC_PERIODO = MO_PERIODO' +
      ' AND MO_IDREMESA = RM_ID' +
      ' AND RM_IDCUENTABANCARIA = ZCBREMESA.CB_ID' +
      ' AND ZCBREMESA.CB_IDBANCO = ZBA.BA_ID' +
      ' AND CM_OPERACION IN (''C'', ''R'', ''E'')' +
      ' AND MO_CODIGORECEPCION = ''1''' +
      ' AND CB_RECAUDADORAAFIP = ''S''' +
      ' AND RC_CONTRATO = CO_CONTRATO' +
      ' AND CO_IDEMPRESA = EM_ID' +
      ' AND AFEST.TB_CLAVE  = ''AFEST''' +
      ' AND AFEST.TB_CODIGO = CO_ESTADO' +
      ' AND MOTIB.TB_CLAVE(+)  = ''MOTIB''' +
      ' AND MOTIB.TB_CODIGO(+) = CO_MOTIVOBAJA ' +
      ' AND SECTOR.TB_CLAVE = ''SECT'' ' +
      ' AND SECTOR.TB_CODIGO = EM_SECTOR ';

implementation

uses
  unFiltros, DbFuncs, CustomDlgs, Numeros, General, StrFuncs, SQLFuncs, unSesion;

var
  TotalConsulta: Array of Extended;

{$R *.DFM}

procedure TfrmControlImputacionAFIP.ClearData;
begin
  inherited;
  
  fraMO_CONTRATO.Clear;
  edMO_PERIODODesde.Clear;
  edMO_PERIODOHasta.Clear;
  cmbMO_FECHADISTDesde.Clear;
  cmbMO_FECHADISTHasta.Clear;
  cmbMO_FECHARECADesde.Clear;
  cmbMO_FECHARECAHasta.Clear;
  cmbMO_FECHARECEPCIONDesde.Clear;
  cmbMO_FECHARECEPCIONHasta.Clear;
  cmbRM_FECHADesde.Clear;
  cmbRM_FECHAHasta.Clear;
  edTotalRegistros.Clear;
  rgFinanza.ItemIndex := 0;
  rgOperacion.ItemIndex := 0;
end;

procedure TfrmControlImputacionAFIP.RefreshData;
var
  sSQL: String;
begin
  sSQL := SQL_BASE;
  case rgOperacion.ItemIndex of
    0:  ;//Nada
    1:  AddCondition(sSQL, ' CM_OPERACION = ''E''');
    2:  AddCondition(sSQL, ' CM_OPERACION IN (''C'', ''R'')');
  end;

  case rgFinanza.ItemIndex of
    0:  ;//Nada
    1:  AddCondition(sSQL, ' ((DECODE (CM_OPERACION, ''E'', MO_IMPORTE, 0) > 0) OR ' +
                            ' (DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE, 0) < 0))');
    2:  AddCondition(sSQL, ' ((DECODE (CM_OPERACION, ''E'', MO_IMPORTE, 0) < 0) OR ' +
                            ' (DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE, 0) > 0))');
  end;

  if Sesion.Sector = 'LEGAL' then
  begin
    AddCondition(sSQL, ' CO_FECHABAJA IS NOT NULL');
    AddCondition(sSQL, ' CO_IDESTUDIO IS NOT NULL');
  end;

  sdqConsulta.SQL.Text := sSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmControlImputacionAFIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('DEVENGADOS')).Currency := True;
  TFloatField(DataSet.FieldByName('PAGOS')).Currency      := True;
end;

procedure TfrmControlImputacionAFIP.FormCreate(Sender: TObject);
begin
  inherited;

  with fraMO_CONTRATO do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmControlImputacionAFIP.tbPropiedadesClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbPropiedades.Down;
end;

procedure TfrmControlImputacionAFIP.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbPropiedades.Down;
      if tbPropiedades.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmControlImputacionAFIP.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));
end;

procedure TfrmControlImputacionAFIP.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['PAGOS'];
  if Assigned(AField) then
    begin
      QueryPrint.Fields[0].TotalType := ttCustom;
      AField.TotalType   := ttAutoSum;
      AField.FormatFloat := '$ #,##0.00';
    end;

  AField := QueryPrint.FieldByName['DEVENGADOS'];
  if Assigned(AField) then
    begin
      AField.TotalType   := ttAutoSum;
      AField.FormatFloat := '$ #,##0.00';
    end;
end;

end.
