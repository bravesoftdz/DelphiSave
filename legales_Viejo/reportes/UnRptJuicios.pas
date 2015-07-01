unit UnRptJuicios;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase, unSesion, unConstLegales;

type
  TRptJuicios = class(TQuickRep)
    sdqRptJuicio: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrbdetalle: TQRBand;
    fbFooterPage: TQRBand;
    qrlLiquidadoPor: TQRLabel;
    qrlFecha: TQRLabel;
    qrbFooter: TQRBand;
    qrdbTipoBeneficiario: TQRDBText;
    qrdbBeneficiario: TQRDBText;
    sdqRptJuicioMEDIACIONJUICIO: TStringField;
    sdqRptJuicioCARATULA: TStringField;
    sdqRptJuicioJT_NUMEROCARPETA: TFloatField;
    sdqRptJuicioJURISDICCION: TStringField;
    sdqRptJuicioFUERO: TStringField;
    sdqRptJuicioJUZGADO: TStringField;
    sdqRptJuicioINSTANCIA: TStringField;
    sdqRptJuicioSECRETARIA: TStringField;
    sdqRptJuicioJT_ID: TFloatField;
    sdqRptJuicioJT_IMPORTERESERVA: TFloatField;
    sdqRptJuicioJT_IMPORTERESERVAHONORARIOS: TFloatField;
    sdqRptJuicioJT_EXPEDIENTE: TStringField;
    sdqRptJuicioJT_FECHAFINJUICIO: TDateTimeField;
    sdqRptJuicioJT_FECHANOTIFICACIONJUICIO: TDateTimeField;
    sdqRptJuicioJT_IMPORTEDEMANDADO: TFloatField;
    sdqRptJuicioJT_FECHAINGRESO: TDateTimeField;
    sdqRptJuicioABOGADO: TStringField;
    sdqRptJuicioESTADO: TStringField;
    sdqRptJuicioRECLAMO: TStringField;
    sdqRptJuicioReclamoIncapacidad: TStringField;
    QRGroup: TQRGroup;
    qrdbNroJuicio: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    sdqRptJuicioCONTRATO: TFloatField;
    sdqRptJuicioNOMBREEMPRESA: TStringField;
    sdqRptJuicioCUIT: TStringField;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    sdqRptJuicioSJ_SINIESTRO: TStringField;
    sdqRptJuicioEJ_NOMBREESTUDIO: TStringField;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure qrlLiquidadoPorPrint(sender: TObject; var Value: String);
    procedure qrlFechaPrint(sender: TObject; var Value: String);
    procedure qrdbTipoBeneficiarioPrint(sender: TObject;
      var Value: String);
  private
    FNivelUsuario: integer;
  public
    procedure VistaPrevia(sWhere: string; NivelUsuario : Integer);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, Dialogs;

{$R *.DFM}
procedure TRptJuicios.VistaPrevia(sWhere: string; NivelUsuario : Integer);
begin
  try
    FNivelUsuario := NivelUsuario;
    sdqRptJuicio.SQL.Add(sWhere);
    sdqRptJuicio.SQL.Add(' ORDER BY jt_numerocarpeta ASC ');
    sdqRptJuicio.ParamByName('usuario').AsString := Sesion.LoginName;
    sdqRptJuicio.Open;
    self.PreviewModal;
  finally
    sdqRptJuicio.Close;
  end;
end;

procedure TRptJuicios.QRDBText1Print(sender: TObject; var Value: String);
begin
  if FNivelUsuario = NIVELNORMAL then
    Value := '*******';
end;

procedure TRptJuicios.QRDBText3Print(sender: TObject; var Value: String);
begin
  if FNivelUsuario = NIVELNORMAL then
    Value := '*******';
end;

procedure TRptJuicios.qrlLiquidadoPorPrint(sender: TObject;
  var Value: String);
begin
  Value := Value + Sesion.LoginName;;
end;

procedure TRptJuicios.qrlFechaPrint(sender: TObject; var Value: String);
begin
  Value := Value + FormatDateTime('dd/mm/yyyy hh:nn', now);
end;

procedure TRptJuicios.qrdbTipoBeneficiarioPrint(sender: TObject;
  var Value: String);
begin
  if trim(Value) = '//' then Value := '';
end;

end.
