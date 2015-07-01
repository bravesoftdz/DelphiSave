unit unGeneracionCartasAdmin;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   14-11-03
 ULTIMA MODIFICACION: 21-11-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unBaseGeneracionCartas, SDEngine, Db, Placemnt, artSeguridad, unArtFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, StdCtrls, RxRichEd,
  unFraToolbarRTF, ExtCtrls, unArtDbFrame, unFraEmpresa, unArt, unArtDBAwareFrame,
  unFraTrabajador, SinEdit, unfraDireccion, unFraDomicilio, FormPanel,
  ComCtrls, ToolWin, unFraCodigoDescripcion, unfraCtbTablas, unfraPrestador;

type
  TfrmGeneracionCartasAdmin = class(TfrmBaseGeneracionCartas)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbTrabajador: TGroupBox;
    fraTrabajador: TfraTrabajador;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    edTrabajador: TEdit;
    Label42: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    fpCambiarDomicilioCarta: TFormPanel;
    btnAceptarDom: TButton;
    btnCancelarDom: TButton;
    ToolBar1: TToolBar;
    tbModifDomic: TToolButton;
    pnlDestinatario: TPanel;
    lblDestinatario: TLabel;
    fraDestinatario: TfraCtbTablas;
    pnlDestNombre: TPanel;
    edNombre: TEdit;
    lOtroNombre: TLabel;
    pnlPrestador: TPanel;
    fraPrestador: TfraPrestador;
    lblPrestador: TLabel;
    Panel3: TPanel;
    fraDomicilio: TfraDomicilio;
    Label11: TLabel;
    lblDestiOriginal: TLabel;
    chkSerolOdont: TCheckBox;
    procedure edSiniestroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModifDomicClick(Sender: TObject);
    procedure btnCancelarDomClick(Sender: TObject);
    procedure btnAceptarDomClick(Sender: TObject);
    procedure fraCodigoModuloExit(Sender: TObject);
  private
    FPermitirSinRechazado: Boolean;

    procedure onFraPrestadorChange(Sender:TObject);      // TK 29251
    procedure OnFraCodigoModuloChange(Sender:TObject);   // TK 29251
    procedure Do_MostrarDomicilioDefaultEmpresa;    // Lu TK 5000

    function ExisteSiniestro: boolean;   // por TK 29254
    function ValidarSiniestro: boolean;  // por TK 29254
    function CartasExigeCambioDomic: boolean; // por TK 29254
  protected
    bCambioDomicilio: Boolean;  // Lu TK 5000
    procedure onFraDestinatarioChange(Sender: TObject);
    procedure DoGuardarCampos; override;
    function Validar: Boolean; override;
    procedure Do_habilitarPnlDestinatario(sDestinatario: string); // TK 29251
    procedure Do_MostrarDomicilioCDC;   // Lu TK 5000
    procedure Do_MostrarDomicilioDefault;    // Lu TK 2470
  public
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); override;
    property PermitirSinRechazado: Boolean   read FPermitirSinRechazado   write FPermitirSinRechazado   default False;
  end;

var
  frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin;
implementation

Uses
  unCustomDataModule, unDmPrincipal, unPrincipal, VCLExtra, AnsiSql, CustomDlgs,
  unSesion, unComunes, General, unredpres;

