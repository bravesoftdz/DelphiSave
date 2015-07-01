unit unManPaisesGafi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox;

type
  TfrmManPaisesGafi = class(TfrmCustomGridABM)
    fraPais: TfraCodigoDescripcion;
    edFechaHasta: TDateComboBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    Label2: TLabel;                                                                     
    cboxColores: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    fraFiltroPais: TfraCodigoDescripcion;
    cboxFiltroColores: TComboBox;
    Vigencia: TLabel;
    edVigenciaFiltro: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    { Private declarations }
    function MaxFecha : TDate;
    procedure UpdateFechaHastaAnteriores(const aCodigoPais: String; const aFechaDesde: TDate);
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    procedure RefreshData; override;
    procedure LoadControls; override;

    function DoABM: Boolean; override;
    function Validar: Boolean; override;
  end;

var
  frmManPaisesGafi: TfrmManPaisesGafi;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, DateTimeFuncs, SqlFuncs;

{$R *.dfm}

procedure TfrmManPaisesGafi.ClearControls;
begin
  inherited;
  fraPais.Clear;
  cboxColores.ItemIndex := -1;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

function TfrmManPaisesGafi.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'pep.ppd_paisesdeficiencias';

  BeginTrans;
  begin
    if ModoABM = maAlta then
    begin
      UpdateFechaHastaAnteriores(fraPais.Codigo, edFechaDesde.Date);

      //iId := ValorSql('SELECT pep.seq_peb_id.NEXTVAL FROM DUAL', '0');
      Sql.Fields.Add('pd_usualta',    Sesion.UserID);
      Sql.Fields.Add('pd_fechaalta',  'SYSDATE', False);
      Sql.Fields.Add('pd_hasta', MaxFecha);
      Sql.Fields.Add('pd_desde', edFechaDesde.Date);
      Sql.Fields.Add('pd_codigopais', fraPais.Codigo);
      if cboxColores.ItemIndex <> -1 then
        Sql.Fields.Add('pd_color', cboxColores.Items[cboxColores.ItemIndex])
      else
        Sql.Fields.Add('pd_color', ExNull);

      //Sql.Fields.Add('eb_contrato',   fraEmpresa.Contrato);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('pd_id').AsInteger;
      Sql.Fields.Add('pd_usubaja',    Sesion.UserID);
      Sql.Fields.Add('pd_fechabaja',  'SYSDATE', False);
      Sql.Fields.Add('pd_hasta', edFechaHasta.Date);
      Sql.PrimaryKey.Add('pd_id', iId, False);
    end;
  end;

  try
    EjecutarSqlST(Sql.Sql);
    CommitTrans;
    Result := True;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManPaisesGafi.FormCreate(Sender: TObject);
begin
  inherited;
  //: Lista Roja, Lista Negra, Lista Gris Oscura, Lista Gris
  cboxColores.Items.Add('ROJA');
  cboxColores.Items.Add('NEGRA');
  cboxColores.Items.Add('GRIS OSCURA');
  cboxColores.Items.Add('GRIS');

  cboxFiltroColores.Items.Add('ROJA');
  cboxFiltroColores.Items.Add('NEGRA');
  cboxFiltroColores.Items.Add('GRIS OSCURA');
  cboxFiltroColores.Items.Add('GRIS');

  edVigenciaFiltro.Date := Now;

  with fraFiltroPais do
    begin
    TableName         := 'cpa_paises';
    FieldID           := 'pa_codigo';
    FieldCodigo       := 'pa_codigo';
    FieldDesc         := 'UPPER(pa_descripcion)';
    FieldBaja         := 'null';
  end;

  with fraPais do
  begin
    TableName         := 'cpa_paises';
    FieldID           := 'pa_codigo';
    FieldCodigo       := 'pa_codigo';
    FieldDesc         := 'UPPER(pa_descripcion)';
    FieldBaja         := 'null';
  end;

  FieldBaja := 'pd_fechabaja';
end;

procedure TfrmManPaisesGafi.LoadControls;
begin
  inherited;
  fraPais.Codigo := sdqConsulta.FieldByName('pd_codigopais').AsString;

  if sdqConsulta.FieldByName('pd_color').IsNull then
    cboxColores.ItemIndex := -1
  else
    cboxColores.ItemIndex := cboxColores.Items.IndexOf(sdqConsulta.FieldByName('pd_color').AsString);

  edFechaDesde.Date := sdqConsulta.FieldByName('pd_desde').AsDateTime;
  edFechaHasta.Date := sdqConsulta.FieldByName('pd_hasta').AsDateTime;
end;

