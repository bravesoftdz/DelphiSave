unit unQrLibreDeuda;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unArt;

type
  TqrLibreDeuda = class(TQuickRep)
    DetailBand1: TQRBand;
    qrlFecha: TQRLabel;
    QRMemo5: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlRSocial: TQRLabel;
    qrlCuit: TQRLabel;
    qrlContrato: TQRLabel;
    qrlVigencia: TQRLabel;
    qrlDireccion: TQRLabel;
    qrlLocalidad: TQRLabel;
    qrlProvincia: TQRLabel;
    QRMemoTexto: TQRMemo;
    qriLogo: TQRImage;
  private
  public
  end;

  procedure Do_ImprimirArchivoLibreDeuda(NombreArchivo: String);
  function Get_NombreArchivoLD(IdArchivo: TTableId): String;
  function PrepararLibreDeuda(Contrato: Integer; IdArchivo: TTableId): Boolean;

const
  DIR_LD: String  = 'LibreDeuda';

implementation

uses
  DateTimeFuncs, unDmPrincipal, unVisualizador, unCobranzas, ArchFuncs, unExportPDF,
  Dialogs;

{$R *.DFM}

procedure Do_ImprimirArchivoLibreDeuda(NombreArchivo: String);
begin
  Do_ImprimirArchivoServidorCobranzas(NombreArchivo, 'LibreDeuda');
end;

function Get_NombreArchivoLD(IdArchivo: TTableId): String;
var
  sDir: String;
begin
  sDir := DIR_LD;

  Result := Get_NombreArchivoServidorCobranzas(IdArchivo, sDir);
end;

function PrepararLibreDeuda(Contrato: Integer; IdArchivo: TTableId): Boolean;
var
  sContrato, sNombreArchivoServidor, sNombreArchivo, sPerBaja, sPer, sSql, sTexto: String;
  sFechaBaja, sMotivoBaja: String;
  bOk, bContratoActivo: Boolean;
  rpt: TqrLibreDeuda;
begin
  bOk  := True;

  rpt := TqrLibreDeuda.Create(nil);
  with rpt do
    try
      bContratoActivo := True;

      qrlFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo;
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

      sSql := 'SELECT EM_NOMBRE RSOCIAL, UTILES.ARMAR_CUIT(EM_CUIT) CUIT, CO_CONTRATO CONTRATO, CO_VIGENCIADESDE VIGENCIADESDE, ' +
                     'UTILES.ARMAR_DOMICILIO(DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, NULL) DOMICILIO, ' +
                     'UTILES.ARMAR_LOCALIDAD(DC_CPOSTAL, NULL, DC_LOCALIDAD) LOCALIDAD, CO_MOTIVOBAJA MOTIVOBAJA, ' +
                     'PV_DESCRIPCION PROVINCIA, CO_ESTADO ESTADO, UTILES.ARMAR_PERIODO(TO_CHAR(CO_FECHABAJA, ''YYYYMM'')) PERBAJA, ' +
                     'CO_FECHABAJA FECHABAJA ' +
                'FROM CPV_PROVINCIAS, ADC_DOMICILIOCONTRATO, AEM_EMPRESA, ACO_CONTRATO ' +
               'WHERE CO_IDEMPRESA=EM_ID ' +
                 'AND CO_CONTRATO=DC_CONTRATO ' +
                 'AND DC_TIPO=''L'' ' +
                 'AND DC_PROVINCIA=PV_CODIGO ' +
                 'AND CO_CONTRATO=:iContrato';

      with GetQueryEx(sSql, [Contrato]) do
        try
          if Eof then
            bOk := False
          else
            begin
              qrlRSocial.Caption   := FieldByName('RSOCIAL').AsString;
              qrlCuit.Caption      := FieldByName('CUIT').AsString;
              qrlContrato.Caption  := FieldByName('CONTRATO').AsString;
              qrlVigencia.Caption  := FieldByName('VIGENCIADESDE').AsString;
              qrlDireccion.Caption := FieldByName('DOMICILIO').AsString;
              qrlLocalidad.Caption := FieldByName('LOCALIDAD').AsString;
              qrlProvincia.Caption := FieldByName('PROVINCIA').AsString;
              sPerBaja             := FieldByName('PERBAJA').AsString;
              sMotivoBaja          := FieldByName('MOTIVOBAJA').AsString;
              sFechaBaja           := FieldByName('FECHABAJA').AsString;

              bContratoActivo := ((FieldByName('ESTADO').AsString = '1') or (FieldByName('ESTADO').AsString = '9'));
            end;
        finally
          Free;
        end;

      if bContratoActivo then
        begin
          sSql := 'SELECT UTILES.ARMAR_PERIODO(LEAST(MAX(RC_PERIODONOMINA), DEUDA.ULTIMOPERIODODEVENGADO)) ' +
                    'FROM ZRC_RESUMENCOBRANZA ' +
                   'WHERE RC_CONTRATO=:iContrato';
          sPer := ValorSqlEx(sSql, [Contrato]);

          if sPer = '' then
            bOk := False;

          sTexto := 'Se deja constancia que la empresa de referencia, no posee deuda exigible correspondiente ' +
                    'a los períodos declarados desde inicio de la vigencia del presente contrato, hasta el período ' + sPer + ' ' +
                    '(Ultimo mes con declaración jurada recibida de AFIP).';
        end
      else
        begin
          if sMotivoBaja = '08' then     	  // Baja por Rescisión por Falta de Pago
            begin
              sPer := Get_PeriodoUltimaFechaPago(Contrato);

              if (sPer = '') or (sPerBaja = '') then
                bOk := False;

              sTexto := 'Se deja constancia que la empresa de referencia no posee deuda exigible correspondiente ' +
                        'al Contrato Nro. ' + qrlContrato.Caption + ' rescindido por falta de pago en el mes ' + sPerBaja + ' ' +
                        'y regularizado en el mes ' + sPer + '.';
            end
          else if sMotivoBaja = '07' then   // Baja por Traspaso
            begin
              if  sFechaBaja = '' then
                bOk := False;

              sTexto := 'Se deja constancia que la empresa de referencia no posee deuda exigible correspondiente ' +
                        'a los períodos declarados desde la vigencia del contrato Nro. ' + qrlContrato.Caption + ' y cuya baja ' +
                        'opera por traspaso el ' + sFechaBaja + '.';
            end
          else
            bOk := False;
        end;

      sTexto := sTexto + CRLF + CRLF + CRLF + CRLF +
                'Se extiende el presente a pedido del cliente.';

      QRMemoTexto.Lines.Text := sTexto;

      if bOk then
        begin
          Visualizar(rpt, GetValores('Libre Deuda'), [oForceShowModal]);

          sContrato      := IntToStr(Contrato);
          sNombreArchivo := Format(TempPath + '%s.pdf', [sContrato]);

          Application.ProcessMessages;
          ExportarPDF(rpt, sNombreArchivo);

          sNombreArchivoServidor := Get_NombreArchivoLD(IdArchivo);
          MoveFile(sNombreArchivo, sNombreArchivoServidor);

          if not FileExists(sNombreArchivoServidor) then
            MessageDlg('Error al generar la foto del libre deuda ' + sContrato, mtError, [mbOK], 0);
        end;
    finally
      Free;
    end;

  Result := bOk;
end;

end.
