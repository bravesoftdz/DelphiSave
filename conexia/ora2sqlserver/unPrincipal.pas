unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, JvExControls, JvComponent,
  JvWaitingGradient, JvWaitingProgress, ExtCtrls, JvAnimatedImage, JvGIFCtrl, Login, artDbLogin,
  JvTrayIcon, ImgList, JvAppEvent, JvComponentBase;

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
    Memo: TMemo;
    ilColor: TImageList;
    ilByN: TImageList;
    JvAppEvents: TJvAppEvents;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ArranqueTimer(Sender: TObject);
    procedure JvAppEventsException(Sender: TObject; E: Exception);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MostrarEstado(sTexto: String);
    procedure Procesar(const aTablas, aPrimaryKeys, aExtraCondition, aID: Array of String);
    procedure SendMail(AMessage: String);
    procedure MensajeDEBUG(ATexto: String);
    function SqlServerSqlDate(AFecha: TDateTime): String;
    function SqlServerSqlDateTime(AFecha: TDateTime): String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unSesion, AnsiSQL, SQLFuncs, DB, SqlServer, SqlOracle, unDebug,
  unArt, General, unDmPrincipal_SQLServer, {$IFDEF SERVICE}unMainService, {$ENDIF}
  unMoldeEnvioMail, CustomDlgs;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFNDEF SERVICE}
  Visible := True;
  Progreso.Animate := True;
  {$ENDIF}

  Update;
end;

procedure TfrmPrincipal.MostrarEstado(sTexto: String);
begin
  Memo.Lines.Add(sTexto);

  {$IFNDEF SERVICE}
  pnlEstado.Caption := sTexto;
  pnlEstado.Update;
  JvTrayIcon.Hint := sTexto;
  AddToLog(sTexto, ltWarning);
  {$ELSE}
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
  MostrarEstado('Conectando a Oracle...');
  Update;
  {$IFNDEF SERVICE}
  if not IsForm(dmPrincipal) then
    Application.CreateForm(TdmPrincipal, dmPrincipal);
  {$ENDIF}
  Update;
  MostrarEstado('Conectando a SQL Server...');
  Application.CreateForm(TdmPrincipal_SQLServer, dmPrincipal_SQLServer);
  Update;

  if dmPrincipal.sdbPrincipal.Connected and dmPrincipal_SQLServer.sdbPrincipal.Connected then
  begin
    {$IFNDEF SERVICE}
    ActivarLog;
    {$ENDIF}
    //DBLogin.Execute;
    Procesar(
      ['CLIE_EMPRESA', 'CLIE_DETALLE_REALIZADO',
       'CLIE_TRABAJADOR', 'CLIE_EMPRESA_TRABAJADOR',
       'CLIE_AUDITOR', 'CLIE_DETALLE_PRESCRIPTO',
       'CLIE_DIAGNOSTICO', 'CLIE_DIAGNOSTICO_AUTORIZADO',
       'CLIE_ESPECIALIDAD', 'CLIE_GUIA_MEDICA',
       'CLIE_LOCALIDAD', 'CLIE_MEDICO',
       'CLIE_PPM', 'CLIE_PPM_INHABILITADA',
       'CLIE_PRESTADOR', 'CLIE_PRESTADOR_A_DERIVAR',
       'CLIE_SINIESTRO', 'CLIE_USUARIO',
       'CLIE_SINIESTRO_NOCORRESPONDE', 'CLIE_INTERNACION'],

      ['CUIT', 'TICKET_ID, PPM_CODIGO',
       'PERSONA_COD', 'CUIT,DOCUMENTO',
       'NUMERO_LEGAJO_ADMINISTRADOR', 'NUMERO_SINIESTRO, PPM_CODIGO, FECHA_AUDITORIA',
       'DIAGNOSTICO_COD', 'DIAGNOSTICO_COD, PRESTADOR_COD',
       'ESPECIALIDAD_COD', 'GUIA_MEDICA_COD, PPM_CODIGO',
       'LOCALIDAD_COD', 'MEDICO_COD',
       'PPMCODIGO, PRESTADOR_COD', 'PPMCODIGO, PRESTADOR_COD',
       'PRESTADOR_COD', 'PRESTADOR_COD',
       'NUMERO_SINIESTRO, ACCIDENTE_ID', 'NOMBRE',
       'ACCIDENTE_ID', 'NUMERO_SINIESTRO, FECHA_TRANSACCION, TIPO_TRANSACCION_COD, PRESTADOR_COD, MOTIVO_ANULACION'],

      [' /*AND NUMERO_CONTRATO BETWEEN 50000 AND 50100*/ ', '',
       '', '',
       '', '',
       '', '',
       '', '',
       ' /*AND CODIGO_POSTAL <= 1440*/ ', '',
       '', '',
       '', '',
       '', '',
       '', ''],

      ['ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID',
       'ID', 'ID']
    );
  end;
