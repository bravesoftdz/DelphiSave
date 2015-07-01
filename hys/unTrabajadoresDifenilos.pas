unit unTrabajadoresDifenilos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtDbFrame, unFraTrabajadorAMP,
  unFraCodigoDescripcion, unFraCodDesc, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Buttons, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmTrabajadoresDifenilos = class(TfrmCustomGridABM)
    lbTrabCUIL: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    sbManTrab: TSpeedButton;
    lblRelacion: TLabel;
    fraTipoDocumento: TfraStaticCTB_TABLAS;
    edEdad: TIntEdit;
    edAntiguedad: TIntEdit;
    cmbTipoUnidad: TComboBox;
    fraTrabajador: TfraTrabajadorAMP;
    tbTrabajadoresUltRelev: TToolButton;
    tbInformarFaltanteTrabajador: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure sbManTrabClick(Sender: TObject);
    procedure tbTrabajadoresUltRelevClick(Sender: TObject);
    procedure tbInformarFaltanteTrabajadorClick(Sender: TObject);
  private
    FIDInforme :Integer;
    FContrato : Integer;
    FNroEstableci : Integer;
    FFechaInforme : TDate;
    { Private declarations }
    procedure setIDInforme(Value : Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    property IDInforme : Integer read FIDInforme write setIDInforme;
    property Contrato : Integer read FContrato write FContrato;
    property NroEstableci : Integer read FNroEstableci write FNroEstableci;
    property FechaInforme : TDate read FFechaInforme write FFechaInforme;
  end;

var
  frmTrabajadoresDifenilos: TfrmTrabajadoresDifenilos;

implementation

uses unSesion, sqlFuncs, unDmPrincipal, CustomDlgs, Strfuncs,
  unCustomConsulta, unContratoTrabajador, General, AnsiSql, unComunesFet;

const
  UNIDAD_TIEMPO: array[0..2] of string = ('D', 'M', 'A');
{$R *.dfm}

procedure TfrmTrabajadoresDifenilos.ClearControls;
begin
  fraTrabajador.Clear;
  fraTipoDocumento.Clear;
  edEdad.Clear;
  cmbTipoUnidad.ItemIndex := -1;
  edAntiguedad.Clear;
  fraTrabajador.Contrato := Contrato;
end;

function TfrmTrabajadoresDifenilos.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TD_ID').AsInteger;
      Sql.Fields.Add('TD_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TD_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TD_TIPODOCUMENTO', fraTipoDocumento.Codigo);
      Sql.Fields.Add('TD_CUIL', fraTrabajador.CUIL);
      Sql.Fields.Add('TD_EDAD', edEdad.Text);
      Sql.Fields.Add('TD_ANTIGUEDAD', edAntiguedad.Text);
      Sql.Fields.Add('TD_TIPOANTIGUEDAD', UNIDAD_TIEMPO[cmbTipoUnidad.ItemIndex]);
      Sql.Fields.Add('TD_IDINFORME', IDInforme);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HTD_ID');
        Sql.Fields.Add('TD_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TD_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TD_ID').AsInteger;
        Sql.Fields.Add('TD_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TD_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TD_USUBAJA', exNull );
        Sql.Fields.Add('TD_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TD_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       ErrorMsg(E, 'Error al guardar Trabajadores Difenilos.');
    end;
  end;
end;

procedure TfrmTrabajadoresDifenilos.FormCreate;
begin
  inherited;
  FieldBaja := 'TD_FECHABAJA';
  Sql.TableName := 'HYS.HTD_TRABAJADORESDIFENILOS';
  sdqConsulta.ParamByName('IDInforme').AsInteger := 0;
  fraTipoDocumento.Clave := 'TDOCN';
end;

procedure TfrmTrabajadoresDifenilos.LoadControls;
begin
  inherited;
  ClearControls;
  fraTrabajador.CUIL := sdqConsulta.FieldByName('td_cuil').AsString;
  fraTipoDocumento.Codigo := sdqConsulta.FieldByName('td_tipodocumento').AsString;
  edEdad.Text := sdqConsulta.FieldByName('td_edad').AsString;
  edAntiguedad.Text := sdqConsulta.FieldByName('td_antiguedad').AsString;
  cmbTipoUnidad.ItemIndex := ArrayPos(sdqConsulta.FieldByName('td_tipoantiguedad').AsString, UNIDAD_TIEMPO);

end;

procedure TfrmTrabajadoresDifenilos.setIDInforme(Value: Integer);
begin
  FIDInforme := Value;
  sdqConsulta.close;
  sdqConsulta.ParamByName('IDINFORME').AsInteger := Value;
  sdqConsulta.Open;
end;

function TfrmTrabajadoresDifenilos.Validar : Boolean;
begin
  Result := True;
  Verificar(not fraTrabajador.IsSelected,fraTrabajador, 'Debe especificar un Trabajador.');
  Verificar(not fraTipoDocumento.IsSelected,fraTipoDocumento, 'Debe especificar un Tipo de Documento.');
  Verificar( IsEmptyString(edEdad.Text),edEdad, 'Debe completar el Documento.');
  Verificar( IsEmptyString(edAntiguedad.Text),edAntiguedad, 'Debe completar la antiguedad.');
  Verificar( cmbTipoUnidad.ItemIndex = -1,cmbTipoUnidad, 'Debe especificar Tipo de Antiguedad.');
end;


procedure TfrmTrabajadoresDifenilos.sbManTrabClick(Sender: TObject);
begin
  if fraTrabajador.IsSelected then
    DoContratoTrabajador(fraTrabajador.Value, fraTrabajador.IdRelacionLaboral)
  else
    DoContratoTrabajador(0, 0);
end;

procedure TfrmTrabajadoresDifenilos.tbTrabajadoresUltRelevClick(
  Sender: TObject);
var
  sSql: String;
begin
  if MsgBox('Este proceso importa los trabajadores del último relevamiento realizado el año ' +
            'previo al de la fecha del informe.' + #13 + '¿Desea continuar?',
            MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  BeginTrans;
  try
    sSql := 'INSERT INTO hys.htd_trabajadoresdifenilos ' + 
            '            (td_id, td_idinforme, td_cuil, td_tipodocumento, ' +
            '             td_edad, td_antiguedad,' +
            '             td_tipoantiguedad,td_fechaalta, ' +
            '             td_usualta) ' +
            '  SELECT HYS.SEQ_HTD_ID.NEXTVAL, :idinforme, rs_cuil, 99, ' +
            '         NVL(TRUNC(MONTHS_BETWEEN(SYSDATE, tj_fnacimiento) / 12), 0), ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, art.actualdate ' +
            '                                                                                    - rs_fechaingreso, ' +
            '                                                                                   TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso))) ' +
            '           ELSE TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso) / 12) ' +
            '         END, ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, ''D'', ' +
            '                                                                                   ''M'') ' +
            '           ELSE ''A'' ' +
            '         END, ' +
            '         SYSDATE, :pusuario ' +
            '    FROM (SELECT DISTINCT rs_cuil,rs_idtrabajador, rs_sector, rs_fechaingreso, rs_contrato ' +
            '              FROM hys.v_trabajadores_con_riesgo ' +
            '             WHERE rs_cuit = :pcuit ' +
            '               AND rs_estableci = :pestableci ' +
            '               AND NOT EXISTS(SELECT 1 ' +
            '                                FROM hys.HTD_TRABAJADORESDIFENILOS ' +
            '                               WHERE td_cuil = rs_cuil ' +
            '                                 AND td_idinforme = :idinforme) ' +
            '               AND rs_fecha = (SELECT MAX(cn_fecharelevamiento) ' +
            '                                 FROM hys.hcn_cabeceranomina ' +
            '                                WHERE cn_cuit = rs_cuit ' +
            '                                  AND cn_estableci = rs_estableci ' +
            '                                  AND EXTRACT(YEAR FROM cn_fecharelevamiento) = EXTRACT(YEAR FROM '+Sqlvalue(FechaInforme)+') - 1)), ' +
            '         comunes.ctj_trabajador ' +
            '   WHERE tj_id = rs_idtrabajador';

    EjecutarSqlSTEx (sSql,
                     [IDInforme,
                      Sesion.UserID,
                      ValorSql(' SELECT em_cuit '+
                               '   FROM afi.aco_contrato, afi.aem_empresa '+
                               '  WHERE co_idempresa = em_id '+
                               '   AND co_contrato = '+SqlValue(Contrato)),
                      NroEstableci,
                      IDInforme]);
    CommitTrans;

    sdqConsulta.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al importar desde último Relev. Expuestos');
      Rollback;
    end;
  end
end;

procedure TfrmTrabajadoresDifenilos.tbInformarFaltanteTrabajadorClick(
  Sender: TObject);
var
  Cuit : String;
  IdEstableci : Integer;
  NroInforme : Integer;
  tipoInforme : String;
begin
  with GetQuery(
    ' SELECT in_nroinforme, in_cuit, in_idestableci,in_tipoinforme '+
    '   FROM hys.hin_informe '+
    '  WHERE in_id = '+SqlValue(IDInforme)) do
  try
    Cuit := FieldByName('in_cuit').AsString;
    IdEstableci := FieldByName('in_idestableci').AsInteger;
    NroInforme := FieldByName('in_nroinforme').AsInteger;
    if FieldByName('in_tipoinforme').AsString = 'A' then
      tipoInforme := 'Accidentes Mayores'
    else
      tipoInforme := 'Difenilos';
  finally
    Free;
  end;

  DenunciaDatosIncompletos(Cuit,IdEstableci,NroInforme,'Trabajadores',tipoInforme);
end;

end.
