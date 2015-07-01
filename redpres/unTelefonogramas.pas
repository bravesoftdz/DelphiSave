unit unTelefonogramas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, SinEdit, ToolEdit, DateComboBox, Mask, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, QRCtrls, QuickRpt;

type
  TfrmTelefonogramas = class(TfrmCustomConsulta)
    GroupBox2: TGroupBox;
    rbNoEnviados: TRadioButton;
    rbEnviados: TRadioButton;
    rbTodos: TRadioButton;
    gbSiniestro: TGroupBox;
    Label5: TLabel;
    SinDesde: TSinEdit;
    SinHasta: TSinEdit;
    GroupBox1: TGroupBox;
    sdqUbicacion: TSDQuery;
    dsUbicacion: TDataSource;
    cmbUbicacion: TDBCheckCombo;
    Label1: TLabel;
    dcHasta: TDateComboBox;
    Label4: TLabel;
    dcDesde: TDateComboBox;
    Label2: TLabel;
    tbMarcar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton7: TToolButton;
    tbGenerar: TToolButton;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaTB_DESCRIPCION: TStringField;
    sdqConsultaEV_FECHA: TDateTimeField;
    sdqConsultaEV_FECHACITACION: TDateTimeField;
    sdqConsultaEV_SINIESTRO: TFloatField;
    sdqConsultaEV_ORDEN: TFloatField;
    sdqConsultaEV_EVENTO: TFloatField;
    sdqConsultaEV_HORA: TStringField;
    sdqConsultaEV_USUALTA: TStringField;
    sdqConsultaDESCUBIC: TStringField;
    sdqConsultaCODUBIC: TStringField;
    ScrollBox1: TScrollBox;
    qrDirFaltantes: TQuickRep;
    DetailBand1: TQRBand;
    QRShape2: TQRShape;
    sdqDirFaltantes: TSDQuery;
    dsDirFaltantes: TDataSource;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    sdqDirFaltantesMP_USUARIO: TStringField;
    sdqDirFaltantesMP_SINCOMPLETO: TStringField;
    sdqDirFaltantesMP_NOMBRETRAB: TStringField;
    sdqDirFaltantesMP_NOMBREEMPR: TStringField;
    sdqDirFaltantesMP_FORMATO: TStringField;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    ScrollBox2: TScrollBox;
    qrProblemasEnvioPrevio: TQuickRep;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRSysData4: TQRSysData;
    sdqProblemasEnvioPrevio: TSDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    dsProblemasEnvioPrevio: TDataSource;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbMarcarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure tbGenerarClick(Sender: TObject);
    procedure rbEnviadosClick(Sender: TObject);
    procedure rbNoEnviadosClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sCondicion :String;
    function ValidarFiltros :Boolean;
    function ValidarDireccion(sRazonSocial, sNombreTrab, sSiniestro, sProvincia, sCalle,
                              sCodPostal, sLocalidad :String; bValidarDirTrab :Boolean) :Boolean;
    function GetGrupoTelCitac :String;
  public
    { Public declarations }
  end;

var
  frmTelefonogramas: TfrmTelefonogramas;

implementation

uses AnsiSql, CustomDlgs, unDmPrincipal, unComunes, unSesion, General;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.FormCreate(Sender: TObject);
begin
  sdqUbicacion.Open;
  dcDesde.MinDate := DBDate;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sdqConsulta.Close;
  if ValidarFiltros then
  begin
    sSql := 'SELECT art.utiles.armar_siniestro(ev_siniestro, ev_orden, 0) siniestro, ' +
                  ' evtra.tb_descripcion, ev_fecha, ev_fechacitacion, ev_siniestro, ' +
                  ' ev_orden, ev_evento, ev_hora, ev_usualta, ui_descripcion DescUbic, ' +
                  ' ui_codigo codubic ' +
             ' FROM sev_eventosdetramite, sex_expedientes, ' +
                  ' ctb_tablas evtra, SIN.sui_ubicacionincapacidad ' +
            ' WHERE ev_evento>0 ' +
              ' AND evtra.tb_clave(+)=''EVTRA'' ' +
              ' AND evtra.tb_codigo(+)=ev_codigo ' +
              ' AND ui_codigo(+)=ev_codubic ' +
              ' AND ev_siniestro=ex_siniestro ' +
              ' AND ev_orden=ex_orden ' +
              ' AND ev_recaida=ex_recaida ' + sCondicion;

    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;
    tbMarcar.Enabled    := True;
    tbGenerar.Enabled   := True;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmTelefonogramas.ValidarFiltros :Boolean;
