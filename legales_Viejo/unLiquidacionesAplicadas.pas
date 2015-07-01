unit unLiquidacionesAplicadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unCustomGridABM, StdCtrls, FormPanel, Mask, DBCtrls;

type
  TfrmLiquidacionesAplicadas = class(TfrmCustomGridABM)
    dbgLiqDisp: TArtDBGrid;
    sdqLiqDisp: TSDQuery;
    dsLiqDisp: TDataSource;
    SortDialogLiqDisp: TSortDialog;
    tbLiqDisp: TToolBar;
    tbOrdenarLiqDisp: TToolButton;
    Panel1: TPanel;
    DBfpedCodGestor: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBfpedNombreGestor: TDBEdit;
    Panel2: TPanel;     
    Label7: TLabel;
    Label9: TLabel;
    DBedCodGestor: TDBEdit;
    DBedNombreGestor: TDBEdit;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbOrdenarLiqDispClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqLiqDispAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    FIDFactura: integer;
    FNroFactura: string;
    FMontoFact: extended;
    FIDGestor: integer;
    FPermitirAltaBaja: boolean;
    procedure SetIDFactura(const Value: integer);
    procedure SetNroFactura(const Value: string);
    function  GetMontoFact: extended;
    procedure SetIDGestor(const Value: integer);
    procedure SetPermitirAltaBaja(const Value: boolean);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  public
    property IDFactura: integer         read FIDFactura         write SetIDFactura;
    property IDGestor: integer          read FIDGestor          write SetIDGestor;
    property MontoFact: extended        read GetMontoFact       write FMontoFact;
    property NroFactura: string         read FNroFactura        write SetNroFactura;
    property PermitirAltaBaja: boolean  read FPermitirAltaBaja  write SetPermitirAltaBaja;
  end;

var
  frmLiquidacionesAplicadas: TfrmLiquidacionesAplicadas;

implementation

uses
  unGrids, CustomDlgs, unDmPrincipal, unPrincipal, unSesion, AnsiSQL, SQLFuncs,
  SDOra, unART;

const
  CAPTION_BASE = 'Liquidaciones Aplicadas | Factura nº ';

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.ClearControls;
begin
//
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.LoadControls;
begin
//
end;
{-------------------------------------------------------------------------------}
function TfrmLiquidacionesAplicadas.DoABM: Boolean;
var
  iloop: integer;
  sSQL: string;
begin
  Result := True;
  
  case ModoABM of
    maAlta:
      with sdqLiqDisp do
        begin
          DisableControls;
          First;

          for iloop:= 0 to dbgLiqDisp.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(dbgLiqDisp.SelectedRows.Items[iloop]));

              Self.Sql.Clear;
              Self.Sql.TableName := 'LLF_LIQUIDACIONFACTURA';
              Self.Sql.Fields.Add('LF_FECHAALTA', exDateTime);
              Self.Sql.Fields.Add('LF_USUALTA',   Sesion.UserID);

              sSQL := 'SELECT 1 FROM LLF_LIQUIDACIONFACTURA WHERE LF_IDLIQUIDACION = :LH_ID AND LF_IDFACTURA = :LF_ID AND LF_FECHABAJA IS NULL';

              if ExisteSQLEx(sSQL, [FieldByName('LH_ID').AsInteger, IDFactura]) then
                begin
                  if MsgAsk(Format('La liquidación nº %d ya estaba asociada a la factura nº %s.' + CRLF +
                                   '¿Desea aplicar el resto del monto de la misma a esta factura?',
                                   [FieldByName('LH_ID').AsInteger, NroFactura])) then
                    begin
                      Self.Sql.SqlType := stUpdate;
                      
                      Self.Sql.PrimaryKey.Add('LF_ID', sdqConsulta.FieldByName('LF_ID').AsInteger);
                      Self.Sql.Fields.Add('LF_MONTO', 'LF_MONTO + ' + StringReplace(FormatFloat('0.00', FieldByName('SIN_APLICAR').AsCurrency), ',', '.', [rfReplaceAll]), False);

                      Result := inherited DoABM;
                    end;
                end
              else
                begin
                  Self.Sql.SqlType := stInsert;

                  Self.Sql.PrimaryKey.AddExpression('LF_ID', 'SEQ_LLF_ID.NEXTVAL');
                  Self.Sql.Fields.Add('LF_IDLIQUIDACION',    FieldByName('LH_ID').AsInteger);
                  Self.Sql.Fields.Add('LF_IDFACTURA',        IDFactura);

                  if MontoFact > FieldByName('SIN_APLICAR').AsCurrency then
                    Self.Sql.Fields.Add('LF_MONTO', FieldByName('SIN_APLICAR').AsFloat, dtNumber)
                  else
                    Self.Sql.Fields.Add('LF_MONTO', MontoFact, dtNumber);

                  try
                    Result := inherited DoABM;
                  except
                    MsgBox('Error al asociar la/s liquidacion/es con la factura.');
                  end;
                end;
            end;

          sdqLiqDisp.EnableControls;
        end;
    maBaja:
      begin
        Sql.Clear;
        Sql.TableName := 'LLF_LIQUIDACIONFACTURA';

        Sql.PrimaryKey.Add('LF_ID',    sdqConsulta.FieldByName('LF_ID').AsInteger);
        Sql.Fields.Add('LF_FECHABAJA', exDateTime);
        Sql.Fields.Add('LF_USUBAJA',   Sesion.UserID);
        
        Sql.SqlType := stUpdate;

        Result := inherited DoABM;
      end;
  end;
  
  sdqLiqDisp.Close;
  tbRefrescar.Click;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.SetIDFactura(const Value: integer);
