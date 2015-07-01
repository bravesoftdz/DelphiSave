unit unfraNumAutoAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, StdCtrls, Mask, PatternEdit, IntEdit, ComCtrls,
  ToolWin, DB, SDEngine, unAgenda, FormPanel, unART, AdvToolBar,
  AdvToolBarStylers, unFraTrabajadorSiniestro, AdvGlowButton, ExtCtrls,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unFraCPR_PRESTADOR,
  ImgList, DBCtrls, Placemnt, ToolEdit, DateComboBox, JvExControls,
  JvComponent, JvCalendar, Planner, DBPlanner, unFraCodDesc;

type
  TfraNumAutoAGENDA = class(TArtDbFrame, IModuloAgenda)
    btnDatoInexistente: TAdvGlowButton;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBarPager: TAdvToolBarPager;
    btnAceptar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    dbgAutorizaciones: TArtDBGrid;
    DBText1: TDBText;
    dtcFechaActual: TDateComboBox;
    edAE_NUMAUTO: TPatternEdit;
    edObservaciones: TMemo;
    fpBuscarAutorizaciones: TFormPanel;
    imgGrid: TImageList;
    imgIconos: TImageList;
    imgPicture: TImage;
    lbAutorizacion: TLabel;
    lblFechaFijadaTarea: TLabel;
    lbPractica: TLabel;
    mcCalendario: TJvMonthCalendar2;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pDia: TDBPlanner;
    pnlBottom: TPanel;
    pnlGeneral: TPanel;
    sdqCalendario: TSDQuery;
    sdqDatosAU_IDENTIFPRESTADOR: TFloatField;
    sdqDatosAU_NUMAUTO: TFloatField;
    sdqDatosESTADO: TStringField;
    sdqDatosFECHA_APROBACION: TDateTimeField;
    sdqDatosFECHA_SOLICITUD: TDateTimeField;
    sdqDatosOBSERVACIONES: TStringField;
    sdqDatosPRESTACION: TStringField;
    sdqDatosPRESTADOR: TStringField;
    sdqDatosPR_FORMULARIO: TStringField;
    sdqDatosTIPO: TStringField;
    tbAutorizaciones: TToolButton;
    tbToolbarFecha: TToolBar;
    ToolBarAutorizaciones: TToolBar;
    tsAutorizaciones: TAdvPage;
    tsCalendario: TAdvPage;
    procedure AdvToolBarPagerChanging(Sender: TObject; FromPage, ToPage: Integer; var AllowChange: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnDatoInexistenteClick(Sender: TObject);
    procedure dbgAutorizacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dtcFechaActualChange(Sender: TObject);
    procedure edAE_NUMAUTOChange(Sender: TObject);
    procedure fpBuscarAutorizacionesKeyPress(Sender: TObject; var Key: Char);
    procedure mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure pDiaItemDblClick(Sender: TObject; Item: TPlannerItem);
    procedure pDiaItemExit(Sender: TObject; Item: TPlannerItem);
    procedure pDiaItemSelect(Sender: TObject; Item: TPlannerItem);
    procedure sdqCalendarioFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tbAutorizacionesClick(Sender: TObject);
 private
    dFechaDesde: TDate;
    FfraCPR_PRESTADOR: TfraCPR_PRESTADOR;
    FFrameTipo: TfraCodDesc;
    FfraTrabajadorSiniestro: TfraTrabajadorSiniestro;
    FIsRequired: Boolean;
    procedure DoCambiarFecha;
    procedure DoCargarCalendario(dFecha: TDateTime);
    procedure DoCargarDia(Dia: TDate);
    function GetImageIndexFromQuery: Integer;
    function GetIsRequired: Boolean;
    function GetOrden: Integer;
    function GetParamName: String;
    function GetRecaida: Integer;
    function GetSiniestro: Integer;
    function GetVisible: Boolean;
    procedure SetIsRequired(const Value: Boolean);
    function SetStartTime(dHora: String): TDateTime;
 protected
    function GetValue: TTableID; override;
    procedure SetLocked(const Value: Boolean); override;
    procedure SetValue(const Value: TTableID); override;
 public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    function Validate: Boolean;
    {Vínculos con otros frames}
    property FramePrestador: TfraCPR_PRESTADOR read FfraCPR_PRESTADOR write FfraCPR_PRESTADOR;
    property FrameSiniestro: TfraTrabajadorSiniestro read FfraTrabajadorSiniestro write FfraTrabajadorSiniestro;
    property FrameTipo: TfraCodDesc read FFrameTipo write FFrameTipo;
    {Propiedades}
    property Orden: Integer read GetOrden;
    property ParamName: String read GetParamName;
    property Recaida: Integer read GetRecaida;
    property Siniestro: Integer read GetSiniestro;
    property Value: TTableID read GetValue write SetValue;
 published
    property NumAuto: TTableID read GetValue;
  end;

var
  fraNumAutoAGENDA: TfraNumAutoAGENDA;

implementation

uses
  CustomDlgs, unDmPrincipal, VCLExtra, unGrids, Strfuncs, Math, General,
  AnsiSql, SqlFuncs, unArtFrame, unFraCodigoDescripcion;

{$R *.dfm}

procedure TfraNumAutoAGENDA.btnAceptarClick(Sender: TObject);
begin
  Verificar(not sdqDatos.Active or sdqDatos.IsEmpty, btnAceptar, 'Debe seleccionar un número de autorización.');
  Verificar(Assigned(Sender) and (AdvToolBarPager.ActivePage = tsCalendario), btnAceptar,
            'Para seleccionar una autorización debe: ' + CRLF + CRLF +
            '· Hacer doble click sobre una autorización desde el listado' + CRLF +
            '· Hacer doble click sobre una autorización desde el calendario prestacional' + CRLF +
            '· Seleccionar una autorización desde el listado y presionar el botón "Aceptar"');
  fpBuscarAutorizaciones.ModalResult := mrOk;
end;

procedure TfraNumAutoAGENDA.dbgAutorizacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  bitmap: TBitmap;
  fixRect: TRect;
  bmpWidth: integer;
  imgIndex: integer;
begin
  fixRect := Rect;

  if Column.Field = sdqDatosTIPO then
  begin
    //adding some logic to grab the required image
    imgIndex := GetImageIndexFromQuery;
    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList
      //(using the "Salary" field's value)
      imgGrid.GetBitmap(imgIndex, bitmap);
      //Fix the bitmap dimensions
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      dbgAutorizaciones.Canvas.StretchDraw(fixRect, bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle, 
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  //draw default text (fixed position)
  dbgAutorizaciones.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TfraNumAutoAGENDA.dtcFechaActualChange(Sender: TObject);
begin
  DoCambiarFecha;
end;

procedure TfraNumAutoAGENDA.edAE_NUMAUTOChange(Sender: TObject);
begin
  inherited;
  if edAE_NUMAUTO.Text > '' then
    if sdqDatos.Active and (not sdqDatos.IsEmpty) then
      lbPractica.Caption := sdqDatos.FieldByName('PRESTACION').AsString
    else if edAE_NUMAUTO.Text <> '0' then
    begin
      lbPractica.Caption := ValorSQLEx('SELECT pr_descripcion prestacion ' +
                                         'FROM art.mpr_prestaciones, art.sau_autorizaciones ' +
                                        'WHERE iif_char(au_estado, ''P'', au_pressol, NVL(au_presapro, au_pressol)) = pr_codigo(+) ' +
                                          'AND au_siniestro = :siniestro ' +
                                          'AND au_orden = :orden ' +
                                          'AND au_recaida = :recaida ' +
                                          'AND au_numauto = :numauto', [Siniestro, Orden, Recaida, NumAuto]);
    end else
      edAE_NUMAUTO.Text := '';
end;

procedure TfraNumAutoAGENDA.fpBuscarAutorizacionesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(VK_ESCAPE) then
    btnCancelar.Click;
end;

procedure TfraNumAutoAGENDA.mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
begin
  if dFechaDesde <> mcCalendario.FirstVisibleDate(False) then
    DoCargarCalendario(mcCalendario.FirstVisibleDate(False) + 45);
  dtcFechaActual.Date := StartDate;
  DoCargarDia(dtcFechaActual.Date);
end;

procedure TfraNumAutoAGENDA.pDiaItemDblClick(Sender: TObject; Item: TPlannerItem);
begin
  if (Item.ID > 0) then
  begin
    if AreIn(Item.URL, ['A', 'T']) then
    begin
      if sdqDatos.Locate('au_numauto', Item.Tag, []) then
      begin
        AdvToolBarPager.ActivePageIndex := tsAutorizaciones.PageIndex;
        btnAceptarClick(nil);
      end else
        InfoHint(nil, 'Debe seleccionar una autorización válida.');
    end;
  end;
end;

procedure TfraNumAutoAGENDA.pDiaItemExit(Sender: TObject; Item: TPlannerItem);
begin
  edObservaciones.Clear;
end;

procedure TfraNumAutoAGENDA.pDiaItemSelect(Sender: TObject; Item: TPlannerItem);
begin
  edObservaciones.Clear;
  sdqCalendario.Filtered      := True;
  edObservaciones.Lines.Text  := Item.CaptionText;
  sdqCalendario.Filtered      := False;
end;

procedure TfraNumAutoAGENDA.sdqCalendarioFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('fecha').AsDateTime = dtcFechaActual.Date) or
            ((pdia.Items.SelCount > 0)  and (pDia.Items.Selected.ID > 0) and
             (DataSet.FieldByName('id').AsInteger = pDia.Items.Selected.ID));
end;

procedure TfraNumAutoAGENDA.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(dbgAutorizaciones);
  sdqDatos.First;
  try
  except
    sdqDatos.Locate('AU_NUMAUTO', VarArrayOf([Value]), []);
  end;
  fpBuscarAutorizaciones.Height := Min(Max((sdqDatos.RecordCount * 20) + 100, 580), Screen.Height - 100);
  AdvToolBarPager.Height := fpBuscarAutorizaciones.Height - pnlBottom.Height;
  fpBuscarAutorizaciones.Width := Min(GetColumnWidths(dbgAutorizaciones, True) - 4, Screen.Width - 100);
end;

procedure TfraNumAutoAGENDA.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  imgPicture.Picture.Bitmap.FreeImage;
  imgGrid.GetBitmap(GetImageIndexFromQuery, imgPicture.Picture.Bitmap);
  imgPicture.Invalidate;
end;

procedure TfraNumAutoAGENDA.tbAutorizacionesClick(Sender: TObject);
var
  dFechaAux: TDateTime;
begin
  Verificar(not Assigned(FfraTrabajadorSiniestro), edAE_NUMAUTO, 'No se pudo determinar a que siniestro correspondería esta autorización.');
  Verificar(FfraTrabajadorSiniestro.IsEmpty, FfraTrabajadorSiniestro.edSiniestro, 'Debe seleccionar previamente un número de siniestro.');
  OpenQueryEx(sdqDatos, [Siniestro, Orden, Recaida, FrameTipo.Descripcion]);

  pDia.Caption.Title  := ' Siniestro: ' + FfraTrabajadorSiniestro.Siniestro;
  mcCalendario.Today  := DBDate;

  if sdqDatos.Active and not sdqDatos.IsEmpty then
    dFechaAux := sdqDatos.FieldByName('FECHA_SOLICITUD').AsDateTime
  else
    dFechaAux := mcCalendario.Today;

  dtcFechaActual.Date := Min(mcCalendario.Today, dFechaAux);
  DoCargarCalendario(dtcFechaActual.Date);
  DoCargarDia(dtcFechaActual.Date);

  if InStr(UpperCase(FrameTipo.Descripcion), 'TRASLADO') > 0 then
    AdvToolBarPager.ActivePage := tsCalendario
  else
    AdvToolBarPager.ActivePage := tsAutorizaciones;

  if sdqDatos.Active and not sdqDatos.IsEmpty then
  begin
    HideAllBalloons;
    try
      if fpBuscarAutorizaciones.ShowModal = mrOK then
        edAE_NUMAUTO.Text := sdqDatos.FieldByName('AU_NUMAUTO').AsString;
        if Assigned(FfraCPR_PRESTADOR) then
          FfraCPR_PRESTADOR.Value := sdqDatos.FieldByName('AU_IDENTIFPRESTADOR').AsInteger;
    finally
      ShowAllBalloons;
    end;
  end else
    InfoHint(edAE_NUMAUTO, 'El siniestro seleccionado no posee ninguna autorización ' + iif(Assigned(FrameTipo), 'del tipo ' + FrameTipo.Descripcion, 'asociada') + '.');
end;

procedure TfraNumAutoAGENDA.DoCambiarFecha;
begin
  if dtcFechaActual.IsValid and (Length(Copy(Trim(dtcFechaActual.Text),7,4)) >= 2) and
  (mcCalendario.DateFirst <> dtcFechaActual.Date) then
  begin
    mcCalendario.DateFirst := dtcFechaActual.Date;
    mcCalendarioSelChange(Self, dtcFechaActual.Date, dtcFechaActual.Date);
    DoCargarDia(dtcFechaActual.Date);
  end;
end;

procedure TfraNumAutoAGENDA.DoCargarCalendario(dFecha :TDateTime);
var
   Y, M, D: Word;
   dAux :TDateTime;
begin
  pDia.Items.Clear;
  mcCalendario.DateFirst := dFecha;

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
    ParamByName('pIdExped').AsInteger   := FfraTrabajadorSiniestro.IdExpediente;
    ParamByName('pDesde').AsDate        := mcCalendario.FirstVisibleDate(False);
    ParamByName('pHasta').AsDate        := mcCalendario.LastVisibleDate(False);
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

procedure TfraNumAutoAGENDA.DoCargarDia(Dia :TDate);
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
      Tag           := sdqCalendario.FieldByName('numauto').AsInteger;

      if sdqCalendario.FieldByName('estado').AsString = 'P' then
        Font.Color := clSilver;
      if sdqCalendario.FieldByName('estado').AsString = 'R' then
        Font.Style := [fsStrikeOut];
    end;
    sdqCalendario.Next;
  end;
  sdqCalendario.Filtered  := False;
end;

function TfraNumAutoAGENDA.GetImageIndexFromQuery: Integer;
const
  FORMULARIO_TRASLADOS = 'T';
  FORMULARIO_PROTESIS_ORTOPEDIA = 'P';
  FORMULARIO_INVESTIGACION = 'I';
  FORMULARIO_SEROLOGIA = 'S';
  FORMULARIO_MEDICAMENTOS = 'M';
  FORMULARIO_FKT = 'F';
  FORMULARIO_FONOAUDIOLOGIA = 'N';
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
  begin
    if AreIn(sdqDatosPRESTACION.AsString, ['AMBULANCIA']) then
      Result := 0
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_TRASLADOS then
      Result := 1
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_FKT then
      Result := 2
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_MEDICAMENTOS then
      Result := 3
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_SEROLOGIA then
      Result := 4
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_INVESTIGACION then
      Result := 5
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_PROTESIS_ORTOPEDIA then
      Result := 6
    else if sdqDatosPR_FORMULARIO.AsString = FORMULARIO_FONOAUDIOLOGIA then
      Result := 7
    else
      Result := 8;
  end else
    Result := -1;
end;

function TfraNumAutoAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraNumAutoAGENDA.GetOrden: Integer;
begin
  if Assigned(FfraTrabajadorSiniestro) and FfraTrabajadorSiniestro.IsSelected then
    Result := FfraTrabajadorSiniestro.Ord
  else
    Result := ART_EMPTY_ID;
end;

function TfraNumAutoAGENDA.GetParamName: String;
begin
  Result := 'NUMAUTO';
end;

function TfraNumAutoAGENDA.GetRecaida: Integer;
begin
  if Assigned(FfraTrabajadorSiniestro) and FfraTrabajadorSiniestro.IsSelected then
    Result := FfraTrabajadorSiniestro.Rec
  else
    Result := ART_EMPTY_ID;
end;

function TfraNumAutoAGENDA.GetSiniestro: Integer;
begin
  if Assigned(FfraTrabajadorSiniestro) and FfraTrabajadorSiniestro.IsSelected then
    Result := FfraTrabajadorSiniestro.Sin
  else
    Result := ART_EMPTY_ID;
end;

function TfraNumAutoAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraNumAutoAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbAutorizacion.Caption := 'Autorización (*)'
  else
    lbAutorizacion.Caption := 'Autorización';
end;

function TfraNumAutoAGENDA.SetStartTime(dHora :String) :TDateTime;
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

function TfraNumAutoAGENDA.GetValue: TTableID;
begin
  Result := StrToIntDef(edAE_NUMAUTO.Text, 0);
end;

procedure TfraNumAutoAGENDA.SetLocked(const Value: Boolean);
begin
  inherited;
  tbAutorizaciones.Enabled := not Value;
end;

procedure TfraNumAutoAGENDA.SetValue(const Value: TTableID);
begin
  edAE_NUMAUTO.Text := IntToStr(Value);
  edAE_NUMAUTOChange(nil);
end;

constructor TfraNumAutoAGENDA.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfraNumAutoAGENDA.AdvToolBarPagerChanging(Sender: TObject; FromPage, ToPage: Integer; var AllowChange: Boolean);
begin
  if (FromPage = tsAutorizaciones.PageIndex) and (ToPage = tsCalendario.PageIndex) then
  begin
    
  end;
end;

procedure TfraNumAutoAGENDA.btnDatoInexistenteClick(Sender: TObject);
begin
  Clear;
  fpBuscarAutorizaciones.ModalResult := mrCancel;
end;

procedure TfraNumAutoAGENDA.Clear;
begin
  inherited;
  edAE_NUMAUTO.Clear;
  lbPractica.Caption := '';
  if Assigned(FfraCPR_PRESTADOR) and FfraCPR_PRESTADOR.IsEmpty then
    FfraCPR_PRESTADOR.Clear;
end;

function TfraNumAutoAGENDA.Validate: Boolean;
begin
  Verificar(IsEmptyString(edAE_NUMAUTO.Text), edAE_NUMAUTO, 'Debe seleccionar un número de autorización.');
  Result := True;
end;

end.
