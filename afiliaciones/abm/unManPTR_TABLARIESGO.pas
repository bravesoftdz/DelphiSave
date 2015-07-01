unit unManPTR_TABLARIESGO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, unFraCodigoDescripcion, unFraActividad,
  PatternEdit, IntEdit, CurrEdit;

type
  TfrmManPTR_TABLARIESGO = class(TfrmCustomGridABM)
    Label5: TLabel;
    Label4: TLabel;
    cboxRiesgo: TComboBox;
    edValor: TIntEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManPTR_TABLARIESGO: TfrmManPTR_TABLARIESGO;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, DbFuncs, General, Strfuncs, AnsiSql, VCLExtra, unPrincipal, SqlFuncs;

{$R *.dfm}

procedure TfrmManPTR_TABLARIESGO.ClearControls;
begin
  inherited;

  edValor.Enabled := True;
  edValor.Clear;
  cboxRiesgo.ItemIndex := -1;
end;

function TfrmManPTR_TABLARIESGO.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'pep.ptr_tablariesgo';

  BeginTrans;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('tr_id').AsInteger;
    Sql.Fields.Add('tr_fechabaja', 'SYSDATE', False);
    Sql.Fields.Add('tr_usubaja',   Sesion.UserID);
  end
  else
  begin
    Sql.Fields.Add('tr_valor',  edValor.Value);
    Sql.Fields.Add('tr_riesgo', cboxRiesgo.Items.Strings[cboxRiesgo.ItemIndex][1]);

    if ModoABM = maAlta then
    begin
      iId := ValorSqlInteger('SELECT pep.seq_prp_riesgo_id.NEXTVAL FROM DUAL', 0);
      Sql.Fields.Add('tr_usualta',   Sesion.UserID);
      Sql.Fields.Add('tr_fechaalta', 'SYSDATE', False);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('tr_id').AsInteger;
      Sql.Fields.Add('tr_usumodif',   Sesion.UserID);
      Sql.Fields.Add('tr_fechamodif', 'SYSDATE', False);
    end;
  end;

  Sql.PrimaryKey.Add('tr_id', iId, False);

  try
    EjecutarSqlST(Sql.Sql);
    CommitTrans;

    Result := True;

    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManPTR_TABLARIESGO.LoadControls;
begin
  edValor.Enabled := False;
  edValor.Text := sdqConsulta.FieldByName('tr_valor').AsString;
  if sdqConsulta.FieldByName('tr_riesgo').AsString = 'B' then
    cboxRiesgo.ItemIndex := 0
  else
    if sdqConsulta.FieldByName('tr_riesgo').AsString = 'M' then
      cboxRiesgo.ItemIndex := 1
    else
      cboxRiesgo.ItemIndex := 2;

  inherited;
end;

procedure TfrmManPTR_TABLARIESGO.RefreshData;
var
  sSql : String;
begin
  sSql :=
    'SELECT tr_id, tr_valor, tr_riesgo,' +
          ' CASE' +
            ' WHEN(tr_riesgo = ''B'') THEN ''Bajo''' +
            ' WHEN(tr_riesgo = ''M'') THEN ''Medio''' +
            ' WHEN(tr_riesgo = ''A'') THEN ''Alto''' +
          ' END riesgo, tr_usualta, tr_usubaja, tr_fechabaja, tr_fechaalta, tr_usumodif, tr_fechamodif, tr_fechabaja' +
     ' FROM pep.ptr_tablariesgo' +
    ' WHERE 1 = 1';
    
  sdqConsulta.Sql.Text := sSql;
  SortDialog.OrderBy;

  inherited;
end;

function TfrmManPTR_TABLARIESGO.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((edValor.Text = ''), edValor, 'El Valor no puede quedar vacío.');
  Verificar(cboxRiesgo.ItemIndex = -1, cboxRiesgo, 'El Riesgo no puede quedar vacío.');

  if ModoABM = maAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM pep.ptr_tablariesgo' +
      ' WHERE tr_valor = :valor' +
        ' AND tr_fechabaja IS NULL';
    Verificar(ExisteSqlEx(sSql, [edValor.Value]), edValor, 'Este valor ya existe.');
  end;

  sSql :=
    'SELECT 1' +
     ' FROM pep.ptr_tablariesgo' +
    ' WHERE tr_valor = :valor' +
      ' AND tr_riesgo = :riesgo' +
      ' AND tr_fechabaja IS NULL';
  if ModoABM =  maModificacion then
    sSql := sSql + ' AND tr_id <> ' + sdqConsulta.FieldByName('tr_id').AsString;

  Verificar(ExisteSqlEx(sSql, [edValor.Value, cboxRiesgo.Items.Strings[cboxRiesgo.ItemIndex][1]]), fpABM, 'El valor para este riesgo ya existe.');

  Result := True;
end;

procedure TfrmManPTR_TABLARIESGO.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'tr_fechabaja';
end;

end.
