unit unManRotulosReporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, CheckLst, ARTCheckListBox,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  Mask, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmManRotulosReporte = class(TfrmCustomGridABM)
    lblautorizacion: TLabel;
    edCodigo: TEdit;
    lbCodigo: TLabel;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    edOrden: TIntEdit;
    Label1: TLabel;
    cbRotuloEstablecimiento: TCheckBox;
    fraReporteWeb: TfraCodigoDescripcion;
    Label2: TLabel;
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
  frmManRotulosReporte: TfrmManRotulosReporte;

implementation
uses
  General,CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra, DBSql, Math;
{$R *.dfm}


procedure TfrmManRotulosReporte.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'RR_FECHABAJA';
  Sql.TableName := 'hys.HRR_ROTULOSREPORTE';
  with fraReporteWeb do
  begin
    TableName   := 'hys.hrw_reporteweb';
    FieldID     := 'RW_ID';
    FieldCodigo := 'RW_ID';
    FieldDesc   := 'RW_DESCRIPCION';
    FieldBaja := 'RW_FECHABAJA';
    Showbajas   := true;
  end;
end;

procedure TfrmManRotulosReporte.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  fraReporteWeb.Clear;
  edDescripcion.Clear;
  cbRotuloEstablecimiento.Checked := False;
  edOrden.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManRotulosReporte.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('RR_ID').AsInteger;
      Sql.Fields.Add('RR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('RR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('RR_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('RR_IDREPORTE', fraReporteWeb.Codigo);
      Sql.Fields.Add('RR_ORDEN', edOrden.Text);
      if cbRotuloEstablecimiento.Checked then
        Sql.Fields.Add('RR_ROTULOESTABLECIMIENTO', 'S')
      else
        Sql.Fields.Add('RR_ROTULOESTABLECIMIENTO', 'N');
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRR_ID');
        Sql.Fields.Add('RR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('RR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('RR_ID').AsInteger;
        Sql.Fields.Add('RR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('RR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('RR_USUBAJA', exNull );
        Sql.Fields.Add('RR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('RR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManRotulosReporte.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('RR_ID').AsString;
  fraReporteWeb.Codigo := sdqConsulta.FieldByName('RR_IDREPORTE').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('RR_DESCRIPCION').AsString;
  edOrden.Text := sdqConsulta.FieldByName('RR_ORDEN').AsString;
  cbRotuloEstablecimiento.Checked := sdqConsulta.FieldByName('RR_ROTULOESTABLECIMIENTO').AsString = 'S';
end;

function TfrmManRotulosReporte.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(fraReporteWeb.IsEmpty,fraReporteWeb, 'Debe seleccionar un Reporte Web.');
end;

end.
