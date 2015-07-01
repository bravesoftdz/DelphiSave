unit unEgresosSemanales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  PeriodoPicker, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmEgresosSemanales = class(TForm)
    ceReintegro: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Per: TPeriodoPicker;
    Bevel1: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEgresosSemanales: TfrmEgresosSemanales;

implementation

{$R *.dfm}

uses unRptEgresosSemanales, unPrincipal, CustomDlgs;

procedure TfrmEgresosSemanales.btnAceptarClick(Sender: TObject);
begin

  Verificar(ceReintegro.Value = 0, ceReintegro, 'Debe ingresar un monto');
  Verificar(Per.Periodo.IsNull, Per, 'Debe ingresar un período');
  with TrptEgresosSemanales.Create(nil) do
  try
    Imprimir(ceReintegro.Value, Per.Periodo.GetPeriodoName);
  finally
    Free;
  end;

  Close;
end;

procedure TfrmEgresosSemanales.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEgresosSemanales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuEgresosSemanales.Enabled := True;
end;

end.
