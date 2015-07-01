unit unUbicacionDenuncia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls, unFraDomicilio, unArtFrame, unArtDBAwareFrame, IntEdit, unFraStaticCodigoDescripcion,
  unFraStaticCodDesc, unFraCPA_PAISES, StdCtrls, Mask, DBCtrls, ExtCtrls, JvgGroupBox, ImgList, XPMenu, Placemnt, DB,
  SDEngine, unFraCodigoDescripcion, unFraCodDesc,
  unFraCCO_PARTIDOS_CODIGOSPOSTALES, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, Buttons, FormPanel;

type
  TfrmUbicacionDenuncia = class(TfrmCustomForm)
    gbUbicacion: TJvgGroupBox;
    Label29: TLabel;
    lbValidacionCUIT: TLabel;
    rgEstablecimiento: TDBRadioGroup;
    pnlEstablecimientoExtra: TPanel;
    Label18: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    edUD_TELEFONOS: TDBEdit;
    edUD_CODAREATELEFONOS: TDBEdit;
    fraUD_PAIS: TfraCPA_PAISES;
    edUD_NOMBRE: TDBEdit;
    fraDomicilioEstablecimiento: TfraDomicilio;
    edUD_CUITOCURRE: TJvDBMaskEdit;
    sdqDatos: TSDQuery;
    sduDatos: TSDUpdateSQL;
    dsDatos: TDataSource;
    btnCancelar: TButton;
    btnAceptar: TButton;
    sdqDatosUBICACION_DENUNCIA: TStringField;
    sdqDatosUD_ESTABLECIMIENTO: TFloatField;
    sdqDatosUD_NOMBRE: TStringField;
    sdqDatosUD_CALLE: TStringField;
    sdqDatosUD_NUMERO: TStringField;
    sdqDatosUD_PISO: TStringField;
    sdqDatosUD_DEPARTAMENTO: TStringField;
    sdqDatosUD_LOCALIDAD: TStringField;
    sdqDatosUD_CPOSTAL: TStringField;
    sdqDatosUD_CPOSTALA: TStringField;
    sdqDatosUD_PROVINCIA: TStringField;
    sdqDatosUD_TELEFONOS: TStringField;
    sdqDatosUD_PAIS: TStringField;
    sdqDatosUD_CODAREATELEFONOS: TStringField;
    sdqDatosUD_CUITOCURRE: TStringField;
    sdqDatosPROVINCIA: TStringField;
    sdqDatosUD_IDEXPEDIENTE: TFloatField;
    sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD: TFloatField;
    fraUD_SECUENCIA_PARTIDOLOCALIDAD: TfraCCO_PARTIDOS_CODIGOSPOSTALES;
    Label1: TLabel;
    sdqDatosUD_USUALTA: TStringField;
    sdqDatosUD_FECHAALTA: TDateTimeField;
    sdqDatosUD_USUMODIF: TStringField;
    sdqDatosUD_FECHAMODIF: TDateTimeField;
    sdqDatosEX_SINIESTRO: TFloatField;
    sdqDatosEX_ORDEN: TFloatField;
    sdqDatosEX_RECAIDA: TFloatField;
    btnRecuperar: TButton;
    fpEstableciTemporales: TFormPanel;
    Bevel18: TBevel;
    lblTitulo: TLabel;
    btnAceptarEstTemp: TBitBtn;
    dbgEstableciTemporales: TArtDBGrid;
    sdqEstableciTemporales: TSDQuery;
    sdqDatosUD_ESTABLECIMIENTO_TEMP: TFloatField;
    pnlFiltros: TPanel;
    lbTitulo: TLabel;
    lbSubtitulo: TLabel;
    dsEstableciTemporales: TDataSource;
    procedure rgEstablecimientoChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure edUD_CUITOCURREChange(Sender: TObject);
    procedure fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnAceptarEstTempClick(Sender: TObject);
    procedure fpEstableciTemporalesBeforeShow(Sender: TObject);
    procedure dbgEstableciTemporalesDblClick(Sender: TObject);
    procedure rgEstablecimientoClick(Sender: TObject);
  private
    FIDExpediente: Integer;

    procedure SetIDExpediente(const Value: Integer);
    procedure ControlarRecuperar;
    procedure Do_CargarEstablecimientosTemporales; // TK 21228
    function Esta_CuitEnEstablecimientoTemporal(IdExped:integer):boolean;  // TK 21228
  public
    property IDExpediente: integer read FIDExpediente write SetIDExpediente;
  end;

