unit unEnviarSolicitudAuditoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  ExtCtrls, unArtDBAwareFrame, unFraStaticCodigoDescripcion;

type
  TImprimir = (tiImp, tiPrev);

  TfrmEnviarSolicitudAuditoria = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    fraAuditor: TfraStaticCodigoDescripcion;
    Panel2: TPanel;
    btnVistaPrevia: TButton;
    btnEnviadoMano: TButton;
    btnModificarAudit: TButton;
    btnGenerarEnvio: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGenerarEnvioClick(Sender: TObject);
    procedure btnVistaPreviaClick(Sender: TObject);
    procedure btnModificarAuditClick(Sender: TObject);
    procedure btnEnviadoManoClick(Sender: TObject);
  private
    FGravedad: String;
    FSolicitudes: String;
    FTipoEnvio: String;
    FSeguimientoId: integer;
    bDeclaracionAccEnviada: boolean;
    procedure GenerarEnvio(sTipo:string);
    procedure GenerarEnvioEnMano;
    procedure AcualizaTablasEnviaryAutorizar(sIdSolicitud:string);  // Lu unifique por WF 8121
    procedure Imprimir(vTipoImp: TImprimir; vPrimerId: integer);  // Lu WF 8121
  public
    function Mostrar(const aSolicitudes: String; const aGravedad: String; const aTipoEnvio: String; const aSeguimientoId: integer; bVerEnvioMano: boolean = False): Boolean; overload;
    function Mostrar(const aSiniestro, aOrden, aRecaida, aParte: Integer; const aGravedad: String): Boolean; overload;
  end;

var
  frmEnviarSolicitudAuditoria: TfrmEnviarSolicitudAuditoria;

implementation

uses
  unRptSolicitudAuditoria, ArchFuncs, unExportPDF, unMoldeEnvioMail, unEnvioMail, unDmPrincipal, unPrincipal, CustomDlgs,
  Internet, AnsiSql, unRptSolicitudAuditoriaGrave, General, unSolicitudAuditoria,
  unRptDeclaracionAccidentado;

{$R *.DFM}

function TfrmEnviarSolicitudAuditoria.Mostrar(const aSolicitudes: String; const aGravedad: String; const aTipoEnvio: String; const aSeguimientoId: integer; bVerEnvioMano: boolean = False): Boolean;
begin
  FSolicitudes := aSolicitudes;
  FGravedad    := aGravedad;

  FTipoEnvio     := aTipoEnvio;     // Lu wf 7535
  FSeguimientoId := aSeguimientoId; // Lu wf 7535

  btnModificarAudit.Visible := (FTipoEnvio = cENVIO_MODIF);  // Lu wf 7535
  btnEnviadoMano.Visible    := bVerEnvioMano;                // Lu wf 8121
  btnGenerarEnvio.Visible   := (FTipoEnvio = cENVIO_AUDIT);
  btnVistaPrevia.Visible    := (FTipoEnvio = cENVIO_AUDIT);
  Caption := iif((FTipoEnvio = cENVIO_AUDIT), 'Enviar Solicitud de Auditoría', 'Modificar Médico Auditor');

  btnVistaPrevia.Enabled := (Pos(',', FSolicitudes) = 0);

  Result := (ShowModal = mrOk);
end;

function TfrmEnviarSolicitudAuditoria.Mostrar(const aSiniestro, aOrden, aRecaida, aParte: Integer;
                                              const aGravedad: String): Boolean;
var
  sSql: String;
begin
  FGravedad := aGravedad;

  sSql :=
    'SELECT su_id' +
     ' FROM ssu_seguimientoauditoria' +
    ' WHERE su_siniestro = ' + SqlValue(aSiniestro) +
      ' AND su_orden = ' + SqlValue(aOrden) +
      ' AND su_recaida = ' + SqlValue(aRecaida) +
      ' AND su_nroparte = ' + SqlValue(aParte);
  FSolicitudes := ValorSql(sSql);

  btnVistaPrevia.Enabled := (Pos(',', FSolicitudes) = 0);

  Result := (ShowModal = mrOk);
end;

procedure TfrmEnviarSolicitudAuditoria.GenerarEnvio(sTipo:string);
var
  aFiles: TArrayOfAttach;
  aIdSolicitudes: TStringList;
  SqlResults: TStringList;
  iLoop, iPos, iIdExpediente: Integer;
  sEmail: String;
  sNombreArchivo: String;
  sSql: String;
  rptDeclaracionAccidentado: TrptDeclaracionAccidentado;
