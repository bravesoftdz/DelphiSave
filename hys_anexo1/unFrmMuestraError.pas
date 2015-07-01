unit unFrmMuestraError;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, ImgList, XPMenu, Placemnt;

type
  TfrmMuestraError = class(TfrmCustomForm)
    editor: TMemo;
    lbArchivoOrigen: TLabel;
    btnCerrar: TButton;
    btnSave: TButton;
    procedure Load(path : string);
    procedure editorChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FFile: string;
  public
    { Public declarations }
  end;

var
  frmMuestraError: TfrmMuestraError;

implementation

{$R *.dfm}
procedure TfrmMuestraError.Load(path : String);
begin
  FFile := path;
  editor.Lines.LoadFromFile(path);
end;

procedure TfrmMuestraError.editorChange(Sender: TObject);
begin
  inherited;
  btnSave.Enabled := editor.Modified;
end;

procedure TfrmMuestraError.btnSaveClick(Sender: TObject);
begin
  editor.Lines.SaveToFile(FFile);  
  btnSave.Enabled := false;
end;

end.
