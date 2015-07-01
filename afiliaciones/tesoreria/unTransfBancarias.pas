unit unTransfBancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, ToolEdit,
  DateComboBox, IntEdit, Menus, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, RxToolEdit, RxPlacemnt;

type
  TfrmTransfBancarias = class(TfrmCustomGridABM)
    gbNroTransf: TGroupBox;
    gbFechaAlta: TGroupBox;
    Label3: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    rgImpresos: TRadioGroup;
    edTransferencia: TIntEdit;
    ShortCutControl1: TShortCutControl;
    pmnuImprimir: TPopupMenu;
    mnuImpTransfDepos: TMenuItem;
    mnuImpResultados: TMenuItem;
    tbSalir2: TToolButton;
    tbDetalle: TToolButton;
    ToolButton2: TToolButton;
    gbBanco: TGroupBox;
    fraZBA_BANCO: TfraStaticCodigoDescripcion;
    tbArchivoBcoPatagonia: TToolButton;
    tbRendicion: TToolButton;
    tbProceso: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpTransfDeposClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure tbArchivoBcoPatagoniaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRendicionClick(Sender: TObject);
    procedure tbProcesoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
  public
  end;

var
  frmTransfBancarias: TfrmTransfBancarias;

implementation

uses
  AnsiSql, SqlFuncs, unSesion, unRptBancosGiroTransferencia, CustomDlgs, unDmPrincipal,
  unArt, unDetalleTransfBancaria, General, unImpoExpoWizard, unTesoreria,
  unRptBancosGiroTransferenciaFormato2, unRptTransferenciasBAPROPagoElectr,
  unRptTransferenciasPagoElectronico;

{$R *.dfm}

procedure TfrmTransfBancarias.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT TR_ID ID, TRUNC(TR_FECHAALTA) FECHAALTA, TRUNC(TR_FECHABAJA) FECHABAJA, ' +
                 'TRUNC(TR_FECHAIMPRESION) FECHAIMPRESION, TR_USUIMPRESION USUIMPRESION, ' +
                 'BA_NOMBRE BANCO, BA_CODIGO CODBANCO, TR_METODOPAGO METODOPAGO, ' +
                 'TRUNC(TR_FECHAPROCESO) FECHAPROCESO, ' +
                 '(SELECT SUM(CE_MONTO) FROM RCE_CHEQUEEMITIDO WHERE CE_IDTRANSFERENCIA = TR_ID) IMPORTE ' +
            'FROM ZBA_BANCO, TESO.RTR_TRANSFERENCIA ' +
           'WHERE TR_IDBANCO = BA_ID ';

  if not edTransferencia.IsEmpty then
    sSql := sSql + ' AND TR_ID = ' + SqlValue(edTransferencia.Value);

  if fraZBA_BANCO.IsSelected Then
    sSql := sSql + ' AND BA_ID = ' + SqlValue(fraZBA_BANCO.Value);

  sSql := sSql + SqlBetweenDateTime(' AND TR_FECHAALTA ', edFechaAltaDesde.Date, edFechaAltaHasta.Date);
    
  case rgImpresos.ItemIndex of
    0: sSql := sSql + ' AND TR_FECHAIMPRESION IS NOT NULL';
    1: sSql := sSql + ' AND TR_FECHAIMPRESION IS NULL';
  end;

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy ;
  inherited;
end;

procedure TfrmTransfBancarias.tbLimpiarClick(Sender: TObject);
begin
  edTransferencia.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraZBA_BANCO.Clear;
  rgImpresos.ItemIndex := 2;   // Todos

  inherited;
end;

procedure TfrmTransfBancarias.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := False;
  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'TESO.RTR_TRANSFERENCIA';

  with fraZBA_BANCO do
    begin
      TableName      := 'ZBA_BANCO';
      FieldID        := 'BA_ID';
      FieldCodigo    := 'BA_CODIGO';
      FieldDesc      := 'BA_NOMBRE';
      FieldBaja      := 'BA_FECHABAJA';
      ShowBajas      := True;
      ExtraCondition := ' AND BA_TRANSFERENCIA = ''S''';
    end;
end;

procedure TfrmTransfBancarias.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmTransfBancarias.mnuImpResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

function TfrmTransfBancarias.DoABM: Boolean;
var
  sSql: String;
begin
  try
    BeginTrans;
    Sql.Clear;

    if ModoABM = maBaja Then
      begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('TR_ID',        sdqConsulta.FieldByName('ID').AsInteger);
        Sql.Fields.Add('TR_USUBAJA',       Sesion.UserId);
        Sql.Fields.Add('TR_FECHABAJA',     exDateTime);

        sSql := 'UPDATE RSO_SOBRE ' +
                  'SET SO_USUBAJA = :User, ' +
                      'SO_FECHABAJA = SYSDATE ' +
                'WHERE SO_IDCHEQUEEMITIDO IN (SELECT CE_ID ' +
                                               'FROM RCE_CHEQUEEMITIDO ' +
                                              'WHERE CE_IDTRANSFERENCIA = :IdTransf) ' +
                  'AND SO_FECHABAJA IS NULL ' +
                  'AND SO_FECHAIMPRESION IS NULL';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

        sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                   'SET CE_IDTRANSFERENCIA = NULL, ' +
                       'CE_SITUACION = ''30'', ' +    // 30: A la firma
                       'CE_FECHASITUACION = ACTUALDATE, ' +
                       'CE_USUSITUACION = ' + SqlValue(Sesion.UserID) + ' ' +
                  'WHERE CE_IDTRANSFERENCIA = :IdTransf';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ID').AsInteger]);
      end;

    Result := inherited DoABM;

    CommitTrans;
  except
    on E: Exception do
    begin             
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al dar de baja la transferencia.');
    end;
  end;
