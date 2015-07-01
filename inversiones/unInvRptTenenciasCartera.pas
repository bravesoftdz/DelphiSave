unit unInvRptTenenciasCartera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Data.DB, SDEngine, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, ArtQReports;

type
  TfrmInvRptTenenciasCartera = class(TfrmCustomForm)
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
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMonto6(Sender: TObject; var Value: String);
    procedure FormatMontoSinPesos(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmInvRptTenenciasCartera: TfrmInvRptTenenciasCartera;

implementation

uses
  CustomDlgs, unArt, Strfuncs, unSesion, unVisualizador, DateTimeFuncs;

{$R *.dfm}

procedure TfrmInvRptTenenciasCartera.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraTipoInstrumento.IsEmpty, fraTipoInstrumento, 'Debe indicar el tipo de instrumento.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe indicar la fecha.');

  sSql := 'SELECT CODCAJAVALORES, DENOMINACION, RESIDUAL, COTIZACION, VALUACION_PEPS, ' +
                 'RESIDUAL * COTIZACION * MONEDA VALUACION_CIERRE, ' +
                 '(RESIDUAL * COTIZACION * MONEDA) - VALUACION_PEPS RXT, INTERES_DEVENGADO, ' +
                 '(RESIDUAL * COTIZACION * MONEDA) + INTERES_DEVENGADO VALUACION_CONTABLE ' +
            'FROM (SELECT IN_DESCRIPCION DENOMINACION, IN_CODCAJAVALORES CODCAJAVALORES, ' +
                         'ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, :Fecha) RESIDUAL, ' +
                         'NVL(ART.INVERSION.GET_COTIZACIONINSTRUMENTO(IN_ID, :Fecha), 1) COTIZACION, ' +
                         'NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONEDA, :Fecha), 1) MONEDA, ' +
                         'ART.INVERSION.GET_RDOXTENENCIA(IN_ID, :Fecha, ''V'') VALUACION_PEPS, ' +
                         'NVL(ART.INVERSION.GET_INTERESDEVENGADO(IN_ID, :Fecha), 0) INTERES_DEVENGADO, TI_ID, IN_ID ' +
                    'FROM NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO ' +
                   'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
                     'AND TI_PLAZOFIJO = ''N'' ' +
                     'AND IN_FECHABAJA IS NULL) ' +
           'WHERE TI_ID = :Tipo ' +
             'AND RESIDUAL > 0';

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

      ReportTitle             := 'Tenencias de Cartera';
      qrlParam1.Caption       := fraTipoInstrumento.Descripcion;
      qrlParam2.Caption       := 'LISTADO DE TENENCIAS AL: ' + DateToStr(edFecha.Date);
      qrlUsuImpresion.Caption := Sesion.Usuario;

      Visualizar(qr, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    end;
end;

procedure TfrmInvRptTenenciasCartera.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TfrmInvRptTenenciasCartera.FormatMonto6(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$', 6);
end;

procedure TfrmInvRptTenenciasCartera.FormatMontoSinPesos(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '');
end;

procedure TfrmInvRptTenenciasCartera.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoInstrumento do
    begin
      TableName      := 'NTI_TIPOINSTRUMENTO';
      FieldID        := 'TI_ID';
      FieldCodigo    := 'TI_ID';
      FieldDesc      := 'TI_DESCRIPCION';
      FieldBaja      := 'TI_FECHABAJA';
      ExtraCondition := 'AND TI_PLAZOFIJO  = ''N''';
      ShowBajas      := True;
    end;
end;

end.

