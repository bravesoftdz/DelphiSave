unit unPermisosUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraUsuarios, StdCtrls, ComCtrls, ImgList, Db, SDEngine, Placemnt,
  artSeguridad, Menus, ExtCtrls, FormPanel, unArtFrame;

type
  TfrmPermisosUsuario = class(TForm)
    Label1: TLabel;
    fraUsuarioMuestra: TfraUsuario;
    tvPermisos: TTreeView;
    ImageList: TImageList;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    pmnuAcciones: TPopupMenu;
    mnuActivar: TMenuItem;
    mnuDesactivar: TMenuItem;
    N1: TMenuItem;
    mnuActivarTodos: TMenuItem;
    mnuDesActivarTodos: TMenuItem;
    pmnuRefrescar: TPopupMenu;
    mnuRefrescar: TMenuItem;
    N2: TMenuItem;
    mnuVerUsuariosHab: TMenuItem;
    mnuVerUsuariosDes: TMenuItem;
    mnuVer: TMenuItem;
    N3: TMenuItem;
    mnuCopiarDeOtroUsuario: TMenuItem;
    fpCopiarPermisos: TFormPanel;
    lbUsuarioCopia: TLabel;
    fraUsuarioCopia: TfraUsuario;
    btnAceptar: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    rgModo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tvPermisosExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvPermisosChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure mnuActivarClick(Sender: TObject);
    procedure mnuDesactivarClick(Sender: TObject);
    procedure mnuActivarTodosClick(Sender: TObject);
    procedure mnuDesActivarTodosClick(Sender: TObject);
    procedure tvPermisosDblClick(Sender: TObject);
    procedure tvPermisosEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure mnuRefrescarClick(Sender: TObject);
    procedure mnuCopiarDeOtroUsuarioClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpCopiarPermisosShow(Sender: TObject);
  private
    bActivar, bDesActivar : Boolean;
  public
    procedure RefreshData;
    procedure AgregarNodos( ANode : TTreeNode; Sql : String; AImageIndex : Integer);
    procedure AgregarControles( ANode : TTreeNode );
  end;

var
  frmPermisosUsuario: TfrmPermisosUsuario;

Const
     IMG_NONE        = -1;
     IMG_APPLICATION = 0;
     IMG_FORM        = 1;
     IMG_ENABLED     = 2;
     IMG_DISABLED    = 3;

implementation

uses unPrincipal, unDmPrincipal, SqlOracle, CustomDlgs, Commctrl;

{$R *.DFM}


{ TfrmPermisosUsuario }

procedure TfrmPermisosUsuario.AgregarNodos(ANode: TTreeNode; Sql: String;  AImageIndex: Integer);
var
  Nodo: TTreeNode;
begin
  tvPermisos.Items.BeginUpdate;
  with GetQuery(Sql) do
  try
    if not IsEmpty then
      repeat
        Nodo := tvPermisos.Items.AddChild(ANode, Fields[0].AsString);
        Nodo.ImageIndex    := AImageIndex;
        Nodo.SelectedIndex := AImageIndex;
        if AImageIndex <> IMG_NONE then
          tvPermisos.Items.AddChild(Nodo, 'VIRTUAL').ImageIndex := IMG_NONE;
        Next;
      until Eof;
  finally
    Free;
  end;
  tvPermisos.Items.EndUpdate;
end;

procedure TfrmPermisosUsuario.RefreshData;
begin
  tvPermisos.Items.Clear;
  AgregarNodos(nil, 'SELECT ''Todas las aplicaciones'' FROM DUAL', IMG_NONE);
  AgregarNodos(tvPermisos.Items[0], 'SELECT DISTINCT SG_APLICACION FROM USG_SEGURIDAD ORDER BY SG_APLICACION', IMG_APPLICATION);
end;

