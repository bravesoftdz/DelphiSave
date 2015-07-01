unit unRiesgos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, General,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, CheckLst, ARTCheckListBox, unArtDbFrame,
  unFraTrabajador, ToolEdit, DateComboBox, Mask, JvExCheckLst, unComunes,
  JvCheckListBox, unArt, Menus, unrptImportacionNominas, unMoldeEnvioMail;

type
  TfrmRiesgos = class(TfrmCustomGridABM)
    lblRiesgos: TLabel;
    fraRiesgosFiltro: TfraCodigoDescripcion;
    lblCUIL: TLabel;
    Label1: TLabel;
    edFecha: TDateComboBox;
    cbSinExpuestos: TCheckBox;
    lblFechaInicioExp: TLabel;
    edFechaInicio: TDateComboBox;
    Label3: TLabel;
    fraTrabajador: TfraTrabajador;
    Label4: TLabel;
    lblRelevamiento: TLabel;
    clbRelevamiento: TJvCheckListBox;
    fraTrabajadorFiltro: TfraTrabajador;
    fraRiesgos: TfraCodigoDescripcion;
    tbSumatoria: TToolButton;
    pmnuOrden: TPopupMenu;
    mnuOrdSinOrdenRec: TMenuItem;
    N1: TMenuItem;
    mnuOrdEmpresa: TMenuItem;
    fpRelevamientoImpresion: TFormPanel;
    Bevel4: TBevel;
    Label27: TLabel;
    btnCopRecepAceptar: TButton;
    btnCopRecepCancelar: TButton;
    clbrelevamientoimpresion: TJvCheckListBox;
    tbBajaCabecera: TToolButton;
    sdqExportacion: TSDQuery;
    lblFechaIngreso: TLabel;
    edFechaIngreso: TDateComboBox;
    edSector: TEdit;
    lblSector: TLabel;
    lblTarea: TLabel;
    edTarea: TEdit;
    tbCargaMultiple: TToolButton;
    tbAsociarRelev: TToolButton;
    fpAsociarRelev: TFormPanel;
    Bevel8: TBevel;
    lblestablecimientos: TLabel;
    btnAceptarCambioPreventor: TButton;
    btnCancelarCambioPreventor: TButton;
    clbestablecimientos: TARTCheckListBox;
    Button3: TButton;
    tbCargarIncumplido: TToolButton;
    fpCargaRelevamientoInvalido: TFormPanel;
    Label2: TLabel;
    Bevel1: TBevel;
    btnFRecepAceptar: TButton;
    Button1: TButton;
    edFechaRecepcionInvalido: TDateEdit;
    cbNoCorrespondeESSOP: TCheckBox;
    cbFormularioInvalido: TCheckBox;
    procedure cbSinExpuestosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure mnuOrdEmpresaClick(Sender: TObject);
    procedure tbImprimirSeleccionadosClick(Sender: TObject);
    procedure btnCopRecepAceptarClick(Sender: TObject);
    procedure tbBajaCabeceraClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbCargaMultipleClick(Sender: TObject);
    procedure tbAsociarRelevClick(Sender: TObject);
    procedure tbCargarIncumplidoClick(Sender: TObject);
    procedure cbNoCorrespondeESSOPClick(Sender: TObject);
    procedure cbFormularioInvalidoClick(Sender: TObject);
    procedure btnFRecepAceptarClick(Sender: TObject);
  private
    { Private declarations }
    FEstableci: Integer;
    FCUIT: String;
    FIdEmpresa: integer;
    FContrato : Integer;
    FEliminacion : Boolean;
    procedure SetCuit(const Value: String);
    procedure SetEstableci(const Value: Integer);
    procedure fraTrabajadorChange(Sender: TObject);
//    procedure EliminarRelevamiento(aFechaRelev: TDateTime);
  protected
     procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    FGuardoInvalido : Boolean;
    procedure Load;
  published
    property CUIT             : String   read FCUIT             write SetCuit;
    property Estableci        : Integer  read FEstableci        write SetEstableci;
    property Contrato         : Integer  read FContrato         write FContrato;
  end;

const
  enActivo = 1;
  enErroneo = 2;
  enComplementario = 3;
  enInactivo = 5;

var
  frmRiesgos: TfrmRiesgos;

implementation

{$R *.dfm}
uses  unCustomConsulta, CustomDlgs, unDmPrincipal, StrFuncs, VCLExtra, SqlOracle,
      unSiniestros, unSesion, SQLFuncs, unConsVisitasRealizadas,
      unPrincipal, ArtFieldColletion, DateTimeFuncs, unComunesFet,
      unCargaMultipleRiesgos;

procedure TfrmRiesgos.cbSinExpuestosClick(Sender: TObject);
begin
  inherited;
  if cbSinExpuestos.Checked then
  begin
    VCLExtra.LockControls([edFechaInicio,fraRiesgos, fraTrabajador, edFechaIngreso, edSector, edTarea], true);
    edFechaInicio.Clear;
    edFechaIngreso.Clear;
    edSector.Clear;
    edTarea.Clear;
    fraRiesgos.Clear;
    fraTrabajador.Clear;
  end
  else
    VCLExtra.LockControls([edFechaInicio,fraRiesgos, fraTrabajador, edFechaIngreso, edSector, edTarea], false);
end;

procedure TfrmRiesgos.FormCreate(Sender: TObject);
begin
  inherited;
  ClearControls;
  FGuardoInvalido := False;
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  fratrabajador.MostrarRelaLaboral := False;
  fratrabajador.ShowBajas := True;
  tbImprimir.Enabled := False;
  with fraRiesgos do
  begin
    TableName   := 'PRG_RIESGOS';
    FieldID     := 'RG_CODIGO';
    FieldCodigo := 'RG_ESOP || rg_sufijoesop';
    FieldDesc   := 'RG_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'rg_fechabaja';
  end;

  with fraRiesgosFiltro do
  begin
    TableName   := 'PRG_RIESGOS';
    FieldID     := 'RG_CODIGO';
    FieldCodigo := 'RG_ESOP || rg_sufijoesop';
    FieldDesc   := 'RG_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'rg_fechabaja';
  end;

  fraTrabajador.OnChange := fraTrabajadorChange;
end;

procedure TfrmRiesgos.Load;
var
  sSQL :string;
begin
  fraRiesgosFiltro.Clear;
  fraTrabajadorFiltro.Clear;

  if ModoABM = maModificacion Then
    fraRiesgos.ShowBajas := true
  else
    fraRiesgos.ShowBajas := false;

  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;

  sSQL := ' SELECT DISTINCT cn_fecharelevamiento, '' - '' || er_descripcion || case when cn_idrelevasociado is null then '''' else '' (Asociado)'' end, cn_id idrelev ' +
          '            FROM hys.her_estadorelevamiento, hys.hcn_cabeceranomina '+
          '           WHERE er_id(+) = cn_idestado ' +
          '             AND cn_cuit = ' + SqlValue(FCUIT) +
          '             AND cn_estableci = ' + SqlValue(FEstableci)+
          ' UNION ALL '+
          ' SELECT DISTINCT sr_fecha, '' - SIN EXPUESTOS'' || case when sr_idrelevasociado is null then '''' else '' (Asociado)'' end, sr_id idrelev ' +
          '            FROM psr_sinriesgo '+
          '           WHERE sr_cuit = '+ SqlValue(FCUIT)+
          '             AND sr_estableci = '+ SqlValue(FEstableci) +
          ' UNION ALL '+
          ' SELECT DISTINCT ir_fecha, '' - INVALIDO'' , ir_id idrelev ' +
          '            FROM hys.hir_invalidoriesgo '+
          '           WHERE ir_cuit = '+ SqlValue(FCUIT)+
          '             AND ir_estableci = '+ SqlValue(FEstableci) +
          '             AND ir_fechabaja IS NULL '+
          ' ORDER BY 1 DESC';

  clbRelevamiento.Items.Clear;
  clbRelevamiento.Items.AddObject('Todos', TObject(0));
  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbRelevamiento.Items.AddObject(Fields[0].AsString + Fields[1].AsString, TObject(Fields[2].AsInteger));
      Next;
    end;
  finally
    Free;
  end;
  //clbRelevamiento.Checked[0]:= true;
  tbRefrescarClick(nil);
