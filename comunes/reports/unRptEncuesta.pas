unit unRptEncuesta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnRptMoldeCarta, Data.DB, SDEngine,
  QRCtrls, QuickRpt, Vcl.ExtCtrls, qrcb_run, DBSql, SqlFuncs;

type
  TqrEncuesta = class(TqrMoldeCarta)
    sdqDetalle: TSDQuery;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    sdqDetalleMP_USUARIO: TStringField;
    sdqDetalleMP_CATEGORIA: TStringField;
    sdqDetalleMP_PREGUNTA: TStringField;
    sdqDetalleMP_TIPO: TStringField;
    sdqDetalleMP_RESPUESTA: TStringField;
    sdqDetalleMP_ELEGIDA: TStringField;
    sdqDetalleMP_ORDEN: TFloatField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    chkElegida: TQRCheckBox;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrePagina: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    qrlCUIT: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    qrdbFechaFinalizado: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    qrlNoFinalizada: TQRLabel;
    qrlNoFinalizada2: TQRLabel;
    qrlNoAsignado: TQRLabel;
    qrlNoAsignado2: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FIdEncuestaInstancia: Integer;
    procedure SetIdEncuestaInstancia(const Value: Integer);
  public
    class function GenerarPDF(AIdEncuestaInstancia: Integer): Boolean;
    property IdEncuestaInstancia: Integer read FIdEncuestaInstancia write SetIdEncuestaInstancia;
  end;

var
  qrEncuesta: TqrEncuesta;

implementation

{$R *.dfm}

uses unDmPrincipal, unVisualizador, unExportPDF, CUIT, ArchFuncs, unSesion, AnsiSql, CustomDlgs, unArt, unSIC;

class function TqrEncuesta.GenerarPDF(AIdEncuestaInstancia: Integer): Boolean;
var
  nID: Integer;
  Stream: TFileStream;
  sPDFFileName: String;
  iIdtareaSIC: Integer;
begin
  Application.CreateForm(TqrEncuesta, qrEncuesta);

  with qrEncuesta do
  try
    iIdtareaSIC := ValorSqlIntegerEx('SELECT EI_IDTAREASIC FROM COMERCIAL.CEI_ENCUESTAINSTANCIA WHERE EI_ID = :ID', [AIdEncuestaInstancia]);

    if iIdtareaSIC > 0 then
    begin
      FIdEncuestaInstancia := AIdEncuestaInstancia;
      BeginTrans(True);
      try
        OpenQueryEx(sdqDatos, [AIdEncuestaInstancia]);
        sPDFFileName := IncludeTrailingPathDelimiter(TempPath) + 'Encuesta' + IntToStr(AIdEncuestaInstancia) + '.pdf';
        FileToPDFSvr(qrEncuesta, ExtractFileDir(sPDFFileName), sPDFFileName);
      finally
        CommitTrans(True);
      end;

      BeginTrans(True);
      with TDBSql.Create('agenda.ajt_adjuntotarea') do
      try
        with Fields do
        try
          Add('jt_filename', ExtractFileName(sPDFFileName));
          Add('jt_fullpathfilename', sPDFFileName);
          Add('jt_idagendatarea', iIdTareaSIC);

          SqlType := stInsert;
          Add('jt_usualta', Sesion.UserID);
          Add('jt_fechaalta', exDateTime);
          nID := GetSecNextVal('agenda.seq_ajt_id');
          PrimaryKey.Add('jt_id', nID);

          EjecutarSqlST(Sql);
          Stream := TFileStream.Create(sPDFFileName, fmOpenRead);
          try
            SaveBlob('SELECT jt_file ' +
                      ' FROM agenda.ajt_adjuntotarea ' +
                     ' WHERE jt_id = ' + SqlValue(nID),
                     'UPDATE agenda.ajt_adjuntotarea '+
                       ' SET jt_file = :jt_file ' +
                     ' WHERE jt_id = ' + SqlValue(nID),
                     'jt_file', Stream);
          finally
            Stream.Free;
          end;
          EjecutarSqlSTEx('UPDATE agenda.aat_agendatarea ' +
                             'SET at_idcontacto = :idcontacto, ' +
                                 'at_contrato = :contrato ' +
                           'WHERE at_id = :id ', [sdqDatos.FieldByName('EI_IDCONTACTO').AsInteger,
                                                  sdqDatos.FieldByName('EI_CONTRATO').AsInteger,
                                                  iIdTareaSIC]);
          do_agendartarea(iIdTareaSIC, DBDateTime, Sesion.ID, 'Tarea cerrada automáticamente', 0);
          CommitTrans(True);
          Verificar(ExisteSqlEx('SELECT 1 FROM agenda.ajt_adjuntotarea WHERE jt_file IS NULL AND jt_id = :id', [nID]),
                    nil,
                    'Hubo un incidente al adjuntar el archivo seleccionado, consulte con Sistemas sobre la posible causa.' + CRLF + CRLF +
                    'Tenga en cuenta que el archivo que acaba de adjuntar no podrá ser visualizado por otros usuarios en estas condiciones.');
          Result := True;
        except
          Rollback(True);
          Result := False;
        end;
      finally
        Free;
        Application.ProcessMessages;
        while not DeleteFile(sPDFFileName) do
          Sleep(500);
      end;
    end;
    Result := True;
  finally
    Free;
  end;
end;

procedure TqrEncuesta.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  chkElegida.Checked := sdqDetalle.FieldByName('MP_ELEGIDA').AsString = 'X';
  chkElegida.Enabled := (sdqDetalle.FieldByName('MP_TIPO').AsString = 'R') or (sdqDetalle.FieldByName('MP_TIPO').AsString = 'Q');
end;

procedure TqrEncuesta.qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlCUIT.Caption := PonerGuiones(sdqDatos.FieldByName('EM_CUIT').AsString);
  qrlNoFinalizada.Enabled := sdqDatos.FieldByName('EI_FECHATERMINADO').IsNull;
  qrlNoFinalizada2.Enabled := qrlNoFinalizada.Enabled;
  qrlNoAsignado.Enabled := sdqDatos.FieldByName('SE_NOMBRE').IsNull;
  qrlNoAsignado2.Enabled := qrlNoAsignado.Enabled;
end;

procedure TqrEncuesta.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  ShowDatosART := False;
  ShowLogoGBP := False;
end;

procedure TqrEncuesta.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  EjecutarStoreSTEx('encuesta.generar_reporte_encuesta(:id);', [IdEncuestaInstancia]);
  OpenQuery(sdqDetalle);
end;

procedure TqrEncuesta.SetIdEncuestaInstancia(const Value: Integer);
begin
  FIdEncuestaInstancia := Value;

  BeginTrans(True);
  try
    OpenQueryEx(sdqDatos, [Value]);
    Visualizar(qrEncuesta, GetValores(' ' + IntToStr(Value),
                                      sdqDatos.FieldByName('CO_DIRELECTRONICA').AsString,
                                      sdqDatos.FieldByName('EI_CONTRATO').AsInteger,
                                      0,
                                      sdqDatos.FieldByName('EN_DESCRIPCION').AsString),
               [oForceDB, oAlwaysShowDialog, oForceShowModal, oAutoFirma, oSinTransaccion], True, '', '', True);
    CommitTrans(True);
  except
    RollBack(True);
  end;
end;

end.
