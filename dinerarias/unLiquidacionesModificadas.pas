unit unLiquidacionesModificadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraTrabajador, unSesion,
  unFraTrabajadorSiniestro, Vcl.Mask, RxToolEdit, DateComboBox, AnsiSql, unDmPrincipal, CustomDlgs;

type
  TfrmLiquidacionesModificadas = class(TfrmCustomConsulta)
    fraEmpresa: TfraEmpresa;
    Label19: TLabel;
    fraTrabajadorSin: TfraTrabajadorSiniestro;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    rbSi_VerBajas: TRadioButton;
    rbNo_VerBajas: TRadioButton;
    rbTodos_VerBajas: TRadioButton;
    GroupBox2: TGroupBox;
    rbSi_VerAut: TRadioButton;
    rbNo_VerAut: TRadioButton;
    rbTodos_VerAut: TRadioButton;
    GroupBox3: TGroupBox;
    rbSi_VerReempl: TRadioButton;
    rbNo_VerReempl: TRadioButton;
    rbTodos_VerReempl: TRadioButton;
    gbFechaModif: TGroupBox;
    dcFecModifDesde: TDateComboBox;
    dcFecModifHasta: TDateComboBox;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    dcFecAutModifDesde: TDateComboBox;
    dcFecAutModifHasta: TDateComboBox;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    dcFecCambioOPDesde: TDateComboBox;
    dcFecCambioOPHasta: TDateComboBox;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    dcFecAccidDesde: TDateComboBox;
    dcFecAccidHasta: TDateComboBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    { Private declarations }
    procedure Do_ModificarLiquidación;
    function Validar_Modificacion(sTabla:string): boolean;
    function HayRegistroActivo: boolean;
    function ValidarEliminar: boolean;
  public
    { Public declarations }
  end;

var
  frmLiquidacionesModificadas: TfrmLiquidacionesModificadas;

implementation

{$R *.dfm}

procedure TfrmLiquidacionesModificadas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqconsulta.FieldByName('fbaja').IsNull then
     AFont.Color := clRed;
  if (not sdqConsulta.FieldByName('ml_fechaaprob').IsNull) and sdqconsulta.FieldByName('fbaja').IsNull then
  begin
     BackGround  := TColor(clBtnFace);
     AFont.Color := clWindowText;
  end;

end;

function TfrmLiquidacionesModificadas.HayRegistroActivo: boolean;
begin
  Result := sdqconsulta.Active and not sdqconsulta.IsEmpty;
end;

procedure TfrmLiquidacionesModificadas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  tbPropiedades.Enabled := (sdqConsulta.FieldByName('ml_fechaaprob').IsNull) and (sdqconsulta.FieldByName('fbaja').isNull);
  tbEliminar.Enabled    := (sdqConsulta.FieldByName('ml_fechaaprob').IsNull) and (sdqconsulta.FieldByName('fbaja').isNull);
  tbPropiedades.Enabled := Seguridad.Claves.IsActive('Autorizar_Modificacion') and
                           (sdqConsulta.FieldByName('ml_fechaaprob').IsNull) and
                           (sdqconsulta.FieldByName('fbaja').isNull);
end;

function TfrmLiquidacionesModificadas.ValidarEliminar: boolean;
begin
  Verificar(not sdqConsulta.FieldByName('ml_fechaaprob').IsNull, tbEliminar, 'No se puede dar de baja un registro autorizado');
  Verificar(not sdqconsulta.FieldByName('fbaja').isNull, tbEliminar, 'No se puede dar de baja un registro ya eliminado.' );
  Result := True;
end;

procedure TfrmLiquidacionesModificadas.tbEliminarClick(Sender: TObject);
var sSql:string;
begin
  if HayRegistroActivo and ValidarEliminar and (MsgBox('¿Confirma que desea dar de baja esta modificación?', MB_YESNO + MB_ICONQUESTION) = mrYes) then
    Try
      BeginTrans;
      sSql := 'UPDATE din.dml_modifliquidacion ' +
                ' SET ml_fechabaja = art.actualdate, ' +
                    ' ml_usubaja = :usubaja ' +
              ' WHERE ml_id = :id';

      EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqConsulta.FieldByName('ml_id').AsInteger]);
      CommitTrans;
      tbRefrescarClick(nil);
    Except
    on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar eliminar el registro.');
        Rollback;
      end;
    end;

