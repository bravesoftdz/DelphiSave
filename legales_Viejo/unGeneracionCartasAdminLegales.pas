unit unGeneracionCartasAdminLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unGeneracionCartasAdmin, SDEngine, DB, Placemnt, artSeguridad,
  unfraCtbTablas, unFraDomicilio, FormPanel, StdCtrls, SinEdit,
  unFraTrabajador, unArtDbFrame, unFraEmpresa, unFraCodigoDescripcion,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, ComCtrls, ToolWin, RxRichEd, unFraToolbarRTF,
  ExtCtrls, unArt, unBaseGeneracionCartas, AnsiSql, unSesion, unRptCartaDocumento,
  unRptCartaDocHeader, unfraPrestador;

type
  TfrmGeneracionCartasAdminLegales = class(TfrmGeneracionCartasAdmin)
    Label12: TLabel;
    procedure edSiniestroExit(Sender: TObject);
    procedure fraEmpresaExit(Sender: TObject);
    procedure tbModifDomicClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    pbExisteTextoFinal: Boolean;
    procedure FiltroMotivo;

    { Private declarations }
  public
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); override;
    procedure DoGuardarCampos; override;
    { Public declarations }
  protected
    function Validar: Boolean;override;
    procedure CargarComponentes;override;
  end;

var
  frmGeneracionCartasAdminLegales: TfrmGeneracionCartasAdminLegales;

implementation

uses Math, unDmPrincipal,DbFuncs, unComunes;

{$R *.dfm}

procedure TfrmGeneracionCartasAdminLegales.CargarComponentes;
begin
  inherited;
  fraCodigoModulo.Sql :=
          'SELECT DISTINCT AT_ID AS ' + CD_ALIAS_ID + ', ' +
                          'AT_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                          'AT_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                          'AT_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                     'FROM CAT_AREATEXTO, CAU_AREAUSUARIO, comunes.cad_areadestinatario ' +
                    'WHERE AT_ID=AU_IDAREATEXTO ' +
                      'AND AT_ID = AD_IDAREATEXTO '+
                      'AND AD_TIPODESTINATARIO = ''L'' '+
                      'AND AU_USUARIO=' + SqlValue(Sesion.UserId) +
                      'AND AU_FECHABAJA IS NULL ' +
                      'AND AT_AREA IN (' + CodArea + ')';
end;

procedure TfrmGeneracionCartasAdminLegales.Preparar(AIdCarta : TTableId);
begin
  inherited Preparar(AIdCarta);
  if ModoABM = maAlta then
  begin
    gbSiniestro.Visible     := True;
    gbEmpresa.Visible       := true;
    edSiniestro.Clear;
    edTrabajador.Clear;
  end;

end;

procedure TfrmGeneracionCartasAdminLegales.FiltroMotivo;
begin
  if not edSiniestro.IsEmpty then
    fraCodigoModulo.Sql :=
          'SELECT DISTINCT AT_ID AS ' + CD_ALIAS_ID + ', ' +
                          'AT_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                          'AT_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                          'AT_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                     'FROM CAT_AREATEXTO, CAU_AREAUSUARIO, comunes.cad_areadestinatario ' +
                    'WHERE AT_ID=AU_IDAREATEXTO ' +
                      'AND AT_ID = AD_IDAREATEXTO '+
                      'AND AD_TIPODESTINATARIO = ''S'' '+
                      'AND AU_USUARIO=' + SqlValue(Sesion.UserId) +
                      'AND AU_FECHABAJA IS NULL ' +
                      'AND AT_AREA IN (' + CodArea + ')'
  else if fraEmpresa.IsSelected then
    fraCodigoModulo.Sql :=
          'SELECT DISTINCT AT_ID AS ' + CD_ALIAS_ID + ', ' +
                          'AT_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                          'AT_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                          'AT_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                     'FROM CAT_AREATEXTO, CAU_AREAUSUARIO, comunes.cad_areadestinatario ' +
                    'WHERE AT_ID=AU_IDAREATEXTO ' +
                      'AND AT_ID = AD_IDAREATEXTO '+
                      'AND AD_TIPODESTINATARIO = ''E'' '+
                      'AND AU_USUARIO=' + SqlValue(Sesion.UserId) +
                      'AND AU_FECHABAJA IS NULL ' +
                      'AND AT_AREA IN (' + CodArea + ')'

  else
    fraCodigoModulo.Sql :=
          'SELECT DISTINCT AT_ID AS ' + CD_ALIAS_ID + ', ' +
                          'AT_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                          'AT_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                          'AT_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                     'FROM CAT_AREATEXTO, CAU_AREAUSUARIO, comunes.cad_areadestinatario ' +
                    'WHERE AT_ID=AU_IDAREATEXTO ' +
                      'AND AT_ID = AD_IDAREATEXTO '+
                      'AND AD_TIPODESTINATARIO = ''L'' '+
                      'AND AU_USUARIO=' + SqlValue(Sesion.UserId) +
                      'AND AU_FECHABAJA IS NULL ' +
                      'AND AT_AREA IN (' + CodArea + ')';
