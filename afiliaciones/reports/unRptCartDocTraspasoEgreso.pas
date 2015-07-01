{Si se cambia cualquier cosa del reporte revisar la constante REGISTROSPORPAGINA !!!!!}

unit unRptCartDocTraspasoEgreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, Qrctrls, QuickRpt,
  ArtQReports, ExtCtrls, Db, SDEngine, unArt, unCustomDataModule, QrAngLbl, RxGIF;

type
  TrptCartDocTraspasoEgreso = class(TrptCartaDocHeader)
    sdqEmpresas: TSDQuery;
    qrbDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDeuda: TQRDBText;
    qrIntereses: TQRDBText;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText3: TQRDBText;
    qrGroupHeader: TQRGroup;
    qrbTitle: TQRBand;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
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
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qrbChildDetail: TQRChildBand;
    QRShape12: TQRShape;
    QRMemo3: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel3: TQRLabel;
    qrCantEmpresas: TQRExpr;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    procedure ImprimeCuit(Sender: TObject; var Value: String);
    procedure ImprimeMonto(Sender: TObject; var Value: String);
    procedure qrbChildDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbChildDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  protected
    function CargarValores: Boolean;

    procedure LoadValues; override;
  public
    function Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
  end;

var
  rptCartDocTraspasoEgreso: TrptCartDocTraspasoEgreso;

implementation

uses
  unDmPrincipal, unAfiliaciones, AnsiSql, strFuncs, Cuit;

const
  REGISTROSPORPAGINA = 21;
  {Si se cambia cualquier cosa del reporte revisar esta constante !!!!!}

{$R *.DFM}

function TrptCartDocTraspasoEgreso.Preparar(aId:TTableId; aTransactionMode: TTransactionMode): Boolean;
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

function TrptCartDocTraspasoEgreso.CargarValores: Boolean;
var
  sSql: String;
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  Result := True;

  sSql :=
    'SELECT ROWNUM, em_cuit, em_nombre, deuda_nominal, intereses, consolidado, te_idartfutura, ca_fechaalta, rgrl' +
     ' FROM (SELECT em_cuit, em_nombre, te_deudanominal deuda_nominal, te_intereses intereses,' +
                  ' te_consolidado consolidado, te_idartfutura, ca_fechaalta,' +
                  ' DECODE(te_clausulargrl, ''S'', NULL, DECODE(te_rgrl, ''N'', ''NO'', NULL)) rgrl' +
             ' FROM ate_traspasoegreso, aem_empresa, aco_contrato, cca_carta' +
            ' WHERE co_contrato = te_contrato' +
              ' AND co_idempresa = em_id' +
              ' AND te_idcarta = ca_id' +
              ' AND te_idcarta = :idcarta' +
         ' ORDER BY em_nombre)';
  OpenQueryEx(sdqEmpresas, [IdCarta], sSql);

 // QrCantEmpresas.Caption := IntToStr(sdqEmpresas.RecordCount);
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

  //////////////////////////////////////////
  //  PARAMETROS DE LA CARTA DOCUMENTO  ////
  //////////////////////////////////////////
  sSql :=
    'SELECT ca_nrocartadoc, ca_idendoso, ca_idformulario, ca_idempdeudora, ca_idtextocarta, ca_textofinal,' +
          ' ht_destinatario destinatario, ca_idtrabajador, ca_idart, NVL(ca_correoreimpresion, ca_correo) correo,' +
          ' ca_tiposalida, NVL(ca_idfirmareimpresion, ca_idfirma) idfirma, ca_iddelegacion, ca_idareatexto,' +
          ' ca_iddestinatariocarta, ca_idcomisionmedica, at_codigoremitente' +
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

    ArrangeControls;

    { Los datos del Header }
    qrlNumero.Caption := FieldByName('ca_nrocartadoc').AsString;
    DestinatarioTipo  := StrToTipoDestinatario(FieldByName('destinatario').AsString);

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

procedure TrptCartDocTraspasoEgreso.LoadValues;
begin
 //No hace nada...está para evitar que llame al LoadValues del ancestro
end;

procedure TrptCartDocTraspasoEgreso.ImprimeCuit(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TrptCartDocTraspasoEgreso.ImprimeMonto(Sender: TObject; var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffcurrency, 2);
end;

procedure TrptCartDocTraspasoEgreso.qrbChildDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := ((((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) mod REGISTROSPORPAGINA) = 0) or (sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF} = sdqEmpresas.RecordCount));
end;

procedure TrptCartDocTraspasoEgreso.qrbChildDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;

  // Si se muestra esta banda que lo que siga lo escriba en una hoja nueva..
  if (BandPrinted) and ((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) < sdqEmpresas.RecordCount) then
    Self.ForceNewPage;
end;

end.
