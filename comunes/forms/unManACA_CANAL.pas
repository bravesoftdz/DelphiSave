unit unManACA_CANAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, StdCtrls, CheckPanel,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, LookupDialog, unArt,
  unArtFrame, unFraCodigoDescripcion, unFraEntidades, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal,
  Variants;

type
  TfrmManACA_CANAL = class(TfrmCustomGridABM)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbUsuarioNuevo: TToolButton;
    tbUsuarioEliminar: TToolButton;
    pnlDatos: TPanel;
    lbDescripcion: TLabel;
    edCA_DESCRIPCION: TEdit;
    sduConsulta: TSDUpdateSQL;
    sdqUsuCanal: TSDQuery;
    dsAreaUsuario: TDataSource;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    ldUsuarios: TLookupDialog;
    chkVendedor: TCheckBox;
    edCodigo: TEdit;
    Label1: TLabel;
    chkCA_TIPO: TCheckBox;
    pgCanal: TPageControl;
    tsUsuarios: TTabSheet;
    GrillaUsuarios: TArtDBGrid;
    tsEntidades: TTabSheet;
    fpEntidad: TFormPanel;
    Bevel1: TBevel;
    btnAceptarEntidad: TButton;
    btnCancelarEntidad: TButton;
    fraEntidad: TfraEntidades;
    Label2: TLabel;
    GrillaEntidades: TArtDBGrid;
    sdqEntidades: TSDQuery;
    dsEntidades: TDataSource;
    fraEN_ID: TfraEntidades;
    Label3: TLabel;
    fraEN_IDCANAL: TfraCanal;
    Label4: TLabel;
    chkMostrarEntidades: TCheckBox;
    chkCA_INCLUYECOPIACOTIZACION: TCheckBox;
    Label5: TLabel;
    edCA_DIRELECTRONICA: TEdit;
    procedure tbUsuarioNuevoClick(Sender: TObject);
    procedure tbUsuarioEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrillaUsuariosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                          Highlight: Boolean);
    procedure btnCancelarEntidadClick(Sender: TObject);
    procedure btnAceptarEntidadClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure CambiaFiltro(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqUsuCanalAfterOpen(DataSet: TDataSet);
    procedure GrillaUsuariosDblClick(Sender: TObject);
  private
    FCanal: TTableId;

    procedure SetCanal(const Value: TTableId);
    procedure ShowMsgResponsables(const aCanalId: Integer);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure AltaEntidadCanal;
    procedure AltaUsuarioCanal;
    procedure ClearControls; override;
    procedure EliminaEntidadCanal;
    procedure EliminaUsuarioCanal;
    procedure LoadControls; override;
  public
    property Canal: TTableId read FCanal write SetCanal;
  end;

var
  frmManACA_CANAL: TfrmManACA_CANAL;

implementation

uses
  unPrincipal, AnsiSql, CustomDlgs, unDmPrincipal, SqlFuncs, VCLExtra, unSesion, Internet, General;

{$R *.DFM}

procedure TfrmManACA_CANAL.tbUsuarioNuevoClick(Sender: TObject);
begin
  if pgCanal.ActivePageIndex = 0 then
    AltaUsuarioCanal
  else if pgCanal.ActivePageIndex = 1 then
    AltaEntidadCanal;
end;

procedure TfrmManACA_CANAL.tbUsuarioEliminarClick(Sender: TObject);
begin
  if pgCanal.ActivePageIndex = 0 then
    EliminaUsuarioCanal
  else if pgCanal.ActivePageIndex = 1 then
    EliminaEntidadCanal;
end;

procedure TfrmManACA_CANAL.SetCanal(const Value: TTableID);
var
  sSql: String;
begin
  if FCanal <> Value then
  begin
    FCanal := Value;

    sSql :=
      'SELECT ca_id, ca_codigo, ca_descripcion, ca_vendedores, ca_tipo, ca_usualta, ca_fechaalta, ca_usumodif,' +
            ' ca_fechamodif, ca_usubaja, ca_fechabaja, ca_direlectronica, ca_incluyecopiacotizacion' +
       ' FROM aca_canal' +
   ' ORDER BY ca_descripcion';
    sdqConsulta.SQL.Text := sSql;
    OpenQuery(sdqConsulta);
  end;
end;

procedure TfrmManACA_CANAL.tbModificarClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.FieldByName('CA_FECHABAJA').IsNull) then
  begin
    MsgBox('No se puede modificar un registro eliminado.');
    Abort;
  end;

  inherited;
