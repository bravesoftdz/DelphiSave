{Si se cambia cualquier cosa del reporte revisar la constante REGISTROSPORPAGINA !!!!!}

unit unRptCartDocTraspasoEgreso2;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-05-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, Qrctrls, QuickRpt,
  ArtQReports, ExtCtrls, Db, SDEngine, unArt, unCustomDataModule, unQRLabelEx, RxGIF, QrAngLbl;

type
  TrptCartDocTraspasoEgreso2 = class(TrptCartaDocHeader)
    sdqEmpresas: TSDQuery;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape11: TQRShape;
    QRShape2: TQRShape;
    qrGroupHeader: TQRGroup;
    qrbChildDetail: TQRChildBand;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QrCantEmpresas: TQRExpr;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRMemo4: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QrFecha: TQRLabel;
    QRLabel9: TQRLabel;
    QRNombreART: TQRLabel;
    QRDireccionART: TQRLabel;
    QRLocalidadART: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    qrCodigo: TQRLabelEx;
    procedure ImprimeCuit(sender: TObject; var Value: String);
    procedure ImprimeMonto(sender: TObject; var Value: String);
    procedure qrbChildDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbChildDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  protected
    function CargarValores: Boolean;

    procedure LoadValues; override;
  public
    function Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
  end;

var
  rptCartDocTraspasoEgreso2: TrptCartDocTraspasoEgreso2;

implementation

uses
  unDmPrincipal, unAfiliaciones, AnsiSql, strFuncs, Cuit;

const
  REGISTROSPORPAGINA = 8;
  {Si se cambia cualquier cosa del reporte revisar esta constante !!!!!}

{$R *.DFM}

function TrptCartDocTraspasoEgreso2.Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
begin
  IDCarta := aId;
  TransactionMode := aTransactionMode;

  {$IFDEF EMISION}
    Modulo := taEmision;
  {$ELSE}
    Modulo := taAfiliaciones;
  {$ENDIF}

  Result := CargarValores;
end;

function TrptCartDocTraspasoEgreso2.CargarValores: boolean;
var
  sSql: String;
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  Result := True;

  sSql :=
    'SELECT ROWNUM, em_cuit, em_nombre, te_codigo, te_idartfutura, ca_fechaalta' +
     ' FROM (SELECT   em_cuit, em_nombre, te_codigo, te_idartfutura, ca_fechaalta' +
               ' FROM ate_traspasoegreso, aem_empresa, aco_contrato, cca_carta' +
              ' WHERE co_contrato = te_contrato' +
                ' AND co_idempresa = em_id' +
                ' AND te_idcarta = ca_id' +
                ' AND te_idcarta = :idcarta' +
           ' ORDER BY em_nombre)';

  OpenQueryEx(sdqEmpresas, [IdCarta], sSql);
  
  if sdqEmpresas.FieldByName('te_codigo').AsString = '050' then
    qrCodigo.Caption := Ucase('Sin vigencia para poder ser analizada');

  if sdqEmpresas.FieldByName('te_codigo').AsString = '070' then
    qrCodigo.Caption := Ucase('Baja por falta de trabajadores');

  if sdqEmpresas.FieldByName('te_codigo').AsString = '061' then
    qrCodigo.Caption := Ucase('Baja por falta de pago');

  if sdqEmpresas.FieldByName('te_codigo').AsString = '060' then
    qrCodigo.Caption := Ucase('Egreso dejado sin efecto');

  if sdqEmpresas.FieldByName('te_codigo').AsString = '090' then
    qrCodigo.Caption := Ucase('Baja por cese de actividad');

  DecodeDate(sdqEmpresas.FieldByName('ca_fechaalta').AsDateTime, wYear, wMonth, wDay);
  QrFecha.Caption := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqEmpresas.FieldByName('ca_fechaalta').AsDateTime);

  sSql :=
    'SELECT ar_nombre nombre, art.utiles.armar_domicilio(ar_calle, ar_numero, ar_piso, ar_departamento, NULL) domicilio,' +
          ' art.utiles.armar_localidad(ar_cpostal, ar_cpostala, ar_localidad, ar_provincia) localidad' +
     ' FROM aar_art' +
    ' WHERE ar_id = :id';
   with GetQueryEx(sSql, [sdqEmpresas.FieldByName('te_idartfutura').AsString]) do
   try
     if Eof then
     begin
       MessageDlg('La ART no se encontró, no se puede mostrar la carta.', mtError, [mbOK], 0);
       Result := False;
     end
     else
     begin
       QRNombreART.Caption    := FieldByName('nombre').AsString;
       QRDireccionART.Caption := FieldByName('domicilio').AsString;
       QRLocalidadART.Caption := FieldByName('localidad').AsString;
     end;
   finally
     Free;
   end;

