unit unManReportesWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManReportesWeb = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    cbTenerCabecera: TCheckBox;
    cbSolicitable: TCheckBox;
    edDetalle: TRichEdit;
    lbDetalle: TLabel;
    lbObservacion: TLabel;
    edObservacion: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    fraPropietario: TfraCodigoDescripcion;
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
  frmManReportesWeb: TfrmManReportesWeb;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal, 
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql, Math;
{$R *.dfm}


procedure TfrmManReportesWeb.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'RW_FECHABAJA';
  Sql.TableName := 'hys.hrw_reporteweb';

  with fraPropietario do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ShowBajas   := True;
  end;
end;

procedure TfrmManReportesWeb.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  fraPropietario.Clear;
  cbTenerCabecera.Checked := False;
  edDetalle.Clear;
  edObservacion.Clear;
  cbSolicitable.Checked := False;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManReportesWeb.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('RW_ID').AsInteger;
      Sql.Fields.Add('RW_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('RW_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('RW_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('RW_PROPIETARIO', fraPropietario.Codigo);
      if cbTenerCabecera.Checked then
        Sql.Fields.Add('RW_CABECERA', 'S')
      else
        Sql.Fields.Add('RW_CABECERA', 'N');
      Sql.Fields.Add('RW_DETALLE', edDetalle.Text);
      Sql.Fields.Add('RW_OBSERVACION', edObservacion.Text);
      if cbSolicitable.Checked then
        Sql.Fields.Add('RW_SOLICITABLE', 'S')
      else
        Sql.Fields.Add('RW_SOLICITABLE', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRW_ID');
        Sql.Fields.Add('RW_USUALTA', Sesion.UserID );
        Sql.Fields.Add('RW_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('RW_ID').AsInteger;
        Sql.Fields.Add('RW_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('RW_FECHAMODIF', exDateTime );
        Sql.Fields.Add('RW_USUBAJA', exNull );
        Sql.Fields.Add('RW_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('RW_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManReportesWeb.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('RW_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('RW_DESCRIPCION').AsString;
  cbTenerCabecera.Checked := sdqConsulta.FieldByName('RW_CABECERA').AsString = 'S';
  edDetalle.Text := sdqConsulta.FieldByName('RW_DETALLE').AsString;
  edObservacion.Text := sdqConsulta.FieldByName('RW_OBSERVACION').AsString;
  cbSolicitable.Checked := sdqConsulta.FieldByName('RW_SOLICITABLE').AsString = 'S';
  fraPropietario.Codigo := sdqConsulta.FieldByName('RW_PROPIETARIO').AsString;
end;

function TfrmManReportesWeb.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(not fraPropietario.IsSelected,fraPropietario, 'Debe especificar un Propietario.');
end;

end.
