unit unBusquedaControlVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, CheckLst, Mask, PatternEdit, ComboEditor,
  CheckCombo, ARTCheckListBox, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, MMSystem,
  RxPlacemnt, StrUtils;

type
  TfrmBusquedaControlVersion = class(TfrmCustomConsulta)
    Label1: TLabel;
    edBusqueda: TEdit;
    pnFile: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraProyecto: TfraStaticCodigoDescripcion;
    checkExtension: TARTCheckListBox;
    chkCaseSensitive: TCheckBox;
    chkSoloFuentesPropios: TCheckBox;
    chkSoloProyectosDelphi: TCheckBox;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDblClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
  	function ExtractZip2Source(ZipOwner: TComponent; const SourceFile: String; ZipFile: String; ModuleOrigTime: TDateTime = 0): Integer;
		function GetDataBlob(aAffectedFiles: String; const aCompSize, aExtension, aModuleName, aOrigTime: String; aBlobField: TBlobField): String;
    procedure Do_LimpiarBusqueda;
    procedure Do_AltaRegistroBusqueda(const aBlobId: Integer; Proyecto, PathModulo, aExtension: String);
    procedure Do_Busqueda(ValorBuscado: String; const aCaseSensitive: Boolean);
    function GetSqlExclusiones: String;
  public
  end;

var
  frmBusquedaControlVersion: TfrmBusquedaControlVersion;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, dbFuncs, unDmPrincipal, unComunes, StrFuncs, CustomDlgs, unJediFunctions, AbZipTyp,
  AbArcTyp, AbUnzPrc, ArchFuncs, unVerArchivoControlVersion;

{$R *.dfm}
{$R fin_busqueda.RES}

procedure TfrmBusquedaControlVersion.Do_AltaRegistroBusqueda(const aBlobId: Integer; Proyecto, PathModulo, aExtension: String);
begin
  with TSql.Create('FRB_RESULTADOBUSQUEDA') do
    try
      PrimaryKey.Add('RB_ID',             ValorSqlInteger('SELECT MAX(RB_ID) FROM FRB_RESULTADOBUSQUEDA') + 1);
      Fields.Add('RB_BLOBID',             aBlobId);
      Fields.Add('RB_USUARIO',            Sesion.UserID);
      Fields.Add('RB_PROYECTO',           Proyecto);
      Fields.Add('RB_PATHCOMPLETOMODULO', PathModulo);
      Fields.Add('RB_EXTENSION',          aExtension);

      SqlType := stInsert;

      EjecutarSql(Sql);
    finally
      Free;
    end;
end;

procedure TfrmBusquedaControlVersion.Do_LimpiarBusqueda;
begin
  Do_LimpiarTablaTemporal('FRB_RESULTADOBUSQUEDA', 'RB_USUARIO', Sesion.UserID);
end;

procedure TfrmBusquedaControlVersion.tbLimpiarClick(Sender: TObject);
var
	iLoop: Integer;
begin
  Do_LimpiarBusqueda;
  edBusqueda.Clear;
  chkCaseSensitive.Checked       := False;
  chkSoloFuentesPropios.Checked  := False;
  chkSoloProyectosDelphi.Checked := False;
	fraProyecto.Clear;

  for iLoop := 0 to checkExtension.Count - 1 do
  	checkExtension.Checked[iLoop] := False;

  inherited;
end;

