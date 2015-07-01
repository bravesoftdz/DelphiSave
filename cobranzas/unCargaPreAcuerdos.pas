unit unCargaPreAcuerdos;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   20-07-03
 ULTIMA MODIFICACION: 12-11-03
}                 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl,
  StdCtrls, ComCtrls, ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, CurrEdit, unArtFrame,
  unArtDbFrame, unFraEmpresa, unfraContactoEmpresa, FormPanel, unfraContacto,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Menus,
  unArtDBAwareFrame, PeriodoPicker, unFraCodigoDescripcion, unArt, RxToolEdit,
  RxCurrEdit, RxPlacemnt;

type
  TfrmCargaPreAcuerdos = class(TfrmCustomPanelABM)
    Grid: TArtDBGrid;
    gbDeuda: TGroupBox;
    Label7: TLabel;
    edSubTotal: TCurrencyEdit;
    gbEmpresa: TGroupBox;
    Label8: TLabel;
    fraPP_CONTRATO: TfraEmpresa;
    gbContacto: TGroupBox;
    gbFecha: TGroupBox;
    cmbPP_FECHAMORA: TDateComboBox;
    chkInteresMora: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    edTotalInteres: TCurrencyEdit;
    edPP_GASTOADMINISTRATIVO: TCurrencyEdit;
    gbInteres: TGroupBox;
    Label3: TLabel;
    edPP_PORCDESCINTERES: TCurrencyEdit;
    Label4: TLabel;
    edPP_MONTODESCINTERES: TCurrencyEdit;
    fraPP_IDCONTACTO: TfraContactoEmpresa;
    gbSeleccion: TGroupBox;
    Label1: TLabel;
    edDeuda: TCurrencyEdit;
    Label2: TLabel;
    edInteres: TCurrencyEdit;
    btnCalcular: TButton;
    gbEstado: TGroupBox;
    fraPP_ESTADO: TfraStaticCTB_TABLAS;
    gbDeudasAcreedoras: TGroupBox;
    chkMostrarDeudas: TCheckBox;
    Label9: TLabel;
    edPD_DEUDAINICIAL: TCurrencyEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbAprobarCuota: TToolButton;
    chkConcursados: TCheckBox;
    gbGestor: TGroupBox;
    fraPP_IDGESTOR: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    edPP_PORCCOMISIONGESTOR: TCurrencyEdit;
    Label11: TLabel;
    edPP_COMISIONGESTOR: TCurrencyEdit;
    Label12: TLabel;
    edPP_DEUDATOTAL: TCurrencyEdit;
    pnlColor0: TPanel;
    pnlColor1: TPanel;
    tbPagoACuenta: TToolButton;
    fpPagoACuenta: TFormPanel;
    edImporte: TCurrencyEdit;
    edPeriodo: TPeriodoPicker;
    Label13: TLabel;
    Label14: TLabel;
    btnAceptarPagoACuenta: TButton;
    btnCancelarPagoACuenta: TButton;
    Bevel1: TBevel;
    lblNro: TLabel;
    chkMostrarReclamoAFIP: TCheckBox;
    pnlColor2: TPanel;
    gbEstudio: TGroupBox;
    fraPP_IDESTUDIO: TfraStaticCodigoDescripcion;
    pmnuPagoCuenta: TPopupMenu;
    mnuPagoCuentaCuota: TMenuItem;
    mnuPagoCuentaInteres: TMenuItem;
    gbGestionDeuda: TGroupBox;
    fraPP_IDGESTIONDEUDA: TfraStaticCodigoDescripcion;
    gbTipo: TGroupBox;
    rgTipoGestionDeuda: TRadioButton;
    rgTipoConcQuiebra: TRadioButton;
    tbPlanesEspeciales: TToolButton;
    ToolButton2: TToolButton;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkInteresMoraClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure ActualizarControles(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAprobarCuotaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure fraPP_IDGESTORChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpPagoACuentaBeforeShow(Sender: TObject);
    procedure mnuPagoCuentaCuotaClick(Sender: TObject);
    procedure tbPagoACuentaClick(Sender: TObject);
    procedure fraPP_IDGESTIONDEUDAChange(Sender: TObject);
    procedure rgTipoGestionDeudaClick(Sender: TObject);
    procedure rgTipoConcQuiebraClick(Sender: TObject);
    procedure DoCargarCuotas(Sender: TObject);
  private
    fContrato: string;
    fIDPlanPago: string;
    fTipoPagoCuenta: string;
    procedure CambiaContrato(  Sender: TOBject );
    procedure btnMarcarTodos( Sender: TObject );
    procedure btnDesMarcarTodos( Sender: TObject );
    procedure ActualizaDeuda;
    function DoGuardar(Observaciones: String): boolean;
    procedure DoNuevoAcuerdo( FechaHasta: TDateTime );
    function HabilitarCargaComisionEstudio: Boolean;
    function Get_GastosAdministrativos: Double;
    function Is_PeriodoConGastoAdministrativo(Contrato: Integer; Periodo: String): Boolean;
    function AgregarGastosAdministrativos(Contrato: Integer; GastosAdmin: Currency): Boolean;
    function Is_ReclamoAFIP: Boolean;
    procedure DoCargarGestionDeuda(Contrato: Integer);
    procedure DoCargarCuotasPlan(IdPlanPago: String; EsPlanEspecial: Boolean);
    function GetObservaciones(var Obseravciones: String): Boolean;
    function Get_MinimoDeudaNominal_Planes: Double;
  protected
    FSQL_GestionDeuda, FSQL_GestionDeudaUNION: String;
    function Validar(EsPlanEspecial: Boolean): boolean; reintroduce; 
  public
    procedure DoCargar( IDPlanPago: string );
  end;

  function HabilitarGestor: boolean;
  function HabilitarEstudio: Boolean;
  function Is_SectorLegal: Boolean;
  function GetObservacionesPlan(Id: TTableId): String;

var
  frmCargaPreAcuerdos: TfrmCargaPreAcuerdos;

implementation

{$R *.DFM}

uses
  unPrincipal, unDmPrincipal, unCustomDataModule, AnsiSql, SqlFuncs,
  strFuncs, unCargaCuotas, VCLExtra, unContratoContacto, Periodo,
  CustomDlgs, unQrEstadoCuentaPlan, unComunes, unSesion,  DateTimeFuncs,
  unCobranzas, Periodos, General;

{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.Validar(EsPlanEspecial: Boolean): boolean;
var
  RegistroAnterior: TBookMark;
  iloop: integer;
  bSectorLegal, ReclamoAFIP: boolean;
  sSql: String;
  dMinimoDeudaNominal: Double;
begin
  bSectorLegal := Is_SectorLegal();

  Verificar((edPP_PORCDESCINTERES.Value <> 0) and (edPP_MONTODESCINTERES.Value <> 0), edPP_PORCDESCINTERES,
            'No puede realizar un descuento porcentual si efectúa uno líquido.');
  Verificar((edDeuda.Value = 0) and (edInteres.Value = 0), Grid, 'No eligió cuotas con deuda.');
  Verificar((edInteres.Value = 0) and ((edPP_PORCDESCINTERES.Value <> 0) or (edPP_MONTODESCINTERES.Value <> 0)),
            edInteres, 'Si el interés es cero, entonces la bonificación de interés debe ser cero.');
  Verificar(edPP_MONTODESCINTERES.Value > edInteres.Value , edPP_MONTODESCINTERES, 'El descuento líquido debe ser menor o igual al interés.');
  Verificar(edPP_DEUDATOTAL.Value = 0, edPP_DEUDATOTAL, 'La deuda total es cero.');

  if not EsPlanEspecial and not bSectorLegal then
    begin
      dMinimoDeudaNominal := Get_MinimoDeudaNominal_Planes();
      Verificar(edDeuda.Value < dMinimoDeudaNominal, edDeuda, 'La deuda no puede ser inferior a $ ' + FloatToStr(dMinimoDeudaNominal) + '.');
    end;

  Verificar(not fraPP_IDGESTOR.Locked and fraPP_IDGESTOR.IsEmpty, fraPP_IDGESTOR.edCodigo, 'Debe elegir un gestor.');
  Verificar(not fraPP_IDGESTIONDEUDA.Locked and fraPP_IDGESTIONDEUDA.IsEmpty, fraPP_IDGESTIONDEUDA.edCodigo, 'Debe elegir una gestión de deuda.');
  Verificar(not fraPP_IDESTUDIO.Locked and fraPP_IDESTUDIO.IsEmpty, fraPP_IDESTUDIO.edCodigo, 'Debe elegir un estudio.');

  if bSectorLegal then
    begin
      sSql := 'SELECT 1 ' +
                'FROM AEM_EMPRESA, ACO_CONTRATO ' +
               'WHERE EM_ID = CO_IDEMPRESA ' +
                 'AND CO_CONTRATO=:Contrato ' +
                 'AND (CO_IDESTUDIO IS NOT NULL ' +
                      'OR EM_FECHACONCURSO IS NOT NULL ' +
                      'OR EM_FECHAQUIEBRA IS NOT NULL ' +
                      'OR EXISTS (SELECT 1 ' +
                                   'FROM LGD_GESTIONDEUDA ' +
                                  'WHERE CO_CONTRATO = GD_CONTRATO ' +
                                    'AND GD_TIPO = ''01'' ' +
                                    'AND GD_ESTADO = ''01''))';

      Verificar(not ExisteSqlEx(sSql, [StrToInt(fContrato)]), nil, 'Solo puede cargar preacuerdos o planes de contratos que estén dados de baja y que tengan asignado un estudio, o con periodos concursales.');
    end;

  Result := True;

  //Se fija que de los registros elegidos no haya uno que sea de otro plan o
  //que pertenezca a un periodo reclamado a la AFIP
  ReclamoAFIP := False;
  RegistroAnterior := sdqConsulta.GetBookmark;
  try
    for iloop:= 0 to Grid.SelectedRows.Count-1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iloop]));

      Verificar(sdqConsulta.FieldByName('PP_VENCIMIENTO').IsNull, Grid, 'No está cargado el vencimiento del periodo: ' + sdqConsulta.fieldByName('PP_PERIODO').AsString);

      //if sdqConsulta.FieldByName('PP_DEUDAFINANCIADA').AsFloat <> 0 then
      //begin
      //  Result := False;
      //  MessageDlg('No puede elegir una cuota ya incluída en otro preacuerdo o plan', mtError, [mbOK], 0);
      //  Break;
      //end;

      if Is_ReclamoAFIP() then
        ReclamoAFIP := True;
    end;
  finally
    sdqConsulta.GotoBookmark(RegistroAnterior);
    sdqConsulta.FreeBookmark(RegistroAnterior);
  end;
  
  if ReclamoAFIP then
    if not (msgBox('Se han incluído períodos reclamados a la AFIP.' + CRLF + '¿Desea continuar?', MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES) then
      Result := False;
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.DoGuardar(Observaciones: String): boolean;
var
  SqlPlanPago, SqlPlanDeuda: TSql;
  iloop: integer;
  sSql: string;
begin
  Result := True;
  SqlPlanPago := TSql.Create('ZPP_PLANPAGO');
  SqlPlanDeuda := TSql.Create('ZPD_PLANDEUDA');
  try
    try
      BeginTrans;
      //Grabo lo correspondiente a la ZPP_PLANPAGO
      //Esto está siempre en modo Alta

      SqlPlanPago.SqlType := stInsert;
      fIDPlanPago := ValorSql('SELECT SEQ_ZPP_ID.NEXTVAL FROM DUAL', '0');
      SqlPlanPago.Fields.Add('PP_FECHAALTA',            SQL_ACTUALDATE, False);
      SqlPlanPago.Fields.Add('PP_USUALTA',              Sesion.UserID);
      //
      SqlPlanPago.PrimaryKey.Add('PP_ID',               fIDPlanPago, False);
      SqlPlanPago.Fields.Add('PP_CONTRATO',             fContrato, False);
      if fraPP_IDCONTACTO.IsSelected then
        SqlPlanPago.Fields.Add('PP_IDCONTACTO',         fraPP_IDCONTACTO.Value, False);
      SqlPlanPago.Fields.Add('PP_IDGESTOR',             fraPP_IDGestor.Value, True);
      SqlPlanPago.Fields.Add('PP_ESCONCURSOQUIEBRA',    String(Iif(gbTipo.Enabled and rgTipoConcQuiebra.Checked, 'S', 'N')));
      SqlPlanPago.Fields.Add('PP_IDESTUDIO',            fraPP_IDEstudio.Value, True);
      SqlPlanPago.Fields.Add('PP_IDGESTIONDEUDA',       fraPP_IDGESTIONDEUDA.Value, True);
      SqlPlanPago.Fields.Add('PP_ESTADO',               '01');
      SqlPlanPago.Fields.Add('PP_TASAINTERESMENSUAL',   Get_TEMVigente(), dtNumber);
      SqlPlanPago.Fields.Add('PP_PORCDESCINTERES',      edPP_PORCDESCINTERES.Value, dtNumber);
      SqlPlanPago.Fields.Add('PP_MONTODESCINTERES',     edPP_MONTODESCINTERES.Value, dtNumber);
      SqlPlanPago.Fields.Add('PP_GASTOADMINISTRATIVO',  edPP_GASTOADMINISTRATIVO.Value, dtNumber);
      SqlPlanPago.Fields.Add('PP_PORCCOMISIONGESTOR',   edPP_PORCCOMISIONGESTOR.Value, dtNumber);
      SqlPlanPago.Fields.Add('PP_COMISIONGESTOR',       edPP_COMISIONGESTOR.Value, dtNumber);
      SqlPlanPago.Fields.Add('PP_DEUDATOTAL',           edPP_DEUDATOTAL.Value, dtNumber);
      if chkInteresMora.Checked then
        SqlPlanPago.Fields.Add('PP_FECHAMORA',          cmbPP_FECHAMORA.Date);
      SqlPlanPago.Fields.Add('PP_FECHA',                SQL_ACTUALDATE, False);
      SqlPlanPago.Fields.Add('PP_OBSERVACIONES',        Observaciones);

      EjecutarSqlST( SqlPlanPago.Sql );

      //Borro los campos correspondientes al antiguo plan
      sSql := 'DELETE FROM ZPD_PLANDEUDA WHERE PD_IDPLANPAGO = ' + fIDPlanPago;
      EjecutarSqlST( sSql );
      //Grabo lo correspondiente a la ZPD_PLANDEUDA
      for iloop := 0 to Grid.SelectedRows.Count-1 do
      begin
        SdqConsulta.GotoBookmark (pointer(Grid.SelectedRows.Items[iloop]));
        SqlPlanDeuda.SqlType := stInsert;
        SqlPlanDeuda.PrimaryKey.Add('PD_ID',            'SEQ_ZPD_ID.NEXTVAL', False);
        SqlPlanDeuda.Fields.Add('PD_IDPLANPAGO',        fIDPlanPago, False);

        SqlPlanDeuda.Fields.Add('PD_PERIODO',           sdqConsulta.fieldByName('PP_PERIODO').AsString);
        SqlPlanDeuda.Fields.Add('PD_CUOTADEVENGADO',    sdqConsulta.fieldByName('PP_CUOTA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_FONDODEVENGADO',    sdqConsulta.fieldByName('PP_HIPOACUSIA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_OTROSDEVENGADO',    sdqConsulta.fieldByName('PP_OTROS').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_CUOTAPAGO',         sdqConsulta.fieldByName('PP_PAGADO').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_FONDOPAGO',         sdqConsulta.fieldByName('PP_PAGADOHIPOACUSIA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_OTROSPAGO',         sdqConsulta.fieldByName('PP_PAGADOOTROS').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_DEUDANOMINAL',      sdqConsulta.fieldByName('PP_DEUDA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_SALDODEUDANOMINAL', sdqConsulta.fieldByName('PP_DEUDA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_INTERESMORA',       sdqConsulta.fieldByName('PP_INTERESMORA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_DEUDATOTAL',        sdqConsulta.fieldByName('DEUDATOTAL').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_EMPLEADOS',         sdqConsulta.fieldByName('PP_EMPLEADOS').AsInteger);
        SqlPlanDeuda.Fields.Add('PD_MASASALARIAL',      sdqConsulta.fieldByName('PP_MASASALARIAL').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_TASAACUMULADA',     sdqConsulta.fieldByName('PP_TASAACUMULADA').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_VENCIMIENTO',       sdqConsulta.fieldByName('PP_VENCIMIENTO').AsDateTime);
        SqlPlanDeuda.Fields.Add('PD_IMPORTERECLAMADO',  sdqConsulta.fieldByName('PP_IMPORTERECLAMADO').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_DEUDAINICIAL',      sdqConsulta.fieldByName('PP_DEUDAINICIAL').AsFloat, dtNumber);
        SqlPlanDeuda.Fields.Add('PD_CONCURSADO',        sdqConsulta.fieldByName('PP_CONCURSADO').AsString);
        SqlPlanDeuda.Fields.Add('PD_CONTRATO_EXT',      sdqConsulta.fieldByName('CONTRATOEXT').AsInteger, dtNumber);

        SqlPlanDeuda.Fields.Add('PD_FECHAALTA',         SQL_ACTUALDATE, False);
        SqlPlanDeuda.Fields.Add('PD_USUALTA',           Sesion.UserID);
        EjecutarSqlST( SqlPlanDeuda.InsertSql );

        SqlPlanDeuda.Clear;
        SqlPlanDeuda.TableName := 'ZPD_PLANDEUDA';
      end;

      CommitTrans;
      MsgBox('Se ha generado el preacuerdo ' + fIDPlanPago + '.');
    except
      On E: Exception do
      begin
        RollBack;
        Raise Exception.Create( E.Message + #13 );
        Result := False;
      end;
    end;
  finally
    SqlPlanPago.Free;
    SqlPlanDeuda.Free;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.DoCargar( IDPlanPago: string );
var
  sSql: string;
  sdqDatos: TSDQuery;
begin
  lblNro.Caption := 'Nº ' + IDPlanPago;

  fIDPlanPago := IDPlanPago;
  //Los selecciona
  sSql := 'SELECT PD_PERIODO PP_PERIODO, PD_EMPLEADOS PP_EMPLEADOS, PD_MASASALARIAL PP_MASASALARIAL, PD_CUOTADEVENGADO PP_CUOTA, PD_OTROSDEVENGADO PP_OTROS, ' +
          '       PD_FONDODEVENGADO PP_HIPOACUSIA, PD_CUOTAPAGO PP_PAGADO, PD_DEUDANOMINAL PP_DEUDA, PD_VENCIMIENTO PP_VENCIMIENTO, PD_TASAACUMULADA PP_TASAACUMULADA, ' +
          '       PD_INTERESMORA PP_INTERESMORA, PD_DEUDATOTAL DEUDATOTAL, PD_FONDOPAGO PP_PAGADOHIPOACUSIA, PD_OTROSPAGO PP_PAGADOOTROS, PD_CODTIPOREGIMEN CODREGIMEN, ' +
          '       PD_CUOTAPAGO+PD_FONDOPAGO+PD_OTROSPAGO CANCELACION, 0 PP_DEUDAFINANCIADA, PD_IMPORTERECLAMADO PP_IMPORTERECLAMADO, PD_DEUDAINICIAL PP_DEUDAINICIAL, ' +
          '       PD_CONCURSADO PP_CONCURSADO ' + //Esto lo pongo para que no falle la rutina que cambia el color de los registros
          '  FROM ZPD_PLANDEUDA ' +
          ' WHERE PD_IDPLANPAGO = ' + SQLValue(fIDPlanPago) +
          ' ORDER BY PD_PERIODO';
  OpenQuery( sdqConsulta, sSql);

  //Actualizo el estado de los controles
  sSql := 'SELECT NVL(PP_CONTRATO,0) PP_CONTRATO, NVL(PP_IDCONTACTO,0) PP_IDCONTACTO, ' +
          '       NVL(PP_PORCDESCINTERES,0) PP_PORCDESCINTERES, NVL(PP_MONTODESCINTERES,0) PP_MONTODESCINTERES, ' +
          '       NVL(PP_GASTOADMINISTRATIVO,0) PP_GASTOADMINISTRATIVO, PP_FECHAMORA, PP_ESTADO, ' +
          '       NVL(PP_DEUDATOTAL,0) PP_DEUDATOTAL, NVL(PP_PORCCOMISIONGESTOR,0) PP_PORCCOMISIONGESTOR, ' +
          '       NVL(PP_COMISIONGESTOR,0) PP_COMISIONGESTOR, PP_IDGESTOR, PP_IDESTUDIO, PP_IDGESTIONDEUDA, ' +
          '       PP_ESCONCURSOQUIEBRA ' +
          '  FROM ZPP_PLANPAGO ' +
          ' WHERE PP_ID = ' + SQLValue(fIDPlanPago);
  sdqDatos := GetQuery( sSql );
  try
    fContrato                      := sdqDatos.fieldByName('PP_CONTRATO').AsString;
    cmbPP_FECHAMORA.Date           := sdqDatos.fieldByName('PP_FECHAMORA').AsDateTime;
    fraPP_IDCONTACTO.Value         := sdqDatos.fieldByName('PP_IDCONTACTO').AsInteger;
    fraPP_IDGESTOR.Value           := sdqDatos.fieldByName('PP_IDGESTOR').AsInteger;
    fraPP_CONTRATO.Contrato        := sdqDatos.fieldByName('PP_CONTRATO').AsInteger;

    if sdqDatos.fieldByName('PP_ESCONCURSOQUIEBRA').AsString = 'S' then
      rgTipoConcQuiebra.Checked := True
    else
      rgTipoGestionDeuda.Checked := True;

    DoCargarGestionDeuda(fraPP_CONTRATO.Contrato);

    if fraPP_IDGESTIONDEUDA.Locked then
      fraPP_IDGESTIONDEUDA.Clear
    else
      fraPP_IDGESTIONDEUDA.Value     := sdqDatos.fieldByName('PP_IDGESTIONDEUDA').AsInteger;

    fraPP_IDESTUDIO.Value          := sdqDatos.fieldByName('PP_IDESTUDIO').AsInteger;
    fraPP_ESTADO.Value             := sdqDatos.fieldByName('PP_ESTADO').AsString;
    edPP_PORCDESCINTERES.Value     := sdqDatos.fieldByName('PP_PORCDESCINTERES').AsFloat;
    edPP_MONTODESCINTERES.Value    := sdqDatos.fieldByName('PP_MONTODESCINTERES').AsFloat;
    edPP_GASTOADMINISTRATIVO.Value := sdqDatos.fieldByName('PP_GASTOADMINISTRATIVO').AsFloat;
    edPD_DEUDAINICIAL.Value        := ValorSqlExtended( 'SELECT SUM(PD_DEUDAINICIAL)' +
                                                        '  FROM ZPD_PLANDEUDA' +
                                                        ' WHERE PD_IDPLANPAGO = ' + SQLValue(fIDPlanPago), 0);
    edDeuda.Value                  := ValorSqlExtended( 'SELECT SUM(PD_DEUDANOMINAL)' +
                                                        '  FROM ZPD_PLANDEUDA' +
                                                        ' WHERE PD_IDPLANPAGO = ' + SQLValue(fIDPlanPago), 0);
    edInteres.Value                := ValorSqlExtended( 'SELECT SUM(PD_INTERESMORA)' +
                                                        '  FROM ZPD_PLANDEUDA' +
                                                        ' WHERE PD_IDPLANPAGO = ' + SQLValue(fIDPlanPago), 0);

    edPP_PORCCOMISIONGESTOR.Value  := sdqDatos.fieldByName('PP_PORCCOMISIONGESTOR').AsFloat;

    //Actualizo el estado de los group boxes
    VCLExtra.LockControls(gbEmpresa, True);
    VCLExtra.LockControls(gbContacto, True);
    VCLExtra.LockControls(gbFecha, True);
    VCLExtra.LockControls(gbDeudasAcreedoras, True);
    VCLExtra.LockControls(gbDeuda, True);
    VCLExtra.LockControls(gbInteres, True);
    VCLExtra.LockControls(gbSeleccion, True);
    VCLExtra.LockControls(gbGestor, True);
    VCLExtra.LockControls(gbEstudio, True);
    VCLExtra.LockControls(gbGestionDeuda, True);
    VCLExtra.LockControls(gbTipo, True);

    tbAprobarCuota.Enabled     := False;
    tbPlanesEspeciales.Visible := False;

    btnCalcular.Enabled := False;
    //impido la seleccion de mas de un registro
    Grid.Options := Grid.Options - [dgRowSelect];
    Grid.Options := Grid.Options - [dgMultiSelect];
    ModoABM := maModificacion;
    ActualizaDeuda;
  finally
    sdqDatos.Free;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.DoNuevoAcuerdo( FechaHasta: TDateTime );
var
  sSql, MostrarDeuda, MostrarConcursados, MostrarReclamoAFIP: string;
  MostrarPrescriptos, MostrarSoloConcursados: string;
begin
  //Genera los registros temporales
  if chkMostrarDeudas.Checked then
    MostrarDeuda := 'S'
  else
    MostrarDeuda := 'N';

  if chkConcursados.Checked then
    MostrarConcursados := 'S'
  else
    MostrarConcursados := 'N';

  if chkMostrarReclamoAFIP.Checked then
    MostrarReclamoAFIP := 'S'
  else
    MostrarReclamoAFIP := 'N';

  if Is_SectorLegal() then
    begin
      if rgTipoGestionDeuda.Checked then
        begin
          sSql := 'SELECT 1 ' +
                    'FROM ACO_CONTRATO ' +
                   'WHERE CO_CONTRATO=:Contrato ' +
                     'AND (CO_IDESTUDIO IS NOT NULL OR ' +
                          'EXISTS (SELECT 1 ' +
                                    'FROM LGD_GESTIONDEUDA ' +
                                   'WHERE CO_CONTRATO = GD_CONTRATO ' +
                                     'AND GD_TIPO = ''01'' ' +
                                     'AND GD_ESTADO = ''01''))';

          if ExisteSqlEx(sSql, [StrToInt(fContrato)]) then
            MostrarSoloConcursados := 'N'
          else
            MostrarSoloConcursados := 'S';
        end
      else
        MostrarSoloConcursados := 'N';

      MostrarPrescriptos := 'S';
    end
  else
    begin
      MostrarSoloConcursados := 'N';
      MostrarPrescriptos     := 'N';
    end;

  if ( FechaHasta = 0 ) then
    sSql := 'BEGIN DEUDA.DO_GENERAPLAN(' + SqlValue(MostrarDeuda) + ', ' + SqlValue(MostrarConcursados) + ', ' + SqlValue(MostrarReclamoAFIP) + ', ' + SqlValue(MostrarSoloConcursados) + ', ' + SqlValue(MostrarPrescriptos) + ', ' + SqlValue(fContrato) + ', ' + SqlValue(Sesion.UserID) + '); END;'
  else
    sSql := 'BEGIN DEUDA.DO_GENERAPLAN(' + SqlValue(MostrarDeuda) + ', ' + SqlValue(MostrarConcursados) + ', ' + SqlValue(MostrarReclamoAFIP) + ', ' + SqlValue(MostrarSoloConcursados) + ', ' + SqlValue(MostrarPrescriptos) + ', ' + SqlValue(fContrato) + ', ' + SqlValue(Sesion.UserID) + ', ' + SqlValue(FechaHasta) + '); END;';
  EjecutarSql( sSql );

  //Los selecciona
  sSql := 'SELECT PP_PERIODO, PP_EMPLEADOS, PP_MASASALARIAL, PP_CUOTA, PP_OTROS, PP_DEUDAFINANCIADA, PP_CONTRATO CONTRATOEXT, ' +
          '       PP_HIPOACUSIA, PP_PAGADO, PP_PAGADOHIPOACUSIA, PP_PAGADOOTROS, PP_DEUDA, PP_VENCIMIENTO, PP_TASAACUMULADA, ' +
          '       PP_INTERES PP_INTERESMORA, PP_DEUDAACUMULADA DEUDATOTAL, PP_PAGADO+PP_PAGADOHIPOACUSIA+PP_PAGADOOTROS CANCELACION,' +
          '       PP_IMPORTERECLAMADO, PP_DEUDAINICIAL, PP_CONCURSADO, ART.AFILIACION.GET_CODREGIMENCONTRATO(PP_CONTRATO) CODREGIMEN ' +
          '  FROM TPP_PLANPAGO ' +
          ' WHERE PP_USUARIO = ''' + Sesion.UserID + '''' +
          ' ORDER BY PP_PERIODO';
  OpenQuery( sdqConsulta, sSql );

  tbLimpiarClick(nil);

  if MostrarSoloConcursados = 'S' then
    InfoHint(nil, 'Este contrato no ha sido derivado por Cobranzas.');
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.FSFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCargaPreAcuerdos := nil;
  Action := caFree;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.FSFormCreate(Sender: TObject);
var
  sSql, sSector: String;
  IdGestor: TTableId;
  bHabilitarGestor, bHabilitarEstudio: Boolean;
begin
  inherited;
  lblNro.Caption := '';

  tbPlanesEspeciales.Left := tbEliminar.Left;
  tbPagoACuenta.Left      := tbPlanesEspeciales.Left;

  fraPP_CONTRATO.OnChange  := CambiaContrato;
  fraPP_CONTRATO.ShowBajas := True;
  VCLExtra.LockControls([edDeuda, edInteres, edPD_DEUDAINICIAL, edTotalInteres, edSubTotal, edPP_COMISIONGESTOR, edPP_DEUDATOTAL], True);

  VCLExtra.LockControl(edPP_PORCCOMISIONGESTOR, True);

  fraPP_ESTADO.Clave := 'ESPLA';
  fraPP_ESTADO.Value := '01';
  VCLExtra.LockControls(gbEstado, True);
  chkInteresMora.Checked := True;

  sSector := Sesion.Sector;

  sSql := 'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                 'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
            'FROM USE_USUARIOS, AGC_GESTORCUENTA ' +
           'WHERE GC_USUARIO=SE_USUARIO(+) ' +
             'AND SE_SECTOR=''COB'' ';

  with fraPP_IDGESTOR do
    begin
      Sql       := sSql;
      ShowBajas := False;
      OnChange  := fraPP_IDGESTORChange;
    end;

  if sSector = 'COB' then
    begin
      sSql := 'SELECT GC_ID ' +
                'FROM AGC_GESTORCUENTA ' +
               'WHERE GC_USUARIO=' + SqlValue( Sesion.UserID );
      IdGestor := ValorSqlInteger( sSql );

      if IdGestor <> ART_EMPTY_ID then
        fraPP_IDGESTOR.Value := IdGestor;

      cmbPP_FECHAMORA.Date := DBDate();
      VCLExtra.LockControls([chkInteresMora, cmbPP_FECHAMORA]);
    end;

  sSql := 'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                 'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ', ' +
                 'UTILES.ARMAR_TELEFONO(GC_CODAREATELEFONOS, NULL, GC_TELEFONOS) "Teléfono" ' +
            'FROM AGC_GESTORCUENTA ' +
           'WHERE GC_USUARIO IS NULL ' +
             'AND GC_ESTUDIO = ''S'' ';

  with fraPP_IDESTUDIO do
  begin
    Sql         := sSql;
    ShowBajas   := False;
    ExtraFields := ', "Teléfono" ';
    VisibleExtraFields[0] := True;
    DynamicCols           := True;
    ModifyComboColCount   := False;
  end;

  FSQL_GestionDeuda := 'SELECT GD_NROORDEN ' + CD_ALIAS_ID + ', GD_NROORDEN ' + CD_ALIAS_CODIGO + ', ' +
                              'NVL(GC_NOMBRE, BO_NOMBRE) ' + CD_ALIAS_DESC + ', GD_FECHABAJA ' + CD_ALIAS_BAJA + ', ' +
                              'TB_DESCRIPCION "Tipo", BO_NOMBRE "Abogado" ' +
                         'FROM ART.CTB_TABLAS, LEGALES.LBO_ABOGADO, AGC_GESTORCUENTA, ART.LGD_GESTIONDEUDA ' +
                        'WHERE GD_GESTOR = GC_ID (+) ' +
                          'AND GD_ABOGADO = BO_ID (+) ' +
                          'AND TB_CLAVE = ''TIPGD'' ' +
                          'AND TB_CODIGO = GD_TIPO ' +
                          'AND GD_FECHABAJA IS NULL ';

  FSQL_GestionDeudaUNION := '  UNION ALL ' +
                             'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                                    'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ', ' +
                                    '''Estudio'' "Tipo", NULL "Abogado" ' +
                               'FROM AGC_GESTORCUENTA ' +
                              'WHERE GC_ESTUDIO = ''S'' ' +
                                'AND NOT EXISTS(SELECT 1 ' +
                                                 'FROM ART.LGD_GESTIONDEUDA ' +
                                                'WHERE GD_FECHABAJA IS NULL ' +
                                                  'AND GD_CONTRATO = %d)';

  with fraPP_IDGESTIONDEUDA do
  begin
    Sql       := FSQL_GestionDeuda;
    ShowBajas := False;
    OnChange  := fraPP_IDGESTIONDEUDAChange;
    ExtraFields := ', "Tipo", "Abogado" ';
    VisibleExtraFields[0] := True;
    DynamicCols           := True;
    ModifyComboColCount   := False;
  end;

  bHabilitarGestor  := HabilitarGestor();
  bHabilitarEstudio := HabilitarEstudio();

  VCLExtra.LockControl( fraPP_IDGESTOR, not bHabilitarGestor );

  VCLExtra.LockControl( gbTipo, not bHabilitarEstudio );
  VCLExtra.LockControl( fraPP_IDGESTIONDEUDA, not bHabilitarEstudio );
  VCLExtra.LockControl( fraPP_IDEstudio, True );
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.CambiaContrato(Sender: TOBject);
var
  sSql: string;
  Planes, PreAcuerdos, Convenios, CobroEstDeuda, ConvCuotaBonif: integer;
  Mensaje, Adicional, Adicional2, Adicional3, Adicional4, Adicional5: string;
begin
  //Se fija a ver si ya tiene un plan cargado o un preacuerdo
  //Si posee un plan no permite continuar
  //Si posee un preacuerdo lo permite anular y hacer otro
  if fContrato <> IntToStr(fraPP_CONTRATO.Contrato) then
  begin
    fContrato := IntToStr(fraPP_CONTRATO.Contrato);

    DoCargarGestionDeuda(fraPP_CONTRATO.Contrato);

    fraPP_IDCONTACTO.Empresa := ValorSql ('SELECT NVL(EM_ID, 0)' +
                                          '  FROM AEM_EMPRESA, ACO_CONTRATO' +
                                          ' WHERE CO_IDEMPRESA = EM_ID' +
                                          '   AND CO_CONTRATO = ''' + fContrato + '''','0');

    sSql := 'SELECT COUNT(*) ' +
             ' FROM ZPP_PLANPAGO ' +
            ' WHERE PP_CONTRATO = ' + fContrato +
            '   AND PP_ESTADO = ''01''' +
            '   AND PP_FECHABAJA IS NULL';
    PreAcuerdos := ValorSqlInteger( sSql );

    sSql := 'SELECT COUNT(*) ' +
             ' FROM ZPP_PLANPAGO ' +
            ' WHERE PP_CONTRATO = ' + fContrato +
            '   AND (PP_ESTADO = ''02'' OR PP_ESTADO = ''03'')' +
            '   AND PP_FECHABAJA IS NULL';
    Planes := ValorSqlInteger( sSql );

    sSql := 'SELECT COUNT(*) ' +
             ' FROM ZPP_PLANPAGO ' +
            ' WHERE PP_CONTRATO = ' + fContrato +
            '   AND (PP_ESTADO = ''06'' OR PP_ESTADO = ''07'')' +
            '   AND PP_FECHABAJA IS NULL';
    Convenios := ValorSqlInteger( sSql );

    sSql := 'SELECT COUNT(*) ' +
             ' FROM ZPP_PLANPAGO ' +
            ' WHERE PP_CONTRATO = ' + fContrato +
            '   AND (PP_ESTADO = ''10'' OR PP_ESTADO = ''11'')' +
            '   AND PP_FECHABAJA IS NULL';
    CobroEstDeuda := ValorSqlInteger( sSql );

    sSql := 'SELECT COUNT(*) ' +
             ' FROM ZPP_PLANPAGO ' +
            ' WHERE PP_CONTRATO = ' + fContrato +
            '   AND (PP_ESTADO = ''14'' OR PP_ESTADO = ''15'')' +
            '   AND PP_FECHABAJA IS NULL';
    ConvCuotaBonif := ValorSqlInteger( sSql );

    //Ya posee preacuerdos
    Mensaje := 'La empresa posee actualmente' + CRLF;
    Adicional := '';
    Adicional2 := '';
    Adicional3 := '';
    Adicional4 := '';
    Adicional5 := '';

    if planes=1 then
      Adicional := Adicional + '     1 plan vigente'
    else if planes>1 then
      Adicional := Adicional + '     ' + IntToStr(Planes) + ' planes vigentes';

    if Preacuerdos=1 then
      Adicional2 := Adicional2 + '     1 preacuerdo'
    else if Preacuerdos>1 then
      Adicional2 := Adicional2 + '     ' + IntToStr(Preacuerdos) + ' preacuerdos';

    if Convenios=1 then
      Adicional3 := Adicional3 + '     1 convenio vigente'
    else if Convenios>1 then
      Adicional3 := Adicional3 + '     ' + IntToStr(Convenios) + ' convenios vigentes';

    if CobroEstDeuda=1 then
      Adicional4 := Adicional4 + '     1 cobro con estado de deuda vigente'
    else if CobroEstDeuda>1 then
      Adicional4 := Adicional4 + '     ' + IntToStr(CobroEstDeuda) + ' cobros con estado de deuda vigentes';

    if ConvCuotaBonif=1 then
      Adicional5 := Adicional5 + '     1 convenio cuota bonificada vigente'
    else if ConvCuotaBonif>1 then
      Adicional5 := Adicional5 + '     ' + IntToStr(ConvCuotaBonif) + ' convenios cuota bonificada vigentes';

    //Armo el mensaje
    if Adicional <> '' then
      Mensaje := Mensaje + Adicional + CRLF;

    if Adicional2 <> '' then
      Mensaje := Mensaje + Adicional2 + CRLF;

    if Adicional3 <> '' then
      Mensaje := Mensaje + Adicional3 + CRLF;

    if Adicional4 <> '' then
      Mensaje := Mensaje + Adicional4 + CRLF;

    if Adicional5 <> '' then
      Mensaje := Mensaje + Adicional5 + CRLF;

    //muestro la cantidad de peracuerdos y planes
    if (Adicional + Adicional2 + Adicional3 + Adicional4 + Adicional5) <> '' then
      MsgBox(Mensaje);

    //Llama a la carga de deudas
    if not chkInteresMora.Checked then
      DoNuevoAcuerdo( 0 )
    else if (not cmbPP_FECHAMORA.IsEmpty) then
      DoNuevoAcuerdo( cmbPP_FECHAMORA.Date );
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
   MenuGrilla : TPopUpMenu;
   Item : TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add( Item );
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add( Item );
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add( Item );
    end;
    MenuGrilla.PopUp ( Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y );

  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.btnDesMarcarTodos( Sender: TObject );
begin
  Grid.UnselectAll;
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.btnMarcarTodos( Sender: TObject );
begin
  Grid.SelectAll;
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.ActualizaDeuda;
var
  iloop: integer;
  RegistroAnterior: TBookmark;
begin
  try
    sdqConsulta.DisableControls;
    VCLExtra.LockControls( edPD_DEUDAINICIAL, True);

    if ModoABM = maAlta then
    begin
      edDeuda.Value          := 0;
      edInteres.Value        := 0;
      edPD_DEUDAINICIAL.Value := 0;
      //loopea entre los registros de la grilla seleccionados
      RegistroAnterior := sdqConsulta.GetBookmark;
      for iloop:= 0 to Grid.SelectedRows.Count-1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iloop]));
        edDeuda.Value := edDeuda.Value + sdqConsulta.FieldByName('PP_DEUDA').AsFloat;
        edInteres.Value := edInteres.Value + sdqConsulta.FieldByName('PP_INTERESMORA').AsFloat;
        edPD_DEUDAINICIAL.Value := edPD_DEUDAINICIAL.Value + sdqConsulta.FieldByName('PP_DEUDAINICIAL').AsFloat;
      end;
      sdqConsulta.GotoBookmark(RegistroAnterior);
      sdqConsulta.FreeBookmark(RegistroAnterior);
      VCLExtra.LockControls( edDeuda, Grid.SelectedRows.Count<>1);
    end;

    if edPP_PORCDESCINTERES.Value <> 0 then
      edTotalInteres.Value := edInteres.Value * (1-edPP_PORCDESCINTERES.Value/100)
    else
      edTotalInteres.Value := edInteres.Value - edPP_MONTODESCINTERES.Value;

    edSubTotal.Value          := edDeuda.Value + edTotalInteres.Value + edPP_GASTOADMINISTRATIVO.Value;
    edPP_COMISIONGESTOR.Value := edSubTotal.Value * (edPP_PORCCOMISIONGESTOR.Value/100);
    edPP_DEUDATOTAL.Value     := edSubTotal.Value + edPP_COMISIONGESTOR.Value;
  finally
    sdqConsulta.EnableControls;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.chkInteresMoraClick(Sender: TObject);
begin
  cmbPP_FECHAMORA.Enabled := chkInteresMora.Checked;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  Nombres: array[0..10]of string;
  iloop: integer;
begin
  inherited;
  Nombres[0]  := 'PP_CUOTA';
  Nombres[1]  := 'PP_HIPOACUSIA';
  Nombres[2]  := 'PP_OTROS';
  Nombres[3]  := 'CANCELACION';
  Nombres[4]  := 'PP_DEUDA';
  Nombres[5]  := 'PP_VENCIMIENTO';
  Nombres[6]  := 'PP_INTERESMORA';
  Nombres[7]  := 'DEUDATOTAL';
  Nombres[8]  := 'PP_DEUDAINICIAL';
  Nombres[9]  := 'PP_IMPORTERECLAMADO';
  Nombres[10] := 'PP_MASASALARIAL';

  for iloop := 0 to High(Nombres) do
    if sdqConsulta.FieldByName( Nombres[iloop] ) is TFloatField Then
      TFloatField( sdqConsulta.FieldByName( Nombres[iloop] ) ).Currency := True;

  // tbPagoACuenta.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty) and Seguridad.Activar(tbPagoACuenta) and (ModoABM <> maModificacion);
  tbPagoACuenta.Enabled := Seguridad.Activar(tbPagoACuenta) and (ModoABM <> maModificacion);
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.ActualizarControles(Sender: TObject);
begin
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.tbModificarClick(Sender: TObject);
var
  sSql: string;
begin
  Verificar(((fContrato = '') or (fContrato = '0')), fraPP_CONTRATO.edContrato, 'Debe elegir un contrato válido para poder agregar el contacto.' );

  with TfrmContratoContacto.Create ( Self ) do
  begin
    sSql := 'SELECT EM_ID ' +
            '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
            ' WHERE CO_IDEMPRESA = EM_ID ' +
            '   AND CO_CONTRATO = ' + fContrato;
    DoCargarDatos(StrToInt(fContrato), StrToInt(ValorSql(sSql, '0')));
    Show;
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.btnCalcularClick(Sender: TObject);
begin
  if fContrato <> '' then
  begin
    if not fraPP_CONTRATO.IsEmpty then
    begin
      if not chkInteresMora.Checked then
        DoNuevoAcuerdo( 0 )
      else
        begin
          if cmbPP_FECHAMORA.IsEmpty then
            InvalidMsg( cmbPP_FECHAMORA, 'Debe ingresar la fecha hasta la cual se calcularán los intereses por mora.' )
          else
            DoNuevoAcuerdo( cmbPP_FECHAMORA.Date );
        end;
    end;
  end
  else
    InvalidMsg(fraPP_CONTRATO.edContrato, 'Debe elegir un contrato');
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if ( sdqConsulta.FieldByName('PP_DEUDA').AsFloat < 0 ) then
    AFont.Color := clRed;

  if Is_ReclamoAFIP() then
    AFont.Color := pnlColor2.Font.Color;

  if ( sdqConsulta.FieldByName('PP_CONCURSADO').AsString = 'S' ) then
    AFont.Color := pnlColor1.Font.Color;

  if ( sdqConsulta.FieldByName('PP_DEUDAFINANCIADA').AsFloat <> 0 ) then
    AFont.Color := pnlColor0.Font.Color;

  if Highlight then
    AFont.Color := clWhite;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.tbAprobarCuotaClick(Sender: TObject);
var
  sSql: string;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof) or (Grid.SelectedRows.Count<>1), Grid, 'Debe elegir una cuota.' );

//  Verificar((edDeuda.Value-edPD_DEUDAINICIAL.Value) > 0.01, edDeuda, 'La deuda nominal no puede ser superior a la deuda inicial.' );
//  Verificar(edDeuda.Value > sdqConsulta.FieldByName('PP_DEUDA').AsFloat, edDeuda, 'La deuda refinanciada no puede superar el saldo de deuda refinanciada.' );

  Verificar(edDeuda.Value <= 0, edDeuda, 'La deuda refinanciada debe ser mayor a 0.' );

  sSql := 'UPDATE TPP_PLANPAGO SET PP_DEUDA = ' + SqlValue(edDeuda.Value) + ' ,' +
          '       PP_INTERES = ' + SqlValue(edDeuda.Value) + '*PP_TASAACUMULADA/100, ' +
          '       PP_DEUDAACUMULADA = ' + SqlValue(edDeuda.Value) + '*(1+PP_TASAACUMULADA/100) ' +
          ' WHERE PP_PERIODO = ' + sdqConsulta.FieldByName('PP_PERIODO').AsString +
          '   AND PP_USUARIO = ' + SqlValue(Sesion.UserID);
  EjecutarSql( sSql );
  
  MsgBox('Se ha guardado el cambio correctamente.');

  sdqConsulta.Refresh;
  ActualizaDeuda;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.tbImprimirClick(Sender: TObject);
begin
  if ModoABM = maModificacion then
  begin
    with TfrmQrEstadoCuenta.Create( self ) do
    begin
      Preparar (fIDPlanPago);
      Free;
    end;
  end
  else
    InvalidMsg(nil, 'El plan debe guardarse antes de poder imprimir el Estado de Cuenta');
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.fraPP_IDGESTORChange(Sender: TObject);
var
  sSql: String;
  Comision: Double;
begin
  if (ModoABM = maAlta) and HabilitarCargaComisionEstudio then
    begin
      sSql := 'SELECT GC_COMISION ' +
                'FROM LGC_GESTORCOMISION ' +
               'WHERE GC_FECHABAJA IS NULL ' +
                 'AND NVL(GC_VIGENCIAHASTA, ACTUALDATE)>=ACTUALDATE ' +
                 'AND GC_IDGESTOR=' + SqlValue( fraPP_IDGESTOR.Value );
      Comision := ValorSqlExtended( sSql );

      edPP_PORCCOMISIONGESTOR.Value := Comision;

      ActualizaDeuda;
    end;
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.HabilitarCargaComisionEstudio: Boolean;
begin
  Result := Is_SectorLegal();
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  //Si viene del click del botón...
  if Assigned(Sender) then
  begin
    fraPP_CONTRATO.Clear;
    fraPP_IDGESTOR.Clear;
    fraPP_IDEstudio.Clear;
    fraPP_IDGESTIONDEUDA.Clear;
    fraPP_IDCONTACTO.Clear;
    chkInteresMora.Checked     := False;
    chkMostrarDeudas.Checked   := False;
    chkConcursados.Checked     := False;
    rgTipoGestionDeuda.Checked := True;
    cmbPP_FECHAMORA.Clear;
  end;

  edPD_DEUDAINICIAL.Clear;
  edDeuda.Clear;
  edInteres.Clear;
  edPP_PORCDESCINTERES.Clear;
  edPP_MONTODESCINTERES.Clear;
  edTotalInteres.Clear;
  edPP_GASTOADMINISTRATIVO.Clear;
  edSubTotal.Clear;
  edPP_PORCCOMISIONGESTOR.Clear;
  edPP_COMISIONGESTOR.Clear;
  edPP_DEUDATOTAL.Clear;
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.Get_GastosAdministrativos: Double;
var
  sSql: String;
begin
  sSql := 'SELECT DEUDA.Get_GastosAdminIntimacion ' +
            'FROM DUAL';

  Result := ValorSqlExtended( sSql );
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.Is_PeriodoConGastoAdministrativo(Contrato: Integer; Periodo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZIN_INTIMACIONPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE IN_PERIODO=' + SqlValue( Periodo ) + ' ' +
             'AND IN_IDSELCONTRACCIONPLAN=SC_ID ' +
             'AND SC_CONTRATO=' + SqlValue( Contrato );

  Result := ExisteSql( sSql );
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.AgregarGastosAdministrativos(Contrato: Integer; GastosAdmin: Currency): Boolean;
var
  iloop: Integer;
  bGastosAdministrativos: Boolean;
begin
  bGastosAdministrativos := False;

  for iloop:= 0 to Grid.SelectedRows.Count-1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iloop]));

      if Is_PeriodoConGastoAdministrativo(Contrato, sdqConsulta.FieldByName('PP_PERIODO').AsString) then
        begin
          bGastosAdministrativos := True;
          Break;
        end;
    end;

  Result := bGastosAdministrativos and (GastosAdmin = 0) and MsgAsk('Al menos uno de los periodos seleccionados involucra cartas doc. de intimación.' + CRLF + '¿Desea agregar los gastos administrativos?');
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.btnAceptarClick(Sender: TObject);
var
  bExiste: Boolean;
  sSql: String;
