unit unFrmEmpresasRegla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  unfraCodigoDescripcionExt, RxPlacemnt, JvExMask, JvToolEdit, ComboEditor,
  CheckCombo, DBCheckCombo;

type
  TfrmEmpresasRegla = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaRegla: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    lblPerfilNomina: TLabel;
    fraReglaLey: TfraCodigoDescripcion;
    edTexto: TMemo;
    ShortCutControl1: TShortCutControl;
    fpAdjuntarArchivo: TFormPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbArchivoSIC: TLabel;
    btnAceptarArchivoSIC: TButton;
    btnCancelarArchivoSIC: TButton;
    edArchivoSIC: TJvFilenameEdit;
    gbEstadosEmpresa: TGroupBox;
    cmbEstadoEmpresaFiltro: TDBCheckCombo;
    gbEmpresa: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    sdqEstadosEmpresa: TSDQuery;
    dsEstadosEmpresa: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraReglaLeyChange(Sender: TObject);
    procedure btnAceptarArchivoSICClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    function AdjuntarArchivoEvento: boolean;
  public
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;

  end;

var
  frmEmpresasRegla: TfrmEmpresasRegla;

implementation

uses
  unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta, unSic, StrFuncs;

{$R *.dfm}

function TfrmEmpresasRegla.AdjuntarArchivoEvento: boolean;
begin
  edArchivoSIC.Clear;
  result := (fpAdjuntarArchivo.ShowModal = mrOk);
end;

procedure TfrmEmpresasRegla.btnAceptarArchivoSICClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivoSIC.FileName), edArchivoSIC, 'Debe indicar el archivo adjunto para poder continuar.');
  fpAdjuntarArchivo.ModalResult := mrOk;
end;

procedure TfrmEmpresasRegla.ClearControls;
begin
  fraEmpresaRegla.Clear;
  fraEmpresaRegla.Locked := false;
  btnAceptar.Enabled     := true;
  LockControl(edPeriodoDesde, false);
  fraReglaLey.Locked     := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  fraReglaLey.Clear;
  edTexto.Lines.Clear;
end;

function TfrmEmpresasRegla.DoABM: Boolean;
var
  LeyAntActiva: integer;
  idevento: integer;
