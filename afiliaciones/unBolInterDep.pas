unit unBolInterDep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraCtbTablas, unFraEmpresa, ExtCtrls,
  StdCtrls, Buttons, unRptBolInredeposito, unArtFrame, unFraCodigoDescripcion, unArtDbFrame, unArtDBAwareFrame;

type
  TfrmBolInterDep = class(TForm)
    Panel1: TPanel;
    fraEmpresa: TfraEmpresa;
    fraTipoCuenta: TfraCtbTablas;
    Label1: TLabel;
    btnImprimir: TBitBtn;
    btnConfigurar: TBitBtn;
    btnSalir: TBitBtn;
    Label2: TLabel;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    rptBolInredeposito: TrptBolInredeposito;
  public
  end;
var
  frmBolInterDep: TfrmBolInterDep;

implementation

uses
  unPrincipal, CustomDlgs, unArt;

{$R *.DFM}

procedure TfrmBolInterDep.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBolInterDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  rptBolInredeposito.Free;
  frmBolInterDep := nil;
  frmPrincipal.mnuBolInterdepositos.Enabled := True;

  inherited;
end;

procedure TfrmBolInterDep.FormCreate(Sender: TObject);
begin
  inherited;

  fraTipoCuenta.Clave := 'CPATA';
  rptBolInredeposito := TrptBolInredeposito.Create(Self);
end;

procedure TfrmBolInterDep.btnConfigurarClick(Sender: TObject);
begin
  rptBolInredeposito.PrinterSetup;
end;

procedure TfrmBolInterDep.btnImprimirClick(Sender: TObject);
begin
  if fraEmpresa.mskCUIT.Text = '' then
     InvalidMsg(fraEmpresa.mskCUIT, 'Debe seleccionar la Empresa')

  else if fraTipoCuenta.IsEmpty then
     InvalidMsg(fraTipoCuenta.edCodigo, 'Debe seleccionar el Tipo de Cuenta')

  else
  begin
    rptBolInredeposito.sdqDatos.Close; {Por las Dudas}
    rptBolInredeposito.sdqDatos.ParamByName('pcodigo').AsString := fraTipoCuenta.Value;
    rptBolInredeposito.sdqDatos.ParamByName('pcuit').AsString   := fraEmpresa.mskCUIT.Text;
    rptBolInredeposito.sdqDatos.Open;
    rptBolInredeposito.Print;
    rptBolInredeposito.sdqDatos.Close;

    fraEmpresa.mskCUIT.SetFocus;
  end;
end;

end.