//                      'AND 1 = 2';  //Para no permitir libres
end;

procedure TfrmGeneracionCartasAdminLegales.edSiniestroExit(
  Sender: TObject);
var
  sRechazado: String;
begin
  if PermitirSinRechazado then
    sRechazado := ''
  else
    sRechazado := ',''02''';

  if ExisteSql(' SELECT 1 FROM sex_expedientes ' +
                ' WHERE ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                  ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                  ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida) +
                  ' AND NVL(ex_causafin, ''0'') NOT IN (''99'',''95''' + sRechazado + ')') then
  begin
    edTrabajador.Text := ValorSql(' SELECT tj_nombre ' +
                                    ' FROM sex_expedientes, ctj_trabajadores ' +
                                   ' WHERE ex_cuil = tj_cuil ' +
                                     ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida));
  end;
  FiltroMotivo;
end;

procedure TfrmGeneracionCartasAdminLegales.fraEmpresaExit(Sender: TObject);
begin
  inherited;
  FiltroMotivo;
end;

procedure TfrmGeneracionCartasAdminLegales.DoGuardarCampos;
begin
  if edSiniestro.Text <> '' then
    inherited
  else
  begin
    if fraEmpresa.IsSelected then
    begin
      sdqDatos.FieldByName('CA_IDENDOSO').AsInteger := ValorSqlIntegerEx('SELECT Afiliacion.Get_UltIdEndoso(:contrato) FROM DUAL', [fraEmpresa.Contrato]);
      sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger := ValorSqlIntegerEx('SELECT CO_IDFORMULARIO FROM ACO_CONTRATO WHERE CO_CONTRATO = :contrato', [fraEmpresa.Contrato]);
    end;

    sdqDatos.FieldByName('CA_IDAREATEXTO').Value      := fraCodigoModulo.Value;
    sdqDatos.FieldByName('CA_IDTEXTOCARTA').Value     := fraCodigoCodTexto.Value;
    sdqDatos.FieldByName('CA_IDFIRMA').Value          := fraCodigoCodFirmante.Value;
    sdqDatos.FieldByName('CA_CORREO').AsString        := fraCtbTablasCorreo.Value;
    sdqDatos.FieldByName('CA_TIPOSALIDA').AsString    := fraCtbTablasTipoSalida.Value;
    sdqDatos.FieldByName('CA_OBSERVACIONES').AsString := edObservaciones.Lines.Text;
    if not fraARTs.IsEmpty then
      sdqDatos.FieldByName('CA_IDART').Value          := fraARTs.Value;
    if edTexto.Modified Then
      TStringToField(edTexto.Lines, sdqDatos.FieldByName('CA_TEXTOFINAL'))
    else if not pbExisteTextoFinal then
      sdqDatos.FieldByName('CA_TEXTOFINAL').AsVariant := Null;
  end;
end;

function TfrmGeneracionCartasAdminLegales.Validar: Boolean;
var
  sDesti :String;
  sExigeDest: string;
