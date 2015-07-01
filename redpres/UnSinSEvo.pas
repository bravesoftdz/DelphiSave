unit UnSinSEvo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ImgList, StdCtrls, unFraCIE10, unArtFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, RXSpin, unfraPrestador,General,unDmprincipal, CheckPanel,
  unArtDBAwareFrame, unArtDbFrame, unFraGrupoTrabajo;

type
  TfrmSinSEvo = class(TfrmCustomConsulta)
    LblQDiasSEvo: TLabel;
    LblFMinCarga: TLabel;
    TxtDiasctrl: TRxSpinEdit;
    CmbFecMin: TDateComboBox;
    ChkPrestador: TCheckPanel;
    fraPrestador: TfraPrestador;
    ChkDiagnostico: TCheckPanel;
    fraCIE10: TfraCIE10;
    ChkDelegacion: TCheckPanel;
    fraDelegacion: TfraCodigoDescripcion;
    ChkGrupo: TCheckPanel;
    Seguridad1: TSeguridad;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure ChkDelegacionChange(Sender: TObject);
    procedure ChkGrupoChange(Sender: TObject);
    procedure ChkPrestadorChange(Sender: TObject);
    procedure ChkDiagnosticoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmSinSEvo: TfrmSinSEvo;

implementation

uses
  unPrincipal, AnsiSql;

{$R *.DFM}

procedure TfrmSinSEvo.FormCreate(Sender: TObject);
begin
  inherited;

  //SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PISO, LG_DEPARTAMENTO) DIRECCION, UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG_TELEFONO) TELEFONO FROM DLG_DELEGACIONES WHERE LG_SISTEMA = 'S' ORDER BY LG_NOMBRE
  fragrupotrabajo.ShowBajas   := False;

  fraDelegacion.TableName   :='DLG_DELEGACIONES';
  fraDelegacion.FieldCodigo := 'LG_CODIGO';
  fraDelegacion.FieldDesc   := 'LG_NOMBRE';
  fraDelegacion.FieldBaja   := 'LG_FECHABAJA';
  fraDelegacion.ShowBajas   := True;

  CmbFecMin.Date := date - 365;
  //  fraPrestador
end;

procedure TfrmSinSEvo.tbRefrescarClick(Sender: TObject);
var
  SSQL: String;
