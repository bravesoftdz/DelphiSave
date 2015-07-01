unit unManCtbTablas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, unArtFrame,
  unFraCodigoDescripcion, StdCtrls, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, unArt, PatternEdit, Menus, Mask;

type
  TfrmManCtbTablas = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TPatternEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    lbEspecial: TLabel;
    edEspecial: TEdit;
    lbEspecial2: TLabel;
    edEspecial2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAllowCero: Boolean;
    FAllowModify: Boolean;
    FAllowModifyPK: Boolean;
    FClave: TCtbClave;
    FEspecial2Caption: String;
    FEspecial2SN: Boolean;
    FEspecial2Visible: Boolean;
    FEspecialCaption: String;
    FEspecialSN: Boolean;
    FEspecialVisible: Boolean;
    FMenuItem: TMenuItem;
    FModulo: String;
    FShowBajas: Boolean;

    function GetShowBajas: Boolean;
    function GetSqlWhere: String;

    procedure SetAllowCero(const Value: Boolean);
    procedure SetAllowModify(const Value: Boolean);
    procedure SetEspecialCaption(const Value: String);
    procedure SetEspecial2Caption(const Value: String);
    procedure SetEspecialSN(const Value: Boolean);
    procedure SetEspecial2SN(const Value: Boolean);
  protected
    function DoABM: Boolean; override;
    function GetSql: String; virtual;
    function IsBaja: Boolean; override;
    function Validar: Boolean; override;

    procedure SetClave(const Value: TCtbClave); virtual;
    procedure SetEspecialVisible(const Value: Boolean); virtual;
    procedure SetEspecial2Visible(const Value: Boolean); virtual;
    procedure SetModulo(const Value: String); virtual;

    procedure ClearControls; override;
    procedure DoABMAddFields; virtual;
    procedure LoadControls; override;
    procedure LockControls(ALocked: Boolean = True); override;
  public
  published
    property AllowCero       : Boolean   read FAllowCero        write SetAllowCero        default False;
    property AllowModifyPK   : Boolean   read FAllowModifyPK    write FAllowModifyPK      default False;
    property AllowModify     : Boolean   read FAllowModify      write SetAllowModify      default False;
    property Clave           : TCtbClave read FClave            write SetClave;
    property Modulo          : String    read FModulo           write SetModulo;
    property Especial2Caption: String    read FEspecial2Caption write SetEspecial2Caption;
    property Especial2SN     : Boolean   read FEspecial2SN      write SetEspecial2SN      default False;
    property Especial2Visible: Boolean   read FEspecial2Visible write SetEspecial2Visible default False;
    property EspecialCaption : String    read FEspecialCaption  write SetEspecialCaption;
    property EspecialSN      : Boolean   read FEspecialSN       write SetEspecialSN       default False;
    property EspecialVisible : Boolean   read FEspecialVisible  write SetEspecialVisible  default False;
    property MenuItem        : TMenuItem read FMenuItem         write FMenuItem;
    property ShowBajas       : Boolean   read GetShowBajas      write FShowBajas          default True;
  end;

var
  frmManCtbTablas  : TfrmManCtbTablas;
  VALID_CODIGO     : String = 'Debe ingresar el código';
  VALID_DESCRIPCION: String = 'Debe ingresar la Descripción';
  VALID_ESPECIALSN : String = 'Debe ingresar S/N';

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion;

{$R *.DFM}

procedure TfrmManCtbTablas.FormCreate(Sender: TObject);
begin
  inherited;

  SetEspecialVisible(False);
  SetEspecial2Visible(False);

  FAllowModifyPK := False;
  CheckPK        := False;
  AutoLock       := True;
  FEspecialSN    := False;
  FEspecial2SN   := False;
  FAllowModify   := False;
  FAllowCero     := False;
  FShowBajas     := True;
end;

procedure TfrmManCtbTablas.SetClave(const Value: TCtbClave);
begin
  if FClave <> Value then
  begin
    FClave := Value;
    Self.Name := 'frmCustomGridABM_' + Value;
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmManCtbTablas.SetEspecialVisible(const Value: Boolean);
begin
  FEspecialVisible   := Value;
  lbEspecial.Visible := Value;
  edEspecial.Visible := Value;
  FieldHider.SetFieldVisible('tb_especial1', Value);