end;

function TfrmPrincipal.SqlServerSqlDate(AFecha: TDateTime): String;
begin
  if StrToIntDef(FormatDateTime('yyyy', AFecha), 0) in [StrToIntDef(FormatDateTime('yy', Now), 0)..99] then
  begin
    MensajeDEBUG('Año erróneo detectado! ' + DateToStr(AFecha) + CRLF + 'Le sumo 1900');
    AFecha := AFecha + 1900;
  end;

  if StrToIntDef(FormatDateTime('yyyy', AFecha), 0) in [1..StrToIntDef(FormatDateTime('yy', Now), 0)] then
  begin
    MensajeDEBUG('Año erróneo detectado! ' + DateToStr(AFecha) + CRLF + 'Le sumo 2000');
    AFecha := AFecha + 2000;
  end;

  Result := SqlServer.SqlDate(AFecha);
end;

function TfrmPrincipal.SqlServerSqlDateTime(AFecha: TDateTime): String;
begin
  if StrToIntDef(FormatDateTime('yyyy', AFecha), 0) in [StrToIntDef(FormatDateTime('yy', Now), 0)..99] then
  begin
    MensajeDEBUG('Año erróneo detectado! ' + DateToStr(AFecha) + CRLF + 'Le sumo 1900');
    AFecha := AFecha + 1900;
  end;

  if StrToIntDef(FormatDateTime('yyyy', AFecha), 0) in [1..StrToIntDef(FormatDateTime('yy', Now), 0)] then
  begin
    MensajeDEBUG('Año erróneo detectado! ' + DateToStr(AFecha) + CRLF + 'Le sumo 2000');
    AFecha := AFecha + 2000;
  end;

  Result := SqlServer.SqlDateTime(AFecha);
end;

procedure TfrmPrincipal.Procesar(const aTablas, aPrimaryKeys, aExtraCondition, aID: Array of String);

  procedure CompletarCampos(objFields: TSqlFields; aFields: TFields; const aTabla: String);
  var
    iField: Integer;
  begin
    with dmPrincipal_SQLServer.GetQuery('SELECT * FROM ' + aTabla + ' WHERE 1 = 2') do
    try
      for iField := 0 to aFields.Count - 1 do
        if FindField(aFields[iField].FieldName) <> nil then
          if not aFields[iField].IsNull then
            case aFields[iField].DataType of
              ftFmtMemo, ftFixedChar, ftWideString, ftMemo, ftString:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsString, dtString);
              ftBytes, ftLargeint, ftCurrency, ftInteger, ftSmallint, ftWord, ftFloat:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsFloat, dtNumber);
              ftBoolean:
                objFields.Add(aFields[iField].FullName, aFields[iField].AsBoolean, dtBoolean);
              ftDate:
                objFields.Add(aFields[iField].FullName, SqlServerSqlDate(aFields[iField].AsDateTime), dtCustom);
              ftTime, ftDateTime:
                objFields.Add(aFields[iField].FullName, SqlServerSqlDateTime(aFields[iField].AsDateTime), dtCustom);
            end
          else
            if UpperCase(aFields[iField].FullName) <> 'ID' then
              objFields.Add(aFields[iField].FullName, exNull, dtExpression);
    finally
      Free;
    end;
  end;

