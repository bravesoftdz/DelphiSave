unit unAgendaVistaExpediente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unAgendaVistaGenerica, Vcl.ImgList,
  XPMenu, RxPlacemnt, AdvGlowButton, JvExExtCtrls, JvExtComponent, JvPanel,
  unFraTitulo, unFraTrabajador, unFraTrabajadorSiniestro,
  unfraTrabajadorSiniestroAGENDA, unFraEmpresa, unfraEmpresaAGENDA,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, DateComboBox, unFraCodigoDescripcion,
  unFraCodDesc, unfraCPR_PRESTADOR, unfraPrestadorAGENDA, JvgGroupBox,
  Vcl.ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraVistaEventos;

type
  TfrmAgendaVistaExpediente = class(TfrmAgendaVistaGenerica)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoMostrarEventosAgendaExpediente(AIdExpediente: Integer);

var
  frmAgendaVistaExpediente: TfrmAgendaVistaExpediente;

implementation

{$R *.dfm}

uses unDmPrincipal;

procedure DoMostrarEventosAgendaExpediente(AIdExpediente: Integer);
begin
  frmAgendaVistaExpediente := TfrmAgendaVistaExpediente.Create(nil);
  frmAgendaVistaExpediente.DoMostrarEventosAgendaExpediente(AIdExpediente);
  frmAgendaVistaExpediente.ShowModal;
end;

procedure TfrmAgendaVistaExpediente.FormCreate(Sender: TObject);
begin
  inherited;
  edAE_FECHAALTADesde.Clear;
end;

end.
