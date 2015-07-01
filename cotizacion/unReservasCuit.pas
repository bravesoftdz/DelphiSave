unit unReservasCuit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ToolEdit, DateComboBox, unfraStaticActividad, Mask, unFraCodigoDescripcion, unFraEntidades, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraCanal, unfraVendedores, unFraStaticCTB_TABLAS, unFraUsuario, RxToolEdit, RxPlacemnt;

type
  TfrmReservasCuit = class(TfrmCustomGridABM)
    fraCanal: TfraCanal;
    Label1: TLabel;
    Label2: TLabel;
    fraEntidad: TfraEntidades;
    Label20: TLabel;
    meCuit: TMaskEdit;
    fraActividad: TfraStaticActividad;
    Label3: TLabel;
    Label11: TLabel;
    dcbFechaVigenciaDesde: TDateComboBox;
    fraVendedor: TfraVendedores;
    Label4: TLabel;
    Label6: TLabel;
    memoObservaciones: TMemo;
    Label5: TLabel;
    dcbFechaVigenciaHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    fraCanalFiltro: TfraCanal;
    GroupBox2: TGroupBox;
    fraEntidadFiltro: TfraEntidades;
    GroupBox3: TGroupBox;
    fraVendedorFiltro: TfraVendedores;
    GroupBox7: TGroupBox;
    dcbFechaVigenciaFiltro: TDateComboBox;
    GroupBox4: TGroupBox;
    meCUITFiltro: TMaskEdit;
    GroupBox5: TGroupBox;
    edObservacionFiltro: TEdit;
    GroupBox10: TGroupBox;
    fraUsuarioAltaFiltro: TfraUsuarios;
    GroupBox6: TGroupBox;
    edRazonSocialFiltro: TEdit;
    Label7: TLabel;
    edRazonSocial: TEdit;
    GroupBox8: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure meCuitExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure meCUITFiltroExit(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    procedure CambiaCanal(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
    procedure FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmReservasCuit: TfrmReservasCuit;

implementation

uses
  unPrincipal, Cuit, CustomDlgs, unDmPrincipal, unSesion, AnsiSql, General, unCotizacion, DateTimeFuncs;

{$R *.DFM}

function TfrmReservasCuit.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'aru_reservacuit';
  if ModoABM = maAlta then
    iId := ValorSqlInteger('SELECT seq_aru_id.NEXTVAL FROM DUAL', 0)
  else
    iId := sdqConsulta.FieldByName('ru_id').AsInteger;

  Sql.PrimaryKey.Add('ru_id', iId, False);

  if ModoABM = maBaja then
  begin
    Sql.Fields.Add('ru_usubaja', 	 Sesion.UserID);
    Sql.Fields.Add('ru_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
    Sql.Fields.Add('ru_idcanal', 			 fraCanal.Value, True);
    Sql.Fields.Add('ru_identidad', 		 fraEntidad.Value, True);
    Sql.Fields.Add('ru_idvendedor', 	 fraVendedor.Value, True);
    Sql.Fields.Add('ru_cuit', 				 meCuit.Text);
    Sql.Fields.Add('ru_razonsocial', 	 edRazonSocial.Text);
    Sql.Fields.Add('ru_idactividad', 	 fraActividad.Value, True);
    Sql.Fields.Add('ru_fechadesde', 	 dcbFechaVigenciaDesde.Date);
    Sql.Fields.Add('ru_fechahasta', 	 dcbFechaVigenciaHasta.Date);
    Sql.Fields.Add('ru_observaciones', memoObservaciones.Lines.Text);

    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('ru_usualta', 	 Sesion.UserID);
      Sql.Fields.Add('ru_fechaalta', SQL_ACTUALDATE, False);
    end
    else
    begin
      Sql.Fields.Add('ru_usumodif', 	Sesion.UserID);
      Sql.Fields.Add('ru_fechamodif', SQL_ACTUALDATE, False);
    end;
  end;

  if ModoABM = maAlta then
    EjecutarSql(Sql.InsertSql)
  else
    EjecutarSql(Sql.UpdateSql);

  Result := True;
end;

function TfrmReservasCuit.Validar: Boolean;
var
  iIdActual: Integer;
  sSql: String;
begin
  Verificar(fraCanal.IsEmpty, fraCanal.edCodigo, 'El canal es obligatorio.');
  Verificar(fraEntidad.IsEmpty, fraEntidad.edCodigo, 'La entidad es obligatoria.');
  Verificar((meCuit.Text = ''), meCuit, 'La C.U.I.T. es obligatoria.');
  Verificar(not Cuit.IsCuit(meCuit.Text), meCuit, 'La C.U.I.T. es inválida.');

  sSql :=
    'SELECT 1' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_cuit = :cuit' +
      ' AND sc_estado IN(''00'', ''00.01'', ''01'', ''02'', ''02.0'', ''02.1'', ''02.2'', ''02.4'', ''02.5'', ''02.6'', ''03'')';
  Verificar(ExisteSqlEx(sSql, [meCuit.Text]), meCuit, 'Esta C.U.I.T. no puede ser reservada en este momento porque tiene una solicitud en curso.');

  iIdActual := -1;
  if (ModoABM = maModificacion) and (sdqConsulta.Active) then
    iIdActual := sdqConsulta.FieldByName('ru_id').AsInteger;

  sSql :=
    'SELECT COUNT(*)' +
     ' FROM aru_reservacuit' +
    ' WHERE ru_cuit = :cuit' +
      ' AND (   (:fechadesde BETWEEN ru_fechadesde AND ru_fechahasta)' +
           ' OR (:fechahasta BETWEEN ru_fechadesde AND ru_fechahasta))' +
      ' AND ru_fechabaja IS NULL' +
      ' AND ru_id <> :id' ;
  Verificar((ValorSqlIntegerEx(sSql, [meCuit.Text, TDateTimeEx.Create(dcbFechaVigenciaDesde.Date), TDateTimeEx.Create(dcbFechaVigenciaHasta.Date), iIdActual]) > 0), meCuit, 'Esta C.U.I.T. se encuentra reservada dentro de esas fechas.');

  Verificar((edRazonSocial.Text = ''), edRazonSocial, 'La Razón Social es obligatoria.');
  Verificar(fraActividad.IsExcluido, fraActividad.edCodigo, 'Esta actividad no se puede seleccionar porque está excluida.');
  Verificar(dcbFechaVigenciaDesde.IsEmpty, dcbFechaVigenciaDesde, 'La fecha desde es obligatoria.');
  Verificar(dcbFechaVigenciaHasta.IsEmpty, dcbFechaVigenciaHasta, 'La fecha hasta es obligatoria.');
  Verificar((dcbFechaVigenciaHasta.Date < dcbFechaVigenciaDesde.Date), dcbFechaVigenciaHasta, 'La fecha hasta debe ser mayor o igual a la fecha desde.');

  Result := True;
end;


procedure TfrmReservasCuit.CambiaCanal(Sender: TObject);
begin
  if TfraCanal(Sender).IsSelected then
    case TfraCanal(Sender).Tag of
      0:  fraEntidad.Canal := TfraCanal(Sender).Value;
      1:  fraEntidadFiltro.Canal := TfraCanal(Sender).Value;
    end;
end;

procedure TfrmReservasCuit.CambiaEntidad(Sender: TObject);
begin
  case TfraEntidades(Sender).Tag of
    0:  fraVendedor.Entidad := TfraEntidades(Sender).Value;
    1:  fraVendedorFiltro.Entidad := TfraEntidades(Sender).Value;
  end;
end;

procedure TfrmReservasCuit.ClearControls;
begin
  fraCanal.Clear;
  fraEntidad.Clear;
  fraVendedor.Clear;
  meCuit.Clear;
  edRazonSocial.Clear;
  fraActividad.Clear;
  dcbFechaVigenciaDesde.Clear;
  dcbFechaVigenciaHasta.Clear;
  memoObservaciones.Clear;
end;

procedure TfrmReservasCuit.FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  try
    if AreIn(LowerCase(Sender.FieldName), ['ru_cuit']) then
      Text := PonerGuiones(Sender.AsString);
  except
    Text := Sender.AsString;
  end;
end;

procedure TfrmReservasCuit.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCanal.Value  						 :=	FieldByName('ru_idcanal').AsInteger;
    fraEntidad.Value  					 := FieldByName('ru_identidad').AsInteger;
    fraVendedor.Value  					 := FieldByName('ru_idvendedor').AsInteger;
    meCuit.Text  								 := FieldByName('ru_cuit').AsString;
    edRazonSocial.Text           := FieldByName('ru_razonsocial').AsString;
    fraActividad.Value           := FieldByName('ru_idactividad').AsInteger;
    dcbFechaVigenciaDesde.Date   := FieldByName('ru_fechadesde').AsDateTime;
    dcbFechaVigenciaHasta.Date   := FieldByName('ru_fechahasta').AsDateTime;
    memoObservaciones.Lines.Text := FieldByName('ru_observaciones').AsString;
  end;
end;

procedure TfrmReservasCuit.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ru_fechabaja';

  ShowActived := False;
  EnableButtons(False);

  fraCanal.OnChange         := CambiaCanal;
  fraCanalFiltro.OnChange   := CambiaCanal;

  fraEntidad.OnChange       := CambiaEntidad;
  fraEntidadFiltro.OnChange := CambiaEntidad;

  fraVendedor.ShowBajasEntVend       := False;
  fraVendedorFiltro.ShowBajasEntVend := False;

  tbLimpiarClick(nil);
  
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;

procedure TfrmReservasCuit.tbRefrescarClick(Sender: TObject);
var
  sWhere: String;
begin
  sWhere := '';

  if not fraCanalFiltro.IsEmpty then
    sWhere := sWhere + ' AND ru_idcanal = ' + SqlValue(fraCanalFiltro.Value);

  if not fraEntidadFiltro.IsEmpty then
    sWhere := sWhere + ' AND ru_identidad = ' + SqlValue(fraEntidadFiltro.Value);

  if not fraVendedorFiltro.IsEmpty then
    sWhere := sWhere + ' AND ru_idvendedor = ' + SqlValue(fraVendedorFiltro.Value);

  if dcbFechaVigenciaFiltro.Date > 0 then
    sWhere := sWhere + ' AND ' + SqlValue(dcbFechaVigenciaFiltro.Date) + ' BETWEEN ru_fechadesde AND ru_fechahasta';

  if meCUITFiltro.Text <> '' then
    sWhere := sWhere + ' AND ru_cuit = ' + SqlValue(meCUITFiltro.Text);

  if edRazonSocialFiltro.Text <> '' then
    sWhere := sWhere + ' AND ru_razonsocial LIKE ' + SqlValue('%' + edRazonSocialFiltro.Text + '%');

  if edFechaAltaDesde.Date > 0 then
    sWhere := sWhere + ' AND ru_fechaalta >= ' + SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date > 0 then
    sWhere := sWhere + ' AND ru_fechaalta <= ' + SqlValue(edFechaAltaHasta.Date);

  if edObservacionFiltro.Text <> '' then
    sWhere := sWhere + ' AND UPPER(ru_observaciones) LIKE UPPER(' + SqlValue('%' + edObservacionFiltro.Text + '%') + ')';

  if not fraUsuarioAltaFiltro.IsEmpty then
    sWhere := sWhere + ' AND ru_usualta = ' + SqlValue(fraUsuarioAltaFiltro.Value);

  sdqConsulta.SQL.Text :=
    'SELECT ru.*, ca_descripcion canal, ac_descripcion actividad, en_nombre entidad, ve_nombre vendedor' +
     ' FROM aru_reservacuit ru, aca_canal, cac_actividad, xen_entidad, xve_vendedor' +
    ' WHERE ru_idcanal = ca_id(+)' +
      ' AND ru_idactividad = ac_id(+)' +
      ' AND ru_identidad = en_id(+)' +
      ' AND ru_idvendedor = ve_id(+)' +
    				sWhere;

  inherited;
end;


procedure TfrmReservasCuit.tbModificarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM auc_usuariocanal' +
    ' WHERE uc_idcanal = :idcanal' +
      ' AND uc_fechabaja IS NULL' +
      ' AND uc_usuario = :usuario';

  Verificar(not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ru_idcanal').AsInteger, Sesion.UserID]), Grid,
  																 Format('Usted no tiene permiso para modificar reservas de C.U.I.T. del canal %s',
                                   [sdqConsulta.FieldByName('canal').AsString]));

  ClearControls;
  inherited;
end;

procedure TfrmReservasCuit.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  tbModificar.Enabled := not IsBaja;
  tbEliminar.Enabled := not IsBaja;
end;

procedure TfrmReservasCuit.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sdqConsulta.FieldByName('ru_cuit').OnGetText := FormateaTexto;
end;

procedure TfrmReservasCuit.meCuitExit(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_cuit = :cuit' +
      ' AND sc_estado NOT IN(' + SqlValue(EC_CANCELADA) + ', ' +
                                 SqlValue(EC_CERRADA_MAL) + ', ' +
                                 SqlValue(EC_CERRADA_BIEN) + ', ' +
                                 SqlValue(EC_CON_ERRORES) + ', ' +
                                 SqlValue(EC_CERRADA_COMERCIALIZADOR) + ', ' +
                                 SqlValue(EC_CERRADA_SOLICITA_NUEVA) + ', ' +
                                 SqlValue(EC_CERRADA_VENCIDA_SIN_IMPRESION) + ', ' +
                                 SqlValue(EC_CERRADA_VENCIDA_CON_IMPRESION) + ')';

  if ValorSqlIntegerEx(sSql, [meCuit.Text]) > 0 then
    InfoHint(meCuit, 'Ya existe una solicitud cargada, por favor verifique.', False, 'Información', blnInfo, 3, False);
end;

procedure TfrmReservasCuit.tbLimpiarClick(Sender: TObject);
begin
  fraCanalFiltro.Clear;
  fraEntidadFiltro.Clear;
  fraVendedorFiltro.Clear;
  dcbFechaVigenciaFiltro.Clear;
  meCUITFiltro.Clear;
  edRazonSocialFiltro.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edObservacionFiltro.Clear;
  fraUsuarioAltaFiltro.Clear;
end;

procedure TfrmReservasCuit.meCUITFiltroExit(Sender: TObject);
begin
  if Trim(meCUITFiltro.Text) <> '' then
    Verificar((not IsCuit(meCUITFiltro.Text)), meCUITFiltro, 'C.U.I.T. inválida.');
end;

procedure TfrmReservasCuit.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM auc_usuariocanal' +
    ' WHERE uc_idcanal = :cuit' +
      ' AND uc_fechabaja IS NULL' +
      ' AND uc_usuario = :usuario';

  Verificar(not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ru_idcanal').AsInteger, Sesion.UserID]), Grid,
  																 Format('Usted no tiene permiso para eliminar reservas de C.U.I.T. del canal %s',
                                   [sdqConsulta.FieldByName('canal').AsString]));

  inherited;
end;

end.
