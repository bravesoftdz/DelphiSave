unit unqrInvestigacionAccidente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports, StdCtrls;

type
  TfrmqrInvestigacionAccidente = class(TForm)
    Hoja1: TQuickRep;
    BandaDetalleH1: TQRBand;
    QRShape40: TQRShape;
    QRLabel63: TQRLabel;
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
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
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
    QRShape28: TQRShape;
    QRLabel37: TQRLabel;
    QRShape35: TQRShape;
    QRDBText24: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel49: TQRLabel;
    QRShape36: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText32: TQRDBText;
    QRShape37: TQRShape;
    QRLabel56: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape38: TQRShape;
    QRLabel59: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel61: TQRLabel;
    QRShape39: TQRShape;
    QRDBText39: TQRDBText;
    QRLabel62: TQRLabel;
    qshAE_TIPOESTABLECIMIENTO: TQRShape;
    QRShape41: TQRShape;
    qAE_TIPOESTABLECIMIENTO: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText40: TQRDBText;
    QRShape43: TQRShape;
    QRLabel65: TQRLabel;
    QRDBText41: TQRDBText;
    QRShape44: TQRShape;
    QRLabel67: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText42: TQRDBText;
    QRShape45: TQRShape;
    QRLabel68: TQRLabel;
    QRShape49: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText45: TQRDBText;
    Hoja2: TQuickRep;
    BandaDetalleH2: TQRBand;
    QRShape29: TQRShape;
    QRLabel38: TQRLabel;
    sdqAccidenteEstablecimiento: TSDQuery;
    QRShape25: TQRShape;
    QRLabel71: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape50: TQRShape;
    QRLabel73: TQRLabel;
    QRDBText48: TQRDBText;
    QRShape51: TQRShape;
    QRDBText49: TQRDBText;
    QRLabel74: TQRLabel;
    QRShape31: TQRShape;
    QRDBText50: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape52: TQRShape;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape53: TQRShape;
    qshAE_PROGRAMAAPROBADO2: TQRShape;
    QRShape58: TQRShape;
    QRDBText51: TQRDBText;
    QRLabel77: TQRLabel;
    QRShape59: TQRShape;
    QRLabel78: TQRLabel;
    QRDBText52: TQRDBText;
    QRShape60: TQRShape;
    QRLabel79: TQRLabel;
    QRDBText53: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText23: TQRLabel;
    QRDBText37: TQRLabel;
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
    QRShape33: TQRShape;
    QRShape61: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRDBText85: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape42: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
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
    qAE_PROGRAMAAPROBADO: TQRLabel;
    QRDBText100: TQRDBText;
    BandaSumario30: TQRBand;
    QRDBText54: TQRDBText;
    QRLabel80: TQRLabel;
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
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText70: TArtQRDBText;
    sdqDatosLaborales: TSDQuery;
    QRLabel135: TQRLabel;
    QRDBText102: TQRDBText;
    QRLabel138: TQRLabel;
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
    procedure QRDBText46Print(sender: TObject; var Value: String);
  public
    procedure Do_Imprimir(IdAccidenteEstablecimiento: TTableId;pPath : String = '');
    procedure ExportPDF(IdAccidenteEstablecimiento: TTableId;pPath : String);
  end;

var
  frmqrInvestigacionAccidente: TfrmqrInvestigacionAccidente;

implementation

uses
  unDmPrincipal, ArchFuncs, unExportPDF, Numeros;

{$R *.DFM}

