unit unManAcreedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, CUIT,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, Strfuncs,
  ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion, General,
  unfraCodigoDescripcionExt, PatternEdit, IntEdit, AnsiSql, unfraCtbTablas,
  unFraDomicilio, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS;

type
  tOrigen = (oLegales, oPrestDin);

  TfrmManAcreedores = class(TfrmCustomGridABM)
    lblFechaImpr: TLabel;
    edFechaImpr: TDateComboBox;
    fraFormaCobro: TfraCtbTablas;
    fraRetGanancias: TfraCtbTablas;
    fraRetIB: TfraCodigoDescripcionExt;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rgbTipoAcreedor: TRadioGroup;
    chbConcertado: TCheckBox;
    edDescripcion: TEdit;
    Label4: TLabel;
    chbCajaMedicos: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblCuitCuil: TLabel;
    edCuitCuil: TMaskEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label8: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    edCUITFiltro: TMaskEdit;
    Label11: TLabel;
    edDescripcionFiltro: TEdit;
    chbExclBajas: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    edTelefono: TEdit;
    edCodArea: TEdit;
    edDomicilio: TEdit;
    fraDomicilio: TfraDomicilio;
    btnCuentasBancarias: TButton;
    ShortCutControl1: TShortCutControl;
    Label27: TLabel;
    fraSituacionIVA: TfraStaticCTB_TABLAS;
    Label7: TLabel;
    edFechaRevision: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    procedure fpAbmShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnCuentasBancariasClick(Sender: TObject);
    procedure fraSituacionIVAChange(Sender: TObject);
    procedure fraDomicilioChange(Sender: TObject);
  private
    FOrigen: tOrigen;
    procedure SetOrigen(const Value: tOrigen);
    function EsLegales: Boolean;
    function GetModulo: String;
    function ExisteAcreedor(aModulo: String): boolean;
  public
    property  Origen: tOrigen        read FOrigen        write SetOrigen      Default oPrestDin;
  protected
    function DoABM: Boolean; override;
  	procedure RefreshData; override;
  end;

var
  frmManAcreedores: TfrmManAcreedores;

implementation

uses
  unPrincipal, SqlFuncs, unDmPrincipal, CustomDlgs, unManCCP_CUENTAPAGO, unArt,
  VCLExtra, unSesion;

{$R *.dfm}

procedure TfrmManAcreedores.FormCreate(Sender: TObject);
begin
  Origen := oPrestDin;
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

  FieldBaja     := 'PA_FECHABAJA';
  Sql.TableName := 'art.spa_pagoacre';

  fraDomicilio.OnChange := fraDomicilioChange;
end;

procedure TfrmManAcreedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmManAcreedores.LoadControls;
begin

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


    fraDomicilio.Cargar(FieldByName('PA_CALLE').AsString,FieldByName('PA_CPOSTAL').AsString,
                        FieldByName('PA_LOCALIDAD').AsString, FieldByName('PA_NUMERO').AsString,
                        FieldByName('PA_PISO').AsString,FieldByName('PA_DEPARTAMENTO').AsString,
                        FieldByName('PA_PROVINCIA').AsString,FieldByName('PA_CODPOSTALA').AsString);

    fraDomicilioChange(nil);
    fraRetIB.Codigo        := FieldByName('PA_RETINGRESOSBRUTOS').AsString;

    edCodArea.Text            := FieldByName('PA_TELCOD').AsString;
    edTelefono.Text           := FieldByName('PA_TELNUM').AsString;
    rgbTipoAcreedor.ItemIndex := iif(FieldByName('PA_ACREEDOR').AsString = 'PA', 0, 1);
    chbConcertado.Checked     := FieldByName('PA_CONCERTADO').AsString = 'S';
    chbCajaMedicos.Checked    := FieldByName('PA_RETENCAJAMED').AsString = 'S';
  end;

  inherited;
end;

