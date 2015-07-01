unit unImportFromSRTReclamos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, unArtFrame,
  unFraDomicilio, PatternEdit, StdCtrls, Db, SDEngine, ShortCutControl, ExComboBox, Mask, unFraDomicilioTrab,
  artSeguridad, IdBaseComponent, IdComponent, IdTCPConnection, IdAuthentication,
  IdTCPClient, IdHTTP, OleCtrls, SHDocVw, Variants, StrUtils, JvExControls,
  JvComponent, JvSpecialProgress, FormPanel, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, Math, IdCookieManager;

type TSRTData = Record
                  sDocId:String;
                  sExpediente:String;
                  sMotivo:String;
                  sTipo:String;
                  dtFechaIngreso:TDateTime;
                  dtFechaVencimiento:TDateTime;
                  sEstado:String;
                  sUsuario:String;
                  sUsuarioAsignado:String;
                end;

type
  TfrmImportFromSRTReclamos = class(TForm)
    edWeb: TMemo;
    IdHTTP1: TIdHTTP;
    btnAceptar: TButton;
    btnCancelar: TButton;
    progress: TJvSpecialProgress;
    lbAccion: TLabel;
    fpPassword: TFormPanel;
    btnAcceso: TButton;
    btnCancel: TButton;
    edUser: TEdit;
    edPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    fpTema: TFormPanel;
    Label3: TLabel;
    cboxVentanilla: TComboBox;
    btnAceptarArea: TButton;
    btnCancelarArea: TButton;
    IdHTTP2: TIdHTTP;
    fraVT_ID: TfraCodDesc;
    Label4: TLabel;
    IdCookieManager1: TIdCookieManager;
    procedure NavegarReclamos(sUser,sPassword: String);
    procedure InsertarSRT(aData: TSRTData);
    procedure InsertarSubtema(aSubtema: String);
    procedure InsertarMotivo(aMotivo: String);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAccesoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAceptarAreaClick(Sender: TObject);
    procedure btnCancelarAreaClick(Sender: TObject);
    procedure DescargarPDFdeSRT(aIDReclamo, aIdDocSRT:Integer; aNumReclamoSRT, aFecha: String);  // acá, para que no tire el Hint
  private
    function ParcearInsertarReclamos(sHtml: String): Boolean;
    function GetIdModuloFromAreaId(const iAreaId: Integer): integer;
    procedure DescargarPDFdeSRTSeguimiento(aIDReclamo, aIdSegSRT: Integer; aNumReclamoSRT, aFecha: String);
    procedure DescargarPDFdeSRTArchivo(aIDReclamo, aArchID: Integer; aNumReclamoSRT, aFecha: String);
    procedure ActualizarEstados(const aEstadoSrt: String; const aIdReclamo: Integer);
    procedure LlenarComboAreas(aUser,sPassword: String; var Combo:TComboBox);
    procedure ConfigurarNavegador(sUser, sPassword: String);
    procedure NavegarHastaListado;
    procedure SleepRandom;
  public
    FCancelar: Boolean;
    iRegsLeidos: Integer;
    iRegsNuevos: Integer;
    iRegsActualizados, FAreaIdSRT, FAreaIdART, FModuloSRT: Integer;
    FStorageDirectory, FHTML: String;
  end;
const

//USER_SRT = 'Vila';
//PASSWORD_SRT = '@umuv400';
//USER_SRT2 = 'alloc';
//PASSWORD_SRT2 = '@qida420';

  MAX_PAGINAS_SRT = 1;
  URL_1 = 'http://www.arts.gob.ar';
  URL_2 = 'http://www.arts.gov.ar/VentanillaElectronica/Documentos/DOCUMENTOS_ABM.ASP?ACCION=C&docID=';
  URL_3 = 'http://www.arts.gov.ar/VentanillaElectronica/ARCHIVOS/SUBIRARCHIVOS_LISTADO_VER.ASP?segID=';
  URL_3b = '&SistemaID=5';
  URL_4 = 'http://www.arts.gov.ar/VentanillaElectronica/ARCHIVOS/SUBIRARCHIVOS_DOWN.asp?archID=';
  URL_4b = '&SistemaID=5';



