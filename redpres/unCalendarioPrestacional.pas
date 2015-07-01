unit unCalendarioPrestacional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, DBPlanner, StdCtrls, PlannerCal,
  Planner, Placemnt, DB, SDEngine, JvExControls, JvComponent, JvCalendar,
  Mask, ToolEdit, DateComboBox, ShortCutControl;

type
  TfrmCalendarioPrestacional = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    pDia: TDBPlanner;
    Panel3: TPanel;
    edObservaciones: TMemo;
    FormPlacement1: TFormPlacement;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    sdqCalendario: TSDQuery;
    mcCalendario: TJvMonthCalendar2;
    lblFechaFijadaTarea: TLabel;
    dtcFechaActual: TDateComboBox;
    ShortCutControl: TShortCutControl;
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure sdqCalendarioFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure pDiaItemSelect(Sender: TObject; Item: TPlannerItem);
    procedure pDiaItemExit(Sender: TObject; Item: TPlannerItem);
    procedure SetIdExpediente(Const Value :Integer);
    procedure pDiaItemDblClick(Sender: TObject; Item: TPlannerItem);
    procedure dtcFechaActualChange(Sender: TObject);
  private
    sSinCompleto :String;
    dFechaDesde :TDate;
    FIdExpediente, iSiniestro, iOrden, iRecaida :Integer;
    procedure DoCargarCalendario(dFecha :TDateTime);
    procedure DoCargarDia(Dia :TDate);
    procedure DoCambiarFecha;
    function SetStartTime(dHora :String) :TDateTime;
  public
    property IdExpediente: Integer read FIdExpediente write SetIdExpediente;
  end;

var
  frmCalendarioPrestacional: TfrmCalendarioPrestacional;

implementation

uses AnsiSql, SqlFuncs, unDmPrincipal, unPrincipal, DateUtils,
  DateTimeFuncs, General, unAutAprob, unParteEvolutivo, unTercerizadoras, unSesion;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action                      := caFree;
  frmCalendarioPrestacional   := Nil;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.DoCargarCalendario(dFecha :TDateTime);
var
   Y, M, D: Word;
   dAux :TDateTime;
   sSqlTerce, sSql: string;
begin
  pDia.Items.Clear;
  mcCalendario.DateFirst := dFecha;
  sSqlTerce := '';

  //primero limpio los que pueden haber quedado en negrita..
  dAux := mcCalendario.FirstVisibleDate(False);
  while dAux <= mcCalendario.LastVisibleDate(False) do
  begin
    DecodeDate(dAux, Y, M, D);
    mcCalendario.Bold[Y,M,D] := False;
    dAux                     := dAux + 1;
  end;

  with sdqCalendario do
  begin
    Filtered := False;
    Close;

    sSql := ' SELECT tipo, id, idexpediente, fecha, hora, detalle, observaciones, formulario ' +
              ' FROM v_calendario_prestacional ' +
             ' WHERE idexpediente = :pIdExped ' +
               ' AND fecha BETWEEN :pDesde AND :pHasta ';

    ParamByName('pIdExped').AsInteger := FIdExpediente;
    ParamByName('pDesde').AsDate      := mcCalendario.FirstVisibleDate(False);
    ParamByName('pHasta').AsDate      := mcCalendario.LastVisibleDate(False);

    if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
      sSqlTerce := ' AND art.siniestro.is_sinitercerizadora(idexpediente, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

    sdqCalendario.SQL.Text := sSql + sSqlTerce + ' ORDER BY fecha ';
    Open;
    
    while not EOF do
    begin
      DecodeDate(FieldByName('fecha').AsDateTime, Y, M, D);
      mcCalendario.Bold[Y,M,D]:= True;
      Next;
    end;
  end;
  dFechaDesde := mcCalendario.FirstVisibleDate(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.mcCalendarioSelChange(Sender: TObject;
  StartDate, EndDate: TDateTime);
begin
  if dFechaDesde <> mcCalendario.FirstVisibleDate(False) then
    DoCargarCalendario(mcCalendario.FirstVisibleDate(False) + 45);
  dtcFechaActual.Date := StartDate;
  DoCargarDia(dtcFechaActual.Date);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.DoCargarDia(Dia :TDate);
var
  dStart :TDateTime;
  sDetalle, sTipo :String;
begin
  pDia.Items.Clear;
  sdqCalendario.Filtered := True;
  while not sdqCalendario.EOF do
  begin
    with pDia.CreateItem do
    begin
      dStart    := 0;
      sDetalle  := sdqCalendario.FieldByName('detalle').AsString;
      sTipo     := sdqCalendario.FieldByName('tipo').AsString;
      if AreIn(sTipo, ['A', 'T']) then
      begin
        dStart  := SetStartTime(sdqCalendario.FieldByName('hora').AsString);
        Hint    := 'Autorización - Hora: ' + sdqCalendario.FieldByName('hora').AsString +
                   ' - ' + sDetalle;
      end else if (sTipo = 'P') then
      begin
        dStart  := StrToDateTime('01/01/2008' + '07:00');
        Hint    := 'Parte evolutivo - ' + sDetalle;
      end
      else if (sTipo = 'C') then
      begin
        dStart  := SetStartTime(sdqCalendario.FieldByName('hora').AsString);
        Hint    := 'Hora: ' + sdqCalendario.FieldByName('hora').AsString +
                   ' - ' + sDetalle;
      end;
      ID            := sdqCalendario.FieldByName('id').AsInteger;
      ItemStartTime := dStart;
      ItemEndTime   := dStart + 1/48; //media hora
      ItemPos       := 0;
      Text.Text     := sDetalle;
      CaptionText   := sdqCalendario.FieldByName('observaciones').AsString;
      URL           := sTipo;
    end;
    sdqCalendario.Next;
  end;
  sdqCalendario.Filtered  := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.sdqCalendarioFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('fecha').AsDateTime = dtcFechaActual.Date) or
            ((pdia.Items.SelCount > 0)  and (pDia.Items.Selected.ID > 0) and
             (DataSet.FieldByName('id').AsInteger = pDia.Items.Selected.ID));
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.pDiaItemSelect(Sender: TObject; Item: TPlannerItem);
begin
  edObservaciones.Clear;
  sdqCalendario.Filtered      := True;
  edObservaciones.Lines.Text  := Item.CaptionText;
  sdqCalendario.Filtered      := False;
