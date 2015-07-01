{
  Instalación de los componentes Borland InternetExpress (para soporte de XML)
  \\ntnas1\archivos\Gerencia Sistemas\COMPARTIDO GERENCIA\Delphi Updates\Internet Express\instalacion.txt
}


unit unImpoExpoWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImageListBox,
  Mask, unArtFrame, unFraCodigoDescripcion, CheckLst, ConditionParser, Db, SDEngine, PatternEdit, DateComboBox,
  CurrEdit, IntEdit, QueryToFile, ImgList, ExpAcciones, FormPanel, PeriodoPicker, FilePlano, FileReader,
  DBFileReader, SqlFuncs, Menus, Buttons, LogFile, DateTimeEditors, unArt, Variants,
  unArtDBAwareFrame, ComboEditor, CheckCombo, DBCheckCombo, unCustomForm, XPMenu, DBCtrls, Xmlxform, xmldom, Provider,
  DBClient {$IFDEF VER150}, ToolEdit, Placemnt, unZipDll {$ELSE}, RxToolEdit, RxPlacemnt, Zipmstr (*, System.Zip*){$ENDIF};

type
  PPathRecord = ^TPathRecord;
  TPathRecord = record
    Accion: TExpFiles;
    Caption: TLabel;
    Editor: TFileDirEdit;
  end;

  PParamRecord = ^TParamRecord;
  TParamRecord = record
    Caption  : TLabel;
    Editor   : TWinControl;
    FieldType: TFieldType;    // Tipo de Campo     (se usa para crear los parámetros según el tipo de dato)
    ParamName: String;
  end;
{
  TExpThread = class(TThread)
  private
  protected
    FMethod: TThreadMethod;
    procedure Execute; override;
  published
    constructor Create(Method: TThreadMethod; AFreeOnTerminate : Boolean = True; APriority: TThreadPriority = tpNormal);
  end;
}
  TfrmImpoExpoWizard = class(TfrmCustomForm)
    pnlImportar: TPanel;
    Panel1: TPanel;
    Image: TImage;
    ntbPasos: TNotebook;
    lstProcesos: TImageListBox;
    Label2: TLabel;
    Bevel1: TBevel;
    edReporte: TRichEdit;
    Image2: TImage;
    btnCancelar: TButton;
    btnAnterior: TButton;
    btnSiguiente: TButton;
    lbProceso: TLabel;
    fraProceso: TfraCodigoDescripcion;
    lbDirectorio: TLabel;
    edDirectorio: TDirectoryEdit;
    Label4: TLabel;
    sbParametros: TScrollBox;
    clbExportar: TCheckListBox;
    Label5: TLabel;
    lbOpcionesGenerales: TLabel;
    BevelOpcionesGenerales: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Animate: TAnimate;
    ilBullets: TImageList;
    sdqConsultas: TSDQuery;
    sdqExportacion: TSDQuery;
    QueryToFile: TQueryToFile;
    lbRegistro: TLabel;
    ProgressBar: TProgressBar;
    chkMostrarProgreso: TCheckBox;
    lbArchivo: TLabel;
    lbRegistro2: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    DBFileReader: TDBFileReader;
    sbArchivos: TScrollBox;
    pmnuProcesos: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuLimpiarlaSeleccion: TMenuItem;
    mnuInvertirlaSeleccion: TMenuItem;
    btnImprimirReporte: TSpeedButton;
    sdqCombo: TSDQuery;
    dsCombo: TDataSource;
    XMLTransformProvider: TXMLTransformProvider;
    ClientDataSet: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure OnNavegadorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sdqExportacionAfterScroll(DataSet: TDataSet);
    procedure QueryToFileBeforeExportRecord(Sender: TObject; var Cancel: Boolean);
    procedure QueryToFileAfterExportRecord(Sender: TObject);
    procedure sdqExportacionBeforeScroll(DataSet: TDataSet);
    procedure DBFileReaderExecuteSql(Sender: TObject; Sql: TCustomSql);
    procedure mnuProcesosSeleccion(Sender: TObject);
    procedure btnImprimirReporteClick(Sender: TObject);
    procedure DBFileReaderStreamRead(Sender: TObject; Value: String; Position, Size: Integer);
  private
    FAcciones        : TExportActions;
    FConditionParser : TConditionParser;
    FErrIgnore       : Integer;   {Cantidad registros ignorados por Errores en los Eventos}
    FErrSkip         : Integer;   {Cantidad registros salteados por Errores en los Eventos}
    FEventParams     : TParams;
    FEventos         : TExportActions;
    FLogFile         : TLogFile;  {Archivo con el Log de Errores}
    FParamList       : TList;
    FPathList        : TList;
    FReadPath        : String;
    FReadPathOriginal: String;
    FRecCount        : Integer;
    FTableList       : TList;
    FTransaction     : Integer;

    function BeforeChangePage(iPage: Integer; var iNewPage: Integer): Boolean;
    function ValidatePage(iPage: Integer): Boolean;
    procedure AfterChangePage(iPage: Integer);
    procedure ArmarParametros;
    procedure DestroyParametros;

    function ProcesarExportacion: Boolean;
    procedure CargarAcciones;
    procedure CargarAccionesSeleccionadas;
    procedure DoLimpiarAcciones;
    procedure RecuperarValorParametros(ADataSet: TSDQuery; AParams: TParams);

    function DispararEventos(Moment: TMoment; ADataLine: String = ''): Boolean;
    procedure ArmarConsulta(Query: TSDQuery; Params: TParams; ExportAction: TExportAction);
    procedure CargarCampos(Archivo: Integer; ACampos: TCollection);
    procedure CargarEventos(ExpFiles: TExpFiles);
    procedure ExportarArchivo(ExpFiles: TExpFiles);
    procedure LeerArchivo(ExpFiles: TExpFiles);

    procedure DoArmarSeleccionArchivos;
    procedure DoLimpiarSeleccionArchivos;

    procedure DescomprimirArchivo(AFileName, AOutputPath: String);

    function  GetCheckComboValues: String;
    procedure DeleteTempFiles;
    procedure LoadDBCheckComboBoxLastValues;
    procedure ProcesoChange(Sender: TObject);
    procedure SaveDBCheckComboBoxLastValues;

    {function IsValidParam( AParamName : String ) : boolean;}
  public
    TempFiles: TStringList;

    function Execute(AProceso: TTableId): Boolean; overload;
    function Execute(AProceso: String): Boolean; overload;
  end;

  {$IFDEF VER150}
  function ZipCallBack(ZCallbackRec: PZCallBackStruct): LongBool; stdcall;
  {$ENDIF}

  function ImpoExpoWizard(AProceso: TTableId): Boolean; overload;
  function ImpoExpoWizard(AProceso: String): Boolean; overload;

implementation

uses
  SDCommon, CustomDlgs, General, unDmPrincipal, unPrincipal, StrFuncs, AnsiSql, Math, unImpoExpo, unRtti, ArchFuncs,
  unArjDll, Numeros, unParams, FileCtrl, unImpoExpoUtils;

const
  MIN_LEFT      = 130; {Mínima posición izquierda de los Parametros y Archivos}

  IMG_EMPTY     = 0;
  IMG_WAIT      = 1;
  IMG_OK        = 2;
  IMG_ERROR     = 3;
  IMG_SAVE      = 4;
  IMG_PROCEDURE = 5;
  IMG_FUNCTION  = 6;
  IMG_DISABLED  = 7;

  PAGE_DIRECTORIO = 0;
  PAGE_PARAMETROS = 1;
  PAGE_TABLAS     = 2;
  PAGE_ARCHIVOS   = 3;
  PAGE_PROCESOS   = 4;
  PAGE_REPORTE    = 5;
  PAGE_FIN        = 6;

  LOG_EXTENCION   = '.LOG';

  DBCHECKCOMBOBOX_PREFIX = 'COMBO_';
  DBCOMBOBOX_PREFIX = 'COMBO_SIMPLE_';

resourcestring
  TXT_DESCOMPRIMIR = 'Descompresión del Archivo';

{$R *.DFM}
{$R *.RES}

function ImpoExpoWizard(AProceso: TTableId): Boolean;
begin
  with TfrmImpoExpoWizard.Create(Application) do
  try
    Result := Execute(AProceso);
  finally
    Free;
  end;
end;

function ImpoExpoWizard(AProceso: String): Boolean;
begin
  with TfrmImpoExpoWizard.Create(Application) do
  try
    Result := Execute(AProceso);
  finally
    Free;
  end;
end;

{$IFDEF VER150}
function ZipCallBack(ZCallbackRec: PZCallBackStruct): LongBool;
begin
  with ZCallbackRec^, TfrmImpoExpoWizard(ZCallbackRec^.Caller) do
  begin
    case ActionCode of
      1:
      begin
        TempFiles.Add( IncludeTrailingBackslash(GetCurrentDir) + FileNameOrMsg);
        ProgressBar.Visible := True;
        ProgressBar.Max     := FileSize;
        lbRegistro.Caption  := FileNameOrMsg;
        lbRegistro2.Caption := IntToStr(FileSize) + ' Bytes';
        Application.ProcessMessages;
      end;
      2:  ProgressBar.StepBy(FileSize);
      {3:  Fin del proceso}
      4:
      begin
        edReporte.Lines.Add('   ' + FileNameOrMsg);
//              edReporte.Lines.Add( '   ' + Format('%-12s %dKB', [FileNameOrMsg, FileSize]) );
             {Fin del Archivo}
        lbRegistro.Caption  := '';
        lbRegistro2.Caption := '';
        ProgressBar.Visible := False;
      end;
    end;
  end;
  Result := False;
end;
{$ENDIF}

procedure TfrmImpoExpoWizard.ProcesoChange(Sender: TObject);
begin
  edDirectorio.Text := FormStorage.ReadString(fraProceso.AsString + '_DIRECTORIO', FormStorage.ReadString('edDirectorio_Text', ''));
end;

