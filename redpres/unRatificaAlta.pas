unit unRatificaAlta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit,
  unArtFrame, unFraCodigoDescripcion, ImgList, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin,General,unDmPrincipal, Menus,
  unArtDBAwareFrame, unFraGrupoTrabajo, unfraFirmante, unfraFirmantes;

type

  TfrmRatificaAlta = class(TfrmCustomGridABM)
    chkCartasImpr: TCheckBox;
    chkCartasGen: TCheckBox;
    fraDelegacion: TfraCodigoDescripcion;
    Label5: TLabel;
    Label1: TLabel;
    Sindde: TSinEdit;
    Label2: TLabel;
    Sinhta: TSinEdit;
    Label3: TLabel;
    Label6: TLabel;
    Fecdde: TDateComboBox;
    Label4: TLabel;
    Fechta: TDateComboBox;
    Cmbcitac: TDateComboBox;
    CmbFirma: TArtComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edSiniestro: TSinEdit;
    edCUIL: TEdit;
    edCUIT: TEdit;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    chkReca: TCheckBox;
    fraFormato: TfraCodigoDescripcion;
    fraFirma: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure chkCartasGenClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    //procedure CmbFormatoExit(Sender: TObject);
    //procedure tbImprimirClick(Sender: TObject);
    //procedure mnuImprimirReimprimirClick(Sender: TObject);
    procedure fraFormatoExit(Sender: TObject);
  private
    IOpcion: Integer;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override ;

    //procedure Imprimir(AReimpresion: Boolean);
  public
  end;
implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, unCartaDocumento, StrFuncs, unSesion,
  uncomunes, Printers, unART, unRptCartadocHeader, unTercerizadoras;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.tbRefrescarClick(Sender: TObject);
var
   SSQL,SSQLCampos,SSQLCamposPlus,SSQLFrom,SSQLFromPlus,SSQLWhere,SSQLWherePlus:String;