var
//  dFecha: TDateTime;
  iLoop, iLoopPK, iCantidad, iUltimoIdInsertado: Integer;
  sSQL, sPK_Oracle, sPK_SqlServer: String;
  tslPK: TStringList;
  objSQL: TSqlServer;
  bInserting: boolean;
begin
  iUltimoIdInsertado := 0;
  objSQL := TSqlServer.Create('Nombre de la tabla');
  tslPK := TStringList.Create;
  try
    {$IFNDEF SERVICE}
    AddToLog('El proceso migración desde Oracle hacia SQLServer ha comenzado.', ltInfo);
    {$ELSE}
    Ora2SQLServer.LogMessage('El proceso migración desde Oracle hacia SQLServer ha comenzado.', EVENTLOG_INFORMATION_TYPE, 0, 0);
    {$ENDIF}
    Sleep(200);
    for iLoop := Low(aTablas) to High(aTablas) do
    begin
      MostrarEstado('Verificando actualizaciones de ' + aTablas[iLoop] + '...');
      {$IFNDEF SERVICE}
      AddToLog('Tabla: ' + aTablas[iLoop], ltInfo);
      {$ELSE}
      //Ora2SQLServer.LogMessage('Tabla: ' + aTablas[iLoop], EVENTLOG_INFORMATION_TYPE, 0, 0);
      {$ENDIF}
{
      dFecha := dmPrincipal.ValorSqlDateTimeEx('SELECT MAX(RM_FECHAFINALIZACION) FROM CEM.ERM_REGISTROMOVIMIENTOS WHERE RM_TABLA = :V1', [aTablas[iLoop]]);
      if dFecha = 0 then
        dFecha := ART_MINFECHA;
}
      sSQL := 'SELECT * ' +
                'FROM CONEXIA.' + aTablas[iLoop] +
              ' WHERE PROCESADO = 0 ' + aExtraCondition[iLoop];

      with dmPrincipal.GetQuery(sSQL) do
      try
        MensajeDEBUG('Abro la consulta');
        if not IsEmpty then
        try
          dmPrincipal.BeginTrans(True);

          sSQL := 'SELECT 1 FROM CONEXIA.' + aTablas[iLoop] +
                  ' WHERE PROCESADO = 0 ' + aExtraCondition[iLoop];

          iCantidad := dmPrincipal.ValorSQL('SELECT COUNT(*) FROM (' + sSQL + ')');
          MostrarEstado(Format('Se encontraron %d registros para actualizar...', [iCantidad]));
{
          dmPrincipal.EjecutarSQLSTEx('INSERT INTO CEM.ERM_REGISTROMOVIMIENTOS (RM_USUARIO, RM_FECHAINICIO, RM_FECHAFINALIZACION, RM_TABLA) VALUES (:Usuario, SYSDATE, NULL, :Tabla)', [Sesion.UserID, aTablas[iLoop]]);
}
          Update;
          objSQL.TableName := aTablas[iLoop];

          while not Eof do
          begin
            dmPrincipal.BeginTrans(True);

            MostrarEstado(Format('%s: Actualizando %d de %d registros...', [aTablas[iLoop], RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]));
            CompletarCampos(objSQL.Fields, Fields, aTablas[iLoop]);
            bInserting := True;

            try
              sPK_Oracle := '';
              tslPK.CommaText := aPrimaryKeys[iLoop];
              for iLoopPK := 0 to tslPK.Count - 1 do
              begin
                if not FindField(tslPK[iLoopPK]).IsNull then
                  case FindField(tslPK[iLoopPK]).DataType of
                    ftFmtMemo, ftFixedChar, ftWideString, ftMemo, ftString:
                      sPK_Oracle := sPK_Oracle + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLOracle.SqlString(FindField(tslPK[iLoopPK]).AsString, True);
                    ftBytes, ftLargeint, ftCurrency, ftInteger, ftSmallint, ftWord, ftFloat:
                      sPK_Oracle := sPK_Oracle + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLOracle.SqlNumber(FindField(tslPK[iLoopPK]).AsFloat, True);
                    ftBoolean:
                      sPK_Oracle := sPK_Oracle + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLOracle.SqlBoolean(FindField(tslPK[iLoopPK]).AsString = 'S');
                    ftDate:
                      sPK_Oracle := sPK_Oracle + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLOracle.SqlDate(Trunc(FindField(tslPK[iLoopPK]).AsDateTime));
                    ftTime, ftDateTime:
                      sPK_Oracle := sPK_Oracle + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLOracle.SqlDateTime(FindField(tslPK[iLoopPK]).AsDateTime);
                  end;
              end;

              sPK_SqlServer := '';
              tslPK.CommaText := aPrimaryKeys[iLoop];
              for iLoopPK := 0 to tslPK.Count - 1 do
              begin
                if not FindField(tslPK[iLoopPK]).IsNull then
                  case FindField(tslPK[iLoopPK]).DataType of
                    ftFmtMemo, ftFixedChar, ftWideString, ftMemo, ftString:
                      sPK_SqlServer := sPK_SqlServer + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLServer.SqlString(FindField(tslPK[iLoopPK]).AsString, True);
                    ftBytes, ftLargeint, ftCurrency, ftInteger, ftSmallint, ftWord, ftFloat:
                      sPK_SqlServer := sPK_SqlServer + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLServer.SqlNumber(FindField(tslPK[iLoopPK]).AsFloat, True);
                    ftBoolean:
                      sPK_SqlServer := sPK_SqlServer + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLServer.SqlBoolean(FindField(tslPK[iLoopPK]).AsString = 'S');
                    ftDate:
                      sPK_SqlServer := sPK_SqlServer + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLServerSqlDate(Trunc(FindField(tslPK[iLoopPK]).AsDateTime));
                    ftTime, ftDateTime:
                      sPK_SqlServer := sPK_SqlServer + ' AND ' + tslPK[iLoopPK] + ' = ' + SQLServerSqlDateTime(FindField(tslPK[iLoopPK]).AsDateTime);
                  end;
              end;

              if FieldByName(aID[iLoop]).IsNull then
              begin
                try
                  {$IFNDEF SERVICE}
