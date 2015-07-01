unit unFraTrabajadorSiniestro_D5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraTrabajador, Db, SDEngine, ToolEdit, ArtComboBox, StdCtrls, Mask,
  SinEdit, unArt, PatternEdit;

type
  TfraTrabajadorSiniestro_D5 = class(TfraTrabajador)
    edSiniestro: TSinEdit;
    lbSiniestro: TLabel;
    procedure edSiniestroSelect(Sender: TObject);
  private
    procedure Internal_SetSiniestro(ASiniestro, AOrden, ARecaida: Integer; DoChanges : Boolean = False);
  protected
    function GetIdSiniestro: TTableId; virtual;
    procedure SetIdSiniestro(const Value: TTableId); virtual;
    
    procedure SetEditorsValues; override;
    function ClearOnExit: boolean; override;
    function CancelExitLoad: boolean; override;
    function GetSql: String; override;
  public
    procedure Clear; override;
  published
    property IdSiniestro: TTableId read GetIdSiniestro write SetIdSiniestro; 
  end;

implementation

uses
  SqlFuncs, AnsiSql, unDmPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraTrabajadorSiniestro }
{----------------------------------------------------------------------------------------------------------------------}
function TfraTrabajadorSiniestro_D5.GetSql: String;
begin
  Result := inherited GetSql;
  AddTable(Result, 'SEX_EXPEDIENTES');
  AddField(Result, 'EX_ID');
  AddField(Result, 'EX_SINIESTRO');
  AddField(Result, 'EX_ORDEN');
  AddField(Result, 'EX_RECAIDA');
  AddCondition(Result, 'EX_CUIL = TJ_CUIL');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraTrabajadorSiniestro_D5.SetEditorsValues;
begin
  inherited;
  edSiniestro.SetValues(sdqDatos.FieldByName('EX_SINIESTRO').AsString,
                        sdqDatos.FieldByName('EX_ORDEN').AsString,
                        sdqDatos.FieldByName('EX_RECAIDA').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraTrabajadorSiniestro_D5.edSiniestroSelect(Sender: TObject);
begin
  Internal_SetSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraTrabajadorSiniestro_D5.Internal_SetSiniestro(ASiniestro, AOrden, ARecaida: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere;

  AddCondition(sSql, 'EX_SINIESTRO = ' + SqlValue(ASiniestro));
  AddCondition(sSql, 'EX_ORDEN = ' + SqlValue(AOrden));
  AddCondition(sSql, 'EX_RECAIDA = ' + SqlValue(ARecaida));

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( DoChanges );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraTrabajadorSiniestro_D5.Clear;
begin
  inherited;
  edSiniestro.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraTrabajadorSiniestro_D5.CancelExitLoad: boolean;
begin
  if (not edSiniestro.IsEmpty) and
     ((not sdqDatos.Active) or (not edSiniestro.CompareValues(sdqDatos.FieldByName('EX_SINIESTRO').AsInteger,
                                                              sdqDatos.FieldByName('EX_ORDEN').AsInteger,
                                                              sdqDatos.FieldByName('EX_RECAIDA').AsInteger))) Then
  begin
    Internal_SetSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, True );

    Result := True;
  end else
    Result := inherited CancelExitLoad;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraTrabajadorSiniestro_D5.ClearOnExit: boolean;
begin
  Result := (inherited ClearOnExit) and edSiniestro.IsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraTrabajadorSiniestro_D5.GetIdSiniestro: TTableId;
begin
  FrameExit(Nil); // Valida que todo este completo
  if sdqDatos.Active Then
    Result := sdqDatos.FieldByName('EX_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraTrabajadorSiniestro_D5.SetIdSiniestro(const Value: TTableId);
var
  sSql : String;
begin
  sSql := GetSql + GetSqlWhere + ' AND EX_ID = ' + SqlInt( Value );

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
