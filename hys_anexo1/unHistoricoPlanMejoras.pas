unit unHistoricoPlanMejoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmHistoricoPlanMejoras = class(TfrmCustomGridABM)
    lbMenu: TLabel;
    edMenu: TEdit;
    lbSubMenu: TLabel;
    edSubMenu: TMemo;
    Label10: TLabel;
    redSubMenu: TRichEdit;
    redMenu: TRichEdit;
    Label1: TLabel;
  procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FEstableci: Integer;
    FCUIT: String;
    procedure SetCuit(const Value: String);
    procedure SetEstableci(const Value: Integer);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
    procedure Load;
  published
    property CUIT             : String   read FCUIT             write SetCuit;
    property Estableci        : Integer  read FEstableci        write SetEstableci;
  end;

var
  frmHistoricoPlanMejoras: TfrmHistoricoPlanMejoras;

implementation
uses VCLExtra;

{$R *.dfm}

procedure TfrmHistoricoPlanMejoras.FormCreate(Sender: TObject);
begin
  inherited;
  ClearControls;
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
end;

procedure TfrmHistoricoPlanMejoras.Load;
begin
  edMenu.Clear;
  edSubMenu.Clear;
  sdqConsulta.ParamByName('cuit').AsString := FCUIT;
  sdqConsulta.ParamByName('estableci').AsInteger := FEstableci;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoPlanMejoras.ClearControls;
begin
  edMenu.Clear;
  edSubMenu.Clear;
end;

function TfrmHistoricoPlanMejoras.DoABM: Boolean;
begin
  result:= true;
end;


procedure TfrmHistoricoPlanMejoras.LoadControls;
begin
  VCLExtra.LockControls([ edMenu, edSubMenu ] , True);
  edMenu.Text := sdqConsulta.fieldbyname('MENU').AsString;
  edSubMenu.Text := sdqConsulta.fieldbyname('SUBMENU').AsString;
end;

function TfrmHistoricoPlanMejoras.Validar: Boolean;
begin
  result := true;
end;

procedure TfrmHistoricoPlanMejoras.SetCuit(const Value: String);
begin
  if (FCUIT <> Value) then
    FCUIT := Value;
end;

procedure TfrmHistoricoPlanMejoras.SetEstableci(const Value: Integer);
begin
  if (FEstableci <> Value) then
    FEstableci := Value;
end;


procedure TfrmHistoricoPlanMejoras.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  redMenu.Lines.Clear;
  redMenu.Lines.Add(trim(sdqConsulta.fieldbyname('MENU').AsString));
  redSubMenu.Lines.Clear;
  redSubMenu.Lines.Add(Trim(sdqConsulta.fieldbyname('SUBMENU').AsString));
end;

end.