end;

procedure TfrmTransfBancarias.mnuImpTransfDeposClick(Sender: TObject);
var
  IdTransf: TTableId;
  sCodBanco: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'El registro se encuentra dado de baja.');

  IdTransf  := sdqConsulta.FieldByName('ID').AsInteger;
  sCodBanco := sdqConsulta.FieldByName('CODBANCO').AsString;

  if AreIn(sCodBanco, [CodBanco_Patagonia]) then
    TfrmRptBancosGiroTransferenciaFormato2.DoImprimirBancosGiroTransferenciaFormato2(IdTransf, sCodBanco)
  else if AreIn(sCodBanco, [CodBanco_PciaBsAs]) and (sdqConsulta.FieldByName('METODOPAGO').AsString = 'PE') then
    TfrmRptTransferenciasBAPROPagoElectr.DoImprimirBAPROPagoElectronico(IdTransf)
  else if AreIn(sCodBanco, [CodBanco_SantanderRio]) and (sdqConsulta.FieldByName('METODOPAGO').AsString = 'PE') then
    TfrmRptTransferenciasPagoElectronico.DoImprimirTransferenciaPagoElectronico(IdTransf)
  else
    TfrmRptBancosGiroTransferencia.DoImprimirBancosGiroTransferencia(IdTransf);

  RefreshData;
end;

procedure TfrmTransfBancarias.tbDetalleClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(IsBaja(), nil, 'El registro se encuentra dado de baja.');

  with TfrmDetalleTransfBancaria.Create(nil) do
    try
      IdTransferencia := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmTransfBancarias.tbArchivoBcoPatagoniaClick(Sender: TObject);
var
  sImpoExpo, sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(not AreIn(sdqConsulta.FieldByName('CODBANCO').AsString, [CodBanco_Patagonia, CodBanco_NacionArg]), nil, 'Debe seleccionar un Banco Patagonia o un Banco Nación Argentina.');

  sSql := 'UPDATE TESO.RTR_TRANSFERENCIA ' +
             'SET TR_USUSELECCION = NULL ' +
           'WHERE TR_USUSELECCION = :Usuario';
  EjecutarSqlEx(sSql, [Sesion.UserId]);

  sSql := 'UPDATE TESO.RTR_TRANSFERENCIA ' +
             'SET TR_USUSELECCION = :Usuario ' +
           'WHERE TR_ID = :Id';
  EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

  if sdqConsulta.FieldByName('CODBANCO').AsString = CodBanco_Patagonia then
    sImpoExpo := 'TETBP'
  else if sdqConsulta.FieldByName('CODBANCO').AsString = CodBanco_NacionArg then
    sImpoExpo := 'TETBN';

  ImpoExpoWizard(sImpoExpo);
end;

procedure TfrmTransfBancarias.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmTransfBancarias.tbRendicionClick(Sender: TObject);
begin
  ImpoExpoWizard('TRTBN');
end;

procedure TfrmTransfBancarias.tbProcesoClick(Sender: TObject);
var
  sSql: String;
  IdTransf: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(sdqConsulta.FieldByName('METODOPAGO').AsString <> 'PE', nil, 'Debe seleccionar un pago electrónico.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAPROCESO').IsNull, nil, 'El registro ya tiene fecha de proceso.');

  if MsgBox('¿Está seguro que desea marcar el registro como procesado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        IdTransf := sdqConsulta.FieldByName('ID').AsInteger;

        sSql := 'UPDATE TESO.RTR_TRANSFERENCIA ' +
                   'SET TR_FECHAPROCESO = SYSDATE, ' +
                       'TR_USUPROCESO = :User ' +
                 'WHERE TR_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, IdTransf]);

        sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                   'SET CE_SITUACION = :Situacion, ' +
                       'CE_USUSITUACION = :User, ' +
                       'CE_FECHASITUACION = ACTUALDATE ' +
                 'WHERE CE_IDTRANSFERENCIA = :Id';
        EjecutarSqlSTEx(sSql, ['29', Sesion.UserId, IdTransf]);   // 29: DEPOSITO EN CUENTA BANCARIA

        sSql := 'SELECT CE_ID ' +
                  'FROM RCE_CHEQUEEMITIDO ' +
                 'WHERE CE_IDTRANSFERENCIA = :Id';
        with GetQueryEx(sSql, [IdTransf]) do
          try
            while not Eof do
              begin
                DoInsertarSobreLiquidacionILTP(FieldByName('CE_ID').AsInteger);

                Next;
              end;
          finally
            Free;
          end;

        CommitTrans;
        MsgBox('Registro marcado como procesado correctamente.', MB_ICONINFORMATION);

        sdqConsulta.Refresh;
      except
        on E: Exception do
          begin
            RollBack;
            raise Exception.Create(E.Message + CRLF + 'Error al marcar el registro como procesado.');
          end;
      end;
    end;
end;

procedure TfrmTransfBancarias.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHAPROCESO').IsNull, nil, 'El registro tiene fecha de proceso.');

  inherited;
end;

end.

