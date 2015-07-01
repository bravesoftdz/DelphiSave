unit unValRecibos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa,
  IntEdit, Mask, ToolEdit, DateComboBox, CheckCombo, DBCheckCombo, Menus, unFraCodigoDescripcion,
  unfraCtbTablas, FormPanel, ComboEditor, PatternEdit, unfraEmpresaDeudora, CurrEdit, unArtDBAwareFrame,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmValRecibos = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Bevel1: TBevel;
    rbEmpNormal: TRadioButton;
    rbEmpDeudora: TRadioButton;
    gbFechaRecibo: TGroupBox;
    Label5: TLabel;
    edFechaReciboDesde: TDateComboBox;
    edFechaReciboHasta: TDateComboBox;
    gbNroRecibo: TGroupBox;
    Label3: TLabel;
    edNroReciboDesde: TIntEdit;
    edNroReciboHasta: TIntEdit;
    gbFechaImpresion: TGroupBox;
    Label1: TLabel;
    edFechaImpresionDesde: TDateComboBox;
    edFechaImpresionHasta: TDateComboBox;
    rgAnulado: TRadioGroup;
    gbMotivoAnulacion: TGroupBox;
    dbcMotivosAnulacion: TDBCheckCombo;
    dsMotivosAnulacion: TDataSource;
    sdqMotivosAnulacion: TSDQuery;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuRecibo: TMenuItem;
    tbAnular: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    fpAnulacion: TFormPanel;
    BevelAbm: TBevel;
    lbMotivo: TLabel;
    lbFecha: TLabel;
    btnRechazoAceptar: TButton;
    btnRechazoCancelar: TButton;
    fraCtbTablasAnulacion: TfraCtbTablas;
    edFechaAnulacion: TDateComboBox;
    edDescripcionAnulacion: TMemo;
    lbDescripcion: TLabel;
    fraEmpresa: TfraEmpresaDeudora;
    gbImporteValor: TGroupBox;
    edImporteValorDesde: TCurrencyEdit;
    Label2: TLabel;
    edImporteValorHasta: TCurrencyEdit;
    mnuReciboImprimir: TMenuItem;
    mnuReciboVisualizar: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF} 
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure opTipoEmpresaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure btnRechazoAceptarClick(Sender: TObject);
    procedure fpAnulacionEnter(Sender: TObject);
    procedure tbAnularClick(Sender: TObject);
    procedure mnuReciboImprimirClick(Sender: TObject);
  private
    function IsDatosValidosAnulacion: Boolean;
    function IsRegistroAnulacionValido: Boolean;
    procedure DoImprimirRecibo(Preview: Boolean);
  public
  end;

var
	frmValRecibos: TfrmValRecibos;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, VclExtra, General, CustomDlgs, sqlFuncs, unqrImpresionRecibo, unArt, DBSql,
  unSesion;

{$R *.DFM}

procedure TfrmValRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmValRecibos := nil;
end;

procedure TfrmValRecibos.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;

  OpenQuery(sdqMotivosAnulacion);
end;

procedure TfrmValRecibos.tbRefrescarClick(Sender: TObject);
var
	sSql, sSqlWhere: String;
