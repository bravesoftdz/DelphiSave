unit unArchivosAsociadosOficios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  ToolWin, DBClient, unDmLegales, ShellApi, OleCtrls, unConstLegales,
  AnsiSql, unDirUtils, unDmPrincipal, CustomDlgs;

type
  TfrmArchivosAsociadosOficios = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbEliminar: TToolButton;
    tbDownload: TToolButton;
    ToolButton4: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    ToolButton6: TToolButton;
    tbImprimir: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    lvListaArchivos: TListView;
    fpAsociarArchivos: TFormPanel;
    Bevel3: TBevel;
    Label33: TLabel;
    Label1: TLabel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    edtArchivoAsociado: TEdit;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    edtDescripcionArchivo: TEdit;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    ilImagenesIconosArchivos: TImageList;
    sdArchivo: TSaveDialog;
    od: TOpenDialog;
    StatusBar1: TStatusBar;
    procedure tbSalirClick(Sender: TObject);
    procedure lvListaArchivosDblClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
  private
    FModo : TModoEjecucion;
    FId : integer;
    FIdOficio : integer;
    FArchivosAsociados: TClientDataSet;
    FSecuencia : string;
    NombreArchivoDestino: string;
    procedure ReleerArchivosAsociados;
    function ExtraerIcono(AFile: string): TIcon;
    procedure LimpiarCamposAsociarAchivo;
    procedure GuardarArchivoAsociado;
  public
    procedure CargarArchivosAsociados(AIdOficio : integer; AArchivosAsociados: TClientDataSet);
  end;

var
  frmArchivosAsociadosOficios: TfrmArchivosAsociadosOficios;

implementation

{$R *.dfm}

{ TfrmArchivosAsociadosOficios }

procedure TfrmArchivosAsociadosOficios.CargarArchivosAsociados(
  AIdOficio: integer; AArchivosAsociados: TClientDataSet);
begin
  try
    ilImagenesIconosArchivos.Clear;
    FIdOficio := AIdOficio;
    FId := FIdOficio;
    FArchivosAsociados := AArchivosAsociados;
    FSecuencia := 'LEGALES.SEQ_LAO_ID';
    sdqConsulta.SQL.Text := 'SELECT ao_descripcion descripcion, ao_patharchivo path FROM legales.LAO_ARCHIVOOFICIO' +
                            ' WHERE AO_IDOFICIO = :Id  and ao_fechabaja is null';

    ReleerArchivosAsociados;
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

function TfrmArchivosAsociadosOficios.ExtraerIcono(AFile: string): TIcon;
var
 Icono: TIcon;
 Filtro: Word;
begin
  Filtro:=0;
  Icono:=TIcon.Create;
  Icono.Handle:=ExtractAssociatedIcon(hInstance, PChar(AFile), Filtro);
  result := Icono;
end;

procedure TfrmArchivosAsociadosOficios.ReleerArchivosAsociados;
var
 item : TListItem;
 sr : TSearchRec;
 FileAttrs : word;
 Tamano : integer;
 Fecha : TDateTime;
begin
  FileAttrs := 0;

  if not FArchivosAsociados.Active then FArchivosAsociados.Open; 
  FArchivosAsociados.First;

  lvListaArchivos.Clear;
  while not FArchivosAsociados.Eof do
  begin
    if FArchivosAsociados.FieldByName('STATE').AsString <> 'D' then
    begin
      item := lvListaArchivos.Items.Add;
      item.Caption     := FArchivosAsociados.FieldByName('descripcion').AsString;
      item.ImageIndex := ilImagenesIconosArchivos.AddIcon(
         ExtraerIcono(FArchivosAsociados.FieldByName('patharchivo').AsString));

      if FindFirst(FArchivosAsociados.FieldByName('patharchivo').AsString, FileAttrs, sr) = 0 then
      begin
        Fecha := FileDateToDateTime(sr.Time);
        Tamano := sr.Size;
        item.SubItems.Add(IntToStr(Tamano));
        item.SubItems.Add(DateToStr(Fecha));
      end;
      item.SubItems.Add(FArchivosAsociados.FieldByName('patharchivo').AsString);
    end;
    FArchivosAsociados.Next;
  end;
