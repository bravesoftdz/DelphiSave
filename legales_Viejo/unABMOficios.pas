unit unABMOficios;

interface

uses
  {$IFNDEF VER150}rxCurrEdit, rxToolEdit, rxPlacemnt, {$ELSE}CurrEdit, ToolEdit, Placemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus, artSeguridad,
  ShortCutControl, ComCtrls, ToolWin, unfraJuzgados, unfraCodigoDescripcionExt, StdCtrls, PatternEdit, IntEdit,
  unfraAbogadosLegales, Mask, DateComboBox, unArtFrame, unFraCodigoDescripcion, unFraDomicilio, unDmLegales,
  DB, SDEngine, DBClient, unfraUsuarios, unArchivosAsociadosOficios, unArtDBAwareFrame,
  Word2000, OleServer, unArt, unComunes, ArchFuncs;

type
  TfrmABMOficios = class(TForm)
    tbGestionDeuda: TToolBar;
    tbSeparador0: TToolButton;
    tbGuardar: TToolButton;
    tbSeparador3: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    odAbrirArchivo: TOpenDialog;
    pmSeguimientoJuicios: TPopupMenu;
    ImprimirExpediente1: TMenuItem;
    mnuLiquidacion: TMenuItem;
    EvolucindeInstancias1: TMenuItem;
    mnuEventos: TMenuItem;
    mnuAgenda: TMenuItem;
    gbOficio: TGroupBox;
    lbConcurso: TLabel;
    lblCaratula: TLabel;
    lblOficio: TLabel;
    lblContra: TLabel;
    edFechaEntrada: TDateComboBox;
    edCARATULA: TEdit;
    edNroOficio: TIntEdit;
    edDemandante: TEdit;
    edDemandado: TEdit;
    gbOficiante: TGroupBox;
    fraDatosJuzgadoAsignado: TfraJuzgados;
    Label1: TLabel;
    gbEntidadOficiante: TGroupBox;
    Label2: TLabel;
    fraEntidad: TfraCodigoDescripcionExt;
    Label3: TLabel;
    edFechaSalida: TDateComboBox;
    Label4: TLabel;
    edFechaRecepcion: TDateComboBox;
    chbAgregaDocumentacion: TCheckBox;
    gbDomicilio: TGroupBox;
    fraDomicilio: TfraDomicilio;
    gbDetalle: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FraJuicios: TfraCodigoDescripcionExt;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    cdsArchivosAsociados: TClientDataSet;
    fraUsuario: TfraUsuario;
    edOficiante: TEdit;
    gbDomicilioJuzgado: TGroupBox;
    Label8: TLabel;
    edDomicilioJuzgado: TEdit;
    Label9: TLabel;
    tbEdicionAbogado: TToolBar;
    tbNuevaEntidad: TToolButton;
    sdqArchivosAsociados: TSDQuery;
    edRequerimiento: TRichEdit;
    edRespuesta: TRichEdit;
    tbGenerarContestacion: TToolButton;
    ToolButton2: TToolButton;
    WordApplication: TWordApplication;
    WordDocument: TWordDocument;
    sdqModificacionRegistro: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tbSalirClick(Sender: TObject);
    procedure FraJuicioscmbDescripcionDropDown(Sender: TObject);
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure tbNuevaEntidadClick(Sender: TObject);
    procedure tbGenerarContestacionClick(Sender: TObject);
    procedure WordDocumentClose(Sender: TObject);
  private
    FIdOficio: Integer;
    FModo: TModoEjecucion;

    procedure CargarArchivos;
    procedure CargarDatos(AQuery: TDataSet);
    procedure ChangeSecretaria(Sender: TObject);
    procedure GuardarDatos(aCerrar: boolean = true);
    procedure LimpiarCampos;
    procedure RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
    procedure GenerarWord;
  public
    function AltaOficio: Boolean;
    function ModificacionOficio(Tabla: TSDQuery): Boolean;
  end;

const
  MINLENGTH = 4;

var
  frmABMOficios: TfrmABMOficios;

implementation