begin
  sSql := '';

  sSqlWhere := SqlBetween(' AND RV_FECHA', edFechaReciboDesde.Date, edFechaReciboHasta.Date) +
               SqlBetween(' AND NVL(RV_FECHAREIMP, RV_FECHAIMPRESION)', edFechaImpresionDesde.Date, edFechaImpresionHasta.Date) +
               SqlBetween(' AND RV_NUMERO', edNroReciboDesde.Value, edNroReciboHasta.Value) +
               SqlBetween(' AND COBRANZA.GET_IMPORTEVALORRECIBO(RV_ID)', edImporteValorDesde.Value, edImporteValorHasta.Value);

  if dbcMotivosAnulacion.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND RV_MOTIVOBAJA ' + dbcMotivosAnulacion.InSql;

  case rgAnulado.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND RV_FECHABAJA IS NOT NULL';  // si
    1: sSqlWhere := sSqlWhere + ' AND RV_FECHABAJA IS NULL';      // no
  end;

	case rgAnulado.ItemIndex of
  	0, 2:   // si, todos
    	if fraEmpresa.IsEmpty then
        // recibos anulados
      	sSql :=
        	' SELECT UTILES.ARMAR_CUIT(NVL(EM_CUIT, ED_CUIT)) CUIT, NVL(EM_NOMBRE, ED_NOMBRE) RAZON_SOCIAL,' +
          			 ' TO_CHAR(CO_CONTRATO) CONTRATO, COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRO_DE_RECIBO, RV_FECHA FECHA,' +
                 ' TRUNC(RV_FECHAIMPRESION) FECHA_IMPRESION, TRUNC(RV_FECHAREIMP) FECHA_REIMPRESION,' +
                 ' RV_CANTREIMP CANTIDAD_DE_IMPRESIONES, RV_IMPORTE IMPORTE, TRUNC(RV_FECHABAJA) FECHA_ANULACION,' +
                 ' RV_ID ID_RECIBO, TB_DESCRIPCION MOTIVO_DE_BAJA, RV_DESCBAJA DESCRIPCION,' +
                 ' COBRANZA.GET_IMPORTEVALORRECIBO(RV_ID) IMPORTE_VALOR, TO_NUMBER(NULL) IDEMPDEUDORA' +
          	' FROM ART.CTB_TABLAS, TESO.RRV_RECIBOVALOR, AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, TESO.RED_EMPDEUDORA' +
           ' WHERE TB_CLAVE(+) = ''RBAJA''' +
           	 ' AND TB_CODIGO(+) = RV_MOTIVOBAJA' +
             ' AND RV_FECHABAJA IS NOT NULL' +
             ' AND RV_CONTRATO = CO_CONTRATO(+)' +
             ' AND CO_IDEMPRESA = EM_ID(+)' +
             ' AND RV_IDEMPDEUDORA = ED_ID(+)' +
             			 sSqlWhere;
  end;

  case rgAnulado.ItemIndex of
    1, 2:   // no, todos
    begin
    	if sSql <> '' then
      	sSql := sSql + ' UNION ALL ';

      if fraEmpresa.IsEmpty or rbEmpNormal.Checked Then
      	sSql := sSql + // SQL Cobranzas - recibos activos
        	'SELECT DISTINCT UTILES.ARMAR_CUIT(EM_CUIT) CUIT, EM_NOMBRE RAZON_SOCIAL, TO_CHAR(CO_CONTRATO) CONTRATO,' +
          			' COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRO_DE_RECIBO, RV_FECHA FECHA,' +
                ' TRUNC(RV_FECHAIMPRESION) FECHA_IMPRESION, TRUNC(RV_FECHAREIMP) FECHA_REIMPRESION,' +
                ' RV_CANTREIMP CANTIDAD_DE_IMPRESIONES, RV_IMPORTE IMPORTE, TRUNC(RV_FECHABAJA) FECHA_ANULACION,' +
                ' RV_ID ID_RECIBO, TB_DESCRIPCION MOTIVO_DE_BAJA, RV_DESCBAJA DESCRIPCION,' +
                ' COBRANZA.GET_IMPORTEVALORRECIBO(RV_ID) IMPORTE_VALOR, TO_NUMBER(NULL) IDEMPDEUDORA' +
           ' FROM ART.CTB_TABLAS, AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, COB.ZVA_VALOR, TESO.RRV_RECIBOVALOR' +
          ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
          	' AND CO_IDEMPRESA = EM_ID' +
            ' AND RV_ID = VA_IDRECIBO' +
            ' AND TB_CLAVE(+) = ''RBAJA''' +
            ' AND TB_CODIGO(+) = RV_MOTIVOBAJA' +
            ' AND RV_FECHABAJA IS NULL' +
            IIF(fraEmpresa.IsSelected, ' AND CO_IDEMPRESA = ' + SqlInt(fraEmpresa.Value), '') +
            sSqlWhere +
      ' UNION ALL' +  // Planes de Pagos - recibos activos
      	 ' SELECT DISTINCT UTILES.ARMAR_CUIT(EM_CUIT) CUIT, EM_NOMBRE RAZON_SOCIAL, TO_CHAR(CO_CONTRATO) CONTRATO,' +
         				' COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRO_DE_RECIBO, RV_FECHA FECHA,' +
                ' TRUNC(RV_FECHAIMPRESION) FECHA_IMPRESION, TRUNC(RV_FECHAREIMP) FECHA_REIMPRESION,' +
                ' RV_CANTREIMP CANTIDAD_DE_IMPRESIONES, RV_IMPORTE IMPORTE, TRUNC(RV_FECHABAJA) FECHA_ANULACION,' +
                ' RV_ID ID_RECIBO, TB_DESCRIPCION MOTIVO_DE_BAJA, RV_DESCBAJA DESCRIPCION,' +
                ' COBRANZA.GET_IMPORTEVALORRECIBO(RV_ID) IMPORTE_VALOR, TO_NUMBER(NULL) IDEMPDEUDORA' +
         	 ' FROM ART.CTB_TABLAS, AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, COB.ZPV_PLANVALOR, COB.ZPC_PLANCUOTA,' +
           			' COB.ZPP_PLANPAGO, TESO.RRV_RECIBOVALOR' +
          ' WHERE PV_IDPLANCUOTA = PC_ID' +
          	' AND PC_IDPLANPAGO = PP_ID' +
            ' AND PP_CONTRATO = CO_CONTRATO' +
            ' AND CO_IDEMPRESA = EM_ID' +
            ' AND PV_IDRECIBO = RV_ID' +
            ' AND TB_CLAVE(+) = ''RBAJA''' +
            ' AND TB_CODIGO(+) = RV_MOTIVOBAJA' +
            ' AND RV_FECHABAJA IS NULL' +
            IIF(fraEmpresa.IsSelected, ' AND CO_IDEMPRESA = ' + SqlInt(fraEmpresa.Value), '') +
            sSqlWhere;

			if fraEmpresa.IsEmpty then
      	sSql := sSql + ' UNION ALL ';

      if fraEmpresa.IsEmpty or rbEmpDeudora.Checked then
      	sSql := sSql + // SQL Tesorería - recibos activos
        	' SELECT DISTINCT UTILES.ARMAR_CUIT(ED_CUIT) CUIT, ED_NOMBRE RAZON_SOCIAL, NULL CONTRATO,' +
          			 ' COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRO_DE_RECIBO, RV_FECHA FECHA,' +
                 ' TRUNC(RV_FECHAIMPRESION) FECHA_IMPRESION, TRUNC(RV_FECHAREIMP) FECHA_REIMPRESION,' +
                 ' RV_CANTREIMP CANTIDAD_DE_IMPRESIONES, RV_IMPORTE IMPORTE, TRUNC(RV_FECHABAJA) FECHA_ANULACION,' +
                 ' RV_ID ID_RECIBO, TB_DESCRIPCION MOTIVO_DE_BAJA, RV_DESCBAJA DESCRIPCION,' +
                 ' COBRANZA.GET_IMPORTEVALORRECIBO(RV_ID) IMPORTE_VALOR, ED_ID IDEMPDEUDORA' +
          	' FROM ART.CTB_TABLAS, TESO.RED_EMPDEUDORA, COB.ZVA_VALOR, TESO.RRV_RECIBOVALOR' +
           ' WHERE VA_IDEMPDEUDORA = ED_ID' +
           	 ' AND RV_ID = VA_IDRECIBO' +
             ' AND TB_CLAVE(+) = ''RBAJA''' +
             ' AND TB_CODIGO(+) = RV_MOTIVOBAJA' +
             ' AND RV_FECHABAJA IS NULL' +
             IIF(fraEmpresa.IsSelected, ' AND ED_ID = ' + SqlInt(fraEmpresa.Value), '') +
             sSqlWhere +
          ' UNION ALL ' +
          ' SELECT DISTINCT art.utiles.armar_cuit(ed_cuit) cuit, ed_nombre razon_social, NULL contrato, ' +
          '                 art.cobranza.getnrorecibocompleto(rv_id) nro_de_recibo, rv_fecha fecha, TRUNC(rv_fechaimpresion) fecha_impresion, ' +
          '                 TRUNC(rv_fechareimp) fecha_reimpresion, rv_cantreimp cantidad_de_impresiones, rv_importe importe, ' +
          '                 TRUNC(rv_fechabaja) fecha_anulacion, rv_id id_recibo, tb_descripcion motivo_de_baja, rv_descbaja descripcion, ' +
          '                 art.cobranza.get_importevalorrecibo(rv_id) importe_valor, ed_id idempdeudora ' +
          '            FROM art.ctb_tablas, teso.red_empdeudora, legales.lxv_recuperovalor, cob.zva_valor, teso.rrv_recibovalor ' +
          '          WHERE va_idempdeudora = ed_id ' +
          '             AND rv_id = xv_idrecibo ' +
          '             AND va_id = xv_idvalor ' +
          '             AND tb_clave(+) = ''RBAJA'' ' +
          '             AND tb_codigo(+) = rv_motivobaja ' +
          '             AND rv_fechabaja IS NULL ' +
          '             AND xv_fechabaja IS NULL ' +
             IIF(fraEmpresa.IsSelected, ' AND ED_ID = ' + SqlInt(fraEmpresa.Value), '') +
             sSqlWhere;

		end;
  end;

  if sSql = '' then
    ClearData
  else
  begin
  	sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

    inherited;
  end;
