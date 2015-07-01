unit unFraTrabajadorSiniestro;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraTrabajador, Db, SDEngine, ArtComboBox, StdCtrls, Mask,
  SinEdit, unArt, PatternEdit, ComCtrls, ToolWin, ImgList, RxToolEdit;

type
  TfraTrabajadorSiniestro = class(TfraTrabajador)
    edSiniestro: TSinEdit;
    lbSiniestro: TLabel;
    lvSiniestros: TListView;
    ToolBar: TToolBar;
    tbLimpiar: TToolButton;
    ImageList: TImageList;
    sdqMensajes: TSDQuery;
    procedure edSiniestroSelect(Sender: TObject);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure mskCUILExit(Sender: TObject);
    procedure cmbNombreCloseUp(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure HotKeyMethod(Sender: TObject);
  private
    tslCUIT: TStringList;
    FIsFiltering, bNoTrabajadorAusente, FTercerizadoras: Boolean;
    procedure Internal_SetSiniestro(ASiniestro, AOrden, ARecaida: Integer; DoChanges : Boolean = False);
    function GetSoloSiniestrados: boolean;
    procedure SetSoloSiniestrados(const Value: boolean);
    function GetTieneSiniestro: boolean;
    function GetSiniestro: String;
    function GetSiniestroSinCeros: String;
    function GetIsFiltering: boolean;
    function GetOrd: Integer;
    function GetRec: Integer;
    function GetSin: Integer;
  protected
    FSoloSiniestrados: Boolean;
    
    function GetIdSiniestro: TTableId; virtual;
    procedure SetIdSiniestro(const Value: TTableId); virtual;

    procedure SetEditorsValues; override;
    function ClearOnExit: boolean; override;
    function CancelExitLoad: boolean; override;
    function GetSqlBis: String;
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;    
    procedure TrabajadorAusente; override;
  public
    procedure Change; override;
    procedure Clear; override;
    procedure ClearSiniestroStyle;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Siniestro         : String   read GetSiniestro;
    property SiniestroSinCeros : String   read GetSiniestroSinCeros;
    property IdExpediente      : TTableId read GetIdSiniestro       write SetIdSiniestro;    
    property IdSiniestro       : TTableId read GetIdSiniestro       write SetIdSiniestro;
    property SoloSiniestrados  : boolean  read GetSoloSiniestrados  write SetSoloSiniestrados;
    property TieneSiniestro    : boolean  read GetTieneSiniestro;
    property IsFiltering       : boolean  read GetIsFiltering;
    property Tercerizadoras    : Boolean  read FTercerizadoras      write FTercerizadoras;

    property Sin               : Integer  read GetSin;
    property Ord               : Integer  read GetOrd;
    property Rec               : Integer  read GetRec;
  end;

implementation

uses
  SqlFuncs, AnsiSql, unDmPrincipal, DateUtils, unArtDbFrame, General, Strfuncs, CustomDlgs, unSesion,
  unSiniestros, unTercerizadoras, unComunes;

{$R *.DFM}


{ TfraTrabajadorSiniestro }

function TfraTrabajadorSiniestro.GetSql: String;
begin
  Result := inherited GetSql;

  if FSoloSiniestrados then
  begin
    if not MostrarRelaLaboral then
    begin
      AddTable(Result, 'AEM_EMPRESA');
      AddField(Result, 'EM_ID');
    end;

    AddTable(Result, 'SEX_EXPEDIENTES');
    {$IFDEF AGENDA_SIC}
    if not ShowBajas then
      AddCondition(Result, 'NVL(EX_CAUSAFIN, '' '') NOT IN (''95'', ''99'')');
    {$ENDIF}

    AddCondition(Result, 'EX_CUIL = TJ_CUIL');
    AddCondition(Result, 'EX_CUIT = EM_CUIT');

    if MostrarRelaLaboral or (IdEmpresa <> ART_EMPTY_ID) then
    begin
      AddCondition(Result, 'EX_CONTRATO = CO_CONTRATO');
      if Pos('ACO_CONTRATO', UpperCase(Result)) = 0 then
        AddTable(Result, 'ACO_CONTRATO');
    end;

    AddField(Result, 'EX_ID');
    AddField(Result, 'EX_SINIESTRO');
    AddField(Result, 'EX_ORDEN');
    AddField(Result, 'EX_RECAIDA');
    AddField(Result, 'EX_FECHAACCIDENTE');
    AddField(Result, 'EX_FECHARECAIDA');
    AddField(Result, 'EX_ALTAMEDICA');
    AddField(Result, 'EX_CUIT');
    AddField(Result, 'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) as SINIESTRO');

    if EsUsuarioDeTercerizadora then
      AddCondition(Result, ' art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ');
  end;
end;

procedure TfraTrabajadorSiniestro.SetEditorsValues;
begin
  inherited;
  if SoloSiniestrados then
    if tslCUIT.IndexOf(sdqDatos.FieldByName('EX_CUIT').AsString) > -1 then
    begin
      InfoHint(cmbNombre, Format('Su sector, %s, no tiene permiso para consultar los datos referentes a la empresa %s', [NVL(Sesion.SectorDesc, Sesion.Sector), sdqDatos.FieldByName('EM_NOMBRE').AsString]),
               False, 'Validación de permisos');
      Clear;
      Abort;
    end else
    begin
      edSiniestro.SetValues(sdqDatos.FieldByName('EX_SINIESTRO').AsString,
                            sdqDatos.FieldByName('EX_ORDEN').AsString,
                            sdqDatos.FieldByName('EX_RECAIDA').AsString)
    end
  else
    edSiniestro.SetValues('', '', '');
end;

procedure TfraTrabajadorSiniestro.edSiniestroSelect(Sender: TObject);
begin
  Internal_SetSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, True );
