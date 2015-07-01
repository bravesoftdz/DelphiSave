unit unManSolicitantesSitFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, CustomDlgs, unSesion, SqlFuncs;

type
  TfrmSolicitantesSitFac = class(TfrmCustomGridABM)
    Label1: TLabel;
    edSolicitante: TEdit;
    chkCerrarNota: TCheckBox;
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
  frmSolicitantesSitFac: TfrmSolicitantesSitFac;

implementation

{$R *.dfm}

{ TfrmSolicitantesSitFac }

procedure TfrmSolicitantesSitFac.ClearControls;
begin
  inherited;
  edSolicitante.Clear;
  chkCerrarNota.Checked := false;
end;

function TfrmSolicitantesSitFac.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.Fields.Add('ss_usubaja', Sesion.UserID);
      Sql.Fields.Add('ss_fechabaja', exDateTime);
      iIdCodigo := sdqConsulta.FieldByName('ss_id').AsInteger;
      Sql.PrimaryKey.Add('ss_id', iIdCodigo);
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('ss_descripcion', edSolicitante.Text);
      if chkCerrarNota.Checked then
        Sql.Fields.Add('ss_cerrarnota', 'S')
      else
        Sql.Fields.Add('ss_cerrarnota', 'N');

      Sql.Fields.Add('ss_solicitaarchivosic', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.AddExpression ('ss_id', 'emi.seq_iss_solicitantesitfac.nextval');
        Sql.Fields.Add('ss_usualta', Sesion.UserID);
        Sql.Fields.Add('ss_fechaalta', exDateTime);
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('ss_id').AsInteger;
        Sql.PrimaryKey.Add('ss_id', iIdCodigo);
        Sql.Fields.Add('ss_usumodif', Sesion.UserID);
        Sql.Fields.Add('ss_fechamodif', exDateTime);
        Sql.Fields.Add('ss_usubaja', exNull);
        Sql.Fields.Add('ss_fechabaja', exNull);
      end;
    end;
    Result := inherited DoABM;
  except
    on E: Exception do begin
       Result := false;
       ErrorMsg(E, 'Error al guardar el solicitante.');
    end;
  end;
end;

procedure TfrmSolicitantesSitFac.LoadControls;
begin
  inherited;
  edSolicitante.Text := sdqConsulta.FieldByName('ss_descripcion').AsString;
  chkCerrarNota.Checked := (sdqConsulta.FieldByName('ss_cerrarnota').AsString = 'S');
end;

function TfrmSolicitantesSitFac.Validar: Boolean;
begin
  Verificar(trim(edSolicitante.Text) = '', edSolicitante, 'Debe ingresar un solicitante');
  result := true;
end;

procedure TfrmSolicitantesSitFac.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ss_fechabaja';
  Sql.TableName := 'emi.iss_solicitantesitfac';
end;

end.