Const
  // de la Ctb_tablas con tb_clave = 'DESTI'.
  DESTI_TRABAJADOR = '2';
  DESTI_OTROS      = '5';
  DESTI_PRESTADOR  = '7';  // TK 29251 : 7 = destinatario Prestador.
  DESTI_EMPRESA    = '1';
{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.Preparar(AIdCarta: TTableId);
var
  sSql :String;
begin
  inherited Preparar(AIdCarta);
  TransMode        := tmBeginEnd;
  bCambioDomicilio := False;
  if ModoABM = maAlta then
  begin
    gbSiniestro.Visible     := True;
    gbTrabajador.Visible    := False;
    gbEmpresa.Visible       := False;
    edSiniestro.Clear;
    edTrabajador.Clear;
    tbModifDomic.Enabled    := True;
  end
  else if ModoABM = maModificacion then
  begin
    tbModifDomic.Enabled    := False;
    gbSiniestro.Visible     := False;
    fraEmpresa.ShowBajas    := True;
    fraTrabajador.ShowBajas := True;
    if (sdqDatos.FieldByName('CA_IDENDOSO').AsInteger > 0) then
    begin
      sSql := 'SELECT en_contrato ' +
               ' FROM aen_endoso ' +
              ' WHERE en_id = :idend ';
      gbEmpresa.Visible     := True;
      gbTrabajador.Visible  := False;
      fraEmpresa.Contrato   := ValorSqlIntegerEx(sSql, [sdqDatos.FieldByName('CA_IDENDOSO').AsInteger]);
    end
    else begin
      sSql := 'SELECT tj_cuil ' +
               ' FROM ctj_trabajador ' +
              ' WHERE tj_id = :idtrab ';
      gbEmpresa.Visible     := False;
      gbTrabajador.Visible  := True;
      fraTrabajador.CUIL    := ValorSqlEx(sSql, [sdqDatos.FieldByName('CA_IDTRABAJADOR').AsInteger]);
    end;
    LockControls([fraEmpresa, fraTrabajador], True);
  end;
  LockControl(fraCodigoCodFirmante, (ModoABM = maModificacion) and not(Seguridad1.Claves.IsActive('CambiarFirmante')));
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.DoGuardarCampos;
var
  IDFormulario: string;
  IdExpediente :Integer;
  sSql, sExigeSiniestro :String;
begin
  inherited;
  sExigeSiniestro := ValorSqlEx('Select at_exigesiniestro ' +
                                 ' From cat_areatexto ' +
                                ' where at_fechabaja is null ' +
                                  ' and at_id = :idarea ', [fraCodigoModulo.Codigo]);
  //Especifico
  if (ModoABM = maAlta) and (sExigeSiniestro = 'S') then   // (sExigeSiniestro = 'S') por TK 29251, para que no guarde ni el ca_idexpediente ni el ca_idformulario si no exige siniestro (que por ahora el no exigir siniestro es un caso solo, el 122 - Prestadores)
  begin
    sdqDatos.FieldByName('CA_MANUAL').AsString := 'S';
    IDFormulario := ValorSql( 'SELECT fo_id ' +
                               ' FROM aco_contrato, afo_formulario, aem_empresa, sex_expedientes ' +
                              ' WHERE fo_id = co_idformulario ' +
                                ' AND co_contrato = art.afiliacion.get_ultcontrato(em_cuit) ' +
                                ' AND co_idempresa = em_id ' +
                                ' AND em_cuit = ex_cuit ' +
                                ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                                ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                                ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida));

    sSql := 'SELECT tc_destinatario FROM ctc_textocarta ' +
            ' WHERE tc_id = :IdTexto ';
    if (ValorSqlEx(sSql, [sdqDatos.FieldByName('CA_IDTEXTOCARTA').AsInteger]) = 2) then //si es al trabajador
      sdqDatos.FieldByName('CA_IDTRABAJADOR').AsInteger := ValorSqlInteger('SELECT tj_id ' +
                                                                            ' FROM ctj_trabajador, sex_expedientes ' +
                                                                           ' WHERE tj_cuil = ex_cuil ' +
                                                                             ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                                                                             ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                                                                             ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida))
    else
      sdqDatos.FieldByName('CA_IDENDOSO').AsInteger := ValorSql( SqlSimpleQuery( 'ART.AFILIACION.GET_ULTENDOSO(' + IDFormulario + ')' ));

    IdExpediente := ValorSqlInteger('SELECT art.siniestro.get_idexpediente( ' +
                                            SqlInt(edSiniestro.Siniestro) + ',' +
                                            SqlInt(edSiniestro.Orden) + ',' +
                                            SqlInt(edSiniestro.Recaida) + ') FROM dual');
    sdqDatos.FieldByName('CA_IDEXPEDIENTE').AsInteger := IdExpediente;
    sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger := StrToInt(IDFormulario);

    if chkSerolOdont.Checked then
      sdqDatos.FieldByName('ca_marcagrupomixto').AsString := 'S';

    bCambioDomicilio := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmGeneracionCartasAdmin.Validar: Boolean;