begin
  SSQL :=
    'SELECT	ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, ex_prestador, ex_cuil cuil,' +
          ' tj_nombre paciente, tj_localidad localidad, pv_descripcion provincia, art.trabajador.get_telefono(tj_id, 4) Telefono, ex_cuit cuit,' +
          ' em_nombre empresa, nvl(ex_fecharecaida, ex_fechaaccidente) f_acci_reca, ex_diagnostico diagnostico,' +
          ' ex_diagnosticooms cie10, amebpba.get_dictamen_continua(ex_siniestro, ex_orden, 1) comision_cont,' +
          ' amebpba.get_dictamen_continua(ex_siniestro, ex_orden, 2) fec_cont,' +
          ' amebpba.get_dictamen_continua(ex_siniestro, ex_orden, 3) conclusiones,' +
          ' amebpba.get_evol_dictamen(ex_siniestro, ex_orden, ex_recaida) fec_recep, lg_nombre delegacion,' +
          ' ex_fechareasignacion f_reasigna, ca_descripcion prestador, pv_fechacontrol ultimo_control,' +
          ' pv_observaciones evolutivo, pv_proximocontrol prox_control,' +
          ' actualdate - nvl(ex_fecharecaida, ex_fechaaccidente) dias_baja,' +
          ' actualdate - amebpba.get_evol_dictamen(ex_siniestro, ex_orden, ex_recaida) dias_continua, gp_nombre,' +
          ' gp_tipo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
     ' FROM sex_expedientes, ctj_trabajador, cpv_provincias, spv_parteevolutivo, afi.aem_empresa, dlg_delegaciones,' +
          ' cpr_prestador, mgp_gtrabajo' +
    ' WHERE ex_fechaalta BETWEEN ' + cmbfecmin.SqlText + ' AND (actualdate - ' + TxtDiasctrl.Text + ')' +
      ' AND	NVL(ex_causafin, ''0'') NOT IN (''99'', ''95'', ''02'')' +
      ' AND	ex_altamedica IS NULL' +
      ' AND	NVL(LTRIM(ex_gravedad), ''1'') <> ''5''' +
      ' AND ex_idtrabajador = tj_id ' +
      ' AND (pv_proximocontrol is null or pv_proximocontrol < TRUNC(SYSDATE))' +
      ' AND ex_gtrabajo = gp_codigo' +
      ' AND	tj_provincia = pv_codigo (+)' +
      ' AND	ex_cuit = em_cuit' +
      ' AND ex_siniestro = pv_siniestro (+)' +
      ' AND ex_orden = pv_orden (+)' +
      ' AND ex_recaida = pv_recaida (+)' +
      ' AND amebpba.get_maxcontrol(ex_siniestro, ex_orden, ex_recaida) = pv_nroparte (+)' +
      ' AND	(amebpba.get_maxcontrol(ex_siniestro, ex_orden, ex_recaida) IS NULL' +
       ' OR pv_fechacontrol  + ' + TxtDiasctrl.Text  + ' <= actualdate)' +
      ' AND ex_delegacion = lg_codigo' +
      ' AND ex_prestador = ca_identificador (+)';

  if chkgrupo.Checked then begin
     if (fraGrupoTrabajo.ID <> '') then
        sSQL := sSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

     if (fraGrupoTrabajo.cmbGestor.Text <> '') then
        sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  if chkdelegacion.Checked then
    if fraDelegacion.edCodigo.Text <> '' then
      SSQL := SSQL + ' AND ex_delegacion = ' + fraDelegacion.edCodigo.Text;

  if chkprestador.Checked then
    if fraPrestador.IDPrestador <> 0 then
      SSQL := SSQL + ' AND ex_prestador = ' + IntToStr(fraPrestador.IDPrestador);

  if chkdiagnostico.Checked then
    if fraCIE10.edCodigo.Text <> '' then
      SSQL := SSQL + ' AND	ex_diagnosticooms = ''' + fraCIE10.edCodigo.Text + '''';

  sdqconsulta.Sql.Text := SSQL;
  inherited;
end;

procedure TfrmSinSEvo.tbLimpiarClick(Sender: TObject);
begin
  fraGrupoTrabajo.Clear;
  fradelegacion.edCodigo.clear;
  fradelegacion.cmbDescripcion.Clear;
  fraprestador.Clear;
  fracie10.edCodigo.clear;
  fracie10.cmbDescripcion.clear;
  sdqConsulta.Close;
  ChkDelegacion.Checked :=False;
  ChkDiagnostico.Checked := False;
  ChkGrupo.checked:= False;
  ChkPrestador.checked:= False;
end;

procedure TfrmSinSEvo.tbNuevoClick(Sender: TObject);
var
  bContinue: Boolean;
  bErrores: Boolean;
  sSql: String;
begin
  inherited;
  
  bErrores := False;
  sdqConsulta.First;
  while not sdqConsulta.Eof  do
  begin
//        bContinue:=False;
        //Por cada registro de la grilla
    if sdqConsulta.FieldByName('ex_prestador').AsString <> '' then
    begin
      if sdqConsulta.FieldByName('GP_TIPO').AsString <> 'C' then
      begin
        sSql :=
          'SELECT COUNT(*)' +
           ' FROM SDO_DOCUMUTUAL' +
          ' WHERE (DO_DOCUMENTO = ''019''' +
            ' AND DO_SINIESTRO = ' + sdqConsulta.FieldByName('Siniestro').AsString +
            ' AND DO_ORDEN = ' + sdqConsulta.FieldByName('Orden').AsString +
            ' AND DO_RECAIDA = ' + sdqConsulta.FieldByName('Recaida').AsString +
            ' AND DO_PRESTADOR = ' + sdqConsulta.FieldByName('ex_prestador').AsString + ')';
        if (ValorSql(sSql) = 0) then
//                  bContinue:=   True;
        else
