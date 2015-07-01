unit unBaseGeneracionCartas;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   06-11-03
 ULTIMA MODIFICACION: 16-12-03
}
interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, unArtFrame, unArtDbFrame, Placemnt,
  artSeguridad,Grids, StaticGrid, RxRichEd, unFraToolbarRTF, SDEngine,
  Db, unArt, CurrEdit, Mask, ToolEdit, DateComboBox,
  PeriodoPicker, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unCustomDataModule, unArtDBAwareFrame, unFraCodigoDescripcion, FormPanel;

type
  TAccion = (taAdminCartas, taEventoAlta);
  TModoABM = (maAlta, maModificacion);

  TfrmBaseGeneracionCartas = class(TForm)
    Seguridad1: TSeguridad;
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    sduDatos: TSDUpdateSQL;
    pnlInferior: TPanel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    fraToolbarRTF: TfraToolbarRTF;
    edTexto: TRxRichEdit;
    btnImprimir: TButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pnlSuperior: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    edObservaciones: TMemo;
    Splitter1: TSplitter;
    pnlDatos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraCtbTablasCorreo: TfraStaticCTB_TABLAS;
    fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS;
    fraCodigoModulo: TfraStaticCodigoDescripcion;
    fraCodigoCodFirmante: TfraStaticCodigoDescripcion;
    pnlAdicional: TPanel;
    fraARTs: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    fraCodigoCodTexto: TfraCodigoDescripcion;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraToolbarRTFtbGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    pbExisteTextoFinal: Boolean;
    pUltimoId_fraCodigoCodTexto: TTableId;
    FIDCarta: TTableId;
    fModoABM: TModoABM;
    fCodArea: string;
    fModulo: string;
    fTexto: string;
    fIdDestinCarta: TTableId; // Lu por tk 2470
    fTransMode: TTransactionMode;
    
    procedure DoHabilitarTextoCartaYFirmante(bCartaDocImpresa: Boolean);
    procedure fraCodigoModuloOnChange(Sender: TObject);
    procedure fraCodigoCodTextoOnChange(Sender: TObject);
  protected
    function DoGuardar: boolean; virtual;
    function Validar: Boolean; virtual;
    procedure CargarComponentes; virtual;
    procedure Verificar(Condicion: boolean; AControl: TWinControl; AText: string);
    procedure DoGuardarCampos; virtual;
  public
    property CodArea: string             read fCodArea    write fCodArea;
    property Modulo: string              read fModulo     write fModulo;
    property Texto: string               read fTexto      write fTexto;
    property ModoABM: TModoABM           read fModoABM    write fModoABM;
    property IdCarta: TTableId           read FIdCarta    write FIdCarta;
    property TransMode: TTransactionMode read fTransMode  write fTransMode;
    property IdDestinCarta: TTableId     read fIdDestinCarta write fIdDestinCarta;
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); virtual;
    function Mostrar: boolean; virtual;

  end;

implementation

uses CustomDlgs, AnsiSql, DBFuncs, unDmPrincipal, General,
     VCLExtra, unRptCartaDocHeader, unrptCartaDocumento, SqlFuncs,
     unComunes, unSesion;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoGuardar then
    if Sender = btnImprimir then
      DoImprimirCarta(IdCarta, taCobranzas, srPreview, TransMode);
