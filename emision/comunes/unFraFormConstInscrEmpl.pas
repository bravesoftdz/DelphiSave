unit unFraFormConstInscrEmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, StdCtrls, CurrEdit, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision,
  JvExControls, JvComponent, JvLinkLabel, ToolWin, ComCtrls, JvBitmapButton,
  Buttons, General;

type
  TfraFormConstInscrEmpl = class(TFrame)
    lblFechaIncripcion: TLabel;
    edFechaIncripcion: TDateComboBox;
    chkAnulaFechaInscrip: TCheckBox;
    procedure chkAnulaFechaInscripClick(Sender: TObject);
  private
    FContrato: integer;
    FPeriodo: String;
    function GetFechaIncripcion: TDate;
  public
    property FechaIncripcion: TDate read GetFechaIncripcion;
    property Periodo: String  read FPeriodo write FPeriodo;
    property Contrato: integer read FContrato write FContrato;
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure ActivarControles(aActive: boolean);
  end;


implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

procedure TfraFormConstInscrEmpl.ActivarControles(
  aActive: boolean);
begin
  LockControls(self, not aActive);
end;

procedure TfraFormConstInscrEmpl.LimpiarControles;
begin
  chkAnulaFechaInscrip.Checked := false;
  edFechaIncripcion.Clear;
end;

procedure TfraFormConstInscrEmpl.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    if chkAnulaFechaInscrip.Checked then
      Fields.Add('NP_FECHAINSCRIPCIONEMPL', exNull)
    else
      Fields.Add('NP_FECHAINSCRIPCIONEMPL', edFechaIncripcion.Date);

    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

function TfraFormConstInscrEmpl.Validar(aIdFormulario: integer): boolean;
var
  bExist: boolean;
begin
  Verificar((not chkAnulaFechaInscrip.Checked) and edFechaIncripcion.IsEmpty, edFechaIncripcion, 'Debe ingresar la Fecha de inscripción.');
  bExist := ExisteSql(' SELECT 1 ' +
                      ' FROM emi.idj_ddjj ' +
                      ' WHERE dj_contrato = ' + SqlValue(FContrato) +
                      ' AND dj_periodo <= TO_CHAR(ADD_MONTHS(' + SqlValue(edFechaIncripcion.Date) + ',-2), ''YYYYMM'')' +
                      ' AND dj_estado + 0 IN(1, 2) ' +
                      ' AND dj_empleados <> 0 ');
  result := (not bExist) or (bExist and (MsgBox('Hay DDJJs con personal en los períodos a anular. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES));
end;

procedure TfraFormConstInscrEmpl.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_FECHAINSCRIPCIONEMPL ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edFechaIncripcion.Date := Q.FieldbyName('NP_FECHAINSCRIPCIONEMPL').AsDateTime;
    chkAnulaFechaInscrip.Checked := (edFechaIncripcion.Date = 0); 
  finally
    Q.free;
  end;
end;

function TfraFormConstInscrEmpl.GetFechaIncripcion: TDate;
begin
  result := edFechaIncripcion.Date;
end;

procedure TfraFormConstInscrEmpl.chkAnulaFechaInscripClick(Sender: TObject);
begin
   if chkAnulaFechaInscrip.Checked then edFechaIncripcion.Clear;
   LockControl(edFechaIncripcion, chkAnulaFechaInscrip.Checked);
end;

end.
