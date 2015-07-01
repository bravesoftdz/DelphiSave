unit unManAGC_GESTORCUENTA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio,
  unFraCodigoDescripcion, unFraUsuario, Mask, unFraDomicilioTrab, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  ToolEdit, DateComboBox, unfraCtbTablas, unFraStaticCTB_TABLAS;

type
  TfrmManAGC_GESTORCUENTA = class(TfrmCustomGridABM)
    Label1: TLabel;
    edGC_NOMBRE: TEdit;
    Label2: TLabel;
    edGC_CODAREATELEFONOS: TIntEdit;
    edGC_TELEFONOS: TPatternEdit;
    Label3: TLabel;
    edGC_CODAREAFAX: TIntEdit;
    edGC_FAX: TPatternEdit;
    Label4: TLabel;
    edGC_ID: TEdit;
    fraUsuariosGestor: TfraUsuarios;
    lblUsuario: TLabel;
    lbCUIT: TLabel;
    edGC_CUIT: TMaskEdit;
    lblDirElectronica: TLabel;
    edGC_DIRELECTRONICA: TEdit;
    tbComision: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    fraDomicilio: TfraDomicilio;
    Label6: TLabel;
    edInternoTel: TPatternEdit;
    fraEstudioAsociado: TfraStaticCodigoDescripcion;
    lblEstudioAsoc: TLabel;
    btnCuentasBancarias: TButton;
    lblFRevision: TLabel;
    edFechaRevision: TDateComboBox;
    lblRetGanancias: TLabel;
    fraRetGanancias: TfraCtbTablas;
    lblSituacionIVA: TLabel;
    fraSituacionIVA: TfraStaticCTB_TABLAS;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbComisionClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnCuentasBancariasClick(Sender: TObject);
    procedure fraSituacionIVAChange(Sender: TObject);
  private
    FEsEstudio: Boolean;

    procedure SetEsEstudio(const Value: Boolean);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure EnableButtons(AEnabled: Boolean = True); override;
    procedure LoadControls; override;
    procedure PrintResults; override;
  public
    property EsEstudio: Boolean read FEsEstudio write SetEsEstudio default False;
  end;

var
  frmManAGC_GESTORCUENTA: TfrmManAGC_GESTORCUENTA;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, CUIT, Internet, unComisionGestor, Strfuncs, General,
  unManCCP_CUENTAPAGO;

{$R *.DFM}

procedure TfrmManAGC_GESTORCUENTA.ClearControls;
begin
  edGC_ID.Clear;
  edGC_NOMBRE.Clear;
  edGC_CUIT.Clear;

  // Habilito el control
  edGC_NOMBRE.Color    := clWindow;
  edGC_NOMBRE.ReadOnly := False;

  fraDomicilio.Clear;
  edGC_CODAREATELEFONOS.Clear;
  edGC_TELEFONOS.Clear;
  edInternoTel.Clear;
  edGC_CODAREAFAX.Clear;
  edGC_FAX.Clear;
  edGC_DIRELECTRONICA.Clear;
  fraUsuariosGestor.Clear;
  fraRetGanancias.Clear;
  fraSituacionIVA.Clear;
  fraEstudioAsociado.Clear;
  edFechaRevision.Clear;
end;

