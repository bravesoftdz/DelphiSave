unit unEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CheckLst, ARTCheckListBox,
  Mask, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraUsuario, unfraUsuarios;

type
  TfrmEventos = class(TfrmCustomGridABM)
    fraTipoEvento: TfraCodigoDescripcion;
    Label3: TLabel;
    cbMuestraEstableci: TCheckBox;
    edFechaEvento: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edObservacion: TRichEdit;
    Label4: TLabel;
    fraUsuario: TfraUsuario;
    lblUsuario: TLabel;
    cbRegistrar: TCheckBox;
    fraPreventor: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure fraTipoEventoOnChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cbRegistrarClick(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure FiltrarPreventor(Sender: TObject; fraPreventor: TfraCodigoDescripcion);
  private
    { Private declarations }
    FTipo : String;
    FCuit : String;
    FEstableci : Integer;
    FOperativo : String;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    procedure Load(ACuit : String; AEstableci : Integer; ATipo, AOperativo : String);

  end;

var
  frmEventos: TfrmEventos;

implementation

{$R *.dfm}
uses  unCustomConsulta, CustomDlgs, unDmPrincipal, StrFuncs, VCLExtra, SqlOracle,
      unSesion, SQLFuncs;

procedure TfrmEventos.FormCreate(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraUsuario], true);
  FieldBaja := 'ee_fechabaja';
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  sdqConsulta.ParamByName('tipo').AsString := FTipo;
  sdqConsulta.ParamByName('operativo').AsString := FOperativo;

  with fraTipoEvento do
  begin
    TableName   := 'hys.hte_tipoevento';
    FieldID     := 'TE_ID';
    FieldCodigo := 'TE_ID';
    FieldDesc   := 'TE_DESCRIPCION';
    Showbajas   := false;
    ExtraCondition := ' and te_manual = ''S'' ';
    OnChange := fraTipoEventoOnChange;
    ExtraFields := ' , te_muestracuit ';
  end;
  with fraPreventor do
  begin
    TableName   := 'PIT_FIRMANTES';
    FieldID     := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldDesc   := 'IT_NOMBRE';
    Showbajas   := false;
    CaseSensitive := false;
    FieldBaja := 'IT_FECHABAJA';
  end;
  with frausuario do
  begin
    Showbajas   := false;
    Sector := 'HYS';
  end;


end;