var
  sSql :String;
begin
  Result := False;
  Verificar(SinDesde.Siniestro > SinHasta.Siniestro, SinHasta, 'El siniestro hasta debe ser mayor o igual que el siniestro desde');
  Verificar(dcDesde.IsEmpty, dcDesde, 'Debe seleccionar Fecha de Citación');
  sCondicion := ' AND ev_codigo IN ' + GetGrupoTelCitac +
                ' AND NVL(ex_causafin, ''0'') NOT IN (''99'',''95'') ';

  sCondicion := sCondicion + SqlBetweenDateTime(' AND ev_fecha ', dcDesde.Date, dcHasta.Date, True);

  if not(SinDesde.IsEmpty) then
    sCondicion := sCondicion + ' AND ev_siniestro >= ' + SqlInt(SinDesde.Siniestro) +
                               ' AND ev_siniestro <= ' + SqlInt(SinHasta.Siniestro);

  if rbNoEnviados.Checked then
    sCondicion := sCondicion + ' AND ev_fechacitacion IS NULL '
  else if rbEnviados.Checked then
    sCondicion := sCondicion + ' AND ev_fechacitacion IS NOT NULL ';

  if (cmbUbicacion.Text <> '') then
    sCondicion := sCondicion + ' AND ev_codubic ' + cmbUbicacion.InSql;

  sSql := 'SELECT 1 ' +
           ' FROM sev_eventosdetramite, sex_expedientes ' +
          ' WHERE ev_evento > 0 ' +
            ' AND ev_siniestro=ex_siniestro ' +
            ' AND ev_orden=ex_orden ' +
            ' AND ev_recaida=ex_recaida ' + sCondicion;
  if not ExisteSql(sSql) then
    MsgBox('No existen eventos que cumplan el criterio de selección indicado', MB_ICONWARNING or MB_OK, 'Error')
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmTelefonogramas.GetGrupoTelCitac :String;
var
  sTmp, sSql :String;
begin
  sTmp := '(';
  sSql := 'SELECT tb_codigo, tb_especial1 ' +
           ' FROM ctb_tablas ' +
          ' WHERE tb_codigo <> ''0'' ' +
            ' AND tb_clave=''EVTRA'' ' +
            ' AND tb_fechabaja IS NULL ' +
            ' AND Substr(tb_especial1,1,1)=''S'' ';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      sTmp := sTmp + FieldByName('TB_CODIGO').AsString + ',' ;
      Next;
    end;
  finally
    Free;
  end;
  sTmp := Copy(sTmp, 0, Length(sTmp)-1);
  sTmp := sTmp + ')';
  Result := sTmp;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.tbMarcarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count > 1 then
    Grid.UnselectAll
  else
    Grid.SelectAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.tbLimpiarClick(Sender: TObject);
begin
  SinDesde.Clear;
  SinHasta.Clear;
  cmbUbicacion.Clear;
  dcDesde.Clear;
  dcHasta.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  tbMarcar.Enabled    := False;
  tbGenerar.Enabled   := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.tbGenerarClick(Sender: TObject);
var
  sFirma1, sFirma2, sSql, sSqlProblemas, sSiniestro, sHoraCitac, sCad, sCodUbic, sDescUbic, Delegacion :String;
  bFaltanDirecciones, bProblemasEnvioPrevio, bEsConfidencial :Boolean;
  iCantTel, i, iSiniestro, iOrden, iRecaida, iEvento :Integer;
  sdqTmp :TSDQuery;
  CalleTrabajador, NumeroTrabajador, PisoTrabajador, DepartamentoTrabajador,
  CPostalTrabajador, LocalidadTrabajador, ProvTrabajador, DescrProvTrabajador :String;
  dDiaCitac :TDate;
