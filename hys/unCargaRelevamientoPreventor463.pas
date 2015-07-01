unit unCargaRelevamientoPreventor463;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Menus, unGrids;

type
  TfrmCargaRelevamientoPreventor463 = class(TfrmCustomGridABM)
    Label1: TLabel;
    edFechaVisita: TDateEdit;
    tbVisitaAsoc: TToolBar;
    btnAsociarVisita: TToolButton;
    Panel1: TPanel;
    btnAceptarCarga: TButton;
    btnCancelarCarga: TButton;
    pnlBottom: TPanel;
    fraItem: TfraCodigoDescripcion;
    lbItem: TLabel;
    cbCumpSi: TCheckBox;
    lbCumplimiento: TLabel;
    cbCumpNo: TCheckBox;
    cbCumpNA: TCheckBox;
    edFechaRegularizacion: TDateEdit;
    lbFechaRegularizacion: TLabel;
    lbFechaViaticos: TLabel;
    edFechaVerificacion: TDateEdit;
    edObservacion: TMemo;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    tbFormularios: TToolButton;
    tbGremialistas: TToolButton;
    tbRelevContratistas: TToolButton;
    tbResponsable: TToolButton;
    pmnuForms: TPopupMenu;
    mnuAnexoCancerigenos: TMenuItem;
    mnuAnexoDifenilos: TMenuItem;
    mnuAnexoAccIndMayores: TMenuItem;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    tbActualizacionMasiva: TToolButton;
    fpCargaMasiva: TFormPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    edFechaRegulMasiva: TDateEdit;
    edFechaVerifMasiva: TDateEdit;
    edObservacionMasiva: TMemo;
    btnAceptarMasiva: TButton;
    btnCancelarMasiva: TButton;
    procedure btnAsociarVisitaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure btnAceptarCargaClick(Sender: TObject);
    procedure cbCumpNAClick(Sender: TObject);
    procedure cbCumpNoClick(Sender: TObject);
    procedure cbCumpSiClick(Sender: TObject);
    procedure mnuAnexoCancerigenosClick(Sender: TObject);
    procedure mnuAnexoDifenilosClick(Sender: TObject);
    procedure mnuAnexoAccIndMayoresClick(Sender: TObject);
    procedure tbGremialistasClick(Sender: TObject);
    procedure tbRelevContratistasClick(Sender: TObject);
    procedure tbResponsableClick(Sender: TObject);
    procedure ShortCutControl1ShortCuts9ShortCutPress(Sender: TObject);
    procedure ShortCutControl1ShortCuts10ShortCutPress(Sender: TObject);
    procedure ShortCutControl1ShortCuts11ShortCutPress(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbActualizacionMasivaClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAceptarMasivaClick(Sender: TObject);
    procedure FSFormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    SelectedList: TBookMarkLst;
    FCuit : String;
    FContrato : Integer;
    FEstableci : Integer;
    FOperativo : String;
    FTipoFet : String;
    FIdRelev : Integer;
    FIdResAnexo : Integer;
    procedure mnuAnexos(Sender: TObject; TipoFormulario: Byte;
      MenuCaption: String);
    { Private declarations }
  public
    { Public declarations }
    procedure Load(cont, estab: integer; operat, tipo: String);
    property Contrato         : Integer  read FContrato         write FContrato;
    property Estableci        : Integer  read FEstableci        write FEstableci;
    property Operativo        : String   read FOperativo        write FOperativo;
    property TipoFet          : String   read FTipoFet          write FTipoFet;
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  end;

var
  frmCargaRelevamientoPreventor463: TfrmCargaRelevamientoPreventor463;

implementation

uses
  unConsVisitasRealizadas, unDmPrincipal, AnsiSql, unCustomConsulta,
  CustomDlgs, unSesion, VclExtra, SqlFuncs, unComunesFet,DateUtils,
  unRelevTiposAnexos,unConstFet, unRelevGremialista, unRelevContratistas, unRelevResponsable,
  Math;

const
  FormAitem6     = 6;
  FormCitem5     = 397;
  FormCitem7     = 399;
  FormBitem10    = 171;

{$R *.dfm}

{ TfrmCargaRelevamientoPreventor463 }

procedure TfrmCargaRelevamientoPreventor463.Load(cont, estab : integer; operat, tipo : String);
begin
  BeginTrans();
  Contrato := cont;
  FCuit := ValorSql(
    ' SELECT em_cuit '+
    '   FROM afi.aco_contrato, afi.aem_empresa '+
    '  WHERE co_contrato = '+SqlValue(Contrato)+
    '    AND co_idempresa = em_id ');
  Estableci := estab;
  Operativo := operat;
  TipoFet := tipo;
  tbNuevo.Enabled := False;
  tbModificar.Enabled := False;
  edFechaVisita.Date := ValorSqlDateTime(
    ' SELECT MAX (RV_FECHA) '+
    '   FROM art.prv_resvisitas, hys.hvm_visitamotivo '+
    '  WHERE rv_cuit = '+SqlValue(FCuit)+
    '    AND rv_estableci = '+SqlValue(Estableci)+
    '    AND rv_tipo = '+SqlValue(TipoFet)+
    '    AND rv_operativo = '+SqlValue(Operativo)+
    '    AND rv_fechabaja IS NULL '+
    '    AND vm_fechabaja IS NULL '+
    '    AND vm_idvisita = rv_id '+
    '    AND vm_idmotivo = 63 ');
end;

procedure TfrmCargaRelevamientoPreventor463.ClearControls;
begin
  fraItem.Clear;
  cbCumpSi.Checked := False;
  cbCumpNo.Checked := False;
  cbCumpNA.Checked := False;
  edFechaRegularizacion.Clear;
  edFechaVerificacion.Clear;
  edObservacion.Clear;
end;

function TfrmCargaRelevamientoPreventor463.DoABM: Boolean;
var
  idFormulario, diasresta, iditemrelev : Integer;
  fechaVisitaVerosimilitud, fechaContratoHasta ,fecharegul, fechaverif : TDate;
  AccMayores, Difenilos,cancerigeno,cumplimiento, observacion : String;
  AccMayoresAnt, DifenilosAnt, cancerigenoAnt : String;
begin

  if cbCumpSi.Checked then
    cumplimiento := 'S'
  else if cbCumpNo.Checked then
    cumplimiento := 'N'
  else if cbCumpNA.Checked then
    cumplimiento := 'X';
  iditemrelev := fraItem.Value;
  fecharegul := edFechaRegularizacion.Date;
  fechaverif := edFechaVerificacion.Date;
  observacion := edObservacion.Text;

  if (fecharegul = 0) and (cumplimiento = 'N' )and
     ((iditemrelev = FormAitem6) or (iditemrelev = FormCitem5) or
     (iditemrelev = FormCitem7) or (iditemrelev = FormBitem10)) then
  begin
    fechaContratoHasta := ValorSqlDateTime(
      ' SELECT co_vigenciahasta '+
      '   FROM afi.aco_contrato '+
      '  WHERE co_contrato = '+ SqlValue(Contrato));
    diasResta := 0;
    if (fechaContratoHasta - DBDate) <= 60 then
    begin
      fechaContratoHasta := IncYear(fechaContratoHasta);
    end;
    if (iditemrelev = FormAitem6) or
       (iditemrelev = FormCitem5) then
    begin
      diasResta := 30;
    end;

    if (iditemrelev = FormCitem7) or
       (iditemrelev = FormBitem10) then
    begin
      diasResta := 90;
    end;
    fecharegul := fechaContratoHasta - diasResta;
  end;

  if cumplimiento = 'N' then
  begin
    fechaVisitaVerosimilitud := ValorSqlDateTime(
      ' SELECT max(rv_fecha) '+
      '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
      '  WHERE rv_id = vm_idvisita '+
      '    AND rv_cuit = '+SqlValue(FCuit)+
      '    AND rv_estableci = '+SqlValue(Estableci)+
      '    AND rv_fecha >= art.actualdate - 365 '+
      '    AND vm_idmotivo in (63, 64) ' +
      '    AND vm_fechabaja IS NULL '+
      '    AND rv_fechabaja IS NULL ');
      DenunciaIncumplimiento(iditemrelev,fechaVisitaVerosimilitud,FCuit, FContrato, Estableci);
  end;
  try
    Sql.Clear;
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('IL_OBSERVACIONDENUNCIA', edObservacion.Text);
    Sql.Fields.Add('IL_FECHAREGULARIZACION', fecharegul);
    Sql.Fields.Add('IL_FECHAVERIFICACION', fechaverif);
    Sql.Fields.Add('IL_CUMPLIMIENTO', cumplimiento);
    Sql.PrimaryKey.Add('IL_IDRELEVRIESGOLABORAL', FIdRelev);
    Sql.PrimaryKey.Add('IL_IDITEMANEXO', fraItem.Value);
    Sql.Fields.Add('IL_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('IL_FECHAMODIF', exDateTime );
    Sql.Fields.Add('IL_USUBAJA', exNull );
    Sql.Fields.Add('IL_FECHABAJA', exNull );
    EjecutarSQLST(Sql.Sql);
  except
    on E: Exception do
    begin
       Rollback(True);
       ErrorMsg(E, 'Error al guardar el item.');
       Abort;
    end;
  end;

  idFormulario := ValorSqlInteger(
    ' SELECT ia_idtipoformanexo '+
    '   FROM hys.hia_itemanexo '+
    ' WHERE ia_id = '+SqlValue(iditemrelev));

  if idFormulario = 1 then
  begin
    cancerigenoAnt := ValorSql('SELECT EP_CANCERIGENOS FROM HYS.HEP_ESTABPORPREVENTOR '+
                               ' WHERE EP_CUIT = '+SqlValue(FCuit)+
                               '   AND EP_ESTABLECI = '+SqlValue(Estableci));
    if (cumplimiento = 'S') then
      Cancerigeno := 'S'
    else
      Cancerigeno := 'N';
    if cancerigenoAnt <> cancerigeno then
    begin
      MsgBox('El item que esta modificando modifica la planilla de Cancerigenos Verifiquela.');
      mnuAnexoCancerigenosClick(nil);
    end;

    EjecutarSqlST(
      ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
      '    SET EP_CANCERIGENOS ='+SqlValue(Cancerigeno)+
      '  WHERE EP_CUIT = '+SqlValue(FCuit)+
      '    AND EP_ESTABLECI = '+SqlValue(Estableci));
  end;

  if idFormulario = 2 then
  begin
    DifenilosAnt := ValorSql('SELECT EP_DIFENILOS FROM HYS.HEP_ESTABPORPREVENTOR '+
                               ' WHERE EP_CUIT = '+SqlValue(FCuit)+
                               '   AND EP_ESTABLECI = '+SqlValue(Estableci));

    if (cumplimiento = 'S') then
      Difenilos := 'S'
    else
      Difenilos := 'N';

    if DifenilosAnt <> Difenilos then
    begin
      MsgBox('El item que esta modificando modifica la planilla de Difenilos Verifiquela.');
      mnuAnexoDifenilosClick(nil);
    end;

    EjecutarSqlST(
      ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
      '    SET EP_DIFENILOS ='+SqlValue(Difenilos)+
      '  WHERE EP_CUIT = '+SqlValue(FCuit)+
      '    AND EP_ESTABLECI = '+SqlValue(Estableci));
  end;

  if idformulario = 3 then
  begin
    AccMayoresAnt := ValorSql( 'SELECT EP_ACCMAYORES FROM HYS.HEP_ESTABPORPREVENTOR '+
                               ' WHERE EP_CUIT = '+SqlValue(FCuit)+
                               '   AND EP_ESTABLECI = '+SqlValue(Estableci));

    if (cumplimiento = 'S') then
      AccMayores := 'S'
    else
      AccMayores := 'N';

    if AccMayoresAnt <> AccMayores then
    begin
      MsgBox('El item que esta modificando modifica la planilla de Accidente Mayores Verifiquela.');
      mnuAnexoAccIndMayoresClick(nil);
    end;

    EjecutarSqlST(
      ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
      '    SET EP_ACCMAYORES ='+SqlValue(AccMayores)+
      '  WHERE EP_CUIT = '+SqlValue(FCuit)+
      '    AND EP_ESTABLECI = '+SqlValue(Estableci));
  end;
  Result := inherited DoABM;
end;

procedure TfrmCargaRelevamientoPreventor463.LoadControls;
begin
  fraItem.Codigo := sdqConsulta.FieldByName('ia_nrodescripcion').AsString;
  cbCumpSi.Checked := sdqConsulta.FieldByName('il_cumplimiento').AsString = 'S';
  cbCumpNo.Checked := sdqConsulta.FieldByName('il_cumplimiento').AsString = 'N';
  cbCumpNA.Checked := sdqConsulta.FieldByName('il_cumplimiento').AsString = 'X';
  edFechaRegularizacion.Date := sdqConsulta.FieldByName('il_fecharegularizacion').AsDateTime;
  edFechaVerificacion.Date := sdqConsulta.FieldByName('il_fechaverificacion').AsDateTime;
  edObservacion.Text := sdqConsulta.FieldByName('il_observaciondenuncia').AsString;
  inherited;
//
end;

function TfrmCargaRelevamientoPreventor463.Validar: Boolean;
var
  fechaFormulario, fechaVisitaVerosimilitud : TDate;
  bModoPreventor : Boolean;
begin
  Verificar(not fraItem.IsSelected,fraItem,'Debe Seleccionar un item.');
  Verificar(not cbCumpSi.Checked and
            not cbCumpNo.Checked and
            not cbCumpNA.Checked,lbCumplimiento,'Debe Seleccionar un Cumplimiento.');


  if cbCumpNo.Checked then
  begin
    Verificar(edFechaRegularizacion.Date = 0, edFechaRegularizacion, 'Debe Ingresar la fecha de Regularización');
    Verificar(edFechaVerificacion.Date = 0, edFechaVerificacion, 'Debe Ingresar la fecha de Verificación');
  end
  else
  begin
    Verificar(edFechaRegularizacion.Date <> 0, edFechaRegularizacion, 'No debe Ingresar la fecha de Regularización');
    Verificar(edFechaVerificacion.Date <> 0, edFechaVerificacion, 'No debe Ingresar la fecha de Verificación');
  end;

  fechaVisitaVerosimilitud := ValorSqlDateTime(
            ' SELECT max(rv_fecha) '+
            '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
            '  WHERE rv_id = vm_idvisita '+
            '    AND rv_cuit = '+SqlValue(FCuit)+
            '    AND rv_estableci = '+SqlValue(Estableci)+
            '    AND rv_fecha >= art.actualdate - 365 '+
            '    AND vm_idmotivo in (63, 64) ' +
            '    AND vm_fechabaja IS NULL '+
            '    AND rv_fechabaja IS NULL ');

  fechaFormulario := ValorSqlDateTime(
        ' SELECT RL_FECHAFORMULARIO '+
        '   FROM hys.hrl_relevriesgolaboral '+
        '  WHERE rl_id = '+ SqlValue(FIdRelev));

  bModoPreventor := ExisteSql('SELECT 1 FROM hys.hrl_relevriesgolaboral '+
                                  ' WHERE rl_id = '+ SqlValue(FIdRelev)+
                                  '   AND rl_procedencia = ''P''');

  Verificar(edFechaVerificacion.Date < edFechaRegularizacion.Date,edFechaVerificacion,'La fecha de Verificacion debe ser mayor o igual a la de Regularización');
  Verificar((edFechaRegularizacion.Date <> 0) and (edFechaRegularizacion.Date < fechaFormulario), edFechaRegularizacion, 'La fecha de regulación debe ser mayor a la fecha de Formulario.' );
  If bModoPreventor then
  begin
    Verificar((edFechaRegularizacion.Date <> 0) and (edFechaRegularizacion.Date > (fechaVisitaVerosimilitud+365)),edFechaRegularizacion, 'La fecha de regulación debe ser menor a la fecha de visita mas 1 año.' );
    Verificar((edFechaVerificacion.Date <> 0) and (edFechaVerificacion.Date > (fechaVisitaVerosimilitud+365)),edFechaVerificacion, 'La fecha de verificación debe ser menor a la fecha de visita mas 1 año.' );
  end;
  Result := True;
end;

procedure TfrmCargaRelevamientoPreventor463.btnAsociarVisitaClick(
  Sender: TObject);
begin
  with TfrmConsVisitasRealizadas.Create(self) do
  try
    Init (FCuit,
          Estableci,
          Operativo,
          TipoFet,
          True);

    if ShowModal = mrOk then
    begin
      // Limpio los datos previos
      edFechaVisita.Date:= FFechaVisitaSeleccionada;
    end
  finally
    Free
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.FormCreate(Sender: TObject);
begin
  sdqConsulta.ParamByName('idrelev').AsInteger := 0;
  SelectedList := TBookMarkLst.Create;
  with fraItem do
  begin
    TableName   := 'HYS.HIA_ITEMANEXO';
    FieldID     := 'IA_ID';
    FieldCodigo := 'IA_NRODESCRIPCION';
    FieldDesc   := 'IA_DESCRIPCION';
    FieldBaja   := 'IA_FECHABAJA';
    Showbajas   := false;
    ExtraCondition := 'AND ia_idtituloanexo IN(SELECT ta_id '+
                      '       FROM hys.hta_titulosanexo '+
                      '      WHERE ta_idresolucionanexo = 0)'
  end;
  inherited;
  Sql.TableName := 'HYS.HIL_ITEMSRIESGOLABORAL';
end;

procedure TfrmCargaRelevamientoPreventor463.tbRefrescarClick(
  Sender: TObject);
var
  sSQLAnexos,sSql : String;
  idformulario, idRelevAnterior : Integer;
begin
  BeginTrans(True);
  sSql :=
    ' SELECT distinct 1 '+
    '   FROM art.prv_resvisitas, hys.hvm_visitamotivo '+
    '  WHERE rv_cuit = '+SqlValue(FCuit)+
    '    AND rv_estableci = '+SqlValue(Estableci)+
    '    AND rv_tipo = '+SqlValue(TipoFet)+
    '    AND rv_operativo = '+SqlValue(Operativo)+
    '    AND rv_fechabaja IS NULL '+
    '    AND vm_fechabaja IS NULL '+
    '    AND vm_idvisita = rv_id '+
    '    AND vm_idmotivo = 63 '+
    '    AND rv_fecha = '+SqlDate(edFechaVisita.Date);
  Verificar(not ExisteSql(sSql),edFechaVisita,'Debe ser una visita con Evaluacion de Verosimilitud ');
  sSql :=
    ' SELECT rl_id '+
    '   FROM hys.hrl_relevriesgolaboral hrl '+
    '  WHERE rl_contrato = '+SqlValue(Contrato)+
    '    AND rl_estableci = '+ SqlValue(Estableci)+
    '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = hrl.rl_estableci '+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = ''E'') '+
    '    AND rl_fechabaja IS NULL '+
    '    AND rl_procedencia = ''P'' ';
  FIdRelev := ValorSqlInteger(sSql);
  if FIdRelev = 0 then
  begin
    sSql :=
    ' SELECT rl_id '+
    '   FROM hys.hrl_relevriesgolaboral hrl '+
    '  WHERE rl_contrato = '+SqlValue(Contrato)+
    '    AND rl_estableci = '+ SqlValue(Estableci)+
    '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = hrl.rl_estableci '+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = ''E'') '+
    '    AND rl_fechabaja IS NULL '+
    '    AND rl_procedencia = ''E'' ';
    idRelevAnterior := ValorSqlInteger(sSql);
    Verificar(idRelevAnterior = 0, tbRefrescar,'No existe relevamiento por parte del empleador.');
    sSql :=
      ' SELECT rl_valido '+
      '   FROM hys.hrl_relevriesgolaboral hrl '+
      '  WHERE rl_contrato = '+SqlValue(Contrato)+
      '    AND rl_estableci = '+ SqlValue(Estableci)+
      '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = hrl.rl_estableci '+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = ''E'') '+
      '    AND rl_fechabaja IS NULL'+
      '    AND rl_procedencia = ''E'' ';
    Verificar(ValorSql(sSql)= 'N',tbRefrescar, 'Debe ser valido el Relevamiento del empleador ');
    try
      FIdRelev := GetSecNextVal('HYS.SEQ_HRL_RELEV_ID');
      EjecutarSqlST(
      '  INSERT INTO hys.hrl_relevriesgolaboral '+
      '              (rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_valido, '+
      '               rl_vigencia, rl_usualta, rl_fechaalta, rl_idresolucionanexo, '+
      '                rl_procedencia, rl_fechaformulario ) '+
      '    SELECT '+SqlValue(FIdRelev)+', rl_contrato, rl_estableci, rl_fecharecepcion,'+
      '   ''S'', rl_vigencia,'+SqlValue(Sesion.UserID)+',SYSDATE,rl_idresolucionanexo,''P'','+
      '   rl_fechaformulario ' +
      '      FROM hys.hrl_relevriesgolaboral '+
      '     WHERE rl_id = '+SqlValue(idRelevAnterior)+
      '       AND rl_fechabaja is null ');

      EjecutarSqlST(
        ' INSERT INTO hys.hil_itemsriesgolaboral '+
        '             (il_id, il_idrelevriesgolaboral, il_iditemanexo, il_cumplimiento, '+
        '              il_fecharegularizacion, il_fechaverificacion, '+
        '              il_observaciondenuncia, il_fechaalta, il_usualta, il_fechamodif, '+
        '              il_usumodif, il_fechabaja, il_usubaja) '+
        '   SELECT HYS.SEQ_HIL_ID.NEXTVAL, '+SqlValue(FIdRelev)+', il_iditemanexo, il_cumplimiento, '+
        '          il_fecharegularizacion, il_fechaverificacion, il_observaciondenuncia, '+
        '          il_fechaalta, il_usualta, il_fechamodif, il_usumodif, il_fechabaja, '+
        '          il_usubaja '+
        '     FROM hys.hil_itemsriesgolaboral '+
        '    WHERE il_idrelevriesgolaboral = '+SqlValue(idRelevAnterior)  );
      sSQLAnexos :=
        ' SELECT fr_id, fr_valido, fr_fechaalta, fr_usualta, fr_fechamodif, fr_usumodif, '+
        '        fr_fechabaja, fr_usubaja, fr_idtipoanexo '+
        '   FROM hys.hfr_formulariorelev '+
        '  WHERE fr_idrelevriesgolaboral = '+SqlValue(idRelevAnterior)+' AND fr_fechabaja IS NULL ';
      with GetQuery(sSQLAnexos) do
      try
        while not Eof do
        begin
          idFormulario := GetSecNextVal('HYS.SEQ_HFR_ID');
          EjecutarSqlST(
            '  INSERT INTO hys.hfr_formulariorelev( fr_id, fr_idrelevriesgolaboral, '+
            '         fr_valido, fr_fechaalta, fr_usualta, fr_idtipoanexo) '+
            '       VALUES ('+SqlValue(idFormulario)+','+SqlValue(FIdRelev)+','+
            SqlValue(fieldbyname('fr_valido').AsString)+',sysdate,'+
            SqlValue(Sesion.UserID)+','+
            SqlValue(fieldbyname('fr_idtipoanexo').AsString)+')');
          EjecutarSqlST(
            '  INSERT INTO hys.hif_itemsformulariorelev '+
            '              (if_id, if_idformulariorelev, if_iditemtipoanexo, if_cumplimiento, '+
            '               if_fechaalta, if_usualta) '+
            '    SELECT hys.seq_hif_id.NEXTVAL, '+SqlValue(idFormulario)+', if_iditemtipoanexo, '+
            '           if_cumplimiento, sysdate,'+ SqlValue(Sesion.UserID)+
            '      FROM hys.hif_itemsformulariorelev '+
            '     WHERE if_idformulariorelev = '+SqlValue(FieldByName('fr_id').AsString)+' AND if_fechabaja IS NULL ');
          Next;
        end;
      finally
        Free;
      end;
      EjecutarSqlST(
        ' INSERT INTO hys.hrr_responsablerelev '+
        '             (rr_id, rr_idrelevriesgolaboral, rr_valido, rr_cargo, '+
        '              rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, '+
        '              rr_titulo, rr_matricula, rr_entidad, rr_responsableform, '+
        '              rr_fechaalta, rr_usualta) '+
        '  SELECT HYS.SEQ_HRR_RESPID.NEXTVAL, '+SqlValue(FIdRelev)+', rr_valido, rr_cargo,'+
        '         rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, rr_titulo, '+
        '         rr_matricula, rr_entidad, rr_responsableform, SYSDATE,'+ SqlValue(Sesion.UserID)+
        '    FROM hys.hrr_responsablerelev '+
        '   WHERE rr_idrelevriesgolaboral = '+SqlValue(idRelevAnterior)+
        '     AND rr_fechabaja IS NULL ');
      EjecutarSqlST(
        ' INSERT INTO hys.hrg_relevgremialista '+
        '             (rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregremio, '+
        '             rg_fechaalta,rg_usualta) '+
        '   SELECT hys.seq_hrg_id.NEXTVAL, '+SqlValue(FIdRelev)+', rg_nrolegajo, '+
        '          rg_nombregremio, SYSDATE,'+ SqlValue(Sesion.UserID)+
        '     FROM hys.hrg_relevgremialista '+
        '    WHERE rg_idrelevriesgolaboral = '+SqlValue(idRelevAnterior)+
        '      AND rg_fechabaja IS NULL ');
      EjecutarSqlST(
        '  INSERT INTO hys.hrc_relevcontratista '+
        '              (rc_id, rc_idrelevriesgolaboral, rc_cuit, rc_fechaalta, rc_usualta) '+
        '    SELECT hys.seq_hrc_id.NEXTVAL,'+SqlValue(FIdRelev)+', rc_cuit,'+
        '           SYSDATE, '+ SqlValue(Sesion.UserID)+
        '      FROM hys.hrc_relevcontratista '+
        '     WHERE rc_idrelevriesgolaboral = '+SqlValue(idRelevAnterior)+
        '       AND rc_fechabaja IS NULL ');


    except
      on E: Exception do
      begin

        ErrorMsg(E, 'Error al duplicar el relevamiento. ' + #13#10 + E.Message );
      end;
    end;
  end
  else begin
    if not MsgAsk('Ya existe una evaluación de verosimilitud cargada. ¿Desea continuar?') then
      Abort;
  end;

  sdqConsulta.ParamByName('idrelev').AsInteger := FIdRelev;
  FIdResAnexo := ValorSql(' SELECT rl_idresolucionanexo FROM hys.hrl_relevriesgolaboral '+
                      '  WHERE rl_id = '+SqlValue(FIdRelev));

  fraItem.ExtraCondition := ' AND ia_idtituloanexo IN(SELECT ta_id '+
                                                      ' FROM hys.hta_titulosanexo '+
                                                      ' WHERE ta_idresolucionanexo = '+SqlValue(FIdResAnexo)+')';
  vclExtra.LockControls([edFechaVisita],True);
  tbVisitaAsoc.Enabled := False;
  tbFormularios.Enabled := True;
  tbGremialistas.Enabled := True;
  tbRelevContratistas.Enabled := True;
  tbResponsable.Enabled := True;
  tbNuevo.Enabled := True;
  inherited;
end;

procedure TfrmCargaRelevamientoPreventor463.tbSalirClick(Sender: TObject);
begin
  Rollback(True);
  inherited;
end;

procedure TfrmCargaRelevamientoPreventor463.btnAceptarCargaClick(
  Sender: TObject);
begin
  CommitTrans(True);
  ModalResult := mrOK;
end;

procedure TfrmCargaRelevamientoPreventor463.cbCumpNAClick(Sender: TObject);
begin
  if cbCumpNA.Checked then
  begin
    cbCumpSi.Checked := False;
    cbCumpNo.Checked := False;
  end;

end;

procedure TfrmCargaRelevamientoPreventor463.cbCumpNoClick(Sender: TObject);
begin
  if cbCumpNo.Checked then
  begin
    cbCumpSi.Checked := False;
    cbCumpNA.Checked := False;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.cbCumpSiClick(Sender: TObject);
begin
  if cbCumpSi.Checked then
  begin
    cbCumpNo.Checked := False;
    cbCumpNA.Checked := False;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.mnuAnexos(Sender: TObject;
    TipoFormulario: Byte; MenuCaption: String);
var
  vigencia : String;
begin
  vigencia := ValorSql(
      ' SELECT rl_vigencia '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_id = '+SqlValue(FIdRelev));
  with TfrmRelevTiposAnexos.Create(self) do
  try
    ModoABM := mfModif;
    FModoEmpleador := False;
    Cargar(FContrato, vigencia, TipoFormulario, FIdResAnexo, FIdRelev);
    Caption := StringReplace(MenuCaption, '&', '', [rfReplaceAll]);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.mnuAnexoCancerigenosClick(
  Sender: TObject);
begin
  mnuAnexos(Sender, FORMULARIO_TIPO_A, Self.mnuAnexoCancerigenos.Caption);
end;

procedure TfrmCargaRelevamientoPreventor463.mnuAnexoDifenilosClick(
  Sender: TObject);
begin
  mnuAnexos(Sender, FORMULARIO_TIPO_B, Self.mnuAnexoDifenilos.Caption);
end;

procedure TfrmCargaRelevamientoPreventor463.mnuAnexoAccIndMayoresClick(
  Sender: TObject);
begin
  mnuAnexos(Sender, FORMULARIO_TIPO_C, Self.mnuAnexoAccIndMayores.Caption);
end;

procedure TfrmCargaRelevamientoPreventor463.tbGremialistasClick(
  Sender: TObject);
begin
  with TfrmRelevGremialista.Create(self) do
  try
    Cargar(FIdRelev);
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.tbRelevContratistasClick(
  Sender: TObject);
begin
  with TfrmRelevContratista.Create(self) do
  try
    Cargar(FIdRelev);
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.tbResponsableClick(
  Sender: TObject);
var
  svigencia : String;
begin
  svigencia := ValorSql(
      ' SELECT rl_vigencia '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_id = '+SqlValue(FIdRelev));
  with TfrmRelevResponsable.Create(self) do
  try
    FModoEmpleador := false;
    Cargar(FIdRelev, FIdResAnexo);
    Contrato := FContrato;
    Vigencia := svigencia;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.ShortCutControl1ShortCuts9ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoCancerigenos.Enabled then
    mnuAnexoCancerigenosClick(nil);
end;

procedure TfrmCargaRelevamientoPreventor463.ShortCutControl1ShortCuts10ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoDifenilos.Enabled then
    mnuAnexoDifenilosClick(nil);
end;

procedure TfrmCargaRelevamientoPreventor463.ShortCutControl1ShortCuts11ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoAccIndMayores.Enabled then
    mnuAnexoAccIndMayoresClick(nil);
end;

procedure TfrmCargaRelevamientoPreventor463.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('IL_IDITEMANEXO').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('IL_IDITEMANEXO').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('IL_IDITEMANEXO').AsString));
    Column.Grid.Refresh;
  end;

end;

procedure TfrmCargaRelevamientoPreventor463.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmCargaRelevamientoPreventor463.GridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('IL_IDITEMANEXO').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.tbDesSeleccionarTodoClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(SelectedList.Objects[i]);
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmCargaRelevamientoPreventor463.tbSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('IL_IDITEMANEXO').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('IL_IDITEMANEXO').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmCargaRelevamientoPreventor463.tbActualizacionMasivaClick(
  Sender: TObject);
begin
  inherited;
  edFechaRegulMasiva.Clear;
  edFechaVerifMasiva.Clear;
  fpCargaMasiva.ShowModal;
end;

procedure TfrmCargaRelevamientoPreventor463.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmCargaRelevamientoPreventor463.btnAceptarMasivaClick(
  Sender: TObject);
var
  fechaContratoHasta, fechaFormulario, fecharegul, fechaverif : TDate;
  fechaVisitaVerosimilitud : TDate;
  bModoPreventor : Boolean;
  observacion : String;
  diasResta : Integer;
  i, iditemrelev :Integer;
begin
  fecharegul := edFechaRegulMasiva.Date;
  fechaverif := edFechaVerifMasiva.Date;

  fechaVisitaVerosimilitud := ValorSqlDateTime(
            ' SELECT max(rv_fecha) '+
            '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
            '  WHERE rv_id = vm_idvisita '+
            '    AND rv_cuit = '+SqlValue(FCuit)+
            '    AND rv_estableci = '+SqlValue(Estableci)+
            '    AND rv_fecha >= art.actualdate - 365 '+
            '    AND vm_idmotivo in (63, 64) ' +
            '    AND vm_fechabaja IS NULL '+
            '    AND rv_fechabaja IS NULL ');

  fechaFormulario := ValorSqlDateTime(
        ' SELECT RL_FECHAFORMULARIO '+
        '   FROM hys.hrl_relevriesgolaboral '+
        '  WHERE rl_id = '+ SqlValue(FIdRelev));

  fechaContratoHasta := ValorSqlDateTime(
      ' SELECT co_vigenciahasta '+
      '   FROM afi.aco_contrato '+
      '  WHERE co_contrato = '+ SqlValue(Contrato));

  bModoPreventor := ExisteSql('SELECT 1 FROM hys.hrl_relevriesgolaboral '+
                                  ' WHERE rl_id = '+ SqlValue(FIdRelev)+
                                  '   AND rl_procedencia = ''P''');

  Verificar(fechaverif < fecharegul,edFechaRegulMasiva,'La fecha de Verificacion debe ser mayor o igual a la de Regularización');
  Verificar((fecharegul <> 0) and (fecharegul < fechaFormulario), edFechaRegulMasiva, 'La fecha de regulación debe ser mayor a la fecha de Formulario.' );
  if bModoPreventor then
  begin
    Verificar((fecharegul <> 0) and (fecharegul > (fechaVisitaVerosimilitud+365)),edFechaRegulMasiva, 'La fecha de regulación debe ser menor a la fecha de visita mas 1 año.' );
    Verificar((fechaverif <> 0) and (fechaverif > (fechaVisitaVerosimilitud+365)),edFechaVerifMasiva, 'La fecha de verificación debe ser menor a la fecha de visita mas 1 año.' );
  end;

  observacion := edObservacionMasiva.Text;
  for i:=0 to SelectedList.Count-1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
    iditemrelev := StrToInt(SelectedList.Strings[i]);
    if (fecharegul = 0) and
       ((iditemrelev = FormAitem6) or (iditemrelev = FormCitem5) or
       (iditemrelev = FormCitem7) or (iditemrelev = FormBitem10)) then
    begin

      diasResta := 0;
      if (fechaContratoHasta - DBDate) <= 60 then
      begin
        fechaContratoHasta := IncYear(fechaContratoHasta);
      end;
      if (iditemrelev = FormAitem6) or
         (iditemrelev = FormCitem5) then
      begin
        diasResta := 30;
      end;

      if (iditemrelev = FormCitem7) or
         (iditemrelev = FormBitem10) then
      begin
        diasResta := 90;
      end;
      fecharegul := fechaContratoHasta - diasResta;
    end;

    DenunciaIncumplimiento(iditemrelev,fechaVisitaVerosimilitud,FCuit, FContrato, Estableci);

    try
      Sql.Clear;
      Sql.SqlType := stUpdate;
      Sql.Fields.Add('IL_OBSERVACIONDENUNCIA', observacion);
      Sql.Fields.Add('IL_FECHAREGULARIZACION', fecharegul);
      Sql.Fields.Add('IL_FECHAVERIFICACION', fechaverif);
      Sql.PrimaryKey.Add('IL_IDRELEVRIESGOLABORAL', FIdRelev);
      Sql.PrimaryKey.Add('IL_IDITEMANEXO', iditemrelev);
      Sql.Fields.Add('IL_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('IL_FECHAMODIF', exDateTime );
      Sql.Fields.Add('IL_USUBAJA', exNull );
      Sql.Fields.Add('IL_FECHABAJA', exNull );
      EjecutarSQLST(Sql.Sql);
    except
      on E: Exception do begin
         Rollback(true);
         ErrorMsg(E, 'Error al guardar el item.');
      end;
    end;
  end;
  fpCargaMasiva.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

procedure TfrmCargaRelevamientoPreventor463.FSFormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
  if not (ModalResult = mrOk) then
  begin
    if (MsgBox('¿Desea guardar?',  MB_ICONQUESTION + MB_YESNO, 'Salir') = IDYES) then
      CommitTrans(True)
    else
      Rollback(True);
  end;
end;

end.
