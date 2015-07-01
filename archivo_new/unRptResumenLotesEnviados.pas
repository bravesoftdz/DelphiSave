unit unRptResumenLotesEnviados;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, unArt;

type
  TqrResumenLotesEnviados = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogo: TQRImage;
    qrsLineaFirma: TQRShape;
    qrlUsuEmisor: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrlSectorEmisor: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCantLotes: TQRLabel;
    qrmLotes: TQRMemo;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    qrlAnio: TQRLabel;
    qrlMes: TQRLabel;
    qrlDia: TQRLabel;
    qrsSeparadorFecha1: TQRShape;
    qrsSeparadorFecha2: TQRShape;
    qrlNumero: TQRLabel;
    qrCodigoBarras: TQRLabel;
  private
  public
    class procedure DoImprimirResumenLotesEnviados(NroRemitoEnvio: TTableId);
  end;

var
  qrResumenLotesEnviados: TqrResumenLotesEnviados;

implementation

uses
  unSesion, unVisualizador, unDmPrincipal, AnsiSql, CustomDlgs, StrFuncs;

{$R *.DFM}

class procedure TqrResumenLotesEnviados.DoImprimirResumenLotesEnviados(NroRemitoEnvio: TTableId);
var
  rpt: TqrResumenLotesEnviados;
  sNroRemitoEnvio, sLotes, sSql: String;
  dFechaEnvioLote: TDateTime;
begin
  sLotes := '';

  rpt := TqrResumenLotesEnviados.Create(nil);
  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      sSql := 'SELECT RL_FECHAALTA ' +
                'FROM RRL_REMITOENVIOLOTE ' +
               'WHERE RL_FECHABAJA IS NULL ' +
                 'AND RL_ID = :Id';
      dFechaEnvioLote := ValorSqlDateTimeEx(sSql, [NroRemitoEnvio]);

      if dFechaEnvioLote = 0 then
        MsgBox('El remito de envío de lotes se encuentra dado de baja.', MB_ICONERROR)
      else
        begin
          qrlDia.Caption  := FormatDateTime('dd', dFechaEnvioLote);
          qrlMes.Caption  := FormatDateTime('mm', dFechaEnvioLote);
          qrlAnio.Caption := FormatDateTime('yyyy', dFechaEnvioLote);

          sNroRemitoEnvio        := LPad(IntToStr(NroRemitoEnvio), '0', 8);
          qrlNumero.Caption      := 'Remito Envío Lotes Nº ' + sNroRemitoEnvio;
          qrCodigoBarras.Caption :=  '*' + sNroRemitoEnvio + '*';

          qrlUsuEmisor.Caption    := Sesion.Usuario;
          qrlSectorEmisor.Caption := Sesion.SectorDesc;

          sSql := 'SELECT LO_ID LOTE ' +
                    'FROM RLO_LOTE ' +
                   'WHERE LO_IDREMITOENVIOLOTE = :RemitoEnvio ' +
                     'AND LO_FECHABAJA IS NULL ' +
                   'ORDER BY LO_ID';

          with GetQueryEx(sSql, [NroRemitoEnvio]) do
            try
              if Eof then
                MsgBox('No se ha encontrado el remito de envío de lotes.', MB_ICONERROR)
              else
                begin
                  qrlCantLotes.Caption := IntToStr(Recordcount);

                  while not Eof do
                    begin
                      sLotes := sLotes + FieldByName('LOTE').AsString + ' - ';
                      Next;
                    end;
                  qrmLotes.Lines.Text := StrLeft(sLotes, Length(sLotes) - 3);

                  Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
                end;
            finally
              Free;
            end;
        end;
    finally
      Free;
    end;
end;

end.

