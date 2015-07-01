unit unInvRptAsientosContabilizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  Data.DB, SDEngine, unArt;

type
  TfrmInvRptAsientosContabilizar = class(TForm)
    qrAsientosContabilizar: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qriLogo: TQRImage;
    sdqDatos: TSDQuery;
    qrbDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    qrlUsuario: TQRLabel;
    qrgGrupo: TQRGroup;
    qrbFooter: TQRBand;
    QRExpr2: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRSysData1: TQRSysData;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  function DoImprimirAsientoAContabilizar(TipoListado, FiltroUsuario: String; FiltroFechaContable: TDateTime; IdTipoInstrumento: TTableId): Boolean;

var
  frmInvRptAsientosContabilizar: TfrmInvRptAsientosContabilizar;

implementation

{$R *.dfm}

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros,
  unVisualizador, unSesion;

function DoImprimirAsientoAContabilizar(TipoListado, FiltroUsuario: String; FiltroFechaContable: TDateTime; IdTipoInstrumento: TTableId): Boolean;
var
  frm: TfrmInvRptAsientosContabilizar;
  sTitulo, sTipo, sWhere, sSql: String;
begin
  sWhere := '';
  frm := TfrmInvRptAsientosContabilizar.Create(nil);

  with frm do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      if TipoListado = 'O' then    // Operaciones
        begin
          sTipo   := 'Operaciones';
          sTitulo := 'ASIENTOS';

          if not IsEmptyString(FiltroUsuario) then
            sWhere := sWhere + 'AND USUCONTABILIZADO = ' + SqlValue(FiltroUsuario) + ' AND CONTABILIZADO = ''P'' ';

          if FiltroFechaContable > 0 then
            sWhere := sWhere + 'AND FECHA = ' + SqlValue(FiltroFechaContable) + ' ';

          sSql := 'SELECT FECHA, CUENTA, DEBITO, CREDITO, TIPO_INSTRUMENTO, OPERACION, ' +
                         'CASE WHEN PLAZO_FIJO = ''S'' THEN ' +
                           'BANCO || '' CERTIFICADO N°'' || COD_CAJA_VALORES ' +
                         'ELSE ' +
                           'CASE WHEN TIPO_INSTRUMENTO = ''FCI'' THEN ' +        // no tenia el campo con el idtipoinstrumento en la vista....
                             'DENOMINACION || '' - SSN '' || COD_SSN ' +
                           'ELSE ' +
                             'DENOMINACION || '' - CAJA VALORES '' || COD_CAJA_VALORES ' +
                           'END ' +
                         'END DENOMINACION, ' +
                         'CUPON ' +
                    'FROM V_INV_ASIENTO_OPERACIONES ' +
                   'WHERE 1 = 1 ' +
                   sWhere + ' ' +
                'ORDER BY TIPO_INSTRUMENTO, DENOMINACION, CREDITO, DEBITO';
        end
      else if TipoListado = 'R' then  // Resultados (cobro de cupones)
        begin
          sTipo   := 'Cobro de Cupones';
          sTitulo := 'ASIENTOS';

          if not IsEmptyString(FiltroUsuario) then
            sWhere := sWhere + 'AND USUCONTABILIZADO = ' + SqlValue(FiltroUsuario) + ' AND CONTABILIZADO = ''P'' ';

          if FiltroFechaContable > 0 then
            sWhere := sWhere + 'AND FECHA = ' + SqlValue(FiltroFechaContable) + ' ';

          sSql := 'SELECT FECHA, CUENTA, DEBITO, CREDITO, TIPO_INSTRUMENTO, OPERACION, DENOMINACION, CUPON ' +
                    'FROM V_INV_ASIENTO_CUPON ' +
                   'WHERE 1 = 1 ' +
                   sWhere + ' ' +
                'ORDER BY TIPO_INSTRUMENTO, DENOMINACION, CREDITO, DEBITO';
        end
      else                         // Asientos de Cierre
        begin
          sTipo   := 'Asiento de Cierre';
          sTitulo := 'ASIENTO DE CIERRE';

          if not IsEmptyString(FiltroUsuario) then
            sWhere := sWhere + 'AND USUCONTABILIZADO = ' + SqlValue(FiltroUsuario) + ' AND CONTABILIZADO = ''P'' ';

          if FiltroFechaContable > 0 then
            sWhere := sWhere + 'AND FECHA = ' + SqlValue(FiltroFechaContable) + ' ';

          if IdTipoInstrumento <> ART_EMPTY_ID then
            sWhere := sWhere + 'AND IDTIPOINSTRUMENTO = ' + SqlValue(IdTipoInstrumento) + ' ';

          sSql := 'SELECT FECHA, CUENTA, DEBITO, CREDITO, TIPO_INSTRUMENTO, OPERACION, ' +
                         'CASE WHEN PLAZO_FIJO = ''S'' THEN ' +
                           'TIPO_INSTRUMENTO || '' '' || BANCO || '' CERTIFICADO N°'' || COD_CAJA_VALORES ' +
                         'ELSE ' +
                           'CASE WHEN IDTIPOINSTRUMENTO = 22 THEN ' +        // 22: FCI
                             'DENOMINACION || '' - SSN '' || COD_SSN ' +
                           'ELSE ' +
                             'DENOMINACION || '' - CAJA VALORES '' || COD_CAJA_VALORES ' +
                           'END ' +
                         'END DENOMINACION, ' +
                         'CUPON ' +
                    'FROM V_INV_ASIENTO_CIERRE ' +
                   'WHERE 1 = 1 ' +
                     sWhere + ' ' +
                  'ORDER BY TIPO_INSTRUMENTO, DENOMINACION, CREDITO, DEBITO';
        end;

      OpenQuery(sdqDatos, sSql);

      Result := not sdqDatos.Eof;
      if Result then
        begin
          qrlTitulo.Caption  := sTitulo;
          qrlUsuario.Caption := Sesion.Usuario;

          Visualizar(qrAsientosContabilizar, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
        end
      else
        MsgBox('No se han encontrado datos para el reporte de asientos a contabilizar - ' + sTipo, MB_ICONINFORMATION);
    finally
      Free;
    end;
end;

procedure TfrmInvRptAsientosContabilizar.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

end.

