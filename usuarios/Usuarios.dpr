program Usuarios;

uses
  OneInstance,
  Forms,
  Controls,
  Windows,
  unCustomDataModule in '..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unfraUsuarios in '..\Comunes\FRAMES\unfraUsuarios.pas' {fraUsuario: TFrame},
  unManUsuarios in 'unManUsuarios.pas' {frmManUsuarios},
  unfraSectores in '..\Comunes\FRAMES\unfraSectores.pas' {fraSectores: TFrame},
  unfraPerfiles in '..\Comunes\FRAMES\unfraPerfiles.pas' {fraPerfiles: TFrame},
  unfraUsuDatos in 'unfraUsuDatos.pas' {fraUsuDatos: TFrame},
  unPermisosUsuario in 'unPermisosUsuario.pas' {frmPermisosUsuario},
  unPermisosControl in 'unPermisosControl.pas' {frmPermisosControl},
  unManPerfiles in 'unManPerfiles.pas' {frmManPerfiles},
  unManSectores in 'unManSectores.pas' {frmManSectores},
  unArtFrame in '..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\Comunes\REPOSIT\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\Comunes\REPOSIT\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unCustomConsulta in '..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta},
  unCustomGridABM in '..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM},
  unCustomGridABMDetalle in '..\comunes\reposit\unCustomGridABMDetalle.pas' {frmCustomGridABMDetalle},
  unManCHG_HECHOGENERADORMAIL in '..\comunes\forms\unManCHG_HECHOGENERADORMAIL.pas' {frmManCHG_HECHOGENERADORMAIL},
  unCustomForm in '..\comunes\unCustomForm.pas' {frmCustomForm},
  unCustomPanelABM in '..\comunes\reposit\unCustomPanelABM.pas' {frmCustomPanelABM: TFSForm},
  unDebug in '..\comunes\unDebug.pas' {frmDebug},
  unManCUS_USUARIOSECTOR in '..\comunes\forms\unManCUS_USUARIOSECTOR.pas' {frmManCUS_USUARIOSECTOR: TFSForm},
  unSesion in '..\..\Comunes\unSesion.pas',
  General in '..\..\Comunes\General.pas',
  VCLExtra in '..\..\Comunes\VCLExtra.pas',
  unGrids in '..\..\Comunes\ungrids.pas',
  unArt in '..\..\Comunes\unArt.pas',
  AnsiSql in '..\..\Comunes\AnsiSql.pas',
  SqlFuncs in '..\..\Comunes\SqlFuncs.pas',
  unConsultaUsuariosExternos in '..\registrohoras\unConsultaUsuariosExternos.pas' {frmConsultaUsuariosExternos: TFSForm},
  unPerfilesDigitalizacion in 'unPerfilesDigitalizacion.pas' {frmPerfilesDigitalizacion: TFSForm},
  CustomDlgs in '..\..\Comunes\CustomDlgs.pas',
  unFraStaticCodigoDescripcion in '..\comunes\frames\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unfraFFO_FAXFORMULARIO in '..\fax\faxclient_new\frames\unfraFFO_FAXFORMULARIO.pas' {fraFFO_FAXFORMULARIO: TFrame},
  unManFFO_FAXFORMULARIO in '..\fax\faxclient_new\unManFFO_FAXFORMULARIO.pas' {frmManFFO_FAXFORMULARIO: TFSForm},
  unManFFU_FORMULARIOUSUARIO in '..\fax\faxclient_new\unManFFU_FORMULARIOUSUARIO.pas' {frmManFFU_FORMULARIOUSUARIO: TFSForm},
  unFraCodigoDescripcion in '..\comunes\frames\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unFraUsuario in '..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unConsulta in '..\comunes\forms\unConsulta.pas' {frmConsulta: TFSForm},
  unManCNO_NOVEDADES in '..\comunes\forms\unManCNO_NOVEDADES.pas' {frmManCNO_NOVEDADES: TFSForm},
  unManCEJ_EJECUTABLE in '..\comunes\forms\unManCEJ_EJECUTABLE.pas' {frmManCEJ_EJECUTABLE: TFSForm},
  unFraCodDesc in '..\comunes\frames\nuevos\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unPerfilesFax in 'unPerfilesFax.pas' {frmPerfilesFax: TFSForm},
  unExportPDF in '..\..\Comunes\unExportPDF.pas',
  unComunes in '..\..\Comunes\uncomunes.pas';

{$R *.RES}

begin
  OnlyOneInstance ;
  Application.Initialize;
  Application.Title := 'Administración de Usuarios';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  if dmPrincipal.sdbPrincipal.Connected then
  begin
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
 end;
end.
