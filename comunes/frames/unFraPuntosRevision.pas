unit unFraPuntosRevision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvComponent, JvTMTimeLine,
  Mask, ToolEdit, DateComboBox, ComCtrls, ToolWin, ImgList, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, FormPanel, Grids, DBGrids, Menus,
  JvExControls, JvTimeLine, DB, SDEngine, JvNetscapeSplitter, unArtDBAwareFrame,
  RxToolEdit;

type
  TPuntosRevision = Class
    IdJuicioEnTramite : integer;
    IdEtapaProcesal   : integer;
    IdPuntoRevision   : integer;
    FechaProgramada   : TDate;
    FechaMaxima       : TDate;
  public
    constructor create(IdJuicioEnTramite: Integer; FechaPrograma : TDate);

  end;

  TfraPuntosRevision = class(TFrame)
    cbPuntosRevision: TCoolBar;
    tbPuntosRevisio: TToolBar;
    tbNuevoPeritaje: TToolButton;
    tbEditarPeritaje: TToolButton;
    tbEliminarPeritaje: TToolButton;
    ToolButton47: TToolButton;
    tbCalendario: TToolButton;
    ToolButton49: TToolButton;
    ToolButton50: TToolButton;
    il16: TImageList;
    fpEventoSeguimiento: TFormPanel;
    bvSepardorBotones: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lblEtapaProcesal: TLabel;
    lblPuntoRevision: TLabel;
    lblFechaProgramada: TLabel;
    dcbEditFechaPrograma: TDateComboBox;
    lblObservaciones: TLabel;
    mEditObservaciones: TMemo;
    fraEditEtapaProcesal: TfraCtbTablas;
    btnEditPuntoRevision: TfraCodigoDescripcion;
    lblFechaLimite: TLabel;
    dcbEditFechaMaxima: TDateComboBox;
    tlPuntosRevision: TJvTimeLine;
    pmPuntosRevision: TPopupMenu;
    miRenombrar: TMenuItem;
    Move1: TMenuItem;
    remove1: TMenuItem;
    miDeshabilitar: TMenuItem;
    N2: TMenuItem;
    Up1: TMenuItem;
    Down1: TMenuItem;
    N1: TMenuItem;
    Notes1: TMenuItem;
    dbgPuntosRevision: TDBGrid;
    sdqPuntosRevision: TSDQuery;
    dsPuntosRevision: TDataSource;
    ToolButton1: TToolButton;
    nsSplitter: TJvNetscapeSplitter;
    ilPuntosRevision: TImageList;
    procedure tbNuevoPeritajeClick(Sender: TObject);
    procedure tbEditarPeritajeClick(Sender: TObject);
  private
    procedure AltaPuntoRevision;
    procedure ModificacionPuntoRevision;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses unDmLegales, unDmPrincipal;

{$R *.dfm}

{ TPuntosRevision }

{------------------------------------------------------------------------------}
procedure TfraPuntosRevision.tbNuevoPeritajeClick(Sender: TObject);
begin
    AltaPuntoRevision;
end;
{------------------------------------------------------------------------------}
procedure TfraPuntosRevision.tbEditarPeritajeClick(Sender: TObject);
begin
   ModificacionPuntoRevision;
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
procedure TfraPuntosRevision.AltaPuntoRevision;
begin

end;
{------------------------------------------------------------------------------}
procedure TfraPuntosRevision.ModificacionPuntoRevision;
begin

end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
constructor TPuntosRevision.create(IdJuicioEnTramite: Integer;
  FechaPrograma: TDate);
begin

end;


end.
