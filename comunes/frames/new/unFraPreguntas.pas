
unit unFraPreguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unArtFrame, Vcl.ComCtrls, Data.DB, SDEngine, AnsiSql, Vcl.StdCtrls,
  unEncuesta, unCustomGridABM, Vcl.ImgList, AdvPageControl;

type
  TfraPreguntas = class(TArtFrame)
    pcPreguntas: TAdvPageControl;
    sdqPreguntas: TSDQuery;
    ilIconos: TImageList;
    procedure pcPreguntasChange(Sender: TObject);
  private
    FEncuesta: TEncuesta;
    procedure FramePreguntaChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Change; override;
    procedure Instanciar(AIdEncuesta: Integer);
    procedure Destruir;
    procedure PreguntaSiguiente;
    procedure PreguntaAnterior;
    procedure PrimeraPregunta;
    procedure UltimaPregunta;
    procedure GuardarRespuestas(AIdInstanciaEncuesta: Integer; AModoAbm: TModoABM);
    procedure CargarRespuestas(AIdInstanciaEncuesta: Integer);
    function ValidarPreguntas: Boolean;
    procedure BloquearPreguntas(ALocked: Boolean);
    function TieneAlgunaRespuesta: Boolean;

    property Encuesta: TEncuesta read FEncuesta write FEncuesta;
  end;
{
var
  fraPreguntas: TfraPreguntas;
}
implementation

{$R *.dfm}

uses
  unFraPregunta, unDmPrincipal, General;

procedure TfraPreguntas.BloquearPreguntas(ALocked: Boolean);
var
  i: Integer;
begin
  for i := 0 to Encuesta.Count - 1 do
    Encuesta.Frame[i].BloquearPregunta(ALocked);
end;

procedure TfraPreguntas.CargarRespuestas(AIdInstanciaEncuesta: Integer);
var
  i: Integer;
begin
  for i := 0 to Encuesta.Count - 1 do
    Encuesta.Frame[i].CargarRespuesta(AIdInstanciaEncuesta, Encuesta.Frame[i].IdPregunta);
end;

procedure TfraPreguntas.Change;
begin
  inherited Change;
  FramePreguntaChange(nil);
end;

constructor TfraPreguntas.Create(AOwner: TComponent);
begin
  inherited;
  Encuesta := TEncuesta.Create(TPregunta);
end;

destructor TfraPreguntas.Destroy;
begin
  Encuesta.Destroy;
  inherited;
end;

procedure TfraPreguntas.Destruir;
var
  i: Integer;
begin
  for i := pcPreguntas.PageCount - 1 downto 0 do
    pcPreguntas.Pages[i].Destroy;

  Encuesta.Clear;
end;

procedure TfraPreguntas.FramePreguntaChange(Sender: TObject);
var
  i: Integer;
  auxFrame: TfraPregunta;
begin
  for i := 0 to Encuesta.Count - 1 do
  begin
    auxFrame := Encuesta.Frame[i];
    if Assigned(auxFrame) then
    begin
      if auxFrame.IsEmpty then
        pcPreguntas.Pages[auxFrame.Indice].ImageIndex := 0
      else
        pcPreguntas.Pages[auxFrame.Indice].ImageIndex := 1;

      if auxFrame.Indice = pcPreguntas.ActivePageIndex then
        pcPreguntas.Pages[auxFrame.Indice].ImageIndex := pcPreguntas.Pages[auxFrame.Indice].ImageIndex + 2;
    end;
  end;
end;

procedure TfraPreguntas.Instanciar(AIdEncuesta: Integer);
var
  i: Integer;
  tsTabSheet: TAdvTabSheet;
  fraPreguntaAux: TFraPregunta;
