unit unManUsuariosWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, CheckPanel, Mask,
  PatternEdit, ExComboBox, DBCtrls, ComboEditor, DBComboGrid, CheckCombo,
  DBCheckCombo, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, GroupCheckBox, CheckLst, ARTCheckListBox,
  unfraUsuarios;

type
  TfrmManUsuariosWeb = class(TfrmCustomGridABM)
    cmbTipoUsuario: TExComboBox;
    cmbNivel: TExComboBox;
    edClaveWeb: TPatternEdit;
    cbForzarclave: TCheckBox;
    lblTipoUsuario: TLabel;
    lblUsuarios: TLabel;
    lblUsuario: TLabel;
    lblAbogado: TLabel;
    lblClaveWeb: TLabel;
    lblautorizacion: TLabel;
    lblNivel: TLabel;
    fraAbogado: TfraCodigoDescripcion;
    edUsuario: TPatternEdit;
    clbAutorizacion: TARTCheckListBox;
    fraUsuario: TfraUsuario;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmbTipoUsuarioChange(Sender: TObject);
    procedure clbAutorizacionClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManUsuariosWeb: TfrmManUsuariosWeb;
  cambioautorizacion : boolean;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, SqlOracle,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql;
{$R *.dfm}

{ TfrmCustomGridABM2 }

