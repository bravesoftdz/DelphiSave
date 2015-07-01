program SQLServer2Ora;

uses
  Forms,
  Windows,
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
  unMoldeEnvioMail in '..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unSesion in '..\..\..\Comunes\unSesion.pas',
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm},
  VCLExtra in '..\..\..\Comunes\VCLExtra.pas',
  unCustomGridABM in '..\..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM: TFSForm},
  unLibretaDeDirecciones in '..\..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones: TFSForm},
  unArtFrame in '..\..\comunes\reposit\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\comunes\reposit\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\comunes\reposit\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unfraUsuarios in '..\..\comunes\frames\unfraUsuarios.pas' {fraUsuario: TFrame},
  unFraCodigoDescripcion in '..\..\comunes\frames\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unFraUsuario in '..\..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unRptCartaDocHeader in '..\..\comunes\reports\unRptCartaDocHeader.pas' {rptCartaDocHeader: TQuickRep},
  unCustomPanelABM in '..\..\comunes\reposit\unCustomPanelABM.pas' {frmCustomPanelABM: TFSForm},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unCapturarCodigoBarras in '..\..\comunes\unCapturarCodigoBarras.pas' {frmCapturarCodigoBarras};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Conexia Sincronization';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
