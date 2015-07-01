unit unListSeguimientoMedico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, ToolEdit, unArtFrame, unFraCodigoDescripcion,
  unfraDelegacion, DateComboBox, SinEdit, unfraPrestador, unFraCodDesc,
  unArtDBAwareFrame, unArtDbFrame, unFraGrupoTrabajo, unPropiedadesFrame,
  sqlfuncs, dbsql, vclextra, Buttons, RxToolEdit, RxPlacemnt;

type
  TDatosAcciones = record
    ID            :integer;
    Descripcion   :string[250];
    TextoEvol     :string[250];
    ExigeTexto    :string[1];
    GeneraEvol    :string[1];
  end;


  TfrmListSeguimientoMedico = class(TfrmCustomGridABM)
    GroupBox3: TGroupBox;
    dcSinDesde: TDateComboBox;
    dcSinHasta: TDateComboBox;
    rgOpciones: TRadioGroup;
    gbTexto: TGroupBox;
    edTextoTabla: TEdit;
    edTexto: TMemo;
    Label3: TLabel;
    edSiniestroABM: TSinEdit;
    Bevel1: TBevel;
    Label4: TLabel;
    edTrabajadorABM: TEdit;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    GroupBox6: TGroupBox;
    cmbEstado: TComboBox;
    gbPrestadorCabecera: TGroupBox;
    fraPrestadorCabecera: TfraPrestador;
    gbGTrabajo: TGroupBox;
    gbDelegacion: TGroupBox;
    fraDelegacion: TfraDelegacion;
    gbTipoUsuario: TGroupBox;
    rbMedico: TRadioButton;
    rbAdministrativo: TRadioButton;
    cmbAcciones: TArtComboBox;
    sdqAcciones: TSDQuery;
    dsAcciones: TDataSource;
    gbCIE10: TGroupBox;
    fraCIE10: TfraCodDesc;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    Label8: TLabel;
    gbUsuarios: TGroupBox;
    fraUsuarios: TfraCodigoDescripcion;
    tbAccionRealizada: TToolButton;
    tbVerObservaciones: TToolButton;
    fpVerObservaciones: TFormPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    btnCerrar: TButton;
    edVerSiniestro: TSinEdit;
    MemoVerObservParte: TMemo;
    fpBajaSeguimiento: TFormPanel;
    Bevel3: TBevel;
    lblMotivo: TLabel;
    btnMotivoBajaCancelar: TButton;
    mObservaciones: TMemo;
    fraMotivos: TfraCodigoDescripcion;
    btnMotivoBajaAceptar: TButton;
    fpAccSolicitadas: TFormPanel;
    Bevel4: TBevel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    dsAccSolicitadas: TDataSource;
    tbAccionesSol: TToolButton;
    sdqAccionesSolicitadas: TSDQuery;
    GroupBox1: TGroupBox;
    seAccionesSeg: TSinEdit;
    edNombreTraba: TEdit;
    btnBuscar: TButton;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dcFRealiDesde: TDateComboBox;
    dcFRealiHasta: TDateComboBox;
    gbAccion: TGroupBox;
    cmbAccion: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure rgOpcionesClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure rbAdministrativoClick(Sender: TObject);
    procedure rbMedicoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbVerObservacionesClick(Sender: TObject);
    procedure tbAccionRealizadaClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalir3Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure fpVerObservacionesBeforeShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnMotivoBajaAceptarClick(Sender: TObject);
    procedure tbAccionesSolClick(Sender: TObject);
    procedure seAccionesSegSelect(Sender: TObject);
    procedure fpAccSolicitadasShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
  private
    DatosAcciones : Array of TDatosAcciones;
    procedure DoCargarABM;
    procedure DoHabilitarColumnasAccion; // TK 4813 (arreglos generales)
    procedure DoAccionRealizada(iAS_ID:Integer);          // Lu TK 1189
    function EsAccionRealizada(iAS_ID:Integer):boolean;   // Lu TK 1189
    function ValidarFiltros:boolean;
    function EsTercerPedEvolSinEvol:boolean; // Lu TK 4715
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure DoInsertarAccion;
    procedure DoInsertarEvolutivo(sTipoParte :String);
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmListSeguimientoMedico: TfrmListSeguimientoMedico;

