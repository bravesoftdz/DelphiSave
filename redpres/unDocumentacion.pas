unit unDocumentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  PatternEdit, IntEdit, ComboEditor, CheckCombo, DBCheckCombo, unfraSectores, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraUsuario, unfraCtbTablas, unFraCodDesc, Menus;

type
  TfrmDocumentacion = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edFechaDesde: TDateComboBox;
    Label1: TLabel;
    edFechaHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    edCodigoDesde: TIntEdit;
    Label6: TLabel;
    edCodigoHasta: TIntEdit;
    GroupBox3: TGroupBox;
    edRemitenteBusqueda: TEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    GroupBox8: TGroupBox;
    Label3: TLabel;
    edRemitoDesde: TIntEdit;
    edRemitoHasta: TIntEdit;
    GroupBox9: TGroupBox;
    checkSinRecibir: TCheckBox;
    GroupBox10: TGroupBox;
    checkSinRemito: TCheckBox;
    edCodigo: TIntEdit;
    Label4: TLabel;
    edFecha: TDateComboBox;
    Label5: TLabel;
    Label7: TLabel;
    edRemitente: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edObservaciones: TEdit;
    edCuil: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    edNombre: TEdit;
    fraUsuarioDestinoBusqueda: TfraUsuarios;
    fraUsuarioRecepcionBusqueda: TfraUsuarios;
    fraSectorDestinoBusqueda: TfraSectores;
    fraUsuarioDestino: TfraUsuarios;
    fraSectorDestino: TfraSectores;
    fraTipoDocumento: TfraCtbTablas;
    fpRecepcion: TFormPanel;
    Bevel1: TBevel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    fraUsuarioRecepcion: TfraUsuarios;
    fraRemito: TfraCodDesc;
    edFechaRecepcion: TDateComboBox;
    popupImprimir: TPopupMenu;
    mnuResultados: TMenuItem;
    mnuRemito: TMenuItem;
    Label17: TLabel;
    edNumeroDocumento: TIntEdit;
    btnContinuar: TButton;
    pmnuGrid: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuLimpiarSeleccion: TMenuItem;
    mnuInvertirSeleccion: TMenuItem;
    mnuRemitosMasivos: TMenuItem;
    GroupBox11: TGroupBox;
    fraTipoDocumentoBusqueda: TfraCtbTablas;
    tbDerivacion: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    fpDerivacion: TFormPanel;
    Bevel2: TBevel;
    Label20: TLabel;
    btnAceptarDerivacion: TButton;
    btnCancelarDerivacion: TButton;
    fraUsuarioDerivacion: TfraUsuarios;
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuResultadosClick(Sender: TObject);
    procedure mnuRemitoClick(Sender: TObject);
    procedure CambiaUsuario(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuLimpiarSeleccionClick(Sender: TObject);
    procedure mnuInvertirSeleccionClick(Sender: TObject);
    procedure mnuRemitosMasivosClick(Sender: TObject);
    procedure tbDerivacionClick(Sender: TObject);
    procedure btnAceptarDerivacionClick(Sender: TObject);
    procedure fpDerivacionEnter(Sender: TObject);
  private
    procedure DoHabilitarCampos(bHabilitar :Boolean);
    procedure ImprimirRemitosMasivos(NumeroRemito: Integer);
  protected
  	function DoABM: Boolean; override;
  	function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
  	procedure RefreshData; override;
  public
  end;

var
  frmDocumentacion: TfrmDocumentacion;

implementation

uses
	unCustomConsulta, AnsiSql, General, CustomDlgs, unDmPrincipal, DateTimeFuncs, SqlFuncs, unSesion, unVisualizador,
  unRptRemito, unPrincipal, unArt, unPropiedadesFrame;
const
  cTIPODOC_IFFI = '15';     // TK 25970

{$R *.dfm}

function TfrmDocumentacion.DoABM: Boolean;
var
  iId: integer;
begin
	Sql.Clear;
  Sql.TableName := 'CDR_DOCUMENTACIONRECIBIDA';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;

    iId := sdqConsulta.FieldByName('dr_id').AsInteger;

    Sql.Fields.Add('dr_usubaja', 	 Sesion.UserID);
    Sql.Fields.Add('dr_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
	  if ModoABM = maAlta then
  	begin
    	Sql.SqlType := stInsert;

      iId := edCodigo.Value;

	    Sql.Fields.Add('dr_usualta', 	 Sesion.UserID);
  	  Sql.Fields.Add('dr_fechaalta', SQL_DATETIME, False);
    end
    else
    begin
    	Sql.SqlType := stUpdate;

    	iId := sdqConsulta.FieldByName('dr_id').AsInteger;
	    Sql.Fields.Add('dr_usumodif', 	 Sesion.UserID);
  	  Sql.Fields.Add('dr_fechamodif',  SQL_DATETIME, False);
		end;

    Sql.Fields.Add('dr_fecha', 		 		 	 edFecha.Date);
    Sql.Fields.Add('dr_remitente', 		 	 edRemitente.Text);
    Sql.Fields.Add('dr_usudestino', 	 	 fraUsuarioDestino.Value);
    Sql.Fields.Add('dr_sectordestino', 	 fraSectorDestino.Codigo);
    Sql.Fields.Add('dr_tipodocumento', 	 fraTipoDocumento.Value);
    Sql.Fields.Add('dr_numerodocumento', edNumeroDocumento.Value, True);
    Sql.Fields.Add('dr_observaciones', 	 edObservaciones.Text);
    Sql.Fields.Add('dr_cuil', 				 	 edCuil.Text);
    Sql.Fields.Add('dr_nombre', 			 	 edNombre.Text);
  end;

  Sql.PrimaryKey.Add('dr_id', iId, False);

  Result := inherited DoABM;
  DoHabilitarCampos(True);
end;

function TfrmDocumentacion.Validar: Boolean;
var
	bExisteTrabajador: Boolean;
	sSql: String;
begin
	if ModoABM = maAlta then
  begin
		Verificar(edCodigo.IsEmpty, edCodigo, 'El Código es obligatorio.');

	  sSql := 'SELECT 1 FROM cdr_documentacionrecibida WHERE dr_id = :id';
		Verificar(ExisteSqlEx(sSql, [edCodigo.Value]), edCodigo, 'El código debe ser único.');
  end;
  
  Verificar(edFecha.IsEmpty, edFecha, 'La fecha es obligatoria.');
  Verificar((edRemitente.Text = ''), edRemitente, 'El remitente es obligatorio.');
  Verificar(fraSectorDestino.IsEmpty, fraSectorDestino.edCodigo, 'El sector de destino es obligatorio.');
  Verificar(fraTipoDocumento.IsEmpty, fraTipoDocumento.edCodigo, 'El tipo de documento es obligatorio.');
  Verificar((fraTipoDocumento.Codigo = cTIPODOC_IFFI) and edNumeroDocumento.IsEmpty, edNumeroDocumento, 'El Nro de Documento es obligatorio para este tipo de Documentación');    // TK 25970

	Verificar((fraTipoDocumento.Value = '06') and
            ((fraSectorDestino.Codigo <> 'INCAP') and (fraSectorDestino.Codigo <> 'ENFPROF')),
            fraSectorDestino.edCodigo, 'Si el tipo de documento es dictamen el sector debe ser INCAP ó ENFPROF.');
  Verificar((edCuil.Text = '') and (fraTipoDocumento.Especial1 = 'S'), edCuil, 'El CUIL es obligatorio.');

  if edCuil.Text <> '' then
  begin
    sSql := 'SELECT ew_valcuit(:cuil) FROM DUAL';
    Verificar((ValorSqlIntegerEx(sSql, [edCuil.Text]) <> 1), edCuil, 'El número de CUIL es inválido.');
  end;

  sSql := 'SELECT tj_cuil, tj_nombre FROM ctj_trabajador WHERE tj_cuil = :cuil';
  bExisteTrabajador := ExisteSqlEx(sSql, [edCuil.Text]);

  Verificar((fraTipoDocumento.Especial2 = 'S') and (not bExisteTrabajador), edCuil, 'El trabajador debe existir.');
  Verificar((fraTipoDocumento.Especial1 = 'S') and (edNombre.Text = ''), edNombre, 'El nombre es obligatorio.');
  Verificar((fraTipoDocumento.Especial2 = 'S') and (not bExisteTrabajador), edCuil, 'El trabajador debe existir.');

	Result := True;
end;


procedure TfrmDocumentacion.CambiaUsuario(Sender: TObject);
var
	sSql: String;
begin
	if not fraUsuarioDestino.IsEmpty then
  begin
  	sSql := 'SELECT se_sector FROM use_usuarios WHERE se_usuario = :usuario';
    fraSectorDestino.Cargar(ValorSqlEx(sSql, [fraUsuarioDestino.Value]));
  end;
end;

procedure TfrmDocumentacion.ClearControls;
begin
	edCodigo.Clear;
  edFecha.Clear;
  edRemitente.Clear;
  fraUsuarioDestino.Clear;
  fraSectorDestino.Clear;
  fraTipoDocumento.Clear;
  edNumeroDocumento.Clear;
  edObservaciones.Clear;
  edCuil.Clear;
  edNombre.Clear;
end;

procedure TfrmDocumentacion.ClearData;
begin
	edFechaDesde.Clear;
  edFechaHasta.Clear;
  edCodigoDesde.Clear;
  edCodigoHasta.Clear;
  edRemitenteBusqueda.Clear;
  fraUsuarioDestinoBusqueda.Clear;
  fraSectorDestinoBusqueda.Clear;
  fraUsuarioRecepcionBusqueda.Clear;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;
  checkSinRecibir.Checked := True;
  checkSinRemito.Checked := True;
  fraTipoDocumentoBusqueda.Clear;

	inherited;
end;

procedure TfrmDocumentacion.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
	  edCodigo.Value 					:= FieldByName('dr_id').AsInteger;
  	edFecha.Date 						:= FieldByName('dr_fecha').AsDateTime;
	  edRemitente.Text 				:= FieldByName('dr_remitente').AsString;
  	fraUsuarioDestino.Value := FieldByName('dr_usudestino').AsString;
    fraSectorDestino.Cargar(FieldByName('dr_sectordestino').AsString);
  	fraTipoDocumento.Value 	:= FieldByName('dr_tipodocumento').AsString;
	  edNumeroDocumento.Value := FieldByName('dr_numerodocumento').AsInteger;
  	edObservaciones.Text 		:= FieldByName('dr_observaciones').AsString;
	  edCuil.Text 						:= FieldByName('dr_cuil').AsString;
  	edNombre.Text 					:= FieldByName('dr_nombre').AsString;
  end;
  DoHabilitarCampos(sdqConsulta.FieldByName('dr_remito').IsNull);
end;

procedure TfrmDocumentacion.RefreshData;
var
	sWhere: String;
begin
	sWhere := '';

  if not edFechaDesde.IsEmpty then
  	sWhere := ' AND dr_fecha >= ' + SqlValue(edFechaDesde.Date);

  if not edFechaHasta.IsEmpty then
  	sWhere := sWhere + ' AND dr_fecha <= ' + SqlValue(edFechaHasta.Date);

  if edCodigoDesde.Value > 0 then
  	sWhere := sWhere + ' AND dr_id >= ' + SqlValue(edCodigoDesde.Value);

  if edCodigoHasta.Value > 0 then
  	sWhere := sWhere + ' AND dr_id <= ' + SqlValue(edCodigoHasta.Value);

  if edRemitenteBusqueda.Text <> '' then
  	sWhere := sWhere + ' AND dr_remitente LIKE ' + SqlValue(edRemitenteBusqueda.Text + '%');

  if not fraUsuarioDestinoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND dr_usudestino = ' + SqlValue(fraUsuarioDestinoBusqueda.Value);

  if not fraSectorDestinoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND dr_sectordestino = ' + SqlValue(fraSectorDestinoBusqueda.Codigo);

  if not fraUsuarioRecepcionBusqueda.IsEmpty then
  	sWhere := sWhere + ' AND dr_usurecepcion = ' + SqlValue(fraUsuarioRecepcionBusqueda.Value);

  if not edFechaRecepcionDesde.IsEmpty then
  	sWhere := sWhere + ' AND dr_fecharecepcion >= ' + SqlValue(edFechaRecepcionDesde.Date);

  if not edFechaRecepcionHasta.IsEmpty then
  	sWhere := sWhere + ' AND dr_fecharecepcion <= ' + SqlValue(edFechaRecepcionDesde.Date);

  if edRemitoDesde.Value > 0 then
  	sWhere := sWhere + ' AND dr_remito >= ' + SqlValue(edRemitoDesde.Value);

  if edRemitoHasta.Value > 0 then
  	sWhere := sWhere + ' AND dr_remito <= ' + SqlValue(edRemitoHasta.Value);

  if checkSinRecibir.Checked then
  	sWhere := sWhere + ' AND dr_fecharecepcion IS NULL';

  if checkSinRemito.Checked then
  	sWhere := sWhere + ' AND dr_remito IS NULL';

  if not fraTipoDocumentoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND dr_tipodocumento = ' + SqlValue(fraTipoDocumentoBusqueda.Value);


	sdqConsulta.SQL.Text :=
    'SELECT dr_id, dr_fecha, dr_remitente, use_dest.se_nombre use_dest, usc_dest.sc_descripcion, tb_descripcion,' +
    			' dr_observaciones, use_rec.se_nombre use_rec, dr_fecharecepcion, dr_remito, dr_fecharemito, dr_cuil,' +
          ' dr_nombre, dr_fechabaja, dr_numerodocumento, dr_usudestino, dr_sectordestino, dr_tipodocumento,' +
          ' use_der.se_nombre use_der, trunc(dr_fechaderivacion) fechaderivacion, dr_derivadoa ' +
     ' FROM use_usuarios use_der, use_usuarios use_rec, ctb_tablas, usc_sectores usc_dest, use_usuarios use_dest, cdr_documentacionrecibida' +
    ' WHERE dr_usudestino = use_dest.se_usuario(+)' +
      ' AND dr_sectordestino = usc_dest.sc_codigo' +
      ' AND dr_derivadoa = use_der.se_usuario(+)' +
      ' AND dr_tipodocumento = tb_codigo' +
      ' AND tb_clave = ''TDOCR''' +
      ' AND dr_usurecepcion = use_rec.se_usuario(+)' +
						sWhere +
            SortDialog.OrderBy;

	inherited;
end;

procedure TfrmDocumentacion.btnAceptar2Click(Sender: TObject);
var
	sSql: String;
  FRemito: TDateTime;
begin
	Verificar(fraRemito.IsEmpty, fraRemito.cmbDescripcion, 'El código es obligatorio.');
  Verificar(edFechaRecepcion.IsEmpty, edFechaRecepcion, 'La fecha de recepción es obligatoria.');
  Verificar(fraUsuarioRecepcion.IsEmpty, fraUsuarioRecepcion.edCodigo, 'El usuario de recepción es obligatorio');

  sSql := 'SELECT dr_fecharemito ' +
            'FROM cdr_documentacionrecibida' +
          ' WHERE dr_remito = :remito';
  FRemito := ValorSqlDateTimeEx(sSql, [fraRemito.Value]);
  Verificar((FRemito <> 0) and (edFechaRecepcion.Date < FRemito), edFechaRecepcion, 'La fecha de recepción no puede ser menor a la fecha del remito: ' + DateToStr(FRemito));
  Verificar(edFechaRecepcion.Date > DBDate(), edFechaRecepcion, 'La fecha de recepción no puede ser mayor a la fecha actual');

  sSql :=
    'UPDATE cdr_documentacionrecibida' +
      ' SET dr_fecharecepcion = :fecharecepcion,' +
          ' dr_usurecepcion = :usurecepcion,' +
          ' dr_fechamodif = SYSDATE,' +
          ' dr_usumodif = :usumodif' +
    ' WHERE dr_remito = :remito';
	EjecutarSqlEx(sSql, [TDateTimeEx.Create(edFechaRecepcion.Date), fraUsuarioRecepcion.Value, Sesion.UserID,
  										 fraRemito.Value]);
	fpRecepcion.Close;
end;

procedure TfrmDocumentacion.btnCancelar2Click(Sender: TObject);
begin
	fpRecepcion.Close;
end;

procedure TfrmDocumentacion.tbPropiedadesClick(Sender: TObject);
begin
	fpRecepcion.ShowModal;
end;

procedure TfrmDocumentacion.FormCreate(Sender: TObject);
begin
  inherited;

  {$IFDEF LEGALES}
  tbDerivacion.ImageIndex := 26;
  {$ELSE}
  tbDerivacion.ImageIndex := 41;
  {$ENDIF}

  tbSalir2.ImageIndex := tbSalir.ImageIndex;

  FieldBaja := 'dr_fechabaja';

  fraTipoDocumento.Clave := 'TDOCR';
  fraTipoDocumentoBusqueda.Clave := 'TDOCR';
  fraUsuarioDestino.OnChange := CambiaUsuario;

  with fraRemito.Propiedades do
  begin
    Sql := ' SELECT DISTINCT dr_remito, dr_remito id, dr_remito codigo, dr_remito descripcion, ' +
                  ' dr_fechabaja baja ' +
             ' FROM cdr_documentacionrecibida ' +
            ' WHERE dr_fechabaja IS NULL ' +
              ' AND dr_fecharecepcion IS NULL ' +
              ' AND dr_remito IS NOT NULL';
    FieldBaja     := 'baja';
    FieldCodigo   := 'dr_remito';
    FieldID       := 'dr_remito';
    FieldDesc     := 'dr_remito';
  end;

  ClearData;
end;

procedure TfrmDocumentacion.mnuResultadosClick(Sender: TObject);
begin
	inherited tbImprimirClick(nil);
end;

procedure TfrmDocumentacion.mnuRemitoClick(Sender: TObject);
var
	iLoop: Integer;
  iNumeroRemito: Integer;
	iRemitos: TStringList;
  sSql: String;
begin
	iRemitos := TStringList.Create;
  iRemitos.Duplicates := dupIgnore;
  iRemitos.Sorted := True;

	Application.CreateForm(TqrRemito, qrRemito);
  sdqConsulta.DisableControls;
  try
		for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
    	sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
      iRemitos.Add(IntToStr(sdqConsulta.FieldByName('dr_remito').AsInteger));
    end;

    Verificar((iRemitos.Count = 0), Grid, 'No ha seleccionado ningún registro.');
    Verificar((iRemitos.Count > 1), Grid, 'No puede seleccionar documentación de distintos remitos.');

    iNumeroRemito := ValorSql('SELECT NVL(MAX(dr_remito), 0) + 1 FROM cdr_documentacionrecibida');
		sSql :=
      'UPDATE cdr_documentacionrecibida' +
        ' SET dr_remito = :remito,' +
        		' dr_fecharemito = ACTUALDATE' +
      ' WHERE dr_id = :id';

		for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
    	sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
      if sdqConsulta.FieldByName('dr_remito').IsNull then
				EjecutarSqlEx(sSql, [iNumeroRemito, sdqConsulta.FieldByName('dr_id').AsInteger]);
    end;

    ClearData;
    checkSinRemito.Checked := False;
    if (iRemitos.Count = 1) and (StrToInt(iRemitos[0]) <> 0) then
    begin
    	edRemitoDesde.Value := StrToInt(iRemitos[0]);
      edRemitoHasta.Value := StrToInt(iRemitos[0]);
    end
    else
    begin
    	edRemitoDesde.Value := iNumeroRemito;
      edRemitoHasta.Value := iNumeroRemito;
    end;

    qrRemito.lbNumeroRemito.Caption := Format('Remito Nº %d', [edRemitoDesde.Value]);
    qrRemito.qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    RefreshData;
		Visualizar(qrRemito, GetValores(), [oForceShowModal]);
  finally
  	sdqConsulta.EnableControls;
  	FreeAndNil(qrRemito);
    iRemitos.Free;
  end;
end;

procedure TfrmDocumentacion.tbImprimirClick(Sender: TObject);
begin
	tbImprimir.CheckMenuDropdown;
end;

procedure TfrmDocumentacion.fpAbmShow(Sender: TObject);
begin
	inherited;
	edCodigo.Enabled := (ModoABM = maAlta) and (Sesion.Sector <> 'INCAP');    // TK 56765 (lo del sector INCAP)

  if (Sesion.Sector = 'INCAP') then                        // TK 56765
    edCodigo.Text := IntToStr(GetSecNextVal('COMUNES.SEQ_CDR_INCAP_ID'));


  if ModoABM = maAlta then
		edFecha.Date := DBDate;
end;

procedure TfrmDocumentacion.btnContinuarClick(Sender: TObject);
begin
	if Validar and DoABM then
	begin
  	ModoABM := maAlta;
  	edCodigo.Clear;

    if (Sesion.Sector = 'INCAP') then                        // TK 56765
    begin
      edCodigo.Text    := IntToStr(GetSecNextVal('COMUNES.SEQ_CDR_INCAP_ID'));
      edCodigo.Enabled := false;
    end
    else
      edCodigo.Enabled  := True;

    edFecha.Date      := DBDate;
    fraUsuarioDestino.Clear;
    edNumeroDocumento.Clear;
    edObservaciones.Clear;
    edCuil.Clear;
    edNombre.Clear;
    if edCodigo.Enabled then
      edCodigo.SetFocus;
  end;
end;

procedure TfrmDocumentacion.tbEliminarClick(Sender: TObject);
begin
	Verificar(not sdqConsulta.FieldByName('dr_remito').IsNull, Grid, 'Este registro no puede ser dado de baja porque ya tiene un número de remito asignado.');
  inherited;
end;

procedure TfrmDocumentacion.tbModificarClick(Sender: TObject);
begin
	Verificar(not(sdqConsulta.FieldByName('dr_remito').IsNull) and
            not(Seguridad.Claves.IsActive('ModificarDocumento')), Grid,
            'Este registro no puede ser modificado porque ya tiene un número de remito asignado.');
  inherited;
end;

procedure TfrmDocumentacion.mnuSeleccionarTodoClick(Sender: TObject);
begin
	Grid.SelectAll;
end;

procedure TfrmDocumentacion.mnuLimpiarSeleccionClick(Sender: TObject);
begin
	Grid.UnselectAll;
end;

procedure TfrmDocumentacion.mnuInvertirSeleccionClick(Sender: TObject);
begin
	Grid.InvertSelection;
end;

procedure TfrmDocumentacion.ImprimirRemitosMasivos(NumeroRemito: Integer);
begin
  ClearData;
  checkSinRemito.Checked := False;
  edRemitoDesde.Value := NumeroRemito;
  edRemitoHasta.Value := NumeroRemito;

  qrRemito.lbNumeroRemito.Caption := Format('Remito Nº %d', [edRemitoDesde.Value]);
  qrRemito.qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  RefreshData;
  qrRemito.Print;
end;

procedure TfrmDocumentacion.mnuRemitosMasivosClick(Sender: TObject);
var
	iNumeroRemito: Integer;
	sSql: String;
  bSinRegistros: Boolean;
begin
	Application.CreateForm(TqrRemito, qrRemito);
  sdqConsulta.DisableControls;

  bSinRegistros := True;

	sSql :=
		'SELECT DISTINCT dr_sectordestino' +
           	  ' FROM cdr_documentacionrecibida' +
          	 ' WHERE dr_remito IS NULL' +
               ' AND (dr_sectordestino NOT IN (''COME'', ''HYS'')' +
                  'OR dr_usudestino IS NULL)';  // COME Comercial - HYS Prevención

  with GetQuery(sSql) do
  try
  	if not IsEmpty then
    begin
      bSinRegistros := False;

	  	while not Eof do
  	  begin
    		iNumeroRemito := ValorSql('SELECT NVL(MAX(dr_remito), 0) + 1 FROM cdr_documentacionrecibida');

				sSql :=
  		    'UPDATE cdr_documentacionrecibida' +
    		    ' SET dr_remito = :remito,' +
      		  		' dr_fecharemito = ACTUALDATE' +
	      	' WHERE dr_sectordestino = :sector' +
	  	    	' AND dr_remito IS NULL';
  	  	EjecutarSqlEx(sSql, [iNumeroRemito, FieldByName('dr_sectordestino').AsString]);

        ImprimirRemitosMasivos(iNumeroRemito);

      	Next;
	    end;
    end;

	sSql :=
		'SELECT DISTINCT dr_usudestino' +
           	  ' FROM cdr_documentacionrecibida' +
          	 ' WHERE dr_remito IS NULL' +
               ' AND dr_sectordestino IN (''COME'', ''HYS'')' +  // COME Comercial - HYS Prevención
               ' AND dr_usudestino IS NOT NULL';

  with GetQuery(sSql) do
  	if not IsEmpty then
    begin
      bSinRegistros := False;

	  	while not Eof do
  	  begin
    		iNumeroRemito := ValorSql('SELECT NVL(MAX(dr_remito), 0) + 1 FROM cdr_documentacionrecibida');

				sSql :=
  		    'UPDATE cdr_documentacionrecibida' +
    		    ' SET dr_remito = :remito,' +
      		  		' dr_fecharemito = ACTUALDATE' +
	      	' WHERE dr_usudestino = :usuario' +
	  	    	' AND dr_remito IS NULL';
  	  	EjecutarSqlEx(sSql, [iNumeroRemito, FieldByName('dr_usudestino').AsString]);

        ImprimirRemitosMasivos(iNumeroRemito);

      	Next;
	    end;
    end;

    if bSinRegistros then
    	MsgBox('No hay registros para imprimir.')
    else
      MsgBox('Los remitos se han impreso correctamente.');
	finally
  	sdqConsulta.EnableControls;
  	FreeAndNil(qrRemito);
  	Free;
  end;
end;

procedure TfrmDocumentacion.tbDerivacionClick(Sender: TObject);
begin
  Verificar(Grid.SelCount = 0, Grid, 'No ha seleccionado ningún registro.');
  Verificar(Grid.SelCount > 1, Grid, 'Debe seleccionar solo un registro.');
  Verificar(not sdqConsulta.FieldByName('dr_fechabaja').IsNull, Grid, 'El registro se encuentra dado de baja.');

  if fpDerivacion.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmDocumentacion.DoHabilitarCampos(bHabilitar :Boolean);
begin
  edFecha.Enabled           := bHabilitar;
  edRemitente.Enabled       := bHabilitar;
  fraUsuarioDestino.Enabled := bHabilitar;
  fraSectorDestino.Enabled  := bHabilitar;
  edNumeroDocumento.Enabled := bHabilitar;
  edObservaciones.Enabled   := bHabilitar;
  edNombre.Enabled          := bHabilitar;
end;

procedure TfrmDocumentacion.btnAceptarDerivacionClick(Sender: TObject);
begin
  Verificar(fraUsuarioDerivacion.IsEmpty, fraUsuarioDerivacion, 'Debe indicar el usuario de derivación.');

  if MsgBox('¿Está seguro de querer derivar este documento?', MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES then
    begin
      try
        with TSql.Create do
          try
            TableName := 'CDR_DOCUMENTACIONRECIBIDA';

            SqlType := stUpdate;

            PrimaryKey.Add('dr_id',           sdqConsulta.FieldByName('dr_id').AsInteger, False);
            Fields.Add('dr_fechaderivacion',  SQL_DATETIME, False);
            Fields.Add('dr_derivadoa', 	 	    fraUsuarioDerivacion.Value);
            Fields.Add('dr_remito', 	 	      exNull);
            Fields.Add('dr_fecharemito', 	 	  exNull);

            EjecutarSql(Sql);
          finally
            Free;
          end;

        MsgBox('Derivación grabada correctamente.', MB_OK + MB_ICONINFORMATION);
        fpDerivacion.ModalResult := mrOk;
      except
        On E: Exception do
          Raise Exception.Create (E.Message + CRLF + 'Error al grabar la derivación.');
      end;
    end;
end;

procedure TfrmDocumentacion.fpDerivacionEnter(Sender: TObject);
begin
  fraUsuarioDerivacion.Clear;
end;

end.

