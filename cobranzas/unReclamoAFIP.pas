unit unReclamoAFIP;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   12-11-03
 ULTIMA MODIFICACION: 12-11-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDbFrame, unFraEmpresa, Mask,
  ToolEdit, CurrEdit, PeriodoPicker, unArtDBAwareFrame, DateComboBox, Menus,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArt, RxCurrEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmReclamoAFIP = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraEmpresaConsulta: TfraEmpresa;
    gbPeriodos: TGroupBox;
    Label19: TLabel;
    Label18: TLabel;
    edRC_PERIODODesde: TPeriodoPicker;
    edRC_PERIODOHasta: TPeriodoPicker;
    edRA_IMPORTE: TCurrencyEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    chkSaldoDeudor: TCheckBox;
    GroupBox2: TGroupBox;
    chkReclamo: TCheckBox;
    tbSumatoria: TToolButton;
    tbSeparador: TToolButton;
    Label2: TLabel;
    edRA_FECHAPAGO: TDateComboBox;
    edRA_CUITIncorrecto: TMaskEdit;
    Label3: TLabel;
    edRA_PERIODOIncorrecto: TPeriodoPicker;
    Label4: TLabel;
    edRA_ImpuestoCorrecto: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edRA_ImpuestoIncorrecto: TEdit;
    lbCUIT: TPanel;
    frafpEmpresa: TfraEmpresa;
    Label7: TLabel;
    edRA_FECHARECEPCION: TDateComboBox;
    mnuImprimir: TPopupMenu;
    mnuCartaAFIP: TMenuItem;
    edRA_PERIODO: TPeriodoPicker;
    lbPERIODO: TPanel;
    mnuImprimirResultados: TMenuItem;
    Label9: TLabel;
    edRA_OBSERVACIONES: TMemo;
    Label10: TLabel;
    edRA_FECHARECEPCIONPAGO: TDateComboBox;
    Label11: TLabel;
    edRA_FECHARECEPCIONRESPUESTAAFIP: TDateComboBox;
    GroupBox3: TGroupBox;
    chkSoloActivas: TCheckBox;
    GroupBox5: TGroupBox;
    edRA_RESPUESTA: TMemo;
    Label8: TLabel;
    Label12: TLabel;
    fraRespuestaAFIP: TfraStaticCTB_TABLAS;
    GroupBox6: TGroupBox;
    dcbFechaImpresionDesde: TDateComboBox;
    dcbFechaImpresionHasta: TDateComboBox;
    Label13: TLabel;
    checkCopiarAlGrupo: TCheckBox;
    rgConcepto: TRadioGroup;
    GroupBox7: TGroupBox;
    chkNotasPendImpresion: TCheckBox;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    GroupBox9: TGroupBox;
    chkTodosContratos: TCheckBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GroupBox10: TGroupBox;
    chkNoAceptadosAFIP: TCheckBox;
    Label15: TLabel;
    fraEstado: TfraStaticCTB_TABLAS;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbNuevoClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuCartaAFIPClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
  private
    procedure Get_TipoCartaAFIP(Contrato: Integer; var HayPositivos, HayNegativos, EsReimpresion: Boolean; GrupoImpresion: String);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure CalcTotales;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmReclamoAFIP: TfrmReclamoAFIP;
  TotalLiquidacion : array of extended;

Const
  MAXCOLS = 5;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('PAGOS', 'DEVENGADOS', 'DEUDA_NOMINAL', 'DEUDA_CONSOLIDADA', 'RA_IMPORTE', 'RA_IMPORTEINGRESADO');

implementation

uses
  unPrincipal, AnsiSql, undmPrincipal, SqlFuncs, dbFuncs, CustomDlgs, General, unComunes, StrFuncs, unSesion,
  DateTimeFuncs, VCLExtra, unQRCartaAFIP, unCobranzas, unFuncionesEmision;

{$R *.DFM}

procedure TfrmReclamoAFIP.tbRefrescarClick(Sender: TObject);
var
  sSql, sOuterRecl: string;
