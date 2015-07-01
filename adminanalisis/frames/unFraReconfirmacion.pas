unit unFraReconfirmacion;

interface

uses
  Windows, Graphics, unArtDbFrame, PatternEdit, DateTimeEditors, Controls, StdCtrls, Mask, ToolEdit, ArtComboBox, Db,
  Classes, Cuit, SDEngine;

type
  TReconfirmacion = record
    Estudio: String;
    Fecha  : TDate;
    Carpeta: Integer;
  end;

  TfraReconfirmacion = class(TArtDbFrame)
    cmbEstudio: TArtComboBox;
    edFecha: TDateEditor;
    procedure cmbEstudioDropDown(Sender: TObject);
    procedure cmbEstudioCloseUp(Sender: TObject);
    procedure cmbEstudioGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edFechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
  private
    FCuil: TCuil;
    FFecha: TDateTime;

    function GetValue: TReconfirmacion; reintroduce;

    procedure SetCuil(const Value: TCuil);
    procedure SetEditorsValues; virtual;
    procedure SetFecha(const Value: TDateTime);
    procedure SetValue(const Value: TReconfirmacion); reintroduce;
  protected
    function GetIsEmpty: Boolean; override;
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere: String; override;
    function IsBaja: Boolean; override;

    procedure LoadValues(DoChanges: Boolean = False); override;
  public
    procedure Clear; override;
  published
    property Cuil : TCuil           read FCuil    write SetCuil;
    property Fecha: TDateTime       read FFecha   write SetFecha;
    property Value: TReconfirmacion read GetValue write SetValue;
  end;

var
  fraReconfirmacion: TfraReconfirmacion;

function Reconfirmacion(Fecha: TDate; Estudio: String; Carpeta: Integer): TReconfirmacion;

implementation

{$R *.DFM}

uses
  AnsiSql, unDmPrincipal;

function Reconfirmacion(Fecha: TDate; Estudio: String; Carpeta: Integer): TReconfirmacion;
begin
  Result.Estudio:= Estudio;
  Result.Fecha  := Fecha;
  Result.Carpeta:= Carpeta;
end;

procedure TfraReconfirmacion.Clear;
begin
  inherited;
  cmbEstudio.Text := '';
  edFecha.Clear;
end;

function TfraReconfirmacion.GetSql: String;
begin
//                     'DECODE(ET_TIPORES, ''N'', ''Normal'', ''A'', ''Anormal'') TIPORES, ET_FECHABAJA ' +
  Result :=
    'SELECT ET_CUIT, MP_NOMBRE, ET_FECHA, ET_ESTUDIO, ES_DESCRIPCION, ' +
            SqlDecode('ET_TIPORES', ['''N''', '''A'''], ['''Normal''', '''Anormal''']) + ' TIPORES, ET_FECHABAJA, ET_IDCARPETAAMP, ET_IDDETALLEARCHIVO' +
     ' FROM AES_ESTUDIOS, AET_ESTRAB, CMP_EMPRESAS' +
    ' WHERE ET_CUIT = MP_CUIT' +
      ' AND ET_TIPO = ''EP''' +
      ' AND ET_ESTUDIO = ES_CODIGO' +
      ' AND ET_CUIL = ' + SqlValue(FCuil);
end;

function TfraReconfirmacion.GetSqlOrderBy: String;
begin
  Result := ' ORDER BY ET_FECHA';
end;

function TfraReconfirmacion.GetSqlWhere: String;
begin
  if FFecha <> 0 then
    Result := ' AND ET_FECHA < ' + SqlDateTime(FFecha)
  else
    Result := ' ';
end;

procedure TfraReconfirmacion.SetCuil(const Value: TCuil);
begin
  if FCuil <> Value then
  begin
    FCuil := Value;
    Clear;
  end;
end;

procedure TfraReconfirmacion.cmbEstudioDropDown(Sender: TObject);
begin
  if FCuil <> '' then
    OpenQuery(sdqDatos, GetSql + GetSqlWhere + GetSqlOrderBy, True);
end;

function TfraReconfirmacion.GetValue: TReconfirmacion;
begin
  FrameExit(nil); // Valida que todo este completo

  if sdqDatos.Active then
  begin
    Result.Fecha  := sdqDatos.FieldByName('ET_FECHA').AsDateTime;
    Result.Estudio:= sdqDatos.FieldByName('ET_ESTUDIO').AsString;
    Result.Carpeta:= sdqDatos.FieldByName('ET_IDCARPETAAMP').AsInteger;
  end
  else
  begin
    Result.Fecha  := 0;
    Result.Estudio:= '';
    Result.Carpeta:= 0;
  end;
end;

procedure TfraReconfirmacion.SetValue(const Value: TReconfirmacion);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ET_FECHA = ' + SqlDate(Value.Fecha) +
          ' AND ET_ESTUDIO = ' + SqlString(Value.Estudio, True);

  if OpenQuery(sdqDatos, sSql, True) then
    LoadValues(False);
end;

procedure TfraReconfirmacion.LoadValues(DoChanges: Boolean);
begin
  SetEditorsValues;

  if IsBaja then
    Font.Color := clRed
  else
    Font.Color := clWindowText;

  if DoChanges then
  begin
    if Assigned(FOnChange) then
      OnChange(Self);

    if (edFecha.Date <> 0) and (cmbEstudio.Text <> '') then {Se se cragaron los datos}
      DoLostFocus;
  end;
end;

procedure TfraReconfirmacion.SetEditorsValues;
begin
  edFecha.Date    := sdqDatos.FieldByName('ET_FECHA').AsDateTime;
  cmbEstudio.Text := sdqDatos.FieldByName('ET_ESTUDIO').AsString;
end;

procedure TfraReconfirmacion.SetFecha(const Value: TDateTime);
begin
  if FFecha <> Value then
  begin
    if Value > GetValue.Fecha then
      Clear;
    FFecha := Value;
  end;
end;

function TfraReconfirmacion.IsBaja: Boolean;
begin
  Result := False;
end;

procedure TfraReconfirmacion.cmbEstudioCloseUp(Sender: TObject);
begin
  if (cmbEstudio.Text = '') then
    Clear
  else
    LoadValues(True);
end;

function TfraReconfirmacion.GetIsEmpty: Boolean;
begin
  Result := (GetValue.Fecha = 0) or (GetValue.Estudio = '');
end;

procedure TfraReconfirmacion.cmbEstudioGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                     var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('ET_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfraReconfirmacion.edFechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbEstudio.DoDropDown;
end;

procedure TfraReconfirmacion.FrameExit(Sender: TObject);
begin
//  inherited; 
end;

end.
