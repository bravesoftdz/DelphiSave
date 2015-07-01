unit unSeleccionarEmpresasAccion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, Db, SDEngine, ExtCtrls, Menus, StdCtrls, Buttons, ComCtrls, Mask, PatternEdit, CardinalEdit, ToolWin,
  FormPanel, ShortCutControl;

type
  TfrmSeleccionarEmpresasAccion = class(TForm)
    sdqEmpresas: TSDQuery;
    dsEmpresas: TDataSource;
    Panel1: TPanel;
    GridEmpresas: TArtDBGrid;
    pmnuMarcar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Panel3: TPanel;
    edCantContratos: TCardinalEdit;
    Panel4: TPanel;
    edTotalContratos: TCardinalEdit;
    tbCalcularTotal: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    fpBusqueda: TFormPanel;
    lbCuitBusqueda: TLabel;
    edCUITBusqueda: TMaskEdit;
    cmdBuscar: TButton;
    cmdCerrar: TButton;
    tbBuscar: TToolButton;
    ShortCutControl: TShortCutControl;
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure GridEmpresasCellClick(Column: TColumn);
    procedure GridEmpresasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure fpBusquedaEnter(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
  private
    FSeleccion: TTableId;
    
    procedure CalcularCantTotalReg;
    procedure CalcularFilasSel;
    procedure InicializarContadores(ActualizarCantContratos: Boolean);
  public
    function Do_CargarDatos: Boolean;
    function InsertarRegTemporal: Boolean;
    function Validar: Boolean;
    
    property Seleccion: TTableId read FSeleccion write FSeleccion;    
  end;

implementation

uses
  AnsiSql, unDmPrincipal, SqlFuncs, unComunes, CustomDlgs, unPrincipal, unCobranzas;

{$R *.DFM}

function TfrmSeleccionarEmpresasAccion.Do_CargarDatos: Boolean;
var
  IdUltAccion: TTableId;
  sCondicionContratos: String;
  sSql: String;
  sTablaContratos: String;
begin
  IdUltAccion := Get_IdUltAccionEjecutada(Seleccion);

  if IdUltAccion = ART_EMPTY_ID then
  begin
    sTablaContratos     := ', ZCS_CONTRATOSELECCIONADOPLAN' ;
    sCondicionContratos := ' AND CS_IDSELECCIONPLAN = ' + SqlValue(Seleccion) +
                           ' AND CS_FECHABAJA IS NULL' +
                           ' AND CS_CONTRATO = CO_CONTRATO';
  end
  else
  begin
    sTablaContratos     :=', ZSC_SELECCIONCONTRACCIONPLAN';
    sCondicionContratos := ' AND SC_IDSELECCIONPLAN = ' + SqlValue(Seleccion) +
                           ' AND SC_IDACCIONPLAN = ' + SqlValue(IdUltAccion) +
                           ' AND SC_CONTRATO = CO_CONTRATO';
    end;

  sSql :=
    'SELECT EM_CUIT CUIT, EM_NOMBRE RSOCIAL, CO_CONTRATO CONTRATO, CA_NROCARTADOC NROCARTADOC,' +
          ' CA_FECHAIMPRESION FECHAIMPRESION, CA_FECHARECEPCION FECHARECEPCION, CA_RECEPCIONOK RECEPCIONOK,' +
          ' DESCRRECEPCION' +
     ' FROM (SELECT CO_CONTRATO CONTRATO, CA_NROCARTADOC, CA_FECHAIMPRESION, CA_FECHARECEPCION, CA_RECEPCIONOK,' +
                  ' CTBCODRECEP.TB_DESCRIPCION DESCRRECEPCION' +
             ' FROM CTB_TABLAS CTBCODRECEP, AEN_ENDOSO, CCA_CARTA, ACO_CONTRATO' + sTablaContratos +
            ' WHERE CTBCODRECEP.TB_CLAVE(+) = ''CODRE''' +
              ' AND CTBCODRECEP.TB_CODIGO(+) = CA_CODRECEPCION' +
                    sCondicionContratos +
              ' AND EN_CONTRATO = CO_CONTRATO' +
              ' AND CA_IDENDOSO = EN_ID' +
              ' AND CA_ID = DEUDA.GET_ULTCARTADOCSELECCION(' + SqlValue(Seleccion) + ', CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_RESCISION) + ')),' +
          ' AEM_EMPRESA, ACO_CONTRATO' + sTablaContratos +
    ' WHERE CO_IDEMPRESA = EM_ID ' + sCondicionContratos +
      ' AND CO_CONTRATO = CONTRATO(+)' +
 ' ORDER BY CO_CONTRATO';

  sdqEmpresas.SQL.Text := sSql;
  OpenQuery(sdqEmpresas);

  InicializarContadores(True);

  Result := (ShowModal = mrOk);
