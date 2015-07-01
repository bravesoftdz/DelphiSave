unit unAvisosContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, sqlfuncs,
  customdlgs, undmprincipal, internet, strutils, ansisql,
  unfraEstablecimiento, RxPlacemnt;

type
  TfrmAvisosContrato = class(TfrmCustomGridABM)
    fraEmpresaABM: TfraEmpresa;
    fraMotivosABM: TfraCodigoDescripcion;
    lblEmpresa: TLabel;
    lblMotivo: TLabel;
    lblMails: TLabel;
    gbEmpresa: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    gbMotivo: TGroupBox;
    fraMotivos: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    edMails: TMemo;
    fpEstablecimiento: TFormPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAceptarEst: TButton;
    btnCancelarEst: TButton;
    fraEmpresaEst: TfraEmpresa;
    fraMotivoEst: TfraCodigoDescripcion;
    edMailsEst: TMemo;
    chkEstablecimiento: TCheckBox;
    btnContinuarEst: TButton;
    gbEstablecimiento: TGroupBox;
    Label4: TLabel;
    fraEstab: TfraEstablecimiento;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    function esEstablecimiento: boolean;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    function ValidarDatosEstablecimiento: boolean;
    function getIdAviso: string;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    function ValidarVariosMails(mails: string): Boolean;
    function EliminarEspacios(cadena: string): String;
    function EliminarSeparadoresDuplicados(cadena: string): String;
    function FormatearCadena(cadena: string): String;
    procedure fpAbmShow(Sender: TObject);
    procedure LimpiarEstablecimiento;
    procedure CargarEstablecimiento;
    procedure fpEstablecimientoShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure AgregarEstablecimiento(Sender: TObject);
    function GetMailAviso: string;
    procedure btnAceptarEstClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnContinuarEstClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  end;

var
  frmAvisosContrato: TfrmAvisosContrato; cancela: boolean; proxID: integer;

implementation

uses
  VCLExtra, unCustomConsulta, unPrincipal;

const
  MAX_LENGTH_MAILS = 2000;

{$R *.dfm}

procedure TfrmAvisosContrato.FormCreate(Sender: TObject);
begin
  inherited;
  sql.TableName := 'SIN.SAC_AVISOSPORCONTRATO';
  ShowActived := false;
  with fraMotivosABM do
  begin
    TableName := 'SIN.SMA_MOTIVOSAVISOS';
    FieldBaja := 'MA_FECHABAJA';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    ShowBajas := false;
  end;
  with fraMotivos do
  begin
    TableName := 'SIN.SMA_MOTIVOSAVISOS';
    FieldBaja := 'MA_FECHABAJA';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    ShowBajas := false;
  end;
  with fraMotivoEst do
  begin
    TableName := 'SIN.SMA_MOTIVOSAVISOS';
    FieldBaja := 'MA_FECHABAJA';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    ShowBajas := false;
  end;

  fraEmpresaABM.ShowBajas := True;
  fraEmpresaEst.ShowBajas := True;
  fraEmpresaFiltro.ShowBajas := True;
  VCLExtra.LockControls([fraEmpresaEst, fraMotivoEst]);
end;

procedure TfrmAvisosContrato.ClearControls;
begin
  inherited;
  chkEstablecimiento.Checked := false;
  fraEmpresaABM.Clear;
  fraMotivosABM.Clear;
  edMails.Clear;
end;

function TfrmAvisosContrato.esEstablecimiento: boolean;
begin
  esEstablecimiento := sdqConsulta.FieldByName('es_nombre').AsString <> '';
end;