end;

procedure TfrmRiesgos.ClearControls;
begin
  fraRiesgos.Clear;
  fraTrabajador.Clear;
  fratrabajador.IdEmpresa := ValorSqlInteger(' SELECT em_id '+
                                             '   FROM aem_empresa '+
                                             ' WHERE em_cuit = '+SqlValue(FCUIT));
  edFecha.Clear;
  edFechaInicio.Clear;
  cbSinExpuestos.Checked:= False;
  edFechaIngreso.Clear;
  edSector.Clear;
  edTarea.Clear;
  VCLExtra.LockControls([edFecha, cbSinExpuestos,fraRiesgos, fraTrabajador,edFechaInicio, edFechaIngreso, edSector, edTarea], False);
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    fraTrabajador.Contrato := sdqConsulta.FieldByName('contrato').AsInteger
  else
    fraTrabajador.Contrato := ART_EMPTY_ID;
end;

function TfrmRiesgos.DoABM: Boolean;
var
  sSQL : string;
  IdCabeceraNomina : Integer;
//  format : TFormatSettings;
//  fecharelev : TDate;
  FRepetido,
  FAsunto,
  FBody,
  FListaMail: String;
  conSemestral : Boolean;
  ultrelev: TDate;
//  idHistorico: integer;
begin
  if ModoABM = maBaja Then
  begin
    if(sdqConsulta.FieldByName('TIPO').AsString = 'SIN RIESGO')then
    begin
      EjecutarSqlST(
        'DELETE PSR_SINRIESGO ' +
        ' WHERE SR_CUIT = ' + CUIT +
        '   AND SR_ESTABLECI = ' + SqlInt(Estableci)+
        '   AND SR_FECHA = ' + SqlDate(sdqConsulta.FieldByName('RT_FECHA').AsDateTime));

      if ExisteSqlEx ('SELECT 1 ' +
                      '  FROM hys.hur_ultimorelevamiento ' +
                      ' WHERE ur_cuit = :cuit ' +
                      '   AND ur_estableci = :nroestableci ' +
                      '   AND ur_fecharelev = ' + SqlDate(sdqConsulta.FieldByName('RT_FECHA').AsDateTime) +
                      '   AND ur_tiporelevamiento = ''S''',
                      [cuit, FEstableci]) then
      begin
        EliminarRelevamiento(FCUIT, FEstableci, sdqConsulta.FieldByName('RT_FECHA').AsDateTime);
      end;
    end
    else begin
      EjecutarSqlST(
        'DELETE ART.PRT_RIESTRAB ' +
        ' WHERE RT_CUIT = ' + CUIT +
        '   AND RT_ESTABLECI = ' + SqlInt(Estableci)+
        '   AND RT_FECHA = ' + SqlDate(sdqConsulta.FieldByName('RT_FECHA').AsDateTime)+
        '   AND RT_RIESGO = ' + SqlValue(sdqConsulta.FieldByName('RT_RIESGO').AsString)+
        '   AND RT_CUIL = ' + SqlValue(sdqConsulta.FieldByName('RT_CUIL').AsString));
    end;
  end
  else begin
    Sql.Clear;
    if not(cbSinExpuestos.Checked) then
    begin
      if ModoABM = maAlta Then
      begin
        if fraTrabajador.IsEmpty then
          EjecutarStoreSTEx('hys.do_actualizarrelaclabexpuestos(:cuit, :cuil, :nombretrab, :frelevamiento, :fechaingreso, ' +
                            '                                   :nroestab, :sector, :tarea, :usuario);',
                                                               [FCUIT, fraTrabajador.mskCUIL.Text, UpperCase(fraTrabajador.cmbNombre.Text), TDateTimeEx.Create(edFecha.Date), TDateTimeEx.Create(edFechaIngreso.Date),
                                                                FEstableci, edSector.Text, edTarea.Text, Sesion.LoginName])
        else
          EjecutarStoreSTEx('hys.do_actualizarrelaclabexpuestos(:cuit, :cuil, :nombretrab, :frelevamiento, :fechaingreso, ' +
                            '                                   :nroestab, :sector, :tarea, :usuario);',
                                                               [FCUIT, fraTrabajador.Cuil, fraTrabajador.Nombre, TDateTimeEx.Create(edFecha.Date), TDateTimeEx.Create(edFechaIngreso.Date),
                                                                FEstableci, edSector.Text, edTarea.Text, Sesion.LoginName]);

        if not ExisteSql( 'SELECT 1 '+
                          '   FROM DUAL '+
                          '  WHERE afiliacion.check_cobertura ('+SqlValue(FCUIT)+', '+
                                                    SqlValue(fraTrabajador.CUIL)+', '+
                              SqlValue(edFecha.Date)+
                              '                    ) NOT IN (21,22, 23, 35)') then
        begin

          InvalidMsg(fraTrabajador, 'El CUIL no esta asociado a la Empresa.');
          if not ExisteSql(' SELECT 1 ' +
                           ' FROM HYS.HIR_IMPORTACIONRECHAZADA ' +
                           ' WHERE IR_CUIT = ' + SqlValue(FCUIT) +
                           ' AND IR_ESTABLECI = ' + SqlValue(FEstableci) +
                           ' AND IR_CUIL = ' + SqlValue(fraTrabajador.mskCUIL.Text) +
                           ' AND IR_FECHARELEV = ' + SqlValue(edFecha.Date)) then
              EjecutarSqlST(
              ' INSERT INTO HYS.HIR_IMPORTACIONRECHAZADA '+
              '             (IR_ID, IR_CUIT, IR_ESTABLECI, IR_CUIL, IR_NOMBRE, IR_FECHAINICIO, '+
              '              IR_FECHAINGRESO, IR_TAREA, IR_SECTOR, IR_USUALTA, IR_FECHAALTA, IR_FECHARELEV '+
              '             ) '+
              '      VALUES (HYS.SEQ_HIR_ID.NEXTVAL, '+ SqlValue(FCUIT)+', '+SqlValue(FEstableci)+', '+
              SqlValue(fraTrabajador.mskCUIL.Text)+', '+SqlValue(fraTrabajador.cmbNombre.Text)+', '+ SqlDate(edFechaInicio.Date)+', '+ SqlDate(edFechaIngreso.Date)+', '+
              SqlValue(edTarea.Text)+','+ SqlValue(edSector.Text) +','+SqlValue(Sesion.UserID)+', SYSDATE, ' +  SqlValue(edFecha.Date) + ')');
          abort;
        end;

        FRepetido := 'N';
        if ExisteSql('SELECT 1 ' +
                     '  FROM art.prt_riestrab prt1 ' +
                     ' WHERE prt1.rt_cuit = ' + SqlValue(FCUIT) +
                     '   AND prt1.rt_cuil = ' + SqlValue(fraTrabajador.CUIL) +
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
        Sql.Fields.Add('RT_FECHA', edFecha.Date );
        Sql.Fields.Add('RT_FECHAINIEXPO', edFechaInicio.Date );
        Sql.Fields.Add('RT_RIESGO', fraRiesgos.AsString );
        Sql.Fields.Add('RT_CUIL', fraTrabajador.CUIL);
        Sql.Fields.Add('RT_NOMBRE', fraTrabajador.Nombre );
        Sql.Fields.Add('RT_USUALTA', Sesion.UserID );
        Sql.Fields.Add('RT_FECHAALTA', exDateTime );
        Sql.Fields.Add('RT_REPETIDO', FRepetido);
        Sql.Fields.Add('RT_IDRG',
            ValorSqlEx('SELECT  rg_id  '
                     + '  FROM  art.prg_riesgos  '
                     + ' WHERE  RG_CODIGO = :rtriesgo ',
                        [fraRiesgos.AsString]), dtString
        );

        IdCabeceraNomina := ValorSqlInteger(
            ' SELECT cn_id '+
            '   FROM hys.hcn_cabeceranomina '+
            '  WHERE cn_cuit = '+SqlValue(FCUIT)+
            '    AND cn_estableci = '+ SqlValue(FEstableci)+
            '    AND CN_FECHARELEVAMIENTO = '+SqlValue(edFecha.Date));
        if IdCabeceraNomina = 0 then
        begin
          IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');

          Sql.Fields.Add('RT_IDCABECERANOMINA', IdCabeceraNomina );

          ActualizarAsignacionLote(IdCabeceraNomina,edFecha.Date, CUIT, Estableci);

          EjecutarSQLST(Sql.Sql);

        end
        else begin
          Sql.Fields.Add('RT_IDCABECERANOMINA', IdCabeceraNomina );
          EjecutarSQLST(Sql.Sql);

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
              FBody := 'Se ha incoporado el trabajador con CUIL '+ fraTrabajador.CUIL +
                       ' en la nómina de referencia con fecha de relevamiento ' + DateToStr(edFecha.Date);

              EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false)
            end
          end
        end;

        conSemestral := ValorSql(
            ' SELECT DISTINCT ''S'' '+
            '   FROM art.aer_estriesg, art.prt_riestrab, hys.hcn_cabeceranomina '+
            '  WHERE rt_riesgo = er_riesgo '+
            '    AND er_fechabaja IS NULL '+
            '    AND cn_cuit = '+SqlValue(CUIT)+
            '    AND cn_estableci = '+SqlValue(Estableci)+
            '    AND cn_fecharelevamiento = '+SqlValue(edFecha.Date)+
            '    AND cn_id = rt_idcabeceranomina '+
            '   AND er_periodicidad = 6 ') = 'S';

        EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina '+
                      '    SET cn_consemestral = '+SqlBoolean(conSemestral)+
                      '  WHERE cn_id = '+SqlValue(IdCabeceraNomina));

        // El trabajador está repetido en otro establecimiento para el mismo operativo
        if FRepetido = 'S' then
        begin
          FListaMail := Trim(Get_DireccionesEnvioMail('HYS_TDE'));

          if FListaMail <> '' then
          begin
            FAsunto := 'Trabajador existente con riesgo en otro establecimiento para el último relevamiento.';
            FBody := 'El trabajador con CUIL '+ fraTrabajador.CUIL +
                     ' ya existe con riesgo en otro establecimiento para el último relevamiento.';

            EnviarMailBD(FListaMail, FAsunto, [oAutoFirma, oDeleteAttach], FBody, nil, 0, tcDefault, false)
          end
        end
      end;
    end
    else begin
      if ModoABM = maAlta Then
      begin
        ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                      '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                      '          FROM hys.hcn_cabeceranomina ' +
                                      '         WHERE cn_cuit = :cuit ' +
                                      '           AND cn_estableci = :estab ' +
                                      '           AND cn_idestado <> 6 ' +
                                      '        UNION ALL ' +
                                      '        SELECT sr_fecha fecha ' +
                                      '          FROM art.psr_sinriesgo ' +
                                      '         WHERE sr_cuit = :cuit ' +
                                      '           AND sr_estableci = :estab'+
                                      '        UNION ALL '+
                                      '        SELECT ir_fecha fecha' +
                                      '          FROM hys.hir_invalidoriesgo '+
                                      '         WHERE ir_cuit = :cuit'+
                                      '           AND ir_estableci = :estab '+
                                      '             AND ir_fechabaja IS NULL ) a ',[FCUIT, FEstableci]);


        Sql.TableName := 'ART.PSR_SINRIESGO';
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.Add('SR_CUIT',FCUIT);
        Sql.PrimaryKey.Add('SR_ESTABLECI', FEstableci );
        Sql.PrimaryKey.Add('SR_FECHA', edFecha.Date );
        Sql.PrimaryKey.Add('SR_FECHAALTA', exDateTime);
        Sql.PrimaryKey.Add('SR_USUALTA', Sesion.UserID);
        EjecutarSQLST(Sql.Sql);
        if (ultrelev < edFecha.Date) then
        begin
          EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_idcabrelevamientoactivo = NULL, ' +
                  '       al_usumodif = :pusuario, ' +
                  '       al_fechamodif = SYSDATE ' +
                  ' WHERE al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ',
                  [Sesion.UserID, fraTrabajador.IdEmpresa, FEstableci]);
          ActualizarUltRelevamiento (FCUIT, FEstableci, edFecha.Date, 'S');
        end;
      end;
    end;
  end;
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
          ' UNION ALL '+
          ' SELECT DISTINCT ir_fecha, '' - INVALIDO'' ' +
          '            FROM hys.hir_invalidoriesgo '+
          '           WHERE ir_cuit = '+ SqlValue(FCUIT)+
          '             AND ir_estableci = '+ SqlValue(FEstableci) +
          '             AND ir_fechabaja IS NULL '+
          ' ORDER BY 1 DESC';

  clbRelevamiento.Items.Clear;
  clbRelevamiento.Items.Add('Todos');
  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbRelevamiento.Items.Add(Fields[0].AsString + Fields[1].AsString);
      Next;
    end;
  finally
    Free;
  end;
  clbRelevamiento.Checked[0]:= true;
  result:= true;
