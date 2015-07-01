unit unABMUsugrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  ImgList, StdCtrls, CheckCombo, DBCheckCombo, FormPanel, AnsiSQL,
  customDLGs, Mask, PatternEdit, ComboEditor, unArtFrame, unfraUsuarios,
  unFraCodigoDescripcion, unfraCtbTablas, unArtDBAwareFrame, IntEdit;

type
  TfrmUsugrp = class(TfrmCustomConsulta)
    FPAlta: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraUsuarioGrupo: TfraUsuario;
    cbMail: TCheckBox;
    Label1: TLabel;
    cbResponsable: TCheckBox;
    fraTipoUsuario: TfraCtbTablas;
    Label2: TLabel;
    Label3: TLabel;
    Bevel5: TBevel;
    edCoeficiente: TIntEdit;
    cbGBA: TCheckBox;
    Panel1: TPanel;
    chkVerBajas: TCheckBox;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    pbEsAlta: Boolean;
    function Validar: Boolean;
  public
  end;

var
  frmUsugrp: TfrmUsugrp;

implementation

uses unDmPrincipal, VCLExtra, unSesion, unTercerizadoras;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.tbNuevoClick(Sender: TObject);
begin
  fraUsuarioGrupo.Limpiar;
  fraTipoUsuario.Limpiar;
  edCoeficiente.Clear;
  VCLExtra.LockControl(fraUsuarioGrupo, False);
  cbMail.Checked        := False;
  cbResponsable.Checked := False;
  cbGBA.Checked         := False;
  pbEsAlta              := True;
  FPAlta.Caption        := 'Agregar usuario al grupo';
  FPAlta.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.tbModificarClick(Sender: TObject);
begin
  fraUsuarioGrupo.Cargar(sdqConsulta.FieldByName('UG_USUARIO').AsString);
  fraTipoUsuario.Cargar(sdqConsulta.FieldByName('UG_TIPOUSUARIO').AsString);
  VCLExtra.LockControl(fraUsuarioGrupo, True);
  cbMail.Checked          := (sdqConsulta.FieldByName('UG_EMAIL').AsString = 'S');
  cbResponsable.Checked   := (sdqConsulta.FieldByName('UG_RESPONSABLE').AsString = 'S');
  cbGBA.Checked           := (sdqConsulta.FieldByName('UG_SOLOGBA').AsString = 'S');
  edCoeficiente.Value     := sdqConsulta.FieldByName('UG_COEFICIENTE').AsInteger;
  pbEsAlta                := False;
  FPAlta.Caption          := 'Modificar usuario del grupo';
  FPAlta.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.btnAceptarClick(Sender: TObject);
var
  SQL:TSQL;
  SSQL:String;
begin
  if Validar then
  begin
    BeginTrans;
    try
      SQL:=TSql.Create;
      try
        SQL.TableName := 'ART.MUG_USUARIOGRUPOTRABAJO';
        SQL.Fields.Add('UG_USUARIO', fraUsuarioGrupo.edCodigo.Text);
        SQL.Fields.Add('UG_GRUPO', sdqConsulta.ParamByName('pgtrabajo').asstring, false);
        SQL.Fields.Add('UG_EMAIL', cbMail.Checked);
        SQL.Fields.Add('UG_RESPONSABLE', cbResponsable.Checked);
        SQL.Fields.Add('UG_TIPOUSUARIO', fraTipoUsuario.edCodigo.Text);
        SQL.Fields.Add('UG_SOLOGBA', cbGBA.Checked);
        SQL.Fields.Add('UG_COEFICIENTE', edCoeficiente.Value);
        if pbEsAlta then    // Es Alta
        begin
          SQL.PrimaryKey.Add('UG_ID', 'SEQ_MUG_ID.NEXTVAL', false);
          SQL.Fields.Add('UG_FECHAALTA', 'ACTUALDATE', false);
          SQL.Fields.Add('UG_USUALTA', Sesion.UserID, True);
          SSQL:= SQL.InsertSql;
        end
        else begin   // Es Modificación
          if not sdqConsulta.FieldByName('UG_FECHABAJA').IsNull then    // Si esta dado de baja, entonces lo reactiva  TK
          begin
            SQL.Fields.Add('UG_FECHABAJA', 'NULL', false);
            SQL.Fields.Add('UG_USUBAJA', 'NULL', false);
          end;
          SQL.PrimaryKey.Add('UG_ID', sdqConsulta.FieldByName('UG_ID').AsInteger, false);
          SSQL:= SQL.UpdateSql;
        end;
        EjecutarSqlST(SSQL);
      finally
        SQL.Free;
      end;
      tbRefrescarClick(nil);
      CommitTrans;
      fpalta.close;

    except
      on E: exception do begin
        Rollback;
        msgbox ('Ha ocurrido un error al grabar el usuario del grupo de trabajo' + #13 + E.Message);
        raise;
      end;
    end;

  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  BeginTrans;
  sSql :='UPDATE art.mug_usuariogrupotrabajo ' +
           ' SET ug_fechabaja = actualdate, ' +
               ' ug_usubaja = ' + SqlValue(Sesion.UserID) +
         ' WHERE ug_id = ' + SqlValue(sdqconsulta.fieldbyname('ug_id').AsInteger);
  try
    EjecutarSqlST(sSql);
    tbRefrescarClick(nil);
    CommitTrans;
  except
    MsgBox('Ha ocurrido un error y no se puede eliminar el registro');
    Rollback;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                       var Background: TColor; Highlight: Boolean);
