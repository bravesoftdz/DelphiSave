unit unfraZonasPrestador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unArtFrame, Vcl.Grids, Vcl.DBGrids,
  RxDBCtrl, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, SortDlg, QueryToFile,
  ExportDialog, QueryPrint, Data.DB, SDEngine, Vcl.StdCtrls, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, unfraNomenclador, FormPanel, AnsiSQL,
  artSeguridad, RxPlacemnt, JvExComCtrls, JvDBTreeView;

type
  TfraZonasPrestador = class(TArtFrame)
    pnlZonas: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevaZona: TToolButton;
    tbEliminarZona: TToolButton;
    ToolButton3: TToolButton;
    tbOrdenarZona: TToolButton;
    ToolButton5: TToolButton;
    tbExportarZona: TToolButton;
    tbImprimirZona: TToolButton;
    dbgZonas: TRxDBGrid;
    Panel1: TPanel;
    pnlDerechaZonas: TPanel;
    pnlTramos: TPanel;
    Panel5: TPanel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbNuevoTramo: TToolButton;
    tbEliminarTramo: TToolButton;
    ToolButton10: TToolButton;
    tbOrdenarTramo: TToolButton;
    ToolButton12: TToolButton;
    tbExportarTramo: TToolButton;
    tbImprimirTramo: TToolButton;
    dbgTramos: TRxDBGrid;
    pnlDetalleZonas: TPanel;
    Panel4: TPanel;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbNuevoDetalleZona: TToolButton;
    tbEliminarDetalleZona: TToolButton;
    ToolButton17: TToolButton;
    tbOrdenarDetalleZona: TToolButton;
    ToolButton19: TToolButton;
    tbExportarDetalleZona: TToolButton;
    tbImprimirDetalleZona: TToolButton;
    sdqZonas: TSDQuery;
    dsZonas: TDataSource;
    qpZonas: TQueryPrint;
    edlgZonas: TExportDialog;
    sdZonas: TSortDialog;
    sdqZonasDetalle: TSDQuery;
    dsZonasDetalle: TDataSource;
    qpZonasDetalle: TQueryPrint;
    edlgZonasDetalle: TExportDialog;
    sdZonasDetalle: TSortDialog;
    sdqTramos: TSDQuery;
    dsTramos: TDataSource;
    qpTramos: TQueryPrint;
    edlgTramos: TExportDialog;
    sdTramos: TSortDialog;
    fpZonas: TFormPanel;
    BevelAbm: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    btnAceptarZonas: TButton;
    btnCancelarZonas: TButton;
    edCodigoZona: TEdit;
    edDescripcionZona: TEdit;
    fpTramos: TFormPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAceptarTramos: TButton;
    Button2: TButton;
    fraNomenclador: TfraNomenclador;
    fraZonaOrigen: TfraCodDesc;
    fraZonaDestino: TfraCodDesc;
    fpZonasDetalle: TFormPanel;
    Bevel1: TBevel;
    btnAceptarZonasDetalle: TButton;
    btnCancelarZonasDetalle: TButton;
    splVertical: TSplitter;
    splHorizontal: TSplitter;
    Label6: TLabel;
    fraZonas: TfraCodDesc;
    Label7: TLabel;
    sdqZonasZP_ID: TFloatField;
    sdqZonasZP_IDPRESTADOR: TFloatField;
    sdqZonasZP_CODIGO: TStringField;
    sdqZonasZP_DESCRIPCION: TStringField;
    sdqZonasZP_USUALTA: TStringField;
    sdqZonasZP_FECHAALTA: TDateTimeField;
    sdqZonasZP_USUMODIF: TStringField;
    sdqZonasZP_FECHAMODIF: TDateTimeField;
    sdqZonasZP_USUBAJA: TStringField;
    sdqZonasZP_FECHABAJA: TDateTimeField;
    tbModificarZona: TToolButton;
    PrintDialog: TPrintDialog;
    FormStorage: TFormStorage;
    sdqTramosZV_ID: TFloatField;
    sdqTramosZV_IDPRESTADOR: TFloatField;
    sdqTramosZV_IDZONAORIGEN: TFloatField;
    sdqTramosZV_IDZONADESTINO: TFloatField;
    sdqTramosZV_NOMENCLADOR: TStringField;
    sdqTramosZV_CAPITULO: TStringField;
    sdqTramosZV_CODIGO: TStringField;
    sdqTramosZV_USUALTA: TStringField;
    sdqTramosZV_FECHAALTA: TDateTimeField;
    sdqTramosZV_USUMODIF: TStringField;
    sdqTramosZV_FECHAMODIF: TDateTimeField;
    sdqTramosZV_USUBAJA: TStringField;
    sdqTramosZV_FECHABAJA: TDateTimeField;
    sdqTramosORIGEN: TStringField;
    sdqTramosDESTINO: TStringField;
    tvDetalleZona: TJvDBTreeView;
    sdqZonasDetalleID: TFloatField;
    sdqZonasDetalleDESCRIPCION: TStringField;
    sdqZonasDetalleIDPADRE: TFloatField;
    dbgZonaDetalle: TRxDBGrid;
    sdqZonasDetalleCODIGO_POSTAL: TStringField;
    sdqZonasDetallePROVINCIA: TStringField;
    fraUbicaciones: TfraCodDesc;
    sdqZonasDetalleZD_ID: TFloatField;
    procedure sdqZonasAfterOpen(DataSet: TDataSet);
    procedure sdqTramosAfterOpen(DataSet: TDataSet);
    procedure sdqZonasAfterScroll(DataSet: TDataSet);
    procedure tbNuevaZonaClick(Sender: TObject);
    procedure fpZonasClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEliminarZonaClick(Sender: TObject);
    procedure tbEliminarDetalleZonaClick(Sender: TObject);
    procedure tbEliminarTramoClick(Sender: TObject);
    procedure tbExportarZonaClick(Sender: TObject);
    procedure tbExportarDetalleZonaClick(Sender: TObject);
    procedure tbExportarTramoClick(Sender: TObject);
    procedure btnAceptarZonasClick(Sender: TObject);
    procedure tbModificarZonaClick(Sender: TObject);
    procedure dbgZonasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbOrdenarZonaClick(Sender: TObject);
    procedure tbOrdenarDetalleZonaClick(Sender: TObject);
    procedure tbOrdenarTramoClick(Sender: TObject);
    procedure tbImprimirZonaClick(Sender: TObject);
    procedure tbImprimirDetalleZonaClick(Sender: TObject);
    procedure tbImprimirTramoClick(Sender: TObject);
    procedure tbNuevoTramoClick(Sender: TObject);
    procedure btnAceptarTramosClick(Sender: TObject);
    procedure dbgTramosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbNuevoDetalleZonaClick(Sender: TObject);
    procedure btnAceptarZonasDetalleClick(Sender: TObject);
  private
    FSQL: TSQL;
    FPrestador: Integer;
    function GetPrestador: Integer;
    procedure SetPrestador(AValue: Integer);
    procedure VerPermisoComponente(AToolButton: TToolButton; AQuery: TSDQuery);
    procedure ImpresionGrilla(QueryPrint: TQueryPrint);
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    property IdPrestador: Integer read GetPrestador write SetPrestador;
  end;

