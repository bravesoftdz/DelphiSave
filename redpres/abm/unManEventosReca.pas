unit unManEventosReca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo, unfraPrestadorAMP,
  unfraPrestaciones, unArtDbFrame, unfraPrestador;

type
  TfrmManEventosReca = class(TfrmCustomGridABM)
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    gbEvento: TGroupBox;
    fraEvento: TfraCodigoDescripcion;
    chkAutomatico: TCheckBox;
    chkImprimirSRT: TCheckBox;
    chkTelegrama: TCheckBox;
    edCodCartaDoc: TEdit;
    Label3: TLabel;
    chkTelegramaTrab: TCheckBox;
    chkCitacion: TCheckBox;
    chkSeguimiento: TCheckBox;
    chkReubicacion: TCheckBox;
    chkParteEvolutivo: TCheckBox;
    chkAltaReca: TCheckBox;
    chkCitacDoble: TCheckBox;
    chkNotificacion: TCheckBox;
    chkResponsable: TCheckBox;
    chkSegTerreno: TCheckBox;
    chkDerInterior: TCheckBox;
    chkEventoSRT: TCheckBox;
    chkAmerita: TCheckBox;
    chkProfesional: TCheckBox;
    chkFecAntAlta: TCheckBox;
    chkRecaDictamen: TCheckBox;
    chkSugReca: TCheckBox;
    chkSeguimientoSin: TCheckBox;
    chkSeguimientoCon: TCheckBox;
    chkTelegramaProf: TCheckBox;
    chkTelegramaPrest: TCheckBox;
    gbGeneraAut: TGroupBox;
    chkGeneraAutoriz: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    chkCapInt: TCheckBox;
    chkIniciaReca: TCheckBox;
    edEventoAuto: TEdit;
    Label7: TLabel;
    Bevel1: TBevel;
    fraGTrabajo: TfraCodigoDescripcion;
    fraPrestador: TfraPrestador;
    edDigitaliza: TEdit;
    Label8: TLabel;
    fraPrestacion: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    Label9: TLabel;
    edEventoAnt: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: boolean; override;
    function Validar: Boolean; override;
    procedure chkGeneraAutorizClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure ArmarCondiciones;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManEventosReca: TfrmManEventosReca;

implementation

uses VCLExtra, unPrincipal, unFraEmpresa, General, unCustomConsulta,
  unDmPrincipal, SqlFuncs, CustomDlgs;

{$R *.dfm}


procedure TfrmManEventosReca.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT em_codigo, em_descripcion, em_automatico, em_codcartadoc, em_digitaliza, em_imprimirsrt, ' +
                 ' em_telegrama, em_telegramatrab, em_citacion, em_seguimiento, em_reubicacion, em_parteevolutivo, ' +
                 ' em_altareca, em_citaciondoble, em_notificacion, em_responsable, em_segterreno, em_derivinterior, ' +
                 ' em_eventosrt, em_amerita, em_profesional, em_fechaantalta, em_recadictamen, em_avsugreca, ' +
                 ' em_seguimientosin, em_seguimientocon, em_telegrecaprof, em_telegrecaprest, em_generaautorizacion, em_prestacionaut, ' +
                 ' em_prestadoraut, em_gtrabajoaut, em_eventoanterior, em_capint, em_eventoauto, em_iniciareca, ' +
                 ' em_fechabaja, em_id ' +
            ' FROM SIN.sem_eventomedicoreca ' +
           ' WHERE 1 = 1 ';

  if not fraEvento.IsEmpty then
    ssql := ssql + ' AND em_codigo = ' + fraEvento.Codigo;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmManEventosReca.ClearControls;
var i: integer;
begin
  inherited;
  //fraEvento.Clear;
  edCodigo.Clear;
  edDescripcion.Clear;
  edCodCartaDoc.Clear;
  edDigitaliza.Clear;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TCheckBox) then
      TCheckBox(Components[i]).Checked := false;
  edEventoAuto.Clear;

