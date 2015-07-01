unit unFraFormMixta931_170;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraForm931, StdCtrls, unFraForm165_170, Mask, ToolEdit,
  CurrEdit, ComCtrls, ToolWin, PatternEdit, IntEdit, DBClient,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, unConstEmision,
  SDEngine, AnsiSql, Buttons, ExtCtrls, unFuncionesEmision, General;

type
  TfraFormMixta931_170 = class(TFrame)
    gbfrm931: TGroupBox;
    fraForm931: TfraForm931;
    gbfrm170: TGroupBox;
    gbTotalMixta: TGroupBox;
    lblSumTotalEmpleados: TLabel;
    edSumlMasaSalarial: TLabel;
    edSumMasaSalarial: TCurrencyEdit;
    edSumTotalEmpleados: TIntEdit;
    fraForm170: TfraForm165_170;
    pnl931: TPanel;
    tbComandosNota931: TToolBar;
    btnLimpiarNota931: TToolButton;
    lblNotaRelac931: TLabel;
    btnBuscarNotaRelac931: TSpeedButton;
    btnBuscarManualNotaRelac931: TSpeedButton;
    pnl170: TPanel;
    lblNotaRelac170: TLabel;
    btnBuscarNotaRelac170: TSpeedButton;
    btnBuscarManualNotaRelac170: TSpeedButton;
    tbComandosNota170: TToolBar;
    btnLimpiarNota170: TToolButton;
    procedure fraForm931edEmpleadosChange(Sender: TObject);
    procedure fraForm931edMasaSalarialChange(Sender: TObject);
    procedure fraForm170edSumTotalEmpleadosChange(Sender: TObject);
    procedure fraForm170edSumMasaSalarialChange(Sender: TObject);
    procedure btnBuscarManualNotaRelac931Click(Sender: TObject);
    procedure btnBuscarManualNotaRelac170Click(Sender: TObject);
    procedure lblNotaRelac931Click(Sender: TObject);
    procedure lblNotaRelac170Click(Sender: TObject);
    procedure btnBuscarNotaRelac931Click(Sender: TObject);
    procedure btnBuscarNotaRelac170Click(Sender: TObject);
    procedure btnLimpiarNota931Click(Sender: TObject);
    procedure btnLimpiarNota170Click(Sender: TObject);
  private
    FIdNotaPeriodoRelacion931 : integer;
    FTipoRelacion931: string; //'A' Automatica 'M' Manual
    FIdNotaPeriodoRelacion170 : integer;
    FTipoRelacion170: string; //'A' Automatica 'M' Manual
    FContrato: integer;
    FPeriodo: String;
    FConservarFechaPres: boolean;
    procedure SumarTotalesMixta;
    function GetTotalEmpleados: integer;
    function GetTotalMasaSalarial: Currency;
    function GetConTicket931: boolean;
    function GetDetalleTrabajadores170: TClientDataSet;
    function GetEmpleados931: integer;
    function GetFechaPresentacion170: TDate;
    function GetFechaPresentacion931: TDate;
    function GetInscripcion170: integer;
    function GetMasaSalarial931: Currency;
    function GetNumeroVerificador931_1: string;
    function GetNumeroVerificador931_2: string;
    function GetRectificativa931: String;
    function GetSinEmpleados931: boolean;
    function GetTotalEmpleados170: integer;
    function GetTotalMasaSalarial170: Extended;
    procedure Guardar931Mixto(aIdNota, aIdNotaPeriodo: integer; aPeriodo: string; aIlegible: boolean);
    procedure Guardar170Mixto(aIdNota, aIdNotaPeriodo: integer; aPeriodo: string; aIlegible: boolean);
    procedure MostrarBotones931(aVer: boolean);
    procedure MostrarBotones170(aVer: boolean);
    procedure Cargar170Mixto(aIdNotaPeriodo: integer);
    procedure Cargar931Mixto(aIdNotaPeriodo: integer);
    function GetFechaPresentacion: TDate;
    function GetRectificativa: string;
    procedure SetConservarFechaPres(const Value: boolean);
  public
    property TotalEmpleados: integer read GetTotalEmpleados;
    property TotalMasaSalarial: Currency read GetTotalMasaSalarial;
    property Contrato: integer read FContrato write FContrato;
    property Periodo: String  read FPeriodo write FPeriodo;
    property FechaPresentacion: TDate read GetFechaPresentacion;
    property Rectificativa: string read GetRectificativa;
    property ConservarFechaPres: boolean read FConservarFechaPres write SetConservarFechaPres;

