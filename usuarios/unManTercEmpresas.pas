unit unManTercEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unFraCodigoDescripcion, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Vcl.Mask, RxToolEdit,
  DateComboBox;

type
  TfrmManTercEmpresas = class(TfrmCustomGridABM)
    pnlVigencias: TPanel;
    rbConVigencia: TRadioButton;
    rbSinVigencia: TRadioButton;
    rbTodos: TRadioButton;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraTercerizadora: TfraCodigoDescripcion;
    GroupBox3: TGroupBox;
    dcVigenciaDesde: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dcVigenciaHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    fraTercerizadoraFiltro: TfraCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    function IsVigenciaDesdeAnterior_UltVigHasta: Boolean;
    function IsVigenciaFueraDeVigEmpTercerizadora(var dVigDesdeTerce, dVigHastaTerce: TDateTime): Boolean;
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmManTercEmpresas: TfrmManTercEmpresas;

implementation

{$R *.dfm}

uses unfraUsuarios, SqlFuncs, unSesion, unDmPrincipal, unART, CustomDlgs, VCLExtra, AnsiSql;

procedure TfrmManTercEmpresas.ClearControls;
begin
  inherited;
  VCLExtra.LockControls([fraEmpresa, fraTercerizadora, dcVigenciaDesde], False);
  fraEmpresa.Clear;
  fraTercerizadora.Clear;
  dcVigenciaDesde.Clear;
  dcVigenciaHasta.Clear;
end;

