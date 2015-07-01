unit unManInteresPorMora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, CurrEdit, Mask, ToolEdit, DateComboBox;

type
  TfrmManInteresPorMora = class(TfrmCustomGridABM)
    Label1: TLabel;
    cmbIM_VIGENCIADESDE: TDateComboBox;
    edIM_INTERES: TCurrencyEdit;
    Label2: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManInteresPorMora: TfrmManInteresPorMora;

implementation

{$R *.DFM}
Uses
  unPrincipal, unDmPrincipal, StrFuncs, SqlFuncs;

procedure TfrmManInteresPorMora.ClearControls;
begin
  cmbIM_VIGENCIADESDE.Clear;
  edIM_INTERES.Clear;
end;

procedure TfrmManInteresPorMora.LoadControls;
begin
  cmbIM_VIGENCIADESDE.Date := sdqConsulta.FieldByName('IM_VIGENCIADESDE').AsDateTime;
  edIM_INTERES.Value       := sdqConsulta.FieldByName('IM_INTERES').AsFloat;

end;

function TfrmManInteresPorMora.Validar : Boolean;
    procedure Error ( Componente: TWinControl; Mensaje: string );
    begin
      Componente.SetFocus;
      Raise Exception.Create( Mensaje );
    end;
begin
  Result := True;

  if edIM_INTERES.Value = 0 then
    Error ( edIM_INTERES, 'El interés es obligatorio' );

  if cmbIM_VIGENCIADESDE.IsEmpty then
    Error ( cmbIM_VIGENCIADESDE, 'La vigencia es obligatoria' );

end;

function TfrmManInteresPorMora.DoABM: Boolean;
begin
  Result := True;
  Sql.Clear;
  Sql.TableName := 'ZIM_INTERESMORA';
  BeginTrans;
  try
    //Siempre esta en modo alta
    Sql.PrimaryKey.Add ( 'IM_ID', 'SEQ_ZIM_ID.NEXTVAL', False);
    Sql.Fields.Add( 'IM_INTERES', edIM_INTERES.Value, dtNumber);
    Sql.Fields.Add( 'IM_VIGENCIADESDE', cmbIM_VIGENCIADESDE.Date);
    Sql.Fields.Add( 'IM_FECHAALTA', 'ACTUALDATE', False);
    Sql.Fields.Add( 'IM_USUALTA', frmPrincipal.DBLogin.UserID);
    EjecutarSqlST ( Sql.Sql );

    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      Rollback;
      Raise Exception.Create( E.Message );
    end;
  end;
end;

procedure TfrmManInteresPorMora.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT ZIM_INTERESMORA.*, TRUNC(IM_FECHAALTA) FECHAALTA ' +
          '  FROM ZIM_INTERESMORA ' +
          ' WHERE 1=1 ';
  sdqConsulta.SQL.Clear;
  sdqConsulta.Sql.Add ( sSql + SortDialog.OrderBy );
  inherited;
end;

procedure TfrmManInteresPorMora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuManInteresPorMora.Enabled := True;
  Action := caFree;
  frmManInteresPorMora := nil;
end;

procedure TfrmManInteresPorMora.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  frmPrincipal.mnuManInteresPorMora.Enabled := False;

end;

end.
