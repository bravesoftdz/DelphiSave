unit unRecepcion;

{----------------------------------------------------------------------------------------------------------------------
   CARGA DE VOLANTES.

   Modificacion: 14/05/2002 Ejv. Se incorpora el Importe de Percepcion e Importe de Debito los cuales estaran
                                 involucra en los calculos que determinan el Estado  de Pendiente a Liquidado
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unfraPrestador, StdCtrls, CurrEdit, Mask,
  ToolEdit, DateComboBox, Buttons, ExtCtrls, db, General, Placemnt, artSeguridad, ArtComboBox, SDEngine, IntEdit,
  PatternEdit, unArt, unRptVolante, ShortCutControl, ComCtrls, FormPanel, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unfraEstablecimiento, unFraEmpresa, unFraCodigoDescripcion, unFraCodDesc,
  RxPlacemnt, RxToolEdit, RxCurrEdit;

type
  TEstadoMP = (emNada, emSinPoliza, emSinDocum, emConDocum, emSinPagos);
  TQueLimpiar = set of (qlPrestador, qlFactura1, qlFactura2);
  TfrmRecepcion = class(TForm)
    gbPrestador: TGroupBox;
    grpFactura: TGroupBox;
    lbObservaciones: TLabel;
    btnSalir: TBitBtn;
    btnConfPrn: TBitBtn;
    btnFactura: TBitBtn;
    btnLimpiar: TBitBtn;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    btnGrabar: TBitBtn;
    fraPrestador: TfraPrestador;
    sdqDelegaciones: TSDQuery;
    dsDelegaciones: TDataSource;
    edObservaciones: TMemo;
    sdqDatos: TSDQuery;
    sdqDatosVO_VOLANTE: TFloatField;
    sdqDatosVO_PRESTADOR: TFloatField;
    sdqDatosVO_FACTURATIPO: TStringField;
    sdqDatosVO_FACTURAESTABLE: TStringField;
    sdqDatosVO_FACTURANRO: TStringField;
    sdqDatosVO_FECHAFACTURA: TDateTimeField;
    sdqDatosVO_MONTO: TFloatField;
    sdqDatosVO_VENCIMIENTO: TDateTimeField;
    sdqDatosVO_OBSERVACIONES: TStringField;
    sdqDatosVO_ESTADO: TStringField;
    sdqDatosESTADO: TStringField;
    sdqDatosVO_FACPEN: TFloatField;
    sdqDatosVO_DESTINATARIO: TStringField;
    sdqDatosVO_DELEGACION: TStringField;
    sdqDatosVO_FECHARECEPCION: TDateTimeField;
    lbChequeNombre: TLabel;
    edChequeNombre: TEdit;
    sdqDatosVO_CHEQUENOMBRE: TStringField;
    sdqDatosVO_AJUSTE: TFloatField;
    chkSvoTemp: TCheckBox;
    edVO_OBSERVACIONDEBITO: TMemo;
    lbObservacionDebito: TLabel;
    sdqDatosVO_MONTOPERCEPCION: TFloatField;
    sdqDatosVO_MONTODEBITO: TFloatField;
    sdqDatosVO_OBSERVACIONDEBITO: TStringField;
    chkRefacturacion: TCheckBox;
    sdqDatosVO_REFACTURACION: TStringField;
    sdqDatosVO_FECHAAUDITORIA: TDateTimeField;
    ShortCutControl: TShortCutControl;
    btnCargarCodigoBarras: TBitBtn;
    edCAI: TPatternEdit;
    lbCAI: TLabel;
    sdqDatosVO_CAI: TStringField;
    btnCargarSeguro: TBitBtn;
    sdqDatosVO_FECHAORTOPEDIA: TDateTimeField;
    gbPrestadorTMP: TGroupBox;
    edPrestCUIT: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    edPresRazonSocial: TEdit;
    fpPrestador: TFormPanel;
    btnCancelarPres: TButton;
    btnAceptarPres: TButton;
    gbPresSel: TGroupBox;
    lvPrestadores: TListView;
    sdqDatosVO_MONTOBRUTO: TFloatField;
    sdqDatosVO_MONTOIVA: TFloatField;
    chkMixto: TCheckBox;
    sdqDatosVO_MIXTO: TStringField;
    fpSelLoteAMP: TFormPanel;
    btnCancelarLote: TButton;
    btnAceptarLote: TButton;
    GroupBox1: TGroupBox;
    fraEmpresaEstabLote: TfraCodDesc;
    Label6: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    fraEstabFiltro: TfraEstablecimiento;
    btnSiguienteLote: TButton;
    lbFactura: TLabel;
    lbFecha: TLabel;
    lbTotFacturado: TLabel;
    lbVemcimiento: TLabel;
    lbDelegacion: TLabel;
    lbRecepcion: TLabel;
    Label1: TLabel;
    lbVolante: TLabel;
    lbImportePercepcion: TLabel;
    lbImporteDebito: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    deFecha: TDateComboBox;
    edTotFact: TCurrencyEdit;
    deVencimiento: TDateComboBox;
    cmbDelegaciones: TArtComboBox;
    deRecepcion: TDateComboBox;
    edVolante: TIntEdit;
    edAjuste: TIntEdit;
    pnlFactura: TPanel;
    edFacturaTipo: TEdit;
    edFacturaEstableci: TIntEdit;
    edFacturaNumero: TIntEdit;
    edVO_MONTOPERCEPCION: TCurrencyEdit;
    edVO_MONTODEBITO: TCurrencyEdit;
    edImpBruto: TCurrencyEdit;
    edImpIVA: TCurrencyEdit;
    gbCBU: TGroupBox;
    rbSiCBU: TRadioButton;
    rbNoCBU: TRadioButton;
    sdqDatosVO_CBUINFORMADA: TStringField;
    lblCBU: TLabel;
    chkSinLote: TCheckBox;
    Label7: TLabel;
    dcUltPrestacion: TDateComboBox;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edFacturaTipoKeyPress(Sender: TObject; var Key: Char);
    procedure edFacturaNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edTotFactKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnFacturaClick(Sender: TObject);
    procedure btnConfPrnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure edFacturaEstableciExit(Sender: TObject);
    procedure deFechaValidate(Sender: TObject; var Cancel: Boolean);
    procedure edFacturaTipoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFacturaEstableciKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure deRecepcionExit(Sender: TObject);
    procedure edAjusteExit(Sender: TObject);
    procedure edFacturaNumeroExit(Sender: TObject);
    procedure pnlFacturaExit(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure chkSvoTempClick(Sender: TObject);
    procedure edVO_MONTODEBITOChange(Sender: TObject);
    procedure btnCargarCodigoBarrasClick(Sender: TObject);
    procedure btnCargarSeguroClick(Sender: TObject);
    procedure edPrestCUITExit(Sender: TObject);
    procedure btnAceptarPresClick(Sender: TObject);
    procedure edImpBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure edImpBrutoExit(Sender: TObject);
    procedure fpSelLoteAMPBeforeShow(Sender: TObject);
    procedure fraEmpresaEstabLotePropiedadesChange(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure btnAceptarLoteClick(Sender: TObject);
    procedure btnCancelarLoteClick(Sender: TObject);
    procedure btnSiguienteLoteClick(Sender: TObject);
    procedure edFacturaTipoChange(Sender: TObject);
    procedure rbSiCBUClick(Sender: TObject);
    procedure rbNoCBUClick(Sender: TObject);
  private
    bTemporario, CargaPrestMed, pbCodBarrasCargado, pbIsModificacion: Boolean;
    rptVolante: TrptVolante;
    sTabHead: String;
    pFechaVencimientoCAI: TDateTime;
    FEstadoMP :TEstadoMP;

    function CantSel: Integer;
    function GetSoloModifDebito: Boolean;
    function GuardarCambios: Boolean;
    function GuardarDatos: Boolean;
    function GuardarNuevo: Boolean;
    function Validar: Boolean;
    function SetEstadoNuevo :String;
    function DoGrabarLoteAMP(sEstado :String):Boolean;
    function ValidarDebito: Boolean;      // TK 33642

    procedure CalcVolNro;
    procedure DisableFactura(BTipo, BEstableci, BNumero: Boolean; SetDefaultValues: Boolean = False);
    procedure DoChequearFechaRevision;
    procedure fraPrestadorChange(Sender: TObject);
    procedure ImprimirVolante;
    procedure Limpiar(QueLimpiar: TQueLimpiar);
    procedure RestartFactura(ASetFocus: Boolean = False);
    procedure ShowPrestadores;
    procedure AvisoFaltaSeguro(IdPrestador :Integer);
    procedure DoCargarSeguro;
    procedure DoHabilitarMixto(bChecked :Boolean; iVolante :Integer);
    procedure DoLogSeguroMP;
    procedure DoGrabarVolanteLote;
    procedure SetCBUInformada;
  public
    function Modificar(pVolante: Integer): Boolean;
  end;

  procedure EjecutarAlarma(Prestador: integer);

//const
//  FechaInicioCAI: String = '01/01/2010';

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, strFuncs, SDOra, unSesion, Numeros, CustomDlgs, DateTimeFuncs,
  unCapturarCodigoBarras, unPlanDePagosDePolizas, unRptAvisoFaltaSeguro, ArchFuncs, unExportPDF, unEnvioMail
  {$IFNDEF USE_MAIL_DLL}, unMoldeEnvioMail, CUIT, uncomunes{$ENDIF},
  RTLConsts;

{$R *.DFM}

procedure TfrmRecepcion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiquiRecepcion.Enabled := True;
end;

procedure TfrmRecepcion.edFacturaEstableciExit(Sender: TObject);
begin
  if (Trim(edFacturaEstableci.Text) <> '') then
    edFacturaEstableci.Text := Lpad(edFacturaEstableci.text, '0', 4);
end;

procedure TfrmRecepcion.edFacturaNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #8) and (edFacturaNumero.Text = '') then
    edFacturaEstableci.SetFocus;
end;

procedure TfrmRecepcion.edTotFactKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ThousandSeparator then
    Key := DecimalSeparator;
end;

function TfrmRecepcion.GuardarDatos: Boolean;
begin
  if Validar then
  begin
    if edVolante.Visible then
    begin
      if GuardarCambios then
      begin
        Result      := True;
        ModalResult := mrOk;
      end
      else
        Result := False;
    end
    else
      Result := GuardarNuevo;
  end
  else
    Result := False;
end;

procedure TfrmRecepcion.Limpiar(QueLimpiar: TQueLimpiar);
begin
  pbCodBarrasCargado   := False;
  pFechaVencimientoCAI := 0;

  if qlPrestador in QueLimpiar then
  begin
    fraPrestador.Limpiar;
    edPrestCUIT.Clear;
    edPresRazonSocial.Clear;
    btnCargarSeguro.Enabled := False;
  end;

  if qlFactura1 in QueLimpiar then
  begin
    if not edFacturaTipo.ReadOnly then
      edFacturaTipo.Text := '';
    if not edFacturaEstableci.ReadOnly then
      edFacturaEstableci.Text := '';
    deFecha.Date  := deFecha.MaxDate;
  end;

  if qlFactura2 in QueLimpiar then
  begin
    if not edFacturaNumero.ReadOnly then
      edFacturaNumero.Text := '';
    edAjuste.Text           := '';
    edImpBruto.Text         := '';
    edImpBruto.MaxValue     := 0;
    edImpIVA.Text           := '';
    edTotFact.Text          := '';
    edTotFact.MaxValue      := 0;
    deRecepcion.ClearDate;
    deVencimiento.ClearDate;
    edObservaciones.Text    := '';
    edVO_MONTOPERCEPCION.Clear;
    edVO_MONTODEBITO.Clear;
    chkRefacturacion.Checked  := False;
    chkMixto.Checked          := False;
    edVO_OBSERVACIONDEBITO.Clear;
    edCAI.Clear;
  end;
end;

procedure TfrmRecepcion.btnLimpiarClick(Sender: TObject);
begin
  if fraPrestador.CanFocus then
    fraPrestador.CuitFocus
  else if edPrestCUIT.CanFocus then
    edPrestCUIT.SetFocus;
  Limpiar([qlPrestador, qlFactura1, qlFactura2]);
end;

procedure TfrmRecepcion.btnConfPrnClick(Sender: TObject);
begin
  rptVolante.PrinterSetup;
end;

procedure TfrmRecepcion.btnFacturaClick(Sender: TObject);
begin
  if GuardarDatos then
  begin
    ImprimirVolante;
    if edAjuste.Text <> '' then
      RestartFactura(True)
    else
    begin
      fraPrestadorChange(nil);
      edFacturaNumero.SetFocus;
    end;
    Limpiar([qlFactura2]);
  end;
end;

procedure TfrmRecepcion.FormCreate(Sender: TObject);
begin
  pbIsModificacion     := False;
  pbCodBarrasCargado   := False;
  pFechaVencimientoCAI := 0;

  // Habilita Carga de Volantes de PM
  CargaPrestMed        := True;

  sdqDelegaciones.Open;
  //---------------------------------------------------------------------------
  CalcVolNro;
  rptVolante                  := TrptVolante.Create(Self);
  fraPrestador.OnChange       := fraPrestadorChange;
  fraPrestador.ShowBajas      := True;
  fraPrestador.ShowInvisibles := True;
  //---------------------------------------------------------------------------
  deFecha.MaxDate     := DBDateTime;
  deFecha.Date        := deFecha.MaxDate;
  deRecepcion.MaxDate := deFecha.MaxDate;

  Limpiar([qlPrestador, qlFactura1, qlFactura2]);
  cmbDelegaciones.FieldValue := '840'; // Solo se limpia cuando se inicia el formulario

  fraEmpresaFiltro.ShowBajas  := True;
  fraEmpresaFiltro.OnChange   := OnEmpresaChange;
  fraEstabFiltro.ShowBajas    := True;
end;

procedure TfrmRecepcion.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRecepcion.FormDestroy(Sender: TObject);
begin
  rptVolante.Free;
  inherited;
end;

procedure TfrmRecepcion.ImprimirVolante;
var
  sCampos: String;
begin
// Ejv. 16/05/2002 si es una modificacion de un volante, solo se
//      modifica el importe del Debito o la obervacion no se imprime.
  if not edVolante.IsEmpty then
  begin
    if GetSoloModifDebito() then
      Exit;
  end;

  try
    if bTemporario then
      sCampos := 'vo_cuitprestador ca_clave, vo_descrprestador ca_descripcion, '
    else
      sCampos := 'ca_clave, ca_descripcion, ';

    rptVolante.EsTemporal := bTemporario;
    with rptVolante.sdqConsulta do
    begin
      Close;
      Sql.Text :=
        'SELECT ''*'' || substr(''00000000'', 1, 8 - length(to_char(vo_volante))) || to_char(vo_volante) || ''*'' codbarras,' +
              ' substr(''00000000'', 1, 8 - length(to_char(vo_volante))) || to_char(vo_volante) volante,' +
              ' vo_facturatipo || ''-'' || vo_facturaestable  || ''-'' ||  vo_facturanro factura, vo_volante,' +
              ' vo_prestador, vo_facturatipo, vo_facturaestable, vo_facturanro, vo_fechafactura, vo_montobruto,' +
              ' vo_vencimiento, vo_observaciones, vo_fecharecepcion, vo_fechalta, ' + sCampos + ' ca_asistencial,' +
              ' lg_nombre, tb_descripcion tipcomprobante, vo_chequenombre, vo_montopercepcion, vo_usualta,' +
              ' vo_refacturacion, vo_estado, vo_estadopend, utiles.iif_char (cp_cbu1, null, null, cp_cbu1 || ''-'' || cp_cbu2) cbu,' +
              ' vo_montoiva, vo_monto, ca_esreferente ' +
       ' FROM ' + sTabHead + 'svo_volantes, cpr_prestador, dlg_delegaciones, ' +
              ' ctb_tablas, ccp_cuentapago' +
        ' WHERE ca_identificador(+) = vo_prestador' +
          ' AND lg_codigo(+) = vo_delegacion' +
          ' AND tb_clave(+)= ''TCOMP''' +
          ' AND tb_codigo(+)= ca_tipocomprobante' +
          ' AND ca_identificador = cp_idacreedor(+)' +
          ' AND cp_tipoacreedor(+) = ''CA''' +
          ' AND cp_fechabaja(+) IS NULL ' +
          ' AND cp_fechaaltamcarga(+) IS NOT NULL ' +
          ' AND vo_volante = ' + IntToStr(edVolante.Tag);
      Open;
    end;
    rptVolante.PrinterSettings.Copies := 1;

    Application.ProcessMessages; // Fede (Para ver si se soluciona el problema del interior)
    rptVolante.Print;
    Application.ProcessMessages; // Fede (Para ver si se soluciona el problema del interior)
  except
    MsgBox('Error al Imprimir el Volante.' + #13 + 'El volante no se podrá imprimir.', MB_ICONERROR);
  end;
end;

procedure TfrmRecepcion.btnGrabarClick(Sender: TObject);
begin
  if GuardarDatos then
  begin
    ImprimirVolante;
    if fraPrestador.CanFocus then
      fraPrestador.CuitFocus
    else if edPrestCUIT.CanFocus then
      edPrestCUIT.SetFocus;
    Limpiar([qlFactura1, qlFactura2, qlPrestador]);
  end;
end;

procedure TfrmRecepcion.deFechaValidate(Sender: TObject; var Cancel: Boolean);
begin
  if (deFecha.Date > Date) then
  begin
    MessageDlg('La fecha de Factura no puede ser mayor a la fecha del día.', mtWarning, [mbOK], 0);
    deFecha.Date := 0;
    Cancel := True;
  end;
  {else if not (bTemporario) and (fraPrestador.Baja) and
              (deFecha.Date > fraPrestador.FechaBaja) then
  begin
    MessageDlg('El prestador está dado de BAJA.' + #13 + #10 + 'La fecha de Factura debe ser menor a ' + FormatDateTime('dd/mm/yyyy', fraPrestador.FechaBaja), mtWarning, [mbOK], 0);
    deFecha.Date := 0;
    Cancel := True;

     {end else if (not deRecepcion.Enabled) and (deRecepcion.Date < deFecha.Date) then begin
      MessageDlg('La fecha del volante no puede ser mayor a la fecha de recepción', mtWarning, [mbOK], 0);
      deFecha.Date := 0;
      Cancel := True;
  end;}
end;

function TfrmRecepcion.Validar: Boolean;
var
  sSql, sVolante, sIVA :String;
begin
  Result := False;

  Verificar(bTemporario and not(IsCuit(edPrestCUIT.Text)), edPrestCUIT, 'El CUIT no es válido.');

  sIVA := 'SELECT ca_ivadiscriminado ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :IdPres ';

  sSql := 'SELECT vo_volante' +
           ' FROM ' + sTabHead + 'svo_volantes, cpr_prestador' +
          ' WHERE vo_facturatipo = ' + SqlValue(edFacturaTipo.Text) +
            ' AND vo_facturaestable = ' + SqlValue(edFacturaEstableci.Text) +
            ' AND vo_facturanro = ' + SqlValue(edFacturaNumero.Text) +
            ' AND vo_estado <> ''C'' ';

  if bTemporario then
    sSql := sSql +
      ' AND vo_volante <> ' + SqlInt(edAjuste.Value) +
      ' AND ca_clave = vo_cuitprestador' +
      ' AND ca_clave = ' + SqlValue(edPrestCUIT.Text)
  else
    sSql := sSql +
      ' AND((ca_cuitpublico IS NOT NULL' +
      ' AND vo_prestador = ' + IntToStr(fraPrestador.IDPrestador) + ')' +
       ' OR (vo_prestador = ca_identificador' +
      ' AND ca_cuitpublico IS NULL' +
      ' AND ca_clave = ' + SqlValue(fraPrestador.Cuit) +
      ' AND vo_volante <> ' + SqlInt(edAjuste.Value) + '))';

  if lbVolante.Visible then
    sSql := sSql + ' AND vo_volante <> ' + SqlInt(edVolante.Value);
  sVolante := ValorSql(sSql);
  //----------------------------------------------------------------------------
  if (sVolante <> '') then
    InvalidMsg(edFacturaTipo, 'Ya se imputó esta factura para el prestador seleccionado en el volante ' + sVolante)

  else if (edFacturaTipo.Text = '') or (edFacturaNumero.Text = '') or (edFacturaEstableci.Text = '') then
    InvalidMsg(edFacturaTipo, 'La factura debe estar completa.')

  else if (fraPrestador.TipoComprobante <> 'CI') and
          (((fraPrestador.Iva = '1') and not AreIn(edFacturaTipo.Text, ['A', 'B'])) or  // los Inscriptos
           ((fraPrestador.Iva = '5') and not AreIn(edFacturaTipo.Text, ['M'])) or       // los Inscriptos con factura 'M'
           ((fraPrestador.Iva = '4') and (edFacturaTipo.Text <> 'C'))) then
  begin
    edFacturaTipo.Clear;
    InvalidMsg(edFacturaTipo, 'El tipo de factura es incorrecto para el prestador seleccionado.')
  end

  else if (gbCBU.Enabled and not(rbSiCBU.Checked) and not(rbNoCBU.Checked)) then
    InvalidMsg(gbCBU, 'Debe seleccionar CBU informada.')

  else if (deFecha.Date = 0) then
    InvalidMsg(deFecha, 'Debe cargar una fecha.')

  else if (not pbIsModificacion) and (not Seguridad.Claves.IsActive('FACTURAVENCIDA')) and (deFecha.Date+45<DBDate) then  // by NWK, 27/01/04
    InvalidMsg(deFecha, 'La fecha de factura supera los 45 días de emisión. Comuníquese con el responsable del sector.')

  else if (edImpBruto.Value <= 0) then
    InvalidMsg(edImpBruto, 'Debe cargar el importe de la Factura.')
// Ejv.
  else if CompareFloat(edTotFact.Value, (edVO_MONTOPERCEPCION.Value + edVO_MONTODEBITO.Value)) = -1 then
    InvalidMsg(edTotFact, 'El importe de la Factura no puede ser inferior a los importes de Percepcion mas Debito.')
// fin.
  else if (deRecepcion.Date = 0) then
    InvalidMsg(deRecepcion, 'Debe cargar una fecha de recepción.')

  else if (deRecepcion.Date < deFecha.Date) then
    InvalidMsg(deRecepcion, 'La fecha de recepción no puede ser menor que la fecha de la factura.')

  else if (deVencimiento.Date = 0) then
    InvalidMsg(deVencimiento, 'Debe cargar una fecha de Vencimiento.')

  else if (dcUltPrestacion.IsEmpty) and (fraPrestador.Baja) then
    InvalidMsg(dcUltPrestacion, 'Debe cargar la fecha de la última prestación de la factura.')

  else if not(bTemporario) and (fraPrestador.Baja) and (fraPrestador.FechaBaja < dcUltPrestacion.Date) then
    InvalidMsg(fraPrestador, 'El prestador ha sido dado de baja con anterioridad a la última prestación de la factura.')

  else if not(bTemporario) and (fraPrestador.Concertado <> 'S') then
    InvalidMsg(fraPrestador, 'No se puede cargar un volante que el prestador no esté habilitado para Facturar.')

  else if not(bTemporario) and (Get_PrestadorAuditable(fraPrestador.IDPrestador) = '') then
    InvalidMsg(fraPrestador, 'Todavía no se indicó si el prestador es auditable.')

  // NWK, relacionado con General_Validar, form_cpa.frm de VB3
  //else if (deFecha.Date >= StrToDate(FechaInicioCAI)) and (edCAI.Text = '') then
  //   InvalidMsg(edCAI, 'Debe cargar el CAI')

  else if (edImpIVA.Value > 0) and (ValorSqlEx(sIVA, [fraPrestador.IDPrestador]) = 'N') then
    InvalidMsg(edImpIVA, 'No se puede cargar el IVA discriminado al prestador seleccionado.')

//por el momento no es obligatorio para nosotros controlar el codigo de barras, sacado por pedido de JGRAZIANO 04/01/2010
//  else if (not pbIsModificacion) and (not pbCodBarrasCargado) and (DBDate >=  StrToDate(FechaInicioCAI)) then  // es alta y no está cargado el código de barras
//    InvalidMsg(btnCargarCodigoBarras, 'Debe cargar el código de barras.')

  else if (pFechaVencimientoCAI <> 0) and (deFecha.Date > pFechaVencimientoCAI) then
    InvalidMsg(deFecha, 'La fecha de la factura debe ser menor o igual a la fecha de vencimiento del CAI (' + DateToStr(pFechaVencimientoCAI) + ').')
  // fin NWK
  else
  begin
  // Ejv. Si el monto del debito es cero no tiene que tener Observaciones.
    if (edVO_MONTODEBITO.Value = 0) then
      edVO_OBSERVACIONDEBITO.Clear;
  // Fin.
      Result := True;
  end;
end;

procedure TfrmRecepcion.edFacturaTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    edFacturaEstableci.SetFocus
  else if (bTemporario and not(Key in [#8, #9, 'A', 'B', 'C', 'M','a', 'b', 'c', 'm'])) or   //para prestadores nuevos se pueden cargar facturas 'C'
          (not(bTemporario) and fraPrestador.IsEmpty) or
          (not(bTemporario) and (fraPrestador.Iva = '1') and not(Key in [#8, #9, 'A', 'B', 'a', 'b'])) or
          (not(bTemporario) and (fraPrestador.Iva = '5') and not(Key in [#8, #9, 'M', 'm'])) or
          (not(bTemporario) and not(AreIn(fraPrestador.Iva, ['1', '5'])) and not(Key in [#8, #9, 'A', 'B', 'M', 'a', 'b', 'm', 'C', 'c']))
  then
    Key := #0;
end;

procedure TfrmRecepcion.edFacturaTipoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((Length(edFacturaTipo.Text) = edFacturaTipo.MaxLength) and (edFacturaTipo.SelLength = 0)) then
    edFacturaEstableci.SetFocus;
end;

procedure TfrmRecepcion.edFacturaEstableciKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 8) and (edFacturaEstableci.Text = '') then
    edFacturaTipo.SetFocus
  else if ((Length(edFacturaEstableci.Text) = edFacturaEstableci.MaxLength) and (edFacturaEstableci.SelLength = 0)) then
    edFacturaNumero.Text;
end;

procedure TfrmRecepcion.DisableFactura(BTipo, BEstableci, BNumero: Boolean; SetDefaultValues: Boolean = False);
begin
  edFacturaTipo.ReadOnly      := BTipo;
  edFacturaEstableci.ReadOnly := BEstableci;
  edFacturaNumero.ReadOnly    := BNumero;
  //--------------------------------------------
  if BTipo then
  begin
    if SetDefaultValues then
      edFacturaTipo.Text  := 'X';

    edFacturaTipo.Color := clBtnFace;
  end
  else
    edFacturaTipo.Color := clWindow;
  //--------------------------------------------
  if BEstableci then
  begin
    if SetDefaultValues then
      edFacturaEstableci.Text  := '0000';

    edFacturaEstableci.Color := clBtnFace;
  end
  else
    edFacturaEstableci.Color := clWindow;
  //--------------------------------------------
  if BNumero then
  begin
    if SetDefaultValues then
      edFacturaNumero.Text  := '99999999';

    edFacturaNumero.Color := clBtnFace;
  end
  else
    edFacturaNumero.Color := clWindow;
end;

procedure TfrmRecepcion.fraPrestadorChange(Sender: TObject);
var
  sTipComp: String;
begin
  try
    if not(edVolante.Visible) then // Si no es una Modificacion del Volante
    begin
      // Limpia los Datos de la Factura de Ajuste
      edAjuste.Text       := '';
      edTotFact.MaxValue  := 0;
      edImpBruto.Text     := '';
      edImpBruto.MaxValue := 0;
      edImpIVA.Text       := '';
      edTotFact.Text      := '';
    end;

    // Segun como facture el Prestador, Habilita o Deshabilita los controles de la Factura
    sTipComp := fraPrestador.TipoComprobante;
    if sTipComp = '' then
      sTipComp := 'FAC';

    if sTipComp = 'CI' then
    begin
      DisableFactura(True, True, True, True);
      lbFactura.Caption := 'Comp.Interno';
      if (not edVolante.Visible) and Visible and Assigned(Sender) then
        SelectNext(edFacturaNumero, True, True);
    end
    else if (sTipComp = 'FAC') or (sTipComp = 'REC') then
    begin
      if (sTipComp = 'FAC') then
        lbFactura.Caption       := 'Factura'
      else
        lbFactura.Caption       := 'Recibo';

      if fraPrestador.Iva = '1' then
      begin // Para los Inscriptos
        DisableFactura(False, False, False);
        if not AreIn(edFacturaTipo.Text, ['A', 'B']) then // Si no es una A o una Blimpia el Tipo
          edFacturaTipo.Text      := '';
      end
      else if fraPrestador.Iva = '5' then
      begin // Para los Inscriptos pero con factua 'M'
        DisableFactura(False, False, False);
        if not AreIn(edFacturaTipo.Text, ['M']) then // Si no es una M limpia el Tipo
          edFacturaTipo.Text      := '';
      end
      else begin
        DisableFactura(True, False, False, True);
        edFacturaTipo.Text := 'C';

        if Visible and Assigned(Sender) and edFacturaEstableci.CanFocus then
          edFacturaEstableci.SetFocus
      end;
    end
    else if sTipComp = 'TIC' then
    begin
      DisableFactura(True, False, False, True);
      edFacturaTipo.Text := 'B';
      lbFactura.Caption  := 'Ticket';
      if Visible and Assigned(Sender) then
        edFacturaEstableci.SetFocus;
    end;
  except
    on E: Exception do
      ErrorMsg(E, 'Error al asignar el tipo de Factura');
  end;
  AvisoFaltaSeguro(fraPrestador.IDPrestador);
  SetCBUInformada;
end;

procedure TfrmRecepcion.deRecepcionExit(Sender: TObject);
begin
  if bTemporario and (deRecepcion.Date > 0) then
    deVencimiento.Date := deRecepcion.Date + 45
  else if not(bTemporario) and (deRecepcion.Date > 0) and (fraPrestador.IDPrestador <> 0) then
  begin
    deVencimiento.Date := ValorSqlDateTime('SELECT amebpba.calcdiascorridos(' + SqlDate(deRecepcion.Date) + ', ca_diasvenci)' +
                                            ' FROM cpr_prestador' +
                                           ' WHERE ca_identificador = ' + SqlValue(fraPrestador.IDPrestador));
   end;
end;

{-----------------------------------------------------------------------------
  Procedure: TfrmRecepcion.Modificar
  Author:    evila
  Date:      15-May-2002
  Arguments: pVolante: Integer
  Result:    Boolean
-----------------------------------------------------------------------------}
function TfrmRecepcion.Modificar(pVolante: Integer): Boolean;
begin
  // Deshabilita Carga de Volantes de PM cuando se modifica desde otro form
  CargaPrestMed         := False;
  pbIsModificacion      := True;
  lbVolante.Visible     := True;
  edVolante.Visible     := True;
  btnFactura.Enabled    := False;
  deRecepcion.Enabled   := False;
  deVencimiento.Enabled := False;
  edAjuste.Enabled      := False;
  edImpBruto.Enabled    := False;
  edImpIVA.Enabled      := False;
  chkSvoTemp.Enabled    := False;
  edVolante.Tag         := pVolante;
  //--------------------------------------------------------------------------//
  sdqDatos.Close;
  sdqDatos.ParamByName('pVolante').AsInteger := pVolante;
  sdqDatos.Open;
  //--------------------------------------------------------------------------//
  fraPrestador.Cargar(sdqDatosVO_PRESTADOR.AsInteger);
  fraPrestadorChange(nil);
  if fraPrestador.TipoComprobante = 'CI' then
  begin
    fraPrestador.Enabled := False;
    fraPrestador.SetBackColors(clSilver);
  end;
  //--------------------------------------------------------------------------//
  edVolante.Text                    := IntToStr(pVolante);
  edFacturaTipo.Text                := sdqDatosVO_FACTURATIPO.Text;
  edFacturaEstableci.Text           := sdqDatosVO_FACTURAESTABLE.Text;
  edFacturaNumero.Text              := sdqDatosVO_FACTURANRO.Text;
  deFecha.Date                      := sdqDatosVO_FECHAFACTURA.AsDateTime;
  edImpBruto.Value                  := sdqDatosVO_MONTOBRUTO.AsFloat;
  edImpIVA.Value                    := sdqDatosVO_MONTOIVA.AsFloat;
  edTotFact.Value                   := sdqDatosVO_MONTO.AsFloat;
  deVencimiento.Date                := sdqDatosVO_VENCIMIENTO.AsDateTime;
  deRecepcion.Date                  := sdqDatosVO_FECHARECEPCION.AsDateTime;
  deRecepcion.MinDateCombo          := nil;
  edAjuste.Text                     := sdqDatosVO_AJUSTE.Text;
  edVO_MONTOPERCEPCION.Value        := sdqDatosVO_MONTOPERCEPCION.AsFloat;
  edVO_MONTODEBITO.Value            := sdqDatosVO_MONTODEBITO.AsFloat;
  chkRefacturacion.Checked          := IIF(sdqDatosVO_REFACTURACION.AsString = 'S', True, False);
  chkMixto.Checked                  := IIF(sdqDatosVO_MIXTO.AsString = 'S', True, False);
  edVO_OBSERVACIONDEBITO.Lines.Text := sdqDatosVO_OBSERVACIONDEBITO.AsString;
  gbCBU.Enabled                     := not(sdqDatosVO_CBUINFORMADA.IsNull);
  rbSiCBU.Checked                   := (sdqDatosVO_CBUINFORMADA.AsString = 'S');
  rbNoCBU.Checked                   := (sdqDatosVO_CBUINFORMADA.AsString = 'N');

  DoHabilitarMixto(chkMixto.Checked, pVolante);

  if (edAjuste.Text <> '') then
    DisableFactura(True, True, True)
  else
    DisableFactura(False, False, False);

  cmbDelegaciones.FieldValue := sdqDatosVO_DELEGACION.AsString;
  edChequeNombre.Text        := sdqDatosVO_CHEQUENOMBRE.AsString;
  edObservaciones.Lines.Text := sdqDatosVO_OBSERVACIONES.AsString;
  edCAI.Text                 := sdqDatosVO_CAI.AsString;

  Caption := 'Modificar Volante - [ Nro: ' + edVolante.Text + ' Estado: ' + sdqDatosESTADO.Text + '] ';

  Result := (ShowModal = mrOK);
end;

function TfrmRecepcion.GuardarCambios: Boolean;
var
  rTotalFactura: Currency;
  sEstado, sEstadoPend: String;
  Sql: String;
begin
  Result      := False;
  sEstadoPend := '';
  Sql :=
    'SELECT 1' +
     ' FROM svo_volantes' +
    ' WHERE vo_facturatipo = ' + SqlValue(edFacturaTipo.Text) +
      ' AND vo_facturaestable = ' + SqlValue(edFacturaEstableci.Text) +
      ' AND vo_facturanro = ' + SqlValue(edFacturaNumero.Text) +
      ' AND vo_prestador = ' + SqlValue(fraPrestador.IDPrestador);

// Ejv. 15/05/2002
  rTotalFactura := (edTotFact.Value - edVO_MONTOPERCEPCION.Value - edVO_MONTODEBITO.Value);

  if CompareFloat(sdqDatosVO_FACPEN.AsCurrency, rTotalFactura) = 1 then
    MsgBox('El Importe del Volante es menor al importe Facturado.', MB_ICONERROR, 'Error de Validación')
  else
  begin

    if (CompareFloat(rTotalFactura, sdqDatosVO_FACPEN.AsCurrency) = 0) and ValidarDebito then  // TK 33642 (el ValidarDebito)       // Intercambio el orden de este if-else por ticket 62418
      sEstado := SetEstadoNuevo

    else if Is_EspecialidadPrestadorOrtopedia(fraPrestador.Value) and sdqDatosVO_FECHAORTOPEDIA.IsNull then
    begin
      sEstadoPend := 'PO';    // TK 21282
      sEstado     := 'P';
    end

    else if (Get_PrestadorAuditable(fraPrestador.IDPrestador) = 'S') and sdqDatosVO_FECHAAUDITORIA.IsNull then
      sEstado := 'PA'
    else
      sEstado := 'P';

    if CargaPrestMed and not(bTemporario) then
    begin
      case Get_AMPPrestador(fraPrestador.Value) of
        0: if Is_EspecialidadPrestadorAMP(fraPrestador.Value) and
              (MsgBox('El prestador no tiene valores AMP definidos, por lo que no ' + #13 +
                      'podrá ser liquidado en tanto dichos valores no sean cargados.' + #13 +
                      'Desea registrar el Volante para AMP?', MB_YESNO + MB_ICONQUESTION) = mrYes) then
             sEstado := 'PM';

        1: if Get_CantidadEspecialidadesPrestador(fraPrestador.Value) = 1 then
             sEstado := 'PM'
           else
             if MsgBox('El prestador tiene más de una especialidad. ¿Desea registrar el Volante para Medicina Laboral?', MB_YESNO + MB_ICONQUESTION) = mrYes then
               sEstado := 'PM';

        2,
        3: if MsgBox('El prestador tiene Convenio/Presupuesto para Prest. Médicas. ¿Desea registrar el Volante para Medicina Laboral?', MB_YESNO + MB_ICONQUESTION) = mrYes then
                sEstado := 'PM';
      end
    end;

// Fin.
    Sql :=
      'UPDATE SVO_VOLANTES' +
        ' SET VO_PRESTADOR = ' + SqlValue(fraPrestador.IDPrestador) + ',' +
            ' VO_FACTURATIPO = ''' + edFacturaTipo.Text + ''',' +
            ' VO_FACTURAESTABLE = ''' + edFacturaEstableci.Text + ''',' +
            ' VO_FACTURANRO = ''' + edFacturaNumero.Text + ''',' +
            ' VO_FECHAFACTURA = ' + deFecha.SqlText + ',' +
            ' VO_DELEGACION = ''' + cmbDelegaciones.FieldValue + ''',' +
            ' VO_ESTADO = ''' + sEstado + ''',' +
            ' VO_ESTADOPEND = ''' + sEstadoPend + ''', ' +    // TK 21282
            ' VO_MONTO = ' + SqlNumber(edTotFact.Value) + ',' +
            ' VO_MONTOBRUTO = ' + SqlNumber(edImpBruto.Value) + ',' +
            ' VO_MONTOIVA = ' + SqlNumber(edImpIVA.Value) + ',' +
            ' VO_MONTOPERCEPCION = ' + SqlNumber(edVO_MONTOPERCEPCION.Value) + ',' +
            ' VO_MONTODEBITO = ' + SqlNumber(edVO_MONTODEBITO.Value) + ',' +
            ' VO_OBSERVACIONDEBITO = ' + SqlString(edVO_OBSERVACIONDEBITO.Lines.Text, True) + ',' +
            ' VO_CHEQUENOMBRE = ' + SqlString(edChequeNombre.Text, True) + ',' +
            ' VO_REFACTURACION = ' + SqlString(Iif(chkRefacturacion.Checked, 'S', 'N'), True) + ',' +
            ' VO_MIXTO = ' + SqlString(Iif(chkMixto.Checked, 'S', 'N'), True) + ',' +
            ' VO_OBSERVACIONES = ' + SqlString(edObservaciones.Lines.Text, True) + ',' +
            ' VO_CAI = ' + SqlString(edCAI.Text, True) + ',' +
            ' VO_CBUINFORMADA = ' + SqlString(IIF(gbCBU.Enabled, IIF(rbSiCBU.Checked, 'S', 'N'), ''), True, True) + ',' +
            ' VO_FECHAULTPRESTA = ' + sqldate(dcUltPrestacion.Date) + ',' +
            ' VO_USUMODIF = ''' + Sesion.LoginName + ''',' +
            ' VO_FECHAMODIF = ActualDate' +
      ' WHERE VO_VOLANTE = ' + edVolante.Text;
    try
      EjecutarSql(Sql);
      ModalResult := mrOK;
      Result := True;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Guardar los Cambios.');
    end;
  end;
end;

function TfrmRecepcion.GuardarNuevo: Boolean;
const
  msgError = 'No se ha podido guardar los cambios a causa del siguiente error:' + #13;
var
  flgGraba: Boolean;
  sCampo, sEstado, sEstadoPend, Sql, SqlFacNro, sValor: String;
begin
  sEstadoPend := '';
  try
    if not(bTemporario) then
      EjecutarAlarma(fraPrestador.IDPrestador);
  except
    //
  end;

  Result   := False;
  flgGraba := False;

  // Se hace un Repeat-Until hasta que el MAX(vo_volante)+1 devuelva un numero de volante
  // que se pueda grabar controlando el error de PK.
  repeat
    if bTemporario then
      edVolante.Tag := GetSecNextVal('SEQ_SVO_ID')
    else
      edVolante.Tag := 1 + ValorSqlInteger('SELECT MAX(vo_volante) FROM svo_volantes');

    MostrarEstado('Creando Volante Nro. ' + IntToStr(edVolante.Tag));

    // Calcula el Número de Comprobante Interno o Nro de Fact de Ajuste
    if (edAjuste.Text <> '') then
    begin
      edFacturaTipo.Text      := 'X';
      edFacturaEstableci.Text := '0001';
      SqlFacNro := 'LPAD(ART.seq_svo_facturaajuste.NEXTVAL, 8, ''0'') ';
    end else if (fraPrestador.TipoComprobante = 'CI')  then
      SqlFacNro := 'LPAD(ART.SEQ_SVO_COMPROBANTEINTERNO.NEXTVAL, 8, ''0'') '
    else
      SqlFacNro := '''' + edFacturaNumero.Text + '''';

    if not(bTemporario) and Is_EspecialidadPrestadorOrtopedia(fraPrestador.Value) then
    begin
      sEstado     := 'P';
      sEstadoPend := 'PO';    // TK 21282
    end
    else if not(bTemporario) and (Get_PrestadorAuditable(fraPrestador.IDPrestador) = 'S') then
      sEstado := 'PA'
    else if (CompareFloat(edTotFact.Value, (edVO_MONTOPERCEPCION.Value + edVO_MONTODEBITO.Value)) = 0) and ValidarDebito then
      sEstado := 'L'
    else
      sEstado := 'P';

    if CargaPrestMed and not(bTemporario) then
    begin
      // Analiza si tiene especialidad de Exámenes Periódicos para definir el estado como PM
      if Is_EspecialidadPrestadorAMP(fraPrestador.Value) then
        // Analiza qué tipo de Valores AMP tiene:
        //   0: Ninguno - 1: Por Convenio - 2: Por Presupuesto - 3: Por Convenio y Presupuesto
        case Get_AMPPrestador(fraPrestador.Value) of
             // A pesar de no tener valores definidos, aún puede registrarse como AMP
          0: if MsgBox('El prestador no tiene valores AMP definidos, por lo que el volante no ' + #13 +
                       'podrá ser liquidado en tanto dichos valores no sean cargados.' + #13 +
                       'Desea registrar el Volante para Medicina Laboral?', MB_YESNO + MB_ICONQUESTION) = mrYes then
               sEstado := 'PM';

             // Analiza la cantidad de especialidades
        else if Get_CantidadEspecialidadesPrestador(fraPrestador.Value) = 1 then
               // AMP es la única especialidad, por tanto sera PM
               sEstado := 'PM'
             else
               // Tiene más de una especialidad, confirma si debe registrarse como AMP
               if MsgBox('El prestador tiene más de una especialidad. ' + #13 +
                         'Desea registrar el Volante para Medicina Laboral?', MB_YESNO + MB_ICONQUESTION) = mrYes then
                 sEstado := 'PM';
        end
    end;

    if bTemporario then
    begin
      sCampo := 'vo_cuitprestador, vo_descrprestador, ';
      sValor := SqlValue(edPrestCUIT.Text) + ',' + SqlValue(Trim(edPresRazonSocial.Text));
    end
    else begin
      sCampo := 'vo_prestador, ';
      sValor := IntToStr(fraPrestador.IDPrestador);
    end;

    Sql := ' INSERT INTO ' + sTabHead + 'svo_volantes ' +
           '(vo_volante, ' + sCampo + ' vo_facturatipo, vo_facturaestable, vo_facturanro, vo_fechafactura, ' +
           ' vo_monto, vo_vencimiento, vo_observaciones, vo_usualta, vo_fechalta, vo_estado, vo_estadopend, ' +    // TK 21282
           ' vo_delegacion, vo_fecharecepcion, vo_delegacionalta, vo_chequenombre, vo_ajuste, ' +
           ' vo_montopercepcion, vo_montodebito, vo_observaciondebito, vo_refacturacion, vo_cai, ' +
           ' vo_montobruto, vo_montoiva, vo_mixto, vo_cbuinformada, vo_fechaultpresta) '+
           ' VALUES (' + IntToStr(edVolante.Tag) + ',' + sValor + ',' +
           SqlValue(edFacturaTipo.Text) + ',' + SqlValue(edFacturaEstableci.Text) + ',' +
           SqlFacNro + ',' + deFecha.SqlText + ',' + SqlNumber(edTotFact.Value)  + ',' +
           deVencimiento.SqlText + ',' + SqlString(edObservaciones.Text, True) + ',' +
           SqlValue(Sesion.LoginName) + ', ActualDate, ' + SqlValue(sEstado) + ','  + SqlValue(sEstadoPend) + ','  +  // TK 21282
           SqlValue(cmbDelegaciones.FieldValue) + ',' + deRecepcion.SqlText + ',' +
           SqlValue(Sesion.Delegacion) + ',' + SqlString(edChequeNombre.Text, True) + ',' +
           edAjuste.TextSql + ',' + SqlNumber(edVO_MONTOPERCEPCION.Value) + ',' +
           SqlNumber(edVO_MONTODEBITO.Value) + ',' +
           SqlString(edVO_OBSERVACIONDEBITO.Lines.Text, True) + ',' +
           SqlString(Iif(chkRefacturacion.Checked, 'S', 'N'), True) + ',' +
           SqlString(edCAI.Text, True) + ',' +
           SqlNumber(edImpBruto.Value) + ',' + SqlNumber(edImpIVA.Value) + ',' +
           SqlString(Iif(chkMixto.Checked, 'S', 'N'), True) + ',' +
           SqlString(IIF(gbCBU.Enabled, IIF(rbSiCBU.Checked, 'S', 'N'), ''), True, True) + ',' +
           sqldate(dcUltPrestacion.Date) + ') ';
    try
      BeginTrans;
      EjecutarSqlST(sql);
      if not DoGrabarLoteAMP(sEstado) then Exit;  //todavia no se implementa
      DoChequearFechaRevision;
      DoLogSeguroMP;
      CommitTrans;
      Result    := True;
      flgGraba  := True;
      CalcVolNro;
      MsgBox('El volante se ha guardado con el número ' + IntToStr(edVolante.Tag) + #13 +
             '(' + lbFactura.Caption + ' Nro: ' + edFacturaTipo.Text  + '-' + edFacturaEstableci.Text + '-' +
             ValorSql('SELECT VO_FACTURANRO FROM ' + sTabHead + 'SVO_VOLANTES WHERE VO_VOLANTE = ' + IntToStr(edVolante.Tag)) + ')', MB_ICONINFORMATION);
    except
      on E: Exception do
      begin
        Rollback(True);
        if Pos('ORA-00001', E.Message) = 0 then
        begin
           flgGraba := MsgBox(msgError + E.Message, MB_ICONEXCLAMATION + MB_RETRYCANCEL) = IDCANCEL;
           Result   := False;
        end else
        begin
           MsgBox(msgError + E.Message, MB_ICONEXCLAMATION);
           Result   := False;
           flgGraba := True;
        end;
      end;
    end;
    MostrarEstado('Listo');
  until flgGraba;
end;

procedure TfrmRecepcion.CalcVolNro;
begin
  edVolante.Text := IntToStr(StrToInt('0' + ValorSql('SELECT MAX(VO_VOLANTE) FROM ' + sTabHead + 'SVO_VOLANTES ')) + 1);
end;

procedure TfrmRecepcion.edAjusteExit(Sender: TObject);
var
  cAFacturar : Currency;
  sdqConsulta: TSDQuery;
  Sql        : String;

  procedure ClearSelection; // Limpia el Nro de la Factura si Anteriormente había un ajuste seleccionado
  begin
    if edTotFact.MaxValue <> 0 then
      RestartFactura
    else
      fraPrestadorChange(nil);
  end;
begin
  // Calcula el monto restante para las Facturas de Ajuste
  if (edAjuste.Text = '')  then
      ClearSelection
  else
  begin
    Sql :=
      'SELECT 1, SUM(ABS(IV_IMPFACTURADO)) TOTAL, MAX(CA_CLAVE) PREST_CUIT, MAX(VO_FACTURATIPO) FACTIPO, ' +
            ' MAX(VO_FACTURAESTABLE) FACEST, MAX(VO_FACTURANRO) FACNRO, MAX(VO_MONTOIVA) MONTOIVA ' +
       ' FROM SVO_VOLANTES, CPR_PRESTADOR, SIV_ITEMVOLANTE' +
      ' WHERE VO_VOLANTE = IV_VOLANTE' +
        ' AND IV_ESTADO NOT IN (''X'', ''Z'')' +
        ' AND IV_IMPFACTURADO < 0' +
        ' AND CA_IDENTIFICADOR = VO_PRESTADOR' +
        ' AND VO_ESTADO IN (''E'', ''EAM'')' +
        ' AND VO_VOLANTE = ' + edAjuste.TextSql +
              IIF(lbVolante.Visible, ' AND VO_VOLANTE <> ' + edVolante.TextSql, '') +
     ' HAVING COUNT(*) > 0' +
      ' UNION ' +
     ' SELECT 2, SUM(ABS(VG_IMPFACTURADO)), MAX(CA_CLAVE), MAX(VO_FACTURATIPO), MAX(VO_FACTURAESTABLE),' +
            ' MAX(VO_FACTURANRO), MAX(VO_MONTOIVA) MONTOIVA ' +
       ' FROM SVO_VOLANTES, CPR_PRESTADOR, SVG_VOL_GENERICO' +
      ' WHERE VG_VOLANTE = VO_VOLANTE' +
        ' AND VG_ESTADO <> ''X''' +
        ' AND VG_IMPFACTURADO < 0' +
        ' AND CA_IDENTIFICADOR = VO_PRESTADOR' +
        ' AND VO_ESTADO IN (''EG'', ''EAM'')' +
        ' AND VO_VOLANTE = ' + edAjuste.TextSql +
              IIF(lbVolante.Visible, ' AND VO_VOLANTE <> ' + edVolante.TextSql, '') +
     ' HAVING COUNT(*) > 0' +
      ' UNION ' +
     ' SELECT 3, SUM(ABS(VO_MONTODEBITO)), MAX(CA_CLAVE),  MAX(VO_FACTURATIPO), MAX(VO_FACTURAESTABLE),' +
            ' MAX(VO_FACTURANRO), MAX(VO_MONTOIVA) MONTOIVA ' +
       ' FROM SVO_VOLANTES, CPR_PRESTADOR' +
      ' WHERE VO_MONTODEBITO  > 0' +
        ' AND CA_IDENTIFICADOR = VO_PRESTADOR' +
        ' AND VO_ESTADO IN (''E'', ''EG'', ''EAM'')' +
        ' AND VO_VOLANTE = ' + edAjuste.TextSql +
              IIF(lbVolante.Visible, ' AND VO_VOLANTE <> ' + edVolante.TextSql, '') +
     ' HAVING COUNT(*) > 0' +
   ' ORDER BY 1';

    sdqConsulta := GetQuery(Sql);
    try
      cAFacturar := 0; //By Fede

      // Ejv. 12/07/2002 Para sumar las dos posibles filas.
      while not sdqConsulta.Eof do
      begin
        cAFacturar := cAFacturar + sdqConsulta.FieldByName('TOTAL').AsCurrency;
        sdqConsulta.Next;
      end;

      if cAFacturar >= 0 then // Por si hay Multiples Ajustes
        // EJV. 19/06/2002
//                 cAFacturar := cAFacturar + StrToFloat('0' + ValorSql('SELECT VO_MONTODEBITO FROM SVO_VOLANTES WHERE VO_ESTADO <> ''C'' AND VO_VOLANTE = ' + edAjuste.TextSql));

        cAFacturar := cAFacturar - StrToFloat('0' + ValorSql('SELECT SUM(VO_MONTO) FROM SVO_VOLANTES WHERE VO_ESTADO <> ''C'' AND VO_AJUSTE = ' + edAjuste.TextSql));

      //------------------------------------------------------------------------------------------------------//
      if sdqConsulta.IsEmpty and (cAFacturar <= 0) then
      begin
        MsgBox('El Volante de Ajuste seleccionado no existe o no permite ser Ajustado.', MB_ICONEXCLAMATION);
        ClearSelection;
        edAjuste.SetFocus;
      end
      else if (not(bTemporario) and (sdqConsulta.FieldByName('PREST_CUIT').AsString  <> fraPrestador.Cuit)) or
              (bTemporario  and (sdqConsulta.FieldByName('PREST_CUIT').AsString  <> edPrestCUIT.Text)) then
      begin
        MsgBox('El Volante de Ajuste seleccionado pertenece a otro prestador.', MB_ICONEXCLAMATION);
        ClearSelection;
        edAjuste.SetFocus;
      end
      else
      begin
        edFacturaTipo.Text      := sdqConsulta.FieldByName('FACTIPO').AsString;
        edFacturaEstableci.Text := sdqConsulta.FieldByName('FACEST').AsString;
        edFacturaNumero.Text    := sdqConsulta.FieldByName('FACNRO').AsString;
        DisableFactura(True, True, True);

        edTotFact.MaxValue := cAFacturar;
        if (edTotFact.Text = '') then
        begin
          edImpIVA.Value      := sdqConsulta.FieldByName('MONTOIVA').AsFloat;
          edImpBruto.Value    := cAFacturar - edImpIVA.Value;
          edTotFact.Value     := cAFacturar;
        end;
      end;
    finally
      sdqConsulta.Free;
    end;
  end;
end;

procedure TfrmRecepcion.edFacturaNumeroExit(Sender: TObject);
begin
  if (edFacturaNumero.Text <> '') then
    edFacturaNumero.Text := Lpad(edFacturaNumero.Text, '0', 8);
end;

procedure TfrmRecepcion.pnlFacturaExit(Sender: TObject);
var
  cAFacturar : Currency;
  sdqConsulta: TSDQuery;
  sSql       : String;
begin
  // Se fija que Todos los Controles de la Factura esten activados.
  if not chkSvoTemp.Checked then
    if not (edFacturaTipo.ReadOnly and edFacturaEstableci.ReadOnly and edFacturaNumero.ReadOnly) then
    begin
      sSql :=
        'SELECT vo_estado, vo_notadebito, vo_volante, vo_montoiva ' +
         ' FROM ' + sTabHead + 'svo_volantes, cpr_prestador' +
        ' WHERE vo_facturatipo = ' + SqlValue(edFacturaTipo.Text) +
          ' AND vo_facturaestable = ' + SqlValue(edFacturaEstableci.Text) +
          ' AND vo_facturanro = ' + SqlValue(edFacturaNumero.Text) +
          ' AND vo_estado <> ''C''';

      if bTemporario then
        sSql := sSql +
          ' AND vo_volante <> ' + SqlInt(edAjuste.Value) +
          ' AND ca_clave = vo_cuitprestador' +
          ' AND ca_clave = ' + SqlValue(edPrestCUIT.Text)
      else
        sSql := sSql +
          ' AND((ca_cuitpublico IS NOT NULL' +
          ' AND vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) + ')' +
           ' OR (vo_prestador = ca_identificador' +
          ' AND ca_cuitpublico IS NULL' +
          ' AND ca_clave = ' + SqlValue(fraPrestador.Cuit) +
          ' AND vo_volante <> ' + SqlInt(edAjuste.Value) + '))';

      if edVolante.Visible then // Si es una Modificacion del Volante
        sSql := sSql + ' AND vo_volante <> ' + edVolante.TextSql;

      sdqConsulta := GetQuery(sSql);
      try
        if (not sdqConsulta.IsEmpty) then
        begin
          if sdqConsulta.FieldByName('VO_NOTADEBITO').IsNull or (not AreIn(sdqConsulta.FieldByName('VO_ESTADO').AsString, ['E', 'EG'])) then
            MsgBox('La factura seleccionada ya ha sido cargada para el mismo prestador.', MB_ICONEXCLAMATION)
          else
          begin
            if sdqConsulta.FieldByName('VO_ESTADO').AsString = 'E' then
              sSql :=
                'SELECT SUM(ABS(IV_IMPFACTURADO))' +
                 ' FROM SIV_ITEMVOLANTE' +
                ' WHERE IV_ESTADO <> ''X''' +
                  ' AND IV_IMPFACTURADO < 0' +
                  ' AND IV_VOLANTE = ' + sdqConsulta.FieldByName('VO_VOLANTE').AsString
            else
              sSql :=
                'SELECT SUM(ABS(VG_IMPFACTURADO))' +
                 ' FROM SVG_VOL_GENERICO' +
                ' WHERE VG_ESTADO <> ''X''' +
                  ' AND VG_IMPFACTURADO < 0' +
                  ' AND VG_VOLANTE = ' + sdqConsulta.FieldByName('VO_VOLANTE').AsString;

            cAFacturar := StrToFloat('0' + ValorSql(sSql));
            if cAFacturar > 0 then // Por si hay Multiples Ajustes
              cAFacturar := cAFacturar - StrToFloat('0' + ValorSql('SELECT SUM(VO_MONTO) FROM SVO_VOLANTES WHERE VO_ESTADO <> ''C'' AND VO_AJUSTE = ' + sdqConsulta.FieldByName('VO_VOLANTE').AsString));

            if (cAFacturar = 0) then
            begin
              MsgBox('La factura seleccionada ya ha sido cargada para el mismo prestador y ha sido liquidada en su totalidad.', MB_ICONEXCLAMATION);
              RestartFactura(True);
            end
            else if (edAjuste.Enabled = False) then
            begin
              MsgBox('La factura seleccionada ya ha sido cargada para el mismo prestador.', MB_ICONEXCLAMATION);
              RestartFactura(True);
            end
            else
              if MsgBox('La factura seleccionada ya ha sido cargada para el mismo prestador.' + #13 +
                        '¿ Desea crear una "Devolución de Ajuste" ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
              begin
                edAjuste.Text       := sdqConsulta.FieldByName('VO_VOLANTE').AsString;
                edTotFact.MaxValue  := cAFacturar;
                if (edTotFact.Text = '') then
                begin
                  edImpIVA.Value    := sdqConsulta.FieldByName('VO_MONTOIVA').AsFloat;
                  edImpBruto.Value  := cAFacturar - edImpIVA.Value;
                  edTotFact.Value   := cAFacturar;
                end;

                DisableFactura(True, True, True);
                if edAjuste.Focused then
                  deFecha.SetFocus;
              end
              else
                RestartFactura(True);
          end;
        end;
      finally
        sdqConsulta.Free;
      end;
    end;
end;

procedure TfrmRecepcion.RestartFactura(ASetFocus: Boolean = False);
begin
  edFacturaTipo.Text      := '';
  edFacturaEstableci.Text := '';
  edFacturaNumero.Text    := '';
  fraPrestadorChange(nil);
  if ASetFocus then
  begin
    if not edFacturaTipo.ReadOnly then
      edFacturaTipo.SetFocus

    else if not edFacturaEstableci.ReadOnly then
      edFacturaEstableci.SetFocus

    else if not edFacturaNumero.ReadOnly then
      edFacturaNumero.SetFocus;
  end;
end;

procedure TfrmRecepcion.SeguridadAfterExecute(Sender: TObject);
begin
  if not edAjuste.Enabled then
    edAjuste.Color := clBtnFace;
  chkSvoTemp.Checked := False;
  chkSvoTempClick(nil);
end;

procedure TfrmRecepcion.chkSvoTempClick(Sender: TObject);
begin
  bTemporario           := chkSvoTemp.Checked;
  fraPrestador.Enabled  := not chkSvoTemp.Checked;
  DisableFactura(False, False, False);
  Limpiar([qlPrestador, qlFactura1, qlFactura2]);

  if chkSvoTemp.Checked then
  begin
    sTabHead := 'TMP_';
    gbPrestadorTMP.BringToFront;
  end
  else
  begin
    sTabHead := '';
    gbPrestadorTMP.SendToBack;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TfrmRecepcion.GetSoloModifDebito
  Author:    evila
  Date:      16-May-2002
  Arguments: None
  Result:    Boolean
  Controla que si se modifico algun dato que no sea un debito si pueda
  RE-imprimir
-----------------------------------------------------------------------------}
function TfrmRecepcion.GetSoloModifDebito: Boolean;
begin
  Result := True;
  if (fraPrestador.Value         <> sdqDatosVO_PRESTADOR.AsInteger) or
     (edFacturaTipo.Text         <> sdqDatosVO_FACTURATIPO.Text) or
     (edFacturaEstableci.Text    <> sdqDatosVO_FACTURAESTABLE.Text) or
     (edFacturaNumero.Text       <> sdqDatosVO_FACTURANRO.Text) or
     (deFecha.Date               <> sdqDatosVO_FECHAFACTURA.AsDateTime) or
     (edTotFact.Value            <> sdqDatosVO_MONTO.AsCurrency) or
     (deVencimiento.Date         <> sdqDatosVO_VENCIMIENTO.AsDateTime) or
     (deRecepcion.Date           <> sdqDatosVO_FECHARECEPCION.AsDateTime) or
     (edAjuste.Text              <> sdqDatosVO_AJUSTE.Text) or
     (edVO_MONTOPERCEPCION.Value <> sdqDatosVO_MONTOPERCEPCION.AsCurrency) or
     (cmbDelegaciones.FieldValue <> sdqDatosVO_DELEGACION.AsString) or
     (edChequeNombre.Text        <> sdqDatosVO_CHEQUENOMBRE.AsString) or
     (chkRefacturacion.Checked   <> Iif(sdqDatosVO_REFACTURACION.AsString = 'S', True, False)) or
     (edObservaciones.Lines.Text <> sdqDatosVO_OBSERVACIONES.AsString) or
     (edCAI.Text                 <> sdqDatosVO_CAI.AsString) then
  begin
    Result := False;
  end;
end;

procedure TfrmRecepcion.edVO_MONTODEBITOChange(Sender: TObject);
begin
  if edVO_MONTODEBITO.Value > 0 then
  begin
    edVO_OBSERVACIONDEBITO.Enabled := True;
    edVO_OBSERVACIONDEBITO.Color   := clWindow;
  end
  else
  begin
    edVO_OBSERVACIONDEBITO.Enabled := False;
    edVO_OBSERVACIONDEBITO.Color   := clInactiveCaption;
  end;
end;

procedure TfrmRecepcion.btnCargarCodigoBarrasClick(Sender: TObject);
var
  iDigitoVerificador: Byte;
  sCAI: String;
  sCodBarrasComprobante: String;
  sCodTipoComprobante: String;
  sCUIT: String;
  sPuntoVenta: String;
begin
  if deFecha.IsEmpty then
    InvalidMsg(deFecha, 'Debe cargar previamente la fecha de la factura.')
  else
  begin
    sCodBarrasComprobante := Get_CodigoBarras;
    if sCodBarrasComprobante <> '' then
    begin
      pbCodBarrasCargado := True;
      Get_DatosComprobantesAFIP(sCodBarrasComprobante, sCUIT, sCodTipoComprobante, sPuntoVenta, sCAI, pFechaVencimientoCAI, iDigitoVerificador);

      edFacturaEstableci.Text := sPuntoVenta;
      edCAI.Text              := sCAI;

      if bTemporario then
      begin
        edPresRazonSocial.Clear;
        edPrestCUIT.Text := sCUIT;
      end
      else
      begin
        fraPrestador.Clear;
        fraPrestador.Cuit := sCUIT;
      end;
    end;
  end;
end;

procedure TfrmRecepcion.btnCargarSeguroClick(Sender: TObject);
begin
  DoCargarSeguro;
end;

procedure EjecutarAlarma(Prestador: Integer);
var
  bEnviar: Boolean;
  qrAvisoFaltaSeguro: TqrAvisoFaltaSeguro;
  sDirecciones: String;
  sNombreArchivo: String;
  sSQL: String;
  sTexto: String;
begin
  sSQL :=
    'SELECT 1' +
     ' FROM SVO_VOLANTES' +
    ' WHERE VO_PRESTADOR = :IDPRESTADOR' +
      ' AND TRUNC(VO_FECHALTA) = ART.ACTUALDATE';

  if not ExisteSQLEx(sSQL, [Prestador]) then
  begin
    sSQL :=
      'SELECT CA_DESCRIPCION, CA_NOMBREFANTA, UTILES.ARMAR_CUIT(CA_CLAVE) CUIT,' +
            ' UTILES.ARMAR_DOMICILIO(CA_CALLE, CA_NUMERO, CA_DEPARTAMENTO, CA_LOCALIDAD) DOMICILIO,' +
            ' SINIESTRO.GET_SEGUROPROXIMOVENCIMIENTO(CA_IDENTIFICADOR) VENCIMIENTO,' +
            ' SINIESTRO.GET_ESTADOSEGUROMALAPRAXIS(CA_IDENTIFICADOR) as Mensaje, SM_VIGENCIAHASTA, SM_NUMEROPOLIZA' +
       ' FROM MSM_SEGUROMALAPRAXIS, CCP_CODIGOPOSTAL, CPR_PRESTADOR' +
      ' WHERE CA_IDENTIFICADOR = :IDPRESTADOR' +
        ' AND CA_FECHABAJA IS NULL' +
        ' AND ((CA_CONTRATO = :TieneContrato) OR (CA_CONTRATOMUTUAL = :TieneContratoMutual))' +
        ' AND CA_TIPO = :Tipo' +
        ' AND CA_PROVINCIA = CP_PROVINCIA' +
        ' AND ((CA_PROVINCIA = :Prov1) OR ((CA_PROVINCIA = :Prov2) AND (CP_GBA IS NOT NULL)))' +
        ' AND SINIESTRO.Get_EstadoSeguroMalaPraxis (CA_IDENTIFICADOR) in (''2'', ''3'')' +
        ' AND SINIESTRO.Get_SeguroMalaPraxisActivo(CA_IDENTIFICADOR) = SM_ID (+)';

    with GetQueryEx(sSQL, [Prestador, 'S', 'S', 'P', '1', '50']) do
    try
      if not IsEmpty then
      begin
        bEnviar := True;

        case FieldByName('Mensaje').AsInteger of
          2: sTexto := ' tiene su seguro de mala práxis número ' + FieldByName('SM_NUMEROPOLIZA').AsString + ' vencido desde el día ' + FormatDateTime('dddd d "de" mmmm "de" yyyy.', FieldByName('SM_VIGENCIAHASTA').AsDateTime);
          3: sTexto := ' no tiene cargado el seguro de mala práxis en nuestro sistema.';
          //CAMARILLO; sacado x pedido de VLOPEZ (wf 2473)
          //4: sTexto := ' adeuda cuotas de su plan de pagos de su seguro de mala praxis número ' + FieldByName('SM_NUMEROPOLIZA').AsString + ' cuya fecha de último vencimiento es del día ' + FormatDateTime('dddd d "de" mmmm "de" yyyy.', FieldByName('VENCIMIENTO').AsDateTime);
          else bEnviar := False;
        end;

        if bEnviar then
        begin
          sDirecciones := ValorSQLEx('SELECT tb_especial1 FROM ctb_tablas WHERE tb_clave = :CLAVE AND tb_codigo = :CODIGO', ['DIREL', '03']);

          sNombreArchivo := IncludeTrailingBackslash(TempPath) + 'Aviso_' + IntToStr(Prestador) + '.PDF';

          qrAvisoFaltaSeguro := TqrAvisoFaltaSeguro.Create(Application.MainForm);
          try
            if qrAvisoFaltaSeguro.Preparar(Prestador) then
            begin
              ExportarPDF(qrAvisoFaltaSeguro, sNombreArchivo);
              EnviarMailDB(sDirecciones,
                           'Prestador ' + IntToStr(Prestador) + ' con falta de cobertura de seguro de mala praxis.',
                           [oDeleteAttach],
                           Format('El sistema ha detectado que el prestador %s ' + sTexto, [FieldByName('CA_DESCRIPCION').AsString, Sesion.Usuario ]) + CRLF + CRLF + 'Provincia ART',
                           GetAttachments(sNombreArchivo, qrAvisoFaltaSeguro.IDReport));
            end;
          finally
            qrAvisoFaltaSeguro.Free;
          end;
        end;
      end;

    finally
      Free;
    end;
  end;
end;

procedure TfrmRecepcion.edPrestCUITExit(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM cpr_prestador' +
    ' WHERE ca_clave = ' + SqlValue(edPrestCUIT.Text) +
      ' AND ca_fechabaja IS NULL';

  if (IsCuit(edPrestCUIT.Text) and ExisteSql(sSql) and MsgAsk('Ya existe/n prestador/es con el mismo CUIT, ¿ Desea seleccionarlo ?')) then
    ShowPrestadores;
end;

{CAMARILLO - 17/08/2007 - seleccion de prestador de la cpr}
procedure TfrmRecepcion.ShowPrestadores;
var

  sSql: String;
begin
  sSql := 'SELECT ca_identificador, utiles.armar_cuit(ca_clave) cuit, ca_secuencia, ca_nombrefanta' +
           ' FROM cpr_prestador' +
          ' WHERE ca_clave = :CUIT ' +
            ' AND ca_fechabaja IS NULL';
  with GetQueryEx(sSql, [edPrestCUIT.Text]) do

  try
    lvPrestadores.Items.BeginUpdate;
    lvPrestadores.Items.Clear;
    while not Eof do
    begin
      with lvPrestadores.Items.Add do
      begin
        Caption := FieldByName('CA_IDENTIFICADOR').AsString;
        SubItems.Add(FieldByName('CUIT').AsString);
        SubItems.Add(FieldByName('CA_SECUENCIA').AsString);
        SubItems.Add(FieldByName('CA_NOMBREFANTA').AsString);
      end;
      Next;
    end;
    lvPrestadores.Items.EndUpdate;
  finally
    Free;
  end;
  fpPrestador.ShowModal;
end;

procedure TfrmRecepcion.btnAceptarPresClick(Sender: TObject);
var
  iPrestador: Integer;
begin
  iPrestador := CantSel;
  Verificar(iPrestador = 0, lvPrestadores, 'Debe seleccionar un prestador.');
  chkSvoTemp.Checked := False;
  fraPrestador.Cargar(iPrestador);
  fraPrestadorChange(nil);
  fpPrestador.ModalResult := mrOk;
end;

function TfrmRecepcion.CantSel: Integer;
var
  i: Integer;
  iCant: Integer;
  iPrestador: Integer;
begin
  iCant       := 0;
  iPrestador  := 0;
  for i := 0 to lvPrestadores.Items.Count - 1 do
    if lvPrestadores.Items.Item[i].Checked then
    begin
      Inc(iCant);
      iPrestador := StrToInt(lvPrestadores.Items[i].Caption);
    end;
  Result := IIF((iCant <> 1), 0 , iPrestador);
end;

procedure TfrmRecepcion.DoChequearFechaRevision;
var
  sSql: String;
begin
  sSql := 'SELECT ca_fecharevision' +
           ' FROM cpr_prestador' +
          ' WHERE ca_identificador = :IdPres';

  if not(bTemporario) and (ValorSqlDateTimeEx(sSql, [fraPrestador.IDPrestador]) = 0) then
  begin
    MsgBox('El prestador no posee fecha de revisión.', MB_ICONINFORMATION);
    EnviarMailBD(Get_DireccionesEnvioMail('FEC_REV'),
                 'Volante con prestador sin fecha de revisión ', [],
                 'Al prestador ' + fraPrestador.RazonSocial + ' (ID: ' + IntToStr(fraPrestador.IDPrestador) +
                 ') se le ha cargado el volante ' + IntToStr(edVolante.Tag) + ' y no posee fecha de revisión.',
                 nil, 0, tcDefault, False);
  end;
end;

procedure TfrmRecepcion.edImpBrutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ThousandSeparator then Key := DecimalSeparator;
end;

procedure TfrmRecepcion.edImpBrutoExit(Sender: TObject);
begin
  edTotFact.Value := edImpBruto.Value + edImpIVA.Value;
end;

procedure TfrmRecepcion.AvisoFaltaSeguro(IdPrestador :Integer);
var
  sSql :String;
  iCant, iEstado :Integer;
begin
  FEstadoMP := emNada;
  sSql      := 'SELECT siniestro.get_estadoseguromalapraxis(:IdPres) ' +
                ' FROM dual ';
  iEstado   := ValorSqlIntegerEx(sSql, [IdPrestador]);
  btnCargarSeguro.Enabled := Seguridad.Activar(btnCargarSeguro) and
                             ((iEstado = 1) or (iEstado = 4));
  sSql      := 'SELECT COUNT(*) ' +
               ' FROM msm_seguromalapraxis, msp_seguropago, cpr_prestador ' +
              ' WHERE sp_idseguro = sm_id ' +
                ' AND sm_prestador = ca_identificador ' +
                ' AND sm_prestador = :IdPres ' +
                ' AND sp_fechapago IS NULL ' +
                ' AND sysdate > sp_fechavencimiento ' +
                ' AND sm_fechabaja IS NULL ' +
                ' AND actualdate BETWEEN sm_vigenciadesde AND sm_vigenciahasta ' +
                ' AND siniestro.get_estadoseguromalapraxis(sm_prestador) <> 5 ';  //que el prestador requiera seguro de MP
  case iEstado of
    1,5: FEstadoMP := emSinPagos;
    2,3: begin
           MsgBox('El prestador no posee seguro de mala praxis activo.' , MB_ICONINFORMATION);
           FEstadoMP := emSinPoliza;
         end;
      4: begin
           iCant := ValorSqlIntegerEx(sSql, [IdPrestador]);
           if (iCant > 0) then
             if  MsgAsk('El prestador posee ' + IntToStr(iCant) + ' cuota/s vencida/s del seguro de mala praxis.' + CRLF +
                        '¿Desea cargarla/s ahora?') then
               DoCargarSeguro
             else
               FEstadoMP := emSinDocum;
         end;
  end;
end;

procedure TfrmRecepcion.DoCargarSeguro;
var
  sSql, sEst :String;
  iEstAnt, iEstNuevo :Integer;
begin
  Verificar(bTemporario, chkSvoTemp, 'Debe quitar la marca de Carga Temporaria.');
  Verificar(fraPrestador.IsEmpty, fraPrestador,
            'Debe seleccionar un prestador para acceder al plan de pagos de su seguro de mala praxis.');
  sEst := 'SELECT siniestro.get_estadoseguromalapraxis(:IdPres) ' +
           ' FROM dual ';
  iEstAnt := ValorSqlIntegerEx(sEst, [fraPrestador.IDPrestador]);
  sSql    := 'SELECT sm_id, sm_vigenciahasta, NVL((sm_prima - sm_adelanto), 0) prima ' +
              ' FROM msm_seguromalapraxis ' +
             ' WHERE sm_prestador = :IdPrest ' +
               ' AND sm_fechabaja IS NULL ' +
               ' AND actualdate BETWEEN sm_vigenciadesde AND sm_vigenciahasta ';
  with TfrmPlanDePagosDePolizas.Create(Self) do   //Plan de Pagos
  begin
    PermisoAlta   := False;
    Prestador     := fraPrestador.IDPrestador;
    with GetQueryEx(sSql, [fraPrestador.IDPrestador]) do
    try
      IDSeguro      := Fields[0].AsInteger;
      VigenciaHasta := Fields[1].AsDateTime;
      ValorPrima    := Fields[2].AsFloat;
    finally
      Free;
    end;
    ShowModal(True);
  end;

  //estado del seguro despues de cargar
  iEstNuevo := ValorSqlIntegerEx(sEst, [fraPrestador.IDPrestador]);
  //el estado anterior solo puede ser 1 (sin poliza) ó 4 (cuotas vencidas)
  if (iEstAnt = 1) and (FEstadoMP <> emConDocum) then
    FEstadoMP := emSinPagos
  else
    case iEstNuevo of
      1: FEstadoMP := emConDocum;
      4: FEstadoMP := emSinDocum;
    end;
end;

procedure TfrmRecepcion.DoHabilitarMixto(bChecked :Boolean; iVolante :Integer);
var
  sSIN, sGEN :String;
begin
  sSIN := 'SELECT 1 FROM siv_itemvolante ' +
          ' WHERE iv_volante = :Vol ' +
            ' AND iv_estado NOT IN (''X'', ''CM'', ''C6'') ';

  sGEN := 'SELECT 1 FROM svg_vol_generico ' +
          ' WHERE vg_volante = :Vol ' +
            ' AND vg_estado <> ''X'' ';

  chkMixto.Enabled := not(bChecked) or
                     (bChecked and Seguridad.Activar(chkMixto) and
                      not(ExisteSqlEx(sSIN, [iVolante])) and
                      not(ExisteSqlEx(sGEN, [iVolante])));
end;

function TfrmRecepcion.SetEstadoNuevo :String;
var
  sGEN :String;
begin
  sGEN := 'SELECT 1 FROM svg_vol_generico ' +
          ' WHERE vg_volante = :Vol ' +
            ' AND vg_estado <> ''X'' ';

  if chkMixto.Checked then
    Result := 'LM'
  else if ExisteSqlEx(sGEN, [sdqDatosVO_VOLANTE.AsInteger]) then
    Result := 'LG'
  else
    Result := 'L';
end;

procedure TfrmRecepcion.DoLogSeguroMP;
var
  sSql :String;
begin
  if (not bTemporario) and (FEstadoMP <> emNada) then
  begin
    sSql := ' INSERT INTO sin.slp_logmalapraxis ' +
            ' (lp_idprestador, lp_idestado, lp_usualta, lp_fechaalta) VALUES (' +
             SqlInt(fraPrestador.IDPrestador) + ',' + SqlInt(Ord(FEstadoMP)) + ',' +
             SqlValue(Sesion.UserID) + ', actualdate)';
    EjecutarSqlST(sSql);
  end;
end;

procedure TfrmRecepcion.fpSelLoteAMPBeforeShow(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT le_id AS ID, le_id AS codigo, ' +
                ' em_nombre || '' - Est. '' || es_nroestableci || '' '' || es_nombre AS descripcion, ' +
                ' NULL AS baja, es_nroestableci, es_contrato, em_id, em_nombre ' +
           ' FROM afi.aem_empresa, afi.aco_contrato, afi.aes_establecimiento, ' +
                ' hys.hle_loteestudio, hys.hel_estadolote, hys.hrl_relevamientolote ' +
          ' WHERE el_idlote = art.amp.get_ultimolote_no_anulado(es_id, ''S'', ''S'') ' +
            ' AND el_rlid = rl_id ' +
            ' AND rl_idestableci = es_id ' +
            ' AND co_contrato = es_contrato ' +
            ' AND co_contrato = art.afiliacion.get_ultcontrato(em_cuit) ' +
            ' AND em_id = co_idempresa ' +
            ' AND le_idprestador = ' + SqlInt(fraPrestador.IDPrestador) +
            ' AND el_idlote = le_id ';
  with fraEmpresaEstabLote do
  begin
    Clear;
    Enabled         := fraPrestador.IsSelected;
    ShowBajas       := True;
    Propiedades.Sql := sSql;
  end;
  fraEmpresaFiltro.Clear;
  fraEstabFiltro.Clear;
  chkSinLote.Checked      := False;
  btnCancelarLote.Caption := 'Cancelar';
end;

procedure TfrmRecepcion.fraEmpresaEstabLotePropiedadesChange(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  fraEstabFiltro.Clear;

  if not fraEmpresaEstabLote.sdqDatos.IsEmpty then
  begin
    fraEmpresaFiltro.ExtraCondition := ' AND em_id IN (SELECT DISTINCT dl_idempresa ' +
                                                               '  FROM hys.hdl_detallelote ' +
                                                               ' WHERE dl_idlote = ' + SqlInteger (fraEmpresaEstabLote.Value) + ')';
    fraEmpresaFiltro.Contrato       := fraEmpresaEstabLote.sdqDatos.FieldByName('es_contrato').AsInteger;
    fraEmpresaFiltro.Reload;

    fraEstabFiltro.Cargar(fraEmpresaFiltro.CUIT, fraEmpresaEstabLote.sdqDatos.FieldByName('es_nroestableci').AsInteger);
  end
end;

procedure TfrmRecepcion.OnEmpresaChange(Sender: TObject);
begin
  fraEstabFiltro.CUIT := fraEmpresaFiltro.CUIT;
end;

procedure TfrmRecepcion.btnAceptarLoteClick(Sender: TObject);
begin
  DoGrabarVolanteLote;
  fpSelLoteAMP.ModalResult := mrOk;
end;

function TfrmRecepcion.DoGrabarLoteAMP(sEstado :String):Boolean;
begin
  if (sEstado <> 'PM') or (fpSelLoteAMP.ShowModal = mrOk) then
    Result := True
  else begin
    MsgBox('Atención: si no selecciona el lote, no se guardarán los datos.');
    MostrarEstado('Listo');
    Rollback;
    Result := False;
  end;
end;

procedure TfrmRecepcion.btnCancelarLoteClick(Sender: TObject);
begin
 fpSelLoteAMP.ModalResult := IIF(btnCancelarLote.Caption = 'Cancelar', mrCancel, mrOk);
end;

procedure TfrmRecepcion.DoGrabarVolanteLote;
var
  sSql :String;
begin
  Verificar(fraEmpresaEstabLote.IsEmpty and not(chkSinLote.Checked), fraEmpresaEstabLote, 'Debe seleccionar el lote.');
  if not(chkSinLote.Checked) then
  begin
    sSql := 'INSERT INTO hys.hvl_volantelote ' +
            '(vl_volante, vl_lote, vl_cuit, vl_establecimiento, vl_fechaalta, ' +
            ' vl_usualta) VALUES ( ' +
            SqlInt(edVolante.Tag) + ',' + SqlInt(fraEmpresaEstabLote.ID) + ',' +
            SqlValue(fraEmpresaFiltro.CUIT) + ',' + SqlInt(fraEstabFiltro.ID) + ',' +
            ' ActualDate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSqlST(sSql);
    fraEmpresaEstabLote.Clear;
    fraEmpresaFiltro.Clear;
    fraEstabFiltro.Clear;
  end;
end;

procedure TfrmRecepcion.btnSiguienteLoteClick(Sender: TObject);
begin
  DoGrabarVolanteLote;
  btnCancelarLote.Caption := 'Cerrar';
end;

procedure TfrmRecepcion.edFacturaTipoChange(Sender: TObject);
var
  bCBU :Boolean;
begin
  bCBU := (edFacturaTipo.Text = 'A');
  gbCBU.Enabled     := bCBU;
  rbSiCBU.Enabled   := bCBU;
  rbNoCBU.Enabled   := bCBU;
  rbSiCBU.Checked   := False;
  rbNoCBU.Checked   := False;
  lblCBU.Visible    := False;
end;

procedure TfrmRecepcion.rbSiCBUClick(Sender: TObject);
begin
  SetCBUInformada;
end;

procedure TfrmRecepcion.rbNoCBUClick(Sender: TObject);
begin
  lblCBU.Visible := False;
end;

procedure TfrmRecepcion.SetCBUInformada;
var
  sCBU :String;
begin
  if (rbSiCBU.Checked) then
  begin
    sCBU := ValorSqlEx('SELECT cp_cbu1 || ''-'' || cp_cbu2 cbu ' +
                        ' FROM ccp_cuentapago, art.cpr_prestador ' +
                       ' WHERE ca_identificador = cp_idacreedor ' +
                         ' AND cp_tipoacreedor = ''CA'' ' +
                         ' AND cp_fechabaja IS NULL ' +
                         ' AND cp_fechaaltamcarga IS NOT NULL ' +
                         ' AND ca_identificador = :prestador ', [fraPrestador.IDPrestador]);

    lblCBU.Caption := 'CBU informada: ' + sCBU;
    lblCBU.Visible := (sCBU <> '');
  end
  else
    lblCBU.Visible := False;
end;

function TfrmRecepcion.ValidarDebito: Boolean;    // TK 33642
var sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_volante = ' + SqlInt(edVolante.Value) +
            ' AND dv_fechabaja IS NULL ' +
            ' AND dv_aplicado = ''N'' ' +
            ' AND dv_observacioninterna = ''N'' ';
  Verificar(ExisteSql(sSql), btnGrabar, 'El volante no puede quedar liquidado ya que posee débitos ' + #13 +
                                        'de auditoría médica que aun no han sido aplicados.');
  Result := True;
end;

end.

