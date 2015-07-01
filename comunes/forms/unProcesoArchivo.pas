unit unProcesoArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls;

type
  TfrmProcesoArchivo = class(TfrmCustomConsulta)
    pcFiltrosBusqueda: TPageControl;
    TabSheet1: TTabSheet;
    lbTipoArchivoFiltro: TLabel;
    lbProcesoFiltro: TLabel;
    lbCodigoErrorFiltro: TLabel;
    cbResueltoFiltro: TCheckBox;
    cbSinResolverFiltro: TCheckBox;
    fraTipoArchivoFiltro: TfraCodigoDescripcion;
    fraProcesoFiltro: TfraCodigoDescripcion;
    fraCodigoErrorFiltro: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure fraTipoArchivoFiltroOnChange(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcesoArchivo: TfrmProcesoArchivo;

implementation

uses
  AnsiSql, unSesion, unDmPrincipal;

{$R *.dfm}

procedure TfrmProcesoArchivo.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTipoArchivoFiltro do
  begin
    TableName      := 'COMUNES.CTP_TIPOPROCESOARCHIVO';
    FieldID        := 'tp_id';
    FieldCodigo    := 'tp_codigo';
    FieldDesc      := 'tp_descripcion';
    FieldBaja      := 'tp_fechabaja';
    ExtraCondition := ' AND tp_id IN(SELECT sa_idtipoarchivo '+
                      '                FROM comunes.csa_sectortipoarchivo, art.use_usuarios '+
                      '               WHERE sa_sector = se_sector '+
                      '                 AND se_usuario = '+SqlValue(Sesion.UserID)+')';

    OnChange       := fraTipoArchivoFiltroOnChange;
    Showbajas      := False;
  end;

  with fraProcesoFiltro do
  begin
    TableName   := 'COMUNES.CPA_PROCESOSARCHIVOS';
    FieldID     := 'pa_id';
    FieldCodigo := 'pa_id';
    FieldDesc   := 'PA_FECHAEXPORT';
    FieldBaja   := 'PA_FECHABAJA'; 
    ExtraCondition := ' AND 1 = 2';
    Showbajas   := True;
  end;

  with fraCodigoErrorFiltro do
  begin
    TableName   := 'art.ctb_tablas';
    FieldID     := 'TB_ID';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja   := 'tb_fechabaja';
    Extracondition := ' AND tb_clave = ''SRT'' ';
    Showbajas   := True;
  end;
end;

procedure TfrmProcesoArchivo.fraTipoArchivoFiltroOnChange(Sender: TObject);
begin
  if fraTipoArchivoFiltro.IsSelected then
  begin
    fraProcesoFiltro.ExtraCondition := 'AND PA_IDTIPOARCHIVO = '+SqlValue(fraTipoArchivoFiltro.Value);

    fraProcesoFiltro.Codigo := ValorSql('SELECT pa_id '+
                                        '  FROM comunes.cpa_procesosarchivos a '+
                                        ' WHERE a.pa_fechaexport IN(SELECT MAX(b.pa_fechaexport) '+
                                        '                             FROM comunes.cpa_procesosarchivos b '+
                                        '                            WHERE b.pa_idtipoarchivo = '+SqlValue(fraTipoArchivoFiltro.Value) +') '+
                                        '   AND a.pa_idtipoarchivo = '+SqlValue(fraTipoArchivoFiltro.Value));

  end
  else
    fraProcesoFiltro.ExtraCondition := 'AND 1 = 2 ';
end;

procedure TfrmProcesoArchivo.tbLimpiarClick(Sender: TObject);
begin
  fraTipoArchivoFiltro.Clear;
  fraProcesoFiltro.Clear;
  fraCodigoErrorFiltro.Clear;
  cbResueltoFiltro.Checked := False;
  cbSinResolverFiltro.Checked := False;
end;

end.
