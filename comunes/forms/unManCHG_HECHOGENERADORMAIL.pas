unit unManCHG_HECHOGENERADORMAIL;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130}Variants, {$ENDIF}Classes,
  Graphics, Controls, Forms,
  Dialogs, unCustomGridABMDetalle, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unfraUsuarios,
  JvExExtCtrls, JvRadioGroup, ImgList, CheckLst, ARTCheckListBox, RxPlacemnt;

type
  TfrmManCHG_HECHOGENERADORMAIL = class(TfrmCustomGridABMDetalle)
    sdqConsultaHG_ID: TFloatField;
    sdqConsultaHG_DESCRIPCION: TStringField;
    sdqConsultaHG_DIRECCION_ADICIONAL: TStringField;
    sdqConsultaHG_CODIGO: TStringField;
    edHG_DESCRIPCION: TEdit;
    Label1: TLabel;
    edHG_CODIGO: TEdit;
    Label2: TLabel;
    edHG_DIRECCION_ADICIONAL: TEdit;
    Label3: TLabel;
    sdqConsultaDetalleHU_ID: TFloatField;
    sdqConsultaDetalleHU_IDHECHOGENERADORMAIL: TFloatField;
    sdqConsultaDetalleHU_USUARIO: TStringField;
    sdqConsultaDetalleHU_MAILEXTERNO: TStringField;
    sdqConsultaDetalleSE_NOMBRE: TStringField;
    rgDestinatario: TJvRadioGroup;
    edHU_MAILEXTERNO: TEdit;
    fraHU_USUARIO: TfraUsuario;
    ilColor: TImageList;
    ilByN: TImageList;
    Label4: TLabel;
    edHG_SQL: TMemo;
    sdqConsultaHG_USUALTA: TStringField;
    sdqConsultaHG_FECHAALTA: TDateTimeField;
    sdqConsultaHG_USUMODIF: TStringField;
    sdqConsultaHG_FECHAMODIF: TDateTimeField;
    sdqConsultaHG_USUBAJA: TStringField;
    sdqConsultaHG_FECHABAJA: TDateTimeField;
    clbUsuariosART: TARTCheckListBox;
    sdqUsuariosART: TSDQuery;
    Panel1: TPanel;
    Label5: TLabel;
    pnlUsuarios: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure rgDestinatarioClick(Sender: TObject);
    procedure clbUsuariosARTClick(Sender: TObject);
  private
    sSQL: string;
  public
    procedure RefreshData; override;
    procedure LoadQueryDetalle; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;

    procedure ClearControlsDetalle; override;
    procedure LoadControlsDetalle; override;
    function  ValidarDetalle : Boolean; override;
    function  DoABMDetalle: Boolean; override;
  end;

var
  frmManCHG_HECHOGENERADORMAIL: TfrmManCHG_HECHOGENERADORMAIL;

implementation

uses
  unCustomConsulta, CustomDlgs, VCLExtra, unCustomGridABM, SqlFuncs,
  unDmPrincipal, unArt, unSesion, unFiltros, General;

{$R *.dfm}

procedure TfrmManCHG_HECHOGENERADORMAIL.RefreshData;
begin
  sdqConsulta.SQL.Text := sSQL + iif(clbUsuariosART.CheckedItems.Count > 0, ' AND EXISTS (SELECT 1 FROM art.use_usuarios, comunes.chu_hechousuario WHERE se_usuario = hu_usuario AND hg_id = hu_idhechogeneradormail(+) ' + clbUsuariosART.InSQL_StringValues('SE_ID', True) + ')', '') + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.FormCreate(Sender: TObject);
begin
  inherited;
  sSQL := sdqConsulta.SQL.Text;
  FieldBaja := 'HG_FECHABAJA';
  clbUsuariosART.SQL := sdqUsuariosART.SQL.Text;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.LoadQueryDetalle;
begin
  sdqConsultaDetalle.Params[0].AsInteger := sdqConsultaHG_ID.AsInteger;
  inherited;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.LoadControls;
begin
  with sdqConsulta do
  begin
    edHG_CODIGO.Text := FieldByName('HG_CODIGO').AsString;
    edHG_DESCRIPCION.Text := FieldByName('HG_DESCRIPCION').AsString;
    edHG_DIRECCION_ADICIONAL.Text := FieldByName('HG_DIRECCION_ADICIONAL').AsString;
//    edHG_SQL.Lines.Text := FieldByName('HG_SQL').AsString;
  end;
  inherited;
end;

