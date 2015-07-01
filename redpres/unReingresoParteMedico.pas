unit unReingresoParteMedico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SinEdit, unfraPrestador, Mask, PatternEdit,
  DateTimeEditors, unFraTrabajador, StdCtrls, unArtFrame, unArtDBAwareFrame, Numeros, CustomDlgs,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ExtCtrls, FormPanel, db, Buttons, SDEngine, unArtDbFrame,
  unFraEmpresa, ComCtrls, IntEdit, unFraCodigoDescripcion, unfraCtbTablas, ExComboBox, Strfuncs, DateTimeFuncs, AnsiSql,
  General, RxRichEd, JvExStdCtrls, JvMemo, JvDotNetControls, JvRichEdit, unSesion, VCLExtra;

type
  TfrmReingresoParteMedico = class(TForm)
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pcParte: TPageControl;
    tbGeneral: TTabSheet;
    tbDatosParte: TTabSheet;
    bSeparador1: TBevel;
    bSeparador2: TBevel;
    lFechaEvento: TLabel;
    bSeparador3: TBevel;
    lSiniestro: TLabel;
    lObservaciones: TLabel;
    sbtnBuscar: TSpeedButton;
    fraCUIL: TfraTrabajador;
    edFEC_SINI: TDateEditor;
    edSINIESTRO: TSinEdit;
    fraEmpresa: TfraEmpresa;
    tbLugarSiniestro: TTabSheet;
    tbDatosTrabajador: TTabSheet;
    edRazonSocial: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edFechaAccidenteOriginal: TDateEditor;
    Label3: TLabel;
    edFechaPrimerManifestacion: TDateEditor;
    Label4: TLabel;
    edDiagnosticoInicial: TRichEdit;
    Label5: TLabel;
    Label6: TLabel;
    lbCIE10: TLabel;
    Label7: TLabel;
    edObservaciones: TRichEdit;
    Label8: TLabel;
    fraForma: TfraCtbTablas;
    Label9: TLabel;
    Label10: TLabel;
    fraParteCuerpoLesionada: TfraCtbTablas;
    Label11: TLabel;
    fraNaturaleza: TfraCtbTablas;
    fraAgenteCausante: TfraCtbTablas;
    Label12: TLabel;
    Label13: TLabel;
    fraTipoGravedad: TfraCtbTablas;
    fraLugarInterna: TfraCtbTablas;
    Label14: TLabel;
    edLugarInternacion: TEdit;
    Label15: TLabel;
    fraLugarTratamiento: TfraCtbTablas;
    edLugarTratamiento: TEdit;
    fraCIE10: TfraCodigoDescripcion;
    edFechaInternacion: TDateEditor;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edFechaReconsulta: TDateEditor;
    Label20: TLabel;
    edFechaReinicioLaboral: TDateEditor;
    edMedico: TEdit;
    Label21: TLabel;
    edLugarSiniestro: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edTelefonoSiniestro: TEdit;
    Label24: TLabel;
    edCalleSiniestro: TEdit;
    Label25: TLabel;
    edNumeroSiniestro: TEdit;
    Label26: TLabel;
    edPisoSiniestro: TEdit;
    Label27: TLabel;
    edDeptoSiniestro: TEdit;
    Label28: TLabel;
    edLocalidadSiniestro: TEdit;
    edCodigoPostalSiniestro: TPatternEdit;
    Label29: TLabel;
    fraProvinciaSiniestro: TfraCodigoDescripcion;
    fraPaisSiniestro: TfraCodigoDescripcion;
    Label30: TLabel;
    Label31: TLabel;
    fraCodigoDocumento: TfraCtbTablas;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edTelefonoTrabajador: TEdit;
    edDocumento: TPatternEdit;
    Label35: TLabel;
    edApellidoNombre: TEdit;
    cbSexo: TExComboBox;
    Label36: TLabel;
    Label37: TLabel;
    edFechaNacimiento: TDateEditor;
    Label38: TLabel;
    edCalleTrabajador: TEdit;
    Label39: TLabel;
    edNumeroTrabajador: TEdit;
    Label40: TLabel;
    edPisoTrabajador: TEdit;
    Label41: TLabel;
    edDeptoTrabajador: TEdit;
    Label42: TLabel;
    edLocalidadTrabajador: TEdit;
    Label43: TLabel;
    edCodigoPostalTrabajador: TPatternEdit;
    Label44: TLabel;
    fraProvinciaTrabajador: TfraCodigoDescripcion;
    edHoraAccidente: TTimeEditor;
    edTiempoExposicion: TPatternEdit;
    edDiasPrevistoBaja: TPatternEdit;
    fraTipoSiniestro: TfraCtbTablas;
    Label45: TLabel;
    fraEstadoCivil: TfraCtbTablas;
    cbBajaMedica: TExComboBox;
    cbPresuponeIncapacidad: TExComboBox;
    edObservacionesEncontradas: TJvDotNetRichEdit;
    edTipoSiniestroInfoAdic: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    fraAccion: TfraStaticCTB_TABLAS;
    Label48: TLabel;
    lblFechaEgreso: TLabel;
    edFechaEgreso: TDateEditor;
    lblRecalificacion: TLabel;
    cbRecalificacion: TExComboBox;
    Label49: TLabel;
    Label50: TLabel;
    procedure sbtnBuscarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCampos: TFields;
    FTipoParte: String;
  public
    function Validar: Boolean;

    procedure CargaParte(Campos: TFields);
    procedure GuardarParte;
    procedure ValidarAccion;
  end;

