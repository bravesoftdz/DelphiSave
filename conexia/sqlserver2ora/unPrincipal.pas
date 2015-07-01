unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, JvExControls, JvComponent,
  JvWaitingGradient, JvWaitingProgress, ExtCtrls, JvAnimatedImage, JvGIFCtrl, Login, artDbLogin,
  JvTrayIcon, JvAppEvent, ImgList;

type
  TfrmPrincipal = class(TForm)
    pnlTop: TPanel;
    Timer: TTimer;
    DBLogin: TDBLogin;
    pnlBottom: TPanel;
    pnlMain: TPanel;
    pnlIzq: TPanel;
    pnlArriba: TPanel;
    pnlEstado: TPanel;
    pnlDcha: TPanel;
    Progreso: TJvGIFAnimator;
    lbCEM: TLabel;
    Arranque: TTimer;
    JvTrayIcon: TJvTrayIcon;
    JvAppEvents: TJvAppEvents;
    Memo: TMemo;
    ilByN: TImageList;
    ilColor: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ArranqueTimer(Sender: TObject);
    procedure JvAppEventsException(Sender: TObject; E: Exception);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MostrarEstado(sTexto: String);
    procedure Procesar(const aTablas, aPrimaryKeys, aExtraCondition: Array of String);
    {$IFDEF SERVICE}
    procedure SendMail(AMessage: String);
    {$ENDIF}
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unSesion, AnsiSQL, SQLFuncs, DB, SqlServer, SqlOracle,
  {$IFDEF SERVICE} unMainService, {$ELSE} unDebug, {$ENDIF}
  unArt, General, unDmPrincipal_SQLServer, Math, unMoldeEnvioMail;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFNDEF SERVICE}
  Visible := True;
  Progreso.Animate := True;
  Update;
  JvTrayIcon.Active := True;
  {$ENDIF}
end;

procedure TfrmPrincipal.MostrarEstado(sTexto: String);
begin
  Memo.Lines.Add(sTexto);
  {$IFNDEF SERVICE}
  pnlEstado.Caption := sTexto;
  pnlEstado.Update;
  JvTrayIcon.Hint := sTexto;
  {$ELSE}
//  SQLServer2Oracle.LogMessage(sTexto, EVENTLOG_INFORMATION_TYPE, 0, 0);
  {$ENDIF}
//  Sleep(10);
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  Close;
end;

procedure TfrmPrincipal.ArranqueTimer(Sender: TObject);
begin
  Arranque.Enabled := False;
  MostrarEstado('Conectando a SQL Server...');
  Update;
  try
    Application.CreateForm(TdmPrincipal_SQLServer, dmPrincipal_SQLServer);
  except
    on E: Exception do
      {$IFNDEF SERVICE}
      AddToLog(E.Message, ltError);
      {$ELSE}
      SQLServer2Oracle.LogMessage(E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      {$ENDIF}
  end;
  Update;
  MostrarEstado('Conectando a Oracle...');
  Update;

  {$IFNDEF SERVICE}
  if not IsForm(dmPrincipal) then
    Application.CreateForm(TdmPrincipal, dmPrincipal);
  {$ENDIF}
  Update;

  if dmPrincipal.sdbPrincipal.Connected and dmPrincipal_SQLServer.sdbPrincipal.Connected then
  begin
    Memo.Clear;
    {$IFNDEF SERVICE}
    ActivarLog;
    {$ENDIF}
    //DBLogin.Execute;
    Procesar(
      ['V_CXIA_ACCIDENTE', 'CXIA_ACCIDENTE_DIAGNOSTICO', 'CXIA_ACCIDENTE_CARACTERISTICAS',
       'V_CXIA_ATENCION', 'V_CXIA_DETALLE_INFORME',
       'V_CXIA_DETALLE_REALIZADO', 'CXIA_DETALLE_PRESCRIPTO', 'CXIA_TIPO_TRANSACCION',
       'V_CXIA_TRABAJADOR_TRASLADO', 'V_CXIA_TRAB_TRASLADO_FECHA', 'CXIA_MEDICO_NOINFORMADO'],
      ['ID', 'ID', 'ID',
       'HEADER_ATENCION_ID', 'ID',
       'ID', 'ID', 'ID',
       'ID', 'ID', 'ID'],
      ['', '', '', '',
       ' AND EXISTS (SELECT 1 ' +
                     ' FROM V_CXIA_ATENCION B ' +
                    ' WHERE V_CXIA_DETALLE_INFORME.HEADER_ATENCION_ID = B.HEADER_ATENCION_ID ' +
                      ' AND B.PROCESADO = 1)',      
       ' AND EXISTS (SELECT 1 ' +
                     ' FROM V_CXIA_ATENCION B ' +
                    ' WHERE V_CXIA_DETALLE_REALIZADO.HEADER_ATENCION_ID = B.HEADER_ATENCION_ID ' +
                      ' AND B.PROCESADO = 1)',
       ' AND EXISTS (SELECT 1 ' +
                     ' FROM V_CXIA_ATENCION B ' +
                    ' WHERE CXIA_DETALLE_PRESCRIPTO.HEADER_ATENCION_ID = B.HEADER_ATENCION_ID ' +
                      ' AND B.PROCESADO = 1)', '',
       '', '', '']
    );
  end;
end;

procedure TfrmPrincipal.Procesar(const aTablas, aPrimaryKeys, aExtraCondition: Array of String);

  procedure CompletarCampos(objFields: TSqlFields; aFields: TFields; const aTabla: String);
  var
    iField: Integer;
  begin
    with dmPrincipal.GetQuery('SELECT * FROM CONEXIA.' + aTabla + ' WHERE 1 = 2') do
    try
      for iField := 0 to aFields.Count - 1 do
        if FindField(aFields[iField].FieldName) <> nil then
          if (not aFields[iField].IsNull) or (UpperCase(aFields[iField].FieldName) = 'TIPO_TRANSACCION_AUDITORIA_COD') then
            case aFields[iField].DataType of
              ftFmtMemo, ftFixedChar, ftWideString, ftMemo, ftString:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsString, dtString);
              ftBytes, ftLargeint, ftCurrency, ftInteger, ftSmallint, ftWord, ftFloat:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsFloat, dtNumber);
              ftBoolean:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsBoolean, dtBoolean);
              ftDate:
                objFields.Add(aFields[iField].FullName, SqlOracle.SqlDate(aFields[iField].AsDateTime), dtCustom);
              ftTime, ftDateTime:
                objFields.Add(aFields[iField].FullName, SqlOracle.SqlDateTime(aFields[iField].AsDateTime), dtCustom);
            end;
    finally
      Free;
    end;
  end;

