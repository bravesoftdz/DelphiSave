unit unManITN_TIPONOMINA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, PatternEdit, IntEdit, unArtFrame, unFraDomicilio, Mask,
  unFraDomicilioTrab;

type

  TfrmManITN_TIPONOMINA = class(TfrmCustomGridABM)
    Label4: TLabel;
    edTN_ID: TEdit;
    edTN_DESCRIPCION: TEdit;
    Label1: TLabel;
    chTN_ESPORDEFECTO: TCheckBox;
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
procedure TfrmManITN_TIPONOMINA.ClearControls;
begin
  edTN_ID.Clear;
  edTN_DESCRIPCION.Clear;
  chTN_ESPORDEFECTO.Checked := False;

  // Habilito el control
  edTN_DESCRIPCION.ReadOnly  := False;
  edTN_DESCRIPCION.Color     := clWindow;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManITN_TIPONOMINA.DoABM: Boolean;
begin
   Sql.Clear ;
   if ModoABM = maBaja Then begin
      Sql.PrimaryKey.Add( 'TN_ID', sdqConsulta.FieldByName('TN_ID').AsInteger );
      Sql.Fields.Add( 'TN_FECHABAJA', exDate );
      Sql.Fields.Add( 'TN_USUBAJA',   frmPrincipal.DBLogin.UserID );
      Sql.SqlType := stUpdate;
   end else begin
      if ModoABM = maAlta Then begin
        Sql.PrimaryKey.AddExpression( 'TN_ID', 'SEQ_ITN_ID.NEXTVAL' );
        Sql.Fields.Add( 'TN_FECHAALTA', exDate );
        Sql.Fields.Add( 'TN_USUALTA',   frmPrincipal.DBLogin.UserID );
        Sql.SqlType := stInsert;
      end;

      Sql.Fields.Add( 'TN_DESCRIPCION', edTN_DESCRIPCION.Text );
      Sql.Fields.Add( 'TN_ESPORDEFECTO', chTN_ESPORDEFECTO.Checked );
   end;

   Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManITN_TIPONOMINA.LoadControls;
begin
  edTN_ID.Text              := sdqConsulta.FieldByName('TN_ID').AsString;
  edTN_DESCRIPCION.Text     := sdqConsulta.FieldByName('TN_DESCRIPCION').AsString;
  chTN_ESPORDEFECTO.Checked := (sdqConsulta.FieldByName('TN_ESPORDEFECTO').AsString = 'S');

  // Inhabilito el control
  edTN_DESCRIPCION.Color     := clBtnFace;
  edTN_DESCRIPCION.ReadOnly  := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManITN_TIPONOMINA.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql := 'SELECT 1 ' +
            'FROM ITN_TIPONOMINA ' +
           'WHERE TN_FECHABAJA IS NULL ' +
             'AND TN_ESPORDEFECTO=''S''';

  if Trim(edTN_DESCRIPCION.Text) = '' Then
    InvalidMsg( edTN_DESCRIPCION, 'La descripción es obligatoria' )

  else if chTN_ESPORDEFECTO.Checked and ExisteSql( sSql ) then
    InvalidMsg( edTN_DESCRIPCION, 'Ya existe un valor por defecto' )

  else
    Result := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManITN_TIPONOMINA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuManTiposNominas.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManITN_TIPONOMINA.PrintResults;
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManITN_TIPONOMINA.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'ITN_TIPONOMINA';
  FieldBaja     := 'TN_FECHABAJA';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

