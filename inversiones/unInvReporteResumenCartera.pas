unit unInvReporteResumenCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DateComboBox, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TfrmInvReporteResumenCartera = class(TfrmCustomForm)
    gbVencimiento: TGroupBox;
    edFecha: TDateComboBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatos: TSDQuery;
    qrMinuta: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlDia: TQRLabel;
    QRLabel1: TQRLabel;
    qriLogo: TQRImage;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRShape7: TQRShape;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmInvReporteResumenCartera: TfrmInvReporteResumenCartera;

implementation

uses
  CustomDlgs, unArt, Strfuncs;
  
{$R *.dfm}

procedure TfrmInvReporteResumenCartera.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(edFecha.IsEmpty, edFecha, 'Debe indicar la fecha.');

  sSql := 'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, ' +
                 'SUM(ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, :Fecha)) IMPORTE ' +
            'FROM NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO ' +
           'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
             'AND IN_FECHABAJA IS NULL ' +
           'GROUP BY TI_DESCRIPCION';

  with sdqDatos do
    begin
      Sql.Text := sSql;
      ParamByName('Fecha').AsDateTime := edFecha.Date;
      Open;

      Verificar(IsEmpty, nil, 'No se han encontrado datos.');
    end;

  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);
  qrlDia.Caption := 'Fecha: ' + DateToStr(edFecha.Date);

  qrMinuta.ReportTitle := 'Resumen de Cartera';
  qrMinuta.PreviewModal;
end;

procedure TfrmInvReporteResumenCartera.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
 