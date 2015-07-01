unit unManCTBRespReclAFIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManCtbRespReclAFIP = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    function Validar: Boolean; override;
  end;

implementation

uses
  CustomDlgs;

{$R *.DFM}

procedure TfrmManCtbRespReclAFIP.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'RAFIP';
  EspecialVisible := True;
end;

function TfrmManCtbRespReclAFIP.Validar: Boolean;
begin
  Result := inherited Validar;

  if Result then
  begin
    Result := False;

    if trim(edEspecial.Text) = '' then
      InvalidMsg(edEspecial, 'Debe indicar si el código es aceptado o no por la AFIP (S/N).')
    else if (edEspecial.Text <> 'S') and (edEspecial.Text <> 'N') then
      InvalidMsg(edEspecial, ' Ingrese S/N para indicar si el código es aceptado o no por la AFIP')
    else
      Result := True;
  end;
end;

end.
