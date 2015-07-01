unit unManCEJ_EJECUTABLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, ImgList, unCustomConsulta, ActnList;

type
  TfrmManCEJ_EJECUTABLE = class(TfrmCustomConsulta)
    sdqReportesDisponibles: TSDQuery;
    dsReportesDisponibles: TDataSource;
    sdqReportesAsociados: TSDQuery;
    dsReportesAsociados: TDataSource;
    Imagenes: TImageList;
    acListaDeAcciones: TActionList;
    acAgregar: TAction;
    acQuitar: TAction;
    fpAsociacion: TFormPanel;
    BevelAbm: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    btnAceptar: TButton;
    dbgDisponibles: TArtDBGrid;
    dbgAsociados: TArtDBGrid;
    tbAsociacion: TToolBar;
    tbAgregar: TToolButton;
    tbQuitar: TToolButton;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure acQuitarExecute(Sender: TObject);
    procedure acAgregarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    procedure Preparar;
  end;

var
  frmManCEJ_EJECUTABLE: TfrmManCEJ_EJECUTABLE;

implementation

uses
  unDmPrincipal;

{$R *.DFM}

procedure TfrmManCEJ_EJECUTABLE.Preparar;
begin
  with sdqReportesDisponibles do
  begin
    Close;
    ParamByName('IDEJECUTABLE').AsInteger := sdqConsulta.FieldByName('EJ_ID').AsInteger;
    sdqReportesDisponibles.Open;
  end;
  with sdqReportesAsociados do
  begin
    Close;
    ParamByName('IDEJECUTABLE').AsInteger := sdqConsulta.FieldByName('EJ_ID').AsInteger;
    sdqReportesAsociados.Open;
  end;
end;

procedure TfrmManCEJ_EJECUTABLE.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  Preparar;
  fpAsociacion.ShowModal;
end;

procedure TfrmManCEJ_EJECUTABLE.acQuitarExecute(Sender: TObject);
begin
//
  Preparar;
end;

procedure TfrmManCEJ_EJECUTABLE.acAgregarExecute(Sender: TObject);
begin
//
  Preparar;
end;

procedure TfrmManCEJ_EJECUTABLE.FormCreate(Sender: TObject);
begin
  inherited;
  OpenQuery(sdqConsulta);
  CheckButtons;
end;

end.
