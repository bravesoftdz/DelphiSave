unit unCargaLT;

interface
uses
  Classes, DBClient, unStringsLT, DB, XMLIntf, XMLDoc, Dialogs, Forms;

type
  TCarga = class(TComponent)
  private
      FArcList: TStringList;
      FClientDS: TClientDataSet;
      FPath: WideString;
      FXMLFile: TXMLDocument;
      procedure CrearDataSet;
      function GetPath: WideString;
      procedure SetPath(Value: WideString);
  public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Cargar;
      procedure CargarArchivos;
      procedure CargarDataSet;
      property Path: WideString read GetPath write SetPath;
      property ClientDS: TClientDataSet read FClientDS;
  end;

implementation

uses
  SysUtils, unComunesLT;

{ TCarga }

constructor TCarga.Create(aOwner: TComponent);
begin
  inherited;
  FClientDS := TClientDataSet.Create(Self);
  FClientDS.IndexDefs.Add('idxNombre', 'Nombre', [ixPrimary, ixUnique]);
  FXMLFile := TXMLDocument.Create(Self);
  FArcList := TStringList.Create;
end;

destructor TCarga.Destroy;
begin
  inherited;
  if Assigned(FClientDS) then begin
    FClientDS := nil;
    FreeAndNil(FClientDS);
  end;

  if Assigned(FXMLFile) then begin
    FXMLFile := nil;
    FreeAndNil(FXMLFile);
  end;

  if Assigned(FArcList) then FreeAndNil(FArcList);

end;

procedure TCarga.Cargar;
begin
  CrearDataSet;
  CargarArchivos;
end;

procedure TCarga.CargarArchivos;
var
  sr: TSearchRec;
  i: Word;
begin
  try
    if FindFirst(FPath + '_Procesado_*.xml', faArchive, sr) = 0 then begin
      repeat
          FArcList.Add(sr.Name);
      until FindNext(sr) <> 0;

      for i := 0 to FArcList.Count -1 do begin
        FXMLFile.LoadFromFile(FPath + FArcList[i]);
        CargarDataSet;
      end;
    end;
  finally
    FindClose(sr);
  end;

end;

procedure TCarga.CargarDataSet;
var
  ndoEntidad, ndoNombre, ndoDire: IXMLNode;
begin
  ndoEntidad := FXMLFile.DocumentElement.ChildNodes.FindNode(NOD_ENTIDAD);
  while Assigned(ndoEntidad) do begin
    ndoNombre := ndoEntidad.ChildNodes.FindNode(FIELD_NOMBRE);
    ndoDire := ndoEntidad.ChildNodes.FindNode(FIELD_DIRECCION);
    try
      FClientDS.Insert;
      FClientDS.FieldByName(FIELD_NOMBRE).Value := ndoNombre.Text;
      FClientDS.FieldByName(FIELD_DIRECCION).Value :=
          iif(ndoDire.Text = EmptyStr, NOD_ND, ndoDire.Text);
      FClientDS.Post;
    except
      on e: EDBClient do
        {cancela el post del registro duplicado del error para continuar con el siguiente}
        FClientDS.Cancel;
    end;
    ndoEntidad := ndoEntidad.NextSibling;
  end;

end;

procedure TCarga.CrearDataSet;
begin
  FClientDS.FieldDefs.Add(FIELD_NOMBRE, ftString, 255, True);
  FClientDS.FieldDefs.Add(FIELD_DIRECCION, ftString, 255, True);
  FClientDS.CreateDataSet;
  FClientDS.Open;
  FClientDS.IndexFieldNames := FIELD_NOMBRE;
end;

function TCarga.GetPath: WideString;
begin
  Result := FPath;
end;

procedure TCarga.SetPath(Value: WideString);
begin
  FPath := Value;
end;

end.
