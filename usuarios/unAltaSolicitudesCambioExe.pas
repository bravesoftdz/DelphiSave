unit unAltaSolicitudesCambioExe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Buttons,
  PatternEdit, IntEdit, Mask, ToolEdit, DateComboBox, ExtCtrls, unArtFrame,
  unfraUsuarios, unArt, DateTimeEditors, RxPlacemnt;

type
  TfrmAltaSolicitudesCambioExe = class(TfrmCustomForm)
    dlgArchivo: TOpenDialog;
    gbInfoEjec: TGroupBox;
    edUbicacionEjec: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edNombreEjec: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edLongitudEjec: TIntEdit;
    btnCargarEjecutable: TBitBtn;
    gbPrioridadEjec: TRadioGroup;
    gbModificacionesEjec: TGroupBox;
    edModificacionesEjec: TMemo;
    GroupBox1: TGroupBox;
    fraUsuAutorizEjec: TfraUsuario;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    chkAutorizado: TCheckBox;
    edFechaEjec: TDateTimeEditor;
    procedure btnCargarEjecutableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAutorizadoClick(Sender: TObject);
  private
    procedure DoLimpiarDatosEjec;
    function DoValidarDatosEjec: Boolean;
    function DoGrabarDatosEjec: Boolean;
    procedure DoCargarArchivo(Archivo: String = '');
    function DoValidarSolicitudPrevia(NombreEjecutable: String): Boolean;
  public
  end;

procedure DoAltaSolcitudCambioExe(IdSolicitudSistemas: TTableId; PathEjecutable: String);

var
  frmAltaSolicitudesCambioExe: TfrmAltaSolicitudesCambioExe;

implementation

uses
  VCLExtra, ArchFuncs, CustomDlgs, StrFuncs, unDmPrincipal, SqlFuncs, unSesion,
  AnsiSql, Numeros, unSolicitudesCambioExe, unEspera;

{$R *.dfm}

procedure TfrmAltaSolicitudesCambioExe.DoCargarArchivo(Archivo: String = '');
var
  sArchCompleto: String;
begin
  with dlgArchivo do
    begin
      FileName := Archivo;
      if Execute then
        begin
          sArchCompleto := FileName;

          edUbicacionEjec.Text := Ucase(ExtractFilePath(sArchCompleto));
          edNombreEjec.Text    := Ucase(ExtractFileName(sArchCompleto));
          edFechaEjec.DateTime := FileDateToDateTime(FileAge(sArchCompleto));;
          edLongitudEjec.Value := FileSize(sArchCompleto);
        end;
    end;
end;

procedure TfrmAltaSolicitudesCambioExe.btnCargarEjecutableClick(Sender: TObject);
begin
  DoCargarArchivo;
end;

procedure TfrmAltaSolicitudesCambioExe.DoLimpiarDatosEjec;
begin
  edUbicacionEjec.Clear;
  edNombreEjec.Clear;
  edFechaEjec.Clear;
  edLongitudEjec.Clear;
  edModificacionesEjec.Clear;
  fraUsuAutorizEjec.Limpiar;
  chkAutorizado.Checked := False;
  gbPrioridadEjec.ItemIndex := 1;    // Mediana
end;

function TfrmAltaSolicitudesCambioExe.DoValidarDatosEjec: Boolean;
var
  sUbicacionProgr: String;
