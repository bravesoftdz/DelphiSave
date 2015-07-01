unit unDiscrepanciasAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  SinEdit, LookupDialog, PatternEdit, IntEdit, Buttons;

type
  TfrmDiscrepanciasAuditoria = class(TfrmCustomGridABM)
    tbFinDiscrepancia: TToolButton;
    ToolButton2: TToolButton;
    tbAvalarDiscrepancia: TToolButton;
    tbRechazarDiscrepancia: TToolButton;
    ToolButton10: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    pnlVolante: TPanel;
    edDiscrepanciaABM: TMemo;
    Label3: TLabel;
    edSiniestroABM: TSinEdit;
    Label1: TLabel;
    dcFechaCirugiaABM: TDateComboBox;
    Label2: TLabel;
    ldgAutorizaciones: TLookupDialog;
    sdqAutorizaciones: TSDQuery;
    sdqAutorizacionesAU_NUMAUTO: TFloatField;
    sdqAutorizacionesAU_FECHASOLI: TDateTimeField;
    sdqAutorizacionesESTADO: TStringField;
    sdqAutorizacionesPRESTADOR: TStringField;
    sdqAutorizacionesPRESTACION: TStringField;
    sdqAutorizacionesGRUPO_T: TStringField;
    sdqAutorizacionesOBSERVACIONES: TStringField;
    sdqAutorizacionesAU_USUAPRO: TStringField;
    sdqAutorizacionesAU_FECHAPRO: TDateTimeField;
    dsAutorizaciones: TDataSource;
    btnAutorizacion: TSpeedButton;
    edAutorizacionABM: TIntEdit;
    Label4: TLabel;
    lblDatSin: TLabel;
    sbDatosDiscre: TStatusBar;
    procedure tbSalir2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edSiniestroABMExit(Sender: TObject);
    procedure btnAutorizacionClick(Sender: TObject);
    procedure tbFinDiscrepanciaClick(Sender: TObject);
    procedure tbAvalarDiscrepanciaClick(Sender: TObject);
    procedure tbRechazarDiscrepanciaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FVolante, FIdDiscre: Integer;
    FEstado: String;
    FAvalar, FSoloLectura: Boolean;
    procedure SetVolante(const Value: Integer);
    procedure SetEstado;
    procedure DoAvalarDiscrepancia(bAval: Boolean);
    procedure DoHabilitarBotones;
    function IsPendienteFinalizar: Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    property Volante: Integer         read FVolante         write SetVolante;
    property IdDiscre: Integer        read FIdDiscre        write FIdDiscre;
    property Estado: String           read FEstado          write FEstado;
    property Avalar: Boolean          read FAvalar          write FAvalar;
    property SoloLectura: Boolean     read FSoloLectura     write FSoloLectura;

  public
    procedure Execute(iVolante: Integer; bAvalar, bSoloLectura: Boolean);
  end;

var
  frmDiscrepanciasAuditoria: TfrmDiscrepanciasAuditoria;

implementation

uses unCustomConsulta, unDmPrincipal, AnsiSql, CustomDlgs, General, unSesion;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.Execute(iVolante: Integer; bAvalar, bSoloLectura: Boolean);
begin
  Avalar      := bAvalar;
  SoloLectura := bSoloLectura;
  Volante     := iVolante;
  tbRefrescarClick(Nil);
  ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived                       := False;
  FieldBaja                         := 'dd_fechabaja';
  tbFinDiscrepancia.ImageIndex      := 40;
  tbAvalarDiscrepancia.ImageIndex   := 34;
  tbRechazarDiscrepancia.ImageIndex := 48;
  tbSalir2.ImageIndex               := 8;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.SetVolante(const Value: Integer);
begin
  if (Value <> FVolante) then
  begin
    FVolante            := Value;
    pnlVolante.Caption  := 'Volante actual: ' + IntToStr(FVolante);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT dd_id, dd_iddiscrepancia, dd_siniestro, dd_orden, dd_recaida, ' +
                ' dd_fechacirugia, dd_numauto, dd_observacion, ' +
                ' art.utiles.armar_siniestro(dd_siniestro, dd_orden, dd_recaida) siniestro, ' +
                ' dd_fechabaja, tj_nombre, dd_usualta, dd_fechaalta ' +
           ' FROM SIN.sda_discrepanciasauditoria, SIN.sdd_detallediscrepancias, ' +
                ' art.sex_expedientes, ctj_trabajador ' +
          ' WHERE da_id = dd_iddiscrepancia ' +
            ' AND dd_siniestro = ex_siniestro ' +
            ' AND dd_orden = ex_orden ' +
            ' AND dd_recaida = ex_recaida ' +
            ' AND ex_idtrabajador = tj_id ' +
            ' AND da_volante = ' + SqlInt(FVolante);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  SetEstado;
  DoHabilitarBotones;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.ClearControls;
