unit unFraFormNoSuss_NoSussCopia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, StdCtrls, CurrEdit, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision,
  JvExControls, JvComponent, JvLinkLabel, ToolWin, ComCtrls, JvBitmapButton,
  Buttons, General;

type
  TfraFormNoSuss_NoSussCopia = class(TFrame)
    lblEmp: TLabel;
    edEmp: TIntEdit;
    lblMasa: TLabel;
    edMasa: TCurrencyEdit;
    chkEnmienda: TCheckBox;
    lblFechaPres: TLabel;
    edFechaPres: TDateComboBox;
    lblObservacion: TLabel;
    edObservacion: TMemo;
    gbNotaRelacionada: TGroupBox;
    lblNotaRelac: TLabel;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    edSecuencia: TIntEdit;
    lblSecuencia: TLabel;
    procedure btnBuscarNotaRelacClick(Sender: TObject);
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
    procedure edSecuenciaChange(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    FPeriodo: String;
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
    function GetEmpleados: integer;
    function GetEnmienda: boolean;
    function GetFechaPresentacion: TDate;
    function GetMasaSalarial: Currency;
    function GetTexto: String;
  public
    property Empleados: integer read GetEmpleados;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property Enmienda: boolean read GetEnmienda;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Contrato: integer read FContrato write FContrato;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    property Texto: String read GetTexto;
    property Periodo: String  read FPeriodo write FPeriodo;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer; aIdFormulario: integer);
    procedure MostrarBotones(aVer: boolean);
  end;

implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas, DB;

{$R *.dfm}

procedure TfraFormNoSuss_NoSussCopia.ActivarControles(
  aActive: boolean);
begin
  LockControls(self, not aActive);
end;

function TfraFormNoSuss_NoSussCopia.GetEmpleados: integer;
begin
  result := edEmp.Value;
end;

function TfraFormNoSuss_NoSussCopia.GetEnmienda: boolean;
begin
  result := chkEnmienda.Checked;
end;

function TfraFormNoSuss_NoSussCopia.GetFechaPresentacion: TDate;
begin
  result := edFechaPres.Date;
end;

function TfraFormNoSuss_NoSussCopia.GetMasaSalarial: Currency;
begin
  result := edMasa.Value;
end;

procedure TfraFormNoSuss_NoSussCopia.LimpiarControles;
begin
  edEmp.Clear;
  edMasa.Clear;
  chkEnmienda.Checked := false;
  if not FConservarFechaPres then
    edFechaPres.Clear;
  edObservacion.Clear;
end;

procedure TfraFormNoSuss_NoSussCopia.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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
    Fields.Add('NP_TEXTONOTA', Texto);

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
    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    if (aIdFormulario = TF_RPNoSussOriginal) then
      Fields.Add('NP_CODIGORECTIFICATIVA', '00')
    else begin
      if (aIdFormulario = TF_RPNoSussOriginalCopia) then
        Fields.Add('NP_CODIGORECTIFICATIVA', '01');
    end;

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

function TfraFormNoSuss_NoSussCopia.Validar(aIdFormulario: integer): boolean;
begin
  Verificar(edEmp.Value = 0, edEmp, 'Debe ingresar la cantidad de empleados.');
  Verificar(edMasa.Value = 0, edMasa, 'Debe ingresar la Masa Salarial.');
  Verificar(edFechaPres.IsEmpty, edFechaPres, 'Debe ingresar la Fecha de presentación.');
  Verificar(edFechaPres.Date > DBDate, edFechaPres, 'La Fecha de presentación no puede ser futura.');
  Verificar(not edSecuencia.IsEmpty and not lblNotaRelac.Visible, edSecuencia, 'La secuencia no es válida para este formulario.');
  if FIdNotaPeriodoRelacion > 0 then
    Verificar(FContrato <> ValorSqlIntegerEx('SELECT no_contrato ' +
                                             'FROM emi.inp_notacontratoperiodo, emi.ino_nota ' +
                                             'WHERE np_idnota = no_id AND np_id = :ID', [FIdNotaPeriodoRelacion]),
              edSecuencia, 'El detalle posee un contrato distinto al del resumen');

  result := true;
end;

procedure TfraFormNoSuss_NoSussCopia.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_ENMIENDA, NP_FECHAPRESENTACION, NP_TEXTONOTA, ' +
                ' NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edEmp.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
    edMasa.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
    chkEnmienda.Checked := Q.FieldbyName('NP_ENMIENDA').AsString = 'S';
    edFechaPres.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    edObservacion.Text := Q.FieldbyName('NP_TEXTONOTA').AsString;
    FIdNotaPeriodoRelacion := Q.FieldbyName('NOTAPERIODORELACIONADA').AsInteger;
    FTipoRelacion := Q.FieldbyName('NP_TIPORELACION').AsString;
    lblNotaRelac.Visible := (FIdNotaPeriodoRelacion > 0);
    if lblNotaRelac.Visible then
    begin
      MostrarBotones(true);
      lblNotaRelac.Caption := Q.FieldbyName('NOTA').AsString;
      edSecuencia.Value :=  StrToInt64(copy(Q.FieldbyName('NOTA').AsString, pos(' ', Q.FieldbyName('NOTA').AsString) + 1, (pos(' -', Q.FieldbyName('NOTA').AsString) - 2) - pos(' ', Q.FieldbyName('NOTA').AsString) + 1));
      //LockControl(edEmp, true);
      //LockControl(edMasa, true);
    end;
  finally
    Q.free;
  end;