uses
  unSesion, unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unPrincipal, DateUtils, unConstLegales,
  StrFuncs,  MaskUtils, unManEntidadesOficiantes, Math;

{$R *.dfm}

{ TfrmABMOficios }

function TfrmABMOficios.AltaOficio: Boolean;
begin
  BeginTrans(True);

  FModo := meAlta;
  FIdOficio := GetSecNextVal('LEGALES.SEQ_LOJ_ID');

  EjecutarSqlST('INSERT INTO legales.loj_oficiojudicial (oj_id, OJ_USUALTA,  OJ_USUARIOASIGNADO, OJ_FECHALALTA)' +
                  ' VALUES ( ' + SqlValue(FIdOficio) + ', ' +
                                 SqlValue(Sesion.LoginName) + ', ' +
                                 SqlValue(Sesion.LoginName) + ', ' +
                                 'SysDate) ', tmNone);
  LimpiarCampos;

  Seguridad.Ejecutar;

  Self.Caption := 'Alta de Oficio...';

  Result := (ShowModal = mrOK);
end;

procedure TfrmABMOficios.LimpiarCampos;
begin
  edNroOficio.Clear;
  edFechaEntrada.Clear;
  edFechaSalida.Clear;
  edFechaRecepcion.Clear;
  edDemandante.Clear;
  edDemandado.Clear;
  edCARATULA.Clear;
  chbAgregaDocumentacion.Checked := False;
  fraJuicios.Codigo := '';
  fraDatosJuzgadoAsignado.Limpiar;
  fraUsuario.Limpiar;
  fraEntidad.Codigo := '';
  fraDomicilio.Clear;
  edRequerimiento.Clear;
  edRespuesta.Clear;
  edOficiante.Clear;
end;

procedure TfrmABMOficios.FormCreate(Sender: TObject);
begin
  fraDatosJuzgadoAsignado.Init(NOPERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);

  with fraJuicios do
  begin
    TableName := 'LEGALES.LJT_JUICIOENTRAMITE';
    FieldID     := 'jt_id';
    FieldCodigo := 'JT_NUMEROCARPETA';
//    FieldDesc   := 'JT_DEMANDANTE';
    FieldDesc   := 'JT_DEMANDANTE || '' C/ '' || JT_DEMANDADO || '' '' || JT_CARATULA';
    FieldBaja   := 'jt_fechabaja';
//    ExtraFields := ' ,JT_DEMANDADO, JT_CARATULA ';
    Showbajas   := true;
  end;

  with fraEntidad do
  begin
    TableName := 'legales.leo_entidadoficiante ';
    FieldID     := 'eo_id';
    FieldCodigo := 'eo_id';
    FieldDesc   := 'eo_descripcion';
    FieldBaja   := 'eo_fechabaja';
    Showbajas   := True;
  end;

  fraDatosJuzgadoAsignado.lblInstancia.Visible := False;
  fraDatosJuzgadoAsignado.peInstancia.Visible := False;

  fraUsuario.ShowBajas := True;
  fraUsuario.Sector := 'LEGAL';

  fraDatosJuzgadoAsignado.fraSecretaria.OnChange := ChangeSecretaria;
end;

procedure TfrmABMOficios.tbGuardarClick(Sender: TObject);
begin
  GuardarDatos;
end;

procedure TfrmABMOficios.GuardarDatos(aCerrar: boolean);
var
  NroOficio: Integer;
  sSqlTrans: TSql;
begin

