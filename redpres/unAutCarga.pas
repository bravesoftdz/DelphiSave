unit unAutCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ToolEdit, RxLookup, Mask,
  Db, SDEngine, ArtComboBox, unfraPrestador, unFraTrabajadorSIN, artSeguridad, CustomDlgs, ValFuncs, Placemnt, dtpFuncs,
  General, DateComboBox, unfraPrestaciones, SinEdit, ShortCutControl, IntEdit, CurrEdit, ExtCtrls, unfraNomenclador,
  unfraSubPrestacion, PatternEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  FormPanel, unFraCodigoDescripcion, unFraGrupoTrabajo, DBCtrls, Grids,
  DBGrids, RXDBCtrl, ArtDBGrid, ComCtrls, vclextra, strutils, RxPlacemnt,
  RxToolEdit, RxCurrEdit;

type
  TQueLimpiar = set of (qlPrestador, qlTrabajador, qlSiniestro, qlPrestacion);

  TfrmAutCarga = class(TForm)
    grpTrabajador: TGroupBox;
    sbtnBuscar: TSpeedButton;
    Label1: TLabel;
    grpPrestacion: TGroupBox;
    btnGuardar: TButton;
    btnPrestacion: TButton;
    btnAutoXPaciente: TButton;
    btnSalir: TButton;
    btnAutoXPrestador: TButton;
    btnLimpiar: TButton;
    grpPrestador: TGroupBox;
    lbFSolicitud: TLabel;
    lbFRecepcion: TLabel;
    lbFDesde: TLabel;
    lbFHasta: TLabel;
    lbDetalle: TLabel;
    lbGTrabajo: TLabel;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    Label6: TLabel;
    edSiniDiagnostico: TEdit;
    Label7: TLabel;
    edSiniFecha: TEdit;
    memoDetalle: TMemo;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    btnTrabajador: TSpeedButton;
    deFecSolicitud: TDateComboBox;
    deFecRecepcion: TDateComboBox;
    deFecDesde: TDateComboBox;
    deFecHasta: TDateComboBox;
    lbImporte: TLabel;
    edMedico: TEdit;
    lbMedico: TLabel;
    btnSiniMasDatos: TSpeedButton;
    fraPrestador: TfraPrestador;
    SinEdit: TSinEdit;
    btnHistoria: TSpeedButton;
    ShortCutControl: TShortCutControl;
    edImporte: TCurrencyEdit;
    edSinTipo: TEdit;
    pnlChecks: TPanel;
    chkComMed: TCheckBox;
    chkSRT: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    edFechaTurno: TDateComboBox;
    Label5: TLabel;
    edHoraTurno: TMaskEdit;
    Label8: TLabel;
    lbCantidad: TLabel;
    Label9: TLabel;
    edDiasDevol: TIntEdit;
    Label10: TLabel;
    edSiniGTrabajo: TEdit;
    fraNomencladorAut: TfraNomenclador;
    lbPrestacion: TLabel;
    fraSubPrestacion: TfraSubPrestacion;
    Label2: TLabel;
    edCantidad: TCurrencyEdit;
    TimerConfidencial: TTimer;
    btnCalendario: TSpeedButton;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    fraPrestacion: TfraPrestacion;
    Label11: TLabel;
    lvRelaciones: TListView;
    btnAgregarSubPr: TSpeedButton;
    btnQuitarSubPr: TSpeedButton;
    fpAgregarRel: TFormPanel;
    Bevel7: TBevel;
    Label23: TLabel;
    btnAceptarRel: TButton;
    btnCancelarRel: TButton;
    fraNomencladorRel: TfraNomenclador;
    lblEspera: TLabel;
    meEspera: TMaskEdit;
    Label12: TLabel;
    cbNumAuto: TArtComboBox;
    sdqNumAuto: TSDQuery;
    dsNumAuto: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrestacionClick(Sender: TObject);
    procedure btnAutoXPacienteClick(Sender: TObject);
    procedure btnAutoXPrestadorClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnTrabajadorClick(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure edCantidadExit(Sender: TObject);
    procedure edCantidadEnter(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure btnHistoriaClick(Sender: TObject);
    procedure edHoraTurnoExit(Sender: TObject);
    procedure fraNomencladorAutExit(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure fraPrestacionExit(Sender: TObject);
    procedure btnCalendarioClick(Sender: TObject);
    procedure SinEditExit(Sender: TObject);
    procedure lvRelacionesResize(Sender: TObject);
    procedure btnAgregarSubPrClick(Sender: TObject);
    procedure btnQuitarSubPrClick(Sender: TObject);
    procedure btnAceptarRelClick(Sender: TObject);
    procedure fpAgregarRelBeforeShow(Sender: TObject);
    procedure deFecSolicitudExit(Sender: TObject);
    procedure meEsperaExit(Sender: TObject);
    procedure edFechaTurnoExit(Sender: TObject);
  private
    IdExpediente, Contrato, IdTrabajador :Integer;
    function GuardarDatos: Boolean;
    function Validar: Boolean;
    function ValidarAltaMedica: Boolean;
    function ConfirmaTrasladoCIE10(IdExpediente :Integer): Boolean;
    function ValidarReqTraslado: Boolean;
    function ValidarInvestigacion(IdExpediente :Integer): Boolean;
    function Validar_SML_CargaAut: Boolean;              // Plan - SML
    function Es_TipoPrestacionPermitida_Carga: Boolean;  // Plan - SML
    function ValidarSiniestroGCBA: boolean;
  //  function Prestacion_ExigeTurno(sPrestacion: String): boolean;  // TK 15891  // TK 16226 ticket que anula al 15891.

    procedure CargarCkecks;
    procedure Limpiar(QueLimpiar: TQueLimpiar);
    procedure OnNomencladorChange(Sender: TObject);
    procedure OnPrestacionChange(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure VerTraslados;
    procedure DoTurnosPrestaciones(NumAuto :Integer);
    procedure DoCargarRelaciones;
    procedure DoBloquearValor;
    procedure SetValor;
    procedure DoHabilitarMultiples;
    procedure DoInsertarPrestaciones(NumAuto :Integer);
    procedure DoEnviarAvisos;

    function ValidaPrestacionConCantidad(var cCantidad: Currency): boolean;
  public
  end;

const
  FechaInicioART = '01/07/1996';
  PRES_ESPERA_REMIS = '449101';

var
  frmAutCarga: TfrmAutCarga;
  gSiniestro, gOrden, gRecaida: integer;  // Lu 19/09/2008 uso variables globales para ver si cambia el siniestro al darle exit y validar todo nuevamente. Sino puede ser que se valide un siniestro que no es. Por error de PSANMARTIN

implementation

uses
  unPrincipal, unDmPrincipal, unBusqSini, unDatosSiniestro, StrFuncs,
  UnTraslados, UnDestPapl, AnsiSql, unConfidencial, unSesion, Periodo,
  unCalendarioPrestacional, unAutTurnos, unRedPres, unComunes, unUtilsArchivo,
  unTercerizadoras, unSiniestros, unContratoTrabajador;

{$R *.DFM}

procedure TfrmAutCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuAutCarga.Enabled := True;
end;

procedure TfrmAutCarga.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
  gtrabajo :String;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraTrabajadorSIN.mskTrabCUIL.Text;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraTrabajadorSIN.dbcTrabNombre.Text;
    if (fraTrabajadorSIN.mskTrabCUIL.Text <> '') then
      dlgBusqSini.tbBuscarClick(nil);

    if dlgBusqSini.ShowModal = mrOk then
    begin
      fraTrabajadorSIN.mskTrabCUIL.Text   := dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text;
      fraTrabajadorSIN.dbcTrabNombre.Text := dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text;
      SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
      fraNomencladorAut.Siniestro         := SinEdit.SiniestroClass;
      edSiniDiagnostico.Text              := dlgBusqSini.sdqBusquedaEX_DIAGNOSTICO.AsString;
      gtrabajo                            := ValorSqlEx('SELECT gp_nombre ' +
                                                         ' FROM mgp_gtrabajo, sex_expedientes ' +
                                                        ' WHERE ex_gtrabajo = gp_codigo ' +
                                                          ' AND ex_id = :IdExped ', [dlgBusqSini.sdqBusquedaEX_ID.AsInteger]);
      edSiniGTrabajo.Text                 := gtrabajo + Get_UsuGestor(dlgBusqSini.sdqBusquedaEX_ID.AsInteger, True);
      edSinTipo.Text                      := dlgBusqSini.sdqBusquedaTB_DESCRIPCION.AsString;
      if SinEdit.Recaida = 0 then
        edSiniFecha.Text := dlgBusqSini.sdqBusquedaEX_FECHAACCIDENTE.AsString
      else
        edSiniFecha.Text := dlgBusqSini.sdqBusquedaEX_FECHARECAIDA.AsString;

      CargarCkecks;
    end;
    SinEditSelect(nil);  // por Plan - SML
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmAutCarga.btnSalirClick(Sender: TObject);
begin
  if (SinEdit.Siniestro > 0) then
    if (MsgBox('¿ Desea guardar los cambios ?', MB_ICONQUESTION + MB_YESNO) = IDYES) and GuardarDatos then
      Close
    else
      Close
  else
    Close;
end;

procedure TfrmAutCarga.FormCreate(Sender: TObject);
begin
  vclextra.LockControls(meEspera, true);
  fraTrabajadorSIN.OnChange         := OnTrabajadorChange;
  fraTrabajadorSIN.Tercerizadoras   := EsUsuarioDeTercerizadora;
  fraGrupoTrabajo.VerGestor         := False;
  fraGrupoTrabajo.ExtraFields       := ', gp_excluirvalidar ';
  fraGrupoTrabajo.Enabled           := not(fraTrabajadorSIN.Tercerizadoras);
  deFecSolicitud.MaxDate            := StrToDate(ValorSql('SELECT TO_CHAR(SYSDATE, ''DD/MM/YYYY'') FROM DUAL'));
  deFecRecepcion.MaxDate            := deFecSolicitud.MaxDate;
  fraPrestacion.OnChange            := OnPrestacionChange;
  fraPrestacion.Showbajas           := False;
  fraPrestacion.ModoCarga           := True;
  fraPrestador.OnChange             := OnPrestadorChange;
  fraPrestador.ShowInvisibles       := False;
  fraPrestador.ShowNombreFanta      := True;
  with fraNomencladorAut do
  begin
    OnChange         := OnNomencladorChange;
    ShowPresup       := True;
    ShowAbonos       := False;
    FechaSolicitud   := DBDate;
    Vigencia         := DBDate;
    OcultarValorNulo := True;  // TK 21117
  end;
  //malditos data sources!
  fraPrestacion.cmbDescripcion.DataSource := fraPrestacion.dsDatos;
end;

function TfrmAutCarga.GuardarDatos: Boolean;
var
  Estado: Char;
  iCantHojas, NumAuto: Integer;
  sDestinoPapel, Sql: String;
begin
  Result := False;
  if Validar then
  begin
    BeginTrans;

    Sql     := 'SELECT TO_NUMBER(''0'' || MAX(au_numauto)) + 1' +
                ' FROM sau_autorizaciones ' +
               ' WHERE au_idexpediente = :IdExped ';

    NumAuto := ValorSqlIntegerEx(Sql, [IdExpediente]);
    //---------------------------------------------------------------------------------------------------------------//
    MostrarEstado('Guardando Datos...');
    try
      Sql :=
        'SELECT 1' +
         ' FROM SPI_PARTEINGRESO' +
        ' WHERE PI_SINIESTRO = ' + SinEdit.SiniestroSql +
          ' AND PI_ORDEN = ' + SinEdit.OrdenSql +
          ' AND PI_RECAIDA = ' + SinEdit.RecaidaSql;
      if not ExisteSql(Sql) then
      begin
        Estado := 'P'; //'T';    By Fede pedido por PAtlante   31/01/2002
        MsgBox('ATENCION: El siniestro seleccionado no tiene parte de ingreso.', MB_ICONINFORMATION);

        Sql :=
          'SELECT 1' +
           ' FROM SDO_DOCUMUTUAL' +
          ' WHERE DO_SINIESTRO = ' + SinEdit.SiniestroSql +
            ' AND DO_ORDEN = ' + SinEdit.OrdenSql +
            ' AND DO_RECAIDA = ' + SinEdit.RecaidaSql +
            ' AND DO_NUMERO = ' + SqlInt(NumAuto);
        if not ExisteSql(Sql) then
        begin
          Sql :=
            'INSERT INTO SDO_DOCUMUTUAL(DO_SINIESTRO, DO_ORDEN, DO_RECAIDA, DO_NUMERO, DO_MODULO, DO_DOCUMENTO,' +
                                      ' DO_FECHAALTA, DO_DESTINATARIO, DO_PRESTADOR, DO_USUALTA)' +
                              ' VALUES (' + SinEdit.SiniestroSql + ', ' + SinEdit.OrdenSql + ', ' +
                                            SinEdit.RecaidaSql + ', ' + SqlInt(NumAuto) + ', ''A'', ''004'', ACTUALDATE, ''P'', ' +
                                            IntToStr(fraPrestador.IDPrestador) + ', ' + SqlValue(Sesion.UserID) + ')';
          EjecutarSqlST(Sql);
        end;
      end
      else
        Estado := 'P';

      Sql :=
        'INSERT INTO SAU_AUTORIZACIONES(au_siniestro, au_orden, au_recaida, au_numauto, au_identifprestador,' +
                                      ' au_fechasoli, au_fecharecep, au_pressol, au_cantidad, au_tiempoespera, au_importe,' +
                                      ' au_fechadesde, au_fechahasta, au_estado, au_usualta, au_fechaalta, au_detalle,' +
                                      ' au_trabajo, au_medico, au_turno, au_turnohora, au_subprest, au_diasdevol,' +
                                      ' au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, au_idpresupuesto,' +
                                      ' au_fechacarga, au_numautorela)' +
                              ' VALUES ( ' + SinEdit.SiniestroSql + ', ' + SinEdit.OrdenSql + ', ' +
                                             SinEdit.RecaidaSql + ', ' + SqlInt(NumAuto) + ', ' + '0' +
                                             IntToStr(fraPrestador.IDPrestador) + ', ' + deFecSolicitud.SqlText + ', ' +
                                             deFecRecepcion.SqlText  + ', ' +
                                             SqlString(fraPrestacion.edCodigo.Text, True) + ', 0' +
                                             SqlNumber(edCantidad.Text) + ', ' + SqlValue(meEspera.Text) + ', ' + SqlNumber(edImporte.Value) + ', ' +
                                             deFecDesde.SqlText  + ', ' + deFecHasta.SqlText  + ', ''' + Estado + ''', ' +
                                             SqlValue(Sesion.UserID) + ', ActualDate, ' +
                                             SqlString(memoDetalle.Lines.Text, True) + ', ' +
                                             SqlString(fraGrupoTrabajo.ID, True) + ', ' +
                                             SqlString(edMedico.Text, True) + ', ' + edFechaTurno.SqlText + ',' +
                                             'Utiles.IIF_CHAR(''' + edHoraTurno.Text + ''',''  :  '', null, ''' +
                                             edHoraTurno.Text + '''), ''' + fraSubprestacion.edCodigo.Text + ''',' +
                                             edDiasDevol.Text + ', ' +
                                             SqlString(fraNomencladorAut.Nomenclador, True, True) + ', ' +
                                             SqlString(fraNomencladorAut.Capitulo, True, True) + ', ' +
                                             SqlString(fraNomencladorAut.Codigo, True, True) + ', ' +
                                             SqlInt(fraNomencladorAut.sdqDatosIDPRESUP.AsInteger, True) + ', SysDate ' + ', ' +
                                             sqlvalue(cbNumAuto.Text) + ') ';
      EjecutarSqlST(Sql);

      if (fraPrestacion.sdqDatosPR_REQUIERETURNOS.AsString = 'S') then
        DoTurnosPrestaciones(NumAuto);

      DoInsertarPrestaciones(NumAuto);

      Result := True;
      iCantHojas := 0;
      if (ValorSQL('SELECT count(*)' +
                    ' FROM dlg_delegaciones' +
                   ' WHERE lg_sistemaarchivo = ''S''' +
                     ' AND lg_codigo = ' + Sesion.Delegacion) > 0) then
      begin
        frmDestinoPapel := TfrmDestinoPapel.Create(Self);
        try
          frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: AUP';
          frmDestinoPapel.Showmodal;
          sDestinoPapel := frmDestinoPapel.DestinoPapel;
          iCantHojas    := frmDestinoPapel.CantHojas;
        finally
          FreeAndNil(frmDestinoPapel);
        end;
      end;

      //By Rama (21/03/2002)
      if not (sDestinoPapel='') and (sDestinoPapel <> DP_SINPAPEL) then
        Do_Actualizar_Archivo_Sin(False, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), sDestinoPapel, iCantHojas, Sesion.UserID, 'AUP', 0, 'A', NumAuto);

      if (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') then
        VerTraslados
      else  // si la prestacion no es un traslado, le da commit, sino lo hará en la unidad de traslados.
        CommitTrans;
    except
      on E: Exception do
      begin
        if InTransaction then
          Rollback;
        ErrorMsg(E);
        Result := False;
      end;
    end;
    MostrarEstado('*');
  end;
end;

function TfrmAutCarga.Validar: Boolean;
var
  Sql, sLeyendaTopeado: String;
  valormultiplo: integer;
  bJustifica: boolean;
  cCantidad:Currency;
begin
  valormultiplo := 0;
  Sql := 'SELECT 1' +
          ' FROM sex_expedientes' +
         ' WHERE ex_siniestro = ' + SinEdit.SiniestroSql +
           ' AND ex_orden = ' + SinEdit.OrdenSql +
           ' AND ex_recaida = ' + SinEdit.RecaidaSql;

  if (fraPrestacion.edCodigo.Text <> '') then
    valormultiplo := ValorSqlEx('select pr_cantidadmultiplo from art.mpr_prestaciones where pr_codigo = :cod',
                     [fraPrestacion.edCodigo.Text]);

  Result := False;
  if (SinEdit.Siniestro + SinEdit.Orden + SinEdit.Recaida = 0) then
    InvalidMsg(SinEdit, 'No se ha cargado el Siniestro, Orden o Recaída.')

  else if not ExisteSql(Sql) then
    InvalidMsg(SinEdit, 'No existe el Siniestro Seleccionado.')

  else if (fraprestacion.sdqDatosPR_CODIGO.AsString <> '449800') and
           EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'C', sLeyendaTopeado) and
           not((fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') and (Sesion.Sector = 'CEM')) then // Plan Tope de Siniestros por CIE-10
      InvalidMsg(SinEdit, sLeyendaTopeado)

  else if (fraprestacion.sdqDatosPR_CODIGO.AsString <> '449800') and
           EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'A', sLeyendaTopeado) and
           not((fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') and (Sesion.Sector = 'CEM')) then // Plan Tope de Siniestros por Autorizaciones
    InvalidMsg(SinEdit, sLeyendaTopeado)

  else if (fraprestacion.sdqDatosPR_CODIGO.AsString <> '449800') and
          (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') and EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'T', sLeyendaTopeado) and
           not((fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') and (Sesion.Sector = 'CEM')) then // Plan Tope de Siniestros por Traslados
    InvalidMsg(SinEdit, sLeyendaTopeado)

  else if (fraprestacion.sdqDatosPR_CODIGO.AsString <> '449800') and
          (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'F') and EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'F', sLeyendaTopeado) and
           not((fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'F') and (Sesion.Sector = 'CEM')) then // Plan Tope de Siniestros por FKT
    InvalidMsg(SinEdit, sLeyendaTopeado)

  else if (fraPrestador.IDPrestador = 0) then
    InvalidMsg(fraPrestador, 'El Prestador es obligatorio.')

  else if (deFecSolicitud.Date = 0) then
    InvalidMsg(deFecSolicitud, 'La Fecha de Solicitud es obligatoria.')

  {else if not Validar_FecSolicitud_AltaPrestador(deFecSolicitud.Date, fraPrestador.IDPrestador, dFechaAltaPrestador) then      // TK 40001
    InvalidMsg(deFecSolicitud, 'La Fecha de Solicitud no puede ser anterior a la fecha de alta del Prestador.' + #13#10 +
                               '(Fecha de alta del Prestador: ' + DateToStr(dFechaAltaPrestador) +')') }    // Validación anulada por ticket 40668

  else if (deFecRecepcion.Date = 0) then
    InvalidMsg(deFecRecepcion, 'La Fecha de Recepción es obligatoria.')

  else if (fraPrestacion.edCodigo.Text = '') then
    InvalidMsg(fraPrestacion.edCodigo, 'El Tipo de Prestación es obligatorio.')

  else if ((meEspera.Text = '  :  ') and (fraPrestacion.sdqDatospr_canttiempo.AsString = 'S')) then
    InvalidMsg(meEspera, 'Es necesario especificar el tiempo de espera para esta prestación.')

  else if not ValidaPrestacionConCantidad(cCantidad) then        // TK 44010
    InvalidMsg(edCantidad, 'Para la prestación ' + fraPrestacion.cmbDescripcion.Text + ' la Cantidad debe ser ' + FloatToStr(cCantidad))

  else if (valormultiplo <> 0) and (strtoint(edCantidad.Text) mod valormultiplo <> 0) then            //si valormultiplo es = 0, la prestación no requiere validación de múltiplo en la cantidad
      InvalidMsg(edCantidad, 'La Cantidad debe ser múltiplo de ' + inttostr(valormultiplo) + ' para la prestación seleccionada')      //DFG - 13/12/2011

  else if (edCantidad.Value = 0) then
    InvalidMsg(edCantidad, 'La Cantidad debe ser mayor a cero.')

  else if fraGrupoTrabajo.IsEmpty then
    InvalidMsg(fraGrupoTrabajo, 'El Grupo de Trabajo es obligatorio.')

  else if not ValidarInvestigacion(IdExpediente) then
    InvalidMsg(fraPrestacion, 'El siniestro ya posee una Investigación Administrativa.')

  else if not ValidarAltaMedica then
    InvalidMsg(deFecSolicitud, 'La Fecha de Solicitud no puede ser mayor que el Álta Médica.')

  else if not ValidarReqTraslado then
    InvalidMsg(fraPrestacion.edCodigo, 'Auditoría de Provincia ART no amerita traslado en remis para el siniestro seleccionado.')

  else if (lvRelaciones.Items.Count > 0) and not(fraNomencladorAut.IsSelected) then
    InvalidMsg(fraNomencladorAut, 'Si incluye prestaciones, debe seleccionar la prestación principal')

  else if (fraPrestacion.sdqDatosPR_PERMITEESPERA.AsString = 'N') and
           ExisteSqlEx(' SELECT 1 ' +
                         ' FROM art.son_nomenclador ' +
                        ' WHERE on_nomenclador = ''1'' ' +
                          ' AND on_capitulo = ''MT'' ' +
                          ' AND on_codigo like ''1.03%'' ' +
                          ' AND on_nomenclador = :nom ' +
                          ' AND on_capitulo = :cap ' +
                          ' AND on_codigo = :cod ', [fraNomencladorAut.Nomenclador, fraNomencladorAut.Capitulo, fraNomencladorAut.Codigo]) then
    InvalidMsg(fraNomencladorAut, 'No se pueden asignar prestaciones de ''Espera'' al tipo de prestación seleccionado')


  else if not Validar_SML_CargaAut then
    InvalidMsg(fraPrestacion, 'Usted no posee permiso para cargar este tipo de autorización en este siniestro')

 { else if Prestacion_ExigeTurno(fraPrestacion.sdqDatos.FieldByName('PR_CODIGO').AsString) and    // TK 15891    // Este ticket fue anulado por el 16226 (Rocio Rodriguez)
       (TRIM(edFechaTurno.Text) = '/  /') then        // <-- tuve que poner eso, porque esto: (edFechaTurno.Date = 0) no anda ...
    InvalidMsg(edFechaTurno, 'El Turno es obligatorio para esta Prestación')          }


  else if (edFechaTurno.Date <> 0) and (edHoraTurno.Text <> '') and  {Validación de Repetidos.by Lu. (Esta validación debe ir última, por usar datos arriba validados}
          ExisteSql('SELECT 1' +
                     ' FROM sau_autorizaciones' +
                    ' WHERE au_idexpediente  = ' + SqlInt(IdExpediente) +
                      ' AND nvl(au_identifapro,au_identifprestador) = ' + IntToStr(fraPrestador.IDPrestador) +
                      ' AND nvl(au_presapro,au_pressol) = ' + SqlString(fraPrestacion.edCodigo.Text, True) +
                      ' AND au_turno = ' + edFechaTurno.SqlText +
                      ' AND au_turnohora = ' + SqlString(edHoraTurno.Text, True) +
                      ' AND au_estado not in (''R'', ''U'', ''N'', ''V'')') then
    InvalidMsg(fraPrestador, 'Ya existe una Autorización solicitada con el mismo Turno.')

  else if (fraPrestacion.edCodigo.Text = PRES_ESPERA_REMIS) and
          ((edFechaTurno.IsEmpty) or (edHoraTurno.Text = '  :  ') or (cbNumAuto.Text = '')) then
    InvalidMsg(edFechaTurno, 'Para prestaciones de Espera en remis debe ingresar turno, hora y número de autorización correspondiente')

  else if ConfirmaCantidad(fraPrestacion.edCodigo.Text, IdExpediente, True, bJustifica) and ConfirmaTrasladoCIE10(IdExpediente) then
    Result := True;
end;

procedure TfrmAutCarga.Limpiar(QueLimpiar: TQueLimpiar);
begin
  if qlPrestador in QueLimpiar then
  begin
    fraPrestador.Limpiar;
    fraNomencladorAut.Prestador     := 0;
    fraNomencladorAut.PrestadorPres := 0;
  end;

  if qlTrabajador in QueLimpiar then
    fraTrabajadorSIN.Limpiar;
    
  if qlPrestacion in QueLimpiar then
  begin
    deFecSolicitud.ClearDate;
    deFecRecepcion.ClearDate;
    deFecDesde.ClearDate;
    deFecHasta.ClearDate;
    fraNomencladorAut.Limpiar;
    fraNomencladorAut.OnChange(Nil);
    edCantidad.Text      := '1';
    edCantidad.Enabled   := True;
    edDiasDevol.Text     := '0';
    edDiasDevol.Enabled  := True;
    edImporte.Clear;
    edImporte.Enabled    := True;
    edMedico.Text        := '';
    memoDetalle.Text     := '';
    fraGrupoTrabajo.Clear;
    fraPrestacion.Limpiar;
    DoHabilitarMultiples;
    fraSubprestacion.Limpiar;
  end;
  
  if qlSiniestro in QueLimpiar then
  begin
    SinEdit.Clear;
    edSiniFecha.Text        := '';
    edSiniDiagnostico.Text  := '';
    edSiniGTrabajo.TExt     := '';
    edSinTipo.Text          := '';

    chkComMed.Checked       := False;
    chkSRT.Checked          := False;

    btnSiniMasDatos.Enabled := False;
    btnHistoria.Enabled     := False;

    HabilitarTituloConfidencial(Self, TimerConfidencial, '');  { by NWK, 27/03/03 }
    gSiniestro := 0;  // Lu 19/09/2008
    gOrden     := 0;
    gRecaida   := 0;
    fraNomencladorAut.Siniestro := EmptySiniestro;
  end;

  if fraNomencladorAut.sdqDatos.Active then
    fraNomencladorAut.sdqDatos.Close;

  meEspera.Text := '';
  vclextra.LockControls(meEspera, true);
end;

procedure TfrmAutCarga.btnPrestacionClick(Sender: TObject);
begin
  if GuardarDatos then
  begin
    Limpiar([qlPrestacion]);
    deFecSolicitud.SetFocus;
  end;
end;

procedure TfrmAutCarga.btnAutoXPacienteClick(Sender: TObject);
begin
  if GuardarDatos then
  begin
    Limpiar([qlPrestacion, qlPrestador]);
    fraPrestador.CuitFocus;
  end;
end;

procedure TfrmAutCarga.btnAutoXPrestadorClick(Sender: TObject);
begin
  IdExpediente := Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida); // Lu 19/09/2008.. lo asigno nuevamente porque pueden haber errores.
  if GuardarDatos then
  begin
    Limpiar([qlPrestacion, qlTrabajador, qlSiniestro]);
    SinEdit.SetFocus;
  end;
end;

procedure TfrmAutCarga.btnGuardarClick(Sender: TObject);
begin
  IdExpediente := Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida); // Lu 19/09/2008.. lo asigno nuevamente porque pueden haber errores.
  if GuardarDatos then
  begin
    DoEnviarAvisos;   // TK 12918
    Limpiar([qlPrestador, qlTrabajador, qlSiniestro, qlPrestacion]);
    if edFechaTurno.Enabled then
      edFechaTurno.ClearDate;
    if edHoraTurno.Enabled then
      edHoraTurno.Clear;

    cbNumAuto.Clear;
    SinEdit.SetFocus;
  end;
end;

procedure TfrmAutCarga.btnLimpiarClick(Sender: TObject);
begin
  Limpiar([qlPrestador, qlTrabajador, qlSiniestro, qlPrestacion]);
  if edFechaTurno.Enabled then
    edFechaTurno.ClearDate;
  if edHoraTurno.Enabled then
    edHoraTurno.Clear;

  cbNumAuto.Clear;   

  SinEdit.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnTrabajadorClick(Sender: TObject);
begin
  if not SinEdit.IsEmpty then
    with TfrmContratoTrabajador.Create(Self) do
    try
      CargarDatosTrabajador(IdTrabajador,
                            ValorSQLIntegerEx('SELECT rl_id ' +
                                               ' FROM crl_relacionlaboral ' +
                                              ' WHERE rl_contrato = :CONTRATO ' +
                                                ' AND rl_idtrabajador = :IDTRABAJADOR',
                                                     [Contrato, IdTrabajador]));
      ShowModal;
      fraTrabajadorSIN.Cargar(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnSiniMasDatosClick(Sender: TObject);
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.edCantidadExit(Sender: TObject);
begin
  // Habilita o deshabilita las fechas
  if edCantidad.Value > 1 then
  begin
    deFecDesde.Enabled  := True;
    deFecHasta.Enabled  := True;
  end
  else begin
    if deFecDesde.Focused then edImporte.SetFocus;
    deFecDesde.Enabled  := False;
    deFecHasta.Enabled  := False;
    deFecDesde.ClearDate;
    deFecHasta.ClearDate;
  end;
  SetValor;
  DoBloquearValor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.edCantidadEnter(Sender: TObject);
begin
  // Habilita o deshabilita las fechas para que se les pueda pasar el foco
  deFecDesde.Enabled  := True;
  deFecHasta.Enabled  := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.SinEditSelect(Sender: TObject);
var
  sMensaje, sCausaFin, sSql :String;
  bFaltaCeseILT: Boolean;
begin
  IdExpediente := 0;
  IdTrabajador := 0;
  Contrato     := 0;

  sMensaje := Get_ExisteSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
                                  fraTrabajadorSIN.Tercerizadoras);
  if (sMensaje <> '') then
  begin
    InfoHint(SinEdit, sMensaje);
    btnLimpiarClick(nil);
  end
  else if not Validar_SML(Sesion.UserID, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then  // Plan - SML
  begin
    InfoHint(SinEdit, 'Usted no posee permisos para visualizar este siniestro.');
    btnLimpiarClick(nil);
    fraTrabajadorSIN.Limpiar;
  end
  else if not ValidarSiniestroGCBA then
  begin
    InfoHint(SinEdit, 'Usted no posee permisos para cargar autorizaciones a este siniestro.');
    btnLimpiarClick(nil);
    fraTrabajadorSIN.Limpiar;
  end
  else begin
    fraNomencladorAut.Limpiar;
    fraNomencladorAut.OnChange(Sender);
    sSql :=  'SELECT tj_cuil, tj_nombre, ex_fechaaccidente, ex_diagnostico, ex_fecharecaida, ' +
                   ' ex_causafin, tb_descripcion, ex_gtrabajo, gp_nombre, ex_cuit, ' +
                   ' ex_suspensionplazo, ex_id, ex_contrato, tj_id ' +
              ' FROM ctb_tablas, sex_expedientes, ' +
                   ' ctj_trabajador, mgp_gtrabajo ' +
             ' WHERE tj_id = ex_idtrabajador ' +
               ' AND ex_gtrabajo = gp_codigo(+) ' +
               ' AND ex_siniestro = :sin ' +
               ' AND ex_orden = :ord ' +
               ' AND ex_recaida = :reca ' +
               ' AND NVL(LTRIM(ex_tipo), ''1'') = tb_codigo(+) ' +
               ' AND tb_clave = ''STIPO''';
    with GetQueryEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) do
    try
      if Eof then
      begin
        MostrarEstado('ERROR : Siniestro no encontrado...');
        ChkDialog('AutCarga-SiniNoEncot', 'No se ha encontrado el siniestro solicitado.');
        fraNomencladorAut.Siniestro := EmptySiniestro;
        btnSiniMasDatos.Enabled     := False;
        btnHistoria.Enabled         := False;
      end
      else begin
        sCausaFin := FieldByName('ex_causafin').AsString;
        if AreIn(sCausaFin, ['95', '99']) then
        begin
          MessageDlg('No se puede autorizar un siniestro cerrado por error de carga.', mtWarning, [mbOK], 0);
          Limpiar([qlSiniestro, qlTrabajador]);
          SinEdit.SetFocus;
          Exit;
        end
        else if (sCausaFin = '02') then
          MsgBox('El siniestro seleccionado ha sido Rechazado.', MB_ICONINFORMATION)
        else if (FieldByName('ex_suspensionplazo').AsString = 'S') then
          MsgBox('El siniestro seleccionado se encuentra Suspendido.', MB_ICONINFORMATION);
        //--------------------------------------------------------------------------------------------------------------
        if SinEdit.Recaida = 0 then
          edSiniFecha.Text := FieldByName('ex_fechaaccidente').AsString
        else
          edSiniFecha.Text := FieldByName('ex_fecharecaida').AsString;
        //--[ Para la Validació de la fecha]----------------------------------------------------------------------------
        if IsDate(edSiniFecha.Text) then
          deFecSolicitud.MinDate := StrToDate(edSiniFecha.Text)
        else
          deFecSolicitud.MinDate := StrToDate(FechaInicioART);
        //--------------------------------------------------------------------------------------------------------------
        edSiniDiagnostico.Text              := FieldByName('ex_diagnostico').AsString;
        edSiniGTrabajo.Text                 := FieldByName('gp_nombre').AsString +
                                               Get_UsuGestor(FieldByName('ex_id').AsInteger, True);
        edSinTipo.Text                      := FieldByName('tb_descripcion').AsString;
        fraTrabajadorSIN.mskTrabCUIL.Text   := FieldByName('tj_cuil').AsString;
        fraTrabajadorSIN.dbcTrabNombre.Text := FieldByName('tj_nombre').AsString;
        fraGrupoTrabajo.Codigo              := FieldByName('ex_gtrabajo').AsString;
        fraNomencladorAut.Siniestro         := SinEdit.SiniestroClass;
        IdExpediente                        := FieldByName('ex_id').AsInteger;
        IdTrabajador                        := FieldByName('tj_id').AsInteger;
        Contrato                            := FieldByName('ex_contrato').AsInteger;        
        gSiniestro                          := SinEdit.Siniestro;    // Lu 19/09
        gOrden                              := SinEdit.Orden;
        gRecaida                            := SinEdit.Recaida;
        CargarCkecks;
        HabilitarTituloConfidencial(Self, TimerConfidencial, FieldByName('ex_cuit').AsString);  { by NWK, 27/03/03 }

        btnSiniMasDatos.Enabled := True;
        btnHistoria.Enabled     := Seguridad.Activar(btnHistoria);
        fraPrestador.IDPrestadorFocus;
      end;
    finally
      Free;
    end;
    //---- [Mensaje de porc. de incapacidad] --by Lu 22/06/01-----------------------------------------------------
    with GetQueryEx('SELECT tb_descripcion, ev_porcincapacidad' +
                     ' FROM sev_eventosdetramite, ctb_tablas' +
                    ' WHERE ev_evento = art.amebpba.get_incapacidades(ev_siniestro,ev_orden)' +
                      ' AND ev_siniestro = :sin ' +
                      ' AND ev_orden = :ord ' +
                      ' AND tb_clave = ''EVTRA''' +
                      ' AND ev_codigo = tb_codigo', [SinEdit.Siniestro, SinEdit.Orden]) do
    try
      if not(FieldByName('tb_descripcion').IsNull) and
         not(FieldByName('ev_porcincapacidad').IsNull) then
        sMensaje := FieldByName('tb_descripcion').AsString + #13 +
                    'Porcentaje de Incapacidad: ' + FieldByName('ev_porcincapacidad').AsString + '%';
    finally
       Free;
    end;

    bFaltaCeseILT := (sCausaFin <> '02') and
                     (ValorSqlEx('SELECT NVL(ex_fechaceseilt, '''') ' +
                                  ' FROM sex_expedientes, sin.spe_partedeegreso ' +
                                 ' WHERE ex_id = pe_idexpediente ' +
                                   ' AND pe_fechaaltalaboral IS NOT NULL ' +
                                   ' AND pe_fechaaltalaboral > TO_DATE(''' + '01/01/2008' + ''',''DD/MM/YYYY'') ' +
                                   ' AND ex_siniestro = :Sini ' +
                                   ' AND ex_orden = :Ord ' +
                                   ' AND ex_recaida = :Reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida], '1') = '');

    if bFaltaCeseILT then sMensaje := sMensaje + #13 + 'Falta formulario de cese de ILT';

    if (sMensaje <> '') then MsgBox(sMensaje, MB_ICONQUESTION);
  end; {del else}
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnHistoriaClick(Sender: TObject);
begin
  with SinEdit do
    frmPrincipal.ShowHistorias(Siniestro, Orden, Recaida);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.OnTrabajadorChange(Sender: TObject);
begin
  with fraTrabajadorSIN do
    SinEdit.SetValues(sdqTrabajadorEX_SINIESTRO.AsInteger, sdqTrabajadorEX_ORDEN.AsInteger,
                      sdqTrabajadorEX_RECAIDA.AsInteger);
  SinEditSelect(nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.CargarCkecks;
begin
  chkComMed.Checked := (ValorSqlEx('SELECT art.inca.is_dictamencommed(:Sin, :Ord) ' +
                                    ' FROM dual', [SinEdit.Siniestro, SinEdit.Orden]) = 'S');

  chkSRT.Checked := ExisteSql('SELECT 1' +
                               ' FROM sdg_denunciasgraves' +
                              ' WHERE dg_siniestro = ' + SinEdit.SiniestroSql +
                                ' AND dg_orden = ' + SinEdit.OrdenSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.edHoraTurnoExit(Sender: TObject);
begin
  if (edHoraTurno.Text <> '  :  ') and (not IsTime(edHoraTurno.Text)) then
  begin
    MsgBox('La hora ingresada es inválida.', MB_ICONEXCLAMATION);
    edHoraTurno.Text := '';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.VerTraslados;
var
  frmTraslados: TfrmTraslados;
  NumAuto: Integer;
begin
  NumAuto := ValorSqlInteger('SELECT max(au_numauto)' +
                              ' FROM sau_autorizaciones' +
                             ' WHERE au_siniestro = ' + SinEdit.SiniestroS +
                               ' AND au_orden = ' + SinEdit.OrdenS +
                               ' AND au_recaida = ' + SinEdit.RecaidaS);
  frmTraslados := TfrmTraslados.Create(Self);
  with frmTraslados do
  try
    IDPrestador := fraPrestador.IDPrestador;
    Cargar(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, NumAuto, fraTrabajadorSIN.mskTrabCUIL.Text,
           fraTrabajadorSIN.dbcTrabNombre.Text, fraPrestacion.edCodigo.Text);
    btnAceptar.Caption    := unTraslados.MODO_CARGA;
    cmbTurnoFecha.Mindate := deFecRecepcion.Date;
    ShowModal;
  finally
    Free;
  end
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.OnPrestacionChange(Sender: TObject);
var
  bEsTraslado :Boolean;
begin
  bEsTraslado := (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T');

  if bEsTraslado or (fraPrestacion.sdqDatosPR_REQUIERETURNOS.AsString = 'S') then
  begin
    fraSubPrestacion.Enabled := False;
    edFechaTurno.Enabled     := False;
    edHoraTurno.Enabled      := False;
    edDiasDevol.Enabled      := False;
    edImporte.Enabled        := False;
  end
  else begin
    fraSubPrestacion.Enabled := True;
    edFechaTurno.Enabled     := True;
    edHoraTurno.Enabled      := True;
    edDiasDevol.Enabled      := True;
    edImporte.Enabled        := True;
  end;
  edCantidad.Enabled         := not bEsTraslado;
  DoHabilitarMultiples;

  fraPrestador.Modified      := False;
  fraPrestacion.Modified     := False;
  fraSubPrestacion.Modified  := False;
  edCantidad.Modified        := False;
  edDiasDevol.Modified       := False;
  edImporte.Modified         := False;
  edFechaTurno.Modified      := False;

end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.OnPrestadorChange(Sender: TObject);
begin
  fraNomencladorAut.Prestador := fraPrestador.Value;
  lbPrestacion.Font.Color := IIF(fraNomencladorAut.ExigePrestacion, clRed, clWindowText);
// EJV (15/08/2002) Cuando el Valor ya esta calculado no se puede tocar.
  edImporte.Clear;
  edImporte.Enabled  := True;
  edImporte.ReadOnly := False;
  edImporte.Color    := clWindow;
// EJV (Fin)
  if fraPrestador.IsSelected and not IsEmptyString(fraPrestador.InfoUtil) then
    InfoHint(fraPrestador, fraPrestador.InfoUtil, False, 'Información', blnInfo, 15, False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.OnNomencladorChange(Sender: TObject);
begin
  DoCargarRelaciones;
  DoBloquearValor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.fraNomencladorAutExit(Sender: TObject);
begin
  fraNomencladorAut.FrameExit(Sender);
  DoCargarRelaciones;
  DoBloquearValor;
end;
{-------------------------------------------------------------------------------}
{ by NWK, 27/03/03 }
procedure TfrmAutCarga.TimerConfidencialTimer(Sender: TObject);
begin
  Caption := GetTituloPantallaConfidencial(Caption, False);
end;
{-------------------------------------------------------------------------------}
{ CAMARILLO, 05/2007, carga el grupo de trabajo de la prestacion por defecto, si no tiene, carga el del siniestro}
procedure TfrmAutCarga.fraPrestacionExit(Sender: TObject);
var
  sSql: String;
begin
  fraPrestacion.FrameExit(Sender);
  if not(fraPrestacion.sdqDatosPR_GTRABAJO.IsNull) then
    fraGrupoTrabajo.Codigo := fraPrestacion.sdqDatosPR_GTRABAJO.AsString
  else if not(SinEdit.IsEmpty) then
  begin
    sSql := 'SELECT ex_gtrabajo ' +
             ' FROM sex_expedientes' +
            ' WHERE ex_siniestro = :Sin ' +
              ' AND ex_orden =  :Ord ' +
              ' AND ex_recaida = :Reca ';
    fraGrupoTrabajo.Codigo := ValorSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
  end;
  DoHabilitarMultiples;

  if fraprestacion.sdqDatospr_canttiempo.AsString = 'S' then    //DFG 91111
    vclextra.LockControls( meEspera, false)
  else
  begin
    meespera.Text := '  :  ';
    vclextra.LockControls( meEspera, true);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.ValidarAltaMedica: Boolean;
var
  bResult: Boolean;
  sSql: String;
begin
  if (fraGrupoTrabajo.sdqDatos.FieldByName('gp_excluirvalidar').AsString = 'S') or //excluyo recalificacion e incapacidades
     (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'I') or  //tambien se excluyen todas las invest. administrativas
     (fraPrestacion.sdqDatosPR_EXCLUYEVALIDFECHAS.AsString = 'S')  // por TK 55111
     then
    bResult := True
  else if (fraPrestacion.sdqDatosPR_FORMULARIO.AsString <> 'T') then
  begin
    sSql := 'SELECT 1' +
             ' FROM sex_expedientes, sin.spe_partedeegreso, mgp_gtrabajo ' +
            ' WHERE ex_id = pe_idexpediente' +
              ' AND ex_siniestro = ' + SinEdit.SiniestroSql +
              ' AND ex_orden = ' + SinEdit.OrdenSql +
              ' AND ex_recaida = ' + SinEdit.RecaidaSql +
              ' AND ex_altamedica IS NOT NULL' +
              ' AND ex_altamedica < ' + SqlDate(deFecSolicitud.Date) +
              ' AND ex_gtrabajo = gp_codigo ' +
              ' AND gp_excluirvalidar = ''N'' ' +
              ' AND pe_tratamiento = ''N''' +
              ' AND pe_recalificacion = ''N'' ';
    bResult := not ExisteSql(sSql);
  end
  else begin
    sSql := 'SELECT 1' +
             ' FROM sex_expedientes, sin.spe_partedeegreso, mgp_gtrabajo ' +
            ' WHERE ex_id = pe_idexpediente' +
              ' AND ex_siniestro = ' + SinEdit.SiniestroSql +
              ' AND ex_orden = ' + SinEdit.OrdenSql +
              ' AND ex_recaida = ' + SinEdit.RecaidaSql +
              ' AND ex_altamedica IS NOT NULL' +
              ' AND ex_altamedica < ' + SqlDate(deFecSolicitud.Date) +
              ' AND ex_gtrabajo = gp_codigo ' +
              ' AND gp_excluirvalidar = ''N'' ' +
              ' AND pe_tratamiento = ''N'' ' +
              ' AND ((pe_recalificacion = ''N'')' +
               ' OR ((pe_recalificacion = ''S'') AND (siniestro.is_altareca(ex_siniestro, ex_orden, ex_recaida) = ''S'')))';
    bResult := not ExisteSql(sSql);
  end;
  Result := bResult;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnCalendarioClick(Sender: TObject);
begin
  if SinEdit.IsEmpty then exit;

  with frmCalendarioPrestacional do
  begin
    if not(Assigned(frmCalendarioPrestacional)) then
    begin
      frmCalendarioPrestacional := TfrmCalendarioPrestacional.Create(Self);
      FormStyle                 := fsMDIChild;
    end;
    IdExpediente := Self.IdExpediente;
    Show;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoTurnosPrestaciones(NumAuto :Integer);
begin
  with TfrmAutTurnos.Create(Self) do
  try
    TipoCarga       := tcAlta;
    sEstado         := 'P';
    IdExpediente    := Self.IdExpediente;
    IdAutorizacion  := ValorSqlIntegerEx('SELECT au_id FROM sau_autorizaciones ' +
                                         ' WHERE au_siniestro = :Sini' +
                                           ' AND au_orden = :Ord ' +
                                           ' AND au_recaida = :Reca ' +
                                           ' AND au_numauto = :Aut',
                                           [Self.SinEdit.Siniestro, Self.SinEdit.Orden,
                                            Self.SinEdit.Recaida, NumAuto]);
    edPrestador.Text := IntToStr(Self.fraPrestador.IDPrestador) + ' - ' +
                        Self.fraPrestador.RazonSocial;
    fraPrestacion.Cargar(Self.fraPrestacion.edCodigo.Text);
    ShowModal;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.SinEditExit(Sender: TObject);
begin
  if (gSiniestro <> SinEdit.Siniestro) or
     (gOrden <> SinEdit.Orden) or
     (gRecaida <> SinEdit.Recaida) then   // Si cambio el nro de siniestro, entonces vuelvo a realizar el SinEditSelect (para validar todo nuevamente)
     SinEditSelect(nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoCargarRelaciones;
var
  sSql :String;
  i :Integer;
begin
  SetValor;
  if btnAgregarSubPr.Enabled then
  begin
    for i := 0 to lvRelaciones.Items.Count - 1 do
      if StrToInt(lvRelaciones.Items[i].Caption) = fraNomencladorAut.IdNomenclador then
      begin
        fraNomencladorAut.Limpiar;
        Verificar(True, fraNomencladorAut, 'La prestación ya ha sido agregada');
      end;
  end
  else begin
    lvRelaciones.Items.BeginUpdate;
    lvRelaciones.Items.Clear;
    sSql := 'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion ' +
             ' FROM son_nomenclador, SIN.sgp_gruposprestaciones, SIN.spg_prestacionesxgrupo a ' +
            ' WHERE gp_id = a.pg_idgrupo ' +
              ' AND on_id = a.pg_idnomenclador ' +
              ' AND a.pg_fechabaja IS NULL ' +
              ' AND gp_fechabaja IS NULL ' +
              ' AND art.amebpba.get_admitesubprestaciones(:IdPres) = ''S'' ' +
              ' AND a.pg_idgrupo IN(SELECT b.pg_idgrupo ' +
                                    ' FROM SIN.spg_prestacionesxgrupo b ' +
                                   ' WHERE b.pg_idgrupo = a.pg_idgrupo ' +
                                     ' AND b.pg_idnomenclador <> a.pg_idnomenclador ' +
                                     ' AND b.pg_fechabaja IS NULL ' +
                                     ' AND b.pg_idnomenclador = :IdNom) ';
    with GetQueryEx(sSql, [fraNomencladorAut.Prestador, fraNomencladorAut.IdNomenclador]) do
    try
      while not Eof do
      begin
        with lvRelaciones.Items.Add do
        begin
          Caption := FieldByName('on_id').AsString;
          SubItems.Add(FieldByName('on_nomenclador').AsString);
          SubItems.Add(FieldByName('on_capitulo').AsString);
          SubItems.Add(FieldByName('on_codigo').AsString);
          SubItems.Add(FieldByName('on_descripcion').AsString);
        end;
        Next;
      end;
    finally
      Free;
    end;
    lvRelaciones.Items.EndUpdate;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.lvRelacionesResize(Sender: TObject);
begin
  lvRelaciones.Columns.Items[0].Width := 0;
  lvRelaciones.Columns.Items[4].Width := lvRelaciones.Width - 180;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoBloquearValor;
begin
// EJV (15/08/2002) Cuando el Valor ya esta calculado no se puede tocar.
  if (edImporte.Value > 0) and (fraNomencladorAut.IdNomenclador > 0) then
  begin
    edImporte.Enabled  := False;
    edImporte.ReadOnly := True;
    edImporte.Color    := clInactiveCaption;
  end
  else begin
    edImporte.Enabled  := True;
    edImporte.ReadOnly := False;
    edImporte.Color    := clWindow;
  end;
// EJV (Fin)
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.SetValor;
var
  sSql, fecha :String;
  i :Integer;
  dValor :Double;
begin
  dValor := 0;
  if deFecSolicitud.IsEmpty then
    fecha := 'actualdate'
  else
    fecha := deFecSolicitud.SqlText;
    
  if (lvRelaciones.Items.Count > 0) then
    for i := 0 to lvRelaciones.Items.Count -1 do
    begin
      sSql := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestador.IDPrestador) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[0]) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[1]) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[2]) + ',' +
                                                             SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ',' +
                                                             SqlInt(SinEdit.Recaida) + ', ' + fecha + '), 0) FROM dual ';
      dValor := dValor + (ValorSql(sSql) * IIF(edCantidad.Value > 0, edCantidad.Value, 1));
    end;

  if (fraNomencladorAut.IdNomenclador > 0) then
  begin
    sSql := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestador.IDPrestador) + ',' +
                                                           SqlValue(fraNomencladorAut.Nomenclador) + ',' +
                                                           SqlValue(fraNomencladorAut.Capitulo) + ',' +
                                                           SqlValue(fraNomencladorAut.Codigo) + ',' +
                                                           SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ',' +
                                                           SqlInt(SinEdit.Recaida) + ', ' + fecha + '), 0) FROM dual ';
    dValor := dValor + (ValorSql(sSql) * IIF(edCantidad.Value > 0, edCantidad.Value, 1));
  end;
  edImporte.Value := dValor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoHabilitarMultiples;
begin
  btnAgregarSubPr.Enabled    := not(IsEmptyString(fraPrestacion.edCodigo.Text)) and
                                (fraPrestacion.sdqDatosPR_MULTIPLESPRESTACIONES.AsString = 'S');
  btnQuitarSubPr.Enabled     := not(IsEmptyString(fraPrestacion.edCodigo.Text)) and
                                (fraPrestacion.sdqDatosPR_MULTIPLESPRESTACIONES.AsString = 'S');
  lvRelaciones.Clear;
  fraNomencladorAut.Limpiar;
  fraNomencladorAut.OnChange(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnAgregarSubPrClick(Sender: TObject);
begin
  if fpAgregarRel.ShowModal = mrOk then
  begin
    lvRelaciones.Items.BeginUpdate;
    with lvRelaciones.Items.Add do
    begin
      Caption := IntToStr(fraNomencladorRel.IdNomenclador);
      SubItems.Add(fraNomencladorRel.sdqDatosON_NOMENCLADOR.AsString);
      SubItems.Add(fraNomencladorRel.sdqDatosON_CAPITULO.AsString);
      SubItems.Add(fraNomencladorRel.sdqDatosON_CODIGO.AsString);
      SubItems.Add(fraNomencladorRel.sdqDatosON_DESCRIPCION.AsString);
    end;
    lvRelaciones.Items.EndUpdate;
    SetValor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnQuitarSubPrClick(Sender: TObject);
begin
  if (lvRelaciones.SelCount > 0) then
  begin
    lvRelaciones.DeleteSelected;
    SetValor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoInsertarPrestaciones(NumAuto :Integer);
var
  sSql :String;
  i, IdAuto :Integer;
begin
  if (fraPrestacion.sdqDatosPR_MULTIPLESPRESTACIONES.AsString = 'S') and
     (lvRelaciones.Items.Count > 0) then
  begin
    IdAuto := ValorSqlIntegerEx('SELECT au_id FROM sau_autorizaciones ' +
                                ' WHERE au_siniestro = :Sini' +
                                  ' AND au_orden = :Ord ' +
                                  ' AND au_recaida = :Reca ' +
                                  ' AND au_numauto = :Aut',
                                  [Self.SinEdit.Siniestro, Self.SinEdit.Orden,
                                   Self.SinEdit.Recaida, NumAuto]);
    for i := 0 to lvRelaciones.Items.Count - 1 do
    begin
      sSql := 'INSERT INTO art.ppa_prestacionesxautorizacion ' +
              '(pa_idautorizacion, pa_idnomenclador, pa_automatico, pa_fechaalta, pa_usualta) VALUES (' +
               SqlInt(IdAuto) + ',' + SqlInt(StrToInt(lvRelaciones.Items[i].Caption)) + ',' +
              ' ''N'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
      EjecutarSqlST(sSql);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.btnAceptarRelClick(Sender: TObject);
var
  i :Integer;
begin
  Verificar(not fraNomencladorRel.IsSelected, fraNomencladorRel, 'Debe seleccionar la prestación.');
  Verificar(fraNomencladorAut.IdNomenclador = fraNomencladorRel.IdNomenclador, fraNomencladorRel,
            'La prestación ya pertenece a la autorización.');
  for i := 0 to lvRelaciones.Items.Count - 1 do
    if StrToInt(lvRelaciones.Items[i].Caption) = fraNomencladorRel.IdNomenclador then
      Verificar(True, fraNomencladorRel, 'La prestación ya ha sido agregada');
  fpAgregarRel.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.fpAgregarRelBeforeShow(Sender: TObject);
begin
  //copio todas las propiedades del otro fraNomenclador
  fraNomencladorRel.Prestador       := fraNomencladorAut.Prestador;
  fraNomencladorRel.ShowVigencias   := fraNomencladorAut.ShowVigencias;
  fraNomencladorRel.Siniestro       := fraNomencladorAut.Siniestro;
  fraNomencladorRel.FechaSolicitud  := fraNomencladorAut.FechaSolicitud;
  fraNomencladorRel.ShowPresup      := fraNomencladorAut.ShowPresup;
  fraNomencladorRel.ShowConsumidos  := fraNomencladorAut.ShowConsumidos;
  fraNomencladorRel.ExigePrestacion := fraNomencladorAut.ExigePrestacion;
  fraNomencladorRel.ShowAbonos      := fraNomencladorAut.ShowAbonos;
  fraNomencladorRel.Limpiar;
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.ConfirmaTrasladoCIE10(IdExpediente :Integer): Boolean;
var
  sVal :String;
begin
  if (fraPrestacion.sdqDatosPR_FORMULARIO.AsString = 'T') and
     (fraPrestacion.edCodigo.Text <> '449800') then
  begin
    sVal    := ValorSqlEx('SELECT NVL(dg_ameritatraslado, ''N'') ' +
                           ' FROM sex_expedientes, cdg_diagnostico ' +
                          ' WHERE ex_diagnosticooms = dg_codigo(+) ' +
                            ' AND ex_id = :IdExp ', [IdExpediente]);
    Result  := (sVal = 'S') or ((sVal = 'N') and
                MsgAsk('El diagnóstico del siniestro no amerita traslado, ¿Desea continuar?'));
  end
  else
    Result  := True;
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.ValidarReqTraslado: Boolean;
var
  bAmerita, bExcepcion: Boolean;
  sSql: String;
begin
  if (fraPrestacion.edCodigo.Text = '449100') then  //traslados en remis
  begin
    sSql       := 'SELECT NVL(ex_ameritaremis, ''S'') ' +
                   ' FROM sex_expedientes ' +
                  ' WHERE ex_id = :IdExped ';
    bAmerita   := (ValorSqlEx(sSql, [IdExpediente]) = 'S');
    bExcepcion := IIF(bAmerita, True, Get_AmeritaRemis(fraPrestador.IDPrestador, fraNomencladorAut.IdNomenclador) and
                                                       Seguridad.Claves.IsActive('CargaExcepcion'));
    Result     := bAmerita or bExcepcion or
                 (not(bAmerita) and Seguridad.Claves.IsActive('CargaTrasladoRemis') and
                  MsgAsk('Atención: está a punto de cargar un traslado en remis para un siniestro ' + chr(13) +
                         'que no lo amerita segun la Auditoría de Provincia ART, ¿Desea continuar?'));
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.DoEnviarAvisos;     // TK 12918    arreglo (29/12): lo quiere solo para la solapa Siniestros (Empresas no).
var
  sSiniDelPres: String;
begin
  sSiniDelPres := 'SELECT amebpba.is_siniestrodelprestador( ' +
                                SqlInt(IdExpediente) + ',' +
                                SqlInt(fraPrestador.IDPrestador) + ')' +
                   ' FROM dual';

  if (ValorSql(sSiniDelPres) = 'N') then
  begin
    showmessage('El siniestro no pertenece al prestador seleccionado. Se enviará un mail con el aviso correspondiente.');
    EjecutarStoreSTEX('amebpba.do_enviarmail_prestadorempresa(:idex, ''A'', ''S'', :idpres);', [IdExpediente, fraPrestador.IDPrestador])
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.ValidarInvestigacion(IdExpediente :Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM art.sau_autorizaciones, art.mpr_prestaciones ' +
          ' WHERE NVL(au_presapro, au_pressol) = pr_codigo ' +
            ' AND pr_formulario = ''I'' ' +
            ' AND au_estado IN (''D'', ''A'', ''C'', ''L'', ''E'') ' +
            ' AND au_idexpediente = :IdEx ';

  Result := (fraPrestacion.sdqDatosPR_FORMULARIO.AsString <> 'I') or
            Seguridad.Claves.IsActive('CargaInvAdmDuplicada') or
            not(ExisteSqlEx(sSql, [IdExpediente]));
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.deFecSolicitudExit(Sender: TObject);
begin
  fraNomencladorAut.Clear;
  fraNomencladorAut.Vigencia       := deFecSolicitud.Date;
  fraNomencladorAut.FechaSolicitud := deFecSolicitud.Date;

end;
{-------------------------------------------------------------------------------}
procedure TfrmAutCarga.meEsperaExit(Sender: TObject);
var horas, minutos: integer; cantidad: real;
begin
  if meEspera.Text <> '  :  ' then
  begin
    meEspera.Text := StringReplace(meEspera.Text, ' ', '0', [rfReplaceAll]);
    horas := StrToInt(LeftStr(meEspera.Text, 2));
    minutos := StrToInt(RightStr(meEspera.text, 2));
    cantidad := horas + minutos / 60;
    edCantidad.Text := FloatToStr(cantidad);
  end
  else
    edCantidad.text := '1';
  edCantidadExit(nil);
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.Validar_SML_CargaAut: Boolean;
var bEsTraslado, pPermisoCargaTrasladoSML, pPermisoCargaSML: boolean;
begin
  Result := True;

  bEsTraslado              := (ValorSqlEx('SELECT pr_formulario FROM art.mpr_prestaciones WHERE pr_codigo = :CodPrest', [fraPrestacion.edCodigo.Text]) = 'T');
  pPermisoCargaTrasladoSML := Seguridad.Claves.IsActive('CargaTrasladosSML');
  pPermisoCargaSML         := Seguridad.Claves.IsActive('CargaSML');    // TK 37842

  if Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida))  // Validacion del tipo de parte para siniestros SML
     and not Is_UsuarioSML(Sesion.UserID)
     and not Es_UsuarioSupervisor(Sesion.UserID)
     and not esSiniestroMixto(SinEdit.Siniestro, sinedit.Orden, sinedit.Recaida) then
  begin                                                                                         // TK 37842
    if not (Es_TipoPrestacionPermitida_Carga or (bEsTraslado and pPermisoCargaTrasladoSML) or pPermisoCargaSML) then
      Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAutCarga.Es_TipoPrestacionPermitida_Carga: Boolean;
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipoprestacionnosml(:tipoprest,''C'') FROM dual', [fraPrestacion.edCodigo.Text]) = 'S');
end;
{-------------------------------------------------------------------------------}

{function TfrmAutCarga.ValidarSiniestroGCBA: boolean;
begin
  ValidarSiniestroGCBA := true;
  if (ValorSqlEx(' select art.siniestro.is_siniestrogcba(ex_id, ''S'') from art.sex_expedientes ' +
                 '  where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec ',
                  [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = 'S') and
     (not Seguridad.Claves.IsActive('CargaSiniestrosGCBA')) and
     (Sesion.Sector <> 'INVSIN') and (Sesion.Sector <> 'RECA') and (Sesion.Sector <> 'INCAP') then
     ValidarSiniestroGCBA := false;

end;      }

function TfrmAutCarga.ValidarSiniestroGCBA: boolean;                 // se reemplaza por pedido de Cristian
begin
  ValidarSiniestroGCBA := true;
  if (ValorSqlEx(' select art.siniestro.is_siniestrogcba(ex_id, ''S'') from art.sex_expedientes ' +
                 '  where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec ',
                  [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = 'S') and
     (ValorSqlEx(' select art.siniestro.is_siniestrogcba(ex_id, null, ''S'') from art.sex_expedientes ' +
                 '  where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec ',
                  [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = 'N') and
     (not Seguridad.Claves.IsActive('CargaSiniestrosGCBA')) and
     (Sesion.Sector <> 'INVSIN') and (Sesion.Sector <> 'RECA') and (Sesion.Sector <> 'INCAP') then
     ValidarSiniestroGCBA := false;
end;

function TfrmAutCarga.ValidaPrestacionConCantidad(var cCantidad: Currency): boolean;    // TK 44010
var sSql: string;
begin
  Result := True;
  sSql := 'SELECT pr_cantidadunica FROM ART.mpr_prestaciones ' +
          ' WHERE pr_codigo = :prest ';
  with GetQueryEx(sSql, [fraPrestacion.edCodigo.text]) do
  try
    if not FieldByName('PR_CANTIDADUNICA').IsNull and (FieldByName('PR_CANTIDADUNICA').Value <> edCantidad.Value) then
    begin
      Result := False;
      cCantidad := FieldByName('PR_CANTIDADUNICA').Value;
    end;
  finally
    free;
  end;
end;

procedure TfrmAutCarga.edFechaTurnoExit(Sender: TObject);
begin
  if (fraPrestacion.edCodigo.Text = PRES_ESPERA_REMIS) and (not edFechaTurno.IsEmpty) then
    OpenQueryEx(sdqNumAuto, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, edFechaTurno.Text]);
end;

end.