////////////////////////////////////////
//  PARÁMETROS DE LA CARTA DOCUMENTO  //
////////////////////////////////////////
  sSql :=
    'SELECT ca_nrocartadoc, ca_idendoso, ca_idformulario, ca_idempdeudora, ca_idtextocarta, ca_textofinal,' +
          ' ht_destinatario, ca_idtrabajador, ca_idart, NVL(ca_correoreimpresion, ca_correo) correo, ca_tiposalida,' +
          ' ca_iddestinatariocarta, ca_idcomisionmedica, NVL(ca_idfirmareimpresion, ca_idfirma) idfirma,' +
          ' ca_iddelegacion, ca_idareatexto, at_codigoremitente' +
     ' FROM cca_carta, comunes.cht_historicotextocarta, cta_textoarea, cat_areatexto' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND ht_idtextocarta = ta_idtextocarta' +
      ' AND ta_idareatexto = at_id' +
      ' AND ca_id = :id';

  with GetQueryEx(sSql, [IdCarta]) do
  try
    CodigoRemitente := FieldByName('at_codigoremitente').AsString;

    { Los datos del Formato de la Carta }
    TipoSalida := StrToTipoSalida(FieldByName('ca_tiposalida').AsString);
    Correo     := StrToCorreo(FieldByName('correo').AsString);

    { Los datos del Header }
    qrlNumero.Caption := FieldByName('ca_nrocartadoc').AsString;
    DestinatarioTipo  := StrToTipoDestinatario(FieldByName('ht_destinatario').AsString);

    SetDestinatario(FieldByName('ca_idendoso').AsInteger, FieldByName('ca_idformulario').AsInteger,
                    FieldByName('ca_idempdeudora').AsInteger, FieldByName('ca_idtrabajador').AsInteger,
                    FieldByName('ca_idart').AsInteger, FieldByName('ca_iddestinatariocarta').AsInteger,
                    FieldByName('ca_idcomisionmedica').AsInteger);

    SetRemitenteActual;

    ReplicarTodo;

    { Datos del Firmante }
// Este reporte no lleva firma...
//    IdFirma := sdqDatos.FieldByName('IDFIRMA').AsInteger;
  finally
    Free;
  end;
end;

procedure TrptCartDocTraspasoEgreso2.LoadValues;
begin
 //No hace nada...está para evitar que llame al LoadValues del ancestro
end;

procedure TrptCartDocTraspasoEgreso2.ImprimeCuit(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TrptCartDocTraspasoEgreso2.ImprimeMonto(Sender: TObject;  var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffcurrency, 2);
end;

procedure TrptCartDocTraspasoEgreso2.qrbChildDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  
  PrintBand := ((((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) mod REGISTROSPORPAGINA) = 0) or (sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF} = sdqEmpresas.RecordCount));
end;

procedure TrptCartDocTraspasoEgreso2.qrbChildDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;

  // Si se muestra esta banda que lo que siga lo escriba en una hoja nueva..
  if (BandPrinted) and ((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) < sdqEmpresas.RecordCount) then
    Self.ForceNewPage;
end;

end.