function TfrmBusquedaControlVersion.GetSqlExclusiones: String;
begin
  Result := ' AND UPPER(pro.name) NOT LIKE ' + SqlValue('%D7.%') +
            ' AND UPPER(pro.name) NOT LIKE ' + SqlValue('%D5.%') +
            ' AND UPPER(pro.name) NOT IN (''CONTROLLER.DPR'', ''ADMCARPETAS7.DPR'', ''USUARIOS.DPR'', ' +
                                          '''AFINDEMES.DPR'', ''ALERTASCP.DPR'', ''ALERTASCTL.DPR'', ' +
                                          '''ALERTAS.DPR'', ''ARCH_AMP.DPR'', ''ARCHIVO.DPR'', ' +
                                          '''ART_AFI.DPR'', ''CEM_ORATOACC.DPR'', ''CHECKEARFORMATOMAIL.DPR'', ' +
                                          '''CITRIXUPDATE.DPR'', ''COTIZACIONEXT.DPR'', ''CURSOR.DPR'', ' +
                                          '''DOCUMENTADOR.DPR'', ''EDITORSQL.DPR'', ''EMISIONDEVEL.DPR'', ' +
                                          '''ESTADOCUENTAWEB.DPR'', ''ESTADODECUENTA.DPR'', ''EXPOPRODUCTORES.DPR'', ' +
                                          '''EXPORTXLS.DPR'', ''FAXCHECK.DPR'', ''FAXCLIENT.DPR'', ' +
                                          '''FIREBIRDEVENTS.DPR'', ''GENCOTIZ.DPR'', ''HYS_FET.DPR'', ' +
                                          '''IMPOEXPO.DPR'', ''IMPORTACIONTELEFONOSIVR.DPR'', ''IMPORTADORSRT.DPR'', ' +
                                          '''JOBTESTER.DPR'', ''LICITACIONES.DPR'', ''MANTRAB.DPR'', ' +
                                          '''MORFART_RANKING.DPR'', ''MORTALES.DPR'', ''PROCESARMAIL.DPR'', ' +
                                          '''PRUEBA.DPR'', ''REGISTROHORAS.DPR'', ''SERVICETEMPHUM.DPR'') ';
end;

procedure TfrmBusquedaControlVersion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraProyecto do
    begin
      TableName 	   := 'FUENTES.PROJECTS PRO';
      FieldID 		   := 'PROJECTID';
      FieldCodigo    := 'PROJECTID';
      FieldDesc 	   := 'NAME';
      OrderBy 		   := 'NAME';
      ExtraCondition := GetSqlExclusiones();
    end;

  tbLimpiarClick(nil);
end;

procedure TfrmBusquedaControlVersion.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((Trim(edBusqueda.Text) = ''), edBusqueda, 'Debe ingresar la cadena de búsqueda.');

  Do_Busqueda(edBusqueda.Text, chkCaseSensitive.Checked);

  sSql := 'SELECT RB_PROYECTO, RB_PATHCOMPLETOMODULO, UPPER(RB_EXTENSION) TIPOMODULO, RB_BLOBID' +
           ' FROM FRB_RESULTADOBUSQUEDA' +
          ' WHERE RB_USUARIO = ' + SqlValue(Sesion.UserID) +
    				SortDialog.OrderBy;

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

procedure TfrmBusquedaControlVersion.Do_Busqueda(ValorBuscado: String; const aCaseSensitive: Boolean);
  procedure PlaySound;
  var
  	resInfo: THandle;
  	wavHdl: THandle;
  	wavPtr: Pointer;
	begin
    resInfo := FindResource(HInstance, 'END_SEARCH', RT_RCDATA);
    if resInfo <> 0 then
      begin
        wavHdl := LoadResource(HInstance, resInfo);
        wavPtr := LockResource(wavHdl);
        sndPlaySound(wavPtr, SND_ASYNC or SND_MEMORY);
        if (wavHdl <> 0) then
          begin
            UnlockResource(wavHdl);
            FreeResource(wavHdl);
          end;
      end;
  end;

var
	iBlobId: Integer;
  sWhere, sSqlMODPR, sFileName, sBlob, sExtension, sSqlBL, sSqlIDBL: String;
