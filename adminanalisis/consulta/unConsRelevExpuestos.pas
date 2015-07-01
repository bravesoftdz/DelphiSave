{-----------------------------------------------------------------------------
 Unit Name: unConsRelevExpuestos
 Author:
 Date:
 Purpose:   Consulta de Expuestos
 History:   05/2000 - Federico Firenze - Originalmente unConsPRT_RIESTRAB.pas
            12/2008 - Raúl Castro
-----------------------------------------------------------------------------}

unit unConsRelevExpuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unFraEstudio, StdCtrls, Mask, ToolEdit, DateComboBox, CustomDlgs,
  unFraCodigoDescripcion, unFraTrabajador, General, unSesion, unListaEMail,
  unfraEstablecimiento_OLD, unArtFrame, unArtDbFrame, unFraEmpresaAfi,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, JvgGroupBox, 
  unfraPrestadorAMP, FormPanel, unfraPrestadorAMPCuit, unFraEmpresa,
  unFraEstablecimiento, ExComboBox, unExportPDF, Strfuncs, DateTimeFuncs;

type
  TfrmConsExpuestos = class(TfrmCustomConsulta)
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Riesgo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    fraEstablecimiento: TfraEstablecimiento_OLD;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    chkTodas: TCheckBox;
    fraEstudio: TfraEstudio;
    edFechaCargaDesde: TDateComboBox;
    edFechaCargaHasta: TDateComboBox;
    fraRiesgo: TfraStaticCodigoDescripcion;
    fraEmpresa: TfraEmpresa;
    lbEstableci: TLabel;
    lbCPostal: TLabel;
    edCPostalFiltro: TEdit;
    fraTrabajador: TfraTrabajador;
    Label6: TLabel;
    Bevel7: TBevel;
    cbEmpresasVIP: TCheckBox;
    procedure fraTrabajadorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFiltros: String;
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEstablecimientoChange(Sender : TObject);
    procedure OnTrabajadorChange(Sender : TObject);
  protected
    FIDLote : Integer;
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, unVisualizador, unArt;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.ClearData;
begin
  fraEmpresa.Clear;
  fraEstablecimiento.Limpiar;
  fraTrabajador.Clear;
  fraRiesgo.Clear ;
  sdqConsulta.Close;
  edFechaDesde.ClearDate ;
  edFechaHasta.ClearDate ;
  chkTodas.Checked := False;
  fraEstudio.Clear;
  edFechaCargaDesde.Clear;
  edFechaCargaHasta.Clear;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.RefreshData;
begin
  FFiltros := ' WHERE (1=1) ';
  if fraEmpresa.IsSelected then
    FFiltros := FFiltros + ' AND rs_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text);

  if not IsEmptyString(edCPostalFiltro.Text) then
    FFiltros := FFiltros + ' AND rs_cpostal = ' + SqlValue(edCPostalFiltro.Text);

  if fraEstablecimiento.IsSelected then
    FFiltros := FFiltros + ' AND rs_estableci = ' + fraEstablecimiento.edCodigo.TextSql + ' ';

  if fraTrabajador.IsSelected then
    FFiltros := FFiltros + ' AND rs_cuil = ' + SQLValue(fraTrabajador.CUIL);

  if fraRiesgo.IsSelected then
    FFiltros := FFiltros + ' AND rs_riesgo = ' + SQLValue(fraRiesgo.Value);

  if fraEstudio.IsSelected then
    FFiltros := FFiltros + ' AND rs_codigo_estudio = ' + SQLValue(fraEstudio.Codigo);

  if cbEmpresasVIP.Checked then
    FFiltros := FFiltros +
      ' AND EXISTS(SELECT DISTINCT 1 '+
      '        FROM comunes.cev_empresavip,afi.aem_empresa '+
      '       WHERE ev_idempresa = em_id '+
      '         AND em_cuit = rs_cuit '+
      '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';

  if not chkTodas.Checked then
    FFiltros := FFiltros + ' AND rs_fecha = art.amp.get_maxfechaexposicion(rs_cuit, rs_estableci) ';

  FFiltros := FFiltros + SqlBetweenDateTime(' AND rs_fecha ', edFechaDesde.Date, edFechaHasta.Date, True);
  FFiltros := FFiltros + SqlBetweenDateTime(' AND rs_fechaalta ', edFechaCargaDesde.Date, edFechaCargaHasta.Date, True);

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT DISTINCT rs_cuit, rs_nombre_empresa, rs_ciiu, rs_estableci, ' +
                      '                rs_nombre_estableci, rs_domicilio, rs_provincia, rs_contrato, ' +
                      '                rs_fechaalta, rs_fecha, rs_cpostal, rs_cuil, ' +
                      '                rs_nombre_trabajador, rs_fechaingreso, rs_codigo_estudio, ' +
                      '                rs_descripcion_estudio, rs_sector, rs_tarea, rs_fechainiexpo, ' +
                      '                rs_descripcion_riesgotrabajo, rs_periodicidad, rs_esop ' +
                      '           FROM hys.v_trabajadores_con_riesgo vr ' +
                                       FFiltros);

  inherited;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.fraTrabajadorEnter(Sender: TObject);
begin
  if fraTrabajador.IdEmpresa = ART_EMPTY_ID then
    fraTrabajador.MinLength := 4
  else
    fraTrabajador.MinLength := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas      := True;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEmpresa.ContratoActivo := True;

  fraEstablecimiento.OnChange := OnEstablecimientoChange;
  fraTrabajador.OnChange      := OnTrabajadorChange;

  with fraRiesgo do
  begin
    TableName := 'PRG_RIESGOS';
    FieldId := 'rg_codigo';
    FieldCodigo := 'TRIM(RG_ESOP || '' '' || RG_SUFIJOESOP)';
    FieldDesc := 'rg_descripcion';
    FieldBaja := 'RG_FECHABAJA';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresa.mskCUIT.Text;
  fraTrabajador.IdEmpresa := fraEmpresa.Value;
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.OnEstablecimientoChange(Sender: TObject);
begin
  fraTrabajador.IdEstableci := fraEstablecimiento.Value;
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsExpuestos.OnTrabajadorChange(Sender: TObject);
begin
  sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}

end.

