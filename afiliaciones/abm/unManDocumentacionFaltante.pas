unit unManDocumentacionFaltante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraCodigoDescripcion,
  RxPlacemnt;

type
  TfrmManDocumentacionFaltante = class(TfrmCustomGridABM)
    fraSA_FORMAJ: TfraStaticCTB_TABLAS;
    fraCodDocumento: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gbFormaj: TGroupBox;
    fraFORMAJFiltro: TfraStaticCTB_TABLAS;
    gbFirmante: TGroupBox;
    gbDoc: TGroupBox;
    fraDocumentoFiltro: TfraCodigoDescripcion;
    fraFirmante: TfraCodigoDescripcion;
    fraFirmanteFiltro: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;

    procedure LoadSQLString;
  public
  end;

var
  frmManDocumentacionFaltante: TfrmManDocumentacionFaltante;

implementation

uses
  unPrincipal, SqlFuncs, CustomDlgs, unDMPrincipal;

{$R *.DFM}

procedure TfrmManDocumentacionFaltante.ClearControls;
begin
//
end;

function TfrmManDocumentacionFaltante.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('df_id',    sdqConsulta.FieldByName('df_id').AsInteger);
    Sql.Fields.Add('df_fechabaja', exDateTime);
    Sql.Fields.Add('df_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    Validar;

    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.Add('df_fechaalta', exDateTime);
      Sql.Fields.Add('df_usualta',   frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('df_id',     sdqConsulta.FieldByName('df_id').AsInteger);
      Sql.Fields.Add('df_fechamodif', exDateTime);
      Sql.Fields.Add('df_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('df_formajuridica', fraSA_FORMAJ.Value);
    Sql.Fields.Add('df_caracterfirma', fraFirmante.Value);
    Sql.Fields.Add('df_iddocumento',   fraCodDocumento.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManDocumentacionFaltante.LoadControls;
begin
  fraSA_FORMAJ.Value    :=  sdqConsulta.FieldByName('tb_codigo').AsString;
  fraFirmante.Value     :=  sdqConsulta.FieldByName('codfirm').AsInteger;
  fraCodDocumento.Value :=  sdqConsulta.FieldByName('adfid').AsInteger;
end;

function TfrmManDocumentacionFaltante.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraSA_FORMAJ.IsEmpty, fraSA_FORMAJ, 'Debe seleccionar una forma jurídica.');
  Verificar(fraFirmante.IsEmpty, fraFirmante, 'Debe seleccionar el firmante.');
  Verificar(fraCodDocumento.IsEmpty, fraCodDocumento, 'Debe seleccionar el documento.');

  sSql :=
    'SELECT 1' +
     ' FROM adf_documentacionfalta' +
    ' WHERE df_formajuridica = :formajuridica' +
      ' AND df_caracterfirma = :caracterfirma' +
      ' AND df_iddocumento = :iddocumento' +
      ' AND df_fechabaja IS NULL';
  Verificar(ExisteSqlEx(sSql, [fraSA_FORMAJ.Value, fraFirmante.Value, fraCodDocumento.Value]), btnCancelar, 'No es posible ingresar datos ya ingresados.');

  Result := True;
end;

procedure TfrmManDocumentacionFaltante.FormCreate(Sender: TObject);
begin
  inherited;

  fraSA_FORMAJ.Clave          := 'FJURI';
  fraSA_FORMAJ.ExtraCondition := ' AND tb_codigo <> 999 ';

  fraFORMAJFiltro.Clave  := 'FJURI';
  fraFORMAJFiltro.ExtraCondition := ' AND tb_codigo <> 999 ';

  with fraFirmante do
  begin
    TableName   := 'acf_caracterfirma';
    FieldID     := 'cf_id';
    FieldCodigo := 'cf_id';
    FieldDesc   := 'cf_caracter';
    FieldBaja   := 'cf_fechabaja';
    ShowBajas   := False;
  end;

  with fraFirmanteFiltro do
  begin
    TableName   := 'acf_caracterfirma';
    FieldID     := 'cf_id';
    FieldCodigo := 'cf_id';
    FieldDesc   := 'cf_caracter';
    FieldBaja   := 'cf_fechabaja';
    ShowBajas   := False;
  end;

  with fraCodDocumento do
  begin
    TableName      := 'adf_documentoafi';
    FieldID        := 'df_id';
    FieldCodigo    := 'df_id';
    FieldDesc      := 'df_descripcion';
    FieldBaja      := 'df_fechabaja';
    ExtraCondition := ' AND df_ctrl_faltante = ''S''';
    ShowBajas      := False;
  end;

  with fraDocumentoFiltro do
  begin
    TableName      := 'adf_documentoafi';
    FieldID        := 'df_id';
    FieldCodigo    := 'df_id';
    FieldDesc      := 'df_descripcion';
    FieldBaja      := 'df_fechabaja';
    ExtraCondition := ' AND df_ctrl_faltante = ''S''';
    ShowBajas      := False;
  end;

  Sql.TableName := 'adf_documentacionfalta';
  FieldBaja     := 'df_fechabaja';
  LoadSQLString;
end;

procedure TfrmManDocumentacionFaltante.LoadSQLString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT ctb1.tb_descripcion, acf.cf_caracter AS firmante, adf2.df_descripcion, ctb1.tb_codigo, acf.cf_id AS codfirm,' +
          ' adf2.df_id AS adfid, adf.df_fechabaja, adf.df_id' +
     ' FROM adf_documentacionfalta adf LEFT JOIN ctb_tablas ctb1 ON adf.df_formajuridica = ctb1.tb_codigo' +
          ' LEFT JOIN acf_caracterfirma acf ON adf.df_caracterfirma = acf.cf_id' +
          ' LEFT JOIN adf_documentoafi adf2 ON adf.df_iddocumento = adf2.df_id' +
    ' WHERE ctb1.tb_clave = ''FJURI''';

  if not fraFORMAJFiltro.IsEmpty then
    sWhere := sWhere + ' AND ctb1.tb_codigo = ' + fraFORMAJFiltro.Value;

  if not fraFIRMANTEFiltro.IsEmpty then
    sWhere := sWhere + ' AND acf.cf_id = ' + IntToStr(fraFirmanteFiltro.Value);

  if not fraDocumentoFiltro.IsEmpty then
    sWhere := sWhere + ' AND adf2.df_id = ' + IntToStr(fraDocumentoFiltro.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManDocumentacionFaltante.tbRefrescarClick(Sender: TObject);
begin
  LoadSQLString;
  inherited;
end;

procedure TfrmManDocumentacionFaltante.tbNuevoClick(Sender: TObject);
begin
  fraSA_FORMAJ.Clear;
  fraFirmante.Clear;
  fraCodDocumento.Clear;
  inherited;
end;

procedure TfrmManDocumentacionFaltante.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('df_fechabaja').IsNull, tbEliminar, 'Este registro ya está dado de baja.');

  inherited;
end;

procedure TfrmManDocumentacionFaltante.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('df_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');

  inherited;
end;

procedure TfrmManDocumentacionFaltante.tbLimpiarClick(Sender: TObject);
begin
  fraFORMAJFiltro.Clear;
  fraFirmanteFiltro.Clear;
  fraDocumentoFiltro.Clear;
end;

end.
