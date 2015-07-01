unit unEmisionCertificados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi,
  unFraEmpresaSolicitud, StdCtrls, Menus, unFraDomicilio, FormPanel, Mask, unFraDomicilioTrab, unArtDBAwareFrame,
  PatternEdit, CardinalEdit, ToolEdit, DateComboBox, Buttons, unFraUsuario, CurrEdit, unFraCodigoDescripcion,
  unFraActividad, Excel2000, OleServer, Variants,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ComboEditor,
  CheckCombo, DBCheckCombo, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TResultBloqueaCertificado = record
    Codigo: Integer;
    Descripcion: String;
  end;

type
  TRecDeuda = record
    DeudaNominal: Real;
    DeudaTotal: Real;
    Interes: Real;
    Periodo: String;
  end;

type
  TfrmEmisionCertificados = class(TfrmCustomConsulta)
    GBEmpresa: TGroupBox;
    Label1: TLabel;
    fraCO_CONTRATO: TfraEmpresaSolicitud;
    mnuImpresion: TPopupMenu;
    mnuImprimeImpresora: TMenuItem;
    mnuImprimeMail: TMenuItem;
    GBCertificado: TGroupBox;
    rbNomina: TRadioButton;
    rbClausulaComun: TRadioButton;
    rbClausulaEspecial: TRadioButton;
    rbClausulaParticular: TRadioButton;
    GBDeuda: TGroupBox;
    rbNoMostrarDeuda: TRadioButton;
    rbMostrarDeuda: TRadioButton;
    GBFirma: TGroupBox;
    rbSinFirma: TRadioButton;
    rbConFirma: TRadioButton;
    GBFechaLimite: TGroupBox;
    rbFecha2: TRadioButton;
    rbFecha1: TRadioButton;
    GBNominas: TGroupBox;
    rbNominaCompleta: TRadioButton;
    rbNominaSimple: TRadioButton;
    GBDatos: TGroupBox;
    fpBusqueda: TFormPanel;
    GroupBox1: TGroupBox;
    rbCUIL: TRadioButton;
    rbNombre: TRadioButton;
    edNombre: TEdit;
    edCUIL: TMaskEdit;
    btAgregar: TButton;
    btSalir: TButton;
    GroupBox2: TGroupBox;
    rbMostrarNotificacion: TRadioButton;
    rbNoMostrarNotificacion: TRadioButton;
    Bevel1: TBevel;
    chkIntereses: TCheckBox;
    rbDocumento: TRadioButton;
    edDocumento: TMaskEdit;
    tbContacto: TToolButton;
    tbSeparador: TToolButton;
    tbSalir1: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    edCantEmpleados: TCardinalEdit;
    Panel2: TPanel;
    edCantCertificados: TCardinalEdit;
    ToolButton7: TToolButton;
    tbCalcularTotal: TToolButton;
    gbTraspaso: TGroupBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    rbMostrarEstablecimiento: TRadioButton;
    rbNoMostrarEstablecimiento: TRadioButton;
    rbNominaCompletaConMasa: TRadioButton;
    sdspGetDeudaCertificado: TSDStoredProc;
    OpenDialog: TOpenDialog;
    mnuAgregarTrabajadores: TPopupMenu;
    mnuImportarTrabajadores: TMenuItem;
    mnuAyudaAgregarTrabajadores: TMenuItem;
    sdspGetValidaCertificado: TSDStoredProc;
    rbCoberturaExterior: TRadioButton;
    gbCoberturaExterior: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edFechaSalida: TDateComboBox;
    edFechaRegreso: TDateComboBox;
    rgFormaViaje: TRadioGroup;
    edFechaRecepcion: TDateComboBox;
    memoObservaciones: TMemo;
    edDestino: TEdit;
    edAsistenciaViajero: TEdit;
    sdspInsCertxTrabViaje: TSDStoredProc;
    checkMostrarValidez: TCheckBox;
    fpPermisoImpresion: TFormPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    fraTipoPedido: TfraCodigoDescripcion;
    fraTipoCertificado: TfraCodigoDescripcion;
    edDeuda: TCurrencyEdit;
    memoObservaciones2: TMemo;
    Bevel2: TBevel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    fraGestor: TfraCodigoDescripcion;
    fpAprobarEmisionCertificado: TFormPanel;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    edFechaCertificadoCobertura: TDateComboBox;
    rgPermite: TRadioGroup;
    memoObservaciones3: TMemo;
    pnMensaje: TPanel;
    lbMensaje: TLabel;
    gbCiius: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    fraActividad1: TfraActividad;
    fraActividad2: TfraActividad;
    fraActividad3: TfraActividad;
    tbCambiarCIIU: TToolButton;
    ToolButton9: TToolButton;
    fpDatosNoRepeticion: TFormPanel;
    Label2: TLabel;
    edRazonSocial: TEdit;
    fraDomicilio: TfraDomicilioTrab;
    gridDatosNoRepeticion: TArtDBGrid;
    btnAceptar3: TButton;
    btnCancelar3: TButton;
    Bevel4: TBevel;
    pnBotones: TPanel;
    sdqDatosNoRepeticion: TSDQuery;
    dsDatosNoRepeticion: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevo2: TToolButton;
    tbModificar2: TToolButton;
    tbDarDeBaja: TToolButton;
    gbDDJJFaltantes: TGroupBox;
    rbNoMostrarDDJJFaltante: TRadioButton;
    rbMostrarDDJJFaltante: TRadioButton;
    mnuImportarArchivoExcel: TMenuItem;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    Label21: TLabel;
    dsPaises: TDataSource;
    sdqPaises: TSDQuery;
    edPaises: TDBCheckCombo;
    procedure tbImprimirClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rbClausulaEspecialClick(Sender: TObject);
    procedure rbNominaClick(Sender: TObject);
    procedure mnuImprimeImpresoraClick(Sender: TObject);
    procedure rbClausulaComunClick(Sender: TObject);
    procedure rbClausulaParticularClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure edCUILChange(Sender: TObject);
    procedure edCUILEnter(Sender: TObject);
    procedure edNombreChange(Sender: TObject);
    procedure edNombreEnter(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDocumentoEnter(Sender: TObject);
    procedure edDocumentoChange(Sender: TObject);
    procedure mnuImprimeMailClick(Sender: TObject);
    procedure fraCO_CONTRATOExit(Sender: TObject);
    procedure tbContactoClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure CambioEstadoEstablecimiento(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
                                 State: TGridDrawState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbAgregarTrabajadores(Sender: TObject);
    procedure mnuAyudaAgregarTrabajadoresClick(Sender: TObject);
    procedure rbCoberturaExteriorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fpPermisoImpresionBeforeShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure fpAprobarEmisionCertificadoBeforeShow(Sender: TObject);
    procedure tbCambiarCIIUClick(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure tbNuevo2Click(Sender: TObject);
    procedure tbModificar2Click(Sender: TObject);
    procedure tbDarDeBajaClick(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure gridDatosNoRepeticionDblClick(Sender: TObject);
    procedure gridDatosNoRepeticionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                 Highlight: Boolean);
    procedure mnuImportarArchivoExcelClick(Sender: TObject);
  private
    FCertificadoAnterior: String;
    FContrato: Integer;
    FDDJJAdeudadas: String;
    FDeudaRec: TRecDeuda;
    FEstado: String;
    FEstadoDesc: String;
    FImprimirSinDeuda: Boolean;
    FNroCertificadoAnterior: Integer;
    FRegistrosSeleccionados: TStringList;

    function GetContrato: Integer;
    function GetDeuda(const aContrato: Integer; const aFecha: TDateTime): TRecDeuda;
    function GetValidaCertificado(const aContrato: Integer; const aUsuario: String; var aResultado: Integer): Boolean;
    function Guardar_CCO(aContrato: Longint; var aNroCertificado: Integer; aIdFirma: Integer; aCuit, aTipoClausula,
                         aTipoNomina, aTipoVigencia: String; aDeuda, aIntereses, aFirma, aNotificar: Boolean;
                         aEstablecimiento: Boolean; const aGeneraPDF: Boolean; const aActividad1, aActividad2,
                         aActividad3: Integer; const aMostrarDDJJFaltante: Boolean): Integer;
    function InsCertXTrabViaje(const aCertificadoId: Integer; const aFormaViaje, aAsistenciaViajero, aCuit, aDestino,
                               aObservaciones, aUsuarioAlta: String; const aFechaRecepcion, aFechaRegreso,
                               aFechaSalida: TDateTime; const aMostrarValidez: Boolean): Integer;

    procedure btnMarcarTodos(Sender: TObject);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure BuscarTrabajador(Sender: TObject);
    procedure CalcularFilas;
    procedure CargaGrilla(Sender: TObject);
    procedure EliminarRegistrosTemporalesDatosNoRepeticion;
    procedure Guardar_NOI(aIdCertificado: Integer);
    procedure GuardarDatosNoRepeticion(const aIdCertificado: Integer);
    procedure GuardarTrabajadoresEnViaje(const aIdCertXTrab: Integer);
    procedure ImprimirCertificado(GeneraPDF: Boolean);
    procedure MostrarDatosEmpresa;
    procedure MostrarDatosNoRepeticion(const aId: Integer);
    procedure RefrescarDatosNoRepeticion;
    procedure SetContrato(const Value: Integer);
    procedure SetCertificadoAnterior(const Value: String);
    procedure ShowCoberturaExterior(const aMostrar: Boolean);
    procedure InsertarPaisesEnCertificado(const aIdCertificado: Integer);
    procedure CheckPaises(const aIdCertificado: Integer);
  public
    property CertificadoAnterior: String read FCertificadoAnterior write SetCertificadoAnterior;
    property Contrato: Integer           read GetContrato          write SetContrato;
  end;

var
  frmEmisionCertificados: TfrmEmisionCertificados;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, VCLExtra, AnsiSql, SqlFuncs, unRptCertificados, unContratoContacto,
  unAfiliaciones, ArchFuncs, unCITRIX, unEnvioMail, unMoldeEnvioMail, unRptRepNom, unArt, unAyuda, SDOra, General,
  DateTimeFuncs, unSesion, unSeleccionDestinatarios;

{$R *.DFM}

procedure TfrmEmisionCertificados.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmEmisionCertificados.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
      
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Buscar...';
      Item.OnClick := BuscarTrabajador;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmEmisionCertificados.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  CalcularFilas;
  Grid.Repaint;
end;

procedure TfrmEmisionCertificados.btnMarcarTodos(Sender: TObject);
var
  aMetodo: TDataSetNotifyEvent;
  aPointer: TBookMark;
begin
  aMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  aPointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('tj_id').AsString);
      Next;
    end;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    CalcularFilas;
  end;
end;

procedure TfrmEmisionCertificados.CargaGrilla(Sender: TObject);
var
  bDeshabilitarEspeciales: Boolean;
  bRealizarPedido: Boolean;
  nDeudaCertificado: Extended;
  sSql: String;
begin
  if fraCO_CONTRATO.edContrato.Value = 0 then
    Abort;

  Contrato := fraCO_CONTRATO.edContrato.Value;

  FDeudaRec := GetDeuda(fraCO_CONTRATO.Contrato, Date);
  FRegistrosSeleccionados.Clear;

  VCLExtra.LockControls(gbCiius, True);

  if fraCO_CONTRATO.IsSelected then
  begin
    if rbMostrarEstablecimiento.Checked then
      sSql :=
        'SELECT NULL checkbox, tj_id, tj_cuil, tj_nombre, rl_categoria, rl_tarea, rl_fechaingreso, tj_fnacimiento,' +
              ' tj_sexo, rl_sueldo, tj_documento, re_idestablecimiento,' +
              ' es_nroestableci || ''- '' || es_nombre es_nombre' +
         ' FROM ctj_trabajador, aes_establecimiento, cre_relacionestablecimiento, crl_relacionlaboral' +
        ' WHERE tj_id = rl_idtrabajador' +
          ' AND rl_id = re_idrelacionlaboral' +
          ' AND re_idestablecimiento = es_id' +
          ' AND rl_contrato = :contrato'
    else
      sSql :=
        'SELECT NULL checkbox, tj_id, tj_cuil, tj_nombre, rl_categoria, rl_tarea, rl_fechaingreso, tj_fnacimiento,' +
              ' tj_sexo, rl_sueldo, tj_documento, NULL re_idestablecimiento, ''No Mostrar'' es_nombre' +
         ' FROM ctj_trabajador, crl_relacionlaboral' +
        ' WHERE tj_id = rl_idtrabajador' +
          ' AND rl_contrato = :contrato';

    sSql := sSql + SortDialog.OrderBy;

    OpenQueryEx(sdqConsulta, [Contrato], sSql, True);
    MostrarDatosEmpresa;

    nDeudaCertificado := FDeudaRec.DeudaTotal;
    bDeshabilitarEspeciales := (nDeudaCertificado > 0);

    if (nDeudaCertificado > 0) and (FImprimirSinDeuda) then
    begin
      bRealizarPedido := False;

      sSql :=
        'SELECT *' +
         ' FROM aad_autorizacertificadodeuda' +
        ' WHERE ad_contrato = :contrato' +
          ' AND ((ad_fechavigencia >= SYSDATE)' +
           ' OR (ad_fechavigencia IS NULL))' +
     ' ORDER BY ad_fechasolicitud DESC';
      with GetQueryEx(sSql, [Contrato]) do
      try
        if not IsEmpty then
        begin
          if FieldByName('ad_autorizado').AsString = 'S' then
            bDeshabilitarEspeciales := False
          else if FieldByName('ad_autorizado').AsString = 'N' then
            bRealizarPedido := MsgAsk(Format('Cobranza NO autoriza la emisión.' + #13#10 +
                                             'Motivo: [%s] %s' + #13#10 +
                                             ' ¿ Desea realizar un pedido de autorización nuevamente ?',
                                             [FieldByName('ad_usuarioautorizo').AsString,
                                              FieldByName('ad_observacioncobranza').AsString]))
          else
            MsgBox(Format('Este contrato ya tiene solicitado el pedido de autorización para emitir un certificado sin deuda.' + #13#10 +
                   'Solicitado por: %s' + #13#10 +
                   'Fecha: %s', [FieldByName('ad_usuariosolicitud').AsString,
                                 FormatDateTime('dd/mm/yyyy', FieldByName('ad_fechasolicitud').AsDateTime)]), MB_ICONEXCLAMATION);
        end
        else
          bRealizarPedido := (Sesion.Sector <> 'CALLCENT');
      finally
        Free;
      end;

      edDeuda.Value := nDeudaCertificado;

      if bRealizarPedido then
        if Seguridad.Claves.IsActive('CertificadosSinDeuda') then   // Si tiene activa la clave para imprimir sin deuda..
        begin
          if fpAprobarEmisionCertificado.ShowModal = mrOk then
          begin
            sSql :=
              'INSERT INTO art.aad_autorizacertificadodeuda' +
                        ' (ad_contrato, ad_fechasolicitud, ad_usuariosolicitud, ad_fechaautorizacion, ad_autorizado,' +
                         ' ad_deudafinal, ad_usuarioautorizo, ad_observacioncobranza, ad_fechavigencia)' +
                 ' VALUES (:contrato, SYSDATE, :ususolicitud, SYSDATE, :autorizado, :deudafinal, :usuautorizo, :observaciones,' +
                         ' :fechavigencia)';
            EjecutarSqlEx(sSql, [Contrato, Sesion.UserID, String(IIF((rgPermite.ItemIndex = 0), 'S', 'N')),
                                 FDeudaRec.DeudaTotal, Sesion.UserID, memoObservaciones3.Lines.Text,
                                 TDateTimeEx.Create(edFechaCertificadoCobertura.Date)]);

            sSql :=
              'UPDATE aad_autorizacertificadodeuda' +
                ' SET ad_fechavigencia = :fechavigencia' +
              ' WHERE ad_contrato = :contrato' +
                ' AND NVL(ad_fechavigencia, SYSDATE) >= SYSDATE';
            EjecutarSqlEx(sSql, [TDateTimeEx.Create(edFechaCertificadoCobertura.Date), Contrato]);
            bDeshabilitarEspeciales := (rgPermite.ItemIndex <> 0);
          end;
        end
        else
        begin
          if fpPermisoImpresion.ShowModal = mrOk then
          try
            sSql :=
              'BEGIN' +
               ' intraweb.do_solicitarpermisocertificado(:contrato, :usuario, :tipopedido, :tipocertificado, :deuda,' +
                                                       ' :gestor, :observaciones);' +
             ' END;';
            EjecutarSqlEx(sSql, [Contrato, Sesion.UserID, fraTipoPedido.Codigo, fraTipoCertificado.Codigo,
                                 edDeuda.Value, fraGestor.Codigo, memoObservaciones2.Lines.Text]);
            MsgBox('Su pedido fue enviado al sector Cobranza, la respuesta la recibirá vía e-mail.');
          except
            on E: Exception do
              ErrorMsg(E, 'Error al realizar la solicitud.')
          end;
        end;

      if bDeshabilitarEspeciales then
      begin
        rbClausulaEspecial.Enabled := False;
        rbClausulaParticular.Enabled := False;
        rbClausulaComun.Checked := True;
        if Sesion.Sector <> 'CALLCENT' then
        begin
          rbClausulaComun.Enabled := False;
          rbNomina.Enabled := False;
          rbCoberturaExterior.Enabled := False;

          rbClausulaComun.Checked := False;
          rbClausulaEspecial.Checked := False;
          rbClausulaParticular.Checked := False;
          rbNomina.Checked := False;
          rbCoberturaExterior.Checked := False;
        end;
      end
      else
      begin
        rbClausulaEspecial.Enabled   := Seguridad.Activar(rbClausulaEspecial);
        rbClausulaParticular.Enabled := Seguridad.Activar(rbClausulaParticular);
        if Sesion.Sector <> 'CALLCENT' then
        begin
          rbClausulaComun.Enabled      := Seguridad.Activar(rbClausulaComun);
          rbNomina.Enabled             := Seguridad.Activar(rbNomina);
          rbCoberturaExterior.Enabled  := Seguridad.Activar(rbCoberturaExterior);
        end;
      end;
    end
    else
    begin
      rbClausulaEspecial.Enabled   := Seguridad.Activar(rbClausulaEspecial);
      rbClausulaParticular.Enabled := Seguridad.Activar(rbClausulaParticular);
      if Sesion.Sector <> 'CALLCENT' then
      begin
        rbClausulaComun.Enabled      := Seguridad.Activar(rbClausulaComun);
        rbNomina.Enabled             := Seguridad.Activar(rbNomina);
        rbCoberturaExterior.Enabled  := Seguridad.Activar(rbCoberturaExterior);
      end;
    end;


    rbClausulaComun.Checked := False;
    rbClausulaEspecial.Checked := False;
    rbClausulaParticular.Checked := False;
    rbNomina.Checked := False;
    rbCoberturaExterior.Checked := False;
    LockControls(GBDeuda, not Seguridad.Claves.IsActive('CertificadosConDeuda'));

    if (FImprimirSinDeuda) and (not bDeshabilitarEspeciales) then
    begin
      rbClausulaComun.Enabled := Seguridad.Activar(rbClausulaComun);
      rbClausulaEspecial.Enabled := Seguridad.Activar(rbClausulaEspecial);
      rbClausulaParticular.Enabled := Seguridad.Activar(rbClausulaParticular);
      rbNomina.Enabled := Seguridad.Activar(rbNomina);
      rbCoberturaExterior.Enabled := Seguridad.Activar(rbCoberturaExterior);

      chkIntereses.Checked := True;
      rbNoMostrarDeuda.Checked := True;
    end
    else
    begin
      rbClausulaComun.Enabled := Seguridad.Activar(rbClausulaComun);
      rbClausulaEspecial.Enabled := False;
      rbClausulaParticular.Enabled := False;
      rbNomina.Enabled := Seguridad.Activar(rbNomina);
      rbCoberturaExterior.Enabled := Seguridad.Activar(rbCoberturaExterior);

      rbMostrarDeuda.Checked := True;
    end;
  end;

  if IsAutoAsegurada(fraCO_CONTRATO.CUIT) then
    InfoHint(fraCO_CONTRATO.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
end;

procedure TfrmEmisionCertificados.FormCreate(Sender: TObject);
begin
  inherited;

  edPaises.UseUserSelectedOrder := True;

  FRegistrosSeleccionados := TStringList.Create;

  fraCO_CONTRATO.ShowBajas      := True;
  fraCO_CONTRATO.ExtraCondition := ' AND co_contrato IS NOT NULL ';
  fraCO_CONTRATO.OnChange       := CargaGrilla;
  fraCO_CONTRATO.ContratoActivo := True;

  with fraTipoPedido do
  begin
    TableName   := 'ati_tipopedido';
    FieldID     := 'ti_id';
    FieldCodigo := 'ti_id';
    FieldDesc   := 'ti_detalle';
    FieldBaja   := 'ti_fechabaja';
  end;

  with fraTipoCertificado do
  begin
    TableName      := 'ctb_tablas';
    FieldID        := 'tb_codigo';
    FieldCodigo    := 'tb_codigo';
    FieldDesc      := 'tb_descripcion';
    FieldBaja      := 'tb_fechabaja';
    ExtraCondition := ' AND tb_clave = ''TCERT'' AND tb_codigo <> ''0'' ';
    IdType         := ctString;
  end;

  with fraGestor do
  begin
    TableName   := 'use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'codigo';
    FieldDesc   := 'descripcion';
    FieldBaja   := 'baja';
    Sql         :=
      'SELECT codigo, descripcion, ID, baja, se_id, se_fechabaja' +
       ' FROM (SELECT se_usuario codigo, gc_nombre descripcion, se_id ID, se_fechabaja baja, se_id, se_fechabaja' +
               ' FROM agc_gestorcuenta, use_usuarios' +
              ' WHERE LOWER (gc_direlectronica) = LOWER (se_mail)' +
                ' AND gc_estudio = ''N''' +
                ' AND se_sector = ''COB''' +
                ' AND se_fechabaja IS NULL' +
          ' UNION ALL' +
             ' SELECT se_usuario, UPPER (se_nombre), se_id, se_fechabaja, se_id, se_fechabaja' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario IN (''NBOTTEGAL'', ''GMAMBERTO'')) use_usuarios' +
      ' WHERE 1 = 1 ';
  end;

  rbClausulaComunClick(Sender);  //Inhabilita los campos
  tbSeparador.Left := 36;
  tbContacto.Left := 36;
  gbTraspaso.Visible := False;
  gbCoberturaExterior.Visible := False;


  LockControl(edDeuda, True);
  VCLExtra.LockControls(gbCiius, True);

  EliminarRegistrosTemporalesDatosNoRepeticion;
  RefrescarDatosNoRepeticion;
end;

procedure TfrmEmisionCertificados.MostrarDatosEmpresa;
var
  bHabilitar: Boolean;
  dFechaBaja: TDateTime;
  iResultadoValidaCertificado: Integer;
  sdqDatos: TSDQuery;
  sMensaje: String;
  sMotivoBaja: String;
  sNombreArtFutura: String;
  sSql: String;
begin
  FImprimirSinDeuda := False;

  sSql :=
    'SELECT co_estado, co_contrato, co_idartfutura, afiliacion.check_cobertura(co_contrato) checkcobertura, em_cuit,' +
          ' co_vigenciadesde, co_fechabaja, emi.utiles.get_per_contratoddjj_adeudadas(co_contrato) ddjjadeudadas,' +
          ' co_idactividad, co_idactividad2, co_idactividad3' +
     ' FROM aco_contrato, aem_empresa' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  sdqDatos := GetQueryEx(sSql, [Contrato]);
  try
    FDDJJAdeudadas := sdqDatos.FieldByName('ddjjadeudadas').AsString;
    FEstado        := sdqDatos.FieldByName('co_estado').AsString;
    dFechaBaja     := sdqDatos.FieldByName('co_fechabaja').AsDateTime;

    //Genera la cadena con el mensaje
    if ((FEstado <> '1') and (FEstado <> '2')) then
    begin
      sSql :=
        'SELECT afiliacion.msg_cobertura(:contrato)' +
         ' FROM DUAL';
      FEstadoDesc := ValorSqlEx(sSql, [sdqDatos.FieldByName('co_contrato').AsInteger]);
      if sdqDatos.FieldByName('checkcobertura').AsString = '4' then
      begin
        sSql :=
          'SELECT tb_descripcion' +
           ' FROM ctb_tablas' +
          ' WHERE tb_codigo = :codigo' +
            ' AND tb_clave = ''MOTIB''';
        sMotivoBaja := ValorSqlEx(sSql, [FEstado]);
        sMensaje := sMensaje + #13#10 + 'El motivo de baja es : ' + sMotivoBaja;
      end;

      //si la empresa esta dada de baja pero todavia la fecha de baja
      //no se cumplio, entonces igual habilita la impresion de certificados
      bHabilitar := ((FEstado = '6') and (dFechaBaja >= Date));
      tbImprimir.Enabled := bHabilitar;
      tbExportar.Enabled := bHabilitar;
    end
    else
    begin
      if FEstado = '1' then
        FEstadoDesc := 'Activa'
      else if FEstado = '2' then
        FEstadoDesc := 'Pendiente de Autorización de SRT';

      tbImprimir.Enabled := True;
      tbExportar.Enabled := True;
    end;

    if FEstadoDesc = '' then
    begin
      sSql :=
        'SELECT tb_descripcion' +
         ' FROM ctb_tablas' +
        ' WHERE tb_clave = ''AFEST''' +
          ' AND tb_codigo = :codigo';
      FEstadoDesc := ValorSqlEx(sSql, [sdqDatos.FieldByName('co_estado').AsString]);
    end;

    sNombreArtFutura := Get_NombreARTFutura(Contrato);
    if sNombreArtFutura > '' then
    begin
      gbTraspaso.Visible := True;
      sMensaje := sMensaje + #13#10 + 'La empresa solicitó traspaso a la ART: ' + sNombreArtFutura;
    end
    else
      gbTraspaso.Visible := False;

    if FDeudaRec.DeudaTotal > 0 then
    begin
      sMensaje := 'La deuda actual es de: ' + FormatFloat('$#,##0.00', FDeudaRec.DeudaTotal) +
                 #13#10 + 'El estado de la empresa es: ' + FEstadoDesc + sMensaje;

      sSql :=
        'SELECT se_nombre, TRUNC(ad_fechavigencia) fechavencimiento' +
         ' FROM use_usuarios, aad_autorizacertificadodeuda' +
        ' WHERE se_usuario = ad_usuarioautorizo' +
          ' AND ad_contrato = :contrato' +
          ' AND ad_fechavigencia >= SYSDATE' +
          ' AND ad_autorizado = ''S''' +
          ' AND ad_id = (SELECT MAX (ad_id)' +
                         ' FROM aad_autorizacertificadodeuda' +
                        ' WHERE ad_contrato = :contrato)';
      with GetQueryEx(sSql, [Contrato]) do
      try
        if not IsEmpty then
        begin
          FImprimirSinDeuda := True;
          sMensaje := sMensaje +
                      #13#10 + 'Autorizado por: ' + FieldByName('se_nombre').AsString +
                      #13#10 + 'Fecha de Vencimiento: ' + FieldByName('fechavencimiento').AsString;
          MsgBox(sMensaje, MB_ICONEXCLAMATION);
        end
        else
        begin
          sMensaje := sMensaje + #13#10#13#10 + '¿ Desea imprimir el certificado con deuda ?';
          FImprimirSinDeuda := not MsgAsk(sMensaje);
        end;
      finally
        Free;
      end;
    end
    else
      FImprimirSinDeuda := True;

    if not GetValidaCertificado(fraCO_CONTRATO.Contrato, Sesion.UserID, iResultadoValidaCertificado) then   // Si tiene 0 trabajadores en la declaración jurada..
    begin
      Verificar((iResultadoValidaCertificado = 3), fraCO_CONTRATO.edContrato, 'Bloqueo de la generación de certificados de cobertura. El Asegurado debe comunicarse con Atención al Cliente de Afiliaciones.');

      if Seguridad.Claves.IsActive('CertificadosEmpresaSinTrabajadores') then
      begin
        if not MsgAsk('Esta empresa tiene 0 trabajadores en su última DDJJ. ¿ Desea continuar ?') then
          Abort;
      end
      else
      begin
        MsgBox('Esta empresa tiene 0 trabajadores en su última DDJJ y usted no tiene permiso para emitir un ' +
               'certificado en estas condiciones.' + #13#10 + 'Por favor comuníquese con el sector de Afiliaciones.');
        Abort;
      end;
    end;

    fraActividad1.Value := sdqDatos.FieldByName('co_idactividad').AsInteger;
    fraActividad2.Value := sdqDatos.FieldByName('co_idactividad2').AsInteger;
    fraActividad3.Value := sdqDatos.FieldByName('co_idactividad3').AsInteger;
  finally
    sdqDatos.Free;
  end;
end;

procedure TfrmEmisionCertificados.rbClausulaComunClick(Sender: TObject);
begin
  LockControls(GBDatos, True);
  LockControls(GBFechaLimite, False);
  LockControls(GBDeuda, False);
  LockControls(GBFirma, False);
  ShowCoberturaExterior(False);
  tbExportar.Enabled := False;
end;

procedure TfrmEmisionCertificados.rbClausulaParticularClick(Sender: TObject);
begin
  LockControls(GBDatos, False);
  LockControls(GBFechaLimite, False);
  LockControls(GBDeuda, False);
  LockControls(GBFirma, False);
  ShowCoberturaExterior(False);
  tbExportar.Enabled := False;
end;

procedure TfrmEmisionCertificados.rbClausulaEspecialClick(Sender: TObject);
begin
  LockControls(GBDatos, False);
  LockControls(GBFechaLimite, False);
  LockControls(GBDeuda, False);
  LockControls(GBFirma, False);
  ShowCoberturaExterior(False);
  tbExportar.Enabled := False;
end;

procedure TfrmEmisionCertificados.rbNominaClick(Sender: TObject);
begin
  LockControls(GBDatos, True);
  LockControls(GBFechaLimite, True);
  LockControls(GBDeuda, True);
  LockControls(GBFirma, True);
  ShowCoberturaExterior(False);
  tbExportar.Enabled := True;
end;

procedure TfrmEmisionCertificados.mnuImprimeImpresoraClick(Sender: TObject);
begin
  ImprimirCertificado(False);
end;

procedure TfrmEmisionCertificados.tbLimpiarClick(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;

  sdqConsulta.Close;

  rbFecha2.Checked                   := True;
  rbConFirma.Checked                 := True;
  rbNoMostrarNotificacion.Checked    := True;
  rbNoMostrarEstablecimiento.Checked := True;
  rbMostrarDeuda.Checked             := True;
  rbNominaSimple.Checked             := True;
  rbClausulaComun.Checked            := True;
  fraCO_CONTRATO.Clear;

  fraActividad1.Clear;
  fraActividad2.Clear;
  fraActividad3.Clear;

  CalcularFilas;
end;

// INSERT EN LA TABLA ANI_NOMINAIMPRESA
procedure TfrmEmisionCertificados.Guardar_NOI(aIdCertificado: Integer);
begin
  if aIdCertificado <> 0 then
    with TSql.Create('ani_nominaimpresa') do
    begin
      BeginTrans;
      sdqConsulta.DisableControls;
      try
        try
          sdqConsulta.First;
          while not sdqConsulta.Eof do
          begin
            if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('tj_id').AsString) > -1 then
            begin
              Clear;

              PrimaryKey.Add('ni_id',               'SEQ_ANI_ID.NEXTVAL', False);
              Fields.Add('ni_idcertificado',        aIdCertificado);
              Fields.Add('ni_cuil',                 sdqConsulta.FieldByName('tj_cuil').AsString);
              Fields.Add('ni_nombre',               sdqConsulta.FieldByName('tj_nombre').AsString);
              Fields.Add('ni_sexo',                 sdqConsulta.FieldByName('tj_sexo').AsString);
              Fields.Add('ni_categoria',            sdqConsulta.FieldByName('rl_categoria').AsString);
              Fields.Add('ni_tarea',                sdqConsulta.FieldByName('rl_tarea').AsString);
              Fields.AddExtended('ni_remuneracion', sdqConsulta.FieldByName('rl_sueldo').AsCurrency, ALL_DECIMALS, False);

              if sdqConsulta.FieldByName('rl_fechaingreso').IsNull then
                Fields.AddExpression('ni_fmovimiento', SQL_NULL)
              else
                Fields.Add('ni_fmovimiento', sdqConsulta.FieldByName('rl_fechaingreso').AsDateTime);

              if sdqConsulta.FieldByName('tj_fnacimiento').IsNull then
                Fields.AddExpression('ni_fnacimiento', SQL_NULL)
              else
                Fields.Add('ni_fnacimiento', sdqConsulta.FieldByName('tj_fnacimiento').AsDateTime);

              if not sdqConsulta.FieldByName('re_idestablecimiento').IsNull then
                Fields.Add('ni_idestablecimiento', sdqConsulta.FieldByName('re_idestablecimiento').AsInteger);

              EjecutarSqlST(InsertSql);
            end;
            sdqConsulta.Next;
          end;

          CommitTrans;
        except
          on E: Exception do
          begin
            RollBack;
            MessageDlg('Se ha producido un error al grabar la nómina.' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        sdqConsulta.EnableControls;
        Free;
      end;
    end;
end;

function TfrmEmisionCertificados.Guardar_CCO(aContrato: Longint; var aNroCertificado: Integer; aIdFirma: Integer; aCuit,
                                             aTipoClausula, aTipoNomina, aTipoVigencia: String; aDeuda, aIntereses,
                                             aFirma, aNotificar: Boolean; aEstablecimiento: Boolean;
                                             const aGeneraPDF: Boolean; const aActividad1, aActividad2,
                                             aActividad3: Integer; const aMostrarDDJJFaltante: Boolean): Integer;
var
  eImporteDeuda: Extended;
  iIdAutorizacionDeuda: Integer;
  iIdCertificado: Integer;
  iIdCertXTrab: Integer;
  iIndex: Integer;
  sFechaDDJJ: String;
  SqlTrans: TSql;
  sSql: String;
  sTipoDeuda: String;
  sValorEstablecimiento: String;
  sValorIntereses: String;
  sValorNotif: String;
begin
  Result := 0;

  if not aFirma then
    aIdFirma := 0;

  if aNotificar then
    sValorNotif := 'M'
  else
    sValorNotif := 'NM';

  if aEstablecimiento then
    sValorEstablecimiento := 'M'
  else
    sValorEstablecimiento := 'NM';

  if aIntereses then
    sValorIntereses := 'M'
  else
    sValorIntereses := 'NM';

  if aDeuda then
  begin
    sTipoDeuda := 'M';         // Mostrar
    eImporteDeuda := ValorSqlEx('SELECT deuda.get_deudacertcobertura(:contrato) FROM DUAL', [aContrato]);
  end
  else
  begin
    eImporteDeuda := 0;
    sTipoDeuda := 'NM';       // No Mostrar
  end;

  sSql :=
    'SELECT MAX(ad_id)' +
     ' FROM art.aad_autorizacertificadodeuda' +
    ' WHERE ad_contrato = :contrato' +
      ' AND ad_autorizado = ''S''' +
      ' AND ad_id = (SELECT MAX (ad_id)' +
                     ' FROM aad_autorizacertificadodeuda' +
                    ' WHERE ad_contrato = :contrato)';
  iIdAutorizacionDeuda := ValorSqlIntegerEx(sSql, [aContrato]);

  iIdCertificado   := ValorSql('SELECT seq_ace_id.NEXTVAL FROM DUAL');
  sFechaDDJJ       := ValorSql('SELECT nomina.get_ultperiodonomina FROM DUAL');
  SqlTrans         := TSQL.Create('acc_certificadocobertura');
  SqlTrans.SqlType := stInsert;

  SqlTrans.PrimaryKey.Add('cc_id',              iIdCertificado);
  SqlTrans.Fields.Add('cc_nrocertificado',      aNroCertificado);
  SqlTrans.Fields.Add('cc_contrato',            aContrato);
  SqlTrans.Fields.Add('cc_estado',              FEstado, True);
  SqlTrans.Fields.Add('cc_deuda',               eImporteDeuda);
  SqlTrans.Fields.Add('cc_tipocertificado',     aTipoClausula);
  SqlTrans.Fields.Add('cc_observaciones',       '');
  SqlTrans.Fields.Add('cc_tipodeuda',           sTipoDeuda);
  SqlTrans.Fields.Add('cc_notif',               sValorNotif);
  SqlTrans.Fields.Add('cc_establecimiento',     sValorEstablecimiento);
  SqlTrans.Fields.Add('cc_idfirma',             aIdFirma);
  SqlTrans.Fields.Add('cc_fechaddjj',           sFechaDDJJ);
  SqlTrans.Fields.Add('cc_criteriovencimiento', aTipoVigencia);
  SqlTrans.Fields.Add('cc_intereses',           sValorIntereses);
  SqlTrans.Fields.Add('cc_tiponomina',          aTipoNomina);
  SqlTrans.Fields.Add('cc_fechaimpresion',      SQL_DATETIME, False);
  SqlTrans.Fields.Add('cc_usuimpresion',        frmPrincipal.DBLogin.UserID);
  SqlTrans.Fields.Add('cc_idautorizaciondeuda', iIdAutorizacionDeuda, True);
  SqlTrans.Fields.Add('cc_ddjjadeudadas',       FDDJJAdeudadas);
  SqlTrans.Fields.Add('cc_idactividad1',        aActividad1);
  SqlTrans.Fields.Add('cc_idactividad2',        aActividad2);
  SqlTrans.Fields.Add('cc_idactividad3',        aActividad3);
  SqlTrans.Fields.Add('cc_ddjjfaltante',        String(IIF(aMostrarDDJJFaltante, 'T', 'F')));

  if aGeneraPDF then
    SqlTrans.Fields.Add('cc_enviado', 'T')
  else
    SqlTrans.Fields.Add('cc_impreso', 'T');

  // Ingresa los periodos con deuda
  sSql :=
    'INSERT INTO acd_certificadodeuda' +
               ' (cd_id, cd_idcertificado, cd_periodo, cd_importe, cd_intereses, cd_situacion)' +
     ' (SELECT seq_acd_id.NEXTVAL, :idcertificado, rc_periodo, importe, ROUND(tasa / 100 * importe, 2) intereses, concursos' +
        ' FROM (SELECT rc_periodo,' +
                     ' utiles.iif_compara(''<='', rc_periodo, em_ultimomesconcurso, 0,' +
                                        ' deuda.get_tasaacumulada(deuda.get_vencimientocuotacontrato(rc_contrato, rc_periodo),' +
                                                                ' actualdate)) tasa,' +
                     ' (rc_devengadocuota + rc_devengadofondo)' +
                     ' -(rc_pagocuota + rc_pagofondo + rc_recuperocuota + rc_recuperofondo) - rc_importereclamado' +
                     ' - rc_montorefinanciado importe,' +
                     ' utiles.iif_compara(''<='', rc_periodo, em_ultimomesconcurso, ''C'', NULL) concursos' +
                ' FROM aem_empresa, aco_contrato, zrc_resumencobranza' +
               ' WHERE rc_periodo <= deuda.ultimoperiododevengado' +
                 ' AND rc_prescripto = ''N''' +
                 ' AND co_idempresa = em_id' +
                 ' AND co_contrato = rc_contrato' +
                 ' AND rc_periodo >= TO_CHAR(NVL(cobranza.get_maxfechaconcquiebra(em_cuit), TO_DATE(rc_periodo || ''01'', ''YYYYMMDD'')),' +
                                           ' ''YYYYMM'')' +
                 ' AND rc_contrato = :contrato)' +
       ' WHERE importe > 0)';
  BeginTrans;
  try
    try
      if aTipoClausula = 'X' then
      begin
        iIdCertXTrab := InsCertXTrabViaje(iIdCertificado, IIF((rgFormaViaje.ItemIndex = 0), 'A',
                                          IIF((rgFormaViaje.ItemIndex = 1), 'M',
                                          IIF((rgFormaViaje.ItemIndex = 2), 'T', 'A'))), edAsistenciaViajero.Text, ACuit,
                                          edDestino.Text, memoObservaciones.Lines.Text, frmPrincipal.DBLogin.UserID,
                                          edFechaRecepcion.Date, edFechaRegreso.Date, edFechaSalida.Date,
                                          checkMostrarValidez.Checked);
        GuardarTrabajadoresEnViaje(iIdCertXTrab);
        InsertarPaisesEnCertificado(iIdCertXTrab);
      end;

      EjecutarSqlST(SqlTrans.Sql);
      if aDeuda then
        EjecutarSqlSTEx(sSql, [iIdCertificado, aContrato]);
      CommitTrans;
      Result := iIdCertificado;
    except
      on E: ESDOraError do
      begin
        if (E.ErrorCode = 1) and (Pos('AFI.UK_ACC_NROCERTIFICADO', E.Message) > 0) then   // Si se viola esa constraint..
        begin
          if aNroCertificado = FNroCertificadoAnterior then    // Si es la primera vez que entra por aca..
            // Tomo el siguiente número de certificado..
            aNroCertificado := ValorSql('SELECT NVL(MAX(cc_nrocertificado), 0) + 1 FROM acc_certificadocobertura');

          // Reemplazo el número de certificado de cobertura..
          iIndex := SqlTrans.Fields.FieldByName['cc_nrocertificado'].Index;
          SqlTrans.Fields.Delete(iIndex);
          SqlTrans.Fields.Add('cc_nrocertificado', aNroCertificado);

          // Reintento guardar todo de nuevo..
          try
            EjecutarSqlST(SqlTrans.Sql);
            if aDeuda then
              EjecutarSqlST(sSql);
            CommitTrans;
            Result := iIdCertificado;
          except
            on E: Exception do
            begin
              MsgBox('Se produjo un error al guardar.' + #13#10 + E.Message, MB_ICONEXCLAMATION, 'Atención');
              RollBack;
              Result := 0;
            end;
          end;
        end;
      end;
      on E: Exception do
      begin
        MsgBox('Se produjo un error al guardar.' + #13#10 + E.Message, MB_ICONEXCLAMATION, 'Atención');
        RollBack;
        Result := 0;
      end;
    end;
  finally
    SqlTrans.Free;
  end;
end;

procedure TfrmEmisionCertificados.edCUILChange(Sender: TObject);
begin
  if rbCUIL.Checked then
    sdqConsulta.Locate('tj_cuil', edCUIL.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmEmisionCertificados.edCUILEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  ednombre.Text := '';
  rbCUIL.Checked := True;
end;

procedure TfrmEmisionCertificados.edNombreChange(Sender: TObject);
begin
  if rbNombre.Checked then
    sdqConsulta.Locate('tj_nombre', edNombre.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmEmisionCertificados.edNombreEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  edCUIL.Text := '';
  rbNombre.Checked := True;
end;

procedure TfrmEmisionCertificados.btAgregarClick(Sender: TObject);
begin
  with sdqConsulta do
    if FRegistrosSeleccionados.IndexOf(FieldByName('tj_id').AsString) = -1 then
      FRegistrosSeleccionados.Add(FieldByName('tj_id').AsString);
end;

procedure TfrmEmisionCertificados.btSalirClick(Sender: TObject);
begin
  fpBusqueda.ModalResult := mrOk;
end;

procedure TfrmEmisionCertificados.BuscarTrabajador(Sender: TObject);
begin
  fpBusqueda.ShowModal;
end;

procedure TfrmEmisionCertificados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EliminarRegistrosTemporalesDatosNoRepeticion;

  Action := caFree;
  frmEmisionCertificados := nil;

  inherited;
end;

procedure TfrmEmisionCertificados.MostrarDatosNoRepeticion(const aId: Integer);
begin
  if aId = -1 then    // Alta..
  begin
    edRazonSocial.Clear;
    fraDomicilio.Clear;
  end
  else
    with sdqDatosNoRepeticion do
    begin
      edRazonSocial.Text        := FieldByName('dr_razonsocial').AsString;
      fraDomicilio.Numero       := FieldByName('dr_numero').AsString;
      fraDomicilio.Piso         := FieldByName('dr_piso').AsString;
      fraDomicilio.Departamento := FieldByName('dr_departamento').AsString;
      fraDomicilio.Calle        := FieldByName('dr_calle').AsString;
      fraDomicilio.CodigoPostal := FieldByName('dr_codigopostal').AsString;
      fraDomicilio.Localidad    := FieldByName('dr_localidad').AsString;
      fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    end;

  if fpDatosNoRepeticion.ShowModal = mrOk then
  begin
    with TSql.Create('afi.adr_datosnorepeticion') do
    try
      if aId = -1 then    // Alta..
      begin
        SqlType := stInsert;
        Fields.Add('dr_fechaalta', SQL_DATETIME, False);
        Fields.Add('dr_usualta',   Sesion.UserID);
      end
      else
      begin
        SqlType := stUpdate;
        Fields.Add('dr_fechamodif', SQL_DATETIME, False);
        Fields.Add('dr_usumodif',   Sesion.UserID);
      end;

      PrimaryKey.Add('dr_id', aId);

      Fields.Add('dr_calle',               fraDomicilio.Calle);
      Fields.Add('dr_codigopostal',        fraDomicilio.CodigoPostal);
      Fields.Add('dr_departamento',        fraDomicilio.Departamento);
      Fields.AddExpression('dr_fechabaja', SQL_NULL);
      Fields.Add('dr_localidad',           fraDomicilio.Localidad);
      Fields.Add('dr_numero',              fraDomicilio.Numero);
      Fields.Add('dr_piso',                fraDomicilio.Piso);
      Fields.Add('dr_provincia',           fraDomicilio.Prov);
      Fields.Add('dr_razonsocial',         edRazonSocial.Text);
      Fields.AddExpression('dr_usubaja',   SQL_NULL);

      EjecutarSQL(Sql);
    finally
      Free;
    end;

    RefrescarDatosNoRepeticion;
  end;
end;

procedure TfrmEmisionCertificados.RefrescarDatosNoRepeticion;
begin
  sdqDatosNoRepeticion.SQL.Text :=
       'SELECT dr_id, dr_idcertificado, dr_razonsocial, dr_calle, dr_numero, dr_piso, dr_departamento, dr_codigopostal, '+
       ' dr_localidad, dr_provincia, dr_fechaalta, dr_usualta, dr_fechamodif, dr_usumodif, dr_fechabaja, dr_usubaja, '+
       ' dr_registrotemporal,'+
       ' art.utiles.armar_domicilio(dr_calle, dr_numero, dr_piso, dr_departamento, NULL) || '' '' '+
       ' || art.utiles.armar_localidad(dr_codigopostal, NULL, dr_localidad, dr_provincia) domicilio, '+
       ' pv_descripcion '+
       ' FROM afi.adr_datosnorepeticion adr, cpv_provincias '+
       ' WHERE dr_provincia = pv_codigo(+) ' +
       ' AND dr_usualta = ' + SQLString(Sesion.UserID, True) +
       ' AND dr_registrotemporal = ''T''';
  with sdqDatosNoRepeticion do
  begin
    Close;
    Open;
  end;
end;

procedure TfrmEmisionCertificados.SetContrato(const Value: Integer);
begin
  if fContrato <> Value then
  begin
    fContrato := Value;
    if fContrato > 0 then
      if fraCO_CONTRATO.Contrato <> fContrato then
      begin
        fraCO_CONTRATO.Contrato := fContrato;
        CargaGrilla(nil);
      end;
  end;
end;

procedure TfrmEmisionCertificados.edDocumentoEnter(Sender: TObject);
begin
  edCuil.Text := '';
  ednombre.Text := '';
  rbDocumento.Checked := True;
end;

procedure TfrmEmisionCertificados.edDocumentoChange(Sender: TObject);
begin
  if rbDocumento.Checked then
    sdqConsulta.Locate('tj_documento', edDocumento.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmEmisionCertificados.SetCertificadoAnterior(const Value: String);
var
  sSql: String;
begin
  FCertificadoAnterior := Value;

  sSql :=
    'SELECT *' +
     ' FROM acc_certificadocobertura, cpv_provincias, acx_certxtrabenviaje' +
    ' WHERE cc_provincia = pv_codigo(+)' +
      ' AND cc_id = cx_idcertificado(+)' +
      ' AND cc_id = :id';
  with GetQueryEx(sSql, [FCertificadoAnterior]) do
  try
    Contrato := FieldByName('cc_contrato').AsInteger;

    if FieldByName('cc_tipocertificado').AsString = 'E' then
      rbClausulaEspecial.Checked := True
    else if FieldByName('cc_tipocertificado').AsString = 'C' then
      rbClausulaComun.Checked := True
    else if FieldByName('cc_tipocertificado').AsString = 'P' then
      rbClausulaParticular.Checked := True
    else if FieldByName('cc_tipocertificado').AsString = 'N' then
      rbNomina.Checked := True
    else if FieldByName('cc_tipocertificado').AsString = 'X' then
      rbCoberturaExterior.Checked := True;

    if FieldByName('cc_tipocertificado').AsString = 'X' then
    begin
      edFechaSalida.Date           := FieldByName('cx_fechasalida').AsDateTime;
      edFechaRegreso.Date          := FieldByName('cx_fecharegreso').AsDateTime;
      edFechaRecepcion.Date        := FieldByName('cx_fecharecepcion').AsDateTime;
      checkMostrarValidez.Checked  := (FieldByName('cx_mostrarvalidez').AsString = 'T');
      edDestino.Text               := FieldByName('cx_destino').AsString;
      edAsistenciaViajero.Text     := FieldByName('cx_asistenciaviajero').AsString;
      memoObservaciones.Lines.Text := FieldByName('cx_observaciones').AsString;
      rgFormaViaje.ItemIndex       := IIF((FieldByName('cx_formaviaje').AsString = 'A'), 0,
                                      IIF((FieldByName('cx_formaviaje').AsString = 'M'), 1,
                                      IIF((FieldByName('cx_formaviaje').AsString = 'T'), 2, 0)));
    end;

    //Cargarcheck de paises
    edPaises.Populate;
    //CheckPaises(FCertificadoAnterior);
    CheckPaises(FieldByName('cx_id').AsInteger);

    if FieldByName('cc_tipodeuda').AsString = 'M' then
      rbMostrarDeuda.Checked := True
    else
      rbNoMostrarDeuda.Checked := True;

    if FieldByName('cc_notif').AsString = 'M' then
      rbMostrarNotificacion.Checked := True
    else
      rbNoMostrarNotificacion.Checked := True;

    if FieldByName('cc_establecimiento').AsString = 'M' then
      rbMostrarEstablecimiento.Checked := True
    else
      rbNoMostrarEstablecimiento.Checked := True;

    if FieldByName('cc_idfirma').AsString = 'M' then
      rbConFirma.Checked := True
    else
      rbSinFirma.Checked := True;

    if FieldByName('cc_criteriovencimiento').AsString = '30' then
      rbFecha2.Checked := True
    else
      rbFecha1.Checked := True;

    if FieldByName('cc_tiponomina').AsString = 'S' then
      rbNominaSimple.Checked := True
    else if FieldByName('cc_tiponomina').AsString = 'M' then
      rbNominaCompletaConMasa.Checked := True
    else
      rbNominaCompleta.Checked := True;

    if FieldByName('cc_ddjjfaltante').AsString = 'F' then
      rbNoMostrarDDJJFaltante.Checked := True
    else
      rbMostrarDDJJFaltante.Checked := True;
    
    chkIntereses.Checked := (FieldByName('cc_intereses').AsString = 'M');

    fraActividad1.Value := FieldByName('cc_idactividad1').AsInteger;
    fraActividad2.Value := FieldByName('cc_idactividad2').AsInteger;
    fraActividad3.Value := FieldByName('cc_idactividad3').AsInteger;

    // Copia los datos de no repetición del certificado seleccionado..
    sSql :=
      'INSERT INTO afi.adr_datosnorepeticion' +
                ' (dr_razonsocial, dr_calle, dr_numero, dr_piso, dr_departamento, dr_codigopostal, dr_localidad,' +
                 ' dr_provincia, dr_fechaalta, dr_usualta)' +
          ' SELECT dr_razonsocial, dr_calle, dr_numero, dr_piso, dr_departamento, dr_codigopostal, dr_localidad,' +
                 ' dr_provincia, SYSDATE, :usualta' +
            ' FROM afi.adr_datosnorepeticion' +
           ' WHERE dr_idcertificado = :idcertificado' +
             ' AND dr_fechabaja IS NULL';
    EjecutarSqlEx(sSql, [Sesion.UserID, StrToIntDef(FCertificadoAnterior, 0)]);
    RefrescarDatosNoRepeticion;
  finally
    Free;
  end;
end;

procedure TfrmEmisionCertificados.mnuImprimeMailClick(Sender: TObject);
begin
  ImprimirCertificado(True)
end;

procedure TfrmEmisionCertificados.ImprimirCertificado(GeneraPDF: Boolean);
var
  aOpciones: TOpcionesEnvioMail;
  iIdCertificado: Integer;
  iIdFirma: Integer;
  iNroCertificado: Integer;
  iResultadoValidaCertificado: Integer;
  sBody: String;
  sDDJJAdeudadas: String;
  sDireccionOrigen: String;
  sNombreArchivo: String;
  sNombreArchivoNomina: String;
  sSql: String;
  sTipoClausula: String;
  sTipoNomina: String;
  sTipoVigencia: String;
begin
  Verificar(not fraCO_CONTRATO.IsSelected, fraCO_CONTRATO.edContrato, 'Debe elegir una empresa.');
  Verificar((not rbClausulaComun.Checked) and (not rbClausulaEspecial.Checked) and
            (not rbClausulaParticular.Checked) and (not rbNomina.Checked) and (not rbCoberturaExterior.Checked), nil,
            'Debe seleccionar un Tipo de Certificado.');
  Verificar(IsAutoAsegurada(fraCO_CONTRATO.CUIT), fraCO_CONTRATO.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');

  sSql :=
    'SELECT co_estado' +
     ' FROM aco_contrato' +
    ' WHERE co_estado = ''2''' +
      ' AND co_contrato = :contrato';
  Verificar((Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'ATCLI') and (ExisteSqlEx(sSql, [fraCO_CONTRATO.Contrato])), nil, 'La empresa se encuentra en estado "Pendiente de Autorizar por la SRT" por lo tanto usted no puede emitir el certificado.');    // Ticket 32843..

  if FRegistrosSeleccionados.Count > 0 then
  begin
    if rbNominaSimple.Checked then
      sTipoNomina := 'S'
    else if rbNominaCompleta.Checked then
      sTipoNomina := 'C'
    else if rbNominaCompletaConMasa.Checked then
      sTipoNomina := 'M';
  end;

  if rbClausulaEspecial.Checked then
    sTipoClausula := 'E'
  else if rbClausulaComun.Checked then
    sTipoClausula := 'C'
  else if rbClausulaParticular.Checked then
    sTipoClausula := 'P'
  else if rbNomina.Checked then
    sTipoClausula := 'N'
  else if rbCoberturaExterior.Checked then
    sTipoClausula := 'X';

  if rbFecha2.Checked then
    sTipoVigencia := '30'
  else if rbFecha1.Checked then
    sTipoVigencia := 'FM';


  //Validaciones
  Verificar(((sTipoClausula = 'N') and (FRegistrosSeleccionados.Count <= 0)), nil, 'No existen filas seleccionadas para imprimir la nómina.');
  Verificar(((sTipoClausula = 'X') and (edPaises.Text = '')), edPaises, 'Seleccione al menos un país para continuar.'); //Tk 46453 pedido de ggrossi
  Verificar(((sTipoClausula = 'X') and (FRegistrosSeleccionados.Count <= 0)), nil, 'Seleccione un registro de la nómina para continuar');
  Verificar((rbMostrarNotificacion.Checked) and ((sTipoClausula = 'E') or (sTipoClausula = 'P')) and (sdqDatosNoRepeticion.IsEmpty), nil, 'Para imprimir este cetificado debe ingresar los Datos de No Repetición.');

  if not GetValidaCertificado(fraCO_CONTRATO.Contrato, Sesion.UserID, iResultadoValidaCertificado) then   // Si tiene 0 trabajadores en la declaración jurada..
    if Seguridad.Claves.IsActive('CertificadosEmpresaSinTrabajadores') then
    begin
      if not MsgAsk('Esta empresa tiene 0 trabajadores en su última DDJJ. ¿ Desea continuar ?') then
        Abort;
    end
    else
    begin
      MsgBox('Esta empresa tiene 0 trabajadores en su última DDJJ y usted no tiene permiso para emitir un ' +
             'certificado en estas condiciones.' + #13#10 + 'Por favor comuníquese con el sector de Afiliaciones.');
      Abort;
    end;

  if sTipoClausula = 'X' then
  begin
    sSql :=
      'SELECT co_estado' +
       ' FROM aem_empresa, aco_contrato' +
      ' WHERE co_idempresa = em_id' +
        ' AND em_cuit = :cuit' +
        ' AND co_contrato = :contrato';
    Verificar((ValorSQLEx(sSql, [fraCO_CONTRATO.CUIT, fraCO_CONTRATO.Contrato]) = 6), Grid, 'No puede cargar un viaje a una empresa inactiva.');
    
    Verificar(edFechaSalida.IsEmpty, edFechaSalida, 'Debe seleccionar una fecha de salida.');
    Verificar(edFechaRegreso.IsEmpty, edFechaRegreso, 'Debe seleccionar una fecha de regreso.');
    Verificar(edFechaRecepcion.IsEmpty, edFechaRecepcion, 'Debe seleccionar una fecha de recepción.');
    Verificar((edDestino.Text = ''), edDestino, 'Debe ingresar un destino.');
    Verificar((rgFormaViaje.ItemIndex = -1), rgFormaViaje, 'El campo Forma de Viaje es obligatorio.');
   // Verificar((FRegistrosSeleccionados.Count > 1), Grid, 'Solo se puede seleccionar un trabajador.');
  end;
  //Fin Validaciones


  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''FI_RE''' +
      ' AND tb_codigo = ''1''';
  iIdFirma := ValorSql(sSql);
  
  iNroCertificado := ValorSql('SELECT NVL(MAX(cc_nrocertificado), 0) + 1 FROM acc_certificadocobertura');
  FNroCertificadoAnterior := iNroCertificado;
  iIdCertificado := 0;

  if sTipoClausula <> 'N' then
  begin
    iIdCertificado := Guardar_CCO(fraCO_CONTRATO.Contrato, iNroCertificado, iIdFirma, fraCO_CONTRATO.mskCUIT.Text,
                                  sTipoClausula, sTipoNomina, sTipoVigencia, rbMostrarDeuda.Checked,
                                  chkIntereses.Checked, rbConFirma.Checked, rbMostrarNotificacion.Checked,
                                  rbMostrarEstablecimiento.Checked, GeneraPDF, fraActividad1.Value, fraActividad2.Value,
                                  fraActividad3.Value, rbMostrarDDJJFaltante.Checked);
    GuardarDatosNoRepeticion(iIdCertificado);

    if not gridDatosNoRepeticion.ReadOnly then    // Si la grilla está habilitada se imprime un reporte por registro..
    begin
      sdqDatosNoRepeticion.First;
      while not sdqDatosNoRepeticion.Eof do
      begin
        if sdqDatosNoRepeticion.FieldByName('dr_fechabaja').IsNull then
        begin
          Application.CreateForm(TrptCertificados, rptCertificados);
          with rptCertificados do
          try
            if GeneraPDF then
              sNombreArchivo := TempPath + Format('CERT%d.PDF', [iNroCertificado]);

            CalleTercero        := sdqDatosNoRepeticion.FieldByName('dr_calle').AsString;
            CodigoPostalTercero := sdqDatosNoRepeticion.FieldByName('dr_codigopostal').AsString;
            DepartamentoTercero := sdqDatosNoRepeticion.FieldByName('dr_departamento').AsString;
            LocalidadTercero    := sdqDatosNoRepeticion.FieldByName('dr_localidad').AsString;
            NumeroTercero       := sdqDatosNoRepeticion.FieldByName('dr_numero').AsString;
            PisoTercero         := sdqDatosNoRepeticion.FieldByName('dr_piso').AsString;
            ProvinciaTercero    := sdqDatosNoRepeticion.FieldByName('dr_provincia').AsString;
            RazonTercero        := sdqDatosNoRepeticion.FieldByName('dr_razonsocial').AsString;

            PrepararReporte(iNroCertificado, fraCO_CONTRATO.Contrato, sTipoClausula, sTipoVigencia,
                            rbMostrarDeuda.Checked, chkIntereses.Checked, rbConFirma.Checked, False,
                            rbMostrarNotificacion.Checked, sNombreArchivo, gbTraspaso.Visible,
                            checkMostrarValidez.Checked, FDDJJAdeudadas, rbMostrarDDJJFaltante.Checked);
          finally
            Free;
          end;
        end;
        sdqDatosNoRepeticion.Next;
      end;
    end
    else
    begin
      Application.CreateForm(TrptCertificados, rptCertificados);
      with rptCertificados do
      try
        if GeneraPDF then
          sNombreArchivo := TempPath + Format('CERT%d.PDF', [iNroCertificado]);

        PrepararReporte(iNroCertificado, fraCO_CONTRATO.Contrato, sTipoClausula, sTipoVigencia,
                        rbMostrarDeuda.Checked, chkIntereses.Checked, rbConFirma.Checked, False,
                        rbMostrarNotificacion.Checked, sNombreArchivo, gbTraspaso.Visible, checkMostrarValidez.Checked,
                        FDDJJAdeudadas, rbMostrarDDJJFaltante.Checked);
      finally
        Free;
      end;
    end;

    // Copia los datos de no repetición del certificado impresora como temporales..
    sSql :=
      'INSERT INTO afi.adr_datosnorepeticion' +
                ' (dr_razonsocial, dr_calle, dr_numero, dr_piso, dr_departamento, dr_codigopostal, dr_localidad,' +
                 ' dr_provincia, dr_fechaalta, dr_usualta)' +
          ' SELECT dr_razonsocial, dr_calle, dr_numero, dr_piso, dr_departamento, dr_codigopostal, dr_localidad,' +
                 ' dr_provincia, SYSDATE, :usualta' +
            ' FROM afi.adr_datosnorepeticion' +
           ' WHERE dr_idcertificado = :idcertificado' +
             ' AND dr_fechabaja IS NULL';
    EjecutarSqlEx(sSql, [Sesion.UserID, iIdCertificado]);
    RefrescarDatosNoRepeticion;
  end;

  if (FRegistrosSeleccionados.Count > 0) and (sTipoClausula <> 'X') then
  begin
    Application.CreateForm(TrptRepNom, rptRepNom);
    with rptRepNom do
    begin
      if sTipoClausula = 'N' then
        iIdCertificado := Guardar_CCO(fraCO_CONTRATO.Contrato, iNroCertificado, iIdFirma, fraCO_CONTRATO.mskCUIT.Text,
                                      'N', sTipoNomina, sTipoVigencia, False, False, False, False,
                                      rbMostrarEstablecimiento.Checked, GeneraPDF, fraActividad1.Value,
                                      fraActividad2.Value, fraActividad3.Value, rbMostrarDDJJFaltante.Checked);

      GuardarDatosNoRepeticion(iIdCertificado);
      Guardar_NOI(iIdCertificado);

      if GeneraPDF then
        sNombreArchivoNomina := TempPath + 'NOM' + IntToStr(iNroCertificado) + '.PDF';
      try
        PrepararReporte(fraCO_CONTRATO.Contrato, sTipoNomina, iIdCertificado, sNombreArchivoNomina, sTipoVigencia,
                        sTipoClausula);
      finally
        Free;
      end;
    end;
  end;

  if not GeneraPDF then
    Exit;

  sBody := 'Provincia ART';

  if (sTipoClausula = 'E') or (sTipoClausula = 'P') then
  begin
    sSql :=
      'SELECT cc_ddjjadeudadas' +
       ' FROM acc_certificadocobertura' +
      ' WHERE cc_id = :id';
    sDDJJAdeudadas := ValorSqlEx(sSql, [iIdCertificado]);
    if sDDJJAdeudadas <> '' then
      sBody := 'Hemos detectado en nuestros registros algunas declaraciones juradas faltantes correspondientes a los ' +
               'períodos ' + sDDJJAdeudadas + ' y por ese motivo le solicitamos que se contacte por e-mail a la ' +
               'siguiente dirección: emision@provart.com.ar.' + #13#13#13#10 + sBody;
  end;

  if Sesion.Sector = 'AFI' then
  begin
    aOpciones := [oAlwaysShowDialog, oAutoFirma, oDeleteAttach, oSinNotaAlPie];
    sDireccionOrigen := 'certificados@provart.com.ar';
  end
  else
  begin
    aOpciones := [oAlwaysShowDialog, oAutoFirma, oDeleteAttach];
    sDireccionOrigen := '';
  end;

  unEnvioMail.EnviarMailBD('', Format('Certificado de Cobertura - Contrato Nº %d', [fraCO_CONTRATO.Contrato]), aOpciones,
                           [sNombreArchivoNomina, sNombreArchivo], sBody, fraCO_CONTRATO.Contrato, tcCertificadosART,
                            True, True, 2500, -1, [tdContactoContrato], 'certificados@provart.com.ar', False,
                            sDireccionOrigen);
end;

procedure TfrmEmisionCertificados.fraCO_CONTRATOExit(Sender: TObject);
begin
  inherited;
  
  fraCO_CONTRATO.FrameExit(Sender);
  Contrato := fraCO_CONTRATO.edContrato.Value;
end;

procedure TfrmEmisionCertificados.tbContactoClick(Sender: TObject);
var
  iEmpresa: Integer;
  sSql: String;
begin
  Verificar(not fraCO_CONTRATO.IsSelected, fraCO_CONTRATO.edContrato, 'Debe elegir una empresa.');

  sSql :=
    'SELECT em_id' +
     ' FROM aco_contrato, aem_empresa' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  iEmpresa  := ValorSqlIntegerEx(sSql, [Contrato]);

  with TfrmContratoContacto.Create(Self) do
  try
    DoCargarDatos(Contrato, iEmpresa);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEmisionCertificados.CalcularFilas;
begin
  edCantCertificados.Value := FRegistrosSeleccionados.Count;

  if sdqConsulta.Active and tbCalcularTotal.Down then
    edCantEmpleados.Value := sdqConsulta.RecordCount
  else
    edCantEmpleados.Value := 0;
end;

procedure TfrmEmisionCertificados.GridCellClick(Column: TColumn);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (LowerCase(Column.FieldName) = 'checkbox') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('tj_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('tj_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('tj_id').AsString);
    Grid.Repaint;
  end;

  CalcularFilas;
end;

procedure TfrmEmisionCertificados.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmEmisionCertificados.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  
  CalcularFilas;
end;

procedure TfrmEmisionCertificados.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmEmisionCertificados.CambioEstadoEstablecimiento(Sender: TObject);
begin
  inherited;
  
  CargaGrilla(nil);
end;

function TfrmEmisionCertificados.GetContrato: integer;
begin
  Result := fraCO_CONTRATO.Contrato;
end;

function TfrmEmisionCertificados.GetDeuda(const aContrato: Integer; const aFecha: TDateTime): TRecDeuda;
begin
  with sdspGetDeudaCertificado do
  begin
    ParamByName('dtfecha').AsDateTime  := aFecha;
    ParamByName('ncontrato').AsInteger := aContrato;

    ExecProc;

    with Result do
    begin
      DeudaNominal := ParamByName('ndeudanominal').AsFloat;
      DeudaTotal   := ParamByName('ndeudatotal').AsFloat;
      Interes      := ParamByName('ninteres').AsFloat;
      Periodo      := ParamByName('speriodo').AsString;
    end;
  end;
end;

procedure TfrmEmisionCertificados.GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

//Grid.col
end;

procedure TfrmEmisionCertificados.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                     Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if LowerCase(Column.FieldName) = 'checkbox' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('tj_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmEmisionCertificados.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  
  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('tj_id').AsString) > -1 then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;
end;

procedure TfrmEmisionCertificados.FSFormDestroy(Sender: TObject);
begin
  inherited;
  FRegistrosSeleccionados.Free;
end;

procedure TfrmEmisionCertificados.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['checkbox']);
end;

procedure TfrmEmisionCertificados.tbAgregarTrabajadores(Sender: TObject);
var
  aArchivo: TextFile;
  sTemp: String;
begin
  OpenDialog.Filter := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(aArchivo, OpenDialog.FileName);
      Reset(aArchivo);

      if FRegistrosSeleccionados.Count > 0 then
      begin
        if MsgAsk('¿ Desea desmarcar los trabajadores seleccionados antes de agregar los que contiene el archivo ?') then
          FRegistrosSeleccionados.Clear;
      end;

      while not Eof(aArchivo) do
      begin
        Readln(aArchivo, sTemp);
        sTemp := StringReplace(sTemp, '-', '', [rfReplaceAll]);

        if sdqConsulta.Locate('tj_cuil', sTemp, [loPartialKey]) then
          with sdqConsulta do
            if FRegistrosSeleccionados.IndexOf(FieldByName('tj_id').AsString) = -1 then
              FRegistrosSeleccionados.Add(FieldByName('tj_id').AsString);
      end;
    except
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
  finally
    Grid.Repaint;
    CloseFile(aArchivo);
  end;
end;

procedure TfrmEmisionCertificados.mnuAyudaAgregarTrabajadoresClick(Sender: TObject);
begin
  MostrarAyuda('Ayuda - Importación masiva de Trabajadores', 'Afiliaciones - Emisión de Certificados de Cobertura (Trabajadores).rtf');
end;

function TfrmEmisionCertificados.GetValidaCertificado(const aContrato: Integer; const aUsuario: String; var aResultado: Integer): Boolean;
begin
  with sdspGetValidaCertificado do
  begin
    ParamByName('contrato').AsInteger := aContrato;
    ParamByName('usuario').AsString   := aUsuario;

    ExecProc;

    aResultado := ParamByName('cod_error').AsInteger;

    Result := (aResultado = 0);
  end;
end;

procedure TfrmEmisionCertificados.rbCoberturaExteriorClick(Sender: TObject);
begin
  LockControls(GBDatos, True);
  LockControls(GBFechaLimite, True);
  LockControls(GBDeuda, True);
  LockControls(GBFirma, True);
  ShowCoberturaExterior(True);
  tbExportar.Enabled := True;
  edPaises.Clear;
end;

procedure TfrmEmisionCertificados.ShowCoberturaExterior(const aMostrar: Boolean);
begin
  gbCoberturaExterior.Visible := aMostrar;

  if aMostrar then
  begin
    edFechaSalida.Clear;
    edFechaRegreso.Clear;
    edFechaRecepcion.Clear;
    checkMostrarValidez.Checked := True;
    checkMostrarValidez.Enabled := Seguridad.Activar(checkMostrarValidez);
    edDestino.Clear;
    edAsistenciaViajero.Clear;
    memoObservaciones.Clear;
    rgFormaViaje.ItemIndex := -1;
  end;
end;

procedure TfrmEmisionCertificados.EliminarRegistrosTemporalesDatosNoRepeticion;
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM afi.adr_datosnorepeticion' +
         ' WHERE dr_usualta = :usualta' +
           ' AND dr_registrotemporal = ''T''';
  EjecutarSqlEx(sSql, [Sesion.UserID]);
end;

procedure TfrmEmisionCertificados.GuardarDatosNoRepeticion(const aIdCertificado: Integer);
var
  sSql: String;
begin
  if not gridDatosNoRepeticion.ReadOnly then    // Solo se guardan los datos si la grilla está habilitada..
  begin
    sSql :=
      'UPDATE afi.adr_datosnorepeticion' +
        ' SET dr_idcertificado = :idcertificado,' +
            ' dr_registrotemporal = ''F''' +
      ' WHERE dr_usualta = :usualta' +
        ' AND dr_registrotemporal = ''T''';
    EjecutarSqlEx(sSql, [aIdCertificado, Sesion.UserID]);
  end;
end;

procedure TfrmEmisionCertificados.GuardarTrabajadoresEnViaje(const aIdCertXTrab: Integer);
var
  sSql: String;
begin
  if aIdCertXTrab <> 0 then
    with Grid.DataSource.DataSet do
    begin

      DisableControls;
      try
        try
          First;
          while not Eof do
          begin
            if FRegistrosSeleccionados.IndexOf(FieldByName('tj_id').AsString) > -1 then
            begin
              sSql := 'BEGIN art.web.do_ins_trabenviaje(:id, :cuil, :usuario); END;';
              EjecutarSqlSTEx(sSql, [aIdCertXTrab, FieldByName('tj_cuil').AsString, frmPrincipal.DBLogin.UserId]);
            end;
            Next;
          end;
        except
          on E: Exception do
            MessageDlg('Se ha producido un error al grabar los trabajadores en viaje.' + #13#10 + E.Message, mtError, [mbOK], 0);
        end;
      finally
        EnableControls;
      end;
    end;
end;

function TfrmEmisionCertificados.InsCertXTrabViaje(const aCertificadoId: Integer; const aFormaViaje, aAsistenciaViajero,
                                                   aCuit, aDestino, aObservaciones, aUsuarioAlta: String;
                                                   const aFechaRecepcion, aFechaRegreso, aFechaSalida: TDateTime;
                                                   const aMostrarValidez: Boolean): Integer;
begin
  with sdspInsCertxTrabViaje do
  begin
    if not Prepared then
      Prepare;

    ParamByName('asistenciaviajero').AsString := aAsistenciaViajero;
    ParamByName('cuit').AsString              := aCuit;
    ParamByName('destino').AsString           := aDestino;
    ParamByName('fecharecepcion').AsString    := FormatDateTime('yyyy-mm-dd', aFechaRecepcion);
    ParamByName('fecharegreso').AsString      := FormatDateTime('yyyy-mm-dd', aFechaRegreso);
    ParamByName('fechasalida').AsString       := FormatDateTime('yyyy-mm-dd', aFechaSalida);
    ParamByName('formaviaje').AsString        := aFormaViaje;
    ParamByName('idcertificado').AsInteger    := aCertificadoId;
    ParamByName('observaciones').AsString     := aObservaciones;
    ParamByName('usualta').AsString           := aUsuarioAlta;
    ParamByName('mostrarvalidez').AsString    := IIF(aMostrarValidez, 'T', 'F');

    ExecProc;

    Result := ParamByName('id').AsInteger;
  end;
end;

procedure TfrmEmisionCertificados.btnCancelarClick(Sender: TObject);
begin
  fpPermisoImpresion.Close;
end;

procedure TfrmEmisionCertificados.fpPermisoImpresionBeforeShow(Sender: TObject);
var
  iUsuario: Integer;
  sSql: String;
begin
  fraTipoPedido.Clear;
  fraTipoCertificado.Clear;
  fraGestor.Clear;
  memoObservaciones2.Clear;

  sSql :=
    'SELECT se_id' +
     ' FROM aco_contrato, agc_gestorcuenta, use_usuarios' +
    ' WHERE co_idgestor = gc_id' +
      ' AND LOWER(gc_direlectronica) = LOWER(se_mail)' +
      ' AND co_contrato = :contrato';
  iUsuario := ValorSqlIntegerEx(sSql, [fraCO_CONTRATO.Contrato]);
  fraGestor.Value := iUsuario;
end;

procedure TfrmEmisionCertificados.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraTipoPedido.IsEmpty, fraTipoPedido.edCodigo, 'El campo Tipo de Pedido es obligatorio.');
  Verificar(fraTipoCertificado.IsEmpty, fraTipoCertificado.edCodigo, 'El campo Tipo de Certificado es obligatorio.');

  fpPermisoImpresion.ModalResult := mrOk;
end;

procedure TfrmEmisionCertificados.btnAceptar2Click(Sender: TObject);
begin
  Verificar((rgPermite.ItemIndex = -1), rgPermite, 'Debe elegir si permite o no.');
  Verificar((memoObservaciones3.Lines.Text = ''), memoObservaciones3, 'El campo Observaciones es obligatorio.');

  fpAprobarEmisionCertificado.ModalResult := mrOk;
end;

procedure TfrmEmisionCertificados.btnCancelar2Click(Sender: TObject);
begin
  fpAprobarEmisionCertificado.ModalResult := mrCancel;
end;

procedure TfrmEmisionCertificados.fpAprobarEmisionCertificadoBeforeShow(Sender: TObject);
var
  sSql: String;
begin
  edFechaCertificadoCobertura.Date := DBDate + 15;
  pnMensaje.Hide;
  rgPermite.ItemIndex := -1;
  memoObservaciones3.Clear;

  sSql :=
    'SELECT to_date(ad_fechavigencia, ''dd/mm/yyyy'') fechavigencia, ad_usuarioautorizo' +
     ' FROM aad_autorizacertificadodeuda' +
    ' WHERE ad_contrato = :contrato' +
      ' AND ad_autorizado = ''S''' +
 ' ORDER BY ad_id DESC';
  with GetQueryEx(sSql, [Contrato]) do
  try
    if not IsEmpty then
    begin
      lbMensaje.Caption := Format('Este contrato fue autorizado hasta el %s por %s.', [FieldByName('fechavigencia').AsString, FieldByName('ad_usuarioautorizo').AsString]);
      pnMensaje.Show;
    end;
  finally
    Free;
  end;
end;

procedure TfrmEmisionCertificados.tbCambiarCIIUClick(Sender: TObject);
begin
  VCLExtra.LockControls(gbCiius, False);
end;

procedure TfrmEmisionCertificados.btnCancelar3Click(Sender: TObject);
begin
  fpDatosNoRepeticion.ModalResult := mrCancel;
end;

procedure TfrmEmisionCertificados.tbNuevo2Click(Sender: TObject);
begin
  MostrarDatosNoRepeticion(-1);
end;

procedure TfrmEmisionCertificados.tbModificar2Click(Sender: TObject);
begin
  if not sdqDatosNoRepeticion.Active then
    Exit;

  if sdqDatosNoRepeticion.FieldByName('dr_id').AsInteger < 1 then
    Exit;

  MostrarDatosNoRepeticion(sdqDatosNoRepeticion.FieldByName('dr_id').AsInteger);
end;

procedure TfrmEmisionCertificados.tbDarDeBajaClick(Sender: TObject);
var
  sSql: String;
begin
  if not sdqDatosNoRepeticion.Active then
    Exit;

  if sdqDatosNoRepeticion.FieldByName('dr_id').AsInteger < 1 then
    Exit;

  if not MsgAsk('¿ Realmente desea dar de baja este registro ?') then
    Exit;

  sSql :=
    'UPDATE afi.adr_datosnorepeticion' +
      ' SET dr_fechabaja = SYSDATE,' +
          ' dr_usubaja = :usubaja' +
    ' WHERE dr_id = :id';
  EjecutarSqlEx(sSql, [Sesion.UserID, sdqDatosNoRepeticion.FieldByName('dr_id').AsInteger]);
  RefrescarDatosNoRepeticion;
end;

procedure TfrmEmisionCertificados.btnAceptar3Click(Sender: TObject);
begin
  fpDatosNoRepeticion.ModalResult := mrOk;
end;

procedure TfrmEmisionCertificados.gridDatosNoRepeticionDblClick(Sender: TObject);
begin
  tbModificar2Click(Sender);
end;

procedure TfrmEmisionCertificados.gridDatosNoRepeticionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                                     var Background: TColor; Highlight: Boolean);
begin
  if sdqDatosNoRepeticion.FieldByName('dr_fechabaja').AsString <> '' then
    AFont.Color := clRed;
end;

procedure TfrmEmisionCertificados.mnuImportarArchivoExcelClick(Sender: TObject);
var
  iLCid: Integer;
  iRow: Integer;
  sColA: String;
begin
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
  begin
    iLCid := GetUserDefaultLCID;
    try
      try
        ExcelApp.Workbooks.Open(OpenDialog.FileName, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
        ExcelApp.Visible[0] := False;
        ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
        ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
        ExcelWS.Activate;

        if FRegistrosSeleccionados.Count > 0 then
          if MsgAsk('¿ Desea desmarcar los trabajadores seleccionados antes de agregar los que contiene el archivo ?') then
            FRegistrosSeleccionados.Clear;


        with ExcelWS do
        begin
          iRow := 1;
          sColA := Range['A1', 'A1'].Value2;

          while sColA <> '' do
          begin
            sColA := StringReplace(sColA, '-', '', [rfReplaceAll]);

            if sdqConsulta.Locate('tj_cuil', sColA, [loPartialKey]) then
              with sdqConsulta do
                if FRegistrosSeleccionados.IndexOf(FieldByName('tj_id').AsString) = -1 then
                  FRegistrosSeleccionados.Add(FieldByName('tj_id').AsString);

            Inc(iRow);
            if (iRow mod 20) = 0 then
              Forms.Application.ProcessMessages;

            sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
          end;

          MsgBox('El proceso ha finalizado exitosamente.');
        end;
      except
        on E: Exception do
          MsgBox(e.Message);
      end;
    finally
      ExcelWS.Disconnect;
      ExcelWB.Disconnect;
      ExcelApp.Visible[0] := True;
      ExcelApp.Quit;
      ExcelApp.Disconnect;

      Grid.Repaint;
    end;
  end;
end;

procedure TfrmEmisionCertificados.InsertarPaisesEnCertificado(
  const aIdCertificado: Integer);
var
  i : integer;
  sSql : String;
  sCodPais : String;
begin
  if aIdCertificado <> 0 then
  begin
    sSql := 'INSERT INTO afi.ace_certificadoextpaises'+
            ' (ce_idcertificado, ce_codigopais)' +
            ' VALUES (:idcert, :codpais)';

    if edPaises.CheckedCount > 0 then
      begin
      for i := 0 to edPaises.Count -1 do
      begin
        if edPaises.Checked[i] then
        begin
          sCodPais := StringReplace(edPaises.ItemValue[i], '''', '', [rfReplaceAll, rfIgnoreCase]);
          EjecutarSqlSTEx(sSql,[aIdCertificado, sCodPais]);
        end;
      end;
    end;
  end;
end;

procedure TfrmEmisionCertificados.CheckPaises(
  const aIdCertificado: Integer);
var
  aQuery: TSDQuery;
  sSql : String;
  i : Integer;
begin
  sSql := 'SELECT ce_codigopais' +
            '  FROM afi.ace_certificadoextpaises' +
            ' WHERE ce_idcertificado =:cert';

  aQuery := GetQueryEx(sSql, [aIdCertificado]);
  try
    if not aQuery.Eof then
    begin
      for i := 0 to edPaises.Count -1 do
      begin
        if edPaises.ItemValue[i]= '' + aQuery.FieldByName('ce_codigopais').AsString + '' then
        begin
          edPaises.Checked[i] := True;
        end;
      end;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;
end.