//931
    property Rectificativa931: String read GetRectificativa931;
    property NumeroVerificador931_1: string read GetNumeroVerificador931_1;
    property Empleados931: integer read GetEmpleados931;
    property MasaSalarial931: Currency	read GetMasaSalarial931;
    property SinEmpleados931: boolean read GetSinEmpleados931;
    property ConTicket931: boolean read GetConTicket931;
    property NumeroVerificador931_2: string read GetNumeroVerificador931_2;
    property FechaPresentacion931: TDate read GetFechaPresentacion931;

//170
    property TotalEmpleados170: integer read GetTotalEmpleados170;
    property TotalMasaSalarial170: Extended read GetTotalMasaSalarial170;
    property FechaPresentacion170: TDate read GetFechaPresentacion170;
    property Inscripcion170: integer read GetInscripcion170;
    property DetalleTrabajadores170: TClientDataSet read GetDetalleTrabajadores170;

    procedure Init;
    procedure ActivarControles(aActive: boolean);
    procedure LimpiarControles;
    function Validar(aIdFormulario: integer): boolean;
    procedure GuardarBorrador(aIdFormulario, aIdNota: integer;
      var aIdNotaPeriodo: integer; aPeriodo: String; aIlegible: boolean; aMixto: String);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
    procedure MostrarBotones(aVer: boolean);
  end;

implementation

uses
  unfrmFormularioEmi, unFrmConsultaNotas;

{$R *.dfm}

{ TfraFormMixta931_170 }

procedure TfraFormMixta931_170.ActivarControles(aActive: boolean);
begin
  fraForm931.ActivarControles(aActive);
  fraForm170.ActivarControles(aActive);
  tbComandosNota931.Enabled := aActive;
  tbComandosNota170.Enabled := aActive;

  btnBuscarNotaRelac931.Enabled := aActive;
  btnBuscarManualNotaRelac931.Enabled := aActive;
  lblNotaRelac931.Enabled := true;
  tbComandosNota931.Enabled := aActive;

  btnBuscarNotaRelac170.Enabled := aActive;
  btnBuscarManualNotaRelac170.Enabled := aActive;
  lblNotaRelac170.Enabled := true;
  tbComandosNota170.Enabled := aActive;
end;

procedure TfraFormMixta931_170.Init;
begin
  fraForm170.Init;
  fraForm931.Init;
end;

procedure TfraFormMixta931_170.LimpiarControles;
begin
  fraForm931.LimpiarControles;
  fraForm170.LimpiarControles;
end;

procedure TfraFormMixta931_170.SumarTotalesMixta;
begin
  edSumTotalEmpleados.Value := fraForm931.edEmpleados.Value + fraForm170.edSumTotalEmpleados.Value;
  edSumMasaSalarial.Value := fraForm931.edMasaSalarial.Value + fraForm170.edSumMasaSalarial.Value;
end;

function TfraFormMixta931_170.Validar(aIdFormulario: integer): boolean;
begin
  result := ((fraForm931.IsEmpty and not fraForm170.IsEmpty) or fraForm931.Validar(TF_931))
              and ((not fraForm931.IsEmpty and fraForm170.IsEmpty) or fraForm170.Validar(TF_170));
end;

procedure TfraFormMixta931_170.fraForm931edEmpleadosChange(
  Sender: TObject);
begin
  SumarTotalesMixta;