function TfrmAvisosContrato.DoABM: boolean;
begin
  try
    sql.Clear;
    if ModoABM = maAlta Then
    begin
      proxID := GetSecNextVal('SIN.SEQ_SAC_PK');
      Sql.PrimaryKey.Add('AC_ID', proxID);
      Sql.Fields.Add('AC_CONTRATO', fraEmpresaABM.Contrato);
      Sql.Fields.Add('AC_IDMOTIVO', fraMotivosABM.Codigo);
      Sql.Fields.Add('AC_MAILS', edMails.Text);
      Sql.Fields.Add('AC_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AC_FECHAALTA', exDateTime);
      if chkEstablecimiento.Checked then
        Sql.Fields.Add('AC_ESTABLECIMIENTO', 'S');
      Sql.SqlType := stInsert;
    end
    else
    begin
      if ModoABM = maBaja then
      begin
        Sql.PrimaryKey.Add('AC_ID', sdqConsulta.FieldByName('AC_ID').AsString);
        Sql.Fields.Add('AC_USUBAJA', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('AC_FECHABAJA', exDateTime);
        Sql.SqlType := stUpdate;
      end
      else
      begin
        Sql.PrimaryKey.Add('AC_ID', sdqConsulta.FieldByName('AC_ID').AsString);
        Sql.Fields.Add('AC_CONTRATO', fraEmpresaABM.Contrato);
        Sql.Fields.Add('AC_IDMOTIVO', fraMotivosABM.Codigo);
        Sql.Fields.Add('AC_MAILS', edMails.Text);
        Sql.Fields.Add('AC_USUMODIF', frmPrincipal.DBLogin.UserID);
        Sql.Fields.Add('AC_FECHAMODIF', exDateTime);
        Sql.Fields.Add('AC_FECHABAJA', '');
        Sql.Fields.Add('AC_USUBAJA', '');
        if chkEstablecimiento.Checked then
          Sql.Fields.Add('AC_ESTABLECIMIENTO', 'S');
        Sql.SqlType := stUpdate;
      end;
    end;

    result := inherited DoABM;

  except
    on e:exception do
      DoABM := false;
  end;
end;

function TfrmAvisosContrato.Validar: boolean;
var
  ssql, acid: string;
begin
  verificar(fraEmpresaABM.IsEmpty, fraEmpresaABM, 'Debe seleccionar una empresa');
  verificar(fraMotivosABM.IsEmpty, fraMotivosABM, 'Debe seleccionar un motivo');

  //if ModoABM = maAlta then
  //begin
  ssql := ' select ac_id from SIN.SAC_AVISOSPORCONTRATO ' +
          ' where ac_contrato = :cont and ac_idmotivo = :mot ' +
          ' and ac_fechabaja is null ' ;
  acid := ValorSqlEx(ssql, [fraEmpresaABM.Contrato, fraMotivosABM.Codigo]);

  verificar((acid <> '') and (acid <> sdqConsulta.FieldByName('ac_id').AsString), fraEmpresaABM, 'Ya existe un aviso para la empresa y motivo seleccionado');
  //end;
  verificar(edMails.Text = '', edMails, 'Debe ingresar al menos un destinatario');
  edmails.text := FormatearCadena(edmails.text);
  verificar(ValidarVariosMails(edMails.Text) = false, edMails, 'Algunas de las direcciones de e-mail ingresadas es incorrecta');
  result := true;
end;

function TfrmAvisosContrato.ValidarDatosEstablecimiento: boolean;
var
  ssql, aeid: string;
begin
  //result := false;
  verificar(fraEstab.IsEmpty, fraEstab, 'Debe seleccionar un establecimiento');
  //if ModoABM = maAlta then
  //begin
  ssql := ' select ae_id from sin.sae_avisosestablecimiento ' +
           ' where ae_idavisocontrato = :idaviso and ae_idestablecimiento = :idest and ae_fechabaja is null';
  aeid := valorsqlex(ssql, [proxID, fraEstab.ID]);
  
  verificar((aeid <> '') and (aeid <> sdqConsulta.FieldByName('ae_id').AsString), fraEstab, 'Ya existe un aviso para el establecimiento y motivo seleccionado');
  //end;
  verificar(edMailsEst.Text = '', edMailsEst, 'Debe ingresar al menos un destinatario');
  edMailsEst.text := FormatearCadena(edmailsEst.text);
  Verificar(Length(edMailsEst.Lines.Text) > MAX_LENGTH_MAILS, edMailsEst, 'El texto no puede superar los ' + IntToStr(MAX_LENGTH_MAILS) + ' caracteres');
  verificar(ValidarVariosMails(edMailsEst.Text) = false, edMailsEst, 'Algunas de las direcciones de e-mail ingresadas es incorrecta');
  ValidarDatosEstablecimiento := true;
end;

function TfrmAvisosContrato.getIdAviso: string;
var
  ssql: string;
begin

  verificar(fraEmpresaABM.IsEmpty, fraEmpresaABM, 'Debe seleccionar una empresa');
  verificar(fraMotivosABM.IsEmpty, fraMotivosABM, 'Debe seleccionar un motivo');
  verificar(edMails.Text = '', edMails, 'Debe ingresar una dirección válida');
  getIdAviso := '';

  if ModoABM = maAlta then
  begin
    ssql := ' select ac_id from SIN.SAC_AVISOSPORCONTRATO ' +
            ' where ac_contrato = :cont and ac_idmotivo = :mot ' +
            ' and ac_fechabaja is null ' ;
    getIdAviso := ValorSqlEx(ssql, [fraEmpresaABM.Contrato, fraMotivosABM.Codigo]);

  end;
end;

procedure TfrmAvisosContrato.tbRefrescarClick(Sender: TObject);
var
  ssql: string;
begin
  ssql := ' SELECT * ' +
            ' FROM (SELECT ac_id, ac_idmotivo, ac_contrato, ac_mails, em_cuit, em_nombre, ' +
                         ' ac_fechabaja, ma_descripcion, NULL es_nombre, NULL es_nroestableci, ' +
                         ' NULL ae_id, NULL ae_fechabaja, NULL ae_mails, ac_establecimiento ' +
                    ' FROM SIN.sac_avisosporcontrato, afi.aco_contrato, ' +
                         ' afi.aem_empresa, SIN.sma_motivosavisos ' +
                   ' WHERE ac_contrato = co_contrato AND co_idempresa = em_id ' +
                     ' AND ac_idmotivo = ma_codigo AND ma_fechabaja IS NULL ' +
                  ' UNION ALL ' +
                  ' SELECT ac_id, ac_idmotivo, ac_contrato, ae_mails, em_cuit, em_nombre, ' +
                         ' ac_fechabaja, ma_descripcion, es_nombre, es_nroestableci, ae_id, ' +
                         ' ae_fechabaja, ae_mails, ac_establecimiento ' +
                    ' FROM SIN.sac_avisosporcontrato, afi.aco_contrato, afi.aem_empresa, ' +
                         ' SIN.sma_motivosavisos, SIN.sae_avisosestablecimiento, aes_establecimiento ' +
                   ' WHERE ac_contrato = co_contrato AND co_idempresa = em_id AND ac_idmotivo = ma_codigo ' +
                     ' AND ma_fechabaja IS NULL AND ae_idavisocontrato = ac_id ' +
                     ' AND es_id = ae_idestablecimiento) ' +
           ' WHERE 1 = 1 ';

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND AC_CONTRATO = ' + IntToStr(fraEmpresaFiltro.Contrato);
  if not fraMotivos.IsEmpty then
    ssql := ssql + ' AND AC_IDMOTIVO = ' + fraMotivos.Codigo;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmAvisosContrato.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraMotivos.Clear;
end;

function TfrmAvisosContrato.ValidarVariosMails(mails: string): Boolean;
var
  temp: string;
  i, comaanterior: integer;
  valido: boolean;
begin
  valido := True;

  if MidStr(mails, length(mails), 1) <> ',' then
    mails := mails + ',';

  if pos(' ', mails) = 0 then
  begin
    comaanterior := 0;
    for i:= 1 to length(mails) do
    begin
      if (mails[i] = ',') then
      begin
        temp := MidStr(mails, comaanterior + 1, i-comaanterior-1);
        valido := valido and IsEMail(temp);
        comaanterior := i;
      end;
    end;
  end
  else
    valido := false;
  ValidarVariosMails := valido;
end;

//DFG - 27/09/2011//
function TfrmAvisosContrato.EliminarEspacios(cadena: string): String;
var
  i: integer;
begin
  i:= pos(' ', cadena);
  while i <> 0 do
  begin
     delete (cadena, i, 1);
     i:= pos(' ', cadena);
  end;

  EliminarEspacios := cadena;
end;

//DFG - 27/09/2011//
function TfrmAvisosContrato.EliminarSeparadoresDuplicados(cadena: string): String;
var
  i, j: integer;
begin
  for i := 1 to length(cadena) do
  begin
     if cadena[i] = ',' then
     begin
       j := i + 1;
       while cadena[j] = ',' do
         delete (cadena, j, 1);
     end;
  end;
  EliminarSeparadoresDuplicados := cadena;
end;

//DFG - 27/09/2011//
function TfrmAvisosContrato.FormatearCadena(cadena: string): String;
begin
  cadena := EliminarEspacios(cadena);
  cadena := StringReplace(cadena, ';', ',', [rfReplaceAll]);
  cadena := EliminarSeparadoresDuplicados(cadena);
  if MidStr(cadena, length(cadena), 1) = ',' then
    delete(cadena, length(cadena), 1);
  FormatearCadena := cadena;
end;

procedure TfrmAvisosContrato.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
  begin
    fpabm.Caption := 'Modificar aviso';
    VCLExtra.LockControls([fraEmpresaABM, fraMotivosABM, chkEstablecimiento]);
  end
  else
  begin
    fpabm.Caption := 'Agregar aviso';
    VCLExtra.LockControls([fraEmpresaABM, fraMotivosABM, chkEstablecimiento], false);
  end;
end;

procedure TfrmAvisosContrato.LimpiarEstablecimiento;
begin
  fraEstab.Clear;
  edMailsEst.Clear;
end;

procedure TfrmAvisosContrato.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
end;

procedure TfrmAvisosContrato.CargarEstablecimiento;
begin
  fraEstab.Clear;
  edMailsEst.Clear;
  fraEmpresaEst.Contrato := fraEmpresaABM.Contrato;
  fraMotivoEst.Codigo := framotivosABM.Codigo;
  fraEstab.fraEmpresa := fraEmpresaEst;
  fraEstab.ExtraCondition := ' AND NOT EXISTS( ' +
                                     ' SELECT 1 ' +
                                       ' FROM SIN.sae_avisosestablecimiento, SIN.sac_avisosporcontrato ' +
                                      ' WHERE ae_idavisocontrato = ac_id ' +
                                        ' AND ac_contrato = ' + SqlValue(fraEmpresaEst.Contrato) +
                                        ' AND ac_idmotivo = ' + fraMotivoEst.Codigo +
                                        ' AND ae_idestablecimiento = es_id ' +
                                        ' AND es_fechabaja IS NULL ' +
                                        ' AND ae_fechabaja IS NULL ' +
                                        ' AND ac_fechabaja IS NULL)';
end;

procedure TfrmAvisosContrato.fpEstablecimientoShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
  begin
    fpEstablecimiento.Caption := 'Modificar aviso';
    vclextra.LockControls([fraEstab]);
    btnContinuarEst.Enabled := false;
  end
  else
  begin
    fpEstablecimiento.Caption := 'Agregar aviso';
    vclextra.LockControls([fraEstab], false);
    CargarEstablecimiento;
    btnContinuarEst.Enabled := true;
  end;
end;

procedure TfrmAvisosContrato.tbModificarClick(Sender: TObject);
begin
  //inherited;
  ModoABM := maModificacion;
  if esEstablecimiento then
  begin
    fraEmpresaEst.Contrato := sdqConsulta.fieldbyname('AC_CONTRATO').AsInteger;
    fraMotivoEst.Value := sdqConsulta.fieldbyname('AC_IDMOTIVO').AsInteger;
    fraEstab.ExtraCondition := '';
    fraEstab.Codigo := sdqConsulta.fieldbyname('ES_NROESTABLECI').AsString;

    edMailsEst.Lines.Text := sdqConsulta.fieldbyname('AE_MAILS').AsString;
    fpEstablecimiento.ShowModal;
  end
  else
  begin
    fraEmpresaABM.Contrato := sdqConsulta.fieldbyname('AC_CONTRATO').AsInteger;
    fraMotivosABM.Value := sdqConsulta.fieldbyname('AC_IDMOTIVO').AsInteger;
    edMails.Text := sdqConsulta.fieldbyname('AC_MAILS').AsString;
    chkEstablecimiento.Checked := sdqConsulta.fieldbyname('ac_establecimiento').AsString = 'S';
    fpAbm.ShowModal;
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmAvisosContrato.AgregarEstablecimiento(Sender: TObject);
var
  abmOK: boolean;
  idAviso, mailaviso, op: string;
  modalres: TModalResult;
begin
  proxID := 0;
  abmOK := true;
  mailaviso := GetMailAviso;
  if mailaviso <> '' then
    edMails.Lines.Text := mailaviso;
  idAviso := getIdAviso;
  BeginTrans;
  if idAviso = '' then
    abmOK := DoABM
  else
    proxID := StrToInt(idAviso);

  modalres := fpEstablecimiento.ShowModal;
  if (abmOK = false) or (modalres = mrAbort) or (modalres = mrCancel) then
  begin
    op := 'rollback';
    if modalres = mrCancel then
      if MsgBox('Desea guardar los cambios realizados hasta el momento?', MB_ICONQUESTION + MB_YESNO) = mrYes then
        op := 'commit'
    else
    begin
      msgbox('Se ha producido un error al intentar guardar los datos');
    end;
  end
  else
    if modalres = mrOk then
      op := 'commit';

  if op = 'commit' then
  begin
    CommitTrans;
    fpAbm.ModalResult := mrOK;
    tbRefrescarClick(nil);
  end
  else
  begin
    Rollback;
    fpAbm.ModalResult := mrCancel;
  end;
end;

function TfrmAvisosContrato.GetMailAviso: string;
var
  ssql: string;
begin
  ssql := ' select ac_mails from sin.sac_avisosporcontrato ' +
          '  where ac_contrato = :con and ac_idmotivo = :mot and ac_fechabaja is null ';
  GetMailAviso := ValorSqlEx(ssql, [fraEmpresaABM.Contrato, fraMotivosABM.Value]);
end;

procedure TfrmAvisosContrato.btnAceptarEstClick(Sender: TObject);
var
  ssql: string;
begin
  if ValidarDatosEstablecimiento then
  begin
    case ModoABM of
      maAlta:
      begin
        ssql := ' INSERT INTO sin.sae_avisosestablecimiento (ae_id, ae_idavisocontrato, ae_idestablecimiento, ae_mails, ae_usualta, ae_fechaalta) ' +
                ' VALUES (:id, :idac, :idest, :mail, :usualta, :fecalta) ';
        try
          EjecutarSqlSTEx(ssql, [GetSecNextVal('SIN.SEQ_SAE_ID'), proxID, fraEstab.ID, edMailsEst.Text,
                               frmPrincipal.DBLogin.UserID, datetostr(DBDate)]);
        except
          on e:exception do
            fpEstablecimiento.ModalResult := mrAbort;
        end;
      end;
      maModificacion:
      begin

        ssql := ' UPDATE sin.sae_avisosestablecimiento ' +
                '    SET ae_mails = :mails, ae_usumodif = :usu, ae_fechamodif = :fec, ' +
                '        ae_usubaja = NULL, ae_fechabaja = NULL ' +
                ' WHERE ae_id = :aeid ';

        try
          EjecutarSqlSTEx(ssql, [edMailsEst.Text, frmPrincipal.DBLogin.UserID,
                                 datetostr(DBDate), sdqConsulta.FieldByName('ae_id').AsString]);
        except
          on e:exception do
            fpEstablecimiento.ModalResult := mrAbort;
        end;
      end;
    end;
    if Sender <> nil then
      fpEstablecimiento.ModalResult := mrOK;
  end;
end;

procedure TfrmAvisosContrato.tbEliminarClick(Sender: TObject);
var
  ssql: string;
begin
  if esEstablecimiento then
  begin
    if MsgBox('¿ Desea dar de baja el registro seleccionado ?', MB_ICONQUESTION + MB_YESNO) = mrYes then
    begin
      ssql := ' UPDATE SIN.sae_avisosestablecimiento ' +
              '    SET ae_fechabaja = trunc(sysdate), ' +
              '        ae_usubaja = :usu ' +
              '  WHERE ae_id = :idaviso ';
      EjecutarSqlEx(ssql, [frmPrincipal.DBLogin.UserID, sdqConsulta.FieldByName('ae_id').AsInteger]);

    end;
  end
  else
    inherited;
end;

procedure TfrmAvisosContrato.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if esEstablecimiento and (not (sdqConsulta.FieldByName('ae_fechabaja').IsNull)) or
     not esEstablecimiento and (not (sdqConsulta.FieldByName('ac_fechabaja').IsNull)) then
    AFont.Color := clRed;
end;

procedure TfrmAvisosContrato.btnContinuarEstClick(Sender: TObject);
begin
  btnAceptarEstClick(nil);
  CargarEstablecimiento;
end;

procedure TfrmAvisosContrato.btnAceptarClick(Sender: TObject);
begin
  Verificar(Length(edMails.Lines.Text) > MAX_LENGTH_MAILS, edMails, 'El texto no puede superar los ' + IntToStr(MAX_LENGTH_MAILS) + ' caracteres');
  if chkEstablecimiento.Checked then
    AgregarEstablecimiento(nil)
  else
    inherited;
end;

end.