var
  fraZonasPrestador: TfraZonasPrestador;

implementation

{$R *.dfm}

uses
  VCLExtra, unDmPrincipal, CustomDlgs, strfuncs, unFiltros, SqlFuncs, unSesion,
  General, unPrincipal, unManPrestador, unArt, unFraDomicilio;

procedure TfraZonasPrestador.sdqTramosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgTramos);
  VerPermisoComponente(tbEliminarTramo, sdqTramos);
end;

procedure TfraZonasPrestador.VerPermisoComponente(AToolButton: TToolButton; AQuery: TSDQuery);
begin
  AToolButton.Enabled := (not AQuery.IsEmpty) and frmManPrestador.Seguridad.Activar(AToolButton);
end;

procedure TfraZonasPrestador.sdqZonasAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgZonas);
  VerPermisoComponente(tbModificarZona, sdqZonas);
  VerPermisoComponente(tbEliminarZona, sdqZonas);
end;

procedure TfraZonasPrestador.sdqZonasAfterScroll(DataSet: TDataSet);
begin
//  OpenQueryEx(sdqZonasDetalle, []);
end;

procedure TfraZonasPrestador.AfterConstruction;
begin
  inherited;
  FSQL := TSql.Create('');
end;

procedure TfraZonasPrestador.btnAceptarZonasClick(Sender: TObject);
var
  nId: Integer;
  sSQL, sExtraCondition: String;
