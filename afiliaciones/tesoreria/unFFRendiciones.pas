unit unFFRendiciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Vcl.Mask, RxToolEdit, DateComboBox, PatternEdit,
  IntEdit, unArt, unFraCodDesc, unfraCtbTablas;

type
  TfrmFFRendiciones = class(TfrmCustomGridABM)
    rgTipoBusq: TRadioGroup;
    ShortCutControl1: TShortCutControl;
    gbFechaEnvio: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edFechaDesdeBusq: TDateComboBox;
    edFechaHastaBusq: TDateComboBox;
    GroupBox1: TGroupBox;
    fraSectorBusq: TfraCodigoDescripcion;
    rgCerradoBusq: TRadioGroup;
    rgRecibidoBusq: TRadioGroup;
    rgAprobado: TRadioGroup;
    chkNoMostrarBajas: TCheckBox;
    fraFondoFijoAltaModif: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    edNumeroAltaModif: TIntEdit;
    Label3: TLabel;
    edFechaAltaModif: TDateComboBox;
    tbSalir2: TToolButton;
    tbDetalle: TToolButton;
    ToolButton2: TToolButton;
    tbRecepcion: TToolButton;
    tbAprobar: TToolButton;
    fpAprobar: TFormPanel;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btnAceptarAprobar: TButton;
    btnCancelarAprobar: TButton;
    fraFormaPagoAltaModif: TfraCtbTablas;
    fraBancoAltaModif: TfraCodigoDescripcion;
    edChequeNombreAltaModif: TEdit;
    Label9: TLabel;
    fraSucursalAltaModif: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraFondoFijoAltaModifChange(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure tbRecepcionClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure fpAprobarEnter(Sender: TObject);
    procedure btnAceptarAprobarClick(Sender: TObject);
    procedure fraBancoAltaModifChange(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    function GetUltNroRendicion(IdFondoFijo: TTableId): Integer;
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmFFRendiciones: TfrmFFRendiciones;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, StrFuncs,
  DateTimeFuncs, unFFDetalleRendicion;

{$R *.dfm}

procedure TfrmFFRendiciones.btnAceptarAprobarClick(Sender: TObject);
begin
  Verificar(fraFormaPagoAltaModif.IsEmpty, fraFormaPagoAltaModif, 'Debe ingresar la forma de pago.');
  Verificar(fraBancoAltaModif.IsEmpty, fraBancoAltaModif, 'Debe ingresar el banco.');
  Verificar(IsEmptyString(edChequeNombreAltaModif.Text), edChequeNombreAltaModif, 'Debe ingresar el cheque a nombre.');

  with Sql do
    begin
      Clear;

      PrimaryKey.Add('FR_ID',             sdqConsulta.FieldByName('ID').AsInteger);
      Fields.Add('FR_FECHAAPROBADO',      exDateTime);
      Fields.Add('FR_USUAPROBADO',        Sesion.UserID);
      Fields.Add('FR_METODOPAGO',         fraFormaPagoAltaModif.Value);
      Fields.Add('FR_IDBANCO',            fraBancoAltaModif.Value);
      Fields.Add('FR_IDSUCURSAL',         fraSucursalAltaModif.Value, True);
      Fields.Add('FR_CHEQUENOMBRE',       Trim(edChequeNombreAltaModif.Text));

      SqlType := stUpdate;
      EjecutarSql(Sql)
    end;

  fpAprobar.ModalResult := mrOk;
end;

procedure TfrmFFRendiciones.ClearControls;
begin
  fraFondoFijoAltaModif.Clear;
  edNumeroAltaModif.Clear;
  edFechaAltaModif.Date := DBDate();

  VCLExtra.LockControls([edNumeroAltaModif, edFechaAltaModif]);
end;

function TfrmFFRendiciones.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('FR_ID',            sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('FR_FECHABAJA',         exDateTime);
           Fields.Add('FR_USUBAJA',           Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddInteger('FR_ID',  GetSecNextVal('CONT.SEQ_OFR_ID'));
              Fields.Add('FR_FECHAALTA',      exDateTime);
              Fields.Add('FR_USUALTA',        Sesion.UserID);
              Fields.Add('FR_IDFONDOFIJO',    fraFondoFijoAltaModif.Value);
              Fields.Add('FR_NUMERO',         edNumeroAltaModif.Value);
              Fields.Add('FR_FECHA',          edFechaAltaModif.Date);

              SqlType := stInsert;
            end;
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmFFRendiciones.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := False;
  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OFR_RENDICION';

  with fraSectorBusq do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraFondoFijoAltaModif do
    begin
      TableName      := 'OFF_FONDOFIJO';
      FieldID        := 'FF_ID';
      FieldCodigo    := 'FF_ID';
      FieldDesc      := 'FF_DESCRIPCION';
      FieldBaja      := 'FF_FECHABAJA';
      ExtraCondition := 'AND FF_SECTOR = ' + SqlValue(Sesion.Sector);
      OnChange       := fraFondoFijoAltaModifChange;
      ShowBajas      := False;
    end;

  with fraFormaPagoAltaModif do
    begin
      Clave     := 'COBRO';
      ShowBajas := False;
    end;

  with fraBancoAltaModif do
    begin
      TableName      := 'ZBA_BANCO';
      FieldID        := 'BA_ID';
      FieldCodigo    := 'BA_CODIGO';
      FieldDesc      := 'BA_NOMBRE';
      FieldBaja      := 'BA_FECHABAJA';
      ExtraCondition := 'AND (BA_GIRO = ''S'' OR BA_TRANSFERENCIA = ''S'' OR BA_DEPOSITOCUENTA = ''S'' OR BA_CHEQUE = ''S'' OR BA_PAGOELECTRONICO = ''S'')';
      ShowBajas      := False;
      OnChange       := fraBancoAltaModifChange;
    end;

  with fraSucursalAltaModif do
    begin
      TableName      := 'ZSB_SUCURSALBANCO';
      FieldID        := 'SB_ID';
      FieldCodigo    := 'SB_CODIGO';
      FieldDesc      := 'SB_NOMBRE';
      FieldBaja      := 'SB_FECHABAJA';
      ExtraCondition := ' AND 1 = 2 ';
    end;

  if not Seguridad.Claves.IsActive('PermitirFiltrarTodosSectores') then
    begin
      fraSectorBusq.Codigo := Sesion.Sector;
      VCLExtra.LockControl(fraSectorBusq);
    end;
end;

function TfrmFFRendiciones.GetUltNroRendicion(IdFondoFijo: TTableId): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT NVL(MAX(FR_NUMERO), 0) ' +
            'FROM OFR_RENDICION ' +
           'WHERE FR_IDFONDOFIJO = :Id ' +
             'AND FR_FECHABAJA IS NULL';
  Result := ValorSqlIntegerEx(sSql, [IdFondoFijo]);
end;

procedure TfrmFFRendiciones.fpAprobarEnter(Sender: TObject);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT FM_METODOPAGO METODOPAGO, FM_IDBANCO IDBANCO, FM_CHEQUENOMBRE CHEQUENOMBRE, ' +
                 'FM_IDSUCURSAL IDSUCURSAL ' +
            'FROM OFR_RENDICION, OFM_FFMONTO ' +
           'WHERE FM_IDFONDOFIJO = FR_IDFONDOFIJO ' +
             'AND FM_FECHABAJA IS NULL ' +
             'AND FR_FECHABAJA IS NULL ' +
             'AND FR_ID = ' + SqlValue(sdqConsulta.FieldByName('ID').AsInteger);

  SqlResults := ValoresColSql(sSql);
  try
    fraFormaPagoAltaModif.Codigo := SqlResults[0];
    fraBancoAltaModif.Value      := StrToIntDef(SqlResults[1], ART_EMPTY_ID);
    fraBancoAltaModifChange(nil);
    edChequeNombreAltaModif.Text := SqlResults[2];
    fraSucursalAltaModif.Value   := StrToIntDef(SqlResults[3], ART_EMPTY_ID);

  finally
    SqlResults.Free;
  end;
end;

procedure TfrmFFRendiciones.fraBancoAltaModifChange(Sender: TObject);
begin
  if fraBancoAltaModif.IsSelected then
    begin
      fraSucursalAltaModif.ExtraCondition := ' AND SB_IDBANCO = ' + SqlValue(fraBancoAltaModif.Value);
      fraSucursalAltaModif.Clear;
    end;
end;

procedure TfrmFFRendiciones.fraFondoFijoAltaModifChange(Sender: TObject);
begin
  if fraFondoFijoAltaModif.IsSelected then
    edNumeroAltaModif.Value := GetUltNroRendicion(fraFondoFijoAltaModif.Value) + 1
  else
    edNumeroAltaModif.Clear;
end;

procedure TfrmFFRendiciones.LoadControls;
begin
 // inherited;
end;

procedure TfrmFFRendiciones.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT CASE FF_TIPO WHEN ''S'' THEN ''Siniestros'' WHEN ''G'' THEN ''Gastos'' END TIPO, ' +
                 'FF_DESCRIPCION DESCRIPCION, SC_DESCRIPCION SECTOR, FR_FECHA FECHA, ' +
                 'FR_NUMERO NUMERO, TRUNC(FR_FECHACIERRE) FECHA_CIERRE, ' +
                 'TRUNC(FR_FECHARECEPCION) FECHA_RECEPCION, TRUNC(FR_FECHAAPROBADO) FECHA_APROBADO, ' +
                 'FR_CHEQUENOMBRE BENEFICIARIO, TB_DESCRIPCION METODO_PAGO, ' +
                 'BA_NOMBRE BANCO, TRUNC(FR_FECHABAJA) FECHA_BAJA, FR_ID ID, SB_NOMBRE NOMSUCURSAL, ' +
                 'NVL(IMPORTE_TOTAL, 0) IMPORTE_TOTAL, NVL(IMPORTE_APROBADO, 0) IMPORTE_APROBADO ' +
            'FROM (SELECT FD_IDRENDICION, SUM(FD_IMPORTE) IMPORTE_TOTAL, ' +
                         'SUM( DECODE(FD_APROBADO, ''S'', FD_IMPORTE, 0)) IMPORTE_APROBADO ' +
                    'FROM OFD_RENDICIONDETALLE ' +
                   'WHERE FD_FECHABAJA IS NULL ' +
                   'GROUP BY FD_IDRENDICION), ' +
                 'OFR_RENDICION, OFF_FONDOFIJO, USC_SECTORES, CTB_TABLAS, ZSB_SUCURSALBANCO, ZBA_BANCO ' +
           'WHERE SC_CODIGO = FF_SECTOR ' +
             'AND FF_ID = FR_IDFONDOFIJO ' +
             'AND FR_ID = FD_IDRENDICION(+) ' +
             'AND TB_CODIGO(+) = FR_METODOPAGO ' +
             'AND TB_CLAVE(+) = ''COBRO'' ' +
             'AND BA_ID(+) = FR_IDBANCO ' +
             'AND SB_ID(+) = FR_IDSUCURSAL';

  sWhere := SqlBetweenDateTime(' AND FR_FECHA', edFechaDesdeBusq.Date, edFechaHastaBusq.Date);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FR_FECHABAJA IS NULL';

  case rgTipoBusq.ItemIndex of
    1: sWhere := sWhere + ' AND FF_TIPO = ''G''';
    2: sWhere := sWhere + ' AND FF_TIPO = ''S''';
  end;

  case rgCerradoBusq.ItemIndex of
    1: sWhere := sWhere + ' AND FR_FECHACIERRE IS NOT NULL';
    2: sWhere := sWhere + ' AND FR_FECHACIERRE IS NULL';
  end;

  case rgRecibidoBusq.ItemIndex of
    1: sWhere := sWhere + ' AND FR_FECHARECEPCION IS NOT NULL';
    2: sWhere := sWhere + ' AND FR_FECHARECEPCION IS NULL';
  end;

  case rgAprobado.ItemIndex of
    1: sWhere := sWhere + ' AND FR_FECHAAPROBADO IS NOT NULL';
    2: sWhere := sWhere + ' AND FR_FECHAAPROBADO IS NULL';
  end;

  if fraSectorBusq.IsSelected then
    sWhere := sWhere + ' AND SC_CODIGO = ' + SqlValue(fraSectorBusq.Codigo);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmFFRendiciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE_TOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE_TOTAL')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTE_APROBADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE_APROBADO')).Currency := True;
end;

procedure TfrmFFRendiciones.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro no se encuentra cerrado.');
  Verificar(sdqConsulta.FieldByName('FECHA_RECEPCION').IsNull, nil, 'El registro no ha sido recibido.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro ya se encuentra dado aprobado.');

  sSql := 'SELECT 1 ' +
            'FROM OFD_RENDICIONDETALLE ' +
           'WHERE FD_FECHABAJA IS NULL ' +
             'AND FD_APROBADO IS NULL ' +
             'AND FD_IDRENDICION = :IdRendicion';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ID').AsInteger]), nil, 'Existen comprobantes del detalle de la rendición pendientes de aprobar.');

  if fpAprobar.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmFFRendiciones.tbDetalleClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');

  with TfrmFFDetalleRendicion.Create(nil) do
    try
      IdRendicion := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmFFRendiciones.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ya se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro se encuentra cerrado.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro se encuentra aprobado.');

  inherited;
end;

procedure TfrmFFRendiciones.tbLimpiarClick(Sender: TObject);
begin
  rgTipoBusq.ItemIndex     := 0;   // Todos
  rgCerradoBusq.ItemIndex  := 0;   // Todos
  rgRecibidoBusq.ItemIndex := 0;   // Todos
  rgAprobado.ItemIndex     := 0;   // Todos
  fraSectorBusq.Clear;
  edFechaDesdeBusq.Clear;
  edFechaHastaBusq.Clear;

  inherited;
end;

procedure TfrmFFRendiciones.tbPropiedadesClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro ya se encuentra cerrado.');

  sSql := 'SELECT 1 ' +
            'FROM OFD_RENDICIONDETALLE, OFR_RENDICION, OFM_FFMONTO ' +
           'WHERE FR_ID = FD_IDRENDICION ' +
             'AND FM_IDFONDOFIJO = FR_IDFONDOFIJO ' +
             'AND FM_FECHABAJA IS NULL ' +
             'AND FR_FECHA BETWEEN FM_FECHADESDE AND NVL(FM_FECHAHASTA, SYSDATE + 1) ' +
             'AND FD_FECHABAJA IS NULL ' +
             'AND FR_ID = :Id ' +
        'GROUP BY FM_IDFONDOFIJO, FM_MONTO, FM_PORCLIMITE ' +
          'HAVING SUM(FD_IMPORTE) > FM_MONTO * FM_PORCLIMITE / 100';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ID').AsInteger]), nil, 'No se puede cerrar un registro si la suma del detalle supera el monto del fondo fijo por el porcentaje límite.');

  if MsgBox('¿Está seguro de efectuar el cierre de la rendición?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      sSql := 'UPDATE OFR_RENDICION ' +
                 'SET FR_FECHACIERRE = SYSDATE, ' +
                     'FR_USUCIERRE = :UserId ' +
               'WHERE FR_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

      MsgBox('Cierre efectuado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmFFRendiciones.tbRecepcionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro no se encuentra cerrado.');
  Verificar(not sdqConsulta.FieldByName('FECHA_RECEPCION').IsNull, nil, 'El registro ya ha sido recibido.');

  if MsgBox('¿Está seguro de efectuar la recepción de la rendición?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      sSql := 'UPDATE OFR_RENDICION ' +
                 'SET FR_FECHARECEPCION = SYSDATE, ' +
                     'FR_USURECEPCION = :UserId ' +
               'WHERE FR_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

      MsgBox('Recepción efectuada correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

function TfrmFFRendiciones.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraFondoFijoAltaModif.IsEmpty, fraFondoFijoAltaModif, 'Debe indicar el fondo fijo.');

  sSql := 'SELECT 1 ' +
            'FROM OFR_RENDICION, OFF_FONDOFIJO ' +
           'WHERE FR_IDFONDOFIJO = FF_ID ' +
             'AND FF_FECHABAJA IS NULL ' +
             'AND FR_FECHABAJA IS NULL ' +
             'AND FR_FECHACIERRE IS NULL ' +
             'AND FF_ID = :Id';
  Verificar(ExisteSqlEx(sSql, [fraFondoFijoAltaModif.Value]), nil, 'No se puede crear un nuevo registro pues existe una rendición sin fecha de cierre para el fondo fijo seleccionado.');

  Verificar(GetUltNroRendicion(fraFondoFijoAltaModif.Value)+1 <> edNumeroAltaModif.Value, fraFondoFijoAltaModif, 'El número de rendición ya ha sido utilizado. Salga de la pantalla y vuelva a intentar.');

  Result := True;
end;

end.

