unit unFraFormTicketPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, IntEdit,
  ComCtrls, ToolWin, VCLExtra, CustomDlgs, Cuit, unDmPrincipal, SqlFuncs, DBSql,
  unSesion, Periodos, AnsiSql, SDEngine, unConstEmision, Buttons, unFuncionesEmision,
  StrFuncs, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, General;

type
  TFraFormTicketPresentacion = class(TFrame)
    lblFechaPresentacion: TLabel;
    edtFechaPresentacion: TDateComboBox;
    gbNotaRelacionada: TGroupBox;
    lblNotaRelac: TLabel;
    btnBuscarNotaRelac: TSpeedButton;
    btnBuscarManualNotaRelac: TSpeedButton;
    lblNumeroVerificador: TLabel;
    edNumeroVerificador: TPatternEdit;
    lblTipoFormularioMultiperiodo: TLabel;
    fraTipoFormulario: TfraCodigoDescripcionExt;
    procedure lblNotaRelacClick(Sender: TObject);
    procedure btnBuscarManualNotaRelacClick(Sender: TObject);
    procedure btnBuscarNotaRelacClick(Sender: TObject);
    procedure edNumeroVerificadorExit(Sender: TObject);
  private
    FIdNotaPeriodoRelacion : integer;
    FTipoRelacion: string; //'A' Automatica 'M' Manual
    FPeriodo: String;
    FContrato: integer;
    FConservarFechaPres: boolean;
    function GetFechaPresentacion: TDate;
    function GetNumeroVerificador: string;
    function GetIdFormularioRelacionado: integer;
    { Private declarations }
  public
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property NumeroVerificador: string read GetNumeroVerificador;
    property IdFormularioRelacionado: integer read GetIdFormularioRelacionado;
    property Contrato: integer read FContrato write FContrato;
    property Periodo: String  read FPeriodo write FPeriodo;
    property ConservarFechaPres: boolean read FConservarFechaPres write FConservarFechaPres;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    procedure MostrarBotones(aVer: boolean);
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
      aPeriodo: string; aIlegible: boolean; aMixto: String = 'N');
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure Init;
  end;

implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

{ TFraFormTicketPresentacion }

procedure TFraFormTicketPresentacion.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  btnBuscarNotaRelac.Enabled := aActive;
  btnBuscarManualNotaRelac.Enabled := aActive;
  lblNotaRelac.Enabled := true;
end;

procedure TFraFormTicketPresentacion.CargarFormulario(
  aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_NUMEROVERIFICADOR, ' +
                ' NP_FECHAPRESENTACION, NP_TIPOFORMULARIOPRESENTADO, ' +
                ' NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
  try
    edNumeroVerificador.EditText := Q.FieldbyName('NP_NUMEROVERIFICADOR').AsString;
    fraTipoFormulario.Value := Q.FieldbyName('NP_TIPOFORMULARIOPRESENTADO').AsInteger;
    if not Q.FieldbyName('NP_FECHAPRESENTACION').IsNull then
      edtFechaPresentacion.Date := Q.FieldbyName('NP_FECHAPRESENTACION').AsDateTime;
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

function TFraFormTicketPresentacion.GetFechaPresentacion: TDate;
begin
  result := edtFechaPresentacion.Date; 
end;

function TFraFormTicketPresentacion.GetNumeroVerificador: string;
begin
  result := edNumeroVerificador.EditText;
end;

procedure TFraFormTicketPresentacion.GuardarBorrador(aIdFormulario,
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

    Fields.Add('NP_NUMEROVERIFICADOR', NumeroVerificador);
    if fraTipoFormulario.IsSelected then
      Fields.Add('NP_TIPOFORMULARIOPRESENTADO', fraTipoFormulario.Value)
    else
      Fields.Add('NP_TIPOFORMULARIOPRESENTADO', exNull);

    if FechaPresentacion > 0 then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);
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

procedure TFraFormTicketPresentacion.LimpiarControles;
begin
  edNumeroVerificador.Clear;
  if not FConservarFechaPres then
    edtFechaPresentacion.Clear;
  lblNotaRelac.Visible := false;
end;

function TFraFormTicketPresentacion.Validar(aIdFormulario: integer): boolean;
begin
//  Verificar(edNumeroVerificador.EditText = '000000', edNumeroVerificador, 'Debe ingresar el Número Verificador.');
  Verificar(edtFechaPresentacion.IsEmpty, edtFechaPresentacion, 'Debe ingresar la Fecha de presentación.');
  Verificar((not edtFechaPresentacion.IsEmpty) and (edtFechaPresentacion.Date > DBDate), edtFechaPresentacion, 'La Fecha de presentación no puede ser futura.');
  Verificar((not lblNotaRelac.Visible) and (not fraTipoFormulario.IsSelected), fraTipoFormulario, 'Debe ingresar el tipo de formulario presentado.');
  Verificar(((fraTipoFormulario.Value = 1) or (fraTipoFormulario.Value = 52)) and
           ((edNumeroVerificador.Text = '') or (edNumeroVerificador.Text = '000000')), edNumeroVerificador, 'Debe ingresar el Número Verificador.');
  result := true;
end;

procedure TFraFormTicketPresentacion.lblNotaRelacClick(Sender: TObject);
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

procedure TFraFormTicketPresentacion.btnBuscarNotaRelacClick(
  Sender: TObject);
var
  IdNotaPeriodoRelacion: integer;
begin
  IdNotaPeriodoRelacion :=  get_idnotaperiodosinticket(FContrato, FPeriodo);
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

procedure TFraFormTicketPresentacion.btnBuscarManualNotaRelacClick(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_931, TF_900, TF_905, TF_926, TF_924, TF_902, TF_ResumComplement924_902, TF_921],
                FPeriodo, ESTADO_NOTA_APLICADA,
                [sin_ticket_ni_ddjj_poster, sin_ticket_existe_ddjj_poster, dif_nros_verif_ni_ddjj_poster, dif_nros_verif_exist_ddjj_post]);


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

procedure TFraFormTicketPresentacion.MostrarBotones(aVer: boolean);
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

procedure TFraFormTicketPresentacion.edNumeroVerificadorExit(
  Sender: TObject);
begin
  TPatternEdit(Sender).Text := LPad(TPatternEdit(Sender).Text, '0', 6);
end;

procedure TFraFormTicketPresentacion.Init;
begin
  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
//    DynamicCols := true;
    ShowBajas   := False;
    ExtraCondition := ' AND TF_ID IN (1, 5, 28, 6, 20, 18, 52) ';
//    OnChange := OnChangeTipoFormulario;
  end;
end;

function TFraFormTicketPresentacion.GetIdFormularioRelacionado: integer;
begin
  Result := fraTipoFormulario.Value;  
end;

end.
