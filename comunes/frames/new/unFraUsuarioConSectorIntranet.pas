unit unFraUsuarioConSectorIntranet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, DB, SDEngine, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, unFraUsuarioConJerarquias, ExtCtrls,
  ImgList, ComCtrls, ToolWin, unART;

type
  TfraUsuarioConSectorIntranet = class(TArtDbFrame)
    pnlGeneral: TPanel;
    fraUsuarioSeleccionado: TfraUsuarioConJerarquias;
    Label1: TLabel;
    fraSector: TfraCodDesc;
    ToolBarSectores: TToolBar;
    tbArbolSectores: TToolButton;
    ImageListSectores: TImageList;
    Label2: TLabel;
    procedure fraSectorPropiedadesChange(Sender: TObject);
    procedure tbArbolSectoresClick(Sender: TObject);
  private
    AExtraCondition: String;
    
    function GetUsuarios: TStrings;
    function GetMails: TStrings;
  protected
    function GetIsEmpty: Boolean; override;
    function GetValue: TTableID; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    procedure Clear; override;
    property Mails: TStrings read GetMails;
    property Usuarios: TStrings read GetUsuarios;
  end;

var
  fraUsuarioConSectorIntranet: TfraUsuarioConSectorIntranet;

implementation

uses unArbolSectores, AnsiSql, SqlFuncs, unDmPrincipal, Strfuncs;

{$R *.dfm}

procedure TfraUsuarioConSectorIntranet.Clear;
begin
  inherited;
  fraSector.Clear;
  fraUsuarioSeleccionado.Clear;
  fraSectorPropiedadesChange(nil);
end;

procedure TfraUsuarioConSectorIntranet.fraSectorPropiedadesChange(Sender: TObject);
begin
  if IsEmptyString(AExtraCondition) then
    AExtraCondition := fraUsuarioSeleccionado.Propiedades.ExtraCondition;

  inherited;
  if fraSector.IsSelected then
  begin
    if fraUsuarioSeleccionado.IdSector <> StrToIntDef(fraSector.Id, 0) then
      fraUsuarioSeleccionado.Clear;
    fraUsuarioSeleccionado.Propiedades.ExtraCondition := AExtraCondition + ' AND se_idsector = ' + SqlValue(fraSector.ID);
  end else
    fraUsuarioSeleccionado.Propiedades.ExtraCondition := AExtraCondition + ' ';
end;

function TfraUsuarioConSectorIntranet.GetUsuarios: TStrings;
begin
  if fraSector.IsSelected then
    Result := ValoresSqlEx('SELECT se_id FROM art.use_usuarios WHERE se_fechabaja IS NULL AND se_idsector = :idsector', [fraSector.ID])
  else
    Result := nil;
end;

function TfraUsuarioConSectorIntranet.GetValue: TTableID;
begin
  Result := fraUsuarioSeleccionado.Value;
end;

function TfraUsuarioConSectorIntranet.GetIsEmpty: Boolean;
begin
  Result := fraUsuarioSeleccionado.IsEmpty and fraSector.IsEmpty;
end;

procedure TfraUsuarioConSectorIntranet.tbArbolSectoresClick(Sender: TObject);
begin
  inherited;
  with TfrmArbolSectores.Create(Self) do
  try
    MostrarSector(StrToIntDef(fraSector.Id, 0));
    ShowModal;
  finally
    if sdqSectores.Active and (fraSector.Id <> sdqSectores.FieldByName('SE_ID').AsString) then
      fraSector.Codigo := sdqSectores.FieldByName('SE_ID').AsString;
    fraSectorPropiedadesChange(nil);
    Free;
  end;
end;

function TfraUsuarioConSectorIntranet.GetMails: TStrings;
begin
  if fraSector.IsSelected then
    Result := ValoresSqlEx('SELECT se_mail FROM art.use_usuarios WHERE se_idsector = :idsector', [fraSector.ID])
  else
    Result := nil;
end;

constructor TfraUsuarioConSectorIntranet.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfraUsuarioConSectorIntranet.AfterConstruction;
begin
  inherited;
end;

end.