begin
 Result := false;
 try
    if ((ModoABM = maBaja) or (ModoABM = maAlta)) then
    begin
      if not AdjuntarArchivoEvento then Exit;
      BeginTrans(true);
      do_insertarevento(111, 4, 0, idevento, Sesion.UserID, 'Evento por cambio de vigencia de la base ampliada.', fraEmpresaRegla.Contrato);
      do_insertaradjuntoevento(idevento, edArchivoSIC.FileName, Sesion.UserID);
      do_insertartareacontrato(TAREA_REGENERAR_DDJJ_BASE_AMPLIADA, fraEmpresaRegla.Contrato, Sesion.LoginName);
    end;

    BeginTrans(true);
    Result := true;
    Sql.Clear;

    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('RC_ID', sdqConsulta.FieldByName('RC_ID').AsInteger);
      Sql.Fields.Add('RC_USUBAJA', Sesion.LoginName);
      Sql.Fields.Add('RC_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('RC_CONTRATO', fraEmpresaRegla.Contrato);
      Sql.Fields.Add('RC_IDREGLALEY', fraReglaLey.Value);
      Sql.Fields.Add('RC_PERIODODESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('RC_PERIODOHASTA', edPeriodoHasta.Periodo.valor);

      if ModoABM = maAlta Then
      begin
        LeyAntActiva := ValorSqlInteger (' SELECT RC_IDREGLALEY ' +
                                         ' FROM EMI.IRC_REGLALEYCONTRATO A ' +
                                         ' WHERE RC_CONTRATO = ' + SqlValue(fraEmpresaRegla.Contrato) +
                                         ' AND RC_FECHABAJA IS NULL ' +
                                         ' AND RC_PERIODODESDE = (SELECT MAX(RC_PERIODODESDE) ' +
                                         '                         FROM EMI.IRC_REGLALEYCONTRATO B ' +
                                         '                        WHERE B.RC_CONTRATO = ' + SqlValue(fraEmpresaRegla.Contrato) +
                                         '                          AND B.RC_FECHABAJA IS NULL)');

        if LeyAntActiva = fraReglaLey.Value then
        begin
          EjecutarSqlST(' UPDATE EMI.IRC_REGLALEYCONTRATO ' +
          ' SET RC_FECHABAJA = SYSDATE, ' +
          '     RC_USUBAJA = ' + SqlValue(Sesion.LoginName) +
          ' WHERE RC_CONTRATO = ' + SqlValue(fraEmpresaRegla.Contrato) +
          '   AND RC_IDREGLALEY = ' + SqlValue(fraReglaLey.Value) +
          '   AND RC_FECHABAJA IS NULL ');
        end;

        Sql.PrimaryKey.Add('RC_ID', GetSecNextVal('EMI.SEQ_IRC_ID'));
        Sql.Fields.Add('RC_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('RC_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('RC_ID', sdqConsulta.FieldByName('ER_ID').AsInteger);
        Sql.Fields.Add('RC_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('RC_FECHAMODIF', exDateTime );
        Sql.Fields.Add('RC_USUBAJA', exNull);
        Sql.Fields.Add('RC_FECHABAJA', exNull );
      end;
    end;

    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
end;

procedure TfrmEmpresasRegla.LoadControls;
begin
  fraEmpresaRegla.Contrato     := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  fraReglaLey.Value            := sdqConsulta.FieldByName('RC_IDREGLALEY').AsInteger;
  fraReglaLeyChange(Self);
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('RC_PERIODODESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('RC_PERIODOHASTA').AsString;
  fraEmpresaRegla.Locked       := true;
  fraReglaLey.Locked           := true;
  LockControl(edPeriodoDesde, true);
  btnAceptar.Enabled           := sdqConsulta.FieldByName('RC_FECHABAJA').IsNull;
end;

function TfrmEmpresasRegla.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de empresas según ley',
                                fraEmpresaRegla, fraEmpresaRegla.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                fraEmpresaRegla, fraEmpresaRegla.IsSelected, 'Debe especificar una regla',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.' // valida periodo desde obligatorio.
                                ]);
end;
function TfrmEmpresasRegla.ValidaSolapamiento: Boolean;
begin
  result := true;
end;

procedure TfrmEmpresasRegla.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja     := 'rc_fechabaja';
  Sql.TableName := 'emi.irc_reglaleycontrato';

  fraEmpresaRegla.ShowBajas  := True;
  fraEmpresaFiltro.ShowBajas := True;

  with fraReglaLey do
  begin
    TableName   := 'emi.irl_reglaley';
    FieldID     := 'rl_id';
    FieldCodigo := 'rl_id';
    FieldDesc   := 'rl_descripcion';
    FieldBaja   := 'rl_fechabaja';
    OnChange    := fraReglaLeyChange;
    ExtraFields := ', rl_textoexplicativo ';
    ShowBajas   := true;
  end;
end;

procedure TfrmEmpresasRegla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasRegla.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  cmbEstadoEmpresaFiltro.Clear;
end;

procedure TfrmEmpresasRegla.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT irc.rc_id, aco.co_contrato, irc.rc_periodohasta, irc.rc_periododesde, rc_idreglaley, rl_descripcion, irc.rc_fechaalta, irc.rc_usualta, ' +
                      '      irc.rc_fechabaja, irc.rc_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre, afest.tb_descripcion descr_estado ' +
                      ' FROM art.ctb_tablas afest, emi.irl_reglaley, afi.aem_empresa aem, afi.aco_contrato aco, emi.irc_reglaleycontrato irc ' +
                      ' WHERE aem.em_id = aco.co_idempresa ' +
                      '  AND rc_idreglaley = rl_id ' +
                      '  AND co_contrato = irc.rc_contrato ' +
                      '  AND afest.tb_clave = ''AFEST'' ' +
                      '  AND afest.tb_codigo = co_estado ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND rc_contrato = ' + SqlValue(fraEmpresaFiltro.Contrato));

  if not IsEmptyString(cmbEstadoEmpresaFiltro.Text) then
     sdqConsulta.SQL.Add(' AND co_estado ' + cmbEstadoEmpresaFiltro.InSql);

  inherited;
end;

procedure TfrmEmpresasRegla.fraReglaLeyChange(Sender: TObject);
begin
  edTexto.Lines.Clear;
  edTexto.Lines.Add(fraReglaLey.sdqDatos.fieldbyname('rl_textoexplicativo').AsString);
end;

end.


