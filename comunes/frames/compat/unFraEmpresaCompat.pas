
{********************************************************}
{                                                        }
{    Frame de Empresas para Compatibilidad con los       }
{    sistemas Viejos.                                    }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 12/2003                                      }
{                                                        }
{********************************************************}

unit unFraEmpresaCompat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraEmpresa, Db, SDEngine, ToolEdit, ArtComboBox, PatternEdit, IntEdit,
  StdCtrls, Mask;

type
  TfraEmpresaCompat = class(TfraEmpresa)
    lbCUIT: TLabel;
  private
  public
    procedure Limpiar;
    function Cargar(ACuit: string; ShowError: Boolean = False): Boolean; overload;// Retorna True si se encontro la empresa
    function Cargar(AContrato: Integer; ShowError: Boolean = False) : Boolean; overload;// Retorna True si se encontro la empresa
  end;

implementation

{$R *.DFM}

{ TfraEmpresaCompat }

function TfraEmpresaCompat.Cargar(ACuit: string; ShowError: Boolean): Boolean;
begin
  Value := ACuit;
  Result := Value = ACuit;
end;

function TfraEmpresaCompat.Cargar(AContrato: Integer; ShowError: Boolean): Boolean;
begin
  Contrato := AContrato;
  Result := Contrato = AContrato;
end;

procedure TfraEmpresaCompat.Limpiar;
begin
  Clear;
end;

end.
