unit unRptEventoImpresoSumario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ComCtrls, ArtQReports,RxRichEd,
  StdCtrls;

type
  TRptEventoImpresoSumario = class(TForm)
    qrDocumentoNuevo: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qriFirma: TQRImage;
    qrTexto: TQRRichText;
    auxRichEdit: TRichEdit;
    qrlFirmante: TQRRichText;
  private
    procedure LoadFirma;
  public
    procedure CargarTexto(richEdit : TRxRichEdit);
  end;

var
  RptEventoImpresoSumario: TRptEventoImpresoSumario;

implementation

uses unDmPrincipal, DB, unVisualizador, unExportPDF;
{$R *.dfm}

procedure TRptEventoImpresoSumario.CargarTexto(richEdit : TRxRichEdit);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    richEdit.Lines.SaveToStream(AStream);
    AStream.Position := 0;
    auxRichEdit.Lines.LoadFromStream(AStream); 
    //qrTexto.Lines.LoadFromStream(AStream);
    qrTexto.ParentRichEdit := auxRichEdit;
    LoadFirma;
    qrDocumentoNuevo.Prepare;
    Visualizar(qrDocumentoNuevo, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB], True, '', '', True);
  finally
    AStream.Free;
  end;
end;


procedure TRptEventoImpresoSumario.LoadFirma;
var
  sSql: String;
  fStream: TStream;
begin
  sSql := 'SELECT fi_firmante, fi_documento, fi_caracter, fi_firma, fi_margeninferior, ' +
                ' fi_firmatodas ' +
           ' FROM cfi_firma ' +
          ' WHERE fi_id = :idfirma';
  with GetQueryEx(sSql, [2]) do
  try
    //qrlFirmante.Caption   := FieldByName('fi_firmante').AsString;
    if not FieldByName('fi_firma').IsNull then
    begin
      fStream := CreateBlobStream(FieldByName('fi_firma'), bmReadWrite);
      try
        qriFirma.Picture.Bitmap.LoadFromStream(fStream);
      finally
        fStream.Free;
      end;
    end;
  finally
    Free;
  end;
end;

end.