end;


procedure TfrmRiesgos.LoadControls;
begin
  VCLExtra.LockControls([edFecha, cbSinExpuestos, edFechaInicio, fraRiesgos, fraTrabajador, edFechaIngreso, edSector, edTarea], True);
  edFecha.Date := sdqConsulta.fieldbyname('RT_FECHA').AsDateTime;
  if(sdqConsulta.fieldbyname('TIPO').AsString = 'SIN RIESGO') then
    cbSinExpuestos.Checked := True
  else
    cbSinExpuestos.Checked := False;
  edFechaInicio.Date := sdqConsulta.fieldbyname('RT_FECHAINIEXPO').AsDateTime;
  fraRiesgos.Codigo := sdqConsulta.fieldbyname('RT_RIESGONUEVO').AsString;
  fraTrabajador.CUIL := sdqConsulta.fieldbyname('RT_CUIL').AsString;
  edFechaIngreso.Date := sdqConsulta.fieldbyname('FECHAINGRESO').AsDateTime;
  edSector.Text := sdqConsulta.fieldbyname('SECTOR').AsString;
  edTarea.Text := sdqConsulta.fieldbyname('TAREA').AsString;
end;

function TfrmRiesgos.Validar: Boolean;
var
 qry: TSDQuery;
 sSQL : string;
 fechanacimiento : TDate;
// ultimoperiodo : string;
begin
  result := true;
  if ModoABM = maAlta Then
  begin
    Verificar(IsEmptyString(edFecha.Text),edFecha,'Debe cargar la fecha de Exposición');
    Verificar(edFecha.Date> date,edFecha,'La fecha no puede ser mayor que hoy.');
    Verificar(edFecha.Date< edFechaInicio.Date,edFechaInicio,'La fecha de inicio de exposición no puede ser mayor que la fecha.');
    Verificar(edFechaIngreso.Date> edFechaInicio.Date, edFechaIngreso,'La fecha de inicio de exposicion no puede ser menor que la fecha de ingreso.' );
    Verificar(not ExisteSql(
      ' SELECT 1 '+
      '   FROM afi.aco_contrato '+
      '  WHERE co_contrato = '+SqlValue(Contrato)+
      '    AND '+SqlValue(edFecha.Date)+' BETWEEN co_vigenciadesde AND co_vigenciahasta'),edFecha,'La fecha del relevamiento debe estar dentro de las vigencias del contrato.');

    fechanacimiento := ValorSqlDateTime(
                ' SELECT tj_fnacimiento '+
                '   FROM comunes.ctj_trabajador '+
                '  WHERE tj_cuil = '+ SqlValue(fraTrabajador.CUIL));
    if (fechanacimiento <> 0) then
      Verificar(fechanacimiento > edFechaIngreso.Date, edFechaIngreso,'La Fecha de Nacimiento no puede ser mayor a la fecha de Ingreso.' );
    if not(cbSinExpuestos.Checked) then
    begin
      Verificar(fraRiesgos.IsEmpty, fraRiesgos.edCodigo, 'Debe cargar el agente de Riesgo.');
//      Verificar(fraTrabajador.IsEmpty, fraTrabajador.mskCUIL, 'Debe cargar el trabajador expuesto.');
//      Verificar(not Is_RelacionLaboralActual_o_Historica(FCUIT, fraTrabajador.CUIL), fraTrabajador.mskCUIL,
//               'El trabajador no pertenece ni perteneció nunca a la empresa en nuestra base de datos.');
    end;

