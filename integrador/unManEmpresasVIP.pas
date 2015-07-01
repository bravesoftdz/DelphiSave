unit unManEmpresasVIP;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, unCustomGridABM, ShortCutControl,
  SortDlg, DB, SDEngine, StdCtrls, DateComboBox, unFraEmpresa, unfraEmpresaAGENDA, unFraCodDesc,
  Mask, ToolEdit, unArtDbFrame, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, FieldHider,
  Dialogs, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  CheckLst, ARTCheckListBox, AdvGroupBox, AdvOfficeButtons;

type
  TfrmManEmpresasVIP = class(TfrmCustomGridABM)
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    fraEmpresaVIP: TfraEmpresaAGENDA;
    fraEV_IDEMPRESA: TfraEmpresaAGENDA;
    fraEV_IDMOTIVOEMPRESAVIP: TfraCodDesc;
    fraMotivoEmpresaVIP: TfraCodDesc;
    Label1: TLabel;
    Label2: TLabel;
    lbHasta: TLabel;
    lbVigencia: TLabel;
    sdqConsultaCOBERTURA: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEV_FECHAALTA: TDateTimeField;
    sdqConsultaEV_FECHAMODIF: TDateTimeField;
    sdqConsultaEV_ID: TFloatField;
    sdqConsultaEV_IDEMPRESA: TFloatField;
    sdqConsultaEV_IDMOTIVOEMPRESAVIP: TFloatField;
    sdqConsultaEV_USUALTA: TStringField;
    sdqConsultaEV_USUMODIF: TStringField;
    sdqConsultaEV_VIGENCIADESDE: TDateTimeField;
    sdqConsultaEV_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaMV_DESCRIPCION: TStringField;
    sdqConsultaUSUALTA: TStringField;
    sdqConsultaUSUMODIF: TStringField;
    ShortCutControlHijo: TShortCutControl;
    Panel1: TPanel;
    Panel2: TPanel;
    clbCO_ESTADO: TARTCheckListBox;
    sdqConsultaCO_ESTADO: TStringField;
    sdqConsultaTB_DESCRIPCION: TStringField;
    sdqConsultaRC_PERIODONOMINA: TStringField;
    sdqConsultaRC_DEVENGADOCUOTA: TFloatField;
    rgVigencia: TAdvOfficeRadioGroup;
    sdqConsultaRC_EMPLEADOS: TFloatField;
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
  frmManEmpresasVIP: TfrmManEmpresasVIP;

implementation

uses
  unDmPrincipal, unSesion, VCLExtra, CustomDlgs, unFiltros, SqlFuncs, General, DateTimeFuncs;

{$R *.dfm}

procedure TfrmManEmpresasVIP.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  SQL.TableName := 'COMUNES.CEV_EMPRESAVIP';
//  FieldBaja := 'EV_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  fraEmpresaVIP.ShowBajas := True;
  fraEV_IDEMPRESA.ShowBajas := True;
  fraEV_IDEMPRESA.MostrarMensajeInformacion := False;
end;

procedure TfrmManEmpresasVIP.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([edVigenciaHasta], ModoABM = maAlta);
  VCLExtra.LockControls([fraEmpresaVIP, edVigenciaDesde], ModoABM = maModificacion);
end;

procedure TfrmManEmpresasVIP.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FieldName, ['EV_VIGENCIADESDE', 'EV_VIGENCIAHASTA']) and not Field.DataSet.FieldByName('EV_VIGENCIAHASTA').IsNull then
    AFont.Color := IIF(Highlight, clMaroon, clRed);

  if AreIn(Field.FieldName, ['EM_NOMBRE']) and (Field.DataSet.FieldByName('COBERTURA').AsString <> '1') then
    AFont.Color := IIF(Highlight, clMaroon, clRed);
end;

procedure TfrmManEmpresasVIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid, 25, True, True);
end;

procedure TfrmManEmpresasVIP.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbModificar, 'Debe seleccionar una empresa.');
  Verificar((not sdqConsulta.FieldByName('EV_VIGENCIAHASTA').IsNull), nil,
            'La empresa ya ha dejado de ser considerada importante desde el ' + DateToStr(Trunc(sdqConsulta.FieldByName('EV_VIGENCIAHASTA').AsDateTime)) + '.');
  inherited;
end;

procedure TfrmManEmpresasVIP.ClearControls;
begin
  inherited;
  fraEmpresaVIP.Clear;
  fraMotivoEmpresaVIP.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManEmpresasVIP.ClearData;