function TfrmManPaisesGafi.MaxFecha: TDate;
begin
  Result := EncodeDate(2999, 12, 31);
end;

procedure TfrmManPaisesGafi.RefreshData;
var
  sSql : String;
begin
  sSql :=
    'SELECT pd_id, pa_descripcion, pd_codigopais, pd_color, pd_desde, pd_hasta, pd_fechaalta, pd_usualta, pd_fechamodif,' +
          ' pd_usumodif, pd_fechabaja, pd_usubaja' +
     ' FROM pep.ppd_paisesdeficiencias ' +
     ' LEFT JOIN cpa_paises ON pd_codigopais = pa_codigo' +
    ' WHERE 1 = 1';

  if not edVigenciaFiltro.IsEmpty then
    sSql := sSql + ' AND ' + SqlDate(edVigenciaFiltro.Date) + ' BETWEEN pd_desde AND pd_hasta';

  if not fraFiltroPais.IsEmpty then
    sSql := sSql + ' AND pd_codigopais = ' + fraFiltroPais.Codigo;

  if cboxFiltroColores.ItemIndex <> -1 then
    sSql := sSql + ' AND pd_color = '''+ cboxFiltroColores.Items[cboxFiltroColores.ItemIndex] + '''';

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManPaisesGafi.UpdateFechaHastaAnteriores(
  const aCodigoPais: String; const aFechaDesde: TDate);
var
  sSql: String;
begin
  sSql :=
    'UPDATE pep.ppd_paisesdeficiencias' +
      ' SET pd_hasta = :fechahasta,' +
          ' pd_fechamodif = SYSDATE,' +
          ' pd_usumodif = :usuario' +
    ' WHERE pd_id = (SELECT pd_id' +
                     ' FROM pep.ppd_paisesdeficiencias' +
                    ' WHERE pd_codigopais = :codpais' +
                      ' AND :fechadesde BETWEEN pd_desde AND pd_hasta' +
                      ' AND ROWNUM < 2)';
  EjecutarSqlSTEx(sSql, [TDateTimeEx.Create((aFechaDesde - 1)), Sesion.UserID, aCodigoPais,
                         TDateTimeEx.Create(aFechaDesde)]);
end;

function TfrmManPaisesGafi.Validar: Boolean;
begin
  if ModoABM = maAlta then
  begin
    Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'La fecha de inicio de vigencia es obligatoria.');
    Verificar(cboxColores.ItemIndex = -1, cboxColores, 'El color de la lista es obligatorio');
    Verificar((edFechaDesde.Date > MaxFecha), edFechaDesde, 'La fecha es inválida.');
  end;

  if ModoABM = maModificacion then
  begin
    Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La fecha de fin de vigencia es obligatoria.');
    Verificar(cboxColores.ItemIndex = -1, cboxColores, 'El color de la lista es obligatorio');
    Verificar(edFechaHasta.Date < edFechaDesde.Date, edFechaHasta, 'La fecha de fin de vigencia no puede superar la fecha desde.');
  end;

  Verificar(fraPais.IsEmpty, fraPais, 'Debe seleccionar un pais.');

  Result := True;
end;

procedure TfrmManPaisesGafi.tbNuevoClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := False;
  fraPais.Enabled := True;
  cboxColores.Enabled := True;
  inherited;
end;

procedure TfrmManPaisesGafi.tbEliminarClick(Sender: TObject);
begin
  fpABM.Caption := 'Baja';

  edFechaDesde.Enabled := False;
  edFechaHasta.Enabled := True;
  fraPais.Enabled := False;
  cboxColores.Enabled := False;

  ModoABM := maModificacion;
  ModoABMToSqlType;

  fraPais.Codigo := sdqConsulta.FieldByName('pd_codigopais').AsString;
  cboxColores.ItemIndex := cboxColores.Items.IndexOf(sdqConsulta.FieldByName('pd_color').AsString);
  edFechaDesde.Date := sdqConsulta.FieldByName('pd_desde').AsDateTime;
  edFechaHasta.Date := sdqConsulta.FieldByName('pd_hasta').AsDateTime;

  Verificar(not sdqConsulta.FieldByName('pd_fechabaja').IsNull, Grid, 'El registro esta dado de baja.');

  if fpABM.ShowModal = mrOk then
  begin
    if sdqConsulta.Active then
    begin
      sdqConsulta.Refresh;
      CheckButtons;
    end
  else
    tbRefrescarClick(nil);
  end;
  //inherited;

  inherited;
end;

procedure TfrmManPaisesGafi.tbModificarClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := True;
  inherited;
end;

end.
