unit unQRNotificacionClienteRevisionPrecios;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unQRLabelEx, jpeg;

type
  TQRNotificacionClienteRevisionPrecios = class(TQuickRep)
    bFormatoNuevo: TQRBand;
    Query: TSDQuery;
    bFormatoViejo: TQRStringsBand;
    QRShape25: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage1: TQRImage;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel63: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    memoFinal: TQRMemo;
    QRLabel66: TQRLabel;
    QRShape26: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    qrImgBanco: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    qrCosto1: TQRLabel;
    qrCosto2: TQRLabel;
    QRLabel13: TQRLabel;
    qrEmpr1: TQRLabel;
    qrEmpr2: TQRLabel;
    qrLugarFecha: TQRLabel;
    qrImgProv: TQRImage;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    qrEmpr3: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrEmpr4: TQRLabel;
    qrEmpr5: TQRLabel;
    qrEmpr6: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape6: TQRShape;
    QRShape14: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel31: TQRLabel;
    QRShape13: TQRShape;
    qrImporte3: TQRLabel;
    qrImporte2: TQRLabel;
    qrImporte1: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape15: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape5: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel52: TQRLabel;
    qrAlicuotaVariable: TQRLabel;
    QRLabel53: TQRLabel;
    qrCuotaInicialDe: TQRLabel;
    QRLabel54: TQRLabel;
    qrSumaAsegurada: TQRLabel;
    QRShape9: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape8: TQRShape;
    QRLabel61: TQRLabel;
    QRImage2: TQRImage;
    QRShape19: TQRShape;
    procedure QRDBText3Print(Sender: TObject; var Value: String);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure qrEmpr2Print(Sender: TObject; var Value: String);
    procedure AgregarEspacioInicial(Sender: TObject; var Value: String);
    procedure bFormatoNuevoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bFormatoViejoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  public
    procedure Preparar(const aRevisionId: Integer; const aNombreArchivo: String = '');
  end;

var
  QRNotificacionClienteRevisionPrecios: TQRNotificacionClienteRevisionPrecios;

implementation

{$R *.DFM}

uses
  CUIT, unDmPrincipal {$IFNDEF SERVICE},unVisualizador{$ENDIF}, Strfuncs, unExportPDF;

