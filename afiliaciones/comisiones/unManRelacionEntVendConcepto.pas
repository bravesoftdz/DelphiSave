unit unManRelacionEntVendConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unArt, Mask, ToolEdit, CurrEdit,
  DateComboBox, unArtDbFrame, unFraEmpresa, PatternEdit, IntEdit;

type
  TfrmManRelacionEntVendConcepto = class(TfrmCustomGridABM)
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbCerrar: TToolButton;
    tbAprobar: TToolButton;
    ToolButton1: TToolButton;
    fraVC_IDCONCEPTO: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edVC_PORCPUBLICO: TCurrencyEdit;
    edVC_PORCPRIVADO: TCurrencyEdit;
    Label4: TLabel;
    edVC_VIGENCIADESDE: TDateComboBox;
    Label5: TLabel;
    edVC_VIGENCIAHASTA: TDateComboBox;
    edVC_MONTOFIJO: TCurrencyEdit;
    Label6: TLabel;
    fraVC_CONTRATO: TfraEmpresa;
    Label7: TLabel;
    edObservaciones: TMemo;
    lbContrato: TLabel;
    edVC_CUOTASDESCUENTO: TIntEdit;
    Label8: TLabel;
    edVC_FECHAHASTADESCUENTO: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbCerrarClick(Sender: TObject);
    procedure DoCalcularFHastaDescuento(Sender: TObject);
  private
    FIdEntidadVend: TTableId;
    procedure SetIDEntidadVend(const Value: TTableId);
    procedure fraVC_IDCONCEPTOChange(Sender: TObject);
    function IsAnticipo: Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
    property IdEntidadVend: TTableId read FIdEntidadVend write SetIDEntidadVend;
  end;

var
  frmManRelacionEntVendConcepto: TfrmManRelacionEntVendConcepto;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, CustomDlgs, SqlFuncs, DateTimeFuncs, VCLExtra;

procedure TfrmManRelacionEntVendConcepto.ClearControls;
begin
  fraVC_IDCONCEPTO.Clear;
  edVC_VIGENCIADESDE.Clear;
  edVC_VIGENCIAHASTA.Clear;
  edVC_MONTOFIJO.Clear;
  edVC_PORCPRIVADO.Clear;
  edVC_PORCPUBLICO.Clear;
  fraVC_CONTRATO.Clear;
  edObservaciones.Clear;
  edVC_CUOTASDESCUENTO.Clear;
  edVC_FECHAHASTADESCUENTO.Clear;
end;

function TfrmManRelacionEntVendConcepto.DoABM: Boolean;
var
  fId: TTableId;
begin
  Sql.Clear;
  Sql.TableName := 'XVC_ENTVENDCONCEPTO';

  if ModoABM = maAlta then
    fId := GetSecNextVal('SEQ_XVC_ID')
  else
    fId := sdqConsulta.FieldByName('VC_ID').AsInteger;

  Sql.PrimaryKey.Add('VC_ID', fId, False);

  if ModoABM = maBaja then
    begin
      Sql.SqlType := stUpdate;

      Sql.Fields.Add('VC_USUBAJA',                Sesion.UserID);
      Sql.Fields.Add('VC_FECHABAJA',              SQL_DATETIME, False);
    end
  else
    begin   // es un alta
      Sql.SqlType := stInsert;

      Sql.Fields.Add('VC_IDENTIDADVEND',          IdEntidadVend);
      Sql.Fields.Add('VC_IDCONCEPTO',             fraVC_IDCONCEPTO.Value);

      if not edVC_VIGENCIADESDE.IsEmpty then
        Sql.Fields.Add('VC_VIGENCIADESDE',        edVC_VIGENCIADESDE.Date);

      if not edVC_VIGENCIAHASTA.IsEmpty then
        Sql.Fields.Add('VC_VIGENCIAHASTA',        edVC_VIGENCIAHASTA.Date);

      if fraVC_CONTRATO.IsSelected then
        Sql.Fields.Add('VC_CONTRATO',             fraVC_CONTRATO.Contrato);

      Sql.Fields.Add('VC_MONTOFIJO',              edVC_MONTOFIJO.Value);
      Sql.Fields.Add('VC_PORCPRIVADO',            edVC_PORCPRIVADO.Value);
      Sql.Fields.Add('VC_PORCPUBLICO',            edVC_PORCPUBLICO.Value);
      Sql.Fields.Add('VC_OBSERVACIONES',          Trim(edObservaciones.Lines.Text));
      Sql.Fields.Add('VC_CUOTASDESCUENTO',        edVC_CUOTASDESCUENTO.Value, True);

      if not edVC_FECHAHASTADESCUENTO.IsEmpty then
        Sql.Fields.Add('VC_FECHAHASTADESCUENTO',  edVC_FECHAHASTADESCUENTO.Date);

      Sql.Fields.Add('VC_USUALTA',                Sesion.UserID);
      Sql.Fields.Add('VC_FECHAALTA',              SQL_DATETIME, False);
    end;

  Result := inherited DoABM;
