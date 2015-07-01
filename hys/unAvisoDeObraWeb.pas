unit unAvisoDeObraWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, RxRichEd, unFraToolbarRTF,
  FormPanel, RxToolEdit, RxPlacemnt, unFraCodigoDescripcion;

type
  TfrmAvisoDeObraWeb = class(TfrmCustomConsulta)
    fraEmpresaFiltro: TfraEmpresa;
    Label1: TLabel;
    cbPendienteFiltro: TCheckBox;
    cbProcesadoFiltro: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    edFechaAltaDesde: TDateComboBox;
    Label4: TLabel;
    edFechaAltaHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    btnProcesar: TToolButton;
    cbRechazado: TCheckBox;
    tbRechazo: TToolButton;
    fpMotivoRechazo: TFormPanel;
    Bevel5: TBevel;
    Label49: TLabel;
    btnAceptarCambioTipoPrev: TButton;
    btnCancelarCambioTipoPrev: TButton;
    fraMotivoRechazo: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRechazoClick(Sender: TObject);
    procedure btnAceptarCambioTipoPrevClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure Procesar319;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoDeObraWeb: TfrmAvisoDeObraWeb;

implementation

{$R *.dfm}
uses
  AnsiSql, unFrmObras, VclExtra, CustomDlgs,  unDmPrincipal, unFet,unSesion, General, unMoldeEnvioMail;

procedure TfrmAvisoDeObraWeb.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  cbPendienteFiltro.Checked := False;
  cbProcesadoFiltro.Checked := False;
  cbRechazado.Checked       := False;
  inherited;

end;

procedure TfrmAvisoDeObraWeb.tbRechazoClick(Sender: TObject);
var
  sEmpresa, sContrato, sCuit, sDescCiuu, sTipoObra,sDomicilio, sMailResp, sMailContacto :String;