//  if not fraDatosJuzgadoAsignado.IsSelected then edDomicilioJuzgado.Text := '';

  NroOficio := 0;
  VerificarMultiple([
                    'Oficio Juicio',
                    edFechaEntrada,
                    edFechaEntrada.Date > 0,
                    'Debe espefificar la Fecha de Entrada.',
                    edFechaSalida,
                    ((edFechaSalida.Date = 0) or (edFechaSalida.Date >= edFechaEntrada.Date)),
                    'La Fecha de Salida debe ser mayor a la Fecha de Entrada.',
                    edCARATULA,
                    not IsEmptyString(edDemandante.Text)
                    and not IsEmptyString(edDemandado.Text)
                    and not IsEmptyString(edCARATULA.Text),
                    'Debe completar la carátula del oficio.',
                    fraUsuario,
                    fraUsuario.edCodigo.Text <> '',
                    'Debe asignar un usuario al Oficio.',
                    edOficiante,
                    ((edOficiante.Text <> '') or (fraDatosJuzgadoAsignado.IsSelected)
                    or (fraEntidad.IsSelected)),
                    'Debe completar el Oficiante o el Juzgado o la Entidad oficiante.',
                    fraDomicilio,
                    ((edDomicilioJuzgado.Text <> '') or (not fraDomicilio.IsEmpty)),
                    'Debe completar el domicilio.',
                    fraDomicilio,
                    ((edDomicilioJuzgado.Text <> '') or (fraDomicilio.IsValid)),
                    'El domicilio no es válido.'
                    ]);

  if fraDatosJuzgadoAsignado.IsSelected then
  begin
    fraDatosJuzgadoAsignado.Validar('Oficio Juicio');
    fraDatosJuzgadoAsignado.ValidarSeleccionBajas('Oficio Juicio');
  end;

   try

     cdsArchivosAsociados.First;
     while not cdsArchivosAsociados.Eof do
     begin
       if cdsArchivosAsociados.FieldByName('STATE').AsString = 'I' then
       begin
         EjecutarSqlST('INSERT INTO legales.LAO_ARCHIVOOFICIO' +
                     ' (ao_id, ao_descripcion, ao_patharchivo, ao_idoficio, ao_usualta, ao_fechaalta) ' +
                     ' VALUES (' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger) + ',  ' +
                     SqlValue(cdsArchivosAsociados.FieldByName('DESCRIPCION').AsString) + ', ' +
                     SqlValue(cdsArchivosAsociados.FieldByName('PATHARCHIVO').AsString) + ', ' +
                     SqlValue(FIdOficio) + ',' +
                     SqlValue(Sesion.LoginName) + ', SysDate)');
       end;
       cdsArchivosAsociados.Next;
     end;

     sSqlTrans := TSql.Create('legales.loj_oficiojudicial');
     sSqlTrans.SqlType := stUpdate;
     sSqlTrans.PrimaryKey.Add('oj_id', FIdOficio);

     if FModo = meAlta then
     begin
      NroOficio := ValorSql('select nvl(max(oj_numerooficio), 0) + 1 from legales.loj_oficiojudicial', '0');
      sSqlTrans.Fields.AddString('OJ_NUMEROOFICIO', NroOficio);
     end;

     sSqlTrans.Fields.AddDate('OJ_FECHAENTRADA', edFechaEntrada.Date, True);
     sSqlTrans.Fields.AddInteger('OJ_IDJUICIOENTRAMITE', fraJuicios.ID, 'N', True);
     sSqlTrans.Fields.AddString('OJ_USUARIOASIGNADO', fraUsuario.edCodigo.Text);

     sSqlTrans.Fields.AddDate('OJ_FECHASALIDA', edFechaSalida.Date, True);
     sSqlTrans.Fields.AddDate('OJ_FECHARECEPCION', edFechaRecepcion.Date, True);
     sSqlTrans.Fields.AddInteger('OJ_idjurisdiccion', fraDatosJuzgadoAsignado.Jurisdiccion, True);
     sSqlTrans.Fields.AddInteger('OJ_idfuero', fraDatosJuzgadoAsignado.Fuero, True);
     sSqlTrans.Fields.AddInteger('OJ_idjuzgado', fraDatosJuzgadoAsignado.Juzgado, True);
     sSqlTrans.Fields.AddInteger('OJ_idsecretaria', fraDatosJuzgadoAsignado.Secretaria, True);
     sSqlTrans.Fields.AddString('OJ_REQUERIMIENTO', edRequerimiento.Text);
     sSqlTrans.Fields.AddString('OJ_RESPUESTA', edRespuesta.Text);
     sSqlTrans.Fields.AddString('OJ_OFICIANTE', edOficiante.Text);

     sSqlTrans.Fields.AddString('OJ_CARATULA', edCARATULA.Text);
     sSqlTrans.Fields.AddString('OJ_DEMANDANTE', edDemandante.Text);
     sSqlTrans.Fields.AddString('OJ_DEMANDADO', edDemandado.Text);

     sSqlTrans.Fields.AddInteger('OJ_IDENTIDADOFICIANTE', fraEntidad.Codigo, 'N', True);
     if chbAgregaDocumentacion.Checked then
       sSqlTrans.Fields.AddString('OJ_AGREGADOCUMENTACION', 'S')
     else
       sSqlTrans.Fields.AddString('OJ_AGREGADOCUMENTACION', 'N');

     sSqlTrans.Fields.AddInteger('OJ_IDUBICACION', fraDomicilio.Ubicacion);
     sSqlTrans.Fields.AddString('OJ_NUMERO',       fraDomicilio.Numero);
     sSqlTrans.Fields.AddString('OJ_PISO',         fraDomicilio.Piso);
     sSqlTrans.Fields.AddString('OJ_DEPARTAMENTO', fraDomicilio.Departamento);
     sSqlTrans.Fields.AddString('OJ_CPOSTALA',     fraDomicilio.CPA);

     if Fmodo = meAlta then
     begin
       sSqlTrans.Fields.AddDate('OJ_FECHALALTA',Date, False);
       sSqlTrans.Fields.Add('oj_usualta', Sesion.LoginName);
     end else
     begin
        sSqlTrans.Fields.Add('oj_fechamodif', 'sysdate', False);
        sSqlTrans.Fields.Add('oj_usumodif', Sesion.LoginName);
    end;

    EjecutarSQLST(sSqlTrans.Sql, tmNone);
    CommitTrans(true);
    if FModo = meAlta then
     MessageBox(self.Handle,PChar('Se generó el Oficio Nro. ' + InttoStr(NroOficio)), 'Oficio', MB_ICONINFORMATION or MB_OK);
    if aCerrar then Close;
  except
    on E : Exception do
      raise Exception.Create('Error al guardar el Oficio. Mensaje: ' + E.Message);
  end;
