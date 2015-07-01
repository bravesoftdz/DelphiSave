unit unRespuestaCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, ArtComboBox, Db,
  SDEngine, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, Grids, DBGrids, RXDBCtrl, ArtDBGrid, ComCtrls, ToolWin,
  unFraRespuestaCarta, FormPanel;

type
  TfrmRespuestaCliente = class(TForm)
    btnAceptar: TButton;
    tblGrid: TArtDBGrid;
    dsConsulta: TDataSource;
    sdqConsulta: TSDQuery;
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador2: TToolButton;
    tlbSalir: TToolButton;
    frmRespuesta: TFormPanel;
    GroupBox1: TGroupBox;
    fraRespuestaCartaEmpresa: TfraRespuestaCarta;
    GroupBox2: TGroupBox;
    fraRespuestaCartaART: TfraRespuestaCarta;
    tblAceptaResp: TButton;
    btnCancelar: TButton;
    lbAceptacion: TLabel;
    mObservaciones: TMemo;
    procedure btnAceptarClick(Sender: TObject);
    procedure tblGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                   Highlight: Boolean);
    procedure tlbNuevoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tblAceptaRespClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    dFechaRespuestaART: TDate;

    procedure LimpiarRespuesta;
  public
    procedure DoCargaCartas(aIdFormulario: Integer);
  end;

var
  frmRespuestaCliente: TfrmRespuestaCliente;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, General, AnsiSQL, SqlFuncs, unConsultaSolicitud, unArt;

const
  RC_ALTA        : String = 'Respuesta del Cliente [ALTA]';
  RC_MODIFICACION: String = 'Respuesta del Cliente [MODIFICACION]';
  RC_BAJA        : String = 'Respuesta del Cliente [BAJA]';

{$R *.DFM}

procedure TfrmRespuestaCliente.DoCargaCartas(aIdFormulario: Integer);
begin
  sdqConsulta.SQL.Text :=
    'SELECT ca_id, ca_nrocartadoc, ht_nombre tc_nombre, correo.tb_descripcion correo, ca_observaciones,' +
          ' NVL(ca_usureimpresion, ca_usuimpresion) uimpresion, NVL(ca_fechareimpresion, ca_fechaimpresion) fimpresion,' +
          ' ca_recepcionok, ca_fecharecepcion, codre.tb_descripcion, ca_fechabaja, ca_usubaja,' +
          ' NVL(rc_aceptacion, rc_decision) respuesta, NVL(rc_fecharespuesta, rc_fechaalta) fecha_respuesta,' +
          ' ROUND(NVL(ca_fecharecepcion, actualdate) - ca_fechaimpresion, 0) dias, ca_idformulario, rc_id,' +
          ' rc_observaciones, rc_aceptacion, rc_fecharespuesta, rc_decision, rc_fechaalta' +
     ' FROM arc_respuestacarta, ctb_tablas codre, cfi_firma, ctb_tablas correo, comunes.cht_historicotextocarta,' +
          ' cca_carta, cat_areatexto' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND NVL(ca_correoreimpresion, ca_correo) = correo.tb_codigo(+)' +
      ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND ca_codrecepcion = codre.tb_codigo(+)' +
      ' AND ca_idhistoricotextocarta = ht_id' +
      ' AND at_id = ca_idareatexto' +
      ' AND at_respuestacliente = ''S''' +
      ' AND ca_id = rc_idcarta(+)' +
      ' AND ca_idformulario = :idformulario';

  OpenQueryEx(sdqConsulta, [aIdFormulario]);
end;

procedure TfrmRespuestaCliente.btnAceptarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRespuestaCliente.tblGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('ca_usubaja').AsString <> '' then
    AFont.Color:= clRed;

  if sdqConsulta.FieldByName('dias').AsInteger > 3 then
    AFont.Color:= clRed;
end;