begin
  aIdSolicitudes := TStringList.Create;
  SqlResults     := TStringList.Create;
  try
    aIdSolicitudes.CommaText := FSolicitudes;
    SetLength(aFiles, aIdSolicitudes.Count);
    iPos := 0;

    SqlResults := ValoresColSql('SELECT (SU_CANTAUDIT + SU_CANTAUDITCUMPLIDAS) CANTAUDIT, ' +
                                      ' utiles.armar_siniestro(SU_SINIESTRO, SU_ORDEN, SU_RECAIDA, ''/'') SINIESTRO, SU_IDEXPEDIENTE ' +
                                 ' FROM SSU_SEGUIMIENTOAUDITORIA ' +
                                ' WHERE su_id = ' + SqlInt(FSolicitudes) );

    iIdExpediente := StrToInt(SqlResults[2]);

    // Genero los archivos adjuntos..
    for iLoop := 0 to aIdSolicitudes.Count - 1 do
    begin

      if FGravedad = 'G' then
      begin
        Application.CreateForm(TrptSolicitudAuditoriaGrave, rptSolicitudAuditoriaGrave);
        try
          rptSolicitudAuditoriaGrave.Preparar(StrToIntDef(aIdSolicitudes[iLoop], 0));

          sNombreArchivo := Format(TempPath + 'SOL_AUD_MED_GRA' + '_%s.pdf', [aIdSolicitudes[iLoop]]);

          ExportarPDF(rptSolicitudAuditoriaGrave, sNombreArchivo);

        finally
          FreeAndNil(rptSolicitudAuditoriaGrave);
        end;
      end
      else
      begin
        Application.CreateForm(TrptSolicitudAuditoria, rptSolicitudAuditoria);
        try
          rptSolicitudAuditoria.Preparar(StrToIntDef(aIdSolicitudes[iLoop], 0));

          sNombreArchivo := Format(TempPath + 'SOL_AUD_MED_' + '_%s.pdf', [aIdSolicitudes[iLoop]]);

          ExportarPDF(rptSolicitudAuditoria, sNombreArchivo);

        finally
          FreeAndNil(rptSolicitudAuditoria);
        end;
      end;

      aFiles[iPos] := GetAttach(sNombreArchivo, 0);
      iPos := iPos + 1;

      bDeclaracionAccEnviada := ExisteSqlEx('select 1 from ssu_seguimientoauditoria where su_idexpediente = :idexp and su_fechabaja is null ' +
                                            '   and su_fecenviodeclaraccid is not null', [iIdExpediente]);
      if not bDeclaracionAccEnviada then
      begin
        SetLength(aFiles, Length(aFiles) + 1);
        rptDeclaracionAccidentado := TrptDeclaracionAccidentado.Create(nil);
        with rptDeclaracionAccidentado do
        try
          Preparar(StrToIntDef(aIdSolicitudes[iLoop], 0));
          sNombreArchivo := Format(TempPath + 'DEC_ACCID' + '_%s.pdf', [aIdSolicitudes[iLoop]]);

          ExportarPDF(rptDeclaracionAccidentado, sNombreArchivo);
          aFiles[iPos] := GetAttach(sNombreArchivo, 0);
          iPos := iPos + 1;
        finally
          Free;
        end;
      end;

    end; // del for

    sEmail := ValorSql('SELECT AU_EMAIL FROM MAU_AUDITORES WHERE AU_AUDITOR = ' + fraAuditor.Value);

    if unMoldeEnvioMail.EnviarMailBD(sEmail, 'Solicitud de auditoría de casos leves',
                                     [oShowDialogIfEmpty, oDeleteAttach, oAutoFirma],
                                     ' Provincia ART. Cantidad de Auditorias: ' + SqlResults[0] +
                                     ' . Correspondiente al Siniestro: ' + SqlResults[1] + '.', aFiles) then
    begin

      If sTipo = 'E' then
      begin
        // Genera envio y autorizaciones (procedimiento comun)
        Try
          BeginTrans;
          // Actualizo las tablas..
          for iLoop := 0 to aIdSolicitudes.Count  - 1 do
            AcualizaTablasEnviaryAutorizar(aIdSolicitudes[iLoop]);

          CommitTrans;
        except
          on E: Exception do
          begin
            Rollback;
            ErrorMsg(E, 'Error al guardar los datos.');
          end;
        end;   // del try - except

      end // del if sTipo
      else  // TIPO_MODIF - modifica el médico auditor y le mando un mail antes.
      begin
        Try
          BeginTrans;
          sSql := 'UPDATE SUE_AUDITORIASENVIADAS ' +
                    ' SET ue_auditorid = ' + fraAuditor.Value +
                  ' WHERE ue_seguimientoid = ' + SqlInt(FSeguimientoId);
          EjecutarSqlST(sSql);
          CommitTrans;
        except
          on E: Exception do
          begin
            Rollback;
            ErrorMsg(E, 'Error al guardar los datos.');
          end;
        end;
      end;
    end;  // del if unMoldeEnvioMail.EnviarMailBD
    ModalResult := mrOk;
  finally
    aIdSolicitudes.Free;
    SqlResults.Free;
  end;

