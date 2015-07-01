unit unManPresupuestoMensual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, General, Mask, SqlFuncs, unSesion,
  ToolEdit, CurrEdit, PeriodoPicker, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraSectores,
  unFraCodigoDescripcion;

type
  TfrmManPresupuestoMensual = class(TfrmCustomGridABM)
    sdqConsultaRM_CLAVEAREA: TStringField;
    sdqConsultaRM_PERIODO: TStringField;
    sdqConsultaRM_USUALTA: TStringField;
    sdqConsultaRM_FECHAALTA: TDateTimeField;
    sdqConsultaRM_USUMODIF: TStringField;
    sdqConsultaRM_FECHAMODIF: TDateTimeField;
    sdqConsultaRM_USUBAJA: TStringField;
    sdqConsultaRM_FECHABAJA: TDateTimeField;
    edId: TEdit;
    Label1: TLabel;
    edArea: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sdqConsultaRM_ID: TFloatField;
    sdqConsultaRM_MONTO: TFloatField;
    edMonto: TCurrencyEdit;
    sdqConsultaAREA: TStringField;
    pPeriodo: TPeriodoPicker;
    fpArea: TFormPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    btnAceptarArea: TButton;
    btnCancelarArea: TButton;
    fraArea: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarAreaClick(Sender: TObject);
    procedure btnCancelarAreaClick(Sender: TObject);
  private
    { Private declarations }
    FSQL: String;
    function Get_AreaUsuario: String;
    function Get_DescripcionArea(vCodArea: string): String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManPresupuestoMensual: TfrmManPresupuestoMensual;
  sCodAreaUsuario:  string;
  sDescAreaUsuario: string;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, unFiltros, VCLExtra, AnsiSql;

{$R *.dfm}

procedure TfrmManPresupuestoMensual.ClearControls;
begin
  inherited;
  pPeriodo.Clear;
  edMonto.Clear;
  if ModoABM = maAlta then
  begin
    edId.text := IntToStr(ValorSQLInteger('SELECT NVL(MAX(RM_ID), 0) FROM ART.PRM_PRESUPUESTOMENSUAL') + 1);
  end;
  edArea.text            := sDescAreaUsuario;
  pPeriodo.Periodo.Valor := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
  VCLExtra.LockControls([edId, edArea], true);
end;

