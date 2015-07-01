unit unPlanDePagosDePolizas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  FormPanel, unCustomGridABM, StdCtrls, Mask, ToolEdit, DateComboBox,
  PatternEdit, IntEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unArtDBAwareFrame;

type
  TfrmPlanDePagosDePolizas = class(TfrmCustomGridABM)
    fpGeneracionCuotas: TFormPanel;
    Bevel1: TBevel;
    btnGenerar: TButton;
    btnCancelarGeneracion: TButton;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    lbFD: TLabel;
    lbFH: TLabel;
    edSM_CANTIDADCUOTAS: TIntEdit;
    Label1: TLabel;
    edSP_FECHAPAGO: TDateComboBox;
    edSP_FECHAPRESENTACION: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edSP_NUMEROCUOTA: TIntEdit;
    sdqConsultaSP_ID: TFloatField;
    sdqConsultaSP_IDSEGURO: TFloatField;
    sdqConsultaSP_NUMEROCUOTA: TFloatField;
    sdqConsultaSP_FECHAPAGO: TDateTimeField;
    sdqConsultaSP_FECHAPRESENTACION: TDateTimeField;
    sdqConsultaSP_FECHAALTA: TDateTimeField;
    sdqConsultaSP_USUALTA: TStringField;
    sdqConsultaSP_FECHAVENCIMIENTO: TDateTimeField;
    sdqConsultaEstado: TStringField;
    dlgColor: TColorDialog;
    pnlContenedor: TPanel;
    pnlPendiente: TPanel;
    pnlVenceHOY: TPanel;
    pnlPagado: TPanel;
    pnlPagoVencido: TPanel;
    pnlCuotaVencida: TPanel;
    sdqConsultaSP_VALORCUOTA: TFloatField;
    fpValorCuota: TFormPanel;
    Label5: TLabel;
    Bevel2: TBevel;
    edSP_CUOTA: TIntEdit;
    btnAceptarCuota: TButton;
    btnCancelarCuota: TButton;
    edSP_VALORCUOTA: TCurrencyEdit;
    Label6: TLabel;
    fraFormaPago: TfraCtbTablas;
    Label7: TLabel;
    Label8: TLabel;
    edNroCuenta: TEdit;
    edObservaciones: TMemo;
    Label9: TLabel;
    sdqConsultaSP_NROCUENTA: TStringField;
    sdqConsultaSP_OBSERVACIONES: TStringField;
    sdqConsultaFORMAPAGO: TStringField;
    Label10: TLabel;
    edSP_NROCUENTA: TEdit;
    fraFormaPagoABM: TfraCtbTablas;
    Label11: TLabel;
    Label12: TLabel;
    edSP_OBSERVACIONES: TMemo;
    sdqConsultaSP_FORMAPAGO: TStringField;
    sdqConsultaMES: TStringField;
    procedure fpAbmShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure CambioFechaFin(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure ElijoColor(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptarCuotaClick(Sender: TObject);
    procedure fraFormaPagocmbDescripcionChange(Sender: TObject);
    procedure fraFormaPagoABMcmbDescripcionChange(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FIDSeguro: integer;
    FPrestador: integer;
    FVigenciaHasta, FVigenciaDesde: TDateTime;
    FValorPrima :Double;
    CantCuotas :Integer;
    bEraEfectivo, bTeniaValor, bAutomatico :Boolean;
    procedure SetIDSeguro(const Value: integer);
    procedure SetPrestador(const Value: integer);
    procedure SetValorPrima(const Value: Double);
    procedure GenerarCuotas;
    function  Get_SeguroActivo(IDPrestador: integer): integer;
  protected
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  public
    PermisoModificar, PermisoAlta: boolean;
    function ShowModal(bPermisoModificar: boolean): integer; reintroduce; overload;
    property IDSeguro: integer read FIDSeguro write SetIDSeguro;
    property Prestador: integer read FPrestador write SetPrestador;
    property ValorPrima: Double read FValorPrima write SetValorPrima;
    property VigenciaHasta: TDateTime read FVigenciaHasta write FVigenciaHasta;
    property VigenciaDesde: TDateTime read FVigenciaDesde write FVigenciaDesde;    
  end;

var
  frmPlanDePagosDePolizas: TfrmPlanDePagosDePolizas;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unDmPrincipal, DateTimeFuncs, unSesion,
  unART, General, Math;

{$R *.DFM}

{ TfrmPlanDePagosDePolizas }

procedure TfrmPlanDePagosDePolizas.SetIDSeguro(const Value: integer);
begin
  FIDSeguro := Value;
  sdqConsulta.ParamByName('IDSeguro').AsInteger := Value;
  bAutomatico := (ValorSqlEx('SELECT tp_planautomatico ' +
                              ' FROM msm_seguromalapraxis, mtp_tipopoliza ' +
                             ' WHERE sm_idtipopoliza = tp_id ' +
                               ' AND sm_id = :IdSeguro', [IDSeguro]) = 'S');
end;

procedure TfrmPlanDePagosDePolizas.SetPrestador(const Value: integer);
begin
  FPrestador := Value;
  sdqConsulta.ParamByName('IDSeguro').AsInteger := Get_SeguroActivo(Value);
end;

procedure TfrmPlanDePagosDePolizas.SetValorPrima(const Value: Double);
begin
  FValorPrima := Value;
end;

function TfrmPlanDePagosDePolizas.ShowModal(bPermisoModificar: boolean): integer;
var fpResult: integer;
begin
  fpResult := 0;
  RefreshData;
  PermisoModificar := bPermisoModificar;
  if sdqConsulta.IsEmpty and PermisoAlta then
    if fpGeneracionCuotas.ShowModal = mrOk then
    begin
      GenerarCuotas;
      fpResult := mrOk;
    end
    else
      fpResult := mrCancel;
  Grid.Columns[1].Visible := bAutomatico; //solo muestro el mes si es fondo..
  Visible := False;

  if fpResult = 0 then
    Result  := inherited ShowModal
  else
    Result := fpResult;
  
end;

procedure TfrmPlanDePagosDePolizas.ClearControls;
begin
  edSP_NUMEROCUOTA.Clear;
  edSP_FECHAPAGO.Clear;
  edSP_FECHAPRESENTACION.Clear;
end;

function TfrmPlanDePagosDePolizas.DoABM: Boolean;
var
  bEsEfectivo, bEliminarActual :Boolean;
  sSql, sExtra :String;
begin
  Result          := False;
  bEliminarActual := False;
  if ModoABM = maModificacion then
  begin
  //try
    //BeginTrans(True);
    Sql.Clear;
    Sql.TableName := 'MSP_SEGUROPAGO';
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('SP_USUALTA', Sesion.UserID);
    Sql.Fields.Add('SP_FECHAALTA', SQL_ACTUALDATE, False);
    Sql.Fields.Add('SP_FORMAPAGO', fraFormaPagoABM.Codigo);
    Sql.Fields.Add('SP_NROCUENTA', edSP_NROCUENTA.Text);
    Sql.Fields.Add('SP_OBSERVACIONES', edSP_OBSERVACIONES.Lines.Text);
    Sql.Fields.Add('SP_IDSEGURO', IDSeguro, dtNumber);
    Sql.Fields.Add('SP_NUMEROCUOTA', edSP_NUMEROCUOTA.Value);
    Sql.Fields.Add('SP_FECHAPAGO', edSP_FECHAPAGO.SqlText, False);
    Sql.Fields.Add('SP_FECHAPRESENTACION', edSP_FECHAPRESENTACION.SqlText, False);
    Sql.PrimaryKey.Add('SP_ID', sdqConsulta.FieldByName('SP_ID').AsInteger, False);

    bEsEfectivo     := (fraFormaPagoABM.Especial1 = 'N');
    if (not(bTeniaValor) and not(fraFormaPagoABM.IsEmpty)) or  //si se puso un valor y antes no habia, o ...
       (bTeniaValor and fraFormaPagoABM.IsEmpty) or            //...si antes habia valor y se borró, o ...
       (bEraEfectivo and not(bEsEfectivo)) or                  //...si se cambio de efectivo a débito o viceverza, tengo que
       (not(bEraEfectivo) and bEsEfectivo) then                //actualizar las cuotas siguientes a la actual
    begin
      sSql := 'UPDATE msp_seguropago ';
      if fraFormaPagoABM.IsEmpty or bEsEfectivo then
      begin
        bEliminarActual := True;
        sSql    := sSql + ' SET sp_fechapago = Null, ' +
                              ' sp_fechapresentacion = Null, ';
        sExtra  := '';
      end
      else begin
        sSql    := sSql + ' SET sp_fechapago = sp_fechavencimiento, ' +
                              ' sp_fechapresentacion = sp_fechavencimiento, ';
        sExtra  := ' AND sp_fechapago IS NULL';
      end;
      sSql := sSql + ' sp_formapago = ' + SqlValue(fraFormaPagoABM.Codigo) + ',' +
                     ' sp_nrocuenta = ' + SqlValue(edSP_NROCUENTA.Text) +
               ' WHERE sp_idseguro = ' + SqlInt(IDSeguro) +
                 ' AND sp_numerocuota > ' + SqlInt(edSP_NUMEROCUOTA.Value) + sExtra;
      EjecutarSqlST(sSql);
    end;
    sSql := 'UPDATE msp_seguropago ' +
              ' SET sp_usualta = ' + SqlValue(Sesion.UserID) + ',' +
                  ' sp_fechaalta = actualdate, ' +
                  ' sp_fechapago = ' + SqlDate(edSP_FECHAPAGO.Date) + ',' +
                  ' sp_fechapresentacion = ' + SqlDate(edSP_FECHAPRESENTACION.Date) + ',' +
                  ' sp_observaciones = ' + SqlValue(edSP_OBSERVACIONES.Lines.Text) + ',' +
                  ' sp_formapago = ' + SqlValue(fraFormaPagoABM.Codigo) + ',' +
                  ' sp_nrocuenta = ' + SqlValue(edSP_NROCUENTA.Text) +
            ' WHERE sp_idseguro = ' + SqlInt(IDSeguro) +
              ' AND sp_numerocuota < ' + SqlInt(edSP_NUMEROCUOTA.Value) +
              ' AND sp_fechapago IS NULL ';
    EjecutarSqlST(sSql);

    if bEliminarActual then tbEliminarClick(Nil);
    Result := inherited DoABM;

  end;
    {CommitTrans(True);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al intentar actualizar las cuotas');
    end;
  end;}
end;

procedure TfrmPlanDePagosDePolizas.LoadControls;
begin
  edSP_NUMEROCUOTA.Value        := sdqConsulta.FieldByName('SP_NUMEROCUOTA').AsInteger;
  edSP_FECHAPAGO.Date           := sdqConsulta.FieldByName('SP_FECHAPAGO').AsDateTime;
  edSP_FECHAPRESENTACION.Date   := sdqConsulta.FieldByName('SP_FECHAPRESENTACION').AsDateTime;
  fraFormaPagoABM.Codigo        := sdqConsulta.FieldByName('SP_FORMAPAGO').AsString;
  edSP_NROCUENTA.Text           := sdqConsulta.FieldByName('SP_NROCUENTA').AsString;
  edSP_OBSERVACIONES.Lines.Text := sdqConsulta.FieldByName('SP_OBSERVACIONES').AsString;
  bTeniaValor   := not(fraFormaPagoABM.IsEmpty);
  bEraEfectivo  := (fraFormaPagoABM.Especial1 = 'N');
end;

function TfrmPlanDePagosDePolizas.Validar: Boolean;
begin
  Verificar(edSP_FECHAPAGO.IsEmpty, edSP_FECHAPAGO, 'Debe indicar la fecha de pago.');
  Verificar(edSP_FECHAPRESENTACION.IsEmpty, edSP_FECHAPRESENTACION, 'Debe indicar la fecha de presentación del comprobante.');
  Verificar(edSP_FECHAPAGO.Date > edSP_FECHAPRESENTACION.Date, edSP_FECHAPAGO, 'La fecha de pago no puede ser posterior a la fecha de presentación del comprobante.');
  Result := True;
end;

procedure TfrmPlanDePagosDePolizas.GenerarCuotas;
var
  sSql :String;
  Cuota :byte;
  ValorCuota :Double;
  dFechaVencimiento, dFechaPago :TDateTime;
begin
  //try
  ValorCuota  := ValorPrima / edSM_CANTIDADCUOTAS.Value;
  sSql        := 'INSERT INTO msp_seguropago ' +
                '(sp_id, sp_idseguro, sp_numerocuota, sp_fechavencimiento, ' +
                ' sp_valorcuota, sp_formapago, sp_nrocuenta, sp_observaciones, ' +
                ' sp_fechapago, sp_fechaalta, sp_usualta) VALUES (' +
                ':ID, :IDSEGURO, :CUOTA, :FECHAVTO, round(:VALORCUOTA, 2), ' +
                ':FORMAPAGO, :NROCUENTA, :OBSERVACIONES, :FECHAPAGO, ' +
                ':FECHAALTA, :USUALTA)';
  //BeginTrans;
  dFechaPago := IIF((fraFormaPago.Especial1 = 'S'), edFechaDesde.Date, 0);
  for Cuota := 0 to edSM_CANTIDADCUOTAS.Value - 1 do
  begin
    dFechaVencimiento := AddMonths(edFechaDesde.Date, Cuota);
    EjecutarSqlSTEx(sSql, [GetSecNextVal('SEQ_MSP_ID'), IDSeguro, Cuota + 1,
                         TDateTimeEx.Create(dFechaVencimiento), ValorCuota,
                         fraFormaPago.Codigo, Trim(edNroCuenta.Text),
                         Trim(edObservaciones.Lines.Text), TDateTimeEx.Create(dFechaPago),
                         TDateTimeEx.Create(DBDateTime), Sesion.UserID]);
    dFechaPago        := 0; //solo la primera cuota queda como pagada
  end;

    {CommitTrans;
  except
    Rollback(True);
    MessageDlg('Ha ocurrido un error al generar las cuotas del plan de pago.', mtError, [mbOK], 0);
  end; }
  RefreshData;
end;

procedure TfrmPlanDePagosDePolizas.fpAbmShow(Sender: TObject);
begin
  inherited;
  edSP_FECHAPRESENTACION.Date := DBDateTime;
end;

procedure TfrmPlanDePagosDePolizas.tbModificarClick(Sender: TObject);
begin
  Verificar(not PermisoModificar, nil, 'No se puede modificar el plan de pago de un seguro que no sea el activo.');
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), Grid,
            'Debe seleccionar una cuota determinada para ingresar su pago.');
  Verificar(not(sdqConsulta.FieldByName('SP_FECHAPAGO').IsNull) and
            not(Seguridad.Claves.IsActive('PermisoModificarPago')), nil,
            'Ud. no tiene permiso para modificar el pago de una cuota.');
  inherited;
end;

procedure TfrmPlanDePagosDePolizas.CambioFechaFin(Sender: TObject);
begin
//  if not((Length(edFechaDesde.Text) = 10) and edSM_CANTIDADCUOTAS.IsEmpty) then
  if edFechaDesde.IsValid and not(edSM_CANTIDADCUOTAS.IsEmpty) then
    edFechaHasta.Date := AddMonths(edFechaDesde.Date, edSM_CANTIDADCUOTAS.Value - 1);
end;

procedure TfrmPlanDePagosDePolizas.btnGenerarClick(Sender: TObject);
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe indicar la fecha de vencimiento la primera cuota.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha de vencimiento la última cuota.');
  Verificar(edFechaDesde.Date > edFechaHasta.Date, edFechaHasta,
            'La fecha del último vencimiento no puede ser anterior a la del primer vencimiento.');
  Verificar(edSM_CANTIDADCUOTAS.IsEmpty or (edSM_CANTIDADCUOTAS.Value <= 0), edSM_CANTIDADCUOTAS,
            'Debe indicar la cantidad de cuotas.');
  Verificar(GetDay(edFechaDesde.Date) <> GetDay(edFechaHasta.Date), edFechaDesde,
            'Todas las cuotas deben vencer el mismo día del mes.');
  Verificar(VigenciaHasta < edFechaHasta.Date, edFechaDesde,
            'La última cuota no puede vencer después del vencimiento de la póliza.');
  Verificar(not(bAutomatico) and (ValorPrima <= 0), btnGenerar,
            'No se ha ingresado el valor del Premio para calcular el valor de la/s cuota/s');
  fpGeneracionCuotas.ModalResult := mrOk;
end;

procedure TfrmPlanDePagosDePolizas.sdqConsultaCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if (not FieldByName('SP_FECHAPAGO').IsNull) and
       (FieldByName('SP_FECHAPAGO').AsDateTime <= FieldByName('SP_FECHAVENCIMIENTO').AsDateTime) then
      FieldByName('Estado').AsString := 'Pagado';

    if FieldByName('SP_FECHAPAGO').IsNull and (DBDateTime < FieldByName('SP_FECHAVENCIMIENTO').AsDateTime) then
      FieldByName('Estado').AsString := 'Pendiente';

    if FieldByName('SP_FECHAPAGO').IsNull and (FieldByName('SP_FECHAVENCIMIENTO').AsDateTime = FieldByName('SP_FECHAPAGO').AsDateTime) then
      FieldByName('Estado').AsString := 'Vence HOY';

    if (not FieldByName('SP_FECHAPAGO').IsNull) and (FieldByName('SP_FECHAVENCIMIENTO').AsDateTime < FieldByName('SP_FECHAPAGO').AsDateTime) then
      FieldByName('Estado').AsString := 'Pago vencido';

    if FieldByName('SP_FECHAPAGO').IsNull and (DBDateTime > FieldByName('SP_FECHAVENCIMIENTO').AsDateTime) then
      FieldByName('Estado').AsString := 'Cuota vencida';
  end;

  inherited;
end;

procedure TfrmPlanDePagosDePolizas.ElijoColor(Sender: TObject);
begin
  dlgColor.Color := (Sender as TPanel).Color;
  if dlgColor.Execute then (Sender as TPanel).Color := dlgColor.Color;
end;

procedure TfrmPlanDePagosDePolizas.tbEliminarClick(Sender: TObject);
const
  sSQL = 'UPDATE msp_seguropago SET sp_fechapago = null, sp_fechapresentacion = null WHERE sp_id = :ID';
begin
  Verificar(not(sdqConsulta.FieldByName('SP_FECHAPAGO').IsNull) and
            not(Seguridad.Claves.IsActive('PermisoAnularPago')), nil,
            'Ud. no tiene permiso para anular el pago de una cuota.');
  if InTransaction then
    EjecutarSqlSTEx(sSQL, [sdqConsulta.FieldByName('SP_ID').AsInteger])
  else
    EjecutarSqlEx(sSQL, [sdqConsulta.FieldByName('SP_ID').AsInteger]);
  RefreshData;
end;

procedure TfrmPlanDePagosDePolizas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then
    AFont.Color := clDkGray
  else
    AFont.Color := clBlack;

  with Field.DataSet do
  begin
    if FieldByName('Estado').AsString = 'Pagado' then
      Background := pnlPagado.Color;

    if Field.DataSet.FieldByName('Estado').AsString = 'Pendiente' then
      Background := pnlPendiente.Color;

    if Field.DataSet.FieldByName('Estado').AsString = 'Vence HOY' then
      Background := pnlVenceHOY.Color;

    if Field.DataSet.FieldByName('Estado').AsString = 'Pago vencido' then
      Background := pnlPagoVencido.Color;

    if Field.DataSet.FieldByName('Estado').AsString = 'Cuota vencida' then
      Background := pnlCuotaVencida.Color;
  end;

  inherited;
end;

function TfrmPlanDePagosDePolizas.Get_SeguroActivo(IDPrestador: integer): integer;
begin
  Result := ValorSQLIntegerEx(SqlSimpleQuery('Siniestro.Get_SeguroMalaPraxisActivo(:Prestador)'), [IDPrestador]);
  if Result = 0 then
  begin
    MsgBox('El prestador indicado no posee seguro de mala praxis registrado en nuestro sistema.');
    PermisoAlta := False; // No puede dar de alta el seguro al cargar una factura cualquiera.
  end;
end;

procedure TfrmPlanDePagosDePolizas.FormCreate(Sender: TObject);
begin
  inherited;
  PermisoAlta             := True;
  PermisoModificar        := False;
  fraFormaPago.Clave      := 'FPAGO';
  fraFormaPago.ShowBajas  := False;
  fraFormaPagoABM.Clave   := 'FPAGO';
end;

procedure TfrmPlanDePagosDePolizas.tbPropiedadesClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(Seguridad.Claves.IsActive('PermisoModificarCuota')), nil,
            'Ud. no tiene permiso para modificar el valor de una cuota.');
  Verificar(not PermisoModificar, nil, 'No se puede modificar el plan de pago de un seguro que no sea el activo.');
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), Grid,
            'Debe seleccionar una cuota determinada para ingresar su pago.');
  sSql        := 'SELECT count(*) FROM msp_seguropago ' +
                 ' WHERE sp_idseguro = :IdSeguro ' +
                   ' AND sp_fechapago IS NULL';
  CantCuotas  := ValorSqlIntegerEx(sSql, [IDSeguro]);
  Verificar((CantCuotas <= 1), nil, 'No se puede modificar el valor cuando la cuota que no está pagada es única.');
  Verificar(not sdqConsultaSP_FECHAPAGO.IsNull, nil, 'No se puede modificar el valor de una cuota pagada.');
  edSP_CUOTA.Value      := sdqConsulta.FieldByName('SP_NUMEROCUOTA').AsInteger;
  edSP_VALORCUOTA.Value := sdqConsulta.FieldByName('SP_VALORCUOTA').AsCurrency;
  if fpValorCuota.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmPlanDePagosDePolizas.btnAceptarCuotaClick(Sender: TObject);
