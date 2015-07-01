unit unRptNotaDenunciaGrave;        // TK 26231

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrNotaDenunciaGrave = class(TQuickRep)
    DetailBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlNomTrab: TQRLabel;
    qrlCuil: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCuit: TQRLabel;
    qrlFecAccidente: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel8: TQRLabel;
    qrlPrestador: TQRLabel;
  private
    procedure Do_GuardarFechaMail(vIdExpediente, vNroParte:integer);
    procedure Do_GuardarFechaImpresion(vIdExpediente, vNroParte:integer);
  public
    procedure Imprimir(sSiniestroCompleto, sCUIL, sCUIT : String;
                       iIdExpediente, iSiniestro: integer; dFechaAcc: TDateTime;
                       iIdPrestador, iNroParte: integer);
  end;

var
  qrNotaDenunciaGrave: TqrNotaDenunciaGrave;

implementation

uses unDmPrincipal, unComunes, unVisualizador, unSesion;

{$R *.DFM}

{ TqrNotaDenunciaGrave }

procedure TqrNotaDenunciaGrave.Imprimir(sSiniestroCompleto, sCUIL, sCUIT : String;
                                        iIdExpediente, iSiniestro: integer; dFechaAcc: TDateTime;
                                        iIdPrestador, iNroParte: integer);
var sSql, sDirElectr_Prestador: string;
    vResultados: TResultados;
begin
  qrlSiniestro.Caption    := sSiniestroCompleto;
  qrlCuil.Caption         := sCUIL;
  qrlCuit.Caption         := sCUIT;
  qrlFecAccidente.Caption := DateToStr(dFechaAcc);

  sSql := ' SELECT tj_nombre FROM ctj_trabajador ' +
           ' WHERE tj_cuil = :cuil ';
  qrlNomTrab.Caption := ValorSqlEx(sSql, [sCUIL]);

  sSql := ' SELECT em_nombre FROM aem_empresa ' +
           ' WHERE em_cuit = :cuit ';
  qrlEmpresa.Caption := ValorSqlEx(sSql, [sCUIT]);

  sSql := ' SELECT ca_descripcion FROM art.cpr_prestador ' +
           ' WHERE ca_identificador = :idprest ';
  qrlPrestador.Caption := ValorSqlEx(sSql, [iIdPrestador]);

  if Is_SiniestroDeGobernacion(iIdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_2009_BYN_CHICO');

  sSql := ' SELECT ca_direlectronica FROM art.cpr_prestador ' +
           ' WHERE ca_identificador = :idprest ';
  sDirElectr_Prestador := ValorSqlEx(sSql, [iIdPrestador]);

  vResultados := Visualizar(Self, GetValores(' - ' + sSiniestroCompleto, sDirElectr_Prestador, 0, iSiniestro),
                 [oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog]);

  if rMail in vResultados then
    Do_GuardarFechaMail(iIdExpediente, iNroParte);

  if rImpresora in vResultados then
    Do_GuardarFechaImpresion(iIdExpediente, iNroParte);
end;

procedure TqrNotaDenunciaGrave.Do_GuardarFechaImpresion(vIdExpediente, vNroParte:integer);
var sSql: string;
begin
  sSql := 'UPDATE SIN.SDG_DENUNCIAGRAVE ' +
            ' SET DG_FECHAIMPRESION_NOTA = TRUNC(SYSDATE), ' +
                ' DG_USUIMPRESION_NOTA = :usu ' +
          ' WHERE DG_IDEXPEDIENTE = :idexp ' +
            ' AND DG_NROPARTE = :nroparte ';
  EjecutarSqlEx(sSql,[Sesion.UserID, vIdExpediente, vNroParte]);
end;

procedure TqrNotaDenunciaGrave.Do_GuardarFechaMail(vIdExpediente, vNroParte:integer);
var sSql: string;
begin
  sSql := 'UPDATE SIN.SDG_DENUNCIAGRAVE ' +
            ' SET DG_FECHAMAIL_NOTA = TRUNC(SYSDATE) ' +
          ' WHERE DG_IDEXPEDIENTE = :idexp ' +
            ' AND DG_NROPARTE = :nroparte ';
  EjecutarSqlEx(sSql,[vIdExpediente, vNroParte]);
end;

end.