procedure TfrmRespuestaCliente.tlbNuevoClick(Sender: TObject);
begin
  if (sdqConsulta.IsEmpty) then
  begin
    MsgBox('No existe una fila seleccionada.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;
  
  LimpiarRespuesta;
  fraRespuestaCartaEmpresa.cmbAceptacion.ItemIndex := -1;
  if sdqConsulta.FieldByName('rc_aceptacion').AsString = 'S' then
    fraRespuestaCartaEmpresa.cmbAceptacion.ItemIndex := 0;

  if sdqConsulta.FieldByName('rc_aceptacion').AsString = 'N' then
    fraRespuestaCartaEmpresa.cmbAceptacion.ItemIndex := 1;

  fraRespuestaCartaEmpresa.edFecha.Date := sdqConsulta.FieldByName('rc_fecharespuesta').AsDateTime;
  mObservaciones.Text                   := sdqConsulta.FieldByName('rc_observaciones').AsString;

  fraRespuestaCartaART.cmbAceptacion.ItemIndex := -1;
  if sdqConsulta.FieldByName('rc_decision').asString = 'S' then
    fraRespuestaCartaART.cmbAceptacion.ItemIndex := 0;

  if sdqConsulta.FieldByName('rc_decision').asString = 'N' then
    fraRespuestaCartaART.cmbAceptacion.ItemIndex := 1;

  if sdqConsulta.FieldByName('rc_fechaalta').asString <> '' then
    fraRespuestaCartaART.edFecha.Date := sdqConsulta.FieldByName('rc_fechaalta').AsDateTime
  else
    fraRespuestaCartaART.edFecha.Date := dFechaRespuestaART;

  frmRespuesta.ShowModal;
end;

procedure TfrmRespuestaCliente.btnCancelarClick(Sender: TObject);
begin
  frmRespuesta.ModalResult := mrCancel;
end;

procedure TfrmRespuestaCliente.tblAceptaRespClick(Sender: TObject);
var
  IdARC: TTableID;
  IdCarta: TTableID;
  sCCA: TSql;
  sRC_ACEPTACION: String;
  sRC_DECISION: String;
  sSql: String;
  sSqlTrans: TSql;
begin
  Verificar((fraRespuestaCartaEmpresa.edFecha.Date > fraRespuestaCartaART.edFecha.Date), fraRespuestaCartaEmpresa.edFecha, 'La fecha de respuesta tiene que ser menor a la fecha de carga.');
  Verificar((fraRespuestaCartaEmpresa.cmbAceptacion.Text <> '') and (fraRespuestaCartaART.cmbAceptacion.Text <> ''), fraRespuestaCartaEmpresa.cmbAceptacion, 'No puede existir la respuesta de la empresa y de la ART en simultaneo.');

  if fraRespuestaCartaEmpresa.cmbAceptacion.Text = 'Si' then
    sRC_ACEPTACION := 'S';

  if fraRespuestaCartaEmpresa.cmbAceptacion.Text = 'No' then
    sRC_ACEPTACION := 'N';

  if fraRespuestaCartaART.cmbAceptacion.Text = 'Si' then
    sRC_DECISION := 'S';

  if fraRespuestaCartaART.cmbAceptacion.Text = 'No' then
    sRC_DECISION := 'N';

  sCCA      := TSql.Create('cca_carta');
  sSqlTrans := TSQL.Create('arc_respuestacarta');
  try
    BeginTrans;
    try
      IdARC   := sdqConsulta.fieldByName('rc_id').AsInteger;
      IdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;
      if IdARC=ART_EMPTY_ID then
      begin
        sCCA.PrimaryKey.Add('ca_id',         IdCarta);
        sCCA.Fields.Add('ca_recepcionok',    'S');
        sCCA.Fields.Add('ca_codrecepcion',   'RW00');
        sCCA.Fields.Add('ca_fecharecepcion', fraRespuestaCartaEmpresa.edFecha.Date);
        sCCA.Fields.Add('ca_usurecepcion',   frmPrincipal.DBLogin.UserId);
        sCCA.SqlType := stUpdate;
        EjecutarSqlST(sCCA.Sql);

        // Obtengo el IdARC
        sSql :=
          'SELECT rc_id' +
           ' FROM arc_respuestacarta' +
          ' WHERE rc_idcarta = :idcarta';
        IdARC := ValorSqlIntegerEx(sSql, [IdCarta]);
      end;

      sSqlTrans.SqlType := stUpdate;
      sSqlTrans.PrimaryKey.Add('rc_id',         IdARC, False);
      sSqlTrans.Fields.Add('rc_idcarta',        IdCarta);
      sSqlTrans.Fields.Add('rc_idformulario',   sdqConsulta.FieldByName('ca_idformulario').AsInteger);
      sSqlTrans.Fields.Add('rc_aceptacion',     sRC_ACEPTACION);
      sSqlTrans.Fields.Add('rc_fecharespuesta', fraRespuestaCartaEmpresa.edFecha.Date);
      sSqlTrans.Fields.Add('rc_observaciones',  mObservaciones.Text);
      sSqlTrans.Fields.Add('rc_decision',       sRC_DECISION);
      sSqlTrans.Fields.Add('rc_fechamodif',     'ACTUALDATE', False);
      sSqlTrans.Fields.Add('rc_usumodif',       frmPrincipal.DBLogin.UserId);
      EjecutarSQLST(sSqlTrans.Sql);

      CommitTrans;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    except
      on E:Exception do
      begin
        RollBack;
        MessageDlg('Se ha producido un error al guardar.' + #13#10 + E.Message, mtError, [mbOK], 0);
      end;
    end;
    sdqConsulta.Close;
    sdqConsulta.Open;
  finally
    sSqlTrans.Free;
    sCCA.Free;
  end;
  LimpiarRespuesta;
  frmRespuesta.ModalResult := mrOk;
end;

procedure TfrmRespuestaCliente.LimpiarRespuesta();
begin
  fraRespuestaCartaEmpresa.Clear;
  mObservaciones.Clear;
end;

procedure TfrmRespuestaCliente.FormCreate(Sender: TObject);
begin
  inherited;

  dFechaRespuestaART := DBDatetime;
end;

procedure TfrmRespuestaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmRespuestaCliente := nil;
end;

end.
