unit unfrmABMBlockNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExComboBox, CustomDlgs, unSesion,
  SqlFuncs, unDmPrincipal, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, AnsiSql;

type
  TfrmABMBlockNotas = class(TfrmCustomGridABM)
    edTexto: TMemo;
    cbTipoObservacionFiltro: TExComboBox;
    cbTipoObservacion: TExComboBox;
    lblTipoObservacion: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    edTextoBottom: TMemo;
    fraEmpresafiltro: TfraEmpresa;
    Label2: TLabel;
    fraEmpresa: TfraEmpresa;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
  public
    { Public declarations }
  end;

  procedure Do_CargarBlockNotas(sContrato: Integer);

var
  frmABMBlockNotas: TfrmABMBlockNotas;

implementation

{$R *.dfm}

{ TfrmABMBlockNotas }

procedure TfrmABMBlockNotas.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  if fraEmpresafiltro.IsSelected then
    fraEmpresa.Contrato := fraEmpresafiltro.Contrato;
  cbTipoObservacion.ItemIndex := 0;
  edTexto.Clear;
end;

function TfrmABMBlockNotas.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('BN_ID', sdqConsulta.FieldByName('BN_ID').AsInteger );
    Sql.Fields.Add('BN_USUBAJA', Sesion.LoginName );
    Sql.Fields.Add('BN_FECHABAJA', exDateTime );
    Sql.SqlType := stUpdate;
  end else begin
    Sql.Fields.Add('BN_TEXTO', edTexto.Text);
    Sql.Fields.Add('BN_TIPO', cbTipoObservacion.Value);
    Sql.Fields.Add('BN_CONTRATO', fraEmpresa.Contrato);

    if ModoABM = maAlta Then begin
      Sql.PrimaryKey.Add('BN_ID', GetSecNextVal('EMI.SEQ_IBN_ID'));
      Sql.Fields.Add('BN_USUALTA', Sesion.LoginName );
      Sql.Fields.Add('BN_FECHAALTA', exDateTime );
    end else begin
      Sql.PrimaryKey.Add('BN_ID', sdqConsulta.FieldByName('BN_ID').AsInteger);
      Sql.Fields.Add('BN_USUBAJA', exNull );
      Sql.Fields.Add('BN_FECHABAJA', exNull );
    end
  end;

  Result := inherited DoABM;
end;

procedure TfrmABMBlockNotas.LoadControls;
begin
  inherited;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('bn_contrato').AsInteger;
  cbTipoObservacion.Value := sdqConsulta.FieldByName('bn_tipo').AsString;
  edTexto.Text := sdqConsulta.FieldByName('bn_texto').AsString;
end;

function TfrmABMBlockNotas.Validar: Boolean;
begin
  inherited;
  Verificar(trim(edTexto.Text) = '', edTexto, 'Debe especificar el texto.');
  result := true;
end;

procedure TfrmABMBlockNotas.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := false;
  FieldBaja := 'bn_fechabaja';
  Sql.TableName := 'emi.ibn_blocknota';
  CheckPK := False;
  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;
  fraEmpresafiltro.ShowBajas := true;
end;

procedure TfrmABMBlockNotas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edTextoBottom.Text := sdqConsulta.FieldByName('bn_texto').AsString;
end;

procedure TfrmABMBlockNotas.tbRefrescarClick(Sender: TObject);
begin
  Verificar(not fraEmpresaFiltro.IsSelected and (cbTipoObservacionFiltro.ItemIndex > -1), fraEmpresafiltro.cmbRSocial, 'Debe seleccionar una empresa');

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('Select ibn.*, aem.em_nombre ');
  sdqConsulta.SQL.Add('from emi.ibn_blocknota ibn, afi.aem_empresa aem, afi.aco_contrato aco ');
  sdqConsulta.SQL.Add('where em_id = co_idempresa ');
  sdqConsulta.SQL.Add('and bn_contrato = co_contrato ');

  if fraEmpresaFiltro.IsSelected then
    sdqConsulta.SQL.Add('and em_cuit = ' + SqlValue(fraEmpresaFiltro.Cuit));

  if (cbTipoObservacionFiltro.ItemIndex > -1) then
    sdqConsulta.SQL.Add('and bn_tipo = ' + SqlValue(cbTipoObservacionFiltro.Value));

  inherited;
end;

procedure TfrmABMBlockNotas.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  cbTipoObservacionFiltro.ItemIndex := -1;
  edTextoBottom.Clear;
  inherited;
end;

procedure Do_CargarBlockNotas(sContrato: Integer);
begin
  with TfrmABMBlockNotas.Create(nil) do
   try
     FormStyle := fsNormal;
     fraEmpresafiltro.Contrato := sContrato;
     pnlFiltros.Visible    := False;
     Visible               := False;
     tbRefrescarClick(nil);
     ShowModal;
   finally
     Free;
   end;
end;

end.