function TfrmManTercEmpresas.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'AMED.met_empresa_terce';

  try
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('ET_ID', sdqConsulta.FieldByName('ET_ID').AsInteger, False);
      Sql.Fields.Add('ET_VIGENCIAHASTA', dcVigenciaHasta.date);
      Sql.Fields.Add('ET_FECHABAJA', dcVigenciaHasta.date);
      Sql.Fields.Add('ET_USUBAJA', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end
    else if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ET_ID', ValorSQLInteger('SELECT MAX(ET_ID) + 1 FROM AMED.MET_EMPRESA_TERCE'), False);
      Sql.Fields.Add('ET_FECHAALTA', exDateTime);
      Sql.Fields.Add('ET_USUALTA', Sesion.UserID);
      Sql.Fields.Add('ET_IDEMPRESA', fraEmpresa.ID);
      Sql.Fields.Add('ET_IDTERCERIZADORA', fraTercerizadora.Codigo);
      Sql.Fields.Add('ET_VIGENCIADESDE', dcVigenciaDesde.Date);
      if (dcVigenciaHasta.Date > 0) then
        Sql.Fields.Add('ET_VIGENCIAHASTA', dcVigenciaHasta.Date);

      Sql.SqlType := stInsert;
    end;

    Result := inherited DoABM;

  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al guardar los datos.');
  end;
end;

procedure TfrmManTercEmpresas.FormCreate(Sender: TObject);
begin
  inherited;
  with fraTercerizadora do
  begin
    TableName      := 'amed.mtm_tercerizadora_medica';
    FieldID        := 'tm_id';
    FieldCodigo    := 'tm_id';
    FieldDesc      := 'tm_nombre';
    ExtraCondition := ' and ((tm_vigenciahasta is null) or (tm_vigenciahasta >= art.actualdate)) ';
  end;

  with fraTercerizadoraFiltro do
  begin
    TableName      := 'amed.mtm_tercerizadora_medica';
    FieldID        := 'tm_id';
    FieldCodigo    := 'tm_id';
    FieldDesc      := 'tm_nombre';
    ExtraCondition := ' and ((tm_vigenciahasta is null) or (tm_vigenciahasta >= art.actualdate)) ';
  end;

  tbEliminar.Visible   := False;
  fraEmpresa.ShowBajas := true;
end;

procedure TfrmManTercEmpresas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;     // ver si pongo esto ya que se pone muy lenta la pantalla...
 // if (not sdqConsulta.FieldByName('ET_VIGENCIAHASTA').IsNull) and (sdqConsulta.FieldByName('ET_VIGENCIAHASTA').AsDateTime < DBDate)  then
 //   AFont.Color := clRed;
end;

procedure TfrmManTercEmpresas.LoadControls;
begin
  inherited;
  fraEmpresa.ID            := sdqConsulta.FieldByName('EM_ID').AsInteger;
  fraTercerizadora.Codigo  := sdqConsulta.FieldByName('ET_IDTERCERIZADORA').AsString;
  dcVigenciaDesde.Date     := sdqConsulta.FieldByName('ET_VIGENCIADESDE').AsDateTime;
  dcVigenciaHasta.Date     := sdqConsulta.FieldByName('ET_VIGENCIAHASTA').AsDateTime;
//  if (dcVigenciaHasta.Date = 0) then
//    dcVigenciaHasta.Date := DBDate;     // no queda bien que se autocomplete...

  VCLExtra.LockControls([fraEmpresa, fraTercerizadora, dcVigenciaDesde], True);
end;

procedure TfrmManTercEmpresas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  rbTodos.Checked;
  fraTercerizadoraFiltro.Clear;
end;

procedure TfrmManTercEmpresas.tbRefrescarClick(Sender: TObject);
var
  sSql : string;
begin
  sdqConsulta.SQL.Clear;
  sSql := ' SELECT et_id, em_id, em_cuit, em_nombre EMPRESA, et_idtercerizadora, tm_nombre EMPTERCE, ' +
                 ' et_vigenciadesde, et_vigenciahasta ' +
            ' FROM amed.met_empresa_terce, amed.mtm_tercerizadora_medica, afi.aem_empresa ' +
           ' WHERE et_idtercerizadora = tm_id ' +
             ' AND et_idempresa = em_id ';

  if rbConVigencia.Checked then
    sSql := sSql + ' AND ((art.actualdate between et_vigenciadesde and et_vigenciahasta) or (et_vigenciahasta is null)) '
  else if rbSinVigencia.Checked then
    sSql := sSql + ' AND ((et_vigenciahasta is not null) and (et_vigenciahasta < art.actualdate)) ';

  if not fraTercerizadoraFiltro.IsEmpty then
    sSql := sSql + ' AND et_idtercerizadora = ' + SqlInt(fraTercerizadoraFiltro.Codigo);

  sdqConsulta.SQL.Add(sSql);
  inherited;
end;

function TfrmManTercEmpresas.Validar: Boolean;
var dVigDesdeTerce, dVigHastaTerce: TDateTime;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe completar la Empresa.');
  Verificar(fraTercerizadora.IsEmpty, fraTercerizadora, 'Debe completar la Tercerizadora.');
  Verificar(dcVigenciaDesde.IsEmpty, dcVigenciaDesde, 'Debe completar la Vigencia Desde');
  Verificar((dcVigenciaDesde.Date > 0) and (dcVigenciaHasta.Date > 0) and (dcVigenciaDesde.Date > dcVigenciaHasta.Date),
             dcVigenciaHasta, 'La Vigencia Desde no puede ser mayor a la Vigencia Hasta.');

  Verificar(IsVigenciaDesdeAnterior_UltVigHasta, dcVigenciaDesde, 'La Vigencia Desde no puede ser anterior a la última Vigencia Hasta de la empresa.');

  if IsVigenciaFueraDeVigEmpTercerizadora(dVigDesdeTerce, dVigHastaTerce) then
    Verificar(True, dcVigenciaDesde, 'La Vigencia debe encontrarse dentro de la Vigencia Desde - Hasta de la empresa Tercerizadora.' + CRLF +
                                     '(Vigencia de la Empresa Tercerizadora: Desde ' + DateToStr(dVigDesdeTerce) + ' Hasta ' + DateToStr(dVigHastaTerce) + ').');

  Verificar((ModoABM = maModificacion) and dcVigenciaHasta.IsEmpty, dcVigenciaHasta, 'Debe completar la Vigencia Hasta.');

  Result := True;
end;

function TfrmManTercEmpresas.IsVigenciaDesdeAnterior_UltVigHasta: Boolean;
var sSql: string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM amed.met_empresa_terce ' +
          ' WHERE et_idempresa = ' + SqlInt(fraEmpresa.ID) +
            ' AND et_vigenciahasta > ' + SqlDateTime(dcVigenciaDesde.Date);

  Result := ExisteSql(sSql);
end;

function TfrmManTercEmpresas.IsVigenciaFueraDeVigEmpTercerizadora(var dVigDesdeTerce, dVigHastaTerce: TDateTime): Boolean;
var sSql: string;
begin
  Result := False;
  sSql := 'SELECT tm_vigenciadesde, tm_vigenciahasta ' +
           ' FROM amed.mtm_tercerizadora_medica ' +
          ' WHERE tm_id = ' + SqlInt(fraTercerizadora.Codigo);
  with GetQuery(sSql) do
  Try
    dVigDesdeTerce := FieldByName('TM_VIGENCIADESDE').AsDateTime;
    if FieldByName('TM_VIGENCIAHASTA').IsNull then
      dVigHastaTerce := 0
    else
      dVigHastaTerce := FieldByName('TM_VIGENCIAHASTA').AsDateTime;

    if (dcVigenciaDesde.Date < dVigDesdeTerce) OR
       ( (dVigHastaTerce > 0) and (dcVigenciaDesde.Date > dVigHastaTerce) )  then
      Result := True;

  Finally
    Free;
  End;


end;

end.