(* Ticket 1653
      Verificar(ExisteSql(
                  ' SELECT distinct 1 '+
                  '  FROM prt_riestrab '+
                  ' WHERE rt_cuit = '+ SqlValue(FCUIT)+
                  '   AND rt_estableci <> '+SqlValue(FEstableci)+
                  '   AND rt_cuil = '+SqlValue(fraTrabajador.CUIL)+
                  '   AND to_char(rt_fecha,''YYYY'') = to_char(art.actualdate,''YYYY'') '),fraTrabajador,
                  'El trabajador existe con riesgo en otro establecimiento.');
*)

(*
    if not cbSinExpuestos.Checked then
    begin
      //ultimoperiodo := ValorSql('SELECT COBRANZA.Get_UltPeriodoDevengado(''D'') FROM DUAL');
      Verificar(not ExisteSql(  'SELECT 1 '+
                            '   FROM DUAL '+
                            '  WHERE afiliacion.check_cobertura ('+SqlValue(FCUIT)+', '+
                                                  SqlValue(fraTrabajador.CUIL)+', '+
                            SqlValue(edFecha.Date)+
                            '                    ) NOT IN (21,22, 23, 35)'),fraTrabajador,
                            'El CUIL no esta asociado a la Empresa.')

    end;
*)    

    if (cbSinExpuestos.Checked) then
        qry := GetQuery( ' SELECT 1 '+
                         '   FROM PRT_RIESTRAB '+
                         '  WHERE RT_CUIT = '+SqlValue(FCUIT)+
                         '    AND RT_ESTABLECI = '+ SqlValue(FEstableci)+
                         '    AND RT_FECHA = '+ SqlDate(edFecha.Date))
    else
        qry := GetQuery( ' SELECT 1 '+
                         '   FROM PSR_SINRIESGO '+
                         '  WHERE SR_CUIT = '+SqlValue(FCUIT)+
                         '    AND SR_ESTABLECI = '+ SqlValue(FEstableci)+
                         '    AND SR_FECHA = '+ SqlDate(edFecha.Date));

    if (cbSinExpuestos.Checked) then
      Verificar( qry.Fields[0].AsString = '1', edFecha,'Se encontraron expuestos para la misma fecha.')
    else
      Verificar( qry.Fields[0].AsString = '1', edFecha, 'En esta fecha el establecimiento ha sido marcado como ''Sin Expuestos''.');

    qry.Free;

    if not(cbSinExpuestos.Checked) then
      sSQL := ' SELECT 1 '+
              '   FROM PRT_RIESTRAB '+
              '  WHERE RT_CUIT = '+SqlValue(FCUIT)+
              '    AND RT_ESTABLECI = '+ SqlValue(FEstableci)+
              '    AND RT_FECHA = '+ SqlDate(edFecha.Date)+
              '    AND RT_CUIL = '+ SqlValue(fraTrabajador.CUIL)+
              '    AND rt_riesgo = '+SqlValue(fraRiesgos.AsString)
    else
      sSQL :=' SELECT 1 '+
             '   FROM PSR_SINRIESGO '+
             '  WHERE SR_CUIT = '+SqlValue(FCUIT)+
             '    AND SR_ESTABLECI = '+ SqlValue(FEstableci)+
             '    AND SR_FECHA = '+ SqlDate(edFecha.Date);

    with GetQuery(sSQL) do
    try
      if(cbSinExpuestos.Checked) then
        Verificar( Fields[0].AsString = '1', edFecha,'Ya existe el reporte de sin expuestos para esa fecha.')
      else
        Verificar( Fields[0].AsString = '1', edFecha,'Ya existe exposicion para ese trabajador en esa fecha.');
    finally
      Free;
    end;

(*
    // Analizo si hay una nómina activa
    if (ModoABM = maAlta) and
       cbSinExpuestos.Checked and
       ExisteSqlEx('SELECT 1 ' +
                   '  FROM hys.hcn_cabeceranomina ' +
                   ' WHERE cn_idestado = 1 ' +
                   '   AND cn_cuit = :pcuit ' +
                   '   AND cn_estableci = :pestableci ',
                   [FCUIT, FEstableci]) and
      (MsgBox('Existe un relevamiento activo. Desea incoporar el "Sin Expuestos" de todas formas?', MB_ICONQUESTION + MB_YESNO) <> mrYes) then
        Verificar(true, cbSinExpuestos, 'No se ingresará el relevamiento "Sin Expuestos" ya que existe otro activo.')
*)
  end;
end;

procedure TfrmRiesgos.SetCuit(const Value: String);
begin
  if (FCUIT <> Value) then
  begin
    FCUIT := Value;
    FIdEmpresa := ValorSqlIntegerEx('SELECT EM_ID FROM AFI.AEM_EMPRESA WHERE EM_CUIT = :cuit', [FCUIT]);
  end;
end;

procedure TfrmRiesgos.SetEstableci(const Value: Integer);
begin
  if (FEstableci <> Value) then
    FEstableci := Value;
end;


procedure TfrmRiesgos.tbRefrescarClick(Sender: TObject);
var
  sSQL, sSQL2 : String;
  i   : Integer;
  flag :Boolean;
  format : TFormatSettings;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  flag := false;
  sSQL2 := '';

  sSQL :=
  ' SELECT   rt_id ,rt_fecha, ''CON RIESGO'' tipo, rt_riesgo, '+
  '          TRIM ((NVL (rg_esop, '''') || NVL (rg_sufijoesop, ''''))) rt_riesgonuevo,'+
  '          rg_descripcion, rt_cuil, rt_fechainiexpo, '+
  '          NVL (tj_nombre, rt_nombre) nombre, TO_CHAR (NULL) sector, '+
  '          TO_CHAR (NULL) tarea, TO_DATE (NULL) fechaingreso, '+
  '          art.afiliacion.get_contratovigente(rt_cuit, rt_fecha) as contrato, '+
  '          rt_fechaalta AS fechaalta, rt_usualta AS usualta, CN_FECHARECEPCIONPREV fecharecepprev, CN_FECHARECEPCIONCOR fecharecepcord '+
  '     FROM ctj_trabajador, prg_riesgos, prt_riestrab, hys.hcn_cabeceranomina '+
  '    WHERE rt_riesgo = rg_codigo '+
  '      AND rt_idcabeceranomina = cn_id '+
  '      AND rt_cuil = tj_cuil(+) '+
  '      AND rt_cuit = :cuit '+
  '      AND rt_estableci = :estableci ';
  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSQL2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSQL2 := sSQL2+ ' OR ';
        sSQL2 := sSQL2 + ' RT_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i],1,10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSQL2 := sSQL2 + ' )';
  end;
  if flag then
    sSQL := sSQL + sSQL2
  else if not clbRelevamiento.Checked[0] then
    sSQL := sSQL + ' AND 1 = 2';

  if not fraRiesgosFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_RIESGO = ' + SqlValue(fraRiesgosFiltro.AsString);
  if not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_CUIL = ' + SqlValue(fraTrabajadorFiltro.CUIL);

  flag := false;
  sSQL2 := '';

  sSQL := sSQL +
    ' AND NOT EXISTS ( '+
    '        SELECT 1 '+
    '          FROM crl_relacionlaboral '+
    '         WHERE rl_contrato = '+
    '                        afiliacion.get_contratovigente (rt_cuit, rt_fecha) '+
    '           AND rl_idtrabajador = tj_id) '+
    ' UNION '+
    ' SELECT   rt_id ,rt_fecha, ''CON RIESGO'' tipo, rt_riesgo, '+
    '          TRIM ((NVL (rg_esop, '''') || NVL (rg_sufijoesop, ''''))) rt_riesgonuevo, '+
    '          rg_descripcion, rt_cuil, rt_fechainiexpo, '+
    '          NVL (tj_nombre, rt_nombre) nombre, rl_sector sector, rl_tarea tarea, '+
    '          rl_fechaingreso fechaingreso, rl_contrato as contrato, '+
    '          rt_fechaalta AS fechaalta, rt_usualta AS usualta, CN_FECHARECEPCIONPREV fecharecepprev, CN_FECHARECEPCIONCOR fecharecepcord '+
    '     FROM crl_relacionlaboral, ctj_trabajador, prg_riesgos, prt_riestrab, hys.hcn_cabeceranomina '+
    '    WHERE rt_riesgo = rg_codigo '+
    '      AND rt_idcabeceranomina = cn_id '+
    '      AND rt_cuil = tj_cuil(+) '+
    '      AND rt_cuit = :cuit '+
    '      AND rt_estableci = :estableci ';
  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSQL2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSQL2 := sSQL2+ ' OR ';
        sSQL2 := sSQL2 + ' RT_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i],1,10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSQL2 := sSQL2 + ' )';
  end;
  if flag then
    sSQL := sSQL + sSQL2
  else if not clbRelevamiento.Checked[0] then
    sSQL := sSQL + ' AND 1 = 2';

  if not fraRiesgosFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_RIESGO = ' + SqlValue(fraRiesgosFiltro.AsString);
  if not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_CUIL = ' + SqlValue(fraTrabajadorFiltro.CUIL);

  flag := false;
  sSQL2 := '';

  sSQL := sSQL +
     ' AND rl_contrato = afiliacion.get_contratovigente (rt_cuit, rt_fecha) '+
     ' AND rl_idtrabajador = tj_id '+
     ' UNION ALL '+
     ' SELECT   null sr_id,sr_fecha, ''SIN RIESGO'' tipo, NULL rt_riesgo, NULL rt_riesgonuevo, '+
     '          NULL rg_descripcion, NULL rt_cuil, NULL rt_fechainiexpo, NULL nombre, '+
     '          NULL sector, NULL tarea, NULL fechaingreso, '+
     '          art.afiliacion.get_contratovigente(sr_cuit, sr_fecha) as contrato, '+
     '          sr_fechaalta AS fechaalta, sr_usualta AS usualta, NULL fecharecepprev, NULL fecharecepcord '+
     '     FROM art.psr_sinriesgo '+
     '    WHERE sr_cuit = :cuit AND sr_estableci = :estableci ';
  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSQL2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSQL2 := sSQL2+ ' OR ';
        sSQL2 := sSQL2 + ' SR_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i],1,10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSQL2 := sSQL2 + ' ) ';
  end;
  if flag then
    sSQL := sSQL + sSQL2
  else if not clbRelevamiento.Checked[0] then
    sSQL := sSQL + ' AND 1 = 2';

  if not fraRiesgosFiltro.IsEmpty  or not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND 1 = 2';
  sSQL := sSQL + ' ORDER BY rt_riesgo, rt_cuil, nombre ';
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(sSQL);
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  inherited;
end;

