unit unManGenericoEventoTarea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, CheckLst,
  ARTCheckListBox, AdvMemo, DBCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, ToolWin, ExtCtrls;

type
  TfrmManGenericoEventoTarea = class(TfrmCustomForm)
    edDESCRIPCION: TEdit;
    Label1: TLabel;
    cblES_ID: TARTCheckListBox;
    Label2: TLabel;
    pcModulos: TPageControl;
    tsModulos: TTabSheet;
    pnlMedio: TPanel;
    tbModulos: TToolBar;
    tbAsociar: TToolButton;
    tbRemover: TToolButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dbgAsociados: TJvDBGrid;
    dbgDisponibles: TJvDBGrid;
    pnlOrdenamiento: TPanel;
    tbOrdenamientoModulos: TToolBar;
    tbSubir: TToolButton;
    tbBajar: TToolButton;
    Panel1: TPanel;
    DBText2: TDBText;
    DBText3: TDBText;
    tsConsultaSQL: TTabSheet;
    edTE_SQL: TAdvMemo;
    Label4: TLabel;
    edTE_AYUDA: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManGenericoEventoTarea: TfrmManGenericoEventoTarea;

implementation

{$R *.dfm}

end.
