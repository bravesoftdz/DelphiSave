unit unFraABMFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, AdvOfficePager, AdvOfficePagerStylers, AdvToolBar,
  AdvToolBarStylers, AdvGlowButton, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  DB, SDEngine, FormPanel, StdCtrls, AdvEdit, DBAdvEd, AdvMenus,
  AdvMenuStylers, ExtCtrls;

type
  TART_ABMFrame = class(TArtFrame)
    AdvToolBarPager: TAdvToolBarPager;
    AdvPage: TAdvPage;
    AdvToolBar: TAdvToolBar;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    tbFirst: TDBAdvGlowButton;
    tbPrior: TDBAdvGlowButton;
    tbNext: TDBAdvGlowButton;
    tbLast: TDBAdvGlowButton;
    tbInsert: TDBAdvGlowButton;
    tbDelete: TDBAdvGlowButton;
    tbEdit: TDBAdvGlowButton;
    tbOk: TDBAdvGlowButton;
    tbCancel: TDBAdvGlowButton;
    tbRefresh: TDBAdvGlowButton;
    Grid: TDBAdvGrid;
    dsConsultaFrame: TDataSource;
    sdqConsultaFrame: TSDQuery;
    sduConsultaFrame: TSDUpdateSQL;
    fpDatos: TFormPanel;
    btnAceptar: TDBAdvGlowButton;
    btnCancelar: TDBAdvGlowButton;
    AdvMenuOfficeStyler: TAdvMenuOfficeStyler;
    pnlFondo: TBevel;
    procedure AfterEdit(DataSet: TDataSet);
    procedure AfterCancel(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure AfterPost(DataSet: TDataSet);
    procedure BeforeEdit(DataSet: TDataSet);
    procedure BeforeInsert(DataSet: TDataSet);
    procedure BeforePost(DataSet: TDataSet);
    procedure AfterClose(DataSet: TDataSet);
    procedure AfterDelete(DataSet: TDataSet);
    procedure AfterOpen(DataSet: TDataSet);
    procedure AfterScroll(DataSet: TDataSet);
    procedure AfterInsert(DataSet: TDataSet);
  protected
    procedure MostrarPanel;
    procedure OcultoPanel;
  end;

var
  ART_ABMFrame: TART_ABMFrame;

implementation

uses unDmPrincipal;

{$R *.dfm}

procedure TART_ABMFrame.AfterEdit(DataSet: TDataSet);
begin
  inherited;
  MostrarPanel;
end;

procedure TART_ABMFrame.AfterCancel(DataSet: TDataSet);
begin
  inherited;
  OcultoPanel();
end;

procedure TART_ABMFrame.GridDblClick(Sender: TObject);
begin
  inherited;
  if sdqConsultaFrame.Active and not sdqConsultaFrame.IsEmpty then
    sdqConsultaFrame.Edit;
end;

procedure TART_ABMFrame.AfterPost(DataSet: TDataSet);
begin
  inherited;
  if sdqConsultaFrame.UpdatesPending then
  begin
    sdqConsultaFrame.Database.ApplyUpdates([sdqConsultaFrame]);
    sdqConsultaFrame.Refresh;
  end;
  OcultoPanel();
end;

procedure TART_ABMFrame.BeforeEdit(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.BeforeInsert(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.BeforePost(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.AfterClose(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.AfterDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.AfterOpen(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.AfterScroll(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TART_ABMFrame.OcultoPanel;
begin
  if not (sdqConsultaFrame.State in [dsInsert, dsEdit]) then
  begin
    Grid.Enabled := True;
    fpDatos.Hide;
  end;
end;

procedure TART_ABMFrame.AfterInsert(DataSet: TDataSet);
begin
  inherited;
  MostrarPanel;
end;

procedure TART_ABMFrame.MostrarPanel;
begin
  Grid.Enabled := False;
//  fpDatos.SetFocus;
  fpDatos.Show;
end;

end.
