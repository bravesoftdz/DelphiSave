unit unFraPAE_ACCIDENTEESTABLECIMIENTO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraTrabajadorSinGrave, Db, SDEngine, PatternEdit, SinEdit, ToolEdit,
  ArtComboBox, StdCtrls, Mask, unArt;

type
  TfraPAE_ACCIDENTEESTABLECIMIENTO = class(TfraTrabajadorSinGrave)
  private
    function GetIdAccidenteEstablecimiento: TTableId;
    procedure SetIdAccidenteEstablecimiento(const Value: TTableId);
  protected
    function GetSql: String; override;
  public
  published
    property IdAccidenteEstablecimiento: TTableId read GetIdAccidenteEstablecimiento write SetIdAccidenteEstablecimiento;
  end;

implementation

{$R *.DFM}

{ TfraPAE_ACCIDENTEESTABLECIMIENTO }

uses
  AnsiSql, SqlFuncs, unDmPrincipal;

function TfraPAE_ACCIDENTEESTABLECIMIENTO.GetIdAccidenteEstablecimiento: TTableId;
begin
  FrameExit(Nil);
  if sdqDatos.Active Then
    Result := sdqDatos.FieldByName('AE_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraPAE_ACCIDENTEESTABLECIMIENTO.GetSql: String;
begin
  Result := inherited GetSql;
  AddTable(Result, 'HYS.PAE_ACCIDENTEESTABLECIMIENTO');
  AddField(Result, 'AE_ID');
  AddCondition(Result, 'DG_NRODENUNCIASRT = AE_NRODENUNCIASRT');
end;

procedure TfraPAE_ACCIDENTEESTABLECIMIENTO.SetIdAccidenteEstablecimiento(const Value: TTableId);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere + ' AND AE_ID = ' + SqlValue(Value);

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues(False);
end;

end.