begin
  edSiniestroABM.Clear;
  dcFechaCirugiaABM.Clear;
  edAutorizacionABM.Clear;
  edDiscrepanciaABM.Lines.Clear;
  lblDatSin.Caption       := '';
  btnAutorizacion.Enabled := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.LoadControls;
begin
  with sdqconsulta do
  begin
    edSiniestroABM.SetValues(FieldByName('dd_siniestro').AsInteger,
                             FieldByName('dd_orden').AsInteger,
                             FieldByName('dd_recaida').AsInteger);
    edSiniestroABMExit(nil);
    dcFechaCirugiaABM.Date        := FieldByName('dd_fechacirugia').AsDateTime;
    edAutorizacionABM.Value       := FieldByName('dd_numauto').AsInteger;
    edDiscrepanciaABM.Lines.Text  := FieldByName('dd_observacion').AsString;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmDiscrepanciasAuditoria.Validar: Boolean;
begin
  Verificar(edSiniestroABM.IsEmpty, edSiniestroABM, 'Debe ingresar el siniestrro.');
  Verificar(dcFechaCirugiaABM.IsEmpty, dcFechaCirugiaABM, 'Debe ingresar la fecha de cirugía.');
  Verificar(edAutorizacionABM.Value = 0, edAutorizacionABM, 'Debe seleccionar la autorización.');
  Verificar(Trim(edDiscrepanciaABM.Lines.Text) = '', edDiscrepanciaABM,'Debe ingresar la discrepancia observada.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmDiscrepanciasAuditoria.DoABM: Boolean;
var
  sSql: String;
begin
  try
    BeginTrans;
    if (ModoABM = maAlta) then
    begin
      if (FIdDiscre = 0) then
      begin
        IdDiscre := GetSecNextVal('sin.seq_sda_id');
        sSql     := 'INSERT INTO sin.sda_discrepanciasauditoria ' +
                    '(da_id, da_volante, da_usualta, da_fechaalta) VALUES (' +
                    SqlInt(IdDiscre) + ',' + SqlInt(FVolante) + ',' +
                    SqlValue(Sesion.UserID) + ', ActualDate)';
        EjecutarSqlST(sSql);
      end;
      sSql := 'INSERT INTO sin.sdd_detallediscrepancias ' +
              '(dd_iddiscrepancia, dd_siniestro, dd_orden, dd_recaida, dd_fechacirugia, ' +
              ' dd_numauto, dd_observacion, dd_usualta, dd_fechaalta) VALUES ( ' +
              SqlInt(FIdDiscre) + ',' + SqlInt(edSiniestroABM.Siniestro) + ',' +
              SqlInt(edSiniestroABM.Orden) + ',' + SqlInt(edSiniestroABM.Recaida) + ',' +
              SqlDate(dcFechaCirugiaABM.Date) + ',' + SqlInt(edAutorizacionABM.Value) + ',' +
              SqlValue(edDiscrepanciaABM.Lines.Text) + ',' +
              SqlValue(Sesion.UserID) + ',' + ' Actualdate)';
    end
    else if (ModoABM = maModificacion) then
      sSql := 'UPDATE sin.sdd_detallediscrepancias ' +
                ' SET dd_fechacirugia = ' + SqlDate(dcFechaCirugiaABM.Date) + ',' +
                    ' dd_numauto = ' + SqlInt(edAutorizacionABM.Value) + ',' +
                    ' dd_observacion = ' + SqlValue(edDiscrepanciaABM.Lines.Text) + ',' +
                    ' dd_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' dd_fechamodif = ActualDate ' +
              ' WHERE dd_id = ' + SqlInt(sdqConsulta.FieldByName('dd_id').AsInteger)
    else if (ModoABM = maBaja) then
      sSql := 'UPDATE sin.sdd_detallediscrepancias ' +
                ' SET dd_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' dd_fechabaja = ActualDate ' +
              ' WHERE dd_id = ' + SqlInt(sdqConsulta.FieldByName('dd_id').AsInteger);

    EjecutarSqlST(sSql);
    CommitTrans;
    Result := True;
  except
    On E: Exception do
    begin
      Rollback;
       ErrorMsg(E);
       Result := False;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not(sdqConsulta.FieldByName('dd_fechabaja').IsNull) then
    AFont.Color := clRed
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.edSiniestroABMExit(Sender: TObject);
begin
  if edSiniestroABM.IsEmpty then
    lblDatSin.Caption := ''
  else begin
    lblDatSin.Caption := ValorSqlEx('SELECT tj_nombre || '' - '' || ex_fechaaccidente ' +
                                     ' FROM sex_expedientes, ctj_trabajador ' +
                                    ' WHERE ex_idtrabajador = tj_id ' +
                                      ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'') ' +
                                      ' AND ex_siniestro = :sini '  +
                                      ' AND ex_orden = :orden ' +
                                      ' AND ex_recaida = :reca ', [edSiniestroABM.Siniestro,
                                                                   edSiniestroABM.Orden,
                                                                   edSiniestroABM.Recaida]);
    if (lblDatSin.Caption = '') then
    begin
      MsgBox('El siniestro seleccionado no existe o bien se encuentra cerrado, ' +
             'por favor ingrese uno válido', MB_ICONINFORMATION);
      edSiniestroABM.Clear;
      edSiniestroABM.SetFocus;
    end
    else begin
      sdqAutorizaciones.Close;
      sdqAutorizaciones.ParamByName('psiniestro').AsInteger := edSiniestroABM.Siniestro;
      sdqAutorizaciones.ParamByName('porden').AsInteger     := edSiniestroABM.Orden;
      sdqAutorizaciones.ParamByName('precaida').AsInteger   := edSiniestroABM.Recaida;
      sdqAutorizaciones.Open;
      btnAutorizacion.Enabled := not sdqAutorizaciones.IsEmpty;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.btnAutorizacionClick(Sender: TObject);