function TfrmManAcreedores.DoABM: Boolean;
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
    Sql.Fields.Add('PA_LOCALIDAD', fraDomicilio.Localidad);
    Sql.Fields.Add('PA_PROVINCIA', fraDomicilio.Prov);
    Sql.Fields.Add('PA_CALLE', fraDomicilio.Calle);
    Sql.Fields.Add('PA_NUMERO', fraDomicilio.Numero);
    Sql.Fields.Add('PA_PISO', fraDomicilio.Piso);
    Sql.Fields.Add('PA_DEPARTAMENTO', fraDomicilio.Departamento);
    Sql.Fields.Add('PA_CPOSTAL', fraDomicilio.CodigoPostal);
    Sql.Fields.Add('PA_CODPOSTALA', fraDomicilio.CPA);
    Sql.Fields.Add('PA_DOMICILIO', exNull);
    Sql.Fields.Add('PA_TELCOD', edCodArea.Text);
    Sql.Fields.Add('PA_TELNUM', edTelefono.Text);

    if ModoABM = maAlta Then
    begin
      Sql.Fields.Add('PA_FECHAALTA', exDateTime);
      Sql.Fields.Add('PA_USUALTA', Sesion.UserID);
      Sql.Fields.Add('PA_MODULO', GetModulo);
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

procedure TfrmManAcreedores.ClearControls;
begin
  edCodArea.Clear;
  edTelefono.Clear;
  edDomicilio.Clear;
  fraDomicilio.Clear;
  fraFormaCobro.Limpiar;
  fraRetGanancias.Limpiar;
  fraRetIB.Limpiar;
  fraSituacionIVA.Clear;
  edCuitCuil.Clear;
  edDescripcion.Clear;
  edFechaImpr.Clear;
  edFechaRevision.Clear;
  rgbTipoAcreedor.ItemIndex := 0;
  chbConcertado.Checked     := False;
  chbCajaMedicos.Checked    := False;
  fraRetIB.ExtraCondition := ' and 1=2';   
end;

function TfrmManAcreedores.Validar: Boolean;
begin
  Verificar(ExisteAcreedor(GetModulo), edCuitCuil, 'Este acreedor ya fue cargado por otro sector.');
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

  Result := fraDomicilio.IsValid and fraDomicilio.ValidarPermisoCalle;
end;

procedure TfrmManAcreedores.fpAbmShow(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControl(edCuitCuil, ModoABM <> maAlta);
end;

procedure TfrmManAcreedores.RefreshData;
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
                 'PA_MODULO ' +
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
            'AND PA_MODULO = ' + SqlValue(GetModulo);

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

procedure TfrmManAcreedores.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edCUITFiltro.Clear;
  edDescripcionFiltro.Clear;
  chbExclBajas.Checked := True;
  
  tbRefrescarClick(Sender);
end;

procedure TfrmManAcreedores.btnCuentasBancariasClick(Sender: TObject);
var
  bSoloOtrosBancos: Boolean;
begin
  if not sdqConsulta.Eof and edCuitCuil.ReadOnly then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle        := fsNormal;
      bSoloOtrosBancos := EsLegales();

      Execute(iif(rgbTipoAcreedor.ItemIndex = 0, 'PA', 'OA'), Self.sdqConsulta.FieldByName('PA_ID').AsInteger, edCuitCuil.Text, bSoloOtrosBancos);
    end
  else
    MsgBox('No ha seleccionado ningún acreedor.');
end;

procedure TfrmManAcreedores.SetOrigen(const Value: tOrigen);
var
  bOcultar: Boolean;
begin
  if FOrigen <> Value then
    begin
      FOrigen  := Value;
      bOcultar := EsLegales();

      chbConcertado.Visible  := not bOcultar;
      chbCajaMedicos.Visible := not bOcultar;
    end;
end;

function TfrmManAcreedores.EsLegales: Boolean;
begin
  Result := (FOrigen = oLegales);
end;

procedure TfrmManAcreedores.fraSituacionIVAChange(Sender: TObject);
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

procedure TfrmManAcreedores.fraDomicilioChange(Sender: TObject);
begin
  fraRetIB.ExtraCondition := ' and ib_provincia = ' + SqlValue(fraDomicilio.Prov);
end;

function TfrmManAcreedores.GetModulo: String;
begin
  if FOrigen = oLegales then
    result := 'L'
  else begin
    if FOrigen = oPrestDin then
    result := 'S';
  end;
end;

function TfrmManAcreedores.ExisteAcreedor(aModulo: String): boolean;
begin
  Result := ExisteSqlEx('SELECT 1 FROM ART.SPA_PAGOACRE WHERE PA_CUITCUIL = :CUIT AND PA_MODULO <> :MODULO ', [edCuitCuil.Text, aModulo]);
end;

end.

