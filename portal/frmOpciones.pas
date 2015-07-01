unit frmOpciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvAppStorage, JvAppRegistryStorage,
  JvComponent, JvFormPlacement;

type
  TFormOpciones = class(TForm)
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    bvSeparadorBotones: TBevel;
    gbOpciones: TGroupBox;
    chkMinimizar: TCheckBox;
    chkMostrarBarra: TCheckBox;
    chkMostrarIcono: TCheckBox;
    FormStorage: TJvFormStorage;
    AppRegistryStorage: TJvAppRegistryStorage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpciones: TFormOpciones;

implementation

{$R *.dfm}

end.
