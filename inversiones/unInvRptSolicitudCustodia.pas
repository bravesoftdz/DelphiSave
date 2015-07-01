unit unInvRptSolicitudCustodia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  Data.DB, SDEngine, unArt;

type
  TfrmInvRptSolicitudCustodia = class(TForm)
    qrSolicitudCustodia: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    qriLogo: TQRImage;
    sdqDatos: TSDQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlDenominacion: TQRLabel;
    QRLabel6: TQRLabel;
    qrlCuenta: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    qrlEntrega: TQRLabel;
    QRShape2: TQRShape;
    qrlRetiro: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    DetailBand1: TQRBand;
    qrlFecha: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRMemo1: TQRMemo;
    qrmAutorizados: TQRMemo;
    QRMemo2: TQRMemo;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel17: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    QRShape16: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirSolicitudCustodia(FechaDesde, FechaHasta: TDateTime; Tipo: String);
  function DoImprimirSolicitudCustodiaCuenta(FechaDesde, FechaHasta: TDateTime; Tipo: String; IdCuentaCustodia: TTableId): Boolean;

var
  frmInvRptSolicitudCustodia: TfrmInvRptSolicitudCustodia;

implementation

{$R *.dfm}

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros,
  unVisualizador, unSesion;

procedure DoImprimirSolicitudCustodia(FechaDesde, FechaHasta: TDateTime; Tipo: String);
var
  sSql: String;
  bHayRegistros: Boolean;
begin
  bHayRegistros := False;

  sSql := 'SELECT DISTINCT TI_IDCUENTACUSTODIA  IDCUENTACUSTODIA ' +
            'FROM NTI_TIPOINSTRUMENTO ' +
           'WHERE TI_PLAZOFIJO = ''S'' ' +
             'AND TI_FECHABAJA IS NULL ' +
           'ORDER BY 1';

  with GetQuery(sSql) do
    try
      if Eof then
        MsgBox('No se han encontrado cuentas custodia.', MB_OK + MB_ICONERROR)
      else
        while not Eof do
          begin
            if DoImprimirSolicitudCustodiaCuenta(FechaDesde, FechaHasta, Tipo, FieldByName('IDCUENTACUSTODIA').AsInteger) then
              bHayRegistros := True;

            Next;
          end;

      if not bHayRegistros then
        MsgBox('Solicitud de Custodia sin registros.', MB_OK + MB_ICONERROR);
    finally
      Free;
    end;
end;

function DoImprimirSolicitudCustodiaCuenta(FechaDesde, FechaHasta: TDateTime; Tipo: String; IdCuentaCustodia: TTableId): Boolean;
var
  frm: TfrmInvRptSolicitudCustodia;
  sSql: String;
begin
  frm := TfrmInvRptSolicitudCustodia.Create(nil);

  with frm do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      sSql := 'SELECT IN_CODCAJAVALORES NRO_PF, NS_NOMBRE ENTIDAD_EMISORA, IN_VENCIMIENTO VENCIMIENTO, ' +
                     'ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPITAL_INICIAL, ' +
                     'DECODE(MO_TIPO, ''L'', ''$'', ''E'', ''U$S'', '''') MONEDA, ' +
                     'CB_NUMERO CUENTA ' +
                'FROM ZCB_CUENTABANCARIA, NTI_TIPOINSTRUMENTO, NNS_INSTITUCION, NIN_INSTRUMENTO, NMO_MONEDA ' +
               'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                 'AND NS_ID = IN_IDINSTITUCION ' +
                 'AND MO_ID = IN_IDMONEDA ' +
                 'AND TI_PLAZOFIJO = ''S'' ' +
                 'AND IN_FECHABAJA IS NULL ' +
                 'AND CB_ID = :CuentaCustodia ' +
                 'AND CB_ID = TI_IDCUENTACUSTODIA ';

      if Tipo = 'E' then   // Entrega
        begin
          sSql := sSql + 'AND TRUNC(IN_FECHAALTA) BETWEEN :FechaDesde AND :FechaHasta ' +
                         'AND IN_CODCAJAVALORES IS NOT NULL ' +
                         'AND NVL(IN_ENCUSTODIA, ''N'') = ''N''';

          qrlEntrega.Caption := 'x';
          qrlRetiro.Caption  := '';
        end
      else                 // Retiro
        begin
          sSql := sSql + 'AND IN_VENCIMIENTO-1 BETWEEN :FechaDesde AND :FechaHasta';

          qrlEntrega.Caption := '';
          qrlRetiro.Caption  := 'x';
        end;

      sSql := sSql + ' ORDER BY ENTIDAD_EMISORA, NRO_PF';

      with sdqDatos do
        begin
          SQL.Text := sSql;
          ParamByName('FechaDesde').AsDateTime    := FechaDesde;
          ParamByName('FechaHasta').AsDateTime    := FechaHasta;
          ParamByName('CuentaCustodia').AsInteger := IdCuentaCustodia;
        end;
      OpenQuery(sdqDatos);

      Result := not sdqDatos.Eof;
      if Result then
        begin
          qrlDenominacion.Caption := ART_NOMBRE;
          qrlCuenta.Caption       := sdqDatos.FieldByName('CUENTA').AsString;
          qrlFecha.Caption        := 'Fecha: ' + DateToStr(DBDate());

          qrmAutorizados.Lines.Text := 'Autorizamos al portador de la presente, Sr/Sra. Luciano Castro DNI 31.863.768, ' +
                                       'Gastón Ariel Cruces DNI 34.345.378, Nicolás Luque DNI 33.572.933, Marcela Rojas DNI 92.936.164, ' +
                                       'Gustavo Velazquez DNI 35.268.939 y Bruno E. Díaz Garro DNI 34.947.529 a retirar los siguientes ' +
                                       'certificados a plazo fijo, para proceder a su renovación.';

          Visualizar(qrSolicitudCustodia, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
        end;
    finally
      Free;
    end;
end;

procedure TfrmInvRptSolicitudCustodia.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

end.

