unit unqrListadoCorreo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrListadoCorreo = class(TQuickRep)
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    sdqDatos: TSDQuery;
    qrdbTipo: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;                     
    qrlTitulo: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlSubTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private

  public
    procedure Imprimir(FSobreDesde, FSobreHasta: TDateTime; Usuario, InMetodoPago: String);
  end;

var
  qrListadoCorreo: TqrListadoCorreo;

implementation

uses
   unVisualizador, unDmPrincipal, CustomDlgs, StrFuncs, General;

{$R *.DFM}

procedure TqrListadoCorreo.Imprimir(FSobreDesde, FSobreHasta: TDateTime; Usuario, InMetodoPago: String);
var
  sSql: String;
begin
  qrlTitulo.Caption := qrlTitulo.Caption + ' - ' + FormatDateTime('dd/mm/yyyy', FSobreDesde) + ' al ' + FormatDateTime('dd/mm/yyyy', FSobreHasta);
  ReportTitle       := qrlTitulo.Caption;

  if IsEmptyString(Usuario) then
    qrlSubTitulo.Caption := ''
  else
    qrlSubTitulo.Caption := qrlSubTitulo.Caption + Usuario;

  sSql := 'SELECT NVL(TJ_NOMBRE, CE_BENEFICIARIO) BENEFICIARIO, SO_CALLE, SO_NUMERO, SO_PISO, ' +
                 'SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, PV_DESCRIPCION, CE_NUMERO, CE_ORDENPAGO, ' +
                 'SO_MODOENVIO, TRIM(CTBMENVIO.TB_DESCRIPCION)  || '' / '' || TRIM(CTBSIT.TB_DESCRIPCION) MODOENVIO_SITUACION, ' +
                 '''*'' || TRIM(TO_CHAR(CE_ORDENPAGO)) || ''*'' CODBARRASOP ' +
            'FROM CTB_TABLAS CTBMENVIO, CTB_TABLAS CTBSIT, CTJ_TRABAJADOR, CPV_PROVINCIAS, ' +
                 'RCE_CHEQUEEMITIDO, RSO_SOBRE ' +
           'WHERE SO_IDCHEQUEEMITIDO = CE_ID ' +
             'AND SO_IDTRABAJADOR = TJ_ID(+) ' +
             'AND SO_PROVINCIA = PV_CODIGO ' +
             'AND SO_MODOENVIO = CTBMENVIO.TB_CODIGO(+) ' +
             'AND CTBMENVIO.TB_CLAVE(+) = ''MOENS'' ' +
             'AND CE_SITUACION = CTBSIT.TB_CODIGO(+) ' +
             'AND CTBSIT.TB_CLAVE(+) = ''SITCH'' ' +
             'AND SO_FECHAALTA >= :FSobreDesde ' +
             'AND SO_FECHAALTA < :FSobreHasta + 1 ' +
             'AND SO_USUALTA = NVL(:Usuario, SO_USUALTA) ' +
             'AND SO_MODOENVIO IS NOT NULL ' +
             'AND SO_FECHABAJA IS NULL ' +
           String(Iif(IsEmptyString(InMetodoPago), '', 'AND CE_METODOPAGO ' +  InMetodoPago + ' ')) +
           'ORDER BY MODOENVIO_SITUACION, NVL(TJ_NOMBRE, CE_BENEFICIARIO), SO_ID';

  with sdqDatos do
    begin
      Sql.Text := sSql;

      ParamByName('FSobreDesde').AsDateTime := FSobreDesde;
      ParamByName('FSobreHasta').AsDateTime := FSobreHasta;
      ParamByName('Usuario').AsString       := Usuario;
    end;
  OpenQuery(sdqDatos);

  if sdqDatos.IsEmpty then
    begin
      MsgBox('No se encontraron registros');
      Free;
    end
  else
    Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB]);
end;

procedure TqrListadoCorreo.ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (not sdqDatos.Eof);
end;

end.
