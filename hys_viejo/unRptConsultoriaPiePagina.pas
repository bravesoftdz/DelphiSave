unit unRptConsultoriaPiePagina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TrptConsultoriaPiePagina = class(TForm)
    qrHoja1: TQuickRep;
    qrdetail: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    CompositeReport: TQRCompositeReport;
    sdqCantRelevExpuestos: TSDQuery;
    sdqCantEstabPersExpuesto: TSDQuery;
    qrLabelCantPersAsig: TQRLabel;
    sdqAnormalidadesDetec: TSDQuery;
    sdqConsolidadoEmpresa: TSDQuery;
    sdqConsolidadoEmpresaTotal: TSDQuery;
    sdqEnfProfDetec: TSDQuery;
    qrHoja2: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRShape31: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    sdqAcciones: TSDQuery;
    qrHoja3: TQuickRep;
    QRBand4: TQRBand;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    QRShape23: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand5: TQRBand;
    QRShape29: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRLabel16: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    sdqAnexo: TSDQuery;
    qrHoja4: TQuickRep;
    QRBand6: TQRBand;
    QRShape36: TQRShape;
    QRDBText20: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand7: TQRBand;
    QRShape39: TQRShape;
    QRLabel23: TQRLabel;
    QRShape41: TQRShape;
    QRLabel24: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    sdqAnexoEmpleados: TSDQuery;
    procedure CompositeReportAddReports(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure Load(idEmpresa : Integer);
  end;

var
  rptConsultoriaPiePagina: TrptConsultoriaPiePagina;

implementation

{$R *.dfm}

uses
  unVisualizador, ArchFuncs, unExportPDF, AnsiSql, unDmPrincipal;


procedure TrptConsultoriaPiePagina.Load(idEmpresa : Integer);
var
  Path : String;
  iPersonalAsig, iPersonalAusente, iPersonalTotExamenes, iTotalPersonal : Integer;
begin

  sdqCantRelevExpuestos.ParamByName('idempresa').AsInteger := idempresa;
  sdqCantEstabPersExpuesto.ParamByName('idempresa').AsInteger := idempresa;
  sdqAnormalidadesDetec.ParamByName('idempresa').AsInteger := idempresa;
  sdqEnfProfDetec.ParamByName('idempresa').AsInteger := idempresa;
  sdqConsolidadoEmpresa.ParamByName('idempresa').AsInteger := idempresa;
  sdqConsolidadoEmpresaTotal.ParamByName('idempresa').AsInteger := idempresa;
  sdqAcciones.ParamByName('idempresa').AsInteger := idempresa;
  sdqAnexo.ParamByName('idempresa').AsInteger := idempresa;
  sdqAnexoEmpleados.ParamByName('idempresa').AsInteger := idempresa;


  iPersonalAsig := ValorSqlInteger(
                   ' SELECT   COUNT(DISTINCT dl_idtrabajador) asignados '+
                   '   FROM hys.hdl_detallelote hdl, hys.hde_descripcionestadolote, '+
                   '        hys.hle_loteestudio, hys.hel_estadolote '+
                   '  WHERE le_id = el_idlote '+
                   '    AND dl_idlote = el_idlote '+
                   '    AND de_codigo = el_estado '+
                   '    AND el_operativo <> ''R'' '+
                   '    AND (   (dl_fechabaja IS NULL) '+
                   '         OR (    dl_fechabaja IS NOT NULL '+
                   '             AND dl_fecharealizacion IS NOT NULL)) '+
                   '    AND (   (el_fechabaja IS NULL) '+
                   '         OR (    (el_fechabaja IS NOT NULL) '+
                   '             AND (TRUNC(de_valor) <> 10))) '+
                   '    AND le_fechaalta >= TRUNC(SYSDATE, ''YYYY'') '+
                   '    AND dl_idempresa = '+SqlValue(idempresa)+
                   ' GROUP BY TO_CHAR(le_fechaalta, ''YYYY'') ');

  iPersonalAusente := ValorSqlInteger(
                   ' SELECT COUNT(DISTINCT dl_idtrabajador) ausentes '+
                   '   FROM hys.hdl_detallelote hdl, hys.hde_descripcionestadolote, '+
                   '        hys.hle_loteestudio, hys.hel_estadolote '+
                   '  WHERE le_id = el_idlote '+
                   '    AND dl_idlote = el_idlote '+
                   '    AND de_codigo = el_estado '+
                   '    AND el_operativo <> ''R'' '+
                   '    AND (   (dl_fechabaja IS NULL) '+
                   '         OR (    dl_fechabaja IS NOT NULL '+
                   '             AND dl_fecharealizacion IS NOT NULL)) '+
                   '    AND (   (el_fechabaja IS NULL) '+
                   '         OR (    (el_fechabaja IS NOT NULL) '+
                   '             AND (TRUNC(de_valor) <> 10))) '+

                   '    AND le_fechaalta >= TRUNC(SYSDATE, ''YYYY'') '+
                   '    AND dl_idempresa = '+SqlValue(idEmpresa)+
                   '    AND NOT EXISTS(SELECT 1 '+
                   '                     FROM hys.hdl_detallelote hdl1 '+
                   '                    WHERE hdl1.dl_idlote = hdl.dl_idlote '+
                   '                      AND hdl1.dl_idtrabajador = hdl.dl_idtrabajador '+
                   '                      AND dl_fecharealizacion IS NOT NULL) '+
                   ' GROUP BY TO_CHAR(le_fechaalta, ''YYYY'') ');

  iPersonalTotExamenes := ValorSqlInteger(
                   'SELECT  COUNT(DISTINCT dl_idtrabajador) totales '+
                   '  FROM hys.hdl_detallelote hdl, hys.hde_descripcionestadolote, hys.hle_loteestudio, hys.hel_estadolote '+
                   ' WHERE le_id = el_idlote '+
                   '   AND dl_idlote = el_idlote '+
                   '   AND de_codigo = el_estado '+
                   '   AND el_operativo <> ''R'' '+
                   '   AND (   (dl_fechabaja IS NULL) '+
                   '        OR (    dl_fechabaja IS NOT NULL '+
                   '            AND dl_fecharealizacion IS NOT NULL)) '+
                   '   AND (   (el_fechabaja IS NULL) '+
                   '        OR (    (el_fechabaja IS NOT NULL) '+
                   '            AND (TRUNC(de_valor) <> 10))) '+
                   '   AND le_fechaalta >= TRUNC(SYSDATE, ''YYYY'') '+
                   '   AND dl_idempresa = '+SqlValue(idEmpresa)+
                   '   AND NOT EXISTS(SELECT 1 '+
                   '                    FROM hys.hdl_detallelote hdl1 '+
                   '                   WHERE hdl1.dl_idlote = hdl.dl_idlote '+
                   '                     AND hdl1.dl_idtrabajador = hdl.dl_idtrabajador '+
                   '                    AND dl_fecharealizacion IS NULL) '+
                   ' GROUP BY TO_CHAR(le_fechaalta, ''YYYY'') ');

  iTotalPersonal := ValorSqlInteger(
                   ' SELECT COUNT(DISTINCT dl_idtrabajador) parciales '+
                   '   FROM hys.hdl_detallelote hdl, hys.hde_descripcionestadolote, hys.hle_loteestudio, hys.hel_estadolote '+
                   '  WHERE le_id = el_idlote '+
                   '    AND dl_idlote = el_idlote '+
                   '    AND de_codigo = el_estado '+
                   '    AND el_operativo <> ''R'' '+
                   '    AND (   (dl_fechabaja IS NULL) '+
                   '         OR (    dl_fechabaja IS NOT NULL '+
                   '             AND dl_fecharealizacion IS NOT NULL)) '+
                   '    AND (   (el_fechabaja IS NULL) '+
                   '         OR (    (el_fechabaja IS NOT NULL) '+
                   '             AND (TRUNC(de_valor) <> 10))) '+
                   '    AND le_fechaalta >= TRUNC(SYSDATE, ''YYYY'') '+
                   '    AND dl_idempresa = '+SqlValue(idEmpresa)+
                   '    AND NOT EXISTS(SELECT 1 '+
                   '                     FROM hys.hdl_detallelote hdl1 '+
                   '                    WHERE hdl1.dl_idlote = hdl.dl_idlote '+
                   '                      AND hdl1.dl_idtrabajador = hdl.dl_idtrabajador '+
                   '                      AND dl_fecharealizacion IS NOT NULL) '+
                   '    AND NOT EXISTS(SELECT 1 '+
                   '                     FROM hys.hdl_detallelote hdl1 '+
                   '                    WHERE hdl1.dl_idlote = hdl.dl_idlote '+
                   '                      AND hdl1.dl_idtrabajador = hdl.dl_idtrabajador '+
                   '                      AND dl_fecharealizacion IS NULL) '+
                   'GROUP BY TO_CHAR(le_fechaalta, ''YYYY'') ');

  qrLabelCantPersAsig.Caption :=
      'La cantidad de personal asignado para la realización de exámenes periódicos fue de '+IntToStr(iPersonalAsig)+
      '. La cantidad de personal ausente fue de '+IntToStr(iPersonalAusente)+
      '. La cantidad de personal con la totalidad de los exámenes realizados fue de '+IntToStr(iPersonalTotExamenes)+
      '. La cantidad de personal parcialmente realizado fue de '+IntToStr(iTotalPersonal)+'.';

  sdqCantRelevExpuestos.Open;
  sdqCantEstabPersExpuesto.Open;
  sdqAnormalidadesDetec.Open;
  sdqEnfProfDetec.Open;
  sdqConsolidadoEmpresa.Open;
  sdqConsolidadoEmpresaTotal.Open;
  sdqAcciones.Open;
  sdqAnexo.Open;
  sdqAnexoEmpleados.Open;

  CompositeReport.Prepare;

  Path := TempPath+IntToStr(idempresa)+'_piearchivoconsultoria.qrp';
  CompositeReport.QRPrinter.Save(Path);

  CompositeReport.QRPrinter.Free;

  if not FileToPDFSvr(path,TempPath+IntToStr(idempresa)+'_piearchivoconsultoria.pdf') then
    raise Exception.Create('Error al generar el PDF');

  sdqCantRelevExpuestos.Close;
  sdqCantEstabPersExpuesto.Close;
  sdqAnormalidadesDetec.Close;
  sdqEnfProfDetec.Open;
  sdqConsolidadoEmpresa.Close;
  sdqConsolidadoEmpresaTotal.Close;
  sdqAcciones.Close;
  sdqAnexo.Close;
  sdqAnexoEmpleados.Close;

end;

procedure TrptConsultoriaPiePagina.CompositeReportAddReports(
  Sender: TObject);
begin
  CompositeReport.Reports.Add(qrHoja1);
  CompositeReport.Reports.Add(qrHoja2);
  CompositeReport.Reports.Add(qrHoja3);
  CompositeReport.Reports.Add(qrHoja4);
end;

end.