implementation

uses
  unBusqSini, unFraTrabajadorSIN, unDmPrincipal, unPrincipal, Cuit, unFraCIE10;

{$R *.DFM}

procedure TfrmReingresoParteMedico.CargaParte(Campos: TFields);
begin
  FCampos := Campos;

  //General
  if not Campos.FieldByName('tj_cuil').IsNull then
    fraCUIL.CUIL := Campos.FieldByName('tj_cuil').AsString;

  if not Campos.FieldByName('mw_empleadorcuit').IsNull then
    fraEmpresa.CUIT := Campos.FieldByName('mw_empleadorcuit').AsString;

  if not Campos.FieldByName('ex_siniestro').IsNull then
    edSINIESTRO.SetValues(Campos.FieldByName('ex_siniestro').AsInteger, Campos.FieldByName('ex_orden').AsInteger,
                          Campos.FieldByName('ex_recaida').AsInteger);

  edObservacionesEncontradas.Text := Campos.FieldByName('mw_error').AsString;

  edFEC_SINI.Date := Campos.FieldByName('mw_fechasiniestro').AsDateTime;

  edTipoSiniestroInfoAdic.Text := ValorSql('Select tb_descripcion' +
                                            ' from ctb_tablas' +
                                           ' where tb_clave = ''SINT''' +
                                             ' AND tb_codigo = 1' +
                                             ' AND tb_codigo = ' + SqlValue(Campos.FieldByName('tiposiniestro').AsString) + ')', '');
  fraTipoSiniestro.Codigo := Campos.FieldByName('tiposiniestro').AsString;
