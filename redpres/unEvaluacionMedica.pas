unit unEvaluacionMedica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPanelABM, DB, SDEngine, Placemnt, artSeguridad,
  ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unArtFrame,
  unFraTrabajadorSIN, SinEdit, Mask, ToolEdit, DateComboBox, 
  unFraCodigoDescripcion, unFraCodDesc, QRCtrls, QuickRpt;

type
  TfrmEvaluacionMedica = class(TfrmCustomPanelABM)
    gbDatosSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    grpTrabajador: TGroupBox;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    tbSalir2: TToolButton;
    ScrollBox1: TScrollBox;
    qrEvaluacion: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlCUIL: TQRLabel;
    pnlEvaluacion: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edEnfActual: TMemo;
    dcFechaPrim: TDateComboBox;
    dcFechaAlta: TDateComboBox;
    edAntecedentes: TMemo;
    edPuestoTrabajo: TEdit;
    edDescPuesto: TMemo;
    edExamenFisico: TMemo;
    edDiagnostico: TEdit;
    edPorcentaje: TEdit;
    edDocumentacion: TMemo;
    edEstudios: TMemo;
    fraCIE10: TfraCodDesc;
    qrlTrabajador: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    qrlEmpleador: TQRLabel;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    qrlEnfermedad: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    qrlFechaPriMani: TQRLabel;
    QRShape8: TQRShape;
    QRLabel9: TQRLabel;
    qrlFechaAlta: TQRLabel;
    qrlAntecedentes: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    qrlPuesto: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRSysData1: TQRSysData;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    qrlDescripcion: TQRLabel;
    qrlExamen: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlDiagnostico: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape14: TQRShape;
    qrlCie10: TQRLabel;
    QRLabel16: TQRLabel;
    qrlIncPres: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRLabel18: TQRLabel;
    qrlDocumentacion: TQRLabel;
    qrlEstudios: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape17: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    chkEnfProfes: TCheckBox;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure edPorcentajeKeyPress(Sender: TObject; var Key: Char);
    procedure tbImprimirClick(Sender: TObject);
  private
    IdExped, NroParte :Integer;
    dPorcentaje :Double;
    function ValidarPorcentaje :Boolean;
  public
    procedure Execute(iIdExpediente, iNroParte :Integer; bSoloConsulta :Boolean);
  end;

var
  frmEvaluacionMedica: TfrmEvaluacionMedica;

implementation

uses unDmPrincipal, unPrincipal, AnsiSql, CustomDlgs, unSesion, CUIT, VCLExtra,
  General;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.Execute(iIdExpediente, iNroParte :Integer; bSoloConsulta :Boolean);
var
  sSql :String;
