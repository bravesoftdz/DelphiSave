unit unManTurnosMedicos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, ImgList, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, IntEdit, unArtFrame, unFraCodigoDescripcion,AnsiSQL,
  FormPanel,StrFuncs,Customdlgs,StrUtils, RXSpin, Buttons, Mask, ToolEdit,
  DateComboBox, unFraCodDesc, unArtDBAwareFrame, RxToolEdit, RxPlacemnt;

type
  TfrmManTurnosMedicos = class(TfrmCustomConsulta)
    FPABM: TFormPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CmbDia: TComboBox;
    framedicoABM: TfraCodigoDescripcion;
    dtHoraDesde: TDateTimePicker;
    dtHoraHasta: TDateTimePicker;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edFrecuencia: TRxSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    dtHoraDesde2: TDateTimePicker;
    dtHoraHasta2: TDateTimePicker;
    Label8: TLabel;
    bvNomTop: TBevel;
    Bevel1: TBevel;
    fraMedico: TfraCodigoDescripcion;
    Label2: TLabel;
    Label9: TLabel;
    fpLicencias: TFormPanel;
    Label12: TLabel;
    Bevel3: TBevel;
    Label17: TLabel;
    DTPHasta: TDateComboBox;
    Label10: TLabel;
    DTPDesde: TDateComboBox;
    Label11: TLabel;
    fraTarea: TfraCodigoDescripcion;
    btnAgregarLicencia: TBitBtn;
    btnQuitarLicencia: TBitBtn;
    btnCerrarLicencia: TBitBtn;
    dgLicencias: TArtDBGrid;
    Bevel2: TBevel;
    dsLicencias: TDataSource;
    sdqLicencias: TSDQuery;
    fraMedicoLic: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAgregarLicenciaClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure btnQuitarLicenciaClick(Sender: TObject);
    procedure fraMedicoLicExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sHoraDesde, sHoraDesde2, sHoraHasta, sHoraHasta2 :String;
    procedure DoInsertarTurno;
    procedure DoModificarTurno;
    procedure DoCargarTurno;
    procedure DoRefrescarGrillaLic;
    function ValidarDatos :Boolean;
    function ValidarLicencia :Boolean;
  end;

var
  frmManTurnosMedicos: TfrmManTurnosMedicos;

implementation

uses
  unSesion, unDmPrincipal, DateTimeFuncs;

{$R *.DFM}

procedure TfrmManTurnosMedicos.tbRefrescarClick(Sender: TObject);
var
  sSql:String;
begin
  sSql:='SELECT tm_dia, DECODE(tm_dia,2,''Lunes'',3,''Martes'',4,''Miercoles'',5,''Jueves'',6,''Viernes'',7,''Sábado'') Dia,' +
              ' tm_auditor CodMedico, au_nombre NombreMedico, tm_horadesde, ' +
              ' tm_horahasta, tm_horadesde2, tm_horahasta2, tm_frecuencia, tm_fechabaja ' +
        '	 FROM stm_turnosmedicos, mau_auditores' +
        '	WHERE tm_auditor=au_auditor';
  if not(fraMedico.IsEmpty) then
    sSql := sSql + ' AND tm_auditor = ' + SqlInt(StrToInt(fraMedico.Codigo));
  sSql := sSql + sortdialog.OrderBy ;
  sdqConsulta.Sql.Text := sSql;
  inherited;
end;

procedure TfrmManTurnosMedicos.btnAceptarClick(Sender: TObject);
begin
  if ValidarDatos then
  begin
    sHoraDesde  := TimeToString(dtHoraDesde.Time, True, thMinutos);
    sHoraHasta  := TimeToString(dtHoraHasta.Time, True, thMinutos);
    sHoraDesde2 := TimeToString(dtHoraDesde2.Time, True, thMinutos);
    sHoraHasta2 := TimeToString(dtHoraHasta2.Time, True, thMinutos);
    if (FPABM.Tag = 0) then //nuevo o replica
      DoInsertarTurno
    else
      DoModificarTurno;
    FPABM.ModalResult := mrOk;
  end;
end;

