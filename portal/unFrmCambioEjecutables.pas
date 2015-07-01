unit unFrmCambioEjecutables;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, ComCtrls, DB, SDEngine, ExtCtrls, ToolEdit,
  Buttons, unArtFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt, unSesion, FormPanel, JvHint,
  JvFormPlacement, unCustomPanelAbm, JvEnterTab, JvComponent, ImgList, ToolWin, Mask, unArtDBAwareFrame,
  JvExControls;

type
  TFormCambioEjecutable = class(TForm)
    sdqQuery: TSDQuery;
    lvExplorer: TListView;
    fpAplicacion: TFormPanel;
    btnAceptarCambio: TButton;
    btnCancelarCambio: TButton;
    fraEjecutable: TfraCodigoDescripcionExt;
    lblEjecutable: TLabel;
    lblPathActual: TLabel;
    edPathOriginal: TEdit;
    edPathCambio: TEdit;
    lblPathCambio: TLabel;
    btnSeleccionarArchivo: TSpeedButton;
    edFechaAplicacion: TDateEdit;
    lblFechaAplicacion: TLabel;
    bvSeparadorBotones: TBevel;
    lblCambio: TLabel;
    fraPedido: TfraCodigoDescripcionExt;
    OpenDialog: TOpenDialog;
    cbCambio: TCoolBar;
    ToolBar: TToolBar;
    tbEjecutarAplicacion: TToolButton;
    tbSeparador: TToolButton;
    tbAgregarAplicacion: TToolButton;
    tbEditarAplicacion: TToolButton;
    tbEliminarAplicacion: TToolButton;
    tbSeparadorAdministracion: TToolButton;
    tbLimpiar: TToolButton;
    ilByN: TImageList;
    ilColor: TImageList;
    ilState: TImageList;
    sb: TStatusBar;
    Hint: TJvHint;
    EnterAsTab: TJvEnterAsTab;
    FormStorage: TJvFormStorage;
    dtpHoraAplicacion: TDateTimePicker;
    Label1: TLabel;
    edPathCitrix: TEdit;
    procedure lvExplorerDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEjecutarAplicacionClick(Sender: TObject);
    procedure tbAgregarAplicacionClick(Sender: TObject);
    procedure btnSeleccionarArchivoClick(Sender: TObject);
    procedure tbEditarAplicacionClick(Sender: TObject);
    procedure tbEliminarAplicacionClick(Sender: TObject);
    procedure btnAceptarCambioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ModoABM : TModoABM;
    procedure CleanAplicaciones;
    procedure RecargarCambios;
    procedure OnChangeEjecutable(Sender: TObject);
    procedure CargarDatosCambioAplicacion;
  end;

var
  FormCambioEjecutable: TFormCambioEjecutable;

implementation

uses
  unDmPrincipal, AnsiSQL, SqlFuncs, StrFuncs, CustomDlgs, DateUtils;

{$R *.dfm}

procedure TFormCambioEjecutable.lvExplorerDblClick(Sender: TObject);
begin
  CargarDatosCambioAplicacion;
end;

procedure TFormCambioEjecutable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormCambioEjecutable.tbEjecutarAplicacionClick(Sender: TObject);
begin
  RecargarCambios;
end;

procedure TFormCambioEjecutable.RecargarCambios;
var
 ListItem: TListItem;
