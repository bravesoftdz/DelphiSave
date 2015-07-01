unit unTransferenciaCuentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, Mask, ToolEdit, DateComboBox, CurrEdit,
  Menus;

type
  TfrmTransferenciaCuentas = class(TfrmCustomGridABM)
    gbOrigen: TGroupBox;
    lbBanco: TLabel;
    lbCuenta: TLabel;
    fraCuentaBancariaOrigen: TfraStaticCodigoDescripcion;
    fraBancoOrigen: TfraStaticCodigoDescripcion;
    gbDest: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    fraCuentaBancariaDest: TfraStaticCodigoDescripcion;
    fraBancoDest: TfraStaticCodigoDescripcion;
    gbFecha: TGroupBox;
    Label3: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    rgAprobado: TRadioGroup;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbAltaMasiva: TToolButton;
    tbAprobar: TToolButton;
    gbOrigenAltaModif: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    fraCuentaBancariaOrigenAltaModif: TfraStaticCodigoDescripcion;
    fraBancoOrigenAltaModif: TfraStaticCodigoDescripcion;
    gbDestAltaModif: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    fraCuentaBancariaDestAltaModif: TfraStaticCodigoDescripcion;
    fraBancoDestAltaModif: TfraStaticCodigoDescripcion;
    edFechaAltaModif: TDateComboBox;
    Label8: TLabel;
    edImporteAltaModif: TCurrencyEdit;
    Label9: TLabel;
    edObservAltaModif: TMemo;
    Label10: TLabel;
    pmnuImprimir: TPopupMenu;
    mnuImpTransfAprobadas: TMenuItem;
    mnuImpResultados: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OnfraBancoOrigenChange(Sender: TObject);
    procedure OnfraCuentaBancariaOrigenChange(Sender: TObject);
    procedure OnfraBancoDestChange(Sender: TObject);
    procedure OnfraCuentaBancariaDestChange(Sender: TObject);
    procedure OnfraBancoOrigenAltaModifChange(Sender: TObject);
    procedure OnfraCuentaBancariaOrigenAltaModifChange(Sender: TObject);
    procedure OnfraBancoDestAltaModifChange(Sender: TObject);
    procedure OnfraCuentaBancariaDestAltaModifChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbAltaMasivaClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpTransfAprobadasClick(Sender: TObject);
  private
  public
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmTransferenciaCuentas: TfrmTransferenciaCuentas;

implementation

{$R *.dfm}

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, SqlFuncs, ArchFuncs, unSesion,
  unArt, unImpoExpoWizard, unTesoreria, unRptTransferenciasAprobadas;

procedure TfrmTransferenciaCuentas.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'RTC_TRANSFERENCIACUENTA';
  FieldBaja     := 'FECHA_BAJA';

  with fraBancoOrigen do
    begin
      ShowBajas   := True;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      OnChange    := OnfraBancoOrigenChange;

      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancariaOrigen do
    begin
      ShowBajas   := True;
      TableName   := 'ZCB_CUENTABANCARIA';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
      OnChange    := OnfraCuentaBancariaOrigenChange;
    end;

  with fraBancoDest do
    begin
      ShowBajas   := True;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      OnChange    := OnfraBancoDestChange;

      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancariaDest do
    begin
      ShowBajas   := True;
      TableName   := 'ZCB_CUENTABANCARIA';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
      OnChange    := OnfraCuentaBancariaDestChange;
    end;

  with fraBancoOrigenAltaModif do
    begin
      ShowBajas   := False;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      OnChange    := OnfraBancoOrigenAltaModifChange;

      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancariaOrigenAltaModif do
    begin
      ShowBajas   := False;
      TableName   := 'ZCB_CUENTABANCARIA';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
      OnChange    := OnfraCuentaBancariaOrigenAltaModifChange;
    end;

  with fraBancoDestAltaModif do
    begin
      ShowBajas   := False;
      TableName   := 'ZBA_BANCO';
      FieldID     := 'BA_ID';
      FieldCodigo := 'BA_CODIGO';
      FieldDesc   := 'BA_NOMBRE';
      FieldBaja   := 'BA_FECHABAJA';
      OnChange    := OnfraBancoDestAltaModifChange;

      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancariaDestAltaModif do
    begin
      ShowBajas   := False;
      TableName   := 'ZCB_CUENTABANCARIA';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
      OnChange    := OnfraCuentaBancariaDestAltaModifChange;
    end;
