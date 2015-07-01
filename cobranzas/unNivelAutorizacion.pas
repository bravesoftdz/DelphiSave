unit unNivelAutorizacion;

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
  TfrmNivelAutorizacion = class(TfrmCustomGridABM)
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    ToolButton1: TToolButton;
    ShortCutControl1: TShortCutControl;
    fraCategoria: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    Label3: TLabel;
    edDeudaNominalHasta: TCurrencyEdit;
    edCantCuotasAdeudadas: TIntEdit;
    Label2: TLabel;
    Label4: TLabel;
    edCantCuotasFinanciar: TIntEdit;
    edPorcQuitaIntMoraFinancia: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    edPorcQuitaIntMoraContado: TCurrencyEdit;
    Label7: TLabel;
    edPorcQuitaIntFinanciacion: TCurrencyEdit;
    Label8: TLabel;
    edPorcAnticipoMin: TCurrencyEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmNivelAutorizacion: TfrmNivelAutorizacion;

implementation

uses
  SqlFuncs, unSesion, CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfrmNivelAutorizacion.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: string;
begin
  sSql := 'SELECT NA_DESCRIPCION CATEGORIA, CC_MONTODEUDA MONTODEUDA, CC_CUOTADEUDA CUOTADEUDA, ' +
                 'CC_CUOTAFINANC CUOTAFINANC, CC_QUITAINTMORAFINANC QUITAINTMORAFINANC, ' +
                 'CC_QUITAINTMORACONT QUITAINTMORACONT, CC_QUITAINTFINANC QUITAINTFINANC, ' +
                 'CC_ANTICIPO ANTICIPO, TRUNC(CC_FECHABAJA) FECHABAJA, CC_ID ' +
            'FROM ZNA_NIVELAUTORIZACION, ZCC_CONTROLCOBRANZA ' +
           'WHERE NA_ID = CC_IDNIVELAUTORIZA ';

  sWhere := '';

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND CC_FECHABAJA IS NULL';

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmNivelAutorizacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkSoloActivos.Checked := True;
end;

procedure TfrmNivelAutorizacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'MONTODEUDA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'MONTODEUDA' )).Currency := True;

  if sdqConsulta.FieldByName( 'QUITAINTMORAFINANC' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'QUITAINTMORAFINANC' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'QUITAINTMORACONT' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'QUITAINTMORACONT' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'QUITAINTFINANC' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'QUITAINTFINANC' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'ANTICIPO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ANTICIPO' ) ).DisplayFormat := '% #,##0.00';
end;

procedure TfrmNivelAutorizacion.ClearControls;
begin
  inherited;

  fraCategoria.Clear;
  edDeudaNominalHasta.Clear;
  edCantCuotasAdeudadas.Clear;
  edCantCuotasFinanciar.Clear;
  edPorcQuitaIntMoraFinancia.Clear;
  edPorcQuitaIntMoraContado.Clear;
  edPorcQuitaIntFinanciacion.Clear;
  edPorcAnticipoMin.Clear;
end;

procedure TfrmNivelAutorizacion.LoadControls;
begin
  inherited;
end;

function TfrmNivelAutorizacion.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCategoria.IsEmpty, fraCategoria, 'La categoría es obligatoria.');

  sSql := 'SELECT 1 ' +
            'FROM ZCC_CONTROLCOBRANZA ' +
           'WHERE CC_FECHABAJA IS NULL ' +
             'AND CC_IDNIVELAUTORIZA = :Id';
  Verificar(ExisteSqlEx(sSql, [fraCategoria.Value]), fraCategoria, 'Existe un valor activo para esta categoría.');

  Result := True;
end;

procedure TfrmNivelAutorizacion.FormCreate(Sender: TObject);
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

function TfrmNivelAutorizacion.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'ZCC_CONTROLCOBRANZA';

      case ModoABM of
        maAlta:
          begin
            SqlType := stInsert;

            PrimaryKey.Add ('CC_ID',             'SEQ_ZCC_ID.NEXTVAL', False);
            Fields.Add('CC_IDNIVELAUTORIZA',     fraCategoria.Value);
            Fields.Add('CC_MONTODEUDA',          edDeudaNominalHasta.Value, dtNumber);
            Fields.Add('CC_CUOTADEUDA',          edCantCuotasAdeudadas.Value);
            Fields.Add('CC_CUOTAFINANC',         edCantCuotasFinanciar.Value);
            Fields.Add('CC_QUITAINTMORAFINANC',  edPorcQuitaIntMoraFinancia.Value, dtNumber);
            Fields.Add('CC_QUITAINTMORACONT',    edPorcQuitaIntMoraContado.Value, dtNumber);
            Fields.Add('CC_QUITAINTFINANC',      edPorcQuitaIntFinanciacion.Value, dtNumber);
            Fields.Add('CC_ANTICIPO',            edPorcAnticipoMin.Value, dtNumber);
            Fields.Add('CC_USUALTA',             Sesion.UserID);
            Fields.Add('CC_FECHAALTA',           exDateTime);
          end;
        maBaja:
          begin
            SqlType := stUpdate;

            PrimaryKey.Add('CC_ID',               sdqConsulta.FieldByName('CC_ID').AsInteger, False);
            Fields.Add('CC_USUBAJA',              Sesion.UserID);
            Fields.Add('CC_FECHABAJA',            exDateTime);
          end;
      end;

      Result := inherited DoABM;
    end;
end;

end.