end;

procedure TfraFormMixta931_170.fraForm931edMasaSalarialChange(
  Sender: TObject);
begin
  SumarTotalesMixta;
end;

procedure TfraFormMixta931_170.fraForm170edSumTotalEmpleadosChange(
  Sender: TObject);
begin
  SumarTotalesMixta;
end;

procedure TfraFormMixta931_170.fraForm170edSumMasaSalarialChange(
  Sender: TObject);
begin
  SumarTotalesMixta;
end;

function TfraFormMixta931_170.GetTotalEmpleados: integer;
begin
  result := edSumTotalEmpleados.Value;
end;

function TfraFormMixta931_170.GetTotalMasaSalarial: Currency;
begin
  result := edSumMasaSalarial.Value;
end;

function TfraFormMixta931_170.GetConTicket931: boolean;
begin
  result := fraForm931.ConTicket;
end;

function TfraFormMixta931_170.GetDetalleTrabajadores170: TClientDataSet;
begin
  result := fraForm170.DetalleTrabajadores;
end;

function TfraFormMixta931_170.GetEmpleados931: integer;
begin
  result := fraForm931.Empleados;
end;

function TfraFormMixta931_170.GetFechaPresentacion170: TDate;
begin
  result := fraForm170.FechaPresentacion;
end;

function TfraFormMixta931_170.GetFechaPresentacion931: TDate;
begin
  result := fraForm931.FechaPresentacion;
end;

function TfraFormMixta931_170.GetInscripcion170: integer;
begin
  result := fraForm170.Inscripcion;
end;

function TfraFormMixta931_170.GetMasaSalarial931: Currency;
begin
  result := fraForm931.MasaSalarial;
end;

function TfraFormMixta931_170.GetNumeroVerificador931_1: string;
begin
  result := fraForm931.NumeroVerificador1;
end;

function TfraFormMixta931_170.GetNumeroVerificador931_2: string;
begin
  result := fraForm931.NumeroVerificador2;
end;

function TfraFormMixta931_170.GetRectificativa931: String;
begin
  result := fraForm931.Rectificativa;
end;

function TfraFormMixta931_170.GetSinEmpleados931: boolean;
begin
  result := fraForm931.SinEmpleados;
end;

function TfraFormMixta931_170.GetTotalEmpleados170: integer;
begin
  result := fraForm170.TotalEmpleados;
end;

function TfraFormMixta931_170.GetTotalMasaSalarial170: Extended;
begin
  result := fraForm170.TotalMasaSalarial;
end;


procedure TfraFormMixta931_170.GuardarBorrador(aIdFormulario: integer; aIdNota: integer; var aIdNotaPeriodo: integer;
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

    Fields.Add('NP_TOTALEMPLEADOS', TotalEmpleados);
    Fields.AddExtended('NP_TOTALMASASALARIAL', TotalMasaSalarial);
    Fields.Add('NP_FORMULARIOMIXTO', aMixto);
    Fields.Add('NP_ILEGIBLE', aIlegible);

    if (FechaPresentacion > 0) then
      Fields.Add('NP_FECHAPRESENTACION', FechaPresentacion)
    else
      Fields.Add('NP_FECHAPRESENTACION', exNull);

    Fields.Add('NP_CODIGORECTIFICATIVA', Rectificativa);
    Fields.Add('NP_IDESTADOFORMULARIO', ESTADO_FORMULARIO_PENDIENTE);

    EjecutarSqlST(Sql);

//    if not fraForm931.IsEmpty then
    Guardar931Mixto(aIdNota, aIdNotaPeriodo, aPeriodo, aIlegible);
//    if not fraForm170.IsEmpty then
    Guardar170Mixto(aIdNota, aIdNotaPeriodo, aPeriodo, aIlegible);

  finally
    free;
  end;

end;

procedure TfraFormMixta931_170.Guardar931Mixto(aIdNota,
  aIdNotaPeriodo: integer; aPeriodo: string; aIlegible: boolean);
var
  Q: TSDQuery;
  newIdNotaPeriodo, delIdNotaPeriodo: integer;
begin
  if fraForm931.IsEmpty then
  begin

    delIdNotaPeriodo := ValorSqlInteger ('SELECT NM_IDNOTACONTRATOPERIODOMIXTO FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                                        ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                                        ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_931) +
                                        ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo), -1);


    if (delIdNotaPeriodo > 0) then
    begin

        EjecutarSqlST(' DELETE FROM EMI.INM_NOTACONTRATOPERIODOMIXTO ' +
                      ' WHERE NM_IDNOTACONTRATOPERIODOMIXTO = ' + SqlValue(delIdNotaPeriodo));

        EjecutarSqlST(' UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                      ' SET NP_FECHABAJA = SYSDATE, ' +
                      ' NP_USUBAJA = ' + SqlValue(Sesion.LoginName) +
                      ' WHERE NP_ID = ' + SqlValue(delIdNotaPeriodo));