end;

procedure TfrmTransferenciaCuentas.OnfraBancoOrigenChange(Sender: TObject);
begin
  fraCuentaBancariaOrigen.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBancoOrigen.IsSelected then
    fraCuentaBancariaOrigen.ExtraCondition := fraCuentaBancariaOrigen.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBancoOrigen.Value)
end;

procedure TfrmTransferenciaCuentas.OnfraCuentaBancariaOrigenChange(Sender: TObject);
begin
  if not fraBancoOrigen.IsSelected and fraCuentaBancariaOrigen.IsSelected then
    fraBancoOrigen.Value := StrToInt(fraCuentaBancariaOrigen.cmbDescripcion.Cells[4, fraCuentaBancariaOrigen.cmbDescripcion.Row]);
end;

procedure TfrmTransferenciaCuentas.OnfraBancoDestChange(Sender: TObject);
begin
  fraCuentaBancariaDest.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBancoDest.IsSelected then
    fraCuentaBancariaDest.ExtraCondition := fraCuentaBancariaDest.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBancoDest.Value)
end;

procedure TfrmTransferenciaCuentas.OnfraCuentaBancariaDestChange(Sender: TObject);
begin
  if not fraBancoDest.IsSelected and fraCuentaBancariaDest.IsSelected then
    fraBancoDest.Value := StrToInt(fraCuentaBancariaDest.cmbDescripcion.Cells[4, fraCuentaBancariaDest.cmbDescripcion.Row]);
end;

procedure TfrmTransferenciaCuentas.OnfraBancoOrigenAltaModifChange(Sender: TObject);
begin
  fraCuentaBancariaOrigenAltaModif.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBancoOrigenAltaModif.IsSelected then
    fraCuentaBancariaOrigenAltaModif.ExtraCondition := fraCuentaBancariaOrigenAltaModif.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBancoOrigenAltaModif.Value)
end;

procedure TfrmTransferenciaCuentas.OnfraCuentaBancariaOrigenAltaModifChange(Sender: TObject);
begin
  if not fraBancoOrigenAltaModif.IsSelected and fraCuentaBancariaOrigenAltaModif.IsSelected then
    fraBancoOrigenAltaModif.Value := StrToInt(fraCuentaBancariaOrigenAltaModif.cmbDescripcion.Cells[4, fraCuentaBancariaOrigenAltaModif.cmbDescripcion.Row]);
end;

procedure TfrmTransferenciaCuentas.OnfraBancoDestAltaModifChange(Sender: TObject);
begin
  fraCuentaBancariaDestAltaModif.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBancoDestAltaModif.IsSelected then
    fraCuentaBancariaDestAltaModif.ExtraCondition := fraCuentaBancariaDestAltaModif.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBancoDestAltaModif.Value)
end;

procedure TfrmTransferenciaCuentas.OnfraCuentaBancariaDestAltaModifChange(Sender: TObject);
begin
  if not fraBancoDestAltaModif.IsSelected and fraCuentaBancariaDestAltaModif.IsSelected then
    fraBancoDestAltaModif.Value := StrToInt(fraCuentaBancariaDestAltaModif.cmbDescripcion.Cells[4, fraCuentaBancariaDestAltaModif.cmbDescripcion.Row]);
end;

procedure TfrmTransferenciaCuentas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraBancoOrigen.Clear;
  fraCuentaBancariaOrigen.Clear;
  fraBancoDest.Clear;
  fraCuentaBancariaDest.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  rgAprobado.ItemIndex := 2;
  chkNoMostrarBajas.Checked := True;
end;

