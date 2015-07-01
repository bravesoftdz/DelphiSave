unit unRecepPartesGrales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryToFile, ExportDialog, ShortCutControl, SortDlg, QueryPrint,
  artSeguridad, Placemnt, Db, SDEngine, QRCtrls, QuickRpt, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolEdit, StdCtrls, Mask, DateComboBox,
  ComCtrls, ToolWin, ExtCtrls, RXSplit, FieldHider, unReingresoParteMedico, Menus,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unFraCodigoDescripcion, AnsiSql, CustomDlgs,
  JvExComCtrls, JvComCtrls, FormPanel, unSesion, General, CUIT,
  unReingresoParteMedicoEvol;

type
  TfrmRecepcionPartesGrales = class(TForm)
    pnlFilter: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    tbHerramientas: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbOrden: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    tbSalir: TToolButton;
    edFechaDesde: TDateComboBox;
    cmbEstados: TComboBox;
    dbgListado: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsConsulta: TDataSource;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    QueryPrint: TQueryPrint;
    SortDialog: TSortDialog;
    ShortCutControl: TShortCutControl;
    ExportDialog: TExportDialog;
    edFechaHasta: TDateComboBox;
    Label4: TLabel;
    ToolButton1: TToolButton;
    splitterdt: TRxSplitter;
    tbProcesar: TToolButton;
    FieldHiderDatos: TFieldHider;
    PrintDialog: TPrintDialog;
    fraPrestador: TfraCodigoDescripcion;
    Label5: TLabel;
    fraTipoArchivo: TfraCodigoDescripcion;
    tbLimpiar: TToolButton;
    pcDetalles: TJvPageControl;
    tbDetallesParte: TTabSheet;
    DbgDetalleParte: TArtDBGrid;
    dsErrorParte: TDataSource;
    sdqErrorParte: TSDQuery;
    sdqDetallesParte: TSDQuery;
    dsDetalleParte: TDataSource;
    tbDetallesPEV: TTabSheet;
    fpAccion: TFormPanel;
    Bevel4: TBevel;
    Label11: TLabel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    fraAccion: TfraStaticCTB_TABLAS;
    pnlDetalleParte: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    tbRefresh: TToolButton;
    tbLimpiarDetalle: TToolButton;
    ToolButton8: TToolButton;
    tbAccion: TToolButton;
    tbEliminarAccion: TToolButton;
    tbVer: TToolButton;
    fraAccionFiltro: TfraStaticCTB_TABLAS;
    cbEstadoDetalleParte: TComboBox;
    DbgDetalleParteEvolutivo: TArtDBGrid;
    dbgErrorParte: TArtDBGrid;
    RxSplitter2: TRxSplitter;
    sdqDetallesParteEvolutivo: TSDQuery;
    dsDetallesParteEvolutivo: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbProcesarClick(Sender: TObject);
    procedure DbgDetalleParteDblClick(Sender: TObject);
    procedure DbgDetalleParteGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraPrestadorcmbDescripcionDropDown(Sender: TObject);
    procedure FiltrarFrame(Sender: TObject; aframe: TfraCodigoDescripcion);
    procedure OnChangefraTipoArchivo(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure tbAccionClick(Sender: TObject);
    procedure ActualizarAccionPMI;
    Procedure ActualizarAccionPEV;
    procedure ActualizarAccionPME;
    procedure tbRefreshClick(Sender: TObject);
    procedure tbLimpiarDetalleClick(Sender: TObject);
    procedure tbEliminarAccionClick(Sender: TObject);
    procedure tbVerClick(Sender: TObject);
    procedure DbgDetalleParteEvolutivoGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure RefreshParte(aTipoParte: string);
    procedure RefrescarPMI_PME;
    procedure RefrescarPEV;
    procedure DbgDetalleParteEvolutivoDblClick(Sender: TObject);
  private
    FTipoParte: string;
  public
    { Public declarations }
  end;

var
  frmRecepcionPartesGrales: TfrmRecepcionPartesGrales;

implementation

uses unDmPrincipal, unPrincipal;

{$R *.DFM}

procedure TfrmRecepcionPartesGrales.FormCreate(Sender: TObject);
begin
    with fraPrestador do
    begin
      TableName := 'cpr_prestador';
      FieldID := 'ca_identificador';
      FieldCodigo := 'ca_identificador';
      FieldDesc := 'ca_descripcion';
      FieldBaja := 'ca_fechabaja';
      caseSensitive := false;
      ShowBajas := False;
    end;

    with fraTipoArchivo do
    begin
      TableName := ' (SELECT ar_descripcion, ar_id, am_id, am_idtipoarchivo ' +
             'FROM comunes.cam_tipoarchivomensaje, ' +
             'impoexpo.iar_archivo ' +
             'WHERE (cam_tipoarchivomensaje.am_idarchivo = iar_archivo.ar_id and am_idtipoarchivo is not null)) ';
      FieldID := 'am_id';
      FieldCodigo := 'ar_id';
      FieldDesc := 'ar_descripcion';
      OnChange := OnChangefraTipoArchivo;
      ShowBajas := True;
      SelectFirst;
    end;

    fraAccion.Clave := 'ACWEB';

    fraAccionFiltro.Clave := 'ACWEB';
    
end;

procedure TfrmRecepcionPartesGrales.tbRefrescarClick(Sender: TObject);
var
 sql : string;
begin

   sdqDatos.DisableControls;
   sdqDetallesParte.DisableControls;
   sdqErrorParte.DisableControls;
   sdqDetallesParteEvolutivo.DisableControls;
   try
      try
        sdqDatos.close;
        sdqDetallesParte.Close;
        sdqDetallesParteEvolutivo.Close;
        sdqErrorParte.Close;

        sql := 'SELECT iar_archivo.ar_descripcion, cpr_prestador.ca_descripcion, ' +
               ' decode(ccm_contenidomensajerecibido.cm_estado,''P'', ''Procesado'', ''E'', ''Error'' ' +
               '                                              , ''O'', ''Pendiente'', ''N/A'') as cm_estado, '        +
               ' ccm_contenidomensajerecibido.cm_nombrearchivofinal, ccm_contenidomensajerecibido.cm_observaciones,' +
               ' ccm_contenidomensajerecibido.cm_registroprocesados, ccm_contenidomensajerecibido.cm_registroscorrecto,' +
               ' cmr_mensajerecibido.mr_fecharecepcion, cmr_mensajerecibido.mr_emailemisor,' +
               ' cmr_mensajerecibido.mr_observaciones, cmr_mensajerecibido.mr_motivomensaje,'  +
               ' cm_id, cm_idmensajerecibido ' +
               ' FROM comunes.ccm_contenidomensajerecibido, comunes.cam_tipoarchivomensaje,' +
               ' comunes.cmr_mensajerecibido, impoexpo.iar_archivo, cpr_prestador' +
               ' WHERE (' +
               ' (ccm_contenidomensajerecibido.cm_idmensajerecibido = cmr_mensajerecibido.mr_id)' +
               ' AND (ccm_contenidomensajerecibido.cm_idarchivo = cam_tipoarchivomensaje.am_id )' +
               ' AND (cam_tipoarchivomensaje.am_idarchivo = iar_archivo.ar_id) AND' +
               ' (cmr_mensajerecibido.mr_idprestador = cpr_prestador.ca_identificador(+))) ';



        if (edFechaDesde.Date <> 0) then
            sql := sql + ' and cmr_mensajerecibido.mr_fecharecepcion >=' + SqlValue(edFechaDesde.Date);

        if (edFechaHasta.Date <> 0) then
            sql := sql + ' and cmr_mensajerecibido.mr_fecharecepcion <=' + SqlValue(edFechaHasta.Date);

        case cmbEstados.ItemIndex of
            0 : sql := sql + ' AND (ccm_contenidomensajerecibido.cm_estado = ''O'' ' +
                             ' AND ccm_contenidomensajerecibido.cm_registroprocesados = ccm_contenidomensajerecibido.cm_registroscorrecto' +
                             ' AND cmr_mensajerecibido.mr_estado = ''O'') ';
            1 : sql := sql + ' AND (ccm_contenidomensajerecibido.cm_estado = ''E'' ' +
                             ' OR ccm_contenidomensajerecibido.cm_registroprocesados <> ccm_contenidomensajerecibido.cm_registroscorrecto' +
                             ' OR cmr_mensajerecibido.mr_estado = ''E'') ' +
                             ' AND ccm_contenidomensajerecibido.cm_estado <> ''P''';
            2 : sql := sql + ' AND ccm_contenidomensajerecibido.cm_estado = ''P'' ';
        end;

        if fraPrestador.IsSelected then
            sql := sql + ' AND cmr_mensajerecibido.mr_idprestador = ' +  SqlValue(fraPrestador.Codigo);

        if fraTipoArchivo.IsSelected then
            sql := sql + ' AND iar_archivo.ar_id = ' +  SqlValue(fraTipoArchivo.Codigo);

        sql := sql + ' order by mr_id ';

        sdqDatos.SQL.text := sql;
        sdqDatos.Open;

        if (FTipoParte = '') then
            raise Exception.Create('No existe un tipo de archivo asociado');

        if (FTipoParte = 'PMI') or (FTipoParte = 'PME') then
            sdqDetallesParte.Open
        else begin
            if (FTipoParte = 'PEV') then
                sdqDetallesParteEvolutivo.Open;
        end;

        sdqErrorParte.Open;

      except
        on E: Exception do
            ErrorMsg( E, 'Error refrescar los datos.');
      end;
   finally
        sdqDatos.EnableControls;
        sdqDetallesParte.EnableControls;
        sdqDetallesParteEvolutivo.EnableControls;
        sdqErrorParte.EnableControls;
   end;
end;

procedure TfrmRecepcionPartesGrales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree ;
   frmPrincipal.mnuRecepcionPartesGenerales.Enabled := True ;
end;

procedure TfrmRecepcionPartesGrales.tbSalirClick(Sender: TObject);
begin
   close;
end;

procedure TfrmRecepcionPartesGrales.tbOrdenClick(Sender: TObject);
begin
   SortDialog.Execute ;
end;

procedure TfrmRecepcionPartesGrales.tbProcesarClick(
  Sender: TObject);
var
    berrors: boolean;
    bpendientes: boolean;
begin
     if sdqDatos.RecordCount > 0 then
       if MsgBox('¿Desea procesar el envío?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES then
       begin

            if (FTipoParte = '') then raise Exception.Create('No existe un tipo de archivo asociado');
            berrors := false;
            bpendientes := false;
            if (FTipoParte = 'PMI') or (FTipoParte = 'PME') then
            begin
                sdqDetallesParte.DisableControls;
                sdqDetallesParte.First;
                while not sdqDetallesParte.Eof do
                begin
                    try
(*Ver quizas deba ir voy a validar todo en el impoExpo
                        if (not sdqDetallesParte.FieldByName('mw_error').IsNull) and
                           (sdqDetallesParte.FieldByName('mw_fechamodif').IsNull) then
                        begin //Si pasa esto debo cargar los datos correctos
                            with TfrmReingresoPMI.create(self) do
                            try
                                CargaPartePMI(sdqDetallesParte.Fields);
                                if Validar(false) then GuardarPMI
                                else raise Exception.Create('Error existen datos erróneos');
                            finally
                                free;
                            end;

                        end;
*)
                        //fixme sacar los @ntpart
                        if not sdqDetallesParte.FieldByName('MW_ACCION').IsNull and
                           (sdqDetallesParte.FieldByName('MW_RESULTADOACCION').AsString <> 'C') then
                        begin
                            if (FTipoParte = 'PMI') then
                                EjecutarStore('WEB.DO_PROCESARPMI@ntpart(' +  SqlInt(sdqDetallesParte.FieldByName('MW_TRANSACCION').AsInteger) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_SINIESTRO').AsInteger,  true) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_ORDEN').AsInteger, true) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_RECAIDA').AsInteger) + ', ' +
                                                                       SqlValue(sdqDetallesParte.FieldByName('MW_ACCION').AsString) + ', ' +
                                                                       SqlValue(Sesion.LoginName) + ');')
                            else
                                //fixme sacar los @ntpart
                                EjecutarStore('WEB.DO_PROCESARPME@ntpart(' +  SqlInt(sdqDetallesParte.FieldByName('MW_TRANSACCION').AsInteger) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_SINIESTRO').AsInteger,  true) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_ORDEN').AsInteger, true) + ', ' +
                                                                       SqlInt(sdqDetallesParte.FieldByName('EX_RECAIDA').AsInteger) + ', ' +
                                                                       SqlValue(sdqDetallesParte.FieldByName('MW_ACCION').AsString) + ', ' +
                                                                       SqlValue(Sesion.LoginName) + ');');

                             EjecutarSql(' update art.tmp_spmw_partemedico ' +
                                         ' set mw_resultadoaccion = ''C'', ' +
                                         ' mw_usuarioaccion =  ' + SqlValue(Sesion.LoginName) + ', ' +
                                         ' mw_fechaaccion = sysdate ' +
                                         ' where mw_transaccion = ' + SqlValue(sdqDetallesParte.FieldByName('MW_TRANSACCION').AsInteger));
                        end;
                    except

                        on E: Exception do
                        begin
                            ErrorMsg( E, 'Error la procesar ' + FTipoParte);

                            berrors := true;
                            EjecutarSql(' update art.tmp_spmw_partemedico ' +
                                         ' set mw_resultadoaccion = ''E'', ' +
                                         ' mw_usuarioaccion =  ' + SqlValue(Sesion.LoginName) + ', ' +
                                         ' mw_fechaaccion = sysdate ' +
                                         ' where mw_transaccion = ' + SqlValue(sdqDetallesParte.FieldByName('MW_TRANSACCION').AsInteger));
                        end;
                    end;
                    Application.ProcessMessages;
                    if not sdqDetallesParte.FieldByName('MW_ACCION').IsNull then bpendientes := true;
                    sdqDetallesParte.Next;
                end;
                sdqDetallesParte.EnableControls;
                sdqDetallesParte.Refresh;
            end
            else begin
                if (FTipoParte = 'PEV') then
                begin
                  sdqDetallesParteEvolutivo.DisableControls;
                  sdqDetallesParteEvolutivo.First;
                  while not sdqDetallesParteEvolutivo.Eof do
                  begin
                      try

                          if not sdqDetallesParteEvolutivo.FieldByName('VW_ACCION').IsNull and
                             (sdqDetallesParteEvolutivo.FieldByName('VW_RESULTADOACCION').AsString <> 'C') then
                          begin
                                //fixme sacar los @ntpart
                                EjecutarStore('WEB.DO_PROCESARPEV@ntpart(' +  SqlInt(sdqDetallesParteEvolutivo.FieldByName('VW_TRANSACCION').AsInteger) + ', ' +
                                                                         SqlInt(sdqDetallesParteEvolutivo.FieldByName('EX_SINIESTRO').AsInteger,  true) + ', ' +
                                                                         SqlInt(sdqDetallesParteEvolutivo.FieldByName('EX_ORDEN').AsInteger, true) + ', ' +
                                                                         SqlInt(sdqDetallesParteEvolutivo.FieldByName('EX_RECAIDA').AsInteger) + ', ' +
                                                                         SqlValue(sdqDetallesParteEvolutivo.FieldByName('VW_ACCION').AsString) + ', ' +
                                                                         SqlValue(Sesion.LoginName) + ');');

                                EjecutarSql(' update art.tmp_spvw_parteevolutivo ' +
                                            ' set vw_resultadoaccion = ''C'', ' +
                                            ' vw_usuarioaccion =  ' + SqlValue(Sesion.LoginName) + ', ' +
                                            ' vw_fechaaccion = sysdate ' +
                                            ' where vw_transaccion = ' + SqlValue(sdqDetallesParteEvolutivo.FieldByName('VW_TRANSACCION').AsInteger));
                          end;

                      except
                        on E: Exception do
                          begin
                             ErrorMsg( E, 'Error la procesar ' + FTipoParte);

                           berrors := true;
                           EjecutarSql(' update art.tmp_spvw_parteevolutivo ' +
                                       ' set vw_resultadoaccion = ''E'', ' +
                                       ' vw_usuarioaccion =  ' + SqlValue(Sesion.LoginName) + ', ' +
                                       ' vw_fechaaccion = sysdate ' +
                                       ' where vw_transaccion = ' + SqlValue(sdqDetallesParteEvolutivo.FieldByName('VW_TRANSACCION').AsInteger));
                          end;
                      end;
                      Application.ProcessMessages;
                      if not sdqDetallesParteEvolutivo.FieldByName('VW_ACCION').IsNull then bpendientes := true;
                      sdqDetallesParteEvolutivo.Next;
                  end;
                  sdqDetallesParteEvolutivo.EnableControls;
                  sdqDetallesParteEvolutivo.Refresh;
              end;

            end;

            if not bpendientes then
            begin
                EjecutarSqlEx(' update comunes.ccm_contenidomensajerecibido ' +
                              ' set cm_estado = ' + SqlValue(string(iif(berrors, 'E', 'P'))) +
                              ' where cm_id = :cm_id and                    ' +
                           '       cm_idmensajerecibido = :cm_idmensajerecibido',
                           [sdqDatos.FieldByName('cm_id').AsInteger,
                            sdqDatos.FieldByName('cm_idmensajerecibido').AsInteger]);
            end;

        sdqDatos.Refresh;
      end;
