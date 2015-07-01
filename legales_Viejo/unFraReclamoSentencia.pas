unit unFraReclamoSentencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, unArtFrame,
  unFraCodigoDescripcion, ExtCtrls, FormPanel, Grids, DBGrids, ComCtrls,
  ToolWin, DB, SDEngine, unConstLegales, unDmLegales, RXDBCtrl,
  ArtComboBox, ArtDBGrid, unArtDBAwareFrame, ExComboBox;

type
  TfraReclamoSentencia = class(TFrame)
    cbReclamoSentencia: TCoolBar;
    tbrReclamo: TToolBar;
    tbNuevoReclamo: TToolButton;
    tbEdicionReclamo: TToolButton;
    tbBajaReclamo: TToolButton;
    tbImprimirReclamos: TToolButton;
    fpReclamo: TFormPanel;
    bvSeparadorBotones: TBevel;
    btnAceptarReclamo: TButton;
    btnCancelarReclamo: TButton;
    dsReclamos: TDataSource;
    sdqReclamoJuicioEnTramite: TSDQuery;
    ToolButton2: TToolButton;
    dbReclamos: TArtDBGrid;
    sdqSiniestros: TSDQuery;
    ScrollBox1: TScrollBox;
    pnImporteReclamo: TPanel;
    pnReclamoIncapacidad: TPanel;
    lblPorcentajeIncapacidadDemanda: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lnlPorcentajeIncapacidad: TLabel;
    edPorcentajeIncapacidadDemanda: TCurrencyEdit;
    edPorcentajeIncapacidadSegunPerito: TCurrencyEdit;
    pnImporteSentencia: TPanel;
    lblImporteSentencia: TLabel;
    lblTituloPorcentajeSolidario: TLabel;
    lblPorcentajeSolidario: TLabel;
    lblImporteAPagar: TLabel;
    Label3: TLabel;
    ceImporteSentencia: TCurrencyEdit;
    cePorcentajeSolidario: TCurrencyEdit;
    ceImporteAPagar: TCurrencyEdit;
    edSiniestros: TEdit;
    pnOrigenDemanda: TPanel;
    lblOrigenanteRelacionado: TLabel;
    fraOrigenReclamoRelacionado: TfraCodigoDescripcion;
    pnl1: TPanel;
    lblReclamo: TLabel;
    fraReclamo: TfraCodigoDescripcion;
    tbReclamo: TToolBar;
    tbEditarReclamos: TToolButton;
    pnl2: TPanel;
    lblImporteDemandado: TLabel;
    edtImporteDemandadoReclamo: TCurrencyEdit;
    lblImporteNominal: TLabel;
    edImporteNominal: TCurrencyEdit;
    Label5: TLabel;
    edIntereses: TCurrencyEdit;
    lbMontoDemanda: TLabel;
    edMontoDemanda: TCurrencyEdit;
    lblPor: TLabel;
    cmbPor: TExComboBox;
    cbIndeterminado: TCheckBox;
    cbIndeterminadoIncDem: TCheckBox;
    procedure tbNuevoReclamoClick(Sender: TObject);
    procedure btnAceptarReclamoClick(Sender: TObject);
    procedure tbBajaReclamoClick(Sender: TObject);
    procedure tbEdicionReclamoClick(Sender: TObject);
    procedure tbEditarReclamosClick(Sender: TObject);
    procedure dbReclamosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaReclamosClick(Sender: TObject);
    procedure dbReclamosPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
    procedure edImporteNominalChange(Sender: TObject);
    procedure edInteresesChange(Sender: TObject);
    procedure fpReclamoBeforeShow(Sender: TObject);
    procedure fraOrigenReclamoRelacionadocmbDescripcionCloseUp(
      Sender: TObject);
    procedure fraOrigenReclamoRelacionadoResize(Sender: TObject);
    procedure fraReclamoResize(Sender: TObject);
    procedure pnl2Resize(Sender: TObject);
    procedure cbIndeterminadoClick(Sender: TObject);
    procedure cbIndeterminadoIncDemClick(Sender: TObject);

  private
    FIdInstancia : Integer;
    FIdJuicioEnTramite : Integer;
    FIdReclamoJuicioEnTramite : integer;
    FIdOrigenDemanda : integer;
    FModoReclamo : TModoEjecucion;
    FDictadoSentencia : boolean;
    FEditable: Boolean;
    FTotales: array[0..1] of Extended;
    FTotalDemanda: Extended;
    FTotalImporteNominal: Extended;
    FTotalSentenciaCapital: Extended;
    function AltaReclamo: boolean;

    procedure CargarDatosReclamo(Campos: TFields);
    procedure EliminarReclamo;
    procedure GuardarReclamo;
    procedure LimpiarCamposReclamo;
    function ModificacionReclamo: boolean;
    procedure ReclamoChange(Sender: TObject);
    function GetCantidadReclamos: Integer;
    procedure SetEditable(const Value: Boolean);
    procedure VerificarOrigenMultiple;
    procedure SetTotalDemanda(const Value: Extended);
    procedure SetTotalImporteNominal(const Value: Extended);
    procedure SetTotalSentenciaCapital(const Value: Extended);
    procedure CalcularTotales;
    procedure LeerSiniestros (AIdJuicioEnTramite, AIdOrigenDemanda: Integer);
    function GetTotalMontoDemandado: Extended;
    { Private declarations }
  public
    { Public declarations }
    procedure Init(AIdJuicioEnTramite : integer; ADictadoSentencia : boolean; AInstancia: Integer);
    procedure Sumatoria;
    property  CantidadReclamos: Integer read GetCantidadReclamos;
    property  Editable : Boolean read FEditable write SetEditable default true;
    property  TotalDemanda : Extended read FTotalDemanda write SetTotalDemanda;
    property  TotalImporteNominal : Extended read FTotalImporteNominal write SetTotalImporteNominal;
    property  TotalMontoDemandado: Extended read GetTotalMontoDemandado; 
    property  TotalSentenciaCapital : Extended read FTotalSentenciaCapital write SetTotalSentenciaCapital;
  end;