end;

procedure TfrmArchivosAsociadosOficios.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmArchivosAsociadosOficios.lvListaArchivosDblClick(
  Sender: TObject);
begin
  if Assigned(lvListaArchivos.Selected) then
   ShellExecute(Handle, 'open',PChar(lvListaArchivos.Selected.SubItems[2]) ,nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmArchivosAsociadosOficios.tbEliminarClick(Sender: TObject);
begin
  if Assigned(lvListaArchivos.Selected) and
     (Msgbox ('¿Está seguro que desea eliminar el archivo ' + lvListaArchivos.Selected.Caption + '?',MB_ICONINFORMATION + MB_YESNO, 'Borrar Archivo') = IDYES)
then
    if FArchivosAsociados.Locate('PATHARCHIVO', lvListaArchivos.Selected.SubItems[2], [loPartialKey]) then
    begin
       FArchivosAsociados.Edit;
       FArchivosAsociados.FieldByName('STATE').AsString := 'D';
       ReleerArchivosAsociados;
    end;
end;

procedure TfrmArchivosAsociadosOficios.tbNuevoClick(Sender: TObject);
begin
  LimpiarCamposAsociarAchivo;
  FModo := meAlta;
  tbSeleccionArchivosAsociar.Enabled := true;
  fpAsociarArchivos.ShowModal;
end;

procedure TfrmArchivosAsociadosOficios.LimpiarCamposAsociarAchivo;
begin
  edtArchivoAsociado.Text := '';
  edtDescripcionArchivo.Text := '';
end;

procedure TfrmArchivosAsociadosOficios.tbSeleccionArchivosAsociarClick(
  Sender: TObject);
begin
  if od.Execute then edtArchivoAsociado.Text := od.FileName;
end;

procedure TfrmArchivosAsociadosOficios.btnAccAceptarClick(Sender: TObject);
begin
  GuardarArchivoAsociado;
end;

procedure TfrmArchivosAsociadosOficios.GuardarArchivoAsociado;
var
  ArchivoOrigen, ArchivoDestino, Directorio : string;
  DirectorioDestino : string;
begin
  VerificarMultiple(['Asociando Archivo',
                      edtArchivoAsociado,
                      trim(edtArchivoAsociado.Text) <> '',
                      'Debe especificar una descripción para el archivo',
                      edtDescripcionArchivo,
                      edtDescripcionArchivo.Text <> '',
                      'Debe especificar archivo para asociar']);

  Directorio := GetParam(DIRECTORIOARCHIVOSOFICIOS);
  if DirectoryExists(Directorio) then
  begin
    DirectorioDestino := IncludeTrailingBackslash(Directorio) +  IncludeTrailingBackslash(IntToStr(FId));
    CreateDirectoryIfNotExist(DirectorioDestino);
    ArchivoOrigen := edtArchivoAsociado.Text;
    NombreArchivoDestino := IntToStr(GetSecNextVal(FSecuencia));
    ArchivoDestino := DirectorioDestino + NombreArchivoDestino + ExtractFileExt(ArchivoOrigen);
    if Not FileExists(PAnsiChar(ArchivoDestino)) then
      if not CopyFile(PChar(ArchivoOrigen), PChar(ArchivoDestino), true) then
        raise Exception.Create('El archivo ' + ArchivoOrigen +  'no pudo ser copiado al directorio ' + Directorio +
          ' indicado en el parámetro ')
      else begin
        FArchivosAsociados.Append;
        FArchivosAsociados.FieldByName('ID').Value := NombreArchivoDestino;
        FArchivosAsociados.FieldByName('DESCRIPCION').Value := edtDescripcionArchivo.Text;
        FArchivosAsociados.FieldByName('PATHARCHIVO').Value := ArchivoDestino;
        FArchivosAsociados.FieldByName('STATE').Value := 'I';
        FArchivosAsociados.Post;
      end
    else raise Exception.Create('Un archivo con el mismo nombre ya existe en el directorio.');
  end
  else raise Exception.Create('El directorio indicado en el parámetro no existe. (' + Directorio + ')');

  ReleerArchivosAsociados;
  fpAsociarArchivos.close;
end;

end.
