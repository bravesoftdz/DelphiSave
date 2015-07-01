unit unFrmConsultaNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtDbFrame, unFraEmpresa, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  StdCtrls, Mask, ToolEdit, DateComboBox, JvgGroupBox,
  unFraStaticCodigoDescripcion, PeriodoPicker, PatternEdit, IntEdit,
  unSesion, unfrmABMNotas, AnsiSql, unConstEmision, unDmPrincipal,
  general, unfraUsuarios, JvExMask, JvToolEdit, JvCombobox, ComboEditor,
  CheckCombo, unDmEmision, CustomDlgs, unFuncionesEmision, unfrmObservacion,
  unMoldeEnvioMail, unComunes;

type
  TfrmConsultaNotas = class(TfrmCustomConsulta)
    sdqConsultaEN_DESCRIPCION: TStringField;
    sdqConsultaMS_DESCRIPCION: TStringField;
    sdqConsultaNO_ID: TFloatField;
    sdqConsultaSOLICITANTE: TStringField;
    sdqConsultaNO_FECHARECEPCION: TDateTimeField;
    sdqConsultaNO_FECHARECEPCIONART: TDateTimeField;
    sdqConsultaNO_SOLICITANTE: TFloatField;
    sdqConsultaNO_IDMOTIVOSOLICITUDNOTA: TFloatField;
    sdqConsultaNO_CONTRATO: TFloatField;
    sdqConsultaNO_BIBLIORATO: TFloatField;
    sdqConsultaNO_SECUENCIA: TFloatField;
    sdqConsultaNO_USUALTA: TStringField;
    sdqConsultaNO_FECHAALTA: TDateTimeField;
    sdqConsultaNO_USUMODIF: TStringField;
    sdqConsultaNO_FECHAMODIF: TDateTimeField;
    sdqConsultaNO_FECHABAJA: TDateTimeField;
    sdqConsultaNO_USUBAJA: TStringField;
    sdqConsultaNO_IDESTADONOTA: TFloatField;
    sdqConsultaNO_TIPOSOLICITANTE: TFloatField;
    sdqConsultaEMPRESA: TStringField;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    pnColorDiferenciaDevengado: TPanel;
    lblReferenciaDiferenciaDevengado: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    sdqConsultaNO_ESTADOCORRECCION: TStringField;
    Panel3: TPanel;
    Label3: TLabel;
    lblLeyendaPeriodoPendienteAprob: TLabel;
    pnColorFOndoPendienteAprobacion: TPanel;
    pnlBottom: TPanel;
    btnSeleccionar: TButton;
    btnCancel: TButton;
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    tbSimular: TToolButton;
    Panel4: TPanel;
    lblSimulacion: TLabel;
    sdqConsultaNO_FECHAAPLICACION: TDateTimeField;
    sdqConsultaNO_USUARIOAPLICACION: TStringField;
    sdqConsultaNO_FECHAASIMULACION: TDateTimeField;
    sdqConsultaNO_USUARIOASIMULACION: TStringField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaNO_OBSERVACIONESCUMPLIMIENTO: TStringField;
    sdqConsultaNIVELAUTO: TStringField;
    sdqConsultaNO_IDNIVELAUTORIZACIONSIM: TFloatField;
    sdqConsultaNO_IDMOTIVOSOLICITUDNOTA_1: TFloatField;
    sdqConsultaNP_PERIODO: TStringField;
    sdqConsultaTIPOFORM: TStringField;
    sdqConsultaESTADOFORM: TStringField;
    sdqConsultaNO_OBSERVACIONES: TStringField;
    gbEmpresa: TGroupBox;
    lblCuit: TLabel;
    fraEmpresaNota: TfraEmpresa;
    gbFechaAlta: TGroupBox;
    Label4: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    gbUsuarioAlta: TGroupBox;
    cmbUsuarioAlta: TCheckCombo;
    gbFormulario: TGroupBox;
    nbTipoFormulario: TNotebook;
    fraTipoFormulario: TfraCodigoDescripcionExt;
    edTipoFormulario: TEdit;
    gbEstado: TGroupBox;
    cmbEstado: TCheckCombo;
    gbTipoSolicitante: TGroupBox;
    chkUsuario: TCheckBox;
    chkSector: TCheckBox;
    chkOtroTipo: TCheckBox;
    gbSolicitante: TGroupBox;
    fraSolicitanteNota: TfraStaticCodigoDescripcion;
    gbEstadoBorrador: TGroupBox;
    chkAVerificar: TCheckBox;
    chkCorregidas: TCheckBox;
    gbSecuencia: TGroupBox;
    edSecuencia: TIntEdit;
    gbBibliorato: TGroupBox;
    edBibliorato: TIntEdit;
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    gbNivelSimulacion: TGroupBox;
    fraNivelSimulacion: TfraCodigoDescripcionExt;
    gbFechaRecepcionEmi: TGroupBox;
    lblFechaHastaFIltro: TLabel;
    edFRecepcionEmisionDesde: TDateComboBox;
    edFRecepcionEmisionHasta: TDateComboBox;
    gbFechaRecepcionART: TGroupBox;
    Label2: TLabel;
    edFRecepcionARTDesde: TDateComboBox;
    edFRecepcionARTHasta: TDateComboBox;
    gbFiltro: TJvgGroupBox;
    tbObservacion: TToolButton;
    sdqConsultaNP_OBSERVACION: TStringField;
    sdqConsultaNP_ID: TFloatField;
    pnColorSolicitudAgendada: TPanel;
    Label31: TLabel;
    sdqConsultaNP_IDSOLICITUDAUTORIZACION: TFloatField;
    sdqConsultaNP_IDTIPOFORMULARIO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure tbSimularClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure chkUsuarioClick(Sender: TObject);
    procedure chkSectorClick(Sender: TObject);
    procedure chkOtroTipoClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbFiltroExpanded(Sender: TObject);
    procedure gbFiltroCollapsed(Sender: TObject);
    procedure tbObservacionClick(Sender: TObject);
  private
    FTipoSolicitanteChecked: integer;
    FArrIdFormulario: array of integer;
    FArrIdObs: array of integer;
    FIdNota: integer;
    FSecuenciaAnterior: integer;
    FColorAnterior: TColor;
    procedure ArmarConsulta;
    procedure CargarFrameSolicitante;
    procedure ActualizarSimulacion;
  public
    property IdNota: integer read FIdNota write FIdNota;
    procedure FiltrarNotas(aContrato: integer; aArrIdFormulario: array of integer; aPeriodo: string; aEstado: integer;
      aArrIdObs: array of integer); overload;
    procedure FiltrarNotas(aContrato: integer; aPeriodo: string); overload;
  end;

