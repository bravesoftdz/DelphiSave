unit unfraFormAdicionarResumen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, IntEdit, VCLExtra,
  CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql,
  SDEngine, unConstEmision, Strfuncs, unFuncionesEmision, General, CurrEdit;

type
  TfraFormAdicionarResumen = class(TFrame)
    lblFechaPresentacion: TLabel;
    edFechaPresentacion: TDateComboBox;
    lblEmpleados: TLabel;
    edEmpleados: TIntEdit;
    lblMasaSalarial: TLabel;
    edMasaSalarial: TCurrencyEdit;
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetEmpleados: integer;
    function GetMasaSalarial: Currency;
    function GetFechaPresentacion: TDate;
    procedure ActivarTicket(aActive: boolean);
  public
    property Empleados: integer read GetEmpleados;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    function Validar(aIdFormulario: integer): boolean;
    procedure CargarFormulario(aIdNotaPeriodo: integer);
  end;

implementation

uses DB;

{$R *.dfm}

procedure TfraFormAdicionarResumen.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarTicket(aActive);
end;

function TfraFormAdicionarResumen.GetFechaPresentacion: TDate;
begin
  result := edFechaPresentacion.Date;
end;

procedure TfraFormAdicionarResumen.LimpiarControles;
begin
  edEmpleados.Clear;
  edMasaSalarial.Clear;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
end;

procedure TfraFormAdicionarResumen.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion);
    Fields.Add('NP_TOTALEMPLEADOS', Empleados);
    Fields.AddExtended('NP_TOTALMASASALARIAL', MasaSalarial);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

function TfraFormAdicionarResumen.Validar(aIdFormulario: integer): boolean;
begin
  Verificar((edEmpleados.Value = 0) and (edMasaSalarial.Value = 0), edEmpleados, 'La cantidad de empleados y masa no pueden ser cero.');
  Verificar((edFechaPresentacion.IsEmpty), edFechaPresentacion, 'La fecha de presentación no puede estar vacía.');
  Verificar((not edFechaPresentacion.IsEmpty) and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La fecha de presentación no puede ser futura.');
  result := true;
end;

procedure TfraFormAdicionarResumen.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, NP_FECHAPRESENTACION ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edEmpleados.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
    edMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsInteger;
    edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
  finally
    Q.free;
  end;
end;

procedure TfraFormAdicionarResumen.ActivarTicket(aActive: boolean);
begin
  LockControls(edEmpleados, not aActive);
  LockControls(edMasaSalarial, not aActive);
  LockControls(edFechaPresentacion, not aActive);
end;


function TfraFormAdicionarResumen.GetEmpleados: integer;
begin
  result := edEmpleados.Value;
end;

function TfraFormAdicionarResumen.GetMasaSalarial: Currency;
begin
  result := edMasaSalarial.Value;
end;

end.