begin
  Verificar(IsEmptyString(edCodigoZona.Text), edCodigoZona, 'Debe indicar el código de la zona.');
  Verificar(IsEmptyString(edDescripcionZona.Text), edDescripcionZona, 'Debe indicar la descripción de la zona.');

  if fpZonas.Tag = 2 then
    sExtraCondition := ' AND ZP_ID <> ' + sdqZonas.FieldByName('ZP_ID').AsString;

  sSQL := 'SELECT 1 ' +
            'FROM art.szp_zonaprestador ' +
           'WHERE zp_idprestador = :IdPrestador ' +
             'AND zp_codigo = :Codigo ' +
             'AND zp_fechabaja IS NULL' + sExtraCondition;
  Verificar(ExisteSQLEx(sSQL, [IdPrestador, edCodigoZona.Text]), edCodigoZona, 'El código ya existe para el prestador actual.');

  with FSQL do
  begin
    Clear;
    TableName := 'ART.SZP_ZONAPRESTADOR';

    case fpZonas.Tag of
      1: begin
           FSQL.SqlType := stInsert;
           Fields.Add('ZP_USUALTA', Sesion.UserID);
           Fields.Add('ZP_FECHAALTA', exDate);
           nId := ValorSQLInteger('SELECT NVL(MAX(ZP_ID), 0) FROM ART.SZP_ZONAPRESTADOR') + 1;
         end;
      2: begin
           FSQL.SqlType := stUpdate;
           Fields.Add('ZP_FECHAMODIF', exDate);
           Fields.Add('ZP_USUMODIF', Sesion.UserID);
           nId := sdqZonas.FieldByName('ZP_ID').AsInteger;
         end;
      else
        nId := 0;
    end;

    PrimaryKey.Add('ZP_ID', nId);
    Fields.Add('ZP_CODIGO', edCodigoZona.Text);
    Fields.Add('ZP_DESCRIPCION', edDescripcionZona.Text);
    Fields.Add('ZP_IDPRESTADOR', IdPrestador);

    EjecutarSql(Sql);
  end;
  fpZonas.ModalResult := mrOk;
  OpenQueryEx(sdqZonas, [IdPrestador]);
  OpenQueryEx(sdqZonasDetalle, [IdPrestador]);
end;

procedure TfraZonasPrestador.btnAceptarZonasDetalleClick(Sender: TObject);
var
  nId: Integer;
  sSQL, sExtraCondition: String;
begin
  Verificar(fraZonas.IsEmpty, fraZonas.edCodigo, 'Debe indicar la zona.');
  Verificar(fraUbicaciones.IsEmpty, fraUbicaciones.edCodigo, 'Debe indicar la ubicación.');

  if fpZonasDetalle.Tag = 2 then
    sExtraCondition := ' AND ZD_ID <> ' + sdqZonasDetalle.FieldByName('ZD_ID').AsString;

  sSQL := 'SELECT 1 ' +
            'FROM art.szd_zonaprestadordetalle ' +
           'WHERE zd_idprestador = :IdPrestador ' +
