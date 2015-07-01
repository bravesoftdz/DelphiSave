unit unPasajeProductor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox, unfraVendedores,
  unfraVendedoresCUIT, unFraCodigoDescripcion, unfraEntidadCUIT,
  unFraStaticCodigoDescripcion, unfraStaticActividad, PatternEdit,
  CardinalEdit, CurrEdit, unFraCanal, PeriodoPicker, unArt, IntEdit, Menus;

type
  TfrmPasajeProductor = class(TfrmCustomGridABM)
    gbEmpresa: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    gbFechaSolicitud: TGroupBox;
    Label2: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    rgTipo: TRadioGroup;
    gbEntVendAnt: TGroupBox;
    gbEntidadAnt: TGroupBox;
    fraEntidadAnt: TfraEntidadCUIT;
    gbVendedorAnt: TGroupBox;
    fraVendedorAnt: TfraVendedoresCUIT;
    gbEntVendNue: TGroupBox;
    gbEntidadNue: TGroupBox;
    fraEntidadNue: TfraEntidadCUIT;
    gbVendedorNue: TGroupBox;
    fraVendedorNue: TfraVendedoresCUIT;
    rgSituacion: TRadioGroup;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    edFechaAprobadoDesde: TDateComboBox;
    edFechaAprobadoHasta: TDateComboBox;
    tbAprobar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    rgTipoAlta: TRadioGroup;
    fraEmpresaAlta: TfraEmpresa;
    lbRSocial: TLabel;
    fraActividadAlta: TfraStaticActividad;
    Label3: TLabel;
    edVigenciaDesdeAlta: TDateComboBox;
    Label4: TLabel;
    Label17: TLabel;
    edMasaSalarialAlta: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    edSumaFijaAlta: TCurrencyEdit;
    Label7: TLabel;
    edPorcMasaAlta: TCurrencyEdit;
    Label8: TLabel;
    edVigenciaTarifaAlta: TDateComboBox;
    Label9: TLabel;
    edPrimaAlta: TCurrencyEdit;
    Label10: TLabel;
    edDeudaAlta: TCurrencyEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraEntidadCUITNuevo: TfraEntidadCUIT;
    GroupBox3: TGroupBox;
    fraVendedoresCUITNuevo: TfraVendedoresCUIT;
    edCapitasAlta: TIntEdit;
    Label12: TLabel;
    Label13: TLabel;
    ppVigenciaDesdeAlta: TPeriodoPicker;
    Label14: TLabel;
    edPorcComisionAlta: TCurrencyEdit;
    edObservacionesAlta: TMemo;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    GroupBox5: TGroupBox;
    fraEntidadCUITViejo: TfraEntidadCUIT;
    GroupBox6: TGroupBox;
    fraVendedoresCUITViejo: TfraVendedoresCUIT;
    edPorcComisionAct: TCurrencyEdit;
    GroupBox7: TGroupBox;
    fraCanalAlta: TfraCanal;
    GroupBox8: TGroupBox;
    fraCanalNuevo: TfraCanal;
    fpDatosEntVend: TFormPanel;
    Bevel1: TBevel;
    btnAceptarEntVend: TButton;
    btnCancelarEntVend: TButton;
    GridEntVend: TArtDBGrid;
    sdqEntVend: TSDQuery;
    dsEntVend: TDataSource;
    Label11: TLabel;
    ppVigenciaHastaAlta: TPeriodoPicker;
    fraConceptoAlta: TfraCodigoDescripcion;
    Label15: TLabel;
    chkCartaNombramiento: TCheckBox;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpAsignacion: TMenuItem;
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraEntidadAntExit(Sender: TObject);
    procedure fraEntidadNueExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure fraEntidadCUITNuevoExit(Sender: TObject);
    procedure fraEmpresaAltaChange(Sender: TObject);
    procedure rgTipoAltaClick(Sender: TObject);
    procedure fraEntidadCUITViejoExit(Sender: TObject);
    procedure fraEntidadCUITNuevoChange(Sender: TObject);
    procedure fraVendedoresCUITNuevoChange(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpAsignacionClick(Sender: TObject);
    procedure sdqEntVendAfterScroll(DataSet: TDataSet);
  protected
    procedure RefreshData; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  private
    FIdVendedorContrato: TTableId;
    FIdEntVend: TTableId;
    function GetSqlDatosContrato: String;
    function GetFilaDatosContrato(Contrato: Integer): Integer;
    procedure DoLimpiarDatos;
    procedure DoBajaCerrarVendedorContrato(IdAVC, IdXCO: TTableId; VigDesde: String);
  public
  end;

var
  frmPasajeProductor: TfrmPasajeProductor;

implementation

uses
  AnsiSql, unDmPrincipal, General, SqlFuncs, unSesion, CustomDlgs, DateTimeFuncs,
  VclExtra, Numeros, Periodo, StrFuncs, unRptAsignacionComision, unComisiones;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  fraEntidadAnt.Clear;
  fraVendedorAnt.Clear;
  fraEntidadNue.Clear;
  fraVendedorNue.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaAprobadoDesde.Clear;
  edFechaAprobadoHasta.Clear;
  rgTipo.ItemIndex      := 3;  // Todos
  rgSituacion.ItemIndex := 2;  // Todos

  fraEntidadAnt.Clear;
  fraVendedorAnt.Entidad := ART_EMPTY_ID;
  fraVendedorAnt.Clear;

  fraEntidadNue.Clear;
  fraVendedorNue.Entidad := ART_EMPTY_ID;
  fraVendedorNue.Clear;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEntidadAntExit(Sender: TObject);
begin
  inherited;
  fraEntidadAnt.FrameExit(Sender);
  fraVendedorAnt.Entidad := fraEntidadAnt.Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEntidadNueExit(Sender: TObject);
begin
  inherited;
  fraEntidadNue.FrameExit(Sender);
  fraVendedorNue.Entidad := fraEntidadNue.Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.FormCreate(Sender: TObject);
begin
  inherited;

  with fraConceptoAlta do
    begin
      TableName   := 'XCO_CONCEPTO';
      FieldCodigo := 'CO_ID';
      FieldID     := 'CO_ID';
      FieldDesc   := 'CO_DESCRIPCION';
      FieldBaja   := 'CO_FECHABAJA';
      ShowBajas   := False;
    end;

  fraEmpresaFiltro.ShowBajas   := True;
  fraEntidadAnt.ShowBajas      := True;
  fraVendedorAnt.ShowBajas     := True;
  fraEntidadNue.ShowBajas      := True;
  fraVendedorNue.ShowBajas     := True;

  fraEmpresaAlta.OnChange         := fraEmpresaAltaChange;
  fraEntidadCUITNuevo.OnChange    := fraEntidadCUITNuevoChange;

  with fraVendedoresCUITNuevo do
    begin
      OnChange         := fraVendedoresCUITNuevoChange;
      ShowBajasEntVend := False;
    end;

  fraCanalAlta.FiltraUsuario   := False;
  fraCanalNuevo.FiltraUsuario  := False;

  fraEntidadCUITNuevo.ShowBajas    := False;
  fraVendedoresCUITNuevo.ShowBajas := False;

  with fraEmpresaAlta do
    begin
      ExtraCondition := ' AND CO_ESTADO IN (''1'', ''9'')';
      ShowBajas      := True;
    end;

  ShowActived := False;
  FieldBaja   := 'PV_FECHABAJA';
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'PV_SUMAFIJA' ) is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName( 'PV_SUMAFIJA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PV_MASASALARIAL' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PV_MASASALARIAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PV_PRIMA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PV_PRIMA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PV_DEUDA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PV_DEUDA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PV_PORCMASA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName('PV_PORCMASA') ).DisplayFormat := '% 0.0000;-% 0.0000';

  if sdqConsulta.FieldByName( 'COMISION_ANT' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName('COMISION_ANT') ).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName( 'COMISION_NVO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName('COMISION_NVO') ).DisplayFormat := '% 0.00;-% 0.00';
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'La fecha de aprobación debe ser nula.');

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.DoBajaCerrarVendedorContrato(IdAVC, IdXCO: TTableId; VigDesde: String);
var
  sSql: String;
