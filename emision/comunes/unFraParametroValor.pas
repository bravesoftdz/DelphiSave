{-----------------------------------------------------------------------------
 Nombre Unidad: unFraParametroValor
 Autor:         conrado chiappero
 Fecha:         10-set-2005
 Proposito:     administración de selección de tipo parámetro y valor.
 Versiones:     0.0  -- Inicial

-----------------------------------------------------------------------------}
unit unFraParametroValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, unfraCtbTablas, StdCtrls, unArtDBAwareFrame, unfraCodigoDescripcionExt,
  unFraCodigoDescripcion;

type
  TfraParametroValor = class(TFrame)
    lblTipoDato: TLabel;
    lblValorParametroDesde: TLabel;
    fraTipoDatoParametro: TfraCodigoDescripcionExt;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
    FInicializado : Boolean;
    FDefParamEditor: TWinControl;
    procedure Init;
    procedure OnFraTipoDatoParametroChange(Sender: TObject);
    procedure SetTipoParametro(const Value: String);
    function  GetTipoParametro : string;
    procedure SetValor(const Value: String);
    function  GetValor : string;
    procedure SetEditor;
    function GetIsSelected: boolean;
  public
    { Public declarations }
    procedure Clear;
    property TipoParametro : String read GetTipoParametro write SetTipoParametro;
    property Valor : String read GetValor write SetValor;
    property IsSelected : boolean read GetIsSelected;
  end;

implementation

uses unParams, Strfuncs;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfraParametroValor.Init;
begin
  with fraTipoDatoParametro do
  begin
    TableName   := 'art.CTB_TABLAS';
    FieldID     := 'tb_id';
    FieldCodigo := 'tb_codigo';
    FieldDesc   := 'tb_descripcion';
    FieldBaja   := 'tb_fechabaja';
    ExtraCondition := ' and tb_clave = ''TDAT'' AND TB_CODIGO <> ''0''';
    OnChange := OnFraTipoDatoParametroChange;
  end;
  FInicializado := true;
end;
{------------------------------------------------------------------------------}
procedure TfraParametroValor.OnFraTipoDatoParametroChange(Sender: TObject);
begin
  SetEditor;
end;
{------------------------------------------------------------------------------}
procedure TfraParametroValor.SetEditor;
var
  AClass: TWinControlClass;
begin
  if fraTipoDatoParametro.IsSelected Then
  begin
    AClass := GetParamEditorClass(fraTipoDatoParametro.Codigo);
    if (FDefParamEditor = nil) or (FDefParamEditor.ClassType <> AClass) then
    begin
      FDefParamEditor.Free;
      FDefParamEditor := AClass.Create(Self);
      ParamInitializeEditor(FDefParamEditor, '', fraTipoDatoParametro.Width);
      with FDefParamEditor do
      begin
        Left := fraTipoDatoParametro.Left;
        Top :=  24;
        Parent := fraTipoDatoParametro.Parent;
        TabOrder := fraTipoDatoParametro.TabOrder + 1;
      end;
    end;
  end;
end;

{------------------------------------------------------------------------------}
procedure TfraParametroValor.SetTipoParametro(const Value: String);
begin
  if not FInicializado then Init;
  fraTipoDatoParametro.Codigo := Value;
  SetEditor;
end;
{------------------------------------------------------------------------------}
function TfraParametroValor.GetTipoParametro: string;
begin
  result := fraTipoDatoParametro.Codigo;

end;
{------------------------------------------------------------------------------}
procedure TfraParametroValor.SetValor(const Value: String);
begin
  if Assigned(FDefParamEditor) and (FDefParamEditor.Visible) then
    SetParamEditorValue(FDefParamEditor, Value);
end;
{------------------------------------------------------------------------------}
function TfraParametroValor.GetValor: string;
begin
  if Assigned(FDefParamEditor) and (FDefParamEditor.Visible) then
    result :=  GetParamEditorValue(FDefParamEditor);
end;
{------------------------------------------------------------------------------}
procedure TfraParametroValor.Clear;
begin
  if not FInicializado then Init;
  fraTipoDatoParametro.Clear;
  FreeAndNil(FDefParamEditor);
end;
{------------------------------------------------------------------------------}
procedure TfraParametroValor.FrameEnter(Sender: TObject);
begin
  if not FInicializado then Init;
end;
{------------------------------------------------------------------------------}

function TfraParametroValor.GetIsSelected: boolean;
begin
  if fraTipoDatoParametro.IsSelected and
     Assigned(FDefParamEditor) and
     FDefParamEditor.Visible and
     Not IsEmptyString(GetParamEditorValue(FDefParamEditor))
  then
       result := true
  else result := false;
end;

end.