procedure TfrmImpoExpoWizard.FormCreate(Sender: TObject);
begin
  inherited;

  ntbPasos.PageIndex := PAGE_DIRECTORIO;

  with fraProceso do
  begin
    Sql :=
      'SELECT pr_id ' + CD_ALIAS_ID + ',' +
            ' pr_codigo ' + CD_ALIAS_CODIGO + ',' +
            ' pr_descripcion ' + CD_ALIAS_DESC + ',' +
            ' pr_fechabaja ' + CD_ALIAS_BAJA + ',' +
            ' pr_parametoscondicion,' +
            ' pr_modolectura' +
       ' FROM ipr_proceso, ipu_procesousuario' +
      ' WHERE pr_id = pu_idproceso' +
        ' AND pu_usuario = ''' + {$IFDEF SQLSERVER}dmPrincipal.dbLogin.UserId{$ELSE}frmPrincipal.DBLogin.UserID{$ENDIF} + '''';
    TableName   := 'ipr_proceso';
    FieldID     := 'pr_id';
    FieldCodigo := 'pr_codigo';
    FieldDesc   := 'pr_descripcion';
    FieldBaja   := 'pr_fechabaja';

    {$IFDEF ART2}
      Value     := FormStorage.ReadInteger('Proceso', -1);
    {$ELSE}
      Value     := IntToSTr(FormStorage.ReadInteger('Proceso', -1));
    {$ENDIF}
    OnChange := ProcesoChange;
  end;

  ProcesoChange(nil);
  FConditionParser := TConditionParser.Create;
  FConditionParser.AutoParams := False;

  FParamList   := TList.Create;
  FTableList   := TList.Create;
  FPathList    := TList.Create;
  FAcciones    := TExportActions.Create;
  FEventos     := TExportActions.Create;
  FEventParams := TParams.Create;
  FLogFile     := TLogFile.Create;
  TempFiles    := TStringList.Create;

  Animate.ResName := 'CLOCK';

  {$IFDEF SQLSERVER}
  Animate.Hint    := '';
  {$ELSE}{$IFDEF MSACCESS}
  Animate.Hint    := '';
  {$ELSE}
  Animate.Hint    := ValorSql('SELECT ''Proceso: '' || spid || '' Sesión: '' || audsid' +
                               ' FROM v$session, v$process' +
                              ' WHERE paddr = addr' +
                                ' AND audsid = USERENV(''SESSIONID'')');
  {$ENDIF}{$ENDIF}
end;

procedure TfrmImpoExpoWizard.FormDestroy(Sender: TObject);
begin
  {$IFDEF ART2}
    FormStorage.WriteInteger('Proceso', fraProceso.Value);
  {$ELSE}
    FormStorage.WriteInteger('Proceso', StrToInt(fraProceso.Value));
  {$ENDIF}

  FormStorage.WriteString(fraProceso.AsString + '_DIRECTORIO', edDirectorio.Text);
  SaveDBCheckComboBoxLastValues;
  DestroyParametros;
  DoLimpiarAcciones;
  DeleteTempFiles;

  FConditionParser.Free;
  FParamList.Free;
  FTableList.Free;
  FPathList.Free;
  FAcciones.Free;
  FEventos.Free;
  FEventParams.Free;
  FLogFile.Free;
  TempFiles.Free;

   {PRUEBA}
   {sdqExportacion.Free;
   QueryToFile.Free ;
   sdqConsultas.Free ;
   }
  inherited;
end;

procedure TfrmImpoExpoWizard.btnCancelarClick(Sender: TObject);
begin
  if fsModal in FormState then
  begin
    if Sender = btnCancelar then
      ModalResult := mrCancel
    else
      ModalResult := mrOk;
  end
  else
    Close;
end;

function TfrmImpoExpoWizard.ValidatePage(iPage: Integer): Boolean;
var
  iLoop: Integer;
begin
  Result := False;
  try
    case iPage of
      0:
      begin
        if fraProceso.IsEmpty then
          InvalidMsg(fraProceso.edCodigo, 'Debe seleccionar el proceso.')

//        else if not (FileGetAttr(edDirectorio.Text)  = faDirectory) Then
        else if not DirectoryExists(edDirectorio.Text) then
          InvalidMsg(edDirectorio, 'El directorio de exportación es inexistente.')

        else
          Result := True;

      end;
      1:
      begin { Siempre carga los Parametros del ConditionParser, porque despues son utilizados para los Querys }
        for iLoop := 0 to FParamList.Count - 1 do
          with PParamRecord(FParamList[iLoop])^ do
            with FConditionParser.Params.ParamByName(ParamName) do
            begin
              DataType  := FieldType;
              ParamType := ptInputOutput;
              if (Editor is TCustomEdit) and (TCustomEdit(Editor).Text = '') then
                Value := Null
              else
                case FieldType of
                  ftString:
                  begin
                    if Editor is TDBLookupComboBox then
                      if VarIsNull(TDBLookupComboBox(Editor).KeyValue) then
                        AsString := ''
                      else
                        AsString := TDBLookupComboBox(Editor).KeyValue
                    else if Editor is TDBCheckCombo then
                      AsString := TDBCheckCombo(Editor).InSql2
                    else if Editor is TPatternEdit then
                    begin
                      if Length(TPatternEdit(Editor).Text) > 255 then
                      begin
                        DataType := ftMemo;
                        Value := TPatternEdit(Editor).Text;
                      end
                      else
                        AsString := TPatternEdit(Editor).Text;
                    end
                    else if Editor is TPeriodoPicker then
                      AsString := TPeriodoPicker(Editor).Text;
                  end;
                  ftInteger:  AsInteger := TIntEdit(Editor).Value;
                  ftFloat:    AsFloat := TCurrencyEdit(Editor).Value;
                  ftDate:
                    if TDateComboBox(Editor).Date = 0 then
                      Value := Null
                    else
                      AsDateTime  := TDateComboBox(Editor).Date;

                  ftDateTime:
                    if TDateTimeEditor(Editor).DateTime = 0 then
                      Value := Null
                    else
                      AsDateTime := TDateTimeEditor(Editor).DateTime;

                  ftTime:
                    if TTimeEditor(Editor).Time = 0 then
                      Value := Null
                    else
                      AsDateTime := TTimeEditor(Editor).Time;

                  ftBoolean:
                    AsString := IIF(TCheckBox(Editor).Checked, 'S', 'N');
                end;
            end;
        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
        if FConditionParser.Condition = '' then
           Result := True
        else
           Result := FConditionParser.Result;
      end;
      2: Result := True;
      3: Result := True;
      4: Result := True;
      5: Result := True;
    end;
  except
    on E: Exception do
    begin
      ErrorMsg(E);
      Result := False;
    end;
  end;
end;

{--[ Libera Todos los objetos creados para mostrar los parámetros y limpia la lista ]----------------------------------}
procedure TfrmImpoExpoWizard.DestroyParametros;
var
  iLoop: Integer;
begin
  for iLoop := 0 to FParamList.Count - 1 do
    with PParamRecord(FParamList[iLoop])^ do
    begin
      case FieldType of
        ftString, ftInteger, ftDate, ftTime, ftDateTime, ftFloat, ftMemo:
          if Editor is TDBLookupComboBox then
            FormStorage.WriteString(fraProceso.AsString + '_Param_' + ParamName, TDBLookupComboBox(Editor).KeyValue)
          else if Editor is TPeriodoPicker then
            FormStorage.WriteString(fraProceso.AsString + '_Param_' + ParamName, TPeriodoPicker(Editor).Text)
          else
            FormStorage.WriteString(fraProceso.AsString + '_Param_' + ParamName, TCustomEdit(Editor).Text);

//      ftFloat: FormStorage.WriteInteger('Param_' + ParamName, TCurrencyEdit( Editor ).Value )
        ftBoolean:  FormStorage.WriteString(fraProceso.AsString + '_Param_' + ParamName, IIF(TCheckBox(Editor).Checked, 'S', 'N'));
//      ftDate:   TDateComboBox( Editor ).Date;
      end;
      Caption.Free;
      Editor.Free;
      Dispose(PParamRecord(FParamList[iLoop]))
    end;
  FParamList.Clear;
end;

procedure TfrmImpoExpoWizard.ArmarParametros;
var
  AFieldType: TFieldType;
  bEsQuery: Boolean;
  bGetQuery: Boolean;
  fFecha: Extended;
  ParamRecord: PParamRecord;
  sdqParametros: TSDQuery;
  sSql: String;
  sTipo: String;
  vPos: Integer;       // Posición Vertical (se usa para ubicar los controles en la pantalla)
  vValor: Variant;
  objDataSourceAux: TDataSource;
  objDataSetAux: TSDQuery;

  function GetSQLforSELECT: String;
  begin
    Result := sdqParametros.FieldByName('pp_default').AsString
  end;

  function GetOldValue: String;
  begin
    if bEsQuery then
    begin
      if not VarIsNull(vValor) then
        Result := vValor
    end
    else if bGetQuery then
      Result := sdqParametros.FieldByName('pp_default').AsString
    else
      if sdqParametros.FieldByName('pp_tipo').AsString = 'K' then
        Result := FormStorage.ReadString(fraProceso.AsString + '_Param_' + ParamRecord.ParamName, '-1')
      else
        Result := FormStorage.ReadString(fraProceso.AsString + '_Param_' + ParamRecord.ParamName,
                                         sdqParametros.FieldByName('pp_default').AsString);
  end;
begin
    DestroyParametros;
    FConditionParser.Condition := fraProceso.sdqDatos.FieldByName('pr_parametoscondicion').AsString;
    FConditionParser.Params.Clear;

    { Carga los Parámetros por Defecto }
    FConditionParser.Params.CreateParam(ftString,   PARAM_USER, ptInput).AsString        := frmPrincipal.DBLogin.LoginName;
    FConditionParser.Params.CreateParam(ftString,   PARAM_WINUSER, ptInput).AsString     := frmPrincipal.DBLogin.WindowsUser;
    FConditionParser.Params.CreateParam(ftString,   PARAM_WINPC, ptInput).AsString       := frmPrincipal.DBLogin.WindowsComputerName;
    FConditionParser.Params.CreateParam(ftDateTime, PARAM_STARTTIME, ptInput).AsDateTime := DBDateTime;
    FConditionParser.Params.CreateParam(ftString,   PARAM_PROCESS, ptInput).AsString     := fraProceso.edCodigo.Text;
    FConditionParser.Params.CreateParam(ftString,   PARAM_OUTPUT_PATH, ptInput).AsString := edDirectorio.Text;
{
    FConditionParser.Params.CreateParam(ftString,   PARAM_IE_PROCESO, ptInput).AsString  := '';
    FConditionParser.Params.CreateParam(ftString,   PARAM_IE_ARCHIVO, ptInput).AsString  := '';
    FConditionParser.Params.CreateParam(ftString,   PARAM_IE_ORDEN, ptInput).AsString    := '';
}
    vPos := 1;
    sSql :=
      '  SELECT pp_codigo, pp_descripcion, pp_tipo, pp_visible, pp_default' +
         ' FROM ipp_procesoparametro' +
        ' WHERE pp_idproceso = :idproceso' +
          ' AND pp_fechabaja IS NULL' +
     ' ORDER BY pp_orden';

    sdqParametros := GetQueryEx(sSql, [fraProceso.Value]);
    try
      while not sdqParametros.Eof do
      begin
        bEsQuery := False;
        bGetQuery := False;

        {-----------------------------------------------------------------------------------------------------------}
        { Crea los editores para que el usuario pueda cargar los valores de los parametros -------------------------}
        {-----------------------------------------------------------------------------------------------------------}
        if sdqParametros.FieldByName('pp_visible').AsString = 'S' then
        begin
          New(ParamRecord);
          ParamRecord.ParamName       := sdqParametros.FieldByName('pp_codigo').AsString;

          ParamRecord.Caption         := TLabel.Create(Self);
          ParamRecord.Caption.Parent  := sbParametros;
          ParamRecord.Caption.Caption := sdqParametros.FieldByName('pp_descripcion').AsString;
          ParamRecord.Caption.Left    := 0;
          ParamRecord.Caption.Top     := (vPos * 27) + 6;
          ParamRecord.Caption.Visible := True;

          sTipo := sdqParametros.FieldByName('pp_tipo').AsString;

          if sTipo = 'Q' then
          begin
            bGetQuery := True;
            with GetQuery(GetOldValue) do
            try
              if not IsEmpty then
              begin
                if RecordCount > 1 then
                  raise Exception.Create('La consulta del valor por default del parámetro devolvió mas de un registro.');

                bEsQuery := True;
                vValor := Fields[0].Value;

                case Fields[0].DataType of
                  ftString, ftFmtMemo, ftMemo, ftFixedChar, ftWideString: sTipo := 'C';
                  ftSmallint, ftInteger, ftLargeint, ftWord:              sTipo := 'N';
                  ftFloat, ftCurrency, ftBCD:                             sTipo := 'L';
                  ftDate, ftTime, ftDateTime:
                  begin
                    fFecha := Fields[0].AsFloat;

                    if GetDecimales(fFecha) > 0 then
                    begin
                      if Trunc(fFecha) = 0 then
                        sTipo := 'T'
                      else
                        sTipo := 'DT';
                    end
                    else
                      sTipo := 'D';
                  end;
                  ftBoolean:  sTipo := 'B';
                  ftUnknown:  raise Exception.Create('El tipo de dato de la consulta del valor por default del parámetro es incorrecto.');
                end;
              end;
            finally
              Free;
            end;
          end;

          { Esto habría que cambiarlo por unParams.GetParamEditorClass y unParams.ParamInitializeEditor }
          case ArrayPos(sTipo, TIPO_DATOS) of
            TD_FIX_STRING, TD_VAR_STRING:
            begin
              ParamRecord.Editor    := TPatternEdit.Create(Self);
              ParamRecord.FieldType := ftString;

              TPatternEdit(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_INTEGER:
            begin
              ParamRecord.Editor    := TIntEdit.Create(Self);
              ParamRecord.FieldType := ftInteger;

              TIntEdit(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_LONG:
            begin
              ParamRecord.Editor    := TCurrencyEdit.Create(Self);
              ParamRecord.FieldType := ftFloat;

              TCurrencyEdit(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_DATE:
            begin
              ParamRecord.Editor    := TDateComboBox.Create(Self);
              ParamRecord.FieldType := ftDate;

              TDateComboBox(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_PERIODO:
            begin
              ParamRecord.Editor    := TPeriodoPicker.Create(Self);
              ParamRecord.FieldType := ftString;
              with TPeriodoPicker(ParamRecord.Editor) do
              begin
                Periodo.AllowNull := True;
                Periodo.Separador := #0;
                Text := GetOldValue;
              end;
            end;
            TD_BOOLEAN:
            begin
              ParamRecord.Editor    := TCheckBox.Create(Self);
              with TCheckBox(ParamRecord.Editor) do
              begin
                Height := 21;
                Caption := 'Si / No';
                Checked := GetOldValue = 'S';
              end;
              ParamRecord.FieldType := ftBoolean;
            end;
            TD_DATETIME:
            begin
              ParamRecord.Editor    := TDateTimeEditor.Create(Self);
              ParamRecord.FieldType := ftDateTime;

              TDateTimeEditor(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_TIME:
            begin
              ParamRecord.Editor    := TTimeEditor.Create(Self);
              ParamRecord.FieldType := ftTime;

              TTimeEditor(ParamRecord.Editor).Text := GetOldValue;
            end;
            TD_COMBO:
            begin
              bGetQuery := True;
              ParamRecord.Editor := TDBCheckCombo.Create(Self);
              with TDBCheckCombo(ParamRecord.Editor) do
              begin
                Name := 'dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX;
                Parent := sbParametros;

                DataSource := dsCombo;
                sdqCombo.SQL.Text := GetOldValue;
                sdqCombo.Open;

                KeyField := 'ID';
                ListField := 'DESCRIPCION';
                Width := Parent.Width - Max(ParamRecord.Caption.Width + 5, MIN_LEFT) - 20;
                Anchors := Anchors + [akRight];
              end;
              ParamRecord.FieldType := ftString;

              // Cargo los valores por defecto que usó el TDBCheckCombo por última vez para este proceso..
              LoadDBCheckComboBoxLastValues;
            end;
            TD_COMBO_SIMPLE:
            begin
              ParamRecord.Editor := TDBLookupComboBox.Create(Self);
              with TDBLookupComboBox(ParamRecord.Editor) do
              begin
                Name := DBCOMBOBOX_PREFIX + IntToStr(sdqParametros.RecNo {$IFDEF VER150}+ 1{$ENDIF});
                Parent := sbParametros;

                objDataSourceAux := TDataSource.Create(sbParametros);
                objDataSetAux := TSDQuery.Create(sbParametros);
                objDataSetAux.DatabaseName := 'dbPrincipal';
                ListSource := objDataSourceAux;
                objDataSourceAux.DataSet := objDataSetAux;

                with objDataSetAux do
                begin
                  SQL.Text := GetSQLforSELECT;
                  Open;
                end;

                KeyField := 'ID';
                ListField := 'DESCRIPCION';

                KeyValue := GetOldValue;

                Width := Parent.Width - Max(ParamRecord.Caption.Width + 5, MIN_LEFT) - 20;
                Anchors := Anchors + [akRight];
              end;
              ParamRecord.FieldType := ftString;

              // Cargo los valores por defecto que usó el TDBLookupComboBox por última vez para este proceso..
              //LoadDBLookupComboBoxLastValues;
            end;
          else
            raise Exception.Create('Tipo de dato Erróneo al crear los parámetros.');
          end;

          ParamRecord.Editor.Parent        := sbParametros;
          ParamRecord.Editor.Left          := 0;
          ParamRecord.Editor.Top           := vPos * 27;
          ParamRecord.Editor.Left          := Max(ParamRecord.Caption.Width + 5, MIN_LEFT);
          ParamRecord.Editor.Visible       := True;
          ParamRecord.Caption.FocusControl := ParamRecord.Editor;

          FParamList.Add(ParamRecord);
          Inc(vPos);

          AFieldType := ParamRecord.FieldType;
        end
        else
          AFieldType := ParamToFieldType(sdqParametros.FieldByName('pp_tipo').AsString);


        {-----------------------------------------------------------------------------------------------------------}
        { Crea el parámetro en el ConditionParser que despues se va a usar para los Querys -------------------------}
        {-----------------------------------------------------------------------------------------------------------}
        with FConditionParser.Params.CreateParam(AFieldType, sdqParametros.FieldByName('pp_codigo').AsString, ptInputOutput) do
        begin
          if sdqParametros.FieldByName('pp_visible').AsString <> 'S' then
          begin
            Value := sdqParametros.FieldByName('pp_default').Value;
            DataType := AFieldType; { Lo vuelve a asignar porque la propiedad Value lo resetea }

            ///revisar aca....

            if (sdqParametros.FieldByName('pp_default').Value <> Unassigned) and
               (sdqParametros.FieldByName('pp_default').Value <> Null) and
               (sdqParametros.FieldByName('pp_default').AsString <> '  /  /    ') then
              Value := sdqParametros.FieldByName('pp_default').Value;
(*
            if DataType in [ftString, ftFmtMemo, ftMemo, ftFixedChar, ftWideString] then
            begin
              Value := sdqParametros.FieldByName('pp_default').AsString;
              DataType := AFieldType; { Lo vuelve a asignar porque la propiedad Value lo resetea }
              Size := 4000;
            end;
*)
          end;
        end;
        {-----------------------------------------------------------------------------------------------------------}

        sdqParametros.Next;
      end;
    finally
      sdqParametros.Free;
    end;
end;

procedure TfrmImpoExpoWizard.OnNavegadorClick(Sender: TObject);
var
  //iLastIndex,
  iNewIndex: Integer;
begin
  if ValidatePage(ntbPasos.PageIndex) and (Sender is TButton) then
  begin
    iNewIndex := ntbPasos.PageIndex + TButton(Sender).Tag;
//      iLastIndex := iNewIndex;
    if BeforeChangePage(ntbPasos.PageIndex, iNewIndex) then
    begin
      ntbPasos.PageIndex := iNewIndex;

      // Habilita o deshabilita los botones cuando se encuentra en los extremos
      btnAnterior.Enabled := (ntbPasos.PageIndex <> 0);
//         btnSiguiente.Enabled := (ntbPasos.PageIndex <> ntbPasos.Pages.Count - 1);
      if ntbPasos.PageIndex = ntbPasos.Pages.Count - 1 then
      begin
        btnSiguiente.Caption := '&Finalizar';
        btnSiguiente.OnClick := btnCancelarClick;
      end
      else
      begin
        btnSiguiente.Caption := '&Siguiente >>';
        btnSiguiente.OnClick := OnNavegadorClick;
      end;

//         if iLastIndex = iNewIndex Then
      AfterChangePage(iNewIndex)
    end;
  end;
end;

function TfrmImpoExpoWizard.BeforeChangePage(iPage: Integer; var iNewPage: Integer): Boolean;
begin
  Result := True;
  if iPage > iNewPage then
    case iPage of
      PAGE_TABLAS:
        if FParamList.Count = 0 then
          iNewPage := PAGE_DIRECTORIO
        else
          iNewPage := PAGE_PARAMETROS;
      PAGE_PARAMETROS, PAGE_PROCESOS, PAGE_ARCHIVOS, PAGE_REPORTE:  iNewPage := PAGE_DIRECTORIO;
      PAGE_FIN:
        if edReporte.Text <> '' then
          iNewPage := PAGE_REPORTE
        else
          iNewPage := PAGE_DIRECTORIO;
  end
  else
    case iNewPage of
      PAGE_PARAMETROS:
      begin
        ArmarParametros;
        if FParamList.Count = 0 then
        begin
          iNewPage := iNewPage + 1;
          BeforeChangePage(iNewPage - 1, iNewPage);
        end;
      end;
      PAGE_TABLAS:
      begin
        CargarAcciones;
        if clbExportar.Items.Count < 1 then
        begin
          iNewPage := iNewPage + 1;
          BeforeChangePage(iNewPage - 1, iNewPage);
        end;
        // Sino hace todos los pasos
      end;
      PAGE_ARCHIVOS:
      begin
        DoArmarSeleccionArchivos;
        if FPathList.Count = 0 then
        begin
          iNewPage := iNewPage + 1;
          BeforeChangePage(iNewPage - 1, iNewPage);
        end;
      end;
      PAGE_PROCESOS:
      begin
        DoLimpiarSeleccionArchivos;
        CargarAccionesSeleccionadas;
        if lstProcesos.Items.Count > 0 then
          Animate.Active := True
        else
          Result := False;
      end;
      PAGE_REPORTE: Inc(iNewPage);
//            PAGE_FIN:     Result := True;
    end;
end;

procedure TfrmImpoExpoWizard.AfterChangePage(iPage: Integer);
begin
  case iPage of
    PAGE_PARAMETROS:  SelectNext(sbParametros, True, True);
    PAGE_ARCHIVOS:    SelectNext(sbArchivos, True, True);
    PAGE_PROCESOS:
      try
        DeleteTempFiles;
        if ProcesarExportacion then
        begin
          if edReporte.Text <> '' then
            ntbPasos.PageIndex := PAGE_REPORTE
          else
            ntbPasos.PageIndex := PAGE_FIN;
        end
        else
          ntbPasos.PageIndex   := PAGE_DIRECTORIO;
      finally
        Animate.Active := False;
      end;
  end;
end;

procedure TfrmImpoExpoWizard.CargarAcciones;
var
  ExportAction: TExportAction;
  iNewItem    : Integer;
begin
  DoLimpiarAcciones;
  clbExportar.Items.Clear;
  FTableList.Clear;

  sdqConsultas.Close ;
  sdqConsultas.Sql.Text :=
    'SELECT pa_orden, pa_tipoaccion, pa_relacion, pa_opcional, ar_descripcion AS descripcion, ar_sql SQL,' +
          ' ''S'' usarparametros, ar_maxregistros, ar_archivonombre, ar_separador, ar_cal_texto, ar_eol, ar_eof,' +
          ' ar_filemustexists, ar_recreararchivo, ar_encabezado, ar_transaction, pa_tipoarchivo, ar_tabla,' +
          ' ar_log_errores, ar_archivofuncion' +
     ' FROM ipa_procesoaccion, iar_archivo' +
    ' WHERE pa_idproceso = :idproceso1' +
      ' AND pa_relacion = ar_id' +
      ' AND pa_tipoaccion = ' + SqlValue(TA_FILE) +
      ' AND ar_fechabaja IS NULL' +
    ' UNION ALL ' +
   ' SELECT pa_orden, pa_tipoaccion, pa_relacion, pa_opcional, ps_descripcion descripcion, ps_sql sql,' +
          ' ps_usarparametros usarparametros,' +
          {$IFDEF SQLSERVER}{$ELSE}{$IFDEF MSACCESS}{$ELSE}' TO_NUMBER' + {$ENDIF}{$ENDIF} '(NULL) AS ar_maxregistros,' +
          ' NULL ar_archivonombre, NULL ar_separador, NULL ar_cal_texto, NULL ar_eol, NULL ar_eof,' +
          ' NULL ar_filemustexists, NULL ar_recreararchivo, NULL ar_encabezado, 0 ar_transaction,' +
          ' pa_tipoarchivo, NULL ar_tabla, NULL ar_log_errores, NULL ar_archivofuncion' +
     ' FROM ipa_procesoaccion, ips_procesoserver' +
    ' WHERE pa_idproceso = :idproceso2' +
      ' AND pa_relacion = ps_id' +
      ' AND pa_tipoaccion = ' + SqlValue(TA_PROCESS) +
      ' AND ps_fechabaja IS NULL' +
 ' ORDER BY 1';
  OpenQueryEx(sdqConsultas, [fraProceso.Value, fraProceso.Value]);

  while not sdqConsultas.EOF do
  begin
    if sdqConsultas.FieldByName('pa_tipoaccion').AsString = TA_PROCESS then
    begin
      ExportAction := TExpProcess.Create;
    end
    else
    begin { Archivo TA_FILE }
      ExportAction := TExpFiles.Create;
      with TExpFiles(ExportAction) do
      begin
        FileId         := sdqConsultas.FieldByName('pa_relacion').AsInteger;
        MaxRecords     := sdqConsultas.FieldByName('ar_maxregistros').AsInteger;
        FileName       := sdqConsultas.FieldByName('ar_archivonombre').AsString;
        FunctionName   := sdqConsultas.FieldByName('ar_archivofuncion').AsString;
        Separator      := GetChar(sdqConsultas.FieldByName('ar_separador').AsString);
        Quote          := GetChar(sdqConsultas.FieldByName('ar_cal_texto').AsString);
        EOLChar        := GetChar(sdqConsultas.FieldByName('ar_eol').AsString);
        EOFChar        := GetChar(sdqConsultas.FieldByName('ar_eof').AsString);
        FileMustExists := (sdqConsultas.FieldByName('ar_filemustexists').AsString = 'S');
        RecreateFile   := (sdqConsultas.FieldByName('ar_recreararchivo').AsString = 'S');
        SaveHeaders    := (sdqConsultas.FieldByName('ar_encabezado').AsString     = 'S');
        Transaction    := sdqConsultas.FieldByName('ar_transaction').AsInteger;
        TableName      := sdqConsultas.FieldByName('ar_tabla').AsString;
        LogErrors      := (sdqConsultas.FieldByName('ar_log_errores').AsString    = 'S');
        FileMode       := CharToFileMode(GetChar(sdqConsultas.FieldByName('pa_tipoarchivo').AsString));
      end;
    end;

    ExportAction.Title      := sdqConsultas.FieldByName('descripcion').AsString;
    ExportAction.Sql        := sdqConsultas.FieldByName('sql').AsString;
    ExportAction.ParamCheck := sdqConsultas.FieldByName('usarparametros').AsString = 'S';
    FAcciones.Add(ExportAction);

    if (sdqConsultas.FieldByName('pa_opcional').AsString = 'S') then
    begin
      iNewItem := clbExportar.Items.AddObject(ExportAction.Title, ExportAction);
      clbExportar.Checked[iNewItem] := FormStorage.ReadString(fraProceso.AsString + ' ' + ExportAction.Title, 'N') = 'S';
    end;

    sdqConsultas.Next;
  end;
end;

procedure TfrmImpoExpoWizard.DoLimpiarAcciones;
var
  iLoop: Integer;
begin
  for iLoop := 0 to clbExportar.Items.Count - 1 do
    FormStorage.WriteString(fraProceso.AsString + ' ' + TExportAction(clbExportar.Items.Objects[iLoop]).Title,
                            IIF(clbExportar.Checked[iLoop], 'S', 'N'));

   FAcciones.Clear;
   clbExportar.Clear;
end;

procedure TfrmImpoExpoWizard.CargarAccionesSeleccionadas;
var
  iCheckIndex: Integer;
  iLoop: Integer;
  iNewItem: Integer;
begin
  lstProcesos.Items.Clear;

  if GetChar(fraProceso.sdqDatos.FieldByName('pr_modolectura').AsString) = PML_ZIP then
    lstProcesos.Items.Add(TXT_DESCOMPRIMIR);

  for iLoop := 0 to FAcciones.Count - 1 do
  begin
    iCheckIndex := clbExportar.Items.IndexOfObject(FAcciones[iLoop]);
    if (iCheckIndex = -1) or clbExportar.Checked[iCheckIndex] then
    begin
      iNewItem := lstProcesos.Items.Add(FAcciones[iLoop].Title);
      lstProcesos.Items.Objects[iNewItem] := TImgIndex.Create;
      with lstProcesos.Items.Objects[iNewItem] as TImgIndex do
        UserObject := FAcciones[iLoop];
    end;
  end;
end;

function TfrmImpoExpoWizard.ProcesarExportacion: Boolean;
var
  iLoop: Integer;
  sArchivoCompr: String;
begin
  btnAnterior.Enabled  := False;
  btnSiguiente.Enabled := False;
  btnCancelar.Enabled  := False;
  try
    edReporte.Lines.Add('Proceso: ' + fraProceso.cmbDescripcion.Text);
    edReporte.Lines.Add('Fecha y Hora de Inicio: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',
                        FConditionParser.Params.ParamByName(PARAM_STARTTIME).AsDateTime));
    edReporte.Lines.Add('--------------------------------------------');

    {$IFDEF SQLSERVER}
    sdqExportacion.UniDirectional := False ; {***** ME PARECE QUE ESTO SE CORRIGIÓ CON EL NUEVO SQLDIRECT!!!!*****}
    {$ELSE}
    sdqExportacion.UniDirectional := not chkMostrarProgreso.Checked;
    {$ENDIF}
    Result := True;
    for iLoop := 0 to lstProcesos.Items.Count - 1 do
    begin
      lstProcesos.ItemImage[iLoop] := IMG_WAIT; { Esto tiene que correr antes que el With, porque ahí crea el Objeto }
      with lstProcesos.Items.Objects[iLoop] as TImgIndex do
      try
        try
          Application.ProcessMessages;

          if (not Assigned(UserObject)) and (lstProcesos.Items[iLoop] = TXT_DESCOMPRIMIR) then
          begin
            sArchivoCompr := FReadPath;
            DescomprimirArchivo(sArchivoCompr, TempPath);
          end

          else if (UserObject is TExpFiles) and (TExpFiles(UserObject).FileMode = fmRead) then
          begin
            edReporte.Lines.Add('Archivo ' + lstProcesos.Items[iLoop]);
            LeerArchivo(TExpFiles(UserObject));
            edReporte.Lines.Add(#9 + 'Registros Procesados:       ' + IntToStr(FRecCount));

            if FErrIgnore > 0 then
              edReporte.Lines.Add(#9 + 'Registros con Advertencias: ' + IntToStr(FErrIgnore));

            if FErrSkip > 0 Then
              edReporte.Lines.Add(#9 + 'Registros no Procesados:    ' + IntToStr(FErrSkip));
          end
          else
          begin
            ArmarConsulta(sdqExportacion, FConditionParser.Params, TExpFiles(UserObject));
            edReporte.Lines.Add('Archivo ' + lstProcesos.Items[iLoop]);
            if UserObject is TExpFiles then
            begin
              QueryToFile.Fields.Clear;
              lbRegistro.Caption := 'Abriendo Consulta';
              Application.ProcessMessages;
              OpenQuery(sdqExportacion); //.Open;
              if not sdqExportacion.IsEmpty then
              begin
                lbRegistro.Caption := 'Contando Registros';
                Application.ProcessMessages;
                ExportarArchivo(TExpFiles(UserObject));
                sdqExportacion.Close;
                edReporte.Lines.Add(#9 + 'Registros Procesados:       ' + IntToStr(FRecCount));
                if FErrIgnore > 0 then
                  edReporte.Lines.Add(#9 + 'Registros con Advertencias: ' + IntToStr(FErrIgnore));
                if FErrSkip > 0 then
                  edReporte.Lines.Add(#9 + 'Registros no Procesados:    ' + IntToStr(FErrSkip));
              end
              else
                edReporte.Lines.Add(#9 + 'No se encontraron registros para procesar.');
            end
            else
            begin
              try
                BeginTrans;
                sdqExportacion.ExecSQL;
                RecuperarValorParametros(sdqExportacion, FConditionParser.Params);
                CommitTrans;
              except
                on E: Exception do
                begin
                  Rollback(True);
                  raise;
                end;
              end;
              edReporte.Lines.Add(lstProcesos.Items[iLoop] + ', terminó satisfactoriamente (' + IntToStr(sdqExportacion.RowsAffected)+ ').');
            end;
          end;
          lstProcesos.ItemImage[iLoop] := IMG_OK;
          edReporte.Lines.Add('');
        except
          on E: Exception do
          begin
            Result := False;
            lstProcesos.ItemImage[iLoop] := IMG_ERROR;
            edReporte.Lines.Add(lstProcesos.Items[iLoop] + ', Error:' + E.Message);
            MsgBox('Error al ejecutar el proceso "' + lstProcesos.Items[iLoop] + '"' + #13 + #13 + E.Message, MB_ICONERROR);
            Break;
          end;
        end;
      finally
        //
      end;
    end; { NEXT I }
  finally
    btnAnterior.Enabled  := True;
    btnSiguiente.Enabled := True;
    btnCancelar.Enabled  := True;

    FLogFile.CloseFile;
    edReporte.Lines.Add('--------------------------------------------' );
    edReporte.Lines.Add('Proceso Terminado');
    edReporte.Lines.Add('Fecha y Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', DBDateTime));
    edReporte.Lines.Add('Tiempo de Proceso: ' + FormatDateTime('hh:nn:ss', DBDateTime - FConditionParser.Params.ParamByName(PARAM_STARTTIME).AsDateTime));
    edReporte.Lines.Add('');
  end;
end;

procedure ClearParamsError(AQuery: TSDQuery);
var
  i: integer;
begin
  with AQuery do
  for i := Params.Count -1 downto 0 do
    if (Params[i].Name = '=') or
       (Params[i].Name = '') then
      Params.Delete(i);
end;

procedure TfrmImpoExpoWizard.ArmarConsulta(Query: TSDQuery; Params: TParams; ExportAction: TExportAction);
var
  iLoop: Integer;
  Param: TParam;
begin
  Query.Close;
  Query.Params.Clear;

  {$IFDEF ART2}
  ExportAction.Sql := ReeplaceComboParams(fraProceso.Value, ExportAction.Sql, GetCheckComboValues);
  {$ELSE}
  ExportAction.Sql := ReeplaceComboParams(StrToIntDef(fraProceso.Value, 0), ExportAction.Sql, GetCheckComboValues);
  {$ENDIF}

  if ExportAction.ParamCheck then
  begin
    Query.ParamCheck := True;
    Query.Params.Assign(Params);
  end
  else
    Query.ParamCheck := False;

  CopySqlClp(ExportAction.Sql);
  Query.SQL.Text := ExportAction.Sql;
  Query.Prepare;

  { Esto es porque cuando se setea el Sql todos los parámetros InputOutput mágicamente pasan a ser Input }
  for iLoop := High(PARAMETROS_FIJOS) - 1 to Params.Count - 1 do
  begin
    Param := Query.Params.FindParam(Params[iLoop].Name);
    if Assigned(Param) and (Param.ParamType <> Params[iLoop].ParamType) then
      Param.ParamType := Params[iLoop].ParamType;
  end;

  ClearParamsError(Query);
end;

procedure TfrmImpoExpoWizard.ExportarArchivo(ExpFiles: TExpFiles);
var
  {i,}
  iFileCount: Integer; // Numero de Archivo
  sFileName: String;
  sSql: String;
  sTempFileName: String;
begin
  with ExpFiles do
  begin
    QueryToFile.MaxRecords   := MaxRecords;
    QueryToFile.SaveHeaders  := SaveHeaders;
    QueryToFile.Separator    := Separator;
    QueryToFile.Quote        := Quote;
    QueryToFile.EOLChar      := EOLChar;
    QueryToFile.EOFChar      := EOFChar;
    QueryToFile.RecreateFile := RecreateFile;
    CargarEventos(ExpFiles); { By Fede 11/09/2002 (Esto estaba debajo de CargarCampos)}
    CargarCampos(FileId, QueryToFile.Fields);


    sdqExportacionAfterScroll(sdqExportacion);
    ProgressBar.Visible := chkMostrarProgreso.Checked;
    try
      FRecCount := 0;
      if FTransaction > -1 then
        BeginTrans;
      try
        DispararEventos(mFileBefore);
        if FileMode = fmWrite then
        begin
          iFileCount   := 1; // Comienza a numerar los archivos desde el 1
          repeat
            if Pos('%s', ExpFiles.FileName) > 0 then
              lbArchivo.Caption := Format(ExpFiles.FileName, [IntToBase(iFileCount)])
            else if Pos('@funcion@', LowerCase(ExpFiles.FileName)) > 0 then
            begin
              sSql := Format('SELECT %s FROM DUAL', [ExpFiles.FunctionName]);
              lbArchivo.Caption := StringReplace(ExpFiles.FileName, '@funcion@', ValorSql(sSql), []);
            end
            else
              lbArchivo.Caption := Format(ExpFiles.FileName, [iFileCount]);
            sFileName         := IncludeTrailingBackslash(edDirectorio.Text) + lbArchivo.Caption;
            lbArchivo.Hint    := sFileName;

            if FileMustExists and FileExists(sFileName) then
              raise Exception.Create('No se ha encontrado el archivo "' + sFileName + '" y este archivo es requerido para generar la exportación.');

            if LogErrors then
              FLogFile.FileName := sFileName + LOG_EXTENCION
            else
              FLogFile.FileName := '';

            FErrIgnore := 0;
            FErrSkip   := 0;

            if FEventos.Count > 0 then
            begin
              FEventParams.ParamByName(PARAM_FILENAME).Value := sFileName;
            end;

            sTempFileName := IncludeTrailingPathDelimiter(TempPath) + ExtractFileName(sFileName);

            if QueryToFile.SaveFile(sTempFileName) then
            begin
              if not MoveFile(sTempFileName, sFileName) then
               raise Exception.Create('No se pudo copiar el archivo "' + sTempFileName + '".');

              Inc(iFileCount);
              if FTransaction > -1 then
              CommitTrans(True);

              edReporte.Lines.Add(#9 + 'Archivo Generado: ' + sFileName);
            end
            else
              raise Exception.Create('Error al generar el archivo "' + sTempFileName + '".');
          until sdqExportacion.Eof
        end
        else if FileMode = fmQuery then
          while not sdqExportacion.Eof do
          begin
            sdqExportacion.Next;
            DispararEventos(mRecordBefore, DBFileReader.LastLine);
            DispararEventos(mRecordAfter,  DBFileReader.LastLine);
            if FTransaction > -1 then
              CommitTrans(True);
          end;

        DispararEventos(mFileAfter);
      except
        if FTransaction > -1 then
          RollBack(True);
        raise;
      end;
    finally
      lbArchivo.Caption   := '';
      lbArchivo.Hint      := '';
      lbRegistro.Caption  := '';
      lbRegistro2.Caption := '';
      ProgressBar.Visible := False;

      FEventos.Clear;      {Limpia los eventos para que no los cargue cuando abre un nuevo query}
      FEventParams.Clear;
    end;
  end;
end;

procedure TfrmImpoExpoWizard.CargarCampos(Archivo: Integer; ACampos: TCollection);
var
  sSql: String;
  sdqCampos: TSDQuery;
begin
  ACampos.Clear;
  sSql :=
    'SELECT   ac_titulo, ac_nombre, ac_alineacion, ac_fillchar, ac_ancho, ac_condicion' +
       ' FROM iac_archivocampo' +
      ' WHERE ac_idarchivo = :idarchivo' +
   ' ORDER BY ac_orden';
  sdqCampos := GetQueryEx(sSql, [Archivo]);
  try
    repeat
      FConditionParser.Condition := Trim(sdqCampos.FieldByName('ac_condicion').AsString);
      if (FConditionParser.Condition = '') or FConditionParser.Result then
      begin
        if ACampos is TQTFFields then
          with TQTFField(ACampos.Add) do { Archivos de Escritura }
          begin
            Title       := sdqCampos.FieldByName('ac_titulo').AsString;
            FixedLength := sdqCampos.FieldByName('ac_ancho').AsInteger;
            case GetChar(sdqCampos.FieldByName('ac_alineacion').AsString) of
              'R': Alignment := taRightJustify;
              'L': Alignment := taLeftJustify;
              'C': Alignment := taCenter;
            end;
            FillChar := GetChar(sdqCampos.FieldByName('ac_fillchar').AsString);
            if FillChar = #0 then
              FillChar := ' ';
            DataField := sdqCampos.FieldByName('ac_nombre').AsString;
          end
        else if ACampos is TDBFileReaderFields then { Archivos de Lectura }
          with TDBFileReaderField(ACampos.Add) do
          begin
            DataField := sdqCampos.FieldByName('ac_nombre').AsString;
            Length    := sdqCampos.FieldByName('ac_ancho').AsInteger;
            case GetChar(sdqCampos.FieldByName('ac_alineacion').AsString) of
              'R': Trim := [ttLeft];
              'L': Trim := [ttRight];
              'C': Trim := [ttLeft, ttRight];
            end;
            FEventParams.CreateParam(ftString, FIELD_PARAM + DataField, ptInput); //ptUnknown
          end;
      end;

      sdqCampos.Next;
    until sdqCampos.Eof;
  finally
    sdqCampos.Free;
  end;
end;

procedure TfrmImpoExpoWizard.sdqExportacionAfterScroll(DataSet: TDataSet);
var
  i: Integer;
begin
  if chkMostrarProgreso.Checked then
  begin
    lbRegistro.Caption   := 'Reg: ' + IntToStr(DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) + '/' + IntToStr(DataSet.RecordCount);
    lbRegistro2.Caption  := 'Exp:' + IntToStr(FRecCount) + '/' + IntToStr(QueryToFile.RecNo);
    ProgressBar.Max      := DataSet.RecordCount;
    ProgressBar.Position := DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF};
  end
  else
  begin
    lbRegistro.Caption   := 'Reg: ' + IntToStr(DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF});
    lbRegistro2.Caption  := 'Exp:' + IntToStr(FRecCount) + '/' + IntToStr(QueryToFile.RecNo);
  end;

  if FEventos.Count > 0 then
  begin
    { Asigna los valores de los campos a los parámetros de los Eventos }
    for i := 0 to DataSet.Fields.Count - 1 do
      FEventParams.ParamByName(FIELD_PARAM + DataSet.Fields[I].FieldName).Value := DataSet.Fields[I].Value;

    FEventParams.ParamByName(PARAM_EV_RECNUMBER).AsInteger := DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF};
    FEventParams.ParamByName(PARAM_EV_RECPROC).AsInteger   := FRecCount;
    FEventParams.ParamByName(PARAM_EV_ERRRORCOUNT).Value   := DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF} - FRecCount;
  end;

  Application.ProcessMessages;
end;

procedure TfrmImpoExpoWizard.CargarEventos(ExpFiles: TExpFiles);
var
  ExpEvent: TExpEvent;
  i       : Integer;
  Param   : TParam;

  function GetParam(AParamName: String): TParam;
  begin
    Result := FConditionParser.Params.FindParam(AParamName);
    if not Assigned(Result) then
      Result := FConditionParser.Params.CreateParam(ftString, AParamName, ptInput);
  end;

begin
  FEventos.Clear;

  sdqConsultas.Close;
  sdqConsultas.Sql.Text :=
    'SELECT   ae_momento, ae_accionerror, ae_sql, ae_usarparametros' +
       ' FROM iae_archivoevento' +
      ' WHERE ae_idarchivo = :idarchivo' +
        ' AND ae_fechabaja IS NULL' +
        ' AND ae_tipoaccion IN(''B'', :tipoaccion)' +
   ' ORDER BY ae_orden';
  OpenQueryEx(sdqConsultas, [ExpFiles.FileId, FileModeToChar(ExpFiles.FileMode)]);

  while not sdqConsultas.Eof do
  begin
    ExpEvent := TExpEvent.Create;

    case ArrayPos(sdqConsultas.FieldByName('ae_momento').AsString, TE_MOMENTOS) of
      0:  ExpEvent.Moment := mFileBefore;
      1:  ExpEvent.Moment := mFileAfter;
      2:  ExpEvent.Moment := mRecordBefore;
      3:  ExpEvent.Moment := mRecordAfter;
    end;

    case ArrayPos(sdqConsultas.FieldByName('ae_accionerror').AsString, ['C', 'S', 'I', 'M']) of
      0:  ExpEvent.ErrorAction := eaHalt;
      1:  ExpEvent.ErrorAction := eaSkipRecord;
      2:  ExpEvent.ErrorAction := eaIgnore;
      3:  ExpEvent.ErrorAction := eaMessage;
    end;

    ExpEvent.Sql        := sdqConsultas.FieldByName('ae_sql').AsString;
    ExpEvent.ParamCheck := sdqConsultas.FieldByName('ae_usarparametros').AsString = SQL_TRUE;

    FEventos.Add(ExpEvent);

    sdqConsultas.Next;
  end;
  sdqConsultas.Close;

  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  GetParam(PARAM_ACTIONMODE).AsString     := IIF(ExpFiles.FileMode = fmRead, 'R', 'W');
  GetParam(PARAM_FILENAME).AsString       := '';
  GetParam(PARAM_FILENAME_COMPR).AsString := '';

  FEventParams.Clear;
  if FEventos.Count > 0 then
  begin
    FTransaction := ExpFiles.Transaction;

    { Crea los Parámetros para los Eventos }
    FEventParams.Assign(FConditionParser.Params);
//       FEventParams.CreateParam( ftString, PARAM_ACTIONMODE, ptUnknown ).AsString := IIF(ExpFiles.FileMode = fmRead, 'R', 'W');

    { Crea los parámetros porpios de los eventos }
    FEventParams.CreateParam(ftInteger, PARAM_EV_RECNUMBER, ptInput);
    FEventParams.CreateParam(ftInteger, PARAM_EV_RECPROC, ptInput);
    FEventParams.CreateParam(ftInteger, PARAM_EV_ERRRORCOUNT, ptInput);

    for i := 0 to sdqExportacion.Fields.Count - 1 do
    begin
      Param := TParam.Create(FEventParams);
      Param.Name      := FIELD_PARAM + sdqExportacion.Fields[I].FieldName;
      Param.DataType  := sdqExportacion.Fields[I].DataType;
      Param.ParamType := ptInput;

      FEventParams.AddParam(Param);
    end;

    //Param := Nil;
  end
  else
    FTransaction := -1;
end;

function TfrmImpoExpoWizard.DispararEventos(Moment: TMoment; ADataLine: String = ''): Boolean;
var
  iEv: Integer;
  sErr: String;
begin
  Result := True;
  sErr   := 'Inicio';

  for iEv := 0 to FEventos.Count - 1 do
  begin
    if TExpEvent(FEventos[iEv]).Moment = Moment then
    try
      Application.ProcessMessages;
      sErr := 'Armando Consulta';
      ArmarConsulta(sdqConsultas, FEventParams, FEventos[iEv]);
      sErr := 'Ejecutando Consulta';
      sdqConsultas.ExecSQL;

      RecuperarValorParametros(sdqConsultas, FEventParams);
      RecuperarValorParametros(sdqConsultas, FConditionParser.Params);

      if Moment = mRecordAfter then
        Inc(FRecCount);

      sErr := '';
    except
      on E: Exception do
      begin
        if sErr <> '' then
          sErr := #13 + sErr;

        case TExpEvent(FEventos[iEv]).ErrorAction of
          eaIgnore:
          begin
            if FLogFile.FileName <> '' then
            begin
              if ADataLine <> '' then
                FLogFile.WriteLine(ADataLine);
              FLogFile.WriteLine('#Atención - ' + E.Message + sErr);
            end;
            Inc(FErrIgnore);
          end;

          eaHalt:
          begin
            RollBack(True);
            if (E is ESDEngineError) and (ESDEngineError(E).ErrorCode >= 20000) and (ESDEngineError(E).ErrorCode <= 20999) then
              raise Exception.Create((Trim(Copy(Trim(StringReplace(StringReplace(StringReplace(Trim(E.Message), #10, '', [rfReplaceAll]), #13, ' ', [rfReplaceAll]), 'ORA-06512: at line', #13#10 + #13#10 + 'Información adicional para Sistemas: Error detectado en la línea de código número', [rfReplaceAll])), Pos(':', E.Message) + 1, MaxInt))) + #13#10)
            else
              raise Exception.Create('Error al Ejecutar el Evento' + #13 +  E.Message + sErr + ' - Al procesar la linea ' +
                                      IntToStr(DBFileReader.RecNo));
          end;

          eaSkipRecord:
          begin
            if FLogFile.FileName <> '' then
            begin
              if ADataLine <> '' then
                FLogFile.WriteLine(ADataLine);
              if (E is ESDEngineError) and (ESDEngineError(E).ErrorCode >= 20000) and (ESDEngineError(E).ErrorCode <= 20999) then
                FLogFile.WriteLine(Trim(Copy(Trim(StringReplace(StringReplace(StringReplace(Trim(E.Message), #10, '', [rfReplaceAll]), #13, ' ', [rfReplaceAll]), 'ORA-06512: at line', #13#10 + 'Información adicional para Sistemas: Error detectado en la línea de código número', [rfReplaceAll])), Pos(':', E.Message) + 1, MaxInt)) + #13#10)
              else
                FLogFile.WriteLine('#Error - ' + E.Message + sErr);
            end;
            Inc(FErrSkip);
            Result := False;
            Break;
          end;

          eaMessage:
          begin
            if MsgBox(E.Message + #13 + #13 + 'Si desea continuar con el proceso, presione Aceptar, de lo contrario Cancelar.', MB_OKCANCEL + MB_ICONEXCLAMATION) = IDCANCEL then
            begin
              RollBack(True);
              raise;
            end;
          end;
        end;{Case}
      end;
    end;
  end;
end;

procedure TfrmImpoExpoWizard.QueryToFileBeforeExportRecord(Sender: TObject; var Cancel: Boolean);
begin
  Cancel := not DispararEventos(mRecordBefore);
end;

procedure TfrmImpoExpoWizard.QueryToFileAfterExportRecord(Sender: TObject);
begin
  DispararEventos(mRecordAfter);
  Inc(FRecCount);
end;

procedure TfrmImpoExpoWizard.sdqExportacionBeforeScroll(DataSet: TDataSet);
begin
  if (FTransaction > 0) and (((integer(QueryToFile.RecNo) - 1) mod FTransaction) = 0) then
  begin
    CommitTrans(True);
    BeginTrans;
  end
end;

procedure SaveAsCSV(AFileName: string; ADataSet: TDataSet; AIncludeTitles: Boolean = False);
var
  iLoop: integer;
  sAux: string;
  tfTextFile: TextFile;
begin
  //create a new file
  AssignFile(tfTextFile, AFileName);
  Rewrite(tfTextFile);

  sAux := ''; //initialize empty string

  try
    if AIncludeTitles then //write field names (as column headers)
      for iLoop := 0 to ADataSet.FieldCount - 1 do
        sAux := sAux + Format('"%s";', [ADataSet.Fields[iLoop].FieldName]);

    Writeln(tfTextFile, sAux);

    //write field values
    while not ADataSet.Eof do
    begin
      sAux := '';

      for iLoop := 0 to ADataSet.FieldCount - 1 do
        sAux := sAux + Format('"%s";', [ADataSet.Fields[iLoop].AsString]);

      Writeln(tfTextfile, sAux);
      ADataSet.Next;
    end;
  finally
    CloseFile(tfTextFile);
  end;
end;

procedure TfrmImpoExpoWizard.LeerArchivo(ExpFiles: TExpFiles);
var
  iFileCount: Integer; // Numero de Archivo
  sFileName: String;
  sTempFileName: String;
  sTempXmlFileName: String;
  tslTemporaryfile: TStringList;
begin
  with ExpFiles do
  begin
//    DBFileReader.MaxRows     := MaxRecords;
    DBFileReader.Sql.TableName := TableName;

    if SaveHeaders then
      DBFileReader.HeaderRows := 1
    else
      DBFileReader.HeaderRows := 0;

    if (Separator = #0) and (Quote = #0) then
      DBFileReader.FileType  := ftFixed
    else
    begin
      DBFileReader.FileType  := ftSeparated;
      DBFileReader.Separator := Separator;
      DBFileReader.Quote     := Quote;
    end;

    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --}
    CargarEventos(ExpFiles);
//       if DBFileReader.FileType = ftFixed Then {Carga los campos igual porque ahí arma los parámetros}
    CargarCampos(ExpFiles.FileId, DBFileReader.Fields);

    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --}
    ProgressBar.Visible := True;
    try
      FRecCount    := 0;
      if FTransaction > -1 then
        BeginTrans;
      try
        iFileCount := 1; // Comienza a numerar los archivos desde el 1
        sFileName  := '';

        if FEventos.Count > 0 then
          FEventParams.ParamByName(PARAM_FILENAME_COMPR).Value := ExtractFileName(FReadPathOriginal);

        DispararEventos(mFileBefore);
        repeat
          if ExpFiles.FullFileName <> '' then
          begin
            if iFileCount > 1 then
              Break; {Solo un Archivo}
            sFileName := ExpFiles.FullFileName;
          end
          else
          begin
            if sFileName = FReadPath + Format(ExpFiles.FileName, [iFileCount]) then
              Break; {Solo un Archivo}
            sFileName := FReadPath + Format(ExpFiles.FileName, [iFileCount]);
          end;
//                      sFileName := IncludeTrailingBackslash( edDirectorio.Text ) + Format(ExpFiles.FileName, [iFileCount]);

          lbArchivo.Caption := Format(ExpFiles.FileName, [iFileCount]);
          lbArchivo.Hint    := sFileName;

          if FileExists(sFileName) then
          begin
            if LogErrors then
              FLogFile.FileName := sFileName + LOG_EXTENCION
            else
              FLogFile.FileName := '';

            FErrIgnore := 0;
            FErrSkip   := 0;

            if FEventos.Count > 0 then
            begin
              FEventParams.ParamByName(PARAM_FILENAME).Value := sFileName;
              // FEventParams.ParamByName( PARAM_FILENAME_COMPR ).Value := ExtractFileName(FReadPathOriginal);
            end;

            if UpperCase(ExtractFileExt(sFileName)) = '.XML' then
            begin
              with XMLTransformProvider, ClientDataSet do
              try
                sTempFileName := IncludeTrailingPathDelimiter(TempPath) + ExtractFileName(sFileName);
                CopyFileExt(sFileName, sTempFileName, False);

                tslTemporaryfile := TStringList.Create;
                try
                  BlobSql('SELECT ar_xmltransformationfile FROM impoexpo.iar_archivo WHERE ar_id = ' + IntToStr(ExpFiles.FileId), tslTemporaryfile);
                  sTempXmlFileName := IncludeTrailingPathDelimiter(TempPath) + 'XMLTransformationFile_' + IntToStr(ExpFiles.FileId) + '.xml';
                  tslTemporaryfile.SaveToFile(sTempXmlFileName);
                  TransformRead.TransformationFile := sTempXmlFileName;
                finally
                  tslTemporaryfile.Free;
                end;

                XMLDataFile := sTempFileName;
                Open;
                SaveAsCSV(sTempFileName, ClientDataSet);
                sFileName := sTempFileName;
              finally
                DeleteFile(sTempXmlFileName);
              end;
            end;

            if DBFileReader.ReadFile(sFileName) then
            begin
              Inc(iFileCount);
              if FTransaction > -1 then
                CommitTrans(True);

              edReporte.Lines.Add(#9 + 'Archivo Leido: ' + sFileName);
            end
            else
              raise Exception.CreateFmt('Error al leer el archivo ''%s''', [sFileName]);
          end;
        until not FileExists(sFileName);
        DispararEventos(mFileAfter);
        RecuperarValorParametros(sdqConsultas, FConditionParser.Params);
        CommitTrans(True);
      except
        if FTransaction > -1 then
          RollBack(True);
        raise;
      end;
    finally
      lbArchivo.Caption   := '';
      lbArchivo.Hint      := '';
      lbRegistro.Caption  := '';
      lbRegistro2.Caption := '';
      ProgressBar.Visible := False;
      DeleteFile(sTempFileName);
      FEventos.Clear;      {Limpia los eventos para que no los cargue cuando abre un nuevo query}
      FEventParams.Clear;
    end;
  end;
