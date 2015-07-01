unit unPedidoEndoso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPanelABM, DB, SDEngine, Placemnt, artSeguridad,
  ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, unArt,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ToolEdit,
  Mask, PatternEdit, IntEdit, RxToolEdit, RxPlacemnt,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraCodigoDescripcion,
  unFraUsuario, DateComboBox, unfraStaticActividad, unFraCodDesc,
  AdvSmoothButton, AdvGlassButton, RxCurrEdit, Vcl.CheckLst, VCLExtra, SqlFuncs,
  FormPanel, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  unfraCtbTablas;

type
  TTipoVisualizacion = (tvNuevo, tvVisualizar);

  TfrmPedidoEndoso = class(TfrmCustomPanelABM)
    fraEmpresa: TfraEmpresa;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNumeroSolicitud: TIntEdit;
    Label2: TLabel;
    edFechaSolicitud: TDateEdit;
    Label3: TLabel;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    lbSector: TLabel;
    GroupBox2: TGroupBox;
    lbMotivoSolicitud: TLabel;
    fraComunicacion: TfraStaticCTB_TABLAS;
    lbComunicacion: TLabel;
    Label7: TLabel;
    cmbVIGENCIATARIFA: TDateComboBox;
    lbFirmado: TLabel;
    lbEndosoAutomatico: TLabel;
    fraEntregaMano: TfraUsuarios;
    lbEntregaEnMano: TLabel;
    gbTarifario: TGroupBox;
    fraCiiuNuevo1: TfraStaticActividad;
    fraCiiuNuevo2: TfraStaticActividad;
    fraCiiuNuevo3: TfraStaticActividad;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraUsuAlta: TfraUsuarios;
    fraUsuAfiliacion: TfraUsuarios;
    fraUsuConfeccion: TfraUsuarios;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edTC_FECHAAUTORIZA: TDateComboBox;
    edFechaEnvioAfi: TDateComboBox;
    Label12: TLabel;
    Label13: TLabel;
    btnEnviarSuscripciones: TAdvGlassButton;
    lbNroEndoso: TLabel;
    btnEnviarAfiliaciones: TAdvGlassButton;
    fraMotivoSolicitud: TfraCodDesc;
    Label34: TLabel;
    edCostoXTrabajadorCotizado: TCurrencyEdit;
    Label35: TLabel;
    edCostoFijoCotizado: TCurrencyEdit;
    Label38: TLabel;
    edPorcentajeVariableCotizado: TCurrencyEdit;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    fraMOTIVO: TfraStaticCTB_TABLAS;
    edAplicado: TEdit;
    lbAplicado: TLabel;
    fpObservaciones: TFormPanel;
    edObservaciones: TMemo;
    btnAceptarObservacion: TButton;
    btnCancelarObservacion: TButton;
    fraEstado: TfraStaticCTB_TABLAS;
    btnRechazar: TAdvGlassButton;
    rgTipoRechazo: TRadioGroup;
    tbObservaciones: TToolButton;
    edUsuarioAutorizacion: TEdit;
    cboxFirmado: TComboBox;
    cboxEndosoAutomatico: TComboBox;
    fraCodigoCodTexto: TfraStaticCodigoDescripcion;
    lbTextoCarta: TLabel;
    Bevel2: TBevel;
    tbVerAdjunto: TToolButton;
    procedure FSFormCreate(Sender: TObject);
    procedure btnEnviarAfiliacionesClick(Sender: TObject);
    procedure btnEnviarSuscripcionesClick(Sender: TObject);
    procedure cboxEstadoExit(Sender: TObject);
    procedure btnAceptarObservacionClick(Sender: TObject);
    procedure btnCancelarObservacionClick(Sender: TObject);
    procedure btnRechazarClick(Sender: TObject);
    procedure rgTipoRechazoClick(Sender: TObject);
    procedure tbObservacionesClick(Sender: TObject);
    procedure fraComunicacionExit(Sender: TObject);
    procedure tbVerAdjuntoClick(Sender: TObject);
  private
    { Private declarations }
    FID: TTableId;
    FTipoVisualizacion : TTipoVisualizacion;
    FIsTecnica : Boolean;
    FObservaciones : String;
    procedure SetIdReafiliacion(const Value: TTableId);
    procedure SetTipoVisualizacion(const Value: TTipoVisualizacion);
    procedure LoadControls;
    procedure ConfigurarControles;
    procedure CalcularModoAbm;
    procedure SendAlerts(const aIdReafiliacion: TTableId);
    procedure SetFechaVigencia;
    procedure EnviarMensajePorSocket(const aIdEndoso: TTableId);


    function CalcularFechaVigencia: TDate;
    function EsDiaHabil(Fecha: TDate): Boolean;
    function GetUltimoDiaHabilMesActual: TDate;

  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
  public
    Sql: TCustomSql;

    property IdReafiliacion    : TTableId           read FID                write FID;
    property TipoVisualizacion : TTipoVisualizacion read FTipoVisualizacion write SetTipoVisualizacion;
    property IsTecnica         : Boolean            read FIsTecnica         write FIsTecnica;
  end;

