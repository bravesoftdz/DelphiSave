unit unRptCartDocBonaerense;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptCartDocBonaerense = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrlRemNombre: TQRLabel;
    qrlRemDomicilio: TQRLabel;
    qrlRemCPostal: TQRLabel;
    qrlRemLocalidad: TQRLabel;
    qrlRemProvincia: TQRLabel;
    qrlDestProvincia: TQRLabel;
    qrlDestLocalidad: TQRLabel;
    qrlDestCPostal: TQRLabel;
    qrlDestDomicilio: TQRLabel;
    qrlDestNombre: TQRLabel;
    qrlRemProvincia1: TQRLabel;
    qrlRemLocalidad1: TQRLabel;
    qrlRemCPostal1: TQRLabel;
    qrlRemDomicilio1: TQRLabel;
    qrlRemNombre1: TQRLabel;
    qrlDestNombre1: TQRLabel;
    qrlDestDomicilio1: TQRLabel;
    qrlDestCPostal1: TQRLabel;
    qrlDestLocalidad1: TQRLabel;
    qrlDestProvincia1: TQRLabel;
    qrbDetail: TQRBand;
    qrrTexto: TQRRichText;
    qrlNumero: TQRLabel;
    qrlNumero1: TQRLabel;
    qbrFirmas: TQRBand;
    qrlFirmante: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlFirma: TQRLabel;
    qrbSummary: TQRBand;
    qrlBarras2: TQRLabel;
    qrlBarras1: TQRLabel;
    qriFirma: TQRImage;
    LblSin: TQRLabel;
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrlFirmaPrint(sender: TObject; var Value: String);
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
  private
  public
    procedure Remite_Provincia_ART;
    procedure ReplicarRemitente;
    procedure ReplicarDestinatario;
    procedure ReplicarTodo;
  end;

var
  rptCartDocBonaerense: TrptCartDocBonaerense;

implementation

uses unPrincipal, unDmPrincipal, unArt, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.Remite_Provincia_ART;
Var
   Sql      : String;
   Consulta : TSDQuery;
begin
     Try
          Sql := 'SELECT UTILES.ARMAR_DOMICILIO( LG_CALLE, LG_NUMERO, LG_PISO, LG_DEPARTAMENTO) DOMICILIO, ' +
                        'LG_CPOSTAL, LG_LOCALIDAD, PV_DESCRIPCION ' +
                   'FROM DLG_DELEGACIONES, CPV_PROVINCIAS ' +
                  'WHERE LG_CODIGO = ' + SqlValue(frmPrincipal.DBLogin.Delegacion) + ' ' +
                    'AND PV_CODIGO = LG_PROVINCIA';
          Consulta := GetQuery( Sql );
          Try
             qrlRemNombre.Caption    := TXT_EMP_RSOCIAL ;
             qrlRemDomicilio.Caption := Consulta.FieldByName('DOMICILIO').AsString  ;
             qrlRemCPostal.Caption   := Consulta.FieldByName('LG_CPOSTAL').AsString ;
             qrlRemProvincia.Caption := Consulta.FieldByName('PV_DESCRIPCION').AsString ;
             qrlRemLocalidad.Caption := Consulta.FieldByName('LG_LOCALIDAD').AsString ;

             ReplicarRemitente;
          finally
             Consulta.Free;
          end;
     except
        on E: Exception do
           Raise Exception.Create('Error al cargar el domicilo de ' + TXT_EMP_RSOCIAL + #13 + E.Message );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.ReplicarDestinatario;
begin
    qrlDestProvincia1.Caption := qrlDestProvincia.Caption ;
    qrlDestLocalidad1.Caption := qrlDestLocalidad.Caption ;
    qrlDestCPostal1.Caption   := qrlDestCPostal.Caption ;
    qrlDestDomicilio1.Caption := qrlDestDomicilio.Caption ;
    qrlDestNombre1.Caption    := qrlDestNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.ReplicarRemitente;
begin
    qrlRemProvincia1.Caption := qrlRemProvincia.Caption ;
    qrlRemLocalidad1.Caption := qrlRemLocalidad.Caption ;
    qrlRemCPostal1.Caption   := qrlRemCPostal.Caption ;
    qrlRemDomicilio1.Caption := qrlRemDomicilio.Caption ;
    qrlRemNombre1.Caption    := qrlRemNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.ReplicarTodo;
begin
    qrlNumero1.Caption := qrlNumero.Caption;
    ReplicarRemitente;
    ReplicarDestinatario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     qrbSummary.Tag := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     PrintBand      := False;
     qrbSummary.Tag := 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.qrlFirmaPrint(sender: TObject; var Value: String);
begin
     if qrbSummary.Tag = 0 Then
        Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocBonaerense.qrlBarrasPrint(sender: TObject; var Value: String);
begin
     Value := '*' + qrlNumero.Caption + '*';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
