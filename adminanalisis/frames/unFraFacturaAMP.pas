unit unFraFacturaAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, unArtDbFrame, unArt, Db, SDEngine, IntEdit, ToolEdit,
  CurrEdit, StdCtrls, Mask, PatternEdit;

type
  TfraFacturaAMP = class(TArtDbFrame)
    lbNroVolante: TLabel;
    lbRSocial: TLabel;
    lbPrestIdentif: TLabel;
    lbCuit: TLabel;
    lbFactura: TLabel;
    lbFecha: TLabel;
    lbTotalFacturado: TLabel;
    lbEstado: TLabel;
    lbObservaciones: TLabel;
    lbIngBrutos: TLabel;
    lbImpDebito: TLabel;
    edESTADO: TEdit;
    edPR_NOMBRE: TEdit;
    edPR_CUIT: TMaskEdit;
    edFM_FACTURATIPO: TEdit;
    edFM_FACTURAESTABLE: TEdit;
    edFM_FACTURANRO: TEdit;
    edFM_FECHAFACTURA: TEdit;
    edFM_OBSERVACION: TMemo;
    edFM_MONTO: TCurrencyEdit;
    edFM_FACTURAID: TIntEdit;
    edPR_CODIGO: TIntEdit;
    edFM_MONTOPERCEPCION: TCurrencyEdit;
    edFM_MONTODEBITO: TCurrencyEdit;
    procedure FrameExit(Sender: TObject);
    procedure edFM_FACTURAIDKeyPress(Sender: TObject; var Key: Char);
  protected
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere  : String; override;
    function IsBaja : Boolean; override;

    procedure LoadValues( DoChanges : boolean = False); override;
  private
    FAPagar: Currency;
  public
    procedure Clear; override;
  published
    property Value;
    property APagar: Currency read FAPagar;
  end;

implementation

uses unDmPrincipal, CustomDlgs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraFacturaAMP }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFacturaAMP.Clear;
begin
  edFM_FACTURAID.Text        := '';
  edPR_CODIGO.Text           := '';
  edPR_CUIT.Text             := '';
  edPR_NOMBRE.Text           := '';
  edFM_FACTURATIPO.Text      := '';
  edFM_FACTURAESTABLE.Text   := '';
  edFM_FACTURANRO.Text       := '';
  edFM_FECHAFACTURA.Text     := '';
  edFM_MONTO.Value           := 0;
  edFM_MONTOPERCEPCION.Value := 0;
  edFM_MONTODEBITO.Value     := 0;
  edESTADO.Text              := '';
  edFM_OBSERVACION.Text      := '';
  FAPagar                    := 0;
  sdqDatos.ParamByName('pFactura').AsInteger := ART_EMPTY_ID;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFacturaAMP.GetSqlOrderBy: String;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFacturaAMP.GetSqlWhere: String;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFacturaAMP.GetValue: TTableID;
begin
  FrameExit(Nil);
  Result := sdqDatos.ParamByName('pFactura').AsInteger;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFacturaAMP.IsBaja: Boolean;
begin
  Result := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFacturaAMP.LoadValues(DoChanges: boolean);
begin
  edFM_FACTURAID.Value       := sdqDatos.ParamByName('pFactura').AsInteger;
  edPR_CODIGO.Value          := sdqDatos.FieldByName('PR_CODIGO').AsInteger;
  edPR_CUIT.Text             := sdqDatos.FieldByName('PR_CUIT').AsString;
  edPR_NOMBRE.Text           := sdqDatos.FieldByName('PR_NOMBRE').AsString;
  edFM_FACTURATIPO.Text      := sdqDatos.FieldByName('FM_FACTURATIPO').AsString;
  edFM_FACTURAESTABLE.Text   := sdqDatos.FieldByName('FM_FACTURAESTABLE').AsString;
  edFM_FACTURANRO.Text       := sdqDatos.FieldByName('FM_FACTURANRO').AsString;
  edFM_FECHAFACTURA.Text     := sdqDatos.FieldByName('FM_FECHAFACTURA').AsString;
  edFM_MONTO.Value           := sdqDatos.FieldByName('FM_MONTO').AsCurrency;
  edFM_MONTOPERCEPCION.Value := sdqDatos.FieldByName('FM_MONTOPERCEPCION').AsCurrency;
  edFM_MONTODEBITO.Value     := sdqDatos.FieldByName('FM_MONTODEBITO').AsCurrency;
  edESTADO.Text              := sdqDatos.FieldByName('ESTADO').AsString;
  edFM_OBSERVACION.Text      := sdqDatos.FieldByName('FM_OBSERVACION').AsString;
  FAPagar                    := sdqDatos.FieldByName('APAGAR').AsCurrency;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFacturaAMP.SetValue(const Value: TTableID);
begin
  sdqDatos.Close;
  sdqDatos.ParamByName('pFactura').AsInteger := Value;
  OpenQuery( sdqDatos );
  if sdqDatos.IsEmpty Then
    Clear
  else
    LoadValues(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFacturaAMP.FrameExit(Sender: TObject);
begin
  inherited;
  if edFM_FACTURAID.Value <> sdqDatos.ParamByName('pFactura').AsInteger Then
  begin
    SetValue(edFM_FACTURAID.Value);
    Change;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFacturaAMP.edFM_FACTURAIDKeyPress(Sender: TObject; var Key: Char);
begin
  {* No dejo que salga solo por Autoexit como estaba anteriormente,  *
   * por si en el OnChange activa el control que recibirá el foco    *}
  if Key = #13 Then
  begin
    FrameExit(Nil);
    if not IsEmpty Then
      DoLostFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
