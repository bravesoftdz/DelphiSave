unit unFraTrabajadorSIN;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CUIT,
  ToolEdit, RxLookup, StdCtrls, Mask, Db, SDEngine, ArtComboBox, unARTFrame,
  RxToolEdit;

{$IFDEF ART2}
  ESTE FRAME NO ES COMPATIBLE CON LOS SISTEMAS NUEVOS
{$ENDIF}

type
  TfraTrabajadorSIN = class(TARTFrame)
    sdqTrabajador: TSDQuery;
    dsTrabajador: TDataSource;
    lbTrabCUIL: TLabel;
    mskTrabCUIL: TMaskEdit;
    lbTrabNombre: TLabel;
    dbcTrabNombre: TArtComboBox;
    sdqTrabajadorTJ_CUIL: TStringField;
    sdqTrabajadorTJ_NOMBRE: TStringField;
    sdqTrabajadorSINIESTRO: TStringField;
    sdqTrabajadorEX_SINIESTRO: TFloatField;
    sdqTrabajadorEX_ORDEN: TFloatField;
    sdqTrabajadorEX_RECAIDA: TFloatField;
    sdqTrabajadorEX_FECHAACCIDENTE: TDateTimeField;
    sdqTrabajadorEX_BAJAMEDICA: TDateTimeField;
    sdqTrabajadorEX_ALTAMEDICA: TDateTimeField;
    sdqTrabajadorEX_FECHARECAIDA: TDateTimeField;
    sdqTrabajadorEX_CAUSAFIN: TStringField;
    sdqTrabajadorEX_ID: TFloatField;
    procedure mskTrabCUILKeyPress(Sender: TObject; var Key: Char);
    procedure dbcTrabNombreDropDown(Sender: TObject);
    procedure dbcTrabNombreCloseUp(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FAllwaysShowList, FTercerizadoras: Boolean;
    function GetCUIL: TCuil;
    function GetSqlTercerizadora: String;
    procedure SetCUIL(const Value: TCuil);
    function GetIdExpediente: Integer;
  public
    CUIT : String;
    constructor Create(AOwner: TComponent); override;

    procedure Limpiar;
    procedure Cargar( sCUIL : String ); overload;
    procedure Cargar( pSiniestro, pOrden, pRecaida : Integer ); overload;
    procedure Cargar( pSiniestro, pOrden, pRecaida : String ); overload;
    procedure SetColors( AColor : TColor);
  published
    property CUIL               : TCuil     read GetCUIL          write SetCUIL;
    property OnChange        : TNotifyEvent read FOnChange        write FOnChange;
    property AllwaysShowList : Boolean      read FAllwaysShowList write FAllwaysShowList;
    property Tercerizadoras  : Boolean      read FTercerizadoras  write FTercerizadoras;
    property IdExpediente    : Integer      read GetIdExpediente;
  end;

implementation

uses unDmPrincipal, General, unSesion, AnsiSQL, unTercerizadoras;

Const
  BaseSql = 'SELECT tj_nombre, tj_cuil, ' +
                  ' ex_siniestro || ''-'' || ex_orden || ''-'' || ex_recaida siniestro, ' +
                  ' ex_siniestro, ex_orden, ex_recaida, ex_fechaaccidente, ' +
                  ' ex_bajamedica, ex_altamedica, ex_fecharecaida, ex_causafin, ex_id ' +
             ' FROM ctj_trabajador, sex_expedientes, aem_empresa ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_cuit = em_cuit ';
  BaseSiniWhere = 'AND NOT NVL(ex_causafin,''0'') IN (''99'', ''95'') ' ;
      BaseOrder = ' ORDER BY tj_nombre, ex_siniestro ';
{$R *.DFM}

procedure TfraTrabajadorSIN.mskTrabCUILKeyPress(Sender: TObject; var Key: Char);
var
  Sql: String;
begin
  if (Key = #13) then
  begin
    case Length(Trim(mskTrabCUIL.Text)) of
      8:  Sql := BaseSql + BaseSiniWhere +
                    ' AND TJ_DOCUMENTO = ' + SQLValue(Trim(mskTrabCUIL.Text));
      11: Sql := BaseSql + BaseSiniWhere +
                    ' AND TJ_CUIL = ' + SQLValue(mskTrabCUIL.Text);
    else
      Exit;
    end;

    Sql := Sql + GetSqlTercerizadora + BaseOrder;

    if not (Sql = sdqTrabajador.SQL.Text) then
    begin
      OpenQuery(sdqTrabajador, Sql);
      if Assigned(Sender) and (FAllwaysShowList or (sdqTrabajador.RecordCount > 1)) then
        dbcTrabNombre.DoDropDown(False)
      else
        dbcTrabNombreCloseUp(Sender);
    end;
  end;
end;

procedure TfraTrabajadorSIN.dbcTrabNombreDropDown(Sender: TObject);
var
  Sql: String;
begin
  if (Length(Trim(dbcTrabNombre.Text)) < 4) then
  begin
    sdqTrabajador.Close;
    MsgBox('Debe ingresar como mínimo cuatro caracteres para realizar la búsqueda.', MB_ICONEXCLAMATION);
  end else
  begin
    if CUIT = '' then
      Sql := BaseSql + BaseSiniWhere +
             ' AND TJ_NOMBRE LIKE ' + SQLValue(Trim(dbcTrabNombre.Text) + '%')
    else
      Sql := BaseSql + BaseSiniWhere +
             ' AND TJ_NOMBRE LIKE ' + SQLValue(Trim(dbcTrabNombre.Text) + '%') +
             ' AND EX_CUIT = ' + SQLValue(CUIT);

    Sql := Sql + GetSqlTercerizadora +  BaseOrder;
    OpenQuery(sdqTrabajador, Sql, True);

    if sdqTrabajador.IsEmpty then
    begin
      sdqTrabajador.Close;
      MsgBox('No se ha encontrado ningun trabajador para este criterio de búqueda.', MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TfraTrabajadorSIN.dbcTrabNombreCloseUp(Sender: TObject);
begin
  mskTrabCUIL.Text   := sdqTrabajadorTJ_CUIL.AsString;
  dbcTrabNombre.Text := sdqTrabajadorTJ_NOMBRE.AsString;
  //------------------------------------------------------
  if (sdqTrabajadorEX_CAUSAFIN.AsString = '99') or (sdqTrabajadorEX_CAUSAFIN.AsString = '95') then
     SetColors(clRed)
  else
     SetColors(clBlack);
  //------------------------------------------------------
  if Assigned(Sender) then
  begin // Para que no entre cuando se llama a 'Cargar'
    if Assigned(FOnChange) then
      OnChange(Self);
     if dbcTrabNombre.CanFocus then
     begin
       dbcTrabNombre.SetFocus;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
     end;
  end;
end;

procedure TfraTrabajadorSIN.Limpiar;
begin
  CUIT               := '' ;
  mskTrabCUIL.Text   := '' ;
  dbcTrabNombre.Text := '' ;
end;

procedure TfraTrabajadorSIN.Cargar(sCUIL: String);
var
  tmpEnterKey : Char;
begin
  tmpEnterKey := #13 ;
  mskTrabCUIL.Text := sCUIL;
  mskTrabCUILKeyPress(Nil , tmpEnterKey);
end;

procedure TfraTrabajadorSIN.Cargar(pSiniestro, pOrden, pRecaida: Integer);
var
  Sql: String;
begin
  Sql := BaseSql +
         ' AND EX_SINIESTRO = ' + IntToStr(pSiniestro) +
         ' AND EX_ORDEN = ' + IntToStr(pOrden) +
         ' AND EX_RECAIDA = ' + IntToStr(pRecaida) ;

  Sql := Sql + GetSqlTercerizadora;

  OpenQuery(sdqTrabajador, Sql);
  dbcTrabNombreCloseUp( Nil );
end;

procedure TfraTrabajadorSIN.Cargar(pSiniestro, pOrden, pRecaida: String);
begin
  Cargar( StrToInt('0' + pSiniestro), StrToInt('0' + pOrden), StrToInt('0' + pRecaida))
end;

procedure TfraTrabajadorSIN.SetColors(AColor: TColor);
begin
  mskTrabCUIL.Font.Color   := AColor;
  dbcTrabNombre.Font.Color := AColor;
end;

constructor TfraTrabajadorSIN.Create(AOwner: TComponent);
begin
  inherited;
  FTercerizadoras := False;
end;

function TfraTrabajadorSIN.GetCUIL: TCuil;
begin
  //FrameExit( nil ); // Valida que todo este completo
  if sdqTrabajador.Active then
    Result := sdqTrabajador.FieldByName('TJ_CUIL').AsString
  else
    Result := '';
end;

function TfraTrabajadorSIN.GetIdExpediente: Integer;
begin
  if sdqTrabajador.Active then
    Result := sdqTrabajador.FieldByName('EX_ID').AsInteger
  else
    Result := -1;
end;

procedure TfraTrabajadorSIN.SetCUIL(const Value: TCuil);
begin
  Cargar(Value);
end;

function TfraTrabajadorSIN.GetSqlTercerizadora: String;
begin
//  Result := IIF(Tercerizadoras, ' AND EXISTS (SELECT 1 ' +
//                                                'FROM amed.met_empresa_terce, amed.mut_usuario_tercerizadora ' +
//                                               'WHERE et_idempresa = em_id ' +
//                                                 'AND ut_idtercerizadora = et_idtercerizadora ' +
//                                                 'AND ut_usuario = ' + SQLValue(Sesion.UserID) + ') ', '');

  Result := IIF(EsUsuarioDeTercerizadora, ' AND art.siniestro.is_sinitercerizadora(' + SqlInt(sdqTrabajadorEX_ID.AsInteger) + ', ' + SQLValue(Sesion.UserID) + ') = ''S'' ', '');  // Plan Ioma
end;

end.