end;

procedure TfrmLiquidacionesModificadas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  fraTrabajadorSin.Clear;
  dcFecModifDesde.Clear;
  dcFecModifHasta.Clear;
  dcFecAutModifDesde.Clear;
  dcFecAutModifHasta.Clear;
  dcFecCambioOPDesde.Clear;
  dcFecCambioOPHasta.Clear;
  dcFecAccidDesde.Clear;
  dcFecAccidHasta.Clear;
  rbNo_VerBajas.Checked     := True;
  rbTodos_VerReempl.Checked := True;
  rbTodos_VerAut.Checked    := True;
end;


procedure TfrmLiquidacionesModificadas.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  sSql := ' SELECT * FROM ( ' +
               ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_fechaaccidente faccid, ' +
                      ' le_numliqui numliq,  cp_denpago conpago, tj_nombre trabajador, art.utiles.armar_cuit(tj_cuil) cuil, em_nombre empresa, ' +
                      ' art.utiles.armar_cuit(em_cuit) cuit, art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio, ' +
                      ' le_imporperi monto, le_usualta liquidador, le_faprobado faprobacion, mp.tb_descripcion formapagoorig,  ' +
                      ' ba.ba_nombre bancoorig, ml_enviofondosorig enviofondosorig, ml_chequenombreorig chequenombreorig, ml_recibosorig recibosaorig, ' +
                      ' ce.ce_ordenpago oporig, ce.ce_numero nrochequeorig, mp2.tb_descripcion formapagonueva, ba2.ba_nombre banconuevo, ' +
                      ' ml_enviofondos enviofondosnuevo, ml_chequenombre chequenombrenuevo, ml_recibos recibosanuevo, ' +
                      ' ce2.ce_ordenpago opnueva, ce2.ce_numero nrochequenuevo, ml_usualta usuariomodifdatos, ' +
                      ' ml_fechaalta fmodifdatos, ml_usuaprob usuarioaprobmodif, ml_fechaaprob faprobmodif,  ' +
                      ' ml_usucambioop usuarioopnueva, ml_fechacambioop fechaopnueva, ml_fdisposicion fpuestadisp,  ' +
                      ' ml_fechabaja fbaja, ml_fechaaprob, ml_id, em_cuit, ex_idtrabajador, ex_id, ml_fechaalta, ml_fechacambioop, ml_tablaliqui, ml_idexpediente  ' +
                 ' FROM art.sle_liquiempsin, din.dml_modifliquidacion, art.sex_expedientes, ' +
                      ' ctj_trabajador, aem_empresa, art.ctb_tablas mp, zba_banco ba, ' +
                      ' rce_chequeemitido ce, art.ctb_tablas mp2, zba_banco ba2,  ' +
                      ' rce_chequeemitido ce2, art.scp_conpago ' +
                ' WHERE le_idexpediente = ml_idexpediente ' +
                  ' AND le_numliqui = ml_numliqui ' +
                  ' AND ml_tablaliqui = ''SLE'' ' +
                  ' AND le_idexpediente = ex_id  ' +
                  ' AND ex_idtrabajador = tj_id  ' +
                  ' AND ex_cuit = em_cuit  ' +
                  ' AND mp.tb_clave = ''COBRO'' ' +
                  ' AND mp.tb_codigo = ml_metodopagoorig ' +
                  ' AND ml_idbancoorig = ba.ba_id(+)  ' +
                  ' AND ml_idchequeoriginal = ce.ce_id ' +
                  ' AND mp2.tb_clave(+) = ''COBRO'' ' +
                  ' AND mp2.tb_codigo(+) = ml_metodopago ' +
                  ' AND ba2.ba_id(+) = ml_idbanco ' +
                  ' AND ce2.ce_id(+) = ml_idchequenuevo ' +
                  ' AND le_conpago = cp_conpago ' +

           ' UNION ALL ' +

               ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_fechaaccidente faccid, ' +
                      ' pr_numpago numliq,  cp_denpago conpago, tj_nombre trabajador, art.utiles.armar_cuit(tj_cuil) cuil, em_nombre empresa, ' +
                      ' art.utiles.armar_cuit(em_cuit) cuit, art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio, ' +
                      ' pr_imporpago monto, pr_usualta liquidador, pr_faprobado faprobacion, mp.tb_descripcion formapagoorig, ' +
                      ' ba.ba_nombre bancoorig, ml_enviofondosorig enviofondosorig, ml_chequenombreorig chequenombreorig,  ' +
                      ' art.utiles.armar_domicilio(ml_rcalleorig, ml_rnumeroorig, ml_rpisoorig, ml_rdepartamentoorig, ml_rlocalidadorig) recibosaorig, ' +
                      ' ce.ce_ordenpago oporig, ce.ce_numero nrochequeorig, mp2.tb_descripcion formapagonueva, ba2.ba_nombre banconuevo, ' +
                      ' ml_enviofondos enviofondosnuevo, ml_chequenombre chequenombrenuevo, ml_recibos recibosanuevo, ' +
                      ' ce2.ce_ordenpago opnueva, ce2.ce_numero nrochequenuevo, ml_usualta usuariomodifdatos, ' +
                      ' ml_fechaalta fmodifdatos, ml_usuaprob usuarioaprobmodif, ml_fechaaprob faprobmodif, ' +
                      ' ml_usucambioop usuarioopnueva, ml_fechacambioop fechaopnueva, ml_fdisposicion fpuestadisp, ' +
                      ' ml_fechabaja fbaja, ml_fechaaprob, ml_id, em_cuit, ex_idtrabajador, ex_id, ml_fechaalta, ml_fechacambioop, ml_tablaliqui, ml_idexpediente ' +
                 ' FROM art.spr_pagoexpesin, din.dml_modifliquidacion, art.sex_expedientes, ' +
                      ' ctj_trabajador, aem_empresa, art.ctb_tablas mp, zba_banco ba, ' +
                      ' rce_chequeemitido ce, art.ctb_tablas mp2, zba_banco ba2, ' +
                      ' rce_chequeemitido ce2, art.scp_conpago ' +
                ' WHERE pr_idexpediente = ml_idexpediente ' +
                  ' AND pr_numpago = ml_numliqui ' +
                  ' AND ml_tablaliqui = ''SPR'' ' +
                  ' AND pr_idexpediente = ex_id  ' +
                  ' AND ex_idtrabajador = tj_id ' +
                  ' AND ex_cuit = em_cuit  ' +
                  ' AND mp.tb_clave = ''COBRO'' ' +
                  ' AND mp.tb_codigo = ml_metodopagoorig  ' +
                  ' AND ml_idbancoorig = ba.ba_id(+) ' +
                  ' AND ml_idchequeoriginal = ce.ce_id ' +
                  ' AND mp2.tb_clave(+) = ''COBRO'' ' +
                  ' AND mp2.tb_codigo(+) = ml_metodopago ' +
                  ' AND ba2.ba_id(+) = ml_idbanco ' +
                  ' AND ce2.ce_id(+) = ml_idchequenuevo ' +
                  ' AND pr_conpago = cp_conpago ' +
                 ' ) ' +
           ' WHERE 1 = 1 ';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND em_cuit = ' + SqlValue(fraEmpresa.CUIT);
  if (fraTrabajadorSin.cmbNombre.Text <> '') then
    sSql := sSql + ' AND ex_idtrabajador = ' + SqlValue(fratrabajadorSin.IdTrabajador);
  if not fraTrabajadorSin.edSiniestro.IsEmpty  then
    sSql := sSql + ' AND ex_id = ' + SqlValue(fraTrabajadorSin.IdExpediente);

  if (dcFecModifDesde.Date > 0) then
    sSql := sSql + ' AND ml_fechaalta >= ' + SqlDate(dcFecModifDesde.Date);
  if (dcFecModifHasta.Date > 0) then
    sSql := sSql + ' AND ml_fechaalta <= ' + SqlDate(dcFecModifHasta.Date);

  if (dcFecAutModifDesde.Date > 0) then
    sSql := sSql + ' AND ml_fechaaprob >= ' + SqlDate(dcFecAutModifDesde.Date);
    if (dcFecAutModifHasta.Date > 0) then
    sSql := sSql + ' AND ml_fechaaprob <= ' + SqlDate(dcFecAutModifHasta.Date);

  if (dcFecCambioOPDesde.Date > 0) then
    sSql := sSql + ' AND ml_fechacambioop >= ' + SqlDate(dcFecCambioOPDesde.Date);
  if (dcFecCambioOPHasta.Date > 0) then
    sSql := sSql + ' AND ml_fechacambioop <= ' + SqlDate(dcFecCambioOPHasta.Date);

  if (dcFecAccidDesde.Date > 0) then
    sSql := sSql + ' AND faccid >= ' + SqlDate(dcFecAccidDesde.Date);
  if (dcFecAccidHasta.Date > 0) then
    sSql := sSql + ' AND faccid <= ' + SqlDate(dcFecAccidHasta.Date);

  if rbSi_VerBajas.Checked then
    sSql := sSql + ' AND fbaja is not null '
  else if rbNo_VerBajas.Checked then
    sSql := sSql + ' AND fbaja is null ';

  if rbSi_VerReempl.Checked then
    sSql := sSql + ' AND fechaopnueva is not null '
  else if rbNo_VerReempl.Checked then
    sSql := sSql + ' AND fechaopnueva is null ';

  if rbSi_VerAut.Checked then
    sSql := sSql + ' AND faprobmodif IS NOT NULL '
  else if rbNo_VerAut.Checked then
    sSql := sSql + ' AND faprobmodif IS NULL ';


  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmLiquidacionesModificadas.tbPropiedadesClick(Sender: TObject);
