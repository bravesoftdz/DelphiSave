unit unAsignacionesDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, DBClient, undmPrincipal;

type
  TfrmAsignacionesDetalle = class(TfrmCustomConsulta)
    cdsEstabPreventor: TClientDataSet;
    cdsEstabPreventorEP_CUIT: TStringField;
    cdsEstabPreventorEM_NOMBRE: TStringField;
    cdsEstabPreventorES_NOMBRE: TStringField;
    cdsEstabPreventorEP_ESTABLECI: TIntegerField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEP_ESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaTIPOSRT: TStringField;
    sdqConsultaTIPOPREVENCION: TStringField;
    sdqConsultaEP_ITCODIGO: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaRC_EMPLEADOS: TFloatField;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaES_LOCALIDAD: TStringField;
    sdqConsultaES_CPOSTAL: TStringField;
    sdqConsultaES_CPOSTALA: TStringField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    sdqConsultaPROV: TStringField;
    sdqConsultaES_PROVINCIA: TStringField;
    sdqConsultaEE_DESCRIPCION: TStringField;
    sdqConsultaAC_CODIGO: TStringField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FSFormKeyPress(Sender: TObject; var Key: Char);
  private
    FContrato: integer;
    function GetContrato: integer;
    procedure SetContrato(const Value: integer);
  public
    property Contrato: integer read GetContrato write SetContrato;
  end;

var
  frmAsignacionesDetalle: TfrmAsignacionesDetalle;

implementation

{$R *.dfm}

procedure TfrmAsignacionesDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConsulta.SQL.Text :=
              '  SELECT                                                                                           /*+ first_rows */ '
            + '        aem.em_cuit, '
            + '          aem.em_nombre, '
            + '          hep.ep_estableci, '
            + '          aes.es_nombre, '
            + '          hep.ep_tipo tiposrt, '
            + '          hte.te_codigo tipoprevencion, '
            + '          hep.ep_itcodigo, '
            + '          pit.it_nombre, '
            + '          NVL (co_totempleadosactual, co_totempleados) AS rc_empleados, '
            + '          art.afi.armar_domicilio ( '
            + '                                   es_calle, '
            + '                                   es_numero, '
            + '                                   es_piso, '
            + '                                   es_departamento, '
            + '                                   es_localidad '
            + '                                  ) || '
            + '          NVL2 ( '
            + '                es_telefonos, '
            + '                '' Tel.'' || (NVL (es_codareatelefonos, '''') || es_telefonos), '
            + '                '''' '
            + '               ) '
            + '             AS domicilio, '
            + '          aes.es_localidad, '
            + '          aes.es_cpostal, '
            + '          aes.es_cpostala, '
            + '          co_contrato, '
            + '          ca_descripcion, '
            + '          art.getdescripcionprovincia (es_provincia) AS prov, '
            + '          aes.es_provincia, '
            + '          hee.ee_descripcion, '
            + '          cac.ac_codigo, '
            + '          cac.ac_descripcion '
            + '    FROM  afi.adc_domiciliocontrato  ahdl, '
            + '          hys.hep_estabporpreventor  hep, '
            + '          afi.aem_empresa            aem, '
            + '          afi.aco_contrato           aco, '
            + '          afi.aes_establecimiento    aes, '
            + '          comunes.cac_actividad      cac, '
            + '          hys.hte_tipoempresaprev    hte, '
            + '          hys.hco_cuitoperativo      hco, '
            + '          hys.hee_estadoestab        hee, '
            + '          hys.hca_categoriariesgo    hca, '
            + '          art.pit_firmantes          pit, '
            + '          hpd_preventores_data       hpd '
            + '   WHERE  co_contrato             = art.get_vultcontrato (em_cuit) '
            + '      AND ahdl.dc_contrato        = aco.co_contrato '
            + '      AND ahdl.dc_tipo            = ''L'' '
            + '      AND cac.ac_idcategoriariesgo= hca.ca_id(+) '
            + '      AND hep.ep_idempresa        = aem.em_id '
            + '      AND aem.em_id               = aco.co_idempresa '
            + '      AND aes.es_nroestableci     = hep.ep_estableci '
            + '      AND aco.co_contrato         = aes.es_contrato '
            + '      AND cac.ac_id               = aes.es_idactividad '
            + '      AND hco.co_idtipoempresaprev= hte.te_id '
            + '      AND hco.co_id               = hep.ep_idcooperativo '
            + '      AND hep.ep_idestado         = hee.ee_id '
            + '      AND hpd.pd_idhep            = hep.ep_id '
            + '      AND hpd.pd_tipo_asignacion  = ''A'' '
            + '      AND hpd.pd_idfirmante       = pit.it_id(+) '
            + '      AND aes.es_fechabaja        IS NULL '
            + '      AND aco.co_estado           = ''1'' '
            ;

end;

procedure TfrmAsignacionesDetalle.FSFormKeyPress(Sender: TObject; var Key:
    Char);
begin
  if key = #27 then tbSalirClick(Sender);
end;

{ TfrmCustomConsulta1 }

function TfrmAsignacionesDetalle.GetContrato: integer;
begin
  Result := FContrato;
end;

procedure TfrmAsignacionesDetalle.SetContrato(const Value: integer);
begin
  FContrato := Value;
  sdqConsulta.Close;
  sdqConsulta.SQL.Text :=
      sdqConsulta.SQL.Text
      + ' AND co_contrato = ' + IntToStr(FContrato)
      + ' ORDER BY ep_estableci';

  sdqConsulta.Open;
end;


end.