begin
  Verificar(not(fraEmpresaConsulta.IsSelected or chkReclamo.Checked), chkReclamo, 'Debe seleccionar al menos una empresa en particular o bien aquellas que posean un reclamo de la AFIP.');

  sOuterRecl := iif(not chkReclamo.Checked, ' (+) ', ' ');

  sSql := 'SELECT RC_CONTRATOPRINCIPAL CONTRATOPRINC, EM_NOMBRE, EM_CUIT, RC_ID, RA_ID, RC_PERIODO, RA_IMPORTE, ' +
                 'RA_FECHAPAGO, RA_CUITINCORRECTO, RA_IMPUESTOCORRECTO, RA_IMPUESTOINCORRECTO, RA_PERIODOINCORRECTO, ' +
                 'RA_FECHAIMPRESION, RA_FECHARECEPCION, RAFIP.TB_DESCRIPCION RAFIP, RA_RESPUESTA, RA_FECHABAJA, RA_FECHARECEPCIONRESPUESTAAFIP, RA_FECHARECEPCIONPAGO, ' +
                 'RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS AS DEVENGADOS, ' +
                 'RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES AS PAGOS, ' +
                 'RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS - (RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES) DEUDA_NOMINAL, ' +
                 'RA_OBSERVACIONES, RA_USUALTA, TRUNC(RA_FECHAALTA) FECHAALTA, RA_RESPUESTAAFIP, RA_GRUPOIMPRESION, RA_CONCEPTO, ' +
                 'DEUDA.GET_DEUDATOTALCONSOLIDADA(RC_CONTRATO, RC_PERIODO) DEUDA_CONSOLIDADA, RAFIP.TB_ESPECIAL1 RESPUESTAAFIP, ' +
                 'RA_ESTADO, RA_IMPORTEINGRESADO, EST.TB_DESCRIPCION DESCRESTADO, RC_CODTIPOREGIMEN CODREG, RC_CONTRATO CONTRATOEXT ' +
            'FROM AEM_EMPRESA, ZRC_RESUMENCOBRANZA_EXT, ZRA_RECLAMOAFIP, CTB_TABLAS EST, CTB_TABLAS RAFIP ' +
           'WHERE RC_CONTRATO = RA_CONTRATO ' +  sOuterRecl +
             'AND RC_PERIODO = RA_PERIODO ' + sOuterRecl +
             'AND RAFIP.TB_CLAVE (+) = ''RAFIP'' ' +
             'AND RAFIP.TB_CODIGO (+) = RA_RESPUESTAAFIP ' +
             'AND EST.TB_CLAVE (+) = ''ESTRE'' ' +
             'AND EST.TB_CODIGO (+) = RA_ESTADO ' +
             'AND EM_CUIT = ART.AFILIACION.GET_CUITEMPRESA(RC_CONTRATO)';

  if not edRC_PERIODODesde.Periodo.IsNull then
    sSql := sSql + ' AND RC_PERIODO >= ' + SqlValue(edRC_PERIODODesde.Periodo.Valor);

  if not edRC_PERIODOHasta.Periodo.IsNull then
    sSql := sSql + ' AND RC_PERIODO <= ' + SqlValue(edRC_PERIODOHasta.Periodo.Valor);

  if fraEmpresaConsulta.IsSelected then
    begin
      if chkTodosContratos.Checked then
        sSql := sSql + ' AND RC_CONTRATO IN (SELECT CO_CONTRATO ' +
                                              'FROM ACO_CONTRATO_EXT, AEM_EMPRESA ' +
                                             'WHERE CO_IDEMPRESA = EM_ID ' +
                                               'AND EM_CUIT = ' + SqlValue(fraEmpresaConsulta.Cuit) + ')'
      else
        sSql := sSql + ' AND RC_CONTRATO = ' + SqlValue(fraEmpresaConsulta.ContratoExt);
    end;

  if chkSaldoDeudor.Checked then
    sSql := sSql + ' AND RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS - (RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES)>0 ';

  if chkSoloActivas.Checked then
    sSql := sSql + ' AND RA_FECHABAJA IS NULL ';

  if chkNotasPendImpresion.Checked then
    sSql := sSql + ' AND RA_FECHAIMPRESION IS NULL ' +
                   ' AND RA_ID IS NOT NULL ';

  if not dcbFechaImpresionDesde.IsEmpty then
    sSql := sSql + ' AND RA_FECHAIMPRESION >= ' + SqlValue(dcbFechaImpresionDesde.Date);

  if not dcbFechaImpresionHasta.IsEmpty then
    sSql := sSql + ' AND RA_FECHAIMPRESION <= ' + SqlValue(dcbFechaImpresionHasta.Date);

  if not edFechaAltaDesde.IsEmpty then
    sSql := sSql + ' AND RA_FECHAALTA >= ' + SqlValue(edFechaAltaDesde.Date);

  if not edFechaAltaHasta.IsEmpty then
    sSql := sSql + ' AND RA_FECHAALTA <= ' + SqlValue(edFechaAltaHasta.Date);

  if not chkNoAceptadosAFIP.Checked then
    sSql := sSql + ' AND NVL(RAFIP.TB_ESPECIAL1, '' '') <> ''N''';

  sdqConsulta.SQL.Text := sSql + ' ' + SortDialog.OrderBy;
  inherited;

  //Formateo los campos
  TFloatField( sdqConsulta.FieldByName('DEVENGADOS') ).Currency          := True;
  TFloatField( sdqConsulta.FieldByName('PAGOS') ).Currency               := True;
  TFloatField( sdqConsulta.FieldByName('DEUDA_NOMINAL') ).Currency       := True;
  TFloatField( sdqConsulta.FieldByName('DEUDA_CONSOLIDADA') ).Currency   := True;
  TFloatField( sdqConsulta.FieldByName('RA_IMPORTE') ).Currency          := True;
  TFloatField( sdqConsulta.FieldByName('RA_IMPORTEINGRESADO') ).Currency := True;
