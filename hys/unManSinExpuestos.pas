unit unManSinExpuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unFraCodigoDescripcion,
  unFraEstablecimiento, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, Mask, ToolEdit, unfraEstablecimientoDomic;

type
  TfrmManSinExpuestos = class(TfrmCustomGridABM)
    fraEmpresaFiltro: TfraEmpresa;
    fraEstablecimientoFiltro: TfraEstablecimiento;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFechaRelevFiltro: TDateEdit;
    Label4: TLabel;
    Label6: TLabel;
    fraEmpresaABM: TfraEmpresa;
    edFechaRelevABM: TDateEdit;
    fraEstablecimientoDomicABM: TfraEstablecimientoDomic;
    Label5: TLabel;
    edFechaUltRelev: TDateEdit;
    lbExpuesto: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure fraEmpresaABMExit(Sender: TObject);
    procedure fraEmpresaFiltroExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraEstablecimientoDomicABMExit(Sender: TObject);
  private
    FSQL: string;
    FUltRelev : TDate;
    FConExpuesto : String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManSinExpuestos: TfrmManSinExpuestos;


implementation

uses
  SqlFuncs, unComunesFet, unComunes, unSesion, unCustomConsulta, VCLExtra,
  undmPrincipal, AnsiSql, unRiesgos, CustomDlgs;

{$R *.dfm}

procedure TfrmManSinExpuestos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModoABM := maNone;
end;

{ TfrmABMSinExpuestos }

procedure TfrmManSinExpuestos.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := 'SELECT  * '
         +'  FROM  art.psr_sinriesgo psr, '
         +'        afi.aem_empresa aem, '
         +'        afi.aco_contrato aco, '
         +'        afi.aes_establecimiento aes '
         +' WHERE  aes.es_contrato = aco.co_contrato '
         +'    AND aco.co_idempresa = aem.em_id '
         +'    AND psr.sr_cuit = aem.em_cuit '
         +'    AND psr.sr_estableci = aes.es_nroestableci '+
          '    AND co_contrato = '
        + '             (SELECT MAX (b.co_contrato) '
        + '                FROM aco_contrato b '
        + '               WHERE b.co_idempresa = em_id '
        + '                 AND NOT EXISTS (SELECT 1 '
        + '                FROM art.abc_bajadecontrato '
        + '               WHERE b.co_contrato = bc_contrato)) ';

  fraEmpresaFiltro.ExtraCondition :=
      '    AND co_contrato = '
    + '             (SELECT MAX (b.co_contrato) '
    + '                FROM aco_contrato b '
    + '               WHERE b.co_idempresa = em_id '
    + '                 AND NOT EXISTS (SELECT 1 '
    + '                FROM art.abc_bajadecontrato '
    + '               WHERE b.co_contrato = bc_contrato)) ';

  fraEmpresaFiltro.ShowBajas := True;
  fraEstablecimientoFiltro.ShowBajas := True;

  fraEmpresaABM.ShowBajas := True;
  fraEmpresaABM.UltContrato := True;

  fraEstablecimientoDomicABM.ShowBajas := True;
  Sql.TableName := 'art.psr_sinriesgo';
  ShowActived := False;
end;

procedure TfrmManSinExpuestos.ClearControls;
begin
  inherited;
  fraEmpresaABM.Clear;
  fraEstablecimientoDomicABM.Clear;
  edFechaRelevABM.Clear;
  edFechaUltRelev.Clear;
  lbExpuesto.Caption := '';
end;