end;

procedure TfrmManRelacionEntVendConcepto.FormCreate(Sender: TObject);
begin
  inherited;

  with fraVC_IDCONCEPTO do
    begin
      TableName             := 'XCO_CONCEPTO';
      FieldID               := 'CO_ID';
      FieldCodigo           := 'CO_ID';
      FieldDesc             := 'CO_DESCRIPCION';
      FieldBaja             := 'CO_FECHABAJA';
      ExtraFields           := ', CO_ASIGNABLECONTRATO, CO_REQUIERECONTRATO ';
      VisibleExtraFields[0] := False;
      VisibleExtraFields[1] := False;
      ExtraCondition        := 'AND CO_ASIGNABLEVENDEDOR = ''S'' AND CO_CUENTACONTABLE IS NOT NULL AND CO_SIGNO IS NOT NULL';
      OnChange              := fraVC_IDCONCEPTOChange;
      DynamicCols           := True;
      ShowBajas             := False;
    end;

  fraVC_CONTRATO.ShowBajas := False;
  
  FieldBaja := 'FECHABAJA';

  VCLExtra.LockControl(edVC_FECHAHASTADESCUENTO);
end;

procedure TfrmManRelacionEntVendConcepto.LoadControls;
begin
  inherited;
end;

procedure TfrmManRelacionEntVendConcepto.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT CO_DESCRIPCION CONCEPTO, VC_VIGENCIADESDE VIGENCIADESDE, VC_VIGENCIAHASTA VIGENCIAHASTA, ' +
                 'VC_PORCPRIVADO PORCPRIVADO, VC_PORCPUBLICO PORCPUBLICO, VC_MONTOFIJO MONTOFIJO, ' +
                 'TRUNC(VC_FECHACIERRE) FECHACIERRE, TRUNC(VC_FECHAAPROBADO) FECHAAPROBADO, TRUNC(VC_FECHABAJA) FECHABAJA, ' +
                 'VC_ID, VC_CONTRATO CONTRATO, VC_OBSERVACIONES OBSERVACIONES, VC_CUOTASDESCUENTO CUOTASDESCUENTO, ' +
                 'VC_FECHAHASTADESCUENTO FECHAHASTADESCUENTO, CO_ID IDCONCEPTO ' +
            'FROM XCO_CONCEPTO, XVC_ENTVENDCONCEPTO ' +
           'WHERE CO_ID = VC_IDCONCEPTO ' +
             'AND VC_IDENTIDADVEND = ' + SqlValue(IdEntidadVend);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManRelacionEntVendConcepto.SetIDEntidadVend(const Value: TTableId);
begin
  if FIdEntidadVend <> Value then
    begin
      FIdEntidadVend := Value;
      RefreshData;
    end;
end;