var sSql:string;
begin
  if HayRegistroActivo and Validar_Modificacion(sdqConsulta.FieldByName('ml_tablaliqui').AsString) then
  begin
    if MsgBox('¿Confirma que desea autorizar esta modificación?', MB_YESNO + MB_ICONQUESTION) = mrYes then
      Try
        BeginTrans;

        // Autorizo el caso en la tabla
        sSql := 'UPDATE din.dml_modifliquidacion ' +
                  ' SET ML_FECHAAPROB = art.actualdate, ' +
                      ' ML_USUAPROB = :usubaja ' +
                ' WHERE ml_id = :id';

        EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqConsulta.FieldByName('ml_id').AsInteger]);

        // Modifico la tabla SLE o SPR
        Do_ModificarLiquidación;

        CommitTrans;
        tbRefrescarClick(nil);
      Except
      on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar autorizar el registro.');
          Rollback;
        end;
      end;
  end;

end;

function TfrmLiquidacionesModificadas.Validar_Modificacion(sTabla:string): boolean;
var sSql: string;
begin
  if (sTabla = 'SLE') then
    sSql := 'SELECT le_estado ESTADO ' +
             ' FROM art.sle_liquiempsin ' +
            ' WHERE le_idexpediente = :idexped ' +
              ' AND le_numliqui = :numliqui '
  else
    sSql := 'SELECT pr_estado ESTADO ' +
             ' FROM art.spr_pagoexpesin ' +
            ' WHERE pr_idexpediente = :idexped ' +
              ' AND pr_numpago = :numliqui ';

  with GetQueryEx(sSql, [sdqConsulta.FieldByName('ex_id').AsInteger, sdqConsulta.FieldByName('numliq').AsInteger]) do
  try
    Verificar((FieldByName('ESTADO').AsString <> 'E'), nil, 'No se puede modificar la liquidación: Ha cambiado el estado de la misma.');
  finally
    Free;
  end;
  Result := True;
