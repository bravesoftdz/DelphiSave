unit unModificaTraspasoEgresos;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-01-03  (?)
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, ShortCutControl, Db, SDEngine, StdCtrls, CurrEdit, Mask, ToolEdit, unArt, DateComboBox,
  QRPrntr, LookupDialog, ExtCtrls, QueryPrint, IntEdit, unArtFrame, unArtDbFrame, unFraEmpresa, PatternEdit, SortDlg,
  unArtDBAwareFrame, artSeguridad;

type
  TfrmModificaTraspasoEgresos = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tlbBaja: TToolButton;
    tblSeparador2: TToolButton;
    tlbModificacion: TToolButton;
    tlbSalir: TToolButton;
    ArtDBGrid: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    sdqCargaDatos: TSDQuery;
    dsCargaDatos: TDataSource;
    tbImprimir: TToolButton;
    ToolButton3: TToolButton;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    fraEmpresa: TfraEmpresa;
    lbCUIT: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edEmpleados: TIntEdit;
    edDeudaActual: TCurrencyEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    SortDialog: TSortDialog;
    Label3: TLabel;
    edARTFutura: TEdit;
    Seguridad: TSeguridad;
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbModificacionClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
  private
    FIdArtFutura: TTableId;

    procedure LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
  public
    function DoCargaDatos(aIdContrato, aIdArtFutura: TTableID): Boolean;
  end;

var
  frmModificaTraspasoEgresos: TfrmModificaTraspasoEgresos;

implementation

uses
  General, CustomDlgs, unPrincipal, AnsiSQL, unDmPrincipal, SqlFuncs, unEventosTraspasoEgreso, unFrmConsultaCarta;

{$R *.DFM}

function TfrmModificaTraspasoEgresos.DoCargaDatos(aIdContrato, aIdArtFutura: TTableID): Boolean;
var
  sSql: String;
begin
  Result := True;
  
  FIdArtFutura := aIdArtFutura;
  try
    // Cargar datos de edits superiores
    sSql :=
      'SELECT em_cuit, em_nombre, em_id, deuda.get_deuda(co_contrato) deuda,' +
            ' nomina.get_empleados(co_contrato, cobranza.get_ultperiododevengado(''D'')) empleados' +
       ' FROM aco_contrato, aem_empresa' +
      ' WHERE em_id = co_idempresa' +
        ' AND co_contrato = :contrato';
    with GetQueryEx(sSql, [aIdContrato]) do
    try
      fraEmpresa.Value    := FieldByName('em_id').AsInteger;
      edDeudaActual.Value := FieldByName('deuda').AsFloat;
      edARTFutura.Text    := ValorSqlEx('SELECT ar_nombre FROM aar_art WHERE ar_id = :art', [FIdArtFutura]);
      edEmpleados.Value   := FieldByName('empleados').AsInteger;
    finally
      Free;
    end;

    // Cargar datos de grilla
    sdqCargaDatos.SQL.Text :=
      'SELECT te_id, te_contrato, te_codigo, tb_descripcion AS tipo_de_evento, te_fecha, te_observaciones, te_deuda,' +
            ' te_deudanominal, te_intereses, te_consolidado, te_fechageneracion, co_idformulario, te_fechabaja,' +
            ' te_usubaja, te_rgrl, (SELECT art.afiliacion.get_aplicaincumplimiento(co_contrato)' +
                                    ' FROM DUAL) rgrlhoy, '+
            ' te_clausulargrl, te_fechaalta' +  
       ' FROM ate_traspasoegreso, ctb_tablas, aco_contrato' +
      ' WHERE te_codigo = tb_codigo' +
        ' AND tb_clave = ''EVTEG''' +
        ' AND te_contrato = co_contrato' +
        ' AND te_contrato = :contrato' +
        ' AND te_idartfutura = :idartfutura' +
   ' ORDER BY te_fechaalta';
   //Pedido de evila via email del 16/01/2014.
   //En este módulo de Traspaso Egreso le podrás agregar la columna de Fecha de Alta y ordenar la grilla por este dato.
    OpenQueryEx(sdqCargaDatos, [aIdContrato, aIdArtFutura]);
  except
    on E: exception do
    begin
      ErrorMsg(E, 'Ocurrió un error en la recuperación de datos.');
      Result := false;
    end;
  end;
end;

procedure TfrmModificaTraspasoEgresos.tlbNuevoClick(Sender: TObject);
begin
  with TfrmEventosTraspasoEgreso.Create(Self) do
  try
    DoCargarDatos(sdqCargaDatos.FieldByName('te_contrato').AsInteger, FIdArtFutura, fsAgregar);
    ShowModal;
    sdqCargaDatos.Close;
    OpenQuery(sdqCargaDatos);
  finally
    Free;
  end;
end;