begin
  if AddPeriodo(sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString, -1) < VigDesde then
    begin
      sSql := 'UPDATE AVC_VENDEDORCONTRATO ' +
                 'SET VC_FECHABAJA = SYSDATE, ' +
                     'VC_USUBAJA = :Usuario ' +
               'WHERE VC_ID = :VcId';
      EjecutarSqlSTEx(sSql, [Sesion.UserId, IdAVC]);
    end
  else
    begin
      sSql := 'UPDATE AVC_VENDEDORCONTRATO ' +
                 'SET VC_VIGENCIAHASTA = UTILES.PERIODO_ANTERIOR(:VigDesde), ' +
                     'VC_FECHACIERRE = SYSDATE, ' +
                     'VC_USUCIERRE = :Usuario ' +
               'WHERE VC_ID = :VcId';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString, Sesion.UserId, IdAVC]);
    end;

  sSql := 'SELECT 1 ' +
            'FROM AVC_VENDEDORCONTRATO, XPC_PAGOCOMISION ' +
           'WHERE PC_IDVENDCONTRATO = VC_ID ' +
             'AND VC_ID = :VcId ' +
             'AND VC_CONTRATO = :Contrato ' +
             'AND PC_PERIODO >= UTILES.PERIODO_ANTERIOR(:VigDesde) ' +
             'AND PC_PERIODO <= TO_CHAR(COMISION.GET_ULTFECHACIERRE, ''YYYYMM'')';
  if ExisteSqlEx(sSql, [IdAVC, sdqConsulta.FieldByName('CO_CONTRATO').AsInteger, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString]) then
    begin
      sSql := 'COMISION.DO_AJUSTECOMISIONES(:VcId, :IdConcepto, :VigDesde, TO_CHAR(COMISION.GET_ULTFECHACIERRE, ''YYYYMM''), ''D'', :Usuario);';
      EjecutarStoreSTEx(sSql, [IdAVC,  IdXCO, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString, Sesion.UserId]);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.tbAprobarClick(Sender: TObject);