end;

procedure TfrmABMOficios.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dmPrincipal.sdbPrincipal.InTransaction then
    if MessageDlg('Se descartarán todas las modificaciones realizadas. ¿ Continua ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      Rollback(true)
    else
      CanClose := false;

   ModalResult := mrOk;
end;

procedure TfrmABMOficios.tbSalirClick(Sender: TObject);
begin
  close;
end;

function TfrmABMOficios.ModificacionOficio(Tabla: TSDQuery): Boolean;
begin
  BeginTrans(True);

  FModo := meModificacion;
  FIdOficio := Tabla.FieldByName('OJ_ID').AsInteger;
  LimpiarCampos;

  CargarDatos(Tabla);

  Self.Caption := 'Modificación de Oficio...';

  Result := (ShowModal = mrOK);
end;

procedure TfrmABMOficios.CargarDatos(AQuery: TDataSet);
begin
  edNroOficio.Text := AQuery.FieldByName('OJ_NUMEROOFICIO').AsString;
  edFechaEntrada.Date := AQuery.FieldByName('OJ_FECHAENTRADA').AsDateTime;
  edFechaSalida.Date := AQuery.FieldByName('OJ_FECHASALIDA').AsDateTime;
  edFechaRecepcion.Date := AQuery.FieldByName('OJ_FECHARECEPCION').AsDateTime;

  edDemandante.Text := AQuery.FieldByName('OJ_DEMANDANTE').AsString;
  edDemandado.Text := AQuery.FieldByName('OJ_DEMANDADO').AsString;
  edCARATULA.Text := AQuery.FieldByName('OJ_CARATULA').AsString;
  chbAgregaDocumentacion.Checked := (AQuery.FieldByName('OJ_AGREGADOCUMENTACION').AsString[1] = 'S');
  fraUsuario.Cargar( AQuery.FieldByName('OJ_USUARIOASIGNADO').AsString);
  fraJuicios.Codigo :=  ValorSql('SELECT JT_NUMEROCARPETA FROM LEGALES.LJT_JUICIOENTRAMITE WHERE JT_ID = ' + SqlString(AQuery.FieldByName('OJ_IDJUICIOENTRAMITE').AsString, False, true), '0');

  fraDatosJuzgadoAsignado.Jurisdiccion := AQuery.FieldByName('OJ_IDJURISDICCION').AsInteger;
  fraDatosJuzgadoAsignado.Fuero := AQuery.FieldByName('OJ_IDFUERO').AsInteger;
  fraDatosJuzgadoAsignado.Juzgado := AQuery.FieldByName('OJ_IDJUZGADO').AsInteger;
  fraDatosJuzgadoAsignado.Secretaria := AQuery.FieldByName('OJ_IDSECRETARIA').AsInteger;
  edDomicilioJuzgado.Text := fraDatosJuzgadoAsignado.Domicilio;
  edOficiante.Text := AQuery.FieldByName('OJ_OFICIANTE').AsString;

  fraEntidad.Codigo := AQuery.FieldByName('OJ_IDENTIDADOFICIANTE').AsString;
  edRequerimiento.Text := AQuery.FieldByName('OJ_REQUERIMIENTO').AsString;
  edRespuesta.Text := AQuery.FieldByName('OJ_RESPUESTA').AsString;

  fraDomicilio.Ubicacion    := AQuery.FieldByName('OJ_IDUBICACION').AsInteger;
  fraDomicilio.Numero       := AQuery.FieldByName('OJ_NUMERO').AsString;
  fraDomicilio.Piso         := AQuery.FieldByName('OJ_PISO').AsString;
  fraDomicilio.Departamento := AQuery.FieldByName('OJ_DEPARTAMENTO').AsString;
  fraDomicilio.CPA          := AQuery.FieldByName('OJ_CPOSTALA').AsString;

  CargarArchivos;
end;


procedure TfrmABMOficios.FraJuicioscmbDescripcionDropDown(Sender: TObject);
begin
  with FraJuicios do
  begin
    if (Length(Trim(cmbDescripcion.Text)) < MINLENGTH) Then
    begin
      Clear;
      InvalidHint(cmbDescripcion, 'El mínimo a ingresar es ' + IntToStr(MINLENGTH) + ' caracteres.' , 'Advertencia', blnWarning);
    end else
    begin
      ExtraJoinCondition := ' ( JT_CARATULA LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
              ' OR   JT_DEMANDANTE LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
              ' OR   JT_DEMANDADO LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ') ';

      cmbDescripcionDropDown(Sender);
    end;
  end;