end;

procedure TfrmSeleccionarEmpresasAccion.mnuMarcarTodosClick(Sender: TObject);
begin
  GridEmpresas.SelectAll;
  CalcularFilasSel;
end;

procedure TfrmSeleccionarEmpresasAccion.mnuDesmarcarTodosClick(Sender: TObject);
begin
  GridEmpresas.UnselectAll;
  InicializarContadores(True);
end;

procedure TfrmSeleccionarEmpresasAccion.CalcularFilasSel;
begin
  edCantContratos.Value := GridEmpresas.SelectedRows.Count;
end;

procedure TfrmSeleccionarEmpresasAccion.InicializarContadores(ActualizarCantContratos: Boolean);
begin
  edCantContratos.Value := 0;

  if ActualizarCantContratos then
    CalcularCantTotalReg;
end;

procedure TfrmSeleccionarEmpresasAccion.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSeleccionarEmpresasAccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOk then
    if MsgBox('Al cancelar el evento, no se ejecutarán los eventos siguientes de la acción. ¿ Confirma ?', MB_OKCANCEL + MB_ICONQUESTION ) = IDOK then
    begin
      ModalResult := mrCancel;
      Action := caFree
    end
    else
      Action := caNone;
end;

procedure TfrmSeleccionarEmpresasAccion.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularCantTotalReg;
end;

procedure TfrmSeleccionarEmpresasAccion.CalcularCantTotalReg;
begin
  if sdqEmpresas.Active and tbCalcularTotal.Down then
    edTotalContratos.Value := sdqEmpresas.RecordCount
  else
    edTotalContratos.Value := 0;
end;

procedure TfrmSeleccionarEmpresasAccion.GridEmpresasCellClick(Column: TColumn);
begin
  CalcularFilasSel;
end;

procedure TfrmSeleccionarEmpresasAccion.GridEmpresasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilasSel;
end;

procedure TfrmSeleccionarEmpresasAccion.btnAceptarClick(Sender: TObject);
begin
  if Validar then
    if InsertarRegTemporal then
      ModalResult := mrOk;
end;

function TfrmSeleccionarEmpresasAccion.Validar: Boolean;
begin
  Result := False;

  if GridEmpresas.SelectedRows.Count = 0 then
    MsgBox('Debe seleccionar registros en la grilla.', MB_OK + MB_ICONERROR)
  else
    Result := True;
end;

function TfrmSeleccionarEmpresasAccion.InsertarRegTemporal: Boolean;
var
  i: Integer;
  sSql: String;
  sUsuario: String;
begin
  try
    sUsuario := frmPrincipal.DBLogin.UserID;

    sSql :=
      'DELETE FROM TAC_ANULACRESCISIONCONTRATO' +
           ' WHERE AC_USUARIO = :p1';
    EjecutarSqlSTEx(sSql, [sUsuario]);

    for i := 0 to GridEmpresas.SelectedRows.Count - 1 do
    begin
      sdqEmpresas.GotoBookmark(Pointer(GridEmpresas.SelectedRows.Items[i]));

      sSql :=
        'INSERT INTO TAC_ANULACRESCISIONCONTRATO(AC_USUARIO, AC_CONTRATO)' +
                                        ' VALUES(:p1, :p2)';
      EjecutarSqlSTEx(sSql, [sUsuario, sdqEmpresas.FieldByName('CONTRATO').AsInteger]);
    end;

    Result := True;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al generar la tabla temporal de contratos seleccionados.');
      Result := False;
    end;
  end;
end;

procedure TfrmSeleccionarEmpresasAccion.cmdBuscarClick(Sender: TObject);
var
  bEncontrado: Boolean;
begin
  if sdqEmpresas.Active then
  begin
    bEncontrado := sdqEmpresas.Locate('CUIT', edCUITBusqueda.Text, [loCaseInsensitive, loPartialKey]);

    if bEncontrado then
    begin
      GridEmpresas.SelectedRows.CurrentRowSelected := True;
      cmdCerrar.SetFocus;
    end
    else
      MsgBox('No se ha encontrado el CUIT en la grilla.');
  end
  else
    MsgBox('No hay registros cargados en la grilla.');
end;

procedure TfrmSeleccionarEmpresasAccion.fpBusquedaEnter(Sender: TObject);
begin
  edCUITBusqueda.Clear;
end;

procedure TfrmSeleccionarEmpresasAccion.tbBuscarClick(Sender: TObject);
begin
  fpBusqueda.ShowModal;
end;

end.
