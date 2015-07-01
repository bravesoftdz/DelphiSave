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
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbOrdenarLiqDispClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FIDFactura: integer;
    FNroFactura: string;
    FIDEntVend: integer;
    FMontoFact: extended;
    FIdVendedor: integer;
    FFechaAprobado: TDateTime;
    procedure SetIDFactura(const Value: integer);
    procedure SetNroFactura(const Value: string);
    procedure SetIDEntVend(const Value: integer);
    procedure SetIdVendedor(const Value: integer);
    function  GetMontoFact: extended;
    procedure SetFechaAprobado(const Value: TDateTime);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  public
    property IDFactura: integer read FIDFactura write SetIDFactura;
    property IDEntVend: integer read FIDEntVend write SetIDEntVend;
    property IdVendedor: integer read FIdVendedor write SetIdVendedor;
    property MontoFact: extended read GetMontoFact write FMontoFact;
    property NroFactura: string read FNroFactura write SetNroFactura;
    property FechaAprobado: TDateTime read FFechaAprobado write SetFechaAprobado; 
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

{ TfrmLiquidacionesAplicadas }

procedure TfrmLiquidacionesAplicadas.ClearControls;
begin
//
end;

procedure TfrmLiquidacionesAplicadas.LoadControls;
begin
//
end;

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
          Self.Sql.TableName := 'XLF_LIQFACTURA';
          Self.Sql.Fields.Add('LF_FECHAALTA', exDateTime);
          Self.Sql.Fields.Add('LF_USUALTA', Sesion.UserID);

          sSQL := 'SELECT 1 FROM XLF_LIQFACTURA WHERE LF_IDLIQCOMISION = :LC_ID AND LF_IDFACTURA = :LF_ID AND LF_FECHABAJA IS NULL';

          if ExisteSQLEx(sSQL, [FieldByName('LC_ID').AsInteger, IDFactura]) then
          begin
            if MsgAsk(Format('La liquidación nº %d ya estaba asociada a la factura nº %s.' + CRLF +
                             '¿Desea aplicar el resto del monto de la misma a esta factura?',
                             [FieldByName('LC_ID').AsInteger, NroFactura])) then
            begin
              Self.Sql.SqlType := stUpdate;
              Self.Sql.PrimaryKey.Add('LF_ID', sdqConsulta.FieldByName('LF_ID').AsInteger);
              Self.Sql.Fields.Add('LF_MONTO', 'LF_MONTO + ' + StringReplace(FormatFloat('0.00', FieldByName('SIN_APLICAR').AsCurrency), ',', '.', [rfReplaceAll]), False);

              Result := inherited DoABM;
            end;
          end
          else begin
            Self.Sql.SqlType := stInsert;
            Self.Sql.PrimaryKey.AddExpression('LF_ID', 'SEQ_XLF_ID.NEXTVAL');
            Self.Sql.Fields.Add('LF_IDLIQCOMISION', FieldByName('LC_ID').AsInteger);
            Self.Sql.Fields.Add('LF_IDFACTURA', IDFactura);

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
        Sql.TableName := 'XLF_LIQFACTURA';

        Sql.PrimaryKey.Add('LF_ID', sdqConsulta.FieldByName('LF_ID').AsInteger);
        Sql.Fields.Add('LF_FECHABAJA', exDateTime);
        Sql.Fields.Add('LF_USUBAJA', Sesion.UserID);
        Sql.SqlType := stUpdate;

        Result := inherited DoABM;
      end;
  end;
  sdqLiqDisp.Close;
  tbRefrescar.Click;
end;

procedure TfrmLiquidacionesAplicadas.SetIDEntVend(const Value: integer);
begin
  FIDEntVend := Value;
  sdqLiqDisp.ParamByName('IDEntVend').AsInteger := Value;
end;

procedure TfrmLiquidacionesAplicadas.SetIDFactura(const Value: integer);
begin
  FIDFactura := Value;
  sdqConsulta.ParamByName('ID').AsInteger       := Value;
  sdqLiqDisp.ParamByName('IdFactura').AsInteger := Value;
  tbRefrescar.Click;
end;

procedure TfrmLiquidacionesAplicadas.SetNroFactura(const Value: string);
begin
  FNroFactura := Value;
  Caption := CAPTION_BASE + Value;
end;

function TfrmLiquidacionesAplicadas.Validar: Boolean;
var
  fSumaSeleccion: double;
begin
  Verificar(sdqLiqDisp.IsEmpty, dbgLiqDisp, 'No hay liquidaciones sin aplicar para la entidad seleccionada.');
  Verificar(dbgLiqDisp.SelectedRows.Count = 0, dbgLiqDisp, 'Debe seleccionar al menos una liquidación.');

  fSumaSeleccion := ObtenerSuma(dbgLiqDisp, 'SIN_APLICAR', True);
  Verificar((dbgLiqDisp.SelectedRows.Count > 1) and (fSumaSeleccion > MontoFact), dbgLiqDisp, 'El monto de las liquidaciones seleccionadas no puede ser superior al de la factura original.');

  Result := True;
end;

procedure TfrmLiquidacionesAplicadas.tbNuevoClick(Sender: TObject);
var
  sAux: string;
begin
  Verificar(MontoFact = 0, nil, 'El monto de la factura ya ha sido alcanzado.');
  sAux := sdqLiqDisp.SQL.Text;
  try
    OpenQueryEx(sdqLiqDisp, [IDFactura, IDEntVend, IDFactura, IDVendedor], sAux + SortDialogLiqDisp.OrderBy);
    inherited;
  finally
    sdqLiqDisp.SQL.Text := sAux;
  end;
end;

procedure TfrmLiquidacionesAplicadas.tbOrdenarLiqDispClick(Sender: TObject);
begin
  unART.LoadDynamicSortFields(SortDialogLiqDisp.SortFields, dbgLiqDisp.Columns);
  SortDialogLiqDisp.Execute;
end;

procedure TfrmLiquidacionesAplicadas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('TOTAL_FACTURA')).Currency := True;
    TFloatField(FieldByName('COMISION')).Currency      := True;
    TFloatField(FieldByName('IVA')).Currency           := True;

    if Assigned(FindField('SIN_APLICAR')) then
      TFloatField(FieldByName('SIN_APLICAR')).Currency := True;

    if Assigned(FindField('TOTAL_APLICADO')) then
      TFloatField(FieldByName('TOTAL_APLICADO')).Currency := True;
  end;
end;

function TfrmLiquidacionesAplicadas.GetMontoFact: extended;
begin
  FMontoFact := ValorSQLEx(SqlSimpleQuery('ART.COMISION.GET_MONTOSINAPLICARFACTURA(:FC_ID)'), [IDFactura]);
  Result := FMontoFact;
end;

procedure TfrmLiquidacionesAplicadas.SetIdVendedor(const Value: integer);
begin
  FIdVendedor := Value;
  sdqLiqDisp.ParamByName('IdVendedor').AsInteger := Value;
end;

procedure TfrmLiquidacionesAplicadas.SetFechaAprobado(const Value: TDateTime);
var
  bMostrar: Boolean;
begin
  FFechaAprobado := Value;

  bMostrar := (FFechaAprobado = 0);
  
  tbNuevo.Visible     := bMostrar;
  tbEliminar.Visible  := bMostrar;
  ToolButton3.Visible := bMostrar;
end;

end.

