unit unListLiquidacionHonorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, ExtCtrls,
  Mask, ToolEdit, DateComboBox, QuickRpt, DB, SDEngine, QRCtrls, unArt;

type
  TfrmListLiquidacionHonorarios = class(TfrmCustomForm)
    rgTipoImpresion: TRadioGroup;
    btnAceptar: TButton;
    btnCancelar: TButton;
    gbFechaLiq: TGroupBox;
    Label7: TLabel;
    Label5: TLabel;
    ed_FLiqDesde: TDateComboBox;
    ed_FLiqHasta: TDateComboBox;
    qrptListLiquidacionHonorarios: TQuickRep;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel148: TQRLabel;
    qrdbNroLiq: TQRDBText;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel25: TQRLabel;
    QRBand19: TQRBand;
    QRExpr21: TQRExpr;
    qrlblUsuario: TQRLabel;
    QRLabel167: TQRLabel;
    QRExpr22: TQRExpr;
    sdqBody: TSDQuery;
    QRLabel1: TQRLabel;
    sdqHeader: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    sdqTotales: TSDQuery;
    qrlTotHonorario: TQRLabel;
    QRLabel5: TQRLabel;
    qrlTotIVA: TQRLabel;
    QRLabel6: TQRLabel;
    qrlTotFactura: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qriLogo: TQRImage;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel2: TQRLabel;
    ChildBand2: TQRChildBand;
    qrdbNomEst: TQRDBText;
    qrdbCodEst: TQRDBText;
    qrdbFLiqDesde: TQRDBText;
    qrdbFLiqHasta: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    procedure rgTipoImpresionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
    FIdLiq: TTableId;
    procedure Preparar(NroLiq: TTableID);
    function Validar: Boolean;
  public
    property IdLiq: TTableId      read FIdLiq        write FIdLiq;
  end;

var
  frmListLiquidacionHonorarios: TfrmListLiquidacionHonorarios;

implementation

uses
  VCLExtra, AnsiSql, unDmPrincipal, CustomDlgs, unSesion, Strfuncs, unVisualizador;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmListLiquidacionHonorarios.rgTipoImpresionClick(Sender: TObject);
var
  bLiqActual: Boolean;
begin
   bLiqActual := (rgTipoImpresion.ItemIndex = 0);

   VCLExtra.LockControls([ed_FLiqDesde, ed_FLiqHasta], bLiqActual);

   if bLiqActual then
     begin
       ed_FLiqDesde.Clear;
       ed_FLiqHasta.Clear;
     end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiquidacionHonorarios.FormCreate(Sender: TObject);
begin
  inherited;

  rgTipoImpresionClick(nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiquidacionHonorarios.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if Validar then
    begin
      case rgTipoImpresion.ItemIndex of
        0: Preparar(IdLiq);

        1: begin
             sSql := 'SELECT LH_ID ID ' +
                       'FROM LLH_LIQUIDACIONHONORARIO ' +
                      'WHERE LH_FECHA BETWEEN ' + SqlValue(ed_FLiqDesde.Date) + ' AND ' + SqlValue(ed_FLiqHasta.Date) + ' ' +
                   'ORDER BY LH_ID';

             with GetQuery(sSql) do
               try
                 if IsEmpty then
                   InfoHint(rgTipoImpresion, 'No se encontraron liquidaciones para el rango de fechas seleccionado.');
                   
                 while not Eof do
                   begin
                     Preparar(FieldByName('ID').AsInteger);

                     Next;
                   end;
               finally
                 Free;
               end;
           end;
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiquidacionHonorarios.Preparar(NroLiq: TTableID);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );
  qrlblUsuario.Caption := Sesion.Usuario;

  // Cargo header liquidación
  sdqHeader.ParamByName('Id').AsInteger := NroLiq;
  OpenQuery(sdqHeader);

  //Cargo el SQL a ejecutar
  sdqBody.ParamByName('Id').AsInteger := NroLiq;
  OpenQuery(sdqBody);

  //Cargo los totales
  sdqTotales.ParamByName('Id').AsInteger := NroLiq;
  OpenQuery(sdqTotales);
  qrlTotHonorario.Caption := sdqTotales.FieldByName('TOTAL_HONORARIO').AsString;
  qrlTotIVA.Caption       := sdqTotales.FieldByName('TOTAL_IVA').AsString;
  qrlTotFactura.Caption   := sdqTotales.FieldByName('TOTAL_FACTURA').AsString;

  qrptListLiquidacionHonorarios.ReportTitle := 'Liquidación ';
  Visualizar(qrptListLiquidacionHonorarios, GetValores(IntToStr(NroLiq), sdqHeader.FieldByName('DIRELECTRONICA').AsString), [oForceDB, oForceShowModal, oAlwaysShowDialog], True, '', '', True);
  Application.ProcessMessages;
end;
{-------------------------------------------------------------------------------}
function TfrmListLiquidacionHonorarios.Validar: Boolean;
begin
  case rgTipoImpresion.ItemIndex of
    0: Verificar(IdLiq = ART_EMPTY_ID, nil, 'No ha seleccionado ninguna liquidación.');

    1: begin
         Verificar(ed_FLiqDesde.IsEmpty, ed_FLiqDesde, 'La fecha de liquidación desde es obligatoria.');
         Verificar(ed_FLiqHasta.IsEmpty, ed_FLiqHasta, 'La fecha de liquidación hasta es obligatoria.');
       end;
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiquidacionHonorarios.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{-------------------------------------------------------------------------------}
end.

