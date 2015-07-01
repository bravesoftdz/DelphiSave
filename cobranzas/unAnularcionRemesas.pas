unit unAnularcionRemesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmAnularcionRemesas = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbDetalle: TToolButton;
    ToolButton2: TToolButton;
    tbRechazarAnulacion: TToolButton;
    ToolButton7: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure tbRechazarAnulacionClick(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmAnularcionRemesas: TfrmAnularcionRemesas;

implementation

uses
  unDetalleRemesa, CustomDlgs, unSesion, unDmPrincipal;

{$R *.dfm}

procedure TfrmAnularcionRemesas.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT BA_NOMBRE BANCO, CB_NUMERO CUENTA, RM_FECHA FECHA, RM_MONTO MONTO, RM_ID IDREMESA, ' +
                 'RM_IDMOVBANCO IDMOVBANCO ' +
            'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, RRM_REMESA ' +
           'WHERE BA_ID = CB_IDBANCO ' +
             'AND CB_ID = RM_IDCUENTABANCARIA ' +
             'AND RM_ANULAR = ''S''';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmAnularcionRemesas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;
end;

procedure TfrmAnularcionRemesas.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');

  if MsgBox('¿Confirma la anulación de la remesa?', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    begin
      sSql := 'CONT.DO_ANULAREMESA(:IdMovBanco, :User, ''S'');';
      EjecutarStoreEx(sSql, [sdqConsulta.FieldByName('IDMOVBANCO').AsInteger, Sesion.UserId]);

      sdqConsulta.Refresh;
    end;
end;

procedure TfrmAnularcionRemesas.tbDetalleClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');

  with TfrmDetalleRemesa.Create(nil) do
    try
      FormStyle := fsNormal;
      Hide;

      IdRemesa := Self.sdqConsulta.FieldByName('IDREMESA').AsInteger;

      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmAnularcionRemesas.tbRechazarAnulacionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');

  if MsgBox('¿Confirma el rechazo de la anulación de la remesa?', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    begin
      sSql := 'UPDATE RRM_REMESA ' +
                 'SET RM_ANULAR = ''N'', ' +
                     'RM_USUMODIF = :User, ' +
                     'RM_FECHAMODIF = SYSDATE ' +
               'WHERE RM_ID = :Id';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('IDREMESA').AsInteger]);

      sdqConsulta.Refresh;
    end;
end;

end.
