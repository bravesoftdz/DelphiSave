unit unRptGestionDeReclamos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls,
  unArt, ArtQReports, StdCtrls;

type
  TfrmRptGestionDeReclamos = class(TForm)
    Hoja1: TQuickRep;
    Hoja2: TQuickRep;
    BandaDetalleH2: TQRBand;
    QRShape29: TQRShape;
    QRLabel38: TQRLabel;
    sdqAccidenteEstablecimiento: TSDQuery;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel45: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText69: TQRDBText;
    QRShape65: TQRShape;
    QRLabel84: TQRLabel;
    sdqTestigos: TSDQuery;
    CompositeReport: TQRCompositeReport;
    BandaTestigos: TQRLoopBand;
    Hoja3: TQuickRep;
    BandaDetalleH3: TQRBand;
    BandaCausas: TQRLoopBand;
    QRLabel39: TQRLabel;
    QRDBText78: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRLabel43: TQRLabel;
    sdqCausas: TSDQuery;
    QRDBText71: TQRDBText;
    QRLabel86: TQRLabel;
    QRShape32: TQRShape;
    Titulo39: TQRBand;
    qrLabelHuboTestigos: TQRLabel;
    Hoja4: TQuickRep;
    Titulo41: TQRBand;
    QRLabel88: TQRLabel;
    BandaMedidas: TQRLoopBand;
    QRDBText73: TQRDBText;
    BandaDetalleH4: TQRBand;
    BandaImplementacion: TQRLoopBand;
    QRDBText74: TQRDBText;
    QRLabel87: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    sdqMedidas: TSDQuery;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRShape30: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    sdqImplementacion: TSDQuery;
    QRDBText72: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape42: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    Hoja5: TQuickRep;
    Titulo43: TQRBand;
    QRShape104: TQRShape;
    QRLabel103: TQRLabel;
    BandaMultiple: TQRLoopBand;
    QRDBText87: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    BandaDetalleH5: TQRBand;
    QRShape112: TQRShape;
    QRLabel109: TQRLabel;
    sdqMultiple: TSDQuery;
    QRDBText88: TQRDBText;
    QRShape105: TQRShape;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape121: TQRShape;
    QRDBText95: TQRDBText;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    Hoja6: TQuickRep;
    Titulo45: TQRBand;
    QRShape115: TQRShape;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRShape117: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRLabel117: TQRLabel;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText103: TQRDBText;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRLabel118: TQRLabel;
    BandaEntrevistados: TQRLoopBand;
    QRLabel119: TQRLabel;
    QRDBText91: TQRDBText;
    QRLabel120: TQRLabel;
    QRDBText92: TQRDBText;
    QRLabel121: TQRLabel;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRLabel122: TQRLabel;
    BandaDetalleH6: TQRBand;
    QRBand1: TQRBand;
    QRLabel114: TQRLabel;
    Hoja7: TQuickRep;
    Titulo46: TQRBand;
    QRShape119: TQRShape;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel126: TQRLabel;
    QRShape122: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape116: TQRShape;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBText96: TQRDBText;
    QRDBText101: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText99: TQRDBText;
    QRShape118: TQRShape;
    QRShape123: TQRShape;
    QRLabel113: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape120: TQRShape;
    QRLabel130: TQRLabel;
    QRShape134: TQRShape;
    QRLabel131: TQRLabel;
    QRShape135: TQRShape;
    QRLabel132: TQRLabel;
    QRLabel90: TQRLabel;
    QRDBText83: TQRDBText;
    Sumario38: TQRBand;
    QRDBText82: TQRDBText;
    QRLabel85: TQRLabel;
    qshAE_TURNOROTATIVO: TQRShape;
    qshAE_TURNOROTATIVO2: TQRShape;
    qAE_TURNOROTATIVO: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRShape34: TQRShape;
    qAE_HORASEXTRAS: TQRLabel;
    QRLabel136: TQRLabel;
    qshAE_HORASEXTRAS2: TQRShape;
    QRLabel137: TQRLabel;
    QRDBText66: TQRDBText;
    QRDBText70: TArtQRDBText;
    sdqDatosLaborales: TSDQuery;
    sdqArticulo11: TSDQuery;
    sdqDetalleRemuneraciones: TSDQuery;
    sdqReclamo: TSDQuery;
    qrArticulo11iA2: TQuickRep;
    qrbArticulo11i2Title: TQRBand;
    QRShape46: TQRShape;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    qrbArticulo11i2Detail: TQRBand;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRShape57: TQRShape;
    sdqDetalleRemuneracionesPERIODO: TStringField;
    sdqDetalleRemuneracionesIMPORTEAMPO: TFloatField;
    sdqArticulo11IBM: TFloatField;
    BandaDetalleH1: TQRBand;
    QRShape1: TQRShape;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape18: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel31: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape23: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape24: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape26: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel35: TQRLabel;
    QRShape27: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText23: TQRLabel;
    QRDBText37: TQRLabel;
    QRShape33: TQRShape;
    QRShape61: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRLabel135: TQRLabel;
    QRDBText102: TQRDBText;
    QRLabel138: TQRLabel;
    QRDBText104: TQRDBText;
    qrbArticulo11i2Titulos: TQRChildBand;
    QRLabel148: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel150: TQRLabel;
    QRShape25: TQRShape;
    QRLabel149: TQRLabel;
    qrArticulo11iA5: TQuickRep;
    QRBand2: TQRBand;
    QRShape28: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText28: TQRDBText;
    QRBand3: TQRBand;
    QRShape31: TQRShape;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel51: TQRLabel;
    QRBand4: TQRBand;
    QRLabel52: TQRLabel;
    QRShape36: TQRShape;
    QRLabel53: TQRLabel;
    sdqArticulo11FECHA_RECEPCION_DENUNCIA: TDateTimeField;
    sdqArticulo11TJ_FNACIMIENTO: TDateTimeField;
    sdqArticulo11CB_FRECEPMORT: TDateTimeField;
    sdqDetalleDerechohabientes: TSDQuery;
    procedure Hoja1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BandaDetalleH1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CompositeReportAddReports(Sender: TObject);
    procedure BandaTestigosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure Hoja2BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BandaCausasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure qrLabelHuboTestigosPrint(sender: TObject; var Value: String);
    procedure BandaMedidasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure BandaImplementacionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BandaMultipleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure Hoja3BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Hoja4BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Hoja5BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Hoja6BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  public
    procedure ImprimirReporte(IdReclamo: Integer);
  end;

