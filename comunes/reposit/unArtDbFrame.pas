
{********************************************************}
{                                                        }
{    ArtDBFrame Unit                                     }
{    Este frame es la clase abstracta base para          }
{    cualquier frame de búsqueda en la base de datos     }
{                                                        }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

unit unArtDbFrame;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF} 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, unArtDBAwareFrame, unArt, Db, SDEngine;

type
  TRecordPosition = (rpFirst, rpNext, rpPrior, rpLast);

  TArtDbFrame = class(TArtDBAwareFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
  private
    procedure SetShowBajas(const Value: Boolean);
  protected
    FShowBajas: Boolean;
    FSql: String;
    FExtraCondition: String;
    FExtraFields: String;
    function GetIsEmpty: boolean; virtual;
    function GetIsSelected: boolean; virtual;
    function GetValue: TTableID; virtual; abstract;
    procedure SetValue(const Value: TTableID); virtual; abstract;
    function GetSql: string; virtual;
    function GetSqlOrderBy: string; virtual; abstract;
    function GetSqlWhere: string; virtual; abstract;
    function IsBaja: Boolean; virtual; abstract;

    procedure SetKeyValue(Value: Variant); override;
    function GetKeyValue: Variant; override;

    procedure LoadValues( DoChanges : boolean = False); virtual; abstract;
    procedure SelectRecord( RecordPosition : TRecordPosition ); virtual;

    property Value: TTableID read GetValue write SetValue;
  public
    procedure Reload; virtual;
    procedure Clear; override;

    procedure SelectFirst; virtual;
    procedure SelectNext;  virtual;
    procedure SelectPrior; virtual;
    procedure SelectLast;  virtual;

    property IsSelected: Boolean read GetIsSelected;
    property IsEmpty: Boolean read GetIsEmpty;
  published
    property ShowBajas: Boolean read FShowBajas write SetShowBajas default False;
    property Sql: string read GetSql write FSql;
    property ExtraFields: string read FExtraFields write FExtraFields;
    property ExtraCondition: string read FExtraCondition write FExtraCondition;
  end;

{var
  ArtDbFrame: TArtDbFrame;}

implementation

uses unDmPrincipal;

{$R *.DFM}

{ TArtDbFrame }

procedure TArtDbFrame.Clear;
begin
  Font.Color := clWindowText;
  sdqDatos.Close;
end;

function TArtDbFrame.GetIsEmpty: boolean;
begin
  Result := GetValue = ART_EMPTY_ID;
end;

function TArtDbFrame.GetIsSelected: boolean;
begin
  Result := not GetIsEmpty;
end;

function TArtDbFrame.GetKeyValue: Variant;
begin
  Result := GetValue;
end;

function TArtDbFrame.GetSql: String;
begin
  Result := FSql;
end;

procedure TArtDbFrame.Reload;
begin
  if sdqDatos.Active Then
  begin
    sdqDatos.Refresh;
    LoadValues( False );
  end;
end;

procedure TArtDbFrame.SelectFirst;
begin
  SelectRecord( rpFirst );
end;

procedure TArtDbFrame.SelectLast;
begin
  SelectRecord( rpLast );
end;

procedure TArtDbFrame.SelectNext;
begin
  SelectRecord( rpNext );
end;

procedure TArtDbFrame.SelectPrior;
begin
  SelectRecord( rpNext );
end;

procedure TArtDbFrame.SelectRecord(RecordPosition: TRecordPosition);
Var sSql : String;
begin
  if not sdqDatos.Active Then
  begin
    sSql := GetSql + GetSqlWhere + GetSqlOrderBy;
    OpenQuery(sdqDatos, sSql, True);
  end;

  Case RecordPosition of
    rpFirst: sdqDatos.First;
    rpNext:  sdqDatos.Next ;
    rpPrior: sdqDatos.Prior ;
    rpLast:  sdqDatos.Last ;
  end;

  LoadValues( True );
end;

procedure TArtDbFrame.SetKeyValue(Value: Variant);
begin
  if VarIsNull(Value) Then
    Clear
  else
    SetValue(Value);
end;

procedure TArtDbFrame.SetShowBajas(const Value: Boolean);
begin
  FShowBajas := Value;
end;

end.