function TfrmEventos.DoABM : Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'HYS.HEE_EVENTOEMPRESA';
  if ModoABM = maBaja Then
  begin
    Sql.Fields.Add('EE_USUBAJA', Sesion.UserID );
    Sql.Fields.Add('EE_FECHABAJA', exDateTime );
    Sql.PrimaryKey.Add('EE_ID',sdqConsulta.fieldbyname('EE_ID').AsString);
    Sql.SqlType := stUpdate;
  end else
  begin
    if cbRegistrar.Checked then
    begin
      Sql.Fields.Add('EE_IDPREVENTOR',exNull);
      Sql.Fields.Add('EE_USUARIO',fraUsuario.UserID);
    end
    else
    begin
      Sql.Fields.Add('EE_IDPREVENTOR',fraPreventor.Codigo);
      Sql.Fields.Add('EE_USUARIO',exNull);
    end;
    Sql.Fields.Add('EE_FECHAEVENTO',edFechaEvento.Date);
    Sql.Fields.Add('EE_IDTIPOEVENTO',fraTipoEvento.Codigo);
    if cbMuestraEstableci.Checked then
      Sql.Fields.Add('EE_MUESTRACUIT','S')
    else
      Sql.Fields.Add('EE_MUESTRACUIT','N');
    Sql.Fields.Add('EE_OBSERVACION',edObservacion.Text);
    Sql.Fields.Add('EE_ESTABLECIMIENTO',FEstableci);
    Sql.Fields.Add('EE_CUIT',FCuit);
    Sql.Fields.Add('EE_TIPO',FTipo);
    Sql.Fields.Add('EE_OPERATIVO',FOperativo);
    if ModoABM = maAlta Then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.Add('EE_ID',GetSecNextVal('HYS.SEQ_HEE_ID'));
      Sql.Fields.Add('EE_USUALTA', Sesion.UserID );
      Sql.Fields.Add('EE_FECHAALTA', exDateTime );
    end else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('EE_ID',sdqConsulta.fieldbyname('EE_ID').AsString);
      Sql.Fields.Add('EE_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('EE_FECHAMODIF', exDateTime );
      Sql.Fields.Add('EE_USUBAJA', exNull );
      Sql.Fields.Add('EE_FECHABAJA', exNull );
    end;
  end;

  EjecutarSQLST(Sql.Sql);
  result:= true;
end;


procedure TfrmEventos.ClearControls;
begin
  edFechaEvento.Clear;
  fraTipoEvento.Clear;
  edObservacion.Clear;
  fraPreventor.Clear;
  fraUsuario.Limpiar;
  cbMuestraEstableci.Checked := False;
  cbRegistrar.Checked := False;
  VCLExtra.LockControls([fraUsuario], True);
  VCLExtra.LockControls([frapreventor], False);
end;

procedure TfrmEventos.Load(ACuit : String; AEstableci : Integer; ATipo, AOperativo : String);
begin
  FCuit      := ACuit;
  FEstableci := AEstableci;
  FTipo      := ATipo;
  FOperativo := AOperativo;
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  sdqConsulta.ParamByName('tipo').AsString := FTipo;
  sdqConsulta.ParamByName('operativo').AsString := FOperativo;

  tbRefrescarClick(nil);
end;

procedure TfrmEventos.LoadControls;
begin
  inherited;
  ClearControls;
  edFechaEvento.Date := sdqConsulta.FieldByName('EE_FECHAEVENTO').AsDateTime;
  fraTipoEvento.Codigo := sdqConsulta.FieldByName('EE_IDTIPOEVENTO').AsString;
  edObservacion.Text := sdqConsulta.FieldByName('EE_OBSERVACION').AsString;
  if not sdqConsulta.FieldByName('EE_IDPREVENTOR').IsNull then
  begin
    cbRegistrar.Checked := False;
    fraPreventor.Codigo := sdqConsulta.FieldByName('EE_IDPREVENTOR').AsString;
  end
  else
  begin
    cbRegistrar.Checked := True;
    fraUsuario.Cargar(sdqConsulta.FieldByName('EE_USUARIO').AsString);
  end;
  cbMuestraEstableci.Checked := sdqConsulta.FieldByName('EE_MUESTRACUIT').AsString = 'S';
end;

function TfrmEventos.Validar : Boolean;
begin
  Verificar(edFechaEvento.Date = 0 ,edFechaEvento,'Debe tener una fecha de evento.');
  Verificar(fraTipoEvento.IsEmpty, fraTipoEvento,'Debe tener un tipo de evento.');
  if cbRegistrar.Checked then
    Verificar(fraUsuario.IsEmpty, fraUsuario,'Debe Seleccionar un Usuario')
  else
    Verificar(fraPreventor.IsEmpty, fraPreventor,'Debe Seleccionar un Preventor');
  if (ModoABM = maAlta) or (edFechaEvento.Date <> sdqConsulta.FieldByName('ee_fechaevento').AsDateTime) then
  Verificar(ExisteSql(' SELECT 1 '+
                      '   FROM hys.hee_eventoempresa '+
                      '  WHERE ee_cuit = '+SqlValue(FCuit)+
                      '    AND ee_establecimiento = '+SqlValue(FEstableci)+
                      '    AND ee_tipo = '+SqlValue(FTipo)+
                      '    AND ee_operativo = '+SqlValue(FOperativo)+
                      '    AND ee_idtipoevento = '+SqlValue(fraTipoEvento.Codigo)+
                      '    AND ee_fechaevento = '+SqlDate(edFechaEvento.Date))
             , edFechaEvento,'Ya existe el evento para el cuit,fecha de evento y establecimiento seleccionado.');
  result := true;
end;


procedure TfrmEventos.fraTipoEventoOnChange(Sender: TObject);
begin
  if not fraTipoEvento.IsEmpty and not fraTipoEvento.sdqDatos.FieldByName('te_muestracuit').IsNull then
  begin
     cbMuestraEstableci.Checked := fraTipoEvento.sdqDatos.FieldByName('TE_MUESTRACUIT').AsString = 'S'
  end;
end;

procedure TfrmEventos.tbModificarClick(Sender: TObject);
begin

  if sdqConsulta.FieldByName('TE_MANUAL').AsString = 'N' then
  begin
        msgbox('No puede ser modificado este Evento.');
        Abort;
  end;
  inherited;
end;

procedure TfrmEventos.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('TE_MANUAL').AsString = 'N' then
  begin
        msgbox('No puede ser eliminado este Evento.');
        Abort;
  end;

end;

procedure TfrmEventos.tbRefrescarClick(Sender: TObject);
var
  sSQL : string;
begin
  sSQL :=
    ' SELECT ee_observacion, ee_idtipoevento, te_descripcion, nvl(ee_fechaevento,trunc(ee_fechaalta)) as ee_fechaevento, ' +
    '        se_nombre, it_nombre, ee_fechabaja, ee_muestracuit, ee_id, te_manual, ' +
    '        te_muestracuit, ee_idpreventor, ee_usuario, ee_establecimiento, ' +
    '        es_nombre ' +
    '   FROM afi.aes_establecimiento, ' +
    '        hys.hee_eventoempresa, ' +
    '        hys.hte_tipoevento, ' +
    '        art.pit_firmantes, ' +
    '        art.use_usuarios ' +
    '  WHERE es_contrato(+) = art.afiliacion.get_contratovigente(ee_cuit, SYSDATE) ' +
    '    AND es_nroestableci(+) = ee_establecimiento ' +
    '    AND ee_idtipoevento = te_id  '+
    '    AND ee_usuario = se_usuario(+) ' +
    '    AND ee_idpreventor = it_id(+) ' +
    '    AND ee_cuit = :cuit ' +
    '    AND (ee_establecimiento = :estableci or ee_muestracuit = ''S'')' +
    '    AND ee_tipo = :tipo ' +
    '    AND ee_operativo = :operativo ' +
    'ORDER BY ee_fechaevento desc ';

  sdqconsulta.SQL.Clear;
  sdqconsulta.SQL.Add(sSQL);
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  sdqConsulta.ParamByName('tipo').AsString := FTipo;
  sdqConsulta.ParamByName('operativo').AsString := FOperativo;
  inherited;
end;

procedure TfrmEventos.cbRegistrarClick(Sender: TObject);
begin
  if cbRegistrar.Checked then
  begin
    VCLExtra.LockControls([fraUsuario], False);
    VCLExtra.LockControls([frapreventor], True);
    frapreventor.Clear;
  end
  else
  begin
    fraUsuario.Limpiar;
    VCLExtra.LockControls([fraUsuario], True);
    VCLExtra.LockControls([frapreventor], False);
  end;
end;

procedure TfrmEventos.fraPreventorcmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventor);
end;

procedure TfrmEventos.FiltrarPreventor(
  Sender: TObject; fraPreventor: TfraCodigoDescripcion);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
      fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text := copy(fraPreventor.cmbDescripcion.Text, 2, length(fraPreventor.cmbDescripcion.Text));
end;
end.
