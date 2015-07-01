unit unUsuariosAutorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc;

type
  TfrmUsuariosAutorizacion = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edRangoDesde: TIntEdit;
    edRangoHasta: TIntEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edStatusSrt: TEdit;
    edStatusBcra: TEdit;
    edRiesgos: TEdit;
    edUsuariosNotificacion: TEdit;
    btnStatusSrt: TButton;
    btnStatusBcra: TButton;
    btnRiesgos: TButton;
    btnUsuariosNotificacion: TButton;
    fpAbmCampos: TFormPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevo2: TToolButton;
    tbDarBaja: TToolButton;
    ToolButton9: TToolButton;
    tbSalir2: TToolButton;
    gridCampos: TArtDBGrid;
    sdqConsultaCampos: TSDQuery;
    dsConsultaCampos: TDataSource;
    fpItem: TFormPanel;
    lbItem: TLabel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    Bevel1: TBevel;
    fraItem: TfraCodDesc;
    fraPuesto: TfraCodDesc;
    Label8: TLabel;
    edPrioridad: TIntEdit;
    Label9: TLabel;
    fraUsuario: TfraUsuarios;
    Label10: TLabel;
    edStatusSrtRevision: TEdit;
    btnStatusSrtRevision: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStatusSrtClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbDarBajaClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure tbNuevo2Click(Sender: TObject);
    procedure fpItemBeforeShow(Sender: TObject);
    procedure fpAbmCamposKeyPress(Sender: TObject; var Key: Char);
    procedure fpItemKeyPress(Sender: TObject; var Key: Char);
  private
    FOrigenCampos: Integer;

    procedure AbrirQuery;
    procedure CargarComboItem;
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure PrepararAbmCampos(const aOrigen: Integer);
    procedure RefreshData; override;
  end;

var
  frmUsuariosAutorizacion: TfrmUsuariosAutorizacion;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame, VCLExtra;

{$R *.dfm}

