unit unfrmObservacionNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AnsiSql, SqlFuncs, unDmPrincipal;

type
  TfrmObservacionNota = class(TForm)
    edObservacion: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetObservacion: string;
  public
    property Observacion: string read GetObservacion;
    procedure CargarObservacion(aIdNotaPeriodo: integer);
    procedure GuardarObservacion(aIdNotaPeriodo: integer);
  end;

var
  frmObservacionNota: TfrmObservacionNota;

implementation

{$R *.dfm}

procedure TfrmObservacionNota.CargarObservacion(aIdNotaPeriodo: integer);
begin
  edObservacion.Lines.Text := trim(ValorSql('SELECT NP_OBSERVACION FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo)));
end;

procedure TfrmObservacionNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

function TfrmObservacionNota.GetObservacion: string;
begin
  result := edObservacion.Lines.Text;
end;

procedure TfrmObservacionNota.GuardarObservacion(aIdNotaPeriodo: integer);
begin
  EjecutarSqlST(' UPDATE EMI.INP_NOTACONTRATOPERIODO SET NP_OBSERVACION = ' + SqlString(Observacion, true, true) +
                ' WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));
end;

end.