end;

procedure TfrmManEventosReca.LoadControls;
begin
  inherited;
  edCodigo.Text := sdqConsulta.FieldByName('EM_CODIGO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('EM_DESCRIPCION').AsString;
  chkAutomatico.Checked := sdqConsulta.FieldByName('EM_AUTOMATICO').AsString = 'S';
  edCodCartaDoc.Text := sdqConsulta.FieldByName('EM_CODCARTADOC').AsString;
  chkAutomatico.Checked := sdqConsulta.FieldByName('EM_AUTOMATICO').AsString = 'S';
  edDigitaliza.Text := sdqConsulta.FieldByName('EM_DIGITALIZA').AsString;
  chkImprimirSRT.Checked := sdqConsulta.FieldByName('EM_IMPRIMIRSRT').AsString = 'S';
  chkTelegrama.Checked := sdqConsulta.FieldByName('EM_TELEGRAMA').AsString = 'S';
  chkTelegramaTrab.Checked := sdqConsulta.FieldByName('EM_TELEGRAMATRAB').AsString = 'S';
  chkCitacion.Checked := sdqConsulta.FieldByName('EM_CITACION').AsString = 'S';
  chkSeguimiento.Checked := sdqConsulta.FieldByName('EM_SEGUIMIENTO').AsString = 'S';
  chkReubicacion.Checked := sdqConsulta.FieldByName('EM_REUBICACION').AsString = 'S';
  chkParteEvolutivo.Checked := sdqConsulta.FieldByName('EM_PARTEEVOLUTIVO').AsString = 'S';
  chkAltaReca.Checked := sdqConsulta.FieldByName('EM_ALTARECA').AsString = 'S';
  chkCitacDoble.Checked := sdqConsulta.FieldByName('EM_CITACIONDOBLE').AsString = 'S';
  chkNotificacion.Checked := sdqConsulta.FieldByName('EM_NOTIFICACION').AsString = 'S';
  chkResponsable.Checked := sdqConsulta.FieldByName('EM_RESPONSABLE').AsString = 'S';
  chkSegTerreno.Checked := sdqConsulta.FieldByName('EM_SEGTERRENO').AsString = 'S';
  chkDerInterior.Checked := sdqConsulta.FieldByName('EM_DERIVINTERIOR').AsString = 'S';
  chkEventoSRT.Checked := sdqConsulta.FieldByName('EM_EVENTOSRT').AsString = 'S';
  chkAmerita.Checked := sdqConsulta.FieldByName('EM_AMERITA').AsString = 'S';
  chkProfesional.Checked := sdqConsulta.FieldByName('EM_PROFESIONAL').AsString = 'S';
  chkFecAntAlta.Checked := sdqConsulta.FieldByName('EM_FECHAANTALTA').AsString = 'S';
  chkRecaDictamen.Checked := sdqConsulta.FieldByName('EM_RECADICTAMEN').AsString = 'S';
  chkSugReca.Checked := sdqConsulta.FieldByName('EM_AVSUGRECA').AsString = 'S';
  chkSeguimientoSin.Checked := sdqConsulta.FieldByName('EM_SEGUIMIENTOSIN').AsString = 'S';
  chkSeguimientoCon.Checked := sdqConsulta.FieldByName('EM_SEGUIMIENTOCON').AsString = 'S';
  chkTelegramaProf.Checked := sdqConsulta.FieldByName('EM_TELEGRECAPROF').AsString = 'S';
  chkTelegramaPrest.Checked := sdqConsulta.FieldByName('EM_TELEGRECAPREST').AsString = 'S';
  edEventoAnt.Text := sdqConsulta.FieldByName('EM_EVENTOANTERIOR').AsString;
  chkCapInt.Checked := sdqConsulta.FieldByName('EM_CAPINT').AsString = 'S';
  chkIniciaReca.Checked := sdqConsulta.FieldByName('EM_INICIARECA').AsString = 'S';
  edEventoAuto.Text := sdqConsulta.FieldByName('EM_EVENTOAUTO').AsString;
  chkGeneraAutoriz.Checked := sdqConsulta.FieldByName('EM_GENERAAUTORIZACION').AsString = 'S';
  fraPrestacion.Codigo := sdqConsulta.FieldByName('EM_PRESTACIONAUT').AsString;
  fraGTrabajo.Codigo := sdqConsulta.FieldByName('EM_GTRABAJOAUT').AsString;
  fraPrestador.IDPrestador := sdqConsulta.FieldByName('EM_PRESTADORAUT').AsInteger;
  fraPrestador.FrameExit(nil);

end;

procedure TfrmManEventosReca.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.sem_eventomedicoreca';
  FieldBaja := 'EM_FECHABAJA';

  with fraEvento do
  begin
    TableName := 'SIN.sem_eventomedicoreca';
    FieldID := 'em_id';
    FieldCodigo := 'em_codigo';
    FieldDesc := 'em_descripcion';
    FieldBaja := 'em_fechabaja';
  end;

  with fraPrestacion do
  begin
    TableName := 'mpr_prestaciones';
    FieldID := 'pr_codigo';
    FieldCodigo := 'pr_codigo';
    FieldDesc := 'pr_descripcion';
    FieldBaja := 'pr_fbaja';
    ShowBajas := false;
  end;

  with fraGTrabajo do
  begin
    TableName := 'mgp_gtrabajo';
    FieldID := 'gp_codigo';
    FieldCodigo := 'gp_codigo';
    FieldDesc := 'gp_nombre';
    FieldBaja := 'gp_fbaja';
  end;
  fraPrestador.ShowBajas := false;
  vclextra.LockControls([fraPrestacion, fraGTrabajo, fraPrestador]);

end;

function TfrmManEventosReca.DoABM: boolean;
var proxID: integer;
begin
  sql.Clear;
  case ModoABM of
    maAlta:
    begin
      proxID := GetSecNextVal('SIN.SEQ_SEM_ID');
      Sql.PrimaryKey.Add('EM_ID', proxID);
      Sql.Fields.Add('EM_CODIGO', edCodigo.Text);
      Sql.Fields.Add('EM_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('EM_FECHAALTA', exDateTime);
      ArmarCondiciones;
    end;
    maModificacion:
    begin
      Sql.PrimaryKey.Add('EM_ID', sdqConsulta.FieldByName('EM_ID').AsString);
      if (not sdqConsulta.FieldByName('EM_FECHABAJA').IsNull) and
       MsgAsk('Se dispone a modificar un registro dado de baja, al modificarlo se reactivara.' + #13 +
              '¿Desea reactivar el registro?') then
      begin
        Sql.Fields.Add('EM_USUBAJA', '');
        Sql.Fields.Add('EM_FECHABAJA', '');
      end;

      Sql.Fields.Add('EM_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('EM_FECHAMODIF', exDateTime);
      ArmarCondiciones;
      Sql.SqlType := stUpdate;
    end;
    maBaja:
    begin
      Sql.PrimaryKey.Add('EM_ID', sdqConsulta.FieldByName('EM_ID').AsString);
      Sql.Fields.Add('EM_USUBAJA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('EM_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end;
  end;

  result := inherited DoABM;
end;

function TfrmManEventosReca.Validar: boolean;
var ssql: string;
begin
  verificar(edCodigo.Text = '', edCodigo, 'Debe ingresar un código');
  verificar(edDescripcion.Text = '', edDescripcion, 'Debe ingresar una descripción');

  if ModoABM = maAlta then
  begin
    ssql := ' select 1 from SIN.sem_eventomedicoreca ' +
            ' where em_codigo = :cod and em_fechabaja is null ';

    verificar(ExisteSqlEx(ssql, [edCodigo.Text]), edCodigo, 'El código ya existe');
  end;

  result := true;
end;

procedure TfrmManEventosReca.chkGeneraAutorizClick(Sender: TObject);
begin
  if chkGeneraAutoriz.Checked then
    vclextra.LockControls([fraPrestacion, fraGTrabajo, fraPrestador], false)
  else
  begin
    vclextra.LockControls([fraPrestacion, fraGTrabajo, fraPrestador]);
    fraPrestacion.Clear;
    fraGTrabajo.Clear;
    fraPrestador.Clear;
  end;
end;

procedure TfrmManEventosReca.fpAbmBeforeShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
    vclextra.LockControls(edCodigo)
  else
    vclextra.LockControls(edCodigo, false);
end;

procedure TfrmManEventosReca.ArmarCondiciones;
begin
  Sql.Fields.Add('EM_DESCRIPCION', edDescripcion.Text);
  if edCodCartaDoc.Text <> '' then
    Sql.Fields.Add('EM_CODCARTADOC', edCodCartaDoc.Text);
  Sql.Fields.Add('EM_AUTOMATICO', String(IIF(chkAutomatico.Checked, 'S', 'N')));
  if edDigitaliza.Text <> '' then
    Sql.Fields.Add('EM_DIGITALIZA', edDigitaliza.Text);
  Sql.Fields.Add('EM_IMPRIMIRSRT', String(IIF(chkImprimirSRT.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_TELEGRAMA', String(IIF(chkTelegrama.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_TELEGRAMATRAB', String(IIF(chkTelegramaTrab.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_CITACION', String(IIF(chkCitacion.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_SEGUIMIENTO', String(IIF(chkSeguimiento.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_REUBICACION', String(IIF(chkReubicacion.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_PARTEEVOLUTIVO', String(IIF(chkParteEvolutivo.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_ALTARECA', String(IIF(chkAltaReca.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_CITACIONDOBLE', String(IIF(chkCitacDoble.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_NOTIFICACION', String(IIF(chkNotificacion.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_RESPONSABLE', String(IIF(chkResponsable.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_SEGTERRENO', String(IIF(chkSegTerreno.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_DERIVINTERIOR', String(IIF(chkDerInterior.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_EVENTOSRT', String(IIF(chkEventoSRT.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_AMERITA', String(IIF(chkAmerita.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_PROFESIONAL', String(IIF(chkProfesional.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_FECHAANTALTA', String(IIF(chkFecAntAlta.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_RECADICTAMEN', String(IIF(chkRecaDictamen.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_AVSUGRECA', String(IIF(chkSugReca.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_SEGUIMIENTOSIN', String(IIF(chkSeguimientoSin.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_SEGUIMIENTOCON', String(IIF(chkSeguimientoCon.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_TELEGRECAPROF', String(IIF(chkTelegramaProf.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_TELEGRECAPREST', String(IIF(chkTelegramaPrest.Checked, 'S', 'N')));
  if edEventoAnt.Text <> '' then
    Sql.Fields.Add('EM_EVENTOANTERIOR', edEventoAnt.Text);
  Sql.Fields.Add('EM_CAPINT', String(IIF(chkCapInt.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_INICIARECA', String(IIF(chkIniciaReca.Checked, 'S', 'N')));
  if edEventoAuto.Text <> '' then
    Sql.Fields.Add('EM_EVENTOAUTO', edEventoAuto.Text);
  Sql.Fields.Add('EM_GENERAAUTORIZACION', String(IIF(chkGeneraAutoriz.Checked, 'S', 'N')));
  Sql.Fields.Add('EM_PRESTACIONAUT', String(IIF(fraPrestacion.Codigo = '', '', fraPrestacion.Codigo)));
  Sql.Fields.Add('EM_GTRABAJOAUT', String(IIF(fraGTrabajo.IsEmpty, '', fraGTrabajo.Codigo)));
  Sql.Fields.Add('EM_PRESTADORAUT', String(IIF(fraPrestador.IsEmpty, '', fraPrestador.IDPrestador)));

end;

end.