var
  frmConsultaNotas: TfrmConsultaNotas;

implementation

uses DateUtils;

{$R *.dfm}

{ TfrmConsultaNotas }

procedure TfrmConsultaNotas.ArmarConsulta;
var
  sWhere, sFrom, subWhere, sIn, sInObs, sInEstado, sInUsuario, sInTipoSolicitante: string;
  i: integer;
begin
  sWhere  := '';
  sFrom   := '';
  subWhere := '';
  sIn := '';
  sInEstado := '';
  sInUsuario := '';
  sInTipoSolicitante := '';

  if fraEmpresaNota.IsSelected then
    sWhere := sWhere + ' AND ino.no_contrato = ' + SqlValue(fraEmpresaNota.Contrato);

  if not edBibliorato.IsEmpty then
    sWhere := sWhere + ' AND ino.no_bibliorato = ' + SqlValue(edBibliorato.Value);

  if fraNivelSimulacion.IsSelected then
  begin
    sWhere := sWhere + ' AND INA.NA_ID = ' + SqlValue(fraNivelSimulacion.Value);
  end;


  if (cmbEstado.CheckedCount > 0) then
  begin
    for i:=0 to cmbEstado.Items.Count-1 do
    begin
        if cmbEstado.Checked[i] then
        begin
          if (sInEstado <> '') then
            sInEstado := sInEstado + ', ';
          sInEstado := sInEstado + inttostr(integer(cmbEstado.Items.Objects[i]));
        end;
    end;
    if (sInEstado <> '') then
      sWhere := sWhere + ' AND no_idestadonota IN (' + sInEstado + ') ';
  end
  else
    sWhere := sWhere + ' AND no_idestadonota <> 4 ';

  if (cmbUsuarioAlta.CheckedCount > 0) then
  begin
    for i:=0 to cmbUsuarioAlta.Items.Count-1 do
    begin
        if cmbUsuarioAlta.Checked[i] then
        begin
          if (sInUsuario <> '') then
            sInUsuario := sInUsuario + ', ';
          sInUsuario := sInUsuario +  SqlValue(cmbUsuarioAlta.Items[i]);
        end;
    end;
    if (sInUsuario <> '') then
      subWhere := subWhere + ' AND NO_USUALTA IN (' + sInUsuario + ') ';
  end;

  if (FTipoSolicitanteChecked = 1) then
  begin
    if chkUsuario.Checked then
      sWhere := sWhere + ' AND ino.no_tiposolicitante = ' + SqlValue(0);

    if chkSector.Checked then
      sWhere := sWhere + ' AND ino.no_tiposolicitante = ' + SqlValue(1);

    if chkOtroTipo.Checked then
      sWhere := sWhere + ' AND ino.no_tiposolicitante = ' + SqlValue(2);
  end
  else
    if (FTipoSolicitanteChecked > 1) then
    begin
      if chkUsuario.Checked then
        sInTipoSolicitante := sInTipoSolicitante + iif(sInTipoSolicitante<>'', ',', '')  + SqlValue(0);

      if chkSector.Checked then
        sInTipoSolicitante := sInTipoSolicitante + iif(sInTipoSolicitante<>'', ',', '') + SqlValue(1);

      if chkOtroTipo.Checked then
        sInTipoSolicitante := sInTipoSolicitante + iif(sInTipoSolicitante<>'', ',', '') + SqlValue(2);

      sWhere := sWhere + ' AND ino.no_tiposolicitante in (' + sInTipoSolicitante + ') ';
    end;

  if not fraSolicitanteNota.Locked and fraSolicitanteNota.IsSelected then
    sWhere := sWhere +  ' AND ino.no_solicitante = ' + SqlValue(fraSolicitanteNota.Value);

  if not edFRecepcionEmisionDesde.IsEmpty then
    sWhere := sWhere + ' AND ino.no_fecharecepcion >= ' + SqlValue(edFRecepcionEmisionDesde.Date);

  if not edFRecepcionEmisionHasta.IsEmpty then
    sWhere := sWhere + ' AND ino.no_fecharecepcion <= ' + SqlValue(edFRecepcionEmisionHasta.Date);

  sWhere := sWhere + SqlBetweenDateTime(' AND ino.no_fechaalta', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  if not edFRecepcionARTDesde.IsEmpty then
    sWhere := sWhere + ' AND ino.no_fecharecepcionART >= ' + SqlValue(edFRecepcionARTDesde.Date);

  if not edFRecepcionARTHasta.IsEmpty then
    sWhere := sWhere + ' AND ino.no_fecharecepcionART <= ' + SqlValue(edFRecepcionARTHasta.Date);

  if not edSecuencia.IsEmpty then
    sWhere := sWhere + ' AND ino.no_secuencia = ' + SqlValue(edSecuencia.Value);

  if chkAVerificar.Checked then
    sWhere := sWhere + ' AND ino.no_estadocorreccion = ''V''';

  if chkCorregidas.Checked then
    sWhere := sWhere + ' AND ino.no_estadocorreccion = ''C''';

  if not edPeriodo.Periodo.IsNull then
    sWhere := sWhere + ' AND NP_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
//    subWhere := subWhere + ' AND NP_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);

  if fraTipoFormulario.IsSelected then
    sWhere := sWhere + ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(fraTipoFormulario.Value);
//    subWhere := subWhere + ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(fraTipoFormulario.Value);

  for i:=0 to Length(FArrIdFormulario)-1 do
  begin
      if (sIn <> '') then
        sIn := sIn + ', ';
      sIn := sIn + inttostr(FArrIdFormulario[i]);
  end;
  if (sIn <> '') then
    sWhere := sWhere + ' AND NP_IDTIPOFORMULARIO IN (' + sIn + ') ';
//    subWhere := subWhere + ' AND NP_IDTIPOFORMULARIO IN (' + sIn + ') ';


  for i:=0 to Length(FArrIdObs)-1 do
  begin
      if (sInObs <> '') then
        sInObs := sInObs + ', ';
      sInObs := sInObs + inttostr(FArrIdObs[i]);
  end;
  if (sInObs <> '') then
    subWhere := subWhere + ' AND EXISTS (SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO INP2, EMI.IPO_NOTAPERIODOOBSERVACION ' +
                           ' WHERE NP_IDNOTA = INO.NO_ID AND NP_ID = PO_IDNOTACONTRATOPERIODO AND ' +
                             iif(subWhere<>'', ' INP2.NP_ID = INP.NP_ID AND ', '') +
                           ' PO_IDOBSERVACION IN (' + sInObs + '))';

(*
  if (subWhere <> '') then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 FROM EMI.INP_NOTACONTRATOPERIODO INP ' +
                       ' WHERE NP_IDNOTA = INO.NO_ID ' + subWhere + ')';
*)                       

//  if fraUsuario.IsSelected then
//    sWhere := sWhere + ' AND NO_USUALTA = ' + SqlValue(fraUsuario.UserID);

  sdqConsulta.SQL.Text := 'SELECT ien.en_descripcion, ims.ms_descripcion, ino.no_id, ' +
                          '       DECODE (TRIM (ino.no_tiposolicitante), ' +
                          '               ''0'', (SELECT se_nombre ' +
                          '                       FROM art.use_usuarios ' +
                          '                      WHERE se_id = ino.no_solicitante), ' +
                          '               ''1'', (SELECT sc_descripcion ' +
                          '                       FROM art.usc_sectores ' +
                          '                      WHERE sc_id = ino.no_solicitante), ' +
                          '               ''2'', (SELECT sn_descripcion ' +
                          '                       FROM emi.isn_solicitantesnota ' +
                          '                      WHERE sn_id = ino.no_solicitante), ' +
                          '               ''N/D'' ' +
                          '              ) solicitante, ' +
                          '       ino.no_fecharecepcion, ino.no_fecharecepcionart, no_solicitante, ' +
                          '       ino.no_idmotivosolicitudnota, ino.no_contrato, ino.no_bibliorato, ' +
                          '       ino.no_secuencia, ino.no_usualta, ino.no_fechaalta, ino.no_usumodif, ' +
                          '       ino.no_fechamodif, ino.no_fechabaja, ino.no_usubaja, ' +
                          '       ino.no_idestadonota, ino.no_tiposolicitante,np_idsolicitudautorizacion, ' +
                          '       ino.no_idmotivosolicitudnota, ino.no_observacionescumplimiento, ' +
                          '       em_nombre empresa, ' +
(*
                          '       art.afiliacion.get_nombreempresa (art.afiliacion.get_cuitempresa (ino.no_contrato) ' +
                          '                                         ) empresa, ' +
*)

                          '       no_estadocorreccion, ' +
                          '       no_fechaaplicacion,     ' +
                          '       no_usuarioaplicacion, ' +
                          '       no_fechaasimulacion, ' +
                          '       no_usuarioasimulacion, ' +
                          '       na_descripcion nivelauto, ' +
                          '       no_idnivelautorizacionsim, ' +
                          '       em_cuit cuit, np_periodo, tf_descripcion tipoform, ' +
                          '       ef_descripcion estadoform, no_observaciones, np_observacion, np_id, inp.np_idtipoformulario ' +
                          'FROM AFI.AEM_EMPRESA, '  +
                          '     AFI.ACO_CONTRATO, ' +
                          '     EMI.INO_NOTA INO, ' +
                          '     EMI.IEN_ESTADONOTA IEN, ' +
                          '     EMI.INA_NIVELAUTORIZACION INA, ' +
                          '     EMI.IMS_MOTIVOSOLICITUDNOTA IMS, ' +
                          '     EMI.IEF_ESTADOFORMULARIO IEF, ' +
                          '     EMI.ITF_TIPOFORMULARIO ITF, ' +
                          '     EMI.INP_NOTACONTRATOPERIODO INP ' + sFrom +
                          'WHERE (    (INO.NO_IDESTADONOTA = IEN.EN_ID ) ' +
                          '       AND (INO.NO_IDMOTIVOSOLICITUDNOTA = IMS.MS_ID )) ' +
                          '       AND (INO.NO_ID = INP.NP_IDNOTA(+)) ' +
                          '       AND INA.NA_ID(+) = NO_IDNIVELAUTORIZACIONSIM ' +
                          '       AND CO_CONTRATO = NO_CONTRATO ' +
                          '       AND EF_ID(+) = NP_IDESTADOFORMULARIO ' +
                          '       AND ITF.TF_ID(+) = INP.NP_IDTIPOFORMULARIO ' +
                          '       AND NP_FECHABAJA IS NULL ' +
                          '       AND CO_IDEMPRESA = EM_ID ' + sWhere;

  if trim (SortDialog.OrderBy) <> '' then
    sdqConsulta.SQL.Add(SortDialog.OrderBy)
  else
    sdqConsulta.SQL.Add(' order by no_id desc ')
end;

procedure TfrmConsultaNotas.FormCreate(Sender: TObject);
begin
  inherited;
  CargarFrameSolicitante;

  fraEmpresaNota.ShowBajas := true;

  tbSimular.Left := tbPropiedades.Left;
  tbObservacion.Left := tbPropiedades.Left;

//  fraUsuario.ShowBajas := true;
//  fraUsuario.Sector := 'EMI';

  cmbUsuarioAlta.Clear;
  with GetQuery('SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA, SE_MAIL ' +
                ' FROM ART.USE_USUARIOS WHERE SE_SECTOR = ' + SqlValue('EMI')) do
  try
   while not Eof do
   begin
    cmbUsuarioAlta.Items.Add(FieldbyName('SE_USUARIO').AsString);
    Next;
   end;
  finally
    Free;
  end;

  cmbEstado.Clear;
  with GetQuery('SELECT EN_ID, EN_DESCRIPCION FROM EMI.IEN_ESTADONOTA') do
  try
   while not Eof do
   begin
    cmbEstado.Items.AddObject(FieldbyName('EN_DESCRIPCION').AsString, TObject(FieldbyName('EN_ID').AsInteger));
    Next;
   end;
  finally
    Free;
  end;

  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraNivelSimulacion do
  begin
    TableName   := 'EMI.INA_NIVELAUTORIZACION';
    FieldID     := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc   := 'NA_DESCRIPCION';
    FieldBaja   := 'NA_FECHABAJA';
    ShowBajas   := True;
  end;

  FIdNota := -1;
end;

procedure TfrmConsultaNotas.tbRefrescarClick(Sender: TObject);
begin
  ActualizarSimulacion;
  FSecuenciaAnterior := -1;
  FColorAnterior := clSkyBlue;
  ArmarConsulta;
  inherited;
end;

procedure TfrmConsultaNotas.tbNuevoClick(Sender: TObject);
begin
  TfrmABMNotas.AltaNota(fraEmpresaNota.Contrato, edPeriodo.Periodo.Valor);
  if sdqConsulta.Active then RefreshData;
  inherited;
end;

procedure TfrmConsultaNotas.tbModificarClick(Sender: TObject);
var
  bc : Tbookmark;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
    try
      bc := Grid.DataSource.DataSet.GetBookmark;
      if (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_APLICADA) and
         (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_PEND_AUTORIZA) and
         (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_BAJA) and
         (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_PEND_SIMULACION) and
         (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_AGENDADA) then
        TfrmABMNotas.ModificarNota(sdqConsulta.FieldByName('NO_ID').AsInteger)
      else
        TfrmABMNotas.VerNota(sdqConsulta.FieldByName('NO_ID').AsInteger);
      if sdqConsulta.Active then RefreshData;
      Grid.DataSource.DataSet.GotoBookmark(bc);
      Grid.DataSource.DataSet.FreeBookmark(bc);
    except
    end;
  end;
  inherited;
end;

procedure TfrmConsultaNotas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaNota.Clear;
  edFRecepcionEmisionDesde.Clear;
  edFRecepcionEmisionHasta.Clear;
  edFRecepcionARTDesde.Clear;
  edFRecepcionARTHasta.Clear;
  edSecuencia.Clear;
  edBibliorato.Clear;
  edPeriodo.Clear;
  fraTipoFormulario.Clear;
  cmbEstado.Clear;
  cmbUsuarioAlta.Clear;
  fraSolicitanteNota.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  chkUsuario.Checked := false;
  chkSector.Checked := false;
  chkOtroTipo.Checked := false;
  CargarFrameSolicitante;
  fraNivelSimulacion.Clear;
  tbPropiedades.Enabled := false;
end;

procedure TfrmConsultaNotas.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.Active then
  begin
    if (sdqConsulta.FieldByName('no_estadocorreccion').AsString = 'V') then
      Background := clSilver
    else begin
      if (sdqConsulta.FieldByName('no_estadocorreccion').AsString = 'C') then
      begin
        Background := $009BFF9B;
        if Highlight then
          AFont.Color := clBlack;
      end;
    end;

    if (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_APLICADA) then
    begin
      Background := $00E1FFFF;
      if Highlight then
        Background := clTeal;
    end;

    if (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_PEND_AUTORIZA) then
    begin
      if Highlight then AFont.Color := $00FFD7D7
      else AFont.Color := clNavy;
    end;

    if (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_PEND_SIMULACION) then
    begin
      AFont.Color := $00404080;
      AFont.Style := [fsBold];
    end;

    if (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_AGENDADA) then
    begin
      if Highlight then
        Background := clTeal
      else
        Background := pnColorSolicitudAgendada.Color;
    end;

    if (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_BAJA) then
      AFont.Color := clRed;

(*
    if (Field.FieldName = 'NO_SECUENCIA') then
    begin
      if (FSecuenciaAnterior <> Field.AsInteger) then
      begin
        if (FColorAnterior = clSkyBlue) then
          FColorAnterior := clMedGray
        else
          FColorAnterior := clSkyBlue;
      end;
      Background := FColorAnterior;
      FSecuenciaAnterior := Field.AsInteger;
    end;
*)
  end;
end;

procedure TfrmConsultaNotas.FiltrarNotas(aContrato: integer; aArrIdFormulario: array of integer; aPeriodo: string; aEstado: integer;
  aArrIdObs: array of integer);
var
  i: integer;
begin
  tbNuevo.Enabled := false;
  tbEliminar.Enabled := false;
  fraEmpresaNota.Contrato := aContrato;
  fraEmpresaNota.Locked := true;
  edPeriodo.Periodo.Valor := aPeriodo;
  edPeriodo.Enabled := false;
  fraTipoFormulario.Visible := false;
  SetLength(FArrIdFormulario, Length(aArrIdFormulario));
  nbTipoFormulario.PageIndex := 1;
  for i:=0 to Length(aArrIdFormulario)-1 do
  begin
    FArrIdFormulario[i] := aArrIdFormulario[i];
    if (edTipoFormulario.Text <> '') then
      edTipoFormulario.Text := edTipoFormulario.Text + ' - ';

    edTipoFormulario.Text := edTipoFormulario.Text + ValorSql(' SELECT TF_DESCRIPCION ' +
                                                                      ' FROM EMI.ITF_TIPOFORMULARIO ' +
                                                                      ' WHERE TF_ID = ' + SqlValue(aArrIdFormulario[i]));
  end;

  SetLength(FArrIdObs, Length(aArrIdObs));
  for i:=0 to Length(aArrIdObs)-1 do
    FArrIdObs[i] := aArrIdObs[i];

  cmbEstado.Enabled := false;
  cmbEstado.Checked[cmbEstado.Items.IndexOfObject(TObject(aEstado))] := true;

  pnlBottom.Visible := true;
  tbRefrescarClick(nil);
end;

procedure TfrmConsultaNotas.btnSeleccionarClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
    FIdNota := sdqConsulta.FieldByName('no_id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmConsultaNotas.FiltrarNotas(aContrato: integer;
  aPeriodo: string);
begin
  edPeriodo.Periodo.Valor := aPeriodo;
  edPeriodo.Enabled := false;
  fraEmpresaNota.Contrato := aContrato;
  fraEmpresaNota.Locked := true;
  tbRefrescarClick(nil);
end;

procedure TfrmConsultaNotas.tbSimularClick(Sender: TObject);
var
  bc : Tbookmark;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and
     ((sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_PEND_SIMULACION) or
      (sdqConsulta.FieldByName('no_idestadonota').AsInteger = ESTADO_NOTA_AGENDADA)) then
  begin
    if (sdqConsulta.FieldByName('no_idnivelautorizacionsim').AsInteger > get_nivelautorizacionusuario(Sesion.LoginName)) then
    begin
      InvalidHint(Grid, 'Su nivel difiere del requerido para simular la nota.', 'Simulación', blnError);
      Exit;
    end;

    try
      bc := Grid.DataSource.DataSet.GetBookmark;
      TfrmABMNotas.SimularNota(sdqConsulta.FieldByName('NO_ID').AsInteger);
      if sdqConsulta.Active then RefreshData;
      Grid.DataSource.DataSet.GotoBookmark(bc);
      Grid.DataSource.DataSet.FreeBookmark(bc);
    except
    end;
  end;
  inherited;
end;

procedure TfrmConsultaNotas.tbEliminarClick(Sender: TObject);
var
  bc : Tbookmark;
begin
  inherited;
  if (not sdqConsulta.IsEmpty) and (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_APLICADA) and
     (sdqConsulta.FieldByName('no_idestadonota').AsInteger <> ESTADO_NOTA_BAJA) then
  begin
    if MsgBox ('¿Desea dar de baja la Nota?', MB_YESNO + MB_ICONINFORMATION ) = IDYES then
    begin
      with TfrmObservacion.Create(self) do
      try
        if (ShowModal = mrOk) then
        begin
          try
            bc := Grid.DataSource.DataSet.GetBookmark;
            EjecutarSql(' UPDATE emi.isa_solicitudautorizacion '+
                        '    SET sa_fechabaja = SYSDATE, '+
                        '        sa_usubaja = '+SqlValue(Sesion.LoginName)+', '+
                        '        sa_tipocumplimiento = ''E'' '+
                        '  WHERE sa_id = '+SqlValue(sdqConsulta.FieldByName('NP_IDSOLICITUDAUTORIZACION').AsInteger));
            EjecutarSql(' UPDATE EMI.INO_NOTA SET NO_FECHABAJA = SYSDATE, NO_USUBAJA = ' + SqlValue(Sesion.LoginName) + ', ' +
                        ' NO_IDESTADONOTA = ' + SqlValue(ESTADO_NOTA_BAJA) + ', NO_OBSERVACIONES = ' + SqlValue(Observacion) +
                        ' WHERE NO_ID = ' + SqlValue(sdqConsulta.FieldByName('NO_ID').AsInteger));

            EnviarMailBD(Get_DireccionesEnvioMail('ELIMNOTA'),
                         'Aviso de Nota Eliminada',
                         [],
                         sesion.Usuario + ' ha eliminado la nota Sec: ' + sdqConsulta.FieldByName('NO_SECUENCIA').AsString + ' Bibl: ' + sdqConsulta.FieldByName('NO_BIBLIORATO').AsString + '.' + #13#10 +
                         'Obs: ' + Observacion,
                         nil, 0, tcDefault, true, false, -1);
            if sdqConsulta.Active then RefreshData;
            Grid.DataSource.DataSet.GotoBookmark(bc);
            Grid.DataSource.DataSet.FreeBookmark(bc);
          except
          end;
        end;
      finally
        free;
      end;
    end;
  end;
end;

procedure TfrmConsultaNotas.CargarFrameSolicitante;
begin
  fraSolicitanteNota.Clear;

  with fraSolicitanteNota do
  begin
    if chkUsuario.Checked and not chkSector.Checked and not chkOtroTipo.Checked then
    begin
      TableName := 'art.use_usuarios';
      FieldID := 'se_id';
      FieldCodigo := 'se_usuario';
      FieldDesc := 'se_nombre';
      FieldBaja := 'se_fechabaja';
    end;

    if not chkUsuario.Checked and chkSector.Checked and not chkOtroTipo.Checked then
    begin
      TableName := 'art.usc_sectores';
      FieldID := 'sc_id';
      FieldCodigo := 'sc_codigo';
      FieldDesc := 'sc_descripcion';
      FieldBaja := 'sc_fechabaja';
    end;

    if not chkUsuario.Checked and not chkSector.Checked and chkOtroTipo.Checked then
    begin
      TableName := 'emi.isn_solicitantesnota';
      FieldID := 'sn_id';
      FieldCodigo := 'sn_id';
      FieldDesc := 'sn_descripcion';
      FieldBaja := 'sn_fechabaja';
    end;

    ShowBajas := true
  end;

  fraSolicitanteNota.Locked := (FTipoSolicitanteChecked <> 1);

end;

procedure TfrmConsultaNotas.chkUsuarioClick(Sender: TObject);
begin
  if chkUsuario.Checked then inc(FTipoSolicitanteChecked)
  else dec(FTipoSolicitanteChecked);
  CargarFrameSolicitante;
end;

procedure TfrmConsultaNotas.chkSectorClick(Sender: TObject);
begin
  if chkSector.Checked then inc(FTipoSolicitanteChecked)
  else dec(FTipoSolicitanteChecked);
  CargarFrameSolicitante;
end;

procedure TfrmConsultaNotas.chkOtroTipoClick(Sender: TObject);
begin
  if chkOtroTipo.Checked then inc(FTipoSolicitanteChecked)
  else dec(FTipoSolicitanteChecked);
  CargarFrameSolicitante;
end;

procedure TfrmConsultaNotas.tbPropiedadesClick(Sender: TObject);
begin
  with TfrmObservacion.Create(self) do
  try
    Observacion := sdqConsultaNO_OBSERVACIONES.Value;
    btnAceptar.Enabled := false;
    tbLimpiar.Enabled := false;
    edObservacion.Enabled := false;
    ShowModal;
  finally
    free;
  end;

end;

procedure TfrmConsultaNotas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
   tbPropiedades.Enabled := sdqConsultaNO_OBSERVACIONES.Value <> '';
end;

procedure TfrmConsultaNotas.gbFiltroExpanded(Sender: TObject);
begin
  inherited;
  tbMostrarFiltros.Down := not tbMostrarFiltros.Down;
  tbMostrarFiltros.Click;
end;

procedure TfrmConsultaNotas.gbFiltroCollapsed(Sender: TObject);
begin
  inherited;
  tbMostrarFiltros.Down := not tbMostrarFiltros.Down;
  tbMostrarFiltros.Click;
end;

procedure TfrmConsultaNotas.ActualizarSimulacion;
//Truchada pero ya me tiene podrido
//Pasa a simulacion las notas 90 que no pudieron
//para por no tener ddjj en su momento
var
  nivelautorizacion: integer;
begin
  with GetQuery(' SELECT np_idnota ' +
                '    FROM emi.ino_nota, emi.inp_notacontratoperiodo ' +
                '   WHERE np_fechabaja IS NULL ' +
                '     AND np_idnota = no_id ' +
                '     AND np_idtipoformulario IN(90) ' +
                '     AND no_fechabaja IS NULL ' +
                '     AND no_fechaasimulacion IS NULL ' +
                '     AND no_fechaaplicacion IS NULL ' +
                '     AND EXISTS(SELECT 1 '+
                '                  FROM emi.iev_estadoverificado, emi.idj_ddjj ' +
                '                 WHERE dj_contrato = no_contrato ' +
                '                   AND dj_periodo = np_periodo ' +
                '                   AND dj_estado + 0 = ev_id ' +
                '                   AND ev_estado = ''A'')') do
  try
    while not Eof do
    begin

      nivelautorizacion := get_nivelautrequeridonotasim(FieldByName('np_idnota').AsInteger, 'S');

      EjecutarSqlEx(' UPDATE emi.ino_nota ' +
                    ' SET no_usuarioasimulacion = ''SISTEMAS'', ' +
                    '     no_idestadonota =  :estado, ' +
                    '     no_idnivelautorizacionsim = :nivelaut,  ' +
                    '     no_fechaasimulacion = SYSDATE ' +
                    ' WHERE no_id = :id', [ESTADO_NOTA_PEND_SIMULACION, nivelautorizacion, FieldByName('np_idnota').AsInteger]);
      Next;
    end;
  finally
    free;
  end;

end;

procedure TfrmConsultaNotas.tbObservacionClick(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmObservacion.Create(self) do
    try
      Observacion := sdqConsulta.FieldByName('np_observacion').asstring;
      if (ShowModal = mrOk) then
        EjecutarSqlEx(' update emi.inp_notacontratoperiodo ' +
                      ' set np_observacion = :observacion ' +
                      ' where np_id = :id ', [trim(Observacion), self.sdqConsulta.FieldByName('np_id').AsInteger]);
        sdqConsulta.Refresh;
    finally
      free;
    end;
  end;
end;

end.
