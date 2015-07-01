unit unFraTemas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unArtFrame, Data.DB, SDEngine, unVisita, JvExControls,
  JvScrollMax, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, unCustomGridABM;

type
  TfraTemas = class(TArtFrame)
    sdqTemas: TSDQuery;
    smTemas: TJvScrollMax;
    procedure smTemasResize(Sender: TObject);
    procedure FrameMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FrameMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  private
    FVisita: TVisita;
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Instanciar(AIdVisita: Integer);
    procedure CargarTemas(AIdVisitaInstancia: Integer);
    procedure Destruir;
    procedure GuardarTemas(AIdVisitaInstancia: Integer; AModoAbm: TModoABM);
    function ValidarTemas: Boolean;
    property Visita: TVisita read FVisita write FVisita;
  end;

implementation

{$R *.dfm}

uses
  unFraTema, unDmPrincipal, General;

{ TfraTemas }

procedure TfraTemas.CargarTemas(AIdVisitaInstancia: Integer);
var
  i: Integer;
begin
  for i := 0 to Visita.Count - 1 do
    Visita.Frame[i].CargarTema(AIdVisitaInstancia, Visita.Frame[i].IdTema);
end;

constructor TfraTemas.Create(AOwner: TComponent);
begin
  inherited;
  Visita := TVisita.Create(Ttema);
end;

destructor TfraTemas.Destroy;
begin
  Visita.Destroy;
  inherited;
end;

procedure TfraTemas.Destruir;
var
  i: Integer;
begin
  for i :=  smTemas.BandCount - 1 downto 0 do
    smTemas.Bands[i].Destroy;

  Visita.Clear;
end;

procedure TfraTemas.FrameMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  smTemas.ScrollPos := smTemas.ScrollPos + 3;
end;

procedure TfraTemas.FrameMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  smTemas.ScrollPos := smTemas.ScrollPos - 3;
end;

procedure TfraTemas.GuardarTemas(AIdVisitaInstancia: Integer; AModoAbm: TModoABM);
var
  i: Integer;
begin
  for i := 0 to Visita.Count - 1 do
    Visita.Frame[i].GuardarTema(AIdVisitaInstancia, AModoAbm);
end;

procedure TfraTemas.Instanciar(AIdVisita: Integer);
var
  i: Integer;
  smbScrollMaxBand: TJvScrollMaxBand;
  fraTemaAux: TFraTema;
  sCatAnt: String;
begin
  Destruir;
  OpenQueryEx(sdqTemas, [AIdVisita]);
  try
  i := 0;
  while not sdqTemas.Eof do
  begin
    smbScrollMaxBand := TJvScrollMaxBand.Create(smTemas);
    smbScrollMaxBand.Name := 'smbTema' + IntToStr(i);
    smTemas.AddBand(smbScrollMaxBand);
    smbScrollMaxBand.Beveled := False;
    smbScrollMaxBand.ButtonVisible := False;

    smbScrollMaxBand.Height := iif(sCatAnt <> sdqTemas.FieldByName('BREADCRUMB').AsString, 44, 24) + 2;

    fraTemaAux := TFraTema.Create(Self);
    fraTemaAux.Name := 'fraTema' + IntToStr(i);
    fraTemaAux.IdVisita:= AIdVisita;
    with fraTemaAux, sdqTemas do
    begin
      Align    := alClient;
      Parent   := smbScrollMaxBand;
      Indice   := i;
      Idtema                    := FieldByName('VT_ID').AsInteger;
      TemaDescripcion           := FieldByName('VT_DESCRIPCION').AsString;
      TipoRespuesta             := FieldByName('VT_TIPO').AsString;
      RespuestaSQL              := FieldByName('VT_RESPUESTASQL').AsString;
      BreadCrumb                := FieldByName('BREADCRUMB').AsString;
      RequiereObservaciones     := FieldByName('VT_OBSERVACIONES').AsString = 'S';
      RequiereAdjunto           := FieldByName('VT_ADJUNTO').AsString = 'S';
      MostrarCategoria          := sCatAnt <> BreadCrumb;
      MostrarIconoAyuda         := not FieldByName('VT_AYUDA').IsNull;
      MostrarIconoObservaciones := not (FieldByName('VT_OBSERVACIONES').AsString = 'N');
      MostrarIconoAdjunto       := not (FieldByName('VT_ADJUNTO').AsString = 'N');
      MostrarIconoRespuestas    := (FieldByName('VT_TIPO').AsString = 'R') or (FieldByName('VT_TIPO').AsString = 'Q');
      Ayuda                     := FieldByName('VT_AYUDA').AsString;
      fraTemaAux.Clear;
      Next;
      sCatAnt := BreadCrumb;
    end;
    Inc(i);
    smTemas.ScrollPos := 0;
    Visita.AddFrame(fraTemaAux);
    end;
  except
    Destruir;
  end;
end;

procedure TfraTemas.SetLocked(const Value: Boolean);
var
  i: Integer;
begin
  inherited;
  for i := 0 to Visita.Count - 1 do
    Visita.Frame[i].Locked := Value;
end;

procedure TfraTemas.smTemasResize(Sender: TObject);
begin
  smTemas.ScrollPos := 0;
end;

function TfraTemas.ValidarTemas: Boolean;
var
  i: Integer;
begin
  for i := 0 to Visita.Count - 1 do
      Visita.Frame[i].ValidarTema;

  Result := True;
end;

end.
