unit unReingresoParteMedicoEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SinEdit, unfraPrestador, Mask, PatternEdit, DateTimeEditors,
  unFraTrabajador, StdCtrls, unArtFrame, unArtDBAwareFrame,   Numeros, CustomDlgs,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, ExtCtrls, FormPanel, db,
  Buttons, SDEngine, unArtDbFrame, unFraEmpresa, ComCtrls, IntEdit,
  unFraCodigoDescripcion, unfraCtbTablas, ExComboBox, Strfuncs, DateTimeFuncs,
  AnsiSql, General, RxRichEd, JvExStdCtrls, JvMemo, JvDotNetControls,
  JvRichEdit, unSesion, VCLExtra;

type
  TfrmReingresoParteMedicoEvol = class(TForm)
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
    tbDatosTrabajador: TTabSheet;
    edRazonSocial: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edFechaControl: TDateEditor;
    Label3: TLabel;
    edFechaProximoControl: TDateEditor;
    edDiagnostico: TRichEdit;
    Label5: TLabel;
    Label7: TLabel;
    edObservaciones: TRichEdit;
    Label14: TLabel;
    edLugarInternacion: TEdit;
    Label15: TLabel;
    edAutorizacion: TEdit;
    edFechaInternacionDesde: TDateEditor;
    Label16: TLabel;
    edMedico: TEdit;
    Label21: TLabel;
    fraCodigoDocumento: TfraCtbTablas;
    Label32: TLabel;
    Label33: TLabel;
    edDocumento: TPatternEdit;
    Label35: TLabel;
    edApellidoNombre: TEdit;
    Label37: TLabel;
    edFechaNacimiento: TDateEditor;
    edObservacionesEncontradas: TJvDotNetRichEdit;
    fraAccion: TfraStaticCTB_TABLAS;
    Label48: TLabel;
    lblFechaEgreso: TLabel;
    edFechaAlta: TDateEditor;
    edFechaInternacionHasta: TDateEditor;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    procedure sbtnBuscarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCampos : TFields;
  public
    function Validar: boolean;
    procedure ValidarAccion;
    procedure CargaParte(Campos: TFields);
    procedure GuardarParte;
    { Public declarations }
  end;


implementation



uses unBusqSini, unFraTrabajadorSIN, unDmPrincipal, unPrincipal, Cuit,
  unFraCIE10;



{$R *.DFM}

procedure TfrmReingresoParteMedicoEvol.CargaParte(Campos : TFields);
begin
      FCampos := Campos;
      //General
      if not Campos.FieldByName('tj_cuil').IsNull  then
         fraCUIL.CUIL := Campos.FieldByName('tj_cuil').Asstring;

      if not Campos.FieldByName('vw_cuit').IsNull  then
        fraEmpresa.CUIT := Campos.FieldByName('vw_cuit').AsString;

      if not Campos.FieldByName('ex_siniestro').IsNull then
          edSINIESTRO.SetValues(Campos.FieldByName('ex_siniestro').AsInteger,
                                Campos.FieldByName('ex_orden').AsInteger,
                                Campos.FieldByName('ex_recaida').AsInteger);

      edObservacionesEncontradas.Text := Campos.FieldByName('vw_error').AsString;

      edFEC_SINI.Date := Campos.FieldByName('vw_fechasin').AsDateTime;

      //Datos del parte
      edRazonSocial.Text := Campos.FieldByName('vw_razonsocial').AsString;
      edFechaControl.Date := Campos.FieldByName('vw_fechacontrol').AsDateTime;
      edFechaProximoControl.Date := Campos.FieldByName('vw_proximocontrol').AsDateTime;
      edDiagnostico.text := Campos.FieldByName('vw_diagnostico').AsString;
      edFechaInternacionDesde.Date := Campos.FieldByName('vw_internadodesde').AsDateTime;
      edFechaInternacionHasta.Date := Campos.FieldByName('vw_internadohasta').AsDateTime;
      edFechaAlta.Date := Campos.FieldByName('vw_probablealta').AsDateTime;
      edObservaciones.Text := Campos.FieldByName('vw_observaciones').AsString;
      edLugarInternacion.Text := Campos.FieldByName('vw_sitiointernacion').AsString;
      edAutorizacion.Text := Campos.FieldByName('vw_autorizacion').AsString;
      edMedico.Text := Campos.FieldByName('vw_medico').AsString;

      //Datos del trabajador
      fraCodigoDocumento.Codigo := ValorSql('Select tb_codigo from ctb_tablas where tb_clave = ''TDOC'' AND tb_especial1 = ' + SqlValue(Campos.FieldByName('vw_tipodoc').AsString), '0');
      edDocumento.Text := Campos.FieldByName('vw_documento').AsString;
      edApellidoNombre.Text := Campos.FieldByName('vw_nombre').AsString;
      edFechaNacimiento.Date := Campos.FieldByName('vw_fecnac').AsDateTime;

      fraAccion.ExtraCondition := ' and tb_especial1 like ''%V%''';
      fraAccion.Codigo := Campos.FieldByName('vw_accion').AsString;

      self.Caption := 'Reingreso de Parte Médico Evolutivo';

      if (Campos.FieldByName('vw_resultadoaccion').AsString = 'C') then
      begin
        VCLExtra.LockControls(tbGeneral, true);
        VCLExtra.LockControls(tbDatosParte, true);
        VCLExtra.LockControls(tbDatosTrabajador, true);
        VCLExtra.LockControls(btnAceptar, true);
        fraAccion.Locked := true;
      end;
