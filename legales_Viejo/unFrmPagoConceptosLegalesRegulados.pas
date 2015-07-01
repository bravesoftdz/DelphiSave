unit unFrmPagoConceptosLegalesRegulados;

{-----------------------------------------------------------------------------
 Unit Name: unFrmPagoConceptosLegalesRegulados
 Author:    RACastro
 Date:      23-May-2006
 Purpose:   Registra los pagos (liquidaciones) asociados a un juicio,
            independiente de la instancia del juicio
 History:
-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Mask, StdCtrls, PatternEdit,
  CurrEdit, ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcionExt, ExtCtrls, DB, SDEngine,
  unFraCodigoDescripcion, unDmLegales, ExComboBox, Grids, DBGrids, Placemnt, JvExForms, JvClipboardViewer,
  unArtDBAwareFrame, Buttons;

type
  TBeneficiario = record
    FId    : Integer;
    FNombre: String;
  end;

  TfrmPagoConceptosLegalesRegulados = class(TForm)
    bvSeparadorBotones: TBevel;
    btnAceptarPago: TButton;
    btnCancelarPago: TButton;
    lblFechaFacturaPago: TLabel;
    lblNroFactura: TLabel;
    lblDetalleFacturaPago: TLabel;
    lblImporteSinRetGanaciasPago: TLabel;
    lblImpSujetoaRetGanaciasPago: TLabel;
    Bevel10: TBevel;
    edFechaFacturaPago: TDateComboBox;
    edObservaciones: TEdit;
    edImpSinRetencionesGanPagos: TCurrencyEdit;
    edImpSujetoaRetGanaciasPago: TCurrencyEdit;
    sdqPeritosDisponibles: TSDQuery;
    pnConceptos: TPanel;
    lblNroCuenta: TLabel;
    lblTipoBeneficiario: TLabel;
    lblBeneficiario: TLabel;
    fraConceptoPago: TfraCodigoDescripcionExt;
    edNroCuentaImputacionPago: TPatternEdit;
    fraTipoBeneficiario: TfraCodigoDescripcionExt;
    lblFechaVencimiento: TLabel;
    dcbFechaVencimientoPago: TDateComboBox;
    Label1: TLabel;
    peDescripcionBeneficiario: TPatternEdit;
    sdqJuzgadosDisponibles: TSDQuery;
    cmbBeneficiarios: TComboBox;
    FormStorage1: TFormStorage;
    Label2: TLabel;
    Label3: TLabel;
    lblConceptoPago: TLabel;
    sdqAbogadosDisponibles: TSDQuery;
    pnlFactura: TPanel;
    peLetraFactura: TPatternEdit;
    meSituacionFactura: TMaskEdit;
    meNumeroFactura: TMaskEdit;
    btnBuscarEmbargo: TBitBtn;
    Label7: TLabel;
    edEmbargo: TCurrencyEdit;
    Label8: TLabel;
    edRecursoExtraord: TCurrencyEdit;
    btnBuscarJuicio: TBitBtn;
    lbFechaRecepcionFactura: TLabel;
    edFechaRecepcionFactura: TDateComboBox;
    chkPagoExclusivo: TCheckBox;
    fraInteresesInstancias: TfraCodigoDescripcionExt;
    lbIntereses: TLabel;
    procedure btnAceptarPagoClick(Sender: TObject);
    procedure btnCancelarPagoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure xxClick(Sender: TObject);
    procedure cmbBeneficiariosClick(Sender: TObject);
    procedure meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarEmbargoClick(Sender: TObject);
    procedure btnBuscarJuicioClick(Sender: TObject);
  private
    FIdJuicioEnTramite: Integer;
    FExtraconditionTipoBeneficiario : String;
    FIdPago: Integer;
    FModoPago: TModoEjecucion;
    FNumPago: Integer;
    FDuplicado : String;
    FExtraConditionConceptoPago : String;
    function ObtenerDatosBeneficiario(ATipoBeneficiario, AIdBeneficiario: Integer): TBeneficiario;

    procedure CargarDatosPago(Campos: TFields);
    procedure GuardarPago;
    procedure IncluirBeneficiario(AIdBeneficiario: Integer; ABeneficiario: String);
    procedure Init;
    procedure LimpiarCamposPago;
    procedure OnConceptoPagoChange(Sender: TObject);
    procedure OnTipoBeneficiarioChange(Sender: TObject);
  public
    procedure ModoParteActora;
    procedure ModoParteDemandada;
    procedure AltaPago(AIdJuicioEnTramite: Integer);
    procedure ModificacionPago(ASdqPagoLegal: TSDQuery);
  end;

var
  frmPagoConceptosLegalesRegulados: TfrmPagoConceptosLegalesRegulados;

implementation

{$R *.dfm}

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs, unPrincipal, DateUtils, unSesion,
  MaskUtils, UnRptLiquidacion, unBuscarEmbargo, unBuscarJuicio, VCLExtra, unComunes, Numeros,unMoldeEnvioMail,
  unLegales, General;

//********************  PAGOS ***************************************************/
procedure TfrmPagoConceptosLegalesRegulados.AltaPago(AIdJuicioEnTramite: Integer);
begin
  FIdJuicioEnTramite := AIdJuicioEnTramite;
  LimpiarCamposPago;
  FModoPago := meAlta;
  pnConceptos.Enabled := True;
  VCLExtra.LockControls([edEmbargo, btnBuscarEmbargo, edRecursoExtraord, btnBuscarJuicio], False);
  vclextra.LockControls([fraInteresesInstancias], True);
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND cp_fbaja IS NULL ';
  fraTipoBeneficiario.ExtraCondition := ' ' +FExtraconditionTipoBeneficiario;

  Self.ShowModal;
end;

procedure TfrmPagoConceptosLegalesRegulados.ModificacionPago(ASdqPagoLegal: TSDQuery);
begin
  if ASdqPagoLegal.RecordCount > 0 then
  begin
    LimpiarCamposPago;
    FModoPago := meModificacion;
    FIdPago := ASdqPagoLegal.FieldByName('pl_id').AsInteger;
    FIdJuicioEnTramite := ASdqPagoLegal.FieldByName('pl_idjuicioentramite').AsInteger;
    FDuplicado := ASdqPagoLegal.FieldByName('pl_duplicado').AsString;
    CargarDatosPago(ASdqPagoLegal.Fields);

    VCLExtra.LockControls([edEmbargo, btnBuscarEmbargo, edRecursoExtraord, btnBuscarJuicio]);

    pnConceptos.Enabled := False;
    self.ShowModal;
    ASdqPagoLegal.Refresh;
  end;
end;

procedure TfrmPagoConceptosLegalesRegulados.Init;
begin
  FNumPago := 0;

  with fraInteresesInstancias do
  begin
    TableName   := 'legales.lii_interesesinstancia';
    FieldID     := 'ii_id';
    FieldCodigo := 'ii_id';
    FieldDesc   := 'ii_descripcion';
    FieldBaja   := 'ii_fechabaja';
    Showbajas   := False;
  end;

  with fraConceptoPago  do
  begin
    TableName 		 := 'scp_conpago';
    fieldid 		   := 'cp_conpago';
    FieldCodigo 	 := 'cp_conpago';
    FieldDesc 		 := 'cp_denpago';
    ExtraFields 	 := ', cp_ctapago, cp_retencion ';
    FieldBaja   := 'cp_fbaja';
    Showbajas   := true;

    OnExit 				 := OnConceptoPagoChange;
    OnChange 			 := OnConceptoPagoChange;
    CheckSintax;
  end;

  with fraTipoBeneficiario  do
  begin
    TableName 				 := 'legales.lbp_beneficiariopago';
    //ExtraTableNameList := 'legales.lbc_beneficiarioconceptopago';
    //ExtraJoinCondition := 'bp_id = bc_idbeneficiariopago';
    fieldid 					 := 'bp_id';
    FieldCodigo 			 := 'bp_id';
    FieldDesc 				 := 'bp_descripcion';
    //ExtraCondition 		 := ' AND bc_conpago IS NULL ';
    OnChange 					 := OnTipoBeneficiarioChange;
    CheckSintax;
  end;

end;

procedure TfrmPagoConceptosLegalesRegulados.OnConceptoPagoChange(Sender : TObject);
var
  descripcion : String;
begin
  if fraConceptoPago.IsSelected then
  begin
    edNroCuentaImputacionPago.Text := fraConceptoPago.sdqDatos.FieldByName('CP_CTAPAGO').AsString;

    with fraTipoBeneficiario  do
    begin
      Limpiar;
      cmbBeneficiarios.Clear;
      peDescripcionBeneficiario.Clear;
      ExtraCondition := ''+FExtraconditionTipoBeneficiario;
      //ExtraCondition := ' AND bc_conpago = ' + fraConceptoPago.Codigo + ' ';
      Reload;
    end;

    descripcion := ValorSql(
      ' SELECT cp_descripcion '+
      '   FROM art.scp_conpago '+
      '  WHERE cp_conpago = '+SqlValue(fraConceptoPago.Codigo));
    if descripcion <> '' then
      InvalidMsg(lblConceptoPago,descripcion,'Descripción Pago');
    if descripcion <> '(Tasa: Activa-Pasiva-Mixta-Específica)' then
    begin
      vclextra.LockControls([fraInteresesInstancias], True);
      fraInteresesInstancias.Clear;
    end
    else
    begin
      vclextra.LockControls([fraInteresesInstancias], False);
    end;


  end
  else
  begin
    edNroCuentaImputacionPago.Text := '';

    with fraTipoBeneficiario do
    begin
      Limpiar;
      cmbBeneficiarios.Clear;
      peDescripcionBeneficiario.Clear;
      ExtraCondition := ''+FExtraconditionTipoBeneficiario; //' AND bc_conpago is Null ' 
      Reload;
    end;
  end;

end;

procedure TfrmPagoConceptosLegalesRegulados.OnTipoBeneficiarioChange(Sender: TObject);
var
	TipoBeneficiario: Integer;
begin
  if fraTipoBeneficiario.IsSelected then
  begin
    TipoBeneficiario := strtoint(fraTipoBeneficiario.Codigo);
    case TipoBeneficiario of
      1:
      begin
      	try
          sdqJuzgadosDisponibles.ParamByName('IdJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          sdqJuzgadosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqJuzgadosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqJuzgadosDisponibles.FieldByName('jz_id').AsInteger,
                                sdqJuzgadosDisponibles.FieldByName('nombre').AsString);
            sdqJuzgadosDisponibles.Next;
          end;
        finally
          sdqJuzgadosDisponibles.Close;
        end;
      end;

      3:
      begin
        try
          sdqPeritosDisponibles.ParamByName('IdJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          sdqPeritosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqPeritosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqPeritosDisponibles.FieldByName('pe_id').AsInteger,
                                sdqPeritosDisponibles.FieldByName('pe_nombre').AsString);
           	sdqPeritosDisponibles.Next;
          end;
        finally
          sdqPeritosDisponibles.Close;
        end;
      end;

      5:
      begin // Abogados propios
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT a.bo_id, a.bo_nombre' +
             ' FROM legales.laa_abogadoasignado aa, legales.lbo_abogado a' +
            ' WHERE aa.aa_idabogado = a.bo_id' +
 	            ' AND aa.aa_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
   	          ' AND a.bo_parte = ''P'''
          );
          sdqAbogadosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqAbogadosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqAbogadosDisponibles.FieldByName('bo_id').AsInteger,
                                sdqAbogadosDisponibles.FieldByName('bo_nombre').AsString);
           	sdqAbogadosDisponibles.Next;
          end;
        finally
          sdqAbogadosDisponibles.Close;
        end;
      end;

      7:
      begin // Abogados oponentes
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT a.bo_id, a.bo_nombre' +
             ' FROM legales.lod_origendemanda o, legales.lbo_abogado a' +
            ' WHERE o.od_idabogado = a.bo_id' +
              ' AND o.od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) + 
              ' AND a.bo_parte = ''O'''
          );
          sdqAbogadosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqAbogadosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqAbogadosDisponibles.FieldByName('bo_id').AsInteger,
                                sdqAbogadosDisponibles.FieldByName('bo_nombre').AsString);
           	sdqAbogadosDisponibles.Next;
          end;
        finally
          sdqAbogadosDisponibles.Close;
        end;
      end;

      8:
      begin // Abogados mediación
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT a.bo_id, a.bo_nombre' +
             ' FROM legales.lod_origendemanda o, legales.lbo_abogado a' +
            ' WHERE o.od_idabogado = a.bo_id' +
 	            ' AND o.od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
   	          ' AND a.bo_parte = ''M'''
          );
          sdqAbogadosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqAbogadosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqAbogadosDisponibles.FieldByName('bo_id').AsInteger,
                                sdqAbogadosDisponibles.FieldByName('bo_nombre').AsString);
           	sdqAbogadosDisponibles.Next;
          end;
        finally
          sdqAbogadosDisponibles.Close;
        end;
      end;
    end;
  end;