end;

procedure TfrmABMOficios.tbSeleccionArchivosAsociarClick(Sender: TObject);
begin
  with TfrmArchivosAsociadosOficios.Create(self) do
  try
    CargarArchivosAsociados(FIdOficio, cdsArchivosAsociados);
  finally
    RecargarArchivosAsociados(cdsArchivosAsociados);
    Free;
  end;
end;

procedure TfrmABMOficios.ChangeSecretaria(Sender: TObject);
begin
  if fraDatosJuzgadoAsignado.IsSelected then
    edDomicilioJuzgado.Text := fraDatosJuzgadoAsignado.Domicilio
  else
    edDomicilioJuzgado.Clear;
end;

procedure TfrmABMOficios.tbNuevaEntidadClick(Sender: TObject);
begin
  TfrmManEntidadesOficiantes.MostrarAbm;
  fraEntidad.Reload;
end;

procedure TfrmABMOficios.CargarArchivos;
var
  i: Integer;
begin
  try
    sdqArchivosAsociados.ParamByName('IdOficio').AsInteger := FIdOficio;
    sdqArchivosAsociados.Open;
    cdsArchivosAsociados.EmptyDataSet;
    while not sdqArchivosAsociados.Eof do
    begin
      cdsArchivosAsociados.Append;

      for i := 0 to sdqArchivosAsociados.Fields.count - 1 do
        cdsArchivosAsociados.fields[i].Value := sdqArchivosAsociados.Fields[i].Value;

      cdsArchivosAsociados.FieldByName('STATE').AsString := 'V';
      cdsArchivosAsociados.Post;
      sdqArchivosAsociados.Next;
    end;
  finally
   sdqArchivosAsociados.Close;
  end;
