unit unDomicilioMiRegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmDomicilioMiRegistro = class(TfrmCustomGridABM)
    fraEmpresaFiltro: TfraEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    edEstablecimiento: TPatternEdit;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDomicilioMiRegistro: TfrmDomicilioMiRegistro;

implementation

uses
  AnsiSql, unCustomConsulta;
{$R *.dfm}

procedure TfrmDomicilioMiRegistro.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(
  ' SELECT dr_id, dr_cuit, dr_codigodemovimiento, '+
  '        DECODE (dr_tipoexterno, '+
  '                0, ''Domicilio fijo de la empresa'', '+
  '                1, ''Domicilio externo o ambulante'', '+
  '                2, ''Domicilio en el exterior del país'' '+
  '               ) AS dr_tipoexterno, '+
  '        dr_calle, dr_numeropuerta, dr_torre, dr_bloque, dr_piso, '+
  '        dr_departamento, dr_codigopostal, dr_localidad, dr_provincia, '+
  '        dr_sucursal, dr_actividad, dr_fechahoramovimiento, dr_areareservada, '+
  '        dr_idcabecera, dr_horamovimiento, cm_descripcion '+
  '   FROM emi.idr_domiciliomiregistro idr, comunes.ccm_codigomovimiento '+
  '  WHERE dr_codigodemovimiento = cm_codigo '+
  '     AND dr_id = '+
  '         (SELECT MAX (dr_id) '+
  '            FROM emi.idr_domiciliomiregistro b '+
  '           WHERE idr.dr_idempresa = b.dr_idempresa '+
  '             AND idr.dr_sucursal = b.dr_sucursal) ');

  if fraEmpresaFiltro.IsSelected then
    sdqConsulta.SQL.Add(' AND dr_idempresa = '+SqlValue(fraEmpresaFiltro.ID));

  if edEstablecimiento.Text <> '' then
    sdqConsulta.SQL.Add(' AND dr_sucursal = ' + SqlValue(edEstablecimiento.Text));
  if SortDialog.OrderBy = '' then
    sdqConsulta.SQL.Add(' ORDER BY dr_cuit, dr_sucursal ');
  inherited;
end;

end.
