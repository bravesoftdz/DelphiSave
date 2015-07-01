unit unImpresionConceptoPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,
  DateComboBox, unArtFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt, PatternEdit, CurrEdit, DB, SDEngine,
  IntEdit, ComCtrls, ToolWin, RXDBCtrl, unSesion, CustomDlgs, JvExControls, JvComponent, JvXPCore, JvXPButtons,
  unArtDBAwareFrame, CUIT;

type

  TTipo = (tJuicio, tMediacion);

  TfrmImpresionConceptoPago = class(TForm)
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
    udCantidadReciboLiquidacion: TUpDown;
    lblCantidadCopias: TLabel;
    edCantidadCopiasReciboLiquidacion: TIntEdit;
    udCantidadLiquidacion: TUpDown;
    lblLiquidacion: TLabel;
    edCantidadCopiasLiquidacion: TIntEdit;
    fraPagueseA: TfraCodigoDescripcionExt;
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure fraPagueseAcmbDescripcionChange(Sender: TObject);
  private
    FIdPago: Integer;
    FTipo: TTipo;

    procedure CargaDatosPago;
    procedure Init;
    procedure LimpiarCamposPago;
  public
    procedure Imprimir;
    property IdPago: Integer      read FIdPago           write FIdPago;
    property Tipo: TTipo          read FTipo             write FTipo;
  end;


implementation

uses
	unDmPrincipal, StrFuncs, UnRptLiquidacion, DateUtils, SqlFuncs, AnsiSql,
  UnRptReciboLiquidacion, UnRptLiquidacionMediacion, UnRptReciboLiquidacionMediacion,
  VCLExtra;

{$R *.dfm}

{ TfrmImpresionConceptoPago }

procedure TfrmImpresionConceptoPago.Imprimir;
begin
  LimpiarCamposPago;
  Init;
  CargaDatosPago;
  ShowModal;
end;

procedure TfrmImpresionConceptoPago.Init;
var
  sTipoPago: String;
begin
  case Tipo of
    tJuicio:    sTipoPago := 'L';
    tMediacion: sTipoPago := 'D';
  end;

  with fraConceptoPago  do
  begin
    TableName 		 := 'scp_conpago';
    fieldid 			 := 'cp_conpago';
    FieldCodigo 	 := 'cp_conpago';
    FieldDesc 		 := 'cp_denpago';
    ExtraFields 	 := ', cp_ctapago ';
//    ExtraCondition := 'and cp_tipo= ' + SqlValue(sTipoPago);
  end;

  with fraTipoBeneficiario  do
  begin
    TableName 	:= 'legales.lbp_beneficiariopago';
    fieldid 		:= 'bp_id';
    FieldCodigo := 'bp_id';
    FieldDesc 	:= 'bp_descripcion';
  end;
end;

procedure TfrmImpresionConceptoPago.CargaDatosPago;
var
  sSql: String;
  bEsTrabajador: Boolean;
