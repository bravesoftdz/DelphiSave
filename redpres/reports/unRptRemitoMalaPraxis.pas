unit unRptRemitoMalaPraxis;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrRemitoMalaPraxis = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    lbNumeroRemito: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    qrlUsuDel: TQRLabel;
    qrlUsuario: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    dsRemito: TDataSource;
    sdqRemito: TSDQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
    QRShape7: TQRShape;
  private

  public

  end;

  procedure DoImprimirRemitoMP(dFecha :TDate; sUsuDel :String; bPorDelegacion :Boolean);

var
  qrRemitoMalaPraxis: TqrRemitoMalaPraxis;

implementation

uses unDmPrincipal, unSesion, General, AnsiSql;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure DoImprimirRemitoMP(dFecha :TDate; sUsuDel :String; bPorDelegacion :Boolean);
var
  sSql, sAux :String;
begin
  if bPorDelegacion then
  begin
    sSql := ' SELECT ca_identificador, ca_descripcion, ep_descripcion, COUNT(*) ' +
              ' FROM SIN.slp_logmalapraxis, SIN.sep_estadomalapraxis, ' +
                   ' cpr_prestador, use_usuarios ' +
             ' WHERE lp_idprestador = ca_identificador ' +
               ' AND lp_idestado = ep_id ' +
               ' AND lp_usualta = se_usuario ' +
               ' AND se_delegacion = ' + SqlValue(sUsuDel) +
               ' AND lp_fechaalta =  ' + SqlDate(dFecha) +
          ' GROUP BY lp_idestado, lp_fechaalta, ca_identificador, ca_descripcion, ep_descripcion ' +
          ' ORDER BY lp_idestado, lp_fechaalta ';
    sAux := ' SELECT el_nombre FROM del_delegacion ' +
             ' WHERE el_id = ' + sUsuDel;
  end
  else begin
    sSql := ' SELECT ca_identificador, ca_descripcion, ep_descripcion, COUNT(*) ' +
              ' FROM sin.slp_logmalapraxis, sin.sep_estadomalapraxis, cpr_prestador ' +
             ' WHERE lp_idprestador = ca_identificador ' +
               ' AND lp_idestado = ep_id ' +
               ' AND lp_usualta = ' + SqlValue(sUsuDel) +
               ' AND lp_fechaalta = ' + SqlDate(dFecha) +
          ' GROUP BY lp_idestado, lp_fechaalta, ca_identificador, ca_descripcion, ep_descripcion ' +
          ' ORDER BY lp_idestado, lp_fechaalta ';
    sAux := ' SELECT se_nombre FROM use_usuarios ' +
             ' WHERE se_usuario = ' + SqlValue(sUsuDel);
  end;

  with TqrRemitoMalaPraxis.Create(Application) do
  try
    qrlUsuario.Caption  := ValorSql(sAux);
    qrlUsuDel.Caption   := IIF(bPorDelegacion, 'Delegación:', 'Usuario:');
    sdqRemito.Close;
    sdqRemito.SQL.Text := sSql;
    OpenQuery(sdqRemito);
    PrinterSettings.Copies := 2;
    Print;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}

end.
