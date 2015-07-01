unit unFactoresCotizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit,
  CurrEdit, Mask, PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, DateComboBox, DateTimeFuncs;

type
  TfrmFactoresCotizador = class(TfrmCustomGridABM)
    lbFactor: TLabel;
    lbValor: TLabel;
    lbFechaVigencia: TLabel;
    edValor: TCurrencyEdit;
    edVigenciaDesde: TDateComboBox;
    fraFactor: TfraCodDesc;
    gbVigenciaFiltro: TGroupBox;
    cmbFT_FECHAVIGENCIADesde: TDateComboBox;
    gbFactorFiltro: TGroupBox;
    fraFactorFiltro: TfraCodDesc;
    Factor: TLabel;
    Label1: TLabel;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    procedure UpdateFechaHastaAnteriores(const aIdDescripcion: Integer; const aFecha: TDate);
  //  procedure UpdateFechaHastaNull(const aIdDescripcion: Integer);
  protected
    function DoABM: Boolean; override;
    function ExisteVigenciaEnFecha(const aIdDescripcion: Integer; const aFecha: TDate): Boolean;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 0;

var
  frmFactoresCotizador: TfrmFactoresCotizador;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra;

{$R *.dfm}

function TfrmFactoresCotizador.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aft_factorescotizador';

  if ModoABM = maBaja then
  begin
    iId := sdqConsulta.FieldByName('ft_id').AsInteger;
    Sql.Fields.Add('ft_usubaja',   Sesion.UserID);
    Sql.Fields.Add('ft_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      UpdateFechaHastaAnteriores(fraFactor.Value, edVigenciaDesde.Date);

      iId := -1;
      Sql.Fields.Add('ft_usualta',            Sesion.UserID);
      Sql.Fields.Add('ft_fechaalta',          'SYSDATE', False);
      Sql.Fields.Add('ft_fechavigenciahasta', '31/12/2099');
      Sql.Fields.Add('ft_iddescripcion',      fraFactor.Value);
      Sql.Fields.Add('ft_valor',              edValor.Value);
      Sql.Fields.Add('ft_fechavigenciadesde', edVigenciaDesde.Date);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('ft_id').AsInteger;
      Sql.Fields.Add('ft_usumodif',      Sesion.UserID);
      Sql.Fields.Add('ft_fechamodif',    'SYSDATE', False);
      Sql.Fields.Add('ft_iddescripcion', fraFactor.Value);
      Sql.Fields.Add('ft_valor',         edValor.Value);
      
      if edVigenciaDesde.Date <> sdqConsulta.FieldByName('ft_fechavigenciadesde').AsDateTime then
        if MsgBox('Esta cambiando la fecha de vigencia. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        begin
          Sql.Fields.Add('ft_fechavigenciadesde', edVigenciaDesde.Date);
          UpdateFechaHastaAnteriores(fraFactor.Value, edVigenciaDesde.Date);
          Sql.Fields.Add('ft_fechavigenciahasta', '31/12/2099');
        end
    end;

  end;
  Sql.PrimaryKey.Add('ft_id', iId, False);

  Result := inherited DoABM;

  if Result then
  begin
    RefreshData;
  end;
end;

function TfrmFactoresCotizador.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraFactor.IsEmpty, fraFactor.edCodigo, 'El Factor es obligatorio.');
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'La Fecha de Vigencia Desde es obligatoria.');
  if (modoABM = maAlta) then
  begin
    sSql :=
      'SELECT ft_id' +
       ' FROM afi.aft_factorescotizador' +
      ' WHERE ft_iddescripcion = :factor' +
        ' AND ft_fechavigenciadesde >= :fechavigenciadesde' +
        ' AND ft_fechabaja IS NULL';
    with GetQueryEx(sSql, [fraFactor.Codigo, TDateTimeEx.Create(edVigenciaDesde.Date)]) do
    try
      if not Eof then
      begin
        ShowMessage('Existe un factor con comienzo de vigencia posterior, dar de baja para continuar.');
        Abort;
      end;
    finally
      Free;
    end;
  end;

  Result := True;
end;


procedure TfrmFactoresCotizador.ClearControls;
begin
  fraFactor.Clear;
  edValor.Clear;
  edVigenciaDesde.Clear;
end;

