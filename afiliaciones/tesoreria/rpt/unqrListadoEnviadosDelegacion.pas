unit unqrListadoEnviadosDelegacion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrListadoEnviadosDelegacion = class(TQuickRep)
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    sdqDatos: TSDQuery;
    qrdbTipo: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    qrlTitulo: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    qrlNroListado: TQRLabel;
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    procedure Imprimir(ADate: TDateTime);
  end;

var
  qrListadoEnviadosDelegacion: TqrListadoEnviadosDelegacion;

implementation

uses
   unVisualizador, unDmPrincipal, CustomDlgs, StrFuncs, DateTimeFuncs;

{$R *.DFM}

procedure TqrListadoEnviadosDelegacion.Imprimir(ADate: TDateTime);
var
  sSql: String;
  iNroListado: Integer;
  ResultadoVisualizar: TResultados;
begin
  sdqDatos.ParamByName('FSituacion').AsDateTime := ADate;
  OpenQuery(sdqDatos);

  if sdqDatos.IsEmpty then
    MsgBox('No se encontraron registros.')
  else
    begin
      iNroListado := GetSecNextVal('SEQ_RCE_NROLISTADODELEGACION');

      qrlTitulo.Caption     := qrlTitulo.Caption + ' - ' + FormatDateTime('dd/mm/yyyy', ADate);
      qrlNroListado.Caption := 'Nro.: ' + IntToStr(iNroListado);
      ReportTitle           := qrlTitulo.Caption;

      ResultadoVisualizar := Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);

      if (rImpresora in ResultadoVisualizar) or (rExportaPDF in ResultadoVisualizar) then
        begin
          sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                     'SET CE_NROLISTADODELEGACION = :Nro ' +
                   'WHERE CE_ESTADO = ''01'' ' +
                     'AND CE_SITUACION = ''06'' ' +
                     'AND CE_FECHASITUACION = :FSituacion';
          EjecutarSqlEx(sSql, [iNroListado, TDateTimeEx.Create(ADate)]);
        end;
    end;
end;

procedure TqrListadoEnviadosDelegacion.ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (not sdqDatos.Eof);
end;

procedure TqrListadoEnviadosDelegacion.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value,'$');
end;

end.