function TfrmManRelacionEntVendConcepto.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraVC_IDCONCEPTO.IsEmpty, fraVC_IDCONCEPTO, 'El concepto es obligatorio.');
  Verificar(not edVC_VIGENCIADESDE.ReadOnly and edVC_VIGENCIADESDE.IsEmpty, edVC_VIGENCIADESDE, 'La vigencia desde es obligatoria.');
  Verificar(IsAnticipo() and not edVC_VIGENCIAHASTA.ReadOnly and edVC_VIGENCIAHASTA.IsEmpty, edVC_VIGENCIAHASTA, 'Para este concepto la vigencia hasta es obligatoria.');
  Verificar(not edVC_MONTOFIJO.ReadOnly and (edVC_MONTOFIJO.Value = 0), edVC_MONTOFIJO, 'El monto fijo es obligatorio.');
  Verificar(not edVC_CUOTASDESCUENTO.ReadOnly and (edVC_CUOTASDESCUENTO.Value < 1), edVC_CUOTASDESCUENTO, 'Para este concepto la cantidad de cuotas a descontar es obligatoria.');
//  Verificar(not edVC_PORCPRIVADO.ReadOnly and (edVC_PORCPRIVADO.Value = 0), edVC_PORCPRIVADO, 'El porcentaje para la comisión del sector privado es obligatorio.');
  Verificar(not edVC_PORCPRIVADO.ReadOnly and ((edVC_PORCPRIVADO.Value < 0) or (edVC_PORCPRIVADO.Value > 100)), edVC_PORCPRIVADO, 'La comisión del sector privado debe ser mayor o igual que 0 y menor o igual que 100.');
//  Verificar(not edVC_PORCPUBLICO.ReadOnly and (edVC_PORCPUBLICO.Value = 0), edVC_PORCPUBLICO, 'El porcentaje para la comisión del sector público es obligatorio.');
  Verificar(not edVC_PORCPUBLICO.ReadOnly and ((edVC_PORCPUBLICO.Value < 0) or (edVC_PORCPUBLICO.Value > 100)), edVC_PORCPUBLICO, 'La comisión del sector público debe ser mayor o igual que 0 y menor o igual que 100.');
  Verificar(not fraVC_CONTRATO.ReadOnly and fraVC_CONTRATO.IsEmpty, fraVC_CONTRATO, 'El contrato es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM XVC_ENTVENDCONCEPTO ' +
           'WHERE VC_FECHABAJA IS NULL ' +
             'AND VC_IDENTIDADVEND = :IdEntVend ' +
             'AND VC_IDCONCEPTO = :IdConcepto ';

  if not fraVC_CONTRATO.ReadOnly then
    sSql := sSql + 'AND VC_CONTRATO = ' + SqlValue(fraVC_CONTRATO.Contrato) + ' ';

  if not edVC_VIGENCIADESDE.ReadOnly then
    sSql := sSql + 'AND ' + SqlValue(edVC_VIGENCIADESDE.Date) + ' BETWEEN VC_VIGENCIADESDE AND NVL(VC_VIGENCIAHASTA, TO_DATE(''31/12/2999'', ''DD/MM/YYYY''))';

  Verificar(ExisteSqlEx(sSql, [IdEntidadVend, fraVC_IDCONCEPTO.Value]), nil, 'Ya existe un registro para este concepto.');

  Result := True;
end;

procedure TfrmManRelacionEntVendConcepto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('PORCPRIVADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCPRIVADO')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('PORCPUBLICO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCPUBLICO')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('MONTOFIJO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOFIJO')).Currency := True;
end;