end;



procedure TfrmReingresoParteMedicoEvol.sbtnBuscarClick(Sender: TObject);
Var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create( Self );
  Try
     dlgBusqSini.fraEmpresa.Contrato := fraEmpresa.Contrato;
     dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraCUIL.CUIL;
     dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraCUIL.cmbNombre.Text;
     if (fraCUIL.mskCUIL.Text <> '') Then dlgBusqSini.tbBuscarClick ( Nil );

     if dlgBusqSini.ShowModal = mrOk Then
     begin
         edSINIESTRO.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
         fraEmpresa.CUIT := dlgBusqSini.CUIT;
         if (fraCUIL.CUIL <> dlgBusqSini.Cuil) and
            (MsgBox('¿Desea cambiar el trabajador actual por el del siniestro seleccionado?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
         begin
             fraCUIL.CUIL := dlgBusqSini.Cuil;
             fraCodigoDocumento.Codigo := 'CUIL';
             edDocumento.Text := dlgBusqSini.Cuil;
             edApellidoNombre.Text := fraCUIL.cmbNombre.Text;
         end;

         if (dlgBusqSini.FechaRecaida <> 0) then
         begin
             if (edFEC_SINI.Date <> dlgBusqSini.FechaRecaida) then
             begin
                if (MsgBox('¿Desea cambiar la fecha del siniestro actual por la del siniestro seleccionado?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
                    edFEC_SINI.Date := dlgBusqSini.FechaRecaida;
             end
             else edFEC_SINI.Date := dlgBusqSini.FechaRecaida;
         end
         else begin
             if (edFEC_SINI.Date <> dlgBusqSini.FechaAccidente) then
             begin
                if (MsgBox('¿Desea cambiar la fecha del siniestro actual por la del siniestro seleccionado?', MB_ICONQUESTION or MB_YESNO, 'Recepción de Partes') = idYES) then
                    edFEC_SINI.Date := dlgBusqSini.FechaAccidente;
             end
             else edFEC_SINI.Date := dlgBusqSini.FechaAccidente;
         end;
     end;
  finally
     dlgBusqSini.Free ;
  end;
end;

procedure TfrmReingresoParteMedicoEvol.btnAceptarClick(Sender: TObject);
begin
    if Validar then GuardarParte;
end;

procedure TfrmReingresoParteMedicoEvol.FormCreate(Sender: TObject);
begin
    pcParte.ActivePageIndex := 0;

    fraCodigoDocumento.Clave := 'TDOC';
    fraCodigoDocumento.ShowBajas := False;

    fraAccion.Clave := 'ACWEB';
end;

function TfrmReingresoParteMedicoEvol.Validar: boolean;
var
    sCuit: string;
begin
    result := true;

    //Si la acción es No Corresponde o Sin Acción no valido nada
    if (fraAccion.Codigo = 'NC') or (fraAccion.Codigo = 'SA')  then Exit;

    if (not edSINIESTRO.IsEmpty) then
    begin
        sCuit :=  ValorSql('select ex_cuit ' +
                           'from art.sex_expedientes where ex_siniestro = ' + SqlValue(edSINIESTRO.Siniestro) +
                           ' and ex_orden = '+ SqlValue(edSINIESTRO.Orden) +
                           ' and ex_recaida = '+ SqlValue(edSINIESTRO.Recaida), '');
        if (sCuit = '') then
        begin
            pcParte.ActivePageIndex := 0;
            InvalidMsg(edSINIESTRO, 'El siniestro no existe', Self.Caption, MB_ICONERROR);
            abort;
        end
        else begin
            if (sCuit <> fraEmpresa.mskCUIT.Text) then
            begin
               pcParte.ActivePageIndex := 0;
               InvalidMsg(edSINIESTRO, 'El siniestro no pertenece a la empresa especificada', Self.Caption, MB_ICONERROR);
               abort;
            end;
        end;
    end;
    if (edFEC_SINI.Date = 0) then
    begin
        pcParte.ActivePageIndex := 0;
        InvalidMsg(edFEC_SINI, 'El siniestro no tiene una fecha asociada', Self.Caption, MB_ICONERROR);
        abort;
    end;

    if (not fraEmpresa.IsSelected) then
    begin
        pcParte.ActivePageIndex := 0;
        InvalidMsg(fraEmpresa, 'Debe especificar la empresa', Self.Caption, MB_ICONERROR);
        abort;
    end;

    if fraAccion.IsSelected then ValidarAccion;

end;

procedure TfrmReingresoParteMedicoEvol.GuardarParte;
var
    sSql: String;
begin

    try
        BeginTrans;
        sSql := ' update art.tmp_spvw_parteevolutivo ' +
                ' set vw_fechasin = ' + SqlValue(edFEC_SINI.Date) + ' , ' +
                ' vw_razonsocial = ' + SqlValue(edRazonSocial.Text) + ' , ' +
                ' vw_fechacontrol = ' + SqlValue(edFechaControl.Date) + ' , ' +
                ' vw_proximocontrol = ' + SqlValue(edFechaProximoControl.Date) + ' , ' +
                ' vw_diagnostico = ' + SqlValue(edDiagnostico.Text) + ' , ' +
                ' vw_observaciones = ' + SqlValue(edObservaciones.Text) + ' , ' +
                ' vw_internadodesde = ' + SqlValue(edFechaInternacionDesde.Date) + ' , ' +
                ' vw_internadohasta = ' + SqlValue(edFechaInternacionHasta.Date) + ' , ' +
                ' vw_probablealta = ' + SqlValue(edFechaAlta.Date) + ' , ' +
                ' vw_sitiointernacion = ' + SqlValue(edLugarInternacion.Text) + ' , ' +
                ' vw_autorizacion = ' + SqlValue(edAutorizacion.Text) + ' , ' +
                ' vw_medico = ' + SqlValue(edMedico.Text) + ' , ' +
                ' vw_nombre = ' + SqlValue(edApellidoNombre.Text) + ' , ' +
                ' vw_fecnac = ' + SqlValue(edFechaNacimiento.Date) + ' , ';

        if fraCUIL.IsSelected then
        begin
            sSql := sSql + ' vw_tipodoc = 0, ';
            sSql := sSql + ' vw_documento = ' + SqlValue(fraCUIL.CUIL) + ' , ';
        end
        else begin
            if fraCodigoDocumento.IsSelected then
                sSql := sSql + ' vw_tipodoc = ' + SqlValue(fraCodigoDocumento.Especial1) + ' , ';
            sSql := sSql + ' vw_documento = ' + SqlValue(edDocumento.Text) + ' , ';
        end;

        if not edSINIESTRO.IsEmpty then
        begin
            sSql := sSql +  ' vw_siniestro = ' + SqlValue(edSINIESTRO.Siniestro) + ' , ';
            sSql := sSql +  ' vw_orden = ' + SqlValue(edSINIESTRO.Orden) + ' , ';
            sSql := sSql +  ' vw_recaida = ' + SqlValue(edSINIESTRO.Recaida) + ' , ';
        end;

        sSql := sSql +  ' vw_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
                        ' vw_fechamodif = sysdate ';

        sSql := sSql + ' where vw_transaccion = ' + SqlValue(FCampos.FieldByName('vw_transaccion').AsInteger);

        EjecutarSqlST(sSql);

        EjecutarSqlST('update tmp_spvw_parteevolutivo set vw_accion = ' + SqlValue(fraAccion.Codigo) + ' where vw_transaccion = ' +  SqlValue(FCampos.FieldByName('vw_transaccion').AsInteger));

        CommitTrans;

        ModalResult := mrOk;

    except
        on E: Exception do
        begin
            Rollback;
            ErrorMsg( E, 'Error al guardar el PEV.');
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


procedure TfrmReingresoParteMedicoEvol.ValidarAccion;
var
    ATipo: string;
begin
  ATipo:= fraAccion.Codigo;
  if (ATipo = 'SI') then
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

      if (not fraEmpresa.IsSelected) and
         (not IsCuit(fraEmpresa.CUIT)) then
      begin
        pcParte.ActivePageIndex := 0;
        raise EInvalidExcept.Create('El registro seleccionado tiene un Cuit inválido.');
      end;

    if edSINIESTRO.IsEmpty then
    begin
      pcParte.ActivePageIndex := 0;
      raise EInvalidExcept.Create('El registro seleccionado no tiene siniestro asociado.');
    end;
  end;
end;

end.