end;

procedure TfrmManCtbTablas.SetModulo(const Value: String);
begin
  if FModulo <> Value then
  begin
    FModulo := Value;
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmManCtbTablas.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Sql.Text := GetSql + GetSqlWhere;

  sdqConsulta.ParamByName('pclave').AsString  := FClave;
  sdqConsulta.ParamByName('pmodulo').AsString := FModulo;

  inherited;
end;

procedure TfrmManCtbTablas.FSFormShow(Sender: TObject);
begin
  inherited;

  if Assigned(FMenuItem) then
    FMenuItem.Enabled := False;

  Seguridad.Ejecutar;
end;

procedure TfrmManCtbTablas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FMenuItem) then
    FMenuItem.Enabled := True;
end;

procedure TfrmManCtbTablas.ClearControls;
begin
  edCodigo.Text      := '';
  edDescripcion.Text := '';
  edEspecial.Text    := '';
  edEspecial2.Text   := '';
end;

function TfrmManCtbTablas.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'ctb_tablas';
  Sql.PrimaryKey.Add('tb_clave', FClave);

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('tb_codigo', sdqConsulta.FieldByName('tb_codigo').AsString);
    Sql.Fields.Add('tb_baja',       SQL_TRUE);
    {$IFDEF ART2}
    Sql.Fields.Add('tb_fechabaja', exDateTime);
    Sql.Fields.Add('tb_usubaja',   Sesion.UserID);
    {$ENDIF}
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('tb_codigo', edCodigo.Text);
      if ExisteSql('SELECT 1 FROM ' + Sql.TableName + ' ' + Sql.Where) then
        raise Exception.Create(MSG_PK_VIOLATED);
      {$IFDEF ART2}
      Sql.PrimaryKey.AddExpression('tb_id', 'SEQ_CTB_ID.NEXTVAL');
      Sql.Fields.Add('tb_fechaalta', exDateTime);
      Sql.Fields.Add('tb_usualta', Sesion.UserID);
      {$ENDIF}
      Sql.SqlType := stInsert;
    end
    else
    begin
      Sql.PrimaryKey.Add('tb_codigo', sdqConsulta.FieldByName('tb_codigo').AsString);
      {$IFDEF ART2}
      Sql.Fields.Add('tb_fechamodif', exDateTime);
      Sql.Fields.Add('tb_usumodif',   Sesion.UserID);
      {$ENDIF}

      if FAllowModifyPK and (ModoABM = maModificacion) then
        Sql.Fields.Add('tb_codigo', edCodigo.Text);
      Sql.SqlType := stUpdate;
    end;

    DoABMAddFields;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManCtbTablas.DoABMAddFields;
begin
  Sql.Fields.Add('tb_descripcion', edDescripcion.Text);
  Sql.Fields.Add('tb_baja',        SQL_FALSE);
  {$IFDEF ART2}
  Sql.Fields.Add('tb_fechabaja',   exNull);
  Sql.Fields.Add('tb_usubaja',     exNull);
  {$ENDIF}

  if FEspecialVisible then
    Sql.Fields.Add('tb_especial1', edEspecial.Text);

  if FEspecial2Visible then
    Sql.Fields.Add('tb_especial2', edEspecial2.Text);
end;

procedure TfrmManCtbTablas.LoadControls;
begin
  with sdqConsulta do
  begin
    edCodigo.Text      := FieldByName('tb_codigo').AsString;
    edDescripcion.Text := FieldByName('tb_descripcion').AsString;
    edEspecial.Text    := FieldByName('tb_especial1').AsString;
    edEspecial2.Text   := FieldByName('tb_especial2').AsString;
  end;
end;

