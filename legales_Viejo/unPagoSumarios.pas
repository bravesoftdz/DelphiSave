unit unPagoSumarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Mask, StdCtrls, PatternEdit,
  CurrEdit, ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcionExt, ExtCtrls, DB, SDEngine, General,
  unFraCodigoDescripcion, unDmLegales, ExComboBox, Grids, DBGrids, Placemnt, JvExForms, JvClipboardViewer,
  unArtDBAwareFrame;

type
  TBeneficiario = record
    FId    : Integer;
    FNombre: String;
  end;

  TfrmPagoSumarios = class(TForm)
    bvSeparadorBotones: TBevel;
    btnAceptarPago: TButton;
    btnCancelarPago: TButton;
    pnConceptos: TPanel;
    lblNroCuenta: TLabel;
    lblTipoBeneficiario: TLabel;
    lblBeneficiario: TLabel;
    fraConceptoPago: TfraCodigoDescripcionExt;
    edNroCuentaImputacionPago: TPatternEdit;
    fraTipoBeneficiario: TfraCodigoDescripcionExt;
    Label1: TLabel;
    peDescripcionBeneficiario: TPatternEdit;
    cmbBeneficiarios: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    lblConceptoPago: TLabel;
    Bevel1: TBevel;
    gbComprobantes: TGroupBox;
    Label7: TLabel;
    edComprobante: TEdit;
    Label8: TLabel;
    edBUDI: TEdit;
    pnFactura: TPanel;
    lblFechaFacturaPago: TLabel;
    lblNroFactura: TLabel;
    lblDetalleFacturaPago: TLabel;
    lblImporteSinRetGanaciasPago: TLabel;
    lblImpSujetoaRetGanaciasPago: TLabel;
    lblFechaVencimiento: TLabel;
    edFechaFacturaPago: TDateComboBox;
    edObservaciones: TEdit;
    edImpSinRetencionesGanPagos: TCurrencyEdit;
    edImpSujetoaRetGanaciasPago: TCurrencyEdit;
    dcbFechaVencimientoPago: TDateComboBox;
    pnlFactura: TPanel;
    peLetraFactura: TPatternEdit;
    meSituacionFactura: TMaskEdit;
    meNumeroFactura: TMaskEdit;
    sdqJuzgadosDisponibles: TSDQuery;
    FormStorage1: TFormStorage;
    sdqAbogadosDisponibles: TSDQuery;
    Bevel2: TBevel;
    Label9: TLabel;
    fraSectores: TfraCodigoDescripcionExt;
    chkPagoExclusivo: TCheckBox;
    procedure btnAceptarPagoClick(Sender: TObject);
    procedure btnCancelarPagoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbBeneficiariosClick(Sender: TObject);
    procedure meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
  private
    FIdArea: String;  
    FIdPago: Integer;
    FIdSumario: Integer;
    FDuplicado : String;
    FModoPago: TModoEjecucion;
    FNumPago: Integer;
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
    procedure AltaPago(AIdSumario: Integer; AIdArea: String);
    procedure ModificacionPago(ASdqPagoLegal: TSDQuery; AIdArea: String);
  end;

var
  frmPagoSumarios: TfrmPagoSumarios;

implementation

{$R *.dfm}

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs, unPrincipal, DateUtils, unSesion,
  MaskUtils, UnRptLiquidacion, unLegales, unComunes, unMoldeEnvioMail;

procedure TfrmPagoSumarios.AltaPago(AIdSumario: Integer; AIdArea: String);
begin
  Caption := 'Alta de ítem de Pago';
  LimpiarCamposPago;
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND cp_fbaja IS NULL ';
  FIdSumario := AIdSumario;
  FIdArea := AIdArea;
  FModoPago := meAlta;
  pnConceptos.Enabled := True;

  fraSectores.Codigo := FIdArea;

  Self.ShowModal;
end;

procedure TfrmPagoSumarios.ModificacionPago(ASdqPagoLegal: TSDQuery; AIdArea: String);
begin
  Caption := 'Modificación de ítem de Pago';
  LimpiarCamposPago;

  FModoPago  := meModificacion;
  FIdPago 	 := ASdqPagoLegal.FieldByName('ps_id').AsInteger;
  FIdSumario := ASdqPagoLegal.FieldByName('ps_idsumario').AsInteger;
  FIdArea 	 := AIdArea;
  FDuplicado := ASdqPagoLegal.FieldByName('ps_duplicado').AsString;

  CargarDatosPago(ASdqPagoLegal.Fields);

  pnConceptos.Enabled := False;
  Self.ShowModal;
  ASdqPagoLegal.Refresh;
