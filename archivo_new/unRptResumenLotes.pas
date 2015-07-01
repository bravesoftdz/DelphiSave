unit unRptResumenLotes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrResumenLotes = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCantLotes: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrsLineaFirma: TQRShape;
    qrlUsuEmisor: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrlSectorEmisor: TQRLabel;
    qrlNota: TQRLabel;
    sdqDatos: TSDQuery;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private
  public
    class procedure DoImprimirResumenLotes(NroLoteDesde, NroLoteHasta: Integer);
  end;

var
  qrResumenLotes: TqrResumenLotes;

implementation

uses
  unSesion, unVisualizador, unDmPrincipal, AnsiSql, CustomDlgs, StrFuncs, unArt,
  General;

{$R *.DFM}

class procedure TqrResumenLotes.DoImprimirResumenLotes(NroLoteDesde, NroLoteHasta: Integer);
var
  rpt: TqrResumenLotes;
  sSqlLote, sLotes, sSql: String;
  iCantLotes: Integer;
  bMostrarCorte: Boolean;
begin
  sLotes := '';

  rpt := TqrResumenLotes.Create(nil);
  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrlUsuEmisor.Caption    := Sesion.Usuario;
      qrlSectorEmisor.Caption := Sesion.SectorDesc;

      sSqlLote := 'SELECT LO_ID ' +
                    'FROM ARCHIVO.RLO_LOTE ' +
                   'WHERE LO_ID BETWEEN :NroLoteDesde AND :NroLoteHasta ' +
                     'AND LO_USUALTA = :User ' +
                     'AND LO_FECHABAJA IS NULL ' +
                     'AND EXISTS (SELECT 1 ' +
                                   'FROM RDA_DETALLEARCHIVO ' +
                                  'WHERE DA_LOTE = LO_ID ' +
                                    'AND DA_FECHABAJA IS NULL)';

      with GetQueryEx(sSqlLote, [NroLoteDesde, NroLoteHasta, Sesion.UserID]) do
        try
          if Eof then
            MsgBox('No se han generado lotes.', MB_ICONERROR)
          else
            begin
              iCantLotes           := Recordcount;
              qrlCantLotes.Caption := IntToStr(iCantLotes);
              bMostrarCorte        := (iCantLotes > 1);

              sSql := 'SELECT A.DA_LOTE LOTE, ' +
                             String(Iif(bMostrarCorte, '''Clave: '' || AR_CLAVE || '' - Doc.: '' || TD_DESCRIPCION || '' ('' || TD_CODIGO || '')''',
                                                       'NULL')) + ' CORTE ' +
                       'FROM ARCHIVO.RAR_ARCHIVO, ARCHIVO.RDA_DETALLEARCHIVO A, ARCHIVO.RTD_TIPODOCUMENTO ' +
                      'WHERE A.DA_IDARCHIVO = AR_ID ' +
                        'AND A.DA_FECHABAJA IS NULL ' +
                        'AND A.DA_IDTIPODOCUMENTO = TD_ID ' +
                        'AND A.DA_LOTE IN (' + sSqlLote + ') ' +
                        'AND A.DA_SEQ_LOTE = (SELECT MAX(B.DA_SEQ_LOTE) ' +
                                               'FROM ARCHIVO.RDA_DETALLEARCHIVO B ' +
                                              'WHERE B.DA_LOTE = A.DA_LOTE ' +
                                                'AND B.DA_FECHABAJA IS NULL) ' +
                      'ORDER BY A.DA_LOTE';
              OpenQueryEx(sdqDatos, [NroLoteDesde, NroLoteHasta, Sesion.UserID], sSql);

              qrlNota.Caption := 'ATENCIÓN: En el armado del Lote con la documentación, no olvide revisar que se encuentren los documentos ' +
                                 'indicados en el mismo, y no otros documentos que no correspondan al detalle del lote.';

              Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
            end;
        finally
          Free;
        end;
    finally
      Free;
    end;
end;

end.

