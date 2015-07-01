unit unManIIBBProvincias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraCtbTablas, Mask,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, ToolEdit, CurrEdit;

type
  TfrmIIBBProvincias = class(TfrmCustomGridABM)
    gbProvincias: TGroupBox;
    fraProvincias: TfraCodigoDescripcion;
    gbRetencion: TGroupBox;
    ieCodRet: TIntEdit;
    Label1: TLabel;
    edDescRet: TEdit;
    Label2: TLabel;
    gbTipoIIBB: TGroupBox;
    fraTipoIIBB: TfraCtbTablas;
    rgExigeNumero: TRadioGroup;
    edDescripcion: TEdit;
    edObservaciones: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    fraProvinciasJur: TfraCodigoDescripcion;
    GroupBox2: TGroupBox;
    edConceptoRet: TEdit;
    ShortCutControl1: TShortCutControl;
    GroupBox3: TGroupBox;
    fraProvinciaFiltro: TfraCodigoDescripcion;
    chkNoRetiene: TCheckBox;
    lblRetFija: TLabel;
    lblMNI: TLabel;
    lblAlicRet: TLabel;
    ceRetFija: TCurrencyEdit;
    ceMNI: TCurrencyEdit;
    ceAlicRet: TCurrencyEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure LoadControls; override;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    //function ComaXPunto(cadena: string): string;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraProvinciasedCodigoExit(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure chkNoRetieneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIIBBProvincias: TfrmIIBBProvincias;

implementation

uses
  unPrincipal, undmprincipal, sqlfuncs, customdlgs, unCustomConsulta, ansisql,
  unfraPrestador, General, VCLExtra;

{$R *.dfm}

procedure TfrmIIBBProvincias.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' SELECT p.pv_descripcion provincia, c.ib_codigo codigo, c.ib_retencion retencion, c.ib_tipoingbrutos tipo, ' +
                 ' c.ib_exigenumero exige_numero, c.ib_descripcion descripcion, c.ib_observaciones observaciones, ' +
                 ' r.ib_wh_zone_code || ''_'' || r.ib_wh_conc_code codigo_financials, c.ib_fechabaja fbaja, ' +
                 ' p.pv_codigo codprov, c.ib_retfija retfija, c.ib_mni mni, c.ib_alicuotaret aliret ' +
            ' FROM art.cpv_provincias p, art.cib_ingresosbrutos c, art.rib_retencioningbrutos r ' +
           ' WHERE c.ib_provincia = p.pv_codigo ' +
             ' AND c.ib_provincia = r.ib_provincia(+) ' +
             ' AND c.ib_codigo = r.ib_codigo(+) ';

  if not fraProvinciaFiltro.IsEmpty then
    ssql := ssql + ' AND p.pv_codigo = ' + sqlvalue(fraProvinciaFiltro.Codigo);

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
end;


procedure TfrmIIBBProvincias.LoadControls;
var ssql: string;
begin
  inherited;
  fraProvincias.Codigo := sdqConsulta.fieldbyname('codprov').AsString;
  ieCodRet.Text := sdqConsulta.fieldbyname('codigo').AsString;
  edDescRet.Text := sdqConsulta.fieldbyname('retencion').AsString;
  fraTipoIIBB.Codigo := sdqConsulta.fieldbyname('tipo').AsString;
  edDescripcion.Text := sdqConsulta.fieldbyname('descripcion').AsString;
  edObservaciones.Text := sdqConsulta.fieldbyname('observaciones').AsString;
  rgExigeNumero.ItemIndex := IIF(sdqConsulta.fieldbyname('exige_numero').AsString = 'S', 0, 1);
  ceRetFija.Text := sdqConsulta.fieldbyname('retfija').AsString;
  ceMNI.Text := sdqConsulta.fieldbyname('mni').AsString;
  ceAlicRet.Text := sdqConsulta.fieldbyname('aliret').AsString;

  ssql := ' select pv_codigo ' +
            ' from  art.rib_retencioningbrutos, art.cpv_provincias ' +
           ' where upper(IB_WH_ZONE_CODE) = pv_descripcion ' +
             ' and ib_provincia = :prov and ib_codigo = :cod ';

  fraProvinciasJur.Codigo := ValorSqlEx(ssql, [sdqConsulta.fieldbyname('codprov').AsString,
                                               sdqConsulta.fieldbyname('codigo').AsString]);
  if fraProvinciasJur.Codigo = '' then
  begin
    vclextra.LockControls(fraProvinciasJur);
    chkNoRetiene.Checked := true;
  end
  else
  begin
    vclextra.LockControls(fraProvinciasJur, false);
    chkNoRetiene.Checked := false;
  end;
  
  edConceptoRet.Text := ValorSqlEx(' select IB_WH_CONC_CODE from art.rib_retencioningbrutos '+
                                    ' where ib_provincia = :prov and ib_codigo = :cod ',
                                   [sdqConsulta.fieldbyname('codprov').AsString,
                                    sdqConsulta.fieldbyname('codigo').AsString]);