end;

procedure TfrmValRecibos.tbLimpiarClick(Sender: TObject);
begin
  edNroReciboDesde.Clear;
  edNroReciboHasta.Clear;
  edFechaReciboDesde.Clear;
  edFechaReciboHasta.Clear;
  edFechaImpresionDesde.Clear;
  edFechaImpresionHasta.Clear;
  rgAnulado.ItemIndex := 2;  // Todos
  edImporteValorDesde.Clear;
  edImporteValorHasta.Clear;
  dbcMotivosAnulacion.Clear;
  fraEmpresa.Clear;
  rbEmpNormal.Checked := True;

  edNroReciboDesde.SetFocus;

  inherited;
end;

procedure TfrmValRecibos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
  	TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTE_VALOR') is TFloatField then
     TFloatField(sdqConsulta.FieldByName('IMPORTE_VALOR')).Currency := True;
end;

procedure TfrmValRecibos.opTipoEmpresaClick(Sender: TObject);
begin
  fraEmpresa.IsDeudora := not rbEmpNormal.Checked;
end;

procedure TfrmValRecibos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																					 Highlight: Boolean);
begin
  inherited;

  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName('FECHA_ANULACION').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmValRecibos.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
																								 var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;

  // así lo imprime tachado
  if not sdqConsulta.FieldByName('FECHA_ANULACION').IsNull then
    AFont.Style := [fsStrikeOut];
