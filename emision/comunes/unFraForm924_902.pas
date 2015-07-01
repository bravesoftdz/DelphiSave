unit unFraForm924_902;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, CurrEdit, StdCtrls, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision, Strfuncs, General;

type
  TfraForm924_902 = class(TFrame)
    lblCodigoRectificativa: TLabel;
    edCodigoRectificativa: TPatternEdit;
    lblEmpleados: TLabel;
    edEmpleados: TIntEdit;
    chkConTicket: TCheckBox;
    chkConResumen: TCheckBox;
    gbResumen: TGroupBox;
    lblMasaSalarial: TLabel;
    lblFechaPres: TLabel;
    edMasaSalarial: TCurrencyEdit;
    edFechaPres: TDateComboBox;
    procedure chkConResumenClick(Sender: TObject);
    procedure chkConTicketClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetConResumen: boolean;
    function GetConTicket: boolean;
    function GetTotalEmpleados: integer;
    function GetFechaPresentacion: TDate;
    function GetTotalMasaSalarial: Currency;
    function GetRectificativa: string;
  public
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    property Rectificativa: string read GetRectificativa;
    property TotalEmpleados: integer read GetTotalEmpleados;
    property TotalMasaSalarial: Currency	read GetTotalMasaSalarial;
    property ConTicket: boolean read GetConTicket;
    property ConResumen: boolean read GetConResumen;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure ActivarResumen(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraForm924_902.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarResumen(aActive);
end;

procedure TfraForm924_902.LimpiarControles;
begin
  edCodigoRectificativa.Clear;
  edEmpleados.Clear;
  chkConTicket.Checked := false;
  chkConResumen.Checked := false;
end;

procedure TfraForm924_902.chkConResumenClick(Sender: TObject);
begin
  ActivarResumen(chkConResumen.Enabled);
end;

procedure TfraForm924_902.ActivarResumen(aActive: boolean);
begin
  if aActive and not chkConResumen.Checked then edMasaSalarial.Clear;
  if aActive and not chkConTicket.Checked and not FConservarFechaPres then edFechaPres.Clear;
  LockControl(edMasaSalarial, not aActive or not chkConResumen.Checked);
  LockControl(edFechaPres, not aActive or not chkConTicket.Checked);
end;

procedure TfraForm924_902.chkConTicketClick(Sender: TObject);
begin
  ActivarResumen(chkConTicket.Enabled);
end;

function TfraForm924_902.GetConResumen: boolean;
begin
  result := chkConResumen.Checked;
end;

function TfraForm924_902.GetConTicket: boolean;
begin
  result := chkConTicket.Checked;
end;

function TfraForm924_902.GetTotalEmpleados: integer;
begin
  result := edEmpleados.Value;
end;

function TfraForm924_902.GetFechaPresentacion: TDate;
begin
  result := edFechaPres.Date;
end;

function TfraForm924_902.GetTotalMasaSalarial: Currency;
begin
  result := edMasaSalarial.Value;
end;

function TfraForm924_902.GetRectificativa: string;
begin
  result := lpad(edCodigoRectificativa.Text, '0', 2);
end;

procedure TfraForm924_902.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    Fields.Add('NP_CODIGORECTIFICATIVA', Rectificativa);
    Fields.Add('NP_TOTALEMPLEADOS', TotalEmpleados);
    Fields.Add('NP_CONTICKET', ConTicket);
    Fields.Add('NP_CONRESUMEN', ConResumen);
    Fields.AddExtended('NP_TOTALMASASALARIAL', TotalMasaSalarial);

    if (FechaPresentacion > 0) and ConTicket then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;


function TfraForm924_902.Validar(aIdFormulario: integer): boolean;
begin
//  Verificar(edCodigoRectificativa.IsEmpty, edCodigoRectificativa, 'Debe ingresar el Código de Rectificativa.');
//  Verificar(edEmpleados.Value = 0, edEmpleados, 'La debe ingresar la cantidad de empleados.');
//  Verificar(chkConResumen.Checked and (edMasaSalarial.Value = 0), edMasaSalarial, 'La debe ingresar la masa salarial.');
  Verificar(chkConTicket.Checked and (edFechaPres.IsEmpty), edFechaPres, 'Debe ingresar la Fecha de presentación.');
  Verificar((not edFechaPres.IsEmpty) and (edFechaPres.Date > DBDate), edFechaPres, 'La Fecha de presentación no puede ser futura.');
  result := true;
end;

procedure TfraForm924_902.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_CODIGORECTIFICATIVA, ' +
                ' NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_CONTICKET, NP_CONRESUMEN, NP_FECHAPRESENTACION' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edCodigoRectificativa.Text := Q.FieldbyName('NP_CODIGORECTIFICATIVA').AsString;
    edEmpleados.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
    chkConTicket.Checked := Q.FieldbyName('NP_CONTICKET').AsString = 'S';
    chkConResumen.Checked := Q.FieldbyName('NP_CONRESUMEN').AsString = 'S';
    if not Q.FieldbyName('NP_FECHAPRESENTACION').IsNull then
      edFechaPres.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    if not Q.FieldbyName('NP_TOTALMASASALARIAL').IsNull then
      edMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
  finally
    Q.free;
  end;
end;

procedure TfraForm924_902.SimularEstado(aContrato,
  aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso7(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

end.