begin
  Do_LimpiarBusqueda;

  with pnFile do
    begin
      Left    := (frmBusquedaControlVersion.Width div 2) - (Width div 2);
      Top     := (frmBusquedaControlVersion.Height div 2) - (Height div 2);
      Visible := True;
      Caption := '  Determinando archivos a analizar...';
    end;
  Application.ProcessMessages;

  try
    sWhere := GetSqlExclusiones();

    sSqlBL := 'SELECT BLO.FILEDATA DATO, BLO.COMPSIZE, BLO.EXTENSION, BLO.ORIGTIME ' +
                'FROM FUENTES.BLOBS BLO ' +
               'WHERE BLO.BLOBID = :idblob';

    sSqlIDBL := 'SELECT DISTINCT BLO.BLOBID IDBLOB, MDL.NAME FILENAME ' +
                  'FROM FUENTES.BLOBS BLO, FUENTES.REVISION REV, FUENTES.MODULES MDL, FUENTES.PJMODULE PJM, ' +
                       'FUENTES.PROJECTS PRO ' +
                 'WHERE PJM.PROJECTID = PRO.PROJECTID ' +
                   'AND MDL.MODULEID = PJM.MODULEID ' +
                   'AND MDL.MODULEID = REV.MODULEID ' +
                   'AND TO_CHAR(VERSION, ''FM09999999'') || TO_CHAR(REVISION, ''FM09999999'') = ' +
                       '(SELECT MAX(TO_CHAR(REV1.VERSION, ''FM09999999'') || TO_CHAR(REV1.REVISION, ''FM09999999'')) ' +
                          'FROM FUENTES.REVISION REV1 ' +
                         'WHERE REV1.MODULEID = REV.MODULEID) ' +
                   'AND REV.REVISIONID = BLO.REVISIONID ';

    if checkExtension.CheckCount > 0 then
      sWhere := sWhere + LowerCase(checkExtension.InSQL_StringValues('BLO.EXTENSION'));

    if not fraProyecto.IsEmpty then
      sWhere := sWhere + ' AND PRO.PROJECTID = ' + SqlValue(fraProyecto.Value);

    if chkSoloFuentesPropios.Checked then
      sWhere := sWhere + ' AND (UPPER(MDL.PATH) LIKE ' + SqlValue('%\DELPHI\COMUNES\%') +
                          ' OR UPPER(MDL.PATH) LIKE ' + SqlValue('%\DELPHI\DESARROLLO\%') + ')';

    if chkSoloProyectosDelphi.Checked then
      sWhere := sWhere + ' AND UPPER(PRO.NAME) LIKE ' + SqlValue('%.DPR');

    with GetQuery(sSqlIDBL + sWhere) do
      try
        if not aCaseSensitive then
          ValorBuscado := UpperCase(ValorBuscado);

        sSqlMODPR := 'SELECT MDL.PATH || MDL.NAME PATHMODULO, ' +
                            'LISTAGG(PRO.NAME, '' - '') WITHIN GROUP (ORDER BY PRO.NAME) PROYECTO ' +
                       'FROM FUENTES.BLOBS BLO, FUENTES.REVISION REV, FUENTES.MODULES MDL, FUENTES.PJMODULE PJM, ' +
                            'FUENTES.PROJECTS PRO ' +
                      'WHERE PJM.PROJECTID = PRO.PROJECTID ' +
                        'AND MDL.MODULEID = PJM.MODULEID ' +
                        'AND MDL.MODULEID = REV.MODULEID ' +
                        'AND REV.REVISIONID = BLO.REVISIONID ' +
                        'AND BLO.BLOBID = :idblob ' +
                        sWhere + ' ' +
                      'GROUP BY MDL.PATH, MDL.NAME';

        while not Eof do
          begin
            iBlobId   := FieldByName('IDBLOB').AsInteger;
            sFileName := FieldByName('FILENAME').AsString;

            pnFile.Caption := '  Buscando en ' + sFileName + '...';
            Application.ProcessMessages;

            with GetQueryEx(sSqlBL, [iBlobId]) do
              try
                sExtension := FieldByName('EXTENSION').AsString;

                sBlob := GetDataBlob('', FieldByName('COMPSIZE').AsString, sExtension,
                                     sFileName, FieldByName('ORIGTIME').AsString,
                                     TBlobField(FieldByName('DATO')));
              finally
                Free;
              end;

            if not aCaseSensitive then
              sBlob := UpperCase(sBlob);

            if PosEx(ValorBuscado, sBlob) > 0 then
              with GetQueryEx(sSqlMODPR, [iBlobId]) do
                try
                  Do_AltaRegistroBusqueda(iBlobId, FieldByName('PROYECTO').AsString, FieldByName('PATHMODULO').AsString, sExtension)
                finally
                  Free;
                end;

            Next;
          end;
      finally
        Free;
        PlaySound;
      end;
  finally
    pnFile.Visible := False;
  end;
end;

