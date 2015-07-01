unit unPorTratamiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  ImgList, StdCtrls, Mask, ToolEdit, DateComboBox, unFraEmpresa, SinEdit,
  CheckCombo, DBCheckCombo, unArtFrame,
  unFraCodigoDescripcion, unfraDelegacion, unArtDBAwareFrame, unArtDbFrame,
  PatternEdit, ComboEditor, unFraGrupoTrabajo;

type
  TfrmPorTratamiento = class(TfrmCustomConsulta)
    Label1: TLabel;
    FegDde: TDateComboBox;
    Label2: TLabel;
    FegHta: TDateComboBox;
    CmbTratamiento: TDBCheckCombo;
    Label3: TLabel;
    DseTrat: TDataSource;
    SDQTrat: TSDQuery;
    SinDde: TSinEdit;
    SinHta: TSinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edDelegacion: TEdit;
    cmbDelegacion: TArtComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    fraEmpresa: TfraEmpresa;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionChange(Sender: TObject);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPorTratamiento: TfrmPorTratamiento;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql;

{$R *.DFM}

procedure TfrmPorTratamiento.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  FegDde.Clear;
  FegHta.Clear;
  Cmbtratamiento.ClearChecks;
  Cmbtratamiento.Clear;
  SinDde.Clear;
  Sinhta.Clear;
  fraGrupoTrabajo.Clear;
  edDelegacion.Clear;
  cmbDelegacion.Clear;
  fraEmpresa.edContrato.text := '';
  fraEmpresa.cmbRSocial.Clear;
  fraEmpresa.mskCUIT.Text := '';
  FegDde.SetFocus;
end;

procedure TfrmPorTratamiento.tbRefrescarClick(Sender: TObject);
Var SSQL:String;
begin
SSQL := 'SELECT pe_siniestro Siniestro, pe_orden Orden, pe_recaida Recaida, ' +
        ' Tj_nombre Paciente, mp_nombre Empresa, NVL(pe_fechabajamedica,' +
        ' NVL(ex_fecharecaida, ex_fechaaccidente)) Fec_Baja, pe_altamedica ' +
        ' Alta_Med, pe_fechaaltamedica Alta_Laboral, tb_descripcion ' +
        ' Tratamiento, lg_nombre Delegacion, gp_nombre GTrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
        ' FROM ctj_trabajadores, cmp_empresas, sex_expedientes, ctb_tablas, ' +
        ' spe_parteegreso, dlg_delegaciones, mgp_gtrabajo ' +
        'WHERE pe_tratamiento IS NOT NULL ' +
        ' AND pe_siniestro = ex_siniestro ' +
        ' AND pe_orden = ex_orden ' +
        ' AND pe_recaida = ex_recaida ' +
        ' AND pe_recaida = ex_recaida ' +
        ' AND	ex_cuil = tj_cuil ' +
        ' AND	ex_cuit = mp_cuit ' +
        ' AND tb_clave (+) = ''CTRAT'' ' +
        ' AND tb_codigo (+) = pe_tipotratamiento ' +
        ' AND pe_tratamiento = ''S'' ' +
        ' AND ex_delegacion = lg_codigo ' +
        ' AND ex_gtrabajo = gp_codigo ';

  if (not fegdde.isempty) and (not feghta.isempty) then begin
        SSQL := SSQL + ' and pe_fechaalta between ' + fegdde.SqlText + ' and ' + feghta.SqlText;
  end;

  if cmbtratamiento.InSql <> '' then begin
        SSQL := SSQL + ' and pe_tipotratamiento ' + cmbtratamiento.InSql ;
  end;

  if (Sindde.SiniestroS  <> '') and (Sinhta.SiniestroS <> '') then begin
        SSQL := SSQL + ' and pe_siniestro between ' + Sindde.SiniestroSql + ' and ' + Sinhta.SiniestroSql ;
  end;

  if eddelegacion.Text <> '' then begin
        SSQL := SSQL + ' and ex_delegacion=' + eddelegacion.Text ;
  end;

  if  (fraGrupoTrabajo.ID <> '') then
    sSQL := sSQL + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
    sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

  if fraempresa.mskCUIT.Text <> '' then begin
        SSQL := SSQL + ' and ex_Cuit=' + fraempresa.mskCUIT.Text ;
  end;

  sdqconsulta.SQL.text := SSQL;

  inherited;

end;

procedure TfrmPorTratamiento.FormCreate(Sender: TObject);
begin
        inherited;
        OpenQuery( sdqtrat );
        OpenQuery( sdqdelegacion );
end;

procedure TfrmPorTratamiento.edDelegacionKeyPress(Sender: TObject;
  var Key: Char);
begin
      if ( Key = #13 ) Then
      cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmPorTratamiento.cmbDelegacionChange(Sender: TObject);
begin
   if Trim( cmbDelegacion.Text ) = '' Then
       edDelegacion.Text := '';
end;

procedure TfrmPorTratamiento.cmbDelegacionCloseUp(Sender: TObject);
begin
    if ( Trim(cmbDelegacion.Text) <> '' ) Then
      edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmPorTratamiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