procedure TfrmTransferenciaCuentas.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT ZBAO.BA_NOMBRE BANCO_ORIGEN, ZCBO.CB_NUMERO CUENTA_ORIGEN, ' +
                 'ZBAD.BA_NOMBRE BANCO_DESTINO, ZCBD.CB_NUMERO CUENTA_DESTINO, ' +
                 'RTC.TC_FECHA FECHA, RTC.TC_IMPORTE IMPORTE, RTC.TC_OBSERVACIONES OBSERVACIONES, ' +
                 'TRUNC(RTC.TC_FECHAAPROBADO) FECHA_APROBADO, TRUNC(RTC.TC_FECHABAJA) FECHA_BAJA, ' +
                 'TC_ID ID, ZCBO.CB_ID IDCUENTA_ORIGEN, ZBAO.BA_ID IDBANCO_ORIGEN, ' +
                 'ZCBD.CB_ID IDCUENTA_DESTINO, ZBAD.BA_ID IDBANCO_DESTINO ' +
            'FROM RTC_TRANSFERENCIACUENTA RTC, ZCB_CUENTABANCARIA ZCBO, ZBA_BANCO ZBAO, ' +
                 'ZCB_CUENTABANCARIA ZCBD, ZBA_BANCO ZBAD ' +
           'WHERE ZCBO.CB_ID = RTC.TC_IDCUENTAORIGEN ' +
             'AND ZBAO.BA_ID = ZCBO.CB_IDBANCO ' +
             'AND ZCBD.CB_ID = RTC.TC_IDCUENTADESTINO ' +
             'AND ZBAD.BA_ID = ZCBD.CB_IDBANCO';

  sWhere := SqlBetweenDateTime(' AND RTC.TC_FECHA', edFechaDesde.Date, edFechaHasta.Date);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND TC_FECHABAJA IS NULL';

  if fraBancoOrigen.IsSelected then
    sWhere := sWhere + ' AND ZBAO.BA_ID = ' + SqlValue(fraBancoOrigen.Value);

  if fraCuentaBancariaOrigen.IsSelected then
    sWhere := sWhere + ' AND ZCBO.CB_ID = ' + SqlValue(fraCuentaBancariaOrigen.Value);

  if fraBancoDest.IsSelected then
    sWhere := sWhere + ' AND ZBAD.BA_ID = ' + SqlValue(fraBancoDest.Value);

  if fraCuentaBancariaDest.IsSelected then
    sWhere := sWhere + ' AND ZCBD.CB_ID = ' + SqlValue(fraCuentaBancariaDest.Value);

  case rgAprobado.ItemIndex of
    0: sWhere := sWhere + ' AND RTC.TC_FECHAAPROBADO IS NOT NULL';
    1: sWhere := sWhere + ' AND RTC.TC_FECHAAPROBADO IS NULL';
  end;

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmTransferenciaCuentas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmTransferenciaCuentas.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ya ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro ha sido aprobado.');

  inherited;
end;

procedure TfrmTransferenciaCuentas.tbAltaMasivaClick(Sender: TObject);
begin
  ImpoExpoWizard('TAMTR');
end;

procedure TfrmTransferenciaCuentas.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');

  sSql := 'SELECT 1 ' +
            'FROM RTC_TRANSFERENCIACUENTA ' +
           'WHERE TRUNC(TC_FECHAAPROBADO) = ACTUALDATE ' +
             'AND TC_FECHABAJA IS NULL';
  Verificar(ExisteSql(sSql), nil, 'Ya existen transferencias aprobadas el día de hoy.');

  sSql := 'SELECT 1 ' +
            'FROM RTC_TRANSFERENCIACUENTA ' +
           'WHERE TC_FECHAAPROBADO IS NULL ' +
             'AND TC_FECHABAJA IS NULL';
  Verificar(not ExisteSql(sSql), nil, 'No existen transferencias pendientes de aprobar.');

  if MsgBox('¿Está seguro de querer aprobar todas las transferencias pendientes?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      sSql := 'UPDATE RTC_TRANSFERENCIACUENTA ' +
                 'SET TC_FECHAAPROBADO = SYSDATE, ' +
                     'TC_USUAPROBADO = :UserId ' +
               'WHERE TC_FECHAAPROBADO IS NULL ' +
                 'AND TC_FECHABAJA IS NULL';
      EjecutarSqlEx(sSql, [Sesion.UserId]);

      DoEjecutarInterfaceAsientos('TR', DBDate());

      DoImprimirTransfAprobadas(DBDate());

      RefreshData;
    end;
end;

procedure TfrmTransferenciaCuentas.ClearControls;
begin
  fraBancoOrigenAltaModif.Clear;
  fraCuentaBancariaOrigenAltaModif.Clear;
  fraBancoDestAltaModif.Clear;
  fraCuentaBancariaDestAltaModif.Clear;
  edFechaAltaModif.Clear;
  edImporteAltaModif.Clear;
  edObservAltaModif.Clear;
end;

procedure TfrmTransferenciaCuentas.LoadControls;
begin
  fraBancoOrigenAltaModif.Value          := sdqConsulta.FieldByName('IDBANCO_ORIGEN').AsInteger;
  OnfraBancoOrigenAltaModifChange(nil);
  fraCuentaBancariaOrigenAltaModif.Value := sdqConsulta.FieldByName('IDCUENTA_ORIGEN').AsInteger;
  OnfraCuentaBancariaOrigenAltaModifChange(nil);
  fraBancoDestAltaModif.Value            := sdqConsulta.FieldByName('IDBANCO_DESTINO').AsInteger;
  OnfraBancoDestAltaModifChange(nil);
  fraCuentaBancariaDestAltaModif.Value   := sdqConsulta.FieldByName('IDCUENTA_DESTINO').AsInteger;
  OnfraCuentaBancariaDestAltaModifChange(nil);
  edFechaAltaModif.Date                  := sdqConsulta.FieldByName('FECHA').AsDateTime;
  edImporteAltaModif.Value               := sdqConsulta.FieldByName('IMPORTE').AsCurrency;
  edObservAltaModif.Lines.Text           := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
end;

function TfrmTransferenciaCuentas.Validar: Boolean;
begin
  Verificar(fraBancoOrigenAltaModif.IsEmpty, fraBancoOrigenAltaModif, 'El banco origen es obligatorio.');
  Verificar(fraCuentaBancariaOrigenAltaModif.IsEmpty, fraCuentaBancariaOrigenAltaModif, 'La cuenta origen es obligatoria.');
  Verificar(fraBancoDestAltaModif.IsEmpty, fraBancoDestAltaModif, 'El banco destino es obligatorio.');
  Verificar(fraCuentaBancariaDestAltaModif.IsEmpty, fraCuentaBancariaDestAltaModif, 'La cuenta destino es obligatoria.');
  Verificar(fraCuentaBancariaOrigenAltaModif.Value = fraCuentaBancariaDestAltaModif.Value, fraCuentaBancariaOrigenAltaModif, 'La cuenta origen no puede ser igual a la cuenta destino.');
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'La fecha es obligatoria.');
  Verificar(edImporteAltaModif.Value = 0, edImporteAltaModif, 'El importe es obligatorio.');

  Result := True;
