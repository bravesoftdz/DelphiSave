unit unRptMinutaReunion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, undmPrincipal, unSesion;

type
  TfrmRptMinutaReunion = class(TForm)
    qrpHoja1: TQuickRep;
    qrpHoja2: TQuickRep;
    qrpHoja3: TQuickRep;
    PageHeaderBand1: TQRBand;
    imgLogo1: TQRImage;
    TitleBand1: TQRBand;
    QRShape28: TQRShape;
    QRLabel9: TQRLabel;
    QRShape27: TQRShape;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlContrato: TQRLabel;
    qrlCuit: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrMemoDomicilioProvincia: TQRMemo;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrlLugar: TQRLabel;
    qrlFechaMinuta: TQRLabel;
    qrlHora: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape16: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel7: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel8: TQRLabel;
    qrMemoTemasTratados: TQRMemo;
    qrMemoDocumentacionEntregada: TQRMemo;
    QRBand1: TQRBand;
    imgLogo2: TQRImage;
    QRBand2: TQRBand;
    QRShape36: TQRShape;
    QRLabel31: TQRLabel;
    QRShape37: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel43: TQRLabel;
    QRMemo2: TQRMemo;
    qrlDocEntregada: TQRMemo;
    QRBand3: TQRBand;
    imgLogo3: TQRImage;
    QRBand4: TQRBand;
    QRShape38: TQRShape;
    QRMemo1: TQRMemo;
    QRShape43: TQRShape;
    QRLabel34: TQRLabel;
    QRShape44: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRCompositeReport: TQRCompositeReport;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlContactoNro1: TQRLabel;
    qrlContactoNro6: TQRLabel;
    qrlContactoNro7: TQRLabel;
    qrlContactoNro8: TQRLabel;
    qrlContactoNro5: TQRLabel;
    qrlContactoNro3: TQRLabel;
    qrlContactoNro4: TQRLabel;
    qrlContactoNro2: TQRLabel;
    qrlContacto1: TQRLabel;
    qrlContacto3: TQRLabel;
    qrlContacto4: TQRLabel;
    qrlContacto5: TQRLabel;
    qrlContacto6: TQRLabel;
    qrlContacto7: TQRLabel;
    qrlContacto8: TQRLabel;
    qrlContacto2: TQRLabel;
    qrlUsuarioNro1: TQRLabel;
    qrlUsuario1: TQRLabel;
    qrlUsuarioNro2: TQRLabel;
    qrlUsuario2: TQRLabel;
    qrlUsuarioNro3: TQRLabel;
    qrlUsuario3: TQRLabel;
    qrlUsuarioNro4: TQRLabel;
    qrlUsuario4: TQRLabel;
    qrlUsuarioNro5: TQRLabel;
    qrlUsuario5: TQRLabel;
    qrlUsuarioNro6: TQRLabel;
    qrlUsuario6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    procedure QRCompositeReportAddReports(Sender: TObject);
  private
    procedure CargarContactos(aContactos: String);
    procedure CargarUsuarios(aIdMinuta: integer);
    procedure CargarTemasTratados(aIdMinuta: integer);
    procedure CargarDocumentacionEntregada(aIdMinuta: integer);
  public
    procedure Imprimir(aIdMinuta: integer);
  end;

var
  frmRptMinutaReunion: TfrmRptMinutaReunion;

implementation

uses DB;

{$R *.dfm}

procedure TfrmRptMinutaReunion.QRCompositeReportAddReports(Sender: TObject);
begin
  QRCompositeReport.Reports.Add(qrpHoja1);
  QRCompositeReport.Reports.Add(qrpHoja2);
  QRCompositeReport.Reports.Add(qrpHoja3);
end;

