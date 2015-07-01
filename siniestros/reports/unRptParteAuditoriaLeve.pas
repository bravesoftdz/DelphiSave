unit unRptParteAuditoriaLeve;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ArtQReports,
  Db, SDEngine, ArtDatabase;

type
  TrptParteAuditoriaLeve = class(TQuickRep)
    qrbFormulario: TQRBand;
    QRShape8: TQRShape;
    QRShape6: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape57: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape160: TQRShape;
    QRDBText35: TQRDBText;
    qrdbIW_DIAGNOSTICO: TQRDBText;
    qriLogoART: TQRImage;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRDBText9: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape15: TQRShape;
    QRLabel9: TQRLabel;
    QRShape16: TQRShape;
    QRDBText11: TQRDBText;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRShape17: TQRShape;
    QRLabel10: TQRLabel;
    QRShape18: TQRShape;
    QRDBText12: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape21: TQRShape;
    QRLabel12: TQRLabel;
    QRShape22: TQRShape;
    QRDBText14: TQRDBText;
    QRShape23: TQRShape;
    QRLabel13: TQRLabel;
    QRShape24: TQRShape;
    QRDBText26: TQRDBText;
    QRShape25: TQRShape;
    QRLabel14: TQRLabel;
    QRShape26: TQRShape;
    QRDBText54: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText55: TQRDBText;
    QRShape27: TQRShape;
    QRLabel17: TQRLabel;
    QRShape28: TQRShape;
    QRDBText56: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRDBText57: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape30: TQRShape;
    QRLabel21: TQRLabel;
    QRShape31: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape32: TQRShape;
    QRDBText59: TQRDBText;
    QRLabel24: TQRLabel;
    QRShape33: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel27: TQRLabel;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRDBText63: TQRDBText;
    QRShape35: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape37: TQRShape;
    QRLabel28: TQRLabel;
    QRShape39: TQRShape;
    QRLabel30: TQRLabel;
    QRShape40: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel32: TQRLabel;
    QRShape41: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel35: TQRLabel;
    QRShape42: TQRShape;
    QRLabel34: TQRLabel;
    QRShape43: TQRShape;
    QRDBText16: TQRDBText;
    QRLabel36: TQRLabel;
    QRShape44: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape48: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel44: TQRLabel;
    QRShape49: TQRShape;
    QRDBText23: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape50: TQRShape;
    QRDBText24: TQRDBText;
    QRShape51: TQRShape;
    QRLabel46: TQRLabel;
    QRShape52: TQRShape;
    QRDBText25: TQRDBText;
    QRLabel47: TQRLabel;
    QRShape53: TQRShape;
    QRDBText27: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape54: TQRShape;
    QRLabel51: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRShape61: TQRShape;
    QRLabel55: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel56: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRLabel57: TQRLabel;
    QRShape68: TQRShape;
    QRLabel58: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel59: TQRLabel;
    QRShape69: TQRShape;
    QRDBText39: TQRDBText;
    QRShape70: TQRShape;
    QRDBText40: TQRDBText;
    QRLabel60: TQRLabel;
    QRShape71: TQRShape;
    QRDBText41: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape72: TQRShape;
    QRDBText42: TQRDBText;
    QRLabel63: TQRLabel;
    QRShape73: TQRShape;
    QRDBText43: TQRDBText;
    QRLabel64: TQRLabel;
    QRShape74: TQRShape;
    QRDBText44: TQRDBText;
    QRLabel65: TQRLabel;
    QRShape75: TQRShape;
    QRDBText45: TQRDBText;
    sdqDatos: TSDQuery;
  private
  public
  end;

procedure ImprimirLeve(IdParte, iSiniestro, iOrden, iRecaida: Integer);

implementation

uses unDmPrincipal, unComunes;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure ImprimirLeve(IdParte, iSiniestro, iOrden, iRecaida: Integer);
var iIdExped: integer;
begin
  with TrptParteAuditoriaLeve.Create(Application) do
  try
    iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
    if Is_SiniestroDeGobernacion(iIdExped) then
      qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
    else
      qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    sdqDatos.ParamByName('PA_ID').AsInteger := IdParte;
    OpenQuery(sdqDatos);
    Print;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
end.
