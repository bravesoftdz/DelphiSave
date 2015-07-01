unit unArchivoVisor;

interface

uses
  unSeleccionDestinatarios, unMoldeEnvioMail, unVisor, unVisorPDF, unVisorExcel;

type
  TTipoArchivoVisor = (tvNone, tvPDF, tvExcel);

function AbrirArchivoVisor(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False;AImprimeSolo : Boolean = False): Boolean;
{$IFNDEF SERVICE}
function AbrirArchivoVisorMail(AFileName, sAddresses, sSubject: String;
                               Opciones: TOpcionesEnvioMail;
                               sBody: String = 'Provincia ART';
                               nContrato: Integer = 0;
                               iWaitingProgress: Integer = 2500;
                               iIdOrigenGeneracion: Integer = -1;
                               OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                               APermiteGuardarCopia: Boolean = False): Boolean;
{$ENDIF}

implementation

uses
  Windows, Forms, ArchFuncs, ShellAPI, Controls, unEspera;

function FormatoArchivoToTipoVisor(Archivo: String): TTipoArchivoVisor;
var
  sFormato: String;
begin
  sFormato := GetFormatoArchivo(Archivo);

  {$IFNDEF AGENDA_SIC}
  if sFormato = 'PDF' then
    Result := tvPDF
  else if (sFormato = 'XLS') or (sFormato = 'XLSX') then
    Result := tvExcel
  else
  {$ENDIF}
    Result := tvNone;
end;

procedure CrearArchivoVisor(TipoArchivoVisor: TTipoArchivoVisor);
begin
//  IniciarEspera('Abriendo visor...');
  try
    case TipoArchivoVisor of
      tvPDF:   frmVisor := TfrmVisor.CrearVisor(TfrmVisorPDF, True);
      tvExcel: frmVisor := TfrmVisor.CrearVisor(TfrmVisorExcel, False);
    end;
  finally
//    DetenerEspera;
  end;

  if Assigned(frmVisor) then
    frmVisor.BringToFront;
end;

function AbrirArchivoVisor(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False; AImprimeSolo : Boolean = False): Boolean;
var
  TipoArchivoVisor: TTipoArchivoVisor;
  oldCursor: TCursor;
begin
  TipoArchivoVisor := FormatoArchivoToTipoVisor(AFileName);

  if TipoArchivoVisor = tvNone then
    Result := (ShellExecute(Application.Handle, nil, PChar(AFileName), '', '', SW_SHOWNORMAL) > 32)
  else
    begin
      CrearArchivoVisor(TipoArchivoVisor);
      //IniciarEspera('Cargando el archivo...');
      oldCursor := Screen.Cursor;
      Screen.Cursor := crSQLWait;
      try
        Result := AbrirVisor(AFileName, APermiteEnvioMail, APermiteGuardarCopia, AImprimeSolo);
      finally
        Screen.Cursor := oldCursor;
        //DetenerEspera;
      end;
      if Assigned(frmVisor) then
        frmVisor.BringToFront;
    end;
end;

{$IFNDEF SERVICE}
function AbrirArchivoVisorMail(AFileName, sAddresses, sSubject: String;
                               Opciones: TOpcionesEnvioMail;
                               sBody: String = 'Provincia ART';
                               nContrato: Integer = 0;
                               iWaitingProgress: Integer = 2500;
                               iIdOrigenGeneracion: Integer = -1;
                               OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                               APermiteGuardarCopia: Boolean = False): Boolean;
var
  TipoArchivoVisor: TTipoArchivoVisor;
begin
  TipoArchivoVisor := FormatoArchivoToTipoVisor(AFileName);

  if TipoArchivoVisor = tvNone then
    Result := (ShellExecute(Application.Handle, nil, PChar(AFileName), '', '', SW_SHOWNORMAL) > 32)
  else
    begin
      CrearArchivoVisor(TipoArchivoVisor);
      Result := AbrirVisorMail(AFileName, sAddresses, sSubject, Opciones, sBody, nContrato, iWaitingProgress, iIdOrigenGeneracion, OpcTipoDestinatarios, APermiteGuardarCopia);
    end;
end;
{$ENDIF}

end.

