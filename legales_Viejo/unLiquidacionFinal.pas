unit unLiquidacionFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ComCtrls, ExtCtrls, DB,SqlFuncs,
  SDEngine, DBSql;

type
  TfrmLiquidacionFinal = class(TForm)
    lblImporteSentenciaSentencia: TLabel;
    lblHonorariosSentencia: TLabel;
    edCapital: TCurrencyEdit;
    edIntereses: TCurrencyEdit;
    gbCostos: TGroupBox;
    lbTasasJusticia: TLabel;
    lbEmbargo: TLabel;
    edTasasJusticia: TCurrencyEdit;
    edEmbargo: TCurrencyEdit;
    lbHonorarios: TLabel;
    edOtros: TCurrencyEdit;
    bvSeparadorBotones: TBevel;
    btnAceptarSentencia: TButton;
    btnCancelarFijarSentencia: TButton;
    edObservaciones: TRichEdit;
    Label2: TLabel;
    sdqLiquidacionFinal: TSDQuery;
    dsLiquidacionFinal: TDataSource;
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FJuicio : Integer;
    Sql: TCustomSql;
    procedure GuardarLiquidacion;
    function Validar : Boolean;
  public
    { Public dclarations }
    property Juicio : Integer read FJuicio write FJuicio;
    procedure Load(NroJuicio : Integer);
  end;

var
  frmLiquidacionFinal: TfrmLiquidacionFinal;

implementation

{$R *.dfm}
uses
  unDmPrincipal, unSesion;


{ TfrmLiquidacionFinal }

procedure TfrmLiquidacionFinal.Load(NroJuicio: Integer);
begin
  FJuicio := NroJuicio;
  with sdqLiquidacionFinal do begin
    Close;
    ParamByName('juicioentramite').AsInteger := FJuicio;
    Open;
  end;
  edCapital.Text       := sdqLiquidacionFinal.FieldByName('LF_CAPITAL').AsString;
  edIntereses.Text     := sdqLiquidacionFinal.FieldByName('LF_INTERESES').AsString;
  edTasasJusticia.Text := sdqLiquidacionFinal.FieldByName('LF_TASASDEJUSTICIA').AsString;
  edEmbargo.Text       := sdqLiquidacionFinal.FieldByName('LF_EMBARGOS').AsString;
  edOtros.Text    := sdqLiquidacionFinal.FieldByName('LF_OTROS').AsString;
  edObservaciones.Text := sdqLiquidacionFinal.FieldByName('LF_OBSERVACIONES').AsString;
end;

procedure TfrmLiquidacionFinal.GuardarLiquidacion;
var
  iIdCodigo : Integer;
begin
  try
    Sql.Clear;
    Sql.Fields.Add('LF_CAPITAL', edCapital.Value);
    Sql.Fields.Add('LF_INTERESES', edIntereses.Value);
    Sql.Fields.Add('LF_TASASDEJUSTICIA', edTasasJusticia.Value);
    Sql.Fields.Add('LF_EMBARGOS', edEmbargo.Value);
    Sql.Fields.Add('LF_OTROS', edOtros.Value);
    Sql.Fields.Add('LF_OBSERVACIONES', edObservaciones.Text);
    if sdqLiquidacionFinal.FieldByName('LF_ID').IsNull THEN
    begin
      Sql.SqlType := stInsert;
      iIdCodigo := GetSecNextVal('LEGALES.SEQ_LLI_ID');
      Sql.Fields.Add('LF_IDJUICIOENTRAMITE', FJuicio );
      Sql.Fields.Add('LF_USUALTA', Sesion.UserID );
      Sql.Fields.Add('LF_FECHAALTA', exDateTime );
    end else begin
      Sql.SqlType := stUpdate;
      iIdCodigo := sdqLiquidacionFinal.FieldByName('LF_ID').AsInteger;
      Sql.Fields.Add('LF_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('LF_FECHAMODIF', exDateTime );
    end;
    Sql.PrimaryKey.Add('LF_ID', iIdCodigo);
    EjecutarSQLST(Sql.Sql);
  except
    on E : Exception do begin
       raise Exception.Create('Error al Liquidacion Final ' + E.Message);
    end;
  end;
end;

procedure TfrmLiquidacionFinal.btnAceptarSentenciaClick(Sender: TObject);
begin
  if Validar then
  begin
    GuardarLiquidacion;
    ModalResult := mrOk;
  end;
end;

function TfrmLiquidacionFinal.Validar: Boolean;
begin
  result := true;
  // Dejo la funcion por si piden alguna validacion.
end;

procedure TfrmLiquidacionFinal.FormCreate(Sender: TObject);
begin
  Sql := TDBSql.Create;
  Sql.TableName := 'LEGALES.LLF_LIQUIDACIONFINAL';
end;

procedure TfrmLiquidacionFinal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Sql.Free;
end;

end.

