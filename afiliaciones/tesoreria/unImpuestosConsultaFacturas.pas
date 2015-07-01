unit unImpuestosConsultaFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion,
  unfraVendedores, StdCtrls, PatternEdit, Mask, ToolEdit, DateComboBox, unCustomGridABM, FormPanel,
  CurrEdit, unArtDBAwareFrame, Menus, PeriodoPicker, unART, RxCurrEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmImpuestosConsultaFacturas = class(TfrmCustomGridABM)
    GBEntidad: TGroupBox;
    gbFactura: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    cmbfpIL_FECHA: TDateComboBox;
    edIL_NUMERO: TMaskEdit;
    edfpIL_NUMERO: TMaskEdit;
    edIL_MONTO: TCurrencyEdit;
    Label6: TLabel;
    pnlIL_FECHA: TPanel;
    cmbIL_FECHADesde: TDateComboBox;
    cmbIL_FECHAHasta: TDateComboBox;
    Panel1: TPanel;             
    tbSalir2: TToolButton;
    tbAprobar: TToolButton;                    
    ToolButton2: TToolButton;
    pnlIL_FECHAAPROBADO: TPanel;
    cmbIL_FECHAAPROBADODesde: TDateComboBox;
    cmbIL_FECHAAPROBADOHasta: TDateComboBox;
    Panel4: TPanel;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    fraIE_ID: TfraCodigoDescripcion;
    pnlIL_FECHAALTA: TPanel;
    cmbIL_FECHAALTADesde: TDateComboBox;
    cmbIL_FECHAALTAHasta: TDateComboBox;
    Panel3: TPanel;
    Label2: TLabel;
    edIL_OBSERVACIONES: TMemo;
    fraEntidad: TfraCodigoDescripcion;
    Label5: TLabel;
    Label7: TLabel;
    edIL_FECHAVENCIMIENTO: TDateComboBox;
    edIL_PERIODO: TPeriodoPicker;
    Label8: TLabel;
    pnlIL_FECHAVENCIMIENTO: TPanel;
    cmbIL_FECHAVENCIMIENTODesde: TDateComboBox;
    cmbIL_FECHAVENCIMIENTOHasta: TDateComboBox;
    Panel5: TPanel;
    pnlIL_PERIODO: TPanel;
    Panel6: TPanel;
    ppIL_PERIODODesde: TPeriodoPicker;
    ppIL_PERIODOHasta: TPeriodoPicker;
    Label9: TLabel;
    chkSoloActivas: TCheckBox;
    rgFacturas: TRadioGroup;
    tbAdjuntos: TToolButton;
    ToolButton9: TToolButton;
    mnuAdjuntos: TPopupMenu;
    mnuAdjuntosCargar: TMenuItem;
    mnuAdjuntosVisualizar: TMenuItem;
    OpenDialog: TOpenDialog;
    mnuAdjuntosEliminar: TMenuItem;
    tbAnular: TToolButton;
    ToolButton7: TToolButton;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); 
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure CompletarFactura(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure ppIL_PERIODODesdeExit(Sender: TObject);
    procedure tbAdjuntosClick(Sender: TObject);
    procedure mnuAdjuntosCargarClick(Sender: TObject);
    procedure mnuAdjuntosVisualizarClick(Sender: TObject);
    procedure mnuAdjuntosEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAnularClick(Sender: TObject);
  private
    FIDLiquidacion: Integer;
    FModoConsulta: Boolean;

    function GetIDFactura: Integer;
    procedure SetModoConsulta(const Value: Boolean);
    procedure CalcTotales;
    function GetIDEntidad: Integer;
    function GetProxNroLiquidacion: Integer;
    function Is_ExisteArchivoLiquidacionFilaActual(var NombreArchivo: String): Boolean;
   procedure Do_CambiarNombreArchivoLiq(IdLiq: TTableId; Archivo: String);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property ModoConsulta: boolean    read FModoConsulta        write SetModoConsulta;
    property IDLiquidacion: integer   read FIDLiquidacion       write FIDLiquidacion;
    property IDFactura: integer       read GetIDFactura;
    property IDEntidad: integer       read GetIDEntidad;
  end;

  TfrmImpuestosABMFacturas = class(TfrmImpuestosConsultaFacturas);
  {Como esta pantalla se llama desde 2 lugares <> con funcionalidades <>
   defino otra clase para que el FormStorage me guarde por separado los valores
   de posicion, altura, ancho, y columnas}

const
  MAXCOLS = 0;
  CAMPOS_SUMA : Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmImpuestosConsultaFacturas: TfrmImpuestosConsultaFacturas;
  TotalConsulta: array of extended;

implementation
              
uses
  unFiltros, AnsiSQL, CustomDlgs, unDmPrincipal, unSesion, SQLFuncs, unImpuestosDetalleLiquidaciones,
  General, StrFuncs, Numeros, VCLExtra, unComunes, DbFuncs, ArchFuncs, unTesoreria;

const
  SQL_ABM_1 = 'SELECT IE_ID, IE_CUIT CUIT_ENTIDAD, IE_NOMBRE NOM_ENTIDAD, ' +
                     'IL_NUMERO NUMERO, IL_FECHA FECHA, IL_MONTO IMPORTE, ' +
                     'IL_ID, IL_FECHAAPROBADO FECHAAPROBADO, TRUNC(IL_FECHABAJA) FECHABAJA, ' +
                     'IL_USUAPROBADO USUAPROBADO, IL_OBSERVACIONES OBSERVACIONES, ' +
                     'TRUNC(IL_FECHAALTA) FECHAALTA, IL_USUALTA USUALTA, IL_BENEFICIARIO BENEFICIARIO, ' +
                     'CE_ORDENPAGO OP, CE_NUMERO CHEQUE, CE_BENEFICIARIO BENEFICIARIOCH, CE_FECHAOP FECHA_OP, ' +
                     'IL_FECHAVENCIMIENTO FECHAVENCIMIENTO, IL_PERIODO PERIODO, ' +
                     'DECODE(IL_NOMBREARCHIVO, NULL, ''' + vNo + ''', ''' + vSi + ''') EXISTENOMBREARCHIVO, ' +
                     'CE_FECHACHEQUE FECHA_CHEQUE, CTBSIT.TB_DESCRIPCION SITUAC_DESCRIPCION, ' +
                     'CE_FECHASITUACION FECHA_SITUAC, CE_DEBITADO DEBITADO, CE_FECHADEBITADO FECHADEBITADO ' +
                'FROM CTB_TABLAS CTBSIT, RCE_CHEQUEEMITIDO, CONT.OIE_IMPENTIDAD, CONT.OIL_IMPLIQUIDACION ' +
               'WHERE IL_IDENTIDAD = IE_ID ' +
                 'AND IL_IDCHEQUEEMITIDO = CE_ID(+) ' +
                 'AND CE_SITUACION = CTBSIT.TB_CODIGO(+) ' +
                 'AND CTBSIT.TB_CLAVE(+) = ''SITCH'' ';

  SQL_CONSULTA = 'SELECT IL_NUMERO NUMERO, IL_FECHA FECHA, IL_MONTO IMPORTE, ' +
                        'IL_FECHAAPROBADO FECHAAPROBADO, IL_ID, TRUNC(IL_FECHABAJA) FECHABAJA, ' +
                        'IL_USUAPROBADO USUAPROBADO, IL_OBSERVACIONES OBSERVACIONES, ' +
                        'TRUNC(IL_FECHAALTA) FECHAALTA, IL_USUALTA USUALTA, IL_BENEFICIARIO BENEFICIARIO, ' +
                        'CE_ORDENPAGO OP, CE_NUMERO CHEQUE, CE_BENEFICIARIO BENEFICIARIOCH, CE_FECHAOP FECHA_OP, ' +
                        'IL_FECHAVENCIMIENTO FECHAVENCIMIENTO, IL_PERIODO PERIODO, ' +
                        'DECODE(IL_NOMBREARCHIVO, NULL, ''' + vNo + ''', ''' + vSi + ''') EXISTENOMBREARCHIVO ' +
                   'FROM CTB_TABLAS CTBSIT, RCE_CHEQUEEMITIDO, CONT.OIL_IMPLIQUIDACION, CONT.OID_IMPLIQUIDACIONDETALLE ' +
                  'WHERE ID_IDLIQUIDACION = IL_ID ' +
                    'AND ID_FECHABAJA IS NULL ' +
                    'AND IL_IDCHEQUEEMITIDO = CE_ID(+) ' +
                    'AND CE_SITUACION = CTBSIT.TB_CODIGO(+) ' +
                    'AND CTBSIT.TB_CLAVE(+) = ''SITCH'' ' +
                    'AND ID_IDLIQUIDACION = ';

{$R *.DFM}

procedure TfrmImpuestosConsultaFacturas.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una liquidación.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'La liquidación se encuentra dada de baja.');

  with TFrmImpuestosDetalleLiquidaciones.Create(Self) do
    begin
      IDLiquidacion := Self.sdqConsulta.FieldByName('IL_ID').AsInteger;

      ShowModal;
    end;

  tbRefrescarClick(nil);
end;

procedure TfrmImpuestosConsultaFacturas.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived  := False;
  ModoConsulta := False;

  FieldBaja := 'FECHABAJA';

  with fraIE_ID do
    begin
      ShowBajas   := True;
      TableName   := 'CONT.OIE_IMPENTIDAD';
      FieldID     := 'IE_ID';
      FieldCodigo := 'IE_ID';
      FieldDesc   := 'IE_NOMBRE';
      FieldBaja   := 'IE_FECHABAJA';
    end;

  with fraEntidad do
    begin
      ShowBajas   := False;
      TableName   := 'CONT.OIE_IMPENTIDAD';
      FieldID     := 'IE_ID';
      FieldCodigo := 'IE_ID';
      FieldDesc   := 'IE_NOMBRE';
      FieldBaja   := 'IE_FECHABAJA';
    end;

  VCLExtra.LockControls(edfpIL_NUMERO);
  
  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmImpuestosConsultaFacturas.tbRefrescarClick(Sender: TObject);
var
  sSQL, sSQLWhere: string;
begin
  if ActiveControl = edIL_NUMERO then
    CompletarFactura(edIL_NUMERO);

  if ModoConsulta then
    sSQL := SQL_CONSULTA + SQLValue(IDLiquidacion)
  else begin
    sSQLWhere := DoFiltro(GBEntidad);

    if edIL_NUMERO.Text <> '    -        ' then
      sSQLWhere := sSQLWhere + ' AND IL_NUMERO = ' + SQLValue(edIL_NUMERO.EditText);

    sSQLWhere := sSQLWhere + DoFiltro(pnlIL_FECHA) + DoFiltro(pnlIL_FECHAAPROBADO) + DoFiltro(pnlIL_FECHAALTA) +
                             DoFiltro(pnlIL_FECHAVENCIMIENTO) + DoFiltro(pnlIL_PERIODO);

    if chkSoloActivas.Checked then
      sSQLWhere := sSQLWhere + ' AND IL_FECHABAJA IS NULL';

    case rgFacturas.ItemIndex of
      1: sSQLWhere := sSQLWhere + ' AND IL_FECHAAPROBADO IS NOT NULL';   // aprobadas
      2: sSQLWhere := sSQLWhere + ' AND IL_FECHAAPROBADO IS NULL';       // no aprobadas
    end;

    sSQL := SQL_ABM_1 + sSQLWhere;
  end;

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmImpuestosConsultaFacturas.SetModoConsulta(const Value: boolean);
begin
  FModoConsulta := Value;

  if Value then
    begin
      BorderIcons := [biSystemMenu];
      WindowState := wsNormal;
      Constraints.MinHeight := 300;
      Constraints.MinWidth  := 300;
    end;

  pnlFiltros.Visible    := not Value;
  tbNuevo.Visible       := not Value;
  tbModificar.Visible   := not Value;
  tbEliminar.Visible    := not Value;
  tbLimpiar.Visible     := not Value;
  tbPropiedades.Visible := not Value;
  tbAprobar.Visible     := not Value;
  ToolButton5.Visible   := Value;
  ToolButton4.Visible   := Value;

  if Value then
    begin
      Grid.Columns[1].Destroy;
      Grid.Columns[0].Destroy;

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmImpuestosConsultaFacturas.ClearControls;
begin
  fraEntidad.Clear;                 

  edfpIL_NUMERO.EditText := LPad(GetProxNroLiquidacion(), '0', 12);
  CompletarFactura(edfpIL_NUMERO);

  cmbfpIL_FECHA.Date         := DBDate();
  edIL_PERIODO.Periodo.Valor := Get_PeriodoContableActivoImpuestos();
  edIL_MONTO.Clear;
  edIL_FECHAVENCIMIENTO.Clear;
  edIL_OBSERVACIONES.Clear;
end;

function TfrmImpuestosConsultaFacturas.DoABM: Boolean;
var
  sSQL, sMensaje: string;
  Control: TWinControl;
begin
  Sql.Clear;
  Sql.TableName := 'CONT.OIL_IMPLIQUIDACION';

  if (ModoABM = maBaja) or (ModoABM = maModificacion) then
    begin
      sSQL := 'SELECT 1 ' +
                'FROM CONT.OID_IMPLIQUIDACIONDETALLE ' +
               'WHERE ID_IDLIQUIDACION = :Id ' +
                 'AND ID_FECHABAJA IS NULL';

      if ModoABM = maBaja then
        begin
          sMensaje := 'No es posible dar de baja una liquidación con detalles de liquidaciones asociadas.';
          Control  := Grid;
        end
      else
        begin
          sMensaje := 'No es posible actualizar una liquidación con detalles de liquidaciones asociadas.';
          Control  := btnAceptar;
        end;

      Verificar(ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('IL_ID').AsInteger]), Control, sMensaje);
    end;

  if ModoABM = maBaja then
    begin
       Sql.PrimaryKey.Add('IL_ID',                  sdqConsulta.FieldByName('IL_ID').AsInteger);
       Sql.Fields.Add('IL_FECHABAJA',               exDateTime);
       Sql.Fields.Add('IL_USUBAJA',                 Sesion.UserID);
       Sql.SqlType := stUpdate;
    end
  else
    begin
      if ModoABM = maAlta then
        begin
           Sql.PrimaryKey.AddExpression('IL_ID',    'CONT.SEQ_OIL_ID.NEXTVAL');
           Sql.Fields.Add('IL_FECHAALTA',           exDateTime);
           Sql.Fields.Add('IL_USUALTA',             Sesion.UserID);
           Sql.SqlType := stInsert;
        end
      else
        begin
           Sql.PrimaryKey.Add('IL_ID',              sdqConsulta.FieldByName('IL_ID').AsInteger);
           Sql.Fields.Add('IL_FECHAMODIF',          exDateTime);
           Sql.Fields.Add('IL_USUMODIF',            Sesion.UserID);
           Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('IL_IDENTIDAD',                fraEntidad.Value);
      Sql.Fields.Add('IL_NUMERO',                   edfpIL_NUMERO.EditText);
      Sql.Fields.Add('IL_FECHA',                    cmbfpIL_FECHA.Date);
      Sql.Fields.Add('IL_MONTO',                    edIL_MONTO.Value, dtNumber);

      if edIL_FECHAVENCIMIENTO.IsEmpty then
        Sql.Fields.Add('IL_FECHAVENCIMIENTO',       exNull)
      else
        Sql.Fields.Add('IL_FECHAVENCIMIENTO',       edIL_FECHAVENCIMIENTO.Date);

      Sql.Fields.Add('IL_PERIODO',                  edIL_PERIODO.Periodo.Valor);
      Sql.Fields.Add('IL_OBSERVACIONES',            Trim(edIL_OBSERVACIONES.Lines.Text));
    end;

  Result := inherited DoABM;
end;

procedure TfrmImpuestosConsultaFacturas.LoadControls;
begin
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación ya ha sido aprobada.');

  ClearControls;

  fraEntidad.Value              := sdqConsulta.FieldByName('IE_ID').AsInteger;
  edfpIL_NUMERO.Text            := sdqConsulta.FieldByName('NUMERO').AsString;
  cmbfpIL_FECHA.Date            := sdqConsulta.FieldByName('FECHA').AsDateTime;
  edIL_MONTO.Value              := sdqConsulta.FieldByName('IMPORTE').AsCurrency;
  edIL_FECHAVENCIMIENTO.Date    := sdqConsulta.FieldByName('FECHAVENCIMIENTO').AsDateTime;
  edIL_PERIODO.Periodo.Valor    := sdqConsulta.FieldByName('PERIODO').AsString;
  edIL_OBSERVACIONES.Lines.Text := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
end;

function TfrmImpuestosConsultaFacturas.Validar: Boolean;
begin
  if ActiveControl = edfpIL_NUMERO then
    CompletarFactura(edfpIL_NUMERO);

  Verificar(fraEntidad.IsEmpty, fraEntidad, 'Debe completar la entidad a la que pertenece la liquidación.');

  Verificar(ExisteSQLEx('SELECT 1 FROM CONT.OIL_IMPLIQUIDACION WHERE IL_NUMERO = :NRO AND IL_ID <> :ID AND IL_FECHABAJA IS NULL', [edfpIL_NUMERO.EditText, IDFactura]), edfpIL_NUMERO, 'El número de la liquidación no puede repetirse.');
  Verificar(cmbfpIL_FECHA.IsEmpty, cmbfpIL_FECHA, 'Debe completar la fecha de la liquidación.');
  Verificar(not edIL_FECHAVENCIMIENTO.IsEmpty and (edIL_FECHAVENCIMIENTO.Date < DBDate()), edIL_FECHAVENCIMIENTO, 'La fecha de vencimiento no puede ser menor a la fecha actual.');
  Verificar(edIL_MONTO.Value = 0, edIL_MONTO, 'Debe completar el importe de la liquidación.');

  Result := True;
end;

procedure TfrmImpuestosConsultaFacturas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraIE_ID.Clear;
  edIL_NUMERO.Clear;
  cmbIL_FECHADesde.Clear;
  cmbIL_FECHAHasta.Clear;
  cmbIL_FECHAAPROBADODesde.Clear;
  cmbIL_FECHAAPROBADOHasta.Clear;
  cmbIL_FECHAALTADesde.Clear;
  cmbIL_FECHAALTAHasta.Clear;
  cmbIL_FECHAVENCIMIENTODesde.Clear;
  cmbIL_FECHAVENCIMIENTOHasta.Clear;
  ppIL_PERIODODesde.Clear;
  ppIL_PERIODOHasta.Clear;
  chkSoloActivas.Checked := True;
  rgFacturas.ItemIndex   := 0;   // Todas
end;

procedure TfrmImpuestosConsultaFacturas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
    begin
      if Assigned(FindField('IMPORTE')) then
        TFloatField(FieldByName('IMPORTE')).Currency := True;
    end;
end;

procedure TfrmImpuestosConsultaFacturas.CompletarFactura(Sender: TObject);
begin
  TMaskEdit(Sender).Text := Get_NroFacturaCompleto(TMaskEdit(Sender).Text);
end;

function TfrmImpuestosConsultaFacturas.GetIDFactura: integer;
begin
  case ModoABM of
    maModificacion, maBaja:
      Result := sdqConsulta.FieldByName('IL_ID').AsInteger;
  else
    Result := ART_EMPTY_ID;
  end;
end;

procedure TfrmImpuestosConsultaFacturas.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'La liquidación ya se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación ya ha sido aprobada.');

  inherited;
end;

procedure TfrmImpuestosConsultaFacturas.tbAprobarClick(Sender: TObject);
var                                     
  sBeneficiario, sSql: String;
  dDiferencia, dTotalDet: Currency;
  IdLiq: TTableId;
  tsBeneficiario: TStringList;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'No se puede aprobar una liquidación dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación ya ha sido aprobada.');

  dTotalDet   := GetTotalDetalleLiquidacion(sdqConsulta.FieldByName('IL_ID').AsInteger);
  dDiferencia := sdqConsulta.FieldByName('IMPORTE').AsFloat - dTotalDet;
  Verificar(dDiferencia <> 0, nil, 'El total de los detalles de liquidaciones debe ser igual al importe de la liquidación (diferencia: ' + Get_AjusteDecimales(FloatToStr(dDiferencia), '$') + ').');

  IdLiq := sdqConsulta.FieldByName('IL_ID').AsInteger;

  sSql := 'SELECT MAX(IX_BENEFICIARIO) BENEFICIARIO ' +
            'FROM CONT.OIC_IMPCONCEPTO, CONT.OID_IMPLIQUIDACIONDETALLE, CONT.OIX_IMPENTIDADCONCEPTO ' +
           'WHERE IX_IDCONCEPTO = IC_ID ' +
             'AND ID_IDCONCEPTO = IC_ID ' +
             'AND IX_FECHABAJA IS NULL ' +
             'AND ID_FECHABAJA IS NULL ' +
             'AND ID_IDLIQUIDACION = :IdLiquidacion';
  sBeneficiario := ValorSqlEx(sSql, [IdLiq]);

  tsBeneficiario := TStringList.Create;
  try
    tsBeneficiario.Text := sBeneficiario;
    if InputMemoBox('Verifique el Beneficiario', tsBeneficiario, False, 400, 'Tahoma', True, True, 1, ecUpperCase) then
      begin
        sSql := 'UPDATE CONT.OIL_IMPLIQUIDACION ' +
                   'SET IL_USUAPROBADO = :UsuAprobado, ' +
                       'IL_FECHAAPROBADO = ACTUALDATE, ' +
                       'IL_BENEFICIARIO = :Beneficiario ' +
                 'WHERE IL_ID = :Id';
        EjecutarSqlEx(sSql, [Sesion.UserId, Trim(tsBeneficiario.Text), IdLiq]);

        MsgBox('Liquidación aprobada correctamente.', MB_ICONINFORMATION);
        RefreshData;
      end;
  finally
    tsBeneficiario.Free;
  end;
end;

procedure TfrmImpuestosConsultaFacturas.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmImpuestosConsultaFacturas.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmImpuestosConsultaFacturas.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmImpuestosConsultaFacturas.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

function TfrmImpuestosConsultaFacturas.GetIDEntidad: Integer;
begin
  Result := fraEntidad.Value;
end;

procedure TfrmImpuestosConsultaFacturas.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'La liquidación se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación se encuentra aprobada.');

  inherited;
end;

function TfrmImpuestosConsultaFacturas.GetProxNroLiquidacion: Integer;
var
  sSql: String;
begin
  sSql := 'SELECT NVL(MAX(REPLACE(IL_NUMERO, ''-'')), 0) + 1 ' +
            'FROM CONT.OIL_IMPLIQUIDACION ' +
           'WHERE IL_FECHABAJA IS NULL';

  Result := ValorSqlInteger(sSql);
end;

procedure TfrmImpuestosConsultaFacturas.ppIL_PERIODODesdeExit(Sender: TObject);
begin
  if IsEmptyString(ppIL_PERIODOHasta.Periodo.Valor) then
    ppIL_PERIODOHasta.Periodo.Valor := ppIL_PERIODODesde.Periodo.Valor;
end;

procedure TfrmImpuestosConsultaFacturas.tbAdjuntosClick(Sender: TObject);
begin
  tbAdjuntos.CheckMenuDropdown;
end;

procedure TfrmImpuestosConsultaFacturas.mnuAdjuntosCargarClick(Sender: TObject);
var
  sExt, sNombreArchivoServidor, sNombreArchivo: String;
  IdLiq: TTableId;
  bContinuar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'La liquidación se encuentra dada de baja.');

  if sdqConsulta.FieldByName('EXISTENOMBREARCHIVO').AsString = vSI then
    bContinuar := (MsgBox('La liquidación ya tiene un archivo asociado. ¿Desea sobreescribirlo?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    bContinuar := True;

  if bContinuar then
    with OpenDialog do
      begin
        Title      := 'Archivo de la Liquidación';
        Filter     := 'Todos los archivos (*.*)|*.*';

        if Execute then
          begin
            sNombreArchivo         := OpenDialog.FileName;
            IdLiq                  := sdqConsulta.FieldByName('IL_ID').AsInteger;
            sExt                   := GetFormatoArchivo(sNombreArchivo);
            sNombreArchivoServidor := Get_NombreArchivoLiquidacionImpuesto(IdLiq, sExt);

            CopyFileExt(sNombreArchivo, sNombreArchivoServidor, False);

            if FileExists(sNombreArchivoServidor) then
              begin
                Do_CambiarNombreArchivoLiq(IdLiq, sNombreArchivoServidor);

                MsgBox('Archivo adjunto de la liquidación cargado correctamente.', MB_ICONINFORMATION);
                RefreshData;
              end
            else
              MsgBox('Error al cargar el archivo adjunto de la liquidación', MB_ICONERROR);
          end;
      end;
end;

function TfrmImpuestosConsultaFacturas.Is_ExisteArchivoLiquidacionFilaActual(var NombreArchivo: String): Boolean;
var
  IdLiq: TTableId;
  bExiste: Boolean;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      IdLiq:= sdqConsulta.FieldByName('IL_ID').AsInteger;

      bExiste := Is_ExisteArchivoLiquidacionImpuesto(IdLiq, NombreArchivo);
    end
  else
    bExiste := False;

  Result := bExiste;
end;

procedure TfrmImpuestosConsultaFacturas.mnuAdjuntosVisualizarClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not Is_ExisteArchivoLiquidacionFilaActual(sNombreArchivo), nil, 'La liquidación no tiene un archivo adjunto.');

  Do_ImprimirArchivoLiquidacionImpuesto(sNombreArchivo);
end;

procedure TfrmImpuestosConsultaFacturas.mnuAdjuntosEliminarClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not Is_ExisteArchivoLiquidacionFilaActual(sNombreArchivo), nil, 'La liquidación no tiene un archivo adjunto.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación se encuentra aprobada.');
  Verificar(not FileExists(sNombreArchivo), nil, 'El archivo adjunto: ' + sNombreArchivo + ' no existe.');

  if MsgBox('¿Está seguro que desea borrar el archivo adjunto seleccionado?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      Verificar(not DeleteFile(sNombreArchivo), nil, 'No se pudo borrar el archivo adjunto: ' + sNombreArchivo + '.');

      Do_CambiarNombreArchivoLiq(sdqConsulta.FieldByName('IL_ID').AsInteger, '');

      MsgBox('Archivo adjunto de la liquidación borrado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmImpuestosConsultaFacturas.Do_CambiarNombreArchivoLiq(IdLiq: TTableId; Archivo: String);
var
  sSql: String;
begin
  sSql := 'UPDATE CONT.OIL_IMPLIQUIDACION ' +
             'SET IL_NOMBREARCHIVO = :NombreArch ' +
           'WHERE IL_ID = :Id';
  EjecutarSqlEx(sSql, [Archivo, IdLiq]);
end;

procedure TfrmImpuestosConsultaFacturas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Assigned(Field) then
    if AreIn(Field.FullName, ['EXISTENOMBREARCHIVO']) then
      begin
        AFont.Style := AFont.Style + [fsBold];
        if Field.Value = vSI then
          AFont.Color := clTeal
        else
          AFont.Color := clMaroon;
      end;
end;

procedure TfrmImpuestosConsultaFacturas.tbAnularClick(Sender: TObject);
var
  sSql: String;
  IdOIL, IdLiq: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'No se puede anular una liquidación dada de baja.');
  Verificar(sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La liquidación no se encuentra aprobada.');

  if MsgBox('¿Confirma la anulación de la liquidación?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        IdLiq := sdqConsulta.FieldByName('IL_ID').AsInteger;
        IdOIL := GetSecNextVal('CONT.SEQ_OIL_ID');

        edfpIL_NUMERO.EditText := LPad(GetProxNroLiquidacion(), '0', 12);
        CompletarFactura(edfpIL_NUMERO);


        sSql := 'INSERT INTO CONT.OIL_IMPLIQUIDACION ' +
                       '(IL_ID, IL_IDENTIDAD, IL_FECHA, IL_NUMERO, IL_MONTO, IL_OBSERVACIONES, ' +
                       'IL_FECHAALTA, IL_USUALTA, IL_FECHAVENCIMIENTO, IL_PERIODO, ' +
                       'IL_IDCHEQUEEMITIDO, IL_NOMBREARCHIVO, IL_BENEFICIARIO) ' +
                'SELECT :IdLquid, IL_IDENTIDAD, TRUNC(SYSDATE), :Numero, -IL_MONTO, ''Anula liquidación Nro. '' || TRIM(IL_NUMERO), ' +
                       'SYSDATE, :Usuario, IL_FECHAVENCIMIENTO, IL_PERIODO, ' +
                       'IL_IDCHEQUEEMITIDO, IL_NOMBREARCHIVO, IL_BENEFICIARIO ' +
                  'FROM CONT.OIL_IMPLIQUIDACION ' +
                 'WHERE IL_ID = :Id';
        EjecutarSqlSTEx(sSql, [IdOIL, edfpIL_NUMERO.EditText, Sesion.UserId, IdLiq]);

        sSql := 'INSERT INTO CONT.OID_IMPLIQUIDACIONDETALLE ' +
                       '(ID_ID, ID_IDCONCEPTO, ID_IDLIQUIDACION, ID_IMPORTE, ' +
                        'ID_OBSERVACIONES, ID_FECHAALTA, ID_USUALTA) ' +
                'SELECT CONT.SEQ_OID_ID.NEXTVAL, ID_IDCONCEPTO, :IdLiq, -ID_IMPORTE, ' +
                       'ID_OBSERVACIONES, SYSDATE, :Usuario ' +
                  'FROM CONT.OID_IMPLIQUIDACIONDETALLE ' +
                 'WHERE ID_IDLIQUIDACION = :Id';
        EjecutarSqlSTEx(sSql, [IdOIL, Sesion.UserId, IdLiq]);

        CommitTrans;
        MsgBox('Liquidación anulada correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E: Exception do
          begin
            Rollback;
            raise Exception.Create(E.Message + CRLF + 'Error al anular la liquidación.');
          end;
      end;
    end;
end;

end.