end;


procedure TfrmIIBBProvincias.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'art.cib_ingresosbrutos';
  FieldBaja := 'FBAJA';

  fraTipoIIBB.Clave := 'TINBR';
  with fraProvincias do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    FieldDesc   := 'pv_descripcion';
  end;

  with fraProvinciaFiltro do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    FieldDesc   := 'pv_descripcion';
  end;

  {fraProvinciasJur.Sql := ' select ''100'' as ID, ''100'' as codigo, ''No Retiene'' as descripcion from dual ' +
                          '  union ' +
                          ' select pv_codigo as ID, pv_codigo as codigo, pv_descripcion as descripcion ' +
                          '   from cpv_provincias ' +
                          '  where 1=1 ';}

  with fraProvinciasJur do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    FieldDesc   := 'pv_descripcion';
  end;


end;

procedure TfrmIIBBProvincias.ClearControls;
begin
  inherited;
  fraProvincias.Clear;
  edDescRet.Clear;
  ieCodRet.Clear;
  fraTipoIIBB.Clear;
  rgExigeNumero.ItemIndex := 0;
  edDescripcion.Clear;
  edObservaciones.Clear;
  fraProvinciasJur.Clear;
  edConceptoRet.Clear;
  chkNoRetiene.Checked := false;
  ceRetFija.Clear;
  ceMNI.Clear;
  ceAlicRet.Clear;
end;