var
  frmImportFromSRTReclamos: TfrmImportFromSRTReclamos;

implementation

uses
  unPrincipal, unDmPrincipal, General, CustomDlgs, AnsiSQL, SqlFuncs, Strfuncs, unSiniestros;

{$R *.DFM}



procedure TfrmImportFromSRTReclamos.NavegarReclamos(sUser,sPassword:String);
var  sHtml : String;
     i : integer;
     bCont : boolean;
begin
  idHttp1.Request.Referer :='http://www.arts.gov.ar/VentanillaElectronica/Documentos/Documentos_global.asp?AreaID=' + IntToStr(FAreaIdSRT) + '&ID_MODULO=' + IntToStr(FModuloSRT) + '&Usuario='+sUser;
  sHtml := '';
 // http://www.arts.gov.ar/VentanillaElectronica/Documentos/DOCUMENTOS_LISTADO.ASP?AREAID=210&PaginaActual=2
  iRegsLeidos := 0;
  iRegsNuevos := 0;
  iRegsActualizados := 0;
  NavegarHastaListado;
  i := 1;

  bCont := True;
  progress.Minimum := 0;
  progress.Maximum := 20;
  progress.Position := 0;
  while (bCont) and (i <= MAX_PAGINAS_SRT) and (Not(FCancelar)) do
      begin
        Application.ProcessMessages;
        SleepRandom;
        try
          edWeb.Lines.Add('http://www.arts.gov.ar/VentanillaElectronica/Documentos/DOCUMENTOS_LISTADO.ASP?AREAID='+IntToStr(FAreaIdSRT)+'&PaginaActual=' + IntToStr(i));
          sleep(1000);
          sHtml := idHTTP1.Get('http://www.arts.gov.ar/VentanillaElectronica/Documentos/DOCUMENTOS_LISTADO.ASP?AREAID='+IntToStr(FAreaIdSRT)+'&PaginaActual=' + IntToStr(i));
        except
          on E:Exception do
            begin
              MsgBox('Error en descarga. ' + E.Message, MB_ICONERROR + MB_OK);
              FCancelar := True;
              ModalResult := MrCancel;
            end;
        end;
        edWeb.lines.add(IntToStr(Pos('No se han encontrado datos',sHtml)));
        Sleep(1000);
        if Pos('No se han encontrado datos',sHtml) = 0 then
          begin
            bCont := ParcearInsertarReclamos(sHtml);
            edWeb.Lines.Add('procesando pagina: ' + IntToStr(i));
            lbAccion.Caption := 'Procesando página: ' + IntToStr(i);
            // progress.StepIt;
            Sleep(500);
            Inc(i);
          end else
          begin
            while i < 100 do
              begin
                Inc(i);
                Sleep(30);
                Application.ProcessMessages;
              end;
            progress.Position := 100;
            lbAccion.Caption := 'No hay mas datos';
            edWeb.Lines.Add('sin datos');
            bCont := False;
            FCancelar := True;
          end;
      end;
  lbAccion.Caption := 'Completado';
end;

function TfrmImportFromSRTReclamos.ParcearInsertarReclamos(sHtml: String):boolean;
var sTemp: String;
    StrList, StrAux: TStringList;
    i: integer;
    Regs: TSRTData;