end;

procedure TfrmEnviarSolicitudAuditoria.FormCreate(Sender: TObject);
begin
  FSolicitudes := '';

  with fraAuditor do
  begin
    TableName      := 'MAU_AUDITORES';
    FieldID        := 'AU_AUDITOR';
    FieldCodigo    := 'AU_AUDITOR';
    FieldDesc      := 'AU_NOMBRE';
    ExtraCondition := ' AND AU_FBAJA  IS NULL ';
  end;
end;

procedure TfrmEnviarSolicitudAuditoria.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEnviarSolicitudAuditoria.btnGenerarEnvioClick(Sender: TObject);
var
  sEmail: String;
begin
  Verificar(fraAuditor.IsEmpty, fraAuditor, 'El campo auditor es obligatorio.');

  sEmail := ValorSql('SELECT AU_EMAIL FROM MAU_AUDITORES WHERE AU_AUDITOR = ' + fraAuditor.Value);
  Verificar(not IsEMail(sEmail), fraAuditor, 'Este auditor no tiene cargada una dirección de e-mail válida.');

  GenerarEnvio(FTipoEnvio);
end;

procedure TfrmEnviarSolicitudAuditoria.btnVistaPreviaClick(Sender: TObject);
var
  iPrimerId: Integer;
begin
  iPrimerId := StrToIntDef(FSolicitudes, 0);
  Imprimir(tiPrev, iPrimerId);
end;

// Lu WF 8121  Unifico la rutina de imprimir y vista previa porque sino se iba a repetir codigo.
procedure TfrmEnviarSolicitudAuditoria.Imprimir(vTipoImp: TImprimir; vPrimerId: integer);
begin
  if FGravedad = 'G' then
  begin
    Application.CreateForm(TrptSolicitudAuditoriaGrave, rptSolicitudAuditoriaGrave);
    try
      rptSolicitudAuditoriaGrave.Preparar(vPrimerId);
      if vTipoImp = tiPrev then
        rptSolicitudAuditoriaGrave.Preview
      else
        rptSolicitudAuditoriaGrave.Print;
    finally
      FreeAndNil(rptSolicitudAuditoriaGrave);
    end;
  end
  else
  begin
    Application.CreateForm(TrptSolicitudAuditoria, rptSolicitudAuditoria);
    try
      rptSolicitudAuditoria.Preparar(vPrimerId);
      if vTipoImp = tiPrev then
        rptSolicitudAuditoria.Preview
      else
        rptSolicitudAuditoria.Print;
    finally
      FreeAndNil(rptSolicitudAuditoria);
    end;
  end;

  bDeclaracionAccEnviada := ExisteSqlEx('select 1 from ssu_seguimientoauditoria where su_fechabaja is null ' +
                                            '   and su_fecenviodeclaraccid is not null ' +
                                            '   and su_idexpediente = (select su_idexpediente from ssu_seguimientoauditoria ' +
                                            '                           where su_id = :idseg) ', [SqlInt(FSolicitudes)]);

  if not bDeclaracionAccEnviada then
  begin
    rptDeclaracionAccidentado := TrptDeclaracionAccidentado.Create(nil);
    with rptDeclaracionAccidentado do
    try
      Preparar(vPrimerId);
      if vTipoImp = tiPrev then
        Preview
      else
        Print;
    finally
      Free;
    end;
  end;