var
  sSql :String;
  ValOtrasCuotas, ValCuotasPagas :Double;
begin
  Verificar((ValorPrima <= 0), btnAceptarCuota, 'No se ha ingresado el valor del Premio para calcular el valor de la/s cuota/s');
  Verificar((edSP_VALORCUOTA.Value <= 0), edSP_VALORCUOTA, 'Debe indicar el valor de la cuota');
  Verificar(edSP_VALORCUOTA.Value > ValorPrima, edSP_VALORCUOTA, 'El valor de la cuota no puede ser mayor que el del premio');
  //calculo el valor de las cuotas pagadas
  sSql := 'SELECT SUM(sp_valorcuota) ' +
           ' FROM msp_seguropago ' +
          ' WHERE sp_idseguro = ' + SqlInt(IDSeguro) +
            ' AND sp_fechapago IS NOT NULL';
  ValCuotasPagas := ValorSqlExtended(sSql); //no debo tener en cuenta las cuotas pagadas
  Verificar(ValorPrima < (edSP_VALORCUOTA.Value + ValCuotasPagas), edSP_VALORCUOTA,
            'El valor de la cuota más el valor de las cuotas pagadas no puede superar el valor de la premio');
  try
    BeginTrans;
    //le pongo el nuevo valor a la cuota que esta cambiando....
    sSql := 'UPDATE msp_seguropago ' +
              ' SET sp_valorcuota = ' + SqlNumber(edSP_VALORCUOTA.Value) +
            ' WHERE sp_idseguro = ' + SqlInt(IDSeguro) +
              ' AND sp_numerocuota =  ' + SqlInt(edSP_CUOTA.Value);
    EjecutarSqlST(sSql);
    //...y a las demas le pongo el resto sin tener en cuenta las cuotas pagadas
    ValOtrasCuotas := (ValorPrima - edSP_VALORCUOTA.Value - ValCuotasPagas) / (CantCuotas - 1);
    sSql := 'UPDATE msp_seguropago ' +
              ' SET sp_valorcuota = ' + SqlNumber(ValOtrasCuotas) +
            ' WHERE sp_idseguro = ' + SqlInt(IDSeguro) +
              ' AND sp_numerocuota <>  ' + SqlInt(edSP_CUOTA.Value) +
              ' AND sp_fechapago IS NULL';
    EjecutarSqlST(sSql);
    CommitTrans;
    fpValorCuota.ModalResult := mrOk;
  except
    on E: Exception do begin
       Rollback;
       ErrorMsg(E);
    end;
  end;
end;

procedure TfrmPlanDePagosDePolizas.fraFormaPagocmbDescripcionChange(Sender: TObject);
begin
  if (fraFormaPago.Especial1 = 'S') then
    edNroCuenta.Enabled := True
  else begin
    edNroCuenta.Clear;
    edNroCuenta.Enabled := False;
  end;
end;

procedure TfrmPlanDePagosDePolizas.fraFormaPagoABMcmbDescripcionChange(Sender: TObject);
begin
  if (fraFormaPagoABM.Especial1 = 'S') then
    edSP_NROCUENTA.Enabled := True
  else begin
    edSP_NROCUENTA.Clear;
    edSP_NROCUENTA.Enabled := False;
  end;
end;

procedure TfrmPlanDePagosDePolizas.tbRefrescarClick(Sender: TObject);
begin
  sdqconsulta.SQL.Text := sdqconsulta.SQL.Text + SortDialog.OrderBy; 
  inherited;
end;


end.
