unit unDlgBusEstablecimiento;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls,
  FieldHider, ShortCutControl, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unArt, unCustomGridABM, FormPanel, unFraDomicilio, unFraTelefono, Mask, PatternEdit, JvgGroupBox,
  IntEdit, unFraCodigoDescripcion, unFraActividad, DateComboBox, DBCtrls, unFraEstablecimiento, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls;

type
  TfrmDlgBusEstablecimiento = class(TfrmCustomGridABM)
    pnlBottom: TPanel;
    Panel2: TPanel;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    btnAceptarGlobal: TButton;
    btnCancelarGlobal: TButton;
    grbDomicilio: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    Label3: TLabel;
    edES_CODAREAFAX: TPatternEdit;
    edES_FAX: TPatternEdit;
    edES_DOMICILIO: TEdit;
    fraTelefono: TfraTelefono;
    fraDomicilio: TfraDomicilio;
    gbDatos: TJvgGroupBox;
    grbIdentifica: TGroupBox;
    lbNombre: TLabel;
    lbAlta: TLabel;
    Label2: TLabel;
    lbActividad: TLabel;
    lbCantEmpleados: TLabel;
    lbMasaSalarial: TLabel;
    lbNivel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edES_NOMBRE: TEdit;
    edES_FEINICACTIV: TDateComboBox;
    edES_FECHAINICEST: TDateComboBox;
    fraES_ACTIVIDAD: TfraActividad;
    edES_EMPLEADOS: TIntEdit;
    edES_MASA: TCurrencyEdit;
    edES_NIVEL: TPatternEdit;
    edES_OBSERVACIONES: TMemo;
    grbSolicitud: TGroupBox;
    edES_CONTRATO: TIntEdit;
    cbES_EVENTUAL: TCheckBox;
    edES_FECHARECEPCIONBAJA: TDateComboBox;
    edBusqueda: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edEmpresa: TDBEdit;
    Label8: TLabel;
    edObservaciones: TDBMemo;
    Label9: TLabel;
    edActividad: TDBMemo;
    fpBusqueda: TFormPanel;
    Bevel1: TBevel;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    fraEstablecimiento: TfraEstablecimiento;
    edCUIT: TJvDBMaskEdit;
    ShortCutControlDuplicated: TShortCutControl;
    edBusqueda2: TEdit;
    pnlBusqueda2: TPanel;
    rb5: TRadioButton;
    rb6: TRadioButton;
    rb7: TRadioButton;
    rb8: TRadioButton;
    pnlBusqueda1: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    Label11: TLabel;
    edPreventor: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure rbClick(Sender: TObject);
    procedure edBusquedaChange(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure Reactivacion(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edBusqueda2Change(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    AField1, AField2: string;
    APalabras: TStringList;
    function  PermitirBajaEstablecimiento(AContrato: Integer): boolean;
    procedure OnfraEstablecimientoChange(Sender: TObject);
    procedure ReactivarEstablecimiento;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;

    procedure ClearData; override;
    procedure EnableButtons(AEnabled: Boolean); override;
    procedure OnFiltroChange(Sender: TObject);
    procedure RefreshData; override;
  end;

  function  GetIdEstablecimiento(AIdEmpresa: TTableId = ART_EMPTY_ID): Integer;
  procedure MostrarEstablecimientos(AIdEmpresa: TTableId = ART_EMPTY_ID);

implementation

uses
  CustomDlgs, AnsiSql, SQLFuncs, General, VCLExtra, unSesion, unDmPrincipal, Strfuncs;

{$R *.dfm}
{------------------------------------------------------------------------------}
function GetIdEstablecimiento(AIdEmpresa: TTableId = ART_EMPTY_ID): Integer;
begin
  with TfrmDlgBusEstablecimiento.Create(Application) do
  try
    fraEmpresa.Contrato := AIdEmpresa;
    VCLExtra.LockControls(fraEmpresa, fraEmpresa.IsSelected);

    if ShowModal = mrOk Then
      Result := sdqConsulta.FieldByName('ES_ID').AsInteger
    else
      Result := -1;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure MostrarEstablecimientos(AIdEmpresa: TTableId = ART_EMPTY_ID);
begin
  with TfrmDlgBusEstablecimiento.Create(Application) do
  try
    fraEmpresa.Contrato := AIdEmpresa;
    VCLExtra.LockControls(fraEmpresa, fraEmpresa.IsSelected);
    pnlBottom.Visible := False;

    ShowModal;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.ClearData;
begin
  fraEmpresa.Clear;
  tbRefrescar.Enabled := False;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  btnAceptar.Enabled := AEnabled;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.RefreshData;
var
  sSql: string;
begin
  if fraEmpresa.IsSelected then
  begin
    sSql := 'SELECT ES_ID, ES_NROESTABLECI, ES_NOMBRE, ES_CALLE, ES_CPOSTAL, ES_LOCALIDAD, ES_PROVINCIA, ' +
                   '   ART.UTILES.ARMAR_DOMICILIO (ES_CALLE, ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, NULL) ' +
                   '|| ART.UTILES.ARMAR_LOCALIDAD (ES_CPOSTAL, NULL, ES_LOCALIDAD, ES_PROVINCIA) DOMICILIO, ' +
                   'ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, ES_CPOSTALA, ES_CODAREATELEFONOS, ES_TELEFONOS, ' +
                   'ES_CODAREAFAX, ES_FAX, ES_EMPLEADOS, ES_MASA, ES_IDACTIVIDAD, AC_DESCRIPCION, ES_NIVEL, ' +
                   'ES_FEINICACTIV, ES_FECHAINICEST, ES_OBSERVACIONES, ES_EVENTUAL, ES_FECHABAJA, ES_USUBAJA, ' +
                   'ES_DOMICILIO, PV_DESCRIPCION, ES_FECHARECEPCIONBAJA, ES_CONTRATO, EM_CUIT, EM_NOMBRE, ' +
                   'ART.HYS.GET_NOMBRE_PREVENTOR_ESTAB(EM_CUIT, ES_NROESTABLECI, ART.ACTUALDATE) PREVENTOR ' +
              'FROM AES_ESTABLECIMIENTO, AEM_EMPRESA, ACO_CONTRATO, CPV_PROVINCIAS, CAC_ACTIVIDAD ' +
             'WHERE ES_PROVINCIA = PV_CODIGO(+) ' +
               'AND ES_CONTRATO = CO_CONTRATO ' +
               'AND EM_ID = CO_IDEMPRESA ' +
               'AND AC_ID = ES_IDACTIVIDAD ';

    if fraEmpresa.IsSelected then
      AddCondition(sSql, 'ES_CONTRATO = ' + SqlValue(fraEmpresa.Contrato));

    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;
    if Grid.CanFocus then
      Grid.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.GridDblClick(Sender: TObject);
begin
  if btnAceptar.Enabled then
    ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.OnFiltroChange(Sender: TObject);
begin
  if Assigned(Sender)then
  begin
    sdqConsulta.Close;
    tbRefrescar.Enabled := fraEmpresa.IsSelected;
    if tbRefrescar.Enabled then
      tbRefrescar.Click;

    fraEstablecimiento.Contrato := fraEmpresa.Contrato;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.FormCreate(Sender: TObject);
begin
  inherited;
  APalabras := TStringList.Create;
  Sql.TableName := 'AES_ESTABLECIMIENTO';
  fraEmpresa.ShowBajas := True;
  fraEmpresa.OnChange := OnFiltroChange;
  fraEstablecimiento.OnChange := OnfraEstablecimientoChange;
  fraTelefono.Initialize(True, 'TE_IDESTABLECIMIENTO', 'TE', 'ATE_TELEFONOESTABLECIMIENTO');
  VCLExtra.LockControls([edES_CONTRATO], True);
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.tbPropiedadesClick(Sender: TObject);
begin
  fraEstablecimiento.Clear;
  btnAceptar.Enabled := False;
  fraEstablecimiento.Contrato := fraEmpresa.Contrato;
  if fpBusqueda.ShowModal = mrOk Then
    sdqConsulta.Locate('ES_ID', fraEstablecimiento.Value, []);
{
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    DynColWidthsByData(Grid);
}
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.FSFormShow(Sender: TObject);
begin
  inherited;
  OnFiltroChange(nil);
  RefreshData;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.tbRefrescarClick(Sender: TObject);
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.edContrato, 'Debe seleccionar al menos la empresa.');
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.ClearControls;
begin
  // Grupo Identificación del Establecimiento
  edES_NOMBRE.Clear;
  fraES_ACTIVIDAD.Clear;
  edES_NIVEL.Clear;
  edES_FEINICACTIV.Clear;
  edES_FECHAINICEST.Clear;
  edES_EMPLEADOS.Clear;
  edES_MASA.Clear;
  cbES_EVENTUAL.Checked := false;
  edES_FECHARECEPCIONBAJA.Clear;
  edES_OBSERVACIONES.Clear;

  // Grupo Domicilio
  fraDomicilio.Clear;
  fraTelefono.Clear(True);
  edES_CODAREAFAX.Clear;
  edES_FAX.Clear;
  edES_DOMICILIO.Clear;
  rb1.Checked := True;
end;
{------------------------------------------------------------------------------}
function TfrmDlgBusEstablecimiento.PermitirBajaEstablecimiento(AContrato: Integer): boolean;
begin
  Result := ExisteSqlEx('SELECT 1 ' +
                          'FROM AES_ESTABLECIMIENTO ' +
                         'WHERE ES_CONTRATO = :P1 ' +
                           'AND ES_FECHABAJA IS NULL', [AContrato]);
end;
{------------------------------------------------------------------------------}
function TfrmDlgBusEstablecimiento.DoABM: Boolean;
var
  iNroEstablecimiento, iIdEstablecimiento: Integer;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
    Verificar(not sdqConsulta.Eof and not sdqConsulta.FieldByName('ES_FECHABAJA').IsNull, nil, 'Este establecimiento ya se encuentra dado de baja.');
    Verificar(edES_FECHARECEPCIONBAJA.IsEmpty, nil, 'Antes de dar de baja un establecimiento, tiene que cargar la fecha de Recepción de la Baja.');

    if PermitirBajaEstablecimiento(fraEmpresa.Contrato) then
    begin
      Sql.Fields.Add('ES_FECHABAJA', exDateTime);
      Sql.Fields.Add('ES_USUBAJA',   Sesion.UserID);
    end;

    iIdEstablecimiento := sdqConsulta.FieldByName('ES_ID').AsInteger;
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      iNroEstablecimiento := ValorSqlEx('SELECT NVL(MAX(ES_NROESTABLECI), 0) + 1 FROM AES_ESTABLECIMIENTO WHERE ES_CONTRATO = :Contrato', [fraEmpresa.Contrato]);
      iIdEstablecimiento  := GetSecNextVal('SEQ_AES_ID');

      Sql.Fields.Add('ES_FECHAALTA', exDateTime);
      Sql.Fields.Add('ES_USUALTA', Sesion.UserID);
      Sql.Fields.Add('ES_NROESTABLECI', iNroEstablecimiento, False);
      Sql.SqlType := stInsert;
    end else
    begin { maModificacion }
      iIdEstablecimiento := sdqConsulta.FieldByName('ES_ID').AsInteger;
      Sql.Fields.Add('ES_FECHAMODIF', exDateTime);
      Sql.Fields.Add('ES_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('ES_CONTRATO', fraEmpresa.Contrato);
    Sql.Fields.Add('ES_NOMBRE', edES_NOMBRE.Text);
    Sql.Fields.Add('ES_IDACTIVIDAD', fraES_ACTIVIDAD.Value);
    Sql.Fields.Add('ES_NIVEL', edES_NIVEL.Text);

    with fraDomicilio do
    begin
      Sql.Fields.Add('ES_CPOSTAL', CodigoPostal);
      Sql.Fields.Add('ES_CALLE', Calle);
      Sql.Fields.Add('ES_LOCALIDAD', Localidad);
      Sql.Fields.Add('ES_PROVINCIA', ValorSql('SELECT PV_CODIGO' +
                                               ' FROM CPV_PROVINCIAS' +
                                              ' WHERE PV_DESCRIPCION = ' + SqlValue(Provincia)), dtString);
      Sql.Fields.Add('ES_NUMERO', Numero);
      Sql.Fields.Add('ES_PISO', Piso);
      Sql.Fields.Add('ES_DEPARTAMENTO', Departamento);
      Sql.Fields.Add('ES_CPOSTALA', CPA);
    end;

    Sql.Fields.Add('ES_CODAREAFAX', edES_CODAREAFAX.Text);
    Sql.Fields.Add('ES_FAX', edES_FAX.Text);
    Sql.Fields.Add('ES_OBSERVACIONES', edES_OBSERVACIONES.Text);
    Sql.Fields.Add('ES_EMPLEADOS', edES_EMPLEADOS.Value);
    Sql.Fields.Add('ES_FEINICACTIV', edES_FEINICACTIV.Date);
    Sql.Fields.Add('ES_FECHAINICEST', edES_FECHAINICEST.Date);
    Sql.Fields.Add('ES_FECHARECEPCIONBAJA', edES_FECHARECEPCIONBAJA.Date);
    Sql.Fields.Add('ES_EVENTUAL', String(IIF(cbES_EVENTUAL.Checked, 'S', 'N')));
    Sql.Fields.AddExtended('ES_MASA', edES_MASA.Value, ALL_DECIMALS, False);
  end;

  Sql.PrimaryKey.Add('ES_ID', iIdEstablecimiento);
  Result := inherited DoABM;
  fraTelefono.CopiarTempATelefonos(iIdEstablecimiento);  
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.LoadControls;
begin
  inherited;

  // Grupo Identificación del Establecimiento
  with sdqConsulta do
  begin
    edES_CONTRATO.Value           := FieldByName('ES_CONTRATO').AsInteger;
    edES_NOMBRE.Text              := FieldByName('ES_NOMBRE').AsString;
    fraES_ACTIVIDAD.Value         := FieldByName('ES_IDACTIVIDAD').AsInteger;
    edES_NIVEL.Text               := FieldByName('ES_NIVEL').AsString;
    edES_FEINICACTIV.Date         := FieldByName('ES_FEINICACTIV').AsDateTime;
    edES_FECHAINICEST.Date        := FieldByName('ES_FECHAINICEST').AsDateTime;
    edES_FECHARECEPCIONBAJA.Date  := FieldByName('ES_FECHARECEPCIONBAJA').AsDateTime;
    edES_EMPLEADOS.Value          := FieldByName('ES_EMPLEADOS').AsInteger;
    edES_MASA.Value               := FieldByName('ES_MASA').AsCurrency;
    cbES_EVENTUAL.Checked         := FieldByName('ES_EVENTUAL').AsString = 'S';
    edES_OBSERVACIONES.Text       := FieldByName('ES_OBSERVACIONES').AsString;

    // Grupo Domicilio
    with fraDomicilio do
    begin
      CodigoPostal := FieldByName('ES_CPOSTAL').AsString;
      Calle        := FieldByName('ES_CALLE').AsString;
      Localidad    := FieldByName('ES_LOCALIDAD').AsString;
      Provincia    := FieldByName('PV_DESCRIPCION').AsString;
      Numero       := IIF(FieldByName('ES_NUMERO').asString <> '', FieldByName('ES_NUMERO').asString, 'S/N');
      Piso         := FieldByName('ES_PISO').asString;
      Departamento := FieldByName('ES_DEPARTAMENTO').asString;
      CPA          := FieldByName('ES_CPOSTALA').asString;
    end;
    
    fraTelefono.FillCombo(True, FieldByName('ES_ID').AsInteger);
    edES_CODAREAFAX.Text            := FieldByName('ES_CODAREAFAX').asString;
    edES_FAX.Text                   := FieldByName('ES_FAX').asString;
    edES_DOMICILIO.Text             := FieldByName('ES_DOMICILIO').asString;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmDlgBusEstablecimiento.Validar: Boolean;
begin
  Verificar(edES_NOMBRE.Text = '', edES_NOMBRE, 'El nombre del establecimiento es obligatorio.');
  Verificar(fraES_ACTIVIDAD.IsEmpty, fraES_ACTIVIDAD, 'El código de actividad es obligatorio.');
{
  Verificar(edES_EMPLEADOS.Value <= 0, edES_EMPLEADOS, 'La cantidad de empleados debe ser mayor a cero.');
  Verificar(edES_MASA.Value <= 0, edES_MASA, 'La masa salarial debe ser mayor a cero.');
}
  // Grupo Domicilio
  fraDomicilio.ValidarCalle('El nombre de la calle es obligatorio.');
  fraDomicilio.ValidarCodigoPostal('El código postal es obligatorio.');
  fraDomicilio.ValidarLocalidad('La localidad es obligatoria.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.rbClick(Sender: TObject);
begin
{
  if edBusqueda.CanFocus then
    edBusqueda.SetFocus;
}    
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.edBusquedaChange(Sender: TObject);
begin
  if rb1.Checked then
    AField1 := 'ES_NOMBRE';
  if rb2.Checked then
    AField1 := 'ES_LOCALIDAD';
  if rb3.Checked then
    AField1 := 'ES_CALLE';
  if rb4.Checked then
    AField1 := 'ES_CPOSTAL';
  try
    if sdqConsulta.Active and Assigned(sdqConsulta.FindField(AField1)) then
    begin
      Split(edBusqueda.Text, '%', APalabras);
      sdqConsulta.Locate(AField1, APalabras[0], [loPartialKey, loCaseInsensitive]);
    end;
  except
    sdqConsulta.MoveBy(1);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.tbNuevoClick(Sender: TObject);
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.edContrato, 'Debe seleccionar una empresa para poder dar de alta un establecimiento.');
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un establecimiento para poder modificarlo.');
  fraEmpresa.OnChange := nil;
  if fraEmpresa.Contrato <> sdqConsulta.FieldByName('ES_CONTRATO').AsInteger then
    fraEmpresa.Contrato := sdqConsulta.FieldByName('ES_CONTRATO').AsInteger;
  fraEmpresa.OnChange := OnFiltroChange;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.sdqConsultaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  i: byte;
begin
  inherited;
  if edBusqueda.Text = '' then
    Accept := True
  else if DataSet.Active and Assigned(DataSet.FindField(AField1)) then
  begin
    APalabras.Clear;
    Split(edBusqueda.Text, '%', APalabras);

    if APalabras.Count > 0 then
      for i := 0 to APalabras.Count - 1 do
      begin
        Accept := Accept and (Pos(APalabras[i], DataSet.FieldByName(AField1).AsString) > 0);
      end;
  end;

  if DataSet.Active and Assigned(DataSet.FindField(AField2)) then
  begin
    APalabras.Clear;
    Split(edBusqueda2.Text, '%', APalabras);

    if APalabras.Count > 0 then
      for i := 0 to APalabras.Count - 1 do
      begin
        Accept := Accept and (Pos(APalabras[i], DataSet.FieldByName(AField2).AsString) > 0);
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('ES_USUBAJA').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.tbImprimirClick(Sender: TObject);
begin
  try
    if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and PrintDialog.Execute then
    begin
      QueryPrint.SubTitle.Lines.Add('Contrato: ' + sdqConsulta.FieldByName('ES_CONTRATO').AsString);
      QueryPrint.SetGridColumns(Grid, True, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := 'Establecimientos';
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.OnfraEstablecimientoChange(Sender: TObject);
begin
  btnAceptar.Enabled := fraEstablecimiento.IsSelected;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.ReactivarEstablecimiento;
var
  sSqlTrans: TSQL;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.Eof, nil, 'Debe elegir el establecimiento que desea reactivar.');
  Verificar(sdqConsulta.FieldByName('ES_USUBAJA').IsNull, nil, 'El establecimiento debe estar dado de baja para poder ser reactivado.');

  sSqlTrans := TSQL.Create('AES_ESTABLECIMIENTO');
  try
    sSqlTrans.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsInteger, False);
    sSqlTrans.Fields.Add('ES_USUMODIF', Sesion.UserId);
    sSqlTrans.Fields.Add('ES_FECHAMODIF', SQL_ACTUALDATE, False);
    sSqlTrans.Fields.Add('ES_USUBAJA', 'NULL', False);
    sSqlTrans.Fields.Add('ES_FECHABAJA', 'NULL', False);
    sSqlTrans.SqlType := stUpdate;
    try
      EjecutarSQL(sSqlTrans.Sql);
      tbRefrescarClick(nil);
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos');
      end;
    end;
  finally
    sSqlTrans.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.Reactivacion(Sender: TObject);
begin
  inherited;
  ReactivarEstablecimiento;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  APalabras.Free;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.edBusqueda2Change(Sender: TObject);
begin
  if rb5.Checked then
    AField2 := 'ES_NOMBRE';
  if rb6.Checked then
    AField2 := 'ES_LOCALIDAD';
  if rb7.Checked then
    AField2 := 'ES_CALLE';
  if rb8.Checked then
    AField2 := 'ES_CPOSTAL';
  try
    if sdqConsulta.Active and Assigned(sdqConsulta.FindField(AField2)) then
    begin
      Split(edBusqueda2.Text, '%', APalabras);
      sdqConsulta.Locate(AField2, APalabras[0], [loPartialKey, loCaseInsensitive]);
    end;
  except
    sdqConsulta.MoveBy(1);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDlgBusEstablecimiento.rb2Click(Sender: TObject);
begin
  inherited;
{
  if edBusqueda2.CanFocus then
    edBusqueda2.SetFocus;
}    
end;
{------------------------------------------------------------------------------}
end.
