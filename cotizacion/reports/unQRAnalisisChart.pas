unit unQRAnalisisChart;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   03-10-03
}

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, TeeProcs,
  TeEngine, Chart, DBChart, QrTee, Series;

type
  TqrAnalisisChart = class(TQuickRep)
    DetailBand1: TQRBand;
    QRChart2: TQRChart;
    QRDBChart2: TQRDBChart;
    Series3: TLineSeries;
    Series4: TLineSeries;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
  public
    procedure Preparar(Lista1: TStrings;Lista2: TStrings);
  end;

var
  qrAnalisisChart: TqrAnalisisChart;

implementation

uses
  unVisualizador;

{$R *.DFM}

procedure TqrAnalisisChart.Preparar(Lista1: TStrings;Lista2: TStrings);
var
  iloop: Integer;
  Inicial: Integer;
  X: Array[0..7] of Double;
  Y: Array[0..7] of Double;
  a, b: Extended;
  CantElementos: Integer;
  X1, Y1: Extended;

  procedure FitLineal(var a: Extended; var b: Extended);
  var
    AtL: Array[0..1] of Extended;      //A transpuesta por L (termino independiente de AX=L)
    AtAi: Array[0..1, 0..1] of Extended; //inversa de A transpuesta por A
    Determinante: Extended;
    Valor: Extended;
    iloop2: Integer;
  begin
    //Genero la matriz At.A
    // A11  A12
    // A21  A22
{
    AtA[0,0] := SumOfSquares(X); // A11
    AtA[1,0] := SUM(X); //A12
    AtA[0,1] := SUM(X); //A21
    AtA[1,1] := High(X)+1; //A22
    //Genero la inversa de la At*A
    Determinante := AtA[0,0]*AtA[1,1]-AtA[0,1]*AtA[0,1]; //A11*A22-A12^2
}
    AtAi[0, 0] := (High(X) + 1); // A11
    Valor := 0;
    for iloop2 := 0 to High(X) do
      Valor := Valor + X[iloop2];
    AtAi[1, 0] := -Valor; //A12
    AtAi[0, 1] := -Valor; //A21
    Valor := 0;
    for iloop2 := 0 to High(X) do
      Valor := Valor + X[iloop2] * X[iloop2];
    AtAi[1, 1] := Valor; //A22
    Determinante := AtAi[0, 0] * AtAi[1, 1] - AtAi[0, 1] * AtAi[0, 1]; //A11*A22-A12^2

    //Vector columna
    Valor := 0;
    for iloop2 := 0 to High(Y) do
      Valor := Valor + Y[iloop2] * X[iloop2];
    AtL[0] := Valor;

    Valor := 0;
    for iloop2 := 0 to High(Y) do
      Valor := Valor + Y[iloop2];
    AtL[1] := Valor;
    //Genero la solucion del problema
    //[a, b] = inversa(AtA)*AtL
    a := (AtAi[0, 0] * AtL[0] + AtAi[1, 0] * AtL[1])/Determinante;
    b := (AtAi[0, 1] * AtL[0] + AtAi[1, 1] * AtL[1])/Determinante;
  end;

begin
  Inicial := 1996;
  CantElementos := Lista1.Count - 3; {El último año no debe salir en el gráfico...}
  //Primer Grafico
  with QRDBChart1.Series[0] do
  begin
    for iloop := 1 to CantElementos  do
      AddXY(Inicial + iloop - 1, StrToFloat(Lista1.Strings[iloop]), '', clRed);
    Title := 'Tasa de Inicidencia Anual';
  end;

  //Busco la recta que mejor ajusta al conjunto de puntos aplicando cuadrados minimos
  for iloop := 0 to CantElementos - 1 do
  begin
    // genero los vectores con los elementos
    X[iloop] := iloop;
    Y[iloop] := StrToFloat(Lista1.Strings[iloop + 1]);
  end;
  a := 0;
  b := 0;
  FitLineal(a, b);

  with QRDBChart1.Series[1] do
  begin
    //Primer punto
    for iloop := 0 to CantElementos - 1 do
    begin
       X1 := Inicial + iloop;
       Y1 := a * iloop + b;
      AddXY(X1, Y1, '', clYellow);
    end;

    //Punto final
    SeriesColor := clYellow;
    Title := 'Tendencia(Ajuste Lineal por Cuadrados Mínimos)';
  end;

  //Segundo Grafico
  with QRDBChart2.Series[0] do
  begin
    for iloop := 1 to CantElementos  do
      AddXY(Inicial + iloop - 1, StrToFloat(Lista2.Strings[iloop]), '', clRed);
    Title := 'Costo Siniestral Anual';
  end;

  for iloop := 0 to CantElementos - 1 do
  begin
   //genero los vectores con los elementos
    X[iloop] := iloop;
    Y[iloop] := StrToFloat(Lista2.Strings[iloop + 1]);
  end;
  FitLineal(a, b);

  with QRDBChart2.Series[1] do
  begin
    for iloop := 0 to CantElementos - 1 do
    begin
       X1 := Inicial + iloop;
       Y1 := a * iloop + b;
      AddXY(X1, Y1, '', clYellow);
    end;
    SeriesColor := clYellow;
    Title := 'Tendencia(Ajuste Lineal por Cuadrados Mínimos)';
  end;

  try
    Visualizar(Self, GetValores('Tasa de Incidencia / Costo Siniestral'), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie,
               oForceDB, oForceShowModal]);
  except
    //
  end;
end;

end.