end;

procedure TfrmImpoExpoWizard.DoArmarSeleccionArchivos;
var
  iCheckIndex : Integer;
  iLoop       : Integer;
  PathRecord  : PPathRecord;
  sModoLectura: Char;
  vPos        : Integer;       // Posición Vertical (se usa para ubicar los controles en la pantalla)

  procedure AddPathRecord(AAccion: TExpFiles; ACaption, AText, AFilter: String);
  begin
    New(PathRecord);

    PathRecord.Accion          := AAccion;

    PathRecord.Caption         := TLabel.Create(Self);
    PathRecord.Caption.Parent  := sbArchivos;
    PathRecord.Caption.Caption := ACaption;
    PathRecord.Caption.Left    := 0;
    PathRecord.Caption.Top     := (vPos * 27) + 6;
    PathRecord.Caption.Visible := True;

    if sModoLectura = PML_PATH then
    begin
      PathRecord.Editor                            := TDirectoryEdit.Create(Self);
      TDirectoryEdit(PathRecord.Editor).DialogKind := dkWin32;
    end
    else
    begin
      PathRecord.Editor                            := TFileNameEdit.Create(Self);
      TFileNameEdit(PathRecord.Editor).Filter      := AFilter + '|' + '|Todos los Archivos (*.*)|*.*';
    end;

    PathRecord.Editor.Parent  := sbArchivos;
    PathRecord.Editor.Top     := vPos * 27;
    PathRecord.Editor.Left    := Max(PathRecord.Caption.Width + 5, MIN_LEFT);
    PathRecord.Editor.Width   := sbArchivos.Width - PathRecord.Editor.Left;
    PathRecord.Editor.Anchors := [akLeft, akTop, akRight];
    PathRecord.Editor.Visible := True;

    PathRecord.Editor.Text    := AText;

    PathRecord.Caption.FocusControl := PathRecord.Editor;

      FPathList.Add(PathRecord);
      Inc(vPos);
   end;