var
  sSql: String;
  iSecAVC: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro de la grilla.');
  Verificar(not sdqConsulta.FieldByName('PV_FECHABAJA').IsNull, Grid, 'La solicitud se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, Grid, 'La solicitud ya se encuentra aprobada.');

  if MsgBox('¿Está seguro de querer aprobar la solicitud?', MB_YESNO + MB_ICONQUESTION, 'Confirmación') = IDYES then
    begin
      BeginTrans;
      try
        if (sdqConsulta.FieldByName('PV_TIPO').AsString = 'I') or (sdqConsulta.FieldByName('PV_TIPO').AsString = 'N') then        // Individual o Concepto
          begin
            if sdqConsulta.FieldByName('PV_TIPO').AsString = 'I' then
              begin
                sSql := 'SELECT VC_ID AVCID, VC_VIGENCIADESDE AVCVIGDESDE ' +
                          'FROM AVC_VENDEDORCONTRATO ' +
                         'WHERE VC_CONTRATO = :Contrato ' +
                           'AND VC_FECHABAJA IS NULL ' +
                           'AND VC_VIGENCIAHASTA IS NULL ' +
                           'AND VC_IDCONCEPTO = 2';   // 2: Mantenimiento
                with GetQueryEx(sSql, [sdqConsulta.FieldByName('CO_CONTRATO').AsInteger]) do
                  try
                    if not Eof then
                      DoBajaCerrarVendedorContrato(FieldByName('AVCID').AsInteger, 2, FieldByName('AVCVIGDESDE').AsString);    // 2: Mantenimiento
                  finally
                    Free;
                  end;

                DoBajaCerrarVendedorContrato(sdqConsulta.FieldByName('VC_ID').AsInteger, sdqConsulta.FieldByName('IDCONCEPTO').AsInteger, sdqConsulta.FieldByName('VC_VIGENCIADESDE').AsString);
              end;

            iSecAVC := GetSecNextVal('SEQ_AVC_ID');

            sSql := 'INSERT INTO AVC_VENDEDORCONTRATO(VC_ID, VC_FECHAALTA, VC_USUALTA, VC_CONTRATO, ' +
                                                     'VC_IDENTIDADVEND, VC_PORCCOMISION, VC_VIGENCIADESDE, ' +
                                                     'VC_VIGENCIAHASTA, VC_PLANPAGO, VC_IDCONCEPTO, ' +
                                                     'VC_NOMBRAMIENTO) ' +
                       'VALUES(:VcId, SYSDATE, :Usuario, :Contrato, :IdNuevoEntVend, :PorcComision, ' +
                              ':VigenciaDesde, :VigenciaHasta, ''N'', :IdConcepto, :Nombramiento)';
            EjecutarSqlSTEx(sSql, [iSecAVC, Sesion.UserId, sdqConsulta.FieldByName('CO_CONTRATO').AsInteger, sdqConsulta.FieldByName('PV_IDNUEVOENTVEND').AsInteger,
                                   sdqConsulta.FieldByName('COMISION_NVO').AsFloat, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString,
                                   sdqConsulta.FieldByName('PV_VIGENCIAHASTA').AsString,
                                   Iif(sdqConsulta.FieldByName('IDCONCEPTO').IsNull, '', sdqConsulta.FieldByName('IDCONCEPTO').AsInteger),
                                   sdqConsulta.FieldByName('PV_NOMBRAMIENTO').AsString]);

            Do_InsertarComisionGranOrgnizador(iSecAVC, False);

            sSql := 'SELECT 1 ' +
                      'FROM ZMO_MOVIMIENTO ' +
                     'WHERE MO_CONTRATO = :Contrato ' +
                       'AND MO_PERIODO >= :VigDesde ' +
                       String(Iif(sdqConsulta.FieldByName('PV_VIGENCIAHASTA').IsNull, '', 'AND MO_PERIODO <= ' + SqlValue(sdqConsulta.FieldByName('PV_VIGENCIAHASTA').AsString + ' '))) +
                       'AND MO_IDCIERREPAGO IS NOT NULL';
            if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('CO_CONTRATO').AsInteger, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString]) then
              begin
                sSql := 'COMISION.DO_AJUSTECOMISIONES(:VcId, :IdConcepto, :VigDesde, :VigHasta, ''C'', :Usuario);';
                EjecutarStoreSTEx(sSql, [iSecAVC, sdqConsulta.FieldByName('IDCONCEPTO').AsInteger, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString,
                                         String(Iif(sdqConsulta.FieldByName('PV_VIGENCIAHASTA').IsNull, 'TO_CHAR(COMISION.GET_ULTFECHACIERRE, ''YYYYMM'')', sdqConsulta.FieldByName('PV_VIGENCIAHASTA').AsString)),
                                         Sesion.UserId]);
              end;
          end

        else if sdqConsulta.FieldByName('PV_TIPO').AsString = 'C' then   // Cartera
          begin
            sSql := 'COMISION.DO_CAMBIOENTVEND(:EvId, :IdNuevoEntVend, :PorcComision, UTILES.PERIODO_ANTERIOR(:VigDesde), :Usuario);';
            EjecutarStoreSTEx(sSql, [sdqConsulta.FieldByName('EVID_ANT').AsInteger, sdqConsulta.FieldByName('PV_IDNUEVOENTVEND').AsInteger,
                                     sdqConsulta.FieldByName('COMISION_NVO').AsFloat, sdqConsulta.FieldByName('PV_VIGENCIADESDE').AsString, Sesion.UserId]);
          end;

        sSql := 'UPDATE XPV_PASAJEVENDEDOR ' +
                   'SET PV_FECHAAPROBADO = SYSDATE, ' +
                       'PV_USUAPROBADO = :Usuario ' +
                 'WHERE PV_ID = :PvId';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('PV_ID').AsInteger]);

        CommitTrans;

        MsgBox('La solicitud ha sido aprobada correctamente', MB_ICONINFORMATION);
        tbRefrescarClick( nil );
      except
        on E: Exception do
          begin
            Rollback;
            ErrorMsg( E );
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
function TfrmPasajeProductor.DoABM: Boolean;
var
  IdEntVend, XPVId: TTableId;
  sTipo: String;