procedure TfrmManTurnosMedicos.tbNuevoClick(Sender: TObject);
begin
  FPABM.Tag            := 0;
  FPABM.Caption        := 'Nuevo turno';
  CmbDia.ItemIndex     := 0;
  CmbDia.Enabled       := True;
  dtHoraDesde.Time     := StrToTime('12:00:00');
  dtHoraHasta.Time     := StrToTime('12:00:00');
  dtHoraDesde2.Time    := StrToTime('12:00:00');
  dtHoraHasta2.Time    := StrToTime('12:00:00');
  edFrecuencia.Text    := '10';
  framedicoABM.Value   := fraMedico.Value;
  if (FPABM.ShowModal = mrOk) then tbRefrescar.Click;
end;

procedure TfrmManTurnosMedicos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraMedico do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
  end;

  with fraMedicoABM do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
  end;

  with fraMedicoLic do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
  end;

  with fraTarea do
  begin
    Sql             := 'SELECT ta_id ID, ta_codigo CODIGO, ' +
                             ' ta_descripcion DESCRIPCION, ta_fechabaja BAJA ' +
                        ' FROM crs_relatareasistema, cta_tarea ' +
                       ' WHERE ta_id = rs_idtarea(+) ' +
                         ' AND (ta_diaria = ''S'' OR ta_diaria IS NULL) ';
    TableName       := 'CTA_TAREA';
    FieldCodigo     := 'TA_CODIGO';
    FieldDesc       := 'TA_DESCRIPCION';
    FieldID         := 'TA_ID';
    FieldBaja       := 'TA_FECHABAJA';
    GroupBy         := 'TA_ID, TA_CODIGO, TA_DESCRIPCION, TA_FECHABAJA';
    ShowBajas       := False;
    OrderBy         := 'TA_DESCRIPCION';
  end;
  DTPDesde.MinDate := dmPrincipal.DBDate + 1;

end;

procedure TfrmManTurnosMedicos.tbModificarClick(Sender: TObject);
begin
  DoCargarTurno;
  FPABM.Tag            := 1;
  FPABM.Caption        := 'Modificar turno';
  CmbDia.Enabled       := False;
  framedicoABM.Enabled := False;
  if (sdqConsulta.FieldByName('TM_FECHABAJA').IsNull) or
     (not(sdqConsulta.FieldByName('TM_FECHABAJA').IsNull) and
     (MessageBox(0, 'Al modificar el registro se activará nuevamente, ¿desea continuar?', 'Confirmar', MB_ICONQUESTION or MB_YESNO)= mrYes))
  then
    if (FPABM.ShowModal = mrOk) then tbRefrescar.Click;
end;

procedure TfrmManTurnosMedicos.tbEliminarClick(Sender: TObject);
begin
  if MessageDlg('¿Esta seguro que desea eliminar el registro activo?', mtConfirmation, [mbYes,mbNo], 0)=mryes then
  begin
    EjecutarSQL('UPDATE stm_turnosmedicos ' +
                  ' SET tm_fechabaja = Actualdate, ' +
                      ' tm_usubaja=' + SqlValue(Sesion.UserID) +
                ' WHERE tm_auditor =' + SqlValue(sdqConsulta.fieldbyname('CodMedico').AsString) +
                  ' AND tm_dia =' + SqlInt(sdqConsulta.fieldbyname('tm_dia').asstring));
    tbRefrescar.Click;
    MsgBox('Registro Eliminado');
  end;
end;

procedure TfrmManTurnosMedicos.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('TM_FECHABAJA').IsNull then
        afont.Color := clred;
end;

function TfrmManTurnosMedicos.ValidarDatos :Boolean;
var
  sSql :String;
