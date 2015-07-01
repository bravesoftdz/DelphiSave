unit unqrInvInstrumentoAnalisis;

interface                      

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, unArt, DB, SDEngine;

type
  TqrInvInstrumentoAnalisis = class(TQuickRep)
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    sdqDatos: TSDQuery;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape3: TQRShape;
    procedure FormatMonto0Dec(Sender: TObject; var Value: String);
    procedure FormatMonto2Dec(Sender: TObject; var Value: String);
    procedure FormatMonto3Dec(Sender: TObject; var Value: String);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

procedure DoImprimirInstrumentoAnalisis(IdInstrAnalisis: TTableID);

var
  qrInvInstrumentoAnalisis: TqrInvInstrumentoAnalisis;

implementation

uses
  StrFuncs, unDmPrincipal, ArchFuncs, unVisualizador, CustomDlgs;

{$R *.DFM}

procedure DoImprimirInstrumentoAnalisis(IdInstrAnalisis: TTableID);
var
  rpt: TqrInvInstrumentoAnalisis;
begin
  rpt := TqrInvInstrumentoAnalisis.Create(nil);
  with rpt do
    try
      sdqDatos.Close;
      sdqDatos.ParamByName('IdResultado').AsInteger := IdInstrAnalisis;
      sdqDatos.Open;

      if sdqDatos.IsEmpty then
        MsgBox('No se han encontrado datos.', MB_ICONERROR)
      else
        Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal], True, '', '', True);
    finally
      Free;
    end;
end;

constructor TqrInvInstrumentoAnalisis.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TqrInvInstrumentoAnalisis.FormatMonto0Dec(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '', 0);
end;

procedure TqrInvInstrumentoAnalisis.FormatMonto2Dec(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TqrInvInstrumentoAnalisis.FormatMonto3Dec(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 3);
end;

end.


