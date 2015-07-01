unit unRptSolicitudCambioExe;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrSolicitudCambioExe = class(TQuickRep)
    sdqDatos: TSDQuery;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    imgLogo: TQRImage;
    QRLabel2: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrSolicitante: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    qrGrupo: TQRGroup;
    qrdbCodEntidad: TQRDBText;
    QRExpr3: TQRExpr;
    qrDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    qrTitulosGrupo: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    qrFooterGrupo: TQRBand;
    procedure QRExpr3Print(sender: TObject; var Value: String);
  private
    procedure DoActualizarFechasImpresion;
  public
    class function Preparar: Boolean;
  end;

var
  qrSolicitudCambioExe: TqrSolicitudCambioExe;

implementation

uses
  unVisualizador, unSesion, unDmPrincipal;

{$R *.DFM}

class function TqrSolicitudCambioExe.Preparar: Boolean;
var
  sSql: String;
  rpt: TqrSolicitudCambioExe;
  Resultados: TResultados;
begin
  Result := False;

  rpt := TqrSolicitudCambioExe.Create(nil);
  with rpt do
    try
      imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
      qrSolicitante.Caption := Sesion.Usuario;

      sSql := 'SELECT DECODE(INSTR(JC_NOMBREPROGR, ''.''), 0, JC_NOMBREPROGR, SUBSTR(JC_NOMBREPROGR, 1, INSTR(JC_NOMBREPROGR, ''.'')-1)) NOMBREPROGR, ' +
                     'JC_NOMBREPROGR, JC_PRIORIDAD, JC_NROSOLICITUD, JC_FECHAPROGR, JC_LONGITUDPROGR, JC_UBICACIONPROGR, ' +
                     'SE_NOMBRE, JC_MODIFICACIONES ' +
                'FROM TMP_SOLICITUDEJECUTABLES, EJC_PROGREJECUTABLES, USE_USUARIOS ' +
               'WHERE MP_USUARIO = :User ' +
                 'AND MP_NROSOLICITUD = JC_NROSOLICITUD ' +
                 'AND JC_ANALISTA = SE_USUARIO (+) ' +
               'ORDER BY JC_NOMBREPROGR';
      OpenQueryEx(sdqDatos, [Sesion.UserId], sSql);

      Resultados := Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceShowModal, oForceDB, oAutoFirma], True, '', '', True);

      if (rImpresora in Resultados) or (rMail in Resultados) then
        begin
          DoActualizarFechasImpresion;
          Result := True;
        end;
    finally
      Free;
    end;
end;

procedure TqrSolicitudCambioExe.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value = '0' then
    Value := 'B'
  else if Value = '1' then
    Value := 'M'
  else if Value = '2' then
    Value := 'A'
  else
    Value := 'M';
end;

procedure TqrSolicitudCambioExe.DoActualizarFechasImpresion;
var
  sSql: String;
begin
  sSql := 'UPDATE EJC_PROGREJECUTABLES ' +
             'SET JC_FIMPRESIONSOLICITUD = ACTUALDATE ' +
           'WHERE JC_NROSOLICITUD IN (SELECT MP_NROSOLICITUD ' +
                                       'FROM TMP_SOLICITUDEJECUTABLES ' +
                                      'WHERE MP_USUARIO = :User)';
  EjecutarSqlEx(sSql, [Sesion.UserId]);
end;

end.

