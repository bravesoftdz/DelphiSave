unit unEstadoServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, DB, SDEngine, TeEngine, Series, StdCtrls,
  ExtCtrls, TeeProcs, Chart, DbChart, ImgList, XPMenu, Placemnt, RxPlacemnt;

type
  TfrmEstadoServicios = class(TfrmCustomForm)
    dbcSTAT: TDBChart;
    Panel1: TPanel;
    rgTipo: TRadioGroup;
    Series1: TLineSeries;
    sdqSTAT1: TSDQuery;
    sdqSTAT1FECHA_HORA: TStringField;
    sdqSTAT1TIMELINE: TDateTimeField;
    sdqSTAT1GENERADOS: TFloatField;
    sdqSTAT1ENVIADOS: TFloatField;
    Series2: TLineSeries;
    sdqSTAT2: TSDQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    Series3: TLineSeries;
    Series4: TLineSeries;
    sdqSTAT3: TSDQuery;
    StringField2: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    Series5: TLineSeries;
    Series6: TLineSeries;
    sdqSTAT4: TSDQuery;
    StringField3: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    Series7: TLineSeries;
    Series8: TLineSeries;
    procedure rgTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmEstadoServicios: TfrmEstadoServicios;

implementation

uses unDmPrincipal;

{$R *.dfm}

procedure TfrmEstadoServicios.rgTipoClick(Sender: TObject);
var
  sdqAux: TObject;
  i: Integer;
begin
  dbcSTAT.RemoveAllSeries;
  for i := 1 to 10 do
  begin
    sdqAux := FindComponent('sdqSTAT' + IntToStr(i));
    if Assigned(sdqAux) and sdqAux.InheritsFrom(TSDQuery) then
      TSDQuery(sdqAux).Close;
  end;

  sdqAux := FindComponent('sdqSTAT' + IntToStr(rgTipo.ItemIndex + 1));
  if Assigned(sdqAux) and sdqAux.InheritsFrom(TSDQuery) then
    OpenQuery(TSDQuery(sdqAux));

  case rgTipo.ItemIndex of
    0: begin
         dbcSTAT.AddSeries(Series1);
         dbcSTAT.AddSeries(Series2);
       end;
    1: begin
         dbcSTAT.AddSeries(Series3);
         dbcSTAT.AddSeries(Series4);
       end;
    2: begin
         dbcSTAT.AddSeries(Series5);
         dbcSTAT.AddSeries(Series6);
       end;
    3: begin
         dbcSTAT.AddSeries(Series7);
         dbcSTAT.AddSeries(Series8);
       end;
  end;
end;

procedure TfrmEstadoServicios.FormCreate(Sender: TObject);
begin
  inherited;
  dbcSTAT.RemoveAllSeries;
end;

end.
