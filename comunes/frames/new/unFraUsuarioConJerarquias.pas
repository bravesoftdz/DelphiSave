unit unFraUsuarioConJerarquias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodDesc, unPropiedadesFrame, DB, SDEngine, PatternEdit,
  StdCtrls, Mask, ToolEdit, ArtComboBox, RxToolEdit;

type
  TModoUsuario = (muTodos, muDependientes);

  TfraUsuarioConJerarquias = class(TfraCodDesc)
  private
    FModoUsuario: TModoUsuario;
    procedure SetModoUsuario(const Value: TModoUsuario);
    function GetTieneUsuariosACargo: Boolean;
    function GetIdSector: Integer;
  public
    property IdSector: Integer read GetIdSector;
    property ModoUsuario: TModoUsuario read FModoUsuario write SetModoUsuario;
    property TieneUsuariosACargo: Boolean read GetTieneUsuariosACargo;
  end;

var
  fraUsuarioConJerarquias: TfraUsuarioConJerarquias;

implementation

uses
  unDmPrincipal, unSesion, unFraCodigoDescripcion, unArt;

{$R *.dfm}

function TfraUsuarioConJerarquias.GetIdSector: Integer;
begin
  if IsSelected and sdqDatos.Active and (not sdqDatos.IsEmpty) and Assigned(sdqDatos.FindField('se_idsector')) then
    Result := sdqDatos.FieldByName('se_idsector').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraUsuarioConJerarquias.GetTieneUsuariosACargo: Boolean;
begin
  Result := ValorSQL('SELECT count(*) FROM agenda.tmp_usuarios_dependientes') > 1;
end;

procedure TfraUsuarioConJerarquias.SetModoUsuario(const Value: TModoUsuario);
begin
  FModoUsuario := Value;

  if FModoUsuario = muDependientes then
  begin
    EjecutarStoreSTEx('art.agenda_pkg.do_usudependientesconperfil(:id);', [Sesion.ID]);

    TableName := 'agenda.tmp_usuarios_dependientes';
    FieldDesc := 'mp_nombre';
    FieldID := 'mp_id';
    FieldCodigo := 'mp_usuario';
    FieldBaja := 'mp_fechabaja';
    CaseSensitive := false;
  end else
  if FModoUsuario = muTodos then
  begin
    TableName := 'art.use_usuarios';
    FieldDesc := 'se_nombre';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldBaja := 'se_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
end;

end.