function TfrmManSinExpuestos.DoABM: Boolean;
var
//  idEmpresa, IdCabeceraNomina, idCabecera: integer;
  ultrelev: TDateTime;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('SR_CUIT', sdqConsulta.FieldByName('SR_CUIT').AsString);
    Sql.PrimaryKey.Add('SR_ESTABLECI', sdqConsulta.FieldByName('SR_ESTABLECI').AsInteger);
    Sql.PrimaryKey.Add('SR_FECHA', sdqConsulta.FieldByName('SR_FECHA').AsDateTime);
    Sql.SqlType := stDelete;

    ActualizarRelevamientos(
        sdqConsulta.FieldByName('SR_CUIT').AsString,
        sdqConsulta.FieldByName('SR_ESTABLECI').AsInteger);

    if ExisteSqlEx (
        'SELECT 1 ' +
        '  FROM hys.hur_ultimorelevamiento ' +
        ' WHERE ur_cuit = :cuit ' +
        '   AND ur_estableci = :nroestableci ' +
        '   AND ur_fecharelev = ' + SqlDate(sdqConsulta.FieldByName('SR_FECHA').AsDateTime) +
        '   AND ur_tiporelevamiento = ''S''',
        [ sdqConsulta.FieldByName('SR_CUIT').AsString,
          sdqConsulta.FieldByName('SR_ESTABLECI').AsString]) then
    begin
        EliminarRelevamiento(sdqConsulta.FieldByName('SR_CUIT').AsString, sdqConsulta.FieldByName('SR_ESTABLECI').AsInteger, sdqConsulta.FieldByName('SR_FECHA').AsDateTime);
{
      idCabecera := ValorSqlInteger(
          ' SELECT MAX(cn_id) '
         +'   FROM hys.hcn_cabeceranomina '
         +'  WHERE cn_cuit = ' + sdqConsulta.FieldByName('SR_CUIT').AsString
         +'    AND cn_estableci = ' + sdqConsulta.FieldByName('SR_ESTABLECI').AsString
         +'    AND cn_idestado NOT IN (3,6) '
         +'    AND cn_fecharelevamiento > '+ SqlValue(sdqConsulta.FieldByName('SR_FECHA').AsDateTime), 0);

      if idCabecera <> 0 then
        ActualizarAsignacionLote(
            idCabecera,
            sdqConsulta.FieldByName('SR_FECHA').AsDateTime,
            sdqConsulta.FieldByName('SR_CUIT').AsString,
            sdqConsulta.FieldByName('SR_ESTABLECI').AsInteger, False)
      else begin
        idEmpresa := ValorSqlIntegerEx(
            'SELECT EM_ID FROM AFI.AEM_EMPRESA WHERE EM_CUIT = :cuit',
            [sdqConsulta.FieldByName('SR_CUIT').AsString]);

        idCabecera := ValorSqlIntegerEx(
            ' SELECT al_idcabrelevamientoactivo '
           +'   FROM hys.hal_asignacionlote '
           +'  WHERE al_idempresa = :pidempresa '
           +'    AND al_nroestableci = :pnroestableci ',
            [idEmpresa, sdqConsulta.FieldByName('SR_ESTABLECI').AsString]);

        EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina ' +
                      ' SET cn_idestado = 1 ' +
                      ' WHERE cn_id = ' + SqlValue(idCabecera));
      end;
}
    end;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('SR_CUIT', fraEmpresaABM.CUIT);
      Sql.PrimaryKey.Add('SR_ESTABLECI', fraEstablecimientoDomicABM.edCodigo.Value);
      Sql.PrimaryKey.Add('SR_FECHA', edFechaRelevABM.Date);
      Sql.Fields.Add('SR_FECHAALTA', exDateTime);
      Sql.Fields.Add('SR_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;

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
                                    '           AND sr_estableci = :estab) a ',[fraEmpresaABM.CUIT, fraEstablecimientoDomicABM.edCodigo.Value]);

      if (ultrelev < edFechaRelevABM.Date) then
        begin
          EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                  '   SET al_idcabrelevamientoactivo = NULL, ' +
                  '       al_usumodif = :pusuario, ' +
                  '       al_fechamodif = SYSDATE ' +
                  ' WHERE al_idempresa = :pidempresa ' +
                  '   AND al_nroestableci = :pnroestableci ',
                  [Sesion.UserID, fraEmpresaABM.Value, fraEstablecimientoDomicABM.edCodigo.Value]);
          ActualizarUltRelevamiento (fraEmpresaABM.CUIT, fraEstablecimientoDomicABM.edCodigo.Value, edFechaRelevABM.Date, 'S');
          ActualizarRelevamientos(fraEmpresaABM.CUIT, fraEstablecimientoDomicABM.edCodigo.Value);
        end;