//             'AND zd_idzonaprestador <> :Zona ' +
             'AND zd_cpostal = :CodigoPostal ' +
             'AND zd_localidad = :Localidad ' +
             'AND zd_provincia = :Provincia ' +
             'AND zd_fechabaja IS NULL' + sExtraCondition;

  with fraUbicaciones.sdqDatos do
  Verificar(ExisteSQLEx(sSQL, [IdPrestador,
                               //fraZonas.ID,
                               FieldByName('UB_CPOSTAL').AsInteger,
                               String(iif(FieldByName('UB_CPOSTAL').AsInteger <= MAXCODCAPFED, FieldByName('UB_CALLE').AsString, FieldByName('UB_LOCALIDAD').AsString)),
                               FieldByName('UB_PROVINCIA').AsInteger]),
            fraUbicaciones.edCodigo, 'La ubicación ya pertenece a una zona.');

  with fraUbicaciones.sdqDatos, FSQL do
  begin
    Clear;
    TableName := 'ART.SZD_ZONAPRESTADORDETALLE';

    case fpZonasDetalle.Tag of
      1: begin
           FSQL.SqlType := stInsert;
           Fields.Add('ZD_USUALTA', Sesion.UserID);
           Fields.Add('ZD_FECHAALTA', exDate);
           nId := ValorSQLInteger('SELECT NVL(MAX(ZD_ID), 0) FROM ART.SZD_ZONAPRESTADORDETALLE') + 1;
         end;
      2: begin
           FSQL.SqlType := stUpdate;
           Fields.Add('ZD_FECHAMODIF', exDate);
           Fields.Add('ZD_USUMODIF', Sesion.UserID);
           nId := sdqTramos.FieldByName('ZD_ID').AsInteger;
         end;
      else
        nId := 0;
    end;

    PrimaryKey.Add('ZD_ID', nId);
    Fields.Add('ZD_IDPRESTADOR', IdPrestador);
    Fields.Add('ZD_IDZONAPRESTADOR', fraZonas.Value);
    Fields.Add('ZD_CPOSTAL', FieldByName('UB_CPOSTAL').AsInteger);
    Fields.Add('ZD_LOCALIDAD', String(iif(FieldByName('UB_CPOSTAL').AsInteger <= MAXCODCAPFED, FieldByName('UB_CALLE').AsString, FieldByName('UB_LOCALIDAD').AsString)));
    Fields.Add('ZD_PROVINCIA', FieldByName('UB_PROVINCIA').AsInteger);

    EjecutarSql(Sql);
  end;
  fpZonasDetalle.ModalResult := mrOk;
  OpenQueryEx(sdqZonasDetalle, [IdPrestador]);
end;

procedure TfraZonasPrestador.btnAceptarTramosClick(Sender: TObject);
var
  nId: Integer;
  sSQL, sExtraCondition: String;
begin
  Verificar(fraZonaOrigen.IsEmpty, fraZonaOrigen.edCodigo, 'Debe indicar la zona de origen.');
  Verificar(fraZonaOrigen.IsBaja, fraZonaOrigen.edCodigo, 'La zona de origen seleccionada está dada de baja.');
  Verificar(fraZonaDestino.IsEmpty, fraZonaDestino.edCodigo, 'Debe indicar la zona de destino.');
  Verificar(fraZonaDestino.IsBaja, fraZonaDestino.edCodigo, 'La zona de destino seleccionada está dada de baja.');
  //Verificar(fraZonaOrigen.Codigo = fraZonaDestino.Codigo, fraZonaOrigen.edCodigo, 'La zona de origen y la de destino no pueden ser la misma.');
  Verificar(not fraNomenclador.IsSelected, fraNomenclador, 'Debe indicar el módulo que corresponde al tramo seleccionado.');

  if fpTramos.Tag = 2 then
    sExtraCondition := ' AND ZV_ID <> ' + sdqTramos.FieldByName('ZV_ID').AsString;

  sSQL := 'SELECT 1 ' +
            'FROM art.szv_zonavalor ' +
           'WHERE zv_idprestador = :IdPrestador ' +
             'AND zv_idzonaorigen = :ZonaOrigen ' +
             'AND zv_idzonadestino = :ZonaDestino ' +
             'AND zv_fechabaja IS NULL' + sExtraCondition;
  Verificar(ExisteSQLEx(sSQL, [IdPrestador, fraZonaOrigen.ID, fraZonaDestino.ID]), fraNomenclador, 'El valor ya ha sido definido para el tramo seleccionado en el prestador actual.');

  with FSQL do
  begin
    Clear;
    TableName := 'ART.SZV_ZONAVALOR';

    case fpTramos.Tag of
      1: begin
           FSQL.SqlType := stInsert;
           Fields.Add('ZV_USUALTA', Sesion.UserID);
           Fields.Add('ZV_FECHAALTA', exDate);
           nId := ValorSQLInteger('SELECT NVL(MAX(ZV_ID), 0) FROM ART.SZV_ZONAVALOR') + 1;
         end;
      2: begin
           FSQL.SqlType := stUpdate;
           Fields.Add('ZV_FECHAMODIF', exDate);
           Fields.Add('ZV_USUMODIF', Sesion.UserID);
           nId := sdqTramos.FieldByName('ZV_ID').AsInteger;
         end;
      else
        nId := 0;
    end;

    PrimaryKey.Add('ZV_ID', nId);
    Fields.Add('ZV_IDPRESTADOR', IdPrestador);
    Fields.Add('ZV_IDZONAORIGEN', fraZonaOrigen.Value);
    Fields.Add('ZV_IDZONADESTINO', fraZonaDestino.Value);
    Fields.Add('ZV_NOMENCLADOR', fraNomenclador.Nomenclador);
    Fields.Add('ZV_CAPITULO', fraNomenclador.Capitulo);
    Fields.Add('ZV_CODIGO', fraNomenclador.Codigo);

    EjecutarSql(Sql);
  end;
  fpTramos.ModalResult := mrOk;
  OpenQueryEx(sdqTramos, [IdPrestador]);