begin
  sdqQuery.close;
  try
    sdqQuery.Open;

    lvExplorer.Items.Clear;
    while not sdqQuery.Eof do
    begin
      ListItem := lvExplorer.Items.Add;
      ListItem.Caption := sdqQuery.FieldByName('rc_fechahoracambio').AsString;
      ListItem.SubItems.Add(sdqQuery.FieldByName('ej_descripcion').AsString);

      if not sdqQuery.FieldByName('rc_fechabaja').IsNull then
        ListItem.ImageIndex := 3
      else if sdqQuery.FieldByName('rc_copiado').AsString = 'S' then
        ListItem.ImageIndex := 1
      else if sdqQuery.FieldByName('rc_copiado').AsString = 'N' then
        ListItem.ImageIndex := 2
      else if sdqQuery.FieldByName('rc_copiado').AsString = '' then
        ListItem.ImageIndex := 0;

      ListItem.SubItems.Add(sdqQuery.FieldByName('rc_pathoriginal').AsString);
      ListItem.SubItems.Add(sdqQuery.FieldByName('rc_pathcambio').AsString);
      ListItem.SubItems.Add(sdqQuery.FieldByName('RC_NROSOLICITUD').AsString);
      ListItem.SubItems.Add(sdqQuery.FieldByName('ej_id').AsString);
      ListItem.SubItems.Add(sdqQuery.FieldByName('rc_pathcitrix').asString);

      ListItem.Data := TObject(sdqQuery.FieldByName('rc_id').asinteger);

      sdqQuery.Next;
    end;

    sb.Panels[0].Text := IntToStr(sdqQuery.RecordCount);
    if sdqQuery.RecordCount = 1 then
      sb.Panels[0].Text := sb.Panels[0].Text + ' Registro'
    else
      sb.Panels[0].Text := sb.Panels[0].Text + ' Registros';
  finally
    sdqQuery.Close;
  end;
end;

procedure TFormCambioEjecutable.tbAgregarAplicacionClick(Sender: TObject);
begin
  ModoABM := maAlta;
  fpAplicacion.Caption := 'Agregar Programación de Cambio de Ejecutable';
  CleanAplicaciones;
	fpAplicacion.ShowModal;
end;

procedure TFormCambioEjecutable.btnSeleccionarArchivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edPathCambio.Text := OpenDialog.FileName;
end;

procedure TFormCambioEjecutable.CleanAplicaciones;
begin
  fraEjecutable.Codigo := '';
  edPathOriginal.Text := '';
  edPathCambio.Text := '';
  edFechaAplicacion.Date := 0;
  dtpHoraAplicacion.Time := 0;
  fraPedido.Codigo := '';
  edPathCitrix.Text := '';
end;

procedure TFormCambioEjecutable.tbEditarAplicacionClick(Sender: TObject);
begin
  CargarDatosCambioAplicacion;
end;

procedure TFormCambioEjecutable.CargarDatosCambioAplicacion;
begin
  if not assigned(lvExplorer.Selected) then exit;

  ModoABM := maModificacion;
  fpAplicacion.Caption := 'Modificar Programación de Cambio de Ejecutable';
  CleanAplicaciones;
  edFechaAplicacion.Date := DateOf(StrToDateTime(lvExplorer.Selected.Caption));
  dtpHoraAplicacion.Time := TimeOf(StrToDateTime(lvExplorer.Selected.Caption));
  fraEjecutable.Codigo   := lvExplorer.Selected.SubItems[4];
  edPathOriginal.Text      := lvExplorer.Selected.SubItems[1];
  edPathCambio.Text    := lvExplorer.Selected.SubItems[2];
  fraPedido.Codigo       := lvExplorer.Selected.SubItems[3];
  edPathCitrix.Text      := lvExplorer.Selected.SubItems[5];
  fpAplicacion.ShowModal;
end;

procedure TFormCambioEjecutable.tbEliminarAplicacionClick(Sender: TObject);
begin
  if Assigned(lvExplorer.Selected) then
  begin
    Verificar(lvExplorer.Selected.ImageIndex = 3, nil, 'No puede eliminar un cambio de ejecutable ya efectuado o dado de baja.');

    if (MessageBox(0, '¿Desea anular el cambio de ejecutable seleccionado?', '', MB_ICONQUESTION or MB_YESNO) = idYes) then
    begin
      EjecutarSql( 'update comunes.crc_registrocambioejecutable ' +
                     '   set rc_fechabaja = sysdate, ' +
                     '       rc_usubaja = ' + SqlValue(Sesion.LoginName) +
                     ' where rc_id = ' + SqlValue(integer(lvExplorer.Selected.Data)));
      RecargarCambios;
    end;
  end;