//      fraTipoSiniestro.Codigo := ValorSql('Select tb_especial1 from ctb_tablas where tb_clave = ''SINT'' AND tb_especial1 = ' + SqlValue(Campos.FieldByName('tiposiniestro').AsString), '0');


  //Datos del parte
  edRazonSocial.Text              := Campos.FieldByName('mw_empleadornodeclarado').AsString;
  edFechaAccidenteOriginal.Date   := Campos.FieldByName('mw_fechaaccidoriginal').AsDateTime;
  edFechaPrimerManifestacion.Date := Campos.FieldByName('mw_fechaprimermanif').AsDateTime;
  edTiempoExposicion.Text         := Campos.FieldByName('mw_tiempoexposicion').AsString;
  cbPresuponeIncapacidad.Value    := Campos.FieldByName('mw_presuponeincapacidad').AsString;
  edDiagnosticoInicial.text       := Campos.FieldByName('mw_diagnosticoinicial').AsString;
  SetEditorTime(edHoraAccidente, Campos.FieldByName('mw_fechahoraaccidente'));
  edFechaInternacion.Date         := Campos.FieldByName('mw_fechainternacion').AsDateTime;
  cbBajaMedica.Value              := StrRight(LPad(Campos.FieldByName('mw_bajamedica').AsString, '0', 1), 1);;
  edDiasPrevistoBaja.Text         := Campos.FieldByName('mw_diasprevistobaja').AsString;
  edObservaciones.Text            := Campos.FieldByName('mw_observaciones').AsString;
  fraForma.Codigo                 := StrRight(LPad(Campos.FieldByName('mw_idformaaccidente').AsString, '0', 10), 2);
  fraParteCuerpoLesionada.Codigo  := StrRight(LPad(Campos.FieldByName('mw_idpartecuerpo').AsString, '0', 10), 3);
  fraNaturaleza.Codigo            := StrRight(LPad(Campos.FieldByName('mw_idnaturalezalesion').AsString, '0', 10), 2);
  fraAgenteCausante.Codigo        := StrRight(LPad(Campos.FieldByName('mw_idagentecausante').AsString, '0', 10), 2);
  fraTipoGravedad.Codigo          := StrRight(LPad(Campos.FieldByName('mw_idtipogravedad').AsString, '0', 10), 1);
  fraCIE10.Codigo                 := Campos.FieldByName('mw_idtipocie10').AsString;
  fraLugarInterna.Codigo          := StrRight(LPad(Campos.FieldByName('mw_idlugarinterna').AsString, '0', 10), 1);
  edLugarInternacion.Text         := Campos.FieldByName('mw_lugarinterna').AsString;
  fraLugarTratamiento.Codigo      := StrRight(LPad(Campos.FieldByName('mw_idtipotratamiento').AsString, '0', 10), 2);
  edLugarTratamiento.Text         := Campos.FieldByName('mw_lugartratamiento').AsString;
  edFechaReconsulta.Date          := Campos.FieldByName('mw_fechareconsulta').AsDateTime;
  edFechaReinicioLaboral.Date     := Campos.FieldByName('mw_fechareiniciolaboral').AsDateTime;
  edMedico.Text                   := Campos.FieldByName('mw_apenomprofesional').AsString;

  //Lugar del Siniestro
  edLugarSiniestro.Text        := Campos.FieldByName('mw_siniestrolugar').AsString;
  edTelefonoSiniestro.Text     := Campos.FieldByName('mw_siniestrotelef').AsString;
  edCalleSiniestro.Text        := Campos.FieldByName('mw_siniestrocalle').AsString;
  edNumeroSiniestro.Text       := Campos.FieldByName('mw_siniestropuerta').AsString;
  edPisoSiniestro.Text         := Campos.FieldByName('mw_siniestropiso').AsString;
  edDeptoSiniestro.Text        := Campos.FieldByName('mw_siniestrodepto').AsString;
  edLocalidadSiniestro.Text    := Campos.FieldByName('mw_siniestroloca').AsString;
  edCodigoPostalSiniestro.Text := Campos.FieldByName('mw_siniestrocodpos').AsString;

  //Le saco los ceros de la izquierda
  if IsNumber(Campos.FieldByName('mw_siniestroidprovincia').AsString) then
    fraProvinciaSiniestro.Codigo := IntToStr(StrToInt(Campos.FieldByName('mw_siniestroidprovincia').AsString));
  fraPaisSiniestro.Codigo := StrRight(LPad(Campos.FieldByName('mw_siniestropais').AsString, '0', 10), 3);

  //Datos del trabajador
  fraCodigoDocumento.Codigo     := ValorSql('Select tb_codigo' +
                                             ' from ctb_tablas' +
                                            ' where tb_clave = ''TDOC''' +
                                              ' AND tb_especial1 = ' + SqlValue(Campos.FieldByName('mw_idtipodoc').AsString), '0');
  edDocumento.Text              := Campos.FieldByName('mw_nrodoc').AsString;
  edApellidoNombre.Text         := Campos.FieldByName('mw_apeynom').AsString;
  cbSexo.Value                  := Campos.FieldByName('mw_idtiposexo').AsString;
  edFechaNacimiento.Date        := Campos.FieldByName('mw_fechanacimiento').AsDateTime;
  edTelefonoTrabajador.Text     := Campos.FieldByName('mw_telefono').AsString;
  edCalleTrabajador.Text        := Campos.FieldByName('mw_calle').AsString;
  edNumeroTrabajador.Text       := Campos.FieldByName('mw_nropuerta').AsString;
  edPisoTrabajador.Text         := Campos.FieldByName('mw_piso').AsString;
  edDeptoTrabajador.Text        := Campos.FieldByName('mw_depto').AsString;
  edLocalidadTrabajador.Text    := Campos.FieldByName('mw_localidad').AsString;
  edCodigoPostalTrabajador.Text := Campos.FieldByName('mw_codpostal').AsString;
  fraEstadoCivil.Codigo := ValorSql('Select tb_codigo' +
                                     ' from ctb_tablas' +
                                    ' where tb_clave = ''ESTAD''' +
                                      ' AND tb_especial1 = ' + SqlValue(Campos.FieldByName('mw_idestadocivil').AsString), '0');
                                      
  if IsNumber(Campos.FieldByName('mw_idprovincia').AsString) then
      fraProvinciaTrabajador.Codigo := IntToStr(StrToInt(Campos.FieldByName('mw_idprovincia').AsString));

  fraAccion.ExtraCondition := ' and tb_especial1 like ''%'  + IIF((Campos.FieldByName('mw_tipoparte').AsString = 'PMI'), 'I', 'E') + '%''';
  fraAccion.Codigo         := Campos.FieldByName('mw_accion').AsString;
  FTipoParte               := Campos.FieldByName('mw_tipoparte').AsString;

  if (FTipoParte = 'PMI') then
  begin
    edFechaEgreso.Visible     := False;
    lblFechaEgreso.Visible    := False;
    cbRecalificacion.Visible  := False;
    lblRecalificacion.Visible := False;
    Self.Caption              := 'Reingreso de Parte Médico de Ingreso';
  end
  else
    Self.Caption := 'Reingreso de Parte Médico de Egreso';

  edFechaEgreso.Date := Campos.FieldByName('mw_fechahoraegreso').AsDateTime;
  cbRecalificacion.Value := Campos.FieldByName('mw_recalificacion').AsString;

  if (Campos.FieldByName('mw_resultadoaccion').AsString = 'Correcto') then
  begin
    VCLExtra.LockControls(tbGeneral, True);
    VCLExtra.LockControls(tbDatosParte, True);
    VCLExtra.LockControls(tbLugarSiniestro, True);
    VCLExtra.LockControls(tbDatosTrabajador, True);
    VCLExtra.LockControls(btnAceptar, True);
    fraAccion.Locked := True;
  end;