function TfrmUsuariosAutorizacion.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'art.aac_autorizacotiza';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ac_id',    sdqConsulta.FieldByName('ac_id').AsInteger, False);
    Sql.Fields.Add('ac_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ac_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ac_id',    GetSecNextVal('ART.SEQ_AAC_ID'), False);
      Sql.Fields.Add('ac_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('ac_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ac_id',     sdqConsulta.FieldByName('ac_id').AsInteger, False);
      Sql.Fields.Add('ac_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ac_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('ac_bcra',                edStatusBcra.Text);
    Sql.Fields.Add('ac_capitasdesde',        edRangoDesde.Value, True);
    Sql.Fields.Add('ac_capitashasta',        edRangoHasta.Value, True);
    Sql.Fields.Add('ac_fechabaja',           exNull);
    Sql.Fields.Add('ac_prioridad',           edPrioridad.Value, True);
    Sql.Fields.Add('ac_riesgo',              edRiesgos.Text);
    Sql.Fields.Add('ac_srt',                 edStatusSrt.Text);
    Sql.Fields.Add('ac_srtrevision',         edStatusSrtRevision.Text);
    Sql.Fields.Add('ac_puesto',              fraPuesto.Value, True);
    Sql.Fields.Add('ac_usuario',             fraUsuario.Value, True);
    Sql.Fields.Add('ac_usuarionotificacion', edUsuariosNotificacion.Text);
    Sql.Fields.Add('ac_usubaja',             exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosAutorizacion.Validar: Boolean;
begin
  Verificar(fraPuesto.IsEmpty, fraPuesto.edCodigo, 'El campo Puesto es obligatorio.');
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'El campo Usuario es obligatorio.');
  Verificar(edRangoDesde.IsEmpty, edRangoDesde, 'El campo Rango Desde es obligatorio.');
  Verificar(edRangoHasta.IsEmpty, edRangoHasta, 'El campo Rango Hasta es obligatorio.');
  Verificar((edRangoHasta.Value <= edRangoDesde.Value), edRangoHasta, 'El Rango Hasta debe ser mayora al Rango Desde.');

  Result := True;
end;


procedure TfrmUsuariosAutorizacion.AbrirQuery;
var
  sSql: String;
begin
  case FOrigenCampos of
    0:
    begin
      sSql :=
        'SELECT   tb_codigo "Código", tb_descripcion "Detalle"' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''STSRT''' +
            ' AND tb_codigo <> 0' +
            ' AND INSTR(' + SqlValue(',' + edStatusSrt.Text + ',') + ', '','' || tb_codigo || '','') > 0' +
       ' ORDER BY 1';
    end;
    1:
    begin
      sSql :=
        'SELECT   tb_codigo "Código", tb_descripcion "Detalle"' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''STSRT''' +
            ' AND tb_codigo <> 0' +
            ' AND INSTR(' + SqlValue(',' + edStatusSrtRevision.Text + ',') + ', '','' || tb_codigo || '','') > 0' +
       ' ORDER BY 1';
    end;
    2:
    begin
      sSql :=
        'SELECT   tb_codigo "Código", tb_descripcion "Detalle"' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''STBCR''' +
            ' AND tb_codigo <> 0' +
            ' AND INSTR(' + SqlValue(',' + edStatusBcra.Text + ',') + ', '','' || tb_codigo || '','') > 0' +
       ' ORDER BY 1';
    end;
    3:
    begin
      sSql :=
        'SELECT   tr_id "Código", tr_detalle "Detalle"' +
           ' FROM afi.atr_tiporiesgociiu' +
          ' WHERE INSTR(' + SqlValue(',' + edRiesgos.Text + ',') + ', '','' || tr_id || '','') > 0' +
       ' ORDER BY 1';
    end;
    4:
    begin
      sSql :=
        'SELECT   se_usuario "Código", se_nombre "Detalle"' +
           ' FROM use_usuarios' +
          ' WHERE (   (    se_sector = ''TECNICO''' +
                     ' AND se_fechabaja IS NULL' +
                     ' AND se_usuariogenerico = ''N'')' +
                 ' OR (se_usuario = ''FMFIRENZE''))' +
            ' AND INSTR(' + SqlValue(',' + edUsuariosNotificacion.Text + ',') + ', '','' || se_usuario || '','') > 0' +
       ' ORDER BY 1';
    end;
  end;

  with sdqConsultaCampos do
  begin
    Close;
    SQL.Text := sSql;
    Open;
  end;
end;

procedure TfrmUsuariosAutorizacion.CargarComboItem;
begin
  with fraItem.Propiedades do
    case FOrigenCampos of
      0:
      begin
        CodigoType     := ctString;
        ExtraCondition :=
          ' AND tb_clave = ''STSRT''' +
          ' AND tb_codigo <> 0' +
          ' AND INSTR(' + SqlValue(',' + edStatusSrt.Text + ',') + ', '','' || tb_codigo || '','') = 0 ';
        FieldBaja      := 'tb_fechabaja';
        FieldCodigo    := 'tb_codigo';
        FieldDesc      := 'tb_descripcion';
        FieldID        := 'tb_codigo';
        IdType         := ctString;
        TableName      := 'ctb_tablas';
      end;
      1:
      begin
        CodigoType     := ctString;
        ExtraCondition :=
          ' AND tb_clave = ''STSRT''' +
          ' AND tb_codigo <> 0' +
          ' AND INSTR(' + SqlValue(',' + edStatusSrtRevision.Text + ',') + ', '','' || tb_codigo || '','') = 0 ';
        FieldBaja      := 'tb_fechabaja';
        FieldCodigo    := 'tb_codigo';
        FieldDesc      := 'tb_descripcion';
        FieldID        := 'tb_codigo';
        IdType         := ctString;
        TableName      := 'ctb_tablas';
      end;
      2:
      begin
        CodigoType     := ctString;
        ExtraCondition :=
          ' AND tb_clave = ''STBCR''' +
          ' AND tb_codigo <> 0' +
          ' AND INSTR(' + SqlValue(',' + edStatusBcra.Text + ',') + ', '','' || tb_codigo || '','') = 0 ';
        FieldBaja      := 'tb_fechabaja';
        FieldCodigo    := 'tb_codigo';
        FieldDesc      := 'tb_descripcion';
        FieldID        := 'tb_codigo';
        IdType         := ctString;
        TableName      := 'ctb_tablas';
      end;
      3:
      begin
        CodigoType     := ctInteger;
        ExtraCondition := ' AND INSTR(' + SqlValue(',' + edRiesgos.Text + ',') + ', '','' || tr_id || '','') = 0 ';
        FieldBaja      := 'tr_fechabaja';
        FieldCodigo    := 'tr_id';
        FieldDesc      := 'tr_detalle';
        FieldID        := 'tr_id';
        IdType         := ctInteger;
        TableName      := 'afi.atr_tiporiesgociiu';
      end;
      4:
      begin
        CodigoType     := ctString;
        ExtraCondition :=
          ' AND ((se_sector = ''TECNICO'' AND se_fechabaja IS NULL AND se_usuariogenerico = ''N'') OR (se_usuario = ''FMFIRENZE''))' +
          ' AND INSTR(' + SqlValue(',' + edUsuariosNotificacion.Text + ',') + ', '','' || se_usuario || '','') = 0 ';
        FieldBaja      := 'se_fechabaja';
        FieldCodigo    := 'se_usuario';
        FieldDesc      := 'se_nombre';
        FieldID        := 'se_usuario';
        IdType         := ctString;
        TableName      := 'use_usuarios';
      end;
    end;
end;

procedure TfrmUsuariosAutorizacion.ClearControls;
begin
  fraPuesto.Clear;
  fraUsuario.Clear;
  edRangoDesde.Clear;
  edRangoHasta.Clear;
  edStatusSrt.Clear;
  edStatusSrtRevision.Clear;
  edStatusBcra.Clear;
  edRiesgos.Clear;
  edUsuariosNotificacion.Clear;
  edPrioridad.Clear;
end;

procedure TfrmUsuariosAutorizacion.LoadControls;
begin
  with sdqConsulta do
  begin
    fraPuesto.Codigo            := FieldByName('ac_puesto').AsString;
    fraUsuario.Codigo           := FieldByName('ac_usuario').AsString;
    edRangoDesde.Value          := FieldByName('ac_capitasdesde').AsInteger;
    edRangoHasta.Value          := FieldByName('ac_capitashasta').AsInteger;
    edStatusSrt.Text            := FieldByName('ac_srt').AsString;
    edStatusSrtRevision.Text    := FieldByName('ac_srtrevision').AsString;
    edStatusBcra.Text           := FieldByName('ac_bcra').AsString;
    edRiesgos.Text              := FieldByName('ac_riesgo').AsString;
    edUsuariosNotificacion.Text := FieldByName('ac_usuarionotificacion').AsString;
    edPrioridad.Value           := FieldByName('ac_prioridad').AsInteger;
  end;
end;

procedure TfrmUsuariosAutorizacion.PrepararAbmCampos(const aOrigen: Integer);
begin
  FOrigenCampos := aOrigen;
  AbrirQuery;

  case FOrigenCampos of
    0:  fpAbmCampos.Caption := 'Status SRT Cotización';
    1:  fpAbmCampos.Caption := 'Status SRT Revisión';
    2:  fpAbmCampos.Caption := 'Status BCRA';
    3:  fpAbmCampos.Caption := 'Riesgos';
    4:  fpAbmCampos.Caption := 'Usuarios Notificación';
  end;

  fpAbmCampos.ShowModal;
end;

procedure TfrmUsuariosAutorizacion.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT aac.*, tb_descripcion puesto' +
     ' FROM art.aac_autorizacotiza aac, ctb_tablas' +
    ' WHERE tb_clave = ''REUSA''' +
      ' AND ac_puesto = tb_codigo';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmUsuariosAutorizacion.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ac_fechabaja';

  fraUsuario.Sql :=
    'SELECT *' +
     ' FROM (SELECT se_fechabaja fechabaja, se_nombre descripcion, se_usuario ID, se_usuario codigo, se_fechabaja,' +
                  ' se_usuariogenerico, se_usuario' +
             ' FROM use_usuarios' +
            ' WHERE (    se_sector = ''TECNICO''' +
                   ' AND se_usuariogenerico = ''N'')' +
               ' OR (se_usuario IN (''FMFIRENZE'', ''FLARRARTE''))' +
           ' UNION ALL' +
           ' SELECT NULL, ''Comité I'', ''COMITE_1'', ''COMITE_1'', NULL, ''N'', ''COMITE_1''' +
             ' FROM DUAL' +
           ' UNION ALL' +
           ' SELECT NULL, ''Comité II'', ''COMITE_2'', ''COMITE_2'', NULL, ''N'', ''COMITE_2''' +
             ' FROM DUAL' +
           ' UNION ALL' +
           ' SELECT NULL, ''Gerencia General'', ''GERENCIAGENERAL'', ''GERENCIAGENERAL'', NULL, ''N'', ''GERENCIAGENERAL''' +
             ' FROM DUAL' +
           ' UNION ALL' +
           ' SELECT NULL, ''Presidencia'', ''PRESIDENCIA'', ''PRESIDENCIA'', NULL, ''N'', ''PRESIDENCIA''' +
             ' FROM DUAL) use_usuarios' +
    ' WHERE 1 = 1';

  VCLExtra.LockControls([edStatusSrt, edStatusSrtRevision, edStatusBcra, edRiesgos, edUsuariosNotificacion], True);
end;

procedure TfrmUsuariosAutorizacion.btnStatusSrtClick(Sender: TObject);
begin
  PrepararAbmCampos(TButton(Sender).Tag);
end;

procedure TfrmUsuariosAutorizacion.tbSalir2Click(Sender: TObject);
begin
  fpAbmCampos.Close;
end;

procedure TfrmUsuariosAutorizacion.tbDarBajaClick(Sender: TObject);
var
  aItems: TStringList;
  aObj: TEdit;
begin
  if not sdqConsultaCampos.Active then
    sdqConsultaCampos.Open;

  Verificar((sdqConsultaCampos.FieldByName('Código').AsString = ''), tbDarBaja, 'Por favor, seleccione algún registro.');

  aObj := nil;
  aItems := TStringList.Create;
  try
    case FOrigenCampos of
      0:  aObj := edStatusSrt;
      1:  aObj := edStatusSrtRevision;
      2:  aObj := edStatusBcra;
      3:  aObj := edRiesgos;
      4:  aObj := edUsuariosNotificacion;
    end;

    aItems.CommaText := aObj.Text;
    aItems.Delete(aItems.IndexOf(sdqConsultaCampos.FieldByName('Código').AsString));
    aObj.Text := aItems.CommaText;
  finally
    aItems.Free;
  end;

  AbrirQuery;
end;

procedure TfrmUsuariosAutorizacion.btnCancelar2Click(Sender: TObject);
begin
  fpItem.ModalResult := mrCancel;
end;

procedure TfrmUsuariosAutorizacion.btnAceptar2Click(Sender: TObject);
begin
  Verificar(fraItem.IsEmpty, fraItem.edCodigo, 'Debe seleccionar un item.');

  fpItem.ModalResult := mrOk;
end;

procedure TfrmUsuariosAutorizacion.tbNuevo2Click(Sender: TObject);
var
  aObj: TEdit;
begin
  fpItem.Caption := 'Agregar Item';

  case FOrigenCampos of
    0:  lbItem.Caption := 'Status SRT Cotización';
    1:  lbItem.Caption := 'Status SRT Revisión';
    2:  lbItem.Caption := 'Status BCRA';
    3:  lbItem.Caption := 'Riesgos';
    4:  lbItem.Caption := 'Usuarios Notificación';
  end;

  CargarComboItem;

  if fpItem.ShowModal = mrOk then
  begin
    aObj := nil;
    case FOrigenCampos of
      0:  aObj := edStatusSrt;
      1:  aObj := edStatusSrtRevision;
      2:  aObj := edStatusBcra;
      3:  aObj := edRiesgos;
      4:  aObj := edUsuariosNotificacion;
    end;

    if aObj.Text = '' then
      aObj.Text := fraItem.Codigo
    else
      aObj.Text := aObj.Text + ',' + fraItem.Codigo;

    AbrirQuery;
  end;
end;

procedure TfrmUsuariosAutorizacion.fpItemBeforeShow(Sender: TObject);
begin
  fraItem.Clear;
end;

procedure TfrmUsuariosAutorizacion.fpAbmCamposKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpAbmCampos.Close;
end;

procedure TfrmUsuariosAutorizacion.fpItemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpItem.ModalResult := mrCancel;
end;

end.
