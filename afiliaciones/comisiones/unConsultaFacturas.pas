unit unConsultaFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unfraEntidadCUIT, unArtFrame, unFraCodigoDescripcion,
  unfraVendedores, unfraVendedoresCUIT, StdCtrls, PatternEdit, Mask, ToolEdit, DateComboBox, unCustomGridABM, FormPanel,
  CurrEdit, unArtDBAwareFrame, Menus;

type
  TfrmConsultaFacturas = class(TfrmCustomGridABM)
    GBVendedor: TGroupBox;
    fraVE_ID: TfraVendedoresCUIT;
    GBEntidad: TGroupBox;
    fraEN_ID: TfraEntidadCUIT;
    gbFactura: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cmbfpFC_FECHAFACTURA: TDateComboBox;
    cmbfpFC_FECHARECEPFACT: TDateComboBox;
    edFC_FACTURANRO: TMaskEdit;
    edfpFC_FACTURANRO: TMaskEdit;
    edFC_IMPORTE: TCurrencyEdit;
    Label6: TLabel;
    gbfpVendedor: TGroupBox;
    fraVendedoresCUIT: TfraVendedoresCUIT;
    gbfpEntidad: TGroupBox;
    fraEntidadCUIT: TfraEntidadCUIT;
    edfpFC_FACTURATIPO: TPatternEdit;
    pnlFC_FECHAFACTURA: TPanel;
    cmbFC_FECHAFACTURADesde: TDateComboBox;
    cmbFC_FECHAFACTURAHasta: TDateComboBox;
    pnlFC_FECHARECEPFACT: TPanel;
    cmbFC_FECHARECEPFACTDesde: TDateComboBox;
    cmbFC_FECHARECEPFACTHasta: TDateComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    rgFacturas: TRadioGroup;             
    tbSalir2: TToolButton;
    tbAprobar: TToolButton;                    
    ToolButton2: TToolButton;
    pmImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirFactAprob: TMenuItem;
    chkSinAplicar: TCheckBox;
    pnlFC_FECHAAPROBADO: TPanel;
    cmbFC_FECHAAPROBADODesde: TDateComboBox;
    cmbFC_FECHAAPROBADOHasta: TDateComboBox;
    Panel4: TPanel;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    mnuImprimirFactAprobadasFecha: TMenuItem;
    mnuImprimirFactAprobadasActual: TMenuItem;
    chkSoloActivas: TCheckBox;
    tbDesaprobar: TToolButton;
    procedure CambioEntidad(Sender: TObject);
    procedure CambioVendedor(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); 
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpCambioVendedores(Sender: TObject);
    procedure fpCambioEntidad(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure CompletarFactura(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure mnuImprimirFactAprobadasFechaClick(Sender: TObject);
    procedure tbDesaprobarClick(Sender: TObject);
  private
    FIDLiquidacion: Integer;
    FModoConsulta: Boolean;

    function GetIDFactura: Integer;
    function GetIDVendedor: Integer;
    procedure SetModoConsulta(const Value: Boolean);
    procedure VerificarTipoFactura;
    procedure CalcTotales;
  protected
    function  DoABM: Boolean; override;
    function  Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property ModoConsulta: boolean read FModoConsulta write SetModoConsulta;
    property IDLiquidacion: integer read FIDLiquidacion write FIDLiquidacion;
    property IDFactura: integer read GetIDFactura;
    property IDVendedor: integer read GetIDVendedor;
  end;

  TfrmABMFacturas = class(TfrmConsultaFacturas);
  {Como esta pantalla se llama desde 2 lugares <> con funcionalidades <>
   defino otra clase para que el FormStorage me guarde por separado los valores
   de posicion, altura, ancho, y columnas}

const
  MAXCOLS = 0;
  CAMPOS_SUMA : Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmConsultaFacturas: TfrmConsultaFacturas;
  TotalConsulta: array of extended;

implementation

uses
  unFiltros, AnsiSQL, CustomDlgs, unDmPrincipal, unSesion, SQLFuncs, unLiquidacionesAplicadas,
  General, StrFuncs, Numeros, unART, VCLExtra, unComunes, unRptFacturasAprobadas, DbFuncs,
  unDmFinancials;
                    
const
  SQL_ABM_1: string = 'SELECT EN_ID, EN_CODBANCO COD_ENTIDAD, EN_CUIT CUIT_ENTIDAD, EN_NOMBRE NOM_ENTIDAD,' +
                            ' VE_ID, VE_VENDEDOR COD_VENDEDOR, VE_CUIT CUIT_VENDEDOR, VE_NOMBRE NOM_VENDEDOR,' +
                            ' EV_ID, FC_FACTURATIPO TIPO, FC_FACTURANRO NUMERO, FC_FECHAFACTURA FECHA,' +
                            ' FC_FECHARECEPFACT FECHA_RECEPCION, FC_IMPORTE IMPORTE,' +
                            ' FC_ID, ART.COMISION.GET_MONTOSINAPLICARFACTURA(FC_ID) SIN_APLICAR,' +
                            ' FC_FECHAAPROBADO FECHAAPROBADO, EN_FECHAREVISION FECHAREVISION, ' +
                            ' TRUNC(FC_FECHABAJA) FECHABAJA, FC_IDCHEQUEEMITIDO IDCHEQUEEMITIDO ' +
                       ' FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA' +
                      ' WHERE EN_ID = FC_IDENTIDAD' +
                        ' AND EV_ID = FC_IDENTIDADVEND' +
                        ' AND VE_ID = EV_IDVENDEDOR' +
                        ' AND EN_MODOLIQ <> ''02''';

  SQL_ABM_2: string = 'SELECT EN_ID, EN_CODBANCO COD_ENTIDAD, EN_CUIT CUIT_ENTIDAD, EN_NOMBRE NOM_ENTIDAD,' +
                            ' VE_ID, VE_VENDEDOR COD_VENDEDOR, VE_CUIT CUIT_VENDEDOR, VE_NOMBRE NOM_VENDEDOR,' +
                            ' EV_ID, FC_FACTURATIPO TIPO, FC_FACTURANRO NUMERO, FC_FECHAFACTURA FECHA,' +
                            ' FC_FECHARECEPFACT FECHA_RECEPCION, FC_IMPORTE IMPORTE,' +
                            ' FC_ID, ART.COMISION.GET_MONTOSINAPLICARFACTURA(FC_ID) SIN_APLICAR,' +
                            ' FC_FECHAAPROBADO FECHAAPROBADO, VE_FECHAREVISION FECHAREVISION,' +
                            ' TRUNC(FC_FECHABAJA) FECHABAJA, FC_IDCHEQUEEMITIDO IDCHEQUEEMITIDO' +
                       ' FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA' +
                      ' WHERE EV_ID = FC_IDENTIDADVEND' +
                        ' AND EN_MODOLIQ = ''02''' +
                        ' AND VE_ID = EV_IDVENDEDOR' +
                        ' AND EN_ID = EV_IDENTIDAD';

  SQL_CONSULTA: string = 'SELECT FC_FACTURATIPO TIPO, FC_FACTURANRO NUMERO, FC_FECHAFACTURA FECHA,' +
                               ' FC_FECHARECEPFACT FECHA_RECEPCION, FC_IMPORTE IMPORTE, ' +
                               ' FC_FECHAAPROBADO FECHAAPROBADO, FC_ID, TRUNC(FC_FECHABAJA) FECHABAJA, ' +
                               ' FC_IDCHEQUEEMITIDO IDCHEQUEEMITIDO ' +
                          ' FROM XLF_LIQFACTURA, XFC_FACTURA' +
                         ' WHERE FC_ID = LF_IDFACTURA' +
                           ' AND LF_FECHABAJA IS NULL' +
                           ' AND LF_IDLIQCOMISION = ';

{$R *.DFM}

procedure TfrmConsultaFacturas.CambioEntidad(Sender: TObject);
begin
  inherited;
  fraEN_ID.FrameExit(Sender);
  fraVE_ID.Entidad := fraEN_ID.Value;
end;

procedure TfrmConsultaFacturas.CambioVendedor(Sender: TObject);
begin
  inherited;
  fraVE_ID.FrameExit(Sender);

//  if fraVE_ID.IsSelected then
//    fraEN_ID.Value := fraVE_ID.Entidad;
end;

procedure TfrmConsultaFacturas.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una factura.');

  // Ver Liquidaciones...
  with TfrmLiquidacionesAplicadas.Create(Self) do
  begin
    IDFactura     := Self.sdqConsulta.FieldByName('FC_ID').AsInteger;
    IDEntVend     := Self.sdqConsulta.FieldByName('EV_ID').AsInteger;
    IDVendedor    := Self.sdqConsulta.FieldByName('VE_ID').AsInteger;
    MontoFact     := Self.sdqConsulta.FieldByName('SIN_APLICAR').AsCurrency;
    NroFactura    := Self.sdqConsulta.FieldByName('NUMERO').AsString;
    FechaAprobado := Self.sdqConsulta.FieldByName('FECHAAPROBADO').AsDateTime;
    ShowModal;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmConsultaFacturas.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived  := False;
  ModoConsulta := False;

  FieldBaja := 'FECHABAJA';

  fraEN_ID.OnChange := CambioEntidad;
  fraVE_ID.OnChange := CambioVendedor;

  fraEntidadCUIT.OnChange    := fpCambioEntidad;
  fraVendedoresCUIT.OnChange := fpCambioVendedores;

  fraEntidadCUIT.ExtraFields    := ',EN_MODOLIQ, EN_IVA ';
  fraVendedoresCUIT.ExtraFields := ',VE_IVA ';

  fraEN_ID.ShowBajas := True;
  fraVE_ID.ShowBajas := True;

  fraEntidadCUIT.ShowBajas           := True;
  fraVendedoresCUIT.ShowBajas        := True;
  fraVendedoresCUIT.ShowBajasEntVend := False;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmConsultaFacturas.tbRefrescarClick(Sender: TObject);
var
  sSQL, sSQLWhere: string;
begin
  if ActiveControl = edFC_FACTURANRO then
    CompletarFactura(edFC_FACTURANRO);

  if ModoConsulta then
    sSQL := SQL_CONSULTA + SQLValue(IDLiquidacion)
  else begin
    sSQLWhere := DoFiltro(GBEntidad) + DoFiltro(GBVendedor);

    if edFC_FACTURANRO.Text <> '    -        ' then
      sSQLWhere := sSQLWhere + ' AND FC_FACTURANRO = ' + SQLValue(edFC_FACTURANRO.EditText);

    sSQLWhere := sSQLWhere + DoFiltro(pnlFC_FECHAFACTURA) + DoFiltro(pnlFC_FECHARECEPFACT) + DoFiltro(pnlFC_FECHAAPROBADO);

    if chkSinAplicar.Checked then
      sSQLWhere := sSQLWhere + ' AND ART.COMISION.GET_MONTOSINAPLICARFACTURA(FC_ID) > 0 ';

    if chkSoloActivas.Checked then
      sSQLWhere := sSQLWhere + ' AND FC_FECHABAJA IS NULL';

    case rgFacturas.ItemIndex of
      1: sSQLWhere := sSQLWhere + ' AND FC_FECHAAPROBADO IS NOT NULL';   // aprobadas
      2: sSQLWhere := sSQLWhere + ' AND FC_FECHAAPROBADO IS NULL';       // no aprobadas
    end;

    sSQL := SQL_ABM_1 + sSQLWhere + ' UNION ALL ' + SQL_ABM_2 + sSQLWhere;
  end;

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmConsultaFacturas.SetModoConsulta(const Value: boolean);
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
    Grid.Columns[11].Destroy;
    Grid.Columns[5].Destroy;
    Grid.Columns[4].Destroy;
    Grid.Columns[3].Destroy;
    Grid.Columns[2].Destroy;
    Grid.Columns[1].Destroy;
    Grid.Columns[0].Destroy;

    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsultaFacturas.ClearControls;
begin
  fraEntidadCUIT.Clear;
  fraVendedoresCUIT.Clear;
  edfpFC_FACTURATIPO.Clear;
  edfpFC_FACTURANRO.Clear;
  cmbfpFC_FECHAFACTURA.Clear;
  cmbfpFC_FECHARECEPFACT.Clear;
  edFC_IMPORTE.Clear;
end;

function TfrmConsultaFacturas.DoABM: Boolean;
var
  sSQL, sMensaje: string;
  Control: TWinControl;
begin
  Sql.Clear;
  Sql.TableName := 'XFC_FACTURA';

  if (ModoABM = maBaja) or (ModoABM = maModificacion) then
  begin
    sSQL := 'SELECT 1' +
             ' FROM XLF_LIQFACTURA' +
            ' WHERE LF_IDFACTURA = :Id' +
              ' AND LF_FECHABAJA IS NULL';

    if ModoABM = maBaja then
    begin
      sMensaje := 'No es posible dar de baja una factura con liquidaciones asociadas.';
      Control  := Grid;
    end
    else begin
      sMensaje := 'No es posible actualizar una factura con liquidaciones asociadas.';
      Control  := btnAceptar;
    end;

    Verificar(ExisteSQLEx(sSQL, [sdqConsulta.FieldByName('FC_ID').AsInteger]),
              Control, sMensaje);
  end;

  if ModoABM = maBaja Then begin
     Sql.PrimaryKey.Add('FC_ID', sdqConsulta.FieldByName('FC_ID').AsInteger);
     Sql.Fields.Add('FC_FECHABAJA', exDateTime);
     Sql.Fields.Add('FC_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else begin
      if ModoABM = maAlta Then begin
         Sql.PrimaryKey.AddExpression('FC_ID', 'SEQ_XFC_ID.NEXTVAL');
         Sql.Fields.Add('FC_FECHAALTA', exDateTime);
         Sql.Fields.Add('FC_USUALTA', Sesion.UserID);
         Sql.SqlType := stInsert;
      end else begin
         Sql.PrimaryKey.Add('FC_ID', sdqConsulta.FieldByName('FC_ID').AsInteger);
         Sql.Fields.Add('FC_FECHAMODIF', exDateTime);
         Sql.Fields.Add('FC_USUMODIF', Sesion.UserID);
         Sql.SqlType := stUpdate;
      end;

      Sql.Fields.Add('FC_IDENTIDAD', fraEntidadCUIT.Value);
      Sql.Fields.Add('FC_IDENTIDADVEND', fraVendedoresCUIT.sdqDatos.FieldByName('EV_ID').AsString);
      Sql.Fields.Add('FC_FACTURATIPO', edfpFC_FACTURATIPO.Text);
      Sql.Fields.Add('FC_FACTURANRO', edfpFC_FACTURANRO.EditText);
      Sql.Fields.Add('FC_FECHAFACTURA', cmbfpFC_FECHAFACTURA.Date);
      Sql.Fields.Add('FC_FECHARECEPFACT', cmbfpFC_FECHARECEPFACT.Date);
      Sql.Fields.Add('FC_IMPORTE', edFC_IMPORTE.Value, dtNumber);
  end;

  Result := inherited DoABM;
end;

procedure TfrmConsultaFacturas.LoadControls;
begin
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La factura ya ha sido aprobada.');

  ClearControls;
  fraEntidadCUIT.Value        := sdqConsulta.FieldByName('EN_ID').AsInteger;
  fraVendedoresCUIT.Value     := sdqConsulta.FieldByName('VE_ID').AsInteger;
  edfpFC_FACTURATIPO.Text     := sdqConsulta.FieldByName('TIPO').AsString;
  edfpFC_FACTURANRO.Text      := sdqConsulta.FieldByName('NUMERO').AsString;
  cmbfpFC_FECHAFACTURA.Date   := sdqConsulta.FieldByName('FECHA').AsDateTime;
  cmbfpFC_FECHARECEPFACT.Date := sdqConsulta.FieldByName('FECHA_RECEPCION').AsDateTime;
  edFC_IMPORTE.Value          := sdqConsulta.FieldByName('IMPORTE').AsCurrency;
  VCLExtra.LockControl(edfpFC_FACTURATIPO, True);
end;

function TfrmConsultaFacturas.Validar: Boolean;
var
  sSql: String;
begin
  if ActiveControl = edfpFC_FACTURANRO then
    CompletarFactura(edfpFC_FACTURANRO);

  Verificar(fraEntidadCUIT.IsEmpty, fraEntidadCUIT.edEN_CODBANCO, 'Debe completar la entidad a la que pertenece la factura.');
  Verificar(fraVendedoresCUIT.IsEmpty, fraVendedoresCUIT.edCodigo, 'Debe completar el vendedor al que pertenece la factura.');

  sSql := 'SELECT 1 ' +
            'FROM XEV_ENTIDADVENDEDOR ' +
           'WHERE EV_IDENTIDAD = :IdEnt ' +
             'AND EV_IDVENDEDOR = :IdVend';
  Verificar(not ExisteSqlEx(sSql, [fraEntidadCUIT.Value, fraVendedoresCUIT.Value]), fraEntidadCUIT.edEN_CODBANCO, 'No existe la relacion entidad-vendedor.');

  Verificar(edfpFC_FACTURATIPO.Text = '', edfpFC_FACTURATIPO, 'Debe completar el tipo de factura.');
  Verificar(edfpFC_FACTURANRO.Text = '    -        ', edfpFC_FACTURANRO, 'Debe completar el número de la factura.');
  Verificar(not IsNumber(Copy(edfpFC_FACTURANRO.Text, 1, 4) + Copy(edfpFC_FACTURANRO.Text, 6, MAXINT)), edfpFC_FACTURANRO, 'El número de la factura tiene un formato erróneo.');
  Verificar(ExisteSQLEx('SELECT 1 FROM XEV_ENTIDADVENDEDOR, XFC_FACTURA WHERE FC_FACTURATIPO = :TIPO AND FC_FACTURANRO = :NRO AND FC_ID <> :ID AND FC_IDENTIDADVEND = EV_ID AND EV_IDVENDEDOR = :IDVENDEDOR AND FC_FECHABAJA IS NULL', [edfpFC_FACTURATIPO.EditText, edfpFC_FACTURANRO.EditText, IDFactura, IDVendedor]), edfpFC_FACTURANRO, 'El número de la factura no puede repetirse.');
  Verificar(cmbfpFC_FECHAFACTURA.IsEmpty, cmbfpFC_FECHAFACTURA, 'Debe completar la fecha de la factura.');
  Verificar(cmbfpFC_FECHARECEPFACT.IsEmpty, cmbfpFC_FECHARECEPFACT, 'Debe completar la fecha de recepción de la factura.');
  Verificar(cmbfpFC_FECHAFACTURA.Date > cmbfpFC_FECHARECEPFACT.Date, cmbfpFC_FECHARECEPFACT, 'La fecha de la factura no puede ser posterior a la fecha de recepción de la misma.');
  Verificar(cmbfpFC_FECHARECEPFACT.Date > DBDateTime, cmbfpFC_FECHARECEPFACT, 'La fecha de recepción de la factura no puede ser posterior a hoy.');
  Verificar(edFC_IMPORTE.Value = 0, edFC_IMPORTE, 'Debe completar el importe de la factura.');

  Result := True;
end;

procedure TfrmConsultaFacturas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEN_ID.Clear;
  fraVE_ID.Clear;
  edFC_FACTURANRO.Clear;
  cmbFC_FECHAFACTURADesde.Clear;
  cmbFC_FECHAFACTURAHasta.Clear;
  cmbFC_FECHARECEPFACTDesde.Clear;
  cmbFC_FECHARECEPFACTHasta.Clear;
  cmbFC_FECHAAPROBADODesde.Clear;
  cmbFC_FECHAAPROBADOHasta.Clear;
  chkSinAplicar.Checked  := False;
  chkSoloActivas.Checked := True;
  rgFacturas.ItemIndex   := 0;   // Todas
end;

procedure TfrmConsultaFacturas.fpCambioVendedores(Sender: TObject);
begin
  inherited;
  fraVendedoresCUIT.FrameExit(Sender);
//  fraEntidadCUIT.Value := fraVendedoresCUIT.Entidad;

  VerificarTipoFactura;
end;

procedure TfrmConsultaFacturas.fpCambioEntidad(Sender: TObject);
begin
  inherited;
  fraEntidadCUIT.FrameExit(Sender);
  if fraEntidadCUIT.IsSelected then
    fraVendedoresCUIT.Entidad := fraEntidadCUIT.Value;

  VerificarTipoFactura;
end;

procedure TfrmConsultaFacturas.VerificarTipoFactura;
var
  sIVA: String;
begin
  if fraEntidadCUIT.IsSelected and fraVendedoresCUIT.IsSelected then
  begin
    if AreIn(fraEntidadCUIT.sdqDatos.FieldByName('EN_MODOLIQ').AsString, ['02', '06']) then
      sIVA := fraVendedoresCUIT.sdqDatos.FieldByName('VE_IVA').AsString
    else
      sIVA := fraEntidadCUIT.sdqDatos.FieldByName('EN_IVA').AsString;

    VCLExtra.LockControl(edfpFC_FACTURATIPO, True);
    if sIVA = 'S' then
      edfpFC_FACTURATIPO.Text := 'A'
    else if sIVA = 'M' then
      edfpFC_FACTURATIPO.Text := 'M'
    else
      edfpFC_FACTURATIPO.Text := 'C';
  end;
end;

procedure TfrmConsultaFacturas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if Assigned(FindField('IMPORTE')) then
      TFloatField(FieldByName('IMPORTE')).Currency := True;
    if Assigned(FindField('SIN_APLICAR')) then
      TFloatField(FieldByName('SIN_APLICAR')).Currency := True;
  end;
end;

procedure TfrmConsultaFacturas.CompletarFactura(Sender: TObject);
begin
  TMaskEdit(Sender).Text := Get_NroFacturaCompleto(TMaskEdit(Sender).Text);
end;

function TfrmConsultaFacturas.GetIDFactura: integer;
begin
  case ModoABM of
    maModificacion, maBaja:
      Result := sdqConsulta.FieldByName('FC_ID').AsInteger;
    else
      Result := ART_EMPTY_ID;
  end;
end;

function TfrmConsultaFacturas.GetIDVendedor: integer;
begin
  Result := fraVendedoresCUIT.IDVendedor;
end;

procedure TfrmConsultaFacturas.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La factura ya ha sido aprobada.');

  inherited;
end;

procedure TfrmConsultaFacturas.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La factura ya ha sido aprobada.');
  Verificar(sdqConsulta.FieldByName('SIN_APLICAR').AsFloat <> 0, nil, 'El monto Sin Aplicar debe ser igual a 0.');

  sSql := 'SELECT 1 ' +
            'FROM XLF_LIQFACTURA ' +
           'WHERE LF_IDFACTURA = :Factura ' +
             'AND COMISION.GET_MONTOSINAPLICARLIQUIDACION(LF_IDLIQCOMISION) > 0 ' +
             'AND LF_FECHABAJA IS NULL';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('FC_ID').AsInteger]), nil, 'Existen liquidaciones pendientes de aplicar asociadas a esta factura.');

  if MsgBox('¿Está seguro que desea aprobar la factura seleccionada?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XFC_FACTURA ' +
                 'SET FC_USUAPROBADO = :UsuAprobado, ' +
                     'FC_FECHAAPROBADO = ACTUALDATE ' +
               'WHERE FC_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('FC_ID').AsInteger]);

      MsgBox('Factura aprobada correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmConsultaFacturas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultaFacturas.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmConsultaFacturas.CalcTotales;
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

procedure TfrmConsultaFacturas.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmConsultaFacturas.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmConsultaFacturas.mnuImprimirFactAprobadasFechaClick(Sender: TObject);
var
  FAprobacion: TDateTime;
begin
  if Sender = mnuImprimirFactAprobadasFecha then   // por Fecha
    begin
      repeat
        FAprobacion := InputBoxDate('Aprobación', 'Fecha', 0);

        if FAprobacion = 0 then
          InfoHint(nil, 'Debe ingresar la fecha de aprobación.');
      until (FAprobacion = -1) or (FAprobacion > 0);

      if FAprobacion > 0 then
        if not DoGenerarReporteFacturasAprobadas(FAprobacion, ART_EMPTY_ID) then
          InfoHint(nil, 'No se encontraron vendedores.');
    end
  else   // liquidación actual
    begin
      if not DoGenerarReporteFacturasAprobadas(0, sdqConsulta.FieldByName('FC_ID').AsInteger) then
        InfoHint(nil, 'No se encontraron vendedores.');
    end;
end;

procedure TfrmConsultaFacturas.tbDesaprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'No se puede desaprobar una factura dada de baja.');
  Verificar(sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'La factura no ha sido aprobada.');

  sSql := 'SELECT 1 ' +
            'FROM AP_INVOICES_ALL ' +
           'WHERE ATTRIBUTE15 = :Id ' +
             'AND CANCELLED_DATE IS NULL';

  with dmFinancials do
    begin
      Conectar;
      try
        Verificar(dmFinancials.ExisteSqlEx(sSql, [Self.sdqConsulta.FieldByName('FC_ID').AsInteger]), nil, 'No se puede desaprobar una factura que no esté anulada en Oracle Financials.');
      finally
        Desconectar;
      end;
    end;

  Verificar(not sdqConsulta.FieldByName('IDCHEQUEEMITIDO').IsNull, nil, 'No se puede desaprobar una factura que tenga asociada un cheque.');

  if MsgBox('¿Está seguro que desea desaprobar la factura seleccionada?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XFC_FACTURA ' +
                 'SET FC_USUAPROBADO = NULL, ' +
                     'FC_FECHAAPROBADO = NULL, ' +
                     'FC_USUMODIF = :User, ' +
                     'FC_FECHAMODIF = SYSDATE ' +
               'WHERE FC_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('FC_ID').AsInteger]);

      MsgBox('Factura desaprobada correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

end.

