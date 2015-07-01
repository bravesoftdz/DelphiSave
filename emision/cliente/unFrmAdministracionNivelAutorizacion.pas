unit unFrmAdministracionNivelAutorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, AnsiSql,
  unFraCodigoDescripcion, ToolEdit, DateComboBox, PatternEdit, IntEdit,
  Mask, CurrEdit, unfraCodigoDescripcionExt, DBCtrls, unSesion, SqlFuncs,
  (*unClassGestion,*) unDmEmision, PeriodoPicker, JvExDBGrids, JvDBGrid,
  JvComponent, JvFormMagnet, JvDBGridExport, Periodo, ExComboBox,
  unArtDBAwareFrame, VclExtra, unObjEmision;

type
  TFrmAdministracionNivelesAutorizacion = class(TfrmCustomGridABM)
    lblNivel: TLabel;
    edtMontoMinimo: TCurrencyEdit;
    lblMontoMinimo: TLabel;
    lblMontoMaximo: TLabel;
    edtMontoMaximo: TCurrencyEdit;
    edtCantidadPeriodosMin: TIntEdit;
    lblPeriodosDesde: TLabel;
    lblPeriodoHasta: TLabel;
    edtCantidadPeriodosMax: TIntEdit;
    edtFechaVigenciaDesdexxx: TDateComboBox;
    lblVigenciaDesde: TLabel;
    lblVigenciaHasta: TLabel;
    edtFechaVigenciaHastaxxx: TDateComboBox;
    fpAsignacionUsuarios: TFormPanel;
    lblNivelAsignacionUsuario: TLabel;
    btnAceptarAsignacionUsuario: TButton;
    btnCancelarAsignacionUsuario: TButton;
    edtNivelAutorizacion: TEdit;
    btnAgregar: TButton;
    btnQuitar: TButton;
    sdqUsuariosDisponibles: TSDQuery;
    sdqUsuariosAsignados: TSDQuery;
    fraNivelAutorizacion: TfraCodigoDescripcionExt;
    lstUsuariosAsignados: TListView;
    btnEliminarTodosUsuarios: TButton;
    btnAgregarTodosUsuarios: TButton;
    lstUsuariosDisponibles: TListView;
    Label1: TLabel;
    edPorcentajeVariacionDevDesde: TIntEdit;
    Label2: TLabel;
    edPorcentajeVariacionDevHasta: TIntEdit;
    fpVerificacionCondiciones: TFormPanel;
    btnSalirVerificacion: TButton;
    JvDBGrid1: TJvDBGrid;
    gbVerificacionPeriodos: TGroupBox;
    ppPeriodos: TPeriodoPicker;
    lblPeriodosFiltro: TLabel;
    ToolBar1: TToolBar;
    tbRefrescarVerificacion: TToolButton;
    btnVerificacion: TToolButton;
    btnCancelarVerificacion: TButton;
    Label3: TLabel;
    mDescripcion: TMemo;
    edtPeriodoDesde: TPeriodoPicker;
    edtPeriodoHasta: TPeriodoPicker;
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    sdqVerificacion: TSDQuery;
    dsVerificacion: TDataSource;
    cbAplicaA: TExComboBox;
    lblAplicaA: TLabel;
    cbTipoNomina: TExComboBox;
    lblTipoNomina: TLabel;
    Label4: TLabel;
    edPorcentajeVariacionEmpDesde: TIntEdit;
    Label6: TLabel;
    edPorcentajeVariacionEmpHasta: TIntEdit;
    Label7: TLabel;
    edPorcentajeVariacionMasaDesde: TIntEdit;
    Label8: TLabel;
    edPorcentajeVariacionMasaHasta: TIntEdit;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnCancelarAsignacionUsuarioClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAgregarTodosUsuariosClick(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnEliminarTodosUsuariosClick(Sender: TObject);
    procedure fpAsignacionUsuariosClose(Sender: TObject;
      var Action: TCloseAction);
    procedure btnAceptarAsignacionUsuarioClick(Sender: TObject);
    procedure btnVerificacionClick(Sender: TObject);
    procedure tbRefrescarVerificacionClick(Sender: TObject);
    procedure cbAplicaAChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CargarUsuariosAsignados(AIdNivelAutorizacion: integer);
    procedure CargarUsuariosDisponibles(AIdNivelAutorizacion: integer = -1);
    procedure GuardarUsuarios(AIdNivelAutorizacion: integer);
    function VerificarSolapamientos: boolean;
    function PeriodoValidoParaImpacto: boolean;
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  FrmAdministracionNivelesAutorizacion: TFrmAdministracionNivelesAutorizacion;

implementation

uses unDmPrincipal, unCustomConsulta, CustomDlgs, DbFuncs, General, StrFuncs,
  objPeriodo, unEspera, unFuncionesEmision;

{$R *.dfm}

procedure TFrmAdministracionNivelesAutorizacion.tbPropiedadesClick(
  Sender: TObject);
begin
  if sdqConsulta.RecordCount > 0 then
  begin
    edtNivelAutorizacion.Text := sdqConsulta.FieldByName('NA_DESCRIPCION').AsString;
    CargarUsuariosDisponibles(sdqConsulta.FieldByName('np_idnivelautorizacion').AsInteger);
    CargarUsuariosAsignados(sdqConsulta.FieldByName('np_idnivelautorizacion').AsInteger);
    fpAsignacionUsuarios.ShowModal;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.btnCancelarAsignacionUsuarioClick(
  Sender: TObject);
begin
  try
    Rollback(true);
  finally
    fpAsignacionUsuarios.Close;
    sdqUsuariosDisponibles.Close;
    sdqUsuariosAsignados.Close;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.btnAgregarClick(
  Sender: TObject);
begin
  if lstUsuariosDisponibles.SelCount > 0 then
  begin
    lstUsuariosAsignados.IconOptions.WrapText := false;
    lstUsuariosDisponibles.MoveSelection(lstUsuariosAsignados);
    lstUsuariosAsignados.IconOptions.WrapText := true;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.ClearControls;
begin
  inherited;
  fraNivelAutorizacion.Clear;
  edtMontoMinimo.Clear;
  edtMontoMaximo.Clear;
  edtCantidadPeriodosMin.Clear;
  edtCantidadPeriodosMax.Clear;
//  edtFechaVigenciaDesde.Clear;
//  edtFechaVigenciaHasta.Clear;
  edtPeriodoDesde.Clear;
  edtPeriodoHasta.Clear;
  mDescripcion.Clear;
  cbAplicaA.ItemIndex := 0;
  cbTipoNomina.ItemIndex := 0;
  edPorcentajeVariacionDevDesde.Clear;
  edPorcentajeVariacionDevHasta.Clear;
  edPorcentajeVariacionEmpDesde.Clear;
  edPorcentajeVariacionEmpHasta.Clear;
  edPorcentajeVariacionMasaDesde.Clear;
  edPorcentajeVariacionMasaHasta.Clear;
end;

function TFrmAdministracionNivelesAutorizacion.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('NP_ID', sdqConsulta.FieldByName('NP_ID').AsInteger );
      Sql.Fields.Add('NP_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('NP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('NP_IDNIVELAUTORIZACION', fraNivelAutorizacion.Codigo);
//      Sql.Fields.Add('NP_FECHAANTERIOR', edtFechaVigenciaDesde.Date);
//      Sql.Fields.Add('NP_FECHAPOSTERIOR', edtFechaVigenciaHasta.Date);
      Sql.Fields.Add('NP_PERIODOSDESDE', edtCantidadPeriodosMin.Value, true);
      Sql.Fields.Add('NP_PERIODOSHASTA', edtCantidadPeriodosMax.Value, true);
      Sql.Fields.Add('NP_MONTODESDE', edtMontoMinimo.Value, 2, true);
      Sql.Fields.Add('NP_MONTOHASTA', edtMontoMaximo.Value, 2, true);
      Sql.Fields.Add('NP_PORCENTAJEVARIACIONDESDE', edPorcentajeVariacionDevDesde.Value, true );
      Sql.Fields.Add('NP_PORCENTAJEVARIACIONHASTA', edPorcentajeVariacionDevHasta.Value, true);

      Sql.Fields.Add('NP_VARIACIONTRABAJADORDESDE', edPorcentajeVariacionEmpDesde.Value, true );
      Sql.Fields.Add('NP_VARIACIONTRABAJADORHASTA', edPorcentajeVariacionEmpHasta.Value, true);
      Sql.Fields.Add('NP_VARIACIONMASADESDE', edPorcentajeVariacionMasaDesde.Value, true );
      Sql.Fields.Add('NP_VARIACIONMASAHASTA', edPorcentajeVariacionMasaHasta.Value, true);

      Sql.Fields.Add('NP_DESCRIPCION', mDescripcion.Text);
      Sql.Fields.Add('NP_PERIODOVIGENCIADESDE', edtPeriodoDesde.Periodo.Valor );
      Sql.Fields.Add('NP_PERIODOVIGENCIAHASTA', edtPeriodoHasta.Periodo.Valor );

      Sql.Fields.Add('NP_TIPO', cbAplicaA.Value);
      if cbTipoNomina.Enabled then
        Sql.Fields.Add('NP_TIPONOMINA', cbTipoNomina.Value)
      else
        Sql.Fields.Add('NP_TIPONOMINA', exNull);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('NP_ID', GetSecNextVal('emi.seq_inp_id'));
        Sql.Fields.Add('NP_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('NP_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('NP_ID', sdqConsulta.FieldByName('NP_ID').AsInteger);
        Sql.Fields.Add('NP_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('NP_FECHAMODIF', exDateTime );
        Sql.Fields.Add('NP_USUBAJA', exNull );
        Sql.Fields.Add('NP_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el nivel de autorización.');
    end;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.LoadControls;
begin
  inherited;
  fraNivelAutorizacion.Codigo := sdqConsulta.fieldbyname('NP_IDNIVELAUTORIZACION').AsString;
  edtMontoMinimo.Value := sdqConsulta.fieldbyname('NP_MONTODESDE').AsFloat;
  edtMontoMaximo.Value := sdqConsulta.fieldbyname('NP_MONTOHASTA').AsFloat;
  edtCantidadPeriodosMin.Value := sdqConsulta.fieldbyname('NP_PERIODOSDESDE').AsInteger;
  edtCantidadPeriodosMax.Value := sdqConsulta.fieldbyname('NP_PERIODOSHASTA').AsInteger;

  edPorcentajeVariacionDevDesde.Value := sdqConsulta.fieldbyname('NP_PORCENTAJEVARIACIONDESDE').AsInteger;
  edPorcentajeVariacionDevHasta.Value := sdqConsulta.fieldbyname('NP_PORCENTAJEVARIACIONHASTA').AsInteger;

  edPorcentajeVariacionEmpDesde.Value := sdqConsulta.fieldbyname('NP_VARIACIONTRABAJADORDESDE').AsInteger;
  edPorcentajeVariacionEmpHasta.Value := sdqConsulta.fieldbyname('NP_VARIACIONTRABAJADORHASTA').AsInteger;
  edPorcentajeVariacionMasaDesde.Value := sdqConsulta.fieldbyname('NP_VARIACIONMASADESDE').AsInteger;
  edPorcentajeVariacionMasaHasta.Value := sdqConsulta.fieldbyname('NP_VARIACIONMASAHASTA').AsInteger;

  //  edtFechaVigenciaDesde.Date := sdqConsulta.fieldbyname('NP_FECHAANTERIOR').AsDateTime;
//  edtFechaVigenciaHasta.Date := sdqConsulta.fieldbyname('NP_FECHAPOSTERIOR').AsDateTime;
  edtPeriodoDesde.Periodo.Valor := sdqConsulta.fieldbyname('NP_PERIODOVIGENCIADESDE').AsString;
  edtPeriodoHasta.Periodo.Valor := sdqConsulta.fieldbyname('NP_PERIODOVIGENCIAHASTA').AsString;
  mDescripcion.Text := sdqConsulta.fieldbyname('NP_DESCRIPCION').AsString;
  cbAplicaA.Value := sdqConsulta.fieldbyname('NP_TIPO').AsString;
  cbAplicaAChange(self);
  if cbTipoNomina.Enabled then
    cbTipoNomina.Value := sdqConsulta.fieldbyname('NP_TIPONOMINA').AsString;
end;

function TFrmAdministracionNivelesAutorizacion.Validar: Boolean;
begin               
  Result := VerificarMultiple(['Administración de Nivel de Autorización',
                                  fraNivelAutorizacion, fraNivelAutorizacion.IsSelected, 'Debe especificar el nivel.',
                                  edtMontoMinimo, (edtMontoMinimo.Value <= edtMontoMaximo.Value) or (edtMontoMaximo.Value = 0), 'El monto mínimo no puede ser mayor al máximo.',
//                                  edtCantidadPeriodosMin, not ((edtCantidadPeriodosMin.Value = 0) and (edtCantidadPeriodosMax.Value = 0)), 'Debe especificar alguno de los dos períodos.',
                                  edtCantidadPeriodosMin, (edtCantidadPeriodosMin.Value <= edtCantidadPeriodosMax.Value) or (edtCantidadPeriodosMax.Value = 0), 'El período mínimo no puede ser mayor al máximo.',

                                  edPorcentajeVariacionDevDesde, (edPorcentajeVariacionDevDesde.Value <= edPorcentajeVariacionDevHasta.Value) or (edPorcentajeVariacionDevHasta.Value = 0), 'El porcentaje de devengado mínimo no puede ser mayor al máximo.',
                                  edPorcentajeVariacionEmpDesde, (edPorcentajeVariacionEmpDesde.Value <= edPorcentajeVariacionEmpHasta.Value) or (edPorcentajeVariacionEmpHasta.Value = 0), 'El porcentaje de variación de empleados mínimo no puede ser mayor al máximo.',
                                  edPorcentajeVariacionMasaDesde, (edPorcentajeVariacionMasaDesde.Value <= edPorcentajeVariacionMasaHasta.Value) or (edPorcentajeVariacionMasaHasta.Value = 0), 'El porcentaje de variación de masa salarial mínimo no puede ser mayor al máximo.',

                                  cbTipoNomina, (cbAplicaA.Value <> 'D') or (cbTipoNomina.ItemIndex <> -1), 'Debe seleccionar un tipo de nómina.',
                                  cbTipoNomina, (cbAplicaA.Value <> 'S') or (cbTipoNomina.ItemIndex <> -1), 'Debe seleccionar un tipo de nómina.',
//                                  edtFechaVigenciaDesde, not ((edtFechaVigenciaDesde.date = 0) and (edtFechaVigenciaHasta.Date = 0)), 'Debe especificar alguna de las dos fechas.',
//                                  edtFechaVigenciaDesde, (edtFechaVigenciaDesde.Date <= edtFechaVigenciaHasta.Date) or (edtFechaVigenciaHasta.Date = 0), 'La fecha desde no puede ser mayor a la fecha hasta.',
                                  fraNivelAutorizacion, VerificarSolapamientos, 'Los datos se solapan con otro registro.'  //,
//                                  edtPeriodoDesde, ValidaPeriodos(edtPeriodoDesde.Periodo, edtPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.'
                                ]);
end;
procedure TFrmAdministracionNivelesAutorizacion.FormCreate(
  Sender: TObject);
begin
  inherited;

  FieldBaja := 'NP_FECHABAJA';
  Sql.TableName := 'EMI.INP_NIVELAUTORIZACIONPERIODOS';
  CheckPK := True;

  with fraNivelAutorizacion do
  begin
    TableName := 'EMI.INA_NIVELAUTORIZACION';
    FieldID := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc := 'NA_DESCRIPCION';
    FieldBaja := 'NA_FECHABAJA';
    ShowBajas := false;
  end;

end;

procedure TFrmAdministracionNivelesAutorizacion.CargarUsuariosAsignados(
  AIdNivelAutorizacion: integer);
var
 ListItemAccion: TListItem;
begin
  try
    sdqUsuariosAsignados.ParamByName('idnivelautorizacion').AsInteger := sdqConsulta.FieldByName('np_idnivelautorizacion').AsInteger;
    sdqUsuariosAsignados.Open;

    if sdqUsuariosAsignados.RecordCount > 0 then
    begin
      while not sdqUsuariosAsignados.Eof do
      begin
        with lstUsuariosAsignados do
        begin
          ListItemAccion := Items.Add;
          ListItemAccion.Caption := sdqUsuariosAsignados.fieldbyname('usuariosector').AsString;
          ListItemAccion.Data := TGestor.Create(sdqUsuariosAsignados.fieldbyname('NU_USUARIO').AsString, sdqUsuariosAsignados.fieldbyname('usuariosector').AsString);
          TGestor(ListItemAccion.Data).Id := sdqUsuariosAsignados.fieldbyname('NU_ID').AsInteger;
        end;
        sdqUsuariosAsignados.Next;
      end;
    end;
  finally
    sdqUsuariosAsignados.Close;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.CargarUsuariosDisponibles(
  AIdNivelAutorizacion: integer);
var
 ListItemAccion: TListItem;
begin
  try
    sdqUsuariosDisponibles.ParamByName('idnivelautorizacion').AsInteger := sdqConsulta.FieldByName('np_idnivelautorizacion').AsInteger;
    sdqUsuariosDisponibles.Open;

    if sdqUsuariosDisponibles.RecordCount > 0 then
    begin
      while not sdqUsuariosDisponibles.Eof do
      begin
        with lstUsuariosDisponibles do
        begin
          ListItemAccion := Items.Add;
          ListItemAccion.Caption := sdqUsuariosDisponibles.fieldbyname('usuariosector').AsString;
          ListItemAccion.Data := TGestor.Create(sdqUsuariosDisponibles.fieldbyname('SE_USUARIO').AsString, sdqUsuariosDisponibles.fieldbyname('usuariosector').AsString);
        end;
        sdqUsuariosDisponibles.Next;
      end;
    end;
  finally
    sdqUsuariosDisponibles.Close;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.btnAgregarTodosUsuariosClick(
  Sender: TObject);
begin
  lstUsuariosDisponibles.SelectAll;
  lstUsuariosAsignados.IconOptions.WrapText := false;
  lstUsuariosDisponibles.MoveSelection(lstUsuariosAsignados);
  lstUsuariosAsignados.IconOptions.WrapText := true;
end;

procedure TFrmAdministracionNivelesAutorizacion.btnQuitarClick(
  Sender: TObject);
begin
  if lstUsuariosAsignados.SelCount > 0 then
  begin
    lstUsuariosDisponibles.IconOptions.WrapText := false;
    lstUsuariosAsignados.MoveSelection(lstUsuariosDisponibles);
    lstUsuariosDisponibles.IconOptions.WrapText := true;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.btnEliminarTodosUsuariosClick(
  Sender: TObject);
begin
  lstUsuariosAsignados.SelectAll;
  lstUsuariosDisponibles.IconOptions.WrapText := false;
  lstUsuariosAsignados.MoveSelection(lstUsuariosDisponibles);
  lstUsuariosDisponibles.IconOptions.WrapText := true;
end;

procedure TFrmAdministracionNivelesAutorizacion.GuardarUsuarios(
  AIdNivelAutorizacion: integer);
var
  i: integer;
begin
  try
    BeginTrans(true);

    for i:= 0 to lstUsuariosDisponibles.Items.Count-1 do
      if (TGestor(lstUsuariosDisponibles.Items[i].Data).Id <> -1) then
      begin
        EjecutarSqlST('UPDATE EMI.INU_NIVELAUTORIZACIONUSUARIO ' +
                    '  SET  NU_USUBAJA = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '  NU_FECHABAJA = SYSDATE ' +
                    '  WHERE NU_ID = ' + SqlValue(TGestor(lstUsuariosDisponibles.Items[i].Data).Id));
      end;


    for i:= 0 to lstUsuariosAsignados.Items.Count-1 do
      if (TGestor(lstUsuariosAsignados.Items[i].Data).Id = 0) then
      begin
        if ExisteSql('SELECT 1 FROM EMI.INU_NIVELAUTORIZACIONUSUARIO WHERE NU_IDNIVELAUTORIZACION = ' + SqlValue(AIdNivelAutorizacion) +
                     ' AND NU_USUARIO = ' + SqlValue(TGestor(lstUsuariosAsignados.Items[i].Data).Usuario)) then
        begin
            EjecutarSqlST('UPDATE EMI.INU_NIVELAUTORIZACIONUSUARIO ' +
                          '  SET  NU_USUBAJA = NULL, ' +
                          '  NU_FECHABAJA = NULL, ' +
                          '  NU_USUMODIF = ' + SqlValue(Sesion.LoginName) + ', ' +
                          '  NU_FECHAMODIF = SYSDATE ' +
                          '  WHERE NU_IDNIVELAUTORIZACION = ' + SqlValue(AIdNivelAutorizacion) +
                          '  AND NU_USUARIO = ' + SqlValue(TGestor(lstUsuariosAsignados.Items[i].Data).Usuario));
        end
        else begin
            EjecutarSqlST('INSERT INTO EMI.INU_NIVELAUTORIZACIONUSUARIO            '          +
                        ' (NU_ID, NU_USUARIO, NU_IDNIVELAUTORIZACION, NU_USUALTA,'            +
                        '  NU_FECHAALTA)    '                                                 +
                        'VALUES (emi.seq_inu_id.nextval, '                                    +
                        SqlValue(TGestor(lstUsuariosAsignados.Items[i].Data).Usuario) + ', '  +
                        SqlValue(AIdNivelAutorizacion) + ', ' + SqlValue(Sesion.LoginName)  + ', sysdate)');
        end;
      end;

    CommitTrans(true);
    fpAsignacionUsuarios.ModalResult := mrOk;
  except
    on E: Exception do begin
       Rollback(true);
       ErrorMsg(E, 'Error al guardar los usuarios del nivel de autorización.');
    end;
  end;
end;

procedure TFrmAdministracionNivelesAutorizacion.fpAsignacionUsuariosClose(
  Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i:= 0 to lstUsuariosAsignados.Items.Count-1 do
    TGestor(lstUsuariosAsignados.Items[i].Data).Free;

  for i:= 0 to lstUsuariosDisponibles.Items.Count-1 do
    TGestor(lstUsuariosDisponibles.Items[i].Data).Free;

  lstUsuariosAsignados.Clear;
  lstUsuariosDisponibles.Clear;

  inherited;
end;


procedure TFrmAdministracionNivelesAutorizacion.btnAceptarAsignacionUsuarioClick(
  Sender: TObject);
begin
  if (lstUsuariosAsignados.Items.Count = 0) then
  begin
     InvalidMsg(lstUsuariosAsignados, 'Debe especifiacar al menos un usuario.', 'Asignación de Usuarios');
     Abort; 
  end;

  GuardarUsuarios(sdqConsulta.FieldByName('np_idnivelautorizacion').AsInteger);
end;

function TFrmAdministracionNivelesAutorizacion.VerificarSolapamientos: boolean;
begin
  result := not ExisteSql(
    'SELECT 1 ' +
    'FROM EMI.INP_NIVELAUTORIZACIONPERIODOS ' +
    'WHERE  NP_TIPO = ' + SqlValue(cbAplicaA.Value) +  //' AND (NP_IDNIVELAUTORIZACION = ' + SqlValue(fraNivelAutorizacion.Codigo) + ')' +
        iif(ModoABM = maModificacion, ' AND (NP_ID <> ' + SqlValue(sdqConsulta.FieldByName('NP_ID').AsInteger) + ')', '') +
//    'AND (((NP_FECHAANTERIOR BETWEEN ' +
//        iif(edtFechaVigenciaDesde.Date <> 0, SqlValue(edtFechaVigenciaDesde.Date), 'TO_DATE (''01/01/1980'', ''DD/MM/YYYY'')') + ' AND ' +
//        iif(edtFechaVigenciaHasta.Date <> 0, SqlValue(edtFechaVigenciaHasta.Date), 'TO_DATE (''31/12/2100'', ''DD/MM/YYYY'')') + ') ' +
//        'OR (NP_FECHAPOSTERIOR BETWEEN ' +
//          iif(edtFechaVigenciaDesde.Date <> 0, SqlValue(edtFechaVigenciaDesde.Date), 'TO_DATE (''01/01/1980'', ''DD/MM/YYYY'')') + ' AND ' +
//          iif(edtFechaVigenciaHasta.Date <> 0, SqlValue(edtFechaVigenciaHasta.Date), 'TO_DATE (''31/12/2100'', ''DD/MM/YYYY'')') +  ')) ' +
    'AND ((NP_PERIODOSDESDE BETWEEN ' +
        iif(edtCantidadPeriodosMin.Value<>0, SqlValue(edtCantidadPeriodosMin.Value), '-999999999') + ' AND ' +
        iif(edtCantidadPeriodosMax.Value<>0, SqlValue(edtCantidadPeriodosMax.Value), '999999999') +  ') ' +
        'OR (NP_PERIODOSHASTA BETWEEN ' +
          iif(edtCantidadPeriodosMin.Value<>0, SqlValue(edtCantidadPeriodosMin.Value), '-999999999') + ' AND ' +
          iif(edtCantidadPeriodosMax.Value<>0, SqlValue(edtCantidadPeriodosMax.Value), '999999999') + ')) ' +

    'AND ((NP_PERIODOVIGENCIADESDE BETWEEN ' +
        iif(not edtPeriodoDesde.Periodo.IsNull, SqlValue(edtPeriodoDesde.Periodo.Valor), '000000') + ' AND ' +
        iif(not edtPeriodoHasta.Periodo.IsNull, SqlValue(edtPeriodoHasta.Periodo.Valor), '999999') +  ') ' +
        'OR (NP_PERIODOVIGENCIADESDE BETWEEN ' +
        iif(not edtPeriodoDesde.Periodo.IsNull, SqlValue(edtPeriodoDesde.Periodo.Valor), '000000') + ' AND ' +
        iif(not edtPeriodoHasta.Periodo.IsNull, SqlValue(edtPeriodoHasta.Periodo.Valor), '999999') +  ')) ' +

    'AND ((NP_MONTODESDE BETWEEN ' +
        iif(edtMontoMinimo.Value<>0, SqlValue(edtMontoMinimo.Value), '-999999999') + ' AND ' +
        iif(edtMontoMaximo.Value<>0, SqlValue(edtMontoMaximo.Value), '999999999') +  ') ' +
        'OR (NP_MONTOHASTA BETWEEN ' +
          iif(edtMontoMinimo.Value<>0, SqlValue(edtMontoMinimo.Value), '-999999999') + ' AND ' +
          iif(edtMontoMaximo.Value<>0, SqlValue(edtMontoMaximo.Value), '999999999') + ') OR (NP_MONTODESDE IS NULL AND NP_MONTOHASTA IS NULL)) ' +

    'AND ((NP_PORCENTAJEVARIACIONDESDE BETWEEN ' +
        iif(edPorcentajeVariacionDevDesde.Value<>0, SqlValue(edPorcentajeVariacionDevDesde.Value), '-999999999') + ' AND ' +
        iif(edPorcentajeVariacionDevHasta.Value<>0, SqlValue(edPorcentajeVariacionDevHasta.Value), '999999999') +  ') ' +
        'OR (NP_PORCENTAJEVARIACIONHASTA BETWEEN ' +
          iif(edPorcentajeVariacionDevDesde.Value<>0, SqlValue(edPorcentajeVariacionDevDesde.Value), '-999999999') + ' AND ' +
          iif(edPorcentajeVariacionDevHasta.Value<>0, SqlValue(edPorcentajeVariacionDevHasta.Value), '999999999') + ') OR (NP_PORCENTAJEVARIACIONDESDE IS NULL AND NP_PORCENTAJEVARIACIONHASTA IS NULL)) ' +

    'AND ((NP_VARIACIONTRABAJADORDESDE BETWEEN ' +
        iif(edPorcentajeVariacionEmpDesde.Value<>0, SqlValue(edPorcentajeVariacionEmpDesde.Value), '-999999999') + ' AND ' +
        iif(edPorcentajeVariacionEmpHasta.Value<>0, SqlValue(edPorcentajeVariacionEmpHasta.Value), '999999999') +  ') ' +
        'OR (NP_VARIACIONTRABAJADORHASTA BETWEEN ' +
          iif(edPorcentajeVariacionEmpDesde.Value<>0, SqlValue(edPorcentajeVariacionEmpDesde.Value), '-999999999') + ' AND ' +
          iif(edPorcentajeVariacionEmpHasta.Value<>0, SqlValue(edPorcentajeVariacionEmpHasta.Value), '999999999') + ') OR (NP_VARIACIONTRABAJADORDESDE IS NULL AND NP_VARIACIONTRABAJADORHASTA IS NULL)) ' +

    'AND ((NP_VARIACIONMASADESDE BETWEEN ' +
        iif(edPorcentajeVariacionMasaDesde.Value<>0, SqlValue(edPorcentajeVariacionMasaDesde.Value), '-999999999') + ' AND ' +
        iif(edPorcentajeVariacionMasaHasta.Value<>0, SqlValue(edPorcentajeVariacionMasaHasta.Value), '999999999') +  ') ' +
        'OR (NP_VARIACIONMASAHASTA BETWEEN ' +
          iif(edPorcentajeVariacionMasaDesde.Value<>0, SqlValue(edPorcentajeVariacionMasaDesde.Value), '-999999999') + ' AND ' +
          iif(edPorcentajeVariacionMasaHasta.Value<>0, SqlValue(edPorcentajeVariacionMasaHasta.Value), '999999999') + ') OR (NP_VARIACIONMASADESDE IS NULL AND NP_VARIACIONMASAHASTA IS NULL)) '
          );
end;

procedure TFrmAdministracionNivelesAutorizacion.btnVerificacionClick(
  Sender: TObject);
begin
  if fpVerificacionCondiciones.ShowModal = mrOk  then
    if PeriodoValidoParaImpacto then
       do_AplicaCambiosNivAu(1);

end;

procedure TFrmAdministracionNivelesAutorizacion.tbRefrescarVerificacionClick(
  Sender: TObject);
begin
  inherited;
  if sdqVerificacion.Active then sdqVerificacion.Close;
  try
    IniciarEspera;
    sdqVerificacion.ParamByName('periodo').AsString := ppPeriodos.Periodo.Valor;
    sdqVerificacion.Open;
  finally
    DetenerEspera;
  end;
end;

function TFrmAdministracionNivelesAutorizacion.PeriodoValidoParaImpacto: boolean;
begin
  Result := ValorSql('SELECT COUNT(DE_PERIODODEVENGADO)' +
                     '  FROM ART.ZDE_DEVENGADOS ZDE' +
                     ' WHERE ZDE.DE_PERIODODEVENGADO = '''+ ppPeriodos.Periodo.Valor + '''' ) > 0 ;
end;

procedure TFrmAdministracionNivelesAutorizacion.cbAplicaAChange(
  Sender: TObject);
begin
  VclExtra.LockControl(cbTipoNomina, not ((cbAplicaA.Value = 'D') or (cbAplicaA.Value = 'S')));
//  cbTipoNomina.Enabled := (cbAplicaA.Value = 'D');
  if not cbTipoNomina.Enabled then
    cbTipoNomina.ItemIndex := -1;
end;

procedure TFrmAdministracionNivelesAutorizacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.