end;

procedure TfrmValRecibos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmValRecibos.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults
end;

{ Impresión del recibo seleccionado }
procedure TfrmValRecibos.DoImprimirRecibo(Preview: Boolean);
var
  IdRecibo: TTableId;
begin
  IdRecibo := sdqConsulta.FieldByName('ID_RECIBO').AsInteger;
  ReImprimirRecibo(IdRecibo, 3, Preview);

  sdqConsulta.Refresh;
end;

{ Determina si el recibo seleccionado en la grilla para ser anulado es o no válido }
function TfrmValRecibos.IsRegistroAnulacionValido: Boolean;
var
  sSql: String;
begin
  if not sdqConsulta.FieldByName( 'FECHA_ANULACION' ).IsNull then
		raise Exception.Create('El recibo seleccionado está anulado.');

  sSql := 'SELECT TESORERIA.GET_FECHACAJAACTIVA(''I'') FROM DUAL';
	if not (sdqConsulta.FieldByName('FECHA').AsString = ValorSql(sSql, '')) then
  	raise Exception.Create('El recibo seleccionado no puede anularse porque no pertenece a la fecha de caja.');

  Result := True;
end;

{ Actualiza el recibo seleccionados con la anulación correspondiente }
procedure TfrmValRecibos.btnRechazoAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if IsDatosValidosAnulacion then
  try
    BeginTrans;

    // actualizo los datos de la anulación en la tabla de recibos
    with TDBSql.Create('RRV_RECIBOVALOR') do
    try
      PrimaryKey.Add( 'RV_ID',      sdqConsulta.FieldByName('ID_RECIBO').AsInteger);
      Fields.Add('RV_MOTIVOBAJA',   fraCtbTablasAnulacion.edCodigo.Text);
      Fields.Add('RV_DESCBAJA',     edDescripcionAnulacion.Text);
      Fields.Add('RV_CONTRATO',     StrToIntDef(sdqConsulta.FieldByName('CONTRATO').AsString, 0), True);  // en realidad, va a haber exactamente un dato no nulo en el contrato o en el id de la empresa deudora
      Fields.Add('RV_IDEMPDEUDORA', sdqConsulta.FieldByName('IDEMPDEUDORA').AsInteger, True);
      Fields.Add('RV_USUBAJA',      Sesion.UserId);
      Fields.Add('RV_FECHABAJA',    exDateTime);

      SqlType := stUpdate;
      ExecuteST; //EjecutarSqlST( Sql );

      // borro la relación entre los valores y el recibo
      sSql := 'UPDATE ZVA_VALOR ' +
                 'SET VA_IDRECIBO = NULL ' +
               'WHERE VA_IDRECIBO = :Idrecibo';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ID_RECIBO').AsInteger]);


      // borro la relación entre los valores del plan y el recibo
      sSql := 'UPDATE ZPV_PLANVALOR ' +
                 'SET PV_IDRECIBO = NULL ' +
               'WHERE PV_IDRECIBO = :Idrecibo';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ID_RECIBO').AsInteger]);

      sSql := 'UPDATE LXV_RECUPEROVALOR ' +
                 'SET XV_IDRECIBO = NULL ' +
               'WHERE XV_IDRECIBO = :Idrecibo';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ID_RECIBO').AsInteger]);
    finally
      Free;
    end;

    CommitTrans;

    MsgBox('El recibo se anuló correctamente.', MB_OK + MB_ICONINFORMATION);

    fpAnulacion.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      RollBack;

      raise Exception.Create(E.Message + CRLF + 'Error al anular el recibo.');
    end;
  end;
