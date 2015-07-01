unit unFFManMontos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArt, Vcl.Mask, RxToolEdit, DateComboBox,
  RxCurrEdit, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCtbTablas, unFraStaticCodigoDescripcion,
  unFraCodDesc;

type
  TfrmFFManMontos = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    chkNoMostrarBajas: TCheckBox;
    fpCerrar: TFormPanel;
    Bevel1: TBevel;
    btnAceptarCerrar: TButton;
    btnCancelarCerrar: TButton;
    Label4: TLabel;
    edFechaHastaCierreAltaModif: TDateComboBox;
    Label1: TLabel;
    edFechaDesdeAltaModif: TDateComboBox;
    Label2: TLabel;
    edFechaHastaAltaModif: TDateComboBox;
    Label19: TLabel;
    edMontoAltaModif: TCurrencyEdit;
    Label3: TLabel;
    edPorcLimAltaModif: TCurrencyEdit;
    edDiasLimAltaModif: TIntEdit;
    Label5: TLabel;
    fraFormaPagoAltaModif: TfraCtbTablas;
    Label6: TLabel;
    fraBancoAltaModif: TfraCodigoDescripcion;
    Label7: TLabel;
    Label8: TLabel;
    edChequeNombreAltaModif: TEdit;
    Label9: TLabel;
    fraSucursalAltaModif: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarCerrarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fpCerrarEnter(Sender: TObject);
    procedure fraBancoAltaModifChange(Sender: TObject);
  private
    FIdFondoFijo: TTableId;
    procedure SetIdFondoFijo(const Value: TTableId);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    property IdFondoFijo: TTableId     read FIdFondoFijo     write SetIdFondoFijo;
  end;

var
  frmFFManMontos: TfrmFFManMontos;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, CustomDlgs, unDmPrincipal, StrFuncs,
  DateTimeFuncs;

{$R *.dfm}