var
  frmPedidoEndoso: TfrmPedidoEndoso;

implementation

uses unDmPrincipal, CustomDlgs, unSesion, General, AnsiSql, unPrincipal, DateUtils, DateTimeFuncs, unMoldeEnvioMail,
     unAdministracionArchivosEndosos;

{$R *.dfm}

{ TfrmPedidoEndoso }

procedure TfrmPedidoEndoso.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEmpresa.Contrato                := FieldByName('sr_contrato').AsInteger;
    edNumeroSolicitud.Value            := FieldByName('sr_nrosolicitud').AsInteger;
    edFechaSolicitud.Date              := FieldByName('sr_fechaalta').AsDateTime;
    fraEM_SECTOR.Value                 := FieldByName('em_sector').AsString;
    fraCiiuNuevo1.Value                := FieldByName('sr_idactividad1').AsInteger;
    fraCiiuNuevo2.Value                := FieldByName('sr_idactividad2').AsInteger;
    fraCiiuNuevo3.Value                := FieldByName('sr_idactividad3').AsInteger;
    fraMotivoSolicitud.Value           := FieldByName('sr_idmotivosolicitud').AsInteger;
    edCostoXTrabajadorCotizado.Value   := FieldByName('sr_costofinalcotizado').AsFloat;
    edCostoFijoCotizado.Value          := FieldByName('sr_costofijocotizado').AsFloat;
    edPorcentajeVariableCotizado.Value := FieldByName('sr_porcentajevariablecotizado').AsFloat;
    fraComunicacion.Value              := FieldByName('et_comunica').AsString;
    if not FieldByName('et_vigenciatarifa').IsNull then
      cmbVIGENCIATARIFA.Date           := FieldByName('et_vigenciatarifa').AsDateTime;
   { else  //si la fecha de vigencia esta vacia y es Aumento se puede establecer.
      if (FieldByName('rs_tipo').AsString = 'A') then
        SetFechaVigencia;    }

    if not FieldByName('et_firmado').IsNull then
      cboxFirmado.ItemIndex                   := IIF(FieldByName('et_firmado').AsString = 'SI', 0, 1)
    else
      cboxFirmado.ItemIndex := -1;

    if not FieldByName('et_endosoautom').IsNull then
      cboxEndosoAutomatico.ItemIndex          := IIF(FieldByName('et_endosoautom').AsString = 'SI', 0, 1)
    else
      cboxEndosoAutomatico.ItemIndex := -1;

    fraCodigoCodTexto.Value            := FieldByName('et_idtextocarta').AsInteger;


    if not FieldByName('et_fechaafiliacion').IsNull then
      edFechaEnvioAfi.Date             := FieldByName('et_fechaafiliacion').AsDateTime;

    fraEntregaMano.Value               := FieldByName('et_entregamano').AsString;
    edObservaciones.Text               := FieldByName('et_observaciones').AsString;
   // if edObservaciones.Text <> '' then
   //   fpObservaciones.Show;
   // lbNroEndoso.Caption                := 'Endoso: ' + FieldByName('et_id').AsString;
    edTC_FECHAAUTORIZA.Date            := FieldByName('et_fechapedido').AsDateTime;
    fraMOTIVO.Value                    := FieldByName('et_motivoendoso').AsString;

    if not FieldByName('et_estado').IsNull then
      fraEstado.Value                    := FieldByName('et_estado').AsString
    else
      fraEstado.Value := '1.0';

    fraUsuAlta.Value := FieldByName('et_usupedido').AsString;
    fraUsuConfeccion.Value := FieldByName('et_usuconfeccion').AsString;
    edUsuarioAutorizacion.Text := FieldByName('usuarioautorizacion').AsString;
  end;
end;

procedure TfrmPedidoEndoso.rgTipoRechazoClick(Sender: TObject);
begin
  if rgTipoRechazo.ItemIndex = 0 then
  begin
    edObservaciones.Enabled := False
    //Adjuntar archivo enabled false
  end
  else
  begin
    edObservaciones.Enabled := True;
  end;
end;

procedure TfrmPedidoEndoso.SendAlerts(const aIdReafiliacion: TTableId);
var
  sSql: String;
