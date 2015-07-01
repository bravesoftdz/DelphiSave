unit unQREndosoBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Quickrpt;

type
  TqrEndosoBase = class(TQuickRep)
    sdqQuery: TSDQuery;
  private
    FAporteSRT: Extended;
    FExportToPDF: Boolean;
    FFormato: Integer;
    FHipoAcusia: Extended;
    FIdEndoso: Integer;
    FImprimeMembrete: Boolean;
    FNombreArchivo: String;

    procedure SetExportToPDF(const Value: Boolean);
    procedure SetNombreArchivo(const Value: String);
  protected
    FArea: String;
    FOrderBy: String;

    function GetSql: String; virtual;

    procedure CargarControles; virtual;
  public
    procedure Preparar(const aCantCopias: Integer; const aImprimir: Boolean = False; const aPdfFileName: String = ''; const aMostrarEspera : boolean = True);

    property AporteSRT: Extended      read FAporteSRT       write FAporteSRT;
    property Area: String                                   write FArea;
    property ExportToPDF: Boolean     read FExportToPDF     write SetExportToPDF;
    property Formato: Integer         read fFormato         write fFormato;
    property HipoAcusia: Extended     read FHipoAcusia      write FHipoAcusia;
    property IdEndoso: Integer        read FIdEndoso        write FIdEndoso;
    property ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
    property NombreArchivo: String    read FNombreArchivo   write SetNombreArchivo;

  end;

var
  qrEndosoBase: TqrEndosoBase;

implementation

uses
  unDmPrincipal, unExportPDF;

{$R *.DFM}

{ TqrEndosoBase }

procedure TqrEndosoBase.CargarControles;
var
  sSql: String;
begin
  //Esta rutina sirve para que las heredadas puedan
  //usar los campos en la base de datos antes de que se muestre el report
  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''HIPOACUSIA''';
  FHipoAcusia := ValorSqlExtended(sSql, 0);

  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''APORTESRT''';
  FAporteSRT := ValorSqlExtended(sSql, 0);
end;

function TqrEndosoBase.GetSql: String;
begin
  Result := '';
end;

procedure TqrEndosoBase.Preparar(const aCantCopias: Integer; const aImprimir: Boolean = False; const aPdfFileName: String = ''; const aMostrarEspera : boolean = True);
var
  sSql: String;
begin
  FExportToPDF   := False;
  FNombreArchivo := '';
  FOrderBy       := '';

  sSql := GetSql + ' AND en_id = ' + IntToStr(FIdEndoso);
  if FOrderBy <> '' then
    sSql := sSql + 'ORDER BY ' + FOrderBy;

  OpenQuery(sdqQuery, sSql, True);
  PrinterSettings.Copies := aCantCopias;

  // Carga los controles..
  CargarControles;

  // Muestra el report..
  if FExportToPDF then
    ExportarPDF(Self, FNombreArchivo)
  else
    if aPdfFileName <> '' then
      FileToPDFSvr(Self, ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera)
    else if aImprimir then
      Print
    else
      PreviewModal;
end;

procedure TqrEndosoBase.SetExportToPDF(const Value: Boolean);
begin
  FExportToPDF := Value;
end;

procedure TqrEndosoBase.SetNombreArchivo(const Value: String);
begin
  FNombreArchivo := Value;
end;

end.
