unit unLiquidacionPagoSumarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,
  DateComboBox, unArtFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt, PatternEdit, CurrEdit, DB, SDEngine,
  IntEdit, ComCtrls, ToolWin, RXDBCtrl, unSesion, CustomDlgs, JvExControls, JvComponent, JvXPCore, JvXPButtons,
  unArtDBAwareFrame, CUIT;

type
  TfrmLiquidacionPagoSumarios = class(TForm)
    gbDetalle: TGroupBox;
    gbPago: TGroupBox;
    btnAceptarSentencia: TButton;
    bvSeparadorBotones: TBevel;
    btnCancelarFijarSentencia: TButton;
    lblPagueseA: TLabel;
    lblChequeA: TLabel;
    edChequeAlaOrdenDe: TEdit;
    lblFechaEmision: TLabel;
    edFechaEmision: TDateComboBox;
    lblFechaVencimiento: TLabel;
    edFechaVencimiento: TDateComboBox;
    lblFechaFacturaPago: TLabel;
    lblNroFactura: TLabel;
    lblDetalleFacturaPago: TLabel;
    lblImporteSinRetGanaciasPago: TLabel;
    lblImpSujetoaRetGanaciasPago: TLabel;
    lblFechaVencimientoPago: TLabel;
    edFechaFacturaPago: TDateComboBox;
    edObservaciones: TEdit;
    edImpSinRetencionesGanPagos: TCurrencyEdit;
    edImpSujetoaRetGanaciasPago: TCurrencyEdit;
    peLetraFactura: TPatternEdit;
    meSituacionFactura: TMaskEdit;
    meNumeroFactura: TMaskEdit;
    pnConceptos: TPanel;
    lblConceptoPago: TLabel;
    lblNroCuenta: TLabel;
    lblTipoBeneficiario: TLabel;
    lblBeneficiario: TLabel;
    fraConceptoPago: TfraCodigoDescripcionExt;
    edNroCuentaImputacionPago: TPatternEdit;
    fraTipoBeneficiario: TfraCodigoDescripcionExt;
    cmbBeneficiarios: TComboBox;
    dcbFechaVencimientoPago: TDateComboBox;
    bvSeparador1: TBevel;
    gbCopias: TGroupBox;
    udCantidadLiquidacion: TUpDown;
    lblLiquidacion: TLabel;
    edCantidadCopiasLiquidacion: TIntEdit;
    fraPagueseA: TfraCodigoDescripcionExt;
    Label1: TLabel;
    fraSectores: TfraCodigoDescripcionExt;
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure fraPagueseAcmbDescripcionChange(Sender: TObject);
  private
    FIdPagoSumario: Integer;

    procedure CargaDatosPago(Campos: TFields);
    procedure Init;
    procedure LimpiarCamposPago;
  public
    procedure Imprimir(Campos: TFields);
  end;

implementation

uses
  unDmPrincipal, StrFuncs, UnRptLiquidacionSumario, DateUtils, SqlFuncs, AnsiSql;

{$R *.dfm}

{ TfrmImpresionConceptoPago }

procedure TfrmLiquidacionPagoSumarios.Imprimir(Campos: TFields);
begin
  FIdPagoSumario := Campos.fieldbyname('ps_id').AsInteger;
  LimpiarCamposPago;
  Init;
  CargaDatosPago(Campos);
  ShowModal;
end;

procedure TfrmLiquidacionPagoSumarios.Init;
begin
  with fraSectores do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_ID';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas 	:= True;
  end;

  with fraConceptoPago  do
  begin
    TableName 		 := 'scp_conpago';
    fieldid 			 := 'cp_conpago';
    FieldCodigo 	 := 'cp_conpago';
    FieldDesc 		 := 'cp_denpago';
    ExtraFields 	 := ', cp_ctapago ';
    ExtraCondition := 'and cp_tipo = ''U''  AND cp_automatico = ''N'' ';
  end;

  with fraTipoBeneficiario  do
  begin
    TableName 	:= 'legales.lbp_beneficiariopago';
    fieldid 		:= 'bp_id';
    FieldCodigo := 'bp_id';
    FieldDesc 	:= 'bp_descripcion';
  end;

  with fraPagueseA do
  begin
    TableName 		 := 'spa_pagoacre';
    fieldid 			 := 'pa_cuitcuil';
    FieldCodigo 	 := 'pa_cuitcuil';
    FieldDesc 		 := 'pa_denomina';
    ExtraCondition := ' AND pa_acreedor IN (''OA'', ''PA'') AND pa_formacobro IN (''CH'', ''PE'')';
  end;
end;

