unit unRptBajasPotenciales;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, unVisualizador, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,
  Db, SDEngine, unART;

const
  IDReport: TTableID = 1;

type
  TqrBajasPotenciales = class(TQuickRep)
    sdqDatos: TSDQuery;
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrbDetail: TQRBand;
    qriLogoART: TQRImage;
    qrlFecha: TQRLabel;
    qrbPageFooter: TQRBand;
    qrmDatosART: TQRMemo;
    qriLogoGBP: TQRImage;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrsTitulo: TQRSysData;
    ChildBand1: TQRChildBand;
    qrContrato: TQRLabel;
    QRLabel8: TQRLabel;
    sdqHeader: TSDQuery;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRLabel7: TQRLabel;
    qrlFechaBaja: TQRLabel;
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    function GetContrato: Integer;

    procedure SetContrato(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;

    function Ejecutar(aContrato: Integer; aUsuario, aPeriodo, aCuil: String; aFechaBaja, aFechaIngreso: TDateTime): TResultados;
    
    property Contrato: Integer read GetContrato write SetContrato;
  end;

var
  qrBajasPotenciales: TqrBajasPotenciales;

implementation

uses
  unDmPrincipal, unSesion, DateTimeFuncs, General;

{$R *.DFM}

constructor TqrBajasPotenciales.Create(AOwner: TComponent);
begin
  inherited;
  Self.IDReport := IDReport;
  qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  qriLogoGBP.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GBP');
end;

function TqrBajasPotenciales.Ejecutar(aContrato: Integer; aUsuario, aPeriodo, aCuil: String; aFechaBaja,
                                      aFechaIngreso: TDateTime): TResultados;
begin
  with sdqDatos do
  begin
    ParamByName('contrato').AsInteger  := aContrato;
    ParamByName('cuil').AsString       := aCuil;
    ParamByName('fecha').AsDate        := aFechaBaja;
    ParamByName('fechaingreso').AsDate := aFechaIngreso;
    ParamByName('usuario').AsString    := aUsuario;
    ParamByName('valido').AsString     := 'S';

    OpenQuery(sdqDatos);
  end;

  with sdqHeader do
  begin
    ParamByName('contrato').AsInteger := aContrato;
    OpenQuery(sdqHeader);
  end;

  Contrato := aContrato;
  qrlPeriodo.Caption := aPeriodo;
  qrlFechaBaja.Caption := DateToStr(aFechaBaja);
  Result := Visualizar(Self, GetValores(' - Contrato ' + IntToStr(aContrato), Sesion.UserMail), [oAlwaysShowDialog, oForceDB]);
end;

function TqrBajasPotenciales.GetContrato: Integer;
begin
  Result := StrToInt(IIF(qrContrato.Caption = '', '0', qrContrato.Caption));
end;

procedure TqrBajasPotenciales.qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sSql: String;
begin
  sSql :=
    'SELECT INITCAP(DECODE(el_nombre, ''CAPITAL'', ''BUENOS AIRES'', el_nombre))' +
     ' FROM del_delegacion' +
    ' WHERE el_id = :id';
  qrlFecha.Caption := ValorSqlEx(sSql, [Sesion.Delegacion], 'Buenos Aires') + ', ' + Get_FechaFormatoLargo(DBDate);
end;

procedure TqrBajasPotenciales.SetContrato(const Value: Integer);
begin
  qrContrato.Caption := IntToStr(Value);
end;

end.
