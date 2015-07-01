unit unConsultaRelevWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unfraEstablecimientoDomic, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls;

type
  TfrmConsultaRelevWeb = class(TfrmCustomConsulta)
    lblCUIT: TLabel;
    fraEmpresaBusq: TfraEmpresa;
    fraEstablecimientoBusq: TfraEstablecimientoDomic;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraEmpresaBusqChange(sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  end;

var
  frmConsultaRelevWeb: TfrmConsultaRelevWeb;

implementation

uses
  AnsiSql, unRelevamientoRiesgosLaborales;

{$R *.dfm}

procedure TfrmConsultaRelevWeb.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresaBusq.OnChange := fraEmpresaBusqChange;
end;

procedure TfrmConsultaRelevWeb.fraEmpresaBusqChange(sender: TObject);
begin
  if fraEmpresaBusq.IsSelected then
    fraEstablecimientoBusq.CUIT := fraEmpresaBusq.CUIT
  else
    fraEstablecimientoBusq.CUIT := '';
end;

procedure TfrmConsultaRelevWeb.tbRefrescarClick(Sender: TObject);
var
  sSQL :String;
begin
  sSQL :=
    ' SELECT em_id, em_cuit, em_nombre, co_contrato, es_id, es_nroestableci, '+
    '        es_nombre, ra_id, ra_titulo, ra_descripcion, ra_header, sf_id, '+
    '        sf_fechaalta, sf_usualta, sf_version, sf_fechapasaje, sf_usupasaje, '+
    '        es_localidad, es_cpostal, es_cpostala, art.getdescripcionprovincia(es_provincia) AS prov, '+
    '        art.afi.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, es_localidad) '+
    '        || NVL2(es_telefonos, '' Tel.'' ||(NVL(es_codareatelefonos, '''') || '+
    '        es_telefonos), '''') AS domicilio, art.hys.get_codactividadrevdos(actcontrato.ac_id, actcontrato.ac_revision) ac_relacion, '+
    '        actcontrato.ac_descripcion, art.hys.get_codactividadrevdos(actestab.ac_id, actestab.ac_revision) ac_relacion, actestab.ac_descripcion '+
    '   FROM hys.hra_resolucionanexo, afi.aem_empresa, comunes.cac_actividad actcontrato, '+
    '        comunes.cac_actividad actestab, afi.aco_contrato, afi.aes_establecimiento, '+
    '        hys.hsf_solicitudfgrl '+
    '  WHERE sf_idresolucionanexo = ra_id '+
    '    AND sf_idestablecimiento = es_id '+
    '    AND co_contrato = es_contrato '+
    '    AND em_id = co_idempresa '+
    '    AND actcontrato.ac_id = co_idactividad '+
    '    AND actestab.ac_id = es_idactividad ';
  if fraEmpresaBusq.IsSelected then
  begin
    sSQL := sSQL + ' AND em_cuit = '+SqlValue(fraEmpresaBusq.CUIT);
  end;
  if fraEstablecimientoBusq.IsSelected then
  begin
    sSQL := sSQL + ' AND es_nroestableci = '+SqlValue(fraEstablecimientoBusq.edCodigo.Text);
  end;
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmConsultaRelevWeb.tbNuevoClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmRelevamientosRiesgosLaborales.Create(Self) do
    try
      fraEmpresa.Contrato := fraEmpresaBusq.Contrato;
      OnEmpresaChange(nil);
      fraEstableciBusq.edCodigo.Value := fraEstablecimientoBusq.edCodigo.Value;
      if fraEstableciBusq.edCodigo.Value = 0 then
        fraEstableciBusq.Clear;
      fraEstableciBusqExit(nil);
      OnEstableciBusqChange(nil);
      ClickNuevo := true;
      Visible := False;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmConsultaRelevWeb.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaBusq.Clear;
  fraEstablecimientoBusq.Clear;
end;

end.
