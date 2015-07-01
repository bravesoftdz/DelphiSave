unit unMoldeAbmAnalisis;

interface

uses
  SysUtils, Classes, Controls, Forms, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls,
  Mask, DBCtrls, ComCtrls, Grids, DBGrids, quickrpt, ToolEdit, RXLookup, ArtComboBox,
  Db, DBTables, PeriodoPicker, SDEngine, ToolWin, ShortCutControl, DateUtils, Variants,
  unfraEstablecimiento_OLD, Placemnt, unfraPrestadorAMP, unfraOperativo, SortDlg,
  QueryToFile, ExportDialog, QueryPrint, artSeguridad, RXDBCtrl, ArtDBGrid, Menus,
  unfraEstudio, unFormEstudios, DateComboBox, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unFraTipoEstudio, unArt, unArtDbFrame, unArtDBAwareFrame, ImgList,
  unFraEmpresa, unFraTrabajadorAMP, unFraEstablecimiento, FormPanel;

type
  TfrmMoldeAbmAnalisis = class(TForm)
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbAgregar: TToolButton;
    tbModificar: TToolButton;
    ToolButton4: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    ToolButton7: TToolButton;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton10: TToolButton;
    tbSalir: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton13: TToolButton;
    pnlFiltros: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ShortCutControl: TShortCutControl;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label2: TLabel;
    fraOperativo: TfraOperativo;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    btnTrabajador: TSpeedButton;
    Seguridad: TSeguridad;
    dbgDatos: TArtDBGrid;
    PrintDialog: TPrintDialog;
    FormStorage: TFormStorage;
    pmnuImpresion: TPopupMenu;
    mnuImpResultados: TMenuItem;
    Bevel5: TBevel;
    fraEstudio: TfraEstudio;
    lbEstudio: TLabel;
    tbQuitar: TToolButton;
    tbTraerValores: TToolButton;
    Label1: TLabel;
    edFecha: TDateComboBox;
    lbTipo: TLabel;
    fraTipoEstudio: TfraTipoEstudio;
    Bevel6: TBevel;
    Label4: TLabel;
    fraPrestador: TfraPrestadorAMP;
    btnReconfirmaciones: TSpeedButton;
    tbVerEliminados: TToolButton;
    ToolButton2: TToolButton;
    tbMover: TToolButton;
    ToolButton1: TToolButton;
    tbReconfirmar: TToolButton;
    tbMotivoEstudio: TToolButton;
    imgGenBW: TImageList;
    imgGenColor: TImageList;
    Label5: TLabel;
    edFechaRPrest: TDateComboBox;
    Label6: TLabel;
    edFechaRML: TDateComboBox;
    tbHistCarpetas: TToolButton;
    sdqHistCarpetas: TSDQuery;
    dsHistCarpetas: TDataSource;
    fpHistCarpetas: TFormPanel;
    dbgHistCarpetas: TArtDBGrid;
    chbAnclarDatos: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbAgregarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure ExportDialogBeforeExport(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbTraerValoresClick(Sender: TObject);
    procedure btnReconfirmacionesClick(Sender: TObject);
    procedure tbQuitarClick(Sender: TObject);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbMoverClick(Sender: TObject);
    procedure tbMotivoEstudioClick(Sender: TObject);
    procedure tbHistCarpetasClick(Sender: TObject);
  private
    sDecodeTipoExamen : String;
    FEstudiosOK: Boolean;
    procedure OnfraEmpresaChange(Sender: TObject);
    procedure OnfraEstablecimientoChange(Sender: TObject);
    procedure OnfraEstudioChange(Sender: TObject);
    procedure OpenABM(ACuit: String; AEstableci: Integer; ACuil, AEstudio: String;
        AFecha: TDate; AIdEstab: Integer; ModoABM: TModoABM; const EsFrmPosForzada:
        Boolean = False);
    function  ValidarSeleccion( ModoABM : TModoABM ) : boolean;
    procedure SetHCValues(AForm : TFormEstudios; ModoABM : TModoABM);
  protected
    fraEmpresa: TfraEmpresa;
    fraTrabajador: TfraTrabajadorAMP;
  public
    property EstudiosOK: Boolean read FEstudiosOK write FEstudiosOK;
  end;

implementation

uses
  Windows, unPrincipal, unDMPrincipal, unHistoriaClinica,
  CustomDlgs, General, CUIT, Registros, unEstudiosDef,
  unEstAudiometria, unEstRespiratorio, unSegReconfirmaciones, AnsiSql,
  unMoverEstudio, unFraReconfirmacion, unMotivoEstudio,
  Consts, unEstExamPeriodORL, DateTimeFuncs, unEstIluminacion,
  unProtPosForzadas;

{$R *.DFM}

const
  COD_POSFORZA = '00000175';

procedure TfrmMoldeAbmAnalisis.FormCreate(Sender: TObject);
begin
  sDecodeTipoExamen     := '';

  fraEmpresa.MinLength  := 0 ;
  fraEmpresa.OnChange   := OnfraEmpresaChange;
  fraEmpresa.ShowBajas  := True;

  fraEstablecimiento.ShowBajas := True;
  fraEstablecimiento.OnChange  := OnfraEstablecimientoChange;

  fraTrabajador.MinLength       := 0;
  fraTrabajador.ShowBajas       := True;

  fraEstudio.OnChange           := OnfraEstudioChange;

  fraTipoEstudio.FrameOperativo := fraOperativo;

  edFecha.MinDate  := ART_MINFECHA;
  edFecha.MaxDate  := DBDateTime;

  edFechaRPrest.MinDate  := ART_MINFECHA;
  edFechaRPrest.MaxDate  := DBDateTime;

  edFechaRML.MinDate  := ART_MINFECHA;
  edFechaRML.MaxDate  := DBDateTime;

  fraPrestador.ShowBajas := true;
end;

procedure TfrmMoldeAbmAnalisis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmMoldeAbmAnalisis.tbAgregarClick(Sender: TObject);
var
  sSQL: string;
begin
      sSQL := 'SELECT  1 '
            + '  FROM  art.aet_estrab '
            + ' WHERE  et_cuit = :cuit'
            + '    AND et_estableci = :estab '
            + '    AND et_cuil = :cuil '
            + '    AND et_estudio = :estudio '
            + '    AND et_fecha = :fechaestudio'
            ;

  if not ExisteSqlEx(
        sSQL,
      [fraEmpresa.mskCUIT.Text,
        fraEstablecimiento.edCodigo.Text,
        fraTrabajador.CUIL,
        fraEstudio.edCodigo.Text,
        TDateTimeEx.Create(edFecha.Date)]) then
  begin

    if fraEstudio.Codigo = '' then
    begin
      MsgBox('Debe seleccionar un estudio para poder dar el alta', MB_ICONERROR);
      exit
    end;
    if fraEstudio.Codigo = COD_POSFORZA then
    begin
      {$IFNDEF RED_PRES}
      OpenABM(fraEmpresa.mskCUIT.Text,
              Self.fraEstablecimiento.edCodigo.Value,
              fraTrabajador.mskCUIL.Text,
              fraEstudio.edCodigo.Text,
              edFecha.Date,
              Self.fraEstablecimiento.IdEstablecimiento,
              maAdd,
              True );

      {$ENDIF}
    end
    else
    begin
      OpenABM(fraEmpresa.mskCUIT.Text,
              fraEstablecimiento.edCodigo.Value,
              fraTrabajador.mskCUIL.Text,
              fraEstudio.edCodigo.Text,
              edFecha.Date,
              fraEstablecimiento.IdEstablecimiento,
              maAdd );
    end;
  end else
  begin
    MessageDlg('Ya existe este estudio para el filtro solicitado.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmMoldeAbmAnalisis.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then Exit;

  OpenABM(sdqConsulta.FieldByName('ET_CUIT').AsString,
          sdqConsulta.FieldByName('ET_ESTABLECI').AsInteger,
          sdqConsulta.FieldByName('ET_CUIL').AsString,
          sdqConsulta.FieldByName('ET_ESTUDIO').AsString,
          sdqConsulta.FieldByName('ET_FECHA').AsDateTime,
          fraEstablecimiento.IdEstablecimiento,
          maUpdate, fraEstudio.Codigo = COD_POSFORZA);
end;

procedure TfrmMoldeAbmAnalisis.tbRefrescarClick(Sender: TObject);
Var Sql : String;
begin
  if sDecodeTipoExamen = '' Then
     sDecodeTipoExamen := GetDecodeFromCTB('ET_TIPO', 'TAMP');

  Sql := 'SELECT ET_PERIODO, ET_CUIT, MP_CONTRATO, MP_NOMBRE, ET_ESTABLECI, ' +
                'ET_CUIL, TJ_NOMBRE, ET_FECHA, ET_ESTUDIO, ES_DESCRIPCION, ET_DATOSADICESTUDIO, ' +
                'ET_RESULTADO, ET_TIPORES, ET_PRESTADOR, ES_FORMULARIO, ET_OBSERVACIONES, ' +
                'ET_TIPO, ET_REC_FECHA, ET_REC_ESTUDIO, ' + sDecodeTipoExamen + ' TIPO_EXAMEN, ' +
                'ET_FECHABAJA, ET_FECHARECPREST, ET_FECHARECML, ET_IDCARPETAAMP, ET_IDDETALLEARCHIVO, ' +
                'ET_FECHALTA, ET_USUALTA, et_id,ET_UNICOESTUDIO, '+
                '(SELECT DECODE(am_audnormal, ''S'', ''Normal'') || DECODE(am_audta, ''S'', ''Trauma acústico'') '+
                '     || DECODE(am_audinculp, ''S'', ''Inculpable'') '+
                '     || DECODE(am_audtasc, ''S'', ''Trauma acústico sin Incapacidad'') '+
                '   FROM art.aam_audiometria '+
                '  WHERE am_cuit = et_cuit '+
                '    AND am_estableci = et_estableci '+
                '    AND am_cuil = et_cuil '+
                '    AND am_fecha = et_fecha '+
                '    AND am_estudio = et_estudio) tipoaudiometria ' +
           'FROM AES_ESTUDIOS, CMP_EMPRESAS, CTJ_TRABAJADORES, AET_ESTRAB ' +
          'WHERE ES_CODIGO = ET_ESTUDIO ' +
            'AND ET_CUIT = MP_CUIT ' +
            'AND ET_CUIL = TJ_CUIL ';

  if (fraOperativo.edPeriodo.Text <> '') Then
    Sql := Sql + ' AND ET_PERIODO = ''' + fraOperativo.edPeriodo.Text + ''' ';

  if (fraEmpresa.mskCUIT.Text <> '') Then
    Sql := Sql + ' AND ET_CUIT = ''' + fraEmpresa.mskCUIT.Text + ''' ';

  if (fraEstablecimiento.edCodigo.Text <> '') Then
    Sql := Sql + ' AND ET_ESTABLECI = ''' + fraEstablecimiento.edCodigo.Text + ''' ';

  if (fraTrabajador.mskCUIL.Text <> '') Then
    Sql := Sql + ' AND ET_CUIL = ''' + fraTrabajador.mskCUIL.Text + ''' ';

  if (fraEstudio.edCodigo.Text <> '') Then
    Sql := Sql + ' AND ET_ESTUDIO = ''' + fraEstudio.edCodigo.Text + ''' ';

  if edFecha.IsValid Then
    Sql := Sql + ' AND ET_FECHA = ' + edFecha.SqlText + ' ';

  if edFechaRPrest.IsValid Then
    Sql := Sql + ' AND ET_FECHARECPREST = ' + edFechaRPrest.SqlText + ' ';

  if edFechaRML.IsValid Then
    Sql := Sql + ' AND ET_FECHARECML = ' + edFechaRML.SqlText + ' ';

  if fraTipoEstudio.IsSelected Then
    Sql := Sql + ' AND ET_TIPO = ''' + fraTipoEstudio.Value + ''' ';

  if fraPrestador.IsSelected Then
    Sql := Sql + ' AND ET_PRESTADOR = ''' + fraPrestador.edCodigo.Text + ''' ';

  if not tbVerEliminados.Down Then
    Sql := Sql + ' AND ET_FECHABAJA IS NULL ';

  OpenQuery(sdqConsulta, Sql + SortDialog.OrderBy);
end;

procedure TfrmMoldeAbmAnalisis.OnfraEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.CUIT;
  fraTrabajador.CUIT := fraEmpresa.CUIT;

  if not chbAnclarDatos.Checked then
  begin
    edFechaRPrest.Clear;
    edFechaRML.Clear;
    fraTipoEstudio.Clear;
    fraPrestador.Limpiar;
  end;
  edFecha.Clear;
  fraEstudio.Clear;
  fraOperativo.Clear;

  OnfraEstablecimientoChange(Sender);
end;

procedure TfrmMoldeAbmAnalisis.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMoldeAbmAnalisis.OnfraEstablecimientoChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;

procedure TfrmMoldeAbmAnalisis.tbLimpiarClick(Sender: TObject);
Var i : Integer;
begin
  fraOperativo.Limpiar;
  fraTrabajador.Clear;
  fraEmpresa.Clear ;
  fraEstablecimiento.Limpiar ;
  fraEstudio.Clear;
  edFecha.Clear;
  edFechaRPrest.Clear;
  edFechaRML.Clear;

  fraTipoEstudio.Clear ;
  fraPrestador.Limpiar ;

  chbAnclarDatos.Checked := false;

  sdqConsulta.Close;

  if fraOperativo.edPeriodo.CanFocus then
    fraOperativo.edPeriodo.SetFocus ;

  // Muestra las Columnas Ocultas de la Grilla
  for i := 0 to dbgDatos.Columns.Count -1 do
   dbgDatos.Columns[i].Visible := True ;

  // Muestra las Columnas Ocultas del QueryPrint
  for i := 0 to QueryPrint.Fields.Count -1 do
   QueryPrint.Fields[i].Visible := True;
end;

function TfrmMoldeAbmAnalisis.ValidarSeleccion( ModoABM : TModoABM ) : boolean;
begin
  Result := False ;

  if ( Trim( fraEmpresa.mskCUIT.Text ) = '' ) then
    InvalidMsg(fraEmpresa.mskCUIT, 'Se debe ingresar el CUIT de la empresa')

  else if ( Trim( fraEstablecimiento.edCodigo.Text ) = '' ) then
    InvalidMsg(fraEstablecimiento.edCodigo, 'Se debe ingresar el Establecimiento')

  else if ( Trim( fraTrabajador.mskCUIL.Text ) = '' ) then
    InvalidMsg(fraTrabajador.mskCUIL, 'Se debe ingresar el CUIL del trabajador')

  else if ( Trim( fraEstudio.edCodigo.Text ) = '' ) then
    InvalidMsg(fraEstudio.edCodigo, 'Se debe seleccionar un Estudio')

  //tkt
  else if (fraOperativo.edPeriodo.Periodo.Ano >= 2008) and edFechaRPrest.IsEmpty Then
    InvalidMsg( edFechaRPrest, 'Debe seleccionar la fecha de recep. del Prestador')

  else if (fraOperativo.edPeriodo.Periodo.Ano >= 2008) and edFechaRML.IsEmpty Then
    InvalidMsg( edFechaRML, 'Debe seleccionar la fecha de recep. de ML')

(*
  else if (YearOf(edFecha.Date) = YearOf(Date)) and edFechaRPrest.IsEmpty Then
    InvalidMsg( edFechaRPrest, 'Debe seleccionar la fecha de recep. del Prestador')

  else if (YearOf(edFecha.Date) = YearOf(Date)) and edFechaRML.IsEmpty Then
    InvalidMsg( edFechaRML, 'Debe seleccionar la fecha de recep. de ML')
*)

  else if edFecha.IsEmpty Then
    InvalidMsg( edFecha, 'Debe seleccionar la fecha del estudio')

  else if trim(fraTipoEstudio.Value) = '' Then
    InvalidMsg( fraTipoEstudio, 'Debe indicar el tipo de estudio')

  else if (Trim(fraOperativo.edPeriodo.Text) = '') and
          (ModoABM = maAdd) and
          (fraTipoEstudio.Value = 'EP') Then
    InvalidMsg( fraOperativo, 'Debe indicar el operativo')

  else if (ModoABM in [maUpdate, maDelete])  and
          ((not sdqConsulta.Active) or sdqConsulta.FieldByName('ET_FECHA').IsNull) then
    MsgBox('No hay historias clínicas seleccionadas', MB_ICONERROR)

  else if (ModoABM = maAdd) and
          (fraTipoEstudio.Value = 'EP') and
          ExisteSql('SELECT 1 FROM AET_ESTRAB ' +
                    ' WHERE ET_CUIT = ' + SqlValue(fraEmpresa.mskCUIT.Text) +
                    '   AND ET_ESTABLECI = ' + SqlValue(fraEstablecimiento.edCodigo.Text) +
                    '   AND ET_CUIL = ' + SqlValue(fraTrabajador.mskCUIL.Text) +
                    '   AND ET_PERIODO = ' + SqlValue(fraOperativo.edPeriodo.Text) +
                    '   AND ET_TIPO = ' + SqlValue(fraTipoEstudio.Codigo) +
                    '   AND ET_FECHABAJA IS NULL ' +
                    '   AND ET_ESTUDIO = ' + SqlValue(fraEstudio.edCodigo.Text)) Then
         MsgBox('Ya existe un(a) "' + fraEstudio.cmbDescripcion.Text + '" para este CUIT-CUIL-ESTAB-OPERATIVO', MB_ICONERROR)

  else if (ModoABM = maAdd) and
          (fraTipoEstudio.Value = 'EP') and
          ExisteSql('SELECT 1 FROM AET_ESTRAB ' +
                    ' WHERE ET_CUIT = ' + SqlValue(fraEmpresa.mskCUIT.Text) +
                    '   AND ET_ESTABLECI = ' + SqlValue(fraEstablecimiento.edCodigo.Text) +
                    '   AND ET_CUIL = ' + SqlValue(fraTrabajador.mskCUIL.Text) +
                    '   AND ET_FECHA = ' + SqlDate(edFecha.Date) +
                    '   AND ET_TIPO = ' + SqlValue(fraTipoEstudio.Codigo) +
                    '   AND ET_ESTUDIO = ' + SqlValue(fraEstudio.edCodigo.Text)) Then
         MsgBox('Ya existe un(a) "' + fraEstudio.cmbDescripcion.Text + '" para este CUIT-CUIL-ESTAB en la fecha indicada.', MB_ICONERROR)

  else if not (fraPrestador.IsSelected) then
    InvalidMsg(fraPrestador.edCodigo, 'Se debe ingresar el Prestador')

  else
    if (ModoABM = maAdd) and
      (fraTipoEstudio.Value = 'EP') and
      (Copy(fraOperativo.edPeriodo.Text, 1, 4) >= '2008') and
      not ExisteSqlEx('SELECT 1 ' +
                      '  FROM comunes.ctj_trabajador, ' +
                      '       afi.aem_empresa, ' +
                      '       hys.hle_loteestudio, ' +
                      '       hys.hrl_relevamientolote, ' +
                      '       hys.hel_estadolote, ' +
                      '       hys.hdl_detallelote ' +
                      ' WHERE tj_id = dl_idtrabajador ' +
                      '   AND em_id = dl_idempresa ' +
                      '   AND le_id = el_idlote ' +
                      '   AND rl_id = el_rlid ' +
                      '   AND rl_idestableci = dl_idestableci ' +
                      '   AND el_idlote = dl_idlote ' +
                      '   AND em_cuit = :pcuit ' +
                      '   AND rl_nroestableci = :pestableci ' +
                      '   AND tj_cuil = :pcuil ' +
                      '   AND dl_idestudio = :pestudio ' +
                      '   AND dl_fecharealizacion IS NOT NULL ' +
                      '   AND    EXTRACT (YEAR FROM le_fechaalta) ' +
                      '       || DECODE (el_operativo, ''A'', ''01'', ''S'', ''06'', '''') = :poperativo ',
                      [fraEmpresa.mskCUIT.Text,
                       fraEstablecimiento.edCodigo.Text,
                       fraTrabajador.mskCUIL.Text,
                       fraEstudio.edCodigo.Text,
                       fraOperativo.edPeriodo.Text]) then
      Result := MsgBox('No existe un lote que contenga al estudio para este CUIT-CUIL-ESTAB-OPERATIVO.' + #13 +
                       'Desea cargarlo igualmente?', MB_ICONWARNING + MB_YESNO) = mrYes

  else
    Result := True;

  if (ModoABM = maAdd) and
    (fraTipoEstudio.Value = 'EP') and
    ExisteSqlEx('SELECT 1 ' +
                '  FROM hys.hle_loteestudio ' +
                ' WHERE le_id = art.amp.get_ultimolote_no_anulado (:pidestableci) ' +
                '   AND TRUNC (le_fechaalta) > ' + SqlDate(edFecha.Date),
                [fraEstablecimiento.Value]) then
   MsgBox('La fecha del estudio es anterior a la fecha del último lote asignado.' + #13 +
          'Verifique si es correcta antes de proceder.', MB_ICONWARNING)
end;

procedure TfrmMoldeAbmAnalisis.dbgDatosDblClick(Sender: TObject);
begin
  if tbModificar.Enabled and sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    tbModificarClick( Nil );
end;

procedure TfrmMoldeAbmAnalisis.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute ;
end;

procedure TfrmMoldeAbmAnalisis.tbExportarClick(Sender: TObject);
begin
  if (not sdqConsulta.IsEmpty) then
    ExportDialog.Execute ;
end;

procedure TfrmMoldeAbmAnalisis.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown ;
end;

procedure TfrmMoldeAbmAnalisis.ExportDialogBeforeExport(Sender: TObject);
begin
  if not sdqConsulta.Active then
    tbRefrescarClick( Nil );
end;

procedure TfrmMoldeAbmAnalisis.OnfraEstudioChange(Sender: TObject);
begin
  if ( fraOperativo.edPeriodo.Text <> '' ) and
     ( fraEmpresa.mskCUIT.Text <> '' ) and
     ( fraEstablecimiento.edCodigo.Text <> '' ) and
     ( fraTrabajador.mskCUIL.Text <> '' ) and
     ( fraEstudio.edCodigo.Text <> '' ) then
    tbRefrescarClick( Nil );
end;

procedure TfrmMoldeAbmAnalisis.mnuImpResultadosClick(Sender: TObject);
begin
  if (not sdqConsulta.IsEmpty) and PrintDialog.Execute then begin
    QueryPrint.SubTitle.Lines.Clear ;
    QueryPrint.SubTitle.Lines.Add('');
    if (fraOperativo.edPeriodo.Text <> '') Then
      QueryPrint.SubTitle.Lines.Add('Operativo         : ' + fraOperativo.edPeriodo.Periodo.Valor + ' - ' + fraOperativo.cmbDescripcion.Text );

    if fraEmpresa.mskCUIT.Text <> '' Then
    begin
      QueryPrint.SubTitle.Lines.Add('Empresa    CUIT   : ' + PonerGuiones(fraEmpresa.mskCUIT.Text) ) ;
      QueryPrint.SubTitle.Lines.Add('           Cont.  : ' + fraEmpresa.edContrato.Text ) ;
      QueryPrint.SubTitle.Lines.Add('           R.Soc. : ' + fraEmpresa.cmbRSocial.Text );
    end;

    if fraEstablecimiento.edCodigo.Text <> '' Then
      QueryPrint.SubTitle.Lines.Add('Establecimiento   : ' + fraEstablecimiento.edCodigo.Text );

    if fraTrabajador.mskCUIL.Text <> '' Then
    begin
      QueryPrint.SubTitle.Lines.Add('Trabajador CUIL   : ' + PonerGuiones(fraTrabajador.mskCUIL.Text) );
      QueryPrint.SubTitle.Lines.Add('           Nombre : ' + fraTrabajador.cmbNombre.Text );
    end;

    if fraEstudio.edCodigo.Text <> '' Then
    begin
      QueryPrint.SubTitle.Lines.Add('Estudio    Código : ' + fraEstudio.edCodigo.Text );
      QueryPrint.SubTitle.Lines.Add('           Descr. : ' + fraEstudio.cmbDescripcion.Text );
    end;

    QueryPrint.SubTitle.Lines.Add('');
    QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
    QueryPrint.Print ;
  end;
end;

procedure TfrmMoldeAbmAnalisis.tbTraerValoresClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty Then
  begin
    fraEmpresa.CUIT := sdqConsulta.FieldByName('ET_CUIT').AsString;
    fraEstablecimiento.Cargar( sdqConsulta.FieldByName('ET_CUIT').AsString, sdqConsulta.FieldByName('ET_ESTABLECI').AsString );
    fraTrabajador.CUIL := sdqConsulta.FieldByName('ET_CUIL').AsString;
    fraEstudio.Codigo := sdqConsulta.FieldByName('ET_ESTUDIO').AsString;
    edFecha.Date := sdqConsulta.FieldByName('ET_FECHA').AsDateTime;
    edFechaRPrest.Date := sdqConsulta.FieldByName('ET_FECHARECPREST').AsDateTime;
    edFechaRML.Date := sdqConsulta.FieldByName('ET_FECHARECml').AsDateTime;
    fraTipoEstudio.Value := sdqConsulta.FieldByName('ET_TIPO').AsString;
    fraOperativo.Cargar( sdqConsulta.FieldByName('ET_PERIODO').AsString );
    fraPrestador.Cargar( sdqConsulta.FieldByName('ET_PRESTADOR').AsString );
  end;
end;

procedure TfrmMoldeAbmAnalisis.OpenABM(ACuit: String; AEstableci: Integer;
    ACuil, AEstudio: String; AFecha: TDate; AIdEstab: Integer; ModoABM:
    TModoABM; const EsFrmPosForzada: Boolean = False);
Var
  FormEstudios : TFormEstudios;
  sForm        : String;
  frmProtPosForzadas: TfrmProtPosForzadas;
begin
  if ModoABM = maAdd Then
    sForm := fraEstudio.sdqDatos.FieldByName('ES_FORMULARIO').AsString
  else
    sForm := sdqConsulta.FieldByName('ES_FORMULARIO').AsString ;

  if (ModoABM <> maAdd) or ValidarSeleccion(ModoABM) Then
  begin
    Case ArrayPos(sForm, ['HC', 'AUDIO', 'RESP', 'ILUMI', 'ORL']) OF
      0: begin
          FormEstudios := TfrmHistoriaClinica.Create( Self );
          SetHCValues( FormEstudios, ModoABM );
         end;
      1: FormEstudios := TfrmEstAudiometria.Create( Self );
      2: FormEstudios := TfrmEstRespiratorio.Create( Self );
      3: begin
            FormEstudios := TfrmEstIluminacion.Create(Self);
            with (FormEstudios as TfrmEstIluminacion) do
            begin
              Modo := ModoABM;
              if ModoABM <> maAdd then
                AETID := sdqConsulta.FieldByName('et_id').AsInteger;
            end;
         end;
      4: begin
            FormEstudios := TfrmEstExamenORL.Create(Self);
            with (FormEstudios as TfrmEstExamenORL) do
            begin
              Modo := ModoABM;
              if ModoABM <> maAdd then
                AETID := sdqConsulta.FieldByName('et_id').AsInteger;
            end;
         end;
      else
        FormEstudios := TfrmEstudioDef.Create( Self );

    end;

    With FormEstudios do
      Try
        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
        with DatosEstudio do
        begin
          if ModoABM = maAdd Then begin
            Resultado      := 0;
            ResNormal      := True;
            Prestador      := fraPrestador.edCodigo.Text ;
            Periodo        := fraOperativo.edPeriodo.Text;
            Tipo           := fraTipoEstudio.Value ;
            Reconfirmacion := unFraReconfirmacion.Reconfirmacion( 0, '', 0);
            FechaRecPrest  := edFechaRPrest.Date;
            FechaRecML     := edFechaRML.Date;
            Observaciones  := '';
            AdicEst        := '';
            IDCarpetaAMP   := 0;
            IDDetalleArchivo:= 0;

            // Puede tener carpeta cierta pendiente
            CarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                            '  FROM hys.hce_carpetaestamp ' +
                                            ' WHERE ce_cuit = :cuit ' +
                                            '   AND ce_estableci = :estableci ' +
                                            '   AND ce_cuil = :cuil ' +
                                            '   AND ce_operativo = :periodo ' +
                                            '   AND ce_pendiente = ''S'' ',
                                            [ACuit,
                                             AEstableci,
                                             ACuil,
                                             fraOperativo.edPeriodo.Text]);

            if not CarpetaPendiente then
              // Puede tener una carpeta, pero está pendiente de definir cuál es
              CarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                              '  FROM rcastro.hhcc ' +
                                              ' WHERE cuit = :cuit ' +
                                              '   AND estableci = :estableci ' +
                                              '   AND cuil = :cuil ' +
                                              '   AND periodo = :periodo ' +
                                              '   AND carpeta IS NULL ' +
                                              '   AND pendiente = ''S'' ',
                                              [ACuit,
                                               AEstableci,
                                               ACuil,
                                               fraOperativo.edPeriodo.Text])
          end
          else begin
            if sdqConsulta.FieldByName('ET_RESULTADO').IsNull Then
              Resultado := -1
            else
              Try
                Resultado := sdqConsulta.FieldByName('ET_RESULTADO').AsCurrency;
              Except
                On E: Exception do
                  ErrorMsg( E, 'Error con el Tipo de dato del Resultado' + #13 + 'Verifique el resultado del estudio, porque seguramente este mal cargado');
              end;

            EstudioUnico   := sdqConsulta.FieldByName('ET_UNICOESTUDIO').AsString;
            ResNormal      := sdqConsulta.FieldByName('ET_TIPORES').AsString = 'N';
            Prestador      := sdqConsulta.FieldByName('ET_PRESTADOR').AsString;
            Periodo        := sdqConsulta.FieldByName('ET_PERIODO').AsString;
            Tipo           := sdqConsulta.FieldByName('ET_TIPO').AsString;
            Observaciones  := sdqConsulta.FieldByName('ET_OBSERVACIONES').AsString;
            AdicEst        := sdqConsulta.FieldByName('ET_DATOSADICESTUDIO').AsString;;
            Reconfirmacion := unFraReconfirmacion.Reconfirmacion( sdqConsulta.FieldByName('ET_REC_FECHA').AsDateTime,
                                                                  sdqConsulta.FieldByName('ET_REC_ESTUDIO').AsString,
                                                                  sdqConsulta.FieldByName('ET_IDCARPETAAMP').AsInteger);
            if sdqConsulta.FieldByName('ET_FECHARECPREST').IsNull then
              FechaRecPrest:= edFechaRPrest.Date
            else
              FechaRecPrest:= sdqConsulta.FieldByName('ET_FECHARECPREST').AsDateTime;

            if sdqConsulta.FieldByName('ET_FECHARECml').IsNull then
              FechaRecML:= edFechaRML.Date
            else
              FechaRecML:= sdqConsulta.FieldByName('ET_FECHARECml').AsDateTime;

            IDCarpetaAMP := sdqConsulta.FieldByName('et_idcarpetaamp').AsInteger;
            IDDetalleArchivo := sdqConsulta.FieldByName('et_iddetallearchivo').AsInteger;

            if IDCarpetaAMP <> 0 then
              // Tiene carpeta cierta
              CarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                              '  FROM hys.hce_carpetaestamp ' +
                                              ' WHERE ce_pendiente = ''S'' ' +
                                              '   AND ce_id = :idcarpeta ',
                                              [IDCarpetaAMP])
            else
              // Puede tener una carpeta, pero está pendiente de definir cuál es
              CarpetaPendiente := ExisteSqlEx('SELECT 1 ' +
                                              '  FROM rcastro.hhcc ' +
                                              ' WHERE cuit = :cuit ' +
                                              '   AND estableci = :estableci ' +
                                              '   AND cuil = :cuil ' +
                                              '   AND periodo = :periodo ' +
                                              '   AND carpeta IS NULL ' +
                                              '   AND pendiente = ''S'' ',
                                              [ACuit,
                                               AEstableci,
                                               ACuil,
                                               sdqConsulta.FieldByName('ET_PERIODO').AsString])
          end;

          if CarpetaPendiente and
             (MsgBox ('La carpeta para este CUIT-ESTAB-CUIL-PERIODO está pendiente de revisión. ' +
                      'Desea continuar?', MB_ICONQUESTION + MB_YESNO) <> mrYes) then
            Exit;
        end;

        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
        With ClaveEstudio do begin
          Cuit      := ACuit;
          Estableci := AEstableci;
          Cuil      := ACuil;
          Fecha     := AFecha;
          Estudio   := AEstudio;
          IdEstab   := AIdEstab;
        end;
        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }

        if not EsFrmPosForzada then
        begin
          if Execute( ModoABM ) Then begin
            if ModoABM = maAdd Then
            begin
              tbRefrescarClick( Nil );
              FEstudiosOK := True;
            end else
            begin
              RefreshAndLocate(sdqConsulta, ['ET_CUIT', 'ET_ESTABLECI', 'ET_FECHA', 'ET_CUIL'],
                                            [ClaveEstudio.CUIT,
                                             ClaveEstudio.Estableci,
                                             ClaveEstudio.Fecha,
                                             ClaveEstudio.CUIL]);
              FEstudiosOK := False;
            end;
          end;
        end else
        begin
          try
            frmProtPosForzadas := TfrmProtPosForzadas.Create(Self);
            frmProtPosForzadas.DesdeHistClinic := True;
            frmProtPosForzadas.DatosEstudio := DatosEstudio;
            frmProtPosForzadas.ClaveEstudio := ClaveEstudio;
            frmProtPosForzadas.fraTrabajadorFiltro.CUIL := ClaveEstudio.CUIL;
            frmProtPosForzadas.fraEmpresaFiltro.Contrato := fraEmpresa.Contrato;
            frmProtPosForzadas.fraEstablecimientoFiltro.IdEmpresa :=
                ValorSqlEx(
                    'SELECT  em_id FROM  afi.aem_empresa WHERE  em_cuit = :cuit',
                    [ClaveEstudio.CUIT]
                );
            frmProtPosForzadas.fraEstablecimientoFiltro.Codigo := IntToStr(ClaveEstudio.Estableci);
            frmProtPosForzadas.edFechaFiltro.Date := ClaveEstudio.Fecha;
            frmProtPosForzadas.tbRefrescar.Click;
            if ModoABM = maUpdate then
            begin
              frmProtPosForzadas.ModoAlta := False;
              frmProtPosForzadas.tbModificar.Click;
            end else
            begin
              frmProtPosForzadas.ModoAlta := True;
              frmProtPosForzadas.tbNuevo.Click;
            end;

            if frmProtPosForzadas.ProtPosOK then
              FEstudiosOK := True;

          finally
            FreeAndNil(frmProtPosForzadas);
          end;
        end;
      Finally
        Free;
      End;
  end;
