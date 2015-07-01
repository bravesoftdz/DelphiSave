unit unListIngresosSRT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraTrabajador, SinEdit, StdCtrls, CheckPanel, unFraEmpresa, AnsiSql,
  Mask, ToolEdit, DateComboBox;

type
  TfrmIngresosSRT = class(TfrmCustomConsulta)
    Panel1: TPanel;
    Panel2: TPanel;
    chkSiniestro: TCheckPanel;
    edSiniestro: TSinEdit;
    chkEmpresa: TCheckPanel;
    fraEmpresa: TfraEmpresa;
    chkFIngresoSRT: TCheckPanel;
    dcFIngDesde: TDateComboBox;
    Label5: TLabel;
    dcFIngHasta: TDateComboBox;
    chkTrabajador: TCheckPanel;
    fraTrabajador: TfraTrabajador;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkEmpresaChange(Sender: TObject);
    procedure chkSiniestroChange(Sender: TObject);
    procedure chkFIngresoSRTChange(Sender: TObject);
    procedure chkTrabajadorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIngresosSRT: TfrmIngresosSRT;

implementation

{$R *.dfm}

procedure TfrmIngresosSRT.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'Select art.reca.get_fecharecapresunta(ex_siniestro, ex_orden) frecapresunta, ' +
                ' art.reca.get_fechadespuesrecapresunta(ex_siniestro, ex_orden) fdespreca, ' +
                ' art.reca.get_fechadespuesrecapresunta(ex_siniestro, ex_orden) ' +
                ' - art.reca.get_fecharecapresunta(ex_siniestro, ex_orden) indicador1, ' +
                ' art.reca.get_fechaevento(ex_siniestro, ex_orden, ''042'', ''052'') fev042052, ' +
                ' art.reca.get_fechaevento(ex_siniestro, ex_orden, ''093'', ''095'') fev093095, ' +
                ' art.reca.get_fechaevento(ex_siniestro, ex_orden, ''093'', ''095'') ' +
                ' - art.reca.get_fechaevento(ex_siniestro, ex_orden, ''042'', ''052'') indicador2, ' +
                ' art.reca.get_fechaevento(ex_siniestro, ex_orden, ''013'') fev013, ' +
                ' art.reca.get_fechaevento(ex_siniestro, ex_orden, ''013'') ' +
                ' - art.reca.get_fechaevento(ex_siniestro, ex_orden, ''093'', ''095'') indicador3, ' +
                ' ri_fecingsrt, ' +
                ' art.reca.get_responsableevento(ex_siniestro, ex_orden, ''093'', ''095'') responsable093095, ' +
                ' ri_fecingsrt - art.reca.get_fechaevento(ex_siniestro, ex_orden, ''013'') indicador4, ' +
                ' art.reca.get_usuariocarga(ex_siniestro, ex_orden, ''066'') usuario066, ' +
                ' art.utiles.armar_cuit(ri_cuil) CUIL, ' +
                ' art.utiles.armar_siniestro (ex_siniestro, ex_orden, ex_recaida) SINIESTRO, ' +
                ' art.utiles.armar_cuit(ex_cuit) CUIT, ' +
                ' em_nombre EMPRESA ' +
           ' From ART.SEX_EXPEDIENTES, SIN.SRI_INGRESOSSRT, AFI.AEM_EMPRESA ' +
          ' WHERE EX_CUIT = EM_CUIT(+) ' +
            ' AND EX_ID(+) = RI_IDEXPEDIENTE ';


  if chkSiniestro.Checked then
    sSql := sSql + ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
                   ' AND ex_orden = ' + edSiniestro.OrdenSql +
                   ' AND ex_recaida = ' + edSiniestro.RecaidaSql;

  if chkTrabajador.Checked then
    sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);

  if chkEmpresa.Checked then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if chkFIngresoSRT.Checked then
  begin
    if not dcFIngDesde.IsEmpty then
      sSql := sSql + ' AND ri_fecingsrt >= ' + dcFIngDesde.SqlText;
    if not dcFIngHasta.IsEmpty then
      sSql := sSql + ' AND ri_fecingsrt <= ' + dcFIngHasta.SqlText;
  end;

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

procedure TfrmIngresosSRT.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkSiniestro.Checked   := False;
  chkTrabajador.Checked  := False;
  chkEmpresa.Checked     := False;
  chkFIngresoSRT.Checked := False;
end;

procedure TfrmIngresosSRT.chkEmpresaChange(Sender: TObject);
begin
  inherited;
  if not chkEmpresa.Checked then
    fraEmpresa.Clear;
end;

procedure TfrmIngresosSRT.chkSiniestroChange(Sender: TObject);
begin
  inherited;
  if not chkSiniestro.Checked then
    edSiniestro.Clear;
end;

procedure TfrmIngresosSRT.chkFIngresoSRTChange(Sender: TObject);
begin
  inherited;
  if not chkFIngresoSRT.Checked then
  begin
    dcFIngDesde.Clear;
    dcFIngHasta.Clear;
  end;
end;

procedure TfrmIngresosSRT.chkTrabajadorChange(Sender: TObject);
begin
  inherited;
  if not chkTrabajador.Checked then
    fraTrabajador.Clear;
end;

end.