Const
  CamposSumatoria: array[0..1] of string = ('rt_montodemandado', 'rt_montosentencia');   //, 'TOTGS' );

implementation

uses unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion, unManReclamos, General, dbFuncs,
  VCLExtra, Math;

{$R *.dfm}

procedure TfraReclamoSentencia.Init(AIdJuicioEnTramite : integer; ADictadoSentencia : boolean; AInstancia: Integer);
begin
  FIdJuicioEnTramite := AIdJuicioEnTramite;
  FDictadoSentencia := ADictadoSentencia;
  FIdInstancia := AInstancia;

  with fraReclamo do
  begin
    TableName   := 'legales.lrc_reclamo';
    FieldID     := 'rc_id';
    FieldCodigo := 'rc_id';
    FieldDesc   := 'rc_descripcion';
    ExtraFields := ', rc_reclamaincapacidad ';
    OnChange    := ReclamoChange;
  end;

  with fraOrigenReclamoRelacionado do
  begin
    TableName   := 'legales.lod_origendemanda';
    FieldID     := 'od_id';
    FieldCodigo := 'od_id';
    ExtraCondition := ' AND OD_IDJUICIOENTRAMITE = ' + SqlValue(FIdJuicioEnTramite);
    FieldDesc   := 'od_nombre';
  end;

  with sdqReclamoJuicioEnTramite do   begin
   ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
   Open;
  end;

  if FDictadoSentencia then
  begin
    fpReclamo.Height := 185;
    fraReclamo.Enabled := false;

    tbNuevoReclamo.Visible := false;

    pnImporteSentencia.Visible := true;
    pnImporteReclamo.Enabled := false;

    edtImporteDemandadoReclamo.Color := clInactiveCaption;
    edPorcentajeIncapacidadDemanda.Color := clInactiveCaption;
    cmbPor.Color := clInactiveCaption;
  end else
  begin
    fpReclamo.Height := 155;
    fraReclamo.Enabled := true;
    tbNuevoReclamo.Visible := true;

    pnImporteSentencia.Visible := false;
    pnImporteReclamo.Enabled := true;

    edtImporteDemandadoReclamo.Color := clWindow;
    edPorcentajeIncapacidadDemanda.Color := clWindow;
    cmbPor.Color := clWindow;
  end;
  pnReclamoIncapacidad.Visible := True;

  CalcularTotales;
end;


