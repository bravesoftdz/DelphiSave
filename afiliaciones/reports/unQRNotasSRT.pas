unit unQRNotasSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QuickRpt, Qrctrls, jpeg, ExtCtrls, Db,
  SDEngine;

type
  TqrNotasSRT = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    BandaDetalle: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrRectangulo: TQRShape;
    qrVert4: TQRShape;
    QRShape8: TQRShape;
    qrVert1: TQRShape;
    qrVert2: TQRShape;
    qrVert3: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    qrDbNS_NOTA: TQRDBText;
    sdqQuery: TSDQuery;
    procedure QRSysData1Print(Sender: TObject; var Value: String);
    procedure QRDBText2Print(Sender: TObject; var Value: String);
    procedure QRLabel10Print(Sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure QRLabel9Print(Sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRLabel17Print(Sender: TObject; var Value: String);
  private
    FNroDetalle: Integer;
    FPrimerGrupo: Boolean;
  public
    procedure Preparar(aListaId: String);
  end;

var
  qrNotasSRT: TqrNotasSRT;

implementation

{$R *.DFM}

uses
  StrFuncs, unDmPrincipal, ArchFuncs, unExportPDF;

procedure TqrNotasSRT.QRSysData1Print(Sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatDateTime('  dddd d "de" mmmm "de" yyyy', StrToDate(Value));
end;

procedure TqrNotasSRT.QRDBText2Print(Sender: TObject; var Value: String);
begin
  inherited;

  Value := StrLeft(Value, 2) + '-' + Copy(Value, 3, 8) + StrRight(Value, 1);
end;

procedure TqrNotasSRT.QRLabel10Print(Sender: TObject; var Value: String);
begin
  if FPrimerGrupo then
    FPrimerGrupo := False
  else
    Value := '';
end;

procedure TqrNotasSRT.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  inherited;

  FPrimerGrupo := True;
end;

procedure TqrNotasSRT.QRLabel9Print(Sender: TObject; var Value: String);
begin
  inherited;

  if not FPrimerGrupo then
    Value := '';
end;

procedure TqrNotasSRT.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  FNroDetalle := 0;
end;

procedure TqrNotasSRT.BandaDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Altura: Extended;
  TextoNota: String;
begin
  inherited;

  Inc(FNroDetalle);

  //ESTO QUE SIGUE PERMITE TENER ALTURA VARIABLE PARA CADA ENTRADA EN LA SRT
  TextoNota := sdqQuery.FieldByName('ns_nota').AsString;
  TextoNota := StrReplace(TextoNota, #10, #10#13);
  TextoNota := StrReplace(TextoNota, #10#13, #13#10);
  qrDbNS_NOTA.Lines.Text := TextoNota;

  //Calcula el tamaño que va a tener la banda y lo setea en todos los controles
  bandaDetalle.ExpandedHeight( Altura );
  qrRectangulo.Height := Round(Altura);
  qrVert1.Height      := Round(Altura);
  qrVert2.Height      := Round(Altura);
  qrVert3.Height      := Round(Altura);
  qrVert4.Height      := Round(Altura);
end;

procedure TqrNotasSRT.QRLabel17Print(Sender: TObject; var Value: String);
begin
  inherited;
  Value := StrRight('00' + IntToStr(FNroDetalle), 2);
end;

procedure TqrNotasSRT.Preparar(aListaId: String);
var
  sNombreArchivo: String;
begin
  sdqQuery.Sql.Text :=
    'SELECT   ns_id, ns_tiponota, tb_descripcion, ns_nota, ns_contrato, em_cuit, ns_fechaenvio, ns_nroreferencia,' +
            ' ns_fecharespuesta, ns_descripcionrespuesta, ns_fechaimpresion, ns_fechabaja' +
       ' FROM ans_notasrt, aco_contrato, aem_empresa, ctb_tablas' +
      ' WHERE ns_contrato = co_contrato' +
        ' AND co_idempresa = em_id' +
        ' AND ns_tiponota = tb_codigo' +
        ' AND tb_clave = ''NOSRT''' +
        ' AND ns_fechabaja IS NULL' +
        ' AND ns_id IN(' + aListaId + ')' +
   ' ORDER BY ns_tiponota';
  OpenQuery(sdqQuery);

  //Tk 37629 comente el proceso Visualizar porque no anda ni para atras.
  //se cuelga y no se puede ver donde ni con debug. ademas de otros errores graves

  PrinterSettings.Copies := 1;
  sNombreArchivo := Format(TempPath + 'Carta_Srt_%s.pdf', [aListaId]);
  FileToPDFSvr(Self, ExtractFileDir(sNombreArchivo), sNombreArchivo, True);
  PreviewModal;

  //
  //Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie, oForceDB, oForceShowModal,
  //                                oExportDOCNotAllowed, oExportXLSNotAllowed], True, '', '', False);
end;

end.