begin
  ldgAutorizaciones.Text := edAutorizacionABM.Text;
  if (edAutorizacionABM.Text <> '') then
    sdqAutorizaciones.Locate('au_numauto', edAutorizacionABM.Text, []);
  if ldgAutorizaciones.Execute then
    edAutorizacionABM.Text := sdqAutorizaciones.FieldByName('au_numauto').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbFinDiscrepanciaClick(Sender: TObject);
var
  sSql: String;
begin
  if IsPendienteFinalizar then
  begin
    sSql := 'SELECT 1 ' +
             ' FROM sin.sdd_detallediscrepancias ' +
            ' WHERE dd_iddiscrepancia = :iddis ' +
              ' AND dd_fechabaja IS NULL ';
    Verificar(not(ExisteSqlEx(sSql, [IdDiscre])), nil,
              'No se ha cargado ninguna discrepancia para el volante seleccionado.');
    if MsgAsk('¿Confirma finalizar la discrepancia para el volante?') then
    begin
      sSql := 'UPDATE sin.sda_discrepanciasauditoria ' +
                ' SET da_finalizada = ''S'', ' +
                    ' da_usufin = :usuario, ' +
                    ' da_fechafin = ActualDate ' +
              ' WHERE da_id = :id ';
      EjecutarSqlEx(sSql, [Sesion.UserID, IdDiscre]);
      MsgBox('Discrepancia finalizada correctamente.', MB_ICONINFORMATION);
      Close;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.SetEstado;
var
  sSql, sEstado: String;
