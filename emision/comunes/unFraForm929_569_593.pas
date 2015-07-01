unit unFraForm929_569_593;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql,
  unSesion, Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision,
  Mask, ToolEdit, DateComboBox, PeriodoPicker;

type
  TfraForm929_569_593 = class(TFrame)
    chkConResumen: TCheckBox;
    lblFechaBaja: TLabel;
    edFechaBaja: TDateComboBox;
    procedure chkConResumenClick(Sender: TObject);
  private
    FContrato: integer;
    FedPeriodoBaja: TPeriodoPicker;
    function GetConResumen: boolean;
    procedure ActivarResumen(aActive: boolean);
    function ExisteForm(aIdFormulario, aIdNota, aIdNotaPeriodo: integer): boolean;
  public
    property ConResumen: boolean read GetConResumen;
    property Contrato: integer read FContrato write FContrato;
    property edPeriodoBaja: TPeriodoPicker read FedPeriodoBaja write FedPeriodoBaja;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

uses DB;

{$R *.dfm}

procedure TfraForm929_569_593.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarResumen(aActive);
end;

function TfraForm929_569_593.GetConResumen: boolean;
begin
  result := chkConResumen.Checked;
end;

procedure TfraForm929_569_593.LimpiarControles;
begin
  chkConResumen.Checked := false;
end;

function TfraForm929_569_593.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(edFechaBaja.IsEmpty, edFechaBaja, 'Debe ingresar la Fecha de baja por falta de pagos.');
  Verificar((chkConResumen.Checked) and (FedPeriodoBaja.Text = ''), FedPeriodoBaja, 'Debe ingresar el período sin personal.');
  Verificar(not get_isrescindida(FContrato), edFechaBaja, 'La empresa no se encuentra rescindida.');
  result := true;
end;

procedure TfraForm929_569_593.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
  aPeriodo: string; aIlegible: boolean; aMixto: String);
begin

  if ExisteForm(aIdFormulario, aIdNota, aIdNotaPeriodo) then
  begin
    InvalidMsg(self, 'Este formulario ya fue cargado en esta nota.');
    Abort;
  end;

(*
  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                    ' AND NP_PERIODO = ' + SqlValue(aPeriodo) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                                    ' AND NP_FORMULARIOMIXTO = ' + SqlValue(aMixto), -1);//aIdNotaPeriodo);
*)

  with TSql.Create do
  try
    TableName := 'EMI.INP_NOTACONTRATOPERIODO';
    Fields.Add('NP_PERIODO', aPeriodo);
    Fields.Add('NP_IDNOTA', aIdNota);
    Fields.Add('NP_IDTIPOFORMULARIO', aIdFormulario);

    if (aIdNotaPeriodo = -1) then
    begin
      SqlType := stInsert;
      aIdNotaPeriodo := GetSecNextVal('emi.seq_inp_id');
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAALTA', exDateTime);
      Fields.Add('NP_USUALTA', Sesion.LoginName);
    end
    else begin
      SqlType := stUpdate;
      PrimaryKey.Add('NP_ID', aIdNotaPeriodo);
      Fields.Add('NP_FECHAMODIF', exDateTime);
      Fields.Add('NP_USUMODIF', Sesion.LoginName);
      Fields.Add('NP_FECHABAJA', exNull);
      Fields.Add('NP_USUBAJA', exNull);
    end;

    Fields.Add('NP_CONRESUMEN', ConResumen);
    Fields.Add('NP_FECHABAJACONTRATO', edFechaBaja.Date);
    Fields.Add('NP_FECHAPRESENTACION', edFechaBaja.Date);
    Fields.Add('NP_TOTALEMPLEADOS', 0);
    Fields.AddExtended('NP_TOTALMASASALARIAL', 0);

    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

procedure TfraForm929_569_593.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  edPeriodoBaja.Enabled := true;
  Q := GetQuery(' SELECT NP_CONRESUMEN, NP_FECHABAJACONTRATO ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    chkConResumen.Checked := Q.FieldbyName('NP_CONRESUMEN').AsString = 'S';
    edFechaBaja.Date := Q.FieldbyName('NP_FECHABAJACONTRATO').AsDateTime;
  finally
    Q.free;
  end;
end;

procedure TfraForm929_569_593.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso5(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

procedure TfraForm929_569_593.ActivarResumen(aActive: boolean);
begin
  LockControl(edPeriodoBaja, not aActive or not chkConResumen.Checked);
  if aActive and not chkConResumen.Checked then edPeriodoBaja.Clear
  else begin
    if (edPeriodoBaja.text = '') then
    begin
      edPeriodoBaja.Periodo.SetPeriodoActual;
      edPeriodoBaja.Periodo.Previous;
    end;
  end;
end;

procedure TfraForm929_569_593.chkConResumenClick(Sender: TObject);
begin
  ActivarResumen(chkConResumen.Enabled);
end;

function TfraForm929_569_593.ExisteForm(aIdFormulario: integer; aIdNota: integer; aIdNotaPeriodo: integer): boolean;
begin
  result := ExisteSql(' SELECT 1 ' +
                      ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                      ' AND NP_ID <> ' + SqlValue(aIdNotaPeriodo) +
                      ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                      ' AND NP_FORMULARIOMIXTO <> ''S''');
end;

end.
