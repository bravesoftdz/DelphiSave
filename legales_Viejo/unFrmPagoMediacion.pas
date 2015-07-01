unit unFrmPagoMediacion;

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

  TfrmPagoMediacion = class(TForm)
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
    lbFechaRecepcionFactura: TLabel;
    edFechaRecepcionFactura: TDateComboBox;
    sdqJuzgadosDisponibles: TSDQuery;
    chkPagoExclusivo: TCheckBox;
    procedure btnAceptarPagoClick(Sender: TObject);
    procedure btnCancelarPagoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbBeneficiariosClick(Sender: TObject);
    procedure meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
  private
    FIdMediacion: Integer;
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
    procedure AltaPago(AIdMediacion: Integer);
    procedure ModificacionPago(ASdqPago: TSDQuery);
  end;

var
  frmPagoMediacion: TfrmPagoMediacion;

implementation

{$R *.dfm}

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, StrFuncs, unPrincipal, DateUtils, unSesion,
  MaskUtils, VCLExtra, unComunes, Numeros, General, unLegales, unMoldeEnvioMail;

//********************  PAGOS ***************************************************/
procedure TfrmPagoMediacion.AltaPago(AIdMediacion: Integer);
begin
  FIdMediacion := AIdMediacion;
  LimpiarCamposPago;
  FModoPago := meAlta;
  pnConceptos.Enabled := True;
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND cp_fbaja IS NULL ';

  Self.ShowModal;
end;

procedure TfrmPagoMediacion.ModificacionPago(ASdqPago: TSDQuery);
begin
  if ASdqPago.RecordCount > 0 then
  begin
    LimpiarCamposPago;

    FModoPago := meModificacion;
    FIdPago   := ASdqPago.FieldByName('pm_id').AsInteger;
    FIdMediacion := ASdqPago.FieldByName('pm_idmediacion').AsInteger;
    FDuplicado := ASdqPago.FieldByName('pm_duplicado').AsString;

    CargarDatosPago(ASdqPago.Fields);

    pnConceptos.Enabled := False;
    self.ShowModal;
    ASdqPago.Refresh;
  end;
end;

procedure TfrmPagoMediacion.Init;
begin
  FExtraConditionConceptoPago := ' cp_tipo = ''D''  AND cp_automatico = ''N'' ';
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
    ExtraCondition     := ' AND bp_etapa LIKE ''%ME%'' ';
    //ExtraCondition 		 := ' AND bc_conpago IS NULL ';
    OnChange 					 := OnTipoBeneficiarioChange;
    CheckSintax;
  end;

end;

procedure TfrmPagoMediacion.OnConceptoPagoChange(Sender : TObject);
begin
  if fraConceptoPago.IsSelected then
  begin
    edNroCuentaImputacionPago.Text := fraConceptoPago.sdqDatos.FieldByName('CP_CTAPAGO').AsString;

    with fraTipoBeneficiario  do
    begin
      Limpiar;
      cmbBeneficiarios.Clear;
      peDescripcionBeneficiario.Clear;
      ExtraCondition := ' AND bp_etapa LIKE ''%ME%'' ';
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
      ExtraCondition := ' AND bp_etapa LIKE ''%ME%'' ';
      //ExtraCondition := ' AND bc_conpago is Null ';
      Reload;
    end;
  end;

end;

procedure TfrmPagoMediacion.OnTipoBeneficiarioChange(Sender: TObject);
var
	TipoBeneficiario: Integer;
  sSql: String;
