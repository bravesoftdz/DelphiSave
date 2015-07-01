unit unRptSolicitudPresupuestoAMP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrSolicitudPresupuestoAMP = class(TqrMoldeCarta)
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;                       
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    sdqEstudios: TSDQuery;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    qrmRequisitos: TQRMemo;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
  private
  public
    function Preparar(IDPrestador, NroSolicitud: integer): boolean;
  end;

var
  qrSolicitudPresupuestoAMP: TqrSolicitudPresupuestoAMP;

implementation

uses unDmPrincipal;

{$R *.dfm}

function TqrSolicitudPresupuestoAMP.Preparar(IDPrestador, NroSolicitud: integer): boolean;
begin
  with sdqDatos do
  begin
    OpenQueryEx(sdqDatos, [IDPrestador, NroSolicitud]);

    if not IsEmpty then
    begin
      Result := True;
    end else
    begin
      Close;
      Result := True;//False;
    end;
  end;
end;

procedure TqrSolicitudPresupuestoAMP.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  inherited;
    OpenQueryEx(sdqEstudios, [sdqDatos.FieldByName('ES_ID').AsInteger,
                              sdqDatos.FieldByName('SP_ID').AsInteger,
                              sdqDatos.FieldByName('SP_ID').AsInteger,
                              sdqDatos.FieldByName('ES_ID').AsInteger])
end;

end.
