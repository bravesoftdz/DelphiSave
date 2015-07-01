unit unFrmConsultaLogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TFrmConsultaLogs = class(TfrmCustomConsulta)
    procedure tbEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses unDmEmision, unFuncionesEmision;

{$R *.dfm}

procedure TFrmConsultaLogs.tbEliminarClick(Sender: TObject);
begin
//  inherited;
  if (MessageDlg('¿Confirma la reinicialización de la traza?', mtConfirmation, [mbYes, mbNo], 0)
        in [mrYes]) then
  begin
    do_inicializartraza;
  end;

end;

end.
