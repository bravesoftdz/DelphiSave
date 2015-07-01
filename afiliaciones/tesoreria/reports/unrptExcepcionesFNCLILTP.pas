unit unrptExcepcionesFNCLILTP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptExcepcionesFNCLILTP = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSubtitulo: TQRLabel;
    qrlValorSubtitulo: TQRLabel;
    QRSysData1: TQRSysData;
    sdqDatos: TSDQuery;
    qrTitulosGrupo: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrPie: TQRBand;
    QRLPag: TQRLabel;
    QRSysPag: TQRSysData;
    qrGrupo: TQRGroup;
    qrdbCodEntidad: TQRDBText;
    QRDBText1: TQRDBText;
    qrDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrdbMotivoError: TQRDBText;
    qrgPieGrupo: TQRBand;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    qrTotales: TQRBand;
    QRShape3: TQRShape;
    QRExpr2: TQRExpr;
    QRShape4: TQRShape;
    procedure FormatCampos(sender: TObject; var Value: String);
  private
  public
    procedure Preparar(TipoListado: String; Fecha: TDateTime; IdProceso: Integer);
  end;

implementation

uses
  unSesion, unDmPrincipal, AnsiSql, StrFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptExcepcionesFNCLILTP.Preparar(TipoListado: String; Fecha: TDateTime; IdProceso: Integer);
var
  sSubTititulo, sValorSubTititulo, sTitulo, sSql: String;
begin
  sTitulo := 'LISTADO DE EXCEPCIONES - ';

  sSql := 'SELECT * ' +
            'FROM TMP_ERRORESEXPORTACIONLIQFNCL ' +
           'WHERE MP_USUARIO=' + SqlValue( Sesion.UserId ) + ' ' +
             'AND MP_TIPOLISTADO=' + SqlValue( TipoListado ) + ' ' +
        'ORDER BY MP_NRODOC, MP_SINIESTROCOMPLETO, MP_NUMLIQUIDACION';

  if TipoListado = '2' then         // Siniestros ILT/ILP
    begin
      sTitulo           := sTitulo + 'ILT/ILP';
      sSubTititulo      := 'Fecha de Envío:';
      sValorSubTititulo := DateToStr( Fecha )
    end
  else if TipoListado = '5' then    // Compensación deuda por siniestros
    begin
      sTitulo           := sTitulo + 'COMPENS. DEUDA POR SINIESTROS';
      sSubTititulo      := 'Nro. Proceso Comp.:';
      sValorSubTititulo := TrimLeft(IntToStr(IdProceso));
    end
  else if TipoListado = '6' then    // Legales - Juicios
    begin
      sTitulo           := sTitulo + 'LEGALES-JUICIOS';
      sSubTititulo      := 'Fecha de Envío:';
      sValorSubTititulo := DateToStr( Fecha )
    end
  else if TipoListado = '7' then    // Legales - Sumarios
    begin
      sTitulo           := sTitulo + 'LEGALES-SUMARIOS';
      sSubTititulo      := 'Fecha de Envío:';
      sValorSubTititulo := DateToStr( Fecha )
    end
  else if TipoListado = '8' then    // Legales - Mediaciones
    begin
      sTitulo           := sTitulo + 'LEGALES-MEDIACIONES';
      sSubTititulo      := 'Fecha de Envío:';
      sValorSubTititulo := DateToStr( Fecha )
    end
  else
    exit;

  qrlTitulo.Caption         := sTitulo;
  qrlSubtitulo.Caption      := sSubTititulo;
  qrlValorSubtitulo.Caption := sValorSubTititulo;

  OpenQuery( sdqDatos, sSql );

  PreviewModeless;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptExcepcionesFNCLILTP.FormatCampos(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