end;

procedure TfrmManACA_CANAL.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'CA_FECHABAJA';
  tbRefrescarClick(nil);
  pgCanal.ActivePageIndex := 0;
  fraEN_IDCANAL.FiltraUsuario := False;
  fraEN_IDCANAL.OnChange := CambiaFiltro;
  fraEN_ID.OnChange := CambiaFiltro;
end;

procedure TfrmManACA_CANAL.ClearControls;
begin
  FCanal := GetSecNextVal('SEQ_ACA_ID');
  VCLExtra.LockControls([edCodigo], False);
  edCodigo.Clear;
  edCA_DESCRIPCION.Clear;
  edCA_DIRELECTRONICA.Clear;
  chkCA_INCLUYECOPIACOTIZACION.Checked := False;
  chkVendedor.Checked := False;
  chkCA_TIPO.Checked := False;
  sdqUsuCanal.Close;
  sdqEntidades.Close;
  pgCanal.ActivePageIndex := 0;
end;

function TfrmManACA_CANAL.DoABM: Boolean;
begin
  BeginTrans;
  try
    case ModoABM of
      maAlta:
      begin
        sdqConsulta.Insert;
        sdqConsulta.FieldByName('CA_ID').AsInteger          := FCanal; {Para que no Putee}
        sdqConsulta.FieldByName('CA_USUALTA').AsString      := Sesion.UserID;
        sdqConsulta.FieldByName('CA_FECHAALTA').AsDateTime  := DBDateTime;
      end;
      maModificacion:
      begin
        sdqConsulta.Edit;
        sdqConsulta.FieldByName('CA_USUMODIF').AsString     := Sesion.UserID;
        sdqConsulta.FieldByName('CA_FECHAMODIF').AsDateTime := DBDateTime;
        sdqConsulta.FieldByName('CA_USUBAJA').Value         := Null;
        sdqConsulta.FieldByName('CA_FECHABAJA').Value       := Null;
      end;
      maBaja:
      begin
        sdqConsulta.Edit;
        sdqConsulta.FieldByName('CA_USUBAJA').AsString     := Sesion.UserID;
        sdqConsulta.FieldByName('CA_FECHABAJA').AsDateTime := DBDateTime;
      end;
    end;

    if ModoABM <> maBaja then
    begin
      //NOMBRE DEL CANAL
      sdqConsulta.FieldByName('CA_CODIGO').AsString := edCodigo.Text;
      sdqConsulta.FieldByName('CA_DESCRIPCION').AsString := edCA_DESCRIPCION.Text;

      //DIRECCION DE CORREO ELECTRONICO
      sdqConsulta.FieldByName('CA_DIRELECTRONICA').AsString := edCA_DIRELECTRONICA.Text;

      //INDICA SI EL VENDEDOR ES OBLIGATORIO
      if chkVendedor.Checked then
        sdqConsulta.FieldByName('CA_VENDEDORES').AsString := 'S'
      else
        sdqConsulta.FieldByName('CA_VENDEDORES').AsString := 'N';

      //INDICA SI RECIBE COPIA DEL MAIL DEL RESULTADO DE LA COTIZACION AL CLIENTE
      if chkCA_INCLUYECOPIACOTIZACION.Checked then
        sdqConsulta.FieldByName('CA_INCLUYECOPIACOTIZACION').AsString := 'S'
      else
        sdqConsulta.FieldByName('CA_INCLUYECOPIACOTIZACION').AsString := 'N';
    end;
    sdqConsulta.Post;
    sdqConsulta.ApplyUpdates;
    CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al guardar los datos.');
      sdqConsulta.Cancel;
      Result := False;
    end;
  end;
end;

procedure TfrmManACA_CANAL.LoadControls;
begin
  sdqUsuCanal.Close;
  sdqUsuCanal.ParamByName('CA_ID').Value := sdqConsulta.FieldByName('CA_ID').AsInteger;
  OpenQuery(sdqUsuCanal);

  sdqEntidades.Close;
  sdqEntidades.ParamByName('Canal').Value := sdqConsulta.FieldByName('CA_ID').AsInteger;
  OpenQuery(sdqEntidades);

  FCanal                   := sdqConsulta.FieldByName('CA_ID').AsInteger;
  edCodigo.Text            := sdqConsulta.FieldByName('CA_CODIGO').AsString;
  edCA_DESCRIPCION.Text    := sdqConsulta.FieldByName('CA_DESCRIPCION').AsString;
  edCA_DIRELECTRONICA.Text := sdqConsulta.FieldByName('CA_DIRELECTRONICA').AsString;
  chkVendedor.Checked      := (sdqConsulta.FieldByName('CA_VENDEDORES').AsString = 'S');
  chkCA_TIPO.Checked       := (sdqConsulta.FieldByName('CA_TIPO').AsString = 'B');

  chkCA_INCLUYECOPIACOTIZACION.Checked := (sdqConsulta.FieldByName('CA_INCLUYECOPIACOTIZACION').AsString = 'S');
  VCLExtra.LockControls([edCodigo], True);
  pgCanal.ActivePageIndex := 0;
