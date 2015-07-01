unit unFraPregunta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Data.DB, SDEngine, unCustomGridABM, AdvPageControl;

type
  TfraPregunta = class(TArtFrame)
    pnlRespuesta: TPanel;
    pcRespuesta: TAdvPageControl;
    tsTextoLibre: TAdvTabSheet;
    mTextoLibre: TMemo;
    tsListaDeRespuestas: TAdvTabSheet;
    fraListaDeRespuestas: TfraCodDesc;
    tsRespuestaMultiple: TAdvTabSheet;
    pnlPregunta: TJvPanel;
    pnlBreadCrumb: TJvPanel;
    sdqGuardarRespuesta: TSDQuery;
    sdqCargarRespuesta: TSDQuery;
    sdqModificarRespuesta: TSDQuery;
    procedure fraListaDeRespuestasPropiedadesChange(Sender: TObject);
  private
    FSQLGuardarRespuesta: String;
    FSQLModificarRespuesta: String;
    FTipoRespuesta: String;
    FObligatoria: Boolean;
    FIdEncuesta: Integer;
    FIdPregunta: Integer;
    FEncuestaInstanciaDetalleId: Integer;
    FIndice: Integer;

    function GetPreguntaDescripcion: String;
    function GetTipoRespuesta: String;
    function GetBreadCrumb: String;
    function GetRespuestaSQL: String;

    procedure SetPreguntaDescripcion(const Value: String);
    procedure SetTipoRespuesta(const Value: String);
    procedure SetBreadCrumb(const Value: String);
    procedure SetObligatoria(const Value: Boolean);
    procedure SetRespuestaSQL(const Value: String);

  public
    constructor Create(AOwner: TComponent); override;

    function IsEmpty: Boolean;
    function ValidarPregunta: Boolean;
    procedure Clear; override;
    procedure GuardarRespuesta(AIdEncuestaInstancia: Integer; AModoABM: TModoABM);
    procedure CargarRespuesta(AIdInstanciaEncuesta: Integer; AIdPregunta: Integer);
    procedure BloquearPregunta(ALocked: Boolean);
    procedure SetFocus; override;

    property PreguntaDescripcion: String  read GetPreguntaDescripcion write SetPreguntaDescripcion;
    property TipoRespuesta      : String  read GetTipoRespuesta       write SetTipoRespuesta;
    property BreadCrumb         : String  read GetBreadCrumb          write SetBreadCrumb;
    property Obligatoria        : Boolean read FObligatoria           write SetObligatoria;
    property RespuestaSQL       : String  read GetRespuestaSQL        write SetRespuestaSQL;
    property IdEncuesta         : Integer read FIdEncuesta            write FIdEncuesta;
    property IdPregunta         : Integer read FIdPregunta            write FIdPregunta;
    property Indice             : Integer read FIndice                write FIndice;
  end;

var
  fraPregunta: TfraPregunta;

implementation

uses
  AnsiSql, CustomDlgs, unDMPrincipal, VCLExtra, StrFuncs;

{$R *.dfm}

{ TfraPregunta }


procedure TfraPregunta.Clear;
begin
  PreguntaDescripcion := '';
  TipoRespuesta := '';
  BreadCrumb := '';
  Obligatoria := False;
  RespuestaSQL := '';
end;

constructor TfraPregunta.Create(AOwner: TComponent);
begin
  inherited;
  pnlPregunta := TJvPanel(Self.FindComponent('pnlPregunta'));
  FSQLGuardarRespuesta := sdqGuardarRespuesta.SQL.Text;
  FSQLModificarRespuesta := sdqModificarRespuesta.SQL.Text;
end;


procedure TfraPregunta.fraListaDeRespuestasPropiedadesChange(Sender: TObject);
begin
  Change;
end;

function TfraPregunta.GetBreadCrumb: String;
begin
  Result := pnlBreadCrumb.Caption;
end;

function TfraPregunta.GetPreguntaDescripcion: String;
begin
  Result := pnlPregunta.Caption;
end;

function TfraPregunta.GetRespuestaSQL: String;
begin
  Result := fraListaDeRespuestas.Propiedades.Sql;
end;

function TfraPregunta.GetTipoRespuesta: String;
begin
  Result := FTipoRespuesta;
end;

procedure TfraPregunta.SetBreadCrumb(const Value: String);
begin
  pnlBreadCrumb.Caption := Value;
end;

procedure TfraPregunta.SetFocus;
begin
  inherited;
  GetParentForm(Self).Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfraPregunta.SetObligatoria(const Value: Boolean);
begin
  FObligatoria := Value;
end;

procedure TfraPregunta.SetPreguntaDescripcion(const Value: String);
begin
  pnlPregunta.Caption := Value;
end;

procedure TfraPregunta.SetRespuestaSQL(const Value: String);
begin
  fraListaDeRespuestas.Propiedades.Sql := Value;
end;

procedure TfraPregunta.SetTipoRespuesta(const Value: String);
var
  i: Integer;