end;

procedure TfrmPagoSumarios.Init;
begin
  FExtraConditionConceptoPago := ' cp_tipo = ''U''  AND cp_automatico = ''N'' ';
  with fraConceptoPago  do
	begin
  	TableName 		 := 'scp_conpago';
    fieldid 			 := 'cp_conpago';
    FieldCodigo 	 := 'cp_conpago';
    FieldDesc 		 := 'cp_denpago';
    ExtraFields 	 := ', cp_ctapago, cp_retencion ';
    ExtraCondition := ' AND cp_tipo = ''U''  AND cp_automatico = ''N'' ';
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
    ExtraCondition := ' AND bp_etapa LIKE ''%SU%'' ';
    //ExtraCondition 		 := ' AND bc_conpago IS NULL ';
    OnChange 					 := OnTipoBeneficiarioChange;
    CheckSintax;
  end;

  with fraSectores do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_ID';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas 	:= True;
  end;

end;

procedure TfrmPagoSumarios.OnConceptoPagoChange(Sender : TObject);
begin
  if fraConceptoPago.IsSelected then
  begin
    edNroCuentaImputacionPago.Text := fraConceptoPago.sdqDatos.FieldByName('CP_CTAPAGO').AsString;

		with fraTipoBeneficiario  do
    begin
      Limpiar;
      cmbBeneficiarios.Clear;
      peDescripcionBeneficiario.Clear;
      ExtraCondition := ' AND bp_etapa LIKE ''%SU%'' ';
      //ExtraCondition := ' AND bc_conpago = ' + fraConceptoPago.Codigo + ' ';
      Reload;
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
      ExtraCondition := ' AND bp_etapa LIKE ''%SU%'' ';
      //ExtraCondition := ' AND bc_conpago IS NULL ';
      Reload;
    end;
  end;

end;

procedure TfrmPagoSumarios.OnTipoBeneficiarioChange(Sender : TObject);
var
 TipoBeneficiario: Integer;
begin
  if fraTipoBeneficiario.IsSelected then
  begin
  	TipoBeneficiario := strtoint(fraTipoBeneficiario.Codigo);
    case TipoBeneficiario of
      1:
      begin // Juzgados
      	try
        	sdqJuzgadosDisponibles.ParamByName('IdSumario').AsInteger := FIdSumario;
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

      5:
      begin // Abogados propios
      	try
        	sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT bo_id, bo_nombre' +
             ' FROM legales.lsu_sumario, legales.lbo_abogado' +
            ' WHERE bo_id = su_abogado' +
            	' AND su_id = ' + SqlValue(FIdSumario) +
            	' AND bo_parte = ''P'''
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

      6:
      begin
        cmbBeneficiarios.Clear;
        IncluirBeneficiario(6, 'SRT');
      end;
       41:
      begin
        cmbBeneficiarios.Clear;
        IncluirBeneficiario(43, 'CASSABA');
      end;
      7:
      begin // Abogados oponentes
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT bo_id, bo_nombre' +
             ' FROM legales.lsu_sumario, legales.lbo_abogado' +
            ' WHERE bo_id = su_abogadosumariante' +
 	            ' AND su_id = ' + SqlValue(FIdSumario) +
  	          ' AND bo_parte = ''S'''
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


procedure TfrmPagoSumarios.LimpiarCamposPago;
begin
  fraConceptoPago.Limpiar;
  fraTipoBeneficiario.Limpiar;
  cmbBeneficiarios.Clear;
  peDescripcionBeneficiario.Clear;

  edNroCuentaImputacionPago.Text := '';

  edImpSujetoaRetGanaciasPago.Clear;
  edImpSinRetencionesGanPagos.Clear
end;