(*
        EjecutarSqlST(' DELETE FROM EMI.INM_NOTACONTRATOPERIODOMIXTO ' +
                      ' WHERE NM_IDNOTACONTRATOPERIODOMIXTO = ' + SqlValue(delIdNotaPeriodo));

        EjecutarSqlST(' DELETE FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_ID = ' + SqlValue(delIdNotaPeriodo));
*)
    end;
  end
  else begin
    newIdNotaPeriodo := -1;

    Q := unDmPrincipal.GetQuery(' SELECT * FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                                ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                                ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_931) +
                                ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
    try
      if not Q.IsEmpty then
      begin
        newIdNotaPeriodo := Q.FieldByName('NM_IDNOTACONTRATOPERIODOMIXTO').AsInteger;
        fraForm931.GuardarBorrador(TF_931, aIdNota, newIdNotaPeriodo, aPeriodo, aIlegible, 'S', FIdNotaPeriodoRelacion931, FTipoRelacion931)
      end
      else begin
        fraForm931.GuardarBorrador(TF_931, aIdNota, newIdNotaPeriodo, aPeriodo, aIlegible, 'S', FIdNotaPeriodoRelacion931, FTipoRelacion931);
        EjecutarSqlST(' INSERT INTO EMI.INM_NOTACONTRATOPERIODOMIXTO(NM_ID, NM_IDNOTACONTRATOPERIODO, NM_IDNOTACONTRATOPERIODOMIXTO) ' +
                      ' VALUES(EMI.SEQ_INM_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +  SqlValue(newIdNotaPeriodo) + ')');
      end;
     finally
      Q.Free;
    end;
  end;
end;

procedure TfraFormMixta931_170.Guardar170Mixto(aIdNota,
  aIdNotaPeriodo: integer; aPeriodo: string; aIlegible: boolean);
var
  Q: TSDQuery;
  newIdNotaPeriodo, delIdNotaPeriodo: integer;
begin

  if fraForm170.IsEmpty then
  begin

    delIdNotaPeriodo := ValorSqlInteger ('SELECT NM_IDNOTACONTRATOPERIODOMIXTO FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                                        ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                                        ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_170) +
                                        ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo), -1);


    if (delIdNotaPeriodo > 0) then
    begin

        EjecutarSqlST(' DELETE FROM EMI.INM_NOTACONTRATOPERIODOMIXTO ' +
                      ' WHERE NM_IDNOTACONTRATOPERIODOMIXTO = ' + SqlValue(delIdNotaPeriodo));

        EjecutarSqlST(' UPDATE EMI.INP_NOTACONTRATOPERIODO ' +
                      ' SET NP_FECHABAJA = SYSDATE, ' +
                      ' NP_USUBAJA = ' + SqlValue(Sesion.LoginName) +
                      ' WHERE NP_ID = ' + SqlValue(delIdNotaPeriodo));