var
//  dFecha: TDateTime;
  iLoop, iLoopPK, iCantidad{, iUltimoIdInsertado}: Integer;
  sSQL, sPK: String;
  tslPK: TStringList;
  objSQL: TSql;
  bInserting, bProcesado: boolean;
begin
//  iUltimoIdInsertado := 0; 
  objSQL := TSql.Create('Nombre de la tabla');
  tslPK := TStringList.Create;
  try
    {$IFNDEF SERVICE}
    AddToLog('El proceso migración desde SQLServer hacia Oracle ha comenzado.', ltInfo);
    {$ELSE}
    SQLServer2Oracle.LogMessage('El proceso migración desde SQLServer hacia Oracle ha comenzado.', EVENTLOG_INFORMATION_TYPE, 0, 0);
    {$ENDIF}

    Sleep(200);
    for iLoop := Low(aTablas) to High(aTablas) do
    begin
      MostrarEstado('Verificando actualizaciones de ' + aTablas[iLoop] + '...');
      {$IFNDEF SERVICE}
      AddToLog('Migrando la tabla ' + aTablas[iLoop], ltInfo);
      {$ELSE}
      //SQLServer2Oracle.LogMessage('Migrando la tabla ' + aTablas[iLoop], EVENTLOG_INFORMATION_TYPE, 0, 0);
      {$ENDIF}

      sSQL := 'SELECT * ' +
                'FROM ' + aTablas[iLoop] +
              ' WHERE PROCESADO = 0 ' + aExtraCondition[iLoop];

      with dmPrincipal_SQLServer.GetQuery(sSQL) do
      try
        if not IsEmpty then
        try
          sSQL := 'SELECT 1 FROM ' + aTablas[iLoop] +
                  ' WHERE PROCESADO = 0 ' + aExtraCondition[iLoop];

//          iCantidad := dmPrincipal_SQLServer.ValorSQL('SELECT COUNT(*) FROM (' + sSQL + ')');
          iCantidad := RecordCount;
          MostrarEstado(Format('Se encontraron %d registros para actualizar...', [iCantidad]));

          Update;
          objSQL.TableName := 'CONEXIA.' + aTablas[iLoop];

          dmPrincipal_SQLServer.BeginTrans;
          while not Eof do
          begin
            MostrarEstado(Format('%s: Actualizando %d de %d registros...', [aTablas[iLoop], RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]));
            CompletarCampos(objSQL.Fields, Fields, aTablas[iLoop]);
            bInserting := True;

            try
              bProcesado := False;
              tslPK.CommaText := aPrimaryKeys[iLoop];
              for iLoopPK := 0 to tslPK.Count - 1 do
              begin
                sPK := ' AND ' + tslPK[iLoopPK] + ' = ' + FindField(tslPK[iLoopPK]).AsString;
                bInserting := bInserting and not FindField(tslPK[iLoopPK]).IsNull;
              end;

              if bInserting and not dmPrincipal.ExisteSQL('SELECT 1 FROM CONEXIA.' + aTablas[iLoop] + ' WHERE 1 = 1 ' + sPK) then
              begin
                try
                  dmPrincipal.EjecutarSQL(objSQL.InsertSql);
                  bProcesado := True;
