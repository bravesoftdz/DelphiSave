unit unRptEtiquetas;

interface

uses Classes, Controls, ExtCtrls, Quickrpt, QRCtrls, Db, unFraFiltroArchivo;

type
  TrptEtiquetas = class(TQuickRep)
    DetailBand1: TQRBand;
    qrlTextoInferior: TQRLabel;
    qrlNumero: TQRLabel;
    qrlCodigoBarras: TQRLabel;
    qrlTextoSuperior: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    FDataSet: TDataSet;
    FTabla: string;
    FFormulario: TFormulario;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DataSet: TDataSet read FDataSet write FDataSet;
    property Tabla: string read FTabla write FTabla;
    property Formulario: TFormulario read FFormulario write FFormulario;
  end;

implementation

{$R *.DFM}

uses
  Cuit, unArchivo;

{----------------------------------------------------------------------------------------------------------------------}
{ TrptEtiquetas }
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptEtiquetas.Create(AOwner: TComponent);
begin
  inherited;
  FDataSet := Nil;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptEtiquetas.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if Assigned(FDataSet) Then
    FDataSet.First;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptEtiquetas.QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if Assigned(FDataSet) and (not FDataSet.Eof) Then
  begin
    qrlTextoSuperior.Caption := FDataSet.FieldByName(FET_SUPERIOR).AsString;
    qrlCodigoBarras.Caption  := '*' + FDataSet.FieldByName(FET_CODIGO).AsString + '*';
    qrlNumero.Caption        := FDataSet.FieldByName(FET_DESCRIPCION).AsString;
    qrlTextoInferior.Caption := FDataSet.FieldByName(FET_INFERIOR).AsString;
    FDataSet.Next;
  end else
    MoreData := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
