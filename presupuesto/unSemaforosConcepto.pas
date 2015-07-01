unit unSemaforosConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, Mask, PatternEdit,
  IntEdit, ToolEdit, CurrEdit;

type
  TfrmSemaforosConcepto = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    edMes: TIntEdit;
    Label1: TLabel;
    edLimiteInferior: TCurrencyEdit;
    edLimiteSuperior: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIdConcepto: TTableId;
    procedure SetIdConcepto(const Value: TTableId);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdConcepto: TTableId     read FIdConcepto     write SetIdConcepto;
  end;

var
  frmSemaforosConcepto: TfrmSemaforosConcepto;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, Strfuncs, DbFuncs, General, SqlFuncs, 
  VCLExtra, CustomDlgs;

procedure TfrmSemaforosConcepto.ClearControls;
begin
  edMes.Clear;
  edLimiteInferior.Clear;
  edLimiteSuperior.Clear;
end;

function TfrmSemaforosConcepto.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maAlta then
        begin
          PrimaryKey.Add('PS_ID',         GetSecNextVal('SEQ_OPS_ID'));
          Fields.Add('PS_IDCONCEPTO',     FIdConcepto);
          Fields.Add('PS_FECHAALTA',      exDateTime);
          Fields.Add('PS_USUALTA',        Sesion.UserID );

          Fields.Add('PS_MES',            edMes.Value);
          Fields.Add('PS_LIMITEINFERIOR', edLimiteInferior.Value);
          Fields.Add('PS_LIMITESUPERIOR', edLimiteSuperior.Value);

          SqlType := stInsert;
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PS_ID',         sdqConsulta.FieldByName('PS_ID').AsInteger);
          Fields.Add('PS_FECHABAJA',      exDateTime);
          Fields.Add('PS_USUBAJA',        Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmSemaforosConcepto.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(edMes.IsEmpty, edMes, 'El mes es obligatorio.');

  sSql := 'SELECT 1 ' +
            'FROM CONT.OPS_PRESUPUESTOCONCSEMAFORO ' +
           'WHERE PS_IDCONCEPTO = :IdConcepto ' +
             'AND PS_MES = :Mes ' +
             'AND PS_FECHABAJA IS NULL';
  Verificar(ExisteSqlEx(sSql, [FIdConcepto, edMes.Value]), edMes, 'El mes ya existe.');

  Verificar(edLimiteInferior.Value > edLimiteSuperior.Value, edLimiteInferior, 'El límite inferior no puede mayor que el límite superior.');

  Result := True;
end;

procedure TfrmSemaforosConcepto.SetIdConcepto(const Value: TTableId);
var
  sSql: String;
begin
  if FIdConcepto <> Value then
    begin
      FIdConcepto := Value;

      sSql := 'SELECT PC_DESCRIPCION ' +
                'FROM OPC_PRESUPUESTOCONCEPTO ' +
               'WHERE PC_ID = :IdConcepto';
      Caption := 'Administración de Semáforos por Concepto - ' + ValorSqlEx(sSql, [FIdConcepto]);

      tbRefrescarClick(nil);
    end;
end;

procedure TfrmSemaforosConcepto.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT PS_ID, PS_MES, PS_LIMITEINFERIOR, PS_LIMITESUPERIOR, TRUNC(PS_FECHABAJA) FECHABAJA ' +
            'FROM CONT.OPS_PRESUPUESTOCONCSEMAFORO ' +
           'WHERE PS_IDCONCEPTO = :IdConcepto ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  sdqConsulta.ParamByName('IdConcepto').AsInteger := FIdConcepto;

  inherited;
end;

procedure TfrmSemaforosConcepto.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'CONT.OPS_PRESUPUESTOCONCSEMAFORO';
end;

procedure TfrmSemaforosConcepto.LoadControls;
begin
  // Compatibilidad con Delphi XE2
end;

end.