//                  if not MsgAsk('Voy a ejecutar' + CRLF + objSQL.InsertSql) then
//                    Abort;
                  {$ENDIF}
                  
                  dmPrincipal_SQLServer.EjecutarSQL(objSQL.InsertSql);
                  {$IFNDEF SERVICE}
                  AddToLog(objSQL.InsertSql, ltSQL);
                  {$ENDIF}

                  iUltimoIdInsertado := dmPrincipal_SQLServer.ValorSQL('SELECT @@identity');
                except
                  on E: Exception do
                  begin
                    {$IFNDEF SERVICE}
                    AddToLog(E.Message, ltError);
                    {$ELSE}
                    Ora2SQLServer.LogMessage(E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
                    {$ENDIF}

                    iUltimoIdInsertado := dmPrincipal_SQLServer.ValorSQLInteger('SELECT ' + aID[iLoop] +
                                                                                 ' FROM ' + aTablas[iLoop] +
                                                                                ' WHERE 1 = 1 ' + sPK_SqlServer);
                  end;
                end;

                try
                  dmPrincipal.EjecutarSQLSTEx('UPDATE CONEXIA.' + aTablas[iLoop] +
                                                ' SET ' + aID[iLoop] + ' = :ID, ' +
                                                     'FECHA_PROCESADO = SYSDATE, ' +
                                                     'PROCESADO = 1 ' +
                                               'WHERE 1 = 1 ' + sPK_Oracle, [iUltimoIdInsertado]);

                  {$IFNDEF SERVICE}
//                  if not MsgAsk('Acabo de ejecutar' + CRLF + dmPrincipal.sdqConsulta.SQL.Text) then
//                    Abort;
                  {$ENDIF}
                except
                on E: Exception do
                  {$IFNDEF SERVICE}
                  AddToLog(CRLF + aTablas[iLoop] + ': Error en la actualización de datos (update en Oracle).' + CRLF + dmPrincipal.sdqConsulta.SQL.Text + #10#13 + E.Message, ltWarning);
                  {$ELSE}
                  Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': Error en la actualización de datos (update en Oracle).' + CRLF + dmPrincipal.sdqConsulta.SQL.Text + #10#13 + E.Message, EVENTLOG_WARNING_TYPE, 0, 0);
                  {$ENDIF}
                end;
              end else
              begin
                bInserting := False;
                objSQL.Fields.Delete(objSQL.Fields.FieldByName[aID[iLoop]].Index);
                for iLoopPK := 0 to tslPK.Count - 1 do
                  objSQL.Fields.Delete(objSQL.Fields.FieldByName[tslPK[iLoopPK]].Index);
                for iLoopPK := 0 to tslPK.Count - 1 do
                begin
                  if not FindField(tslPK[iLoopPK]).IsNull then
                    case FindField(tslPK[iLoopPK]).DataType of
                      ftFmtMemo, ftFixedChar, ftWideString, ftMemo, ftString:
                        objSQL.PrimaryKey.AddString(tslPK[iLoopPK], FindField(tslPK[iLoopPK]).AsString, True);
                      ftBytes, ftLargeint, ftCurrency, ftInteger, ftSmallint, ftWord, ftFloat:
                        objSQL.PrimaryKey.AddExtended(tslPK[iLoopPK], FindField(tslPK[iLoopPK]).AsFloat, -1, True);
                      ftBoolean:
                        objSQL.PrimaryKey.AddString(tslPK[iLoopPK], SQLServer.SqlBoolean(FindField(tslPK[iLoopPK]).AsBoolean), True);
                      ftDate:
                        objSQL.PrimaryKey.AddDate(tslPK[iLoopPK], SQLServerSqlDate(FindField(tslPK[iLoopPK]).AsDateTime));
                      ftTime, ftDateTime:
                        begin
                        {
                        Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': Valor de la FECHA recuperada del SELECT!.' + CRLF + DateToStr(FindField(tslPK[iLoopPK]).AsDateTime), EVENTLOG_ERROR_TYPE, 0, 0);
                        Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': FECHA con HORA!.' + CRLF + FormatDateTime('dd/mm/yyyy hh:nn:ss', FindField(tslPK[iLoopPK]).AsDateTime), EVENTLOG_ERROR_TYPE, 0, 0);
                        Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': FECHA con HORA!.' + CRLF + FormatDateTime('yyyy-mm-dd hh:nn:ss', FindField(tslPK[iLoopPK]).AsDateTime), EVENTLOG_ERROR_TYPE, 0, 0);
                        Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': Función SQLServer.SQLDateTime!.' + CRLF +  SQLServer.SqlDateTime(FindField(tslPK[iLoopPK]).AsDateTime), EVENTLOG_ERROR_TYPE, 0, 0);
                        }
                        objSQL.PrimaryKey.AddDateTime(tslPK[iLoopPK], {SQLServer.SqlDateTime(}FindField(tslPK[iLoopPK]).AsDateTime{)});
                        //Ora2SQLServer.LogMessage(CRLF + 'Valor de la FECHA en la PK:' + CRLF + FormatDateTime('dd/mm/yyyy hh:nn:ss', TDateTime(objSQL.PrimaryKey.FieldByName[tslPK[iLoopPK]].Value)), EVENTLOG_ERROR_TYPE, 0, 0);
                        end;
                    end;
                end;

                {$IFNDEF SERVICE}
