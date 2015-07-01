unit unConsultaPonderado;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   04-08-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit,
  DateComboBox, PatternEdit, CardinalEdit, FormPanel;

type
  TfrmConsultaPonderado = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cmbPO_FECHAVIGENCIADesde: TDateComboBox;
    cmbPO_FECHAVIGENCIAHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    edPO_NROPONDERADO: TCardinalEdit;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    edCO_NROCOTIZACION: TCardinalEdit;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    edCO_RAZONSOCIAL: TEdit;
    Label6: TLabel;
    edCO_CUIT: TMaskEdit;
    tbCerrarCotizacion: TToolButton;
    tbSeparador: TToolButton;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbCerrarCotizacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  protected
  public
  end;

var
  frmConsultaPonderado: TfrmConsultaPonderado;

implementation

{$R *.DFM}

uses
  unPrincipal, AnsiSql, unDmPrincipal, unAdminPonderado, unFiltros, unSesion, CustomDlgs;

procedure TfrmConsultaPonderado.tbNuevoClick(Sender: TObject);
begin
  try
    frmAdminPonderado.Show;
  except
    frmAdminPonderado := TfrmAdminPonderado.Create(Self);
  end;
  frmAdminPonderado.DoCargar(0, 'alta');
end;

procedure TfrmConsultaPonderado.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT co_id, co_nrocotizacion, co_razonsocial, co_nrocotizacion || ''/'' || co_orden cotiorden, po_id, po_nroponderado, po_fechavigencia, po_sumafijafinal,' +
          ' po_porcvariablefinal, po_costofinal, po_usucerrado' +
     ' FROM aco_cotizacion, apo_cotizacionponderado, adp_detalleponderado' +
    ' WHERE dp_idcotizacion = co_id' +
      ' AND dp_idcotizacionponderado = po_id';

  sWhere := '';

  if edCO_CUIT.Text <> '' then
    sWhere := sWhere + ' AND co_cuit = ' + SqlValue(edCO_CUIT.Text);

  if edCO_RAZONSOCIAL.Text <> '' then
    sWhere := sWhere + ' AND co_razonsocial LIKE ' + SqlValue(edCO_RAZONSOCIAL.Text + '%');

  if edCO_NROCOTIZACION.Value <> 0 then
    sWhere := sWhere + DoFiltroComponente(edCO_NROCOTIZACION, 'CO_NROCOTIZACION', '=');

  if edPO_NROPONDERADO.Value <> 0 then
    sWhere := sWhere + DoFiltroComponente(edPO_NROPONDERADO, 'PO_NROPONDERADO', '=');

  sWhere := sWhere + DoFiltroComponente(cmbPO_FECHAVIGENCIADesde, 'PO_FECHAVIGENCIA', '>=');
  sWhere := sWhere + DoFiltroComponente(cmbPO_FECHAVIGENCIAHasta, 'PO_FECHAVIGENCIA', '<=');
  OpenQuery(sdqConsulta, sSql + sWhere + SortNumerico(SortDialog), True);
  CheckButtons;
end;

procedure TfrmConsultaPonderado.FormCreate(Sender: TObject);
begin
  inherited;

  tbCerrarCotizacion.Left := 108;
  tbSeparador.Left := 108;
end;

procedure TfrmConsultaPonderado.tbModificarClick(Sender: TObject);
begin
  try
    frmAdminPonderado.Show;
  except
    frmAdminPonderado := TfrmAdminPonderado.Create(Self);
  end;

  frmAdminPonderado.DoCargar(sdqConsulta.FieldByName('po_id').AsInteger, 'modif');
end;

procedure TfrmConsultaPonderado.tbCerrarCotizacionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.FieldByName('po_usucerrado').AsString <> '', nil, 'La cotización ponderada ya ha sido cerrada.');

  sSql :=
    'SELECT 1' +
     ' FROM aco_cotizacion, apo_cotizacionponderado, adp_detalleponderado' +
    ' WHERE dp_idcotizacion = co_id' +
      ' AND dp_idcotizacionponderado = po_id' +
      ' AND po_nroponderado = :nroponderado' +
      ' AND co_usucerrado IS NULL';

  if not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('po_nroponderado').AsString]) then
  begin
    try
      sSql :=
        'UPDATE apo_cotizacionponderado' +
          ' SET po_fechacerrado = :fechacerrado,' +
              ' po_usucerrado = :usuario' +
        ' WHERE po_id = :id';
      EjecutarSqlEx(sSql, [SQL_ACTUALDATE, Sesion.UserId, sdqConsulta.FieldByName('po_id').AsString]);
      MessageDlg('La cotización ponderada ha sido cerrada correctamente.', mtWarning, [mbOK], 0);
    except
      on E: Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end
  else
    MessageDlg('La cotización no puede cerrarse puesto que no han sido cerradas todas las cotizaciones involucradas.', mtError, [mbOK], 0);
end;

procedure TfrmConsultaPonderado.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('po_usucerrado').AsString <> '' then
    aFont.Color := clRed;
end;

end.