end;

procedure TfraZonasPrestador.dbgTramosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if ((InStr(Field.FieldName, 'ZV_') = 0) and (not Field.DataSet.FieldByName('ZV_FECHABAJA').IsNull)) then
    AFont.Color := clRed;
end;

procedure TfraZonasPrestador.dbgZonasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Field.FieldName = 'ZP_DESCRIPCION') and (not Field.DataSet.FieldByName('ZP_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

destructor TfraZonasPrestador.Destroy;
begin
  FSQL.Destroy;
  inherited;
end;

procedure TfraZonasPrestador.fpZonasClose(Sender: TObject; var Action: TCloseAction);
begin
  fpZonas.Tag := 0;
end;

function TfraZonasPrestador.GetPrestador: Integer;
begin
  Result := FPrestador;
end;

procedure TfraZonasPrestador.SetPrestador(AValue: Integer);
begin
  FPrestador := AValue;
  OpenQueryEx(sdqZonas, [FPrestador]);
  OpenQueryEx(sdqZonasDetalle, [FPrestador]);
  OpenQueryEx(sdqTramos, [FPrestador]);
  fraNomenclador.Prestador := FPrestador;
  fraZonas.Propiedades.ExtraCondition := ' AND zp_idprestador = ' + SQLValue(AValue);
  fraZonaOrigen.Propiedades.ExtraCondition := fraZonas.Propiedades.ExtraCondition;
  fraZonaDestino.Propiedades.ExtraCondition := fraZonas.Propiedades.ExtraCondition;
end;

procedure TfraZonasPrestador.tbEliminarDetalleZonaClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea dar de baja esta ubicación?') then
  begin
    EjecutarSQLEx('UPDATE ART.SZD_ZONAPRESTADORDETALLE SET ZD_FECHABAJA = SYSDATE, ZD_USUBAJA = :USUARIO WHERE ZD_ID = :ID', [Sesion.UserID, sdqZonasDetalle.FieldByName('ZD_ID').AsInteger]);
    OpenQueryEx(sdqZonasDetalle, [FPrestador]);
  end;
end;

procedure TfraZonasPrestador.tbEliminarTramoClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea dar de baja este tramo?') then
  begin
    EjecutarSQLEx('UPDATE ART.SZV_ZONAVALOR SET ZV_FECHABAJA = SYSDATE, ZV_USUBAJA = :USUARIO WHERE ZV_ID = :ID', [Sesion.UserID, sdqTramos.FieldByName('ZV_ID').AsInteger]);
    OpenQueryEx(sdqTramos, [IdPrestador]);
  end;
end;

procedure TfraZonasPrestador.tbEliminarZonaClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea dar de baja esta zona?') then
  begin
    EjecutarSQLEx('UPDATE ART.SZP_ZONAPRESTADOR SET ZP_FECHABAJA = SYSDATE, ZP_USUBAJA = :USUARIO WHERE ZP_ID = :ID', [Sesion.UserID, sdqZonas.FieldByName('ZP_ID').AsInteger]);
    OpenQueryEx(sdqZonas, [IdPrestador]);
  end;
end;

procedure TfraZonasPrestador.tbExportarDetalleZonaClick(Sender: TObject);
begin
  edlgZonasDetalle.Execute;
end;

procedure TfraZonasPrestador.tbExportarTramoClick(Sender: TObject);
begin
  edlgTramos.Execute;
end;

procedure TfraZonasPrestador.tbExportarZonaClick(Sender: TObject);
begin
  edlgZonas.Execute;
end;

procedure TfraZonasPrestador.tbImprimirDetalleZonaClick(Sender: TObject);
begin
  ImpresionGrilla(qpZonasDetalle);
end;

procedure TfraZonasPrestador.tbImprimirTramoClick(Sender: TObject);
begin
  ImpresionGrilla(qpTramos);
end;

procedure TfraZonasPrestador.tbImprimirZonaClick(Sender: TObject);
begin
  ImpresionGrilla(qpZonas);
end;

procedure TfraZonasPrestador.tbModificarZonaClick(Sender: TObject);
begin
  Verificar(sdqZonas.IsEmpty, tbModificarZona, 'Debe seleccionar una zona.');
  Verificar(not sdqZonas.FieldByName('ZP_FECHABAJA').IsNull, tbModificarZona, 'La zona seleccionada ya ha sido dada de baja.');
  fpZonas.Tag := 2;
  edCodigoZona.Text := sdqZonas.FieldByName('ZP_CODIGO').AsString;
  edDescripcionZona.Text := sdqZonas.FieldByName('ZP_DESCRIPCION').AsString;
  fpZonas.ShowModal;
end;

procedure TfraZonasPrestador.tbNuevaZonaClick(Sender: TObject);
begin
  fpZonas.Tag := 1;
  ClearComponentData(fpZonas);
  fpZonas.ShowModal;
end;

procedure TfraZonasPrestador.tbNuevoDetalleZonaClick(Sender: TObject);
begin
  fpZonasDetalle.Tag := 1;
  ClearComponentData(fpZonasDetalle);
  fpZonasDetalle.ShowModal;
end;

procedure TfraZonasPrestador.tbNuevoTramoClick(Sender: TObject);
begin
  fpTramos.Tag := 1;
  ClearComponentData(fpTramos);
  fpTramos.ShowModal;
end;

procedure TfraZonasPrestador.tbOrdenarDetalleZonaClick(Sender: TObject);
begin
  LoadDynamicSortFields(sdZonasDetalle.SortFields, dbgZonaDetalle.Columns);
  sdZonasDetalle.Execute;
end;

procedure TfraZonasPrestador.tbOrdenarTramoClick(Sender: TObject);
begin
  LoadDynamicSortFields(sdTramos.SortFields, dbgTramos.Columns);
  sdTramos.Execute;
end;

procedure TfraZonasPrestador.tbOrdenarZonaClick(Sender: TObject);
begin
  LoadDynamicSortFields(sdZonas.SortFields, dbgZonas.Columns);
  sdZonas.Execute;
end;

procedure TfraZonasPrestador.ImpresionGrilla(QueryPrint: TQueryPrint);
begin
  if PrintDialog.Execute then
  begin
    QueryPrint.SubTitle.Text := IntToStr(frmManPrestador.fraPrestadorSel.IDPrestador) + ' - ' + frmManPrestador.fraPrestadorSel.RazonSocial;
    QueryPrint.Footer.Text   := Sesion.Usuario;
    QueryPrint.Print;
  end;
end;

end.