function TfrmManPresupuestoMensual.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('RM_ID', sdqConsultaRM_ID.AsInteger);
    Sql.Fields.Add('RM_FECHABAJA', exDate);
    Sql.Fields.Add('RM_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('RM_ID', edId.text);
      Sql.Fields.Add('RM_FECHAALTA', exDate);
      Sql.Fields.Add('RM_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('RM_ID', sdqConsultaRM_ID.AsInteger);
      Sql.Fields.Add('RM_FECHAMODIF', exDate);
      Sql.Fields.Add('RM_USUMODIF', Sesion.UserID);

      if not sdqConsultaRM_FECHABAJA.IsNull
        and (MsgBox('Al modificar un registro dado de baja lo reactivará. ¿Esta seguro que desea reactivarlo?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
      begin
        Sql.Fields.Add('RM_FECHABAJA', '');
        Sql.Fields.Add('RM_USUBAJA', '');
      end;

      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('RM_CLAVEAREA', sCodAreaUsuario);
    Sql.Fields.Add('RM_PERIODO', pPeriodo.Periodo.Valor);
    Sql.Fields.Add('RM_MONTO', edMonto.Value);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManPresupuestoMensual.FormCreate(Sender: TObject);
begin
  inherited;

  SQL.TableName := 'ART.PRM_PRESUPUESTOMENSUAL';
  FSQL := sdqConsulta.SQL.Text;

  with fraArea do
  begin
    Clear;
    ShowBajas := False;
    TableName       := 'USC_SECTORES';
    FieldID         := 'SC_ID';
    FieldCodigo     := 'SC_CODIGO';
    FieldDesc       := 'SC_DESCRIPCION';
    FieldBaja       := 'SC_FECHABAJA';
    ExtraCondition  := ' AND SC_CODIGO IN (''LIQUI'',''PRESDIN'')';
  end;
  sCodAreaUsuario := Get_AreaUsuario;
  if sCodAreaUsuario = '' then Exit;
end;

function TfrmManPresupuestoMensual.Get_AreaUsuario: string;
var CodArea:string;
begin
  CodArea := '';
  if Seguridad.Claves.IsActive('LIQUI') and Seguridad.Claves.IsActive('PRESDIN') then // las dos activas
  begin
    if fpArea.ShowModal = mrOk then
      CodArea := fraArea.Codigo
    else Exit;
  end
  else if Seguridad.Claves.IsActive('LIQUI') and not Seguridad.Claves.IsActive('PRESDIN') then
    CodArea := 'LIQUI'
  else if not Seguridad.Claves.IsActive('LIQUI') and Seguridad.Claves.IsActive('PRESDIN') then
    CodArea := 'PRESDIN';

  sDescAreaUsuario := Get_DescripcionArea(CodArea);
  Result := CodArea;
end;

function TfrmManPresupuestoMensual.Get_DescripcionArea(vCodArea: string): String;
var sSql: string;
begin
  Result := '';
  sSql   := 'SELECT sc_descripcion FROM USC_SECTORES ' +
             'WHERE sc_codigo = :codarea ';
  Result := ValorSqlEx(sSql,[vCodArea]);
end;

procedure TfrmManPresupuestoMensual.LoadControls;
begin
  inherited;
  VCLExtra.LockControls([pPeriodo, edMonto], False);
  if ModoABM = maAlta then
    edId.Text := ValorSql('SELECT NVL(MAX(rm_id)+1,1) FROM ART.PRM_PRESUPUESTOMENSUAL')
  else if ModoABM = maModificacion then
  begin
    edId.Text := sdqConsultaRM_ID.AsString;
    if not sdqConsultaRM_FECHABAJA.IsNull then
      VCLExtra.LockControls([pPeriodo, edMonto], true);
  end;

  pPeriodo.Periodo.Valor := sdqConsultaRM_PERIODO.AsString;
  edMonto.Value          := sdqConsultaRM_MONTO.AsCurrency;
  edArea.Text            := sDescAreaUsuario;
  VCLExtra.LockControls([edId, edArea], true);
end;

procedure TfrmManPresupuestoMensual.RefreshData;
var sSql: String;
begin
  sSql := ' and RM_CLAVEAREA = ' + SqlValue(sCodAreaUsuario);
  sdqConsulta.SQL.Text := FSQL + sSql + SortDialog.OrderBy;

  inherited RefreshData;
end;

function TfrmManPresupuestoMensual.Validar: Boolean;
var sSql:string;
begin
  Verificar(Trim(edArea.Text)='', edArea, 'Debe pertenecer a un Área determinada para realizar el ABM');
  Verificar(edMonto.value = 0, edMonto, 'Debe completar el Monto');
  if ModoABM = maAlta then
  begin
    sSql := ' SELECT 1 FROM ART.PRM_PRESUPUESTOMENSUAL ' +
            ' WHERE RM_CLAVEAREA = ' + SqlValue(sCodAreaUsuario) +
              ' AND RM_PERIODO = ' + SqlValue(pPeriodo.Periodo.Valor);
    Verificar(ExisteSql(sSql), pPeriodo, 'Ya existe un Presupuesto para dicho Periodo. (Si el mismo esta dado de baja, reactívelo y modifíquelo)');
  end;
  Verificar(Trim(pPeriodo.Periodo.Valor) = '__/____', pPeriodo, 'Debe completar el Periodo.');
  Result := True;
end;

procedure TfrmManPresupuestoMensual.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not Field.DataSet.FieldByName('RM_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManPresupuestoMensual.btnAceptarAreaClick(Sender: TObject);
begin
  inherited;
  Verificar(fraArea.IsEmpty, nil, 'Debe completar un Area antes de ingresar a la pantalla');
  fpArea.ModalResult := mrOk;
end;

procedure TfrmManPresupuestoMensual.btnCancelarAreaClick(Sender: TObject);
begin
  inherited;
  fpArea.ModalResult := mrCancel;
end;





end.