procedure TfrmqrInvestigacionAccidente.Hoja1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqAccidenteEstablecimiento.RecordCount <> 1
  then ShowMessage('Error en la consulta ejecutada. La consulta devolvió ' + IntToStr(sdqAccidenteEstablecimiento.RecordCount) + ' registros.' +  #13#10 + 'Verifique que no falte cargar algún dato o consulte con sistemas.');
end;

procedure TfrmqrInvestigacionAccidente.BandaDetalleH1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
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
end;

procedure TfrmqrInvestigacionAccidente.Do_Imprimir(IdAccidenteEstablecimiento: TTableId; pPath : String = '');
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_ART' );
  qriLogo.AutoSize := False;
  qriLogo.Stretch := True;
  qriLogo.Update;

  sdqTestigos.ParamByName( 'ID' ).AsInteger                 := IdAccidenteEstablecimiento;
  sdqAccidenteEstablecimiento.ParamByName( 'ID' ).AsInteger := IdAccidenteEstablecimiento;
  OpenQuery( sdqAccidenteEstablecimiento );

  sdqDatosLaborales.ParamByName( 'Id_Trabajador' ).AsInteger     := sdqAccidenteEstablecimiento.FieldByName('TJ_ID').AsInteger;
  sdqDatosLaborales.ParamByName( 'Contrato' ).AsInteger          := sdqAccidenteEstablecimiento.FieldByName('CO_CONTRATO').AsInteger;
  sdqDatosLaborales.ParamByName( 'FechaAccidente' ).AsDateTime   := sdqAccidenteEstablecimiento.FieldByName('EX_FECHAACCIDENTE').AsDateTime;

  if sdqAccidenteEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').IsNull then
    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsString := ''
  else
    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsDateTime := sdqAccidenteEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').AsDateTime;

  OpenQuery( sdqDatosLaborales );

  sdqCausas.ParamByName( 'ID' ).AsInteger := IdAccidenteEstablecimiento;
  OpenQuery( sdqCausas );

  sdqMedidas.ParamByName( 'ID' ).AsInteger := IdAccidenteEstablecimiento;
  OpenQuery( sdqMedidas );

  sdqImplementacion.ParamByName( 'ID' ).AsInteger := IdAccidenteEstablecimiento;
  OpenQuery( sdqImplementacion );

  sdqMultiple.ParamByName( 'ID' ).AsInteger := IdAccidenteEstablecimiento;
  OpenQuery( sdqMultiple );

  BandaCausas.PrintCount         := sdqCausas.RecordCount;
  BandaMedidas.PrintCount        := sdqMedidas.RecordCount;
  BandaImplementacion.PrintCount := sdqImplementacion.RecordCount;
  BandaMultiple.PrintCount       := sdqMultiple.RecordCount;

  if   BandaCausas.PrintCount = 0
  then BandaCausas.PrintCount := 1;

  if   BandaMedidas.PrintCount = 0
  then BandaMedidas.PrintCount := 1;

  if   BandaImplementacion.PrintCount = 0
  then BandaImplementacion.PrintCount := 1;

  if   BandaMultiple.PrintCount = 0
  then BandaMultiple.PrintCount := 1;

  // Para la BandaEntrevistados ver el evento BandaTestigosAfterPrint...

  if pPath = '' then
    CompositeReport.Preview
  else
  begin
    CompositeReport.Prepare;
    CompositeReport.QRPrinter.Title := pPath;
    CompositeReport.QRPrinter.Print;
    CompositeReport.QRPrinter.Free;
    CompositeReport.QRPrinter.Cleanup;
  end;
end;

procedure TfrmqrInvestigacionAccidente.FormCreate(Sender: TObject);
var
  i: byte;
begin
  for i := 0 to ComponentCount-1
  do if  (Components[i].ClassType = TQRDBText)
     and (not Assigned(TQRDBText(Components[i]).DataSet))
     then TQRDBText(Components[i]).DataSet := sdqAccidenteEstablecimiento;
end;

procedure TfrmqrInvestigacionAccidente.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add( Hoja1 );
  CompositeReport.Reports.Add( Hoja2 );
  CompositeReport.Reports.Add( Hoja3 );
  CompositeReport.Reports.Add( Hoja4 );
  CompositeReport.Reports.Add( Hoja5 );
  CompositeReport.Reports.Add( Hoja6 );
  CompositeReport.Reports.Add( Hoja7 );
end;

procedure TfrmqrInvestigacionAccidente.BandaTestigosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqTestigos.Eof
  then sdqTestigos.Next;
end;

procedure TfrmqrInvestigacionAccidente.Hoja2BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqTestigos.Active
  then sdqTestigos.Close;

  sdqTestigos.ParamByName( 'TIPO' ).AsString := 'T';

  OpenQuery( sdqTestigos );

  BandaTestigos.PrintCount := sdqTestigos.RecordCount;

  if   BandaTestigos.PrintCount = 0
  then BandaTestigos.PrintCount := 1;
end;

procedure TfrmqrInvestigacionAccidente.BandaCausasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqCausas.Eof
  then sdqCausas.Next;
end;

procedure TfrmqrInvestigacionAccidente.qrLabelHuboTestigosPrint(Sender: TObject; var Value: String);
begin
  if BandaTestigos.PrintCount > 0 then Value := '';
end;

procedure TfrmqrInvestigacionAccidente.BandaMedidasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqMedidas.Eof
  then sdqMedidas.Next;
end;

procedure TfrmqrInvestigacionAccidente.BandaImplementacionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqImplementacion.Eof
  then sdqImplementacion.Next;
end;

procedure TfrmqrInvestigacionAccidente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqAccidenteEstablecimiento.Close;
  sdqTestigos.Close;
  sdqCausas.Close;
  sdqMedidas.Close;
  sdqImplementacion.Close;
  sdqMultiple.Close;
end;

procedure TfrmqrInvestigacionAccidente.BandaMultipleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqMultiple.Eof
  then sdqMultiple.Next;
end;

procedure TfrmqrInvestigacionAccidente.Hoja3BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqCausas.Active
  then sdqCausas.First;
end;

procedure TfrmqrInvestigacionAccidente.Hoja4BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqMedidas.Active
  then sdqMedidas.First;
  if   sdqImplementacion.Active
  then sdqImplementacion.First;
end;

procedure TfrmqrInvestigacionAccidente.Hoja5BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqMultiple.Active
  then sdqMultiple.First;
end;

procedure TfrmqrInvestigacionAccidente.Hoja6BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  sdqTestigos.Close;
  sdqTestigos.ParamByName( 'TIPO' ).AsString := 'E';
  OpenQuery( sdqTestigos );

  BandaEntrevistados.PrintCount := sdqTestigos.RecordCount;

  if   BandaEntrevistados.PrintCount = 0
  then BandaEntrevistados.PrintCount := 1;
end;

procedure TfrmqrInvestigacionAccidente.QRDBText46Print(Sender: TObject; var Value: String);
begin
  if IsNumber(Value) then
    Value := FormatFloat('#,##0.00', StrToFloatDef(Value, 0)) + ' m²'
  else
    Value := '0,00 m²';
end;

procedure TfrmqrInvestigacionAccidente.ExportPDF(
  IdAccidenteEstablecimiento: TTableId; pPath: String);
begin
  Do_Imprimir(IdAccidenteEstablecimiento,pPath);
end;

end.
