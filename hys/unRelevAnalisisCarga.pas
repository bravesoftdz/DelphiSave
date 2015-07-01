unit unRelevAnalisisCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unDmPrincipal, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmRelevAnalisiCarga = class(TfrmCustomConsulta)
    fraEmpresa: TfraEmpresa;
    lblCuit: TLabel;
    chkRelevSinCargaDef: TCheckBox;
    chkDif: TCheckBox;
    lblCumplimientoEstimado: TLabel;
    Label1: TLabel;
    cmbCumplimientoEstimado: TComboBox;
    cmbCumplimientoDef: TComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  protected
    procedure RefreshData; override;
  private
    SqlBase: String;
    procedure Limpiar;
  public
  end;

var
  frmRelevAnalisiCarga: TfrmRelevAnalisiCarga;

implementation

uses
  unSesion, AnsiSQL, SqlFuncs, General, CustomDlgs;

{$R *.dfm}

{ TfrmRelevAnalisiCarga }

procedure TfrmRelevAnalisiCarga.RefreshData;
var
  sSQL: string;
begin
  EjecutarStoreEx('hys.do_procesaranalisisrelev(:usuario, :estadodefinitivo);', [Sesion.LoginName, 'N']);

  sSQL := SQLBase;

  AddCondition(sSQL, 'RC_USUARIOANALISIS = ' +  SqlValue(Sesion.LoginName));

  if fraEmpresa.IsSelected then
    AddCondition(sSQL, 'RC_CONTRATO = ' +  SqlValue(fraEmpresa.Contrato));

  if chkRelevSinCargaDef.Checked then
    AddCondition(sSQL, 'RC_FECHACARGA IS NULL');

  if chkDif.Checked then
    AddCondition(sSQL, 'RC_RELEVESTIMADOS <> (RC_RELEVVALIDOS + RC_RELEVINVALIDOS)');

  if cmbCumplimientoEstimado.ItemIndex > -1 then
    AddCondition(sSQL, 'RC_CUMPLIMIENTOESTIMADO = ' + SqlValue(cmbCumplimientoEstimado.Text[1]));

  if cmbCumplimientoDef.ItemIndex > -1 then
    AddCondition(sSQL, 'RC_CUMPLIMIENTOCARGA = ' + SqlValue(cmbCumplimientoDef.Text[1]));

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;

  inherited RefreshData;
end;

procedure TfrmRelevAnalisiCarga.FormCreate(Sender: TObject);
begin
  inherited;
  SqlBase := sdqConsulta.SQL.Text;
end;

procedure TfrmRelevAnalisiCarga.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  Limpiar;
end;

procedure TfrmRelevAnalisiCarga.Limpiar;
begin
  fraEmpresa.Clear;
  chkRelevSinCargaDef.Checked := false;
  chkDif.Checked := false;
  cmbCumplimientoEstimado.ItemIndex := -1;
  cmbCumplimientoDef.ItemIndex := -1;
end;

procedure TfrmRelevAnalisiCarga.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (not sdqConsulta.FieldByName('RC_RELEVESTIMADOS').IsNull) and
     (not sdqConsulta.FieldByName('RC_RELEVVALIDOS').IsNull) and
     (not sdqConsulta.FieldByName('RC_RELEVINVALIDOS').IsNull) and
     (sdqConsulta.FieldByName('RC_RELEVESTIMADOS').AsInteger <>
      (sdqConsulta.FieldByName('RC_RELEVVALIDOS').AsInteger + sdqConsulta.FieldByName('RC_RELEVINVALIDOS').AsInteger)) then
  begin
    if Highlight then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;
end;

end.