begin
  sModoLectura := GetChar(fraProceso.sdqDatos.FieldByName('pr_modolectura').AsString);

  if FPathList.Count > 0 then
    DoLimpiarSeleccionArchivos;

{
var i,
    iCheckIndex : Integer;
begin
    lstProcesos.Items.Clear ;
    for i := 0 to FAcciones.Count -1 do begin
      iCheckIndex := clbExportar.Items.IndexOfObject( FAcciones[i] );
      if (iCheckIndex = -1) or clbExportar.Checked[iCheckIndex] Then
          lstProcesos.Items.AddObject( FAcciones[i].Title, FAcciones[i] );
    end;
}

  if sModoLectura = PML_FILES then
  begin
    for iLoop := 0 to FAcciones.Count - 1 do
    begin
      iCheckIndex := clbExportar.Items.IndexOfObject(FAcciones[iLoop]);
      if ((iCheckIndex = -1) or clbExportar.Checked[iCheckIndex]) and
         (FAcciones[iLoop] is TExpFiles) and (TExpFiles(FAcciones[iLoop]).FileMode = fmRead) then
            AddPathRecord(TExpFiles(FAcciones[iLoop]), TExpFiles(FAcciones[iLoop]).Title,
                          FormStorage.ReadString(fraProceso.AsString + ' Path ' + TExpFiles(FAcciones[iLoop]).Title, ''),
                          Format(TExpFiles(FAcciones[iLoop]).FileName, [1]) + '|' + Format(TExpFiles(FAcciones[iLoop]).FileName, [1]))
    end;
    FReadPath := '';
    FReadPathOriginal := '';
  end
  else
  begin
    for iLoop := 0 to FAcciones.Count - 1 do
    begin
      iCheckIndex := clbExportar.Items.IndexOfObject(FAcciones[iLoop]);
      if ((iCheckIndex = -1) or clbExportar.Checked[iCheckIndex]) and (FAcciones[iLoop] is TExpFiles) and
          (TExpFiles(FAcciones[iLoop]).FileMode = fmRead) then
      begin
        if sModoLectura = PML_ZIP then
          AddPathRecord(nil, 'Archivo', FormStorage.ReadString(fraProceso.AsString + ' Compressed File ' , ''),
                        'Archivos Comprimidos|*.zip;*.arj')
        else { PML_PATH }
          AddPathRecord(nil, 'Directorio de Lectura', FormStorage.ReadString(fraProceso.AsString + ' Path ' , ''), '' );

        Break;
      end;
    end; {Next i}
  end;
