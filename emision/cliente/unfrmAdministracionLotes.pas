unit unfrmAdministracionLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, ComCtrls, StdCtrls, Mask, PatternEdit,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, Buttons,
  unFraTipoGestion, unArtFrame, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, unConstEmision, unClassGestion, PeriodoPicker;

type

  TfrmAdministracionLotes = class(TfrmCustomGridABM)
    lblNroLote: TLabel;
    edNroLote: TPatternEdit;
    lblDescripcion: TLabel;
    gbGestoresDisponibles: TGroupBox;
    lstGestoresDisponibles: TListView;
    btnAgregarGestor: TButton;
    btnEliminarGestor: TButton;
    btnEliminarTodosGestores: TButton;
    gbGestoresAsignados: TGroupBox;
    lstGestoresAsignados: TListView;
    fraTiposGestion: TfraCodigoDescripcionExt;
    lblTipoGestion: TLabel;
    btnAgregarTodosGestores: TButton;
    edDescripcionLote: TEdit;
    tbGenerarAutomaticamente: TToolButton;
    sb: TStatusBar;
    lblPeriodo: TLabel;
    ppPeriodo: TPeriodoPicker;
    lblAsignadas: TLabel;
    edtDDJJAsignadas: TEdit;
    edtDDJJPendientes: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDDJJGestionVencida: TEdit;
    gbAdministracionLote: TGroupBox;
    lblTipoGestionFiltro: TLabel;
    fraTipoGestionFiltro: TfraCodigoDescripcionExt;
    lblPeriodoFiltro: TLabel;
    ppDesde: TPeriodoPicker;
    lblPeriodoHasta: TLabel;
    ppHasta: TPeriodoPicker;
    chkLotesActivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAgregarGestorClick(Sender: TObject);
    procedure btnEliminarGestorClick(Sender: TObject);
    procedure btnAgregarTodosGestoresClick(Sender: TObject);
    procedure btnEliminarTodosGestoresClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    procedure CargarGestoresAsignados(AidLote: integer);
    procedure CargarGestoresDisponibles(AidLote: integer = -1);
    procedure GuardarGestores(AidLote: integer);
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmAdministracionLotes: TfrmAdministracionLotes;

implementation

uses unDmPrincipal, unDmEmision, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs,
  unCustomConsulta;

{$R *.dfm}

procedure TfrmAdministracionLotes.CargarGestoresAsignados(AidLote: integer);
var
 Query : TSDQuery;
 ListItemAccion: TListItem;
begin
  try
    Query := GetQuery('select GL_USUARIO, GL_ID, us.se_nombre || '' ('' || usc.sc_descripcion || '')'' se_nombre ' +
                       'from emi.igl_gestorlote, art.use_usuarios us, art.usc_sectores usc ' +
                       'where us.se_idsector = usc.sc_id and gl_usuario = se_usuario and gl_idlote = ' + SqlValue(AidLote));
    if Query.RecordCount > 0 then
    begin
      while not Query.Eof do
      begin
        with lstGestoresAsignados do
        begin
          ListItemAccion := Items.Add;
          ListItemAccion.Caption := Query.fieldbyname('se_nombre').AsString;
          ListItemAccion.Data := TGestor.Create(Query.fieldbyname('GL_USUARIO').AsString, Query.fieldbyname('se_nombre').AsString);
        end;
        Query.Next;
      end;
    end;
  finally
      Query.Free;
  end;
end;

procedure TfrmAdministracionLotes.CargarGestoresDisponibles(AidLote: integer);
var
  Query : TSDQuery;
  ListItemAccion: TListItem;
begin
  lstGestoresAsignados.SortType := stData;
  lstGestoresDisponibles.SortType := stData;
  try
    Query := GetQuery('select se_usuario, us.se_nombre || '' ('' || usc.sc_descripcion || '')'' se_nombre ' +
                     'from art.use_usuarios us, art.usc_sectores usc ' +
                     'where us.se_idsector = usc.sc_id AND usc.sc_codigo IN(''COME'', ''EMI'') ' +
                     iif((AidLote<>-1), 'and not exists (select 1 from emi.igl_gestorlote where se_usuario = gl_usuario and gl_idlote = ' + SqlValue(AidLote) + ')', ''));

    if Query.RecordCount > 0 then
    begin
      while not Query.Eof do
      begin
        with lstGestoresDisponibles do
        begin
          ListItemAccion := Items.Add;
          ListItemAccion.Caption := Query.fieldbyname('se_nombre').AsString;
          ListItemAccion.Data := TGestor.Create(Query.fieldbyname('se_usuario').AsString, Query.fieldbyname('se_nombre').AsString);
        end;
        Query.Next;
      end;
    end;
  finally
      Query.Free;
  end;