//                if not MsgAsk('Voy a ejecutar' + CRLF + objSQL.UpdateSql) then
//                  Abort;
                {$ENDIF}

                dmPrincipal_SQLServer.EjecutarSQL(objSQL.UpdateSql);
                {$IFNDEF SERVICE}
                AddToLog(objSQL.UpdateSql, ltSQL);
                {$ENDIF}
                //Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': Ejecutando el SQL del UPDATE en SQL Server.' + CRLF + objSQL.UpdateSql, EVENTLOG_WARNING_TYPE, 0, 0);

                iUltimoIdInsertado := dmPrincipal_SQLServer.ValorSQLInteger('SELECT ' + aID[iLoop] +
                                                                             ' FROM ' + aTablas[iLoop] +
                                                                            ' WHERE 1 = 1 ' + sPK_SqlServer);

                sSQL := 'UPDATE CONEXIA.' + aTablas[iLoop] +
                          ' SET ' + aID[iLoop] + ' = :ID, ' +
                               'FECHA_PROCESADO = SYSDATE, ' +
                               'PROCESADO = 1 ' +
                         'WHERE 1 = 1 ' + sPK_Oracle;

                AddToLog(sSQL, ltSQL);
                dmPrincipal.EjecutarSQLSTEx(sSQL, [iUltimoIdInsertado]);

                {$IFNDEF SERVICE}
