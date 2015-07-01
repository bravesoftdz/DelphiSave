unit unLstRemitosnoRecepcionados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, QRCtrls, QuickRpt, Vcl.ExtCtrls, Data.DB, SDEngine;

type
  TfrmLstRemitosnoRecepcionados = class(TfrmCustomForm)
    qrRemito: TQuickRep;
    sdqDatos: TSDQuery;
    qrbHeader: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlPagina: TQRLabel;
    qrlFiltros: TQRLabel;
    qrgSector: TQRGroup;
    QRDBText1: TQRDBText;
    qrbDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    qrbFooter: TQRBand;
    QRLabel2: TQRLabel;
    qreConteoRegistro: TQRExpr;
    SummaryBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr5: TQRExpr;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    procedure DoImprimirRemitosNoRecepcionados(FDesde, FHasta: TDateTime; SectorDestino: String; TodosDocumentos: Boolean);
  end;

var
  frmLstRemitosnoRecepcionados: TfrmLstRemitosnoRecepcionados;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, General, strFuncs, unPrincipal,
  unVisualizador, unSesion;

{$R *.dfm}

procedure TfrmLstRemitosnoRecepcionados.DoImprimirRemitosNoRecepcionados(FDesde, FHasta: TDateTime; SectorDestino: String; TodosDocumentos: Boolean);
var
  sDescrFiltros, sWhere, sWhereAdic, sSql: String;
begin
  sWhere := SqlBetweenDateTime( 'AND DR_FECHAREMITO ', FDesde, FHasta);

  if not IsEmptyString(SectorDestino) then
    sWhere := sWhere + ' AND SC_CODIGO = ' + SqlValue(SectorDestino);

  if TodosDocumentos then
    sWhereAdic := ''
  else
    sWhereAdic := ' AND USE_ALTA1.SE_SECTOR = ' + SqlValue(Sesion.Sector);

  sSql := 'SELECT DESCRSECTDESTINO, REMITO, FECHAREMITO, CANTDOCS, CANTDOCSPEND, ' +
                 'DECODE(CANTDOCS, CANTDOCSPEND, ''Total'', ''Parcial'') ESTADO ' +
            'FROM (SELECT SC_DESCRIPCION DESCRSECTDESTINO, DR_REMITO REMITO, DR_FECHAREMITO FECHAREMITO, ' +
                         'COUNT(*) CANTDOCS, SUM(DECODE(DR_FECHARECEPCION, NULL, 1, 0)) CANTDOCSPEND ' +
                   'FROM CDR_DOCUMENTACIONRECIBIDA CDR1, USE_USUARIOS USE_DER1, USC_SECTORES USC1, USE_USUARIOS USE_ALTA1 ' +
                  'WHERE DR_FECHABAJA IS NULL ' +
                    'AND DR_REMITO IS NOT NULL ' +
                    'AND DR_DERIVADOA = USE_DER1.SE_USUARIO(+) ' +
                    'AND NVL(USE_DER1.SE_SECTOR, DR_SECTORDESTINO) = SC_CODIGO ' +
                    'AND DR_USUALTA = USE_ALTA1.SE_USUARIO ' +
                    'AND EXISTS (SELECT 1 ' +
                                  'FROM CDR_DOCUMENTACIONRECIBIDA CDR2, USE_USUARIOS USE_DER2, USE_USUARIOS USE_ALTA2 ' +
                                 'WHERE CDR2.DR_FECHABAJA IS NULL ' +
                                   'AND CDR2.DR_REMITO = CDR1.DR_REMITO ' +
                                   'AND CDR2.DR_DERIVADOA = USE_DER2.SE_USUARIO(+) ' +
                                   'AND NVL(USE_DER2.SE_SECTOR, CDR2.DR_SECTORDESTINO) = USC1.SC_CODIGO ' +
                                   'AND CDR2.DR_USUALTA = USE_ALTA2.SE_USUARIO ' +
                                   Iif(TodosDocumentos, '', 'AND USE_ALTA2.SE_SECTOR = USE_ALTA1.SE_SECTOR ') +
                                   'AND CDR2.DR_FECHARECEPCION IS NULL) ' +
                     sWhere + sWhereAdic + ' ' +
                  'GROUP BY SC_DESCRIPCION, DR_REMITO, DR_FECHAREMITO) ' +
          'ORDER BY DESCRSECTDESTINO, CANTDOCSPEND DESC';
  OpenQuery(sdqDatos, sSql);

  if sdqDatos.IsEmpty then
    MsgBox('No se han encontrado registros.', MB_OK + MB_ICONEXCLAMATION)
  else
    begin
     sDescrFiltros := '';
     if FDesde > 0 then
       sDescrFiltros := sDescrFiltros + 'F. Remito Desde: ' + DateToStr(FDesde);

     if FHasta > 0 then
       sDescrFiltros := sDescrFiltros + ' - Hasta: ' + DateToStr(FHasta);

     if IsEmptyString(SectorDestino) then
       sDescrFiltros := sDescrFiltros + ' / Sector: Todos';

      qrlFiltros.Caption := sDescrFiltros;

      Visualizar(qrRemito, GetValores('Remitos no Recepcionados'), [oForceDB, oForceShowModal, oShowDialogIfEmpty]);
    end;
end;

procedure TfrmLstRemitosnoRecepcionados.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Pág. ' + IntToStr(qrRemito.PageNumber);
end;

end.

