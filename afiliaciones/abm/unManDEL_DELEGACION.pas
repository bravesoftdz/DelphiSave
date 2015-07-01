unit unManDEL_DELEGACION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  Mask, unFraDomicilioTrab, unfraUsuarios, AdvCardList, DBAdvCardList,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, AdvGroupBox,
  AdvOfficeButtons, RxPlacemnt;

type
  TfrmManDEL_DELEGACION = class(TfrmCustomGridABM)
    Panel1: TPanel;
    chkSoloActivas: TCheckBox;
    ToolButton1: TToolButton;
    pnlEjecutivos: TPanel;
    pnlDatos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edEL_NOMBRE: TEdit;
    edEL_CODAREATELEFONOS: TIntEdit;
    edEL_TELEFONOS: TPatternEdit;
    edEL_CODAREAFAX: TIntEdit;
    edEL_FAX: TPatternEdit;
    edEL_ID: TEdit;
    edEL_HORARIODESDE: TEdit;
    edEL_HORARIOHASTA: TEdit;
    fraDomicilio: TfraDomicilio;
    fraEL_REPRESENTANTE: TfraUsuario;
    tbEjecutivos: TToolBar;
    tbNuevoEjecutivo: TToolButton;
    tbModificarEjecutivo: TToolButton;
    tbEliminarEjecutivo: TToolButton;
    DBAdvCardListEjecutivos: TDBAdvCardList;
    dsEjecutivosDelegacion: TDataSource;
    sdqEjecutivosDelegacion: TSDQuery;
    sdqEjecutivosDelegacionED_ID: TFloatField;
    sdqEjecutivosDelegacionED_IDDELEGACION: TFloatField;
    sdqEjecutivosDelegacionED_IDEJECUTIVO: TFloatField;
    sdqEjecutivosDelegacionED_FECHAALTA: TDateTimeField;
    sdqEjecutivosDelegacionED_USUALTA: TStringField;
    sdqEjecutivosDelegacionED_FECHAMODIF: TDateTimeField;
    sdqEjecutivosDelegacionED_USUMODIF: TStringField;
    sdqEjecutivosDelegacionED_FECHABAJA: TDateTimeField;
    sdqEjecutivosDelegacionED_USUBAJA: TStringField;
    sdqEjecutivosDelegacionEC_ID: TFloatField;
    sdqEjecutivosDelegacionEC_NOMBRE: TStringField;
    sdqEjecutivosDelegacionEC_IDUBICACION: TFloatField;
    sdqEjecutivosDelegacionEC_NUMERO: TStringField;
    sdqEjecutivosDelegacionEC_PISO: TStringField;
    sdqEjecutivosDelegacionEC_DEPARTAMENTO: TStringField;
    sdqEjecutivosDelegacionEC_CPOSTALA: TStringField;
    sdqEjecutivosDelegacionEC_CODAREATELEFONOS: TStringField;
    sdqEjecutivosDelegacionEC_TELEFONOS: TStringField;
    sdqEjecutivosDelegacionEC_CODAREAFAX: TStringField;
    sdqEjecutivosDelegacionEC_FAX: TStringField;
    sdqEjecutivosDelegacionEC_FECHAALTA: TDateTimeField;
    sdqEjecutivosDelegacionEC_USUALTA: TStringField;
    sdqEjecutivosDelegacionEC_FECHAMODIF: TDateTimeField;
    sdqEjecutivosDelegacionEC_USUMODIF: TStringField;
    sdqEjecutivosDelegacionEC_FECHABAJA: TDateTimeField;
    sdqEjecutivosDelegacionEC_USUBAJA: TStringField;
    sdqEjecutivosDelegacionEC_CALLE: TStringField;
    sdqEjecutivosDelegacionEC_LOCALIDAD: TStringField;
    sdqEjecutivosDelegacionEC_CPOSTAL: TStringField;
    sdqEjecutivosDelegacionEC_PROVINCIA: TStringField;
    sdqEjecutivosDelegacionEC_USUARIO: TStringField;
    sdqEjecutivosDelegacionSE_USUARIO: TStringField;
    sdqEjecutivosDelegacionSE_CLAVE: TStringField;
    sdqEjecutivosDelegacionSE_NOMBRE: TStringField;
    sdqEjecutivosDelegacionSE_PERFIL: TStringField;
    sdqEjecutivosDelegacionSE_HISTO1: TStringField;
    sdqEjecutivosDelegacionSE_HISTO2: TStringField;
    sdqEjecutivosDelegacionSE_HISTO3: TStringField;
    sdqEjecutivosDelegacionSE_FECHAMOD: TDateTimeField;
    sdqEjecutivosDelegacionSE_TIEMPOESPERA: TFloatField;
    sdqEjecutivosDelegacionSE_SECTOR: TStringField;
    sdqEjecutivosDelegacionSE_CARGO: TStringField;
    sdqEjecutivosDelegacionSE_FECHABAJA: TDateTimeField;
    sdqEjecutivosDelegacionSE_INTERNO: TStringField;
    sdqEjecutivosDelegacionSE_CUIT: TStringField;
    sdqEjecutivosDelegacionSE_HOLDING: TStringField;
    sdqEjecutivosDelegacionSE_DELEGACION: TStringField;
    sdqEjecutivosDelegacionSE_MAIL: TStringField;
    sdqEjecutivosDelegacionSE_ID: TFloatField;
    sdqEjecutivosDelegacionSE_IDSECTOR: TFloatField;
    sdqEjecutivosDelegacionSE_ACCESOSEGURIDAD: TStringField;
    sdqEjecutivosDelegacionSE_RESPONDEA: TStringField;
    sdqEjecutivosDelegacionSE_UBICA: TFloatField;
    sdqEjecutivosDelegacionSE_PC: TFloatField;
    sdqEjecutivosDelegacionSE_AUTORIZA: TFloatField;
    sdqEjecutivosDelegacionSE_DOMINIO: TStringField;
    sdqEjecutivosDelegacionSE_PUESTO: TFloatField;
    sdqEjecutivosDelegacionSE_LEGAJO: TFloatField;
    sdqEjecutivosDelegacionSE_FOTO: TStringField;
    sdqEjecutivosDelegacionSE_FECHACUMPLE: TDateTimeField;
    sdqEjecutivosDelegacionSE_CONTRATO: TFloatField;
    sdqEjecutivosDelegacionSE_NIVEL: TFloatField;
    sdqEjecutivosDelegacionSE_HORARIOATENCION: TStringField;
    sdqEjecutivosDelegacionSE_FECHAALTA: TDateTimeField;
    sdqEjecutivosDelegacionSE_USUALTA: TStringField;
    sdqEjecutivosDelegacionSE_FECHAMODIF: TDateTimeField;
    sdqEjecutivosDelegacionSE_USUMODIF: TStringField;
    sdqEjecutivosDelegacionSE_USUBAJA: TStringField;
    sdqEjecutivosDelegacionSE_USUARIOGENERICO: TStringField;
    sdqEjecutivosDelegacionSE_PISO: TFloatField;
    sdqEjecutivosDelegacionSE_EJEX: TFloatField;
    sdqEjecutivosDelegacionSE_EJEY: TFloatField;
    sdqEjecutivosDelegacionSE_DENTROFUERAEDIFICIO: TStringField;
    sdqEjecutivosDelegacionSE_BUSCANOMBRE: TStringField;
    sdqEjecutivosDelegacionSE_IDNIVELAUTORIZA: TFloatField;
    sdqEjecutivosDelegacionSE_NOTAS: TStringField;
    sdqEjecutivosDelegacionSE_LEGAJORRHH: TFloatField;
    sdqEjecutivosDelegacionSE_SUBEVENTANILLA: TStringField;
    sdqEjecutivosDelegacionSE_IDDELEGACIONSEDE: TFloatField;
    tbActualizarEjecutivo: TToolButton;
    fpEjecutivo: TFormPanel;
    btnAceptarEjecutivo: TButton;
    btnCancelarEjecutivo: TButton;
    fraEjecutivo: TfraCodDesc;
    Label8: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    sdqEjecutivosDelegacionDOMICILIO: TStringField;
    sduEjecutivosDelegacion: TSDUpdateSQL;
    sdqEjecutivosDelegacionFOTO: TBlobField;
    fraTipo: TfraCodDesc;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraDomiciliobtnBuscarClick(Sender: TObject);
    procedure tbActualizarEjecutivoClick(Sender: TObject);
    procedure tbNuevoEjecutivoClick(Sender: TObject);
    procedure tbModificarEjecutivoClick(Sender: TObject);
    procedure DBAdvCardListEjecutivosCardDblClick(Sender: TObject; Card: TAdvCard);
    procedure btnAceptarEjecutivoClick(Sender: TObject);
    procedure tbEliminarEjecutivoClick(Sender: TObject);
    procedure sdqEjecutivosDelegacionAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure PrintResults; override;
    procedure RefreshData; override;
  end;

