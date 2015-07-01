unit unMoldeFrameABM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, AdvToolBar, AdvToolBarStylers, AdvGlowButton,
  ActnList, ImgList, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ExtCtrls, JvExExtCtrls, JvComponent, JvPanel, DB, SDEngine, FormPanel,
  AdvAppStyler, ToolPanels;

type
  TfraMoldeFrameABM = class(TArtFrame)
    AdvToolBarPager: TAdvToolBarPager;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvPage: TAdvPage;
    AdvToolBarABM: TAdvToolBar;
    btnAdd: TAdvGlowButton;
    btnEdit: TAdvGlowButton;
    btnDelete: TAdvGlowButton;
    ImageList: TImageList;
    ActionList: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    AdvToolBarTools: TAdvToolBar;
    AdvGlowButton1: TAdvGlowButton;
    acSort: TAction;
    acShowHideColumns: TAction;
    AdvGlowButton2: TAdvGlowButton;
    acExport: TAction;
    AdvGlowButton3: TAdvGlowButton;
    pnlGridABM: TJvPanel;
    GridABM: TArtDBGrid;
    dsQuery: TDataSource;
    sdqQuery: TSDQuery;
    FormPanel1: TFormPanel;
    AdvToolBarPagerFormPanel: TAdvToolBarPager;
    AdvPage1: TAdvPage;
    btnAceptar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    AdvFormStyler: TAdvFormStyler;
    AdvAppStyler: TAdvAppStyler;
    AdvToolPanelTabFiltros: TAdvToolPanelTab;
    AdvToolPanel1: TAdvToolPanel;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraMoldeFrameABM: TfraMoldeFrameABM;

implementation

{$R *.dfm}

procedure TfraMoldeFrameABM.acAddExecute(Sender: TObject);
begin
//
end;

procedure TfraMoldeFrameABM.acEditExecute(Sender: TObject);
begin
//
end;

procedure TfraMoldeFrameABM.acDeleteExecute(Sender: TObject);
begin
//
end;

end.
