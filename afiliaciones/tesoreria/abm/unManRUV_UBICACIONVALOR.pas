
{********************************************************}
{                                                        }
{    Ubicación de Valores                                }
{    Mantenimiento de la Tabla RUV_UBICACIONVALOR        }
{                                                        }
{    Análisis: Sebastián Gabrielli                       }
{    Autor: Federico Firenze                             }
{    Fecha: 01/2004                                      }
{                                                        }
{********************************************************}

unit unManRUV_UBICACIONVALOR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDbFrame, unFraEmpresa,
  unfraEmpresaDeudora, unFraStaticCodigoDescripcion, Mask, PatternEdit, unFraCodigoDescripcion, unfraCtbTablas, ToolEdit,
  DateComboBox, Menus, unFraUsuario, unArtDBAwareFrame, RxToolEdit, RxPlacemnt;

type
  TfrmManRUV_UBICACIONVALOR = class(TfrmCustomGridABM)
    gbEmpresa: TGroupBox;
    Bevel1: TBevel;
    rbEmpNormal: TRadioButton;
    rbEmpDeudora: TRadioButton;
    fraEmpresa: TfraEmpresaDeudora;
    rbEstudio: TRadioButton;
    Banco: TGroupBox;
    fraZBA_BANCO: TfraStaticCodigoDescripcion;
    GroupBox1: TGroupBox;
    edVA_NROCHEQUE: TPatternEdit;
    GroupBox2: TGroupBox;
    fraCTB_UBVAL: TfraCtbTablas;
    GroupBox3: TGroupBox;
    edUV_FECHAALTADesde: TDateComboBox;
    edUV_FECHAALTAHasta: TDateComboBox;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    edUV_REMITO: TPatternEdit;
    pmnuImpresion: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpRemito: TMenuItem;
    fraUV_ACCION: TfraCtbTablas;
    Label2: TLabel;
    Label3: TLabel;
    fraUV_RECEPTOR: TfraUsuarios;
    Label4: TLabel;
    edObservaciones: TMemo;
    procedure opTipoEmpresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpRemitoClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure RefreshData; override;
    procedure ClearData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, General, CustomDlgs, DBSql, unRptRemitoValores,
  unSesion, unArt;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.ClearControls;
begin
  fraUV_ACCION.Clear;
  fraUV_RECEPTOR.Clear;
  edObservaciones.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRUV_UBICACIONVALOR.DoABM: Boolean;
var
  Sql: TDBSql;
begin
  Sql := TDBSql.Create('RUV_UBICACIONVALOR');
  try
    if ModoABM = maAlta Then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add('UV_ID',           'SEQ_RUV_ID.NEXTVAL', False);
      Sql.Fields.Add('UV_IDVALOR',          sdqConsulta.FieldByName('UV_IDVALOR').AsInteger);
      Sql.Fields.Add('UV_ACCION',           fraUV_ACCION.Value);
      Sql.Fields.Add('UV_RECEPTOR',         fraUV_RECEPTOR.Value);
      Sql.Fields.Add('UV_OBSERVACIONES',    Trim(edObservaciones.Lines.Text));

      if fraUV_ACCION.Value = '05' Then
      begin
        Sql.Fields.Add('UV_REMITO',         IncSql('SELECT MAX(UV_REMITO) FROM RUV_UBICACIONVALOR'));
        Sql.Fields.Add('UV_FECHAIMPRESION', exDateTime);
      end;

      Sql.Fields.Add('UV_USUALTA',          Sesion.UserID);
      Sql.Fields.Add('UV_FECHAALTA',        exDateTime);

    end else
    begin {maBaja}
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('UV_ID',           sdqConsulta.FieldByName('UV_ID').AsInteger);
      Sql.Fields.Add('UV_USUBAJA',          Sesion.UserID);
      Sql.Fields.Add('UV_FECHABAJA',        exDateTime);
    end;

    Sql.Execute;

    Result := True;
  finally
    Sql.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.LoadControls;
begin
  { No se modifica }
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRUV_UBICACIONVALOR.Validar: Boolean;
begin
  Result := False;

  if fraUV_ACCION.IsEmpty Then
    InvalidMsg(fraUV_ACCION.edCodigo, 'Debe seleccionar una Acción.')

  else if fraUV_RECEPTOR.IsEmpty Then
    InvalidMsg(fraUV_RECEPTOR.edCodigo, 'Debe seleccionar un Usuario Receptor.')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.opTipoEmpresaClick(Sender: TObject);