end;
{------------------------------------------------------------------------------}
function TfrmBaseGeneracionCartas.DoGuardar: boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ' +
                ' ca_observaciones, ca_manual, ca_textofinal, ca_iddelegacion, ' +
                ' ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ' +
                ' ca_idfirmareimpresion, ca_correoreimpresion, ca_idareatexto, ' +
                ' ca_fechaimpresion, ca_iddelegacion, ca_idempdeudora, ca_idendoso, ' +
                ' ca_idformulario, ca_idtrabajador, ca_idexpediente, ca_idart, ' +
                ' ca_iddestinatariocarta, ca_marcagrupomixto ' +
           ' FROM cca_carta ' +
          ' WHERE ca_id = ' + IntToStr(IdCarta);
  sdqDatos.Sql.Text := sSql;
  OpenQuery(sdqDatos);

  if fTransMode = tmBeginEnd then
    BeginTrans;

  if ModoABM = maAlta then
  begin
    sdqDatos.Insert;
    IdCarta := GetSecNextVal('SEQ_CCA_ID');
    sdqDatos.FieldByName('CA_MANUAL').AsString           := 'S';
    sdqDatos.FieldByName('CA_ID').AsInteger              := IdCarta;
    sdqDatos.FieldByName('CA_IDDELEGACION').Value        := Sesion.Delegacion;
    sdqDatos.FieldByName('CA_USUALTA').AsString          := Sesion.UserID;
    sdqDatos.FieldByName('CA_FECHAALTA').AsDateTime      := Date;
    if (fIdDestinCarta <> ART_EMPTY_ID) then
      sdqDatos.FieldByName('CA_IDDESTINATARIOCARTA').AsInteger := fIdDestinCarta;
  end
  else begin
    sdqDatos.Edit;
    sdqDatos.FieldByName('CA_USUMODIF').AsString      := Sesion.UserID;
    sdqDatos.FieldByName('CA_FECHAMODIF').AsDateTime  := Date;
  end;

  DoGuardarCampos;

  sdqDatos.Post;
  sdqDatos.ApplyUpdates;

  if fTransMode = tmBeginEnd then
    CommitTrans;

  Result := True;
  ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
function TfrmBaseGeneracionCartas.Validar: Boolean;
var
  sDesti :String;
begin
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
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.FormCreate(Sender: TObject);
begin
  pUltimoId_fraCodigoCodTexto := ART_EMPTY_ID;
  pbExisteTextoFinal          := False;
  Self.Width                  := Trunc(Screen.Width  * 0.9);
  Self.Height                 := Trunc(Screen.Height * 0.9);
  fraToolbarRTF.Edit          := edTexto;
  ModoABM                     := maAlta;
  fTransMode                  := tmNone;
  fraCodigoCodTexto.Sql := '';
end;
{------------------------------------------------------------------------------}
{ Habilita o deshabilita el ingreso del código del texto de la carta y del firmante }
procedure TfrmBaseGeneracionCartas.DoHabilitarTextoCartaYFirmante(bCartaDocImpresa: Boolean);
var
  bDesHabilitar, bDesHabilitarTexto, bEsModificable: Boolean;
begin
  bDesHabilitar := not fraCodigoModulo.IsSelected;
  fraCodigoCodFirmante.Locked := bDesHabilitar;
  bEsModificable := not(fraCodigoCodTexto.IsEmpty) and
                    (fraCodigoCodTexto.sdqDatos.FieldByName('tc_textomodificable').AsString = 'S');
  bDesHabilitarTexto := (bDesHabilitar or bCartaDocImpresa or not(bEsModificable));
  LockControl(edTexto, bDesHabilitarTexto);
  fraToolbarRTF.Enabled := not bDesHabilitarTexto;
  if bDesHabilitar then
  begin
    fraCodigoCodFirmante.Clear;
    edTexto.Clear;
    edTexto.Modified := False;
    pUltimoId_fraCodigoCodTexto := ART_EMPTY_ID;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.fraCodigoModuloOnChange(Sender: TObject);
var
  sSql: String;