begin
  Verificar(sdqconsulta.FieldByName('aw_estado').AsString <> 'P',tbRechazo,'Debe estar en estado pendiente el aviso de obra web.');
  if fpMotivoRechazo.ShowModal = mrOk then
  begin
    with GetQuery(
      'SELECT em_nombre, co_contrato, em_cuit, '''' ac_descripcion, '+
      '       DECODE(aw_tipo, '+
      '              ''AO'', ''Obra'', '+
      '              ''E'', ''Extensión'', '+
      '              ''S'', ''Suspensión'', '+
      '              ''SD'', ''Suspensión Definitiva'', '+
      '              ''M'', ''Modificación Aviso de Obra'') aw_tipo, '+
      '      art.utiles.armar_domicilio(aw_calle, aw_numero, '''', '''', '+
      '                            art.utiles.armar_localidad(aw_cpostal, '''', aw_localidad, aw_provincia), '''') domic, aw_emailresp, '+
      '       (SELECT cw_direlectronica '+
      '          FROM hys.hcw_contactoobraweb '+
      '         WHERE cw_id = aw_contactoaoweb) mailcontacto '+
      '  FROM afi.aco_contrato, afi.aem_empresa, hys.haw_avisoobraweb '+
      ' WHERE aw_id = '+sqlvalue(sdqconsulta.FieldByName('aw_id').AsString)+
      '   AND aw_contrato = co_contrato '+
      '   AND co_idempresa = em_id ') do
    try
      sEmpresa      := FieldByName('em_nombre').AsString;
      sContrato     := FieldByName('co_contrato').AsString;
      sCuit         := FieldByName('em_cuit').AsString;
      sDescCiuu     := FieldByName('ac_descripcion').AsString;
      sTipoObra     := FieldByName('aw_tipo').AsString;
      sDomicilio    := FieldByName('domic').AsString;
      sMailResp     := FieldByName('aw_emailresp').AsString;
      sMailContacto := FieldByName('mailcontacto').AsString;
    finally
      Free;
    end;
    with TfrmMoldeEnvioMail.Create(Self) do
    begin
      FormStyle := fsNormal;
      Visible := False;
      Opciones := [oAlwaysShowDialog];
      if sMailResp <> '' then
      begin
        edDestinatario.Text := sMailResp;
        btAgregarDestinatarioClick(nil);
      end;
      if sMailContacto <> '' then
      begin
        edDestinatario.Text := sMailContacto;
        btAgregarDestinatarioClick(nil);
      end;
      edAsunto.Text := 'Aviso de Obra No Recepcionado';
      if sdqConsulta.FieldByName('aw_tipoform').AsInteger = 0 then
      begin
        reTextoCuerpo.Lines.Add(
          '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
          '\viewkind4\uc1\pard\lang11274\b\f0\fs20Sres. '+sEmpresa+'\par '+
          '\fs20 Contrato: '+sContrato+'  \tab\tab\tab CUIT: '+sCuit+'\b0\par '+
          'CIUU \par '+
          'Ref : Aviso de Obra Res. 319/99 No Recepcionado.\par '+
          '\par '+
          'De nuestra consideraci\''f3n:\par '+
          '\par '+
          'Por el presente le informamos que el \b Aviso de Obra\b0  NO HA SIDO RECEPCIONADO oportunamente, para la direcci\''f3n de \b '+sDomicilio+'\b0 .\par '+
          '\par '+
          'Tenga en cuenta que Seg\''fan Res. SRT 319/199, Anexo II \lang1033\f1\endash\lang11274\f0  3) La ART correspondiente recibir\''e1 y aprobar\''e1 los programas de '+
          'seguridad conforme a lo establecido en la Resoluci\''f3n SRT N\lang1033\f1\''b0\lang11274\f0  51/97, con la salvedad de que dicha aprobaci\''f3n para el caso de los '+
          'trabajos repetitivos y corta duraci\''f3n, tendr\''e1 una validez de seis (6) meses, pudiendo extender la vigencia de la validez por un nuevo periodo de la '+
          'misma duraci\''f3n, previa solicitud y actualizaci\''f3n del empleador.\par '+
          '\par '+
          'Le pedimos que por favor revea la informaci\''f3n suministrada a fin de poder verificar los datos faltantes y hacer efectiva la recepci\''f3n del formulario. '+
          'Puede verificar detalles de su presentaci\''f3n ingresando en la p\''e1gina de Provincia ART.\par '+
          '\par '+
          '\b Atte. \par '+
          'Gerencia Prevenci\''f3n\cf1\b0\f1\par '+
          '\cf0\i0\f2\fs22\par '+
          '\par }');
      end
      else
      begin
        reTextoCuerpo.Lines.Add(
          '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
          '\viewkind4\uc1\pard\lang11274\b\f0\fs20Sres. '+sEmpresa+'\par '+
          '\fs20 Contrato: '+sContrato+'  \tab\tab\tab CUIT: '+sCuit+'\b0\par '+
          'CIUU \b'+sDescCiuu+'\b0\par '+
          'Ref : Aviso de Obra No Recepcionado.\par\par '+
          'De nuestra consideraci\''f3n:\par\par '+
          'Por el presente le informamos que el \b Aviso de '+sTipoObra+'\b0  NO HA SIDO RECEPCIONADO oportunamente, '+          'para la dirección de \b '+sDomicilio+'\b0 .\par\par '+
          'Le pedimos que por favor revea la información suministrada a fin de poder verificar los datos faltantes y hacer efectiva la recepción del formulario. '+          'Puede verificar detalles de su presentación ingresando en la página de Provincia ART.\par\par '+          '\b Atte. \par '+
          'Gerencia Prevención \b0} ');
      end;

      if ShowModal = mrOk then
      begin
        EjecutarSql('UPDATE hys.haw_avisoobraweb '+
                    '   SET aw_estado = ''R'', '+
                    '       aw_usumodif = '+SqlValue(Sesion.UserID)+', '+
                    '       AW_IDMOTIVORECHAZADO = '+SqlValue(fraMotivoRechazo.Value)+', '+
                    '       aw_fechamodif = SYSDATE '+
                    ' WHERE aw_id = '+SqlValue(sdqconsulta.FieldByName('aw_id').AsInteger));
        MsgBox('El aviso de obra web se ha marcado como Rechazado.', MB_OK , 'Aviso de obra Web');
      end;
    end;
  end;
end;

procedure TfrmAvisoDeObraWeb.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere, sWhereEstado : String;
begin
  sWhere := '';
  sWhereEstado := '';
  sSql := 'SELECT co_contrato, em_cuit, em_nombre, aw_estableci, aw_fechainicio, '+
          '       aw_fechafindeobra, aw_fechaextension, aw_fechasuspension, '+
          '       aw_fechareinicio, aw_fechaexcavacion, aw_fechaexcavacionhasta, aw_fechademolicion, aw_fechademolicionhasta, '+
          '       aw_superficie, aw_plantas, aw_calle, aw_numero, aw_localidad, aw_provincia, aw_cpostal, aw_cpa, aw_descripcionobra, '+
          '       or_descripcion resolucion, '+
          '       DECODE(aw_tipo, '+
          '              ''AO'', ''Aviso de Obra'', '+
          '              ''E'', ''Extensión'', '+
          '              ''S'', ''Suspensión'', '+
          '              ''SD'', ''Suspensión Definitiva'', '+
          '              ''R'', ''Reinicio'', '+
          '              ''M'', ''Modificación'') aw_tipo, '+
          '       aw_fechadesdeexcavacion503, aw_fechahastaexcavacion503, aw_detalleexcavacion503, aw_id, aw_arquitectura, '+
          '       aw_ingenieriacivil, aw_montajeindustrial, aw_ductos, aw_redes, aw_otras, aw_actividad, aw_contactoaoweb, '+
          '       aw_submuraciones, aw_subsuelos, aw_total, aw_parcial, aw_actividadotros, aw_fechaalta, aw_usualta, aw_fechamodif, '+
          '       aw_usumodif, aw_fechabaja, aw_usubaja, aw_comitente, aw_cuitcomitente, aw_razonsocialcomitente, aw_contratista, '+
          '       aw_cuitcontratista, aw_razonsocialcontratista, aw_subcontratista, aw_cuitsubcontratista, aw_razonsocialsubcontratista, '+
          '       aw_idavisoobra, aw_nombreresp, aw_apellidoresp, aw_codarearesp, aw_telefonoresp, aw_tipotelefonoresp, aw_emailresp, '+
          '       aw_tipodocumentoresp, aw_numerodocumentoresp, aw_sexoresp, aw_resolucion, aw_idestab319, aw_excavacion503, aw_estado,AW_TIPOFORM, '+
          '       DECODE(aw_estado,''P'',''Pendiente'',''R'',''Rechazado'', ''T'',''Terminado'') estado, '+
          '       (SELECT pv_descripcion FROM art.cpv_provincias WHERE pv_codigo = aw_provincia) provincia, (SELECT am_descripcion '+
          '       FROM hys.ham_avisoobramotivorechazo  WHERE am_id = aw_idmotivorechazado) motrechazo, '+
          '       NVL2(art.hys.get_idprogramaseguridad(em_cuit, (SELECT es_nroestableci FROM afi.aes_establecimiento '+
          '       WHERE es_id = aw_idestab319)), ''S'', ''N'') tieneprogseg, aw_estado '+
          '  FROM hys.haw_avisoobraweb a, afi.aco_contrato, afi.aem_empresa, hys.hor_obrasresolucion '+
          ' WHERE aw_contrato = co_contrato '+
          '   AND co_idempresa = em_id '+
          '   AND aw_resolucion = or_id(+)'+
          '   AND aw_fechabaja IS NULL';

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);

  if edFechaAltaDesde.Date > 0 then
    sWhere := sWhere + ' AND aw_fechaalta >= '+SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date > 0 then
    sWhere := sWhere + ' AND aw_fechaalta <= '+SqlValue(edFechaAltaHasta.Date);

  if cbPendienteFiltro.Checked or cbProcesadoFiltro.Checked or cbRechazado.Checked then
  begin
    if cbPendienteFiltro.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR aw_estado = ''P'' '
      else
        sWhereEstado := sWhereEstado + ' aw_estado = ''P'' ';
    end;

    if cbProcesadoFiltro.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR aw_estado = ''T'' '
      else
        sWhereEstado := sWhereEstado + ' aw_estado = ''T'' ';
    end;

    if cbRechazado.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR aw_estado = ''R'' '
      else
        sWhereEstado := sWhereEstado + ' aw_estado = ''R'' ';
    end;
    sWhere := sWhere +' AND ('+sWhereEstado+') ';
  end;

  sdqConsulta.SQL.Text := sSQL+sWhere;

  inherited;

end;

procedure TfrmAvisoDeObraWeb.btnAceptarCambioTipoPrevClick(Sender: TObject);
begin
  Verificar(not fraMotivoRechazo.IsSelected, fraMotivoRechazo, 'Debe seleccionar el motivo de rechazo.');
  fpMotivoRechazo.ModalResult := mrOk;
end;

procedure TfrmAvisoDeObraWeb.btnProcesarClick(Sender: TObject);
var
  sCuit : String;
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    Verificar(sdqConsulta.FieldByName('aw_estado').AsString <> 'P', Grid,'Debe ser pendiente el aviso de obra.');
    if sdqConsulta.FieldByName('aw_tipoform').AsInteger = 0 then
    begin
      Procesar319;
    end
    else
    begin
      with TfrmObras.Create(Self) do
      try
        Caption := 'Aviso de Obra - '+sdqConsulta.FieldByName( 'co_contrato' ).AsString+' - '+sdqConsulta.FieldByName( 'em_nombre' ).AsString+
                    IIF(not sdqConsulta.FieldByName( 'AW_ESTABLECI' ).IsNull,' - '+sdqConsulta.FieldbyName('AW_ESTABLECI').AsString,'');
        tsProgramaDeSeg.TabVisible :=False;
        tsDomicilio319.TabVisible :=False;
        tsRechazo.TabVisible :=False;
        ToolBar1.Visible := False;
        ToolBar5.Visible := False;
        ToolBar7.Visible := False;
        btnAnexo2Copiar.Visible := False;
        ScrollBox.VertScrollBar.Position := 0;
        FContrato := sdqConsulta.FieldByName( 'co_contrato' ).AsInteger;
        sCuit := ValorSql('SELECT em_cuit FROM afi.aem_empresa, afi.aco_contrato '+
                          ' WHERE em_id = co_idempresa and co_contrato = '+SqlValue(sdqConsulta.FieldByName( 'co_contrato' ).AsInteger));
        CargarAvisodeObraWeb(sdqConsulta.FieldByName('aw_id').AsInteger, sCuit, sdqConsulta.FieldbyName('AW_ESTABLECI').AsInteger, '','');
        vclExtra.LockControls(ScrollBox,True);
        ScrollBox.Enabled := True;
        FIDAOWeb := sdqConsulta.FieldByName('aw_id').AsInteger;
        pnlboton.Visible := True;
        BorderStyle := bsSizeable;
        ShowModal;
      finally
        Free;
      end;
    end;
    tbRefrescar.Click;
  end;
end;

procedure TfrmAvisoDeObraWeb.GridDblClick(Sender: TObject);
begin
  btnProcesar.Click;
end;

procedure TfrmAvisoDeObraWeb.Procesar319;
var
  idProgramaSeguridad : integer;
  nroestableci : Integer;
begin
  nroestableci := ValorSql('SELECT ES_NROESTABLECI FROM afi.aes_establecimiento WHERE ES_ID = '+SqlValue(sdqConsulta.FieldByName('AW_IDESTAB319').AsInteger));
  idProgramaSeguridad := ValorSqlInteger(
         'SELECT ps_id '+
         '  FROM hys.hps_programaseguridad '+
         ' WHERE ps_cuit = '+SqlValue(self.sdqConsulta.FieldByName('em_cuit').AsString)+
         '   AND ps_establecimiento = '+sqlvalue(nroestableci)+
         '   and ps_fecharecepcion = (SELECT max(ps_fecharecepcion)'+
         '                              FROM hys.hps_programaseguridad '+
         '                             WHERE ps_cuit = '+SqlValue(self.sdqConsulta.FieldByName('em_cuit').AsString)+
         '                               AND ps_establecimiento = '+SqlValue(nroestableci)+')');
  verificar(idProgramaSeguridad = 0, DBGrid, 'Debe tener programa de seguridad para poder cargarlo. Para poder rechazarlo debe hacerlo desde el boton en la barra.');
  with TfrmFet.Create(Self) do
  try
    FIDAvisoObraWeb := self.sdqConsulta.FieldByName('aw_id').AsInteger;
    fraEmpresa.Contrato := self.sdqConsulta.FieldByName('co_contrato').AsInteger;
    OnEmpresaChange(nil);
    fraEstableciBusq.Cargar(fraEmpresa.CUIT,
                          nroestableci, false);
    OnfraEstableciBusqChange(nil);
    fraTipoFet.Codigo := 'CO';
    OnTipoFetChange(nil);
    SetIs319;
    btnBuscar.Click;

    EjecutarSqlST('INSERT INTO hys.hdo_domicilio319('+
                        'do_id,do_idprogramaseguridad,do_calle,do_numero,do_piso,do_departamento, '+
                        'do_cpostal,do_cpostala,do_localidad,do_provincia,do_fecharecepcion,do_fechainicioobra, '+
                        'do_fechafinobra, DO_OBSERVACIONES,do_usualta,do_fechaalta ) '+
                  'VALUES (HYS.SEQ_HDO_ID.NEXTVAL,'+SqlValue(idProgramaSeguridad)+','+
                     SqlValue(self.sdqConsulta.FieldByName('aw_calle').AsString)+','+SqlValue(self.sdqConsulta.FieldByName('aw_numero').AsString)+','+
                     'NULL,NULL,'+
                     SqlValue(self.sdqConsulta.FieldByName('aw_cpostal').AsString)+','+SqlValue(self.sdqConsulta.FieldByName('aw_cpa').AsString)+','+
                     SqlValue(self.sdqConsulta.FieldByName('aw_localidad').AsString)+','+SqlValue(self.sdqConsulta.FieldByName('aw_provincia').AsString)+','+
                     SqlValue(self.sdqConsulta.FieldByName('aw_fechaalta').AsDateTime)+','+SqlValue(self.sdqConsulta.FieldByName('aw_fechainicio').AsDateTime)+','+
                     SqlValue(self.sdqConsulta.FieldByName('aw_fechafindeobra').AsDateTime)+','+SqlValue(self.sdqConsulta.FieldByName('AW_DESCRIPCIONOBRA').AsString)+','+
                     SqlValue(Sesion.UserID)+',sysdate)'   );

      SetPageDomicilio319;
      ShowModal;
      if FGuardadoAOWeb then
      begin
        EjecutarSql('UPDATE hys.haw_avisoobraweb '+
              '   SET aw_estado = ''T'', '+
              '       aw_usumodif = '+SqlValue(Sesion.UserID)+', '+
              '       aw_fechamodif = SYSDATE '+
              ' WHERE aw_id = '+SqlValue(self.sdqConsulta.FieldByName('aw_id').AsInteger));
        MsgBox('El aviso de obra web se ha marcado como Procesado.', MB_OK , 'Aviso de obra Web');
      end;
  finally
    Free;
  end;

end;


procedure TfrmAvisoDeObraWeb.FormCreate(Sender: TObject);
begin
  inherited;
  with fraMotivoRechazo do
  begin
    TableName := 'HYS.HAM_AVISOOBRAMOTIVORECHAZO';
    FieldDesc := 'AM_DESCRIPCION';
    FieldID := 'AM_ID';
    FieldCodigo := 'AM_ID';
    FieldBaja := 'AM_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  tbRechazo.left := tbNuevo.Left -1;
  btnProcesar.Left :=  tbRechazo.Left-1;
  cbPendienteFiltro.Checked := True;
end;

end.