procedure TQRNotificacionClienteRevisionPrecios.Preparar(const aRevisionId: Integer; const aNombreArchivo: String = '');
begin
  qrImgProv.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_ARTCOLOR');
  OpenQueryEx(Query, [aRevisionId]);

  with Query do
  begin
    qrLugarFecha.Caption := '  ' + FormatDateTime('dd/mm/yyyy', FieldByName('sr_fechanotificacioncomercial').AsDateTime) + '  ';
    qrEmpr1.Caption := FieldByName('hm_nombre').AsString;
    qrEmpr2.Caption := FieldByName('sr_cuit').AsString;
    qrEmpr3.Caption := FieldByName('ciiu').AsString;
    qrEmpr4.Caption := FieldByName('sr_actividadreal').AsString;
    qrEmpr5.Caption := FieldByName('cantidadtrab').AsString;
    qrEmpr6.Caption := Get_AjusteDecimales(FieldByName('masasalarial').AsString, '$ ');
    qrCosto1.Caption 	 := FormatFloat('$ #,##0.00', FieldByName('sr_costofijocotizado').AsFloat);
    qrCosto2.Caption 	 := FormatFloat('% ##0.000', FieldByName('sr_porcentajevariablecotizado').AsFloat);
    qrImporte1.Caption := FormatFloat('$ #,##0.00', FieldByName('cuotaanual').AsFloat);
    qrImporte2.Caption := FormatFloat('$ #,##0.00', FieldByName('cuotamensual').AsFloat);
    qrImporte3.Caption := FormatFloat('$ #,##0.00', FieldByName('cuotaxtrab').AsFloat);

    //qrAlicuotaVariable.Caption := FormatFloat('% ##0.000', Query.FieldByName('valor_rc').AsFloat);
    //qrCuotaInicialDe.Caption   := FormatFloat('$ ##0.000', Query.FieldByName('cuotainicialrc').AsFloat);
    //qrSumaAsegurada.Caption    := FormatFloat('$ ##0.000', Query.FieldByName('sumaasegurada_rc').AsFloat);

    if Query.FieldByName('sr_idmotivocotizacion').AsInteger = 61 then   // Reafiliación - alícuotas para reafiliar..
      memoFinal.Lines.Text := Format(memoFinal.Lines.Text, ['hasta tanto no se suscriba la solicitud de cobertura'])
    else
      memoFinal.Lines.Text := Format(memoFinal.Lines.Text, ['hasta tanto se emita el endoso respectivo']);

    // Elige el tamaño de las imagenes
    // Hay que tener en cuenta que para que una imagen se vea bien, es necesario ponerla mas grande y achicarla cambiando el height y el width
    qrImgProv.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    if (FieldByName('ac_codigo').AsString = '001') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GBP');
      qrImgBanco.Width := 97;
      qrImgProv.Left   := 459;
    end
    else if (FieldByName('ac_codigo').AsString = '002') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_BNACION');
      qrImgBanco.Width := 239;
      qrImgProv.Left   := 459;
    end
    else if (FieldByName('ac_codigo').AsString = '203') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_CIUDAD');
      qrImgBanco.Width  := 140;
      qrImgBanco.Height := 28;
      qrImgBanco.Top    := qrImgBanco.Top + 14;
      qrImgProv.Left    := 459;
    end;
  end;

  if aNombreArchivo > '' then
    FileToPDFSvr(Self, ExtractFilePath(aNombreArchivo), aNombreArchivo, False)
  else
{$IFNDEF SERVICE}
    Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie, oForceDB, oForceShowModal], True, '',
               '', True);
{$ENDIF}
end;

procedure TQRNotificacionClienteRevisionPrecios.QRDBText3Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TQRNotificacionClienteRevisionPrecios.QueryAfterOpen(DataSet: TDataSet);
begin
  TDateField(DataSet.FieldByName('sr_fechanotificacioncomercial')).DisplayFormat := 'dd/mm/yyyy';

  TFloatField(DataSet.FieldByName('sr_porcentajevariablecotizado')).DisplayFormat := '0.000%';

  TFloatField(DataSet.FieldByName('cuotaanual')).DisplayFormat           := '$ ,0.00';
  TFloatField(DataSet.FieldByName('cuotamensual')).DisplayFormat         := '$ ,0.00';
  TFloatField(DataSet.FieldByName('cuotaxtrab')).DisplayFormat           := '$ ,0.00';
  TFloatField(DataSet.FieldByName('masasalarial')).DisplayFormat         := '$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_costofijocotizado')).DisplayFormat := '$ ,0.00';
end;

procedure TQRNotificacionClienteRevisionPrecios.qrEmpr2Print(Sender: TObject; var Value: String);
begin
  Value := ' ' + PonerGuiones(Value);
end;

procedure TQRNotificacionClienteRevisionPrecios.AgregarEspacioInicial(Sender: TObject; var Value: String);
begin
  Value := ' ' + Value;
end;

procedure TQRNotificacionClienteRevisionPrecios.bFormatoNuevoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Imprimo en el formato nuevo si el motivo es 6 o 6.1..
  with Query do
    PrintBand := (FieldByName('sr_idmotivosolicitud').AsInteger = 9) or (FieldByName('sr_idmotivosolicitud').AsInteger = 21);
end;

procedure TQRNotificacionClienteRevisionPrecios.bFormatoViejoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Imprimo en el formato viejo si el motivo NO es 6 NI 6.1..
  with Query do
    PrintBand := (FieldByName('sr_idmotivosolicitud').AsInteger <> 9) and (FieldByName('sr_idmotivosolicitud').AsInteger <> 21);
end;

end.
