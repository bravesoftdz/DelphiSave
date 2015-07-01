unit UnRepManPrestador;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptManPrestador = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData4: TQRSysData;
    lblUsuariolabel: TQRLabel;
    lblUsuario: TQRLabel;
    sdqRepManPrestador: TSDQuery;
    dsManPrestador: TDataSource;
    QRShape2: TQRShape;
    qrlTitulo: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand2: TQRBand;
    qriLogo: TQRImage;
    QRLabel25: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel26: TQRLabel;
    qrlSINOFactura: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrlSINOIngBrut: TQRLabel;
    QRLabel29: TQRLabel;
    qrlIngBrutOCuit: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    qrlSINORetCajaMed: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel39: TQRLabel;
    qrlSINOContrato: TQRLabel;
    QRShape3: TQRShape;
    qrlTituloDMedicos: TQRLabel;
    qrlIntCron: TQRLabel;
    qrlSINOIntCron: TQRLabel;
    qrlResonancia: TQRLabel;
    qrlSINOResonancia: TQRLabel;
    qrlTAC: TQRLabel;
    qrlSINOTAC: TQRLabel;
    qrlElectrom: TQRLabel;
    qrlSINOElectrom: TQRLabel;
    qrlCamas: TQRLabel;
    qrShapeSup: TQRShape;
    qrShapeIzq: TQRShape;
    qrShapeInf: TQRShape;
    qrShapeDer: TQRShape;
    qrlUCO: TQRLabel;
    qrdbUCO: TQRDBText;
    qrlTerInt: TQRLabel;
    qrdbCTI: TQRDBText;
    qrlQuirofanos: TQRLabel;
    qrdbQuirofanos: TQRDBText;
    qrlRayos: TQRLabel;
    qrdbAuti: TQRDBText;
    qrlAuti: TQRLabel;
    qrlGuardia: TQRLabel;
    qrdbGuardia: TQRDBText;
    qrdbRayos: TQRDBText;
    qrlPiso: TQRLabel;
    qrdbPiso: TQRDBText;
    qrlConex: TQRLabel;
    qrdbConex: TQRDBText;
    qrlEspecialidades: TQRLabel;
    QRBand3: TQRBand;
    qrlCodigo: TQRLabel;
    qrlEspecialidad: TQRLabel;
    qrlObservaciones: TQRLabel;
    qrlFBaja: TQRLabel;
    QRBand5: TQRBand;
    qrdbCodigo: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    qrlDatoIngBrutOCuit: TQRLabel;
    qrlAmbulancia: TQRLabel;
    qrlSINOAmbulancia: TQRLabel;
    sdqEspecialidades: TSDQuery;
    dsEspecialidades: TDataSource;
    qrlCaracter: TQRLabel;
    qrlTipoPrestador: TQRLabel;
    qrlTipoComprobante: TQRLabel;
    qrlConcepto: TQRLabel;
    qrlIVA: TQRLabel;
    qrlGanancias: TQRLabel;
    qrlMatricula: TQRLabel;
    qrdbMatricula: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText16: TQRDBText;
    qrlRX: TQRLabel;
    qrlSINORX: TQRLabel;
    qrlFKT: TQRLabel;
    qrlSINOFKT: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
     Function AsignarSiONo(ValorCampo: string):String;
  public
     Procedure ShowPreview(Identif: Integer; TipoPrest, Caracter, TipoPrestDesc, TipoComprobante,
                                             Concepto, Ganacias, IVA :string);
  end;

var
  rptManPrestador: TrptManPrestador;

implementation

uses
  unPrincipal, {$IFDEF RED_PRES}unManPrestador, {$ENDIF}unDmPrincipal, AnsiSql,
  unVisualizador;


