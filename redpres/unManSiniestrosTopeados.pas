unit unManSiniestrosTopeados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  SinEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  unfraDelegacion, unFraCodigoDescripcion, unFraGrupoTrabajo, VCLExtra,
  PatternEdit, IntEdit;

type
  TfrmManSiniestrosTopeados = class(TfrmCustomGridABM)
    dFechaTope2: TDateComboBox;
    lblFechaTope2: TLabel;
    grpSiniestro: TGroupBox;
    SinEdit: TSinEdit;
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbFechaTope2: TGroupBox;
    dFechaTope2_Desde: TDateComboBox;
    gbFechaTope1: TGroupBox;
    dFechaTope1_Desde: TDateComboBox;
    gbFechaLiberacion: TGroupBox;
    dFechaLiberacion_Desde: TDateComboBox;
    dFechaTope1_Hasta: TDateComboBox;
    lblFTope1: TLabel;
    dFechaLiberacion_Hasta: TDateComboBox;
    Label3: TLabel;
    dFechaTope2_Hasta: TDateComboBox;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    GroupBox4: TGroupBox;
    fraDelegacion: TfraDelegacion;
    gbTopeado: TGroupBox;
    rbTopeadoSi: TRadioButton;
    rbTopeadoNo: TRadioButton;
    rbTopeadoTodos: TRadioButton;
    gbTopeadoPor: TGroupBox;
    rbTopeadoPorCie10: TRadioButton;
    rbTopeadoPorAutorizacion: TRadioButton;
    rbTopeadoPorTraslados: TRadioButton;
    rbTopeadoPorFKT: TRadioButton;
    lblCantidad2doTope: TLabel;
    edCant2doTope: TIntEdit;
    rgJustificacionPendiente: TRadioGroup;
    gbUsuariosPorPrest: TGroupBox;
    fraUsuariosPorPrest: TfraCodigoDescripcion;
    cbPrestSinAsignar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure rbTopeadoPorCie10Click(Sender: TObject);
    procedure rbTopeadoPorAutorizacionClick(Sender: TObject);
    procedure Do_CheckTopeadoPor;
    procedure rbTopeadoPorTrasladosClick(Sender: TObject);
    procedure cbPrestSinAsignarClick(Sender: TObject);

  private
    { Private declarations }
    procedure Do_LimpiarFechas;
  public
    { Public declarations }
  end;

var
  frmManSiniestrosTopeados: TfrmManSiniestrosTopeados;

implementation

uses unPrincipal, sqlFuncs, CustomDlgs, AnsiSql, unSiniestros, General;

{$R *.dfm}

procedure TfrmManSiniestrosTopeados.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'sin.sst_siniestrostopeados';
  FieldBaja     := 'ST_FECHABAJA';
  rbTopeadoTodos.Checked := True;
  rbTopeadoPorCie10.checked := True;

  with fraUsuariosPorPrest do      // TK 56025
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

  Do_CheckTopeadoPor;
end;

procedure TfrmManSiniestrosTopeados.ClearControls;
begin
  inherited;
  dFechaTope2.Clear;
  edCant2doTope.Clear;
end;