(*
        EjecutarSqlST(' DELETE FROM EMI.INM_NOTACONTRATOPERIODOMIXTO ' +
                      ' WHERE NM_IDNOTACONTRATOPERIODOMIXTO = ' + SqlValue(delIdNotaPeriodo));

        EjecutarSqlST(' DELETE FROM EMI.INT_NOTATRABAJADORPERIODO ' +
                      ' WHERE NT_IDNOTACONTRATOPERIODO = ' + SqlValue(delIdNotaPeriodo));

        EjecutarSqlST(' DELETE FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_ID = ' + SqlValue(delIdNotaPeriodo));

*)
    end;
  end
  else begin
    newIdNotaPeriodo := -1;

    Q := unDmPrincipal.GetQuery(' SELECT * FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                                ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                                ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_170) +
                                ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));
    try
      if not Q.IsEmpty then
      begin
        newIdNotaPeriodo := Q.FieldByName('NM_IDNOTACONTRATOPERIODOMIXTO').AsInteger;
        fraForm170.GuardarBorrador(TF_170, aIdNota, newIdNotaPeriodo, aPeriodo, aIlegible, 'S', FIdNotaPeriodoRelacion170, FTipoRelacion170)
      end
      else begin
        fraForm170.GuardarBorrador(TF_170, aIdNota, newIdNotaPeriodo, aPeriodo, aIlegible, 'S', FIdNotaPeriodoRelacion170, FTipoRelacion170);
        EjecutarSqlST(' INSERT INTO EMI.INM_NOTACONTRATOPERIODOMIXTO(NM_ID, NM_IDNOTACONTRATOPERIODO, NM_IDNOTACONTRATOPERIODOMIXTO) ' +
                      ' VALUES(EMI.SEQ_INM_ID.NEXTVAL, ' + SqlValue(aIdNotaPeriodo) + ', ' +  SqlValue(newIdNotaPeriodo) + ')');
      end;
     finally
      Q.Free;
    end;
  end;
end;

procedure TfraFormMixta931_170.CargarFormulario(aIdNotaPeriodo: integer);
begin

  Cargar170Mixto(aIdNotaPeriodo);

  Cargar931Mixto(aIdNotaPeriodo);

end;

procedure TfraFormMixta931_170.Cargar170Mixto(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := unDmPrincipal.GetQuery(' SELECT NM_IDNOTACONTRATOPERIODOMIXTO, NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                              ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                              ' FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                              ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                              ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_170) +
                              ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));

  try
    if not Q.IsEmpty then
    begin
      fraForm170.CargarFormulario(Q.FieldByName('NM_IDNOTACONTRATOPERIODOMIXTO').AsInteger);
      FIdNotaPeriodoRelacion170 := Q.FieldbyName('NOTAPERIODORELACIONADA').AsInteger;
      FTipoRelacion170 := Q.FieldbyName('NP_TIPORELACION').AsString;
      lblNotaRelac170.Visible := (FIdNotaPeriodoRelacion170 > 0);
      if lblNotaRelac170.Visible then
      begin
        MostrarBotones170(true);
        lblNotaRelac170.Caption := Q.FieldbyName('NOTA').AsString;
        fraForm170.ActivarControles(false);
      end;
    end;
   finally
    Q.Free;
  end;
end;

procedure TfraFormMixta931_170.Cargar931Mixto(aIdNotaPeriodo: integer);
var
  Q: TSDQuery;
