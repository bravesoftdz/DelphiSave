unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPrincipal, AdvOfficeHint, JvBackgrounds, JvTrayIcon,
  JvComponent, JvCaptionButton, artSeguridad, Login, artDbLogin, Menus,
  ImgList, XPMenu, Placemnt, ComCtrls, ExtCtrls;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuPresupuesto: TMenuItem;
    mnuGestionTickets: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuEstadisticas: TMenuItem;
    mnuMotivosDeSolicitud: TMenuItem;
    N3: TMenuItem;
    mnuBanner: TMenuItem;
    tmrNoticias: TTimer;
    mnuEquipos: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuEquiposClick(Sender: TObject);
    procedure mnuBannerClick(Sender: TObject);
    procedure mnuEstadisticasClick(Sender: TObject);
    procedure mnuGestionTicketsClick(Sender: TObject);
    procedure mnuMotivosDeSolicitudClick(Sender: TObject);
    procedure mnuPresupuestoClick(Sender: TObject);
    procedure tmrNoticiasTimer(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  General, unGestionSistemas, unEstadisticas, unManCMS_MOTIVOSOLICITUD,
  unEspera, CustomDlgs, unDmPrincipal, unSesion, unSistemas, unManEquipos;

const
  PANEL_USUARIO  = 0;
  PANEL_NOTICIAS = 1;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  mnuEquipos.Visible := Sesion.Sector = 'COMPUTOS';
  sbEstado.Panels[PANEL_USUARIO].Text := Sesion.Usuario;
  tmrNoticiasTimer(nil);
end;

procedure TfrmPrincipal.mnuEquiposClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManEquipos, frmManEquipos, tmvMDIChild, mnuEquipos);  
end;

procedure TfrmPrincipal.mnuBannerClick(Sender: TObject);
var
  tslTexto: TStringList;
begin
  inherited;
  tslTexto := TStringList.Create;
  try
    if mnuBanner.Tag = 0 then
    begin
      if MsgAsk('¿Desea colocar un banner de noticias ahora?') then
      begin
        if InputMemoBox('Banner de noticias', tslTexto) then
        begin
          if Trim(tslTexto.Text) > '' then
          begin
            EjecutarSQLEx('INSERT INTO COMPUTOS.CBN_BANNERNOTICIAS ' +
                         '(bn_id, bn_descripcion, bn_fechaalta, bn_idusualta, bn_fechafin, bn_idusufin, bn_idsistematicket) ' +
                         'VALUES (0, :DESCRIPCION, SYSDATE, :USER, NULL, NULL, :SISTEMA_TICKET)', [tslTexto.Text, Sesion.Id, GetIdSistemaTicket()]);
            sbEstado.Panels[PANEL_NOTICIAS].Text := tslTexto.Text;
          end else
            InfoHint(sbEstado, 'No se colocó ningún anuncio porque no se especificó el mensaje.');
        end else
          MsgBox('No se colocó ningún anuncio.');
      end;
    end else
    begin
      if MsgAsk('¿Desea remover el banner de noticias ahora?') then
      begin
        EjecutarSQLEx('UPDATE COMPUTOS.CBN_BANNERNOTICIAS ' +
                         'SET BN_FECHAFIN = SYSDATE, ' +
                             'BN_IDUSUFIN = :USUFIN ' +
                       'WHERE BN_FECHAFIN IS NULL ' +
                         'AND BN_IDSISTEMATICKET = :sistemas', [Sesion.Id, GetIdSistemaTicket()]);
        sbEstado.Panels[PANEL_NOTICIAS].Text := '';
      end;
    end;
  finally
    tslTexto.Free;
  end;
end;

procedure TfrmPrincipal.mnuEstadisticasClick(Sender: TObject);
begin
  Abrir(TfrmEstadisticas, frmEstadisticas, tmvMDIChild, mnuEstadisticas);
end;

procedure TfrmPrincipal.mnuGestionTicketsClick(Sender: TObject);
begin
  IniciarEspera('Iniciando el sistema...');
  Application.ProcessMessages;
  try
    Abrir(TfrmGestionSistemas, frmGestionSistemas, tmvMDIChild, mnuGestionTickets);
  finally
    DetenerEspera;
  end;
end;

procedure TfrmPrincipal.mnuMotivosDeSolicitudClick(Sender: TObject);
begin
  Abrir(TfrmManCMS_MOTIVOSOLICITUD, frmManCMS_MOTIVOSOLICITUD, tmvMDIChild, mnuMotivosDeSolicitud);
end;

procedure TfrmPrincipal.mnuPresupuestoClick(Sender: TObject);
begin
  if ExisteSQLEx('SELECT 1 FROM COMPUTOS.CBN_BANNERNOTICIAS WHERE BN_FECHAFIN IS NULL AND BN_IDSISTEMATICKET = :sistemas', [GetIdSistemaTicket()]) then
  begin
    mnuBanner.Caption := 'Remover banner de noticias';
    mnuBanner.Tag := 1;
  end else
  begin
    mnuBanner.Caption := 'Colocar banner de noticias';
    mnuBanner.Tag := 0;
  end;
end;

procedure TfrmPrincipal.tmrNoticiasTimer(Sender: TObject);
begin
  sbEstado.Panels[PANEL_NOTICIAS].Text := ValorSQLEx('SELECT BN_DESCRIPCION ' +
                                                     'FROM COMPUTOS.CBN_BANNERNOTICIAS ' +
                                                    'WHERE BN_FECHAFIN IS NULL ' +
                                                      'AND BN_IDSISTEMATICKET = :sistemas', [GetIdSistemaTicket()], 'Sin novedades', False);
end;

end.
