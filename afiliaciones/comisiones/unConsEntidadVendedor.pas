unit unConsEntidadVendedor;

interface
                 
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, unArtFrame, unFraCodigoDescripcion, unfraVendedores,
  unfraVendedoresCUIT, unfraEntidadCUIT, PeriodoPicker, Mask, ToolEdit,
  CurrEdit, FormPanel, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, DateComboBox ;

type
  TfrmConsEntidadVendedor = class(TfrmCustomConsulta)
    gbEntidad: TGroupBox;
    fraEntidad: TfraEntidadCUIT;
    gbVendedor: TGroupBox;
    fraVendedor: TfraVendedoresCUIT;
    fpCambiaVendedor: TFormPanel;
    Label20: TLabel;                 
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Bevel1: TBevel;
    edVC_PORCCOMISION: TCurrencyEdit;
    edfpPeriodoHasta: TPeriodoPicker;
    tbnfpAceptar: TButton;
    tbnfpCancelar: TButton;
    frafpEntidadCUIT: TfraEntidadCUIT;
    frafpVendedor: TfraVendedoresCUIT;
    tbCambiarVendedor: TToolButton;
    Divisor: TToolButton;
    tbSumatoria: TToolButton;
    rbMantenimiento: TRadioGroup;
    gbActivas: TGroupBox;
    gbEjecutivo: TGroupBox;
    fraEjecutivo: TfraStaticCodigoDescripcion;
    gbSectorEmpresa: TGroupBox;
    fraSectorEmpresa: TfraStaticCTB_TABLAS;
    gbFechaVigencia: TGroupBox;
    Label1: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    edPerActivasHasta: TPeriodoPicker;
    procedure tbRefrescarClick(Sender: TObject); 
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure edVC_PORCCOMISIONChange(Sender: TObject);
    procedure tbnfpAceptarClick(Sender: TObject);
    procedure tbnfpCancelarClick(Sender: TObject);
    procedure tbCambiarVendedorClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormateaTexto(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    //Relacionadas con el formPanel fbCambiaVendedor
    function  IDEntidadVendedor : string;
    function  ComisionDefault : extended;
    procedure OnEntidadChange(Sender: TObject);
    procedure OnVendedorChange(Sender: TObject);
    procedure CalcTotales;
  public
  end;                                          

const
  MAXCOLS = 4;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('ULT_EMISION', 'MASASALARIAL', 'SUMA_FIJA', 'EMPLEADOS', 'DEUDAEXIGIBLE');

var
  TotalConsulta : array of extended;
  frmConsEntidadVendedor: TfrmConsEntidadVendedor;
  
implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, unArt, VCLExtra, CustomDlgs, Periodo, unSesion,
  DbFuncs, General, Strfuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.tbRefrescarClick(Sender: TObject);
var
  sSql : String;
begin
  sSql := 'SELECT EV_ID, EM_CUIT MP_CUIT, EM_NOMBRE MP_NOMBRE, CO_CONTRATO MP_CONTRATO, ' +
                 'CO_VIGENCIADESDE MP_VIGENCIADESDE, CO_VIGENCIAHASTA MP_VIGENCIAHASTA, ' +
                 'NVL(CO_TOTEMPLEADOSACTUAL, CO_TOTEMPLEADOS) EMPLEADOS, ' +
                 'CTBEST.TB_DESCRIPCION ESTADO, VE_VENDEDOR VENDEDOR, VC_PORCCOMISION PORCCOMISION, ' +
                 'COBRANZA.GET_ULTIMODEVENGADO(CO_CONTRATO) ULT_EMISION, CO_ESTADO MP_ESTADO, ' +
                 'NVL(CO_MASATOTALACTUAL, CO_MASATOTAL) MASASALARIAL, ' +
                 'AFILIACION.GET_SUMA_FIJA(CO_CONTRATO, TO_CHAR(ACTUALDATE, ''YYYYMM'')) SUMA_FIJA, ' +
                 'AFILIACION.GET_PORCMASA(CO_CONTRATO, TO_CHAR(ACTUALDATE, ''YYYYMM'')) PORCMASA, ' +
                 'EC_NOMBRE EJECUTIVOENT, CTBSECT.TB_DESCRIPCION SECTOREMPR, VE_NOMBRE NOMBREVEND, ' +
                 'DEUDA.GET_DEUDATOTALCONSOLIDADA(CO_CONTRATO) DEUDAEXIGIBLE ' + 
            'FROM AEC_EJECUTIVOCUENTA, XEN_ENTIDAD, XVE_VENDEDOR, AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, AEM_EMPRESA, ' +
                 'ACO_CONTRATO, CTB_TABLAS CTBEST, CTB_TABLAS CTBSECT ' +
           'WHERE '''' || CTBEST.TB_CLAVE = ''AFEST'' ' +
             'AND CTBSECT.TB_CLAVE = ''SECT'' ' +
             'AND CTBSECT.TB_CODIGO = EM_SECTOR ' +
             'AND CO_ESTADO = CTBEST.TB_CODIGO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND CO_CONTRATO = VC_CONTRATO ' +
             'AND VC_IDENTIDADVEND = EV_ID ' +
             'AND EV_IDVENDEDOR = VE_ID ' +
             'AND EV_IDENTIDAD = EN_ID ' +
             'AND VC_FECHABAJA IS NULL ' +
             'AND EN_IDEJECUTIVO = EC_ID(+) ';

  sSql := sSql + SqlBetweenDateTime(' AND CO_VIGENCIADESDE', edVigenciaDesde.Date, edVigenciaHasta.Date);

  if fraVendedor.IsSelected and not fraEntidad.IsSelected then
    sSql := sSql + ' AND EV_IDVENDEDOR = ' + SqlValue(fraVendedor.Value)
  else if fraVendedor.IsSelected Then
    sSql := sSql + ' AND VC_IDENTIDADVEND = ' + SqlValue(fraVendedor.EntidadVendedor)
  else if fraEntidad.IsSelected Then
    sSql := sSql + ' AND EV_IDENTIDAD = ' + SqlValue(fraEntidad.Value);

  if fraEjecutivo.IsSelected then
    sSql := sSql + ' AND EN_IDEJECUTIVO = ' + SqlValue(fraEjecutivo.Value);

  if fraSectorEmpresa.IsSelected then
    sSql := sSql + ' AND EM_SECTOR = ' + SqlValue(fraSectorEmpresa.Value);

  if not IsEmptyString(edPerActivasHasta.Periodo.Valor) then
    sSql := sSql + ' AND ' + SqlValue(edPerActivasHasta.Periodo.Valor) + ' BETWEEN VC_VIGENCIADESDE AND NVL(VC_VIGENCIAHASTA, ''299999'')';

  if MaxRegistros > 0 Then
    sSql := sSql + ' AND ROWNUM <= ' + SqlInt( MaxRegistros );

  case rbMantenimiento.ItemIndex of
    1:  sSql := sSql + ' AND '''' || VC_IDCONCEPTO = 2';    // Si
    2:  sSql := sSql + ' AND '''' || VC_IDCONCEPTO <> 2';   // No
  end;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy ;

  inherited;

  CalcTotales;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.FormCreate(Sender: TObject);
begin
  inherited;

  IMG_FILTROS_SHOW := 11;
  IMG_FILTROS_HIDE := 10;

  fraEntidad.ShowBajas  := True;
  fraVendedor.ShowBajas := True;

  with fraEjecutivo do
    begin
      TableName      := 'AEC_EJECUTIVOCUENTA';
      FieldID        := 'EC_ID';
      FieldCodigo    := 'EC_ID';
      FieldDesc      := 'EC_NOMBRE';
      FieldBaja      := 'EC_FECHABAJA';
      ShowBajas      := True;
    end;

  with fraSectorEmpresa do
    begin
      Clave      := 'SECT';
      ShowBajas  := True;
    end;

  tbSumatoria.Left       := 323;
  tbCambiarVendedor.Left := 323;
  Divisor.Left           := 323;

  frafpEntidadCUIT.OnChange  := OnEntidadChange;
  frafpVendedor.OnChange     := OnVendedorChange;

  SetLength(TotalConsulta,  MAXCOLS  + 1);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.tbImprimirClick(Sender: TObject);
begin
   QueryPrint.SubTitle.Lines.Clear;

   if fraEntidad.IsSelected Then
     QueryPrint.SubTitle.Lines.Add( 'Entidad: ' + fraEntidad.edCodigo.Text + ' - ' + fraEntidad.cmbDescripcion.Text );

   if fraVendedor.IsSelected Then
     QueryPrint.SubTitle.Lines.Add( 'Vendedor: ' + fraVendedor.edCodigo.Text + ' - ' + fraVendedor.cmbDescripcion.Text );

   if fraEjecutivo.IsSelected Then
     QueryPrint.SubTitle.Lines.Add( 'Ejecutivo Ent.: ' + fraEjecutivo.edCodigo.Text + ' - ' + fraEjecutivo.cmbDescripcion.Text );

   if fraSectorEmpresa.IsSelected Then
     QueryPrint.SubTitle.Lines.Add( 'Sector Empr.: ' + fraSectorEmpresa.cmbDescripcion.Text );

   if not edVigenciaDesde.IsEmpty then
     QueryPrint.SubTitle.Lines.Add( 'Vig. Desde: ' + edVigenciaDesde.Text );

   if not edVigenciaHasta.IsEmpty then
     QueryPrint.SubTitle.Lines.Add( 'Vig. Hasta: ' + edVigenciaHasta.Text );

   if not IsEmptyString(edPerActivasHasta.Periodo.Valor) then
     QueryPrint.SubTitle.Lines.Add( 'Activas a: ' + edPerActivasHasta.Periodo.Valor ); 

   case rbMantenimiento.ItemIndex of
     1:  QueryPrint.SubTitle.Lines.Add( 'Mantenedor de Cuenta: Si' );   // Si
     2:  QueryPrint.SubTitle.Lines.Add( 'Mantenedor de Cuenta: No' );   // No
   end;

   if MaxRegistros > 0 Then
     QueryPrint.SubTitle.Lines.Add( 'Máximo de Registros: ' + IntToStr(MaxRegistros) );

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.tbLimpiarClick(Sender: TObject);
begin
  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  fraEjecutivo.Clear;
  fraSectorEmpresa.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edPerActivasHasta.Clear;
  rbMantenimiento.ItemIndex := 0;  // Todos

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.fraEntidadExit(Sender: TObject);
begin
  inherited;
  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('PORCCOMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCCOMISION')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('ULT_EMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ULT_EMISION')).Currency := True;

  if sdqConsulta.FieldByName('MASASALARIAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MASASALARIAL')).Currency := True;

  if sdqConsulta.FieldByName('SUMA_FIJA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SUMA_FIJA')).Currency := True;

  if sdqConsulta.FieldByName('DEUDAEXIGIBLE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDAEXIGIBLE')).Currency := True;

  if sdqConsulta.FieldByName('PORCMASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCMASA')).DisplayFormat := '% 0.0000;-% 0.0000';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.FormateaTexto(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  try
    if Sender.FieldName =  'PORCCOMISION' then
      Text := CurrToStrF(StrToCurr(Sender.AsString), ffNumber, 2)
    else
      Text := Sender.AsString;
  except
    Text := Sender.AsString;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEntidadVendedor.edVC_PORCCOMISIONChange(Sender: TObject);
begin
  if ( edVC_PORCCOMISION.Text <> '' ) then
    if StrToFloat( edVC_PORCCOMISION.Text ) > edVC_PORCCOMISION.MaxValue then
    begin
      MessageDlg('La comisión no puede ser mayor de 100.', mtError, [mbOK], 0);
      edVC_PORCCOMISION.Value := 0;
      edVC_PORCCOMISION.SelectAll;
    end;
end;

procedure TfrmConsEntidadVendedor.tbnfpAceptarClick(Sender: TObject);
begin
  Verificar(frafpEntidadCUIT.Value = 0, frafpEntidadCUIT.edEN_CODBANCO, 'La nueva entidad es obligatoria.');
  Verificar(frafpVendedor.Value = 0, frafpVendedor.edCodigo, 'El nuevo vendedor es obligatorio.');
  Verificar(edfpPeriodoHasta.Periodo.Valor = '', edfpPeriodoHasta, 'La vigencia Hasta es obligatoria.');
//  Verificar(edfpPeriodoHasta.Periodo.Valor < edfpPeriodoDesde.Periodo.Valor, edfpPeriodoHasta, 'La vigencia Hasta debe ser mayor o igual a la vigencia Desde.');

  if MsgAsk(Format('¿Esta ud. seguro de trasladar los contratos al vendedor %s desde el período %s?',
                   [frafpVendedor.cmbDescripcion.Text, FormatPeriodo(AddPeriodo(edfpPeriodoHasta.Periodo.Valor, 1))]), 'Confirmación') then
    fpCambiaVendedor.ModalResult := 1;
end;

procedure TfrmConsEntidadVendedor.tbnfpCancelarClick(Sender: TObject);
begin
  fpCambiaVendedor.ModalResult := -1;
end;

procedure TfrmConsEntidadVendedor.tbCambiarVendedorClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.Eof then
  begin

    if not fraEntidad.IsSelected then
      InfoHint(nil, 'Debe seleccionar la entidad para el traslado de contratos.', True);

    if not fraVendedor.IsSelected then
      InfoHint(nil, 'Debe seleccionar el vendedor para el traslado de contratos.', True);

    //Reseteo el resto de los controles
    edVC_PORCCOMISION.Clear;
    frafpEntidadCUIT.Clear;
    frafpVendedor.Clear;
    edfpPeriodoHasta.Clear;

    //Muetro el formaulario
    if fpCambiaVendedor.ShowModal = 1 then
    begin
      EjecutarStoreEx('Comision.Do_CambioEntVend(:IdEntVend_Viejo, :IdEntVend_Nuevo, :VC_PORCCOMISION, :VigHasta, :UserID);',
                      [sdqConsulta.FieldByName ('EV_ID').AsString, IDEntidadVendedor, edVC_PORCCOMISION.Value, edfpPeriodoHasta.Text, Sesion.UserID]);

      tbRefrescarClick(nil);
    end;

  end else
    InfoHint(nil, 'No posee contratos para trasladar.', True);
end;

procedure TfrmConsEntidadVendedor.OnEntidadChange(Sender: TObject);
begin
  frafpVendedor.Entidad   := frafpEntidadCUIT.Value;
  edVC_PORCCOMISION.Value := ComisionDefault;
end;

procedure TfrmConsEntidadVendedor.OnVendedorChange(Sender: TObject);
begin
  frafpEntidadCUIT.Vendedor := frafpVendedor.Value;
  edVC_PORCCOMISION.Value   := ComisionDefault;
end;

function TfrmConsEntidadVendedor.ComisionDefault: extended;
begin
  if ( frafpVendedor.IsSelected ) AND ( frafpEntidadCUIT.IsSelected ) then
    result := ValorSql ('SELECT EV_PORCCOMISION FROM XEV_ENTIDADVENDEDOR WHERE ' +
                        'EV_IDVENDEDOR = ' + IntToStr( frafpVendedor.Value ) +
                        ' AND EV_IDENTIDAD = ' + IntToStr( frafpEntidadCUIT.Value ))
  else
    result := 0;
end;

function TfrmConsEntidadVendedor.IDEntidadVendedor: string;
begin
  if ( frafpVendedor.IsSelected ) AND ( frafpEntidadCUIT.IsSelected ) then
    result := ValorSQL ( ' SELECT EV_ID FROM XEV_ENTIDADVENDEDOR ' +
                         ' WHERE EV_IDENTIDAD = ' + IntToStr( frafpEntidadCUIT.Value ) +
                         ' AND EV_IDVENDEDOR = ' + IntToStr( frafpVendedor.Value ) +
                         ' AND EV_FECHABAJA IS NULL')
  else
    result := '';
end;

procedure TfrmConsEntidadVendedor.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmConsEntidadVendedor.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmConsEntidadVendedor.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    if Column = 'EMPLEADOS' then
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
    else
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

end.

