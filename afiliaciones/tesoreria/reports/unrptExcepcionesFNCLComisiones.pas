unit unrptExcepcionesFNCLComisiones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptExcepcionesFNCLComisiones = class(TQuickRep)
    sdqDatos: TSDQuery;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSubtitulo: TQRLabel;
    qrlFechaEnvio: TQRLabel;
    qrgGrupoEntidad: TQRGroup;
    QRBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrdbCodEntidad: TQRDBText;
    qrdbCodVendedor: TQRDBText;
    QRLabel2: TQRLabel;
    qrlCodVendedor: TQRLabel;
    qrlNombreVendedor: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbNombreEntidad: TQRDBText;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    qrdbCodEntidad1: TQRDBText;
    qrdbNombreEntidad2: TQRDBText;
    qrdbNombreVendedor: TQRDBText;
    qrdbNroDoc: TQRDBText;
    qrdbComision: TQRDBText;
    qrdbIVA: TQRDBText;
    qrdbGanancias: TQRDBText;
    qrdbIngrBrutos: TQRDBText;
    qrdbOSocial: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbMotivoError: TQRDBText;
    QRBand2: TQRBand;
    QRSysPag: TQRSysData;
    QRLPag: TQRLabel;
    QRSysData1: TQRSysData;
    qrgPieGrupoEntidad: TQRBand;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRExpr2: TQRExpr;
    QRShape4: TQRShape;
    procedure FormatCampos(sender: TObject; var Value: String);
  private
  public
    procedure Preparar(TipoListado: String; Fecha: TDateTime);
  end;


implementation

Uses unSesion, unDmPrincipal, AnsiSql, StrFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TrptExcepcionesFNCLComisiones.Preparar(TipoListado: String; Fecha: TDateTime);
var
  sTitulo, sSql: String;
  bHabilitarGrupo: Boolean;
begin
  sTitulo := 'LISTADO DE EXCEPCIONES - ';

  sSql := 'SELECT * ' +
            'FROM TMP_ERRORESEXPORTACIONCOMFNCL ' +
           'WHERE MP_USUARIO=' + SqlValue( Sesion.UserId ) + ' ' +
             'AND MP_TIPOLISTADO=' + SqlValue( TipoListado ) + ' ';

  if TipoListado = '1' then         // Entidades
    begin
      sSql := sSql + 'ORDER BY MP_CANAL2';

      sTitulo         := sTitulo + 'ENTIDADES';
      bHabilitarGrupo := False;

      qrlCodVendedor.Enabled     := False;
      qrlNombreVendedor.Enabled  := False;
      qrdbCodVendedor.Enabled    := False;
      qrdbNombreVendedor.Enabled := False;
      qrdbNombreEntidad2.Width   := 341;
    end
  else if TipoListado = '4' then    // Vendedores
    begin
      sSql := sSql + 'ORDER BY MP_CANAL2, MP_CANAL3';

      sTitulo         := sTitulo + 'VENDEDORES';
      bHabilitarGrupo := True;

      qrdbCodEntidad1.Enabled    := False;
      qrdbNombreEntidad2.Enabled := False;
    end
  else
    exit;

  qrlTitulo.Caption     := sTitulo;
  qrlFechaEnvio.Caption := DateToStr( Fecha );

  qrgGrupoEntidad.Enabled    := bHabilitarGrupo;
  qrgPieGrupoEntidad.Enabled := bHabilitarGrupo;

  OpenQuery( sdqDatos, sSql );

  PreviewModeless;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptExcepcionesFNCLComisiones.FormatCampos(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

