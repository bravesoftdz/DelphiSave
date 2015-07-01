unit unInvPrevision;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArt, RxCurrEdit, Vcl.Mask, RxToolEdit,
  DateComboBox;

type
  TfrmInvPrevision = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    Label12: TLabel;
    edFechaAltaModif: TDateComboBox;
    Label7: TLabel;
    edPorcAltaModif: TCurrencyEdit;
    procedure tbEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FIdInstrumento: TTableId;
    procedure SetIdInstrumento(const Value: TTableId);
  public
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdInstrumento: TTableId     read FIdInstrumento    write SetIdInstrumento;
  end;

var
  frmInvPrevision: TfrmInvPrevision;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs,
  VCLExtra, CustomDlgs;

procedure TfrmInvPrevision.ClearControls;
begin
  edFechaAltaModif.Clear;
  edPorcAltaModif.Clear;
end;

function TfrmInvPrevision.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('PR_ID',          GetSecNextVal('INV.SEQ_NPR_ID'));
          Fields.Add('PR_FECHAALTA',       exDateTime);
          Fields.Add('PR_USUALTA',         Sesion.UserID);

          Fields.Add('PR_IDINSTRUMENTO',   IdInstrumento);
          Fields.Add('PR_FECHA',           edFechaAltaModif.Date);
          Fields.Add('PR_PORCENTAJE',      edPorcAltaModif.Value);

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PR_ID',          sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PR_FECHABAJA',       exDateTime);
          Fields.Add('PR_USUBAJA',         Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

procedure TfrmInvPrevision.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NPR_PREVISION';
end;

procedure TfrmInvPrevision.RefreshData;
var
  sSql, sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT PR_FECHA FECHA, PR_PORCENTAJE PORCENTAJE, TRUNC(PR_FECHABAJA) FECHA_BAJA, ' +
                 'PR_ID ID ' +
            'FROM NPR_PREVISION ' +
           'WHERE PR_IDINSTRUMENTO = :IdInstrumento';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PR_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;
  sdqConsulta.ParamByName('IdInstrumento').AsInteger := IdInstrumento;

  inherited;
end;

procedure TfrmInvPrevision.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('PORCENTAJE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCENTAJE')).DisplayFormat := '% 0.000;-% 0.000';
end;

procedure TfrmInvPrevision.SetIdInstrumento(const Value: TTableId);
begin
  if FIdInstrumento <> Value then
    begin
      FIdInstrumento := Value;
      RefreshData();
    end;
end;

procedure TfrmInvPrevision.tbEliminarClick(Sender: TObject);
begin
  Verificar(IsBaja(), nil, 'La previsión ya ha sido dada de baja.');

  inherited;
end;

procedure TfrmInvPrevision.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

function TfrmInvPrevision.Validar: Boolean;
begin
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'Debe indicar la fecha.');
  Verificar(edPorcAltaModif.Value <= 0, edPorcAltaModif, 'El porcentaje debe ser mayor a 0.');

  Result := True;
end;

procedure TfrmInvPrevision.LoadControls;
begin
  inherited;
end;

end.

