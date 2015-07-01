{-----------------------------------------------------------------------------
 Unit Name: unEstabSinAsignar
 Author:    racastro
 Date:      10-Abr-2007
 Purpose:   Módulo de asignación de establecimientos sin preventores
 History:
-----------------------------------------------------------------------------}

unit unEstabSinAsignar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, General, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, SortDlg, artSeguridad, QueryPrint, QueryToFile, ExportDialog, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql,
  unfraLocalidad, unfraLocalidadEx, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, Buttons, unfraCtbTablas, unPrincipal, Strfuncs, unDmPrincipal, unSesion, CustomDlgs,
  SqlFuncs, unManPreventores, ExComboBox;

type
  TfrmEstabSinAsignar = class(TfrmCustomGridABM)
    fraEmpresaFiltro: TfraEmpresa;
    fraProvincia: TfraCodigoDescripcionExt;
    Label1: TLabel;
    fraLocalidad: TfraCodigoDescripcionExt;
    Label2: TLabel;
    fraPreventor: TfraCodigoDescripcionExt;
    btnABMPreventores: TSpeedButton;
    Label3: TLabel;
    Label15: TLabel;
    fraTipo: TfraCtbTablas;
    chkEsReferente: TCheckBox;
    Label4: TLabel;
    cmbActividad: TExComboBox;
    cbSegunPerfil: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EDCAPITAS: TEdit;
    EDSECTOR: TEdit;
    tbAplicarSugerido: TToolButton;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraProvinciacmbDescripcionDropDown(Sender: TObject);
    procedure fraLocalidadcmbDescripcionDropDown(Sender: TObject);
    procedure fraLocalidadEnter(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure btnABMPreventoresClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure cbSegunPerfilClick(Sender: TObject);
    procedure tbAplicarSugeridoClick(Sender: TObject);
  protected
    FAplicarSugerido: Boolean;

    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmEstabSinAsignar: TfrmEstabSinAsignar;
  
implementation

{$R *.dfm}

{-----------------------------------------------------------------------------
  Procedure:   ClearControls
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   None
  Result:      None
  Description: Limpia los datos
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.ClearControls;
begin
  fraPreventor.Clear;
  fraTipo.Limpiar;
  edCapitas.Clear;
  edSector.Clear;
  cmbActividad.ItemIndex := -1;
  chkEsReferente.Checked := false;
end;
{-----------------------------------------------------------------------------
  Procedure:   DoABM
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   None
  Result:      Boolean
  Description: Ejecuta la asignación del preventor y actualiza
               HYS.HEP_ESTABPORPREVENTOR con los datos asociados
-----------------------------------------------------------------------------}
function TfrmEstabSinAsignar.DoABM: Boolean;
var
  s: Integer;
  FCUIT,
  FCodPreventor: String;
  FEstableci: Integer;
begin
  Result := False;

  with Grid, DataSource, DataSet do
  begin
    DisableControls;

    for s := 0 to SelectedRows.Count - 1 do
    begin
      GotoBookmark(pointer(SelectedRows.Items[s]));

      if FAplicarSugerido then
      begin
        fraTipo.Codigo     := sdqConsulta.FieldByname('tipo').AsString;
        cmbActividad.Value := sdqConsulta.FieldByname('actividad').AsString;
        FCodPreventor      := sdqConsulta.FieldByname('it_codigo').AsString
      end
      else
        FCodPreventor := fraPreventor.Codigo;

      if FCodPreventor <> '' then
      begin
        FCUIT      := FieldByname('em_cuit').AsString;
        FEstableci := FieldByname('es_nroestableci').AsInteger;

        Sql.Clear;
        Sql.PrimaryKey.Add('AP_ID', FieldByName('AP_ID').AsInteger);
        Sql.Fields.Add('AP_FECHAASIGNACION', exDateTime);
        Sql.Fields.Add('AP_USUASIGNACION', Sesion.LoginName);

        if ExisteSql('SELECT 1' +
                      ' FROM HYS.HEP_ESTABPORPREVENTOR' +
                     ' WHERE EP_CUIT = ' + SqlValue(FCUIT) +
                       ' AND EP_ESTABLECI = ' + SqlValue(FEstableci)) then
          EjecutarSqlST('UPDATE HYS.HEP_ESTABPORPREVENTOR' +
                          ' SET EP_TIPO = ' + SqlValue(fraTipo.Value) +  ',' +
                              ' EP_ACTIVIDAD = ' + SqlValue(cmbActividad.Value) + ',' +
                              ' EP_ITCODIGO = ' + SqlValue (FCodPreventor) + ',' +
                              ' EP_USUMODIF = ' + SqlValue(Sesion.LoginName) +  ',' +
                              ' EP_FECHAMODIF = SYSDATE,' +
                              ' EP_USUBAJA = NULL,' +
                              ' EP_FECHABAJA = NULL' +
                        ' WHERE EP_CUIT = ' + SqlValue(FCUIT) +
                          ' AND EP_ESTABLECI = ' + SqlValue(FEstableci))
        else
          EjecutarSqlST('INSERT INTO HYS.HEP_ESTABPORPREVENTOR(EP_CUIT, EP_ESTABLECI, EP_TIPO, EP_ACTIVIDAD,' +
                                   ' EP_ITCODIGO, EP_FECHAALTA, EP_USUALTA)' +
                       ' VALUES( ' + SqlValue(FCUIT) + ', ' +
                                     SqlValue(FEstableci) + ', ' +
                                     SqlValue(fraTipo.Value) + ', ' +
                                     SqlValue(cmbActividad.Value) + ', ' +
                                     SqlValue (FCodPreventor) + ', SYSDATE, ' +
                                     SqlValue(Sesion.LoginName) + ')');

        if chkEsReferente.Checked then
        begin
          if ExisteSql('SELECT 1' +
                        ' FROM afi.apc_preventorcontrato' +
                       ' WHERE pc_contrato = art.afiliacion.get_ultcontrato(' + SqlValue(FCUIT)  + ')' +
                         ' AND (pc_fecha_hasta >= SYSDATE OR pc_fecha_hasta IS NULL)') then
            EjecutarSqlST('UPDATE afi.apc_preventorcontrato' +
                            ' SET pc_fecha_hasta= SYSDATE-0.00001,' +
                                ' pc_usumodif = ' +  SqlValue(Sesion.LoginName) + ',' +
                                ' pc_fechamodif = SYSDATE' +
                          ' WHERE pc_contrato = art.afiliacion.get_ultcontrato(' + SqlValue(FCUIT)  + ')' +
                            ' AND (pc_fecha_hasta >= SYSDATE OR pc_fecha_hasta IS NULL)');

          EjecutarSqlST('INSERT INTO afi.apc_preventorcontrato( ' +
                        '       pc_id, pc_contrato, pc_codigopreventor, pc_fecha_desde, ' +
                        '       pc_fecha_hasta, pc_usualta, pc_fechaalta) ' +
                        'VALUES(afi.seq_apc_id.nextval, ' +
                        '       art.afiliacion.get_ultcontrato(' + SqlValue(FCUIT)  + '), ' +
                                SqlValue(FCodPreventor) + ', SYSDATE, NULL, ' +
                                SqlValue(Sesion.LoginName) + ', SYSDATE)');
        end;

        Result := inherited DoABM;
      end
    end;

    EnableControls;
    UnselectAll;
    FAplicarSugerido := False;
    chkEsReferente.Checked := false;

    Refresh
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   LoadControls
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   None
  Result:      None
  Description: Carga los datos
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.LoadControls;
begin
  ClearControls;

  fraTipo.Codigo     := sdqConsulta.FieldByname('tipo').AsString;
  cmbActividad.Value := sdqConsulta.FieldByname('actividad').AsString;
  edCapitas.Text     := sdqConsulta.FieldByname('capitas').AsString;
  edSector.Text      := sdqConsulta.FieldByname('sector').AsString;
end;
{-----------------------------------------------------------------------------
  Procedure:   Validar
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   None
  Result:      Boolean
  Description: Valida los datos ingresados
-----------------------------------------------------------------------------}
function TfrmEstabSinAsignar.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Asignación de empresas',
                     fraPreventor,
                     fraPreventor.IsSelected,
                     'Debe indicarse el preventor.',
                     fraTipo,
                     fraTipo.IsSelected,
                     'Debe indicarse el tipo de empresa.',
                     cmbActividad,
                     cmbActividad.ItemIndex >= 0,
                     'Debe indicarse la actividad.'
                    ]);