end;

procedure TfraTrabajadorSiniestro.Internal_SetSiniestro(ASiniestro, AOrden, ARecaida: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSqlBis + GetSqlWhere;

  AddCondition(sSql, 'EX_SINIESTRO = ' + SqlValue(ASiniestro));
  AddCondition(sSql, 'EX_ORDEN = ' + SqlValue(AOrden));
  AddCondition(sSql, 'EX_RECAIDA = ' + SqlValue(ARecaida));

  if OpenQuery(sdqDatos, sSql, True) then
  begin
    if sdqDatos.Active and not sdqDatos.IsEmpty then
      LoadValues(DoChanges)
    else
    begin
      if ExisteSQLEx('SELECT 1 FROM art.sex_expedientes WHERE ex_siniestro = :siniestro AND ex_orden = :orden AND ex_recaida = :recaida', [ASiniestro, AOrden, ARecaida]) then
        InfoHint(edSiniestro, 'El siniestro seleccionado existe pero ha sido dado de baja por una causa que impide que sea usado en este caso.')
      else if Tercerizadoras then
        InfoHint(edSiniestro, 'El siniestro seleccionado no existe o bien usted no tiene permiso para visualizarlo.')
      else
        InfoHint(edSiniestro, 'El siniestro seleccionado no existe.');
    end;
  end;
end;

procedure TfraTrabajadorSiniestro.Clear;
begin
  inherited;
  edSiniestro.Clear;
  ClearSiniestroStyle;
end;

procedure TfraTrabajadorSiniestro.ClearSiniestroStyle;
begin
  inherited;
  with edSiniestro do
  begin
    FOrden.Font.Style   := [];
    FRecaida.Font.Style := [];
    FOrden.Color   := clWhite;
    FRecaida.Color := clWhite;
  end;
end;

function TfraTrabajadorSiniestro.CancelExitLoad: boolean;
begin
  if (not edSiniestro.IsEmpty) and Assigned(sdqDatos.FindField('EX_SINIESTRO')) and 
     ((not sdqDatos.Active) or (not edSiniestro.CompareValues(sdqDatos.FieldByName('EX_SINIESTRO').AsInteger,
                                                              sdqDatos.FieldByName('EX_ORDEN').AsInteger,
                                                              sdqDatos.FieldByName('EX_RECAIDA').AsInteger))) then
  begin
    Internal_SetSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, True );

    Result := True;
  end else
    Result := inherited CancelExitLoad;