procedure TfrmModificaTraspasoEgresos.tlbBajaClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqCargaDatos.FieldByName('te_fechabaja').IsNull, tlbBaja, 'No se puede eliminar un evento ya eliminado.');

  if sdqCargaDatos.FieldByName('te_codigo').AsString = '001' then
  begin
    sSql :=
      'SELECT MAX(te_id)' +
       ' FROM ate_traspasoegreso' +
      ' WHERE te_contrato = :contrato';
    Verificar((ValorSqlIntegerEx(sSql, [sdqCargaDatos.FieldByName('te_contrato').AsInteger], 0) <> sdqCargaDatos.FieldByName('te_id').AsInteger), tlbBaja, 'No se puede eliminar el evento seleccionado.');
  end;

  if MsgBox('¿ Realmente desea eliminar el evento seleccionado ?', MB_YESNO) = mrNo then
    Abort;

  try
    sSql :=
      'UPDATE ate_traspasoegreso' +
        ' SET te_usubaja = :usuario,' +
            ' te_fechabaja = SYSDATE' +
      ' WHERE te_id = :id';
    EjecutarSqlEx(sSql, [frmPrincipal.DBLogin.UserId, sdqCargaDatos.FieldByName('te_id').AsInteger]);
    
    sdqCargaDatos.Close;
    OpenQuery(sdqCargaDatos);
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Se produjo un error en la baja.');
    end;
  end;
end;

procedure TfrmModificaTraspasoEgresos.tlbModificacionClick(Sender: TObject);
begin
  if not sdqCargaDatos.IsEmpty then
  begin
    if not sdqCargaDatos.FieldByName('te_fechabaja').IsNull then
    begin
      MsgBox('No se puede modificar un evento eliminado.');
      Abort;
    end;

    with TfrmEventosTraspasoEgreso.Create(Self) do
    try
      DoCargarDatos(sdqCargaDatos.FieldByName('te_id').AsInteger, FIdArtFutura, fsModificar);
      ShowModal;
      sdqCargaDatos.Close;
      OpenQuery(sdqCargaDatos);
    finally
      Free;
    end;
  end;
end;

procedure TfrmModificaTraspasoEgresos.tbImprimirClick(Sender: TObject);
var
  sAuxiliar: String;
begin
  sAuxiliar := IIF(fraEmpresa.mskCUIT.Text <> '', 'C.U.I.T.: ' + fraEmpresa.mskCUIT.Text + ' ', '') +
               IIF(fraEmpresa.cmbRSocial.Text <> '', 'Razón Social: ' + fraEmpresa.cmbRSocial.Text + ' ', '') +
               IIF(not fraEmpresa.edContrato.IsEmpty, 'Contrato: ' + IntToStr(fraEmpresa.edContrato.Value), '');
  if sAuxiliar <> '' then
    QueryPrint.SubTitle.Lines.Add(sAuxiliar);
  sAuxiliar := 'Deuda: ' + edDeudaActual.Text + ' ' +
               'Empleados: ' + IntToStr(edEmpleados.Value);
  QueryPrint.SubTitle.Lines.Add(sAuxiliar);
  with QueryPrint do
  try
    if sdqCargaDatos.Active and (not sdqCargaDatos.IsEmpty) and PrintDialog.Execute then
    begin
      SetGridColumns(ArtDBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);
      Title.Text := Caption;
      Print;
    end;
  finally
    SubTitle.Lines.Clear;
    Fields.Clear;
  end;
end;

procedure TfrmModificaTraspasoEgresos.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModificaTraspasoEgresos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmModificaTraspasoEgresos := nil;
end;

procedure TfrmModificaTraspasoEgresos.ToolButton1Click(Sender: TObject);
begin
  with TfrmConsultaCarta.Create(Self) do
  try
    DoCargaCartas(sdqCargaDatos.FieldByName('co_idformulario').AsInteger);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificaTraspasoEgresos.LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
var
  iLoop: Integer;
begin
  if aSortFields.Count = 0 then
    for iLoop := 0 to aColumns.Count - 1 do
      with aSortFields.Add do
      begin
        Title     := aColumns[iLoop].Title.Caption;
        DataField := aColumns[iLoop].FieldName;

        if Assigned(aColumns[iLoop].Field) then
          FieldIndex := aColumns[iLoop].Field.FieldNo;
      end;
end;

procedure TfrmModificaTraspasoEgresos.ToolButton4Click(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, ArtDBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmModificaTraspasoEgresos.FormCreate(Sender: TObject);
begin
  inherited;
  
  fraEmpresa.ShowBajas := True;
end;

procedure TfrmModificaTraspasoEgresos.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                             var Background: TColor; Highlight: Boolean);
begin
  inherited;
  
  // Poner en rojo los registros que tengan "Fecha de Baja"
  if not sdqCargaDatos.FieldByName('te_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed)
end;

end.