//                  iUltimoIdInsertado := dmPrincipal.ValorSQL('SELECT @@identity');
                except
                  on E: Exception do
                  begin
                    bInserting := False;
    //                objSQL.Fields.Delete(objSQL.Fields.FieldByName['ID'].Index);
                    for iLoopPK := 0 to tslPK.Count - 1 do
                      objSQL.Fields.Delete(objSQL.Fields.FieldByName[tslPK[iLoopPK]].Index);
                    for iLoopPK := 0 to tslPK.Count - 1 do
                      objSQL.PrimaryKey.Add(tslPK[iLoopPK], FindField(tslPK[iLoopPK]).AsFloat, dtNumber);
                    dmPrincipal.EjecutarSQL(objSQL.UpdateSql);
                    if dmPrincipal.sdqConsulta.RowsAffected > 0 then
                      bProcesado := True;
                    {
                    iUltimoIdInsertado := dmPrincipal.ValorSQLInteger('SELECT ID ' +
                                                                        'FROM CONEXIA.' + aTablas[iLoop] +
                                                                      ' WHERE 1 = 1 ' + sPK);
}
                    {$IFNDEF SERVICE}
                    AddToLog(E.Message, ltError);
                    {$ELSE}
                    SQLServer2Oracle.LogMessage(E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
                    SendMail(E.Message);
                    {$ENDIF}
                  end;
                end;
              end else
              begin
                bInserting := False;
//                objSQL.Fields.Delete(objSQL.Fields.FieldByName['ID'].Index);
                for iLoopPK := 0 to tslPK.Count - 1 do
                  objSQL.Fields.Delete(objSQL.Fields.FieldByName[tslPK[iLoopPK]].Index);
                for iLoopPK := 0 to tslPK.Count - 1 do
                  objSQL.PrimaryKey.Add(tslPK[iLoopPK], FindField(tslPK[iLoopPK]).AsFloat, dtNumber);
                dmPrincipal.EjecutarSQL(objSQL.UpdateSql);
                if dmPrincipal.sdqConsulta.RowsAffected > 0 then
                  bProcesado := True;
              end;

              if bProcesado then
                dmPrincipal_SQLServer.EjecutarSQLST('UPDATE ' + aTablas[iLoop] +
                                                      ' SET FECHA_PROCESADO = GETDATE(), ' +
                                                           'PROCESADO = 1 ' +
                                                     'WHERE 1 = 1 ' + sPK);
            except
              on E: Exception do
                {$IFNDEF SERVICE}
                AddToLog(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + iif(binserting, objSQL.InsertSql, objSQL.UpdateSql) + #10#13 + E.Message, ltWarning);
                {$ELSE}
                begin
                  SQLServer2Oracle.LogMessage(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + iif(binserting, objSQL.InsertSql, objSQL.UpdateSql) + #10#13 + E.Message, EVENTLOG_WARNING_TYPE, 0, 0);
                  SendMail(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + iif(binserting, objSQL.InsertSql, objSQL.UpdateSql) + #10#13 + E.Message);
                end;
                {$ENDIF}
            end;

            objSQL.PrimaryKey.Clear;
            objSQL.Fields.Clear;
            Next;
          end;
          dmPrincipal_SQLServer.CommitTrans;
        except
          on E: Exception do
            {$IFNDEF SERVICE}
            AddToLog(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + E.Message, ltError);
            {$ELSE}
            begin
              SQLServer2Oracle.LogMessage(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
              SendMail(aTablas[iLoop] + ': Error en la actualización de datos.' + #10#13 + E.Message);
            end;
            {$ENDIF}
        end;
      finally
        Free;
      end;
    end;
    {$IFNDEF SERVICE}
    AddToLog('El proceso migración desde SQLServer hacia Oracle ha finalizado.', ltInfo);
    {$ELSE}
    SQLServer2Oracle.LogMessage('El proceso migración desde SQLServer hacia Oracle ha finalizado.', EVENTLOG_INFORMATION_TYPE, 0, 0);
    {$ENDIF}
  finally
    Close;
    objSQL.Free;
    tslPK.Free;
  end;
end;

procedure TfrmPrincipal.JvAppEventsException(Sender: TObject; E: Exception);
begin
  {$IFNDEF SERVICE}
  AddToLog(E.Message, ltError);
  {$ELSE}
  SQLServer2Oracle.LogMessage(E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
  {$ENDIF}
end;

{$IFDEF SERVICE}
procedure TfrmPrincipal.SendMail(AMessage: String);
begin
  try
    if Pos('deadlocked', AMessage) = 0 then
    EnviarMailBD('patlante@provart.com.ar, ptavasci@provart.com.ar',
                 '[Conexia] Error en la migración desde SQLServer hacia Oracle', [],
                 AMessage + #13#10 + Memo.Lines.Text, nil, 0, tcDefault, True, False, 0);
  except
    on E: Exception do
      {$IFNDEF SERVICE}
      AddToLog('Error grave al enviar el mail' + #13#10 + E.Message, ltError);
      {$ELSE}
      SQLServer2Oracle.LogMessage('Error grave al enviar el mail' + #13#10 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      {$ENDIF}
  end;
end;
{$ENDIF}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
