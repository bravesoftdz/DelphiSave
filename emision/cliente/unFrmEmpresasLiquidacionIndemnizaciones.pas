unit unfrmEmpresasLiquidacionIndemnizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  ToolEdit, CurrEdit, Periodos;

type
  TfrmEmpresasLiquidacionIndemnizaciones = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaIndem: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    lblCuitFiltro: TLabel;
    lblTipo: TLabel;
    cbTipoAnulacion: TExComboBox;
    cbAplicar: TExComboBox;
    Label3: TLabel;
    gbImporteFijoMensual: TGroupBox;
    lblCuota: TLabel;
    edCuotaFijo: TCurrencyEdit;
    lblFondo: TLabel;
    edFondoFijo: TCurrencyEdit;
    cbDebeExistirAnul: TCheckBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cbTipoAnulacionChange(Sender: TObject);
    procedure cbAplicarChange(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FPeriodoDesdeAnt: String;
    FPeriodoHastaAnt: String;
  public
    { Public declarations }
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmEmpresasLiquidacionIndemnizaciones: TfrmEmpresasLiquidacionIndemnizaciones;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasLiquidacionIndemnizaciones.ClearControls;
begin
  fraEmpresaIndem.Clear;
  fraEmpresaIndem.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  cbTipoAnulacion.ItemIndex := 0;
  cbAplicar.ItemIndex := 0;
  edCuotaFijo.Value := 0;
  edFondoFijo.Value := 0;
  cbDebeExistirAnul.Checked := False;
  FPeriodoDesdeAnt:= '';
  FPeriodoHastaAnt:= '';
  cbTipoAnulacionChange(nil);
  cbAplicarChange(nil);
end;

function TfrmEmpresasLiquidacionIndemnizaciones.DoABM: Boolean;
var
  sPeriodo, sPeriodoHasta, sUltPeriodoExigible: string;
  acontrato: integer;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('EL_ID', sdqConsulta.FieldByName('EL_ID').AsInteger );
      Sql.Fields.Add('EL_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EL_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EL_IDEMPRESA',fraEmpresaIndem.Value);
      Sql.Fields.Add('EL_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EL_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('EL_TIPOANULACION', cbTipoAnulacion.Value );
      Sql.Fields.Add('EL_APLICA', cbAplicar.Value );

      if edCuotaFijo.Enabled then
        Sql.Fields.AddExtended('EL_FIJOCUOTA', edCuotaFijo.Value )
      else
        Sql.Fields.Add('EL_FIJOCUOTA', exNull );

      if edFondoFijo.Enabled then
        Sql.Fields.AddExtended('EL_FIJOFONDO', edFondoFijo.Value )
      else
        Sql.Fields.Add('EL_FIJOFONDO', exNull );

      Sql.Fields.Add ('EL_ANULACIONANT', String(iif(cbDebeExistirAnul.Checked, 'S', 'N')));

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EL_ID', GetSecNextVal('EMI.SEQ_IEL_ID'));
        Sql.Fields.Add('EL_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EL_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EL_ID', sdqConsulta.FieldByName('EL_ID').AsInteger);
        Sql.Fields.Add('EL_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EL_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EL_USUBAJA', exNull);
        Sql.Fields.Add('EL_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );


    if ModoABM <> maBaja then
    begin

      if (FPeriodoDesdeAnt <> '') and (FPeriodoDesdeAnt < edPeriodoDesde.Periodo.Valor) then
        sPeriodo := PrevPeriodo(FPeriodoDesdeAnt)
      else
        sPeriodo := PrevPeriodo(edPeriodoDesde.Periodo.Valor);

      with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                 ' FROM afi.aco_contrato ' +
                 ' WHERE co_contrato = :contrato', [fraEmpresaIndem.Contrato]) do
      try
         sUltPeriodoExigible := get_ultimoperiodoexigible(fraEmpresaIndem.Contrato, Fields[0].AsDateTime, Fields[1].AsDateTime);
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
        acontrato := get_contratovigente(fraEmpresaIndem.CUIT, sPeriodo);
        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'emi.emision.do_devengadocontrato(' + SqlValue(acontrato)  + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');
        sPeriodo := NextPeriodo(sPeriodo);
      end;
    end
    else begin

      with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                 ' FROM afi.aco_contrato ' +
                 ' WHERE co_contrato = :contrato', [sdqConsulta.fieldbyname('co_contrato').AsInteger]) do
      try
         sUltPeriodoExigible := get_ultimoperiodoexigible(sdqConsulta.fieldbyname('co_contrato').AsInteger, Fields[0].AsDateTime, Fields[1].AsDateTime);
      finally
       free;
      end;

      sPeriodoHasta := iif(sUltPeriodoExigible < sdqConsulta.fieldbyname('EL_periodovigenciahasta').AsString, sUltPeriodoExigible, sdqConsulta.fieldbyname('EL_periodovigenciahasta').AsString);
      sPeriodo := PrevPeriodo(sdqConsulta.fieldbyname('EL_periodovigenciadesde').AsString);

      while (sPeriodo <= sPeriodoHasta) do
      begin
        acontrato := get_contratovigente(sdqConsulta.fieldbyname('em_cuit').AsString, sPeriodo);
        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'emi.emision.do_devengadocontrato(' + SqlValue(acontrato)  + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');
        sPeriodo := NextPeriodo(sPeriodo);
      end;
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

procedure TfrmEmpresasLiquidacionIndemnizaciones.LoadControls;
begin
  fraEmpresaIndem.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('EL_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('EL_PERIODOVIGENCIAHASTA').AsString;

  FPeriodoDesdeAnt:= edPeriodoDesde.Periodo.Valor;
  FPeriodoHastaAnt:= edPeriodoHasta.Periodo.Valor;

  cbTipoAnulacion.Value := sdqConsulta.FieldByName('EL_TIPOANULACION').AsString;
  cbAplicar.Value := sdqConsulta.FieldByName('EL_APLICA').AsString;
  edCuotaFijo.Value := sdqConsulta.FieldByName('EL_FIJOCUOTA').AsFloat;
  edFondoFijo.Value := sdqConsulta.FieldByName('EL_FIJOFONDO').AsFloat;
  cbDebeExistirAnul.Checked := (sdqConsulta.FieldByName('EL_ANULACIONANT').AsString = 'S');
  fraEmpresaIndem.Locked := true;
  cbTipoAnulacionChange(nil);
  cbAplicarChange(nil);
end;

function TfrmEmpresasLiquidacionIndemnizaciones.Validar: Boolean;
begin
  VerificarMultiple(['Administración de empresas con liquidacion de indemnizaciones',
                    fraEmpresaIndem, fraEmpresaIndem.IsSelected, 'Debe especificar una empresa',
                    edCuotaFijo, (not edCuotaFijo.Enabled) or  (edCuotaFijo.Value > 0), 'Debe especificar el importe de cuota fijo',
                    edFondoFijo, (not edFondoFijo.Enabled) or (edFondoFijo.Value > 0), 'Debe especificar el importe de fondo fijo',
                    edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                    edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                    btnAceptar, ValidaSolapamiento, 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                  ]);

  result := MsgBox( 'Estas modificaciones implican redevengar. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = IDYES;
end;

function TfrmEmpresasLiquidacionIndemnizaciones.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IEL_EMPRESALIQINDEMNIZACION , AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN EL_PERIODOVIGENCIADESDE AND NVL(EL_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EL_PERIODOVIGENCIADESDE AND NVL(EL_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EL_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EL_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EL_IDEMPRESA ' +
                        '    AND EL_FECHABAJA IS NULL ' +
                        '    AND EL_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND EL_id <> ' + SqlValue(sdqConsulta.FieldByName('EL_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaIndem.Value]
                         );
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaIndem.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaIndem.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;
    fraEmpresaIndem.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EL_FECHABAJA';
  Sql.TableName := 'EMI.IEL_EMPRESALIQINDEMNIZACION';

  fraEmpresaIndem.ShowBajas:= True;
  fraEmpresaIndem.UltContrato := True;

  fraEmpresaFiltro.ShowBajas:= True;
  fraEmpresaFiltro.UltContrato := True;
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT iea.EL_id, aco.co_contrato, iea.EL_periodovigenciahasta, iea.EL_periodovigenciadesde, iea.EL_fechaalta, iea.EL_usualta, ' +
                      '      iea.EL_fechabaja, iea.EL_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre, EL_tipoanulacion, ' +
                      '      DECODE(EL_tipoanulacion, ''F'', ''Fija'', ''V'', ''Variable'', '''') descanul, EL_aplica, ' +
                      '      DECODE(EL_aplica, ''C'', ''Cuota Solamente'', ''A'', ''Cuota y Fondo'', '''') descaplica, EL_fijocuota, EL_fijofondo, ' +
                      '      EL_anulacionant ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.iel_empresaliqindemnizacion iea ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = iea.EL_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND EL_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));

  inherited;
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.cbTipoAnulacionChange(Sender: TObject);
begin
  inherited;
  edCuotaFijo.Enabled := (cbTipoAnulacion.Value = 'F');
  edFondoFijo.Enabled := (cbTipoAnulacion.Value = 'F') and (cbAplicar.Value = 'A');
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.cbAplicarChange(Sender: TObject);
begin
  inherited;
  edFondoFijo.Enabled := (cbTipoAnulacion.Value = 'F') and (cbAplicar.Value = 'A');
end;

procedure TfrmEmpresasLiquidacionIndemnizaciones.tbEliminarClick(Sender: TObject);
begin

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox( 'Estas modificaciones implican redevengar.¿Desea continuar?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = IDYES) then
    inherited
  else
    Exit;

end;

end.