function TfrmBusquedaControlVersion.GetDataBlob(aAffectedFiles: String; const aCompSize, aExtension, aModuleName, aOrigTime: String; aBlobField: TBlobField): String;
var
  Compressed: Boolean;
  CurrentModuleName: String;
  sArchivo, FileExtension: String;
  FS: TFileStream;
  ModuleOrigTime: TDateTime;
  ZipFile: String;
  fStream: TFileStream;
  OutStream: TMemoryStream;
begin
	Result := '-1';

	try
    ModuleOrigTime    := _StrToFloat(aOrigTime);
    Compressed        := (_StrToInt(aCompSize) > 0);
    FileExtension     := TrimRight(aExtension);
    CurrentModuleName := ChangeFileExt(aModuleName, aExtension);
    aAffectedFiles    := aAffectedFiles + ExtractFileName(CurrentModuleName) + '/';

    if not Compressed then
    begin
      MsgBox('ERROR: JVCSRES_Current_version_does_not_support_uncompressed_modules33.');
      Exit;
    end // if not Compressed then begin
    else
    begin
      // prepare Zipfile
      ZipFile := TempPath + ExtractFilePath(CurrentModuleName) + '_vcsblob.zip';
      if FileExists(ZipFile) then
      begin
        FileSetAttr(ZipFile, FileGetAttr(ZipFile) and not $00000001);
        SysUtils.DeleteFile(ZipFile);
      end;

      // get blob
      try
        FS := TFileStream.Create(ZipFile, fmCreate or fmShareExclusive);
        try
          FS.Seek(0, 0);
          aBlobField.SaveToStream(FS);
        finally
          FS.Free;
        end;
      except
        on E: Exception do
        begin
          MsgBox('ERROR: JVCSRES_TFileStream_Error58_37s. ' + E.Message);
          Exit;
        end;
      end;

      sArchivo := TempPath + CurrentModuleName;
      // Extract Zip file
      try
        if ExtractZip2Source(Self, sArchivo, ZipFile, ModuleOrigTime) <> 0 then
        begin
          MsgBox('ERROR: JVCSRES_Error_extract_zip_file58_37s.');
          Exit;
        end;
      except
        MsgBox('ERROR: JVCSRES_General_error_extract_zip_file.');
        Exit;
      end;

      if FileExists(ZipFile) then
        SysUtils.DeleteFile(ZipFile);

      if FileExists(sArchivo) then
      begin
        with TStringList.Create do
        try
          if IsDFMBinary(sArchivo) then
          begin
            fStream   := TFileStream.Create(sArchivo, fmOpenRead or fmShareDenyNone);
            OutStream := TMemoryStream.Create;
            try
              ObjectResourceToText(fStream, OutStream);
              OutStream.Position := 0;
              LoadFromStream(OutStream);
            finally
              OutStream.Free;
              fStream.Free;
            end
          end
          else
            LoadFromFile(sArchivo);

          Result := Text;
        finally
          Free;
        end;

        SysUtils.DeleteFile(sArchivo);
      end;
    end;
  except
  	Result := '-1';
  end;
end;

function TfrmBusquedaControlVersion.ExtractZip2Source(ZipOwner: TComponent; const SourceFile: String; ZipFile: String; ModuleOrigTime: TDateTime = 0): Integer;
var
  FS, FSOut: TFileStream;
  {$IFDEF BLOWFISH}
  Encrypted: Boolean;
  EncodeKey: string;
  {$ENDIF BLOWFISH}
  AbZipArchive: TAbZipArchive;
  AbZipItem: TAbZipItem;
  sFile: String;