begin
  if Sesion.Delegacion <> 840 then    // Si no es de capital salgo porque no se puede conectar..
    Exit;

  sSql :=
    'SELECT s.terminal' +
     ' FROM v$session s, use_usuarios' +
    ' WHERE UPPER(s.osuser) = UPPER(se_usuario)' +
      ' AND UPPER(s.terminal) <> (SELECT UPPER(SYS_CONTEXT(''USERENV'', ''TERMINAL''))' +
                                  ' FROM DUAL)' +
      ' AND UPPER(s.program) LIKE UPPER(''COTIZACI%'')' +
      ' AND se_sector = ''TECNICO''';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      frmPrincipal.SendMsgBySocket(FieldByName('terminal').AsString, IntToStr(aIdReafiliacion), 7452);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPedidoEndoso.SetFechaVigencia;
begin
  cmbVIGENCIATARIFA.Date := CalcularFechaVigencia;
end;

procedure TfrmPedidoEndoso.SetIdReafiliacion(const Value: TTableId);
var
  sSql : String;
begin
  FID := Value; //id de reafiliacion
  sSql := 'SELECT sr_id, sr_contrato, sr_nrosolicitud, sr_fechaalta, em_sector, et_id, ' +
          '       sr_idactividad1, sr_idactividad2, sr_idactividad3, sr_idmotivosolicitud,' +
          '       sr_costofinalcotizado, sr_costofijocotizado, sr_porcentajevariablecotizado, ' +
          '       et_entregamano, et_estado, et_comunica, et_vigenciatarifa, et_endosoautom, '+
          '       et_firmado, et_usupedido, et_fechapedido, et_usuconfeccion, et_usuautoriza, ' +
          '       et_usuafiliacion, et_confirmaendoso, et_observaciones, et_idrevisionprecios, ' +
          '       co_contrato, et_fechaafiliacion, et_motivoendoso, sr_puestoautorizacion, ' +
          '       reusa.tb_descripcion usuarioautorizacion, ars.rs_tipo, sr_usuasignado, et_idtextocarta ' +
          '  FROM asr_solicitudreafiliacion ' +
          '  JOIN aco_contrato ON sr_contrato = co_contrato ' +
          '  JOIN aem_empresa ON em_id = co_idempresa' +
          '  LEFT JOIN art.ctb_tablas sect ON em_sector = sect.tb_codigo AND sect.tb_clave = ''SECT'' ' +
          '  LEFT JOIN afi.aet_endosotarifario ON et_idrevisionprecios = sr_id ' +
          '  LEFT JOIN art.ctb_tablas reusa ON reusa.tb_codigo = sr_puestoautorizacion AND reusa.tb_clave = ''REUSA'' ' +
          '  LEFT JOIN art.ars_respuestasolicreafiliacion ars ON sr_idmotivocotizacion = ars.rs_id ' +
          ' WHERE sr_id = :idreafiliacion ' ;
  with sdqConsulta do
  begin
    SQL.Text := sSql;
    ParamByName('idreafiliacion').AsInteger := Value;
    Open;
    LoadControls;
    ConfigurarControles; //aca se configura segun usuario y sector
  end;
end;

procedure TfrmPedidoEndoso.SetTipoVisualizacion(
  const Value: TTipoVisualizacion);
begin
  FTipoVisualizacion := Value;
  if Value = tvVisualizar then
  begin
    Self.Caption := 'Visualización de Endoso';
    LockControl(pnlDatos, True);
  end
  else
  begin
    Self.Caption := 'Pedido de Endoso';
    LockControl(pnlDatos, False);
    //ConfigurarControles; //aca se configura segun usuario y sector
  end;
  SetIdReafiliacion(FID);
end;

procedure TfrmPedidoEndoso.tbObservacionesClick(Sender: TObject);
begin
  inherited;
  btnAceptarObservacion.Enabled := False;
  fpObservaciones.ShowModal;
  btnAceptarObservacion.Enabled := True;
end;

procedure TfrmPedidoEndoso.tbVerAdjuntoClick(Sender: TObject);
  procedure ShowFormAdmArchivos(const aIdEndoso: Integer);
  begin      //creo el form TfrmAdministracionArchivosRecepcion
    Application.CreateForm(TfrmAdministracionArchivosEndosos, frmAdministracionArchivosEndosos);
    try
      frmAdministracionArchivosEndosos.Mostrar(aIdEndoso); //muestro
    finally
      FreeAndNil(frmAdministracionArchivosEndosos); //libero el formulario
    end;
  end;
begin
  Verificar(sdqConsulta.FieldByName('et_id').IsNull, tbVerAdjunto, 'No se guardo el endoso tarifario');
    ShowFormAdmArchivos(sdqConsulta.FieldByName('et_id').AsInteger); //arranco el procedimiento de arriba
end;

