unit unManObservacionesRecalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio, Mask,
  unSesion;

type

  TfrmManObsRecalculo = class(TfrmCustomGridABM)
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
procedure TfrmManObsRecalculo.ClearControls;
begin
  edID.Clear;
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManObsRecalculo.DoABM: Boolean;
begin
   Sql.Clear ;
   if ModoABM = maBaja Then
   begin
      Sql.PrimaryKey.Add ('or_id', sdqConsulta.FieldByName ('or_id').AsInteger);
      Sql.Fields.Add ('or_fechabaja', exDate);
      Sql.Fields.Add ('or_usubaja', Sesion.UserID);
      Sql.SqlType := stUpdate;
   end
   else begin
      if ModoABM = maAlta Then begin
        Sql.PrimaryKey.AddExpression ('or_id', 'EMI.SEQ_IOR_ID.NEXTVAL');
        Sql.Fields.Add ('or_fechaalta', exDateTime);
        Sql.Fields.Add ('or_usualta', Sesion.UserID);
        Sql.SqlType := stInsert;
        end
      else begin
         if ModoABM = maModificacion then
         begin
           Sql.PrimaryKey.Add( 'or_id', sdqConsulta.FieldByName('or_id').AsInteger);
           Sql.Fields.Add( 'or_fechamodif', exDateTime);
           Sql.Fields.Add( 'or_usumodif', Sesion.UserID);
           Sql.Fields.Add ('or_fechabaja', ExNull);
           Sql.Fields.Add ('or_usubaja', ExNull);
           Sql.SqlType := stUpdate;
         end;
      end;

      Sql.Fields.Add ('or_descripcion', edDescripcion.Text);
   end;

   Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManObsRecalculo.LoadControls;
begin
  edID.Text              := sdqConsulta.FieldByName ('or_id').AsString;
  edDescripcion.Text     := sdqConsulta.FieldByName ('or_descripcion').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManObsRecalculo.Validar: Boolean;
begin
  Result := False;

  if Trim (edDescripcion.Text) = '' Then
    InvalidMsg (edDescripcion, 'La descripción es obligatoria')
  else
    Result := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManObsRecalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManObsRecalculo.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManObsRecalculo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'emi.ior_observacionrecalculo';
  FieldBaja     := 'or_fechabaja';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

