unit unHistoricoLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, RxPlacemnt;

type
  TfrmHistoricoLote = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FLote: TTableId;
    procedure SetLote(const Value: TTableId);
  public
    property Lote: TTableId     read FLote      write SetLote;
  end;

implementation

{$R *.dfm}

uses
  unDmPrincipal;

procedure TfrmHistoricoLote.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmHistoricoLote.SetLote(const Value: TTableId);
begin
  if FLote <> Value then
    begin
      FLote := Value;

      Caption := 'Histórico del Lote: ' + IntToStr(FLote);
      OpenQueryEx(sdqConsulta, [FLote]);
      RefreshData;
    end;
end;

end.

