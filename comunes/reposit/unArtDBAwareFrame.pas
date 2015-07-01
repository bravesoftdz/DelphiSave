
{********************************************************}
{                                                        }
{    ArtDBAwareFrame Unit                                }
{    Es la clase base en la cual se heredarán todos los  }
{    frames de los sistemas ART que sean DataAware.      }
{    Utiliza un DataLink como todos los componentes      }
{    DataAware de Delphi.                                }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

unit unArtDBAwareFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, DBCtrls, DB;

type
  TArtDBAwareFrame = class(TArtFrame)
  private
    FDataLink: TFieldDataLink;
    {procedure ActiveChange(Sender: TObject);}
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
  protected
    ExitInProgress: Boolean;  
    procedure DataChange(Sender: TObject); virtual;
    procedure UpdateData(Sender: TObject); virtual;

    procedure Change; override;
    procedure SetKeyValue(Value: Variant); virtual; abstract;
    function GetKeyValue: Variant; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation

{$R *.DFM}

procedure TArtDBAwareFrame.Change;
begin
  FDataLink.Modified;
  inherited;
end;

constructor TArtDBAwareFrame.Create(AOwner: TComponent);
begin
  inherited;

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  //FDataLink.OnActiveChange := ActiveChange;
  ExitInProgress := False;  
end;

procedure TArtDBAwareFrame.DataChange(Sender: TObject); { Para que sea DBAware }
begin
  if FDataLink.Field <> nil then
  begin
    SetKeyValue(FDataLink.Field.Value);
    if FDataLink.Editing {and FDataLink.FModified} then
      Modified := True;
  end else
    Clear;
end;

destructor TArtDBAwareFrame.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited;
end;

procedure TArtDBAwareFrame.EditingChange(Sender: TObject);
begin
//  Locked := not FDataLink.Editing;
  ReadOnly := not FDataLink.Editing;
end;

function TArtDBAwareFrame.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TArtDBAwareFrame.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TArtDBAwareFrame.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TArtDBAwareFrame.SetDataSource(const Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TArtDBAwareFrame.UpdateData(Sender: TObject);
begin
  if Assigned(FDataLink) and Assigned(FDataLink.Field) then
    FDataLink.Field.Value := GetKeyValue;
end;

end.