begin
  Verificar(edImporte.Value <= 0, edImporte, 'El importe debe ser positivo.');
  bExiste := ExisteSQLEx('SELECT 1 ' +
                           'FROM TPP_PLANPAGO ' +
                          'WHERE PP_USUARIO = :V1 ' +
                            'AND PP_PERIODO = :V2', [Sesion.UserID, edPeriodo.Periodo.Valor]);
  Verificar(bExiste, edPeriodo, 'El período seleccionado ya existe para el contrato ' + fContrato + ' en la grilla.');

  sSql := 'SELECT COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(:Contrato, :Periodo)' +
            'FROM DUAL';

  Verificar(ValorSqlIntegerEx(sSql, [fContrato, edPeriodo.Periodo.Valor]) <> 1, edPeriodo, 'El periodo no posee cobertura.');

//  sPeriodoAntAct := AddPeriodo(GetPeriodo(DBDate(), fpAnioMes), -1);
//  Verificar(edPeriodo.Periodo.Valor > sPeriodoAntAct, edPeriodo, 'No se pueden ingresar periodos para cuotas no vencidas.');

  fpPagoACuenta.ModalResult := mrOk;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.fpPagoACuentaBeforeShow(Sender: TObject);
begin
  edPeriodo.Periodo.Valor := AddPeriodo(GetPeriodo(DBDate, fpAnioMes), -1);
  edImporte.Clear;
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.Is_ReclamoAFIP: Boolean;
begin
  Is_ReclamoAFIP := (sdqConsulta.FieldByName('PP_IMPORTERECLAMADO').AsFloat <> 0);