procedure TfrmRptMinutaReunion.Imprimir(aIdMinuta: integer);
begin
  imgLogo1.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  imgLogo2.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  imgLogo3.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  qrMemoDomicilioProvincia.Lines.Text := StringReplace(qrMemoDomicilioProvincia.Lines.Text, '<SECTOR>', Sesion.SectorDesc, [rfReplaceAll, rfIgnoreCase]);

  with GetQueryEx(' SELECT MR_CONTRATO, EM_CUIT, EM_NOMBRE, MR_FECHAREUNION, MR_LUGAR, MR_CONTACTOS ' +
                  ' FROM EMI.IMR_MINUTAREUNION, AFI.ACO_CONTRATO, AFI.AEM_EMPRESA ' +
                  ' WHERE CO_CONTRATO = MR_CONTRATO AND EM_ID = CO_IDEMPRESA AND MR_ID = :ID', [aIdMinuta]) do
  try
    qrlFecha.Caption := qrlFecha.Caption + ' ' + FormatDateTime('dd "de" mmmm	"del" yyyy', DBDateTime);
    qrlEmpresa.Caption := qrlEmpresa.Caption + ' ' + FieldByName('EM_NOMBRE').AsString;
    qrlContrato.Caption := qrlContrato.Caption + ' ' + FieldByName('MR_CONTRATO').AsString;
    qrlCuit.Caption := qrlCuit.Caption + ' ' + FieldByName('EM_CUIT').AsString;
    qrlFechaMinuta.Caption := FormatDateTime('dd "de" mmmm	"del" yyyy', FieldByName('MR_FECHAREUNION').AsDateTime);
    qrlLugar.Caption := FieldByName('MR_LUGAR').AsString;
    qrlHora.Caption := FormatDateTime('HH:nn', FieldByName('MR_FECHAREUNION').AsDateTime);
    CargarContactos(FieldByName('MR_CONTACTOS').AsString);
  finally
    free;
  end;
  CargarUsuarios(aIdMinuta);
  CargarTemasTratados(aIdMinuta);
  CargarDocumentacionEntregada(aIdMinuta);
  QRCompositeReport.Print;
end;

procedure TfrmRptMinutaReunion.CargarContactos(aContactos: String);
begin
  qrMemoTemasTratados.Lines.Text := aContactos;
  qrlContactoNro1.Enabled := (qrMemoTemasTratados.Lines.Count > 0);
  qrlContactoNro2.Enabled := (qrMemoTemasTratados.Lines.Count > 1);
  qrlContactoNro3.Enabled := (qrMemoTemasTratados.Lines.Count > 2);
  qrlContactoNro4.Enabled := (qrMemoTemasTratados.Lines.Count > 3);
  qrlContactoNro5.Enabled := (qrMemoTemasTratados.Lines.Count > 4);
  qrlContactoNro6.Enabled := (qrMemoTemasTratados.Lines.Count > 5);
  qrlContactoNro7.Enabled := (qrMemoTemasTratados.Lines.Count > 6);
  qrlContactoNro8.Enabled := (qrMemoTemasTratados.Lines.Count > 7);

  qrlContacto1.Enabled := qrlContactoNro1.Enabled;
  if qrlContacto1.Enabled then
    qrlContacto1.Caption := qrMemoTemasTratados.Lines[0];

  qrlContacto2.Enabled := qrlContactoNro2.Enabled;
  if qrlContacto2.Enabled then
    qrlContacto2.Caption := qrMemoTemasTratados.Lines[1];

  qrlContacto3.Enabled := qrlContactoNro3.Enabled;
  if qrlContacto3.Enabled then
    qrlContacto3.Caption := qrMemoTemasTratados.Lines[2];

  qrlContacto4.Enabled := qrlContactoNro4.Enabled;
  if qrlContacto4.Enabled then
    qrlContacto4.Caption := qrMemoTemasTratados.Lines[3];

  qrlContacto5.Enabled := qrlContactoNro5.Enabled;
  if qrlContacto5.Enabled then
    qrlContacto5.Caption := qrMemoTemasTratados.Lines[4];

  qrlContacto6.Enabled := qrlContactoNro6.Enabled;
  if qrlContacto6.Enabled then
    qrlContacto6.Caption := qrMemoTemasTratados.Lines[5];

  qrlContacto7.Enabled := qrlContactoNro7.Enabled;
  if qrlContacto7.Enabled then
    qrlContacto7.Caption := qrMemoTemasTratados.Lines[6];

  qrlContacto8.Enabled := qrlContactoNro7.Enabled;
  if qrlContacto8.Enabled then
    qrlContacto8.Caption := qrMemoTemasTratados.Lines[7];
  qrMemoTemasTratados.Lines.Clear;
