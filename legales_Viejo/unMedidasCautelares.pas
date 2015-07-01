unit unMedidasCautelares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, Mask, ToolEdit, CurrEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmMedidasCautelares = class(TfrmCustomGridABM)
    fraMedidasCautelares: TfraCodigoDescripcion;
    lblMedidasCautelares: TLabel;
    lblImporte: TLabel;
    edImporte: TCurrencyEdit;
    lblDetalle: TLabel;
    edObservaciones: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    IDJuicio : Integer;
    procedure OnChangefraMedidasCautelares(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    procedure Load(juicio : Integer);
  end;

var
  frmMedidasCautelares: TfrmMedidasCautelares;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, AnsiSql;

procedure TfrmMedidasCautelares.ClearControls;
begin
  inherited;
  fraMedidasCautelares.Clear;
  edImporte.Clear;
  edObservaciones.Clear;
end;

function TfrmMedidasCautelares.DoABM: Boolean;
var
  iIdCodigo: Integer;
begin
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('MC_ID').AsInteger;
      Sql.Fields.Add('MC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('MC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('MC_IDTIPOMEDIDA', fraMedidasCautelares.Codigo);
      Sql.Fields.Add('MC_IMPORTE', edImporte.Text);
      Sql.Fields.Add('MC_OBSERVACIONES', edObservaciones.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('LEGALES.SEQ_LMC_ID');
        Sql.Fields.Add('MC_IDJUICIOENTRAMITE', IDJuicio );
        Sql.Fields.Add('MC_USUALTA', Sesion.UserID );
        Sql.Fields.Add('MC_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('MC_ID').AsInteger;
        Sql.Fields.Add('MC_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('MC_FECHAMODIF', exDateTime );
        Sql.Fields.Add('MC_USUBAJA', exNull );
        Sql.Fields.Add('MC_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('MC_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmMedidasCautelares.FormCreate(Sender: TObject);
begin
  inherited;
  with fraMedidasCautelares do
  begin
    TableName   := 'legales.ltm_tipomedidas';
    FieldID     := 'tm_id';
    FieldCodigo := 'tm_id';
    FieldDesc   := 'tm_descripcion';
    FieldBaja   := 'tm_fechabaja';
    Showbajas   := True;
    OnChange    := OnChangefraMedidasCautelares;
  end;
  sdqConsulta.ParamByName('idjuicio').AsInteger := IDJuicio;
  FieldBaja := 'MC_FECHABAJA';
  Sql.TableName := 'legales.lmc_medidascautelares';
  VCLExtra.LockControl(edImporte,True);
end;

procedure TfrmMedidasCautelares.LoadControls;
begin
  inherited;
  ClearControls;
  fraMedidasCautelares.Codigo := sdqConsulta.FieldByName('MC_IDTIPOMEDIDA').AsString;
  edImporte.Text              := sdqConsulta.FieldByName('MC_IMPORTE').AsString;
  edObservaciones.Text        := sdqConsulta.FieldByName('MC_OBSERVACIONES').AsString;
  OnChangefraMedidasCautelares(nil);
end;

function TfrmMedidasCautelares.Validar: Boolean;
begin
  Result := True;
  Verificar(fraMedidasCautelares.IsEmpty ,fraMedidasCautelares, 'Debe especificar un tipo de Medida Cautelar.');
  if (fraMedidasCautelares.Descripcion = 'EMBARGO') or
     (fraMedidasCautelares.Descripcion ='INTERVENTOR-RECAUDADOR') then
    Verificar(edImporte.Text= '',edImporte, 'El importe debe ser mayor a 0.');
  if (fraMedidasCautelares.Descripcion = 'EMBARGO') then
    Verificar(edObservaciones.Text = '' ,edObservaciones, 'Debe tener una Observación.');
end;

procedure TfrmMedidasCautelares.Load(juicio : Integer);
begin
  IDJuicio    := juicio;
  sdqConsulta.ParamByName('idjuicio').AsInteger := IDJuicio;
  tbRefrescarClick(nil);
end;

procedure TfrmMedidasCautelares.OnChangefraMedidasCautelares(
  Sender: TObject);
begin
  if (fraMedidasCautelares.Descripcion = 'EMBARGO') or
     (fraMedidasCautelares.Descripcion ='INTERVENTOR-RECAUDADOR') then
     VCLExtra.LockControl(edImporte, False)
  else
  begin
     edImporte.Value := 0;
     VCLExtra.LockControl(edImporte, True);
  end;
end;

end.
