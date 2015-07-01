unit unComisionesaAprobar;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   12-02-2003
 ULTIMA MODIFICACION: 10-10-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unPrincipal, PatternEdit, StdCtrls, unfraVendedores,
  unfraVendedoresCUIT, unArtFrame, unFraCodigoDescripcion, unfraEntidadCUIT, Mask, ToolEdit, CurrEdit, FormPanel,
  IntEdit, unArtDBAwareFrame, DateComboBox;

type
  TfrmComisionesaAprobar = class(TfrmCustomConsulta)
    pgAprobacion: TPageControl;
    tbsIndividual: TTabSheet;
    tbsMasiva: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edLC_FECHALIQ: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edEN_NOMBRE: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edVE_NOMBRE: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edLC_FACTURATIPO: TEdit;
    Label12: TLabel;
    edLC_FECHAFACTURA: TEdit;
    Label13: TLabel;
    edLC_FECHARECEPFACT: TEdit;
    Label14: TLabel;
    edLC_COBRADO: TCurrencyEdit;
    edLC_COBRADONETO: TCurrencyEdit;
    edLC_COMISION: TCurrencyEdit;
    fpDetalle: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    GridDetalle: TArtDBGrid;
    sdqDetalle: TSDQuery;
    dsDetalle: TDataSource;
    tbAprobar: TToolButton;
    tbDetalle: TToolButton;
    tbSeparador: TToolButton;
    edEN_ID: TEdit;
    edEN_CODBANCO: TEdit;
    edVE_VENDEDOR: TEdit;
    GBEntidad: TGroupBox;
    fraEN_ID: TfraEntidadCUIT;
    GBVendedor: TGroupBox;
    fraVE_ID: TfraVendedoresCUIT;
    edLC_FACTURANRO: TEdit;
    edLC_ID: TIntEdit;
    gbFecha: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    edLC_FECHALIQDesde: TDateComboBox;
    edLC_FECHALIQHasta: TDateComboBox;
    gbComision: TGroupBox;
    Label15: TLabel;
    edLC_COMISIONDesde: TCurrencyEdit;
    Label16: TLabel;
    edLC_COMISIONHasta: TCurrencyEdit;
    chkLiquidacionesEnCero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure fpDetalleBeforeShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure pgAprobacionChange(Sender: TObject);
    procedure fraEN_IDExit(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); 
    procedure edLC_IDKeyPress(Sender: TObject; var Key: Char);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormateoCampos(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraVE_IDExit(Sender: TObject);
  private
    procedure btnMarcarTodos (Sender : TObject);
    procedure btnDesMarcarTodos (Sender : TObject);
  protected
    procedure DoAprobar;
    procedure LoadControls;
    procedure ClearControls;
    procedure CargarSQL;
  public
  end;

var
  frmComisionesaAprobar: TfrmComisionesaAprobar;

implementation

uses
  unDmPrincipal, unFiltros, VCLExtra, Menus, CustomDlgs, unArt, unSesion, unConsultaFacturas,
  AnsiSql;

{$R *.DFM}

Const
  CONSULTA_GRILLA_1 : string = 'SELECT LC_ID, LC_FECHALIQ, EN_ID, EN_NOMBRE, ' +
                                      'EN_CODBANCO, NULL VE_VENDEDOR, NULL VE_NOMBRE, ' +
                                      'LC_COBRADO, LC_COBRADONETO, LC_COMISION ' +
                                ' FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
                               ' WHERE LC_IDENTIDAD = EN_ID ' +
                                 ' AND LC_IDENTIDAD IS NOT NULL ' +
                                 ' AND LC_ESTADO = ''P'' ';

  CONSULTA_GRILLA_2 : string = ' UNION ALL ' +
                               'SELECT LC_ID, LC_FECHALIQ, EN_ID, EN_NOMBRE, ' +
                                      'EN_CODBANCO, VE_VENDEDOR, VE_NOMBRE, ' +
                                      'LC_COBRADO, LC_COBRADONETO, LC_COMISION ' +
                                 'FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
                                'WHERE LC_IDENTIDADVENDEDOR = EV_ID ' +
                                  'AND EV_IDVENDEDOR = VE_ID ' +
                                  'AND EV_IDENTIDAD = EN_ID ' +
                                  'AND LC_IDENTIDADVENDEDOR IS NOT NULL ' +
                                  'AND LC_ESTADO = ''P'' ';

  CONSULTA_DETALLE : string = 'SELECT VE_VENDEDOR, VE_NOMBRE, CO_CONTRATO, EM_NOMBRE, ' +
                                     'PC_PERIODO, PC_COBRADO, PC_COBRADONETO, ' +
                                     'PC_COMISION ' +
                                'FROM XVE_VENDEDOR, AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, ' +
                                     'XPC_PAGOCOMISION ' +
                               'WHERE VC_IDENTIDADVEND = EV_ID ' +
                                 'AND EV_IDVENDEDOR = VE_ID ' +
                                 'AND PC_IDVENDCONTRATO = VC_ID ' +
                                 'AND VC_CONTRATO = CO_CONTRATO ' +
                                 'AND CO_IDEMPRESA = EM_ID ' +
                                 'AND PC_IDLIQCOMISION = :PC_IDLIQCOMISION ' +
                               'ORDER BY 1,2,3';

//Active Page Index de pgAprobacion
PAGINA_INDIVIDUAL = 0;
PAGINA_MASIVA = 1;

procedure TfrmComisionesaAprobar.FormCreate(Sender: TObject);
begin
  inherited;
  pgAprobacion.ActivePageIndex := PAGINA_INDIVIDUAL;
  LockControls ( tbsIndividual, True );
  LockControl ( edLC_ID, False );

  //Opciones para la impresora
  QueryPrint.PageOrientation := pxLandscape;

  tbAprobar.Left := 14;
  tbDetalle.Left := 14;
  tbSeparador.Left := 14;

  fraEN_ID.ShowBajas := True;
  fraVE_ID.ShowBajas := True;
end;

procedure TfrmComisionesaAprobar.fpDetalleBeforeShow(Sender: TObject);
var
   sSql : string;
begin
  sSql := CONSULTA_DETALLE;
  sdqDetalle.SQL.Clear;
  sdqDetalle.SQL.text := sSql;
  sdqDetalle.ParamByName('pc_idliqcomision').Value := sdqConsulta.fieldbyName('LC_ID').AsInteger;
  OpenQuery(sdqDetalle);
end;

procedure TfrmComisionesaAprobar.btnAceptarClick(Sender: TObject);
begin
  fpDetalle.Close;
end;

procedure TfrmComisionesaAprobar.tbDetalleClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
     MessageDlg('No posee ningún registro seleccionado.', mtError, [mbOK], 0)
  else
    fpDetalle.ShowModal;
end;

procedure TfrmComisionesaAprobar.tbAprobarClick(Sender: TObject);
begin
  if not sdqConsulta.Eof then
  begin
    if (msgBox('¿Está seguro que quiere aprobar las liquidaciones seleccionadas?', MB_ICONQUESTION + MB_YESNO ) = IDYES) then
      DoAprobar;
  end
  else
    MessageDlg('No posee ningún registro seleccionado.', mtError, [mbOK], 0);
end;

procedure TfrmComisionesaAprobar.DoAprobar;
var sSql  : string;
    iLoop : integer;
begin
  if Grid.SelectedRows.Count = 0 then
     MessageDlg('No posee ningún registro seleccionado.', mtError, [mbOK], 0)
  else
  begin
    for iloop := 0 to Grid.SelectedRows.Count-1 do
    begin
      sdqConsulta.GotoBookmark( pointer( Grid.SelectedRows.Items[iloop]));
      sSql := 'Begin ' +
              'comision.Do_ApruebaLiquidacion(:LC_ID, :USER);' +
              'End;';
      EjecutarSQLEx(sSql, [sdqConsulta.FieldByName('LC_ID').AsInteger, Sesion.UserID]);
    end;
  end;
  CargarSQL;
end;

procedure TfrmComisionesaAprobar.pgAprobacionChange(Sender: TObject);
begin
  tbLimpiarClick(nil);
end;

procedure TfrmComisionesaAprobar.fraEN_IDExit(Sender: TObject);
begin
  inherited;
  fraEN_ID.FrameExit(Sender);
  fraVE_ID.Entidad := fraEN_ID.Value;
end;

procedure TfrmComisionesaAprobar.tbRefrescarClick(Sender: TObject);
begin
  CargarSQL;
end;

procedure TfrmComisionesaAprobar.edLC_IDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    CargarSQL;
end;

procedure TfrmComisionesaAprobar.LoadControls;
begin
  with sdqConsulta do
  begin
    edLC_ID.Text             := FieldByName('LC_ID').AsString;
    edLC_FECHALIQ.Text       := FieldByName('LC_FECHALIQ').AsString;
    edEN_ID.Text             := FieldByName('EN_ID').AsString;
    edEN_CODBANCO.Text       := FieldByName('EN_CODBANCO').AsString;
    edEN_NOMBRE.Text         := FieldByName('EN_NOMBRE').AsString;
    edVE_VENDEDOR.Text       := FieldByName('VE_VENDEDOR').AsString;
    edVE_NOMBRE.Text         := FieldByName('VE_NOMBRE').AsString;
    edLC_COBRADO.Text        := FieldByName('LC_COBRADO').AsString;
    edLC_COBRADONETO.Text    := FieldByName('LC_COBRADONETO').AsString;
    edLC_COMISION.Text       := FieldByName('LC_COMISION').AsString;
  end;
end;

procedure TfrmComisionesaAprobar.ClearControls;
begin
  edLC_ID.Clear;
  edLC_FECHALIQ.Clear;
  edEN_ID.Clear;
  edEN_CODBANCO.Clear;
  edEN_NOMBRE.Clear;
  edVE_VENDEDOR.Clear;
  edVE_NOMBRE.Clear;
  edLC_COBRADO.Clear;
  edLC_COBRADONETO.Clear;
  edLC_COMISION.Clear;
  edLC_FACTURATIPO.Clear;
  edLC_FACTURANRO.Clear;
  edLC_FECHAFACTURA.Clear;
  edLC_FECHARECEPFACT.Clear;
end;

procedure TfrmComisionesaAprobar.dsConsultaDataChange(Sender: TObject; Field: TField);
begin
  if not sdqConsulta.Eof then
  begin
    LoadControls;
    tbImprimir.Enabled := True;
    tbExportar.Enabled := True;
  end
  else
  begin
    tbImprimir.Enabled := False;
    tbExportar.Enabled := False;
  end
end;

procedure TfrmComisionesaAprobar.CargarSQL;
var
   sSql, sWhere: string;
begin
  Case pgAprobacion.ActivePageIndex of
    PAGINA_INDIVIDUAL:
    begin
      if edLC_ID.Text <> '' then
      begin
        sWhere := DoFiltroComponente(edLC_ID, 'LC_ID');

        sSql := CONSULTA_GRILLA_1 + sWhere + CONSULTA_GRILLA_2 + sWhere;
        ClearControls;
        OpenQuery(sdqConsulta, sSql, True);
      end;
    end;

    PAGINA_MASIVA:
    begin
      sWhere := SqlBetweenDateTime(' AND LC_FECHALIQ ', edLC_FECHALIQDesde.Date, edLC_FECHALIQHasta.Date) +
                DoFiltro(GBEntidad) +
                SqlBetween(' AND LC_COMISION ', edLC_COMISIONDesde.Value, edLC_COMISIONHasta.Value);

      if not chkLiquidacionesEnCero.Checked then
        sWhere := sWhere + ' AND LC_COMISION <> 0' ;

      sSql := CONSULTA_GRILLA_1 + sWhere +
              CONSULTA_GRILLA_2 + sWhere + DoFiltro(GBVendedor);
      OpenQuery(sdqConsulta, sSql, True);
    end;
  end;
end;

procedure TfrmComisionesaAprobar.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edLC_ID.Clear;
  edLC_FECHALIQ.Clear;
  edEN_ID.Clear;
  edEN_CODBANCO.Clear;
  edEN_NOMBRE.Clear;
  edVE_VENDEDOR.Clear;
  edVE_NOMBRE.Clear;
  edLC_COBRADO.Clear;
  edLC_COBRADONETO.Clear;
  edLC_COMISION.Clear;
  edLC_FACTURATIPO.Clear;
  edLC_FACTURANRO.Clear;
  edLC_FECHAFACTURA.Clear;
  edLC_FECHARECEPFACT.Clear;
  fraEN_ID.Clear;
  fraVE_ID.Entidad := ART_EMPTY_ID;
  fraVE_ID.Clear;
  edLC_COMISIONDesde.Clear;
  edLC_COMISIONHasta.CLear;
  edLC_FECHALIQDesde.Clear;
  edLC_FECHALIQHasta.Clear;
  chkLiquidacionesEnCero.Checked := False;

  sdqConsulta.Close;
end;

procedure TfrmComisionesaAprobar.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Menu : TPopUpMenu;
  Item : TmenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  Menu := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    Item.Caption := 'Marcar Todos';
    Item.OnClick := btnMarcarTodos;
    Menu.Items.Add( Item );
    Item := TMenuItem.Create(Self);
    Item.Caption := 'Desmarcar Todos';
    Item.OnClick := btnDesMarcarTodos;
    Menu.Items.Add( Item );
    Menu.PopUp ( Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y );
  except
    Menu.Free;
    Item.Free;
  end;
end;

procedure TfrmComisionesaAprobar.btnDesMarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmComisionesaAprobar.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmComisionesaAprobar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('LC_COBRADO')).Currency        := True;
    TFloatField(FieldByName('LC_COBRADONETO')).Currency    := True;
    TFloatField(FieldByName('LC_COMISION')).Currency       := True;
  end;
end;

procedure TfrmComisionesaAprobar.FormateoCampos(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TFloatField(FieldByName('PC_COBRADO')).Currency     := True;
    TFloatField(FieldByName('PC_COBRADONETO')).Currency := True;
    TFloatField(FieldByName('PC_COMISION')).Currency    := True;
  end;
end;

procedure TfrmComisionesaAprobar.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'Debe seleccionar una liquidación para ver las facturas correspondientes.');

  with TfrmConsultaFacturas.Create(Self) do
  begin
    IDLiquidacion := Self.sdqConsulta.FieldByName('LC_ID').AsInteger;
    ModoConsulta := True;
    ShowModal;
  end;
end;

procedure TfrmComisionesaAprobar.fraVE_IDExit(Sender: TObject);
begin
  inherited;
  fraVE_ID.FrameExit(Sender);

  if fraVE_ID.IsSelected then
    fraEN_ID.Value := fraVE_ID.Entidad;
end;

end.


