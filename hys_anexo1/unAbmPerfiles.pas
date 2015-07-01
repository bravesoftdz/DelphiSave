unit unAbmPerfiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraPerfilPreventor, unSesion, SqlFuncs,
  unDmPrincipal, CustomDlgs, AnsiSql, VCLExtra;

type
  TfrmPerfiles = class(TfrmCustomGridABM)
    edNombrePerfil: TEdit;
    Label1: TLabel;
    fpCondicion: TFormPanel;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    tbGuardar: TToolButton;
    tbLimpiarCondicion: TToolButton;
    tbSeleccionarTodo: TToolButton;
    fraPerfilPreventorABM: TfraPerfilPreventor;
    tbSalirPerfil: TToolButton;
    gbCondiciones: TGroupBox;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    tbNuevaCond: TToolButton;
    pcCondiciones: TPageControl;
    tbModificarCond: TToolButton;
    tbEliminarCond: TToolButton;
    procedure tbNuevaCondClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbLimpiarCondicionClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbSalirPerfilClick(Sender: TObject);
    procedure tbModificarCondClick(Sender: TObject);
    procedure tbEliminarCondClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FPerfilAlta: Integer;

    procedure CargarCondiciones(aIdPerfil: Integer);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
        
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmPerfiles: TfrmPerfiles;

implementation

{$R *.DFM}

procedure TfrmPerfiles.tbNuevaCondClick(Sender: TObject);
begin
  inherited;
  Validar;

  fraPerfilPreventorABM.Init;
  fraPerfilPreventorABM.Limpiar;

  if (ModoABM = maAlta) then
    DoABM
  else
    if FPerfilAlta = -1 then
      FPerfilAlta := sdqConsulta.fieldbyname('PF_ID').AsInteger;

  fpCondicion.ShowModal;
  CargarCondiciones(FPerfilAlta);
end;

procedure TfrmPerfiles.FormCreate(Sender: TObject);
begin
  inherited;
  
  Sql.TableName := 'hys.hpf_perfil';
  FieldBaja     := 'pf_fechabaja';
  FPerfilAlta   := -1;
end;

procedure TfrmPerfiles.ClearControls;
begin
  edNombrePerfil.Clear;
  while pcCondiciones.ControlCount > 0 do
    pcCondiciones.Controls[0].Free;
end;

function TfrmPerfiles.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('PF_ID',    sdqConsulta.FieldByName('PF_ID').AsInteger);
    Sql.Fields.Add('PF_USUBAJA',   Sesion.LoginName);
    Sql.Fields.Add('PF_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    Sql.Fields.Add('PF_DESCRIPCION', edNombrePerfil.Text);

    if ModoABM = maAlta then
    begin
      FPerfilAlta := GetSecNextVal('hys.seq_hpf_id');
      Sql.PrimaryKey.Add('PF_ID',    FPerfilAlta);
      Sql.Fields.Add('PF_USUALTA',   Sesion.LoginName);
      Sql.Fields.Add('PF_FECHAALTA', exDateTime);
      Sql.SqlType := stInsert;
    end
    else
    begin
      Sql.PrimaryKey.Add('PF_ID',     FPerfilAlta);
      Sql.Fields.Add('PF_USUMODIF',   Sesion.LoginName);
      Sql.Fields.Add('PF_FECHAMODIF', exDateTime);
      Sql.Fields.Add('PF_USUBAJA',    exNull);
      Sql.Fields.Add('PF_FECHABAJA',  exNull);
      Sql.SqlType := stUpdate;
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmPerfiles.LoadControls;
begin
  edNombrePerfil.Text := sdqConsulta.fieldbyname('PF_DESCRIPCION').AsString;
  CargarCondiciones(sdqConsulta.fieldbyname('PF_ID').AsInteger);
  FPerfilAlta := sdqConsulta.fieldbyname('PF_ID').AsInteger
end;

function TfrmPerfiles.Validar: Boolean;
begin
  Verificar((Trim(edNombrePerfil.Text) = ''), edNombrePerfil, 'Debe ingresar un nombre de perfil.');
  
  Result := True;
end;

procedure TfrmPerfiles.tbSeleccionarTodoClick(Sender: TObject);
begin
  fraPerfilPreventorABM.SeleccionarTodo;
end;

procedure TfrmPerfiles.tbLimpiarCondicionClick(Sender: TObject);
begin
  fraPerfilPreventorABM.Limpiar;
end;

procedure TfrmPerfiles.tbGuardarClick(Sender: TObject);
begin
  if fraPerfilPreventorABM.Validar then
  begin
    fraPerfilPreventorABM.GuardarGeneral(FPerfilAlta);
    fpCondicion.ModalResult := mrOk;
  end;
end;

procedure TfrmPerfiles.tbSalirPerfilClick(Sender: TObject);
begin
  fpCondicion.ModalResult := mrOk;
end;

procedure TfrmPerfiles.CargarCondiciones(aIdPerfil: integer);
var
  i: Integer;
  ts: TTabSheet;
begin
  while pcCondiciones.ControlCount > 0 do
    pcCondiciones.Controls[0].Free;

  with GetQuery('select *' +
                 ' from hys.hpc_perfilcondicion' +
                ' where pc_idperfil = ' + SqlValue(aIdPerfil) +
                ' order by pc_id') do
  try
    i := 0;
    while not Eof do
    begin
      Inc(i);
      ts := TTabSheet.Create(pcCondiciones);
      ts.PageControl := pcCondiciones;
      ts.Caption := 'Condición ' + IntToStr(i);
      with TfraPerfilPreventor.Create(ts) do
      begin
        Name := 'fraPerfilPreventor_' + fieldbyname('pc_id').AsString;
        Align := alTop;
        Parent := ts;
        Init;
        CargarGeneral(fieldbyname('pc_id').AsInteger);
        VclExtra.LockControls(gbData, True);
      end;
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmPerfiles.tbModificarCondClick(Sender: TObject);
var
  activepageindex: Integer;
begin
  if pcCondiciones.PageCount > 0 then
  begin
    if FPerfilAlta = -1 then
      FPerfilAlta := sdqConsulta.fieldbyname('PF_ID').AsInteger;

    activepageindex := pcCondiciones.ActivePageIndex;
    fraPerfilPreventorABM.Init;
    fraPerfilPreventorABM.Limpiar;
    fraPerfilPreventorABM.CargarGeneral(TfraPerfilPreventor(pcCondiciones.ActivePage.Controls[0]).IdPerfilCondicion);
    fpCondicion.ShowModal;
    CargarCondiciones(FPerfilAlta);
    pcCondiciones.ActivePageIndex := ActivePageIndex;
  end;
end;

procedure TfrmPerfiles.tbEliminarCondClick(Sender: TObject);
begin
  if pcCondiciones.PageCount > 0 then
    if MsgBox('¿ Desea eliminar la condición seleccionada ?',  MB_ICONQUESTION + MB_YESNO, 'Eliminar Condición') = IDYES then
    begin
      with TfraPerfilPreventor(pcCondiciones.ActivePage.Controls[0]) do
        EliminarGeneral(IdPerfilCondicion);
      pcCondiciones.ActivePage.free;
    end;
end;

procedure TfrmPerfiles.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if (FPerfilAlta <> -1) and not ExisteSql('select 1' +
                                            ' from hys.hpc_perfilcondicion' +
                                           ' where pc_idperfil = ' + SqlValue(FPerfilAlta)) then
    EjecutarSql('delete from hys.hpf_perfil where pf_id = ' + SqlValue(FPerfilAlta));
end;

end.
