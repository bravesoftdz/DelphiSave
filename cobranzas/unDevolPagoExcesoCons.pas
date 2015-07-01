unit unDevolPagoExcesoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PeriodoPicker, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit,
  DateComboBox, CurrEdit, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmDevolPagoExcesoCons = class(TfrmCustomGridABM)
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraDevContrato: TfraEmpresa;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    edDevPerDesde: TPeriodoPicker;
    edDevPerHasta: TPeriodoPicker;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edContrEstado: TEdit;
    Label4: TLabel;
    edContrFBaja: TDateComboBox;
    Label5: TLabel;
    edContrSector: TEdit;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    Label6: TLabel;
    edPE_DEVOLUCION: TCurrencyEdit;
    tbGenerarPago: TToolButton;
    ToolButton7: TToolButton;
    Label7: TLabel;
    edPE_BENEFICIARIO: TEdit;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbGenerarPagoClick(Sender: TObject);
  private
    procedure fraDevContratoChange(Sender: TObject);
    procedure CalcTotales;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure LoadControls; override;
  public
  end;

const
  MAXCOLS = 4;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('EMITIDO', 'PAGADO', 'RECLAMO_AFIP', 'AJUSTE_SALDO_ACREEDOR', 'DEVOLUCION');

var
  frmDevolPagoExcesoCons: TfrmDevolPagoExcesoCons;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, VCLExtra, unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General,
  SqlFuncs, unArt;

{$R *.dfm}

procedure TfrmDevolPagoExcesoCons.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraDevContrato.Clear;
  fraDevContratoChange(nil);
  edDevPerDesde.Clear;
  edDevPerHasta.Clear;
  edPE_BENEFICIARIO.Clear;
end;

procedure TfrmDevolPagoExcesoCons.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  Verificar(fraDevContrato.IsEmpty, fraDevContrato, 'Debe indicar el contrato.');

  sSql := 'ART.COBRANZA.DO_GENERARDEVOLUCION(:CONTRATO, :PERIODODESDE, :PERIODOHASTA, :USUARIO);';
  EjecutarStoreEx(sSql, [fraDevContrato.ContratoExt, edDevPerDesde.Periodo.Valor, edDevPerHasta.Periodo.Valor, Sesion.UserId]);

  sSql := 'SELECT PE_PERIODO PERIODO, PE_EMITIDO EMITIDO, PE_PAGADO PAGADO, PE_RECLAMOAFIP RECLAMO_AFIP, ' +
                 'PE_AJUSTESALDOACREEDOR AJUSTE_SALDO_ACREEDOR, PE_DEVOLUCION DEVOLUCION, ' +
                 'PE_BENEFICIARIO BENEFICIARIO, ART.AFILIACION.GET_CODREGIMENCONTRATO(PE_CONTRATO) CODREG ' +
            'FROM TPE_DEVOLUCIONPAGOEXCESO ' +
           'WHERE PE_USUARIO = ' + SqlValue(Sesion.UserId) + ' ';

  sWhere := ' AND PE_CONTRATO = ' + SqlValue(fraDevContrato.ContratoExt);

  if not edDevPerDesde.Periodo.IsNull then
    sWhere := sWhere + ' AND PE_PERIODO >= ' + SqlValue(edDevPerDesde.Periodo.Valor);

  if not edDevPerHasta.Periodo.IsNull then
    sWhere := sWhere + ' AND PE_PERIODO <= ' + SqlValue(edDevPerHasta.Periodo.Valor);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmDevolPagoExcesoCons.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'TPE_DEVOLUCIONPAGOEXCESO';

  VCLExtra.LockControls([edContrEstado, edContrFBaja, edContrSector]);

  with fraDevContrato do
    begin
      OnChange          := fraDevContratoChange;
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmDevolPagoExcesoCons.fraDevContratoChange(Sender: TObject);
var
  sSql: String;
  SqlResults: TStringList;
