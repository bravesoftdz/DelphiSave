program srvSQLServer2Ora;

uses
  SvcMgr,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  General in '..\..\..\comunes\General.pas',
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unCustomDataModule in '..\..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\comunes\oracle\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unArt in '..\..\..\Comunes\unArt.pas',
  unCustomConsulta in '..\..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unDmPrincipal_SQLServer in '..\..\comunes\SqlServer\unDmPrincipal_SQLServer.pas' {dmPrincipal_SQLServer: TDataModule},
  SqlServer in '..\..\..\Comunes\SqlServer.pas',
  SqlOracle in '..\..\..\Comunes\SqlOracle.pas',
  unMainService in 'unMainService.pas' {SQLServer2Oracle: TService},
  unMoldeEnvioMail in '..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios},
  unLibretaDeDirecciones in '..\..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones},
  unCustomGridABM in '..\..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM},
  unUsuarios in '..\..\comunes\frames\unUsuarios.pas' {fraUsuario: TfraUsuario},
  unfraUsuario in '..\..\comunes\frames\new\unfraUsuario.pas' {fraUsuario: TfraUsuario},
  unArtFrame in '..\..\comunes\reposit\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\comunes\reposit\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\comunes\reposit\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unCustomDlgRichEdit in '..\..\comunes\reposit\unCustomDlgRichEdit.pas' {frmCustomDlgRichEdit},
  unCustomGridABMDetalle in '..\..\comunes\reposit\unCustomGridABMDetalle.pas' {frmCustomGridABMDetalle: TFSForm},
  unCustomPanelABM in '..\..\comunes\reposit\unCustomPanelABM.pas' {frmCustomPanelABM: TFSForm},
  unCustomSplash in '..\..\comunes\reposit\unCustomSplash.pas' {frmCustomSplash},
  unFraCodigoDescripcion in '..\..\comunes\frames\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unQuickReport in '..\..\..\comunes\unQuickReport.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Conexia - SQLServer to Oracle';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TSQLServer2Oracle, SQLServer2Oracle);
  Application.Run;
end.
