unit unFrmAjustePorConceptos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraStaticActividad,
  StdCtrls, ExtCtrls, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  DB, SDEngine, unArtDbFrame, unFraEmpresa, PeriodoPicker, DBClient,
  JvMemoryDataset, JvgGroupBox, Mask, ToolEdit, CurrEdit;

type
  TFrmAjustePorConceptos = class(TForm)
    Bevel1: TBevel;
    btnAceptarAjuste: TButton;
    btnCancelarAjuste: TButton;
    mdMovimientos: TJvMemoryData;
    dsMovimientos: TDataSource;
    sdqMovimientosActual: TSDQuery;
    dsMovimientosActual: TDataSource;
    gbAjuste: TGroupBox;
    Label18: TLabel;
    lblAjuste: TLabel;
    Label2: TLabel;
    lblCUIT: TLabel;
    pnContratoPeriodo: TPanel;
    fraContrato: TfraEmpresa;
    edtPeriodo: TPeriodoPicker;
    pnAjuste: TPanel;
    fraConceptoAjuste: TfraCodigoDescripcionExt;
    mObservacionConcepto: TMemo;
    GroupBox1: TGroupBox;
    dbgMovimientosAjuste: TArtDBGrid;
    gbReferenciasColores: TGroupBox;
    lblReferenciaPeriodoEstimado: TLabel;
    lblReferenciaPeriodoRecalculo: TLabel;
    Label1: TLabel;
    pnPeriodoARecalcular: TPanel;
    pn: TPanel;
    edtSaldo: TCurrencyEdit;
    mdMovimientosNro: TFloatField;
    mdMovimientosCdigo: TStringField;
    mdMovimientosMovim: TStringField;
    mdMovimientosFechaRecepcin: TDateTimeField;
    mdMovimientosFechaDistrib: TDateTimeField;
    mdMovimientosImporte: TFloatField;
    mdMovimientosFechaAprobado: TDateTimeField;
    mdMovimientosIDCODIGOMOVIMIENTO: TFloatField;

    procedure FormCreate(Sender: TObject);
    procedure btnAceptarAjusteClick(Sender: TObject);
    procedure btnCancelarAjusteClick(Sender: TObject);
    procedure edtPeriodoChange(Sender: TObject);
    procedure edtPeriodoExit(Sender: TObject);
    procedure edtPeriodoEnter(Sender: TObject);
    procedure dbgMovimientosAjusteGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
  private
    { Private declarations }
    FPeriodo : string;
    FMovimientosGenerados : Integer;
    procedure OnConceptoAjusteChange(Sender: TObject);
    procedure CalcularMovimientos;
    procedure InicializarMovimientos;
    procedure OnContratoChange(Sender: TObject);
    procedure GetCodigoDescripcionIdMovimiento(IdMovimiento: integer;
      var Codigo, Descripcion: String);
    procedure VerificarMovimientosPendientesAprobacion;
    procedure Limpiar;
    procedure CargarAjuste(AIdAjusteEfectuado: integer);
    function GetSaldoCuentaPeriodo: currency;
  public
    { Public declarations }
    procedure MostrarMovimientos(AContrato : integer; APeriodo : string);
    procedure NuevoAjustePorConcepto;
    procedure ModificarAjustePorConcepto(AIdAjusteEfectuado : integer);
    procedure MostrarDetalle(AIdAjusteEfectuado : integer);    
  end;


implementation

uses unDmPrincipal, unDmEmision, SqlFuncs, AnsiSql, unFuncionesEmision, DbFuncs, General, CustomDlgs,
  unDmSimulacion, unFrmDetalleNomina, unFrmDeclaracionesPresentadas, StrFuncs,
  unEspera, VCLExtra, unPresentacion, unConstEmision, objPeriodo;