end;

procedure TfrmPagoConceptosLegalesRegulados.LimpiarCamposPago;
begin
  fraConceptoPago.Limpiar;
  fraTipoBeneficiario.Limpiar;
  cmbBeneficiarios.Clear;
  peDescripcionBeneficiario.Clear;

  edNroCuentaImputacionPago.Text := '';

  edImpSujetoaRetGanaciasPago.Clear;
  edImpSinRetencionesGanPagos.Clear;

  edEmbargo.Clear;
  edEmbargo.Tag := 0;

  edRecursoExtraord.Clear;
  edRecursoExtraord.Tag := 0;

  fraInteresesInstancias.Clear;
end;

procedure TfrmPagoConceptosLegalesRegulados.CargarDatosPago(Campos: TFields);
begin
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND (cp_fbaja IS NULL OR cp_conpago = '+
                                        Campos.FieldByName('pl_conpago').AsString+') ';
  fraTipoBeneficiario.ExtraCondition := ''+FExtraconditionTipoBeneficiario;//' AND bc_conpago IS NULL '  
  fraConceptoPago.Codigo            := Campos.FieldByName('pl_conpago').AsString;
  OnConceptoPagoChange(self);

  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('pl_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('pl_importeconretencion').AsCurrency;

  fraTipoBeneficiario.Codigo        := Campos.FieldByName('pl_idbeneficiariopago').AsString;
  OnTipoBeneficiarioChange(Self);

  //Busco el Beneficiario. De no encontrarlo lo agrego. Me posiciono en ese.
  IncluirBeneficiario(Campos.FieldByName('pl_idbeneficiariopago').AsInteger,
  										Campos.FieldByName('pl_detallebeneficiario').AsString);
  cmbBeneficiariosClick(Self);

  FNumPago                          := Campos.FieldByName('pl_numpago').AsInteger;
  peLetraFactura.Text               := Campos.FieldByName('pl_letrafactura').AsString;
  meSituacionFactura.Text           := Campos.FieldByName('pl_situacionfactura').AsString;
  meNumeroFactura.Text              := Campos.FieldByName('pl_numerofactura').AsString;
  edFechaFacturaPago.Date           := Campos.FieldByName('pl_fechafactura').AsDateTime;
  edFechaRecepcionFactura.Date      := Campos.FieldByName('pl_fecharecepfactura').AsDateTime;
  edObservaciones.Text              := Campos.FieldByName('pl_comentario').AsString;
  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('pl_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('pl_importeconretencion').AsCurrency;
  dcbFechaVencimientoPago.Date      := Campos.FieldByName('pl_fechavencimientopago').AsDateTime;
  chkPagoExclusivo.Checked          := (Campos.FieldByName('pl_pagoexclusivo').AsString = 'S');

  if not fraInteresesInstancias.ReadOnly then
  begin
    fraInteresesInstancias.Codigo := Campos.FieldByName('pl_idintereses').AsString;
  end;
end;

procedure TfrmPagoConceptosLegalesRegulados.IncluirBeneficiario(AIdBeneficiario: Integer; ABeneficiario: String);
var
  i: Integer;
begin
	for i := 0 to cmbBeneficiarios.Items.Count - 1 do
  	if AnsiUpperCase(cmbBeneficiarios.Items[i]) = AnsiUpperCase(ABeneficiario) then
    begin
      cmbBeneficiarios.ItemIndex := i;
      Exit;
    end;

  if AnsiUpperCase(cmbBeneficiarios.Items[cmbBeneficiarios.ItemIndex]) <> AnsiUpperCase(ABeneficiario) then
  	cmbBeneficiarios.Items.AddObject(ABeneficiario, TObject(AIdBeneficiario));
end;

procedure TfrmPagoConceptosLegalesRegulados.GuardarPago;
var
	Beneficiario: TBeneficiario;
  sSqlTrans: TSql;
  eImporte1,eImporte2: Extended;
  iIndex, NumPago, idliquidacion: Integer;
 	NroFacturaCalculada: Boolean;
  sSitFactura, sSql, duplicado, sPagos, tipojuicio, ListaMail, Asunto, Body, sWhereFac : String;
begin
  if FNumPago = 0 then
    NumPago := Get_ProxNumPagoLegal(FIdJuicioEnTramite)
  else
    NumPago := FNumPago;


  if edFechaFacturaPago.IsEmpty then
  	edFechaFacturaPago.Date := DBDate;

  VerificarMultiple(['Guardando Pago',
                     fraConceptoPago,
                     fraConceptoPago.Codigo <> '',
                     'Debe completar un concepto de pago.',

                     fraTipoBeneficiario,
                     fraTipoBeneficiario.Codigo <> '',
                     'Debe completar un Tipo Beneficiario.',

                     cmbBeneficiarios,
                     trim(cmbBeneficiarios.Text) <> '',
                     'Debe especificar un beneficiario',
(*
                     peLetraFactura,
                     fraConceptoSentencia.IsSelected
                     or
                     (
                      not fraConceptoSentencia.IsSelected and
                      not IsEmptyString(peLetraFactura.Text) and
                      not IsEmptyString(meSituacionFactura.Text) and
                      not IsEmptyString(meNumeroFactura.Text)
                     ),
{
                     (FModoPago = meModificacion)
                     or
                     (
                      (not pnlFactura.Enabled) and
                      IsEmptyString(peLetraFactura.Text) and
                      IsEmptyString(meSituacionFactura.Text) and
                      IsEmptyString(meNumeroFactura.Text)
                     )
                     or
                     (
                      pnlFactura.Enabled and
                      not IsEmptyString(peLetraFactura.Text) and
                      not IsEmptyString(meSituacionFactura.Text) and
                      not IsEmptyString(meNumeroFactura.Text)
                     ),
}
                     'Debe completar todos los datos de la factura',
*)
                     edImpSujetoaRetGanaciasPago,
                     (edImpSujetoaRetGanaciasPago.Value + edImpSinRetencionesGanPagos.Value) > 0,
                     'Debe especificar un monto válido para el pago.',

                     edFechaFacturaPago,
                     edFechaFacturaPago.IsValid,
                     'Debe ingresar una fecha válida para la factura',

                     edFechaFacturaPago,
                     (edFechaFacturaPago.Date <= DBDate) and
                      not edFechaFacturaPago.IsEmpty
                     ,
(*
                     not edFechaFacturaPago.Enabled
                     or
                     (
                      edFechaFacturaPago.Enabled and
                      (edFechaFacturaPago.Date <= DBDate) and
                      not edFechaFacturaPago.IsEmpty
                     ),
*)
                     'Debe especificar una fecha de factura previa a la fecha actual.',

                     dcbFechaVencimientoPago,
                     dcbFechaVencimientoPago.IsValid,
                     'Debe ingresar una fecha válida para el vencimiento',

                     dcbFechaVencimientoPago,
                     (dcbFechaVencimientoPago.Date >= DBDate) and
                     not dcbFechaVencimientoPago.IsEmpty,
                     'No puede especificar una fecha de vencimiento posterior a la fecha actual.'
                     ]);

  Verificar((edFechaRecepcionFactura.Date = 0)and (fraConceptoPago.Codigo = '88'),
            edFechaRecepcionFactura,'Debe ingresar la fecha de recepción de factura.'
            );


	if edEmbargo.Tag > 0 then
  begin
    sSql :=
      'SELECT NVL(SUM(ae_importe * ta_operacion), 0) total' +
       ' FROM lta_tipoaplicacionembargo, lae_aplicacionembargo' +
      ' WHERE ta_id = ae_idtipoaplicacion' +
        ' AND ae_fechabaja IS NULL' +
        ' AND (   ta_generapago = ''S''' +
             ' OR ta_reintegroembargo = ''S'')' +
        ' AND ae_idembargo = :idembargo';
    eImporte1 := ValorSqlExtendedEx(sSql, [edEmbargo.Tag]);

    sSql :=
      'SELECT em_importe' +
       ' FROM lem_embargo' +
      ' WHERE em_id = :idembargo';
    eImporte2 := ValorSqlExtendedEx(sSql, [edEmbargo.Tag]);

    Verificar(ToleranceCompare2(edEmbargo.Value + eImporte1, eImporte2) > 0, edEmbargo, 'El importe aplicado no puede ser mayor al monto del embargo.');

    Verificar(ToleranceCompare2(edEmbargo.Value, edImpSujetoaRetGanaciasPago.Value + edImpSinRetencionesGanPagos.Value) > 0,
              edEmbargo, 'El importe del embargo no puede ser superior al total del pago.');
	end;

	if edRecursoExtraord.Tag > 0 then
  begin
  	sSql :=
      'SELECT NVL(SUM(ar_importe * tr_operacion), 0) total' +
       ' FROM ltr_tipoaplicacionrecext, lar_aplicacionrecursoext' +
      ' WHERE tr_id = ar_idtipoaplicacion' +
        ' AND ar_fechabaja IS NULL' +
        ' AND (   tr_generapago = ''S''' +
             ' OR tr_reintegro = ''S'')' +
        ' AND ar_idjuicio = :idjuicio';
		eImporte1 := ValorSqlExtendedEx(sSql, [FIdJuicioEnTramite]);

    sSql :=
      'SELECT jt_importerecursoextraord' +
       ' FROM legales.ljt_juicioentramite' +
      ' WHERE jt_id = :juicioid';
    eImporte2 := ValorSqlExtendedEx(sSql, [FIdJuicioEnTramite]);

    Verificar(ToleranceCompare2(edRecursoExtraord.Value + eImporte1, eImporte2) > 0, edRecursoExtraord, 'El importe aplicado no puede ser mayor al monto del juicio.');
    Verificar(ToleranceCompare2(edRecursoExtraord.Value, edImpSujetoaRetGanaciasPago.Value + edImpSinRetencionesGanPagos.Value) > 0,
              edRecursoExtraord, 'El importe del recurso extraordinario no puede ser superior al total del pago.');
	end;

  NroFacturaCalculada := False;

  if IsEmptyString(meSituacionFactura.Text) or IsEmptyString(meNumeroFactura.Text) then
  begin
    peLetraFactura.Text     := 'A';
    meNumeroFactura.Text    := lPad(FIdJuicioEnTramite ,'0', 6) + lPad(NumPago , '0', 2);
    meSituacionFactura.Text := lPad(fraTipoBeneficiario.Codigo, '0', 2) +
                               lPad(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]), '0', 2);
    NroFacturaCalculada := True;
  end;
  if FModoPago = meModificacion then
    sWhereFac := ' AND pl_id <> '+ SqlValue(FIdPago)
  else
    sWhereFac := '';

  Verificar( ExisteSql(
      '  SELECT 1 '+
      '    FROM legales.lpl_pagolegal '+
      '   WHERE pl_iddetallebeneficiario = '+SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+
      '     AND pl_idbeneficiariopago = '+SqlValue(fraTipoBeneficiario.Codigo)+
      '     AND pl_letrafactura = '+SqlValue(peLetraFactura.Text)+
      '     AND pl_situacionfactura = '+SqlValue(meSituacionFactura.Text)+
      '     AND pl_numerofactura = '+SqlValue(meNumeroFactura.Text)+
      '     AND pl_estado IN(''C'', ''E'') '+sWhereFac),peLetraFactura,'Ya existe el numero de factura para el mismo beneficiario.');
  Verificar(IsEmptyString(peLetraFactura.Text), peLetraFactura, 'Debe indicar la letra de la factura.');

  sSqlTrans := TSql.Create('legales.lpl_pagolegal');

  sSqlTrans.Fields.AddInteger('pl_idjuicioentramite',		 FIdJuicioEnTramite);
  sSqlTrans.Fields.AddString('pl_estado', 							 'C');
  sSqlTrans.Fields.AddDate('pl_fechapago', 							 DBDateTime, True);
  sSqlTrans.Fields.AddString('pl_letrafactura', 				 peLetraFactura.Text, True);
  sSqlTrans.Fields.AddString('pl_situacionfactura', 		 meSituacionFactura.Text, True);
  sSqlTrans.Fields.AddString('pl_numerofactura', 				 meNumeroFactura.Text, True);
  sSqlTrans.Fields.AddDate('pl_fechafactura', 					 edFechaFacturaPago.Date, True);
  sSqlTrans.Fields.AddDate('pl_fecharecepfactura',			 edFechaRecepcionFactura.Date, True);
  sSqlTrans.Fields.AddString('pl_comentario', 					 edObservaciones.Text, True);
  sSqlTrans.Fields.AddExtended('pl_importepago', 				 edImpSinRetencionesGanPagos.Value, 2, True);
  sSqlTrans.Fields.AddExtended('pl_importeconretencion', edImpSujetoaRetGanaciasPago.Value, 2, True);
  sSqlTrans.Fields.AddDate('pl_fechavencimientopago', 	 dcbFechaVencimientoPago.Date, True);
  sSqlTrans.Fields.Add('pl_nrofacturagenrada', 					 NroFacturaCalculada);
  sSqlTrans.Fields.Add('pl_pagoexclusivo', 					     String(Iif(chkPagoExclusivo.Checked, 'S', 'N')));

  if not fraInteresesInstancias.ReadOnly then
    sSqlTrans.Fields.Add('pl_idintereses', 					     fraInteresesInstancias.Codigo)
  else
    sSqlTrans.Fields.Add('pl_idintereses', 					     exNull);

  Beneficiario := ObtenerDatosBeneficiario(StrtoInt(fraTipoBeneficiario.Codigo),
                                           Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));

  if FModoPago = meAlta then
  begin
    sSqlTrans.SqlType := stInsert;
    FIdPago := GetSecNextVal('legales.seq_lpl_id');
    sSqlTrans.PrimaryKey.AddInteger('pl_id', 	 						 FIdPago);
    sSqlTrans.Fields.AddInteger('pl_numpago', 						 NumPago);
    sSqlTrans.Fields.AddInteger('pl_idbeneficiariopago', 	 fraTipoBeneficiario.Codigo, True);
    sSqlTrans.Fields.AddString('pl_detallebeneficiario', 	 cmbBeneficiarios.Text, True);
    sSqlTrans.Fields.AddString('pl_iddetallebeneficiario', Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));
    sSqlTrans.Fields.AddInteger('pl_conpago', 						 fraConceptoPago.Codigo);
    sSqlTrans.Fields.AddString('pl_usualta', 							 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('pl_fechaalta', 					 DBDateTime);

    idLiquidacion := GetSecNextVal('LEGALES.SEQ_LLJ_ID');
    EjecutarSqlST(' INSERT INTO legales.llj_liquidacionjuicio '+
                  '             (lj_id, lj_idbeneficiario, lj_beneficiario) '+
                  '       VALUES( '+SqlValue(idLiquidacion)+','+SqlValue(fraTipoBeneficiario.Value)+','+
                                 SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+')');
    sSqlTrans.Fields.AddInteger('PL_IDLIQUIDACION',  idLiquidacion);
  end
  else
  begin
    sSqlTrans.SqlType := stUpdate;
    sSqlTrans.PrimaryKey.Add('pl_id', 					 FIdPago);
    sSqlTrans.Fields.AddString('pl_usumodif', 		 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('pl_fechamodif', DBDateTime);
  end;

  duplicado := IsConceptoDuplicado(FIdJuicioEnTramite,FIdPago,StrToInt(fraConceptoPago.Codigo),'JD');
  if (duplicado = 'S') and
     (MsgBox( 'El Pago es Duplicado ¿Desea guardarlo de todas formas?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_NO) then
    Abort;
  sSqlTrans.Fields.Add('PL_DUPLICADO',  duplicado);

  EjecutarSQLST(sSqlTrans.Sql, tmNone);

  if edEmbargo.Tag > 0 then
  begin
    // Reemplazo el valor del campo pl_numpago..
    NumPago := Get_ProxNumPagoLegal(FIdJuicioEnTramite);
    iIndex := sSqlTrans.Fields.FieldByName['pl_numpago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddInteger('pl_numpago', NumPago);

    // Agrego un registro igual con el importe en negativo..
    iIndex := sSqlTrans.Fields.FieldByName['pl_importepago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddExtended('pl_importepago', -edEmbargo.Value, 2, True);

    // Traigo el id para este nuevo registro..
    iIndex := sSqlTrans.PrimaryKey.FieldByName['pl_id'].Index;
    sSqlTrans.PrimaryKey.Delete(iIndex);
    sSqlTrans.PrimaryKey.AddInteger('pl_id', GetSecNextVal('legales.seq_lpl_id'));

    // Reemplazo el valor del campo pl_numerofactura..
    iIndex := sSqlTrans.Fields.FieldByName['pl_numerofactura'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSitFactura := lPad(FIdJuicioEnTramite ,'0', 6) + lPad(NumPago , '0', 2);
    sSqlTrans.Fields.AddString('pl_numerofactura', sSitFactura, True);

    // Reemplazo el valor del campo pl_conpago..
    iIndex := sSqlTrans.Fields.FieldByName['pl_conpago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddInteger('pl_conpago', 109);

    // Dejo en NULL el importe con retención..
    iIndex := sSqlTrans.Fields.FieldByName['pl_importeconretencion'].Index;
    sSqlTrans.Fields.Delete(iIndex);

    // Agrego el valor del campo pl_idembargo..
    sSqlTrans.Fields.AddInteger('pl_idembargo', edEmbargo.Tag);

    EjecutarSQLST(sSqlTrans.Sql, tmNone);
	end;

  if edRecursoExtraord.Tag > 0 then
  begin
    // Reemplazo el valor del campo pl_numpago..
    NumPago := Get_ProxNumPagoLegal(FIdJuicioEnTramite);
    iIndex := sSqlTrans.Fields.FieldByName['pl_numpago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddInteger('pl_numpago', NumPago);

    // Agrego un registro igual con el importe en negativo..
    iIndex := sSqlTrans.Fields.FieldByName['pl_importepago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddExtended('pl_importepago', -edRecursoExtraord.Value, 2, True);

    // Traigo el id para este nuevo registro..
    iIndex := sSqlTrans.PrimaryKey.FieldByName['pl_id'].Index;
    sSqlTrans.PrimaryKey.Delete(iIndex);
    sSqlTrans.PrimaryKey.AddInteger('pl_id', GetSecNextVal('legales.seq_lpl_id'));

    // Reemplazo el valor del campo pl_numerofactura..
    iIndex := sSqlTrans.Fields.FieldByName['pl_numerofactura'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSitFactura := lPad(FIdJuicioEnTramite ,'0', 6) + lPad(NumPago , '0', 2);
    sSqlTrans.Fields.AddString('pl_numerofactura', sSitFactura, True);

    // Reemplazo el valor del campo pl_conpago..
    iIndex := sSqlTrans.Fields.FieldByName['pl_conpago'].Index;
    sSqlTrans.Fields.Delete(iIndex);
    sSqlTrans.Fields.AddInteger('pl_conpago', CONPAGO_RECEXTR);

    // Dejo en NULL el importe con retención..
    if assigned(sSqlTrans.Fields.FieldByName['pl_importeconretencion']) then
      begin
        iIndex := sSqlTrans.Fields.FieldByName['pl_importeconretencion'].Index;
        sSqlTrans.Fields.Delete(iIndex);
      end;

    // Dejo en NULL el id del embargo..
    if assigned(sSqlTrans.Fields.FieldByName['pl_idembargo']) then
      begin
        iIndex := sSqlTrans.Fields.FieldByName['pl_idembargo'].Index;
        sSqlTrans.Fields.Delete(iIndex);
      end;

    EjecutarSQLST(sSqlTrans.Sql, tmNone);
	end;

  if (duplicado = 'S') and ((FDuplicado = 'N') or (FModoPago = meAlta)) then
  begin
    with GetQuery(
      ' SELECT jt_numerocarpeta, cp_conpago, cp_denpago, pl_importepago, '+
      '        pl_importeconretencion, pl_idliquidacion '+
      '   FROM legales.lpl_pagolegal, legales.ljt_juicioentramite, art.scp_conpago '+
      '  WHERE pl_idjuicioentramite = jt_id '+
      '    AND pl_conpago = '+SqlValue(fraConceptoPago.Codigo)+
      '    AND pl_idjuicioentramite = '+SqlValue(FIdJuicioEnTramite)+
      '    AND pl_estado IN (''C'',''E'') '+
      '    AND pl_conpago = cp_conpago ') do
    try
      while not Eof do
        begin
          sPagos := sPagos+ 'Número de Carpeta: '+FieldByName('jt_numerocarpeta').AsString+#13#10+
                    'Concepto de Pago: '+FieldByName('cp_conpago').AsString+'-'+FieldByName('cp_denpago').AsString+#13#10+
                    'Importe sin Retención:'+FieldByName('pl_importepago').AsString+#13#10+
                    'Importe con Retención:'+FieldByName('pl_importeconretencion').AsString+#13#10+
                    'Número de Liquidación:'+FieldByName('pl_idliquidacion').AsString+#13#10+#13#10;
          Next;
        end;
    finally
      Free;
    end;
    tipojuicio := ValorSql('SELECT jt_estadomediacion FROM legales.ljt_juicioentramite, legales.lpl_pagolegal '+
                           'WHERE pl_idjuicioentramite = jt_id AND pl_id = '+SqlValue(FIdPago));

    if tipojuicio = 'J' then
      ListaMail := Get_DireccionesEnvioMail('LEGJJDME')
    else
      ListaMail := Get_DireccionesEnvioMail('LEGJJA');
    Asunto := 'Liquidación con Concepto de pagos duplicados.';
    Body := 'Los pagos son: '+ #13#10+ sPagos;
    EnviarMailBD(ListaMail, Asunto, [oAutoFirma, oDeleteAttach], Body, nil, 0, tcDefault, false);
  end;

  if duplicado = 'S' then
    MsgBox('El Concepto de Pago ya existe, Por tal motivo requiere autorización.', MB_ICONEXCLAMATION + MB_OK);

  Close;
end;

procedure TfrmPagoConceptosLegalesRegulados.btnAceptarPagoClick(Sender: TObject);
begin
	GuardarPago;
end;

procedure TfrmPagoConceptosLegalesRegulados.btnCancelarPagoClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPagoConceptosLegalesRegulados.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TfrmPagoConceptosLegalesRegulados.xxClick(Sender: TObject);
var
 Beneficiario : TBeneficiario;
begin
  if fraTipoBeneficiario.IsSelected and (cmbBeneficiarios.ItemIndex > -1) then
  begin
    Beneficiario := ObtenerDatosBeneficiario(
        StrtoInt(fraTipoBeneficiario.Codigo),
        Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex])
       );
    peDescripcionBeneficiario.Text := Beneficiario.FNombre;
  end;
end;

function TfrmPagoConceptosLegalesRegulados.ObtenerDatosBeneficiario(ATipoBeneficiario, AIdBeneficiario: Integer): TBeneficiario;
var
	sSql: String;
begin
  case ATipoBeneficiario of
    1:	sSql :=
    			'SELECT lju_jurisdiccion.ju_descripcion || '' '' || lfu_fuero.fu_descripcion || '' '' || ljz_juzgado.jz_descripcion || '' '' || lin_instancia.in_descripcion AS nombre' +
           ' FROM legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lin_instancia, legales.lfu_fuero' +
          ' WHERE (lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdiccion)' +
          	' AND (lin_instancia.in_id = ljz_juzgado.jz_idinstancia)' +
            ' AND (lfu_fuero.fu_id = ljz_juzgado.jz_idfuero)' +
            ' AND ljz_juzgado.jz_id = :p1';
    3:	sSql :=
    			'SELECT pe_nombre AS nombre' +
           ' FROM legales.lpe_perito' +
          ' WHERE pe_id = :p1';
    4,
    5,
    7,
    8:	sSql :=
    			'SELECT bo_nombre AS nombre' +
           ' FROM legales.lbo_abogado' +
          ' WHERE bo_id = :p1';
  else
  	sSql :=
    	'SELECT lju_jurisdiccion.ju_descripcion || '' '' || lfu_fuero.fu_descripcion || '' '' || ljz_juzgado.jz_descripcion || '' '' || lin_instancia.in_descripcion AS nombre' +
       ' FROM legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lin_instancia, legales.lfu_fuero' +
      ' WHERE (lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdiccion)' +
      	' AND (lin_instancia.in_id = ljz_juzgado.jz_idinstancia)' +
        ' AND (lfu_fuero.fu_id = ljz_juzgado.jz_idfuero)' +
        ' AND ljz_juzgado.jz_id = :p1';
  end;

  with GetQueryEx(sSql, [AIdBeneficiario]) do
  try
    if RecordCount > 0 then
    begin
      Result.FId := AIdBeneficiario;
      Result.FNombre := Trim(FieldByName('nombre').AsString);
    end
    else
    begin
      Result.FId := AIdBeneficiario;
      Result.FNombre := '';
    end;
  finally
   	Free;
  end;
end;

procedure TfrmPagoConceptosLegalesRegulados.cmbBeneficiariosClick(Sender: TObject);
var
 Beneficiario: TBeneficiario;
begin
  if fraTipoBeneficiario.IsSelected and (cmbBeneficiarios.ItemIndex > -1) then
  begin
  	Beneficiario := ObtenerDatosBeneficiario(StrtoInt(fraTipoBeneficiario.Codigo),
    																				 Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));
    peDescripcionBeneficiario.Text := Beneficiario.FNombre;
  end;
end;


procedure TfrmPagoConceptosLegalesRegulados.meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0
end;

procedure TfrmPagoConceptosLegalesRegulados.btnBuscarEmbargoClick(Sender: TObject);
begin
	Application.CreateForm(TfrmBuscarEmbargo, frmBuscarEmbargo);
  with frmBuscarEmbargo do
	  if Buscar(FIdJuicioEnTramite) then
    begin
    	edEmbargo.Tag  := EmbargoId;
  		edEmbargo.Value := Importe;
    end;
end;

procedure TfrmPagoConceptosLegalesRegulados.btnBuscarJuicioClick(Sender: TObject);
begin
	Application.CreateForm(TfrmBuscarJuicio, frmBuscarJuicio);
  with frmBuscarJuicio do
	  if Buscar(FIdJuicioEnTramite) then
    begin
    	edRecursoExtraord.Tag   := JuicioId;
  		edRecursoExtraord.Value := Importe;
    end;
end;

procedure TfrmPagoConceptosLegalesRegulados.ModoParteActora;
begin
  FExtraConditionConceptoPago := ' cp_tipo = ''A'' AND cp_automatico = ''N'' ';
  FExtraconditionTipoBeneficiario := ' AND bp_etapa LIKE ''%JA%'' ';

end;

procedure TfrmPagoConceptosLegalesRegulados.ModoParteDemandada;
begin
  FExtraConditionConceptoPago := ' cp_tipo = ''L'' AND cp_automatico = ''N'' ';
  FExtraconditionTipoBeneficiario := ' AND bp_etapa LIKE ''%JD%'' ';
end;

end.