//                if not MsgAsk('Acabo de ejecutar' + CRLF + dmPrincipal.sdqConsulta.SQL.Text) then
//                  Abort;
                {$ENDIF}                  
              end;
            except
              on E: Exception do
                {$IFNDEF SERVICE}
                AddToLog(CRLF + aTablas[iLoop] + ': Error en la actualización de datos.' + CRLF + iif(binserting, objSQL.InsertSql, objSQL.UpdateSql) + #10#13 + E.Message, ltWarning);
                {$ELSE}
                Ora2SQLServer.LogMessage(CRLF + aTablas[iLoop] + ': Error en la actualización de datos.' + CRLF + iif(binserting, objSQL.InsertSql, objSQL.UpdateSql) + #10#13 + E.Message, EVENTLOG_WARNING_TYPE, 0, 0);
                {$ENDIF}
            end;

            objSQL.PrimaryKey.Clear;
            objSQL.Fields.Clear;
            Next;

            if (RecNo mod 100) = 0 then
              dmPrincipal.CommitTrans(True);
          end;
{
          dmPrincipal.EjecutarSQLSTEx('UPDATE CEM.ERM_REGISTROMOVIMIENTOS SET RM_FECHAFINALIZACION = SYSDATE WHERE RM_FECHAFINALIZACION IS NULL AND RM_USUARIO = :Usuario', [Sesion.UserID]);
}
          MensajeDEBUG('Hago commit');
          dmPrincipal.CommitTrans(True);
        except
          on E: Exception do
          begin
            {$IFNDEF SERVICE}
            AddToLog('Error en la actualización de datos.' + #10#13 + E.Message, ltError);
            {$ELSE}
            Ora2SQLServer.LogMessage('Error en la actualización de datos.' + #10#13 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
            {$ENDIF}
            dmPrincipal.RollBack;
          end;
        end;
      finally
        MensajeDEBUG('Libero la consulta');
        Free;
      end;
    end;
    {$IFNDEF SERVICE}
    AddToLog('El proceso migración desde Oracle hacia SQLServer ha finalizado.', ltInfo);
    {$ELSE}
    Ora2SQLServer.LogMessage('El proceso migración desde Oracle hacia SQLServer ha finalizado.', EVENTLOG_INFORMATION_TYPE, 0, 0);
    {$ENDIF}
  finally
    MensajeDEBUG('Fin del proceso de migración');
//    Close;
    objSQL.Free;
    MensajeDEBUG('objSQL destruido');
    tslPK.Free;
    MensajeDEBUG('tslPK destruido');
  end;
end;

procedure TfrmPrincipal.SendMail(AMessage: String);
begin
  try
    EnviarMailBD('patlante@provart.com.ar, ptavasci@provart.com.ar',
                 '[Conexia] Error en la migración desde Oracle hacia SQLServer', [],
                 AMessage + #13#10 + Memo.Lines.Text, nil, 0, tcDefault, False, False, 0);
  except
    on E: Exception do
      {$IFNDEF SERVICE}
      AddToLog('Error grave al enviar el mail' + #13#10 + E.Message, ltError);
      {$ELSE}
      Ora2SQLServer.LogMessage('Error grave al enviar el mail' + #13#10 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      {$ENDIF}
  end;
end;

procedure TfrmPrincipal.JvAppEventsException(Sender: TObject; E: Exception);
begin
  SendMail(E.Message + #10#13 + Memo.Lines.Text);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  MensajeDEBUG('Fin del ejecutable');
//  FreeAndNil(frmPrincipal);
end;

procedure TfrmPrincipal.MensajeDEBUG(ATexto: String);
begin
  {$IFNDEF SERVICE}
//  MsgBox(ATexto);
  {$ENDIF}
end;

end.
