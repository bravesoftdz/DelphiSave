unit unSeleccionarPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArt, AnsiSql;

type
  TfrmSeleccionarPresupuesto = class(TfrmCustomConsulta)
    tbSeleccionar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    procedure tbSalir2Click(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FSFormShow(Sender: TObject);
    procedure tbSeleccionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAutorizacion: Integer;
    FOrden: Integer;
    FRecaida: Integer;
    FSiniestro: Integer;
    pbCargoDatos: Boolean;
    
    procedure SetAutorizacion(const Value: Integer);
    procedure SetOrden(const Value: Integer);
    procedure SetRecaida(const Value: Integer);
    procedure SetSiniestro(const Value: Integer);
  public
    property Autorizacion: Integer read FAutorizacion write SetAutorizacion;
    property Orden: Integer        read FOrden        write SetOrden;
    property Recaida: Integer      read FRecaida      write SetRecaida;
    property Siniestro: Integer    read FSiniestro    write SetSiniestro;
  end;

  function GetInsertSiniestroOrtopedia(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer; IdPresupuesto: TTableId): String;

implementation

uses
  unPrincipal, unDmPrincipal, SqlFuncs, General;

{$R *.DFM}

procedure TfrmSeleccionarPresupuesto.SetSiniestro(const Value: Integer);
begin
  if FSiniestro <> Value then
    FSiniestro := Value;
end;

procedure TfrmSeleccionarPresupuesto.SetOrden(const Value: Integer);
begin
  if FOrden <> Value then
    FOrden := Value;
end;

procedure TfrmSeleccionarPresupuesto.SetRecaida(const Value: Integer);
begin
  if FRecaida <> Value then
    FRecaida := Value;
end;

procedure TfrmSeleccionarPresupuesto.SetAutorizacion(const Value: Integer);
begin
  if FAutorizacion <> Value then
    FAutorizacion := Value;
end;

procedure TfrmSeleccionarPresupuesto.tbSalir2Click(Sender: TObject);
begin
  inherited;

  close;
end;

procedure TfrmSeleccionarPresupuesto.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT PA_ID PRESUPUESTO, CA_DESCRIPCION PRESTADOR, TRUNC(PA_FECHAALTA) FEC_PEDIDO, PA_MATERIALSOLI MAT_SOLI,' +
          ' PA_MATERIALCOTI MAT_COTI, PA_VIGENCIAHASTA VIG_HASTA, PA_COTIZACION COTIZACION' +
     ' FROM CPR_PRESTADOR, MPA_PRESUPUESTOAUTORIZACION' +
    ' WHERE PA_PRESTADOR = CA_IDENTIFICADOR' +
      ' AND PA_VIGENCIAHASTA >= TRUNC(SYSDATE) ' +
      ' AND NOT EXISTS (SELECT 1' +
                        ' FROM MSO_SINIESTROORTOPEDIA' +
                       ' WHERE SO_SINIESTRO = ' + SqlValue(Siniestro) +
                         ' AND SO_ORDEN = ' + SqlValue(Orden) +
                         ' AND SO_RECAIDA = ' + SqlValue(Recaida) +
                         ' AND (SO_AUTOORIGINAL = ' + SqlValue(Autorizacion) + ' OR SO_AUTOAPRO = ' + SqlValue(Autorizacion) + ')' +
                         ' AND SO_PRESUPUESTO = PA_ID)';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmSeleccionarPresupuesto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('COTIZACION') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName('COTIZACION')).Currency := True;
end;

procedure TfrmSeleccionarPresupuesto.FSFormShow(Sender: TObject);
begin
  inherited;

  tbRefrescarClick(nil);
end;

procedure TfrmSeleccionarPresupuesto.tbSeleccionarClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  if sdqConsulta.IsEmpty then
    MsgBox('No se han encontrado registros en la grilla.', MB_OK + MB_ICONWARNING)
  else
  try
    sSql := GetInsertSiniestroOrtopedia(Siniestro, Orden, Recaida, Autorizacion, sdqConsulta.FieldByName('PRESUPUESTO').AsInteger);
    EjecutarSql(sSql);

    pbCargoDatos := True;

    MsgBox('El presupuesto se asignó correctamente.', MB_OK + MB_ICONINFORMATION);

    RefreshData;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al asignar el presupuesto.');
  end;
end;

{ Arma el sql para hacer el insert en la tabla mso_SiniestroOrtopedia }
function GetInsertSiniestroOrtopedia(iSiniestro, iOrden, iRecaida, iAutorizacion: Integer; IdPresupuesto: TTableId): String;
begin
  with TSql.Create('MSO_SINIESTROORTOPEDIA') do
  try
    PrimaryKey.Add('SO_NROPEDIDO', GetSecNextVal('SEQ_MSO_ID'));
    Fields.Add('SO_SINIESTRO',     iSiniestro);
    Fields.Add('SO_ORDEN',         iOrden);
    Fields.Add('SO_RECAIDA',       iRecaida);
    Fields.Add('SO_AUTOORIGINAL',  iAutorizacion);
    Fields.Add('SO_PRESUPUESTO',   IdPresupuesto);
    Fields.Add('SO_USUALTA',       frmPrincipal.DBLogin.UserId);
    Fields.Add('SO_FECHAALTA',     exDateTime);

    SqlType := stInsert;

    Result := Sql;
  finally
    Free;
  end;
end;

procedure TfrmSeleccionarPresupuesto.FormCreate(Sender: TObject);
begin
  inherited;

  pbCargoDatos := False;
end;

procedure TfrmSeleccionarPresupuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if pbCargoDatos then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

end.