begin
  Destruir;
  // query y crea dinámicamente los tabsheet con un fraPregunta adentro para cada pregunta donde le setea las properties
  OpenQueryEx(sdqPreguntas, [AIdEncuesta]);

  try
    i := 0;
    while not sdqPreguntas.Eof do
    begin
      //inicializa un TTabSheet
      tsTabSheet := TAdvTabSheet.Create(pcPreguntas);
      tsTabSheet.Name := 'tsPregunta' + IntToStr(i);
      tsTabSheet.AdvPageControl := pcPreguntas;
      tsTabSheet.TabStop := False;
      tsTabSheet.Caption := iif(sdqPreguntas.FieldByName('EP_OBLIGATORIO').AsString = 'S', '*', '');

      //inicializa un TFraPregunta
      fraPreguntaAux := TFraPregunta.Create(Self);
      fraPreguntaAux.Name := 'fraPregunta' + IntToStr(i);
      fraPreguntaAux.IdEncuesta := AIdEncuesta;
      with fraPreguntaAux, sdqPreguntas do
      begin
        Align    := alClient;
        Parent   := tsTabSheet;
        OnChange := FramePreguntaChange;
        Indice   := i;

        PreguntaDescripcion := IntToStr(i + 1) + '. ' + FieldByName('EP_DESCRIPCION').AsString;
        TipoRespuesta       := FieldByName('EP_TIPO').AsString;
        Obligatoria         := FieldByName('EP_OBLIGATORIO').AsString = 'S';
        RespuestaSQL        := FieldByName('CONSULTA').AsString;
        BreadCrumb          := FieldByName('BREADCRUMB').AsString;
        IdPregunta          := FieldByName('EP_ID').AsInteger;
        Next;
      end;
      Inc(i);
      Encuesta.AddFrame(fraPreguntaAux);
    end;
  except
    Destruir;
  end;
end;

procedure TfraPreguntas.pcPreguntasChange(Sender: TObject);
begin
  FramePreguntaChange(nil);
  //FramePreguntaChange(Encuesta.Frame[pcPreguntas.ActivePageIndex]);
  Change;
end;

procedure TfraPreguntas.PreguntaAnterior;
begin
  if  pcPreguntas.ActivePageIndex > 0 then
    pcPreguntas.ActivePage := pcPreguntas.Pages[pcPreguntas.ActivePageIndex - 1];

  pcPreguntasChange(nil);
end;

procedure TfraPreguntas.PreguntaSiguiente;
begin
  if pcPreguntas.ActivePageIndex + 1 < pcPreguntas.PageCount then
    pcPreguntas.ActivePage := pcPreguntas.Pages[pcPreguntas.ActivePageIndex + 1];

  pcPreguntasChange(nil);
end;

procedure TfraPreguntas.PrimeraPregunta;
begin
  pcPreguntas.ActivePage := pcPreguntas.Pages[0];
  pcPreguntasChange(nil);
end;

function TfraPreguntas.TieneAlgunaRespuesta: Boolean;
var
  bTiene: Boolean;
  i: Integer;
begin
  bTiene := False;
  for i := 0 to Encuesta.Count - 1 do
    bTiene := bTiene or not Encuesta.Frame[i].IsEmpty;
  Result := bTiene;
end;

procedure TfraPreguntas.UltimaPregunta;
begin
  pcPreguntas.ActivePage := pcPreguntas.Pages[pcPreguntas.PageCount - 1];
  pcPreguntasChange(nil);
end;

function TfraPreguntas.ValidarPreguntas: Boolean;
var
  i: Integer;
begin
  for i := 0 to Encuesta.Count - 1 do
    if Encuesta.Frame[i].Obligatoria then
      Encuesta.Frame[i].ValidarPregunta;
  Result := True;
end;

procedure TfraPreguntas.GuardarRespuestas(AIdInstanciaEncuesta: Integer; AModoAbm: TModoABM);
var
  i: Integer;
begin
  for i := 0 to Encuesta.Count - 1 do
    Encuesta.Frame[i].GuardarRespuesta(AIdInstanciaEncuesta, AModoAbm);
end;

end.