function TfrmManAGC_GESTORCUENTA.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('gc_id',    sdqConsulta.FieldByName('gc_id').AsInteger);
    Sql.Fields.Add('gc_fechabaja', exDateTime);
    Sql.Fields.Add('gc_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('gc_id', 'AFI.SEQ_AGC_ID.NEXTVAL');
      Sql.Fields.Add('gc_fechaalta',        exDateTime);
      Sql.Fields.Add('gc_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('gc_id',     sdqConsulta.FieldByName('gc_id').AsInteger);
      Sql.Fields.Add('gc_fechamodif', exDateTime);
      Sql.Fields.Add('gc_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('gc_cuit',   edGC_CUIT.Text);
    Sql.Fields.Add('gc_nombre', edGC_NOMBRE.Text);

    with fraDomicilio do
    begin
      Sql.Fields.Add('gc_cpostal',      CodigoPostal);
      Sql.Fields.Add('gc_calle',        Calle);
      Sql.Fields.Add('gc_localidad',    Localidad);

      sSql :=
        'SELECT pv_codigo' +
         ' FROM cpv_provincias' +
        ' WHERE pv_descripcion = :provincia';
      Sql.Fields.Add('gc_provincia', ValorSqlEx(sSql, [Provincia]), dtString);

      Sql.Fields.Add('gc_numero',       Numero);
      Sql.Fields.Add('gc_piso',         Piso);
      Sql.Fields.Add('gc_departamento', Departamento);
      Sql.Fields.Add('gc_cpostala',     CPA);
    end;

    Sql.Fields.Add('gc_codareatelefonos', edGC_CODAREATELEFONOS.Text);
    Sql.Fields.Add('gc_telefonos',        String(edGC_TELEFONOS.Text + IIF(edInternoTel.Text = '', '', ' Int ' + edInternoTel.Text)));
    Sql.Fields.Add('gc_codareafax',       edGC_CODAREAFAX.Text);
    Sql.Fields.Add('gc_fax',              edGC_FAX.Text);
    Sql.Fields.Add('gc_direlectronica',   edGC_DIRELECTRONICA.Text);

    if EsEStudio then
    begin
      Sql.Fields.Add('gc_iva',               fraSituacionIVA.Value);
      Sql.Fields.Add('gc_ganancias',         fraRetGanancias.Value);
      Sql.Fields.Add('gc_idestudioasociado', fraEstudioAsociado.Value);
      Sql.Fields.Add('gc_fecharevision',     edFechaRevision.Date);
    end
    else
      Sql.Fields.Add('gc_usuario', fraUsuariosGestor.Value);

    Sql.Fields.Add('gc_estudio', String(IIF(EsEstudio, 'S', 'N')));
  end;

   Result := inherited DoABM;
end;

procedure TfrmManAGC_GESTORCUENTA.LoadControls;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    edGC_ID.Text     := FieldByName('gc_id').AsString;
    edGC_NOMBRE.Text := FieldByName('gc_nombre').AsString;
    edGC_CUIT.Text   := FieldByName('gc_cuit').AsString;

    // Inhabilito el control
    edGC_NOMBRE.Color    := clBtnFace;
    edGC_NOMBRE.ReadOnly := True;

    with fraDomicilio do
    begin
      Numero       := FieldByName('gc_numero').AsString;
      Piso         := FieldByName('gc_piso').AsString;
      Departamento := FieldByName('gc_departamento').AsString;
      CPA          := FieldByName('gc_cpostala').AsString;
      CodigoPostal := FieldByName('gc_cpostal').AsString;
      Calle        := FieldByName('gc_calle').AsString;
      Localidad    := FieldByName('gc_localidad').AsString;

      if FieldByName('GC_PROVINCIA').AsString <> '' then
      begin
        sSql :=
          'SELECT pv_descripcion' +
           ' FROM cpv_provincias' +
          ' WHERE pv_codigo = :provincia';
        Provincia := ValorSqlEx(sSql, [FieldByName('gc_provincia').AsString]);
      end;
    end;

    edGC_CODAREATELEFONOS.Text := FieldByName('gc_codareatelefonos').AsString;
    edGC_TELEFONOS.Text        := FieldByName('telefonos').AsString;
    edInternoTel.Text          := FieldByName('interno').AsString;
    edGC_CODAREAFAX.Text       := FieldByName('gc_codareafax').AsString;
    edGC_FAX.Text              := FieldByName('gc_fax').AsString;
    edGC_DIRELECTRONICA.Text   := FieldByName('gc_direlectronica').AsString;

    if EsEStudio then
    begin
      fraSituacionIVA.Value     := FieldByName('gc_iva').AsString;
      fraRetGanancias.Value     := FieldByName('gc_ganancias').AsString;
      fraEstudioAsociado.Value  := FieldByName('gc_idestudioasociado').AsInteger;
      edFechaRevision.Date      := FieldByName('gc_fecharevision').AsDateTime;
    end
    else
      fraUsuariosGestor.Value := FieldByName('gc_usuario').AsString;
  end;
end;

function TfrmManAGC_GESTORCUENTA.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  Verificar((Trim(edGC_NOMBRE.Text) = ''), edGC_NOMBRE, 'El nombre es obligatorio.');
  Verificar((edGC_CUIT.Text <> '') and (not IsCuit(edGC_CUIT.Text)), edGC_CUIT, 'La C.U.I.T. es incorrecta.');
  Verificar((Trim(edGC_DIRELECTRONICA.Text) <> '') and not IsEMail(edGC_DIRELECTRONICA.Text), edGC_DIRELECTRONICA, 'El e-Mail es incorrecto.');

  // Valido UK Usuario
  if fraUsuariosGestor.IsSelected then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM agc_gestorcuenta' +
      ' WHERE gc_usuario = :usuario';

    if ModoABM = maModificacion then
      sSql := sSql + ' AND gc_id <> ' + SqlValue(sdqConsulta.FieldByName('gc_id').AsInteger);

    if ExisteSqlEx(sSql, [fraUsuariosGestor.Value]) then
    begin
      InvalidMsg(fraUsuariosGestor.edCodigo, 'El usuario seleccionado ya se encuentra asignado a otro gestor.');
      Exit;
    end;
  end;

  Verificar(fraSituacionIVA.Visible and fraSituacionIVA.IsEmpty, fraSituacionIVA, 'Debe indicar la condición de IVA.');
  Verificar(edFechaRevision.Visible and not edFechaRevision.IsEmpty and (edFechaRevision.Date > DBDate()), edFechaRevision, 'La Fecha de Revisión no puede ser posterior a la fecha actual.');

  Result := fraDomicilio.IsValid;
end;

procedure TfrmManAGC_GESTORCUENTA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuManGestorDeCuenta.Enabled := True;
end;

procedure TfrmManAGC_GESTORCUENTA.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;

procedure TfrmManAGC_GESTORCUENTA.FormCreate(Sender: TObject);
begin
  inherited;

  FEsEstudio := False;

  Sql.TableName := 'agc_gestorcuenta';
  FieldBaja     := 'gc_fechabaja';

  with fraEstudioAsociado do
  begin
    TableName      := 'agc_gestorcuenta';
    FieldID        := 'gc_id';
    FieldCodigo    := 'gc_id';
    FieldDesc      := 'gc_nombre';
    FieldBaja      := 'gc_fechabaja';
    ExtraCondition := 'AND gc_estudio = ''S''';
    ShowBajas      := False;
  end;

  with fraSituacionIVA do
  begin
    Clave    := 'SIVA';
    OnChange := fraSituacionIVAChange;
  end;

  fraRetGanancias.Clave:= 'RETGA';
end;

procedure TfrmManAGC_GESTORCUENTA.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbComision.Enabled := False;//DataSource.DataSet.Active and (not DataSource.DataSet.IsEmpty);
end;

procedure TfrmManAGC_GESTORCUENTA.tbComisionClick(Sender: TObject);
begin
  with TfrmComisionGestor.Create(Self) do
  try
    IdGestor := sdqConsulta.FieldByName('gc_id').AsInteger;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmManAGC_GESTORCUENTA.SetEsEstudio(const Value: Boolean);
var
  sTit: String;
begin
  FEsEstudio := Value;

  sTit := 'Mantenimiento de ';
  if FEsEstudio then
    sTit := sTit + 'Estudios'
  else
    sTit := sTit + 'Gestores de Cuentas';
  Caption := sTit;

  fraUsuariosGestor.Visible   := not FEsEstudio;
  lblUsuario.Visible          := not FEsEstudio;
  lblEstudioAsoc.Visible      := FEsEstudio;
  fraEstudioAsociado.Visible  := FEsEstudio;
  edFechaRevision.Visible     := FEsEstudio;
  lblFRevision.Visible        := FEsEstudio;
  fraRetGanancias.Visible     := FEsEstudio;
  lblRetGanancias.Visible     := FEsEstudio;
  fraSituacionIVA.Visible     := FEsEstudio;
  lblSituacionIVA.Visible     := FEsEstudio;
  btnCuentasBancarias.Visible := FEsEstudio;

  Grid.ColumnByField['se_nombre'].Visible       := not FEsEstudio;
  Grid.ColumnByField['gc_iva'].Visible          := FEsEstudio;
  Grid.ColumnByField['estudioasociado'].Visible := FEsEstudio;

  SortDialog.SortFields.Clear;
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);

  tbRefrescarClick(nil);
end;

procedure TfrmManAGC_GESTORCUENTA.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT gestcuenta.gc_id, gestcuenta.gc_cuit, gestcuenta.gc_nombre, gestcuenta.gc_provincia, gestcuenta.gc_calle,' +
          ' gestcuenta.gc_localidad, gestcuenta.gc_cpostal, pv_descripcion, gestcuenta.gc_numero, gestcuenta.gc_piso,' +
          ' gestcuenta.gc_departamento, gestcuenta.gc_cpostala, gestcuenta.gc_codareatelefonos,' +
          ' gestcuenta.gc_telefonos, gestcuenta.gc_codareafax, gestcuenta.gc_fax, gestcuenta.gc_fechabaja,' +
          ' gestcuenta.gc_usuario, gestcuenta.gc_direlectronica, se_nombre, gestcuenta.gc_estudio, gestcuenta.gc_iva,' +
          ' gestcuenta.gc_idestudioasociado, est_asociado.gc_nombre estudioasociado,' +
          ' DECODE(INSTR(UPPER(gestcuenta.gc_telefonos), '' INT ''),' +
                 ' 0, gestcuenta.gc_telefonos,' +
                 ' SUBSTR(gestcuenta.gc_telefonos, 1, INSTR(UPPER(gestcuenta.gc_telefonos), '' INT ''))) telefonos,' +
          ' DECODE(INSTR(UPPER(gestcuenta.gc_telefonos), '' INT ''),' +
                 ' 0, '''',' +
                 ' SUBSTR(gestcuenta.gc_telefonos, INSTR(UPPER(gestcuenta.gc_telefonos), '' INT '') + 5)) interno,' +
          ' gestcuenta.gc_ganancias, gestcuenta.gc_fecharevision' +
     ' FROM afi.agc_gestorcuenta est_asociado, afi.agc_gestorcuenta gestcuenta, cpv_provincias, use_usuarios' +
    ' WHERE pv_codigo(+) = gestcuenta.gc_provincia' +
      ' AND gestcuenta.gc_usuario = se_usuario(+)' +
      ' AND gestcuenta.gc_estudio = ' + SqlValue(String(IIF(EsEstudio, 'S', 'N'))) +
      ' AND gestcuenta.gc_idestudioasociado = est_asociado.gc_id(+)';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManAGC_GESTORCUENTA.btnCuentasBancariasClick(Sender: TObject);
var
  bSoloOtrosBancos: Boolean;
begin
  if not sdqConsulta.Eof and edGC_ID.ReadOnly then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle        := fsNormal;
      bSoloOtrosBancos := EsEstudio;

      Execute('EJ', Self.sdqConsulta.FieldByName('gc_id').AsInteger, edGC_CUIT.Text, bSoloOtrosBancos);
    end
  else
    MsgBox('No ha seleccionado ningún acreedor.');
end;

procedure TfrmManAGC_GESTORCUENTA.fraSituacionIVAChange(Sender: TObject);
begin
  if fraSituacionIVA.Codigo = '4' then         // Monotributista
  begin
    fraRetGanancias.Value := '99';           // No Retiene
    LockControl(fraRetGanancias, True);
  end
  else if fraSituacionIVA.Codigo = '5' then    // R.Inscripto Factura M
  begin
    fraRetGanancias.Value := '17';           // Factura M
    LockControl(fraRetGanancias, True);
  end
  else
    LockControl(fraRetGanancias,False);
end;

end.