end;
{$WARNINGS OFF}
procedure TfrmRecepcionPartesGrales.DbgDetalleParteDblClick(Sender: TObject);
var
 b : TBookmark;
begin
      if sdqDetallesParte.RecordCount > 0 then
        with TfrmReingresoParteMedico.create(self) do
        try
            CargaParte(sdqDetallesParte.Fields);
            if (ShowModal = mrOk) then sdqDetallesParte.Refresh;
        finally
            try
                sdqDetallesParte.DisableControls;
                b := sdqDetallesParte.GetBookmark;
            finally
                sdqDetallesParte.GotoBookmark(b);
                sdqDetallesParte.EnableControls;
                sdqDetallesParte.FreeBookMark(b);
            end;

            free;
        end;
end;

{$WARNINGS ON}
procedure TfrmRecepcionPartesGrales.DbgDetalleParteGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if (sdqDetallesParte.FieldByName('mw_resultadoaccion').AsString =  'Error') then
     begin
        DbgDetalleParte.Canvas.Font.Color := clRed;
        if Highlight then
        begin
           AFont.Color := clYellow;
           Background := clHighlight;
        end;
     end
     else begin
        DbgDetalleParte.Canvas.Font.Color := clBlack;
        if Highlight then
        begin
           AFont.Color := clHighlightText;
           Background := clHighlight;
        end;
     end;
