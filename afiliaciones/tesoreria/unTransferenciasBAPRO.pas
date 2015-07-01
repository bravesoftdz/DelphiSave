unit unTransferenciasBAPRO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, Buttons,
  FormPanel, PatternEdit, IntEdit, Menus;

type
  TfrmTransferenciasBAPRO = class(TfrmCustomConsulta)
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    gbFechaAlta: TGroupBox;
    Label2: TLabel;
    edFAltaDesde: TDateComboBox;
    edFAltaHasta: TDateComboBox;
    rgTipo: TRadioGroup;                          
    ToolButton1: TToolButton;
    tbVerArchivo: TToolButton;
    tbCrearArchivo: TToolButton;
    fpVerArchivo: TFormPanel;
    edTexto: TMemo;
    Panel1: TPanel;
    sdqConsulta2: TSDQuery;
    ExportDialog2: TExportDialog;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbExportarVerArchivo: TToolButton;
    ToolButton30: TToolButton;
    tbSalirVerArchivo: TToolButton;
    SaveDialogVerArchivo: TSaveDialog;
    tbRendicion: TToolButton;
    gbNroArchBAPRO: TGroupBox;
    edNroArchBAPRO: TIntEdit;
    tbVerArchivoExcel: TToolButton;
    pmnuImprimir: TPopupMenu;
    mnuImpTransf: TMenuItem;
    mnuImpResultados: TMenuItem;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbVerArchivoClick(Sender: TObject);
    procedure tbCrearArchivoClick(Sender: TObject);
    procedure tbSalirVerArchivoClick(Sender: TObject);
    procedure tbExportarVerArchivoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRendicionClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbVerArchivoExcelClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpTransfClick(Sender: TObject);
  private
    procedure Do_SetearGenMovRendicionTransfBAPRO(Generar: String);
  public
  end;

var
  frmTransferenciasBAPRO: TfrmTransferenciasBAPRO;

const
  MSG_BAJA : String = '¿ Desea dar de baja el registro seleccionado ?';

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, SqlFuncs, ArchFuncs, unSesion,
  unArt, unImpoExpoWizard, ShellAPI, unTesoreria, unRptBancosGiroTransferenciaFormato2;

{$R *.dfm}