procedure TfraReclamoSentencia.CalcularTotales;
var
 b : TBookmark;
begin
  b := sdqReclamoJuicioEnTramite.GetBookmark;
  sdqReclamoJuicioEnTramite.DisableControls;
  sdqReclamoJuicioEnTramite.First;
  FTotalDemanda := 0;
  FTotalImporteNominal := 0;
  FTotalSentenciaCapital := 0;
  try
    while not sdqReclamoJuicioEnTramite.Eof do
    begin
      if sdqReclamoJuicioEnTramite.FieldByName('RT_FECHABAJA').IsNull then
      begin
        FTotalDemanda   := FTotalDemanda + sdqReclamoJuicioEnTramite.FieldByName('RT_MONTODEMANDADO').AsCurrency;
        FTotalImporteNominal := FTotalImporteNominal + sdqReclamoJuicioEnTramite.FieldByName('RT_IMPORTENOMINAL').AsCurrency;
        FTotalSentenciaCapital := FTotalSentenciaCapital + sdqReclamoJuicioEnTramite.FieldByName('RT_MONTOSENTENCIA').AsCurrency;
      end;
      sdqReclamoJuicioEnTramite.Next;
    end;
  finally
     sdqReclamoJuicioEnTramite.GotoBookmark(b);
     sdqReclamoJuicioEnTramite.FreeBookmark(b);
     sdqReclamoJuicioEnTramite.EnableControls;
  end;
end;

procedure TfraReclamoSentencia.tbNuevoReclamoClick(Sender: TObject);
begin
  AltaReclamo;
end;

procedure TfraReclamoSentencia.tbEdicionReclamoClick(Sender: TObject);
begin
  ModificacionReclamo;
end;

procedure TfraReclamoSentencia.tbBajaReclamoClick(Sender: TObject);
begin
  EliminarReclamo;
end;

procedure TfraReclamoSentencia.EliminarReclamo;
begin
  if sdqReclamoJuicioEnTramite.IsEmpty then
    Exit;

  if not sdqReclamoJuicioEnTramite.FieldByName('rt_fechabaja').IsNull then
  begin
      MsgBox('El reclamo ya está dado de baja.', MB_ICONERROR + MB_OK);
      Exit
  end;

  if MsgBox('¿Desea dar de baja el reclamo actual?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  EjecutarSqlST('UPDATE legales.lrt_reclamojuicioentramite ' +
                '   SET rt_fechabaja = SYSDATE, rt_usubaja = ' + SqlValue(Sesion.LoginName) +
                ' WHERE rt_id = ' + sdqReclamoJuicioEnTramite.FieldByName('rt_id').AsString );

  EjecutarSqlST('UPDATE legales.lir_importesreguladosjuicio ' +
                '   SET ir_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                '       ir_fechabaja = SYSDATE ' +
                ' WHERE ir_idreclamojuicioentramite = ' + sdqReclamoJuicioEnTramite.FieldByName('rt_id').AsString);
  sdqReclamoJuicioEnTramite.Refresh;
  CalcularTotales;
end;

procedure TfraReclamoSentencia.btnAceptarReclamoClick(Sender: TObject);
begin
  GuardarReclamo;
end;

procedure TfraReclamoSentencia.GuardarReclamo;
var
  FSentenciasPagadas: Double;
  Indeterminado, IndeterminadoIncDem : String;
