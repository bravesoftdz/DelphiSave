unit unGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ExtCtrls,
  PatternEdit, CardinalEdit, StdCtrls, Mask, ToolEdit, DateComboBox, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  Buttons, IntEdit, unfraCtbTablas, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, unArt, DB, SDEngine, FormPanel,
  FileCtrl, SortDlg, QueryToFile, ExportDialog, FieldHider, QueryPrint, ShortCutControl, unArtDBAwareFrame;

type
  TfrmGestion = class(TForm)
    ToolBar: TToolBar;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    tbMainGuardar: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    tbMainImprimir: TToolButton;
    ToolButton9: TToolButton;
    tbMainSalir: TToolButton;
    pnGestion: TPanel;
    pcMasDatos: TPageControl;
    tsPrincipal: TTabSheet;
    tsFinal: TTabSheet;
    tsAdjudicacion: TTabSheet;
    tsContratacion: TTabSheet;
    edFechaNotificacion: TDateComboBox;
    Label1: TLabel;
    edFechaApertura: TDateComboBox;
    Label2: TLabel;
    lbCUIT: TLabel;
    edCUIT: TMaskEdit;
    lbContacto: TLabel;
    edRazonSocial: TEdit;
    Label3: TLabel;
    edNumeroLicitacion: TCardinalEdit;
    lbNivel: TLabel;
    lbPROCENTAJE_MASA_SALARIAL: TLabel;
    edMasaSalarial: TCurrencyEdit;
    fraDelegacion: TfraCodigoDescripcion;
    Label4: TLabel;
    fraART: TfraCodigoDescripcion;
    Label5: TLabel;
    Label6: TLabel;
    edTarifaFija: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    edTarifaVariable: TCurrencyEdit;
    Label9: TLabel;
    edCostoPorEmpleado: TCurrencyEdit;
    Label10: TLabel;
    edCapitas: TIntEdit;
    fraSector: TfraCtbTablas;
    Label15: TLabel;
    edCostoPliego: TCurrencyEdit;
    checkPliegoSinCosto: TCheckBox;
    GroupBox1: TGroupBox;
    rbPresentacion: TRadioButton;
    rbNoPresentacion: TRadioButton;
    cbDirectoIndirecto: TComboBox;
    fraCanal: TfraCodigoDescripcion;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edComision: TCurrencyEdit;
    fraMotivo: TfraCtbTablas;
    tsSeguimiento: TTabSheet;
    ArtDBGrid: TArtDBGrid;
    GroupBox2: TGroupBox;
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tblSeparador2: TToolButton;
    tlbSalir: TToolButton;
    fraSeguimientoResponsable: TfraCodigoDescripcion;
    Label14: TLabel;
    Label16: TLabel;
    edSeguimientoFechaSolicitud: TDateComboBox;
    edSeguimientoMotivo: TEdit;
    Label17: TLabel;
    fraSeguimientoSector: TfraCodigoDescripcion;
    Label18: TLabel;
    Label19: TLabel;
    edSeguimientoResultado: TEdit;
    Label20: TLabel;
    edSeguimientoFechaRespuesta: TDateComboBox;
    Label21: TLabel;
    edSeguimientoEmail: TEdit;
    sdqSeguimientoDatos: TSDQuery;
    sdDatos: TDataSource;
    fraEstado: TfraCtbTablas;
    Label22: TLabel;
    tbMainExpediente: TToolButton;
    ToolButton7: TToolButton;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edFijo: TCurrencyEdit;
    edVariable: TCurrencyEdit;
    edCostoAnual: TCurrencyEdit;
    edCostoMensual: TCurrencyEdit;
    edCostoEmpleado: TCurrencyEdit;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    dbgridFinal: TArtDBGrid;
    sdqFinalDatos: TSDQuery;
    dsFinal: TDataSource;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    fraFinalSector: TfraCodigoDescripcion;
    Label29: TLabel;
    edFinalFijo: TCurrencyEdit;
    Label30: TLabel;
    edFinalVariable: TCurrencyEdit;
    Label31: TLabel;
    edFechaNotificacionAdjudicacion: TDateComboBox;
    fraAdjudicacion: TfraCodigoDescripcion;
    Label32: TLabel;
    fraMotivoAdjudicacion: TfraCtbTablas;
    Label33: TLabel;
    Label34: TLabel;
    edObservaciones: TEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    edPeriodoCoberturaDesde: TDateComboBox;
    edPeriodoCoberturaHasta: TDateComboBox;
    Label36: TLabel;
    rbContratacionSi: TRadioButton;
    rbContratacionNo: TRadioButton;
    Label37: TLabel;
    edContratacionCondiciones: TEdit;
    ToolBar2: TToolBar;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    dbgrtidContratacion: TArtDBGrid;
    GroupBox7: TGroupBox;
    Label38: TLabel;
    fraContratacionSector: TfraCodigoDescripcion;
    Label39: TLabel;
    Label40: TLabel;
    fraContratacionResponsable: TfraCodigoDescripcion;
    edContratacionEmail: TEdit;
    Label41: TLabel;
    edContratacionObligacion: TEdit;
    sdqContratacionDatos: TSDQuery;
    dsContratacion: TDataSource;
    Label42: TLabel;
    edDomicilio: TEdit;
    Label43: TLabel;
    edTelefono: TEdit;
    Label44: TLabel;
    edContacto: TEdit;
    fpPliegos: TFormPanel;
    btnFecha: TButton;
    btnSalir2: TButton;
    GroupBox8: TGroupBox;
    edRutaPliegos: TEdit;
    btnSeleccionarRutaPliegos: TButton;
    btnVerPliegos: TButton;
    tbSeguimientoLimpiar: TToolButton;
    tbSeguimientoOrdenar: TToolButton;
    tbSeguimientoExportar: TToolButton;
    ToolButton27: TToolButton;
    SortDialogSeguimiento: TSortDialog;
    ExportDialogSeguimiento: TExportDialog;
    tbSeguimientoMostrar: TToolButton;
    FieldHiderSeguimiento: TFieldHider;
    ExportDialogFinal: TExportDialog;
    FieldHiderFinal: TFieldHider;
    SortDialogFinal: TSortDialog;
    ExportDialogContratacion: TExportDialog;
    FieldHiderContratacion: TFieldHider;
    SortDialogContratacion: TSortDialog;
    tbFinalLimpiar: TToolButton;
    tbFinalOrdenar: TToolButton;
    tbFinalMostrar: TToolButton;
    tbFinalExportar: TToolButton;
    tbContratacionLimpiar: TToolButton;
    tbContratacionOrdenar: TToolButton;
    tbContratacionMostrar: TToolButton;
    tbContratacionExportar: TToolButton;
    tbMainLimpiar: TToolButton;
    lbBroker: TLabel;
    edBroker: TEdit;
    Label45: TLabel;
    edFechaLlamadoAdjudicacion: TDateComboBox;
    Label46: TLabel;
    edContactoAdjudicacion: TEdit;
    Label47: TLabel;
    edComentariosAdjudicacion: TEdit;
    tbSeguimientoImprimir: TToolButton;
    tbFinalImprimir: TToolButton;
    tbContratacionImprimir: TToolButton;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ShortCutControl: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tblLimpiarClick(Sender: TObject);
    procedure tbMainGuardarClick(Sender: TObject);
    procedure tbMainSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbPresentacionClick(Sender: TObject);
    procedure rbNoPresentacionClick(Sender: TObject);
    procedure checkPliegoSinCostoClick(Sender: TObject);
    procedure cbDirectoIndirectoChange(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure sdqSeguimientoDatosAfterScroll(DataSet: TDataSet);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																 Highlight: Boolean);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure dbgridFinalGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																	 Highlight: Boolean);
    procedure sdqFinalDatosAfterScroll(DataSet: TDataSet);
    procedure rbContratacionSiClick(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure dbgrtidContratacionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																					 Highlight: Boolean);
    procedure sdqContratacionDatosAfterScroll(DataSet: TDataSet);
    procedure CalcularCosto(Sender: TObject);
    procedure tbMainExpedienteClick(Sender: TObject);
    procedure btnSeleccionarRutaPliegosClick(Sender: TObject);
    procedure btnVerPliegosClick(Sender: TObject);
    procedure fraSeguimientoResponsableedCodigoExit(Sender: TObject);
    procedure fraSeguimientoSectoredCodigoExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbMostrarClick(Sender: TObject);
    procedure fraContratacionResponsableedCodigoExit(Sender: TObject);
    procedure fraContratacionSectoredCodigoExit(Sender: TObject);
    procedure edTarifaFijaKeyPress(Sender: TObject; var Key: Char);
    procedure CalcularCostoPorEmpleado(Sender: TObject);
    procedure fraCanalExit(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
  private
  	FGuardarPersonaResponsable: Boolean;
  	FLicitacionID: Integer;
  	FOperacion: TFuncionShowForm;
    FOperacionContratacion: TFuncionShowForm;
    FOperacionFinal: TFuncionShowForm;
    FOperacionSeguimiento: TFuncionShowForm;
    FRutaPliegos: String;

    function IsValidar: Boolean;
    function IsValidarContratacion: Boolean;
    function IsValidarFinal: Boolean;
    function IsValidarSeguimiento: Boolean;

    procedure ClearContratacion;
    procedure ClearControls;
    procedure ClearFinal;
    procedure ClearSeguimiento;
    procedure DoCargaLicitacion;
    procedure DoGuardaContratacion;
    procedure DoGuardaFinal;
    procedure DoGuardaLicitacion;
    procedure DoGuardaSeguimiento;
    procedure EnablePrincipalControls;
    procedure Exportar(aBtn: TToolButton; aExpDia: TExportDialog; aGrid: TArtDBGrid; aQuery: TSDQuery);
    procedure PrintResults(const aTitulo: String; aGrid: TArtDBGrid; aDataSet: TDataSet);
    procedure SeleccionContratacion;
    procedure SeleccionFinal;
    procedure SeleccionSeguimiento;
  public
		procedure Agregar;
    procedure Editar(const aLicitacionId: Integer);
  end;

var
  frmGestion: TfrmGestion;

implementation

uses
	unDmPrincipal, AnsiSql, unPrincipal, unSesion, CustomDlgs, CUIT, SqlFuncs, StrUtils, Math, unVisualizaPliegos;

{$R *.dfm}

function TfrmGestion.IsValidar: Boolean;
begin
	Verificar(edFechaNotificacion.IsEmpty, edFechaNotificacion, 'La fecha de notificación es obligatoria.');
  Verificar(edFechaApertura.IsEmpty, edFechaApertura, 'La fecha de apertura es obligatoria.');
  Verificar(edCUIT.Text = '', edCUIT, 'El Nro. CUIT es obligatorio.');
  Verificar(not IsCUIT(edCUIT.Text), edCUIT, 'El Nro. de CUIT es incorrecto.');
  Verificar(edRazonSocial.Text = '', edRazonSocial, 'La Razón Social es obligatoria.');
  Verificar(fraDelegacion.IsEmpty, fraDelegacion, 'La delegación es obligatoria.');
  Verificar(edCapitas.Text = '', edCapitas, 'El valor de las capitas tiene que ser mayor a 0 (cero).');
  Verificar(edMasaSalarial.Value <= 0, edMasaSalarial, 'La masa salarial tiene que ser mayor a 0 (cero).');
  Verificar(fraSector.IsEmpty, fraSector, 'El sector es obligatorio.');

  Result := True;
end;

function TfrmGestion.IsValidarContratacion: Boolean;
begin
  Result := True;
end;

function TfrmGestion.IsValidarFinal: Boolean;
begin
	Verificar(fraFinalSector.Value = 0, fraFinalSector, 'El oferente es obligatorio.');
  Verificar(edFinalFijo.Value = 0, edFinalFijo, 'El valor fijo es obligatorio.');
  Verificar(edFinalVariable.Value = 0, edFinalVariable, 'El valor variable es obligatorio.');

  Result := True;
end;

function TfrmGestion.IsValidarSeguimiento: Boolean;
begin
	Verificar(fraSeguimientoSector.Value = 0, fraSeguimientoSector, 'El sector es obligatorio.');
  Verificar(edSeguimientoFechaSolicitud.IsEmpty, edSeguimientoFechaSolicitud, 'La fecha de solicitud es obligatoria.');
  Verificar(edSeguimientoMotivo.Text = '', edSeguimientoMotivo, 'El motivo es obligatorio.');

  Result := True;
end;


procedure TfrmGestion.Agregar;
begin
	FOperacion := fsAgregar;
	pcMasDatos.Visible := False;
  tbMainExpediente.Enabled := False;

//  FormStyle := fsMDIChild;
end;

procedure TfrmGestion.ClearControls;
begin
	FGuardarPersonaResponsable := True;

	// Datos Generales..
	fraART.Clear;
	edCapitas.Clear;
  edContacto.Clear;
  edCostoPorEmpleado.Clear;
	edCUIT.Clear;
  edDomicilio.Clear;
	edFechaApertura.Clear;
	edFechaNotificacion.Clear;
  edMasaSalarial.Clear;
  edNumeroLicitacion.Clear;
  edRazonSocial.Clear;
  edRutaPliegos.Clear;
  edTarifaFija.Clear;
  edTarifaVariable.Clear;
  edTelefono.Clear;
  fraDelegacion.Clear;
  fraEstado.Clear;
  fraSector.Clear;

  pcMasDatos.ActivePageIndex := 0;

  // Solapa Principal..
  cbDirectoIndirecto.Enabled := False;
  cbDirectoIndirecto.ItemIndex := -1;
  checkPliegoSinCosto.Checked := False;
  edBroker.Clear;
  edBroker.Hide;
  edComision.Clear;
  edComision.Enabled := False;
  edCostoPliego.Clear;
  fraCanal.Clear;
  fraCanal.Enabled := False;
  fraMotivo.Clear;
  fraMotivo.Enabled := False;
  lbBroker.Hide;
  rbNoPresentacion.Checked := False;
  rbPresentacion.Checked := False;

  // Solapa Seguimiento..
  ClearSeguimiento;

  // Solapa Final..
  ClearFinal;

  // Adjudicación..
  edFechaNotificacionAdjudicacion.Clear;
  edObservaciones.Clear;
  edFechaLlamadoAdjudicacion.Clear;
  edContactoAdjudicacion.Clear;
  edComentariosAdjudicacion.Clear;
  fraAdjudicacion.Clear;
  fraMotivoAdjudicacion.Clear;

  // Contratación..
  edContratacionCondiciones.Clear;
  edContratacionCondiciones.Enabled := False;
  edPeriodoCoberturaDesde.Clear;
  edPeriodoCoberturaHasta.Clear;
  rbContratacionSi.Checked := False;
  rbContratacionNo.Checked := False;
  ClearContratacion;
end;

procedure TfrmGestion.ClearContratacion;
begin
	edContratacionEmail.Clear;
	edContratacionObligacion.Clear;
  fraContratacionResponsable.Clear;
	fraContratacionSector.Clear;
end;

procedure TfrmGestion.ClearFinal;
begin
	edFinalFijo.Clear;
  edFinalVariable.Clear;
	fraFinalSector.Clear;
end;

procedure TfrmGestion.ClearSeguimiento;
begin
	edSeguimientoEmail.Clear;
	edSeguimientoFechaRespuesta.Clear;
	edSeguimientoFechaSolicitud.Clear;
  edSeguimientoMotivo.Clear;
  edSeguimientoResultado.Clear;
  fraSeguimientoResponsable.Clear;
	fraSeguimientoSector.Clear;
end;

procedure TfrmGestion.DoCargaLicitacion;
var
	sdqCargaDatos: TSDQuery;
  sSql: String;
begin
	sdqCargaDatos := TSDQuery.Create(Self);

  with sdqCargaDatos do
  try
  	DataBaseName := 'dbPrincipal';

  	sSql := 'SELECT * FROM ALI_LICITACION WHERE LI_ID = ' + IntToStr(FLicitacionID);
  	OpenQuery(sdqCargaDatos, sSql, True);

    // Datos Generales..
    edCapitas.Value 				 := FieldByName('LI_CAPITAS').AsInteger;
    edContacto.Text 				 := FieldByName('LI_CONTACTO').AsString;
    edCostoPorEmpleado.Value := FieldByName('LI_COSTOEMPLEADOS').AsInteger;
    edCUIT.Text 						 := FieldByName('LI_CUIT').AsString;
    edDomicilio.Text 				 := FieldByName('LI_DOMICILIO').AsString;
    edFechaApertura.Date 		 := FieldByName('LI_FECHAAPERTURA').AsDateTime;
    edFechaNotificacion.Date := FieldByName('LI_FECHANOTIFICACION').AsDateTime;
    edMasaSalarial.Value 		 := FieldByName('LI_MASA').AsFloat;
    edNumeroLicitacion.Text  := FieldByName('LI_NROLICITACION').AsString;
    edRazonSocial.Text 			 := FieldByName('LI_RAZONSOCIAL').AsString;
    edTarifaFija.Value 			 := FieldByName('LI_FIJOACTUAL').AsFloat;
    edTarifaVariable.Value 	 := FieldByName('LI_VARIABLEACTUAL').AsFloat;
    edTelefono.Text 				 := FieldByName('LI_TELEFONO').AsString;
    edRutaPliegos.Text 			 := FieldByName('LI_DIGITALIZADO').AsString;
    if not FieldByName('LI_IDART').IsNull then
    	fraART.Value 					 := FieldByName('LI_IDART').AsInteger;
    if not FieldByName('LI_IDDELEGACION').IsNull then
    	fraDelegacion.Value 	 := FieldByName('LI_IDDELEGACION').AsInteger;
    fraEstado.Value 				 := FieldByName('LI_ESTADO').AsString;
    fraSector.Value 				 := FieldByName('LI_SECTOR').AsString;

    // Solapa Principal..
    FGuardarPersonaResponsable := FieldByName('LI_PRESENTACION').IsNull;
    if FieldByName('LI_PRESENTACION').AsString = 'S' then
    begin
    	rbPresentacion.Checked := True;
    	if FieldByName('LI_DIRECTOINDIRECTO').AsString = 'D' then
      	cbDirectoIndirecto.ItemIndex := 0
      else if FieldByName('LI_DIRECTOINDIRECTO').AsString = 'I' then
      	cbDirectoIndirecto.ItemIndex := 1;
			edComision.Enabled := (Copy(cbDirectoIndirecto.Text, 1, 1) = 'I');
  		fraCanal.Enabled := edComision.Enabled;
      if not FieldByName('LI_IDCANAL').IsNull then
      	fraCanal.Value := FieldByName('LI_IDCANAL').AsInteger;
      edComision.Value := FieldByName('LI_COMISION').AsFloat;
      lbBroker.Visible := (fraCanal.edCodigo.Text = '006');
      edBroker.Visible := lbBroker.Visible;
      if edBroker.Visible then
      	edBroker.Text := FieldByName('LI_BROKER').AsString;
    end
    else
    begin
			rbNoPresentacion.Checked := True;
      if not FieldByName('LI_IDMOTIVONOPRESENTACION').IsNull then
    		fraMotivo.Value := FieldByName('LI_IDMOTIVONOPRESENTACION').AsString;
    end;
    checkPliegoSinCosto.Checked := (FieldByName('LI_SINCOSTO').AsString = 'T');
    edCostoPliego.Value 				:= FieldByName('LI_COSTOPLIEGO').AsFloat;

    // Solapa Final..
    edCostoAnual.Value 		:= FieldByName('LI_OFERTAANUAL').AsFloat;
    edCostoEmpleado.Value := FieldByName('LI_OFERTAEMPLEADO').AsFloat;
    edCostoMensual.Value 	:= FieldByName('LI_OFERTACOSTOMENSUAL').AsFloat;
    edFijo.Value 					:= FieldByName('LI_OFERTAFIJO').AsFloat;
    edVariable.Value 			:= FieldByName('LI_OFERTAVARIABLE').AsFloat;

    // Solapa Adjudicación..
    edFechaNotificacionAdjudicacion.Date := FieldByName('LI_FECHAADJUDICACION').AsDateTime;
    edFechaLlamadoAdjudicacion.Date 		 := FieldByName('LI_FECHALLAMADOADJU').AsDateTime;
    edObservaciones.Text 								 := FieldByName('LI_OBSERVACIONESADJU').AsString;
    edContactoAdjudicacion.Text 				 := FieldByName('LI_CONTACTOADJU').AsString;
    edComentariosAdjudicacion.Text 			 := FieldByName('LI_COMENTARIOSADJU').AsString;
    if not FieldByName('LI_IDARTADJUDICACION').IsNull then
    	fraAdjudicacion.Value 						 := FieldByName('LI_IDARTADJUDICACION').AsInteger;
    if not FieldByName('LI_MOTIVOADJUDICACION').IsNull then
    	fraMotivoAdjudicacion.Value 			 := FieldByName('LI_MOTIVOADJUDICACION').AsString;

    // Solapa Contratación..
    edPeriodoCoberturaDesde.Date 			:= FieldByName('LI_COBERTURADESDE').AsDateTime;
    edPeriodoCoberturaHasta.Date 			:= FieldByName('LI_COBERTURAHASTA').AsDateTime;
    rbContratacionSi.Checked 					:= (FieldByName('LI_PRORROGA').AsString = 'S');
    rbContratacionNo.Checked 					:= (FieldByName('LI_PRORROGA').AsString = 'N');
    edContratacionCondiciones.Enabled := rbContratacionSi.Checked;
    edContratacionCondiciones.Text 		:= FieldByName('LI_CONDICIONES').AsString
  finally
    Free;
  end;
end;

procedure TfrmGestion.DoGuardaContratacion;
var
  iContratacionId: Integer;
  sSqlTrans: TSql;
begin
  iContratacionId := 0;

  sSqlTrans := TSQL.Create('ALC_LICITACIONCONTRATACION');
  try
    case FOperacionContratacion of
      fsAgregar:
      begin
        iContratacionId := GetSecNextVal('SEQ_ALC_ID');

        sSqlTrans.Fields.Add('LC_FECHAALTA', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LC_USUALTA', 	 Sesion.UserId);
        sSqlTrans.SqlType := stInsert;
      end;
      fsModificar:
      begin
        iContratacionId := sdqContratacionDatos.FieldByName('LC_ID').AsInteger;

        sSqlTrans.Fields.Add('LC_FECHAMODIF', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LC_USUMODIF', 	Sesion.UserId);
        sSqlTrans.SqlType := stUpdate;
      end;
    end;
    sSqlTrans.PrimaryKey.Add('LC_ID', 			iContratacionId, False);
    sSqlTrans.Fields.Add('LC_IDLICITACION', FLicitacionID);
    sSqlTrans.Fields.Add('LC_IDSECTOR', 		fraContratacionSector.Value, False);
    sSqlTrans.Fields.Add('LC_MAIL', 				edContratacionEmail.Text);
    sSqlTrans.Fields.Add('LC_OBLIGACION', 	edContratacionObligacion.Text);
    sSqlTrans.Fields.Add('LC_RESPONSABLE', 	fraContratacionResponsable.Value, False);
    try
      EjecutarSQLST(sSqlTrans.Sql);
      sdqContratacionDatos.Close;
      OpenQueryEx(sdqContratacionDatos, [FLicitacionID]);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmGestion.DoGuardaFinal;
var
	iCostoMensual: Real;
  iFinalId: Integer;
  sSqlTrans: TSql;
begin
//	iCostoMensual := edMasaSalarial.Value / edCapitas.Value * (edFinalVariable.Value / 100) +  edFinalFijo.Value;
  iCostoMensual := (edMasaSalarial.Value * edFinalVariable.Value / 100) + (edCapitas.Value * edFinalFijo.Value);
  iFinalId := 0;

  sSqlTrans := TSQL.Create('ALR_LICITACIONRESULTADO');
  try
    case FOperacionFinal of
      fsAgregar:
      begin
        iFinalId := GetSecNextVal('SEQ_ALR_ID');

        sSqlTrans.Fields.Add('LR_FECHAALTA', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LR_USUALTA', 	 Sesion.UserId);
        sSqlTrans.SqlType := stInsert;
      end;
      fsModificar:
      begin
        iFinalId := sdqFinalDatos.FieldByName('LR_ID').AsInteger;

        sSqlTrans.Fields.Add('LR_FECHAMODIF', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LR_USUMODIF', 	Sesion.UserId);
        sSqlTrans.SqlType := stUpdate;
      end;
    end;
    sSqlTrans.PrimaryKey.Add('LR_ID', 			 iFinalId, False);
    sSqlTrans.Fields.Add('LR_IDART', 				 fraFinalSector.Value, False);
    sSqlTrans.Fields.Add('LR_IDLICITACION',  FLicitacionID);
    sSqlTrans.Fields.Add('LR_VALORFIJO', 		 edFinalFijo.Value);
    sSqlTrans.Fields.Add('LR_VALORVARIABLE', edFinalVariable.Value);
    sSqlTrans.Fields.Add('LR_COSTOEMPLEADO', iCostoMensual / edCapitas.Value);
    sSqlTrans.Fields.Add('LR_COSTOANUAL', 	 iCostoMensual * 13);
    try
      EjecutarSQLST(sSqlTrans.Sql);
      sdqFinalDatos.Close;
      OpenQueryEx(sdqFinalDatos, [FLicitacionID]);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmGestion.DoGuardaLicitacion;
var
	sSqlTrans: TSql;
begin
	try
	  sSqlTrans := TSQL.Create('ALI_LICITACION');

    // Datos Generales..
	  sSqlTrans.Fields.Add('LI_CAPITAS', 					 edCapitas.Text);
    sSqlTrans.Fields.Add('LI_CONTACTO', 				 edContacto.Text);
    sSqlTrans.Fields.Add('LI_COSTOEMPLEADOS', 	 edCostoPorEmpleado.Value);
	  sSqlTrans.Fields.Add('LI_CUIT', 						 edCUIT.Text);
    sSqlTrans.Fields.Add('LI_DIGITALIZADO', 		 edRutaPliegos.Text);
    sSqlTrans.Fields.Add('LI_DOMICILIO', 				 edDomicilio.Text);
    sSqlTrans.Fields.Add('LI_ESTADO', 					 fraEstado.Value);
  	sSqlTrans.Fields.Add('LI_FECHAAPERTURA', 		 edFechaApertura.Date);
	  sSqlTrans.Fields.Add('LI_FECHANOTIFICACION', edFechaNotificacion.Date);
    sSqlTrans.Fields.Add('LI_FIJOACTUAL', 			 edTarifaFija.Value);
    if fraART.Descripcion = '' then
    	sSqlTrans.Fields.Add('LI_IDART', 					 -1, False)
    else
    	sSqlTrans.Fields.Add('LI_IDART', 					 fraART.Value, False);
    sSqlTrans.Fields.Add('LI_IDDELEGACION', 		 fraDelegacion.Value, False);
  	sSqlTrans.Fields.Add('LI_MASA', 						 edMasaSalarial.Value);
  	sSqlTrans.Fields.Add('LI_RAZONSOCIAL', 			 edRazonSocial.Text);
    sSqlTrans.Fields.Add('LI_SECTOR', 					 fraSector.Value);
    sSqlTrans.Fields.Add('LI_TELEFONO', 				 edTelefono.Text);
    sSqlTrans.Fields.Add('LI_VARIABLEACTUAL', 	 edTarifaVariable.Value);


    // Solapa Principal..
    if (rbPresentacion.Checked) or (rbNoPresentacion.Checked) then
    begin
    	if rbPresentacion.Checked then		// Presentación..
      begin
    		sSqlTrans.Fields.Add('LI_PRESENTACION', 'S');
        sSqlTrans.Fields.Add('LI_DIRECTOINDIRECTO', Copy(cbDirectoIndirecto.Text, 1, 1));
        if Copy(cbDirectoIndirecto.Text, 1, 1) = 'I' then
        begin
        	sSqlTrans.Fields.Add('LI_IDCANAL', 	fraCanal.Value, False);
          sSqlTrans.Fields.Add('LI_COMISION', edComision.Value);
        end
        else
        begin
        	sSqlTrans.Fields.Add('LI_IDCANAL',  0, False);
          sSqlTrans.Fields.Add('LI_COMISION', 0, True);
        end;
        sSqlTrans.Fields.Add('LI_BROKER', edBroker.Text);
        sSqlTrans.Fields.Add('LI_IDMOTIVONOPRESENTACION', '0');
      end
      else		// NO Presentación..
      begin
    		sSqlTrans.Fields.Add('LI_PRESENTACION', 					'N');
        sSqlTrans.Fields.Add('LI_DIRECTOINDIRECTO', 			0, True);
        sSqlTrans.Fields.Add('LI_IDCANAL', 								0, True);
        sSqlTrans.Fields.Add('LI_COMISION', 							0, True);
        sSqlTrans.Fields.Add('LI_IDMOTIVONOPRESENTACION', fraMotivo.Value);
      end;
      if FGuardarPersonaResponsable then
      	sSqlTrans.Fields.Add('LI_PERSONAL',  Sesion.ID);
    end;
    if checkPliegoSinCosto.Checked then
      sSqlTrans.Fields.Add('LI_COSTOPLIEGO', 0, True)
    else
      sSqlTrans.Fields.Add('LI_COSTOPLIEGO', edCostoPliego.Value);
    sSqlTrans.Fields.Add('LI_SINCOSTO', 		 IfThen(checkPliegoSinCosto.Checked, 'T', 'F'));


    // Solapa Final..
    sSqlTrans.Fields.Add('LI_OFERTAANUAL', 				edCostoAnual.Value);
    sSqlTrans.Fields.Add('LI_OFERTACOSTOMENSUAL', edCostoMensual.Value);
    sSqlTrans.Fields.Add('LI_OFERTAEMPLEADO', 		edCostoEmpleado.Value);
    sSqlTrans.Fields.Add('LI_OFERTAFIJO', 				edFijo.Value);
    sSqlTrans.Fields.Add('LI_OFERTAVARIABLE', 		edVariable.Value);


    // Solapa Adjudicación..
    sSqlTrans.Fields.Add('LI_FECHAADJUDICACION', 	edFechaNotificacionAdjudicacion.Date);
    sSqlTrans.Fields.Add('LI_IDARTADJUDICACION', 	fraAdjudicacion.Value, True);
    sSqlTrans.Fields.Add('LI_MOTIVOADJUDICACION', fraMotivoAdjudicacion.Value);
    sSqlTrans.Fields.Add('LI_OBSERVACIONESADJU', 	edObservaciones.Text);
    sSqlTrans.Fields.Add('LI_FECHALLAMADOADJU', 	edFechaLlamadoAdjudicacion.Date);
    sSqlTrans.Fields.Add('LI_CONTACTOADJU', 			edContactoAdjudicacion.Text);
    sSqlTrans.Fields.Add('LI_COMENTARIOSADJU', 		edComentariosAdjudicacion.Text);


    // Solapa Contratación..
    sSqlTrans.Fields.Add('LI_COBERTURADESDE', edPeriodoCoberturaDesde.Date);
    sSqlTrans.Fields.Add('LI_COBERTURAHASTA', edPeriodoCoberturaHasta.Date);
    sSqlTrans.Fields.Add('LI_CONDICIONES', 		edContratacionCondiciones.Text);
    if rbContratacionSi.Checked then
    	sSqlTrans.Fields.Add('LI_PRORROGA', 'S')
    else if rbContratacionNo.Checked then
    	sSqlTrans.Fields.Add('LI_PRORROGA', 'N')
    else
    	sSqlTrans.Fields.Add('LI_PRORROGA', 0, True);


    if FOperacion = fsAgregar then
    begin
    	FLicitacionID := ValorSql('SELECT SEQ_ALI_ID.nextval FROM DUAL');
    	sSqlTrans.SqlType := stInsert;
      sSqlTrans.Fields.Add('LI_ID', 					 FLicitacionID);
      sSqlTrans.Fields.Add('LI_FECHAALTA', 		 dmPrincipal.DBDateTime);
      sSqlTrans.Fields.Add('LI_NROLICITACION', FLicitacionID);
      sSqlTrans.Fields.Add('LI_USUALTA', 			 Sesion.UserID);
    end
    else
    begin
    	sSqlTrans.SqlType := stUpdate;
      sSqlTrans.PrimaryKey.Add('LI_ID', 		FLicitacionID, False);
      sSqlTrans.Fields.Add('LI_FECHAMODIF', dmPrincipal.DBDateTime);
      sSqlTrans.Fields.Add('LI_USUMODIF', 	Sesion.UserID);
    end;

    EjecutarSQLST(sSqlTrans.Sql);
	  CommitTrans;
  	BeginTrans;

    if FOperacion = fsAgregar then
    begin
    	FOperacion := fsModificar;
      edNumeroLicitacion.Value := FLicitacionID;
      pcMasDatos.Visible := True;
      tbMainExpediente.Enabled := True;

      OpenQueryEx(sdqContratacionDatos, [FLicitacionID]);
      OpenQueryEx(sdqFinalDatos, [FLicitacionID]);
      OpenQueryEx(sdqSeguimientoDatos, [FLicitacionID]);

    	MessageDlg('El número de licitación generado es: ' + IntToStr(FLicitacionID), mtInformation, [mbOK], 0)
    end
    else
    	MsgBox('La operación se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
	except
  	on E: Exception do
    begin
    	RollBack;
      ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;

procedure TfrmGestion.DoGuardaSeguimiento;
var
  iSeguimientoId: Integer;
  sSqlTrans: TSql;
begin
  iSeguimientoId := 0;

  sSqlTrans := TSQL.Create('ALS_LICITACIONSEGUIMIENTO');
  try
    case FOperacionSeguimiento of
      fsAgregar:
      begin
        iSeguimientoId := GetSecNextVal('SEQ_ALS_ID');

        sSqlTrans.Fields.Add('LS_FECHAALTA', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LS_USUALTA', 	 Sesion.UserId);
        sSqlTrans.SqlType := stInsert;
      end;
      fsModificar:
      begin
        iSeguimientoId := sdqSeguimientoDatos.FieldByName('LS_ID').AsInteger;

        sSqlTrans.Fields.Add('LS_FECHAMODIF', SQL_ACTUALDATE, False);
        sSqlTrans.Fields.Add('LS_USUMODIF', 	Sesion.UserId);
        sSqlTrans.SqlType := stUpdate;
      end;
    end;
    sSqlTrans.PrimaryKey.Add('LS_ID', 				iSeguimientoId, False);
    sSqlTrans.Fields.Add('LS_FECHARESPUESTA', edSeguimientoFechaRespuesta.Date);
    sSqlTrans.Fields.Add('LS_FECHASOLICITUD', edSeguimientoFechaSolicitud.Date);
    sSqlTrans.Fields.Add('LS_IDLICITACION', 	FLicitacionID);
    sSqlTrans.Fields.Add('LS_IDSECTOR', 			fraSeguimientoSector.Value, False);
    sSqlTrans.Fields.Add('LS_MAIL', 					edSeguimientoEmail.Text);
    sSqlTrans.Fields.Add('LS_MOTIVO', 				edSeguimientoMotivo.Text);
    sSqlTrans.Fields.Add('LS_RESPONSABLE', 		fraSeguimientoResponsable.Value, False);
    sSqlTrans.Fields.Add('LS_RESULTADO', 			edSeguimientoResultado.Text);
    try
      EjecutarSQLST(sSqlTrans.Sql);
      sdqSeguimientoDatos.Close;
      OpenQueryEx(sdqSeguimientoDatos, [FLicitacionID]);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmGestion.Editar(const aLicitacionId: Integer);
begin
	FLicitacionID := aLicitacionId;
	FOperacion := fsModificar;
  pcMasDatos.Visible := True;
  tbMainExpediente.Enabled := True;

  DoCargaLicitacion;

  OpenQueryEx(sdqContratacionDatos, [FLicitacionID]);
  OpenQueryEx(sdqFinalDatos, [FLicitacionID]);
  OpenQueryEx(sdqSeguimientoDatos, [FLicitacionID]);

//	FormStyle := fsMDIChild;
end;

procedure TfrmGestion.EnablePrincipalControls;
begin
	cbDirectoIndirecto.Enabled := rbPresentacion.Checked;
	if not cbDirectoIndirecto.Enabled then
  	cbDirectoIndirecto.ItemIndex := -1;

  edComision.Enabled := (Copy(cbDirectoIndirecto.Text, 1, 1) = 'I');
  if not edComision.Enabled then
  	edComision.Clear;

  fraCanal.Enabled := edComision.Enabled;
  if not fraCanal.Enabled then
  	fraCanal.Clear;

 	fraMotivo.Enabled := rbNoPresentacion.Checked;
	if not fraMotivo.Enabled then
  	fraMotivo.Clear;
end;

procedure TfrmGestion.Exportar(aBtn: TToolButton; aExpDia: TExportDialog; aGrid: TArtDBGrid; aQuery: TSDQuery);
var
  aAutoCols: Boolean;
begin
  if aQuery.Active and (not aQuery.IsEmpty) then
  begin
     aBtn.Enabled := False;
     try
       aAutoCols := (aExpDia.Fields.Count = 0);
       try
         if aAutoCols Then
           aExpDia.Fields.Assign(aGrid.Columns);

         aExpDia.Execute;
       finally
         if aAutoCols Then
            aExpDia.Fields.Clear;
       end;
     finally
       aBtn.Enabled := True;
     end;
  end;
end;

procedure TfrmGestion.PrintResults(const aTitulo: String; aGrid: TArtDBGrid; aDataSet: TDataSet);
var
	AutoCols: Boolean;
begin
	if Assigned(QueryPrint) and aDataSet.Active and (not aDataSet.IsEmpty) and PrintDialog.Execute then
  begin
  	QueryPrint.DataSource := aGrid.DataSource;
    QueryPrint.Title.Text := aTitulo;

		AutoCols := (QueryPrint.Fields.Count = 0);
    try
    	if AutoCols then
      	QueryPrint.SetGridColumns(aGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);

      if QueryPrint.Title.Text = '' then
      	QueryPrint.Title.Text := Caption;

      QueryPrint.Print;
    finally
    	if AutoCols then
      	QueryPrint.Fields.Clear;
    end;
  end;
end;

procedure TfrmGestion.SeleccionContratacion;
begin
  FOperacionContratacion := fsModificar;

  with sdqContratacionDatos do
  begin
  	edContratacionEmail.Text := FieldByName('LC_MAIL').AsString;
  	edContratacionObligacion.Text := FieldByName('LC_OBLIGACION').AsString;
  	fraContratacionSector.Value := FieldByName('LC_IDSECTOR').AsInteger;
    fraContratacionResponsable.Value := FieldByName('LC_RESPONSABLE').AsInteger;
  end;
end;

procedure TfrmGestion.SeleccionFinal;
begin
  FOperacionFinal := fsModificar;

  with sdqFinalDatos do
  begin
		edFinalFijo.Value := FieldByName('LR_VALORFIJO').AsFloat;
    edFinalVariable.Value := FieldByName('LR_VALORVARIABLE').AsFloat;
		fraFinalSector.Value := FieldByName('LR_IDART').AsInteger;
  end;
end;

procedure TfrmGestion.SeleccionSeguimiento;
begin
  FOperacionSeguimiento := fsModificar;

  with sdqSeguimientoDatos do
  begin
  	edSeguimientoEmail.Text := FieldByName('LS_MAIL').AsString;
  	edSeguimientoFechaRespuesta.Date := FieldByName('LS_FECHARESPUESTA').AsDateTime;
  	edSeguimientoFechaSolicitud.Date := FieldByName('LS_FECHASOLICITUD').AsDateTime;
    edSeguimientoMotivo.Text := FieldByName('LS_MOTIVO').AsString;
    edSeguimientoResultado.Text := FieldByName('LS_RESULTADO').AsString;
    fraSeguimientoResponsable.Value := FieldByName('LS_RESPONSABLE').AsInteger;
		fraSeguimientoSector.Value := FieldByName('LS_IDSECTOR').AsInteger;
  end;
end;

procedure TfrmGestion.FormCreate(Sender: TObject);
begin
	ClearControls;

	// Frame ART..
  fraART.TableName      := 'AAR_ART';
  fraART.FieldCodigo    := 'AR_ID';
  fraART.FieldDesc      := 'AR_NOMBRE';
  fraART.FieldID        := 'AR_ID';
  fraART.ShowBajas      := False;

	// Frame Delegación..
  fraDelegacion.TableName      := 'DEL_DELEGACION';
  fraDelegacion.FieldCodigo    := 'EL_ID';
  fraDelegacion.FieldDesc      := 'EL_NOMBRE';
  fraDelegacion.FieldID        := 'EL_ID';
  fraDelegacion.ShowBajas      := False;

	// Frame Estado..
  fraEstado.Clave := 'ESTLI';

	// Frame Sector..
  fraSector.Clave := 'LISEC';


  // ***  PRINCIPAL  ***
  // Frame Canales..
  fraCanal.TableName      := 'ACA_CANAL';
  fraCanal.FieldCodigo    := 'CA_CODIGO';
  fraCanal.FieldDesc      := 'CA_DESCRIPCION';
  fraCanal.FieldID        := 'CA_ID';
  fraCanal.ShowBajas      := False;

  // Frame Motivo..
	fraMotivo.Clave := 'NOPRE';


  // ***  SEGUIMIENTO  ***
  // Frame Sector..
  fraSeguimientoSector.TableName      := 'USC_SECTORES';
  fraSeguimientoSector.FieldCodigo    := 'SC_CODIGO';
  fraSeguimientoSector.FieldDesc      := 'SC_DESCRIPCION';
  fraSeguimientoSector.FieldID        := 'SC_ID';
  fraSeguimientoSector.ShowBajas      := False;

  // Frame Responsable..
  fraSeguimientoResponsable.TableName      := 'USE_USUARIOS';
  fraSeguimientoResponsable.FieldCodigo    := 'SE_USUARIO';
  fraSeguimientoResponsable.FieldDesc      := 'SE_NOMBRE';
  fraSeguimientoResponsable.FieldID        := 'SE_ID';
  fraSeguimientoResponsable.ShowBajas      := False;


  // ***  FINAL  ***
	// Frame ART..
  fraFinalSector.TableName      := 'AAR_ART';
  fraFinalSector.FieldCodigo    := 'AR_ID';
  fraFinalSector.FieldDesc      := 'AR_NOMBRE';
  fraFinalSector.FieldID        := 'AR_ID';
  fraFinalSector.ShowBajas      := False;


  // ***  ADJUDICACIÓN  ***
	// Frame Adjudicación..
  fraAdjudicacion.TableName      := 'AAR_ART';
  fraAdjudicacion.FieldCodigo    := 'AR_ID';
  fraAdjudicacion.FieldDesc      := 'AR_NOMBRE';
  fraAdjudicacion.FieldID        := 'AR_ID';
  fraAdjudicacion.ShowBajas      := False;

  // Frame Motivo..
	fraMotivoAdjudicacion.Clave := 'MADJU';


  // ***  CONTRATACIÓN  ***
  // Frame Sector..
  fraContratacionSector.TableName      := 'USC_SECTORES';
  fraContratacionSector.FieldCodigo    := 'SC_CODIGO';
  fraContratacionSector.FieldDesc      := 'SC_DESCRIPCION';
  fraContratacionSector.FieldID        := 'SC_ID';
  fraContratacionSector.ShowBajas      := False;

  // Frame Responsable..
  fraContratacionResponsable.TableName   := 'USE_USUARIOS';
  fraContratacionResponsable.FieldCodigo := 'SE_USUARIO';
  fraContratacionResponsable.FieldDesc   := 'SE_NOMBRE';
  fraContratacionResponsable.FieldID     := 'SE_ID';
  fraContratacionResponsable.ShowBajas   := False;

  BeginTrans;
end;

procedure TfrmGestion.tblLimpiarClick(Sender: TObject);
begin
	ClearControls;
end;

procedure TfrmGestion.tbMainGuardarClick(Sender: TObject);
begin
	if IsValidar then
		DoGuardaLicitacion;
end;

procedure TfrmGestion.tbMainSalirClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmGestion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	sdqSeguimientoDatos.Close;
	Rollback(True);
  Action := caFree;
  frmGestion := nil;
end;

procedure TfrmGestion.rbPresentacionClick(Sender: TObject);
begin
	EnablePrincipalControls;
end;

procedure TfrmGestion.rbNoPresentacionClick(Sender: TObject);
begin
	EnablePrincipalControls;
end;

procedure TfrmGestion.checkPliegoSinCostoClick(Sender: TObject);
begin
	edCostoPliego.Enabled := not checkPliegoSinCosto.Checked;
  edCostoPliego.Clear;
end;

procedure TfrmGestion.cbDirectoIndirectoChange(Sender: TObject);
begin
	edComision.Enabled := (Copy(cbDirectoIndirecto.Text, 1, 1) = 'I');
  if not edComision.Enabled then
  	edComision.Clear;

  fraCanal.Enabled := edComision.Enabled;
  if not fraCanal.Enabled then
  begin
  	fraCanal.Clear;
    fraCanalExit(nil);
  end;
end;

procedure TfrmGestion.tlbNuevoClick(Sender: TObject);
begin
  FOperacionSeguimiento := fsAgregar;

  ClearSeguimiento;
end;

procedure TfrmGestion.sdqSeguimientoDatosAfterScroll(DataSet: TDataSet);
begin
	SeleccionSeguimiento;
end;

procedure TfrmGestion.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
	Highlight: Boolean);
begin
  if not sdqSeguimientoDatos.FieldByName('LS_FECHABAJA').IsNull then
		AFont.Color := Math.IfThen(Highlight, clBtnFace, clRed);
end;

procedure TfrmGestion.tlbGuardarClick(Sender: TObject);
begin
  if FOperacionSeguimiento = fsModificar then
  begin
    if (not sdqSeguimientoDatos.IsEmpty) and (not sdqSeguimientoDatos.FieldByName('LS_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;
  end;

  if IsValidarSeguimiento then
    DoGuardaSeguimiento;
end;

procedure TfrmGestion.tlbBajaClick(Sender: TObject);
var
  sSqlTrans: TSql;
begin
  if FOperacionSeguimiento = fsModificar then
  begin
    if (not sdqSeguimientoDatos.IsEmpty) and (not sdqSeguimientoDatos.FieldByName('LS_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

    if not sdqSeguimientoDatos.IsEmpty then
    begin
      if MsgAsk('¿Esta Ud. seguro que quiere borrar este registro?') then
      begin
        sSqlTrans := TSQL.Create('ALS_LICITACIONSEGUIMIENTO');
        try
          sSqlTrans.PrimaryKey.Add('LS_ID', sdqSeguimientoDatos.FieldByName('LS_ID').AsInteger, False);
          sSqlTrans.Fields.Add('LS_FECHABAJA', SQL_ACTUALDATE, False);
          sSqlTrans.Fields.Add('LS_USUBAJA', Sesion.UserId);
          sSqlTrans.SqlType := stUpdate;
          try
            EjecutarSQLST(sSqlTrans.Sql);
            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqSeguimientoDatos.Close;
            OpenQueryEx(sdqSeguimientoDatos, [FLicitacionID]);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          sSqlTrans.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmGestion.ToolButton6Click(Sender: TObject);
begin
  FOperacionFinal := fsAgregar;

  ClearFinal;
end;

procedure TfrmGestion.ToolButton10Click(Sender: TObject);
begin
  if FOperacionFinal = fsModificar then
  begin
    if (not sdqFinalDatos.IsEmpty) and (not sdqFinalDatos.FieldByName('LR_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;
  end;

  if IsValidarFinal then
    DoGuardaFinal;
end;

procedure TfrmGestion.ToolButton11Click(Sender: TObject);
var
  sSqlTrans: TSql;
begin
  if FOperacionFinal = fsModificar then
  begin
    if (not sdqFinalDatos.IsEmpty) and (not sdqFinalDatos.FieldByName('LR_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

    if not sdqFinalDatos.IsEmpty then
    begin
      if MsgAsk('¿Esta Ud. seguro que quiere borrar este registro?') then
      begin
        sSqlTrans := TSQL.Create('ALR_LICITACIONRESULTADO');
        try
          sSqlTrans.PrimaryKey.Add('LR_ID', sdqFinalDatos.FieldByName('LR_ID').AsInteger, False);
          sSqlTrans.Fields.Add('LR_FECHABAJA', SQL_ACTUALDATE, False);
          sSqlTrans.Fields.Add('LR_USUBAJA', Sesion.UserId);
          sSqlTrans.SqlType := stUpdate;
          try
            EjecutarSQLST(sSqlTrans.Sql);
            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqFinalDatos.Close;
            OpenQueryEx(sdqFinalDatos, [FLicitacionID]);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          sSqlTrans.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmGestion.dbgridFinalGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
	Highlight: Boolean);
begin
  if not sdqFinalDatos.FieldByName('LR_FECHABAJA').IsNull then
		AFont.Color := Math.IfThen(Highlight, clBtnFace, clRed);
end;

procedure TfrmGestion.sdqFinalDatosAfterScroll(DataSet: TDataSet);
begin
	SeleccionFinal;
end;

procedure TfrmGestion.rbContratacionSiClick(Sender: TObject);
begin
	edContratacionCondiciones.Enabled := rbContratacionSi.Checked;
  if not edContratacionCondiciones.Enabled then
  	edContratacionCondiciones.Clear;
end;

procedure TfrmGestion.ToolButton16Click(Sender: TObject);
begin
  FOperacionContratacion := fsAgregar;

  ClearContratacion;
end;

procedure TfrmGestion.ToolButton18Click(Sender: TObject);
begin
  if FOperacionContratacion = fsModificar then
  begin
    if (not sdqContratacionDatos.IsEmpty) and (not sdqContratacionDatos.FieldByName('LC_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;
  end;

  if IsValidarContratacion then
    DoGuardaContratacion;
end;

procedure TfrmGestion.ToolButton19Click(Sender: TObject);
var
  sSqlTrans: TSql;
begin
  if FOperacionContratacion = fsModificar then
  begin
    if (not sdqContratacionDatos.IsEmpty) and (not sdqContratacionDatos.FieldByName('LC_FECHABAJA').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

    if not sdqContratacionDatos.IsEmpty then
    begin
      if MsgAsk('¿Esta Ud. seguro que quiere borrar este registro?') then
      begin
        sSqlTrans := TSQL.Create('ALC_LICITACIONCONTRATACION');
        try
          sSqlTrans.PrimaryKey.Add('LC_ID', sdqContratacionDatos.FieldByName('LC_ID').AsInteger, False);
          sSqlTrans.Fields.Add('LC_FECHABAJA', SQL_ACTUALDATE, False);
          sSqlTrans.Fields.Add('LC_USUBAJA', Sesion.UserId);
          sSqlTrans.SqlType := stUpdate;
          try
            EjecutarSQLST(sSqlTrans.Sql);
            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqContratacionDatos.Close;
            OpenQueryEx(sdqContratacionDatos, [FLicitacionID]);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          sSqlTrans.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmGestion.dbgrtidContratacionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
	Highlight: Boolean);
begin
  if not sdqContratacionDatos.FieldByName('LC_FECHABAJA').IsNull then
		AFont.Color := Math.IfThen(Highlight, clBtnFace, clRed);
end;

procedure TfrmGestion.sdqContratacionDatosAfterScroll(DataSet: TDataSet);
begin
	SeleccionContratacion;
end;

procedure TfrmGestion.CalcularCosto(Sender: TObject);
var
	iCostoMensual: Real;
begin
	iCostoMensual := 0;
	if edCapitas.Value > 0 then
//		iCostoMensual := edMasaSalarial.Value / edCapitas.Value * (edVariable.Value / 100) +  edFijo.Value;
		iCostoMensual := (edMasaSalarial.Value * edVariable.Value / 100) + (edCapitas.Value * edFijo.Value);

	if (edFijo.Value = 0) or (edVariable.Value = 0) then
  begin
  	edCostoEmpleado.Value := 0;
    edCostoMensual.Value := 0;
    edCostoAnual.Value := 0;
  end
  else
  begin
  	edCostoEmpleado.Value := iCostoMensual / edCapitas.Value;
    edCostoMensual.Value := iCostoMensual;
    edCostoAnual.Value := iCostoMensual * 13;
  end;
end;

procedure TfrmGestion.tbMainExpedienteClick(Sender: TObject);
begin
	FRutaPliegos := edRutaPliegos.Text;
	if not (fpPliegos.ShowModal = mrOk) then
  	edRutaPliegos.Text := FRutaPliegos;
end;

procedure TfrmGestion.btnSeleccionarRutaPliegosClick(Sender: TObject);
var
  sDir: String;
begin
	sDir := edRutaPliegos.Text;
  if SelectDirectory(sDir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
    edRutaPliegos.Text := sDir;
end;

procedure TfrmGestion.btnVerPliegosClick(Sender: TObject);
begin
	Application.CreateForm(TfrmVisualizaPliegos, frmVisualizaPliegos);
	try
  	frmVisualizaPliegos.Mostrar(edRutaPliegos.Text);
  finally
  	FreeAndNil(frmVisualizaPliegos);
  end;
end;

procedure TfrmGestion.fraSeguimientoResponsableedCodigoExit(Sender: TObject);
var
	sEmail: String;
	sSql: String;
begin
	if edSeguimientoEmail.Text = '' then
  begin
    sSql := 'SELECT SE_MAIL FROM USE_USUARIOS WHERE SE_ID = ' + SqlValue(fraSeguimientoResponsable.Value);
    sEmail := ValorSql(sSql);
    if sEmail <> '' then
      edSeguimientoEmail.Text := sEmail + '@provart.com.ar';
  end;
end;

procedure TfrmGestion.fraSeguimientoSectoredCodigoExit(Sender: TObject);
begin
	if fraSeguimientoSector.Value = 0 then
  	fraSeguimientoResponsable.ExtraCondition := ''
  else
		fraSeguimientoResponsable.ExtraCondition := ' AND SE_IDSECTOR = ' + IntToStr(fraSeguimientoSector.Value);
end;

procedure TfrmGestion.tbLimpiarClick(Sender: TObject);
begin
	case TWinControl(Sender).Tag of
  	1:	ClearSeguimiento;
    2:	ClearFinal;
    3:	ClearContratacion;
  end;
end;

procedure TfrmGestion.tbOrdenarClick(Sender: TObject);
begin
	case TWinControl(Sender).Tag of
  	1:
    	begin
        LoadDynamicSortFields(SortDialogSeguimiento.SortFields, ArtDBGrid.Columns);
        SortDialogSeguimiento.Execute;
      end;
  	2:
    	begin
        LoadDynamicSortFields(SortDialogFinal.SortFields, dbgridFinal.Columns);
        SortDialogFinal.Execute;
      end;
  	3:
    	begin
        LoadDynamicSortFields(SortDialogContratacion.SortFields, dbgrtidContratacion.Columns);
        SortDialogContratacion.Execute;
      end;
  end;
end;

procedure TfrmGestion.tbExportarClick(Sender: TObject);
begin
	case TWinControl(Sender).Tag of
  	1:	Exportar(tbSeguimientoExportar, ExportDialogSeguimiento, ArtDBGrid, sdqSeguimientoDatos);
    2:	Exportar(tbFinalExportar, ExportDialogFinal, dbgridFinal, sdqFinalDatos);
    3:	Exportar(tbContratacionExportar, ExportDialogContratacion, dbgrtidContratacion, sdqContratacionDatos);
  end;
end;

procedure TfrmGestion.tbMostrarClick(Sender: TObject);
begin
	case TWinControl(Sender).Tag of
  	1:	FieldHiderSeguimiento.Execute;
    2:	FieldHiderFinal.Execute;
    3:	FieldHiderContratacion.Execute;
  end;
end;

procedure TfrmGestion.fraContratacionResponsableedCodigoExit(Sender: TObject);
var
	sEmail: String;
	sSql: String;
begin
	if edContratacionEmail.Text = '' then
  begin
  	sSql := 'SELECT SE_MAIL FROM USE_USUARIOS WHERE SE_ID = ' + SqlValue(fraContratacionResponsable.Value);
    sEmail := ValorSql(sSql);
    if sEmail <> '' then
  		edContratacionEmail.Text := sEmail + '@provart.com.ar';
  end;
end;

procedure TfrmGestion.fraContratacionSectoredCodigoExit(Sender: TObject);
begin
	if fraContratacionSector.Value = 0 then
  	fraContratacionResponsable.ExtraCondition := ''
  else
		fraContratacionResponsable.ExtraCondition := ' AND SE_IDSECTOR = ' + IntToStr(fraContratacionSector.Value);
end;

procedure TfrmGestion.edTarifaFijaKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = '.' then
  	Key := ',';
end;

procedure TfrmGestion.CalcularCostoPorEmpleado(Sender: TObject);
begin
	edCostoPorEmpleado.Value := edTarifaFija.Value + ((edTarifaVariable.Value * edTarifaFija.Value) / 100);
end;

procedure TfrmGestion.fraCanalExit(Sender: TObject);
begin
  fraCanal.FrameExit(Sender);

  lbBroker.Visible := (fraCanal.edCodigo.Text = '006');
  edBroker.Visible := lbBroker.Visible;
  if not edBroker.Visible then
  	edBroker.Clear;
end;

procedure TfrmGestion.tbImprimirClick(Sender: TObject);
var
	aTitulo: String;
begin
	aTitulo := 'Licitación Nº ' + edNumeroLicitacion.Text;
  
	case TWinControl(Sender).Tag of
  	1:	PrintResults(aTitulo + ' - Seguimiento', ArtDBGrid, ArtDBGrid.DataSource.DataSet);
    2:	PrintResults(aTitulo + ' - Final', dbgridFinal, dbgridFinal.DataSource.DataSet);
    3:	PrintResults(aTitulo + ' - Contratación', dbgrtidContratacion, dbgrtidContratacion.DataSource.DataSet);
  end;
end;

end.