//                  bContinue:=False;

        sSql :=
          'SELECT COUNT(*)' +
           ' FROM SEX_EXPEDIENTES, CDG_DIAGNOSTICO' +
          ' WHERE DG_CODIGO = EX_DIAGNOSTICOOMS' +
            ' AND (AMEBPBA.GET_FCONTROL(' + sdqConsulta.FieldByName('Siniestro').AsString + ',' +
                                            sdqConsulta.FieldByName('Orden').AsString + ',' +
                                            sdqConsulta.FieldByName('Recaida').AsString + ') IS NULL' +
            ' AND (EX_FECHAALTA + GREATEST(' + TxtDiasctrl.Text + ', DG_DIAS_EVOL) <= ACTUALDATE))' +
             ' OR (AMEBPBA.GET_FCONTROL(' + sdqConsulta.FieldByName('Siniestro').AsString + ',' +
                                            sdqConsulta.FieldByName('Orden').AsString + ',' +
                                            sdqConsulta.FieldByName('Recaida').AsString + ') IS NOT NULL' +
            ' AND (AMEBPBA.GET_FCONTROL(' + sdqConsulta.FieldByName('Siniestro').AsString + ',' +
                                            sdqConsulta.FieldByName('Orden').AsString + ',' +
                                            sdqConsulta.FieldByName('Recaida').AsString + ') +' +
                ' GREATEST(' + TxtDiasctrl.Text + ', DG_DIAS_EVOL)) <= ACTUALDATE)';
        if ValorSql(sSql) then
          bContinue := True
        else
          bContinue := False;
      end
      else
        bContinue := True;

      sSql :=
        'SELECT COUNT(*)' +
         ' FROM SDO_DOCUMUTUAL' +
        ' WHERE DO_DOCUMENTO = ''020''' +
          ' AND DO_SINIESTRO = ' + sdqConsulta.FieldByName('Siniestro').AsString +
          ' AND DO_ORDEN = ' + sdqConsulta.FieldByName('Orden').AsString +
          ' AND DO_RECAIDA = ' + sdqConsulta.FieldByName('Recaida').AsString +
          ' AND DO_PRESTADOR = ' + sdqConsulta.FieldByName('ex_prestador').AsString +
          ' AND DO_FECHAIMPRESION IS NULL';
      if bContinue and (ValorSql(sSql) = 0) then
      begin
        sSql :=
          'insert into sdo_documutual(DO_SINIESTRO, DO_ORDEN, DO_RECAIDA, DO_NUMERO, DO_MODULO, DO_DOCUMENTO,' +
                                    ' DO_FECHAALTA, DO_FECHAIMPRESION, DO_FECHARECEPCION, DO_OBSERVACIONES, DO_FIRMA,' +
                                    ' DO_DESTINATARIO, DO_PRESTADOR, DO_USUALTA, DO_CONTRATO)' +
                            ' Values (' + sdqConsulta.FieldByName('Siniestro').AsString + ',' +
                                          sdqConsulta.FieldByName('Orden').AsString + ',' +
                                          sdqConsulta.FieldByName('Recaida').AsString + ',' +
                                          ValorSql('select amebpba.get_nroevolsol (' + sdqConsulta.FieldByName('Siniestro').AsString + ',' +
                                                                                       sdqConsulta.FieldByName('Orden').AsString + ',' +
                                                                                       sdqConsulta.FieldByName('Recaida').AsString + ', ''020'', ''E'') + 1 from dual') + ',' +
                                          '''E'', ''020'', actualdate, NULL, NULL, NULL, NULL, ''P'',' +
                                          sdqConsulta.FieldByName('ex_prestador').AsString + ',' + '''' +
                                          frmPrincipal.DBLogin.LoginName + ''', NULL )';
        CopySqlClp(sSql);
        try
          EjecutarSQL(sSql);
        except
          bErrores := True;
        end;
      end;
    end;

    sdqConsulta.Next;
  end;

  if bErrores then
    Msgbox('Al menos un registro generó errores, por favor imprima esta pantalla y comuníquese con sistemas.', 0, 'Solicitud Errónea')
  else
    Msgbox('Solicitud de evolución realizada con éxito.', 0, 'Solicitud exitosa');
end;

procedure TfrmSinSEvo.ChkDelegacionChange(Sender: TObject);
begin
  inherited;

  if not ChkDelegacion.Checked then
  begin
    fradelegacion.edCodigo.Text := '';
    fradelegacion.cmbDescripcion.Clear;
  end;
end;

procedure TfrmSinSEvo.ChkGrupoChange(Sender: TObject);
begin
  inherited;

  if not ChkGrupo.Checked then
    fraGrupoTrabajo.Clear;
end;

procedure TfrmSinSEvo.ChkPrestadorChange(Sender: TObject);
begin
  inherited;

  if not ChkPrestador.Checked then
    fraprestador.Limpiar;
end;

procedure TfrmSinSEvo.ChkDiagnosticoChange(Sender: TObject);
begin
  inherited;

  if not ChkDiagnostico.Checked then
    fraCIE10.Limpiar;
end;

procedure TfrmSinSEvo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