begin
  fraEmpresa.IsDeudora := rbEmpDeudora.Checked;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.RefreshData;
var
  sSql,
  sSqlWhere: string;
begin
  sSql := '';
  sSqlWhere := SqlBetweenDateTime(' AND UV_FECHAALTA', edUV_FECHAALTADesde.Date, edUV_FECHAALTAHasta.Date);

  if fraZBA_BANCO.IsSelected Then
    sSqlWhere := sSqlWhere + ' AND VA_IDBANCO = ' + SqlValue(fraZBA_BANCO.Value);

  if edVA_NROCHEQUE.Text <> '' Then
    sSqlWhere := sSqlWhere + ' AND VA_NROCHEQUE = ' + SqlValue(edVA_NROCHEQUE.Text);

  if fraCTB_UBVAL.IsSelected Then
    sSqlWhere := sSqlWhere + ' AND UV_ACCION = ' + SqlValue(fraCTB_UBVAL.Value);

  if edUV_REMITO.Text <> '' Then
    sSqlWhere := sSqlWhere + ' AND UV_REMITO = ' + SqlValue(edUV_REMITO.Text);

  if fraEmpresa.IsEmpty or rbEmpNormal.Checked Then
    sSql := 'SELECT UV_ID, UV_IDVALOR, EM_CUIT CUIT, EM_NOMBRE NOMBRE, CO_CONTRATO CONTRATO, TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, ' +
                   'VA_NROCHEQUE NUMERO, VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, TB_DESCRIPCION ACCION, UV_FECHABAJA, ' +
                   'TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO, UV_FECHAIMPRESION IMPRESION, UV_RECEPTOR RECEPTOR, ' +
                   'UV_OBSERVACIONES OBSERVACIONES ' +
              'FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO, CTB_TABLAS, ZVA_VALOR, RUV_UBICACIONVALOR ' +
             'WHERE VA_ID = UV_IDVALOR ' +
               'AND BA_ID = VA_IDBANCO ' +
               'AND TV_ID = VA_IDTIPOVALOR ' +
               'AND EM_ID = CO_IDEMPRESA ' +
               'AND CO_CONTRATO = VA_IDCONTRATO ' +
               'AND TB_CODIGO = UV_ACCION ' +
               'AND TB_CLAVE = ''UBVAL'' ' +
               sSqlWhere +
               IIF(fraEmpresa.IsSelected,  ' AND EM_ID = ' + SqlValue(fraEmpresa.Value), '');

  if fraEmpresa.IsEmpty Then
    sSql := sSql + ' UNION ALL ';


  if fraEmpresa.IsEmpty or rbEmpDeudora.Checked Then
    sSql := sSql +
            'SELECT UV_ID, UV_IDVALOR, ED_CUIT CUIT, ED_NOMBRE NOMBRE, TO_NUMBER(NULL) CONTRATO, TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, ' +
                   'VA_NROCHEQUE NUMERO, VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, TB_DESCRIPCION ACCION, UV_FECHABAJA, ' +
                   'TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO, UV_FECHAIMPRESION IMPRESION, UV_RECEPTOR RECEPTOR, ' +
                   'UV_OBSERVACIONES OBSERVACIONES ' +
              'FROM RED_EMPDEUDORA, OTV_TIPOVALOR, ZBA_BANCO, CTB_TABLAS, ZVA_VALOR, RUV_UBICACIONVALOR ' +
             'WHERE VA_ID = UV_IDVALOR ' +
               'AND BA_ID = VA_IDBANCO ' +
               'AND TV_ID = VA_IDTIPOVALOR ' +
               'AND ED_ID = VA_IDEMPDEUDORA ' +
               'AND TB_CODIGO = UV_ACCION ' +
               'AND TB_CLAVE = ''UBVAL'' ' +
               sSqlWhere +
               IIF(fraEmpresa.IsSelected,  ' AND ED_ID = ' + SqlValue(fraEmpresa.Value), '');

  if fraEmpresa.IsEmpty Then
    sSql := sSql + ' UNION ALL ';

  if fraEmpresa.IsEmpty or rbEstudio.Checked Then
    sSql := sSql +
            'SELECT UV_ID, UV_IDVALOR, GC_CUIT CUIT, GC_NOMBRE NOMBRE, TO_NUMBER(NULL) CONTRATO, TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, ' +
                   'VA_NROCHEQUE NUMERO, VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, TB_DESCRIPCION ACCION, UV_FECHABAJA, ' +
                   'TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO, UV_FECHAIMPRESION IMPRESION, UV_RECEPTOR RECEPTOR, ' +
                   'UV_OBSERVACIONES OBSERVACIONES ' +
              'FROM AGC_GESTORCUENTA, OTV_TIPOVALOR, ZBA_BANCO, CTB_TABLAS, ZVA_VALOR, RUV_UBICACIONVALOR ' +
             'WHERE VA_ID = UV_IDVALOR ' +
               'AND BA_ID = VA_IDBANCO ' +
               'AND TV_ID = VA_IDTIPOVALOR ' +
               'AND GC_ID = VA_IDGESTORCUENTA ' +
               'AND TB_CODIGO = UV_ACCION ' +
               'AND TB_CLAVE = ''UBVAL''' +
               sSqlWhere +
               IIF(fraEmpresa.IsSelected,  ' AND BA_ID = ' + SqlValue(fraEmpresa.Value), '');

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.FormCreate(Sender: TObject);
begin
  inherited;
  with fraZBA_BANCO do
  begin
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
  end;

  { Frama Acciones - Filtro }
  fraCTB_UBVAL.Clave := 'UBVAL';

  { Frame Acciones - ABM }
  fraUV_ACCION.Clave := 'UBVAL';
  fraUV_ACCION.Especial1 := 'S';


  FieldBaja := 'UV_FECHABAJA';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.ClearData;
