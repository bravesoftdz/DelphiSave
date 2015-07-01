unit unPlanDePagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, ExtCtrls, Grids, DBGrids, Cuit,
  unArt;

type
  TfrmPlanDePago = class(TForm)
    sdqPlanes: TSDQuery;
    dsPlanes: TDataSource;
    sdqCuotas: TSDQuery;
    dsCuotas: TDataSource;
    sdqDocumentos: TSDQuery;
    dsDocumentos: TDataSource;
    dbgPlanes: TDBGrid;
    dbgCuotas: TDBGrid;
    dbgDocumentos: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    sdqCuotasMes: TFloatField;
    sdqCuotasAmortizacinCuota: TFloatField;
    sdqCuotasIntersCuota: TFloatField;
    sdqCuotasTotalMensual: TFloatField;
    sdqCuotasSaldo: TFloatField;
    sdqCuotasPC_ID: TFloatField;
    procedure sdqPlanesAfterOpen(DataSet: TDataSet);
    procedure sdqCuotasAfterOpen(DataSet: TDataSet);
    procedure sdqDocumentosAfterOpen(DataSet: TDataSet);
    procedure sdqPlanesAfterScroll(DataSet: TDataSet);
    procedure sdqCuotasAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure Execute(AContrato: Integer; IdEstudio: TTableId);
  end;

implementation

uses
  unDmPrincipal, VCLExtra;

{$R *.DFM}

procedure TfrmPlanDePago.sdqPlanesAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgPlanes);
end;

procedure TfrmPlanDePago.sdqCuotasAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgCuotas);
end;

procedure TfrmPlanDePago.sdqDocumentosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgDocumentos);
end;

procedure TfrmPlanDePago.sdqPlanesAfterScroll(DataSet: TDataSet);
var
  NroPlan: Integer;
begin
  NroPlan := sdqPlanes.Fields[0].AsInteger;

  if NroPlan > 0 then
  begin
    sdqCuotas.Close;
    sdqCuotas.ParamByName('pNumero').AsInteger := NroPlan;
    sdqCuotas.Open;
  end
(*
  else
    begin
      sdqCuotas.Close;

      sdqDocumentos.Close;
      sdqDocumentos.ParamByName('pNumero').AsInteger := NroPlan;
      sdqDocumentos.ParamByName('pMes').AsInteger    := -1;
      sdqDocumentos.Open;
    end;
*)
end;

procedure TfrmPlanDePago.sdqCuotasAfterScroll(DataSet: TDataSet);
begin
  sdqDocumentos.Close;
  sdqDocumentos.ParamByName('pc_id').AsInteger := sdqCuotas.fieldbyname('pc_id').AsInteger;
  sdqDocumentos.Open;
end;

procedure TfrmPlanDePago.Execute(AContrato: Integer; IdEstudio: TTableId);
begin
  sdqPlanes.Close;
  sdqPlanes.ParamByName('pContrato').AsInteger := AContrato;
  sdqPlanes.ParamByName('pEstudio').AsInteger  := IdEstudio;
  sdqPlanes.Open;
  ShowModal;
end;

procedure TfrmPlanDePago.FormCreate(Sender: TObject);
begin
  Height := Trunc(Screen.Height * 0.9);
  Width  := Trunc(Screen.Width  * 0.9);
end;

end.