end;
{--------------------------------------------------------------------------------------------}
function HabilitarGestor: Boolean;
begin
  Result := (not Is_SectorLegal());
end;
{--------------------------------------------------------------------------------------------}
function HabilitarEstudio: Boolean;
begin
  Result := Is_SectorLegal();
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.mnuPagoCuentaCuotaClick(Sender: TObject);
var
  sSql, sTitulo: string;
begin
  fpPagoACuenta.Caption := 'Pago a cuenta - ';

  if Sender = mnuPagoCuentaCuota then
    begin
      fTipoPagoCuenta := 'C';
      sTitulo         := 'Cuota';
    end
  else
    begin
      fTipoPagoCuenta := 'I';
      sTitulo         := 'Interés';
    end;

  fpPagoACuenta.Caption := fpPagoACuenta.Caption + sTitulo;

  if fpPagoACuenta.ShowModal = mrOk then
  begin
    with TSql.Create('TPP_PLANPAGO') do
    try
      SqlType := stInsert;
      PrimaryKey.Add('PP_USUARIO', Sesion.UserID, True);

      Fields.Add('PP_PERIODO',          edPeriodo.Periodo.Valor);

      if fTipoPagoCuenta = 'C' then    // cuota
        Fields.Add('PP_DEUDA',            edImporte.Value)
      else                             // interés
        Fields.Add('PP_INTERES',          edImporte.Value);

      Fields.Add('PP_DEUDAACUMULADA',   edImporte.Value);
      Fields.Add('PP_CONTRATO',         fContrato);
      Fields.Add('PP_VENCIMIENTO',      ValorSqlDateTimeEx('SELECT DEUDA.GET_VENCIMIENTOCUOTACONTRATO(:Contrato, :PERIODO) FROM Dual', [fContrato, edPeriodo.Periodo.Valor]));

      EjecutarSql(InsertSql);
    finally
      Free;
    end;

    sSql := 'SELECT PP_PERIODO, PP_EMPLEADOS, PP_MASASALARIAL, PP_CUOTA, PP_OTROS, PP_DEUDAFINANCIADA, PP_CONTRATO CONTRATOEXT, ' +
            '       PP_HIPOACUSIA, PP_PAGADO, PP_PAGADOHIPOACUSIA, PP_PAGADOOTROS, PP_DEUDA, PP_VENCIMIENTO, PP_TASAACUMULADA, ' +
            '       PP_INTERES PP_INTERESMORA, PP_DEUDAACUMULADA DEUDATOTAL, PP_PAGADO+PP_PAGADOHIPOACUSIA+PP_PAGADOOTROS CANCELACION,' +
            '       PP_IMPORTERECLAMADO, PP_DEUDAINICIAL, PP_CONCURSADO ' +
            '  FROM TPP_PLANPAGO ' +
            ' WHERE PP_USUARIO = :User' +
            ' ORDER BY PP_PERIODO';
    OpenQueryEx(sdqConsulta, [Sesion.UserID], sSql);
    tbLimpiarClick(nil);
  end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.tbPagoACuentaClick(Sender: TObject);