procedure TfrmPagoSumarios.CargarDatosPago(Campos: TFields);
begin
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND (cp_fbaja IS NULL OR cp_conpago = '+
                                        Campos.FieldByName('ps_conpago').AsString+') ';
  fraConceptoPago.Codigo := Campos.FieldByName('ps_conpago').AsString;
  OnConceptoPagoChange(self);

  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('ps_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('ps_importeconretencion').AsCurrency;

  fraTipoBeneficiario.Codigo := Campos.FieldByName('ps_idbeneficiariopago').AsString;
  OnTipoBeneficiarioChange(self);

  //Busco el Beneficiario. De no encontrarlo lo agrego. Me posiciono en ese.
  IncluirBeneficiario(Campos.FieldByName('ps_idbeneficiariopago').AsInteger,
  										Campos.FieldByName('ps_detallebeneficiario').AsString);
  cmbBeneficiariosClick(self);

  FNumPago                          := Campos.FieldByName('ps_numpago').AsInteger;
  peLetraFactura.Text               := Campos.FieldByName('ps_letrafactura').AsString;
  meSituacionFactura.Text           := Campos.FieldByName('ps_situacionfactura').AsString;
  meNumeroFactura.Text              := Campos.FieldByName('ps_numerofactura').AsString;
  edFechaFacturaPago.Date           := Campos.FieldByName('ps_fechafactura').AsDateTime;
  edObservaciones.Text              := Campos.FieldByName('ps_comentario').AsString;
  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('ps_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('ps_importeconretencion').AsCurrency;
  dcbFechaVencimientoPago.Date      := Campos.FieldByName('ps_fechavencimientopago').AsDateTime;
  fraSectores.Codigo                := IIF(Campos.FieldByName('ps_idsector').IsNull, FIdArea,Campos.FieldByName('ps_idsector').AsString);
  edComprobante.Text                := Campos.FieldByName('ps_comprobantepago').AsString;
  edBUDI.Text                       := Campos.FieldByName('ps_budi').AsString;
  chkPagoExclusivo.Checked          := (Campos.FieldByName('ps_pagoexclusivo').AsString = 'S');
end;

procedure TfrmPagoSumarios.IncluirBeneficiario(AIdBeneficiario: Integer; ABeneficiario: String);
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

procedure TfrmPagoSumarios.GuardarPago;
var
 NumPago, idLiquidacion : Integer;
 NroFacturaCalculada : Boolean;
 sSqlTrans : TSql;
 Beneficiario : TBeneficiario;
 duplicado, sPagos, ListaMail, Asunto, Body, sWhereFac : String;
begin
  NumPago := ValorSql('SELECT NVL(max(ps_numpago), 0) FROM legales.lps_pagosumario WHERE ps_idsumario = ' + SqlValue(FIdSumario), '0');
  Inc(NumPago);

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
                     'Debe especificar una fecha de factura previa a la fecha actual.',

                     dcbFechaVencimientoPago,
                     dcbFechaVencimientoPago.IsValid,
                     'Debe ingresar una fecha válida para el vencimiento',

                     dcbFechaVencimientoPago,
                     (dcbFechaVencimientoPago.Date >= DBDate) and
                     not dcbFechaVencimientoPago.IsEmpty,
                     'No puede especificar una fecha de vencimiento posterior a la fecha actual.',

                     fraSectores,
                     fraSectores.IsSelected,
                     'Debe completar el Área/Sector.'
                     ]);

  NroFacturaCalculada := False;

  if IsEmptyString(meSituacionFactura.Text) or IsEmptyString(meNumeroFactura.Text) then
  begin
    peLetraFactura.Text     := 'A';
    meNumeroFactura.Text    := lPad(FIdSumario ,'0', 6) + lPad(NumPago , '0', 2);
    meSituacionFactura.Text := lPad(fraTipoBeneficiario.Codigo, '0', 2) +
                               lPad(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]), '0', 2);
    NroFacturaCalculada := true;
  end;

  if FModoPago = meModificacion then
    sWhereFac := ' AND pm_id <> '+ SqlValue(FIdPago)
  else
    sWhereFac := '';

  Verificar( ExisteSql(
      '  SELECT 1 '+
      '    FROM legales.lps_pagosumario '+
      '   WHERE PS_IDDETALLEBENEFICIARIO = '+SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+
      '     AND PS_IDBENEFICIARIOPAGO = '+SqlValue(fraTipoBeneficiario.Codigo)+
      '     AND PS_LETRAFACTURA = '+SqlValue(peLetraFactura.Text)+
      '     AND PS_SITUACIONFACTURA = '+SqlValue(meSituacionFactura.Text)+
      '     AND PS_NUMEROFACTURA = '+SqlValue(meNumeroFactura.Text)+
      '     AND PS_ESTADO IN(''C'', ''E'') '+sWhereFac),peLetraFactura,'Ya existe el numero de factura para el mismo beneficiario.');

  Verificar(IsEmptyString(peLetraFactura.Text), peLetraFactura, 'Debe indicar la letra de la factura.');

  sSqlTrans := TSql.Create('legales.lps_pagosumario');

  sSqlTrans.Fields.AddInteger('ps_idsumario',						 FIdSumario);
  sSqlTrans.Fields.AddString('ps_estado', 							 'C');
  sSqlTrans.Fields.AddDate('ps_fechapago', 							 DBDateTime, True);
  sSqlTrans.Fields.AddString('ps_letrafactura', 				 peLetraFactura.Text, True);
  sSqlTrans.Fields.AddString('ps_situacionfactura', 		 meSituacionFactura.Text, True);
  sSqlTrans.Fields.AddString('ps_numerofactura', 				 meNumeroFactura.Text, True);
  sSqlTrans.Fields.AddDate('ps_fechafactura', 					 edFechaFacturaPago.Date, True);
  sSqlTrans.Fields.AddString('ps_comentario', 					 edObservaciones.Text, True);
  sSqlTrans.Fields.AddExtended('ps_importepago', 				 edImpSinRetencionesGanPagos.Value, 2, True);
  sSqlTrans.Fields.AddExtended('ps_importeconretencion', edImpSujetoaRetGanaciasPago.Value, 2, True);
  sSqlTrans.Fields.AddDate('ps_fechavencimientopago', 	 dcbFechaVencimientoPago.Date, True);
  sSqlTrans.Fields.Add('ps_nrofacturagenrada', 					 NroFacturaCalculada);
  sSqlTrans.Fields.AddString('ps_idsector', 						 fraSectores.Codigo, True);
  sSqlTrans.Fields.AddString('ps_comprobantepago', 			 edComprobante.Text, True);
  sSqlTrans.Fields.AddString('ps_budi', 								 edBUDI.Text, True);
  sSqlTrans.Fields.Add('ps_pagoexclusivo', 					     String(Iif(chkPagoExclusivo.Checked, 'S', 'N')));

  Beneficiario := ObtenerDatosBeneficiario(StrtoInt(fraTipoBeneficiario.Codigo),
                                           Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));

  if FModoPago = meAlta then
  begin
    sSqlTrans.SqlType := stInsert;
    FIdPago := GetSecNextVal('legales.seq_lps_id');
    sSqlTrans.Fields.AddInteger('ps_id', 									 FIdPago);
    sSqlTrans.Fields.AddInteger('ps_numpago', 						 NumPago);
    sSqlTrans.Fields.AddInteger('ps_idbeneficiariopago', 	 fraTipoBeneficiario.Codigo, True);
    sSqlTrans.Fields.AddString('ps_detallebeneficiario', 	 cmbBeneficiarios.Text, True);
    sSqlTrans.Fields.AddString('ps_iddetallebeneficiario', Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));
    sSqlTrans.Fields.AddInteger('ps_conpago', 						 fraConceptoPago.Codigo);
    sSqlTrans.Fields.AddString('ps_usualta', 							 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('ps_fechaalta', 					 DBDateTime);


    idLiquidacion := GetSecNextVal('LEGALES.SEQ_LLS_ID');
    EjecutarSqlST(' INSERT INTO legales.lls_liquidacionsumario '+
                  '             (LS_ID, LS_IDBENEFICIARIO, LS_BENEFICIARIO) '+
                  '       VALUES( '+SqlValue(idLiquidacion)+','+SqlValue(fraTipoBeneficiario.Value)+','+
                                 SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+')');
    sSqlTrans.Fields.AddInteger('PS_IDLIQUIDACION',  idLiquidacion);

  end
  else
  begin
    sSqlTrans.SqlType := stUpdate;
    sSqlTrans.PrimaryKey.Add('ps_id', 					 FIdPago);
    sSqlTrans.Fields.AddString('ps_usualta', 		 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('ps_fechaalta', DBDateTime);
  end;
  duplicado := IsConceptoDuplicado(FIdSumario,FIdPago,StrToInt(fraConceptoPago.Codigo),'SU');
  if (duplicado = 'S') and
     (MsgBox( 'El Pago es Duplicado ¿Desea guardarlo de todas formas?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_NO) then
    Abort;
  sSqlTrans.Fields.Add('PS_DUPLICADO',  duplicado);


  EjecutarSQLST(sSqlTrans.Sql, tmNone);

  if (duplicado = 'S') and ((FDuplicado = 'N') or (FModoPago = meAlta)) then
  begin
    with GetQuery(
      ' SELECT su_numerosumario, cp_conpago, cp_denpago, ps_importepago, '+
      '        ps_importeconretencion, ps_idliquidacion '+
      '   FROM legales.lps_pagosumario, legales.lsu_sumario, art.scp_conpago '+
      '  WHERE ps_idsumario = su_id '+
      '    AND ps_conpago = '+SqlValue(fraConceptoPago.Codigo)+
      '    AND ps_idsumario = '+SqlValue(FIdSumario)+
      '    AND ps_estado IN (''C'',''E'') '+
      '    AND ps_conpago = cp_conpago ') do
    try
      while not Eof do
        begin
          sPagos := sPagos+ 'Número de Sumario: '+FieldByName('su_numerosumario').AsString+#13#10+
                    'Concepto de Pago: '+FieldByName('cp_conpago').AsString+'-'+FieldByName('cp_denpago').AsString+#13#10+
                    'Importe sin Retención:'+FieldByName('ps_importepago').AsString+#13#10+
                    'Importe con Retención:'+FieldByName('ps_importeconretencion').AsString+#13#10+
                    'Número de Liquidación:'+FieldByName('ps_idliquidacion').AsString+#13#10+#13#10;
          Next;
        end;
    finally
      Free;
    end;
    ListaMail := Get_DireccionesEnvioMail('LEGJSU');
    Asunto := 'Liquidación con Concepto de pagos duplicados.';
    Body := 'Los pagos son: '+ #13#10+ sPagos;
    EnviarMailBD(ListaMail, Asunto, [oAutoFirma, oDeleteAttach], Body, nil, 0, tcDefault, false);
  end;

  if duplicado = 'S' then
    MsgBox('El Concepto de Pago ya existe, Por tal motivo requiere autorización.', MB_ICONEXCLAMATION + MB_OK);
  Close;
end;

procedure TfrmPagoSumarios.btnAceptarPagoClick(Sender: TObject);
begin
  GuardarPago;
end;

procedure TfrmPagoSumarios.btnCancelarPagoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagoSumarios.FormCreate(Sender: TObject);
begin
  Init;
end;

function TfrmPagoSumarios.ObtenerDatosBeneficiario(ATipoBeneficiario, AIdBeneficiario: Integer): TBeneficiario;
var
	sSql: String;
begin
  case ATipoBeneficiario of
  	1:	sSql :=
    			'SELECT lju_jurisdiccion.ju_descripcion || '' '' || lfu_fuero.fu_descripcion || '' '' || ljz_juzgado.jz_descripcion AS nombre' +
           ' FROM legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lfu_fuero' +
          ' WHERE (lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdiccion)' +
          	' AND (lfu_fuero.fu_id = ljz_juzgado.jz_idfuero)' +
            ' AND ljz_juzgado.jz_id = ' + SqlValue(AIdBeneficiario);
    6:	sSql :=
    			'SELECT bp_descripcion AS nombre' +
           ' FROM legales.lbp_beneficiariopago' +
          ' WHERE bp_id = '+ SqlValue(AIdBeneficiario);
    4,
    5,
    7,
    8:	sSql :=
    			'SELECT bo_nombre AS nombre' +
           ' FROM legales.lbo_abogado' +
          ' WHERE bo_id = '+ SqlValue(AIdBeneficiario);
	else
  	sSql :=
    	'SELECT lju_jurisdiccion.ju_descripcion || '' '' || lfu_fuero.fu_descripcion || '' '' || ljz_juzgado.jz_descripcion AS nombre' +
       ' FROM legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lfu_fuero' +
      ' WHERE (lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdiccion)' +
      	' AND (lfu_fuero.fu_id = ljz_juzgado.jz_idfuero)' +
        ' AND ljz_juzgado.jz_id = ' + SqlValue(AIdBeneficiario);
  end;

  with GetQuery(sSql) do
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

procedure TfrmPagoSumarios.cmbBeneficiariosClick(Sender: TObject);
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

procedure TfrmPagoSumarios.meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
begin
	if not (key in ['0'..'9']) then
  	Key := #0
end;

end.
