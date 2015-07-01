unit unManObjetivos;
                
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit;

type
  TfrmManObjetivos = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edObjetivo: TEdit;
    ceCapitasHasta: TCurrencyEdit;
    ceComisionSectorPublico: TCurrencyEdit;
    ceComisionSectorPrivado: TCurrencyEdit;
    ceCapitasDesde: TCurrencyEdit;
    cePrimaDesde: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    cePrimaHasta: TCurrencyEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManObjetivos: TfrmManObjetivos;

implementation

uses
  unDmPrincipal, unSesion, AnsiSql, CustomDlgs, SqlFuncs;

{$R *.DFM}

function TfrmManObjetivos.DoABM: Boolean;
var
  fId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'XOB_OBJETIVO';

  if ModoABM = maAlta then
    fId := GetSecNextVal('SEQ_XOB_ID')
  else
    fId := sdqConsulta.FieldByName('OB_ID').AsInteger;

  Sql.PrimaryKey.Add('OB_ID', fId, False);

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;

    Sql.Fields.Add('OB_USUBAJA',    Sesion.UserID);
    Sql.Fields.Add('OB_FECHABAJA',  SQL_ACTUALDATE, False);
  end
  else
  begin
    Sql.Fields.Add('OB_DESCRIPCION',                 edObjetivo.Text);
    Sql.Fields.AddExtended('OB_CAPITASDESDE',        ceCapitasDesde.Value, 0, True);
    Sql.Fields.AddExtended('OB_CAPITASHASTA',        ceCapitasHasta.Value, 0, True);
    Sql.Fields.AddExtended('OB_PORCCOMISIONPRIVADO', ceComisionSectorPrivado.Value, 2, False);
    Sql.Fields.AddExtended('OB_PORCCOMISIONPUBLICO', ceComisionSectorPublico.Value, 2, False);
    Sql.Fields.AddExtended('OB_PRIMADESDE',          cePrimaDesde.Value, 2, True);
    Sql.Fields.AddExtended('OB_PRIMAHASTA',          cePrimaHasta.Value, 2, True);

    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;

      Sql.Fields.Add('OB_USUALTA',    Sesion.UserID);
      Sql.Fields.Add('OB_FECHAALTA',  SQL_ACTUALDATE, False);
    end
    else
    begin
      Sql.SqlType := stUpdate;

      Sql.Fields.Add('OB_USUMODIF',   Sesion.UserID);
      Sql.Fields.Add('OB_FECHAMODIF', SQL_ACTUALDATE, False);
    end;
  end;

  Result := inherited DoABM;
end;

function TfrmManObjetivos.Validar: Boolean;
begin
  Verificar((edObjetivo.Text = ''), edObjetivo, 'El nombre del Objetivo es Obligatorio.');
  Verificar((ceCapitasDesde.Value = 0) and (cePrimaDesde.Value = 0), ceCapitasDesde, 'La Cantidad de Cápitas o la Prima Desde son Obligatorias.');
  Verificar((ceCapitasHasta.Value <> 0) and (ceCapitasDesde.Value > ceCapitasHasta.Value), ceCapitasHasta, 'La Cantidad de Cápitas Hasta debe ser mayor a la Cantidad de Cápitas Desde.');
  Verificar((cePrimaDesde.Value <> 0) and (cePrimaDesde.Value > cePrimaHasta.Value), cePrimaHasta, 'La Prima Hasta debe ser mayor a la Prima Desde.');

  Result := True;
end;

procedure TfrmManObjetivos.ClearControls;
begin
  edObjetivo.Clear;
  ceCapitasDesde.Clear;
  ceCapitasHasta.Clear;
  ceComisionSectorPrivado.Clear;
  ceComisionSectorPublico.Clear;
  cePrimaDesde.Clear;
  cePrimaHasta.Clear;
end;

procedure TfrmManObjetivos.LoadControls;
begin
  with sdqConsulta do
  begin
    edObjetivo.Text               := FieldByName('OBJETIVO').AsString;
    ceCapitasDesde.Value          := FieldByName('CAPITASDESDE').AsFloat;
    ceCapitasHasta.Value          := FieldByName('CAPITASHASTA').AsFloat;
    ceComisionSectorPrivado.Value := FieldByName('PORCCOMISIONPRIVADO').AsFloat;
    ceComisionSectorPublico.Value := FieldByName('PORCCOMISIONPUBLICO').AsFloat;
    cePrimaDesde.Value            := FieldByName('PRIMADESDE').AsFloat;
    cePrimaHasta.Value            := FieldByName('PRIMAHASTA').AsFloat;
  end;
end;

procedure TfrmManObjetivos.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
    'SELECT OB_DESCRIPCION OBJETIVO, OB_CAPITASDESDE CAPITASDESDE, OB_CAPITASHASTA CAPITASHASTA, ' +
    '       OB_PORCCOMISIONPRIVADO PORCCOMISIONPRIVADO, OB_PORCCOMISIONPUBLICO PORCCOMISIONPUBLICO, ' +
    '       OB_FECHABAJA FECHABAJA, OB_ID, OB_PRIMADESDE PRIMADESDE, OB_PRIMAHASTA PRIMAHASTA ' +
    '  FROM XOB_OBJETIVO';

  inherited;
end;

procedure TfrmManObjetivos.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'FECHABAJA';
  ShowActived := False;
  tbRefrescarClick(nil);
end;

procedure TfrmManObjetivos.btnAceptarClick(Sender: TObject);
begin
  inherited;

  fpAbm.Close;
end;

procedure TfrmManObjetivos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    TFloatField(FieldByName('PORCCOMISIONPRIVADO')).DisplayFormat := '% 0.00';
    TFloatField(FieldByName('PORCCOMISIONPUBLICO')).DisplayFormat := '% 0.00';

    if FieldByName('PRIMADESDE') is TFloatField then
       TFloatField(FieldByName('PRIMADESDE')).Currency := True;

    if FieldByName('PRIMAHASTA') is TFloatField then
       TFloatField(FieldByName('PRIMAHASTA')).Currency := True;
  end;
end;

end.