begin
  Sql.Clear;
  Sql.TableName := 'XPV_PASAJEVENDEDOR';

  if ModoABM = maAlta then
    XPVId := GetSecNextVal('SEQ_XPV_ID')
  else
    XPVId := sdqConsulta.FieldByName('PV_ID').AsInteger;

  Sql.PrimaryKey.Add('PV_ID', XPVId, False);

  if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;

      Sql.Fields.Add('PV_USUBAJA',             Sesion.UserID);
      Sql.Fields.Add('PV_FECHABAJA',           SQL_DATETIME, False);
    end
  else if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;

      case rgTipoAlta.ItemIndex of
        0: sTipo := 'I';
        1: sTipo := 'C';
        2: sTipo := 'N';
      end;

      Sql.Fields.Add( 'PV_TIPO',               sTipo );
      Sql.Fields.AddInteger( 'PV_CONTRATO',    fraEmpresaAlta.Contrato, True );
      Sql.Fields.Add( 'PV_CAPITAS',            edCapitasAlta.Value, dtNumber );
      Sql.Fields.Add( 'PV_MASASALARIAL',       edMasaSalarialAlta.Value, dtNumber );
      Sql.Fields.Add( 'PV_SUMAFIJA',           edSumaFijaAlta.Value, dtNumber );
      Sql.Fields.Add( 'PV_PORCMASA',           edPorcMasaAlta.Value, dtNumber );
      if edVigenciaTarifaAlta.Date <> 0 then
        Sql.Fields.Add( 'PV_VIGENCIATARIFA',   edVigenciaTarifaAlta.Date );
      Sql.Fields.Add( 'PV_PRIMA',              edPrimaAlta.Value, dtNumber );
      Sql.Fields.Add( 'PV_DEUDA',              edDeudaAlta.Value, dtNumber );

      if sTipo = 'I' then
        Sql.Fields.AddInteger('PV_IDVENDEDORCONTRATO', FIdVendedorContrato, True);

      if sTipo = 'I' then
        IdEntVend := FIdEntVend
      else if sTipo = 'C' then
        IdEntVend := fraVendedoresCUITViejo.EntidadVendedor
      else
        IdEntVend := ART_EMPTY_ID;

      if IdEntVend <> ART_EMPTY_ID then
        Sql.Fields.AddInteger('PV_IDENTVEND',  IdEntVend, True);

      Sql.Fields.Add( 'PV_IDNUEVOENTVEND',     fraVendedoresCUITNuevo.EntidadVendedor );
      Sql.Fields.Add( 'PV_PORCCOMISION',       edPorcComisionAlta.Value, dtNumber );
      Sql.Fields.Add( 'PV_VIGENCIADESDE',      ppVigenciaDesdeAlta.Periodo.Valor );
      Sql.Fields.Add( 'PV_VIGENCIAHASTA',      ppVigenciaHastaAlta.Periodo.Valor );
      Sql.Fields.Add( 'PV_OBSERVACIONES',      edObservacionesAlta.Lines.Text );
      Sql.Fields.Add( 'PV_IDCONCEPTO',         fraConceptoAlta.Value );
      Sql.Fields.Add( 'PV_NOMBRAMIENTO',       String(Iif(chkCartaNombramiento.Checked, 'S', 'N')) );
      Sql.Fields.Add( 'PV_FECHAALTA',          SQL_DATETIME, False );
      Sql.Fields.Add( 'PV_USUALTA',            Sesion.UserID );
    end;

  Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.ClearControls;
