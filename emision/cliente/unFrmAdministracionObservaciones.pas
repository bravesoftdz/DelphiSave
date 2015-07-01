unit unFrmAdministracionObservaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, ExComboBox;

type
  TfrmAdministracionObservaciones = class(TfrmCustomGridABM)
    edNroObs: TPatternEdit;
    Label18: TLabel;
    Label19: TLabel;
    edDescripcionObs: TEdit;
    Label1: TLabel;
    cmbTipoObs: TExComboBox;
    Label2: TLabel;
    cmbTipoRechazo: TExComboBox;
    chkManual: TCheckBox;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    FFiltroManual: boolean;
    { Private declarations }
  public
    property FiltroManual: boolean read FFiltroManual write FFiltroManual;
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure Filtrar;
  end;

var
  frmAdministracionObservaciones: TfrmAdministracionObservaciones;

implementation

uses unDmPrincipal, unDmEmision, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs;

{$R *.dfm}

procedure TfrmAdministracionObservaciones.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'OB_FECHABAJA';
  Sql.TableName := 'EMI.IOB_OBSERVACION';
  CheckPK := True;

  FFiltroManual := false;
end;

procedure TfrmAdministracionObservaciones.ClearControls;
begin
  inherited;
  edNroObs.Clear;
  edDescripcionObs.Clear;
  cmbTipoObs.Value := '';
  cmbTipoRechazo.Value := '';
//  chkRequiereAprobacion.Checked := false;
  chkManual.Checked := false;
end;


function TfrmAdministracionObservaciones.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('OB_ID', sdqConsulta.FieldByName('OB_ID').AsInteger );
      Sql.Fields.Add('OB_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('OB_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('OB_DESCRIPCION', edDescripcionObs.Text);
      Sql.Fields.Add('OB_TIPO', cmbTipoObs.Value);
      Sql.Fields.Add('OB_RECHAZO', cmbTipoRechazo.Value);
//      Sql.Fields.Add('OB_APROBACION', chkRequiereAprobacion.Checked);
      Sql.Fields.Add('OB_MANUAL', chkManual.Checked);
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('OB_ID', GetSecNextVal('EMI.SEQ_IOB_ID'));
        Sql.Fields.Add('OB_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('OB_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('OB_ID', sdqConsulta.FieldByName('OB_ID').AsInteger);
        Sql.Fields.Add('OB_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('OB_FECHAMODIF', exDateTime );
        Sql.Fields.Add('OB_USUBAJA', exNull );
        Sql.Fields.Add('OB_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la Observación.');
    end;
  end;
end;

procedure TfrmAdministracionObservaciones.LoadControls;
begin
  inherited;
  edNroObs.Text := sdqConsulta.fieldbyname('OB_ID').AsString;
  edDescripcionObs.Text := sdqConsulta.fieldbyname('OB_DESCRIPCION').AsString;
  cmbTipoObs.Value := sdqConsulta.fieldbyname('OB_TIPO').AsString;
  cmbTipoRechazo.Value := sdqConsulta.fieldbyname('OB_RECHAZO').AsString;
//  chkRequiereAprobacion.Checked := (sdqConsulta.fieldbyname('OB_APROBACION').AsString = 'S');
  chkManual.Checked := (sdqConsulta.fieldbyname('OB_MANUAL').AsString = 'S');
end;

function TfrmAdministracionObservaciones.Validar: Boolean;
begin
    Result := VerificarMultiple(['Administración de Observaciones',
                                  edDescripcionObs, not IsEmptyString(edDescripcionObs.text), 'Debe especificar la descripción de la Observación.',
                                  cmbTipoObs, (cmbTipoObs.Value <> '') , 'Debe especificar el tipo de Observación.',
                                  cmbTipoRechazo, (cmbTipoRechazo.Value <> '') , 'Debe especificar el tipo de rechazo.'
                                ]);
end;

procedure TfrmAdministracionObservaciones.Filtrar;
begin
  if FFiltroManual then
    sdqConsulta.SQL.Add(' AND OB_MANUAL = ''S''');
  sdqConsulta.Open;
end;

procedure TfrmAdministracionObservaciones.fpAbmShow(Sender: TObject);
begin
  inherited;
  if FFiltroManual then
  begin
    chkManual.Checked := true;
    chkManual.Enabled := false;
  end;
end;

end.
