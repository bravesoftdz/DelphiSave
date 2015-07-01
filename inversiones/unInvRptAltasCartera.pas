unit unInvRptAltasCartera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Data.DB, SDEngine, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, ArtQReports;

type
  TfrmInvRptAltasCartera = class(TfrmCustomForm)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbFecha: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
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
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    qrlUsuImpresion: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
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
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMonto6(Sender: TObject; var Value: String);
    procedure FormatMontoSinPesos(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmInvRptAltasCartera: TfrmInvRptAltasCartera;

implementation

uses
  CustomDlgs, unArt, Strfuncs, unSesion, unVisualizador;

{$R *.dfm}

procedure TfrmInvRptAltasCartera.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraTipoInstrumento.IsEmpty, fraTipoInstrumento, 'Debe indicar el tipo de instrumento.');
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe indicar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha hasta.');

  sSql := 'SELECT OI_FECHA FECHA, TO_DESCRIPCION OPERACION, OI_FECHACUSTODIA LIQUIDA, IN_CODCAJAVALORES COD_CAJA_VALORES, ' +
                 'IN_DESCRIPCION DENOMINACION, OI_IMPORTENOMINAL V_NOMINAL, OI_PRECIO PRECIO, OI_MONTO MONTO ' +
            'FROM NOI_OPERACIONINSTRUMENTO, NIN_INSTRUMENTO, NTO_TIPOOPERACION ' +
           'WHERE IN_ID = OI_IDINSTRUMENTO ' +
             'AND TO_ID = OI_IDTIPOOPERACION ' +
             'AND TO_SIGNO = 1 ' +
             'AND OI_FECHABAJA IS NULL ' +
             'AND IN_FECHABAJA IS NULL ' +
             'AND IN_IDTIPOINSTRUMENTO = :Tipo ' +
             'AND OI_FECHA BETWEEN :Desde AND :Hasta ' +
           'ORDER BY FECHA';

  with sdqReporte do
    begin
      Sql.Text := sSql;
      ParamByName('Tipo').AsInteger   := fraTipoInstrumento.Value;
      ParamByName('Desde').AsDateTime := edFechaDesde.Date;
      ParamByName('Hasta').AsDateTime := edFechaHasta.Date;
      Open;

      Verificar(IsEmpty, nil, 'No se han encontrado datos.');
    end;

  with qr do
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);

      ReportTitle             := 'Altas de Cartera';
      qrlParam1.Caption       := fraTipoInstrumento.Descripcion;
      qrlParam2.Caption       := 'LISTADO DE ALTAS DESDE: ' + DateToStr(edFechaDesde.Date) + ' HASTA: ' + DateToStr(edFechaHasta.Date);
      qrlUsuImpresion.Caption := Sesion.Usuario;

      Visualizar(qr, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    end;
end;

procedure TfrmInvRptAltasCartera.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TfrmInvRptAltasCartera.FormatMonto6(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$', 6);
end;

procedure TfrmInvRptAltasCartera.FormatMontoSinPesos(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '');
end;

procedure TfrmInvRptAltasCartera.FormCreate(Sender: TObject);
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