function TfrmManSiniestrosTopeados.DoABM: Boolean;
begin
  sql.Clear;
  case ModoABM of
    maModificacion:
    begin
      Sql.PrimaryKey.Add('ST_ID', sdqConsulta.FieldByName('ST_ID').AsString);

      if (rbTopeadoPorCie10.Checked or rbTopeadoPorAutorizacion.Checked) then
        Sql.Fields.Add('ST_FECHATOPE2', dFechaTope2.Date)
      else if (rbTopeadoPorTraslados.Checked or rbTopeadoPorFKT.Checked) then
        Sql.Fields.Add('ST_CANTIDADTOPE2', edCant2doTope.Value);

      Sql.Fields.Add('ST_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ST_FECHAMODIF', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSiniestrosTopeados.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  SinEdit.Clear;
  dFechaTope2_Desde.clear;
  dFechaTope2_Hasta.clear;
  dFechaTope1_Desde.clear;
  dFechaTope1_Hasta.clear;
  dFechaLiberacion_Desde.Clear;
  dFechaLiberacion_Hasta.Clear;
  fraEmpresa.Clear;
  fraGrupoTrabajo.Clear;
  fraDelegacion.Clear;
  rgJustificacionPendiente.ItemIndex := 2;
  fraUsuariosPorPrest.Clear;
end;

procedure TfrmManSiniestrosTopeados.tbRefrescarClick(Sender: TObject);
var sSql, sTipoTope: string;
begin
  if rbTopeadoPorCie10.Checked then      // Tipo de Topeo. Por los nuevos topes por Autorizacion
    sTipoTope := 'C'
  else if rbTopeadoPorAutorizacion.Checked then
    sTipoTope := 'A'
  else if rbTopeadoPorTraslados.Checked then
    sTipoTope := 'T'
  else if rbTopeadoPorFKT.Checked then
    sTipoTope := 'F';

  sSql := ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' art.utiles.armar_cuit(ex_cuil) cuil, tj_nombre trabajador, ' +
                 ' art.utiles.armar_cuit(ex_cuit) cuit, em_nombre empresa, ' +
                 ' dg_codigo codcie10, dg_descripcion descripcioncie10, ' +
                 ' st_usualta, st_fechaalta, gp_nombre GTrabajo, ' +
                 ' st_fechatope1, st_fechalibera, st_fechatope2, st_fechabaja, st_id, el_nombre, ex_gestor, ' +
                 ' st_cantidadtope1, st_cantidadtope2, ' +   // por tope de siniestros de traslados y FKT
                 ' (SELECT a.au_turno - a.au_fechapro ' +
                    ' FROM art.sau_autorizaciones a, art.mpr_prestaciones b ' +
                   ' WHERE NVL(a.au_presapro, a.au_pressol) = b.pr_codigo ' +
                     ' AND a.au_idexpediente = ex_id ' +
                     ' AND b.pr_topeasiniestro = ''S'' ' +
                     ' AND st_tipotopeo = ''A'' ' +
                     ' AND a.au_turno IS NOT NULL ' +
                     ' AND a.au_estado IN(''A'', ''E'', ''P'', ''L'') ' +
                     ' AND a.au_accionauditoria = ''A'' ' +
                     ' AND a.au_numauto = (SELECT MAX(c.au_numauto) ' +
                                           ' FROM art.sau_autorizaciones c, art.mpr_prestaciones d ' +
                                          ' WHERE NVL(c.au_presapro, c.au_pressol) = d.pr_codigo ' +
                                            ' AND c.au_idexpediente = a.au_idexpediente ' +
                                            ' AND d.pr_topeasiniestro = ''S'' ' +
                                            ' AND c.au_estado IN(''A'', ''E'', ''P'', ''L'') ' +
                                            ' AND c.au_accionauditoria = ''A'' ' +
                                            ' AND c.au_turno IS NOT NULL)) DiasAproTurno, ' +
                 ' (SELECT ca_descripcion ' +
                    ' FROM art.sau_autorizaciones a, art.mpr_prestaciones b, art.cpr_prestador ' +
                   ' WHERE NVL(a.au_presapro, a.au_pressol) = b.pr_codigo ' +
                     ' AND NVL(a.au_identifapro, a.au_identifprestador) = ca_identificador ' +
                     ' AND a.au_idexpediente = ex_id ' +
                     ' AND b.pr_topeasiniestro = ''S'' ' +
                     ' AND a.au_turno IS NOT NULL ' +
                     ' AND st_tipotopeo = ''A'' ' +
                     ' AND a.au_estado IN(''A'', ''E'', ''P'', ''L'') ' +
                     ' AND a.au_accionauditoria = ''A'' ' +
                     ' AND a.au_numauto = (SELECT MAX(c.au_numauto) ' +
                                           ' FROM art.sau_autorizaciones c, art.mpr_prestaciones d ' +
                                          ' WHERE NVL(c.au_presapro, c.au_pressol) = d.pr_codigo ' +
                                            ' AND c.au_idexpediente = a.au_idexpediente ' +
                                            ' AND d.pr_topeasiniestro = ''S'' ' +
                                            ' AND c.au_estado IN(''A'', ''E'', ''P'', ''L'') ' +
                                            ' AND c.au_accionauditoria = ''A'' ' +
                                            ' AND c.au_turno IS NOT NULL)) PrestadorAutorizacion,  ' +
                 ' (SELECT pu_usuario ' +
                    ' FROM ART.cpu_prestadorusuario ' +
                   ' WHERE pu_idprestador = ex_prestador ' +
                     ' AND pu_fechabaja is null) UsuarioPorPrestador, ' +
                 ' art.siniestro.get_cantidadfkttope(ex_id) fktcargadas, ' +
                 ' art.siniestro.get_cantidadtrasladostope(ex_id) trascargados ' +

            ' FROM art.sex_expedientes, ctj_trabajador, aem_empresa, sin.sst_siniestrostopeados, cdg_diagnostico, ' +
                 ' art.del_delegacion, art.mgp_gtrabajo  ' +
           ' WHERE ex_idtrabajador = tj_id ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ex_id = st_idexpediente ' +
             ' AND ex_diagnosticooms = dg_codigo(+) ' +
             ' AND ex_delegacion = el_id(+) ' +
             ' AND gp_codigo(+) = ex_gtrabajo ' +
             ' AND st_fechabaja IS NULL ' +
             ' AND st_tipotopeo = ' + SqlValue(sTipoTope);       // Tipo de topeo por CIE-10 (el primero)

  if not SinEdit.IsEmpty then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                   ' AND ex_orden = '     + SqlInt(SinEdit.Orden) +
                   ' AND ex_recaida = '   + SqlInt(SinEdit.Recaida);

  if not dFechaTope1_Desde.IsEmpty then
    sSql := sSql + ' AND st_fechatope1 >= ' + SqlDate(dFechaTope1_Desde.Date);

  if not dFechaTope1_Hasta.IsEmpty then
    sSql := sSql + ' AND st_fechatope1 <= ' + SqlDate(dFechaTope1_Hasta.Date);


  if not dFechaLiberacion_Desde.IsEmpty then
    sSql := sSql + ' AND st_fechalibera >= ' + SqlDate(dFechaLiberacion_Desde.Date);

  if not dFechaLiberacion_Hasta.IsEmpty then
    sSql := sSql + ' AND st_fechalibera <= ' + SqlDate(dFechaLiberacion_Hasta.Date);


  if not dFechaTope2_Desde.IsEmpty then
    sSql := sSql + ' AND st_fechatope2 >= ' + SqlDate(dFechaTope2_Desde.Date);

  if not dFechaTope2_Hasta.IsEmpty then
    sSql := sSql + ' AND st_fechatope2 <= ' + SqlDate(dFechaTope2_Hasta.Date);


  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if not fraDelegacion.IsEmpty then
    sSql := sSql + ' AND ex_delegacion = ' + SqlInt(fraDelegacion.ID);

  if not fraGrupoTrabajo.IsEmpty then
  begin
    sSql := sSql + ' AND ex_gtrabajo = ' + SqlValue(fraGrupoTrabajo.Value);
    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
      sSql := sSql + ' AND ex_gestor = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  if rbTopeadoSi.Checked then
    if (rbTopeadoPorCie10.Checked or rbTopeadoPorAutorizacion.Checked) then
      sSql := sSql + ' AND (ART.SINIESTRO.GET_SINIESTROTOPEADO(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') IS NOT NULL) ' +
                     ' AND (ART.SINIESTRO.GET_SINIESTROTOPEADO(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') < ART.ACTUALDATE) '
    else
      sSql := sSql + ' AND (ART.SINIESTRO.GET_SINIESTROTOPEADO2(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') = ''S'') ';

  if rbTopeadoNo.Checked then
    if (rbTopeadoPorCie10.Checked or rbTopeadoPorAutorizacion.Checked) then
      sSql := sSql + ' AND ((ART.SINIESTRO.GET_SINIESTROTOPEADO(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') IS NULL) OR (ART.SINIESTRO.GET_SINIESTROTOPEADO(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') >= ART.ACTUALDATE)) '
    else
      sSql := sSql + ' AND (ART.SINIESTRO.GET_SINIESTROTOPEADO2(ST_IDEXPEDIENTE, null, ' + SqlValue(sTipoTope) + ') = ''N'') ';

  if rgJustificacionPendiente.ItemIndex <> 2 then
    ssql := ssql + ' AND NOT EXISTS (SELECT 1 ' +
                                     ' FROM SIN.sso_supervisoresobs ' +
 	                                  ' WHERE so_idexpediente = st_idexpediente ' +
                                      ' AND so_fechaalta >= trunc(st_fechaalta) ' +
                                      ' AND so_fechabaja IS NULL ' +
                                      ' AND so_tipojustificacion = st_tipotopeo ' +
                                      ' AND so_tipousuario = ' + QuotedStr(string(iif(rgJustificacionPendiente.ItemIndex = 0, 'M', 'S'))) + ')';

  if fraUsuariosPorPrest.IsSelected then    // TK 56025
    ssql := ssql + '  AND ex_prestador IN (SELECT pu_idprestador ' +
                                           ' FROM cpu_prestadorusuario ' +
                                          ' WHERE pu_usuario = ' + SqlValue(fraUsuariosPorPrest.Codigo) +
                                            ' AND pu_fechabaja IS NULL) ';



  if cbPrestSinAsignar.Checked = true then  // TK 56025
    ssql := ssql + ' AND ex_prestador IN ( ' +
                                        ' SELECT ca_identificador ' +
                                          ' FROM art.cpr_prestador ' +
                                         ' WHERE ca_fechabaja IS NULL ' +
                                           ' AND ca_identificador NOT IN (SELECT pu_idprestador ' +
                                                                          ' FROM art.cpu_prestadorusuario ' +
                                                                         ' WHERE pu_fechabaja IS NULL)) ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

function TfrmManSiniestrosTopeados.Validar: Boolean;
begin
  Verificar((dFechaTope2.Visible)   and dFechaTope2.IsEmpty, dFechaTope2, 'La nueva fecha de 2° tope no puede ser nula.');
  Verificar((dFechaTope2.Visible)   and (dFechaTope2.Date < sdqConsulta.FieldByName('ST_FECHATOPE2').AsDateTime), dFechaTope2, 'La nueva fecha de 2° tope no puede ser menor a la anterior.');

  Verificar((edCant2doTope.Visible) and edCant2doTope.IsEmpty, edCant2doTope, 'La Cantidad Tope 2 no puede ser nula');
  Verificar((edCant2doTope.Visible) and (edCant2doTope.Value < sdqConsulta.FieldByName('ST_CANTIDADTOPE1').AsInteger), edCant2doTope, 'La Cantidad Tope 2 no puede ser menor a la Cantidad Tope 1.');

  Result := True;
end;
                                                                          
procedure TfrmManSiniestrosTopeados.LoadControls;
begin
  inherited;
  if (rbTopeadoPorCie10.checked or rbTopeadoPorAutorizacion.checked) then
    dFechaTope2.Date    := sdqConsulta.FieldByName('ST_FECHATOPE2').AsDateTime
  else if (rbTopeadoPorTraslados.checked or rbTopeadoPorFKT.checked) then
    edCant2doTope.Value := sdqConsulta.FieldByName('ST_CANTIDADTOPE2').AsInteger;
end;

procedure TfrmManSiniestrosTopeados.fpAbmBeforeShow(Sender: TObject);
var bTopePorFecha, bTopePorCantidad: boolean;
begin
  inherited;

  bTopePorFecha    := (rbTopeadoPorCie10.checked or rbTopeadoPorAutorizacion.checked);
  bTopePorCantidad := (rbTopeadoPorTraslados.checked or rbTopeadoPorFKT.checked);

  lblFechaTope2.Visible      := bTopePorFecha;
  dFechaTope2.Visible        := bTopePorFecha;
  lblCantidad2doTope.Visible := bTopePorCantidad;
  edCant2doTope.Visible      := bTopePorCantidad;

  Verificar(bTopePorFecha and sdqConsulta.FieldByName('ST_FECHATOPE2').IsNull,
            nil, 'No se puede modificar la 2° fecha de tope debido a que es nula.');
  Verificar(bTopePorCantidad and sdqConsulta.FieldByName('ST_CANTIDADTOPE2').IsNull,
            nil, 'No se puede modificar la 2° cantidad debido a que es nula.');
end;

procedure TfrmManSiniestrosTopeados.rbTopeadoPorCie10Click(Sender: TObject);
begin
  Do_CheckTopeadoPor;
end;

procedure TfrmManSiniestrosTopeados.rbTopeadoPorAutorizacionClick(Sender: TObject);
begin
  Do_CheckTopeadoPor;
end;

procedure TfrmManSiniestrosTopeados.rbTopeadoPorTrasladosClick(Sender: TObject);
begin
  Do_CheckTopeadoPor;
end;

procedure TfrmManSiniestrosTopeados.Do_CheckTopeadoPor;
var bTipoTopeoCantidad: boolean;
begin
  bTipoTopeoCantidad := rbTopeadoPorTraslados.Checked or rbTopeadoPorFKT.Checked;

  LockControls([gbFechaTope1, gbFechaTope2], bTipoTopeoCantidad);

  if rbTopeadoPorCie10.Checked then
  begin
    rbTopeadoPorCie10.Font.Color        := clNavy;
    rbTopeadoPorCie10.Font.Style        := [fsBold];
    rbTopeadoPorAutorizacion.Font.Color := clWindowText;
    rbTopeadoPorAutorizacion.Font.Style := [];
    rbTopeadoPorTraslados.Font.Color    := clWindowText;
    rbTopeadoPorTraslados.Font.Style    := [];
    rbTopeadoPorFKT.Font.Color          := clWindowText;
    rbTopeadoPorFKT.Font.Style          := [];
  end
  else if rbTopeadoPorAutorizacion.Checked then
  begin
    rbTopeadoPorAutorizacion.Font.Color := clMaroon;
    rbTopeadoPorAutorizacion.Font.Style := [fsBold];
    rbTopeadoPorCie10.Font.Color        := clWindowText;
    rbTopeadoPorCie10.Font.Style        := [];
    rbTopeadoPorTraslados.Font.Color    := clWindowText;
    rbTopeadoPorTraslados.Font.Style    := [];
    rbTopeadoPorFKT.Font.Color          := clWindowText;
    rbTopeadoPorFKT.Font.Style          := [];
  end
  else if rbTopeadoPorTraslados.Checked then
  begin
    rbTopeadoPorTraslados.Font.Color    := clPurple;
    rbTopeadoPorTraslados.Font.Style    := [fsBold];
    rbTopeadoPorCie10.Font.Color        := clWindowText;
    rbTopeadoPorCie10.Font.Style        := [];
    rbTopeadoPorAutorizacion.Font.Color := clWindowText;
    rbTopeadoPorAutorizacion.Font.Style := [];
    rbTopeadoPorFKT.Font.Color          := clWindowText;
    rbTopeadoPorFKT.Font.Style          := [];
    Do_LimpiarFechas;
  end
  else if rbTopeadoPorFKT.Checked then
  begin
    rbTopeadoPorFKT.Font.Color          := clGreen;
    rbTopeadoPorFKT.Font.Style          := [fsBold];
    rbTopeadoPorTraslados.Font.Color    := clWindowText;
    rbTopeadoPorTraslados.Font.Style    := [];
    rbTopeadoPorCie10.Font.Color        := clWindowText;
    rbTopeadoPorCie10.Font.Style        := [];
    rbTopeadoPorAutorizacion.Font.Color := clWindowText;
    rbTopeadoPorAutorizacion.Font.Style := [];
    Do_LimpiarFechas;
  end;

  tbRefrescarClick(Self);
end;


procedure TfrmManSiniestrosTopeados.Do_LimpiarFechas;
begin
  dFechaTope1_Desde.Clear;
  dFechaTope1_Hasta.Clear;
  dFechaTope2_Desde.Clear;
  dFechaTope2_Hasta.Clear;
end;


procedure TfrmManSiniestrosTopeados.cbPrestSinAsignarClick(Sender: TObject);   // TK 56025
begin
  if cbPrestSinAsignar.Checked = true then
  begin
    fraUsuariosPorPrest.Clear;
    LockControl(fraUsuariosPorPrest, true);
  end
  else
    LockControl(fraUsuariosPorPrest, false);
end;

end.
