unit unProtPosForzadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, unArtFrame, unFraDomicilio, unFraTrabajador, Mask, ToolEdit, PatternEdit,
  unFraCodigoDescripcion, unFraEstablecimiento, GroupCheckBox,unDmPrincipal, unFormEstudios,
  unCustomGridABM;

type
  THackFormEstudios = class(TFormEstudios);

  TfrmProtPosForzadas = class(TfrmCustomGridABM)
    Label41: TLabel;
    edFechaFiltro: TDateEdit;
    Label43: TLabel;
    fraEstablecimientoFiltro: TfraEstablecimiento;
    fraEmpresaFiltro: TfraEmpresa;
    Label44: TLabel;
    fraTrabajadorFiltro: TfraTrabajador;
    Label42: TLabel;
    ScrollBox1: TScrollBox;
    gbDescripcion: TGroupBox;
    lbFecha: TLabel;
    lbCUIT: TLabel;
    lbEstab: TLabel;
    lbRubro: TLabel;
    lbPuestodeTrabajo: TLabel;
    lbAntiguedad: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    edFechaProt: TDateEdit;
    fraDomicilioTrabajador: TfraDomicilio;
    fraEmpresa: TfraEmpresa;
    fraEstablecimiento: TfraEstablecimiento;
    edRubro: TPatternEdit;
    edPuestodeTrabajo: TPatternEdit;
    edAntiguedadAnios: TPatternEdit;
    edAntiguedadMeses: TPatternEdit;
    fraTrabajadorProt: TfraTrabajador;
    fraPrestador: TfraCodigoDescripcion;
    gbTiempoTarea: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edHorasDia: TPatternEdit;
    edHorasSemana: TPatternEdit;
    gbCiclodeTrabajo: TGroupBox;
    gbManipulacionCargas: TGroupBox;
    gbTipoTarea: TGroupBox;
    lbOtros: TLabel;
    lbHerramientas: TLabel;
    lbTurnoTrabajo: TLabel;
    lbPausasTrabajo: TLabel;
    cgTipoTarea: TCheckGroup;
    edOtros: TPatternEdit;
    edHerramientasADiario: TRichEdit;
    edPausasTrabajo: TPatternEdit;
    edTurnosTrabajo: TPatternEdit;
    gbArticualaciones: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Panel24: TPanel;
    Panel26: TPanel;
    cgArticulaciones: TCheckGroup;
    Panel22: TPanel;
    Panel21: TPanel;
    Panel20: TPanel;
    Panel19: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel4: TPanel;
    Panel23: TPanel;
    Panel16: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    gbFlexionSostenida: TGroupBox;
    Label35: TLabel;
    rgFlexionSostenida: TRadioGroup;
    gbObservaciones: TGroupBox;
    edObservaciones: TRichEdit;
    GroupBox1: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    rgDolor: TRadioGroup;
    rgCursoDelDolor: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDescTrabajoHabitual: TPatternEdit;
    edAntecedentesLaborales: TPatternEdit;
    rgTiempoTarea: TRadioGroup;
    rgCiclodeTrabajo: TRadioGroup;
    rgManipulacionCargas: TRadioGroup;
    rgSignosySintomas: TRadioGroup;
    Label47: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraTrabajadorOnChange(Sender: TObject);
    procedure fraEmpresaFiltroOnChange(Sender: TObject);
    procedure fraEmpresaOnChange(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure fraTrabajadorProtExit(Sender: TObject);
    procedure fpAbmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fpAbmKeyPress(Sender: TObject; var Key: Char);
    procedure fpAbmShow(Sender: TObject);
    procedure FSFormKeyPress(Sender: TObject; var Key: Char);
    procedure tbNuevoClick(Sender: TObject);
  private
    { Private declarations }
    FDatosEstudio: TDatosEstudio;
    FClaveEstudio: TClaveEstudio;
    FCuit : String;
    FEstableci : Integer;
    FProtPosOK: Boolean;
    FCurrAETID: integer;
    FExisteError: Boolean;
    FDesdeHistClinic: Boolean;
    FModoAlta: Boolean;
    function CambioPadre(AControl, ACurrentControl: TControl): Boolean;
    function GetDatosEstudio: TDatosEstudio;
    procedure SetDatosEstudio(const Value: TDatosEstudio);
    function GetClaveEstudio: TClaveEstudio;
    procedure SetClaveEstudio(const Value: TClaveEstudio);
    function GetCurrAETID: integer;
    function GetHistClinic: Boolean;
    procedure SetHistClinic(Value: Boolean);
    function GetModoAlta: Boolean;
    procedure SetModoAlta(const Value: Boolean);
  public
    property ProtPosOK: Boolean read FProtPosOK;
    property DatosEstudio: TDatosEstudio read GetDatosEstudio write SetDatosEstudio;
    property ClaveEstudio: TClaveEstudio read GetClaveEstudio write SetClaveEstudio;
    property CurrAETID: integer read GetCurrAETID;
    property ExisteError: Boolean read FExisteError;
    property DesdeHistClinic: Boolean read GetHistClinic write SetHistClinic;
    property ModoAlta: Boolean read GetModoAlta write SetModoAlta; {x incompat TModoABM unCustomGridABM/unFormEstudios}
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmProtPosForzadas: TfrmProtPosForzadas;

implementation

{$R *.dfm}
uses
  AnsiSql,unSesion, VCLExtra, CustomDlgs, StrFuncs, SqlFuncs,
  unCustomConsulta, Math, DateTimeFuncs, SendKey, unEstudiosDef;

{ TfrmProtPosForzadas }

procedure TfrmProtPosForzadas.ClearControls;
begin
  inherited;
  ScrollBox1.VertScrollBar.Position := 0;
//  edFechaProt.Clear;
//  fraTrabajadorProt.Clear;
//  fraDomicilioTrabajador.Clear;
//  fraEmpresa.Clear;
//  fraEstablecimiento.Clear;
//  edRubro.Clear;
//  edPuestodeTrabajo.Clear;
//  edAntiguedadAnios.Clear;
//  edAntiguedadMeses.Clear;
  edDescTrabajoHabitual.Clear;
  edAntecedentesLaborales.Clear;
  edTurnosTrabajo.Clear;
  edHorasDia.Clear;
  edHorasSemana.Clear;
  rgTiempoTarea.ItemIndex := 3;
  rgCiclodeTrabajo.ItemIndex := 3;
  rgManipulacionCargas.ItemIndex := 3;
  cgTipoTarea.Clear();
  edOtros.Clear;
  edObservaciones.Clear;
  edPausasTrabajo.Clear;
  cgArticulaciones.Clear();
  rgFlexionSostenida.ItemIndex := 2;
  rgSignosySintomas.ItemIndex := 0;
  rgDolor.ItemIndex := 2;
  rgCursoDelDolor.ItemIndex := 3;
  edObservaciones.Clear;
  if DesdeHistClinic then
    fraPrestador.Codigo := FDatosEstudio.Prestador
  else
    fraPrestador.Clear;
  edHerramientasADiario.Clear;
end;

function TfrmProtPosForzadas.DoABM: Boolean;
var
  iIdCodigo : Integer;
  iAntiguedad : Integer;
  FormEstudios: TfrmEstudioDef;
begin
  BeginTrans(True);
  FExisteError := False;
  try
    if DesdeHistClinic  then
    begin
      try
        FormEstudios := TfrmEstudioDef.Create(nil);
        if FModoAlta then
          THackFormEstudios(FormEstudios).ModoABM := maAdd
        else
          THackFormEstudios(FormEstudios).ModoABM := maUpdate;

        FormEstudios.ClaveEstudio := FClaveEstudio;
        FormEstudios.DatosEstudio := FDatosEstudio;
        FormEstudios.SaveResult(0,
            trNone,
            FormEstudios.DatosEstudio.Prestador,
            FormEstudios.DatosEstudio.Periodo,
            FormEstudios.DatosEstudio.PerAnterior,
            FormEstudios.DatosEstudio.Reconfirmacion.Carpeta,
            FormEstudios.DatosEstudio.IDDetalleArchivo,
            FormEstudios.DatosEstudio.CarpetaPendiente,
            FormEstudios.DatosEstudio.Tipo,
            FormEstudios.DatosEstudio.Reconfirmacion,
            FormEstudios.DatosEstudio.FechaRecPrest,
            FormEstudios.DatosEstudio.FechaRecML,
            FormEstudios.DatosEstudio.Observaciones,
            FormEstudios.DatosEstudio.AdicEst
          );
        FCurrAETID := FormEstudios.CurrAETID;
      finally
        FreeAndNil(FormEstudios);
      end;
    end;

    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('PF_ID').AsInteger;
      Sql.Fields.Add('PF_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PF_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      IF (edAntiguedadAnios.Text <> '') and (edAntiguedadMeses.Text <> '') then
      begin
        iAntiguedad := StrToInt(edAntiguedadAnios.Text)*12+StrToInt(edAntiguedadmeses.Text);
        Sql.Fields.Add('PF_ANTIGUEDAD', iAntiguedad);
      end;
      Sql.Fields.Add('PF_FECHA', edFechaProt.Date);
      Sql.Fields.Add('PF_CUIL', fraTrabajadorProt.CUIL);
      if not fraDomicilioTrabajador.IsEmpty then
      begin
        Sql.Fields.Add('PF_CALLE', fraDomicilioTrabajador.Calle);
        Sql.Fields.Add('PF_NUMERO', fraDomicilioTrabajador.Numero);
        Sql.Fields.Add('PF_PISO', fraDomicilioTrabajador.Piso);
        Sql.Fields.Add('PF_DEPARTAMENTO', fraDomicilioTrabajador.Departamento);
        Sql.Fields.Add('PF_CPOSTAL', fraDomicilioTrabajador.CodigoPostal);
        Sql.Fields.Add('PF_CPA', fraDomicilioTrabajador.CPA);
        Sql.Fields.Add('PF_LOCALIDAD', fraDomicilioTrabajador.Localidad);
        if fraDomicilioTrabajador.Prov > 0 then
          Sql.Fields.Add('PF_PROV', fraDomicilioTrabajador.Prov)
        else
          Sql.Fields.Add('PF_PROV', exNull);
      end;
      Sql.Fields.Add('PF_IDEMPRESA', fraEmpresa.Value);

      Sql.Fields.Add('PF_TURNOSDETRABAJO',edTurnosTrabajo.Text);

      Sql.Fields.Add('PF_ESTABLECI', fraEstablecimiento.Codigo);
      Sql.Fields.Add('PF_RUBRO', edRubro.Text);
      Sql.Fields.Add('PF_DESCTRABHABITUAL', edDescTrabajoHabitual.Text);
      Sql.Fields.Add('PF_ANTECEDENTES', edAntecedentesLaborales.Text);
      Sql.Fields.Add('PF_NROHORASDIA', edHorasDia.Text);
      Sql.Fields.Add('PF_NROHORASSEMANA', edHorasSemana.Text);
      Sql.Fields.Add('PF_TIEMPOTAREA', rgTiempoTarea.ItemIndex);
      Sql.Fields.Add('PF_CICLOTRABAJO', rgCiclodeTrabajo.ItemIndex);
      Sql.Fields.Add('PF_MANUALCARGAS', rgManipulacionCargas.ItemIndex);
      Sql.Fields.Add('PF_TIPOTAREA', cgTipoTarea.Value);
      Sql.Fields.Add('PF_OTROS', edOtros.Text);
      Sql.Fields.Add('PF_HERRAMIENTASYELEM', edHerramientasADiario.Text);
      Sql.Fields.Add('PF_PAUSATRABAJO', edPausasTrabajo.Text);
      Sql.Fields.Add('PF_ARTICULACIONES', cgArticulaciones.Value);
      Sql.Fields.Add('PF_FLEXIONCOLUMNA', rgFlexionSostenida.ItemIndex);
      Sql.Fields.Add('PF_SIGNOSYSINTOMAS', rgSignosySintomas.ItemIndex);
      Sql.Fields.Add('PF_DOLOR', rgDolor.ItemIndex);
      Sql.Fields.Add('PF_CURSODELDOLOR', rgCursoDelDolor.ItemIndex);
      Sql.Fields.Add('PF_OBSERVACIONES', edObservaciones.Text);
      Sql.Fields.Add('PF_PUESTOTRABAJO', edPuestodeTrabajo.Text);
      Sql.Fields.Add('PF_IDPRESTADOR', fraPrestador.Codigo);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HPF_POSFOR_ID');
        Sql.Fields.Add('PF_USUALTA', Sesion.UserID );
        Sql.Fields.Add('PF_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('PF_ID').AsInteger;
        Sql.Fields.Add('PF_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('PF_FECHAMODIF', exDateTime );
        Sql.Fields.Add('PF_USUBAJA', exNull );
        Sql.Fields.Add('PF_FECHABAJA', exNull );
      end;
    end;
    Sql.PrimaryKey.Add('PF_ID', iIdCodigo);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la posicion Forzada.');
    end;
  end;
end;

procedure TfrmProtPosForzadas.FormCreate(Sender: TObject);
begin
  inherited;
  with fraPrestador do
  begin
    TableName := 'art.cpr_prestador';
    FieldDesc := 'CA_DESCRIPCION';
    FieldID := 'CA_IDENTIFICADOR';
    FieldCodigo := 'CA_IDENTIFICADOR';
    FieldBaja := 'CA_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  fraTrabajadorProt.OnChange := fraTrabajadorOnChange;
  fraEstablecimiento.ShowBajas := True;
  fraEstablecimientoFiltro.ShowBajas := True;
  Sql.TableName := 'HYS.HPF_POSICIONESFORZADAS';
  fraEmpresa.ShowBajas := True;
  fraEmpresa.OnChange := fraEmpresaOnChange;
  fraEmpresaFiltro.ShowBajas := True;
  fraEmpresaFiltro.OnChange := fraEmpresaFiltroOnchange;
  fraEmpresaFiltroOnchange(nil);
end;

procedure TfrmProtPosForzadas.fraTrabajadorOnChange(Sender: TObject);
var
  iAntiguedad :Integer;
  FContrato : Integer;
begin
  if (edFechaProt.Date <> 0) and fraTrabajadorProt.IsSelected then
  begin
    with GetQuery(
      ' SELECT distinct rt_cuit, rt_estableci '+
      '   FROM art.prt_riestrab prt '+
      '  WHERE rt_fecha = (SELECT MAX (prt2.rt_fecha) '+
      '                      FROM art.prt_riestrab prt2 '+
      '                     WHERE prt2.rt_cuil = '+SqlValue(fraTrabajadorProt.CUIL)+
      '                       AND rt_fecha <= '+SqlValue(edFechaProt.Date)+') '+
      '    AND rt_cuil = '+SqlValue(fraTrabajadorProt.CUIL)) do
    try
      FCuit := fieldbyname('rt_cuit').AsString;
      if FCuit <> '' then
      begin
        FContrato := ValorSql(
          ' SELECT art.afi.get_contratovigente( '+SqlValue(FCuit)+', '+
          '         to_char('+ SqlDate(edFechaProt.Date)+' ,''YYYYMM'')) FROM dual');
      end
      else
        FContrato := 0;
      FEstableci := fieldbyname('rt_estableci').AsInteger;
      fraEmpresa.Contrato := FContrato;
      fraEmpresaOnChange(nil);
      fraEstablecimiento.IdEmpresa := fraEmpresa.Value;
      If fraEstablecimiento.Contrato <> 0 then
        fraEstablecimiento.Codigo := IntToStr(FEstableci);
    finally
      Free;
    end;
    with GetQuery(
      ' SELECT tj_calle, tj_numero, tj_piso, tj_departamento, tj_cpostal, '+
      '        tj_localidad, nvl(tj_provincia,0) tj_provincia, tj_cpostala '+
      '  FROM ctj_trabajador '+
      ' WHERE tj_cuil = '+SqlValue(fraTrabajadorProt.CUIL)) do
    try
      fraDomicilioTrabajador.Cargar(fieldbyname('tj_calle').AsString,fieldbyname('tj_cpostal').AsString,
                                    fieldbyname('tj_localidad').AsString, fieldbyname('tj_numero').AsString,
                                    fieldbyname('tj_piso').AsString, fieldbyname('tj_departamento').AsString,
                                    fieldbyname('tj_provincia').AsString, fieldbyname('tj_cpostala').AsString
                                    );
      if  fieldbyname('tj_provincia').AsInteger = 0 then
      begin
        fraDomicilioTrabajador.cmbLocalidadDropDown(nil);
        fraDomicilioTrabajador.cmbLocalidadChange(nil);
      end;
    finally
      Free;
    end;
    with GetQuery(
      ' SELECT rl_tarea, trunc(months_between(nvl(hl_fechaegreso,'+SqlValue(edFechaProt.Date)+'),rl_fechaingreso)) antiguedad'+
      '   FROM crl_relacionlaboral,chl_historicolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_idtrabajador = hl_idtrabajador(+) '+
      '    AND rl_idtrabajador = (SELECT tj_id '+
      '                             FROM ctj_trabajador '+
      '                            WHERE tj_cuil = '+SqlValue(fraTrabajadorProt.CUIL)+')' ) do
    try

      edPuestodeTrabajo.Text  := fieldbyname('rl_tarea').AsString;
      iAntiguedad := FieldByName('antiguedad').AsInteger;
      edAntiguedadAnios.Text := IntToStr(trunc(iAntiguedad/12));
      edAntiguedadMeses.Text := IntToStr(iAntiguedad mod 12);
    finally
      Free;
    end;
  end;
end;

procedure TfrmProtPosForzadas.LoadControls;
var
  iAntiguedad : Integer;
begin
  inherited;
  ClearControls;
  edFechaProt.Date := sdqConsulta.FieldByName('PF_FECHA').AsDateTime;
  fraTrabajadorProt.CUIL := sdqConsulta.FieldByName('PF_CUIL').AsString;
  fraDomicilioTrabajador.Cargar(sdqConsulta.FieldByName('PF_CALLE').AsString,sdqConsulta.FieldByName('PF_CPOSTAL').AsString,
                                    sdqConsulta.FieldByName('PF_LOCALIDAD').AsString, sdqConsulta.FieldByName('PF_NUMERO').AsString,
                                    sdqConsulta.FieldByName('PF_PISO').AsString, sdqConsulta.FieldByName('PF_DEPARTAMENTO').AsString,
                                    sdqConsulta.FieldByName('PF_PROV').AsString, sdqConsulta.FieldByName('PF_CPA').AsString
                                    );
  fraEmpresa.Value := sdqConsulta.FieldByName('PF_IDEMPRESA').AsInteger;
  fraEstablecimiento.IdEmpresa := fraEmpresa.Value;
  fraEstablecimiento.Codigo := sdqConsulta.FieldByName('PF_ESTABLECI').AsString;
  edRubro.Text := sdqConsulta.FieldByName('PF_RUBRO').AsString;
  edPuestodeTrabajo.Text := sdqConsulta.FieldByName('PF_PUESTOTRABAJO').AsString;
  iAntiguedad := sdqConsulta.FieldByName('PF_ANTIGUEDAD').AsInteger;
  edAntiguedadAnios.Text := IntToStr(trunc(iAntiguedad/12));
  edAntiguedadMeses.Text := IntToStr(iAntiguedad mod 12);


  edTurnosTrabajo.Text := sdqConsulta.FieldByName('PF_TURNOSDETRABAJO').AsString;

  edDescTrabajoHabitual.Text := sdqConsulta.FieldByName('PF_DESCTRABHABITUAL').AsString;
  edAntecedentesLaborales.Text := sdqConsulta.FieldByName('PF_ANTECEDENTES').AsString;
  edHorasDia.Text := sdqConsulta.FieldByName('PF_NROHORASDIA').AsString;
  edHorasSemana.Text := sdqConsulta.FieldByName('PF_NROHORASSEMANA').AsString;
  rgTiempoTarea.ItemIndex := sdqConsulta.FieldByName('PF_TIEMPOTAREA').AsInteger;
  rgCiclodeTrabajo.ItemIndex := sdqConsulta.FieldByName('PF_CICLOTRABAJO').AsInteger;
  rgManipulacionCargas.ItemIndex := sdqConsulta.FieldByName('PF_MANUALCARGAS').AsInteger;
  cgTipoTarea.Value := sdqConsulta.FieldByName('PF_TIPOTAREA').AsString;
  edOtros.Text := sdqConsulta.FieldByName('PF_OTROS').AsString;
  edHerramientasADiario.Text := sdqConsulta.FieldByName('PF_HERRAMIENTASYELEM').AsString;
  edPausasTrabajo.Text := sdqConsulta.FieldByName('PF_PAUSATRABAJO').AsString;
  cgArticulaciones.Value := sdqConsulta.FieldByName('PF_ARTICULACIONES').AsString;
  rgFlexionSostenida.ItemIndex := sdqConsulta.FieldByName('PF_FLEXIONCOLUMNA').AsInteger;
  rgSignosySintomas.ItemIndex := sdqConsulta.FieldByName('PF_SIGNOSYSINTOMAS').AsInteger;
  rgDolor.ItemIndex := sdqConsulta.FieldByName('PF_DOLOR').AsInteger;
  rgCursoDelDolor.ItemIndex := sdqConsulta.FieldByName('PF_CURSODELDOLOR').AsInteger;
  edObservaciones.Text := sdqConsulta.FieldByName('PF_OBSERVACIONES').AsString;
  fraPrestador.Codigo := sdqConsulta.FieldByName('PF_IDPRESTADOR').AsString;
end;

function TfrmProtPosForzadas.Validar: Boolean;
begin
  Verificar(edFechaProt.Date = 0, edFechaProt,'Debe Ingresar la Fecha.');
  Verificar(not fraTrabajadorProt.IsSelected, fraTrabajadorProt.mskCUIL, 'Debe seleccionar un Trabajador.');
  Verificar(not fraEmpresa.IsSelected, fraEmpresa,'Debe seleccionar una Empresa.');
  Verificar(not fraEstablecimiento.IsSelected, fraEstablecimiento,'Debe Seleccionar un Establecimiento.');
  //Verificar(edRubro.Text = '', edRubro,'Debe especificar el Rubro.');
  //Verificar(edPuestodeTrabajo.Text = '', edPuestodeTrabajo,'Debe especificar el Puesto de Trabajo.');
  //Verificar(edAntiguedadAnios.Text = '', edAntiguedadAnios,'Debe especificar la Antiguedad.');
  //Verificar(edAntiguedadMeses.Text = '', edAntiguedadMeses,'Debe especificar la Antiguedad.');
  //Verificar((StrToInt(edAntiguedadAnios.Text) = 0) and (StrToInt(edAntiguedadMeses.Text) = 0),edAntiguedadAnios,'No pueden ser ambas antiguedades 0.');
  //Verificar(edHorasDia.Text = '', edHorasDia,'Debe especificar el número de horas.');
  //Verificar(edHorasSemana.Text = '', edHorasSemana,'Debe especificar el número de horas.');
  //Verificar(StrToInt(edHorasDia.Text) > StrToInt(edHorasSemana.Text),edHorasSemana,'Las horas Semana no pueden ser menor que las horas día.');
  //Verificar(rgTiempoTarea.ItemIndex = -1, rgTiempoTarea,'Debe Seleccionar el Tiempo de Tarea.');
  //Verificar(rgCiclodeTrabajo.ItemIndex = -1, rgCiclodeTrabajo,'Debe Seleccionar el Ciclo de Trabajo.');
  //Verificar(rgManipulacionCargas.ItemIndex = -1, rgManipulacionCargas,'Debe Seleccionar la Manipulación manual de Cargas.');
  //Verificar(cgTipoTarea.Value = 'NNNNNNNNNN',cgTipoTarea,'Debe Seleccionar el Tipo de Tarea.');
  //Verificar(edHerramientasADiario.Text = '', edHerramientasADiario,'Debe especificar las Herramientas y elementos que utiliza a Diario.');
  //Verificar(edTurnosTrabajo.Text = '', edTurnosTrabajo,'Debe especificar los turnos de Trabajo.');


  //Verificar(edPausasTrabajo.Text = '', edPausasTrabajo,'Debe especificar las Pausas en el Trabajo.');
  //Verificar(rgFlexionSostenida.ItemIndex = -1, rgFlexionSostenida,'Debe Seleccionar Flexion Sostenida de Columna.');
  //Verificar(rgSignosySintomas.ItemIndex = -1, rgSignosySintomas,'Debe Seleccionar Signos y Sintomas.');
  //Verificar(rgDolor.ItemIndex = -1, rgDolor,'Debe Seleccionar Tipo de Dolor.');
  //Verificar(rgCursoDelDolor.ItemIndex = -1, rgCursoDelDolor,'Debe Seleccionar Tipo Curso del Dolor.');
  Verificar(not fraPrestador.IsSelected, fraPrestador,'Debe Seleccionar un Prestador.');
  result := True;
end;

procedure TfrmProtPosForzadas.tbRefrescarClick(Sender: TObject);
var
  sSQL : String;
begin
  sSQL :=
    'SELECT pf_id, pf_fecha, pf_cuil, pf_calle, pf_numero, pf_piso, pf_departamento, pf_cpostal, pf_cpa, pf_localidad,' +
          ' pf_prov, pf_idempresa, pf_estableci, pf_rubro, pf_desctrabhabitual, pf_antecedentes, pf_nrohorasdia,' +
          ' pf_nrohorassemana, pf_tiempotarea, pf_ciclotrabajo, pf_manualcargas, pf_tipotarea, pf_otros,' +
          ' pf_herramientasyelem, PF_TURNOSDETRABAJO, pf_pausatrabajo, pf_articulaciones, pf_flexioncolumna,' +
          ' pf_signosysintomas, pf_dolor, pf_cursodeldolor, pf_observaciones, pf_idprestador, pf_fechaalta,' +
          ' pf_usualta, pf_fechamodif, pf_usumodif, pf_fechabaja, pf_usubaja, tj_nombre, tj_cuil, ca_descripcion,' +
          ' em_cuit, em_nombre, es_nombre, pf_puestotrabajo, pf_antiguedad' +
     ' FROM hys.hpf_posicionesforzadas, ctj_trabajador, art.cpr_prestador, aem_empresa, aes_establecimiento,' +
          ' aco_contrato' +
    ' WHERE pf_cuil = tj_cuil' +
      ' AND pf_idprestador = ca_identificador' +
      ' AND pf_idempresa = em_id' +
      ' AND es_contrato = co_contrato' +
      ' AND em_id = co_idempresa' +
      ' AND pf_estableci = es_nroestableci' +
      ' AND co_contrato = art.get_vultcontrato (em_cuit)';

  if (edFechaFiltro.Date <> 0) then
    sSQL := sSQL + ' AND PF_FECHA = '+SqlDate(edFechaFiltro.Date);
  if (fraTrabajadorFiltro.IsSelected) then
    sSQL := sSQL + ' AND PF_CUIL = '+SqlValue(fraTrabajadorFiltro.CUIL);
  if (fraEmpresaFiltro.IsSelected) then
    sSQL := sSQL + ' AND PF_IDEMPRESA = '+SqlValue(fraEmpresaFiltro.Value);
  if (fraEstablecimientoFiltro.IsSelected) then
    sSQL := sSQL + ' AND PF_ESTABLECI = '+SqlValue(fraEstablecimientoFiltro.NroEstablecimiento);
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmProtPosForzadas.fraEmpresaFiltroOnChange(Sender: TObject);
begin
  if fraEmpresaFiltro.IsSelected then
  begin
    vclExtra.LockControl(fraEstablecimientoFiltro,False);
    fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
  end
  else
  begin
    vclExtra.LockControl(fraEstablecimientoFiltro,True);
    fraEstablecimientoFiltro.Contrato := 0;
    fraEstablecimientoFiltro.Clear;
  end;
end;

procedure TfrmProtPosForzadas.fraEmpresaOnChange(Sender: TObject);
begin
  if fraEmpresa.IsSelected then
  begin
    vclExtra.LockControl(fraEstablecimiento,False);
    fraEstablecimiento.Contrato := fraEmpresa.Contrato;
  end
  else
  begin
    vclExtra.LockControl(fraEstablecimiento,True);
    fraEstablecimiento.Contrato := 0;
    fraEstablecimiento.Clear;
  end;
end;

procedure TfrmProtPosForzadas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaFiltro.Clear;
  fraTrabajadorFiltro.Clear;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  fraEmpresaFiltroOnChange(nil);
end;

procedure TfrmProtPosForzadas.ScrollBox1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 7
end;

procedure TfrmProtPosForzadas.ScrollBox1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - 7
end;

procedure TfrmProtPosForzadas.fraTrabajadorProtExit(Sender: TObject);
begin
  inherited;
  fraTrabajadorProt.FrameExit(Sender);
  if fpAbm.Visible and fraTrabajadorProt.IsSelected and (edFechaProt.Date <> 0) then
    edRubro.SetFocus;
end;

function GetParentContainer(Control: TControl): TControl;
begin
  while Assigned(Control) and not ((Control is TGroupbox) or (Control is TCheckGroup) or (Control is TRadioGroup)) do
    Control := Control.Parent;

  if (Control is TGroupbox) or (Control is TCheckGroup) or (Control is TRadioGroup) then
    Result := TControl(Control)
  else
    Result := nil;
end;

procedure TfrmProtPosForzadas.btnAceptarClick(Sender: TObject);
begin
  inherited;
  FProtPosOK := True;
end;

function TfrmProtPosForzadas.CambioPadre(AControl, ACurrentControl: TControl): Boolean;
begin
    Result := GetParentContainer(AControl) <> GetParentContainer(ACurrentControl);
end;

procedure TfrmProtPosForzadas.fpAbmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  AControl: TControl;
begin
  inherited;
  AControl := Screen.ActiveControl;
  if ssShift in Shift then
  begin
    if Key = VK_F2 then
    begin
      fpAbm.KeyPreview := False;
      try
        while not CambioPadre(AControl, Screen.ActiveControl) do
        begin
          SendKeys(#9, Screen.ActiveControl.Handle);
          Application.ProcessMessages;
        end;
        AControl := Screen.ActiveControl;
        while not CambioPadre(AControl, Screen.ActiveControl) do
        begin
          SendKeys(#9, Screen.ActiveControl.Handle);
          Application.ProcessMessages;
        end;
        Shift := [];
        PostMessage(GetParentForm(Screen.ActiveControl).Handle, WM_NEXTDLGCTL, 0, 0);
      finally
        fpAbm.KeyPreview := True;
      end;
    end;
  end
  else
  begin
    if Key = VK_F2 then
    begin
      fpAbm.KeyPreview := False;
      try
        while not CambioPadre(AControl, Screen.ActiveControl) do
        begin
          SendKeys(#9, Screen.ActiveControl.Handle);
          Application.ProcessMessages;
        end;
      finally
        fpAbm.KeyPreview := True;
      end;
    end;
  end;
end;

procedure TfrmProtPosForzadas.fpAbmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then btnCancelar.Click;
end;

procedure TfrmProtPosForzadas.fpAbmShow(Sender: TObject);
begin
  //fpAbm.SetFocus;
  rgSignosySintomas.SetFocus;
  btnAceptar.Enabled := FDesdeHistClinic;
end;

procedure TfrmProtPosForzadas.FSFormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then btnCancelar.Click;
end;

procedure TfrmProtPosForzadas.tbNuevoClick(Sender: TObject);
begin
  edFechaProt.Date := edFechaFiltro.Date;
  fraTrabajadorProt.CUIL := fraTrabajadorFiltro.CUIL;
  //ActiveControl := rgSignosySintomas;
  fraTrabajadorOnChange(nil);
  inherited;
end;

function TfrmProtPosForzadas.GetDatosEstudio: TDatosEstudio;
begin
  Result := FDatosEstudio;
end;

procedure TfrmProtPosForzadas.SetDatosEstudio(const Value: TDatosEstudio);
begin
  FDatosEstudio := Value;
end;

function TfrmProtPosForzadas.GetClaveEstudio: TClaveEstudio;
begin
  Result := FClaveEstudio;
end;

procedure TfrmProtPosForzadas.SetClaveEstudio(const Value: TClaveEstudio);
begin
  FClaveEstudio := Value;
end;

function TfrmProtPosForzadas.GetCurrAETID: integer;
begin
  Result := FCurrAETID;
end;

function TfrmProtPosForzadas.GetHistClinic: Boolean;
begin
  Result := FDesdeHistClinic;
end;

procedure TfrmProtPosForzadas.SetHistClinic(Value: Boolean);
begin
  FDesdeHistClinic := Value;
end;

function TfrmProtPosForzadas.GetModoAlta: Boolean;
begin
  Result := FModoAlta;
end;

procedure TfrmProtPosForzadas.SetModoAlta(const Value: Boolean);
begin
  FModoAlta := Value;
end;

end.