begin
  //Borrar todo los scripts y separar en lineas.

  StrList := TStringList.Create;
  StrAux := TStringList.Create;

  StrAux.Clear;
  StrList.Clear;

  sHtml := StringReplace(sHtml, '&nbsp;', '', [rfReplaceAll]);

  sHtml := Copy(sHtml, Pos('id="TablaLista">', sHtml) + 1, Length(sHtml));

  edWeb.Text := sHtml; //No borrar, uso el ancho del memo para hacer un splitByLine. Se puede usar TextWrap pero bue

  for i := 0 to edWeb.Lines.Count -1 do
    begin
      if (Pos('<td width', edWeb.Lines.Strings[i]) <> 0) or (Pos('VerSeguimiento', edWeb.Lines.Strings[i]) <> 0) then
        if (Pos('<td width', edWeb.Lines.Strings[i]) <> 0) then
          StrAux.Add(edWeb.Lines.Strings[i]);
        if Pos('VerSeguimiento(', edWeb.lines.Strings[i]) <> 0 then
          begin
            StrAux.Add(edWeb.Lines.Strings[i]);
            StrAux.Add(edWeb.Lines.Strings[i + 2]);
          end;
    end;

  //edWeb.Lines.clear;

  for i := 0 to StrAux.Count -1 do
    begin
      edWeb.Lines.Add(StrAux[i]);
    end;

  //Segundo Borrar Giladas
  for i := 0 to StrAux.Count -1 do
    begin
      sTemp := StrAux.Strings[i];
      if Pos('onClick', sTemp) <> 0 then
        begin
          Delete(sTemp, 1, 65);
          Delete(sTemp, Pos(',', sTemp), 8);
          StrAux.Strings[i] := sTemp;
        end else
        begin
          // Delete(sTemp, 1, 49);    09
          while Pos(#$09, sTemp) <> 0 do
            Delete(sTemp, Pos(#$09, sTemp), 1);

          Trim(sTemp);

          if Pos('<td', sTemp) <> 0 then
            Delete(sTemp, Pos('<td', sTemp), Pos('>', sTemp));

          if Pos('</td>', sTemp) <> 0 then
            Delete(sTemp, Pos('</td>', sTemp), 5); //por si queda alguno

          if Pos('- '+ IntToStr(FAreaIdSRT), sTemp) <> 0 then
            Delete(sTemp, Pos('- '+ IntToStr(FAreaIdSRT), sTemp), 5);

          Trim(sTemp);
          StrAux.Strings[i] := sTemp;
        end;
    end;

  for i := 0 to StrAux.Count -1 do
    begin
      edWeb.Lines.Add(StrAux[i]);
    end;

  edWeb.Clear;
  for i := 0 to StrAux.Count -1 do
    begin
      if StrAux[i]<>'' then
        StrList.Add(StrAux[i]);
    end;

  for i := 0 to StrList.Count -1 do
    begin
      edWeb.Lines.Add(StrList[i]);
    end;
  i := 0 ;
  while i < StrList.Count -1 do
    begin
      Regs.sDocId := StrList.Strings[i];
      Inc(i);
      Regs.sExpediente := StrList.Strings[i];
      Inc(i);
      Regs.sMotivo := StrList.Strings[i];
      Inc(i);
      Regs.sTipo := StrList.Strings[i];
      Inc(i);
      Try
        Regs.dtFechaIngreso := StrToDateTime(StrList.Strings[i]);
      except
        Regs.dtFechaIngreso := 0;
      end;
      Inc(i);

      Try
        Regs.dtFechaVencimiento := StrToDateTime(StrList.Strings[i]);
      except
        Regs.dtFechaVencimiento := 0;
      end;

      Inc(i);
      Regs.sEstado := StrList.Strings[i];
      Inc(i);
      Regs.sUsuario := StrList.Strings[i];
      Inc(i);

      if Trim(StrList.Strings[i]) <> '-' then
        Regs.sUsuarioAsignado := StrList.Strings[i]
      else
        Regs.sUsuarioAsignado := '';
      Inc(i);

      edWeb.Lines.Add('docid' + Regs.sDocId + '|' +'Exp:'+ Regs.sExpediente + '|Mot:' + Regs.sMotivo + '|' + Regs.sTipo + '|' + Regs.sEstado + '|' + Regs.sUsuario + '|' + Regs.sUsuarioAsignado + '|' + DateTimeToStr(Regs.dtFechaIngreso) + '|' + DateTimeToStr(Regs.dtFechaVencimiento));
      Inc(iRegsLeidos);
      //if (Regs.sEstado = 'LEIDO') or (Regs.sEstado = 'FINALIZADO') or (Regs.sEstado = 'NOTIFICADO') or (Regs.sEstado = 'RESPONDIDO') then
      if (Regs.sEstado = 'LEIDO') then
        begin
          edWeb.Lines.Add('Insertando Notificado Finalizado o Leido');
          InsertarSRT(Regs);
        end;
    end;
  Result := True;
end;

procedure TfrmImportFromSRTReclamos.InsertarSRT(aData: TSRTData);
var
  sSql,sIDReclamo: String;
//  RetId:Integer;
begin
  sIDReclamo := '';
  //Verificar existencia del subtema que envia la SRT (los van cambiando y agregando nuevos)
  sSql := 'SELECT vs_id FROM comunes.CVS_VENTANILLA_SUBTEMAS where UPPER (art.utiles.reemplazar_acentos(VS_DESCRIPCION)) Like TRIM(UPPER (art.utiles.reemplazar_acentos(''' + aData.sTipo + ''')))and vs_idtema='+IntToStr(FAreaIdART)+' and rownum <2';
  if Not ExisteSQLEx(sSql,[]) then
    InsertarSubTema(aData.sTipo);

  //Verificar existencia del Tipo comunes.cvp_ventanilla_tipo  Reclamo/Otros/Cuota Omitida/
  sSql := 'SELECT vp_id FROM comunes.cvp_ventanilla_tipo where UPPER (art.utiles.reemplazar_acentos(VP_DESCRIPCION)) Like TRIM (UPPER (art.utiles.reemplazar_acentos(''' + aData.sMotivo + '%''))) and rownum <2';
  if Not ExisteSQLEx(sSql,[]) then
    InsertarMotivo(aData.sMotivo);

  //Ver si existe reclamo con la misma fecha y hora
  sSql := 'SELECT VR_ID FROM comunes.cvr_ventanilla_reclamos where ' +
          'VR_FECHARECLAMO=TO_DATE(''' + DateTimeToStr(aData.dtFechaIngreso) + ''', ''dd/mm/yyyy hh24:mi:ss'')';

  sIDReclamo := ValorSqlEx(sSql, []); //busco el id del registro existente
  if sIDReclamo = '' then      //Si no existe aun
    begin
      //Insertar reclamo nuevo
      lbAccion.Caption := 'Agregando Registro';

      sSql := 'INSERT INTO comunes.cvr_ventanilla_reclamos ' +
            '(VR_ID, VR_USUALTA, VR_NRORECLAMO_SRT, VR_IDSUBTEMA, VR_IDESTADO, VR_IDTIPO, VR_FECHARECLAMO, VR_FECHAVENCIMIENTO, VR_FECHAALTA, ' +
            'VR_USUARIO_SRT, VR_USUARIO_ASIGNADO) ' +
            'VALUES ((SELECT MAX(VR_ID)+1 from comunes.cvr_ventanilla_reclamos), :usualta, :idreclamo, ' +
            '(SELECT vs_id FROM comunes.CVS_VENTANILLA_SUBTEMAS where UPPER (art.utiles.reemplazar_acentos(VS_DESCRIPCION)) Like TRIM (UPPER (art.utiles.reemplazar_acentos(''' + aData.sTipo + '''))) and vs_idtema='+IntToStr(FAreaIdART)+' and rownum <2), '+
            '(SELECT ve_id FROM comunes.cve_ventanilla_estados where UPPER (art.utiles.reemplazar_acentos(VE_DESCRIPCION)) Like TRIM (UPPER (art.utiles.reemplazar_acentos(''%' + aData.sEstado + '%''))) and rownum <2), '+
            '(SELECT vp_id FROM comunes.cvp_ventanilla_tipo where UPPER (art.utiles.reemplazar_acentos(VP_DESCRIPCION)) Like UPPER (art.utiles.reemplazar_acentos(''%' + aData.sMotivo + '%'')) and rownum <2), ' +
            'TO_DATE(''' + DateTimeToStr(aData.dtFechaIngreso) + ''', ''dd/mm/yyyy hh24:mi:ss''), ';
            if aData.dtFechaVencimiento <> 0 then sSql := sSql + 'TO_DATE(''' + DateTimeToStr(aData.dtFechaVencimiento) + ''', ''dd/mm/yyyy hh24:mi:ss''), ' else  sSql := sSql +' NULL, ';
            sSql := sSql + ' SYSDATE, :ususrt, :usuart ' +
            ')';

      EjecutarSqlEx(sSql, ['SISTEMA', aData.sExpediente, aData.sUsuario, aData.sUsuarioAsignado]);

      // para que no tire el Hint
      // RetId := ValorSqlEx('SELECT MAX(VR_ID) FROM COMUNES.CVR_VENTANILLA_RECLAMOS',[]);

      //****Descargar el PDF adjunto*********
      {if (MsgBox('Nuevo expediente encontrado Nro: ' + aData.sExpediente + ' Fecha: ' + DateTimeToStr(aData.dtFechaIngreso) + ' . ¿Descargar archivo adjunto?', MB_ICONQUESTION + MB_YESNO ) = IDYES) then
          DescargarPDFdeSRT(RetId, StrToInt(aData.sDocId), aData.sExpediente, DateTimeToStr(aData.dtFechaIngreso));
      }//*************************************


      Inc(iRegsNuevos);  //Contador de registros nuevos agregados.
    end else //Si existe el reclamo verificar si los estados  se encuentran igual que la pagina de la srt
    begin
      ActualizarEstados(aData.sEstado,StrToInt(sIdReclamo));
    end;
  progress.StepIt;
end;

procedure TfrmImportFromSRTReclamos.InsertarSubtema(aSubtema: String);
var sSql, sTemp: String;
    Up:Char;
begin
  Up := aSubtema[1]; //Copiar primera letra del subtema. SRT envia todo en mayus.
  sTemp := AnsiLowerCase(aSubtema); //Pasar el string a minuscula
  sTemp[1] := Upcase(Up); //Reemplazar la primera letra por mayus.


  sSql := 'INSERT INTO comunes.CVS_VENTANILLA_SUBTEMAS (VS_ID,VS_DESCRIPCION, VS_IDTEMA) ' +
          'VALUES ((SELECT MAX(VS_ID) from comunes.CVS_VENTANILLA_SUBTEMAS)+1,TRIM(:desc), '+IntToStr(FAreaIdART)+')' ;

  EjecutarSqlEx(sSql, [sTemp]);
//  Memo1.Lines.Add('Insertado: '+Subtema);
  Application.ProcessMessages;
end;

procedure TfrmImportFromSRTReclamos.btnAceptarClick(Sender: TObject);
begin
  lbAccion.Caption := 'Autenticación';
  btnAceptar.Enabled := False;
  FCancelar := False;
  if fpPassword.ShowModal = mrOk then
    begin
      edWeb.Lines.Add('Llenando');
      ConfigurarNavegador(edUser.Text, edPassword.Text);
      LlenarComboAreas(edUser.Text, edPassword.Text, cboxVentanilla);
      if fpTema.ShowModal = mrOk then
          begin
            edWeb.Lines.Add(IntToStr(Integer(cboxVentanilla.Items.Objects[cboxVentanilla.ItemIndex])));
            FAreaIdSRT := Integer(cboxVentanilla.Items.Objects[cboxVentanilla.ItemIndex]);
            FModuloSrt := GetIdModuloFromAreaId(FAreaIdSRT);
            edWeb.Lines.Add('MOdulo: '+IntToStr(FModuloSrt));
            FAreaIdART := StrToInt(fraVT_ID.Codigo);
            lbAccion.Caption := 'Procesando';
            NavegarReclamos(edUser.Text, edPassword.Text);
            idHttp1.Disconnect;
            Sleep(1000);
            if Not(FCancelar) then
              ModalResult := mrOk
            else
              ModalResult := mrCancel;
          end;
    end;
end;

procedure TfrmImportFromSRTReclamos.btnCancelarClick(Sender: TObject);
begin
  FCancelar := True;
  ModalResult := MrCancel;
end;

procedure TfrmImportFromSRTReclamos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FCancelar := True;
end;

procedure TfrmImportFromSRTReclamos.InsertarMotivo(aMotivo: String);
var sSql, sTemp: String;
    Up:Char;
begin
  Up := aMotivo[1]; //Copiar primera letra del motivo. SRT envia todo en mayus.
  sTemp := AnsiLowerCase(aMotivo); //Pasar el string a minuscula
  sTemp[1] := Upcase(Up); //Reemplazar la primera letra por mayus.


  sSql := 'INSERT INTO comunes.cvp_ventanilla_tipo (VP_ID,VP_DESCRIPCION) ' +
          'VALUES ((SELECT MAX(VP_ID) from comunes.cvp_ventanilla_tipo)+1,TRIM(:desc))' ;

  EjecutarSqlEx(sSql, [sTemp]);
  Application.ProcessMessages;
end;

procedure TfrmImportFromSRTReclamos.DescargarPDFdeSRT(aIdReclamo,
  aIdDocSRT: Integer; aNumReclamoSRT, aFecha: String);
var sHtml : String;
    iSegId :Integer;
begin
  lbAccion.Caption := 'Buscando Archivo';
  sHtml := idHTTP1.Get(URL_2 + IntToStr(aIdDocSRT));
  if Pos('segID=',sHtml) <> 0 then
    begin
      sHtml := Copy(sHtml,Pos('segID=', sHtml) + 6, 5);
      Try
        iSegId := StrToInt(sHtml);
        edWeb.Lines.Add('seguimiento:' + sHtml);
        DescargarPDFdeSRTSeguimiento(aIdReclamo, iSegID, aNumReclamoSRT, aFecha);
      except
        edWeb.Lines.add('error seguimiento');
      end;
    end else edWeb.lines.add('sin seguimiento');
end;

procedure TfrmImportFromSRTReclamos.DescargarPDFdeSRTSeguimiento(
  aIdReclamo, aIdSegSRT: Integer; aNumReclamoSRT, aFecha: String);
var
    sHtml: String;
    iArchId: Integer;
begin
  sHtml := idHTTP1.Get(URL_3 + IntToStr(aIdSegSRT) + URL_3b);
  if Pos('archID=', sHtml) <> 0 then
    begin
      sHtml := Copy(sHtml,Pos('archID=', sHtml) + 7, 5);
      Try
        iArchId := StrToInt(sHtml);
        edWeb.Lines.Add('Archivo:' + sHtml);
        lbAccion.Caption := 'Descargando Archivo';
        DescargarPDFdeSRTArchivo(aIdReclamo, iArchId, aNumReclamoSRT, aFecha);
      except
        edWeb.lines.add('error en archivo');
      end;
    end else MsgBox('El registro ' + aNumReclamoSRT +' no tiene archivos adjuntos. ', MB_ICONEXCLAMATION + MB_OK);
end;

procedure TfrmImportFromSRTReclamos.DescargarPDFdeSRTArchivo(aIDReclamo,
  aArchID: Integer; aNumReclamoSRT, aFecha:String);
var
    fStream : TMemoryStream;
    sDirReclamoSRT, sFileName, sAnio, sSql, sFecha : string;
begin
  Try
    sFecha := aFecha;
    sFecha := Copy(sFecha, 1, 5);
    sFecha := StrReplace(sFecha, '/', '-');
    sFecha := Copy(sFecha, 4, 2) + '-' + Copy(sFecha, 1, 2); {mm-dd, sino queda al revez}

    edWeb.lines.add('Descargando');

    fStream := TMemoryStream.Create;
    IdHTTP1.Get(URL_4 + IntToStr(aArchID) + URL_4b, fStream);

    if (GetAnioFromDenunciaSRT(aNumReclamoSRT) <> 0) then
      begin
        aNumReclamoSRT := StringReplace(aNumReclamoSRT, ' ', '', [rfReplaceAll]);
        // sNroDenuncia := StringReplace(sNroDenuncia, '_', '', [rfReplaceAll]);
        sAnio := Copy(aNumReclamoSRT, Pos('/', aNumReclamoSRT) + 1, MaxInt);
        if Length(sAnio) <= 2 then
          begin
            sAnio := '20' + LPad(sAnio, '0', 2);
            aNumReclamoSRT := IntToStr(GetNumeroFromDenunciaSRT(aNumReclamoSRT)) + '/' + sAnio;
          end;
      end;

    sDirReclamoSRT := FStorageDirectory + IntToStr(GetAnioFromDenunciaSRT(aNumReclamoSRT));
    sFileName := sDirReclamoSRT +  '\' + IntToStr(GetNumeroFromDenunciaSRT(aNumReclamoSRT))+ '_' + sFecha + '_Rec.PDF';

    fStream.SaveToFile(sFileName);
    fStream.free;

    sSql := 'UPDATE comunes.cvr_ventanilla_reclamos SET vr_archivo_srt=:archivo '+
            'WHERE VR_ID=:id';

    EjecutarSqlEx(sSql, [sFileName,aIDReclamo]);

    edWeb.lines.add('Completado');
  except
    edWeb.lines.add('Error en descarga');
  end;
end;

procedure TfrmImportFromSRTReclamos.btnAccesoClick(Sender: TObject);
begin
  fpPassword.ModalResult := mrOk;
end;

procedure TfrmImportFromSRTReclamos.btnCancelClick(Sender: TObject);
begin
  fpPassword.ModalResult := mrCancel;
end;

procedure TfrmImportFromSRTReclamos.ActualizarEstados(
  const aEstadoSrt: String; const aIdReclamo: Integer);
var
  sSql, sEstado: String;
begin
  lbAccion.Caption := 'Verificando';
  //Buscar el estado del idreclamo seleccionado
  sSql := 'SELECT UPPER(art.utiles.reemplazar_acentos(cve.ve_descripcion)) as estado ' +
                'FROM comunes.cvr_ventanilla_reclamos cvr ' +
                'LEFT JOIN COMUNES.CVE_VENTANILLA_ESTADOS cve on cvr.VR_IDESTADO=cve.VE_ID ' +
                'WHERE vr_id=:Id ';

  with GetQueryEx(sSql, [aIDReclamo]) do
    if Not(IsEmpty) then
      begin
        sEstado := FieldByName('estado').AsString;

        if (sEstado <> aEstadoSrt) then //Realizar el update
          begin
          lbAccion.Caption := 'Actualizando estado';

          sSql := 'UPDATE comunes.cvr_ventanilla_reclamos ' +
                              'SET VR_IDESTADO = (SELECT ve_id FROM comunes.cve_ventanilla_estados where UPPER (art.utiles.reemplazar_acentos(VE_DESCRIPCION)) Like UPPER (''%' + aEstadoSrt + '%'') and rownum <2) '+
                              'WHERE VR_ID = :VrId ';
          EjecutarSqlEx(sSql, [aIDReclamo]);

          edWeb.Lines.Add('Registro actualizado '+ IntToStr(aIDReclamo));
          Inc(iRegsActualizados);
          end;
      end;
end;

procedure TfrmImportFromSRTReclamos.LlenarComboAreas(aUser,sPassword: String; var Combo:TComboBox);
var
  sAux: String;
  StrList: TStringList;

  i: integer;
begin
  StrList := TStringList.Create;
  StrList.Clear;


  idHTTP1.Request.Username := aUser;
  idHTTP1.Request.Password := sPassword;
  idHTTP1.MaxAuthRetries := 2; //Igual el default era 3!
  try
   FHTML := idHTTP1.Get('http://www.arts.gov.ar/Menu.asp');
  except
  on E:Exception do
    begin
      MsgBox('No se pudo autenticar. ' + E.Message, MB_ICONERROR + MB_OK);
      FCancelar := True;
      ModalResult := mrCancel;
      Abort;
    end;
  end;
  edWeb.Text := FHTML;
  for i := 0 to edWeb.Lines.Count -1 do
    begin
      if (Pos('AreaID', edWeb.Lines.Strings[i]) <> 0) then
        begin
          StrList.Add(Copy(edWeb.Lines.Strings[i], Pos('AreaID=', edWeb.Lines.Strings[i]) + 7, 3));
          if (Pos('title="">', edWeb.Lines.Strings[i]) <> 0) then
            begin
              sAux := (Copy(edWeb.Lines.Strings[i], Pos('title="">',edWeb.Lines.Strings[i]) + 9, Pos('</li>',edWeb.Lines.Strings[i]) - Pos('title="">', edWeb.Lines.Strings[i]) - 9 ));
              StrList.Add(Trim(sAux));
            end;
        end;
    end;
  edWeb.Clear;
  i := 0;
  while i < StrList.Count -1 do
    begin
      edWeb.Lines.Add(StrList[i]);
      Combo.Items.AddObject(StrList[i + 1], TObject(StrToInt(StrList[i])));
      Inc(i, 2);
    end;
  idHttp1.Disconnect;
end;

procedure TfrmImportFromSRTReclamos.btnAceptarAreaClick(Sender: TObject);
begin
  Verificar(fraVT_ID.IsEmpty, fraVT_ID, 'Seleccione un Tema ART.');
  Verificar(cboxVentanilla.ItemIndex = -1, cboxVentanilla, 'Seleccione una ventanilla SRT');
  fpTema.ModalResult := mrOk;
end;

procedure TfrmImportFromSRTReclamos.btnCancelarAreaClick(Sender: TObject);
begin
  fpTema.ModalResult := mrCancel;
end;

procedure TfrmImportFromSRTReclamos.ConfigurarNavegador(sUser, sPassword :String);
begin
  idHTTP1.Request.Username := sUser;
  idHTTP1.Request.Password := sPassword;
  idHTTP1.MaxAuthRetries := 2; //Igual el default era 3!

  idHttp1.Request.Host           := 'www.arts.gov.ar';
  idHttp1.Request.UserAgent      := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20110910 Firefox/5.1';
  idHttp1.Request.Accept         := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
  idHttp1.Request.AcceptLanguage := 'es-es,es;q=0.8,en-us;q=0.5,en;q=0.3';
  //idHttp1.Request.AcceptEncoding := 'gzip, deflate';
  idHttp1.Request.AcceptCharSet  := 'ISO-8859,utf-8,q=0.7,*;q=0.7';
end;

procedure TfrmImportFromSRTReclamos.NavegarHastaListado;
var
  sConsulta : String;
begin
  sConsulta := idHttp1.Get('http://www.arts.gov.ar/Principal.asp');
  edWeb.Lines.Add(sConsulta);
  SleepRandom;

  sConsulta := idHttp1.Get('http://www.arts.gov.ar/Encabezado.asp');    //COOKIE COMPLETA
  edWeb.Lines.Add(sConsulta);
  SleepRandom;

 // sConsulta := idHttp1.Get('http://www.arts.gov.ar/Menu.asp');
 // SleepRandom;
end;

function TfrmImportFromSRTReclamos.GetIdModuloFromAreaId(
  const iAreaId: Integer): integer;
var iPos, Res: Integer;
begin
  Res := -1;
  if Pos('AreaID='+IntToStr(FAreaIdSRT)+'&ID_MODULO=', FHTML) <> 0 then
    begin
      iPos := Pos('AreaID='+IntToStr(FAreaIdSRT)+'&ID_MODULO=', FHTML);
      Res := StrToInt(Copy(FHTML,iPos + 21, 3));
    end;
  Result := Res;
end;

procedure TfrmImportFromSRTReclamos.SleepRandom;
var
  i: integer;
begin
  i := RandomRange(1200, 4200); //unit Math
  Sleep(i);
end;

end.
