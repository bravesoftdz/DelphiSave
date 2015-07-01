unit unGeneracionIntereses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, StdCtrls, Buttons, ToolEdit, DateComboBox, ExtCtrls,
  Mask, CurrEdit, Math ;

type
  TfrmGeneracionIntereses = class(TForm)
    gbIntereses: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    btnCalcularInt: TSpeedButton;
    edInteresesInt: TCurrencyEdit;
    edCapitalInt: TCurrencyEdit;
    rbRecapitInt: TRadioButton;
    pnlFechasInt: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    edDesdeInt: TDateComboBox;
    edHastaInt: TDateComboBox;
    rbActivaInt: TRadioButton;
    rbPasivaInt: TRadioButton;
    pnlTasasInt: TPanel;
    Label13: TLabel;
    Label67: TLabel;
    edTasaOrigInt: TCurrencyEdit;
    edTasaFinInt: TCurrencyEdit;
    btnCancelarInt: TBitBtn;
    btnAceptarInt: TBitBtn;
    FormStorage: TFormStorage;
    procedure btnCalcularIntClick(Sender: TObject);
    procedure edDesdeIntChange(Sender: TObject);
    procedure rbRecapitIntClick(Sender: TObject);
    procedure btnAceptarIntClick(Sender: TObject);
  private
    FConPago, FIdEvento, FSiniestro, FOrden, FRecaida: Integer;
    FFechaSin: TDate;
    FCapital: Double;
    FEsMortal: Boolean;
    function ValidarIntereses: Boolean;
    procedure SetCapital(const Value: Double);
    procedure DoLimpiarFpIntereses;
  public
    property ConPago: Integer     Read FConPago       Write FConPago;
    property Siniestro: Integer   Read FSiniestro     Write FSiniestro;
    property Orden: Integer       Read FOrden         Write FOrden;
    property Recaida: Integer     Read FRecaida       Write FRecaida;
    property IdEvento: Integer    Read FIdEvento      Write FIdEvento;
    property FechaSin: TDate      Read FFechaSin      Write FFechaSin;
    property Capital: Double      Read FCapital       Write SetCapital;
    property EsMortal: Boolean    Read FEsMortal      Write FEsMortal default False;
  end;

var
  frmGeneracionIntereses: TfrmGeneracionIntereses;

implementation