procedure TfrmRiesgos.tbLimpiarClick(Sender: TObject);
begin
  fraRiesgosFiltro.Clear;
  fraTrabajadorFiltro.Clear;
  clbRelevamiento.UnCheckAll;
  clbRelevamiento.Checked[0]:=true;
  inherited;

end;

procedure TfrmRiesgos.tbSumatoriaClick(Sender: TObject);
var
  cant, cant2,i : Integer;
  sSql, sSql2 : string;
  flag : boolean;
  format : TFormatSettings;
begin
  tbRefrescarClick(nil);
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';

  cant := sdqConsulta.RecordCount;
  sSql :=
    ' SELECT COUNT (DISTINCT rt_cuil) '+
    '   FROM prt_riestrab '+
    '  WHERE rt_cuit = '+ SqlValue(FCUIT)+
    '    AND rt_estableci = '+ SqlValue(FEstableci);

  flag := false;
  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSql2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSql2 := sSql2+ ' OR ';
        sSql2 := sSql2 + ' RT_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i], 1, 10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSql2 := sSql2 + ' ) ';
  end;
  if flag then
    sSql := sSql + sSql2;

  if not fraRiesgosFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_RIESGO = ' + SqlValue(fraRiesgosFiltro.AsString);
  if not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_CUIL = ' + SqlValue(fraTrabajadorFiltro.CUIL);
    with GetQuery(sSQL) do
    try
      cant2 := Fields[0].AsInteger;
    finally
      Free;
    end;
  MsgBox('La Cantidad de Registros:'+SqlInt(cant)+'. Cantidad de trabajadores expuestos :'+SqlInt(cant2));
end;

procedure TfrmRiesgos.mnuOrdEmpresaClick(Sender: TObject);
var
  sSQL : String;
begin

  sSQL := ' SELECT cn_fecharelevamiento '+
          '            FROM hys.hcn_cabeceranomina '+
          '           WHERE cn_cuit = '+SqlValue(FCUIT) +
          '             AND cn_estableci = '+SqlValue(FEstableci)+
          ' UNION ALL '+
          ' SELECT DISTINCT sr_fecha '+
          '            FROM psr_sinriesgo '+
          '           WHERE sr_cuit = '+ SqlValue(FCUIT)+
          '             AND sr_estableci = '+ SqlValue(FEstableci) +
          ' ORDER BY 1 DESC';
  clbrelevamientoimpresion.Items.Clear;

  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbrelevamientoimpresion.Items.Add(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
  FEliminacion := False;
  fpRelevamientoImpresion.ShowModal;
end;

procedure TfrmRiesgos.tbImprimirSeleccionadosClick(Sender: TObject);
var
  fecharelev : TDate;
  format : TFormatSettings;
  i : Integer;
begin
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';
  i := 0;
  while i < clbrelevamientoimpresion.Items.Count do
  begin
    if clbrelevamientoimpresion.Checked[i] then
    begin
      fecharelev := strtodatedef(Copy(clbrelevamientoimpresion.Items.Strings[i],1,10),0,format);
      with TrptImportacionNominas.Create(Self) do
      try
        Load(FCUIT, FEstableci, fecharelev);
      finally
        Free;
      end;
    end;
    i := i+1;
  end;
  fpRelevamientoImpresion.ModalResult := mrOk;
end;

procedure TfrmRiesgos.btnCopRecepAceptarClick(Sender: TObject);
var
  fecharelev : TDate;
  format : TFormatSettings;
  i : Integer;
  sSQL : String;
  idCabecera, estado : Integer;
begin
  if not FEliminacion then
    tbImprimirSeleccionadosClick(nil)
  else
  begin
    format.DateSeparator := '/';
    format.ShortDateFormat := 'dd/mm/yyyy';
    i := 0;
    while i < clbrelevamientoimpresion.Items.Count do
    begin
      if clbrelevamientoimpresion.Checked[i] then
      begin
        fecharelev := strtodatedef(Copy(clbrelevamientoimpresion.Items.Strings[i],1,10),0,format);
        idCabecera := ValorSqlInteger(
        ' SELECT cn_id '+
        '   FROM hys.hcn_cabeceranomina '+
        '  WHERE cn_cuit = '+SqlValue(FCUIT)+
        '    AND cn_estableci = '+SqlValue(FEstableci)+
        '    AND cn_fecharelevamiento = '+SqlValue(fecharelev));

        estado := ValorSqlIntegerEx('SELECT cn_idestado FROM hys.hcn_cabeceranomina WHERE cn_id = :id', [idCabecera]);
        if (estado = enActivo) then
          EliminarRelevamiento(FCUIT, FEstableci, fecharelev);

        EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina '+
                      ' SET cn_idestado = 6 ' +
                      ' WHERE cn_id = '+SqlValue(idCabecera));

      end;
      i := i+1;
    end;

