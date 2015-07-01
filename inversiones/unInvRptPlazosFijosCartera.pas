unit unInvRptPlazosFijosCartera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Data.DB, SDEngine, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, ArtQReports;

type
  TfrmInvRptPlazosFijosCartera = class(TfrmCustomForm)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbFecha: TGroupBox;
    edFecha: TDateComboBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqReporte: TSDQuery;
    qr: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlParam2: TQRLabel;
    qrlParam1: TQRLabel;
    qriLogo: TQRImage;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrlUsuImpresion: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRExpr2: TQRExpr;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    QRExpr3: TQRExpr;
    QRShape4: TQRShape;
    QRExpr4: TQRExpr;
    QRShape5: TQRShape;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape6: TQRShape;
    QRExpr6: TQRExpr;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMonto6(Sender: TObject; var Value: String);
    procedure FormatMontoSinPesos(Sender: TObject; var Value: String);
    procedure FormatPorc2(Sender: TObject; var Value: String);
    procedure FormatPorc3(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmInvRptPlazosFijosCartera: TfrmInvRptPlazosFijosCartera;

implementation

uses
  CustomDlgs, unArt, Strfuncs, unSesion, unVisualizador, DateTimeFuncs;

{$R *.dfm}

procedure TfrmInvRptPlazosFijosCartera.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraTipoInstrumento.IsEmpty, fraTipoInstrumento, 'Debe indicar el tipo de instrumento.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe indicar la fecha.');

  sSql := 'SELECT CERTIFICADO, CONSTITUCION, INSTITUCION, CAPITAL, TASA, PLAZO, VENCIMIENTO, ' +
                 'ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) INTERES, IMPUESTO, ' +
                 'CAPITAL + ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO MONTO, ' +
                 'DECODE(CAPITAL, 0, 0, ROUND((((CAPITAL + ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO) / CAPITAL) - 1) * 100, 2)) RENDIMIENTO, ' +
                 'CASE WHEN VENCIMIENTO <= :Fecha THEN CAPITAL + ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO ' +
                 'ELSE DECODE(CAPITAL, 0, 0, ROUND(CAPITAL * (((CAPITAL + ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO) / CAPITAL) - 1) * ( :Fecha - CONSTITUCION) / PLAZO + CAPITAL, 2)) ' +
                 'END DEVENGADO, ' +
                 'CASE WHEN VENCIMIENTO <= :Fecha THEN ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO ' +
                 'ELSE DECODE(CAPITAL, 0, 0, ROUND(CAPITAL * (((CAPITAL + ROUND(CAPITAL * TASA / 100 * PLAZO / 365, 2) - IMPUESTO) / CAPITAL) - 1) * ( :Fecha - CONSTITUCION) / PLAZO + CAPITAL, 2) - CAPITAL) ' +
                 'END INTERES_DEVENGADO ' +
            'FROM (SELECT TI_ID IDTIPOINSTRUMENTO, TI_DESCRIPCION TIPOINSTRUMENTO, IN_CODCAJAVALORES CERTIFICADO, ' +
                         'IN_CONSTITUCION CONSTITUCION, NS_NOMBRE INSTITUCION, ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPITAL, ' +
                         'IN_TASA TASA, IN_PLAZO PLAZO, IN_VENCIMIENTO VENCIMIENTO, 0 IMPUESTO ' +
                    'FROM NTI_TIPOINSTRUMENTO, NNS_INSTITUCION, NIN_INSTRUMENTO ' +
                   'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                     'AND NS_ID = IN_IDINSTITUCION ' +
                     'AND TI_PLAZOFIJO = ''S'' ' +
                     'AND IN_FECHABAJA IS NULL) ' +
           'WHERE :Fecha BETWEEN CONSTITUCION AND VENCIMIENTO - 1 ' +
             'AND IDTIPOINSTRUMENTO = :Tipo ' +
           'ORDER BY VENCIMIENTO';

  with sdqReporte do
    begin
      Sql.Text := sSql;
      ParamByName('Fecha').AsDateTime := edFecha.Date;
      ParamByName('Tipo').AsInteger   := fraTipoInstrumento.Value;
      Open;

      Verificar(IsEmpty, nil, 'No se han encontrado datos.');
    end;

  with qr do
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);

      ReportTitle             := 'Plazos Fijos de Cartera';
      qrlParam1.Caption       := fraTipoInstrumento.Descripcion;
      qrlParam2.Caption       := 'LISTADO DE PLAZOS FIJOS AL: ' + DateToStr(edFecha.Date);
      qrlUsuImpresion.Caption := Sesion.Usuario;

      Visualizar(qr, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    end;
end;

procedure TfrmInvRptPlazosFijosCartera.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TfrmInvRptPlazosFijosCartera.FormatMonto6(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$', 6);
end;

procedure TfrmInvRptPlazosFijosCartera.FormatMontoSinPesos(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '');
end;

procedure TfrmInvRptPlazosFijosCartera.FormatPorc2(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 2);
end;

procedure TfrmInvRptPlazosFijosCartera.FormatPorc3(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 3);
end;

procedure TfrmInvRptPlazosFijosCartera.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoInstrumento do
    begin
      TableName      := 'NTI_TIPOINSTRUMENTO';
      FieldID        := 'TI_ID';
      FieldCodigo    := 'TI_ID';
      FieldDesc      := 'TI_DESCRIPCION';
      FieldBaja      := 'TI_FECHABAJA';
      ExtraCondition := 'AND TI_PLAZOFIJO  = ''S''';
      ShowBajas      := True;
    end;
end;

end.

