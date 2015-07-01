unit unListLiqDocUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, DateComboBox, QuickRpt, ExtCtrls, QRCtrls, DB, SDEngine;

type
  TfrmListLiqDocUsuario = class(TfrmCustomForm)
    qrLiqDocUsuario: TQuickRep;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrFechaHOY: TQRSysData;
    pfFooterPagina: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    qrImpresoPor: TQRLabel;
    qrhUsuAlta: TQRGroup;
    QRDBText15: TQRDBText;
    sdqLiqDoc: TSDQuery;
    qrhFProceso: TQRGroup;
    qrlSubTitulo: TQRLabel;
    qrbTitle: TQRBand;
    qrfUsuAlta: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrfFProceso: TQRBand;
    QRShape1: TQRShape;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    procedure qrImpresoPorPrint(sender: TObject; var Value: String);
    procedure Informe_LiqDocUsuario(FechaLiqDesde, FechaLiqHasta: TDateTime; Usuario: String);
  private

  public
  end;

var
  frmListLiqDocUsuario: TfrmListLiqDocUsuario;

implementation

uses
  unDmPrincipal, CustomDlgs, General, AnsiSql, unVisualizador, Strfuncs, unSesion;

{$R *.dfm}


procedure TfrmListLiqDocUsuario.Informe_LiqDocUsuario(FechaLiqDesde, FechaLiqHasta: TDateTime; Usuario: String);
begin
  qrlSubTitulo.Caption := DateToStr(FechaLiqDesde) + ' al ' + DateToStr(FechaLiqHasta);

  with sdqLiqDoc do
  begin
    Close;
    ParamByName('FDESDE').AsDateTime := FechaLiqDesde;
    ParamByName('FHASTA').AsDateTime := FechaLiqHasta;
    if Usuario <> '' then
      ParamByName('USU').AsString := Usuario;
    Open;
  end;

  Visualizar(qrLiqDocUsuario, GetValores(''), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

procedure TfrmListLiqDocUsuario.qrImpresoPorPrint(sender: TObject; var Value: String);
begin
  Value := 'Impreso por ' + Sesion.Usuario;
end;


end.