begin
  Verificar(framedicoABM.IsEmpty, framedicoABM, 'Debe seleccionar el médico');
  Verificar((dtHoraDesde.Time = dtHoraHasta.Time) and
            (dtHoraDesde2.Time = dtHoraHasta2.Time), dtHoraDesde, 'Debe ingresar al menos un horario');
  Verificar(dtHoraHasta.Time < dtHoraDesde.Time, dtHoraDesde, 'La hora de Inicio debe ser menor a la hora de Fin.');
  Verificar(dtHoraHasta2.Time < dtHoraDesde2.Time, dtHoraDesde2, 'La 2da. hora de Inicio debe ser menor a la 2da. hora de Fin.');
  Verificar((dtHoraDesde2.Time <= dtHoraHasta.Time) and
            (dtHoraDesde2.Time <> dtHoraHasta2.Time), dtHoraDesde2, 'El segundo rango horario debe ser posterior al primero');
  if FPABM.Tag = 0 then
  begin //si es alta verifico que no exista
    sSql := 'SELECT 1 FROM stm_turnosmedicos ' +
            ' WHERE tm_auditor = ' + SqlValue(framedicoABM.Codigo)  +
              ' AND tm_dia = ' + SqlInt(CmbDia.ItemIndex + 2);
    Verificar(ExisteSql(sSql), CmbDia, 'Ya existe un turno del día ' + CmbDia.Text + ' para el médico seleccionado');
  end;
  Result := True;
end;

procedure TfrmManTurnosMedicos.DoInsertarTurno;
var
  sSql :String;
begin
  try
    sSql := 'INSERT INTO stm_turnosmedicos ' +
            ' (tm_auditor, tm_dia, tm_frecuencia, tm_horadesde, tm_horahasta, ' +
            ' tm_horadesde2, tm_horahasta2, tm_usualta, tm_fechaalta) VALUES ( ' +
            SqlInt(StrToInt(framedicoABM.Codigo)) + ',' + SqlInt(CmbDia.ItemIndex + 2) + ',' +
            SqlInt(StrToInt(edFrecuencia.Text)) + ',' + SqlValue(sHoraDesde) + ',' +
            SqlValue(sHoraHasta) + ',' + SqlValue(sHoraDesde2) + ',' + SqlValue(sHoraHasta2) + ',' +
            SqlValue(Sesion.UserID) + ', ActualDate)';
    EjecutarSql(sSql);
    MsgBox('Registro Insertado');
  except
    MsgBox('Ha ocurrido un error al intentar insertar el registro.');
  end;
end;

procedure TfrmManTurnosMedicos.DoModificarTurno;
var
  sSql :String;
begin
  try
    sSql := 'UPDATE stm_turnosmedicos ' +
              ' SET tm_horadesde = ' + SqlValue(sHoraDesde) + ',' +
                  ' tm_horahasta = ' + SqlValue(sHoraHasta) + ',' +
                  ' tm_horadesde2 = ' + SqlValue(sHoraDesde2) + ',' +
                  ' tm_horahasta2 = ' + SqlValue(sHoraHasta2) + ',' +
                  ' tm_frecuencia = ' +  SqlInt(StrToInt(edFrecuencia.Text)) + ',' +
                  ' tm_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' tm_fechamodif = ActualDate, ' +
                  ' tm_usubaja = Null, ' +
                  ' tm_fechabaja = Null ' +
            ' WHERE tm_auditor = ' + SqlValue(framedicoABM.Codigo) +
              ' AND tm_dia = ' + SqlInt(CmbDia.ItemIndex + 2);
    EjecutarSql(sSql);
    MsgBox('Registro Modificado');
  except
    MsgBox('Ha ocurrido un error al intentar modificar el registro.');
  end;
end;

procedure TfrmManTurnosMedicos.tbLimpiarClick(Sender: TObject);
begin
  fraMedico.Clear;
  inherited;
end;

procedure TfrmManTurnosMedicos.DoCargarTurno;
begin
  cmbdia.ItemIndex     := sdqConsulta.fieldbyname('tm_dia').AsInteger - 2;
  framedicoABM.Value   := sdqConsulta.fieldbyname('CodMedico').AsString;
  dtHoraDesde.Time     := StrToTime(sdqConsulta.FieldByName('tm_horadesde').AsString);
  dtHoraHasta.Time     := StrToTime(sdqConsulta.FieldByName('tm_horahasta').AsString);
  dtHoraDesde2.Time    := StrToTime(sdqConsulta.FieldByName('tm_horadesde2').AsString);
  dtHoraHasta2.Time    := StrToTime(sdqConsulta.FieldByName('tm_horahasta2').AsString);
  edFrecuencia.Value   := sdqConsulta.FieldByName('tm_frecuencia').AsInteger;
