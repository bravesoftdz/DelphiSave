unit unCargaMultipleRiesgos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, FormPanel, SqlFuncs, DBSql,
  unGrids;

type
  TfrmCargaMultipleRiesgos = class(TfrmCustomConsulta)
    edFechaRelevamiento: TDateComboBox;
    Label1: TLabel;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    fpAbmEsop: TFormPanel;
    BevelAbm: TBevel;
    Label3: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraRiesgos: TfraCodigoDescripcion;
    tbComandosSel: TToolBar;
    tbAddEsop: TToolButton;
    tbDeleteEsop: TToolButton;
    Label2: TLabel;
    lstEsop: TListBox;
    ShortCutControl1: TShortCutControl;
    Label4: TLabel;
    edFechaRecep: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edFechaCoord: TDateComboBox;
    edFechaImp: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbAddEsopClick(Sender: TObject);
    procedure tbDeleteEsopClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fpAbmEsopKeyPress(Sender: TObject; var Key: Char);
  private
    FCuit : String;
    FContrato : Integer;
    FEstableci : Integer;
    SelectedList: TBookMarkLst;
    Sql: TCustomSql;
    { Private declarations }
  public
    { Public declarations }
    procedure Carga(contrato, estableci: Integer);
  end;

var
  frmCargaMultipleRiesgos: TfrmCargaMultipleRiesgos;

implementation

uses unDmPrincipal, ansiSql, unFraTrabajador, unSesion, unComunesFet,
  unComunes, unMoldeEnvioMail, CustomDlgs, VCLExtra;
{$R *.dfm}

procedure TfrmCargaMultipleRiesgos.Carga(contrato : Integer; estableci : Integer);
begin
  FContrato := contrato;
  FEstableci := estableci;
  FCuit := ValorSql(
        ' SELECT em_cuit '+
        '   FROM afi.aem_empresa, afi.aco_contrato '+
        '  WHERE em_id = co_idempresa '+
        '    AND co_contrato = '+SqlValue(FContrato));

end;

procedure TfrmCargaMultipleRiesgos.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConsulta.ParamByName('contrato').AsInteger := FContrato;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  sdqConsulta.ParamByName('cuit').AsString := FCuit;
  sdqConsulta.ParamByName('fecha').AsDate := 0;
  SelectedList := TBookMarkLst.Create;
  with fraRiesgos do
  begin
    TableName   := 'PRG_RIESGOS';
    FieldID     := 'RG_ID';
    FieldCodigo := 'RG_ESOP || rg_sufijoesop';
    FieldDesc   := 'RG_DESCRIPCION';
    Showbajas   := False;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'rg_fechabaja';
  end;
  Sql := TDBSql.Create;
  tbSalir.Left := tbSeleccionarTodo.Left +5;
end;

procedure TfrmCargaMultipleRiesgos.tbRefrescarClick(Sender: TObject);
begin
  Verificar(edFechaRelevamiento.Date = 0,edFechaRelevamiento, 'Debe Seleccionar una Fecha');
  sdqConsulta.Close;
  sdqConsulta.ParamByName('contrato').AsInteger := FContrato;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  sdqConsulta.ParamByName('cuit').AsString := FCuit;
  sdqConsulta.ParamByName('fecha').AsDate := edFechaRelevamiento.Date;
  sdqConsulta.Open;
  vclExtra.LockControls(edFechaRelevamiento,True);
  inherited;
end;

