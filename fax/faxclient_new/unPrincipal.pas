
{********************************************************}
{                                                        }
{    Sistema de Fax - Menú Principal                     }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unPrincipal;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Placemnt, artSeguridad, Login, artDbLogin, Menus, ComCtrls,
  ActnList, StdCtrls, JvBackgrounds, JvTrayIcon, JvComponent,
  JvCaptionButton, XPMenu, unCustomPrincipal, AdvOfficeHint;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    Consulta1: TMenuItem;
    Mantenimiento1: TMenuItem;
    mnuFaxFormularios: TMenuItem;
    mnuManFFU_FORMULARIOUSUARIO: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actConsFaxesExecute(Sender: TObject);
    procedure ActManFormularioExecute(Sender: TObject);
    procedure ActManFormularioUsuarioExecute(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unCustomConsulta, unConsFax, unManFFO_FAXFORMULARIO,
  unManFFU_FORMULARIOUSUARIO, unCITRIX, General;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  EjecutarSql('INSERT INTO FFO_FAXFORMULARIO ' +
              '(FO_ID, FO_DESCRIPCION, FO_USUALTA) ' +
              'SELECT DISTINCT FE_IDFORMULARIO, ''Formulario Nº '' || FE_IDFORMULARIO, ''AUTO'' ' +
                'FROM FFE_FAXENTRANTES ' +
               'WHERE NOT EXISTS (SELECT 1 ' +
                                   'FROM FFO_FAXFORMULARIO ' +
                                  'WHERE FO_ID = FE_IDFORMULARIO)');
end;

procedure TfrmPrincipal.actConsFaxesExecute(Sender: TObject);
begin
  Abrir(TfrmConsFax, frmConsFax, tmvMDIChild, Consulta1);
end;

procedure TfrmPrincipal.ActManFormularioExecute(Sender: TObject);
begin
  Abrir(TfrmManFFO_FAXFORMULARIO, frmManFFO_FAXFORMULARIO, tmvMDIChild, mnuFaxFormularios);
end;

procedure TfrmPrincipal.ActManFormularioUsuarioExecute(Sender: TObject);
begin
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvMDIChild, mnuManFFU_FORMULARIOUSUARIO);
end;

end.
