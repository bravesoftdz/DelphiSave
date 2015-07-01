unit unManARS_RESPUESTASOLICREAFILIACION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt;

type
  TfrmManARS_RESPUESTASOLICREAFILIACION = class(TfrmCustomGridABM)
    Label1: TLabel;
    edDetalle: TEdit;
    Label2: TLabel;
    fraMotivoSolicitud: TfraCodDesc;
    rgGrupo: TRadioGroup;
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    procedure SetIndexDeGrupo(const aCharGrupo: String);
    function SeleccionarCharDeGrupo: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManARS_RESPUESTASOLICREAFILIACION: TfrmManARS_RESPUESTASOLICREAFILIACION;

implementation

uses
  unSesion, unDmPrincipal, CustomDlgs;

{$R *.DFM}

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.ClearControls;
begin
  edDetalle.Clear;
  fraMotivoSolicitud.Clear;
  rgGrupo.ItemIndex := -1;
end;

function TfrmManARS_RESPUESTASOLICREAFILIACION.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'ars_respuestasolicreafiliacion';

  if ModoABM = maBaja then
  begin
    iId := sdqConsulta.FieldByName('rs_id').AsInteger;
    Sql.Fields.Add('rs_usubaja',    Sesion.UserID);
    Sql.Fields.Add('rs_fechabaja', 'SYSDATE', False);
    
    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      iId := ValorSql('SELECT afi.seq_ars_id.NEXTVAL FROM DUAL');
      Sql.Fields.Add('rs_usualta',    Sesion.UserID);
      Sql.Fields.Add('rs_fechaalta', 'SYSDATE', False);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('rs_id').AsInteger;
      Sql.Fields.Add('rs_usumodif',   Sesion.UserID);
      Sql.Fields.Add('rs_fechamodif', 'SYSDATE', False);
      Sql.Fields.Add('rs_usubaja',    'NULL', False);
      Sql.Fields.Add('rs_fechabaja',  'NULL', False);
    end;
    Sql.Fields.Add('rs_detalle',     edDetalle.Text);
    Sql.Fields.Add('rs_idsolicitud', fraMotivoSolicitud.Value);
    Sql.Fields.AddString('rs_tipo', SeleccionarCharDeGrupo, True);
  end;
  Sql.PrimaryKey.Add('rs_id', iId, False);

  BeginTrans;
  try
    EjecutarSqlSt(Sql.Sql);
    CommitTrans;
    Result := True;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.LoadControls;
begin
  with sdqConsulta do
  begin
    edDetalle.Text           := FieldByName('rs_detalle').AsString;
    fraMotivoSolicitud.Value := FieldByName('rs_idsolicitud').AsInteger;
    SetIndexDeGrupo(FieldByName('rs_tipo').AsString);
  end;
end;

function TfrmManARS_RESPUESTASOLICREAFILIACION.SeleccionarCharDeGrupo: String;
begin
  case rgGrupo.ItemIndex of
  0 : Result := 'A';
  1 : Result := 'R';
  2 : Result := 'C';
  else
    Result := '';
  end;

end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.SetIndexDeGrupo(
  const aCharGrupo: String);
begin
  if aCharGrupo = 'A' then
    rgGrupo.ItemIndex := 0
  else
  if aCharGrupo = 'R' then
    rgGrupo.ItemIndex := 1
  else
  if aCharGrupo = 'C' then
    rgGrupo.ItemIndex := 2
  else
    rgGrupo.ItemIndex := -1;

end;

function TfrmManARS_RESPUESTASOLICREAFILIACION.Validar: Boolean;
begin
  Verificar((edDetalle.Text = ''), edDetalle, 'El motivo es obligatorio.');
  Verificar(fraMotivoSolicitud.IsEmpty, fraMotivoSolicitud.edCodigo, 'El motivo de la solicitud es obligatoria.');


  Result := True;
end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                                  var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'rs_fechabaja';
end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rs_fechabaja').IsNull, Grid, 'No se puede modificar un registro dado de baja.');

  inherited;
end;

procedure TfrmManARS_RESPUESTASOLICREAFILIACION.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rs_fechabaja').IsNull, Grid, 'No se puede eliminar un registro dado de baja.');

  inherited;
end;

end.