implementation

uses unSesion, AnsiSql, unDmPrincipal, Strfuncs, CustomDlgs, unFiltros,
  General, unCustomConsulta, unPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.FormCreate(Sender: TObject);
begin
  inherited;

  tbAccionRealizada.ImageIndex := 40;
  tbSalir2.ImageIndex          := 8;
  sdqAcciones.Open;
  DoCargarABM;
  ShowActived     := False;
  cmbAccion.ItemIndex := 0;
  DoHabilitarColumnasAccion;
  with fraUsuarios do
  begin
    ShowBajas   := False;
    TableName   := 'USE_USUARIOS';
    FieldID     := 'SE_USUARIO';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    Sql         := 'SELECT DISTINCT se_usuario as id, se_usuario as codigo, ' +
                         ' se_nombre as descripcion, se_fechabaja as baja ' +
                    ' FROM cpu_prestadorusuario, use_usuarios ' +
                   ' WHERE pu_usuario = se_usuario ' +
                     ' AND pu_fechabaja IS NULL ' +
                     ' AND se_fechabaja IS NULL';
  end;

  gbAccion.Enabled         := False;
  tbAccionRealizada.Enabled  := False;  // Lu Tk 1189
  tbVerObservaciones.Enabled := False;  // TK 18360
  tbAccionesSol.Enabled  := False;
  tbModificar.Enabled        := True;
  LockControl(MemoVerObservParte, true);  // TK 18360
  tbAccionesSol.Left := tbAccionesSol.Left;
  tbAccionesSol.ImageIndex := 41;
  vclextra.LockControl(edNombreTraba, true);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
  bAdmin :Boolean;
  //Columna: TColumn;