function TfrmPedidoEndoso.Validar: Boolean;
begin
  if (fraEstado.Value = '2.0') or (isTecnica and (fraEstado.Value = '1.0')) then
  begin
    Verificar(cmbVIGENCIATARIFA.IsEmpty, cmbVIGENCIATARIFA, 'La fecha de Vigencia no puede quedar vacía');
    Verificar(fraMOTIVO.IsEmpty, fraMOTIVO, 'El motivo de endoso no puede quedar vacío');
  end
  else
  if (fraEstado.Value = '1.0') and (not IsTecnica) then
  begin
    Verificar(fraComunicacion.IsEmpty, fraComunicacion, 'El tipo de comunicación no puede quedar vacío');
  end;

  if (isTecnica) or (Sesion.Sector = 'TECNICO') then
    Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto, 'El texto carta no puede quedar vacío');

  Result := True;
end;

procedure TfrmPedidoEndoso.btnEnviarAfiliacionesClick(Sender: TObject);
begin
  CalcularModoAbm;
  if Validar then
  begin
     fraEstado.Value := '3.0'; //pongo el nuevo estado
     DoABM;
  end;

end;

procedure TfrmPedidoEndoso.btnEnviarSuscripcionesClick(Sender: TObject);
var
  sDestinos : String;
begin
  with sdqConsulta do
  begin
    if FieldByName('sr_usuasignado').AsString <> 'MMAGALLANES' then
      sDestinos := FieldByName('sr_usuasignado').AsString + '@provart.com.ar;';
    sDestinos := sDestinos + 'mmagallanes@provart.com.ar';
    //**Falta el referente**

  end;
  CalcularModoAbm;
  if Validar then
  begin
     fraEstado.Value := '2.0';  //Pongo el nuevo estado
     DoABM;
     EnviarMensajePorSocket(sdqConsulta.FieldByName('et_id').AsInteger);
     EnviarMailBD(sDestinos,'Endoso Tarifario Pendiente', [],'Nuevo Endoso Tarifario');
  end;
end;

procedure TfrmPedidoEndoso.btnRechazarClick(Sender: TObject);
begin
  fpObservaciones.ShowModal;
end;

procedure TfrmPedidoEndoso.btnAceptarObservacionClick(Sender: TObject);
begin
  fpObservaciones.Close;
  FObservaciones := edObservaciones.Text;
  if rgTipoRechazo.ItemIndex = 0 then
    fraEstado.Value := '4.1'  //Pongo el nuevo estado
  else
    fraEstado.Value := '6.0';
  DoABM;

  EnviarMailBD(sdqConsulta.FieldByName('et_usupedido').AsString + '@provart.com.ar','Endoso Tarifario Rechazado', [],'El Endoso Tarifario');
  ModalResult := MrOk;
end;

procedure TfrmPedidoEndoso.btnCancelarObservacionClick(Sender: TObject);
begin
  fpObservaciones.Close;
  edObservaciones.Text := FObservaciones;
end;

function TfrmPedidoEndoso.CalcularFechaVigencia: TDate;
var
  Fecha : TDate;
  UltimoDiaHabil : TDate;
begin
  {$region 'Comentarios del calculo de fecha de Vigencia by EVILA'}
  {
   Después de cargar la Forma de comunicación hay que evaluar…

   Grupo Aumento:
                Sector Privado > (Hoy +60 días)  1er. día del próximo mes.
                Sector Publico/Muni. >(Hoy +180 días) 1er día del próximo mes.
   Grupo Descuento:
                Ventanilla >  1er día del próximo mes.
                Otros > si (Hoy  <= (Ultimo día hábil -7)) 1er. día del próximo mes.
                                 Else  (Hoy  > (Ultimo día hábil -7)) 1er. día del 2 segundo mes.


   Desde Técnica, todos estos campos son editables.
   Para el cambio de CIIU la fecha tiene que ser el 1er. Dia del próximo mes.
  }
  {$endregion}
  Fecha := DBDate;

  if sdqConsulta.FieldByName('rs_tipo').AsString  = 'A' then //Si es del grupo Aumentos
  begin
    if sdqConsulta.FieldByName('em_sector').AsString = '4' then  //4 = sector privado - resto publico/muni
      Fecha := Fecha + 60      //(Hoy +60 días)  1er. día del próximo mes.
    else
      Fecha := Fecha + 180;    //(Hoy +180 días) 1er día del próximo mes.

    Fecha := IncMonth(Fecha, 1);  //proximo mes
    Fecha := EncodeDate(YearOf(Fecha),MonthOf(Fecha), 1)  //primer dia
  end
  else
    if sdqConsulta.FieldByName('rs_tipo').AsString = 'D' then   //Si es del grupo Descuentos
    begin
      if fraComunicacion.Value = 'VE' then //primer dia del proximo mes
      begin
        Fecha := IncMonth(Fecha, 1);
        Fecha := EncodeDate(YearOf(Fecha),MonthOf(Fecha), 1)  //primer dia
      end
      else
      begin
        UltimoDiaHabil := GetUltimoDiaHabilMesActual;
        if DBDate <= (UltimoDiaHabil - 7)  then
          Fecha := IncMonth(Fecha, 1)  // si (Hoy  <= (Ultimo día hábil -7)) 1er. día del próximo mes.
        else
          Fecha := IncMonth(Fecha, 2);  //Else  (Hoy  > (Ultimo día hábil -7)) 1er. día del 2 segundo mes.
        Fecha := EncodeDate(YearOf(Fecha),MonthOf(Fecha), 1)  //primer dia
      end;
    end
    else
    begin //Si no es ninguna de las anteriores vamos a suponer que es cambio de CIIU
       Fecha := IncMonth(Fecha, 1);
       Fecha := EncodeDate(YearOf(Fecha),MonthOf(Fecha), 1);
    end;
  Result := Fecha;