end;

procedure TfrmReclamoAFIP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmReclamoAFIP := nil;
  frmPrincipal.mnuReclamoAFIP.Enabled := True;
end;

procedure TfrmReclamoAFIP.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived                         := False;
  frmPrincipal.mnuReclamoAFIP.Enabled := False;

  with fraEmpresaConsulta do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  with frafpEmpresa do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  SetLength( TotalLiquidacion,  MAXCOLS  + 1);

  tbSumatoria.Left := 339;
  tbSeparador.Left := 339;

  FieldBaja              := 'RA_FECHABAJA';
  fraRespuestaAFIP.Clave := 'RAFIP';

  with fraEstado do
    begin
      Clave     := 'ESTRE';
      ShowBajas := False;
    end;
end;

procedure TfrmReclamoAFIP.ClearControls;
begin
  frafpEmpresa.Clear;
  edRA_PERIODO.Clear;
  edRA_IMPORTE.Clear;
  edRA_FECHAPAGO.Clear;
  edRA_CUITIncorrecto.Clear;
  edRA_PERIODOIncorrecto.Clear;
  edRA_ImpuestoCorrecto.Clear;
  edRA_ImpuestoIncorrecto.Clear;
  edRA_FECHARECEPCION.Clear;
  edRA_FECHARECEPCIONRESPUESTAAFIP.Clear;
  edRA_RESPUESTA.Lines.Clear;
  edRA_OBSERVACIONES.Lines.Clear;
  fraRespuestaAFIP.Clear;
  fraEstado.Clear;
  rgConcepto.ItemIndex := 0;   // Cuota
end;

function TfrmReclamoAFIP.DoABM: Boolean;
var
  sSet, sSql, sConcepto: String;