begin
  if (Grid.SelectedRows.Count = 0) then
    MessageBox(0, 'No existen eventos seleccionados', '', MB_ICONWARNING or MB_OK)
  else begin
    sFirma1    := Sesion.Usuario;
    sFirma2    := ART_NOMBRE;

    // Consulta problemas de envíos previos - WF 6682
    sSqlProblemas:= 'SELECT 1 ' +
                    '  FROM tlg_telegramas ' +
                    ' WHERE lg_estado NOT IN(''T'', ''9'') ' +
                    '   AND lg_siniestro = :psiniestro ' +
                    '   AND lg_orden = :porden ' +
                    '   AND lg_recaida = :precaida ' +
                    '   AND lg_calle = :pcalle ' +
                    '   AND lg_numero = :pnumero ' +
                    '   AND lg_piso = :ppiso ' +
                    '   AND lg_departamento = :pdepartamento ' +
                    '   AND lg_localidad = :plocalidad ' +
                    '   AND lg_cpostal = :pcpostal ' +
                    '   AND lg_provincia = :pprovincia ';

    bFaltanDirecciones := False;
    bProblemasEnvioPrevio := False;
    iCantTel := 0;

    sSql := 'DELETE FROM tmp_dirincompletas ' +
            '      WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
    EjecutarSql(sSql);

    sSql := 'DELETE FROM tmp.tpe_probenviosprevios' +
            '      WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
    EjecutarSql(sSql);

    try
      BeginTrans;
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
        sSiniestro  := sdqConsultaSINIESTRO.AsString;
        iSiniestro  := sdqConsultaEV_SINIESTRO.AsInteger;
        iOrden      := sdqConsultaEV_ORDEN.AsInteger;
        iRecaida    := 0;
        iEvento     := sdqConsultaEV_EVENTO.AsInteger;

        sSql := 'SELECT mp_nombre, tj_nombre, tj_calle, tj_cpostal, tj_localidad, ' +
                      ' tj_numero, tj_piso, tj_departamento, tj_provincia, cpvtrab.pv_descripcion descrprovtrab, ' +
                      ' mp_calle_post, mp_cpostal_post, mp_localidad_post, ' +
                      ' mp_numero_post, mp_piso_post, mp_departamento_post, mp_provincia_post, ' +
                      ' cpvempr.pv_descripcion descrprovempr, ex_fechaaccidente, ' +
                      ' afiliacion.isempresaconfidencial(ex_cuit) esempresaconfidencial ' +
                 ' FROM sex_expedientes, ctj_trabajador, cmp_empresas, ' +
                      ' cpv_provincias cpvtrab, cpv_provincias cpvempr ' +
                ' WHERE ex_siniestro = ' + SqlInt(iSiniestro) +
                  ' AND ex_orden = ' + SqlInt(iOrden) +
                  ' AND ex_recaida = 0 ' +
                  ' AND ex_cuil = tj_cuil ' +
                  ' AND ex_cuit = mp_cuit ' +
                  ' AND tj_provincia = cpvtrab.pv_codigo(+) ' +
                  ' AND mp_provincia_post = cpvempr.pv_codigo ';
        sdqTmp := GetQuery(sSql);
        try
          bEsConfidencial := (sdqTmp.FieldByName('ESEMPRESACONFIDENCIAL').AsString = 'S');
          if bEsConfidencial then
          begin
            CalleTrabajador         := sdqTmp.FieldByName('MP_CALLE_POST').AsString;
            NumeroTrabajador        := sdqTmp.FieldByName('MP_NUMERO_POST').AsString;
            PisoTrabajador          := sdqTmp.FieldByName('MP_PISO_POST').AsString;
            DepartamentoTrabajador  := sdqTmp.FieldByName('MP_DEPARTAMENTO_POST').AsString;
            CPostalTrabajador       := sdqTmp.FieldByName('MP_CPOSTAL_POST').AsString;
            LocalidadTrabajador     := sdqTmp.FieldByName('MP_LOCALIDAD_POST').AsString;
            ProvTrabajador          := sdqTmp.FieldByName('MP_PROVINCIA_POST').AsString;
            DescrProvTrabajador     := sdqTmp.FieldByName('DESCRPROVEMPR').AsString;
          end
          else begin
            CalleTrabajador         := sdqTmp.FieldByName('TJ_CALLE').AsString;
            NumeroTrabajador        := sdqTmp.FieldByName('TJ_NUMERO').AsString;
            PisoTrabajador          := sdqTmp.FieldByName('TJ_PISO').AsString;
            DepartamentoTrabajador  := sdqTmp.FieldByName('TJ_DEPARTAMENTO').AsString;
            CPostalTrabajador       := sdqTmp.FieldByName('TJ_CPOSTAL').AsString;
            LocalidadTrabajador     := sdqTmp.FieldByName('TJ_LOCALIDAD').AsString;
            ProvTrabajador          := sdqTmp.FieldByName('TJ_PROVINCIA').AsString;
            DescrProvTrabajador     := sdqTmp.FieldByName('DESCRPROVTRAB').AsString;
          end;

          if not(ValidarDireccion(Trim(sdqTmp.FieldByName('MP_NOMBRE').AsString),
                                  Trim(sdqTmp.FieldByName('TJ_NOMBRE').AsString),
                                  sSiniestro, DescrProvTrabajador, CalleTrabajador,
                                  CPostalTrabajador, LocalidadTrabajador, not(bEsConfidencial))) then
           bFaltanDirecciones := True
         else begin
           if (not bEsConfidencial) and ExisteSqlEx(sSqlProblemas, [iSiniestro,
                                                                    iOrden,
                                                                    iRecaida,
                                                                    CalleTrabajador,
                                                                    NumeroTrabajador,
                                                                    PisoTrabajador,
                                                                    DepartamentoTrabajador,
                                                                    CPostalTrabajador,
                                                                    LocalidadTrabajador,
                                                                    ProvTrabajador]) then
           begin
             bProblemasEnvioPrevio := true;

             sSql:= 'INSERT INTO tmp.tpe_probenviosprevios ' +
                    '            (mp_usuario, pe_siniestro, pe_orden, pe_recaida, pe_calle, ' +
                    '             pe_numero, pe_piso, pe_departamento, pe_cpostal, pe_localidad, ' +
                    '             pe_provincia) ' +
                    '     VALUES (:usuario, :siniestro, :orden, :recaida, :calle, ' +
                    '             :numero, :piso, :departamento, :cpostal, :localidad, ' +
                    '             :provincia) ';

             EjecutarSqlSTEx (sSql, [Sesion.UserID,
                                     iSiniestro,
                                     iOrden,
                                     iRecaida,
                                     CalleTrabajador,
                                     NumeroTrabajador,
                                     PisoTrabajador,
                                     DepartamentoTrabajador,
                                     CPostalTrabajador,
                                     LocalidadTrabajador,
                                     ProvTrabajador]);
           end;

           sHoraCitac := sdqConsultaEV_HORA.AsString;
           dDiaCitac  := sdqConsultaEV_FECHA.AsDateTime;
           sCodUbic   := sdqConsultaCODUBIC.AsString;
           sDescUbic  := sdqConsultaDESCUBIC.AsString;
           sCad := 'PRESENTARSE EL ' + DateToStr(dDiaCitac) + ' A LAS ' + sHoraCitac + ' Hs. EN ' + sDescUbic +
                  ' PARA EXAMEN MEDICO DEL SINIESTRO ' + IntToStr(iSiniestro) +
                  ' PORTANDO DNI CON COPIA DE LAS DOS PRIMERAS HOJAS DEL MISMO, ' +
                  ' COPIA DEL ALTA MEDICA Y COPIA DEL ULTIMO RECIBO DE SUELDO. CASO CONTRARIO ' +
                  ' NO SE EFECTUARA LA MISMA.';

           sSql := 'INSERT INTO tlg_telegramas ( ' +
                   ' lg_siniestro, lg_orden, lg_recaida, lg_nrocartadoc, ' +
                   ' lg_destinatario, lg_calle, lg_numero, lg_piso, ' +
                   ' lg_departamento, lg_localidad, lg_cpostal, lg_provincia, ' +
                   ' lg_firmante, lg_firmante2, lg_fechaalta, lg_texto) VALUES ( ' +
                   SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' + SqlInt(iRecaida) + ', Null, ' +
                   SqlValue(sdqTmp.FieldByName('TJ_NOMBRE').AsString) + ',' + SqlValue(CalleTrabajador) + ',' +
                   SqlValue(NumeroTrabajador) + ',' + SqlValue(PisoTrabajador) + ',' +
                   SqlValue(DepartamentoTrabajador) + ',' + SqlValue(LocalidadTrabajador) + ',' +
                   SqlValue(CPostalTrabajador) + ',' + SqlValue(ProvTrabajador) + ',' +
                   SqlValue(sFirma1) + ',' + SqlValue(sFirma2) + ', ActualDate, ' +
                   SqlValue(sCad) + ')';
           EjecutarSqlST(sSql);

           Delegacion := ValorSql('SELECT ui_delegacion_asoc FROM SIN.sui_ubicacionincapacidad ' +
                                  ' WHERE ui_codigo=' + SqlValue(sCodUbic));
           if (Delegacion <> '') then
           begin
             sSql := 'INSERT INTO mcc_citacionconsultorio ( ' +
                     ' cc_id, cc_siniestro, cc_orden, cc_recaida, cc_fecha, cc_hora, ' +
                     ' cc_medico, cc_sector, cc_usualta, cc_fechaalta, cc_delegacion) VALUES ( ' +
                     ' seq_mcc_id.nextval, ' + SqlInt(iSiniestro) + ',' +  SqlInt(iOrden) + ',' +
                     SqlInt(iRecaida) + ',' + SqlDate(dDiaCitac) + ',' + SqlValue(sHoraCitac) + ', Null, 2, ' +
                     SqlValue(Sesion.UserID) + ', Actualdate, ' + SqlValue(Delegacion) + ')';
             EjecutarSqlST(sSql);
           end;

           sSql := 'UPDATE sev_eventosdetramite ' +
                     ' SET ev_fechacitacion = ev_fecha ' +
                   ' WHERE ev_siniestro = ' + SqlInt(iSiniestro) +
                     ' AND ev_orden = ' + SqlInt(iOrden) +
                     ' AND ev_recaida = ' + SqlInt(iRecaida) +
                     ' AND ev_evento = ' + SqlInt(iEvento);
           EjecutarSqlST(sSql);

           iCantTel := iCantTel + 1;
          end;
        finally
          sdqTmp.Free;
        end;
      end;

      if (iCantTel = 0) then
        MsgBox('No se ha generado ningún telefonograma', MB_ICONINFORMATION or MB_OK, 'Telefonogramas')
      else begin
        CommitTrans;
        MsgBox('Se han generado ' + IntToStr(iCantTel) + ' telefonogramas', MB_ICONINFORMATION or MB_OK, 'Telefonogramas');
        sdqConsulta.Refresh;
      end;

      if bFaltanDirecciones then
      begin
        sdqDirFaltantes.Close;
        sdqDirFaltantes.ParamByName('pUsuario').AsString := Sesion.UserID;
        sdqDirFaltantes.Open;
        qrDirFaltantes.PreviewModal;
      end;

      if bProblemasEnvioPrevio then
      begin
        sdqProblemasEnvioPrevio.Close;
        sdqProblemasEnvioPrevio.ParamByName('pUsuario').AsString := Sesion.UserID;
        sdqProblemasEnvioPrevio.Open;
        qrProblemasEnvioPrevio.PreviewModal;
      end;

    except
      Rollback;
      raise;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmTelefonogramas.ValidarDireccion(sRazonSocial, sNombreTrab, sSiniestro,
                                             sProvincia, sCalle, sCodPostal, sLocalidad :String;
                                             bValidarDirTrab :Boolean) :Boolean;
