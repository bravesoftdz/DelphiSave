unit unManAcreedoresLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, unFraDomicilio,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unfraCtbTablas,
  PatternEdit, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unfraCodigoDescripcionExt, ToolEdit, DateComboBox, General, CUIT, IntEdit,
  Menus;

type

  TfrmManAcreedoresLegales = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCUITFiltro: TMaskEdit;
    Label2: TLabel;
    edDescripcionFiltro: TEdit;
    chbExclBajas: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    lblCuitCuil: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    fraFormaCobro: TfraCtbTablas;
    rgbTipoAcreedor: TRadioGroup;
    chbConcertado: TCheckBox;
    edDescripcion: TEdit;
    edCuitCuil: TMaskEdit;
    edTelefono: TEdit;
    edCodArea: TEdit;
    edDomicilio: TEdit;
    fraDomicilioGral: TfraDomicilio;
    lblFechaImpr: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label10: TLabel;
    Label9: TLabel;
    edFechaImpr: TDateComboBox;
    fraRetGanancias: TfraCtbTablas;
    fraRetIB: TfraCodigoDescripcionExt;
    chbCajaMedicos: TCheckBox;
    fraSituacionIVA: TfraStaticCTB_TABLAS;
    edFechaRevision: TDateComboBox;
    btnCuentasBancarias: TButton;
    edFax: TPatternEdit;
    Bevel4: TBevel;
    lbFAX: TLabel;
    edEmail: TEdit;
    lblEmailJuzgado: TLabel;
    fraTipoPrestador: TfraCodigoDescripcion;
    Label11: TLabel;
    edObservaciones: TMemo;
    Label12: TLabel;
    fraDomicilioPrestacion: TfraDomicilio;
    Label13: TLabel;
    ToolBar1: TToolBar;
    tbCopiar: TToolButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edObservacionesEconomico: TMemo;
    edVtoExclusionGcias: TDateComboBox;
    edVtoExclusionIIBB: TDateComboBox;
    edNroIIBB: TMaskEdit;
    edActSegunRentas: TIntEdit;
    ShortCutControl1: TShortCutControl;
    pmnuIngBrutos: TPopupMenu;
    mnuNroIngBrutos: TMenuItem;
    mnuCUIT: TMenuItem;
    ToolBarIngresosBrutos: TToolBar;
    tbIngresoBrutos: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure fraSituacionIVAChange(Sender: TObject);
    procedure fraDomicilioGralChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fpAbmShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnCuentasBancariasClick(Sender: TObject);
    procedure tbCopiarClick(Sender: TObject);
    procedure tbIngresoBrutosClick(Sender: TObject);
    procedure mnuNroIngBrutosClick(Sender: TObject);
  private
    { Private declarations }
    function ExisteAcreedor: boolean;
    procedure SetTipoIngBrutos(IsIngBrutos: Boolean);
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
  	procedure RefreshData; override;
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
  end;

var
  frmManAcreedoresLegales: TfrmManAcreedoresLegales;

implementation

uses
  unPrincipal, SqlFuncs, unDmPrincipal, CustomDlgs, unManCCP_CUENTAPAGO, unArt,
  VCLExtra, AnsiSQL, StrFuncs, unSesion, Internet;
{$R *.dfm}

procedure TfrmManAcreedoresLegales.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := false;
  fraFormaCobro.Clave  := 'COBRO';
  fraRetGanancias.Clave:= 'RETGA';
  fraRetGanancias.ExtraCondition := ' AND tb_codigo IN(''07'', ''09'', ''17'', ''99'')';

