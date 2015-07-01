unit unManCTC_TEXTOCARTA_EMI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unManCTC_TEXTOCARTA, Menus, SDEngine, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, DateComboBox, ExtCtrls, Buttons, Mask,
  ToolEdit, StdCtrls, unFraStaticCodigoDescripcion, RxRichEd,
  unFraToolbarRTF, ComCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraCtbTablas, FormPanel, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, unDmPrincipal,
  unManParametrosManualesCarta;

type
  TfrmManCTC_TEXTOCARTA_EMI = class(TfrmManCTC_TEXTOCARTA)
    fraGestionable: TfraCodigoDescripcion;
    Label10: TLabel;
    fraModoNotificacion: TfraCodigoDescripcion;
    Label11: TLabel;
    Label12: TLabel;
    fraModoNotificacionFiltro: TfraCodigoDescripcion;
    Label13: TLabel;
    fraItemGestionFiltro: TfraCodigoDescripcion;
    fraCodigoCodFirmante: TfraStaticCodigoDescripcion;
    Label14: TLabel;
    tsParametrosManuales: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure fraModoNotificacionChange(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FModoNotificacionAnt: integer;
    FGestionableAnt: integer;
    FSqlBase: String;
    FfrmManParametrosManualesCarta: TfrmManParametrosManualesCarta;
  protected
    procedure CargarVariables(LimpiarAnteriores: Boolean = True); override;
    procedure ActualizarTextoCarta(const aQuery: TSDQuery); override;
    function Validar: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
    procedure ClearControls; override;
  public
    { Public declarations }
  end;

var
  frmManCTC_TEXTOCARTA_EMI: TfrmManCTC_TEXTOCARTA_EMI;

implementation

uses
  AnsiSql, unSesion, CustomDlgs, unCustomConsulta;

{$R *.dfm}

{ TfrmManCTC_TEXTOCARTA_EMI }

procedure TfrmManCTC_TEXTOCARTA_EMI.ActualizarTextoCarta(
  const aQuery: TSDQuery);
begin
  inherited;
  EjecutarSqlST(' update emi.igs_gestionablesalida ' +
                ' set gs_fechabaja = sysdate, ' +
                '     gs_usubaja = ' + SqlValue(Sesion.LoginName) +
                ' where gs_idgestionable = ' + SqlValue(FGestionableAnt) +
                ' and gs_idmodonotificacion = ' + SqlValue(FModoNotificacionAnt));

  if fraModoNotificacion.IsSelected then
  begin
    if ExisteSql(' select 1 ' +
                 ' from emi.igs_gestionablesalida ' +
                 ' where gs_idgestionable = ' + SqlValue(fraGestionable.Value) +
                 ' and gs_idmodonotificacion = ' +SqlValue(fraModoNotificacion.Value)) then
      EjecutarSqlST(' update emi.igs_gestionablesalida ' +
                    ' set gs_idcartatexto = ' + SqlValue(aQuery.FieldByName('ht_idtextocarta').AsInteger) + ', ' +
                    '     gs_idfirmante = ' + SqlValue(fraCodigoCodFirmante.Value) + ', ' +
                    '     gs_fechamodif = sysdate, ' +
                    '     gs_usumodif = ' +  SqlValue(Sesion.LoginName) + ', ' +
                    '     gs_fechabaja = null, ' +
                    '     gs_usubaja = null ' +
                    ' where gs_idgestionable = ' + SqlValue(fraGestionable.Value) +
                    ' and gs_idmodonotificacion = ' + SqlValue(fraModoNotificacion.Value))
    else
      EjecutarSqlST(' insert into emi.igs_gestionablesalida(gs_idgestionable, gs_idmodonotificacion, gs_idcartatexto, ' +
                    '                                       gs_idfirmante, gs_fechaalta, gs_usualta) ' +
                    ' values ( ' + SqlValue(fraGestionable.Value) + ', ' + SqlValue(fraModoNotificacion.Value) + ', ' + SqlValue(aQuery.FieldByName('ht_idtextocarta').AsInteger) + ', ' +
                    SqlValue(fraCodigoCodFirmante.Value) + ', ' + ' sysdate, ' + SqlValue(Sesion.LoginName) + ')' );
  end;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.CargarVariables(
  LimpiarAnteriores: Boolean);
//var
//  MenuItem: TMenuItem;
begin
  inherited;
  sdqAreas.First;
  while not sdqAreas.Eof do
  begin
    if sdqAreas.FieldByName('TA_FECHABAJA').IsNull and (Trim(sdqAreas.FieldByName('SQL').AsString) <> '')then
    begin
      if pmnuVariables.Items.Count > 0 then
      begin
        MenuItem := TMenuItem.Create(pmnuVariables);
        MenuItem.Caption := '-';
        pmnuVariables.Items.Add(MenuItem);
      end;

      with GetQueryEx('SELECT * ' +
                      'FROM COMUNES.CCP_CARTAPARAMETRO ' +
                      'WHERE CP_FECHABAJA IS NULL ' +
                      '  AND CP_IDTEXTOCARTA = :idTextoCarta ', [sdqAreas.FieldByName('TA_IDTEXTOCARTA').AsInteger]) do
      try
        while not EOF do
        begin
          MenuItem := TMenuItem.Create(pmnuVariables);
          MenuItem.Caption := Fieldbyname('CP_NOMBRE').AsString;
          MenuItem.OnClick := mnuVariableClick;
          pmnuVariables.Items.Add(MenuItem);
          Next;
        end;
      finally
        free;
      end;
    end;
    sdqAreas.Next
  end;

(*
  if sdqAreas.FieldByName('TA_FECHABAJA').IsNull then
  begin
    if pmnuVariables.Items.Count > 0 then
    begin
      MenuItem := TMenuItem.Create(pmnuVariables);
      MenuItem.Caption := '-';
      pmnuVariables.Items.Add(MenuItem);
    end;

    with GetQueryEx('SELECT * ' +
                    'FROM COMUNES.CCP_CARTAPARAMETRO ' +
                    'WHERE CP_FECHABAJA IS NULL ' +
                    '  AND CP_IDAREATEXTO = :idAreaTexto ', [sdqAreas.FieldByName('TA_IDAREATEXTO').AsInteger]) do
    try
      while not EOF do
      begin
        MenuItem := TMenuItem.Create(pmnuVariables);
        MenuItem.Caption := Fieldbyname('CP_NOMBRE').AsString;
        MenuItem.OnClick := mnuVariableClick;
        pmnuVariables.Items.Add(MenuItem);
        Next;
      end;
    finally
      free;
    end;
  end;
*)
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.ClearControls;
begin
  inherited;
  FfrmManParametrosManualesCarta.IdTextoCarta := 0;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.FormCreate(Sender: TObject);
begin
  inherited;
  FSqlBase := sdqConsulta.SQL.Text;

  with fraGestionable do
  begin
    TableName := 'emi.ige_gestionable';
    FieldID := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc := 'ge_descripcion';
    FieldBaja := 'ge_fechabaja';
    ExtraCondition := ' AND 1 = 2 ';
    ShowBajas := true;
  end;

  with fraModoNotificacion do
  begin
    TableName := 'comunes.cmn_modonotificacion';
    FieldID := 'mn_id';
    FieldCodigo := 'mn_codigo';
    FieldDesc := 'mn_descripcion';
    ExtraCondition := ' and mn_codigo in (''F'',''V'', ''C'') ';
    OnChange := fraModoNotificacionChange;
  end;

  with fraItemGestionFiltro do
  begin
    TableName := 'emi.ige_gestionable';
    FieldID := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc := 'ge_descripcion';
    FieldBaja := 'ge_fechabaja';
    ShowBajas := true;
  end;

  with fraModoNotificacionFiltro do
  begin
    TableName := 'comunes.cmn_modonotificacion';
    FieldID := 'mn_id';
    FieldCodigo := 'mn_codigo';
    FieldDesc := 'mn_descripcion';
    ExtraCondition := ' and mn_codigo in (''F'',''V'', ''C'') ';
  end;

  with fraCodigoCodFirmante do
  begin
    TableName   := 'CFI_FIRMA';
    FieldID     := 'FI_ID';
    FieldCodigo := 'FI_ID';
    FieldDesc   := 'FI_FIRMANTE';
    FieldBaja   := 'FI_FECHABAJA';
    ShowBajas   := false;
  end;

  FfrmManParametrosManualesCarta := TfrmManParametrosManualesCarta.Create(self);
  with FfrmManParametrosManualesCarta do
  begin
    FormStyle := fsNormal;
    tbSalir.Visible := false;
    Parent := tsParametrosManuales;
    Align := alClient;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.fraModoNotificacionChange(
  Sender: TObject);
begin
  fraGestionable.Clear;
  if fraModoNotificacion.IsSelected then
    fraGestionable.ExtraCondition := ' and not exists (select 1 ' +
                                     '                 from emi.igs_gestionablesalida ' +
                                     '                 where gs_idgestionable = ge_id ' +
                                     '                   and gs_idcartatexto <> ' + SqlValue(SqlValue(sdqHistorico.FieldByName('ht_idtextocarta').AsInteger)) +
                                     '                   and gs_idmodonotificacion = '  +  SqlValue(fraModoNotificacion.Value) +
                                     '                   and gs_fechabaja is null )'
  else
    fraGestionable.ExtraCondition := ' and 1 = 2 ';
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.LoadControls;
begin
  inherited;
  FfrmManParametrosManualesCarta.IdTextoCarta := sdqHistorico.FieldByName('ht_idtextocarta').AsInteger;
  with ValoresColSQL(' select gs_idmodonotificacion, gs_idgestionable, gs_idfirmante ' +
                     ' from emi.igs_gestionablesalida ' +
                     ' where gs_fechabaja is null and gs_idcartatexto = ' + SqlValue(sdqHistorico.FieldByName('ht_idtextocarta').AsInteger)) do
  try
    if Count > 0 then
    begin
      fraModoNotificacion.Value := StrToIntDef(Strings[0], 0);
      fraModoNotificacionChange(self);
      fraGestionable.Value := StrToIntDef(Strings[1], 0);
      fraCodigoCodFirmante.Value := StrToIntDef(Strings[2], 0);
      FModoNotificacionAnt := fraModoNotificacion.Value;
      FGestionableAnt := fraGestionable.Value;
    end;
  finally
    free;
  end;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.RefreshData;
var
  sWhere: String;
begin
  sWhere := '';
  if fraModoNotificacionFiltro.IsSelected then
    sWhere := sWhere + ' and gs_idmodonotificacion = ' + SqlValue(fraModoNotificacionFiltro.Value);

  if fraItemGestionFiltro.IsSelected then
    sWhere := sWhere + ' and gs_idgestionable = ' + SqlValue(fraItemGestionFiltro.Value);

  sdqConsulta.SQL.Text := FSqlBase + FFiltroAreas + sWhere;
  inherited;
end;

function TfrmManCTC_TEXTOCARTA_EMI.Validar: Boolean;
begin
  inherited Validar;
  Verificar(fraModoNotificacion.IsSelected and not fraGestionable.IsSelected, fraGestionable, 'Si selecciona un modo de notificación debe seleccionar un item a gestionar.');
  Verificar(fraModoNotificacion.IsSelected and not fraCodigoCodFirmante.IsSelected, fraCodigoCodFirmante, 'Debe seleccionar un firmante.');
  Result := true;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.FSFormDestroy(Sender: TObject);
begin
  inherited;
  FfrmManParametrosManualesCarta.free;
end;

procedure TfrmManCTC_TEXTOCARTA_EMI.tbEliminarClick(Sender: TObject);
begin
  inherited;
  EjecutarSql(' update emi.igs_gestionablesalida ' +
              ' set gs_fechabaja = sysdate, ' +
              '     gs_usubaja = ' + SqlValue(Sesion.LoginName) +
              ' where gs_idgestionable = ' + SqlValue(sdqConsulta.FieldByName('gs_idgestionable').AsInteger) +
              ' and gs_idcartatexto = ' + SqlValue(sdqConsulta.FieldByName('gs_idcartatexto').AsInteger));
end;

end.
