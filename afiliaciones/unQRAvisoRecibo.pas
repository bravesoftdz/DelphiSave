unit unQRAvisoRecibo;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptAvisoRecibo = class(TQuickRep)
    subdetail: TQRSubDetail;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    lbNombreProvart: TQRLabel;
    lbDireccionProvart: TQRLabel;
    lbCPProvart: TQRLabel;
    lbLocalidadProvart: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    lbUsuario: TQRLabel;
    lbLeyendaAcuse: TQRLabel;
    procedure lbLeyendaAcusePrint(Sender: TObject; var Value: String);
  private
    function SetLeyenda(const aIdCarta: Integer; const aLeyenda, aSqlAvisoRecibo: String): String;
  public
    procedure Preparar(const aIds: String);
  end;

var
  rptAvisoRecibo: TrptAvisoRecibo;

implementation

uses
  unComunes, unSesion, unDmPrincipal;

{$R *.DFM}

function TrptAvisoRecibo.SetLeyenda(const aIdCarta: Integer; const aLeyenda, aSqlAvisoRecibo: String): String;
  function ReemplazarParametro(aLeyenda: String; const aValor: String): String;
  var
    iPosInicial: Integer;
    iTamano: Integer;
  begin
    Result := aLeyenda;

    iPosInicial := Pos(':', aLeyenda);
    aLeyenda := Copy(aLeyenda, iPosInicial, Length(aLeyenda));

    iTamano := Pos(' ', aLeyenda) - 1;
    if iTamano = -1 then
      iTamano := Length(aLeyenda);

    Delete(Result, iPosInicial, iTamano);
    Insert(aValor, Result, iPosInicial);
  end;
  
var
  iLoop: Integer;
begin
  Result := aLeyenda;

  if aSqlAvisoRecibo = '' then
    Exit;


  with GetQueryEx(aSqlAvisoRecibo, [aIdCarta]) do
  try
    for iLoop := 0 to FieldCount - 1 do
      Result := ReemplazarParametro(Result, Fields[iLoop].AsString);
  finally
    Free;
  end;
end;


procedure TrptAvisoRecibo.Preparar(const aIds: String);
begin
  lbUsuario.Caption          := Sesion.UserID;
  lbNombreProvart.Caption    := ART_NOMBRE2;
  lbDireccionProvart.Caption := StringReplace(ART_DOMICILIO, '1º', '5º', []);
  lbCPProvart.Caption        := ART_CPOSTALA;
  lbLocalidadProvart.Caption := ART_LOCALIDAD;

  with sdqDatos do
  begin
    Close;
    SQL.Text := Format(SQL.Text, [aIds, aIds]);
    Open;
  end;

  Print;
end;

procedure TrptAvisoRecibo.lbLeyendaAcusePrint(Sender: TObject; var Value: String);
begin
  with sdqDatos do
    Value := SetLeyenda(FieldByName('ca_id').AsInteger, FieldByName('ht_leyendaacuse').AsString,
                        FieldByName('ht_sqlavisorecibo').AsString);
end;

end.
