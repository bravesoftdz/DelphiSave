unit unAperturaSiniestro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, SinEdit, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, unPrincipal, Mask, ToolEdit, DateComboBox, unArt,
  unArtDBAwareFrame;

type
  TfrmAperturaSiniestro = class(TfrmCustomGridABM)
    SinEdit: TSinEdit;
    Label1: TLabel;
    fraCTBMotivoCierre: TfraCtbTablas;
    Label10: TLabel;
    Label2: TLabel;
    fraCTBMotivoReapertura: TfraCtbTablas;
    Label3: TLabel;
    edFechaReapertura: TDateComboBox;
    tbCerrar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    fpCerrarSiniestro: TFormPanel;
    Bevel1: TBevel;
    Label4: TLabel;
    btnAceptarCierre: TButton;
    btnCancelarCierre: TButton;
    fraCTBMotivoCierreSin: TfraCtbTablas;
    fraCtbProcesoCierre: TfraCtbTablas;
    Label5: TLabel;
    SinEditCierreSin: TSinEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbCerrarClick(Sender: TObject);
    procedure fpCerrarSiniestroEnter(Sender: TObject);
    procedure btnAceptarCierreClick(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure CheckButtons; override;
  private
    function Is_SiniestroCerrado(IdExpediente: TTableId; MotivoCierre: String): Boolean;
    function ValidarCierre: Boolean;
  public
  end;

var
  frmAperturaSiniestro: TfrmAperturaSiniestro;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, SqlFuncs, unSesion, unComunes;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.FormCreate(Sender: TObject);
begin
  inherited;
  fraCTBMotivoCierre.Clave     := 'MOTCI';
  fraCTBMotivoReapertura.Clave := 'MOTRE';
  fraCTBMotivoCierreSin.Clave  := 'MOTCI';
  fraCtbProcesoCierre.Clave    := 'PROCI';
  ShowActived                  := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSqlWhere := '';

  if not SinEdit.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ex_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                             ' AND ex_orden = ' + SqlInt(SinEdit.Orden) +
                             ' AND ex_recaida = ' + SqlInt(SinEdit.Recaida);

  if not fraCTBMotivoCierre.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND cs_motivocierre = ' + SqlValue(fraCTBMotivoCierre.Value);

  sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida, ex_id, ctbmotcierre.tb_descripcion motivocierre, ' +
                ' cs_fechacierre, ctbmotreapertura.tb_descripcion motivoreapertura, ' +
                ' ctbproccierre.tb_descripcion procesocierre, cs_fechareapertura, cs_id, ' +
                ' cs_motivocierre ' +
           ' FROM ctb_tablas ctbmotreapertura, ctb_tablas ctbproccierre, ' +
                ' ctb_tablas ctbmotcierre, sex_expedientes, scs_cierresiniestro ' +
          ' WHERE cs_idexpediente = ex_id ' +
            ' AND ctbmotcierre.tb_clave(+)=''MOTCI'' ' +
            ' AND ctbmotcierre.tb_codigo(+)=cs_motivocierre ' +
            ' AND ctbproccierre.tb_clave(+)=''PROCI'' ' +
            ' AND ctbproccierre.tb_codigo(+)=cs_procesocierre ' +
            ' AND ctbmotreapertura.tb_clave(+)=''MOTRE'' ' +
            ' AND ctbmotreapertura.tb_codigo(+)=cs_motivoreapertura ' +
           sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.tbLimpiarClick(Sender: TObject);
begin
  SinEdit.Clear;
  fraCTBMotivoCierre.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.tbModificarClick(Sender: TObject);
begin
  Verificar(not Is_SiniestroCerrado(sdqConsulta.FieldByname('EX_ID').AsInteger,
                                    sdqConsulta.FieldByname('CS_MOTIVOCIERRE').AsString),
            Grid, 'El siniestro ya se encuentra abierto' );
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.LoadControls;
begin
  // va a cargar los datos de reapertura (que están nulos)
  ClearControls;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAperturaSiniestro.DoAbm: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'SCS_CIERRESINIESTRO';

  if ModoABM = maModificacion then
  begin
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('CS_IDEXPEDIENTE',   sdqConsulta.FieldByName('EX_ID').AsInteger, False);
    Sql.Fields.Add('CS_MOTIVOREAPERTURA',   fraCTBMotivoReapertura.Value);
    Sql.Fields.Add('CS_FECHAREAPERTURA',    edFechaReapertura.Date);
    Sql.Fields.Add('CS_USUMODIF',           Sesion.UserID);
    Sql.Fields.Add('CS_FECHAMODIF',         SQL_DATETIME, False);
    Sql.ExtraCondition := ' AND CS_FECHAREAPERTURA IS NULL ' +
                          ' AND CS_MOTIVOCIERRE = ' + SqlValue(sdqConsulta.FieldByname('CS_MOTIVOCIERRE').AsString);
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAperturaSiniestro.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCTBMotivoReapertura.IsEmpty, fraCTBMotivoReapertura.edCodigo, 'Debe ingresar el motivo de reapertura');
  Verificar(edFechaReapertura.IsEmpty, edFechaReapertura, 'Debe ingresar la fecha de reapertura');

  sSql := 'SELECT MAX(cs_fechacierre) ' +
            'FROM scs_cierresiniestro ' +
           'WHERE cs_idexpediente = ' + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) +
            ' AND cs_motivocierre = ' + SqlValue(sdqConsulta.FieldByname('CS_MOTIVOCIERRE').AsString);

  Verificar(edFechaReapertura.Date < ValorSqlDateTime(sSql), edFechaReapertura,
            'La fecha de reapertura no puede ser menor que la última fecha de cierre');
  Verificar(edFechaReapertura.Date > DBDate, edFechaReapertura,
            'La fecha de reapertura no puede ser mayor a hoy');

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.ClearControls;
begin
  fraCTBMotivoReapertura.Clear;
  edFechaReapertura.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.CheckButtons;
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.tbCerrarClick(Sender: TObject);
begin
  if fpCerrarSiniestro.ShowModal = mrOk then
    tbRefrescarClick(nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAperturaSiniestro.Is_SiniestroCerrado(IdExpediente: TTableId; MotivoCierre: String): Boolean;
var
  sSql: String;
begin
  sSql   := 'SELECT art.sin.is_siniestrocerrado(:IdExpediente, :MotivoCierre) ' +
              'FROM DUAL';
  Result := (ValorSqlEx(sSql, [IdExpediente, MotivoCierre]) = 'S');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.fpCerrarSiniestroEnter(Sender: TObject);
begin
  fraCTBMotivoCierreSin.Clear;
  fraCtbProcesoCierre.Clear;

  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    SinEditCierreSin.Siniestro := sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger;
    SinEditCierreSin.Orden     := sdqConsulta.FieldByName('EX_ORDEN').AsInteger;
    SinEditCierreSin.Recaida   := sdqConsulta.FieldByName('EX_RECAIDA').AsInteger;
  end
  else
    SinEditCierreSin.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAperturaSiniestro.btnAceptarCierreClick(Sender: TObject);
var
  exId: TTableId;
begin
  if ValidarCierre then
  begin
    exId := Get_IdExpediente(SinEditCierreSin.Siniestro, SinEditCierreSin.Orden, SinEditCierreSin.Recaida);
    Sql.Clear;
    Sql.TableName := 'SCS_CIERRESINIESTRO';

    Sql.SqlType := stInsert;

    Sql.PrimaryKey.Add('CS_ID',             GetSecNextVal('SEQ_SCS_ID'), False);
    Sql.Fields.Add('CS_IDEXPEDIENTE',       exId, False);
    Sql.Fields.Add('CS_FECHACIERRE',        exDate);
    Sql.Fields.Add('CS_MOTIVOCIERRE',       fraCTBMotivoCierreSin.Value);
    Sql.Fields.Add('CS_PROCESOCIERRE',      fraCtbProcesoCierre.Value);
    Sql.Fields.Add('CS_USUALTA',            Sesion.UserID);
    Sql.Fields.Add('CS_FECHAALTA',          exDateTime);

    EjecutarSql(Sql.Sql);
    fpCerrarSiniestro.ModalResult := mrOk;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAperturaSiniestro.ValidarCierre: Boolean;
begin
  Verificar(SinEditCierreSin.IsEmpty, SinEditCierreSin, 'Debe ingresar el siniestro');
  Verificar(fraCTBMotivoCierreSin.IsEmpty, fraCTBMotivoCierreSin.edCodigo, 'Debe ingresar el motivo de cierre');
  Verificar(fraCtbProcesoCierre.IsEmpty, fraCtbProcesoCierre.edCodigo, 'Debe ingresar el proceso de cierre');
  Verificar(Is_SiniestroCerrado(Get_IdExpediente(SinEditCierreSin.Siniestro,
                                                 SinEditCierreSin.Orden,
                                                 SinEditCierreSin.Recaida),
                                fraCTBMotivoCierreSin.edCodigo.Text),
            Grid, 'El siniestro ya se encuentra cerrado por el motivo seleccionado');
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

