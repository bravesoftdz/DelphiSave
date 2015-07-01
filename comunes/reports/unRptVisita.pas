unit unRptVisita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnRptMoldeCarta, Data.DB, SDEngine,
  QRCtrls, QuickRpt, Vcl.ExtCtrls, qrcb_run, DBSql, SqlFuncs;

type
  TqrVisita = class(TqrMoldeCarta)
    sdqDetalle: TSDQuery;
    qrbDetalle: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    chkElegida: TQRCheckBox;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrePagina: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlEmpresa: TQRLabel;
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
    qrlNoAsignado: TQRLabel;
    qrlNoAsignado2: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    sdqDetalleTEMA: TStringField;
    sdqDetalleBREADCRUMB: TStringField;
    sdqDetalleSELECCIONADO: TStringField;
    ChildBand5: TQRChildBand;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    qrbObservaciones: TQRChildBand;
    QRDBText5: TQRDBText;
    qrbObservacionesDetalle: TQRChildBand;
    QRDBText9: TQRDBText;
    sdqDetalleOBSERVACIONES: TStringField;
    qrbRespuestaDetalle: TQRChildBand;
    QRDBText17: TQRDBText;
    sdqDetalleRESPUESTA: TStringField;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure qrbDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbObservacionesDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbRespuestaDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FIdvisitaInstancia: Integer;
    procedure SetIdVisitaInstancia(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;

    class function GenerarPDF(AIdVisitaInstancia: Integer): Boolean;
    property IdVisitaInstancia: Integer read FIdVisitaInstancia write SetIdVisitaInstancia;
  end;

var
  qrVisita: TqrVisita;

implementation

{$R *.dfm}

uses unDmPrincipal, unVisualizador, unExportPDF, CUIT, ArchFuncs, unSesion, AnsiSql, CustomDlgs, unArt, unSIC, General;

constructor TqrVisita.Create(AOwner: TComponent);
begin
  inherited;
  ShowReferencia := False;
end;

class function TqrVisita.GenerarPDF(AIdVisitaInstancia: Integer): Boolean;
var
  nID: Integer;
  Stream: TFileStream;
  sPDFFileName: String;
  iIdtareaSIC: Integer;
begin
  Application.CreateForm(TqrVisita, qrVisita);

  with qrVisita do
  try
    iIdtareaSIC := ValorSqlIntegerEx('SELECT VI_IDTAREASIC FROM COMERCIAL.CVI_VISITAINSTANCIA WHERE VI_ID = :ID', [AIdVisitaInstancia]);

    if iIdtareaSIC > 0 then
    begin
      FIdVisitaInstancia := AIdVisitaInstancia;
      BeginTrans(True);
      try
        OpenQueryEx(sdqDatos, [AIdVisitaInstancia]);
        sPDFFileName := IncludeTrailingPathDelimiter(TempPath) + 'Visita' + IntToStr(AIdVisitaInstancia) + '.pdf';
        FileToPDFSvr(qrVisita, ExtractFileDir(sPDFFileName), sPDFFileName);
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
                           'WHERE at_id = :id ', [sdqDatos.FieldByName('vi_IDCONTACTO').AsInteger,
                                                  sdqDatos.FieldByName('vi_CONTRATO').AsInteger,
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

procedure TqrVisita.qrbDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  chkElegida.Checked := sdqDetalle.FieldByName('SELECCIONADO').AsString = 'S';

  if not(sdqDetalle.FieldByName('OBSERVACIONES').IsNull and sdqDetalle.FieldByName('RESPUESTA').IsNull) then
  begin
    qrbObservacionesDetalle.ParentBand := qrbDetalle;
    qrbRespuestaDetalle.ParentBand := qrbObservacionesDetalle;
  end
  else
  if not(sdqDetalle.FieldByName('OBSERVACIONES').IsNull) and sdqDetalle.FieldByName('RESPUESTA').IsNull then
  begin
    qrbObservacionesDetalle.ParentBand := qrbDetalle;
    qrbRespuestaDetalle.ParentBand := nil;
  end
  else
  if sdqDetalle.FieldByName('OBSERVACIONES').IsNull and not(sdqDetalle.FieldByName('RESPUESTA').IsNull) then
  begin
    qrbObservacionesDetalle.ParentBand := nil;
    qrbRespuestaDetalle.ParentBand := qrbDetalle;
  end
  else
  if sdqDetalle.FieldByName('OBSERVACIONES').IsNull and sdqDetalle.FieldByName('RESPUESTA').IsNull then
  begin
    qrbObservacionesDetalle.ParentBand := nil;
    qrbRespuestaDetalle.ParentBand := nil;
  end;

end;

procedure TqrVisita.qrbObservacionesDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not sdqDetalle.FieldByName('OBSERVACIONES').IsNull;
end;

procedure TqrVisita.qrbRespuestaDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not sdqDetalle.FieldByName('RESPUESTA').IsNull;
end;

procedure TqrVisita.qrbTitleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlCUIT.Caption := PonerGuiones(sdqDatos.FieldByName('EM_CUIT').AsString);
  //qrlNoFinalizada.Enabled := sdqDatos.FieldByName('vi_fechainiciovisita').IsNull;
  //qrlNoFinalizada2.Enabled := qrlNoFinalizada.Enabled;
  qrlNoAsignado.Enabled := sdqDatos.FieldByName('USUARIOVISITA').IsNull;
  qrlNoAsignado2.Enabled := qrlNoAsignado.Enabled;

  qrdbFechaFinalizado.Caption := IIF(sdqDatos.FieldByName('VI_FECHAINICIOVISITA').IsNull, '1', '2');
end;

procedure TqrVisita.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  ShowDatosART := False;
  ShowLogoGBP := False;
  qrlDestinatario.Visible := False;
  qrlDestinatario.Enabled := False;
end;

procedure TqrVisita.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //EjecutarStoreSTEx('visita.generar_reporte_visita(:id);', [IdVisitaInstancia]);
  OpenQueryEx(sdqDetalle, [FIdVisitaInstancia,
                           sdqDatos.FieldByName('vi_idvisita').AsInteger]);
end;

procedure TqrVisita.SetIdVisitaInstancia(const Value: Integer);
begin
  FIdVisitaInstancia := Value;
  BeginTrans(True);
  try
    OpenQueryEx(sdqDatos, [Value]);
    Visualizar(qrVisita, GetValores(IntToStr(Value),
                         sdqDatos.FieldByName('CO_DIRELECTRONICA').AsString,
                         sdqDatos.FieldByName('vi_CONTRATO').AsInteger,
                         0,
                         sdqDatos.FieldByName('vs_DESCRIPCION').AsString),
                         [oForceDB, oAlwaysShowDialog, oForceShowModal, oAutoFirma, oSinTransaccion],
                         True,
                         '',
                         '',
                         True);
    CommitTrans(True);
  except
    RollBack(True);
  end;
end;

end.
