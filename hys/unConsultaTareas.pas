unit unConsultaTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, PatternEdit, ComboEditor, CheckCombo, unfraCtbTablas,
  StdCtrls, Mask, ToolEdit, DateComboBox, unFraCodigoDescripcion,
  unfraEstablecimientoDomic, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, IntEdit, unFraCodDesc, unfraLocalidad, unfraLocalidadEx;

type
  TfrmConsultaTareas = class(TfrmCustomConsulta)
    pcFilter: TPageControl;
    tbGeneral: TTabSheet;
    tbPrevencion: TTabSheet;
    fraEmpresaFiltro: TfraEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label3: TLabel;
    edFechaTareaDesde: TDateComboBox;
    Label4: TLabel;
    edFechaTareaHasta: TDateComboBox;
    Label6: TLabel;
    Label7: TLabel;
    fraTipoFiltroSRT: TfraCtbTablas;
    edEstablecimiento: TPatternEdit;
    Label14: TLabel;
    cmbTipoEmpresaPrev: TCheckCombo;
    tbAfiliaciones: TTabSheet;
    fraLocalidad: TfraLocalidadEx;
    fraDepart: TfraCodDesc;
    Label47: TLabel;
    fraCoordinador: TfraCodigoDescripcion;
    Label9: TLabel;
    cmbAgregarVisitas: TCheckCombo;
    Label10: TLabel;
    pnlColor4: TPanel;
    Label11: TLabel;
    tbCantRegistros: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbConsSiniestros: TToolButton;
    cbEmpresaVip: TCheckBox;
    sdqConsultaPREV: TStringField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaRAZONSOCIAL: TStringField;
    sdqConsultaCONTRATO: TFloatField;
    sdqConsultaESTABLECIMIENTO: TFloatField;
    sdqConsultaNOMBESTAB: TStringField;
    sdqConsultaTIPOSRT: TStringField;
    sdqConsultaTIPPREV: TStringField;
    sdqConsultaACT: TStringField;
    sdqConsultaEVENTUAL: TStringField;
    sdqConsultaCANTEMP: TFloatField;
    sdqConsultaTELEMP: TStringField;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaLOCALIDAD: TStringField;
    sdqConsultaCODPOST: TStringField;
    sdqConsultaCPA: TStringField;
    sdqConsultaPART: TStringField;
    sdqConsultaCIIU: TStringField;
    sdqConsultaDESCIUU: TStringField;
    sdqConsultaPROV: TStringField;
    sdqConsultaTIENEANEXO1: TStringField;
    sdqConsultaTIENEANEXO2: TStringField;
    sdqConsultaTIENEANEXOFICTICIO: TStringField;
    sdqConsultaTIENEDENGRAL: TStringField;
    sdqConsultaTIENEDEN: TStringField;
    sdqConsultaTIENEPRS: TStringField;
    sdqConsultaULTVISITAS: TDateTimeField;
    sdqConsultaPREVULTVISITA: TStringField;
    sdqConsultaULTRELEVAMIENTO: TDateTimeField;
    sdqConsultaULTCAPACITACION: TDateTimeField;
    sdqConsultaFINICIOOBRA: TDateTimeField;
    sdqConsultaFEXTOBRA: TDateTimeField;
    sdqConsultaFFINOBRA: TDateTimeField;
    sdqConsultaTP_IDTIPOESTABPREV: TFloatField;
    sdqConsultaTP_ITCODIGO: TStringField;
    sdqConsultaTP_ITCOORDINADOR: TStringField;
    sdqConsultaTAREAPROGRAMA: TStringField;
    sdqConsultaFECHAPROGRAMA: TDateTimeField;
    sdqConsultaTAREAACCIDENTE: TStringField;
    sdqConsultaFECHAACCIDENTE: TDateTimeField;
    sdqConsultaTAREAENFERMEDAD: TStringField;
    sdqConsultaFECHAENFERMEDAD: TDateTimeField;
    sdqConsultaTAREACANCER: TStringField;
    sdqConsultaFECHACANCER: TDateTimeField;
    sdqConsultaTP_FECHACANCERFIN: TDateTimeField;
    sdqConsultaTAREADIFENILOS: TStringField;
    sdqConsultaFECHADIFENILOS: TDateTimeField;
    sdqConsultaTP_FECHADIFENILOSFIN: TDateTimeField;
    sdqConsultaTAREAACCMAYORES: TStringField;
    sdqConsultaFECHAACCMAYOR: TDateTimeField;
    sdqConsultaTP_FECHAACCMAYORESFIN: TDateTimeField;
    sdqConsultaTAREA463: TStringField;
    sdqConsultaFECHA463: TDateTimeField;
    sdqConsultaTP_FECHA463FIN: TDateTimeField;
    sdqConsultaRAR: TStringField;
    sdqConsultaCAPACITAR: TStringField;
    sdqConsultaTAREAMAPARIESGOS: TStringField;
    sdqConsultaFECHAMAPARIESGOS: TDateTimeField;
    sdqConsultaSINIESTROENF: TFloatField;
    sdqConsultaSINIESTROACC: TFloatField;
    sdqConsultaEXISTENVENCIDOS: TStringField;
    sdqConsultaTP_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaTP_IDEMPRESA: TFloatField;
    sdqConsultaTP_TERCERIZADO: TStringField;
    sdqConsultaVISITASOPERATIVO: TFloatField;
    sdqConsultaVISITAPORFRECUENCIA: TFloatField;
    sdqConsultaFRECUENCIAVISITA: TFloatField;
    sdqConsultaTP_IDPROVINCIA: TFloatField;
    sdqConsultaTP_TAREAINVENFERMEDAD: TStringField;
    sdqConsultaTP_FECHAINVENFERMEDAD: TDateTimeField;
    sdqConsultaTP_TAREAMEDIDAENFERMEDAD: TStringField;
    sdqConsultaTP_FECHAMEDIDAENFERMEDAD: TDateTimeField;
    sdqConsultaTP_TAREAINVACCIDENTE: TStringField;
    sdqConsultaTP_FECHAINVACCIDENTE: TDateTimeField;
    sdqConsultaTP_TAREAMEDIDAACCIDENTE: TStringField;
    sdqConsultaTP_FECHAMEDIDAACCIDENTE: TDateTimeField;
    sdqConsultaNOMBRECOORDINADOR: TStringField;
    sdqConsultaTP_FECHAPROGRAMAFIN: TDateTimeField;
    sdqConsultaTP_FECHAMRIESGOSFIN: TDateTimeField;
    sdqConsultaTP_FECHAINVACCIDENTEFIN: TDateTimeField;
    sdqConsultaTP_FECHAINVENFERMEDADFIN: TDateTimeField;
    sdqConsultaTP_FECHAMEDIDAACCIDENTEFIN: TDateTimeField;
    sdqConsultaTP_FECHAMEDIDAENFERMEDADFIN: TDateTimeField;
    sdqConsultaTP_TAREAPRAM: TStringField;
    sdqConsultaTP_FECHAPRAM: TDateTimeField;
    sdqConsultaTP_FECHAPRAMFIN: TDateTimeField;
    sdqConsultaTP_TAREAPROGRAMAANEXA: TStringField;
    sdqConsultaTP_FECHAPROGRAMAANEXA: TDateTimeField;
    sdqConsultaTP_FECHAPROGRAMAANEXAFIN: TDateTimeField;
    sdqConsultaTP_HACERFGRL: TStringField;
    sdqConsultaTP_FRECUENCIAPERSONALIZADA: TFloatField;
    sdqConsultaTP_TAREACANCERANT: TStringField;
    sdqConsultaTP_FECHACANCERANT: TDateTimeField;
    sdqConsultaTP_FECHACANCERFINANT: TDateTimeField;
    sdqConsultaTP_TAREADIFENILOSANT: TStringField;
    sdqConsultaTP_FECHADIFENILOSANT: TDateTimeField;
    sdqConsultaTP_FECHADIFENILOSFINANT: TDateTimeField;
    sdqConsultaTP_TAREACONSTRUCCION: TStringField;
    sdqConsultaTP_IDTAREACONSTRUCCION: TFloatField;
    sdqConsultaTP_FECHACONSTRUCCION: TDateTimeField;
    sdqConsultaTP_FECHACONSTRUCCIONFIN: TDateTimeField;
    sdqConsultaTP_IDTAREARECLAMO: TFloatField;
    sdqConsultaTP_TAREARECLAMO: TStringField;
    sdqConsultaTP_FECHATAREARECLAMO: TDateTimeField;
    sdqConsultaTP_FECHATAREARECLAMOFIN: TDateTimeField;
    sdqConsultaTP_IDTAREARECLAMOANEXA: TFloatField;
    sdqConsultaTP_TAREARECLAMOANEXA: TStringField;
    sdqConsultaTP_FECHATAREARECLAMOANEXA: TDateTimeField;
    sdqConsultaTP_FECHATAREARECLAMOANEXAFIN: TDateTimeField;
    sdqConsultaTP_IDTAREARECLAMOANEXA2: TFloatField;
    sdqConsultaTP_TAREARECLAMOANEXA2: TStringField;
    sdqConsultaTP_FECHATAREARECLAMOANEXA2: TDateTimeField;
    sdqConsultaTP_FECHATAREARECLAMOANEXAFIN2: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbCantRegistrosClick(Sender: TObject);
    procedure tbConsSiniestrosClick(Sender: TObject);
  private
    FConsulta : String;
    procedure OnEmpresaChange(Sender: TObject);
    function ArmarFiltroEstab(Establecimientos: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaTareas: TfrmConsultaTareas;

implementation

uses
  unDmPrincipal, AnsiSql, VCLExtra, DateUtils, CustomDlgs, unConsultaSiniestrosHYS,
  General;
{$R *.dfm}

procedure TfrmConsultaTareas.FormCreate(Sender: TObject);
begin
  inherited;
  pcFilter.ActivePageIndex := 0;
  fraEmpresaFiltro.OnChange := OnEmpresaChange;
  fraEmpresaFiltro.ShowBajas := True;
  FConsulta := sdqConsulta.SQL.Text;
  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCoordinador do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with cmbAgregarVisitas do
  begin
    Items.AddObject('ALTO', TObject(1));
    Items.AddObject('MODERADO', TObject(2));
    Items.AddObject('BAJO', TObject(3));
    Items.AddObject('MUY BAJO', TObject(4));
  end;                            

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV WHERE TE_APLICA LIKE ''%C%''') do
  try
    while not Eof do
    begin
      cmbTipoEmpresaPrev.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  fraTipoFiltroSRT.Clave := 'TFET';

  VCLExtra.LockControl(edEstablecimiento, true);

  fraLocalidad.FieldCPostal := 'tp_cpostal';
  fraLocalidad.FieldLocalidad := 'tp_localidad';
  fraLocalidad.FieldProvincia := 'tp_idprovincia';

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;

  end;
  tbConsSiniestros.Left := tbSalir.Left -1;
  tbCantRegistros.Left := tbSalir.Left -1;
end;

procedure TfrmConsultaTareas.OnEmpresaChange(Sender: TObject);
begin
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
  edEstablecimiento.SetFocus;
end;

procedure TfrmConsultaTareas.tbRefrescarClick(Sender: TObject);
var
  sWhere, sWhereFecha, sUnion : String;
  sIn : String;
  i : Integer;
  fechaDesde, fechaHasta : TDate;
begin
  sWhere := '';
  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND tp_cuit = ' + SqlValue(fraEmpresaFiltro.CUIT);

  if fraPreventorFiltro.IsSelected then
    sWhere := sWhere + ' AND tp_itcodigo = ' + SqlValue(fraPreventorFiltro.Codigo);

  if fraCoordinador.IsSelected then
    sWhere := sWhere + ' AND tp_itcoordinador = ' + SqlValue(fraCoordinador.Codigo);

  if cbEmpresaVip.Checked then
      sWhere := sWhere +
        ' AND EXISTS(SELECT DISTINCT 1 '+
        '        FROM comunes.cev_empresavip,afi.aem_empresa '+
        '       WHERE ev_idempresa = em_id '+
        '         AND em_cuit = tp_cuit '+
        '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';


  sIn := '';
  if cmbTipoEmpresaPrev.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
      if cmbTipoEmpresaPrev.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(cmbTipoEmpresaPrev.Items.Strings[i]);
      end;
  end;

  if (sIn <> '') then
    sWhere := sWhere + ' and tp_tipoprevencion in (' + sIn  + ')';

  if fraTipoFiltroSRT.IsSelected then
    sWhere := sWhere + ' and tp_tiposrt = '+SqlValue(fraTipoFiltroSRT.Codigo);

  fechaDesde := edFechaTareaDesde.Date;
  fechaHasta := edFechaTareaHasta.Date;

  sIn := '';
  if (cmbAgregarVisitas.Text <> '') and (edFechaTareaHasta.Date <> 0) then
  begin
    sIn := '';
    for i:=0 to cmbAgregarVisitas.Items.Count-1 do
      if cmbAgregarVisitas.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbAgregarVisitas.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sUnion := ' UNION ALL '+ FConsulta +
      ' AND (   tp_fechaprograma >= '+SqlValue(fechaHasta)+
      ' OR tp_fechacancer >= '+SqlValue(fechaHasta)+
      ' OR tp_fechadifenilos >= '+SqlValue(fechaHasta)+
      ' OR tp_fechaaccmayores >= '+SqlValue(fechaHasta)+
      ' OR tp_fechadifenilosant >= '+SqlValue(fechaHasta)+
      ' OR tp_fechaaccmayoresant >= '+SqlValue(fechaHasta)+
      ' OR tp_fecha463 >= '+SqlValue(fechaHasta)+
      ' OR tp_fechamapariesgos >= '+SqlValue(fechaHasta)+
      ' OR tp_fechainvenfermedad >= '+SqlValue(fechaHasta)+
      ' OR tp_fechamedidaenfermedad >= '+SqlValue(fechaHasta)+
      ' OR tp_fechainvaccidente >= '+SqlValue(fechaHasta)+
      ' OR tp_fechapram >= '+SqlValue(fechaHasta)+
      ' OR tp_fechaprogramaanexa >= '+SqlValue(fechaHasta)+
      ' OR tp_fechaconstruccion >= '+SqlValue(fechaHasta)+
      ' OR tp_fechatareareclamo >= '+SqlValue(fechaHasta)+
      ' OR tp_fechatareareclamoanexa >= '+SqlValue(fechaHasta)+
      ' OR tp_fechatareareclamoanexa2 >= '+SqlValue(fechaHasta)+
      ' OR tp_fechamedidaaccidente > '+SqlValue(fechaHasta)+')'+
      ' AND tp_tipoprevencion = ''GB'' '+
      ' AND tp_frecuenciavisita IN (' + sIn  + ')';

  if (fechaDesde <> 0) and (fechaDesde = fechaHasta) then
  begin
    sWhereFecha := sWhereFecha +
      ' AND (  (tp_fechaprograma = '+SqlValue(fechaDesde) + ' AND tp_fechaprogramafin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechaconstruccion = '+SqlValue(fechaDesde) + ' AND tp_fechaconstruccionfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechacancer = '+SqlValue(fechaDesde) + ' AND tp_fechacancerfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechadifenilos = '+SqlValue(fechaDesde) + ' AND tp_fechadifenilosfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechacancerant = '+SqlValue(fechaDesde) + ' AND tp_fechacancerfinant = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechadifenilosant = '+SqlValue(fechaDesde) + ' AND tp_fechadifenilosfinant = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechaaccmayores = '+SqlValue(fechaDesde) + ' AND tp_fechaaccmayoresfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fecha463 = '+SqlValue(fechaDesde) + ' AND tp_fecha463fin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechamapariesgos = '+SqlValue(fechaDesde) + ' AND tp_fechamriesgosfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechainvenfermedad = '+SqlValue(fechaDesde) + ' AND tp_fechainvenfermedadfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechamedidaenfermedad = '+SqlValue(fechaDesde) + ' AND tp_fechamedidaenfermedadfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechainvaccidente = '+SqlValue(fechaDesde) + ' AND tp_fechainvaccidentefin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechapram = '+SqlValue(fechaDesde) + ' AND tp_fechapramfin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechaprogramaanexa = '+SqlValue(fechaDesde) + ' AND tp_fechaprogramaanexafin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechamedidaaccidente = '+SqlValue(fechaDesde) + ' AND tp_fechamedidaaccidentefin = ' +SqlValue(fechaDesde) + ') ' +

      ' OR (tp_fechatareareclamo = '+SqlValue(fechaDesde) + ' AND tp_fechatareareclamofin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechatareareclamoanexa = '+SqlValue(fechaDesde) + ' AND tp_fechatareareclamoanexafin = ' +SqlValue(fechaDesde) + ') ' +
      ' OR (tp_fechatareareclamoanexa2 = '+SqlValue(fechaDesde) + ' AND tp_fechatareareclamoanexafin2 = ' +SqlValue(fechaDesde) + ') ' +

      ')';
  end
  else
  begin
    if (fechaDesde <> 0) and (fechaHasta <> 0) then
    begin
      sWhereFecha := sWhereFecha +
      ' AND ( '+
      '    (tp_fechaprograma >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaprograma <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaprogramafin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaprogramafin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaconstruccion >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaconstruccion <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaconstruccionfin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaconstruccionfin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechacancer >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechacancer <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechadifenilos >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechadifenilos <= '+SqlValue(fechaHasta)+')'+


      ' OR (tp_fechacancerant >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechacancerant <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechadifenilosant >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechadifenilosant <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaaccmayores >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaaccmayores <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechacancerfin <= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechacancerfin >= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechadifenilosfin <= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechadifenilosfin >= '+SqlValue(fechaHasta)+')'+


      ' OR (tp_fechacancerfinant <= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechacancerfinant >= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechadifenilosfinant <= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechadifenilosfinant >= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaaccmayoresfin <= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaaccmayoresfin >= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fecha463 >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fecha463 <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fecha463fin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fecha463fin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamapariesgos >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamapariesgos <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamriesgosfin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamriesgosfin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechainvenfermedad >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechainvenfermedad <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechainvenfermedadfin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechainvenfermedadfin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamedidaenfermedad >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamedidaenfermedad <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamedidaenfermedadfin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamedidaenfermedadfin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechainvaccidente >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechainvaccidente <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechainvaccidentefin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechainvaccidentefin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamedidaaccidente >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamedidaaccidente <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechamedidaaccidentefin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechamedidaaccidentefin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechapram >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechapram <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechapramfin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechapramfin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaprogramaanexa >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaprogramaanexa <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechaprogramaanexafin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechaprogramaanexafin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamo >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamo <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamofin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamofin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamoanexa >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamoanexa <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamoanexafin >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamoanexafin <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamoanexa2 >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamoanexa2 <= '+SqlValue(fechaHasta)+')'+

      ' OR (tp_fechatareareclamoanexafin2 >= '+SqlValue(fechaDesde)+ 'AND'+
      '     tp_fechatareareclamoanexafin2 <= '+SqlValue(fechaHasta)+')'+
      ')';
    end
    else
    begin
      if (fechaDesde <> 0) then
      begin
        sWhereFecha := sWhereFecha +
          ' AND (   tp_fechaprograma >= '+SqlValue(fechaDesde)+
          ' OR tp_fechacancer >= '+SqlValue(fechaDesde)+
          ' OR tp_fechaconstruccion >= '+SqlValue(fechaDesde)+
          ' OR tp_fechadifenilos >= '+SqlValue(fechaDesde)+
          ' OR tp_fechacancerant >= '+SqlValue(fechaDesde)+
          ' OR tp_fechadifenilosant >= '+SqlValue(fechaDesde)+
          ' OR tp_fechaaccmayores >= '+SqlValue(fechaDesde)+
          ' OR tp_fecha463 >= '+SqlValue(fechaDesde)+
          ' OR tp_fechamapariesgos >= '+SqlValue(fechaDesde)+
          ' OR tp_fechainvenfermedad >= '+SqlValue(fechaDesde)+
          ' OR tp_fechamedidaenfermedad >= '+SqlValue(fechaDesde)+
          ' OR tp_fechainvaccidente >= '+SqlValue(fechaDesde)+
          ' OR tp_fechapram >= '+SqlValue(fechaDesde)+
          ' OR tp_fechaprogramaanexa >= '+SqlValue(fechaDesde)+
          ' OR tp_fechamedidaaccidente >= '+SqlValue(fechaDesde)+
          ' OR tp_fechatareareclamo >= '+SqlValue(fechaDesde)+
          ' OR tp_fechatareareclamoanexa >= '+SqlValue(fechaDesde)+
          ' OR tp_fechatareareclamoanexa2 >= '+SqlValue(fechaDesde)+
          ')';
      end;
      if (fechaHasta <> 0) then
      begin
        sWhereFecha := sWhereFecha +
          ' AND (   tp_fechaprogramafin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechaconstruccionfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechacancerfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechadifenilosfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechacancerfinant <= '+SqlValue(fechaHasta)+
          ' OR tp_fechadifenilosfinant <= '+SqlValue(fechaHasta)+
          ' OR tp_fechaaccmayoresfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fecha463fin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechamriesgosfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechainvenfermedadfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechamedidaenfermedadfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechainvaccidentefin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechapramfin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechaprogramaanexafin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechamedidaaccidentefin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechatareareclamofin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechatareareclamoanexafin <= '+SqlValue(fechaHasta)+
          ' OR tp_fechatareareclamoanexafin2 <= '+SqlValue(fechaHasta)+
          ')';
      end;
    end;
  end;

  if edEstablecimiento.Text <> '' then
    sWhere := sWhere + ' and tp_establecimiento in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';

  if (not fraLocalidad.IsEmpty) then
    sWhere := sWhere + fraLocalidad.GetWhere;

  if fraDepart.IsSelected then
    sWhere := sWhere + ' AND tp_partido = ' + SqlValue(fraDepart.cmbDescripcion.Text);

  sdqConsulta.SQL.Text := FConsulta +sWhere+sWhereFecha+ sUnion+swhere;
(*
  if edFechaTareaHasta.Date <> 0 then
    sdqConsulta.ParamByName('fechahasta').AsDate := edFechaTareaHasta.Date
  else
    sdqConsulta.ParamByName('fechahasta').AsString := '';
*)
  inherited;
end;

procedure TfrmConsultaTareas.fraPreventorFiltrocmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] <> '%') then
    fraPreventorFiltro.cmbDescripcion.Text := '%' + fraPreventorFiltro.cmbDescripcion.Text;
    fraPreventorFiltro.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] = '%') then
    fraPreventorFiltro.cmbDescripcion.Text := copy(fraPreventorFiltro.cmbDescripcion.Text, 2, length(fraPreventorFiltro.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmConsultaTareas.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  fraPreventorFiltro.Clear;
  edFechaTareaDesde.Clear;
  edFechaTareaHasta.Clear;
  cmbTipoEmpresaPrev.Clear;
  fraTipoFiltroSRT.Clear;
  edEstablecimiento.Clear;
  fraDepart.Clear;
  fraLocalidad.Clear;
  inherited;
end;

function TfrmConsultaTareas.ArmarFiltroEstab(
  Establecimientos: string): string;
var
    i, j: integer;
    cotaMenor, cotaMayor: integer;
    tmpValores: string;
begin
    while (pos('-', Establecimientos) > 0) do
    begin
        i:= pos('-', Establecimientos);
        while (i > 0) and (Establecimientos[i] <> ',') do
            i := i - 1;

        cotaMenor := strtoint(copy(Establecimientos, i+1, pos('-', Establecimientos)-1 - i ));

        i:= pos('-', Establecimientos);
        while (i <= length(Establecimientos)) and (Establecimientos[i] <> ',') do
            i := i + 1;
        cotaMayor := strtoint(copy(Establecimientos, pos('-', Establecimientos)+1, i-1 - pos('-', Establecimientos)));

        tmpValores := '';

        for j:=cotaMenor to cotaMayor do
            tmpValores := tmpValores + ',' + IntToStr(j);

        Establecimientos := StringReplace(Establecimientos, '-', tmpValores + ',', []);
    end;

    result := Establecimientos;
end;

procedure TfrmConsultaTareas.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
(*
  if (sdqConsulta.FieldByName('PRIORIDAD').AsInteger = 1 )then
  begin
    Background := $0098E9EB;
    if Highlight then
       AFont.Color := clBlack;
  end;
*)  
end;

procedure TfrmConsultaTareas.tbCantRegistrosClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    MsgBox('La cantidad de registros es: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION, Self.Caption);
end;

procedure TfrmConsultaTareas.tbConsSiniestrosClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmConsultaSiniestros, frmConsultaSiniestros, tmvMDIChild, nil);
  if not sdqConsulta.IsEmpty then
  begin
    frmConsultaSiniestros.FijarFechaOperativo := true;
    frmConsultaSiniestros.Cuit := sdqConsultaCUIT.Value;
  end;
end;

end.