begin
  SSQLCampos:= 'SELECT ex_siniestro,ex_orden,ex_recaida, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro,' +
                     ' nvl(ex_fecharecaida, ex_fechaaccidente) f_accidente, ' +
                     ' pe_fechaaltamedica alta_med, pe_fechaalta f_carga, ' +
                     ' pe_fconforme firma_conf, pe_obrasocial obra_soc, ' +
                     ' pe_recalificacion reca, tt_descripcion tipo_trata, ' +
                     ' ex_diagnosticooms cie10, ca_descripcion prestador, tj_nombre paciente, ' +
                     ' art.utiles.armar_domicilio(tj_calle, tj_numero,tj_piso, tj_departamento, tj_localidad) dom_trab,' +
                     ' em_nombre empresa, lg_nombre delegacion, gp_nombre grupo, ' +
                     ' ex_cuil cuil, ex_cuit cuit, ex_contrato contrato, ' +
                     ' siniestro.get_usuariogestor(ex_id) USUGESTOR ';
  SSQLFrom:=' FROM art.sex_expedientes, comunes.ctj_trabajador, art.cpr_prestador, ' +
                 ' afi.aem_empresa, art.dlg_delegaciones, sin.stt_tipotratamiento, ' +
                 ' art.mgp_gtrabajo, sin.spe_partedeegreso ';
  SSQLWhere:=' WHERE NVL(pe_fconforme, ''N'') = ''N''' +
               ' AND pe_idtipotratamiento = tt_id(+) ' +
               ' AND ex_id = pe_idexpediente ' +
               ' AND ex_prestador = ca_identificador ' +
               ' AND ex_idtrabajador = tj_id ' +
               ' AND ex_cuit = em_cuit ' +
               ' AND ex_delegacion = lg_codigo ' +
               ' AND ex_gtrabajo = gp_codigo ' +
               ' AND NVL(LTRIM(ex_gravedad),''1'') <> ''5''' +
               ' AND NVL(ex_diagnosticooms,''X'') <> ''Z20.9''' +
               ' AND NVL(ex_causafin,''0'') not in (''99'',''95'',''02'',''07'')' +
               ' AND pe_idtipodeegreso <> ''3'' ';

  if (sindde.Text <> '') and (sinhta.Text <> '') then
  begin
     case iOpcion of  { by NWK, 28/03/03 }
       2, 3:
         SSQLWhere := SSQLWhere + ' AND ex_siniestro BETWEEN ' + sindde.SiniestroSql + ' AND ' + sinhta.SiniestroSql
     else
       SSQLWhere := SSQLWhere + ' AND ex_siniestro BETWEEN ' + sindde.SiniestroSql + ' AND ' + sinhta.SiniestroSql;
     end;
  end;

  if (not fecdde.IsEmpty) and (not fechta.IsEmpty) then
    SSQLWhere := SSQLWhere + ' AND pe_fechaalta BETWEEN ' + fecdde.SqlText + ' AND ' + fechta.SqlText;

  if fradelegacion.edCodigo.Text <> '' then
     SSQLWhere := SSQLWhere + ' AND ex_delegacion =' + fradelegacion.edCodigo.Text;

  if  (fraGrupoTrabajo.ID <> '') then
    SSQLWhere := SSQLWhere + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    SSQLWhere := SSQLWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

  if chkReca.Checked then
    SSQLWhere := SSQLWhere + ' AND pe_recalificacion = ''S'' ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    SSQLWhere := SSQLWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if iOpcion=1 then
  begin
     SSQLCamposPlus:= ','''' FORMATO,'''' FIRMA ,TO_DATE(NULL) CITACION, '''' ex_cuil, '''' ex_cuit, NULL ca_nrocartadoc ';
     SSQLWherePlus:= ' AND NOT EXISTS (SELECT 1 FROM cca_carta, ctc_textocarta ' +
                                      ' WHERE ca_idexpediente = pe_idexpediente ' +
                                        ' AND (ca_fechaimpresion >= pe_fechaaltamedica OR ca_fechaimpresion IS NULL) ' +
                                        ' AND ca_idtextocarta = tc_id ' +
                                        ' AND tc_ratificacion = ''S'') ' +
     //camarillo - si es recalificacion tienen que salir solamente cuando
     //la fecha de egreso (pe_fechaaltamedica) es > que la de alta (pe_altamedica)
                     ' AND DECODE(pe_recalificacion, ''S'', pe_fechaaltamedica, ACTUALDATE) >= pe_fechaaltalaboral ';
  end;

  if iOpcion=2 then
  begin
   SSQLCamposPlus := ', tc_nombre formato, fi_firmante firma, ca_fechacitaratif citacion, ' +
                      ' ex_cuil, ex_cuit, ca_nrocartadoc, ca_idfirma codfirma, tc_codigo codformato ';
   SSQLFromPlus   := ', cca_carta, cfi_firma, ctc_textocarta ';
   SSQLWherePlus  := ' AND ca_idtextocarta = tc_id ' +
                     ' AND ca_idexpediente = pe_idexpediente ' +
                     ' AND ((ex_cuil IS NOT NULL AND tc_ratificacion = ''S'') ' +
                       ' OR (ex_cuit IS NOT NULL AND tc_ratificacion = ''S'' ' +
                        ' AND (tc_formatorel IS NULL) OR afiliacion.isempresaconfidencial(ex_cuit)=''S'')) ' +
                     ' AND ca_fechaimpresion IS NULL ' +
                     ' AND tc_ratificacion = ''S'' ' +
                     ' AND nvl(ca_idfirmareimpresion, ca_idfirma) = fi_id ';
  end;

  if iOpcion=3 then
  begin
    SSQLCamposPlus := ', tc_nombre formato, fi_firmante firma, ca_fechacitaratif citacion, ' +
                       ' ex_cuil, ex_cuit, ca_nrocartadoc, ca_idfirma codfirma, tc_codigo codformato ';
    SSQLFromPlus   := ', cca_carta, cfi_firma, ctc_textocarta ';
    SSQLWherePlus  := ' AND ca_idtextocarta = tc_id ' +
                      ' AND ca_idexpediente = pe_idexpediente ' +
                      ' AND ((ex_cuil IS NOT NULL AND tc_ratificacion = ''S'') ' +
                        ' OR (ex_cuit IS NOT NULL AND tc_ratificacion = ''S'' ' +
                      ' AND (tc_formatorel IS NULL) ' +
                            'OR afiliacion.isempresaconfidencial(ex_cuit)=''S'')) ' +
                      ' AND ca_fechaimpresion IS NOT NULL ' +
                      ' AND nvl(ca_idfirmareimpresion, ca_idfirma) = fi_id ' +
                      ' AND tc_ratificacion = ''S'' ';
  end;

  SSQL := SSQLCampos + SSQLCamposPlus + SSQLFrom + SSQLFromPlus + SSQLWhere + SSQLWherePlus;
  sdqconsulta.SQL.text := SSQL;
  inherited;

