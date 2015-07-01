unit unInvReporteMinuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DateComboBox, QuickRpt, ExtCtrls, DB, SDEngine, QRCtrls;
                           
type
  TfrmInvReporteMinuta = class(TfrmCustomForm)
    gbVencimiento: TGroupBox;
    edFechaDesde: TDateComboBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    qrMinuta: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrBandFooter: TQRBand;
    sdqDatos: TSDQuery;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    qrlConfecciona: TQRLabel;
    qrlAutoriza: TQRMemo;
    QRLabel8: TQRLabel;
    qrlMontos: TQRLabel;
    QRShape13: TQRShape;
    QRDBText8: TQRDBText;
    Label1: TLabel;
    edFechaHasta: TDateComboBox;
    QRGroup1: TQRGroup;
    qrlDia: TQRLabel;
    QRDBText9: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlCodigo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMonto2(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmInvReporteMinuta: TfrmInvReporteMinuta;

implementation

{$R *.dfm}

uses
  CustomDlgs, unDmPrincipal, Strfuncs, unArt, unSesion;

procedure TfrmInvReporteMinuta.btnAceptarClick(Sender: TObject);
var
  sRangoImp, sAutoriza, sSql: String;
  bHayDatos: Boolean;
  qry: TSDQuery;
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe indicar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha hasta.');

  bHayDatos := False;

  sSql := 'SELECT DISTINCT CI_MONTODESDE MONTO_DESDE, CI_MONTOHASTA MONTO_HASTA ' +
            'FROM NNA_NIVELAUTORIZACION, NCI_CONTROLINVERSION ' +
           'WHERE NA_ID = CI_IDNIVELAUTORIZA ' +
             'AND CI_FECHABAJA IS NULL ' +
             'AND NA_FECHABAJA IS NULL ' +
           'ORDER BY 1 ';

  with GetQuery(sSql) do
    try
      while not Eof do
        begin
          sdqDatos.Close;
          sdqDatos.ParamByName('FechaDesde').AsDateTime := edFechaDesde.Date;
          sdqDatos.ParamByName('FechaHasta').AsDateTime := edFechaHasta.Date;
          sdqDatos.ParamByName('Desde').AsFloat         := FieldByName('MONTO_DESDE').AsFloat;
          sdqDatos.ParamByName('Hasta').AsFloat         := FieldByName('MONTO_HASTA').AsFloat;
          sdqDatos.Open;

          if not sdqDatos.IsEmpty then
            begin
              bHayDatos := True;
              sRangoImp := 'Rango: ' + Get_AjusteDecimales(FieldByName('MONTO_DESDE').AsString, '$') + ' - ' + Get_AjusteDecimales(FieldByName('MONTO_HASTA').AsString, '$');

              qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);

              qrlMontos.Caption      := sRangoImp;
              qrlConfecciona.Caption := Sesion.Usuario + ': ';

              sSql := 'SELECT NA_DESCRIPCION NIVEL_AUTORIZACION ' +
                        'FROM NNA_NIVELAUTORIZACION, NCI_CONTROLINVERSION ' +
                       'WHERE NA_ID = CI_IDNIVELAUTORIZA ' +
                         'AND CI_FECHABAJA IS NULL ' +
                         'AND NA_FECHABAJA IS NULL ' +
                         'AND CI_MONTODESDE = :MontoDesde ' +
                         'AND CI_MONTOHASTA = :MontoHasta ' +
                       'ORDER BY 1 ';
              qry := GetQueryEx(sSql, [FieldByName('MONTO_DESDE').AsFloat, FieldByName('MONTO_HASTA').AsFloat]);

              sAutoriza := '';
              try
                while not qry.Eof do
                  begin
                    sAutoriza := sAutoriza + qry.FieldByName('NIVEL_AUTORIZACION').AsString + ': ' + CRLF + CRLF + CRLF + CRLF + CRLF;

                    qry.Next;
                  end;

                qrlAutoriza.Lines.Text := sAutoriza;
              finally
                qry.Free;
              end;

              qrMinuta.ReportTitle := 'Minuta de Inversiones - ' + sRangoImp;
              qrMinuta.PreviewModal;
            end;

          Next;
        end;

      Verificar(not bHayDatos, nil, 'No se han encontrado datos.');
    finally
      Free;
    end;
end;

procedure TfrmInvReporteMinuta.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TfrmInvReporteMinuta.FormatMonto2(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 3);
end;

end.

