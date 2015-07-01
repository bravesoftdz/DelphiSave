unit UnRptLiqSumariosPagadas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unEspera,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase,
  Strfuncs;

type
  TRptLiqSumariosPagadas = class(TQuickRep)
    sdqLiquidacion: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrbDetalle: TQRBand;
    fbLiquidaciones: TQRBand;
    qrlLiquidadoPor: TQRLabel;
    qrgCabecera: TQRGroup;
    qrbPieBeneficiario: TQRBand;
    qrdbTipoBeneficiario: TQRDBText;
    qrdbConceptoPago: TQRDBText;
    qrdbFechaLiquidacion: TQRDBText;
    qrdbFactura: TQRDBText;
    qrdbFechaVencimiento: TQRDBText;
    QRLabel1: TQRLabel;
    qrdbNroJuicio: TQRDBText;
    qrlFechaLiquidacion: TQRLabel;
    qrlFacturaNro: TQRLabel;
    qrlFechaVencimiento: TQRLabel;
    QRSysData1: TQRSysData;
    qrlUsuario: TQRLabel;
    qrlFechaAprobacion: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    qrlConcepto: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlTipoBeneficiario: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    sduLiquidacion: TSDUpdateSQL;
    shaDetalle: TQRShape;
    QRExpr8: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    procedure sdqLiquidacionAfterScroll(DataSet: TDataSet);
  private
    procedure CargarDatosPagoFinancials;
  public
    procedure VistaPrevia(ASql: TSDQuery;
                          AFechaDesde, AFechaHasta: TDate; ACopias : Integer);
  end;

implementation

uses
  AnsiSql, unDmPrincipal, Dialogs, unSesion, unDmFinancials, CUIT, unComunes;

{$R *.DFM}
procedure TRptLiqSumariosPagadas.VistaPrevia(ASql: TSDQuery;
                                               AFechaDesde, AFechaHasta: TDate;
                                               ACopias : Integer);
begin
  try
    qrlUsuario.Caption := Sesion.LoginName;
    if AFechaDesde = AFechaHasta then
      qrlFechaAprobacion.Caption := 'con Orden de Pago del ' +
                                    DateToStr (AFechaDesde)
    else
      qrlFechaAprobacion.Caption := 'con Orden de Pago del ' +
                                    DateToStr (AFechaDesde) + ' al ' +
                                    DateToStr (AFechaHasta);

    with sdqLiquidacion do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql.SQL.Text;

      ParamByName('fechadesde').AsDate := AFechaDesde;
      ParamByName('fechahasta').AsDate := AFechaHasta;
      Open;

      CargarDatosPagoFinancials;
      sdqLiquidacion.First
    end;

    self.PrinterSettings.Copies := ACopias;
    self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;

procedure TRptLiqSumariosPagadas.sdqLiquidacionAfterScroll(
  DataSet: TDataSet);
begin
  if Odd (DataSet.RecNo) then
    shaDetalle.Brush.Color := clSkyBlue
  else
    shaDetalle.Brush.Color := clWhite
end;

procedure TRptLiqSumariosPagadas.CargarDatosPagoFinancials;
var
  bFnlActive: Boolean;
  sdqFnclDatos: TSDQuery;
  sSql: String;
begin
  IniciarEspera;

  bFnlActive := dmFinancials.Active;
  sdqLiquidacion.DisableControls;
  sdqFnclDatos := TSDQuery.Create( Self );

  try
    try
      dmFinancials.Active := True;

      sSql := 'SELECT ac.check_id ordennro, TRUNC (ac.check_date) ordenfecha, ' +
              '       ac.check_number chequenro, TRUNC (ac.check_date) chequefecha ' +
              '  FROM ap.ap_invoices_all ai, ' +
              '       ap.ap_invoice_payments_all aip, ' +
              '       ap.ap_checks_all ac ' +
              ' WHERE ai.invoice_id = aip.invoice_id ' +
              '   AND aip.check_id = ac.check_id ' +
              '   AND ai.pay_group_lookup_code = ''LEGALES_SIART'' ' +
              '   AND ac.status_lookup_code <> ''VOID'' ' +
              '   AND ROWNUM = 1 ' +
              '   AND ai.invoice_num = :pletrafactura || ''-'' || :psituacionfactura || ''-'' || :pnumerofactura ' +
              '   AND ai.vendor_id = :vendor_id';

      dmFinancials.SetDatabaseToQuery( sdqFnclDatos );
      sdqFnclDatos.SQL.Text := sSql;

      sdqLiquidacion.First;
      while not sdqLiquidacion.EOF do
      begin
        sdqFnclDatos.ParamByName( 'pletrafactura' ).AsString    := 'A';
        sdqFnclDatos.ParamByName( 'psituacionfactura' ).AsString:= lPad(sdqLiquidacion.FieldByName('ps_idbeneficiariopago').AsString, '0', 4);
        sdqFnclDatos.ParamByName( 'pnumerofactura' ).AsString   := lPad(sdqLiquidacion.FieldByName('ps_idsumario').AsString ,'0', 6) +
                                                                   lPad(sdqLiquidacion.FieldByName('ps_numpago').AsString, '0', 2);
        sdqFnclDatos.ParamByName( 'vendor_id' ).AsInteger       := Get_VendorID (PonerGuiones (sdqLiquidacion.FieldByName ('ps_cuitcuil').AsString), 'CUIT');

        dmFinancials.OpenQuery( sdqFnclDatos );

        if sdqFnclDatos.FieldByName( 'OrdenNro' ).Value > 0 then
        begin
          sdqLiquidacion.Edit;
          sdqLiquidacion.FieldByName( 'OrdenNro' ).Value    :=  sdqFnclDatos.FieldByName( 'OrdenNro' ).Value;
          sdqLiquidacion.FieldByName( 'OrdenFecha' ).Value  :=  sdqFnclDatos.FieldByName( 'OrdenFecha' ).Value;
          sdqLiquidacion.FieldByName( 'ChequeNro' ).Value   :=  sdqFnclDatos.FieldByName( 'ChequeNro' ).Value;
          sdqLiquidacion.FieldByName( 'ChequeFecha' ).Value :=  sdqFnclDatos.FieldByName( 'ChequeFecha' ).Value;
          sdqLiquidacion.Post;

          sdqLiquidacion.Next
        end
        else
          sdqLiquidacion.Delete;

        sdqFnclDatos.Close;
      end;
    except
      on E : Exception do;
    end;
  finally
    sdqFnclDatos.Free;
    sdqLiquidacion.EnableControls;
    dmFinancials.Active := bFnlActive;
    DetenerEspera;
  end;
end;

end.


