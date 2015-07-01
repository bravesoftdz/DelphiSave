unit unAdministracionEventos;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, {$ELSE} Placemnt, ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvExStdCtrls, JvGroupBox, Mask, DateComboBox,
  JvgGroupBox, PatternEdit, DateTimeEditors, unArtFrame, unFraCodDesc, IntEdit, unFraCodigoDescripcion, DBCtrls, unART,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, CheckLst, ARTCheckListBox, Buttons, JvgSplit, CardinalEdit, AdvToolBar,
  AdvToolBarStylers, JvExDBGrids, JvDBGrid;

type
  TfrmAdministracionEventos = class(TfrmCustomGridABM)
    gbFiltrosEventos: TJvgGroupBox;
    Shape5: TShape;
    pnlLeft: TPanel;
    Label22: TLabel;
    edSE_ID: TIntEdit;
    pnlRight: TPanel;
    Label23: TLabel;
    cmbSE_FECHADesde: TDateComboBox;
    cmbSE_FECHAHasta: TDateComboBox;
    gbFiltrosEmpresa: TJvgGroupBox;
    Shape7: TShape;
    fraFiltroEmpresa: TfraEmpresa;
    Label25: TLabel;
    cmbSE_FECHACOMPROMETIDADesde: TDateComboBox;
    cmbSE_FECHACOMPROMETIDAHasta: TDateComboBox;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cmbSE_FECHAREALIZADODesde: TDateComboBox;
    cmbSE_FECHAREALIZADOHasta: TDateComboBox;
    Label28: TLabel;
    pnlMiddle: TPanel;
    rgEstados: TRadioGroup;
    cmbSE_SECTORINVOLUCRADO: TARTCheckListBox;
    chkSoloSector: TCheckBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    lblEmpresa: TLabel;
    gbFiltrosEventosAdicionales: TJvgGroupBox;
    Shape999: TShape;
    fraSE_IDCODIGOEVENTO: TfraCodDesc;
    Labelx1: TLabel;
    Labelx2: TLabel;
    fraSE_IDCODIGOINGRESO: TfraCodDesc;
    fraSE_IDMOTIVOEVENTO: TfraCodDesc;
    Labelx3: TLabel;
    gbFiltrosUsuarios: TJvgGroupBox;
    Shape666: TShape;
    Label100: TLabel;
    fraSE_USUALTA: TfraCodDesc;
    btnCerrar: TButton;
    pnlBottom: TPanel;
    gbDatosEvento: TJvgGroupBox;
    Shape6: TShape;
    Label8: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edEmpresa: TDBText;
    edContrato: TDBText;
    edCUIT: TDBText;
    edINGRESO: TDBMemo;
    edMOTIVO: TDBMemo;
    edRespuesta: TDBMemo;
    edObservaciones: TDBMemo;
    splBottom: TJvgSplitter;
    ShortCutControlHijo: TShortCutControl;
    rgTiempo: TRadioGroup;
    chkEliminados: TCheckBox;
    tbSalir2: TToolButton;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    pnlFiltrosUsuarios: TPanel;
    Label102: TLabel;
    Label103: TLabel;
    Label101: TLabel;
    fraSE_USUARIODERIVACIONTELEF: TfraCodDesc;
    fraSE_USUREALIZADO: TfraCodDesc;
    fraSE_USUARIOINTERVINIENTE1: TfraCodDesc;
    pcPaginas: TAdvToolBarPager;
    tsDatos: TAdvPage;
    tsObservaciones: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    sbScroll: TScrollBox;
    gbAdicionales: TJvgGroupBox;
    Shape1: TShape;
    Label9: TLabel;
    Label10: TLabel;
    frafpSE_IDCODIGOINGRESO: TfraCodDesc;
    frafpSE_IDMOTIVOEVENTO: TfraCodDesc;
    gbObservaciones: TJvgGroupBox;
    Shape4: TShape;
    Label35: TLabel;
    edSE_OBSERVACION: TMemo;
    gbDatosEventos: TJvgGroupBox;
    Shape2: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbRealizado: TLabel;
    lbEvento: TDBText;
    lbNroEvento: TLabel;
    btnContactos: TSpeedButton;
    cmbSE_FECHA: TDateComboBox;
    frafpSE_IDCODIGOEVENTO: TfraCodDesc;
    fraSE_SECTORINTERVINIENTE: TfraCodDesc;
    cmbSE_FECHAALTA: TDateComboBox;
    frafpSE_USUARIOINTERVINIENTE: TfraCodDesc;
    fraSE_IDCONTACTO: TfraCodDesc;
    fraSE_CARGO: TfraCodDesc;
    fraSE_SECTORINVOLUCRADO: TfraCodDesc;
    edSE_FECHA_HORA: TDateTimePicker;
    gbDetalle: TJvgGroupBox;
    Shape3: TShape;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblVencimiento: TLabel;
    fraSE_PRIORIDAD: TfraCodDesc;
    fraSE_SECTORINVOLUCRADO_2: TfraCodDesc;
    fraSE_IDMOTIVOEVENTO_2: TfraCodDesc;
    frafpSE_USUARIODERIVACIONTELEF: TfraCodDesc;
    cmbSE_FECHACOMPROMETIDA: TDateComboBox;
    edSE_OBSERVACION_2: TMemo;
    cmbSE_FECHAREALIZADO: TDateComboBox;
    chkNotificado: TCheckBox;
    chkAvisoVencido: TCheckBox;
    dbgObservaciones: TJvDBGrid;
    sdqObservaciones: TSDQuery;
    dsObservaciones: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure fraSE_IDCONTACTOcmbDescripcionDropDown(Sender: TObject);
    procedure frafpSE_USUARIOINTERVINIENTEcmbDescripcionDropDown(Sender: TObject);
    procedure fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(Sender: TObject);
    procedure frafpSE_USUARIODERIVACIONTELEFcmbDescripcionDropDown(Sender: TObject);
    procedure frafpSE_IDCODIGOINGRESOPropiedadesChange(Sender: TObject);
    procedure fraSE_IDCONTACTOPropiedadesChange(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure frafpSE_IDMOTIVOEVENTOcmbDescripcionDropDown(Sender: TObject);
    procedure btnContactosClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraSE_IDMOTIVOEVENTOcmbDescripcionDropDown(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FSFormShow(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraSE_SECTORINVOLUCRADO_2PropiedadesChange(Sender: TObject);
    procedure fraSE_IDMOTIVOEVENTO_2PropiedadesChange(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  	FContrato: Integer;
    FIdentificador: Integer;

    function  GetContrato: Integer;
    procedure SetContrato(const Value: Integer);

    function GetIdEmpresa: Integer;
    function GetIdEvento: Integer;
    function GetNombreEmpresa: String;

    procedure Bajas(AValue: Boolean);
    procedure CalcTotales;
    procedure fraEmpresaChange(Sender: TObject);
  protected
    FCerrando: Boolean;
    FSql: String;

    function DoABM: Boolean; override;
    function Is_DerivacionTelefonica(aDesdeGrilla: Boolean = False): Boolean;
    function Is_PantallaAmpliada(aDesdeGrilla: Boolean = False): Boolean;
    function Is_PermitirCerrarEvento: Boolean;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure DoABMHijos; virtual;
    procedure DoArmarSqlBusquedaAdicional; virtual;
    procedure Filtros(AValue: Boolean); virtual;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    function ShowModalEx(AContrato: Integer): Integer;

    procedure AbrirIdentificador(aIdentificador: Integer); virtual;

    property Contrato     : Integer read GetContrato       write SetContrato;
    property IdEmpresa    : Integer read GetIdEmpresa;
    property IdEvento     : Integer read GetIdEvento;
    property NombreEmpresa: String  read GetNombreEmpresa;
  end;

const
  SQL_BASE =
    'SELECT se.se_id idevento, ce.ce_descripcion evento, se.se_subevento subevento, se.se_usurealizado,' +
          ' varios.get_cantrellamadas(se.se_identificador) rellamadas, se.se_usurealizado usurealizado,' +
          ' usurea.se_nombre nombreusurealizado, se.se_fecha, TRUNC(se.se_fecha) fecha, se.se_sectorinvolucrado,' +
          ' TO_CHAR(se.se_fecha, ''HH24:MI'') hora, se.se_idcodigoingreso, sinter.sc_descripcion sectorsolicitante,' +
          ' usu.se_nombre personalsolicitante, ie.ie_codigo, ie.ie_conderivaciontelef, ie.ie_descripcion ingreso,' +
          ' me.me_descripcion motivo, sinvol.sc_descripcion sectorinterviniente, pe.pe_descripcion prioridad,' +
          ' se_fechacomprometida, TRUNC(se.se_fecharealizado) se_fecharealizado,' +
          ' REPLACE(se.se_observacionrealizado, CHR(13) || CHR(10), '' '') respuesta,' +
          ' REPLACE(se.se_observacion, CHR(13) || CHR(10), '' '') observaciones, se.se_cuilevento cuil,' +
          ' si.si_descripcion situacionempresa, se.se_usualta usualta, se.se_eventointerrumpido interrumpido,' +
          ' se.se_emailprospecto emailprospecto, se.se_general general,' +
          ' se.se_idsolicitudcotizacion idsolicitudcotizacion, se.se_cuitprospecto cuitprospecto,' +
          ' se.se_razonsocialprospecto razonsocialprospecto, se.se_idprestadorevento idprestadorevento,' +
          ' se.se_eventonotificado, se.se_idproveedorevento idproveedorevento, se.se_identidad identidad,' +
          ' se.se_identificador identificadorevento, se.se_idcodigoevento, se.se_sectorinterviniente,' +
          ' se.se_usuariointerviniente, se.se_contacto, se.se_fechaalta, se.se_idcontacto, se.se_contrato,' +
          ' se.se_idmotivoevento, se.se_usuarioderivaciontelef, se.se_prioridad, se.se_observacion,' +
          ' se.se_cargo se_cargo, actualdate horaactual, se.se_idrespuesta, se.se_avisovencido, se.se_fechabaja' +
     ' FROM cpe_prioridadevento pe, csi_situacionempresa si, cme_motivoevento me, cse_seguimientoevento se,' +
          ' usc_sectores sinter, usc_sectores sinvol, cce_codigoevento ce, cie_ingresoevento ie, use_usuarios usu,' +
          ' use_usuarios usurea' +
    ' WHERE se.se_idcodigoevento = ce.ce_id(+)' +
      ' AND se.se_sectorinvolucrado = sinvol.sc_codigo(+)' +
      ' AND se.se_idmotivoevento = me.me_id(+)' +
      ' AND se.se_usuariointerviniente = usu.se_usuario' +
      ' AND se.se_idcodigoingreso = ie.ie_id(+)' +
      ' AND se.se_sectorinterviniente = sinter.sc_codigo' +
      ' AND se.se_prioridad = pe.pe_id(+)' +
      ' AND se.se_idsituacionempresa = si.si_id(+)' +
      ' AND se.se_usurealizado = usurea.se_usuario(+)';

var
  frmAdministracionEventos: TfrmAdministracionEventos;

function Is_PermisoRespUsuarioSector(aSector: String): Boolean;

procedure Do_CerrarEvento(aIdEvento: TTableId; aPreguntarRespuesta: Boolean = False);

implementation

uses
  AnsiSql, SQLFuncs, CustomDlgs, unSesion, unDmPrincipal, unPropiedadesFrame, VCLExtra, Numeros, DateTimeFuncs,
  unFiltros, unContratoContacto, General, unCustomConsulta, unComunes;

{$R *.DFM}

function TfrmAdministracionEventos.GetContrato: Integer;
begin
  if (ModoABM = maModificacion) and (FContrato = 0) then
  begin
    if sdqConsulta.Active and not sdqConsulta.IsEmpty then
      Result := sdqConsulta.FieldByName('se_contrato').AsInteger
    else
      Result := 0;
  end
  else
    Result := FContrato;

  if (fraFiltroEmpresa.Contrato > 0) and (FContrato = 0) then
    Result := fraFiltroEmpresa.Contrato;
end;

procedure TfrmAdministracionEventos.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  fraFiltroEmpresa.Contrato := FContrato;
end;

procedure TfrmAdministracionEventos.FormCreate(Sender: TObject);
begin
  inherited;
  
  Filtros(True);

  ShowActived := False;
  FCerrando := False;
  FieldBaja := 'se_fechabaja';
  fraFiltroEmpresa.ShowBajas := True;
  fraFiltroEmpresa.OnChange := fraEmpresaChange;

  VCLExtra.LockControls(fraSE_SECTORINTERVINIENTE, True);
  VCLExtra.LockControls(frafpSE_USUARIOINTERVINIENTE, True);
  VCLExtra.LockControls(frafpSE_IDMOTIVOEVENTO, True);
  VCLExtra.LockControls(gbObservaciones, True);
end;

procedure TfrmAdministracionEventos.ClearControls;
begin
  lbRealizado.Visible := False;
  btnCerrar.Visible := False;  
  cmbSE_FECHA.Date := DBDate;
  edSE_FECHA_HORA.Time := DBTime;
  frafpSE_IDCODIGOEVENTO.Clear;
  fraSE_SECTORINTERVINIENTE.Codigo := Sesion.Sector;
  frafpSE_USUARIOINTERVINIENTE.Codigo := Sesion.UserID;
  cmbSE_FECHAALTA.Date := DBDate;
  fraSE_IDCONTACTO.Clear;
  fraSE_CARGO.Clear;
  fraSE_SECTORINVOLUCRADO.Clear;
  frafpSE_IDCODIGOINGRESO.Clear;
  frafpSE_IDMOTIVOEVENTO.Clear;
  cmbSE_FECHACOMPROMETIDA.Clear;
  fraSE_SECTORINVOLUCRADO_2.Clear;
  fraSE_IDMOTIVOEVENTO_2.Clear;
  frafpSE_USUARIODERIVACIONTELEF.Clear;
  cmbSE_FECHAREALIZADO.Clear;
  fraSE_PRIORIDAD.Value := 3;
  edSE_OBSERVACION.Lines.Clear;
  edSE_OBSERVACION_2.Lines.Clear;
  chkNotificado.Checked := False;

  VCLExtra.LockControls(fpABM, False);
  VCLExtra.LockControls(fraSE_SECTORINTERVINIENTE, True);
  VCLExtra.LockControls(frafpSE_USUARIOINTERVINIENTE, True);
  VCLExtra.LockControls(cmbSE_FECHAALTA, True);
  VCLExtra.LockControls(frafpSE_IDMOTIVOEVENTO, True);
  VCLExtra.LockControls(gbObservaciones, True);
  VCLExtra.LockControls(cmbSE_FECHAREALIZADO, True);
  VCLExtra.LockControls(chkNotificado, True);
  gbDetalle.Collapsed := False;
  gbObservaciones.Collapsed := True;

  Bajas(False);
end;

function TfrmAdministracionEventos.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'cse_seguimientoevento';
  iId := 0;
  
  try
    if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('se_identificador', sdqConsulta.FieldByName('identificadorevento').AsInteger, False);

      Sql.Fields.Add('se_fechabaja', exDateTime);
      Sql.Fields.Add('se_usubaja',   Sesion.UserID);
    end
    else
    begin
      if ModoABM = maAlta then
      begin
        Sql.SqlType := stInsert;
        iId := GetSecNextVal('seq_cse_id');
      	Sql.PrimaryKey.Add('se_id', iId, False);

        Sql.Fields.Add('se_fechaalta', exDateTime);
        Sql.Fields.Add('se_usualta',   Sesion.UserID);
      end
      else if ModoABM = maModificacion then
      begin
        Sql.SqlType := stUpdate;
      	Sql.PrimaryKey.Add('se_identificador', sdqConsulta.FieldByName('identificadorevento').AsInteger, False);

        Sql.Fields.Add('se_fechamodif', exDateTime);
        Sql.Fields.Add('se_usumodif',   Sesion.UserID);
      end;

      if Contrato > 0 then
        Sql.Fields.Add('se_contrato', Contrato);

      Sql.Fields.Add('se_fecha',                cmbSE_FECHA.Date + GetDecimales(edSE_FECHA_HORA.Time), dmDateTime);
      Sql.Fields.Add('se_idcodigoevento',       frafpSE_IDCODIGOEVENTO.Value);
      Sql.Fields.Add('se_sectorinterviniente',  fraSE_SECTORINTERVINIENTE.AsString);
      Sql.Fields.Add('se_USUARIOINTERVINIENTE', frafpSE_USUARIOINTERVINIENTE.AsString);
      Sql.Fields.Add('se_contacto',             fraSE_IDCONTACTO.Descripcion);
      Sql.Fields.Add('se_idcontacto',           fraSE_IDCONTACTO.Value);
      Sql.Fields.Add('se_cargo',                fraSE_CARGO.AsString);
      Sql.Fields.Add('se_idcodigoingreso',      frafpSE_IDCODIGOINGRESO.Value);

      if Is_PantallaAmpliada then
      begin
        Sql.Fields.Add('se_fechacomprometida',      cmbSE_FECHACOMPROMETIDA.Date);
        Sql.Fields.Add('se_idmotivoevento',         fraSE_IDMOTIVOEVENTO_2.Value);
        Sql.Fields.Add('se_sectorinvolucrado',      fraSE_SECTORINVOLUCRADO_2.AsString);
        Sql.Fields.Add('se_usuarioderivaciontelef', frafpSE_USUARIODERIVACIONTELEF.AsString);
        Sql.Fields.Add('se_prioridad',              fraSE_PRIORIDAD.Value);
        Sql.Fields.Add('se_observacion',            edSE_OBSERVACION_2.Lines.Text);
        Sql.Fields.Add('se_avisovencido',           String(IIF(chkAvisoVencido.Checked, 'S', 'N')));
        Sql.Fields.Add('se_eventonotificado',       String(IIF(chkNotificado.Checked, 'S', 'N')))
      end
      else
      begin
        Sql.Fields.Add('se_idmotivoevento',     frafpSE_IDMOTIVOEVENTO.Value);
        Sql.Fields.Add('se_sectorinvolucrado',  fraSE_SECTORINVOLUCRADO.AsString);
        Sql.Fields.Add('se_observacion',        edSE_OBSERVACION.Lines.Text);
        Sql.Fields.Add('se_fecharealizado',     exDateTime);
        Sql.Fields.Add('se_fechaaltarealizado', exDateTime);
        Sql.Fields.Add('se_usurealizado',       Sesion.UserID);
      end;

      DoABMHijos;
    end;

    Result := inherited DoABM;

    if (ModoABM = maAlta) and Is_PantallaAmpliada and (Sesion.UserID <> frafpSE_USUARIODERIVACIONTELEF.Codigo) then
      EjecutarStoreEx('art.varios.do_mandarmailssgc(:idevento, :subevento, :usuario, art.varios.get_pathexecitrix,' +
                                                  ' art.varios.get_paramcitrix, varios.get_pathportal, :idejecutable);',
                      [iId, 1, Sesion.UserID, Get_IdEjecutable(ExtractFileDir(Application.ExeName), ExtractFileExt(Application.ExeName))])
  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el evento.');
  end;
end;

procedure TfrmAdministracionEventos.LoadControls;
var
  cSectorInvolucrado: String;
begin
  with sdqConsulta do
  begin
    edSE_FECHA_HORA.Time                  := GetDecimales(FieldByName('se_fecha').AsDateTime);
    cmbSE_FECHA.Date                      := FieldByName('se_fecha').AsDateTime;
    frafpSE_IDCODIGOEVENTO.Value          := FieldByName('se_idcodigoevento').AsInteger;
    fraSE_SECTORINTERVINIENTE.Codigo      := FieldByName('se_sectorinterviniente').AsString;
    frafpSE_USUARIOINTERVINIENTE.Codigo   := FieldByName('se_usuariointerviniente').AsString;
    cmbSE_FECHAALTA.Date                  := FieldByName('se_fechaalta').AsDateTime;
    fraSE_IDCONTACTO.Value                := FieldByName('se_idcontacto').AsInteger;
    fraSE_CARGO.Codigo                    := FieldByName('se_cargo').AsString;
    frafpSE_IDCODIGOINGRESO.Value         := FieldByName('se_idcodigoingreso').AsInteger;
    cmbSE_FECHACOMPROMETIDA.Date          := FieldByName('se_fechacomprometida').AsDateTime;
    frafpSE_USUARIODERIVACIONTELEF.Codigo := FieldByName('se_usuarioderivaciontelef').AsString;
    cmbSE_FECHAREALIZADO.Date             := FieldByName('se_fecharealizado').AsDateTime;
    chkNotificado.Checked                 := (FieldByName('se_eventonotificado').AsString = 'S');
    chkAvisoVencido.Checked               := FieldByName('se_avisovencido').AsString = 'S';
    fraSE_PRIORIDAD.Value                 := FieldByName('se_prioridad').AsInteger;

    if Is_PantallaAmpliada then
    begin
      fraSE_IDMOTIVOEVENTO_2.Value     := FieldByName('se_idmotivoevento').AsInteger;
      fraSE_IDMOTIVOEVENTO.Clear;
      edSE_OBSERVACION_2.Lines.Text    := FieldByName('se_observacion').AsString;
      edSE_OBSERVACION.Clear;
      fraSE_SECTORINVOLUCRADO_2.Codigo := FieldByName('se_sectorinvolucrado').AsString;
      fraSE_SECTORINVOLUCRADO.Clear;
      cSectorInvolucrado               := fraSE_SECTORINVOLUCRADO_2.Codigo;
    end
    else
    begin
      frafpSE_IDMOTIVOEVENTO.Value     := FieldByName('se_idmotivoevento').AsInteger;
      fraSE_IDMOTIVOEVENTO_2.Clear;
      edSE_OBSERVACION.Lines.Text      := FieldByName('se_observacion').AsString;
      edSE_OBSERVACION_2.Clear;
      fraSE_SECTORINVOLUCRADO.Codigo   := FieldByName('se_sectorinvolucrado').AsString;
      fraSE_SECTORINVOLUCRADO_2.Clear;
      cSectorInvolucrado               := fraSE_SECTORINVOLUCRADO.Codigo;
    end;

    VCLExtra.LockControls(gbDatosEventos, True);//not cmbSE_FECHAREALIZADO.IsEmpty);
    VCLExtra.LockControls(gbAdicionales, not cmbSE_FECHAREALIZADO.IsEmpty);
    VCLExtra.LockControls(gbDetalle, not cmbSE_FECHAREALIZADO.IsEmpty);
    VCLExtra.LockControls(gbObservaciones, not cmbSE_FECHAREALIZADO.IsEmpty);
    VCLExtra.LockControls(btnAceptar, not cmbSE_FECHAREALIZADO.IsEmpty);
    btnCerrar.Visible := btnAceptar.Enabled and (frafpSE_IDCODIGOINGRESO.Codigo = 'CD') and Is_PermisoRespUsuarioSector(cSectorInvolucrado);

    lbRealizado.Visible := not cmbSE_FECHAREALIZADO.IsEmpty;

    frafpSE_IDCODIGOINGRESOPropiedadesChange(nil);
  end;

  OpenQueryEx(sdqObservaciones, [sdqConsulta.FieldByName('identificadorevento').AsInteger]);
  Bajas(True);
  VCLExtra.LockControls([cmbSE_FECHAALTA, frafpSE_IDCODIGOINGRESO], True);
  VCLExtra.LockControls(cmbSE_FECHAREALIZADO, True);
end;

function TfrmAdministracionEventos.Validar: Boolean;
begin
  Verificar(cmbSE_FECHA.IsEmpty, cmbSE_FECHA, 'Debe ingresar la fecha del evento.');
  Verificar(edSE_FECHA_HORA.Time = 0, edSE_FECHA_HORA, 'Debe ingresar la hora del evento.');
  Verificar(frafpSE_IDCODIGOEVENTO.IsEmpty, frafpSE_IDCODIGOEVENTO.edCodigo, 'Debe especificar el evento.');
  Verificar(fraSE_SECTORINTERVINIENTE.IsEmpty, fraSE_SECTORINTERVINIENTE.edCodigo, 'Debe especificar el sector interviniente.');
  Verificar(frafpSE_USUARIOINTERVINIENTE.IsEmpty, frafpSE_USUARIOINTERVINIENTE.edCodigo, 'Debe especificar el personal interviniente.');
//  Verificar(fraSE_IDCONTACTO.IsEmpty, fraSE_IDCONTACTO.edCodigo, 'Debe especificar el contacto de la empresa.');
//  Verificar(fraSE_CARGO.IsEmpty, fraSE_CARGO.edCodigo, 'Debe especificar el cargo del contacto de la empresa.');
  Verificar(frafpSE_IDCODIGOINGRESO.IsEmpty, frafpSE_IDCODIGOINGRESO.edCodigo, 'Debe especificar el código de ingreso del evento al sistema.');

  if Is_PantallaAmpliada then
  begin
    Verificar(cmbSE_FECHACOMPROMETIDA.IsEmpty, cmbSE_FECHACOMPROMETIDA, 'Debe especificar la fecha de vencimiento del evento.');
    Verificar(cmbSE_FECHACOMPROMETIDA.Date < cmbSE_FECHA.Date, cmbSE_FECHACOMPROMETIDA, 'La fecha de vencimiento no puede ser anterior a la fecha del evento.');
    Verificar(fraSE_IDMOTIVOEVENTO_2.IsEmpty, fraSE_IDMOTIVOEVENTO_2.edCodigo, 'Debe especificar el motivo de ingreso del evento.');
    Verificar(fraSE_SECTORINVOLUCRADO_2.IsEmpty, fraSE_SECTORINVOLUCRADO_2.edCodigo, 'Debe especificar el sector involucrado.');
    Verificar(Is_DerivacionTelefonica(False) and frafpSE_USUARIODERIVACIONTELEF.IsEmpty, frafpSE_USUARIODERIVACIONTELEF.edCodigo, 'Debe especificar el usuario al que se derivó el evento.');
    Verificar(fraSE_PRIORIDAD.IsEmpty, fraSE_PRIORIDAD.edCodigo, 'Debe especificar la prioridad del evento.');
  end
  else
  begin
    Verificar(frafpSE_IDMOTIVOEVENTO.IsEmpty, frafpSE_IDMOTIVOEVENTO.edCodigo, 'Debe especificar el motivo de ingreso del evento.');
    Verificar(fraSE_SECTORINVOLUCRADO.IsEmpty, fraSE_SECTORINVOLUCRADO.edCodigo, 'Debe especificar el sector involucrado.');
  end;

  Result := Is_PermitirCerrarEvento;
end;

procedure TfrmAdministracionEventos.fraSE_IDCONTACTOcmbDescripcionDropDown(Sender: TObject);
begin
  if Contrato > 0 then
    fraSE_IDCONTACTO.Propiedades.ExtraCondition := ' AND ct_idempresa = ' + SQLValue(IdEmpresa)
  else if fraFiltroEmpresa.Contrato > 0 then
    fraSE_IDCONTACTO.Propiedades.ExtraCondition := ' AND ct_idempresa = ' + SQLValue(IdEmpresa);

  fraSE_IDCONTACTO.cmbDescripcionDropDown(Sender);
end;

procedure TfrmAdministracionEventos.frafpSE_USUARIOINTERVINIENTEcmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINTERVINIENTE.IsEmpty then
    frafpSE_USUARIOINTERVINIENTE.Propiedades.ExtraCondition := ' AND se_sector = ' + SQLValue(fraSE_SECTORINTERVINIENTE.AsString);
  frafpSE_USUARIOINTERVINIENTE.cmbDescripcionDropDown(Sender);
end;

function TfrmAdministracionEventos.GetIdEmpresa: Integer;
var
  sSql: STring;
begin
  sSql :=
    'SELECT em_id' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  Result := ValorSQLIntegerEx(sSql, [Contrato]);
end;

function TfrmAdministracionEventos.GetNombreEmpresa: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT TO_CHAR(co_contrato) || '' - '' || em_nombre' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  Result := ValorSqlEx(sSql, [Contrato]);
end;

procedure TfrmAdministracionEventos.fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown(Sender: TObject);
var
  sCadenaPrevia: String;
begin
  sCadenaPrevia := fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition;

  if not fraSE_SECTORINVOLUCRADO_2.IsEmpty then
    fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition := fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition +
                                                         ' AND me_sector = ' + SQLValue(fraSE_SECTORINVOLUCRADO_2.AsString);
  if not frafpSE_IDCODIGOINGRESO.IsEmpty then
    fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition := fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition +
                                                         ' AND me_idingresoevento = ' + SQLValue(frafpSE_IDCODIGOINGRESO.Value);
  fraSE_IDMOTIVOEVENTO_2.cmbDescripcionDropDown(Sender);
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ExtraCondition := sCadenaPrevia;  
end;

procedure TfrmAdministracionEventos.frafpSE_USUARIODERIVACIONTELEFcmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_SECTORINVOLUCRADO_2.IsEmpty then
    frafpSE_USUARIODERIVACIONTELEF.Propiedades.ExtraCondition := ' AND se_sector = ' + SQLValue(fraSE_SECTORINVOLUCRADO_2.AsString);
  frafpSE_USUARIODERIVACIONTELEF.cmbDescripcionDropDown(Sender);
end;

procedure TfrmAdministracionEventos.frafpSE_IDCODIGOINGRESOPropiedadesChange(Sender: TObject);
var
  bBloquear: Boolean;
begin
  bBloquear := (not cmbSE_FECHAREALIZADO.IsEmpty) and (ModoABM = maModificacion);

  if frafpSE_IDCODIGOINGRESO.IsSelected then
    if Is_PantallaAmpliada then
    begin
      VCLExtra.LockControls(frafpSE_IDMOTIVOEVENTO, True);
      VCLExtra.LockControls(gbDetalle, bBloquear);
      VCLExtra.LockControls(gbObservaciones, True);
      gbDetalle.Collapsed := False;
      gbObservaciones.Collapsed := True;
    end else
    begin
      VCLExtra.LockControls(frafpSE_IDMOTIVOEVENTO, bBloquear);
      VCLExtra.LockControls(gbDetalle, True);
      VCLExtra.LockControls(gbObservaciones, bBloquear);
      gbDetalle.Collapsed := True;
      gbObservaciones.Collapsed := False;
    end;

  VCLExtra.LockControls(cmbSE_FECHAREALIZADO, True);
end;

procedure TfrmAdministracionEventos.Bajas(AValue: Boolean);
begin
  frafpSE_IDCODIGOEVENTO.Propiedades.ShowBajas         := AValue;
  fraSE_SECTORINTERVINIENTE.Propiedades.ShowBajas      := AValue;
  frafpSE_USUARIOINTERVINIENTE.Propiedades.ShowBajas   := AValue;
  fraSE_IDCONTACTO.Propiedades.ShowBajas               := AValue;
  fraSE_CARGO.Propiedades.ShowBajas                    := AValue;
  fraSE_SECTORINVOLUCRADO.Propiedades.ShowBajas        := AValue;
  frafpSE_IDCODIGOINGRESO.Propiedades.ShowBajas        := AValue;
  frafpSE_IDMOTIVOEVENTO.Propiedades.ShowBajas         := AValue;
  fraSE_SECTORINVOLUCRADO_2.Propiedades.ShowBajas      := AValue;
  fraSE_IDMOTIVOEVENTO_2.Propiedades.ShowBajas         := AValue;
  frafpSE_USUARIODERIVACIONTELEF.Propiedades.ShowBajas := AValue;
  fraSE_PRIORIDAD.Propiedades.ShowBajas                := AValue;

  lbEvento.Visible    := AValue;
  lbNroEvento.Visible := AValue;
end;

procedure TfrmAdministracionEventos.fraSE_IDCONTACTOPropiedadesChange(Sender: TObject);
begin
  if fraSE_IDCONTACTO.IsSelected then
    fraSE_CARGO.Codigo := fraSE_IDCONTACTO.sdqDatos.FieldByName('ct_cargo').AsString;
end;

procedure TfrmAdministracionEventos.RefreshData;
begin
  DoArmarSqlBusquedaAdicional;

  if fraFiltroEmpresa.IsSelected then
    AddCondition(FSql, ' se.se_contrato = ' + SqlValue(fraFiltroEmpresa.Contrato))
  else if Contrato > 0 then
    AddCondition(FSql, ' co_contrato = ' + SqlValue(Contrato));

  if chkSoloSector.Checked then
    AddCondition(FSql, ' se.se_sectorinterviniente = ' + SqlValue(Sesion.Sector));

  if cmbSE_SECTORINVOLUCRADO.CheckCount > 0 then
    AddCondition(FSql, ' 1 = 1 ' + cmbSE_SECTORINVOLUCRADO.InSQL_StringValues('se_sectorinvolucrado', False));

  case rgEstados.ItemIndex of
    0: AddCondition(FSql, ' se.se_fecharealizado IS NULL ');
    1: AddCondition(FSql, ' se.se_fecharealizado IS NOT NULL ');
    2: //Nada
  end;

  case rgTiempo.ItemIndex of
    0: AddCondition(FSql, ' se.se_fecharealizado IS NULL AND se.se_fechacomprometida IS NOT NULL AND se.se_fechacomprometida < ART.ACTUALDATE ');
    1: AddCondition(FSql, ' se.se_fecharealizado IS NULL AND se.se_fechacomprometida IS NOT NULL AND se.se_fechacomprometida >= ART.ACTUALDATE ');
    2: //Nada
  end;

  if not chkEliminados.Checked then
    AddCondition(FSql, ' se.se_fechabaja IS NULL ');

  if fraSE_USUALTA.IsSelected then
    AddCondition(FSql, ' se.se_usualta = ' + SqlValue(fraSE_USUALTA.Codigo));

  AddCondition(FSql, ' 1 = 1 ' + DoFiltro(pnlRight) + DoFiltro(gbFiltrosEventosAdicionales) +
               DoFiltro(pnlFiltrosUsuarios) + DoFiltroComponente(edSE_ID, 'se.se_id'));
  sdqConsulta.SQL.Text := FSql + SortDialog.OrderBy;

  inherited;
  
  CalcTotales;
end;

procedure TfrmAdministracionEventos.Filtros(AValue: Boolean);
begin
  pnlFiltros.Visible                    := True;

  gbFiltrosEventos.Collapsed            := not AValue;
  gbFiltrosUsuarios.Collapsed           := not AValue;
  gbFiltrosEventosAdicionales.Collapsed := not AValue;
  gbFiltrosEmpresa.Collapsed            := not AValue;

  gbFiltrosEventos.Enabled              := AValue;
  gbFiltrosUsuarios.Enabled             := AValue;
  gbFiltrosEventosAdicionales.Enabled   := AValue;
  gbFiltrosEmpresa.Enabled              := AValue;

  tbRefrescar.Visible                   := AValue;
  ToolButton5.Visible                   := AValue;
  tbLimpiar.Visible                     := AValue;

  if not AValue then
  begin
    BorderStyle := bsDialog;
    {$IFDEF VER180}
    FormStorage.Options := rxPlacemnt.TPlacementOptions(FormStorage.Options) - [rxPlacemnt.TPlacementOption(fpState)];
    {$ELSE}
    FormStorage.Options := FormStorage.Options - [fpState];    
    {$ENDIF}
  end;
end;

procedure TfrmAdministracionEventos.ClearData;
begin
  inherited;
  
  chkSoloSector.Checked := False;
  edSE_ID.Clear;
  cmbSE_FECHADesde.Clear;
  cmbSE_FECHAHasta.Clear;
  cmbSE_FECHAREALIZADODesde.Clear;
  cmbSE_FECHAREALIZADOHasta.Clear;
  cmbSE_FECHACOMPROMETIDADesde.Clear;
  cmbSE_FECHACOMPROMETIDAHasta.Clear;
  fraFiltroEmpresa.Clear;
  Contrato := 0;  
  cmbSE_SECTORINVOLUCRADO.ClearChecks;
  chkEliminados.Checked := False;
  rgTiempo.ItemIndex := 2;
  rgEstados.ItemIndex := 2;
  fraSE_IDCODIGOEVENTO.Clear;
  fraSE_IDCODIGOINGRESO.Clear;
  fraSE_IDMOTIVOEVENTO.Clear;
end;

procedure TfrmAdministracionEventos.tbNuevoClick(Sender: TObject);
var
  iValorAnterior: Integer;
begin
  iValorAnterior := Contrato;

  if gbFiltrosEmpresa.Visible and (Contrato = 0) then
  begin
    Verificar(fraFiltroEmpresa.IsEmpty, fraFiltroEmpresa.edContrato, 'Debe seleccionar una empresa para poder dar de alta un evento.');
    FContrato := fraFiltroEmpresa.Contrato;
  end;

  inherited;

  FContrato := iValorAnterior;
end;

procedure TfrmAdministracionEventos.frafpSE_IDMOTIVOEVENTOcmbDescripcionDropDown(Sender: TObject);
var
  sCadenaPrevia: String;
begin
  sCadenaPrevia := frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition;

  if not fraSE_SECTORINVOLUCRADO.IsEmpty then
    frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition +
                                                         ' AND me_sector = ' + SqlValue(fraSE_SECTORINVOLUCRADO.AsString);
  if not frafpSE_IDCODIGOINGRESO.IsEmpty then
    frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition +
                                                         ' AND me_idingresoevento = ' + SqlValue(frafpSE_IDCODIGOINGRESO.Value);
  frafpSE_IDMOTIVOEVENTO.cmbDescripcionDropDown(Sender);
  frafpSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := sCadenaPrevia;
end;

procedure TfrmAdministracionEventos.DoABMHijos;
begin
// para implementar en las agendas hijas
end;

procedure TfrmAdministracionEventos.btnContactosClick(Sender: TObject);
begin
  with TfrmContratoContacto.Create(Self) do
  begin
    DoCargarDatos(Contrato, IdEmpresa);
    Show;
  end;
end;

procedure TfrmAdministracionEventos.fpAbmBeforeShow(Sender: TObject);
begin
  if ModoABM = maAlta then
    sdqObservaciones.Close;

  inherited;

  lblEmpresa.Caption := NombreEmpresa;
  pcPaginas.ActivePage := tsDatos;
end;

procedure TfrmAdministracionEventos.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un evento para poder cerrarlo.');

  inherited;

  if Is_PermitirCerrarEvento then
    if MsgAsk('Se dispone a cerrar el evento seleccionado.' + #10#13 + '¿ Realmente desea hacerlo ?') then
    begin
      Do_CerrarEvento(sdqConsulta.FieldByName('identificadorevento').AsInteger, True);
      RefreshData;
    end;
end;

procedure TfrmAdministracionEventos.fraSE_IDMOTIVOEVENTOcmbDescripcionDropDown(Sender: TObject);
begin
  if not fraSE_IDCODIGOINGRESO.IsEmpty then
    fraSE_IDMOTIVOEVENTO.Propiedades.ExtraCondition := ' AND me_idingresoevento = ' + SqlValue(fraSE_IDCODIGOINGRESO.Value);

  fraSE_IDMOTIVOEVENTO.cmbDescripcionDropDown(Sender);
end;

procedure TfrmAdministracionEventos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
																											var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if (not sdqConsulta.FieldByName('se_fechacomprometida').IsNull) and (sdqConsulta.FieldByName('se_fecharealizado').IsNull) then
    if sdqConsulta.FieldByName('se_fechacomprometida').AsDateTime < sdqConsulta.FieldByName('horaactual').AsDateTime then
      AFont.Color := clPurple;

  if Highlight then
    Background := TColor($A4A0A0);

  if (not sdqConsulta.FieldByName('se_fechabaja').IsNull) then
    AFont.Style := AFont.Style + [fsStrikeOut];
end;

function TfrmAdministracionEventos.Is_PantallaAmpliada(aDesdeGrilla: Boolean = False): Boolean;
begin
  if aDesdeGrilla then
    Result := (sdqConsulta.FieldByName('ie_codigo').AsString = 'CD')
  else
    Result := (frafpSE_IDCODIGOINGRESO.sdqDatos.FieldByName('ie_codigo').AsString = 'CD');
end;

function TfrmAdministracionEventos.Is_DerivacionTelefonica(aDesdeGrilla: Boolean = False): Boolean;
begin
  if aDesdeGrilla then
    Result := (sdqConsulta.FieldByName('ie_conderivaciontelef').AsString = 'S')
  else
    Result := (frafpSE_IDCODIGOINGRESO.sdqDatos.FieldByName('ie_conderivaciontelef').AsString = 'S');
end;

procedure TfrmAdministracionEventos.FSFormShow(Sender: TObject);
begin
  inherited;
  
  if FormStyle = fsNormal then
  begin
    SortDialog.SortBy(SortDialog.SortFields.ItemsByField['fecha'], otDescending);
    RefreshData;
  end;
end;

function TfrmAdministracionEventos.ShowModalEx(AContrato: Integer): Integer;
begin
  Filtros(False);
  Contrato := AContrato;
  Result := inherited ShowModal;
end;

procedure Do_CerrarEvento(aIdEvento: TTableId; aPreguntarRespuesta: Boolean = False);
var
  bCerrar: Boolean;
  sSql: String;
  tslTexto: TStrings;
begin
  tslTexto := TStringList.Create;
  try
    if aPreguntarRespuesta then
    begin
      if InputMemoBox('Respuesta', tslTexto) then
      begin
        bCerrar := True;
      end
      else
      begin
        bCerrar := False;
        MsgBox('El evento no puede ser cerrado si usted no provee una respuesta.');
      end;
    end
    else
      bCerrar := True;

    if bCerrar then
    begin
      sSql :=
        'UPDATE cse_seguimientoevento' +
          ' SET se_usurealizado = :usurealizado,' +
              ' se_fecharealizado = SYSDATE,' +
              ' se_observacionrealizado = NVL(:observacionrealizado, se_observacionrealizado),' +
              ' se_fechaaltarealizado = SYSDATE' +
        ' WHERE se_identificador = :identificador';
      EjecutarSqlEx(sSql, [Sesion.UserID, tslTexto.Text, aIdEvento]);
    end;
  finally
    tslTexto.Free;
  end;
end;

function TfrmAdministracionEventos.Is_PermitirCerrarEvento: Boolean;
begin
  if ModoABM = maModificacion then
  begin
    Verificar(not sdqConsulta.FieldByName('se_usurealizado').IsNull, nil, 'El evento ya se encuentra cerrado.');
    if Is_PantallaAmpliada then
      Verificar(not Is_PermisoRespUsuarioSector(fraSE_SECTORINVOLUCRADO_2.Codigo), nil, 'Usted no tiene permiso para modificar el evento seleccionado.')
    else
      Verificar(not Is_PermisoRespUsuarioSector(fraSE_SECTORINVOLUCRADO.Codigo), nil, 'Usted no tiene permiso para modificar el evento seleccionado.')
  end
  else if ModoABM <> maAlta then
  begin
    Verificar(sdqConsulta.FieldByName('respuesta').IsNull, nil, 'El evento no tiene una respuesta seleccionada.');
    Verificar(not sdqConsulta.FieldByName('se_usurealizado').IsNull, nil, 'El evento ya se encuentra cerrado.');
    Verificar(not Is_PermisoRespUsuarioSector(sdqConsulta.FieldByName('se_sectorinvolucrado').AsString), nil, 'Usted no tiene permiso para modificar el evento seleccionado.');
  end;

  Result := True;
end;

function Is_PermisoRespUsuarioSector(aSector: String): Boolean;
var
  sSql: String;
begin
  if Sesion.Sector = ASector then
    Result := True
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM cpr_permisorespuesta' +
      ' WHERE pr_usuario = :usuario' +
        ' AND pr_sector = :sector' +
        ' AND pr_fechabaja IS NULL';
    Result := ExisteSqlEx(sSql, [Sesion.UserID, ASector]);
  end;
end;

procedure TfrmAdministracionEventos.btnCerrarClick(Sender: TObject);
var
  iEvento: Integer;
begin
  iEvento := sdqConsulta.FieldByName('identificadorevento').AsInteger;
  FCerrando := True;
  try
    inherited btnAceptarClick(Sender);
    Do_CerrarEvento(iEvento);
    RefreshData;
  finally
    FCerrando := False;
  end;
end;

procedure TfrmAdministracionEventos.DoArmarSqlBusquedaAdicional;
begin
  FSql := SQL_BASE;
end;

procedure TfrmAdministracionEventos.AbrirIdentificador(aIdentificador: Integer);
begin
  FIdentificador := AIdentificador;
  DoArmarSqlBusquedaAdicional;

  AddCondition(FSql, ' se_identificador = ' + SqlValue(aIdentificador));

  sdqConsulta.SQL.Text := FSql + SortDialog.OrderBy;
  OpenQuery(sdqConsulta);
  tbModificar.Click;
end;

function TfrmAdministracionEventos.GetIdEvento: Integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    Result := sdqConsulta.FieldByName('identificadorevento').AsInteger
  else
    Result := -1;
end;

procedure TfrmAdministracionEventos.fraEmpresaChange(Sender: TObject);
begin
  sdqConsulta.Close;
  if fraFiltroEmpresa.IsSelected then
    tbRefrescar.Click;
end;

procedure TfrmAdministracionEventos.btnAceptarClick(Sender: TObject);
begin
  //inherited; No quiero que haga lo que hace el TfrmCustomGridABM
  if Validar and DoABM then
  begin
    if (ModoABM = maModificacion) and sdqConsulta.Active then
    begin
      sdqConsulta.Refresh;
      CheckButtons;
    end
    else
    begin
      tbRefrescarClick(nil);
      sdqConsulta.Locate('idevento', Sql.PrimaryKey[0].Value, []);
    end;

    fpABM.ModalResult := mrOk;
  end;
end;

procedure TfrmAdministracionEventos.fraSE_SECTORINVOLUCRADO_2PropiedadesChange(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  fraSE_IDMOTIVOEVENTO_2.Clear;

  if fraSE_SECTORINVOLUCRADO_2.Codigo = 'EMI' then
  begin
    sSql :=
      'SELECT as_usuario' +
       ' FROM aco_contrato, ias_asesoremision' +
      ' WHERE as_fechabaja IS NULL' +
        ' AND co_idasesoremision = as_id' +
        ' AND co_contrato = :contrato';
    frafpSE_USUARIODERIVACIONTELEF.Codigo := ValorSqlEx(sSql, [Contrato])
  end
  else if fraSE_SECTORINVOLUCRADO_2.Codigo = 'COME' then
  begin
    sSql :=
      'SELECT se_usuario' +
       ' FROM art.use_usuarios' +
      ' WHERE se_id = art.varios.get_responsablecomercial(:contrato)';
    frafpSE_USUARIODERIVACIONTELEF.Codigo := ValorSqlEx(sSql, [Contrato])
  end
  else
    frafpSE_USUARIODERIVACIONTELEF.Clear;
end;

procedure TfrmAdministracionEventos.fraSE_IDMOTIVOEVENTO_2PropiedadesChange(Sender: TObject);
begin
  if (cmbSE_FECHACOMPROMETIDA.Date = 0) and fraSE_IDMOTIVOEVENTO_2.IsSelected then
    cmbSE_FECHACOMPROMETIDA.Date := CalcDiasHabiles(cmbSE_FECHA.Date, fraSE_IDMOTIVOEVENTO_2.sdqDatos.FieldValues['me_diashab']);
end;

procedure TfrmAdministracionEventos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmAdministracionEventos.CalcTotales;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmAdministracionEventos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not AreIn(Sesion.Sector, ['CALIDAD', 'COMPUTOS']), tbEliminar, 'Para dar de baja un evento, comuníquese con el sector CALIDAD.');
  inherited;
end;

end.
