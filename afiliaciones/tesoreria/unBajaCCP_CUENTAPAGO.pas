unit unBajaCCP_CUENTAPAGO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, FormPanel;

type
  TfrmBajaCCP_CUENTAPAGO = class(TfrmCustomConsulta)
    fpBusqueda: TFormPanel;
    lbCuitCuilBusqueda: TLabel;
    edCUITCUILBusqueda: TMaskEdit;
    tbBuscar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    cmdBuscar: TButton;
    cmdCerrar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure fpBusquedaEnter(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
  private
  public
  end;

implementation

uses
  unPrincipal, unART, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal,
  unSesion;

{$R *.DFM}

procedure TfrmBajaCCP_CUENTAPAGO.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  {$IFDEF ART1_TO_2}
  sSql := 'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, CP_CUITCUIL CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, ZBA_BANCO, CTB_TABLAS TA, CTB_TABLAS TC, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR IN (''OA'', ''PA'') ' +   // Otros Acreedores, Persona Autorizada
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, CA_CLAVE CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, CPR_PRESTADOR, ZBA_BANCO, CTB_TABLAS TA, CTB_TABLAS TC, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = CA_IDENTIFICADOR ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''CA'' ' +   // Centro Asistencial
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, PV_CUIT CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, V_OPV_PROVEEDOR, ZBA_BANCO, CTB_TABLAS TA, CTB_TABLAS TC, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = PV_ID ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''PV'' ' +   // Proveedores
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, EM_CUIT CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, AEM_EMPRESA, ZBA_BANCO, CTB_TABLAS TA, CTB_TABLAS TC, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = EM_ID ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''EM'' ' +   // Empresa Afiliada
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, VE_CUIT CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, XVE_VENDEDOR, CTB_TABLAS TC, ZBA_BANCO, CTB_TABLAS TA, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = VE_ID ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''PR'' ' +   // Productores
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, TJ_CUIL CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, CTJ_TRABAJADOR, CTB_TABLAS TC, ZBA_BANCO, CTB_TABLAS TA, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = TJ_ID ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_ID ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''TA''';     // Trabajador Afiliado
  {$ELSE}
  sSql :=' SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, CP_CUITCUIL CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, CTB_TABLAS TC, ZBA_BANCOS, CTB_TABLAS TA, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_CODIGO ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR IN (''EM'', ''OA'', ''PA'', ''PR'', ''TA'') ' +  // Empresa Afiliada / Otros Acreedores, Persona Autorizada / Productores / Trabajador Afiliado
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, CA_CLAVE CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, CPR_PRESTADOR, CTB_TABLAS TC, ZBA_BANCOS, CTB_TABLAS TA, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = CA_IDENTIFICADOR ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_CODIGO ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''CA'' ' +   // Centro Asistencial
           'UNION ALL ' +
          'SELECT TA.TB_DESCRIPCION DESCR_TIPOACREEDOR, PV_CUIT CUITCUIL, DECODE(BA_CODIGO, ''014'', BA_NOMBRE, DECODE(SB_CODIGO, NULL, ''OTROS BANCOS'', BA_NOMBRE)) BANCO, ' +
                 'TC.TB_DESCRIPCION DESCR_TIPOCUENTA, SB_NOMBRE DESCR_SUCURSAL, CP_NROCUENTA, ' +
                 'UTILES.IIF_CHAR(CP_CBU1, NULL, NULL, CP_CBU1 || ''-'' || CP_CBU2) CBU, CP_USUALTAMCARGA, ' +
                 'TRUNC(CP_FECHAALTAMCARGA) FECHAALTAMCARGA, CP_ID, CP_FECHABAJA ' +
            'FROM ZSB_SUCURSALBANCO, V_OPV_PROVEEDOR, CTB_TABLAS TC, ZBA_BANCOS, CTB_TABLAS TA, CCP_CUENTAPAGO ' +
           'WHERE TA.TB_CODIGO = CP_TIPOACREEDOR ' +
             'AND TA.TB_CLAVE = ''TACRE'' ' +
             'AND CP_IDACREEDOR = PV_ID ' +
             'AND TC.TB_CODIGO (+) = CP_TIPOCUENTA ' +
             'AND TC.TB_CLAVE (+) = ''BCOCT'' ' +
             'AND CP_IDSUCURSAL = SB_ID(+) ' +
             'AND CP_IDBANCO = BA_CODIGO ' +
             'AND CP_FECHAALTAMCARGA IS NOT NULL ' +
             'AND CP_FECHAALTA IS NULL ' +
             'AND CP_FECHABAJA IS NULL ' +
             'AND CP_TIPOACREEDOR = ''PV''';     // Proveedores
  {$ENDIF}

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  RefreshData;
end;

procedure TfrmBajaCCP_CUENTAPAGO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sdqConsulta.FieldByName('CUITCUIL').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT
end;

procedure TfrmBajaCCP_CUENTAPAGO.tbEliminarClick(Sender: TObject);
begin
  if MsgBox('¿ Usted está seguro que quiere dar de baja la cuenta bancaria seleccionada ?', MB_YESNO + MB_ICONQUESTION, 'Baja de Cuentas Bancarias') = IDYES then
  try
    with TSql.Create('CCP_CUENTAPAGO') do
    try
      PrimaryKey.Add('CP_ID', sdqConsulta.FieldByName('CP_ID').AsInteger);
      Fields.Add('CP_FECHABAJA', exDateTime);
      Fields.Add('CP_USUBAJA', Sesion.UserID);

      SqlType := stUpdate;

      EjecutarSql(Sql);

      sdqConsulta.Refresh;
    finally
      Free;
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al dar de baja la cuenta bancaria.');
  end;
end;

procedure TfrmBajaCCP_CUENTAPAGO.cmdBuscarClick(Sender: TObject);
var
  bEncontrado: Boolean;
begin
  if sdqConsulta.Active then
  begin
    bEncontrado := sdqConsulta.Locate('CUITCUIL', edCUITCUILBusqueda.Text, [loCaseInsensitive, loPartialKey]);

    if bEncontrado then
    begin
      Grid.SelectedRows.CurrentRowSelected := True;
      cmdCerrar.SetFocus;
    end
    else
      MsgBox('No se ha encontrado el dato en la grilla.');
  end
  else
    MsgBox('No hay registros cargados en la grilla.');
end;

procedure TfrmBajaCCP_CUENTAPAGO.fpBusquedaEnter(Sender: TObject);
begin
  edCUITCUILBusqueda.Clear;
end;

procedure TfrmBajaCCP_CUENTAPAGO.tbBuscarClick(Sender: TObject);
begin
  inherited;

  fpBusqueda.ShowModal;
end;

end.