begin
  IdExped  := iIdExpediente;
  NroParte := iNroParte; 
  sSql     := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                    ' em_id, em_idexpediente, em_enfermedadactual, em_antecedentes, ' +
                    ' em_puestotrabajo, em_descpuestotrabajo, em_examenfisico, ' +
                    ' em_diagnostico, em_cie10, em_incpresunta, em_docuaportada, ' +
                    ' em_fechaprimanif, em_fechadealta, em_estudioscomplem, em_enfermprofes, ' +
                    ' ex_siniestro, ex_orden, ex_recaida, ex_cuil, ex_cuit ' +
               ' FROM cem_evaluacionmedica, sex_expedientes ' +
              ' WHERE ex_id = em_idexpediente(+) ' +
                ' AND ex_id = :IdExp ' +
                ' AND em_nroparte(+) = :NroParte ';
  sdqConsulta := GetQueryEx(sSql, [IdExped, NroParte]);
  with sdqConsulta do
  begin
    edSiniestro.SetValues(FieldByName('EX_SINIESTRO').AsInteger,
                          FieldByName('EX_ORDEN').AsInteger,
                          FieldByName('EX_RECAIDA').AsInteger);
    fraTrabajadorSIN.Cargar(FieldByName('EX_CUIL').AsString);
    fraEmpresa.CUIT := FieldByName('EX_CUIT').AsString;
    fraCIE10.Codigo             := FieldByName('EM_CIE10').AsString;
    edEnfActual.Lines.Text      := FieldByName('EM_ENFERMEDADACTUAL').AsString;
    dcFechaPrim.Date            := FieldByName('EM_FECHAPRIMANIF').AsDateTime;
    dcFechaAlta.Date            := FieldByName('EM_FECHADEALTA').AsDateTime;
    edAntecedentes.Lines.Text   := FieldByName('EM_ANTECEDENTES').AsString;
    edPuestoTrabajo.Text        := FieldByName('EM_PUESTOTRABAJO').AsString;
    edDescPuesto.Lines.Text     := FieldByName('EM_DESCPUESTOTRABAJO').AsString;
    edExamenFisico.Lines.Text   := FieldByName('EM_EXAMENFISICO').AsString;
    edDiagnostico.Text          := FieldByName('EM_DIAGNOSTICO').AsString;
    edPorcentaje.Text           := FieldByName('EM_INCPRESUNTA').AsString;
    edDocumentacion.Lines.Text  := FieldByName('EM_DOCUAPORTADA').AsString;
    edEstudios.Lines.Text       := FieldByName('EM_ESTUDIOSCOMPLEM').AsString;
    chkEnfProfes.Checked        := (FieldByName('EM_ENFERMPROFES').AsString = 'S');
  end;
  VCLExtra.LockControls([edEnfActual, dcFechaPrim, dcFechaAlta, edAntecedentes,
                         edPuestoTrabajo, edDescPuesto, edExamenFisico, edDiagnostico,
                         edPorcentaje, fraCIE10, edDocumentacion, edEstudios,
                         chkEnfProfes], bSoloConsulta);
  tbSalir.Enabled := Seguridad.Activar(tbSalir) and not(bSoloConsulta);
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmEvaluacionMedica := Nil;
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.FSFormCreate(Sender: TObject);
begin
//  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.tbSalirClick(Sender: TObject);
var
  sSql :String;
