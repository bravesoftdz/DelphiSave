unit unManSectores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraUsuarios, StdCtrls, ComCtrls, ImgList, Db, SDEngine, Placemnt,
  artSeguridad, Menus, Grids, DBGrids, RXDBCtrl, ToolWin, FormPanel,
  SortDlg, ExtCtrls, PatternEdit, ShortCutControl, QueryToFile,
  ExportDialog, QueryPrint, unfraSectores, Mask, ToolEdit, ArtComboBox,
  unArtFrame, unCustomForm, XPMenu, JvExDBGrids, JvDBGrid,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc;

type
  TVentana = Class(TObject)
  public
     Nombre : String;
  end;

  TfrmManSectores = class(TfrmCustomForm)
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
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
    dsDatos: TDataSource;
    SortDialog: TSortDialog;
    ShortCutControl: TShortCutControl;
    pmnuNuevos: TPopupMenu;
    mnuNuevoUsuario: TMenuItem;
    mnuCrearCopia: TMenuItem;
    btnUsuarios: TButton;
    ExportDialog: TExportDialog;
    tbBuscar: TToolButton;
    ToolButton4: TToolButton;
    fpBusqueda: TFormPanel;
    btnBuscCancelar: TButton;
    btnBuscBuscar: TButton;
    QueryPrint: TQueryPrint;
    rbUsuario: TRadioButton;
    fraUsuarioBusq: TfraUsuario;
    Bevel3: TBevel;
    rbSector: TRadioButton;
    fraSectoresBusq: TfraSectores;
    sdqDatos: TSDQuery;
    dsDelegaciones: TDataSource;
    sdqDelegaciones: TSDQuery;
    cmbDelegaciones: TArtComboBox;
    Label3: TLabel;
    chkSistemaArchivo: TCheckBox;
    Panel1: TPanel;
    chkBajas: TCheckBox;
    dbgAplicaciones: TJvDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    sdqAplicaciones: TSDQuery;
    dsAplicaciones: TDataSource;
    btnAgregar: TButton;
    btnRemover: TButton;
    fpAplicaciones: TFormPanel;
    Bevel2: TBevel;
    btnCancelarAplicacion: TButton;
    btnAceptarAplicacion: TButton;
    fraEjecutables: TfraCodDesc;
    Label6: TLabel;
    chkVisible: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure btnABMAceptarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure rbBusquedaClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure btnUsuariosClick(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure chkBajasClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnAceptarAplicacionClick(Sender: TObject);
    procedure sdqAplicacionesAfterOpen(DataSet: TDataSet);
    procedure fpAplicacionesShow(Sender: TObject);
  private
    ASQLOriginal: string;
    procedure fraUsuarioBusqChange(Sender: TObject);
  end;

var
  frmManSectores: TfrmManSectores;

implementation

uses
  unPrincipal, unDmPrincipal, SqlOracle, CustomDlgs, Commctrl, General, unSesion,
  unManUsuarios, VCLExtra, unGrids, unArt, AnsiSql, SqlFuncs;

{$R *.DFM}


{ TfrmPermisosUsuario }


procedure TfrmManSectores.FormCreate(Sender: TObject);
begin
  inherited;
  fraUsuarioBusq.OnChange := fraUsuarioBusqChange;
  OpenQuery(sdqDelegaciones);
end;

procedure TfrmManSectores.SeguridadAfterExecute(Sender: TObject);
begin
  ASQLOriginal := sdqDatos.SQL.Text;
  tbRefrescarClick(nil);
end;

procedure TfrmManSectores.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('SC_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmManSectores.tbRefrescarClick(Sender: TObject);
var
  Sql : String;
begin
  Sql := ASQLOriginal;

  if chkBajas.Checked then
    AddCondition(Sql, ' sc_fechabaja is null ');

  Sql := Sql + SortDialog.OrderBy;
  OpenQuery(sdqDatos, Sql);
end;

procedure TfrmManSectores.tbNuevoClick(Sender: TObject);
begin
  chkVisible.AllowGrayed := True;
  sdqAplicaciones.Close;
  dbgAplicaciones.Enabled := False;
  btnAgregar.Enabled := False;
  btnRemover.Enabled := False;
  chkVisible.State   := cbGrayed;

  edCodigo.Enabled            := True;
  fpABM.ActiveControl         := edCodigo;
  btnUsuarios.Enabled         := False;

  edCodigo.Text := '';
  if Sender = mnuCrearCopia then
  begin
    edDescripcion.Text         := sdqDatos.FieldByName('SC_DESCRIPCION').AsString;
    cmbDelegaciones.FieldValue := sdqDatos.FieldByName('SC_DELEGACION').AsString;
    chkSistemaArchivo.Checked  := sdqDatos.FieldByName('SC_SISTEMAARCHIVO').AsString = 'S';
    chkVisible.Checked         := sdqDatos.FieldByName('SC_VISIBLE').AsString = 'S';
  end else
  begin
    edDescripcion.Text         := '' ;
    cmbDelegaciones.FieldValue := '840';
    chkSistemaArchivo.Checked  := True;
    chkVisible.State           := cbGrayed;
  end;
  //----------------------------------------
  with fpABM do
  begin
    Caption := 'Nuevo SECTOR';
    Tag     := 1;
    ShowModal;
  end;
end;

procedure TfrmManSectores.tbModificarClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatos.FieldByName('SC_FECHABAJA').IsNull then
  begin
    edCodigo.Enabled           := False;
    fpABM.ActiveControl        := edDescripcion;
    btnUsuarios.Enabled        := True;
    edCodigo.Text              := sdqDatos.FieldByName('SC_CODIGO').AsString;
    edDescripcion.Text         := sdqDatos.FieldByName('SC_DESCRIPCION').AsString;
    cmbDelegaciones.FieldValue := sdqDatos.FieldByName('SC_DELEGACION').AsString;
    chkSistemaArchivo.Checked  := sdqDatos.FieldByName('SC_SISTEMAARCHIVO').AsString = 'S';
    chkVisible.Checked         := sdqDatos.FieldByName('SC_VISIBLE').AsString = 'S';

    btnAgregar.Enabled := True;
    btnRemover.Enabled := True;

    OpenQueryEx(sdqAplicaciones, [sdqDatos.FieldByName('SC_CODIGO').AsString]);
    dbgAplicaciones.Enabled := True;

    with fpABM do
    begin
      Caption := 'Modificar SECTOR';
      Tag     := 2;
      ShowModal;
    end;
  end;
end;

procedure TfrmManSectores.tbEliminarClick(Sender: TObject);
var
  Sql : String;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatos.FieldByName('SC_FECHABAJA').IsNull then
  begin
    if (MsgBox('Se dispone a dar de baja al Sector ' + sdqDatos.FieldByName('SC_CODIGO').AsString + ' (' + sdqDatos.FieldByName('SC_DESCRIPCION').AsString + ').' + #13 +
               '¿Esta usted Seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
    begin
      Sql := 'UPDATE USC_SECTORES ' +
               ' SET SC_FECHABAJA = ACTUALDATE, ' +
                   ' SC_USUBAJA = ' +  SQLString(Sesion.LoginName, True) +
             ' WHERE SC_CODIGO = ' + SQLString(sdqDatos.FieldByName('SC_CODIGO').AsString, True);
      try
        EjecutarSql(Sql);
        RefreshAndRelocate( sdqDatos, ['SC_CODIGO'] );
      except
        on E: Exception do
          ErrorMsg(E, 'Error al dar la baja lógica del SECTOR');
      end;
    end;
  end;
end;

procedure TfrmManSectores.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, DBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmManSectores.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;

procedure TfrmManSectores.tbImprimirClick(Sender: TObject);
begin
  if MsgBox('¿Desea imprimir un listado con Todos los Sectores?', MB_ICONQUESTION + MB_YESNO, 'Confirmar la Operación') = IDYES then
  begin
    QueryPrint.Footer.Text := Sesion.Usuario ;
    QueryPrint.Print ;
  end;
end;

procedure TfrmManSectores.tbSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmManSectores.btnABMAceptarClick(Sender: TObject);
var
  Sql : String;
begin
  if (fpABM.Tag = 1) and ExisteSql( 'SELECT 1 FROM USC_SECTORES WHERE SC_CODIGO = ''' + edCodigo.Text + '''' ) then
    InvalidMsg(edCodigo, 'Se encontró un Sector con el codigo ingresado.')
  else if (edCodigo.Text = '') then
    InvalidMsg(edCodigo, 'El código ingresado es inválido.')
  else
    try
      if (fpABM.Tag = 1) then
        Sql := 'INSERT INTO USC_SECTORES ' +
               '(SC_CODIGO, SC_DESCRIPCION, SC_DELEGACION, SC_USUALTA, SC_SISTEMAARCHIVO, SC_FECHAALTA, SC_VISIBLE) ' +
               'VALUES (' + SqlString(edCodigo.Text, True) + ', ' + SqlString(edDescripcion.Text, True) + ', ' +
                SqlString(cmbDelegaciones.FieldValue, True) + ', ' + SqlString(Sesion.LoginName, True) +
                ', ' + SqlString(iif(chkSistemaArchivo.Checked, 'S', 'N'), True) + ', ACTUALDATE, ' + SqlBoolean(chkVisible.Checked) + ')'
      else
        Sql := 'UPDATE USC_SECTORES ' +
                  'SET SC_DESCRIPCION = ' + SqlString(edDescripcion.Text, True) + ', ' +
                      'SC_DELEGACION = ' + SqlString(cmbDelegaciones.FieldValue, True) + ', ' +
                      'SC_SISTEMAARCHIVO = ' + SqlString(iif(chkSistemaArchivo.Checked, 'S', 'N'), True) + ', ' +
                      'SC_VISIBLE = ' + SqlBoolean(chkVisible.Checked) +
               ' WHERE SC_CODIGO = ''' + edCodigo.Text + '''';

      {-----------------------------------------------------------------------------------------------------------}
      EjecutarSql( Sql );
      RefreshAndLocate( sdqDatos, ['SC_CODIGO'], [ edCodigo.Text ] );
      {-----------------------------------------------------------------------------------------------------------}
      fpABM.ModalResult := mrOk;
    except
      on E: Exception do
        ErrorMsg(E);
    end;
end;

procedure TfrmManSectores.DBGridDblClick(Sender: TObject);
begin
  if tbModificar.Enabled then
    tbModificarClick(nil);
end;

procedure TfrmManSectores.tbBuscarClick(Sender: TObject);
begin
  if fpBusqueda.ShowModal = mrOk then
  begin
    sdqDatos.Locate('SC_CODIGO', fraSectoresBusq.edCodigo.Text, []);
  end;
end;

procedure TfrmManSectores.rbBusquedaClick(Sender: TObject);
begin
  fraSectoresBusq.Enabled := rbSector.Checked;
  fraUsuarioBusq.Enabled  := rbUsuario.Checked;

  if rbSector.Checked then
  begin
    fraSectoresBusq.edCodigo.SetFocus;
    fraUsuarioBusq.Limpiar;
    fpBusqueda.ActiveControl := fraSectoresBusq.edCodigo;
  end else
  begin
    fraUsuarioBusq.edCodigo.SetFocus;
    fraSectoresBusq.Limpiar;
    fpBusqueda.ActiveControl := fraUsuarioBusq.edCodigo;
  end;
end;

procedure TfrmManSectores.fraUsuarioBusqChange(Sender: TObject);
begin
  fraSectoresBusq.Cargar(fraUsuarioBusq.sdqDatosSE_SECTOR.AsString);
end;

procedure TfrmManSectores.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatos.FieldByName('SC_FECHABAJA').IsNull then
    AFont.Style := [fsStrikeOut];
end;

procedure TfrmManSectores.btnUsuariosClick(Sender: TObject);
begin
  Abrir(TfrmManUsuarios, frmManUsuarios, tmvMDIChild, nil);
  with frmManUsuarios do
  begin
    btnFiltrosLimpiarClick(nil);
    fraUsuFiltros.fraSectores.Cargar(Self.sdqDatos.FieldByName('SC_CODIGO').AsString);
    frmManUsuarios.tbRefrescar.Click;
    Abrir(TfrmManUsuarios, frmManUsuarios, tmvModal, nil);
  end;
end;

procedure TfrmManSectores.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(DBGrid);
  if WindowState = wsNormal then
    Width := GetColumnWidths(DBGrid, True);
end;

procedure TfrmManSectores.chkBajasClick(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(nil);
end;

procedure TfrmManSectores.btnRemoverClick(Sender: TObject);
begin
  Verificar(sdqAplicaciones.IsEmpty, dbgAplicaciones, 'Debe seleccionar una aplicación.');
  if MsgAsk(Format('¿Está seguro que desea remover la aplicación %s al sector %s?', [sdqAplicaciones.FieldByName('ej_descripcion').AsString, edDescripcion.Text])) then
  begin
    EjecutarSqlEx('DELETE FROM comunes.cpe_perfilejecutable ' +
                   'WHERE pe_idejecutable = :idejecutable ' +
                     'AND pe_idgrupo = :sector', [sdqAplicaciones.FieldByName('pe_idejecutable').AsInteger,
                                                  sdqAplicaciones.FieldByName('pe_idgrupo').AsString]);
    OpenQueryEx(sdqAplicaciones, [edCodigo.Text]);
  end;
end;

procedure TfrmManSectores.btnAgregarClick(Sender: TObject);
begin
  fraEjecutables.Propiedades.ExtraCondition := ' AND not exists(SELECT 1 ' +
                                                                 'FROM comunes.cpe_perfilejecutable ' +
                                                                'WHERE pe_idejecutable = ej_id ' +
                                                                  'AND pe_idgrupo = ' + SqlString(edCodigo.Text, True) + ') ';
  if fpAplicaciones.ShowModal = mrOk then
  begin
    EjecutarSqlEx('INSERT INTO comunes.cpe_perfilejecutable ' +
                  '(pe_id, pe_idejecutable, pe_idgrupo) ' +
                  'VALUES ' +
                  '(comunes.SEQ_CPE_ID.NextVal, :idejecutable, :idgrupo)', [fraEjecutables.ID, edCodigo.Text]);
    OpenQueryEx(sdqAplicaciones, [edCodigo.Text]);
  end;
end;

procedure TfrmManSectores.btnAceptarAplicacionClick(Sender: TObject);
begin
  Verificar(fraEjecutables.IsEmpty, fraEjecutables.edCodigo, 'Debe seleccionar una aplicación.');
  fpAplicaciones.ModalResult := mrOk;
end;

procedure TfrmManSectores.sdqAplicacionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  btnRemover.Enabled := not sdqAplicaciones.IsEmpty;
end;

procedure TfrmManSectores.fpAplicacionesShow(Sender: TObject);
begin
  inherited;
  fraEjecutables.Clear;
end;

end.
