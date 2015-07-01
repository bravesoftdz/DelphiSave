unit unRptConfiguracionAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls,
  RxGIF, QRTansparentImage, grimgctrl, jpeg;

type
  TqrConfiguracionAGENDA = class(TqrMoldeCarta)
    qrbDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    qrbAyuda: TQRChildBand;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    qrbRtaSugFija: TQRChildBand;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    qrlbUsuario: TQRLabel;
    qrlbHoy: TQRLabel;
    QRLabel19: TQRLabel;
    qrbGrupoProceso: TQRGroup;
    sdqDatosTE_ID: TFloatField;
    sdqDatosTE_DESCRIPCION: TStringField;
    sdqDatosTE_USUALTA: TStringField;
    sdqDatosTE_FECHAALTA: TDateTimeField;
    sdqDatosTE_USUMODIF: TStringField;
    sdqDatosTE_FECHAMODIF: TDateTimeField;
    sdqDatosTE_USUBAJA: TStringField;
    sdqDatosTE_FECHABAJA: TDateTimeField;
    sdqDatosTE_TIPOEVENTO: TStringField;
    sdqDatosTE_IDPROCESO: TFloatField;
    sdqDatosTE_AYUDA: TStringField;
    sdqDatosTE_IDPADRE: TFloatField;
    sdqDatosTE_IDDESTINATARIO: TFloatField;
    sdqDatosTE_TIEMPORESOLUCION: TFloatField;
    sdqDatosTE_RESPUESTASUGERIDAFIJA: TStringField;
    sdqDatosTE_DESTINATARIO_IDSECTOR: TFloatField;
    sdqDatosTE_DESTINATARIO_SECTOR: TStringField;
    sdqDatosTE_DESTINATARIO_CARGO: TStringField;
    sdqDatosPO_ID: TFloatField;
    sdqDatosPO_DESCRIPCION: TStringField;
    sdqDatosTD_ID: TFloatField;
    sdqDatosTD_DESCRIPCION: TStringField;
    sdqDatosTD_SQL: TStringField;
    sdqDatosTD_FECHAALTA: TDateTimeField;
    sdqDatosTD_USUALTA: TStringField;
    sdqDatosTD_FECHAMODIF: TDateTimeField;
    sdqDatosTD_USUMODIF: TStringField;
    sdqDatosTD_FECHABAJA: TDateTimeField;
    sdqDatosTD_USUBAJA: TStringField;
    sdqDatosTD_EDITABLE: TStringField;
    sdqDatosMODULOS: TFloatField;
    sdqDatosPADRE: TStringField;
    sdqDatosDIAS_RESOLUCION: TFloatField;
    sdqDatosHORAS_RESOLUCION: TFloatField;
    sdqDatosMINUTOS_RESOLUCION: TFloatField;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    sdqDetalleMotivosIngreso: TSDQuery;
    sdqDetalleModulos: TSDQuery;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrbTitulosDetalleModulos: TQRBand;
    QRLabel5: TQRLabel;
    qrbdObligatorio: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    qrbTituloDetalleMotivoIngreso: TQRBand;
    QRLabel6: TQRLabel;
    qrbTitulosModulos: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrbDestinatarioTareas: TQRChildBand;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    sdqDatosRI: TStringField;
    QRGroup1: TQRGroup;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    qrlTiempoResolucion: TQRLabel;
    QRDBText15: TQRDBText;
    qrlDias: TQRLabel;
    QRDBText17: TQRDBText;
    qrlHoras: TQRLabel;
    QRDBText18: TQRDBText;
    qrlMinutos: TQRLabel;
    sdqDatosTIPO: TStringField;
    sdqDetalleModulosMO_ID: TFloatField;
    sdqDetalleModulosMO_DESCRIPCION: TStringField;
    sdqDetalleModulosMO_TIPOMODULO: TStringField;
    sdqDetalleModulosMO_TIPOMODULODEPENDIENTE: TStringField;
    sdqDetalleModulosMO_USUALTA: TStringField;
    sdqDetalleModulosMO_FECHAALTA: TDateTimeField;
    sdqDetalleModulosMO_USUMODIF: TStringField;
    sdqDetalleModulosMO_FECHAMODIF: TDateTimeField;
    sdqDetalleModulosMO_USUBAJA: TStringField;
    sdqDetalleModulosMO_FECHABAJA: TDateTimeField;
    sdqDetalleModulosMO_CODIGOPANEL: TFloatField;
    sdqDetalleModulosTM_ID: TFloatField;
    sdqDetalleModulosTM_IDTIPOEVENTO: TFloatField;
    sdqDetalleModulosTM_IDMODULOEVENTO: TFloatField;
    sdqDetalleModulosTM_ORDEN: TStringField;
    sdqDetalleModulosTM_USUALTA: TStringField;
    sdqDetalleModulosTM_FECHAALTA: TDateTimeField;
    sdqDetalleModulosTM_USUMODIF: TStringField;
    sdqDetalleModulosTM_FECHAMODIF: TDateTimeField;
    sdqDetalleModulosTM_USUBAJA: TStringField;
    sdqDetalleModulosTM_FECHABAJA: TDateTimeField;
    sdqDetalleModulosTM_OBLIGATORIO: TStringField;
    sdqDetalleModulosDEPENDE_DE: TStringField;
    sdqDetalleModulosOBLIGATORIO: TStringField;
    qrbFooterEspaciador: TQRBand;
    sdqDatosSE_DESCRIPCION: TStringField;
    sdqDatosSC_DESCRIPCION: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    QRLabel22: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText21: TQRDBText;
    sdqDatosFECHA: TDateTimeField;
    sdqDatosRTA_SUGERIDA: TStringField;
    sdqDatosSQLEXPLICACION: TStringField;
    sdqDetalleMotivosIngresoMI_DESCRIPCION: TStringField;
    sdqDetalleMotivosIngresoMI_ID: TFloatField;
    procedure qrbAyudaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbRtaSugFijaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbDestinatarioTareasBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ColoreoTilde(sender: TObject; var Value: String);
    procedure qrlbUsuarioPrint(sender: TObject; var Value: String);
    procedure qrlbHoyPrint(sender: TObject; var Value: String);
    procedure qrlDiasPrint(sender: TObject; var Value: String);
    procedure qrlHorasPrint(sender: TObject; var Value: String);
    procedure qrlMinutosPrint(sender: TObject; var Value: String);
    procedure qrlTiempoResolucionPrint(sender: TObject; var Value: String);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure sdqDatosCalcFields(DataSet: TDataSet);
    procedure sdqDetalleModulosCalcFields(DataSet: TDataSet);
    procedure VerificarDestinatarioConceptual(sender: TObject; var Value: String);
  private
    FModulos: Boolean;
    FMotivoIngreso: Boolean;
    procedure SetModulos(const Value: Boolean);
    procedure SetMotivoIngreso(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    property Modulos: Boolean read FModulos write SetModulos;
    property MotivoIngreso: Boolean read FMotivoIngreso write SetMotivoIngreso;
  end;

var
  qrConfiguracionAGENDA: TqrConfiguracionAGENDA;

implementation

uses
  unSesion, unDmPrincipal, unArt, SqlFuncs, Strfuncs;

{$R *.dfm}

procedure TqrConfiguracionAGENDA.qrbAyudaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not sdqDatos.FieldByName('TE_AYUDA').IsNull;
end;

procedure TqrConfiguracionAGENDA.qrbRtaSugFijaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not sdqDatos.FieldByName('RTA_SUGERIDA').IsNull;
end;

procedure TqrConfiguracionAGENDA.qrbDestinatarioTareasBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := sdqDatos.FieldByName('TE_TIPOEVENTO').AsString = 'T';
end;

procedure TqrConfiguracionAGENDA.ColoreoTilde(Sender: TObject; var Value: String);
begin
  if Value = vSI then
    TQRDBText(Sender).Font.Color := clGreen
  else if Value = vNO then
    TQRDBText(Sender).Font.Color := clMaroon;  
end;

procedure TqrConfiguracionAGENDA.qrlbUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

procedure TqrConfiguracionAGENDA.qrlbHoyPrint(sender: TObject; var Value: String);
begin
  Value := FormatDateTime('dddd d ''de'' MMMM ''de'' yyyy, hh:nn', DBDateTime);
end;

procedure TqrConfiguracionAGENDA.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  if Modulos then
    OpenQueryEx(sdqDetalleModulos, [sdqDatos.FieldByName('TE_ID').AsInteger]);

  if MotivoIngreso then
    OpenQueryEx(sdqDetalleMotivosIngreso, [sdqDatos.FieldByName('TE_ID').AsInteger]);
end;

procedure TqrConfiguracionAGENDA.sdqDatosCalcFields(DataSet: TDataSet);
var
  sAux: String;
  tslAux: TStringList;
begin
  if DataSet.Active {and not DataSet.IsEmpty} then
  begin
    if DataSet.FieldByName('TE_TIPOEVENTO').AsString = 'T' then
      DataSet.FieldByName('TIPO').AsString := 'Tarea'
    else if DataSet.FieldByName('TE_TIPOEVENTO').AsString = 'E' then
      DataSet.FieldByName('TIPO').AsString := 'Evento';

    tslAux := TStringList.Create;
    try
      BlobSql('SELECT TE_SQL FROM AGENDA.ATE_TIPOEVENTO WHERE TE_ID = ' + DataSet.FieldByName('TE_ID').AsString, tslAux);

      if DataSet.FieldByName('TE_RESPUESTASUGERIDAFIJA').IsNull then
      begin
        if DataSet.FieldByName('RI').AsString = vSI then
        begin
          sAux := GetFirstSQLCommment(tslAux.Text);//DataSet.FieldByName('SQL').AsString);
          if not IsEmptyString(sAux) then
          begin
            DataSet.FieldByName('RTA_SUGERIDA').Value := sAux;
            DataSet.FieldByName('SQLEXPLICACION').Value := sAux;
          end;
        end
      end else
        DataSet.FieldByName('RTA_SUGERIDA').AsString := DataSet.FieldByName('TE_RESPUESTASUGERIDAFIJA').AsString;
    finally
      tslAux.Free;
    end;
  end;
end;

procedure TqrConfiguracionAGENDA.sdqDetalleModulosCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('TM_OBLIGATORIO').AsString = 'S' then
    DataSet.FieldByName('OBLIGATORIO').AsString := vSI
  else if DataSet.FieldByName('TM_OBLIGATORIO').AsString = 'N' then
    DataSet.FieldByName('OBLIGATORIO').AsString := vNO;
end;

constructor TqrConfiguracionAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  try
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_ART_NUEVO_COLOR');
  except
  end;
end;

procedure TqrConfiguracionAGENDA.qrlDiasPrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('DIAS_RESOLUCION').IsNull then
    Value := '';
end;

procedure TqrConfiguracionAGENDA.qrlHorasPrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('HORAS_RESOLUCION').IsNull then
    Value := '';
end;

procedure TqrConfiguracionAGENDA.qrlMinutosPrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('MINUTOS_RESOLUCION').IsNull then
    Value := '';
end;

procedure TqrConfiguracionAGENDA.qrlTiempoResolucionPrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('DIAS_RESOLUCION').IsNull and sdqDatos.FieldByName('HORAS_RESOLUCION').IsNull and sdqDatos.FieldByName('MINUTOS_RESOLUCION').IsNull then
    Value := '';
end;

procedure TqrConfiguracionAGENDA.VerificarDestinatarioConceptual(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('TE_IDDESTINATARIO').AsString <> '-1' then
    Value := '';
end;

procedure TqrConfiguracionAGENDA.SetModulos(const Value: Boolean);
begin
  FModulos := Value;
  qrbTitulosDetalleModulos.Enabled := Value;
  qrbTitulosModulos.Enabled := Value;
//  qrbDetalleModulos.Enabled := Value;
end;

procedure TqrConfiguracionAGENDA.SetMotivoIngreso(const Value: Boolean);
begin
  FMotivoIngreso := Value;
  qrbTituloDetalleMotivoIngreso.Enabled := Value;
//  qrbDetalleMotivoIngreso.Enabled := Value;
end;

end.