end;

procedure TFormCambioEjecutable.btnAceptarCambioClick(Sender: TObject);
var
  Sql: TSql;
  Id: integer;
begin
  VerificarMultiple( ['Guardando Cambio de Ejecutable',
  fraEjecutable, fraEjecutable.IsSelected, 'Debe seleccionar una aplicación',
  edPathCambio, not IsEmptyString(edPathCambio.Text), 'Debe completar un path válido para la aplicación.',
  edPathCambio, edPathCambio.Text <> edPathOriginal.Text, 'La aplicaciones origen y destino deben ser diferentes.']);
//     edFechaAplicacion, (edFechaAplicacion.Date +   TimeOf(dtpHoraAplicacion.Time)) > DBDateTime + 0.25, 'Debe seleccionar una fecha con una anticipación mayor a 6 horas']);

  Sql := TSql.Create('comunes.crc_registrocambioejecutable');
  try
    if ModoABM = maAlta Then begin
       Sql.SqlType := stInsert;
       Id := GetSecNextVal('comunes.SEQ_CRC_ID');
       Sql.Fields.Add('rc_usualta', Sesion.LoginName , true);
       Sql.Fields.AddDate('rc_fechaalta', DBDate, true);
    end else begin
       Sql.SqlType := stUpdate;
       Id := Integer(lvExplorer.Selected.data);
       Sql.Fields.Add('rc_usumodif', Sesion.LoginName, true);
       Sql.Fields.AddDate('rc_fechamodif', DBDate, true);
    end;

    Sql.PrimaryKey.Add('rc_id', Id );
    Sql.Fields.Add('rc_idejecutable', fraEjecutable.Codigo, true);
    Sql.Fields.Add('rc_pathoriginal', edPathOriginal.Text, true);
    Sql.Fields.Add('rc_pathcambio', edPathCambio.Text, true);
    if (trim(edPathCitrix.Text) <> '') then
      Sql.Fields.Add('rc_pathcitrix', edPathCitrix.Text, true)
    else
      Sql.Fields.Add('rc_pathcitrix', exNull);
    Sql.Fields.AddDateTime('rc_fechahoracambio', edFechaAplicacion.Date + TimeOf(dtpHoraAplicacion.Time), true);
    Sql.Fields.Add('rc_nrosolicitud', fraPedido.Codigo, true);
      
    EjecutarSql(Sql.Sql);

    RecargarCambios;
    fpAplicacion.ModalResult := mrOk;
  finally
    Sql.Free;
  end;
end;

procedure TFormCambioEjecutable.FormCreate(Sender: TObject);
begin
  with fraEjecutable do
  begin
    TableName := 'comunes.cej_ejecutable';
    FieldID := 'ej_id';
    FieldCodigo := 'ej_id';
    FieldDesc := 'ej_descripcion';
    FieldBaja := 'ej_fechabaja';
    ExtraFields := ', ej_path ';
    OnChange := OnChangeEjecutable;
    ShowBajas := False;
  end;

  with fraPedido do
  begin
    TableName := 'ART.EJC_PROGREJECUTABLES';
    FieldID := 'JC_NROSOLICITUD';
    FieldCodigo := 'JC_NROSOLICITUD';
    FieldDesc := 'JC_NOMBREPROGR';
    OrderBy := ' JC_NROSOLICITUD desc ';
  end;
end;

procedure TFormCambioEjecutable.OnChangeEjecutable(Sender: TObject);
begin
  if fraEjecutable.IsSelected then
  begin
    edPathOriginal.Text := fraEjecutable.fields.FieldByName('ej_path').AsString;
    edPathCambio.Text := ExtractFilePath(fraEjecutable.fields.FieldByName('ej_path').AsString);    
  end;
end;

procedure TFormCambioEjecutable.tbLimpiarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCambioEjecutable.FormShow(Sender: TObject);
begin
  RecargarCambios;
end;
    
end.
