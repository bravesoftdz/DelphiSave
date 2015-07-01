unit unListInternados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ABMDialog, Db, SDEngine, ExtCtrls, QuickRpt,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, ShortCutControl, ComCtrls, ToolWin, StdCtrls, Mask, ToolEdit,
  ArtComboBox, unfraPrestador, Grids, DBGrids, RXDBCtrl, ArtDBGrid, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo;

type
  TfrmListInternados = class(TForm)
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    QueryPrint: TQueryPrint;
    pnlFiltros: TPanel;
    Label1: TLabel;
    fraPrestador: TfraPrestador;
    Label2: TLabel;
    Label3: TLabel;
    cmbDelegacion: TArtComboBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton7: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton9: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    dbgGrilla: TArtDBGrid;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    Panel2: TPanel;
    chkComMed: TCheckBox;
    Panel1: TPanel;
    chkSRT: TCheckBox;
    edDelegacion: TEdit;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgGrillaPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
                                   var AlignFooter: TAlingFooter);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure cmbDelegacionChange(Sender: TObject);
  private
  public

  end;

var
  frmListInternados: TfrmListInternados;

implementation

uses
  unPrincipal, General, unDmPrincipal, CustomDlgs, SqlOracle;

{$R *.DFM}

procedure TfrmListInternados.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  Cancel := True;
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  QueryPrint.Print;
end;

procedure TfrmListInternados.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
  SqlWhere: String;
begin
  SqlWhere := '' ;
  Sql := '';
  QueryPrint.SubTitle.Text := ' ';

  if (fraPrestador.IDPrestador <> 0) then
  begin
    SqlWhere := ' and ca_identificador = ' + SqlValue(fraPrestador.IDPrestador);
    QueryPrint.SubTitle.Text := #13 + #13 + 'Prestador: ' + IntToStr(fraPrestador.IDPrestador) + ' - ' + fraPrestador.RazonSocial;
  end;

  // Lu 04/04/2008 por cambio de Personalizacion de Siniestros:
  if  (fraGrupoTrabajo.ID <> '') then
  begin
    SqlWhere := SqlWhere + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Grupo de Trabajo: ' + fraGrupoTrabajo.cmbDescripcion.Text;
  end;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
  begin
    SqlWhere := SqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Usuario Gestor: ' + fraGrupoTrabajo.cmbGestor.Text;
  end;
  
  if cmbDelegacion.Text <> '' then
  begin
    SqlWhere := SqlWhere + ' and cod_delegacion = ' + SqlString(cmbDelegacion.FieldValue, True);
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Delegación: ' + cmbDelegacion.Text + #13;
  end;
  
  if chkComMed.Checked then
  begin
    SqlWhere := SqlWhere + ' AND art.inca.is_dictamencommed(ex_siniestro, ex_orden) = ''S'' ';
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Con Comisión Médica';
  end;

  if chkSRT.Checked then
  begin
    SqlWhere := SqlWhere +
      ' AND Exists (SELECT 1' +
                    ' FROM SDG_DENUNCIASGRAVES' +
                   ' WHERE DG_SINIESTRO = EX_SINIESTRO' +
                     ' AND DG_ORDEN = EX_ORDEN)';
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Denuncias Graves';
  end;

  Sql :=
    'SELECT SINIESTRO, EX_CUIL, TJ_NOMBRE, EX_CUIT, MP_NOMBRE, FECHA, EX_DIAGNOSTICO, PV_INTERNADODESDE,' +
          ' CA_DESCRIPCION, ca_codarea || '' '' || ca_telefono CA_TELEFONO, PV_DESCRIPCION, PV_OPERPROG, DELEGACION, GTRABAJO, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
     ' FROM JUL.INTERNADOS' +
    ' Where 1 = 1' +
    SqlWhere;

  try
    OpenQuery(sdqConsulta, Sql);
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

procedure TfrmListInternados.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListInternados.tbOrdenarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
    SortDialog.Execute;
end;

procedure TfrmListInternados.tbImprimirClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
    with QueryPrint do
    begin
      Footer.Text := frmPrincipal.DBLogin.Usuario;
      Title.Text  := Caption;
      Print;
    end;
end;

procedure TfrmListInternados.tbExportarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
    ExportDialog.Execute;
end;

procedure TfrmListInternados.tbLimpiarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  fraPrestador.Limpiar;
  fraGrupoTrabajo.Clear;
  edDelegacion.Text        := '';
  cmbDelegacion.Text       := '';
  cmbDelegacion.FieldValue := '';
  chkComMed.Checked        := False;
  chkSRT.Checked           := False;
end;

procedure TfrmListInternados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqConsulta.Close;
  Action := caFree;
  frmPrincipal.mnuPasientesInternados.Enabled := True;
end;

procedure TfrmListInternados.FormCreate(Sender: TObject);
begin
  sdqDelegacion.Open;
end;

procedure TfrmListInternados.dbgGrillaPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                  FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  if Column = 'SINIESTRO' then
    Value := IntToStr(sdqConsulta.RecordCount);
end;

{----[Delegación]----------------------------------------------------------------------------------------------------------------}
procedure TfrmListInternados.edDelegacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmListInternados.cmbDelegacionCloseUp(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) <> '' then
    edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmListInternados.cmbDelegacionChange(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) = '' then
    edDelegacion.Text := '';
end;

end.
