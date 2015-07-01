unit unDinerariasAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unBaseAdministracionCartas, SDEngine, Menus, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, unFraSDA_DETALLEARCHIVO,
  unFraCodigoDescripcion, unfraCtbTablas, unfraFirmante,
  unFraDomicilioTrab, ComCtrls, StdCtrls, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CardinalEdit, ToolWin,
  ToolEdit, DateComboBox, CheckCombo, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ComboEditor,
  DBCheckCombo, Mask, PatternEdit, IntEdit, unComunes, unRptCartaDocHeader,
  SinEdit, unArtDbFrame, unFraEmpresa, unFraGrupoTrabajo, RxPlacemnt, RxToolEdit;

type
  TfrmDinerariasAdministracionCartas = class(TfrmBaseAdministracionCartas)
    fraEmpresaDeudora: TfraEmpresa;
    GroupBox1: TGroupBox;
    edSiniestro: TSinEdit;
    gbSiniestro: TGroupBox;
    lbSiniestros: TLabel;
    SinDesde: TSinEdit;
    SinHasta: TSinEdit;
    gbGrupoTrab: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    ShortCutControl1: TShortCutControl;
    GroupBox3: TGroupBox;
    rbFirmanteOrig: TRadioButton;
    rbFirmanteActual: TRadioButton;
    ShortCutControlHijo2: TShortCutControl;
    fpSeguimiento: TFormPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    gridSeguimiento1: TArtDBGrid;
    Panel4: TPanel;
    gridSeguimiento2: TArtDBGrid;
    pnButtons: TPanel;
    btnCerrar: TButton;
    sdqSeguimiento1: TSDQuery;
    dsSeguimiento1: TDataSource;
    sdqSeguimiento2: TSDQuery;
    dsSeguimiento2: TDataSource;
    tbSeguimiento: TToolButton;
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure ImprimirDireccionesFaltantes;
    procedure DoActualizarTurno(iCartaEmp, iCartaTrab: Integer);
    function GetTipoSalida: TSalidaReport;
    procedure btnPararClick(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure DoLimpiarTemporal;
    procedure ValidarDirAval(IdDestinatario: Integer; sDestinatario: TTipoDestinatario;
                             bNuevaCarta, bVentanilla: Boolean; var bFaltaDir, bFaltaAval: Boolean);
    function OuterJoin :String;
    procedure mnuImprimirCartasDocumentoClick(Sender: TObject);
    function IsRegistrosImpresionCartaDocValidos: Boolean;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSeguimientoClick(Sender: TObject);
  private
    PararImpresion: boolean;
  protected
    function GetWhere: String; override;
    function GetSql: String; override;
    procedure NuevaCarta(Sender: TObject); override;
  public
    procedure MostrarCarta(IdCarta: Integer); override;
  end;

var
  frmDinerariasAdministracionCartas: TfrmDinerariasAdministracionCartas;

implementation

uses
  Printers, CustomDlgs, CUIT, unDmPrincipal, unRptCartaDocSinDDJJ, unCustomDataModule, unRptCartaDocumento, General,
  unArt, unRptDomiciliosIncompletos, unSesion, AnsiSql, unfraPrestador, unGeneracionCartasAdmin,
  UnRptCartaDocPuestaDisp, unCustomConsulta, unRptRemitoCartas;

{$R *.dfm}

procedure TfrmDinerariasAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
var
  bEsSinGobernacion, bFaltanDirecciones,
  bCartasSinAval, bFaltaDirTrab, bSalioPdf, bVentanilla, bFaltaDirEmp: Boolean;
  iIdDestinatario, i, IdCarta, OldImpresora, iIdExped: Integer;
  sSalida: TSalidaReport;
  sModulo, sArea, sMensaje, sNombrePdf: String;
  sDestinatario: TTipoDestinatario;
begin
  OldImpresora         := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  sDestinatario        := tdOtros;
  iIdDestinatario      := 0;
  sSalida              := srPrint;
  bSalioPdf            := False;

  try
    PararImpresion      := False;
    btnParar.Enabled    := True;
    bFaltanDirecciones  := False;
  //  bSalioPdf           := False;
    DoLimpiarTemporal;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Verificar(PararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      sSalida := GetTipoSalida;
      sArea   := sdqConsulta.FieldByName('at_area').AsString;
      sModulo := sdqConsulta.FieldByName('at_modulo').AsString;
      IdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;

      if not (sModulo = MODULO_PAGOTRABAJADOR) then   // estas CD se imprimen desde unLiqCartasDocumento
      begin
        iIdExped            := Get_IdExpediente(sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger, sdqConsulta.FieldByName('ex_recaida').AsInteger);
        bEsSinGobernacion   := Is_SiniestroDeGobernacion(iIdExped) or
                               (Get_Holding(SacarGuiones(sdqConsulta.FieldByName('cuit').AsString)) = 'GBA');

        if not sdqConsulta.FieldByName('ca_idtrabajador').IsNull then           // Destino Trabajador
        begin
          sDestinatario   := tdTrabajador;
          iIdDestinatario := sdqConsulta.FieldByName('ca_idtrabajador').AsInteger;
        end
        else if not sdqConsulta.FieldByName('ca_idendoso').IsNull then          // Destino Empresa
        begin
          sDestinatario   := tdEmpresa;
          iIdDestinatario := sdqConsulta.FieldByName('ca_idendoso').AsInteger;
        end;

        //iIdDestinatario := sdqConsulta.FieldByName('ca_idtrabajador').AsInteger;
        bFaltaDirTrab   := False;
        ValidarDirAval(iIdDestinatario, sDestinatario, False, False, bFaltaDirTrab, bCartasSinAval);

        //bEsConfidencial := Is_EmpresaConfidencial(sdqConsulta.FieldByName('ex_cuit').AsString);

        {bAlTrabajador := (sdqConsulta.FieldByName('nrocartadoc').IsNull) and //si no estaba impresa
                         (sDestinatario = tdEmpresa) and
                         (not bEsConfidencial) and //si no es confidencial
                         ((sdqConsulta.FieldByName('tc_destinatario').AsString = DESTI_AMBOS) or  //si el destinatario es AMBOS
                            ((sdqConsulta.FieldByName('tc_destinatario').AsString = DESTI_EMPRESA) and //o si es EMPRESA y tiene formato relacionado
                            (sdqConsulta.FieldByName('tc_formatorel').AsInteger <> 0))); }

        bFaltanDirecciones := bFaltanDirecciones or bFaltaDirTrab;

        if sDestinatario = tdEmpresa then
        begin
          ValidarDirAval(iIdDestinatario, sDestinatario, False, (sSalida = srPdf),
                         bFaltaDirEmp, bCartasSinAval);
          bFaltanDirecciones := bFaltanDirecciones or bFaltaDirEmp;
        end;

        if not(bFaltanDirecciones) then
        begin
          if sSalida = srPdf then   //el IIF me falla aca....
          begin
            sNombrePdf  := GetNombreCartaPdf(IdCarta);
            bVentanilla := True;
          end else
          begin
            sNombrePdf  := '';
            bVentanilla := False;
          end;
          if sModulo = MODULO_NOTIFICACIONES then
            DoImprimirCartaSinDDJJ(IdCarta, sSalida, tmBeginEnd, edCantCopias.Value,
                                   True, True, bEsSinGobernacion)
          else
          begin
            if (sdqConsulta.FieldByName('esPuestaDisp').AsString = 'S') and 
               (sdqConsulta.FieldByName('tc_destinatario').AsString = DESTI_TRABAJADOR) then
                DoImprimirCartaPuestaDisp(IdCarta, sSalida, tmBeginEnd, edCantCopias.Value, True, bEsSinGobernacion)
            else
              DoImprimirCarta(IdCarta, taDinerarias, sSalida, tmBeginEnd, edCantCopias.Value,
                              True, True, False, False, True, True, False, True, bEsSinGobernacion,
                              True, False, False,
                              False, '', False, sdqConsulta.FieldByName('nrocartadoc').IsNull,
                              sNombrePdf, IIF(rbFirmanteOrig.Checked, True, False),
                              bVentanilla);
          end;

          bSalioPdf := bSalioPdf or bVentanilla;
        end;
      end;
      BarProgreso.Position := Round((i + 1) / Grid.SelectedRows.Count * 100);
      Application.ProcessMessages;
    end;

    if bFaltanDirecciones or bCartasSinAval or bSalioPdf then
    begin
      sMensaje := 'Atención: ' + #10;
      if bFaltanDirecciones then
        sMensaje := sMensaje + '- Al menos una de las cartas no se pudo emitir porque ' + #10 +
                               '  el destinatario no posee una dirección válida.' + #10;
      if bCartasSinAval then
        sMensaje := sMensaje + '- Al menos una de las cartas ha sido impresa sin aval del firmante.' + #10;

      if bSalioPdf then
        sMensaje := sMensaje + '- Al menos una de las cartas ha sido generada en formato pdf ' + #10 +
                               '  y se ha enviado a Ventanilla Electrónica.';

      MsgBox(sMensaje, MB_ICONINFORMATION, 'Información importante');
      ImprimirDireccionesFaltantes;
      DoLimpiarTemporal;
    end;

    fpOpcionesImpresion.ModalResult := mrOk;
    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  finally
    Printer.PrinterIndex := OldImpresora;
    btnParar.Enabled := False;
    if (sSalida = srPdf) and bSalioPdf and (sNombrePdf <> '') then  // Borro el PDF (lo hago en este modulo porque es solo para redpres)
    begin
      SysUtils.DeleteFile(sNombrePdf);
    end;
  end;
end;

procedure TfrmDinerariasAdministracionCartas.ImprimirDireccionesFaltantes;
var
  sSql: String;
  rptDirecciones: TqrDireccionesFaltantes;
begin
  sSql := 'DELETE FROM tmp_dirincompletas a ' +
          ' WHERE a.mp_tipo = ''P'' ' +
            ' AND a.mp_nombreempr IS NOT NULL ' +
            ' AND EXISTS(SELECT 1 ' +
                         ' FROM tmp_dirincompletas b ' +
                        ' WHERE b.mp_sincompleto = a.mp_sincompleto ' +
                          ' AND b.mp_formato = a.mp_formato ' +
                          ' AND b.mp_usuario = a.mp_usuario ' +
                          ' AND b.mp_tipo = ''D'') ';
  EjecutarSql(sSql);

  rptDirecciones := TqrDireccionesFaltantes.Create(nil);
  with rptDirecciones do
  try
    sdqDatos.Close;
    sdqDatos.ParamByName('pUsuario').AsString := Sesion.UserID;
    sdqDatos.Open;
    PreviewModal;
  finally
    Free;
  end;
end;

procedure TfrmDinerariasAdministracionCartas.DoActualizarTurno(iCartaEmp, iCartaTrab: Integer);
var
  sSql :String;
begin
  sSql := 'UPDATE mcc_citacionconsultorio' +
            ' SET cc_idcartatrab = :iCartaTrab' +
          ' WHERE cc_idcartaemp = :iCartaEmp';
  EjecutarSqlSTEx(sSql, [iCartaTrab, iCartaEmp]);
end;

function TfrmDinerariasAdministracionCartas.GetTipoSalida: TSalidaReport;
var
  iFirma: Integer;
begin
  if rbPreview.Checked then
    Result := srPreview
  else begin
    iFirma := IIF(rbFirmanteOrig.Checked, sdqConsulta.FieldByName('ca_idfirma').AsInteger,
                                          IIF(sdqConsulta.FieldByName('ca_idfirmareimpresion').IsNull,
                                              sdqConsulta.FieldByName('ca_idfirma').AsInteger,
                                              sdqConsulta.FieldByName('ca_idfirmareimpresion').AsInteger));

    if (sdqConsulta.FieldByName('ca_idavaldigital').AsInteger = iFirma) and       //si el firmante esta avalado digitalmente
        sdqConsulta.FieldByName('nrocartadoc').IsNull and                         //si no esta impresa la carta
        not(sdqConsulta.FieldByName('ca_idendoso').IsNull) and                    //si es a la empresa
        GetEmpresaTieneVentanilla(sdqConsulta.FieldByName('ca_idendoso').AsInteger) and  //si la empresa esta inscripta en ventanilla
        (sdqConsulta.FieldByName('tc_tiposalida').AsString = 'C') then  // TK 38837 solo formato de carta documento
      Result := srPdf
    else
      Result := srPrint;
  end;
end;

procedure TfrmDinerariasAdministracionCartas.btnPararClick(Sender: TObject);
begin
  PararImpresion   := True;
  btnParar.Enabled := False;
end;

procedure TfrmDinerariasAdministracionCartas.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmDinerariasAdministracionCartas.DoLimpiarTemporal;
var
  sSql: String;
begin
  sSql := 'DELETE FROM tmp_dirincompletas' +
          ' WHERE mp_usuario = ' + SqlValue(Sesion.UserID);
  EjecutarSql(sSql);
end;

procedure TfrmDinerariasAdministracionCartas.ValidarDirAval(IdDestinatario: Integer; sDestinatario: TTipoDestinatario;
                                                         bNuevaCarta, bVentanilla: Boolean; var bFaltaDir, bFaltaAval: Boolean);
var
  sSql, sLetra: String;
  bSinDir, bSinAval: Boolean;
  iFirmaDig: Integer;
begin
  if (sdqConsulta.FieldByName('tc_tiposalida').AsString <> 'C') then //solo valido dir si es carta documento
  begin
    bSinDir  := False;
    bSinAval := False;
  end
  else begin
    if sDestinatario = tdEmpresa then
      sSql := 'SELECT hm_nombre empresa, null trabajador, null commedica, hd_cpostal cpostal, ' +
                    ' hd_localidad localidad, pv_descripcion provincia, hd_calle calle' +
               ' FROM aen_endoso, ahm_historicoempresa, ahd_historicodomicilio, cpv_provincias' +
              ' WHERE hm_id = en_idhistoricoempresa' +
                ' AND hd_id = en_idhistoricodomicilio' +
                ' AND hd_provincia = pv_codigo(+)' +
                ' AND en_id = :dest '

    else if sDestinatario = tdTrabajador then
      sSql := 'SELECT null empresa, tj_nombre trabajador, null commedica, tj_cpostal cpostal, ' +
                    ' tj_localidad localidad, pv_descripcion provincia, tj_calle calle' +
               ' FROM ctj_trabajador, cpv_provincias' +
              ' WHERE tj_provincia = pv_codigo(+)' +
                ' AND tj_id = :dest ';

    with GetQueryEx(sSql, [IdDestinatario]) do
    try
      bSinDir   := FieldByName('cpostal').IsNull or FieldByName('localidad').IsNull or
                   FieldByName('provincia').IsNull or FieldByName('calle').IsNull;
      iFirmaDig := GetFirmaDigital(sdqConsulta.FieldByName('at_area').AsString,
                                   sdqConsulta.FieldByName('at_modulo').AsString,
                                   sdqConsulta.FieldByName('fi_codusuario').AsString);
      if bNuevaCarta then
        bSinAval := (iFirmaDig > 0) and
                    (iFirmaDig <> sdqConsulta.FieldByName('codigofirma').AsInteger)
      else
        bSinAval := (iFirmaDig > 0) and
                    (sdqConsulta.FieldByName('ca_idavaldigital').AsInteger <>
                     sdqConsulta.FieldByName('codigofirma').AsInteger);

      if bSinDir or bSinAval or bVentanilla then
      begin
        if bSinDir then
          sLetra := 'D'
        else if bSinAval then
          sLetra := 'A'
        else if bVentanilla then
          sLetra := 'P'
        else
          sLetra := '';

        sSql := 'INSERT INTO tmp_dirincompletas' +
              '(mp_usuario, mp_sincompleto, mp_nombreempr, ' +
              ' mp_nombretrab, mp_nombrecommed, mp_formato, mp_tipo) VALUES (' +
                SqlValue(Sesion.UserID) + ',' +
                SqlValue(sdqConsulta.FieldByName('siniestro').AsString) + ',' +
                SqlValue(FieldByName('empresa').AsString) + ',' +
                SqlValue(FieldByName('trabajador').AsString) + ',' +
                SqlValue(FieldByName('commedica').AsString) + ',' +
                SqlValue(sdqConsulta.FieldByName('tc_codigo').AsString) + ',' +
                SqlValue(sLetra) + ')';
        EjecutarSql(sSql);
      end;
    finally
       Free;
    end;
  end;
  bFaltaDir  := bFaltaDir  or bSinDir;
  bFaltaAval := bSinAval;
end;

procedure TfrmDinerariasAdministracionCartas.MostrarCarta(IdCarta: Integer);
begin
//
end;

function TfrmDinerariasAdministracionCartas.GetSql: String;
var
  sCAT, sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sCAT := ''''' || '  // para que no utilice el índice por AT_AREA
  else
    sCAT := '';

  sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' ex_siniestro, ex_orden, ex_recaida, ex_cuil, ex_cuit, ' +
                ' utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(hm_cuit) cuit, ' +
                ' hm_nombre empresa, hc_contrato contrato, tc_nombre tipocarta, tc_destinatario, tc_id, ' +
                ' correo.tb_descripcion ultcorreo, ca_usuimpresion, trunc(ca_fechaimpresion) fechaimpresion, ' +
                ' decode(ca_recepcionok, ''S'', ''Si'', ''No'') recepcionok, ca_fecharecepcion, ' +
                ' codre.tb_descripcion desc_recepcion, to_char(fi_id) codigofirma, fi_firmante, ' +
                ' trunc(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ' +
                ' ca_id, ca_manual, ca_fechabaja, nvl(ca_correoreimpresion, ca_correo) correo, ' +
                ' ca_idcartaareemplazar, ca_recepcionok, ca_codrecepcion, Null ca_idformulario, ca_idendoso, ' +
                ' ca_usualta, trunc(ca_fechaalta) fechaalta, el_nombre, ca_idareatexto, ' +
                ' Null porcvariable, Null sumafija, utiles.armar_cuit(tj_cuil) cuil, ' +
                ' at_area, tj_nombre trabajador, tc_formatorel, tc_codigo, ca_idtrabajador, ' +
                ' ca_idrecepcioncartadoc, ' +
                ' rc_codigobarras_cd trackytrace_rend, cr_codigobarras_cd trackytrace_Impos, ' +  // TK 62460
                ' ca_ideventoinca, ca_fechaaltamedica, at_modulo, gp_nombre GTrabajo, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor, ca_incluirenremito, ' +
                ' ca_idremito, ca_evento, ca_idcomisionmedica, tc_tiposalida, cm_descripcion ComMed, ' +
                ' ca_idexpediente, ca_fechamail, ca_usumail, ' +    // Lu WF 7946 agregue los campos ca_fechamail y ca_usumail
                ' tc_textomodificable, tc_textoaltamanual, ca_observrecepcion, ' +     // Lu TK 790
                ' ca_idremitoreimpresion, ca_idavaldigital, ca_eventoabandono, ' +
                ' fi_codusuario, ca_iddestinatariocarta, ca_idfirmareimpresion, ' +
                ' ca_idfirma, NVL(ca_ventanilla, ''N'') ca_ventanilla, dc_nombre OtroDestinatarioCarta, ' +  // TK 29251
                ' ca_idtextocarta, ca_motivorechazobase, ca_nrocartadoc, ca_fechavalmanual, art.dinerarias.is_cartapuestadisp(ca_id) esPuestaDisp ' +     // TK 45302
           ' FROM crc_recepcioncartadoc, aen_endoso, ahc_historicocontrato, ahm_historicoempresa, ' +
                ' ctc_textocarta, cfi_firma, ctb_tablas salida, ' +
                ' ctb_tablas correo, ctb_tablas codre, cat_areatexto, ' +
                ' cta_textoarea, del_delegacion, cca_carta, ' +
                ' sex_expedientes, ctj_trabajador, mgp_gtrabajo, SIN.scm_comisionmedica, cdc_destinatariocarta, ' +
                ' ccr_cab_recepcioncartadoc ' +  // TK 62460
          ' WHERE ca_idtextocarta = tc_id ' +
            ' AND ca_idtrabajador = tj_id(+) ' +
            //si esta el filtro de siniestro, le saco el outer join para que vuelva mas rapido...
            ' AND ca_idexpediente = ex_id ' + OuterJoin +
            ' AND ta_idtextocarta = tc_id ' +
            ' AND ta_idareatexto = at_id ' +
            ' AND ca_idareatexto = at_id ' +   // por ahora va esta condición, la agregué porque cuando buscaba una carta de compensación, me la triplicaba en la grilla
            ' AND ca_idcomisionmedica = cm_id(+) ' +
            ' AND ' + sCAT + 'at_area IN ('+ Area + ') ' +
            ' AND correo.tb_codigo(+) = nvl(ca_correoreimpresion, ca_correo) ' +
            ' AND correo.tb_clave(+) = ''CORRE'' ' +
            ' AND codre.tb_codigo(+) = ca_codrecepcion ' +
            ' AND codre.tb_clave(+) = ''CODRE'' ' +
            ' AND salida.tb_clave = ''TSCDO'' ' +
            ' AND salida.tb_codigo = ca_tiposalida ' +
            ' AND en_idhistoricocontrato = hc_id(+) ' +
            ' AND en_idhistoricoempresa = hm_id(+) ' +
            ' AND nvl(ca_idfirmareimpresion, ca_idfirma) = fi_id ' +
            ' AND ca_idendoso = en_id(+) ' +
            ' AND ca_iddelegacion = el_id(+) ' +
            ' AND ca_idrecepcioncartadoc = rc_id(+) ' +
            ' AND ta_fechabaja IS NULL ' +
            ' AND at_fechabaja IS NULL ' +
            ' AND ca_iddestinatariocarta = dc_id(+) ' +   // TK 29251
            ' AND cr_idcarta(+) = ca_id '   +             // TK 62460
            ' AND ex_gtrabajo = gp_codigo ' + OuterJoin + GetWhere;

  Result := sSql;
end;

function TfrmDinerariasAdministracionCartas.OuterJoin :String;
begin
  Result := IIF(edSiniestro.IsEmpty and SinDesde.IsEmpty, '(+)', '');
end;

function TfrmDinerariasAdministracionCartas.GetWhere: String;
var
  sSql: String;
begin
  if not fraEmpresaDeudora.IsEmpty then
    sSql := ' AND hc_contrato = ' + SqlInt(fraEmpresaDeudora.Contrato);

  if not SinDesde.IsEmpty then
    sSql := sSql + ' AND ex_siniestro BETWEEN ' + SinDesde.SiniestroSql  + ' AND ' + SinHasta.SiniestroSql;

  if not edSiniestro.IsEmpty then
    sSql := sSql + ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
                   ' AND ex_orden = ' + edSiniestro.OrdenSql +
                   ' AND ex_recaida = ' + edSiniestro.RecaidaSql;

  if  (fraGrupoTrabajo.ID <> '') then
    sSql := sSql + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

  Result := inherited GetWhere + sSql;
end;

procedure TfrmDinerariasAdministracionCartas.mnuImprimirCartasDocumentoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla')
  else
    if IsRegistrosImpresionCartaDocValidos() then
    begin
      btnParar.Enabled := False;
      CargarImpresoras;
      fpOpcionesImpresion.ShowModal;
    end;

end;

function TfrmDinerariasAdministracionCartas.IsRegistrosImpresionCartaDocValidos: Boolean;
var
  bSalir: Boolean;
  i: Integer;
  sMensaje: String;
begin
  bSalir := False;
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
    // no debe estar dada de baja
    if not sdqConsulta.FieldByName('CA_FECHABAJA').IsNull then
    begin
      sMensaje  := 'Alguna de las cartas documento ya se encuentra dada de baja';
      bSalir    := True;
    end
    else if Is_EmpresaConfidencial(sdqConsulta.FieldByName('ex_siniestro').AsInteger,
                                   sdqConsulta.FieldByName('ex_orden').AsInteger,
                                   sdqConsulta.FieldByName('ex_recaida').AsInteger) then
    begin
      sMensaje  := 'Alguna de las cartas documento pertenece a una empresa confidencial';
      bSalir    := True;
    end;

    if bSalir then
    begin
      InvalidMsg (Grid, sMensaje);
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmDinerariasAdministracionCartas.NuevaCarta(Sender: TObject);
begin
  with TfrmGeneracionCartasAdmin.Create(Self) do
  try
    if Sender = tbNuevo then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('CA_ID').AsInteger;

    PermitirSinRechazado := True;   
    CodArea := Self.Area;
    Preparar(IdCarta);

    if Mostrar and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmDinerariasAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  NuevaCarta(Sender);
end;

procedure TfrmDinerariasAdministracionCartas.tbSeguimientoClick(
  Sender: TObject);
begin

  if (not sdqConsulta.Active) or (sdqConsulta.FieldByName('ca_id').AsInteger = 0) then
    MsgBox('Debe seleccionar una carta documento.')
  else
  begin

    with sdqSeguimiento1 do
    begin
      Close;
      ParamByName('idcarta').AsInteger := sdqConsulta.FieldByName('ca_id').AsInteger;
      Open;
    end;

    with sdqSeguimiento2 do
    begin
      Close;
      ParamByName('idcarta').AsInteger := sdqConsulta.FieldByName('ca_id').AsInteger;
      Open;
    end;

    fpSeguimiento.Caption := Format('Seguimiento de la Carta Documento %s (%s)',
                                    [sdqConsulta.FieldByName('nrocartadoc').AsString,
                                     sdqConsulta.FieldByName('empresa').AsString]);
    fpSeguimiento.ShowModal;

  end;
end;

procedure TfrmDinerariasAdministracionCartas.tbLimpiarClick(
  Sender: TObject);
begin
  inherited;
  fraEmpresaDeudora.Clear;
  SinDesde.Clear;
  SinHasta.Clear;
  edSiniestro.Clear;
  fraGrupoTrabajo.Clear;
end;

end.