var sExigeDest: string;
begin
  Result := False;
  if ValidarSiniestro then
  begin
    sExigeDest := ValorSqlEx('SELECT tc_exigedest FROM comunes.ctc_textocarta ' +
                             ' WHERE tc_codigo = :CodCarta',[fraCodigoCodTexto.edCodigo.text]);
    Verificar(((ModoABM = maAlta) and (sExigeDest = 'S') and (not bCambioDomicilio)) OR
              ((ModoABM = maAlta) and (not bCambioDomicilio) and CartasExigeCambioDomic) , nil,
              'Debe modificar el domicilio del Destinatario para este tipo de Carta.');

    verificar(chkSerolOdont.Checked and (not esSiniestroMixto(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)),
              chkSerolOdont, 'El siniestro no está marcado como mixto serológico u odontológico');

    verificar(chkSerolOdont.Checked and (ValorSqlEx('select at_permitemarcarmixto from cat_areatexto where at_id = :id', [fraCodigoModulo.Codigo]) <> 'S'),
              chkSerolOdont, 'El área de la carta no permite esta condición');

    inherited Validar;
    Result := ValidarEmpresaConfidencial(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida,
                                       ValorSqlEx('SELECT at_area FROM cat_areatexto ' +
                                                  ' WHERE at_id = :id', [StrToInt(fraCodigoModulo.Codigo)]));
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.edSiniestroExit(Sender: TObject);
begin
  if ExisteSiniestro then
  begin
    edTrabajador.Text := ValorSql(' SELECT tj_nombre ' +
                                    ' FROM sex_expedientes, ctj_trabajadores ' +
                                   ' WHERE ex_cuil = tj_cuil ' +
                                     ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida));
  end
  else begin
    edSiniestro.Clear;
    edTrabajador.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  FPermitirSinRechazado := False;
  fraDestinatario.OnChange   := OnFraDestinatarioChange;   // TK 5000
  fraPrestador.OnChange      := OnFraPrestadorChange;      // TK 29251
  fraCodigoModulo.OnChange   := OnFraCodigoModuloChange;   // TK 29251

  LockControls([edNombre], True);
  fraDestinatario.Clave     := 'DESTI';
  fraDestinatario.ShowBajas := False;
  fraDestinatario.ExtraCondition := ' AND tb_codigo IN (1,2,5,7)';    // TK 29251: agrego el 7 - (Prestador)
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.tbModifDomicClick(Sender: TObject);          // Lu TK 2470
var sSql, sDesti: string;
begin
  inherited;
  if ValidarSiniestro then
  begin
      Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto, 'Debe completar el campo Texto para ingresar a dicha opción.');

      sSql   := 'SELECT tc_destinatario FROM CTC_TEXTOCARTA WHERE tc_codigo = ' + SqlValue(fraCodigoCodTexto.edCodigo.text);
      sDesti := ValorSql(sSql);     // calculo el Destinatario original de la carta
      Verificar((sDesti = '') or ((sDesti <> DESTI_TRABAJADOR) and (sDesti <> DESTI_OTROS) and (sDesti <> DESTI_PRESTADOR)), nil, 'El destinatario de la carta debe ser el "Trabajador", "Otros" ó "Prestador" para acceder a esta opción.');

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
end;

procedure TfrmGeneracionCartasAdmin.btnCancelarDomClick(Sender: TObject);
begin
  inherited;
  fpCambiarDomicilioCarta.ModalResult := mrCancel;
end;