end;

procedure TfraFormNoSuss_NoSussCopia.SimularEstado(aContrato,
  aIdNotaPeriodo: integer; aIdFormulario: integer);
begin
  try
    do_aplicarcaso9(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

function TfraFormNoSuss_NoSussCopia.GetTexto: String;
begin
  result := edObservacion.Text;
end;

procedure TfraFormNoSuss_NoSussCopia.btnBuscarNotaRelacClick(
  Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion :=  get_idnotaperiododetallerns(edSecuencia.Value);
  if (IdNotaPeriodoRelacion > 0) then
  begin
    lblNotaRelac.Visible := true;
    if lblNotaRelac.Visible then
    begin
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(IdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');
      FIdNotaPeriodoRelacion := IdNotaPeriodoRelacion;
      //FTipoRelacion := 'A';
      FTipoRelacion := 'M';
      LockControl(edEmp, true);
      LockControl(edMasa, true);
      //edFechaPres.Date := DBDate;
      with GetQueryEx(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, NP_PERIODO, NP_FECHAPRESENTACION, NO_FECHARECEPCIONART ' +
                      ' FROM EMI.INO_NOTA, EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_ID = :id AND NO_ID = NP_IDNOTA ', [IdNotaPeriodoRelacion]) do
      try
        edEmp.Value := FieldByName('NP_TOTALEMPLEADOS').AsInteger;
        edMasa.Value := FieldByName('NP_TOTALMASASALARIAL').AsCurrency;
        edFechaPres.Date := FieldByName('NO_FECHARECEPCIONART').AsDateTime;
        chkEnmienda.Checked := false;
        TfrmFormularioEmi(self.Parent.Parent.Parent.Parent).fraNominas.ppPeriodoDesde.Periodo.Valor := FieldByName('NP_PERIODO').AsString;
        TfrmFormularioEmi(self.Parent.Parent.Parent.Parent).fraNominas.ppPeriodoHasta.Periodo.Valor := FieldByName('NP_PERIODO').AsString;
      finally
        free;
      end;
    end;
  end
  else begin
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
    LockControl(edEmp, false);
    LockControl(edMasa, false);
  end;
end;

procedure TfraFormNoSuss_NoSussCopia.lblNotaRelacClick(Sender: TObject);
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

procedure TfraFormNoSuss_NoSussCopia.btnBuscarManualNotaRelacClick(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_FormWebDetalleRNS],
                FPeriodo, ESTADO_NOTA_APLICADA,
                [obs_esperando_rns]);


    if (ShowModal = mrOk) and (IdNota > 0) then
    begin
      FIdNotaPeriodoRelacion := get_idnotaperiodo(IdNota, FPeriodo);
      lblNotaRelac.Visible := true;
      lblNotaRelac.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(FIdNotaPeriodoRelacion)
                                                                                + ' ) FROM DUAL ');
      FTipoRelacion := 'M';
      LockControl(edEmp, true);
      LockControl(edMasa, true);
      edFechaPres.Date := DBDate;

      with GetQueryEx(' SELECT NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL ' +
                      ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_ID = :id ', [FIdNotaPeriodoRelacion]) do
      try
        edEmp.Value := FieldByName('NP_TOTALEMPLEADOS').AsInteger;
        edMasa.Value := FieldByName('NP_TOTALMASASALARIAL').AsCurrency;
      finally
        free;
      end;
    end;
  finally
    free;
  end;
end;

procedure TfraFormNoSuss_NoSussCopia.MostrarBotones(aVer: boolean);
begin
//  btnBuscarNotaRelac.Visible := aVer;
//  btnBuscarManualNotaRelac.Visible := aVer;
  btnBuscarNotaRelac.Visible := false;
  btnBuscarManualNotaRelac.Visible := false;
  if not aVer then
  begin
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;


procedure TfraFormNoSuss_NoSussCopia.edSecuenciaChange(Sender: TObject);
begin
  if not edSecuencia.IsEmpty then
  begin
    btnBuscarNotaRelacClick(Sender);
    ActivarControles(false);
    LockControl(edSecuencia, false);
    LockControl(edObservacion, false);
  end
  else begin
    ActivarControles(true);
    lblNotaRelac.Visible := false;
    FIdNotaPeriodoRelacion := -1;
    FTipoRelacion := '';
  end;
end;

end.
