unit unInstitoriosSucursales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraSucursal, unFraCodigoDescripcion,
  unfraVendedores, unfraVendedoresCUIT, Mask, ToolEdit, DateComboBox;

type
  TfrmInstitoriosSucursales = class(TfrmCustomGridABM)
    gbSucursal: TGroupBox;
    fraSucursalFiltro: TfraSucursal;
    pnlBajas: TPanel;
    chkNoBajas: TCheckBox;
    rgAprobado: TRadioGroup;
    gbVendedor: TGroupBox;
    fraVendedorCUITFiltro: TfraVendedoresCUIT;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    tbAprobar: TToolButton;
    fraVendedorCUITEdic: TfraVendedoresCUIT;
    fraSucursalEdic: TfraSucursal;
    Label1: TLabel;
    edFDesdeEdic: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edFHastaEdic: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmInstitoriosSucursales: TfrmInstitoriosSucursales;

implementation

uses
  unSesion, unArt, unDmPrincipal, SqlFuncs, CustomDlgs, VCLExtra, AnsiSql,
  DateTimeFuncs, General;

{$R *.dfm}

procedure TfrmInstitoriosSucursales.ClearControls;
begin
  fraVendedorCUITEdic.Clear;
  fraSucursalEdic.Clear;
  edFDesdeEdic.Clear;
  edFHastaEdic.Clear;
end;

function TfrmInstitoriosSucursales.DoABM: Boolean;
var
  VSID: TTableId;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          SqlType := stInsert;
          VSID    := GetSecNextVal('SEQ_XVS_ID');

          PrimaryKey.Add('VS_ID',       VSID);
          Fields.Add('VS_IDVENDEDOR',   fraVendedorCUITEdic.Value);
          Fields.Add('VS_IDSUCURSAL',   fraSucursalEdic.Value);
          Fields.Add('VS_FECHADESDE',   edFDesdeEdic.Date);

          if not edFHastaEdic.IsEmpty then
            Fields.Add('VS_FECHAHASTA', edFHastaEdic.Date);

          Fields.Add('VS_FECHAALTA',    exDateTime);
          Fields.Add('VS_USUALTA',      Sesion.UserID);
        end

      else if ModoABM = maBaja then
        begin
          SqlType := stUpdate;
          VSID    := sdqConsulta.FieldByName('VSID').AsInteger;

          PrimaryKey.Add('VS_ID',       VSID);
          Fields.Add('VS_FECHABAJA',    exDateTime);
          Fields.Add('VS_USUBAJA',      Sesion.UserID);
        end;

      Result := inherited DOABM;
    end;
end;