end;
{-------------------------------------------------------------------------------}
function TfrmCalendarioPrestacional.SetStartTime(dHora :String) :TDateTime;
var
  iMin  :Integer;
begin
  try
    iMin := StrToInt(Copy(dHora, 4,2));
    if (iMin >= 30) and (iMin <= 59) then
      iMin := 30
    else
      iMin := 0;
  except
    dHora := '06:';
    iMin  := 0;
  end;
  Result := StrToDateTime('01/01/2008' + Copy(dHora, 0,3) + IntToStr(iMin));
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.pDiaItemExit(Sender: TObject; Item: TPlannerItem);
begin
  edObservaciones.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.SetIdExpediente(Const Value :Integer);
var
  sSql :String;
  SqlResults :TStringList;
begin
  if (Value <> FIdExpediente) then
  begin
    FIdExpediente       := Value;

    sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) id, ' +
                  ' ex_siniestro, ex_orden, ex_recaida ' +
             ' FROM sex_expedientes ' +
            ' WHERE ex_id = ' + SqlInt(FIdExpediente);
    SqlResults := ValoresColSQL(sSql);
    try
      sSinCompleto  := SqlResults[0];
      iSiniestro    := StrToInt(SqlResults[1]);
      iOrden        := StrToInt(SqlResults[2]);
      iRecaida      := StrToInt(SqlResults[3]);
    finally
      SqlResults.Free;
    end;
    pDia.Caption.Title  := ' Siniestro: ' + sSinCompleto;
    mcCalendario.Today  := Date;
    dtcFechaActual.Date := Date;
    DoCargarCalendario(Date);
    DoCargarDia(dtcFechaActual.Date);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.pDiaItemDblClick(Sender: TObject; Item: TPlannerItem);
var
  frmAutAprob: TfrmAutAprob;
begin
  if (Item.ID > 0) then
  begin
    if AreIn(Item.URL, ['A', 'T']) then
    begin
      frmAutAprob := TfrmAutAprob.Create(Self);
      try
        frmAutAprob.IsOrtopedia := (sdqCalendario.FieldByName('formulario').AsString = 'P');
        frmAutAprob.CargarAutorizacion(Item.ID);
        if frmAutAprob.ShowModal = mrOk then
        begin
          DoCargarCalendario(mcCalendario.FirstVisibleDate(False) + 45);
          DoCargarDia(dtcFechaActual.Date);
        end;
      finally
        frmAutAprob.Free;
      end;
    end
    else if (Item.URL = 'P') then
    begin
      with frmParteEvolutivo do
      begin
        if not(Assigned(frmParteEvolutivo)) then
        begin
          frmParteEvolutivo := TfrmParteEvolutivo.Create(frmPrincipal);
          FormStyle         := fsMDIChild;
        end;
        SinEdit.SetValues(iSiniestro, iOrden, iRecaida);
        CargarPartes;
        Show;
      end;
      Close;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.DoCambiarFecha;
begin
  if dtcFechaActual.IsValid and (Length(Copy(Trim(dtcFechaActual.Text),7,4)) >= 2) and
  (mcCalendario.DateFirst <> dtcFechaActual.Date) then
  begin
    mcCalendario.DateFirst := dtcFechaActual.Date;
    mcCalendarioSelChange(Self, dtcFechaActual.Date, dtcFechaActual.Date);
    DoCargarDia(dtcFechaActual.Date);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCalendarioPrestacional.dtcFechaActualChange(Sender: TObject);
begin
  DoCambiarFecha;
end;
{-------------------------------------------------------------------------------}
end.
