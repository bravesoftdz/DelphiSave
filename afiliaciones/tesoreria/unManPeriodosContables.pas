unit unManPeriodosContables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion, unFraCodDesc,
  Mask, ToolEdit, PeriodoPicker, unArtDBAwareFrame;

type
  TfrmManPeriodosContables = class(TfrmCustomGridABM)
    fraPC_CUENTA: TfraCodDesc;
    lbCuenta: TLabel;
    edPC_PERIODO: TPeriodoPicker;
    Label1: TLabel;
    Label2: TLabel;
    cmbPC_ESTADO: TComboBox;
    tbReapertura: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbReaperturaClick(Sender: TObject);
  protected
    function Validar: boolean; override;
    function DoABM: boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManPeriodosContables: TfrmManPeriodosContables;

implementation

{$R *.DFM}

uses
  SqlFuncs, AnsiSql, unDmPrincipal, unSesion, CustomDlgs, Periodo, VCLExtra,
  unART, General;

{ TfrmManPeriodosContables }

procedure TfrmManPeriodosContables.ClearControls;
begin
  cmbPC_ESTADO.ItemIndex := 0;
  VCLExtra.LockControls([fraPC_CUENTA, edPC_PERIODO], False);
end;

function TfrmManPeriodosContables.DoABM: boolean;
begin
  Sql.Clear;
  Sql.TableName := 'TESO.RPC_PERIODOCONCILIACION';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add( 'PC_ID', sdqConsulta.FieldByName('PC_ID').AsInteger);
    Sql.Fields.Add( 'PC_FECHABAJA', SQL_ACTUALDATE, False);
    Sql.Fields.Add( 'PC_USUBAJA', Sesion.UserID);
  end else
  begin
    if cmbPC_ESTADO.ItemIndex = 0 then
    begin {Abrir Período Contable}
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add( 'PC_ID', 'TESO.SEQ_RPC_ID.NEXTVAL', False);
      Sql.Fields.Add( 'PC_CUENTA', fraPC_CUENTA.Value );
      Sql.Fields.Add( 'PC_PERIODO', edPC_PERIODO.Periodo.Valor );
      Sql.Fields.Add( 'PC_FECHAALTA', SQL_ACTUALDATE, False);
      Sql.Fields.Add( 'PC_USUALTA', Sesion.UserID);
      Sql.Fields.Add( 'PC_ESTADO', 'A')
    end
    else
    begin {Cerrar Período Contable}
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add( 'PC_ID', sdqConsulta.FieldByName('PC_ID').AsInteger);
      Sql.Fields.Add( 'PC_ESTADO', 'C');
      Sql.Fields.Add( 'PC_FECHAMODIF', SQL_ACTUALDATE, False);
      Sql.Fields.Add( 'PC_USUMODIF', Sesion.UserID);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManPeriodosContables.LoadControls;
begin
  cmbPC_ESTADO.ItemIndex := 1;
  fraPC_CUENTA.Value := sdqConsulta.FieldByName('PC_CUENTA').AsInteger;
  edPC_PERIODO.Periodo.Valor := sdqConsulta.FieldByName('PC_PERIODO').AsString;
  VCLExtra.LockControls([fraPC_CUENTA, edPC_PERIODO], True);
end;

function TfrmManPeriodosContables.Validar: boolean;
var
  bExiste: boolean;
begin
  Verificar(fraPC_CUENTA.IsEmpty, fraPC_CUENTA.edCodigo, 'Debe elegir una cuenta bancaria.');
  Verificar(edPC_PERIODO.Periodo.Valor = '', edPC_PERIODO, 'Debe elegir un período válido.');

  if ModoABM = maAlta then
  begin
    bExiste := ExisteSQLEx('SELECT 1 ' +
                             'FROM TESO.RPC_PERIODOCONCILIACION ' +
                            'WHERE PC_CUENTA = :CUENTA ' +
                              'AND PC_PERIODO = :PERIODO', [fraPC_CUENTA.Value, edPC_PERIODO.Periodo.Valor]);
    Verificar(bExiste, fraPC_CUENTA.edCodigo, 'No puede dar de alta un período que ya existe para la cuenta ' + fraPC_CUENTA.cmbDescripcion.Text + '.');
  end;

  Result := True;
end;

procedure TfrmManPeriodosContables.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PC_FECHABAJA';

  tbReapertura.Left := 77;
end;

procedure TfrmManPeriodosContables.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('PC_ESTADO').AsString = 'C', nil, 'El período ya se encuentra cerrado.');
  
  //inherited; NO QUIERO QUE MUESTRE EL FORMPANEL, QUIERO QUE LO CIERRE DIRECTAMENTE
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    ModoABM := maModificacion;
    ModoABMToSqlType;
    LoadControls;
    if MsgAsk('Ud. está a punto de cerrar el período contable ' +
              sdqConsulta.FieldByName('PC_PERIODO').AsString +
              ' correspondiente a la cuenta ' +
              sdqConsulta.FieldByName('CB_NUMERO').AsString + '.' + CRLF +
              '¿Está seguro de continuar?') then
      DoABM;
  end;
  RefreshData;
end;

procedure TfrmManPeriodosContables.tbReaperturaClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay ningún registro seleccionado.');
  Verificar(sdqConsulta.FieldByName('PC_ESTADO').AsString <> 'C', Nil, 'El periodo no se encuentra cerrado.');

  if MsgBox('¿Confirma la reapertura del periodo?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      try
        with Sql do
          begin
            Clear;
            TableName := 'TESO.RPC_PERIODOCONCILIACION';

            SqlType := stUpdate;
            PrimaryKey.Add( 'PC_ID', sdqConsulta.FieldByName('PC_ID').AsInteger);
            Fields.Add( 'PC_ESTADO', 'A');
            Fields.Add( 'PC_FECHAMODIF', SQL_ACTUALDATE, False);
            Fields.Add( 'PC_USUMODIF', Sesion.UserID);
            EjecutarSql(Sql);

            tbRefrescarClick(nil);
          end;
        except
         on E: Exception do
           ErrorMsg(E);
        end;
    end;
end;

end.