procedure TfrmInstitoriosSucursales.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT VE_VENDEDOR CODIGO_VENDEDOR, VE_CUIT CUIT_VENDEDOR, VE_NOMBRE NOMBRE_VENDEDOR, ' +
                 'SU_CODSUCURSAL CODIGO_SUCURSAL, SU_DESCRIPCION NOMBRE_SUCURSAL, VS_FECHADESDE FECHA_DESDE, ' +
                 'VS_FECHAHASTA FECHA_HASTA, TRUNC(VS_FECHAAPROBADO) FECHA_APROBADO, TRUNC(VS_FECHABAJA) FECHA_BAJA, ' +
                 'VS_ID VSID ' +
            'FROM XVS_VENDEDORSUCURSAL, XVE_VENDEDOR, ASU_SUCURSAL ' +
           'WHERE VE_ID = VS_IDVENDEDOR ' +
             'AND SU_ID = VS_IDSUCURSAL';

  sWhere := '';

  if fraVendedorCUITFiltro.IsSelected then
    sWhere := sWhere + ' AND VE_ID = ' + SqlValue(fraVendedorCUITFiltro.Value);

  if fraSucursalFiltro.IsSelected then
    sWhere := sWhere + ' AND SU_ID = ' + SqlValue(fraSucursalFiltro.Value);

  case rgAprobado.ItemIndex of
    0: sWhere := sWhere + ' AND VS_FECHAAPROBADO IS NOT NULL';
    1: sWhere := sWhere + ' AND VS_FECHAAPROBADO IS NULL';
  end;

  if chkNoBajas.Checked then
    sWhere := sWhere + ' AND VS_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmInstitoriosSucursales.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraVendedorCUITEdic.IsEmpty, fraVendedorCUITEdic, 'El vendedor es obligatorio.');
  Verificar(fraSucursalEdic.IsEmpty, fraSucursalEdic, 'La sucursal es obligatoria.');
  Verificar(edFDesdeEdic.IsEmpty, edFDesdeEdic, 'La fecha desde es obligatoria.');
  Verificar(edFDesdeEdic.Date < SIN_ART_MINFECHA, edFDesdeEdic, Format('La fecha desde no puede ser menor que el %s.', [DateToStr(SIN_ART_MINFECHA)]));

  sSql := 'SELECT 1 ' +
            'FROM XVS_VENDEDORSUCURSAL ' +
           'WHERE VS_FECHABAJA IS NULL ' +
             'AND VS_IDVENDEDOR = :VENDEDOR ' +
             'AND ((:FechaDesde BETWEEN VS_FECHADESDE AND NVL(VS_FECHAHASTA, TO_DATE(''31/12/9999'', ''DD/MM/YYYY''))) ' +
                  'OR (:FechaHasta BETWEEN VS_FECHADESDE AND NVL(VS_FECHAHASTA, TO_DATE(''31/12/9999'', ''DD/MM/YYYY'')))) ' +
                  'OR ((VS_FECHADESDE BETWEEN :FechaDesde AND NVL(:FechaHasta, TO_DATE(''31/12/9999'', ''DD/MM/YYYY''))) ' +
                     'AND (VS_FECHAHASTA BETWEEN :FechaDesde AND NVL(:FechaHasta, TO_DATE(''31/12/9999'', ''DD/MM/YYYY''))))';
  Verificar(ExisteSqlEx(sSql, [fraVendedorCUITEdic.Value, TDateTimeEx.Create(edFDesdeEdic.Date), TDateTimeEx.Create(edFHastaEdic.Date)]), edFDesdeEdic, 'El vendedor está asignado a otra sucursal en este rango de fechas.');

  Result := True;
end;

procedure TfrmInstitoriosSucursales.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  with fraVendedorCUITFiltro do
    begin
      ExtraCondition := ' AND EV_FECHABAJA IS NULL';
      ShowBajas      := True;
    end;

  with fraVendedorCUITEdic do
    begin
      ExtraCondition := ' AND EV_FECHABAJA IS NULL';
      ShowBajas      := False;
    end;

  fraSucursalFiltro.ExtraCondition := ' AND SU_IDENTIDAD = 9003';

  with fraSucursalEdic do
    begin
      ExtraCondition := ' AND SU_IDENTIDAD = 9003';
      ShowBajas      := False;
    end;

  Sql.TableName := 'XVS_VENDEDORSUCURSAL';
  FieldBaja     := 'FECHA_BAJA';
end;

procedure TfrmInstitoriosSucursales.tbLimpiarClick(Sender: TObject);
begin
  fraVendedorCUITFiltro.Clear;
  fraSucursalFiltro.Clear;
  rgAprobado.ItemIndex := 2;
  chkNoBajas.Checked   := True;

  inherited;
end;

procedure TfrmInstitoriosSucursales.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.Eof or not sdqConsulta.Active, Grid, 'Debe elegir un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_APROBADO').IsNull, Grid, 'La asignación ya ha sido aprobada.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, Grid, 'La asignación se encuentra dada de baja.');

  if MsgBox('¿Está seguro que desea aprobar la asignación?', MB_YESNO + MB_ICONQUESTION ) = mrYes then
    begin
      sSql := 'UPDATE XVS_VENDEDORSUCURSAL ' +
                 'SET VS_USUAPROBADO = :UsuAprobado, ' +
                     'VS_FECHAAPROBADO = SYSDATE ' +
               'WHERE VS_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('VSID').AsInteger]);

      MsgBox('Asignación aprobada correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

end.

