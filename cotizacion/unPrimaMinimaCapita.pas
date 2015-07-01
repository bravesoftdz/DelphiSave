unit unPrimaMinimaCapita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, Mask,
  PatternEdit, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmPrimaMinimaCapita = class(TfrmManCtbTablas)
    procedure FormCreate(Sender: TObject);
  private
  protected
    function Validar: Boolean; override;
  public
  end;

var
  frmPrimaMinimaCapita: TfrmPrimaMinimaCapita;

implementation

uses
  CustomDlgs;

{$R *.dfm}

procedure TfrmPrimaMinimaCapita.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'MINTR';
  EspecialCaption := 'Valor';
  EspecialVisible := True;
end;

function TfrmPrimaMinimaCapita.Validar: Boolean;
begin
  Result := inherited Validar;

  try
    if Result then
      StrToFloat(edEspecial.Text);
  except
    Verificar(True, edEspecial, 'Debe ingresar un valor numérico válido.');
  end;
  
  Result := True;
end;

end.