//  fraRetIB.Clave       := 'RETIB';
  fraRetIB.TableName := 'ART.CIB_INGRESOSBRUTOS';
  fraRetIB.FieldID := 'IB_CODIGO';
  fraRetIB.FieldCodigo := 'IB_CODIGO';
  fraRetIB.FieldDesc := 'IB_RETENCION';
  fraRetIB.ExtraCondition := ' and 1=2';

  with fraSituacionIVA do
    begin
      Clave    := 'SIVA';
      OnChange := fraSituacionIVAChange;
    end;

  with fraTipoPrestador do
  begin
    TableName   := 'LEGALES.LTP_TIPOPRESTADOR';
    FieldID     := 'tp_id';
    FieldCodigo := 'tp_id';
    FieldDesc   := 'tp_descripcion';
    FieldBaja   := 'tp_fechabaja';
    Showbajas   := True;
  end;

  FieldBaja     := 'PA_FECHABAJA';
  Sql.TableName := 'art.spa_pagoacre';

  fraDomicilioGral.OnChange := fraDomicilioGralChange;
end;

procedure TfrmManAcreedoresLegales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmManAcreedoresLegales.LoadControls;
begin
  PageControl1.ActivePageIndex := 0;

  with sdqConsulta do
  begin
    fraFormaCobro.Value   := FieldByName('PA_FORMACOBRO').AsString;
    fraRetGanancias.Value := FieldByName('PA_RETGANANCIAS').AsString;
    fraSituacionIVA.Value := FieldByName('PA_IVA').AsString;
    edCuitCuil.Text       := FieldByName('PA_CUITCUIL').AsString;
    edDescripcion.Text    := FieldByName('PA_DENOMINA').AsString;
    edFechaImpr.Date      := FieldByName('PA_FECHAIMPRESIONFORMINSCR').AsDateTime;
    edFechaRevision.Date  := FieldByName('PA_FECHAREVISION').AsDateTime;
    edDomicilio.Text      := FieldByName('PA_DOMICILIO').AsString;

    fraDomicilioGral.Cargar(FieldByName('PA_CALLE').AsString,FieldByName('PA_CPOSTAL').AsString,
                        FieldByName('PA_LOCALIDAD').AsString, FieldByName('PA_NUMERO').AsString,
                        FieldByName('PA_PISO').AsString,FieldByName('PA_DEPARTAMENTO').AsString,
                        FieldByName('PA_PROVINCIA').AsString,FieldByName('PA_CODPOSTALA').AsString);

    fraDomicilioGralChange(nil);
    fraRetIB.Codigo        := FieldByName('PA_RETINGRESOSBRUTOS').AsString;

    edCodArea.Text            := FieldByName('PA_TELCOD').AsString;
    edTelefono.Text           := FieldByName('PA_TELNUM').AsString;
    rgbTipoAcreedor.ItemIndex := iif(FieldByName('PA_ACREEDOR').AsString = 'PA', 0, 1);
    chbConcertado.Checked     := FieldByName('PA_CONCERTADO').AsString = 'S';
    chbCajaMedicos.Checked    := FieldByName('PA_RETENCAJAMED').AsString = 'S';

    edFax.Text                := FieldByName('PA_FAX').AsString;
    edEmail.Text              := FieldByName('PA_EMAIL').AsString;
    fraTipoPrestador.Codigo   := FieldByName('PA_IDTIPOPRESTADOR').AsString;
    edObservaciones.Text      := FieldByName('PA_OBSERVACION').AsString;

    fraDomicilioPrestacion.Cargar(FieldByName('PA_CALLEPRESTACION').AsString,FieldByName('PA_CPOSTALPRESTACION').AsString,
                        FieldByName('PA_LOCALIDADPRESTACION').AsString, FieldByName('PA_NUMEROPRESTACION').AsString,
                        FieldByName('PA_PISOPRESTACION').AsString,FieldByName('PA_DEPARTAMENTOPRESTACION').AsString,
                        FieldByName('PA_PROVINCIAPRESTACION').AsString,FieldByName('PA_CPAPRESTACION').AsString);

    edVtoExclusionGcias.Date      := FieldByName('PA_VTOEXCLUSIONGCIAS').AsDateTime;
    edVtoExclusionIIBB.Date       := FieldByName('PA_VTOEXCLUSIONIIBB').AsDateTime;
    if FieldByName('PA_ISNROIIBB').AsString = 'S' then
    begin
      SetTipoIngBrutos(True);
      edNroIIBB.Text                := FieldByName('PA_NROIIBB').AsString;
    end
    else if FieldByName('PA_ISNROIIBB').AsString = 'N' then
      SetTipoIngBrutos(False)
    else
      edNroIIBB.Clear;

    edActSegunRentas.Text         := FieldByName('PA_ACTSEGUNRENTAS').AsString;
    edObservacionesEconomico.Text := FieldByName('PA_OBSERVACIONESECONOMICOS').AsString;
  end;
  inherited;