var
  frmUbicacionDenuncia: TfrmUbicacionDenuncia;
  vEstablecimientoTemp: integer;
  
implementation

uses
  unDlgBusEstablecimiento, unArt, VCLExtra, unDmPrincipal, General, CustomDlgs, CUIT, unSesion;

{$R *.dfm}

procedure TfrmUbicacionDenuncia.rgEstablecimientoChange(Sender: TObject);
  procedure LimpiarInterno;
  begin
    with sdqDatos do
    begin
      FieldByName('UD_ESTABLECIMIENTO').Clear;
      FieldByName('UD_NOMBRE').Clear;
      FieldByName('UD_CODAREATELEFONOS').Clear;
      FieldByName('UD_TELEFONOS').Clear;
      FieldByName('UD_PAIS').Clear;
      FieldByName('UD_ESTABLECIMIENTO_TEMP').Clear;
    end;

    fraDomicilioEstablecimiento.Clear;
    edUD_NOMBRE.Clear;
    edUD_CODAREATELEFONOS.Clear;
    edUD_TELEFONOS.Clear;
    fraUD_PAIS.Clear;
  end;
var
  sSQL: string;
  iEstablecimiento: TTableID;
begin
  if sdqDatos.State in [dsInsert, dsEdit] then
    VCLExtra.LockControls([edUD_NOMBRE,
                           edUD_CODAREATELEFONOS,
                           edUD_TELEFONOS,
                           fraUD_PAIS,
                           fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);

  case rgEstablecimiento.ItemIndex of
    0: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           iEstablecimiento := GetIdEstablecimiento(ValorSqlIntegerEx('SELECT ART.AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE) FROM SEX_EXPEDIENTES WHERE EX_ID = :ID', [IDExpediente]));
           sdqDatos.FieldByName('UD_ESTABLECIMIENTO').AsInteger := iEstablecimiento;
         end else
           iEstablecimiento := StrToIntDef(sdqDatos.FieldByName('UD_ESTABLECIMIENTO').AsString, 0);

         sSQL := 'SELECT A.*, PV_DESCRIPCION FROM AES_ESTABLECIMIENTO A, CPV_PROVINCIAS WHERE PV_CODIGO = ES_PROVINCIA AND ES_ID = :ID_ESTABLECIMIENTO';

         //DIRECCION A LA ANTIGUA...
         with GetQueryEx(sSQL, [iEstablecimiento]), fraDomicilioEstablecimiento do
         begin
           edUD_NOMBRE.Text           := FieldByName('ES_NOMBRE').AsString;
           edUD_CODAREATELEFONOS.Text := FieldByName('ES_CODAREATELEFONOS').AsString;
           edUD_TELEFONOS.Text        := FieldByName('ES_TELEFONOS').AsString;
           fraUD_PAIS.Codigo          := '054';

           Calle        := FieldByName('ES_CALLE').AsString;
           Localidad    := FieldByName('ES_LOCALIDAD').AsString;
           Prov         := StrToIntDef(FieldByName('ES_PROVINCIA').AsString, -1);
           Provincia    := FieldByName('PV_DESCRIPCION').AsString;
           Numero       := IIF(FieldByName('ES_NUMERO').IsNull, 'S/N', FieldByName('ES_NUMERO').AsString);
           Piso         := FieldByName('ES_PISO').AsString;
           Departamento := FieldByName('ES_DEPARTAMENTO').AsString;
           CodigoPostal := FieldByName('ES_CPOSTAL').AsString;
           CPA          := FieldByName('ES_CPOSTALA').AsString;
         end;
       end;
    1: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           LimpiarInterno;
           if edUD_NOMBRE.CanFocus then
             edUD_NOMBRE.SetFocus;
         end;
       end;
    2: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
           LimpiarInterno;
       end;
    3: begin  // TK 21228
         if (sdqDatos.State in [dsInsert, dsEdit]) then
           if Esta_CuitEnEstablecimientoTemporal(FIdExpediente) then
             Do_CargarEstablecimientosTemporales
           else begin
             MsgBox('No se puede seleccionar esta opción debido a que la empresa no posee Establecimientos de Terceros');
             rgEstablecimiento.ItemIndex := -1;
             rgEstablecimiento.SetFocus;
           end;
       end;
  end;
end;

procedure TfrmUbicacionDenuncia.SetIDExpediente(const Value: Integer);
begin
  FIDExpediente := Value;
  sdqDatos.ParamByName('UD_IDEXPEDIENTE').AsInteger := Value;
  OpenQuery(sdqDatos);
  if sdqDatos.IsEmpty then
  begin
    sdqDatos.Insert;
    ControlarRecuperar;
  end else
  begin
    btnRecuperar.Enabled := False;
    if sdqDatos.FieldByName('EX_RECAIDA').AsInteger > 0 then
    begin
      VCLExtra.LockControls([btnAceptar, rgEstablecimiento, fraDomicilioEstablecimiento,
                             edUD_NOMBRE, edUD_CODAREATELEFONOS, edUD_TELEFONOS, fraUD_PAIS,
                             edUD_CUITOCURRE, fraUD_SECUENCIA_PARTIDOLOCALIDAD], True);
      InfoHint(rgEstablecimiento, 'No se puede modificar la ubicación de la denuncia en una recaída.');
    end else
      sdqDatos.Edit;
  end;
end;

procedure TfrmUbicacionDenuncia.btnAceptarClick(Sender: TObject);
begin
  Verificar((rgEstablecimiento.ItemIndex = 2), rgEstablecimiento, 'Debe seleccionar un domicilio para poder guardar la ubicación.');
  Verificar(fraDomicilioEstablecimiento.IsEmpty, nil, 'Debe completar el domicilio para poder grabar.');
  if (rgEstablecimiento.ItemIndex <> 0) and (not fraDomicilioEstablecimiento.IsValid) then
    Exit;

  sdqDatos.FieldByName('UD_IDEXPEDIENTE').AsInteger := IDExpediente;
  sdqDatos.Post;
  DoAplicarUpdates(sdqDatos);
  ModalResult := mrOk;
end;

procedure TfrmUbicacionDenuncia.dsDatosUpdateData(Sender: TObject);
begin
  with fraDomicilioEstablecimiento, sdqDatos do
  begin
    if rgEstablecimiento.ItemIndex > 0 then
      FieldByName('UD_LOCALIDAD').AsString    := IIF(CodigoPostal = '', '', Localidad)
    else
      FieldByName('UD_LOCALIDAD').AsString    := Localidad;

    FieldByName('UD_CALLE').AsString          := Calle;
    FieldByName('UD_NUMERO').AsString         := IIF(Numero = 'S/N', '', Numero);
    FieldByName('UD_PISO').AsString           := Piso;
    FieldByName('UD_DEPARTAMENTO').AsString   := Departamento;
    FieldByName('UD_CPOSTAL').AsString        := CodigoPostal;
    FieldByName('UD_CPOSTALA').AsString       := CPA;
    FieldByName('UD_PROVINCIA').AsString      := IIF(Prov = -1, '', IntToStr(Prov));
    FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').Value := fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value;

    if (rgEstablecimiento.ItemIndex = 3) then // Est. Terceros
    begin
      if sdqEstableciTemporales.Active and not sdqEstableciTemporales.IsEmpty then
        FieldByName('UD_ESTABLECIMIENTO_TEMP').AsInteger := sdqEstableciTemporales.FieldByName('ET_ID').AsInteger
      else
        FieldByName('UD_ESTABLECIMIENTO_TEMP').AsInteger := FieldByName('UD_ESTABLECIMIENTO_TEMP').AsInteger;
    end else
      FieldByName('UD_ESTABLECIMIENTO_TEMP').Value := null;

    if State = dsInsert then
    begin
      FieldByName('UD_USUALTA').AsString      := Sesion.UserID;
      FieldByName('UD_FECHAALTA').AsDateTime  := DBDate;
    end else
    if State = dsEdit then
    begin
      FieldByName('UD_USUMODIF').AsString     := Sesion.UserID;
      FieldByName('UD_FECHAMODIF').AsDateTime := DBDate;
    end;
  end;
end;

procedure TfrmUbicacionDenuncia.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  if not sdqDatos.IsEmpty then
    with sdqDatos, fraDomicilioEstablecimiento do
    begin
      Calle        := FieldByName('UD_CALLE').AsString;
      Numero       := IIF(FieldByName('UD_NUMERO').IsNull, 'S/N', FieldByName('UD_NUMERO').AsString);
      Piso         := FieldByName('UD_PISO').AsString;
      Departamento := FieldByName('UD_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('UD_CPOSTAL').AsString;
      CPA          := FieldByName('UD_CPOSTALA').AsString;
      Localidad    := FieldByName('UD_LOCALIDAD').AsString;
      Prov         := StrToIntDef(FieldByName('UD_PROVINCIA').AsString, -1);
      Provincia    := FieldByName('PROVINCIA').AsString;
      fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value := FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsInteger;
    end;

  VCLExtra.LockControls([edUD_NOMBRE,
                         edUD_CODAREATELEFONOS,
                         edUD_TELEFONOS,
                         fraUD_PAIS,
                         fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);
end;

procedure TfrmUbicacionDenuncia.edUD_CUITOCURREChange(Sender: TObject);
begin
  lbValidacionCUIT.Caption := '';
  if (Length(Trim(edUD_CUITOCURRE.Text)) = 11) and IsCuit(edUD_CUITOCURRE.Text) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT ingresado es correcto.';
    lbValidacionCUIT.Font.Color := clTeal;
  end else
  if (Length(Trim(edUD_CUITOCURRE.Text)) > 0) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT ingresado es incorrecto.';
    lbValidacionCUIT.Font.Color := clMaroon;
  end;
end;

procedure TfrmUbicacionDenuncia.fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
begin
  inherited;
  fraUD_SECUENCIA_PARTIDOLOCALIDAD.CodigoPostal := TIntEdit(Sender).Value;
end;

procedure TfrmUbicacionDenuncia.FormCreate(Sender: TObject);
begin
  inherited;
  lbValidacionCUIT.Caption := '';
end;

procedure TfrmUbicacionDenuncia.btnRecuperarClick(Sender: TObject);
var
  sSQL: String;
begin
  sSQL := 'SELECT DECODE(UD_ESTABLECIMIENTO || UD_CPOSTAL || UD_CALLE, NULL, ''S'', ' +
                 'UD_TIPO_ESTAB) AS UBICACION_DENUNCIA, UD_ESTABLECIMIENTO_TEMP, ' +
                 'UD_ESTABLECIMIENTO, UD_NOMBRE, UD_CALLE, UD_NUMERO, UD_PISO, UD_DEPARTAMENTO, ' +
                 'UD_LOCALIDAD, UD_CPOSTAL, UD_CPOSTALA, UD_PROVINCIA, UD_TELEFONOS, UD_PAIS, ' +
                 'UD_CODAREATELEFONOS, UD_CUITOCURRE, PV_DESCRIPCION PROVINCIA, UD_IDEXPEDIENTE, ' +
                 'UD_SECUENCIA_PARTIDOLOCALIDAD, UD_USUALTA, UD_FECHAALTA, UD_USUMODIF, UD_FECHAMODIF ' +
            'FROM SIN.SUD_UBICACIONDENUNCIA, ART.CPV_PROVINCIAS ' +
           'WHERE PV_CODIGO (+) = UD_PROVINCIA ' +
             'AND UD_IDEXPEDIENTE = (SELECT ART.SINIESTRO.GET_IDEXPEDIENTE(EX_SINIESTRO, 1, 0) ' +
                                      'FROM ART.SEX_EXPEDIENTES ' +
                                     'WHERE EX_ID = :IDEXPEDIENTE ' +
                                       'AND EX_ORDEN > 1 ' +
                                 'UNION ALL ' +
                                    'SELECT ART.SINIESTRO.GET_IDEXPEDIENTE(EX_SINIESTRO, 1, 0) ' +
                                      'FROM ART.SEX_EXPEDIENTES ' +
                                     'WHERE EX_ID = :IDEXPEDIENTE ' +
                                       'AND EX_ORDEN = 1 ' +
                                       'AND EX_RECAIDA > 0)';
  with GetQueryEx(sSQL, [IdExpediente]) do
  try
    rgEstablecimiento.OnChange := nil;
    sdqDatos.FieldByName('UBICACION_DENUNCIA').AsString := FieldByName('UBICACION_DENUNCIA').AsString;
    rgEstablecimiento.OnChange := rgEstablecimientoChange;
    sdqDatos.FieldByName('UD_ESTABLECIMIENTO').AsString := FieldByName('UD_ESTABLECIMIENTO').AsString;
    sdqDatos.FieldByName('UD_NOMBRE').AsString := FieldByName('UD_NOMBRE').AsString;
    sdqDatos.FieldByName('UD_CALLE').AsString := FieldByName('UD_CALLE').AsString;
    sdqDatos.FieldByName('UD_NUMERO').AsString := FieldByName('UD_NUMERO').AsString;
    sdqDatos.FieldByName('UD_PISO').AsString := FieldByName('UD_PISO').AsString;
    sdqDatos.FieldByName('UD_DEPARTAMENTO').AsString := FieldByName('UD_DEPARTAMENTO').AsString;
    sdqDatos.FieldByName('UD_LOCALIDAD').AsString := FieldByName('UD_LOCALIDAD').AsString;
    sdqDatos.FieldByName('UD_CPOSTAL').AsString := FieldByName('UD_CPOSTAL').AsString;
    sdqDatos.FieldByName('UD_CPOSTALA').AsString := FieldByName('UD_CPOSTALA').AsString;
    sdqDatos.FieldByName('UD_PROVINCIA').AsString := FieldByName('UD_PROVINCIA').AsString;
    sdqDatos.FieldByName('UD_TELEFONOS').AsString := FieldByName('UD_TELEFONOS').AsString;
    sdqDatos.FieldByName('UD_PAIS').AsString := FieldByName('UD_PAIS').AsString;
    sdqDatos.FieldByName('UD_CODAREATELEFONOS').AsString := FieldByName('UD_CODAREATELEFONOS').AsString;
    sdqDatos.FieldByName('UD_CUITOCURRE').AsString := FieldByName('UD_CUITOCURRE').AsString;
    sdqDatos.FieldByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
    sdqDatos.FieldByName('UD_IDEXPEDIENTE').AsString := FieldByName('UD_IDEXPEDIENTE').AsString;
    sdqDatos.FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsString := FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsString;
    sdqDatos.FieldByName('UD_USUALTA').AsString := Sesion.UserID;
    sdqDatos.FieldByName('UD_FECHAALTA').AsDateTime := DBDate;
    sdqDatos.FieldByName('UD_ESTABLECIMIENTO_TEMP').AsString := FieldByName('UD_ESTABLECIMIENTO_TEMP').AsString;

    with sdqDatos, fraDomicilioEstablecimiento do
    begin
      Calle        := FieldByName('UD_CALLE').AsString;
      Numero       := IIF(FieldByName('UD_NUMERO').IsNull, 'S/N', FieldByName('UD_NUMERO').AsString);
      Piso         := FieldByName('UD_PISO').AsString;
      Departamento := FieldByName('UD_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('UD_CPOSTAL').AsString;
      CPA          := FieldByName('UD_CPOSTALA').AsString;
      Localidad    := FieldByName('UD_LOCALIDAD').AsString;
      Prov         := StrToIntDef(FieldByName('UD_PROVINCIA').AsString, -1);
      Provincia    := FieldByName('PROVINCIA').AsString;
      fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value := FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsInteger;
    end;

    VCLExtra.LockControls([edUD_NOMBRE,
                           edUD_CODAREATELEFONOS,
                           edUD_TELEFONOS,
                           fraUD_PAIS,
                           fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);
  finally
    Free;
  end;

  btnRecuperar.Enabled := False;
end;

procedure TfrmUbicacionDenuncia.ControlarRecuperar;
var
  sSQL: String;
begin
  sSQL := 'SELECT 1 ' +
            'FROM SIN.SUD_UBICACIONDENUNCIA ' +
           'WHERE UD_IDEXPEDIENTE = (SELECT ART.SINIESTRO.GET_IDEXPEDIENTE(EX_SINIESTRO, 1, 0) ' +
                                      'FROM ART.SEX_EXPEDIENTES ' +
                                     'WHERE EX_ID = :IDEXPEDIENTE ' +
                                       'AND EX_ORDEN > 1 ' +
                                 'UNION ALL ' +
                                    'SELECT ART.SINIESTRO.GET_IDEXPEDIENTE(EX_SINIESTRO, 1, 0) ' +
                                      'FROM ART.SEX_EXPEDIENTES ' +
                                     'WHERE EX_ID = :IDEXPEDIENTE ' +
                                       'AND EX_ORDEN = 1 ' +
                                       'AND EX_RECAIDA > 0)';
  btnRecuperar.Enabled := ExisteSQLEx(sSQL, [IdExpediente]);
end;

procedure TfrmUbicacionDenuncia.Do_CargarEstablecimientosTemporales;       // TK 21228
begin
  if (fpEstableciTemporales.ShowModal = mrOk) then
  begin
    with sdqEstableciTemporales, fraDomicilioEstablecimiento do
    begin
      edUD_NOMBRE.Text           := FieldByName('ET_NOMBRE').AsString;
      edUD_CODAREATELEFONOS.Text := FieldByName('ET_TELEFONOS').AsString;
      fraUD_PAIS.Codigo          := '054';
      edUD_CUITOCURRE.Text       := FieldByName('ET_CUIT_TEMPORAL').AsString;

      Calle        := FieldByName('ET_CALLE').AsString;
      Localidad    := FieldByName('ET_LOCALIDAD').AsString;
      Prov         := StrToIntDef(FieldByName('ET_PROVINCIA').AsString, -1);
      Provincia    := FieldByName('PROVINCIA').AsString;
      Numero       := IIF(FieldByName('ET_NUMERO').IsNull, 'S/N', FieldByName('ET_NUMERO').AsString);
      Piso         := FieldByName('ET_PISO').AsString;
      Departamento := FieldByName('ET_DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('ET_CPOSTAL').AsString;
      CPA          := FieldByName('ET_CPOSTALA').AsString;

      vEstablecimientoTemp := FieldByName('ET_ID').AsInteger;
    end;
  end;
end;

procedure TfrmUbicacionDenuncia.btnAceptarEstTempClick(Sender: TObject);
begin
  fpEstableciTemporales.ModalResult := mrOk;
end;

function TfrmUbicacionDenuncia.Esta_CuitEnEstablecimientoTemporal(IdExped: integer): boolean;   // TK 21228
var sSql: string;
begin
  sSql := 'SELECT 1 FROM sin.set_establecimiento_temporal ' +
          ' WHERE et_cuit = (SELECT ex_cuit FROM art.sex_expedientes ' +  // cuit del siniestro
                            ' WHERE ex_id = :idexp) ';

  Result := ExisteSqlEx(sSql, [IdExped]);
end;

procedure TfrmUbicacionDenuncia.fpEstableciTemporalesBeforeShow(Sender: TObject);   // TK 21228
begin
  sdqEstableciTemporales.SQL.text :=
          'SELECT et_id, et_nroestableci, et_nombre, et_cuit_temporal, et_calle, et_numero, ' +
                ' et_piso, et_departamento, et_localidad, et_cpostal, et_provincia, ' +
                ' pv_descripcion provincia, et_cpostala, et_telefonos, et_cuit_temporal ' +
           ' FROM sin.set_establecimiento_temporal, art.cpv_provincias ' +
          ' WHERE et_provincia = pv_codigo ' +
            ' AND et_cuit = (SELECT ex_cuit FROM art.sex_expedientes ' +  // cuit del siniestro
                            ' WHERE ex_id = :idexp) ';

  OpenQueryEx(sdqEstableciTemporales, [FIdExpediente]);
end;

procedure TfrmUbicacionDenuncia.dbgEstableciTemporalesDblClick(Sender: TObject);  // TK 21228
begin
  fpEstableciTemporales.ModalResult := mrOk;
end;

procedure TfrmUbicacionDenuncia.rgEstablecimientoClick(Sender: TObject);  // TK 21228
begin
  if (rgEstablecimiento.ItemIndex = 3) and (not Esta_CuitEnEstablecimientoTemporal(FIdExpediente)) then
  begin
    MsgBox('No se puede seleccionar esta opción debido a que la empresa no posee Establecimientos de Terceros');
    rgEstablecimiento.ItemIndex := -1;
    rgEstablecimiento.SetFocus;  // Esto lo pongo porque al hacer el Close tiene el foco en el tercer ítem si paso por el evento Change del rgEstablecimiento, y pasa por aca dando el cartel al final.
  end;
end;

end.