end;

procedure TfrmPedidoEndoso.CalcularModoAbm;
begin
  if sdqConsulta.FieldByName('et_id').IsNull then
    ModoAbm := maAlta
  else
    ModoAbm := maModificacion;
end;

procedure TfrmPedidoEndoso.cboxEstadoExit(Sender: TObject);
begin
  if fraEstado.Value = '4.0' then
  begin
    FObservaciones := edObservaciones.Text;
    fpObservaciones.Show;
  end;
end;

procedure TfrmPedidoEndoso.ConfigurarControles;
begin
  if FTipoVisualizacion = tvVisualizar then
    Exit;

  btnRechazar.Enabled := False;

  VCLExtra.LockControls([fraEM_SECTOR],                True);
  VCLExtra.LockControls([fraEmpresa],                  True);
  VCLExtra.LockControls([edNumeroSolicitud],           True);
  VCLExtra.LockControls([edFechaSolicitud],            True);
  VCLExtra.LockControls([edTC_FECHAAUTORIZA],          True);
  VCLExtra.LockControls([edFechaEnvioAfi],             True);
  if (Sesion.Sector = 'TECNICO') and not(IsTecnica) then
  begin
  {$region 'Tecnico en Comercial'}
    //configurar usuario de tecnica en comercial
    VCLExtra.LockControls([fraMotivoSolicitud],          True);
    VCLExtra.LockControls([fraComunicacion],             False);
    VCLExtra.LockControls([cboxFirmado],                 False);
    VCLExtra.LockControls([cboxEndosoAutomatico],        False);
    VCLExtra.LockControls([fraCodigoCodTexto],           False);
    VCLExtra.LockControls([fraEntregaMano],              True);
    VCLExtra.LockControls([cmbVIGENCIATARIFA],           False);
    //Cuadro Tarifario
    VCLExtra.LockControls([gbTarifario],                 True);
    VCLExtra.LockControls([fraCiiuNuevo1],               True);
    VCLExtra.LockControls([fraCiiuNuevo2],               True);
    VCLExtra.LockControls([fraCiiuNuevo3],               True);
    VCLExtra.LockControls([edCostoXTrabajadorCotizado],  True);
    VCLExtra.LockControls([edPorcentajeVariableCotizado],True);
    VCLExtra.LockControls([edCostoFijoCotizado],         True);

      //**
    VCLExtra.LockControls([fraEstado],                   True);
    VCLExtra.LockControls([fraMOTIVO],                   False);
    VCLExtra.LockControls([fraUsuAlta],                  True);
    VCLExtra.LockControls([fraUsuConfeccion],            True);
    VCLExtra.LockControls([edUsuarioAutorizacion],       True);
    VCLExtra.LockControls([fraUsuAfiliacion],            True);
    VCLExtra.LockControls([edAplicado],                  True);
    btnEnviarSuscripciones.Enabled := False;
    btnEnviarAfiliaciones.Enabled := True;

    if (not sdqConsulta.FieldByName('et_id').IsNull) and ((sdqConsulta.FieldByName('et_estado').AsString = '3.0') or
                                                         // (sdqConsulta.FieldByName('et_estado').AsString = '4.1') or
                                                         // (sdqConsulta.FieldByName('et_estado').AsString = '4.2') or
                                                          (sdqConsulta.FieldByName('et_estado').AsString = '5.0') or
                                                          (sdqConsulta.FieldByName('et_estado').AsString = '6.2')
                                                          ) then
    begin
      Self.Caption := 'Visualización de Endoso';
      LockControl(pnlDatos, True);   //Lock panel bloquea todos los botones.
    end
    else
    if (not sdqConsulta.FieldByName('et_id').IsNull) and (sdqConsulta.FieldByName('et_estado').AsString = '2.0') then
    begin
      btnRechazar.Enabled := False;
    end
  end
  {$endregion}
  else
  begin
    if not(IsTecnica) then
    begin
     {$region 'Comercial en Comercial'}
      VCLExtra.LockControls([fraMotivoSolicitud],          True);
      VCLExtra.LockControls([fraComunicacion],             False);
      VCLExtra.LockControls([cboxFirmado],                 True);
      VCLExtra.LockControls([cboxEndosoAutomatico],        True);
      VCLExtra.LockControls([fraCodigoCodTexto],           True);
      VCLExtra.LockControls([fraEntregaMano],              False);
      VCLExtra.LockControls([cmbVIGENCIATARIFA],           True);
      //Cuadro Tarifario
      VCLExtra.LockControls([gbTarifario],                 True);
      VCLExtra.LockControls([fraCiiuNuevo1],               True);
      VCLExtra.LockControls([fraCiiuNuevo2],               True);
      VCLExtra.LockControls([fraCiiuNuevo3],               True);
      VCLExtra.LockControls([edCostoXTrabajadorCotizado],  True);
      VCLExtra.LockControls([edPorcentajeVariableCotizado],True);
      VCLExtra.LockControls([edCostoFijoCotizado],         True);

      //**
      VCLExtra.LockControls([fraEstado],                   True);
      VCLExtra.LockControls([fraMOTIVO],                   True);
      VCLExtra.LockControls([fraUsuAlta],                  True);
      VCLExtra.LockControls([fraUsuConfeccion],            True);
      VCLExtra.LockControls([edUsuarioAutorizacion],       True);
      VCLExtra.LockControls([fraUsuAfiliacion],            True);
      VCLExtra.LockControls([edAplicado],                  True);
      btnEnviarSuscripciones.Enabled := True;
      btnEnviarAfiliaciones.Enabled := False;
      btnRechazar.Enabled := False;
      if (not sdqConsulta.FieldByName('et_id').IsNull) and ((sdqConsulta.FieldByName('et_estado').AsString = '2.0') or
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '3.0') or
                                                           //(sdqConsulta.FieldByName('et_estado').AsString = '4.1') or
                                                           //(sdqConsulta.FieldByName('et_estado').AsString = '4.2') or
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '5.0') or
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '6.0')
                                                           ) then
      begin
        Self.Caption := 'Visualización de Endoso';
        LockControl(pnlDatos, True); //Lock panel bloquea todos los botones.
      end
      {$endregion}
    end
    else
    begin
      {$region 'Tecnico en Tecnica'}
      VCLExtra.LockControls([fraMotivoSolicitud],          True);
      VCLExtra.LockControls([fraComunicacion],             False);
      VCLExtra.LockControls([cboxFirmado],                 False);
      VCLExtra.LockControls([cboxEndosoAutomatico],        False);
      VCLExtra.LockControls([fraCodigoCodTexto],           False);
      VCLExtra.LockControls([fraEntregaMano],              True);
      VCLExtra.LockControls([cmbVIGENCIATARIFA],           False);
      //Cuadro Tarifario
      VCLExtra.LockControls([gbTarifario],                 True);
      VCLExtra.LockControls([fraCiiuNuevo1],               True);
      VCLExtra.LockControls([fraCiiuNuevo2],               True);
      VCLExtra.LockControls([fraCiiuNuevo3],               True);
      VCLExtra.LockControls([edCostoXTrabajadorCotizado],  True);
      VCLExtra.LockControls([edPorcentajeVariableCotizado],True);
      VCLExtra.LockControls([edCostoFijoCotizado],         True);

      //**
      VCLExtra.LockControls([fraEstado],                   True);
      VCLExtra.LockControls([fraMOTIVO],                   False);
      VCLExtra.LockControls([fraUsuAlta],                  True);
      VCLExtra.LockControls([fraUsuConfeccion],            True);
      VCLExtra.LockControls([edUsuarioAutorizacion],       True);
      VCLExtra.LockControls([fraUsuAfiliacion],            True);
      VCLExtra.LockControls([edAplicado],                  True);
      btnEnviarSuscripciones.Enabled := False;
      btnEnviarAfiliaciones.Enabled := True;
      if (not sdqConsulta.FieldByName('et_id').IsNull) and ({(sdqConsulta.FieldByName('et_estado').AsString = '1.0') or}
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '3.0') or
                                                           //(sdqConsulta.FieldByName('et_estado').AsString = '4.1') or
                                                           //(sdqConsulta.FieldByName('et_estado').AsString = '4.2') or
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '5.0') or
                                                           (sdqConsulta.FieldByName('et_estado').AsString = '6.0')
                                                           ) then
      begin
        Self.Caption := 'Visualización de Endoso';
        LockControl(pnlDatos, True);   //Lock panel bloquea todos los botones.
      end
      else
      if (not sdqConsulta.FieldByName('et_id').IsNull) and (sdqConsulta.FieldByName('et_estado').AsString = '2.0') then
      begin
        btnRechazar.Enabled := True;
      end;
    {$endregion}
    end;
  end;