end;

procedure TfrmRecepcionPartesGrales.tbLimpiarClick(Sender: TObject);
begin
    fraPrestador.Clear;
    fraTipoArchivo.Clear;
    edFechaDesde.Date := 0;
    edFechaHasta.Date := 0;
    cmbEstados.ItemIndex := -1;
end;


procedure TfrmRecepcionPartesGrales.FiltrarFrame(
  Sender: TObject; aframe: TfraCodigoDescripcion);
begin
  if (trim(aframe.cmbDescripcion.Text) <> '') and
     (trim(aframe.cmbDescripcion.Text)[1] <> '%') then
      aframe.cmbDescripcion.Text := '%' + aframe.cmbDescripcion.Text;
  aframe.cmbDescripcionDropDown(Sender);
  if (trim(aframe.cmbDescripcion.Text) <> '') and
     (trim(aframe.cmbDescripcion.Text)[1] = '%') then
      aframe.cmbDescripcion.Text := copy(aframe.cmbDescripcion.Text, 2, length(aframe.cmbDescripcion.Text));
end;


procedure TfrmRecepcionPartesGrales.fraPrestadorcmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarFrame(Sender, fraPrestador);
  fraPrestador.cmbDescripcionDropDown(Sender);
end;

procedure TfrmRecepcionPartesGrales.OnChangefraTipoArchivo(
  Sender: TObject);