begin
  if FileExists(SourceFile) then
  begin
    try
      FileSetReadOnly(SourceFile, False);
      SysUtils.DeleteFile(SourceFile);
    except
      on E: Exception do
      begin
        MsgBox(E.Message);
        Result := 1;
        Exit;
      end;
    end; // try except
  end;

  //--- Cipher -------------------------------------------------------------
  {$IFDEF BLOWFISH}
  FS := TFileStream.Create(ZipFile, fmOpenRead or fmShareDenyWrite);
  try
    Encrypted := (VerifyZip(FS) <> atZip);
  finally
    FS.Free;
  end;

  if Encrypted then
  begin
    EncodeKey := jvcsReadString(sBaseRegistryKey + crbOptions, 'EncodeKey', '');
    if EncodeKey <> '' then
      EncodeKey := Base64Decode(EncodeKey)
    else
    begin
      MsgBox('ERROR: JVCSRES_EncodeKey_blank');
      Result := 5;
      Exit;
    end;
    if (not BlowFishDecode(ZipOwner, EncodeKey, ZipFile, ChangeFileExt(ZipFile, '.ulock'))) then
    begin
      MsgBox('ERROR: JVCSRES_BlowFishDecode_failed');
      Result := 6;
      Exit;
    end;
    SysUtils.DeleteFile(ZipFile);
    ZipFile := ChangeFileExt(ZipFile, '.ulock');
  end;
  {$ENDIF BLOWFISH}

  //------------------------------------------------------------------------
  FS := TFileStream.Create(ZipFile, fmOpenRead or fmShareDenyWrite);
  try
    AbZipArchive := TAbZipArchive.CreateFromStream(FS, 'AbArchive');
    try
      try
        AbZipArchive.Load;
      except
        on E: Exception do
        begin
          MsgBox(E.Message);
          Result := 2;
          Exit;
        end;
      end;
      if AbZipArchive.ItemList.Count > 0 then
      begin
        AbZipArchive.ExtractOptions :=  [eoCreateDirs, eoRestorePath];
        AbZipItem := AbZipArchive.Items[0];
        if SameText(AbZipItem.FileName, ExtractFileName(SourceFile)) then
          sFile := ExtractFilePath(SourceFile) + AbZipItem.FileName
        else
          sFile := SourceFile;
        try
          // !if a newly renamed module has already a file with same name in directory, this one will be overwritten!
          if FileExists(sFile) then
            FileSetReadOnly(sFile, False);
          FSOut := TFileStream.Create(sFile, fmCreate);
          try
            AbUnzipToStream(AbZipArchive, AbZipItem, FSOut);
          finally
            FSOut.Free;
          end;

          // Set file time in UTC, CS 11.04.2005
//          if ModuleOrigTime <> 0 then
//            FileSetUTCDateTime(sFile, ModuleOrigTime);
        except
          on E: Exception do
          begin
            MsgBox(E.Message);
            Result := 3;
            Exit;
          end;
        end;
      end
      else
      begin
        MsgBox('ERROR: JVCSRES_Zipmaster46SuccessCnt_61_0'); //change msg
        Result := 4;
        Exit;
      end;
    finally
      AbZipArchive.Free;
    end;
  finally
    FS.Free;
  end;

  if FileExists(ZipFile) then
    SysUtils.DeleteFile(ZipFile);

  Result := 0;
end;

procedure TfrmBusquedaControlVersion.FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F5 then
  	tbRefrescarClick(nil);
end;

procedure TfrmBusquedaControlVersion.GridDblClick(Sender: TObject);
begin
	tbNuevoClick(nil);
end;

procedure TfrmBusquedaControlVersion.tbNuevoClick(Sender: TObject);
var
	sSql: String;
begin
	if not sdqConsulta.Active then
  	Exit;

  InfoHint(tbNuevo, '<F3> - Mostrar ocurrencias texto Búsqueda');

	with TfrmVerArchivoControlVersion.Create(Self) do
    try
      Caption := sdqConsulta.FieldByName('RB_PATHCOMPLETOMODULO').AsString;

      CadenaABuscar := edBusqueda.Text;
      CaseSensitive := chkCaseSensitive.Checked;

      sSql :=
        'SELECT COMPSIZE, FILEDATA, ORIGTIME' +
         ' FROM FUENTES.BLOBS' +
        ' WHERE BLOBID = :p1';

      with GetQueryEx(sSql, [sdqConsulta.FieldByName('RB_BLOBID').AsInteger]) do
        try
          meArchivo.Lines.Text := GetDataBlob('', FieldByName('COMPSIZE').AsString, '.tmp', 'sistemasd7_temp',
                                              FieldByName('ORIGTIME').AsString, TBlobField(FieldByName('FILEDATA')));
        finally
          Free;
        end;

      ShowModal;
    finally
      Free;
    end;
end;

end.