var
  frmRptGestionDeReclamos: TfrmRptGestionDeReclamos;

implementation

uses
  unDmPrincipal;

{$R *.DFM}

procedure TfrmRptGestionDeReclamos.Hoja1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqReclamo.RecordCount <> 1 then
    ShowMessage('Error en la consulta ejecutada. La consulta devolvió ' + IntToStr(sdqReclamo.RecordCount) + ' registros.' +  #13#10 + 'Verifique que no falte cargar algún dato o consulte con sistemas.');
end;

procedure TfrmRptGestionDeReclamos.BandaDetalleH1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
{
  with sdqAccidenteEstablecimiento do
  begin

    if   FieldByName('AE_TIPOESTABLECIMIENTO').AsString = 'O'
    then begin

      qAE_TIPOESTABLECIMIENTO.Left := qshAE_TIPOESTABLECIMIENTO.Left + 2;

      if   FieldByName('AE_PROGRAMAAPROBADO').AsString = 'N'
      then qAE_PROGRAMAAPROBADO.Left := qshAE_PROGRAMAAPROBADO2.Left + 2
      else if not(FieldByName('AE_PROGRAMAAPROBADO').AsString = 'S')
           then qAE_PROGRAMAAPROBADO.Enabled := False;

    end
    else qAE_PROGRAMAAPROBADO.Enabled := False;

    if  (FieldByName('AE_TURNOROTATIVO').AsString = 'N')
    then qAE_TURNOROTATIVO.Left := qshAE_TURNOROTATIVO2.Left + 2;

    if  (FieldByName('AE_HORASEXTRAS').AsString = 'N')
    then qAE_HORASEXTRAS.Left := qshAE_HORASEXTRAS2.Left + 2;

  end;
}
end;

procedure TfrmRptGestionDeReclamos.ImprimirReporte(IdReclamo: Integer);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  qriLogo.AutoSize := False;
  qriLogo.Stretch := True;
  qriLogo.Update;

  OpenQueryEx(sdqReclamo, [IdReclamo]);
  OpenQueryEx(sdqArticulo11, [IdReclamo]);
  OpenQueryEx(sdqDetalleRemuneraciones, [IdReclamo]);
  OpenQueryEx(sdqDetalleDerechohabientes, [IdReclamo]);
{
  sdqTestigos.ParamByName( 'ID' ).AsInteger                 := IdReclamo;
  sdqAccidenteEstablecimiento.ParamByName( 'ID' ).AsInteger := IdReclamo;
  OpenQuery( sdqAccidenteEstablecimiento );

  sdqDatosLaborales.ParamByName( 'Id_Trabajador' ).AsInteger     := sdqAccidenteEstablecimiento.FieldByName('TJ_ID').AsInteger;
  sdqDatosLaborales.ParamByName( 'Contrato' ).AsInteger          := sdqAccidenteEstablecimiento.FieldByName('CO_CONTRATO').AsInteger;
  sdqDatosLaborales.ParamByName( 'FechaAccidente' ).AsDateTime   := sdqAccidenteEstablecimiento.FieldByName('EX_FECHAACCIDENTE').AsDateTime;

  if sdqAccidenteEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').IsNull then
    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsString := ''
  else
    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsDateTime := sdqAccidenteEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').AsDateTime;

  OpenQuery( sdqDatosLaborales );

  sdqCausas.ParamByName( 'ID' ).AsInteger := IdReclamo;
  OpenQuery( sdqCausas );

  sdqMedidas.ParamByName( 'ID' ).AsInteger := IdReclamo;
  OpenQuery( sdqMedidas );

  sdqImplementacion.ParamByName( 'ID' ).AsInteger := IdReclamo;
  OpenQuery( sdqImplementacion );

  sdqMultiple.ParamByName( 'ID' ).AsInteger := IdReclamo;
  OpenQuery( sdqMultiple );

  BandaCausas.PrintCount         := sdqCausas.RecordCount;
  BandaMedidas.PrintCount        := sdqMedidas.RecordCount;
  BandaImplementacion.PrintCount := sdqImplementacion.RecordCount;
  BandaMultiple.PrintCount       := sdqMultiple.RecordCount;
}
  if BandaCausas.PrintCount = 0 then
    BandaCausas.PrintCount := 1;

  if BandaMedidas.PrintCount = 0 then
    BandaMedidas.PrintCount := 1;

  if BandaImplementacion.PrintCount = 0 then
    BandaImplementacion.PrintCount := 1;

  if BandaMultiple.PrintCount = 0 then
    BandaMultiple.PrintCount := 1;

  // Para la BandaEntrevistados ver el evento BandaTestigosAfterPrint...

  CompositeReport.Preview;
end;

procedure TfrmRptGestionDeReclamos.FormCreate(Sender: TObject);
var
  iLoop: Byte;
begin
  for iLoop := 0 to ComponentCount - 1 do
    if (Components[iLoop].ClassType = TQRDBText) and (not Assigned(TQRDBText(Components[iLoop]).DataSet)) then
      TQRDBText(Components[iLoop]).DataSet := sdqAccidenteEstablecimiento;
end;

procedure TfrmRptGestionDeReclamos.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add(Hoja1);
{
  CompositeReport.Reports.Add( Hoja2 );
  CompositeReport.Reports.Add( Hoja3 );
  CompositeReport.Reports.Add( Hoja4 );
  CompositeReport.Reports.Add( Hoja5 );
  CompositeReport.Reports.Add( Hoja6 );
}
  CompositeReport.Reports.Add(qrArticulo11iA2);
  CompositeReport.Reports.Add(qrArticulo11iA5);
end;

procedure TfrmRptGestionDeReclamos.BandaTestigosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not sdqTestigos.Eof then
    sdqTestigos.Next;
end;

procedure TfrmRptGestionDeReclamos.Hoja2BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqTestigos.Active then
    sdqTestigos.Close;

  sdqTestigos.ParamByName('tipo').AsString := 'T';

  OpenQuery(sdqTestigos);

  BandaTestigos.PrintCount := sdqTestigos.RecordCount;

  if BandaTestigos.PrintCount = 0 then
    BandaTestigos.PrintCount := 1;
end;

procedure TfrmRptGestionDeReclamos.BandaCausasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not sdqCausas.Eof then
    sdqCausas.Next;
end;

procedure TfrmRptGestionDeReclamos.qrLabelHuboTestigosPrint(Sender: TObject; var Value: String);
begin
  if BandaTestigos.PrintCount > 0 then
    Value := '';
end;

procedure TfrmRptGestionDeReclamos.BandaMedidasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not sdqMedidas.Eof then
    sdqMedidas.Next;
end;

procedure TfrmRptGestionDeReclamos.BandaImplementacionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not sdqImplementacion.Eof then
    sdqImplementacion.Next;
end;

procedure TfrmRptGestionDeReclamos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqAccidenteEstablecimiento.Close;
  sdqTestigos.Close;
  sdqCausas.Close;
  sdqMedidas.Close;
  sdqImplementacion.Close;
  sdqMultiple.Close;

  sdqReclamo.Close;
  sdqArticulo11.Close;
  sdqDetalleRemuneraciones.Close;
  sdqDetalleDerechohabientes.Close;
end;

procedure TfrmRptGestionDeReclamos.BandaMultipleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not sdqMultiple.Eof then
    sdqMultiple.Next;
end;

procedure TfrmRptGestionDeReclamos.Hoja3BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqCausas.Active then
    sdqCausas.First;
end;

procedure TfrmRptGestionDeReclamos.Hoja4BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqMedidas.Active then
    sdqMedidas.First;

  if sdqImplementacion.Active then
    sdqImplementacion.First;
end;

procedure TfrmRptGestionDeReclamos.Hoja5BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqMultiple.Active then
    sdqMultiple.First;
end;

procedure TfrmRptGestionDeReclamos.Hoja6BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  sdqTestigos.Close;
  sdqTestigos.ParamByName('tipo').AsString := 'E';
  OpenQuery(sdqTestigos);

  BandaEntrevistados.PrintCount := sdqTestigos.RecordCount;

  if BandaEntrevistados.PrintCount = 0 then
    BandaEntrevistados.PrintCount := 1;
end;

end.
