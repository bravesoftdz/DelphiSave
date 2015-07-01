unit unNotificacionSiniestros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, PatternEdit, unDmPrincipal, unSesion,
  SqlFuncs, CustomDlgs, Internet, AnsiSql;

type
  TfrmNotificacionSiniestros = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    edEmail: TPatternEdit;
    Label2: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FSQL: String;
    function getContrato: integer;
    procedure setContrato(const Value: integer);
  public
    property Contrato: integer read getContrato write setContrato; 
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  end;

var
  frmNotificacionSiniestros: TfrmNotificacionSiniestros;

implementation

uses unCustomConsulta;

{$R *.dfm}

{ TfrmNotificacionSiniestros }

procedure TfrmNotificacionSiniestros.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  edEmail.Clear;
end;

function TfrmNotificacionSiniestros.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('NS_ID').AsInteger;
      Sql.Fields.Add('NS_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('NS_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('NS_CONTRATO', fraEmpresa.Contrato);
      Sql.Fields.Add('NS_EMAIL', edEmail.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HNS_ID');
        Sql.Fields.Add('NS_USUALTA', Sesion.UserID );
        Sql.Fields.Add('NS_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('NS_ID').AsInteger;
        Sql.Fields.Add('NS_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('NS_FECHAMODIF', exDateTime );
        Sql.Fields.Add('NS_USUBAJA', exNull );
        Sql.Fields.Add('NS_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('NS_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmNotificacionSiniestros.LoadControls;
begin
  inherited;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('NS_CONTRATO').AsInteger;
  edEmail.Text := sdqConsulta.FieldByName('NS_EMAIL').AsString;
end;

function TfrmNotificacionSiniestros.Validar: Boolean;
begin
  inherited;
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
  Verificar(edEmail.Text = '', edEmail, 'Debe completar un e-mail');
  Verificar(not IsEMail(edEmail.Text), edEmail, 'El e-mail es incorrecto');
  result := true;
end;

procedure TfrmNotificacionSiniestros.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  FieldBaja := 'NS_FECHABAJA';
  Sql.TableName := 'HYS.HNS_NOTIFICACIONSINIESTRO';
  fraEmpresa.ShowBajas := True;
  fraEmpresaFiltro.ShowBajas := True;
end;

procedure TfrmNotificacionSiniestros.RefreshData;
begin
  if fraEmpresaFiltro.IsSelected then
    FSQL := FSQL + ' AND NS_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);
  sdqConsulta.SQL.Text := FSQL;
  inherited;
end;

function TfrmNotificacionSiniestros.getContrato: integer;
begin
  result := fraEmpresaFiltro.Contrato;
end;

procedure TfrmNotificacionSiniestros.setContrato(const Value: integer);
begin
  fraEmpresaFiltro.Contrato := Value;
end;

end.