begin
  Q := unDmPrincipal.GetQuery(' SELECT NM_IDNOTACONTRATOPERIODOMIXTO, NVL(NP_IDNOTAPERIODORELACIONADA, -1) NOTAPERIODORELACIONADA, NP_TIPORELACION, ' +
                              ' EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA ' +
                              ' FROM EMI.INM_NOTACONTRATOPERIODOMIXTO, EMI.INP_NOTACONTRATOPERIODO ' +
                              ' WHERE NP_ID = NM_IDNOTACONTRATOPERIODOMIXTO ' +
                              ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(TF_931) +
                              ' AND NM_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaPeriodo));

  try
    if not Q.IsEmpty then
      fraForm931.CargarFormulario(Q.FieldByName('NM_IDNOTACONTRATOPERIODOMIXTO').AsInteger);
      FIdNotaPeriodoRelacion931 := Q.FieldbyName('NOTAPERIODORELACIONADA').AsInteger;
      FTipoRelacion931 := Q.FieldbyName('NP_TIPORELACION').AsString;
      lblNotaRelac931.Visible := (FIdNotaPeriodoRelacion931 > 0);
      if lblNotaRelac931.Visible then
      begin
        MostrarBotones931(true);
        lblNotaRelac931.Caption := Q.FieldbyName('NOTA').AsString;
        fraForm931.ActivarControles(false);
      end;
   finally
    Q.Free;
  end;
end;

procedure TfraFormMixta931_170.btnBuscarManualNotaRelac931Click(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_931], FPeriodo, ESTADO_NOTA_APLICADA, []);
    if (ShowModal = mrOk) and (IdNota > 0) then
    begin
      fraForm931.LimpiarControles;
      FIdNotaPeriodoRelacion931 := get_idnotaperiodo(IdNota, FPeriodo);
      fraForm931.CargarFormulario(FIdNotaPeriodoRelacion931);
      fraForm931.ActivarControles(false);
      lblNotaRelac931.Visible := true;
      lblNotaRelac931.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(FIdNotaPeriodoRelacion931)
                                                                                + ' ) FROM DUAL ');
      FTipoRelacion931 := 'M';
    end;
  finally
    free;
  end;
end;

procedure TfraFormMixta931_170.btnBuscarManualNotaRelac170Click(
  Sender: TObject);
begin
  with TfrmConsultaNotas.create(self) do
  try
    FormStyle := fsNormal;
    WindowState := wsNormal;
    Hide;
    FiltrarNotas(FContrato, [TF_170], FPeriodo, ESTADO_NOTA_APLICADA, []);
    if (ShowModal = mrOk) and (IdNota > 0) then
    begin
      fraForm170.LimpiarControles;
      FIdNotaPeriodoRelacion170 := get_idnotaperiodo(IdNota, FPeriodo);
      fraForm170.CargarFormulario(FIdNotaPeriodoRelacion170);
      fraForm170.ActivarControles(false);
      lblNotaRelac170.Visible := true;
      lblNotaRelac170.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(FIdNotaPeriodoRelacion170)
                                                                                + ' ) FROM DUAL ');
      FTipoRelacion170 := 'M';
    end;
  finally
    free;
  end;
end;

procedure TfraFormMixta931_170.MostrarBotones(aVer: boolean);
begin
  MostrarBotones931(aVer);
  MostrarBotones170(aVer);
end;

procedure TfraFormMixta931_170.MostrarBotones170(aVer: boolean);
begin
  btnBuscarNotaRelac170.Visible := aVer;
  btnBuscarManualNotaRelac170.Visible := aVer;
  if not aVer then
  begin
    lblNotaRelac170.Visible := false;
    FIdNotaPeriodoRelacion170 := -1;
    FTipoRelacion170 := '';
  end;
end;

procedure TfraFormMixta931_170.MostrarBotones931(aVer: boolean);
begin
  btnBuscarNotaRelac931.Visible := aVer;
  btnBuscarManualNotaRelac931.Visible := aVer;
  if not aVer then
  begin
    lblNotaRelac931.Visible := false;
    FIdNotaPeriodoRelacion931 := -1;
    FTipoRelacion931 := '';
  end;
end;

procedure TfraFormMixta931_170.lblNotaRelac931Click(Sender: TObject);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_ID, NP_IDTIPOFORMULARIO, NP_PERIODO, NP_IDESTADOFORMULARIO, NP_ILEGIBLE ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(FIdNotaPeriodoRelacion931));

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

