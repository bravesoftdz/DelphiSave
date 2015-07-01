program Portal;

uses
  SysUtils,
  Forms,
  Dialogs,
  Windows,
  IniFiles,
  unDmPrincipal in '..\Comunes\Oracle\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unCustomPanelABM in '..\Comunes\REPOSIT\unCustomPanelABM.pas' {frmCustomPanelABM},
  unCustomDataModule in '..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unUtilsPortal in 'unUtilsPortal.pas',
  LogFile in '..\..\Comunes\LogFile.pas',
  unFrmCambioEjecutables in 'unFrmCambioEjecutables.pas' {FormCambioEjecutable},
  unFrmSplash in 'unFrmSplash.pas' {frmSplash},
  unArtFrame in '..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unFraCodigoDescripcion in '..\Comunes\FRAMES\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unfraCodigoDescripcionExt in '..\Comunes\FRAMES\unfraCodigoDescripcionExt.pas' {fraCodigoDescripcionExt: TFrame},
  frmOpciones in 'frmOpciones.pas' {FormOpciones},
  OneInstance in '..\..\comunes\OneInstance.pas',
  ParamFuncs in '..\..\comunes\ParamFuncs.pas',
  ArchFuncs in '..\..\comunes\ArchFuncs.pas',
  unDmPortal in 'unDmPortal.pas' {dmPortal: TDataModule},
  unArtDBAwareFrame in '..\comunes\reposit\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\comunes\reposit\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unDebug in '..\comunes\unDebug.pas' {frmDebug},
  uncomunes in '..\..\Comunes\uncomunes.pas',
  General in '..\..\Comunes\General.pas',
  unEspera in '..\comunes\forms\unEspera.pas' {frmEspera},
  unDirUtils in '..\..\comunes\unDirUtils.pas',
  unSesion in '..\..\comunes\unSesion.pas',
  unFraToolbarRTF in '..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unCustomConsulta in '..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta: TFSForm},
  unCustomForm in '..\comunes\unCustomForm.pas' {frmCustomForm},
  unCustomGridABM in '..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM: TFSForm},
  unfraUsuarios in '..\comunes\frames\unfraUsuarios.pas' {fraUsuario: TFrame},
  unFraUsuario in '..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unLibretaDeDirecciones in '..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones: TFSForm},
  unMoldeEnvioMail in '..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unSeleccionDestinatarios in '..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm},
  unFraCodDesc in '..\comunes\frames\nuevos\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unABMTelefonos in '..\comunes\forms\unABMTelefonos.pas' {frmTelefonos},
  unFraTelefono in '..\comunes\frames\new\unFraTelefono.pas' {fraTelefono: TFrame},
  unTelefonosCargaRapida in '..\comunes\forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unContratoContacto in '..\afiliaciones\unContratoContacto.pas' {frmContratoContacto},
  unfraContacto in '..\comunes\frames\unfraContacto.pas' {fraContacto: TFrame},
  unFraStaticCodigoDescripcion in '..\comunes\frames\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\comunes\frames\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  strfuncs in '..\..\comunes\strfuncs.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.RES}

var
  PrevInstHWnd: integer;
  IniFile: TIniFile;
  mensaje : string;
begin
  if InstanceAlreadyRunning('PORTAL') then
  begin
    PrevInstHWnd := FindWindow(nil, APP_TITLE);

    IniFile := TIniFile.Create(TempPath + ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
    try
      Inifile.WriteString(INI_SECTION, INI_VALUE_EXE, CommandValue(CMDLINE_EXE));
      Inifile.WriteString(INI_SECTION, INI_VALUE_APLICACION, CommandValue(CMDLINE_APLICACION));
      Inifile.WriteString(INI_SECTION, INI_VALUE_PARAM, CommandValue(CMDLINE_PARAM));

      if PrevInstHWnd <> 0 then
        PostMessage(PrevInstHWnd, CM_RESTORE, 1, 0);

      Application.ProcessMessages;
    finally
      IniFile.Free;
      Halt;
    end;
  end;

  Application.Initialize;

  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Update;

  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.Title := 'Explorador de Aplicaciones - Provincia ART';

  try
    Application.CreateForm(TdmPrincipal, dmPrincipal);
  //
    Mensaje := GetGeneralMessage;
    if Trim(mensaje) > '' then //if not IsEmptyString(mensaje) then
    begin
      ShowMessage(mensaje);
      Application.Terminate;
    end;

//    Application.CreateForm(TdmPortal, dmPortal);
//    dmPortal.SetIniSettings( 'DataBase', dmPrincipal.sdbPrincipal );
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
  except
    Application.Terminate;
  end;
  frmSplash.Free;
  Application.Run;
end.