begin
  if not(ValidarPorcentaje) then Exit;

  try
    sSql := 'SELECT 1 FROM cem_evaluacionmedica ' +
            ' WHERE em_idexpediente = :IdExped ' +
              ' AND em_nroparte = :NroParte ';
    if ExisteSqlEx(sSql, [IdExped, NroParte]) then
      sSql := 'UPDATE cem_evaluacionmedica ' +
                ' SET em_cie10 = ' + SqlValue(fraCIE10.Codigo) + ',' +
                    ' em_enfermedadactual = ' + SqlValue(edEnfActual.Lines.Text) + ',' +
                    ' em_fechaprimanif = ' + SqlDate(dcFechaPrim.Date) + ',' +
                    ' em_fechadealta = ' + SqlDate(dcFechaAlta.Date) + ',' +
                    ' em_antecedentes = ' + SqlValue(edAntecedentes.Lines.Text) + ',' +
                    ' em_puestotrabajo = ' + SqlValue(edPuestoTrabajo.Text) + ',' +
                    ' em_descpuestotrabajo = ' + SqlValue(edDescPuesto.Lines.Text) + ',' +
                    ' em_examenfisico = ' + SqlValue(edExamenFisico.Lines.Text) + ',' +
                    ' em_diagnostico = ' + SqlValue(edDiagnostico.Text) + ',' +
                    ' em_incpresunta = ' + SqlNumber(dPorcentaje, True) + ',' +
                    ' em_docuaportada = ' + SqlValue(edDocumentacion.Lines.Text) + ',' +
                    ' em_estudioscomplem = ' + SqlValue(edEstudios.Lines.Text) + ',' +
                    ' em_enfermprofes = ' + IIF(chkEnfProfes.Checked, '''S''', '''N''') + ',' +
                    ' em_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' em_fechamodif = ActualDate ' +
              ' WHERE em_idexpediente = ' + SqlInt(IdExped) +
                ' AND em_nroparte = ' + SqlInt(NroParte)
    else
      sSql := 'INSERT INTO cem_evaluacionmedica ( ' +
              ' em_idexpediente, em_enfermedadactual, em_antecedentes, em_puestotrabajo, ' +
              ' em_descpuestotrabajo, em_examenfisico, em_diagnostico, em_cie10, em_incpresunta, ' +
              ' em_docuaportada, em_fechaprimanif, em_fechadealta, em_estudioscomplem, ' +
              ' em_nroparte, em_enfermprofes, em_usualta, em_fechaalta) VALUES ( ' +
              SqlInt(IdExped) + ',' + SqlValue(edEnfActual.Lines.Text) + ',' +
              SqlValue(edAntecedentes.Lines.Text) + ',' + SqlValue(edPuestoTrabajo.Text) + ',' +
              SqlValue(edDescPuesto.Lines.Text) + ',' + SqlValue(edExamenFisico.Lines.Text) + ',' +
              SqlValue(edDiagnostico.Text) + ',' + SqlValue(fraCIE10.Codigo) + ',' +
              SqlNumber(dPorcentaje, True) + ',' + SqlValue(edDocumentacion.Lines.Text) + ',' +
              SqlDate(dcFechaPrim.Date) + ',' + SqlDate(dcFechaAlta.Date) + ',' +
              SqlValue(edEstudios.Lines.Text) + ',' + SqlInt(NroParte) + ',' +
              IIF(chkEnfProfes.Checked, '''S''', '''N''') + ',' +
              SqlValue(Sesion.UserID) + ', ActualDate)';

    EjecutarSql(sSql);
    sdqConsulta.Refresh;                                
    MsgBox('Los datos se han guardado correctamente', MB_ICONINFORMATION);
  except
    on E:Exception do ErrorMsg(E);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.edPorcentajeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ','
  else if not(Key in [#8, #9, '1', '2', '3','4', '5', '6', '7', '8', '9', '0', ',']) then
    Key := #0;
end;
{-------------------------------------------------------------------------------}
function TfrmEvaluacionMedica.ValidarPorcentaje :Boolean;
begin
  if (Trim(edPorcentaje.Text) = '') then
    dPorcentaje := -1
  else
    try
      dPorcentaje := StrToFloat(edPorcentaje.Text);
    except
      InfoHint(edPorcentaje, 'El porcentaje de incapacidad presunta es inválido.', True);
    end;
  Verificar(dPorcentaje > 100, edPorcentaje, 'El porcentaje de incapacidad presunta no puede ser mayor que 100.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmEvaluacionMedica.tbImprimirClick(Sender: TObject);
begin
  qrlSiniestro.Caption      := sdqConsulta.FieldByName('SINIESTRO').AsString;
  qrlTrabajador.Caption     := fraTrabajadorSIN.dbcTrabNombre.Text;
  qrlCUIL.Caption           := PonerGuiones(fraTrabajadorSIN.mskTrabCUIL.Text);
  qrlEmpleador.Caption      := fraEmpresa.NombreEmpresa;
  qrlEnfermedad.Caption     := sdqConsulta.FieldByName('EM_ENFERMEDADACTUAL').AsString;
  qrlFechaPriMani.Caption   := sdqConsulta.FieldByName('EM_FECHAPRIMANIF').AsString;
  qrlFechaAlta.Caption      := sdqConsulta.FieldByName('EM_FECHADEALTA').AsString;
  qrlAntecedentes.Caption   := sdqConsulta.FieldByName('EM_ANTECEDENTES').AsString;
  qrlPuesto.Caption         := sdqConsulta.FieldByName('EM_PUESTOTRABAJO').AsString;
  qrlDescripcion.Caption    := sdqConsulta.FieldByName('EM_DESCPUESTOTRABAJO').AsString;
  qrlExamen.Caption         := sdqConsulta.FieldByName('EM_EXAMENFISICO').AsString;
  qrlDiagnostico.Caption    := sdqConsulta.FieldByName('EM_DIAGNOSTICO').AsString;
  qrlCie10.Caption          := sdqConsulta.FieldByName('EM_CIE10').AsString;
  qrlIncPres.Caption        := sdqConsulta.FieldByName('EM_INCPRESUNTA').AsString;
  qrlDocumentacion.Caption  := sdqConsulta.FieldByName('EM_DOCUAPORTADA').AsString;
  qrlEstudios.Caption       := sdqConsulta.FieldByName('EM_ESTUDIOSCOMPLEM').AsString;
  qrEvaluacion.PreviewModal;
end;
{-------------------------------------------------------------------------------}
end.