function TfrmManCtbTablas.Validar: Boolean;
begin
  Verificar((edCodigo.Text = ''), edCodigo, VALID_CODIGO);
  Verificar((edDescripcion.Text = ''), edDescripcion, VALID_DESCRIPCION);
  Verificar((EspecialVisible) and (EspecialSN) and (edEspecial.Text <> 'S') and (edEspecial.Text <> 'N'), edEspecial, VALID_ESPECIALSN);
  Verificar((Especial2Visible) and (Especial2SN) and (edEspecial2.Text <> 'S') and (edEspecial2.Text <> 'N'), edEspecial2, VALID_ESPECIALSN);

  Result := True;
end;

procedure TfrmManCtbTablas.LockControls(ALocked: Boolean);
begin
  if ALocked and (not FAllowModifyPK) then
  begin
    edCodigo.Color    := clBtnFace;
    edCodigo.ReadOnly := True;
    edCodigo.TabStop  := False;
  end
  else
  begin
    edCodigo.Color    := clWindow;
    edCodigo.ReadOnly := False;
    edCodigo.TabStop  := True;
  end;
end;

function TfrmManCtbTablas.IsBaja: Boolean;
begin
  Result := sdqConsulta.FieldByName('tb_baja').AsString = SQL_TRUE;
end;

procedure TfrmManCtbTablas.SetEspecialCaption(const Value: String);
var
  Column: TColumn;
begin
  if FEspecialCaption <> Value then
  begin
    FEspecialCaption   := Value;
    lbEspecial.Caption := Value;

    { Busca la Columna, y si no se le cambió el campo, le cambia el título }
    Column := Grid.ColumnByField['tb_especial1'];
    if Assigned(Column) then
      Column.Title.Caption := Value;
  end;
end;

procedure TfrmManCtbTablas.SetEspecialSN(const Value: Boolean);
begin
  if FEspecialSN <> Value then
  begin
    FEspecialSN := Value;

    if FEspecialSN then
      edEspecial.CharCase := ecUpperCase;
  end;
end;

procedure TfrmManCtbTablas.SetAllowModify(const Value: Boolean);
begin
  if FAllowModify <> Value then
    FAllowModify := Value;

  tbModificar.Visible := Value;
end;

function TfrmManCtbTablas.GetSql: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_codigo, tb_descripcion, tb_modulo, tb_especial1, tb_baja, tb_usualta, TRUNC(tb_fechaalta) tb_fechaalta,' +
          ' tb_especial2, tb_fechamodif, tb_usumodif, tb_fechabaja, tb_usubaja' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = :pclave' +
      ' AND (   tb_modulo = :pmodulo' +
           ' OR :pmodulo IS NULL)';

  if not FAllowCero then
    sSql := sSql + 'AND tb_codigo <> ''0'' ';

  Result := sSql;
end;

procedure TfrmManCtbTablas.SetAllowCero(const Value: Boolean);
begin
  if FAllowCero <> Value then
  begin
    FAllowCero := Value;

    tbRefrescarClick(nil);
  end;
end;

function TfrmManCtbTablas.GetShowBajas: Boolean;
begin
  Result := FShowBajas;
end;

function TfrmManCtbTablas.GetSqlWhere: String;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND tb_fechabaja IS NULL ';
end;

procedure TfrmManCtbTablas.SetEspecial2Caption(const Value: String);
var
  Column: TColumn;
begin
  if FEspecial2Caption <> Value then
  begin
    FEspecial2Caption   := Value;
    lbEspecial2.Caption := Value;

    { Busca la Columna, y si no se le cambió el campo, le cambia el título }
    Column := Grid.ColumnByField['tb_especial2'];
    if Assigned(Column) then
      Column.Title.Caption := Value;
  end;
end;

procedure TfrmManCtbTablas.SetEspecial2SN(const Value: Boolean);
begin
  if FEspecial2SN <> Value then
  begin
    FEspecial2SN := Value;

    if FEspecial2SN then
      edEspecial2.CharCase := ecUpperCase;
  end;
end;

procedure TfrmManCtbTablas.SetEspecial2Visible(const Value: Boolean);
begin
  FEspecial2Visible   := Value;
  lbEspecial2.Visible := Value;
  edEspecial2.Visible := Value;
  FieldHider.SetFieldVisible('tb_especial2', Value);
end;

end.