{

      IdCabeceraNomina := ValorSqlIntegerEx(
          'SELECT cn_id ' +
          '  FROM hys.hcn_cabeceranomina ' +
          ' WHERE cn_idestado = 1 ' +
          '   AND cn_cuit = :pcuit ' +
          '   AND cn_estableci = :pestableci ' +
          '   AND cn_fecharelevamiento <= ' + SqlDate(edFechaRelevABM.Date),
          [ fraEmpresaABM.CUIT,
            fraEstablecimientoDomicABM.edCodigo.Text]);

      if IdCabeceraNomina <> 0 then
      begin
          if  not ExisteSqlEx ('SELECT 1 ' +
                              '  FROM hys.hro_relevoperativo ' +
                              ' WHERE ro_idcabeceranomina = :pidcabeceraactiva', [IdCabeceraNomina]) then
          begin
            if not ExisteSqlEx('SELECT 1 ' +
                               '  FROM hys.hal_asignacionlote ' +
                               ' WHERE al_idempresa = :pidempresa ' +
                               '   AND al_nroestableci = :pnroestableci ',
                               [fraEmpresaABM.ID,
                                fraEstablecimientoDomicABM.edCodigo.Text]) then
              EjecutarSqlSTEx ('INSERT INTO hys.hal_asignacionlote ' +
                               '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
                               '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
                               '             al_fechaproxoperacion, al_tipoproxoperacion, al_secuencia, ' +
                               '             al_usualta, al_fechaalta) ' +
                               '     VALUES (:pidempresa, :pnroestableci, null, ' +
                               '             NULL, NULL, ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ''R'', 0, ' +
                               '             :pusuario, SYSDATE) ',
                               [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text, Sesion.UserID])
            else
              EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                              '   SET al_idcabrelevamientoactivo = NULL, ' +
                              '       al_idultsubloteasignado = NULL, ' +
                              '       al_idultsubloteauditado = NULL, ' +
                              '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ' +
                              '       al_tipoproxoperacion = ''R'', ' +
                              '       al_secuencia = 0, ' +
                              '       al_usumodif = :pusuario, ' +
                              '       al_fechamodif = SYSDATE ' +
                              ' WHERE al_idempresa = :pidempresa ' +
                              '   AND al_nroestableci = :pnroestableci ',
                              [Sesion.UserID,
                              fraEmpresaABM.ID,
                              fraEstablecimientoDomicABM.edCodigo.Text]);

            ActualizarUltRelevamiento (fraEmpresaABM.CUIT, StrToInt(fraEstablecimientoDomicABM.edCodigo.Text), edFechaRelevABM.Date, 'S');
        end
        else begin
          if not ExisteSqlEx('SELECT 1 ' +
                             '  FROM hys.hal_asignacionlote ' +
                             ' WHERE al_idempresa = :pidempresa ' +
                             '   AND al_nroestableci = :pnroestableci ',
                             [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text]) then
            EjecutarSqlSTEx ('INSERT INTO hys.hal_asignacionlote ' +
                             '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
                             '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
                             '             al_fechaproxoperacion, al_tipoproxoperacion, al_secuencia, ' +
                             '             al_usualta, al_fechaalta) ' +
                             '     VALUES (:pidempresa, :pnroestableci, null, ' +
                             '             NULL, NULL, ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ''R'', 0, ' +
                             '             :pusuario, SYSDATE) ',
                             [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text, Sesion.UserID])
          else
            EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                            '   SET al_idcabrelevamientoactivo = NULL, ' +
                            '       al_idultsubloteasignado = NULL, ' +
                            '       al_idultsubloteauditado = NULL, ' +
                            '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ' +
                            '       al_tipoproxoperacion = ''R'', ' +
                            '       al_secuencia = 0, ' +
                            '       al_usumodif = :pusuario, ' +
                            '       al_fechamodif = SYSDATE ' +
                            ' WHERE al_idempresa = :pidempresa ' +
                            '   AND al_nroestableci = :pnroestableci ',
                            [Sesion.UserID, fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text]);

          ActualizarUltRelevamiento (fraEmpresaABM.CUIT, strtoint(fraEstablecimientoDomicABM.edCodigo.Text), edFechaRelevABM.Date, 'S');
        end;
      end
      else begin

          if not ExisteSql('SELECT 1 ' +
                           ' FROM PSR_SINRIESGO ' +
                           ' WHERE SR_CUIT = '+ fraEmpresaABM.CUIT +
                           '   AND SR_ESTABLECI = '+ SqlInt(strtoint(fraEstablecimientoDomicABM.edCodigo.Text)) +
                           '   AND SR_FECHA > ' + SqlDate(edFechaRelevABM.Date))
          and not ExisteSqlEx('SELECT cn_id ' +
                              '  FROM hys.hcn_cabeceranomina ' +
                              ' WHERE cn_cuit = :pcuit ' +
                              '   AND cn_estableci = :pestableci ' +
                              '   AND cn_fecharelevamiento > ' + SqlDate(edFechaRelevABM.Date),
                              [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text]) then
          begin

              if not ExisteSqlEx('SELECT 1 ' +
                                 '  FROM hys.hal_asignacionlote ' +
                                 ' WHERE al_idempresa = :pidempresa ' +
                                 '   AND al_nroestableci = :pnroestableci ',
                                 [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text]) then
                EjecutarSqlSTEx ('INSERT INTO hys.hal_asignacionlote ' +
                                 '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
                                 '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
                                 '             al_fechaproxoperacion, al_tipoproxoperacion, al_secuencia, ' +
                                 '             al_usualta, al_fechaalta) ' +
                                 '     VALUES (:pidempresa, :pnroestableci, null, ' +
                                 '             NULL, NULL, ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ''R'', 0, ' +
                                 '             :pusuario, SYSDATE) ',
                                 [fraEmpresaABM.ID, fraEstablecimientoDomicABM.edCodigo.Text, Sesion.UserID])
              else
                EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                                '   SET al_idcabrelevamientoactivo = NULL, ' +
                                '       al_idultsubloteasignado = NULL, ' +
                                '       al_idultsubloteauditado = NULL, ' +
                                '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ' +
                                '       al_tipoproxoperacion = ''R'', ' +
                                '       al_secuencia = 0, ' +
                                '       al_usumodif = :pusuario, ' +
                                '       al_fechamodif = SYSDATE ' +
                                ' WHERE al_idempresa = :pidempresa ' +
                                '   AND al_nroestableci = :pnroestableci ',
                                [Sesion.UserID, fraEmpresaABM.Id, fraEstablecimientoDomicABM.edCodigo.Text]);
              ActualizarUltRelevamiento (fraEmpresaABM.Cuit, strtoint(fraEstablecimientoDomicABM.edCodigo.Text), edFechaRelevABM.Date, 'S');
          end;
        end;
}
//        end;

    (*
      if IdCabeceraNomina <> 0 then
      begin
        if not ExisteSqlEx (
            'SELECT 1 FROM hys.hro_relevoperativo ' +
            ' WHERE ro_idcabeceranomina = :pidcabeceraactiva', [IdCabeceraNomina]) then
        begin
          if not ExisteSqlEx('SELECT 1 FROM hys.hal_asignacionlote ' +
                             ' WHERE al_idempresa = :pidempresa ' +
                             '   AND al_nroestableci = :pnroestableci ',
                               [fraEmpresaABM.ID,
                                fraEstablecimientoDomicABM.edCodigo.Text])
          then
            EjecutarSqlSTEx (
               'INSERT INTO hys.hal_asignacionlote ' +
               '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
               '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
               '             al_fechaproxoperacion, al_tipoproxoperacion, al_secuencia, ' +
               '             al_usualta, al_fechaalta) ' +
               '     VALUES (:pidempresa, :pnroestableci, null, ' +
               '             NULL, NULL, ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10),  '+
               '             ''R'', 0, ' +
               '             :pusuario, SYSDATE) ',
               [fraEmpresaABM.ID,
                fraEstablecimientoDomicABM.edCodigo.Text,
                Sesion.UserID])
          else
            EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                             '   SET al_idcabrelevamientoactivo = NULL, ' +
                             '       al_idultsubloteasignado = NULL, ' +
                             '       al_idultsubloteauditado = NULL, ' +
                             '       al_fechaproxoperacion = ADD_MONTHS(' + SqlDate(edFechaRelevABM.Date) + ', 10), ' +
                             '       al_tipoproxoperacion = ''R'', ' +
                             '       al_secuencia = 0, ' +
                             '       al_usumodif = :pusuario, ' +
                             '       al_fechamodif = SYSDATE ' +
                             ' WHERE al_idempresa = :pidempresa ' +
                             '   AND al_nroestableci = :pnroestableci ',
                              [ Sesion.UserID,
                                fraEmpresaABM.ID,
                                fraEstablecimientoDomicABM.edCodigo.Text]);

          ActualizarUltRelevamiento(
              fraEmpresaABM.CUIT,
              StrToInt(fraEstablecimientoDomicABM.edCodigo.Text),
              edFechaRelevABM.Date, 'S');
        end
      end*)
    end else
    begin { maModificacion }
      Result := True;
      Exit; {no hacer nada, sólo bloquear controles}
    end;
  end;
  Result := inherited DoABM;