begin
  if fraTipoBeneficiario.IsSelected then
  begin
    TipoBeneficiario := strtoint(fraTipoBeneficiario.Codigo);
    case TipoBeneficiario of
      2:
      begin // trabajadores
        sSql := 'SELECT tj_id, tj_nombre ' +
                  'FROM ctj_trabajador, sex_expedientes, legales.lme_mediacion ' +
                 'WHERE me_idexpediente = ex_id ' +
                   'AND ex_cuil = tj_cuil ' +
                   'AND me_id = :IdMediacion';
        with GetQueryEx(sSql, [FIdMediacion]) do
          try
            if not eof then
              begin
                cmbBeneficiarios.Clear;
                IncluirBeneficiario(FieldByName('tj_id').AsInteger,
                                    FieldByName('tj_nombre').AsString);
              end;
          finally
            free;
          end;
      end;

      61:
      begin // Ministerio de Trabajo, Empleo y Seguridad Social
        cmbBeneficiarios.Clear;
        IncluirBeneficiario(TipoBeneficiario, fraTipoBeneficiario.Descripcion);
      end;

      5:
      begin // Abogados propios
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT bo_id, bo_nombre' +
             ' FROM legales.lme_mediacion, legales.lbo_abogado' +
            ' WHERE me_idabogado = bo_id' +
 	            ' AND me_id = ' + SqlValue(FIdMediacion)
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
            'SELECT bo_id, bo_nombre' +
             ' FROM legales.lme_mediacion, legales.lbo_abogado' +
            ' WHERE me_idabogadoactora = bo_id' +
              ' AND me_id = ' + SqlValue(FIdMediacion)
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

      81:
      begin // mediadores
        try
          sdqAbogadosDisponibles.SQL.Clear;
          sdqAbogadosDisponibles.SQL.Add(
            'SELECT md_id, md_nombre' +
             ' FROM legales.lme_mediacion, legales.lmd_mediador' +
            ' WHERE me_idmediador = md_id' +
 	            ' AND me_id = ' + SqlValue(FIdMediacion)
          );
          sdqAbogadosDisponibles.Open;
          cmbBeneficiarios.Clear;
          while not sdqAbogadosDisponibles.Eof do
          begin
          	IncluirBeneficiario(sdqAbogadosDisponibles.FieldByName('md_id').AsInteger,
                                sdqAbogadosDisponibles.FieldByName('md_nombre').AsString);
           	sdqAbogadosDisponibles.Next;
          end;
        finally
          sdqAbogadosDisponibles.Close;
        end;
      end;
    end;
  end;
end;

procedure TfrmPagoMediacion.LimpiarCamposPago;
begin
  fraConceptoPago.Limpiar;
  fraTipoBeneficiario.Limpiar;
  cmbBeneficiarios.Clear;
  peDescripcionBeneficiario.Clear;

  edNroCuentaImputacionPago.Text := '';

  edImpSujetoaRetGanaciasPago.Clear;
  edImpSinRetencionesGanPagos.Clear;
end;

