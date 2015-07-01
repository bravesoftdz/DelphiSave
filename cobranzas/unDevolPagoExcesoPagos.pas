unit unDevolPagoExcesoPagos;

interface
                         
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit,
  IntEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Menus,
  unCustomGridABM, FormPanel, RxToolEdit, RxPlacemnt;

type
  TfrmDevolPagoExcesoPagos = class(TfrmCustomGridABM)
    gbNroPago: TGroupBox;
    edPE_id: TIntEdit;
    gbFechaAlta: TGroupBox;
    Label4: TLabel;
    edPE_FECHAALTADesde: TDateComboBox;
    edPE_FECHAALTAHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraPE_CONTRATO: TfraEmpresa;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbGenerarMovim: TToolButton;
    mnuImprimir: TPopupMenu;
    mnuImprimirDetallePago: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    ToolButton2: TToolButton;
    tbSumatoria: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbGenerarMovimClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirDetallePagoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
    function DoABM: Boolean; override;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('IMPORTE');

var
  frmDevolPagoExcesoPagos: TfrmDevolPagoExcesoPagos;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, General, AnsiSQL, unDmPrincipal, unArt, SqlFuncs, unSesion, DbFuncs,
  Strfuncs, unDetallePagosExcesoPagos, unRptDetallePagosExcesoPagos;

{$R *.dfm}

procedure TfrmDevolPagoExcesoPagos.ClearData;
begin
  edPE_ID.Clear;
  edPE_FECHAALTADesde.Clear;
  edPE_FECHAALTAHasta.Clear;
  fraPE_CONTRATO.Clear;

  inherited;
end;

procedure TfrmDevolPagoExcesoPagos.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT PE_ID NRO_PAGO, CO_CONTRATOPRINCIPAL CONTRATO, EM_NOMBRE NOMBRE, EM_CUIT CUIT, PE_IMPORTE IMPORTE, ' +
                 'TRUNC(PE_FECHAALTA) FECHA_PAGO, PE_FECHAMOVIMIENTO FECHA_MOVIMIENTO, CE_NUMERO CHEQUE, ' +
                 'CE_FECHACHEQUE FECHA_CHEQUE, CE_ORDENPAGO ORDEN_PAGO, TB_DESCRIPCION SITUACION_CHEQUE, ' +
                 'TRUNC(PE_FECHABAJA) FECHABAJA, PE_IDCHEQUEEMITIDO IDCHEQUEEMITIDO, PE_BENEFICIARIO BENEFICIARIO, ' +
                 'ART.AFILIACION.GET_CODREGIMENCONTRATO(PE_CONTRATO) CODREG ' +
            'FROM CTB_TABLAS, RCE_CHEQUEEMITIDO, AEM_EMPRESA, ACO_CONTRATO_EXT, ZPE_DEVOLUCIONPAGOEXCESO ' +
           'WHERE PE_CONTRATO = CO_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND PE_IDCHEQUEEMITIDO = CE_ID(+) ' +
             'AND TB_CODIGO(+) = CE_SITUACION ' +
             'AND TB_CLAVE(+) = ''SITCH''';

  sWhere := SqlBetweenDateTime(' AND PE_FECHAALTA', edPE_FECHAALTADesde.Date, edPE_FECHAALTAHasta.Date);

  if not edPE_ID.IsEmpty then
    sWhere := sWhere + ' AND PE_ID = ' + SqlValue(edPE_ID.Value);

  if not fraPE_CONTRATO.IsEmpty then
    sWhere := sWhere + ' AND PE_CONTRATO = ' + SqlValue(fraPE_CONTRATO.ContratoExt);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmDevolPagoExcesoPagos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmDevolPagoExcesoPagos.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);

  Sql.TableName := 'ZPE_DEVOLUCIONPAGOEXCESO';
  FieldBaja     := 'FECHABAJA';

  with fraPE_CONTRATO do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;
end;

procedure TfrmDevolPagoExcesoPagos.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');

  Abrir(TfrmDetallePagosExcesoPagos, frmDetallePagosExcesoPagos, tmvNormal, nil);
  frmDetallePagosExcesoPagos.IdDetallePago := sdqConsulta.FieldByName('NRO_PAGO').AsInteger;
  Abrir(TfrmDetallePagosExcesoPagos, frmDetallePagosExcesoPagos, tmvModal, nil);
end;

procedure TfrmDevolPagoExcesoPagos.tbGenerarMovimClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_MOVIMIENTO').IsNull, nil, 'Los movimientos ya han sido generados para este registro.');
  Verificar(sdqConsulta.FieldByName('CHEQUE').IsNull, nil, 'No pueden generarse movimientos si no existe cheque.');

  if MsgBox('¿Confirma la generación de los movimientos?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      try
        sSql := 'COBRANZA.DO_GENERARMOVIMIENTODEVOLUCION(:NroPago, :Usuario);';
        EjecutarStoreEx(sSql, [sdqConsulta.FieldByName('NRO_PAGO').AsInteger, Sesion.UserID]);

        MsgBox('Movimientos generados correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E: Exception do
          ErrorMsg(E, 'Error al generar los movimientos.');
      end;
    end;
end;

procedure TfrmDevolPagoExcesoPagos.GridDblClick(Sender: TObject);
begin
  tbPropiedadesClick(nil);
end;

procedure TfrmDevolPagoExcesoPagos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmDevolPagoExcesoPagos.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmDevolPagoExcesoPagos.mnuImprimirDetallePagoClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');

  TqrDetallePagosExcesoPagos.Preparar(sdqConsulta.FieldByName('NRO_PAGO').AsInteger);
end;

function TfrmDevolPagoExcesoPagos.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('PE_ID',      sdqConsulta.FieldByName('NRO_PAGO').AsInteger);
      Sql.Fields.Add('PE_FECHABAJA',   exDateTime);
      Sql.Fields.Add('PE_USUBAJA',     Sesion.UserID);
      
      Sql.SqlType := stUpdate;
    end;

   Result := inherited DoABM;
end;

procedure TfrmDevolPagoExcesoPagos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_MOVIMIENTO').IsNull, Grid, 'La fecha de movimiento debe ser nula.');
  Verificar(not sdqConsulta.FieldByName('IDCHEQUEEMITIDO').IsNull, Grid, 'La orden de pago debe ser nula.');

  inherited;
end;

procedure TfrmDevolPagoExcesoPagos.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;

end;

procedure TfrmDevolPagoExcesoPagos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmDevolPagoExcesoPagos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

end.

