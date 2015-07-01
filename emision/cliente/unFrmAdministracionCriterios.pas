unit unFrmAdministracionCriterios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCriterios;

type
  TfrmAdministracionCriterio = class(TForm)
    fraAdministracionCriterios: TfraCriterios;
    procedure FormCreate(Sender: TObject);
    procedure fraAdministracionCriteriosAceptarReglaDeVariableClick(
      Sender: TObject);
    procedure fraAdministracionCriteriostbNuevaReglaVariableClick(
      Sender: TObject);
    procedure fraAdministracionCriteriostbEditarReglaParaVariableClick(
      Sender: TObject);
    procedure fraAdministracionCriteriostbEliminarReglaParaVariableClick(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdministracionCriterio: TfrmAdministracionCriterio;

implementation

{$R *.dfm}
{-------------------------------------------------------------------------------------------------------}
procedure TfrmAdministracionCriterio.FormCreate(Sender: TObject);
begin
  fraAdministracionCriterios.Inicializar;
end;
{-------------------------------------------------------------------------------------------------------}
procedure TfrmAdministracionCriterio.fraAdministracionCriteriosAceptarReglaDeVariableClick(
  Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
procedure TfrmAdministracionCriterio.fraAdministracionCriteriostbNuevaReglaVariableClick(
  Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
procedure TfrmAdministracionCriterio.fraAdministracionCriteriostbEditarReglaParaVariableClick(
  Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
procedure TfrmAdministracionCriterio.fraAdministracionCriteriostbEliminarReglaParaVariableClick(
  Sender: TObject);
begin

end;
{-------------------------------------------------------------------------------------------------------}
end.
