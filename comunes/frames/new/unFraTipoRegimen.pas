unit unFraTipoRegimen;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ArtComboBox, RxToolEdit, unArt;

type
  TfraTipoRegimen = class(TfraCodigoDescripcion)
  private
    FOcultarMixto: Boolean;
    FIdRegimenPorDefecto: TValueType;
    procedure SetOcultarMixto(const Value: Boolean);
    procedure SetIdRegimenPorDefecto(const Value: TValueType);
  protected
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
    property FieldBaja;
    property ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OcultarMixto: Boolean            read FOcultarMixto            write SetOcultarMixto            default True;
    property IdRegimenPorDefecto: TValueType  read FIdRegimenPorDefecto     write SetIdRegimenPorDefecto;
  end;

implementation

uses
  AnsiSql, unDmPrincipal, General;

{$R *.DFM}

constructor TfraTipoRegimen.Create(AOwner: TComponent);
begin
  inherited;

  CaseSensitive   := False;

  FTableName      := 'AFI.ATR_TIPOREGIMEN';
  FFieldID        := 'TR_ID';
  FFieldCodigo    := 'TR_CODIGO';
  FFieldDesc      := 'TR_DESCRIPCION';
  FFieldBaja      := 'TR_FECHABAJA';
  FExtraFields    := '';

  OcultarMixto        := True;
  IdRegimenPorDefecto := {$IFDEF ART2} 1 {$ELSE} '1' {$ENDIF};    // 1: Régimen General
end;

procedure TfraTipoRegimen.SetOcultarMixto(const Value: Boolean);
begin
  if FOcultarMixto <> Value then
    begin
      FOcultarMixto  := Value;
      ExtraCondition := 'AND TR_TIPO <> ''M''';
    end;
end;

procedure TfraTipoRegimen.SetIdRegimenPorDefecto(const Value: TValueType);
begin
  if FIdRegimenPorDefecto <> Value then
    begin
      FIdRegimenPorDefecto := Value;
      SetValue(Value);
    end;
end;

end.
