unit unPagosNoComisionables;
{                                 
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   25-03-2003
 ULTIMA MODIFICACION: 09-10-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraEntidadCUIT, StdCtrls,
  unfraVendedores, unfraVendedoresCUIT, CheckCombo,
  unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, PatternEdit,
  ComboEditor, PeriodoPicker, unArtDBAwareFrame;

type
  TfrmPagosNoComisionables = class(TfrmCustomConsulta)
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    GBEntidad: TGroupBox;
    fraEN_ID: TfraEntidadCUIT;
    GBVendedor: TGroupBox;
    fraVE_ID: TfraVendedoresCUIT;
    GBEmpresa: TGroupBox;
    fraCO_CONTRATO: TfraEmpresa;
    GBPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sdqCombo: TSDQuery;
    GroupBox1: TGroupBox;
    cmbMV_CODIGO: TCheckCombo;
    lbRSocial: TLabel;
    ppMO_PERIODODesde: TPeriodoPicker;
    ppMO_PERIODOHasta: TPeriodoPicker;
    gbPLANPAGO: TGroupBox;
    chkVC_PLANPAGO: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject); 
    procedure FormCreate(Sender: TObject);
    procedure fraEN_IDExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ppMO_PERIODOHastaEnter(Sender: TObject);
    procedure ppMO_PERIODODesdeEnter(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fraVE_IDExit(Sender: TObject);
  private
    TotalImporte: array of extended;
    procedure CargarComboCodigos;
    procedure PasarAComisionable;
    procedure btnMarcarTodos (Sender:TObject);
    procedure btnDesMarcarTodos (Sender:TObject);
    procedure CalcTotales;
  public
  end;

var
  frmPagosNoComisionables: TfrmPagosNoComisionables;
   
implementation

uses
  unPrincipal, unFiltros, unDmPrincipal, CustomDlgs, Menus, General,
  DBFuncs, unArt, AnsiSQL;

Const
   CONSULTA_GRILLA : string = 'SELECT EN_ID, EN_NOMBRE, EN_CODBANCO, VE_VENDEDOR, VE_NOMBRE, CO_CONTRATO, EM_NOMBRE, EM_CUIT, CM_CODIGO MV_CODIGO, ' +
                                     'CM_DESCRIPCION MV_DESCRIPCION, MO_PERIODO, MO_IMPORTE, EV_ID, MO_ID MO_SECUEN ' +
                                'FROM ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO, AEM_EMPRESA, ACO_CONTRATO, XVE_VENDEDOR, XEN_ENTIDAD, AVC_VENDEDORCONTRATO, ' +
                                     'XEV_ENTIDADVENDEDOR ' +
                               'WHERE VC_CONTRATO = CO_CONTRATO ' +
                                 'AND CO_IDEMPRESA = EM_ID ' +
                                 'AND MO_CONTRATO = CO_CONTRATO ' +
                                 'AND VE_ID = EV_IDVENDEDOR ' +
                                 'AND EN_ID = EV_IDENTIDAD ' +
                                 'AND MO_IDCODIGOMOVIMIENTO = CM_ID ' +
                                 'AND EV_ID = VC_IDENTIDADVEND ' +
                                 'AND MO_IDCIERREPAGO IS NULL ' +
                                 'AND VE_FECHABAJA IS NULL ' +
                                 'AND VC_FECHABAJA IS NULL ' +
                                 'AND EN_FECHABAJA IS NULL ' +
                                 'AND VC_VIGENCIADESDE <= MO_PERIODO ' +
                                 'AND (   VC_VIGENCIAHASTA IS NULL ' +
                                      'OR VC_VIGENCIAHASTA >= MO_PERIODO) ' +
                                 'AND (   CM_LIBRO IN (''C'', ''R'') ' +
                                      'OR CM_CODIGO = ''505'') ' +
                                 'AND (   (CM_COMISIONABLE = ''N'') ' +
                                      'OR (COBRANZA.GET_PLANPAGO(MO_IDVALOR, MO_CONTRATO, MO_IDPLANVALOR) IS NOT NULL)) ' +
                                 'AND CM_CONCEPTO = ''C'' ' +
                                 'AND NOT EXISTS(SELECT 1 ' +
                                                  'FROM XNC_PAGONOCOMISIONABLE ' +
                                                 'WHERE MO_ID = NC_IDMOVIM) ';

{$R *.DFM}

  CAMPOS_SUMA : array [0..0] of string = ('MO_IMPORTE');

procedure TfrmPagosNoComisionables.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere, Condicion : string;
  iloop : integer;
begin
  sWhere := DoFiltro (GBEntidad);

  if trim( fraVE_ID.edCodigo.Text )<>'' then
   sWhere := sWhere + ' AND VE_VENDEDOR = ' + SQLValue(fraVE_ID.Codigo) + ' ';

  sWhere := sWhere + DoFiltro (GBPeriodo);

  if fraCO_CONTRATO.IsSelected then
    sWhere := sWhere + ' AND CO_CONTRATO = ' + SQLValue(fraCO_CONTRATO.Contrato) + ' ';

  if chkVC_PLANPAGO.Checked then
    sWhere := sWhere + ' AND VC_PLANPAGO = ''S'' ';

  for iloop:=0 to cmbMV_CODIGO.Items.Count -1 do
  begin
    if cmbMV_CODIGO.Checked [iloop] then
      Condicion := Condicion + '''' + (cmbMV_CODIGO.Items.Objects [iloop] as TCadena).Cadena + ''',';
  end;
  if Condicion <> '' then
  begin
    //Quito la coma de mas
    Condicion := Copy( Condicion, 0, Length(Condicion)-1 );
    //Agrego la condicion al SQL
    sWhere := sWhere + ' AND ''''||CM_CODIGO IN (' + Condicion + ')';
  end;

  sSql := CONSULTA_GRILLA + sWhere + SortDialog.OrderBy;
  OpenQuery ( sdqConsulta, sSql, True);
end;

procedure TfrmPagosNoComisionables.FormCreate(Sender: TObject);
begin
  inherited;
  CargarComboCodigos;
  fraCO_CONTRATO.ShowBajas := True;
  SetLength( TotalImporte,  1);
end;

procedure TfrmPagosNoComisionables.CargarComboCodigos;
var
  sSql   : string;
  ID : TCadena;
begin
  sSql := 'SELECT cm_codigo mv_codigo, cm_descripcion mv_descripcion ' +
          '  FROM zcm_codigomovimiento ' +
          ' WHERE (cm_libro IN (''C'', ''R'') OR cm_codigo = ''505'') ' +
          '   AND cm_comisionable = ''N'' ' +
          '   AND cm_Concepto = ''C''';

  cmbMV_CODIGO.Items.Clear;
  OpenQuery ( sdqCombo, sSql, True );

  while not sdqCombo.Eof do
  begin
    ID := TCadena.Create();
    ID.Cadena := sdqCombo.FieldByName ( 'mv_codigo' ).AsString;
    cmbMV_CODIGO.Items.AddObject(ID.Cadena + '-' + sdqCombo.FieldByName ( 'mv_descripcion' ).AsString, ID);
    sdqCombo.Next;
  end;
end;

procedure TfrmPagosNoComisionables.fraEN_IDExit(Sender: TObject);
begin
  inherited;
  fraEN_ID.FrameExit(Sender);
  fraVE_ID.Entidad := fraEN_ID.Value;
end;

procedure TfrmPagosNoComisionables.tbNuevoClick(Sender: TObject);
begin
  if not sdqConsulta.Eof then
    if msgBox ('¿Está seguro de querer comisionar estos pagos?', MB_YESNO + MB_ICONQUESTION, 'Confirmación') = IDYES then
      PasarAComisionable
  else
    MessageDlg('No posee ningún registro seleccionado', mtError, [mbOK], 0);
end;

procedure TfrmPagosNoComisionables.PasarAComisionable;
var
  iloop : integer;
  sSql  : string;
  sEV_ID, sMO_SECUEN : string;
begin
  try
    BeginTrans;

    for iloop := 0 to Grid.SelectedRows.Count -1 do
    begin
      sdqConsulta.GotoBookmark( pointer( Grid.SelectedRows.Items[iloop]));

      sEV_ID     := sdqConsulta.FieldByName('EV_ID').AsString;
      sMO_SECUEN := sdqConsulta.FieldByName('MO_SECUEN').AsString;

      sSql := 'INSERT INTO XNC_PAGONOCOMISIONABLE ' +
              ' (NC_ID, NC_IDENTVEND, NC_IDMOVIM, NC_USUALTA, NC_FECHAALTA) ' +
              ' VALUES ' +
              ' (SEQ_XNC_ID.NEXTVAL, ' + sEV_ID + ', ' + sMO_SECUEN + ', ''' + frmPrincipal.DBLogin.UserId + ''', TRUNC(SYSDATE))';

      EjecutarSqlST ( sSql );
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg( E );
    end;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmPagosNoComisionables.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Menu:TpopUpMenu;
  Item : TMenuItem;
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

procedure TfrmPagosNoComisionables.btnDesMarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmPagosNoComisionables.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmPagosNoComisionables.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmPagosNoComisionables.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
  Buffer: array[0..63] of Char;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= 2) Then
    SetString(Value, Buffer, FloatToText(Buffer, TotalImporte[iPos], fvExtended, ffCurrency, 15, 2));
end;

procedure TfrmPagosNoComisionables.CalcTotales;
var
  PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      //Liquidacion
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active Then
      begin
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalImporte );
      end;
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmPagosNoComisionables.tbLimpiarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  fraEN_ID.Clear;
  fraVE_ID.Entidad := ART_EMPTY_ID;
  fraVE_ID.Clear;
  fraCO_CONTRATO.Clear;
  ppMO_PERIODODesde.Clear;
  ppMO_PERIODOHasta.Clear;
  cmbMV_CODIGO.Clear;
end;

procedure TfrmPagosNoComisionables.ppMO_PERIODOHastaEnter(Sender: TObject);
begin
  if ppMO_PERIODODesde.Periodo.Valor<>'' then
    ppMO_PERIODOHasta.Periodo.MinPeriodo := ppMO_PERIODODesde.Periodo.Valor
end;

procedure TfrmPagosNoComisionables.ppMO_PERIODODesdeEnter(Sender: TObject);
begin
  if ppMO_PERIODOHasta.Periodo.Valor<>'' then
    ppMO_PERIODODesde.Periodo.MaxPeriodo := ppMO_PERIODOHasta.Periodo.Valor;
end;

procedure TfrmPagosNoComisionables.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('mo_importe')).Currency := True;
  end;
end;

procedure TfrmPagosNoComisionables.fraVE_IDExit(Sender: TObject);
begin
  inherited;
  fraVE_ID.FrameExit(Sender);

  if fraVE_ID.IsSelected then
    fraEN_ID.Value := fraVE_ID.Entidad;
end;

end.