end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.chkCartasGenClick(Sender: TObject);
begin
  inherited;
  if chkCartasGen.checked then
  begin
     if chkCartasImpr.checked then
        IOpcion:=3
     else
        IOpcion:=2;
  end
  else begin
    if chkCartasImpr.checked then begin
      msgbox ('No se puede tildar Cartas Impresas sin antes tildar cartas Generadas');
      chkCartasImpr.checked:=False;
    end;
    IOpcion:=1;
  end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.tbNuevoClick(Sender: TObject);
begin
  fpabm.tag:=1;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.FormCreate(Sender: TObject);
begin
  inherited;
  fradelegacion.TableName   :='DLG_DELEGACIONES';
  fradelegacion.FieldCodigo :='LG_CODIGO';
  fradelegacion.FieldDesc   :='LG_NOMBRE';
  fradelegacion.FieldBaja   :='LG_FECHABAJA';

  fraFormato.FieldCodigo    := 'tc_codigo';
  fraFormato.FieldDesc      := 'tc_nombre';
  fraFormato.FieldBaja      := 'tc_fechabaja';
  fraFormato.TableName      := 'comunes.ctc_textocarta';
  fraFormato.FieldID        := 'tc_id';
  fraFormato.ExtraCondition := ' AND tc_ratificacion = ''S'' AND tc_destinatario = ''1'' ';  //dest 1 -> empresa
  fraFormato.ExtraFields    := ', tc_exigecitacion ';

  fraFirma.Sql := 'SELECT fi_id id, fi_firmante descripcion, fi_caracter caracter, fi_fechabaja baja, fi_id codigo ' +
                                 ' FROM cfi_firma, cfa_firmantearea, cat_areatexto ' +
                                ' WHERE fi_id = fa_idfirmante ' +
                                  ' AND fa_idareatexto = at_id ' +
                                  ' AND fa_fechabaja IS NULL ' +
                                  ' AND at_fechabaja IS NULL ' +
                                  ' AND at_area = ' + AREA_MED +
                                  ' AND at_modulo = ' + MODULO_ESTCTACARTACMORATEMPR;

  frafirma.FieldCodigo      := 'FI_ID';
  fraFirma.FieldDesc        := 'FI_FIRMANTE';
  frafirma.FieldBaja        := 'FI_FECHABAJA';
  frafirma.TableName        := 'CFI_FIRMA';
  frafirma.FieldID          := 'FI_ID';
  fraFirma.CaseSensitive := False;

  //frafirma.ExtraCondition   := ' AND SUBSTR(DF_ESPECIAL,6,1) = ''S'' ';

  iopcion := 1;
  ShowActived := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmprincipal.mnuRatifAlta.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  sindde.Clear;
  sinhta.clear;
  fecdde.Clear;
  fechta.Clear;
  fradelegacion.Clear;
  fraGrupoTrabajo.Clear;
  chkcartasgen.Checked  := False;
  chkCartasImpr.Checked := False;
  chkReca.Checked       := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmRatificaAlta.CmbFormatoExit(Sender: TObject);
begin
  if (fraFormato.sdqDatos.FieldByName('tc_exigecitacion').AsString <> 'S') then
  begin
     cmbcitac.Clear;
     cmbcitac.Enabled := false;
  end else
     cmbcitac.Enabled := true;
