unit unRptEgresosSemanales;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptEgresosSemanales = class(TQuickRep)
    bHeader: TQRBand;
    bDetalle: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    sdqDatos: TSDQuery;
    qriLogo: TQRImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    lblDia1: TQRLabel;
    lblFecha1: TQRLabel;
    lblVolDia1: TQRLabel;
    lblVolDia2: TQRLabel;
    lblVolDia3: TQRLabel;
    lblVolDia4: TQRLabel;
    lblVolDia5: TQRLabel;
    lblReintDia1: TQRLabel;
    lblReintDia2: TQRLabel;
    lblReintDia3: TQRLabel;
    lblReintDia4: TQRLabel;
    lblReintDia5: TQRLabel;
    lblTotalDia1: TQRLabel;
    lblTotalDia2: TQRLabel;
    lblTotalDia3: TQRLabel;
    lblTotalDia4: TQRLabel;
    lblTotalDia5: TQRLabel;
    QRLabel8: TQRLabel;
    lblDia2: TQRLabel;
    lblFecha2: TQRLabel;
    lblDia3: TQRLabel;
    lblFecha3: TQRLabel;
    lblDia4: TQRLabel;
    lblFecha4: TQRLabel;
    lblDia5: TQRLabel;
    lblFecha5: TQRLabel;
    lblTotalVolSemanal: TQRLabel;
    lblTotalReintSemanal: TQRLabel;
    lblTotal: TQRLabel;
    lblAsterisco: TQRLabel;
    lblSemana: TQRLabel;

  private
    esFinde: Boolean;
  public
    procedure Imprimir(Reintegro: currency; Periodo: string);
    function getProximoDiaSemana(Offset: Integer = 0): TDateTime;
  end;

var
  rptEgresosSemanales: TrptEgresosSemanales;

implementation

uses
  unParteEvolutivo, AnsiSql, unDmPrincipal, unComunes;

{$R *.DFM}

procedure TrptEgresosSemanales.Imprimir(Reintegro: currency; Periodo: string);
var
  sSql: String;
  i: integer; cTotalVolSemanal, VolDia1, VolDia2, VolDia3, VolDia4, VolDia5: currency;
begin
  esFinde := False;
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  VolDia1 := ValorSqlEx(sdqDatos.SQL.Text, [DateToStr(getProximoDiaSemana(1))]);
  VolDia2 := ValorSqlEx(sdqDatos.SQL.Text, [DateToStr(getProximoDiaSemana(2))]);
  VolDia3 := ValorSqlEx(sdqDatos.SQL.Text, [DateToStr(getProximoDiaSemana(3))]);
  VolDia4 := ValorSqlEx(sdqDatos.SQL.Text, [DateToStr(getProximoDiaSemana(4))]);
  VolDia5 := ValorSqlEx(sdqDatos.SQL.Text, [DateToStr(getProximoDiaSemana(5))]);

  lblVolDia1.Caption := CurrToStr(VolDia1);
  lblVolDia2.Caption := CurrToStr(VolDia2);
  lblVolDia3.Caption := CurrToStr(VolDia3);
  lblVolDia4.Caption := CurrToStr(VolDia4);
  lblVolDia5.Caption := CurrToStr(VolDia5);

  lblFecha1.Caption := DateToStr(getProximoDiaSemana(1));
  lblFecha2.Caption := DateToStr(getProximoDiaSemana(2));
  lblFecha3.Caption := DateToStr(getProximoDiaSemana(3));
  lblFecha4.Caption := DateToStr(getProximoDiaSemana(4));
  lblFecha5.Caption := DateToStr(getProximoDiaSemana(5));

  ssql := 'select to_char(to_date(:fecha, ''dd/mm/yyyy''), ''day'') from dual';

  lblDia1.Caption := Trim(ValorSqlEx(ssql, [DateToStr(getProximoDiaSemana(1))]));
  lblDia2.Caption := Trim(ValorSqlEx(ssql, [DateToStr(getProximoDiaSemana(2))]));
  lblDia3.Caption := Trim(ValorSqlEx(ssql, [DateToStr(getProximoDiaSemana(3))]));
  lblDia4.Caption := Trim(ValorSqlEx(ssql, [DateToStr(getProximoDiaSemana(4))]));
  lblDia5.Caption := Trim(ValorSqlEx(ssql, [DateToStr(getProximoDiaSemana(5))]));

  if VolDia1 > 0 then
    lblReintDia1.Caption := FormatCurr('0.00', Reintegro)
  else
    lblReintDia1.Caption := '0';

  if VolDia2 > 0 then
    lblReintDia2.Caption := FormatCurr('0.00', Reintegro)
  else
    lblReintDia2.Caption := '0';

  if VolDia3 > 0 then
    lblReintDia3.Caption := FormatCurr('0.00', Reintegro)
  else
    lblReintDia3.Caption := '0';

  if VolDia4 > 0 then
    lblReintDia4.Caption := FormatCurr('0.00', Reintegro)
  else
    lblReintDia4.Caption := '0';

  if VolDia5 > 0 then
    lblReintDia5.Caption := FormatCurr('0.00', Reintegro)
  else
    lblReintDia5.Caption := '0';

  lblTotalDia1.Caption := CurrToStr(VolDia1 + StrToCurr(lblReintDia1.Caption));
  lblTotalDia2.Caption := CurrToStr(VolDia2 + StrToCurr(lblReintDia2.Caption));
  lblTotalDia3.Caption := CurrToStr(VolDia3 + StrToCurr(lblReintDia3.Caption));
  lblTotalDia4.Caption := CurrToStr(VolDia4 + StrToCurr(lblReintDia4.Caption));
  lblTotalDia5.Caption := CurrToStr(VolDia5 + StrToCurr(lblReintDia5.Caption));

  lblTotalVolSemanal.Caption := CurrToStr(VolDia1 + VolDia2 + VolDia3 + VolDia4 + VolDia5);

  lblTotalReintSemanal.Caption := FormatCurr('0.00', (StrToCurr(lblReintDia1.Caption) + StrToCurr(lblReintDia2.Caption) +
                                  StrToCurr(lblReintDia3.Caption) + StrToCurr(lblReintDia4.Caption) + StrToCurr(lblReintDia5.Caption)));

  lblTotal.Caption := CurrToStr(StrToCurr(lblTotalVolSemanal.Caption) + StrToCurr(lblTotalReintSemanal.Caption));

  lblSemana.Caption := lblFecha1.Caption + ' - ' + lblFecha5.Caption;
  lblAsterisco.Caption := Format(lblAsterisco.Caption, [Periodo]);

  Preview;

end;

function TrptEgresosSemanales.getProximoDiaSemana(Offset: Integer): TDateTime;
var dProxFecha: Tdate;
begin

  if Offset = 1 then
    esFinde := false;

  if ValorSqlEx('select art.amebpba.is_findesemana(trunc(sysdate) + :off) from dual', [Offset]) = 'S' then
  begin
    esFinde := true;
    dProxFecha := DBDate + 2 + Offset;
  end
  else
  begin
    dProxFecha := DBDate + Offset;
    if esFinde then
      dProxFecha := dProxFecha + 2;
  end;

  getProximoDiaSemana := dProxFecha;

end;

end.
