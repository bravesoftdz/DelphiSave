unit unFraSAU_AUTORIZACIONES;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ArtComboBox, unArtDBAwareFrame, unArtDbFrame, ComboEditor,
  DBComboGrid, Buttons, unArt{$IFNDEF VER130}, Variants{$ENDIF};

type
  TfraSAU_AUTORIZACIONES = class(TArtDbFrame)
    btnBusqueda: TSpeedButton;
    cmbAU_NUMAUTO: TDBIncComboGrid;
    procedure cmbAU_NUMAUTOKeyPress(Sender: TObject; var Key: Char);
  private
    FOrden: Integer;
    FSiniestro: Integer;
    FRecaida: Integer;
    procedure SetOrden(const Value: Integer);
    procedure SetRecaida(const Value: Integer);
    procedure SetSiniestro(const Value: Integer);
    procedure SetIdExpediente(const Value: TTableId);
  protected
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function GetSql: string; override;
    function GetSqlOrderBy: string; override;
    function GetSqlWhere: string; override;
    function IsBaja: Boolean; override;
    procedure LoadValues(DoChanges: Boolean = False); override;

    procedure Requery;
  public
    procedure Clear; override;
    constructor Create(AOwner: TComponent); override;
  published
    property Siniestro: Integer read FSiniestro write SetSiniestro;
    property Orden: Integer read FOrden write SetOrden;
    property Recaida: Integer read FRecaida write SetRecaida;
    property IdExpediente: TTableId write SetIdExpediente;
  end;

implementation

{$R *.DFM}

uses
  AnsiSql, unDmPrincipal, unSiniestros;

{----------------------------------------------------------------------------------------------------------------------}
{ TfraSAU_AUTORIZACIONES }
{----------------------------------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraSAU_AUTORIZACIONES.Create(AOwner: TComponent);
begin
  FSiniestro := -1;
  FOrden := -1;
  FRecaida := -1;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSAU_AUTORIZACIONES.GetSql: string;
begin
  if FSql = '' Then
  begin
    Result := 'SELECT AU_NUMAUTO, AU_IDENTIFAPRO, AU_FECHASOLI, CA_DESCRIPCION, PR_DESCRIPCION, AU_DETALLEAPRO, ' +
                     'GP_NOMBRE, AU_OBSERVACIONES, AU_USUAPRO, AU_FECHAPRO ' +
                'FROM CPR_PRESTADOR, MPR_PRESTACIONES, MGP_GTRABAJO, SAU_AUTORIZACIONES ' +
               'WHERE CA_IDENTIFICADOR =  AU_IDENTIFAPRO ' +
                 'AND PR_CODIGO =  AU_PRESAPRO ' +
                 'AND GP_CODIGO =  AU_TRABAJO ' +
                 'AND AU_ESTADO = ''E'' ' +
                 'AND AU_SINIESTRO = ' + SqlValue(FSiniestro) + ' ' +
                 'AND AU_ORDEN = ' + SqlValue(FOrden) + ' ' +
                 'AND AU_RECAIDA = ' + SqlValue(FRecaida) + ' ';
  end;      
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSAU_AUTORIZACIONES.GetSqlOrderBy: string;
begin
  Result := 'ORDER BY AU_NUMAUTO';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSAU_AUTORIZACIONES.GetSqlWhere: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSAU_AUTORIZACIONES.GetValue: TTableID;
begin
  Result := cmbAU_NUMAUTO.KeyValue;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraSAU_AUTORIZACIONES.IsBaja: Boolean;
begin
  Result := False; { No hay autorizaciones dadas de baja }
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.LoadValues(DoChanges: boolean);
begin
  { No hay nada que cargar }
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.SetValue(const Value: TTableID);
begin
  cmbAU_NUMAUTO.KeyValue := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.cmbAU_NUMAUTOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) Then
  begin
    if not cmbAU_NUMAUTO.Search Then
      cmbAU_NUMAUTO.Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.SetOrden(const Value: Integer);
begin
  if FOrden <> Value Then
  begin
    FOrden := Value;
    Requery;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.SetRecaida(const Value: Integer);
begin
  if FRecaida <> Value Then
  begin
    FRecaida := Value;
    Requery;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.SetSiniestro(const Value: Integer);
begin
  if FRecaida <> Value Then
  begin
    FSiniestro := Value;
    Requery;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.Requery;
var
  sSql: string;
begin
  Clear;

  if (FSiniestro <> -1) and (FOrden <> -1) and (FRecaida <> -1) Then
  begin
    sSql := GetSql + GetSqlWhere;

    OpenQuery(sdqDatos, sSql, True)
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.Clear;
begin
  cmbAU_NUMAUTO.KeyValue := Null;
//  cmbAU_NUMAUTO.Clear;
  Font.Color := clWindowText;
  { No hay que llamar al método heredado para que no limpie el Query }
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraSAU_AUTORIZACIONES.SetIdExpediente(const Value: TTableId);
begin
  DecodeIdSiniestro(Value, FSiniestro, FOrden, FRecaida);
  Requery;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
