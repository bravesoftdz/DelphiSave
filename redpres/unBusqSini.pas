unit unBusqSini;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, ToolEdit,
  RxLookup, Mask, Db, SDEngine, Buttons, ExtCtrls, CustomDlgs, ComCtrls, ToolWin, ImgList, General, Menus, CUIT,
  unFraTrabajadorSIN, ShortCutControl, IntEdit, unFraEmpresa, unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TdlgBusqSini = class(TForm)
    grpEmpresa: TGroupBox;
    grpTrabajador: TGroupBox;
    dbgBusqueda: TRxDBGrid;
    tbHerramientas: TToolBar;
    tbLimpiar: TToolButton;
    tbRefrescar: TToolButton;
    tbOrden: TToolButton;
    tbSeparador2: TToolButton;
    tbSalir: TToolButton;
    tbBuscar: TToolButton;
    sdqBusqueda: TSDQuery;
    dsBusqueda: TDataSource;
    pmnuOrden: TPopupMenu;
    mnuOrdSinOrdenRec: TMenuItem;
    mnuOrdTrabajador: TMenuItem;
    mnuOrdEmpresa: TMenuItem;
    N1: TMenuItem;
    Label1: TLabel;
    edDiagnostico: TEdit;
    ToolButton1: TToolButton;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaCODSINI: TStringField;
    sdqBusquedaEX_SINIESTRORED: TFloatField;
    sdqBusquedaEX_CONTRATO: TFloatField;
    sdqBusquedaEM_CUIT: TStringField;
    sdqBusquedaEM_NOMBRE: TStringField;
    sdqBusquedaTJ_CUIL: TStringField;
    sdqBusquedaTJ_NOMBRE: TStringField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaEX_BAJAMEDICA: TDateTimeField;
    sdqBusquedaEX_FECHARECAIDA: TDateTimeField;
    sdqBusquedaEX_ALTAMEDICA: TDateTimeField;
    sdqBusquedaTB_DESCRIPCION: TStringField;
    ShortCutControl: TShortCutControl;
    fraEmpresa: TfraEmpresa;
    sdqBusquedaEX_ID: TFloatField;
    Label2: TLabel;
    procedure tbBuscarClick(Sender: TObject);
    procedure sdqBusquedaAfterScroll(DataSet: TDataSet);
    procedure tbSalirClick(Sender: TObject);
    procedure mnuOrdenClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure dbgBusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgBusquedaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShortCutControlShortCuts3ShortCutPress(Sender: TObject);
  private
    procedure onFraEmpresaChange(Sender: TObject);
  public
    Cuil: String;
    Cuit: String;
    FechaAccidente: TDateTime;
    FechaRecaida: TDateTime;
    Orden: Cardinal;
    Recaida: Cardinal;
    Siniestro: Cardinal;
  end;

var
  dlgBusqSini: TdlgBusqSini;

implementation

uses
  unDmPrincipal, unPrincipal, unTercerizadoras, AnsiSql, unSesion;

{$R *.DFM}

procedure TdlgBusqSini.tbBuscarClick(Sender: TObject);
var
  Sql: String;
begin
  Sql := 'SELECT ex_siniestro, ex_orden, ex_recaida, ex_siniestro || ''/'' || ex_orden || ''/'' || ex_recaida codsini,' +
               ' ex_siniestrored, ex_contrato, em_cuit, em_nombre, tj_cuil, tj_nombre, ' +
               ' ex_diagnostico, ex_fechaaccidente, ex_bajamedica, ex_fecharecaida, ' +
               ' ex_altamedica, tb_descripcion, ex_id ' +
          ' FROM ctb_tablas, ctj_trabajador, aem_empresa, sex_expedientes' +
         ' WHERE NVL(LTRIM(ex_tipo), ''1'') = tb_codigo(+)' +
           ' AND tb_clave = ''STIPO''' +
           ' AND NOT NVL(ex_causafin, ''0'') IN (''99'', ''95'')' +
           ' AND em_cuit = ex_cuit' +
           ' AND tj_id = ex_idtrabajador';
  if (fraEmpresa.IsEmpty) and (fraTrabajadorSIN.mskTrabCUIL.Text = '') then
  begin
    if Sender <> nil then
      ChkDialog('BusqSiniPatBusq', 'No ha seleccionado ningún patrón de busqueda. No se podrán mostrar los siniestros.',
                'Error de Búsqueda', '', mtInformation);
    Sql := '';
  end;

  if fraEmpresa.Tercerizadoras then
   Sql := Sql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if fraEmpresa.IsSelected then
    Sql := Sql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.Cuit);
  if (Trim(fraTrabajadorSIN.mskTrabCUIL.Text) <> '') then
    Sql := Sql + ' AND ex_cuil = ' + SqlValue(fraTrabajadorSIN.mskTrabCUIL.Text);

  if (Sql <> '') and (Sql <> sdqBusqueda.Sql.Text) then
  begin
    Sql := Sql + ' ORDER BY ' + Switch(tbOrden.Tag,['EX_SINIESTRO, EX_ORDEN, EX_RECAIDA',
                                                    'EX_CUIL', 'EX_CUIT']);

    sdqBusqueda.Close;
    sdqBusqueda.Sql.Text := Sql;
    sdqBusqueda.Open;
    tbRefrescar.Enabled := True;
    if Visible then
      dbgBusqueda.SetFocus;
  end;