end; }
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmRatificaAlta.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;{
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.ClearControls;
begin
  edCUIL.Clear;
  edCUIT.Clear;
  edSiniestro.Clear;
  fraFormato.Clear;
  fraFirma.edCodigo.Text := '';
  //fraFirma.ed
  Cmbcitac.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.LoadControls;
begin
  //if iopcion < 3 then begin

  edCuit.text                   := sdqconsulta.fieldbyname('CUIT').asstring;
  edCuil.text                   := sdqconsulta.fieldbyname('CUIL').asstring;

  edSiniestro.SetValues(sdqconsulta.fieldbyname('EX_SINIESTRO').AsString, sdqconsulta.fieldbyname('EX_ORDEN').AsString,
                        sdqconsulta.fieldbyname('EX_RECAIDA').AsString);
  fraFormato.Clear;
  fraFirma.edCodigo.Text        := '';
  fraFirma.cmbDescripcion.Text  := '';
  Cmbcitac.Clear;
  Cmbcitac.MaxDate := DBDateTime;
    //if iopcion=1 then
    //begin
      //fpabm.tag:=1;
      {sdqFormato.SQL.Text := ' SELECT tt_formato formato, tt_descripcion descrip,tt_formatoempresa, ''1'' opcion, tt_adicional adi ' +
                               ' FROM art.ctt_textoscartasdoctrab ' +
                              ' WHERE tt_formato LIKE ''CA%'' UNION SELECT dt_formato formato, dt_descripcion descrip, null, ''2'' opcion, '+
                             ' dt_adicional adi FROM art.cdt_textoscartasdoc WHERE dt_formato LIKE ''CA%'' AND dt_soloempresa = ''S''';  }
      //firma_anterior   := '';
      //formato_anterior := '';
    //end
    //else begin
      //fpabm.tag := 2;
      {if sdqconsulta.fieldbyname('EX_CUIT').IsNull then
        sdqFormato.SQL.Text := ' SELECT tt_formato formato, tt_descripcion descrip, tt_formatoempresa, ''1'' opcion, tt_adicional adi ' +
                                 ' FROM art.ctt_textoscartasdoctrab '+
                                ' WHERE tt_formato LIKE ''CA%'''
      else
        sdqFormato.SQL.Text := ' SELECT dt_formato formato, dt_descripcion descrip,null tt_formatoempresa, ''2'' opcion, dt_adicional adi ' +
                                 ' FROM art.cdt_textoscartasdoc ' +
                                ' WHERE dt_formato LIKE ''CA%''' +
                                  ' AND dt_soloempresa = ''S''' ; }
      //firma_anterior:=sdqconsulta.fieldbyname('CODFIRMA').AsString;
      //formato_anterior:=sdqconsulta.fieldbyname('CODFORMATO').AsString;
    //end;

    //sdqFirma.Open;
    //sdqFormato.Open;

    {if firma_anterior <> '' then
       frafirma.Value := firma_anterior;

    if formato_anterior <> '' then
       cmbFormato.FieldValue := formato_anterior;

    if not sdqconsulta.fieldbyname('CITACION').isnull  then
       cmbcitac.Text := sdqconsulta.fieldbyname('CITACION').AsString;

  end; }
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRatificaAlta.Validar: Boolean;
begin
  Result := False;
  Verificar(fraFormato.IsEmpty, fraFormato, 'Debe especificar un formato');
  if (fraFormato.sdqDatos.FieldByName('tc_exigecitacion').AsString = 'S') and (Cmbcitac.IsEmpty) then
     InvalidMsg(Cmbcitac , 'Debe especificar una fecha de citación')
  else if FraFirma.IsEmpty then
     InvalidMsg(FraFirma.edCodigo , 'Debe especificar el firmante')
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRatificaAlta.DoABM: Boolean;
begin
  try
    if ValidarEmpresaConfidencial(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, AREA_MED) then
    begin                      {ticket 19701, no se generan cartas a empresas ó trabajadores de empresas confidenciales}
      DoInsertarCarta(StrToInt(fraFormato.ID), edSiniestro.Siniestro , edSiniestro.Orden, edSiniestro.Recaida, fraFirma.Codigo,
                      AREA_MED, True, ART_EMPTY_ID, tdEmpresa, '', 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, '', Cmbcitac.Date);
      Result := True;
    end
    else
      Result := false;

  except
    on E: Exception do
    begin
       ErrorMsg(E);
       Result := False;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmRatificaAlta.Imprimir(AReimpresion: Boolean);
var
  rptCartaDocumento: TrptCartDocumento;
  Errores: TStringList;
  sSql, sLugar, sTextoCarta: string;
  iRow: Integer;
  bIsGobernacion :Boolean;
begin
  if Grid.SelectedRows.Count = 0 then
    MsgBox('Debe seleccionar al menos una fila para imprimir la carta', MB_ICONEXCLAMATION)
  else
  begin
    MsgBox('Coloque formularios de carta documento en la impresora.', MB_ICONINFORMATION);

    rptCartaDocumento := TrptCartDocumento.Create(Self);
    try
      rptCartaDocumento.PrinterSettings.Copies := 3;
      rptCartaDocumento.Tag := 0;
      rptCartaDocumento.PrinterSetup;
      if rptCartaDocumento.Tag = 0 Then
      begin
        Errores := TStringList.Create;
        Try
          for iRow :=0 to Grid.SelectedRows.Count-1 do
          begin
            sdqconsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iRow]));
            bIsGobernacion := Is_SiniestroGobernacion(sdqConsulta.FieldByName('PE_SINIESTRO').AsInteger);
            rptCartaDocumento.Remite_Provincia_ART(bIsGobernacion);
            sSql := 'SELECT 1 FROM DUAL WHERE isdatosvalidosdirtrabajador(' + SqlValue(sdqconsulta.Fieldbyname('do_cuil').AsString) + ') <> ''S''';
            if Is_EmpresaConfidencial(sdqConsulta.FieldByName('cuit').AsString) then
              Errores.Add(sdqConsulta.FieldByName('cuit').AsString + ' - La empresa es confidencial')
            else if (not sdqconsulta.Fieldbyname('do_cuil').IsNull) AND ExisteSql(sSql) Then
              Errores.Add(sdqconsulta.Fieldbyname('do_cuil').AsString + ' - El domicilio del trabajador ' + sdqconsulta.Fieldbyname('paciente').AsString + ' esta incompleto o es inválido')
            else if sdqconsulta.Fieldbyname('Firma').IsNull then
              Errores.Add(sdqconsulta.Fieldbyname('DO_CUIL').AsString + ' - La firma está incompleta o es inválida')

            else begin
              BeginTrans;
              try
                if AReimpresion Then
                  sSql := 'UPDATE cdo_cartasdocumento ' +
      	                    ' SET do_usureimpresion = ' + SqlValue(Sesion.UserID) + ', ' +
                                ' do_fechareimpresion = ACTUALDATE ' +
                          ' WHERE do_siniestro = ' + SqlInt(sdqConsulta.FieldByName('PE_SINIESTRO').AsInteger) +
                            ' AND do_orden = ' + SqlInt(sdqconsulta.fieldbyname('PE_ORDEN').AsInteger) +
                            ' AND do_recaida = ' + SqlInt(sdqconsulta.fieldbyname('PE_RECAIDA').AsInteger)
                else
                  sSql := 'UPDATE cdo_cartasdocumento ' +
                            ' SET do_nrocartadoc = ''377930'' || art.nrocartadoc_medica.nextval, ' +
                                ' do_usuimpresion = ' + SqlValue(Sesion.UserID) + ', ' +
                                ' do_fechaimpresion = ACTUALDATE ' +
                          ' WHERE do_formato LIKE ''CA%'' ' +
                            ' AND do_siniestro = ' + SqlInt(sdqConsulta.FieldByName('PE_SINIESTRO').AsInteger) +
                            ' AND do_orden = ' + SqlInt(sdqconsulta.fieldbyname('PE_ORDEN').AsInteger) +
                            ' AND do_recaida = ' + SqlInt(sdqconsulta.fieldbyname('PE_RECAIDA').AsInteger);

                EjecutarSqlST(sSql);


                { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
               { ******if not AReimpresion Then    //trigger en la spe cuando se imprime
                begin
                  sSql := 'UPDATE sin.spe_partedeegreso ' +
                            ' SET pe_observaciones=pe_observaciones || '' - Alta ratificada por C.D.'' ' +
                          ' WHERE pe_idexpediente = SINIESTRO.GET_IDEXPEDIENTE(:SINIESTRO, :ORDEN, :RECAIDA)';
                  EjecutarSqlSTEx(sSql, [sdqconsulta.fieldbyname('PE_SINIESTRO').AsInteger, sdqconsulta.fieldbyname('PE_ORDEN').AsInteger, sdqconsulta.fieldbyname('PE_RECAIDA').AsInteger]);
                end;******** }


                
                { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
                {sSql := 'AND do_siniestro = ' + SqlInt(sdqconsulta.fieldbyname('PE_SINIESTRO').AsInteger) +
                        'AND do_orden =  ' + SqlInt(sdqconsulta.fieldbyname('PE_ORDEN').AsInteger) +
                        'AND do_recaida = ' + SqlInt(sdqconsulta.fieldbyname('PE_RECAIDA').AsInteger) + ' ';

                sSql := 'SELECT ex_altamedica, tj_nombre dest_nombre, ' +
                              ' art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, null) dest_domicilio,' +
                              ' tj_localidad dest_localidad, tj_cpostal dest_cpostal, pv_descripcion dest_provincia, ' +
                              ' art.armar_siniestro(do_siniestro, do_orden, do_recaida) siniestro, ' +
                              ' mp_nombre, tj_nombre, tj_documento, nvl(ex_fecharecaida, ex_fechaaccidente) fecharecaida, ' +
                              ' ex_altamedica, tt_texto texto, do_nrocartadoc, do_codfirma, do_param6, ' +
                              ' inca.get_comisiontrabajador(ex_cuil) comision ' +
                         ' FROM mgp_gtrabajo, cpv_provincias, sex_expedientes, ctj_trabajadores, cmp_empresas, ' +
                              ' ctt_textoscartasdoctrab, cdo_cartasdocumento ' +
                        ' WHERE do_formato = tt_formato ' +
                           ' AND ex_siniestro = do_siniestro ' +
                           ' AND ex_orden = do_orden ' +
                           ' AND ex_recaida = do_recaida ' +
                           ' AND do_formato LIKE ''CA%''' +
                           ' AND do_cuil IS NOT NULL ' +
                           ' AND ex_cuil = tj_cuil ' +
                           ' AND ex_cuit = mp_cuit ' +
                           ' AND tj_provincia = pv_codigo ' +
                           ' AND ex_gtrabajo = gp_codigo ' +
                           ' AND afiliacion.isempresaconfidencial(ex_cuit)=''N'' ' +   { by NWK, 01/04/03 }
                          { ' AND (do_param6 = TO_DATE('''  + sdqconsulta.fieldbyname('CITACION').AsString + ''',''DD/MM/YYYY'') OR do_param6 IS NULL) ' +

                    sSql +
                     'UNION ALL ' +
                   ' SELECT ex_altamedica, mp_nombre dest_nombre, ' +
                          ' art.utiles.armar_domicilio(mp_calle_post, mp_numero_post, mp_piso_post, mp_departamento_post, null) dest_domicilio,' +
                          ' mp_localidad_post dest_localidad, mp_cpostal_post dest_cpostal, pv_descripcion dest_provincia, ' +
                          ' art.armar_siniestro(do_siniestro, do_orden, do_recaida) siniestro, ' +
                          ' mp_nombre, tj_nombre, tj_documento, nvl(ex_fecharecaida, ex_fechaaccidente) fecharecaida, ' +
                          ' ex_altamedica, dt_texto texto, do_nrocartadoc, do_codfirma, do_param6, ' +
                          ' inca.get_comisiontrabajador(ex_cuil) comision ' +
                     ' FROM mgp_gtrabajo, cpv_provincias, sex_expedientes, ctj_trabajadores, cmp_empresas, ' +
                          ' cdt_textoscartasdoc, cdo_cartasdocumento ' +
                    ' WHERE do_formato LIKE ''CA%'' ' +
                      ' AND do_formato = dt_formato ' +
                      ' AND ex_siniestro = do_siniestro ' +
                      ' AND ex_orden = do_orden ' +
                      ' AND ex_recaida = do_recaida ' +
                      ' AND ex_cuil = tj_cuil ' +
                      ' AND ex_cuit = mp_cuit ' +
                      ' AND mp_provincia_post = pv_codigo ' +
                      ' AND ex_gtrabajo = gp_codigo ' +
                      ' AND (do_param6 = TO_DATE('''  + sdqconsulta.fieldbyname('CITACION').AsString + ''',''DD/MM/YYYY'') OR do_param6 IS NULL) ' +

                    sSql +
                     'UNION ALL ' + { si el trabajador pertenece a una empresa confidencial, se toma como dirección la de la empresa, by NWK, 01/04/03 }
                   {' SELECT ex_altamedica, mp_nombre dest_nombre, ' +
                          ' art.utiles.armar_domicilio(mp_calle, mp_numero, mp_piso, mp_departamento, null) dest_domicilio,' +
                          ' mp_localidad dest_localidad, mp_cpostal dest_cpostal, pv_descripcion dest_provincia, ' +
                          ' art.armar_siniestro(do_siniestro, do_orden, do_recaida) siniestro, ' +
                          ' mp_nombre, tj_nombre, tj_documento, nvl(ex_fecharecaida, ex_fechaaccidente) fecharecaida, ' +
                          ' ex_altamedica, tt_texto texto, do_nrocartadoc, do_codfirma, do_param6, ' +
                          ' inca.get_comisiontrabajador(ex_cuil) comision ' +
                     ' FROM mgp_gtrabajo, cpv_provincias, sex_expedientes, ctj_trabajadores, ' +
                          ' cmp_empresas, ctt_textoscartasdoctrab, cdo_cartasdocumento ' +
                    ' WHERE do_formato = tt_formato ' +
                      ' AND ex_siniestro = do_siniestro ' +
                      ' AND ex_orden = do_orden ' +
                      ' AND ex_recaida = do_recaida ' +
                      ' AND do_formato LIKE ''CA%'' ' +
                      ' AND do_cuil IS NOT NULL ' +
                      ' AND ex_cuil = tj_cuil ' +
                      ' AND ex_cuit = mp_cuit ' +
                      ' AND mp_provincia = pv_codigo ' +
                      ' AND ex_gtrabajo = gp_codigo ' +
                      ' AND afiliacion.isempresaconfidencial(ex_cuit)=''S'' ' +
                      ' AND (do_param6 = TO_DATE('''  + sdqconsulta.fieldbyname('CITACION').AsString + ''',''DD/MM/YYYY'') OR do_param6 IS NULL) ' +

                        sSql;
                { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }

                {sLugar := InitCap(rptCartaDocumento.qrlRemLocalidad.Caption);
                if sLugar = 'Capital Federal' Then
                  sLugar := 'Buenos Aires';

                with GetQuery(sSql) do
                  try
                    while not EOF do
                    begin
                      rptCartaDocumento.qrlExtraInfo.Caption     := FieldByName('SINIESTRO').AsString + ' - ' +
                                                                    sdqconsulta.FieldByName('GRUPO').AsSTring +
                                                                    IIF(sdqConsulta.FieldByName('USUGESTOR').IsNull, '', ' - ' +
                                                                        sdqConsulta.FieldByName('USUGESTOR').AsString);
                      rptCartaDocumento.qrlNumero.Caption        := FieldByName('DO_NROCARTADOC').AsString;
                      rptCartaDocumento.qrlDestNombre.Caption    := FieldByName('DEST_NOMBRE').AsString;
                      rptCartaDocumento.qrlDestDomicilio.Caption := FieldByName('DEST_DOMICILIO').AsString;
                      rptCartaDocumento.qrlDestProvincia.Caption := FieldByName('DEST_PROVINCIA').AsString;
                      rptCartaDocumento.qrlDestLocalidad.Caption := FieldByName('DEST_LOCALIDAD').AsString;
                      rptCartaDocumento.qrlDestCPostal.Caption   := FieldByName('DEST_CPOSTAL').AsString;
                      rptCartaDocumento.ReplicarTodo;

                      rptCartaDocumento.IdFirmante := FieldByName('DO_CODFIRMA').AsInteger;

                      rptCartaDocumento.qrrTexto.Lines.Clear;
                      rptCartaDocumento.qrrTexto.Lines.Add(sLugar + ', ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy'));
                      rptCartaDocumento.qrrTexto.Lines.Add('');
                      rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'Nº de Orden:'      + FieldByName('SINIESTRO').AsString);
                      if bIsGobernacion then
                        rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'Dependencia GPBA:' + InitCap(FieldByName('MP_NOMBRE').AsString))
                      else
                        rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'Empresa:'          + InitCap(FieldByName('MP_NOMBRE').AsString));
                      rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'Trabajador:'       + InitCap(FieldByName('TJ_NOMBRE').AsString));
                      rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'DNI:'              + FieldByName('TJ_DOCUMENTO').AsString);
                      rptCartaDocumento.qrrTexto.Lines.Add( #9 + 'Fecha Infortunio:' + FieldByName('FECHARECAIDA').AsString);
                      rptCartaDocumento.qrrTexto.Lines.Add('');

                      sTextoCarta := FieldByName('TEXTO').AsString;
                      sTextoCarta := StringReplace(sTextoCarta, '@altamedica', FieldByName('EX_ALTAMEDICA').AsString, [rfReplaceAll, rfIgnoreCase]);
                      sTextoCarta := StringReplace(sTextoCarta, '@citacion',   FieldByName('DO_PARAM6').AsString,     [rfReplaceAll, rfIgnoreCase]);
                      sTextoCarta := StringReplace(sTextoCarta, '@facci',      FieldByName('FECHARECAIDA').AsString,  [rfReplaceAll, rfIgnoreCase]);
                      sTextoCarta := StringReplace(sTextoCarta, '@comi',       FieldByName('COMISION').AsString,      [rfReplaceAll, rfIgnoreCase]);

                      rptCartaDocumento.qrrTexto.Font.Size := 9;
                      rptCartaDocumento.qrrTexto.Lines.Add(sTextoCarta);

                      rptCartaDocumento.qrlExtraInfoFooter.Caption := sdqconsulta.FieldByName('GRUPO').AsSTring;
                      rptCartaDocumento.Print;
                      Next;
                    end;

                  finally
                    Free;
                  end;
                CommitTrans;
              except
                RollBack;
                raise;
              end;
            end; {if}
          {end;{for}
          {if Errores.Count <> 0 Then
            InputMemoBox('Hubo errores durante la impresión', Errores, True);
        finally
          Errores.Free;
        end;
        tbRefrescarClick(nil);
      end; {if}
    {finally
      Printers.Printer.Copies := 1;      
      rptCartaDocumento.Free;
    end;
  end;
end;}
{----------------------------------------------------------------------------------------------------------------------}
{procedure TfrmRatificaAlta.mnuImprimirReimprimirClick(Sender: TObject);
var
  vRespuesta :TModalResult;
begin
  if (IOpcion = 3) then
  begin
    vRespuesta := (MessageDlg('¿Confirma la Fecha de Citación: "' + sdqConsulta.fieldbyname('CITACION').AsString + '", ' +
                              'el Firmante: "' + sdqconsulta.fieldbyname('FIRMA').AsString + '"' + #13 + #10 +
                              ' y el formato "' +  sdqconsulta.fieldbyname('FORMATO').AsString + '" para la carta seleccionada?', mtConfirmation, [mbYes, mbNo, mbCancel], 0));
    if (vRespuesta = mrNo) then
    begin
      IOpcion := 1;
      LoadControls;
      if (fpAbm.ShowModal = mrOk) then
        MsgBox('Se ha generado una nueva Carta Documento para el siniestro seleccionado');
      IOpcion := 3;
    end
    else if (vRespuesta = mrYes) then
      Imprimir(Sender = mnuReimprimir);
  end else
    Imprimir(Sender = mnuReimprimir);
end; }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRatificaAlta.fraFormatoExit(Sender: TObject);
begin
  inherited;
  fraFormato.FrameExit(Sender);
  if not fraFormato.IsEmpty then
    if (fraFormato.sdqDatos.FieldByName('tc_exigecitacion').AsString <> 'S') then
    begin
      cmbcitac.Clear;
      cmbcitac.Enabled := false;
    end else
      cmbcitac.Enabled := true;

end;

end.
