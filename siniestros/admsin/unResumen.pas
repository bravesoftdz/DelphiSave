unit unResumen;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unSinForm, SDEngine, DB, StdCtrls,
  ExtCtrls, artSeguridad, XPMenu, JvgGroupBox, unArtFrame, unFraDomicilioTrab, unFraSLZ_LESIONZONA,
  unFraSLN_LESIONNATURALEZA, unFraSLA_LESIONAGENTE, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCodDesc,
  unFraSLF_LESIONFORMA, Mask, PatternEdit, IntEdit, unFraCDG_DIAGNOSTICO, unArtDbFrame, unfraCPR_PRESTADOR,
  JvExExtCtrls, JvRadioGroup, unFraDomicilioEmpresa, unFraDomicilio, unFraDomicilioTrabajador, DBCtrls, RXDBCtrl,
  QuickRpt, ActnList;

type
  TfrmResumen = class(TSinForm)
    gbDatosEmpresa: TJvgGroupBox;
    gbEstadoCobranza: TJvgGroupBox;
    gbDocumentacion: TJvgGroupBox;
    gbIncapacidad: TJvgGroupBox;
    gbParteAuditoria: TJvgGroupBox;
    gbDatosPrestador: TJvgGroupBox;
    gbDatosSiniestro: TJvgGroupBox;
    gbUbicacionDenuncia: TJvgGroupBox;
    gbDatosEmpleado: TJvgGroupBox;
    Label3: TLabel;
    fraDomicilioDenuncia: TfraDomicilio;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    fraPI_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    fraPI_IDLESIONAGENTE: TfraSLA_LESIONAGENTE;
    fraPI_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraPI_IDLESIONZONA: TfraSLZ_LESIONZONA;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    fraPI_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraPrestador: TfraCPR_PRESTADOR;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edNombreDenuncia: TDBEdit;
    edTelefonosDenuncia: TDBEdit;
    IntEdit1: TDBEdit;
    IntEdit2: TDBEdit;
    Edit4: TDBEdit;
    Edit5: TDBEdit;
    DateEdit1: TDBDateEdit;
    Edit1: TDBEdit;
    Edit2: TDBEdit;
    Edit3: TDBEdit;
    DateEdit2: TDBDateEdit;
    Edit7: TDBEdit;
    RadioGroup1: TDBRadioGroup;
    CheckBox1: TDBCheckBox;
    RadioGroup2: TDBRadioGroup;
    RadioGroup3: TDBRadioGroup;
    CheckBox2: TDBCheckBox;
    CheckBox3: TDBCheckBox;
    CheckBox4: TDBCheckBox;
    checkHomologado: TDBCheckBox;
    DateEdit3: TDBDateEdit;
    CurrencyEdit1: TDBEdit;
    CurrencyEdit2: TDBEdit;
    Edit8: TDBEdit;
    CheckBox6: TDBCheckBox;
    CheckBox7: TDBCheckBox;
    CheckBox8: TDBCheckBox;
    CheckBox9: TDBCheckBox;
    CheckBox10: TDBCheckBox;
    CheckBox11: TDBCheckBox;
    CheckBox12: TDBCheckBox;
    CheckBox13: TDBCheckBox;
    DateEdit4: TDBDateEdit;
    DateEdit5: TDBDateEdit;
    DateEdit6: TDBDateEdit;
    DateEdit7: TDBDateEdit;
    DateEdit8: TDBDateEdit;
    DateEdit9: TDBDateEdit;
    DateEdit10: TDBDateEdit;
    DateEdit11: TDBDateEdit;
    CurrencyEdit3: TDBEdit;
    CurrencyEdit4: TDBEdit;
    CurrencyEdit5: TDBEdit;
    sdqDatosEX_CUIT: TStringField;
    sdqDatosEX_CUIL: TStringField;
    sdqDatosNOMBREDENUNCIA: TStringField;
    sdqDatosCALLEDENUNCIA: TStringField;
    sdqDatosNUMERODENUNCIA: TStringField;
    sdqDatosPISODENUNCIA: TStringField;
    sdqDatosDEPARTAMENTODENUNCIA: TStringField;
    sdqDatosCODIGOPOSTALDENUNCIA: TStringField;
    sdqDatosCPADENUNCIA: TStringField;
    sdqDatosLOCALIDADDENUNCIA: TStringField;
    sdqDatosPROVINCIADENUNCIA: TStringField;
    sdqDatosTELEFONOSDENUNCIA: TStringField;
    sdqDatosPI_DIASBAJAPREVISTOS: TFloatField;
    sdqDatosPE_DIASBAJATOTALES: TFloatField;
    sdqDatosPE_DIAGNOSTICO: TStringField;
    sdqDatosEX_ALTAMEDICA: TDateTimeField;
    sdqDatosFORMA: TFloatField;
    sdqDatosAGENTE: TFloatField;
    sdqDatosNATURALEZA: TFloatField;
    sdqDatosZONA: TFloatField;
    sdqDatosEX_BREVEDESCRIPCION: TStringField;
    sdqDatosEX_OBSERVACIONES: TStringField;
    sdqDatosEX_DIAGNOSTICOOMS: TStringField;
    sdqDatosCAUSADENEGACION: TStringField;
    sdqDatosPA_FECHACONTROL: TDateTimeField;
    sdqDatosCALIDADAUDITORIA: TStringField;
    sdqDatosPA_MEDICO: TStringField;
    sdqDatosEXISTEINCAPACIDAD: TFloatField;
    sdqDatosGRADO: TFloatField;
    sdqDatosCARACTER: TFloatField;
    sdqDatosGRANINVALIDEZ: TFloatField;
    sdqDatosRECHAZOPATOLOGIABASE: TFloatField;
    sdqDatosFALLECIMIENTO: TFloatField;
    sdqDatosFECHAHOMOLOGADO: TDateTimeField;
    sdqDatosHOMOLOGADO: TFloatField;
    sdqDatosSI_PORCPROVI: TFloatField;
    sdqDatosSI_PORCDEF: TFloatField;
    sdqDatosPRESUPINCAP: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    sdqDatosDE_FECHARECEPCION: TDateTimeField;
    sdqDatosPI_FECHARECEPCION: TDateTimeField;
    sdqDatosPE_FECHARECEPCION: TDateTimeField;
    sdqDatosSA_FECHARECEPCION: TDateTimeField;
    sdqDatosDG_FECHARECEPCION: TDateTimeField;
    sdqDatosPV_FECHARECEPCION: TDateTimeField;
    sdqDatosPA_FECHARECEPCION: TDateTimeField;
    sdqDatosEX_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosDE_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosPI_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosPE_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosSA_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosDG_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosPV_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosPA_FECHARECEPCIONTILDE: TFloatField;
    sdqDatosCUOTAPROMEDIO: TFloatField;
    sdqDatosDEUDA: TFloatField;
    sdqDatosDEUDAADMITIDA: TFloatField;
    fraDomicilioEmpresa: TfraDomicilioEmpresa;
    fraDomicilioTrabajador: TfraDomicilioTrabajador;
    sdqDatosEX_PRESTADOR: TFloatField;
    sdqDatosEX_IDDIAGNOSTICO: TFloatField;
    sdqDatosPI_DIAGNOSTICO: TStringField;
    procedure FSFormCreate(Sender: TObject);
  protected
  	function GetAddButtonVisible: Boolean; override;
  public
    procedure Clear; override;
    procedure LoadData; override;
    procedure Print; override;
  end;