begin
  if fraDevContrato.IsSelected then
    begin
      sSql := 'SELECT EST.TB_DESCRIPCION ESTADO, CO_FECHABAJA FECHA_BAJA, SECT.TB_DESCRIPCION SECTOR ' +
                'FROM CTB_TABLAS EST, CTB_TABLAS SECT, AEM_EMPRESA, ACO_CONTRATO_EXT ' +
               'WHERE EM_ID = CO_IDEMPRESA ' +
                 'AND EST.TB_CODIGO = CO_ESTADO ' +
                 'AND EST.TB_CLAVE = ''AFEST'' ' +
                 'AND SECT.TB_CODIGO = EM_SECTOR ' +
                 'AND SECT.TB_CLAVE = ''SECT'' ' +
                 'AND CO_CONTRATO = ' + SqlValue(fraDevContrato.ContratoExt);

      SqlResults := ValoresColSql(sSql);
      try
        edContrEstado.Text := SqlResults[0];
        edContrFBaja.Text  := SqlResults[1];
        edContrSector.Text := SqlResults[2];
      finally
        SqlResults.Free;
      end;
    end
  else
    begin
      edContrEstado.Clear;
      edContrFBaja.Clear;
      edContrSector.Clear;
    end;
end;

procedure TfrmDevolPagoExcesoCons.LoadControls;
begin
  with sdqConsulta do
    begin
      edPE_DEVOLUCION.Value  := Iif(FieldByName('DEVOLUCION').AsCurrency = 0, FieldByName('AJUSTE_SALDO_ACREEDOR').AsCurrency, FieldByName('DEVOLUCION').AsCurrency);

      if not IsEmptyString(FieldByName('BENEFICIARIO').AsString) then
        edPE_BENEFICIARIO.Text := FieldByName('BENEFICIARIO').AsString
      else if IsEmptyString(edPE_BENEFICIARIO.Text) then
        edPE_BENEFICIARIO.Text := fraDevContrato.NombreEmpresa;
    end;
end;

function TfrmDevolPagoExcesoCons.Validar: Boolean;
var
  sSql: String;
  dDevolucion: Double;