end;

function TfrmPedidoEndoso.DoABM: Boolean;
var
  Sql: TSql;
begin
  Sql := TSql.Create('afi.aet_endosotarifario');
  Sql.Clear;
  Result := True;
  BeginTrans;
  try
    if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('et_id',        sdqConsulta.FieldByName('et_id').AsInteger, False);
      Sql.Fields.AddString('et_usubaja', Sesion.UserID);
      Sql.Fields.Add('et_fechabaja',     SQL_DATETIME, False);
    end
    else
    begin
      Sql.Fields.AddString('et_sector',      sdqConsulta.FieldByName('em_sector').AsString);
      Sql.Fields.AddInteger('et_idrevisionprecios',    sdqConsulta.FieldByName('sr_id').AsInteger);
      Sql.Fields.AddInteger('et_contrato',    sdqConsulta.FieldByName('co_contrato').AsInteger);
      Sql.Fields.Add('et_fecharevprecios', sdqConsulta.FieldByName('sr_fechaalta').AsDateTime);
      Sql.Fields.AddString('et_estado', fraEstado.Value);
      Sql.Fields.Add('et_vigenciatarifa',  cmbVIGENCIATARIFA.Date);
      Sql.Fields.Add('et_comunica',  fraComunicacion.Value);

      if (cboxFirmado.ItemIndex <> -1) and (cboxFirmado.ItemIndex <> 2)  then
        Sql.Fields.AddString('et_firmado', IIF(cboxFirmado.ItemIndex = 0, 'S', 'N'))
      else
        Sql.Fields.Add('et_firmado', SQL_NULL, False);

      if (cboxEndosoAutomatico.ItemIndex <> -1) and (cboxEndosoAutomatico.ItemIndex <> 2)  then
        Sql.Fields.AddString('et_endosoautom', IIF(cboxEndosoAutomatico.ItemIndex = 0, 'SI', 'NO'))
      else
        Sql.Fields.Add('et_endosoautom', SQL_NULL, False);


      Sql.Fields.AddString('et_entregamano', fraEntregaMano.Value);
      Sql.Fields.AddString('et_motivoendoso', fraMOTIVO.Value);

      if edObservaciones.Text <> '' then
        Sql.Fields.AddString('et_observaciones', edObservaciones.Text);
      if fraEstado.Value = '3.0' then
        begin
          Sql.Fields.AddString('et_usuconfeccion', Sesion.UserID);
          Sql.Fields.Add('et_fechaafiliacion', SQL_DATETIME, False);
        end;

      Sql.Fields.Add('et_idtextocarta', fraCodigoCodTexto.Value, True);


      if ModoABM = maAlta then
      begin
        Sql.SqlType := stInsert;
        Sql.Fields.AddString('et_usupedido', Sesion.UserID);
        Sql.Fields.Add('et_fechapedido',     SQL_DATETIME, False);
        Sql.Fields.AddInteger('et_nrorevprecios',    sdqConsulta.FieldByName('sr_nrosolicitud').AsInteger);
      end
      else
      begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('et_id',         sdqConsulta.FieldByName('et_id').AsInteger, False);
      //  Sql.Fields.Add('et_fechaconfeccion',     SQL_DATETIME, False);
      end;
    end;
    EjecutarSqlST(Sql.Sql);
    CommitTrans;

    if ModoABM = maAlta then   //Alertas por socket a todos los usuarios cuando es un ALTA y se grabo bien.
      SendAlerts(sdqConsulta.FieldByName('sr_id').AsInteger);

    ShowMessage('Los datos se han guardado');
    ModalResult := MrOk;
  except
    RollBack;
    Result := False;
  end;