procedure TfrmFactoresCotizador.LoadControls;
begin
  with sdqConsulta do
  begin
    fraFactor.Value      := FieldByName('ft_iddescripcion').AsInteger;
    edValor.Value        := FieldByName('ft_valor').AsFloat;
    edVigenciaDesde.Date := FieldByName('ft_fechavigenciadesde').AsDateTime;
  end;
end;

procedure TfrmFactoresCotizador.RefreshData;
var
  sSql : String;
begin
  sSql :=
    'SELECT aft.*, NVL(ft_fechamodif, ft_fechaalta) fechamodif, df_detalle factor' +
     ' FROM afi.aft_factorescotizador aft, afi.adf_descripcionfactores' +
    ' WHERE ft_iddescripcion = df_id' +
      ' AND df_fechabaja IS NULL';

  if not fraFactorFiltro.IsEmpty then
    sSql := sSql + ' AND ft_iddescripcion = '+ SqlValue(fraFactorFiltro.Value);
  if not cmbFT_FECHAVIGENCIADesde.IsEmpty then
    sSql := sSql + ' AND ' + SqlDate(cmbFT_FECHAVIGENCIAdesde.Date) + ' BETWEEN ft_fechavigenciadesde AND ft_fechavigenciahasta ';

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmFactoresCotizador.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(DataSet.FieldByName('ft_valor')).DisplayFormat := ',0.0000 %';
end;

procedure TfrmFactoresCotizador.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ft_fechabaja';
  ShowActived := True;
  cmbFT_FECHAVIGENCIADesde.Date := Now;
end;

procedure TfrmFactoresCotizador.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ft_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

procedure TfrmFactoresCotizador.fpAbmShow(Sender: TObject);
begin
  inherited;

  //lbFactor.Enabled        := (ModoABM = maAlta);
  //lbFechaVigencia.Enabled := (ModoABM = maAlta);

  LockControls([fraFactor], (ModoABM = maModificacion));
end;

procedure TfrmFactoresCotizador.UpdateFechaHastaAnteriores(const aIdDescripcion: Integer; const aFecha: TDate);
var
  sSql: String;
begin
  if ModoABM = maModificacion then
    Verificar((not ExisteVigenciaEnFecha(aIdDescripcion, aFecha)), edVigenciaDesde, 'Con esta fecha de vigencia quedan fechas anteriores sin valor.');

  //Ver si hay una vigencia actual. hacer esto
  sSQL :=
    'UPDATE afi.aft_factorescotizador' +
      ' SET ft_fechavigenciahasta = ' + SqlDate(aFecha - 1) +', ft_fechamodif = SYSDATE, ft_usumodif = :usu'+
    ' WHERE ft_id = (SELECT ft_id' +
                     ' FROM afi.aft_factorescotizador' +
                    ' WHERE ft_iddescripcion = :descripcion' +
                      ' AND ' + SqlDate(aFecha) + ' BETWEEN ft_fechavigenciadesde AND ft_fechavigenciahasta' +
                      ' AND ROWNUM < 2)';
  EjecutarSqlSTEx(sSql, [Sesion.UserID, aIdDescripcion]);
end;

{procedure TfrmFactoresCotizador.UpdateFechaHastaNull(
  const aIdDescripcion: Integer);
var
  sSql : String;
begin
  sSql := 'SELECT ft_id' +
          '  FROM afi.aft_factorescotizador' +
          ' WHERE AND ft_iddescripcion = '+ SqlValue(aIdDescripcion);

  with GetQuery(sSql) do
  try
    if not IsEmpty then
    begin
      eFactorCorrecion := eFactorCorrecion + FieldByName('PO_PONDERADOR').AsFloat;
    end;
  finally
    Free;
  end;
end;   }

function TfrmFactoresCotizador.ExisteVigenciaEnFecha(const aIdDescripcion: Integer; const aFecha: TDate): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT ft_id' +
     ' FROM afi.aft_factorescotizador' +
    ' WHERE ft_iddescripcion = :iddescripcion' +
      ' AND ft_fechavigenciadesde BETWEEN :fechavigenciadesde AND ''31/12/2099''' +
      ' AND ROWNUM < 2';

  with GetQueryEx(sSql, [aIdDescripcion, TDateTimeEx.Create(aFecha)]) do
  try
    Result := not Eof;
  finally
    Free;
  end;
end;

end.