begin
    FTipoParte := ValorSql('SELECT am_idtipoarchivo FROM comunes.cam_tipoarchivomensaje WHERE am_id = ' + SqlValue(fraTipoArchivo.ID));

    if (FTipoParte = 'PMI') or (FTipoParte = 'PME') then
    begin
        pcDetalles.ActivePage := tbDetallesParte;
        fraAccionFiltro.ExtraCondition := ' and tb_especial1 like ''%'  + iif((FTipoParte = 'PMI'), 'I', 'E') + '%''';
        fraAccion.ExtraCondition := ' and tb_especial1 like ''%'  + iif((FTipoParte = 'PMI'), 'I', 'E') + '%''';
        tbRefrescarClick(Sender);
    end
    else begin
        if (FTipoParte = 'PEV') then
        begin
            pcDetalles.ActivePage := tbDetallesPEV;
            fraAccionFiltro.ExtraCondition := ' and tb_especial1 like ''%V%''';
            fraAccion.ExtraCondition := ' and tb_especial1 like ''%V%''';
            tbRefrescarClick(Sender);
        end
        else pcDetalles.ActivePageIndex := -1;
    end;
end;

procedure TfrmRecepcionPartesGrales.btnAccAceptarClick(Sender: TObject);
begin

    if (FTipoParte = '') then raise Exception.Create('No existe un tipo de archivo asociado');

    if (FTipoParte = 'PMI') then
        ActualizarAccionPMI
    else begin
        if (FTipoParte = 'PME') then
            ActualizarAccionPME
        else
            if (FTipoParte = 'PEV') then ActualizarAccionPEV;
    end;

  fpAccion.ModalResult := mrOk;
end;


