unit unUpdateVigenciaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmUpdateVigenciaContrato = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbModificarClick(Sender: TObject);
  private
  public
  end;

var
  frmUpdateVigenciaContrato: TfrmUpdateVigenciaContrato;

implementation

uses
  unPrincipal, AnsiSql, unAfiliaciones, unDmPrincipal, Numeros, DateTimeFuncs;

{$R *.DFM}

procedure TfrmUpdateVigenciaContrato.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Sql.Text := 'SELECT * FROM mlf.tmp_updatevigencia';

  inherited;
end;

procedure TfrmUpdateVigenciaContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmUpdateVigenciaContrato := nil;
end;

procedure TfrmUpdateVigenciaContrato.tbModificarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT * FROM mlf.tmp_updatevigencia';
  with GetQuery(sSql) do
  try
    try
      while not Eof do
      begin
        BeginTrans;
        sSql :=
          'UPDATE ahc_historicocontrato' +
            ' SET hc_vigenciahasta = :vigenciahasta' +
          ' WHERE hc_contrato = :contrato' +
            ' AND hc_vigenciahasta = :vigenciahasta';
        EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(FieldByName('mp_vigcorrecta').AsDateTime),
                               FieldByName('mp_contrato').AsInteger,
                               TDateTimeEx.Create(FieldByName('mp_vigactual').AsDateTime)]);

        sSql :=
          'UPDATE aco_contrato' +
            ' SET co_vigenciahasta = :vigenciahasta' +
          ' WHERE co_contrato = :contrato' +
            ' AND co_vigenciahasta = :vigenciahasta';
        EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(FieldByName('mp_vigcorrecta').AsDateTime),
                               FieldByName('mp_contrato').AsInteger,
                               TDateTimeEx.Create(FieldByName('mp_vigactual').AsDateTime)]);
        CommitTrans;
        Next;
      end;
      MessageDlg('Se han guardado los datos correctamente.', mtInformation, [mbOK], 0);
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