begin
  if not sdqconsulta.fieldbyname('ug_fechabaja').isnull then
    afont.Color := clred;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.btnCancelarClick(Sender: TObject);
begin
  fpalta.Close;
end;
{-------------------------------------------------------------------------------}
function TfrmUsugrp.Validar: Boolean;
var
  sSql: String;
begin
  if pbEsAlta then
  begin
    Result := False;
    sSql := 'SELECT 1 ' +
             ' FROM mug_usuariogrupotrabajo ' +
            ' WHERE ug_usuario = ' + SqlValue(fraUsuarioGrupo.edCodigo.Text) +
              ' AND ug_grupo = ' + SqlValue(sdqConsulta.ParamByName('pgtrabajo').AsString) +
              ' AND ug_fechabaja IS NULL';
    if ExisteSql(sSql) then
      InvalidMsg(fraUsuarioGrupo.edCodigo, 'El usuario ya existe en el grupo')
    else
      Result := True;
  end else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.FormCreate(Sender: TObject);
var
  sSectorTerce, sSql: String;
begin
  inherited;
  sSectorTerce := GetSectorTercerizadora;
  if (sSectorTerce <> '') then
    fraUsuarioGrupo.Sector    := sSectorTerce
  else begin
    sSql := 'SELECT sc_codigo ' +
             ' FROM sin.sgt_sectoresgrupotrabajo, usc_sectores ' +
            ' WHERE gt_idsector = sc_id ' +
              ' AND gt_fechabaja IS NULL ' +
              ' AND sc_fechabaja IS NULL ';
    with GetQuery(sSql) do
    try
      while not Eof do
      begin
        sSectorTerce := sSectorTerce + '''' + FieldByName('sc_codigo').AsString + '''' + ',';
        Next;
      end;
    finally
      Free;
    end;
    sSectorTerce := Copy(sSectorTerce, 0, Length(sSectorTerce) - 1);
    fraUsuarioGrupo.Sectores := '(' + sSectorTerce + ')';
  end;
  fraTipoUsuario.Clave      := 'TUSU';
  fraTipoUsuario.ShowBajas  := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmUsugrp.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  sSql := 'SELECT ug_usuario, se_nombre, ug_fechabaja, ug_id, ug_email, ug_responsable, ' +
                ' tb_descripcion tipousuario, ug_tipousuario, ug_sologba, ug_coeficiente ' +
           ' FROM art.use_usuarios, art.mug_usuariogrupotrabajo, art.ctb_tablas ' +
          ' WHERE ug_usuario = se_usuario ' +
            ' AND ug_tipousuario = tb_codigo(+) ' +
            ' AND tb_clave(+) = ''TUSU'' ' +
            ' AND ug_grupo = :pgtrabajo ';

  if not chkVerBajas.Checked then
    sSql := sSql + ' AND ug_fechabaja is null ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

end.

