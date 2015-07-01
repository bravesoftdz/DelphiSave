unit unManObservacionesSubLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManObservacionesSubLotes = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    lbDescripcion: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    ShortCutControl1: TShortCutControl;
    cbAutomatico: TCheckBox;
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
  frmManObservacionesSubLotes: TfrmManObservacionesSubLotes;

implementation

{$R *.dfm}

uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

procedure TfrmManObservacionesSubLotes.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  cbAutomatico.Checked := False;
  VCLExtra.LockControls([edCodigo,cbAutomatico], True);
  VCLExtra.LockControls([edDescripcion], False);
end;

function TfrmManObservacionesSubLotes.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('TO_ID').AsInteger;
      Sql.Fields.Add('TO_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('TO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('TO_DESCRIPCION', edDescripcion.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HTO_ID');
        Sql.Fields.Add('TO_USUALTA', Sesion.UserID );
        Sql.Fields.Add('TO_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TO_ID').AsInteger;
        Sql.Fields.Add('TO_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('TO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TO_USUBAJA', exNull );
        Sql.Fields.Add('TO_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('TO_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManObservacionesSubLotes.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'TO_FECHABAJA';
  Sql.TableName := 'HYS.HTO_TIPOOBSERVACIONSUBLOTE';
end;

procedure TfrmManObservacionesSubLotes.LoadControls;
begin
  inherited;
  ClearControls;
  VCLExtra.LockControls([edDescripcion], sdqConsulta.FieldByName('TO_TIPO').AsString = 'A');
  cbAutomatico.Checked := sdqConsulta.FieldByName('TO_TIPO').AsString = 'A';
  edCodigo.Text := sdqConsulta.FieldByName('TO_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('TO_DESCRIPCION').AsString;
end;

function TfrmManObservacionesSubLotes.Validar: Boolean;
begin
  Result := True;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
end;

end.