begin
  if fraCodigoModulo.IsEmpty then
    fraCodigoCodTexto.Sql := ''
  else begin
    sSql  := 'SELECT DISTINCT TC_ID AS ' + CD_ALIAS_ID + ', ' +
                             'TC_CODIGO AS ' + CD_ALIAS_CODIGO + ', ' +
                             'TC_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                             'TC_FECHABAJA AS ' + CD_ALIAS_BAJA + ', ' +
                             'TC_TIPOSALIDA, TC_TEXTOMODIFICABLE ' +
               'FROM CTC_TEXTOCARTA, CTA_TEXTOAREA ' +
              'WHERE TC_ID=TA_IDTEXTOCARTA ' +
                'AND TA_FECHABAJA IS NULL ' +
                'AND TA_IDAREATEXTO=' + SqlValue(fraCodigoModulo.Value);

    If ModoABM = maAlta then          // Lu TK 790
      sSql := sSql + ' AND TC_TEXTOALTAMANUAL = ''S'' '
    else if ModoABM = maModificacion then
      sSql := sSql + ' AND (TC_TEXTOMODIFICABLE = ''S'' OR TC_ID = ' + SqlValue(sdqDatos.FieldByName('CA_IDTEXTOCARTA').AsInteger)  + ')';

    fraCodigoCodTexto.Sql := sSql;
  end;

  fraCodigoCodFirmante.Sql := 'SELECT FI_ID AS ' + CD_ALIAS_ID + ', ' +
                                     'FI_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                     'FI_FIRMANTE AS ' + CD_ALIAS_DESC + ', ' +
                                     'FI_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                                'FROM CFI_FIRMA, CFA_FIRMANTEAREA ' +
                               'WHERE FA_IDFIRMANTE=FI_ID ' +
                                 'AND FA_FECHABAJA IS NULL ' +
                                 'AND FA_IDAREATEXTO=' + SqlValue(fraCodigoModulo.Value);

  if Assigned(Sender) and (sdqDatos.Active) then
    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('CA_FECHAIMPRESION').IsNull) ;
  fraCtbTablasTipoSalida.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.fraCodigoCodTextoOnChange(Sender: TObject);
var
  sdqTexto: TSDQuery;
  bCargarTexto, bEsModificable: Boolean;