begin
  IdDiscre := IIF(sdqConsulta.IsEmpty, 0, sdqConsulta.FieldByName('dd_iddiscrepancia').AsInteger);
  sSql     := 'SELECT da_aval, da_finalizada ' +
               ' FROM sin.sda_discrepanciasauditoria ' +
              ' WHERE da_id = :id ';
  with GetQueryEx(sSql, [IdDiscre]) do
  try
    if Eof then
    begin
      sEstado := 'SIN GENERAR.';
      Estado  := 'S';
    end
    else if (FieldByName('da_aval').AsString = 'S') then
    begin
      sEstado := 'AVALADA.';
      Estado  := 'A';
    end
    else if (FieldByName('da_finalizada').AsString = 'S') then
    begin
      sEstado := 'FINALIZADA.';
      Estado  := 'F';
    end
    else if (FieldByName('da_finalizada').AsString = 'N') then
    begin
      sEstado := 'PENDIENTE DE FINALIZAR.';
      Estado  := 'P';
    end;
  finally
    Free;
  end;
  sbDatosDiscre.Panels[0].Text := 'Estado de la discrepancia: ' + sEstado;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbAvalarDiscrepanciaClick(Sender: TObject);
begin
  DoAvalarDiscrepancia(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.DoAvalarDiscrepancia(bAval: Boolean);
var
  sSql, sInfo: String;
begin
  Verificar(bAval and (FEstado <> 'F'), nil,
            'La discrepancia no se encuentra en estado "Finalizada".');
  Verificar(not(bAval) and not(AreIn(FEstado, ['F', 'A'])), nil,
            'La discrepancia no se encuentra en estado "Finalizada" ó "Avalada".');
  if MsgAsk('¿Confirma ' + IIF(bAval, 'avalar', 'rechazar') + ' la discrepancia para el volante?') then
  begin
    if bAval then
      sInfo := ', da_numeroinforme = (SELECT COUNT(*) + 1 ' +
                                      ' FROM SIN.sda_discrepanciasauditoria ' +
                                     ' WHERE TO_CHAR(da_fechaaval, ''yyyy'') = TO_CHAR(art.actualdate, ''yyyy'') ' +
                                       ' AND da_aval = ''S'' ' +
                                       ' AND da_fechabaja IS NULL) '
    else
      sInfo := ', da_finalizada = ''N'', da_fechafin = Null, da_usufin = Null ';

    sSql := 'UPDATE sin.sda_discrepanciasauditoria ' +
              ' SET da_aval = :aval, ' +
                  ' da_usuaval = :usuario, ' +
                  ' da_fechaaval = ActualDate ' + sInfo +
            ' WHERE da_id = :id ';
    EjecutarSqlEx(sSql, [IIF(bAval, 'S', 'N'), Sesion.UserID, IdDiscre]);
    MsgBox('Discrepancia ' + IIF(bAval, 'avalada', 'rechazada') + ' correctamente.', MB_ICONINFORMATION);
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbRechazarDiscrepanciaClick(Sender: TObject);
begin
  DoAvalarDiscrepancia(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.DoHabilitarBotones;
begin
  tbFinDiscrepancia.Enabled       := not(FSoloLectura) and not(FAvalar) and Seguridad.Activar(tbFinDiscrepancia);
  tbAvalarDiscrepancia.Enabled    := not(FSoloLectura) and FAvalar and Seguridad.Activar(tbAvalarDiscrepancia);
  tbRechazarDiscrepancia.Enabled  := not(FSoloLectura) and FAvalar and Seguridad.Activar(tbRechazarDiscrepancia);
  tbNuevo.Enabled                 := not(FSoloLectura) and not(FAvalar) and Seguridad.Activar(tbNuevo);
  tbModificar.Enabled             := not(FSoloLectura) and not(FAvalar) and
                                     Seguridad.Activar(tbModificar) and tbModificar.Enabled;
  tbEliminar.Enabled              := not(FSoloLectura) and not(FAvalar) and
                                     Seguridad.Activar(tbEliminar) and tbEliminar.Enabled;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbNuevoClick(Sender: TObject);
begin
  Verificar(not(AreIn(FEstado, ['P', 'S'])), nil,
            'La discrepancia no se encuentra en estado "Sin generar" ó "Pendiente de finalizar".');
  inherited;
  SetEstado;
end;
{-------------------------------------------------------------------------------}
function TfrmDiscrepanciasAuditoria.IsPendienteFinalizar: Boolean;
begin
  Verificar(FEstado <> 'P', nil, 'La discrepancia no se encuentra en estado "Pendiente de finalizar".');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbModificarClick(Sender: TObject);
begin
  if IsPendienteFinalizar then inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmDiscrepanciasAuditoria.tbEliminarClick(Sender: TObject);
begin
  if IsPendienteFinalizar then inherited;
end;
{-------------------------------------------------------------------------------}
end.