procedure TfrmFFManMontos.btnAceptarCerrarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(edFechaHastaCierreAltaModif.IsEmpty, edFechaHastaCierreAltaModif, 'Debe ingresar la fecha hasta.');
  Verificar(edFechaHastaCierreAltaModif.Date < sdqConsulta.FieldByName('FECHA_DESDE').AsDateTime, edFechaHastaCierreAltaModif, 'La fecha hasta debe ser mayor o igual que la fecha desde (' + sdqConsulta.FieldByName('FECHA_DESDE').AsString + ').');

  if MsgBox('¿Está seguro de efectuar el cierre del fondo fijo?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      sSql := 'UPDATE OFM_FFMONTO ' +
                 'SET FM_FECHAHASTA = :FHasta, ' +
                     'FM_FECHACIERRE = SYSDATE, ' +
                     'FM_USUCIERRE = :UserId ' +
               'WHERE FM_ID = :Id';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(edFechaHastaCierreAltaModif.Date), Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

      MsgBox('Cierre efectuado correctamente.', MB_ICONINFORMATION);
      fpCerrar.ModalResult := mrOk;
    end;
end;

procedure TfrmFFManMontos.ClearControls;
var
  sSql: String;
begin
  edFechaDesdeAltaModif.Clear;
  edFechaHastaAltaModif.Clear;
  edMontoAltaModif.Clear;
  edPorcLimAltaModif.Clear;
  edDiasLimAltaModif.Clear;
  fraFormaPagoAltaModif.Clear;
  fraBancoAltaModif.Clear;
  fraSucursalAltaModif.Clear;

  sSql := 'SELECT SE_NOMBRE ' +
            'FROM OFF_FONDOFIJO, USE_USUARIOS ' +
           'WHERE FF_ID = :IdFondoFijo ' +
             'AND FF_RESPONSABLE = SE_USUARIO';
  edChequeNombreAltaModif.Text := ValorSqlEx(sSql, [IdFondoFijo]);
end;

function TfrmFFManMontos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           PrimaryKey.Add('FM_ID',            sdqConsulta.FieldByName('ID').AsInteger);
           Fields.Add('FM_FECHABAJA',         exDateTime);
           Fields.Add('FM_USUBAJA',           Sesion.UserID);

           SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.AddInteger('FM_ID',  GetSecNextVal('CONT.SEQ_OFM_ID'));
              Fields.Add('FM_FECHAALTA',      exDateTime);
              Fields.Add('FM_USUALTA',        Sesion.UserID);

              SqlType := stInsert;
            end;

          Fields.Add('FM_IDFONDOFIJO',        IdFondoFijo);
          Fields.Add('FM_FECHADESDE',         edFechaDesdeAltaModif.Date);

          if not edFechaHastaAltaModif.IsEmpty then
            Fields.Add('FM_FECHAHASTA',       edFechaHastaAltaModif.Date);

          Fields.Add('FM_MONTO',              edMontoAltaModif.Value);
          Fields.Add('FM_PORCLIMITE',         edPorcLimAltaModif.Value);
          Fields.Add('FM_DIASLIMITE',         edDiasLimAltaModif.Value);
          Fields.Add('FM_METODOPAGO',         fraFormaPagoAltaModif.Codigo);
          Fields.Add('FM_IDBANCO',            fraBancoAltaModif.Value);
          Fields.Add('FM_IDSUCURSAL',         fraSucursalAltaModif.Value, True);
          Fields.Add('FM_CHEQUENOMBRE',       Trim(edChequeNombreAltaModif.Text))
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmFFManMontos.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := True;
  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'OFM_FFMONTO';
  IdFondoFijo   := ART_EMPTY_ID;

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
end;

procedure TfrmFFManMontos.fpCerrarEnter(Sender: TObject);
begin
  edFechaHastaCierreAltaModif.Clear;
end;

procedure TfrmFFManMontos.fraBancoAltaModifChange(Sender: TObject);
begin
  if fraBancoAltaModif.IsSelected then
    begin
      fraSucursalAltaModif.ExtraCondition := ' AND SB_IDBANCO = ' + SqlValue(fraBancoAltaModif.Value);
      fraSucursalAltaModif.Clear;
    end;
end;

procedure TfrmFFManMontos.LoadControls;
begin
  //  inherited;
end;

procedure TfrmFFManMontos.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT FM_FECHADESDE FECHA_DESDE, FM_FECHAHASTA FECHA_HASTA, FM_MONTO MONTO, ' +
                 'FM_PORCLIMITE PORC_LIMITE, FM_DIASLIMITE DIAS_LIMITE, TRUNC(FM_FECHACIERRE) FECHA_CIERRE, ' +
                 'TRUNC(FM_FECHABAJA) FECHA_BAJA, FM_ID ID, FM_CHEQUENOMBRE CHEQUENOMBRE, ' +
                 'CTBMETPAGO.TB_DESCRIPCION DESCRMETODOPAGO, BA_NOMBRE BANCO, SB_NOMBRE NOMSUCURSAL ' +
            'FROM OFM_FFMONTO, CTB_TABLAS CTBMETPAGO, ZSB_SUCURSALBANCO, ZBA_BANCO ' +
           'WHERE FM_IDFONDOFIJO = :IdFondoFijo ' +
             'AND CTBMETPAGO.TB_CLAVE(+) = ''COBRO'' ' +
             'AND CTBMETPAGO.TB_CODIGO(+) = FM_METODOPAGO ' +
             'AND FM_IDBANCO = BA_ID ' +
             'AND FM_IDSUCURSAL = SB_ID(+)';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND FM_FECHABAJA IS NULL';

  sdqConsulta.ParamByName('IdFondoFijo').AsInteger := IdFondoFijo;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmFFManMontos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;

  if sdqConsulta.FieldByName('PORC_LIMITE') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('PORC_LIMITE')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmFFManMontos.SetIdFondoFijo(const Value: TTableId);
begin
  if FIdFondoFijo <> Value then
    begin
      FIdFondoFijo := Value;
      RefreshData;
    end;
end;

procedure TfrmFFManMontos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro ya se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro se encuentra cerrado.');

  inherited;
end;

procedure TfrmFFManMontos.tbLimpiarClick(Sender: TObject);
begin
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

procedure TfrmFFManMontos.tbNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM OFM_FFMONTO ' +
           'WHERE FM_IDFONDOFIJO = :IdFondoFijo ' +
             'AND FM_FECHABAJA IS NULL ' +
             'AND FM_FECHACIERRE IS NULL';
  Verificar(ExisteSqlEx(sSql, [IdFondoFijo]), nil, 'No se puede crear un nuevo registro pues existe un registro sin fecha de cierre.');

  inherited;
end;

procedure TfrmFFManMontos.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHA_CIERRE').IsNull, nil, 'El registro ya se encuentra cerrado.');
  Verificar(not sdqConsulta.FieldByName('FECHA_HASTA').IsNull, nil, 'El registro ya tiene fecha hasta cargada.');

  if fpCerrar.ShowModal = mrOk then
    RefreshData;
end;

function TfrmFFManMontos.Validar: Boolean;
begin
  Verificar(edFechaDesdeAltaModif.IsEmpty, edFechaDesdeAltaModif, 'Debe ingresar la fecha desde.');
  Verificar(edMontoAltaModif.Value <= 0, edMontoAltaModif, 'El monto debe ser mayor a 0.');
  Verificar(edPorcLimAltaModif.Value <= 0, edPorcLimAltaModif, 'El porcentaje límite debe ser mayor a 0.');
  Verificar(edDiasLimAltaModif.Value <= 0, edDiasLimAltaModif, 'Los días límite deben ser mayores a 0.');
  Verificar(fraFormaPagoAltaModif.IsEmpty, fraFormaPagoAltaModif, 'Debe ingresar la forma de pago.');
  Verificar(fraBancoAltaModif.IsEmpty, fraBancoAltaModif, 'Debe ingresar el banco.');
  Verificar(IsEmptyString(edChequeNombreAltaModif.Text), edChequeNombreAltaModif, 'Debe ingresar el cheque a nombre.');

  Result := True;
end;

end.

