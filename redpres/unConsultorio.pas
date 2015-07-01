unit unConsultorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                  
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, StdCtrls, Mask, ToolEdit,
  DateComboBox, ImgList, SinEdit, unFraTrabajador, FormPanel,
  unfraCtbTablas,AnsiSQL,CustomDLGS,strfuncs, unFraTrabajadorSIN,
  unfraDelegacion, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Menus, Buttons, unFraGrupoTrabajo, unFraCIE10,
  PatternEdit, IntEdit, unArtDbFrame, unfraPrestador, RxToolEdit, RxPlacemnt, sqlfuncs;

type
  TfrmConsultorio = class(TfrmCustomConsulta)
    Label1: TLabel;
    DTPDesde: TDateComboBox;
    Label2: TLabel;
    DTPHasta: TDateComboBox;
    framedico: TfraCodigoDescripcion;
    Label3: TLabel;
    SinEdit1: TSinEdit;
    Label4: TLabel;
    SinEdit2: TSinEdit;
    Label5: TLabel;
    Label6: TLabel;
    fpABM: TFormPanel;
    Label7: TLabel;
    SinEdit3: TSinEdit;
    Label9: TLabel;
    fraMedicoABM: TfraCodigoDescripcion;
    Label8: TLabel;
    Label10: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label11: TLabel;
    fraSector: TfraCtbTablas;
    fraSectorABM: TfraCtbTablas;
    Label13: TLabel;
    Observac: TMemo;
    ChkConcurre: TCheckBox;
    tbConcurre: TToolButton;
    tbNoConcurre: TToolButton;
    fraTrabajador: TfraTrabajadorSIN;
    lblDatSin: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ChkCrearParte: TCheckBox;
    gbAlta: TGroupBox;
    OptAlta: TRadioButton;
    OptContTratamiento: TRadioButton;
    fraTipoAlta: TfraStaticCTB_TABLAS;
    Label17: TLabel;
    fraDelegacionFiltro: TfraCodigoDescripcion;
    fraDelegacionABM: TfraCodigoDescripcion;
    chkEstudiosABM: TCheckBox;
    chkEstudios: TCheckBox;
    tbEvaluacion: TToolButton;
    ToolButton2: TToolButton;
    chkPosibleEEPP: TCheckBox;
    ObsAud: TMemo;
    Label18: TLabel;
    chkEEPPConfirm: TCheckBox;
    Label19: TLabel;
    edFechaABM: TDateComboBox;
    edFechaTXT: TEdit;
    edHoraABM: TMaskEdit;
    chkAnulados: TCheckBox;
    fpAnular: TFormPanel;
    Bevel3: TBevel;
    Label12: TLabel;
    Label16: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    edObservacionesAnu: TMemo;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    chkEvalLeve: TCheckBox;
    chkEvalLeveABM: TCheckBox;
    chkModerado: TCheckBox;
    chkModeradoABM: TCheckBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    mnuImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirParteEgreso: TMenuItem;
    tbPacEnEspera: TToolButton;
    ToolButton1: TToolButton;
    mnuPacEnEspera: TPopupMenu;
    mnuSinRemis: TMenuItem;
    mnuConRemis: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel1: TBevel;
    btnGetTurno: TSpeedButton;
    rgAmeritaRemis: TRadioGroup;
    chkTelegrama: TCheckBox;
    fraCIE10: TfraCodigoDescripcion;
    Label23: TLabel;
    tbModificarMedico: TToolButton;
    memoMecanismoAccid: TMemo;
    Label24: TLabel;
    mnuCesedeILT: TMenuItem;
    gbTratSugerido: TGroupBox;
    MemoTratamientoSugerido: TMemo;
    gbDiasProbables: TGroupBox;
    rbDiasProbAlta: TRadioButton;
    rbDiasProxCit: TRadioButton;
    edDiasProbAlta: TIntEdit;
    edDiasProxCit: TIntEdit;
    tbSumatoria: TToolButton;
    ToolButton9: TToolButton;
    fpModificarMedico: TFormPanel;
    Bevel2: TBevel;
    btnAceptarMM: TButton;
    btnCancelarMM: TButton;
    Label25: TLabel;
    dcFechaTurnoMM: TDateComboBox;
    Label26: TLabel;
    edHoraMM: TMaskEdit;
    edSiniestroMM: TSinEdit;
    Label27: TLabel;
    Label28: TLabel;
    edTrabajadorMM: TEdit;
    Label29: TLabel;
    fraMedicoMM: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    Label30: TLabel;
    fraPrestador: TfraPrestador;
    chkRecepDeclaracABM: TCheckBox;
    chkRecepDeclarac: TCheckBox;
    Panel3: TPanel;
    Label31: TLabel;
    StatusBar: TStatusBar;
    tbSalir5: TToolButton;
    ToolButton10: TToolButton;
    gbMotivoNoAceptaRein: TGroupBox;
    MemoMotivoNoAceptaRein: TMemo;
    Label32: TLabel;
    rbSiAceptaReingreso: TRadioButton;
    rbNoAceptaReingreso: TRadioButton;
    mnuSolicitudReingreso: TMenuItem;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure SinEdit3Exit(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbConcurreClick(Sender: TObject);
    procedure tbNoConcurreClick(Sender: TObject);
    procedure OptContTratamientoClick(Sender: TObject);
    procedure OptAltaClick(Sender: TObject);
    procedure tbEvaluacionClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure edFechaABMExit(Sender: TObject);
    procedure edFechaABMEnter(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure fpAnularBeforeShow(Sender: TObject);
    procedure chkEvalLeveABMClick(Sender: TObject);
    procedure chkModeradoABMClick(Sender: TObject);
    procedure chkEvalLeveClick(Sender: TObject);
    procedure chkModeradoClick(Sender: TObject);
    procedure mnuImprimirParteEgresoClick(Sender: TObject);
    procedure tbPacEnEsperaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure mnuSinRemisClick(Sender: TObject);
    procedure mnuConRemisClick(Sender: TObject);
    procedure framedicoABMExit(Sender: TObject);
    procedure btnGetTurnoClick(Sender: TObject);
    procedure fpABMClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarMedicoClick(Sender: TObject);
    procedure mnuCesedeILTClick(Sender: TObject);
    procedure rbDiasProbAltaClick(Sender: TObject);
    procedure rbDiasProxCitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function VerificarLicencias(medico: string; fecha: string): boolean;
    procedure tbSumatoriaClick(Sender: TObject);
    procedure fpModificarMedicoBeforeShow(Sender: TObject);
    procedure btnAceptarMMClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbSalir5Click(Sender: TObject);
    procedure rbNoAceptaReingresoClick(Sender: TObject);
    procedure rbSiAceptaReingresoClick(Sender: TObject);
    procedure mnuSolicitudReingresoClick(Sender: TObject);
  private
    dFechaAux :TDate;
    procedure NoConcurre(Comentario :String);
    procedure AgregarParteEvolutivo(Siniestro, Orden, Recaida, IdCitacion :Integer;
                                    Fecha :TDate; Observaciones :String; EsAuditoria :Boolean;
                                    Cie10:String; EsTurno :Boolean = False);
    procedure MostrarConcurre;
    procedure DoActualizarParteAut;
    function Validar:Boolean;
    function ValidarConcurre:Boolean;
    function HayRegistroActivo :Boolean;
    function ExisteOtroTurno(bEsAlta :Boolean) :Boolean;
    function GetNroParte :Integer;
    function Get_MecanismoAccid(iIdExped:integer): String;  // Lu TK 11018
    procedure Do_PacienteEnEspera;
    procedure DoHabilitarHora(bHabilitar: Boolean);  // Lu TK 1162
    procedure DoObtenerTurno(dFecha: TDate; sMedico: String); // Lu TK 1162
    procedure DoMarcarTraslado(Siniestro, Orden, Recaida :Integer);
    procedure DoGuardarMecanismoAccid(iIdExped: integer; sMecanisAccid:string); // TK 11018
    procedure Do_habilitarProbables; // Lu TK 16829
    procedure Do_MostrarDiasYTratam; // Lu TK 16829
    procedure BorrarSumatoriaRegistros;
    procedure SumatoriaRegistros;
    procedure DoHabilitar_AceptarReingreso(iSiniestro, iOrden, iRecaida: integer); // TK 63627
    procedure Do_HabMotivoNoAcepta;                                                // TK 63627
 //   procedure DoEvaluarColocarAltaMedica(iIdExped, iRecaida, iIdPrestador, iIdDiagnostico, iGravedadCIE10, iIdGravedad: integer; dFBaja: TDateTime);                       // TK 63627
    procedure Do_ImprimirReportes(iIdExped, iIdCC: integer);                              // TK 63627
  public
  end;
  TCausaFinNoValida = set of byte;

var
  frmConsultorio: TfrmConsultorio; CausasNoValidas: TCausaFinNoValida;

implementation

uses
  unDmPrincipal, unSesion, DateTimeFuncs, General, ValFuncs, unEvaluacionMedica,
  VCLExtra, unRptParteEgreso, unRedPres, unUtilsArchivo, unComunes, unConstantArchivo,
  unRptCeseDeILT, unTercerizadoras, unSiniestros, unRptSolicitudReingreso;

{$R *.DFM}

procedure TfrmConsultorio.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  DTPDesde.Clear;
  DTPHasta.Clear;
  framedico.Clear;
  fraTrabajador.Limpiar;
  fraSector.Clear;
  fraDelegacionFiltro.Value := Sesion.Delegacion;
  SinEdit1.Clear;
  SinEdit2.Clear;
  fraGrupoTrabajo.Clear;
  chkEstudiosABM.Checked  := False;
  chkEstudios.Checked     := False;
  chkPosibleEEPP.Checked  := False;
  chkEEPPConfirm.Checked  := False;
  chkAnulados.Checked     := False;
  chkEvalLeve.Checked     := False;
  chkModerado.Checked     := False;
  chkTelegrama.Checked    := False;
end;

procedure TfrmConsultorio.tbRefrescarClick(Sender: TObject);
var
  sSQL:String;
begin
 sSQL:='SELECT cc_id, utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, tj_nombre, ' +
             ' cc_siniestro, cc_orden, cc_recaida, lg_nombre, cc_sector, cc_fecha, cc_fechabaja, ' +
             ' cc_medico, cc_hora,au_auditor, au_nombre, cc_observaciones, cc_concurre, ' +
             ' sect1.tb_descripcion sector1, cc_delegacion, lg_codigo, gp_nombre, cc_tipoalta, cc_estudios, ' +
             ' ex_id, ex_posibleeepp, cc_observauditor, siniestro.is_marcadoeepp(ex_id, cc_id) marcadoeepp, ' +
             ' cc_numauto, mc_descripcion motanul, cc_evaluacionleve, art.trabajador.get_telefono(tj_id, 4) Telefono, ' +
             ' cc_moderado, cc_recdeclaracion, cc_entdeclaracion, ' +
             ' siniestro.get_usuariogestor(ex_id) usugestor, cc_enespera, cc_espconremis, ' +
             ' tj_nombre || '' - '' || ex_fechaaccidente trabajador, ex_diagnosticooms, ex_diagnostico, ' +
             ' dg_descripcion, ex_ameritaremis, em_cuit, em_nombre, sect2.tb_descripcion sector2, ' +
             ' estlg.tb_descripcion estadotlg, decode(cc_id_cartatelegrama, NULL, ''N'', ''S'') tienetlg, ' +
             ' tj_id, ex_fechaaccidente, cc_tratsugerido, cc_diasprobalta, cc_diasprobproxcit, cc_idprestador, ex_fecharecepcion, ' +
             ' trunc(sysdate) hoy, ex_intercurrencia, ex_recaida, cc_aceptarreingreso, cc_motivonoaceptareing, ex_iddiagnostico, ' +
             ' EX_GRAVEDADCIE10, EX_IDGRAVEDAD, NVL(ex_bajamedica, NVL(ex_fecharecaida, ex_fechaaccidente)) FBAJA, ' +
             ' CASE WHEN ((ex_fecharecepcion + 10 >= TRUNC(SYSDATE)) ' +
             '       AND (cc_entdeclaracion <> ''S'') ' +
             '       AND ((ex_recaida = 0) OR ((ex_recaida > 0) AND (ex_intercurrencia = ''S'')))) THEN ''S'' ' +
             ' END declaracionpend ' +
        ' FROM dlg_delegaciones, sex_expedientes, ctj_trabajador, mau_auditores, ' +
             ' ctb_tablas sect1, ctb_tablas sect2, ctb_tablas estlg, mcc_citacionconsultorio, ' +
             ' mgp_gtrabajo, smc_motanulcitaciones, cdg_diagnostico, aem_empresa, ' +
             ' tlg_telegramas ' +
       ' WHERE cc_siniestro = ex_siniestro ' +
         ' AND cc_orden = ex_orden ' +
         ' AND cc_recaida = ex_recaida ' +
         ' AND ex_gtrabajo = gp_codigo ' +
         ' AND ex_cuil = tj_cuil ' +
         ' AND ex_cuit = em_cuit ' +
         ' AND cc_medico = au_auditor(+) ' +
         ' AND sect1.tb_clave(+) = ''SUBSE'' ' +
         ' AND lg_codigo(+) = cc_delegacion ' +
         ' AND sect1.tb_codigo(+) = cc_sector ' +
         ' AND cc_idmotanulacion = mc_id(+) ' +
         ' AND ex_diagnosticooms = dg_codigo(+) ' +
         ' AND sect2.tb_clave = ''SECT''' +
         ' AND sect2.tb_codigo = em_sector ' +
         ' AND cc_id_cartatelegrama = lg_idcarta_telegrama(+) ' +
         ' AND estlg.tb_clave(+) = ''ESTLG'' ' +
         ' AND estlg.tb_codigo(+) = lg_estado ';

  if not (DTpdesde.IsEmpty) then
    sSQL:=sSQL + ' AND cc_fecha >= ' + DTpdesde.SqlText;

  if not (DTphasta.IsEmpty) then
    sSQL:=sSQL + ' AND cc_fecha <= ' + DTphasta.SqlText;

  if not sinedit1.IsEmpty then
    sSQL:=sSQL + ' AND cc_siniestro BETWEEN ' + sinedit1.SiniestroSql  + ' AND ' + sinedit2.SiniestroSql;

  if fraTrabajador.CUIL <> '' then
  begin
    if Length(fraTrabajador.CUIL) <= 9 then
      sSQL:=sSQL + ' AND tj_documento = ' + SqlValue(fraTrabajador.CUIL)
    else
      sSQL:=sSQL + ' AND tj_cuil = ' + SqlValue(fraTrabajador.CUIL);
  end;

  if not framedico.IsEmpty then
    sSQL := sSQL + ' AND cc_medico = to_char(' + framedico.Value + ')';

  if not fraSector.IsEmpty then
    sSQL := sSQL + ' AND cc_sector = ' + fraSector.Value;

  if not fraDelegacionFiltro.IsEmpty then
    sSQL := sSQL + ' AND cc_delegacion = ' + fraDelegacionFiltro.Value;

  if  (fraGrupoTrabajo.ID <> '') then
    sSQL := sSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

  if chkEstudios.Checked then
    sSQL:=sSQL + ' AND cc_estudios = ''S'' ';

  if chkPosibleEEPP.Checked then
    sSQL:=sSQL + ' AND ex_posibleeepp = ''S'' ';

  if chkEEPPConfirm.Checked then
    sSQL:=sSQL + ' AND siniestro.is_marcadoeepp(ex_id, cc_id) = ''S'' ';

  if chkAnulados.Checked then
    sSQL:=sSQL + ' AND cc_fechabaja IS NOT NULL '
  else
    sSQL:=sSQL + ' AND cc_fechabaja IS NULL ';

  if chkEvalLeve.Checked then
    sSQL:=sSQL + ' AND cc_evaluacionleve = ''S'' ';

  if chkModerado.Checked then
    sSQL:=sSQL + ' AND cc_moderado = ''S'' ';

  if chkRecepDeclarac.Checked then
    sSQL:=sSQL + ' AND cc_recdeclaracion = ''S'' ';

  if chkTelegrama.Checked then
    sSQL:=sSQL + ' AND cc_id_cartatelegrama IS NOT NULL ';

  if fraTrabajador.Tercerizadoras then
    sSQL:=sSQL + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
    sSql := sSql + ' AND art.siniestro.get_siniestrosml(ex_id) = ''S'' ';

  sSQL:= sSQL + sortdialog.OrderBy;
  sdqConsulta.sql.Text := sSQL;

  inherited;

  if sdqConsulta.FieldByName('cc_concurre').AsString = '' then
    tbModificar.Enabled := false;
end;

procedure TfrmConsultorio.FormCreate(Sender: TObject);
begin

  inherited;
  CausasNoValidas := [99, 02];

  with framedico do
  begin
    TableName      := 'MAU_AUDITORES';
    FieldCodigo    := 'AU_AUDITOR';
    FieldDesc      := 'AU_NOMBRE';
    FieldID        := 'AU_AUDITOR';
    FieldBaja      := 'AU_FBAJA';
    ShowBajas      := False;
  end;

  with fraMedicoABM do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
  end;

  with fraMedicoMM do             // TK 48382
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
  end;


  with fraCIE10 do           // TK 8673
  begin
    TableName   := 'CDG_DIAGNOSTICO';
    FieldID     := 'DG_CODIGO';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc   := 'DG_DESCRIPCION';
    FieldBaja   := 'DG_FECHABAJA';
    ShowBajas   := False;
  end;

  frasector.Clave          := 'SUBSE';
  frasector.ShowBajas      := True;

  fraSectorABM.Clave       := 'SUBSE';
  fraSectorABM.ShowBajas   := False;

  fraTipoAlta.Clave        := 'CONC';
  fraTipoAlta.ShowBajas    := False;

  with fraDelegacionFiltro do
  begin
    TableName   := 'DLG_DELEGACIONES';
    FieldCodigo := 'LG_CODIGO';
    FieldDesc   := 'LG_NOMBRE';
    FieldID     := 'LG_CODIGO';
    FieldBaja   := 'LG_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraDelegacionABM do
  begin
    TableName   := 'DLG_DELEGACIONES';
    FieldCodigo := 'LG_CODIGO';
    FieldDesc   := 'LG_NOMBRE';
    FieldID     := 'LG_CODIGO';
    FieldBaja   := 'LG_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraMotivoAnulacion do
  begin
    TableName   := 'SMC_MOTANULCITACIONES';
    FieldID     := 'MC_ID';
    FieldCodigo := 'MC_CODIGO';
    FieldDesc   := 'MC_DESCRIPCION';
    FieldBaja   := 'MC_FECHABAJA';
    ShowBajas   := False;
  end;
  fraDelegacionFiltro.Value     := Sesion.Delegacion;
  fraTrabajador.Tercerizadoras  := EsUsuarioDeTercerizadora;

  fraPrestador.ExtraFields := ', ca_consultorio ';
  fraPrestador.ExtraCondition := ' and ca_consultorio = ''S'' ';

  LockControls([gbDiasProbables, gbTratSugerido, edDiasProbAlta, edDiasProxCit,
                MemoTratamientoSugerido], true);  // TK 16829
end;


procedure TfrmConsultorio.btnAceptarClick(Sender: TObject);
var
  SQL:TSQL;
  sObs :String;
  IdNuevaCit :Integer;
  bEntroIF: boolean; // TK 48407
begin
  inherited;
  bEntroIf := False;
  if Validar then
  begin
    SQL:= TSQL.Create;
    try
      SQL.TableName:='MCC_CITACIONCONSULTORIO';
      SQL.Fields.Add('CC_FECHA', SqlDate(edFechaABM.Date),False);
      SQL.Fields.Add('CC_HORA', edHoraABM.Text);
      SQL.Fields.Add('CC_MEDICO', fraMedicoABM.Value);
      SQL.Fields.Add('CC_SECTOR', fraSectorABM.Value);
      SQL.Fields.Add('CC_DELEGACION', fraDelegacionABM.Value);
      SQL.Fields.Add('CC_TIPOALTA', fraTipoAlta.Codigo);
      SQL.Fields.Add('CC_ESTUDIOS', String(IIF(chkEstudiosABM.Checked, 'S', 'N')));
      SQL.Fields.Add('CC_EVALUACIONLEVE', String(IIF(chkEvalLeveABM.Checked, 'S', 'N')));
      SQL.Fields.Add('CC_MODERADO', String(IIF(chkModeradoABM.Checked, 'S', 'N')));
      SQL.Fields.Add('CC_RECDECLARACION', String(IIF(chkRecepDeclaracABM.Checked, 'S', 'N')));
      SQL.Fields.Add('CC_OBSERVAUDITOR', ObsAud.Lines.Text);
      SQL.Fields.Add('CC_IDPRESTADOR', String(IIF(fraPrestador.IDPrestador = 0, '', fraPrestador.IDPrestador)));
      try
        BeginTrans;
        if FPABM.tag=0 then //alta
        begin
          IdNuevaCit := ValorSqlInteger('SELECT SEQ_MCC_ID.NEXTVAL FROM DUAL');
          SQL.Fields.Add('CC_SINIESTRO',sinedit3.SiniestroS);
          SQL.Fields.Add('CC_ORDEN',sinedit3.OrdenS);
          SQL.Fields.Add('CC_RECAIDA',sinedit3.RecaidaS);
          SQL.Fields.Add('CC_CONCURRE','NULL',False);
          SQL.Fields.Add('CC_ID',IdNuevaCit,False);
          SQL.Fields.Add('CC_USUALTA',Sesion.UserID);
          SQL.Fields.Add('CC_FECHAALTA','ACTUALDATE',False);
          sObs := 'Paciente citado en Consultorio Provincia A.R.T.';
          if (Trim(Observac.Lines.Text) <> '') then
            sObs := Observac.Lines.Text + chr(10) + chr(13) + sObs;
          if chkEstudiosABM.Checked then
            sObs := sObs + ' (con estudios)';
          SQL.Fields.Add('CC_OBSERVACIONES', sObs);
          EjecutarSqlST(SQL.InsertSql);
          //agrega el parte evolutivo que corresponda
          AgregarParteEvolutivo(Sinedit3.Siniestro, Sinedit3.Orden, Sinedit3.Recaida,
                                IdNuevaCit, edFechaABM.Date, sObs, False, '', True);
         // CommitTrans;
          MsgBox ('Registro Insertado');
        //  FPABM.ModalResult := MROK;
        //  tbRefrescar.Click;
          bEntroIF := True;
        end else if fpABM.Tag=1 then //modificacion
        begin
          SQL.Fields.Add('CC_OBSERVACIONES',Observac.Text);
          SQL.Fields.Add('CC_USUMODIF',Sesion.UserID);
          SQL.Fields.Add('CC_FECHAMODIF','ACTUALDATE',False);
          EjecutarSqlST(SQL.UpdateSql + ' WHERE cc_id = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger));
          DoActualizarParteAut;
          //CommitTrans;
          MsgBox ('Registro Modificado');
          //FPABM.ModalResult := MROK;
          //tbRefrescar.Click;
          bEntroIF := True;
        end else if (fpABM.Tag=2) and ValidarConcurre then // concurre
        begin
          SQL.Fields.Add('CC_OBSERVACIONES',Observac.Text);
          SQL.Fields.Add('CC_DIASPROBALTA', edDiasProbAlta.Text);    // TK 16829
          SQL.Fields.Add('CC_DIASPROBPROXCIT', edDiasProxCit.Text);
          SQL.Fields.Add('CC_TRATSUGERIDO', MemoTratamientoSugerido.Lines.Text);

          SQL.Fields.Add('CC_ACEPTARREINGRESO', String(IIF(rbSiAceptaReingreso.Checked, 'S', IIF(rbNoAceptaReingreso.Checked, 'N', ''))));    // TK 63627
          if (MemoMotivoNoAceptaRein.Lines.Text <> '') then
            SQL.Fields.Add('CC_MOTIVONOACEPTAREING', MemoMotivoNoAceptaRein.Lines.Text);

          //modifica los datos de la citacion
          EjecutarSqlST(SQL.UpdateSql + ' WHERE cc_id = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger));

          //pone concurre en 'S'
          EjecutarSqlST('UPDATE mcc_citacionconsultorio ' +
                          ' SET cc_concurre = ''S'', ' +
                              ' cc_enespera = ''N'', ' +  // Lu 02/05/2008: se saca la marca de Paciente en Espera.
                              ' cc_espconremis = ''N'', ' + // Lu por TK 435
                              ' cc_fechamodif = Actualdate, ' +
                              ' cc_usumodif = ' + SqlValue(Sesion.UserID) +
                        ' WHERE cc_id = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger));

          //agrega el parte evolutivo de tipo auditoria en consultorio
          AgregarParteEvolutivo(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida,
                                sdqConsulta.FieldByName('CC_ID').AsInteger,
                                edFechaABM.Date, Observac.Text, True, fraCIE10.Value, False);    // Lu TK 8673 Sólo en el Concurre se guarda el CIE10 nuevo ingresado por el usuario.

          Actualizar_EX_DiagnosticoOMS(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida);     // Lu TK 8673 cambia el Cie10

          //si es alta con fin de tratamiento, da de baja los turnos y autorizaciones posteriores que tenga
          if (fraTipoAlta.Codigo = 'FT') or (fraTipoAlta.Codigo = 'DE') then
            EjecutarStoreST('siniestro.do_anularturnosautorizaciones(' +
                              SqlInt(SinEdit3.Siniestro) + ',' + SqlInt(SinEdit3.Orden) + ',' +
                              SqlInt(SinEdit3.Recaida) + ',' + SqlDate(edFechaABM.Date) + ',' +
                              SqlValue(Sesion.UserID) + ', NULL );');

          DoMarcarTraslado(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida);
          DoGuardarMecanismoAccid(sdqConsulta.FieldByName('EX_ID').AsInteger, Trim(memoMecanismoAccid.Text));  // TK 11018
      {    DoEvaluarColocarAltaMedica(sdqConsulta.FieldByName('EX_ID').AsInteger, sdqConsulta.FieldByName('CC_RECAIDA').AsInteger,
                                     sdqConsulta.FieldByName('CC_IDPRESTADOR').AsInteger, sdqConsulta.FieldByName('EX_IDDIAGNOSTICO').AsInteger,
                                     sdqConsulta.FieldByName('EX_GRAVEDADCIE10').AsInteger, sdqConsulta.FieldByName('EX_IDGRAVEDAD').AsInteger,
                                     sdqConsulta.FieldByName('FBAJA').AsDateTime); }  // TK 63627
          //CommitTrans;
          //tbRefrescar.Click;
          MsgBox('Marca de CONCURRE colocada con éxito.');
          //FPABM.ModalResult := MROK;
          bEntroIF := True;

          Do_ImprimirReportes(sdqConsulta.FieldByName('EX_ID').AsInteger, sdqConsulta.FieldByName('CC_ID').AsInteger); // TK 63627

        end;

        if bEntroIF then  // TK 48407  Esto lo hago por este ticket para ver si soluciona algo.
        begin
          CommitTrans;
          tbRefrescar.Click;
          FPABM.ModalResult := MROK;
        end;

      except on E: Exception do
        begin
          Rollback;
          if FPABM.Tag = 0 then
            MsgBox('Ha ocurrido un error inesperado al intentar insertar el registro.' +#13 + E.Message);
         {  else
             MsgBox('Ha ocurrido un error inesperado al intentar modificar el registro.');   }
        end;
      end;
    finally
      SQL.Free;
    end;
  end;
end;

procedure TfrmConsultorio.tbNuevoClick(Sender: TObject);
begin
  inherited;
  FPABM.tag                   := 0;
  FPABM.Caption               := 'Alta de Consultorio';
  lbldatsin.Caption           := '';
  SinEdit3.Clear;
  edFechaABM.Clear;
  edFechaTXT.Clear;
  edHoraABM.Clear;
  fraMedicoABM.Clear;
  fraSectorABM.Limpiar;
  fraPrestador.Clear;
  fraDelegacionABM.Clear;
  Observac.Clear;
  ObsAud.Clear;
  fraCIE10.Clear;  // Lu arreglo
  sinedit3.enabled            := True;
  edFechaABM.Enabled          := True;
  edHoraABM.Enabled           := True;
  fraMedicoABM.Enabled        := True;
  fraSectorABM.Enabled        := True;
  fraPrestador.Enabled        := True;
  fraDelegacionABM.Enabled    := True;
  chkconcurre.Checked         := False;
  ChkCrearParte.Enabled       := False;
  ChkCrearParte.Checked       := False;
  chkEstudiosABM.Checked      := False;
  gbAlta.Enabled              := False;
  OptContTratamiento.Checked  := True;
  Observac.enabled            := True;
  chkEvalLeveABM.Checked      := False;
  chkEvalLeveABM.Enabled      := True;
  chkModeradoABM.Checked      := False;
  chkModeradoABM.Enabled      := True;
  chkRecepDeclaracABM.Checked := False;
  chkRecepDeclaracABM.Enabled := False;

  rgAmeritaRemis.Enabled      := False;
  rgAmeritaRemis.ItemIndex    := -1;
  memoMecanismoAccid.Clear;
  LockControl(memoMecanismoAccid, true);
  LockControl(fraCIE10, true);

  rbDiasProbAlta.Checked      := False;      // TK 16829
  edDiasProbAlta.Clear;
  rbDiasProxCit.Checked       := False;
  edDiasProxCit.Clear;
  MemoTratamientoSugerido.Clear;
  LockControls([gbDiasProbables, gbTratSugerido, edDiasProbAlta, edDiasProxCit, MemoTratamientoSugerido], true);   // TK 16829

  rbSiAceptaReingreso.Checked := false;
  rbNoAceptaReingreso.Checked := false;
  MemoMotivoNoAceptaRein.Clear;
  rbSiAceptaReingreso.Enabled := False;
  rbNoAceptaReingreso.Enabled := False;
  LockControl(MemoMotivoNoAceptaRein, True);

  FPABM.ShowModal;
end;

procedure TfrmConsultorio.tbModificarClick(Sender: TObject);
begin
  inherited;
  FPABM.Caption             := 'Modificación de Consultorio';
  FPABM.tag                 := 1;
  SinEdit3.SetValues(sdqConsulta.FieldByName('CC_SINIESTRO').AsInteger,
                     sdqConsulta.FieldByName('CC_ORDEN').AsInteger,
                     sdqConsulta.FieldByName('CC_RECAIDA').AsInteger);
  lbldatsin.caption         := sdqConsulta.FieldByName('TRABAJADOR').AsString;
  edFechaABM.Date           := sdqConsulta.FieldByName('CC_FECHA').AsDateTime;
  edFechaTXT.Text           := DateFormat(edFechaABM.Date, dfLong);
  fraDelegacionABM.Value    := sdqConsulta.FieldByName('CC_DELEGACION').AsString;       // El orden de estos 4 debe ser asi por tk 1162
  fraMedicoABM.value        := sdqConsulta.FieldByName('CC_MEDICO').AsString;
  observac.Lines.Text       := sdqConsulta.FieldByName('CC_OBSERVACIONES').AsString;
  ObsAud.Lines.Text         := sdqConsulta.FieldByName('CC_OBSERVAUDITOR').AsString;
  chkEstudiosABM.Checked    := (sdqConsulta.FieldByName('CC_ESTUDIOS').AsString = 'S');
  chkEvalLeveABM.Checked    := (sdqConsulta.FieldByName('CC_EVALUACIONLEVE').AsString = 'S');
  chkModeradoABM.Checked    := (sdqConsulta.FieldByName('CC_MODERADO').AsString = 'S');
  chkRecepDeclaracABM.Checked    := (sdqConsulta.FieldByName('CC_RECDECLARACION').AsString = 'S');
  rgAmeritaRemis.ItemIndex  := IIF((sdqConsulta.FieldByName('EX_AMERITAREMIS').AsString = 'S'), 0,
                                IIF((sdqConsulta.FieldByName('EX_AMERITAREMIS').AsString = 'N'), 1, -1));
  rbSiAceptaReingreso.Checked := (sdqConsulta.FieldByName('CC_ACEPTARREINGRESO').AsString = 'S');
  rbNoAceptaReingreso.Checked := (sdqConsulta.FieldByName('CC_ACEPTARREINGRESO').AsString = 'N');
  MemoMotivoNoAceptaRein.Lines.Text := sdqConsulta.FieldByName('CC_MOTIVONOACEPTAREING').AsString;


  // TK 16829
  LockControls([gbDiasProbables, gbTratSugerido, edDiasProbAlta, edDiasProxCit, MemoTratamientoSugerido], false);  // TK 16829
  Do_MostrarDiasYTratam;
  LockControls([gbDiasProbables, gbTratSugerido, edDiasProbAlta, edDiasProxCit, MemoTratamientoSugerido], true);  // TK 16829

  fraCIE10.Value            := sdqConsulta.FieldByName('EX_DIAGNOSTICOOMS').AsString;
  rgAmeritaRemis.Enabled    := False;
  chkEvalLeveABM.Enabled    := True;
  chkModeradoABM.Enabled    := True;
  fraSectorABM.Cargar(sdqConsulta.FieldByName('CC_SECTOR').AsString);
  fraPrestador.Cargar(sdqConsulta.FieldByName('CC_IDPRESTADOR').AsInteger);
  if not(sdqConsulta.FieldByName('CC_TIPOALTA').IsNull) then
  begin
    OptAlta.Checked       := True;
    fraTipoAlta.Codigo    := sdqConsulta.FieldByName('CC_TIPOALTA').AsString;
  end
  else OptContTratamiento.Checked := True;
  sinedit3.Enabled        := False;
  ChkCrearParte.Checked   := False;
  ChkCrearParte.Enabled   := False; //solamente está habilitado cuando se da de alta
  if sdqConsulta.FieldByName('CC_CONCURRE').AsString  ='S' then
  begin
    chkconcurre.Checked      := True;
    gbAlta.Enabled           := True;
    edFechaABM.Enabled       := False;
    edHoraABM.Enabled        := False;
    fraMedicoABM.enabled     := False or sdqConsulta.FieldByName('CC_MEDICO').IsNull;
    fraSectorABM.enabled     := False;
    fraDelegacionABM.Enabled := False;
    fraPrestador.Enabled     := False;
  end else if sdqConsulta.FieldByName('CC_CONCURRE').AsString  ='N' then
  begin
    chkconcurre.Checked     := False;
    gbAlta.Enabled          := False;
    edFechaABM.Enabled      := False;
    edHoraABM.Enabled       := False;
    fraMedicoABM.enabled    := False or sdqConsulta.FieldByName('CC_MEDICO').IsNull;
    fraSectorABM.enabled    := False;
    fraDelegacionABM.Enabled:= False;
    fraPrestador.Enabled    := False;
  end else
  begin
    chkconcurre.Checked     := False;
    gbAlta.Enabled          := False;
    edFechaABM.Enabled      := True;
    edHoraABM.Enabled       := True;
    fraMedicoABM.enabled    := True;
    fraSectorABM.enabled    := True;
    fraDelegacionABM.Enabled:= True;
    fraPrestador.Enabled    := True;
  end;

  framedicoABMExit(nil);
  edHoraABM.Text          := sdqConsulta.FieldByName('CC_HORA').AsString;
  LockControl(fraCIE10, True);
  memoMecanismoAccid.Text := Get_MecanismoAccid(sdqConsulta.FieldByName('EX_ID').AsInteger);  // TK 11018
  LockControl(memoMecanismoAccid, true);
  rbSiAceptaReingreso.Enabled := False;
  rbNoAceptaReingreso.Enabled := False;
  LockControl(MemoMotivoNoAceptaRein, True);
  FPABM.ShowModal;
end;

procedure TfrmConsultorio.tbEliminarClick(Sender: TObject);
var
  sSql, sObsAnu, sObsParte :String; dardebaja: boolean;
begin
  dardebaja := true;
  Verificar(not HayRegistroActivo, Nil, 'Debe seleccionar un registro para eliminar.');
  //Verificar((sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'S'), Nil,                               //Ticket N°
  //         'No puede dar de baja el registro seleccionado porque ya ha sido marcado como concurre.');   // 28621
  if sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'S' then
    if msgask('Se está por dar de baja un turno ya marcado como ''CONCURRE'', desea continuar?', 'Atención') = false then
        dardebaja := false;

  Verificar(not sdqConsulta.FieldByName('CC_FECHABAJA').IsNull, Nil,
           'No puede dar de baja el registro seleccionado porque ha sido dado de baja.');

  if (dardebaja = true) and (fpAnular.ShowModal = mrOk) then
  begin
    // Cargo los valores en los frames ya que se utilizarán en la carga del PE
    // si no lo hiciera daría error salvo que edite y luego de la baja
    fraDelegacionABM.Value  := sdqConsulta.FieldByName('CC_DELEGACION').AsString;
    fraMedicoABM.value      := sdqConsulta.FieldByName('CC_MEDICO').AsString;

    sObsAnu   := IIF(Trim(edObservacionesAnu.Text) <> '', ' - ' + edObservacionesAnu.Lines.Text, '');
    sObsParte := fraMotivoAnulacion.cmbDescripcion.Text + sObsAnu;
    //doy de baja el turno....
    sSql := 'UPDATE mcc_citacionconsultorio ' +
              ' SET cc_idmotanulacion = ' + SqlInt(fraMotivoAnulacion.ID) + ',' +
                  ' cc_observaciones = cc_observaciones || ' + SqlValue(sObsAnu) + ',' +
                  ' cc_fechabaja = ActualDate, ' +
                  ' cc_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE cc_id = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger);
    BeginTrans;
    try
      EjecutarSqlST(sSql);
      //agrego parte evolutivo de tipo administrativo...
      AgregarParteEvolutivo(sdqConsulta.FieldByName('CC_SINIESTRO').AsInteger,
                            sdqConsulta.FieldByName('CC_ORDEN').AsInteger,
                            sdqConsulta.FieldByName('CC_RECAIDA').AsInteger,
                            sdqConsulta.FieldByName('CC_ID').AsInteger,
                            sdqConsulta.FieldByName('CC_FECHA').AsDateTime,
                            sObsParte, False, '', True);
      CommitTrans;
    except
      on E:Exception do
      begin
        Rollback(True);
        ErrorMsg(E, 'Error al intentar dar de baja el registro.');
      end;
    end;
    tbRefrescar.Click;
    MsgBox('Registro Eliminado');
  end;
end;

procedure TfrmConsultorio.SinEdit3Exit(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  sSql := 'SELECT 1 ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SinEdit3.SiniestroSql +
            ' AND ex_orden = ' + SinEdit3.OrdenSql +
            ' AND ex_recaida = ' + SinEdit3.RecaidaSql;
            
  if fraTrabajador.Tercerizadoras then
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if not ExisteSql(sSql) then
  begin
    if fraTrabajador.Tercerizadoras then
      InfoHint(SinEdit3, 'El siniestro seleccionado no existe o bien usted no tiene permiso para visualizarlo.')
    else
      InfoHint(SinEdit3, 'El siniestro seleccionado no existe.');
    SinEdit3.Clear;
    SinEdit3.SetFocus;
  end
  else if not Validar_SML(Sesion.UserID, Get_IdExpediente(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida)) then  // Plan - SML
  begin
    InfoHint(SinEdit3, 'Usted no posee permiso para cargar citaciones a este siniestro.');
    SinEdit3.Clear;
    SinEdit3.SetFocus;
  end
  else begin
    sSql := 'SELECT tj_nombre || '' - '' || ex_fechaaccidente trabajador, ex_diagnosticooms ' +
             ' FROM sex_expedientes, ctj_trabajador ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_siniestro = :Sini '  +
              ' AND ex_orden = :Orden ' +
              ' AND ex_recaida = :Reca ';
    with GetQueryEx(sSql, [SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida]) do
    try
      lbldatsin.Caption := FieldByName('trabajador').AsString;
      fraCIE10.Value    := FieldByName('ex_diagnosticooms').AsString;
    finally
      Free;
    end;
    memoMecanismoAccid.Text := Get_MecanismoAccid(Get_IdExpediente(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida));  // TK 11018
  end;

end;

procedure TfrmConsultorio.SumatoriaRegistros;
begin
  if not sdqConsulta.IsEmpty then
    StatusBar.Panels[0].Text := 'Cantidad: ' + IntToStr(sdqConsulta.RecordCount)
  else
    StatusBar.Panels[0].Text := 'No se han encontrado registros.';
end;

procedure TfrmConsultorio.BorrarSumatoriaRegistros;
begin
  StatusBar.Panels[0].Text := '';
end;

procedure TfrmConsultorio.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                            var Background: TColor; Highlight: Boolean);
begin

  if not sdqConsulta.FieldByName('CC_FECHABAJA').IsNull then
    AFont.Color := clRed;

  if (sdqConsulta.FieldByName('CC_ENESPERA').AsString = 'S') then
    BackGround := TColor(clMoneyGreen);
  if (sdqConsulta.FieldByName('CC_ESPCONREMIS').AsString = 'S') then
    BackGround := TColor($00B0B0FF);

  if sdqConsulta.FieldByName('declaracionpend').AsString = 'S' then  //DG 05/12/14
    BackGround := TColor($00D7FF);

end;

procedure TfrmConsultorio.tbConcurreClick(Sender: TObject);
begin
  if not(HayRegistroActivo) or (sdqConsulta.FieldByName('CC_CONCURRE').AsString  ='S') then exit;
  {verificar(StrToInt(ValorSqlEx('select nvl(ex_causafin, 0) from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec',
                      [sdqConsulta.FieldByName('cc_siniestro').AsInteger, sdqConsulta.FieldByName('cc_orden').AsInteger, sdqConsulta.FieldByName('cc_recaida').AsInteger])) in CausasNoValidas, tbConcurre,
                       'No se puede marcar como "concurre" un siniestro rechazado o cerrado por error de carga'); } //se saca por Ticket 53100 
  if sdqConsulta.FieldByName('CC_FECHA').Value <= DBDate then
    MostrarConcurre
  else
    MsgBox('Aún no ha pasado la fecha pactada para el turno, ' +
          ' si desea anularlo debe darlo de baja.');
end;

procedure TfrmConsultorio.tbNoConcurreClick(Sender: TObject);
begin
  if (sdqConsulta.Active) then NoConcurre(tbNoConcurre.Hint);
end;

function TfrmConsultorio.Validar: Boolean;
//var sLeyendaTopeado: string;
begin
  Verificar((fpABM.Tag <> 0) and not sdqConsulta.FieldByName('CC_FECHABAJA').IsNull,
            btnAceptar, 'Imposible modificar un registro dado de baja.');
  Verificar(SinEdit3.IsEmpty, SinEdit3, 'Debe ingresar siniestro.');
  {verificar(StrToInt(ValorSqlEx('select nvl(ex_causafin, 0) from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec',
                      [sinedit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida])) in CausasNoValidas, SinEdit3,
                       'No se puede cargar turnos en consultorio para los siniestros rechazados o cerrados por error de carga');} //se saca por Ticket 53100 
//  Verificar(EsSiniestroTopeado(Get_IdExpediente(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida), 'C', sLeyendaTopeado), SinEdit3, sLeyendaTopeado);  // Plan Tope de Siniestros por CIE-10

 // Verificar(EsSiniestroTopeado(Get_IdExpediente(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida), 'A', sLeyendaTopeado), SinEdit3, sLeyendaTopeado);    // Plan Tope de Siniestros por Autorizacion

  Verificar(fraSectorABM.IsEmpty, fraSectorABM.edCodigo, 'Debe ingresar un sector.');
  Verificar((fraPrestador.IsEmpty) and (fpABM.Tag = 0), fraPrestador, 'Debe ingresar un prestador.');
  Verificar(fraDelegacionABM.IsEmpty, fraDelegacionABM.edCodigo, 'Debe ingresar la delegación.');
  Verificar(fraMedicoABM.IsEmpty, fraMedicoABM.edCodigo, 'Debe ingresar un médico.');
  Verificar(edFechaABM.IsEmpty, edFechaABM, 'Debe ingresar la fecha.');
  verificar(VerificarLicencias(fraMedicoABM.value, datetostr(edFechaABM.Date)), fraMedicoABM, 'El médico se encuentra de licencia en la fecha seleccionada');
  Verificar((edFechaABM.Date < DBDate) and not(Seguridad.Claves.IsActive('CargarConFechaPosterior')),
            edFechaABM, 'No posee permisos para cargar fechas anteriores a la actual.');
  Verificar(not(IsTime(edHoraABM.Text)), edHoraABM, 'La Hora de citación ingresada es inválida');
  Verificar(OptAlta.Checked and fraTipoAlta.IsEmpty, fraTipoAlta.edCodigo, 'Debe ingresar el tipo de alta.');

  Verificar(rbSiAceptaReingreso.Enabled and (not rbSiAceptaReingreso.checked and not rbNoAceptaReingreso.Checked), gbMotivoNoAceptaRein, 'Debe ingresar si se Acepta o no el Reingreso');
  Verificar(rbSiAceptaReingreso.Enabled and rbNoAceptaReingreso.Checked and (MemoMotivoNoAceptaRein.Lines.Text = ''), MemoMotivoNoAceptaRein, 'Debe ingresar el motivo de la no aceptación del Reingreso');

  Verificar((fpABM.Tag = 2) and (rgAmeritaRemis.ItemIndex = -1), rgAmeritaRemis, 'Debe ingresar si amerita remis o no.');
  if (fpABM.Tag <> 2) and ExisteOtroTurno(fpABM.Tag = 0) then
    Result := (MsgBox('Ya existe un turno (fecha/hora) para el médico seleccionado.' + #13 +
                      '¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    Result := True;
end;

function TfrmConsultorio.ValidarConcurre: Boolean;      // TK 8673
begin
  Verificar(fraCIE10.IsEmpty, fraCIE10, 'Debe ingresar un CIE10 para guardar los cambios');
  Verificar((Observac.Lines.Text = ''), Observac, 'Debe ingresar las Observaciones para continuar');                     // TK 43264
  Verificar(Length(Trim(Observac.Lines.Text)) < 5, Observac, 'Las observaciones deben contener al menos 5 caracteres');  // TK 43264
  Verificar(Trim(memoMecanismoAccid.Text) = '', memoMecanismoAccid, 'Debe ingresar el Mecanismo Accidentológico para continuar');  // TK 11018
  Verificar((not OptAlta.Checked) and (edDiasProbAlta.IsEmpty and edDiasProxCit.IsEmpty), gbDiasProbables, 'Debe ingresar la cantidad de Días Probable de Alta ó de Próxima Citación');  // TK 16829
  Verificar((not OptAlta.Checked) and (Trim(MemoTratamientoSugerido.Lines.Text) = ''), MemoTratamientoSugerido, 'Debe ingresar el Tratamiento Sugerido'); // TK 16829
  Result := True;
end;

procedure TfrmConsultorio.AgregarParteEvolutivo(Siniestro, Orden, Recaida, IdCitacion :Integer;
                                                Fecha :TDate; Observaciones :String; EsAuditoria :Boolean;
                                                Cie10: String; EsTurno :Boolean = False);
var
  SQL:TSQL;
  Consulta : TSDQuery;
  sSql, NroParte, Cie, GravCie, Diagnostico, ProtGeneral :String;
  IdPrestador, vPrestador :Integer;
  Tiene :Boolean;
begin
  vPrestador := 0;
  //-----[ Calcula el Número del nuevo parte y el Prestador por defecto ]------------------------------------------//
  sSql := 'SELECT pv_nroparte, pv_identifprestador, pv_diagnostico, pv_protocologeneral, ' +
                ' pv_diagnosticooms, pv_gravedadcie10 ' +
           ' FROM spv_parteevolutivo t1 ' +
          ' WHERE pv_siniestro = :Sini ' +
            ' AND pv_orden = :Orden ' +
            ' AND pv_recaida = :Reca ' +
            ' AND pv_nroparte = (SELECT max(pv_nroparte) ' +
                                 ' FROM spv_parteevolutivo t2 ' +
                                 ' WHERE t1.pv_siniestro = t2.pv_siniestro ' +
                                   ' AND t1.pv_orden = t2.pv_orden ' +
                                   ' AND t1.pv_recaida = t2.pv_recaida)';
  Consulta := GetQueryEx(sSql, [Siniestro, Orden, Recaida]);

  if EsTurno then //si es un alta de turno, el prestador es el de la delegacion
    vPrestador := ValorSqlIntegerEx('SELECT ca_identificador FROM cpr_prestador ' +
                                    ' WHERE ca_delegacion = :del ' +
                                      ' AND ca_clave = :cuit ', [fraDelegacionABM.Codigo, ART_CUIT])
  //el prestador nuevo es el idPrestador que tiene en au_prestador
  else if (fpABM.Tag=2) and not(fraMedicoABM.IsEmpty) then //estoy en concurre, el valor del medico es el de fraMedicoABM
    vPrestador := ValorSqlEx('SELECT NVL(au_prestador, 0) FROM mau_auditores ' +
                             ' WHERE au_auditor = :Audi ', [fraMedicoABM.Codigo])
  else if HayRegistroActivo and not(sdqConsulta.FieldByName('AU_AUDITOR').IsNull) then
  //estoy en no concurre, el valor del medico es el de la grilla (si tiene)
    vPrestador := ValorSqlEx('SELECT NVL(au_prestador, 0) FROM mau_auditores ' +
                             ' WHERE au_auditor = :Audi ', [sdqConsulta.FieldByName('AU_AUDITOR').AsString]);
  if (vPrestador > 0) then IdPrestador := vPrestador
  else if HayRegistroActivo and not(sdqConsulta.FieldByName('LG_CODIGO').IsNull) then //el prestador del nuevo parte es el consultorio de la delegacion
    IdPrestador := ValorSqlIntegerEx('SELECT ca_identificador FROM cpr_prestador ' +
                                      ' WHERE ca_delegacion = :del ' + 
                                        ' AND ca_clave = :cuit ', [sdqConsulta.FieldByName('LG_CODIGO').AsString, ART_CUIT])     // saque el sqlValue porque no va y daba 0 cuando no debia dar el query.
  else IdPrestador := 0;

  try
    if Consulta.Eof then
    begin
      NroParte := '1';
      Tiene := False;
    end else
    begin
      Tiene       := True;
      NroParte    := IntToStr(Consulta.FieldByName('PV_NROPARTE').AsInteger + 1);
      if (Cie10 = '') then      // TK 8673 - Si el parametro Cie10 es blanco, queda todo como estaba y se le asigna el cie10 anterior como aca.
        Cie := Consulta.FieldByName('PV_DIAGNOSTICOOMS').AsString
      else
        Cie := Cie10;   // TK 8673 - Sino (solo en la marca de concurre se guarda), se guarda el que vino por parametro.
      GravCie     := Consulta.FieldByName('PV_GRAVEDADCIE10').AsString;
      Diagnostico := Consulta.FieldByName('PV_DIAGNOSTICO').AsString;
      ProtGeneral := Consulta.FieldByName('PV_PROTOCOLOGENERAL').AsString;
    end;
    //------------------------------------------------------------------------------------------------
  finally
    Consulta.Free;
  end;

  SQL:= TSQL.Create;
  try
    SQL.TableName:='SPV_PARTEEVOLUTIVO';
    SQL.Fields.Add('PV_SINIESTRO',Siniestro);
    SQL.Fields.Add('PV_ORDEN',Orden);
    SQL.Fields.Add('PV_RECAIDA',Recaida);
    SQL.Fields.Add('PV_IDCITACION', IdCitacion);
    SQL.Fields.Add('PV_NROPARTE',NroParte);
    SQL.Fields.Add('PV_FECHARECEPCION','ACTUALDATE',False);

    if not(EsTurno) and (Fecha < Now) then
      SQL.Fields.Add('PV_FECHACONTROL',SqlDate(Fecha),False)
    else
      SQL.Fields.Add('PV_FECHACONTROL','ACTUALDATE',False);

    SQL.Fields.Add('PV_FECHAALTA','ACTUALDATE',False);
    SQL.Fields.Add('PV_USUALTA',Sesion.UserID);
    SQL.Fields.Add('PV_OBSERVACIONES',Observaciones);
    if IdPrestador <> 0 then SQL.Fields.Add('PV_IDENTIFPRESTADOR', IntToStr(IdPrestador));

    if EsAuditoria then //estoy en "concurre"
      SQL.Fields.Add('PV_TIPOPARTE','C') //tipo de parte "Auditoria en consultorio"
    else //estoy en "no concurre"
      SQL.Fields.Add('PV_TIPOPARTE','A'); //tipo de parte "Administrativo"

    if Tiene then //trae los datos del parte anterior
    begin
      SQL.Fields.Add('PV_DIAGNOSTICOOMS', Cie);
      SQL.Fields.Add('PV_GRAVEDADCIE10', GravCie);
      SQL.Fields.Add('PV_DIAGNOSTICO', Diagnostico);
      SQL.Fields.Add('PV_PROTOCOLOGENERAL', ProtGeneral);
    end;

    if EsTurno then
    begin
      SQL.Fields.Add('PV_AUDITOR', fraMedicoABM.Codigo);
      SQL.Fields.Add('PV_PROXIMOCONTROL', SqlDate(Fecha),False);
      SQL.Fields.Add('PV_TURNO', SqlDate(Fecha), False);
      SQL.Fields.Add('PV_TURNOHORA', edHoraABM.Text);
    end
    else
      SQL.Fields.Add('PV_AUDITOR',sdqConsulta.FieldByName('AU_AUDITOR').AsString);

    EjecutarSQLST(SQL.InsertSql);
  finally
    SQL.Free;
  end;
end;

procedure TfrmConsultorio.MostrarConcurre;
begin
  FPABM.Caption               := 'Concurre';
  FPABM.tag                   := 2;
  sinedit3.SetValues(sdqConsulta.FieldByName('CC_SINIESTRO').AsString,
                     sdqConsulta.FieldByName('CC_ORDEN').AsString,
                     sdqConsulta.FieldByName('CC_RECAIDA').AsString);
  lbldatsin.caption           := sdqConsulta.FieldByName('TRABAJADOR').AsString;
  edFechaABM.Date             := sdqConsulta.FieldByName('CC_FECHA').AsDateTime;
  edFechaTXT.Text             := DateFormat(edFechaABM.Date, dfLong);
  edHoraABM.Text              := sdqConsulta.FieldByName('CC_HORA').AsString;
  fraMedicoABM.value          := sdqConsulta.FieldByName('CC_medico').AsString;
  fraSectorABM.Cargar(sdqConsulta.FieldByName('CC_SECTOR').AsString);
  fraDelegacionABM.Value      := sdqConsulta.FieldByName('CC_DELEGACION').AsString;
  observac.Lines.Text         := sdqConsulta.FieldByName('CC_OBSERVACIONES').AsString;
  ObsAud.Lines.Text           := sdqConsulta.FieldByName('CC_OBSERVAUDITOR').AsString;
  chkEstudiosABM.Checked      := (sdqConsulta.FieldByName('CC_ESTUDIOS').AsString = 'S');
  chkEvalLeveABM.Checked      := (sdqConsulta.FieldByName('CC_EVALUACIONLEVE').AsString = 'S');
  chkModeradoABM.Checked      := (sdqConsulta.FieldByName('CC_MODERADO').AsString = 'S');
  chkRecepDeclaracABM.Checked := (sdqConsulta.FieldByName('CC_RECDECLARACION').AsString = 'S');
  chkRecepDeclaracABM.Enabled := (sdqConsulta.FieldByName('CC_ENTDECLARACION').AsString = 'S');

  // TK 16829
  Do_MostrarDiasYTratam;
  LockControls([gbDiasProbables, gbTratSugerido, {edDiasProbAlta, edDiasProxCit,} MemoTratamientoSugerido], false);  // TK 16829

  rgAmeritaRemis.ItemIndex    := -1;
  rgAmeritaRemis.Enabled      := True;
  sinedit3.Enabled            := False;
  ChkCrearParte.Checked       := True; //chequeado para que cree el parte 'Auditoria en Consultorio
  ChkCrearParte.Enabled       := False;
  gbAlta.Enabled              := True;
  OptContTratamiento.Checked  := True;
  ChkConcurre.Checked         := True;
  ChkConcurre.Enabled         := False;
  chkEvalLeveABM.Enabled      := False;
  chkModeradoABM.Enabled      := False;
  edFechaABM.enabled          := False;
  edHoraABM.enabled           := False;
  fraMedicoABM.enabled        := False or sdqConsulta.FieldByName('CC_MEDICO').IsNull;
  fraSectorABM.enabled        := False;
  fraDelegacionABM.Enabled    := False;
  DoHabilitar_AceptarReingreso(SinEdit3.Siniestro, SinEdit3.Orden, SinEdit3.Recaida);  // TK 63627
  fraCIE10.Value              := sdqConsulta.FieldByName('EX_DIAGNOSTICOOMS').AsString;
  LockControl(fraCIE10, False);
  memoMecanismoAccid.Text     := Get_MecanismoAccid(sdqConsulta.FieldByName('EX_ID').AsInteger);  // TK 11018
  LockControl(memoMecanismoAccid, (memoMecanismoAccid.Text <> ''));
  FPABM.ShowModal;
end;

procedure TfrmConsultorio.OptContTratamientoClick(Sender: TObject);
begin
  fraTipoAlta.Clear;
  fraTipoAlta.Enabled := False;
end;

procedure TfrmConsultorio.OptAltaClick(Sender: TObject);
begin
  fraTipoAlta.Enabled := True;
end;

procedure TfrmConsultorio.NoConcurre(Comentario :String);
begin
  if (sdqConsulta.FieldByName('CC_SINIESTRO').IsNull) or
     not(sdqConsulta.FieldByName('CC_CONCURRE').IsNull) or
     not(sdqConsulta.FieldByName('CC_FECHABAJA').IsNull) then exit;
  if sdqConsulta.FieldByName('CC_FECHA').Value <= DBDate then
  begin
    try
      BeginTrans;
      EjecutarSQLST('UPDATE mcc_citacionconsultorio ' +
                      ' SET cc_concurre=''N'', ' +
                          ' cc_enespera = ''N'', ' + // Lu 02/05/2008: se saca la marca de Paciente en Espera.
                          ' cc_espconremis = ''N'', ' + // Lu por TK 435
                          ' cc_fechamodif = ActualDate, ' +
                          ' cc_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                          ' cc_observaciones = ''' + Comentario + ''' ' +
                    ' WHERE cc_id=' + sdqConsulta.FieldByName('CC_ID').AsString);

      AgregarParteEvolutivo(sdqConsulta.FieldByName('CC_SINIESTRO').AsInteger,
                            sdqConsulta.FieldByName('CC_ORDEN').AsInteger,
                            sdqConsulta.FieldByName('CC_RECAIDA').AsInteger,
                            sdqConsulta.FieldByName('CC_ID').AsInteger,
                            sdqConsulta.FieldByName('CC_FECHA').AsDateTime,
                            Comentario, False, '', False);

      CommitTrans;
      tbRefrescar.Click;
      MsgBox('Marca de NO CONCURRE colocada con éxito.');

    except
      on E:Exception do
      begin
        Rollback(True);
        ErrorMsg(E, 'Error al intentar colocar marca de NO CONCURRE.');
      end;
    end;
  end else
    MsgBox('Aún no ha pasado la fecha pactada para el turno, ' +
          ' por lo tanto no puede saber si el paciente concurrió o no concurrió, ' +
          ' si desea anular el turno debe darlo de baja.');
end;

function TfrmConsultorio.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.Eof);
end;

function TfrmConsultorio.ExisteOtroTurno(bEsAlta :Boolean) :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT 1 FROM mcc_citacionconsultorio ' +
          ' WHERE cc_fecha = ' + SqlDate(edFechaABM.Date) +
            ' AND cc_hora = ' + SqlValue(edHoraABM.Text) +
            ' AND cc_medico = ' + SqlValue(fraMedicoABM.Value) +
            ' AND cc_fechabaja IS NULL ';
  if not(bEsAlta) then
    sSql := sSql + ' AND cc_id <> ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger);

  Result := ExisteSql(sSql)
end;

procedure TfrmConsultorio.tbEvaluacionClick(Sender: TObject);
begin
  if HayRegistroActivo and not(Assigned(frmEvaluacionMedica)) then
  with frmEvaluacionMedica do
  begin
    frmEvaluacionMedica := TfrmEvaluacionMedica.Create(Self);
    FormStyle           := fsMDIChild;
    Execute(Self.sdqConsulta.FieldByName('EX_ID').AsInteger, GetNroParte, False);
    Show;
  end;
end;

procedure TfrmConsultorio.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  tbEvaluacion.Enabled  := Seguridad.Activar(tbEvaluacion) and
                           (sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'S');

  tbModificarMedico.Enabled := Seguridad.Activar(tbModificarMedico) and
                               (sdqConsulta.FieldByName('CC_FECHABAJA').IsNull) and
                               (sdqConsulta.FieldByName('CC_FECHA').AsDateTime >= DBDate) and
                               (sdqConsulta.FieldByName('CC_CONCURRE').IsNull);               // TK 48382

  mnuSinRemis.Checked  := (sdqConsulta.FieldByName('CC_ENESPERA').AsString = 'S');
  mnuConRemis.Checked  := (sdqConsulta.FieldByName('CC_ESPCONREMIS').AsString = 'S');
  tbModificar.Enabled  := not (sdqConsulta.FieldByName('CC_CONCURRE').AsString = '');

  inherited;
end;

function TfrmConsultorio.GetNroParte :Integer;
var
  sSql :String;
begin
  sSql    := 'SELECT max(pv_nroparte) ' +
              ' FROM spv_parteevolutivo ' +
             ' WHERE pv_idexpediente = :IdExped ' +
               ' AND pv_idcitacion = :IdCitacion ';
  Result  := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('EX_ID').AsInteger,
                                      sdqConsulta.FieldByName('CC_ID').AsInteger]);
end;

procedure TfrmConsultorio.edFechaABMExit(Sender: TObject);
begin
  if edFechaABM.Date = 0 then
    edFechaTXT.Text := ''
  else
    edFechaTXT.Text := DateFormat(edFechaABM.Date, dfLong);
end;

procedure TfrmConsultorio.DoHabilitarHora(bHabilitar: Boolean);       // Lu TK 1162
begin
  edHoraABM.Clear;

  if not Seguridad.Claves.IsActive('FechaProximoTurno') then // si la clave no esta activada, entonces procede a habilitar o no la HOra, segun corresponda.
    edHoraABM.Enabled := not(bHabilitar)
  else
    edHoraABM.Enabled := True;   // en cambio si la clave esta activada, fuerza a que se habilite siempre la hora.

  btnGetTurno.Visible := bHabilitar;
end;

procedure TfrmConsultorio.DoHabilitar_AceptarReingreso(iSiniestro, iOrden,iRecaida: integer);
var bhab: boolean;
begin
  rbSiAceptaReingreso.Checked := false;
  rbNoAceptaReingreso.Checked := false;
  MemoMotivoNoAceptaRein.Clear;

  bhab :=  (fpABM.Caption = 'Concurre') and (not SinEdit3.IsEmpty) and (iSiniestro > 0) and (iRecaida > 0);
  rbSiAceptaReingreso.Enabled := bhab;
  rbNoAceptaReingreso.Enabled := bhab;
  LockControl(MemoMotivoNoAceptaRein, True);       // lo deshabilito
end;

procedure TfrmConsultorio.rbNoAceptaReingresoClick(Sender: TObject);
begin
  Do_HabMotivoNoAcepta;
end;

procedure TfrmConsultorio.rbSiAceptaReingresoClick(Sender: TObject);
begin
  Do_HabMotivoNoAcepta;
end;

procedure TfrmConsultorio.Do_HabMotivoNoAcepta;
begin
  LockControl(MemoMotivoNoAceptaRein, (not rbNoAceptaReingreso.Checked));
end;

procedure TfrmConsultorio.Do_ImprimirReportes(iIdExped, iIdCC: integer); // TK 63627
begin
  if rbSiAceptaReingreso.Checked then
  begin
    // Imprime Solicitud de Reingreso
    with sdqConsulta, TfrmRptSolicitudReingreso.Create(Self) do
    try                                                                                                                             // por TK 63718
      Imprimir(iIdExped, iIdCC, FieldByName('SINIESTRO').AsString, FieldByName('CC_SINIESTRO').AsInteger, FieldByName('CC_IDPRESTADOR').AsInteger);
    finally
      Free;
    end;

  end
  else if rbNoAceptaReingreso.Checked then
  begin
    // Imprime Solicitud de Reingreso
    with sdqConsulta, TfrmRptSolicitudReingreso.Create(Self) do
    try                                                                                                                             // por TK 63718
      Imprimir(iIdExped, iIdCC, FieldByName('SINIESTRO').AsString, FieldByName('CC_SINIESTRO').AsInteger, FieldByName('CC_IDPRESTADOR').AsInteger);
    finally
      Free;
    end;

    // Imprime Parte de Egreso (fin de tratamiento - Alta medica)
    with sdqConsulta, TrptParteEgreso.Create(Self) do
    try                                                                                                                             // por TK 63718
      Imprimir(FieldByName('SINIESTRO').AsString, iIdExped, FieldByName('CC_SINIESTRO').AsInteger, FieldByName('CC_IDPRESTADOR').AsInteger);
    finally
      Free;
    end;
  end;

end;

{procedure TfrmConsultorio.DoEvaluarColocarAltaMedica(iIdExped, iRecaida, iIdPrestador, iIdDiagnostico, iGravedadCIE10, iIdGravedad: integer; dFBaja: TDateTime);
var sSql: string;
begin
  if rbNoAceptaReingreso.Checked and (iRecaida > 0) then
  begin
    sSql := 'art.SINIESTRO.DO_INSERTAR_EGRESO(' + SqlInt(iIdExped) + ', ' + SqlInt(iIdPrestador) + ', ' + SqlVAlue(sdqconsulta.fieldByName('EX_DIAGNOSTICO').AsString) + ', ' +
                                                  SqlInt(iIdDiagnostico) + ', ' + SqlInt(iGravedadCIE10) + ', ''2'', ' +
                                                  SqlInt(iIdGravedad) + ', ' + SqlDate(dFBaja) + ' , art.actualdate, ' +
                                               ' ''Generación automática por rechazo de solicitud de reingreso'', ' + SqlValue(Sesion.UserId) + ', ''N'', null, ''N'');';

    EjecutarStoreST(sSql);
  end;
end;   }

procedure TfrmConsultorio.DoObtenerTurno(dFecha: TDate; sMedico: String);    // Lu TK 1162
var sTurno, sSql :String;
begin
  sSql := 'SELECT art.amebpba.get_proximoturno(' +
                 SqlValue(sMedico) + ',' +
                 SqlDate(dFecha) + ') FROM dual';
  sTurno := ValorSql(sSql);

  if (Length(sTurno) = 5) then //dio un horario como resultado
    edHoraABM.Text := sTurno
  else begin                 // dio el mensaje como resultado
    MsgBox(sTurno);
    edFechaABM.Clear;
    edFechaTXT.Text := '';
    edHoraABM.Clear;
  end;
end;

procedure TfrmConsultorio.framedicoABMExit(Sender: TObject);
var
  sSql :String;
  bTieneTurnos, bExisteDelegEnPrest :Boolean;
begin
  inherited;
  if not(framedicoABM.IsEmpty) and not(fraDelegacionABM.IsEmpty) then   // Lu TK 1162
  begin
    sSql := 'SELECT 1 ' +
             ' FROM cpr_prestador ' +
            ' WHERE ca_delegacion = ' + SqlInt(StrToInt(fraDelegacionABM.Codigo)) +
              ' AND ca_fechabaja IS NULL';
    bExisteDelegEnPrest := ExisteSql(sSql);

    if bExisteDelegEnPrest then
    begin
      sSql := 'SELECT 1' +
               ' FROM stm_turnosmedicos' +
              ' WHERE tm_auditor = ' + SqlInt(StrToInt(framedicoABM.Codigo)) +
                ' AND tm_fechabaja IS NULL';
      bTieneTurnos := ExisteSql(sSql);

      DoHabilitarHora(bTieneTurnos);
    end;
  end;
end;

procedure TfrmConsultorio.edFechaABMEnter(Sender: TObject);
begin
  dFechaAux := edFechaABM.Date;
end;

procedure TfrmConsultorio.DoActualizarParteAut;
var
  sSql :String;
begin
  if not(edFechaABM.IsEmpty) and (dFechaAux > 0) and
    (edFechaABM.Date <> dFechaAux) then
  begin
    sSql := 'UPDATE sau_autorizaciones ' +
              ' SET au_turno = ' + SqlDate(edFechaABM.Date) + ',' +
                  ' au_turnohora = ' + SqlValue(edHoraABM.Text) + ',' +
                  ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' au_fechamodif = ActualDate ' +
            ' WHERE au_siniestro = ' + SqlInt(sdqConsulta.FieldByName('CC_SINIESTRO').AsInteger) +
              ' AND au_orden = ' + SqlInt(sdqConsulta.FieldByName('CC_ORDEN').AsInteger) +
              ' AND au_recaida = ' + SqlInt(sdqConsulta.FieldByName('CC_RECAIDA').AsInteger) +
              ' AND au_numauto = ' + SqlInt(sdqConsulta.FieldByName('CC_NUMAUTO').AsInteger);
    EjecutarSqlST(sSql);
    sSql := ' - SE MODIFICA CITACION PARA EL DIA: ' + edFechaABM.Text;
  end;
  //modifica solamente la observacion del parte evolutivo
  EjecutarSqlST('UPDATE spv_parteevolutivo ' +
                  ' SET pv_observaciones = ' + SqlValue(Observac.Lines.Text + sSql) +
                ' WHERE pv_idcitacion = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsString));
end;


procedure TfrmConsultorio.btnAnuAceptarClick(Sender: TObject);
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe seleccionar un motivo de anulación.');
  fpAnular.ModalResult := mrOk;
end;

procedure TfrmConsultorio.fpAnularBeforeShow(Sender: TObject);
begin
  fraMotivoAnulacion.Clear;
  edObservacionesAnu.Clear;
end;

procedure TfrmConsultorio.chkEvalLeveABMClick(Sender: TObject);
begin
  if chkEvalLeveABM.Checked then
    chkModeradoABM.Checked := False;
end;

procedure TfrmConsultorio.chkModeradoABMClick(Sender: TObject);
begin
  if chkModeradoABM.Checked then
    chkEvalLeveABM.Checked := False;
end;

procedure TfrmConsultorio.chkEvalLeveClick(Sender: TObject);
begin
  if chkEvalLeve.Checked then
    chkModerado.Checked := False;
end;

procedure TfrmConsultorio.chkModeradoClick(Sender: TObject);
begin
  if chkModerado.Checked then
    chkEvalLeve.Checked := False;
end;

procedure TfrmConsultorio.mnuImprimirParteEgresoClick(Sender: TObject);
begin
  inherited;
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un siniestro.');
  with sdqConsulta, TrptParteEgreso.Create(Self) do
  try                                                                                                                             // por TK 63718
    Imprimir(FieldByName('SINIESTRO').AsString, FieldByName('EX_ID').AsInteger, FieldByName('CC_SINIESTRO').AsInteger, FieldByName('CC_IDPRESTADOR').AsInteger);
  finally
    Free;
  end;
end;

// Lu 04/2008
procedure TfrmConsultorio.tbPacEnEsperaClick(Sender: TObject);
begin
  tbPacEnEspera.CheckMenuDropdown;     // Lu Tk 435
end;

procedure TfrmConsultorio.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultorio.mnuImprimirGrillaClick(Sender: TObject);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then QueryPrint.Print;
end;

procedure TfrmConsultorio.mnuSinRemisClick(Sender: TObject);
begin
  inherited;
  mnuSinRemis.Checked := not(mnuSinRemis.Checked);
  Do_PacienteEnEspera;   // Lu Tk 435
end;

procedure TfrmConsultorio.mnuSolicitudReingresoClick(Sender: TObject);
begin
  inherited;
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un siniestro.');

  with sdqConsulta, TfrmRptSolicitudReingreso.Create(Self) do
  try                                                                                                                             // por TK 63718
    Imprimir(FieldByName('EX_ID').AsInteger, FieldByName('CC_ID').AsInteger, FieldByName('SINIESTRO').AsString, FieldByName('CC_SINIESTRO').AsInteger, FieldByName('CC_IDPRESTADOR').AsInteger);
  finally
    Free;
  end;
end;

procedure TfrmConsultorio.mnuConRemisClick(Sender: TObject);
begin
  inherited;
  mnuConRemis.Checked := not(mnuConRemis.Checked);
  Do_PacienteEnEspera;   // Lu Tk 435
end;

procedure TfrmConsultorio.Do_PacienteEnEspera;
begin

  if  (DBDate <> sdqConsulta.FieldByName('CC_FECHA').AsDateTime)
   or (sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'S')
   or (sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'N') then
  begin
     mnuSinRemis.Checked := False;
     mnuConRemis.Checked := False;
  end;

  Verificar((DBDate <> sdqConsulta.FieldByName('CC_FECHA').AsDateTime), Nil,
             'No es posible cambiar el estado de Paciente en Espera:' + #13 +
             'La fecha del turno no pertenece al día de hoy.');
  Verificar((sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'S'), Nil,
             'No es posible cambiar el estado de Paciente en Espera:' + #13 +
             'El Trabajador ya concurrió a la cita.' );
  Verificar((sdqConsulta.FieldByName('CC_CONCURRE').AsString = 'N'), Nil,
             'No es posible cambiar el estado de Paciente en Espera:' + #13 +
             'El Trabajador No concurrió a la cita.' );

  EjecutarSqlEx('UPDATE mcc_citacionconsultorio ' +
                   'SET cc_enespera = ' + IIF(mnuSinRemis.Checked, '''S''', '''N''') + ', ' +
                      ' cc_espconremis = ' + IIF(mnuConRemis.Checked, '''S''', '''N''') + ', ' +
                      ' cc_entdeclaracion = ' + IIF(sdqConsulta.FieldByName('ex_fecharecepcion').AsDateTime + 10 >= DBDate, '''S''', '''N''') +
                ' WHERE cc_id = :idcons', [sdqconsulta.FieldByName('CC_ID').AsInteger]);
  {EjecutarSqlEx('UPDATE mcc_citacionconsultorio ' +                                        // TK 435
                   'SET cc_espconremis = ' + IIF(mnuConRemis.Checked, '''S''', '''N''') +
                 'WHERE cc_id = :idcons', [sdqconsulta.FieldByName('CC_ID').AsInteger]); }
  sdqConsulta.Refresh;
end;

procedure TfrmConsultorio.btnGetTurnoClick(Sender: TObject);     // Lu TK 1162
begin
  inherited;
  if Verificar(framedicoABM.IsEmpty, framedicoABM, 'Debe ingresar el médico') and
     Verificar(fraDelegacionABM.IsEmpty, fraDelegacionABM, 'Debe ingresar la Delegación')
  then
    DoObtenerTurno(edFechaABM.Date, framedicoABM.Codigo);
end;

procedure TfrmConsultorio.fpABMClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  btnGetTurno.Visible := False;
end;

procedure TfrmConsultorio.DoMarcarTraslado(Siniestro, Orden, Recaida :Integer);
var
  sSql :String;
begin
  sSql := 'UPDATE sex_expedientes ' +
            ' SET ex_ameritaremis = ' + SqlBoolean(rgAmeritaRemis.ItemIndex = 0) +
          ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
            ' AND ex_orden = ' + SqlInt(Orden) +
            ' AND ex_recaida = ' + SqlInt(Recaida);
  EjecutarSqlST(sSql);
end;


procedure TfrmConsultorio.tbModificarMedicoClick(Sender: TObject);      // TK 48382
var sSql: string;
begin
  if HayRegistroActivo and (fpModificarMedico.ShowModal = mrOk) then
  begin
    try
      BeginTrans;
      sSql := 'UPDATE mcc_citacionconsultorio ' +
                ' SET cc_medico = ' + SqlValue(fraMedicoMM.Value) + ',' +
                    ' cc_fechamodif = art.actualdate, ' +
                    ' cc_usumodif = ' + SqlValue(Sesion.UserID) +
              ' WHERE cc_id = ' + SqlInt(sdqConsulta.FieldByName('CC_ID').AsInteger);

      EjecutarSqlST(sSql);

      CommitTrans;
      tbRefrescar.Click;
    except on E: Exception do
      begin
        Rollback;
        if FPABM.Tag = 0 then
          MsgBox('Ha ocurrido un error inesperado al intentar modificar el médico' +#13 + E.Message);
      end;
    end;
  end;
end;


function TfrmConsultorio.Get_MecanismoAccid(iIdExped:integer): String;      // TK 11018
begin
  Result := ValorSqlEx('SELECT ex_mecanismoaccid ' +
                        ' FROM ART.SEX_EXPEDIENTES ' +
                       ' WHERE ex_id = :idexped', [iIdExped]);
end;

procedure TfrmConsultorio.DoGuardarMecanismoAccid(iIdExped: integer; sMecanisAccid: string);   // TK 11018
var sSql:string;
begin
  if (sMecanisAccid <> '') then
  begin
    sSql := 'UPDATE ART.SEX_EXPEDIENTES ' +
              ' SET EX_MECANISMOACCID = ' + SqlValue(sMecanisAccid) +
            ' WHERE EX_ID = ' + SqlInt(iIdExped);
    EjecutarSqlST(sSql);
  end;
end;

procedure TfrmConsultorio.mnuCesedeILTClick(Sender: TObject);
var rptCeseDeILT: TrptCeseDeILT;
begin
  rptCeseDeILT := TrptCeseDeILT.Create(Self);
  Try
    rptCeseDeILT.Imprimir(sdqConsulta.FieldByName('EX_ID').AsInteger);
  finally
    rptCeseDeILT.Free;
  end;
end;

procedure TfrmConsultorio.rbDiasProbAltaClick(Sender: TObject);  // TK 16829
begin
  Do_habilitarProbables;
end;

procedure TfrmConsultorio.rbDiasProxCitClick(Sender: TObject);   // TK 16829
begin
  Do_habilitarProbables;
end;

procedure TfrmConsultorio.Do_habilitarProbables;      // TK 16829
begin
  LockControl(edDiasProbAlta, not rbDiasProbAlta.Checked);
  LockControl(edDiasProxCit, not rbDiasProxCit.Checked);
  if not rbDiasProbAlta.Checked then
    edDiasProbAlta.Clear
  else if not rbDiasProxCit.Checked then
    edDiasProxCit.Clear;
end;



procedure TfrmConsultorio.Do_MostrarDiasYTratam;   // TK 16829
begin
  edDiasProbAlta.Text    := sdqConsulta.FieldByName('CC_DIASPROBALTA').AsString;
  rbDiasProbAlta.Checked := IIF(sdqConsulta.FieldByName('CC_DIASPROBALTA').IsNull, false, true);
  edDiasProxCit.Text     := sdqConsulta.FieldByName('CC_DIASPROBPROXCIT').AsString;
  rbDiasProxCit.Checked  := IIF(sdqConsulta.FieldByName('CC_DIASPROBPROXCIT').IsNull, false, true);
  MemoTratamientoSugerido.lines.Text := sdqConsulta.FieldByName('CC_TRATSUGERIDO').AsString;
end;

procedure TfrmConsultorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TfrmConsultorio.VerificarLicencias(medico: string; fecha: string): boolean;
var ssql: string;
begin
  ssql := ' select 1 ' +
          '   from art.slm_licenciasmedicas ' +
          '  where LM_IDMEDICO = :med ' +
          '    and :fecha between LM_DESDE and LM_HASTA ' +
          '    and LM_FECHABAJA IS NULL ';

  VerificarLicencias := ExisteSqlEx(ssql, [medico, fecha]);

end;


procedure TfrmConsultorio.tbSumatoriaClick(Sender: TObject);
begin
  if tbSumatoria.Down then
    SumatoriaRegistros
  else
    BorrarSumatoriaRegistros;
end;



procedure TfrmConsultorio.tbSalir5Click(Sender: TObject);
begin
  Close;

end;

procedure TfrmConsultorio.fpModificarMedicoBeforeShow(Sender: TObject);    // TK 48382
begin
  edTrabajadorMM.Text := sdqConsulta.FieldByName('TRABAJADOR').AsString;
  edSiniestroMM.SetValues(sdqConsulta.FieldByName('CC_SINIESTRO').AsInteger,
                          sdqConsulta.FieldByName('CC_ORDEN').AsInteger,
                          sdqConsulta.FieldByName('CC_RECAIDA').AsInteger);
  dcFechaTurnoMM.Date := sdqConsulta.FieldByName('CC_FECHA').AsDateTime;
  edHoraMM.Text       := sdqConsulta.FieldByName('CC_HORA').AsString;
  fraMedicoMM.value   := sdqConsulta.FieldByName('CC_MEDICO').AsString;
end;

procedure TfrmConsultorio.btnAceptarMMClick(Sender: TObject);       // TK 48382
begin
  if (msgask('Se está por modificar el médico del turno seleccionado. ¿Desea continuar?', 'Atención') = true) then
  begin
    Verificar(fraMedicoMM.IsEmpty, fraMedicoMM, 'Debe seleccionar un Médico.');
    fpModificarMedico.ModalResult := mrOk;
  end;
end;

procedure TfrmConsultorio.btnCancelarClick(Sender: TObject);
begin
  fpABM.Close;

end;

end.