procedure TfrmPermisosUsuario.FormCreate(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmPermisosUsuario.tvPermisosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  Sql : String;
begin
  if Node.HasChildren and (Node.getFirstChild.ImageIndex = IMG_NONE) then
  begin
    if Node.ImageIndex = IMG_APPLICATION then
    begin
      Node.DeleteChildren;
      Sql := 'SELECT DISTINCT SG_FORMULARIO ' +
               'FROM USG_SEGURIDAD ' +
              'WHERE SG_APLICACION = ' + SqlString( Node.Text, True );
      AgregarNodos(Node, Sql, IMG_FORM);
    end
    else if Node.ImageIndex <> IMG_NONE then
      AgregarControles(Node);
  end;
end;

procedure TfrmPermisosUsuario.AgregarControles(ANode: TTreeNode);
var
  Sql      : String;
  sdqDatos : TSDQuery;
  Nodo     : TTreeNode;
begin
  Sql := 'SELECT SG_CONTROL, MAX(SG_USUARIO) FROM ' +
             '( SELECT SG_CONTROL, SG_USUARIO ' +
                 'FROM USG_SEGURIDAD T1 ' +
                'WHERE SG_APLICACION = ''' + ANode.Parent.Text + ''' ' +
                  'AND SG_FORMULARIO = ''' + ANode.Text + ''' ' +
                  'AND SG_USUARIO = ''' + fraUsuarioMuestra.edCodigo.Text + ''' ' +
                'UNION ALL ' +
               'SELECT SG_CONTROL, NULL ' +
                 'FROM USG_SEGURIDAD T1 ' +
                'WHERE SG_APLICACION = ''' + ANode.Parent.Text + ''' ' +
                  'AND SG_FORMULARIO = ''' + ANode.Text + ''' ' +
             ') ' +
  'GROUP BY SG_CONTROL ' +
  'ORDER BY SG_CONTROL ';

  //------------------------------------------------------------------------------------------

  tvPermisos.Items.BeginUpdate;
  ANode.DeleteChildren;
  sdqDatos := GetQuery(Sql);
  try
    if Assigned(sdqDatos) and (not sdqDatos.IsEmpty) then
    repeat
      Nodo := tvPermisos.Items.AddChild( ANode, sdqDatos.Fields[0].AsString );
      if sdqDatos.Fields[1].IsNull then
      begin
        Nodo.ImageIndex    := IMG_ENABLED;
        Nodo.SelectedIndex := IMG_ENABLED;
      end else
      begin
        Nodo.ImageIndex    := IMG_DISABLED;
        Nodo.SelectedIndex := IMG_DISABLED;
      end;

      sdqDatos.Next ;
    until sdqDatos.Eof ;
  finally
    //Nodo := Nil;
    sdqDatos.Free ;
  end;

  tvPermisos.Items.EndUpdate;
end;

procedure TfrmPermisosUsuario.tvPermisosChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
     if Node.ImageIndex > 1 then begin
        tvPermisos.PopupMenu  := pmnuAcciones;
        mnuActivar.Enabled    := bActivar    and (Node.ImageIndex = IMG_DISABLED);
        mnuDesActivar.Enabled := bDesActivar and (Node.ImageIndex = IMG_ENABLED);
     end else
        tvPermisos.PopupMenu  := pmnuRefrescar;
end;

procedure TfrmPermisosUsuario.mnuActivarClick(Sender: TObject);
Var Sql : String;
begin
    if Assigned(tvPermisos.Selected) then
       with tvPermisos.Selected do begin
          Sql := 'DELETE USG_SEGURIDAD ' +
                  'WHERE SG_APLICACION = ''' + Parent.Parent.Text + ''' ' +
                    'AND SG_FORMULARIO = ''' + Parent.Text + ''' ' +
                    'AND SG_CONTROL = ''' + Text + ''' ' +
                    'AND SG_USUARIO = ''' + fraUsuarioMuestra.edCodigo.Text + ''' ';
          Try
             EjecutarSql( Sql );
             ImageIndex    := IMG_ENABLED;
             SelectedIndex := IMG_ENABLED;
             mnuActivar.Enabled    := False;
             mnuDesActivar.Enabled := bDesActivar;
          except
             on E: Exception do ErrorMsg(E);
          end;
       end;
end;

procedure TfrmPermisosUsuario.mnuDesactivarClick(Sender: TObject);
Var Sql : String;
begin
    if Assigned(tvPermisos.Selected) then
       with tvPermisos.Selected do begin
          Sql := 'INSERT INTO USG_SEGURIDAD ' +
                  '(SG_APLICACION, SG_FORMULARIO, SG_CONTROL, SG_USUARIO) VALUES ' +
                  '(''' + Parent.Parent.Text + ''', ''' + Parent.Text + ''',  ''' + Text + ''', ''' + fraUsuarioMuestra.edCodigo.Text + ''')';
          Try
             EjecutarSql( Sql );
             ImageIndex    := IMG_DISABLED;
             SelectedIndex := IMG_DISABLED;
             mnuActivar.Enabled    := bActivar;
             mnuDesActivar.Enabled := False;
          except
             on E: Exception do ErrorMsg(E);
          end;
       end;
end;

procedure TfrmPermisosUsuario.mnuActivarTodosClick(Sender: TObject);
Var Sql : String;
begin
    if Assigned(tvPermisos.Selected) then
       with tvPermisos.Selected do begin
          Sql := 'DELETE USG_SEGURIDAD ' +
                  'WHERE SG_APLICACION = ''' + Parent.Parent.Text + ''' ' +
                    'AND SG_FORMULARIO = ''' + Parent.Text + ''' ' +
                    'AND SG_CONTROL = ''' + Text + ''' ' ;
          Try
             EjecutarSql( Sql );
             ImageIndex    := IMG_ENABLED;
             SelectedIndex := IMG_ENABLED;
             mnuActivar.Enabled    := False;
             mnuDesActivar.Enabled := bDesActivar;
          except
             on E: Exception do ErrorMsg(E);
          end;
       end;
end;

procedure TfrmPermisosUsuario.mnuDesActivarTodosClick(Sender: TObject);
Var Sql : String;
begin
    if Assigned(tvPermisos.Selected) then
       with tvPermisos.Selected do begin
          Sql := 'INSERT INTO USG_SEGURIDAD ' +
                 'SELECT ''' + Parent.Parent.Text + ''', ''' + Parent.Text + ''',  ''' + Text + ''', SE_USUARIO ' +
                   'FROM USE_USUARIOS ' +
                  'WHERE NOT EXISTS ( SELECT 1 FROM USG_SEGURIDAD ' +
                                      'WHERE SG_APLICACION = ''' + Parent.Parent.Text + ''' ' +
                                        'AND SG_FORMULARIO = ''' + Parent.Text + ''' ' +
                                        'AND SG_CONTROL = ''' + Text + ''' ' +
                                        'AND SG_USUARIO = SE_USUARIO)'  ;
          Try
             EjecutarSql( Sql );
             ImageIndex    := IMG_DISABLED;
             SelectedIndex := IMG_DISABLED;
             mnuActivar.Enabled    := bActivar;
             mnuDesActivar.Enabled := False;
          except
             on E: Exception do ErrorMsg(E);
          end;
       end;
end;

procedure TfrmPermisosUsuario.tvPermisosDblClick(Sender: TObject);
var
  HitTest: TTVHitTestInfo;
  FPoint  : TPoint;
begin
    if Assigned(tvPermisos.Selected) then begin
       GetCursorPos(FPoint);
       HitTest.pt := tvPermisos.ScreenToClient(FPoint);

       // Si hace Doble Click sobre la Imagen del Nodo Seleccionado
       if (TreeView_HitTest(tvPermisos.Handle, HitTest) <> nil)
          and (tvPermisos.Selected = tvPermisos.Items.GetNode(HitTest.hItem))
          and (HitTest.flags and TVHT_ONITEMICON = TVHT_ONITEMICON) then begin

           // Activa o desactiva el control, según corresponda
           if (tvPermisos.Selected.ImageIndex = IMG_DISABLED) and mnuActivar.Enabled then
              mnuActivarClick( Nil )
           else if (tvPermisos.Selected.ImageIndex = IMG_ENABLED) and mnuDesactivar.Enabled then
              mnuDesactivarClick( Nil );
       end;
    end;
end;

procedure TfrmPermisosUsuario.tvPermisosEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TfrmPermisosUsuario.SeguridadAfterExecute(Sender: TObject);
begin
  bActivar    := mnuActivar.Enabled ;
  bDesActivar := mnuDesActivar.Enabled ;
end;

procedure TfrmPermisosUsuario.mnuRefrescarClick(Sender: TObject);
begin
  if Assigned(tvPermisos.Selected) then
  begin
    tvPermisos.Items.BeginUpdate;
    tvPermisos.Selected.DeleteChildren;
    tvPermisos.Items.AddChild(tvPermisos.Selected, 'VIRTUAL').ImageIndex := IMG_NONE;
    tvPermisos.Items.EndUpdate;
  end;
end;

procedure TfrmPermisosUsuario.mnuCopiarDeOtroUsuarioClick(Sender: TObject);
var
  Sql      : String;
  SqlWhere, SqlWhere2 : String;
begin
  if fpCopiarPermisos.ShowModal = mrOk then
  begin
    with tvPermisos.Selected do
    begin
      if ImageIndex = IMG_APPLICATION then
        SqlWhere := ' WHERE SG_APLICACION = ' + SQLValue(Text) + ' '
      else if ImageIndex = IMG_FORM then
        SqlWhere := ' WHERE SG_APLICACION = ' + SQLValue(Parent.Text) + ' ' +
                      ' AND SG_FORMULARIO = ' + SQLValue(Text) + ' '
      else
        SqlWhere := ' WHERE 1 = 1 ';

      try
        BeginTrans(True);

        if rgModo.ItemIndex = 1 then
        begin
          SqlWhere2 := ' AND NOT EXISTS(SELECT 1 ' +
                                        ' FROM ART.USG_SEGURIDAD AJENO ' +
                                       ' WHERE AJENO.SG_APLICACION = PROPIO.SG_APLICACION ' +
                                         ' AND AJENO.SG_FORMULARIO = PROPIO.SG_FORMULARIO ' +
                                         ' AND AJENO.SG_CONTROL = PROPIO.SG_CONTROL ' +
                                         ' AND AJENO.SG_USUARIO = ' + SQLValue(fraUsuarioCopia.UserID) + ')';
        end;

        Sql := 'DELETE FROM ART.USG_SEGURIDAD PROPIO ' +
                SqlWhere + SqlWhere2 +
               ' AND SG_USUARIO = ' + SQLValue(fraUsuarioMuestra.edCodigo.Text) + ' ';
        EjecutarSqlST(Sql);

        if rgModo.ItemIndex = 0 then
        begin
          Sql := 'INSERT INTO ART.USG_SEGURIDAD ' +
                 'SELECT SG_APLICACION, SG_FORMULARIO, SG_CONTROL, ' + SQLValue(fraUsuarioMuestra.UserID) + ' SG_USUARIO ' +
                   'FROM ART.USG_SEGURIDAD AJENO ' + SqlWhere +
                    'AND SG_USUARIO =  ' + SQLValue(fraUsuarioCopia.edCodigo.Text) + ' ' ;

          EjecutarSqlST(Sql);
        end;                   

        CommitTrans(True);
      except
        on E: Exception do
        begin
          Rollback;
          ErrorMsg(E, 'Error al Copiar los permisos del usuario.');
        end;
      end;
    end;
    mnuRefrescarClick(nil);
  end;
end;

procedure TfrmPermisosUsuario.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraUsuarioCopia.IsEmpty, fraUsuarioCopia.edCodigo, 'Debe seleccionar un usuario.');
  fpCopiarPermisos.ModalResult := mrOk;
end;

procedure TfrmPermisosUsuario.fpCopiarPermisosShow(Sender: TObject);
begin
  rgModo.ItemIndex := 0;
end;

end.
