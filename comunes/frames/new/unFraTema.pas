unit unFraTema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unArtFrame, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Data.DB,
  SDEngine, unCustomGridABM, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Vcl.Menus, Vcl.ImgList, JvExMask, JvToolEdit, AdvToolBar, Vcl.Mask,
  RxToolEdit, DateComboBox, AdvGlowButton, FormPanel, AdvOfficeButtons, JvExControls, JvXPCore, JvXPCheckCtrls;

type
  TfraTema = class(TArtFrame)
    pnlTema: TPanel;
    pnlCategoria: TJvPanel;
    chkTema: TJvXPCheckbox;
    sdqAltaTema: TSDQuery;
    sdqModificarTema: TSDQuery;
    sdqCargarTema: TSDQuery;
    pmListaRespuestas: TPopupMenu;
    sdqListaRespuestas: TSDQuery;
    Prueba1: TMenuItem;
    sdqConsultaDinamica: TSDQuery;
    ilIconosOscuros: TImageList;
    iliconosClaros: TImageList;
    pmAdjunto: TPopupMenu;
    miVerAdjunto: TMenuItem;
    miRemoverAdjunto: TMenuItem;
    miCambiarAdjunto: TMenuItem;
    ilAdjunto: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    tbAdjunto: TAdvGlowButton;
    tbObservaciones: TAdvGlowButton;
    tbRespuesta: TAdvGlowButton;
    tbAyuda: TAdvGlowButton;
    procedure tbAyudaClick(Sender: TObject);
    procedure tbObservacionesClick(Sender: TObject);
    procedure chkTemaClick(Sender: TObject);
    procedure pmListaRespuestasPopup(Sender: TObject);
    procedure tbAdjuntoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbAdjuntoClick(Sender: TObject);
    procedure miVerAdjuntoClick(Sender: TObject);
    procedure miRemoverAdjuntoClick(Sender: TObject);
    procedure miCambiarAdjuntoClick(Sender: TObject);
    procedure pmAdjuntoPopup(Sender: TObject);
  private
    FSQLAltaRespuesta: String;
    FSQLModificarRespuesta: String;
    FIdVisita: Integer;
    FIndice: Integer;
    FMostrarCategoria: Boolean;
    FIdVisitaInstanciaDetalle: Integer;
    FIdTema: Integer;
    FAyuda: String;
    FObservaciones: String;
    FRequiereObservaciones: Boolean;
    FIdRespuesta: Integer;
    FTipoRespuesta: String;
    FRespuestaSQL: String;
    FIdRespuestaDinamica: Integer;
    FRespuestaDinamica: String;
    FRequiereAdjunto: Boolean;
    FNombreAdjunto: String;
    FAdjunto: String;
    function GetTemaDescripcion: String;
    procedure SetTemaDescripcion(const Value: String);
    function GetBreadCrumb: String;
    procedure SetBreadCrumb(const Value: String);
    procedure SetMostrarCategoria(const Value: Boolean);
    function GetMostrarIconoObservaciones: Boolean;
    procedure SetMostrarIconoObservaciones(const Value: Boolean);
    function GetMostrarIconoAdjunto: Boolean;
    procedure SetMostrarIconoAdjunto(const Value: Boolean);
    function GetMostrarIconoRespuestas: Boolean;
    procedure SetMostrarIconoRespuestas(const Value: Boolean);
    function GetMostrarIconoAyuda: Boolean;
    procedure SetMostrarIconoAyuda(const Value: Boolean);
    procedure SeleccionarItemRespuesta(Sender: TObject);
    function ValidaObservaciones: Boolean;
    function ValidaAdjunto: Boolean;
    function HayDatosCargados: Boolean;
    function GetObservaciones: String;
    procedure SetObservaciones(const Value: String);
    function GetNombreAdjunto: String;
    procedure SetNombreAdjunto(const Value: String);
    procedure AbrirDialogoArchivoAdjunto;
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure GuardarTema(AIdVisitaInstancia: Integer; AModoABM: TModoABM);
    procedure CargarTema(AIdVisitaInstancia: Integer; AIdTema: Integer);
    procedure ChangeRespuesta;
    procedure BloquearTema(ALocked: Boolean);
    function ValidarTema: Boolean;

    property IdVisita                 : Integer read FIdVisita                    write FIdVisita;
    property IdTema                   : Integer read FIdTema                      write FIdTema;
    property Indice                   : Integer read FIndice                      write FIndice;
    property TemaDescripcion          : String  read GetTemaDescripcion           write SetTemaDescripcion;
    property BreadCrumb               : String  read GetBreadCrumb                write SetBreadCrumb;
    property MostrarCategoria         : Boolean read FMostrarCategoria            write SetMostrarCategoria;
    property MostrarIconoAyuda        : Boolean read GetMostrarIconoAyuda         write SetMostrarIconoAyuda;
    property MostrarIconoObservaciones: Boolean read GetMostrarIconoObservaciones write SetMostrarIconoObservaciones;
    property MostrarIconoAdjunto      : Boolean read GetMostrarIconoAdjunto       write SetMostrarIconoAdjunto;
    property MostrarIconoRespuestas   : Boolean read GetMostrarIconoRespuestas    write SetMostrarIconoRespuestas;
    property Ayuda                    : String  read FAyuda                       write FAyuda;
    property Observaciones            : String  read GetObservaciones             write SetObservaciones;
    property RequiereAdjunto          : Boolean read FRequiereAdjunto             write FRequiereAdjunto;
    property RequiereObservaciones    : Boolean read FRequiereObservaciones       write FRequiereObservaciones;
    property TipoRespuesta            : String  read FTipoRespuesta               write FTipoRespuesta;
    property RespuestaSQL             : String  read FRespuestaSQL                write FRespuestaSQL;
    property NombreAdjunto            : String  read GetNombreAdjunto             write SetNombreAdjunto;
    property Adjunto                  : String  read FAdjunto                     write FAdjunto;
  end;