{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
// Asigna Si o No en el label correspondiente, según sea el ValorCampo 'S' o 'N'
function TrptManPrestador.AsignarSiONo(ValorCampo: string):String;
begin
  if ValorCampo = 'S' then
     Result := 'Sí'
  else If ValorCampo = 'N' then
     Result := 'No'
  else
     Result := ' ';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptManPrestador.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  {$IFDEF RED_PRES}
  qriLogo.Picture.Assign(frmPrincipal.imgLogo.Picture);
  {$ELSE}
  qriLogo.Stretch := False;
  qriLogo.AutoSize := True;
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  qriLogo.Left := 550;
  {$ENDIF}
  lblUsuario.Caption := frmPrincipal.DBLogin.Usuario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptManPrestador.ShowPreview(Identif: Integer; TipoPrest, Caracter, TipoPrestDesc, TipoComprobante,
                                                         Concepto, Ganacias, IVA :string);
var
  bDatosM :Boolean;
begin
   sdqRepManPrestador.Close;
   sdqRepManPrestador.ParamByName('pidentif').AsInteger := Identif;
   sdqRepManPrestador.Open;

   sdqEspecialidades.Close;
   sdqEspecialidades.ParamByName('pidentif').AsInteger := Identif;
   sdqEspecialidades.Open;

   with sdqRepManPrestador do
   begin
      qrlSINOFactura.Caption    := AsignarSiONo(FieldByName('CA_CONCERTADO').AsString);
      qrlSINOIngBrut.Caption    := AsignarSiONo(FieldByName('CA_RETIENEINGBRUTOS').AsString);
      qrlSINORetCajaMed.Caption := AsignarSiONo(FieldByName('CA_RETENCAJAMED').AsString);
      If qrlSINORetCajaMed.Caption = 'Sí' Then qrlMatricula.Caption := 'Nro.Matrícula'
      else qrlMatricula.Caption := '';
      qrlSINOContrato.Caption   := AsignarSiONo(FieldByName('CA_CONTRATO').AsString);
      qrlSINOIntCron.Caption    := AsignarSiONo(FieldByName('CA_CRONICO').AsString);
      qrlSINOResonancia.Caption := AsignarSiONo(FieldByName('CA_RMN').AsString);
      qrlSINOTAC.Caption        := AsignarSiONo(FieldByName('CA_TAC').AsString);
      qrlSINOElectrom.Caption   := AsignarSiONo(FieldByName('CA_EMG').AsString);
      qrlSINOAmbulancia.Caption := AsignarSiONo(FieldByName('CA_AMBULANCIA').AsString);
      qrlSINORX.Caption         := AsignarSiONo(FieldByName('CA_RX').AsString);
      qrlSINOFKT.Caption        := AsignarSiONo(FieldByName('CA_FKT').AsString);
   end;

   qrlCaracter.Caption       := Caracter;
   qrlTipoPrestador.Caption  := TipoPrestDesc;
   qrlTipoComprobante.Caption:= TipoComprobante;
   qrlConcepto.Caption       := Concepto;
   qrlGanancias.Caption      := Ganacias;
   qrlIVA.Caption            := IVA;

   if sdqRepManPrestador.fieldByName('CA_RETINGRESOSBRUTOS').AsString = 'CUIT' then
   begin
     qrlIngBrutOCuit.Caption     := 'Nro.CUIT: ';
     qrlDatoIngBrutOCuit.Caption := sdqRepManPrestador.fieldByName('CA_CLAVE').AsString;
   end else if not sdqRepManPrestador.fieldByName('CA_RETINGRESOSBRUTOS').IsNull then
   begin
     qrlIngBrutOCuit.Caption     := 'Nro.Ing.Brutos: ';
     qrlDatoIngBrutOCuit.Caption := sdqRepManPrestador.fieldByName('CA_RETINGRESOSBRUTOS').AsString;
   end;

   if sdqEspecialidades.IsEmpty then
   begin
     qrlEspecialidades.Enabled := False;
     qrlCodigo.Enabled         := False;
     qrlEspecialidad.Enabled   := False;
     qrlObservaciones.Enabled  := False;
     qrlFBaja.Enabled          := False;
   end;

   if (Trim(TipoPrest) <> '') then
   begin   // Segun el tipo de prestador, tiene o no datos medicos => en el reporte salen o no los datos med. (by LU)

     bDatosM := ValorSql('SELECT tp_datosmedicos FROM mtp_tipoprestador  ' +
                         ' WHERE tp_codigo = ' + SqlString(Trim(TipoPrest),True)) <> 'N';

     qrlTituloDMedicos.Enabled := bDatosM;
     qrlIntCron.Enabled        := bDatosM;
     qrlSINOIntCron.Enabled    := bDatosM;
     qrlResonancia.Enabled     := bDatosM;
     qrlSINOResonancia.Enabled := bDatosM;
     qrlTAC.Enabled            := bDatosM;
     qrlSINOTAC.Enabled        := bDatosM;
     qrlElectrom.Enabled       := bDatosM;
     qrlSINOElectrom.Enabled   := bDatosM;
     qrlAmbulancia.Enabled     := bDatosM;
     qrlSINOAmbulancia.Enabled := bDatosM;
     qrlRX.Enabled             := bDatosM;
     qrlSINORX.Enabled         := bDatosM;
     qrlFKT.Enabled            := bDatosM;
     qrlSINOFKT.Enabled        := bDatosM;
     qrlCamas.Enabled          := bDatosM;
     qrShapeSup.Enabled        := bDatosM;
     qrShapeIzq.Enabled        := bDatosM;
     qrShapeDer.Enabled        := bDatosM;
     qrShapeInf.Enabled        := bDatosM;
     qrlPiso.Enabled           := bDatosM;
     qrdbPiso.Enabled          := bDatosM;
     qrlTerInt.Enabled         := bDatosM;
     qrdbCTI.Enabled           := bDatosM;
     qrlUCO.Enabled            := bDatosM;
     qrdbUCO.Enabled           := bDatosM;
     qrlQuirofanos.Enabled     := bDatosM;
     qrdbQuirofanos.Enabled    := bDatosM;
     qrlRayos.Enabled          := bDatosM;
     qrdbRayos.Enabled         := bDatosM;
     qrlAuti.Enabled           := bDatosM;
     qrdbAuti.Enabled          := bDatosM;
     qrlGuardia.Enabled        := bDatosM;
     qrdbGuardia.Enabled       := bDatosM;
     qrlConex.Enabled          := bDatosM;
     qrdbConex.Enabled         := bDatosM;
   end;
   Visualizar(Self, GetValores(), [oAutoFirma, oForceShowModal, oForceDB, oShowDialogIfEmpty]);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
