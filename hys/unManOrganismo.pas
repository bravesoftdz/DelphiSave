unit unManOrganismo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManOrganismo = class(TfrmCustomGridABM)
    Label1: TLabel;
    edDESCRIPCION: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManOrganismo: TfrmManOrganismo;

implementation

uses unSesion, sqlFuncs, unDmPrincipal, CustomDlgs, Strfuncs,
  unCustomConsulta, unManSectores;

{$R *.dfm}

procedure TfrmManOrganismo.ClearControls;
begin
  edDESCRIPCION.Clear;
end;

function TfrmManOrganismo.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MO_ID').AsInteger;
      Sql.Fields.Add('MO_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MO_DESCRIPCION', edDESCRIPCION.Text);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HMO_ID');
        Sql.Fields.Add('MO_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MO_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('TR_ID').AsInteger;
        Sql.Fields.Add('MO_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MO_USUBAJA', exNull );
        Sql.Fields.Add('MO_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MO_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmManOrganismo.FormCreate;
begin
  inherited;
  FieldBaja := 'MO_FECHABAJA';
  Sql.TableName := ' HYS.HMO_MANORGANISMO';
end;

procedure TfrmManOrganismo.LoadControls;
begin
  inherited;
  ClearControls;
  edDESCRIPCION.Text := sdqConsulta.FieldByName('MO_DESCRIPCION').AsString;
end;

function TfrmManOrganismo.Validar : Boolean;
begin
  Result := True;
  Verificar( IsEmptyString(edDESCRIPCION.Text),edDESCRIPCION, 'Debe completar la descripción.');
end;


end.
