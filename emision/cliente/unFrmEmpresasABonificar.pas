unit unfrmEmpresasABonificar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  ToolEdit, CurrEdit, Periodos, DateComboBox, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TfrmEmpresasABonificar = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaABonificar: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    lblTipo: TLabel;
    cbTipoBonificacion: TExComboBox;
    cbAplicar: TExComboBox;
    Label3: TLabel;
    gbImporteFijoMensual: TGroupBox;
    lblCuota: TLabel;
    edCuotaFijo: TCurrencyEdit;
    lblFondo: TLabel;
    edFondoFijo: TCurrencyEdit;
    cbDebeExistirBonif: TCheckBox;
    edObservaciones: TMemo;
    Label1: TLabel;
    lblPorcentaje: TLabel;
    edPorcentaje: TCurrencyEdit;
    ShortCutControl1: TShortCutControl;
    gbFechaAlta: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edFAltaDesdeFiltro: TDateComboBox;
    edFAltaHastaFiltro: TDateComboBox;
    GroupBox1: TGroupBox;
    lblCuitFiltro: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cbTipoBonificacionChange(Sender: TObject);
    procedure cbAplicarChange(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    FPeriodoDesdeAnt: String;
    FPeriodoHastaAnt: String;
  public
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmEmpresasABonificar: TfrmEmpresasABonificar;

implementation

uses
  unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta, unArt;

{$R *.dfm}

procedure TfrmEmpresasABonificar.ClearControls;
begin
  fraEmpresaABonificar.Clear;
  fraEmpresaABonificar.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  cbTipoBonificacion.ItemIndex := 0;
  cbAplicar.ItemIndex := 0;
  edCuotaFijo.Value   := 0;
  edFondoFijo.Value   := 0;
  cbDebeExistirBonif.Checked := False;
  FPeriodoDesdeAnt := '';
  FPeriodoHastaAnt := '';
  edObservaciones.Clear;
  cbTipoBonificacionChange(nil);
  cbAplicarChange(nil);
end;

function TfrmEmpresasABonificar.DoABM: Boolean;
var
  sPeriodo, sUltPeriodoExigible, sPeriodoHasta, sSql: string;
  IdIEB: TTableId;
  acontrato: Integer;
begin
 try
    Result := true;
    IdIEB  := ART_EMPTY_ID;

    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('EB_ID', sdqConsulta.FieldByName('EB_ID').AsInteger );
      Sql.Fields.Add('EB_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EB_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EB_IDEMPRESA',fraEmpresaABonificar.Value);
      Sql.Fields.Add('EB_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EB_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('EB_TIPOBONIFICACION', cbTipoBonificacion.Value );
      Sql.Fields.Add('EB_APLICA', cbAplicar.Value );
      Sql.Fields.Add('EB_OBSERVACIONES', edObservaciones.Lines.Text );
      Sql.Fields.Add('EB_IDTIPOREGIMEN', fraEmpresaABonificar.IdRegimen);

      if edCuotaFijo.Enabled then
        Sql.Fields.AddExtended('EB_FIJOCUOTA', edCuotaFijo.Value )
      else
        Sql.Fields.Add('EB_FIJOCUOTA', exNull );

      if edFondoFijo.Enabled then
        Sql.Fields.AddExtended('EB_FIJOFONDO', edFondoFijo.Value )
      else
        Sql.Fields.Add('EB_FIJOFONDO', exNull );

      if edPorcentaje.Enabled then
        Sql.Fields.AddExtended('EB_PORCENTAJE', edPorcentaje.Value )
      else
        Sql.Fields.Add('EB_PORCENTAJE', exNull );

      Sql.Fields.Add ('EB_BONIFICACIONANT', String(iif(cbDebeExistirBonif.Checked, 'S', 'N')));

      if ModoABM = maAlta Then
      begin
        IdIEB := GetSecNextVal('EMI.SEQ_IEB_ID');

        Sql.PrimaryKey.Add('EB_ID', IdIEB);
        Sql.Fields.Add('EB_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EB_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EB_ID', sdqConsulta.FieldByName('EB_ID').AsInteger);
        Sql.Fields.Add('EB_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EB_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EB_USUBAJA', exNull);
        Sql.Fields.Add('EB_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );

    if ModoABM <> maBaja then
    (*begin
      if (FPeriodoDesdeAnt <> '') and (FPeriodoDesdeAnt < edPeriodoDesde.Periodo.Valor) then
        sPeriodo := PrevPeriodo(FPeriodoDesdeAnt)
      else
        sPeriodo := PrevPeriodo(edPeriodoDesde.Periodo.Valor);

      with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                        ' FROM afi.aco_contrato ' +
                       ' WHERE co_contrato = :contrato', [fraEmpresaABonificar.Contrato]) do
      try
        sUltPeriodoExigible := get_ultimoperiodoexigible(fraEmpresaABonificar.Contrato, Fields[0].AsDateTime, Fields[1].AsDateTime);
      finally
        free;
      end;

      if edPeriodoHasta.Periodo.IsNull then
        sPeriodoHasta := sUltPeriodoExigible
      else
      begin
        if (FPeriodoHastaAnt < edPeriodoHasta.Periodo.Valor) then
          sPeriodoHasta := iif(sUltPeriodoExigible < edPeriodoHasta.Periodo.Valor, sUltPeriodoExigible, edPeriodoHasta.Periodo.Valor)
        else
          sPeriodoHasta := iif(sUltPeriodoExigible < FPeriodoHastaAnt, sUltPeriodoExigible, FPeriodoHastaAnt);
      end;

      while (sPeriodo <= sPeriodoHasta) do
      begin
        acontrato := get_contratovigente(fraEmpresaABonificar.CUIT, sPeriodo);
        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'emi.emision.do_devengadocontrato(' + SqlValue(acontrato)  + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');
        sPeriodo := NextPeriodo(sPeriodo);
      end;
    end*)
    else begin
      with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                        ' FROM afi.aco_contrato ' +
                       ' WHERE co_contrato = :contrato', [sdqConsulta.fieldbyname('co_contrato').AsInteger]) do
      try
        sUltPeriodoExigible := get_ultimoperiodoexigible(sdqConsulta.fieldbyname('co_contrato').AsInteger, Fields[0].AsDateTime, Fields[1].AsDateTime);
      finally
        free;
      end;

      sPeriodoHasta := Iif(sUltPeriodoExigible < sdqConsulta.fieldbyname('eb_periodovigenciahasta').AsString, sUltPeriodoExigible, sdqConsulta.fieldbyname('eb_periodovigenciahasta').AsString);
      sPeriodo      := PrevPeriodo(sdqConsulta.fieldbyname('eb_periodovigenciadesde').AsString);

      while sPeriodo <= sPeriodoHasta do
      begin
        acontrato := get_contratovigente(sdqConsulta.fieldbyname('em_cuit').AsString, sPeriodo);

        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'EMI.EMISION.DO_DEVENGADOCONTRATO(' + SqlValue(acontrato) + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');

        sPeriodo := NextPeriodo(sPeriodo);
      end;
    end;

    if ModoABM = maAlta Then
      begin
        sSql := 'DEUDA.DO_ENVIOBONIFICACION(:IdBonif, :User);';
        EjecutarStoreSTEx(sSql, [IdIEB, Sesion.UserId]);
      end;

    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
end;

procedure TfrmEmpresasABonificar.LoadControls;
begin
  fraEmpresaABonificar.ContratoExt := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor  := sdqConsulta.FieldByName('EB_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor  := sdqConsulta.FieldByName('EB_PERIODOVIGENCIAHASTA').AsString;
  edObservaciones.Lines.Text    := sdqConsulta.FieldByName('EB_OBSERVACIONES').AsString;

  FPeriodoDesdeAnt:= edPeriodoDesde.Periodo.Valor;
  FPeriodoHastaAnt:= edPeriodoHasta.Periodo.Valor;

  cbTipoBonificacion.Value   := sdqConsulta.FieldByName('EB_TIPOBONIFICACION').AsString;
  cbAplicar.Value            := sdqConsulta.FieldByName('EB_APLICA').AsString;
  edCuotaFijo.Value          := sdqConsulta.FieldByName('EB_FIJOCUOTA').AsFloat;
  edFondoFijo.Value          := sdqConsulta.FieldByName('EB_FIJOFONDO').AsFloat;
  cbDebeExistirBonif.Checked := (sdqConsulta.FieldByName('EB_BONIFICACIONANT').AsString = 'S');
  fraEmpresaABonificar.Locked := true;

  cbTipoBonificacionChange(nil);
  cbAplicarChange(nil);
end;

function TfrmEmpresasABonificar.Validar: Boolean;
begin
  VerificarMultiple(['Administración de empresas a bonificar',
                    fraEmpresaABonificar, fraEmpresaABonificar.IsSelected, 'Debe especificar una empresa',
                    edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                    edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                    btnAceptar, ValidaSolapamiento, 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                  ]);

  result := MsgBox( 'Se enviará un mail al responsable para su aprobación. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = IDYES;
end;

function TfrmEmpresasABonificar.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IEB_EMPRESABONIFICACION IEB, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd BETWEEN EB_PERIODOVIGENCIADESDE AND NVL(EB_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EB_PERIODOVIGENCIADESDE AND NVL(EB_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EB_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EB_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EB_IDEMPRESA ' +
                        '    AND EB_FECHABAJA IS NULL ' +
                        '    AND EB_IDEMPRESA = :idemp ' +
                        '    AND EB_IDTIPOREGIMEN = ' + SqlValue(fraEmpresaABonificar.IdRegimen)
                        + iif(ModoABM = maModificacion, ' AND eb_id <> ' + SqlValue(sdqConsulta.FieldByName('EB_ID').AsInteger), ''),
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor,
                         edPeriodoHasta.Periodo.Valor, fraEmpresaABonificar.Value]);
end;

procedure TfrmEmpresasABonificar.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaABonificar.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaABonificar.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;
    fraEmpresaABonificar.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasABonificar.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja     := 'EB_FECHABAJA';
  Sql.TableName := 'EMI.IEB_EMPRESABONIFICACION';

  with fraEmpresaABonificar do
    begin
      ShowBajas   := True;
      UltContrato := True;
      VerTodosRegimenes := True;
    end;

  with fraEmpresaFiltro do
    begin
      ShowBajas   := True;
      UltContrato := True;
      VerTodosRegimenes := True;
    end;
end;

procedure TfrmEmpresasABonificar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasABonificar.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSql := 'SELECT IEB.EB_ID, CO_CONTRATOPRINCIPAL, ACO.CO_CONTRATO, IEB.EB_PERIODOVIGENCIAHASTA, IEB.EB_PERIODOVIGENCIADESDE, TRUNC(IEB.EB_FECHAALTA) FECHAALTA, IEB.EB_USUALTA, ' +
                 'IEB.EB_FECHABAJA, IEB.EB_USUBAJA, ACO.CO_IDEMPRESA, AEM.EM_ID, AEM.EM_CUIT, AEM.EM_NOMBRE, EB_TIPOBONIFICACION, ' +
                 'DECODE(EB_TIPOBONIFICACION, ''F'', ''Fija'', ''V'', ''Variable'', ''P'', ''Porcentual'', '''') DESCBONIF, EB_APLICA, ' +
                 'DECODE(EB_APLICA, ''C'', ''Cuota Solamente'', ''A'', ''Cuota y Fondo'', '''') DESCAPLICA, EB_FIJOCUOTA, EB_FIJOFONDO, ' +
                 'IEB.EB_BONIFICACIONANT, IEB.EB_OBSERVACIONES, TRUNC(IEB.EB_FECHAAUTORIZA) FECHAAUTORIZA, EB_PORCENTAJE, ' +
                 'DECODE(EB_MOTIVO, ''CC'', ''Comercial  por Canal'', '''') MOTIVO, IEB.EB_USUAUTORIZA USUAUTORIZA, TR_DESCRIPCION REGIMEN ' +
            'FROM AFI.ATR_TIPOREGIMEN, AFI.AEM_EMPRESA AEM, AFI.ACO_CONTRATO_EXT ACO, EMI.IEB_EMPRESABONIFICACION IEB ' +
           'WHERE AEM.EM_ID = ACO.CO_IDEMPRESA ' +
             'AND AEM.EM_ID = IEB.EB_IDEMPRESA ' +
             '  AND (TR_ID = EB_IDTIPOREGIMEN) ' +
             '  AND (TR_ID = CO_IDTIPOREGIMEN_ORIG) ' +
             'AND CO_CONTRATOPRINCIPAL = ART.AFILIACION.GET_ULTCONTRATO(AEM.EM_CUIT)';

  sSqlWhere := SqlBetweenDateTime(' AND EB_FECHAALTA', edFAltaDesdeFiltro.Date, edFAltaHastaFiltro.Date);

  if fraEmpresaFiltro.IsSelected then
     sSqlWhere := sSqlWhere + ' AND EB_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmEmpresasABonificar.cbTipoBonificacionChange(Sender: TObject);
begin
  inherited;
  edCuotaFijo.Enabled  := (cbTipoBonificacion.Value = 'F');
  edFondoFijo.Enabled  := (cbTipoBonificacion.Value = 'F') and (cbAplicar.Value = 'A');
  edPorcentaje.Enabled := (cbTipoBonificacion.Value = 'P');
  cbAplicar.Enabled    := not (cbTipoBonificacion.Value = 'P');

  if edPorcentaje.Enabled then
    cbAplicar.ItemIndex := 0;
end;

procedure TfrmEmpresasABonificar.cbAplicarChange(Sender: TObject);
begin
  inherited;
  edFondoFijo.Enabled := (cbTipoBonificacion.Value = 'F') and (cbAplicar.Value = 'A');
end;

procedure TfrmEmpresasABonificar.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) then
    inherited;
end;

procedure TfrmEmpresasABonificar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('EB_FIJOCUOTA') is TFloatField then
  	TFloatField(sdqConsulta.FieldByName('EB_FIJOCUOTA')).Currency := True;

  if sdqConsulta.FieldByName('EB_FIJOFONDO') is TFloatField then
  	TFloatField(sdqConsulta.FieldByName('EB_FIJOFONDO')).Currency := True;
end;

procedure TfrmEmpresasABonificar.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('FECHAAUTORIZA').IsNull, nil, 'El registro ya se encuentra autorizado.');
  inherited;
end;

procedure TfrmEmpresasABonificar.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaFiltro.Clear;
  edFAltaDesdeFiltro.Clear;
  edFAltaHastaFiltro.Clear;
end;

end.


