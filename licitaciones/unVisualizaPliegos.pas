unit unVisualizaPliegos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  ImgList, ComCtrls, ToolWin;

type
	TImagenActual = record
  	HeightOriginal: Integer;
    Porcentaje: Integer;
    WidthOriginal: Integer;
  end;

type
  TfrmVisualizaPliegos = class(TForm)
    tbTop: TToolBar;
    tbtnAchicar: TToolButton;
    tbtnAgrandar: TToolButton;
    tbtnSeparador1: TToolButton;
    tbtnAnterior: TToolButton;
    tbtnSiguiente: TToolButton;
    imgListVisualiza: TImageList;
    tbtnSeparador2: TToolButton;
    tbtnSalir: TToolButton;
    sbMain: TScrollBox;
    imgMain: TImage;
    tbtn100: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnAnteriorClick(Sender: TObject);
    procedure tbtnSiguienteClick(Sender: TObject);
    procedure tbtnSalirClick(Sender: TObject);
    procedure tbtnAgrandarClick(Sender: TObject);
    procedure tbtnAchicarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbtn100Click(Sender: TObject);
  private
  	FImagenActual: TImagenActual;
  	FImagenes: TStringList;
    FIndex: Integer;
  	FRutaPliegos: String;

    function IsValidImageFile(const aFile: String): Boolean;

    procedure CentrarImagen;
    procedure LoadImagenes;
    procedure MostrarImagen;
  public
		procedure Mostrar(const aRuta: String);
  end;

var
  frmVisualizaPliegos: TfrmVisualizaPliegos;

implementation

uses
	CustomDlgs;

{$R *.dfm}

function TfrmVisualizaPliegos.IsValidImageFile(const aFile: String): Boolean;
var
	sExt: String;
begin
// Valida que el archivo pasado como parámetro sea de un tipo imagen..

	sExt := LowerCase(ExtractFileExt(aFile));
  Result :=
  	(sExt = '.ani')  or
    (sExt = '.bmp')  or
    (sExt = '.emf')  or
    (sExt = '.gif')  or
    (sExt = '.ico')  or
    (sExt = '.jpg')  or
    (sExt = '.jpeg') or
    (sExt = '.pcx')  or
    (sExt = '.wmf');
end;


procedure TfrmVisualizaPliegos.CentrarImagen;
begin
// Centra la imagen respecto a su owner..

	imgMain.Left := Round(sbMain.Width / 2) - Round(imgMain.Width / 2);
  imgMain.Top := Round(sbMain.Height / 2) - Round(imgMain.Height / 2);
end;

procedure TfrmVisualizaPliegos.LoadImagenes;
var
	aArchivos: TSearchRec;
begin
	// Carga las imagenes de la carpeta en memoria..

	FImagenes.Clear;

  if FindFirst(FRutaPliegos + '*.*', faArchive, aArchivos) = 0 then
  begin
    repeat
    	if IsValidImageFile(FRutaPliegos + aArchivos.Name) then
      	FImagenes.Add(aArchivos.Name);
    until FindNext(aArchivos) <> 0;
    FindClose(aArchivos);
  end;

  if FImagenes.Count > 0 then
  	FIndex := 0
  else
  	FIndex := -1;
end;

procedure TfrmVisualizaPliegos.Mostrar(const aRuta: String);
begin
// Muestra el formulario..

	if not DirectoryExists(aRuta) then
  begin
		MsgBox('La ruta es inexistente!');
    Exit;
  end;

	if aRuta[Length(aRuta)] = '\' then
		FRutaPliegos := aRuta
  else
  	FRutaPliegos := aRuta + '\';

  LoadImagenes;
  MostrarImagen;

	ShowModal;
end;

procedure TfrmVisualizaPliegos.MostrarImagen;
begin
// Muestra la imagen actual..

	if FIndex = -1 then
  	Exit;

  imgMain.AutoSize := True;
	imgMain.Picture.LoadFromFile(Format('%s%s', [FRutaPliegos, FImagenes[FIndex]]));
  imgMain.AutoSize := False;

	FImagenActual.HeightOriginal := imgMain.Height;
	FImagenActual.WidthOriginal := imgMain.Width;

	imgMain.Height := Round((FImagenActual.Porcentaje * FImagenActual.HeightOriginal) / 100);
	imgMain.Width := Round((FImagenActual.Porcentaje * FImagenActual.WidthOriginal) / 100);

  CentrarImagen;

  Caption := 'Visualiza Pliegos - ' + FImagenes[FIndex];
end;

procedure TfrmVisualizaPliegos.FormCreate(Sender: TObject);
begin
	FImagenes := TStringList.Create;
  FImagenActual.Porcentaje := 100;
end;

procedure TfrmVisualizaPliegos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	FImagenes.Free;
end;

procedure TfrmVisualizaPliegos.tbtnAnteriorClick(Sender: TObject);
begin
	Dec(FIndex);

	if FIndex < 0 then
  	FIndex := FImagenes.Count - 1;

	MostrarImagen;    
end;

procedure TfrmVisualizaPliegos.tbtnSiguienteClick(Sender: TObject);
begin
	Inc(FIndex);

	if FIndex >= FImagenes.Count then
  	FIndex := 0;
    
	MostrarImagen;
end;

procedure TfrmVisualizaPliegos.tbtnSalirClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmVisualizaPliegos.tbtnAgrandarClick(Sender: TObject);
begin
	if FImagenActual.Porcentaje >= 1600 then
  	Exit;

	if FImagenActual.Porcentaje < 100 then
  	FImagenActual.Porcentaje := FImagenActual.Porcentaje + 10
  else if FImagenActual.Porcentaje < 300 then
		FImagenActual.Porcentaje := FImagenActual.Porcentaje + 50
  else
  	FImagenActual.Porcentaje := FImagenActual.Porcentaje + 100;

	imgMain.Height := Round((FImagenActual.Porcentaje * FImagenActual.HeightOriginal) / 100);
	imgMain.Width := Round((FImagenActual.Porcentaje * FImagenActual.WidthOriginal) / 100);

  CentrarImagen;
end;

procedure TfrmVisualizaPliegos.tbtnAchicarClick(Sender: TObject);
begin
	if FImagenActual.Porcentaje <= 10 then
  	Exit;

	if FImagenActual.Porcentaje <= 100 then
  	FImagenActual.Porcentaje := FImagenActual.Porcentaje - 10
  else if FImagenActual.Porcentaje <= 300 then
		FImagenActual.Porcentaje := FImagenActual.Porcentaje - 50
  else
  	FImagenActual.Porcentaje := FImagenActual.Porcentaje - 100;

	imgMain.Height := Round((FImagenActual.Porcentaje * FImagenActual.HeightOriginal) / 100);
	imgMain.Width := Round((FImagenActual.Porcentaje * FImagenActual.WidthOriginal) / 100);

  CentrarImagen;
end;

procedure TfrmVisualizaPliegos.FormResize(Sender: TObject);
begin
	CentrarImagen;
end;

procedure TfrmVisualizaPliegos.tbtn100Click(Sender: TObject);
begin
	FImagenActual.Porcentaje := 100;

	imgMain.Height := Round((FImagenActual.Porcentaje * FImagenActual.HeightOriginal) / 100);
	imgMain.Width := Round((FImagenActual.Porcentaje * FImagenActual.WidthOriginal) / 100);

  CentrarImagen;
end;

end.