function TfrmIIBBProvincias.DoABM: boolean;
var ssql, descripcion: string;
begin
  try
    BeginTrans(true);
    sql.Clear;
    case ModoABM of
      maAlta:
      begin
        Sql.Fields.Add('IB_PROVINCIA', fraProvincias.Codigo);
        Sql.Fields.Add('IB_CODIGO', ieCodRet.Text);
        Sql.Fields.Add('IB_RETENCION', edDescRet.Text);
        Sql.Fields.Add('IB_TIPOINGBRUTOS', fraTipoIIBB.Codigo);
        Sql.Fields.Add('IB_EXIGENUMERO', string(IIF(rgExigeNumero.ItemIndex = 0, 'S', 'N')));
        Sql.Fields.Add('IB_DESCRIPCION', edDescripcion.Text);
        Sql.Fields.Add('IB_OBSERVACIONES', edObservaciones.Text);
        Sql.Fields.Add('IB_RETFIJA', strtofloat(iif(ceRetFija.Text = '', 0, ceRetFija.Text)));
        Sql.Fields.Add('IB_MNI', strtofloat(iif(ceMNI.Text = '', 0, ceMNI.Text)));
        Sql.Fields.Add('IB_ALICUOTARET', strtofloat(iif(ceAlicRet.Text = '', 0, ceAlicRet.Text)));
        Sql.Fields.Add('IB_USUALTA', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('IB_FECHAALTA', exDateTime);
      end;
      maModificacion:
      begin
        Sql.PrimaryKey.Add('IB_PROVINCIA', sdqConsulta.FieldByName('codprov').AsString);
        Sql.PrimaryKey.Add('IB_CODIGO', sdqConsulta.FieldByName('codigo').AsString);
        Sql.Fields.Add('IB_RETENCION', edDescRet.Text);
        Sql.Fields.Add('IB_TIPOINGBRUTOS', fraTipoIIBB.Codigo);
        Sql.Fields.Add('IB_EXIGENUMERO', string(IIF(rgExigeNumero.ItemIndex = 0, 'S', 'N')));
        Sql.Fields.Add('IB_DESCRIPCION', edDescripcion.Text);
        Sql.Fields.Add('IB_OBSERVACIONES', edObservaciones.Text);
        Sql.Fields.Add('IB_RETFIJA', strtofloat(iif(ceRetFija.Text = '', 0, ceRetFija.Text)));
        Sql.Fields.Add('IB_MNI', strtofloat(iif(ceMNI.Text = '', 0, ceMNI.Text)));
        Sql.Fields.Add('IB_ALICUOTARET', strtofloat(iif(ceAlicRet.Text = '', 0, ceAlicRet.Text)));
        Sql.Fields.Add('IB_USUMODIF', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('IB_FECHAMODIF', exDateTime);
        Sql.Fields.Add('IB_USUBAJA', '');
        Sql.Fields.Add('IB_FECHABAJA', '');
      end;
      maBaja:
      begin
        Sql.PrimaryKey.Add('IB_PROVINCIA', sdqConsulta.FieldByName('codprov').AsString);
        Sql.PrimaryKey.Add('IB_CODIGO', sdqConsulta.FieldByName('codigo').AsString);
        Sql.Fields.Add('IB_USUBAJA', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('IB_FECHABAJA', exDateTime);
        Sql.SqlType := stUpdate;
      end;
    end;

    result := inherited DoABM;

    if result = true then
    begin

      if chkNoRetiene.Checked then
        descripcion := 'No Retiene'
      else
        descripcion := fraProvinciasJur.Descripcion;

      case ModoABM of
        maAlta:
        begin
          ssql := ' insert into art.rib_retencioningbrutos ' +
                  ' values (initcap(:1), :2, :3, :4) ';
          EjecutarSqlSTEx(ssql, [descripcion, edConceptoRet.Text, fraProvincias.Codigo, ieCodRet.Text]);
        end;
        maModificacion:
        begin
          ssql := ' update art.rib_retencioningbrutos ' +
                  '    set IB_WH_ZONE_CODE = initcap(:1), IB_WH_CONC_CODE = :2 ' +
                  '  where ib_provincia = :prov and ib_codigo = :cod ';
          EjecutarSqlSTEx(ssql, [descripcion, edConceptoRet.Text, fraProvincias.Codigo, ieCodRet.Text]);
        end;
        {maBaja:
        begin
          ssql := ' delete from art.rib_retencioningbrutos ' +
                  '  where ib_provincia = :prov and ib_codigo = :cod ';
          EjecutarSqlEx(ssql, [fraProvincias.Codigo, ieCodRet.Text]);
        end; }
      end;
    end;

    CommitTrans(true);
  except
    on E:Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al intentar guardar');
      result := false;
    end;
  end;
end;

function TfrmIIBBProvincias.Validar: boolean;
var ssql: string;
begin
  verificar(fraProvincias.IsEmpty, fraProvincias, 'Debe seleccionar una provincia');
  verificar(ieCodRet.Text = '', ieCodRet, 'Debe ingresar un código de retención');
  verificar(edDescRet.Text = '', edDescRet, 'Debe ingresar una descripción de la retención');
  verificar((fraProvinciasJur.IsEmpty) and (chkNoRetiene.Checked = false), fraProvinciasJur, 'Debe ingresar una Jurisdicción de Retención de IIBB o ''No Retiene''');
  verificar(edConceptoRet.Text = '', edConceptoRet, 'Debe ingresar un concepto de retención de IIBB');

  if ModoABM = maAlta then
  begin
    ssql := ' select 1 from art.cib_ingresosbrutos ' +
             ' where ib_provincia = :prov and ib_codigo = :codret ' +
               ' and ib_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [fraProvincias.Codigo, ieCodRet.Text]), fraProvincias, 'Ya existen datos para la provincia/código ingresados');
  end;
  result := true;
end;

{function TfrmIIBBProvincias.ComaXPunto(cadena: string): string;
begin
 cadena := StringReplace(cadena, ',' '.');
 ComaXPunto := cadena;
end;}


procedure TfrmIIBBProvincias.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraProvinciaFiltro.Clear;
end;


procedure TfrmIIBBProvincias.tbModificarClick(Sender: TObject);
begin
  if (sdqConsulta.FieldByName('fbaja').AsString <> '') then
  begin
    if (MsgBox('Atención: La acción habilitará un registro previamente dado de baja. Desea continuar?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
      inherited;
  end
  else
    inherited;
end;

procedure TfrmIIBBProvincias.fraProvinciasedCodigoExit(Sender: TObject);
begin
  fraProvinciasJur.Codigo := fraProvincias.Codigo;
end;

procedure TfrmIIBBProvincias.fpAbmShow(Sender: TObject);
begin
  case ModoABM of
    maAlta:
      vclextra.LockControls([fraProvincias, ieCodRet], false);
    maModificacion:
      vclextra.LockControls([fraProvincias, ieCodRet]);
  end;
end;

procedure TfrmIIBBProvincias.chkNoRetieneClick(Sender: TObject);
begin
  if chkNoRetiene.Checked then
  begin
    fraProvinciasJur.Clear;
    vclextra.LockControls(fraProvinciasJur);
  end
  else
    vclextra.LockControls(fraProvinciasJur, false);


end;

end.