end;

procedure TfrmPedidoEndoso.EnviarMensajePorSocket(const aIdEndoso: TTableId);
var
  sSql : String;
begin
  if Sesion.Delegacion <> 840 then    // Si no es de capital salgo porque no se puede conectar..
    Exit;

  sSql :=
    'SELECT s.terminal' +
     ' FROM v$session s, use_usuarios' +
    ' WHERE UPPER(s.osuser) = UPPER(se_usuario)' +
      ' AND UPPER(s.terminal) <> (SELECT UPPER(SYS_CONTEXT(''USERENV'', ''TERMINAL''))' +
                                  ' FROM DUAL)' +
      ' AND UPPER(s.program) LIKE UPPER(''COTIZACI%'')' +
      ' AND se_sector = ''TECNICO''';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      frmPrincipal.SendMsgBySocket(FieldByName('terminal').AsString, IntToStr(aIdEndoso));
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmPedidoEndoso.EsDiaHabil(Fecha: TDate): Boolean;
var
  iRes : Integer;
  sSql : String;
begin
  sSql := 'SELECT art.amebpba.isferiado(:fecha) FROM DUAL';
  iRes := ValorSqlIntegerEx(sSql, [TDateTimeEx.Create(Fecha)], 0);
  Result := iRes = 0;
