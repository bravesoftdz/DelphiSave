unit unContTratSA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraCIE10, ToolEdit, DateComboBox, StdCtrls, Mask,
  unFraEmpresa, unfraPrestador, Qrctrls, QuickRpt, unArtFrame, unArtDbFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo;

type
  TfrmContTratSA = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    fraPrestador: TfraPrestador;
    GroupBox2: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Panel1: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    GroupBox6: TGroupBox;
    cmbEstado: TComboBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dcSinDesde: TDateComboBox;
    dcSinHasta: TDateComboBox;
    Panel4: TPanel;
    fraCIE10: TfraCIE10;
    ScrollBox: TScrollBox;
    qrpReporte: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel14: TQRLabel;
    qrlTitulo: TQRLabel;
    qrmCriterios: TQRMemo;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    qrdbIdentif: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    qrdbCuit: TQRDBText;
    qrdbDescrip: TQRDBText;
    qrdbLocalidad: TQRDBText;
    qrdbTelefono: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel4: TQRLabel;
    lbSumSini: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    qrlUsuario: TQRLabel;
    QRBand4: TQRBand;
    qrlTotSini: TQRLabel;
    QRLabel28: TQRLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    edDelegacion: TEdit;
    cmbDelegacion: TArtComboBox;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    sdqGTrabajo: TSDQuery;
    dsGTrabajo: TDataSource;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure lbSumSiniPrint(Sender: TObject; var Value: String);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cmbDelegacionChange(Sender: TObject);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmContTratSA: TfrmContTratSA;
  SqlWhere: String;

implementation

uses
  CUIT, General, unDmPrincipal, AnsiSql, CustomDlgs, unArt;

{$R *.DFM}

procedure TfrmContTratSA.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
  Estado{, sqlDiasCaidos By Fede}: String;
  {variable_vencimiento,FechaMaxCIE10:String; By Fede}
