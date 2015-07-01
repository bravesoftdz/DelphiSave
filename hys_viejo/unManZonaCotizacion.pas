unit unManZonaCotizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit;

type
  TfrmManZonaCotizacion = class(TfrmCustomGridABM)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    Label1: TLabel;
    edCostoVisita: TPatternEdit;
    tbAsignarProvincia: TToolButton;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbAsignarProvinciaClick(Sender: TObject);
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
  frmManZonaCotizacion: TfrmManZonaCotizacion;

implementation

uses unCustomConsulta, CustomDlgs,unDmPrincipal, unSesion, SqlFuncs, unModificacionProvinciaZona,
  Math,VclExtra;

{$R *.dfm}

{ TfrmManZonaCotizacion }

procedure TfrmManZonaCotizacion.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  edCostoVisita.Clear;
end;

function TfrmManZonaCotizacion.DoABM: Boolean;
var
  idCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      idCodigo := sdqConsulta.FieldByName('ZC_ID').AsInteger;
      Sql.Fields.Add('ZC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('ZC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin

      Sql.Fields.Add('ZC_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('ZC_COSTOVISITA', edCostoVisita.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        idCodigo := GetSecNextVal('HYS.SEQ_HZC_COTIZACION_ID');
        Sql.Fields.Add('ZC_USUALTA', Sesion.UserID );
        Sql.Fields.Add('ZC_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        idCodigo := sdqConsulta.FieldByName('ZC_ID').AsInteger;
        Sql.Fields.Add('ZC_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('ZC_FECHAMODIF', exDateTime );
        Sql.Fields.Add('ZC_USUBAJA', exNull );
        Sql.Fields.Add('ZC_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('ZC_ID', idCodigo);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManZonaCotizacion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ZC_FECHABAJA';
  Sql.TableName := 'hys.hzc_zonacotizacion';
  vclExtra.LockControls([edCodigo],True);
end;

procedure TfrmManZonaCotizacion.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('ZC_ID').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('ZC_DESCRIPCION').AsString;
  edCostoVisita.Text := sdqConsulta.FieldByName('ZC_COSTOVISITA').AsString;
end;

function TfrmManZonaCotizacion.Validar: Boolean;
begin
  Verificar(edDescripcion.Text = '',edDescripcion,'Debe Ingresar la descripción.');
  Verificar(edCostoVisita.Text = '',edCostoVisita,'Debe Ingresar el costo de visita.');
  Result := True;
end;

procedure TfrmManZonaCotizacion.tbAsignarProvinciaClick(Sender: TObject);
begin
  with TfrmModificacionProvinciaZona.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    if sdqConsulta.Active and not (sdqConsulta.IsEmpty) then
    begin
      fraZonaFiltro.Codigo := sdqConsulta.FieldByName('ZC_ID').AsString;
    end;
    tbRefrescarClick(nil);
    ShowModal;
  end;
end;

end.
