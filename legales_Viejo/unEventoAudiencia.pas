unit unEventoAudiencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, ExtCtrls, StdCtrls,
  Mask, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, CurrEdit, SqlFuncs, SDEngine, ANSISql, ComCtrls,
  ToolWin;

type
  TModoForm = (mfAlta, mfModificacion);

  TfrmEventoAudiencia = class(TfrmCustomForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    BevelAbm: TBevel;
    pnEvento: TPanel;
    lbTipo: TLabel;
    lbFecha: TLabel;
    FraTipoEvento: TfraCodigoDescripcion;
    edFechaAudiencia: TDateComboBox;
    pnInstruccion: TPanel;
    edInstruccion: TMemo;
    lbInstruccion: TLabel;
    pnRespuesta: TPanel;
    lbRespuesta: TLabel;
    edRespuesta: TMemo;
    pnEventoPie: TPanel;
    lbMontoaNegociar: TLabel;
    Label2: TLabel;
    lbUsuarioAutorizacion: TLabel;
    edMontoANegociar: TCurrencyEdit;
    edFechaAutorizacion: TDateComboBox;
    fraUsuarioAutorizacion: TfraCodigoDescripcion;
    tbVisualizarMail: TToolBar;
    tbMail: TToolButton;
    pnObservacion: TPanel;
    Label1: TLabel;
    edObservaciones: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbMailClick(Sender: TObject);

  private
    { Private declarations }
    FModoForm : TModoForm;
    FidAudiencia : integer;
    FidEvento: integer;
    FIdEmail : Integer;
    Sql: TCustomSql;
    procedure SetModoForm(const Value: TModoForm);
    procedure fraTipoEventoChange(Sender: TObject);
  public
    { Public declarations }
    property ModoForm: TModoForm read FModoForm write SetModoForm;
    property idAudiencia: integer read FidAudiencia write FidAudiencia;
    property idEvento: integer read FidEvento write FidEvento;
    procedure LoadControls(evento : Integer);
    procedure ClearControls;
    function Validar: Boolean;
    procedure ModoNotificacion(valor : Boolean);
    procedure ModoVista;
  end;

var
  frmEventoAudiencia: TfrmEventoAudiencia;

const
  AlturaEvento = 471;
  AlturaGenerico = 276;
  AlturaNotificacion = 142;

implementation

uses unPrincipal, DBSql,unDmPrincipal, customdlgs, DB, VclExtra, unElementosEnviados,
  Math;

{$R *.dfm}

{ TfrmEventoAudiencia }

procedure TfrmEventoAudiencia.SetModoForm(const Value: TModoForm);
begin
  FModoForm := Value;
end;


procedure TfrmEventoAudiencia.FormCreate(Sender: TObject);
begin
  inherited;
  Sql := TDBSql.Create;
  Sql.TableName :=  'legales.lae_audienciaevento';

  with FraTipoEvento do
  begin
    TableName     := 'legales.lta_tipoeventoaudiencia';
    FieldID       := 'ta_id';
    FieldCodigo   := 'ta_id';
    FieldDesc     := 'ta_descripcion';
    FieldBaja     := 'ta_fechabaja';
    ShowBajas     := true;
  end;

 with fraUsuarioAutorizacion do
  begin
    TableName   := 'art.use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' ';
    Showbajas   := False;
  end;

end;

procedure TfrmEventoAudiencia.LoadControls(evento : Integer);
begin
  inherited;
  idEvento := evento;
  with GetQuery('SELECT * FROM legales.lae_audienciaevento WHERE ae_id = '+SqlValue(idEvento)) do
  try
    fraTipoEvento.value:=FieldByName('AE_IDTIPOEVENTO').AsInteger;
    fraTipoEventoChange(nil);
    fraUsuarioAutorizacion.value := FieldByName('AE_IDUSUARIOAUTORIZACION').AsInteger  ;
    edMontoANegociar.Value:=FieldByName('AE_MONTOANEGOCIAR').Ascurrency ;
    edFechaAudiencia.date:=FieldByName('AE_FECHA').AsDateTime;
    edFechaAutorizacion.date:=FieldByName('AE_FECHAAUTORIZACION').AsDateTime;
    edInstruccion.Text := FieldByName('AE_INSTRUCCION').AsString;
    edRespuesta.Text := FieldByName('AE_RESPUESTA').AsString;
    edObservaciones.Text := FieldByName('AE_OBSERVACION').AsString;
    FIdEmail := FieldByName('AE_IDEMAIL').AsInteger;
  finally
    free;
  end;
end;

procedure TfrmEventoAudiencia.ClearControls;
begin
  inherited;
  fraTipoEvento.Clear;
  fraTipoEvento.Locked:=false;
  fraUsuarioAutorizacion.Locked:=false;
  fraUsuarioAutorizacion.Clear;
  edFechaAudiencia.Clear;
  edInstruccion.Clear;
  edFechaAudiencia.Clear;
  edMontoANegociar.clear;
  edFechaAutorizacion.Clear;
end;

function TfrmEventoAudiencia.Validar: Boolean;
begin
  Verificar(not fraTipoEvento.IsSelected, fraTipoEvento, 'Debe seleccionar un tipo' );
  Verificar(edFechaAudiencia.IsEmpty, edFechaAudiencia, 'Debe seleccionar una fecha' );
  if ValorSql('SELECT ta_tipo FROM legales.lta_tipoeventoaudiencia WHERE ta_id = '+SqlValue(FraTipoEvento.Value)) = 'E' then
    Verificar(edInstruccion.Lines.Text= '' , edInstruccion, 'Debe especificar una instrucción' );
  result:=true
end;


procedure TfrmEventoAudiencia.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if Validar then
  begin
    sql.Clear;
    Sql.Fields.Add('AE_IDTIPOEVENTO', FraTipoEvento.value);
    Sql.Fields.Add('AE_FECHA',edFechaAudiencia.Date);
    Sql.Fields.Add('AE_INSTRUCCION',exNull);
    Sql.Fields.Add('AE_RESPUESTA',exNull);

    Sql.Fields.AddExtended('AE_MONTOANEGOCIAR', edMontoANegociar.Value);
    Sql.Fields.AddDateTime('AE_FECHAAUTORIZACION',edFechaAutorizacion.Date, True);
    Sql.Fields.AddInteger('AE_IDUSUARIOAUTORIZACION',fraUsuarioAutorizacion.Value,True );

    if FModoForm = mfAlta then
    begin
        idEvento:=GetSecNextVal('LEGALES.SEQ_LAE_AUDIENCIA_ID');
        Sql.SqlType := stInsert;
        Sql.Fields.Add('AE_IDAUDIENCIA',FidAudiencia);
        Sql.Fields.Add('AE_USUALTA', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('AE_FECHAALTA', exDateTime);
    end
    else      //mfModificacion
    begin
        Sql.SqlType := stUpdate;
        Sql.Fields.Add('AE_USUMODIF', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('AE_FECHAMODIF', exDateTime);
        Sql.Fields.Add('AE_USUBAJA', exNull);
        Sql.Fields.Add('AE_FECHABAJA', exNull);
    end;

    Sql.PrimaryKey.Add('AE_ID', idEvento);

    EjecutarSqlST(Sql.Sql);

    SaveBlob('SELECT AE_INSTRUCCION ' +
             '  FROM legales.lae_audienciaevento ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'UPDATE legales.lae_audienciaevento' +
             '   SET AE_INSTRUCCION = :AE_INSTRUCCION ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'AE_INSTRUCCION', edInstruccion.Lines);

    SaveBlob('SELECT AE_RESPUESTA ' +
             '  FROM legales.lae_audienciaevento ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'UPDATE legales.lae_audienciaevento' +
             '   SET ae_respuesta = :ae_respuesta ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'AE_RESPUESTA', edRespuesta.Lines);

    SaveBlob('SELECT AE_OBSERVACION ' +
             '  FROM legales.lae_audienciaevento ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'UPDATE legales.lae_audienciaevento' +
             '   SET AE_OBSERVACION = :AE_OBSERVACION ' +
             ' WHERE ae_id = ' + SqlValue(idEvento),
             'AE_OBSERVACION', edObservaciones.Lines);

    modalresult:= mrOK;
  end;
end;

procedure TfrmEventoAudiencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Sql.Free;
end;

procedure TfrmEventoAudiencia.ModoNotificacion(valor: Boolean);
begin
  pnRespuesta.Visible := not valor;
  pnInstruccion.Visible := not valor;
  pnEventoPie.Visible := not valor;
  tbVisualizarMail.Visible := valor;
  if valor then
    Height := AlturaNotificacion
  else
    Height := AlturaEvento;
  vclExtra.LockControls([FraTipoEvento,edFechaAudiencia,pnEvento,btnAceptar,btnCancelar],valor);
  if valor then
    FraTipoEvento.ExtraCondition := ' AND ta_tipo = ''N'''
  else
  begin
    FraTipoEvento.ExtraCondition := ' AND ta_tipo IN (''E'',''G'')';
    FraTipoEvento.OnChange := fraTipoEventoChange;
    fraTipoEventoChange(nil);
  end;
end;

procedure TfrmEventoAudiencia.tbMailClick(Sender: TObject);
begin
  inherited;
  with TfrmElementosEnviados.Create(Self) do
  begin
    FormStyle := fsNormal;
    Visible := False;
    IdCorreo := FIdEmail;
    fraEE_DIRECCIONORIGEN.Limpiar;
    RefreshData;
    ShowModal;
  end;
end;

procedure TfrmEventoAudiencia.ModoVista;
begin
  vclExtra.LockControls([FraTipoEvento,edFechaAudiencia,edInstruccion,edRespuesta,edMontoANegociar,
                         edFechaAutorizacion,fraUsuarioAutorizacion], True);
  btnAceptar.Visible := False;
end;

procedure TfrmEventoAudiencia.fraTipoEventoChange(Sender: TObject);
begin
  If ValorSql('SELECT ta_tipo FROM legales.lta_tipoeventoaudiencia WHERE ta_id = '+SqlValue(FraTipoEvento.Value)) = 'G' then
  begin
    pnObservacion.Visible := True;
    pnEventoPie.Visible := False;
    pnInstruccion.Visible := False;
    pnRespuesta.Visible := False;
    Height := AlturaGenerico;
  end
  else
  begin
    pnObservacion.Visible := False;
    pnInstruccion.Visible := True;
    pnEventoPie.Visible := True;
    pnRespuesta.Visible := True;
    Height := AlturaEvento;
  end;
end;

end.