begin
  if not FDictadoSentencia then
  begin
    VerificarMultiple (['Reclamo.',
                        fraReclamo.edCodigo,
                        fraReclamo.IsSelected,
                        'Debe seleccionar un tipo de reclamo',
                        edImporteNominal,
                        ((pnl2.Visible and (edImporteNominal.Value > 0))
                         or (not pnl2.Visible)),
                        'Debe especificar el Importe Nominal.',
                        fraOrigenReclamoRelacionado.edCodigo,
                        ((pnOrigenDemanda.Visible and (fraOrigenReclamoRelacionado.IsSelected))
                         or (not pnOrigenDemanda.Visible)),
                        'Debe especificar un origen de la demanda.'
                       ]);
    if not cbIndeterminado.Checked then
    begin
      Verificar((edtImporteDemandadoReclamo.Value = 0) and (pnImporteReclamo.Visible), edtImporteDemandadoReclamo,'Debe especificar un monto de demanda');
    end;

    if not cbIndeterminadoIncDem.Checked then
    begin
      Verificar((edPorcentajeIncapacidadDemanda.Value = 0) and (pnImporteReclamo.Visible)
                 and (pnReclamoIncapacidad.Visible), edPorcentajeIncapacidadDemanda,'Debe especificar un porcentaje de incapacidad demandada');
    end;

    if edtImporteDemandadoReclamo.Value >= ValorSqlExtended('SELECT pa_valor FROM legales.lpa_parametro '+
                                                    ' WHERE pa_clave = ''TABLA5IMPORTEDEMANDADO'' ') then
      if MsgBox('El importe demandado es significativo. Desea Guardar?', MB_ICONINFORMATION + MB_OKCANCEL) = IDCANCEL then
        Exit;

    if pnOrigenDemanda.Visible then
    begin
      FIdOrigenDemanda := StrtoInt(fraOrigenReclamoRelacionado.Codigo);
      LeerSiniestros (FIdJuicioEnTramite, FIdOrigenDemanda)
    end;

    If cbIndeterminado.Checked then
      Indeterminado := 'S'
    else
      Indeterminado := 'N';

    If cbIndeterminadoIncDem.Checked then
      IndeterminadoIncDem := 'S'
    else
      IndeterminadoIncDem := 'N';

    if FModoReclamo = meAlta then
      EjecutarSqlST('INSERT INTO LEGALES.LRT_RECLAMOJUICIOENTRAMITE ( RT_ID, RT_IDJUICIOENTRAMITE, RT_IDRECLAMO, RT_MONTODEMANDADO, ' +
                    ' RT_PORCENTAJEINCAPACIDADPERITO, RT_PORCENTAJEINCAPACIDAD, RT_FECHAALTA, RT_USUALTA, RT_IDORIGENDEMANDA,'+
                    ' RT_IMPORTENOMINAL,RT_INTERESES, RT_ORIGEN,RT_INDETERMINADO,RT_INDETERMINADOINCDEM) ' +
                    ' VALUES ( LEGALES.SEQ_LRT_ID.NEXTVAL, ' +
                    SqlValue(FIdJuicioEnTramite) + ', ' +
                    sqlValue(fraReclamo.Value) + ', ' +
                    SqlValue(edtImporteDemandadoReclamo.Value)   + ', ' +
                    SqlValue(edPorcentajeIncapacidadSegunPerito.Value)   + ', ' +
                    SqlValue(edPorcentajeIncapacidadDemanda.Value)   + ', ' +
                    'SysDate' + ', ' +
                    sqlValue(Sesion.LoginName) + ', ' +
                    sqlValue(FIdOrigenDemanda) + ', ' +
                    SqlValue(edImporteNominal.Value) + ', '+
                    SqlValue(edIntereses.Value) + ', '+
                    SqlValue(cmbPor.Value)+','+
                    SqlValue(Indeterminado)+','+
                    SqlValue(IndeterminadoIncDem)
                    + ')')
    else
    begin
      EjecutarSqlST('update LEGALES.LRT_RECLAMOJUICIOENTRAMITE ' +
                    'set ' +
                    '    RT_MONTODEMANDADO        = '    + SqlValue(edtImporteDemandadoReclamo.Value) + ', ' +
                    '    RT_INDETERMINADO         = '    + SqlValue(Indeterminado) + ', ' +
                    '    RT_INDETERMINADOINCDEM   = '    + SqlValue(IndeterminadoIncDem) + ', ' +
                    '    RT_IDRECLAMO             = '    + SqlValue(fraReclamo.Value) + ', ' +
                    '    RT_PORCENTAJEINCAPACIDAD = '    + iif(pnReclamoIncapacidad.Visible, SqlValue(edPorcentajeIncapacidadDemanda.Value), SQL_NULL)  + ', ' +
                    '    RT_PORCENTAJEINCAPACIDADPERITO = ' + iif(pnReclamoIncapacidad.Visible, SqlValue(edPorcentajeIncapacidadSegunPerito.Value), SQL_NULL) + ', ' +
                    '    RT_USUMODIF = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '    RT_FECHAMODIF = SysDate, ' +
                    '    RT_ORIGEN = ' + SqlValue(cmbPor.Value) +
                    ' Where RT_ID =                 '    + SqlValue(FIdReclamoJuicioEnTramite) +
                    ' and   RT_IDJUICIOENTRAMITE =  '    + SqlValue(FIdJuicioEnTramite));
      if pnOrigenDemanda.Visible then
      begin
        EjecutarSqlST(' update LEGALES.LRT_RECLAMOJUICIOENTRAMITE ' +
                      '    set RT_IDORIGENDEMANDA = ' + SqlValue(FIdOrigenDemanda)+
                      '  Where RT_ID =                 '    + SqlValue(FIdReclamoJuicioEnTramite) +
                      '    and RT_IDJUICIOENTRAMITE =  '    + SqlValue(FIdJuicioEnTramite));
      end;
      if pnl2.Visible then
      begin
        EjecutarSqlST(' update LEGALES.LRT_RECLAMOJUICIOENTRAMITE ' +
                      '    set RT_IMPORTENOMINAL = ' + SqlValue(edImporteNominal.Value)+ ', '+
                      '        RT_INTERESES      = ' + sqlvalue(edIntereses.Value) +
                      '  Where RT_ID =                 '    + SqlValue(FIdReclamoJuicioEnTramite) +
                      '    and RT_IDJUICIOENTRAMITE =  '    + SqlValue(FIdJuicioEnTramite));
      end;

    end;
  end
  else begin
    FSentenciasPagadas:= ValorSqlExtended (
                            'SELECT NVL(SUM (IR_IMPORTESINRET), 0) ' +
                            '  FROM legales.lir_importesreguladosjuicio ' +
                            ' WHERE ir_fechabaja IS NULL ' +
                            '   AND ir_aplicacion = ''C'' ' +
                            '   AND ir_idjuicioentramite = ' + SqlValue (FIdJuicioEnTramite)  +
                            '   AND ir_idreclamojuicioentramite = ' + SqlValue (FIdReclamoJuicioEnTramite) +
                            '   AND ir_idinstancia < ' + SqlValue (FIdInstancia), 0);

    //FSentenciaAPagar := ceImporteSentencia.Value - FSentenciasPagadas;

    VerificarMultiple(['Resultado del Reclamo en la Sentencia.',
(*  Sacado 23/8/06 ya que puede haber sentencia con valor 0
                       ceImporteSentencia,
                       ceImporteSentencia.Value > 0,
                       'Debe especificar un monto válido.',
*)
                       ceImporteAPagar,
                       ceImporteAPagar.Value >= 0,
                       'Debe especificar un monto no negativo.',

                       ceImporteAPagar,
                       ceImporteAPagar.Value <= ceImporteSentencia.Value,
                       'El monto a pagar no puede superar el monto de la sentencia.'
                      ]);


    EjecutarSqlST('update LEGALES.LRT_RECLAMOJUICIOENTRAMITE ' +
                  '   set RT_MONTOSENTENCIA      = '    + SqlValue(ceImporteSentencia.Value) + ', ' +
                  '       RT_MONTOAPAGAR         = '    + SqlValue(ceImporteAPagar.Value) + ', ' +
                  '       RT_PORCENTAJESENTENCIA = '    + SqlValue(cePorcentajeSolidario.Value) + ', ' +
                  '       RT_USUMODIF            = ' + SqlValue(Sesion.LoginName) + ', ' +
                  '       RT_FECHAMODIF          = SysDate ' +
                  ' Where RT_ID                  = '    + SqlValue(FIdReclamoJuicioEnTramite) +
                  '   and RT_IDJUICIOENTRAMITE   = '    + SqlValue(FIdJuicioEnTramite));

    if (ceImporteAPagar.Value - FSentenciasPagadas) < 0 then
      FSentenciasPagadas := ceImporteAPagar.Value;

    if ValorSqlInteger('SELECT 1 FROM legales.lir_importesreguladosjuicio ' +
                       ' WHERE ir_idreclamojuicioentramite = ' + SqlValue(FIdReclamoJuicioEnTramite) +
                       '   AND ir_idinstancia = ' + SqlValue(FIdInstancia)) = 1 then
      EjecutarSqlST('UPDATE legales.lir_importesreguladosjuicio ' +
                    '   SET ir_importesinret = ' + SqlValue(ceImporteAPagar.Value - FSentenciasPagadas) + ', ' +
                    '       ir_importesentencia = '+ SqlValue(ceImporteSentencia.Value) + ', ' +
                    '       ir_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       ir_fechamodif = SYSDATE ' +
                    ' WHERE ir_idreclamojuicioentramite = ' + SqlValue(FIdReclamoJuicioEnTramite) +
                    '   AND ir_idinstancia = ' + SqlValue(FIdInstancia))
    else
      EjecutarSqlST('INSERT INTO legales.lir_importesreguladosjuicio (' +
                    'ir_id, ir_idjuicioentramite, ir_importe, ir_detalle, ' +
                    'ir_aplicacion, ir_usualta, ir_fechaalta, ir_usumodif, ' +
                    'ir_fechamodif, ir_usubaja, ir_fechabaja, ir_idinstancia, ' +
                    'ir_nropago, ir_idreclamojuicioentramite, ir_importesinret, ' +
                    'ir_importesentencia) ' +
                    'VALUES (legales.seq_lir_id.NEXTVAL, ' +
                    SqlValue(FIdJuicioEnTramite) + ', 0,' +
                    SqlValue('Sentencia a Reclamo ' +
                             String(ValorSql('SELECT od_nombre from legales.lod_origendemanda ' +
                                             ' WHERE od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
                                             '   AND od_id = ' + SqlValue (FIdOrigenDemanda) +
                                             '   AND od_fechabaja IS NULL', ''))
                            ) + ', ' +
                    SqlValue('C') + ', ' +
                    SqlValue(Sesion.LoginName) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                    SqlValue(FIdInstancia) + ', NULL, ' +
                    SqlValue(FIdReclamoJuicioEnTramite) + ', ' +
                    SqlValue(ceImporteAPagar.Value) + ', ' +
                    SqlValue(ceImporteSentencia.Value) + ')');
  end;

  sdqReclamoJuicioEnTramite.Refresh;
  fpReclamo.Close;

  CalcularTotales;