uses General, CustomDlgs, unDmPrincipal, DateTimeFuncs, unComunes,
     unClassLiquidacion, VCLExtra, DB;
{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.SetCapital(const Value: Double);
begin
  if (FCapital <> Value) then
  begin
    FCapital            := Value;
    edCapitalInt.Value  := FCapital;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmGeneracionIntereses.ValidarIntereses: Boolean;
var
  dRecDict, dDocum: TDate;
  sCodEv: String;
begin
  Verificar(rbRecapitInt.Checked and (not AreIn(IntToStr(ConPago), [CONCEPTO_GRANINVALIDEZDEF, CONCEPTO_TOTALDEF])),
            Nil, 'El concepto de pago de la liquidación no genera este tipo de intereses.');
  Verificar((rbActivaInt.Checked or rbPasivaInt.Checked) and
             not(AreIn(IntToStr(ConPago), [CONCEPTO_MUERTE, CONCEPTO_MUERTE_PAGOUNICO,
                                           CONCEPTO_PARCIALDEF_PU, CONCEPTO_PARCIALDEF_INDEM,
                                           CONCEPTO_TOTALDEF, CONCEPTO_PARCIALDEF_RP_PU,
                                           CONCEPTO_TOTALDEF_PAGOUNICO, CONCEPTO_PARCIALDEF_PU_ANTIC,
                                           CONCEPTO_TOTALDEF_ANTIC, CONCEPTO_GRANINVALIDEZDEF_ANTIC])), Nil,
            'El concepto de pago de la liquidación no genera este tipo de intereses.');
  Verificar(edDesdeInt.IsEmpty, edDesdeInt, 'Debe ingresar la fecha desde.');
  Verificar(edHastaInt.IsEmpty, edHastaInt, 'Debe ingresar la fecha hasta.');
  Verificar(rbPasivaInt.Checked and (edTasaOrigInt.Value = 0), edTasaOrigInt, 'Debe ingresar la tasa original.');
  Verificar(rbPasivaInt.Checked and (edTasaFinInt.Value = 0), edTasaFinInt, 'Debe ingresar la tasa final.');

  with GetQueryEx('SELECT ev_fecharecepcion, ev_codigo ' +
                   ' FROM art.sev_eventosdetramite ' +
                  ' WHERE ev_idevento = :IdEv', [IdEvento]) do
  try
    dRecDict := FieldByName('ev_fecharecepcion').AsDateTime;
    sCodEv   := FieldByName('ev_codigo').AsString;
  finally
    Free;
  end;
  Verificar(rbRecapitInt.Checked and (GetMonth(dRecDict)= GetMonth(DBDate)) and
            (GetYear(dRecDict) = GetYear(DBDate)), rbRecapitInt,
            'Este tipo de interes sólo se puede liquidar al mes siguiente de la recepción del dictamen.');
  Verificar(rbRecapitInt.Checked and (edDesdeInt.Date < (dRecDict + 1)), edDesdeInt,
            'La fecha desde no puede ser anterior al día posterior de la recepción del dictamen (' +
            DateToStr(dRecDict + 1) + ').');
  Verificar(rbRecapitInt.Checked and (edHastaInt.Date > LastDayOfMonth(DBDate)), edHastaInt,
            'La fecha hasta no puede ser posterior al ultimo dia del mes en curso.');
  if EsMortal then
  begin
    //el minimo para mortales es el quinto dia habil del mes siguiente a la fecha de ingreso de la documentacion..
    dDocum := ValorSqlDateTimeEx('SELECT art.amebpba.calcdiashabiles(MIN(ADD_MONTHS(TO_DATE(''01/'' || ' +
                                       ' TO_CHAR(sd_fechaingreso, ''mm/yyyy''), ''dd/mm/yyyy''), 1)), 5) ' +
                                  ' FROM SIN.ssd_seguimientodocumentacion, SIN.std_tipodocumento ' +
                                 ' WHERE sd_idtipodocumento = td_id ' +
                                   ' AND sd_fechabaja IS NULL ' +
                                   ' AND td_fechabaja IS NULL ' +
                                   ' AND td_clase = ''M'' ' +
                                   ' AND sd_idexpediente = art.siniestro.get_idexpediente(:sin, :ord, :reca)',
                                   [Siniestro, Orden, Recaida]);
    Verificar(dDocum = 0, Nil, 'Aun no se ha ingresado la documentación del siniestro mortal.');
    Verificar(edDesdeInt.Date < dDocum, edDesdeInt, 'La fecha desde no puede ser anterior ' +
             'al ingreso de la documentación (' + DateToStr(dDocum) + ').');
  end
  else begin
    Verificar(rbActivaInt.Checked and (sCodEv = EV_SENTENCIACAMFED) and
              (edDesdeInt.Date < FFechaSin), edDesdeInt,
              'La fecha desde no puede ser anterior a la del siniestro.');
    Verificar(rbActivaInt.Checked and (sCodEv <> EV_SENTENCIACAMFED) and
              (edDesdeInt.Date < CalcDiasHabiles(dRecDict, 15)), edDesdeInt,
              'La fecha desde no puede ser anterior que la recepción del dictamen mas 15 dias habiles (' +
              DateToStr(CalcDiasHabiles(dRecDict, 15)) + ').');
  end;
  Verificar(rbActivaInt.Checked and (edHastaInt.Date > CalcDiasHabiles(DBDate, 10)), edHastaInt,
            'La fecha hasta no puede ser posterior a 10 dias habiles posteriores a la actual (' +
            DateToStr(CalcDiasHabiles(DBDate, 10)) + ').');
  Verificar(rbPasivaInt.Checked and (edDesdeInt.Date < FFechaSin), edDesdeInt,
            'La fecha desde no puede ser anterior a la del siniestro.');
  Verificar(rbPasivaInt.Checked and (edHastaInt.Date > DBDate), edHastaInt,
            'La fecha hasta no puede ser posterior a la actual.');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.btnCalcularIntClick(Sender: TObject);
var
  iDias: Integer;
  dInter: Double;
begin
  if ValidarIntereses then
  begin
    iDias     := DaysBetween(edHastaInt.Date, edDesdeInt.Date) + 1;
    dInter    := 0;
    if rbRecapitInt.Checked then
      dInter := FCapital * iDias * ((Power(1 + TasaAnual, 1/12) - 1) / 30)
    else if rbActivaInt.Checked then
      dInter := (FCapital * Power(Power(1 + TasaMensual/100 , 1/30), iDias)) - FCapital
    else if rbPasivaInt.Checked then
      dInter := FCapital * ((100 + edTasaFinInt.Value)/(100 + edTasaOrigInt.Value) - 1);

    edInteresesInt.Value := dInter;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.edDesdeIntChange(Sender: TObject);
begin
  edInteresesInt.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.rbRecapitIntClick(Sender: TObject);
begin
  DoLimpiarFpIntereses;
  LockControls([edTasaOrigInt, edTasaFinInt], not rbPasivaInt.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.DoLimpiarFpIntereses;
begin
  edDesdeInt.Clear;
  edHastaInt.Clear;
  edTasaOrigInt.Clear;
  edTasaFinInt.Clear;
  edInteresesInt.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionIntereses.btnAceptarIntClick(Sender: TObject);
begin
  if ValidarIntereses and
     Verificar(edInteresesInt.Value = 0, edInteresesInt, 'El interes calculado es 0.') then
    ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
end.