begin
  with Sql do
  begin
    Clear;
    TableName := 'ZRA_RECLAMOAFIP';

    case ModoABM of
      maAlta, maModificacion:
        if (ModoABM = maAlta) or ((ModoABM = maModificacion) and sdqConsulta.FieldByName('RA_ID').IsNull) then
          begin
            SqlType := stInsert;

            if rgConcepto.ItemIndex=0 then
              sConcepto := 'C'  // Cuota
            else if rgConcepto.ItemIndex=1 then
              sConcepto := 'I'  // Interés
            else
              sConcepto := '';

            PrimaryKey.Add ('RA_ID',            'SEQ_ZRA_ID.NEXTVAL', False);
            Fields.Add('RA_USUALTA',            Sesion.UserID);
            Fields.Add('RA_FECHAALTA',          exDateTime);
            Fields.Add('RA_CONTRATO',           sdqConsulta.FieldByName('CONTRATOEXT').AsInteger);
            Fields.Add('RA_PERIODO',            sdqConsulta.FieldByName('RC_PERIODO').AsString);
            Fields.Add('RA_CONCEPTO',           sConcepto);

            ExtraCondition := '';
          end
        else
          begin
            SqlType := stUpdate;

            PrimaryKey.Add('RA_ID',             sdqConsulta.FieldByName('RA_ID').AsInteger, False);
            Fields.Add('RA_USUMODIF',           Sesion.UserID);
            Fields.Add('RA_FECHAMODIF',         exDateTime);
            Fields.Add('RA_USUBAJA',            exNull);
            Fields.Add('RA_FECHABAJA',          exNull);

            if edRA_FECHARECEPCION.IsEmpty then
              Fields.Add('RA_FECHARECEPCION',   exNull)
            else
              Fields.Add('RA_FECHARECEPCION',   edRA_FECHARECEPCION.Date);

            if edRA_FECHARECEPCIONRESPUESTAAFIP.IsEmpty then
              Fields.Add('RA_FECHARECEPCIONRESPUESTAAFIP', exNull)
            else
              Fields.Add('RA_FECHARECEPCIONRESPUESTAAFIP', edRA_FECHARECEPCIONRESPUESTAAFIP.Date);
          end;

      maBaja:
        begin
          SqlType := stUpdate;

          PrimaryKey.Add('RA_ID',               sdqConsulta.FieldByName('RA_ID').AsInteger, False);
          Fields.Add('RA_USUBAJA',              Sesion.UserID);
          Fields.Add('RA_FECHABAJA',            exDateTime);

          ExtraCondition := '';
        end;
    end;

    if ModoABM <> maBaja then
      begin
        Fields.Add('RA_RESPUESTA',              edRA_RESPUESTA.Lines.Text);
        Fields.Add('RA_OBSERVACIONES',          edRA_OBSERVACIONES.Lines.Text);
        Fields.Add('RA_RESPUESTAAFIP',          fraRespuestaAFIP.Value);
        Fields.Add('RA_IMPORTE',                edRA_IMPORTE.Value);
        Fields.Add('RA_FECHAPAGO',              edRA_FECHAPAGO.Date);
        Fields.Add('RA_CUITINCORRECTO',         edRA_CUITIncorrecto.Text);
        Fields.Add('RA_PERIODOINCORRECTO',      edRA_PERIODOIncorrecto.Periodo.Valor);
        Fields.Add('RA_IMPUESTOCORRECTO',       edRA_ImpuestoCorrecto.Text);
        Fields.Add('RA_IMPUESTOINCORRECTO',     edRA_ImpuestoIncorrecto.Text);
        Fields.Add('RA_ESTADO',                 fraEstado.Value);
      end;

    Result := inherited DoABM;
  end;

  do_devengadocontrato(sdqConsulta.FieldByName('CONTRATOEXT').AsInteger, sdqConsulta.FieldByName('RC_PERIODO').AsString);

  if (Result) and (ModoABM in [maAlta, maModificacion]) then
    begin
      sSql :=
        'SELECT TB_ESPECIAL1' +
        '  FROM CTB_TABLAS' +
        ' WHERE TB_CLAVE = :Clave' +
        '   AND TB_CODIGO = :Codigo';

      if ValorSqlEx(sSql, ['RAFIP', fraRespuestaAFIP.Codigo]) = 'N' then
        Do_LimpiarImporteReclamado(sdqConsulta.FieldByName('CONTRATOEXT').AsInteger, sdqConsulta.FieldByName('RC_PERIODO').AsString);

      if not edRA_FECHARECEPCION.IsEmpty then
        begin
          // Se graba la fecha de recepción a todos los reclamo que se enviaron en la misma carta..
          sSql := Format(
            'UPDATE ZRA_RECLAMOAFIP ' +
            '   SET RA_FECHARECEPCION = %s ' +
            ' WHERE RA_GRUPOIMPRESION = %s',
            [
              SqlValue(edRA_FECHARECEPCION.Date),
              SqlValue(sdqConsulta.FieldByName('RA_GRUPOIMPRESION').AsString)
            ]);

          EjecutarSql(sSql);
        end;

      if checkCopiarAlGrupo.Checked then
        begin
          // Se graba la fecha de respuesta, la respuesta y el detalle a todos los reclamo que se enviaron en la misma carta..
          sSet := '';

          if not edRA_FECHARECEPCIONRESPUESTAAFIP.IsEmpty then
            sSet := 'RA_FECHARECEPCIONRESPUESTAAFIP = ' + SqlValue(edRA_FECHARECEPCIONRESPUESTAAFIP.Date) + ',';

          if not fraRespuestaAFIP.IsEmpty then
            sSet := sSet + 'RA_RESPUESTAAFIP = ' + SqlValue(fraRespuestaAFIP.Value) + ',';

          if edRA_RESPUESTA.Text <> '' then
            sSet := sSet + 'RA_RESPUESTA = ' + SqlValue(edRA_RESPUESTA.Text) + ',';

          Delete(sSet, Length(sSet), 1);

          if sSet <> '' then
            begin
              sSql := 'UPDATE ZRA_RECLAMOAFIP ' +
                      '   SET ' + sSet +
                      ' WHERE RA_GRUPOIMPRESION = ' + SqlValue(sdqConsulta.FieldByName('RA_GRUPOIMPRESION').AsString);

              EjecutarSql(sSql);
            end;
        end;

      if ModoABM = maAlta then
        begin
          sSql := 'COBRANZA.DO_AJUSTARSDOACREEDORRECLAFIP(:Contrato, :Periodo, :ImporteRecl, :Usuario);';
          EjecutarStoreEx(sSql, [sdqConsulta.FieldByName('CONTRATOEXT').AsInteger, sdqConsulta.FieldByName('RC_PERIODO').AsString, edRA_IMPORTE.Value, Sesion.UserID]);
        end;
    end;
