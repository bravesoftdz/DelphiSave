unit unPresupuestosCargados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unfraPrestador, Mask, PatternEdit, IntEdit, ToolEdit,
  DateComboBox, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmPresupuestosCargados = class(TfrmCustomConsulta)
    fraCONTRATO: TfraEmpresa;
    Label1: TLabel;
    fraIDENTIFICADOR: TfraPrestador;
    Label2: TLabel;
    edNRO_PRESUPUESTO: TIntEdit;
    edNRO_SOLICITUD: TIntEdit;
    Label3: TLabel;
    Label4: TLabel;
    edSP_FECHASOLICITUDDesde: TDateComboBox;
    Label5: TLabel;
    edSP_FECHASOLICITUDHasta: TDateComboBox;
    Label6: TLabel;
    ShortCutControlHijo: TShortCutControl;
    Label7: TLabel;
    Label8: TLabel;
    edPP_FECHAALTADesde: TDateComboBox;
    edPP_FECHAALTAHasta: TDateComboBox;
    fraCOD_REG_SANITARIA: TfraCodDesc;
    fraLOCALIDAD: TfraCodDesc;
    Label9: TLabel;
    Label10: TLabel;
    pnlBottom: TPanel;
    rgPresSinSolic: TRadioGroup;
    rgVerBajas: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
//    procedure CambioPresupuesto(Sender: TObject);
 //   procedure CambioSolicitud(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    function IsBaja: Boolean;
  protected
    FSQL: String;
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

var
  frmPresupuestosCargados: TfrmPresupuestosCargados;

implementation

uses
  unFiltros, CustomDlgs, VCLExtra, General;

{$R *.dfm}

{ TfrmPresupuestosCargados }

procedure TfrmPresupuestosCargados.RefreshData;
var
  IdSolicitud, IdPresupuesto: Integer;
  sWhere: String;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and Assigned(sdqConsulta.FindField('NRO_SOLICITUD')) then
    IdSolicitud := sdqConsulta.FieldByName('NRO_SOLICITUD').AsInteger
  else
    IdSolicitud := -1;

  if sdqConsulta.Active and not sdqConsulta.IsEmpty and Assigned(sdqConsulta.FindField('NRO_PRESUPUESTO')) then
    IdPresupuesto := sdqConsulta.FieldByName('NRO_PRESUPUESTO').AsInteger
  else
    IdPresupuesto := -1;

  //sWhere := ' AND TIPO IN (1' + iif(chkPresupuestosSinSolicitud.Checked, ',2', '') + ')';

  case rgPresSinSolic.ItemIndex of
    0: sWhere := ' AND TIPO IN (2) ';
    1: sWhere := ' AND TIPO IN (1) ';
    2: sWhere := ' AND TIPO IN (1, 2) ';
  end;

  case rgVerBajas.ItemIndex of
    0: sWhere := sWhere + ' AND pp_fechabaja IS NOT NULL ';
    1: sWhere := sWhere + ' AND pp_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := FSQL + sWhere + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;

  if IdSolicitud > -1 then
    sdqConsulta.Locate('NRO_SOLICITUD', IdSolicitud, [])
  else if IdPresupuesto > -1 then
    sdqConsulta.Locate('NRO_PRESUPUESTO', IdPresupuesto, []);
end;

procedure TfrmPresupuestosCargados.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmPresupuestosCargados.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
  if sdqConsulta.IsEmpty then
    pnlBottom.Caption := 'No se encontraron coincidencias.'
  else
    pnlBottom.Caption := 'Se encontraron ' + IntToStr(sdqConsulta.RecordCount) + ' registros.';

  Grid.ColumnByField['PRESTADOR'].Visible := fraIDENTIFICADOR.IsEmpty;
  Grid.ColumnByField['IDENTIFICADOR'].Visible := fraIDENTIFICADOR.IsEmpty;
  Grid.ColumnByField['CONTRATO'].Visible := fraCONTRATO.IsEmpty;
  Grid.ColumnByField['EM_NOMBRE'].Visible := fraCONTRATO.IsEmpty;
end;

procedure TfrmPresupuestosCargados.ClearData;
begin
  inherited;
  pnlBottom.Caption := '';
  fraCONTRATO.Clear;
  fraIDENTIFICADOR.Clear;
  edNRO_SOLICITUD.Clear;
  edNRO_PRESUPUESTO.Clear;
  edSP_FECHASOLICITUDDesde.Clear;
  edSP_FECHASOLICITUDHasta.Clear;
  edPP_FECHAALTADesde.Clear;
  edPP_FECHAALTAHasta.Clear;
  //chkSolicitudesSinPresupuesto.Checked := False;
  //chkPresupuestosSinSolicitud.Checked := False;
  rgPresSinSolic.ItemIndex := 2;
  rgVerBajas.ItemIndex := 2;
  fraCOD_REG_SANITARIA.Clear;
  fraLOCALIDAD.Clear;
end;

{procedure TfrmPresupuestosCargados.CambioPresupuesto(Sender: TObject);
begin
  chkPresupuestosSinSolicitud.Checked := not(edNRO_PRESUPUESTO.IsEmpty and edPP_FECHAALTADesde.IsEmpty and edPP_FECHAALTAHasta.IsEmpty);
end; }

{procedure TfrmPresupuestosCargados.CambioSolicitud(Sender: TObject);
begin
  chkSolicitudesSinPresupuesto.Checked := not(edNRO_SOLICITUD.IsEmpty and edSP_FECHASOLICITUDDesde.IsEmpty and edSP_FECHASOLICITUDHasta.IsEmpty);
end; }

function TfrmPresupuestosCargados.IsBaja: Boolean;
begin
  Result := not sdqConsulta.FieldByName('PP_FECHABAJA').IsNull;
end;

procedure TfrmPresupuestosCargados.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if IsBaja then
    AFont.Color := clRed;
    
  if AreIn(Field.FullName, ['CONTRATO', 'EM_NOMBRE']) then
  begin
    if sdqConsulta.FieldByName('CO_ESTADO').AsString = '6' then
      AFont.Color := clRed
    else if not AreIn(sdqConsulta.FieldByName('CO_ESTADO').AsString, ['1', '6']) then
      AFont.Color := clMaroon
    else if sdqConsulta.FieldByName('EMPRESA_VIP').AsString = 'S' then
      AFont.Color := clPurple;    
  end;
end;

end.
