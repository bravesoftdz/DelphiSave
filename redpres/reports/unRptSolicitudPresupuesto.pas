unit unRptSolicitudPresupuesto;  { by NWK, 10/03/03 }

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unArt,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrpSolicitudPresupuesto = class(TQuickRep)
    qrbDetalle: TQRBand;
    qriLogo: TQRImage;
    qrsRect1: TQRShape;         
    qrsRect2: TQRShape;
    qrlFormulario: TQRLabel;
    qrsLineaHor: TQRShape;
    qrlLugarFecha: TQRLabel;
    qrlTitulo: TQRLabel;
    qrlTitPaciente: TQRLabel;
    qrlTitSiniestro: TQRLabel;
    qrlTitMaterialSolic: TQRLabel;
    qrlTitDiagnostico: TQRLabel;
    sdqSolicitudPresupuesto: TSDQuery;
    qrdbtTrabajador: TQRDBText;
    qrdbtSiniestro: TQRDBText;
    qrdbtMaterialSolic: TQRDBText;
    qrdbtDiagnostico: TQRDBText;
    qrsRect3: TQRShape;
    qrsLineaHor2: TQRShape;
    qrsLineaHor3: TQRShape;
    qrsLineaHor4: TQRShape;
    qrlTitRemir: TQRLabel;
    qrlNombresRemitir: TQRLabel;
    qrlNombreART: TQRLabel;
    qrlTitTel: TQRLabel;
    qrlTel: TQRLabel;
    qrlTitConcurso: TQRLabel;
    qrlTextoConcurso: TQRLabel;
    qrlTitEntregaMaterial: TQRLabel;
    qrlTitEntrega: TQRLabel;
    qrlTitDomicilioPrestador: TQRLabel;
    qrlTelefonoPrestador: TQRLabel;
    qrsLineaHor5: TQRShape;
    qrdbtEntrega: TQRDBText;
    qrdbtDomicilioEntrega: TQRDBText;
    qrdbtTelefonoEntrega: TQRDBText;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlLeyenda: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    qrlPacienteInternado: TQRLabel;
    qrlTitNombreFanta: TQRLabel;
    qrlNombreFanta: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
  private
    FEntregaTrabajador :Boolean;
    procedure SetEntregaTrabajador(const Value :Boolean);
  public
    constructor Create (AOwner: TComponent); override;
    procedure ImprimirSolicitudPresupuesto(IdPresupuesto: TTableID;
                                           iSiniestro, iOrden, iRecaida, iAutorizacion: Integer;
                                           sRutaArchivo: string = ''; sMailSuc: string = ''; bPantallaEnvio: boolean = true);
    property EntregaTrabajador :Boolean  read FEntregaTrabajador  write SetEntregaTrabajador;
  end;

implementation

uses
  unDmPrincipal, AnsiSql, General, unPrincipal, unExportPDF, unEnvioMail, Internet,
  unSesion, unMoldeEnvioMail, unComunes;

const
  cGRUPOINTERNADOS = '79';

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TqrpSolicitudPresupuesto.Create(AOwner: TComponent);
begin
  inherited;
  FEntregaTrabajador := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TqrpSolicitudPresupuesto.ImprimirSolicitudPresupuesto(IdPresupuesto: TTableID;
                                                                iSiniestro, iOrden, iRecaida, iAutorizacion: Integer;
                                                                sRutaArchivo: string = ''; sMailSuc: string = ''; bPantallaEnvio: boolean = true);
var
  sSql, sCodigo, sTelefono, mail, int, sMail: String;
  sqlResults, sqlRemitir: TStringList; OpcionesEnvio: TOpcionesEnvioMail;
  iIdExpediente: integer;
 // bOtroCodigo :Boolean;
