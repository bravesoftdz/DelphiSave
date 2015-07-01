unit unFraValorParametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, unParams,
  Dialogs, StdCtrls;

type
  TfraValorParametro = class(TFrame)
    lblNombre: TLabel;
  private
   { Private declarations }
    FTipoParametro : string;
    FDefParamEditor: TWinControl;
    FNombreParametro: string;
    FTituloParametro: string;
    procedure SetEditor;
    procedure SetTipoParametro(const Value: string);
    procedure SetNombreParametro(const Value: string);
    procedure SetTituloParametro(const Value: string);
    procedure SetValor(const Value: variant);
    function GetValor: variant;
  public
    { Public declarations }
    property TipoParametro : string read FTipoParametro write SetTipoParametro;
    property NombreParametro : string read FNombreParametro write SetNombreParametro;
    property TituloParametro : string read FTituloParametro write SetTituloParametro;
    property Valor : variant read GetValor write SetValor;
  end;

implementation

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfraValorParametro.SetEditor;
var
  AClass: TWinControlClass;
begin
  if FTipoParametro <> '' Then
  begin
    AClass := GetParamEditorClass(FTipoParametro);
    if (FDefParamEditor = nil) or (FDefParamEditor.ClassType <> AClass) then
    begin
      FDefParamEditor.Free;
      FDefParamEditor := AClass.Create(Self);

      if Assigned(self.Parent) then
       ParamInitializeEditor(FDefParamEditor, '', self.Parent.Width);
      
      with FDefParamEditor do
      begin
        Left     := lblNombre.Left + lblNombre.Width + 10;
        Top      := 1;
        Parent   := Self;
        TabOrder := 0;
      end;
    end;
  end;
end;


procedure TfraValorParametro.SetNombreParametro(const Value: string);
begin
  FNombreParametro := Value;
end;

procedure TfraValorParametro.SetTipoParametro(const Value: string);
begin
  FTipoParametro := Value;
  SetEditor;
end;

procedure TfraValorParametro.SetTituloParametro(const Value: string);
begin
  FTituloParametro := Value;
  lblNombre.Caption := Value + ':';

  if Assigned(FDefParamEditor) then
    FDefParamEditor.Left := lblNombre.Left + lblNombre.Width + 10;
end;

procedure TfraValorParametro.SetValor(const Value: variant);
begin
  if Assigned(FDefParamEditor) then
    SetParamEditorValue(FDefParamEditor, Value);
end;

function TfraValorParametro.GetValor : variant ;
begin
  if Assigned(FDefParamEditor) then
   result := GetParamEditorValue(FDefParamEditor);
end;


end.
