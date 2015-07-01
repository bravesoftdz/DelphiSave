unit unLibretaDeDirecciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, DBCtrls, JvExExtCtrls, JvSplitter, unArtFrame,
  CheckLst, ARTCheckListBox, unFraCodigoDescripcion, unFraUsuario, unArtDBAwareFrame;

type
  TfrmLibretaDeDirecciones = class(TfrmCustomGridABM)
    Bevel1: TBevel;
    btnAceptarCopia: TButton;
    btnAceptarSeleccion: TButton;
    btnCancelarCopia: TButton;
    btnCancelarSeleccion: TButton;
    chkBajas: TCheckBox;
    edLD_MAIL: TEdit;
    edLD_NOMBRE: TEdit;
    edLD_OBSERVACION: TMemo;
    fpCopiarDirecciones: TFormPanel;
    fraUsuarios: TfraUsuarios;
    JvSplitter1: TJvSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListaDirecciones: TARTCheckListBox;
    Observaciones: TDBMemo;
    pnlBottom: TPanel;
    pnlObservaciones: TPanel;
    procedure btnAceptarCopiaClick(Sender: TObject);
    procedure btnAceptarSeleccionClick(Sender: TObject); 
    procedure chkBajasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tbModificarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
 private
    SQL_ORIGINAL: String;
 protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

implementation

uses
  CustomDlgs, Internet, unSesion, SQLFuncs, AnsiSQL, unART, unPrincipal, unDmPrincipal;

{$R *.DFM}

procedure TfrmLibretaDeDirecciones.btnAceptarCopiaClick(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  Verificar(fraUsuarios.IsEmpty, fraUsuarios.edCodigo, 'Debe seleccionar un usuario.');
  Verificar(ListaDirecciones.Items.Count = 0, ListaDirecciones, 'Debe seleccionar al menos una dirección.');

  sSql :=
    'INSERT INTO comunes.cld_libretadirecciones' +
               ' (ld_id, ld_usuario, ld_mail, ld_nombre, ld_observacion, ld_fechaalta)' +
     ' SELECT comunes.seq_cld_id.NEXTVAL, :usuario, ld_mail, ld_nombre, ld_observacion, SYSDATE' +
       ' FROM comunes.cld_libretadirecciones' +
      ' WHERE 1 = 1 ' + ListaDirecciones.InSQL_IntegerValues('ld_id', False);
  EjecutarSQLEx(sSql, [fraUsuarios.Codigo]);
  fpCopiarDirecciones.ModalResult := mrOk;
end;

procedure TfrmLibretaDeDirecciones.btnAceptarSeleccionClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, btnAceptarSeleccion, 'Debe seleccionar un registro.');
  ModalResult := mrOk;
end;

procedure TfrmLibretaDeDirecciones.chkBajasClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmLibretaDeDirecciones.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFNDEF SERVICE}
  Toolbar.HotImages := frmPrincipal.ilColor;
  Toolbar.Images    := frmPrincipal.ilByN;
  {$ENDIF}
  
  {$IFNDEF RED_PRES}
  Toolbar.HotImages := frmPrincipal.ilColor;
  Toolbar.Images    := frmPrincipal.ilByN;
  {$ELSE}
  Toolbar.HotImages := frmPrincipal.ilColor;
  Toolbar.Images    := frmPrincipal.ilByN;

  tbRefrescar.ImageIndex              := 0;
  tbNuevo.ImageIndex                  := 6;
  tbModificar.ImageIndex              := 7;
  tbEliminar.ImageIndex               := 8;
  tbPropiedades.ImageIndex            := 13;
  tbLimpiar.ImageIndex                := 1;
  tbOrdenar.ImageIndex                := 2;
  tbMostrarOcultarColumnas.ImageIndex := 14;
  tbImprimir.ImageIndex               := 4;
  tbExportar.ImageIndex               := 3;
  tbEnviarMail.ImageIndex             := 31;
  tbMostrarFiltros.ImageIndex         := 11;
  tbMaxRegistros.ImageIndex           := 12;
  tbSalir.ImageIndex                  := 5;
  {$ENDIF}  

  CheckPK       := False;
  SQL_ORIGINAL  := sdqConsulta.Sql.Text;
  Sql.TableName := 'comunes.cld_libretadirecciones';
  FieldBaja     := 'ld_fechabaja';
  sdqConsulta.ParamByName('user').AsString := Sesion.UserID;
end;

procedure TfrmLibretaDeDirecciones.sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := DataSet.FindField('ld_fechabaja').IsNull or chkBajas.Checked;
end;

procedure TfrmLibretaDeDirecciones.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    if (not sdqConsulta.FieldByName(FieldBaja).IsNull) and
       (not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿ Desea recuperarlo ?')) then
      Abort;
      
    inherited;
  end
  else
    InvalidMsg(nil, 'Debe seleccionar un registro.');
end;

procedure TfrmLibretaDeDirecciones.tbPropiedadesClick(Sender: TObject);
begin
  ListaDirecciones.SQL :=
    'SELECT ld_nombre, ld_id' +
     ' FROM comunes.cld_libretadirecciones' +
    ' WHERE ld_fechabaja IS NULL' +
      ' AND ld_usuario = ' + SQLValue(Sesion.UserID) +
 ' ORDER BY ld_nombre';
  inherited;

  fpCopiarDirecciones.ShowModal;
end;

procedure TfrmLibretaDeDirecciones.ClearControls;
begin
  edLD_NOMBRE.Clear;
  edLD_MAIL.Clear;
  edLD_OBSERVACION.Lines.Clear;
end;

function TfrmLibretaDeDirecciones.DoABM: Boolean;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ld_id', sdqConsulta.FieldByName('ld_id').AsInteger);
    Sql.Fields.Add('ld_fechabaja', exDateTime);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('ld_id', 'comunes.seq_cld_id.NEXTVAL');
      Sql.Fields.Add('ld_fechaalta', exDateTime);
    end
    else
    begin { maModificacion }
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ld_id', sdqConsulta.FieldByName('ld_id').AsInteger);
      Sql.Fields.Add('ld_fechamodif', exDateTime);
      Sql.Fields.AddExpression('ld_fechabaja', SQL_NULL);
    end;

    Sql.Fields.Add('ld_usuario',     Sesion.UserID);
    Sql.Fields.Add('ld_nombre',      edLD_NOMBRE.Text);
    Sql.Fields.Add('ld_mail',        edLD_MAIL.Text);
    Sql.Fields.Add('ld_observacion', edLD_OBSERVACION.Lines.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmLibretaDeDirecciones.LoadControls;
begin
  with sdqConsulta do
  begin
    edLD_NOMBRE.Text            := FieldByName('ld_nombre').AsString;
    edLD_MAIL.Text              := FieldByName('ld_mail').AsString;
    edLD_OBSERVACION.Lines.Text := FieldByName('ld_observacion').AsString;
  end;
end;

procedure TfrmLibretaDeDirecciones.RefreshData;
begin
  sdqConsulta.SQL.Text := SQL_ORIGINAL + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmLibretaDeDirecciones.Validar: Boolean;
begin
  Verificar(edLD_NOMBRE.Text = '', edLD_NOMBRE, 'La descripción del contacto es obligatoria.');
  Verificar(edLD_MAIL.Text = '', edLD_MAIL, 'La dirección de correo electrónico es obligatoria.');
  Verificar(not IsEMail(edLD_MAIL.Text), edLD_MAIL, 'La dirección de correo electrónico ingresada no es válida.');

  Result := True;
end;

end.