begin
  inherited;
  fraEV_IDEMPRESA.Clear;
  fraEV_IDMOTIVOEMPRESAVIP.Clear;
  rgVigencia.ItemIndex := 0;
  clbCO_ESTADO.ClearChecks;
end;

function TfrmManEmpresasVIP.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Verificar((ModoABM = maBaja) and (not sdqConsulta.FieldByName('EV_VIGENCIAHASTA').IsNull), nil,
              'La empresa ya ha dejado de ser considerada importante desde el ' + DateToStr(Trunc(sdqConsulta.FieldByName('EV_VIGENCIAHASTA').AsDateTime)) + '.');
    Sql.PrimaryKey.Add('EV_ID', sdqConsulta.FieldByName('EV_ID').AsInteger);
    Sql.Fields.Add('EV_FECHAMODIF', exDateTime);
    Sql.Fields.Add('EV_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('EV_VIGENCIAHASTA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('EV_ID', GetSecNextVal('COMUNES.SEQ_CEV_ID'));
      Sql.Fields.Add('EV_FECHAALTA', exDateTime);
      Sql.Fields.Add('EV_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('EV_ID', sdqConsulta.FieldByName('EV_ID').AsInteger);
      Sql.Fields.Add('EV_FECHAMODIF', exDateTime);
      Sql.Fields.Add('EV_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('EV_IDEMPRESA', fraEmpresaVIP.Value);
    Sql.Fields.Add('EV_IDMOTIVOEMPRESAVIP', fraMotivoEmpresaVIP.Value);
    Sql.Fields.Add('EV_VIGENCIADESDE', edVigenciaDesde.Date, dmDate);

    if edVigenciaHasta.Date > 0 then
      Sql.Fields.Add('EV_VIGENCIAHASTA', edVigenciaHasta.Date, dmDate);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManEmpresasVIP.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEmpresaVIP.Value := FieldByName('EV_IDEMPRESA').AsInteger;
    HideAllBalloons;
    edVigenciaDesde.Date := FieldByName('EV_VIGENCIADESDE').AsDateTime;
    edVigenciaHasta.Date := FieldByName('EV_VIGENCIAHASTA').AsDateTime;
    fraMotivoEmpresaVIP.Value := FieldByName('EV_IDMOTIVOEMPRESAVIP').AsInteger;
  end;
end;

procedure TfrmManEmpresasVIP.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) +
                          clbCO_ESTADO.InSQL_StringValues('CO_ESTADO', False) +
                          iif(rgVigencia.ItemIndex = 0, ' AND TRUNC(SYSDATE) BETWEEN EV_VIGENCIADESDE AND NVL(EV_VIGENCIAHASTA, SYSDATE) ', ' ') +
                          SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManEmpresasVIP.Validar: Boolean;
var
  sSQL: String;
begin
  Verificar(fraEmpresaVIP.IsEmpty, fraEmpresaVIP.edContrato, 'Debe seleccionar la empresa que considera importante.');
  Verificar((not fraEmpresaVIP.Locked) and fraEmpresaVIP.IsBaja, fraEmpresaVIP.edContrato, 'La empresa seleccionada ha sido dada de baja.');
  Verificar(edVigenciaDesde.IsEmpty, edVigenciaDesde, 'Debe indicar la fecha a partir de la cual será considerada importante la empresa ' + fraEmpresaVIP.RazonSocial);

  sSQL := 'SELECT 1 FROM COMUNES.CEV_EMPRESAVIP WHERE EV_IDEMPRESA = :IDEMPRESA AND :FECHA BETWEEN EV_VIGENCIADESDE AND NVL(EV_VIGENCIAHASTA, SYSDATE)';

  Verificar((ModoABM = maAlta) and ExisteSQLEx(sSQL, [fraEmpresaVIP.Value, TDateTimeEx.Create(edVigenciaDesde.Date)]), fraEmpresaVIP.edContrato, 'Ya se ha definido que la empresa ' + fraEmpresaVIP.RazonSocial + ' sea considerada importante en el período indicado.');
  Verificar((not edVigenciaDesde.IsEmpty) and (not edVigenciaHasta.IsEmpty) and (edVigenciaDesde.Date > edVigenciaHasta.Date), edVigenciaHasta, 'La fecha de fin de la vigencia debe ser posterior a la fecha de inicio ' + DateToStr(edVigenciaDesde.Date) + '.');
  Verificar(fraMotivoEmpresaVIP.IsEmpty, fraMotivoEmpresaVIP.edCodigo, 'Debe seleccionar el motivo por el cual considera que esta empresa es importante.');
  Result := True;
end;

end.
