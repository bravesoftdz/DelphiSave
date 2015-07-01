unit unGeneracionCartasAdmin;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   14-11-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unBaseGeneracionCartas, SDEngine, Db,
  Placemnt, artSeguridad, unArtFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, StdCtrls, RxRichEd,
  unFraToolbarRTF, ExtCtrls, unArtDbFrame, unFraEmpresa, unfraEmpresaDeudora, unArt, unArtDBAwareFrame,
  unFraCodigoDescripcion;

type
  TfrmGeneracionCartasAdmin = class(TfrmBaseGeneracionCartas)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresaDeudora;
    Bevel3: TBevel;
    rbEmpDeudora: TRadioButton;
    rbEmpNormal: TRadioButton;
    procedure FiltroEmpresa(Sender: TObject);
  private
  protected
    procedure DoGuardarCampos; override;
  public
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); override;

  end;

var
  frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin;

implementation

uses
  unCustomDataModule, unDmPrincipal, unPrincipal, VCLExtra, AnsiSql;
  
{$R *.DFM}

{ TfrmGeneracionCartasAdmin }

procedure TfrmGeneracionCartasAdmin.Preparar(AIdCarta: TTableId);
begin
  inherited Preparar(AIdCarta);
  fraEmpresa.ShowBajas := True;
  TransMode := tmBeginEnd;

  if ModoABM = maModificacion then
  begin
    if sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsString <> '' then
    begin
      fraEmpresa.IsDeudora := True;
      rbEmpDeudora.Checked := True;
      fraEmpresa.Value     := sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsInteger;
    end
    else
    begin
      fraEmpresa.IsDeudora := False;
      rbEmpNormal.Checked  := True;
    end;
    VCLExtra.LockControls(gbEmpresa, True);
  end;
end;

procedure TfrmGeneracionCartasAdmin.FiltroEmpresa(Sender: TObject);
begin
  fraEmpresa.IsDeudora := rbEmpDeudora.Checked;
end;

procedure TfrmGeneracionCartasAdmin.DoGuardarCampos;
var
  IDFormulario: String;
begin
  inherited;

  //Especifico
  if ModoABM = maAlta then
  begin
    sdqDatos.FieldByName('CA_MANUAL').AsString := 'S';
    if not fraEmpresa.IsDeudora then
    begin
      IDFormulario := ValorSqlEx('SELECT FO_ID' +
                                  ' FROM ACO_CONTRATO, AFO_FORMULARIO' +
                                 ' WHERE FO_ID = CO_IDFORMULARIO' +
                                   ' AND CO_CONTRATO = :p1', [fraEmpresa.Contrato]);

      sdqDatos.FieldByName('CA_IDENDOSO').AsInteger := ValorSql(SqlSimpleQuery('ART.AFILIACION.GET_ULTENDOSO(' + IDFormulario + ')'));
      sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger := StrToInt(IDFormulario);
    end
    else
      sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsInteger := fraEmpresa.Value;
  end;
end;

end.
