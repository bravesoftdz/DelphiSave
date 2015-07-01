unit unCostosxSin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, ImgList, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, CheckPanel, unFraEmpresa, unfraPrestador,
  unArtFrame, unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, unFraCIE10, SinEdit,General, unArtDBAwareFrame,
  unArtDbFrame, unFraGrupoTrabajo;

type
  TfrmCostosxSin = class(TfrmCustomConsulta)
    ChkSin: TCheckPanel;
    ChkCIE10: TCheckPanel;
    chkFAcc: TCheckPanel;
    ChkGTrab: TCheckPanel;
    Chkdeleg: TCheckPanel;
    ChkEmpresa: TCheckPanel;
    ChkPrestador: TCheckPanel;
    ChkPrestadorGt: TCheckPanel;
    SinDde: TSinEdit;
    SinHta: TSinEdit;
    fraCIE10: TfraCIE10;
    faccdde: TDateComboBox;
    facchta: TDateComboBox;
    fraDeleg: TfraCodigoDescripcion;
    Prestador: TfraPrestador;
    PrestadorGasto: TfraPrestador;
    fraEmpresa: TfraEmpresa;
    Fhta: TDateComboBox;
    Fdde: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  end;

var
  frmCostosxSin: TfrmCostosxSin;

implementation

uses
  AnsiSql;

{$R *.DFM}

procedure TfrmCostosxSin.tbRefrescarClick(Sender: TObject);
var
  SPrestGT: String;
  SSql: String;
begin
  if (not fdde.IsEmpty) and (not fhta.IsEmpty) then
  begin
    if (chkPrestadorGT.Checked) and (PrestadorGasto.IDPrestador <> 0) then
      SPrestGT := IntToStr(PrestadorGasto.IDPrestador)
    else
      SPrestGT :=' NULL ';

    SSQL :=
      'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida, ''-''),  tj_nombre, mp_nombre,' +
            ' NVL(ex_fecharecaida, ex_fechaaccidente), ex_altamedica, ex_diagnosticooms, ca_descripcion, gp_nombre,' +
            ' lg_nombre,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida, ' + fdde.SqlText + ', ' + fhta.SqlText + ', 2, ' + SPrestGT + ') + art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 26, ' + SPrestGT + ') Protesis,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 22, ' + SPrestGT + ') Ambulatorias,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 23, ' + SPrestGT + ') + art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 72, ' + SPrestGT + ') Internaciones,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 24, ' + SPrestGT + ') + art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 1, ' + SPrestGT + ') Medicamentos,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 28, ' + SPrestGT + ') Quirurgicas,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 29, ' + SPrestGT + ') Especiales,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 30, ' + SPrestGT + ') Ambulancias,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 68, ' + SPrestGT + ') + art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 27, ' + SPrestGT + ') Traslados,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 69, ' + SPrestGT + ') + art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 7, ' + SPrestGT + ') Hospedaje,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 70, ' + SPrestGT + ') FKT,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 73, ' + SPrestGT + ') Socioamb,' +
            ' art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', 76, ' + SPrestGT + ') Psico,' +
            ' art.liq.Get_ImpLiqNoAut(ex_siniestro, ex_orden, ex_recaida,  ' + fdde.SqlText + ', ' + fhta.SqlText + ', ' + SPrestGT + ') NoAprob,''Gastos Estimados'', siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
       ' FROM dlg_delegaciones, mgp_gtrabajo, cpr_prestador, cmp_empresas, ctj_trabajadores, sex_expedientes' +
      ' WHERE ex_cuil = tj_cuil' +
        ' AND ex_cuit = mp_cuit' +
        ' AND ex_prestador = ca_identificador (+)' +
        ' AND ex_gtrabajo = gp_codigo' +
        ' AND NVL(ex_causafin, ''0'') NOT IN (''99'', ''95'')' +
        ' AND ex_delegacion = lg_codigo';

    if ChkSin.Checked then
      if (sindde.SiniestroSql <> '') and (sinhta.SiniestroSql <> '') then
        SSQL := SSQL + ' AND ex_siniestro between ' + sindde.SiniestroSql  + ' and ' + sinhta.SiniestroSql;

    if ChkCIE10.Checked then
      if fraCIE10.edCodigo.text <> '' then
        SSQL := SSQL + ' AND ex_diagnosticooms = ''' + fraCIE10.edCodigo.Text + '''';

    if ChkFAcc.Checked then
      if (faccdde.SqlText <> '') and (facchta.SqlText <> '') then
        SSQL := SSQL + ' AND ex_fechaaccidente between ' + faccdde.SqlText + ' and ' + facchta.SqlText;

    if ChkGTrab.Checked then
    begin
        if  (fraGrupoTrabajo.ID <> '') then
          SSQL := SSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

        if (fraGrupoTrabajo.cmbGestor.Text <> '') then
          SSQL := SSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
    end;

    if Chkdeleg.Checked then
      if Fradeleg.edCodigo.Text <> '' then
        SSQL := SSQL + ' AND ex_delegacion = ' + Fradeleg.edCodigo.Text;

    if ChkPrestador.Checked then
      if prestador.IDPrestador <> 0 then
        SSQL := SSQL + ' AND ex_prestador = ' + IntToStr(prestador.IDPrestador);

    if ChkEmpresa.Checked then 
      if fraEmpresa.IsSelected then
        SSQL := SSQL + ' AND ex_cuit = ' + SQLValue(fraEmpresa.CUIT);

    sdqConsulta.SQL.text:=SSQL;
    inherited;
  end
  else
    MsgBox('Debe completar las fechas desde y hasta.');
end;

procedure TfrmCostosxSin.FormCreate(Sender: TObject);
begin
  inherited;

  fradeleg.TableName          := 'dlg_delegaciones';
  fradeleg.FieldCodigo        := 'LG_Codigo';
  fradeleg.FieldDesc          := 'LG_Nombre';
  fradeleg.FieldBaja          := 'LG_FECHABAJA'; // By Fede 22/08/2002
  fradeleg.ShowBajas          := True;           // By Fede 22/08/2002
end;

procedure TfrmCostosxSin.tbLimpiarClick(Sender: TObject);
begin
  sindde.Clear;
  sinhta.Clear;
  fracie10.Limpiar;
  faccdde.ClearDate;
  facchta.ClearDate;
  fragrupotrabajo.Clear;
  fradeleg.Clear;
  prestador.Limpiar;
  prestadorgasto.Limpiar;
  fraEmpresa.Clear;
  fdde.ClearDate;
  fhta.ClearDate;
  chksin.checked := False;
  chkcie10.checked := False;
  chkfacc.checked := False;
  chkgtrab.checked := False;
  chkdeleg.checked := False;
  chkprestador.checked := False;
  chkprestadorgt.checked := False;
  chkEmpresa.checked := False;

  inherited;
end;

end.
