unit unFrmAdministracionAjustes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABMDetalle, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, PatternEdit,SqlFuncs, DBSql,
  unCustomGridABM;

type
  TfrmAdministracionAjustes = class(TfrmCustomGridABMDetalle)
    lblMovimiento: TLabel;
    LblReversion: TLabel;
    LblEmpareja: TLabel;
    lblSigno: TLabel;
    fraMovimiento: TfraCodigoDescripcion;
    fraReversion: TfraCodigoDescripcion;
    fraEmpareja: TfraCodigoDescripcion;
    cmbSigno: TComboBox;
    lblNroAjuste: TLabel;
    lblDescripcion: TLabel;
    LblModo: TLabel;
    edNroAjuste: TPatternEdit;
    edDescripcionAjuste: TEdit;
    rbManual: TRadioButton;
    rbAutomatico: TRadioButton;
    procedure FormCreate(Sender: TObject);
  protected
    procedure LoadQueryDetalle; override;
    procedure InicializarDetalle; override;
  public

    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;

    function DoABMDetalle: Boolean; override;
    function ValidarDetalle: Boolean; override;
    procedure ClearControlsDetalle; override;
    procedure LoadControlsDetalle; override;
  end;

var
  frmAdministracionAjustes: TfrmAdministracionAjustes;

implementation

uses unDmEmision, CustomDlgs, Strfuncs, unDmPrincipal, unSesion,
  AnsiSql, Clipbrd, unCustomConsulta;

{$R *.dfm}

procedure TfrmAdministracionAjustes.ClearControls;
begin
  inherited;

  edNroAjuste.Clear;
  edDescripcionAjuste.Clear;

end;