end;

function TfraTrabajadorSiniestro.ClearOnExit: boolean;
begin
  Result := (inherited ClearOnExit) and edSiniestro.IsEmpty;
end;

function TfraTrabajadorSiniestro.GetIdSiniestro: TTableId;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active and not sdqDatos.IsEmpty and Assigned(sdqDatos.FindField('EX_SINIESTRO')) then
    Result := sdqDatos.FieldByName('EX_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraTrabajadorSiniestro.SetIdSiniestro(const Value: TTableId);
var
  sSql : String;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSqlBis + GetSqlWhere + ' AND EX_ID = ' + SqlInt( Value );

    if OpenQuery(sdqDatos, sSql, True) then
      LoadValues(False);
  end else
    Clear;
end;

function TfraTrabajadorSiniestro.GetSqlBis: String;
var
  sOldExtraFields: string;
  bOldSinEstablecimiento, bOldMostrarRelacion: boolean;
begin
  sOldExtraFields := ExtraFields;
  bOldMostrarRelacion := MostrarRelaLaboral;
  bOldSinEstablecimiento := SinEstablecimiento;
  IdEmpresa := ART_EMPTY_ID;
  MostrarRelaLaboral := True;
  SinEstablecimiento := True;
  ExtraFields := ExtraFields + ', InitCap(' + GetDecodeFromCTB('EX_GRAVEDAD', 'SGRAV') + ') GRAVEDAD ' +
                               ', EX_TIPO, InitCap(' + GetDecodeFromCTB('EX_TIPO', 'STIPO') + ') TIPO ' +
                               ', EX_FECHARECAIDA, EX_FECHAACCIDENTE, EX_ALTAMEDICA ';

  Result := inherited GetSql;
  ExtraFields := sOldExtraFields;
  MostrarRelaLaboral := bOldMostrarRelacion;
  SinEstablecimiento := bOldSinEstablecimiento;

  AddTable(Result, 'SEX_EXPEDIENTES');
  AddField(Result, 'EX_ID');
  AddField(Result, 'EX_SINIESTRO');
  AddField(Result, 'EX_ORDEN');
  AddField(Result, 'EX_RECAIDA');
  AddField(Result, 'EX_CUIT');

  AddCondition(Result, 'EX_CUIL = TJ_CUIL');
  AddCondition(Result, 'EX_CUIT = EM_CUIT');
  AddCondition(Result, 'EX_CONTRATO = CO_CONTRATO');
  {$IFDEF AGENDA_SIC}
  if not ShowBajas then
    AddCondition(Result, 'NVL(EX_CAUSAFIN, '' '') NOT IN (''95'', ''99'')');
  {$ENDIF}

  if EsUsuarioDeTercerizadora then
  begin
  //  AddCondition(Result, ' ART.SINIESTRO.IS_SINITERCERIZADO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) = ''S'' ');     // con la funcion siguiente alcanza.

    AddCondition(Result, ' art.siniestro.is_usuariotercerizadora(EM_ID, ' + SQLValue(Sesion.UserID) + ') = ''S'' ');   // por plan IOMA

 {   AddCondition(Result, ' EXISTS (SELECT 1 ' +
                                    'FROM AMED.MET_EMPRESA_TERCE, AMED.MUT_USUARIO_TERCERIZADORA ' +
                                   'WHERE ET_IDEMPRESA = EM_ID ' +
                                     'AND UT_IDTERCERIZADORA = ET_IDTERCERIZADORA ' +
                                     'AND UT_FECHABAJA IS NULL ' +
                                     'AND UT_USUARIO = ' + SQLValue(Sesion.UserID) + ') ');    }
  end;
end;

procedure TfraTrabajadorSiniestro.cmbNombreDropDown(Sender: TObject);
begin
  try
//    cmbNombre.Columns[4].Visible := not SinEstablecimiento;
//    cmbNombre.Columns[5].Visible := not SinEstablecimiento;
    cmbNombre.Columns[7].Visible := FSoloSiniestrados;
    cmbNombre.Columns[8].Visible := FSoloSiniestrados;
    cmbNombre.Columns[9].Visible := FSoloSiniestrados;
  except
  end;
  inherited;
end;

procedure TfraTrabajadorSiniestro.mskCUILExit(Sender: TObject);
begin
  inherited;
  if IsEmpty and (mskCUIL.Text > '') and (not mskCUIL.ReadOnly) and (not TieneSiniestro) then
    Internal_SetCuil( mskCUIL.Text, True );
end;

function TfraTrabajadorSiniestro.GetSoloSiniestrados: boolean;
begin
  Result := Assigned(sdqDatos.FindField('EX_SINIESTRO'));
end;

procedure TfraTrabajadorSiniestro.SetSoloSiniestrados(const Value: boolean);
begin
  FSoloSiniestrados := Value;
end;

function TfraTrabajadorSiniestro.GetTieneSiniestro: boolean;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active and not sdqDatos.IsEmpty and Assigned(sdqDatos.FindField('EX_SINIESTRO')) then
    Result := not sdqDatos.FieldByName('EX_SINIESTRO').IsNull
  else
    Result := False;
end;

procedure TfraTrabajadorSiniestro.cmbNombreCloseUp(Sender: TObject);
begin
  inherited;
{
  with lvSiniestros.Items do
  begin
    Parent := Self.Parent;
    Visible := True;
    Clear;
    with GetQueryEx('SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA FROM SEX_EXPEDIENTES WHERE EX_CUIL = :CUIL', [sdqDatos.FieldByName(TRAB_ALIAS_CUIL).AsString]) do
    try
      First;
      while not Eof do
      begin
        with Add do
        begin
          Caption := FieldByName('EX_SINIESTRO').AsString;
        end;
        Next;
      end;
    finally
      Free;
    end;
  end;
}
end;

function TfraTrabajadorSiniestro.GetSiniestro: String;
begin
  Result := LPad(edSiniestro.SiniestroS, '0', 8) + '/' + LPad(edSiniestro.OrdenS, '0', 3) + '/' + LPad(edSiniestro.RecaidaS, '0', 2);
end;

function TfraTrabajadorSiniestro.GetSiniestroSinCeros: String;
begin
  Result := edSiniestro.SiniestroS + '/' + edSiniestro.OrdenS + '/' + edSiniestro.RecaidaS;
end;

procedure TfraTrabajadorSiniestro.tbLimpiarClick(Sender: TObject);
var
  sCUIL: string;
begin
  sCUIL := mskCUIL.Text;
  Clear;
  Internal_SetCuil( sCUIL, True );
end;

procedure TfraTrabajadorSiniestro.HotKeyMethod(Sender: TObject);
begin
  inherited;
  tbLimpiar.Click;
end;

constructor TfraTrabajadorSiniestro.Create(AOwner: TComponent);
begin
  inherited;
  FIsFiltering := False;
  tslCUIT := ValoresSqlEx('SELECT /*+ INDEX(ACO_CONTRATO, PK_ACO_CONTRATO) INDEX(AEM_EMPRESA, PK_AEM_EMPRESA) */ EM_CUIT ' +
                            'FROM AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, COMUNES.CSC_SECTORCONTRATO ' +
                           'WHERE CO_IDEMPRESA = EM_ID ' +
                             'AND SC_CONTRATO = CO_CONTRATO ' +
                             'AND SC_SECTOR = :SECTOR', [Sesion.Sector]);
end;

procedure TfraTrabajadorSiniestro.TrabajadorAusente;
var
  sCUIL, sNombre, sMensaje: string;
  AWinControl: TWinControl;
  iValor0, iValor1, iValor2, iValor3: integer;
begin
//  inherited;
  AWinControl := Screen.ActiveControl;

  if not bNoTrabajadorAusente and ((Trim(mskCUIL.Text) > '') or (Trim(cmbNombre.Text) > '')) then
  begin
    if Filtered then
    begin
//      if MsgAsk('No se encontró al trabajador en la empresa ' + GetEmpresa + '.' + CRLF + '¿Desea realizar la búsqueda sin el filtro de empresa?') then
      begin
        sCUIL := mskCUIL.Text;
        sNombre := cmbNombre.Text;

        iValor0 := FFilters[0];
        iValor1 := FFilters[1];
        iValor2 := FFilters[2];
        iValor3 := FFilters[3];

        IdRelaLaboral := ART_EMPTY_ID;
        IdEmpresa := ART_EMPTY_ID;
        Contrato := ART_EMPTY_ID;
        IdEstableci := ART_EMPTY_ID;

        try
          Clear;
          mskCUIL.Text := sCUIL;
          cmbNombre.Text := sNombre;
          FIsFiltering := True;
          Application.ProcessMessages;
          cmbNombre.DoDropDown(True);
        finally
          FFilters[0] := iValor0;
          FFilters[1] := iValor1;
          FFilters[2] := iValor2;
          FFilters[3] := iValor3;
        end;

        if sdqDatos.IsEmpty then
          sMensaje := 'No se encontró al trabajador en toda la base de datos.';

        if sdqDatos.RecordCount = 1 then
        begin
          Filtered := True;
          sMensaje := 'No se encontró al trabajador en la empresa ' + GetEmpresa + '.';
          bNoTrabajadorAusente := True;
          try
            LoadValues( True );
          finally
            bNoTrabajadorAusente := False;
          end;
        end;

        Application.ProcessMessages;
        FIsFiltering := False;

        if (sMensaje > '') and (sdqDatos.RecordCount <= 1) then
          InfoHint(AWinControl, sMensaje, False, 'Información', blnInfo, 3, False);
      end {else
        Clear;}
    end else
      inherited;
  end;
end;

function TfraTrabajadorSiniestro.GetIsFiltering: boolean;
begin
  Result := FIsFiltering;
end;

destructor TfraTrabajadorSiniestro.Destroy;
begin
  tslCUIT.Free;
  inherited;
end;

function TfraTrabajadorSiniestro.GetOrd: Integer;
begin
  if IsSelected then
    Result := edSiniestro.Orden
  else
    Result := ART_EMPTY_ID;
end;

function TfraTrabajadorSiniestro.GetRec: Integer;
begin
  if IsSelected then
    Result := edSiniestro.Recaida
  else
    Result := ART_EMPTY_ID;
end;

function TfraTrabajadorSiniestro.GetSin: Integer;
begin
  if IsSelected then
    Result := edSiniestro.Siniestro
  else
    Result := ART_EMPTY_ID;
end;

function TfraTrabajadorSiniestro.GetSqlOrderBy: String;
begin
  if FSoloSiniestrados then
    Result := ' ' + SQL_ORDERBY + ' EX_FECHAACCIDENTE DESC, NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) DESC '
  else
    Result := inherited GetSqlOrderBy;
end;

procedure TfraTrabajadorSiniestro.Change;
var
  blnGlobo: TBalloonType;
begin
  inherited;
  with edSiniestro do
  if IsSelected and TieneSiniestro then
  begin
    { Pone en negrita el Orden si existen siniestros múltiples para el siniestro }
    CambiarEstilo(FOrden, TieneMultiplesOrdenes(Siniestro, Orden), 'Existen siniestros múltiples');

    { Pone en negrita la Recaída si existen recaídas del siniestro }
    CambiarEstilo(FRecaida, TieneMultiplesRecaidas(Siniestro, Orden, Recaida), 'Existen recaídas múltiples');

    sdqMensajes.Close;
    OpenQueryEx(sdqMensajes, [IdSiniestro], sdqMensajes.SQL.Text);
    if (not sdqMensajes.IsEmpty) and not IsEmptyString(sdqMensajes.Fields[0].AsString) then
    begin
      case sdqMensajes.FieldByName('estado').AsInteger of
        0: blnGlobo := blnInfo;
        1: blnGlobo := blnError;
        2: blnGlobo := blnWarning;
        else
           blnGlobo := blnInfo;
      end;

      InfoHint(edSiniestro, sdqMensajes.Fields[0].AsString, False, 'Información', blnGlobo);
      sdqMensajes.Close;
    end;
  end else
    ClearSiniestroStyle;
end;


end.