end;

procedure TfrmImpoExpoWizard.DoLimpiarSeleccionArchivos;
var
  iLoop: Integer;
  sModoLectura: Char;
begin
  sModoLectura := GetChar(fraProceso.sdqDatos.FieldByName('pr_modolectura').AsString);

  for iLoop := 0 to FPathList.Count - 1 do
  begin
    with PPathRecord(FPathList[iLoop])^ do
    begin
      Editor.Text := StringReplace(Editor.Text, '"', '', [rfReplaceAll]);

      FReadPathOriginal := Editor.Text;

      if sModoLectura = PML_FILES then
      begin
        Accion.FullFileName := Editor.Text;
        FormStorage.WriteString(fraProceso.AsString + ' Path ' + Accion.Title, Accion.FullFileName);
      end
      else if sModoLectura = PML_ZIP then
      begin
        FReadPath := Editor.Text;
        FormStorage.WriteString(fraProceso.AsString + ' Compressed File ', FReadPath);
      end
      else
      begin { PML_PATH }
        FReadPath := IncludeTrailingBackslash(Editor.Text);
        FormStorage.WriteString(fraProceso.AsString + ' Path ', FReadPath);
      end;
      Caption.Free;
      Editor.Free;
    end;
    Dispose(PPathRecord(FPathList[iLoop]));
  end;
  FPathList.Clear;
