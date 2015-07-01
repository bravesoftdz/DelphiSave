{Si se cambia cualquier cosa del reporte revisar la constante REGISTROSPORPAGINA !!!!!}

unit unRptCartDocTraspasoIngreso;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-05-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, Qrctrls, QuickRpt,
  ArtQReports, ExtCtrls, Db, SDEngine, unArt, unCustomDataModule, RxGIF, QrAngLbl;

type
  TrptCartDocTraspasoIngreso = class(TrptCartaDocHeader)
    sdqEmpresas: TSDQuery;
    qrbDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    qrGroupHeader: TQRGroup;
    ChildBand1: TQRChildBand;
    QRMemo4: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QrFecha: TQRLabel;
    QRLabel9: TQRLabel;
    QRNombreART: TQRLabel;
    QRDireccionART: TQRLabel;
    QRLocalidadART: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    ChildBand3: TQRChildBand;
    QRMemo2: TQRMemo;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QrCantEmpresas: TQRExpr;
    QRShape6: TQRShape;
    procedure ImprimeCuit(Sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ChildBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  protected
    function CargarValores: Boolean;

    procedure LoadValues; override;
  public
    function Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
  end;

var
  rptCartDocTraspasoIngreso: TrptCartDocTraspasoIngreso;

implementation

uses
  unDmPrincipal, AnsiSql, StrFuncs, Cuit;

const
  REGISTROSPORPAGINA = 12;
  {Si se cambia cualquier cosa del reporte revisar esta constante !!!!!}

{$R *.DFM}

function TrptCartDocTraspasoIngreso.CargarValores: Boolean;
var
  sArtNombre: String;
  sSql: String;
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  Result := True;
  
  sSql :=
    'SELECT ROWNUM, sa_nombre, sa_cuit, sa_idartanterior, ca_fechaalta' +
     ' FROM (SELECT   sa_nombre, sa_cuit, sa_idartanterior, ca_fechaalta' +
               ' FROM ati_traspasoingreso, asa_solicitudafiliacion, cca_carta' +
              ' WHERE ti_idformulario = sa_idformulario' +
                ' AND ti_idcarta = ca_id' +
                ' AND ti_idcarta = :idcarta' +
           ' ORDER BY sa_nombre)';
  OpenQueryEx(sdqEmpresas, [IdCarta], sSql);

  //QrCantEmpresas.Caption := IntToStr(sdqEmpresas.RecordCount);
  DecodeDate(sdqEmpresas.FieldByName('ca_fechaalta').AsDateTime, wYear, wMonth, wDay);
  QrFecha.Caption := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqEmpresas.FieldByName('ca_fechaalta').AsDateTime);

  sSql :=
    'SELECT ar_nombre nombre, utiles.armar_domicilio(ar_calle, ar_numero, ar_piso, ar_departamento) domicilio,' +
          ' ar_cpostal cpostal, ar_cpostala cpostala, ar_localidad localidad, pv_descripcion provincia' +
     ' FROM aar_art, cpv_provincias' +
    ' WHERE pv_codigo(+) = ar_provincia' +
      ' AND ar_id = :id';
  with GetQueryEx(sSql, [sdqEmpresas.FieldByName('sa_idartanterior').AsInteger]) do
  try
    if Eof then
    begin
      sSql :=
        'SELECT ar_nombre' +
         ' FROM aar_art' +
        ' WHERE ar_id = :id';
      sArtNombre := ValorSqlEx(sSql, [sdqEmpresas.FieldByName('sa_idartanterior').AsInteger]);
      
      MessageDlg(Format('La ART "%s" no tiene dirección, no se puede mostrar la carta.', [sArtNombre]), mtError, [mbOK], 0);
      Result := False;
    end
    else
    begin
      QRNombreART.Caption    := FieldByName('nombre').AsString;
      QRDireccionART.Caption := FieldByName('domicilio').AsString;
      QRLocalidadART.Caption := '(' + FieldByName('cpostal').AsString + ')';

      if FieldByName('cpostala').AsString <> '' then
        QRLocalidadART.Caption := Format('%s (%s) ', [QRLocalidadART.Caption, FieldByName('cpostala').AsString]);

      QRLocalidadART.Caption := QRLocalidadART.Caption + FieldByName('localidad').AsString + ', ' + FieldByName('provincia').AsString;
     end;
   finally
     Free;
   end;

  ////////////////////////////////////////
  //  PARAMETROS DE LA CARTA DOCUMENTO  //
  ////////////////////////////////////////
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

function TrptCartDocTraspasoIngreso.Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
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

procedure TrptCartDocTraspasoIngreso.LoadValues;
begin
  //Esto se deja asi para que no llame a LoadValues anterior
end;

procedure TrptCartDocTraspasoIngreso.ImprimeCuit(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TrptCartDocTraspasoIngreso.ChildBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := ((((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) mod REGISTROSPORPAGINA) = 0) or (sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF} = sdqEmpresas.RecordCount));
end;

procedure TrptCartDocTraspasoIngreso.ChildBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;

  // Si se muestra esta banda que lo que siga lo escriba en una hoja nueva..
  if (BandPrinted) and ((sdqEmpresas.RecNo {$IFDEF VER150}+ 1{$ENDIF}) < sdqEmpresas.RecordCount) then
    Self.ForceNewPage;
end;

end.
