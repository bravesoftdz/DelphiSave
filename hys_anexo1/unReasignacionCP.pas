{-----------------------------------------------------------------------------
 Unit Name: unReasignacionCP
 Author:    racastro
 Date:      Mar-2007
 Purpose:   Reasignación de CP
 History:
-----------------------------------------------------------------------------}

unit unReasignacionCP;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DB, StdCtrls, RxRichEd, 
  ComCtrls, SDEngine, DBCtrls, RxLookup, Mask, RXCtrls, StrUtils, General,
  ExtCtrls, unDmPrincipal, ANSISql, Placemnt, unSesion, ToolEdit,
  LookupDialog, unArtFrame, unFraCodigoDescripcion, CustomDlgs, RxMemDS,
  Buttons, unfraCodigoDescripcionExt, FormPanel, SortDlg, ToolWin,
  ShortCutControl, unArtDBAwareFrame, QueryToFile, ExportDialog,
  unFraCodDesc, RxPlacemnt;

type
  TfrmReasignacionCP = class(TForm)
    sdqAsignados: TSDQuery;
    dsPendientes: TDataSource;
    tblAsignados: TRxMemoryData;
    dsAsignados: TDataSource;
    tblPendientes: TRxMemoryData;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    tblAsignadospc_codigo: TStringField;
    tblAsignadospc_idpreventor: TIntegerField;
    tblAsignadoscp_localidad: TStringField;
    tblAsignadospv_descripcion: TStringField;
    tblAsignadosit_nombre: TStringField;
    tblAsignadosit_codigo: TStringField;
    tblPendientesit_codigo: TStringField;
    tblPendientesid_destino: TIntegerField;
    tblPendientescod_destino: TStringField;
    tblPendientesdescr_destino: TStringField;
    fpListaEmpresas: TFormPanel;
    sdqListaEmpresas: TSDQuery;
    RxDBGrid1: TRxDBGrid;
    dsListaEmpresas: TDataSource;
    ShortCutControl: TShortCutControl;
    tblPendientescriterio: TIntegerField;
    tblPendientesdescr_criterio: TStringField;
    sdqResumenEstablecimientos: TSDQuery;
    dsResumenEstablecimientos: TDataSource;
    FormPlacement1: TFormPlacement;
    pnlAsignacion: TPanel;
    Label5: TLabel;
    btnAsignar: TSpeedButton;
    btnVerEstab: TSpeedButton;
    btnDesasignar: TSpeedButton;
    btnAsignarTodos: TSpeedButton;
    btnDesasignarTodos: TSpeedButton;
    btnResumen: TSpeedButton;
    fraPreventorDestino: TfraCodigoDescripcionExt;
    GroupBox1: TGroupBox;
    grdPendientes: TRxDBGrid;
    fpResumenEstablecimientos: TFormPanel;
    lblTotal: TLabel;
    RxDBGrid2: TRxDBGrid;
    rgCriterio: TRadioGroup;
    Panel1: TPanel;
    pnlFiltros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fraProvincia: TfraCodigoDescripcionExt;
    fraLocalidad: TfraCodigoDescripcionExt;
    fraPreventorOrigen: TfraCodigoDescripcionExt;
    edCP: TEdit;
    grdAsignados: TRxDBGrid;
    cbAplicarTodoCP: TCheckBox;
    tblPendientesAplicarTodoCP: TBooleanField;
    tblPendientesTodoCP: TStringField;
    sbInfo: TSpeedButton;
    spInfo: TMemo;
    chbIncluirBajas: TCheckBox;
    tblAsignadospc_fechabaja: TDateTimeField;
    tblPendientespc_fechabaja: TDateTimeField;
    tblAsignadospc_provincia: TStringField;
    tblPendientespc_provincia: TStringField;
    btnABMPreventores: TSpeedButton;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton5: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton4: TToolButton;
    tbPropiedades: TToolButton;
    ToolButton3: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    ToolButton6: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviar_Mail: TToolButton;
    ToolButton8: TToolButton;
    tbMostrarFiltros: TToolButton;
    tbMaxRegistros: TToolButton;
    ToolButton11: TToolButton;
    tbTotalesRegGrilla: TToolButton;
    ToolButton30: TToolButton;
    tbSalir: TToolButton;
    fpAltaCP: TFormPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    btnAceptarCambioPreventor: TButton;
    btnCancelarCambioPreventor: TButton;
    fraPreventorAbm: TfraCodigoDescripcion;
    fraCodigoPostalAbm: TfraCodigoDescripcionExt;
    Label7: TLabel;
    fraProvinciaAbm: TfraCodigoDescripcionExt;
    Label8: TLabel;
    chkSegunPerfil: TCheckBox;
    tblAsignadospc_usubaja: TStringField;
    tblAsignadospc_id: TIntegerField;
    tbAsigMasivas: TToolButton;
    Panel3: TPanel;
    btnGuardar: TButton;
    btnCancelar: TButton;
    pnAceptarPreventor: TPanel;
    btnAceptar: TButton;
    btCancelar: TButton;
    chkPisarExclusivo: TCheckBox;
    tblPendientesPisarExclusivo: TBooleanField;
    ExportDialog: TExportDialog;
    chkSinPreventor: TCheckBox;
    fraDepart: TfraCodDesc;
    Label47: TLabel;
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraPreventorOrigencmbDescripcionDropDown(Sender: TObject);
    procedure fraProvinciacmbDescripcionDropDown(Sender: TObject);
    procedure fraLocalidadcmbDescripcionDropDown(Sender: TObject);
    function ExisteCP (CP, Provincia: String; IDPreventor: Integer; CodPreventor, Nombre: String;
                       var T: TRxMemoryData; Reemplazar: Boolean): Boolean;
    procedure btnAsignarClick(Sender: TObject);
    procedure btnDesasignarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnVerEstabClick(Sender: TObject);
    procedure fpListaEmpresasClose(Sender: TObject;
      var Action: TCloseAction);
    procedure tbSalirListaClick(Sender: TObject);
    procedure btnAsignarTodosClick(Sender: TObject);
    procedure btnDesasignarTodosClick(Sender: TObject);
    procedure btnResumenClick(Sender: TObject);
    procedure tbSalirResumenClick(Sender: TObject);
    procedure sbInfoClick(Sender: TObject);
    procedure spInfoClick(Sender: TObject);
    procedure fraLocalidadEnter(Sender: TObject);
    procedure grdAsignadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraPreventorDestinocmbDescripcionDropDown(Sender: TObject);
    procedure btnABMPreventoresClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarCambioPreventorClick(Sender: TObject);
    procedure fraPreventorAbmcmbDescripcionDropDown(Sender: TObject);
    procedure fraCodigoPostalAbmcmbDescripcionDropDown(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbAsigMasivasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
  private
    procedure fraCodigoPostalAbmChange(Sender: TObject);
    procedure fraProvinciaAbmChange(Sender: TObject);
    procedure fraProvinciaChange(Sender: TObject);
  public
    FIDPreventor : Integer;
    { Public declarations }
  end;

var
  frmReasignacionCP: TfrmReasignacionCP;

implementation

uses unEspera, unManPreventores, unPrincipal;

{$R *.dfm}

{-----------------------------------------------------------------------------
  Procedure:   btnFiltrarClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Aplica filtro y genera tabla en memoria de asignados con
               datos de consulta
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnFiltrarClick(Sender: TObject);
begin
end;

{-----------------------------------------------------------------------------
  Procedure:   btnLimpiarClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Limpia Filtros y tabla en memoria de asignados
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnLimpiarClick(Sender: TObject);
begin
end;

{-----------------------------------------------------------------------------
  Procedure:   FormCreate
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Inicializa frames
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.FormCreate(Sender: TObject);
begin
  FIDPreventor := 0;
  with fraProvincia do
  begin
    TableName := 'art.cpv_provincias';
    FieldDesc := 'pv_descripcion';
    FieldID := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    CaseSensitive := false;
    OnChange := fraProvinciaChange;
  end;

  with fraProvinciaAbm do
  begin
    TableName := 'art.cpv_provincias';
    FieldDesc := 'pv_descripcion';
    FieldID := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    CaseSensitive := false;
    OnChange := fraProvinciaAbmChange;
  end;

  with fraPreventorOrigen do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    ExtraFields := ', it_codigo ';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraPreventorAbm do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    ExtraFields := ', it_codigo ';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraCodigoPostalAbm do
  begin
    TableName := 'art.ccp_codigopostal';
    FieldID := 'cp_codigo';
    FieldCodigo := 'cp_codigo';
    FieldDesc := 'cp_localidad';
    ExtraFields := ', cp_provincia, (select pv_descripcion from art.cpv_provincias where pv_codigo = cp_provincia) provincia ';
    CaseSensitive := false;
    OnChange := fraCodigoPostalAbmChange;
  end;

  with fraPreventorDestino do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    ExtraFields := ', it_codigo ';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;

  end;

  rgCriterio.ItemIndex := -1;
  cbAplicarTodoCP.Checked := False;
  spInfo.Visible := false;
  tbSalir.Left := tbAsigMasivas.Left + 1;
end;

procedure TfrmReasignacionCP.fraPreventorOrigencmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorOrigen.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorOrigen.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorOrigen.cmbDescripcion.Text := '%' + fraPreventorOrigen.cmbDescripcion.Text;
  fraPreventorOrigen.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorOrigen.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorOrigen.cmbDescripcion.Text)[1] = '%') then
      fraPreventorOrigen.cmbDescripcion.Text := copy(fraPreventorOrigen.cmbDescripcion.Text, 2, length(fraPreventorOrigen.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmReasignacionCP.fraProvinciacmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraProvincia.cmbDescripcion.Text) <> '') and
     (trim(fraProvincia.cmbDescripcion.Text)[1] <> '%') then
      fraProvincia.cmbDescripcion.Text := '%' + fraProvincia.cmbDescripcion.Text;
  fraProvincia.cmbDescripcionDropDown(Sender);
  if (trim(fraProvincia.cmbDescripcion.Text) <> '') and
     (trim(fraProvincia.cmbDescripcion.Text)[1] = '%') then
      fraProvincia.cmbDescripcion.Text := copy(fraProvincia.cmbDescripcion.Text, 2, length(fraProvincia.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmReasignacionCP.fraLocalidadcmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraLocalidad.cmbDescripcion.Text) <> '') and
     (trim(fraLocalidad.cmbDescripcion.Text)[1] <> '%') then
      fraLocalidad.cmbDescripcion.Text := '%' + fraLocalidad.cmbDescripcion.Text;
  fraLocalidad.cmbDescripcionDropDown(Sender);
  if (trim(fraLocalidad.cmbDescripcion.Text) <> '') and
     (trim(fraLocalidad.cmbDescripcion.Text)[1] = '%') then
      fraLocalidad.cmbDescripcion.Text := copy(fraLocalidad.cmbDescripcion.Text, 2, length(fraLocalidad.cmbDescripcion.Text));
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure:   ExisteCP
  Author:      racastro
  Date:        Mar-2007
  Arguments:   CP, Provincia: String; IDPreventor: Integer;
               CodPreventor, Nombre: String; var T: TRxMemoryData;
               Reemplazar: Boolean
  Result:      Boolean
  Description: Verifica si ya existe un CP y Provincia en una tabla en memoria,
               reemplazando, opcionalmente, los datos del preventor
-----------------------------------------------------------------------------}
function TfrmReasignacionCP.ExisteCP (CP, Provincia: String; IDPreventor: Integer; CodPreventor, Nombre: String;
                                      var T: TRxMemoryData; Reemplazar: Boolean): Boolean;
var
  Existe: Boolean;
begin
  Existe := false;

  with T do
  begin
    DisableControls;

    First;
    while not EoF do
    begin
      Existe := Existe or ((FieldByName ('pc_codigo').AsString = CP) and
                           (FieldByName ('pc_provincia').AsString = Provincia));

      if Reemplazar and (FieldByName ('pc_codigo').AsString = CP) and
                        (FieldByName ('pc_provincia').AsString = Provincia) and
                        (FieldByName ('id_destino').AsInteger <> IdPreventor) then
      begin
        Edit;

        FieldByName ('id_destino').AsInteger := IdPreventor;
        FieldByName ('cod_destino').AsString := CodPreventor;
        FieldByName ('descr_destino').AsString := Nombre;

        Post
      end;

      Next
    end;

    EnableControls
  end;

  Result := Existe
end;

{-----------------------------------------------------------------------------
  Procedure:   btnAsignarClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Transfiere de la tabla en memoria de Asignados a la de Pendientes,
               analizando si no existe ya en esta última el CP y provincia
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnAsignarClick(Sender: TObject);
var
  s: integer;
  FCodigoDestino : String;
begin
  VerificarMultiple(['Reasignación de Códigos Postales',
                     grdAsignados,
                     grdAsignados.SelectedRows.Count > 0,
                     'Deben seleccionarse CP Asignados.',
//  Si el preventor destino es obligatorio, agregar la validación:
//                     fraPreventorDestino,
//                     fraPreventorDestino.IsSelected,
//                     'Debe indicarse el preventor.',
                     rgCriterio,
                     rgCriterio.ItemIndex <> -1,
                     'Debe indicarse el Criterio de Asignación.'
                    ]);

  if not tblPendientes.Active then
    tblPendientes.Open;

  if fraPreventorDestino.IsSelected then
    FCodigoDestino := fraPreventorDestino.sdqDatos.FieldByName('it_codigo').AsString
  else
    FCodigoDestino := '';

  with grdAsignados.DataSource.DataSet do
  begin
    for s := 0 to grdAsignados.SelectedRows.Count-1 do
    begin
      GotoBookmark(pointer(grdAsignados.SelectedRows.Items[s]));

      // En caso que el destino deba ser distinto del origen, agregar condición: (FieldByName('it_codigo').AsString <> FCodigoDestino)
      if FieldByName('pc_fechabaja').IsNull then
      begin
        if not ExisteCP (FieldByName('pc_codigo').AsString,
                         FieldByName('pc_provincia').AsString,
                         iif (fraPreventorDestino.IsSelected, fraPreventorDestino.Value, 0),
                         FCodigoDestino,
                         iif (fraPreventorDestino.IsSelected, fraPreventorDestino.Descripcion, ''),
                         tblPendientes,
                         true) then
          tblPendientes.AppendRecord (
            [FieldByName('pc_codigo').AsString,
             FieldByName('pc_provincia').AsString,
             FieldByName('pc_idpreventor').AsString,
             FieldByName('cp_localidad').AsString,
             FieldByName('pv_descripcion').AsString,
             FieldByName('it_nombre').AsString,
             FieldByName('it_codigo').AsString,
             iif (fraPreventorDestino.IsSelected, fraPreventorDestino.Value, Null),
             iif (FCodigoDestino <> '', FCodigoDestino, Null),
             iif (fraPreventorDestino.IsSelected, fraPreventorDestino.Descripcion, Null),
             rgCriterio.ItemIndex,
             cbAplicarTodoCP.Checked,
             rgCriterio.Items[rgCriterio.ItemIndex],
             iif (cbAplicarTodoCP.Checked, 'SÍ', 'NO'),
             FieldByName('pc_fechabaja').AsString,
             chkPisarExclusivo.Checked
             ]
          );
        Delete
      end
    end
  end;

  grdAsignados.UnselectAll;
  rgCriterio.ItemIndex := -1;
  cbAplicarTodoCP.Checked := False;
end;

{-----------------------------------------------------------------------------
  Procedure:   btnDesasignarClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Transfiere de la tabla en memoria de Pendientes a la de Asignados,
               analizando si no existe ya en esta última el CP y provincia
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnDesasignarClick(Sender: TObject);
var
  s: integer;
begin
  if grdPendientes.SelectedRows.Count = 0 then
    Exit;

  if not tblAsignados.Active then
    tblAsignados.Open;

  with grdPendientes.DataSource.DataSet do
  begin
    for s := 0 to grdPendientes.SelectedRows.Count-1 do
    begin
      GotoBookmark(pointer(grdPendientes.SelectedRows.Items[s]));

      if not ExisteCP (FieldByName('pc_codigo').AsString,
                       FieldByName('pc_provincia').AsString,
                       FieldByName('pc_idpreventor').AsInteger,
                       FieldByName('it_codigo').AsString,
                       FieldByName('it_nombre').AsString,
                       tblAsignados,
                       false) then
        tblAsignados.AppendRecord (
          [FieldByName('pc_codigo').AsString,
           FieldByName('pc_provincia').AsString,
           FieldByName('pc_idpreventor').AsString,
           FieldByName('cp_localidad').AsString,
           FieldByName('pv_descripcion').AsString,
           FieldByName('it_nombre').AsString,
           FieldByName('it_codigo').AsString,
           FieldByName('pc_fechabaja').AsString]
        );

      Delete
    end
  end;

  grdPendientes.UnselectAll
end;

{-----------------------------------------------------------------------------
  Procedure:   btnGuardarClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Registra los cambios de CP
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnGuardarClick(Sender: TObject);
begin
  if not (tblPendientes.Active and (not tblPendientes.IsEmpty)) then
    Exit;

  BeginTrans(true);
  try
    with tblPendientes do
    begin
      DisableControls;

      First;
      while not EoF do
      begin
//        Application.ProcessMessages;
        if (FieldByName('pc_idpreventor').AsInteger <> FieldByName('id_destino').AsInteger) then
        begin
          // [Sólo CP] ó [CP y Empresas]
          if FieldByName('criterio').AsInteger in [0, 2] then
          begin
            // Doy la baja a Preventor-CP-Provincia actual
            if not FieldByName('id_destino').IsNull then
            begin
              Verificar(not ExisteSql('SELECT 1 FROM hys.hvm_visitasmaximas '+
                                      ' WHERE vm_idpreventor = '+SqlValue(FieldByName('id_destino').AsInteger)+
                                      '   AND vm_visitasmax > 0 '),btnGuardar,'El Preventor debe tener asignado la cantidad de visitas maximas.');
            end;
            EjecutarSqlSt('UPDATE hys.hpc_preventorcpostal ' +
                          '   SET pc_fechabaja = SYSDATE, ' +
                          '       pc_usubaja = ' + SqlValue (Sesion.LoginName) +
                          ' WHERE ' +
                          iif (FieldByName('pc_idpreventor').AsInteger = 0,
                               'pc_idpreventor IS NULL ',
                               'pc_idpreventor = ' + SqlValue (FieldByName('pc_idpreventor').AsInteger)) +

                          '   AND pc_provincia = ' + SqlValue (FieldByName('pc_provincia').AsString) +

                          '   AND pc_codigo = ' + SqlValue (FieldByName('pc_codigo').AsString));

            // Inserto Preventor-CP-Provincia nuevo
            EjecutarSqlSt('INSERT INTO hys.hpc_preventorcpostal ' +
                          '     VALUES (' + iif (FieldByName('id_destino').IsNull,
                                                 'NULL',
                                                 SqlValue (FieldByName('id_destino').AsString)) + ', ' +
                                          SqlValue (FieldByName('pc_codigo').AsString) + ', ' +
                                          SqlValue (FieldByName('pc_provincia').AsString) + ', ' +
                                          SqlValue (Sesion.LoginName) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                          '               hys.seq_hpc_id.NEXTVAL)');
          end;
        end;
        // [Sólo Empresas] ó [CP y Empresas]
        if FieldByName('criterio').AsInteger in [1, 2] then
        begin
          EjecutarStoreST('art.hys.do_asignarpreventorsugerido(' + SqlValue (FieldByName('pc_codigo').AsString) + ', ' +
                                                                   SqlValue (FieldByName('pc_provincia').AsString) +
                                                                   iif(FieldByName('AplicarTodoCP').AsBoolean, ', NULL', ', ' +  FieldByName('pc_idpreventor').AsString) + ', ' +
                                                                   SqlValue(FieldByName('PisarExclusivo').AsBoolean) + ');');
        end;

        if FieldByName('criterio').AsInteger in [3] then
        begin
          if not FieldByName('id_destino').IsNull then
          begin
            Verificar(not ExisteSql('SELECT 1 FROM hys.hvm_visitasmaximas '+
                                    ' WHERE vm_idpreventor = '+SqlValue(FieldByName('id_destino').AsInteger)+
                                    '   AND vm_visitasmax > 0 '),btnGuardar,'El Preventor debe tener asignado la cantidad de visitas maximas.');
          end;
          EjecutarSqlSt('INSERT INTO hys.hpc_preventorcpostal ' +
                        '     VALUES (' + iif (FieldByName('id_destino').IsNull,
                                               'NULL',
                                               SqlValue (FieldByName('id_destino').AsString)) + ', ' +
                                        SqlValue (FieldByName('pc_codigo').AsString) + ', ' +
                                        SqlValue (FieldByName('pc_provincia').AsString) + ', ' +
                                        SqlValue (Sesion.LoginName) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                        '               hys.seq_hpc_id.NEXTVAL)');
        end;

        Next;
      end;

      EnableControls
    end;

    tblPendientes.EmptyTable;
    tblPendientes.Close;
    CommitTrans(true);
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al guardar los datos');
      Rollback;
    end;
  end
end;

{-----------------------------------------------------------------------------
  Procedure:   btnVerEstabClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Resultc:      None
  Description: Visualiza empresas correspondiente a un CP seleccionado
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnVerEstabClick(Sender: TObject);
begin
  if tblAsignados.IsEmpty then
    Exit;

  with sdqListaEmpresas do
  begin
    Close;
    ParamByName('pcpostal').Value := tblAsignados.FieldByName('pc_codigo').AsString;
    Open;

    if not IsEmpty then
    begin
      fpListaEmpresas.Width := 700;
      fpListaEmpresas.Height := 500;
      fpListaEmpresas.Caption := 'Empresas correspondientes al C.Postal ' +
                                 tblAsignados.FieldByName('pc_codigo').AsString;
      fpListaEmpresas.Showmodal
    end
  end
end;

procedure TfrmReasignacionCP.fpListaEmpresasClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqListaEmpresas.Close
end;

procedure TfrmReasignacionCP.tbSalirListaClick(Sender: TObject);
begin
  fpListaEmpresas.Close;
end;

procedure TfrmReasignacionCP.btnAsignarTodosClick(Sender: TObject);
begin
  grdAsignados.SelectAll;
  btnAsignarClick(Sender);
end;

procedure TfrmReasignacionCP.btnDesasignarTodosClick(Sender: TObject);
begin
  grdPendientes.SelectAll;
  btnDesasignarClick(Sender);
end;

{-----------------------------------------------------------------------------
  Procedure:   btnResumenClick
  Author:      racastro
  Date:        Mar-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Visualiza un resúmen de los establecimientos de un preventor
-----------------------------------------------------------------------------}
procedure TfrmReasignacionCP.btnResumenClick(Sender: TObject);
begin
  if not fraPreventorDestino.IsSelected then
    Exit;

  with sdqResumenEstablecimientos do
  begin
    Close;
    ParamByName('ppreventor').Value := fraPreventorDestino.sdqDatos.FieldByName('it_codigo').AsString;
    Open;

    if not IsEmpty then
    begin
      lblTotal.Caption := 'Total Establecimientos: ' +
                          IntToStr (ValorSqlInteger('SELECT COUNT(*) ' +
                                                    '  FROM hys.hep_estabporpreventor, afi.aem_empresa, art.ctb_tablas ' +
                                                    ' WHERE ep_fechabaja IS NULL ' +
                                                    '   AND em_cuit = ep_cuit ' +
                                                    '   AND tb_clave = ''SECT'' ' +
                                                    '   AND tb_codigo = em_sector ' +
                                                    '   AND ep_itcodigo = ' + SqlValue (fraPreventorDestino.sdqDatos.FieldByName('it_codigo').AsString)));

      fpResumenEstablecimientos.Width := 310;
      fpResumenEstablecimientos.Height := 300;
      fpResumenEstablecimientos.Caption := 'Estab. preventor ' +
                                           fraPreventorDestino.sdqDatos.FieldByName('it_codigo').AsString + ' - ' +
                                           fraPreventorDestino.Descripcion;
      fpResumenEstablecimientos.Showmodal
    end
  end
end;

procedure TfrmReasignacionCP.tbSalirResumenClick(Sender: TObject);
begin
  fpResumenEstablecimientos.Close
end;

procedure TfrmReasignacionCP.sbInfoClick(Sender: TObject);
begin
  spInfo.Visible := not spInfo.Visible;
end;

procedure TfrmReasignacionCP.spInfoClick(Sender: TObject);
begin
  spInfo.Visible := false;
end;

procedure TfrmReasignacionCP.fraLocalidadEnter(Sender: TObject);
begin
  with fraLocalidad do
  begin
    TableName := 'art.ccp_codigopostal';
    FieldID := 'cp_codigo';
    FieldCodigo := 'cp_codigo';
    FieldDesc := 'cp_localidad';
    ExtraFields := ', (select pv_descripcion from art.cpv_provincias where pv_codigo = cp_provincia) provincia, cp_provincia ';
    if fraProvincia.IsSelected then
      ExtraCondition := ' AND cp_provincia = ' + SqlValue(fraProvincia.Codigo)
    else
      ExtraCondition := '';
    CaseSensitive := false;
  end;
end;

procedure TfrmReasignacionCP.grdAsignadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not tblAsignados.FieldByName('pc_fechabaja').IsNull Then
    AFont.Color := clRed
end;

procedure TfrmReasignacionCP.fraPreventorDestinocmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorDestino.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorDestino.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorDestino.cmbDescripcion.Text := '%' + fraPreventorDestino.cmbDescripcion.Text;
  fraPreventorDestino.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorDestino.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorDestino.cmbDescripcion.Text)[1] = '%') then
      fraPreventorDestino.cmbDescripcion.Text := copy(fraPreventorDestino.cmbDescripcion.Text, 2,
                                                      length(fraPreventorDestino.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmReasignacionCP.btnABMPreventoresClick(Sender: TObject);
begin
  Abrir(TfrmAbmPreventores, frmAbmPreventores, iif (btnGuardar.Visible, tmvMDIChild, tmvNormal), frmPrincipal.mnuMantPreventores);
  frmAbmPreventores.btnAceptar.Visible := btnGuardar.Visible;
  frmAbmPreventores.btnCP.Visible := btnGuardar.Visible;
  if fraPreventorOrigen.IsSelected then
    frmAbmPreventores.fraPreventorFiltro.Value := fraPreventorOrigen.Value;

end;

procedure TfrmReasignacionCP.btnCancelarClick(Sender: TObject);
begin
  Close
end;

procedure TfrmReasignacionCP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sdqAsignados.Close;
  Action := caFree;
  frmPrincipal.mnuReasigCP.Enabled := true
end;

procedure TfrmReasignacionCP.tbRefrescarClick(Sender: TObject);
begin
  tblAsignados.EmptyTable;
  tblAsignados.Close;


  with sdqAsignados do
  begin
    Active := false;

    SQL.Clear;
    SQL.Add('SELECT   pc_codigo, pc_provincia, pc_idpreventor, ' +
            '         art.hys.get_listalocalidades(pc_codigo) cp_localidad, ' +
            '         pv_descripcion, it_nombre, it_codigo, pc_fechabaja, pc_usubaja, pc_id ' +
            '    FROM hys.hpc_preventorcpostal, art.cpv_provincias, art.pit_firmantes ' +
            '   WHERE pv_codigo = pc_provincia ' +
            '     AND it_id(+) = pc_idpreventor ');

    if fraProvincia.IsSelected then
      SQL.Add('     AND pc_provincia = ' + SqlValue(fraProvincia.Codigo));


    if fraLocalidad.IsSelected then
      SQL.Add(' AND pc_codigo = ' + SqlValue(fraLocalidad.Value) + ' AND pc_provincia = ' + SqlValue(fraLocalidad.sdqDatos.FieldByName('cp_provincia').AsString));

(*
    if fraLocalidad.IsSelected then
      SQL.Add('     AND EXISTS(SELECT 1 ' +
              '                  FROM art.ccp_codigopostal ' +
              '                 WHERE cp_codigo = pc_codigo ' +
              '                   AND pc_provincia = cp_provincia ' +
              '                   AND cp_localidad LIKE ' + SqlValue('%' + fraLocalidad.Descripcion + '%') + ') ');
*)

    if fraPreventorOrigen.IsSelected then
      SQL.Add('     AND pc_idpreventor = ' + SqlValue(fraPreventorOrigen.Codigo));

    if Trim (edCP.Text) <> '' then
      SQL.Add('     AND pc_codigo = ' + SqlValue(Trim (edCP.Text)));

    if not chbIncluirBajas.Checked then
      SQL.Add('     AND pc_fechabaja IS NULL ');

    if chkSinPreventor.Checked then
      SQL.Add('     AND it_id IS NULL ');

    if fraDepart.IsSelected then
      SQL.Add(' AND art.utiles.get_partido(pc_codigo, pc_provincia) = ' +
              SqlValue(fraDepart.cmbDescripcion.Text));


    SQL.Add('ORDER BY pc_codigo, pc_fechabaja');

    Active := true
  end;

  // Genero tabla en memoria de asignados
  tblAsignados.Open;

  while not sdqAsignados.EoF do
  begin
    tblAsignados.AppendRecord (
      [sdqAsignados.FieldByName('pc_codigo').AsString,
       sdqAsignados.FieldByName('pc_provincia').AsString,
       sdqAsignados.FieldByName('pc_idpreventor').AsInteger,
       sdqAsignados.FieldByName('cp_localidad').AsString,
       sdqAsignados.FieldByName('pv_descripcion').AsString,
       sdqAsignados.FieldByName('it_nombre').AsString,
       sdqAsignados.FieldByName('it_codigo').AsString,
       iif(not sdqAsignados.FieldByName('pc_fechabaja').isNull, sdqAsignados.FieldByName('pc_fechabaja').AsDateTime, null),
       sdqAsignados.FieldByName('pc_usubaja').AsString,
       sdqAsignados.FieldByName('pc_id').AsInteger]
    );

    sdqAsignados.Next
  end;
  tblAsignados.First;

  if not tblPendientes.Active then
    tblPendientes.Open;

  
end;

procedure TfrmReasignacionCP.tbLimpiarClick(Sender: TObject);
begin
  fraProvincia.Clear;
  fraLocalidad.Clear;
  fraPreventorOrigen.Clear;
  edCP.Clear;
  fraDepart.Clear;
  sdqAsignados.Close;
  tblAsignados.EmptyTable;
  tblAsignados.Close;
  rgCriterio.ItemIndex := -1;
  cbAplicarTodoCP.Checked := False;
  chbIncluirBajas.Checked := False;
end;

procedure TfrmReasignacionCP.tbNuevoClick(Sender: TObject);
begin
  fraPreventorAbm.Clear;
  fraCodigoPostalAbm.Clear;
  fraProvinciaAbm.Clear;
//  chkSegunPerfil.Checked := true;
  fpAltaCP.ShowModal;
end;

procedure TfrmReasignacionCP.btnAceptarCambioPreventorClick(
  Sender: TObject);
begin
  Verificar(not fraPreventorAbm.IsSelected, fraPreventorAbm.cmbDescripcion, 'Debe seleccionar un preventor.');
  Verificar(not fraCodigoPostalAbm.IsSelected, fraCodigoPostalAbm.cmbDescripcion, 'Debe seleccionar el Código Postal.');
  Verificar(not fraProvinciaAbm.IsSelected, fraProvinciaAbm.cmbDescripcion, 'Debe seleccionar la provincia.');
  Verificar(ExisteSql(' SELECT 1 FROM hys.hpc_preventorcpostal WHERE pc_codigo = ' + SqlValue(fraCodigoPostalAbm.Codigo) +
                      ' AND pc_provincia = ' + SqlValue (fraProvinciaAbm.Value) + ' AND pc_idpreventor = ' + SqlValue(fraPreventorAbm.value) +
                      ' AND PC_FECHABAJA IS NULL '), fraPreventorAbm.cmbDescripcion, 'Este preventor ya tiene esta asignación.');
  Verificar(not ExisteSql('SELECT 1 FROM hys.hvm_visitasmaximas '+
                          ' WHERE vm_idpreventor = '+SqlValue(fraPreventorAbm.value)+
                          '   AND vm_visitasmax > 0 '),btnAceptarCambioPreventor,'El Preventor debe tener asignado la cantidad de visitas maximas.');
  BeginTrans(true);
  try
    // Inserto Preventor-CP-Provincia nuevo


    EjecutarSqlSt('INSERT INTO hys.hpc_preventorcpostal ' +
                  '     VALUES (' + SqlValue(fraPreventorAbm.value) + ', ' +
                                    SqlValue (fraCodigoPostalAbm.Codigo) + ', ' +
                                    SqlValue (fraProvinciaAbm.Value) + ', ' +
                                    SqlValue (Sesion.LoginName) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                  '                 hys.seq_hpc_id.NEXTVAL)');


    if chkSegunPerfil.Checked then
      EjecutarStoreST('art.hys.do_asignarpreventorsugerido(' + SqlValue (fraCodigoPostalAbm.Codigo) + ', ' + SqlValue (fraProvinciaAbm.Value) + ');');

    CommitTrans(true);
    fpAltaCP.ModalResult := mrOk;
    if tblAsignados.Active then
      tbRefrescar.Click;
  except
    on E: Exception do begin
       Rollback(true);
       ErrorMsg(E, 'Error la nueva asignación.');
    end;
  end;
end;

procedure TfrmReasignacionCP.fraPreventorAbmcmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorAbm.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorAbm.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorAbm.cmbDescripcion.Text := '%' + fraPreventorAbm.cmbDescripcion.Text;
  fraPreventorAbm.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorAbm.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorAbm.cmbDescripcion.Text)[1] = '%') then
      fraPreventorAbm.cmbDescripcion.Text := copy(fraPreventorAbm.cmbDescripcion.Text, 2,
                                                      length(fraPreventorAbm.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmReasignacionCP.fraCodigoPostalAbmChange(Sender: TObject);
begin
  fraProvinciaAbm.Codigo := fraCodigoPostalAbm.sdqDatos.fieldbyname('cp_provincia').AsString;
end;

procedure TfrmReasignacionCP.fraProvinciaAbmChange(Sender: TObject);
begin
  fraCodigoPostalAbm.ExtraCondition := '';
  if fraProvinciaAbm.IsSelected then
    fraCodigoPostalAbm.ExtraCondition := fraCodigoPostalAbm.ExtraCondition + ' and cp_provincia = ' + SqlValue(fraProvinciaAbm.Codigo);
end;

procedure TfrmReasignacionCP.fraCodigoPostalAbmcmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraCodigoPostalAbm.cmbDescripcion.Text) <> '') and
     (trim(fraCodigoPostalAbm.cmbDescripcion.Text)[1] <> '%') then
      fraCodigoPostalAbm.cmbDescripcion.Text := '%' + fraCodigoPostalAbm.cmbDescripcion.Text;
  fraCodigoPostalAbm.cmbDescripcionDropDown(Sender);
  if (trim(fraCodigoPostalAbm.cmbDescripcion.Text) <> '') and
     (trim(fraCodigoPostalAbm.cmbDescripcion.Text)[1] = '%') then
      fraCodigoPostalAbm.cmbDescripcion.Text := copy(fraCodigoPostalAbm.cmbDescripcion.Text, 2, length(fraCodigoPostalAbm.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmReasignacionCP.tbEliminarClick(Sender: TObject);
begin
  if tblAsignados.Active and not tblAsignados.IsEmpty then
    if (MsgBox('¿Desea eliminar la asignación?',  MB_ICONQUESTION + MB_YESNO, 'Eliminar asignación') = IDYES) then
    begin
      EjecutarSql(' update hys.hpc_preventorcpostal ' +
                  ' set pc_fechabaja = sysdate , ' +
                  ' pc_usubaja = ' + SqlValue(sesion.LoginName) +
                  ' where pc_id = ' + SqlValue(tblAsignados.fieldbyname('pc_id').AsString));
      tbRefrescar.Click;
    end;
end;

procedure TfrmReasignacionCP.tbAsigMasivasClick(Sender: TObject);
begin
  pnlAsignacion.Visible := tbAsigMasivas.Down;
end;

procedure TfrmReasignacionCP.FormShow(Sender: TObject);
begin
  tbAsigMasivas.Click;
end;

procedure TfrmReasignacionCP.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReasignacionCP.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDPreventor := tblAsignados.FieldByName('pc_idpreventor').AsInteger;
end;

procedure TfrmReasignacionCP.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
begin
  if sdqAsignados.Active and (not sdqAsignados.IsEmpty) then begin
     tbExportar.Enabled := False;
     Try
       AutoCols := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialog.Fields.Assign( grdAsignados.Columns );

         ExportDialog.Execute ;
       finally
         if AutoCols Then
            ExportDialog.Fields.Clear ;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;

procedure TfrmReasignacionCP.fraDepartcmbDescripcionChange(Sender:
    TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
end;

procedure TfrmReasignacionCP.fraDepartcmbDescripcionExit(Sender:
    TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
end;


procedure TfrmReasignacionCP.fraProvinciaChange(Sender: TObject);
begin
  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL ' +
            iif(fraProvincia.IsSelected, ' AND cp_provincia = ' + SqlValue(fraProvincia.Codigo), '') + ') depto WHERE 1=1';
  end;
end;

end.