function TfrmManCHG_HECHOGENERADORMAIL.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMUNES.CHG_HECHOGENERADORMAIL';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('HG_ID', sdqConsulta.FieldByName('HG_ID').AsInteger, False);
      Sql.SqlType := stUpdate;
      Sql.Fields.Add('HG_FECHABAJA', exDateTime);
      Sql.Fields.Add('HG_USUBAJA', Sesion.UserID);
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('HG_ID', ValorSQLInteger('SELECT MAX(HG_ID) + 1 FROM COMUNES.CHG_HECHOGENERADORMAIL'), False);
          Sql.Fields.Add('HG_FECHAALTA', exDateTime);
          Sql.Fields.Add('HG_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('HG_ID', sdqConsulta.FieldByName('HG_ID').AsInteger, False);
          Sql.Fields.Add('HG_FECHAMODIF', exDateTime);
          Sql.Fields.Add('HG_USUMODIF', Sesion.UserID);
          Sql.SqlType := stUpdate;
        end;


      Sql.Fields.Add('HG_CODIGO',              edHG_CODIGO.Text);
      Sql.Fields.Add('HG_DESCRIPCION',         edHG_DESCRIPCION.Text);
      Sql.Fields.Add('HG_DIRECCION_ADICIONAL', edHG_DIRECCION_ADICIONAL.Text);
//      Sql.Fields.Add('HG_SQL',                 edHG_SQL.Lines.Text);
    end;

    Result := inherited DoABM;
  except
    on E:Exception do
      Raise Exception.Create( E.Message + CRLF + 'Error al grabar el hecho.' );
  end;
end;

function TfrmManCHG_HECHOGENERADORMAIL.Validar: Boolean;
begin
  Verificar(edHG_CODIGO.Text = EmptyStr, edHG_CODIGO, 'Debe completar el código.');
  Verificar(edHG_DESCRIPCION.Text = EmptyStr, edHG_DESCRIPCION, 'Debe completar la descripción.');
  Result := True;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.ClearControlsDetalle;
begin
  fraHU_USUARIO.Limpiar;
  edHU_MAILEXTERNO.Clear;
  rgDestinatario.ItemIndex := 0;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.LoadControlsDetalle;
begin
  with sdqConsultaDetalle do
  begin
    fraHU_USUARIO.Cargar(FieldByName('HU_USUARIO').AsString);
    edHU_MAILEXTERNO.Text := FieldByName('HU_MAILEXTERNO').AsString;

    if FieldByName('HU_USUARIO').IsNull then
      rgDestinatario.ItemIndex := 1
    else
      rgDestinatario.ItemIndex := 0;
  end;
end;

function TfrmManCHG_HECHOGENERADORMAIL.ValidarDetalle: Boolean;
begin
  Verificar((rgDestinatario.ItemIndex = 1) and (edHU_MAILEXTERNO.Text = EmptyStr), edHU_MAILEXTERNO, 'Debe completar la dirección de correo.');
  Verificar((rgDestinatario.ItemIndex = 0) and (fraHU_USUARIO.IsEmpty), fraHU_USUARIO.edCodigo, 'Debe completar el usuario.');
  Result := True;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.rgDestinatarioClick(Sender: TObject);
begin
  if rgDestinatario.ItemIndex = 1 then
  begin
    VclExtra.LockControl(fraHU_USUARIO, True);
    VclExtra.LockControl(edHU_MAILEXTERNO, False);
    fraHU_USUARIO.Limpiar;
  end else
  begin
    VclExtra.LockControl(edHU_MAILEXTERNO, True);
    VclExtra.LockControl(fraHU_USUARIO, False);
    edHU_MAILEXTERNO.Clear;
  end;
end;

function TfrmManCHG_HECHOGENERADORMAIL.DoABMDetalle: Boolean;
begin
  with SqlDetalle do
  begin
    Clear;
    TableName := 'COMUNES.CHU_HECHOUSUARIO';

    try
      if ModoABMDetalle = maBaja then
      begin
        PrimaryKey.Add('HU_ID', sdqConsultaDetalle.FieldByName('HU_ID').AsInteger, False);
        SqlType := stDelete;
      end else
      begin
        if ModoABMDetalle = maAlta then
          begin
            PrimaryKey.Add('HU_ID', ValorSQLInteger('SELECT MAX(HU_ID) + 1 FROM COMUNES.CHU_HECHOUSUARIO'), False);
  {
            Fields.Add('SE_FECHAALTA', exDateTime);
            Fields.Add('SE_USUALTA', Sesion.UserID);
  }
            SqlType := stInsert;
          end
        else if ModoABMDetalle = maModificacion then
          begin
            PrimaryKey.Add('HU_ID', sdqConsultaDetalle.FieldByName('HU_ID').AsInteger, False);
  {
            Fields.Add('SE_FECHAMODIF', exDateTime);
            Fields.Add('SE_USUMODIF', Sesion.UserID);
  }
            SqlType := stUpdate;
          end;


        Fields.Add('HU_IDHECHOGENERADORMAIL', sdqConsultaHG_ID.AsInteger);
        Fields.Add('HU_USUARIO',              fraHU_USUARIO.edCodigo.Text);
        Fields.Add('HU_MAILEXTERNO',          edHU_MAILEXTERNO.Text);
      end;

      BeginTrans(True);
      Result := inherited DoABMDetalle;
      CommitTrans(True);
    except
      on E:Exception do
      begin
        Rollback(True);
        Raise Exception.Create( E.Message + CRLF + 'Error al grabar los usuarios.' );
      end;
    end;
  end;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.ClearControls;
begin
  edHG_CODIGO.Clear;
  edHG_DESCRIPCION.Clear;
  edHG_DIRECCION_ADICIONAL.Clear;
  edHG_SQL.Lines.Clear;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.clbUsuariosARTClick(Sender: TObject);
begin
  pnlUsuarios.Caption := clbUsuariosART.ItemsChecked.CommaText;
end;

procedure TfrmManCHG_HECHOGENERADORMAIL.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
  pnlUsuarios.Caption := '';
end;

end.