end;

procedure TfrmReingresoParteMedico.sbtnBuscarClick(Sender: TObject);
Var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.fraEmpresa.CUIT := fraEmpresa.CUIT;
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraCUIL.CUIL;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraCUIL.cmbNombre.Text;
    if (fraCUIL.CUIL <> '') then
      dlgBusqSini.tbBuscarClick(nil);

    if dlgBusqSini.ShowModal = mrOk then
    begin
      edSINIESTRO.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
      fraEmpresa.CUIT := dlgBusqSini.Cuit;
      if (fraCUIL.CUIL <> dlgBusqSini.Cuil) and
         (MsgBox('¿ Desea cambiar el trabajador actual por el del siniestro seleccionado ?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
      begin
        fraCUIL.CUIL := dlgBusqSini.Cuil;
        fraCodigoDocumento.Codigo := 'CUIL';
        edDocumento.Text          := dlgBusqSini.Cuil;
        edApellidoNombre.Text     := fraCUIL.cmbNombre.Text;
      end;

      if (dlgBusqSini.FechaRecaida <> 0) then
      begin
        if (edFEC_SINI.Date <> dlgBusqSini.FechaRecaida) then
        begin
          if (MsgBox('¿ Desea cambiar la fecha del siniestro actual por la del siniestro seleccionado ?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
            edFEC_SINI.Date := dlgBusqSini.FechaRecaida;
        end
        else
          edFEC_SINI.Date := dlgBusqSini.FechaRecaida;
      end
      else
      begin
        if (edFEC_SINI.Date <> dlgBusqSini.FechaAccidente) then
        begin
          if (MsgBox('¿ Desea cambiar la fecha del siniestro actual por la del siniestro seleccionado ?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
            edFEC_SINI.Date := dlgBusqSini.FechaAccidente;
        end
        else
          edFEC_SINI.Date := dlgBusqSini.FechaAccidente;
      end;
    end;
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmReingresoParteMedico.btnAceptarClick(Sender: TObject);
begin
  if Validar then
    GuardarParte;
end;

procedure TfrmReingresoParteMedico.FormCreate(Sender: TObject);
begin
  pcParte.ActivePageIndex := 0;

  with fraCIE10 do
  begin
    TableName   := 'CDG_DIAGNOSTICO';
    FieldID     := 'DG_CODIGO';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc   := 'DG_DESCRIPCION';
    FieldBaja   := 'DG_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraProvinciaTrabajador do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    ShowBajas   := True;
  end;

  with fraProvinciaSiniestro do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    ShowBajas   := True;
  end;

  with fraPaisSiniestro do
  begin
    TableName   := 'CPA_PAISES';
    FieldID     := 'PA_CODIGO';
    FieldCodigo := 'PA_CODIGO';
    FieldDesc   := 'PA_DESCRIPCION';
    ShowBajas   := True;
  end;

  fraForma.Clave     := 'FORMA';
  fraForma.ShowBajas := False;

  fraParteCuerpoLesionada.Clave     := 'ZONA';
  fraParteCuerpoLesionada.ShowBajas := False;

  fraNaturaleza.Clave     := 'NATUR';
  fraNaturaleza.ShowBajas := False;

  fraAgenteCausante.Clave     := 'AGENT';
  fraAgenteCausante.ShowBajas := False;

  fraTipoGravedad.Clave     := 'SGRAV';
  fraTipoGravedad.ShowBajas := False;

  fraLugarInterna.Clave     := 'LINTE';
  fraLugarInterna.ShowBajas := False;

  fraLugarTratamiento.Clave     := 'TTRAT';
  fraLugarTratamiento.ShowBajas := False;

  fraCodigoDocumento.Clave     := 'TDOC';
  fraCodigoDocumento.ShowBajas := False;

//    fraTipoSiniestro.Clave := 'STIPO';
  fraTipoSiniestro.Clave          := 'SINT';
  fraTipoSiniestro.ExtraCondition := ' and tb_codigo <> ''1'' ';
  fraTipoSiniestro.ShowBajas      := False;

  fraEstadoCivil.Clave     := 'ESTAD';
  fraEstadoCivil.ShowBajas := False;

  fraAccion.Clave := 'ACWEB';
end;

function TfrmReingresoParteMedico.Validar: boolean;
var
  sCuit: String;
begin
  Result := True;

  //Si la acción es No Corresponde o Sin Acción no valido nada
  if (fraAccion.Codigo = 'NC') or (fraAccion.Codigo = 'SA') then
    Exit;

  if not edSINIESTRO.IsEmpty then
  begin
    sCuit :=  ValorSql('select ex_cuit' +
                        ' from art.sex_expedientes' +
                       ' where ex_siniestro = ' + SqlValue(edSINIESTRO.Siniestro) +
                         ' and ex_orden = ' + SqlValue(edSINIESTRO.Orden) +
                         ' and ex_recaida = ' + SqlValue(edSINIESTRO.Recaida), '');
    if (sCuit = '') then
    begin
      pcParte.ActivePageIndex := 0;
      InvalidMsg(edSINIESTRO, 'El siniestro no existe.', Self.Caption, MB_ICONERROR);
      Abort;
    end
    else
    begin
      if (sCuit <> fraEmpresa.mskCUIT.Text) then
      begin
        pcParte.ActivePageIndex := 0;
        InvalidMsg(edSINIESTRO, 'El siniestro no pertenece a la empresa especificada.', Self.Caption, MB_ICONERROR);
        Abort;
      end;
    end;
  end;

  if (edFEC_SINI.Date = 0) then
  begin
    pcParte.ActivePageIndex := 0;
    InvalidMsg(edFEC_SINI, 'El siniestro no tiene una fecha asociada.', Self.Caption, MB_ICONERROR);
    Abort;
  end;

  if (not fraEmpresa.IsSelected) then
  begin
    pcParte.ActivePageIndex := 0;
    InvalidMsg(fraEmpresa, 'Debe especificar la empresa.', Self.Caption, MB_ICONERROR);
    Abort;
  end;

  if (FTipoParte = 'PMI') and not (cbBajaMedica.ItemIndex >= 0) then
  begin
    pcParte.ActivePageIndex := 1;
    InvalidMsg(fraEmpresa, 'Debe especificar la baja médica.', Self.Caption, MB_ICONERROR);
    Abort;
  end;

  if (FTipoParte = 'PME') and not (cbRecalificacion.ItemIndex >= 0) then
  begin
    pcParte.ActivePageIndex := 1;
    InvalidMsg(cbRecalificacion, 'Debe especificar la recalificación.', Self.Caption, MB_ICONERROR);
    Abort;
  end;

  if fraAccion.IsSelected then
    ValidarAccion;
end;

procedure TfrmReingresoParteMedico.GuardarParte;
var
  sSql: String;
begin
  try
    BeginTrans;
    sSql :=
      ' update art.tmp_spmw_partemedico' +
         ' set mw_fechasiniestro = ' + SqlValue(edFEC_SINI.Date) +
            ', mw_empleadornodeclarado = ' + SqlValue(edRazonSocial.Text) +
            ', mw_fechaaccidoriginal = ' + SqlValue(edFechaAccidenteOriginal.Date) +
            ', mw_fechaprimermanif = ' + SqlValue(edFechaPrimerManifestacion.Date) +
            ', mw_tiempoexposicion = ' + SqlValue(edTiempoExposicion.Text) +
            ', mw_diagnosticoinicial = ' + SqlValue(edDiagnosticoInicial.Text) +
            ', mw_observaciones = ' + SqlValue(edObservaciones.Text) +
            ', mw_lugartratamiento = ' + SqlValue(edLugarTratamiento.Text) +
            ', mw_fechainternacion = ' + SqlValue(edFechaInternacion.Date) +
            ', mw_idsiniestro = ' + SqlValue(fraTipoSiniestro.Codigo) +
            ', mw_presuponeincapacidad = ' + SqlValue(cbPresuponeIncapacidad.Value) +
            ', mw_empleadorcuit = ' + SqlValue(fraEmpresa.CUIT) +
            ', mw_idtipocie10 = ' + SqlValue(fraCIE10.Codigo) +
            ', mw_idformaaccidente = ' + SqlValue(fraForma.Codigo) +
            ', mw_idpartecuerpo = ' + SqlValue(fraParteCuerpoLesionada.Codigo) +
            ', mw_idnaturalezalesion = ' + SqlValue(fraNaturaleza.Codigo) +
            ', mw_idagentecausante = ' + SqlValue(fraAgenteCausante.Codigo) +
            ', mw_idtipogravedad = ' + SqlValue(fraTipoGravedad.Codigo) +
            ', mw_bajamedica = ' + SqlValue(cbBajaMedica.Value) +
            ', mw_lugarinterna = ' + SqlValue(edLugarInternacion.Text) +
            ', mw_diasprevistobaja = ' + SqlValue(edDiasPrevistoBaja.Text) +
            ', mw_fechareconsulta = ' + SqlValue(edFechaReconsulta.Date) +
            ', mw_fechareiniciolaboral = ' + SqlValue(edFechaReinicioLaboral.Date) +
            ', mw_apenomprofesional = ' + SqlValue(edMedico.Text) +
            ', mw_siniestrolugar = ' + SqlValue(edLugarSiniestro.Text) +
            ', mw_siniestrotelef = ' + SqlValue(edTelefonoSiniestro.Text) +
            ', mw_siniestrocalle = ' + SqlValue(edCalleSiniestro.Text) +
            ', mw_siniestropuerta = ' + SqlValue(edNumeroSiniestro.Text) +
            ', mw_siniestropiso = ' + SqlValue(edPisoSiniestro.Text) +
            ', mw_siniestrodepto = ' + SqlValue(edDeptoSiniestro.Text) +
            ', mw_siniestroloca = ' + SqlValue(edLocalidadSiniestro.Text) +
            ', mw_siniestrocodpos = ' + SqlValue(edCodigoPostalSiniestro.Text) +
            ', mw_idtipotratamiento = ' + SqlValue(fraLugarTratamiento.Codigo) +
            ', mw_siniestroidprovincia = ' + SqlValue(fraProvinciaSiniestro.Codigo) +
            ', mw_siniestropais = ' + SqlValue(fraPaisSiniestro.Codigo) +
            ', mw_telefono = ' + SqlValue(edTelefonoTrabajador.Text) +
            ', mw_apeynom = ' + SqlValue(edApellidoNombre.Text) +
            ', mw_idtiposexo = ' + SqlValue(cbSexo.Value) +
            ', mw_fechanacimiento = ' + SqlValue(edFechaNacimiento.Date) +
            ', mw_idestadocivil = ' + SqlValue(fraEstadoCivil.Especial1) +
            ', mw_idprovincia = ' + SqlValue(fraProvinciaTrabajador.Codigo) +
            ', mw_idlugarinterna = ' + SqlValue(fraLugarInterna.Codigo) +
            ', mw_calle = ' + SqlValue(edCalleTrabajador.Text) +
            ', mw_nropuerta = ' + SqlValue(edNumeroTrabajador.Text) +
            ', mw_piso = ' + SqlValue(edPisoTrabajador.Text) +
            ', mw_depto = ' + SqlValue(edDeptoTrabajador.Text) +
            ', mw_codpostal = ' + SqlValue(edCodigoPostalTrabajador.Text) +
            ', mw_localidad = ' + SqlValue(edLocalidadTrabajador.Text) +
            ', mw_fechahoraegreso = ' + SqlValue(edFechaEgreso.Date) +
            ', mw_recalificacion = ' + SqlValue(cbRecalificacion.Value);

    if fraCUIL.IsSelected then
    begin
      sSql := sSql + ', mw_idtipodoc = 0';
      sSql := sSql + ', mw_nrodoc = ' + SqlValue(fraCUIL.CUIL);
    end
    else
    begin
      if fraCodigoDocumento.IsSelected then
        sSql := sSql + ', mw_idtipodoc = ' + SqlValue(fraCodigoDocumento.Especial1);
        sSql := sSql + ', mw_nrodoc = ' + SqlValue(edDocumento.Text);
    end;

    if not edSINIESTRO.IsEmpty then
    begin
      sSql := sSql + ', mw_siniestro = ' + SqlValue(edSINIESTRO.Siniestro);
      sSql := sSql + ', mw_orden = ' + SqlValue(edSINIESTRO.Orden);
      sSql := sSql + ', mw_recaida = ' + SqlValue(edSINIESTRO.Recaida);
    end;

    if (edHoraAccidente.Time <> 0) then
      sSql := sSql + ', mw_fechahoraaccidente = ' + SqlValue(edHoraAccidente.EditText)
    else
      sSql := sSql + ', mw_fechahoraaccidente = null';

    sSql := sSql + ', mw_usumodif = ' + SqlValue(Sesion.LoginName) + ', mw_fechamodif = sysdate';

    sSql := sSql + ' where mw_transaccion = ' + SqlValue(FCampos.FieldByName('mw_transaccion').AsInteger);

    EjecutarSqlST(sSql);
    EjecutarSqlST('update tmp_spmw_partemedico' +
                    ' set mw_accion = ' + SqlValue(fraAccion.Codigo) +
                  ' where mw_transaccion = ' +  SqlValue(FCampos.FieldByName('mw_transaccion').AsInteger));

    CommitTrans;

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al guardar el parte.');
    end;
  end;

(*
    sSql := ' update art.tmp_spmw_partemedico ' +
            ' set mw_fechasiniestro = ' + SqlValue(edFEC_SINI.Date) + ' , ' +
            ' mw_empleadornodeclarado = ' + SqlValue(edRazonSocial.Text) + ' , ' +
            ' mw_fechaaccidoriginal = ' + SqlValue(edFechaAccidenteOriginal.Date) + ' , ' +
            ' mw_fechaprimermanif = ' + SqlValue(edFechaPrimerManifestacion.Date) + ' , ' +
            ' mw_tiempoexposicion = ' + SqlValue(edTiempoExposicion.Text) + ' , ' +
            ' mw_diagnosticoinicial = ' + SqlValue(edDiagnosticoInicial.Text) + ' , ' +
            ' mw_observaciones = ' + SqlValue(edObservaciones.Text) + ' , ' +
            ' mw_lugartratamiento = ' + SqlValue(edLugarTratamiento.Text) + ' , ' +
            ' mw_fechainternacion = ' + SqlValue(edFechaInternacion.Date) + ' , ';


    if fraTipoSiniestro.IsSelected then
        sSql := sSql +  ' mw_idsiniestro = ' + SqlValue(fraTipoSiniestro.Codigo) + ' , ';


    if (edHoraAccidente.Time <> 0) then
        sSql := sSql +  ' mw_fechahoraaccidente = ' + SqlValue(edHoraAccidente.EditText) + ' , '
    else
        sSql := sSql +  ' mw_fechahoraaccidente = null,  ';

    if edPresuponeIncapacidad.Text <> '' then
        sSql := sSql +  ' mw_presuponeincapacidad = ' + SqlValue(edPresuponeIncapacidad.Text) + ' , ';

    if fraEmpresa.IsSelected then
        sSql := sSql + ' mw_empleadorcuit = ' + SqlValue(fraEmpresa.mskCUIT.text) + ' , ';

    if fraCIE10.IsSelected then
        sSql := sSql + ' mw_idtipocie10 = ' + SqlValue(fraCIE10.Codigo) + ' , ';

    if fraForma.IsSelected then
        sSql := sSql + ' mw_idformaaccidente = ' + SqlValue(fraForma.Codigo) + ' , ';

    if fraParteCuerpoLesionada.IsSelected then
        sSql := sSql + ' mw_idpartecuerpo = ' + SqlValue(fraParteCuerpoLesionada.Codigo) + ' , ';

    if fraNaturaleza.IsSelected then
        sSql := sSql + ' mw_idnaturalezalesion = ' + SqlValue(fraNaturaleza.Codigo) + ' , ';

    if fraAgenteCausante.IsSelected then
        sSql := sSql + ' mw_idagentecausante = ' + SqlValue(fraAgenteCausante.Codigo) + ' , ';

    if fraTipoGravedad.IsSelected then
        sSql := sSql + ' mw_idtipogravedad = ' + SqlValue(fraTipoGravedad.Codigo) + ' , ';

    if cbBajaMedica.ItemIndex > 0 then
        sSql := sSql + ' mw_bajamedica = ' + SqlValue(cbBajaMedica.Value) + ' , ';

     sSql := sSql + ' mw_lugarinterna = ' + SqlValue(edLugarInternacion.Text) + ' , ' +
            ' mw_diasprevistobaja = ' + SqlValue(edDiasPrevistoBaja.Text) + ' , ' +
            ' mw_fechareconsulta = ' + SqlValue(edFechaReconsulta.Date) + ' , ' +
            ' mw_fechareiniciolaboral = ' + SqlValue(edFechaReinicioLaboral.Date) + ' , ' +
            ' mw_apenomprofesional = ' + SqlValue(edMedico.Text) + ' , ' +

            ' mw_siniestrolugar = ' + SqlValue(edLugarSiniestro.Text) + ' , ' +
            ' mw_siniestrotelef = ' + SqlValue(edTelefonoSiniestro.Text) + ' , ' +
            ' mw_siniestrocalle = ' + SqlValue(edCalleSiniestro.Text) + ' , ' +
            ' mw_siniestropuerta = ' + SqlValue(edNumeroSiniestro.Text) + ' , ' +
            ' mw_siniestropiso = ' + SqlValue(edPisoSiniestro.Text) + ' , ' +
            ' mw_siniestrodepto = ' + SqlValue(edDeptoSiniestro.Text) + ' , ' +
            ' mw_siniestroloca = ' + SqlValue(edLocalidadSiniestro.Text) + ' , ' +
            ' mw_siniestrocodpos = ' + SqlValue(edCodigoPostalSiniestro.Text) + ' , ';


    if fraLugarTratamiento.IsSelected then
        sSql := sSql + ' mw_idtipotratamiento = ' + SqlValue(fraLugarTratamiento.Codigo) + ' , ';

    if fraProvinciaSiniestro.IsSelected then
        sSql := sSql + ' mw_siniestroidprovincia = ' + SqlValue(fraProvinciaSiniestro.Codigo) + ' , ';

    if fraPaisSiniestro.IsSelected then
        sSql := sSql + ' mw_siniestropais = ' + SqlValue(fraPaisSiniestro.Codigo) + ' , ';

    if fraCUIL.IsSelected then
    begin
        sSql := sSql + ' mw_idtipodoc = 0, ';
        sSql := sSql + ' mw_nrodoc = ' + SqlValue(fraCUIL.Value) + ' , ';
    end
    else begin
        if fraCodigoDocumento.IsSelected then
            sSql := sSql + ' mw_idtipodoc = ' + SqlValue(fraCodigoDocumento.Especial1) + ' , ';
        sSql := sSql + ' mw_nrodoc = ' + SqlValue(edDocumento.Text) + ' , ';
    end;

    sSql := sSql + ' mw_telefono = ' + SqlValue(edTelefonoTrabajador.Text) + ' , ' +
            ' mw_apeynom = ' + SqlValue(edApellidoNombre.Text) + ' , ';

    if (cbSexo.itemindex > 0) then
        sSql := sSql + ' mw_idtiposexo = ' + SqlValue(cbSexo.Value) + ' , ';

    sSql := sSql +  ' mw_fechanacimiento = ' + SqlValue(edFechaNacimiento.Date) + ' , ';

    if fraEstadoCivil.IsSelected then
        sSql := sSql + ' mw_idestadocivil = ' + SqlValue(fraEstadoCivil.Especial1) + ' , ';

    if fraProvinciaTrabajador.IsSelected then
        sSql := sSql + ' mw_idprovincia = ' + SqlValue(fraProvinciaTrabajador.Codigo) + ' , ';

    if fraLugarInterna.IsSelected then
        sSql := sSql + ' mw_idlugarinterna = ' + SqlValue(fraLugarInterna.Codigo) + ' , ';

     sSql := sSql + ' mw_calle = ' + SqlValue(edCalleTrabajador.Text) + ' , ' +
            ' mw_nropuerta = ' + SqlValue(edNumeroTrabajador.Text) + ' , ' +
            ' mw_piso = ' + SqlValue(edPisoTrabajador.Text) + ' , ' +
            ' mw_depto = ' + SqlValue(edDeptoTrabajador.Text) + ' , ' +
            ' mw_codpostal = ' + SqlValue(edCodigoPostalTrabajador.Text) + ' , ' +
            ' mw_localidad = ' + SqlValue(edLocalidadTrabajador.Text);

    sSql := sSql + ' where mw_transaccion = ' + SqlValue(FCampos.FieldByName('mw_transaccion').AsInteger);

    EjecutarSql(sSql);
*)
end;

procedure TfrmReingresoParteMedico.ValidarAccion;
var
  ATipo: String;
begin
  ATipo := fraAccion.Codigo;
  
  if (ATipo = 'SI') or (ATipo = 'NR') or (ATipo = 'NO') or (ATipo = 'NS') then
  begin
    if (edFEC_SINI.Date = 0) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro no tiene fecha de siniestro asociado.');
    end;

    if (not fraEmpresa.IsSelected) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado no tiene un empleador asociado.');
    end;

    if (not fraEmpresa.IsSelected) and (not IsCuit(fraEmpresa.mskCUIT.Text)) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado tiene un Cuit inválido.');
    end;
  end;

  if (ATipo = 'SI') or (ATipo = 'NR') or (ATipo = 'NO') then
  begin
    if edSINIESTRO.IsEmpty then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado no tiene siniestro asociado.');
    end;
  end;

  if (ATipo = 'NO') or (ATipo = 'NS') then
  begin
    if (not fraCodigoDocumento.IsSelected) and (not fraCUIL.IsSelected) then
      raise EInvalidExcept.Create('El registro seleccionado no tiene un tipo de documento.');

    if (fraCodigoDocumento.Especial1 <> '0') and (fraCodigoDocumento.Especial1 <> '1') and (not fraCUIL.IsSelected) then
    begin
      pcParte.ActivePageIndex := 3;
      raise EInvalidExcept.Create('El registro seleccionado no tiene un tipo de documento válido.');
    end;

    if (edDocumento.Text = '') and (not fraCUIL.IsSelected) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado no tiene un documento.');
    end;

    if (fraCodigoDocumento.Especial1 = '0') and (Trim(edDocumento.Text) <> '') and
       (not IsCuil(trim(edDocumento.Text))) and (not fraCUIL.IsSelected) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado tiene el Cuil inválido.');
    end;
  end;

  if (FTipoParte = 'PMI') and (ATipo = 'SI') then
  begin
    if ExisteSql('SELECT 1' +
                  ' FROM art.spi_parteingreso' +
                 ' WHERE pi_siniestro = ' + SqlValue(edSINIESTRO.Siniestro) +
                   ' and pi_orden = ' + SqlValue(edSINIESTRO.Orden) +
                   ' and pi_recaida = ' + SqlValue(edSINIESTRO.Recaida)) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado ya tiene un parte de ingreso.');
    end;
  end;

  if (FTipoParte = 'PME') and (ATipo = 'SI') then
  begin
    if ExisteSql('SELECT 1' +
                  ' FROM art.spe_parteegreso' +
                 ' WHERE pe_siniestro = ' + SqlValue(edSINIESTRO.Siniestro) +
                   ' and pe_orden = ' + SqlValue(edSINIESTRO.Orden) +
                   ' and pe_recaida = ' + SqlValue(edSINIESTRO.Recaida)) then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado ya tiene un parte de egreso.');
    end;
  end;
end;

end.