end;

procedure TfrmABMOficios.RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
begin
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE legales.LAO_ARCHIVOOFICIO' +
                      ' SET ao_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                          ' ao_fechabaja = SysDate' +
                    ' where ao_id = ' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger));

      cdsArchivosAsociados.Delete;
    end
    else cdsArchivosAsociados.Next;
  end;
end;

procedure TfrmABMOficios.tbGenerarContestacionClick(Sender: TObject);
begin
  if MsgAsk('Para generar el documento se guardarán los cambios.' + CRLF + '¿Desea continuar?') then
  begin
    GuardarDatos(false);
    if FModo = meAlta then
    begin
    	sdqModificacionRegistro.ParamByName('oj_id').AsInteger := FIdOficio;
      sdqModificacionRegistro.Open;
      FModo := meModificacion;
      CargarDatos(sdqModificacionRegistro);
      Self.Caption := 'Modificación de Oficio...';
    end;
    sdqModificacionRegistro.Close;
    GenerarWord;
  end;
end;


procedure TfrmABMOficios.GenerarWord;
var
  OleValorCampo, OleDocumentType, OleVisible, Template, NewTemplate, ItemIndex, OleValorFile: OleVariant;
  DateNow: TDateTime;
begin
  Template := EmptyParam;
  NewTemplate := True;
  ItemIndex:=1;

  WordApplication.Disconnect;

  try
    WordApplication.Connect;
  except
    {Error, puede que el Word no este instalado}
    Abort;
  end;

  Wordapplication.Visible := true;
  WordApplication.Caption := 'Oficio ' + edNroOficio.Text;

  {Crea nuevo documento}
  Template := GetParam('ARCHIVOCONTESTACIONOFICIO');
  NewTemplate := False;
  WordApplication.Documents.Add(Template, NewTemplate, OleDocumentType, OleVisible);

  if FileExists(GetTempFromPath('Oficio_' + edNroOficio.Text + '.doc')) then
    DeleteFile(GetTempFromPath('Oficio_' + edNroOficio.Text + '.doc'));

  {Asignas el componente WorDocument}
  WordDocument.ConnectTo(WordApplication.Documents.Item(ItemIndex));

  {Pones el corrector ortográfico como false}
  WordApplication.Options.CheckSpellingAsYouType := False;
  WordApplication.Options.CheckGrammarAsYouType := False;