var
  fraTema: TfraTema;

implementation

uses
  unDMPrincipal, VCLExtra, General, unAyuda, StrFuncs, CustomDlgs,unSesion, ArchFuncs, unArchivoVisor,
  AnsiSql, unTexto;

{$R *.dfm}

{ TfraTema }

procedure TfraTema.BloquearTema(ALocked: Boolean);
begin

end;

procedure TfraTema.CargarTema(AIdVisitaInstancia, AIdTema: Integer);
begin
  OpenQueryEx(sdqCargarTema, [AIdVisitaInstancia, AIdTema]);
  with sdqCargarTema do
    if not IsEmpty then
    begin
      FIdVisitaInstanciaDetalle := FieldByName('VD_ID').AsInteger;
      Observaciones             := FieldByName('VD_OBSERVACIONES').AsString;
      chkTema.Checked           := FieldByName('VD_SELECCIONADO').AsString = 'S';
      NombreAdjunto             := FieldByName('VD_NOMBREADJUNTO').AsString;
      Adjunto                   := FieldByName('VD_ADJUNTO').AsString;
      if TipoRespuesta = 'R' then
      begin
        FIdRespuesta     := FieldByName('VD_IDRESPUESTA').AsInteger;
        tbRespuesta.Hint := FieldByName('RESPUESTA').AsString;
      end
      else
      begin
        FIdRespuestaDinamica := FieldByName('VD_IDRESPUESTADINAMICA').AsInteger;
        FRespuestaDinamica   := FieldByName('VD_RESPUESTADINAMICA').AsString;
        tbRespuesta.Hint     := FRespuestaDinamica;
      end;
      tbAdjunto.Hint := iif(NombreAdjunto <> '', ExtractFileName(NombreAdjunto), iif(Locked, '', tbAdjunto.Hint));
      ChangeRespuesta;
    end
    else
      FIdVisitaInstanciaDetalle := 0;

  pnlTema.Color := clBtnFace;
  Self.Color := clBtnFace;
  chkTema.Color := clBtnFace;
end;

procedure TfraTema.ChangeRespuesta;
begin
  tbRespuesta.ImageIndex := 1 + iif(FIdRespuesta + FIdRespuestaDinamica <= 0, {iif(RequiereRespuestas, 8, 0)} 0, 4);
  tbRespuesta.Invalidate;
end;

function TfraTema.HayDatosCargados: Boolean;
begin
  Result := (MostrarIconoObservaciones and not IsEmptyString(Observaciones)) or
            (MostrarIconoAdjunto and not IsEmptyString(NombreAdjunto)) or
            (MostrarIconoRespuestas and ((FIdRespuestaDinamica > 0) or (FIdRespuesta > 0)));
end;