begin
  FTipoRespuesta := Value;
  if FTipoRespuesta = 'L' then
    pcRespuesta.ActivePage := tsTextoLibre
  else
  if (FTipoRespuesta = 'Q') or (FTipoRespuesta = 'R') then
    pcRespuesta.ActivePage := tsListaDeRespuestas;

  for i:= 0 to 2 do
    pcRespuesta.Pages[i].TabVisible := False;
  if FTipoRespuesta = 'L' then
    pcRespuesta.Pages[0].TabVisible := True
  else
  if (FTipoRespuesta = 'R') or (FTipoRespuesta = 'Q') then
    pcRespuesta.Pages[1].TabVisible := True;

end;

procedure TfraPregunta.GuardarRespuesta(AIdEncuestaInstancia: Integer; AModoABM: TModoABM);
var
  iIdRespuesta, iIdRespuestaDinamica: Integer;
  sRespuestaLibre, sRespuestaDinamica: String;
begin
  iIdRespuesta := 0;
  sRespuestaLibre := '';
  sRespuestaDinamica := '';
  iIdRespuestaDinamica := 0;

  if (TipoRespuesta = 'R') then
    iIdRespuesta := fraListaDeRespuestas.Value
  else
  if TipoRespuesta = 'L' then
    sRespuestaLibre := mTextoLibre.Lines.Text
  else
  if TipoRespuesta = 'Q' then
  begin
    sRespuestaDinamica := fraListaDeRespuestas.Descripcion;
    iIdRespuestaDinamica := fraListaDeRespuestas.Value;
  end;

  if (AModoABM = maModificacion) and (FEncuestaInstanciaDetalleId > 0) then
    EjecutarSqlSTEx(FSQLModificarRespuesta, [iIdRespuesta, iIdRespuesta, sRespuestaLibre, sRespuestaDinamica, iIdRespuestaDinamica, iIdRespuestaDinamica, FEncuestaInstanciaDetalleId])
  else
  if AModoABM <> maBaja then
    EjecutarSqlSTEx(FSQLGuardarRespuesta, [AIdEncuestaInstancia, FIdEncuesta, FIdPregunta, iIdRespuesta, iIdRespuesta, sRespuestaLibre, sRespuestaDinamica, iIdRespuestaDinamica])
end;

function TfraPregunta.IsEmpty: Boolean;
begin
  Result := fraListaDeRespuestas.IsEmpty and IsEmptyString(mTextoLibre.Lines.Text);
end;

procedure TfraPregunta.BloquearPregunta(ALocked: Boolean);
begin
  VCLExtra.LockControls([mTextoLibre, fraListaDeRespuestas], ALocked);
end;

procedure TfraPregunta.CargarRespuesta(AIdInstanciaEncuesta: Integer; AIdPregunta: Integer);
begin
  OpenQueryEx(sdqCargarRespuesta, [AIdInstanciaEncuesta, AIdPregunta]);

  if not sdqCargarRespuesta.IsEmpty then
  begin
    if TipoRespuesta = 'R' then
      fraListaDeRespuestas.Value := sdqCargarRespuesta.FieldByName('ED_IDRESPUESTA').AsInteger
    else
    if TipoRespuesta = 'L' then
      mTextoLibre.Lines.Text := sdqCargarRespuesta.FieldByName('ED_RESPUESTALIBRE').AsString
    else
    if TipoRespuesta = 'Q' then
      fraListaDeRespuestas.Value := sdqCargarRespuesta.FieldByName('ED_IDRESPUESTADINAMICA').AsInteger;

    FEncuestaInstanciaDetalleId := sdqCargarRespuesta.FieldByName('ED_ID').AsInteger;
  end
  else
    FEncuestaInstanciaDetalleId := 0;
end;

function TfraPregunta.ValidarPregunta: Boolean;

  function GetParentTabSheet(AControl: TWinControl): TAdvTabSheet;
  begin
    if Assigned(AControl) then
      if (AControl.ClassType <> TAdvTabSheet) then
        Result := GetParentTabSheet(AControl.Parent)
      else
        Result := TAdvTabSheet(AControl)
    else
      Result := nil;
  end;

  function Verificar(Condicion: Boolean; AControl: TWinControl; AText: String): Boolean;
  var
    tsAux: TAdvTabSheet;
  begin
    if Condicion then
    begin
      tsAux := GetParentTabSheet(Self);//AControl);
      TAdvPageControl(tsAux.Parent).ActivePage := tsAux;
      Result := CustomDlgs.Verificar(Condicion, AControl, AText);
    end else
      Result := False;
  end;

begin
  if (TipoRespuesta = 'R') or (TipoRespuesta = 'Q') then
    Result := Verificar(fraListaDeRespuestas.IsEmpty, fraListaDeRespuestas, 'Debe seleccionar una respuesta')
  else
  if TipoRespuesta = 'L' then
    Result := Verificar(mTextoLibre.Lines.Text = '', mTextoLibre, 'Debe escribir una respuesta')
  else
    Result := False;
end;

initialization
  RegisterClasses([TEdit, TLabel, TMemo, TAdvPageControl, TAdvTabSheet, TfraCodDesc]);
end.