procedure TfrmGeneracionCartasAdmin.btnAceptarDomClick(Sender: TObject);
var sNombreDestinatario, sDesti, sSql: string;
begin
  inherited;
  Verificar( (not fraDestinatario.edCodigo.ReadOnly) and fraDestinatario.IsEmpty, fraDestinatario, 'El Destinatario no puede ser nulo');
  Verificar( (not edNombre.ReadOnly) and (edNombre.Text = ''), edNombre, 'El Nombre del destinatario no puede ser nulo');
  Verificar( (not fraPrestador.Locked) and fraPrestador.IsEmpty, fraPrestador, 'El Prestador no puede ser nulo');
  Verificar(fradomicilio.IsEmpty, fraDomicilio, 'El Domicilio no puede estar vacio');


  // Tengo que evaluar esto dos veces (aca y en tbModifDomicClick) porque no me toma el OnChange del fraCodigoCodTexto
  sSql   := 'SELECT tc_destinatario FROM CTC_TEXTOCARTA WHERE tc_codigo = ' + SqlValue(fraCodigoCodTexto.edCodigo.text);
  sDesti := ValorSql(sSql);

  if sDesti = DESTI_TRABAJADOR then
    sNombreDestinatario := edTrabajador.Text
  else if sDesti = DESTI_OTROS then
    sNombreDestinatario := edNombre.Text
  else if sDesti = DESTI_PRESTADOR then           // TK 29251
    sNombreDestinatario := fraPrestador.NombreFantasia;

  IdDestinCarta := DoActualizarDestinatarioCarta(True,
                                                 sNombreDestinatario,
                                                 fraDomicilio.Calle,
                                                 fraDomicilio.Numero,
                                                 fraDomicilio.Piso,
                                                 fraDomicilio.Departamento,
                                                 fraDomicilio.CodigoPostal,
                                                 fraDomicilio.CPA,
                                                 fraDomicilio.Localidad,
                                                 IntToStr(fraDomicilio.Prov),
                                                 ART_EMPTY_ID,                 // TK 29251 le paso el empty id porque no se estaba pasando nada hasta ahora, y como agregué el parametro de Prestador al final, era necesario.
                                                 fraPrestador.Value);          // TK 29251

  bCambioDomicilio := True;      // Lu TK 5000
  fpCambiarDomicilioCarta.ModalResult := mrOk;
  MsgBox('Se ha guardado el domicilio con éxito.')
end;

// Do_MostrarDomicilioDefault: va a mostrar por default el domicilio del trabajador, ya que siempre se mostrara en un alta de una carta nueva.
procedure TfrmGeneracionCartasAdmin.Do_MostrarDomicilioDefault;        // Lu TK 2470
var sSql:string;
begin
  sSql := 'SELECT tj_id, tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                ' tj_cpostal, tj_cpostala, tj_localidad, tj_provincia, pv_descripcion Provincia ' +
           ' FROM art.sex_expedientes, ctj_trabajador, cpv_provincias ' +
          ' WHERE ex_idtrabajador = tj_id ' +
            ' AND pv_codigo = tj_provincia ' +
            ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
            ' AND ex_orden = ' + edSiniestro.OrdenSql +
            ' AND ex_recaida = ' + edSiniestro.RecaidaSql;
  with GetQuery(sSql) do
  try
    fraDomicilio.Cargar(FieldByName('TJ_CALLE').AsString,
                        FieldByName('TJ_CPOSTAL').AsString,
                        FieldByName('TJ_LOCALIDAD').AsString,
                        FieldByName('TJ_NUMERO').AsString,
                        FieldByName('TJ_PISO').AsString,
                        FieldByName('TJ_DEPARTAMENTO').AsString,
                        FieldByName('PROVINCIA').AsString,
                        FieldByName('TJ_CPOSTALA').AsString );
    edNombre.Text := FieldByName('TJ_NOMBRE').AsString;
  finally
    Free;
  end;
end;

procedure TfrmGeneracionCartasAdmin.Do_MostrarDomicilioDefaultEmpresa;   // TK 5000
var sSql:string;
begin
  sSql := 'SELECT em_nombre, dc_calle, dc_numero, dc_piso, dc_departamento, ' +
                ' dc_cpostal, dc_cpostala, dc_localidad, dc_provincia, pv_descripcion Provincia ' +
           ' FROM art.sex_expedientes, afi.AEM_EMPRESA, afi.ACO_CONTRATO, ' +
                ' afi.adc_domiciliocontrato, art.cpv_provincias ' +
          ' WHERE em_id = co_idempresa ' +
            ' AND co_contrato = dc_contrato ' +
            ' AND ex_contrato = co_contrato ' +
            ' AND pv_codigo = dc_provincia ' +
            ' AND dc_tipo = ''P'' ' +
            ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
            ' AND ex_orden = ' + edSiniestro.OrdenSql +
            ' AND ex_recaida = ' + edSiniestro.RecaidaSql;
  with GetQuery(sSql) do
  try
    fraDomicilio.Cargar(FieldByName('DC_CALLE').AsString,
                        FieldByName('DC_CPOSTAL').AsString,
                        FieldByName('DC_LOCALIDAD').AsString,
                        FieldByName('DC_NUMERO').AsString,
                        FieldByName('DC_PISO').AsString,
                        FieldByName('DC_DEPARTAMENTO').AsString,
                        FieldByName('PROVINCIA').AsString,
                        FieldByName('DC_CPOSTALA').AsString );
     edNombre.Text := FieldByName('EM_NOMBRE').AsString;
  finally
    Free;
  end;
