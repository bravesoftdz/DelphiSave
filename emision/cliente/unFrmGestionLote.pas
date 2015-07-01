unit unFrmGestionLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, StdCtrls, unArtFrame, unFraCodigoDescripcion, Mask,
  PatternEdit, ToolEdit, DateComboBox, PeriodoPicker, FormPanel, ExtCtrls,
  DB, SDEngine, unArtDBAwareFrame;

type
  TfrmGestionLote = class(TForm)
    gbLoteDeGestion: TGroupBox;
    lblGestor: TLabel;
    fraGestor: TfraCodigoDescripcion;
    lblOrden: TLabel;
    gbAcciones: TGroupBox;
    cbComandos: TCoolBar;
    ToolBar: TToolBar;
    tbPropiedades: TToolButton;
    tbOrdenar: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    btnAsignarALote: TToolButton;
    tbDesasignarALote: TToolButton;
    tbSalir: TToolButton;
    tbReprogramar: TToolButton;
    tbCancelar: TToolButton;
    pnDetalle: TPanel;
    pgDetalleGestion: TPageControl;
    tsObservacionesRealizadas: TTabSheet;
    tsGestionRealizadas: TTabSheet;
    dbgGestionesRealizadas: TArtDBGrid;
    dbgObservacionesRealizadas: TArtDBGrid;
    dbgInformacionParaGestion: TArtDBGrid;
    cmbOrden: TComboBox;
    fraLote: TfraCodigoDescripcion;
    lblLote: TLabel;
    sdqAcciones: TSDQuery;
    sdqObservaciones: TSDQuery;
    sdqGestionesRealizadas: TSDQuery;
    sdqInformacionGestion: TSDQuery;
    dsObservaciones: TDataSource;
    dsGestionesRealizadas: TDataSource;
    dsInformacionGestion: TDataSource;
    dsAcciones: TDataSource;
    tbRefrescar: TToolButton;
    tbResumen: TToolButton;
    ntResumenDetalle: TNotebook;
    fpSeleccionPeriodos: TFormPanel;
    btnAceptarIncluir: TButton;
    btnCancelarIncluir: TButton;
    gbPeriodosAIncluir: TGroupBox;
    lblIncluirPeriodo: TLabel;
    lblIncluirPeriodoHasta: TLabel;
    lblContrato: TLabel;
    lblDescripcion: TLabel;
    ppPeriodoDesde: TPeriodoPicker;
    ppPeriodoHasta: TPeriodoPicker;
    edtContrato: TEdit;
    edtDescripcion: TEdit;
    dbgAcciones: TArtDBGrid;
    dbgProgreso: TArtDBGrid;
    sb: TStatusBar;
    tbLimpiar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure dbgAccionesDblClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbResumenClick(Sender: TObject);
  private
    function GetResumen: string;
    function GetDetalle: string;
    procedure FormatGrid(AResumen: Boolean);
    procedure Inicializar;
    procedure OnfraGestorChange(Sender: TObject);
    procedure OnFraLoteChange(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGestionLote: TfrmGestionLote;

implementation

uses unDmPrincipal, unDmEmision, unFrmDetalleComunicacion, AnsiSql, SqlFuncs,
     CustomDlgs, DBFuncs, unSesion, General, StrFuncs;

{$R *.dfm}

procedure TfrmGestionLote.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmGestionLote.Inicializar;
begin
  with fraLote do
  begin
    TableName   := 'EMI.ILO_LOTE';
    FieldID     := 'LO_ID';
    FieldCodigo := 'LO_ID';
    FieldDesc   := 'LO_DESCRIPCION';
    FieldBaja   := 'LO_FECHABAJA';
    OnChange    := OnFraLoteChange;
  end;

  with fraGestor do
  begin
    TableName   := '(SELECT us.se_id ID , us.se_nombre NOMBRE, us.se_fechabaja FECHABAJA ' +
                   '   FROM art.use_usuarios us, emi.ilo_lote ilo, emi.igl_gestorlote igl ' +
                   '  WHERE igl.gl_idlote = ilo.lo_id AND igl.gl_usuario = us.se_usuario)';
    FieldID     := 'ID';
    FieldCodigo := 'ID';
    FieldDesc   := 'NOMBRE';
    FieldBaja   := 'FECHABAJA';
    ShowBajas   := true;
    onChange    := OnfraGestorChange;
  end;
end;


procedure TfrmGestionLote.OnFraLoteChange(Sender : TObject);
var
 Consulta : String;
begin
  if fraLote.IsSelected then
    Consulta := '(SELECT distinct us.se_id ID , us.se_nombre NOMBRE, us.se_fechabaja FECHABAJA ' +
                   '   FROM art.use_usuarios us, emi.ilo_lote ilo, emi.igl_gestorlote igl ' +
                   '  WHERE igl.gl_idlote = ilo.lo_id AND igl.gl_usuario = us.se_usuario ' +
                   '    AND igl.gl_idlote = ' + SqlValue(fraLote.Codigo) + ')'
  else
    Consulta := '(SELECT distinct us.se_id ID , us.se_nombre NOMBRE, us.se_fechabaja FECHABAJA ' +
                '   FROM art.use_usuarios us, emi.ilo_lote ilo, emi.igl_gestorlote igl ' +
                '  WHERE igl.gl_idlote = ilo.lo_id AND igl.gl_usuario = us.se_usuario)';

  with fraGestor do
  begin
    TableName   := consulta;
    FieldID     := 'ID';
    FieldCodigo := 'ID';
    FieldDesc   := 'NOMBRE';
    FieldBaja   := 'FECHABAJA';
    ShowBajas   := true;
    onChange    := OnfraGestorChange;
  end;

end;


procedure TfrmGestionLote.OnfraGestorChange(Sender : TObject);
var
 Consulta : string;
begin
  if fraGestor.IsSelected then
    Consulta := '(SELECT distinct ilo.lo_id, ilo.lo_descripcion, ilo.lo_fechabaja ' +
                '   FROM art.use_usuarios us, emi.ilo_lote ilo, emi.igl_gestorlote igl  ' +
                '  WHERE igl.gl_idlote = ilo.lo_id AND igl.gl_usuario = us.se_usuario  ' +
                '    AND igl.gl_usuario =  ' + SqlValue(fraGestor.Codigo) + ')'
  else
    Consulta := ' EMI.ILO_LOTE ';

  with fraLote do
  begin
    TableName   := Consulta;
    FieldID     := 'LO_ID';
    FieldCodigo := 'LO_ID';
    FieldDesc   := 'LO_DESCRIPCION';
    FieldBaja   := 'LO_FECHABAJA';
  end;
end;



procedure TfrmGestionLote.tbPropiedadesClick(Sender: TObject);
begin
  fpSeleccionPeriodos.ShowModal;
end;

procedure TfrmGestionLote.dbgAccionesDblClick(Sender: TObject);
begin
  with TFrmDetalleComunicacion.create(self) do
    Showmodal;
(*  with TFrmDetalleComunicacion.create(self) do
  try
    if sdqAcciones.RecordCount > 0 then
      Cargar(sdqAcciones.FieldByName('da_id').AsInteger);
  finally
    free;
  end;
*)
end;

procedure TfrmGestionLote.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGestionLote.tbRefrescarClick(Sender: TObject);
var
 sSql : string;
begin
  if tbResumen.Down then
       sSql := GetResumen
  else sSql := GetDetalle;

  if fraLote.IsSelected then
    sSql := sSql + ' AND ILD.LD_IDLOTE = ' + SqlValue(fraLote.Codigo);

  if fraGestor.IsSelected then
    sSql := sSql + ' AND IGL.GL_ID = ' + SqlValue(fraGestor.Codigo);

  case cmbOrden.ItemIndex of
  0 : begin
        sSql := sSql + ' ORDER BY DA_ORDEN';
      end;
  1 : begin
        sSql := sSql + ' ORDER BY DA_SUBACCION, DA_ORDEN';
      end;
  2 : begin
        sSql := sSql + ' ORDER BY CO_CONTRATO ';
      end;
  3 : begin
        sSql := sSql + ' ORDER BY GL_ID ';
      end;
  end;
  sdqAcciones.SQL.Text := sSql;
  sdqAcciones.Open;
end;


function TfrmGestionLote.GetResumen : string;
begin
  result := 'SELECT ida.da_idaccion, ida.da_subaccion, ida.da_fechaplanificada,       ' +
       '      ida.da_cantidadpostergaciones, ida.da_idgestor, ida.da_observaciones, ' +
       '      ida.da_resultadogestion, ida.da_idloteddjj, ida.da_orden, ' +
       '       iac.ac_descripcion, isa.sa_descripcion, igl.gl_usuario, ' +
       '       idj.dj_contrato, aem.em_nombre, count(*) as  "Cantidad Periodos" ' +
       '  FROM ' +
       '       emi.iac_accion iac, ' +
       '       emi.isa_subaccion isa, ' +
       '       emi.idj_ddjj idj, ' +
       '       emi.ild_loteddjj ild, ' +
       '       emi.igl_gestorlote igl,   ' +
       '       afi.aco_contrato aco, ' +
       '       afi.aem_empresa aem, ' +
       '       emi.ida_ddjjaccion ida ' +
       ' WHERE (    (iac.ac_id = ida.da_idaccion) ' +
       '        AND (idj.dj_id = ild.ld_idddjj) ' +
       '        AND (ild.ld_id = ida.da_idloteddjj) ' +
       '        AND (igl.gl_id = ida.da_idgestor) ' +
       '        AND (idj.dj_contrato = aco.co_contrato) ' +
       '        AND (aem.em_id = aco.co_idempresa)) ' +
       '   AND (isa.sa_id = ida.da_subaccion) ' +
       ' group by ida.da_idaccion, ida.da_subaccion, ida.da_fechaplanificada, ' +
       '       ida.da_cantidadpostergaciones, ida.da_idgestor, ida.da_observaciones, ' +
       '       ida.da_resultadogestion, ida.da_idloteddjj, ida.da_orden, ' +
       '       iac.ac_descripcion, isa.sa_descripcion, igl.gl_usuario,  ' +
       '       idj.dj_contrato, aem.em_nombre ';
  FormatGrid(true);
end;

function TfrmGestionLote.GetDetalle : string;
begin
  result := 'SELECT ida.da_id, ida.da_idaccion, ida.da_subaccion, ida.da_fechaplanificada, ' +
            ' ida.da_cantidadpostergaciones, ida.da_idgestor, ida.da_fechaaplicada, ' +
            ' ida.da_usualta, ida.da_fechaalta, ida.da_usumodif, ida.da_fechamodif, ' +
            ' ida.da_usubaja, ida.da_fechabaja, ida.da_observaciones, ' +
            ' ida.da_resultadogestion, ida.da_idloteddjj, ida.da_orden, ' +
            ' iac.ac_descripcion, igl.gl_usuario, idj.dj_contrato, idj.dj_id, ' +
            ' idj.dj_contrato, idj.dj_periodo, aem.em_nombre ' +
            ' FROM                      ' +
            ' afi.aem_empresa aem,      ' +
            ' emi.ida_ddjjaccion ida,   ' +
            ' emi.iac_accion iac,       ' +
            ' emi.isa_subaccion isa,    ' +
            ' emi.idj_ddjj idj,         ' +
            ' emi.igl_gestorlote igl,   ' +
            ' afi.aco_contrato aco,     ' +
            ' emi.ild_loteddjj ild      ' +
            ' WHERE                     ' +
            '  (ild.ld_id = ida.da_idloteddjj)      ' +
            '  AND (ida.da_idaccion  = iac.ac_id)       ' +
            '  AND (ida.da_subaccion = isa.sa_codigo )  ' +
            '  AND (ild.ld_idddjj = idj.dj_id)          ' +
            '  AND (ida.da_idgestor = igl.gl_idlote (+))' +
            '  AND (idj.dj_contrato = aco.co_contrato)  ' +
            '  AND (aco.co_idempresa = aem.em_id)        ';
  FormatGrid(false);            
end;

procedure TfrmGestionLote.FormatGrid(AResumen : Boolean);
begin
  if AResumen then
       ntResumenDetalle.ActivePage := 'Resumen'
  else ntResumenDetalle.ActivePage := 'Detalle';

end;


procedure TfrmGestionLote.tbLimpiarClick(Sender: TObject);
begin
  fraLote.Clear;
  fraGestor.Clear;
  cmbOrden.ItemIndex := 0;  
end;

procedure TfrmGestionLote.tbResumenClick(Sender: TObject);
begin
  if tbResumen.Down then
    ntResumenDetalle.ActivePage := 'Resumen'
  else
    ntResumenDetalle.ActivePage := 'Detalle';
end;

end.