begin
  tbPagoACuenta.CheckMenuDropDown;
end;
{--------------------------------------------------------------------------------------------}
function Is_SectorLegal: Boolean;
begin
  Result := (Sesion.Sector = 'LEGAL');
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.fraPP_IDGESTIONDEUDAChange(Sender: TObject);
var
  sSql: String;
begin
  if fraPP_IDGESTIONDEUDA.cmbDescripcion.Cells[4, fraPP_IDGESTIONDEUDA.cmbDescripcion.Row] <> 'Estudio' then
  begin
    sSql := 'SELECT GD_GESTOR ' +
              'FROM ART.LGD_GESTIONDEUDA ' +
             'WHERE GD_NROORDEN = :NroOrden';
    fraPP_IDESTUDIO.Value := ValorSqlIntegerEx(sSql, [fraPP_IDGESTIONDEUDA.Value]);
  end else
    fraPP_IDESTUDIO.Value := fraPP_IDGESTIONDEUDA.Value;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.DoCargarGestionDeuda(Contrato: Integer);
begin
  fraPP_IDGESTIONDEUDA.Sql := FSQL_GestionDeuda + ' AND GD_CONTRATO = ' + SqlValue(Contrato) +
                              Format(FSQL_GestionDeudaUNION, [Contrato]);
  fraPP_IDGESTIONDEUDAChange(nil);
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.rgTipoGestionDeudaClick(Sender: TObject);
begin
  VCLExtra.LockControl( fraPP_IDGESTIONDEUDA, False );
  VCLExtra.LockControl( fraPP_IDEstudio, True );
  fraPP_IDEstudio.Clear;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.rgTipoConcQuiebraClick(Sender: TObject);