var
  frmManDEL_DELEGACION: TfrmManDEL_DELEGACION;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs,
  unCustomConsulta, unSesion, VCLExtra;

{$R *.DFM}

procedure TfrmManDEL_DELEGACION.ClearControls;
begin
  edEL_ID.Clear;
  edEL_NOMBRE.Clear;
  fraEL_REPRESENTANTE.Limpiar;
  fraTipo.Clear;

  // Habilito el control
  edEL_NOMBRE.Color   := clWindow;
  edEL_NOMBRE.enabled := True;
  edEL_NOMBRE.TabStop := True;

  fraDomicilio.Clear;
  edEL_CODAREATELEFONOS.Clear;
  edEL_TELEFONOS.Clear;
  edEL_CODAREAFAX.Clear;
  edEL_FAX.Clear;
  edEL_HORARIODESDE.Clear;
  edEL_HORARIOHASTA.Clear;

  sdqEjecutivosDelegacion.Close;
end;

function TfrmManDEL_DELEGACION.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('el_id',    sdqConsulta.FieldByName('el_id').AsInteger);
    Sql.Fields.Add('el_fechabaja', exDateTime);
    Sql.Fields.Add('el_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('el_id', 'SEQ_DEL_ID.NEXTVAL');
      Sql.Fields.Add('el_fechaalta',        exDateTime);
      Sql.Fields.Add('el_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('el_id',     sdqConsulta.FieldByName('el_id').AsInteger);
      Sql.Fields.Add('el_fechamodif', exDateTime);
      Sql.Fields.Add('el_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('el_nombre',        edEL_NOMBRE.Text);
    Sql.Fields.Add('el_representante', fraEL_REPRESENTANTE.UserID);

    with fraDomicilio do
    begin
      Sql.Fields.Add('el_cpostal',   CodigoPostal);
      Sql.Fields.Add('el_calle',     Calle);
      Sql.Fields.Add('el_localidad', Localidad);

      sSql :=
        'SELECT pv_codigo' +
         ' FROM cpv_provincias' +
        ' WHERE pv_descripcion = :provincia';
      Sql.Fields.Add('el_provincia', ValorSqlIntegerEx(sSql, [fraDomicilio.Provincia], 0), False);
      
      Sql.Fields.Add('el_numero',       Numero);
      Sql.Fields.Add('el_piso',         Piso);
      Sql.Fields.Add('el_departamento', Departamento);
      Sql.Fields.Add('el_cpostala',     CPA);
    end;

    Sql.Fields.Add('el_codareatelefonos', edEL_CODAREATELEFONOS.Text);
    Sql.Fields.Add('el_telefonos',        edEL_TELEFONOS.Text);
    Sql.Fields.Add('el_codareafax',       edEL_CODAREAFAX.Text);
    Sql.Fields.Add('el_fax',              edEL_FAX.Text);
    Sql.Fields.Add('el_horariodesde',     edEL_HORARIODESDE.Text);
    Sql.Fields.Add('el_horariohasta',     edEL_HORARIOHASTA.Text);
    Sql.Fields.Add('el_tipo',             fraTipo.Codigo);
   end;
   
   Sql.Sql;

   Result := inherited DoABM;
end;

procedure TfrmManDEL_DELEGACION.LoadControls;
begin
  with sdqConsulta do
  begin
    edEL_ID.Text               := FieldByName('el_id').AsString;
    edEL_NOMBRE.Text           := FieldByName('el_nombre').AsString;
    fraEL_REPRESENTANTE.Cargar(FieldByName('el_representante').AsString);

    // Inhabilito el control
    edEL_NOMBRE.Color   := clBtnFace;
    edEL_NOMBRE.enabled := False;
    edEL_NOMBRE.TabStop := False;

    with fraDomicilio do
    begin
      CodigoPostal := FieldByName('el_cpostal').AsString;
      Calle        := FieldByName('el_calle').AsString;
      Localidad    := FieldByName('el_localidad').AsString;
      Provincia    := FieldByName('pv_descripcion').AsString;
      Numero       := FieldByName('el_numero').AsString;
      Piso         := FieldByName('el_piso').AsString;
      Departamento := FieldByName('el_departamento').AsString;
      CPA          := FieldByName('el_cpostala').AsString;
    end;

    edEL_CODAREATELEFONOS.Text := FieldByName('el_codareatelefonos').AsString;
    edEL_TELEFONOS.Text        := FieldByName('el_telefonos').AsString;
    edEL_CODAREAFAX.Text       := FieldByName('el_codareafax').AsString;
    edEL_FAX.Text              := FieldByName('el_fax').AsString;
    edEL_HORARIODESDE.Text     := FieldByName('el_horariodesde').AsString;
    edEL_HORARIOHASTA.Text     := FieldByName('el_horariohasta').AsString;

    fraTipo.Codigo := FieldByName('el_tipo').AsString;
  end;

  tbActualizarEjecutivoClick(nil);  
end;

function TfrmManDEL_DELEGACION.Validar: Boolean;
begin
  Verificar(IsEmptyString(edEL_NOMBRE.Text), edEL_NOMBRE, 'Debe indicar el nombre de la delegación o sucursal.');
  Verificar(fraEL_REPRESENTANTE.IsEmpty, fraEL_REPRESENTANTE.edCodigo, 'Debe especificar quién es el representante.');
  Verificar(fraTipo.IsEmpty, fraTipo.edCodigo, 'Debe indicar el tipo de establecimiento.');
  Result := fraDomicilio.IsValid;
end;

procedure TfrmManDEL_DELEGACION.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  inherited;
end;

procedure TfrmManDEL_DELEGACION.FormCreate(Sender: TObject);
begin
  ShowActived   := True;
  inherited;
  Sql.TableName := 'del_delegacion';
  FieldBaja     := 'el_fechabaja';
  FSQL          := sdqConsulta.SQL.Text;
  fraEL_REPRESENTANTE.ShowBajas := False;
end;

procedure TfrmManDEL_DELEGACION.tbLimpiarClick(Sender: TObject);
begin
  chkSoloActivas.Checked := True;
  inherited;
end;

procedure TfrmManDEL_DELEGACION.RefreshData;
var
  sSql: String;
begin
  sSql := FSQL;

  if chkSoloActivas.Checked then
    sSql := sSql + ' AND el_fechabaja IS NULL';

	sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManDEL_DELEGACION.fraDomiciliobtnBuscarClick(Sender: TObject);
begin
  inherited;
  fraDomicilio.btnBuscarClick(Sender);
end;

procedure TfrmManDEL_DELEGACION.tbActualizarEjecutivoClick(Sender: TObject);
begin
  OpenQueryEx(sdqEjecutivosDelegacion, [sdqConsulta.FieldByName('EL_ID').AsInteger]);
end;

procedure TfrmManDEL_DELEGACION.tbNuevoEjecutivoClick(Sender: TObject);
begin
  fraEjecutivo.Clear;
  fpEjecutivo.Tag := 1;
  fpEjecutivo.ShowModal;
  fpEjecutivo.Tag := 0;
end;

procedure TfrmManDEL_DELEGACION.tbModificarEjecutivoClick(Sender: TObject);
begin
  fraEjecutivo.Codigo := sdqEjecutivosDelegacion.FieldByName('EC_ID').AsString;
  fpEjecutivo.Tag := 2;
  fpEjecutivo.ShowModal;
  fpEjecutivo.Tag := 0;  
end;

procedure TfrmManDEL_DELEGACION.DBAdvCardListEjecutivosCardDblClick(Sender: TObject; Card: TAdvCard);
begin
  tbModificarEjecutivoClick(nil);
end;

procedure TfrmManDEL_DELEGACION.btnAceptarEjecutivoClick(Sender: TObject);
begin
  Verificar(fraEjecutivo.IsEmpty, fraEjecutivo.edCodigo, 'Debe seleccionar un ejecutivo.');
  Verificar(fraEjecutivo.IsBaja, fraEjecutivo.edCodigo, 'El ejecutivo seleccionado ha sido dado de baja.');

  if fpEjecutivo.Tag = 1 then
    EjecutarSQLEx('INSERT INTO art.aed_ejecutivodelegacion (ed_iddelegacion, ed_idejecutivo, ed_fechaalta, ed_usualta) VALUES (:iddelegacion, :idejecutivo, SYSDATE, :usualta)', [sdqConsulta.FieldByName('EL_ID').AsInteger, fraEjecutivo.ID, Sesion.UserID])
  else if fpEjecutivo.Tag = 2 then
    EjecutarSQLEx('UPDATE art.aed_ejecutivodelegacion SET ed_idejecutivo = :idejecutivo, ed_fechamodif = SYSDATE, ed_usumodif = :usuario WHERE ed_id = :id', [fraEjecutivo.ID, Sesion.UserID, sdqEjecutivosDelegacion.FieldByName('ED_ID').AsInteger]);

  fpEjecutivo.ModalResult := mrOk;
  tbActualizarEjecutivo.Click;
end;

procedure TfrmManDEL_DELEGACION.tbEliminarEjecutivoClick(Sender: TObject);
begin
  Verificar(sdqEjecutivosDelegacion.IsEmpty, tbEliminarEjecutivo, 'Debe seleccionar un ejecutivo.');
  if MsgAsk(Format('¿Desea dar de baja la relación entre el ejecutivo seleccionado y la delegación %s?', [sdqConsulta.FieldByName('EL_NOMBRE').AsString])) then
  begin
    EjecutarSQLEx('UPDATE art.aed_ejecutivodelegacion SET ed_fechabaja = SYSDATE, ed_usubaja = :usuario WHERE ed_id = :id', [Sesion.UserID, sdqEjecutivosDelegacion.FieldByName('ED_ID').AsInteger]);
    tbActualizarEjecutivo.Click;
  end;
end;

procedure TfrmManDEL_DELEGACION.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
end;

procedure TfrmManDEL_DELEGACION.sdqEjecutivosDelegacionAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tbModificarEjecutivo.Enabled := Seguridad.Activar(tbModificarEjecutivo) and (not sdqEjecutivosDelegacion.IsEmpty);
  tbEliminarEjecutivo.Enabled := Seguridad.Activar(tbEliminarEjecutivo) and (not sdqEjecutivosDelegacion.IsEmpty);  
end;

end.
