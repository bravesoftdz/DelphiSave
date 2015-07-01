unit unManAEX_EXCEPCIONUSUARIOTAREA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, AdvGroupBox, AdvOfficeButtons,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc,
  Mask, ToolEdit, unfraUsuarios;

type
  TfrmManAEX_EXCEPCIONUSUARIOTAREA = class(TfrmCustomGridABM)
    rgTipo: TAdvOfficeRadioGroup;
    fraID_SECTOR_EXCEPTUADO: TfraCodDesc;
    lblSectorExceptuado: TLabel;
    fraID_SECTOR_EXCEPTUANTE: TfraCodDesc;
    lblSectorExceptuante: TLabel;
    rgPanelVigencia: TAdvOfficeRadioGroup;
    pnlFechas: TPanel;
    edEX_VIGENCIADESDEDesde: TDateEdit;
    edEX_VIGENCIAHASTAHasta: TDateEdit;
    lblDesde: TLabel;
    lblHasta: TLabel;
    ShortCutControlHijo: TShortCutControl;
    fraUsuarioExceptuado: TfraUsuario;
    lblUsuarioExceptuado: TLabel;
    fraUsuarioExceptuante: TfraUsuario;
    lblUsuarioExceptuante: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    edVigenciaDesde: TDateEdit;
    edVigenciaHasta: TDateEdit;
    rgTipoPermiso: TAdvOfficeRadioGroup;
    fraUSUARIO_EXCEPTUADO: TfraUsuario;
    fraUSUARIO_EXCEPTUANTE: TfraUsuario;
    lblFiltroUsuarioExceptuado: TLabel;
    lblFiltroUsuarioExceptuante: TLabel;
    rgBajas: TAdvOfficeRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rgTipoPermisoClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;    
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManAEX_EXCEPCIONUSUARIOTAREA: TfrmManAEX_EXCEPCIONUSUARIOTAREA;

implementation

uses
  VCLExtra, unFiltros, CustomDlgs, SqlFuncs, unSesion, unDmPrincipal, Math, General, AnsiSql;

{$R *.dfm}

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.AEX_EXCEPCIONUSUARIOTAREA';
  FieldBaja := 'EX_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.ClearControls;
begin
  inherited;
  fraUsuarioExceptuado.Clear;
  fraUsuarioExceptuante.Clear;
  rgTipoPermiso.ItemIndex := 0;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
  rgTipo.ItemIndex := 0;
  rgBajas.ItemIndex := 1;  
end;

function TfrmManAEX_EXCEPCIONUSUARIOTAREA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EX_ID', sdqConsulta.FieldByName('EX_ID').AsInteger);
     Sql.Fields.Add('EX_FECHABAJA', exDate);
     Sql.Fields.Add('EX_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('EX_ID', GetSecNextVal('AGENDA.SEQ_AEX_ID'));
       Sql.Fields.Add('EX_FECHAALTA', exDate);
       Sql.Fields.Add('EX_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EX_ID', sdqConsulta.FieldByName('EX_ID').AsInteger);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EX_VIGENCIADESDE', Max(edVigenciaDesde.Date, DBDate));

     if edVigenciaHasta.Date = 0 then
       Sql.Fields.AddExpression('EX_VIGENCIAHASTA', exNull)
     else
       Sql.Fields.Add('EX_VIGENCIAHASTA', edVigenciaHasta.Date, dmDate);

     Sql.Fields.Add('EX_IDUSUARIO', fraUsuarioExceptuante.ID);
     Sql.Fields.Add('EX_IDEXCEPTUADO', fraUsuarioExceptuado.ID);
     Sql.Fields.Add('EX_PERMANENTE', String(iif(rgTipoPermiso.ItemIndex = 0, 'N', 'S')));          
  end;

  Result := inherited DoABM;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraUsuarioExceptuado, fraUsuarioExceptuante], (ModoABM <> maAlta));
  VCLExtra.LockControls([edVigenciaDesde], (ModoABM <> maAlta) and (edVigenciaDesde.Date < DBDate));
  VCLExtra.LockControls([edVigenciaHasta], (ModoABM <> maAlta) and (edVigenciaHasta.Date < DBDate));
  VCLExtra.LockControls([rgTipoPermiso], edVigenciaDesde.ReadOnly and edVigenciaDesde.ReadOnly);
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if ((Field.FieldName = 'EXCEPTUADO') or (Field.FieldName = 'USUARIO_EXCEPTUADO')) and (not Field.DataSet.FieldByName('BAJA_EXCEPTUADO').IsNull) then
    AFont.Color := clRed;
  if ((Field.FieldName = 'EXCEPTUANTE') or (Field.FieldName = 'USUARIO_EXCEPTUANTE')) and (not Field.DataSet.FieldByName('BAJA_EXCEPTUANTE').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.LoadControls;
begin
  with sdqConsulta do
  begin
    fraUsuarioExceptuado.Cargar(FieldByName('usuario_exceptuado').AsString);
    fraUsuarioExceptuante.Cargar(FieldByName('usuario_exceptuante').AsString);
    edVigenciaDesde.Date := FieldByName('ex_vigenciadesde').AsDateTime;
    edVigenciaHasta.Date := FieldByName('ex_vigenciahasta').AsDateTime;
    rgTipoPermiso.ItemIndex := iif(FieldByName('ex_vigenciahasta').IsNull, 1, 0);
  end;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.RefreshData;
var
  sWhere: String;
begin
  case rgTipo.ItemIndex of
    1, 2, 3: sWhere := sWhere + ' AND idtipo = ' + SqlValue(rgTipo.ItemIndex) + ' ';
  end;

  case rgBajas.ItemIndex of
    1, 2: sWhere := sWhere + ' AND ex_fechabaja IS ' + iif(rgBajas.ItemIndex = 1, '', 'NOT') + ' NULL ';
  end;

  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + sWhere + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.rgTipoPermisoClick(Sender: TObject);
begin
  VCLExtra.LockControls(edVigenciaHasta, (ModoABM = maAlta) and (rgTipoPermiso.ItemIndex = 1));
end;

procedure TfrmManAEX_EXCEPCIONUSUARIOTAREA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
end;

function TfrmManAEX_EXCEPCIONUSUARIOTAREA.Validar: Boolean;
begin
  Verificar(fraUsuarioExceptuante.IsEmpty, fraUsuarioExceptuante.edCodigo, 'Debe indicar el usuario al que desee que otorgue la excepción.');
  Verificar(fraUsuarioExceptuado.IsEmpty, fraUsuarioExceptuado.edCodigo, 'Debe indicar el usuario que recibirá el beneficiio de la excepción.');
  Result := True;
end;

end.                                                                                               