end;

procedure TfrmManSinExpuestos.fpAbmClose(Sender: TObject; var Action:
    TCloseAction);
begin
  inherited;

  if ModoABM = maAlta then
  begin
    Action := caNone;
    ClearControls;
    fraEmpresaABM.SetFocus;
  end
  else
    VCLExtra.LockControls([fraEmpresaABM, fraEstablecimientoDomicABM, edFechaRelevABM], False);

end;

procedure TfrmManSinExpuestos.fraEmpresaABMExit(Sender: TObject);
begin
  inherited;
  fraEmpresaABM.FrameExit(Sender);
  fraEstablecimientoDomicABM.CUIT := fraEmpresaABM.CUIT;
  fraEstablecimientoDomicABM.Cargar;
end;

procedure TfrmManSinExpuestos.fraEmpresaFiltroExit(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.FrameExit(Sender);
  fraEstablecimientoFiltro.IdEmpresa := fraEmpresaFiltro.ID;
  fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
end;

procedure TfrmManSinExpuestos.LoadControls;
begin

end;

procedure TfrmManSinExpuestos.RefreshData;
var
  sWhere: string;
begin
  if ModoABM <> maAlta then
  begin
    if fraEmpresaFiltro.IsSelected then
      sWhere := sWhere + ' AND SR_CUIT = ' + fraEmpresaFiltro.CUIT;
    if fraEstablecimientoFiltro.IsSelected then
      sWhere := sWhere + ' AND SR_ESTABLECI = ' + fraEstablecimientoFiltro.Codigo;
    if edFechaRelevFiltro.Date > 0 then
      sWhere := sWhere + ' AND SR_FECHA = ' + SqlDate(edFechaRelevFiltro.Date);

    sdqConsulta.SQL.Text := FSQL + sWhere;
    inherited;
  end;
end;

procedure TfrmManSinExpuestos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  edFechaRelevFiltro.Clear;
end;

procedure TfrmManSinExpuestos.tbModificarClick(Sender: TObject);
begin
  fraEmpresaABM.CUIT := sdqConsulta.FieldByName('SR_CUIT').AsString;
  fraEstablecimientoDomicABM.CUIT := sdqConsulta.FieldByName('SR_CUIT').AsString;

  fraEstablecimientoDomicABM.Cargar(
      sdqConsulta.FieldByName('SR_CUIT').AsString,
      sdqConsulta.FieldByName('SR_ESTABLECI').AsString,
      False
  );
  fraEstablecimientoDomicABMExit(nil);
  edFechaRelevABM.Date := sdqConsulta.FieldByName('SR_FECHA').AsDateTime;
  VCLExtra.LockControls([fraEmpresaABM, fraEstablecimientoDomicABM, edFechaRelevABM]);
  inherited;
end;

function TfrmManSinExpuestos.Validar: Boolean;
begin
  Verificar(fraEmpresaABM.IsEmpty, fraEmpresaABM, 'Debe completar la empresa.');
  Verificar(fraEstablecimientoDomicABM.IsEmpty, fraEstablecimientoDomicABM, 'Debe completar los datos del establecimiento.');
  Verificar(edFechaRelevABM.Date=0, edFechaRelevABM, 'Debe completar la fecha del relevamiento.');
  Verificar(edFechaRelevABM.Date > Date, edFechaRelevABM, 'La fecha del relevamiento no puede ser mayor a hoy.');
  if FConExpuesto = 'S' then
  begin
    if ExisteSql('SELECT 1 FROM DUAL '+
                        ' WHERE TO_CHAR('+SqlDate(edFechaRelevABM.Date)+', ''YYYY'') = TO_CHAR( '+SqlDate(FUltRelev)+', ''YYYY'')') then
      if MsgBox('Usted está por dar de alta un sin expuesto y el mismo año hay un con expuesto. ¿ Está seguro ?', MB_ICONQUESTION + MB_YESNO ) = IDNO then
      begin
        Abort;
      end;
  end
  else if FConExpuesto = 'N' then
  begin
    Verificar(ExisteSql('SELECT 1 FROM DUAL '+
                        ' WHERE TO_CHAR('+SqlDate(edFechaRelevABM.Date)+', ''YYYY'') = TO_CHAR( '+SqlDate(FUltRelev)+', ''YYYY'')'),edFechaUltRelev,

             'Tiene un relevamiento sin expuesto el mismo año, no puede cargar otro.');
  end;

  if ExisteSqlEx('SELECT  1 '
              + '  FROM  art.psr_sinriesgo '
              + ' WHERE  sr_cuit = :cuit '
              + '    AND sr_estableci = :estableci '
              + '    AND sr_fecha = :fecharelev ',
              [ fraEmpresaABM.CUIT,
                fraEstablecimientoDomicABM.edCodigo.Text,
                DateToStr(edFechaRelevABM.Date)]) then
  begin
    MsgBox(Format('Ya existe un relevamiento para el CUIT %s establecimiento %s en la fecha %s.',
                          [ fraEmpresaABM.CUIT,
                            fraEstablecimientoDomicABM.edCodigo.Text,
                            DateToStr(edFechaRelevABM.Date)]
                        ), MB_OK + MB_ICONWARNING);
    Result := False;
  end else
    Result := True;
    
end;

procedure TfrmManSinExpuestos.fraEstablecimientoDomicABMExit(
  Sender: TObject);
begin
  inherited;
  fraEstablecimientoDomicABM.FrameExit(Sender);
  FConExpuesto := '';
  FUltRelev := 0;
  with GetQuery(' SELECT * '+
                '   FROM (SELECT DISTINCT rt_fecha fecha, ''S'' conexpuesto '+
                '                    FROM art.prt_riestrab '+
                '                   WHERE rt_cuit = '+SqlValue(fraEmpresaABM.CUIT)+
                '                     AND rt_estableci = '+SqlValue(fraEstablecimientoDomicABM.edCodigo.Value)+
                '         UNION ALL '+
                '         SELECT DISTINCT sr_fecha fecha, ''N'' conexpuesto '+
                '                    FROM art.psr_sinriesgo '+
                '                   WHERE sr_cuit = '+SqlValue(fraEmpresaABM.CUIT)+
                '                     AND sr_estableci = '+SqlValue(fraEstablecimientoDomicABM.edCodigo.Value)+
                '                ORDER BY 1 DESC) '+
                '  WHERE ROWNUM = 1') do
  try
    FUltRelev := FieldByName('fecha').AsDateTime;
    FConExpuesto := FieldByName('conexpuesto').AsString;
  finally
    Free;
  end;
  edFechaUltRelev.Date := FUltRelev;
  if FConExpuesto = 'S' then
    lbExpuesto.Caption := 'CON EXPUESTO'
  else if FConExpuesto = 'N' then
    lbExpuesto.Caption := 'SIN EXPUESTO';

end;

end.
