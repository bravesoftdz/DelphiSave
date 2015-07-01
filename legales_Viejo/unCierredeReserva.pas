unit unCierredeReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PeriodoPicker;

type
  TfrmCierredeReserva = class(TfrmCustomGridABM)
    lbPeriodo: TLabel;
    edPeriodo: TPeriodoPicker;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmCierredeReserva: TfrmCierredeReserva;

implementation

uses
    VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, AnsiSql,
  unCustomConsulta;
{$R *.dfm}

procedure TfrmCierredeReserva.ClearControls;
begin
  inherited;
  edPeriodo.Clear;
  VCLExtra.LockControls(edPeriodo, False);
  edPeriodo.Text := ValorSql(' SELECT art.periodo_proximo (MAX (pc_periodo)) '+
                             '   FROM legales.lpc_procesocierrereserva '+
                             '  WHERE pc_fechabaja IS NULL')
end;

function TfrmCierredeReserva.DoABM: Boolean;
begin
  if ModoABM = maAlta Then
  begin
    EjecutarSql(
        ' Begin art.legales.do_cierremensual('+SqlValue(edPeriodo.Text)+','+
          SqlValue(Sesion.UserID)+'); end;');
  end;
  sdqConsulta.Refresh;
  fpAbm.Close;
  Result := True;
end;



procedure TfrmCierredeReserva.LoadControls;
begin
  inherited;
  ClearControls;
  edPeriodo.Text := sdqConsulta.FieldByName('PC_PERIODO').AsString;
  vclExtra.LockControl(edPeriodo,True);
end;

function TfrmCierredeReserva.Validar: Boolean;
var
  periodomax : String;
begin
  Result := True;
  Verificar(IsEmptyString(edPeriodo.Text),edPeriodo, 'Debe especificar un Periodo.');
  periodomax := ValorSql(
    ' SELECT art.periodo_proximo (MAX (pc_periodo)) '+
    '   FROM legales.lpc_procesocierrereserva '+
    '  WHERE pc_fechabaja IS NULL ');
  Verificar(periodomax <> edPeriodo.Text, edPeriodo, 'Debe ser el periodo consecutivo al último cerrado.' );
  Verificar(ExisteSql(
    ' SELECT 1 '+
    '   FROM dual '+
    ' WHERE art.actualdate < TO_DATE('+SqlValue(edPeriodo.Text)+',''YYYYMM'')'),edPeriodo,
    ' El perido debe ser menor que la fecha de hoy.');
end;


procedure TfrmCierredeReserva.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PC_FECHABAJA';
  Sql.TableName := 'legales.lpc_procesocierrereserva ';
end;

end.
