unit unManSolicitantesNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio, Mask;

type

  TfrmManSolicitantesNota = class(TfrmCustomGridABM)
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
procedure TfrmManSolicitantesNota.ClearControls;
begin
  edID.Clear;
  edDescripcion.Clear;

  // Habilito el control
  edDescripcion.ReadOnly  := False;
  edDescripcion.Color     := clWindow;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManSolicitantesNota.DoABM: Boolean;
begin
   Sql.Clear ;
   if ModoABM = maBaja Then begin
      Sql.PrimaryKey.Add ('sn_id', sdqConsulta.FieldByName ('sn_id').AsInteger);
      Sql.Fields.Add ('sn_fechabaja', exDate);
      Sql.Fields.Add ('sn_usubaja', frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
   end else begin
      if ModoABM = maAlta Then begin
        Sql.PrimaryKey.AddExpression ('sn_id', 'EMI.SEQ_ISN_ID.NEXTVAL');
        Sql.Fields.Add ('sn_fechaalta', exDate);
        Sql.Fields.Add ('sn_usualta',   frmPrincipal.DBLogin.UserID);
        Sql.SqlType := stInsert;
      end;

      Sql.Fields.Add ('sn_descripcion', edDescripcion.Text);
   end;

   Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSolicitantesNota.LoadControls;
begin
  edID.Text              := sdqConsulta.FieldByName ('sn_id').AsString;
  edDescripcion.Text     := sdqConsulta.FieldByName ('sn_descripcion').AsString;

  // Inhabilito el control
  edDescripcion.Color     := clBtnFace;
  edDescripcion.ReadOnly  := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManSolicitantesNota.Validar: Boolean;
begin
  Result := False;

  if Trim (edDescripcion.Text) = '' Then
    InvalidMsg (edDescripcion, 'La descripción es obligatoria')
  else
    Result := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSolicitantesNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuOtrosSolicitantesNota.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSolicitantesNota.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSolicitantesNota.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'emi.isn_solicitantesnota';
  FieldBaja     := 'sn_fechabaja';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

