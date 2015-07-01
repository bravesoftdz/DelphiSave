unit unListOperProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, SDEngine, SortDlg, artSeguridad, Placemnt, ShortCutControl,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  ExtCtrls, Mask, ToolEdit, DateComboBox, QueryPrint, QueryToFile,
  ExportDialog, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraGrupoTrabajo,
  unfraDelegacion, unArtDbFrame, unfraPrestador;

type
  TfrmListOperProg = class(TForm)
    pnlFiltros: TPanel;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton5: TToolButton;
    tbExportar: TToolButton;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    DBGrid: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    SortDialog: TSortDialog;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    tbImprimir: TToolButton;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    FormStorage: TFormStorage;
    PrintDialog: TPrintDialog;
    gbFechaInternacion: TGroupBox;
    edDesde: TDateComboBox;
    Label3: TLabel;
    edHasta: TDateComboBox;
    gbGrupoTrabajo: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    gbTipoAccidente: TGroupBox;
    fraTipoAccidente: TfraStaticCTB_TABLAS;
    gbDelegacion: TGroupBox;
    fraDelegacion: TfraDelegacion;
    gbCie10: TGroupBox;
    fraCie10: TfraCodigoDescripcion;
    gbPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    ToolButton2: TToolButton;
    lbResultado: TLabel;
    gbFechaParte: TGroupBox;
    Label1: TLabel;
    dcFechaParteDesde: TDateComboBox;
    dcFechaParteHasta: TDateComboBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function Validar: Boolean;
  public
  end;

var
  frmListOperProg: TfrmListOperProg;

implementation

uses unDmPrincipal, unPrincipal, Numeros, CustomDlgs, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbRefrescarClick(Sender: TObject);
var
  Sql :String;
begin
   if Validar then
   begin
     Sql := ' SELECT art.utiles.armar_siniestro (ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                   ' a.pv_nroparte, a.pv_fechaalta, ex_cuil, tj_nombre, ex_cuit, em_nombre, ' +
                   ' NVL (pv_diagnostico, ex_diagnostico) diagnostico, pv_internadodesde, ' +
                   ' pv_internadohasta, ca_descripcion, ca_codarea || '' '' || ca_telefono ca_telefono, pv_nrodenunciasrt, ' +
                   ' ca_fechabaja, gp_nombre gtrabajo, ex_gestor, lG_nombre delegacion, ' +
                   ' ta_descripcion tipoaccidente, ex_diagnosticooms cie10 ' +
              ' FROM art.sex_expedientes, sta_tipoaccidente, art.spv_parteevolutivo A, ' +
                   ' ctj_trabajador, aem_empresa, art.cpr_prestador, art.mgp_gtrabajo, art.DLG_DELEGACIONES ' +
             ' WHERE ex_siniestro = a.pv_siniestro ' +
               ' AND ex_orden = a.pv_orden ' +
               ' AND ex_recaida = a.pv_recaida ' +
               ' AND nvl(ex_gtrabajo, '''') = gp_codigo ' +
               ' AND ex_delegacion = LG_CODIGO(+) ' +
               ' AND ex_tipo = ta_codigo(+) ' +
               ' AND a.pv_fechaalta BETWEEN ' + dcFechaParteDesde.SqlText + ' AND ' + dcFechaParteHasta.SqlText +
               ' AND a.pv_operprog = ''S'' ' +
               ' AND a.pv_fechabaja IS NULL ' +
               ' AND a.pv_nroparte = (SELECT MAX (b.pv_nroparte) ' +
                                      ' FROM art.spv_parteevolutivo b ' +
                                     ' WHERE b.pv_siniestro = a.pv_siniestro ' +
                                       ' AND b.pv_orden = a.pv_orden ' +
                                       ' AND b.pv_recaida = a.pv_recaida ' +
                                       ' AND b.pv_identifprestador= a.pv_identifprestador ' +
                                       ' AND b.pv_operprog = ''S'' ' +
                                       ' AND b.pv_fechabaja IS NULL) ' +
                                       ' AND ex_cuil = tj_cuil ' +
                                       ' AND ex_cuit = em_cuit ' +
                                       ' AND ca_identificador = a.pv_identifprestador ';

     if not fraGrupoTrabajo.IsEmpty then
     begin
       Sql := Sql + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.Value;
       if (fraGrupoTrabajo.cmbGestor.Text <> '') then
         Sql := Sql + ' AND ex_gestor = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
     end;
     if not fraTipoAccidente.IsEmpty then
       Sql := Sql + ' AND ex_tipo = ' + SqlInt(fraTipoAccidente.Value);
     if not fraPrestador.IsEmpty then
       Sql := Sql + ' AND ex_prestador = ' + SqlInt(fraPrestador.IDPrestador);
     if not fraDelegacion.IsEmpty then
       Sql := Sql + ' AND ex_delegacion = ' + SqlInt(fraDelegacion.ID);
     if not fraCie10.IsEmpty then
       Sql := Sql + ' AND ex_diagnosticooms = ' + SqlValue(fraCie10.ID);
     if (edDesde.Date > 0) and (edHasta.Date > 0) then          // Fecha de internado Desde
       Sql := Sql + ' AND A.pv_internadodesde BETWEEN ' + edDesde.SqlText + ' AND ' + edHasta.SqlText;

     OpenQuery(sdqDatos, Sql);

     if sdqDatos.IsEmpty then
       lbResultado.Caption := 'No se encontraron Resultados'
     else if sdqDatos.RecordCount = 1 Then
       lbResultado.Caption := 'Se encontró un registro.'
     else
       lbResultado.Caption := 'Se encontraron ' + LowerCase(NumLetras(sdqDatos.RecordCount)) + ' registros (' + IntToStr(sdqDatos.RecordCount) + ')';
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuListOpProg.Enabled := True;
  Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbLimpiarClick(Sender: TObject);
begin
  edDesde.Clear;
  edHasta.Clear;
  dcFechaParteDesde.Clear;
  dcFechaParteHasta.Clear;
  sdqDatos.Close;
  fraGrupoTrabajo.Clear;
  fraTipoAccidente.Clear;
  fraPrestador.Clear;
  fraDelegacion.Clear;
  fraCie10.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbImprimirClick(Sender: TObject);
begin
  with QueryPrint do
  begin
    Title.Logo.Height := 200;
    Title.Logo.Width  := 1600;
    Footer.Text := frmPrincipal.DBLogin.Usuario;
    if PrintDialog.Execute then Print;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.DBGridTitleClick(Column: TColumn);
begin
  if sdqDatos.Active then
     SortDialog.SortBy(SortDialog.SortFields.ItemsByField[Column.Field.FieldName], otNone);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListOperProg.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if (Field.FieldName = 'CA_DESCRIPCION') and (not sdqDatos.FieldByName('CA_FECHABAJA').IsNull) then
      AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmListOperProg.Validar: Boolean;
begin
  Verificar(dcFechaParteDesde.IsEmpty or dcFechaParteHasta.IsEmpty, gbFechaParte, 'Debe completar las fechas del Parte');
  Result := True;
end;

procedure TfrmListOperProg.FormCreate(Sender: TObject);
begin
  fraTipoAccidente.Clave    := 'STIPO';
  fraTipoAccidente.OrderBy  := 'TB_CODIGO';
  with fraCIE10 do
  begin
    TableName   := 'CDG_DIAGNOSTICO';
    FieldID     := 'DG_CODIGO';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc   := 'DG_DESCRIPCION';
    FieldBaja   := 'DG_FECHABAJA';
    ShowBajas   := False;
  end;
end;

end.