end;

procedure TfrmGeneracionCartasAdmin.Do_MostrarDomicilioCDC;
var sSql: String;
begin
  if (IdDestinCarta > 0) then
  begin
    sSql := 'SELECT dc_nombre, dc_calle, dc_numero, dc_piso, dc_departamento, ' +
                  ' dc_cpostal, dc_cpostala, dc_localidad, dc_provincia, pv_descripcion Provincia ' +
             ' FROM CDC_DESTINATARIOCARTA, cpv_provincias ' +
            ' WHERE pv_codigo = dc_provincia ' +
              ' AND dc_id = ' + SqlInt(IdDestinCarta);

    with GetQuery(sSql) do
    try
      fraDomicilio.Cargar(FieldByName('DC_CALLE').AsString,
                          FieldByName('DC_CPOSTAL').AsString,
                          FieldByName('DC_LOCALIDAD').AsString,
                          FieldByName('DC_NUMERO').AsString,
                          FieldByName('DC_PISO').AsString,
                          FieldByName('DC_DEPARTAMENTO').AsString,
                          FieldByName('PROVINCIA').AsString,
                          FieldByName('DC_CPOSTALA').AsString );
      edNombre.Text := FieldByName('DC_NOMBRE').AsString;
      Repaint;
    finally
      Free;
    end;
  end;
end;

procedure TfrmGeneracionCartasAdmin.onFraPrestadorChange(Sender: TObject);     // TK 29251
var sSql: string;
begin
  if not fraPrestador.IsEmpty then
  begin
    sSql := 'Select ca_calle, ca_numero, ca_pisocalle, ca_departamento, ca_codpostala, ca_codpostal, ca_localidad ' +
             ' From art.cpr_prestador ' +
            ' where ca_identificador = ' + SqlInt(fraprestador.IDPrestador);
    with GetQuery(sSql) do
    try
      fraDomicilio.Cargar(FieldByName('CA_CALLE').AsString,
                          FieldByName('CA_CODPOSTAL').AsString,
                          FieldByName('CA_LOCALIDAD').AsString,
                          FieldByName('CA_NUMERO').AsString,
                          FieldByName('CA_PISOCALLE').AsString,
                          FieldByName('CA_DEPARTAMENTO').AsString,
                          fraPrestador.Provincia,
                          FieldByName('CA_CODPOSTALA').AsString);
      edNombre.Text := fraPrestador.RazonSocial;
    finally
      Free;
    end;
  end;
end;


procedure TfrmGeneracionCartasAdmin.onFraDestinatarioChange(Sender: TObject);
begin
  if (fraDestinatario.Value = DESTI_OTROS) then   // Otro
  begin
    LockControls([edNombre], False);
    LockControls([fraPrestador],True);
    edNombre.Clear;
    fraDomicilio.Clear;
    fraPrestador.Clear;
  end
  else if (fraDestinatario.Value = DESTI_EMPRESA) then  // Empresa
  begin
    fraPrestador.Clear;
    edNombre.Clear;
    fraDomicilio.Clear;
    LockControls([edNombre, fraPrestador], True);
    Do_MostrarDomicilioDefaultEmpresa;
  end
  else if (fraDestinatario.Value = DESTI_TRABAJADOR) then  // Trabajador
  begin
    fraPrestador.Clear;
    edNombre.Clear;
    fraDomicilio.Clear;
    LockControls([edNombre, fraPrestador], True);
    if bCambioDomicilio then
      Do_MostrarDomicilioCDC
    else
      Do_MostrarDomicilioDefault;
  end
  else if (fraDestinatario.Value = DESTI_PRESTADOR) then  // Prestador TK 29251
  begin
    fraPrestador.Clear;
    edNombre.Clear;
    fraDomicilio.Clear;
    LockControls([edNombre], True);
    LockControls([fraPrestador], False);
  end;