begin
  if fraCodigoCodTexto.IsEmpty then
    edTexto.Clear
  else begin
    if edTexto.Modified or pbExisteTextoFinal then
      if MsgBox( 'Se reemplazará el texto modificado manualmente por el que ha seleccionado', MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES then
        bCargarTexto := True
      else begin
        bCargarTexto := False;
        {$IFDEF ART2}
        fraCodigoCodTexto.Value := pUltimoId_fraCodigoCodTexto;
        {$ELSE}
        fraCodigoCodTexto.Value := IntToStr(pUltimoId_fraCodigoCodTexto);
        {$ENDIF}
      end
    else
      bCargarTexto := True;

    if bCargarTexto then
    begin
      {$IFDEF ART2}
      pUltimoId_fraCodigoCodTexto := fraCodigoCodTexto.Value;
      {$ELSE}
      if (fraCodigoCodTexto.Value <> '') then
        pUltimoId_fraCodigoCodTexto := StrToInt(fraCodigoCodTexto.Value);
      {$ENDIF}
      sdqTexto := GetQuery('SELECT TC_TEXTO FROM CTC_TEXTOCARTA WHERE TC_ID = ' + SqlInt(pUltimoId_fraCodigoCodTexto));
      try
        FieldToTString(sdqTexto.FieldByName('TC_TEXTO'), edTexto.Lines);
        edTexto.Modified   := False;
        pbExisteTextoFinal := False;
      finally
        sdqTexto.Free;
      end;
    end;

    sdqTexto := GetQuery('SELECT TC_TIPOSALIDA FROM CTC_TEXTOCARTA WHERE TC_ID = ' + SqlInt(pUltimoId_fraCodigoCodTexto));
    try
      fraCtbTablasTipoSalida.Value := sdqTexto.FieldByName('TC_TIPOSALIDA').AsString;
    finally
      sdqTexto.Free;
    end;
  end;

  bEsModificable := not(fraCodigoCodTexto.IsEmpty) and
                    (fraCodigoCodTexto.sdqDatos.FieldByName('tc_textomodificable').AsString = 'S');
  LockControl(edTexto, not(bEsModificable));
  fraToolbarRTF.Enabled := bEsModificable;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.Preparar(AIdCarta: TTableId = ART_EMPTY_ID);
var
  sSql: string;
begin
  CargarComponentes;

  IdCarta   := AIdCarta;
  sSql := 'SELECT ca_id, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ' +
                ' ca_observaciones, ca_manual, ca_textofinal, ca_iddelegacion, ' +
                ' ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ' +
                ' ca_idfirmareimpresion, ca_correoreimpresion, ca_idareatexto, ' +
                ' ca_fechaimpresion, ca_iddelegacion, ca_idempdeudora, ca_idendoso, ' +
                ' ca_idformulario, ca_idtrabajador, ca_idart ' +
           ' FROM cca_carta ' +
          ' WHERE ca_id = ' + IntToStr(AIdCarta);
  sdqDatos.Sql.Text := sSql;
  OpenQuery(sdqDatos);

  if sdqDatos.IsEmpty then
  begin
    ModoABM := maAlta;
    Caption := 'Nueva Carta Documento';
    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('CA_FECHAIMPRESION').IsNull);
  end
  else begin
    ModoABM := maModificacion;
    Caption := 'Modificación de la Carta Documento';
    {$IFDEF ART2}
    fraCodigoModulo.Value       := sdqDatos.FieldByName('CA_IDAREATEXTO').AsInteger;
    {$ELSE}
    fraCodigoModulo.Value       := sdqDatos.FieldByName('CA_IDAREATEXTO').AsString;
    {$ENDIF}
    fraCodigoModuloOnChange(nil);

    if sdqDatos.FieldByName('CA_FECHAIMPRESION').IsNull then
    begin
      {$IFDEF ART2}
      fraCodigoCodFirmante.Value   := sdqDatos.FieldByName('CA_IDFIRMA').AsInteger;
      {$ELSE}
      fraCodigoCodFirmante.Value   := sdqDatos.FieldByName('CA_IDFIRMA').AsString;
      {$ENDIF}
      fraCtbTablasCorreo.Value     := sdqDatos.FieldByName('CA_CORREO').AsString;
    end
    else begin
      fraCtbTablasTipoSalida.Locked := True;
      fraARTs.Locked                := True;
      fraCodigoCodFirmante.Value    := NVL(sdqDatos.FieldByName('CA_IDFIRMAREIMPRESION').Value,
                                           sdqDatos.FieldByName('CA_IDFIRMA').Value);
      fraCtbTablasCorreo.Value      := NVL(sdqDatos.FieldByName('CA_CORREOREIMPRESION').AsString,
                                           sdqDatos.FieldByName('CA_CORREO').AsString);
    end;

    {$IFDEF ART2}
    fraCodigoCodTexto.Value      := sdqDatos.FieldByName('CA_IDTEXTOCARTA').AsInteger;
    pUltimoId_fraCodigoCodTexto  := fraCodigoCodTexto.Value;
    fraARTs.Value                := sdqDatos.FieldByName('CA_IDART').AsInteger ;
    {$ELSE}
    fraCodigoCodTexto.Value      := sdqDatos.FieldByName('CA_IDTEXTOCARTA').AsString;
    if (fraCodigoCodTexto.Value <> '') then
      pUltimoId_fraCodigoCodTexto  := StrToInt(fraCodigoCodTexto.Value);
    fraARTs.Value                := sdqDatos.FieldByName('CA_IDART').AsString ;
    {$ENDIF}
    fraCtbTablasTipoSalida.Value := sdqDatos.FieldByName('CA_TIPOSALIDA').AsString;
    edObservaciones.Text         := AdjustLineBreaks(sdqDatos.FieldByName('CA_OBSERVACIONES').AsString);

    DoHabilitarTextoCartaYFirmante(not sdqDatos.FieldByName('CA_FECHAIMPRESION').IsNull);

    FieldToTString(sdqDatos.FieldByName('CA_TEXTOFINAL'), edTexto.Lines);
    if edTexto.Lines.Count = 0 then
    begin
      pbExisteTextoFinal := False;
      fraCodigoCodTextoOnChange(nil);
    end
    else
      pbExisteTextoFinal := True;
    edTexto.Modified := False;
  end;

  LockControls([fraCodigoModulo, fraCodigoCodTexto], (ModoABM = maModificacion));
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.fraToolbarRTFtbGuardarClick(Sender: TObject);
begin
  fraToolbarRTF.tbGuardarClick(Sender);
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.Verificar(Condicion: boolean; AControl: TWinControl; AText: string);
begin
  begin
    if Condicion then
    begin
      InvalidMsg(AControl, AText);
      Abort;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.CargarComponentes;
