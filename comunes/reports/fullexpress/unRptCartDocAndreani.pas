unit unRptCartDocAndreani;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptCartDocAndreani = class(TQuickRep)
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
    qrlAclaracion: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlFirma: TQRLabel;
    qrbSummary: TQRBand;
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrlFirmaPrint(sender: TObject; var Value: String);
  private
  public
    procedure Remite_Provincia_ART;
    procedure ReplicarRemitente;
    procedure ReplicarDestinatario;
    procedure ReplicarTodo;
  end;

var
  rptCartDocAndreani: TrptCartDocAndreani;

implementation

uses unPrincipal, unDmPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.Remite_Provincia_ART;
Var
   Sql      : String;
   Consulta : TSDQuery;
begin
     Try
          Sql := 'SELECT UTILES.ARMAR_DOMICILIO( LG_CALLE, LG_NUMERO, LG_PISO, LG_DEPARTAMENTO) DOMICILIO, ' +
                        'LG_CPOSTAL,  LG_LOCALIDAD, PV_DESCRIPCION ' +
                   'FROM DLG_DELEGACIONES, CPV_PROVINCIAS ' +
                  'WHERE LG_CODIGO = ''' + frmPrincipal.DBLogin.Delegacion + ''' ' +
                    'AND PV_CODIGO = LG_PROVINCIA';
          Consulta := GetQuery( Sql );
          Try
             qrlRemNombre.Caption    := 'Provincia A.R.T.' ;
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
           Raise Exception.Create('Error al cargar el domicilo de Provincia A.R.T.' + #13 + E.Message );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.ReplicarDestinatario;
begin
    qrlDestProvincia1.Caption := qrlDestProvincia.Caption ;
    qrlDestLocalidad1.Caption := qrlDestLocalidad.Caption ;
    qrlDestCPostal1.Caption   := qrlDestCPostal.Caption ;
    qrlDestDomicilio1.Caption := qrlDestDomicilio.Caption ;
    qrlDestNombre1.Caption    := qrlDestNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.ReplicarRemitente;
begin
    qrlRemProvincia1.Caption := qrlRemProvincia.Caption ;
    qrlRemLocalidad1.Caption := qrlRemLocalidad.Caption ;
    qrlRemCPostal1.Caption   := qrlRemCPostal.Caption ;
    qrlRemDomicilio1.Caption := qrlRemDomicilio.Caption ;
    qrlRemNombre1.Caption    := qrlRemNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.ReplicarTodo;
begin
    qrlNumero1.Caption := qrlNumero.Caption;
    ReplicarRemitente;
    ReplicarDestinatario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     qrbSummary.Tag := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     PrintBand      := False;
     qrbSummary.Tag := 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocAndreani.qrlFirmaPrint(sender: TObject; var Value: String);
begin
     if qrbSummary.Tag = 0 Then
        Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
