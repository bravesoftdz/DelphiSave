unit unSeleccionPreventor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CheckLst, JvExCheckLst,
  JvCheckListBox, unCustomGridABM, ARTCheckListBox;

type
  TfrmSeleccionPreventor = class(TfrmCustomConsulta)
    lblPerfil: TLabel;
    Panel1: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    pnlBottom: TPanel;
    clbPerfiles: TARTCheckListBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
  public
    FCodigo : string;
  end;

var
  frmSeleccionPreventor: TfrmSeleccionPreventor;

implementation

uses
  SqlOracle, unDmPrincipal, CustomDlgs, ungrids, VCLExtra, Math;

{$R *.dfm}


procedure TfrmSeleccionPreventor.tbRefrescarClick(Sender: TObject);
var
  sSql : string;
begin
  sSQL :=
    ' SELECT it_codigo, it_nombre, '+
    '     (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''ET'') AS cantet, '+
    '     (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''CO'') AS cantco, '+
    '     (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''GB'') AS cantgb, '+
    '     (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''EP'') AS cantep, '+
    '         (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''EAD'') AS cantead, '+
    '         (SELECT COUNT (*) '+
    '        FROM art.pit_firmantes pitet, '+
    '             hys.hep_estabporpreventor hepet, '+
    '             hys.hte_tipoempresaprev hteet '+
    '       WHERE pitet.it_codigo = a.it_codigo '+
    '         AND pitet.it_id = hepet.ep_idfirmante '+
    '         AND hepet.ep_fechabaja IS NULL '+
    '         AND hepet.ep_idtipoestabprev = hteet.te_id '+
    '         AND te_codigo = ''EADS'') AS canteads, '+
    '         COUNT (*) cantidadtotal '+
    '   FROM art.pit_firmantes a, '+
    '        hys.hep_estabporpreventor, '+
    '        hys.hte_tipoempresaprev '+
    '  WHERE it_fechabaja IS NULL '+
    '    AND it_id = ep_idfirmante '+
    '    AND ep_fechabaja IS NULL '+
    '    AND ep_idtipoestabprev = te_id ';

  sSql := sSql + clbPerfiles.InSQL_IntegerValues('nvl(it_idperfil,-1)', False);//clbPerfiles.CheckCount = 0);
  sSql := sSql + ' GROUP BY it_codigo, it_nombre';

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmSeleccionPreventor.btnAceptarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, btnAceptar, 'Debe seleccionar un preventor.');
  FCodigo := sdqConsulta.FieldByName('IT_CODIGO').AsString;
  ModalResult := mrOK;
end;

procedure TfrmSeleccionPreventor.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(Grid);
  Width := Max(GetColumnWidths(Grid, True) + 25, 500);
  inherited;
  pnlBottom.Caption := 'Total: ' + IntToStr(sdqConsulta.RecordCount);
end;

procedure TfrmSeleccionPreventor.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  clbPerfiles.UncheckAll;
end;

procedure TfrmSeleccionPreventor.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  pnlBottom.Caption := '';
end;

end.