begin
  rgTipoAlta.ItemIndex := 0;    // Individual
  rgTipoAltaClick(nil);

  fraEmpresaAlta.Clear;
  fraActividadAlta.Clear;
  edVigenciaDesdeAlta.Clear;
  edCapitasAlta.Clear;
  edMasaSalarialAlta.Clear;
  edSumaFijaAlta.Clear;
  edPorcMasaAlta.Clear;
  edVigenciaTarifaAlta.Clear;
  edPrimaAlta.Clear;
  edDeudaAlta.Clear;
  fraCanalAlta.Clear;

  fraEntidadCUITViejo.Clear;
  fraVendedoresCUITViejo.Clear;
  fraVendedoresCUITViejo.Entidad := ART_EMPTY_ID;

  edPorcComisionAct.Clear;
  fraCanalNuevo.Clear;

  fraEntidadCUITNuevo.Clear;
  fraVendedoresCUITNuevo.Entidad := ART_EMPTY_ID;
  fraVendedoresCUITNuevo.Clear;

  edPorcComisionAlta.Clear;
  ppVigenciaDesdeAlta.Clear;
  ppVigenciaHastaAlta.Clear;
  edObservacionesAlta.Clear;

  with fraConceptoAlta do
    begin
      Clear;
      Sql := '';
    end;
      
  chkCartaNombramiento.Checked := False;

  VclExtra.LockControls([fraActividadAlta, edVigenciaDesdeAlta, edCapitasAlta, edMasaSalarialAlta, edSumaFijaAlta, edPorcMasaAlta, edVigenciaTarifaAlta, edPrimaAlta, edDeudaAlta, fraCanalAlta, fraCanalNuevo, edPorcComisionAct], True);
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.LoadControls;
begin
  inherited;
