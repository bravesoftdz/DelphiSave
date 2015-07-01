unit unAutorizacionAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvGlowButton, ImgList,
  XPMenu, Placemnt, DB, SDEngine, unFraCodDesc, ComCtrls, ToolWin,
  unfraContacto, StdCtrls, unFraEmpresa, Mask, ToolEdit, DateComboBox,
  ExtCtrls, JvExExtCtrls, JvRadioGroup, CheckPanel, unFraDomicilio,
  unArtDbFrame, unFraTrabajador, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraEstablecimiento, FormPanel, JvTFManager,
  ShortCutControl, DBCtrls;

type
  TfrmAutorizacionAgenda = class(TfrmCustomForm)
    AdvOfficeStatusBar: TAdvOfficeStatusBar;
    btnModificar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    dsEventos: TDataSource;
    GridEventos: TArtDBGrid;
    IconosVista: TImageList;
    Schedule: TJvTFScheduleManager;
    sdqEventos: TSDQuery;
    ShortCutControl: TShortCutControl;
    toolBarStyleAgenda: TAdvOfficeStatusBarOfficeStyler;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edXX_CONTRATO: TDBEdit;
    edXX_TRABAJADOR: TDBEdit;
    sdqAuxiliar: TSDQuery;
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadABM;
  end;

var
  frmAutorizacionAgenda: TfrmAutorizacionAgenda;

implementation

{$R *.dfm}

uses
  DBSql,CustomDlgs, unSesion, vclExtra, Math, General,unABMAgendaBaseTarea, unDmPrincipal,
  unABMAgendaBaseEvento,unABMAgendaBase, DateUtils, DateTimeFuncs, AnsiSql, unFiltros,
  unAgenda;

procedure TfrmAutorizacionAgenda.btnModificarClick(Sender: TObject);
begin
  LoadABM;
end;

procedure TfrmAutorizacionAgenda.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAutorizacionAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  sdqEventos.ParamByName('idusuario').AsInteger := Sesion.ID;
  sdqEventos.Open;
  GridEventos.Refresh;
end;                      

procedure TfrmAutorizacionAgenda.LoadABM;
var
  frmABMAgendaBase: TfrmABMAgendaBase;
const
  CONSULTA_SQL = 'SELECT * FROM agenda.%s WHERE %s = :id';
begin
  Verificar(not(sdqEventos.Active and not sdqEventos.IsEmpty), btnModificar, 'Debe seleccionar una autorización.');
  if sdqEventos.FieldByName('sa_tipo').AsString = 'T' then
  begin
    Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBase, tmvNormal, nil);
    sdqAuxiliar.SQL.Text := Format(CONSULTA_SQL, ['AAT_AGENDATAREA', 'TE_ID']);
  end else
  if sdqEventos.FieldByName('sa_tipo').AsString = 'E' then
  begin
    Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBase, tmvNormal, nil);
    sdqAuxiliar.SQL.Text := Format(CONSULTA_SQL, ['AAE_AGENDAEVENTO', 'AE_APPID']);
  end;

  OpenQueryEx(sdqAuxiliar, [sdqEventos.FieldByName('sa_idevento').AsString]);

  with frmABMAgendaBase do
  try
    LoadFromQuery(sdqAuxiliar, False, True);
    Visible := False;
    if ShowModal = mrOK then
      sdqEventos.Refresh;
  finally
    Free;
    sdqAuxiliar.Close;
  end;
end;

end.