begin
  Result := False;

  Verificar(IsEmptyString(edNombreEjec.Text) and IsEmptyString(edModificacionesEjec.Lines.Text), btnCargarEjecutable, 'Debe seleccionar un archivo o indicar los cambios realizados.');

  if not IsEmptyString(edNombreEjec.Text) then
    begin
      if not chkAutorizado.Enabled then
        begin
          sUbicacionProgr := ConvertPathToUNCPath(edUbicacionEjec.Text);
          Verificar(StrLeft(sUbicacionProgr, 2) <> '\\', btnCargarEjecutable, 'Debe seleccionar el archivo de una ruta compartida.');
        end;

      if not DoValidarSolicitudPrevia(Trim(edNombreEjec.Text)) then
        Exit;
    end;

  Verificar(not fraUsuAutorizEjec.ReadOnly and fraUsuAutorizEjec.IsEmpty, fraUsuAutorizEjec, 'Debe indicar por quien es autorizado el cambio.');

  if chkAutorizado.Checked then
    Result := (MsgBox('Al autorizar ud. mismo la solicitud, se copiará el archivo correspondiente al directorio de pre-producción. ¿Confirma el proceso?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    Result := True;
end;

procedure TfrmAltaSolicitudesCambioExe.FormCreate(Sender: TObject);
begin
  inherited;

  with dlgArchivo do
    begin
      DefaultExt  := '';
      Title       := 'Selección de archivo';
      Options     := [ofHideReadOnly, ofFileMustExist];
      Filter      := 'Archivos ejecutables (*.exe)|*.exe|Todos los archivos (*.*)|*.*';
      FilterIndex := 1;
    end;

  with fraUsuAutorizEjec do
    begin
      ShowBajas := False;
      Sector    := 'COMPUTOS';
    end;

  VCLExtra.LockControls([edUbicacionEjec, edNombreEjec, edFechaEjec, edLongitudEjec]);
end;

procedure TfrmAltaSolicitudesCambioExe.btnAceptarClick(Sender: TObject);
begin
  if DoValidarDatosEjec() then
    if DoGrabarDatosEjec() then
      begin
        DoLimpiarDatosEjec();
        ModalResult := mrOk;
      end;
end;

function TfrmAltaSolicitudesCambioExe.DoGrabarDatosEjec: Boolean;
var
  sUbicacionProgr, sPathProgrCompleto, sDir: String;
  NroSolicitud: TTableId;
begin
  with TSql.Create('EJC_PROGREJECUTABLES') do
    try
      NroSolicitud := GetSecNextVal('SEQ_NROSORDENEJECUTABLES');

      PrimaryKey.Add('JC_NROSOLICITUD',  NroSolicitud);

      if IsEmptyString(edNombreEjec.Text) then
        Fields.Add('JC_NOMBREPROGR',     '------')
      else
        Fields.Add('JC_NOMBREPROGR',     Trim(edNombreEjec.Text));

      sUbicacionProgr := ConvertPathToUNCPath(edUbicacionEjec.Text);

      Fields.Add('JC_UBICACIONPROGR',    sUbicacionProgr);
      Fields.Add('JC_FECHAPROGR',        edFechaEjec.DateTime, dtDate);

      if edLongitudEjec.Value <> 0 then
        Fields.Add('JC_LONGITUDPROGR',   edLongitudEjec.Value);

      Fields.Add('JC_MODIFICACIONES',    Trim(edModificacionesEjec.Text));

      if not chkAutorizado.Checked then
        Fields.Add('JC_ANALISTA',        fraUsuAutorizEjec.UserID);

      Fields.Add('JC_CAMBIARENSERVERS',  'N');
      Fields.Add('JC_PRIORIDAD',         gbPrioridadEjec.ItemIndex);
      Fields.Add('JC_FECHAALTA',         SQL_ACTUALDATE, False);
      Fields.Add('JC_USUALTA',           Sesion.UserId);

      SqlType := stInsert;

      BeginTrans;
      try
        EjecutarSqlST(Sql);

        if chkAutorizado.Checked then
          begin
            IniciarEspera('Copiando archivo...');
            Application.ProcessMessages;
            try
              sDir               := PutLastBar(Get_CTBEspecial1('PATHS', '009'));
              sPathProgrCompleto := PutLastBar(sUbicacionProgr) + Trim(edNombreEjec.Text);

              DoProcesarAnalista_CopiarArchivo(fraUsuAutorizEjec.UserID, sDir, sUbicacionProgr, sPathProgrCompleto, Trim(edNombreEjec.Text), NroSolicitud);
            finally
              DetenerEspera;
            end;
          end;

        Application.ProcessMessages;
        CommitTrans;
        MsgBox('Los datos se grabaron correctamente.', MB_ICONINFORMATION);
      except
        on E: Exception do
          begin
            ErrorMsg( E, 'Error al dar de alta la solicitud.' );
            RollBack;
          end;
      end;
    finally
      Free;
    end;

  Result := True;
end;

procedure TfrmAltaSolicitudesCambioExe.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAltaSolicitudesCambioExe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure DoAltaSolcitudCambioExe(IdSolicitudSistemas: TTableId; PathEjecutable: String);
var
  sObserv, sPath, sExt, sArchivo, sSql: String;
  bEsAutorizador: Boolean;
  frm: TfrmSolicitudesCambioExe;
begin
  sArchivo := '';

  if IdSolicitudSistemas = ART_EMPTY_ID then
    begin
      sPath   := PathEjecutable;
      sObserv := 'Plan ' + FormatDateTime('yyyy', DBDate());
    end
  else
    begin
      sSql := 'SELECT EJ_PATH PATH, SS_NRO_TICKET NROTICKET ' +
                'FROM COMUNES.CEJ_EJECUTABLE, COMPUTOS.CSS_SOLICITUDSISTEMAS ' +
               'WHERE SS_ID = :Id ' +
                 'AND SS_IDEJECUTABLE = EJ_ID(+)';
      with GetQueryEx(sSql, [IdSolicitudSistemas]) do
        try
          if Eof then
            Exit
          else
            begin
              sPath   := FieldByName('PATH').AsString;
              sObserv := 'Ticket Nro.: ' + FieldByName('NROTICKET').AsString;
            end;
        finally
          Free;
        end;
    end;

  with TfrmAltaSolicitudesCambioExe.Create(nil) do
    try
      frm := TfrmSolicitudesCambioExe.Create(nil);
      with frm do
        try
          bEsAutorizador := Seguridad.ControlHabilitado(frm, tbPropiedades);
        finally
          Free;
        end;

      VCLExtra.LockControl(fraUsuAutorizEjec);
      VCLExtra.LockControl(chkAutorizado, not bEsAutorizador);
      if bEsAutorizador then
        chkAutorizado.Checked := bEsAutorizador;

      if not IsEmptyString(sPath) then
        begin
          sArchivo := ExtractFileName(sPath);
          sExt     := ExtractFileExt(sArchivo);
          sArchivo := ChangeFileExt(sArchivo, '');

          if IsNumber(StrRight(sArchivo, 4)) then
            sArchivo := CutRight(sArchivo, 4);

          if not IsEmptyString(sExt) then
            sArchivo := sArchivo + sExt;
        end;

      DoCargarArchivo(sArchivo);

      edModificacionesEjec.Lines.Text := sObserv;

      Showmodal;
    finally
      Free
    end;
end;

procedure TfrmAltaSolicitudesCambioExe.chkAutorizadoClick(Sender: TObject);
begin
  if chkAutorizado.Checked then
    fraUsuAutorizEjec.Cargar(Sesion.UserID)
  else
    fraUsuAutorizEjec.Limpiar;
end;

function TfrmAltaSolicitudesCambioExe.DoValidarSolicitudPrevia(NombreEjecutable: String): Boolean;
var
  sUsuariosAlta, sSql: String;
begin
  sSql := 'SELECT LISTAGG(USUALTA, '' / '') WITHIN GROUP (ORDER BY USUALTA) USUARIOSALTA ' +
            'FROM (SELECT DISTINCT JC_USUALTA USUALTA ' +
                    'FROM EJC_PROGREJECUTABLES ' +
                   'WHERE JC_NOMBREPROGR = :NombreProg ' +
                     'AND JC_FECHABAJA IS NULL ' +
                     'AND JC_USUALTA <> :UserId ' +
                     'AND JC_FECHAALTA >= ART.ACTUALDATE - 7 ' +
                     'AND JC_FIMPRESIONSOLICITUD IS NULL)';
  sUsuariosAlta := ValorSqlEx(sSql, [NombreEjecutable, Sesion.UserId]);

  if IsEmptyString(sUsuariosAlta) then
    Result := True
  else
    Result := (MsgBox('Ya ha sido solicitado el cambio de este archivo por: ' + sUsuariosAlta + '. ¿Confirma el alta de la solicitud?', MB_ICONQUESTION+MB_YESNO) = ID_YES);
end;

end.