end;

procedure TfrmReclamoAFIP.LoadControls;
var
  iIndice: Integer;
begin
  with sdqConsulta do
    begin
      frafpEmpresa.ContratoExt   := FieldByName('CONTRATOEXT').AsInteger;
      edRA_PERIODO.Periodo.Valor := FieldByName('RC_PERIODO').AsString;

      if FieldByName('RA_IMPORTE').AsFloat <> 0 then
        edRA_IMPORTE.Value := FieldByName('RA_IMPORTE').AsFloat
      else
        edRA_IMPORTE.Value := FieldByName('DEUDA_NOMINAL').AsFloat;

      edRA_FECHAPAGO.Date                  := FieldByName('RA_FECHAPAGO').AsDateTime;
      edRA_CUITIncorrecto.Text             := FieldByName('RA_CUITINCORRECTO').AsString;
      edRA_PERIODOIncorrecto.Periodo.Valor := FieldByName('RA_PERIODOIncorrecto').AsString;
      edRA_ImpuestoCorrecto.Text           := FieldByName('RA_ImpuestoCorrecto').AsString;
      edRA_ImpuestoIncorrecto.Text         := FieldByName('RA_ImpuestoInCorrecto').AsString;

      edRA_FECHARECEPCION.Date             := FieldByName('RA_FECHARECEPCION').AsDateTime;
      edRA_FECHARECEPCIONRESPUESTAAFIP.Date:= FieldByName('RA_FECHARECEPCIONRESPUESTAAFIP').AsDateTime;
      edRA_RESPUESTA.Lines.Text            := FieldByName('RA_RESPUESTA').AsString;
      edRA_OBSERVACIONES.Lines.Text        := FieldByName('RA_OBSERVACIONES').AsString;
      fraRespuestaAFIP.Value               := FieldByName('RA_RESPUESTAAFIP').AsString;
      fraEstado.Value                      := FieldByName('RA_ESTADO').AsString;

      if FieldByName('RA_CONCEPTO').AsString = 'C' then  // Cuota
        iIndice := 0
      else if FieldByName('RA_CONCEPTO').AsString = 'I' then  // Interés
        iIndice := 1
      else
        iIndice := -1;

      rgConcepto.ItemIndex                 := iIndice;
    end;