begin
  rbEmpNormal.Checked := True;
  fraEmpresa.Clear;
  fraCTB_UBVAL.Clear;
  fraZBA_BANCO.Clear;
  edVA_NROCHEQUE.Clear;
  edUV_REMITO.Clear;
  fraCTB_UBVAL.Clear;
  edUV_FECHAALTADesde.Clear;
  edUV_FECHAALTAHasta.Clear;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.mnuImpRemitoClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('REMITO').IsNull Then
    MsgBox('El registro seleccionado no tiene un Remito asociado.', MB_ICONEXCLAMATION)

  else
    with TfrmRptRemitoValores.Create(Self) do
      Try
        ImprimirRemitoValores(sdqConsulta.FieldByName('UV_ID').AsInteger);
      finally
        Free;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.tbNuevoClick(Sender: TObject);
begin
  if not ExisteSqlEx('SELECT 1 FROM ZVA_VALOR ' +
                      'WHERE ((VA_ESTADO = ''03'' AND VA_IDTIPOVALOR = 2) OR ' +
                             '(VA_ESTADO IN (''01'', ''03'', ''05'') AND VA_IDTIPOVALOR = 3)) ' +
                        'AND VA_ID = :IDVALOR', [sdqConsulta.FieldByName('UV_IDVALOR').AsInteger]) Then
    InvalidMsg(Nil, 'El Valor seleccionado no está disponible para la entrega.' + CRLF + 'El Valor debe estar rechazado, pendiente de depositar o reemplazado si es un cheque o pendiente de reemplazar si es un pagaré.')
  else
    inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.tbEliminarClick(Sender: TObject);
begin
  { El registro debe ser de carga manual }
  if ExisteSqlEx('SELECT 1 FROM CTB_TABLAS, RUV_UBICACIONVALOR ' +
                  'WHERE TB_CLAVE = ''UBVAL'' ' +
                    'AND TB_CODIGO = UV_ACCION ' +
                    'AND TB_ESPECIAL1 = ''N'' ' +
                    'AND UV_ID = :ID', [sdqConsulta.FieldByName('UV_IDVALOR').AsInteger]) Then
    InvalidMsg(Nil, 'El Registro seleccionado no puede ser dado de Baja.' + CRLF + 'El registro debe ser de carga manual.')

  else { El registro debe ser el último movimiento para el valor }
  if ExisteSqlEx('SELECT 1 FROM RUV_UBICACIONVALOR ' +
                  'WHERE UV_ID = :ID ' +
                    'AND UV_ID != (SELECT MAX(UV_ID) ' +
                                    'FROM RUV_UBICACIONVALOR ' +
                                   'WHERE UV_IDVALOR = :IDVALOR)', [sdqConsulta.FieldByName('UV_ID').AsInteger,
                                                                    sdqConsulta.FieldByName('UV_IDVALOR').AsInteger]) Then
    InvalidMsg(Nil, 'El Registro seleccionado no puede ser dado de Baja.' + CRLF + 'El registro debe ser el último movimiento para el valor.')

  else
    inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRUV_UBICACIONVALOR.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('IMPORTE')).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