end;

function TfrmManACA_CANAL.Validar: Boolean;
begin
  Verificar(Trim(edCodigo.Text) = '', edCA_DESCRIPCION, 'El código del canal es obligatorio.');
  Verificar(Trim(edCA_DESCRIPCION.Text) = '', edCA_DESCRIPCION, 'El nombre del canal es obligatorio.');
  Verificar((Trim(edCA_DIRELECTRONICA.Text) > '') and not IsEMail(edCA_DIRELECTRONICA.Text), edCA_DIRELECTRONICA,
            'La dirección de correo electrónico no es válida.');
  Verificar(chkCA_INCLUYECOPIACOTIZACION.Checked and (Trim(edCA_DIRELECTRONICA.Text) = ''), edCA_DIRELECTRONICA,
            'Debe especificar la dirección de correo electrónico si desea que el canal reciba copia del mail de la cotización.');
  Result := True;
end;

procedure TfrmManACA_CANAL.GrillaUsuariosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqUsuCanal.FieldByName('UC_FECHABAJA').AsString > '' then
    AFont.Color := clRed;
end;

procedure TfrmManACA_CANAL.AltaUsuarioCanal;
var
  bEsResponsable: Boolean;
  sSqlTrans: TSql;
  sSql: String;
begin
  if ModoABM = maAlta then
    if MsgAsk('Debe grabar para poder seguir adelante. ¿ Desea hacerlo ?') and Validar and DoAbm then
      ModoABM := maModificacion;

  if ModoABM = maModificacion then
  begin
    OpenQuery(sdqUsuarios);
    if ldUsuarios.Execute(True) then
    begin
      bEsResponsable := MsgAsk(Format('¿ %s es responsable del canal %s ?',
                        [sdqUsuarios.FieldByName('SE_USUARIO').AsString,
                        sdqConsulta.FieldByName('CA_DESCRIPCION').AsString]), 'Confirme');

      sSqlTrans := TSQL.Create('AUC_USUARIOCANAL');
      try
        sSql :=
          ' SELECT 1' +
            ' FROM AUC_USUARIOCANAL' +
           ' WHERE UC_USUARIO = :usuario' +
             ' AND UC_IDCANAL = :idcanal' +
             ' AND UC_FECHABAJA IS NULL';
        if ExisteSqlEx(sSql, [sdqUsuarios.FieldByName('SE_USUARIO').AsString, FCanal]) then
          raise Exception.Create('El usuario ya ha sido dado de alta para este canal.');

        sSqlTrans.PrimaryKey.Add('UC_ID', 	    'SEQ_AUC_ID.NEXTVAL', False);
        sSqlTrans.Fields.Add('UC_USUARIO', 	     sdqUsuarios.FieldByName('SE_USUARIO').AsString);
        sSqlTrans.Fields.Add('UC_IDCANAL', 	     FCanal);
        sSqlTrans.Fields.Add('UC_ESRESPONSABLE', String(IIF(bEsResponsable, 'T', 'F')));
        sSqlTrans.Fields.Add('UC_FECHAALTA',     SQL_DATETIME, False);
        sSqlTrans.Fields.Add('UC_USUALTA', 	     Sesion.UserId);
        sSqlTrans.SqlType := stInsert;
        try
          EjecutarSQL(sSqlTrans.Sql);
          sdqUsuCanal.Close;
          sdqUsuCanal.ParamByName('CA_ID').Value := FCanal;
          OpenQuery(sdqUsuCanal);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al guardar los datos.');
        end;
      finally
        sSqlTrans.Free;
      end;
    end;
    sdqUsuarios.Close;
  end;
end;

procedure TfrmManACA_CANAL.AltaEntidadCanal;
var
  iId: Integer;
  sSql: String;
  sSqlTrans: TSql;
