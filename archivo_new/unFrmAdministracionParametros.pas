{-----------------------------------------------------------------------------
 Nombre Unidad: unFrmAdministracionParametros
 Autor:         cchiappero
 Fecha:         10-Sep-2005
 Proposito:     administrar los parámetros que no son de sistemas.
 Versiones:
-----------------------------------------------------------------------------}
unit unFrmAdministracionParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unFraParametroValor, VCLExtra;

type
  TfrmAdministracionParametros = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edtDescripcionParametro: TEdit;
    sb: TStatusBar;
    fraParametro: TfraParametroValor;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure cboClaseParametroChange(Sender: TObject);
  private
    procedure ControlEditables(Editables: boolean);
    procedure RefrescarParametros;
  public
    class procedure ShowParametros;
    constructor Create(AOwner: TComponent); override;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
  end;

var
  frmAdministracionParametros: TfrmAdministracionParametros;

implementation

uses unDmPrincipal, unUtilsArchivo, unCustomConsulta, unSesion, SqlFuncs, Strfuncs,
     CustomDlgs, unPrincipal;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.FormCreate(Sender: TObject);
begin
  Self.Width := Self.Width + 1;   // sinó, hay un problema con los botones de la toolbar, que cambian su funcionalidad al no estar maximizada la pantalla...

  inherited;
  FieldBaja     := 'pa_fechabaja';
  Sql.TableName := 'ARCHIVO.RPA_PARAMETRO';
  CheckPK       := False;

  RefrescarParametros;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.ClearControls;
begin
  edtDescripcionParametro.Clear;
  fraParametro.Clear;
  fraParametro.TipoParametro := 'N';
  ControlEditables(True);
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionParametros.DoABM: Boolean;
begin
   Sql.Clear;

   if ModoABM = maBaja Then begin
      if sdqConsulta.FieldByName('pa_obligatorio').asstring = 'S' then
      begin
        //Baja del parámetro actual
        Sql.PrimaryKey.Add( 'pa_id', sdqConsulta.FieldByName('pa_id').AsInteger );
        Sql.Fields.Add( 'pa_fechabaja', exDate );
        Sql.Fields.Add( 'pa_usubaja', Sesion.Usuario );
        Sql.SqlType := stUpdate;
      end;
   end else
   begin
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.AddExpression( 'pa_id', 'archivo.seq_rpa_id.nextval' );
        Sql.Fields.Add( 'pa_fechaalta', exDate );
        Sql.Fields.Add( 'pa_usualta',   Sesion.LoginName );
        Sql.Fields.Add( 'pa_descripcion', edtDescripcionParametro.Text );
        Sql.SqlType := stInsert;
      end
      else Sql.PrimaryKey.Add( 'pa_id', sdqConsulta.FieldByName('pa_id').AsInteger );
      Sql.Fields.Add( 'pa_valor', fraParametro.Valor);
   end;

   Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.LoadControls;
begin
  edtDescripcionParametro.Text := sdqConsulta.FieldByName('pa_descripcion').AsString;
  fraParametro.TipoParametro   := sdqConsulta.FieldByName('pa_tipo').AsString;
  fraParametro.Valor           := sdqConsulta.FieldByName('pa_valor').AsString;
  ControlEditables(false);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.tbRefrescarClick(Sender: TObject);
begin
  RefrescarParametros;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.cboClaseParametroChange(Sender: TObject);
begin
  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.RefrescarParametros;
begin
  if not sdqConsulta.Active then
    OpenQuery(sdqConsulta)
  else
    sdqConsulta.Refresh;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.ControlEditables(Editables : boolean);
begin
  VCLExtra.LockControls([edtDescripcionParametro,
                         fraParametro.fraTipoDatoParametro.edCodigo,
                         fraParametro.fraTipoDatoParametro.cmbDescripcion], not Editables);

  fpAbm.Height := fraParametro.Top + fraParametro.Height + btnAceptar.Height + 15;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.tbNuevoClick(Sender: TObject);
begin
  ControlEditables(true);
  inherited;
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionParametros.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Parámetros',
                                edtDescripcionParametro, not IsEmptyString(edtDescripcionParametro.Text), 'Debe especificar una descripción para el parámetro',
                                fraParametro.fraTipoDatoParametro.edCodigo, fraParametro.IsSelected, 'Debe seleccionar un tipo y valor para el parámetro'
                              ]);
end;
{------------------------------------------------------------------------------}
class procedure TfrmAdministracionParametros.ShowParametros;
begin
  with TfrmAdministracionParametros.Create(nil) do
    try
      ShowModal;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
constructor TfrmAdministracionParametros.Create(AOwner: TComponent);
begin
  inherited;
  Self.FormStyle := fsNormal;
  Self.Hide;
end;
{------------------------------------------------------------------------------}
end.

