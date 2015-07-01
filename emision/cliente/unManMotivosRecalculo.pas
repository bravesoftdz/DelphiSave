unit unManMotivosRecalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio, Mask,
  unSesion;

type

  TfrmManMotivoRecalculo = class(TfrmCustomGridABM)
    Label4: TLabel;
    edID: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure PrintResults; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs,
  unDmEmision;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivoRecalculo.ClearControls;
begin
  edID.Clear;
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivoRecalculo.DoABM: Boolean;
begin
   Sql.Clear ;
   if ModoABM = maBaja Then
   begin
      Sql.PrimaryKey.Add ('mp_id', sdqConsulta.FieldByName ('mp_id').AsInteger);
      Sql.Fields.Add ('mp_fechabaja', exDate);
      Sql.Fields.Add ('mp_usubaja', Sesion.UserID);
      Sql.SqlType := stUpdate;
   end
   else begin
      if ModoABM = maAlta Then begin
        Sql.PrimaryKey.AddExpression ('mp_id', 'EMI.SEQ_IPE_ID.NEXTVAL');
        Sql.Fields.Add ('mp_fechaalta', exDateTime);
        Sql.Fields.Add ('mp_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        end
      else begin
         if ModoABM = maModificacion then
         begin
           Sql.PrimaryKey.Add( 'mp_id', sdqConsulta.FieldByName('mp_id').AsInteger);
           Sql.Fields.Add( 'mp_fechamodif', exDateTime);
           Sql.Fields.Add( 'mp_usumodif', Sesion.UserID);
           Sql.Fields.Add ('mp_fechabaja', ExNull);
           Sql.Fields.Add ('mp_usubaja', ExNull);
           Sql.SqlType := stUpdate;
         end;
      end;

      Sql.Fields.Add ('mp_descripcion', edDescripcion.Text);
   end;

   Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivoRecalculo.LoadControls;
begin
  edID.Text              := sdqConsulta.FieldByName ('mp_id').AsString;
  edDescripcion.Text     := sdqConsulta.FieldByName ('mp_descripcion').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivoRecalculo.Validar: Boolean;
begin
  Result := False;

  if Trim (edDescripcion.Text) = '' Then
    InvalidMsg (edDescripcion, 'La descripción es obligatoria')
  else
    Result := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivoRecalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivoRecalculo.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivoRecalculo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'emi.imp_motivopedidorecalculo';
  FieldBaja     := 'mp_fechabaja';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