end;
{-----------------------------------------------------------------------------
  Procedure:   FormCreate
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Creación del form
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hap_estabasigpendiente';
  CheckPK := True;

  with fraProvincia do
  begin
    TableName := 'art.cpv_provincias';
    FieldDesc := 'pv_descripcion';
    FieldID := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    CaseSensitive := False;
  end;

  fraTipo.Clave := 'TFET';
  chkEsReferente.Checked := False;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbRefrescarClick
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Actualiza la grilla en base a los filtros indicados
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;

  sdqConsulta.SQL.Add(' SELECT  ap_id, ap_idempresa, ap_idestableci, em_cuit, em_nombre, es_nroestableci, es_nombre, es_cpostal, es_provincia,     ' +
                      '        pv_descripcion, em_sector, NVL(es_eventual, ''N'') es_eventual, tb_descripcion sector, rc_empleados capitas, ' +
                      '        NVL(art.hys.get_tipo_empresa(em_cuit, es_nroestableci), ''GB'') tipo, ' +
                      '        DECODE(NVL(es_eventual, ''N''), ''S'', ''C'', art.hys.getactividadestablecimiento(em_cuit, es_nroestableci)) actividad, ' +
                      '        (SELECT it_nombre ' +
                      '           FROM art.pit_firmantes ' +
                      '          WHERE it_fechabaja IS NULL ' +
                      '            AND (SELECT COUNT(*) ' +
                      '                   FROM hys.hpc_preventorcpostal ' +
                      '                  WHERE pc_fechabaja IS NULL ' +
                      '                    AND pc_codigo = es_cpostal ' +
                      '                    AND pc_provincia = es_provincia) = 1 ' +
                      '            AND it_id IN(SELECT pc_idpreventor ' +
                      '                           FROM hys.hpc_preventorcpostal ' +
                      '                          WHERE pc_fechabaja IS NULL ' +
                      '                            AND pc_codigo = es_cpostal ' +
                      '                            AND pc_provincia = es_provincia) ' +
                      '            AND art.hys.existe_perfil_preventor(it_id, NVL(art.hys.get_tipo_empresa(em_cuit, es_nroestableci), ''GB''), ' +
                      '                                                DECODE(NVL(es_eventual, ''N''), ' +
                      '                                                       ''S'', ''C'', ' +
                      '                                                       art.hys.getactividadestablecimiento(em_cuit, es_nroestableci)), ' +
                      '                                                em_sector, rc_empleados) = ''S'') it_nombre, ' +
                      '        (SELECT it_codigo ' +
                      '           FROM art.pit_firmantes ' +
                      '          WHERE it_fechabaja IS NULL ' +
                      '            AND (SELECT COUNT(*) ' +
                      '                   FROM hys.hpc_preventorcpostal ' +
                      '                  WHERE pc_fechabaja IS NULL ' +
                      '                    AND pc_codigo = es_cpostal ' +
                      '                    AND pc_provincia = es_provincia) = 1 ' +
                      '            AND it_id IN(SELECT pc_idpreventor ' +
                      '                           FROM hys.hpc_preventorcpostal ' +
                      '                          WHERE pc_fechabaja IS NULL ' +
                      '                            AND pc_codigo = es_cpostal ' +
                      '                            AND pc_provincia = es_provincia) ' +
                      '            AND art.hys.existe_perfil_preventor(it_id, NVL(art.hys.get_tipo_empresa(em_cuit, es_nroestableci), ''GB''), ' +
                      '                                                DECODE(NVL(es_eventual, ''N''), ' +
                      '                                                       ''S'', ''C'', ' +
                      '                                                       art.hys.getactividadestablecimiento(em_cuit, es_nroestableci)), ' +
                      '                                                em_sector, rc_empleados) = ''S'') it_codigo ' +
                      '   FROM hys.hap_estabasigpendiente  ' +
                      '        INNER JOIN afi.aem_empresa ON em_id = ap_idempresa ' +
                      '        INNER JOIN afi.aco_contrato ON co_idempresa = em_id ' +
                      '        INNER JOIN afi.aes_establecimiento ON es_id = ap_idestableci ' +
                      '        INNER JOIN art.ctb_tablas ON tb_clave = ''SECT'' ' +
                      '                                AND tb_codigo = em_sector ' +
                      '        INNER JOIN art.cpv_provincias ON pv_codigo = es_provincia ' +
                      '        LEFT JOIN cob.zrc_resumencobranza ON rc_contrato = co_contrato ' +
                      '                                        AND rc_periodo = art.cobranza.get_ultperiododevengado(''E'') ' +
                      '  WHERE ap_fechaasignacion IS NULL ' +
                      '    AND co_contrato = art.afiliacion.get_contratovigente(em_cuit, SYSDATE) ');


  if fraEmpresaFiltro.IsSelected then
    sdqConsulta.SQL.Add('   AND em_cuit = ' + SqlValue (fraEmpresaFiltro.CUIT));

  if fraLocalidad.IsSelected then
    sdqConsulta.SQL.Add('   AND es_cpostal = ' + SqlValue(fraLocalidad.Codigo));

  if fraProvincia.IsSelected then
    sdqConsulta.SQL.Add('   AND es_provincia = ' + SqlValue(fraProvincia.Codigo));

  inherited;
end;
{-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.fraProvinciacmbDescripcionDropDown(Sender: TObject);
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
{-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.fraLocalidadcmbDescripcionDropDown(Sender: TObject);
begin
  if (trim(fraLocalidad.cmbDescripcion.Text) <> '') and
     (trim(fraLocalidad.cmbDescripcion.Text)[1] <> '%') then
      fraLocalidad.cmbDescripcion.Text := '%' + fraLocalidad.cmbDescripcion.Text;
  fraLocalidad.cmbDescripcionDropDown(Sender);
  if (trim(fraLocalidad.cmbDescripcion.Text) <> '') and
     (trim(fraLocalidad.cmbDescripcion.Text)[1] = '%') then
      fraLocalidad.cmbDescripcion.Text := copy(fraLocalidad.cmbDescripcion.Text, 2,
                                               length(fraLocalidad.cmbDescripcion.Text));
  inherited;
end;
{-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.fraPreventorcmbDescripcionDropDown(Sender: TObject);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
      fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text := copy(fraPreventor.cmbDescripcion.Text, 2,
                                               length(fraPreventor.cmbDescripcion.Text));
  inherited;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbLimpiarClick
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Limpia los filtros
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.tbLimpiarClick(Sender: TObject);
begin
  fraProvincia.Clear;
  fraLocalidad.Clear;
  fraEmpresaFiltro.Clear;
end;
{-----------------------------------------------------------------------------
  Procedure:   fraLocalidadEnter
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Define el frame de localidades
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.fraLocalidadEnter(Sender: TObject);
begin
  with fraLocalidad do
  begin
    TableName := 'art.ccp_codigopostal';
    FieldID := 'cp_codigo';
    FieldCodigo := 'cp_codigo';
    FieldDesc := 'cp_localidad';
    ExtraFields := ', (SELECT pv_descripcion FROM art.cpv_provincias WHERE pv_codigo = cp_provincia) provincia ';
    if fraProvincia.IsSelected then
      ExtraCondition := ' AND cp_provincia = ' + SqlValue(fraProvincia.Codigo)
    else
      ExtraCondition := '';

    CaseSensitive := false;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute
end;
{-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.btnABMPreventoresClick(Sender: TObject);
begin
  Abrir(TfrmAbmPreventores, frmAbmPreventores, tmvNormal, frmPrincipal.mnuMantPreventores);
  if fraPreventor.IsSelected then
    frmAbmPreventores.fraPreventorFiltro.Value := fraPreventor.Value;
end;

procedure TfrmEstabSinAsignar.fpAbmShow(Sender: TObject);
begin
  FAplicarSugerido := false;
  cbSegunPerfil.Checked := sdqConsulta.FieldByname('it_codigo').AsString <> '';
  cbSegunPerfilClick(Sender);

  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure:   cbSegunPerfilClick
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Define el frame de preventores en base a la opción de aplicar o
               no el perfil de los preventores
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.cbSegunPerfilClick(Sender: TObject);
begin
  with fraPreventor do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_codigo';
    FieldBaja := 'it_fechabaja';
    if cbSegunPerfil.Checked then
      ExtraCondition := ' AND EXISTS(SELECT 1 ' +
                        '              FROM hys.hpc_preventorcpostal ' +
                        '             WHERE pc_fechabaja IS NULL ' +
                        '               AND pc_idpreventor = it_id ' +
                        '               AND pc_codigo = ' + SqlValue(sdqConsulta.FieldByname ('es_cpostal').AsInteger) +
                        '               AND pc_provincia = ' + SqlValue (sdqConsulta.FieldByname ('es_provincia').AsInteger) + ')' +
                        ' AND art.hys.existe_perfil_preventor(it_id, ' +
                                                              SqlValue (fraTipo.Codigo) + ', ' +
                                                              SqlValue (cmbActividad.Value) + ', ' +
                                                              SqlInt (sdqConsulta.FieldByname ('em_sector').AsInteger) + ', ' +
                                                              edCapitas.Text + ' ) = ''S'' '
    else
      ExtraCondition := '';

    CaseSensitive := false;
    ShowBajas := false;
  end;

  fraPreventor.Codigo := sdqConsulta.FieldByname ('it_codigo').AsString;
end;

{-----------------------------------------------------------------------------
  Procedure:   tbAplicarSugeridoClick
  Author:      racastro
  Date:        10-Abr-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Ejecuta el ABM con los datos por defecto
-----------------------------------------------------------------------------}
procedure TfrmEstabSinAsignar.tbAplicarSugeridoClick(Sender: TObject);
begin
  FAplicarSugerido := True;
  DoABM
end;

end.
