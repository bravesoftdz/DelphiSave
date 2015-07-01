unit unFraFormMonoSol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, StdCtrls, CurrEdit, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision,
  JvExControls, JvComponent, JvLinkLabel, ToolWin, ComCtrls, JvBitmapButton,
  Buttons, General;

type
  TfraFormMonoSol = class(TFrame)
    lblEmp: TLabel;
    edEmp: TIntEdit;
    lblMasa: TLabel;
    edMasa: TCurrencyEdit;
    chkEnmienda: TCheckBox;
    lblFechaPres: TLabel;
    edFechaPres: TDateComboBox;
    cbMonotributista: TCheckBox;
    lblNotaRelac: TLabel;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarNotaRelacClick(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
  private
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
    FPeriodo: String;
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetEmpleados: integer;
    function GetEnmienda: boolean;
    function GetFechaPresentacion: TDate;
    function GetMasaSalarial: Currency;
    function GetMonotributista: boolean;
  public
    property Empleados: integer read GetEmpleados;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property Enmienda: boolean read GetEnmienda;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Periodo: String  read FPeriodo write FPeriodo;
    property Contrato: integer read FContrato write FContrato;
    property Monotributista: boolean read GetMonotributista;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure MostrarBotones(aVer: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer; aIdFormulario: integer);
  end;


implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

procedure TfraFormMonoSol.ActivarControles(
  aActive: boolean);
begin
  LockControls(self, not aActive);
  btnBuscarNotaRelac.Enabled := aActive;
  btnBuscarManualNotaRelac.Enabled := aActive;
  lblNotaRelac.Enabled := true;
end;

function TfraFormMonoSol.GetEmpleados: integer;
begin
  result := edEmp.Value;
end;

function TfraFormMonoSol.GetEnmienda: boolean;
begin
  result := chkEnmienda.Checked;
end;

function TfraFormMonoSol.GetFechaPresentacion: TDate;
begin
  result := edFechaPres.Date;
end;

function TfraFormMonoSol.GetMasaSalarial: Currency;
begin
  result := edMasa.Value;
end;

procedure TfraFormMonoSol.LimpiarControles;
begin
  edEmp.Clear;
  edMasa.Clear;
  chkEnmienda.Checked := false;
  if not FConservarFechaPres then
    edFechaPres.Clear;
  cbMonotributista.Checked := false;
  lblNotaRelac.Visible := false;
end;

procedure TfraFormMonoSol.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    Fields.Add('NP_TOTALEMPLEADOS', Empleados);
    Fields.AddExtended('NP_TOTALMASASALARIAL', MasaSalarial);
    Fields.Add('NP_ENMIENDA', Enmienda);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

    if cbMonotributista.Checked then
      Fields.Add('NP_IDINSCRIPCION', INSCRIPCION_MONOTRIBUTISTA)
    else
      Fields.Add('NP_IDINSCRIPCION', INSCRIPCION_INDETERMINADO);

    //Si no tiene una nota relacionada intento asociarle una
    if not (FIdNotaPeriodoRelacion > 0) then
      btnBuscarNotaRelacClick(nil);

    if (FIdNotaPeriodoRelacion > 0) then
    begin
      Fields.Add('NP_TIPORELACION', FTipoRelacion);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', FIdNotaPeriodoRelacion);
    end
    else begin
      Fields.Add('NP_TIPORELACION', exNull);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', exNull);
    end;

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

function TfraFormMonoSol.Validar(aIdFormulario: integer): boolean;
begin
//  Verificar(edEmp.Value = 0, edEmp, 'Debe ingresar la cantidad de empleados.');
//  Verificar(edMasa.Value = 0, edMasa, 'Debe ingresar la Masa Salarial.');
  Verificar(edFechaPres.IsEmpty, edFechaPres, 'Debe ingresar la Fecha de presentación.');
  Verificar(edFechaPres.Date > DBDate, edFechaPres, 'La Fecha de presentación no puede ser futura.');
  result := true;
end;

procedure TfraFormMonoSol.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_ENMIENDA, NP_FECHAPRESENTACION, NP_IDINSCRIPCION, ' +
                ' NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edEmp.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
    edMasa.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
    chkEnmienda.Checked := Q.FieldbyName('NP_ENMIENDA').AsString = 'S';
    edFechaPres.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    cbMonotributista.Checked := (Q.FieldbyName('NP_IDINSCRIPCION').AsInteger = INSCRIPCION_MONOTRIBUTISTA);
    FIdNotaPeriodoRelacion := Q.FieldbyName('NOTAPERIODORELACIONADA').AsInteger;
    FTipoRelacion := Q.FieldbyName('NP_TIPORELACION').AsString;
    lblNotaRelac.Visible := (FIdNotaPeriodoRelacion > 0);
    if lblNotaRelac.Visible then
    begin
      MostrarBotones(true);
      lblNotaRelac.Caption := Q.FieldbyName('NOTA').AsString;
    end;
  finally
    Q.free;
  end;
end;

procedure TfraFormMonoSol.SimularEstado(aContrato,
  aIdNotaPeriodo: integer; aIdFormulario: integer);
begin
  try
    do_aplicarcaso8(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

procedure TfraFormMonoSol.lblNotaRelacClick(Sender: TObject);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_ID, NP_IDTIPOFORMULARIO, NP_PERIODO, NP_IDESTADOFORMULARIO, NP_ILEGIBLE ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(FIdNotaPeriodoRelacion));

  with TfrmFormularioEmi.Create(self) do
  try
    CargarFormulario(Q.FieldByName('NP_IDTIPOFORMULARIO').AsInteger,
                     Q.FieldByName('NP_ID').AsInteger,
                     Q.FieldByName('NP_PERIODO').AsString, true,
                     Q.FieldByName('NP_IDESTADOFORMULARIO').AsInteger,
                     (Q.FieldByName('NP_ILEGIBLE').AsString = 'S'));
    ShowModal;
  finally
    Q.Free;
    Free;
  end;
end;

procedure TfraFormMonoSol.MostrarBotones(aVer: boolean);
begin
  btnBuscarNotaRelac.Visible := aVer;
  btnBuscarManualNotaRelac.Visible := aVer;
  if not aVer then
  begin
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;

procedure TfraFormMonoSol.btnBuscarNotaRelacClick(
  Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion :=  get_idnotaperiodo165_170sincab(FContrato, FPeriodo);
  if (IdNotaPeriodoRelacion > 0) then
  begin
    lblNotaRelac.Visible := true;
    if lblNotaRelac.Visible then
    begin
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(IdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');
      FIdNotaPeriodoRelacion := IdNotaPeriodoRelacion;
      FTipoRelacion := 'A';
    end;
  end
  else begin
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;

procedure TfraFormMonoSol.btnBuscarManualNotaRelacClick(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_165, TF_170, TF_Pagos, TF_ConstanciaMonotributista], FPeriodo, ESTADO_NOTA_APLICADA, [sin_resumen_ni_ddjj_poster, sin_resumen_existe_ddjj_poste]);
    if (ShowModal = mrOk) and (IdNota > 0) then
    begin
      FIdNotaPeriodoRelacion := get_idnotaperiodo(IdNota, FPeriodo);
      lblNotaRelac.Visible := true;
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(FIdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');
      FTipoRelacion := 'M';
    end;
  finally
    free;
  end;
end;

function TfraFormMonoSol.GetMonotributista: boolean;
begin
  result := cbMonotributista.Checked;
end;

end.