procedure TfrmPagoMediacion.CargarDatosPago(Campos: TFields);
begin
  fraConceptoPago.ExtraJoinCondition := FExtraConditionConceptoPago +
                                        ' AND (cp_fbaja IS NULL OR cp_conpago = '+
                                        Campos.FieldByName('pm_conpago').AsString+') ';
  fraConceptoPago.Codigo            := Campos.FieldByName('pm_conpago').AsString;
  OnConceptoPagoChange(self);

  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('pm_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('pm_importeconretencion').AsCurrency;

  fraTipoBeneficiario.Codigo        := Campos.FieldByName('pm_idbeneficiariopago').AsString;
  OnTipoBeneficiarioChange(Self);

  //Busco el Beneficiario. De no encontrarlo lo agrego. Me posiciono en ese.
  IncluirBeneficiario(Campos.FieldByName('pm_idbeneficiariopago').AsInteger,
  										Campos.FieldByName('pm_detallebeneficiario').AsString);
  cmbBeneficiariosClick(Self);

  FNumPago                          := Campos.FieldByName('pm_numpago').AsInteger;
  peLetraFactura.Text               := Campos.FieldByName('pm_letrafactura').AsString;
  meSituacionFactura.Text           := Campos.FieldByName('pm_situacionfactura').AsString;
  meNumeroFactura.Text              := Campos.FieldByName('pm_numerofactura').AsString;
  edFechaFacturaPago.Date           := Campos.FieldByName('pm_fechafactura').AsDateTime;
  edFechaRecepcionFactura.Date      := Campos.FieldByName('pm_fecharecepfactura').AsDateTime;
  edObservaciones.Text              := Campos.FieldByName('pm_comentario').AsString;
  edImpSinRetencionesGanPagos.Value := Campos.FieldByName('pm_importepago').AsCurrency;
  edImpSujetoaRetGanaciasPago.Value := Campos.FieldByName('pm_importeconretencion').AsCurrency;
  dcbFechaVencimientoPago.Date      := Campos.FieldByName('pm_fechavencimientopago').AsDateTime;
  chkPagoExclusivo.Checked          := (Campos.FieldByName('pm_pagoexclusivo').AsString = 'S');
end;

procedure TfrmPagoMediacion.IncluirBeneficiario(AIdBeneficiario: Integer; ABeneficiario: String);
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

procedure TfrmPagoMediacion.GuardarPago;
var
 	NroFacturaCalculada: Boolean;
	NumPago: Integer;
 	sSqlTrans: TSql;
  idLiquidacion : Integer;
  duplicado : String;
  sPagos : String;
  ListaMail, Asunto, Body,sWhereFac : String;
begin
  NumPago := Get_ProxNumPagoMediacion(FIdMediacion);

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
                     'No puede especificar una fecha de vencimiento posterior a la fecha actual.'
                     ]);

  NroFacturaCalculada := False;

  if IsEmptyString(meSituacionFactura.Text) or IsEmptyString(meNumeroFactura.Text) then
  begin
    peLetraFactura.Text     := 'A';
    meNumeroFactura.Text    := lPad(FIdMediacion ,'0', 6) + lPad(NumPago , '0', 2);
    meSituacionFactura.Text := lPad(fraTipoBeneficiario.Codigo, '0', 2) +
                               lPad(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]), '0', 2);
    NroFacturaCalculada := True;
  end;

  if FModoPago = meModificacion then
    sWhereFac := ' AND pm_id <> '+ SqlValue(FIdPago)
  else
    sWhereFac := '';

  Verificar( ExisteSql(
      '  SELECT 1 '+
      '    FROM legales.lpm_pagomediacion '+
      '   WHERE pm_iddetallebeneficiario = '+SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+
      '     AND pm_idbeneficiariopago = '+SqlValue(fraTipoBeneficiario.Codigo)+
      '     AND pm_letrafactura = '+SqlValue(peLetraFactura.Text)+
      '     AND pm_situacionfactura = '+SqlValue(meSituacionFactura.Text)+
      '     AND pm_numerofactura = '+SqlValue(meNumeroFactura.Text)+
      '     AND pm_estado IN(''C'', ''E'') '+sWhereFac),peLetraFactura,'Ya existe el numero de factura para el mismo beneficiario.');
      
  Verificar(IsEmptyString(peLetraFactura.Text), peLetraFactura, 'Debe indicar la letra de la factura.');

  sSqlTrans := TSql.Create('legales.lpm_pagomediacion');

  sSqlTrans.Fields.AddInteger('pm_idmediacion',	      	 FIdMediacion);
  sSqlTrans.Fields.AddString('pm_estado', 							 'C');
  sSqlTrans.Fields.AddDate('pm_fechapago', 							 DBDateTime, True);
  sSqlTrans.Fields.AddString('pm_letrafactura', 				 peLetraFactura.Text, True);
  sSqlTrans.Fields.AddString('pm_situacionfactura', 		 meSituacionFactura.Text, True);
  sSqlTrans.Fields.AddString('pm_numerofactura', 				 meNumeroFactura.Text, True);
  sSqlTrans.Fields.AddDate('pm_fechafactura', 					 edFechaFacturaPago.Date, True);
  sSqlTrans.Fields.AddDate('pm_fecharecepfactura',			 edFechaRecepcionFactura.Date, True);
  sSqlTrans.Fields.AddString('pm_comentario', 					 edObservaciones.Text, True);
  sSqlTrans.Fields.AddExtended('pm_importepago', 				 edImpSinRetencionesGanPagos.Value, 2, True);
  sSqlTrans.Fields.AddExtended('pm_importeconretencion', edImpSujetoaRetGanaciasPago.Value, 2, True);
  sSqlTrans.Fields.AddDate('pm_fechavencimientopago', 	 dcbFechaVencimientoPago.Date, True);
  sSqlTrans.Fields.Add('pm_nrofacturagenerada', 				 NroFacturaCalculada);
  sSqlTrans.Fields.Add('pm_pagoexclusivo', 					     String(Iif(chkPagoExclusivo.Checked, 'S', 'N')));

  if FModoPago = meAlta then
  begin
    sSqlTrans.SqlType := stInsert;
    FIdPago := GetSecNextVal('legales.seq_lpm_id');
    sSqlTrans.PrimaryKey.AddInteger('pm_id', 	 						 FIdPago);
    sSqlTrans.Fields.AddInteger('pm_numpago', 						 NumPago);
    sSqlTrans.Fields.AddInteger('pm_idbeneficiariopago', 	 fraTipoBeneficiario.Codigo, True);
    sSqlTrans.Fields.AddString('pm_detallebeneficiario', 	 cmbBeneficiarios.Text, True);
    sSqlTrans.Fields.AddString('pm_iddetallebeneficiario', Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]));
    sSqlTrans.Fields.AddInteger('pm_conpago', 						 fraConceptoPago.Codigo);
    sSqlTrans.Fields.AddString('pm_usualta', 							 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('pm_fechaalta', 					 DBDateTime);

    idLiquidacion := GetSecNextVal('LEGALES.SEQ_LLS_ID');
    EjecutarSqlST(' INSERT INTO legales.llm_liquidacionmediacion '+
                  '             (lm_id, lm_idbeneficiario, lm_beneficiario) '+
                  '       VALUES( '+SqlValue(idLiquidacion)+','+SqlValue(fraTipoBeneficiario.Value)+','+
                                 SqlValue(Integer(cmbBeneficiarios.Items.Objects[cmbBeneficiarios.ItemIndex]))+')');
    sSqlTrans.Fields.AddInteger('PM_IDLIQUIDACION',  idLiquidacion);

  end
  else
  begin
    sSqlTrans.SqlType := stUpdate;
    sSqlTrans.PrimaryKey.Add('pm_id', 					   FIdPago);
    sSqlTrans.Fields.AddString('pm_usumodif', 		 Sesion.LoginName);
    sSqlTrans.Fields.AddDateTime('pm_fechamodif',  DBDateTime);
  end;
  duplicado := IsConceptoDuplicado(FIdMediacion,FIdPago,StrToInt(fraConceptoPago.Codigo),'ME');
  if (duplicado = 'S') and
     (MsgBox( 'El Pago es Duplicado ¿Desea guardarlo de todas formas?', MB_ICONINFORMATION + MB_YESNO, 'Atención' ) = ID_NO) then
    Abort;
  sSqlTrans.Fields.Add('PM_DUPLICADO',  duplicado);

  EjecutarSQLST(sSqlTrans.Sql, tmNone);

  if (duplicado = 'S') and ((FDuplicado = 'N') or (FModoPago = meAlta)) then
  begin
    with GetQuery(
      ' SELECT me_numerofolio, cp_conpago, cp_denpago, pm_importepago, '+
      '        pm_importeconretencion, pm_idliquidacion '+
      '   FROM legales.lpm_pagomediacion, legales.lme_mediacion, art.scp_conpago '+
      '  WHERE pm_idmediacion = me_id '+
      '    AND pm_conpago = '+SqlValue(fraConceptoPago.Codigo)+
      '    AND pm_idmediacion = '+SqlValue(FIdMediacion)+
      '    AND pm_estado IN (''C'',''E'') '+
      '    AND pm_conpago = cp_conpago ') do
    try
      while not Eof do
        begin
          sPagos := sPagos+ 'Número de Folio: '+FieldByName('me_numerofolio').AsString+#13#10+
                    'Concepto de Pago: '+FieldByName('cp_conpago').AsString+'-'+FieldByName('cp_denpago').AsString+#13#10+
                    'Importe sin Retención:'+FieldByName('pm_importepago').AsString+#13#10+
                    'Importe con Retención:'+FieldByName('pm_importeconretencion').AsString+#13#10+
                    'Número de Liquidación:'+FieldByName('pm_idliquidacion').AsString+#13#10+#13#10;
          Next;
        end;
    finally
      Free;
    end;

    ListaMail := Get_DireccionesEnvioMail('LEGJJDME');
    Asunto := 'Liquidación con Concepto de pagos duplicados.';
    Body := 'Los pagos son: '+ #13#10+ sPagos;
    EnviarMailBD(ListaMail, Asunto, [oAutoFirma, oDeleteAttach], Body, nil, 0, tcDefault, false);
  end;


  if duplicado = 'S' then
    MsgBox('El Concepto de Pago ya existe, Por tal motivo requiere autorización.', MB_ICONEXCLAMATION + MB_OK);
    
  Close;
end;

procedure TfrmPagoMediacion.btnAceptarPagoClick(Sender: TObject);
begin
	GuardarPago;
end;

procedure TfrmPagoMediacion.btnCancelarPagoClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPagoMediacion.FormCreate(Sender: TObject);
begin
  Init;
end;

function TfrmPagoMediacion.ObtenerDatosBeneficiario(ATipoBeneficiario, AIdBeneficiario: Integer): TBeneficiario;
var
	sSql: String;
begin
  case ATipoBeneficiario of
    2: // trabajadores
      sSql := 'SELECT tj_nombre nombre ' +
                'FROM ctj_trabajador ' +
               'WHERE tj_id = :Id';

    61: // Ministerio de Trabajo, Empleo y Seguridad Social
      sSql := 'SELECT bp_descripcion nombre ' +
                'FROM legales.lbp_beneficiariopago ' +
               'WHERE bp_id = :Id';

    5, // Abogados propios
    7: // Abogados oponentes
      sSql :=
          'SELECT bo_nombre nombre ' +
            'FROM legales.lbo_abogado ' +
           'WHERE bo_id = :Id';

    81: // mediadores
      sSql :=
          'SELECT md_nombre nombre ' +
            'FROM legales.lmd_mediador ' +
           'WHERE md_id = :Id';
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

procedure TfrmPagoMediacion.cmbBeneficiariosClick(Sender: TObject);
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

procedure TfrmPagoMediacion.meSituacionFacturaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0
end;

end.