end;

procedure TfrmLiquidacionesModificadas.Do_ModificarLiquidación;
var sSql, sSqlUp: string;
begin
  sSql := 'SELECT ml_tablaliqui, ml_metodopago, ml_idbanco, ml_enviofondos, ml_tipoenviofondos, ' +
                ' ml_idenviofondos, ml_chequenombre, ml_recibos, ml_rcalle, ml_rnumero, ml_rpiso, ml_rdepartamento, ' +
                ' ml_rcpostal, ml_rlocalidad, ml_rprovincia, ml_rchkdomicilio, ml_rchkotro, ml_rotro, ' +
                ' ml_idchequeoriginal, ml_delegacion ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexped ' +
            ' AND ml_numliqui = :numliqui ';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('ex_id').AsInteger, sdqConsulta.FieldByName('numliq').AsInteger]) do
  try
    if (FieldByName('ML_TABLALIQUI').AsString = 'SLE') then
    begin
      sSqlUp := 'UPDATE art.sle_liquiempsin ' +
                  ' SET le_metodopago = ' + SqlValue(FieldByName('ML_METODOPAGO').AsString) + ',' +
                      ' le_idbanco = ' + SqlInt(FieldByName('ML_IDBANCO').AsInteger) + ',' +
                      ' le_enviofondos = ' + SqlValue(FieldbyName('ML_ENVIOFONDOS').AsString) + ',' +
                      ' le_tipoenviofondos = ' + SqlValue(FieldbyName('ml_tipoenviofondos').AsString) + ',' +
                      ' le_idenviofondos = ' + SqlInt(FieldByName('ml_idenviofondos').AsInteger) + ',' +
                      ' le_chequenombre = ' + SqlValue(FieldbyName('ml_chequenombre').AsString) + ',' +
                      ' le_recibos = ' +  SqlValue(FieldbyName('ml_recibos').AsString) + ',' +
                      ' le_rcalle = ' + SqlValue(FieldbyName('ml_rcalle').AsString) + ',' +
                      ' le_rnumero = ' + SqlValue(FieldbyName('ml_rnumero').AsString) + ',' +
                      ' le_rpiso = ' +  SqlValue(FieldbyName('ml_rpiso').AsString) + ',' +
                      ' le_rdepartamento = ' + SqlValue(FieldbyName('ml_rdepartamento').AsString) + ',' +
                      ' le_rcpostal = ' + SqlValue(FieldbyName('ml_rcpostal').AsString) + ',' +
                      ' le_rlocalidad = ' + SqlValue(FieldbyName('ml_rlocalidad').AsString) + ',' +
                      ' le_rprovincia = ' + SqlValue(FieldbyName('ml_rprovincia').AsString) + ',' +
                      ' le_rchkdomicilio = ' + SqlValue(FieldbyName('ml_rchkdomicilio').AsString) + ',' +
                      ' le_rchkotro = ' + SqlValue(FieldbyName('ml_rchkotro').AsString) + ',' +
                      ' le_rotro = ' + SqlValue(FieldbyName('ml_rotro').AsString) + ',' +
                      ' le_delegacion = ' + SqlValue(FieldbyName('ml_delegacion').AsString) +
                ' WHERE le_idexpediente = ' + SqlInt(sdqConsulta.FieldByName('ml_idexpediente').AsInteger) +
                  ' AND le_numliqui = ' + SqlInt(sdqConsulta.FieldByName('numliq').AsInteger);
    end
    else begin
      sSqlUp := ' UPDATE art.spr_pagoexpesin ' +
                   ' SET pr_metodopago = ' + SqlValue(FieldByName('ML_METODOPAGO').AsString) + ',' +
                       ' pr_idbanco = ' + SqlInt(FieldByName('ML_IDBANCO').AsInteger) + ',' +
                       ' pr_enviofondos = ' + SqlValue(FieldbyName('ML_ENVIOFONDOS').AsString) + ',' +
                       ' pr_rcalle = ' +  SqlValue(FieldbyName('ml_rcalle').AsString) + ',' +
                       ' pr_rnumero = ' + SqlValue(FieldbyName('ml_rnumero').AsString) + ',' +
                       ' pr_rpiso = ' + SqlValue(FieldbyName('ml_rpiso').AsString) + ',' +
                       ' pr_rdepartamento = ' + SqlValue(FieldbyName('ml_rdepartamento').AsString) + ',' +
                       ' pr_rcpostal = ' + SqlValue(FieldbyName('ml_rcpostal').AsString) + ',' +
                       ' pr_rlocalidad = ' + SqlValue(FieldbyName('ml_rlocalidad').AsString) + ',' +
                       ' pr_rprovincia = ' +  SqlValue(FieldbyName('ml_rprovincia').AsString) +
                 ' WHERE pr_idexpediente = ' + SqlInt(sdqConsulta.FieldByName('ml_idexpediente').AsInteger) +
                   ' AND pr_numpago = ' + SqlInt(sdqConsulta.FieldByName('numliq').AsInteger);
    end;
    EjecutarSqlST(sSqlUp);

  finally
    Free;
  end;
end;

end.