(*
    i := 0;
    while i < clbrelevamientoimpresion.Items.Count do
    begin
      if clbrelevamientoimpresion.Checked[i] then
      begin
        fecharelev := strtodatedef(Copy(clbrelevamientoimpresion.Items.Strings[i],1,10),0,format);
        if ExisteSql(
          ' SELECT distinct 1 '+
          '   FROM hys.hrl_relevamientolote, '+
          '        afi.aem_empresa, '+
          '        afi.aes_establecimiento, '+
          '        afi.aco_contrato '+
          '  WHERE em_id = co_idempresa '+
          '    AND co_contrato = es_contrato '+
          '    AND co_contrato = art.afiliacion.get_contratovigente (em_cuit, rl_fecha) '+
          '    AND rl_idestableci = es_id '+
          '    AND rl_fecha = '+SqlValue(fecharelev)+
          '    AND em_cuit = '+SqlValue(FCUIT)+
          '    AND es_nroestableci = '+SqlValue(FEstableci))
        then
          MsgBox('Este relevamiento '+Copy(clbrelevamientoimpresion.Items.Strings[i],1,10)+' tiene registros relacionados con Medicina Laboral.')
        else
        begin
          idCabecera := ValorSqlInteger(
          ' SELECT cn_id '+
          '   FROM hys.hcn_cabeceranomina '+
          '  WHERE cn_cuit = '+SqlValue(FCUIT)+
          '    AND cn_estableci = '+SqlValue(FEstableci)+
          '    AND cn_fecharelevamiento = '+SqlValue(fecharelev));
          EjecutarSqlST(
            ' DELETE FROM art.prt_riestrab '+
            '       WHERE rt_idcabeceranomina = '+SqlValue(idCabecera));
          EjecutarSqlST(
            ' DELETE hys.hcn_cabeceranomina '+
            '  WHERE cn_id = '+SqlValue(idCabecera));
        end;
      end;
      i := i+1;
    end;
*)    
    fpRelevamientoImpresion.ModalResult := mrOk;

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
            ' UNION ALL '+
            ' SELECT DISTINCT ir_fecha, '' - INVALIDO'' ' +
            '            FROM hys.hir_invalidoriesgo '+
            '           WHERE ir_cuit = '+ SqlValue(FCUIT)+
            '             AND ir_estableci = '+ SqlValue(FEstableci) +
            '             AND ir_fechabaja IS NULL '+
            ' ORDER BY 1 DESC';

    clbRelevamiento.Items.Clear;
    clbRelevamiento.Items.Add('Todos');
    with GetQuery(sSQL) do
    try
      while not Eof do
      begin
        clbRelevamiento.Items.Add(Fields[0].AsString + Fields[1].AsString);
        Next;
      end;
    finally
      Free;
    end;
    clbRelevamiento.Checked[0]:= true;
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmRiesgos.tbBajaCabeceraClick(Sender: TObject);
var
  sSQL : String;
begin
  sSQL := ' SELECT DISTINCT cn_fecharelevamiento '+
          '            FROM hys.hcn_cabeceranomina ' +
          '           WHERE cn_cuit = '+ SqlValue(FCUIT) +
          '             AND cn_estableci = '+ SqlValue(FEstableci)+
          ' ORDER BY 1 DESC';
  clbrelevamientoimpresion.Items.Clear;

  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbrelevamientoimpresion.Items.Add(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
  FEliminacion := True;
  fpRelevamientoImpresion.ShowModal;
end;

procedure TfrmRiesgos.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
  sSQLsdq, sSQL, sSQL2 : String;
  i : Integer;
  flag : boolean;
  format : TFormatSettings;
begin
  flag := False;
  format.DateSeparator := '/';
  format.ShortDateFormat := 'dd/mm/yyyy';

  sSQL :=
      ' SELECT DISTINCT rt_cuil AS "Cuil", NVL (tj_nombre, rt_nombre) AS "Nombre", '+
      '                 TO_DATE (NULL) AS "Fecha Ingreso", '+
      '                 rt_fechainiexpo AS "Fecha de Inicio de Exposición", '+
      '                 TO_CHAR (NULL) AS "Sector", TO_CHAR (NULL) AS "Tarea", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            1 '+
      '                                           ) AS "Riesgo 1", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            2 '+
      '                                           ) AS "Riesgo 2", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            3 '+
      '                                           ) AS "Riesgo 3", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            4 '+
      '                                           ) AS "Riesgo 4", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            5 '+
      '                                           ) AS "Riesgo 5", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            6 '+
      '                                           ) AS "Riesgo 6", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            7 '+
      '                                           ) AS "Riesgo 7", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            8 '+
      '                                           ) AS "Riesgo 8", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            9 '+
      '                                           ) AS "Riesgo 9", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            10 '+
      '                                           ) AS "Riesgo 10", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            11 '+
      '                                           ) AS "Riesgo 11", '+
      '                 art.hys.get_esop_asociado (rt_cuit, '+
      '                                            rt_estableci, '+
      '                                            rt_fecha, '+
      '                                            rt_cuil, '+
      '                                            12 '+
      '                                           ) AS "Riesgo 12" '+
      '            FROM ctj_trabajador, prg_riesgos, prt_riestrab '+
      '           WHERE rt_riesgo = rg_codigo '+
      '             AND rt_cuil = tj_cuil(+) '+
      '             AND rt_cuit = :cuit '+
      '             AND rt_estableci = :estableci';

  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSQL2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSQL2 := sSQL2+ ' OR ';
        sSQL2 := sSQL2 + ' RT_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i],1,10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSQL2 := sSQL2 + ' )';
  end;
  if flag then
    sSQL := sSQL + sSQL2
  else if not clbRelevamiento.Checked[0] then
    sSQL := sSQL + ' AND 1 = 2';

  if not fraRiesgosFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_RIESGO = ' + SqlValue(fraRiesgosFiltro.AsString);
  if not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_CUIL = ' + SqlValue(fraTrabajadorFiltro.CUIL);

  flag := false;
  sSQL2 := '';

  sSQL := sSQL +
      '             AND NOT EXISTS ( '+
      '                             SELECT 1 '+
      '                               FROM crl_relacionlaboral '+
      '                              WHERE rl_contrato = '+
      '                                       afiliacion.get_contratovigente (rt_cuit, '+
      '                                                                       rt_fecha) '+
      '                                AND rl_idtrabajador = tj_id) '+
      '          UNION '+
      '          SELECT   rt_cuil AS "Cuil", NVL (tj_nombre, rt_nombre) AS "Nombre", '+
      '                   rl_fechaingreso AS "Fecha Ingreso", '+
      '                   rt_fechainiexpo AS "Fecha de Inicio de Exposición", '+
      '                   rl_sector AS "Sector", rl_tarea AS "Tarea", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              1 '+
      '                                             ) AS "Riesgo 1", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              2 '+
      '                                             ) AS "Riesgo 2", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              3 '+
      '                                             ) AS "Riesgo 3", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              4 '+
      '                                             ) AS "Riesgo 4", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              5 '+
      '                                             ) AS "Riesgo 5", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              6 '+
      '                                             ) AS "Riesgo 6", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              7 '+
      '                                             ) AS "Riesgo 7", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              8 '+
      '                                             ) AS "Riesgo 8", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              9 '+
      '                                             ) AS "Riesgo 9", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              10 '+
      '                                             ) AS "Riesgo 10", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              11 '+
      '                                             ) AS "Riesgo 11", '+
      '                   art.hys.get_esop_asociado (rt_cuit, '+
      '                                              rt_estableci, '+
      '                                              rt_fecha, '+
      '                                              rt_cuil, '+
      '                                              12 '+
      '                                             ) AS "Riesgo 12" '+
      '              FROM crl_relacionlaboral, ctj_trabajador, prg_riesgos, prt_riestrab '+
      '             WHERE rt_riesgo = rg_codigo '+
      '               AND rt_cuil = tj_cuil(+) '+
      '               AND rt_cuit = :cuit '+
      '               AND rt_estableci = :estableci ';
  if not clbRelevamiento.Checked[0] then
  begin
    i := 1;
    sSQL2 := ' AND ( ';
    while i < clbRelevamiento.Items.Count do
    begin
      if clbRelevamiento.Checked[i] then
      begin
        if flag then
        sSQL2 := sSQL2+ ' OR ';
        sSQL2 := sSQL2 + ' RT_FECHA = '+ SqlDate(strtodatedef(Copy(clbRelevamiento.Items.Strings[i],1,10),0,format));
        flag := true;
      end;
      i := i+1;
    end;
    sSQL2 := sSQL2 + ' )';
  end;
  if flag then
    sSQL := sSQL + sSQL2
  else if not clbRelevamiento.Checked[0] then
    sSQL := sSQL + ' AND 1 = 2';

  if not fraRiesgosFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_RIESGO = ' + SqlValue(fraRiesgosFiltro.AsString);
  if not fraTrabajadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND RT_CUIL = ' + SqlValue(fraTrabajadorFiltro.CUIL);