begin
  qrmCriterios.Lines.Text := '';
  Estado := '';

  Verificar(((dcSinDesde.Date > 0) and (dcSinHasta.Date = 0)) or ((dcSinDesde.Date = 0) and (dcSinHasta.Date > 0)), nil, 'Debe completar la Fecha del Siniestro.');

   Sql :=
    'SELECT nvl(sa_estadoconti, 0) sa_estadoconti ,ex_siniestro, ex_orden, ex_recaida,' +
          ' art.amebpba.get_nombregtrabajo(ex_gtrabajo) gtrabajo, ex_diagnosticooms,' +
          ' ex_siniestro || ''-'' || ex_orden || ''-'' || ex_recaida Siniestro, ex_cuil Cuil, tj_nombre Paciente,' +
          ' ex_cuit Cuit, mp_nombre Empresa, nvl(ex_fecharecaida, ex_fechaaccidente) F_Accidente,' +
          ' ex_diagnosticooms Diagnóstico,' +
          ' art.amebpba.get_nombredelegacion(ex_siniestro, ex_orden, ex_recaida) Delegacion, ex_prestador,' +
          ' ca_localidad, ca_clave, ca_descripcion Prestador, sa_moviconti U_Movi,' +
          ' to_char(sa_fechaconti, ''dd/mm/yyyy'') F_U_Movi, tb_descripcion Estado,' +
          ' art.actualdate - (nvl(ex_fecharecaida, ex_fechaaccidente)) Dias_Caidos,' +
          ' NVL(sa_proximocontrol, '''') Prox_Control, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
     ' FROM mgp_gtrabajo, ctb_tablas, cpr_prestador, cmp_empresas, ctj_trabajadores, sex_expedientes,' +
          ' ssa_siniestrossinalta';

  SqlWhere :=
    ' WHERE sa_siniestro = ex_siniestro' +
      ' AND sa_orden = ex_orden' +
      ' AND sa_recaida = ex_recaida' +
      ' AND ex_cuil = tj_cuil' +
      ' AND ex_cuit = mp_cuit' +
      ' AND ex_prestador = ca_identificador(+)' +
      ' AND tb_clave = ''ESTCT''' +
      ' AND tb_codigo = sa_estadoconti' +
      ' AND ex_gtrabajo = gp_codigo' +
      ' AND gp_tipo = ''C''';

  if fraPrestador.IDPrestador <> 0 then
  begin
    SqlWhere := SqlWhere + ' and Ex_Prestador = ' + SqlValue(fraPrestador.IDPrestador);
    qrmCriterios.Lines.Text := 'Prestador: ' + fraPrestador.RazonSocial + #13;
  end;

  if fraEmpresa.IsSelected then
  begin
    SqlWhere := SqlWhere + ' and Ex_cuit = ' + SQLValue(fraEmpresa.CUIT);
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Empresa: ' + fraEmpresa.cmbRSocial.Text + #13;
  end;

  if Trim(cmbEstado.Text) <> '' then
  begin
    if cmbEstado.ItemIndex = 0 then
      Estado := '''1'''
    else if cmbEstado.ItemIndex = 1 then
      Estado := '''2'''
    else if cmbEstado.ItemIndex = 2 then
      Estado := '''3'''
    else if cmbEstado.ItemIndex = 3 then
      Estado := '''4'''
    else
      Estado := '''1'',''2'',''3'',''4''';

    SqlWhere := SqlWhere + ' and sa_estadoconti in (' + Estado + ')';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Estado/s: ' + cmbEstado.Text;
  end;

  if (dcSinDesde.Date > 0) and (dcSinHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and Nvl(ex_fecharecaida,ex_fechaaccidente) between ' + dcSinDesde.SqlText;
    SqlWhere := SqlWhere + ' and ' + dcSinHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha del Siniestro Desde: ' + dcSinDesde.Text + ' al ' + dcSinHasta.Text + #13;
  end;

  if (fraGrupoTrabajo.ID <> '') then
  begin
     SqlWhere := SqlWhere + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;
     qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Grupo de Trabajo: ' + fraGrupoTrabajo.cmbDescripcion.Text + #13;
  end;

  if (fraGrupoTrabajo.cmbGestor.Text <> '') then
  begin
     SqlWhere := SqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
     qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Usuario Gestor: ' + fraGrupoTrabajo.cmbGestor.Text + #13;
  end;

  if cmbDelegacion.Text <> '' then
  begin
    SqlWhere := SqlWhere + ' and art.AMEBPBA.Get_Delegacion(ex_siniestro,ex_orden,ex_recaida) = ' + SqlString(cmbDelegacion.FieldValue, True);
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Delegación: ' + cmbDelegacion.Text + #13;
  end;

  if qrmCriterios.Lines.Text = '' then
    qrmCriterios.Lines.Text := 'Todos los Siniestros Sin Alta Médica';

  if fracie10.edCodigo.Text <> '' then
    SqlWhere := SqlWhere + ' AND NVL(EX_DIAGNOSTICOOMS,'' '')=''' + fracie10.edCodigo.Text + '''';

  Sql := Sql + SqlWhere + SortDialog.OrderBy;

  sdqconsulta.SQL.text := Sql;
  sdqconsulta.Open;
  inherited
end;

procedure TfrmContTratSA.tbImprimirClick(Sender: TObject);
begin
  try
    tbImprimir.Enabled := False;
    qrlTitulo.Caption := 'Listado de Continúa Tratamiento sin alta';
    qrpReporte.Preview;
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmContTratSA.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraPrestador.Limpiar;
  fraEmpresa.Clear;
  dcSinDesde.ClearDate;
  dcSinHasta.ClearDate;
  fraGrupoTrabajo.Clear;
  cmbEstado.Text := 'Todos';
  cmbDelegacion.Clear;
  edDelegacion.Text := '';
  fraPrestador.CuitFocus;
  fraCIE10.cmbDescripcion.Clear;
  fraCIE10.edCodigo.Clear;
end;

procedure TfrmContTratSA.lbSumSiniPrint(Sender: TObject; var Value: String);
var
  sql: String;
begin
  sql := '';
  if sdqConsulta.fieldbyname('EX_PRESTADOR').AsString <> '' then
    sql := ' And ex_prestador = ' + sdqConsulta.fieldbyname('EX_PRESTADOR').AsString
  else
    sql := ' And ex_prestador is null ';

  Value := ValorSql('SELECT Count(*)' +
                     ' FROM mgp_gtrabajo, ctb_tablas, cpr_prestador, cmp_empresas, ctj_trabajadores, sex_expedientes,' +
                          ' ssa_siniestrossinalta' +
                    SqlWhere + sql);
end;

procedure TfrmContTratSA.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                           Highlight: Boolean);
begin
  if sdqConsulta.RecordCount > 0 then
  begin
    case sdqConsulta.fieldbyname('SA_ESTADOCONTI').AsInteger of
      1:
      begin
        if not Highlight then
          Background := $00CCFFFF
        else
        begin
          Background := $0000CCFF;
          font.Color := clblack;
        end;
      end;

      2:
      begin
        if not Highlight then
          Background := $0099CCFF
        else
        begin
          Background := $0066CCFF;
          font.Color := clblack;
        end;
      end;

      3:
      begin
        if not Highlight then
          Background := $000099FF
        else
        begin
          Background := $000066FF;
          font.Color := clblack;
        end;
      end;

      4:
      begin
        if not Highlight then
          Background := $003300FF
        else
        begin
          Background := $000033CC;
          font.Color := clblack;
        end;
      end;
    else
      Background := $00FFFFFF;
    end;
  end
end;

procedure TfrmContTratSA.cmbDelegacionChange(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) = '' then
    edDelegacion.Text := '';
end;

procedure TfrmContTratSA.cmbDelegacionCloseUp(Sender: TObject);
begin
  if (Trim(cmbDelegacion.Text) <> '') then
    edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmContTratSA.edDelegacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmContTratSA.FormCreate(Sender: TObject);
begin
  inherited;
  
  OpenQuery(sdqDelegacion);
  OpenQuery(sdqGTrabajo);
end;

end.