end;

function TfrmTransferenciaCuentas.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
    begin
       Sql.PrimaryKey.Add('TC_ID',               sdqConsulta.FieldByName('ID').AsInteger);
       Sql.Fields.Add('TC_FECHABAJA',            exDateTime);
       Sql.Fields.Add('TC_USUBAJA',              Sesion.UserID);
       Sql.SqlType := stUpdate;
    end
  else
    begin
       if ModoABM = maAlta then
         begin
           Sql.PrimaryKey.Add('TC_ID',           GetSecNextVal('TESO.SEQ_RTC_ID'));
           Sql.Fields.Add('TC_FECHAALTA',        exDateTime);
           Sql.Fields.Add('TC_USUALTA',          Sesion.UserID);
           Sql.SqlType := stInsert;
         end
       else if ModoABM = maModificacion then
         begin
           Sql.PrimaryKey.Add('TC_ID',           sdqConsulta.FieldByName('ID').AsInteger);
           Sql.Fields.Add('TC_FECHAMODIF',       exDateTime);
           Sql.Fields.Add('TC_USUMODIF',         Sesion.UserID);
           Sql.SqlType := stUpdate;
         end;

       Sql.Fields.Add('TC_IDCUENTAORIGEN',       fraCuentaBancariaOrigenAltaModif.Value);
       Sql.Fields.Add('TC_IDCUENTADESTINO',      fraCuentaBancariaDestAltaModif.Value);
       Sql.Fields.Add('TC_FECHA',                edFechaAltaModif.Date);
       Sql.Fields.Add('TC_IMPORTE',              edImporteAltaModif.Value);
       Sql.Fields.Add('TC_OBSERVACIONES',        Trim(edObservAltaModif.Lines.Text));
    end;

  Result := inherited DoABM;
end;

procedure TfrmTransferenciaCuentas.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ha sido dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, nil, 'El registro ha sido aprobado.');

  inherited;
end;

procedure TfrmTransferenciaCuentas.mnuImpResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmTransferenciaCuentas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmTransferenciaCuentas.mnuImpTransfAprobadasClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  dFecha := InputBoxDate('Transferencia entre Cuentas', 'Fecha Aprobación', DBDate());

  if (dFecha <> -1) and (dFecha <> 0) then
    DoImprimirTransfAprobadas(dFecha);
end;

end.