end;

procedure TfrmRptMinutaReunion.CargarUsuarios(aIdMinuta: integer);
var
  i: integer;
begin
  i:= 0;
  with GetQueryEx(' SELECT SE_NOMBRE ' +
                  ' FROM EMI.IMU_MINUTAUSUARIO, USE_USUARIOS ' +
                  ' WHERE MU_IDUSUARIO = SE_ID AND MU_IDMINUTAREUNION = :ID ' +
                  ' ORDER BY 1 ', [aIdMinuta]) do
  try
    while not Eof do
    begin
      Inc(i);

      qrlUsuarioNro1.Enabled := (i > 0);
      qrlUsuario1.Enabled := qrlUsuarioNro1.Enabled;
      if qrlUsuario1.Enabled and (i = 1) then
        qrlUsuario1.Caption := FieldByName('SE_NOMBRE').AsString;

      qrlUsuarioNro2.Enabled := (i > 1);
      qrlUsuario2.Enabled := qrlUsuarioNro2.Enabled;
      if qrlUsuario2.Enabled and (i = 2) then
        qrlUsuario2.Caption := FieldByName('SE_NOMBRE').AsString;

      qrlUsuarioNro3.Enabled := (i > 2);
      qrlUsuario3.Enabled := qrlUsuarioNro3.Enabled;
      if qrlUsuario3.Enabled and (i = 3) then
        qrlUsuario3.Caption := FieldByName('SE_NOMBRE').AsString;

      qrlUsuarioNro4.Enabled := (i > 3);
      qrlUsuario4.Enabled := qrlUsuarioNro4.Enabled;
      if qrlUsuario4.Enabled and (i = 4) then
        qrlUsuario4.Caption := FieldByName('SE_NOMBRE').AsString;

      qrlUsuarioNro5.Enabled := (i > 4);
      qrlUsuario5.Enabled := qrlUsuarioNro5.Enabled;
      if qrlUsuario5.Enabled and (i = 5) then
        qrlUsuario5.Caption := FieldByName('SE_NOMBRE').AsString;

      qrlUsuarioNro6.Enabled := (i > 5);
      qrlUsuario6.Enabled := qrlUsuarioNro6.Enabled;
      if qrlUsuario6.Enabled and (i = 6) then
        qrlUsuario6.Caption := FieldByName('SE_NOMBRE').AsString;

      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmRptMinutaReunion.CargarTemasTratados(aIdMinuta: integer);
begin
  with GetQueryEx(' SELECT TT_DESCRIPCION ' +
                  ' FROM EMI.ITT_TEMASTRATADOS, EMI.IMT_MINUTATEMASTRATADOS ' +
                  ' WHERE TT_ID = MT_IDTEMATRATADO AND MT_IDMINUTAREUNION = :ID ' +
                  ' ORDER BY 1 ', [aIdMinuta]) do
  try
    while not Eof do
    begin
      qrMemoTemasTratados.Lines.Add(FieldByName('TT_DESCRIPCION').AsString);
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmRptMinutaReunion.CargarDocumentacionEntregada(
  aIdMinuta: integer);
begin
  with GetQueryEx(' SELECT DE_DESCRIPCION ' +
                  ' FROM EMI.IDE_DOCUMENTACIONENTREGADA, EMI.IMD_MINUTADOCUMENTACIONENT ' +
                  ' WHERE DE_ID = MD_IDDOCUMENTACIONENT AND MD_IDMINUTAREUNION = :ID ' +
                  ' ORDER BY 1 ', [aIdMinuta]) do
  try
    while not Eof do
    begin
      qrlDocEntregada.Lines.Add(FieldByName('DE_DESCRIPCION').AsString);
      Next;
    end;
  finally
    free;
  end;

end;

end.