procedure TfrmManRelacionEntVendConcepto.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('FECHAAPROBADO').IsNull, nil, 'El registro ya ha sido aprobado.');

  if MsgBox('¿Está seguro que desea aprobar el registro seleccionado?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XVC_ENTVENDCONCEPTO ' +
                 'SET VC_USUAPROBADO = :UsuAprobado, ' +
                     'VC_FECHAAPROBADO = SYSDATE ' +
               'WHERE VC_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('VC_ID').AsInteger]);

      MsgBox('Registro aprobado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

procedure TfrmManRelacionEntVendConcepto.tbCerrarClick(Sender: TObject);
var
  sSql: String;
  VigHasta: TDateTime;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'El registro se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('VIGENCIADESDE').IsNull, nil, 'El registro no posee vigencia desde.');
  Verificar(not sdqConsulta.FieldByName('VIGENCIAHASTA').IsNull, nil, 'El registro ya ha sido cerrado.');

  repeat
    VigHasta := InputBoxDate('Cierre de Vigencia', 'F. de Cierre', 0);

    if VigHasta = 0 then
      InfoHint(nil, 'Debe ingresar la fecha de cierre.');
  until (VigHasta = -1) or (VigHasta > 0);

  if VigHasta > 0 then
    begin
      Verificar(VigHasta < sdqConsulta.FieldByName('VIGENCIADESDE').AsDateTime, nil, 'La fecha de cierre no puede ser anterior a la vigencia desde: ' + sdqConsulta.FieldByName('VIGENCIADESDE').AsString + '.');

      if MsgBox('¿Está seguro que desea cerrar la vigencia del registro seleccionado?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
        begin
          sSql := 'UPDATE XVC_ENTVENDCONCEPTO ' +
                     'SET VC_USUCIERRE = :UsuCierre, ' +
                         'VC_FECHACIERRE = SysDate, ' +
                         'VC_VIGENCIAHASTA = :VigHasta ' +
                   'WHERE VC_ID = :Id';
          EjecutarSqlEx(sSql, [Sesion.UserId, TDateTimeEx.Create(VigHasta), sdqConsulta.FieldByName('VC_ID').AsInteger]);

          MsgBox('Registro cerrado correctamente.', MB_ICONINFORMATION);
          RefreshData;
        end;
    end;
end;

procedure TfrmManRelacionEntVendConcepto.fraVC_IDCONCEPTOChange(Sender: TObject);
var
  bEsAnticipo, bRequiereContrato, bAsignableContrato: Boolean;
begin
  if fraVC_IDCONCEPTO.IsSelected then
    begin
      bAsignableContrato := (fraVC_IDCONCEPTO.FieldValue('CO_ASIGNABLECONTRATO', fraVC_IDCONCEPTO.cmbDescripcion.Row) = 'S');
      VCLExtra.LockControls([edVC_VIGENCIADESDE, edVC_VIGENCIAHASTA, edVC_MONTOFIJO], bAsignableContrato);
      VCLExtra.LockControls([edVC_PORCPRIVADO, edVC_PORCPUBLICO], not bAsignableContrato);

      if bAsignableContrato then
        begin
          edVC_VIGENCIADESDE.Clear;
          edVC_VIGENCIAHASTA.Clear;
          edVC_MONTOFIJO.Clear;
        end
      else
        begin
          edVC_PORCPRIVADO.Clear;
          edVC_PORCPUBLICO.Clear;
        end;

      bEsAnticipo := IsAnticipo();
      VCLExtra.LockControl(edVC_CUOTASDESCUENTO, not bEsAnticipo);

      if not bEsAnticipo then
        begin
          edVC_CUOTASDESCUENTO.Clear;
          edVC_FECHAHASTADESCUENTO.Clear;
        end;

      bRequiereContrato := (fraVC_IDCONCEPTO.FieldValue('CO_REQUIERECONTRATO', fraVC_IDCONCEPTO.cmbDescripcion.Row) = 'S');
      VCLExtra.LockControls([fraVC_CONTRATO], not bRequiereContrato);

      if not bRequiereContrato then
        fraVC_CONTRATO.Clear;
    end;
end;

procedure TfrmManRelacionEntVendConcepto.DoCalcularFHastaDescuento(Sender: TObject);
begin
  if not edVC_VIGENCIAHASTA.IsEmpty and (edVC_CUOTASDESCUENTO.Value >= 1) then
    edVC_FECHAHASTADESCUENTO.Date := LastDayOfMonth(AddMonths(edVC_VIGENCIAHASTA.Date, edVC_CUOTASDESCUENTO.Value-1))
  else
    edVC_FECHAHASTADESCUENTO.Clear;
end;

function TfrmManRelacionEntVendConcepto.IsAnticipo: Boolean;
begin
  Result := (fraVC_IDCONCEPTO.Value = 53);   // 53: Anticipo Comisiones
end;

end.

