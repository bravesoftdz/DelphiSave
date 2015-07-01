unit unManTipoValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unManCtbTablas, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask;

type
  TfrmManTipoValor = class(TfrmManCtbTablas)
    chkEspecial1: TCheckBox;
    chkEspecial2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure DoABMAddFields; override;
  public
  end;
var
  frmManTipoValor: TfrmManTipoValor;

implementation

uses unPrincipal, AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManCtbTablas1 }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.ClearControls;
begin
  inherited;

  chkEspecial1.Checked := False;
  chkEspecial2.Checked := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.DoABMAddFields;
begin
  inherited;

  Sql.Fields.Add( 'TB_ESPECIAL1', chkEspecial1.Checked );
  Sql.Fields.Add( 'TB_ESPECIAL2', chkEspecial2.Checked );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.LoadControls;
begin
  inherited;

  chkEspecial1.Checked := (sdqConsulta.FieldByName( 'TB_ESPECIAL1' ).AsString = SQL_TRUE);
  chkEspecial2.Checked := (sdqConsulta.FieldByName( 'TB_ESPECIAL2' ).AsString = SQL_TRUE);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'TVAL';

  tbModificar.Visible := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Fields.Clear ;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoValor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmManTipoValor := nil;
end;

end.