begin
  VCLExtra.LockControl( fraPP_IDGESTIONDEUDA, True );
  VCLExtra.LockControl( fraPP_IDEstudio, False );
  fraPP_IDGESTIONDEUDA.Clear;
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.GetObservaciones(var Obseravciones: String): Boolean;
var
  Observac: TStringList;
  bAceptar: Boolean;
begin
  Obseravciones := '';
  Observac      := TStringList.Create();
  with Observac do
    try
      repeat
        bAceptar := InputMemoBox('Observaciones', Observac, False, 250);
      until not (bAceptar and IsEmptyString(Observac.Text));

      if bAceptar then
        Obseravciones := Trim(Observac.Text);

      Result := bAceptar;  
    finally
      Free;
    end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.DoCargarCuotasPlan(IdPlanPago: String; EsPlanEspecial: Boolean);
begin
  frmCargaCuotas.Free;
  frmCargaCuotas := TfrmCargaCuotas.Create ( frmPrincipal );
  with frmCargaCuotas do
    begin
      PlanEspecial := EsPlanEspecial;
      DoCargar( IDPlanPago );
    end;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmCargaPreAcuerdos.DoCargarCuotas(Sender: TObject);
var
  bContinuar, bPlanEspecial, bAgregarGastosAdmin: Boolean;
  GastosAdmin: Currency;
  sObserv: String;
