unit unfraLocalidad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtDbFrame, StdCtrls, Mask, ToolEdit,
  ArtComboBox, IntEdit, Db, SDEngine, ExComboBox, unArt, CheckCombo, PatternEdit, ComboEditor;

type
  TfraLocalidad = class(TArtDbFrame)
    lbCPostal: TLabel;
    lbLocalidad: TLabel;
    cmbLocalidad: TArtComboBox;
    lbProvincia: TLabel;
    cmbProvincia: TCheckCombo;
    edCPostal: TPatternEdit;
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure cmbProvinciaKeyPress(Sender: TObject; var Key: Char);
  private
    FCPostal: String;
    FListaIDs: TStringList;
    FLocalidad: String;
    FProvincia: String;
  protected
    function GetProvincias: String;

    procedure EjecutaConsulta; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetWhere: String;
    function IsEmpty: Boolean;
    function IsSelected: Boolean;

    procedure CargarProvincias;
    procedure CheckProvincia(idProvinciaSelected: Integer);
    procedure Clear; override;

    property FieldCPostal:   String read FCPostal   write FCPostal;
    property FieldLocalidad: String read FLocalidad write FLocalidad;
    property FieldProvincia: String read FProvincia write FProvincia;
    //property Provincias: string  read GetProvincias;
  end;

implementation
{$R *.DFM}
Uses
  unDmPrincipal, General, unCustomDataModule, AnsiSql;

procedure TfraLocalidad.CargarProvincias;
var
  sSql: String;
begin
  sSql :=
    'SELECT   pv_codigo, pv_descripcion' +
       ' FROM cpv_provincias' +
   ' ORDER BY pv_descripcion';
  with GetQuery(sSql, [qoUniDirectional]) do
  try
    while not Eof do
    begin
      cmbProvincia.Items.Add(FieldByName('pv_descripcion').AsString);
      FListaIDs.Add(FieldByName('pv_codigo').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfraLocalidad.Clear;
begin
  edCPostal.Text := '';
  cmbLocalidad.Text := '';
  cmbProvincia.Clear;
end;

procedure TfraLocalidad.cmbLocalidadDropDown(Sender: TObject);
begin
  EjecutaConsulta;
end;

constructor TfraLocalidad.Create(AOwner: TComponent);
begin
  inherited;

  FListaIDs := TStringList.Create;
  CargarProvincias;
end;

procedure TfraLocalidad.EjecutaConsulta;
var
  sSql: String;
begin
  sSql :=
    'SELECT DISTINCT ub_localidad' +
              ' FROM cub_ubicacion';
  cmbLocalidad.Text := Trim(cmbLocalidad.Text);

  if (cmbLocalidad.Text <> '') then
    sSql := sSql + ' WHERE ub_localidad LIKE ''' + cmbLocalidad.Text + '%''';

  if sdqDatos.SQL.Text <> sSql then
    OpenQuery(sdqDatos, sSql, True);
end;

procedure TfraLocalidad.cmbProvinciaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) or (Key = #8) then
    cmbProvincia.Clear;
end;

function TfraLocalidad.GetProvincias: String;
var
  iLoop: Integer;
  sCadena: String;
begin
  sCadena := '(';
  for iLoop := 0 to cmbProvincia.Items.Count - 1 do
    if cmbProvincia.Checked[iLoop] then
    begin
      if sCadena <> '(' then
        sCadena := sCadena + ',';
      sCadena := sCadena + '''' + FListaIDs[iLoop] + '''';
    end;

  sCadena := sCadena + ')';
  
  Result := sCadena;
end;

destructor TfraLocalidad.Destroy;
begin
  FListaIDs.Free;
  inherited;
end;

function TfraLocalidad.GetWhere: String;
begin
  Result := '';
  
  if FCPostal <> '' then
    if Trim(edCPostal.Text) <> '' then
      Result := Result + ' AND ' + FCPostal + ' = ' + SqlString(edCPostal.Text, True) + ' ';

  if FLocalidad <> '' then
    if (cmbLocalidad.Text <> '') then
      Result := Result + ' AND ' + FLocalidad + ' = ''' + cmbLocalidad.Text + '''';

  if FProvincia <> '' then
    if cmbProvincia.CheckedCount <> 0 then
      Result := Result + ' AND ' + FProvincia + ' IN ' + GetProvincias;
end;

function TfraLocalidad.IsEmpty: boolean;
begin
  Result := (cmbLocalidad.Text = '') and (edCPostal.Text = '') and (cmbProvincia.CheckedCount = 0);
end;

function TfraLocalidad.IsSelected: Boolean;
begin
  Result := not IsEmpty;
end;

procedure TfraLocalidad.CheckProvincia(idProvinciaSelected: Integer);
var
  iLoop: Integer;
begin
  cmbProvincia.ClearChecks(False);
  iLoop := 0;
  while (iLoop <= FListaIDs.Count - 1) and (FListaIDs[iLoop] <> IntToStr(idProvinciaSelected)) do
    iLoop := iLoop + 1;

  if (iLoop <= FListaIDs.Count - 1) then
  begin
    cmbProvincia.EditText := cmbProvincia.Items[iLoop] + ';';
    cmbProvincia.Checked[iLoop] := True;
  end;
end;

end.
