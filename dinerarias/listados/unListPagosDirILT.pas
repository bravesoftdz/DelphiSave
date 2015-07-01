unit unListPagosDirILT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, CheckPanel, Mask, ToolEdit,
  unFraCodigoDescripcion, unfraDelegacion, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, AnsiSql, CustomDlgs, DateComboBox, SinEdit;

type
  TfrmListPagosDirILT = class(TfrmCustomConsulta)
    chkEmpresa: TCheckPanel;
    chkDelegacion: TCheckPanel;
    chkFechaRecCartaDoc: TCheckPanel;
    chkFechaLiqILT: TCheckPanel;
    chkFechaEnvFondos: TCheckPanel;
    chkFechaCCDisp: TCheckPanel;
    fraEmpresa: TfraEmpresa;
    fraDelegacion: TfraDelegacion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dcRecDesde: TDateComboBox;
    dcRecHasta: TDateComboBox;
    dcILTDesde: TDateComboBox;
    dcILTHasta: TDateComboBox;
    dcFondDesde: TDateComboBox;
    dcFondHasta: TDateComboBox;
    dcCCDesde: TDateComboBox;
    dcCCHasta: TDateComboBox;
    chkSiniestro: TCheckPanel;
    Label5: TLabel;
    edSinHasta: TSinEdit;
    edSinDesde: TSinEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkEmpresaChange(Sender: TObject);
    procedure chkDelegacionChange(Sender: TObject);
    procedure chkFechaRecCartaDocChange(Sender: TObject);
    procedure chkFechaLiqILTChange(Sender: TObject);
    procedure chkFechaEnvFondosChange(Sender: TObject);
    procedure chkFechaCCDispChange(Sender: TObject);
    procedure chkSiniestroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListPagosDirILT: TfrmListPagosDirILT;

implementation

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(dcILTDesde.IsEmpty or dcILTHasta.IsEmpty, chkFechaLiqILT,
            'Debe seleccionar las fechas Desde-Hasta de Liq. Pago directo ILT, para realizar la consulta.');

  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' art.siniestro.get_fechacartapedidodocum(ex_id) fpedidodocum, le_fproceso, ' +
                ' art.siniestro.get_fechacartapuestadisp(ex_id) fpuestadisp, ce_fechacheque, ' +
                ' le_numliqui, em_nombre Empresa, el_nombre Delegacion ' +
           ' FROM art.sle_liquiempsin, art.sex_expedientes, rce_chequeemitido, afi.aem_empresa, art.del_delegacion ' +
          ' WHERE ex_siniestro = le_siniestro ' +
            ' AND ex_orden = le_orden ' +
            ' AND ex_recaida = le_recaida ' +
            ' AND le_tipoliqui = ''D'' ' +
            ' AND NVL(le_estado, '''') IN(''C'', ''M'', ''E'') ' +
            ' AND art.siniestro.get_tienedictamencontinua(ex_id) = ''S'' ' +
            ' AND le_idchequeemitido = ce_id(+)' +
            ' AND em_cuit = ex_cuit ' +
            ' AND el_id = ex_delegacion ' ;

  if chkFechaRecCartaDoc.checked then
    sSql := sSql + ' AND art.siniestro.get_fechacartapedidodocum(ex_id) between ' +
                   SqlDate(dcRecDesde.Date) + ' AND ' + SqlDate(dcRecHasta.Date);

  if chkFechaLiqILT.Checked then
    sSql := sSql + ' AND le_fproceso between ' + SqlDate(dcILTDesde.Date) + ' AND ' + SqlDate(dcILTHasta.Date);

  if chkFechaEnvFondos.Checked then
    sSql := sSql + ' AND ce_fechacheque between ' + SqlDate(dcFondDesde.Date) + ' AND ' + SqlDate(dcFondHasta.Date);

  if chkFechaCCDisp.Checked then
    sSql := sSql + ' AND art.siniestro.get_fechacartapuestadisp(ex_id) between '
                 + SqlDate(dcCCDesde.Date) + ' AND ' + SqlDate(dcCCHasta.Date);

  if chkEmpresa.Checked then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if chkDelegacion.Checked then
    sSql := sSql + ' AND ex_delegacion = ' + SqlValue(fraDelegacion.Codigo);

  if chkSiniestro.Checked then
    sSql := sSql + ' AND ex_siniestro between ' + SqlInt(edSinDesde.Siniestro) + ' AND ' + SqlInt(edSinHasta.Siniestro);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  fraDelegacion.clear;
  dcRecDesde.Clear;
  dcRecHasta.Clear;
  dcILTDesde.Clear;
  dcILTHAsta.Clear;
  dcFondDesde.Clear;
  dcFondHasta.Clear;
  dcCCDesde.Clear;
  dcCCHasta.Clear;
  edSinDesde.Clear;
  edSinHasta.Clear;
  chkSiniestro.Checked        := False;
  chkEmpresa.Checked          := False;
  chkDelegacion.Checked       := False;
  chkFechaRecCartaDoc.Checked := False;
  chkFechaEnvFondos.Checked   := False;
  chkFechaCCDisp.Checked      := False;
  chkFechaLiqILT.Checked      := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkEmpresaChange(Sender: TObject);
begin
  if not chkEmpresa.Checked then fraEmpresa.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkDelegacionChange(Sender: TObject);
begin
  if not chkDelegacion.Checked then fraDelegacion.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkFechaRecCartaDocChange(Sender: TObject);
begin
  if not chkFechaRecCartaDoc.Checked then
  begin
    dcRecDesde.Clear;
    dcRecHasta.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkFechaLiqILTChange(Sender: TObject);
begin
  if not chkFechaLiqILT.Checked then
  begin
    dcILTDesde.Clear;
    dcILTHasta.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkFechaEnvFondosChange(Sender: TObject);
begin
  if not chkFechaEnvFondos.Checked then
  begin
    dcFondDesde.Clear;
    dcFondHasta.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkFechaCCDispChange(Sender: TObject);
begin
  if not chkFechaCCDisp.Checked then
  begin
    dcCCDesde.Clear;
    dcCCHasta.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListPagosDirILT.chkSiniestroChange(Sender: TObject);
begin
  if not chkSiniestro.Checked then
  begin
    edSinDesde.Clear;
    edSinHasta.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
end.
