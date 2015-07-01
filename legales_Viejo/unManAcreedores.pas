unit unManAcreedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, CUIT,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraNormaLegal, Mask, Strfuncs,
  ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion, General,
  unfraCodigoDescripcionExt, PatternEdit, IntEdit, AnsiSql, unfraCtbTablas,
  unFraDomicilio, unArtDBAwareFrame;

type
  TfrmManAcreedores = class(TfrmCustomGridABM)
    lblFechaImpr: TLabel;
    edFechaImpr: TDateComboBox;
    fraFormaCobro: TfraCtbTablas;
    fraRetGanancias: TfraCtbTablas;
    fraRetIB: TfraCtbTablas;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    procedure fpAbmShow(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnCuentasBancariasClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
  	procedure RefreshData; override;
  end;

var
  frmManAcreedores: TfrmManAcreedores;

implementation

uses
  unPrincipal, SqlFuncs, unDmPrincipal, CustomDlgs, unManCCP_CUENTAPAGO, unArt,
  VCLExtra;

{$R *.dfm}

procedure TfrmManAcreedores.FormCreate(Sender: TObject);
begin
  inherited;

  fraFormaCobro.Clave  := 'COBRO';
  fraRetGanancias.Clave:= 'RETGA';
  fraRetIB.Clave       := 'RETIB';

  FieldBaja     := 'PA_FECHABAJA';
  Sql.TableName := 'art.spa_pagoacre';
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
    fraFormaCobro.Value   := FieldByName('pa_formacobro').AsString;
    fraRetGanancias.Value := FieldByName('pa_retganancias').AsString;
    fraRetIB.Value        := FieldByName('pa_retingresosbrutos').AsString;
    edCuitCuil.Text       := FieldByName('pa_cuitcuil').AsString;
    edDescripcion.Text    := FieldByName('pa_denomina').AsString;
    edFechaImpr.Date      := FieldByName('pa_fechaimpresionforminscr').AsDateTime;
    edDomicilio.Text      := FieldByName('PA_DOMICILIO').AsString;
    
    with fraDomicilio do
    begin
      Calle        := FieldByName('PA_CALLE').AsString;
      Numero       := FieldByName('PA_NUMERO').AsString;
      Piso         := FieldByName('PA_PISO').AsString;
      Departamento := FieldByName('PA_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('PA_CPOSTAL').AsString;
      CPA          := FieldByName('PA_CODPOSTALA').AsString;
      Localidad    := FieldByName('PA_LOCALIDAD').AsString;
      Provincia    := FieldByName('PROVINCIA').AsString;
      if FieldByName('PA_PROVINCIA').IsNull then
        Prov := -1
      else
        Prov := FieldByName('PA_PROVINCIA').AsInteger;
    end;

    edCodArea.Text            := FieldByName('PA_TELCOD').AsString;
    edTelefono.Text           := FieldByName('PA_TELNUM').AsString;
    rgbTipoAcreedor.ItemIndex := iif(FieldByName('pa_acreedor').AsString = 'PA', 0, 1);
    chbConcertado.Checked     := FieldByName('pa_concertado').AsString = 'S';
    chbCajaMedicos.Checked    := FieldByName('pa_retencajamed').AsString = 'S';
  end;

  inherited;
end;

function TfrmManAcreedores.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('pa_cuitcuil', sdqConsulta.FieldByName('pa_cuitcuil').AsString);

    Sql.Fields.Add('pa_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else begin
    Sql.PrimaryKey.Add('pa_cuitcuil', edCuitCuil.Text);

    Sql.Fields.Add('pa_formacobro', fraFormaCobro.Value);
    Sql.Fields.Add('pa_retganancias', fraRetGanancias.Value);
    Sql.Fields.Add('pa_retingresosbrutos', fraRetIB.Value);
    Sql.Fields.Add('pa_denomina', edDescripcion.Text);
    Sql.Fields.Add('pa_fechaimpresionforminscr', edFechaImpr.Date);
    Sql.Fields.Add('pa_acreedor', String(iif(rgbTipoAcreedor.ItemIndex = 0, 'PA', 'OA')));
    Sql.Fields.Add('pa_concertado', String(iif(chbConcertado.Checked, 'S', 'N')));
    Sql.Fields.Add('pa_retencajamed', String(iif(chbCajaMedicos.Checked, 'S', 'N')));
    Sql.Fields.Add('pa_localidad', fraDomicilio.Localidad);
    Sql.Fields.Add('pa_provincia', fraDomicilio.Prov);
    Sql.Fields.Add('pa_calle', fraDomicilio.Calle);
    Sql.Fields.Add('pa_numero', fraDomicilio.Numero);
    Sql.Fields.Add('pa_piso', fraDomicilio.Piso);
    Sql.Fields.Add('pa_departamento', fraDomicilio.Departamento);
    Sql.Fields.Add('pa_cpostal', fraDomicilio.CodigoPostal);
    Sql.Fields.Add('pa_codpostala', fraDomicilio.CPA);
    Sql.Fields.Add('pa_domicilio', exNull);
    Sql.Fields.Add('pa_telcod', edCodArea.Text);
    Sql.Fields.Add('pa_telnum', edTelefono.Text);

    if ModoABM = maAlta Then
      Sql.Fields.Add('pa_fechaalta', exDateTime)
    else
      Sql.Fields.Add('pa_fechabaja', exNull);
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
  edCuitCuil.Clear;
  edDescripcion.Clear;
  edFechaImpr.Clear;
  rgbTipoAcreedor.ItemIndex := 0;
  chbConcertado.Checked     := False;
  chbCajaMedicos.Checked    := False;
end;

function TfrmManAcreedores.Validar: Boolean;
begin
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
                 'PA_DEPARTAMENTO, PA_CPOSTAL, ' +
                 'UTILES.ARMAR_DOMICILIO(PA_CALLE, PA_NUMERO, PA_PISO, PA_DEPARTAMENTO, PA_LOCALIDAD) DOMICILIO ' +
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
            'AND PA_ACREEDOR IN (''OA'', ''PA'') ';

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
  tbRefrescarClick(Sender);
end;

procedure TfrmManAcreedores.btnCuentasBancariasClick(Sender: TObject);
begin
  if not sdqConsulta.Eof and edCuitCuil.ReadOnly then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle := fsNormal;
      Execute(iif(rgbTipoAcreedor.ItemIndex = 0, 'PA', 'OA'), ART_EMPTY_ID, edCuitCuil.Text);
    end
  else
    MsgBox('No ha seleccionado ningún acreedor.');
end;

end.

