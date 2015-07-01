unit unContratoVendedor;

interface

uses
  Windows, SysUtils, Graphics, Forms, QueryPrint, Dialogs, ShortCutControl, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  PeriodoPicker, Mask, ToolEdit, CurrEdit, unfraVendedores, unArtFrame, unFraCodigoDescripcion, unFraEntidades, Controls,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, Classes, ToolWin, unArt, Placemnt, SortDlg, artSeguridad,
  unArtDBAwareFrame, SqlFuncs, AnsiSQL, unFraStaticCodigoDescripcion, unfraSucursal,
  RxPlacemnt, RxToolEdit, RxCurrEdit;

type
  TfrmContratoVendedor = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    tbSeparador3: TToolButton;
    sdqConsulta: TSDQuery;
    sdDatos: TDataSource;
    tbSeparador4: TToolButton;
    ShortCutControl: TShortCutControl;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    tlbCerrarVigencia: TToolButton;
    Panel1: TPanel;
    Label2: TLabel;
    fraEntidad: TfraEntidades;
    Label1: TLabel;
    fraVendedor: TfraVendedores;
    Label3: TLabel;
    edVC_COMISION: TCurrencyEdit;
    Label4: TLabel;
    edVC_VIGENCIADESDE: TPeriodoPicker;
    Label5: TLabel;
    edVC_VIGENCIAHASTA: TPeriodoPicker;
    fpCierreVigencia: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edVC_VIGENCIAHASTA1: TPeriodoPicker;
    Label6: TLabel;
    btnCrearRelacion: TButton;
    fpVendedor: TFormPanel;
    Bevel1: TBevel;
    Label7: TLabel;
    btnAceptarVendedor: TButton;
    btnCancelarVendedor: TButton;
    fraEntidadVendedor: TfraEntidades;
    fpNacion: TFormPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    btnAceptarNacion: TButton;
    btnCancelarNacion: TButton;
    edVendedorNacion: TMaskEdit;
    FormStorage: TFormStorage;
    SortDialog: TSortDialog;
    tlbOrdenar: TToolButton;
    chkVC_PLANPAGO: TCheckBox;
    chkVC_MANTENIMIENTO: TCheckBox;
    Seguridad: TSeguridad;
    Label9: TLabel;
    fraConcepto: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    fraSucursal: TfraSucursal;
    sdspInsertarcomisgranorgnizador: TSDStoredProc;
    tbVendedorVisible: TToolButton;
    tbVendedorPrincipal: TToolButton;
    ToolButton3: TToolButton;
    Panel2: TPanel;
    chkMostrarActivos: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure ArtDBGridCellClick(Column: TColumn);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tlbCerrarVigenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edVC_COMISIONChange(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnCrearRelacionClick(Sender: TObject);
    procedure btnAceptarVendedorClick(Sender: TObject);
    procedure btnCancelarVendedorClick(Sender: TObject);
    procedure btnAceptarNacionClick(Sender: TObject);
    procedure btnCancelarNacionClick(Sender: TObject);
    procedure fpNacionEnter(Sender: TObject);
    procedure tlbOrdenarClick(Sender: TObject);
    procedure chkMostrarActivosClick(Sender: TObject);
    procedure tbVendedorPrincipalClick(Sender: TObject);
    procedure tbVendedorVisibleClick(Sender: TObject);
  private
    FContrato: Integer;
    FFuncion: TFuncionShowForm;

  {$IFNDEF SUSCRIPCIONES}
    function DoArmarSqlAltaVendedorContrato(aIdEntVend: TTableId; aPorcComision: Double; var aSqlTrans: TSql): TTableId;
    function PeriodoDesde: String;
    function Validar: Boolean;

    procedure DoGuardar;
    {procedure GetDatosGranOrganizar(aIdEntVendedor: TTableId; var aIdOrganizador, aIdEntVendOrganizador: TTableId;
                                    var aPorcComisionOrganizador: Double); }
{$ENDIF}

    function AjustarComisiones(aPerVigenciaDesde: String; aContrato: Integer; aIdVC: TTableId): Boolean;
    function ComisionDefault: Extended;
    function EsBancoNacion(aCodigo: String): Boolean;
    function IdEntidadVendedor: Integer;
    function Filtros: String;

    procedure CrearRelacion;
    procedure CrearVendedor;
    procedure FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure OnEntidadChange(Sender: TObject);
    procedure OnVendedorChange(Sender: TObject);
    procedure Seleccion;
    procedure SetFuncion(F: TFuncionShowForm);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    procedure DoCargarDatos(const aContrato: Integer);
  end;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, General, VCLExtra, {$IFNDEF SUSCRIPCIONES}unAjusteComisiones, {$ENDIF}Periodos,
  unSesion, Numeros, unComisiones, unConsultasAdicionales, unComunes;

{$R *.DFM}

const
  CaptionBase: String = 'Contrato Vendedores';
  CONSULTA_GRILLA: String =
    'SELECT en_id, en_codbanco, en_nombre, ve_id, ve_vendedor, ve_nombre, vc_id, vc_idconcepto, vc_porccomision,' +
          ' vc_vigenciadesde, vc_vigenciahasta, vc_fechacierre, vc_usucierre, vc_fechabaja, vc_usubaja, vc_fechaalta,' +
          ' vc_usualta, vc_planpago, vc_mantenimiento, vc_idsucursal, co_descripcion descrconcepto,' +
          ' su_descripcion descrsucursal, vc_principal, vc_visible' +
     ' FROM asu_sucursal, xco_concepto, xen_entidad, xve_vendedor, xev_entidadvendedor, avc_vendedorcontrato' +
    ' WHERE ev_identidad = en_id' +
      ' AND vc_identidadvend = ev_id' +
      ' AND ev_idvendedor = ve_id' +
      ' AND vc_idsucursal = su_id(+)' +
      ' AND vc_idconcepto = co_id(+)' +
      ' AND vc_contrato = :contrato';

procedure TfrmContratoVendedor.DoCargarDatos(const aContrato: Integer);
var
  sSql: String;
begin
  FFuncion  := fsAgregar;
  FContrato := aContrato;

  sSql := CONSULTA_GRILLA + Filtros;

  if not Seguridad.Claves.IsActive('VerInvisibles') then
    AddCondition(sSql, 'VC_VISIBLE = ''S''');

  sdqConsulta.SQL.Text := sSql;
  sdqConsulta.ParamByName('contrato').AsInteger := FContrato;
  OpenQuery(sdqConsulta);

  ArtDBGrid.ColumnByField['VC_VISIBLE'].Visible := Seguridad.Claves.IsActive('VerInvisibles');
  tbVendedorVisible.Enabled                     := Seguridad.Activar(tbVendedorVisible) and Seguridad.Claves.IsActive('VerInvisibles');
end;

procedure TfrmContratoVendedor.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption                   := CaptionBase;
      tlbBaja.Enabled           := False;
      tlbCerrarVigencia.Enabled := False;
      tlbGuardar.Enabled        := False;
      tlbOrdenar.Enabled        := True;
      tlbNuevo.Enabled          := True;
      tlbGuardar.Enabled        := False;
      fraEntidad.ShowBajas      := True;
      fraEntidad.ExtraCondition := '';
      fraEntidad.Clear;
      fraConcepto.ShowBajas     := True;
      fraConcepto.Clear;
      fraSucursal.ShowBajas     := True;
      fraSucursal.Clear;
    end;
    fsAgregar:
    begin
      Caption                   := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled           := False;
      tlbImprimir.Enabled       := False;
      tlbCerrarVigencia.Enabled := False;
      tlbOrdenar.Enabled        := False;
      tlbGuardar.Enabled        := True;
      fraEntidad.ShowBajas      := False;
      fraEntidad.ExtraCondition := ' AND EN_ENTRAMITE = ''N'' ';
      fraEntidad.Clear;
      fraConcepto.ShowBajas     := False;
      fraConcepto.Clear;
      fraSucursal.ShowBajas     := False;
      fraSucursal.Clear;
    end;
    fsModificar:
    begin
      Caption                   := CaptionBase;
      tlbBaja.Enabled           := True;
      tlbImprimir.Enabled       := True;
      tlbCerrarVigencia.Enabled := True;
      tlbOrdenar.Enabled        := True;
      tlbGuardar.Enabled        := False;
      fraEntidad.ShowBajas      := True;
      fraEntidad.ExtraCondition := '';
      fraEntidad.Clear;
      fraConcepto.ShowBajas     := True;
      fraConcepto.Clear;
      fraSucursal.ShowBajas     := True;
      fraSucursal.Clear;
    end;
  end;
end;

procedure TfrmContratoVendedor.FormDestroy(Sender: TObject);
begin
  sdqConsulta.Close;
end;

procedure TfrmContratoVendedor.Seleccion;
begin
  Funcion := fsModificar;
  VCLExtra.LockControls([fraEntidad, fraVendedor, fraConcepto, fraSucursal, edVC_COMISION,
                         edVC_VIGENCIADESDE, edVC_VIGENCIAHASTA, chkVC_PLANPAGO, chkVC_MANTENIMIENTO,
                         btnCrearRelacion], True);

  fraEntidad.Vendedor := ART_EMPTY_ID;
  fraVendedor.Entidad := ART_EMPTY_ID;

  with sdqConsulta do
  begin
    fraEntidad.Value := FieldByName('en_id').AsInteger;
    OnEntidadChange(nil);

    fraVendedor.Value := FieldByName('ve_id').AsInteger;
    OnVendedorChange(nil);

    fraConcepto.Value := FieldByName('vc_idconcepto').AsInteger;
    fraSucursal.Value := FieldByName('vc_idsucursal').AsInteger;

    edVC_COMISION.Value              := FieldByName('vc_porccomision').AsFloat;
    edVC_VIGENCIADESDE.Periodo.Valor := FieldByName('vc_vigenciadesde').AsString;
    edVC_VIGENCIAHASTA.Periodo.Valor := FieldByName('vc_vigenciahasta').AsString;
    chkVC_PLANPAGO.Checked           := IIF((FieldByName('vc_planpago').AsString = 'N'), False, True);
    chkVC_MANTENIMIENTO.Checked      := IIF((FieldByName('vc_mantenimiento').AsString = 'N'), False, True);
  end;
end;

procedure TfrmContratoVendedor.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  Seleccion;
end;

procedure TfrmContratoVendedor.ArtDBGridCellClick(Column: TColumn);
begin
  Seleccion;
end;

{$IFNDEF SUSCRIPCIONES}
function TfrmContratoVendedor.Validar: Boolean;
var
  bContinuar: Boolean;
  sMensaje: String;
  sPeriodo: String;
  sSql: String;
begin
  sPeriodo := PeriodoDesde;

  Verificar(fraEntidad.IsEmpty, fraEntidad.edCodigo, 'La entidad es obligatoria.');
  Verificar(fraVendedor.IsEmpty, fraVendedor.edCodigo, 'El vendedor es obligatorio.');
  Verificar(fraConcepto.IsEmpty, fraConcepto.edCodigo, 'El concepto es obligatorio.');

  sSql :=
    'SELECT en_requieresucursal' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';
  Verificar((ValorSqlEx(sSql, [fraEntidad.Value]) = 'S') and fraSucursal.IsEmpty, fraSucursal.edCodigo, 'La sucursal es obligatoria.');

  Verificar((edVC_VIGENCIADESDE.Periodo.Valor = ''), edVC_VIGENCIADESDE, 'La vigencia Desde es obligatoria.');
  Verificar((edVC_VIGENCIADESDE.Periodo.Valor < sPeriodo), edVC_VIGENCIADESDE, 'La vigencia Desde debe ser mayor o igual a ' + sPeriodo);

  Verificar((edVC_VIGENCIAHASTA.Periodo.Valor < edVC_VIGENCIADESDE.Periodo.Valor) and
            (edVC_VIGENCIAHASTA.Periodo.Valor <> ''), edVC_VIGENCIAHASTA, 'La vigencia Hasta debe ser mayor o igual a la vigencia Desde.');

  Verificar(chkVC_PLANPAGO.Checked and (edVC_VIGENCIAHASTA.Periodo.Valor = ''), edVC_VIGENCIAHASTA,
            'Si indica que es un plan de pagos, la fecha de fin de vigencia es obligatoria.');

  sSql :=
    'SELECT 1' +
     ' FROM avc_vendedorcontrato' +
    ' WHERE vc_fechabaja IS NULL' +
      ' AND vc_idconcepto = 2' +
      ' AND vc_vigenciahasta IS NULL' +
      ' AND vc_contrato = :contrato';
  Verificar(chkVC_MANTENIMIENTO.Checked and ExisteSqlEx(sSql, [FContrato]), chkVC_MANTENIMIENTO,
            'No puede haber más de un vendedor de mantenimiento para el contrato.');

  if FFuncion = fsAgregar then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM xev_entidadvendedor, avc_vendedorcontrato' +
      ' WHERE vc_contrato = :contrato' +
        ' AND vc_fechabaja IS NULL' +
        ' AND vc_idconcepto = 1' +
        ' AND (   (:vigenciadesde BETWEEN vc_vigenciadesde AND NVL(vc_vigenciahasta, ''999912''))' +
             ' OR (NVL(:vigenciahasta, ''999912'') BETWEEN vc_vigenciadesde AND NVL(vc_vigenciahasta, ''999912'')))' +
        ' AND vc_identidadvend = ev_id' +
        ' AND ev_idvendedor <> :idvendedor';
    if ExisteSqlEx(sSql, [FContrato, edVC_VIGENCIADESDE.Periodo.Valor, edVC_VIGENCIAHASTA.Periodo.Valor, fraVendedor.Value]) then
    begin
      sMensaje := 'Ya existe un porcentaje de comisión asignado para el periodo.';

      if Seguridad.Claves.IsActive('PermisoPorcComisionAsignado') then
      begin
        sMensaje := sMensaje + ' ¿ Desea continuar ?';
        bContinuar := (MsgBox(sMensaje, MB_ICONINFORMATION + MB_OKCANCEL) = IDOK);
      end
      else
      begin
        Verificar(True, edVC_VIGENCIADESDE, sMensaje);
        bContinuar := False;
      end;

      if not bContinuar then
        Abort;
    end;

    sSql :=
      'SELECT 1' +
       ' FROM xev_entidadvendedor, avc_vendedorcontrato' +
      ' WHERE vc_contrato = :contrato' +
        ' AND vc_fechabaja IS NULL' +
        ' AND (   (:vigenciadesde BETWEEN vc_vigenciadesde AND NVL(vc_vigenciahasta, ''999912''))' +
             ' OR (NVL(:vigenciahasta, ''999912'') BETWEEN vc_vigenciadesde AND NVL(vc_vigenciahasta, ''999912'')))' +
        ' AND vc_identidadvend = ev_id' +
        ' AND vc_idconcepto = :idconcepto' +
        ' AND ev_idvendedor = :idvendedor';
    Verificar(ExisteSqlEx(sSql, [FContrato, edVC_VIGENCIADESDE.Periodo.Valor, edVC_VIGENCIAHASTA.Periodo.Valor, fraConcepto.Value, fraVendedor.Value]), edVC_VIGENCIADESDE, 'Ya existe un porcentaje de comisión asignado al vendedor para el periodo.');

    sSql :=
      'SELECT 1' +
       ' FROM xvc_entvendconcepto' +
      ' WHERE vc_identidadvend = :identidadvend' +
        ' AND vc_idconcepto = :idconcepto' +
        ' AND vc_fechabaja IS NULL' +
        ' AND vc_fechaaprobado IS NOT NULL';
    Verificar(not ExisteSqlEx(sSql, [IdEntidadVendedor, fraConcepto.Value]), fraConcepto, 'El concepto no está aprobado para el vendedor.');
  end;

  Result := True;
end;

function TfrmContratoVendedor.PeriodoDesde: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT TO_CHAR(ADD_MONTHS(co_vigenciadesde, -1), ''YYYYMM'')' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  Result := ValorSqlEx(sSql, [FContrato]);
end;

{procedure TfrmContratoVendedor.GetDatosGranOrganizar(aIdEntVendedor: TTableId; var aIdOrganizador,
                                                     aIdEntVendOrganizador: TTableId;
                                                     var aPorcComisionOrganizador: Double);
var
  sSql: String;
begin
  sSql :=
    'SELECT go_identorganizador, go_porccomision' +
     ' FROM xve_vendedor, xgo_granorganizador, xev_entidadvendedor' +
    ' WHERE ev_identidad = go_identidad' +
      ' AND go_fechabaja IS NULL' +
      ' AND ev_fechabaja IS NULL' +
      ' AND go_fechaaprobado IS NOT NULL' +
      ' AND ev_id = :id';
  with GetQueryEx(sSql, [aIdEntVendedor]) do
  try
    if Eof then
    begin
      aIdOrganizador           := 0;
      aPorcComisionOrganizador := 0;
      aIdEntVendOrganizador    := 0;
    end
    else
    begin
      aIdOrganizador           := FieldByName('go_identorganizador').AsInteger;
      aPorcComisionOrganizador := FieldByName('go_porccomision').AsFloat;

      sSql :=
        'SELECT ev_id' +
         ' FROM xev_entidadvendedor, xve_vendedor' +
        ' WHERE ve_id = ev_idvendedor' +
          ' AND ev_fechabaja IS NULL' +
          ' AND '''' || ve_vendedor IN(''0'', ''1'')' +
          ' AND ev_identidad = :identidad';
      aIdEntVendOrganizador := ValorSqlIntegerEx(sSql, [aIdOrganizador]);
    end;
  finally
    Free;
  end;
end;  }

function TfrmContratoVendedor.DoArmarSqlAltaVendedorContrato(aIdEntVend: TTableId; aPorcComision: Double; var aSqlTrans: TSql): TTableId;
begin
  Result := GetSecNextVal('SEQ_AVC_ID');

  with aSqlTrans do
  begin
    Clear;
    TableName := 'avc_vendedorcontrato';

    SqlType := stInsert;

    PrimaryKey.Add('vc_id',        Result, False);
    Fields.Add('vc_fechaalta',     exDateTime);
    Fields.Add('vc_usualta',       Sesion.UserId);
    Fields.Add('vc_contrato',      FContrato);
    Fields.Add('vc_identidadvend', aIdEntVend);
    Fields.Add('vc_idconcepto',    fraConcepto.Value);

    if fraSucursal.IsSelected then
      Fields.Add('vc_idsucursal',  fraSucursal.Value);

    Fields.Add('vc_porccomision',  aPorcComision, dtNumber);
    Fields.Add('vc_vigenciadesde', edVC_VIGENCIADESDE.Periodo.Valor);
    Fields.Add('vc_vigenciahasta', edVC_VIGENCIAHASTA.Periodo.Valor);
    Fields.Add('vc_planpago',      String(IIF(chkVC_PLANPAGO.Checked, 'S', 'N')));
    Fields.Add('vc_mantenimiento', String(IIF(chkVC_MANTENIMIENTO.Checked, 'S', 'N')));
  end;
end;

procedure TfrmContratoVendedor.DoGuardar;
var
  aSqlTrans: TSql;
  //dPorcComOrg: Double;
  //dPorcComisionOrganizador: Double;
  IdEntVendedor: TTableId;
  //IdEntVendOrganizador: TTableId;
  IdEntVend: TTableId;
  //IdOrganizador: TTableId;
  IdVC: TTableId;
  sSql: String;
begin
  IdVC          := ART_EMPTY_ID;
  //IdEntVendedor := ART_EMPTY_ID;

  aSqlTrans := TSql.Create('avc_vendedorcontrato');
  try
    case Funcion of
      fsAgregar:
      begin
        IdEntVendedor := IdEntidadVendedor;

        IdVC := DoArmarSqlAltaVendedorContrato(IdEntVendedor, edVC_COMISION.Value, aSqlTrans);
      end;

      fsModificar: //Cerrar Vigencia
      begin
        aSqlTrans.SqlType := stUpdate;
        aSqlTrans.PrimaryKey.Add('vc_id',        sdqConsulta.FieldByName('vc_id').AsInteger);
        aSqlTrans.Fields.Add('vc_fechacierre',   exDateTime);
        aSqlTrans.Fields.Add('vc_usucierre',     Sesion.UserId);
        aSqlTrans.Fields.Add('vc_vigenciahasta', edVC_VIGENCIAHASTA.Text);
      end;
    end;

    BeginTrans;
    try
//      DoGenerarDebitos(FContrato, fraVendedor.Value, edVC_VigenciaDesde.Periodo.Valor, edVC_VigenciaHasta.Periodo.Valor);

      EjecutarSqlST(aSqlTrans.Sql);

      if Funcion = fsAgregar then
        if AjustarComisiones(edVC_VIGENCIADESDE.Periodo.Valor, FContrato, ART_EMPTY_ID) then
          with TfrmAjusteComisiones.Create(Self) do
          try
            DoCargarDatosAjusteComisiones(FContrato, edVC_VigenciaDesde.Periodo.Valor,
                                          edVC_VigenciaHasta.Periodo.Valor, fraEntidad.Value, fraVendedor.Value, IdVC,
                                          False, fraConcepto.Value);
          finally
            Free;
          end;

      sSql :=
        'SELECT en_porccomisionent' +
         ' FROM xen_entidad' +
        ' WHERE en_id = :id' +
          ' AND en_modoliq IN(:modo4, :modo6)';
      with GetQueryEx(sSql, [fraEntidad.Value, '04', '06']) do
      begin
        if (not Eof) and (not AreIn(fraVendedor.edCodigo.Text, ['0', '1'])) then
        begin
          sSql :=
            'SELECT ev_id' +
             ' FROM xev_entidadvendedor, xve_vendedor' +
            ' WHERE ev_idvendedor = ve_id' +
              ' AND ev_identidad = :identidad' +
              ' AND ve_vendedor IN(:a, :b)';
          IdEntVend := ValorSqlIntegerEx(sSql, [fraEntidad.Value, '0', '1']);

          IdVC := DoArmarSqlAltaVendedorContrato(IdEntVend, FieldByName('en_porccomisionent').AsFloat, aSqlTrans);
          EjecutarSqlST(aSqlTrans.Sql);

          if AjustarComisiones(edVC_VIGENCIADESDE.Periodo.Valor, FContrato, ART_EMPTY_ID) then
            with TfrmAjusteComisiones.Create(Self) do
            try
              sSql :=
                'SELECT ve_id' +
                 ' FROM xev_entidadvendedor, xve_vendedor' +
                ' WHERE ev_idvendedor = ve_id' +
                  ' AND ev_identidad = :identidad' +
                  ' AND ve_vendedor IN(:a, :b)';
              DoCargarDatosAjusteComisiones(FContrato,
                                            edVC_VigenciaDesde.Periodo.Valor,
                                            edVC_VigenciaHasta.Periodo.Valor,
                                            fraEntidad.Value,
                                            ValorSqlIntegerEx(sSql, [fraEntidad.Value, '0', '1']),
                                            IdVC,
                                            False,
                                            fraConcepto.Value);
            finally
              Free;
            end;
        end;
      end;

      if Funcion = fsAgregar then
      begin
        with sdspInsertarcomisgranorgnizador do    //Get_Valor_Online.
        begin
          ParamByName('idvendedorcontrato').AsInteger := IdVC;
          ExecProc;
        end;
        //cambio pedido por gabriellis personalmente 17/10/2012 (se agrego el PL de arriba y se comento lo de abajo)
        {GetDatosGranOrganizar(IdEntVendedor, IdOrganizador, IdEntVendOrganizador, dPorcComisionOrganizador);
        if IdOrganizador <> 0 then
          begin
            dPorcComOrg := MaxFloat(dPorcComisionOrganizador - edVC_COMISION.Value, 0);

            DoArmarSqlAltaVendedorContrato(IdEntVendOrganizador, dPorcComOrg, aSqlTrans);
            EjecutarSQLST(aSqlTrans.Sql);
          end;  }
      end;

      CommitTrans;
      sdqConsulta.Close;
      OpenQuery(sdqConsulta);
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    aSqlTrans.Free;
  end;
end;
{$ENDIF}

procedure TfrmContratoVendedor.tlbNuevoClick(Sender: TObject);
begin
  Funcion := fsAgregar;
  VCLExtra.LockControls([fraEntidad, fraVendedor, fraConcepto, fraSucursal, edVC_COMISION,
                         edVC_VIGENCIADESDE, edVC_VIGENCIAHASTA, chkVC_PLANPAGO, chkVC_MANTENIMIENTO,
                         btnCrearRelacion], False);

  fraEntidad.Clear;
  fraVendedor.Clear;
  fraEntidad.Vendedor := ART_EMPTY_ID;
  fraVendedor.Entidad := ART_EMPTY_ID;

  fraConcepto.Clear;
  fraSucursal.Clear;

  edVC_COMISION.Value := 0;
  edVC_VIGENCIADESDE.Text := '';
  edVC_VIGENCIAHASTA.Text := '';
  chkVC_PLANPAGO.Checked := False;
  chkVC_MANTENIMIENTO.Checked := False;
end;

procedure TfrmContratoVendedor.tlbGuardarClick(Sender: TObject);
begin
{$IFNDEF SUSCRIPCIONES}
  if Validar then
    DoGuardar;
{$ENDIF}
end;

procedure TfrmContratoVendedor.tlbBajaClick(Sender: TObject);
var
  bAjustoComision: Boolean;
begin
//Esto no es el cierre de vigencia: es la baja
  if Funcion = fsModificar then
  begin
    Verificar((not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('vc_fechabaja').IsNull), nil, 'Este registro se encuentra dado de baja.');

    if not sdqConsulta.IsEmpty then
    begin
      if MsgBox('¿ Realmente desea dar de baja este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      begin
        with TSql.Create('avc_vendedorcontrato') do
        try
          SqlType := stUpdate;
          PrimaryKey.Add('vc_id',    sdqConsulta.FieldByName('vc_id').AsInteger);
          Fields.Add('vc_fechabaja', exDateTime);
          Fields.Add('vc_usubaja',   Sesion.UserId);

          BeginTrans;
          try
            EjecutarSQLST(Sql);

            bAjustoComision := AjustarComisiones(edVC_VIGENCIADESDE.Periodo.Valor, FContrato,
                                                 sdqConsulta.FieldByName('vc_id').AsInteger);

{$IFNDEF SUSCRIPCIONES}
            if bAjustoComision then
              with TfrmAjusteComisiones.Create(Self) do
              try
                DoCargarDatosAjusteComisiones(FContrato, edVC_VIGENCIADESDE.Periodo.Valor,
                                              edVC_VIGENCIAHASTA.Periodo.Valor, fraEntidad.Value, fraVendedor.Value,
                                              sdqConsulta.FieldByName('vc_id').AsInteger, True, fraConcepto.Value);
              finally
                Free;
              end;
{$ENDIF}
            CommitTrans;

            if not bAjustoComision then
              MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

            sdqConsulta.Close;
            OpenQuery(sdqConsulta);
          except
            on E: Exception do
            begin
              RollBack;
              ErrorMsg(E, 'Error al guardar los datos.');
            end;
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmContratoVendedor.tlbImprimirClick(Sender: TObject);
begin
  try
    if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and PrintDialog.Execute then
    begin
      QueryPrint.SubTitle.Lines.Add(Format('Contrato: %d', [FContrato]));
      QueryPrint.SetGridColumns(ArtDBGrid, true, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := CaptionBase;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmContratoVendedor.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoVendedor.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('vc_fechacierre').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clBlue);

  if not sdqConsulta.FieldByName('vc_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmContratoVendedor.tlbCerrarVigenciaClick(Sender: TObject);
var
  iResultado: Integer;
begin
// muestra el frame panel correspondiente al cierre de vigencia...
// el campo VC_FECHACIERRE es el que tendra el valor en que se hizo el
// cierre de vigencia
//Esto no es una baja sino el cierre de vigencia
//El mes por defecto es el actual
  edVC_VIGENCIAHASTA1.Periodo.SetPeriodoFromDate(Date);

  iResultado := fpCierreVigencia.ShowModal;

  if iResultado = 1 then
  begin
    if Funcion = fsModificar then
    begin
      if (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('vc_fechabaja').IsNull) then
      begin
        MsgBox('Este registro se encuentra dado de baja.');
        Abort;
      end;

      if (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('vc_fechacierre').IsNull) then
      begin
        MsgBox('Este registro se encuentra cerrado.');
        Abort;
      end;

      if not sdqConsulta.IsEmpty then
      begin
        with TSql.Create('avc_vendedorcontrato') do
        try
          SqlType := stUpdate;
          PrimaryKey.Add('vc_id',        sdqConsulta.FieldByName('vc_id').AsInteger);
          Fields.Add('vc_vigenciahasta', edVC_VIGENCIAHASTA1.Periodo.Valor);
          Fields.Add('vc_fechacierre',   exDateTime);
          Fields.Add('vc_usucierre',     Sesion.UserId);

          BeginTrans;
          try
            EjecutarSQLST(Sql);
{$IFNDEF SUSCRIPCIONES}
            if AjustarComisiones(edVC_VIGENCIADESDE.Periodo.Valor, FContrato, sdqConsulta.FieldByName('vc_id').AsInteger) then
              with TfrmAjusteComisiones.Create(Self) do
              try
                DoCargarDatosAjusteComisiones(FContrato, NextPeriodo(edVC_VigenciaHasta1.Periodo.Valor),
                                              edVC_VigenciaHasta.Periodo.Valor, fraEntidad.Value, fraVendedor.Value,
                                              sdqConsulta.FieldByName('vc_id').AsInteger, True, fraConcepto.Value);
              finally
                Free;
              end;
{$ENDIF}
            CommitTrans;
            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqConsulta.Close;
            OpenQuery(sdqConsulta);
          except
            on E: Exception do
            begin
              RollBack;
              ErrorMsg(E, 'Error al guardar los datos');
            end;
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmContratoVendedor.FormCreate(Sender: TObject);
begin
  inherited;

  LockControls(Panel1, True);
  fraEntidad.OnChange  := OnEntidadChange;
  fraVendedor.OnChange := OnVendedorChange;
  fraEntidad.CaseSensitive := False;
  fraVendedor.CaseSensitive := False;
  fraVendedor.ShowBajas := True;

  with fraConcepto do
  begin
    TableName             := 'xco_concepto';
    FieldID               := 'co_id';
    FieldCodigo           := 'co_id';
    FieldDesc             := 'co_descripcion';
    FieldBaja             := 'co_fechabaja';
    ExtraFields           := ', co_asignablecontrato ';
    VisibleExtraFields[0] := False;
    ExtraCondition        := 'AND co_asignablevendedor = ''S'' AND co_asignablecontrato = ''S''';
    DynamicCols           := True;
    ShowBajas             := True;
  end;

  fraSucursal.ShowBajas := True;

  {$IFDEF SUSCRIPCIONES}
  tlbGuardar.Hide;
  tblSeparador1.Hide;
  tlbNuevo.Hide;
  tlbBaja.Hide;
  tblSeparador2.Hide;
  tlbCerrarVigencia.Hide;
  tbSeparador3.Hide;
  tlbOrdenar.Hide;
  tlbImprimir.Hide;
  tbSeparador4.Hide;
  {$ENDIF}

  LoadDynamicSortFields(SortDialog.SortFields, ARTDBGrid.Columns);
end;

function TfrmContratoVendedor.ComisionDefault: Extended;
var
  sSql: String;
begin
  Result := 0;

  if (fraVendedor.IsSelected) and (fraEntidad.IsSelected) then
  begin
    sSql :=
      'SELECT ev_porccomision' +
       ' FROM xev_entidadvendedor' +
      ' WHERE ev_idvendedor = :idvendedor' +
        ' AND ev_identidad = :identidad' +
        ' AND ev_fechabaja IS NULL';
    Result := ValorSqlExtendedEx(sSql, [fraVendedor.Value, fraEntidad.Value], 0)
  end;
end;

function TfrmContratoVendedor.IdEntidadVendedor: Integer;
var
  sSql: String;
begin
  Result := 0;

  if (fraVendedor.IsSelected) and (fraEntidad.IsSelected) then
  begin
    sSql :=
      'SELECT ev_id' +
       ' FROM xev_entidadvendedor' +
      ' WHERE ev_identidad = :identidad' +
        ' AND ev_idvendedor = :idvendedor' +
        ' AND ev_fechabaja IS NULL';
    Result := ValorSqlEx(sSql, [fraEntidad.Value, fraVendedor.Value], '0')
  end;
end;

procedure TfrmContratoVendedor.OnEntidadChange(Sender: TObject);
begin
  if fraVendedor.IsEmpty then
    fraVendedor.Entidad := fraEntidad.Value;

  if edVC_COMISION.Value = 0 then
    edVC_COMISION.Value := ComisionDefault;

  fraSucursal.Clear;
  fraSucursal.ClearFilter;
  if fraEntidad.IsSelected then
    fraSucursal.ExtraCondition := 'AND su_identidad = ' + SqlValue(fraEntidad.Value)
  else
    fraSucursal.ExtraCondition := '';
end;

procedure TfrmContratoVendedor.OnVendedorChange(Sender: TObject);
begin
  if fraEntidad.IsEmpty then
    fraEntidad.Vendedor := fraVendedor.Value
  else
    if (Funcion = fsAgregar) and (fraVendedor.IsSelected) and (IdEntidadVendedor = 0) then
    begin
      InvalidMsg(fraVendedor.edCodigo, 'No existe la relación entre la entidad ' + fraEntidad.cmbDescripcion.Text +
                                       ' y el vendedor ' + fraVendedor.cmbDescripcion.Text + '.');
      fraVendedor.Clear;
    end;

  if edVC_COMISION.Value = 0 then
    edVC_COMISION.Value := ComisionDefault;
end;

procedure TfrmContratoVendedor.btnAceptarClick(Sender: TObject);
begin
  fpCierreVigencia.ModalResult := 0;
  if edVC_VIGENCIAHASTA1.Periodo.Valor = '' then
    InvalidMsg(edVC_VIGENCIAHASTA1, 'La Vigencia Hasta es obligatoria.')
  else if edVC_VIGENCIAHASTA1.Periodo.Valor < edVC_VIGENCIADESDE.Periodo.Valor then
    InvalidMsg(edVC_VIGENCIAHASTA1, 'La Vigencia Hasta debe ser mayor o igual a la Vigencia Desde.')
  else
    fpCierreVigencia.ModalResult := 1;
end;

procedure TfrmContratoVendedor.btnCancelarClick(Sender: TObject);
begin
  fpCierreVigencia.ModalResult := -1;
end;

procedure TfrmContratoVendedor.edVC_COMISIONChange(Sender: TObject);
begin
  if (edVC_COMISION.Text <> '') then
    if StrToFloat( edVC_COMISION.Text ) > edVC_COMISION.MaxValue then
    begin
      MsgBox('La comisión no puede ser mayor de 100.');
      edVC_COMISION.Value := 0;
      edVC_COMISION.SelectAll;
    end;
end;

function TfrmContratoVendedor.AjustarComisiones(aPerVigenciaDesde: String; aContrato: Integer; aIdVC: TTableId): Boolean;
var
  bExistenPagos: Boolean;
  sSql: String;
begin
  if aIdVC = ART_EMPTY_ID then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM zmo_movimiento' +
      ' WHERE mo_contratoprincipal = :contrato' +
        ' AND mo_periodo >= :periodo' +
        ' AND mo_idcierrepago IS NOT NULL';
    bExistenPagos := ExisteSqlEx(sSql, [aContrato, aPerVigenciaDesde]);
  end
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM xpc_pagocomision' +
      ' WHERE pc_idvendcontrato = :idvendcontrato' +
        ' AND pc_periodo >= :periodo';
    bExistenPagos := ExisteSqlEx(sSql, [aIdVC, aPerVigenciaDesde]);
  end;

  Result := (bExistenPagos) and (not chkVC_PLANPAGO.Checked);
end;

procedure TfrmContratoVendedor.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
    if (Active) and (not Eof) then
      FieldByName('vc_porccomision').OnGetText := FormateaTexto;
end;

procedure TfrmContratoVendedor.FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  try
    if Sender.FieldName = 'vc_porccomision' then
      Text := CurrToStrF(StrToCurr(Sender.AsString), ffNumber, 2)
    else
      Text := Sender.AsString;
  except
    Text := Sender.AsString;
  end;
end;

procedure TfrmContratoVendedor.btnCrearRelacionClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(en_crearvendedor, ''N'')' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';

  if ValorSqlEx(sSql, [fraEntidad.Value]) = 'S' then
    CrearVendedor
  else
    CrearRelacion;
end;

procedure TfrmContratoVendedor.CrearRelacion;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM xen_entidad, xev_entidadvendedor' +
    ' WHERE en_id = ev_identidad' +
      ' AND en_modoliq = ''03''' +
      ' AND ev_idvendedor = :idvendedor';
  if (fraVendedor.IsEmpty) or (not ExisteSqlEx(sSql, [fraVendedor.Value])) then
    raise Exception.Create('Para poder crear la nueva relacion, el vendedor debe pertenecer a alguna delegación del Banco Provincia.');

  //Crea la relacion para el actual si no está creada ya...
  if MsgBox('¿ Desea crear una nueva relación con una entidad del Banco Provincia ?', MB_ICONINFORMATION + MB_YESNO) = IDYES Then
  begin
    if fpVendedor.ShowModal = mrOK then
    begin
      with TSql.Create('xev_entidadvendedor') do
      try
        SqlType := stInsert;
        PrimaryKey.Add('ev_id',                 'SEQ_XEV_ID.NEXTVAL', False);
        Fields.Add('ev_idvendedor',              fraVendedor.Value);
        Fields.Add('ev_identidad',               fraEntidadVendedor.Value);
        Fields.AddExtended('ev_porccomision',    Get_PorcComisionVendedor(fraEntidadVendedor.Value));
        Fields.AddExtended('ev_porccomisionpub', Get_PorcComisionVendedorPub(fraEntidadVendedor.Value));
        Fields.Add('ev_usualta',                 Sesion.UserId);
        Fields.Add('ev_fechaalta',               'ACTUALDATE', False);
        EjecutarSql(Sql);

        fraEntidad.Clear;
        fraEntidad.Vendedor := FraVendedor.Value;
        fraEntidad.Value := fraEntidadVendedor.Value;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmContratoVendedor.CrearVendedor;
var
  iCanalId: Integer;
  IdVendedor: TTableId;
  sSql: String;
  sVendedor: String;
begin
  //Crea la relacion para el actual si no está creada ya...
  if MsgBox('¿ Desea ingresar el vendedor asociado ?', MB_ICONINFORMATION + MB_YESNO) = IDYES then
    if fpNacion.ShowModal = mrOK then
    begin
      BeginTrans;

      with TSql.Create('xve_vendedor') do
      try
        try
          sVendedor := Trim(edVendedorNacion.Text);

          sSql :=
            'SELECT ve_id' +
             ' FROM xve_vendedor' +
            ' WHERE ve_vendedor = :vendedor';
          IdVendedor := ValorSqlIntegerEx(sSql, [sVendedor], ART_EMPTY_ID);

          sSql :=
            'SELECT en_idcanal' +
             ' FROM xen_entidad' +
            ' WHERE en_id = :id';
          iCanalId := ValorSqlIntegerEx(sSql, [fraEntidad.Value]);

          if IdVendedor = ART_EMPTY_ID then
          begin
            sSql := 'SELECT seq_xve_id.NEXTVAL FROM DUAL';
            IdVendedor := ValorSqlInteger(sSql, 0);

            Clear;
            SqlType := stInsert;
            TableName := 'xve_vendedor';
            PrimaryKey.Add('ve_id',     IdVendedor, False);
            Fields.Add('ve_vendedor',   sVendedor);
            Fields.Add('ve_nombre',     'Vendedor ' + fraEntidad.cmbDescripcion.Text);
            Fields.Add('ve_idcanal',    iCanalId);
            Fields.Add('ve_tipovend',   'I');
            Fields.Add('ve_usualta',    Sesion.UserID);
            Fields.Add('ve_fechaalta', 'ACTUALDATE', False);
            EjecutarSqlST(Sql);
          end;

          //Crea la relacion
          Clear;
          SqlType := stInsert;
          TableName := 'xev_entidadvendedor';
          PrimaryKey.Add('ev_id',                 'SEQ_XEV_ID.NEXTVAL', False);
          Fields.Add('ev_idvendedor',              IdVendedor, dtNumber);
          Fields.Add('ev_identidad',               fraEntidad.Value, dtNumber);
          Fields.AddExtended('ev_porccomision',    Get_PorcComisionVendedor(fraEntidad.Value));
          Fields.AddExtended('ev_porccomisionpub', Get_PorcComisionVendedorPub(fraEntidad.Value));
          Fields.Add('ev_usualta',                 Sesion.UserID);
          Fields.Add('ev_fechaalta',               'ACTUALDATE', False);
          EjecutarSqlST(Sql);

          FraVendedor.Clear;
          FraVendedor.Entidad := fraEntidad.Value;
          FraVendedor.Value := IdVendedor;

          CommitTrans;
          MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        except
          on E:Exception do
          begin
            RollBack;
            MessageDlg('Error al guardar los datos' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        Free;
      end;
    end;
end;

procedure TfrmContratoVendedor.btnAceptarVendedorClick(Sender: TObject);
var
  sSql: String;
begin
  //Validaciones
  if fraEntidadVendedor.IsEmpty then
    raise Exception.Create('Debe elegir la entidad que desea asociar al vendedor.');

  sSql :=
    'SELECT 1' +
     ' FROM xen_entidad, xev_entidadvendedor' +
    ' WHERE en_id = ev_identidad' +
      ' AND en_id = :id' +
      ' AND ev_idvendedor = :idvendedor' +
      ' AND ev_fechabaja IS NULL';
  if ExisteSqlEx(sSql, [fraEntidadVendedor.Value, fraVendedor.Value]) then
    raise Exception.Create('La relación con esta entidad ya existe.');

  //Sigue adelante con la rutina
  fpVendedor.ModalResult := mrOk;
end;

procedure TfrmContratoVendedor.btnCancelarVendedorClick(Sender: TObject);
begin
  fpVendedor.ModalResult := mrCancel;
end;

procedure TfrmContratoVendedor.btnAceptarNacionClick(Sender: TObject);
var
  sSql: String;
  sVendedor: String;
  IdVendedor: TTableId;
begin
  sVendedor := Trim(edVendedorNacion.Text);

  //Validaciones
  if sVendedor = '' then
    raise Exception.Create('El número de vendedor es obligatorio.');

  if EsBancoNacion(fraEntidad.Code) then
  begin
    if (Length(sVendedor) <> 10) then
      raise Exception.Create('El número de vendedor no es correcto.');

    if (edVendedorNacion.Text = '0000-00000') then
      raise Exception.Create('El número de vendedor no es correcto.');
  end;

  sSql :=
    'SELECT 1' +
     ' FROM xve_vendedor, xev_entidadvendedor' +
    ' WHERE ev_identidad = :identidad' +
      ' AND ve_vendedor = :vendedor' +
      ' AND ev_fechabaja IS NULL';
  if ExisteSqlEx(sSql, [fraEntidad.Value, sVendedor]) then
    raise Exception.Create('La relación con este vendedor ya existe.');

  sSql :=
    'SELECT ve_id' +
     ' FROM xve_vendedor' +
    ' WHERE ve_vendedor = :vendedor';
  IdVendedor := ValorSqlIntegerEx(sSql, [sVendedor], ART_EMPTY_ID);

  if IdVendedor <> ART_EMPTY_ID then
    raise Exception.Create('El código de vendedor ya existe.');

  //Sigue adelante con la rutina
  fpNacion.ModalResult := mrOk;
end;

procedure TfrmContratoVendedor.btnCancelarNacionClick(Sender: TObject);
begin
  fpNacion.ModalResult := mrCancel;
end;

function TfrmContratoVendedor.EsBancoNacion(aCodigo: String): Boolean;
begin
  Result := (aCodigo = '400');   // BANCO DE LA NACION ARGENTINA
end;

procedure TfrmContratoVendedor.fpNacionEnter(Sender: TObject);
begin
  edVendedorNacion.Clear;

  if EsBancoNacion(fraEntidad.Code) then
    edVendedorNacion.EditMask := '9999-99999;1;_'
  else
    edVendedorNacion.EditMask := '999999999;1;_';
end;

procedure TfrmContratoVendedor.tlbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, ArtDBGrid.Columns);
  SortDialog.Execute ;
end;

function TfrmContratoVendedor.Filtros: String;
var
  sFiltros: String;
begin
  sFiltros := '';
  if chkMostrarActivos.Checked then
    sFiltros := sFiltros + ' AND VC_FECHABAJA IS NULL ' +
                            'AND ADD_MONTHS(SYSDATE, -1) <= TO_DATE(NVL(VC_VIGENCIAHASTA, ''299912''), ''YYYYMM'') ';
  Result := sFiltros;
end;

procedure TfrmContratoVendedor.chkMostrarActivosClick(Sender: TObject);
begin
  DoCargarDatos(FContrato);
end;

procedure TfrmContratoVendedor.tbVendedorPrincipalClick(Sender: TObject);
begin
  DoCargarVendedorPrincipal(ArtDBGrid, FContrato);
end;

procedure TfrmContratoVendedor.tbVendedorVisibleClick(Sender: TObject);
begin
  DoCargarVendedorVisible(ArtDBGrid);
end;

end.

