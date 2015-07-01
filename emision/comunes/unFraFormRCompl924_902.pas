unit unFraFormRCompl924_902;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ToolWin, PatternEdit, IntEdit, StdCtrls, Mask,
  ToolEdit, CurrEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql,
  unSesion, Periodos, AnsiSql, SDEngine, unConstEmision, Buttons, unFuncionesEmision, General;

type
  TfraFormRCompl924_902 = class(TFrame)
    lblMasaSalarial: TLabel;
    edMasaSalarial: TCurrencyEdit;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    lblNotaRelac: TLabel;
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarNotaRelacClick(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
  private
    FContrato: integer;
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
    FPeriodo: String;
    function GetMasaSalarial: Currency;
  public
    property Periodo: String  read FPeriodo write FPeriodo;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property Contrato: integer read FContrato write FContrato;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
      aPeriodo: string; aIlegible: boolean; aMixto: String = 'N');
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure MostrarBotones(aVer: boolean);
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
  end;

implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

{ TfraFormRCompl924_902 }

procedure TfraFormRCompl924_902.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  btnBuscarNotaRelac.Enabled := aActive;
  btnBuscarManualNotaRelac.Enabled := aActive;
end;

procedure TfraFormRCompl924_902.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_TOTALMASASALARIAL, ' +
                ' NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
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

function TfraFormRCompl924_902.GetMasaSalarial: Currency;
begin
  result := edMasaSalarial.Value;
end;

procedure TfraFormRCompl924_902.GuardarBorrador(aIdFormulario,
  aIdNota: integer; var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
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

    Fields.AddExtended('NP_TOTALMASASALARIAL', MasaSalarial);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);
    Fields.Add('NP_ILEGIBLE', aIlegible);

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

procedure TfraFormRCompl924_902.LimpiarControles;
begin
  edMasaSalarial.Clear;
  lblNotaRelac.Visible := false;
end;

procedure TfraFormRCompl924_902.MostrarBotones(aVer: boolean);
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

function TfraFormRCompl924_902.Validar(aIdFormulario: integer): boolean;
begin
//  Verificar(edMasaSalarial.Value = 0, edMasaSalarial, 'Debe ingresar la Masa Salarial.');
  result := true;
end;

procedure TfraFormRCompl924_902.lblNotaRelacClick(Sender: TObject);
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

procedure TfraFormRCompl924_902.btnBuscarNotaRelacClick(Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion := get_idnotaperiodo924_902sinres(FContrato, FPeriodo);
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

procedure TfraFormRCompl924_902.btnBuscarManualNotaRelacClick(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_924, TF_902], FPeriodo, ESTADO_NOTA_APLICADA, [sin_resumen_comp_ni_ddjj_post, sin_resumen_existe_ddjj_poste]);
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

procedure TfraFormRCompl924_902.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso11(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

end.