end;


function TfraReclamoSentencia.AltaReclamo: boolean;
begin
  LimpiarCamposReclamo;

  FModoReclamo := meAlta;
  result :=  fpReclamo.ShowModal = mrOK;
  sdqReclamoJuicioEnTramite.Refresh;
end;


function TfraReclamoSentencia.ModificacionReclamo: boolean;
begin
  result := true;

  if sdqReclamoJuicioEnTramite.IsEmpty then
    Exit;

  if not sdqReclamoJuicioEnTramite.FieldByName('rt_fechabaja').IsNull then
  begin
    MsgBox('El reclamo está dado de baja.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Exit
  end;

  LimpiarCamposReclamo;
  FModoReclamo := meModificacion;

  FIdReclamoJuicioEnTramite := sdqReclamoJuicioEnTramite.Fields.FieldByName('rt_id').AsInteger;
  CargarDatosReclamo(sdqReclamoJuicioEnTramite.Fields);


  result :=  fpReclamo.ShowModal = mrOK;
  sdqReclamoJuicioEnTramite.Refresh;
end;

procedure TfraReclamoSentencia.CargarDatosReclamo(Campos : TFields);
begin
  fraReclamo.Codigo := Campos.FieldByName('rt_idreclamo').asstring;
  ReclamoChange(self);
  ceImporteSentencia.Value := Campos.FieldByName('rt_montosentencia').AsCurrency;
  ceImporteAPagar.Value := Campos.FieldByName('rt_montoapagar').AsCurrency;
  cePorcentajeSolidario.Value := Campos.FieldByName('rt_porcentajesentencia').AsCurrency;
  edtImporteDemandadoReclamo.Value := Campos.FieldByName('rt_montodemandado').AsCurrency;
  cbIndeterminado.Checked := Campos.FieldByName('rt_indeterminado').AsString = 'S';
  cbIndeterminadoIncDem.Checked := Campos.FieldByName('RT_INDETERMINADOINCDEM').AsString = 'S';
  edPorcentajeIncapacidadDemanda.Value := Campos.FieldByName('RT_PORCENTAJEINCAPACIDAD').AsFloat;
  edPorcentajeIncapacidadSegunPerito.Value := Campos.FieldByName('RT_PORCENTAJEINCAPACIDADPERITO').AsFloat;
  fraOrigenReclamoRelacionado.Codigo := Campos.FieldByName('RT_IDORIGENDEMANDA').AsString;
  cmbPor.Value := Campos.FieldByName('RT_ORIGEN').AsString;
  if pnl2.Visible then
  begin
    edImporteNominal.Value := Campos.FieldByName('RT_IMPORTENOMINAL').AsFloat;
    edIntereses.Value      := Campos.FieldByName('RT_INTERESES').AsFloat;
    Sumatoria;
  end;
end;

procedure TfraReclamoSentencia.LimpiarCamposReclamo;
begin
  fraReclamo.Codigo := '';
  edtImporteDemandadoReclamo.Value := 0;
  cbIndeterminado.Checked := False;
  cbIndeterminadoIncDem.Checked := False;
  edPorcentajeIncapacidadDemanda.Value := 0;
  ceImporteSentencia.Value := 0;
  ceImporteAPagar.Value := 0;
  cePorcentajeSolidario.Value := 0;
  edPorcentajeIncapacidadSegunPerito.Value := 0;
  edImporteNominal.Value := 0;
  edIntereses.Value := 0;
  fraOrigenReclamoRelacionado.Clear;
  VerificarOrigenMultiple;
  cmbPor.ItemIndex := -1;
end;

procedure TfraReclamoSentencia.ReclamoChange(Sender : TObject);
begin
//  if fraReclamo.IsSelected then
//    pnReclamoIncapacidad.Visible := fraReclamo.sdqDatos.FieldByName('RC_RECLAMAINCAPACIDAD').AsString = 'S';
end;

function TfraReclamoSentencia.GetCantidadReclamos: Integer;
begin
  if sdqReclamoJuicioEnTramite.Active then
    result := sdqReclamoJuicioEnTramite.RecordCount
  else result := 0;
end;

procedure TfraReclamoSentencia.SetEditable(const Value: Boolean);
begin
  FEditable := Value;
  tbNuevoReclamo.Enabled := Value;
  tbEdicionReclamo.Enabled := Value;
  tbBajaReclamo.Enabled := Value;

end;

procedure TfraReclamoSentencia.tbEditarReclamosClick(Sender: TObject);
begin
  with TfrmManReclamos.Create(self) do
  try
    FormStyle := fsNormal;
    Visible := False;
    ShowModal;
  finally
    free;
  end;
end;

procedure TfraReclamoSentencia.VerificarOrigenMultiple;
var
 cantidad : integer;
begin
  cantidad := ValorSql('select count(*) from legales.lod_origendemanda ' +
                       'where od_fechabaja is null and od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite), '0');

  if Cantidad > 1 then
  begin
    pnOrigenDemanda.visible := true;
    fpReclamo.Height := 245;
  end
  else if Cantidad = 1 then
  begin
    pnOrigenDemanda.visible := false;
    fpReclamo.Height := 205;
    FIdOrigenDemanda := ValorSql('select od_id from legales.lod_origendemanda ' +
                                 ' where od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
                                 '   and od_fechabaja is null', '0');
    LeerSiniestros (FIdJuicioEnTramite, FIdOrigenDemanda)
  end
  else if Cantidad = 0 then
  begin
    MessageDlg('Debe especificar al menos un origen de '+#13+#10+'demanda para poder proseguir', mtInformation, [mbOK], 0);
    abort;
  end;
end;


procedure TfraReclamoSentencia.dbReclamosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('rt_fechabaja').IsNull Then  AFont.Color := clRed;
end;

procedure TfraReclamoSentencia.tbSumatoriaReclamosClick(Sender: TObject);
begin
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraReclamoSentencia.dbReclamosPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iCol: Integer;
begin
  iCol := ArrayPos(Column, CamposSumatoria);
  if iCol > -1 Then
     Value := Format('$ %0.2f', [FTotales[iCol]]);

  case iCol of
  0 : TotalDemanda := StrToFloat(Value);
  1 : TotalSentenciaCapital := StrToFloat(Value);
  end;

end;

procedure TfraReclamoSentencia.edImporteNominalChange(Sender: TObject);
begin
  Sumatoria;
end;

procedure TfraReclamoSentencia.edInteresesChange(Sender: TObject);
begin
  Sumatoria;
end;

procedure TfraReclamoSentencia.fpReclamoBeforeShow(Sender: TObject);
begin
  VCLExtra.LockControl(edMontoDemanda, True);
end;

procedure TfraReclamoSentencia.SetTotalDemanda(const Value: Extended);
begin
  FTotalDemanda := Value;
end;

procedure TfraReclamoSentencia.SetTotalImporteNominal(const Value: Extended);
begin
  FTotalImporteNominal := Value;
end;

procedure TfraReclamoSentencia.SetTotalSentenciaCapital(const Value: Extended);
begin
  FTotalSentenciaCapital := Value;
end;

procedure TfraReclamoSentencia.LeerSiniestros (AIdJuicioEnTramite, AIdOrigenDemanda: Integer);
begin
  edSiniestros.Text := '';

  with sdqSiniestros do
  begin
    SQL.Clear;
    SQL.Add('SELECT    TO_CHAR (sj_siniestro) ' +
            '       || ''-'' ' +
            '       || TO_CHAR (sj_orden) ' +
            '       || ''-'' ' +
            '       || TO_CHAR (sj_recaida) siniestro ' +
            '  FROM legales.lsj_siniestrosjuicioentramite, legales.lod_origendemanda ' +
            ' WHERE sj_fechabaja IS NULL ' +
            '   AND od_id = sj_idorigendemanda ' +
            '   AND od_fechabaja IS NULL ' +
            '   AND sj_idorigendemanda IN (SELECT   sj_idorigendemanda ' +
            '                                  FROM legales.lsj_siniestrosjuicioentramite ' +
            '                                 WHERE sj_fechabaja IS NULL ' +
            '                              GROUP BY sj_idorigendemanda) ' +
            '   AND sj_idorigendemanda =  ' + SqlInteger (AIdOrigenDemanda) +
            '   AND od_idjuicioentramite =  ' + SqlInteger (AIdJuicioEnTramite));
    Open;

    while not EoF do
    begin
      edSiniestros.Text := edSiniestros.Text + FieldByName('siniestro').AsString;

      Next;
      if not Eof then
        edSiniestros.Text := edSiniestros.Text + '/'
    end;

    Close
  end
end;

procedure TfraReclamoSentencia.fraOrigenReclamoRelacionadocmbDescripcionCloseUp(
  Sender: TObject);
begin
  fraOrigenReclamoRelacionado.cmbDescripcionCloseUp(Sender);
  FIdOrigenDemanda := StrtoInt(fraOrigenReclamoRelacionado.Codigo);
  LeerSiniestros (FIdJuicioEnTramite, FIdOrigenDemanda);

end;

procedure TfraReclamoSentencia.fraOrigenReclamoRelacionadoResize(Sender: TObject);
begin
   fraOrigenReclamoRelacionado.Width := 373;
   fraOrigenReclamoRelacionado.cmbDescripcion.Width := 305;
end;

procedure TfraReclamoSentencia.fraReclamoResize(Sender: TObject);
begin
  fraReclamo.Width := 377;
end;

procedure TfraReclamoSentencia.pnl2Resize(Sender: TObject);
begin
  pnl2.Width := 519;
end;

procedure TfraReclamoSentencia.Sumatoria;
begin
  edMontoDemanda.Value := edImporteNominal.Value + edIntereses.Value;
end;

function TfraReclamoSentencia.GetTotalMontoDemandado: Extended;
begin
  Result := edMontoDemanda.Value;
end;

procedure TfraReclamoSentencia.cbIndeterminadoClick(Sender: TObject);
begin
  if cbIndeterminado.Checked then
    edtImporteDemandadoReclamo.Clear;
  vclExtra.LockControls([edtImporteDemandadoReclamo],cbIndeterminado.Checked);
end;

procedure TfraReclamoSentencia.cbIndeterminadoIncDemClick(Sender: TObject);
begin
  if cbIndeterminadoIncDem.Checked then
    edPorcentajeIncapacidadDemanda.Clear;
  vclExtra.LockControls([edPorcentajeIncapacidadDemanda],cbIndeterminadoIncDem.Checked);
end;

end.
