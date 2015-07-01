unit unAgendaVistaPrestador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unAgendaVistaGenerica, ImgList, XPMenu, Placemnt, unFraTitulo,
  unFraCodigoDescripcion, unFraCodDesc, StdCtrls, unfraCPR_PRESTADOR,
  unfraPrestadorAGENDA, JvgGroupBox, ExtCtrls, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unfraVistaEventos, unFraEmpresa,
  unfraEmpresaAGENDA, Mask, ToolEdit, DateComboBox, AdvGlowButton,
  JvExExtCtrls, JvComponent, JvPanel;

type
  TfrmAgendaVistaPrestador = class(TfrmAgendaVistaGenerica)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoMostrarEventosAgendaPrestador(AIdPrestador: Integer);

var
  frmAgendaVistaPrestador: TfrmAgendaVistaPrestador;

implementation

uses unSesion;

{$R *.dfm}

procedure DoMostrarEventosAgendaPrestador(AIdPrestador: Integer);
begin
  frmAgendaVistaPrestador := TfrmAgendaVistaPrestador.Create(nil);
  frmAgendaVistaPrestador.DoMostrarEventosAgendaPrestador(AIdPrestador);
  frmAgendaVistaPrestador.ShowModal;
end;

procedure TfrmAgendaVistaPrestador.FormCreate(Sender: TObject);
begin
  inherited;
  fraIDSECTORALTA.Codigo := IntToStr(Sesion.IdSectorIntranet);
end;

end.
