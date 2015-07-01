unit unRptCartaAbandonoTto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TrptCartaAbandonoTto = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    qrlFechaImpresion: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    qrlTrabajador: TQRLabel;
    qrlCuil: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCuit: TQRLabel;
    qrlFechaAccid: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRMemo3: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    qrlFecha: TQRLabel;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRMemo15: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
  private

  public
    procedure DoPrepararReporte(IdExpediente :Integer);
  end;

var
  rptCartaAbandonoTto: TrptCartaAbandonoTto;

implementation

uses
  AnsiSql, unComunes, unDmPrincipal, DB, General;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TrptCartaAbandonoTto.DoPrepararReporte(IdExpediente :Integer);
var
  sSql :String;
begin
  sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' utiles.armar_cuit(ex_cuil) cuil, utiles.armar_cuit(ex_cuit) cuit, ' +
                ' nvl(ex_fecharecaida, ex_fechaaccidente) faccidente, ex_altamedica, ' +
                ' tj_nombre, em_nombre, ex_siniestro ' +
           ' FROM sex_expedientes, ctj_trabajador, aem_empresa ' +
          ' WHERE ex_cuit = em_cuit ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_id = :IdExped ';
  with GetQueryEx(sSql, [IdExpediente]) do
  try
     if Is_SiniestroDeGobernacion(IdExpediente) then
     begin
       qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
       qrlEmpDep.Caption := 'Dependencia:';
     end
     else begin
       qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
       qrlEmpDep.Caption := 'Empresa:';
     end;

     qrlTrabajador.Caption    := FieldByName('TJ_NOMBRE').AsString;
     qrlCuil.Caption          := FieldByName('CUIL').AsString;
     qrlEmpresa.Caption       := FieldByName('EM_NOMBRE').AsString;
     qrlCuit.Caption          := FieldByName('CUIT').AsString;
     qrlFechaAccid.Caption    := FieldByName('FACCIDENTE').AsString;
     qrlSiniestro.Caption     := FieldByName('SINIESTRO').AsString;
     qrlFecha.Caption         := FieldByName('EX_ALTAMEDICA').AsString;
  finally
    Free;
  end;
  qrlFechaImpresion.Caption := LugarImpresion + ', ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy');
end;
{-------------------------------------------------------------------------------}
end.
