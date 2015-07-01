unit unFraTrabajadorSinGrave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraTrabajadorSiniestro_D5, Db, SDEngine, ToolEdit, ArtComboBox, StdCtrls,
  Mask, SinEdit, PatternEdit, ImgList, ComCtrls,
  ToolWin, unFraTrabajadorSiniestro;

type
  TfraTrabajadorSinGrave = class(TfraTrabajadorSiniestro_D5)
    lbNroDenSRT: TLabel;
    edDG_NRODENUNCIASRT: TPatternEdit;
    lbCUIL: TLabel;
    Label1: TLabel;
    procedure edDG_NRODENUNCIASRTKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Internal_SetDenunciaSRT(ADenunciaSRT: string; DoChanges : Boolean = False);
  protected
    function GetIdDenunciaSRT: string; virtual;
    procedure SetIdDenunciaSRT(const Value: string); virtual;

    procedure SetEditorsValues; override;
    function ClearOnExit: boolean; override;
    function CancelExitLoad: boolean; override;
    function GetSql: String; override;
  public
    procedure Clear; override;
  published
    property IdDenunciaSRT: string read GetIdDenunciaSRT write SetIdDenunciaSRT;
  end;

implementation

{$R *.DFM}

uses
  AnsiSql, SqlFuncs, unDmPrincipal;

{ TfraTrabajadorSinGrave }

function TfraTrabajadorSinGrave.CancelExitLoad: boolean;
begin
  if (edDG_NRODENUNCIASRT.Text <> '') and
     ((not sdqDatos.Active) or (edDG_NRODENUNCIASRT.Text <> sdqDatos.FieldByName('DG_NRODENUNCIASRT').AsString)) Then
  begin
    Internal_SetDenunciaSRT(edDG_NRODENUNCIASRT.Text, True);

    Result := True;
  end else
    Result := inherited CancelExitLoad;
end;

procedure TfraTrabajadorSinGrave.Clear;
begin
  inherited;
  edDG_NRODENUNCIASRT.Clear;
end;

function TfraTrabajadorSinGrave.ClearOnExit: boolean;
begin
  Result := (inherited ClearOnExit) and (edDG_NRODENUNCIASRT.Text = '');
end;

function TfraTrabajadorSinGrave.GetIdDenunciaSRT: string;
begin
  FrameExit(Nil);
  if sdqDatos.Active Then
    Result := sdqDatos.FieldByName('DG_NRODENUNCIASRT').AsString
  else
    Result := '';
end;

function TfraTrabajadorSinGrave.GetSql: String;
begin
  Result := inherited GetSql;
  AddTable(Result, 'SDG_DENUNCIASGRAVES');
  AddField(Result, 'DG_NRODENUNCIASRT');
  AddCondition(Result, 'EX_SINIESTRO = DG_SINIESTRO');
  AddCondition(Result, 'EX_ORDEN = DG_ORDEN');
  AddCondition(Result, 'EX_RECAIDA = DG_RECAIDA');
  AddCondition(Result, 'DG_NRODENUNCIASRT IS NOT NULL');
end;

procedure TfraTrabajadorSinGrave.Internal_SetDenunciaSRT(ADenunciaSRT: string; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere + ' AND DG_NRODENUNCIASRT = ' + SqlValue(ADenunciaSRT);

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( DoChanges );
end;

procedure TfraTrabajadorSinGrave.SetEditorsValues;
begin
  inherited;
  edDG_NRODENUNCIASRT.Text := sdqDatos.FieldByName('DG_NRODENUNCIASRT').AsString;
end;

procedure TfraTrabajadorSinGrave.SetIdDenunciaSRT(const Value: string);
begin
  Internal_SetDenunciaSRT(Value, False);
end;

procedure TfraTrabajadorSinGrave.edDG_NRODENUNCIASRTKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    Internal_SetDenunciaSRT(edDG_NRODENUNCIASRT.Text, True);
end;

end.
