unit unEventosAccidentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit,unMoldeEnvioMail;

type
  TfrmEventosAccidentes = class(TfrmCustomGridABM)
    edFecha: TDateEdit;
    lbFecha: TLabel;
    fraEvento: TfraCodigoDescripcion;
    lbEvento: TLabel;
    edObservaciones: TMemo;
    Label1: TLabel;
    cbEnviaMail: TCheckBox;
    Label2: TLabel;
    edTextoMail: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure fraEventoOnChange(Sender: TObject);
  private
    { Private declarations }
    IdGestion :Integer;
  public
    { Public declarations }
    procedure Load(Gestion : Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmEventosAccidentes: TfrmEventosAccidentes;

implementation

uses   VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, SqlOracle,
  unCustomConsulta, DateUtils, General, Registros;

{$R *.dfm}

{ TfrmEventosAccidentes }

procedure TfrmEventosAccidentes.ClearControls;
begin
  inherited;
  vclExtra.LockControl(edTextoMail,True);
  edFecha.Clear;
  fraEvento.Clear;
  cbEnviaMail.Checked := false;
  edObservaciones.Clear;
end;

function TfrmEventosAccidentes.DoABM: Boolean;
var
  FIDEnvioMail,iIdCodigo : Integer;
  Resultado: TResultadoEnvio;
  DirEMail : String;
  FCuerpo : String;
begin
 // result := true;
  DirEMail := ValorSql(
    ' SELECT prev.it_email || NVL2 (cor.it_email, '';'' || cor.it_email, '''') '+
    '  FROM art.pit_firmantes prev, art.pit_firmantes cor, '+
    '   hys.hga_gestionaccidente '+
    '  WHERE prev.it_id = ga_idpreventor AND prev.it_idsupervisor = cor.it_id(+) '+
    '    AND ga_id = '+SqlValue(IdGestion));
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('AE_ID').AsInteger;
      Sql.Fields.Add('AE_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('AE_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('AE_IDGESTIONACCIDENTE', IdGestion);
      Sql.Fields.Add('AE_IDEVENTO', fraEvento.Codigo);
      Sql.Fields.Add('AE_FECHA', edFecha.Date);
      Sql.Fields.Add('AE_OBSERVACION', edObservaciones.Text);
      if cbEnviaMail.Checked then
      begin
        Sql.Fields.Add('AE_ENVIAMAIL', 'S');
        FCuerpo := 'Fecha : '+DateToStr( edFecha.Date)+#13#10;
        FCuerpo := FCuerpo + 'Siniestro :'+ValorSql(
          ' SELECT art.utiles.armar_siniestro (ex_siniestro, '+
          '                                    ex_orden, '+
          '                                    ex_recaida '+
          '                                   ) siniestro '+
          '   FROM art.sex_expedientes sex, hys.hga_gestionaccidente '+
          '  WHERE ex_id = ga_idexpediente AND ga_id = '+SqlValue(IdGestion))+#13#10;
        FCuerpo := FCuerpo + ValorSql(
          'SELECT ta_textomail '+
          '  FROM hys.hta_tipoeventoaccidente '+
          ' WHERE ta_id = '+SqlValue(fraEvento.Codigo))+#13#10;
        FCuerpo := FCuerpo + 'Observación: '+edObservaciones.Text+#13#10;
        FCuerpo := FCuerpo + 'Preventor de la Investigación: '+ ValorSql(
          ' SELECT it_nombre '+
          '   FROM art.pit_firmantes, hys.hga_gestionaccidente '+
          '  WHERE it_id = ga_idpreventor AND ga_id = '+SqlValue(IdGestion))+#13#10;
        if (ModoABM = maAlta) or ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hae_accidenteevento '+
          '  WHERE AE_IDEMAILAENVIAR IS NULL '+
          '    AND ae_id = '+SqlValue(sdqConsulta.FieldByName('AE_ID').AsInteger)) then
        begin
            Resultado := EnviarMailBDWithResults(DirEMail,'Notificación Inf. Accidente',
                    [oAutoFirma], FCuerpo, nil,0, tcDefault, False, False, 0, -1);
            FIDEnvioMail := Resultado.MensajeId;
            Sql.Fields.Add('AE_IDEMAILAENVIAR', FIDEnvioMail);
        end
        else
          if MsgAsk('El correo ya fue enviado.' + #13#10 + '¿Desea enviar el correo de nuevo?') then
          begin
            Resultado := EnviarMailBDWithResults(DirEMail,'Notificación Inf. Accidente',
                    [], FCuerpo, nil,0, tcDefault, False, False, 0, -1);
            FIDEnvioMail := Resultado.MensajeId;
            Sql.Fields.Add('AE_IDEMAILAENVIAR', FIDEnvioMail);
          end;
      end
      else
        Sql.Fields.Add('AE_ENVIAMAIL', 'N');

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HAE_ACCIDENTE_ID');
        Sql.Fields.Add('AE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('AE_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('AE_ID').AsInteger;
        Sql.Fields.Add('AE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('AE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('AE_FECHABAJA', exNull );
        Sql.Fields.Add('AE_USUBAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('AE_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmEventosAccidentes.LoadControls;
begin
  inherited;
  ClearControls;
  edFecha.Date := sdqConsulta.FieldByName('ae_fecha').AsDateTime;
  fraEvento.Codigo := sdqConsulta.FieldByName('ae_idevento').AsString;
  edTextoMail.Text := ValorSql(
      ' SELECT TA_TEXTOMAIL '+
      '   FROM hys.hta_tipoeventoaccidente '+
      '  WHERE ta_id = '+SqlValue(fraEvento.Codigo));
  cbEnviaMail.Checked := sdqConsulta.FieldByName('ae_enviamail').AsString = 'S';
  edObservaciones.Text := sdqConsulta.FieldByName('ae_observacion').AsString;
end;

function TfrmEventosAccidentes.Validar: Boolean;
begin
  Verificar(edFecha.Date = 0, edFecha,'Debe Seleccionar una fecha.');
  Verificar(edFecha.Date > DBDate,edFecha,'La Fecha debe ser menor o igual a hoy.');
  Verificar(not fraEvento.IsSelected, fraEvento, 'Se debe Seleccionar un Evento.');
  Result := True;
end;

procedure TfrmEventosAccidentes.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConsulta.ParamByName('gestion').AsInteger := IdGestion;

  with fraEvento do
  begin
    TableName   := 'hys.hta_tipoeventoaccidente';
    FieldID     := 'ta_id';
    FieldCodigo := 'ta_id';
    FieldDesc   := 'TA_DESCRIPCION';
    FieldBaja   := 'TA_FECHABAJA';
    Showbajas   := true;
    OnChange    := fraEventoOnChange;
  end;
  Sql.TableName := 'hys.hae_accidenteevento';
  FieldBaja := 'AE_FECHABAJA';
end;

procedure TfrmEventosAccidentes.Load(Gestion: Integer);
begin
  IdGestion := Gestion;
  sdqConsulta.ParamByName('gestion').AsInteger := IdGestion;
end;

procedure TfrmEventosAccidentes.fraEventoOnChange(Sender: TObject);
begin
  cbEnviaMail.Checked := ValorSql(
      ' SELECT ta_enviomail '+
      '   FROM hys.hta_tipoeventoaccidente '+
      '  WHERE ta_id = '+SqlValue(fraEvento.Codigo))= 'S';
  edTextoMail.Text := ValorSql(
      ' SELECT TA_TEXTOMAIL '+
      '   FROM hys.hta_tipoeventoaccidente '+
      '  WHERE ta_id = '+SqlValue(fraEvento.Codigo));
end;

end.