var
  frmResumen: TfrmResumen;

implementation

uses
 	unDmPrincipal, unRptResumen;

{$R *.dfm}

{ TfrmResumen }

function TfrmResumen.GetAddButtonVisible: Boolean;
begin
	Result := False;
end;

procedure TfrmResumen.LoadData;
begin
  with fraPrestador do
  begin
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'EX_PRESTADOR';
  end;

	 sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  fraDomicilioEmpresa.Cuit    := sdqDatos.FieldByName('EX_CUIT').AsString;
 	fraDomicilioTrabajador.Cuil := sdqDatos.FieldByName('EX_CUIL').AsString;

  with fraDomicilioDenuncia do
  begin
    Calle        := sdqDatos.FieldByName('CALLEDENUNCIA').AsString;
    Numero       := sdqDatos.FieldByName('NUMERODENUNCIA').AsString;
    Piso         := sdqDatos.FieldByName('PISODENUNCIA').AsString;
    Departamento := sdqDatos.FieldByName('DEPARTAMENTODENUNCIA').AsString;
    CodigoPostal := sdqDatos.FieldByName('CODIGOPOSTALDENUNCIA').AsString;
    CPA          := sdqDatos.FieldByName('CPADENUNCIA').AsString;
    Localidad    := sdqDatos.FieldByName('LOCALIDADDENUNCIA').AsString;
    Provincia    := sdqDatos.FieldByName('PROVINCIADENUNCIA').AsString;
  end;

  inherited;
end;

procedure TfrmResumen.FSFormCreate(Sender: TObject);
begin
  inherited;
  acAgregar.Enabled := False;
  acModificar.Enabled := False;
  acEliminar.Enabled := False;

  fraPI_IDLESIONFORMA.ShowBajas      := True;
  fraPI_IDLESIONAGENTE.ShowBajas     := True;
  fraPI_IDLESIONNATURALEZA.ShowBajas := True;
  fraPI_IDLESIONZONA.ShowBajas       := True;

  with fraDomicilioDenuncia do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
  end;
end;

procedure TfrmResumen.Print;
begin
  inherited;
  with TrptResumen.Create(Self) do
  try
    Imprimir(SiniestroCompleto, IdExpediente, Siniestro);
  finally
    Free;
  end;
end;

procedure TfrmResumen.Clear;
begin
  inherited;
  fraDomicilioEmpresa.Clear;
  fraDomicilioTrabajador.Clear;
  fraDomicilioDenuncia.Clear;
end;

end.