end;

procedure TfrmManTurnosMedicos.tbPropiedadesClick(Sender: TObject);
begin
  if sdqConsulta.Active and not(sdqConsulta.Eof) then
  begin
    DoCargarTurno;
    FPABM.Tag            := 0;
    FPABM.Caption        := 'Replicar turno';
    CmbDia.Enabled       := True;
    framedicoABM.Enabled := True;
    if (FPABM.ShowModal = mrOk) then tbRefrescar.Click;
  end;
end;

procedure TfrmManTurnosMedicos.DoRefrescarGrillaLic;
begin
  sdqLicencias.Close;
  if not(fraMedicoLic.IsEmpty) then
  begin
    sdqLicencias.ParamByName('IdMedico').AsInteger := StrToInt(fraMedicoLic.Codigo);
    sdqLicencias.Open;
  end;
end;

procedure TfrmManTurnosMedicos.btnAgregarLicenciaClick(Sender: TObject);
var
  sSql :String;
begin
  if ValidarLicencia then
  begin
    sSql := 'INSERT INTO slm_licenciasmedicas ' +
            '(lm_idtarea, lm_idmedico, lm_desde, lm_hasta, ' +
            ' lm_usualta, lm_fechaalta) VALUES (' +
            SqlInt(StrToInt(fraTarea.ID)) + ',' + SqlInt(StrToInt(fraMedicoLic.Codigo)) + ',' +
            SqlDate(DTPDesde.Date) + ',' + SqlDate(DTPHasta.Date) + ',' +
            SqlValue(Sesion.UserID) + ', ActualDate)';
    EjecutarSql(sSql);
    DoRefrescarGrillaLic;
  end;
end;

function TfrmManTurnosMedicos.ValidarLicencia :Boolean;
var
  sSql :String;
begin
  Verificar(fraMedicoLic.IsEmpty, fraMedicoLic, 'Debe seleccionar el médico');
  Verificar(fraTarea.IsEmpty, fraTarea, 'Debe seleccionar la tarea');
  Verificar(DTPDesde.IsEmpty, DTPDesde, 'Debe seleccionar Fecha Desde');
  Verificar(DTPHasta.IsEmpty, DTPHasta, 'Debe seleccionar Fecha Hasta');
  sSql := 'SELECT 1 FROM slm_licenciasmedicas ' +
          ' WHERE lm_idtarea = ' + SqlInt(StrToInt(fraTarea.ID)) +
            ' AND lm_idmedico = ' + SqlInt(StrToInt(fraMedicoLic.Codigo)) +
            ' AND lm_desde = ' + SqlDate(DTPDesde.Date) +
            ' AND lm_fechabaja IS NULL';
  Verificar(ExisteSql(sSql), nil, 'Ya existe la tarea para el médico y fecha dados');

  Result := True;
end;

procedure TfrmManTurnosMedicos.ToolButton4Click(Sender: TObject);
begin
  fraMedicoLic.Value := fraMedico.Value;
  fraTarea.Clear;
  DTPDesde.Clear;
  DTPHasta.Clear;
  DoRefrescarGrillaLic;
  fpLicencias.ShowModal;
end;

procedure TfrmManTurnosMedicos.btnQuitarLicenciaClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqLicencias.Active and
     not(sdqLicencias.Eof) and
     (MessageDlg('¿Confirma la eliminación del registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then begin
    sSql := 'UPDATE slm_licenciasmedicas ' +
              ' SET lm_fechabaja = ActualDate, ' +
                  ' lm_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE lm_idtarea = ' + SqlInt(sdqLicencias.FieldByName('lm_idtarea').AsInteger) +
              ' AND lm_idmedico = ' + SqlInt(sdqLicencias.FieldByName('lm_idmedico').AsInteger) +
              ' AND lm_desde = ' + SqlDate(sdqLicencias.FieldByName('lm_desde').AsDateTime);
    EjecutarSql(sSql);
    DoRefrescarGrillaLic;
  end;
end;

procedure TfrmManTurnosMedicos.fraMedicoLicExit(Sender: TObject);
begin
  DoRefrescarGrillaLic;
end;

procedure TfrmManTurnosMedicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