end;

procedure TfrmPedidoEndoso.fraComunicacionExit(Sender: TObject);
begin
  fraComunicacion.FrameExit(Sender);
  SetFechaVigencia;
  if fraComunicacion.Codigo = 'VE' then
  begin
   fraCodigoCodTexto.Clear;
   if (Sesion.Sector <> 'TECNICO') and not(IsTecnica) then
     VCLExtra.LockControls([fraCodigoCodTexto],           True)
   else
    VCLExtra.LockControls([fraCodigoCodTexto],           False);
  end
  else
  begin
    fraCodigoCodTexto.Value := 405; //Codigo 06 - Cambio de Tarifa -CD- (Contrato)
    VCLExtra.LockControls([fraCodigoCodTexto],           True);
  end;
end;

procedure TfrmPedidoEndoso.FSFormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresa.ShowBajas := True;
  fraEM_SECTOR.Clave    := 'SECT';

  with fraComunicacion do
  begin
    Clave     := 'TSCDO';
    ShowBajas := False;
  end;

  with fraEntregaMano do
  begin
    Sql :=
      'SELECT   se_usuario as ' + CD_ALIAS_ID + ', se_usuario as ' + CD_ALIAS_CODIGO + ', se_nombre as ' + CD_ALIAS_DESC + ', se_fechabaja as ' + CD_ALIAS_BAJA +
         ' FROM art.use_usuarios, art.usc_sectores' +
        ' WHERE se_sector = sc_codigo' +
          ' AND (   se_sector IN(''COME'', ''TECNICO'')' +
               ' OR sc_delegacion <> 840' +
               ' OR se_usuario IN (''JBALESTRINI'', ''MCLERICI'', ''FMFIRENZE'',  ''JISABELLA'', ''LSARTORI'', ''VSCETTA'')' +
               ' OR se_idsector = 33042)' +    // Sector Afiliaciones, según ticket 22382..
          ' AND se_fechabaja IS NULL' +
          ' AND se_usuariogenerico = ''N''';
  end;

  if not pnlBusqueda.Visible then
    pnlDatos.Top := pnlDatos.Top - pnlBusqueda.Height;

  {with fraTC_USUARIOAUTORIZA_ALTA do
  begin
    Propiedades.Sql :=
      'SELECT *' +
       ' FROM (' +
            'SELECT se_usuario id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario IN (''CFLORIO'', ''FMFIRENZE'', ''MFERNANDEZ'', ''MIPARRAGUIRRE'', ''MMAGALLANES'')' +
        ' UNION ALL' +
           ' SELECT ''COMITE'' id, ''COMITE'' codigo, ''Comité de Negocios'' descripcion, NULL baja' +
             ' FROM dual) usuarios' +
      ' WHERE 1 = 1 ';
  end;   }


  fraMOTIVO.Clave      := 'MOTEN';
  fraMOTIVO.Especial1  := '1';

  fraEstado.Clave      := 'PEEND';
  fraEstado.ShowBajas  := False;

  cboxFirmado.ItemIndex := -1;
  cboxEndosoAutomatico.ItemIndex := -1;

  lbNroEndoso.Caption := 'Endoso: ';

  with fraCodigoCodTexto do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := False;
    //OnChange    := fraCodigoCodTextoOnChange;
    Sql := 'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
                                 ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
                                 ' tc_nombre ' + CD_ALIAS_DESC + ',' +
                                 ' tc_fechabaja ' + CD_ALIAS_BAJA +
                            ' FROM ctc_textocarta, cta_textoarea' +
                           ' WHERE tc_id = ta_idtextocarta' +
                             ' AND ta_fechabaja IS NULL' +
                             ' AND ta_idareatexto = ' + SqlValue(6);
    // if (sdqDatos.IsEmpty and (FAccion = taAdminCartas)) then
    //   fraCodigoCodTexto.Sql := fraCodigoCodTexto.Sql + ' AND tc_rpt IS NULL ';
  end;

end;

function TfrmPedidoEndoso.GetUltimoDiaHabilMesActual: TDate;
var
  Fecha : TDate;
begin
  Fecha := DBDate;                                   //aca 31 o 28 o lo que sea
  Fecha := EncodeDate(YearOf(Fecha),MonthOf(Fecha), DaysInMonth(Fecha));
  while not EsDiaHabil(Fecha) do   //Voy para atras de a 1 dia hasta obtener el utlimo dia habil
    Fecha := IncDay(Fecha, -1);
  Result := Fecha;
end;

end.