//  flag := false;
  sSQL2 := '';

  sSQL := sSQL +
      '               AND rl_contrato = afiliacion.get_contratovigente (rt_cuit, rt_fecha) '+
      '               AND rl_idtrabajador = tj_id '+
      '          ORDER BY 1,2 ';

  sSQLsdq := sdqConsulta.SQL.Text;

  ExportDialog.DataSet := sdqExportacion;
  sdqExportacion.SQL.Clear;
  sdqExportacion.SQL.Add(sSQL);
  sdqExportacion.ParamByName('cuit').AsString := FCUIT;
  sdqExportacion.ParamByName('estableci').AsInteger := FEstableci;
  sdqExportacion.Open;

  if DataSource.DataSet.Active and (not DataSource.DataSet.IsEmpty) then begin
     tbExportar.Enabled := False;
     Try
       AutoCols  := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
         begin
         for i:=0 to sdqExportacion.Fields.Count-1 do
           with ExportDialog.Fields.Add do
           begin
            Title := sdqExportacion.Fields[i].FieldName;
            DataField := sdqExportacion.Fields[i].FieldName;
           end;

//           ExportDialog.Fields.Assign( sdqConsulta.);
         end;
         ExportDialog.Execute ;

       finally
         if AutoCols Then
            ExportDialog.Fields.Clear ;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
  sdqExportacion.Close;
end;

procedure TfrmRiesgos.fraTrabajadorChange(Sender: TObject);
begin
  if fraTrabajador.IsSelected then
  begin
    with GetQuery(' SELECT rl_fechaingreso, rl_sector, rl_tarea ' +
                  ' FROM crl_relacionlaboral ' +
                  ' WHERE rl_idtrabajador = ' + SqlValue(fraTrabajador.Value) +
                  ' AND rl_contrato = art.afiliacion.get_contratovigente(' + SqlValue(FCUIT) + ' , ' + SqlValue(edFecha.Date) + ')') do
    try
      edFechaIngreso.Date := FieldByName('rl_fechaingreso').AsDateTime;
      edFechaInicio.Date := edFechaIngreso.Date;
      edSector.Text := FieldByName('rl_sector').AsString;
      edTarea.Text := FieldByName('rl_tarea').AsString;
    finally
      free;
    end;
  end
  else begin
    edFechaIngreso.Clear;
    edFechaInicio.Clear;
    edSector.Clear;
    edTarea.Clear;
  end;
end;

(*
procedure TfrmRiesgos.EliminarRelevamiento(aFechaRelev: TDateTime);
var
  idCabecera: integer;
  idHistorico: integer;
  fecharelev: TDateTime;
  ultrelev: TDateTime;
begin
  ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                  '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                  '          FROM hys.hcn_cabeceranomina ' +
                                  '         WHERE cn_cuit = :cuit ' +
                                  '           AND cn_estableci = :estab ' +
                                  '           AND cn_idestado <> 6 ' +
                                  '           AND cn_fecharelevamiento <> ' + SqlValue(aFechaRelev) +
                                  '        UNION ALL ' +
                                  '        SELECT sr_fecha fecha ' +
                                  '          FROM art.psr_sinriesgo ' +
                                  '         WHERE sr_cuit = :cuit ' +
                                  '           AND sr_fecha <> ' + SqlValue(aFechaRelev) +
                                  '           AND sr_estableci = :estab) a ',[FCUIT, FEstableci]);
  if not (ultrelev > aFechaRelev) then
  begin
    if ExisteSql(' SELECT 1 '+
                 '   FROM PSR_SINRIESGO ' +
                 '  WHERE SR_CUIT = ' + SqlValue(FCUIT) +
                 '    AND SR_ESTABLECI = ' + SqlValue(FEstableci) +
                 '    AND SR_FECHA = ' + SqlDate(ultrelev)) then
    begin
      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
              '   SET al_idcabrelevamientoactivo = NULL, ' +
              '       al_usumodif = :pusuario, ' +
              '       al_fechamodif = SYSDATE ' +
              ' WHERE al_idempresa = :pidempresa ' +
              '   AND al_nroestableci = :pnroestableci ',
              [Sesion.UserID, FIDEmpresa, FEstableci]);
      ActualizarUltRelevamiento (FCUIT, FEstableci, ultrelev, 'S');
    end
    else
      EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina ' +
                    ' SET cn_idestado = 1 ' +
                    ' WHERE cn_cuit = ' + SqlValue(FCUIT) +
                    ' AND cn_estableci ' + SqlValue(FEstableci) +
                    ' AND cn_fecharelevamiento = ' + SqlValue(ultrelev)
                    );

      idCabecera :=  ValorSql(' SELECT cn_id ' +
                              ' FROM hys.hcn_cabeceranomina ' +
                              ' WHERE cn_cuit = ' + SqlValue(FCUIT) +
                              ' AND cn_estableci ' + SqlValue(FEstableci) +
                              ' AND cn_idestado <> 6 ' +
                              ' AND cn_fecharelevamiento = ' + SqlValue(ultrelev));

      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
              '   SET al_idcabrelevamientoactivo = :idrelev, ' +
              '       al_usumodif = :pusuario, ' +
              '       al_fechamodif = SYSDATE ' +
              ' WHERE al_idempresa = :pidempresa ' +
              '   AND al_nroestableci = :pnroestableci ',
              [idCabecera, Sesion.UserID, FIDEmpresa, FEstableci]);
      ActualizarUltRelevamiento (FCUIT, FEstableci, ultrelev, 'E');
  end;
end;
*)

procedure TfrmRiesgos.tbCargaMultipleClick(Sender: TObject);
var
  sSQL : String;
begin
  with TfrmCargaMultipleRiesgos.Create(Self) do
  try
    Visible := False;
    Carga(Contrato,Estableci);
    ShowModal;
  finally
    Free;
  end;
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
            ' UNION ALL '+
            ' SELECT DISTINCT ir_fecha, '' - INVALIDO'' ' +
            '            FROM hys.hir_invalidoriesgo '+
            '           WHERE ir_cuit = '+ SqlValue(FCUIT)+
            '             AND ir_estableci = '+ SqlValue(FEstableci) +
            '             AND ir_fechabaja IS NULL '+
            ' ORDER BY 1 DESC';

    clbRelevamiento.Items.Clear;
    clbRelevamiento.Items.Add('Todos');
    with GetQuery(sSQL) do
    try
      while not Eof do
      begin
        clbRelevamiento.Items.Add(Fields[0].AsString + Fields[1].AsString);
        Next;
      end;
    finally
      Free;
    end;
    tbRefrescarClick(nil);
end;

procedure TfrmRiesgos.tbAsociarRelevClick(Sender: TObject);
var
  sSQL: String;
  FechaRelev: TDate;
  IdCabeceraNomina: integer;
  i: integer;
  ultrelev: TDateTime;