begin
  case Tipo of
    tJuicio:
      sSql := 'SELECT pl_conpago conpago, pl_idbeneficiariopago idbeneficiariopago, pl_detallebeneficiario detallebeneficiario, ' +
                     'pl_letrafactura letrafactura, pl_situacionfactura situacionfactura, pl_numerofactura numerofactura, pl_fechafactura fechafactura, ' +
                     'pl_fechavencimientopago fechavencimientopago, pl_comentario comentario, pl_importepago importepago, pl_importeconretencion importeconretencion, ' +
                     'pl_cuitcuil cuitcuil, pl_chequenombre chequenombre, pl_fechaemision fechaemision, pl_fechavencimiento fechavencimiento, pl_paguesea paguesea, ' +
                     'pl_iddetallebeneficiario iddetallebeneficiario ' +
                'FROM legales.lpl_pagolegal ' +
               'WHERE pl_id = :Id';

    tMediacion:
      sSql := 'SELECT pm_conpago conpago, pm_idbeneficiariopago idbeneficiariopago, pm_detallebeneficiario detallebeneficiario, ' +
                     'pm_letrafactura letrafactura, pm_situacionfactura situacionfactura, pm_numerofactura numerofactura, pm_fechafactura fechafactura, ' +
                     'pm_fechavencimientopago fechavencimientopago, pm_comentario comentario, pm_importepago importepago, pm_importeconretencion importeconretencion, ' +
                     'pm_cuitcuil cuitcuil, pm_chequenombre chequenombre, pm_fechaemision fechaemision, pm_fechavencimiento fechavencimiento, pm_paguesea paguesea, ' +
                     'pm_iddetallebeneficiario iddetallebeneficiario ' +
                'FROM legales.lpm_pagomediacion ' +
               'WHERE pm_id = :Id';
  end;

  with GetQueryEx(sSql, [FIdPago]) do
  begin
    fraConceptoPago.Codigo            := FieldByName('conpago').AsString;
    edNroCuentaImputacionPago.Text    := fraConceptoPago.sdqDatos.FieldByName('cp_ctapago').AsString;
    fraTipoBeneficiario.Codigo        := FieldByName('idbeneficiariopago').AsString;
    //Busco el Beneficiario. De no encontrarlo lo agrego. Me posiciono en ese.
    cmbBeneficiarios.Items.Add(FieldByName('detallebeneficiario').AsString);
    cmbBeneficiarios.ItemIndex := 0;

    bEsTrabajador := (strtoint(fraTipoBeneficiario.Codigo) = 2);        // trabajadores
    VCLExtra.LockControls([fraPagueseA, edChequeAlaOrdenDe], bEsTrabajador);

    if bEsTrabajador then
      begin
        with fraPagueseA do
        begin
          TableName 		 := 'ctj_trabajador';
          FieldId 			 := 'tj_id';
          FieldCodigo 	 := 'tj_cuil';
          FieldDesc 		 := 'tj_nombre';
        end;

        fraPagueseA.Value       := FieldByName('iddetallebeneficiario').AsInteger;
        edChequeAlaOrdenDe.Text := FieldByName('detallebeneficiario').AsString;
      end
    else
      begin
        with fraPagueseA do
        begin
          TableName 		 := 'spa_pagoacre';
          FieldId 			 := 'pa_cuitcuil';
          FieldCodigo 	 := 'pa_cuitcuil';
          FieldDesc 		 := 'pa_denomina';
          ExtraCondition := ' AND pa_acreedor IN (''OA'', ''PA'') AND pa_formacobro IN (''CH'', ''PE'')';
        end;

        fraPagueseA.Codigo      := FieldByName('cuitcuil').AsString;
        edChequeAlaOrdenDe.Text := FieldByName('chequenombre').AsString;
      end;

    peLetraFactura.Text               := FieldByName('letrafactura').AsString;
    meSituacionFactura.Text           := FieldByName('situacionfactura').AsString;
    meNumeroFactura.Text              := FieldByName('numerofactura').AsString;
    edFechaFacturaPago.Date           := FieldByName('fechafactura').AsDateTime;
    dcbFechaVencimientoPago.Date      := FieldByName('fechavencimientopago').AsDateTime;
    edObservaciones.Text              := FieldByName('comentario').AsString;
    edImpSinRetencionesGanPagos.Value := FieldByName('importepago').AsCurrency;
    edImpSujetoaRetGanaciasPago.Value := FieldByName('importeconretencion').AsCurrency;

    edFechaEmision.Date               := FieldByName('fechaemision').AsDateTime;
    edFechaVencimiento.Date           := FieldByName('fechavencimiento').AsDateTime;

    gbPago.Enabled                    := IsEmptyString(FieldByName('paguesea').AsString)
  end;
end;

procedure TfrmImpresionConceptoPago.LimpiarCamposPago;
begin
  fraConceptoPago.Limpiar;
  fraTipoBeneficiario.Limpiar;

  edNroCuentaImputacionPago.Clear;
  edFechaEmision.Clear;
  edFechaVencimiento.Clear;
  edChequeAlaOrdenDe.Clear;

  edCantidadCopiasLiquidacion.Value       := 2;
  edCantidadCopiasReciboLiquidacion.Value := 2;
end;

procedure TfrmImpresionConceptoPago.btnAceptarSentenciaClick(Sender: TObject);
var
	sSql: String;
