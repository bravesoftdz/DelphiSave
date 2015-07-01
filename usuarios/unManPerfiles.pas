unit unManPerfiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraUsuarios, StdCtrls, ComCtrls, ImgList, Db, SDEngine, Placemnt,
  artSeguridad, Menus, Grids, DBGrids, RXDBCtrl, ToolWin, FormPanel,
  SortDlg, ExtCtrls, PatternEdit, ShortCutControl, unfraPerfiles,
  QueryToFile, ExportDialog, QueryPrint, JvExComCtrls, JvComCtrls,
  unArtFrame, Mask, JvComponent, JvPageListTreeView, unCustomForm,
  XPMenu;

type
  TVentana = Class(TObject)
  public
     Nombre : String;
     destructor Destroy; override;
  end;

  TfrmManPerfiles = class(TfrmCustomForm)
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
    fpPermisos: TFormPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton11: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton5: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    DBGrid: TRxDBGrid;
    fpABM: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TPatternEdit;
    edDescripcion: TEdit;
    Bevel1: TBevel;
    btnABMAceptar: TButton;
    btnABMCancelar: TButton;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    SortDialog: TSortDialog;
    ShortCutControl: TShortCutControl;
    Bevel2: TBevel;
    pmnuNuevos: TPopupMenu;
    mnuNuevoUsuario: TMenuItem;
    mnuCrearCopia: TMenuItem;
    btnPermisos: TButton;
    pnlSeguridad: TPanel;
    fraPerfilesCopia: TfraPerfiles;
    rbCopia: TRadioButton;
    rbHabilitado: TRadioButton;
    rbNegado: TRadioButton;
    Label3: TLabel;
    ExportDialog: TExportDialog;
    tbBuscar: TToolButton;
    ToolButton4: TToolButton;
    fpBusqueda: TFormPanel;
    btnBuscCancelar: TButton;
    btnBuscBuscar: TButton;
    fraPerfilesBusq: TfraPerfiles;
    QueryPrint: TQueryPrint;
    rbPerfil: TRadioButton;
    rbUsuario: TRadioButton;
    fraUsuarioBusq: TfraUsuario;
    Bevel3: TBevel;
    tvPermisos: TTreeView;
    Panel1: TPanel;
    chkBajas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tvPermisosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure tvPermisosChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure mnuActivarClick(Sender: TObject);
    procedure mnuDesactivarClick(Sender: TObject);
    procedure tvPermisosDblClick(Sender: TObject);
    procedure tvPermisosEditing(Sender: TObject; Node: TTreeNode;  var AllowEdit: Boolean);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure mnuRefrescarClick(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure rbSeguridadClick(Sender: TObject);
    procedure btnABMAceptarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure btnPermisosClick(Sender: TObject);
    procedure tvPermisosDeletion(Sender: TObject; Node: TTreeNode);
    procedure fpABMClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuActivarTodosClick(Sender: TObject);
    procedure mnuDesActivarTodosClick(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure rbBusquedaClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure chkBajasClick(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    AVentanas : array of String;
    bActivar, bDesActivar : Boolean;
    ASQLOriginal: string;
    procedure fraUsuarioBusqChange(Sender: TObject);
  public
    procedure AgregarNodos( ANode : TTreeNode; Sql : String; AImageIndex : Integer);
    procedure ActivarNodo( ANode : TTreeNode; AActivar : Boolean );
  end;

var
  frmManPerfiles: TfrmManPerfiles;

implementation

uses unPrincipal, unDmPrincipal, SqlOracle, CustomDlgs, Commctrl, General,
  unSesion, VCLExtra, unGrids, unArt, AnsiSql, SqlFuncs;

{$R *.DFM}


{ TfrmPermisosUsuario }

procedure TfrmManPerfiles.ActivarNodo(ANode: TTreeNode; AActivar: Boolean);
begin
  With ANode do
     if AActivar then begin
        ImageIndex    := 2;
        SelectedIndex := 2;
        mnuActivar.Enabled    := False;
        mnuDesActivar.Enabled := bDesActivar;
     end else begin
        ImageIndex    := 3;
        SelectedIndex := 3;
        mnuActivar.Enabled    := bActivar;
        mnuDesActivar.Enabled := False;
     end;
end;

procedure TfrmManPerfiles.AgregarNodos(ANode: TTreeNode; Sql: String;  AImageIndex: Integer);
var
  sdqDatos : TSDQuery;
  Nodo     : TTreeNode;
  AVentana : TVentana;
begin
  tvPermisos.Items.BeginUpdate ;
  sdqDatos := GetQuery( Sql );
  try
    SetLength(AVentanas, sdqDatos.RecordCount + 1 );
    if Assigned(sdqDatos) and (not sdqDatos.IsEmpty) then
    repeat
      Nodo := tvPermisos.Items.AddChild(ANode, sdqDatos.Fields[0].AsString);
      Nodo.ImageIndex    := AImageIndex;
      Nodo.SelectedIndex := AImageIndex;

      AVentana := TVentana.Create;
      AVentana.Nombre := sdqDatos.Fields[1].AsString;
      Nodo.Data := TVentana(AVentana);
      //AVentana := nil;

      tvPermisos.Items.AddChild(Nodo, sdqDatos.Fields[1].AsString).ImageIndex := -1;
      sdqDatos.Next ;
    until sdqDatos.Eof ;
  finally
    //Nodo := nil;
    sdqDatos.Free ;
  end;

  tvPermisos.Items.EndUpdate;
end;

procedure TfrmManPerfiles.FormCreate(Sender: TObject);
begin
  inherited;
  fpPermisos.Height := Trunc(Screen.Height * 0.8);
  fraUsuarioBusq.OnChange := fraUsuarioBusqChange;
end;

procedure TfrmManPerfiles.tvPermisosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  Sql      : String;
  sdqDatos : TSDQuery;
  Nodo     : TTreeNode;
begin
  if Node.HasChildren and (Node.getFirstChild.ImageIndex = -1) then
  begin
    Sql := 'SELECT PE_CONTROL, PE_PERMISO ' +
             'FROM UPE_PERMISOS ' +
            'WHERE PE_PERFIL = ''' + edCodigo.Text + ''' ' +
              'AND PE_VENTANA = ''' + TVentana(Node.Data).Nombre + ''' ' + //Node.getFirstChild.Text
            'ORDER BY PE_CONTROL';

    //------------------------------------------------------------------------------------------
    tvPermisos.Items.BeginUpdate ;
    Node.DeleteChildren ;
    sdqDatos := GetQuery( Sql );
    try
      if Assigned(sdqDatos) and (not sdqDatos.IsEmpty) then
      repeat
        Nodo := tvPermisos.Items.AddChild(Node, sdqDatos.Fields[0].AsString);
        if UpperCase(sdqDatos.Fields[1].AsString) = 'NO' then
        begin
          Nodo.ImageIndex    := 3;
          Nodo.SelectedIndex := 3;
        end else
        begin
          Nodo.ImageIndex    := 2;
          Nodo.SelectedIndex := 2;
        end;

        sdqDatos.Next ;
      until sdqDatos.Eof ;
    finally
      //Nodo := Nil;
      sdqDatos.Free ;
    end;
    
    tvPermisos.Items.EndUpdate ;
  end;
end;

procedure TfrmManPerfiles.tvPermisosChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  if Node.ImageIndex > 1 then
  begin
    tvPermisos.PopupMenu  := pmnuAcciones;
    mnuActivar.Enabled    := bActivar    and (Node.ImageIndex = 3);
    mnuDesActivar.Enabled := bDesActivar and (Node.ImageIndex = 2);
  end else
    tvPermisos.PopupMenu  := pmnuRefrescar;
end;

procedure TfrmManPerfiles.mnuActivarClick(Sender: TObject);
var
  Sql : String;
begin
  if Assigned(tvPermisos.Selected) then
    with tvPermisos.Selected do
    begin
      Sql := 'UPDATE UPE_PERMISOS ' +
                'SET PE_PERMISO = ''' + IIF( Assigned(Sender), 'Si', 'No' ) + ''' ' +
              'WHERE PE_PERFIL = ''' + edCodigo.Text + ''' ' +
                'AND PE_VENTANA = ''' + TVentana(tvPermisos.Selected.Parent.Data).Nombre + ''' ' +
                'AND PE_CONTROL = ''' + tvPermisos.Selected.Text + '''';
      try
        EjecutarSql(Sql);
        ActivarNodo( tvPermisos.Selected, Assigned(Sender) );
      except
        on E: Exception do
          ErrorMsg(E);
      end;
    end;
end;

procedure TfrmManPerfiles.mnuActivarTodosClick(Sender: TObject);
var
  Sql : String;
begin
  if Assigned(tvPermisos.Selected) then
    with tvPermisos.Selected do
    begin
      Sql := 'UPDATE UPE_PERMISOS ' +
                'SET PE_PERMISO = ''' + IIF( Assigned(Sender), 'Si', 'No' ) + ''' ' +
              'WHERE PE_VENTANA = ''' + TVentana(tvPermisos.Selected.Parent.Data).Nombre + ''' ' +
                'AND PE_CONTROL = ''' + tvPermisos.Selected.Text + '''';
      try
        EjecutarSql( Sql );
        ActivarNodo( tvPermisos.Selected, Assigned(Sender) );
      except
        on E: Exception do
          ErrorMsg(E);
      end;
    end;
end;

procedure TfrmManPerfiles.mnuDesActivarTodosClick(Sender: TObject);
begin
     mnuActivarTodosClick( Nil );
end;

procedure TfrmManPerfiles.mnuDesactivarClick(Sender: TObject);
begin
     mnuActivarClick( Nil );
end;

procedure TfrmManPerfiles.tvPermisosDblClick(Sender: TObject);
var
  HitTest: TTVHitTestInfo;
  FPoint  : TPoint;
begin
    if Assigned(tvPermisos.Selected) Then begin
       GetCursorPos(FPoint);
       HitTest.pt := tvPermisos.ScreenToClient(FPoint);

       // Si hace Doble Click sobre la Imagen del Nodo Seleccionado
       if (TreeView_HitTest(tvPermisos.Handle, HitTest) <> nil)
          and (tvPermisos.Selected = tvPermisos.Items.GetNode(HitTest.hItem))
          and (HitTest.flags and TVHT_ONITEMICON = TVHT_ONITEMICON) then begin

           // Activa o desactiva el control, según corresponda
           if (tvPermisos.Selected.ImageIndex = 3) and mnuActivar.Enabled then
              mnuActivarClick( Self )
           else if (tvPermisos.Selected.ImageIndex = 2) and mnuDesactivar.Enabled then
              mnuActivarClick( Nil )
       end;
    end;
end;

procedure TfrmManPerfiles.tvPermisosEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TfrmManPerfiles.SeguridadAfterExecute(Sender: TObject);
begin
  bActivar    := mnuActivar.Enabled;
  bDesActivar := mnuDesActivar.Enabled;
  ASQLOriginal := sdqDatos.SQL.Text;
  tbRefrescarClick(nil);
end;

procedure TfrmManPerfiles.mnuRefrescarClick(Sender: TObject);
begin
     if Assigned(tvPermisos.Selected) Then begin
        tvPermisos.Items.BeginUpdate ;
        tvPermisos.Selected.DeleteChildren ;
        tvPermisos.Items.AddChild(tvPermisos.Selected, 'VIRTUAL').ImageIndex := -1;
        tvPermisos.Items.EndUpdate ;
     end;
end;

procedure TfrmManPerfiles.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('PF_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmManPerfiles.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
begin
  Sql := ASQLOriginal;
    
  if chkBajas.Checked then
    AddCondition(Sql, ' pf_fechabaja is null ');

  Sql := Sql + SortDialog.OrderBy;
  OpenQuery( sdqDatos, Sql );
end;

procedure TfrmManPerfiles.tbNuevoClick(Sender: TObject);
begin
     fpABM.Constraints.MaxHeight := 165;
     fpABM.Constraints.MinHeight := 165;
     pnlSeguridad.Visible        := True;
     edCodigo.Enabled            := True;
     fpABM.ActiveControl         := edCodigo;
     btnPermisos.Enabled         := False;

     edCodigo.Text := '';
     if Sender = mnuCrearCopia then begin
        edDescripcion.Text := sdqDatos.FieldByName('PF_DESCRIPCION').AsString ;
        rbCopia.Checked    := True;
        fraPerfilesCopia.Cargar( sdqDatos.FieldByName('PF_PERFIL').AsString );
     end else begin
        edDescripcion.Text       := '' ;
        rbNegado.Checked         := True;
        fraPerfilesCopia.Enabled := False;
     end;
     //----------------------------------------
     with fpABM do begin
          Caption := 'Nuevo Perfil';
          Tag     := 1;
          ShowModal;
     end;
end;

procedure TfrmManPerfiles.tbModificarClick(Sender: TObject);
begin
     if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatos.FieldByName('PF_FECHABAJA').IsNull then begin
         fpABM.Constraints.MaxHeight := 89;
         fpABM.Constraints.MinHeight := 89;
         pnlSeguridad.Visible        := False;
         edCodigo.Enabled            := False;
         fpABM.ActiveControl         := edDescripcion;
         btnPermisos.Enabled         := True;
         edCodigo.Text               := sdqDatos.FieldByName('PF_PERFIL').AsString ;
         edDescripcion.Text          := sdqDatos.FieldByName('PF_DESCRIPCION').AsString ;

         with fpABM do begin
              Caption := 'Modificar Perfil';
              Tag     := 2;
              ShowModal;
         end;
     end;
end;

procedure TfrmManPerfiles.tbEliminarClick(Sender: TObject);
Var Sql : String;
begin
     if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatos.FieldByName('PF_FECHABAJA').IsNull then begin
        if ((GetKeyState( VK_CONTROL ) and $4000 ) = $4000) and
           (MsgBox('¿Desea dar la baja física del perfil y la seguridad asociada al mismo?', MB_ICONQUESTION + MB_YESNO) = IDYES) then begin
            Try
               Sql := 'DELETE UPE_PERMISOS ' +
                      'WHERE PE_PERFIL = ''' + sdqDatos.FieldByName('PF_PERFIL').AsString + '''';
               EjecutarSql( Sql );
               RefreshAndRelocate( sdqDatos, ['PF_PERFIL'] );
            except
               on E: Exception do ErrorMsg(E, 'Error al dar la baja Física del perfil');
            end;

            Try
               Sql := 'DELETE UPF_PERFILES ' +
                      'WHERE PF_PERFIL = ''' + sdqDatos.FieldByName('PF_PERFIL').AsString + '''';
               EjecutarSql( Sql );
               RefreshAndRelocate( sdqDatos, ['PF_PERFIL'] );
            except
               on E: Exception do ErrorMsg(E, 'Error al dar la baja Física del perfil');
            end;

        //--------------------------------------------------------------------------------------------------------------    
        end else if (MsgBox('Se dispone a dar de baja al perfil ' + sdqDatos.FieldByName('PF_PERFIL').AsString + ' (' + sdqDatos.FieldByName('PF_DESCRIPCION').AsString + ').' + #13 +
                       '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES) then begin

                Sql := 'UPDATE UPF_PERFILES ' +
                       'SET PF_FECHABAJA = ACTUALDATE, ' +
                       'PF_USUBAJA = ''' +  Sesion.LoginName + ''' ' +
                       'WHERE PF_PERFIL = ''' + sdqDatos.FieldByName('PF_PERFIL').AsString + '''' ;
            Try
               EjecutarSql( Sql );
               RefreshAndRelocate( sdqDatos, ['PF_PERFIL'] );
            except
               on E: Exception do ErrorMsg(E, 'Error al dar la baja lógica del perfil');
            end;
        end;
     end;
end;

procedure TfrmManPerfiles.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, DBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmManPerfiles.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;

procedure TfrmManPerfiles.tbImprimirClick(Sender: TObject);
begin
  if MsgBox('¿Desea imprimir un listado con Todos los Perfiles?', MB_ICONQUESTION + MB_YESNO, 'Confirmar la Operación') = IDYES then
  begin
    QueryPrint.Footer.Text := Sesion.Usuario;
    QueryPrint.Print;
  end;
end;

procedure TfrmManPerfiles.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmManPerfiles.rbSeguridadClick(Sender: TObject);
begin
  fraPerfilesCopia.Enabled := rbCopia.Checked;
end;

procedure TfrmManPerfiles.btnABMAceptarClick(Sender: TObject);
Var Sql : String;
begin
     if (fpABM.Tag = 1) and ExisteSql( 'SELECT 1 FROM UPF_PERFILES WHERE PF_PERFIL = ''' + edCodigo.Text + '''' ) then
        InvalidMsg(edCodigo, 'Se encontró un perfil con el codigo ingresado.')

     else if (fpABM.Tag = 1) and rbCopia.Checked and (fraPerfilesCopia.edCodigo.Text = '') Then
        InvalidMsg(fraPerfilesCopia.edCodigo, 'Si selecciona la opcion "Copiar de" debe seleccionar el perfil a copiar.')

     else if (edCodigo.Text = '') then
        InvalidMsg(edCodigo, 'El código ingresado es inválido.')

     else
        try
           if (fpABM.Tag = 1) then
               Sql := 'INSERT INTO UPF_PERFILES ' +
                      '(PF_PERFIL, PF_DESCRIPCION, PF_USUALTA, PF_FECHAALTA ) ' +
                      'VALUES (''' + edCodigo.Text + ''', ' + SqlString(edDescripcion.Text, True) + ', ' +
                      '''' + Sesion.LoginName + ''', ACTUALDATE )'
           else
               Sql := 'UPDATE UPF_PERFILES ' +
                      'SET PF_DESCRIPCION = ' + SqlString(edDescripcion.Text, True) + ' ' +
                      'WHERE PF_PERFIL = ''' + edCodigo.Text + '''';

           {-----------------------------------------------------------------------------------------------------------}
           EjecutarSql( Sql );
           RefreshAndLocate( sdqDatos, ['PF_PERFIL'], [ edCodigo.Text ] );
           {-----------------------------------------------------------------------------------------------------------}
           if (fpABM.Tag = 1) Then begin
                if rbCopia.Checked Then // Copia el Perfil
                   Sql := 'INSERT INTO UPE_PERMISOS ' +
                          'SELECT ''' + edCodigo.Text + ''', PE_VENTANA, PE_CONTROL, PE_PERMISO ' +
                          'FROM UPE_PERMISOS ' +
                          'WHERE PE_PERFIL = ''' + fraPerfilesCopia.edCodigo.Text + ''''
                else
                   Sql := 'INSERT INTO UPE_PERMISOS ' +
                          'SELECT ''' + edCodigo.Text + ''', CO_VENTANA, CO_CONTROL, ''' + IIF( rbNegado.Checked, 'No', 'Si' ) + '''' +
                          'FROM UCO_CONTROLES ';

                EjecutarSql( Sql );
           end;
           {-----------------------------------------------------------------------------------------------------------}
           fpABM.ModalResult := mrOk;
        except
           on E: Exception do ErrorMsg(E);
        end;
end;

procedure TfrmManPerfiles.DBGridDblClick(Sender: TObject);
begin
  if tbModificar.Enabled then
     tbModificarClick( Nil );
end;

procedure TfrmManPerfiles.btnPermisosClick(Sender: TObject);
begin
  if tvPermisos.Items.Count = 0 Then
    AgregarNodos(Nil, 'SELECT VE_DESCRIPCION, VE_CODIGO FROM UVE_VENTANAS ORDER BY VE_DESCRIPCION', 0);
  fpPermisos.ShowModal;
end;

procedure TfrmManPerfiles.tvPermisosDeletion(Sender: TObject;  Node: TTreeNode);
begin
     if Node.ImageIndex = 0 Then begin
//        TVentana(Node.Data).Free;
//        Node.Data := Nil;
     end;
end;

procedure TfrmManPerfiles.fpABMClose(Sender: TObject; var Action: TCloseAction);
begin
     tvPermisos.Items.BeginUpdate ;
     tvPermisos.Items.Clear ;
     tvPermisos.Items.EndUpdate ;
end;

procedure TfrmManPerfiles.tbBuscarClick(Sender: TObject);
begin

     if fpBusqueda.ShowModal = mrOk Then begin
        sdqDatos.Locate('PF_PERFIL', fraPerfilesBusq.edCodigo.Text, []);
     end;
end;

procedure TfrmManPerfiles.rbBusquedaClick(Sender: TObject);
begin
     fraPerfilesBusq.Enabled := rbPerfil.Checked;
     fraUsuarioBusq.Enabled  := rbUsuario.Checked;

     if rbPerfil.Checked then begin
        fraPerfilesBusq.edCodigo.SetFocus;
        fraUsuarioBusq.Limpiar ;
        fpBusqueda.ActiveControl := fraPerfilesBusq.edCodigo
     end else begin
        fraUsuarioBusq.edCodigo.SetFocus;
        fraPerfilesBusq.Limpiar ;
        fpBusqueda.ActiveControl := fraUsuarioBusq.edCodigo;
     end;
end;

procedure TfrmManPerfiles.fraUsuarioBusqChange(Sender: TObject);
begin
  fraPerfilesBusq.Cargar( fraUsuarioBusq.sdqDatosSE_PERFIL.AsString );
end;

procedure TfrmManPerfiles.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatos.FieldByName('PF_FECHABAJA').IsNull Then
    AFont.Style := [fsStrikeOut];
end;

{ TVentana }
destructor TVentana.Destroy;
begin
//  ShowMessage('asd');
  inherited;
end;

procedure TfrmManPerfiles.chkBajasClick(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(nil);
end;

procedure TfrmManPerfiles.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(DBGrid);
  if WindowState = wsNormal then
    Width := GetColumnWidths(DBGrid, True);
end;

end.