end;

procedure TfrmMoldeAbmAnalisis.SetHCValues(AForm: TFormEstudios; ModoABM : TModoABM);
begin
  with TfrmHistoriaClinica(AForm) do
    if ModoABM = maAdd Then
    begin
      pnlCUIT.Caption             := PonerGuiones(fraEmpresa.mskCUIT.Text) ;
      pnlRSocial.Caption          := fraEmpresa.cmbRSocial.Text ;
      pnlContrato.Caption         := fraEmpresa.edContrato.Text ;
      pnlEstableciCodigo.Caption  := fraEstablecimiento.edCodigo.Text ;
      pnlEstableciDesc.Caption    := fraEstablecimiento.cmbDescripcion.Text ;
      pnlFecha.Caption            := edFecha.Text ;
      pnlFechaText.Caption        := edFecha.LongDate;
      pnlCUIL.Caption             := PonerGuiones(fraTrabajador.mskCUIL.Text) ;
      pnlNombre.Caption           := fraTrabajador.cmbNombre.Text ;
      
    end
    else begin
      pnlCUIT.Caption             := PonerGuiones(sdqConsulta.FieldByName('ET_CUIT').AsString) ;
      pnlRSocial.Caption          := sdqConsulta.FieldByName('MP_NOMBRE').AsString ;
      pnlContrato.Caption         := sdqConsulta.FieldByName('MP_CONTRATO').AsString ;
      pnlEstableciCodigo.Caption  := sdqConsulta.FieldByName('ET_ESTABLECI').AsString ;
      pnlEstableciDesc.Caption    := ValorSql('SELECT ST_NOMBRE FROM CST_ESTABLECI ' +
                                               'WHERE ST_CUIT = ''' + sdqConsulta.FieldByName('ET_CUIT').AsString + ''' ' +
                                                 'AND ST_CLAVE = 0' + sdqConsulta.FieldByName('ET_ESTABLECI').AsString );
      pnlFecha.Caption            := sdqConsulta.FieldByName('ET_FECHA').AsString ;
      pnlFechaText.Caption        := DateFormat(sdqConsulta.FieldByName('ET_FECHA').AsDateTime, dfLong );
      pnlCUIL.Caption             := PonerGuiones(sdqConsulta.FieldByName('ET_CUIL').AsString) ;
      pnlNombre.Caption           := sdqConsulta.FieldByName('TJ_NOMBRE').AsString ;
    end;
end;

procedure TfrmMoldeAbmAnalisis.btnReconfirmacionesClick(Sender: TObject);
begin
  if fraTrabajador.IsSelected Then
    with TfrmSegReconfirmaciones.Create( Self ) do
      Try
        ShowFixed( Self.fraTrabajador.CUIL ); {NO SACAR EL SELF!!}
      Finally
        Free;
      End;
end;

procedure TfrmMoldeAbmAnalisis.tbQuitarClick(Sender: TObject);
Var Sql : TSql;
begin
  if sdqConsulta.IsEmpty then Exit;

  if MsgBox('Se dispone a eliminar el estudio.' + #13 + #10 + '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES Then begin
    Sql := TSql.Create('AET_ESTRAB');
    Try
      Sql.PrimaryKey.Add( 'ET_CUIT',      sdqConsulta.FieldByName('ET_CUIT').AsString );
      Sql.PrimaryKey.Add( 'ET_ESTABLECI', sdqConsulta.FieldByName('ET_ESTABLECI').AsInteger );
      Sql.PrimaryKey.Add( 'ET_CUIL',      sdqConsulta.FieldByName('ET_CUIL').AsString );
      Sql.PrimaryKey.Add( 'ET_FECHA',     sdqConsulta.FieldByName('ET_FECHA').AsDateTime );
      Sql.PrimaryKey.Add( 'ET_ESTUDIO',   sdqConsulta.FieldByName('ET_ESTUDIO').AsString );
      Sql.Fields.Add( 'ET_USUBAJA',       frmPrincipal.DBLogin.UserID );
      Sql.Fields.Add( 'ET_FECHABAJA',     SQL_ACTUALDATE, False );

      EjecutarSql( Sql.UpdateSql );
      sdqConsulta.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmMoldeAbmAnalisis.dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('ET_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmMoldeAbmAnalisis.tbMoverClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty Then
    InvalidMsg( Nil, 'Debe seleccionar un estudio para poder moverlo')
  else begin
    With TfrmMoverEstudio.Create( Self ) do
      try
        if Execute( sdqConsulta.FieldByName('ET_CUIT').AsString,
                    sdqConsulta.FieldByName('ET_ESTABLECI').AsInteger,
                    sdqConsulta.FieldByName('ET_CUIL').AsString,
                    sdqConsulta.FieldByName('ET_FECHA').AsDateTime,
                    sdqConsulta.FieldByName('ET_ESTUDIO').AsString ) Then
          sdqConsulta.Refresh ;
      finally
        Free;
      end;
   end;
end;

procedure TfrmMoldeAbmAnalisis.tbMotivoEstudioClick(Sender: TObject);
Var
  frmMotivoEstudio : TfrmMotivoEstudio;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty Then begin
    frmMotivoEstudio := TfrmMotivoEstudio.Create( Self );
    try
      frmMotivoEstudio.Execute( sdqConsulta.FieldByName('ET_CUIT').AsString,
                                sdqConsulta.FieldByName('ET_ESTABLECI').AsInteger,
                                sdqConsulta.FieldByName('ET_CUIL').AsString,
                                sdqConsulta.FieldByName('ET_ESTUDIO').AsString,
                                sdqConsulta.FieldByName('ET_FECHA').AsDateTime );
    finally
      frmMotivoEstudio.Free;
    end;
  end;
end;

procedure TfrmMoldeAbmAnalisis.tbHistCarpetasClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then Exit;

  sdqHistCarpetas.Close;
  sdqHistCarpetas.ParamByName('pid').Value := sdqConsulta.FieldByName('et_id').AsInteger;
  sdqHistCarpetas.Open;

  fpHistCarpetas.ShowModal;

  sdqHistCarpetas.Close;
end;

end.