procedure TfraFormMixta931_170.lblNotaRelac170Click(Sender: TObject);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT NP_ID, NP_IDTIPOFORMULARIO, NP_PERIODO, NP_IDESTADOFORMULARIO, NP_ILEGIBLE ' +
                ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                ' WHERE NP_ID = ' + SqlValue(FIdNotaPeriodoRelacion170));

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

procedure TfraFormMixta931_170.btnBuscarNotaRelac931Click(Sender: TObject);
var
  IdNotaPeriodoRelacion931: integer;
begin
  fraForm931.LimpiarControles;
  IdNotaPeriodoRelacion931 :=  get_idnotaperiodo931(FContrato, FPeriodo);
  if (IdNotaPeriodoRelacion931 > 0) then
  begin
    lblNotaRelac931.Visible := true;
    fraForm931.CargarFormulario(IdNotaPeriodoRelacion931);
    fraForm931.ActivarControles(false);
    if lblNotaRelac931.Visible then
    begin
      lblNotaRelac931.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(IdNotaPeriodoRelacion931)
                                                                                + ' ) FROM DUAL ');
      FIdNotaPeriodoRelacion931 := IdNotaPeriodoRelacion931;
      FTipoRelacion931 := 'A';
    end;
  end
  else begin
    lblNotaRelac931.Visible := false;
    FIdNotaPeriodoRelacion931 := -1;
    FTipoRelacion931 := '';
    fraForm931.ActivarControles(true);
  end;
end;

procedure TfraFormMixta931_170.btnBuscarNotaRelac170Click(Sender: TObject);
var
  IdNotaPeriodoRelacion170: integer;
begin
  fraForm170.LimpiarControles;
  IdNotaPeriodoRelacion170 :=  get_idnotaperiodo170(FContrato, FPeriodo);
  if (IdNotaPeriodoRelacion170 > 0) then
  begin
    lblNotaRelac170.Visible := true;
    fraForm170.CargarFormulario(IdNotaPeriodoRelacion170);
    fraForm170.ActivarControles(false);
    if lblNotaRelac170.Visible then
    begin
      lblNotaRelac170.Caption := ValorSql('SELECT EMI.NOTAS.GET_NOTARELACIONADA( ' + SqlValue(IdNotaPeriodoRelacion170)
                                                                                + ' ) FROM DUAL ');
      FIdNotaPeriodoRelacion170 := IdNotaPeriodoRelacion170;
      FTipoRelacion170 := 'A';
    end;
  end
  else begin
    lblNotaRelac170.Visible := false;
    FIdNotaPeriodoRelacion170 := -1;
    FTipoRelacion170 := '';
    fraForm170.ActivarControles(true);
  end;
end;

procedure TfraFormMixta931_170.btnLimpiarNota931Click(Sender: TObject);
begin
  fraForm931.LimpiarControles;
  fraForm931.ActivarControles(true);
  lblNotaRelac931.Visible := false;
  FIdNotaPeriodoRelacion931 := -1;
  FTipoRelacion931 := '';
end;

procedure TfraFormMixta931_170.btnLimpiarNota170Click(Sender: TObject);
begin
  fraForm170.LimpiarControles;
  fraForm170.ActivarControles(true);
  lblNotaRelac170.Visible := false;
  FIdNotaPeriodoRelacion170 := -1;
  FTipoRelacion170 := '';
end;

function TfraFormMixta931_170.GetFechaPresentacion: TDate;
begin
  if (fraForm931.FechaPresentacion > fraForm170.FechaPresentacion) then
    result := fraForm931.FechaPresentacion
  else
    result := fraForm170.FechaPresentacion;
end;

function TfraFormMixta931_170.GetRectificativa: string;
begin
  if not fraForm931.IsEmpty then
    result := fraForm931.Rectificativa
  else
    result := '';
end;

procedure TfraFormMixta931_170.SetConservarFechaPres(const Value: boolean);
begin
  FConservarFechaPres := Value;
  fraForm931.ConservarFechaPres := Value;
  fraForm170.ConservarFechaPres := Value;
end;

end.
