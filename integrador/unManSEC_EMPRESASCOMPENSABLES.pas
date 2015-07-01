unit unManSEC_EMPRESASCOMPENSABLES;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, unCustomGridABM, ShortCutControl,
  SortDlg, DB, SDEngine, StdCtrls, DateComboBox, unFraEmpresa, unfraEmpresaAGENDA, unFraCodDesc,
  Mask, ToolEdit, unArtDbFrame, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, FieldHider,
  Dialogs, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManSEC_EMPRESASCOMPENSABLES = class(TfrmCustomGridABM)
    edVigenciaDesdeNO: TDateComboBox;
    edVigenciaHastaNO: TDateComboBox;
    fraEmpresaCompensable: TfraEmpresaAGENDA;
    fraEC_CONTRATO: TfraEmpresaAGENDA;
    lbHasta: TLabel;
    lbVigencia: TLabel;
    sdqConsultaCOBERTURA: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaUSUALTA: TStringField;
    sdqConsultaUSUMODIF: TStringField;
    ShortCutControlHijo: TShortCutControl;
    sdqConsultaEC_ID: TFloatField;
    sdqConsultaEC_CONTRATO: TFloatField;
    sdqConsultaEC_USUALTA: TStringField;
    sdqConsultaEC_FECHAALTA: TDateTimeField;
    sdqConsultaEC_USUMODIF: TStringField;
    sdqConsultaEC_FECHAMODIF: TDateTimeField;
    sdqConsultaEC_USUBAJA: TStringField;
    sdqConsultaEC_FECHABAJA: TDateTimeField;
    sdqConsultaUSUBAJA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
    function  Validar : Boolean; override;
  end;

var
  frmManSEC_EMPRESASCOMPENSABLES: TfrmManSEC_EMPRESASCOMPENSABLES;

implementation

uses
  unDmPrincipal, unSesion, VCLExtra, CustomDlgs, unFiltros, SqlFuncs, General, DateTimeFuncs;

{$R *.dfm}

procedure TfrmManSEC_EMPRESASCOMPENSABLES.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'SIN.SEC_EMPRESASCOMPENSABLES';
  FieldBaja := 'EC_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  fraEmpresaCompensable.ShowBajas := True;
  fraEC_CONTRATO.ShowBajas := True;
  fraEC_CONTRATO.MostrarMensajeInformacion := False;
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.fpAbmShow(Sender: TObject);
begin
  inherited;
//  VCLExtra.LockControls([edVigenciaHasta], ModoABM = maAlta);
  VCLExtra.LockControls([fraEmpresaCompensable{, edVigenciaDesde}], ModoABM = maModificacion);
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
{
  if AreIn(Field.FieldName, ['EC_VIGENCIADESDE', 'EC_VIGENCIAHASTA']) and not Field.DataSet.FieldByName('EC_VIGENCIAHASTA').IsNull then
    AFont.Color := IIF(Highlight, clMaroon, clRed);
}
  if AreIn(Field.FieldName, ['EM_NOMBRE']) and (Field.DataSet.FieldByName('COBERTURA').AsString <> '1') then
    AFont.Color := IIF(Highlight, clMaroon, clRed);
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid, 25, True, True);
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbModificar, 'Debe seleccionar una empresa.');
//  Verificar((not sdqConsulta.FieldByName('EC_VIGENCIAHASTA').IsNull), nil, 'La empresa ya ha dejado de ser considerada importante desde el ' + DateToStr(Trunc(sdqConsulta.FieldByName('EC_VIGENCIAHASTA').AsDateTime)) + '.');
  inherited;
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.ClearControls;
begin
  inherited;
  fraEmpresaCompensable.Clear;
{
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
}
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManSEC_EMPRESASCOMPENSABLES.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
{
    Verificar((ModoABM = maBaja) and (not sdqConsulta.FieldByName('EV_VIGENCIAHASTA').IsNull), nil,
              'La empresa ya ha dejado de ser considerada importante desde el ' + DateToStr(Trunc(sdqConsulta.FieldByName('EV_VIGENCIAHASTA').AsDateTime)) + '.');

}
    Sql.PrimaryKey.Add('EC_ID', sdqConsulta.FieldByName('EC_ID').AsInteger);
    Sql.Fields.Add('EC_FECHABAJA', exDate);
    Sql.Fields.Add('EC_USUBAJA', Sesion.UserID);
//    Sql.Fields.Add('EC_VIGENCIAHASTA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('EC_ID', GetSecNextVal('SIN.SEQ_SEC_ID'));
      Sql.Fields.Add('EC_FECHAALTA', exDate);
      Sql.Fields.Add('EC_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('EC_ID', sdqConsulta.FieldByName('EC_ID').AsInteger);
      Sql.Fields.Add('EC_FECHAMODIF', exDate);
      Sql.Fields.Add('EC_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('EC_CONTRATO', fraEmpresaCompensable.Contrato);
{
    Sql.Fields.Add('EC_VIGENCIADESDE', edVigenciaDesde.Date, dmDate);

    if edVigenciaHasta.Date > 0 then
      Sql.Fields.Add('EV_VIGENCIAHASTA', edVigenciaHasta.Date, dmDate);
}      
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEmpresaCompensable.Contrato := FieldByName('EC_CONTRATO').AsInteger;
    HideAllBalloons;
{
    edVigenciaDesde.Date := FieldByName('EC_VIGENCIADESDE').AsDateTime;
    edVigenciaHasta.Date := FieldByName('EC_VIGENCIAHASTA').AsDateTime;
 }
   end;
end;

procedure TfrmManSEC_EMPRESASCOMPENSABLES.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManSEC_EMPRESASCOMPENSABLES.Validar: Boolean;
//var
//  sSQL: String;
begin
  Verificar(fraEmpresaCompensable.IsEmpty, fraEmpresaCompensable.edContrato, 'Debe seleccionar la empresa que considera importante.');
  Verificar((not fraEmpresaCompensable.Locked) and fraEmpresaCompensable.IsBaja, fraEmpresaCompensable.edContrato, 'La empresa seleccionada ha sido dada de baja.');
{
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe indicar la fecha a partir de la cual será considerada importante la empresa ' + fraEmpresaVIP.RazonSocial);
  sSQL := 'SELECT 1 FROM COMUNES.CEV_EMPRESAVIP WHERE EV_IDEMPRESA = :IDEMPRESA AND :FECHA BETWEEN EV_VIGENCIADESDE AND NVL(EV_VIGENCIAHASTA, SYSDATE)';
  Verificar((ModoABM = maAlta) and ExisteSQLEx(sSQL, [fraEmpresaCompensable.Value, TDateTimeEx.Create(edVigenciaDesde.Date)]), fraEmpresaVIP.edContrato, 'Ya se ha definido que la empresa ' + fraEmpresaVIP.RazonSocial + ' sea considerada importante en el período indicado.');
  Verificar((not edVigenciaDesde.IsEmpty) and (not edVigenciaHasta.IsEmpty) and (edVigenciaDesde.Date > edVigenciaHasta.Date), edVigenciaHasta, 'La fecha de fin de la vigencia debe ser posterior a la fecha de inicio ' + DateToStr(edVigenciaDesde.Date) + '.');
}
  Result := True;
end;

end.