function TfrmAdministracionAjustes.DoABM: Boolean;
var
  sModo: string;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('AJ_ID', sdqConsulta.FieldByName('AJ_ID').AsInteger );
      Sql.Fields.Add('AJ_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('AJ_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('AJ_DESCRIPCION', edDescripcionAjuste.Text);

      if rbManual.Checked then sModo := 'M'
      else sModo := 'A';
      Sql.Fields.Add('AJ_MODO', sModo);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('AJ_ID', GetSecNextVal('emi.seq_iaj_id'));
        Sql.Fields.Add('AJ_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('AJ_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('AJ_ID', sdqConsulta.FieldByName('AJ_ID').AsInteger);
        Sql.Fields.Add('AJ_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('AJ_FECHAMODIF', exDateTime );
        Sql.Fields.Add('AJ_USUBAJA', exNull );
        Sql.Fields.Add('AJ_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el ajuste.');
    end;
  end;
end;

procedure TfrmAdministracionAjustes.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'AJ_FECHABAJA';
  FieldBajaDetalle := 'MA_FECHABAJA';
  Sql.TableName := 'EMI.IAJ_AJUSTE';
  SqlDetalle.TableName := 'EMI.IMA_MOVIMIENTOAJUSTE';
end;

procedure TfrmAdministracionAjustes.LoadControls;
begin
  inherited;
  edNroAjuste.Text := sdqConsulta.fieldbyname('AJ_ID').AsString;
  edDescripcionAjuste.Text := sdqConsulta.fieldbyname('AJ_DESCRIPCION').AsString;

  if sdqConsulta.fieldbyname('AJ_MODO').AsString = 'M' then
  begin
     rbManual.Checked := True;
     rbAutomatico.Checked := False;
  end;
  if sdqConsulta.fieldbyname('AJ_MODO').AsString = 'A' then
  begin
     rbManual.Checked := False;
     rbAutomatico.Checked := True;
  end;
end;

function TfrmAdministracionAjustes.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Ajustes',
                                  edDescripcionAjuste, not IsEmptyString(edDescripcionAjuste.text), 'Debe especificar la descripción del ajuste.'
                            ]);
end;

procedure TfrmAdministracionAjustes.LoadQueryDetalle;
begin
  sdqConsultaDetalle.ParamByName('ID').AsInteger := sdqConsulta.fieldbyname('AJ_ID').AsInteger;
  inherited;
end;

function TfrmAdministracionAjustes.DoABMDetalle: Boolean;
var
  sSigno: string;
begin
  SqlDetalle.Clear;
  if ModoABMDetalle = maBaja Then
  begin
    SqlDetalle.PrimaryKey.Add('MA_ID', sdqConsultaDetalle.FieldByName('MA_ID').AsInteger );

    SqlDetalle.Fields.Add('MA_USUBAJA', Sesion.UserID );
    SqlDetalle.Fields.Add('MA_FECHABAJA', exDateTime );
    SqlDetalle.SqlType := stUpdate;
  end else begin
    SqlDetalle.Fields.Add('MA_IDCODIGOMOVIMIENTO', fraMovimiento.ID);
    SqlDetalle.Fields.Add('MA_IDCODIGOREVERSION', fraReversion.ID);
    SqlDetalle.Fields.Add('MA_IDCODIGOMOVIMIENTOEMPAREJA', fraEmpareja.ID);
    sqlDetalle.Fields.Add('MA_IDAJUSTE', sdqConsulta.FieldByName('AJ_ID').AsInteger );

    Case cmbSigno.ItemIndex of
      0 : sSigno := 'P';
      1 : sSigno := 'N';
      2 : sSigno := 'A';
    end;
    SqlDetalle.Fields.Add('MA_SIGNO', sSigno);

    if ModoABMDetalle = maAlta Then
    begin
      SqlDetalle.PrimaryKey.Add('MA_ID', GetSecNextVal('emi.seq_ima_id'));
      SqlDetalle.Fields.Add('MA_USUALTA', Sesion.UserID );
      SqlDetalle.Fields.Add('MA_FECHAALTA', exDateTime );
    end else begin
      SqlDetalle.PrimaryKey.Add('MA_ID', sdqConsultaDetalle.FieldByName('MA_ID').AsInteger);
//        SqlDetalle.Fields.Add('MA_USUMODIF', Sesion.LoginName);
//        SqlDetalle.Fields.Add('MA_FECHAMODIF', exDateTime );
      SqlDetalle.Fields.Add('MA_USUBAJA', exNull );
      SqlDetalle.Fields.Add('MA_FECHABAJA', exNull );
    end;
  end;

  Result := inherited DoABMDetalle;
end;

function TfrmAdministracionAjustes.ValidarDetalle: Boolean;
begin
  Result := VerificarMultiple(['Administración de movimientos de ajustes',
                                  fraMovimiento.edCodigo, not IsEmptyString(fraMovimiento.Codigo), 'Debe especificar el movimiento.'
                            ]);
end;

procedure TfrmAdministracionAjustes.ClearControlsDetalle;
begin
  fraMovimiento.Clear;
  fraReversion.Clear;
  fraEmpareja.Clear;
end;

procedure TfrmAdministracionAjustes.LoadControlsDetalle;
var
  sSigno: string;
begin
  fraMovimiento.Value := sdqConsultaDetalle.fieldbyname('MA_IDCODIGOMOVIMIENTO').AsInteger;
  fraReversion.Value := sdqConsultaDetalle.fieldbyname('MA_IDCODIGOREVERSION').AsInteger;
  fraEmpareja.Value := sdqConsultaDetalle.fieldbyname('MA_IDCODIGOMOVIMIENTOEMPAREJA').AsInteger;
  sSigno := sdqConsultaDetalle.fieldbyname('MA_SIGNO').AsString;
  if sSigno = 'P' then cmbSigno.ItemIndex := 0;
  if sSigno = 'N' then cmbSigno.ItemIndex := 1;
  if sSigno = 'A' then cmbSigno.ItemIndex := 2;
end;

procedure TfrmAdministracionAjustes.InicializarDetalle;
begin
  with fraMovimiento do
  begin
    TableName   := 'COB.ZCM_CODIGOMOVIMIENTO';
    FieldID     := 'cm_id';
    FieldCodigo := 'cm_codigo';
    FieldDesc   := 'cm_descripcion';
    FieldBaja   := 'cm_fechabaja';
    ShowBajas := True;
  end;

  with fraReversion do
  begin
    TableName   := 'COB.ZCM_CODIGOMOVIMIENTO';
    FieldID     := 'cm_id';
    FieldCodigo := 'cm_codigo';
    FieldDesc   := 'cm_descripcion';
    FieldBaja   := 'cm_fechabaja';
    ShowBajas := True;
  end;

  with fraEmpareja do
  begin
    TableName   := 'COB.ZCM_CODIGOMOVIMIENTO';
    FieldID     := 'cm_id';
    FieldCodigo := 'cm_codigo';
    FieldDesc   := 'cm_descripcion';
    FieldBaja   := 'cm_fechabaja';
    ShowBajas := True;
  end;
end;

end.