begin
  bAdmin := (rbAdministrativo.Checked) or ((not dcFRealiDesde.IsEmpty) or (not dcFRealiHasta.IsEmpty));

  if ValidarFiltros then
  begin

    sSql := 'SELECT ex_id, utiles.armar_siniestro(ex_siniestro,ex_orden,ex_recaida) siniestro, ' +
                  ' NVL(ex_fecharecaida, ex_fechaaccidente) fecha, utiles.armar_cuit(ex_cuit) cuit, ' +
                  ' utiles.armar_cuit(ex_cuil) cuil, tj_nombre, ex_bajamedica, ex_diagnostico, ' +
                  ' ex_diagnosticooms, dg_descripcion diagnostico, ex_fechaalta, tc_descripcion gravedad, ' +
                  ' varios.get_nombredelegacion(ex_delegacion) delegacion, ' +
                  ' amebpba.get_nombregtrabajo(ex_gtrabajo) gtrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR, ' +
                  ' ca_identificador, ca_descripcion, ca_codarea || '' '' || ca_telefono ca_telefono, pv_nroparte, ' +
                  ' pv_observaciones, sa_ultimaestimacion, sa_cie10inicial, ' +
                  ' dg_id, tc_id, ex_siniestro, ex_orden, ex_recaida, ' +
                  ' sa_cantfkt, sa_cirugia, ex_delegacion, ' +
                  IIF(bAdmin, 'as_idmotivobaja ', 'TO_Number(Null)') + ' as as_idmotivobaja, ' +
                  IIF(bAdmin, 'as_fechabaja ', 'To_Date(Null)') + ' as as_fechabaja, ' +
                  IIF(bAdmin, 'as_usubaja ', 'Null') + ' as as_usubaja, ' +
                  IIF(bAdmin, 'ms_descripcion ', 'Null') + ' as ms_descripcion, ' +
                  IIF(bAdmin, 'as_fechaalta ', 'To_Date(Null)') + ' as as_fechaalta, ' +
                  IIF(bAdmin, 'as_fecharealizada ', 'To_Date(Null)') + ' as as_fecharealizada, ' +   // Lu TK 1189
                  IIF(bAdmin, 'as_usurealizada ', 'Null') + ' as as_usurealizada, ' +
                  IIF(bAdmin, 'as_id ', '0') + ' as as_id, ' +
                  IIF(bAdmin, 'ta_descripcion || '': '' || as_observmedico ', 'Null') + ' as DescAccion, ' +
                  IIF(bAdmin, 'as_observmedico ', 'Null') + ' as as_observmedico, ' +
                  IIF(bAdmin, 'as_observadministrativo ', 'Null') + ' as_observadministrativo ' +  // TK 18360
            ' FROM cdg_diagnostico, ctj_trabajador, sex_expedientes, ' +
                 ' ssa_siniestrossinalta, cpr_prestador, ' +
                 ' sin.stc_tipogravedad_cie10, spv_parteevolutivo ' +
                 IIF(bAdmin, ' ,sin.sas_accionesseguimiento, sin.sta_tipoaccionseguim ', '') +
                 IIF(bAdmin, ' ,sin.sms_motivosbajaseguimiento ', '') +
           ' WHERE sa_idexpediente = ex_id ' +
             ' AND ex_cuil = tj_cuil ' +
             ' AND ex_gravedadcie10 = tc_codigo(+) ' +
             ' AND ex_diagnosticooms = dg_codigo(+) ' +
             ' AND ex_prestador = ca_identificador(+) ' +
             ' AND sa_idexpediente = pv_idexpediente(+) ' +
             ' AND sa_ultimoevo = pv_nroparte(+) ' +
             ' AND (sa_fechaultcit IS NULL OR sa_fechaultcit < art.actualdate) ' +
             ' AND (sa_fechasolaudi IS NULL OR sa_fechasolaudi < art.actualdate-7) ' ;

    if bAdmin then
    begin
      sSql := sSql + ' AND as_idexpediente = ex_id ' +
                     //' AND as_fechabaja IS NULL ' +
                     ' AND as_idaccion = ta_id ' +
                     ' and as_idmotivobaja=ms_id(+) ';
                   //  ' AND as_fechaalta > (actualdate - 7) ';

      {Insert(', as_idmotivobaja, as_fechabaja, as_usubaja, ms_descripcion, as_fechaalta, as_fecharealizada, as_usurealizada, ' +
             'as_id, ta_descripcion || '': '' || as_observmedico descaccion, as_observmedico, as_observadministrativo ', sSql,
             Pos('FROM', sSql) - 1);

      Insert(' ,sin.sas_accionesseguimiento, sin.sta_tipoaccionseguim, sin.sms_motivosbajaseguimiento ', sSql, Pos('WHERE', sSql) - 1);}

    end;

    if not(edSiniestro.IsEmpty) then
      sSql := sSql + ' AND ex_id = siniestro.get_idexpediente(' +
                                      SqlInt(edSiniestro.Siniestro) + ', ' +
                                      SqlInt(edSiniestro.Orden) + ', ' +
                                      SqlInt(edSiniestro.Recaida) + ')';

    case cmbEstado.ItemIndex of
      1: sSql := sSql + ' AND amebpba.get_sinalta_estado(ex_siniestro, ex_orden, ex_recaida) = ''A'' ';
      2: sSql := sSql + ' AND amebpba.get_sinalta_estado(ex_siniestro, ex_orden, ex_recaida) = ''N'' ';
      3: sSql := sSql + ' AND amebpba.get_sinalta_estado(ex_siniestro, ex_orden, ex_recaida) = ''V'' ';
    end;

    if not(fraPrestadorCabecera.IsEmpty) then
      sSql := sSql + ' AND '''' || ex_prestador = ' + SqlInt(fraPrestadorCabecera.IDPrestador);

    if fraCIE10.IsSelected then
      sSql := sSql + DoFiltroComponente(fraCIE10, ' '''' || ex_diagnosticooms');

    if fraDelegacion.IsSelected then
      sSql := sSql + DoFiltroComponente(fraDelegacion, ' '''' || ex_delegacion');

     if fraGrupoTrabajo.IsSelected then
     begin
      sSql := sSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

      if fraGrupoTrabajo.cmbGestor.Text <> '' then
         sSql := sSql + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
     end;

   { if (dcSinDesde.Date > 0) and (dcSinHasta.Date > 0) then
      sSql := sSql + ' AND ex_fechaalta BETWEEN ' + dcSinDesde.SqlText + ' AND ' + dcSinHasta.SqlText;  }

    if (dcSinDesde.Date > 0) then
      sSql := sSql + ' AND ex_fechaalta >= ' + dcSinDesde.SqlText;

    if (dcSinHasta.Date > 0) then
      sSql := sSql + ' AND ex_fechaalta <= ' +  dcSinHasta.SqlText;

    if (not dcFRealiDesde.IsEmpty) and bAdmin then
      ssql := ssql + ' AND as_fecharealizada >= ' + dcFRealiDesde.SqlText;

    if (not dcFRealiHasta.IsEmpty) and bAdmin then
      ssql := ssql + ' AND as_fecharealizada <= ' + dcFRealiHasta.SqlText;

    if rbMedico.Checked then
      {sSql := sSql + ' AND NOT EXISTS (SELECT 1 ' +
                                       ' FROM sin.sas_accionesseguimiento ' +
                                      ' WHERE as_idexpediente = ex_id ' +
                                        ' AND as_fechabaja IS NULL ' +
                                        ' AND as_fechaalta > (actualdate - 7)) '} //DFG 04/11/11  - TK32590
    else       // Administrativo Chequeado
    begin
      if (cmbAcciones.Text <> '') then
        sSql := sSql + ' AND as_idaccion = ' + SqlInt(sdqAcciones.FieldByName('TA_ID').AsInteger);

      case cmbaccion.ItemIndex of
        1: sSql := sSql + ' AND as_fecharealizada IS NOT NULL AND as_fechabaja IS NULL';
        2: sSql := sSql + ' AND as_fecharealizada IS NULL AND as_fechabaja IS NULL';
        3: sSql := sSql + ' AND as_fechabaja IS NOT NULL';
      end;

    end;

    if fraUsuarios.IsSelected then
      sSql := sSql + ' AND ex_prestador IN (SELECT pu_idprestador ' +
                                            ' FROM cpu_prestadorusuario ' +
                                           ' WHERE pu_usuario = ' + SqlValue(fraUsuarios.Codigo) +
                                             ' AND pu_fechabaja IS NULL) ';

    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;

    tbModificar.Enabled := rbMedico.Checked;
    FieldBaja := 'AS_FECHABAJA';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.sdqConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not sdqConsulta.FieldByName('SA_ULTIMAESTIMACION').IsNull then
  begin
    DataSet.FieldByName('PORCINCA').AsCurrency    := StrToFloat(NVL(StringReplace(Copy(sdqConsulta.FieldByName('SA_ULTIMAESTIMACION').AsString, 11, 17), '.', ',', []), '0'));
    DataSet.FieldByName('FECHAESTIM').AsDateTime  := StrToDate(Copy(sdqConsulta.FieldByName('SA_ULTIMAESTIMACION').AsString, 1, 10));
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.ClearControls;
begin
//
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.LoadControls;
begin
  edSiniestroABM.SetValues(sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('EX_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('EX_RECAIDA').AsInteger);
  edTrabajadorABM.Text := sdqConsulta.FieldByName('TJ_NOMBRE').AsString;
end;
{-------------------------------------------------------------------------------}
function TfrmListSeguimientoMedico.Validar :Boolean;
begin
  Verificar(rgOpciones.ItemIndex = -1, rgOpciones, 'Debe seleccionar una acción a tomar.');
  Verificar((DatosAcciones[rgOpciones.ItemIndex].ExigeTexto = 'S') and
            IsEmptyString(Trim(edTexto.Lines.Text)), edTexto,
            'Debe ingresar texto para el evolutivo según la acción tomada');
  Verificar(EsTercerPedEvolSinEvol, rgOpciones,
            'Ya posee dos Reclamos de Evolutivos sin carga de los mismos. Por favor seleccione otra acción.');  // Lu TK 4715
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmListSeguimientoMedico.DoABM :Boolean;
begin
  Result := True;
  if (ModoABM = maModificacion) then
  try
    BeginTrans;
    DoInsertarAccion;
    if not(IsEmptyString(DatosAcciones[rgOpciones.ItemIndex].GeneraEvol)) then
       DoInsertarEvolutivo(DatosAcciones[rgOpciones.ItemIndex].GeneraEvol);
    CommitTrans;
  except
    on E: Exception do
    begin
      if InTransaction then Rollback;
      ErrorMsg(E);
      Result := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.DoCargarABM;
var
  sSql :String;
  i :Integer;
begin
  sSql  := 'SELECT ta_id, ta_descripcion, ta_textoevolutivo, ' +
                 ' ta_exigetexto, ta_generaevolutivo ' +
            ' FROM sin.sta_tipoaccionseguim ' +
           ' WHERE ta_fechabaja IS NULL ';
  rgOpciones.Items.Clear;
  with GetQuery(sSql) do
  try
    SetLength(DatosAcciones, RecordCount);
    for i := 0 to RecordCount - 1 do
    begin
      DatosAcciones[i].ID           := FieldByName('TA_ID').AsInteger;
      DatosAcciones[i].Descripcion  := FieldByName('TA_DESCRIPCION').AsString;
      DatosAcciones[i].TextoEvol    := FieldByName('TA_TEXTOEVOLUTIVO').AsString;
      DatosAcciones[i].ExigeTexto   := FieldByName('TA_EXIGETEXTO').AsString;
      DatosAcciones[i].GeneraEvol   := FieldByName('TA_GENERAEVOLUTIVO').AsString;
      rgOpciones.Items.Add(FieldByName('TA_DESCRIPCION').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.rgOpcionesClick(Sender: TObject);
begin
  inherited;
  edTextoTabla.Text := DatosAcciones[rgOpciones.ItemIndex].TextoEvol;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  rgOpciones.ItemIndex := -1;
  edTexto.Clear;
  edTextoTabla.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.DoInsertarEvolutivo(sTipoParte :String);
var
  sObs, sSql :String;
  iPres :Integer;
begin
  sSql  := 'SELECT ca_identificador ' +
            ' FROM cpr_prestador ' +
           ' WHERE ca_delegparte = :Del ';
  iPres := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('ex_delegacion').AsString]);
  if (iPres = 0) then
  begin
    sSql  := 'SELECT ta_prestadorevo ' +
              ' FROM SIN.sta_tipoaccionseguim ' +
             ' WHERE ta_id = :IdAccion ';
    iPres := ValorSqlIntegerEx(sSql, [DatosAcciones[rgOpciones.ItemIndex].ID]);
  end;
  sObs :=  edTextoTabla.Text + ' ' + edTexto.Lines.Text;
  sSql := ' declare ' +
          '   idprestador number; ' +
          ' begin ' +
          ' idprestador := ' + SqlInt(iPres) + ';' +
          ' art.siniestro.do_generarevolutivo(Null, ' + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) + ',' +
                                             ' idprestador ,' + SqlValue(sdqConsulta.FieldByName('EX_DIAGNOSTICO').AsString) + ',' +
                                             SqlInt(sdqConsulta.FieldByName('DG_ID').AsInteger, True) + ',' +
                                             SqlInt(sdqConsulta.FieldByName('TC_ID').AsInteger, True) + ',' +
                                             ' ActualDate, ActualDate, Null, ' + SqlValue(sObs) + ', Null, ' +
                                             ' Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, ' +
                                             SqlValue(sTipoParte) + ',' + SqlValue(Sesion.UserID) + ', ''REDPRES'');' +
          ' end; ';
  EjecutarSqlST(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.DoInsertarAccion;
var
  sSql :String;
begin
  sSql := 'INSERT INTO sin.sas_accionesseguimiento ' +
          ' (as_idexpediente, as_idaccion, as_usualta, as_fechaalta, as_observmedico) VALUES ( ' +
          SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) + ',' +
          SqlInt(rgOpciones.ItemIndex + 1) + ',' + SqlValue(Sesion.UserID) + ', ActualDate, ' +
          SqlValue(edTextoTabla.Text + ' ' + edTexto.Text) + ' )';
  EjecutarSqlST(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.rbAdministrativoClick(Sender: TObject);
begin
  if ValidarFiltros then
  begin
    tbRefrescarClick(nil);
    cmbAcciones.Enabled        := True;
    tbAccionRealizada.Enabled  := True;
    tbVerObservaciones.Enabled := True;  // TK 18360
    tbAccionesSol.Enabled  := True;
    tbModificar.Enabled        := False;
    gbAccion.Enabled         := True;
    tbEliminar.Enabled         := true;
    DoHabilitarColumnasAccion;
  end
  else
    rbMedico.Checked := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.rbMedicoClick(Sender: TObject);
begin
  if ValidarFiltros then
  begin
    tbRefrescarClick(nil);
    cmbAcciones.Clear;
    cmbAcciones.Enabled        := False;
    tbAccionRealizada.Enabled  := False;
    tbVerObservaciones.Enabled := False;  // TK 18360
    tbAccionesSol.Enabled  := False;
    cmbAccion.ItemIndex := 0;
    tbModificar.Enabled        := True;
    gbAccion.Enabled         := false;
    tbEliminar.Enabled         := false;
    DoHabilitarColumnasAccion;

  end
  else
    rbAdministrativo.Checked;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.tbLimpiarClick(Sender: TObject);
begin
  edSiniestro.Clear;
  cmbEstado.ItemIndex   := 0;
  rbMedico.Checked      := True;
  fraPrestadorCabecera.Clear;
  dcSinDesde.Clear;
  dcSinHasta.Clear;
  fraGrupoTrabajo.Clear;
  fraDelegacion.Clear;
  fraCIE10.Clear;
  fraUsuarios.Clear;
  dcFRealiDesde.Clear;
  dcFRealiHasta.Clear;
  cmbaccion.ItemIndex := 0;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoABM then
    fpAbm.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.tbSalirClick(Sender: TObject);
begin
//  frmListSeguimientoMedico := nil;
//  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.tbVerObservacionesClick(Sender: TObject);      // TK 18360
begin
  fpVerObservaciones.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSeguimientoMedico.tbAccionRealizadaClick(Sender: TObject);     // Lu TK 1189
var
  vAS_ID: integer;
begin
  inherited;
  if sdqConsulta.FieldByName('AS_FECHABAJA').AsString <> '' then
    messagedlg('El registro está dado de baja', mtInformation,[mbOk], 0)
  else
  begin
    vAS_ID := sdqConsulta.FieldByName('AS_ID').AsInteger;

    if (not sdqConsulta.Active) or (vAS_ID = 0) then
      tbAccionRealizada.Down := False
    else
    begin
      if EsAccionRealizada(vAS_ID) then
      begin
        tbAccionRealizada.Down := True;
        Verificar(True, Nil, 'La acción seleccionada ya se encuentra Realizada');
      end
      else
      begin
        if MsgBox('¿Esta seguro que desea realizar la acción del siniestro ' + sdqConsulta.FieldByName('SINIESTRO').AsString + '?', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          try
            BeginTrans;
            DoAccionRealizada(vAS_ID);
            CommitTrans;
        //   tbRefrescarClick(nil);    // se comenta para agilizar el listado Ticket
          except
            on E: Exception do
            begin
              if InTransaction then Rollback;
              ErrorMsg(E);
            end;
          end;
        end
        else
          tbAccionRealizada.Down := False;
      end;
    end;
  end;
end;

procedure TfrmListSeguimientoMedico.DoAccionRealizada(iAS_ID: Integer);     // Lu TK 1189
var
  sSql: string;
begin
  sSql := ' UPDATE sin.sas_accionesseguimiento ' +
          ' SET as_fecharealizada = art.actualdate, ' +
              ' as_usurealizada = ' + SqlValue(Sesion.LoginName) +
          ' WHERE as_id = ' + SqlInt(iAS_ID);

  EjecutarSqlST(sSql);
end;

function TfrmListSeguimientoMedico.EsAccionRealizada(iAS_ID: Integer): boolean;   // Lu TK 1189
var
  sSql: string;
begin
  sSql := ' SELECT as_fecharealizada ' +
            ' FROM sin.sas_accionesseguimiento ' +
           ' WHERE as_id = ' + SqlInt(iAS_ID);

  with GetQuery(sSql) do
  try
    Result := not (FieldByName('AS_FECHAREALIZADA').IsNull);
  finally
    Free;
  end;
end;

procedure TfrmListSeguimientoMedico.sdqConsultaAfterScroll( DataSet: TDataSet);  // Lu TK 1189
begin
  inherited;
  if rbAdministrativo.Checked then
    tbAccionRealizada.Down := EsAccionRealizada(DataSet.fieldByName('AS_ID').AsInteger);
end;

function TfrmListSeguimientoMedico.ValidarFiltros: boolean;   // Lu a raiz del TK 1189
var
  bFiltrosVacios:boolean;
begin
  bFiltrosVacios := edSiniestro.IsEmpty and dcSinDesde.IsEmpty and dcSinHasta.IsEmpty and
                    fraGrupoTrabajo.IsEmpty and fraDelegacion.IsEmpty and fraPrestadorCabecera.IsEmpty and
                    fraUsuarios.IsEmpty and fraCIE10.IsEmpty and (trim(cmbAcciones.Text)='') and
                    dcFRealiDesde.IsEmpty and dcFRealiHasta.IsEmpty;
  Result := not bFiltrosVacios;
  //Verificar(bFiltrosVacios, nil, 'Se debe completar al menos un filtro para realizar la consulta');
  if bfiltrosVacios then
    InfoHint(nil, 'Se debe completar al menos un filtro para realizar la consulta');
end;

procedure TfrmListSeguimientoMedico.DoHabilitarColumnasAccion;
var bHab: boolean;
begin
  bHab := rbAdministrativo.Checked;
  Grid.ColumnByField['AS_FECHAALTA'].Visible      := bHab;
  Grid.ColumnByField['AS_FECHAREALIZADA'].Visible := bHab;
  Grid.ColumnByField['AS_USUREALIZADA'].Visible   := bHab;
  Grid.ColumnByField['DESCACCION'].Visible        := bHab;
end;

function TfrmListSeguimientoMedico.EsTercerPedEvolSinEvol: boolean;    // Lu TK 4715
var iIdExped, CantAcc3: integer;
    dFecUltParte: TDateTime;
begin
  Result       := False;
  iIdExped     := sdqConsulta.FieldByName('EX_ID').AsInteger;

  if ((rgOpciones.ItemIndex + 1) = 3) then
  begin
    dFecUltParte := ValorSqlDateTimeEx('SELECT A.pv_fechaalta ' +
                                        ' FROM art.spv_parteevolutivo A ' +
                                       ' WHERE A.pv_idexpediente = :IdEx ' +
                                         ' AND A.pv_fechabaja IS NULL ' +
                                         ' AND A.pv_tipoparte = ''E'' ' +
                                         ' AND A.pv_nroparte = (SELECT MAX(B.pv_nroparte) ' +
                                                                ' FROM art.spv_parteevolutivo B ' +
                                                               ' WHERE B.pv_idexpediente = A.pv_idexpediente ' +
                                                                 ' AND B.pv_tipoparte = ''E'' ' +
                                                                 ' AND B.pv_fechabaja IS null) ', [iIdExped]);
    CantAcc3 := ValorSql(' SELECT COUNT(*) Cant ' +
                           ' FROM SIN.sas_accionesseguimiento ' +
                          ' WHERE as_idexpediente = ' + SqlInt(iIdExped) +
                            ' AND as_fechabaja IS NULL ' +
                            ' AND as_idaccion = 3 ' +
                            ' AND as_fechaalta >' + SqlDate(dFecUltParte));
    if (CantAcc3 >= 2) then
      Result := True;
  end;                      
end;

procedure TfrmListSeguimientoMedico.FormClose(Sender: TObject; var Action: TCloseAction);   // TK 17530
begin
  inherited;
  frmListSeguimientoMedico := nil;
  frmPrincipal.mnuListSeguimientoMedico.Enabled := True;
end;

procedure TfrmListSeguimientoMedico.tbSalir3Click(Sender: TObject);
begin
 // frmListSeguimientoMedico := nil;
//  inherited;
  close;
end;

procedure TfrmListSeguimientoMedico.btnCerrarClick(Sender: TObject);
begin
  fpVerObservaciones.ModalResult := mrOk;

end;

procedure TfrmListSeguimientoMedico.fpVerObservacionesBeforeShow(Sender: TObject);   // TK 18360
begin
  inherited;
  edVerSiniestro.SetValues(sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('EX_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('EX_RECAIDA').AsInteger);
  MemoVerObservParte.Clear;
  MemoVerObservParte.Text := sdqConsulta.FieldByName('AS_OBSERVMEDICO').AsString;
end;

procedure TfrmListSeguimientoMedico.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('AS_FECHABAJA').AsString = '' then
  begin
    if tbAccionRealizada.Down = True then
      verificar(true, nil, 'No se puede dar de baja: la acción ya fue realizada el dia ' + sdqConsulta.fieldbyname('AS_FECHAREALIZADA').asstring)
    else
    begin
      fraMotivos.TableName:='sin.sms_motivosbajaseguimiento';
      fraMotivos.FieldID:='MS_ID';
      fraMotivos.FieldCodigo:='MS_CODIGO';
      fraMotivos.FieldDesc:='MS_DESCRIPCION';
      fraMotivos.FieldBaja:='MS_FECHABAJA';
      fraMotivos.Clear;
      mObservaciones.Clear;
      fpBajaSeguimiento.ShowModal;
    end;
  end
  else
    messagedlg('El registro ya fue dado de baja anteriormente', mtInformation,[mbOk], 0);
end;


procedure TfrmListSeguimientoMedico.btnMotivoBajaAceptarClick(Sender: TObject);
var ssql: string; IDAccionSeguimiento: integer;
begin
  //inherited;
  verificar(fraMotivos.IsEmpty, fraMotivos, 'Debe seleccionar un motivo para la baja');
  IDAccionSeguimiento := sdqConsulta.FieldByName('AS_ID').AsInteger;
  ssql:='UPDATE sin.sas_accionesseguimiento ' +
        'SET    AS_OBSERVADMINISTRATIVO=' +  sqlvalue(mObservaciones.Lines.text) + ', ' +
              ' AS_IDMOTIVOBAJA = ' + SqlInt(fraMotivos.id) + ', ' +
              ' AS_USUBAJA = ' + sqlvalue(Sesion.UserID) + ', ' +
              ' AS_FECHABAJA = actualdate ' +
              ' WHERE AS_ID=' + SqlInt(IDAccionSeguimiento);

  EjecutarSql(sSql);
  fpBajaSeguimiento.ModalResult:=mrOk;

end;

procedure TfrmListSeguimientoMedico.tbAccionesSolClick(Sender: TObject);
begin
  seAccionesSeg.Clear;
  edNombreTraba.Clear;
  dbgrid1.DataSource := nil;
  if sdqConsulta.FieldByName('ex_siniestro').AsString <> '' then
  begin
    seAccionesSeg.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger, sdqConsulta.FieldByName('ex_recaida').AsInteger);
  end
  else
    seAccionesSeg.SetValues(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);

  seAccionesSegSelect(nil);
  fpAccSolicitadas.ShowModal;

end;

procedure TfrmListSeguimientoMedico.seAccionesSegSelect(Sender: TObject);
var ssql: string;
begin
  sdqAccionesSolicitadas.Close;
  ssql := ' select tj_nombre, ex_id ' +
          ' from art.sex_expedientes, comunes.ctj_trabajador ' +
          ' where ex_siniestro = :sin ' +
            ' and ex_orden = :ord ' +
            ' and ex_recaida = :rec ' +
            ' and ex_idtrabajador = tj_id ';

  with GetQueryEx(ssql, [seAccionesSeg.Siniestro, seAccionesSeg.Orden, seAccionesSeg.Recaida]) do
  begin
    edNombreTraba.Text := FieldByName('tj_nombre').AsString;
    sdqAccionesSolicitadas.ParamByName('idexp').AsInteger := fieldbyname('ex_id').AsInteger;
  end;
  dbgrid1.DataSource := dsAccSolicitadas;
  sdqAccionesSolicitadas.Open;

end;

procedure TfrmListSeguimientoMedico.fpAccSolicitadasShow(Sender: TObject);
begin
  seAccionesSeg.SetFocus;

end;

procedure TfrmListSeguimientoMedico.btnBuscarClick(Sender: TObject);
begin
  seAccionesSegSelect(nil);

end;

procedure TfrmListSeguimientoMedico.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

end.