begin
  if ModoABM = maAlta then
    if MsgAsk('Debe grabar para poder seguir adelante. ¿ Desea hacerlo ?') and Validar and DoAbm then
      ModoABM := maModificacion;

  if ModoABM = maModificacion then
  begin
    fraEntidad.Clear;
    if fpEntidad.ShowModal = mrOk then
    begin
      sSql :=
        'SELECT EC_ID' +
         ' FROM XEC_ENTIDADCANAL' +
        ' WHERE EC_IDENTIDAD = :identidad' +
 	        ' AND EC_IDCANAL = :canal';
      iId := ValorSqlIntegerEx(sSql, [fraEntidad.Value, FCanal]);

      sSqlTrans := TSQL.Create('XEC_ENTIDADCANAL');
      try
        if iId > 0 then
        begin
          sSqlTrans.PrimaryKey.Add('EC_ID', 	 iId);
          sSqlTrans.Fields.Add('EC_USUBAJA', 	 ExNull);
          sSqlTrans.Fields.Add('EC_FECHABAJA', ExNull);
          sSqlTrans.SqlType := stUpdate;
        end
        else
        begin
          sSqlTrans.PrimaryKey.Add('EC_ID', 	 GetSecNextVal('SEQ_XEC_ID'));
          sSqlTrans.Fields.Add('EC_IDENTIDAD', fraEntidad.Value);
          sSqlTrans.Fields.Add('EC_IDCANAL', 	 FCanal);
          sSqlTrans.SqlType := stInsert;
        end;
        sSqlTrans.Fields.Add('EC_USUALTA', 	 Sesion.UserId);
        sSqlTrans.Fields.Add('EC_FECHAALTA', SQL_DATETIME, False);

        try
          EjecutarSQL(sSqlTrans.Sql);
          sdqEntidades.Close;
          sdqEntidades.ParamByName('Canal').Value := FCanal;
          OpenQuery(sdqEntidades);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al guardar los datos.');
        end;
      finally
        sSqlTrans.Free;
      end;
    end;
  end;
end;

procedure TfrmManACA_CANAL.btnCancelarEntidadClick(Sender: TObject);
begin
  fpEntidad.ModalResult := mrCancel;
end;

procedure TfrmManACA_CANAL.btnAceptarEntidadClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM XEC_ENTIDADCANAL' +
    ' WHERE EC_IDENTIDAD = :identidad'+
 	    ' AND EC_IDCANAL = :canal' +
   	  ' AND EC_FECHABAJA IS NULL';

	Verificar((ValorSqlIntegerEx(sSql, [fraEntidad.Value, FCanal]) = 1), fraEntidad,
  					Format('Esa entidad ya se encuentra asociada al canal %s.', [edCA_DESCRIPCION.Text]));

  fpEntidad.ModalResult := mrOk;
end;

procedure TfrmManACA_CANAL.EliminaEntidadCanal;
var
  sSqlTrans: TSql;
begin
	if not sdqEntidades.IsEmpty and
  	MsgAsk('Está por dar de baja la pertenencia de la entidad a este canal. ¿ Está seguro de querer continuar ?') then
  begin
    sSqlTrans := TSQL.Create('XEC_ENTIDADCANAL');
    try
      sSqlTrans.PrimaryKey.Add('EC_ID', 	 sdqEntidades.FieldByName('EC_ID').AsInteger);
      sSqlTrans.Fields.Add('EC_FECHABAJA', SQL_DATETIME, False);
      sSqlTrans.Fields.Add('EC_USUBAJA', 	 Sesion.UserId);
      sSqlTrans.SqlType := stUpdate;
      try
        EjecutarSQL(sSqlTrans.Sql);
        sdqEntidades.Close;
        sdqEntidades.ParamByName('Canal').Value := FCanal;
        OpenQuery(sdqEntidades);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar los datos.');
      end;
    finally
      sSqlTrans.Free;
    end;
  end;
end;

procedure TfrmManACA_CANAL.EliminaUsuarioCanal;
var
  sSqlTrans: TSql;