procedure TfrmManUsuariosWeb.FormCreate(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  FieldBaja := 'NU_FECHABAJA';
  fraUsuario.Showbajas := TRUE;
  sSQL :=
    ' SELECT SE_SECTOR '+
    '   FROM art.use_usuarios '+
    '  WHERE SE_USUARIO = :usuario ';
    with GetQueryEx(sSQL, [Sesion.UserID]) do
    try
        if (Fields[0].AsString = 'COMPUTOS') THEN
        begin
          cmbTipoUsuario.AddItem('I=Interno',nil);
          cmbTipoUsuario.AddItem('E=Externo',nil);
        end
        else
        begin
          cmbTipoUsuario.AddItem('E=Externo',nil);
        end;
    finally
      Free;
    end;

  with fraAbogado do
  begin
    TableName   := 'legales.lbo_abogado';
    FieldID     := 'BO_ID';
    FieldCodigo := 'BO_ID';
    FieldDesc   := 'BO_NOMBRE';
    FieldBaja := 'BO_FECHABAJA';
    Showbajas   := true;
  end;

  Sql.TableName := 'LEGALES.LNU_NIVELUSUARIO';
end;

procedure TfrmManUsuariosWeb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmManUsuariosWeb.ClearControls;
begin
  inherited;
//  fraAbogado.ExtraCondition := ' AND NOT EXISTS (SELECT 1 FROM LEGALES.LNU_NIVELUSUARIO WHERE NU_IDABOGADO = BO_ID ) ';
  cmbTipoUsuario.ItemIndex := -1;
  cmbNivel.ItemIndex := -1;
  fraUsuario.Limpiar;
  fraAbogado.Clear;
  edUsuario.Clear;
  edClaveWeb.Clear;
  VCLExtra.LockControls([fraUsuario, edUsuario, fraAbogado, edClaveWeb, cbForzarclave, cmbNivel, clbAutorizacion], True);
  VCLExtra.LockControls([cmbTipoUsuario], False);
  clbAutorizacion.ClearChecks;
end;

function TfrmManUsuariosWeb.DoABM: Boolean;
var
  SqlUsuarioMenu: TCustomSql;
  i, iIdNivelUsuario: Integer;
begin
  SqlUsuarioMenu := TDBSql.Create('LEGALES.LUM_USUARIOMENU');
  try
    BeginTrans(True);
    try
      Sql.Clear;
      if ModoABM = maBaja Then
      begin
        iIdNivelUsuario := sdqConsulta.FieldByName('NU_ID').AsInteger;
        Sql.Fields.Add('NU_USUBAJA', Sesion.UserID );
        Sql.Fields.Add('NU_FECHABAJA', exDateTime );
        if(sdqConsulta.FieldByName('NU_TIPO').AsString = 'Externo') then
          Sql.Fields.Add('NU_TIPO', 'E')
        else
          Sql.Fields.Add('NU_TIPO', 'I');
        Sql.SqlType := stUpdate;
      end else begin
        Sql.Fields.Add('NU_TIPO', cmbTipoUsuario.Value);
        if (cmbTipoUsuario.Value = 'I') then
        begin
          Sql.Fields.Add('NU_USUARIO', fraUsuario.UserID);
          Sql.Fields.Add('NU_IDNIVELSEGURIDAD', cmbNivel.ItemIndex+1 );
        end;
        if (cmbTipoUsuario.Value = 'E') then
        begin
          Sql.Fields.Add('NU_USUARIO', edUsuario.Text);
          Sql.Fields.Add('NU_IDABOGADO',fraAbogado.Codigo);
          Sql.Fields.Add('NU_CLAVEWEB',edClaveWeb.Text);
          if(cbForzarclave.Checked = true) then
            Sql.Fields.Add('NU_FORZARCLAVE','S')
          else
            Sql.Fields.Add('NU_FORZARCLAVE','N');
        end;

        if ModoABM = maAlta Then
        begin
          Sql.SqlType := stInsert;
          iIdNivelUsuario := GetSecNextVal('LEGALES.SEQ_LNU_ID');
          Sql.Fields.Add('NU_USUALTA', Sesion.UserID );
          Sql.Fields.Add('NU_FECHAALTA', exDateTime );
        end else begin
          Sql.SqlType := stUpdate;
          iIdNivelUsuario := sdqConsulta.FieldByName('NU_ID').AsInteger;
          Sql.Fields.Add('NU_USUMODIF', Sesion.UserID);
          Sql.Fields.Add('NU_FECHAMODIF', exDateTime );
          Sql.Fields.Add('NU_USUBAJA', exNull );
          Sql.Fields.Add('NU_FECHABAJA', exNull );
        end;
      end;

      Sql.PrimaryKey.Add('NU_ID', iIdNivelUsuario);

      EjecutarSQLST(Sql.Sql);

      if (cmbTipoUsuario.Value = 'E') and cambioautorizacion then
      begin
        SqlUsuarioMenu.PrimaryKey.Add('UM_IDUSUARIO', iIdNivelUsuario);
        EjecutarSQLST(SqlUsuarioMenu.DeleteSql);
        SqlUsuarioMenu.Clear;

        for i := 0 to clbAutorizacion.ItemsChecked.Count - 1 do
        begin
          SqlUsuarioMenu.Fields.Add('UM_ID', GetSecNextVal('LEGALES.SEQ_LUM_ID'));
          SqlUsuarioMenu.Fields.Add('UM_IDUSUARIO', iIdNivelUsuario);
          SqlUsuarioMenu.Fields.Add('UM_IDMENUWEB', clbAutorizacion.ValuesChecked[i]);
          SqlUsuarioMenu.Fields.Add('UM_FECHAALTA', exDateTime);
          SqlUsuarioMenu.Fields.Add('UM_USUALTA', Sesion.UserID);
          EjecutarSQLST(SqlUsuarioMenu.InsertSql);
          SqlUsuarioMenu.Clear;
        end;
      end;

      CommitTrans(True);
      Result := True;
    except
      Rollback(True);
      Result := False;      
    end;
  finally
    SqlUsuarioMenu.Free;
  end;
end;

procedure TfrmManUsuariosWeb.LoadControls;
var
  sSQL: String;
begin
  inherited;
  ClearControls;
  fraAbogado.ExtraCondition := '';
  VCLExtra.LockControls([cmbTipoUsuario], True);
  if(sdqConsulta.FieldByName('NU_TIPO').AsString = 'Externo') then
  begin
    cmbTipoUsuario.ItemIndex := 1;
    edUsuario.Text := sdqConsulta.fieldbyname('NU_USUARIO').AsString;
    fraAbogado.Codigo := sdqConsulta.fieldbyname('BO_ID').AsString;
    edClaveWeb.Text := sdqconsulta.fieldbyname('NU_CLAVEWEB').AsString;
    if(sdqconsulta.fieldbyname('NU_FORZARCLAVE').AsString = 'N') then
      cbForzarclave.Checked := false;
    if(sdqconsulta.fieldbyname('NU_FORZARCLAVE').AsString = 'S') then
      cbForzarclave.Checked := True;
    VCLExtra.LockControls([clbAutorizacion, edClaveWeb, cbForzarclave], False);

    sSQL := ' SELECT mw_descripcion '+
            '   FROM legales.lum_usuariomenu, legales.lmw_menuweb '+
            '  WHERE um_idmenuweb = mw_id AND um_idusuario = :usuario ';

    with GetQueryEx(sSQL, [sdqConsulta.fieldbyname('NU_ID').AsString]) do
    try
      while not Eof do
      begin
        clbAutorizacion.Check(Fields[0].AsString);
        Next;
      end;
    finally
      Free;
    end;
  end;
  if(sdqConsulta.FieldByName('NU_TIPO').AsString = 'Interno') then
  begin
    cmbTipoUsuario.ItemIndex := 0;
    fraUsuario.Cargar(sdqConsulta.fieldbyname('NU_USUARIO').AsString);
    cmbNivel.ItemIndex := sdqConsulta.fieldbyname('NU_IDNIVELSEGURIDAD').AsInteger -1;

    VCLExtra.LockControls(cmbNivel, Sesion.Sector <> 'COMPUTOS');
  end;
end;

function TfrmManUsuariosWeb.Validar: Boolean;
var
 qry: TSDQuery;
begin
  result := true;
  Verificar(cmbTipoUsuario.ItemIndex < 0,cmbTipoUsuario,'Debe Seleccionar un tipo de usuario');
  if(cmbTipoUsuario.Value = 'E') then
  begin
    Verificar(edUsuario.Text = '',edUsuario, 'Debe tener un Usuario');
    Verificar(fraAbogado.IsEmpty,fraAbogado.edCodigo, 'Debe seleccionar un abogado');
    Verificar(fraAbogado.IsBaja,fraAbogado.edCodigo, 'Debe ser un Abogado que no este dado de baja.');
    Verificar(IsEmptyString(edClaveWeb.Text),edClaveWeb, 'Debe especificar un Usuario.');
    Verificar(Length(edClaveWeb.Text)< 6,edClaveWeb, 'Debe ingresar como mínimo 6 caracteres para la Clave.');
  end;
  if(cmbTipoUsuario.Value = 'I') then
  begin
    Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Debe Seleccionar un Usuario.');
    Verificar(fraUsuario.IsBaja, fraUsuario.edCodigo, 'Debe ser un usuario que no este dado de baja.');
    Verificar(cmbNivel.ItemIndex < 0 , cmbNivel, 'Debe Seleccionar un Nivel.');
  end;

  if ModoABM = maAlta Then
  begin
    if(cmbTipoUsuario.Value = 'E') then
    begin
      qry := GetQueryEx(' SELECT 1 '+
                        '   FROM legales.lnu_nivelusuario '+
                        '  WHERE nu_usuario = :usuario '+
                        '    AND nu_fechabaja IS NULL', [UpperCase(edUsuario.Text)]);
      Verificar( qry.Fields[0].AsString = '1', edUsuario, 'El Usuario ya existe.');
    end;
    if(cmbTipoUsuario.Value = 'I') then
    begin
      qry := GetQueryEx(' SELECT 1 '+
                        '   FROM legales.lnu_nivelusuario '+
                        '  WHERE nu_usuario = :usuario '+
                        '    AND nu_fechabaja IS NULL', [UpperCase(fraUsuario.UserID)]);
      Verificar( qry.Fields[0].AsString = '1',fraUsuario, 'El Usuario ya existe.');
    end;
  end;

end;

procedure TfrmManUsuariosWeb.cmbTipoUsuarioChange(Sender: TObject);
begin
  inherited;
  if(cmbTipoUsuario.Value = 'E') then
  begin
    VCLExtra.LockControls([edUsuario, fraAbogado, edClaveWeb, cbForzarclave, clbAutorizacion], False);
    VCLExtra.LockControls([fraUsuario, cmbNivel], True);
    fraUsuario.Limpiar;
    cmbNivel.ItemIndex := -1;
  end;
  if(cmbTipoUsuario.Value = 'I') then
  begin
    VCLExtra.LockControls([edUsuario, fraAbogado, edClaveWeb, cbForzarclave, clbAutorizacion], True);
    VCLExtra.LockControls([fraUsuario, cmbNivel], False);
    edUsuario.Clear;
    fraAbogado.Clear;
    edclaveWeb.Clear;
  end;
end;

procedure TfrmManUsuariosWeb.clbAutorizacionClick(Sender: TObject);
begin
  inherited;
  cambioautorizacion := true;
end;

end.