end;

function TfrmReclamoAFIP.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(frafpEmpresa.IsEmpty, frafpEmpresa.edContrato, 'Debe seleccionar una empresa.');
  Verificar(edRA_IMPORTE.Value = 0, edRA_IMPORTE, 'Debe seleccionar un importe.');
  Verificar(not Is_FechaValida(edRA_FECHAPAGO.Text), edRA_FECHAPAGO, 'Debe seleccionar una fecha de pago.');

  if edRA_PERIODOIncorrecto.Periodo.Valor <> '' then
    begin
      sSql := 'SELECT 1 ' +
                'FROM ZRC_RESUMENCOBRANZA_EXT ' +
               'WHERE RC_CONTRATO = :Contrato ' +
                 'AND RC_PERIODO = :Periodo';

      if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('CONTRATOEXT').AsInteger, edRA_PERIODOIncorrecto.Periodo.Valor]) then
        Result := True
      else
        Result := (MsgBox('El ''Periodo Incorrecto'' no es válido para este contrato y régimen. ¿Desea continuar?', MB_YESNO) = mrYes);
    end
  else
    Result := True;
end;

procedure TfrmReclamoAFIP.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaConsulta.Clear;
  edRC_PERIODODesde.Clear;
  edRC_PERIODOHasta.Clear;
  chkSaldoDeudor.Checked        := True;
  chkReclamo.Checked            := False;
  chkSoloActivas.Checked        := True;
  chkNotasPendImpresion.Checked := False;
  dcbFechaImpresionDesde.Clear;
  dcbFechaImpresionHasta.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
end;

procedure TfrmReclamoAFIP.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmReclamoAFIP.CalcTotales;
Var
  PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active Then
      begin
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalLiquidacion );
      end;
    Except
      on E: Exception do ErrorMsg(E, 'Error al calcular los subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmReclamoAFIP.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := '$ ' + ToStr(TotalLiquidacion[iPos]);
end;

procedure TfrmReclamoAFIP.tbNuevoClick(Sender: TObject);
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, nil, 'Debe seleccionar un contrato y un período determinado.');

      inherited;
    end;
end;

procedure TfrmReclamoAFIP.fpAbmEnter(Sender: TObject);
var
  bHatilitar: Boolean;
begin
  inherited;
  with sdqConsulta do
    begin
      frafpEmpresa.ContratoExt   := FieldByName('CONTRATOEXT').AsInteger;
      edRA_PERIODO.Periodo.Valor := FieldByName('RC_PERIODO').AsString;
    end;

  case ModoABM of
    maAlta:
      begin
        VCLExtra.LockControls([frafpEmpresa, edRA_PERIODO, edRA_FECHARECEPCION, edRA_FECHARECEPCIONRESPUESTAAFIP,
                                edRA_RESPUESTA, fraRespuestaAFIP, fraEstado, edRA_OBSERVACIONES], True);
        rgConcepto.Enabled := True;
        VCLExtra.LockControls([edRA_IMPORTE, edRA_FECHAPAGO, {edRA_FECHARECEPCIONPAGO, }edRA_CUITIncorrecto,
                               edRA_PERIODOIncorrecto, edRA_ImpuestoCorrecto, edRA_ImpuestoInCorrecto], False);
        edRA_IMPORTE.Value := sdqConsulta.FieldByName('DEUDA_NOMINAL').AsFloat;
      end;

    maModificacion:
      begin
        VCLExtra.LockControls([rgConcepto], True);

        bHatilitar := sdqConsulta.FieldByName('RA_FECHAIMPRESION').IsNull;
        VCLExtra.LockControls([edRA_IMPORTE, edRA_FECHAPAGO, edRA_CUITIncorrecto,
                               edRA_PERIODOIncorrecto, edRA_ImpuestoCorrecto, edRA_ImpuestoInCorrecto], not bHatilitar);

        VCLExtra.LockControls([edRA_FECHARECEPCION, edRA_FECHARECEPCIONRESPUESTAAFIP, edRA_RESPUESTA, fraRespuestaAFIP,
                               fraEstado, edRA_OBSERVACIONES], False);
      end;
  end;

  case ModoABM of
    maAlta, maModificacion:
      if not edRA_IMPORTE.ReadOnly then
        edRA_IMPORTE.SetFocus
      else if not edRA_FECHARECEPCIONRESPUESTAAFIP.ReadOnly then
        edRA_FECHARECEPCIONRESPUESTAAFIP.SetFocus;
  end;