begin
  Verificar(clbRelevamiento.ItemIndex < 1, clbRelevamiento, 'Debe seleccionar un relevamiento.');
  Verificar(Pos('Asocia', clbRelevamiento.Items[clbRelevamiento.ItemIndex]) <> 0, clbRelevamiento, 'No puede seleccionar un relevamiento asociado.');

  FechaRelev :=  EncodeDate(StrToInt(copy(clbRelevamiento.Items[clbRelevamiento.ItemIndex], 7, 4)),
                            StrToInt(copy(clbRelevamiento.Items[clbRelevamiento.ItemIndex], 4, 2)),
                            StrToInt(copy(clbRelevamiento.Items[clbRelevamiento.ItemIndex], 1, 2)));

  clbestablecimientos.Clear;

  sSQL :=
      '   SELECT es_nroestableci, es_nombre ' +
      '     FROM afi.aem_empresa, afi.aco_contrato, afi.aes_establecimiento ' +
      '    WHERE em_id = co_idempresa ' +
      '      AND es_contrato = co_contrato ' +
      '      AND co_contrato = art.get_vultcontrato(em_cuit) ' +
      '      AND em_cuit = ' + SqlValue(FCUIT) +
      '      AND es_nroestableci <> ' + SqlValue(FEstableci) +
      '      AND es_fechabaja IS NULL ' +
      '      AND NOT EXISTS(SELECT 1 ' +
      '                       FROM hys.hir_invalidoriesgo ' +
      '                      WHERE ir_cuit = em_cuit ' +
      '                        AND ir_estableci = es_nroestableci ' +
      '                        AND ir_fecha = ' + SqlValue(FechaRelev) +
      '                        AND ir_fechabaja IS NULL '+ ')' +
      '      AND NOT EXISTS(SELECT 1 ' +
      '                       FROM art.psr_sinriesgo ' +
      '                      WHERE sr_cuit = em_cuit ' +
      '                        AND sr_estableci = es_nroestableci ' +
      '                        AND sr_fecha = ' + SqlValue(FechaRelev) + ')' +
      '      AND NOT EXISTS(SELECT 1 ' +
      '                       FROM hys.hcn_cabeceranomina ' +
      '                      WHERE cn_cuit = em_cuit ' +
      '                        AND cn_estableci = es_nroestableci ' +
      '                        AND cn_fecharelevamiento = ' + SqlValue(FechaRelev) +
      '                        AND cn_idestado <> 6 ' + ')' +
      ' ORDER BY es_nroestableci';
  with GetQuery(sSQL)  do
  try
    while not Eof do
    begin
      clbestablecimientos.Add(Fields[0].AsString+' '+Fields[1].AsString,Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
  if (fpAsociarRelev.ShowModal = mrOk) then
  begin
    if Pos('SIN EXPUESTOS', clbRelevamiento.Items[clbRelevamiento.ItemIndex]) = 0 then
    begin
      with GetQueryEx('SELECT * FROM hys.hcn_cabeceranomina WHERE cn_id = :id', [integer(clbRelevamiento.Items.Objects[clbRelevamiento.ItemIndex])])  do
      try
        for i := 0 to clbestablecimientos.ItemsChecked.Count - 1 do
        begin
          IdCabeceraNomina := GetSecNextVal('HYS.SEQ_HCN_ID');
          ActualizarAsignacionLote(IdCabeceraNomina, FechaRelev, FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i]), true, fieldbyname('CN_FECHARECEPCIONPREV').AsDateTime,
                                   fieldbyname('CN_FECHARECEPCIONCOR').AsDateTime, fieldbyname('CN_FECHAIMPORTACION').AsDateTime, fieldbyname('CN_CONSEMESTRAL').AsString = 'S',
                                   integer(clbRelevamiento.Items.Objects[clbRelevamiento.ItemIndex]));
          ActualizarRelevamientos(FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i]));
        end;
      finally
        free;
      end;
    end
    else begin
      for i := 0 to clbestablecimientos.ItemsChecked.Count - 1 do
      begin
        ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                '          FROM hys.hcn_cabeceranomina ' +
                                '         WHERE cn_cuit = :cuit ' +
                                '           AND cn_estableci = :estab ' +
                                '           AND cn_idestado <> 6 ' +
                                '        UNION ALL '+
                                '        SELECT DISTINCT ir_fecha ' +
                                '          FROM hys.hir_invalidoriesgo '+
                                '         WHERE ir_cuit = :cuit '+
                                '           AND ir_estableci = :estab'+
                                '           AND ir_fechabaja IS NULL '+
                                '        UNION ALL ' +
                                '        SELECT sr_fecha fecha ' +
                                '          FROM art.psr_sinriesgo ' +
                                '         WHERE sr_cuit = :cuit ' +
                                '           AND sr_estableci = :estab) a ',[FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i])]);

        EjecutarSqlSTEx(' INSERT INTO ART.PSR_SINRIESGO(sr_cuit, sr_estableci, sr_fecha, sr_fechaalta, sr_usualta, ' +
                      '                               sr_idrelevasociado)' +
                      ' VALUES(:cuit, :estab, :fecha, sysdate, :usuario, :idasociado)',
                      [FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i]), TDateTimeEx.Create(FechaRelev), Sesion.LoginName,
                      integer(clbRelevamiento.Items.Objects[clbRelevamiento.ItemIndex])]);

        if (ultrelev < FechaRelev) then
        begin
          EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_idcabrelevamientoactivo = NULL, ' +
                  '       al_usumodif = :pusuario, ' +
                  '       al_fechamodif = SYSDATE ' +
                  ' WHERE al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ',
                  [Sesion.UserID, FIdEmpresa, StrToInt(clbestablecimientos.ValuesChecked[i])]);
          ActualizarUltRelevamiento (FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i]), FechaRelev, 'S');
        end;
        ActualizarRelevamientos(FCUIT, StrToInt(clbestablecimientos.ValuesChecked[i]));
      end;
    end;
  end;
end;

procedure TfrmRiesgos.tbCargarIncumplidoClick(Sender: TObject);
begin
  inherited;
  edFechaRecepcionInvalido.Clear;
  cbNoCorrespondeESSOP.Checked := False;
  cbFormularioInvalido.Checked:= False;
  fpCargaRelevamientoInvalido.ShowModal;     
end;

procedure TfrmRiesgos.cbNoCorrespondeESSOPClick(Sender: TObject);
begin
  if ( cbNoCorrespondeESSOP.Checked) and cbFormularioInvalido.Checked then
    cbFormularioInvalido.Checked := False;
end;

procedure TfrmRiesgos.cbFormularioInvalidoClick(Sender: TObject);
begin
  if ( cbFormularioInvalido.Checked) and  cbNoCorrespondeESSOP.Checked then
    cbNoCorrespondeESSOP.Checked := False;
end;

procedure TfrmRiesgos.btnFRecepAceptarClick(Sender: TObject);
var
  sSQL :String;
begin
  Verificar(edFechaRecepcionInvalido.Date = 0,edFechaRecepcionInvalido ,'Debe Ingresar una fecha.');
  Verificar(not cbFormularioInvalido.Checked and not cbNoCorrespondeESSOP.Checked, cbFormularioInvalido,
            'Debe Seleccionar un Motivo.');
  Verificar(edFechaRecepcionInvalido.Date > DBDate,edFechaRecepcionInvalido ,'La fecha no puede ser mayor a hoy.');

  EjecutarSqlSTEx(' INSERT INTO hys.hir_invalidoriesgo(ir_cuit, ir_estableci, ir_fecha, ir_fechaalta, ir_usualta, ' +
                  '                               ir_id,ir_nocorrespondeesop,ir_formularioinvalido)' +
                  ' VALUES(:cuit, :estab, :fecha, sysdate, :usuario, :id, :nocorresponde, :formularioinv)',
                  [FCUIT, FEstableci, TDateTimeEx.Create(edFechaRecepcionInvalido.Date), Sesion.LoginName,
                   GetSecNextVal('HYS.SEQ_HIR_INVRIESGO_ID'),IIF(cbNoCorrespondeESSOP.Checked,'S','N'),
                   IIF(cbFormularioInvalido.Checked,'S','N')]);

  if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio '+
                     '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(FCUIT)+')'+
                     '    AND ne_idtipodenuncia = 2 '+
                     '    AND ne_fechaenvio IS NULL ') then
    EjecutarSqlST(' UPDATE hys.hne_notasdenunciaenvio '+
                  '    SET ne_fechamodif = sysdate, '+
                  '        ne_usumodif = '+SqlValue(Sesion.UserID)+
                  '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(FCUIT)+')'+
                  '    AND ne_idtipodenuncia = 2 '+
                  '    AND ne_fechaenvio IS NULL ')
  else
    EjecutarSqlST('INSERT INTO hys.hne_notasdenunciaenvio (ne_id, ne_contrato, ne_fechaalta, ne_usualta, ne_idtipodenuncia) '+
                  '     VALUES (hys.seq_hne_id.NEXTVAL, art.get_vultcontrato ('+ SqlValue(FCUIT)+'), SYSDATE, '+
                        SqlValue(Sesion.UserID)+',2)');
  FGuardoInvalido := True;

  fpCargaRelevamientoInvalido.ModalResult := mrOk;
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
            ' UNION ALL '+
            ' SELECT DISTINCT ir_fecha, '' - INVALIDO'' ' +
            '            FROM hys.hir_invalidoriesgo '+
            '           WHERE ir_cuit = '+ SqlValue(FCUIT)+
            '             AND ir_estableci = '+ SqlValue(FEstableci) +
            '             AND ir_fechabaja IS NULL '+
            ' ORDER BY 1 DESC';

  clbRelevamiento.Items.Clear;
  clbRelevamiento.Items.Add('Todos');
  with GetQuery(sSQL) do
  try
    while not Eof do
    begin
      clbRelevamiento.Items.Add(Fields[0].AsString + Fields[1].AsString);
      Next;
    end;
  finally
    Free;
  end;
  tbRefrescarClick(nil);
end;

end.


