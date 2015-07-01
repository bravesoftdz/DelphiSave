(* IMPORTANTE:

1-
En la maquina donde se corra el servicio debe existir la sig. carpeta:
C:\Windows\System32\config\systemprofile\Desktop
sino, da el sig. error:
Microsoft Office Excel cannot access the file.
There are several possible reasons:
� The file name or path does not exist.
� The file is being used by another program.
� The workbook you are trying to save has the same name as a currently open workbook.

2-
Si da el error que dice que "no ten�s una impresora por defecto instalada", entonces ten�s
que asegurarte de iniciar sesi�n con AvisoAutomatico en TU pc y configurarle una impresora

3-
Conversiones Permitidas:
Excel                      -->   PDF
QuicReport                 -->   PDF
PDF                        -->   SinglePage TIFF
TIFF                       -->   SinglePage TIFF
TIFF (single o multi page) -->   PDF     (en este caso es cuando uso CO_TIPODESTINO y TTipoDestino)

4-
En el servidor, tienen que estar instalados:
pdfFactory Pro 3.50 (Impresora PDF)
GhostScript
IrfanView  (para que funcione la parte de conversi�n de TIFF a PDF, como se usa la opci�n de impresi�n del IrfanView,
            hay que abrir cualquier archivo Multi Tiff, e ir a File:Print, y setear lo sig.: Autorotate: Tildado,
            Print Size: Best fit to page (aspect ratio), Multipage Images: Print all pages. Lo dem�s, dejarlo por
            defecto. Y tirar a imprimir para que guarde el seteo previo.)

5-
Para la conversion de TIFF a PDF, en forma local, es decir, en la PC del usuario, instalar como siempre
la impresora pdf: ClienteConversionPDF.
Y setearle, adem�s, en las preferencias de impresi�n, lo siguiente:
  Solapa Metrics:
    Resolution: 600 dpi
  Solapa Graphics:
    Downsample monochrome images to: 300 dpi

Adem�s de esto, hay que:
  a- Agregar al Siart.ini de \\ntdc2\apps$ (es decir, donde se encuentran las aplicaciones del Portal) lo siguiente:

  [ConversionClient]
  Batch=\\ntdc2\apps$

  [ClientPrograms]
  Irfan=C:\Program Files\IrfanView\

  y copiar en \\ntdc2\apps$ el archivo ImagePrint.bat

En la PC del usuario tambi�n:
  b- Instalar el programa IrfanView, que se encuentra en \\ntnas1\instaladores$\Software\IrfranView4.28 (con los par�metros
     que muestra por defecto).

  c- Entrar al IrfanView, abrir cualquier archivo Multi Tiff, ir al men� File:Print, y setear lo siguiente:
     Autorotate: Tildado,
     Print Size: Best fit to page (aspect ratio),
     Multipage Images: Print all pages.

  Lo dem�s, dejarlo por defecto.
  Y tirar a imprimir para que guarde el seteo previo.

*)

program ServicioPDF;

uses
  SvcMgr,
  SysUtils,
  unDmPrincipal in '..\..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  ArchFuncs in '..\..\..\..\Comunes\ArchFuncs.pas',
  IArtMail in '..\..\..\Comunes\IArtMail.pas',
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unSesion in '..\..\..\..\Comunes\unSesion.pas',
  unDirUtils in '..\..\..\..\comunes\unDirUtils.pas',
  Internet in '..\..\..\..\comunes\Internet.pas',
  VCLExtra in '..\..\..\..\comunes\VCLExtra.pas',
  unCustomForm in '..\..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unEspera in '..\..\..\comunes\forms\unEspera.pas' {frmEspera},
  unDebug in '..\..\..\Comunes\unDebug.pas' {frmDebug},
  unCustomDataModule in '..\..\..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unServicioConversion in 'unServicioConversion.pas' {ServicePDF: TService},
  unQuickReport in '..\..\..\..\comunes\unQuickReport.pas',
  unArt in '..\..\..\..\comunes\unArt.pas',
  unExportPDF in '..\..\..\..\comunes\unExportPDF.pas',
  unWinProcess in '..\..\..\..\comunes\unWinProcess.pas',
  unComunesMail in '..\..\..\..\comunes\unComunesMail.pas',
  unImageFunctions in '..\..\..\..\comunes\unImageFunctions.pas',
  General in '..\..\..\..\comunes\General.pas',
  PDFFuncs in '..\..\..\..\comunes\PDFFuncs.pas',
  unExcel in '..\..\..\..\comunes\unExcel.pas',
  Strfuncs in '..\..\..\..\comunes\strfuncs.pas',
  unComunes in '..\..\..\..\comunes\uncomunes.pas',
  unMoldeEnvioMail in '..\..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unFraToolbarRTF in '..\..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unSeleccionDestinatarios in '..\..\..\comunes\unSeleccionDestinatarios.pas',
  unCustomConsulta in '..\..\..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta: TFSForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Servidor de conversi�n de archivos';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  dmPrincipal.sdbPrincipal.Open;
  if dmPrincipal.sdbPrincipal.Connected then
  begin
    Application.CreateForm(TServicePDF, ServicePDF);
    Application.Run;
  end;
end.
