unit unSeleccionResponsableHYS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmSeleccionResponsableHYS = class(TfrmCustomConsulta)
    Panel1: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pnlBottom: TPanel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FContrato : String;
    FCodigo   : String;
  end;

var
  frmSeleccionResponsableHYS: TfrmSeleccionResponsableHYS;

implementation

uses
  SqlOracle, unDmPrincipal, CustomDlgs, ungrids, VCLExtra, Math;

{$R *.dfm}


procedure TfrmSeleccionResponsableHYS.tbRefrescarClick(Sender: TObject);
var
  sSql : string;
begin
  sSQL :=
      ' SELECT act.* '+
      '   FROM act_contacto act, aco_contrato '+
      '  WHERE ct_cargo = ''01090'' '+
      '    AND co_contrato = '+ SqlValue(FContrato)+
      '    AND ct_idempresa = co_idempresa '+
      '    AND ct_fechabaja IS NULL ';
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmSeleccionResponsableHYS.btnAceptarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnAceptar, 'Debe seleccionar un Responsable HYS.');
  FCodigo := sdqConsulta.FieldByName('ct_id').AsString;
  ModalResult := mrOK;
end;

procedure TfrmSeleccionResponsableHYS.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(Grid);
  Width := Max(GetColumnWidths(Grid, True) + 25, 500);
  inherited;
  pnlBottom.Caption := 'Total: ' + IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmSeleccionResponsableHYS.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  pnlBottom.Caption := '';
end;

end.