end;

procedure TfrmAdministracionLotes.ClearControls;
begin
  inherited;
  edNroLote.Clear;
  edDescripcionLote.Clear;
  lstGestoresDisponibles.Clear;
  lstGestoresAsignados.Clear;
  fraTiposGestion.Limpiar;
  ppPeriodo.Clear;
  CargarGestoresDisponibles;
end;

function TfrmAdministracionLotes.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('LO_ID', sdqConsulta.FieldByName('LO_ID').AsInteger );
      Sql.Fields.Add('LO_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('LO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('LO_DESCRIPCION', edDescripcionLote.Text);
      Sql.Fields.Add('LO_IDTIPOGESTION', fraTiposGestion.Codigo);
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('LO_ID', GetSecNextVal('emi.seq_ilo_id'));
        Sql.Fields.Add('LO_PERIODOGESTION', ppPeriodo.Periodo.Valor );
        Sql.Fields.Add('LO_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('LO_FECHAALTA', exDateTime );

      end else begin
        Sql.PrimaryKey.Add('LO_ID', sdqConsulta.FieldByName('LO_ID').AsInteger);
        Sql.Fields.Add('LO_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('LO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('LO_USUBAJA', exNull );
        Sql.Fields.Add('LO_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    GuardarGestores(Sql.PrimaryKey[0].Value);
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el lote.');
    end;
  end;
end;


procedure TfrmAdministracionLotes.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'LO_FECHABAJA';
  Sql.TableName := 'EMI.ILO_LOTE';
  CheckPK := True;

  with fraTipoGestionFiltro do
  begin
    TableName := 'EMI.ITG_TIPOGESTION';
    FieldID := 'TG_ID';
    FieldCodigo := 'TG_ID';
    FieldDesc := 'TG_DESCRIPCION';
    ShowBajas := true;
    FieldBaja := 'TG_FECHABAJA';
  end;
  
  with fraTiposGestion do
  begin
    TableName := 'EMI.ITG_TIPOGESTION';
    FieldID := 'TG_ID';
    FieldCodigo := 'TG_ID';
    FieldDesc := 'TG_DESCRIPCION';
    ShowBajas := true;
    FieldBaja := 'TG_FECHABAJA';
  end;
end;

procedure TfrmAdministracionLotes.LoadControls;
begin
  inherited;
  edNroLote.Text := sdqConsulta.fieldbyname('LO_ID').AsString;
  edDescripcionLote.Text := sdqConsulta.fieldbyname('LO_DESCRIPCION').AsString;
  fraTiposGestion.Codigo := sdqConsulta.fieldbyname('LO_IDTIPOGESTION').AsString;
  ppPeriodo.Periodo.Valor := sdqConsulta.fieldbyname('LO_PERIODOGESTION').AsString;;
  CargarGestoresDisponibles(sdqConsulta.fieldbyname('LO_ID').AsInteger);
  CargarGestoresAsignados(sdqConsulta.fieldbyname('LO_ID').AsInteger);
end;

function TfrmAdministracionLotes.Validar: Boolean;
begin
    Result := VerificarMultiple(['Administración de Lotes',
                                  edDescripcionLote, not IsEmptyString(edDescripcionLote.text), 'Debe especificar la descripción del lote.',
                                  lstGestoresAsignados, (lstGestoresAsignados.Items.Count > 0), 'Debe especificar algún gestor al lote.',
                                  fraTiposGestion, fraTiposGestion.IsSelected , 'Debe especificar el tipo de gestión para el lote.'
                                ]);
end;

procedure TfrmAdministracionLotes.GuardarGestores(AidLote: integer);
var
  i: integer;
begin
  EjecutarSqlST('DELETE FROM EMI.IGL_GESTORLOTE WHERE GL_IDLOTE =' + SqlValue(AidLote));
  for i:= 0 to lstGestoresAsignados.Items.Count-1 do
    EjecutarSqlST('INSERT INTO EMI.IGL_GESTORLOTE(GL_ID, GL_IDLOTE, GL_USUARIO) VALUES (emi.seq_igl_id.nextval, ' + SqlValue(AidLote) + ',' + SqlValue(TGestor(lstGestoresAsignados.Items[i].Data).Usuario) + ')');
end;

procedure TfrmAdministracionLotes.fpAbmClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: integer;
begin
  for i:= 0 to lstGestoresAsignados.Items.Count-1 do
    TGestor(lstGestoresAsignados.Items[i].Data).Free;

  for i:= 0 to lstGestoresDisponibles.Items.Count-1 do
    TGestor(lstGestoresDisponibles.Items[i].Data).Free;

  lstGestoresAsignados.Clear;
  lstGestoresDisponibles.Clear;
  inherited;
end;

procedure TfrmAdministracionLotes.btnAgregarGestorClick(Sender: TObject);
begin
  if lstGestoresDisponibles.SelCount > 0 then
  begin
    lstGestoresAsignados.IconOptions.WrapText := false;
    lstGestoresDisponibles.MoveSelection(lstGestoresAsignados);
    lstGestoresAsignados.IconOptions.WrapText := true;
  end;
end;

procedure TfrmAdministracionLotes.btnEliminarGestorClick(Sender: TObject);
begin
  if lstGestoresAsignados.SelCount > 0 then
  begin
    lstGestoresDisponibles.IconOptions.WrapText := false;
    lstGestoresAsignados.MoveSelection(lstGestoresDisponibles);
    lstGestoresDisponibles.IconOptions.WrapText := true;
  end;
end;

procedure TfrmAdministracionLotes.btnAgregarTodosGestoresClick(
  Sender: TObject);
begin
  lstGestoresDisponibles.SelectAll;
  lstGestoresAsignados.IconOptions.WrapText := false;
  lstGestoresDisponibles.MoveSelection(lstGestoresAsignados);
  lstGestoresAsignados.IconOptions.WrapText := true;
end;

procedure TfrmAdministracionLotes.btnEliminarTodosGestoresClick(
  Sender: TObject);
begin
  lstGestoresAsignados.SelectAll;
  lstGestoresDisponibles.IconOptions.WrapText := false;
  lstGestoresAsignados.MoveSelection(lstGestoresDisponibles);
  lstGestoresDisponibles.IconOptions.WrapText := true;
end;

procedure TfrmAdministracionLotes.tbRefrescarClick(Sender: TObject);
var
 sSql : String;
begin
  sSql :=  'SELECT ILO.*, (SELECT COUNT(*) FROM EMI.ILD_LOTEDDJJ ILD ' +
           '     WHERE ILD.ld_idlote = ILO.LO_ID) AS DDJJ_ASIGNADAS, ' +
           '    (SELECT COUNT(*) FROM  EMI.ILD_LOTEDDJJ ILD          ' +
           '     WHERE ILD.ld_idlote = ILO.LO_ID AND LD_FECHAFINALGESTION IS NULL) AS PENDIENTES,' +
           '    (SELECT COUNT(*) FROM  EMI.ILD_LOTEDDJJ ILD' +
           '     WHERE ILD.ld_idlote = ILO.LO_ID AND LD_FECHAFINALGESTION IS NULL AND' +
           '           LD_FECHAVENCIMIENTOGESTION > SYSDATE) AS GESTIONVENCIDAS' +
           ' FROM EMI.ILO_LOTE ILO ' +
           'WHERE 1 = 1 ';

  if (ppDesde.Periodo.Valor <> '') and (ppHasta.Periodo.Valor = '') then
    sSql := sSql  + ' AND (LO_PERIODOGESTION = ' + SqlValue(ppDesde.Periodo.Valor) + ') '
  else   if (ppDesde.Periodo.Valor <> '') and (ppHasta.Periodo.Valor <> '') then 
    sSql := sSql  + ' AND (LO_PERIODOGESTION BETWEEN ' +
                           SqlValue(ppDesde.Periodo.Valor) + ' AND ' +
                           SqlValue(ppHASTA.Periodo.Valor)  + ') ';


  if chkLotesActivos.Checked then
    sSql := sSql  + ' AND (LO_ACTIVO = ''S'') ';

  if fraTipoGestionFiltro.IsSelected then
    sSql := sSql + ' AND (LO_IDTIPOGESTION = '  + SqlValue(fraTipoGestionFiltro.Codigo) +  ')';

  sdqConsulta.SQL.Text := sSql;


  inherited;

end;

end.
