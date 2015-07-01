unit unDetalleTransfBancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, PatternEdit;

type
  TfrmDetalleTransfBancaria = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    edGiro: TPatternEdit;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FIdTransferencia: TTableId;
    procedure SetIdTransferencia(const Value: TTableId);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    property IdTransferencia: TTableId    read FIdTransferencia     write SetIdTransferencia;
  end;

var
  frmDetalleTransfBancaria: TfrmDetalleTransfBancaria;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.dfm}

function TfrmDetalleTransfBancaria.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maModificacion then
        begin
          PrimaryKey.Add('CE_ID',      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('CE_GIRO',        edGiro.Text);
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmDetalleTransfBancaria.LoadControls;
begin
  edGiro.Text := sdqConsulta.FieldByName('GIRO').AsString;
end;

procedure TfrmDetalleTransfBancaria.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT CE_ID ID, CE_NUMERO NROCHEQUE, CE_ORDENPAGO ORDENPAGO, CE_GIRO GIRO ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE CE_IDTRANSFERENCIA = ' + SqlValue(FIdTransferencia);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmDetalleTransfBancaria.SetIdTransferencia(const Value: TTableId);
begin
  if FIdTransferencia <> Value then
    begin
      FIdTransferencia := Value;
      RefreshData;
    end;
end;

function TfrmDetalleTransfBancaria.Validar: Boolean;
begin
  Result := True;
end;

procedure TfrmDetalleTransfBancaria.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'RCE_CHEQUEEMITIDO';
  ShowActived   := False;
end;

procedure TfrmDetalleTransfBancaria.ClearControls;
begin
  // Agrego esta implementación sin código adrede ya que si no lo implemento Delphi XE2 avisa (correctamente) que una llamada a este método daría error
end;

end.
