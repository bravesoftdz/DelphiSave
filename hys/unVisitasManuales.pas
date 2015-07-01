unit unVisitasManuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, RxPlacemnt,
  unFraCodigoDescripcion, Vcl.CheckLst, RxToolEdit, unFraDomicilio,
  unfraEstablecimientoDomic, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, JvgGroupBox;

type
  TfrmVisitasManuales = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    pcEmpresa: TPageControl;
    tbAfiliada: TTabSheet;
    Label6: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstableci: TfraEstablecimientoDomic;
    tbNoAfiliada: TTabSheet;
    Label13: TLabel;
    lbRSocial: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    fraDomicilio: TfraDomicilio;
    mskCUIT: TMaskEdit;
    edRSocial: TEdit;
    edContacto: TEdit;
    edTelefono: TEdit;
    Label7: TLabel;
    edFechaDesde: TDateEdit;
    Label11: TLabel;
    edFechaHasta: TDateEdit;
    chkTareas: TCheckListBox;
    Label8: TLabel;
    Label10: TLabel;
    fraPreventor: TfraCodigoDescripcion;
    gbDetalleTareas: TJvgGroupBox;
    dbgDetalleTareas: TArtDBGrid;
    sdqDetalleTareas: TSDQuery;
    dsDetalleTareas: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbDetalleTareasExpanded(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
  private
    procedure OnEmpresaChange(Sender: TObject);
    procedure CargarTareas; overload;
    procedure CargarTareas(aIdPlan: integer); overload;
    procedure DesmarcarItems;
    procedure GuardarTareasManuales(aIdVisitaManual: integer);
    procedure CargarDetalle;
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmVisitasManuales: TfrmVisitasManuales;

implementation

uses unCustomConsulta, CustomDlgs, unDmPrincipal, unSesion, SqlFuncs, Cuit,
  Math, VclExtra, DateTimeFuncs, AnsiSql;

{$R *.dfm}

{ TfrmManZonaCotizacion }

procedure TfrmVisitasManuales.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  fraEstableci.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;

  mskCUIT.Clear;
  edRSocial.Clear;
  fraDomicilio.Clear;
  edTelefono.Clear;
  edContacto.Clear;

  fraPreventor.Clear;
  fraEmpresa.Locked := false;
  fraEstableci.Locked := false;
  VclExtra.LockControls([edFechaDesde, edFechaHasta], false);

  fraPreventor.Locked := false;
  pcEmpresa.ActivePage := tbAfiliada;
  CargarTareas;
end;

function TfrmVisitasManuales.DoABM: Boolean;
var
  idCodigo : Integer;
begin
  BeginTrans;
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      idCodigo := sdqConsulta.FieldByName('VM_ID').AsInteger;
      Sql.Fields.Add('VM_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('VM_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        idCodigo := GetSecNextVal('HYS.SEQ_HVM_VISITAMANUAL_ID');

        if fraEmpresa.IsSelected then
        begin
          Sql.Fields.Add('VM_IDEMPRESA', fraEmpresa.Value);
          Sql.Fields.Add('VM_ESTABLECI', fraEstableci.Value);
        end
        else begin
          Sql.Fields.Add('VM_CUIT', mskCUIT.Text);
          Sql.Fields.Add('VM_RAZONSOCIAL', edRSocial.Text);
          Sql.Fields.Add('VM_CALLE', fraDomicilio.Calle);
          Sql.Fields.Add('VM_NUMERO', fraDomicilio.Numero);
          Sql.Fields.Add('VM_PISO', fraDomicilio.Piso);
          Sql.Fields.Add('VM_DEPARTAMENTO', fraDomicilio.Departamento);
          Sql.Fields.Add('VM_CPOSTAL', fraDomicilio.CodigoPostal);
          Sql.Fields.Add('VM_LOCALIDAD', fraDomicilio.Localidad);
          Sql.Fields.Add('VM_PROVINCIA', fraDomicilio.Provincia);
          Sql.Fields.Add('VM_CPOSTALA', fraDomicilio.CPA);
          Sql.Fields.Add('VM_TELEFONO', edTelefono.Text);
          Sql.Fields.Add('VM_CONTACTO', edContacto.Text);
        end;
        Sql.Fields.Add('VM_FECHADESDE', edFechaDesde.Date);
        Sql.Fields.Add('VM_FECHAHASTA', edFechaHasta.Date);

        if fraPreventor.IsSelected then
          Sql.Fields.Add('VM_IDPREVENTOR', fraPreventor.Value)
        else
          Sql.Fields.Add('VM_IDPREVENTOR', exNull);

        Sql.Fields.Add('VM_TAREA', '-');
        Sql.Fields.Add('VM_USUALTA', Sesion.UserID);
        Sql.Fields.Add('VM_FECHAALTA', exDateTime);
      end else begin
        Sql.SqlType := stUpdate;
        idCodigo := sdqConsulta.FieldByName('VM_ID').AsInteger;
        Sql.Fields.Add('VM_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('VM_FECHAMODIF', exDateTime );
        Sql.Fields.Add('VM_USUBAJA', exNull );
        Sql.Fields.Add('VM_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('VM_ID', idCodigo);
    EjecutarSQLST(Sql.Sql);
    GuardarTareasManuales(idCodigo);
    EjecutarStoreSTEx('art.hys_plan.do_generartareamanuales(:id);', [idCodigo]);
    CommitTrans;
    Result := True;
  except
    Rollback;
    Result := False;
  end;
end;


procedure TfrmVisitasManuales.GuardarTareasManuales(aIdVisitaManual: integer);
var
  i: integer;
begin
  for i:=0 to chkTareas.Count - 1 do
  begin
    if chkTareas.Checked[i] then
    begin
      if ExisteSqlEx(' SELECT 1 ' +
                     '  FROM hys.htm_tareamanual ' +
                     ' WHERE tm_idtarea = :idtarea ' +
                     '  AND tm_idvisitamanual = :id ', [integer(chkTareas.Items.Objects[i]),
                                                          aIdVisitaManual]) then
      begin
        EjecutarSqlSTEx(' UPDATE hys.htm_tareamanual ' +
                        ' SET tm_fechabaja = null, ' +
                        '     tm_usubaja = null, ' +
                        '     tm_fechamodif = sysdate, ' +
                        '     tm_usumodif = :usuario ' +
                        ' WHERE tm_idtarea = :idtarea ' +
                        '  AND tm_idvisitamanual = :idplan ', [Sesion.LoginName,
                                                               integer(chkTareas.Items.Objects[i]),
                                                               aIdVisitaManual])
      end
      else begin
        EjecutarSqlSTEx(' INSERT INTO hys.htm_tareamanual(tm_id, tm_idtarea, ' +
                        '                                 tm_idvisitamanual, tm_fechaalta, tm_usualta) ' +
                        ' VALUES(hys.seq_htm_tareamanual_id.nextval, :idtarea:, ' +
                        '        :idvisitamanual, sysdate, :usuario) ', [integer(chkTareas.Items.Objects[i]),
                                                                         aIdVisitaManual,
                                                                         Sesion.LoginName]);
      end;
    end
    else
      EjecutarSqlSTEx(' UPDATE hys.htm_tareamanual ' +
                  ' SET tm_fechabaja = sysdate, ' +
                  '     tm_usubaja = :usuario ' +
                  ' WHERE tm_idtarea = :idtarea ' +
                  '  AND tm_idvisitamanual = :idplan ', [Sesion.LoginName,
                                                         integer(chkTareas.Items.Objects[i]),
                                                         aIdVisitaManual])

  end;
end;

procedure TfrmVisitasManuales.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'vm_fechabaja';
  Sql.TableName := 'hys.hvm_visitamanual';

  fraEmpresa.OnChange := OnEmpresaChange;
  fraEmpresa.ShowBajas := True;

  fraEstableci.ShowBajas := True;
  ShowActived := false;

  with fraPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  CargarTareas;
end;

procedure TfrmVisitasManuales.gbDetalleTareasExpanded(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmVisitasManuales.LoadControls;
begin
  inherited;

  if not sdqConsulta.FieldByName('VM_IDEMPRESA').IsNull then
  begin
    pcEmpresa.ActivePage := tbAfiliada;
    fraEmpresa.Locked := true;
    fraEstableci.Locked := true;
    fraEmpresa.Value := sdqConsulta.FieldByName('VM_IDEMPRESA').AsInteger;
    OnEmpresaChange(self);
    fraEstableci.Value := sdqConsulta.FieldByName('VM_ESTABLECI').AsInteger;
  end
  else begin
    pcEmpresa.ActivePage := tbNoAfiliada;
    mskCUIT.Text := sdqConsulta.FieldByName('EM_CUIT').AsString;
    edRSocial.Text := sdqConsulta.FieldByName('EM_NOMBRE').AsString;
    fraDomicilio.Calle := sdqConsulta.FieldByName('VM_CALLE').AsString;
    fraDomicilio.Numero := sdqConsulta.FieldByName('VM_NUMERO').AsString;
    fraDomicilio.Piso := sdqConsulta.FieldByName('VM_PISO').AsString;
    fraDomicilio.Departamento := sdqConsulta.FieldByName('VM_DEPARTAMENTO').AsString;
    fraDomicilio.CodigoPostal := sdqConsulta.FieldByName('ES_CPOSTAL').AsString;
    fraDomicilio.Localidad := sdqConsulta.FieldByName('VM_LOCALIDAD').AsString;
    fraDomicilio.Prov := sdqConsulta.FieldByName('ES_PROVINCIA').AsInteger;
    fraDomicilio.CPA := sdqConsulta.FieldByName('ES_CPOSTALA').AsString;
    edTelefono.Text := sdqConsulta.FieldByName('DC_TELEFONOS').AsString;
    edContacto.Text := sdqConsulta.FieldByName('VM_CONTACTO').AsString;
  end;

  VclExtra.LockControls([edFechaDesde, edFechaHasta], true);
  fraPreventor.Locked := true;

  edFechaDesde.Date := sdqConsulta.FieldByName('VM_FECHADESDE').AsDateTime;
  edFechaHasta.Date := sdqConsulta.FieldByName('VM_FECHAHASTA').AsDateTime;
  fraPreventor.Value := sdqConsulta.FieldByName('VM_IDPREVENTOR').AsInteger;
  CargarTareas;
  CargarTareas(sdqConsulta.FieldByName('VM_ID').AsInteger);
end;

function TfrmVisitasManuales.Validar: Boolean;
begin
  Verificar(fraEmpresa.IsSelected and ((trim(mskCUIT.Text) <> '') or (trim(edRSocial.Text)<> '')), tbAfiliada, 'No pueden estar completos datos de una empresa afilidada y otra no afiliada.');
  if fraEmpresa.IsSelected then
  begin
    Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
    Verificar(not fraEstableci.IsSelected, fraEstableci, 'Debe seleccionar un establecimiento.');
  end
  else begin
    Verificar((mskCUIT.Text <> '') and not IsCuit(mskCUIT.Text), mskCUIT, 'El Cuit es inválido,');
    Verificar(trim(edRSocial.Text)='', edRSocial, 'Debe ingresar el nombre de la empresa.');
    Verificar(not fraDomicilio.IsSelected, fraDomicilio, 'Debe ingresar un domicilio.');
    Verificar(trim(edContacto.Text) = '', edContacto, 'Debe ingresar un contacto.');
  end;
  Verificar(edFechaDesde.Date = 0, edFechaDesde, 'Debe ingresar una fecha desde.');
  Verificar(edFechaHasta.Date = 0, edFechaHasta, 'Debe ingresar una fecha hasta.');
  Verificar(edFechaHasta.Date < edFechaHasta.Date, edFechaHasta, 'La fecha hasta debe ser mayor o igual a la fecha desde.');

  Verificar(CheckListCount(chkTareas) = 0, chkTareas, 'Seleccione alguna tarea.');
  MsgBox('Atención. Si realizó modificaciones o bajas sólo se plasmarán para las nuevas tareas. Realice los cambios en el módulo de visitas para el plan actual', MB_ICONINFORMATION);

  result := true;
end;

procedure TfrmVisitasManuales.DesmarcarItems;
var
  i: integer;
begin
  for i:=0 to chkTareas.Count-1 do
    chkTareas.Checked[i] := false;
end;

procedure TfrmVisitasManuales.CargarTareas;
begin
  chkTareas.Clear;
  with GetQuery('SELECT * FROM HYS.HTA_TAREA WHERE TA_VISIBLE = ''S'' AND TA_FECHABAJA IS NULL ORDER BY 2') do
  try
    while not Eof do
    begin
      chkTareas.AddItem(FieldByName('TA_DESCRIPCION').AsString, TObject(FieldByName('TA_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmVisitasManuales.CargarTareas(aIdPlan: integer);
var
  i: integer;
begin
  DesmarcarItems;
  with GetQueryEx('select * from hys.htm_tareamanual where tm_idvisitamanual = :id and tm_fechabaja is null', [aIdPlan]) do
  try
    while not Eof do
    begin
      for i:=0 to chkTareas.Count-1 do
        if integer(chkTareas.Items.Objects[i]) = FieldByName('TM_IDTAREA').AsInteger then
        begin
          chkTareas.Checked[i] := true;
          chkTareas.Items.Move(i, 0);
        end;
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmVisitasManuales.OnEmpresaChange(Sender: TObject);
begin
  fraEstableci.CUIT := fraEmpresa.CUIT;
end;


procedure TfrmVisitasManuales.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqDetalleTareas.Close;
end;

procedure TfrmVisitasManuales.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmVisitasManuales.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmVisitasManuales.CargarDetalle;
begin
  if not gbDetalleTareas.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqDetalleTareas.Close;
    sdqDetalleTareas.ParamByName('idvisita').Value := sdqConsulta.fieldbyname('vm_id').AsInteger;
    sdqDetalleTareas.Open;
  end;
end;

end.
