unit unRARWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion, FormPanel;

type
  TfrmRARWeb = class(TfrmCustomConsulta)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbPendienteFiltro: TCheckBox;
    cbProcesadoFiltro: TCheckBox;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    cbRechazado: TCheckBox;
    fpMotivoRechazo: TFormPanel;
    Bevel5: TBevel;
    Label49: TLabel;
    btnAceptarCambioTipoPrev: TButton;
    btnCancelarCambioTipoPrev: TButton;
    fraMotivoRechazo: TfraCodigoDescripcion;
    tbProcesar: TToolButton;
    tbRechazar: TToolButton;
    fraEmpresaFiltro: TfraEmpresa;
    Label5: TLabel;
    edObservacionRechazo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbProcesarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbRechazarClick(Sender: TObject);
    procedure btnAceptarCambioTipoPrevClick(Sender: TObject);
  private
    { Private declarations }
    FSql : String;
  public
    { Public declarations }
  end;

var
  frmRARWeb: TfrmRARWeb;

implementation

{$R *.dfm}
uses
  AnsiSql, unFrmObras, VclExtra, CustomDlgs,  unDmPrincipal, unFet,unSesion, General, unMoldeEnvioMail, unDetalleRARWeb;

procedure TfrmRARWeb.btnAceptarCambioTipoPrevClick(Sender: TObject);
begin
  Verificar(not fraMotivoRechazo.IsSelected, fraMotivoRechazo, 'Debe seleccionar el motivo de rechazo.');
  fpMotivoRechazo.ModalResult := mrOk;
end;

procedure TfrmRARWeb.FormCreate(Sender: TObject);
begin
  inherited;
  with fraMotivoRechazo do
  begin
    TableName := 'HYS.HMR_MOTIVORECHAZOWEB';
    FieldDesc := 'MR_DESCRIPCION';
    FieldID := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldBaja := 'MR_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  fraEmpresaFiltro.ShowBajas := true;
  tbRechazar.left := tbNuevo.Left -1;
  tbProcesar.Left :=  tbRechazar.Left-1;
  cbPendienteFiltro.Checked := True;
  FSql := sdqConsulta.SQL.Text;
end;

procedure TfrmRARWeb.GridDblClick(Sender: TObject);
begin
  inherited;
  tbProcesarClick(nil);
end;

procedure TfrmRARWeb.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  cbPendienteFiltro.Checked := False;
  cbProcesadoFiltro.Checked := False;
  cbRechazado.Checked       := False;
  inherited;
end;

procedure TfrmRARWeb.tbProcesarClick(Sender: TObject);
begin
  inherited;
  with TfrmDetalleRARWeb.Create(Self) do
  try
    Load(self.sdqConsulta.FieldByName('ew_id').AsInteger);
    ShowModal;
  finally
    Free;
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmRARWeb.tbRechazarClick(Sender: TObject);
var
  sMailResp, sMailContacto,
  diaHoy :String;