begin
  if ModoABM = maModificacion then
    begin
      sObserv       := GetObservacionesPlan(StrToInt(fIDPlanPago));
      bPlanEspecial := not IsEmptyString(sObserv);

      DoCargarCuotasPlan(fIDPlanPago, bPlanEspecial);
    end
  else
  begin
    sObserv := '';

    if Validar((Sender = tbPlanesEspeciales)) then
    begin
      bContinuar := (Sender = tbNuevo) or GetObservaciones(sObserv);

      if bContinuar then
        begin
          bPlanEspecial       := not IsEmptyString(sObserv);
          bAgregarGastosAdmin := AgregarGastosAdministrativos( StrToInt( fContrato ), edPP_GASTOADMINISTRATIVO.Value );

          if bAgregarGastosAdmin then
            begin
              try
                edPP_GASTOADMINISTRATIVO.OnChange := nil;   // deshabilito momentaneamente los eventos porque no es necesario que se disparen
                edPP_DEUDATOTAL.OnChange          := nil;

                GastosAdmin := Get_GastosAdministrativos;

                edPP_GASTOADMINISTRATIVO.Value := edPP_GASTOADMINISTRATIVO.Value + GastosAdmin;
                edPP_DEUDATOTAL.Value          := edPP_DEUDATOTAL.Value + GastosAdmin;
              finally
                edPP_DEUDATOTAL.OnChange          := ActualizarControles;
                edPP_GASTOADMINISTRATIVO.OnChange := ActualizarControles;
              end;
            end;

          DoGuardar(sObserv);
          DoCargarCuotasPlan(fIDPlanPago, bPlanEspecial);

          Close;
        end;
    end;
  end;
end;
{--------------------------------------------------------------------------------------------}
function GetObservacionesPlan(Id: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT PP_OBSERVACIONES ' +
            'FROM ZPP_PLANPAGO ' +
           'WHERE PP_ID = :Id';
  Result := ValorSqlEx(sSql, [Id]);
end;
{--------------------------------------------------------------------------------------------}
function TfrmCargaPreAcuerdos.Get_MinimoDeudaNominal_Planes: Double;
var
  sSql: String;
begin
  sSql := 'SELECT DEUDA.Get_MinimoDeudaNominal_Planes ' +
            'FROM DUAL';

  Result := ValorSqlExtended( sSql );
end;
{--------------------------------------------------------------------------------------------}
end.