var
  sSql :String;
begin
  Result := False;
  if bValidarDirTrab and ((nvl(sProvincia, '') = '') or (nvl(sCalle, '') = '') or
     (nvl(sCodPostal, '') = '') or (nvl(sLocalidad, '') = '')) then
  begin
    sSql := ' INSERT INTO tmp_dirincompletas ( ' +
            ' mp_usuario, mp_sincompleto, mp_nombreempr, mp_nombretrab) VALUES ( ' +
            SqlValue(Sesion.UserID) + ',' + SqlValue(sSiniestro) + ',' +
            SqlValue(sRazonSocial) + ',' + SqlValue(sNombreTrab) + ')';
    EjecutarSqlST(sSql);
    MsgBox('No se puede imprimir el telefonograma pués faltan datos del domicilio del'+#13+#10+' ' +
           'trabajador ' + sNombreTrab + ', para el siniestro Nro. ' + sSiniestro + '.',  MB_ICONWARNING or MB_OK, 'Dirección Incompleta');
  end
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.rbEnviadosClick(Sender: TObject);
begin
  dcDesde.Clear;
  dcHasta.Clear;
  dcDesde.MinDate := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.rbNoEnviadosClick(Sender: TObject);
begin
  dcDesde.Clear;
  dcHasta.Clear;
  dcDesde.MinDate := DBDate;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.rbTodosClick(Sender: TObject);
begin
  dcDesde.Clear;
  dcHasta.Clear;
  dcDesde.MinDate := DBDate;
end;
{-------------------------------------------------------------------------------}
procedure TfrmTelefonogramas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