procedure TfrmRecepcionPartesGrales.ActualizarAccionPMI;

  procedure ValidarTipo(ATipo: string);
  begin
    //Ya fue procesado correctamente
    if (sdqDetallesParte.FieldByName('mw_resultadoaccion').AsString = 'C') then
        raise EInvalidExcept.Create('El registro ya fue procesado correctamante.');

    if (ATipo = 'SI') or (ATipo = 'NR') or (ATipo = 'NO') or (ATipo = 'NS') then
    begin
        if (sdqDetallesParte.FieldByName('mw_fechasiniestro').IsNull) then
            raise EInvalidExcept.Create('El registro no tiene fecha de siniestro asociado.');

        if sdqDetallesParte.FieldByName('mw_empleadorcuit').IsNull then
          raise EInvalidExcept.Create('El registro seleccionado no tiene un empleador asociado.');

        if (not sdqDetallesParte.FieldByName('mw_empleadorcuit').IsNull) and
           (not IsCuit(sdqDetallesParte.FieldByName('mw_empleadorcuit').AsString)) then
          raise EInvalidExcept.Create('El registro seleccionado tiene un Cuit inválido.');

        if (sdqDetallesParte.FieldByName('em_cuit').IsNull) then
            raise EInvalidExcept.Create('El registro tiene un cuit que no existe como empresa.');
    end;

    if (ATipo = 'SI') or (ATipo = 'NR') or (ATipo = 'NO') then
    begin
      if sdqDetallesParte.FieldByName('EX_SINIESTRO').IsNull then
        raise EInvalidExcept.Create('El registro seleccionado no tiene siniestro asociado.');
    end;

    if (ATipo = 'NO') or (ATipo = 'NS') then
    begin
      if (sdqDetallesParte.FieldByName('mw_idtipodoc').AsString <> '0') and
         (sdqDetallesParte.FieldByName('mw_idtipodoc').AsString <> '1') then
        raise EInvalidExcept.Create('El registro seleccionado no tiene un tipo de documento válido.');

      if (sdqDetallesParte.FieldByName('mw_nrodoc').IsNull) then
        raise EInvalidExcept.Create('El registro seleccionado no tiene un documento.');

      if (sdqDetallesParte.FieldByName('mw_idtipodoc').AsString = '0') and
         (not sdqDetallesParte.FieldByName('mw_nrodoc').IsNull) and
         (not IsCuil(sdqDetallesParte.FieldByName('mw_nrodoc').AsString)) then
        raise EInvalidExcept.Create('El registro seleccionado tiene el Cuil inválido.');
    end;


    if (ATipo = 'SI') then
    begin
      if ExisteSql('SELECT 1 FROM art.spi_parteingreso WHERE pi_siniestro = ' + SqlValue(sdqDetallesParte.FieldByName('EX_SINIESTRO').AsInteger)
                    + ' and pi_orden = ' + SqlValue(sdqDetallesParte.FieldByName('EX_ORDEN').AsInteger) 
                    + ' and pi_recaida = ' + SqlValue(sdqDetallesParte.FieldByName('EX_RECAIDA').AsInteger)) then
        raise EInvalidExcept.Create('El registro seleccionado ya tiene un parte de ingreso.');
    end;

  end;

begin

  if fraAccion.IsEmpty then
    InvalidExcept(fraAccion.edCodigo, 'Debe seleccionar una Acción');

  ValidarTipo(fraAccion.Codigo);

  EjecutarSql('update tmp_spmw_partemedico set mw_accion = ' + SqlValue(fraAccion.Codigo) + ' where mw_transaccion = ' +  SqlValue(sdqDetallesParte.fieldbyname('mw_transaccion').AsInteger));

  sdqDetallesParte.Refresh;

end;

procedure TfrmRecepcionPartesGrales.tbAccionClick(Sender: TObject);
begin
  if (sdqDetallesParte.RecordCount > 0) or (sdqDetallesParteEvolutivo.RecordCount > 0) then
  begin
    fraAccion.Clear;
    fpAccion.ShowModal;
  end;
end;

procedure TfrmRecepcionPartesGrales.ActualizarAccionPEV;

  procedure ValidarTipo(ATipo: string);
  begin
    //Ya fue procesado correctamente
    if (sdqDetallesParteEvolutivo.FieldByName('vw_resultadoaccion').AsString = 'C') then
        raise EInvalidExcept.Create('El registro ya fue procesado correctamante.');

    if (ATipo = 'SI') then
    begin
        if (sdqDetallesParteEvolutivo.FieldByName('vw_fechasin').IsNull) then
            raise EInvalidExcept.Create('El registro no tiene fecha de siniestro asociado.');

        if sdqDetallesParteEvolutivo.FieldByName('vw_cuit').IsNull then
          raise EInvalidExcept.Create('El registro seleccionado no tiene un empleador asociado.');

        if (not sdqDetallesParteEvolutivo.FieldByName('vw_cuit').IsNull) and
           (not IsCuit(sdqDetallesParteEvolutivo.FieldByName('vw_cuit').AsString)) then
          raise EInvalidExcept.Create('El registro seleccionado tiene un Cuit inválido.');

        if (sdqDetallesParteEvolutivo.FieldByName('em_cuit').IsNull) then
            raise EInvalidExcept.Create('El registro tiene un cuit que no existe como empresa.');

      if sdqDetallesParteEvolutivo.FieldByName('EX_SINIESTRO').IsNull then
        raise EInvalidExcept.Create('El registro seleccionado no tiene siniestro asociado.');

    end;

  end;

