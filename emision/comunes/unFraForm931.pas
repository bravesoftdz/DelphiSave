unit unFraForm931;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, DateComboBox, StdCtrls, CurrEdit, Mask, PatternEdit,
  IntEdit, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql, unSesion,
  Periodos, AnsiSql, SDEngine, unConstEmision, unFuncionesEmision, Strfuncs, General,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, Buttons;

type
  TfraForm931 = class(TFrame)
    lblCodigoRectificativa: TLabel;
    edCodigoRectificativa: TPatternEdit;
    lblNumeroVerificador_1: TLabel;
    lblEmpleados: TLabel;
    edEmpleados: TIntEdit;
    lblMasaSalarial: TLabel;
    edMasaSalarial: TCurrencyEdit;
    chkSinEmpleados: TCheckBox;
    chkConTicket: TCheckBox;
    gbTicket: TGroupBox;
    lblNumeroVerificador_2: TLabel;
    lblFechaPresentacion: TLabel;
    edtFechaPresentacion: TDateComboBox;
    edNumeroVerificador_2: TPatternEdit;
    edNumeroVerificador_1: TPatternEdit;
    chkErrorV8: TCheckBox;
    fraTipoNomina: TfraCodigoDescripcionExt;
    Label1: TLabel;
    lblNotaRelac: TLabel;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    procedure chkConTicketClick(Sender: TObject);
    procedure edNumeroVerificadorExit(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarNotaRelacClick(Sender: TObject);
  private
    FContrato: integer;
    FConservarFechaPres: boolean;
    FPeriodo: String;
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
//    FSql: TDBSql;
    function GetRectificativa: String;
    function GetNumeroVerificador1: string;
    function GetEmpleados: integer;
    function GetMasaSalarial: Currency;
    function GetSinEmpleados: boolean;
    function GetConTicket: boolean;
    function GetNumeroVerificador2: string;
    function GetFechaPresentacion: TDate;
    function GetErrorV28: boolean;
    function GetTipoNomina: integer;
  public
    property Periodo: String  read FPeriodo write FPeriodo;
    property Rectificativa: string read GetRectificativa;
    property NumeroVerificador1: string read GetNumeroVerificador1;
    property Empleados: integer read GetEmpleados;
    property MasaSalarial: Currency	read GetMasaSalarial;
    property SinEmpleados: boolean read GetSinEmpleados;
    property ConTicket: boolean read GetConTicket;
    property NumeroVerificador2: string read GetNumeroVerificador2;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Contrato: integer read FContrato write FContrato;
    property ErrorV28: boolean read GetErrorV28;
    property TipoNomina: integer read GetTipoNomina; 
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure ActivarTicket(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
      aPeriodo: string; aIlegible: boolean; aMixto: String = 'N'; aIdNotaPeriodoRelacion: integer = -1; aTipoRelacion: string = '');
    function IsEmpty: boolean;
    procedure SimularEstado(aContrato, aIdNotaPeriodo: integer);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure Init;
    procedure MostrarBotones(aVer: boolean);
  end;

implementation

uses DateUtils, DB, unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

procedure TfraForm931.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  ActivarTicket(aActive);
  btnBuscarNotaRelac.Enabled := aActive;
  btnBuscarManualNotaRelac.Enabled := aActive;
  lblNotaRelac.Enabled := true;
end;

procedure TfraForm931.LimpiarControles;
begin
  edCodigoRectificativa.Clear;
  edNumeroVerificador_1.Clear;
  edEmpleados.Clear;
  edMasaSalarial.Clear;
  chkSinEmpleados.Checked := false;
  chkConTicket.Checked := false;
  chkErrorV8.Checked := false;
  fraTipoNomina.Value := 4;
  lblNotaRelac.Visible := false;
end;

procedure TfraForm931.chkConTicketClick(Sender: TObject);
begin
  ActivarTicket(chkConTicket.Enabled);
end;

procedure TfraForm931.ActivarTicket(aActive: boolean);
begin
  if aActive and not chkConTicket.Checked then
  begin
    edNumeroVerificador_2.Clear;
    if not FConservarFechaPres then
      edtFechaPresentacion.Clear;
  end;
  lblNotaRelac.Visible := not chkConTicket.Checked;
  btnBuscarNotaRelac.Visible := not chkConTicket.Checked;
  btnBuscarManualNotaRelac.Visible := not chkConTicket.Checked;
  LockControls(gbTicket, not aActive or not chkConTicket.Checked);
end;


function TfraForm931.Validar(aIdFormulario: integer): boolean;
begin
  Verificar((edCodigoRectificativa.Text = ''), edCodigoRectificativa, 'Debe ingresar el Código de Rectificativa.');
  Verificar((edNumeroVerificador_1.EditText = '000000') or (edNumeroVerificador_1.EditText = ''), edNumeroVerificador_1, 'Debe ingresar el Número Verificador.');
  Verificar(not fraTipoNomina.IsSelected, fraTipoNomina.cmbDescripcion, 'Debe ingresar el Tipo de Nómina.');
//  Verificar(chkSinEmpleados.Checked and (edEmpleados.Value <> 0), edEmpleados, 'La cantidad de empleados debe ser cero.');
//  Verificar(chkSinEmpleados.Checked and (edMasaSalarial.Value <> 0), edMasaSalarial, 'La masa salarial debe ser cero.');
//  Verificar(not chkSinEmpleados.Checked and (edEmpleados.Value = 0), edEmpleados, 'Debe ingresar la cantidad de empleados.');
//  Verificar(not chkSinEmpleados.Checked and (edMasaSalarial.Value = 0), edMasaSalarial, 'Debe ingresar la masa salarial.');
  Verificar(chkConTicket.Checked and ((edNumeroVerificador_2.EditText = '000000') or (edNumeroVerificador_2.EditText = '')), edNumeroVerificador_2, 'Debe ingresar el Número Verificador del ticket.');
  Verificar(chkConTicket.Checked and (edtFechaPresentacion.IsEmpty), edtFechaPresentacion, 'Debe ingresar la Fecha de presentación.');
  Verificar(chkConTicket.Checked and (edtFechaPresentacion.Date > DBDate), edtFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
//  Verificar(chkConTicket.Checked and (edNumeroVerificador_1.EditText <> edNumeroVerificador_2.EditText), edNumeroVerificador_2, 'Los Números Verificadores deben ser iguales.');
  result := true;
end;

function TfraForm931.GetRectificativa: string;
begin
  result := lpad(edCodigoRectificativa.Text, '0', 2);
end;

function TfraForm931.GetNumeroVerificador1: string;
begin
  result := edNumeroVerificador_1.EditText;
end;

function TfraForm931.GetEmpleados: integer;
begin
  result := edEmpleados.Value;
end;

function TfraForm931.GetMasaSalarial: Currency;
begin
  result := edMasaSalarial.Value;
end;

function TfraForm931.GetSinEmpleados: boolean;
begin
  result := chkSinEmpleados.Checked;
end;

function TfraForm931.GetConTicket: boolean;
begin
  result := chkConTicket.Checked;
end;

function TfraForm931.GetNumeroVerificador2: string;
begin
  result := edNumeroVerificador_2.EditText;
end;

function TfraForm931.GetFechaPresentacion: TDate;
begin
  result := edtFechaPresentacion.Date;
end;

procedure TfraForm931.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
  aPeriodo: string; aIlegible: boolean; aMixto: String; aIdNotaPeriodoRelacion: integer; aTipoRelacion: string);
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
    Fields.Add('NP_TOTALEMPLEADOS', Empleados);
    Fields.AddExtended('NP_TOTALMASASALARIAL', MasaSalarial);
    Fields.Add('NP_ILEGIBLE', aIlegible);
    Fields.Add('NP_ERRORV28', chkErrorV8.Checked);
    Fields.Add('NP_IDTIPONOMINA', fraTipoNomina.Value);

    if (NumeroVerificador1 <> '000000') then
      Fields.Add('NP_NUMEROVERIFICADOR', NumeroVerificador1)
    else
      Fields.Add('NP_NUMEROVERIFICADOR',  exNull);

    Fields.Add('NP_SINEMPLEADOS', SinEmpleados);
    Fields.Add('NP_CONTICKET', ConTicket);

    if (NumeroVerificador2 <> '000000') then
      Fields.Add('NP_NUMEROVERIFICADOR_2', NumeroVerificador2, true)
    else
      Fields.Add('NP_NUMEROVERIFICADOR_2',  exNull);

    if (FechaPresentacion > 0) and ConTicket then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

    if (aIdNotaPeriodoRelacion > 0) then
    begin
      Fields.Add('NP_TIPORELACION', aTipoRelacion);
      Fields.Add('NP_IDNOTAPERIODORELACIONADA', aIdNotaPeriodoRelacion);
    end
    else begin
      //Si no tiene una nota relacionada intento asociarle una
      if not (FIdNotaPeriodoRelacion > 0) and not chkConTicket.Checked then
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
    end;

    EjecutarSqlST(Sql);
  finally
    free;
  end;

end;

function TfraForm931.IsEmpty: boolean;
begin
  result := (edCodigoRectificativa.Text = '')
            and ((edNumeroVerificador_1.EditText = '000000') or (edNumeroVerificador_1.EditText = ''))
            and edEmpleados.IsEmpty
            and not chkSinEmpleados.Checked
            and not chkConTicket.Checked
            and not chkErrorV8.Checked;
end;

procedure TfraForm931.CargarFormulario(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_CODIGORECTIFICATIVA, NP_TOTALEMPLEADOS, NP_TOTALMASASALARIAL, ' +
                ' NP_NUMEROVERIFICADOR, NP_SINEMPLEADOS, NP_CONTICKET, NP_NUMEROVERIFICADOR_2, ' +
                ' NP_FECHAPRESENTACION, NP_ERRORV28, NP_IDTIPONOMINA, ' +
                ' NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edCodigoRectificativa.Text := Q.FieldbyName('NP_CODIGORECTIFICATIVA').AsString;
    edEmpleados.Value := Q.FieldbyName('NP_TOTALEMPLEADOS').AsInteger;
    edMasaSalarial.Value := Q.FieldbyName('NP_TOTALMASASALARIAL').AsFloat;
    edNumeroVerificador_1.EditText := Q.FieldbyName('NP_NUMEROVERIFICADOR').AsString;
    chkSinEmpleados.Checked := Q.FieldbyName('NP_SINEMPLEADOS').AsString = 'S';
    chkConTicket.Checked := Q.FieldbyName('NP_CONTICKET').AsString = 'S';
    if not Q.FieldbyName('NP_NUMEROVERIFICADOR_2').IsNull then
      edNumeroVerificador_2.EditText := Q.FieldbyName('NP_NUMEROVERIFICADOR_2').AsString;
    if not Q.FieldbyName('NP_FECHAPRESENTACION').IsNull then
      edtFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
    chkErrorV8.Checked := Q.FieldbyName('NP_ERRORV28').AsString = 'S';
    fraTipoNomina.Value := Q.FieldbyName('NP_IDTIPONOMINA').AsInteger;
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

procedure TfraForm931.SimularEstado(aContrato, aIdNotaPeriodo: integer);
begin
  try
    do_aplicarcaso1(aContrato, aIdNotaPeriodo, true);
  except
    on E: Exception do
    begin
       ErrorMsg(E, 'Error al previsualizar el estado.');
    end;
  end;
end;

procedure TfraForm931.edNumeroVerificadorExit(Sender: TObject);
begin
  TPatternEdit(Sender).Text := LPad(TPatternEdit(Sender).Text, '0', 6);
end;

function TfraForm931.GetErrorV28: boolean;
begin
  result := chkErrorV8.Checked;
end;

procedure TfraForm931.Init;
begin
  with fraTipoNomina  do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
    ShowBajas   := False;
  end;
end;

function TfraForm931.GetTipoNomina: integer;
begin
  Result := fraTipoNomina.Value;
end;

procedure TfraForm931.btnBuscarManualNotaRelacClick(Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_TicketPresentacion],
                FPeriodo, ESTADO_NOTA_APLICADA,
                [sin_formulario_solicitado_c14, sin_solicitud_anterior, dif_nros_verif_ni_ddjj_poster, dif_nros_verif_exist_ddjj_post]);


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

procedure TfraForm931.lblNotaRelacClick(Sender: TObject);
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

procedure TfraForm931.btnBuscarNotaRelacClick(Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion :=  get_idnotaperiodoticket(FContrato, FPeriodo, TF_931, edNumeroVerificador_1.Text);
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

procedure TfraForm931.MostrarBotones(aVer: boolean);
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

end.
