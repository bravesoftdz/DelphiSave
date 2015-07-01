unit unRemitoDocumentacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, SDEngine, QRCtrls, QuickRpt,
  Vcl.ExtCtrls, unArt;

type
  TfrmRemitoDocumentacion = class(TForm)
    qrRemito: TQuickRep;
    qrbHeader: TQRBand;
    lbNumeroRemito: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    qrlAnio: TQRLabel;
    qrlMes: TQRLabel;
    qrlDia: TQRLabel;
    qrsSeparadorFecha1: TQRShape;
    qrsSeparadorFecha2: TQRShape;
    qrlNumero: TQRLabel;
    qrlPagina: TQRLabel;
    qrCodigoBarras: TQRLabel;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrdbCuil: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    sdqDatos: TSDQuery;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    procedure qrdbCuilPrint(sender: TObject; var Value: string);
    procedure FormCreate(Sender: TObject);
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrCodigoBarrasPrint(sender: TObject; var Value: string);
  private
  public
    procedure DoImprimirRemito(AIdRemito: TTableID; Preview: Boolean; eMail: string = '');
  end;

var
  frmRemitoDocumentacion: TfrmRemitoDocumentacion;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, Cuit, General, Numeros, strFuncs, unPrincipal,
  unVisualizador, unExportPDF;

{$R *.dfm}

procedure TfrmRemitoDocumentacion.qrdbCUILPrint(Sender: TObject; var Value: String);
begin
  if Value <> '' then
  	Value := PonerGuiones(Value);
end;

procedure TfrmRemitoDocumentacion.FormCreate(Sender: TObject);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TfrmRemitoDocumentacion.DoImprimirRemito(AIdRemito: TTableID; Preview: Boolean; eMail: string = '');
var
  dFechaRemito: TDateTime;
  sSql: String;
  OpcVisualizador: TOpcionesVisualizador;
begin
  sSql := 'SELECT CAST(LPAD(DR_REMITO, ''8'', ''0'') AS VARCHAR2(8)) DR_REMITO, DR_FECHAREMITO ' +
            'FROM CDR_DOCUMENTACIONRECIBIDA ' +
           'WHERE DR_REMITO = ' + SqlValue(AIdRemito);

  with GetQuery(sSql) do
    try
      if RecordCount < 1 then
        begin
          MsgBox( 'No se han encontrado los datos del remito ' + IntToStr(AIdRemito), MB_OK + MB_ICONEXCLAMATION );
          Exit;
        end
      else
        begin
          dFechaRemito           := FieldByName('DR_FECHAREMITO').AsDateTime;
          qrlDia.Caption         := FormatDateTime('dd', dFechaRemito);
          qrlMes.Caption         := FormatDateTime('mm', dFechaRemito);
          qrlAnio.Caption        := FormatDateTime('yyyy', dFechaRemito);
          qrlNumero.Caption      := 'Remito Nº ' + FieldByName('DR_REMITO').AsString;
          qrCodigoBarras.Caption :=  '*' + FieldByName('DR_REMITO').AsString + '*';
        end;
    finally
      Free;
    end;

  sdqDatos.ParamByName('REMITO').AsInteger := AIdRemito;
  sdqDatos.Open;

  if sdqDatos.RecordCount > 0 then
    begin
      if Preview then
        begin
          OpcVisualizador := [oForceDB, oForceShowModal, oShowDialogIfEmpty];
          if eMail = '' then
            OpcVisualizador := OpcVisualizador + [oMailNotAllowed];

          Visualizar(qrRemito, GetValores('Remito de Documentación - Nro. ' + IntToStr(AIdRemito), eMail), OpcVisualizador)
        end
      else
        qrRemito.Print;
    end
  else
    MessageDlg('No se encontraron documentos asociados al remito ' + IntToStr(AIdRemito) + ' que intenta imprimir.', mtInformation, [mbOK], 0);
end;

procedure TfrmRemitoDocumentacion.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr(qrRemito.PageNumber);
end;

procedure TfrmRemitoDocumentacion.qrCodigoBarrasPrint(sender: TObject; var Value: string);
begin
  qrCodigoBarras.Enabled := not IsExportingPDF();
end;

end.