begin
  sqlResults := Nil;
  sqlRemitir := Nil;
  qrlPacienteInternado.Caption := '';
  qrlNombreFanta.Caption       := '';
  qrlTitNombreFanta.Caption    := '';

  sSql := 'SELECT tj_nombre, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestrocompleto, ' +
                ' ex_diagnostico, pa_materialsoli, au_medico, au_turno, au_turnohora, ' +
                ' utiles.armar_domicilio(cpr_au.ca_calle, cpr_au.ca_numero, cpr_au.ca_pisocalle, ' +
                ' cpr_au.ca_departamento, cpr_au.ca_localidad) prestadordomicilio, ' +
                ' cpr_au.ca_descripcion prestador, cpr_au.ca_codarea || '' '' || cpr_au.ca_telefono prestadortelefono, ' +
                ' cpr_po.ca_descripcion || '' (id '' || pa_prestador || '')'' as ca_descripcion,  ' +
                ' cpr_po.ca_codarea || '' '' || cpr_po.ca_telefono cpr_po_ca_telefono, cpr_po.ca_fax, cpr_po.ca_direlectronica, ' +
                ' art.trabajador.get_telefono(tj_id, 4) TRABAJADORTELEFONO, utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, ' +
                ' tj_departamento, tj_localidad) trabajadordomicilio, cpr_au.ca_nombrefanta NombreFanta, au_trabajo, GP_NOMBRE ' +  // Ticket 62424
           ' FROM mpa_presupuestoautorizacion, msp_siniestropresup, sex_expedientes, ' +
                ' ctj_trabajador, sau_autorizaciones, cpr_prestador cpr_au, cpr_prestador cpr_po, mgp_gtrabajo ' +
          ' WHERE pa_id=sp_presupuesto ' +
            ' AND sp_siniestro=ex_siniestro ' +
            ' AND sp_orden=ex_orden ' +
            ' AND sp_recaida=ex_recaida ' +
            ' AND ex_cuil=tj_cuil ' +
            ' AND au_siniestro=sp_siniestro ' +
            ' AND au_orden=sp_orden ' +
            ' AND au_recaida=sp_recaida ' +
            ' AND au_numauto=sp_autooriginal ' +
            ' AND au_identifprestador=cpr_au.ca_identificador ' +
            ' AND pa_prestador=cpr_po.ca_identificador ' +
            ' AND au_trabajo = gp_codigo(+) ' +      // Ticket 62424
            ' AND pa_id =' + SqlInt(IdPresupuesto) +
            ' AND au_siniestro=' + SqlValue(iSiniestro) +
            ' AND au_orden=' + SqlValue(iOrden) +
            ' AND au_recaida=' + SqlValue(iRecaida) +
            ' AND au_numauto=' + SqlValue(iAutorizacion);

  OpenQuery(sdqSolicitudPresupuesto, sSql);

  iIdExpediente := Get_IdExpediente(iSiniestro, iOrden, iRecaida);

  if Is_SiniestroDeGobernacion(iIdExpediente) then                // Cambio por funcion nueva
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  if sdqSolicitudPresupuesto.IsEmpty then
  begin
    MsgBox('No se han encontrado los datos de la solicitud.', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end
  else begin
    try
    {  sSql := 'SELECT se_delegacion ' +
               ' FROM sau_autorizaciones, use_usuarios ' +
              ' WHERE au_usualta = se_usuario ' +
                ' AND au_siniestro = ' + SqlInt(iSiniestro) +
                ' AND au_orden = ' + SqlInt(iOrden) +
                ' AND au_recaida = ' + SqlInt(iRecaida) +
                ' AND au_numauto = ' + SqlInt(iAutorizacion);    }
      //si la delegacion del usuario de alta de la autorizacion no es capital, y la
      //delegacion del usuario actual es capital, el codigo de fax es 439      // Lu: Esto ya no va mas, pedido por Adriana Castañares 13/11/2009 Ticket: ???? (lo tiene que cargar aun, pero vino a raiz del ticket 12430)
     // bOtroCodigo := (ValorSql(sSql) <> '840') and (frmPrincipal.DBLogin.Delegacion = '840');

      SqlResults := ValoresColSql(' SELECT lg_codigo, lg_localidad, lg_representante, lg_nombre Delegacion, sc_descripcion Sector, ' +
                                         ' INITCAP(utiles.armar_domicilio(lg_calle, lg_numero, lg_piso, lg_departamento) || '' '' || ' +
                                         ' utiles.armar_localidad(lg_cpostal, '''', lg_localidad, lg_provincia)) DIRECCION, ' +
                                         ' utiles.armar_telefono(lg_codareatelefono,null,lg_telefono) TELEFONO ' +
                                    ' FROM dlg_delegaciones, usc_sectores ' +
                                   ' WHERE sc_delegacion = lg_codigo  ' +
                                     ' AND sc_codigo = ''' + frmPrincipal.DBLogin.Sector + ''' ');
      if sqlResults[0] = '840' then //CAPITAL
      begin
        qrlLugarFecha.Caption := 'Capital Federal, ' + DateToStr(DBDateTime);
        qrlNombreART.Caption := 'PROVINCIA A.R.T. "ORTOPEDIA Y OSTEOSINTESIS"';
      {  if bOtroCodigo then
        begin
          sCodigo   := '02';
          sTelefono := sqlResults[6];                    // TK 8759
        end else begin   }
          sCodigo   := '01';
          sTelefono := 'FAX 4338-4700 Interno 4701';   // TK 8759  //53334
       { end;   }

        try
          ssql := ' select pr_formulario, gp_email, gp_fax from ' +
                  '        art.sau_autorizaciones, art.mpr_prestaciones, art.mgp_gtrabajo ' +
                  '  where au_siniestro = :sin and au_orden = :ord and au_recaida = :rec and au_numauto = :aut ' +
                  '    and nvl(au_presapro, au_pressol) = pr_codigo and pr_fbaja is null and au_trabajo = gp_codigo(+) ' +
                  '    and gp_fbaja(+) is null ';

          with GetQueryEx(ssql, [iSiniestro, iOrden, iRecaida, iAutorizacion]) do
          begin
            if FieldByName('pr_formulario').AsString = 'P' then
            begin
              sqlRemitir :=  ValoresColSQL('SELECT tb_especial1, tb_especial2 ' +
                                            ' FROM ctb_tablas ' +
                                           ' WHERE tb_clave=''FRMAM'' ' +
                                             ' AND tb_codigo=' + sCodigo + '');
              qrlNombresRemitir.Caption := sqlRemitir[0];
              qrlTel.Caption := sTelefono + ' Enviar al Código ' + sqlRemitir[1];
              qrlTel.Caption := qrlTel.Caption + '               Mail: insumos@provart.com.ar';
              qrlNombreART.Caption := 'PROVINCIA A.R.T. "ORTOPEDIA Y OSTEOSINTESIS"';
            end
            else
            begin
              sTelefono := '4819-2800 Interno ';
              ssql := ' select se_mail, se_interno from art.use_usuarios ' +
                      '  where se_usuario = :usu ';
              with GetQueryEx(ssql, [Sesion.UserID]) do
              begin
                mail := fieldbyname('se_mail').AsString;
                int := fieldbyname('se_interno').AsString;
              end;

              if fieldbyname('gp_email').AsString <> '' then
                qrlNombresRemitir.Caption := fieldbyname('gp_email').AsString
              else
                qrlNombresRemitir.Caption := mail;

              qrlTel.Caption := sTelefono + int + iif(fieldbyname('gp_fax').AsString <> '', '  Enviar al Código ' + fieldbyname('gp_fax').AsString, '');
              qrlNombreART.Caption := 'PROVINCIA A.R.T.';
            end;
            qrlLeyenda.Caption := 'Se solicita cotizar dentro de las 24 hs. de recepcionado el pedido.';
          end;
        finally
          sqlRemitir.Free;
        end;
      end
      else begin
        qrlLugarFecha.Caption := sqlResults[1] + ', ' + DateToStr(DBDateTime);
        qrlNombresRemitir.Caption := sqlResults[2];
        qrlNombreART.Caption := sqlResults[5];
        qrlTel.Caption := sqlResults[6];
      end;

      if (sdqSolicitudPresupuesto.FieldByName('AU_TRABAJO').AsString = cGRUPOINTERNADOS) then  // TK 59412
        qrlPacienteInternado.Caption := 'PACIENTE INTERNADO';

      qrlNombreFanta.Caption       := sdqSolicitudPresupuesto.FieldByName('NOMBREFANTA').AsString;     // por ticket 64118 el nombre de fantasia ahora debe salir para todos los casos.
      qrlTitNombreFanta.Caption    := 'NOMBRE FANT.:';

    finally
      sqlResults.Free;
    end;

    with sdqSolicitudPresupuesto do
    begin
      if sRutaArchivo = '' then
        Print
      else begin
        ExportarPDF(Self, sRutaArchivo);

        if (sMailSuc <> '') and (IsEMails(sMailSuc)) then
          sMail := sMailSuc
        else
          sMail := FieldByName('CA_DIRELECTRONICA').AsString;

        OpcionesEnvio := [oShowDialogIfEmpty, oDeleteAttach];
        if bPantallaEnvio then
          OpcionesEnvio := OpcionesEnvio + [oAutoFirma, oAlwaysShowDialog];

        if sMail > '' then
          if IsEMails(sMail) then
            if (EnviarMailDB(sMail,
                         'Solicitud de Presupuesto - Siniestro ' + FieldByName('SINIESTROCOMPLETO').AsString,
                         OpcionesEnvio, 'Provincia ART', GetAttachments(sRutaArchivo, 0))) = true then
            begin
              ssql := ' update mpa_presupuestoautorizacion ' +
                      '    set pa_usumail = :usu, pa_fechamail = art.actualdate ' +
                      '  where pa_id = :id ';
              EjecutarSqlEx(ssql, [sesion.UserID, IdPresupuesto]);

            end
          else
            MsgBox('El prestador seleccionado no posee una dirección válida de correo electrónico.')
        else
          MsgBox('El prestador seleccionado no posee dirección de correo electrónico.')
      end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TqrpSolicitudPresupuesto.SetEntregaTrabajador(const Value :Boolean);
begin
  if Value then
  begin
    qrlTitEntrega.Caption             := 'TRABAJADOR:';
    qrdbtEntrega.DataField            := 'TJ_NOMBRE';
    qrdbtDomicilioEntrega.DataField   := 'TRABAJADORDOMICILIO';
    qrdbtTelefonoEntrega.DataField    := 'TRABAJADORTELEFONO';
  end
  else begin
    qrlTitEntrega.Caption             := 'PRESTADOR:';
    qrdbtEntrega.DataField            := 'PRESTADOR';
    qrdbtDomicilioEntrega.DataField   := 'PRESTADORDOMICILIO';
    qrdbtTelefonoEntrega.DataField    := 'PRESTADORTELEFONO';
  end;
  FEntregaTrabajador := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