end;

// Modifica el medico auditor sin generar autorizacion y envia mail. Lu wf 7535
procedure TfrmEnviarSolicitudAuditoria.btnModificarAuditClick(Sender: TObject);
var
  sEmail: String;
begin
  Verificar(fraAuditor.IsEmpty, fraAuditor, 'El campo auditor es obligatorio.');

  sEmail := ValorSql('SELECT AU_EMAIL FROM MAU_AUDITORES WHERE AU_AUDITOR = ' + fraAuditor.Value);
  Verificar(not IsEMail(sEmail), fraAuditor, 'Este auditor no tiene cargada una dirección de e-mail válida.');

  GenerarEnvio(FTipoEnvio);
end;

// Lu WF 8121 (MGuevara: solo se usa desde unSolicitudAuditoria)
procedure TfrmEnviarSolicitudAuditoria.btnEnviadoManoClick(Sender: TObject);
var i: integer;
    slSolicitudes: TStringList;
begin
  slSolicitudes := TStringList.Create;
  Try
    slSolicitudes.CommaText := FSolicitudes;
    Verificar(fraAuditor.IsEmpty, fraAuditor, 'El campo auditor es obligatorio.');
    for i := 0 to slSolicitudes.count - 1 do
      Imprimir(tiImp, StrToIntDef(slSolicitudes[i],0));

    GenerarEnvioEnMano;

  finally
    slSolicitudes.Free;
  end
end;

// Lu WF 8121
procedure TfrmEnviarSolicitudAuditoria.GenerarEnvioEnMano;
var aIdSolicitudes: TStringList;
    i: integer;
begin
    aIdSolicitudes := TStringList.Create;
    Try
      aIdSolicitudes.CommaText := FSolicitudes;
      // Genera envio y autorizaciones (procedimiento comun)
      Try
        BeginTrans;
        // Actualizo las tablas..
        for i := 0 to aIdSolicitudes.Count - 1 do
          AcualizaTablasEnviaryAutorizar(aIdSolicitudes[i]);

        CommitTrans;
      except
        on E: Exception do
        begin
          Rollback;
          ErrorMsg(E, 'Error al guardar los datos.');
        end;
      end;
       ModalResult := mrOk;
    Finally
      aIdSolicitudes.free;
    End;
end;

procedure TfrmEnviarSolicitudAuditoria.AcualizaTablasEnviaryAutorizar(sIdSolicitud:string);
var sSql, sEstado: string;
    iId: integer;
begin
  sEstado := ValorSql('Select su_estado from ssu_seguimientoauditoria where su_id = ' + sIdSolicitud);

  If (sEstado = '001') then // Lu 14/05/2008 WF 7333 - Solo se actualizan las tablas si el estado es Pendiente, si no lo es no.
  begin
      sSql :=
           'SELECT COUNT(*)' +
           ' FROM SSU_SEGUIMIENTOAUDITORIA' +
           ' WHERE SU_ID = :p1' +
            ' AND SU_ESTADO = ''002'' ';

       if ValorSqlIntegerEx(sSql, [sIdSolicitud]) = 0 then
       begin
          // Actualizo el registro solo si no existe, porque puede que quieran enviar el e-mail de nuevo porque el que lo
          // recibe lo perdió..
           sSql :=
               'UPDATE SIN.ssu_seguimientoauditoria' +
               ' SET su_estado = ''002'',' +  // Enviado
                   ' su_usuenvio = :p1,' +
                   iif(bDeclaracionAccEnviada, '', ' su_fecenviodeclaraccid = trunc(sysdate), ') +
                   ' su_fechaenvio = SYSDATE' +
             ' WHERE su_id = :p2';
           EjecutarSqlSTEx(sSql, [frmPrincipal.DBLogin.LoginName, sIdSolicitud]);
       end;
      // Guardo los datos de envío..
       iId  := GetSecNextVal('SEQ_AUDITORIASENVIADAS');
       sSql :=
           'INSERT INTO SUE_AUDITORIASENVIADAS(UE_ID, UE_SEGUIMIENTOID, UE_AUDITORID, UE_FECHAENVIO ) ' +
                                     ' VALUES (:p1, :p2, :p3, SYSDATE )';
        EjecutarSqlSTEx(sSql, [iId, sIdSolicitud, fraAuditor.Value]);
  end;
end;



end.