procedure TfrmCargaMultipleRiesgos.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('rl_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('rl_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('rl_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmCargaMultipleRiesgos.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  Sql.free;
  inherited;
end;

procedure TfrmCargaMultipleRiesgos.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('rl_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCargaMultipleRiesgos.tbDesSeleccionarTodoClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmCargaMultipleRiesgos.tbSeleccionarTodoClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('rl_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('rl_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmCargaMultipleRiesgos.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmCargaMultipleRiesgos.tbAddEsopClick(Sender: TObject);
begin
  if fraRiesgos.IsSelected then
  begin
    lstEsop.Items.AddObject(fraRiesgos.Codigo + ' - ' + fraRiesgos.Descripcion, TObject(fraRiesgos.Value));
    fraRiesgos.Clear;
  end;
end;

procedure TfrmCargaMultipleRiesgos.tbDeleteEsopClick(Sender: TObject);
begin
  if fraRiesgos.IsSelected then
  begin
    lstEsop.Items.Delete(lstEsop.Items.IndexOfObject(TObject(fraRiesgos.Value)));
    fraRiesgos.Clear;
  end;
end;

procedure TfrmCargaMultipleRiesgos.tbNuevoClick(Sender: TObject);
begin
  inherited;
  Verificar(SelectedList.Count = 0, Grid, 'Debe Seleccionar un trabajador');
  fraRiesgos.Clear;
  lstEsop.Clear;
  fpAbmEsop.ShowModal;
end;

procedure TfrmCargaMultipleRiesgos.btnAceptarClick(Sender: TObject);
var
  i,j : Integer;
  sEsopIn : String;
  sSQL, idRelacionLaboral, vRiesgo, vNombre: string;
  IdCabeceraNomina : Integer;
  vFechaIngreso : TDate;
  FRepetido, FAsunto, FBody, FListaMail: String;
  vCuil : String;
  conSemestral : Boolean;
//  idHistorico: integer;

begin
  inherited;
  try
    IdCabeceraNomina := 0;

    for i :=0 to lstEsop.Count-1 do
    begin
      sEsopIn := IntToStr(Integer(lstEsop.Items.Objects[i]));
      for j:=0 to SelectedList.Count-1 do
      begin
        DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[j]);
        idRelacionLaboral := SelectedList.Strings[j];
        vCuil := ValorSql('SELECT TJ_CUIL FROM comunes.ctj_trabajador, comunes.crl_relacionlaboral '+
                     '  where RL_IDTRABAJADOR = tj_id  and rl_id = '+
                  SqlValue(idRelacionLaboral));
        if not ExisteSql(
          ' SELECT 1 '+
          '   FROM art.prt_riestrab '+
          '  WHERE rt_cuit = '+SqlValue(FCuit)+
          '    AND rt_estableci = '+SqlValue(FEstableci)+
          '    AND rt_fecha = '+SqlDate(edFechaRelevamiento.Date)+
          '    AND rt_cuil = '+SqlValue(vCuil)+
          '    AND rt_riesgo = (SELECT rg_codigo '+
          '                       FROM art.prg_riesgos '+
          '                      WHERE rg_id = '+SqlValue(sEsopIn)+')') then
        begin
          vFechaIngreso := ValorSqlDateTime(
            ' SELECT rl_fechaingreso '+
            '   FROM comunes.crl_relacionlaboral '+
            '  WHERE rl_id = '+SqlValue(idRelacionLaboral));

          vRiesgo := ValorSql(
            ' SELECT rg_codigo '+
            '   FROM art.prg_riesgos '+
            '  WHERE rg_id = '+SqlValue(sEsopIn));

          vNombre :=  ValorSql('SELECT tj_nombre FROM comunes.ctj_trabajador, comunes.crl_relacionlaboral '+
                     '  where RL_IDTRABAJADOR = tj_id  and rl_id = '+
                  SqlValue(idRelacionLaboral));

          Sql.Clear;
          FRepetido := 'N';
          if ExisteSql(
            'SELECT 1 ' +
            '  FROM art.prt_riestrab prt1 ' +
            ' WHERE prt1.rt_cuit = ' + SqlValue(FCUIT) +
            '   AND prt1.rt_cuil = ' + SqlValue(vCuil) +
            '   AND prt1.rt_estableci <> ' + SqlValue(FEstableci) +
            '   AND prt1.rt_fecha = (SELECT MAX (prt2.rt_fecha) ' +
            '                          FROM art.prt_riestrab prt2 ' +
            '                         WHERE prt2.rt_cuit = prt1.rt_cuit ' +
            '                           AND prt2.rt_cuil = prt1.rt_cuil) ') then
            FRepetido := 'S';

          Sql.TableName := 'ART.PRT_RIESTRAB';
          Sql.SqlType := stInsert;
          Sql.Fields.Add('RT_CUIT',FCUIT);
          Sql.PrimaryKey.Add('RT_ID',GetSecNextVal('ART.SEQ_PRT_ID'));
          Sql.Fields.Add('RT_ESTABLECI', FEstableci );
          Sql.Fields.Add('RT_FECHA', edFechaRelevamiento.Date );
          Sql.Fields.Add('RT_FECHAINIEXPO', vFechaIngreso );
          Sql.Fields.Add('RT_RIESGO', vRiesgo );
          Sql.Fields.Add('RT_CUIL', vCuil);
          Sql.Fields.Add('RT_NOMBRE', vNombre );
          Sql.Fields.Add('RT_USUALTA', Sesion.UserID );
          Sql.Fields.Add('RT_FECHAALTA', exDateTime );
          Sql.Fields.Add('RT_REPETIDO', FRepetido);
          Sql.Fields.Add('RT_IDRG', sEsopIn);

          IdCabeceraNomina := ValorSqlInteger(
            ' SELECT cn_id '+
            '   FROM hys.hcn_cabeceranomina '+
            '  WHERE cn_cuit = '+SqlValue(FCUIT)+
            '    AND cn_estableci = '+ SqlValue(FEstableci)+
            '    AND CN_FECHARELEVAMIENTO = '+SqlValue(edFechaRelevamiento.Date));
          if IdCabeceraNomina = 0 then
          begin
            IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');
            Sql.Fields.Add('RT_IDCABECERANOMINA', IdCabeceraNomina );
            ActualizarAsignacionLote(
                IdCabeceraNomina,
                edFechaRelevamiento.Date,
                FCuit,
                FEstableci,
                True,
                edFechaRecep.Date,
                edFechaCoord.Date,
                edFechaImp.Date
            );
            EjecutarSQLST(Sql.Sql);
          end
          else begin
            Sql.Fields.Add('RT_IDCABECERANOMINA', IdCabeceraNomina );
            EjecutarSQLST(Sql.Sql);
            (*
            // La nómina ya existe, si está activa y tiene algún lote activo asociado,
            // notifica el alta del trabajador a la misma
            if ExisteSqlEx ('SELECT 1 ' +
                            '  FROM hys.hcn_cabeceranomina ' +
                            ' WHERE cn_id = :id ' +
                            '   AND cn_idestado = 1 ',
                            [IdCabeceraNomina]) and
               ExisteSqlEx ('SELECT 1 ' +
                            '  FROM afi.aem_empresa, ' +
                            '       afi.aco_contrato, ' +
                            '       afi.aes_establecimiento, ' +
                            '       hys.hde_descripcionestadolote, ' +
                            '       hys.hrl_relevamientolote, ' +
                            '       hys.hel_estadolote hel ' +
                            ' WHERE em_cuit = :pcuit ' +
                            '   AND em_id = co_idempresa ' +
                            '   AND co_contrato = es_contrato ' +
                            '   AND es_id = rl_idestableci ' +
                            '   AND de_tipoestado = ''A'' ' +
                            '   AND de_codigo = el_estado ' +
                            '   AND rl_nroestableci = :pestableci ' +
                            '   AND rl_id = el_rlid ' +
                            '   AND el_estado NOT IN (''T'', ''L'') ' +
                            '   AND el_operativo <> ''R''',
                            [FCUIT, FEstableci]) then
            begin
              FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TNC'));
              if FListaMail <> '' then
              begin
                FAsunto := 'Nuevo trabajador en nómina activa del CUIT ' + FCUIT +
                           '- Estab.' + IntToStr(FEstableci);
                FBody := 'Se ha incoporado el trabajador con CUIL '+ vCuil +
                         ' en la nómina de referencia con fecha de relevamiento ' + DateToStr(edFechaRelevamiento.Date);

                EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false)
              end
            end *)
          end;
          // El trabajador está repetido en otro establecimiento para el mismo operativo
          if FRepetido = 'S' then
          begin
            FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TDE'));
            if FListaMail <> '' then
            begin
              FAsunto := 'Trabajador existente con riesgo en otro establecimiento para el último relevamiento.';
              FBody := 'El trabajador con CUIL '+ vCuil +
                       ' ya existe con riesgo en otro establecimiento para el último relevamiento.';
              EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false)
            end
          end
        end;
      end
    end;

    conSemestral := ValorSql(
      ' SELECT DISTINCT ''S'' '+
      '   FROM art.aer_estriesg, art.prt_riestrab, hys.hcn_cabeceranomina '+
      '  WHERE rt_riesgo = er_riesgo '+
      '    AND er_fechabaja IS NULL '+
      '    AND cn_cuit = '+SqlValue(FCuit)+
      '    AND cn_estableci = '+SqlValue(FEstableci)+
      '    AND cn_fecharelevamiento = '+SqlValue(edFechaRelevamiento.Date)+
      '    AND cn_id = rt_idcabeceranomina '+
      '   AND er_periodicidad = 6 ') = 'S';

    EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina '+
                  '    SET cn_consemestral = '+SqlBoolean(conSemestral)+
                  '  WHERE cn_id = '+SqlValue(IdCabeceraNomina));

    ActualizarRelevamientos(FCUIT, FEstableci);
    sSQL := ' SELECT DISTINCT cn_fecharelevamiento, '' - '' || er_descripcion'+
            '            FROM hys.her_estadorelevamiento, hys.hcn_cabeceranomina '+
            '           WHERE er_id(+) = cn_idestado ' +
            '             AND cn_cuit = ' + SqlValue(FCUIT) +
            '             AND cn_estableci = ' + SqlValue(FEstableci)+
            ' UNION ALL '+
            ' SELECT DISTINCT sr_fecha, '' - SIN EXPUESTOS'' '+
            '            FROM psr_sinriesgo '+
            '           WHERE sr_cuit = '+ SqlValue(FCUIT)+
            '             AND sr_estableci = '+ SqlValue(FEstableci) +
            ' ORDER BY 1 DESC';
    fpAbmEsop.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al Asignar Esop.');
    end;
  end;
end;

procedure TfrmCargaMultipleRiesgos.tbLimpiarClick(Sender: TObject);
begin

  vclExtra.LockControls(edFechaRelevamiento,False);
  edFechaRelevamiento.Date := 0;
  inherited;
end;

procedure TfrmCargaMultipleRiesgos.fpAbmEsopKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '+' then
  begin
    tbAddEsopClick(nil);
    Key := #0;
    fraRiesgos.SetFocus;
  end
  else if key = '-' then
  begin
    tbDeleteEsopClick(nil);
    Key := #0;
    fraRiesgos.SetFocus;
  end;
end;

end.