{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.FormCreate(Sender: TObject);
begin
  with fraConceptoAjuste do
  begin
    TableName := 'EMI.iaj_ajuste';
    FieldID := 'aj_id';
    FieldCodigo := 'aj_id';
    FieldDesc := 'aj_descripcion';
    FieldBaja := 'aj_fechabaja';
    ShowBajas := false;
    ExtraCondition := ' and aj_modo = ''M'' ';
    OnChange := OnConceptoAjusteChange;
  end;

  fraContrato.ShowBajas := true;
  fraContrato.OnChange := OnContratoChange;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.OnContratoChange(Sender: TObject);
begin
  CalcularMovimientos;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.OnConceptoAjusteChange(Sender: TObject);
begin
  CalcularMovimientos;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.edtPeriodoChange(Sender: TObject);
begin
  CalcularMovimientos;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.CalcularMovimientos;
var
  Q : TSDQuery;
  ajuste : Currency;
  Codigo, Descripcion : string;
begin
  VerificarMovimientosPendientesAprobacion;
  if fraContrato.IsSelected and fraConceptoAjuste.IsSelected then
  begin
    try
      InicializarMovimientos;
      Q := GetQuery(' select * from emi.IMA_MOVIMIENTOAJUSTE ' +
                    ' where ma_idajuste = '  + fraConceptoAjuste.Codigo +
                    '   and ma_fechabaja is null');

      while not Q.Eof do
      begin
        inc(FMovimientosGenerados);
        if Q.FieldByName('MA_OPERACION').AsString = 'A' then
        begin
          ajuste := get_montoajuste(fraContrato.Contrato, edtPeriodo.Periodo.Valor,
                Q.FieldByName('MA_IDCODIGOMOVIMIENTO').AsInteger,
//                Q.FieldByName('MA_IDCODIGOREVERSION').AsInteger,
                Q.FieldByName('MA_SIGNO').AsString,
                Q.FieldByName('MA_IDCODIGOMOVIMIENTOEMPAREJA').AsInteger );
          if ajuste <> 0 then
          begin
            GetCodigoDescripcionIdMovimiento(Q.FieldByName('MA_IDCODIGOREVERSION').AsInteger,
                  Codigo, Descripcion);
            mdMovimientos.Insert;
            mdMovimientos.FieldByName('IDCODIGOMOVIMIENTO').AsInteger := Q.FieldByName('MA_IDCODIGOREVERSION').asinteger;
            mdMovimientos.FieldByName('Código').AsString := Codigo;
            mdMovimientos.FieldByName('Movim.').AsString := Descripcion;
            mdMovimientos.FieldByName('Fecha Recepción').AsDateTime := DBDate;
            mdMovimientos.FieldByName('Importe').AsCurrency := ajuste * -1;
//            mdMovimientos.FieldByName('MO_CODIGORECEPCION').AsString := '2'; 
            mdMovimientos.post;
          end;

        end else if Q.FieldByName('MA_OPERACION').AsString = 'G' then
        begin
          //FIXME... oops .. falta que aparezca el campo del monto cuando es
          //una operación de este tipo.
        end;
        Q.Next;
      end;
    finally
      Q.Free;
      GetSaldoCuentaPeriodo;      
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.InicializarMovimientos;
begin
  FMovimientosGenerados := 0;
  if fraContrato.IsSelected and Not IsEmptyString(edtPeriodo.text) then
  begin
    try
      sdqMovimientosActual.ParamByName('contrato').AsInteger := fraContrato.Contrato;
      sdqMovimientosActual.ParamByName('periodo').AsString := edtPeriodo.text;
      sdqMovimientosActual.Open;

      if mdMovimientos.Active then mdMovimientos.close;
      mdMovimientos.EmptyTable;
      mdMovimientos.LoadFromDataSet(sdqMovimientosActual,sdqMovimientosActual.RecordCount, lmCopy, true);
      mdMovimientos.Open;
    finally
      sdqMovimientosActual.Close;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.btnAceptarAjusteClick(Sender: TObject);
var
 sSql : string;
 Id   : Integer;
begin
  BeginTrans(true);
  if (FMovimientosGenerados > 0 ) and
     (MessageBox(0, '¿Confirma la aplicación de los movimientos generados?',
                    'Confirmación de Ajuste por Concepto',
                    MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = idYes) then
  begin
    try
      Id := GetSecNextVal('emi.seq_iae_id');
      EjecutarSqlST('INSERT INTO emi.iae_ajusteefectuado                                ' +
                  '(ae_id, ae_idajuste, ae_contrato, ae_periodo,                  ' +
                  ' ae_observacion, ae_usualta, ae_fechaalta) ' +
                  ' values (' +
                      SqlValue(Id)                                           + ', ' +
                      SqlValue(fraConceptoAjuste.Codigo)                     + ', ' +
                      SqlValue(fraContrato.Contrato)                         + ', ' +
                      SqlValue(edtPeriodo.Text)                              + ', ' +
                      SqlValue(mObservacionConcepto.Text)                    + ', SYS_CONTEXT (''USERENV'', ''OS_USER''), SYSDATE)');

      mdMovimientos.First;
      while not mdMovimientos.eof do
      begin
        //Si no tiene número es porque se está generando ahora.
        if mdMovimientos.FieldByName('Nro').IsNull then
        begin
          sSql := 'INSERT INTO emi.imm_movimientomanual                           ' +
                  ' (mm_id, mm_contrato, mm_periodo, mm_idcodigomovimiento,   ' +
                  '  mm_importe, mm_observaciones, mm_idajusteefectuado,      ' +
                  '  mm_usualta, mm_fechaalta)                                ' +
                  'VALUES (emi.seq_imm_id.nextval,                            ' +
                  SqlValue(fraContrato.Contrato)                            + ', ' +
                  SqlValue(edtPeriodo.Text)                                 + ', ' +
                  SqlValue(mdMovimientos.FieldByName('IDCODIGOMOVIMIENTO').AsInteger) + ', ' +
                  SqlNumber(mdMovimientos.FieldByName('Importe').AsCurrency, false) + ', ' +
                  SqlValue(mObservacionConcepto.Text)                       + ', ' +
                  SqlValue(Id)                                               +
                  ', SYS_CONTEXT (''USERENV'', ''OS_USER''), SYSDATE)';
          EjecutarSqlST(sSql);
        end;
        mdMovimientos.Next;
      end;
      mdMovimientos.Close;
      CommitTrans(True);
      close;
    Except
      Rollback(True);
      MessageDlg('Error al insertar movimientos a generar.', mtError, [mbOK], 0);
    end;
  end else
  begin
    MessageDlg('No se puede completar el ajuste ya que no se han generado movimientos.', mtWarning, [mbOK], 0);
    close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.btnCancelarAjusteClick(Sender: TObject);
begin
  close;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.MostrarMovimientos(AContrato: integer;
  APeriodo: string);
begin
  Limpiar;
  fraContrato.Contrato := AContrato;
  edtPeriodo.Text := APeriodo;
  pnContratoPeriodo.Enabled := true;
  InicializarMovimientos;
  VerificarMovimientosPendientesAprobacion;
  ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.MostrarDetalle(
  AIdAjusteEfectuado: integer);
begin
  Limpiar;
  gbAjuste.Enabled := false;
 
  CargarAjuste(AIdAjusteEfectuado);
  ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.CargarAjuste(
  AIdAjusteEfectuado: integer);
var
 Q : TSDQuery;
begin
  Q := GetQuery('SELECT IAE.AE_ID, IAE.AE_IDAJUSTE, IAE.AE_CONTRATO, IAE.AE_PERIODO,  ' +
                ' IAE.AE_OBSERVACION, IAE.AE_USUALTA, IAE.AE_FECHAALTA,               ' +
                ' IAE.AE_USUAPROBACION, IAE.AE_FECHAAPROBACION, IAE.AE_USUBAJA,       ' +
                ' IAE.AE_FECHABAJA                                                    ' +
                ' FROM EMI.IAE_AJUSTEEFECTUADO IAE WHERE AE_ID = ' + SqlValue(AIdAjusteEfectuado));
  try
    if Q.RecordCount > 0 then
    begin
      fraContrato.Contrato      := Q.FieldByName('ae_contrato').AsInteger;
      edtPeriodo.Text           := Q.FieldByName('ae_periodo').AsString;
      fraConceptoAjuste.Codigo  := Q.FieldByName('ae_idajuste').AsString;
      mObservacionConcepto.Text := Q.FieldByName('ae_observacion').AsString;
      InicializarMovimientos;
    end;
  finally
    Q.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.Limpiar;
begin
  fraContrato.Clear;
  fraConceptoAjuste.Clear;
  edtPeriodo.Text := '';
  mdMovimientos.EmptyTable;
  mObservacionConcepto.Text := '';
  FMovimientosGenerados := 0;
  edtSaldo.Value := 0;
  gbAjuste.Enabled := true;
end;
{-------------------------------------------------------------------------------}
// El evento onchange del componente se lanza cada vez que accedes a las propiedades
// text o periodo.value por lo que no sirve... :S
procedure TFrmAjustePorConceptos.edtPeriodoExit(Sender: TObject);
begin
  if FPeriodo <> edtPeriodo.text then
      CalcularMovimientos;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.edtPeriodoEnter(Sender: TObject);
begin
  FPeriodo := edtPeriodo.text;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.GetCodigoDescripcionIdMovimiento(IdMovimiento : integer; var Codigo, Descripcion : String);
var
 Q : TSDQuery;
begin
  Q := GetQuery('select cm_codigo, cm_descripcion from cob.zcm_codigomovimiento where cm_id = ' + SqlValue(IdMovimiento));
  if Q.RecordCount > 0 then
  begin
    Codigo      := Q.FieldByName('cm_codigo').AsString;
    Descripcion := Q.FieldByName('cm_descripcion').AsString;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.dbgMovimientosAjusteGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (Field.DataSet.FieldByName('Fecha Aprobado').IsNull)
//  and
//     (Field.DataSet.FieldByName('MO_CODIGORECEPCION').asstring = '2')
  then
  begin
    if Highlight then
         Background := clTeal
    else Background := $00FFB7B7;
  end;

  if Field.DataSet.FieldByName('Nro').IsNull then
  begin
    if Highlight then
         Background := clTeal
    else Background := $00E1FFFF;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.VerificarMovimientosPendientesAprobacion;
var
  Existe : boolean;
begin
  Existe := ValorSql('select 1 from emi.iae_ajusteefectuado ' +
                     ' where ae_contrato = ' + SqlValue(fraContrato.Contrato) +
                     '   and ae_periodo  = ' + SqlValue(edtPeriodo.text) +
                     '   and ae_fechaaprobacion is null ', '0') = 1;

  if Existe then
  begin
    edtPeriodo.SetFocus;
    pnAjuste.Enabled := false;    
    raise Exception.Create('El contrato-período tiene ajustes pendientes de generar.');
  end
  else
  begin
    pnAjuste.Enabled := true;
  end;

end;
{-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.ModificarAjustePorConcepto(
  AIdAjusteEfectuado: integer);
begin
  MostrarDetalle(AIdAjusteEfectuado);
  gbAjuste.Enabled           := true;
  pnContratoPeriodo.Enabled := false;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAjustePorConceptos.NuevoAjustePorConcepto;
begin
  gbAjuste.Enabled            := true;
  pnContratoPeriodo.Enabled   := true;
  Limpiar;
  ShowModal;
end;
{-------------------------------------------------------------------------------}
function TFrmAjustePorConceptos.GetSaldoCuentaPeriodo : currency;
var
 b : TBookmark;
 Total : Currency;
begin
  b := mdMovimientos.GetBookmark;

  try
    mdMovimientos.DisableControls;
    mdMovimientos.First;

    Total := 0;
    while not mdMovimientos.eof do
    begin
      Total := Total + mdMovimientos.fieldbyname('Importe').AsCurrency;
      mdMovimientos.Next;
    end;
  finally
    mdMovimientos.GotoBookmark(b);
    mdMovimientos.EnableControls;
    mdMovimientos.FreeBookmark(b);
    edtSaldo.Value := Total;
  end;

end;


end.
