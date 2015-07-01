unit unManPEB_EXPOSICIONBAJA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox;

type
  TfrmManPEB_EXPOSICIONBAJA = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    GroupBox3: TGroupBox;
    edVigenciaFiltro: TDateComboBox;
    Vigencia: TLabel;
    Label4: TLabel;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function MaxFecha: TDate;

    procedure UpdateFechaHastaAnteriores(const aContrato: Integer; const aFechaDesde, aFechaHasta: TDate);
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManPEB_EXPOSICIONBAJA: TfrmManPEB_EXPOSICIONBAJA;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, DateTimeFuncs;

{$R *.dfm}

procedure TfrmManPEB_EXPOSICIONBAJA.ClearControls;
begin
  inherited;
end;

function TfrmManPEB_EXPOSICIONBAJA.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'pep.peb_exposicionbaja';

  BeginTrans;
  begin
    if ModoABM = maAlta then
    begin
      UpdateFechaHastaAnteriores(fraEmpresa.Contrato, edFechaDesde.Date, edFechaHasta.Date);

      iId := ValorSql('SELECT pep.seq_peb_id.NEXTVAL FROM DUAL', '0');
      Sql.Fields.Add('eb_usualta',    Sesion.UserID);
      Sql.Fields.Add('eb_fechaalta',  'SYSDATE', False);
      Sql.Fields.Add('eb_fechahasta', MaxFecha);
      Sql.Fields.Add('eb_fechadesde', edFechaDesde.Date);
      Sql.Fields.Add('eb_contrato',   fraEmpresa.Contrato);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('eb_id').AsInteger;
      Sql.Fields.Add('eb_usubaja',    Sesion.UserID);
      Sql.Fields.Add('eb_fechabaja',  'SYSDATE', False);
      Sql.Fields.Add('eb_fechahasta', edFechaHasta.Date);
    end;
  end;
  Sql.PrimaryKey.Add('eb_id', iId, False);

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

procedure TfrmManPEB_EXPOSICIONBAJA.LoadControls;
begin
  inherited;
end;

procedure TfrmManPEB_EXPOSICIONBAJA.RefreshData;
var
  sSql : String;
begin
  sSql :=
    'SELECT eb_id, co_contrato, em_cuit, em_nombre, eb_fechadesde, eb_fechahasta, eb_usualta, eb_fechaalta, eb_usumodif,' +
          ' eb_fechamodif, eb_fechabaja' +
     ' FROM pep.peb_exposicionbaja LEFT JOIN aco_contrato ON eb_contrato = co_contrato' +
          ' LEFT JOIN aem_empresa ON co_idempresa = em_id' +
    ' WHERE 1 = 1';
    
  if not edVigenciaFiltro.IsEmpty then
    sSql := sSql + ' AND ' + SqlDate(edVigenciaFiltro.Date) + ' BETWEEN eb_fechadesde AND eb_fechahasta';

  if not fraEmpresaFiltro.IsEmpty then
    sSql := sSql + ' AND co_contrato = ' + IntToStr(fraEmpresaFiltro.Contrato);

  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;
inherited;
end;

procedure TfrmManPEB_EXPOSICIONBAJA.UpdateFechaHastaAnteriores(const aContrato: Integer; const aFechaDesde, aFechaHasta: TDate);
var
  sSql: String;
begin
  sSql :=
    'UPDATE pep.peb_exposicionbaja' +
      ' SET eb_fechahasta = :fechahasta,' +
          ' eb_fechamodif = SYSDATE,' +
          ' eb_usumodif = :usuario' +
    ' WHERE eb_id = (SELECT eb_id' +
                     ' FROM pep.peb_exposicionbaja' +
                    ' WHERE eb_contrato = :contrato' +
                      ' AND :fechadesde BETWEEN eb_fechadesde AND eb_fechahasta' +
                      ' AND ROWNUM < 2)';
  EjecutarSqlSTEx(sSql, [TDateTimeEx.Create((aFechaDesde - 1)), Sesion.UserID, aContrato,
                         TDateTimeEx.Create(aFechaDesde)]);
end;

function TfrmManPEB_EXPOSICIONBAJA.Validar: Boolean;
begin
  if ModoABM = maAlta then
  begin
    Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'La fecha de inicio de vigencia es obligatoria.');
    Verificar((edFechaDesde.Date > MaxFecha), edFechaDesde, 'La fecha es inválida.');
  end;

  if ModoABM = maModificacion then
  begin
    Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'La fecha de fin de vigencia es obligatoria.');
    Verificar(edFechaHasta.Date < edFechaDesde.Date, edFechaHasta, 'La fecha de fin de vigencia no puede superar la fecha desde.');
  end;

  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe seleccionar un contrato.');

  Result := True;
end;

procedure TfrmManPEB_EXPOSICIONBAJA.tbNuevoClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := False;
  fraEmpresa.Enabled := True;

  inherited;
end;

procedure TfrmManPEB_EXPOSICIONBAJA.tbEliminarClick(Sender: TObject);
begin
  fpABM.Caption := 'Baja';

  edFechaDesde.Enabled := False;
  edFechaHasta.Enabled := True;
  fraEmpresa.Enabled := False;

  ModoABM := maModificacion;
  ModoABMToSqlType;

  fraEmpresa.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  edFechaDesde.Date := sdqConsulta.FieldByName('eb_fechadesde').AsDateTime;
  edFechaHasta.Date := sdqConsulta.FieldByName('eb_fechahasta').AsDateTime;

  Verificar(not sdqConsulta.FieldByName('eb_fechabaja').IsNull, Grid, 'El registro esta dado de baja.');

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
end;

procedure TfrmManPEB_EXPOSICIONBAJA.tbModificarClick(Sender: TObject);
begin
  edFechaDesde.Enabled := True;
  edFechaHasta.Enabled := True;
  inherited;
end;

procedure TfrmManPEB_EXPOSICIONBAJA.FormCreate(Sender: TObject);
begin
  edVigenciaFiltro.Date := Now;
  inherited;
  FieldBaja := 'eb_fechabaja';
end;

function TfrmManPEB_EXPOSICIONBAJA.MaxFecha: TDate;
begin
  Result := EncodeDate(2999, 12, 31);
end;

end.