procedure TfraTema.chkTemaClick(Sender: TObject);
begin
  if not chkTema.Checked and HayDatosCargados then
    if MsgBox('¿ Desea destildar este tema ?' + #10#13 + 'Se perderán los datos cargados en las opciones para este tema', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
      //resetea todos los datos cargados en los toolbuttons
      Clear
    else
      chkTema.Checked := True;
end;

procedure TfraTema.Clear;
begin
  SetObservaciones('');
  //* resetea lista respuestas */
  FIdRespuesta := 0;
  FIdRespuestaDinamica := 0;
  tbRespuesta.Hint := 'Sin respuesta';
  ChangeRespuesta;
  //* resetea adjunto *//
  SetNombreAdjunto('');
  Adjunto := '';
end;

constructor TfraTema.Create(AOwner: TComponent);
begin
  inherited;
  FSQLAltaRespuesta := sdqAltaTema.SQL.Text;
  FSQLModificarRespuesta := sdqModificarTema.SQL.Text;
end;

function TfraTema.GetNombreAdjunto: String;
begin
  Result := FNombreAdjunto;
end;

function TfraTema.GetBreadCrumb: String;
begin
  Result := pnlCategoria.Caption;
end;

function TfraTema.GetMostrarIconoAdjunto: Boolean;
begin
  Result := tbAdjunto.Visible;
end;

function TfraTema.GetMostrarIconoAyuda: Boolean;
begin
  Result := tbAyuda.Visible;
end;

function TfraTema.GetMostrarIconoObservaciones: Boolean;
begin
  Result := tbObservaciones.Visible;
end;

function TfraTema.GetMostrarIconoRespuestas: Boolean;
begin
  Result := tbRespuesta.Visible;
end;

function TfraTema.GetObservaciones: String;
begin
  Result := FObservaciones;
end;

function TfraTema.GetTemaDescripcion: String;
begin
  Result := chkTema.Caption;
end;

procedure TfraTema.GuardarTema(AIdVisitaInstancia: Integer; AModoABM: TModoABM);
var
  sSeleccionado: String;
  Stream: TFileStream;
begin
  sSeleccionado := iif(chktema.Checked, 'S', 'N');
  if (AModoABM = maModificacion) and (FIdVisitaInstanciaDetalle > 0) then
    EjecutarSqlSTEx(FSQLModificarRespuesta, [sSeleccionado, FObservaciones, FIdRespuesta, FIdRespuesta, FIdRespuestaDinamica, FIdRespuestaDinamica, FRespuestaDinamica, NombreAdjunto, FIdVisitaInstanciaDetalle])
  else if AModoABM <> maBaja then
  begin
    FIdVisitaInstanciaDetalle := GetSecNextVal('COMERCIAL.SEQ_CVD_ID');
    EjecutarSqlSTEx(FSQLAltaRespuesta, [FIdVisitaInstanciaDetalle, AIdVisitaInstancia, FIdVisita, FIdTema, sSeleccionado, FObservaciones, FIdRespuesta, FIdRespuesta, FIdRespuestaDinamica, FIdRespuestaDinamica, FRespuestaDinamica, NombreAdjunto]);
  end;

  if AModoABM <> maBaja then
  begin
    if FileExists(NombreAdjunto) then
    begin
      Stream := TFileStream.Create(NombreAdjunto, fmOpenRead);
      try
        SaveBlob('SELECT vd_adjunto ' +
                  ' FROM comercial.cvd_visitainstanciadetalle ' +
                 ' WHERE vd_id = ' + SqlValue(FIdVisitaInstanciaDetalle),

                 'UPDATE comercial.cvd_visitainstanciadetalle'+
                   ' SET vd_adjunto = :vd_adjunto ' +
                 ' WHERE vd_id = ' + SqlValue(FIdVisitaInstanciaDetalle),

                 'vd_adjunto', Stream);
      finally
        Stream.Free;
      end;
    end;
  end;
end;

procedure TfraTema.miCambiarAdjuntoClick(Sender: TObject);
begin
  AbrirDialogoArchivoAdjunto;
end;

procedure TfraTema.miRemoverAdjuntoClick(Sender: TObject);
var
  sSql: String;
begin
  Adjunto := '';
  NombreAdjunto := '';
  tbAdjunto.Hint := 'Adjuntar archivo';
  sSql := 'UPDATE comercial.cvd_visitainstanciadetalle ' +
          '   SET vd_adjunto = NULL ' +
          ' WHERE vd_id = :idvisitainstanciadetalle';
  EjecutarSqlSTEx(sSql, [FIdVisitaInstanciaDetalle]);
end;

procedure TfraTema.miVerAdjuntoClick(Sender: TObject);
var
  sFileName: String;
  Stream: TFileStream;
begin
  if FileExists(NombreAdjunto) then
    sFileName := NombreAdjunto
  else if not sdqCargarTema.FieldByName('VD_ADJUNTO').IsNull then
  begin
    sFileName := IncludeTrailingPathDelimiter(TempPath) + ExtractFileName(NombreAdjunto);
    Stream := TFileStream.Create(sFileName, fmCreate);
    try
      BlobSql('SELECT VD_ADJUNTO ' +
              '  FROM COMERCIAL.CVD_VISITAINSTANCIADETALLE ' +
              ' WHERE VD_ID = '  + sdqCargarTema.FieldByName('VD_ID').AsString, Stream);
    finally
      Stream.Free;
    end;
  end;

  Verificar(not FileExists(sFileName), nil, 'Ocurrió un problema con el archivo que intenta abrir, consulte con Sistemas.');
  AbrirArchivoVisor(sFileName, True, True);
end;

procedure TfraTema.pmAdjuntoPopup(Sender: TObject);
begin
  inherited;
  miRemoverAdjunto.Visible := not Locked;
  miCambiarAdjunto.Visible := not Locked;
end;

procedure TfraTema.pmListaRespuestasPopup(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to pmListaRespuestas.Items.Count - 1  do
  begin
    if TipoRespuesta = 'R' then
      pmListaRespuestas.Items[i].Checked := FIdRespuesta = pmListaRespuestas.Items[i].Tag
    else
      pmListaRespuestas.Items[i].Checked := FIdRespuestaDinamica = pmListaRespuestas.Items[i].Tag;

    pmListaRespuestas.Items[i].Enabled := not Locked;
  end;
end;

procedure TfraTema.SetNombreAdjunto(const Value: String);
begin
  FNombreAdjunto := Value;
  tbAdjunto.ImageIndex := 3 + iif(IsEmptyString(Value), iif(RequiereAdjunto, 8, 0), 4);
  tbAdjunto.DropDownButton := not IsEmptyString(FNombreAdjunto);
  tbAdjunto.AutoSize := False;
  tbAdjunto.AutoSize := True;
  tbAdjunto.Invalidate;
end;

procedure TfraTema.SetBreadCrumb(const Value: String);
begin
  pnlCategoria.Caption := Value;
end;

procedure TfraTema.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([chkTema], Value);
end;

procedure TfraTema.SetMostrarCategoria(const Value: Boolean);
begin
  FMostrarCategoria := Value;
  pnlCategoria.Visible := Value;
  if Value then
    Height := 44
  else
    Height := 24;
end;

procedure TfraTema.SetMostrarIconoAdjunto(const Value: Boolean);
begin
  tbAdjunto.Visible := Value;
end;

procedure TfraTema.SetMostrarIconoAyuda(const Value: Boolean);
begin
  tbAyuda.Visible := Value;
end;

procedure TfraTema.SetMostrarIconoObservaciones(const Value: Boolean);
begin
  tbObservaciones.Visible := Value;
end;

procedure TfraTema.SetMostrarIconoRespuestas(const Value: Boolean);
var
  miMenuItem: TmenuItem;
begin
  tbRespuesta.Visible := Value;
  if MostrarIconoRespuestas then
  begin
    pmListaRespuestas.Items.Clear;

    mimenuItem := TMenuItem.Create(pmListaRespuestas);
    miMenuItem.Caption := 'Sin respuesta';
    mimenuItem.Tag := 0;
    miMenuItem.Name := 'miMenuItem_' +  IntToStr(mimenuItem.Tag);
    miMenuItem.OnClick := SeleccionarItemRespuesta;
    miMenuItem.AutoHotkeys := maManual;
    pmListaRespuestas.Items.Add(miMenuItem);

    mimenuItem := TMenuItem.Create(pmListaRespuestas);
    miMenuItem.Caption := '-';
    mimenuItem.Tag := 0;
    pmListaRespuestas.Items.Add(miMenuItem);

    if TipoRespuesta = 'R' then
    begin
      OpenQueryEx(sdqListaRespuestas, [IdTema]);
      while not sdqListaRespuestas.Eof do
      begin
        miMenuItem := TMenuItem.Create(pmListaRespuestas);
        miMenuItem.Caption := sdqListaRespuestas.Fieldbyname('VR_DESCRIPCION').AsString;
        mimenuItem.Tag := sdqListaRespuestas.Fieldbyname('VR_ID').AsInteger;
        miMenuItem.OnClick := SeleccionarItemRespuesta;
        miMenuItem.AutoHotkeys := maManual;
        pmListaRespuestas.Items.Add(miMenuItem);
        sdqListaRespuestas.Next;
      end;
    end
    else
    if TipoRespuesta = 'Q' then
    begin
      sdqConsultaDinamica.SQL.Text := RespuestaSQL;
      OpenQuery(sdqConsultaDinamica);
      while not sdqConsultaDinamica.Eof do
      begin
        mimenuItem := TMenuItem.Create(pmListaRespuestas);
        miMenuItem.Caption := sdqConsultaDinamica.Fieldbyname('DESCRIPCION').AsString;
        mimenuItem.Tag := sdqConsultaDinamica.Fieldbyname('ID').AsInteger;
        miMenuItem.OnClick := SeleccionarItemRespuesta;
        miMenuItem.AutoHotkeys := maManual;
        pmListaRespuestas.Items.Add(miMenuItem);
        sdqConsultaDinamica.Next;
      end;
    end;
  end;
end;

procedure TfraTema.SetObservaciones(const Value: String);
begin
  tbObservaciones.ImageIndex := 2 + iif(IsEmptyString(Value), iif(RequiereObservaciones, 8, 0), 4);
  FObservaciones := Value;
  chkTema.Checked := not IsEmptyString(Value);
end;

procedure TfraTema.SeleccionarItemRespuesta(Sender: TObject);
var
  menuItem: TMenuItem;
begin
  if Sender is TMenuItem then
  begin
    menuItem := TMenuItem(Sender);
    tbRespuesta.Hint := menuItem.Caption;
    menuItem.Checked :=  True;
    if TipoRespuesta = 'R' then
      FIdRespuesta := menuItem.Tag
    else
    begin
      FIdRespuestaDinamica := menuItem.Tag;
      FRespuestaDinamica := menuItem.Caption;
    end;
    chkTema.Checked := True;
    ChangeRespuesta;
  end;
end;

procedure TfraTema.SetTemaDescripcion(const Value: String);
begin
  chkTema.Caption := Value;
end;

procedure TfraTema.AbrirDialogoArchivoAdjunto;
begin
  with TOpenDialog.Create(Self) do
  try
    Filter := 'Todos los documentos (*.*)|*.*|Archivos PDF (*.pdf)|*.pdf|Archivos de imagen TIFF (*.tiff)|*.tiff|Archivos de imagen JPG (*.jpg)|*.jpg|Archivos de documento DOC (*.doc)|*.doc|Archivos de documento DOCX (*.docx)|*.docx';
    Filter := Filter + '|Archivos de MsExcel XLS (*.xls)|(*.xls)|Archivos de MsExcel XLSX (*.xlsx)|(*.xlsx)|CSV (delimitado por comas)|*.csv|Documentos de texto (*.txt)|*.txt';
    if Execute then
    begin
      NombreAdjunto := FileName;
      tbAdjunto.Hint := ExtractFileName(FileName);
      chkTema.Checked := True;
    end;
  finally
    Free;
  end;
end;

procedure TfraTema.tbAdjuntoClick(Sender: TObject);
begin
  if Locked then
    if NombreAdjunto <> '' then
      miVerAdjuntoClick(nil)
    else
      InfoHint (tbAdjunto, 'No se ha cargado un archivo adjunto')

  else if not pmAdjunto.AutoPopup then
    AbrirDialogoArchivoAdjunto;
end;

procedure TfraTema.tbAdjuntoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  pmAdjunto.AutoPopup := not(FNombreAdjunto = '') and not Locked;
end;

procedure TfraTema.tbAyudaClick(Sender: TObject);
begin
  if not IsEmptyString(Ayuda) then
    MostrarAyuda('Ayuda', Ayuda, True);
end;

procedure TfraTema.tbObservacionesClick(Sender: TObject);
var
  //tslAux: TStrings;
  sObservaciones: String;
begin
  sObservaciones := Observaciones;
  MostrarTexto('Observaciones', sObservaciones, not Locked);
  Observaciones := sObservaciones;
  {
  if Locked then
    MostrarTexto('Observaciones', Observaciones)
  else
  begin
    tslAux := TStringList.Create;
    tslAux.Text := FObservaciones;
    try
      if InputMemoBox('Observaciones', tslAux) and (Trim(tslAux.Text) > '') then
        chkTema.Checked := True;
    finally
      Observaciones := tslAux.Text;
      tslAux.Free;
    end;
  end;
  }
end;

function TfraTema.ValidarTema: Boolean;
begin
  Verificar(chkTema.Checked and not ValidaObservaciones, tbObservaciones, 'Debe completar las observaciones');
  Verificar(chkTema.Checked and not ValidaAdjunto, tbAdjunto, 'Debe seleccionar un archivo adjunto.');
  Result := True;
end;

function TfraTema.ValidaObservaciones: Boolean;
begin
  Result := not RequiereObservaciones or (Trim(FObservaciones) > '');
end;

function TfraTema.ValidaAdjunto: Boolean;
begin
  Result := not RequiereAdjunto or (Trim(FNombreAdjunto) > '');
end;

end.
