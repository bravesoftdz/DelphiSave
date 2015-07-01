
{********************************************************}
{                                                        }
{    Contaduría, Mantenimiento de Tolerancias            }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

unit unManOTC_TOLERANCIACONCILIACION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit;

type
  TfrmManOTC_TOLERANCIACONCILIACION = class(TfrmCustomGridABM)
    Label1: TLabel;
    edTC_MONTO: TCurrencyEdit;
    Label2: TLabel;
    edTC_PORCENTAJE: TCurrencyEdit;
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManOTC_TOLERANCIACONCILIACION: TfrmManOTC_TOLERANCIACONCILIACION;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion;

{$R *.DFM}


{ TfrmContManTolerancias }

procedure TfrmManOTC_TOLERANCIACONCILIACION.ClearControls;
begin
  edTC_MONTO.Clear;
  edTC_PORCENTAJE.Clear;
end;

function TfrmManOTC_TOLERANCIACONCILIACION.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maAlta Then
  begin
    Sql.PrimaryKey.Add('TC_ID', 'SEQ_OTC_ID.NEXTVAL', False);
    Sql.Fields.AddExtended('TC_MONTO', edTC_MONTO.Value, ALL_DECIMALS, False);
    Sql.Fields.AddExtended('TC_PORCENTAJE', edTC_PORCENTAJE.Value, ALL_DECIMALS, False);
    Sql.Fields.Add('TC_USUALTA', Sesion.UserId);
    Sql.Fields.Add('TC_FECHAALTA', exDateTime);
  end
  else
  if ModoABM = maBaja Then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('TC_ID', sdqConsulta.FieldByName('TC_ID').AsInteger);
    Sql.Fields.Add('TC_USUBAJA', Sesion.UserId);
    Sql.Fields.Add('TC_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManOTC_TOLERANCIACONCILIACION.LoadControls;
begin
  edTC_MONTO.Value      := sdqConsulta.FieldByName('TC_MONTO').AsCurrency;
  edTC_PORCENTAJE.Value := sdqConsulta.FieldByName('TC_PORCENTAJE').AsCurrency;
end;

function TfrmManOTC_TOLERANCIACONCILIACION.Validar: Boolean;
begin
  Result := False;
  if not(edTC_MONTO.Value > 0) Then
    InvalidMsg(edTC_MONTO, 'El Monto de Tolerancia es obligatorio')

  else if not((edTC_PORCENTAJE.Value > 0) and (edTC_PORCENTAJE.Value <= 100)) Then
    InvalidMsg(edTC_PORCENTAJE, 'El Porcentaje de Tolerancia es obligatorio')

  else
    Result := True;
end;

procedure TfrmManOTC_TOLERANCIACONCILIACION.tbNuevoClick(Sender: TObject);
begin
  if ExisteSql('SELECT 1 FROM OTC_TOLERANCIACONCILIACION WHERE TC_FECHABAJA IS NULL') Then
    raise Exception.Create('No es posible dar de alta una tolerancia mientras exista una activa.');

  inherited;
end;

procedure TfrmManOTC_TOLERANCIACONCILIACION.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TC_FECHABAJA';
  Sql.TableName := 'OTC_TOLERANCIACONCILIACION';
end;

procedure TfrmManOTC_TOLERANCIACONCILIACION.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('TC_MONTO')).Currency := True;
  TNumericField(DataSet.FieldByName('TC_PORCENTAJE')).DisplayFormat := edTC_PORCENTAJE.DisplayFormat;
end;

end.