begin
  //Los componentes se inicializan aca para poder
  //tener la posibilidad que el usuario setee valores como CodArea...
  with fraCodigoModulo do
  begin
    TableName   := 'CAT_AREATEXTO';
    FieldID     := 'AT_ID';
    FieldCodigo := 'AT_ID';
    FieldDesc   := 'AT_DESCRIPCION';
    FieldBaja   := 'AT_FECHABAJA';
    ShowBajas   := False;
    Sql         := 'SELECT DISTINCT AT_ID AS ' + CD_ALIAS_ID + ', ' +
                          'AT_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                          'AT_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                          'AT_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                     'FROM CAT_AREATEXTO, CAU_AREAUSUARIO ' +
                    'WHERE AT_ID=AU_IDAREATEXTO ' +
                      'AND AU_USUARIO=' + SqlValue(Sesion.UserId) +
                      'AND AU_FECHABAJA IS NULL ' +
                      'AND AT_AREA IN (' + CodArea + ')';
    OnChange    := fraCodigoModuloOnChange;
  end;

  with fraCodigoCodTexto do
  begin
    TableName   := 'CTC_TEXTOCARTA';
    FieldID     := 'TC_ID';
    FieldCodigo := 'TC_CODIGO';
    FieldDesc   := 'TC_NOMBRE';
    FieldBaja   := 'TC_FECHABAJA';
    ExtraFields := ', TC_TEXTOMODIFICABLE ';
    ShowBajas   := False;
    OnChange    := fraCodigoCodTextoOnChange;
  end;

  with fraCtbTablasCorreo do
  begin
    Clave       := 'CORRE';
    ShowBajas   := False;
  end;
  fraCtbTablasCorreo.Value := ValorSql('SELECT TB_CODIGO ' +
                                       '  FROM CTB_TABLAS ' +
                                       ' WHERE TB_CLAVE = ''CORRE''' +
                                       '   AND TB_ESPECIAL1 =''D''');
  with fraCodigoCodFirmante do
  begin
    TableName   := 'CFI_FIRMA';
    FieldID     := 'FI_ID';
    FieldCodigo := 'FI_ID';
    FieldDesc   := 'FI_FIRMANTE';
    FieldBaja   := 'FI_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraCtbTablasTipoSalida do
  begin
    Clave       := 'TSCDO';
    ShowBajas   := False;
  end;

  if fModulo <> '' then
  begin
    {$IFDEF ART2}
    fraCodigoModulo.Value := StrToInt(fModulo);
    {$ELSE}
    fraCodigoModulo.Value := fModulo;
    {$ENDIF}
    fraCodigoModuloOnChange(nil);
  end;

  if fTexto <> '' then
  begin
    {$IFDEF ART2}
    fraCodigoCodTexto.Value := StrToInt(fTexto);
    {$ELSE}
    fraCodigoCodTexto.Value := fTexto;
    {$ENDIF}
    fraCodigoCodTextoOnChange(nil);
  end;

  with fraARTs do
  begin
    TableName   := 'AAR_ART';
    FieldID     := 'AR_ID';
    FieldCodigo := 'AR_CODIGOSRT';
    FieldDesc   := 'AR_NOMBRE';
    FieldBaja   := 'AR_FECHABAJA';
    ShowBajas   := False;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;
{------------------------------------------------------------------------------}
procedure TfrmBaseGeneracionCartas.DoGuardarCampos;
begin
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
{------------------------------------------------------------------------------}
function TfrmBaseGeneracionCartas.Mostrar: boolean;
begin
  Result := (ShowModal = mrOk);
end;
{------------------------------------------------------------------------------}
end.