begin
  VerificarMultiple(['Guardando Pago',
                     fraPagueseA,
                     fraPagueseA.Codigo <> '',
                     'Debe completar el Autorizado al Cobro.',
                     fraPagueseA, IsCUIT(fraPagueseA.Codigo) or IsCUIL(fraPagueseA.Codigo),
                                  'No puede autorizarse el pago pués el Autorizado no tiene un CUIT/CUIL válido.'
                     ]);

  case Tipo of
    tJuicio:
      begin
        sSql :=
          'UPDATE legales.lpl_pagolegal' +
            ' SET pl_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) +
          ' WHERE pl_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.lpl_pagolegal' +
            ' SET pl_paguesea = ' + SqlValue(fraPagueseA.Descripcion) +
          ' WHERE pl_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        if not IsEmptyString(edChequeAlaOrdenDe.Text) then
          sSql :=
            'UPDATE legales.lpl_pagolegal' +
              ' SET pl_chequenombre = ' + SqlValue(edChequeAlaOrdenDe.Text) +
            ' WHERE pl_id = ' + SqlValue(FIdPago)
        else
          sSql :=
            'UPDATE legales.lpl_pagolegal' +
              ' SET pl_chequenombre = pl_detallebeneficiario' +
            ' WHERE pl_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.lpl_pagolegal' +
            ' SET pl_usuarioemision = ' + SqlValue(Sesion.LoginName) +
               ', pl_fechaemision = art.actualdate' +
               ', pl_fechavencimiento = art.actualdate + 30' +
          ' WHERE pl_usuarioemision is null' +
            ' AND pl_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.llj_liquidacionjuicio' +
          '   SET lj_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) +','+
          '       lj_paguesea = ' + SqlValue(fraPagueseA.Descripcion) + ','+
          '       lj_chequenombre = (SELECT pl_chequenombre '+
          '                            FROM legales.lpl_pagolegal '+
          '                           WHERE pl_id = '+SqlValue(FIdPago)+' )'+
          ' WHERE lj_id = (SELECT pl_idliquidacion '+
          '                  FROM legales.lpl_pagolegal '+
          '                 WHERE pl_id = '+SqlValue(FIdPago)+' )';
        EjecutarSqlST(sSql);
        sSql :=
          'UPDATE legales.llj_liquidacionjuicio' +
          '   SET lj_usuemision = '+ SqlValue(Sesion.LoginName) + ','+
          '       lj_fechaemision = art.actualdate, '+
          '       lj_fechavencimiento = art.actualdate + 30'+
          ' WHERE lj_id = (SELECT pl_idliquidacion '+
          '                  FROM legales.lpl_pagolegal '+
          '                 WHERE pl_id = '+SqlValue(FIdPago)+' )'+
          '   AND lj_usuemision IS NULL ';
        EjecutarSqlST(sSql);

        with TRptLiquidacion.Create(Self) do
        try
          VistaPrevia(FIdPago, edCantidadCopiasLiquidacion.Value);
        finally
          Free;
        end;

        with TRptReciboLiquidacion.Create(Self) do
        try
          VistaPrevia(FIdPago, edCantidadCopiasReciboLiquidacion.Value);
        finally
          Free;
        end;
      end;

    tMediacion:
      begin
        sSql :=
          'UPDATE legales.lpm_pagomediacion' +
            ' SET pm_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) +
          ' WHERE pm_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.lpm_pagomediacion' +
            ' SET pm_paguesea = ' + SqlValue(fraPagueseA.Descripcion) +
          ' WHERE pm_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        if not IsEmptyString(edChequeAlaOrdenDe.Text) then
          sSql :=
            'UPDATE legales.lpm_pagomediacion' +
              ' SET pm_chequenombre = ' + SqlValue(edChequeAlaOrdenDe.Text) +
            ' WHERE pm_id = ' + SqlValue(FIdPago)
        else
          sSql :=
            'UPDATE legales.lpm_pagomediacion' +
              ' SET pm_chequenombre = pm_detallebeneficiario' +
            ' WHERE pm_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.lpm_pagomediacion' +
            ' SET pm_usuarioemision = ' + SqlValue(Sesion.LoginName) +
               ', pm_fechaemision = art.actualdate' +
               ', pm_fechavencimiento = art.actualdate + 30' +
          ' WHERE pm_usuarioemision is null' +
            ' AND pm_id = ' + SqlValue(FIdPago);
        EjecutarSqlST(sSql);

        sSql :=
          'UPDATE legales.llm_liquidacionmediacion' +
          '   SET lm_cuitcuil = ' + SqlValue(fraPagueseA.Codigo) +','+
          '       lm_paguesea = ' + SqlValue(fraPagueseA.Descripcion) + ','+
          '       lm_chequenombre = (SELECT pm_chequenombre '+
          '                            FROM legales.lpm_pagomediacion '+
          '                           WHERE pm_id = '+SqlValue(FIdPago)+' )'+
          ' WHERE lm_id = (SELECT pm_idliquidacion '+
          '                  FROM legales.lpm_pagomediacion '+
          '                 WHERE pm_id = '+SqlValue(FIdPago)+' )';
        EjecutarSqlST(sSql);
        sSql :=
          'UPDATE legales.llm_liquidacionmediacion' +
          '   SET lm_usuemision = '+ SqlValue(Sesion.LoginName) + ','+
          '       lm_fechaemision = art.actualdate, '+
          '       lm_fechavencimiento = art.actualdate + 30'+
          ' WHERE lm_id = (SELECT pm_idliquidacion '+
          '                  FROM legales.lpm_pagomediacion '+
          '                 WHERE pm_id = '+SqlValue(FIdPago)+' )'+
          '   AND lm_usuemision IS NULL ';
        EjecutarSqlST(sSql);

        with TRptLiquidacionMediacion.Create(Self) do
        try
          VistaPrevia(FIdPago, edCantidadCopiasLiquidacion.Value);
        finally
          Free;
        end;

        with TRptReciboLiquidacionMediacion.Create(Self) do
        try
          VistaPrevia(FIdPago, edCantidadCopiasReciboLiquidacion.Value);
        finally
          Free;
        end;
      end;
  end;

  Close;
end;

procedure TfrmImpresionConceptoPago.fraPagueseAcmbDescripcionChange(Sender: TObject);
begin
  edChequeAlaOrdenDe.Text := fraPagueseA.Descripcion;
end;

end.

