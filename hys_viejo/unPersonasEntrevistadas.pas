unit unPersonasEntrevistadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmPersonasEntrevistadas = class(TfrmCustomGridABM)
    lbNombre: TLabel;
    edNombre: TEdit;
    lbCargo: TLabel;
    edCargo: TEdit;
    
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDErgonomia : Integer;
    procedure Cargar(idErgonomia : Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmPersonasEntrevistadas: TfrmPersonasEntrevistadas;

implementation

uses unCustomConsulta,VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs;

{$R *.dfm}

{ TfrmPersonasEntrevistadas }

procedure TfrmPersonasEntrevistadas.Cargar(idErgonomia: Integer);
begin
  FidErgonomia := idErgonomia;
  if sdqConsulta.Active then
    sdqConsulta.Close;
  sdqConsulta.ParamByName('idergonomia').AsInteger := FIDErgonomia;
  sdqConsulta.Open;
end;

procedure TfrmPersonasEntrevistadas.ClearControls;
begin
  inherited;
  edNombre.Clear;
  edCargo.Clear;
end;

function TfrmPersonasEntrevistadas.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('PE_ID').AsInteger;
      Sql.Fields.Add('PE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('PE_IDERGONOMIA', FIDErgonomia);
      Sql.Fields.Add('PE_NOMBRE', edNombre.Text);
      Sql.Fields.Add('PE_CARGO', edCargo.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HPE_ERG_ID');
        Sql.Fields.Add('PE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('PE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('PE_ID').AsInteger;
        Sql.Fields.Add('PE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('PE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('PE_USUBAJA', exNull );
        Sql.Fields.Add('PE_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('PE_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar las Personas Entrevistadas.');
    end;
  end;
end;

procedure TfrmPersonasEntrevistadas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'PE_FECHABAJA';
  Sql.TableName := 'HYS.hpe_personasentrevistadaserg';
  sdqConsulta.ParamByName('idergonomia').AsInteger := FIDErgonomia;
end;

procedure TfrmPersonasEntrevistadas.LoadControls;
begin
  inherited;
  ClearControls;
  edNombre.Text := sdqConsulta.FieldByName('PE_NOMBRE').AsString;
  edCargo.Text  := sdqConsulta.FieldByName('PE_CARGO').AsString;

end;

function TfrmPersonasEntrevistadas.Validar: Boolean;
begin
  Verificar(edNombre.Text = '',edNombre,'Debe Cargar el Nombre');
  Verificar(edCargo.Text = '',edCargo,'Debe Cargar el Cargo');

  Result := True;
end;

end.
