unit unManEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManEventos = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    lbDescripcion: TLabel;
    cbMuestraEstableci: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManEventos: TfrmManEventos;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, SqlOracle,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql;
{$R *.dfm}
procedure TfrmManEventos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TE_FECHABAJA';
  Sql.TableName := 'HYS.HTE_TIPOEVENTO';
end;

procedure TfrmManEventos.ClearControls;
begin
  inherited;
//  edCodigo.Clear;
//  VCLExtra.LockControls([edCodigo], true);
  edDescripcion.Clear;
  cbMuestraEstableci.Checked := False;
end;

function TfrmManEventos.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TE_ID').AsInteger;
      Sql.Fields.Add('TE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TE_DESCRIPCION', edDescripcion.Text);
      if cbMuestraEstableci.Checked then
        Sql.Fields.Add('TE_MUESTRACUIT', 'S')
      else
        Sql.Fields.Add('TE_MUESTRACUIT', 'N');
      Sql.Fields.Add('TE_MANUAL', 'S');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HTE_ID');
        Sql.Fields.Add('TE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TE_ID').AsInteger;
        Sql.Fields.Add('TE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TE_USUBAJA', exNull );
        Sql.Fields.Add('TE_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TE_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManEventos.LoadControls;
begin
  inherited;
  ClearControls;
  edDescripcion.Text := sdqConsulta.FieldByName('TE_DESCRIPCION').AsString;
  cbMuestraEstableci.Checked := sdqConsulta.FieldByName('TE_MUESTRACUIT').AsString = 'S';
end;

function TfrmManEventos.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;
end.

