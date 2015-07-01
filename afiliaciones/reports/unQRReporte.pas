unit unQRReporte;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TQRReporte = class(TQuickRep)
    sdqQuery: TSDQuery;
  protected
    FImprimeMembrete: Boolean;
  public
    constructor Create(AOwner: TComponent; const Sentencia: String); reintroduce; virtual;
    destructor Destroy; override;

    procedure SaveToFile(AFileName: TFileName); { By Fede }

    property  ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
  end;


implementation
{$R *.DFM}

uses (*{$ifndef lefe}QRptExport, {$endif}*)unDmPrincipal, Printers;

constructor TQRReporte.Create(AOwner: TComponent; const Sentencia: String);
begin
  inherited Create(AOwner);
  PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  if Trim(Sentencia) <> '' then
  begin
    sdqQuery.SQL.Text := Sentencia;
    OpenQuery(sdqQuery);
  end;
end;

destructor TQRReporte.Destroy;
begin
  sdqQuery.Close;
  inherited;
end;

procedure TQRReporte.SaveToFile(AFileName: TFileName);
begin
(*{$ifndef lefe}
  with TPdfExport.Create( Self ) do
    Try
      Report := Self;
      FileName := AFileName;
      Execute;
    finally
      Free;
    end;
{$endif}*)
end;

end.
