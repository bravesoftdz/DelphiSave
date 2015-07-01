unit unConsultaChequesSituacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, StdCtrls, Mask, ToolEdit,
  DateComboBox, DB, SDEngine, ExtCtrls, QuickRpt, QRCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraCtbTablas, DBCtrls,
  ArtComboBox, RxToolEdit, RxPlacemnt;

type
  TfrmConsultaChequesSituacion = class(TfrmCustomForm)
    grpFechaSituacion: TGroupBox;
    Label1: TLabel;
    edFechaSituacionDesde: TDateComboBox;
    edFechaSituacionHasta: TDateComboBox;
    grpSituacion: TGroupBox;
    btnAceptar: TButton;
    btnCancela: TButton;
    rptChequeSit: TQuickRep;
    sdqDatos: TSDQuery;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrsLineaFirma: TQRShape;
    qrlUsuario: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qriLogo: TQRImage;
    fraSituacion: TfraCtbTablas;
    qrlSituacion: TQRLabel;
    grpMetodoPago: TGroupBox;
    sdqMetodoPagoFiltro: TSDQuery;
    dsMetodoPagoFiltro: TDataSource;
    cmbMetodoPago: TArtComboBox;
    grpEstado: TGroupBox;
    cmbEstados: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

var
  frmConsultaChequesSituacion: TfrmConsultaChequesSituacion;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, StrFuncs, CustomDlgs, unSesion, unVisualizador;

procedure TfrmConsultaChequesSituacion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraSituacion do
    begin
      Clave     := 'SITCH';
      ShowBajas := False;
    end;

  OpenQuery(sdqMetodoPagoFiltro);
end;

procedure TfrmConsultaChequesSituacion.btnAceptarClick(Sender: TObject);
var
  sSql, sWhere, sOrderBy: String;
begin
  Verificar(IsEmptyString(cmbMetodoPago.Text), cmbMetodoPago, 'Debe indicar el método de pago.');
  Verificar(fraSituacion.IsEmpty, fraSituacion, 'Debe indicar la situación.');

  sSql := 'SELECT CE_BENEFICIARIO, CE_NUMERO, CE_ORDENPAGO, CE_MONTO, CE_GRUPOPAGO, CE_OBSERVACIONES ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE 1 = 1';

  sWhere := SqlBetween(' AND CE_FECHASITUACION', edFechaSituacionDesde.Date, edFechaSituacionHasta.Date);
  sWhere := sWhere + ' AND CE_SITUACION = ' + SqlValue(fraSituacion.Value);
  sWhere := sWhere + ' AND CE_METODOPAGO = ' + SqlValue(cmbMetodoPago.Text);

  if cmbEstados.Text <> '' then
     sWhere := sWhere + ' AND CE_ESTADO ' +  cmbEstados.InSql;

  sOrderBy := ' ORDER BY 1';

  OpenQuery(sdqDatos, sSql + sWhere + sOrderBy);
  if sdqDatos.Eof then
    MsgBox('No se han encontrado datos.', MB_ICONINFORMATION)
  else
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrlUsuario.Caption   := Sesion.Usuario;
      qrlSituacion.Caption := fraSituacion.Descripcion;
      
      Visualizar(rptChequeSit, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
    end;
end;

procedure TfrmConsultaChequesSituacion.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