begin
  if (not sdqUsuCanal.IsEmpty) and (sdqUsuCanal.FieldByName('UC_FECHABAJA').AsString = '') and
     MsgAsk('Está por dar de baja este usuario. ¿ Está seguro de querer continuar ?') then
  begin
    sSqlTrans := TSQL.Create('AUC_USUARIOCANAL');
    try
      sSqlTrans.PrimaryKey.Add('UC_ID', 	 sdqUsuCanal.FieldByName('UC_ID').AsInteger);
      sSqlTrans.Fields.Add('UC_FECHABAJA', SQL_DATETIME, False);
      sSqlTrans.Fields.Add('UC_USUBAJA', 	 Sesion.UserId);
      sSqlTrans.SqlType := stUpdate;
      try
        EjecutarSQL(sSqlTrans.Sql);
        sdqUsuCanal.Close;
        sdqUsuCanal.ParamByName('CA_ID').Value := sdqConsulta.FieldByName('CA_ID').AsInteger;
        OpenQuery(sdqUsuCanal);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar los datos.');
      end;
    finally
      sSqlTrans.Free;
    end;
  end;
end;

procedure TfrmManACA_CANAL.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  if fraEN_ID.IsSelected then
    sWhere := ' AND EN_ID = ' + SqlValue(fraEN_ID.Value);
  if fraEN_IDCANAL.IsSelected then
    sWhere := sWhere + ' AND CA_ID = ' + SqlValue(fraEN_IDCANAL.Value);

  if chkMostrarEntidades.Checked then
  begin
    sSql :=
      'SELECT CA_ID, CA_CODIGO, CA_DESCRIPCION, CA_TIPO, CA_VENDEDORES, CA_USUALTA, CA_FECHAALTA, CA_USUMODIF,' +
            ' CA_FECHAMODIF, CA_USUBAJA, CA_FECHABAJA, EN_CODBANCO, EN_NOMBRE, CA_DIRELECTRONICA,' +
            ' CA_INCLUYECOPIACOTIZACION' +
       ' FROM ACA_CANAL, XEC_ENTIDADCANAL, XEN_ENTIDAD' +
      ' WHERE CA_ID = EC_IDCANAL' +
        ' AND EC_IDENTIDAD = EN_ID(+)' +
              sWhere;
  end
  else
  begin
    sSql :=
      'SELECT CA_ID, CA_CODIGO, CA_DESCRIPCION, CA_TIPO, CA_VENDEDORES, CA_USUALTA, CA_FECHAALTA, CA_USUMODIF,' +
            ' CA_FECHAMODIF, CA_USUBAJA, CA_FECHABAJA, CA_DIRELECTRONICA, CA_INCLUYECOPIACOTIZACION' +
       ' FROM ACA_CANAL';
  end;

  sdqConsulta.Sql.Text := sSql;
  inherited;
end;

procedure TfrmManACA_CANAL.CambiaFiltro(Sender: TObject);
begin
  if fraEN_ID.IsSelected or fraEN_IDCANAL.IsSelected then
    chkMostrarEntidades.Checked := True;
end;

procedure TfrmManACA_CANAL.tbLimpiarClick(Sender: TObject);
begin
  fraEN_IDCANAL.Clear;
  fraEN_ID.Clear;
  chkMostrarEntidades.Checked := False;
end;

procedure TfrmManACA_CANAL.ShowMsgResponsables(const aCanalId: Integer);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM auc_usuariocanal' +
    ' WHERE uc_idcanal = ' + SqlValue(aCanalId) +
      ' AND uc_esresponsable = ''T''' +
      ' AND uc_fechabaja IS NULL';
  if not ExisteSql(sSql) then
    InfoHint(GrillaUsuarios, 'Este canal no tiene responsables cargados');
end;

procedure TfrmManACA_CANAL.sdqUsuCanalAfterOpen(DataSet: TDataSet);
begin
  inherited;

  ShowMsgResponsables(sdqUsuCanal.ParamByName('CA_ID').AsInteger);
end;

procedure TfrmManACA_CANAL.GrillaUsuariosDblClick(Sender: TObject);
var
  bEsResponsable: Boolean;
  sSql: String;
begin
  bEsResponsable := MsgAsk(Format('¿ %s es responsable del canal %s ?',
                    [sdqUsuCanal.FieldByName('SE_NOMBRE').AsString,
                    sdqConsulta.FieldByName('CA_DESCRIPCION').AsString]), 'Confirme');

  sSql :=
    'UPDATE auc_usuariocanal' +
      ' SET uc_esresponsable = ' + SqlString(IIF(bEsResponsable, 'T', 'F'), True) +
    ' WHERE uc_id = ' + SqlValue(sdqUsuCanal.FieldByName('UC_ID').AsInteger);
  EjecutarSql(sSql);
  OpenQuery(sdqUsuCanal);
end;

end.
