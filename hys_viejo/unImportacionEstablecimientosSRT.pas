unit unImportacionEstablecimientosSRT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ComCtrls, StdCtrls, Mask, ToolEdit, ImgList,
  XPMenu, Placemnt, unDmPrincipal, DB, SDEngine;

type
  TLineaDomicilioDeExplotasion = record
    Cuit : String;
    CodMovimiento : String;
    TipoExterno : String;
    Calle : String;
    NumeroPuerta : String;
    Torre : String;
    Bloque : String;
    Piso : String;
    Departamento : String;
    CodigoPostal : String;
    Localidad : String;
    Provincia :String;
    Sucursal : String;
    Actividad : String;
    FechaHoraMovimiento : TDateTime;
    HoraMovimiento : String;
  end;

  TfrmImportacionEstablecimientosSRT = class(TfrmCustomForm)
    lbArchivoOrigen: TLabel;
    btnImportar: TButton;
    edOrigen: TFilenameEdit;
    btnCancelar: TButton;
    StatusBar: TStatusBar;
    procedure btnImportarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    function ParsearDomicilioDeExplotasion(ALinea: String): TLineaDomicilioDeExplotasion;
    procedure InsertarEstablecimientoSRT(aLinea: TLineaDomiciliodeExplotasion);
    function GetFechaParseada(aFecha: string; Delimiter: boolean = true): TDateTime;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmImportacionEstablecimientosSRT: TfrmImportacionEstablecimientosSRT;

implementation

uses
  AnsiSql;

{$R *.dfm}

procedure TfrmImportacionEstablecimientosSRT.btnImportarClick(
  Sender: TObject);
var
  NombreArchivoProceso : String;
  Archivo: TextFile;
  Linea: string;
begin
  NombreArchivoProceso := edOrigen.FileName;
  AssignFile(Archivo, NombreArchivoProceso);
  Reset( Archivo );
  readln( Archivo, Linea );
  BeginTrans(true);

  try
    try
      while (not Eof(Archivo)) do
      begin
        InsertarEstablecimientoSRT(ParsearDomicilioDeExplotasion(Linea));
        readln( Archivo, Linea );
      end;
      CommitTrans(true);
    except
      on E: Exception do
      begin
        Rollback(true);
        raise Exception.Create( E.Message);
        CloseFile(Archivo);
      end;
    end
  finally
    if FileExists(NombreArchivoProceso) then
    begin
      CloseFile(Archivo);
    end;
  end;
end;

procedure TfrmImportacionEstablecimientosSRT.InsertarEstablecimientoSRT(aLinea: TLineaDomiciliodeExplotasion);
begin
  EjecutarSqlST(
    ' INSERT INTO hys.hes_establecimientosrt '+
    '        (es_id, es_cuit, es_codigodemovimiento, es_tipoexterno, es_calle, es_numeropuerta, es_torre, '+
    '         es_bloque, es_piso, es_departamento, es_codigopostal, es_localidad, es_provincia, es_sucursal, es_actividad, '+
    '         es_fechahoramovimiento, es_areareservada, es_horamovimiento) '+
    ' VALUES (hys.seq_hes_estsrt_id.nextval,'+ SqlValue(aLinea.Cuit)+','+ SqlValue(aLinea.CodMovimiento)+','+
      SqlValue(aLinea.TipoExterno)+','+ SqlValue(aLinea.Calle)+','+ SqlValue(aLinea.NumeroPuerta) +','+
      SqlValue(aLinea.Torre)+','+SqlValue(aLinea.Bloque)+','+SqlValue(aLinea.Piso)+','+
      SqlValue(aLinea.Departamento)+','+SqlValue(aLinea.CodigoPostal)+','+SqlValue(aLinea.Localidad)+','+
      SqlValue(aLinea.Provincia)+','+SqlValue(aLinea.Sucursal)+','+ SqlValue(aLinea.Actividad)+','+
      SqlDate(aLinea.FechaHoraMovimiento)+', NULL, '+ SqlValue(aLinea.HoraMovimiento)+')');
end;


function TfrmImportacionEstablecimientosSRT.ParsearDomicilioDeExplotasion(ALinea : String) : TLineaDomicilioDeExplotasion;
begin
  with result do
  begin
    Cuit := Trim(copy(Alinea, 1,  11));
    CodMovimiento := Trim(copy(Alinea, 12, 2));
    TipoExterno := Trim(copy(Alinea, 14, 1));
    Calle := Trim(copy(Alinea, 15, 60));
    NumeroPuerta := Trim(copy(Alinea, 75, 6));
    Torre := Trim(copy(Alinea, 81, 5));
    Bloque := Trim(copy(Alinea, 86, 5));
    Piso := Trim(copy(Alinea, 91, 5));
    Departamento := Trim(copy(Alinea, 96, 5));
    CodigoPostal := Trim(copy(Alinea, 101, 8));
    Localidad := Trim(copy(Alinea, 109, 60));
    Provincia := Trim(copy(Alinea, 169, 2));
    Sucursal := Trim(copy(Alinea, 171, 5));
    Actividad := Trim(copy(Alinea, 176, 6));
    if (Trim(copy(Alinea, 182,  10)) = '9999-12-31') or (Trim(copy(Alinea, 182,  10)) = '0001-01-01') then
      FechaHoraMovimiento := 0
    else
      FechaHoraMovimiento:= GetFechaParseada(Trim(copy(Alinea, 182,  10)));
    HoraMovimiento := Trim(copy(Alinea, 193, 8));
  end;
end;

function TfrmImportacionEstablecimientosSRT.GetFechaParseada(aFecha: string; Delimiter: boolean): TDateTime;
begin
  try
    if Delimiter then
      result := EncodeDate(StrtoInt(copy(aFecha,1,4)),
                           StrtoInt(copy(aFecha,6,2)),
                           StrtoInt(copy(aFecha,9,2)))
    else
      result := EncodeDate(StrtoInt(copy(aFecha,1,4)),
                           StrtoInt(copy(aFecha,5,2)),
                           StrtoInt(copy(aFecha,7,2)));
  except
    result := 0;
  end;
end;

procedure TfrmImportacionEstablecimientosSRT.btnCancelarClick(
  Sender: TObject);
begin
  Close;
end;

end.