begin
  FIDFactura := Value;
  sdqConsulta.ParamByName('ID').AsInteger := Value;
  tbRefrescar.Click;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.SetNroFactura(const Value: string);
begin
  FNroFactura := Value;
  Caption     := CAPTION_BASE + Value;
end;
{-------------------------------------------------------------------------------}
function TfrmLiquidacionesAplicadas.Validar: Boolean;
var
  fSumaSeleccion: double;
begin
  Verificar(sdqLiqDisp.IsEmpty, dbgLiqDisp, 'No hay liquidaciones sin aplicar para el estudio seleccionado.');
  Verificar(dbgLiqDisp.SelectedRows.Count = 0, dbgLiqDisp, 'Debe seleccionar al menos una liquidación.');

  fSumaSeleccion := ObtenerSuma(dbgLiqDisp, 'SIN_APLICAR', True);
  Verificar((dbgLiqDisp.SelectedRows.Count > 1) and (fSumaSeleccion > MontoFact), dbgLiqDisp, 'El monto de las liquidaciones seleccionadas no puede ser superior al de la factura original.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.tbNuevoClick(Sender: TObject);
var
  sAux: string;
begin
  Verificar(MontoFact = 0, nil, 'El monto de la factura ya ha sido alcanzado.');

  sAux := sdqLiqDisp.SQL.Text;
  try
    OpenQueryEx(sdqLiqDisp, [IDGestor], sAux + SortDialogLiqDisp.OrderBy);
    inherited;
  finally
    sdqLiqDisp.SQL.Text := sAux;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.tbOrdenarLiqDispClick(Sender: TObject);
begin
  unART.LoadDynamicSortFields(SortDialogLiqDisp.SortFields, dbgLiqDisp.Columns);
  SortDialogLiqDisp.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('HONORARIO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('HONORARIO')).Currency := True;

  if sdqConsulta.FieldByName('IVA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IVA')).Currency := True;

  if sdqConsulta.FieldByName('TOTAL_FACTURA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTAL_FACTURA')).Currency := True;

  if sdqConsulta.FieldByName('SIN_APLICAR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SIN_APLICAR')).Currency := True;

  if sdqConsulta.FieldByName('TOTAL_APLICADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTAL_APLICADO')).Currency := True;
end;
{-------------------------------------------------------------------------------}
function TfrmLiquidacionesAplicadas.GetMontoFact: extended;
begin
  FMontoFact := ValorSQLEx(SqlSimpleQuery('ART.LEGALES.GET_MONTOSINAPLICARFACTURA(:LH_ID)'), [IDFactura]);
  Result     := FMontoFact;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.SetIDGestor(const Value: integer);
begin
  FIDGestor := Value;
  sdqLiqDisp.ParamByName('IdGestor').AsInteger := Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.sdqLiqDispAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqLiqDisp.FieldByName('HONORARIO') is TFloatField then
    TFloatField(sdqLiqDisp.FieldByName('HONORARIO')).Currency := True;

  if sdqLiqDisp.FieldByName('IVA') is TFloatField then
    TFloatField(sdqLiqDisp.FieldByName('IVA')).Currency := True;

  if sdqLiqDisp.FieldByName('TOTAL_FACTURA') is TFloatField then
    TFloatField(sdqLiqDisp.FieldByName('TOTAL_FACTURA')).Currency := True;

  if sdqLiqDisp.FieldByName('SIN_APLICAR') is TFloatField then
    TFloatField(sdqLiqDisp.FieldByName('SIN_APLICAR')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.SetPermitirAltaBaja(const Value: boolean);
begin
  if FPermitirAltaBaja <> Value then
    begin
      FPermitirAltaBaja := Value;

      tbNuevo.Visible     := FPermitirAltaBaja;
      tbEliminar.Visible  := FPermitirAltaBaja;
      ToolButton3.Visible := FPermitirAltaBaja;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiquidacionesAplicadas.FormCreate(Sender: TObject);
begin
  inherited;

  PermitirAltaBaja := True
end;
{-------------------------------------------------------------------------------}
end.