end;

procedure TfrmGeneracionCartasAdmin.Do_habilitarPnlDestinatario(sDestinatario: string);  // TK 29251 Habilita o deshabilita sólo el panel pnlDestinatario
begin
  fraDestinatario.Clear;
  edNombre.Clear;
  fraPrestador.Clear;

  if sDestinatario = DESTI_TRABAJADOR then
  begin
    lblDestinatario.Enabled := False;
    lOtroNombre.Enabled     := False;
    lblPrestador.Enabled    := False;
    fraPrestador.Enabled    := False;
    LockControls([fraDestinatario, edNombre, fraPrestador], True);
  end
  else if sDestinatario = DESTI_OTROS then
  begin
    lblDestinatario.Enabled := True;
    lOtroNombre.Enabled     := True;
    lblPrestador.Enabled    := True;
    fraPrestador.Enabled    := True;
    LockControls([fraDestinatario, edNombre, fraPrestador], False);
  end
  else if sDestinatario = DESTI_PRESTADOR then
  begin
    lblDestinatario.Enabled := False;
    lOtroNombre.Enabled     := False;
    lblPrestador.Enabled    := True;
    fraPrestador.Enabled    := True;
    LockControls([fraDestinatario, edNombre], True);
    LockControl(fraPrestador, False);
  end;

end;

function TfrmGeneracionCartasAdmin.ExisteSiniestro: boolean;
var sRechazado: string;
begin
  if PermitirSinRechazado then
    sRechazado := ''
  else
    sRechazado := ',''02''';

  Result :=  ExisteSql(' SELECT 1 FROM sex_expedientes ' +
                        ' WHERE ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                          ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                          ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida) +
                          ' AND NVL(ex_causafin, ''0'') NOT IN (''99'',''95''' + sRechazado + ')');
end;

function TfrmGeneracionCartasAdmin.ValidarSiniestro: boolean;   // Valida solo en el caso que exigesiniestro, sino no. Valido por ahora para el area 122 - Prestadores (ahi no valida) TK 29251
var sSql:string;
begin
  sSql := 'Select at_exigesiniestro ' +
           ' From cat_areatexto ' +
          ' where at_fechabaja is null ' +
            ' and at_id = :idarea ';
  with GetQueryEx(sSql, [fraCodigoModulo.Codigo]) do
  try
    if (FieldByName('AT_EXIGESINIESTRO').AsString = 'S') and (ModoABM = maAlta) and(edSiniestro.IsEmpty) then
      Verificar(not ExisteSiniestro, edSiniestro, 'Debe seleccionar el siniestro para realizar esta acción: El Siniestro seleccionado no existe o se encuentra cerrado.');
  finally
    Free;
  end;
  Result := True;
end;

// Se fija si exige cambio de domicilio las cartas de este area. Hecho por las cartas que se envian a los Prestadores (TK 29251) que requieren que completen el domicilio del prestador.
function TfrmGeneracionCartasAdmin.CartasExigeCambioDomic: boolean;    // TK 29251
var sExige : string;
begin
  sExige := ValorSqlEx('Select at_exigecambiodomic ' +
                        ' From cat_areatexto ' +
                        ' where at_fechabaja is null ' +
                          ' and at_id = :idarea ', [fraCodigoModulo.Codigo]);

  Result := IIF(sExige = 'S', True, False);
end;

procedure TfrmGeneracionCartasAdmin.OnFraCodigoModuloChange(Sender: TObject); // TK 29251
var sExigeSiniestro: string;
begin
   sExigeSiniestro := ValorSqlEx('Select at_exigesiniestro ' +
                                  ' From cat_areatexto ' +
                                 ' where at_fechabaja is null ' +
                                   ' and at_id = :idarea ', [fraCodigoModulo.Codigo]);
   LockControl(edSiniestro, (sExigeSiniestro = 'N'));    // Deshabilita el Siniestro si no exige siniestro.

end;

procedure TfrmGeneracionCartasAdmin.fraCodigoModuloExit(Sender: TObject);
begin
  inherited;
  OnFraCodigoModuloChange(Self);
end;

end.
