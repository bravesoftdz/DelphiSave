unit unUpdateTarifasCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls;

type
  TfrmUpdateTarifaCarta = class(TfrmCustomConsulta)
    chkDifieren: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbModificarClick(Sender: TObject);
  private
  public
  end;

var
  frmUpdateTarifaCarta: TfrmUpdateTarifaCarta;

implementation

Uses
  unPrincipal, AnsiSql, unAfiliaciones, unDmPrincipal, numeros;

{$R *.DFM}

procedure TfrmUpdateTarifaCarta.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT * FROM mlf.tmp_tarifa';
  if chkDifieren.Checked then
    sSql := sSql + ' WHERE ((mp_porcmasatarifa <> mp_porcmasatarifadelphi) OR (mp_sumafijatarifa <> mp_sumafijatarifadelphi))';

  sdqConsulta.Sql.Text := sSql;

  inherited;
end;

procedure TfrmUpdateTarifaCarta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmUpdateTarifaCarta := nil;
end;

procedure TfrmUpdateTarifaCarta.tbNuevoClick(Sender: TObject);
var
  sSql: String;
  aTarifa: recTarifa;
begin
  sSql := 'SELECT * FROM mlf.tmp_tarifa';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      GetTarifaFromEndoso(FieldByName('mp_id').AsInteger, aTarifa, FieldByName('mp_tiporegistro').AsString = '1');

      sSql :=
        'UPDATE mlf.tmp_tarifa' +
          ' SET mp_sumafijatarifadelphi = :sumafijatarifadelphi,' +
              ' mp_porcmasatarifadelphi = :porcmasatarifadelphi' +
        ' WHERE mp_id = :id';
      EjecutarSqleX(sSql, [RoundNumber(aTarifa.SumaFijaTarifa, 2), RoundNumber(aTarifa.PorcMasaTarifa, 4),
                           FieldByName('mp_id').AsInteger]);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmUpdateTarifaCarta.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
var
  cPorcMasaTarifa: Currency;
  cSumaFijaTarifa: Currency;  
begin
  inherited;

  //pinta de un color distinto las tarifas que no se corresponden
  with sdqConsulta do
  begin
    cSumaFijaTarifa := FieldByName('mp_sumafijatarifa').AsCurrency;
    cPorcMasaTarifa := FieldByName('mp_porcmasatarifa').AsCurrency;

    if (cSumaFijaTarifa <> FieldByName('mp_sumafijatarifadelphi').AsCurrency) then
      if (LowerCase(Field.FieldName) = 'mp_sumafijatarifa') or (LowerCase(Field.FieldName) = 'mp_sumafijatarifadelphi') then
        AFont.Color := clBlue;

    if (cPorcMasaTarifa <> FieldByName('mp_porcmasatarifadelphi').AsCurrency) then
      if (LowerCase(Field.FieldName) = 'mp_porcmasatarifa') or (LowerCase(Field.FieldName) = 'mp_porcmasatarifadelphi') then
        AFont.Color := clRed;
  end;
end;

procedure TfrmUpdateTarifaCarta.tbModificarClick(Sender: TObject);
var
  sSql: String;
  Tarifa: recTarifa;
begin
  sSql := 'SELECT * FROM mlf.tmp_tarifa';
  with GetQuery(sSql) do
  try
    BeginTrans;
    try
      while not Eof do
      begin
        GetTarifaFromEndoso(FieldByName('mp_id').AsInteger, Tarifa, FieldByName('mp_tiporegistro').AsString = '1');
        if (FieldByName('mp_tiporegistro').AsString = '1') then
        begin
          sSql :=
            'UPDATE tet_endosotarifa' +
              ' SET et_sumafijatarifa = :sumafijatarifa,' +
                  ' et_porcmasatarifa = :porcmasatarifa' +
            ' WHERE et_id = :id';
          EjecutarSqlSTEx(sSql, [RoundNumber(Tarifa.SumaFijaTarifa, 2), RoundNumber(Tarifa.PorcMasaTarifa, 4),
                                 FieldByName('mp_id').AsInteger]);
        end
        else
        begin
          sSql :=
            'UPDATE aht_historicotarifario' +
              ' SET ht_sumafijatarifa = :sumafijatarifa,' +
                  ' ht_porcmasatarifa = :porcmasatarifa' +
            ' WHERE ht_id = (SELECT en_idhistoricotarifa' +
                             ' FROM aen_endoso' +
                            ' WHERE en_id = :id)';
          EjecutarSqlSTEx(sSql, [RoundNumber(Tarifa.SumaFijaTarifa, 2), RoundNumber(Tarifa.PorcMasaTarifa, 4),
                                 FieldByName('mp_id').AsInteger]);

          {  PARA MODIFICAR LA ATC_TARIFARIOCONTRATO HAY QUE ASEGURARSE QUE ES LA ULTIMA TARIFA!!!!!  }
          sSql :=
            'SELECT tc_contrato' +
             ' FROM atc_tarifariocontrato, mlf.tmp_tarifa, aen_endoso' +
            ' WHERE mp_sumafijatarifa = tc_sumafijatarifa' +
              ' AND mp_porcmasatarifa = tc_porcmasatarifa' +
              ' AND tc_contrato = en_contrato' +
              ' AND en_id = mp_id' +
              ' AND en_id = :id';
          if ExisteSqlEx(sSql, [FieldByName('mp_id').AsInteger]) then
          begin
            sSql :=
              'UPDATE atc_tarifariocontrato' +
                ' SET tc_sumafijatarifa = :sumafijatarifa,' +
                    ' tc_porcmasatarifa = :porcmasatarifa' +
              ' WHERE tc_contrato = (SELECT en_contrato' +
                                     ' FROM aen_endoso' +
                                    ' WHERE en_id = :id)';
            EjecutarSqlSTEx(sSql, [RoundNumber(Tarifa.SumaFijaTarifa, 2), RoundNumber(Tarifa.PorcMasaTarifa, 4),
                                   FieldByName('mp_id').AsInteger]);
          end;
        end;
        Next;
      end;
      MessageDlg('Se han guardado los datos correctamente.', mtInformation, [mbOK], 0);
      CommitTrans;
    except
      on E:Exception do
      begin
        RollBack;
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    Free;
  end;
end;

end.
