unit unManParametrosManualesMail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManParametrosManuales, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unDmprincipal, unCustomGridABM;

type
  TfrmManParametrosManualesMail = class(TfrmManParametrosManuales)
    procedure FormCreate(Sender: TObject);
  private
    FIdGestionable: integer;
    FIdModoNotificacion: integer;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property IdGestionable: integer read FIdGestionable write FIdGestionable;
    property IdModoNotificacion: integer read FIdModoNotificacion write FIdModoNotificacion;
    procedure Cargar;
  end;

var
  frmManParametrosManualesMail: TfrmManParametrosManualesMail;

implementation

uses
  unCustomConsulta, CustomDlgs, unSesion, SqlFuncs;

{$R *.dfm}

{ TfrmManParametrosManualesMail }

procedure TfrmManParametrosManualesMail.Cargar;
begin
  sdqConsulta.ParamByName('idgestionable').AsInteger := FIdGestionable;
  sdqConsulta.ParamByName('idmodonotificacion').AsInteger := FIdModoNotificacion;
  RefreshData;
end;

procedure TfrmManParametrosManualesMail.ClearControls;
begin
  inherited;
  edNombre.Clear;
  edValorDefecto.Clear;
  chkObligatorio.Checked := false;
  edNombre.Enabled := (ModoABM = maAlta);
end;

function TfrmManParametrosManualesMail.DoABM: Boolean;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('mp_id', sdqConsulta.FieldByName('MP_id').AsInteger);
      Sql.Fields.Add('mp_usubaja', Sesion.UserID );
      Sql.Fields.Add('mp_fechabaja', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('mp_idgestionable', FIdGestionable);
      Sql.Fields.Add('mp_idmodonotificacion', FIdModoNotificacion);
      Sql.Fields.Add('mp_nombre', edNombre.Text);
      Sql.Fields.Add('mp_valordefecto', edValorDefecto.Text);
      if chkObligatorio.Checked then
        Sql.Fields.Add('mp_obligatorio', 'S')
      else
        Sql.Fields.Add('mp_obligatorio', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.AddExpression('mp_id', 'EMI.SEQ_IMP_MAILPARAMETRO.NEXTVAL' );
        Sql.Fields.Add('MP_usualta', Sesion.UserID );
        Sql.Fields.Add('MP_fechaalta', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('mp_id', sdqConsulta.FieldByName('MP_id').AsInteger);
        Sql.Fields.Add('mp_usumodif', Sesion.UserID);
        Sql.Fields.Add('mp_fechamodif', exDateTime );
        Sql.Fields.Add('mp_usubaja', exNull );
        Sql.Fields.Add('mp_fechabaja', exNull );
      end;
    end;
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el parámetro.');
    end;
  end;
end;

procedure TfrmManParametrosManualesMail.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'EMI.IMP_MAILPARAMETRO';
  FieldBaja     := 'MP_FECHABAJA';
end;

procedure TfrmManParametrosManualesMail.LoadControls;
begin
  inherited;
  edNombre.Text := sdqConsulta.FieldByName('MP_NOMBRE').AsString;
  edValorDefecto.Text := sdqConsulta.FieldByName('MP_VALORDEFECTO').AsString;
  chkObligatorio.Checked := sdqConsulta.FieldByName('MP_OBLIGATORIO').AsString = 'S';
  edNombre.Enabled := (ModoABM = maAlta);
end;

function TfrmManParametrosManualesMail.Validar: Boolean;
begin
  Verificar(trim(edNombre.Text)= '', edNombre, 'Debe ingresar un nombre.');
  Verificar(Pos(' ', edNombre.Text) > 0, edNombre, 'El nombre no puede tener espacios.');
  Verificar(ExisteSqlEx('select 1 from emi.imp_mailparametro where mp_nombre = :nombre', [edNombre.Text]), edNombre, 'Ya existe un parámetro con este nombre');
  Result := true;
end;

end.

