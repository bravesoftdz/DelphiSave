unit unDlgBusInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, ToolEdit, DateComboBox, unArtFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtDBAwareFrame;

type
  TfrmDlgBusInforme = class(TfrmCustomConsulta)
    Panel1: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    edCI_RESP_CUILCUIT: TMaskEdit;
    edCI_RESP_NOMBRE: TEdit;
    GroupBox1: TGroupBox;
    fraCE_CUIT: TfraEmpresa;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edCI_FECHADesde: TDateComboBox;
    edCI_FECHAHasta: TDateComboBox;
    procedure GridDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  protected
    procedure ClearData; override;
    procedure EnableButtons(AEnabled : Boolean = True); override;
    procedure RefreshData; override;
  public
  end;

function GetIdInformeCancerigenos: Integer;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs;

{$R *.DFM}

function GetIdInformeCancerigenos: Integer;
begin
  with TfrmDlgBusInforme.Create(Application) do
    try
      if ShowModal = mrOk Then
        if sdqConsulta.Active then
          Result := sdqConsulta.FieldByName('CI_ID').AsInteger
        else
          Result := -1
      else
        Result := -1;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ TfrmDlgBusInforme }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.ClearData;
begin
  fraCE_CUIT.Clear;
  edCI_RESP_CUILCUIT.Clear;
  edCI_RESP_NOMBRE.Clear;
  edCI_FECHADesde.Clear;
  edCI_FECHAHasta.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  btnAceptar.Enabled := AEnabled;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.RefreshData;
var
  sSql: string;
begin
  sSql := 'SELECT ci_id, ci_fecha, ci_resp_cuilcuit, ci_resp_nombre, es_nroestableci, ' +
          '       es_nombre, ci_fechabaja, ' +
          '       utiles.armar_domicilio(es_calle, es_numero, es_piso, ' +
          '                              es_departamento) AS "DOMICILIO", ' +
          '       utiles.armar_localidad(NULL, es_cpostala, es_localidad, ' +
          '                              es_provincia) AS "LOCALIDAD" ' +
          '  FROM hys.pci_caninforme ' +
          '       INNER JOIN afi.aes_establecimiento ON es_id = ci_idestableci ';

  if edCI_RESP_CUILCUIT.Text <> '' Then
    AddCondition(sSql, 'ci_resp_cuilcuit = ' + SqlValue(edCI_RESP_CUILCUIT.Text));

  if edCI_RESP_NOMBRE.Text <> '' Then
    AddCondition(sSql, 'ci_resp_nombre LIKE ' + SqlValue(edCI_RESP_NOMBRE.Text + SQL_WILLCARD));

  if edCI_FECHADesde.Date <> 0 Then
    AddCondition(sSql, 'ci_fecha <= ' + SqlValue(edCI_FECHADesde.Date));

  if edCI_FECHAHasta.Date <> 0 Then
    AddCondition(sSql, 'ci_fecha <= ' + SqlValue(edCI_FECHAHasta.Date));

  if fraCE_CUIT.IsSelected Then
    AddCondition(sSql, 'es_contrato = ' + SqlValue(fraCE_CUIT.Contrato));

  sdqConsulta.SQL.Text := sSql;

  inherited;
  Grid.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.GridDblClick(Sender: TObject);
begin
  if btnAceptar.Enabled Then
    ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.btnAceptarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not(sdqConsulta.IsEmpty)), nil, 'No seleccionó ningún registro.');
  ModalResult := mrOK;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDlgBusInforme.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName('ci_fechabaja').IsNull then
    AFont.Color:= clRed;
end;

end.