end;
{------------------------------------------------------------------------------}
function TfrmPasajeProductor.Validar: Boolean;
begin
  Verificar(rgTipoAlta.ItemIndex = -1, rgTipoAlta, 'El tipo es obligatorio.');
  Verificar(((rgTipoAlta.ItemIndex = 0) or (rgTipoAlta.ItemIndex = 2)) and fraEmpresaAlta.IsEmpty, fraEmpresaAlta.edContrato, 'El contrato es obligatorio.');

  if rgTipoAlta.ItemIndex = 1 then   // Cartera
    begin
      Verificar(not fraEntidadCUITViejo.IsSelected, fraEntidadCUITViejo.mskCuit, 'La entidad es obligatoria.');
      Verificar(not fraVendedoresCUITViejo.IsSelected, fraVendedoresCUITViejo.mskCuit, 'El vendedor es obligatorio.');
    end;

  Verificar(not fraEntidadCUITNuevo.IsSelected, fraEntidadCUITNuevo.mskCuit, 'La entidad es obligatoria.');
  Verificar(not fraVendedoresCUITNuevo.IsSelected, fraVendedoresCUITNuevo.mskCuit, 'El vendedor es obligatorio.');
  Verificar(fraConceptoAlta.IsEmpty, fraConceptoAlta, 'El concepto es obligatorio.');
  Verificar(ppVigenciaDesdeAlta.Periodo.Valor = '', ppVigenciaDesdeAlta, 'El periodo AFIP desde es obligatorio.');
  Verificar(not IsEmptyString(ppVigenciaHastaAlta.Periodo.Valor) and (ppVigenciaDesdeAlta.Periodo.Valor > ppVigenciaHastaAlta.Periodo.Valor), ppVigenciaHastaAlta, 'El periodo AFIP hasta no puede ser menor que el periodo AFIP desde.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEntidadCUITNuevoExit(Sender: TObject);
begin
  inherited;
  fraEntidadCUITNuevo.FrameExit(Sender);
  fraVendedoresCUITNuevo.Entidad := fraEntidadCUITNuevo.Value;
end;
{------------------------------------------------------------------------------}
function TfrmPasajeProductor.GetSqlDatosContrato: String;
var
  sSql: String;
begin
  sSql := 'SELECT EN_CODBANCO ENTIDAD, EN_NOMBRE NOMBRE_ENTIDAD, VE_VENDEDOR VENDEDOR, VE_NOMBRE NOMBRE_VENDEDOR, ' +
                 'CA_CODIGO, EN_ID, VE_ID, VC_PORCCOMISION, VC_ID, EV_ID, ROWNUM NUMFILA ' +
            'FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, ACA_CANAL, AVC_VENDEDORCONTRATO, ' +
                 'ACO_CONTRATO ' +
           'WHERE VC_CONTRATO = CO_CONTRATO ' +
             'AND EV_ID = VC_IDENTIDADVEND ' +
             'AND EN_ID = EV_IDENTIDAD ' +
             'AND VE_ID = EV_IDVENDEDOR ' +
             'AND CA_ID = EN_IDCANAL ' +
             'AND VC_VIGENCIAHASTA IS NULL ' +
             'AND VC_FECHABAJA IS NULL ' +
             'AND VC_IDCONCEPTO = 1 ' +    // Comisiones
             'AND CO_CONTRATO = :Contrato ' +
             Iif(rgTipoAlta.ItemIndex = 2, 'AND ROWNUM = 1', '');    // Concepto

  Result := sSql;
end;
{------------------------------------------------------------------------------}
function TfrmPasajeProductor.GetFilaDatosContrato(Contrato: Integer): Integer;
var
  sSql: String;
  iCantReg, iFila: Integer;
begin
  if Contrato = 0 then
    iFila := 0
  else
    begin
      sSql := GetSqlDatosContrato();
      OpenQueryEx(sdqEntVend, [Contrato], sSql);

      iCantReg := sdqEntVend.RecordCount;

      if iCantReg <= 1 then
        iFila := iCantReg
      else
        begin
          if fpDatosEntVend.ShowModal = mrOk then
            iFila := sdqEntVend.FieldByName('NUMFILA').AsInteger
          else
            iFila := -1;
        end;
    end;

  Result := iFila;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEmpresaAltaChange(Sender: TObject);
var
  sSql: String;
  iContrato, iFila: Integer;
begin
  iContrato := fraEmpresaAlta.Contrato;

  sSql := 'SELECT AC_CODIGO, CO_VIGENCIADESDE, RC_EMPLEADOS, RC_MASASALARIAL, ' +
                 'TC_SUMAFIJA, TC_PORCMASA, TC_VIGENCIATARIFA, RC_DEVENGADOCUOTA, ' +
                 'ART.DEUDA.GET_TOTALDEUDA(CO_CONTRATO) DEUDA ' +
            'FROM ZRC_RESUMENCOBRANZA, ATC_TARIFARIOCONTRATO, CAC_ACTIVIDAD, ACO_CONTRATO ' +
           'WHERE AC_ID = CO_IDACTIVIDAD ' +
             'AND TC_CONTRATO = CO_CONTRATO ' +
             'AND RC_CONTRATO = CO_CONTRATO ' +
             'AND RC_PERIODO = (SELECT MAX(RC_PERIODO) ' +
                                 'FROM ZRC_RESUMENCOBRANZA ' +
                                'WHERE RC_CONTRATO = CO_CONTRATO ' +
                                  'AND RC_PERIODO <= TO_CHAR(SYSDATE, ''YYYYMM'')) ' +
             'AND CO_CONTRATO = :Contrato';
  with GetQueryEx(sSql, [iContrato]) do
    try
      if Eof then
        begin
          fraActividadAlta.Clear;
          edVigenciaDesdeAlta.Clear;
          edCapitasAlta.Clear;
          edMasaSalarialAlta.Clear;
          edSumaFijaAlta.Clear;
          edPorcMasaAlta.Clear;
          edVigenciaTarifaAlta.Clear;
          edPrimaAlta.Clear;
          edDeudaAlta.Clear;
        end
      else
        begin
          fraActividadAlta.Codigo   := FieldByName('AC_CODIGO').AsString;
          edVigenciaDesdeAlta.Date  := FieldByName('CO_VIGENCIADESDE').AsDateTime;
          edCapitasAlta.Value       := FieldByName('RC_EMPLEADOS').AsInteger;
          edMasaSalarialAlta.Value  := FieldByName('RC_MASASALARIAL').AsCurrency;
          edSumaFijaAlta.Value      := FieldByName('TC_SUMAFIJA').AsCurrency;
          edPorcMasaAlta.Value      := FieldByName('TC_PORCMASA').AsFloat;
          edVigenciaTarifaAlta.Date := FieldByName('TC_VIGENCIATARIFA').AsDateTime;
          edPrimaAlta.Value         := FieldByName('RC_DEVENGADOCUOTA').AsCurrency;
          edDeudaAlta.Value         := FieldByName('DEUDA').AsCurrency;
        end;
    finally
      free;
    end;

  iFila := GetFilaDatosContrato(iContrato);
  if iFila > 0 then
    begin
      sSql := 'SELECT * ' +
                'FROM (' + GetSqlDatosContrato() + ') ' +
               'WHERE NUMFILA = :Fila';
      with GetQueryEx(sSql, [iContrato, iFila]) do
        try
          if not eof then
            begin
              if rgTipoAlta.ItemIndex = 2 then   // Concepto
                begin
                  fraCanalAlta.Clear;
                  fraEntidadCUITViejo.Clear;
                  fraVendedoresCUITViejo.Clear;
                  edPorcComisionAct.Clear;
                end
              else
                begin
                  fraCanalAlta.Codigo            := FieldByName('CA_CODIGO').AsString;
                  fraEntidadCUITViejo.Value      := FieldByName('EN_ID').AsInteger;
                  fraVendedoresCUITViejo.Entidad := fraEntidadCUITViejo.Value;
                  fraVendedoresCUITViejo.Value   := FieldByName('VE_ID').AsInteger;
                  edPorcComisionAct.Value        := FieldByName('VC_PORCCOMISION').AsFloat;
                end;

              FIdVendedorContrato            := FieldByName('VC_ID').AsInteger;
              FIdEntVend                     := FieldByName('EV_ID').AsInteger;
            end;
        finally
          free;
        end;
    end
  else
    begin
      fraCanalAlta.Clear;
      fraEntidadCUITViejo.Clear;
      fraVendedoresCUITViejo.Clear;
      fraVendedoresCUITViejo.Entidad := ART_EMPTY_ID;
      edPorcComisionAct.Clear;

      FIdVendedorContrato := ART_EMPTY_ID;
      FIdEntVend          := ART_EMPTY_ID;

      if iFila = -1 then
        fraEmpresaAlta.Clear;
    end;

  fraVendedoresCUITNuevoChange(nil);    
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.rgTipoAltaClick(Sender: TObject);
var
  bNoConcepto, bContrato: Boolean;
begin
  bContrato   := ((rgTipoAlta.ItemIndex = 0) or (rgTipoAlta.ItemIndex = 2));   // Invididual o Concepto
  bNoConcepto := rgTipoAlta.ItemIndex <> 2;   // no es Concepto

  VclExtra.LockControls([fraEntidadCUITViejo, fraVendedoresCUITViejo], bContrato);
  VclExtra.LockControls([fraEmpresaAlta], not bContrato);
  VclExtra.LockControls(ppVigenciaHastaAlta, bNoConcepto);

  fraEntidadCUITViejo.ShowBajas    := bContrato;
  fraVendedoresCUITViejo.ShowBajas := bContrato;

  if not bContrato then
    fraEmpresaAlta.Clear;

  if bNoConcepto then
    ppVigenciaHastaAlta.Clear;

  fraEmpresaAltaChange(nil);
  fraVendedoresCUITNuevoChange(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEntidadCUITViejoExit(Sender: TObject);
begin
  inherited;
  fraEntidadCUITViejo.FrameExit(Sender);
  fraVendedoresCUITViejo.Entidad := fraEntidadCUITViejo.Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraEntidadCUITNuevoChange(Sender: TObject);
var
  sCodCanal, sSql: String;
begin
  sSql := 'SELECT CA_CODIGO ' +
            'FROM XEN_ENTIDAD, ACA_CANAL ' +
           'WHERE EN_IDCANAL = CA_ID ' +
             'AND EN_ID = :Id';
  sCodCanal := ValorSqlEx(sSql, [fraEntidadCUITNuevo.Value]);
  fraCanalNuevo.Codigo := sCodCanal;

  DoLimpiarDatos;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.RefreshData;
var
  sSql,sWhere : String;
begin
  sWhere := SqlBetweenDateTime(' AND PV_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date) +
            SqlBetweenDateTime(' AND PV_FECHAAPROBADO', edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date);

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND PV_CONTRATO=' + SqlValue( fraEmpresaFiltro.Contrato );

  case rgTipo.ItemIndex of
    0: sWhere := sWhere + ' AND PV_TIPO = ''I''';   // individual
    1: sWhere := sWhere + ' AND PV_TIPO = ''C''';   // cartera
    2: sWhere := sWhere + ' AND PV_TIPO = ''N''';   // concepto
  end;

  case rgSituacion.ItemIndex of
    0: sWhere := sWhere + ' AND PV_FECHAAPROBADO IS NOT NULL';   // aprobado
    1: sWhere := sWhere + ' AND PV_FECHAAPROBADO IS NULL';       // no aprobado
  end;

  if fraEntidadAnt.IsSelected and fraVendedorAnt.IsSelected then
    sWhere := sWhere + ' AND PV_IDENTVEND = ' + SqlValue(fraVendedorAnt.EntidadVendedor);

  if fraEntidadNue.IsSelected and fraVendedorNue.IsSelected then
    sWhere := sWhere + ' AND PV_IDNUEVOENTVEND = ' + SqlValue(fraVendedorNue.EntidadVendedor);


  sSql := 'SELECT DECODE(PV_TIPO, ''I'', ''Pasaje Individual'', ''C'', ''Pasaje Cartera'', ''N'', ''Nuevo Concepto'') TIPO, ' +
                 'EM_NOMBRE, EM_CUIT, CO_CONTRATO, AC_CODIGO, AC_DESCRIPCION, CO_VIGENCIADESDE, ' +
                 'PV_CAPITAS, PV_MASASALARIAL, PV_SUMAFIJA, PV_PORCMASA, PV_VIGENCIATARIFA, ' +
                 'PV_PRIMA, PV_DEUDA, PV_ID, PV_FECHABAJA, ACA_ANT.CA_DESCRIPCION CANAL_ANT, ' +
                 'XEN_ANT.EN_CODBANCO ENTIDAD_ANT, XEN_ANT.EN_NOMBRE NOMBRE_ENTIDAD_ANT, ' +
                 'XVE_ANT.VE_VENDEDOR VENDEDOR_ANT, XVE_ANT.VE_NOMBRE NOMBRE_VENDEDOR_ANT, XEV_ANT.EV_ID EVID_ANT, ' +
                 'VC_PORCCOMISION COMISION_ANT, ACA_NVO.CA_DESCRIPCION CANAL_NVO, TRUNC(PV_FECHAAPROBADO) FECHAAPROBADO, ' +
                 'XEN_NVO.EN_CODBANCO ENTIDAD_NVO, XEN_NVO.EN_NOMBRE NOMBRE_ENTIDAD_NVO, ' +
                 'XVE_NVO.VE_VENDEDOR VENDEDOR_NVO, XVE_NVO.VE_NOMBRE NOMBRE_VENDEDOR_NVO, ' +
                 'PV_PORCCOMISION COMISION_NVO, PV_VIGENCIADESDE, PV_OBSERVACIONES, PV_TIPO, VC_ID, ' +
                 'PV_IDNUEVOENTVEND, VC_VIGENCIADESDE, CO_DESCRIPCION DESCRCONCEPTO, ' +
                 'PV_VIGENCIAHASTA, PV_NOMBRAMIENTO, PV_IDCONCEPTO IDCONCEPTO ' +
            'FROM XCO_CONCEPTO, XVE_VENDEDOR XVE_ANT, XEN_ENTIDAD XEN_ANT, XEV_ENTIDADVENDEDOR XEV_ANT, ACA_CANAL ACA_ANT, ' +
                 'XVE_VENDEDOR XVE_NVO, XEN_ENTIDAD XEN_NVO, XEV_ENTIDADVENDEDOR XEV_NVO, ACA_CANAL ACA_NVO, ' +
                 'AVC_VENDEDORCONTRATO, CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CONTRATO, XPV_PASAJEVENDEDOR ' +
           'WHERE CO_CONTRATO(+) = PV_CONTRATO ' +
             'AND EM_ID(+) = CO_IDEMPRESA ' +
             'AND AC_ID(+) = CO_IDACTIVIDAD ' +
             'AND VC_ID(+) = PV_IDVENDEDORCONTRATO ' +
             'AND XEV_ANT.EV_ID(+) = PV_IDENTVEND ' +
             'AND XEN_ANT.EN_ID(+) = XEV_ANT.EV_IDENTIDAD ' +
             'AND XVE_ANT.VE_ID(+) = XEV_ANT.EV_IDVENDEDOR ' +
             'AND ACA_ANT.CA_ID(+) = XEN_ANT.EN_IDCANAL ' +
             'AND XEV_NVO.EV_ID = PV_IDNUEVOENTVEND ' +
             'AND XEN_NVO.EN_ID = XEV_NVO.EV_IDENTIDAD ' +
             'AND XVE_NVO.VE_ID = XEV_NVO.EV_IDVENDEDOR ' +
             'AND ACA_NVO.CA_ID = XEN_NVO.EN_IDCANAL ' +
             'AND PV_IDCONCEPTO = CO_ID(+)';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.fraVendedoresCUITNuevoChange(Sender: TObject);
var
  sSql, sSector: String;
begin
  if fraVendedoresCUITNuevo.IsSelected then
    begin
      sSql := 'SELECT EM_SECTOR ' +
                'FROM AEM_EMPRESA ' +
               'WHERE EM_CUIT = :Cuit';
      sSector := ValorSqlEx(sSql, [fraEmpresaAlta.Cuit]);

      fraConceptoAlta.Sql := 'SELECT CO_ID ' + CD_ALIAS_ID + ', CO_ID ' + CD_ALIAS_CODIGO + ', CO_DESCRIPCION ' + CD_ALIAS_DESC + ', ' +
                                    'CO_FECHABAJA ' + CD_ALIAS_BAJA + ', ' +
                                    'CASE WHEN NVL(' + SqlValue(sSector) + ', ''4'') = ''4'' THEN VC_PORCPRIVADO ELSE NVL(VC_PORCPUBLICO, VC_PORCPRIVADO) END COMISION ' +
                               'FROM XCO_CONCEPTO, XVC_ENTVENDCONCEPTO ' +
                              'WHERE CO_ID = VC_IDCONCEPTO ' +
                                'AND CO_ASIGNABLECONTRATO = ''S'' ' +
                                'AND VC_FECHABAJA IS NULL ' +
                                'AND VC_FECHAAPROBADO IS NOT NULL ' +
                                'AND VC_IDENTIDADVEND = ' + SqlValue(fraVendedoresCUITNuevo.EntidadVendedor) + ' ' +
                               Iif(rgTipoAlta.ItemIndex <> 2, 'AND CO_ID = 1', '');

      sSql := fraConceptoAlta.Sql;
      with GetQuery(sSql) do
        try
          fraConceptoAlta.Value    := FieldByname(CD_ALIAS_ID).AsInteger;
          edPorcComisionAlta.Value := FieldByname('COMISION').AsFloat;
        finally
          Free;
        end;
    end
  else
    DoLimpiarDatos;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.DoLimpiarDatos;
begin
  fraVendedoresCUITNuevo.Clear;
  fraConceptoAlta.Clear;
  edPorcComisionAlta.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.mnuImpAsignacionClick(Sender: TObject);
begin
  DoImprimirAsignacionComision(sdqConsulta.FieldByName('PV_ID').AsInteger);
end;
{------------------------------------------------------------------------------}
procedure TfrmPasajeProductor.sdqEntVendAfterScroll(DataSet: TDataSet);
begin
  if sdqEntVend.FieldByName( 'VC_PORCCOMISION' ) is TFloatField then
    TFloatField( sdqEntVend.FieldByName('VC_PORCCOMISION') ).DisplayFormat := '% 0.00;-% 0.00';
end;
{------------------------------------------------------------------------------}
end.

