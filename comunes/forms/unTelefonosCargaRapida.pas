unit unTelefonosCargaRapida;

{
 INFORMACIÓN DE LA UNIDAD
 AUTOR:               ÁLVARO LAPACÓ
 FECHA DE CREACIÓN:   23-11-05
 DETALLE: Formulario utilizado por unFraTelefono.pas para hacer un ABM rápido de teléfonos.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, CustomDlgs, SDEngine, unDmPrincipal;

const
  MAX_TELEFONOS = 10;

type
  TfrmTelefonosCargaRapida = class(TForm)
    sgTelefonos: TStringGrid;
    procedure sgTelefonosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure sgTelefonosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgTelefonosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    FIdsTelefonos: TStringList;   // Guarda los IDs de las tablas de origen de cada teléfono..
    FIsClosing: Boolean;
    FTiposTelefono: TStringList;

    function GetCantidadTelefonos: Integer;
    procedure SetCantidadTelefonos(const Value: Integer);

    function GetIdTipoTelefono(const aDetalle: String): Integer;
    function RowIsEmpty(const aRowIndex: Integer): Boolean;

    procedure DoGuardarTelefonos;
    procedure FillColumnaTipo(const aKey: Char);
    procedure FillGrilla;
    procedure GetTiposTelefono;
    procedure InitForm;
    procedure InitGrilla(const aAnchos: Array of Integer; const aTitulos: Array of String);
  public
    procedure Mostrar;

    property CantidadTelefonos: Integer read GetCantidadTelefonos write SetCantidadTelefonos;
  end;

var
  frmTelefonosCargaRapida: TfrmTelefonosCargaRapida;

implementation

uses
  AnsiSql, SqlFuncs, unFraTelefono, unSesion, General;

{$R *.DFM}

function TfrmTelefonosCargaRapida.GetCantidadTelefonos: Integer;
begin
  Result := sgTelefonos.RowCount - 1;
end;

function TfrmTelefonosCargaRapida.GetIdTipoTelefono(const aDetalle: String): Integer;
var
  iLoop: Integer;
begin
  Result := 1;

  for iLoop := 0 to FTiposTelefono.Count - 1 do
    if FTiposTelefono.Values[FTiposTelefono.Names[iLoop]] = aDetalle then
    try
      Result := StrToInt(FTiposTelefono.Names[iLoop]);
      Exit;
    except
      Result := 1;
    end;
end;

procedure TfrmTelefonosCargaRapida.SetCantidadTelefonos(const Value: Integer);
begin
  if (Value < 1) or (Value > MAX_TELEFONOS) then
  begin
    MsgBox(Format('Valor Inválido. El valor debe estar entre 1 y %d', [MAX_TELEFONOS]));
    Exit;
  end;

  sgTelefonos.RowCount := Value + 1;
end;


function TfrmTelefonosCargaRapida.RowIsEmpty(const aRowIndex: Integer): Boolean;
var
  iLoop: Integer;
begin
// Devuelve True si la fila tiene todos los campos vacíos..

  Result := True;

//  Result := (Trim(sgTelefonos.Cells[1, iLoop]) = '');

  for iLoop := 0 to sgTelefonos.ColCount - 1 do
    if Trim(sgTelefonos.Cells[iLoop, aRowIndex]) <> '' then
    begin
      Result := False;
      Break;
    end;
end;


procedure TfrmTelefonosCargaRapida.DoGuardarTelefonos;
var
  iLoop: Integer;
  iRegistroTelId: Integer;
  sEstado: String;
begin
// Guarda los teléfonos en la tabla temporal de teléfonos..

  with TSql.Create('tmp.tmp_telefonos') do
  try
    SqlType := stInsert;

    for iLoop := 1 to sgTelefonos.RowCount - 1 do
    begin
      iRegistroTelId := 0;
      if RowIsEmpty(iLoop) then
      try
        sEstado := 'B';
        iRegistroTelId := StrToIntDef(FIdsTelefonos[iLoop - 1], 0);
      except
        iRegistroTelId := 0;
      end
      else
      try
        FIdsTelefonos[iLoop - 1];
        iRegistroTelId := StrToIntDef(FIdsTelefonos[iLoop - 1], 0);
        sEstado := 'M';
      except
        sEstado := 'A';
      end;

      Clear;
      PrimaryKey.Add('mp_id', 				iRegistroTelId, False);
      Fields.Add('mp_usuarioid', 			Sesion.ID);
      Fields.Add('mp_tablatel', 			TfraTelefono(Self.Owner).Tabla);
      Fields.Add('mp_registrotelid', 	iRegistroTelId);
      Fields.Add('mp_tablapadreid', 	TfraTelefono(Self.Owner).Id);
      Fields.Add('mp_tipo', 					TfraTelefono(Self.Owner).Tipo);
      Fields.Add('mp_idtipotelefono', GetIdTipoTelefono(sgTelefonos.Cells[3, iLoop]));
      Fields.Add('mp_area', 					sgTelefonos.Cells[0, iLoop]);
      Fields.Add('mp_numero', 				sgTelefonos.Cells[1, iLoop]);
      Fields.Add('mp_interno', 				sgTelefonos.Cells[2, iLoop]);
      Fields.Add('mp_principal', 			String(IIF((iLoop = 1), 'S', 'N')));
      Fields.Add('mp_observacion', 		'');
      Fields.Add('mp_estado', 				sEstado);

      try
        EjecutarSql(Sql);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;

    TfraTelefono(Self.Owner).HasChanges := True;
  finally
    Free;
  end;
end;

procedure TfrmTelefonosCargaRapida.FillColumnaTipo(const aKey: Char);
var
  iLoop: Integer;
  sDetalle: String;
begin
  for iLoop := 0 to FTiposTelefono.Count - 1 do
  begin
    sDetalle := FTiposTelefono.Values[FTiposTelefono.Names[iLoop]];
    if UpperCase(Copy(sDetalle, 1, 1)) = UpperCase(aKey) then
      sgTelefonos.Cells[sgTelefonos.Col, sgTelefonos.Row] := sDetalle; 
  end;
end;

procedure TfrmTelefonosCargaRapida.FillGrilla;
var
  iIndex: Integer;
  sSql: String;
begin
// Lleno la grilla con los datos de la tabla temporal..

  sSql :=
    'SELECT   *' +
       ' FROM tmp.tmp_telefonos, att_tipotelefono' +
      ' WHERE mp_idtipotelefono = tt_id' +
        ' AND mp_usuarioid = :usuarioid' +
        ' AND mp_tablatel = :tablatel' +
        ' AND mp_tablapadreid = :tablapadreid' +
        ' AND mp_tipo = :tipo' +
        ' AND mp_estado <> ''B''' +
   ' ORDER BY mp_principal DESC';

  with GetQueryEx(sSql, [Sesion.ID, TfraTelefono(Self.Owner).Tabla, TfraTelefono(Self.Owner).Id, TfraTelefono(Self.Owner).Tipo]) do
  try
    iIndex := 1;
    while not Eof do
    begin
      FIdsTelefonos.Add(FieldByName('mp_registrotelid').AsString);
      sgTelefonos.Cells[0, iIndex] := FieldByName('mp_area').AsString;
      sgTelefonos.Cells[1, iIndex] := FieldByName('mp_numero').AsString;
      sgTelefonos.Cells[2, iIndex] := FieldByName('mp_interno').AsString;
      sgTelefonos.Cells[3, iIndex] := FTiposTelefono.Values[FieldByName('mp_idtipotelefono').AsString];

      Inc(iIndex);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmTelefonosCargaRapida.GetTiposTelefono;
var
  sSql: String;
begin
  sSql := 'SELECT tt_id, tt_descripcion FROM att_tipotelefono';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      FTiposTelefono.Add(Format('%d=%s', [FieldByName('tt_id').AsInteger, FieldByName('tt_descripcion').AsString]));
      sgTelefonos.Hint := sgTelefonos.Hint + Copy(FieldByName('tt_descripcion').AsString, 1, 1) + ' = ' + FieldByName('tt_descripcion').AsString + #13 + #10;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmTelefonosCargaRapida.InitGrilla(const aAnchos: Array of Integer; const aTitulos: Array of String);
var
  iLoop: Integer;
begin
// Inicializa la grilla..

  for iLoop := Low(aTitulos) to High(aTitulos) do
  begin
    sgTelefonos.ColWidths[iLoop] := aAnchos[iLoop];
    sgTelefonos.Cells[iLoop, 0]  := aTitulos[iLoop];
  end;
end;

procedure TfrmTelefonosCargaRapida.Mostrar;
begin
// Llama a las funciones de inicialización y muestra el formulario..

  FIdsTelefonos := TStringList.Create;
  FIsClosing := False;
  FTiposTelefono := TStringList.Create;

  GetTiposTelefono;
  InitForm;
  InitGrilla([64, 128, 88, 144], ['Área', 'Número', 'Interno', 'Tipo']);
  FillGrilla;

  Show;
end;

procedure TfrmTelefonosCargaRapida.InitForm;
begin
// Inicializa la posición del formulario..

  Self.Left := TfraTelefono(Self.Owner).cmbTelefonos.ClientToScreen(Point(0,0)).X;
  Self.Top := TfraTelefono(Self.Owner).cmbTelefonos.ClientToScreen(Point(0,0)).Y;
  if (Self.Top + Self.Height) > Screen.Height then
    Self.Top := Self.Top - Self.Height;
end;

procedure TfrmTelefonosCargaRapida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  if not FIsClosing then
  begin
    TfraTelefono(Self.Owner).QuitarTelefonosTemporales;
    DoGuardarTelefonos;
    TfraTelefono(Self.Owner).FillCombo(False, TfraTelefono(Self.Owner).Id);
  end;

  FIsClosing := True;
end;

procedure TfrmTelefonosCargaRapida.FormDeactivate(Sender: TObject);
begin
  Close;

  // Paso el foco del formulario principal al control que le sigue al frame de teléfonos..
  TControl(Self.Owner.Owner).Perform(WM_NEXTDLGCTL, 0, 0);
  TControl(Self.Owner.Owner).Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmTelefonosCargaRapida.sgTelefonosKeyPress(Sender: TObject; var Key: Char);
var
  bAcceptKey: Boolean;
begin
  if Key = #13 then
    Close;

  bAcceptKey := True;

  if sgTelefonos.Col = 3 then
  begin
    FillColumnaTipo(Key);
    if Ord(Key) = 8 then
      sgTelefonos.Cells[sgTelefonos.Col, sgTelefonos.Row] := '';
    bAcceptKey := False;
  end
  else
  begin
    if (Key in ['0'..'9']) then
      case sgTelefonos.Col of
        0:  bAcceptKey := (Length(sgTelefonos.Cells[0, sgTelefonos.Row]) < 5);
        1:  bAcceptKey := (Length(sgTelefonos.Cells[1, sgTelefonos.Row]) < 12);
        2:  bAcceptKey := (Length(sgTelefonos.Cells[2, sgTelefonos.Row]) < 10);
      end
    else if Ord(Key) <> 8 then
      bAcceptKey := False;
  end;

  if not bAcceptKey then
    Key := #0;
end;

procedure TfrmTelefonosCargaRapida.sgTelefonosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    Close;
  if (sgTelefonos.Col = 2) and (sgTelefonos.Row = 5) and (Key = 9) and (not (ssShift in Shift)) then
    Close;
end;

procedure TfrmTelefonosCargaRapida.FormDestroy(Sender: TObject);
begin
  FIdsTelefonos.Free;
  FTiposTelefono.Free;
end;

procedure TfrmTelefonosCargaRapida.sgTelefonosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  iXDesde: Integer;
  iXHasta: Integer;
  iYDesde: Integer;
  iYHasta: Integer;
begin
  with sgTelefonos do
  begin
    iXDesde := ColWidths[0] + ColWidths[1] + ColWidths[2];
    iXHasta := iXDesde + ColWidths[3];

    iYDesde := 0;
    iYHasta := RowHeights[0];

    sgTelefonos.ShowHint := (X >= iXDesde) and (X <= iXHasta) and (Y >= iYDesde) and (Y <= iYHasta);
  end;
end;

end.