end;

procedure TfrmReclamoAFIP.tbModificarClick(Sender: TObject);
begin
  with sdqConsulta do
  begin
    Verificar(not Active or IsEmpty, nil, 'Debe seleccionar un contrato y un período determinado.');
    Verificar(FieldByName('RA_FECHABAJA').AsDateTime > 0, nil, 'El registro ha sido dado de baja.');

    if FieldByName('RA_ID').IsNull then
      begin
        InfoHint(nil, 'El contrato seleccionado no posee reclamos.'+#13+'Iniciando alta de reclamo...');
        inherited tbNuevoClick(Sender);
      end
    else
      inherited;
  end;
end;

procedure TfrmReclamoAFIP.mnuCartaAFIPClick(Sender: TObject);
var
  Contrato: Integer;
  bEsReimpresion, bRefrescar, bHayPositivos, bHayNegativos: Boolean;
  GrupoImpresion: String;
begin
  inherited;

  bRefrescar     := False;
  Contrato       := sdqConsulta.FieldByName('CONTRATOEXT').AsInteger;
  bEsReimpresion := not sdqConsulta.FieldByName('RA_FECHAIMPRESION').IsNull;
  GrupoImpresion := sdqConsulta.FieldByName('RA_GRUPOIMPRESION').AsString;

  Get_TipoCartaAFIP(Contrato, bHayPositivos, bHayNegativos, bEsReimpresion, GrupoImpresion);

  if bHayPositivos then
    begin
      rptCartaAFIP := TrptCartaAFIP.Create(Self);
      with rptCartaAFIP do
        try
          bRefrescar := Preparar(Contrato, True, bEsReimpresion, GrupoImpresion);
        finally
          Free;
        end;
    end;

  if bHayNegativos then
    begin
      rptCartaAFIP := TrptCartaAFIP.Create(Self);
      with rptCartaAFIP do
        try
          bRefrescar := Preparar(Contrato, False, bEsReimpresion, GrupoImpresion) or bRefrescar;
        finally
          Free;
        end;
    end;

  if bRefrescar then
    tbRefrescarClick(nil);
end;

procedure TfrmReclamoAFIP.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmReclamoAFIP.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmReclamoAFIP.Get_TipoCartaAFIP(Contrato: Integer; var HayPositivos, HayNegativos, EsReimpresion: Boolean; GrupoImpresion: String);
var
  sSql1, sSql: String;
begin
  sSql1 := 'SELECT 1 ' +
            'FROM ZRA_RECLAMOAFIP ' +
           'WHERE RA_CONTRATO = :Contrato ' +
             'AND RA_FECHABAJA IS NULL ' +
             iif(EsReimpresion, 'AND RA_GRUPOIMPRESION = ' + SqlValue(GrupoImpresion), 'AND RA_FECHAIMPRESION IS NULL') + ' ';

  sSql := sSql1+
             'AND RA_IMPORTE>0';
  HayPositivos := ExisteSqlEx( sSql, [Contrato] );

  sSql := sSql1+
             'AND RA_IMPORTE<0';
  HayNegativos := ExisteSqlEx( sSql, [Contrato] );
end;

end.