end;

procedure TfrmImpoExpoWizard.DBFileReaderExecuteSql(Sender: TObject; Sql: TCustomSql);
var
  iLoop: Integer;
begin
  Inc(FTransaction);

  { Carga los Valores de los parámetros por Campo }
  if FEventos.Count > 0 then
  begin
    for iLoop := 0 to Sql.Fields.Count - 1 do
      FEventParams.ParamByName(FIELD_PARAM + Sql.Fields[iLoop].FieldName).Value := Sql.Fields[iLoop].Value;

    // esto lo puse porque sino me tomaba el valor del campo del registro anterior, cuando lee menos campos en el registro que los esperados
    for iLoop := Sql.Fields.Count to DBFileReader.Fields.count - 1 do
      FEventParams.ParamByName(FIELD_PARAM + DBFileReader.Fields[iLoop].datafield).Value := '';

    FEventParams.ParamByName(PARAM_EV_RECNUMBER).AsInteger   := DBFileReader.RecNo;
    FEventParams.ParamByName(PARAM_EV_RECPROC).AsInteger     := FRecCount;
    FEventParams.ParamByName(PARAM_EV_ERRRORCOUNT).AsInteger := DBFileReader.RecNo - FRecCount;

    DispararEventos(mRecordBefore, DBFileReader.LastLine);
  end;

  if Sql.TableName <> '' then
  begin
    EjecutarSqlST(Sql.InsertSql);
    Inc(FRecCount);
  end;

  if (FTransaction > 0) and (((DBFileReader.RecNo - 1) mod FTransaction) = 0) then
  begin
    CommitTrans(True);
    BeginTrans;
  end;
  Application.ProcessMessages;

  if FEventos.Count > 0 then
    FEventParams.ParamByName(PARAM_EV_RECPROC).AsInteger := FRecCount;

  DispararEventos(mRecordAfter, DBFileReader.LastLine);