begin
  inherited;
  fraMotivoRechazo.Clear;
  edObservacionRechazo.Clear;
  if not sdqConsulta.IsEmpty then
  begin
    if fpMotivoRechazo.ShowModal = mrok then
      begin
        with TfrmMoldeEnvioMail.Create(Self) do
        begin
          FormStyle := fsNormal;
          Visible := False;
          Opciones := [oAlwaysShowDialog];
          if sMailResp <> '' then
          begin
            edDestinatario.Text := sMailResp;
            btAgregarDestinatarioClick(nil);
          end;
          if sMailContacto <> '' then
          begin
            edDestinatario.Text := sMailContacto;
            btAgregarDestinatarioClick(nil);
          end;
          edAsunto.Text := 'RAR No Recepcionado';

          diaHoy := ValorSql(' SELECT TO_CHAR (SYSDATE, ''DD'') '+
                             '        || '' de '' || TO_CHAR (SYSDATE, ''Month'') '+
                             '        || ''de '' || TO_CHAR (SYSDATE, ''YYYY'') '+
                             '   FROM DUAL ');

          reTextoCuerpo.Lines.Add(
            '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}'+
            '\viewkind4\uc1\pard\qr\cf1\f0\fs18\par'+
            '\cf0 Ciudad Aut\''f3noma de Buenos Aires, '+diaHoy+'\cf1\par '+
            '\pard Estimado cliente:\par '+
            '\par '+
            '\pard\qj Ref.: \b\fs19 No corresponden ESOP con actividad declarada y/o el formulario presentado est\''e1 '+
            'incorrectamente confeccionado seg\''fan los datos consignados en el formulario de Resoluci\''f3n SRT 37/2010.\par '+
            '\par\par '+
            '\pard\sa160\sl252\slmult1\qj\cf0\b0\fs18 Por medio de la presente informamos que el formulario presentado esta '+
            'incorrectamente confeccionado por falta de datos o porque los ESOP declarados no se condicen con los sugeridos para '+
            'la actividad desarrollada por Ud. \par '+
            'En caso de querer avalar los ESOP declarados le solicitamos que env\''ede la documentaci\''f3n respaldatoria (mediciones '+
            'correspondientes), de lo contrario deber\''e1 presentar un nuevo formulario.\par '+
            'A continuaci\''f3n le detallaremos las inconsistencias del presentado:\par '+
            '\pard\sa160\sl252\slmult1\i\par '+
            // COMPLETAR
            '\pard\fs20\b '+sdqConsulta.FieldByName('es_nroestableci').AsString+' - '+ fraMotivoRechazo.Descripcion+' \b0\par '+
            ' - No corresponde ESOP con actividad declarada por empresa.\par '+
            '- Formulario inv\''e1lido (corresponde a datos de firma, faltan datos de la empresa)]\par '+
            '\pard\sa160\sl252\slmult1\i0\fs18\par '+
            '\pard\sa160\sl252\slmult1\qj Quedamos a la espera de dicha documentaci\''f3n para dar por cumplida la presentaci\''f3n '+
            'seg\''fan la Res. 37/10.\par '+
            '\pard\qj\cf1 Ante cualquier duda o consulta comun\''edquese con el sector por mail a prevencion@provart.com.ar\par '+
            '\pard\sa200\sl276\slmult1\cf0\lang10\f1\fs22\par '+
            ' }');

        if ShowModal = mrOk then
        begin
          EjecutarSql('UPDATE hys.hew_establecimientoweb '+
                      '   SET EW_ESTADO = ''R'', '+
                      '       EW_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                      '       EW_IDMOTIVORECHAZO = '+SqlValue(fraMotivoRechazo.Value)+', '+
                      '       EW_OBSERVACIONESRECHAZO = '+SqlValue(trim(edObservacionRechazo.Lines.Text))+','+
                      '       EW_FECHAMODIF = SYSDATE '+
                      ' WHERE ew_id = '+SqlValue(sdqConsulta.FieldByName('ew_id').AsString));

          if not ExisteSql('SELECT 1 FROM hys.hir_invalidoriesgo, hys.hew_establecimientoweb  '+
                           ' WHERE ir_cuit = ew_cuit '+
                           '   AND ir_estableci = ew_estableci '+
                           '   AND ir_fecha = TRUNC (ew_fechaalta)'+
                           '   AND ew_id = '+SqlValue(sdqConsulta.FieldByName('ew_id').AsString)) then
          begin
            EjecutarSqlST(' INSERT INTO hys.hir_invalidoriesgo '+
                          '            (ir_cuit, ir_estableci, ir_fecha, ir_fechaalta, ir_usualta, ir_id, '+
                          '             ir_idmotivorechazonomina, ir_idestablecimientoweb) '+
                          '   SELECT ew_cuit, ew_estableci, TRUNC (ew_fechaalta), SYSDATE, '+SqlValue(Sesion.UserID)+','+
                                     sqlvalue(GetSecNextVal('HYS.SEQ_HIR_INVRIESGO_ID'))+','+SqlValue(fraMotivoRechazo.Value)+', ew_id '+
                          '     FROM hys.hew_establecimientoweb '+
                          '    WHERE ew_id = '+SqlValue(sdqConsulta.FieldByName('ew_id').AsString));
          end;
          //FALTA LA PARTE DE LA DENUNCIA
          {
          if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio '+
                       '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(fraEmpresa.CUIT)+')'+
                       '    AND ne_idtipodenuncia = 2 '+
                       '    AND ne_fechaenvio IS NULL ') then
            EjecutarSqlST(' UPDATE hys.hne_notasdenunciaenvio '+
                          '    SET ne_fechamodif = sysdate, '+
                          '        ne_usumodif = '+SqlValue(Sesion.UserID)+
                          '  WHERE ne_contrato = art.get_vultcontrato ('+ SqlValue(FCUIT)+')'+
                          '    AND ne_idtipodenuncia = 2 '+
                          '    AND ne_fechaenvio IS NULL ')
          else
            EjecutarSqlST('INSERT INTO hys.hne_notasdenunciaenvio (ne_id, ne_contrato, ne_fechaalta, ne_usualta, ne_idtipodenuncia) '+
                            '     VALUES (hys.seq_hne_id.NEXTVAL, art.get_vultcontrato ('+ SqlValue(FCUIT)+'), SYSDATE, '+
                          SqlValue(Sesion.UserID)+',2)');
          FGuardoInvalido := True;
          }

          MsgBox('El RAR web se ha marcado como Rechazado.', MB_OK , 'RAR Web');
        end;
      end;
    end;
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmRARWeb.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere, sWhereEstado : String;
begin
  inherited;
  sWhere := '';
  sWhereEstado := '';
  sSql := FSql;

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);

  if edFechaAltaDesde.Date > 0 then
    sWhere := sWhere + ' AND cw_fechaalta >= '+SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date > 0 then
    sWhere := sWhere + ' AND cw_fechaalta <= '+SqlValue(edFechaAltaHasta.Date);

  if cbPendienteFiltro.Checked or cbProcesadoFiltro.Checked or cbRechazado.Checked then
  begin
    if cbPendienteFiltro.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR EW_ESTADO = ''L'' '
      else
        sWhereEstado := sWhereEstado + ' EW_ESTADO = ''L'' ';
    end;

    if cbProcesadoFiltro.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR EW_ESTADO = ''T'' '
      else
        sWhereEstado := sWhereEstado + ' EW_ESTADO = ''T'' ';
    end;

    if cbRechazado.Checked then
    begin
      if sWhereEstado <> '' then
        sWhereEstado := sWhereEstado + ' OR EW_ESTADO = ''R'' '
      else
        sWhereEstado := sWhereEstado + ' EW_ESTADO = ''R'' ';
    end;
    sWhere := sWhere +' AND ('+sWhereEstado+') ';
  end;

  sdqConsulta.SQL.Text := sSQL+sWhere;

  inherited;

end;

end.