end;

procedure TdlgBusqSini.sdqBusquedaAfterScroll(DataSet: TDataSet);
begin
  fraEmpresa.Contrato := sdqBusqueda.FieldByName('EX_CONTRATO').AsInteger;

  fraTrabajadorSIN.mskTrabCuil.Text   := sdqBusquedaTJ_CUIL.AsString;
  fraTrabajadorSIN.dbcTrabNombre.Text := sdqBusquedaTJ_NOMBRE.AsString;

  edDiagnostico.Text := sdqBusquedaEX_DIAGNOSTICO.AsString;

  Siniestro      := sdqBusquedaEX_SINIESTRO.AsInteger;
  Orden          := sdqBusquedaEX_ORDEN.AsInteger;
  Recaida        := sdqBusquedaEX_RECAIDA.AsInteger;
  Cuit           := sdqBusqueda.FieldByName('EM_CUIT').AsString;
  Cuil           := sdqBusqueda.FieldByName('TJ_CUIL').AsString;
  FechaAccidente := sdqBusqueda.FieldByName('EX_FECHAACCIDENTE').AsDateTime;
  FechaRecaida   := sdqBusqueda.FieldByName('EX_FECHARECAIDA').AsDateTime;
end;

procedure TdlgBusqSini.tbSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TdlgBusqSini.mnuOrdenClick(Sender: TObject);
begin
  tbOrden.Tag := TMenuItem(Sender).Tag;
end;

procedure TdlgBusqSini.tbRefrescarClick(Sender: TObject);
begin
  if sdqBusqueda.Active then
  begin
    sdqBusqueda.Close;
    sdqBusqueda.Open;
  end;
end;

procedure TdlgBusqSini.tbLimpiarClick(Sender: TObject);
begin
  tbRefrescar.Enabled        := False;
  edDiagnostico.Text         := '';
  fraEmpresa.Clear;
  fraTrabajadorSIN.Limpiar;
  sdqBusqueda.Close;
end;

procedure TdlgBusqSini.dbgBusquedaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    dbgBusquedaDblClick(nil)
  else if Key = #27 then
    tbSalirClick(nil);
end;

procedure TdlgBusqSini.dbgBusquedaDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TdlgBusqSini.FormShow(Sender: TObject);
begin
   //  tbBuscarClick( Nil ); . Lo saqué porque buscaba dos veces(previa pregunta a Fede). by LU.
end;

procedure TdlgBusqSini.FormCreate(Sender: TObject);
begin
  fraEmpresa.OnChange             := onFraEmpresaChange;
  fraEmpresa.Tercerizadoras       := EsUsuarioDeTercerizadora;
  fraTrabajadorSIN.Tercerizadoras := fraEmpresa.Tercerizadoras;

  //---- El formulario es el 90% de la pantalla
  Height := Trunc(Screen.Height * 0.9);
  Width  := Trunc(Screen.Width * 0.9);

  grpEmpresa.Enabled := CheckStoreProc('AFI'); // Si el Paquete AFI está inválido desactiva la seleccion por empresa
end;

procedure TdlgBusqSini.ShortCutControlShortCuts3ShortCutPress(Sender: TObject);
begin
  tbOrden.CheckMenuDropdown;
end;

procedure TdlgBusqSini.onFraEmpresaChange(Sender: TObject);
begin
  fraTrabajadorSIN.CUIT := fraEmpresa.CUIT;
end;

end.
