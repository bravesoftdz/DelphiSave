unit unArchivosAsociados;

interface

uses
  {$IFNDEF VER150}
  RxPlacemnt, RxCurrEdit, RxToolEdit,
  {$ELSE}
  Placemnt, CurrEdit, ToolEdit,
  {$ENDIF}
  SysUtils, Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ExtCtrls, FormPanel, ComCtrls,
  DB, SDEngine, ToolWin, unDmLegales, ImgList, DBClient,
  ShortCutControl;

type
  TfrmArchivosAsociados = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbEliminar: TToolButton;
    ToolButton4: TToolButton;
    tbSalir: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    StatusBar1: TStatusBar;
    fpAsociarArchivos: TFormPanel;
    Bevel3: TBevel;
    Label33: TLabel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    edtArchivoAsociado: TEdit;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    od: TOpenDialog;
    edtDescripcionArchivo: TEdit;
    Label1: TLabel;
    lvListaArchivos: TListView;
    tbDownload: TToolButton;
    sdArchivo: TSaveDialog;
    ilImagenesIconosArchivos: TImageList;
    ShortCutControl: TShortCutControl;
    FormStorage: TFormStorage;
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure tbDownloadClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure lvListaArchivosDblClick(Sender: TObject);
  private
    FModo : TModoEjecucion;
    FIdEventoArchivoAsociado : integer;
    FId : integer;
    FArchivosAsociados: TClientDataSet;
    FSecuencia : string;
    FIDTipoArch : Integer;
    FDirectorio: string;
    procedure LimpiarCamposAsociarAchivo;
    procedure GuardarArchivoAsociado;
    function ExtraerIcono(AFile: string): TIcon;
    procedure ReleerArchivosAsociados;
    procedure CopiarLocalMente;
    procedure CargarArchivosDirectos(AId : integer; AIdEvento : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociados(AIdJucioEnTramite, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosCYQ(NroOrden, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosMediacion(AIdMediacion, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosAbogado(AIdAbogado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosSumarios(AIdSumario, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosRecuperos(AIdRecupero, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosGD(NroOrden, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchAsociadosPericias(AIDJuicioEnTramite, AIdPericiaArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
  public
    procedure CargarArchivosAsociados(AIdJucioEnTramite : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociados(AIdJucioEnTramite, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosMediacion(AIdMediacion, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosMediacion(AIdMediacion, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosCYQ(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosCYQ(NroOrden, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosAbogado(AIdAbogado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosAbogado(AIdAbogado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosSumarios(AIdSumario : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosSumarios(AIdSumario, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosRecuperos(AIdRecupero : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosRecuperos(AIdRecupero, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosGD(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosGD(NroOrden, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarArchivosAsociadosPericias(AIDJuicioEnTramite, AIdPericiaArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
    procedure CargarDirectoArchivosAsociadosPericias(AIDJuicioEnTramite, AIdPericiaArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
  end;

var
  frmArchivosAsociados: TfrmArchivosAsociados;

Const
  TIPO_JUICIO    = 1;
  TIPO_CYQ       = 2;
  TIPO_MEDIACION = 3;
  TIPO_ABOGADO   = 4;
  TIPO_SUMARIO   = 5;
  TIPO_RECUPERO  = 5;
  TIPO_GD        = 6;
  TIPO_PERICIA   = 7;



implementation



uses
  unDmPrincipal, CustomDlgs, AnsiSql, ShellApi, unSesion, unDirUtils,
  unConstLegales;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosDirectos(AId : integer; AIdEvento : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    if FIDTipoArch = TIPO_JUICIO then
      CargarArchAsociados(AId,AIdEvento,AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_CYQ then
      CargarArchAsociadosCYQ(AId,AIdEvento,AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_MEDIACION then
      CargarArchAsociadosMediacion(AId,AIdEvento,AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_ABOGADO then
      CargarArchAsociadosAbogado(AId, AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_SUMARIO then
      CargarArchAsociadosSumarios(AId, AIdEvento, AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_RECUPERO then
      CargarArchAsociadosRecuperos(AId, AIdEvento, AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_GD then
      CargarArchAsociadosGD(AId, AIdEvento, AArchivosAsociados)
    else
    if FIDTipoArch = TIPO_PERICIA then
      CargarArchAsociadosPericias(AId, AIdEvento, AArchivosAsociados)  ;

    Visible := False;
    LimpiarCamposAsociarAchivo;
    FModo := meAlta;
    tbSeleccionArchivosAsociarClick(nil);
    if edtArchivoAsociado.Text <> '' then
    begin
      edtDescripcionArchivo.Text := ExtractFileName(edtArchivoAsociado.Text);
      btnAccAceptar.Click;
    end
    else
      btnAccCancelar.Click;

  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociados(AIdJucioEnTramite : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociados(AIdJucioEnTramite,AIdEventoArchivoAsociado,AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociados(AIdJucioEnTramite : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_JUICIO;
  CargarArchivosDirectos(AIdJucioEnTramite,AIdEventoArchivoAsociado,AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociados(AIdJucioEnTramite : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := AIdJucioEnTramite;
  FArchivosAsociados := AArchivosAsociados;
  FDirectorio := GetParam(DIRECTORIOARCHIVOSJUICIOS);
  FSecuencia := 'LEGALES.SEQ_LEA_ID';
  sdqConsulta.SQL.Text := 'SELECT ea_descripcion descripcion, ea_patharchivo path FROM legales.lea_eventoarchivoasociado' +
                          ' WHERE ea_ideventojuicioentramite = :Id  and ea_fechabaja is null';
  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociadosCYQ(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosCYQ(NroOrden,AIdEventoArchivoAsociado,AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosCYQ(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := NroOrden;
  FArchivosAsociados := AArchivosAsociados;

  FDirectorio := GetParam(DIRECTORIOARCHIVOEVENTOSCYQ);
  FSecuencia := 'ART.SEQ_LEC_ID';
  sdqConsulta.SQL.Text :=
    ' SELECT ec_descripcion descripcion, ec_patharchivo PATH FROM art.lec_eventoarchivocyq ' +
    '  WHERE ec_ideventocyq = :ID AND ec_fechabaja IS NULL';

  ReleerArchivosAsociados;
end;



{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosCYQ(NroOrden, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_CYQ;
  CargarArchivosDirectos(NroOrden, AIdEventoArchivoAsociado, AArchivosAsociados);
end;


{----------------------------------------------------------------------------------------------------------}


procedure TfrmArchivosAsociados.CargarArchivosAsociadosMediacion(AIdMediacion : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosMediacion(AIdMediacion, AIdEventoArchivoAsociado, AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;
{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosMediacion(AIdMediacion : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_MEDIACION;
  CargarArchivosDirectos(AIdMediacion,AIdEventoArchivoAsociado,AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosMediacion(AIdMediacion : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := AIdMediacion;
  FArchivosAsociados := AArchivosAsociados;

  FDirectorio := GetParam(DIRECTORIOARCHIVOSMEDIACION);

  FSecuencia := 'LEGALES.seq_lae_mediacion_id';
  sdqConsulta.SQL.Text := 'SELECT ea_descripcion descripcion, ea_patharchivo path FROM legales.LAE_ARCHIVOEVENTOMEDIACION' +
                            ' WHERE AE_IDEVENTOMEDIACION = :Id  and ea_fechabaja is null';

  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}


procedure TfrmArchivosAsociados.CargarArchivosAsociadosAbogado(AIdAbogado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosAbogado(AIdAbogado, AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosAbogado(AIdAbogado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_ABOGADO;
  CargarDirectoArchivosAsociados(AIdAbogado,0, AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosAbogado(AIdAbogado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FId := AIdAbogado;
  FArchivosAsociados := AArchivosAsociados;

  FDirectorio := GetParam(DIRECTORIOARCHIVOSABOGADO);

  FSecuencia := 'LEGALES.SEQ_LAA_ABOGADO_ID';
  sdqConsulta.SQL.Text := 'SELECT aa_descripcion descripcion, aa_patharchivo path FROM legales.laa_archivoabogado' +
                          ' WHERE aa_idabogado = :Id  and aa_fechabaja is null';

  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociadosSumarios(AIdSumario, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosSumarios(AIdSumario,AIdEventoArchivoAsociado, AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosSumarios(AIdSumario, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_SUMARIO;
  CargarDirectoArchivosAsociados(AIdSumario,AIdEventoArchivoAsociado, AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosSumarios(AIdSumario, AIdEventoArchivoAsociado: integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := AIdSumario;
  FArchivosAsociados := AArchivosAsociados;
  FSecuencia := 'LEGALES.SEQ_LEA_ID';
  sdqConsulta.SQL.Text := 'SELECT ae_descripcion descripcion, ae_patharchivo path FROM legales.LAE_ARCHIVOEVENTOSUMARIO' +
                          ' WHERE AE_IDEVENTOSUMARIO = :Id  and ea_fechabaja is null';
  FDirectorio := GetParam(DIRECTORIOARCHIVOSSUMARIOS);
  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociadosRecuperos(AIdRecupero : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosRecuperos(AIdRecupero,AIdEventoArchivoAsociado,AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosRecuperos(AIdRecupero : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_RECUPERO;
  CargarDirectoArchivosAsociados(AIdRecupero,AIdEventoArchivoAsociado, AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosRecuperos(AIdRecupero : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := AIdRecupero;
  FArchivosAsociados := AArchivosAsociados;
  FDirectorio := GetParam(DIRECTORIOARCHIVOSRECUPEROS);
  FSecuencia := 'LEGALES.SEQ_LER_ID';
  sdqConsulta.SQL.Text := 'SELECT er_descripcion descripcion, er_patharchivo path FROM legales.ler_eventoarchivorecupero' +
                          ' WHERE er_ideventorecupero = :Id  and er_fechabaja is null';
  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociadosGD(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosGD(NroOrden,AIdEventoArchivoAsociado,AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosGD(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_GD;
  CargarDirectoArchivosAsociados(NroOrden,AIdEventoArchivoAsociado,AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosGD(NroOrden : integer; AIdEventoArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdEventoArchivoAsociado;
  FId := NroOrden;
  FArchivosAsociados := AArchivosAsociados;
  FDirectorio := GetParam(DIRECTORIOARCHIVOSGD);
  FSecuencia := 'LEGALES.SEQ_LEG_ID';
  sdqConsulta.SQL.Text :=
    ' SELECT eg_descripcion descripcion, eg_patharchivo PATH FROM legales.leg_eventoarchivogd ' +
    '  WHERE eg_ideventogd = :ID AND eg_fechabaja IS NULL';

  ReleerArchivosAsociados;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarArchivosAsociadosPericias(AIDJuicioEnTramite : integer; AIdPericiaArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  try
    CargarArchAsociadosPericias(AIDJuicioEnTramite,AIdPericiaArchivoAsociado,AArchivosAsociados);
    self.ShowModal;
  finally
   sdqConsulta.Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CargarDirectoArchivosAsociadosPericias(AIDJuicioEnTramite : integer; AIdPericiaArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  FIDTipoArch := TIPO_PERICIA;
  CargarArchivosDirectos(AIDJuicioEnTramite,AIdPericiaArchivoAsociado,AArchivosAsociados);
end;

{----------------------------------------------------------------------------------------------------------}

procedure TfrmArchivosAsociados.CargarArchAsociadosPericias(AIDJuicioEnTramite : integer; AIdPericiaArchivoAsociado : integer; AArchivosAsociados: TClientDataSet);
begin
  ilImagenesIconosArchivos.Clear;
  FIdEventoArchivoAsociado := AIdPericiaArchivoAsociado;
  FId := AIDJuicioEnTramite;
  FArchivosAsociados := AArchivosAsociados;
  FDirectorio := GetParam(DIRECTORIOARCHIVOSPERICIA);
  FSecuencia := 'LEGALES.SEQ_LAP_ID';
  sdqConsulta.SQL.Text := 'SELECT PA_DESCRIPCION descripcion, PA_PATHARCHIVO path FROM legales.LPA_PERICIAARCHIVOASOCIADO' +
                          ' WHERE PA_IDPERICIAS = :Id  and PA_FECHABAJA is null';
  ReleerArchivosAsociados;
end;



{----------------------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.tbSeleccionArchivosAsociarClick(Sender: TObject);
begin
  if od.Execute then edtArchivoAsociado.Text := od.FileName;
end;

procedure TfrmArchivosAsociados.tbNuevoClick(Sender: TObject);
begin
  LimpiarCamposAsociarAchivo;
  FModo := meAlta;
  fpAsociarArchivos.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.tbEliminarClick(Sender: TObject);
begin
  if Assigned(lvListaArchivos.Selected) and
     (Msgbox ('¿Está seguro que desea eliminar el archivo ' + lvListaArchivos.Selected.Caption + '?',MB_ICONINFORMATION + MB_YESNO, 'Borrar Archivo') = IDYES)
then
  begin
    if FArchivosAsociados.Locate('PATHARCHIVO',
       lvListaArchivos.Selected.SubItems[2], [loPartialKey]) then
    begin
       FArchivosAsociados.Edit;
       FArchivosAsociados.FieldByName('STATE').AsString := 'D';
       ReleerArchivosAsociados;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.tbDownloadClick(Sender: TObject);
begin
  CopiarLocalMente;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.CopiarLocalMente;
var
  ArchivoOrigen, ArchivoDestino : string;
begin
  if Assigned(lvListaArchivos.Selected) then
  begin
   sdArchivo.FileName := ExtractFileName(lvListaArchivos.Selected.SubItems.Strings[2]);

   if sdArchivo.Execute then
      ArchivoOrigen :=  lvListaArchivos.Selected.SubItems.Strings[2];
      ArchivoDestino := sdArchivo.FileName;
      if Not FileExists(PAnsiChar(ArchivoDestino)) then
      begin
        if not CopyFile(PChar(ArchivoOrigen), PChar(ArchivoDestino), true) then
         raise Exception.Create('Error al copia de ' + ArchivoOrigen + ' a ' + ArchivoDestino)
      end
      else raise Exception.Create('El archivo de destino '  + ArchivoDestino + ' existe.');
  end;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.LimpiarCamposAsociarAchivo;
begin
  edtArchivoAsociado.Text := '';
  edtDescripcionArchivo.Text := '';
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.btnAccAceptarClick(Sender: TObject);
begin
  GuardarArchivoAsociado;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.GuardarArchivoAsociado;
var
  ArchivoOrigen, ArchivoDestino : string;
  DirectorioDestino : string;
  NombreArchivoDestino: string;
begin
  VerificarMultiple(['Asociando Archivo',
                      edtArchivoAsociado,
                      trim(edtArchivoAsociado.Text) <> '',
                      'Debe especificar una descripción para el archivo',
                      edtDescripcionArchivo,
                      edtDescripcionArchivo.Text <> '',
                      'Debe especificar archivo para asociar']);
  Verificar(ExtractFileExt(edtArchivoAsociado.Text) = '', edtArchivoAsociado,'Debe tener una extensión el archivo.');
  if DirectoryExists(FDirectorio) then
  begin
    DirectorioDestino := IncludeTrailingBackslash(FDirectorio) +  IncludeTrailingBackslash(IntToStr(FId));
    CreateDirectoryIfNotExist(DirectorioDestino);

    ArchivoOrigen := edtArchivoAsociado.Text;
    NombreArchivoDestino := IntToStr(GetSecNextVal(FSecuencia));
    ArchivoDestino := DirectorioDestino + NombreArchivoDestino + ExtractFileExt(ArchivoOrigen);

    if Not FileExists(PAnsiChar(ArchivoDestino)) then
      if not CopyFile(PChar(ArchivoOrigen), PChar(ArchivoDestino), true) then
        raise Exception.Create('El archivo ' + ArchivoOrigen +  'no pudo ser copiado al directorio ' + FDirectorio +
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
  else raise Exception.Create('El directorio indicado en el parámetro no existe. (' + FDirectorio + ')');

  ReleerArchivosAsociados;
  fpAsociarArchivos.close;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.ReleerArchivosAsociados;
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
      begin        Fecha := FileDateToDateTime(sr.Time);        Tamano := sr.Size;
        item.SubItems.Add(IntToStr(Tamano));
        item.SubItems.Add(DateToStr(Fecha));
      end;
      item.SubItems.Add(FArchivosAsociados.FieldByName('patharchivo').AsString);
    end;
    FArchivosAsociados.Next;
  end;
end;
{----------------------------------------------------------------------------------------------------------}
function TfrmArchivosAsociados.ExtraerIcono(AFile : string) : TIcon;
var
 Icono: TIcon;
 Filtro: Word;
begin
  Filtro:=0;
  Icono:=TIcon.Create;
  Icono.Handle:=ExtractAssociatedIcon(hInstance, PChar(AFile), Filtro);
  result := Icono;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.tbSalirClick(Sender: TObject);
begin
  close;
end;
{----------------------------------------------------------------------------------------------------------}
procedure TfrmArchivosAsociados.lvListaArchivosDblClick(Sender: TObject);
begin
  if Assigned(lvListaArchivos.Selected) then
   ShellExecute(Handle, 'open',PChar(lvListaArchivos.Selected.SubItems[2]) ,nil,nil,SW_SHOWNORMAL);
end;
{----------------------------------------------------------------------------------------------------------}
end.
