unit unTestigoAudiencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, ExtCtrls, DB, SDEngine, SqlFuncs, DBSql, unDMPrincipal,
  Mask, ToolEdit, DateComboBox, ComCtrls;

type
  TModoForm = (mfAlta, mfModificacion);

  TfrmTestigoAudiencia = class(TfrmCustomForm)
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fraTestigo: TfraCodigoDescripcion;
    Testigo: TLabel;
    sdqTestigo: TSDQuery;
    Label1: TLabel;
    Label2: TLabel;
    edHora: TDateTimePicker;
    edFechaPresentacion: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);

  private
    { Private declarations }
    ModoForm : TModoForm;
    FidAudiencia : integer;
    Sql: TCustomSql;

  public
    procedure Clear;
    procedure CargarDatos(idAud : Integer);
    function Validar: boolean;
    property idAudiencia: integer read FidAudiencia write FidAudiencia;
    procedure ModoVista;
    { Public declarations }
  end;

var
  frmTestigoAudiencia: TfrmTestigoAudiencia;

implementation

uses unPrincipal, CustomDlgs, DateTimeFuncs,vclExtra, AnsiSql;

{$R *.dfm}

procedure TfrmTestigoAudiencia.Clear;
begin
  fraTestigo.Clear;
  ModoForm := mfAlta;
end;

procedure TfrmTestigoAudiencia.CargarDatos(idAud : Integer);
begin
  idAudiencia:=idAud;
  with sdqTestigo do
  begin
    ParamByName('idtestigo').AsInteger := idAud;
    Open;
    ModoForm := mfModificacion;
    fraTestigo.value := FieldByName('AT_IDUSUARIO').asinteger;
    edFechaPresentacion.Date := FieldByName('AT_FECHAPRESENTACION').AsDateTime;
    edHora.Time      := StrToTime(FieldByName('AT_HORAPRESENTACION').AsString);
  end;
end;

function TfrmTestigoAudiencia.Validar: boolean;
begin
  Verificar(not fraTestigo.IsSelected, fraTestigo,'Debe seleccionar un testigo.');
  Verificar(edFechaPresentacion.Date = 0, edFechaPresentacion,'Se debe Completar la fecha de presentación.');
  Verificar(TimeToStr(edHora.Time) = '0:00:00', edHora,'Se debe Completar la hora.');
  if ModoForm = mfAlta then
    Verificar(ExisteSql(' SELECT 1 FROM legales.lat_audienciatestigo '+
              '  WHERE at_idusuario = '+SqlValue(fraTestigo.Value)+
              '    AND at_fechapresentacion = '+SqlDate(edFechaPresentacion.Date)),
              fraTestigo,'Ya tiene asignada una audiencia para ese día.')
  else
    Verificar(ExisteSql(' SELECT 1 FROM legales.lat_audienciatestigo '+
              '  WHERE at_idusuario = '+SqlValue(fraTestigo.Value)+
              '    AND at_fechapresentacion = '+SqlDate(edFechaPresentacion.Date)+
              '    AND at_id <> '+SqlValue(sdqTestigo.FieldByName('AT_ID').AsInteger)),
              fraTestigo,'Ya tiene asignada una audiencia para ese día.');
  Result := True;
end;

procedure TfrmTestigoAudiencia.FormCreate(Sender: TObject);
begin
  inherited;
  Sql := TDBSql.Create;
  Sql.TableName :=  'legales.lat_audienciatestigo';

  with FraTestigo do
  begin
    TableName     := 'art.use_usuarios';
    FieldID       := 'se_id';
    FieldCodigo   := 'se_usuario';
    FieldDesc     := 'se_nombre';
    FieldBaja     := 'se_fechabaja';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N'' ';
    Showbajas   := False;
  end;

end;

procedure TfrmTestigoAudiencia.btnAceptarClick(Sender: TObject);
var idAT:integer;
begin
if validar then
begin
  inherited;
  Sql.Clear;
  if ModoForm=mfAlta then
  begin
    Sql.SqlType := stInsert;
    idAT:= GetSecNextVal('LEGALES.SEQ_LAT_ID');
    Sql.Fields.Add('AT_USUALTA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AT_FECHAALTA', exDateTime);
    Sql.Fields.Add('AT_IDAUDIENCIA', idAudiencia);
    Sql.PrimaryKey.Add('AT_ID', idAT);
  end
  else
  begin
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('AT_USUMODIF', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AT_FECHAMODIF', exDateTime);
    Sql.Fields.Add('AT_USUBAJA', exNull);
    Sql.Fields.Add('AT_FECHABAJA', exNull);
    Sql.PrimaryKey.Add('AT_ID', idAudiencia);
  end;
  Sql.Fields.Add('AT_IDUSUARIO',fraTestigo.Value);
  Sql.Fields.AddDate('AT_FECHAPRESENTACION',edFechaPresentacion.Date,True);
  Sql.Fields.Add('AT_HORAPRESENTACION', FormatDateTime('HH:NN',edHora.Time) );

  EjecutarSqlST(Sql.sql);
  modalresult:= mrOK;
end;

end;

procedure TfrmTestigoAudiencia.ModoVista;
begin
  vclExtra.LockControls([fraTestigo,edFechaPresentacion,edHora], True);
  btnAceptar.Visible := False;
end;

end.