(* Pablo
  WordDocument.Range.Paragraphs.Alignment := wdAlignParagraphJustify;

  WordDocument.Paragraphs.Item(6).Range.InsertParagraphBefore;
  WordDocument.Paragraphs.Item(6).Range.InsertParagraphBefore;
  WordDocument.Paragraphs.Item(6).Range.Text := 'ESTOY INSERTANDO UNA NUEVA LINEA QUE TAMBIEN ESTARÁ JUSTIFICADA COMO CORRESPONDE, ESO ES LO ESPERADO.';
*)

  //Nro Oficio
  OleValorCampo := edNroOficio.Text; 
  WordDocument.Variables.Add('NroOficio', OleValorCampo);

  //Lugar y Fecha
  DateNow := DBDate;
  OleValorCampo := 'Buenos Aires, ' + FormatDateTime('dd', DateNow) + ' de ' + UpperCase(FormatDateTime('mmmm', DateNow)) + ' de ' +  FormatDateTime('yyyy', DateNow);
  WordDocument.Variables.Add('LugaryFecha', OleValorCampo);

  //Dirigido A Linea 1
  OleValorCampo := 'Al señor';
  WordDocument.Variables.Add('DirigidoALinea1', OleValorCampo);

  //Caratula
  OleValorCampo := edDemandante.Text + ' C/' + edDemandado.Text + ' S/' + edCARATULA.Text;
  WordDocument.Variables.Add('Caratula', OleValorCampo);

  //Sede Judicial
  if fraDatosJuzgadoAsignado.IsSelected then
  begin
    OleValorCampo := fraDatosJuzgadoAsignado.fraFuero.Descripcion;
    if fraDatosJuzgadoAsignado.fraJuzgado.IsSelected and (fraDatosJuzgadoAsignado.fraJuzgado.Descripcion <> '-') and
      (fraDatosJuzgadoAsignado.fraJuzgado.Descripcion <> '') then
      OleValorCampo := OleValorCampo + ' - Juzgado ' + fraDatosJuzgadoAsignado.fraJuzgado.Descripcion;
    if fraDatosJuzgadoAsignado.fraSecretaria.IsSelected and (fraDatosJuzgadoAsignado.fraSecretaria.Descripcion <> '-') and
      (fraDatosJuzgadoAsignado.fraSecretaria.Descripcion <> '') then
      OleValorCampo := OleValorCampo + ' - Sec. ' + fraDatosJuzgadoAsignado.fraSecretaria.Descripcion;
  end
  else begin
    if fraEntidad.IsSelected then
      OleValorCampo := fraEntidad.Descripcion
    else
      if not IsEmptyString(edOficiante.Text) then
        OleValorCampo := edOficiante.Text
      else
        OleValorCampo := '';
  end;
  WordDocument.Variables.Add('LugarJudicial', OleValorCampo);

  //Domicilio
  if fraDomicilio.IsSelected then
  begin
    OleValorCampo := fraDomicilio.Calle + ' N° ' + fraDomicilio.Numero;
    if not IsEmptyString(fraDomicilio.Piso) then
      OleValorCampo := OleValorCampo + ', ' + fraDomicilio.Piso + ' Piso';
    if not IsEmptyString(fraDomicilio.Departamento) then
      OleValorCampo := OleValorCampo + ', Dto. ' + fraDomicilio.Departamento;
  end
  else
    if fraDatosJuzgadoAsignado.IsSelected then
      OleValorCampo := fraDatosJuzgadoAsignado.Domicilio;
  WordDocument.Variables.Add('Direccion', OleValorCampo);

  //CP y Localidad
  if fraDomicilio.IsSelected then
    OleValorCampo := 'C.P. ' +  fraDomicilio.CodigoPostal + ' - ' + fraDomicilio.Localidad
  else
    if fraDatosJuzgadoAsignado.IsSelected then
      OleValorCampo := 'C.P. ' +  fraDatosJuzgadoAsignado.CodigoPostal + ' - ' + fraDatosJuzgadoAsignado.Localidad;
  if IsEmptyString(OleValorCampo) then
    OleValorCampo := 'LOCALIDAD Y CP NO DEFINIDO';
  WordDocument.Variables.Add('Localidad', OleValorCampo);

  //Provincia
  if fraDomicilio.IsSelected then
    OleValorCampo := fraDomicilio.Provincia
  else
    if fraDatosJuzgadoAsignado.IsSelected then
      OleValorCampo := fraDatosJuzgadoAsignado.Provincia;
  if IsEmptyString(OleValorCampo) then
    OleValorCampo := 'PROVINCIA NO DEFINIDA';
  WordDocument.Variables.Add('Provincia', OleValorCampo);
  //Dirigido A Linea 2
  OleValorCampo := 'de la ' + OleValorCampo;
  WordDocument.Variables.Add('DirigidoALinea2', OleValorCampo);

  WordDocument.Fields.Update;
  WordDocument.Fields.ToggleShowCodes;

  { muestro el documento }
  WordDocument.Activate;
  WordDocument.Application.Visible := true;

  OleValorFile := GetTempFromPath('Oficio_' + edNroOficio.Text + '.doc');
  WordDocument.SaveAs(OleValorFile);

  { imprimo el documento }
//Pablo  WordDocument.PrintOut;
end;

procedure TfrmABMOficios.WordDocumentClose(Sender: TObject);
begin
//  if FileExists(GetTempFromPath('Oficio_' + edNroOficio.Text + '.doc')) then
//    DeleteFile(GetTempFromPath('Oficio_' + edNroOficio.Text + '.doc'));
end;

end.