procedure TfrmLiquidacionPagoSumarios.CargaDatosPago(Campos: TFields);
begin
  with Campos do
  begin
    fraConceptoPago.Codigo            := FieldByName('ps_conpago').AsString;
    edNroCuentaImputacionPago.Text    := fraConceptoPago.sdqDatos.FieldByName('CP_CTAPAGO').AsString;
    fraTipoBeneficiario.Codigo        := FieldByName('ps_idbeneficiariopago').AsString;
    
    //Busco el Beneficiario. De no encontrarlo lo agrego. Me posiciono en ese.
    cmbBeneficiarios.Items.Add(FieldByName('ps_detallebeneficiario').AsString);
    cmbBeneficiarios.ItemIndex := 0;

    peLetraFactura.Text               := FieldByName('ps_letrafactura').AsString;
    meSituacionFactura.Text           := FieldByName('ps_situacionfactura').AsString;
    meNumeroFactura.Text              := FieldByName('ps_numerofactura').AsString;
    edFechaFacturaPago.Date           := FieldByName('ps_fechafactura').AsDateTime;
    dcbFechaVencimientoPago.Date      := FieldByName('ps_fechavencimientopago').AsDateTime;
    edObservaciones.Text              := FieldByName('ps_comentario').AsString;
    edImpSinRetencionesGanPagos.Value := FieldByName('ps_importepago').AsCurrency;
    edImpSujetoaRetGanaciasPago.Value := FieldByName('ps_importeconretencion').AsCurrency;
    fraPagueseA.Codigo                := FieldByName('ps_cuitcuil').AsString;
    fraSectores.Codigo                := FieldByName('ps_idsector').AsString;
    edChequeAlaOrdenDe.Text           := FieldByName('ps_chequenombre').AsString;

    edFechaEmision.Date               := FieldByName('ps_fechaemision').AsDateTime;
    edFechaVencimiento.Date           := FieldByName('ps_fechavencimiento').AsDateTime;

    gbPago.Enabled                    := IsEmptyString(FieldByName('ps_paguesea').AsString)
  end;
end;

procedure TfrmLiquidacionPagoSumarios.LimpiarCamposPago;
begin
  fraConceptoPago.Limpiar;
  fraTipoBeneficiario.Limpiar;

  edNroCuentaImputacionPago.Clear;
  edFechaEmision.Clear;
  edFechaVencimiento.Clear;
  edChequeAlaOrdenDe.Clear;

  edCantidadCopiasLiquidacion.Value := 2;
end;

procedure TfrmLiquidacionPagoSumarios.btnAceptarSentenciaClick(Sender: TObject);
var
  FAplica: String;
  sSql : String;
begin
  VerificarMultiple(['Guardando Pago',
                     fraPagueseA,
                     fraPagueseA.Codigo <> '',
                     'Debe completar el Autorizado al Cobro.',
                     fraPagueseA, IsCUIT(fraPagueseA.Codigo) or IsCUIL(fraPagueseA.Codigo),
                                  'No puede autorizarse el pago pués el Autorizado no tiene un CUIT/CUIL válido.'
                     ]);

  if gbPago.Enabled then
  begin
    EjecutarSqlST('update legales.lps_pagosumario set ps_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) + ' where ps_id = ' + SqlValue(FIdPagoSumario));
    EjecutarSqlST('update legales.lps_pagosumario set ps_paguesea = ' + SqlValue(fraPagueseA.Descripcion) + ' where ps_id = ' + SqlValue(FIdPagoSumario));

    if not IsEmptyString(edChequeAlaOrdenDe.Text) then
      EjecutarSqlST('update legales.lps_pagosumario set ps_chequenombre = ' + SqlValue(edChequeAlaOrdenDe.Text) + ' where ps_id = ' + SqlValue(FIdPagoSumario))
    else
      EjecutarSqlST('update legales.lps_pagosumario set ps_chequenombre = ps_detallebeneficiario where ps_id = ' + SqlValue(FIdPagoSumario));

    EjecutarSqlST('update legales.lps_pagosumario ' +
                  '   set ps_usuarioemision = ' + SqlValue(Sesion.LoginName) + ', ' +
                  '       ps_fechaemision   = art.actualdate, ' +
                  '       ps_fechavencimiento = art.actualdate + 30' +
                  ' where ps_usuarioemision is null ' +
                  '   and ps_id = ' + SqlValue(FIdPagoSumario));

    sSql :=
      'UPDATE legales.lls_liquidacionsumario' +
      '   SET ls_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) +','+
      '       ls_paguesea = ' + SqlValue(fraPagueseA.Descripcion) + ','+
      '       ls_chequenombre = (SELECT ps_chequenombre '+
      '                            FROM legales.lps_pagosumario '+
      '                           WHERE ps_id = '+SqlValue(FIdPagoSumario)+' )'+
      ' WHERE ls_id = (SELECT ps_idliquidacion '+
      '                  FROM legales.lps_pagosumario '+
      '                 WHERE ps_id = '+SqlValue(FIdPagoSumario)+' )';
    EjecutarSqlST(sSql);
    sSql :=
      'UPDATE legales.lls_liquidacionsumario' +
      '   SET ls_usuemision = '+ SqlValue(Sesion.LoginName) + ','+
      '       ls_fechaemision = art.actualdate, '+
      '       ls_fechavencimiento = art.actualdate + 30'+
      ' WHERE ls_id = (SELECT ps_idliquidacion '+
      '                  FROM legales.lps_pagosumario '+
      '                 WHERE ps_id = '+SqlValue(FIdPagoSumario)+' )'+
      '   AND ls_usuemision IS NULL ';
    EjecutarSqlST(sSql);
  end;

  with TRptLiquidacionSumario.Create(Self) do
  try
    FAplica := ValorSql('SELECT is_aplicacion ' +
                        '  FROM legales.lis_importesentenciasumario, legales.lps_pagosumario ' +
                        ' WHERE ps_id = is_nropago ' +
                        '   AND ps_id = ' + SqlValue(FIdPagoSumario));

    VistaPrevia(FIdPagoSumario, edCantidadCopiasLiquidacion.Value);
  finally
    Free;
  end;

  Close;
end;

procedure TfrmLiquidacionPagoSumarios.fraPagueseAcmbDescripcionChange(Sender: TObject);
begin
  edChequeAlaOrdenDe.Text := fraPagueseA.Descripcion;
end;

end.