end;

procedure TfrmValRecibos.fpAnulacionEnter(Sender: TObject);
begin
  inherited;

  fraCtbTablasAnulacion.Clear;
  edDescripcionAnulacion.Clear;

  fraCtbTablasAnulacion.Clave := 'RBAJA';
  fraCtbTablasAnulacion.ShowBajas := False;
  edFechaAnulacion.Date := DBDateTime;

  LockControl(edFechaAnulacion);
end;

{ Determina si los datos ingresados de la anulación del recibo son o no válidos }
function TfrmValRecibos.IsDatosValidosAnulacion: Boolean;
begin
  Result := False;

  // motivo de anulación obligatorio
  if not fraCtbTablasAnulacion.IsSelected then
    InvalidMsg(fraCtbTablasAnulacion.edCodigo, 'Debe ingresar el motivo de anulación.')
  else
    Result := True;
end;

procedure TfrmValRecibos.tbAnularClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    InvalidMsg(Grid, 'No hay ninguna fila de la grilla seleccionada.')
  else
  	if IsRegistroAnulacionValido() then
    	if fpAnulacion.ShowModal = mrOk then
      	sdqConsulta.Refresh;
end;

procedure TfrmValRecibos.mnuReciboImprimirClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    InvalidMsg(Grid, 'No hay ninguna fila de la grilla seleccionada.')
  else if not sdqConsulta.FieldByName('FECHA_ANULACION').IsNull then
    InvalidMsg(Grid, 'El recibo se encuentra anulado.')
  else
    DoImprimirRecibo(Sender = mnuReciboVisualizar);
end;

end.
