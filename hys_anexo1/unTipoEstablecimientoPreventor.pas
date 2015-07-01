unit unTipoEstablecimientoPreventor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion, unFraEmpresa,
  unArtDBAwareFrame, unArtDbFrame, unfraEstablecimientoDomic, unfraCtbTablas,
  ExComboBox, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, AnsiSql,
  unfraLocalidadEx, unfraLocalidad, unfraCIIU, unFraActividad, Mask,
  PatternEdit, IntEdit, General, VCLExtra, unHistoricoTipoEstabPreventor,
  Buttons, unfraEstablecimiento;

type

  TfrmAbmTipoEstablecimientoPreventor = class(TfrmCustomGridABM)
    fraPreventor: TfraCodigoDescripcion;
    fraPreventorActual: TfraCodigoDescripcion;
    fraPreventorNuevo: TfraCodigoDescripcion;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraPreventorEmpNoAsignadas: TfraCodigoDescripcion;
    Label1: TLabel;
    fraEstablecimiento: TfraEstablecimientoDomic;
    fraEmpresa: TfraEmpresa;
    Label2: TLabel;
    Label3: TLabel;
    fraTipoEmpresa: TfraCtbTablas;
    cmbActividad: TExComboBox;
    cbTodosEstab: TCheckBox;
    tbCambiarPreventor: TToolButton;
    fpCambiarPreventor: TFormPanel;
    Bevel1: TBevel;
    Label5: TLabel;
    btnAceptarCambioPreventor: TButton;
    btnCancelarCambioPreventor: TButton;
    Label6: TLabel;
    pcFiltros: TPageControl;
    tbGeneral: TTabSheet;
    tbVarios: TTabSheet;
    Label4: TLabel;
    cbSinPreventor: TCheckBox;
    pnlGuardar: TPanel;
    btnGuardar: TButton;
    btnCancelarCambios: TButton;
    fraLocalidad: TfraLocalidadEx;
    Label7: TLabel;
    edCiuu: TIntEdit;
    cbEmpresasSinAsignar: TCheckBox;
    fpEmpresasNoAsignadas: TFormPanel;
    Bevel2: TBevel;
    Label9: TLabel;
    btnAceptarEmpNoAsig: TButton;
    btnCancelarEmpNoAsig: TButton;
    fraTipoEmpNoAsignadas: TfraCtbTablas;
    cmbActividadEmpNoAsignadas: TExComboBox;
    Label10: TLabel;
    Label11: TLabel;
    tbNoAsignadas: TToolButton;
    Label14: TLabel;
    edEstablecimiento: TPatternEdit;
    lbAct: TLabel;
    edActividad: TIntEdit;
    Label8: TLabel;
    edCantTrabajadoresMin: TIntEdit;
    Label12: TLabel;
    edCantTrabajadoresMax: TIntEdit;
    edMotivoCambio: TRichEdit;
    Label13: TLabel;
    fpMotivoCambio: TFormPanel;
    Bevel3: TBevel;
    Label17: TLabel;
    btnAceptarMotivo: TButton;
    edMotivoCambioSolicitado: TRichEdit;
    btnTodos: TButton;
    tbCambios: TToolBar;
    tbHistorico: TToolButton;
    fraTipoFiltro: TfraCtbTablas;
    Label15: TLabel;
    tbOperativo: TTabSheet;
    Label18: TLabel;
    fraOperativo: TfraCodigoDescripcion;
    cbAnexoI: TCheckBox;
    cbPrs: TCheckBox;
    cbPrsIdentico: TCheckBox;
    cbAnexoII: TCheckBox;
    cbDenuncias: TCheckBox;
    cbAvisoObra: TCheckBox;
    cmbAnexoI: TExComboBox;
    cmbAnexoII: TExComboBox;
    cmbPrs: TExComboBox;
    cmbPrsIdentico: TExComboBox;
    cmbDenuncias: TExComboBox;
    cmbAvisoObra: TExComboBox;
    btnInfoEstableci: TSpeedButton;
    edNombreEstableci: TPatternEdit;
    Label16: TLabel;
    cbReferente: TCheckBox;
    cbReferenteCambio: TCheckBox;
    cbReferenteNoAsignadas: TCheckBox;
    cbExcluirBajas: TCheckBox;
    cbPreventorReferente: TCheckBox;
    cbAnexoFicticio: TCheckBox;
    cmbAnexoFicticio: TExComboBox;
    Label19: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    Label20: TLabel;
    cbOperativoActual: TCheckBox;
    cbListarCoordinados: TCheckBox;
    cbCtosActivos: TCheckBox;
    sdqConSupervisor: TSDQuery;
    Label21: TLabel;
    fraRanking: TfraCodigoDescripcion;
    tbCP: TToolButton;
    tbAfiliaciones: TToolButton;
    cbTercerizado: TCheckBox;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    edSubtipo: TEdit;
    Label22: TLabel;
    fraSubTipoFiltro: TfraCodigoDescripcion;
    cbEventual: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure cbTodosEstabClick(Sender: TObject);
    procedure tbCambiarPreventorClick(Sender: TObject);
    procedure btnAceptarCambioPreventorClick(Sender: TObject);
    procedure cbConsultaActualClick(Sender: TObject);
    procedure cbSinPreventorClick(Sender: TObject);
    procedure btnCancelarCambiosClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure btnAceptarEmpNoAsigClick(Sender: TObject);
    procedure tbNoAsignadasClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure fraPreventorActualcmbDescripcionDropDown(Sender: TObject);
    procedure fraPreventorNuevocmbDescripcionDropDown(Sender: TObject);
    procedure fraPreventorEmpNoAsignadascmbDescripcionDropDown(
      Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure fpMotivoCambioClose(Sender: TObject;
      var Action: TCloseAction);
    procedure fpMotivoCambioBeforeShow(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnInfoEstableciClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbPreventorReferenteClick(Sender: TObject);
    procedure fraEmpresaFiltroExit(Sender: TObject);
    procedure cbOperativoActualClick(Sender: TObject);
    function GenerarSolicitudInforme (CUIT: String; idPreventor: Integer; Motivo: String): Boolean;
    procedure tbCPClick(Sender: TObject);
    procedure tbAfiliacionesClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    sWhere: String;
    sFrom: string;
    FTodos: Boolean;
    FCambio: Boolean;
    procedure ArmarQuery;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEmpresaChangeFiltro(Sender: TObject);
    function ValidarCambioPreventor: boolean;
    function ValidarEmpresasNoAsignadas: boolean;
    function VerifyChanges: boolean;
    function ArmarFiltroEstab(Establecimientos: string): string;
    procedure FiltrarPreventor(Sender: TObject; fraPreventor: TfraCodigoDescripcion);
    procedure ActualizarHistorico;
    procedure fraTipoEmpresaChange(Sender: TObject);
    procedure ActualizarPreventorReferente(aCuit, aIdPreventor: string);
    Function EsEmpresaEAS (aCUIT: String; aFecha: TDateTime): Boolean;

  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmAbmTipoEstablecimientoPreventor: TfrmAbmTipoEstablecimientoPreventor;

implementation

uses unReasignacionCP, unContratoEstablecimiento, unPrincipal,
  unManPreventores;

{$R *.DFM}

{ TfrmAbmTipoEstablecimientoPreventor }

procedure TfrmAbmTipoEstablecimientoPreventor.ClearControls;
begin
    fraEmpresa.Locked := false;
    fraEstablecimiento.Locked := false;
    fraEmpresa.Clear;
    fraEstablecimiento.Clear;
    fraTipoEmpresa.Limpiar;
    cmbActividad.Value := '';
    fraPreventor.Clear;
    cbTodosEstab.Checked := false;
    cbReferente.Checked := false;
    cbExcluirBajas.Checked := true;
    edSubtipo.Clear;
end;

function TfrmAbmTipoEstablecimientoPreventor.DoABM: Boolean;
begin

  try
    Result := true;
//    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('ep_cuit', sdqConsulta.FieldByName('em_cuit').AsString);
      Sql.PrimaryKey.Add('ep_estableci', sdqConsulta.FieldByName('es_nroestableci').AsInteger);
      Sql.Fields.Add('EP_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
      EjecutarSqlST( GetSqlABM );
    end else begin

      if not cbTodosEstab.Checked then
      begin
          Sql.Fields.Add('ep_tipo', fraTipoEmpresa.Value);
          Sql.Fields.Add('ep_actividad', cmbActividad.Value);
          Sql.Fields.Add('ep_itcodigo', fraPreventor.Codigo);

          if (ModoABM = maAlta) Then
          begin

            if (ExisteSql('SELECT 1 FROM hys.hep_estabporpreventor WHERE EP_CUIT = ' + SqlValue(fraEmpresa.mskCUIT.Text)
                          + ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.edCodigo.Text))) then
            begin
                if (MsgBox('El establecimiento ya existe. ¿Desea reemplazarlo con estos datos?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
                begin
                    Sql.SqlType := stUpdate;
                    Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                    Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
                    Sql.Fields.Add('EP_USUBAJA', exNull );
                    Sql.Fields.Add('EP_FECHABAJA', exNull );
                end
                else Exit;
            end;

            if (Sql.SqlType <> stUpdate) then
            begin
                Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAALTA', exDateTime);
            end;

            Sql.PrimaryKey.Add('ep_cuit', fraEmpresa.mskCUIT.Text);
            Sql.PrimaryKey.Add('ep_estableci', fraEstablecimiento.edCodigo.Text);
          end else begin
            Sql.PrimaryKey.Add('ep_cuit', sdqConsulta.FieldByName('em_cuit').AsString);
            Sql.PrimaryKey.Add('ep_estableci', sdqConsulta.FieldByName('es_nroestableci').AsInteger);

            //Este es para el caso de una empresa no asignada que pasa a darse de alta en hep_estaporpreventor
            if (ModoABM = maModificacion) and (sdqConsulta.FieldByName('ep_tipo').IsNull) then
            begin
                Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAALTA', exDateTime );
                Sql.SqlType := stInsert;
            end
            else begin //Modif Común
                Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
            end;
            Sql.Fields.Add('EP_USUBAJA', exNull );
            Sql.Fields.Add('EP_FECHABAJA', exNull );
          end;
          //verifico si hubo cambios
          FCambio:= VerifyChanges;
          EjecutarSqlST( GetSqlABM );
          if (Sql.SqlType <> stInsert) then ActualizarHistorico;
      end else
      begin //Doy de alta todos los establecimiento para ese CUIT
        fraEstablecimiento.Cargar;
        fraEstablecimiento.sdqDatos.First;
        while (not fraEstablecimiento.sdqDatos.Eof) do
        begin
            Sql.Clear;
            Sql.Fields.Add('ep_tipo', fraTipoEmpresa.Value);
            Sql.Fields.Add('ep_actividad', cmbActividad.Value);
            Sql.Fields.Add('ep_itcodigo', fraPreventor.Codigo);
            Sql.PrimaryKey.Add('ep_cuit', fraEmpresa.mskCUIT.Text);
            Sql.PrimaryKey.Add('ep_estableci', fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger);
            if (ExisteSql('SELECT 1 FROM hys.hep_estabporpreventor WHERE EP_CUIT = ' + SqlValue(fraEmpresa.mskCUIT.Text)
                              + ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger))) then
            begin
                Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
                Sql.SqlType := stUpdate;
            end
            else begin
                Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAALTA', exDateTime );
                Sql.SqlType := stInsert;
            end;
            //verifico si hubo cambios
            FCambio:= VerifyChanges;
            EjecutarSqlST( GetSqlABM );
            if (Sql.SqlType <> stInsert) then ActualizarHistorico;
            fraEstablecimiento.sdqDatos.Next;
        end;
      end;
      if cbReferente.Checked then ActualizarPreventorReferente(fraEmpresa.Cuit, fraPreventor.Codigo);
    end;
//    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
//       Rollback(true);
       ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
  FTodos := false;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.LoadControls;
begin
  fraEmpresa.Locked := true;
  fraEstablecimiento.Locked := true;
  cbTodosEstab.Checked := false;
//  fraEmpresa.Cargar(sdqConsulta.FieldbyName('em_cuit').AsString);
//  fraEmpresa.FieldCUIT := sdqConsulta.FieldbyName('em_cuit').AsString;

  fraEmpresa.Value := sdqConsulta.FieldbyName('em_id').AsInteger;
  fraEmpresa.Reload;

  fraEstablecimiento.Cargar(sdqConsulta.FieldbyName('em_cuit').AsString,
                            sdqConsulta.FieldbyName('es_nroestableci').AsInteger, false);
  edCiuu.Text := ValorSql('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) FROM comunes.cac_actividad WHERE AC_CODIGO = ' + SqlValue(fraEstablecimiento.Actividad), '');;
//  fraTipoEmpresa.Cargar(sdqConsulta.FieldbyName('ep_tipo').AsString);
  fraTipoEmpresa.Value:= sdqConsulta.FieldbyName('ep_tipo').AsString;
  edSubTipo.Text      := sdqConsulta.FieldbyName('st_descripcion').AsString;
  cmbActividad.Value  := sdqConsulta.FieldbyName('ep_actividad').AsString;
  fraPreventor.Codigo := sdqConsulta.FieldbyName('ep_itcodigo').AsString;
  cbReferente.Checked := ExisteSql(' select 1 ' +
                                   ' from afi.APC_PREVENTORCONTRATO ' +
                                   ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(sdqConsulta.FieldbyName('em_cuit').AsString)  + ') ' +
                                   ' and PC_CODIGOPREVENTOR = ' + SqlValue(fraPreventor.Codigo) +
                                   ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ');

end;

function TfrmAbmTipoEstablecimientoPreventor.Validar: Boolean;
begin
    Result := VerificarMultiple(['ABM de Establecimiento por Preventor',
                                fraEmpresa, fraEmpresa.IsSelected, 'Debe especificar la empresa.',
                                fraEstablecimiento, (fraEstablecimiento.IsSelected) or (cbTodosEstab.Checked), 'Debe especificar el establecimiento',
                                fraTipoEmpresa, fraTipoEmpresa.IsSelected, 'Debe especificar el tipo de Empresa',
                                cmbActividad, cmbActividad.Text <> '', 'Debe especificar la actividad de la Empresa',
                                fraPreventor, (not fraPreventor.IsSelected) or (fraPreventor.IsSelected and fraPreventor.sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull), 'El preventor debe estar activo'
                              ]);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.FormCreate(Sender: TObject);
begin
  inherited;

  FTodos:= false;

  fraTipoEmpresa.Clave := 'TFET';
  fraTipoEmpresa.OnChange := fraTipoEmpresaChange;

  fraTipoFiltro.Clave := 'TFET';

  fraTipoEmpNoAsignadas.Clave := 'TFET';

  fraEmpresa.OnChange := OnEmpresaChange;
  fraEmpresa.ShowBajas := true;
  fraEmpresa.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';

  fraEmpresaFiltro.OnChange := OnEmpresaChangeFiltro;
  fraEmpresaFiltro.ShowBajas := true;
  fraEmpresaFiltro.ExtraCondition := '     AND co_contrato = '+
                                     ' (SELECT MAX (b.co_contrato) '+
                                     '    FROM aco_contrato b '+
                                     '   WHERE b.co_idempresa = em_id '+
                                     '     AND NOT EXISTS (SELECT 1 '+
                                     '    FROM art.abc_bajadecontrato '+
                                     '   WHERE b.co_contrato = bc_contrato)) ';
  VCLExtra.LockControl(edEstablecimiento, true);

  fraEstablecimiento.ShowBajas := false;

  with fraPreventor do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorFiltro do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorEmpNoAsignadas do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := false;
  end;

  with fraPreventorActual do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorNuevo do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := false;
  end;

  pcFiltros.ActivePageIndex := 0;

  Sql.TableName := 'hys.hep_estabporpreventor';
  FieldBaja := 'ep_fechabaja';

  fraLocalidad.FieldCPostal := 'es_cpostal';
  fraLocalidad.FieldLocalidad := 'es_localidad';
  fraLocalidad.FieldProvincia := 'es_provincia';

   With fraOperativo do
   begin
      TableName    := 'POP_OPERATIVO';
      FieldID      := 'OP_CODIGO';
      FieldCodigo  := 'OP_CODIGO';
      FieldDesc    := 'OP_DESCRIPCION';
      FieldBaja    := 'OP_FECHABAJA';
      SelectLast;
   end;

   With fraRanking do
   begin
      TableName    := 'HYS.HRK_RANKING';
      FieldID      := 'RK_ID';
      FieldCodigo  := 'RK_ID';
      FieldDesc    := 'RK_DESCRIPCION';
      FieldBaja    := 'RK_FECHABAJA';
      ShowBajas    := True;
   end;

   With fraSubTipoFiltro do
   begin
      TableName    := 'hys.hst_subtipo';
      FieldID      := 'st_id';
      FieldCodigo  := 'st_id';
      FieldDesc    := 'st_descripcion';
   end;

end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbRefrescarClick(
  Sender: TObject);
begin
  VerificarMultiple(['Aplicar Consulta',
                     fraTipoFiltro,
                     (not fraSubTipoFiltro.IsSelected) or
                     (fraSubTipoFiltro.IsSelected and fraTipoFiltro.IsSelected),
                     'Debe especificar también el tipo de empresa']);
  ArmarQuery;

  inherited;
  tbNoAsignadas.Enabled := cbEmpresasSinAsignar.Checked;
  tbCambiarPreventor.Enabled := not cbEmpresasSinAsignar.Checked;

  tbNoAsignadas.Enabled := tbNoAsignadas.Enabled and btnGuardar.Enabled;
  tbCambiarPreventor.Enabled := tbCambiarPreventor.Enabled and btnGuardar.Enabled;
  tbNuevo.Enabled := btnGuardar.Enabled;
  tbModificar.Enabled := btnGuardar.Enabled;
  tbEliminar.Enabled := btnGuardar.Enabled;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.ArmarQuery;
var
  Indice: String;
  Lista: String;
  Supervisor: LongInt;

  function HayDependencia (Actual, Buscado: LongInt): Boolean;
  begin
    Result := False;

    if Actual <> 0 then
      Result := (Actual = Buscado) or
                HayDependencia (ValorSqlInteger('SELECT it_idsupervisor ' +
                                '  FROM art.pit_firmantes ' +
                                ' WHERE it_id = ' + SqlInteger(Actual)), Buscado)
  end;

begin
    Indice := '';

    // Cancelo filtro por Referente si está seleccionado pero no hay Referente indicado
    cbPreventorReferente.Checked := cbPreventorReferente.Checked and
                                    (Trim(fraPreventorFiltro.cmbDescripcion.Text) <> '');

    sdqConsulta.SQL.Clear;
    sWhere := '';
    sFrom := '';

    if fraEmpresaFiltro.IsSelected then
        sWhere := sWhere + ' and aem.em_cuit = ' +  SqlValue(fraEmpresaFiltro.mskCUIT.Text);
//        sWhere := sWhere + ' and hep.ep_cuit = ' +  SqlValue(fraEmpresaFiltro.mskCUIT.Text);

    if fraPreventorFiltro.IsSelected and not cbEmpresasSinAsignar.Checked then
    begin
      if (cbListarCoordinados.Checked) then
      begin
(*
        Indice := '/*+ FULL(PIT) */';
        sWhere := sWhere + 'AND hep.ep_itcodigo IN ( ' +
                           '              SELECT b.it_codigo ' +
                           '                FROM art.pit_firmantes b ' +
                           '               WHERE b.it_codigo = hep.ep_itcodigo ' +
                           '                     AND b.it_idsupervisor = ' +
                           SqlValue (ValorSqlInteger('SELECT it_id ' +
                                                     '  FROM art.pit_firmantes ' +
                                                     ' WHERE it_codigo = ' +
                                                     SqlValue(fraPreventorFiltro.Codigo), 0)) + ')'
*)
        Supervisor := ValorSqlInteger('SELECT it_id ' +
                                      '  FROM art.pit_firmantes ' +
                                      ' WHERE it_codigo = ' +
                                                   SqlValue(fraPreventorFiltro.Codigo), 0);
        Lista := SqlValue(fraPreventorFiltro.Codigo);

        with sdqConSupervisor do
        begin
          Sql.Clear;
          Sql.Add ( 'SELECT it_id, it_codigo ' +
                    '  FROM art.pit_firmantes ' +
                    ' WHERE it_id <> ' + SqlNumber(Supervisor) +
                    '   AND NOT (it_idsupervisor IS NULL)' );
          Open;
          while not EoF do
          begin
            if HayDependencia (FieldByName('it_id').AsInteger, Supervisor) then
               Lista := Lista + ', ' + SqlValue (FieldByName('it_codigo').AsString);

            next
          end;

          Close
        end;

        Indice := '';  // HASTA QUE NO DE ERROR!!!!  '/*+ FULL(PIT) */';
        sWhere := sWhere + 'AND hep.ep_itcodigo IN ( ' + Lista + ')'
      end
      else
        sWhere := sWhere + ' and hep.ep_itcodigo = ' + SqlValue(fraPreventorFiltro.Codigo) + ' ';
    end;

    if (cbSinPreventor.Checked) and not cbEmpresasSinAsignar.Checked then
        sWhere := sWhere + ' and hep.ep_itcodigo is null ';

    if (not fraLocalidad.IsEmpty) then
        sWhere := sWhere + fraLocalidad.GetWhere;

    if not edActividad.IsEmpty then
        sWhere := sWhere + ' and  substr(art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision),1,' + inttostr(length(edActividad.Text)) + ') = ' + SqlValue(edActividad.Text);

    if (not edCantTrabajadoresMin.IsEmpty) or (not edCantTrabajadoresMax.IsEmpty) then
    begin
        sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and (SELECT RC_EMPLEADOS ' +
                                                                    ' FROM ZRC_RESUMENCOBRANZA WHERE RC_CONTRATO = CO_CONTRATO AND RC_PERIODO = art.cobranza.Get_UltPeriodoDevengado(''E'')) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
        sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and (SELECT RC_EMPLEADOS ' +
                                                                    ' FROM ZRC_RESUMENCOBRANZA WHERE RC_CONTRATO = CO_CONTRATO AND RC_PERIODO = art.cobranza.Get_UltPeriodoDevengado(''E'')) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
//        sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and ART.NOMINA.get_empleados(aco.co_contrato, to_char(actualdate, ''YYYYMM'')) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
//        sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and ART.NOMINA.get_empleados(aco.co_contrato, to_char(actualdate, ''YYYYMM'')) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
(*
        sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and (select rc_empleados ' +
                                                                    '      from cob.zrc_resumencobranza zrc_resumencobranza ' +
                                                                    '      where zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
                                                                    '      and (zrc_resumencobranza.rc_periodo = art.cobranza.get_ultperiododevengado (''E''))) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
        sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and (select rc_empleados ' +
                                                                    '      from cob.zrc_resumencobranza zrc_resumencobranza ' +
                                                                    '      where zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
                                                                    '      and (zrc_resumencobranza.rc_periodo = art.cobranza.get_ultperiododevengado (''E''))) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
*)
    end;

    if edEstablecimiento.Text <> '' then
    begin
        sWhere := sWhere + ' and aes.es_nroestableci in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';
    end;

    if (not cbEmpresasSinAsignar.Checked) and fraTipoFiltro.IsSelected then
        sWhere := sWhere + ' and hep.ep_tipo = ' + SqlValue(fraTipoFiltro.Codigo);

    if cbAnexoI.Checked then
    begin
        if cmbAnexoI.Value = 'S' then
          sWhere := sWhere + ' and Exists ('
        else
          sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere + ' SELECT 1 ' +
                           ' FROM art.pet_empresastestigo pet ' +
                           ' WHERE pet.et_cuit = aem.em_cuit ' +
                           ' AND pet.et_estableci = aes.es_nroestableci ' +
                           ' AND et_operativo = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                           ' AND et_item4 <> 999999 ' +
                           ' AND et_item6 <> 9999)';
    end;

    if cbAnexoFicticio.Checked then
    begin
        if cmbAnexoFicticio.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere + ' SELECT 1 ' +
                           ' FROM art.pet_empresastestigo pet ' +
                           ' WHERE pet.et_cuit = aem.em_cuit ' +
                           ' AND pet.et_estableci = aes.es_nroestableci ' +
                           ' AND et_operativo = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                           ' AND (et_item4 = 999999 ' +
                           '      OR et_item6 = 9999))';
    end;

    if cbAnexoII.Checked then
    begin
        if cmbAnexoII.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere + ' SELECT 1 ' +
                           ' FROM art.pan_anexo2 pan ' +
                           ' WHERE pan.an_cuit = aem.em_cuit ' +
                           ' AND pan.an_estableci = aes.es_nroestableci '+
                           ' AND an_operativo = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) + ')';
    end;

    if cbPrs.Checked then
    begin
        if cmbPrs.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere + ' SELECT 1 ' +
                           ' FROM art.pre_recomendaciones pre ' +
                           ' WHERE pre.re_cuit = aem.em_cuit ' +
                           ' AND pre.re_estableci = aes.es_nroestableci '+
                           ' AND pre.re_operativo = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) + ' AND pre.re_fechabaja IS NULL)';
    end;

    if cbPrsIdentico.Checked then
    begin
        if cmbPrsIdentico.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere +  ' SELECT 1 ' +
                            ' FROM ART.PPI_PRS_IDENTICOS PPI ' +
                            ' WHERE PPI.PI_CUIT = AEM.EM_CUIT ' +
                            ' AND PPI.PI_ESTABLECI = AES.es_nroestableci ' +
                            ' AND PPI.PI_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                            ' AND PPI.PI_FECHABAJA IS NULL)';
    end;

    if cbDenuncias.Checked then
    begin
        if cmbDenuncias.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere + ' SELECT 1 ' +
                           ' FROM ART.POD_OBRADENUNCIA POD ' +
                           ' WHERE POD.OD_CUIT = AEM.EM_CUIT ' +
                           ' AND POD.OD_ESTABLECI = AES.es_nroestableci ' +
                           ' AND POD.OD_OPERATIVO =  ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                           ' AND POD.OD_FECHABAJA IS NULL) ';
    end;

    if cbAvisoObra.Checked then
    begin
        if cmbAvisoObra.Value = 'S' then sWhere := sWhere + ' and Exists ('
        else sWhere := sWhere + ' and not Exists (';
        sWhere := sWhere +  ' SELECT 1 ' +
                            ' FROM ART.PAO_AVISOOBRA PAO ' +
                            ' WHERE PAO.AO_CUIT = AEM.EM_CUIT ' +
                            ' AND PAO.AO_ESTABLECI = AES.es_nroestableci )'
// eliminado 20-02-06                            ' AND PAO.AO_OPERATIVO =  ' + SqlValue(fraOperativo.Value) + ')';
    end;

    if (trim(edNombreEstableci.Text) <> '') then
        sWhere := sWhere + ' and UPPER(aes.es_nombre) like ' +  SqlValue(edNombreEstableci.Text + '%');

    if (cbExcluirBajas.Checked) then
        sWhere := sWhere + ' and aes.es_fechabaja is null ';

    if (cbEventual.Checked) then
        sWhere := sWhere + ' and aes.es_eventual = ''S'' ';

    if fraRanking.IsSelected then
    begin
      sWhere := sWhere + ' and (exists (SELECT 1 ' +
                         '                FROM hys.hre_rankingempresa ' +
                         '               WHERE re_idranking =  ' + sqlInteger(fraRanking.Codigo) +
                         '                 AND re_idempresa = em_id))'
    end;

    // agrego filtro por Preventor referente
    if (cbPreventorReferente.Checked) then
      sWhere := sWhere + ' and (exists (select 1 ' +
                         '        from afi.APC_PREVENTORCONTRATO ' +
                         '       where PC_CONTRATO = art.get_vultcontrato(em_cuit) ' +
                         '         and PC_CODIGOPREVENTOR = ' + sqlvalue(fraPreventorFiltro.Codigo) +
                         '         and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null))) ' ;

    // agrego filtro por Preventor tercerizado
    if (cbTercerizado.Checked) then
      sWhere := sWhere + ' AND it_tercerizado = 1 ';

    if not cbEmpresasSinAsignar.Checked then
    begin
      if (cbExcluirBajas.Checked) then
        sWhere := sWhere + ' and EP_FECHABAJA IS NULL ';

      sdqConsulta.SQL.Add('SELECT ' + Indice +
                          '       em_id, em_cuit, aem.em_nombre, es_nroestableci, aes.es_nombre, ' +
                          '       ep_tipo, st_descripcion, ep_actividad, ep_idfirmante, ' +
                          '       ep_itcodigo, pit.it_nombre, NVL(es_eventual, ''N'') es_eventual, ' +
                          '       (select p.it_nombre from art.pit_firmantes p where p.it_id = pit.it_idsupervisor) it_coordinador, ' +
                          '       art.afi.Armar_Domicilio(es_calle, es_numero, es_piso, es_departamento, es_localidad) as Domicilio, ' +
                          '       es_localidad, ' +
                          '       es_cpostal, ' +
                          '       art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, ' +
                          '       es_cpostala, ' +
                          '       co_contrato, ' +

//                            '       (ART.NOMINA.get_empleados(aco.co_contrato, to_char(actualdate, ''YYYYMM''))) rc_empleados, ' +
                          '       (SELECT RC_EMPLEADOS ' +
                          '        FROM ZRC_RESUMENCOBRANZA WHERE RC_CONTRATO = CO_CONTRATO AND RC_PERIODO = art.cobranza.Get_UltPeriodoDevengado(''E'')) rc_empleados, ' +
(*
                          '       (select rc_empleados ' +
                          '        from cob.zrc_resumencobranza zrc_resumencobranza ' +
                          '        where zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
                          '        and (zrc_resumencobranza.rc_periodo = art.cobranza.get_ultperiododevengado (''E''))) rc_empleados, ' +
*)
                          '        art.GETDESCRIPCIONPROVINCIA(es_provincia) as Prov, ' +
                          '       ep_fechabaja, ep_usubaja, ES_FECHABAJA, ' +
                          '      (SELECT ''S'' ' +
                          '      FROM ART.PET_EMPRESASTESTIGO PET ' +
                          '      WHERE PET.ET_CUIT = AEM.EM_CUIT ' +
                          '      AND PET.ET_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND ET_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND ET_ITEM4 <> 999999 ' +
                          '      AND ET_Item6 <> 9999 ' +
                          '      AND ROWNUM = 1 ' +
                          '      AND ET_FECHABAJA IS NULL ' +
                          '      ) AS TIENEANEXO1, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PAN_ANEXO2 PAN ' +
                          '      WHERE PAN.AN_CUIT = AEM.EM_CUIT ' +
                          '      AND PAN.AN_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND AN_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEANEXO2, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PET_EMPRESASTESTIGO PET ' +
                          '      WHERE PET.ET_CUIT = AEM.EM_CUIT ' +
                          '      AND PET.ET_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND ET_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND (ET_ITEM4 = 999999 ' +
                          '           OR ET_Item6 = 9999) ' +
                          '      AND ROWNUM = 1 ' +
                          '      AND ET_FECHABAJA IS NULL ' +
                          '      ) AS TIENEANEXOFICTICIO, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PRE_RECOMENDACIONES PRE ' +
                          '      WHERE PRE.RE_CUIT =  AEM.EM_CUIT ' +
                          '      AND PRE.RE_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND PRE.RE_OPERATIVO =  ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND RE_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEPRS, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PPI_PRS_IDENTICOS PPI ' +
                          '      WHERE PPI.PI_CUIT = AEM.EM_CUIT ' +
                          '      AND PPI.PI_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND PPI.PI_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND PPI.PI_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEPRSIDENTICO, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.POD_OBRADENUNCIA POD ' +
                          '      WHERE POD.OD_CUIT = AEM.EM_CUIT ' +
                          '      AND POD.OD_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND POD.OD_OPERATIVO =  ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND POD.OD_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEDENUNCIAS, ' +

                          '      (SELECT ''S''' +
                          '      FROM ART.PAO_AVISOOBRA PAO ' +
                          '      WHERE PAO.AO_CUIT = AEM.EM_CUIT ' +
                          '      AND PAO.AO_ESTABLECI = AES.ES_NROESTABLECI ' +
// eliminado 20-02-06                            '      AND PAO.AO_OPERATIVO =  ' + SqlValue(fraOperativo.Value) +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEAVISOOBRA, ' +

                          '      (SELECT MAX(RV_FECHA) ' +
                          '      FROM ART.PRV_RESVISITAS PRV ' +
                          '      WHERE PRV.RV_CUIT = AEM.EM_CUIT ' +
                          '      AND PRV.RV_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      ) AS FECHAULTVISITA, ' +

                          '      (NVL(DC_CODAREATELEFONOS, '''') || DC_TELEFONOS) TELEFONOEMP, ' +
                          '      (NVL(DC_CODAREAFAX, '''') || DC_FAX) FAXEMP, ' +
                          '      (NVL(ES_CODAREATELEFONOS, '''') || ES_TELEFONOS) TELEFONOSESTAB, ' +
                          '      (NVL(ES_CODAREAFAX, '''') || ES_FAX) FAXESTAB, ' +
// agregado: indica si el preventor es referente de la empresa
                          '      (NVL((select ''SI'' from afi.APC_PREVENTORCONTRATO ' +
                          '            where PC_CONTRATO = art.get_vultcontrato(em_cuit) ' +
                          '              and PC_CODIGOPREVENTOR = hep.ep_itcodigo ' +
                          '              and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null)), ' +
                          '           NVL2 (hep.ep_itcodigo, ''NO'', ''''))) ES_REFERENTE, ' +
                          '       (SELECT max(rk_descripcion) ' +
                          '          FROM hys.hre_rankingempresa, hys.hrk_ranking ' +
                          '         WHERE re_idempresa = aem.em_id ' +
                          '           AND rk_id = re_idranking ' +
                          '           AND re_fechabaja IS NULL ' +
                          '          AND (   (re_vigenciahasta IS NULL) ' +
                          '               OR (art.actualdate BETWEEN re_vigenciadesde AND re_vigenciahasta ' +
                          '                   ) ' +
                          '               )) rk_descripcion ' +
//                            'FROM cob.zrc_resumencobranza zrc_resumencobranza, ' +
                          '  FROM comunes.cac_actividad cac, ' +
                          '       art.pit_firmantes pit, '+
                          '       afi.aem_empresa aem, ' +
                          '       afi.aes_establecimiento aes, ' +
                          '       afi.aco_contrato aco, ' +
                          '       afi.adc_domiciliocontrato ahdl, ' +
                          '       hys.hep_estabporpreventor hep, ' +
                          '       hys.hco_cuitoperativo, ' +
                          '       hys.hst_subtipo ' +
                          sfrom +
                          ' WHERE hep.ep_cuit = aem.em_cuit ' +
                          '   AND hep.ep_itcodigo = pit.it_codigo(+) ' +
                          '   AND st_id(+) = co_idsubtipo ' +
                          '   AND co_cuit(+) = ep_cuit ' +
                          '   AND co_tipo(+) = ep_tipo ' +
                          '   AND co_rigedesde(+) <= SYSDATE ' +
                          '   AND (   co_rigehasta >= SYSDATE ' +
                          '        OR co_rigehasta IS NULL) ' +
                          iif (fraSubTipoFiltro.IsSelected, '   AND co_idsubtipo = ' + SqlValue(fraSubTipoFiltro.Value), '') +
                          '   AND cac.ac_id = aes.es_idactividad ' +
//                            'and zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
//                            ' and (zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))-1)  ' +
                          'and aem.em_id = aco.co_idempresa ' +
                          'and aes.es_nroestableci = hep.ep_estableci ' +
                          'and aco.co_contrato = aes.es_contrato ' +
                          // WF 3559
                          iif (cbCtosActivos.checked, ' and aco.co_estado = 1 ', '') +
                          'and ahdl.dc_contrato(+) = co_contrato ' +
                          'and ahdl.dc_tipo(+) = ''L'' ' +
                          'and aco.co_contrato = art.get_vultcontrato(em_cuit) ' +
                          sWhere);
    end else
      sdqConsulta.SQL.Add('SELECT ' + Indice +
                          '        em_id, em_cuit, aem.em_nombre, es_nroestableci, aes.es_nombre, ' +
                          '        NULL AS ep_tipo, NULL AS ep_actividad, NULL AS idfirmante, ' +
                          '        NULL AS ep_itcodigo, NULL AS it_nombre, NULL AS it_coordinador, ' +
                          '        to_date(NULL) AS ep_fechabaja, null st_descripcion, NVL(es_eventual, ''N'') es_eventual, ' +
                          '        art.afi.Armar_Domicilio(es_calle, es_numero, es_piso, es_departamento, es_localidad) as Domicilio, ' +
                          '        es_localidad, ' +
                          '        es_cpostal, ' +
                          '        art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, ' +
//                            '       (ART.NOMINA.get_empleados(aco.co_contrato, to_char(actualdate, ''YYYYMM''))) rc_empleados, ' +
                          '       (SELECT RC_EMPLEADOS ' +
                          '        FROM ZRC_RESUMENCOBRANZA WHERE RC_CONTRATO = CO_CONTRATO AND RC_PERIODO = art.cobranza.Get_UltPeriodoDevengado(''E'')) rc_empleados, ' +

(*
                          '       (select rc_empleados ' +
                          '        from cob.zrc_resumencobranza zrc_resumencobranza ' +
                          '        where zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
                          '        and (zrc_resumencobranza.rc_periodo = art.cobranza.get_ultperiododevengado (''E''))) rc_empleados, ' +
*)
                          '        es_cpostala, ' +
                          '        co_contrato, ' +
                          '        art.GETDESCRIPCIONPROVINCIA(es_provincia) as Prov, ' +
                          '        null ep_usubaja, ES_FECHABAJA, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PET_EMPRESASTESTIGO PET ' +
                          '      WHERE PET.ET_CUIT = AEM.EM_CUIT ' +
                          '      AND PET.ET_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND ET_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND ET_ITEM4 <> 999999 ' +
                          '      AND ET_Item6 <> 9999 ' +
                          '      AND ET_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEANEXO1, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PAN_ANEXO2 PAN ' +
                          '      WHERE PAN.AN_CUIT = AEM.EM_CUIT ' +
                          '      AND PAN.AN_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND AN_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEANEXO2, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PET_EMPRESASTESTIGO PET ' +
                          '      WHERE PET.ET_CUIT = AEM.EM_CUIT ' +
                          '      AND PET.ET_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND ET_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND (ET_ITEM4 = 999999 ' +
                          '           OR ET_Item6 = 9999) ' +
                          '      AND ROWNUM = 1 ' +
                          '      AND ET_FECHABAJA IS NULL ' +
                          '      ) AS TIENEANEXOFICTICIO, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PRE_RECOMENDACIONES PRE ' +
                          '      WHERE PRE.RE_CUIT =  AEM.EM_CUIT ' +
                          '      AND PRE.RE_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND PRE.RE_OPERATIVO =  ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND RE_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEPRS, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.PPI_PRS_IDENTICOS PPI ' +
                          '      WHERE PPI.PI_CUIT = AEM.EM_CUIT ' +
                          '      AND PPI.PI_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND PPI.PI_OPERATIVO = ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND PPI.PI_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEPRSIDENTICO, ' +

                          '      (SELECT ''S'' ' +
                          '      FROM ART.POD_OBRADENUNCIA POD ' +
                          '      WHERE POD.OD_CUIT = AEM.EM_CUIT ' +
                          '      AND POD.OD_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      AND POD.OD_OPERATIVO =  ' + iif(cbOperativoActual.Checked, ' art.hys.get_operativovigente_empresa(aem.em_cuit) ' , SqlValue(fraOperativo.Codigo)) +
                          '      AND POD.OD_FECHABAJA IS NULL ' +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEDENUNCIAS, ' +

                          '      (SELECT ''S''' +
                          '      FROM ART.PAO_AVISOOBRA PAO ' +
                          '      WHERE PAO.AO_CUIT = AEM.EM_CUIT ' +
                          '      AND PAO.AO_ESTABLECI = AES.ES_NROESTABLECI ' +
// eliminado 20-02-06                            '      AND PAO.AO_OPERATIVO = ' + SqlValue(fraOperativo.Value) +
                          '      AND ROWNUM = 1 ' +
                          '      ) AS TIENEAVISOOBRA, ' +

                          '      (SELECT MAX(RV_FECHA) ' +
                          '      FROM ART.PRV_RESVISITAS PRV ' +
                          '      WHERE PRV.RV_CUIT = AEM.EM_CUIT ' +
                          '      AND PRV.RV_ESTABLECI = AES.ES_NROESTABLECI ' +
                          '      ) AS FECHAULTVISITA, ' +

                          '      (NVL(DC_CODAREATELEFONOS, '''') || DC_TELEFONOS) TELEFONOEMP, ' +
                          '      (NVL(DC_CODAREAFAX, '''') || DC_FAX) FAXEMP, ' +
                          '      (NVL(ES_CODAREATELEFONOS, '''') || ES_TELEFONOS) TELEFONOSESTAB, ' +
                          '      (NVL(ES_CODAREAFAX, '''') || ES_FAX) FAXESTAB, ' +
                          '      NULL ES_REFERENTE, ' +
                          '       (SELECT max(rk_descripcion) ' +
                          '          FROM hys.hre_rankingempresa, hys.hrk_ranking ' +
                          '         WHERE re_idempresa = aem.em_id ' +
                          '           AND rk_id = re_idranking ' +
                          '           AND re_fechabaja IS NULL ' +
                          '          AND (   (re_vigenciahasta IS NULL) ' +
                          '               OR (art.actualdate BETWEEN re_vigenciadesde AND re_vigenciahasta ' +
                          '                   ) ' +
                          '               )) rk_descripcion ' +
//                            ' FROM cob.zrc_resumencobranza zrc_resumencobranza, ' +
                          'FROM  comunes.cac_actividad cac, ' +
                          '      afi.aes_establecimiento aes, ' +
                          '      afi.aco_contrato aco, ' +
                          '      afi.adc_domiciliocontrato ahdl, ' +
                          '      afi.aem_empresa aem ' +
                          sfrom +
                          ' WHERE aem.em_id = aco.co_idempresa ' +
                          ' and aco.co_contrato = aes.es_contrato ' +
//                            ' and zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
//                            ' and (zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))-1) ' +
                          ' and cac.ac_id = aes.es_idactividad ' +
                          // WF 3559
                          iif (cbCtosActivos.checked, ' and aco.co_estado = 1 ', '') +
                          ' and aco.co_contrato = art.get_vultcontrato(em_cuit) ' +
//                            ' and aco.co_contrato = art.afiliacion.Get_ContratoVigente(em_cuit) ' +
//                            ' and aes.es_fechabaja is null ' +
                          ' and ahdl.dc_contrato(+) = co_contrato ' +
                          ' and ahdl.dc_tipo(+) = ''L'' ' +
                          ' and not exists (select 1 from hys.hep_estabporpreventor hep ' +
                          '                 where hep.ep_cuit = aem.em_cuit ' +
                          '                 and aes.es_nroestableci = hep.ep_estableci) ' +
                          sWhere);


end;

procedure TfrmAbmTipoEstablecimientoPreventor.OnEmpresaChange(
  Sender: TObject);
begin
    fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbLimpiarClick(
  Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraPreventorFiltro.Clear;
  cbSinPreventor.Checked := false;
  cbTercerizado.Checked := false;
  cbPreventorReferente.Checked := false;
  fraLocalidad.Clear;
  edActividad.Clear;
  edEstablecimiento.Clear;
  cbEmpresasSinAsignar.Checked := false;
  edCantTrabajadoresMin.Clear;
  edCantTrabajadoresMax.Clear;
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
  fraTipoFiltro.Limpiar;
  fraSubTipoFiltro.Clear;
  fraRanking.Clear;
  cbAnexoI.Checked := false;
  cbAnexoII.Checked := false;
  cbPrs.Checked := false;
  cbPrsIdentico.Checked := false;
  cbDenuncias.Checked := false;
  cbAvisoObra.Checked := false;
  edNombreEstableci.Clear;
  cbEventual.Checked := false;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.cbTodosEstabClick(
  Sender: TObject);
begin
    if cbTodosEstab.Checked then
    begin
        fraEstablecimiento.Locked := true;
        fraEstablecimiento.Limpiar(false);
    end
    else begin
        if (ModoABM <> maModificacion) then fraEstablecimiento.Locked := false
        else fraEstablecimiento.Cargar(sdqConsulta.FieldbyName('em_cuit').AsString,
                                       sdqConsulta.FieldbyName('es_nroestableci').AsInteger, false);
    end;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbCambiarPreventorClick(
  Sender: TObject);
begin
    fraPreventorActual.Clear;
    fraPreventorNuevo.Clear;
    cbReferenteCambio.Checked := false;
    fpCambiarPreventor.ShowModal;
end;

function TfrmAbmTipoEstablecimientoPreventor.EsEmpresaEAS (aCUIT: String; aFecha: TDateTime): Boolean;
begin
  result := ExisteSql('SELECT 1 ' +
                      '  FROM hys.hre_rankingempresa ' +
                      ' WHERE (   re_vigenciahasta IS NULL ' +
                      '        OR (    (re_vigenciahasta IS NOT NULL) ' +
                      '            AND (' + SqlDate (aFecha) + ' <= re_vigenciahasta) ' +
                      '           ) ' +
                      '       ) ' +
                      '   AND ' + SqlDate (aFecha) + ' >= re_vigenciadesde ' +
                      '   AND re_idempresa = (SELECT em_id ' +
                      '                         FROM afi.aem_empresa ' +
                      '                        WHERE em_cuit = ' + SqlValue(aCUIT) + ') ')
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnAceptarCambioPreventorClick(
  Sender: TObject);
begin
  if ValidarCambioPreventor then
  begin
//  if (cbConsultaActual.Checked) then
//  begin
    sdqConsulta.First;
    sdqConsulta.DisableControls;
    Screen.Cursor := crHourGlass;
    try
      while not sdqConsulta.Eof do
      begin
        if (not fraPreventorActual.IsSelected) or
           (sdqConsulta.FieldByName('ep_itcodigo').AsString = fraPreventorActual.Codigo) then
        begin
          EjecutarSqlST('UPDATE HYS.HEP_ESTABPORPREVENTOR ' +
                        '   SET EP_ITCODIGO = ' + SqlValue(fraPreventorNuevo.Codigo) + ', ' +
                        '       EP_FECHAMODIF = SYSDATE, ' +
                        '       EP_USUMODIF = ' + SqlValue(Sesion.LoginName) +
                        ' WHERE EP_CUIT = ' + SqlValue(sdqConsulta.FieldbyName('EM_CUIT').AsString) +
                        '       AND EP_ESTABLECI = ' + SqlValue(sdqConsulta.FieldbyName('es_nroestableci').AsString));

          // Mandar Informes de Accidentes si la empresa es ET/EP/EAS
          if (sdqConsulta.FieldbyName('ep_tipo').AsString = 'ET') or
             (sdqConsulta.FieldbyName('ep_tipo').AsString = 'EP') or
             EsEmpresaEAS (sdqConsulta.FieldbyName('EM_CUIT').AsString, DBDate) then
            GenerarSolicitudInforme (sdqConsulta.FieldbyName('EM_CUIT').AsString, StrToInt(fraPreventorNuevo.ID),
                                     iif (sdqConsulta.FieldbyName('ep_tipo').AsString = 'ET',
                                          'La empresa ha sido calificadad como ET',
                                           iif (sdqConsulta.FieldbyName('ep_tipo').AsString = 'ET',
                                                'La empresa ha sido calificadad como EP',
                                                iif (EsEmpresaEAS (sdqConsulta.FieldbyName('EM_CUIT').AsString, DBDate),
                                                     'La empresa a sido definida como EAS',''))))
        end;

        Application.ProcessMessages;

        if cbReferenteCambio.Checked then
          ActualizarPreventorReferente(sdqConsulta.FieldbyName('EM_CUIT').AsString, fraPreventorNuevo.Codigo);

        sdqConsulta.Next;
      end;
    finally
      Screen.Cursor := crDefault;
      sdqConsulta.EnableControls;
      FTodos := false;
    end;
//  end;
(*
    else begin
        EjecutarSqlST('UPDATE HYS.HEP_ESTABPORPREVENTOR ' +
                    'SET EP_ITCODIGO = ' + SqlValue(fraPreventorNuevo.Value) + ', ' +
                    ' EP_FECHAMODIF = SYSDATE, ' +
                    ' EP_USUMODIF = ' + SqlValue(Sesion.LoginName) +
                    ' WHERE EP_ITCODIGO = ' + SqlValue(fraPreventorActual.Value));
        fraPreventorActual.Locked := true;
    end;
*)
    sdqConsulta.Refresh;
    fpCambiarPreventor.ModalResult := mrOk;
  end;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.cbConsultaActualClick(
  Sender: TObject);
begin
(*
    if (cbConsultaActual.Checked) then
    begin
        fraPreventorActual.Clear;
        fraPreventorActual.Locked := true;
    end
    else fraPreventorActual.Locked := false;
*)
end;

function TfrmAbmTipoEstablecimientoPreventor.ValidarCambioPreventor: boolean;
begin
    Result := VerificarMultiple(['Cambio de Preventor',
                                fraPreventorNuevo, (not fraPreventorNuevo.IsSelected) or (fraPreventorNuevo.IsSelected and fraPreventorNuevo.sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull), 'El preventor debe estar activo',
                                edMotivoCambio, edMotivoCambio.text<>'', 'Debe especificar un motivo de cambio'
                                ]);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.cbSinPreventorClick(
  Sender: TObject);
begin
    if (cbSinPreventor.Checked) then
    begin
        fraPreventorFiltro.Clear;
        fraPreventorFiltro.Locked := true;
        cbPreventorReferente.Enabled := false;
        cbPreventorReferente.Checked := false
    end
    else begin
        fraPreventorFiltro.Locked := false;
        cbPreventorReferente.Enabled := true;
        cbPreventorReferente.Checked := false
    end
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnCancelarCambiosClick(
  Sender: TObject);
begin
    RollBackUpdates;
    if sdqConsulta.Active then sdqConsulta.Refresh;
    ModalResult := mrCancel;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnGuardarClick(
  Sender: TObject);
begin
    BeginTrans(true);
    CommitTrans;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraPreventorFiltrocmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorFiltro.cmbDescripcion.Text := '%' + fraPreventorFiltro.cmbDescripcion.Text;
  fraPreventorFiltro.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] = '%') then
      fraPreventorFiltro.cmbDescripcion.Text := copy(fraPreventorFiltro.cmbDescripcion.Text, 2, length(fraPreventorFiltro.cmbDescripcion.Text));

  inherited;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnAceptarEmpNoAsigClick(
  Sender: TObject);
var
    CuitAnterior: string;
begin
    if ValidarEmpresasNoAsignadas and
    (MsgBox('¿Desea asignar a la consulta actual? ' + #13#10
    + 'El Preventor: ' + uppercase(fraPreventorEmpNoAsignadas.Descripcion) + #13#10
    + 'El Tipo: ' + uppercase(fraTipoEmpNoAsignadas.Descripcion) + #13#10
    + 'La Actividad: ' + uppercase(cmbActividadEmpNoAsignadas.GetItemText(cmbActividadEmpNoAsignadas.ItemIndex)), MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
    begin
        sdqConsulta.First;
        sdqConsulta.DisableControls;
        Screen.Cursor := crHourGlass;
        try

(*
        EjecutarSqlST('INSERT INTO HYS.HHE_HISTESTABPORPREVENTOR(HE_ID, HE_CUIT, HE_ESTABLECI, HE_TIPO, HE_ACTIVIDAD, ' +
                      'HE_FECHAALTA, HE_USUALTA, HE_ITCODIGO) ' +
                      'SELECT ART.SEQ_HHE_ID.NEXTVAL, em_cuit, es_nroestableci, ' +
                      SqlValue(fraTipoEmpNoAsignadas.Value) + ', ' +
                      SqlValue(cmbActividadEmpNoAsignadas.Value) + ', ' +
                      'SYSDATE, ' +
                      SqlValue(Sesion.LoginName) + ', ' +
                      SqlValue(fraPreventorEmpNoAsignadas.Value) +
                      ' FROM comunes.cac_actividad cac, ' +
                      '      afi.aes_establecimiento aes, ' +
                      '      afi.aco_contrato aco, ' +
                      '      afi.aem_empresa aem ' + sfrom +
                      ' WHERE aem.em_id = aco.co_idempresa ' +
                      ' and aco.co_contrato = aes.es_contrato ' +
//                      ' and zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
//                            ' and zrc_resumencobranza.rc_empleados <> 236000 ' +
//                      ' and (zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))-1) ' +
//                            ' zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))) ' +
                      ' and cac.ac_id = aes.es_idactividad ' +
                      ' and aco.co_estado = ''1''' +
//                            ' and aco.co_contrato = art.afiliacion.Get_ContratoVigente(em_cuit) ' +
                      ' and aes.es_fechabaja is null ' +
                      ' and aco.co_contrato = art.afiliacion.Get_ContratoVigente(em_cuit) ' +
                      ' and not exists (select 1 from hys.hep_estabporpreventor hep ' +
                      '                 where hep.ep_cuit = aem.em_cuit ' +
                      '                 and aes.es_nroestableci = hep.ep_estableci) ' + sWhere);
*)

          EjecutarSqlST('INSERT INTO HYS.HEP_ESTABPORPREVENTOR(EP_CUIT, EP_ESTABLECI, EP_TIPO, EP_ACTIVIDAD, ' +
                                'EP_FECHAALTA, EP_USUALTA, EP_ITCODIGO) ' +
                                'SELECT distinct em_cuit, es_nroestableci, ' +
                                SqlValue(fraTipoEmpNoAsignadas.Value) + ', ' +
                                SqlValue(cmbActividadEmpNoAsignadas.Value) + ', ' +
                                'SYSDATE, ' +
                                SqlValue(Sesion.LoginName) + ', ' +
                                SqlValue(fraPreventorEmpNoAsignadas.Codigo) +
//                                ' FROM cob.zrc_resumencobranza zrc_resumencobranza, ' +
                                ' FROM comunes.cac_actividad cac, ' +
                                '      afi.aes_establecimiento aes, ' +
                                '      afi.aco_contrato aco, ' +
                                '      afi.aem_empresa aem ' + sfrom +
                                ' WHERE aem.em_id = aco.co_idempresa ' +
                                ' and aco.co_contrato = aes.es_contrato ' +
//                                ' and zrc_resumencobranza.rc_contrato = aco.co_contrato ' +
          //                            ' and zrc_resumencobranza.rc_empleados <> 236000 ' +
//                                ' and (zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))-1) ' +
          //                            ' zrc_resumencobranza.rc_periodo = (art.cobranza.get_ultperiododevengado (''E''))) ' +
                                ' and cac.ac_id = aes.es_idactividad ' +
                                // WF 3559
                                iif (cbCtosActivos.checked, ' and aco.co_estado = 1 ', '') +
//                                ' and aco.co_contrato = art.afiliacion.Get_ContratoVigente(em_cuit) ' +
//                                ' and aes.es_fechabaja is null ' +
                                ' and aco.co_contrato = art.get_vultcontrato(em_cuit) ' +
                                ' and not exists (select 1 from hys.hep_estabporpreventor hep ' +
                                '                 where hep.ep_cuit = aem.em_cuit ' +
                                '                 and aes.es_nroestableci = hep.ep_estableci) ' + sWhere);


          if (cbReferenteNoAsignadas.Checked) then
          begin
              sdqConsulta.First;
              CuitAnterior := '';
              while not sdqConsulta.Eof do
              begin
                if (CuitAnterior <> sdqConsulta.FieldbyName('EM_CUIT').AsString) then
                    ActualizarPreventorReferente(sdqConsulta.FieldbyName('EM_CUIT').AsString, fraPreventorEmpNoAsignadas.Codigo);
                CuitAnterior := sdqConsulta.FieldbyName('EM_CUIT').AsString;
                Application.ProcessMessages;
                sdqConsulta.Next;
              end;
          end;

(*
          while not sdqConsulta.Eof do
          begin
                  EjecutarSqlST('INSERT INTO HYS.HEP_ESTABPORPREVENTOR(EP_CUIT, EP_ESTABLECI, EP_TIPO, EP_ACTIVIDAD, ' +
                                'EP_FECHAALTA, EP_USUALTA, EP_ITCODIGO) ' +
                                'VALUES( ' + SqlValue(sdqConsulta.FieldbyName('EM_CUIT').AsString) + ', ' +
                                SqlValue(sdqConsulta.FieldbyName('es_nroestableci').AsString) + ', ' +
                                SqlValue(fraTipoEmpNoAsignadas.Value) + ', ' +
                                SqlValue(cmbActividadEmpNoAsignadas.Value) + ', ' +
                                'SYSDATE, ' +
                                SqlValue(Sesion.LoginName) + ', ' +
                                SqlValue(fraPreventorEmpNoAsignadas.Value) + ')');
                  sdqConsulta.Next;
          end;
*)
        finally
            Screen.Cursor := crDefault;
            sdqConsulta.EnableControls;
        end;
    end;
    sdqConsulta.Refresh;
    fpEmpresasNoAsignadas.ModalResult := mrOk;
end;

function TfrmAbmTipoEstablecimientoPreventor.ValidarEmpresasNoAsignadas: boolean;
begin
    Result := VerificarMultiple(['Asignación de Empresas',
                                fraTipoEmpNoAsignadas, fraTipoEmpNoAsignadas.IsSelected, 'Debe especificar el tipo',
                                cmbActividadEmpNoAsignadas, cmbActividadEmpNoAsignadas.Text <> '', 'Debe especificar la actividad de la Empresa'
                                ]);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbNoAsignadasClick(
  Sender: TObject);
begin
  inherited;
  fraPreventorEmpNoAsignadas.Clear;
  fraTipoEmpNoAsignadas.Limpiar;
  cmbActividadEmpNoAsignadas.Text := '';
  cbReferenteNoAsignadas.Checked := false;
  fpEmpresasNoAsignadas.ShowModal;
  tbNoAsignadas.Enabled := cbEmpresasSinAsignar.Checked;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.FSFormShow(Sender: TObject);
begin
  if btnGuardar.Visible then
    btnCancelar.Caption := '&Cancelar'
  else
    btnCancelarCambios.Caption := '&Salir';

  tbNoAsignadas.Enabled := cbEmpresasSinAsignar.Checked;
  tbCambiarPreventor.Enabled := not cbEmpresasSinAsignar.Checked;

  if fraEmpresaFiltro.IsSelected
    then tbRefrescarClick(Sender);
end;

function TfrmAbmTipoEstablecimientoPreventor.ArmarFiltroEstab(
  Establecimientos: string): string;
var
    i, j: integer;
    cotaMenor, cotaMayor: integer;
    tmpValores: string;
begin
    while (pos('-', Establecimientos) > 0) do
    begin
        i:= pos('-', Establecimientos);
        while (i > 0) and (Establecimientos[i] <> ',') do
            i := i - 1;

        cotaMenor := strtoint(copy(Establecimientos, i+1, pos('-', Establecimientos)-1 - i ));

        i:= pos('-', Establecimientos);
        while (i <= length(Establecimientos)) and (Establecimientos[i] <> ',') do
            i := i + 1;
        cotaMayor := strtoint(copy(Establecimientos, pos('-', Establecimientos)+1, i-1 - pos('-', Establecimientos)));

        tmpValores := '';

        for j:=cotaMenor to cotaMayor do
            tmpValores := tmpValores + ',' + IntToStr(j);

        Establecimientos := StringReplace(Establecimientos, '-', tmpValores + ',', []);
    end;

    result := Establecimientos;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraPreventorActualcmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventorActual);
  inherited;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraPreventorNuevocmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventorNuevo);
  inherited;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.FiltrarPreventor(
  Sender: TObject; fraPreventor: TfraCodigoDescripcion);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
      fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text := copy(fraPreventor.cmbDescripcion.Text, 2, length(fraPreventor.cmbDescripcion.Text));
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraPreventorEmpNoAsignadascmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventorEmpNoAsignadas);
  inherited;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraPreventorcmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventor);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.OnEmpresaChangeFiltro(
  Sender: TObject);
begin
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.ActualizarHistorico;
begin
  if (not FTodos) and FCambio then
    fpMotivoCambio.ShowModal;

  EjecutarSqlST('UPDATE HYS.HHE_HISTESTABPORPREVENTOR ' +
                'SET HE_MOTIVOCAMBIO = ' + SqlString(edMotivoCambioSolicitado.text, true) +
                'WHERE HE_CUIT = ' +  SqlValue(fraEmpresa.mskCUIT.Text) + ' AND ' +
                'HE_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger) + ' AND ' +
                'HE_ID = (SELECT MAX(HE_ID) FROM  HYS.HHE_HISTESTABPORPREVENTOR ' +
                '         WHERE HE_CUIT = ' +  SqlValue(fraEmpresa.mskCUIT.Text) + ' AND ' +
                '         HE_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger) +  ')');
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fpMotivoCambioClose(
  Sender: TObject; var Action: TCloseAction);
begin
    if VerificarMultiple(['Motivo Cambio',
                          edMotivoCambioSolicitado, edMotivoCambioSolicitado.text<>'', 'Debe especificar un motivo de cambio'
                         ]) then Action := caFree
    else Action := caNone;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fpMotivoCambioBeforeShow(
  Sender: TObject);
begin
    edMotivoCambioSolicitado.Clear;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbHistoricoClick(
  Sender: TObject);
begin
    if (fraEstablecimiento.edCodigo.Text <> '') and (fraEmpresa.mskCUIT.Text <> '') then
        TfrmHistoricoAsignaciones.MostrarHistorico(fraEmpresa.mskCUIT.Text, strtoint(fraEstablecimiento.edCodigo.Text));
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnTodosClick(
  Sender: TObject);
begin
    FTodos := True;
    fpMotivoCambio.ModalResult := mrOk;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraTipoEmpresaChange(
  Sender: TObject);
begin
    if fraTipoEmpresa.Codigo = 'CO' then
    begin
        cmbActividad.Clear;
        cmbActividad.Items.Add('C=Construcción');

    end
    else begin
        cmbActividad.Clear;
        cmbActividad.Items.Add('A=Agro');
        cmbActividad.Items.Add('I=Industria');
        cmbActividad.Items.Add('C=Construcción');
    end;

end;

procedure TfrmAbmTipoEstablecimientoPreventor.FSFormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
  if btnGuardar.Enabled then
  begin
    CanClose := not (MsgBox('Para registrar los cambios debe hacer click en Guardar. ¿Desea salir de todas formas?', MB_ICONQUESTION + MB_YESNO, Self.Caption)  = IDNO);
    if CanClose then RollBackUpdates;
  end
  else
    CanClose := True
end;

procedure TfrmAbmTipoEstablecimientoPreventor.btnInfoEstableciClick(
  Sender: TObject);
begin
     if fraEstablecimiento.edCodigo.Value <> 0 Then begin
         MsgBox('Teléfono de la Empresa: ' +  sdqConsulta.fieldbyname('TELEFONOEMP').AsString + #13 + 'Teléfonos del Establecimiento: ' +
                sdqConsulta.fieldbyname('TELEFONOSESTAB').AsString , MB_ICONINFORMATION, 'Información del Establecimiento');
     end;
end;

function TfrmAbmTipoEstablecimientoPreventor.VerifyChanges: boolean;
var
    Qry: TSDQuery;
begin
    Qry := GetQuery('SELECT EP_ACTIVIDAD, EP_TIPO, EP_ITCODIGO FROM HYS.HEP_ESTABPORPREVENTOR WHERE EP_CUIT = ' +  SqlValue(fraEmpresa.mskCUIT.Text) +
                    ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger));
    try
      result := (fraPreventor.Codigo <> (Qry.FieldByName('EP_ITCODIGO').AsString)) or
                (cmbActividad.Value <> (Qry.FieldByName('EP_ACTIVIDAD').AsString)) or
                (fraTipoEmpresa.Codigo <> (Qry.FieldByName('EP_TIPO').AsString));

      // Mandar Informes de Accidentes si la empresa es ET/EP/EAS
      if (fraPreventor.Codigo <> Qry.FieldByName('EP_ITCODIGO').AsString) and
         ((fraTipoEmpresa.Codigo = 'ET') or
          (fraTipoEmpresa.Codigo = 'EP') or
          EsEmpresaEAS (fraEmpresaFiltro.mskCUIT.Text, DBDate)) then
        GenerarSolicitudInforme (fraEmpresa.mskCUIT.Text, fraPreventor.Value, '')
    finally
      Qry.free;
    end;

end;

procedure TfrmAbmTipoEstablecimientoPreventor.ActualizarPreventorReferente(aCuit,
  aIdPreventor: string);
var
    PreventorAnterior: string;
begin
    PreventorAnterior :=ValorSql(' select PC_CODIGOPREVENTOR ' +
                                 ' from afi.APC_PREVENTORCONTRATO ' +
                                 ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(aCuit)  + ') ' +
                                 ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ', '');
                  //                 ' and PC_CODIGOPREVENTOR = ' + SqlValue(aIdPreventor)) then
    if (PreventorAnterior <> aIdPreventor) then
    begin
        if (PreventorAnterior <> '') then
            EjecutarSqlST(' update afi.APC_PREVENTORCONTRATO ' +
                          ' set PC_FECHA_HASTA = sysdate-0.00001,  ' +
                          ' PC_USUMODIF = ' +  SqlValue(Sesion.LoginName) + ', ' +
                          ' PC_FECHAMODIF = SYSDATE ' +
                          ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(aCuit)  + ') ' +
                          ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ');

        if (aIdPreventor <> '') then
            EjecutarSqlST(' insert into afi.APC_PREVENTORCONTRATO(PC_ID, PC_CONTRATO, PC_CODIGOPREVENTOR, ' +
                          ' PC_FECHA_DESDE, PC_FECHA_HASTA, PC_USUALTA, PC_FECHAALTA) ' +
                          ' VALUES(AFI.SEQ_APC_ID.NEXTVAL, art.get_vultcontrato(' + SqlValue(aCuit)  + '), ' +
                          SqlValue(aIdPreventor) + ', SYSDATE, NULL, ' + SqlValue(Sesion.LoginName) + ', SYSDATE)');

    end;

end;

procedure TfrmAbmTipoEstablecimientoPreventor.GridGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;

  if (AFont.Color <> clRed) then
  begin
    if sdqConsulta.Active and not (sdqConsulta.FieldByName('ES_FECHABAJA').IsNull) then
    begin
      AFont.Color := clRed;
    end
    else begin
      if (sdqConsulta.Active) and (sdqConsulta.FieldByName('ES_REFERENTE').AsString = 'SI')
        then begin
          AFont.Color := clBlue
        end;
    end
  end
end;

procedure TfrmAbmTipoEstablecimientoPreventor.GridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if (gdSelected in State) and (sdqConsulta.Active) and
     (sdqConsulta.FieldByName('ES_REFERENTE').AsString = 'SI') then begin
    Grid.Canvas.Brush.Color := clYellow;
    Grid.Canvas.FillRect(Rect);
    Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString)
  end;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.cbPreventorReferenteClick(
  Sender: TObject);
begin
  if Trim(fraPreventorFiltro.cmbDescripcion.Text) = '' then begin
        cbPreventorReferente.Checked := false;
        Exit
  end;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.fraEmpresaFiltroExit(
  Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.FrameExit(Sender);
end;

procedure TfrmAbmTipoEstablecimientoPreventor.cbOperativoActualClick(
  Sender: TObject);
begin
    fraOperativo.Locked := cbOperativoActual.Checked;
end;

function TfrmAbmTipoEstablecimientoPreventor.GenerarSolicitudInforme (CUIT: String;
            idPreventor: Integer; Motivo: String): Boolean;
var
  NroPedido: LongInt;
  eMail,
  OperActual: String;
  FechaDesde,
  FechaHasta: TDateTime;
begin
  Result := false;

  // Obtengo e-mail del preventor
  eMail := ValorSql ('SELECT NVL(it_email,'''') it_email' +
                     '  FROM art.pit_firmantes ' +
                     ' WHERE it_id = ' + SqlValue(idPreventor));
  if not ((eMail <> '') and (CUIT <> '') and (idPreventor <> 0)) then
    Exit;

  // Defino FechaDesde y FechaHasta correspondientes al Operativo Actual de la Empresa
  OperActual := ValorSql ('SELECT art.hys.get_operativovigente_empresa (' +
                          SQLValue (CUIT) + ', SYSDATE) FROM DUAL');
  FechaDesde := StrToDate ('01/' + Copy (OperActual, 5, 2) + '/' + Copy (OperActual, 1, 4));
  FechaHasta := DBDate;

  // Verifico si el reporte está pedido y sin enviar
  if ExisteSQL ('SELECT 1 ' +
                '  FROM hys.hpr_pedidosreporte pr, ' +
                '       hys.hpp_parametrospedido pp, ' +
                '       hys.hpw_pedidosweb pw ' +
                ' WHERE pp.pp_idpedidoreporte = pr.pr_id ' +
                '   AND pw.pw_idpedido = pr.pr_id ' +
                '   AND pw.pw_idreporte = 1 ' +
                '   AND (   (    UPPER (pp.pp_parametro) LIKE UPPER (''CUIT%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (CUIT) +
                '           ) ' +
                '        OR (    UPPER (pp.pp_parametro) LIKE UPPER (''FECHADESDE%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (FormatDateTime('DD/MM/YYYY', FechaDesde)) +
                '           ) ' +
                '        OR (    UPPER (pp.pp_parametro) LIKE UPPER (''FECHAHASTA%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (FormatDateTime('DD/MM/YYYY', FechaHasta)) +
                '           ) ' +
                '       ) ' +
                '   AND pr.pr_fechaenvio IS NULL ' +
                '   AND pr.pr_emailrespuesta = ' + SqlValue(Trim(eMail))) then
    Exit;

  try
    // Obtengo el nro. de Pedido
    NroPedido := ValorSqlInteger ('SELECT hys.seq_hpr_id.nextval FROM dual');

    // Inserto el nuevo pedido
    EjecutarSqlST(
      'INSERT INTO hys.hpr_pedidosreporte(PR_ID, PR_EMAILRESPUESTA, PR_FECHAALTA, PR_USUALTA, PR_ASUNTO, PR_ORIGENPEDIDO) ' +
      'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(Trim(eMail)) +
      ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' + SqlValue(Motivo) + ', ''F'')'
    );

    // Informe de Accidentes
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (1) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Informe de Evolución de Accidentes
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (4) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Informe de Establecimientos
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (2) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro CUIT
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('CUITFILTRO') + ', ' +
      SqlValue (CUIT) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro FechaDesde
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('FECHADESDEFILTRO') + ', ' +
      SqlValue (FormatDateTime('DD/MM/YYYY', FechaDesde)) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro FechaHasta
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('FECHAHASTAFILTRO') + ', ' +
      SqlValue (FormatDateTime('DD/MM/YYYY', FechaHasta)) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro e-Mail
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('EMAILFILTRO') + ', ' +
      SqlValue (eMail) + ', ' + SqlValue(NroPedido) + ')'
    );

    Result := true
  except
    On E: Exception do Result := false
  end
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbCPClick(
  Sender: TObject);
begin
  Abrir(TfrmReasignacionCP, frmReasignacionCP, tmvNormal, frmPrincipal.mnuReasigCP);

  frmReasignacionCP.Caption := 'Consulta de CP asignados';
  frmReasignacionCP.pnlAsignacion.Visible := false;
  frmReasignacionCP.btnGuardar.Visible := false;
  frmReasignacionCP.edCP.Text := fraLocalidad.edCPostal.Text;
  if fraPreventorFiltro.IsSelected then
    frmReasignacionCP.fraPreventorOrigen.Value := fraPreventorFiltro.Value;
  frmReasignacionCP.btnCancelar.Caption := '&Salir';
end;

procedure TfrmAbmTipoEstablecimientoPreventor.tbAfiliacionesClick(
  Sender: TObject);
begin
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    DoCargarDatos(fraEmpresa.Contrato);
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAbmTipoEstablecimientoPreventor.GridDblClick(
  Sender: TObject);
begin
//
end;

end.