end;

function TfrmManAcreedoresLegales.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('PA_CUITCUIL', sdqConsulta.FieldByName('pa_cuitcuil').AsString);

    Sql.Fields.Add('PA_FECHABAJA', exDateTime);
    Sql.Fields.Add('PA_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else begin
    Sql.PrimaryKey.Add('PA_CUITCUIL', edCuitCuil.Text);

    Sql.Fields.Add('PA_FORMACOBRO', fraFormaCobro.Value);
    Sql.Fields.Add('PA_RETGANANCIAS', fraRetGanancias.Value);
    Sql.Fields.Add('PA_RETINGRESOSBRUTOS', fraRetIB.Value);
    Sql.Fields.Add('PA_IVA', fraSituacionIVA.Value);
    Sql.Fields.Add('PA_DENOMINA', edDescripcion.Text);
    Sql.Fields.Add('PA_FECHAIMPRESIONFORMINSCR', edFechaImpr.Date);
    Sql.Fields.Add('PA_FECHAREVISION', edFechaRevision.Date);
    Sql.Fields.Add('PA_ACREEDOR', String(iif(rgbTipoAcreedor.ItemIndex = 0, 'PA', 'OA')));
    Sql.Fields.Add('PA_CONCERTADO', String(iif(chbConcertado.Checked, 'S', 'N')));
    Sql.Fields.Add('PA_RETENCAJAMED', String(iif(chbCajaMedicos.Checked, 'S', 'N')));
    Sql.Fields.Add('PA_LOCALIDAD', fraDomicilioGral.Localidad);
    Sql.Fields.Add('PA_PROVINCIA', fraDomicilioGral.Prov);
    Sql.Fields.Add('PA_CALLE', fraDomicilioGral.Calle);
    Sql.Fields.Add('PA_NUMERO', fraDomicilioGral.Numero);
    Sql.Fields.Add('PA_PISO', fraDomicilioGral.Piso);
    Sql.Fields.Add('PA_DEPARTAMENTO', fraDomicilioGral.Departamento);
    Sql.Fields.Add('PA_CPOSTAL', fraDomicilioGral.CodigoPostal);
    Sql.Fields.Add('PA_CODPOSTALA', fraDomicilioGral.CPA);
    Sql.Fields.Add('PA_DOMICILIO', exNull);
    Sql.Fields.Add('PA_TELCOD', edCodArea.Text);
    Sql.Fields.Add('PA_TELNUM', edTelefono.Text);

    Sql.Fields.Add('PA_FAX', edFax.Text);
    Sql.Fields.Add('PA_EMAIL', edEmail.Text);
    Sql.Fields.Add('PA_IDTIPOPRESTADOR', fraTipoPrestador.ID);
    Sql.Fields.Add('PA_OBSERVACION', edObservaciones.Text);

    Sql.Fields.Add('PA_CALLEPRESTACION', fraDomicilioPrestacion.Calle);
    Sql.Fields.Add('PA_NUMEROPRESTACION', fraDomicilioPrestacion.Numero);
    Sql.Fields.Add('PA_PISOPRESTACION', fraDomicilioPrestacion.Piso);
    Sql.Fields.Add('PA_DEPARTAMENTOPRESTACION', fraDomicilioPrestacion.Departamento);
    Sql.Fields.Add('PA_CPOSTALPRESTACION', fraDomicilioPrestacion.CodigoPostal);
    Sql.Fields.Add('PA_CPAPRESTACION', fraDomicilioPrestacion.CPA);
    Sql.Fields.Add('PA_LOCALIDADPRESTACION', fraDomicilioPrestacion.Localidad);
    Sql.Fields.Add('PA_PROVINCIAPRESTACION', fraDomicilioPrestacion.Prov);

    Sql.Fields.Add('PA_VTOEXCLUSIONGCIAS', edVtoExclusionGcias.Date);
    Sql.Fields.Add('PA_VTOEXCLUSIONIIBB', edVtoExclusionIIBB.Date);

    Sql.Fields.Add('PA_ACTSEGUNRENTAS', edActSegunRentas.Text);
    Sql.Fields.Add('PA_OBSERVACIONESECONOMICOS', edObservacionesEconomico.Text);

    if tbIngresoBrutos.Tag = 0 then
    begin
      Sql.Fields.Add('PA_ISNROIIBB', 'S');
      Sql.Fields.Add('PA_NROIIBB', edNroIIBB.Text);
    end
    else
    begin
      Sql.Fields.Add('PA_ISNROIIBB', 'N');
      Sql.Fields.Add('PA_NROIIBB', exNull);
    end;


    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('PA_FECHAALTA', exDateTime);
      Sql.Fields.Add('PA_USUALTA', Sesion.UserID);
      Sql.Fields.Add('PA_MODULO', 'L');
    end
    else
    begin
      Sql.Fields.Add('PA_FECHAMODIF', exDateTime);
      Sql.Fields.Add('PA_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('PA_FECHABAJA', exNull);
      Sql.Fields.Add('PA_USUBAJA', exNull);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManAcreedoresLegales.ClearControls;
begin
  PageControl1.ActivePageIndex := 0;
  edCodArea.Clear;
  edTelefono.Clear;
  edDomicilio.Clear;
  fraDomicilioGral.Clear;
  fraFormaCobro.Limpiar;
  fraRetGanancias.Limpiar;
  fraRetIB.Limpiar;
  fraSituacionIVA.Clear;
  edCuitCuil.Clear;
  edDescripcion.Clear;
  edFechaImpr.Clear;
  edFechaRevision.Clear;
  edFax.Clear;
  edEmail.Clear;
  fraTipoPrestador.Clear;
  edObservaciones.Clear;
  fraDomicilioPrestacion.Clear;
  edVtoExclusionGcias.Clear;
  edVtoExclusionIIBB.Clear;
  edNroIIBB.Clear;
  edActSegunRentas.Clear;
  edObservacionesEconomico.Clear;
  SetTipoIngBrutos(True);
  rgbTipoAcreedor.ItemIndex := 0;
  chbConcertado.Checked     := False;
  chbCajaMedicos.Checked    := False;
  fraRetIB.ExtraCondition := ' and 1=2';
end;

function TfrmManAcreedoresLegales.Validar: Boolean;
begin
  Verificar(ExisteAcreedor, edCuitCuil, 'Este acreedor ya fue cargado por otro sector.');
  if edEmail.Text <> '' then
    Verificar(not IsEMail(edEmail.Text),edEmail, 'Error en formato de E-Mail');
  VerificarMultiple(['Grabar Acreedor',
                     edCuitCuil, (IsCUIT(edCuitCuil.Text) or IsCUIL(edCuitCuil.Text)), 'Debe ingresar un CUIT/CUIL válido',
                     edCuitCuil, (ModoABM <> maAlta) or ((ModoABM = maAlta) and
                                                         (not ExisteSQL ('SELECT 1 FROM art.spa_pagoacre WHERE PA_CUITCUIL = ' + SQLValue(edCuitCuil.Text)))
                                                        ), 'El CUIT/CUIL ya existe',
                     edDescripcion, not IsEmptyString(edDescripcion.text), 'Debe especificar un Nombre para el Acreedor',
                     fraFormaCobro, fraFormaCobro.IsSelected, 'Debe especificar la Forma de Cobro',
                     fraRetGanancias, fraRetGanancias.IsSelected, 'Debe especificar la Retención de Ganancias',
                     fraRetIB, fraRetIB.IsSelected, 'Debe especificar la Retención de Ingresos Brutos'
                    ]);
  Verificar(not edFechaRevision.IsEmpty and (edFechaRevision.Date > DBDate()), edFechaRevision, 'La Fecha de Revisión no puede ser posterior a la fecha actual');

  Result := fraDomicilioGral.IsValid and fraDomicilioGral.ValidarPermisoCalle;
end;

procedure TfrmManAcreedoresLegales.fpAbmShow(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControl(edCuitCuil, ModoABM <> maAlta);
end;

procedure TfrmManAcreedoresLegales.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT PA_CUITCUIL, PA_ACREEDOR, PA_DENOMINA, PA_CONCERTADO, ' +
                 'PA_FORMACOBRO, PA_FECHAALTA, PA_DOMICILIO, PA_TELCOD, PA_TELNUM, ' +
                 'PA_LOCALIDAD, PA_CODPOSTAL, PA_PROVINCIA, PA_PAIS, PA_ORIGEN, ' +
                 'PA_RETGANANCIAS, PA_RETINGRESOSBRUTOS, PA_CODPOSTALA, PA_TELPREFIJO, ' +
                 'PA_RETENCAJAMED, TRUNC(PA_FECHABAJA) PA_FECHABAJA, PA_FECHAIMPRESIONFORMINSCR, ' +
                 'TACRE.TB_DESCRIPCION TIPOACRE, FCOBRO.TB_DESCRIPCION FORMACOBRO, ' +
                 'RETGA.TB_DESCRIPCION RETGANANCIAS, RETIB.TB_DESCRIPCION RETIB, ' +
                 'PV_DESCRIPCION PROVINCIA, PA_CALLE, PA_NUMERO, PA_PISO, ' +
                 'PA_DEPARTAMENTO, PA_CPOSTAL, PA_ID, PA_IVA, PA_FECHAREVISION, ' +
                 'UTILES.ARMAR_DOMICILIO(PA_CALLE, PA_NUMERO, PA_PISO, PA_DEPARTAMENTO, PA_LOCALIDAD) DOMICILIO, ' +
                 'PA_MODULO,PA_FAX, PA_EMAIL, PA_IDTIPOPRESTADOR, PA_OBSERVACION, '+
                 'PA_CALLEPRESTACION, PA_NUMEROPRESTACION, PA_PISOPRESTACION, '+
                 'PA_DEPARTAMENTOPRESTACION, PA_CPOSTALPRESTACION, '+
                 'PA_CPAPRESTACION, PA_LOCALIDADPRESTACION, '+
                 'PA_PROVINCIAPRESTACION, PA_USUALTA, PA_USUBAJA, '+
                 'PA_FECHAMODIF, PA_USUMODIF, PA_VTOEXCLUSIONGCIAS, '+
                 'PA_VTOEXCLUSIONIIBB, PA_NROIIBB, PA_ACTSEGUNRENTAS, '+
                 'PA_OBSERVACIONESECONOMICOS, PA_ISNROIIBB ' +
           'FROM SPA_PAGOACRE, CTB_TABLAS TACRE, CTB_TABLAS FCOBRO, ' +
                'CTB_TABLAS RETGA, CTB_TABLAS RETIB, CPV_PROVINCIAS ' +
          'WHERE PA_ACREEDOR = TACRE.TB_CODIGO ' +
            'AND TACRE.TB_CLAVE = ''TACRE'' ' +
            'AND PA_FORMACOBRO = FCOBRO.TB_CODIGO ' +
            'AND FCOBRO.TB_CLAVE = ''COBRO'' ' +
            'AND PA_RETGANANCIAS = RETGA.TB_CODIGO(+) ' +
            'AND RETGA.TB_CLAVE(+) = ''RETGA'' ' +
            'AND PA_RETINGRESOSBRUTOS = RETIB.TB_CODIGO(+) ' +
            'AND RETIB.TB_CLAVE(+) = ''RETIB'' ' +
            'AND PA_PROVINCIA = PV_CODIGO(+) ' +
            'AND PA_ACREEDOR IN (''OA'', ''PA'') ' +
            'AND PA_MODULO = ''L''';

  sWhere := '';
  if Trim (edCUITFiltro.Text) <> '' then
    sWhere := sWhere + ' AND pa_cuitcuil = ' + SqlValue (edCUITFiltro.Text);

  if Trim (edDescripcionFiltro.Text) <> '' then
    sWhere := sWhere + ' AND pa_denomina like '+ SqlValue('%' + edDescripcionFiltro.Text + '%');

  if chbExclBajas.Checked then
    sWhere := sWhere + ' AND pa_fechabaja IS NULL ';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManAcreedoresLegales.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edCUITFiltro.Clear;
  edDescripcionFiltro.Clear;
  chbExclBajas.Checked := True;
  
  tbRefrescarClick(Sender);
end;

procedure TfrmManAcreedoresLegales.btnCuentasBancariasClick(Sender: TObject);
var
  bSoloOtrosBancos: Boolean;
begin
  if not sdqConsulta.Eof and edCuitCuil.ReadOnly then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle        := fsNormal;
      bSoloOtrosBancos := True;

      Execute(iif(rgbTipoAcreedor.ItemIndex = 0, 'PA', 'OA'), Self.sdqConsulta.FieldByName('PA_ID').AsInteger, edCuitCuil.Text, bSoloOtrosBancos);
    end
  else
    MsgBox('No ha seleccionado ningún acreedor.');
end;


procedure TfrmManAcreedoresLegales.fraSituacionIVAChange(Sender: TObject);
begin
  if fraSituacionIVA.Codigo = '4' then         // Monotributista
    begin
      fraRetGanancias.Value := '99';           // No Retiene
      LockControl(fraRetGanancias, True);
    end
  else if fraSituacionIVA.Codigo = '5' then    // R.Inscripto Factura M
    begin
      fraRetGanancias.Value := '17';           // Factura M
      LockControl(fraRetGanancias, True);
    end
  else
    LockControl(fraRetGanancias,False);
end;

procedure TfrmManAcreedoresLegales.fraDomicilioGralChange(Sender: TObject);
begin
  fraRetIB.ExtraCondition := ' and ib_provincia = ' + SqlValue(fraDomicilioGral.Prov);
end;

function TfrmManAcreedoresLegales.ExisteAcreedor: boolean;
begin
  Result := ExisteSqlEx('SELECT 1 FROM ART.SPA_PAGOACRE WHERE PA_CUITCUIL = :CUIT AND PA_MODULO <> ''L'' ', [edCuitCuil.Text]);
end;

procedure TfrmManAcreedoresLegales.tbCopiarClick(Sender: TObject);
begin
  inherited;
  fraDomicilioPrestacion.Cargar(fraDomicilioGral.Calle,fraDomicilioGral.CodigoPostal,fraDomicilioGral.Localidad,
                                fraDomicilioGral.Numero,fraDomicilioGral.Piso,fraDomicilioGral.Departamento,
                                IntToStr(fraDomicilioGral.Prov),fraDomicilioGral.CPA);
end;

procedure TfrmManAcreedoresLegales.tbIngresoBrutosClick(Sender: TObject);
begin
  SetTipoIngBrutos(tbIngresoBrutos.Tag <> 0);
end;

procedure TfrmManAcreedoresLegales.SetTipoIngBrutos(IsIngBrutos: Boolean);
begin
  if IsIngBrutos then
  begin
    tbIngresoBrutos.Tag      := 0;
    tbIngresoBrutos.Caption  := mnuNroIngBrutos.Caption;
    edNroIIBB.EditMask := '###-######-#;0;_';
    edNroIIBB.Text     := '';
  end
  else
  begin
    tbIngresoBrutos.Tag      := 1;
    tbIngresoBrutos.Caption  := mnuCUIT.Caption;
    edNroIIBB.EditMask := '##-########-#;0;_' ;
    edNroIIBB.Text     := edCuitCuil.Text
  end;
end;

procedure TfrmManAcreedoresLegales.mnuNroIngBrutosClick(Sender: TObject);
begin
  if Sender = mnuNroIngBrutos then
    SetTipoIngBrutos(True)
  else
    SetTipoIngBrutos(False);
end;

end.
