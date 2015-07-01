unit unFraForm921;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, IntEdit, VCLExtra,
  CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql,
  SDEngine, unConstEmision, Strfuncs, unFuncionesEmision, General;

type
  TfraForm921 = class(TFrame)
    chkConTicket: TCheckBox;
    lblNroVerificador: TLabel;
    lblFechaPresentacion: TLabel;
    edFechaPresentacion: TDateComboBox;
    lblEmpleadosAlta: TLabel;
    edEmpleadosAlta: TIntEdit;
    lblEmpleadosBaja: TLabel;
    edEmpleadosBaja: TIntEdit;
    edNumeroVerificador: TPatternEdit;
    procedure edNumeroVerificadorExit(Sender: TObject);
    procedure chkConTicketClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetConTicket: boolean;
    function GetEmpleadosAlta: integer;
    function GetEmpleadosBaja: integer;
    function GetFechaPresentacion: TDate;
    function GetNumeroVerificador: string;
    procedure ActivarTicket(aActive: boolean);
  public
    property ConTicket: boolean read GetConTicket;
    property NumeroVerificador: string read GetNumeroVerificador;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property EmpleadosAlta: integer read GetEmpleadosAlta;
    property EmpleadosBaja: integer read GetEmpleadosBaja;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    function Validar(aIdFormulario: integer): boolean;
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer; aIdFormulario: integer);
  end;

implementation

uses DB;

{$R *.dfm}

procedure TfraForm921.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarTicket(aActive);
end;

function TfraForm921.GetConTicket: boolean;
begin
  result := chkConTicket.Checked;
end;

function TfraForm921.GetEmpleadosAlta: integer;
begin
  result := edEmpleadosAlta.Value;
end;

function TfraForm921.GetEmpleadosBaja: integer;
begin
  result := edEmpleadosBaja.Value;
end;

function TfraForm921.GetFechaPresentacion: TDate;
begin
  result := edFechaPresentacion.Date;
end;

function TfraForm921.GetNumeroVerificador: string;
begin
  result := edNumeroVerificador.EditText;
end;

procedure TfraForm921.LimpiarControles;
begin
  chkConTicket.Checked := false;
  edNumeroVerificador.Clear;
  edEmpleadosAlta.Clear;
  edEmpleadosBaja.Clear;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
end;

procedure TfraForm921.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
  aPeriodo: string; aIlegible: boolean; aMixto: String);
begin

  aIdNotaPeriodo := ValorSqlInteger(' SELECT NP_ID ' +
                                    ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                                    ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                                      iif(aPeriodo = '', ' AND NP_PERIODO IS NULL ', ' AND NP_PERIODO = ' + SqlValue(aPeriodo)) +
                                    ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                                    ' AND NP_FORMULARIOMIXTO = ' + SqlValue(aMixto), -1);//aIdNotaPeriodo);

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

    Fields.Add('NP_CONTICKET', ConTicket);
    if (NumeroVerificador <> '000000') then
      Fields.Add('NP_NUMEROVERIFICADOR', NumeroVerificador)
    else
      Fields.Add('NP_NUMEROVERIFICADOR', exNull);

    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_EMPLEADOSCONALTA', EmpleadosAlta);
    Fields.Add('NP_EMPLEADOSCONBAJA', EmpleadosBaja);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

function TfraForm921.Validar(aIdFormulario: integer): boolean;
begin
  Verificar((edNumeroVerificador.EditText = '000000') or (edNumeroVerificador.EditText = ''), edNumeroVerificador, 'Debe ingresar el Número Verificador.');
  Verificar((chkConTicket.Checked) and (edFechaPresentacion.IsEmpty), edFechaPresentacion, 'Debe ingresar la Fecha de presentación.');
  Verificar((not edFechaPresentacion.IsEmpty) and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  result := true;
end;

procedure TfraForm921.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_CONTICKET, NP_NUMEROVERIFICADOR, NP_FECHAPRESENTACION, ' +
                ' NP_EMPLEADOSCONALTA, NP_EMPLEADOSCONBAJA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edEmpleadosAlta.Value := Q.FieldbyName('NP_EMPLEADOSCONALTA').AsInteger;
    edEmpleadosBaja.Value := Q.FieldbyName('NP_EMPLEADOSCONBAJA').AsInteger;
    edNumeroVerificador.EditText := Q.FieldbyName('NP_NUMEROVERIFICADOR').AsString;
    chkConTicket.Checked := Q.FieldbyName('NP_CONTICKET').AsString = 'S';
    edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
  finally
    Q.free;
  end;
end;

procedure TfraForm921.edNumeroVerificadorExit(Sender: TObject);
begin
  TPatternEdit(Sender).Text := LPad(TPatternEdit(Sender).Text, '0', 6);
end;

procedure TfraForm921.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
  begin
    edNumeroVerificador.Clear;
    edFechaPresentacion.Clear;
  end;
  LockControls(edFechaPresentacion, not aActive or not chkConTicket.Checked);
end;

procedure TfraForm921.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraForm921.SimularEstado(aContrato, aIdNotaPeriodo,
  aIdFormulario: integer);
begin
  try
    do_aplicarcaso10(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

end.