begin
  sExigeDest := ValorSqlEx('SELECT tc_exigedest FROM comunes.ctc_textocarta ' +
                           ' WHERE tc_codigo = :CodCarta',[fraCodigoCodTexto.edCodigo.text]);
  Verificar((ModoABM = maAlta) and (sExigeDest = 'S') and (not bCambioDomicilio), nil,
            'Debe modificar el domicilio del Destinatario para este tipo de Carta.');
  Verificar(fraCodigoModulo.IsEmpty, fraCodigoModulo.edCodigo, 'El módulo es obligatorio');
  Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto.edCodigo, 'El texto es obligatorio');
  Verificar(fraCtbTablasTipoSalida.IsEmpty, fraCtbTablasTipoSalida.edCodigo, 'El formato es obligatorio');
  Verificar(fraCodigoCodFirmante.IsEmpty, fraCodigoCodFirmante.edCodigo, 'El firmante es obligatorio');
  Verificar(fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo.edCodigo, 'El correo es obligatorio');
  sDesti := ValorSqlEx('SELECT tc_destinatario ' +
                        ' FROM ctc_textocarta ' +
                       ' WHERE tc_codigo = :IdTexto', [fraCodigoCodTexto.Codigo]);
  Verificar((sDesti = DESTI_ART) and fraARTs.IsEmpty, fraARTs, 'El código de ART es obligatorio según el Texto seleccionado');
  Verificar((sDesti <> DESTI_ART) and not(fraARTs.IsEmpty), fraARTs, 'No debe seleccionar código de ART para el Texto seleccionado');
  Verificar(Trim(EdTexto.Text) = '', EdTexto, 'El texto de la carta no puede quedar en blanco');
  Result := ValidarEmpresaConfidencial(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida,
                                       ValorSqlEx('SELECT at_area FROM cat_areatexto ' +
                                                  ' WHERE at_id = :id', [StrToInt(fraCodigoModulo.Codigo)]));
end;

procedure TfrmGeneracionCartasAdminLegales.tbModifDomicClick(
  Sender: TObject);
var
  sSql, sDesti: string;  
begin
  Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto, 'Debe completar el campo Texto para ingresar a dicha opción.');
  sSql   := 'SELECT tc_destinatario FROM CTC_TEXTOCARTA WHERE tc_codigo = ' + SqlValue(fraCodigoCodTexto.edCodigo.text);
  sDesti := ValorSql(sSql);
  Verificar((sDesti = '') or ((sDesti <> DESTI_TRABAJADOR) and (sDesti <> DESTI_OTROS)), nil, 'El destinatario de la carta debe ser el Trabajador u Otros para acceder a esta opción.');

  {if sDesti = DESTI_TRABAJADOR then
  begin
    pnlDestinatario.Visible := False;
    if bCambioDomicilio then
      Do_MostrarDomicilioCDC
    else
      Do_MostrarDomicilioDefault;
  end
  else if sDesti = DESTI_OTROS then  // TK 5000
  begin
    pnlDestinatario.Visible := True;
    if bCambioDomicilio then
      Do_MostrarDomicilioCDC
    else begin
      fraDomicilio.Clear;
      fraDestinatario.Clear;
      edNombre.Clear;
    end;
  end;
  }

  if sDesti = DESTI_TRABAJADOR then
  begin
    lblDestiOriginal.Caption := 'Trabajador';
    Do_habilitarPnlDestinatario(DESTI_TRABAJADOR);
    if bCambioDomicilio then
      Do_MostrarDomicilioCDC
    else
      Do_MostrarDomicilioDefault;
  end
  else if sDesti = DESTI_OTROS then   // TK 5000
  begin
    lblDestiOriginal.Caption := 'Otros';
    Do_habilitarPnlDestinatario(DESTI_OTROS);
    if bCambioDomicilio then
      Do_MostrarDomicilioCDC;
  end
  else if sDesti = DESTI_PRESTADOR then // TK 29251
  begin
    lblDestiOriginal.Caption := 'Prestador';
    Do_habilitarPnlDestinatario(DESTI_PRESTADOR);
  end;

  fraDestinatario.Value := sDesti;
  onFraDestinatarioChange(Self);

  fpCambiarDomicilioCarta.ShowModal;
end;

procedure TfrmGeneracionCartasAdminLegales.btnAceptarClick(
  Sender: TObject);
begin
  Verificar(((not bCambioDomicilio) and (not fraEmpresa.IsSelected) and (edSiniestro.Text = '')),
             edTexto, 'Debe Ingresar un domicilio');
  if Validar and DoGuardar then
    if Sender = btnImprimir then
      DoImprimirCarta(IdCarta, taLegales, srPreview, TransMode);
end;

end.
