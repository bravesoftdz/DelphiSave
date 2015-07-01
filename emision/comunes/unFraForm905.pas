unit unFraForm905;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternEdit, IntEdit, StdCtrls, Mask, ToolEdit, DateComboBox, VCLExtra,
  CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql,
  SDEngine, unConstEmision, unFuncionesEmision, Strfuncs, General;

type
  TfraForm905 = class(TFrame)
    chkConTicket: TCheckBox;
    lblFechaPresentacion: TLabel;
    edFechaPresentacion: TDateComboBox;
    lblCodigoRectificativa: TLabel;
    edCodigoRectificativa: TPatternEdit;
    procedure chkConTicketClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetConTicket: boolean;
    function GetFechaPresentacion: TDate;
    function GetRectificativa: String;
  public
    property ConTicket: boolean read GetConTicket;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Rectificativa: String read GetRectificativa;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure ActivarTicket(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraForm905.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarTicket(aActive);
end;

function TfraForm905.GetConTicket: boolean;
begin
  result := chkConTicket.Checked;
end;

function TfraForm905.GetFechaPresentacion: TDate;
begin
  result := edFechaPresentacion.Date;
end;

function TfraForm905.GetRectificativa: string;
begin
  result := lpad(edCodigoRectificativa.Text, '0', 2);
end;

procedure TfraForm905.LimpiarControles;
begin
  chkConTicket.Checked := false;
  if not FConservarFechaPres then
    edFechaPresentacion.Clear;
  edCodigoRectificativa.Clear;
end;

function TfraForm905.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(chkConTicket.Checked and edFechaPresentacion.IsEmpty, edFechaPresentacion, 'Debe ingresar la fecha de presentación.');
  Verificar(chkConTicket.Checked and (edFechaPresentacion.Date > DBDate), edFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  Verificar((edCodigoRectificativa.Text = ''), edCodigoRectificativa, 'Debe ingresar el Código de Rectificativa.');
  result := true;
end;

procedure TfraForm905.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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
    Fields.Add('NP_TOTALEMPLEADOS', 0);
    Fields.AddExtended('NP_TOTALMASASALARIAL', 0);

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
    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_CODIGORECTIFICATIVA', Rectificativa);
    Fields.Add('NP_FORMULARIOMIXTO', 'N');
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

procedure TfraForm905.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_CONTICKET, NP_FECHAPRESENTACION, ' +
                ' NP_CODIGORECTIFICATIVA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    chkConTicket.Checked := Q.FieldbyName('NP_CONTICKET').AsString = 'S';
    if not Q.FieldbyName('NP_FECHAPRESENTACION').IsNull then
      edFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    edCodigoRectificativa.Text := Q.FieldbyName('NP_CODIGORECTIFICATIVA').AsString;
  finally
    Q.free;
  end;
end;

procedure TfraForm905.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
    edFechaPresentacion.Clear;
  LockControls(edFechaPresentacion, not aActive or not chkConTicket.Checked);
end;

procedure TfraForm905.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraForm905.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso4(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

end.
