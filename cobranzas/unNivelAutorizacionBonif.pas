unit unNivelAutorizacionBonif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, PatternEdit, IntEdit, Mask, ToolEdit,
  CurrEdit;

type
  TfrmNivelAutorizacionBonif = class(TfrmCustomGridABM)
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    ToolButton1: TToolButton;
    ShortCutControl1: TShortCutControl;
    fraCategoria: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    Label3: TLabel;
    edMontoHasta: TCurrencyEdit;
    edPorcCuotaProm: TCurrencyEdit;
    Label5: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmNivelAutorizacionBonif: TfrmNivelAutorizacionBonif;

implementation

uses
  SqlFuncs, unSesion, CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfrmNivelAutorizacionBonif.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: string;
begin
  sSql := 'SELECT NA_DESCRIPCION CATEGORIA, CB_MONTOHASTA MONTOHASTA, ' +
                 'CB_PORCHASTA PORCHASTA, TRUNC(CB_FECHABAJA) FECHABAJA, CB_ID ' +
            'FROM ZNA_NIVELAUTORIZACION, ZCB_CONTROLBONIFICACION ' +
           'WHERE NA_ID = CB_IDNIVELAUTORIZA ';

  sWhere := '';

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND CB_FECHABAJA IS NULL';

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmNivelAutorizacionBonif.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkSoloActivos.Checked := True;
end;

procedure TfrmNivelAutorizacionBonif.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('MONTOHASTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOHASTA' )).Currency := True;

  if sdqConsulta.FieldByName('PORCHASTA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('PORCHASTA')).DisplayFormat := '% #,##0.00';
end;

procedure TfrmNivelAutorizacionBonif.ClearControls;
begin
  inherited;

  fraCategoria.Clear;
  edPorcCuotaProm.Clear;
  edMontoHasta.Clear;
end;

procedure TfrmNivelAutorizacionBonif.LoadControls;
begin
  inherited;
end;

function TfrmNivelAutorizacionBonif.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCategoria.IsEmpty, fraCategoria, 'La categoría es obligatoria.');

  sSql := 'SELECT 1 ' +
            'FROM ZCB_CONTROLBONIFICACION ' +
           'WHERE CB_FECHABAJA IS NULL ' +
             'AND CB_IDNIVELAUTORIZA = :Id';
  Verificar(ExisteSqlEx(sSql, [fraCategoria.Value]), fraCategoria, 'Existe un valor activo para esta categoría.');

  Verificar(edPorcCuotaProm.Value = 0, edPorcCuotaProm, 'El porc. de la cuota promedio es obligatorio.');
  Verificar(edMontoHasta.Value = 0, edMontoHasta, 'El monto hasta es obligatorio.');

  Result := True;
end;

procedure TfrmNivelAutorizacionBonif.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
  FieldBaja   := 'FECHABAJA';

  with fraCategoria do
    begin
      TableName   := 'ZNA_NIVELAUTORIZACION';
      FieldId     := 'NA_ID';
      FieldCodigo := 'NA_ID';
      FieldDesc   := 'NA_DESCRIPCION';
      FieldBaja   := 'NA_USUBAJA';
      ShowBajas   := False;
    end;
end;

function TfrmNivelAutorizacionBonif.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'ZCB_CONTROLBONIFICACION';

      case ModoABM of
        maAlta:
          begin
            SqlType := stInsert;

            PrimaryKey.Add ('CB_ID',             'SEQ_ZCB_CONTROLBONIFICACION_ID.NEXTVAL', False);
            Fields.Add('CB_IDNIVELAUTORIZA',     fraCategoria.Value);
            Fields.Add('CB_PORCHASTA',           edPorcCuotaProm.Value, dtNumber);
            Fields.Add('CB_MONTOHASTA',          edMontoHasta.Value, dtNumber);
            Fields.Add('CB_USUALTA',             Sesion.UserID);
            Fields.Add('CB_FECHAALTA',           exDateTime);
          end;
        maBaja:
          begin
            SqlType := stUpdate;

            PrimaryKey.Add('CB_ID',               sdqConsulta.FieldByName('CB_ID').AsInteger, False);
            Fields.Add('CB_USUBAJA',              Sesion.UserID);
            Fields.Add('CB_FECHABAJA',            exDateTime);
          end;
      end;

      Result := inherited DoABM;
    end;
end;

end.