end;

{
function TfrmExportacion.IsValidParam(AParamName: String): boolean;
begin
     Result := not (GetChar(AParamName, 2) = '=');
end;
}

procedure TfrmImpoExpoWizard.mnuProcesosSeleccion(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to clbExportar.Items.Count - 1 do
    case TMenuItem(Sender).Tag of
      0:  clbExportar.Checked[iLoop] := True;
      1:  clbExportar.Checked[iLoop] := False;
      2:  clbExportar.Checked[iLoop] := not clbExportar.Checked[iLoop];
    end;
end;

procedure TfrmImpoExpoWizard.btnImprimirReporteClick(Sender: TObject);
begin
  edReporte.Print('Reporte del Proceso');
end;

procedure TfrmImpoExpoWizard.DBFileReaderStreamRead(Sender: TObject; Value: String; Position, Size: Integer);
begin
  ProgressBar.Max      := Size;
  ProgressBar.Position := Position;
  Application.ProcessMessages;
end;

procedure TfrmImpoExpoWizard.DescomprimirArchivo(AFileName, AOutputPath: String);
{$IFDEF VER150}
var
  hArjFile   : LongInt;
  HeaderData : TARJHeaderData;
  UnZipParms : TUnZipParms;
  iErrorCount: Integer;
  sFileName  : String;
const
  pthf: Array [Boolean] of Char = (' ', '+'); // path included?
  pwdf: Array [Boolean] of Char = (' ', 'G'); // plain, encrypted
  volf: Array [Boolean] of Char = (' ', 'V'); // continued in the next volume
  extf: Array [Boolean] of Char = (' ', 'X'); // start from prior volume
begin
  edReporte.Lines.Add('Descomprimiendo Archivo "' + AFileName + '"');
  edReporte.Lines.Add('');
  {*******************************************************************************************************************}
  if UpperCase(ExtractFileExt(AFileName)) = '.ARJ' then begin
  {*******************************************************************************************************************}
    try
      edReporte.Lines.Add('     Archivo     Tam.Orig  Tam.Compr. Porc.    Fecha y Hora      CRC-32  PMGVX');
      edReporte.Lines.Add('   ------------ ---------- ---------- ----- ------------------- -------- -----');
      iErrorCount := 0;
      AOutputPath := IncludeTrailingBackslash(AOutputPath);
      LoadUnARJ;
      if not IsUnARJLoaded then
        raise Exception.Create('Error al inizializar la librería UNARJ.DLL')
      else
        if ARJOpenArchive(PChar(AFileName), hArjFile) = ERROR_OK then
        begin
          while ARJReadHeader(hArjFile, HeaderData) = ERROR_OK do
          begin
            sFileName := AOutPutPath + ExtractFileName(HeaderData.FileName);
            if ARJProcessFile(hArjFile, ARJ_EXTRACT, nil, PChar(sFileName)) = ERROR_OK then
            begin
//                     edReporte.Lines.Add( '   ' + ExtractFileName(HeaderData.FileName) );
              edReporte.Lines.Add('   ' + Format('%-12s %8.2fKB %8.2fKB %1.3f %s %.8x %s%d%s%s%s',
                                                [
                                                  ExtractFileName(HeaderData.FileName),
                                                  HeaderData.UnpSize / 1024,
                                                  HeaderData.PackSize / 1024,
                                                  HeaderData.PackSize / HeaderData.UnpSize,
                                                  FormatDateTime('dd-mm-yyyy hh:mm:ss', FileDateToDateTime(HeaderData.FileTime)),
                                                  HeaderData.FileCRC,
                                                  pthf[HeaderData.EntryPos > 0],
                                                  HeaderData.Method,
                                                  pwdf[(HeaderData.Flags and GARBLE_FLAG) <> 0],
                                                  volf[(HeaderData.Flags and VOLUME_FLAG) <> 0],
                                                  extf[(HeaderData.Flags and EXTFILE_FLAG) <> 0]
                                                ]));
              TempFiles.Add(sFileName);
            end
            else
            begin
              edReporte.Lines.Add('   (!) Error al descomprimir el archivo ' + ExtractFileName(HeaderData.FileName));
              Inc(iErrorCount);
            end;
          end;
          if iErrorCount > 0 then
            raise Exception.Create('Se han producido errores al descomprimir el archivo "' + AFileName + '"')
        end;
    finally
      UnloadUnARJ;
    end;
  {*******************************************************************************************************************}
  end else if UpperCase(ExtractFileExt( AFileName )) = '.ZIP' Then begin  {-------------------------------------------}
  {*******************************************************************************************************************}
    SetCurrentDir(AOutputPath);
    LoadUnZip;
    if IsUnZipLoaded then
    try
      UnZipParms.up2 := AllocMem(SizeOf(TUnZipParms2));
      try
        with UnZipParms.up2^ do
        begin
          Version := UNZIPVERSION;      { Versión de la DLL }
          Caller  := Self;              { No usa el callback }
          fQuiet  := False;              { No usa el callback }
          ZCallbackFunc := ZipCallBack; { No usa el callback }
          Handle        := 0;
          fComments     := False;     { zipfile comments - not supported }
          fConvert      := False;     { ascii/EBCDIC conversion - not supported }

          pZipFileName  := PChar(AFileName);
          fDirectories  := False;
          fOverwrite    := True;
          fSeven := 7;
          fOverwrite := True;
          fArgc         := 0;
        end;
        UnzDllExec(Pointer(UnZipParms.up2));
      finally
        FreeMem(UnZipParms.up2);
      end;
    finally
      UnLoadUnZip;
    end;
//      Raise Exception.Create( 'ATENCIÓN: AUN NO SE HA DESARROLLADO EL SOPORTE DE ARCHIVOS ZIP.' );
  {*******************************************************************************************************************}
  end else
  {*******************************************************************************************************************}
    raise Exception.Create('El Tipo de archivo no es soportado por el sistema (' + UpperCase(ExtractFileExt(AFileName)) + ')');
{$ELSE}
begin
//  TZipFile.ExtractZipFile(AFileName, AOutputPath);   // no funciona al descomprimir archivo zip version DOS

  with TZipMaster.Create(Self) do
    begin
      ZipFileName := AFileName;
      FSpecArgs.Clear;
      TempDir     := AOutputPath;
      ExtrBaseDir := AOutputPath;
      ExtrOptions := [ExtrOverWrite];
      Extract;
    end;
{$ENDIF}

  FReadPath := AOutputPath;
end;

procedure TfrmImpoExpoWizard.DeleteTempFiles;
var
  iLoop: Integer;
begin
  for iLoop := 0 to TempFiles.Count - 1 do
  try
    DeleteFile(TempFiles[iLoop]);
  except
    on E: Exception do
      ErrorMsg(E, 'Error al borrar el Archivo "' + TempFiles[iLoop] + '".');
  end;

  TempFiles.Clear;
end;

function TfrmImpoExpoWizard.Execute(AProceso: TTableId): Boolean;
begin
  fraProceso.Value  :=       {$IFDEF ART2}AProceso{$ELSE}IntToStr(AProceso){$ENDIF};
  fraProceso.Locked := True;

  if fraProceso.IsEmpty then
    raise Exception.CreateFmt('El proceso "ID:%d" no existe, ha sido dado de baja o no esta habilitado para el usuario.', [AProceso]);

  Result := ShowModal = mrOk;
end;

function TfrmImpoExpoWizard.Execute(AProceso: String): Boolean;
begin
  fraProceso.Code := AProceso;
  fraProceso.Locked := True;

  if fraProceso.IsEmpty then
    raise Exception.CreateFmt('El proceso "%s" no existe, ha sido dado de baja o no esta habilitado para el usuario.', [AProceso]);

  Result := ShowModal = mrOk;
end;

procedure TfrmImpoExpoWizard.RecuperarValorParametros(ADataSet: TSDQuery; AParams: TParams);
var
  AParam: TParam;
  iLoop: Integer;
begin
  for iLoop := 0 to FConditionParser.Params.Count - 1 do
  begin
    AParam := ADataSet.Params.FindParam(AParams[iLoop].Name);
    if Assigned(AParam) then
      AParams[iLoop].Value := AParam.Value;
  end;
end;

procedure TfrmImpoExpoWizard.LoadDBCheckComboBoxLastValues;
var
  aCheckCombo: TDBCheckCombo;
  iLoop: Integer;
  sIds: String;
  sStr: string;
begin
  aCheckCombo := TDBCheckCombo(FindComponent('dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX));

  if aCheckCombo <> nil then    // Si existe el combo en el formulario..
  begin
    sIds := FormStorage.ReadString(DBCHECKCOMBOBOX_PREFIX + fraProceso.edCodigo.Text, '-1');
    Insert(',', sIds, 0);
    Insert(',', sIds, Length(sIds) + 1);

    aCheckCombo.DropDown;
    for iLoop := 0 to aCheckCombo.Count - 1 do
    begin
      sStr := ',' + aCheckCombo.ItemValue[iLoop] + ',';
      aCheckCombo.Checked[iLoop] := (Pos(sStr, sIds) > 0);
    end;
  end;
end;

procedure TfrmImpoExpoWizard.SaveDBCheckComboBoxLastValues;
var
  aCheckCombo: TDBCheckCombo;
begin
  aCheckCombo := TDBCheckCombo(FindComponent('dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX));

  if aCheckCombo <> nil then    // Si existe el combo en el formulario..
    FormStorage.WriteString(DBCHECKCOMBOBOX_PREFIX + fraProceso.edCodigo.Text, TDBCheckCombo(FindComponent('dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX)).InSql2)
end;

function TfrmImpoExpoWizard.GetCheckComboValues: String;
var
  aCheckCombo: TDBCheckCombo;
begin
  aCheckCombo := TDBCheckCombo(FindComponent('dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX));

  if aCheckCombo <> nil then    // Si existe el combo en el formulario..
    Result := TDBCheckCombo(FindComponent('dbcheckcombobox' + DBCHECKCOMBOBOX_PREFIX)).InSql2
  else
    Result := '0';
end;

end.