begin

  if fraAccion.IsEmpty then
    InvalidExcept(fraAccion.edCodigo, 'Debe seleccionar una Acción');

  ValidarTipo(fraAccion.Codigo);

  EjecutarSql('update tmp_spvw_parteevolutivo set vw_accion = ' + SqlValue(fraAccion.Codigo) + ' where vw_transaccion = ' +  SqlValue(sdqDetallesParteEvolutivo.fieldbyname('vw_transaccion').AsInteger));

  sdqDetallesParteEvolutivo.Refresh;

end;

procedure TfrmRecepcionPartesGrales.tbRefreshClick(Sender: TObject);
begin
    RefreshParte(FTipoParte);
end;

procedure TfrmRecepcionPartesGrales.tbLimpiarDetalleClick(Sender: TObject);
begin
    fraAccionFiltro.Clear;
    cbEstadoDetalleParte.ItemIndex := -1;
end;

procedure TfrmRecepcionPartesGrales.tbEliminarAccionClick(Sender: TObject);
begin
    if (FTipoParte = 'PMI') or (FTipoParte = 'PME') then
    begin
      if (sdqDetallesParte.RecordCount > 0) then
      begin
          //Ya fue procesado correctamente
          if (sdqDetallesParte.FieldByName('mw_resultadoaccion').AsString = 'C') then
              raise EInvalidExcept.Create('El registro ya fue procesado correctamante.');

          if MsgBox('¿Desea eliminar la acción?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES then
          begin
              EjecutarSql('update tmp_spmw_partemedico set mw_accion = null where mw_transaccion = ' +  SqlValue(sdqDetallesParte.fieldbyname('mw_transaccion').AsInteger));
              sdqDetallesParte.Refresh;
          end;
      end;
    end
    else begin
        if (FTipoParte = 'PEV') then
        begin
          if (sdqDetallesParteEvolutivo.RecordCount > 0) then
          begin
              //Ya fue procesado correctamente
              if (sdqDetallesParteEvolutivo.FieldByName('vw_resultadoaccion').AsString = 'C') then
                  raise EInvalidExcept.Create('El registro ya fue procesado correctamante.');

              if MsgBox('¿Desea eliminar la acción?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES then
              begin
                  EjecutarSql('update tmp_spvw_parteevolutivo set vw_accion = null where vw_transaccion = ' +  SqlValue(sdqDetallesParteEvolutivo.fieldbyname('vw_transaccion').AsInteger));
                  sdqDetallesParteEvolutivo.Refresh;
              end;
          end;
        end;
    end;

end;

procedure TfrmRecepcionPartesGrales.tbVerClick(Sender: TObject);
begin
    if (FTipoParte = 'PMI') or (FTipoParte = 'PME') then
        DbgDetalleParteDblClick(Sender)
    else begin
        if (FTipoParte = 'PEV') then DbgDetalleParteEvolutivoDblClick(Sender);
    end;
end;

procedure TfrmRecepcionPartesGrales.ActualizarAccionPME;

  procedure ValidarTipo(ATipo: string);
  begin
    //Ya fue procesado correctamente
    if (sdqDetallesParte.FieldByName('mw_resultadoaccion').AsString = 'C') then
        raise EInvalidExcept.Create('El registro ya fue procesado correctamante.');

    if (ATipo = 'SI') then
    begin
        if (sdqDetallesParte.FieldByName('mw_fechasiniestro').IsNull) then
            raise EInvalidExcept.Create('El registro no tiene fecha de siniestro asociado.');

        if sdqDetallesParte.FieldByName('mw_empleadorcuit').IsNull then
          raise EInvalidExcept.Create('El registro seleccionado no tiene un empleador asociado.');

        if (not sdqDetallesParte.FieldByName('mw_empleadorcuit').IsNull) and
           (not IsCuit(sdqDetallesParte.FieldByName('mw_empleadorcuit').AsString)) then
          raise EInvalidExcept.Create('El registro seleccionado tiene un Cuit inválido.');

        if (sdqDetallesParte.FieldByName('em_cuit').IsNull) then
            raise EInvalidExcept.Create('El registro tiene un cuit que no existe como empresa.');

      if sdqDetallesParte.FieldByName('EX_SINIESTRO').IsNull then
        raise EInvalidExcept.Create('El registro seleccionado no tiene siniestro asociado.');

      if ExisteSql('SELECT 1 FROM art.spe_parteengreso WHERE pe_siniestro = ' + SqlValue(sdqDetallesParte.FieldByName('EX_SINIESTRO').AsInteger)
                    + ' and pe_orden = ' + SqlValue(sdqDetallesParte.FieldByName('EX_ORDEN').AsInteger)
                    + ' and pe_recaida = ' + SqlValue(sdqDetallesParte.FieldByName('EX_RECAIDA').AsInteger)) then
        raise EInvalidExcept.Create('El registro seleccionado ya tiene un parte de egreso.');

    end;

  end;

begin

  if fraAccion.IsEmpty then
    InvalidExcept(fraAccion.edCodigo, 'Debe seleccionar una Acción');

  ValidarTipo(fraAccion.Codigo);

  EjecutarSql('update tmp_spmw_partemedico set mw_accion = ' + SqlValue(fraAccion.Codigo) + ' where mw_transaccion = ' +  SqlValue(sdqDetallesParte.fieldbyname('mw_transaccion').AsInteger));

  sdqDetallesParte.Refresh;

end;

procedure TfrmRecepcionPartesGrales.DbgDetalleParteEvolutivoGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
     if (sdqDetallesParteEvolutivo.FieldByName('vw_descresultadoaccion').AsString =  'Error') then
     begin
        DbgDetalleParteEvolutivo.Canvas.Font.Color := clRed;
        if Highlight then
        begin
           AFont.Color := clYellow;
           Background := clHighlight;
        end;
     end
     else begin
        DbgDetalleParteEvolutivo.Canvas.Font.Color := clBlack;
        if Highlight then
        begin
           AFont.Color := clHighlightText;
           Background := clHighlight;
        end;
     end;
end;

procedure TfrmRecepcionPartesGrales.RefreshParte(aTipoParte: string);
begin
    if (aTipoParte = 'PMI') or (aTipoParte = 'PME') then
        RefrescarPMI_PME
    else begin
        if (aTipoParte = 'PEV') then RefrescarPEV;
    end;

end;

procedure TfrmRecepcionPartesGrales.RefrescarPMI_PME;
begin
    if (sdqDatos.Active) and (sdqDatos.RecordCount > 0) then
    begin
      sdqDetallesParte.Close;
      sdqDetallesParte.SQL.Clear;
      sdqDetallesParte.Sql.Add(' SELECT mw_transaccion, ' +
                             '  ex_siniestro, ' +
                             '  ex_orden, ' +
                             '  ex_recaida, ' +
                             '  spmw.mw_idtipodoc, ' +
                             '  TipoDocs.tb_codigo as tipodoc, ' +
                             '  spmw.mw_nrodoc, ' +
                             '  ctj_trabajadores.tj_cuil, ' +
                             '  ctj_trabajadores.tj_nombre, ' +
                             '  spmw.mw_idsiniestro tiposiniestro, ' +
                             '  spmw.mw_empleadorcuit, ' +
                             '  aem_empresa.em_nombre, ' +
                               ' spmw.mw_fechasiniestro, ' +
                               ' spmw.mw_fechaprimermanif, ' +
                               ' spmw.mw_tiempoexposicion, ' +
                               ' spmw.mw_diagnosticoinicial, ' +' spmw.mw_idtipocie10, ' +
                               ' spmw.mw_observaciones, ' +
                               ' spmw.mw_presuponeincapacidad, ' +
                               ' spmw.mw_idformaaccidente, ' +
                               ' spmw.mw_idpartecuerpo, ' +
                               ' spmw.mw_idnaturalezalesion, ' +
                               ' spmw.mw_idagentecausante, ' +
                               ' spmw.mw_idtipogravedad, ' +
                               ' spmw.mw_lugartratamiento, ' +
                               ' spmw.mw_fechainternacion, ' +
                               ' spmw.mw_lugarinterna, ' +
                               ' spmw.mw_idlugarinterna, ' +
                               ' spmw.mw_idtipotratamiento, ' +
                               ' spmw.mw_bajamedica, ' +
                               ' spmw.mw_diasprevistobaja, ' +
                               ' spmw.mw_fechareconsulta, ' +
                               ' spmw.mw_fechareiniciolaboral, ' +
                               ' spmw.mw_apenomprofesional, ' +
                               ' spmw.mw_siniestrolugar, ' + 
                               ' spmw.mw_siniestrotelef, ' + 
                               ' spmw.mw_siniestrocalle, ' +
                               ' spmw.mw_siniestropuerta, ' +
                               ' spmw.mw_siniestropiso, ' +
                               ' spmw.mw_siniestrodepto, ' + 
                               ' spmw.mw_siniestroloca, ' + 
                               ' spmw.mw_siniestroidprovincia, ' +
                               ' spmw.mw_siniestrocodpos, ' + 
                               ' spmw.mw_siniestropais, ' +
                               ' spmw.mw_telefono, ' +
                               ' spmw.mw_apeynom, ' +
                               ' decode(spmw.mw_idtiposexo, ''0'', ''F'', ''1'', ''M'', spmw.mw_idtiposexo), ' +
                               ' mw_idtiposexo, ' +
                               ' spmw.mw_fechanacimiento, ' +
                               ' spmw.mw_idestadocivil, ' +
                               ' spmw.mw_calle, ' +
                               ' spmw.mw_nropuerta, ' +
                               ' spmw.mw_piso, ' +
                               ' spmw.mw_depto, ' + 
                               ' spmw.mw_codpostal, ' + 
                               ' spmw.mw_localidad, ' + 
                               ' spmw.mw_idprovincia, ' +
                               ' spmw.mw_idpais, ' +
                               ' spmw.mw_error, ' +
                               ' spmw.mw_empleadornodeclarado, ' +
                               ' spmw.mw_fechaaccidoriginal, ' +
                               ' spmw.mw_fechaprimermanif, ' +
                               ' spmw.mw_tiempoexposicion, ' +
                               ' spmw.mw_fechahoraaccidente, ' +
                               ' spmw.mw_idlugarinterna, ' +
                               ' spmw.mw_tipoparte, ' +
                               ' spmw.mw_accion, ' +
                               ' acciones.tb_descripcion acciondesc, ' +
                               ' decode(spmw.mw_resultadoaccion, ''E'', ''Error'', ''C'', ''Correcto'', null) mw_resultadoaccion, ' +
                               ' spmw.mw_fechamodif, ' +
                               ' em_cuit ' +
                         ' FROM ctj_trabajadores, aem_empresa, sex_expedientes sex, art.tmp_spmw_partemedico spmw, ctb_tablas tipodocs, ctb_tablas acciones ' +
                         ' WHERE art.web.get_cuil_from_doc(spmw.mw_idtipodoc, spmw.mw_nrodoc, spmw.mw_idtiposexo) = ctj_trabajadores.tj_cuil(+) ' +
                         '  AND spmw.mw_empleadorcuit = aem_empresa.em_cuit(+) ' +
    //                       '  AND spmw.mw_empleadorcuit = sex.ex_cuit(+) ' +
    //                       '  AND art.web.get_cuil_from_doc(spmw.mw_idtipodoc, spmw.mw_nrodoc, decode(spmw.mw_idtiposexo, ''0'', ''F'', ''1'', ''M'')) = sex.ex_cuil(+) ' +
    //                       '  AND ((spmw.mw_fechasiniestro = nvl(ex_fecharecaida, ex_fechaaccidente)) ' +
    //                       '        or (nvl(ex_fecharecaida, ex_fechaaccidente) is null)) ' +
                         '  AND spmw.mw_siniestro = sex.ex_siniestro(+) ' +
                         '  AND spmw.mw_orden = sex.ex_orden(+) ' +
                         '  AND spmw.mw_recaida = sex.ex_recaida(+) ' +
                         '  AND spmw.mw_idtipodoc = TipoDocs.tb_especial1(+) ' +
                         '  AND spmw.mw_accion = acciones.tb_codigo(+) ' +
                         '  AND tipodocs.tb_clave(+) = ''TDOC''' +
                         '  AND acciones.tb_clave(+) = ''ACWEB''' +
                         '  AND spmw.mw_idmail = :cm_idmensajerecibido ' +
                         '  AND spmw.mw_idarchivo = :cm_id ');

      if fraAccionFiltro.IsSelected then
          sdqDetallesParte.Sql.Add( ' AND spmw.mw_accion = ' + SqlValue(fraAccionFiltro.Codigo));

      case cbEstadoDetalleParte.ItemIndex of
        0: sdqDetallesParte.Sql.Add( ' AND spmw.mw_resultadoaccion = ''C'' ');
        1: sdqDetallesParte.Sql.Add( ' AND spmw.mw_resultadoaccion = ''E'' ');
      end;

      sdqDetallesParte.Open;
    end;
end;

procedure TfrmRecepcionPartesGrales.RefrescarPEV;
begin
    if (sdqDatos.Active) and (sdqDatos.RecordCount > 0) then
    begin
      sdqDetallesParteEvolutivo.Close;
      sdqDetallesParteEvolutivo.SQL.Clear;
      sdqDetallesParteEvolutivo.Sql.Add('SELECT ex_siniestro,  ' +
                               '       ex_orden,  ' +
                               '       ex_recaida,  ' +
                               '       TipoDocs.tb_codigo as tipodoc,  ' +
                               '       ctj_trabajadores.tj_cuil,  ' +
                               '       ctj_trabajadores.tj_nombre,  ' +
                               '       aem_empresa.em_nombre,  ' +
                               '       acciones.tb_descripcion acciondesc,  ' +
                               '       decode(spvw.vw_resultadoaccion, ''E'', ''Error'', ''C'', ''Correcto'', null) vw_descresultadoaccion,  ' +
                               '       em_cuit,  ' +
                               '       spvw.*  ' +
                               '  FROM ctj_trabajadores, aem_empresa, sex_expedientes sex, art.tmp_spvw_parteevolutivo spvw, ctb_tablas tipodocs, ctb_tablas acciones  ' +
                               ' WHERE (spvw.vw_documento = ctj_trabajadores.tj_cuil(+))  ' +
//                               '   AND (spvw.vw_documento = ctj_trabajadores.tj_documento(+)))  ' +
                               '   AND spvw.vw_cuit = aem_empresa.em_cuit(+)  ' +
                               '   AND spvw.vw_siniestro = sex.ex_siniestro(+)  ' +
                               '   AND spvw.vw_orden = sex.ex_orden(+)  ' +
                               '   AND spvw.vw_recaida = sex.ex_recaida(+)  ' +
                               '   AND spvw.vw_tipodoc = TipoDocs.tb_especial1(+)  ' +
                               '   AND spvw.vw_accion = acciones.tb_codigo(+)  ' +
                               '   AND tipodocs.tb_clave(+) = ''TDOC'' ' +
                               '   AND acciones.tb_clave(+) = ''ACWEB'' ' +
                               '   AND spvw.vw_idmail = :cm_idmensajerecibido  ' +
                               '   AND spvw.vw_idarchivo = :cm_id ' );

      if fraAccionFiltro.IsSelected then
          sdqDetallesParteEvolutivo.Sql.Add( ' AND spvw.vw_accion = ' + SqlValue(fraAccionFiltro.Codigo));

      case cbEstadoDetalleParte.ItemIndex of
        0: sdqDetallesParteEvolutivo.Sql.Add( ' AND spvw.vw_resultadoaccion = ''C'' ');
        1: sdqDetallesParteEvolutivo.Sql.Add( ' AND spvw.vw_resultadoaccion = ''E'' ');
      end;

      sdqDetallesParteEvolutivo.Open;
    end;
end;

{$WARNINGS OFF}
procedure TfrmRecepcionPartesGrales.DbgDetalleParteEvolutivoDblClick(
  Sender: TObject);
var
 b : TBookmark;
begin
      if sdqDetallesParteEvolutivo.RecordCount > 0 then
        with TfrmReingresoParteMedicoEvol.create(self) do
        try
            CargaParte(sdqDetallesParteEvolutivo.Fields);
            if (ShowModal = mrOk) then sdqDetallesParteEvolutivo.Refresh;
        finally
            try
                sdqDetallesParteEvolutivo.DisableControls;
                b := sdqDetallesParte.GetBookmark;
            finally
                sdqDetallesParteEvolutivo.GotoBookmark(b);
                sdqDetallesParteEvolutivo.EnableControls;
                sdqDetallesParteEvolutivo.FreeBookMark(b);
            end;
            free;
        end;
end;
{$WARNINGS ON}

end.