procedure TfrmTransferenciasBAPRO.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT DECODE(AB_TIPO, ''P'', ''Pago'', ''R'', ''Rendición'', ''E'', ''Pago Electrónico'') TIPO, TRIM(AB_PATH) PATH, ' +
                 'TRIM(AB_NOMBRE) NOMBRE, TRUNC(AB_FECHAALTA) FECHAALTA, AB_USUALTA USUALTA, ' +
                 'AB_USUDESCARGADO USUDESCARGADO, TRUNC(AB_FECHADESCARGADO) FECHADESCARGADO, ' +
                 'AB_TIPO CODTIPO, AB_ID ID, ' +
		                   '(SELECT SUM(CE_MONTO) ' +
                          'FROM RCE_CHEQUEEMITIDO ' +
                         'WHERE CE_IDARCHIVOBAPRO = AB_ID) IMPORTE ' +
            'FROM WEB.WAB_ARCHIVOBAPRO ' +
           'WHERE 1 = 1';
            
  sWhere := SqlBetweenDateTime(' AND AB_FECHAALTA ', edFAltaDesde.Date, edFAltaHasta.Date);

  case rgTipo.ItemIndex of
    0: sWhere := sWhere + ' AND AB_TIPO = ''P'' ';   // Pago
    1: sWhere := sWhere + ' AND AB_TIPO = ''R'' ';   // Rendición
    2: sWhere := sWhere + ' AND AB_TIPO = ''E'' ';   // Pago Electrónico
  end;

  if not edNroArchBAPRO.IsEmpty then
    sWhere := sWhere + ' AND AB_ID = ' + SqlValue(edNroArchBAPRO.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmTransferenciasBAPRO.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFAltaDesde.Clear;
  edFAltaHasta.Clear;
  edNroArchBAPRO.Clear;
  rgTipo.ItemIndex := 3;   // Todos
end;

procedure TfrmTransferenciasBAPRO.tbVerArchivoClick(Sender: TObject);
var
  sSql, sNombreArch, sNombreArchDest: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ningún registro en la grilla.');

  sNombreArch := IncludeTrailingBackslash(sdqConsulta.FieldByName('PATH').AsString) + sdqConsulta.FieldByName('NOMBRE').AsString;
  Verificar(not FileExists(sNombreArch), nil, 'No se ha encontrado el archivo.');

  sNombreArchDest := IncludeTrailingBackslash(TempPath) + '_TRANSF_BAPRO.TXT';

  DeleteFile(sNombreArchDest);
  if CopyFileExt(sNombreArch, sNombreArchDest, False) then
    ShellExecute(Application.Handle, nil, PChar(sNombreArchDest), '', '', SW_SHOWNORMAL)
  else
    raise Exception.Create('No se ha podido copiar el archivo en su disco local.');

  if (sdqConsulta.FieldByName('CODTIPO').AsString = 'R') and sdqConsulta.FieldByName('FECHADESCARGADO').IsNull then
    begin
      sSql := 'UPDATE WAB_ARCHIVOBAPRO ' +
                 'SET AB_USUDESCARGADO = :User, ' +
                     'AB_FECHADESCARGADO = Sysdate ' +
               'WHERE AB_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('ID').AsInteger]);

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmTransferenciasBAPRO.tbCrearArchivoClick(Sender: TObject);
var
  sUbicArchivo, sPath, sSql: String;
  IdCheque, iIdArchivo: TTableId;
  bEsPrimero: Boolean;
begin
  if MsgBox('¿Confirma la creación del archivo?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      with TSDStoredProc.Create(nil) do
        try
          DatabaseName   := 'dbPrincipal';
          StoredProcName := 'art.tesoreria.do_transferenciabapro';

          Params.CreateParam(ftString,  'usuario',   ptInput);
          Params.CreateParam(ftInteger, 'idarchivo', ptOutput);
          Params.CreateParam(ftString,  'esprimero', ptOutput);

          ParamByName('usuario').Value  := Sesion.UserId;

          ExecProc;
          EjecutarSql('COMMIT');

          iIdArchivo := ParamByName('idarchivo').AsInteger;
          bEsPrimero := (ParamByName('esprimero').AsString = 'S');
        finally
          Free;
        end;

      Verificar(iIdArchivo = ART_EMPTY_ID, nil, 'No se encontraron registros para procesar.');

      sSql := 'SELECT  ''00'' || TO_CHAR(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2), ''MMYYYY'') || ' + Iif(bEsPrimero, 'NULL', 'LPAD(''0'', 20, ''0'')') + ' ' +
                       '|| LTRIM(TO_CHAR(COUNT(*), ''00000000'')) ' +
                       '|| LTRIM(TO_CHAR(SUM(CE_MONTO * 100), ''000000000000'')) || ' + Iif(not bEsPrimero, 'NULL', 'LPAD(''0'', 20, ''0'')') + ' ' +
                       '|| TO_CHAR(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2), ''DDMMYYYY'') ' +
                       '|| TO_CHAR(AMEBPBA.CALCDIASHABILES(LAST_DAY(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2) + 60),1), ''DDMMYYYY'') || RPAD(''017'', 901, '' '') REGISTRO ' +
                  'FROM RCE_CHEQUEEMITIDO ' +
                 'WHERE CE_IDARCHIVOBAPRO = :Archivo ' +
             'UNION ALL ' +
              'SELECT  ''10'' || TO_CHAR(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2), ''DDMMYYYY'') ' +
                       '|| TO_CHAR(AMEBPBA.CALCDIASHABILES(LAST_DAY(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2) + 60),1), ''DDMMYYYY'') || TJ_CUIL ' +
                       '|| LTRIM(TO_CHAR(CE_ORDENPAGO, ''000000000000'')) || ''014'' || ''000'' ' +
                       '|| RPAD(NVL(LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO,LE_ORDEN,LE_RECAIDA,LE_NUMLIQUI), TJ_NOMBRE), 27, '' '') || ''4'' ' +
                       '|| LPAD(NVL(LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO,LE_ORDEN,LE_RECAIDA,LE_NUMLIQUI), TJ_DOCUMENTO), 8, ''0'') ' +
                       '|| ''00'' || RPAD('' '', 49, '' '') || RPAD('' '', 400, '' '') ' +
                       '|| LTRIM(TO_CHAR(MAX(CE_MONTO * 100), ''000000000000'')) || LPAD(''0'', 12, ''0'') ' +
                       '|| LTRIM(TO_CHAR(MAX(CE_MONTO * 100), ''000000000000'')) ' +
                       '|| UTILES.IIF_COMPARA(''>'', LENGTH(LTRIM(TO_CHAR(MAX(CE_MONTO), ''99999999''))), 4, ''1'', ''0'') ' +
                       '|| TO_CHAR(CE_FECHACHEQUE, ''MMYY'') || ''000'' ' +
                       '|| ''0'' || RPAD('' '', 20, '' '') || TO_CHAR(SYSDATE, ''DDMMYYYY'') || ''        '' ' +
                       '|| RPAD(RPAD(''CONCEPTO DE PAGO: '', 38, '' '') || RPAD(MAX(CP_DENPAGO), 38, '' '') ' +
                       '|| DECODE(MAX(LTRIM(SUBSTR(LIQ.GET_INFOINCAPACIDAD(EX_SINIESTRO, EX_ORDEN), 24, 7))),'''', '''',''PORC. INCAPACIDAD: '') ' +
                       '|| MAX(LTRIM(SUBSTR(LIQ.GET_INFOINCAPACIDAD(EX_SINIESTRO, EX_ORDEN), 24, 7))), 331, '' '') ' +
                       '|| ''S'' || RPAD('' '', 18, '' '') REGISTRO ' +
                  'FROM CTJ_TRABAJADOR, SCP_CONPAGO, SLE_LIQUIEMPSIN, SEX_EXPEDIENTES, RCE_CHEQUEEMITIDO ' +
                 'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                   'AND LE_SINIESTRO = EX_SINIESTRO ' +
                   'AND LE_ORDEN = EX_ORDEN ' +
                   'AND LE_RECAIDA = EX_RECAIDA ' +
                   'AND LE_CONPAGO = CP_CONPAGO ' +
                   'AND EX_IDTRABAJADOR = TJ_ID ' +
                   'AND CE_IDARCHIVOBAPRO = :Archivo ' +
              'GROUP BY CE_FECHACHEQUE, CE_ORDENPAGO, TJ_CUIL, TJ_NOMBRE, TJ_DOCUMENTO, ' +
                       'NVL(LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO,LE_ORDEN,LE_RECAIDA,LE_NUMLIQUI), TJ_NOMBRE), ' +
                       'NVL(LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO,LE_ORDEN,LE_RECAIDA,LE_NUMLIQUI), TJ_DOCUMENTO) ' +
             'UNION ALL ' +
              'SELECT  ''10'' || TO_CHAR(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2), ''DDMMYYYY'') ' +
                       '|| TO_CHAR(AMEBPBA.CALCDIASHABILES(LAST_DAY(AMEBPBA.CALCDIASHABILES(ACTUALDATE, 2) + 60),1), ''DDMMYYYY'') || TJ_CUIL ' +
                       '|| LTRIM(TO_CHAR(CE_ORDENPAGO, ''000000000000'')) || ''014'' || ''000'' ' +
                       '|| RPAD(NVL(LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO,PR_ORDEN,PR_RECAIDA,PR_NUMPAGO,''SPR''), TJ_NOMBRE), 27, '' '') ' +
                       '|| ''4'' || LPAD(NVL(LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO,PR_ORDEN,PR_RECAIDA,PR_NUMPAGO,''SPR''), TJ_DOCUMENTO), 8, ''0'') ' +
                       '|| ''00'' || RPAD('' '', 49, '' '') || RPAD('' '', 400, '' '') ' +
                       '|| LTRIM(TO_CHAR(MAX(CE_MONTO * 100), ''000000000000'')) || LPAD(''0'', 12, ''0'') ' +
                       '|| LTRIM(TO_CHAR(MAX(CE_MONTO * 100), ''000000000000'')) ' +
                       '|| UTILES.IIF_COMPARA(''>'', LENGTH(LTRIM(TO_CHAR(MAX(CE_MONTO), ''99999999''))), 4, ''1'', ''0'') ' +
                       '|| TO_CHAR(CE_FECHACHEQUE, ''MMYY'') || ''000'' || ''0'' || RPAD('' '', 20, '' '') || TO_CHAR(SYSDATE, ''DDMMYYYY'') || ''        '' ' +
                       '|| RPAD(RPAD(''CONCEPTO DE PAGO: '', 38, '' '') || RPAD(MAX(CP_DENPAGO), 38, '' '') ' +
                       '|| DECODE(MAX(LTRIM(SUBSTR(LIQ.GET_INFOINCAPACIDAD(EX_SINIESTRO, EX_ORDEN), 24, 7))),'''', '''',''PORC. INCAPACIDAD: '') ' +
                       '|| MAX(LTRIM(SUBSTR(LIQ.GET_INFOINCAPACIDAD(EX_SINIESTRO, EX_ORDEN), 24, 7))),331, '' '') ' +
                       '|| ''S'' || RPAD('' '', 18, '' '') REGISTRO ' +
                  'FROM CTJ_TRABAJADOR, SCP_CONPAGO, SPR_PAGOEXPESIN, SEX_EXPEDIENTES, RCE_CHEQUEEMITIDO ' +
                 'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                   'AND PR_SINIESTRO = EX_SINIESTRO ' +
                   'AND PR_ORDEN = EX_ORDEN ' +
                   'AND PR_RECAIDA = EX_RECAIDA ' +
                   'AND PR_CONPAGO = CP_CONPAGO ' +
                   'AND EX_IDTRABAJADOR = TJ_ID ' +
                   'AND CE_IDARCHIVOBAPRO = :Archivo ' +
                   'AND NOT EXISTS (SELECT 1 ' +
                                     'FROM SLE_LIQUIEMPSIN ' +
                                    'WHERE CE_ID = LE_IDCHEQUEEMITIDO) ' +
                 'GROUP BY CE_FECHACHEQUE, CE_ORDENPAGO, TJ_CUIL, ' +
                          'NVL(LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO,PR_ORDEN,PR_RECAIDA,PR_NUMPAGO,''SPR''), TJ_NOMBRE), ' +
                          'NVL(LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO,PR_ORDEN,PR_RECAIDA,PR_NUMPAGO,''SPR''), TJ_DOCUMENTO)';

      OpenQueryEx(sdqConsulta2, [iIdArchivo, iIdArchivo, iIdArchivo], sSql);

      Verificar(sdqConsulta2.IsEmpty, nil, 'No se han encontrado registros para generar el archivo.');

      BeginTrans;
      try
        sSql := 'SELECT CE_ID ' +
                  'FROM RCE_CHEQUEEMITIDO ' +
                 'WHERE CE_IDARCHIVOBAPRO = :Archivo';
        with GetQueryEx(sSql, [iIdArchivo]) do
          try
            while not Eof do
              begin
                IdCheque := FieldByName('CE_ID').AsInteger;
                DoProcesarGirosYTransferencias(IdCheque, ART_EMPTY_ID, '17');  // 17: GIROS Y TRANSFERENCIAS BPBA

                Next;
              end;
          finally
            Free;
          end;

        CommitTrans;
      except
        on E: Exception do
        begin
          RollBack;

          raise Exception.Create(E.Message + CRLF + 'Error al procesar los giros y transferencias.');
        end;
      end;

      sSql := 'SELECT AB_PATH, AB_NOMBRE ' +
                'FROM WAB_ARCHIVOBAPRO ' +
               'WHERE AB_ID = :Id';
      with GetQueryEx(sSql, [iIdArchivo]) do
        try
          sPath        := FieldByName('AB_PATH').AsString;
          sUbicArchivo := IncludeTrailingBackslash(sPath) + FieldByName('AB_NOMBRE').AsString;
        finally
          Free;
        end;

      Verificar(sUbicArchivo = '', nil, 'No se han encontrado el directorio donde generar el archivo.');

      ForceDirectories(sPath);

      with ExportDialog2 do
        begin
          ExportFileType := etTextFile;
          OutputFile     := sUbicArchivo;
          SaveHeaders    := False;
          Quote          := #0;
          SaveToFile;
        end;

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmTransferenciasBAPRO.tbSalirVerArchivoClick(Sender: TObject);
begin
  fpVerArchivo.Close;
end;

procedure TfrmTransferenciasBAPRO.tbExportarVerArchivoClick(Sender: TObject);
var
  sNombreArch: String;
begin
  with SaveDialogVerArchivo do
    begin
      Filter      := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
      FilterIndex := 1;
      DefaultExt  := '.txt';
      if Execute then
        begin
          sNombreArch := IncludeTrailingBackslash(sdqConsulta.FieldByName('PATH').AsString) + sdqConsulta.FieldByName('NOMBRE').AsString;
          if not CopyFileExt(sNombreArch, SaveDialogVerArchivo.FileName, True) then
            MsgBox('Error al guardar el archivo', MB_ICONERROR);
        end;
    end;
end;

procedure TfrmTransferenciasBAPRO.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  Id: TTableId;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      Verificar(not sdqConsulta.FieldByName('FECHADESCARGADO').IsNull, nil, 'El archivo ya ha sido descargado. No puede darse de baja.');

      if MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          BeginTrans;
          try
            Id := sdqConsulta.FieldByName('ID').AsInteger;

            sSql := 'UPDATE RSO_SOBRE ' +
                      'SET SO_USUBAJA = :User, ' +
                          'SO_FECHABAJA = SYSDATE ' +
                    'WHERE SO_IDCHEQUEEMITIDO IN (SELECT CE_ID ' +
                                                   'FROM RCE_CHEQUEEMITIDO ' +
                                                  'WHERE CE_IDARCHIVOBAPRO = :IdArch) ' +
                      'AND SO_FECHABAJA IS NULL ' +
                      'AND SO_FECHAIMPRESION IS NULL';
            EjecutarSqlSTEx(sSql, [Sesion.UserId, Id]);

            sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                       'SET CE_IDARCHIVOBAPRO = NULL, ' +
                           'CE_SITUACION = ''30'', ' +    // 30: A la firma
                           'CE_FECHASITUACION = ACTUALDATE, ' +
                           'CE_USUSITUACION = ' + SqlValue(Sesion.UserID) + ' ' +
                     'WHERE CE_IDARCHIVOBAPRO = :IdArch';
            EjecutarSqlSTEx(sSql, [Id]);

            sSql := 'DELETE FROM WEB.WAB_ARCHIVOBAPRO ' +
                     'WHERE AB_ID = :IdArch';
            EjecutarSqlSTEx(sSql, [Id]);

            CommitTrans;

            sdqConsulta.Refresh;
            CheckButtons;
          except
            on E: Exception do
              begin
                Rollback;

                raise Exception.Create(E.Message + CRLF + 'Error al eliminar la transferencia.');
              end;
          end;
        end;
    end;
end;

procedure TfrmTransferenciasBAPRO.tbRendicionClick(Sender: TObject);
begin
  Do_SetearGenMovRendicionTransfBAPRO('S');
  ImpoExpoWizard('TRTBP');
end;

procedure TfrmTransferenciasBAPRO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmTransferenciasBAPRO.tbVerArchivoExcelClick(Sender: TObject);
var
  sNombreArch: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ningún registro en la grilla.');

  sNombreArch := IncludeTrailingBackslash(sdqConsulta.FieldByName('PATH').AsString) + sdqConsulta.FieldByName('NOMBRE').AsString;
  Verificar(not FileExists(sNombreArch), nil, 'No se ha encontrado el archivo.');

  with SaveDialogVerArchivo do
    begin
      Filter      := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
      FilterIndex := 1;
      DefaultExt  := '.txt';
      if Execute then
        begin
          sNombreArch := IncludeTrailingBackslash(sdqConsulta.FieldByName('PATH').AsString) + sdqConsulta.FieldByName('NOMBRE').AsString;
          if not CopyFileExt(sNombreArch, SaveDialogVerArchivo.FileName, True) then
            MsgBox('Error al guardar el archivo', MB_ICONERROR)
          else
            begin
              MsgBox('El archivo se ha copiado en ' + SaveDialogVerArchivo.FileName + '.' + CRLF + 'Selecciónelo con el siguiente ImpoExpo y genere el archivo Excel en la ruta deseada.', MB_ICONINFORMATION);

              Do_SetearGenMovRendicionTransfBAPRO('N');
              ImpoExpoWizard('TRTBP');
            end;
        end;
    end;
end;

procedure TfrmTransferenciasBAPRO.Do_SetearGenMovRendicionTransfBAPRO(Generar: String);
var
  sSql: String;
begin
  sSql := 'art.tesoreria.do_setearmovrendiciontransf(:Generar);';
  EjecutarStoreEx(sSql, [Generar]);
end;

procedure TfrmTransferenciasBAPRO.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmTransferenciasBAPRO.mnuImpResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmTransferenciasBAPRO.mnuImpTransfClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No existe ninguna fila en la grilla.');
  Verificar(not AreIn(sdqConsulta.FieldByName('CODTIPO').AsString, ['P', 'E']), nil, 'El tipo debe corresponder a un Pago o a un Pago Eletrónico.');

  if sdqConsulta.FieldByName('CODTIPO').AsString = 'P' then
    TfrmRptBancosGiroTransferenciaFormato2.DoImprimirBancosGiroTransferenciaFormato2(sdqConsulta.FieldByName('ID').AsInteger, CodBanco_PciaBsAs);
end;

end.

