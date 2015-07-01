unit unListInternadosb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ABMDialog, Db, SDEngine, ExtCtrls, QuickRpt,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, ShortCutControl, ComCtrls, ToolWin, StdCtrls, Mask, ToolEdit,
  ArtComboBox, unfraPrestador, Grids, DBGrids, RXDBCtrl, ArtDBGrid, unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TfrmListInternadosb = class(TForm)
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    QueryPrint: TQueryPrint;
    pnlFiltros: TPanel;
    Label1: TLabel;
    fraPrestador: TfraPrestador;
    cmbGTrabajo: TArtComboBox;
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
    sdqGTrabajo: TSDQuery;
    dsGTrabajo: TDataSource;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    Panel2: TPanel;
    chkComMed: TCheckBox;
    Panel1: TPanel;
    chkSRT: TCheckBox;
    edDelegacion: TEdit;
    edGTrabajo: TEdit;
    Panel3: TPanel;
    ChkCronicos: TCheckBox;
    PrintDialog: TPrintDialog;
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
    procedure edGTrabajoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGTrabajoCloseUp(Sender: TObject);
    procedure cmbGTrabajoChange(Sender: TObject);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure cmbDelegacionChange(Sender: TObject);
  private
  public
  end;

var
  frmListInternadosb: TfrmListInternadosb;

implementation

uses
  unPrincipal, General, unDmPrincipal, CustomDlgs, AnsiSql;

{$R *.DFM}

procedure TfrmListInternadosb.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  Cancel := True;
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  QueryPrint.Print;
end;

procedure TfrmListInternadosb.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
  SqlWhere: String;
begin
  SqlWhere := '' ;
  Sql := '';
  QueryPrint.SubTitle.Text := ' ';

  if (fraPrestador.IDPrestador <> 0) then
  begin
    SqlWhere := ' AND   ca_identificador = ' + SqlValue(fraPrestador.IDPrestador);
    QueryPrint.SubTitle.Text := #13 + #13 + 'Prestador: ' + IntToStr(fraPrestador.IDPrestador) + ' - ' + fraPrestador.RazonSocial;
  end;

  if (cmbGtrabajo.Text <> '') then
  begin
    SqlWhere := SqlWhere + ' and gp_codigo = ' + SqlString(cmbGTrabajo.FieldValue, True);
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Grupo de Trabajo: ' + cmbGTrabajo.Text;
  end;

  if (cmbDelegacion.Text <> '') then
  begin
    SqlWhere := SqlWhere + ' and lg_codigo = ' + SqlString(cmbDelegacion.FieldValue, True);
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Delegación: ' + cmbDelegacion.Text + #13;
  end;

  if chkComMed.Checked then
  begin
    SqlWhere := SqlWhere +  ' AND art.inca.is_dictamencommed(in_siniestro, in_orden) = ''S'' ';
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Con Comisión Médica';
  end;

  if chkSRT.Checked then
  begin
    SqlWhere := SqlWhere +
      ' AND Exists (SELECT 1' +
                    ' FROM SDG_DENUNCIASGRAVES' +
                   ' WHERE DG_SINIESTRO = IN_SINIESTRO' +
                     ' AND DG_ORDEN = IN_ORDEN)';
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Denuncias Graves';
  end;

  if ChkCronicos.Checked then
  begin
    SqlWhere := SqlWhere + ' AND in_cronico = ''S'' ';
    QueryPrint.SubTitle.Text := QueryPrint.SubTitle.Text + #13 + 'Crónicos';
  end
  else
    SqlWhere := SqlWhere + ' AND in_cronico = ''N'' ';

  Sql :=
    'SELECT in_siniestro || ''-'' || in_orden || ''-'' || in_recaida Siniestro, in_cuil Cuil,' +
          ' tj_nombre Apellido_Nombre, in_cuit Cuit, mp_nombre Razon_Social, in_fecha Fec_Sini,' +
          ' in_diagnostico Diagnostico, in_cie10 Cie10, in_internadodesde Int_Desde, ca_descripcion Prestador,' +
          ' ca_codarea || '' '' || ca_telefono Telefono, pv_descripcion Provincia, in_operprog "Oper_Prog.", lg_nombre Delegación,' +
          ' gp_nombre "G.Trabajo"' +
     ' FROM min_internado, ctj_trabajadores, cmp_empresas, cpr_prestador, cpv_provincias, dlg_delegaciones,' +
          ' mgp_gtrabajo' +
    ' WHERE tj_cuil = in_cuil' +
      ' AND mp_cuit = in_cuit' +
      ' AND ca_identificador = in_prestador' +
      ' AND ca_provincia = pv_codigo (+)' +
      ' AND in_delegacion = lg_codigo' +
      ' AND in_gtrabajo = gp_codigo ' +
            SqlWhere;
  try
    OpenQuery(sdqConsulta, Sql);
  except
    on E: Exception do
      ErrorMsg(E);
  end;
end;

procedure TfrmListInternadosb.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListInternadosb.tbOrdenarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
    SortDialog.Execute;
end;

procedure TfrmListInternadosb.tbImprimirClick(Sender: TObject);
begin
  if (not sdqConsulta.IsEmpty) and (PrintDialog.Execute) then
    with QueryPrint do
    begin
      Footer.Text := frmPrincipal.DBLogin.Usuario;
      Title.Text  := Caption;
      Print;
    end;
end;

procedure TfrmListInternadosb.tbExportarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty Then
    ExportDialog.Execute;
end;

procedure TfrmListInternadosb.tbLimpiarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  fraPrestador.Limpiar;
  cmbGTrabajo.Text         := '';
  edGTrabajo.Text          := '';
  cmbGTrabajo.FieldValue   := '';
  edDelegacion.Text        := '';  
  cmbDelegacion.Text       := '';
  cmbDelegacion.FieldValue := '';
  chkComMed.Checked        := False;
  chkSRT.Checked           := False;
  chkCronicos.Checked      := False;
end;

procedure TfrmListInternadosb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqConsulta.Close;
  Action := caFree;
  frmPrincipal.mnuPasientesInternados.Enabled := True;
end;

procedure TfrmListInternadosb.FormCreate(Sender: TObject);
begin
  sdqGTrabajo.Open;
  sdqDelegacion.Open;
end;

procedure TfrmListInternadosb.dbgGrillaPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                   FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  if Column = 'SINIESTRO' then
    Value := IntToStr(sdqConsulta.RecordCount);
end;

{----[G.Trabajo]-----------------------------------------------------------------------------------------------------------------}
procedure TfrmListInternadosb.edGTrabajoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    cmbGTrabajo.FieldValue := edGTrabajo.Text;
end;

procedure TfrmListInternadosb.cmbGTrabajoCloseUp(Sender: TObject);
begin
  if (Trim(cmbGTrabajo.Text) <> '') then
    edGTrabajo.Text := cmbGTrabajo.FieldValue;
end;

procedure TfrmListInternadosb.cmbGTrabajoChange(Sender: TObject);
begin
  if Trim(cmbGTrabajo.Text) = '' then
    edGTrabajo.Text := '';
end;

{----[Delegación]----------------------------------------------------------------------------------------------------------------}
procedure TfrmListInternadosb.edDelegacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmListInternadosb.cmbDelegacionCloseUp(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) <> '' then
    edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmListInternadosb.cmbDelegacionChange(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) = '' then
    edDelegacion.Text := '';
end;

end.