begin
  Verificar(edPE_DEVOLUCION.Value < 0, edPE_DEVOLUCION, 'El importe de devolución debe ser mayor o igual a 0.');
  Verificar(edPE_DEVOLUCION.Value > sdqConsulta.FieldByName('PAGADO').AsCurrency, edPE_DEVOLUCION, 'El importe de devolución debe ser menor o igual al pagado.');
  Verificar(IsEmptyString(edPE_BENEFICIARIO.Text), edPE_BENEFICIARIO, 'Debe indicar el beneficiario.');

  sSql := 'SELECT SUM(DE_DEVOLUCION) ' +
            'FROM ZPE_DEVOLUCIONPAGOEXCESO, ZDE_DETALLEDEVOLPAGOEXCESO ' +
           'WHERE DE_IDDEVOLPAGOEXCESO = PE_ID ' +
             'AND PE_CONTRATO = :Contrato ' +
             'AND DE_PERIODO = :Periodo ' +
             'AND PE_FECHABAJA IS NULL';
  dDevolucion := ValorSqlExtendedEx(sSql, [fraDevContrato.ContratoExt, sdqConsulta.FieldByName('PERIODO').AsString]);

  if dDevolucion > 0 then
    Result := (MsgBox('Ya existe una devolución de ' + Get_AjusteDecimales(FloatToStr(dDevolucion), '$') + ' para el periodo indicado. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    Result := True;
end;

function TfrmDevolPagoExcesoCons.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      PrimaryKey.Add('PE_USUARIO',  Sesion.UserID);
      PrimaryKey.Add('PE_PERIODO',  sdqConsulta.FieldByName('PERIODO').AsString);
      Fields.Add('PE_DEVOLUCION',   edPE_DEVOLUCION.Value, 2, True);
      Fields.Add('PE_BENEFICIARIO', Trim(edPE_BENEFICIARIO.Text));

      SqlType := stUpdate;
    end;

  Result := inherited DoABM;
end;

procedure TfrmDevolPagoExcesoCons.CalcTotales;
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

procedure TfrmDevolPagoExcesoCons.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmDevolPagoExcesoCons.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmDevolPagoExcesoCons.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('EMITIDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('EMITIDO')).Currency := True;

  if sdqConsulta.FieldByName('PAGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGADO')).Currency := True;

  if sdqConsulta.FieldByName('RECLAMO_AFIP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RECLAMO_AFIP')).Currency := True;

  if sdqConsulta.FieldByName('AJUSTE_SALDO_ACREEDOR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('AJUSTE_SALDO_ACREEDOR')).Currency := True;

  if sdqConsulta.FieldByName('DEVOLUCION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEVOLUCION')).Currency := True;
end;

procedure TfrmDevolPagoExcesoCons.tbGenerarPagoClick(Sender: TObject);
var
  IdZPE: TTableId;
  Sql: TSql;
  dTotales: Currency;
  sBeneficiario1, sBeneficiario2, sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT SUM(NVL(PE_DEVOLUCION, 0)), MAX(PE_BENEFICIARIO), MIN(PE_BENEFICIARIO) ' +
            'FROM TPE_DEVOLUCIONPAGOEXCESO ' +
           'WHERE PE_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
             'AND PE_DEVOLUCION > 0';
  SqlResults := ValoresColSql(sSql);
  try
    dTotales       := StrToFloatDef(SqlResults[0], 0);
    sBeneficiario1 := SqlResults[1];
    sBeneficiario2 := SqlResults[2];
  finally
    SqlResults.Free;
  end;

  Verificar(dTotales = 0, Grid, 'No ha cargado ninguna devolución.');
  Verificar(sBeneficiario1 <> sBeneficiario2, Grid, 'El beneficiario debe ser el mismo para todos los periodos del contrato.');

  if MsgBox('¿Está seguro de generar el pago? ', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        Sql := TSql.Create();
        try
          with Sql do
            begin
              Clear;
              TableName := 'ZPE_DEVOLUCIONPAGOEXCESO';

              IdZPE := GetSecNextVal('SEQ_ZPE_ID');

              PrimaryKey.Add('PE_ID',             IdZPE);
              Fields.Add('PE_CONTRATO',           fraDevContrato.ContratoExt);
              Fields.Add('PE_IMPORTE',            dTotales, dtNumber);
              Fields.Add('PE_BENEFICIARIO',       sBeneficiario1);
              Fields.Add('PE_FECHAALTA',          exDateTime);
              Fields.Add('PE_USUALTA',            Sesion.UserID);

              SqlType := stInsert;
              EjecutarSqlST(Sql);

              sdqConsulta.DisableControls;
              try
                sdqConsulta.First;
                while not sdqConsulta.Eof do
                  begin
                    if sdqConsulta.FieldByName('DEVOLUCION').AsCurrency > 0 then
                      begin
                        Clear;
                        TableName := 'ZDE_DETALLEDEVOLPAGOEXCESO';

                        PrimaryKey.Add('DE_ID',              GetSecNextVal('SEQ_ZDE_ID'));
                        Fields.Add('DE_IDDEVOLPAGOEXCESO',   IdZPE);
                        Fields.Add('DE_PERIODO',             sdqConsulta.FieldByName('PERIODO').AsString);
                        Fields.Add('DE_EMITIDO',             sdqConsulta.FieldByName('EMITIDO').AsCurrency, dtNumber);
                        Fields.Add('DE_PAGADO',              sdqConsulta.FieldByName('PAGADO').AsCurrency, dtNumber);
                        Fields.Add('DE_RECLAMOAFIP',         sdqConsulta.FieldByName('RECLAMO_AFIP').AsCurrency, dtNumber);
                        Fields.Add('DE_AJUSTESALDOACREEDOR', sdqConsulta.FieldByName('AJUSTE_SALDO_ACREEDOR').AsCurrency, dtNumber);
                        Fields.Add('DE_DEVOLUCION',          sdqConsulta.FieldByName('DEVOLUCION').AsCurrency, dtNumber);
                        Fields.Add('DE_FECHAALTA',           exDateTime);
                        Fields.Add('DE_USUALTA',             Sesion.UserID);

                        SqlType := stInsert;
                        EjecutarSqlST(Sql);
                      end;

                    sdqConsulta.Next;
                  end;
              finally
                sdqConsulta.EnableControls;
              end;  
            end;

          CommitTrans;
          MsgBox('El pago se generó correctamente.', MB_OK);

          tbLimpiarClick(nil);
        finally
          Sql.Free;
        end;
      except
        on E: Exception do
        begin
          RollBack;
          raise Exception.Create(E.Message + CRLF + 'Error al generar el pago.');
        end;
      end;
    end;
end;

end.

