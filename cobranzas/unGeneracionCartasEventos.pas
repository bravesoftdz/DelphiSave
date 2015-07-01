unit unGeneracionCartasEventos;

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
  TfrmGeneracionCartasEventos = class(TfrmBaseGeneracionCartas)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresaDeudora;
  private
    fEvento: String;
    fTextoArea: String;

    procedure SetEvento(const Value: String);
    procedure SetTextoArea(const Value: String);
  protected
    procedure DoGuardarCampos; override;
  public
    property Evento   : String read fEvento    write SetEvento;
    property TextoArea: String read fTextoArea write SetTextoArea;
  end;

var
  frmGeneracionCartasEventos: TfrmGeneracionCartasEventos;

implementation

uses
  VCLExtra, unPrincipal, unDmPrincipal, AnsiSql;
  
{$R *.DFM}

{ TfrmGeneracionCartasEventos }
procedure TfrmGeneracionCartasEventos.DoGuardarCampos;
var
  IDFormulario: String;
begin
  inherited;

  //Especifico
  sdqDatos.FieldByName('CA_MANUAL').AsString := 'N';
  if not fraEmpresa.IsDeudora then
  begin
    IDFormulario := ValorSqlEx('SELECT FO_ID' +
                                ' FROM ACO_CONTRATO, AFO_FORMULARIO' +
                               ' WHERE FO_ID = CO_IDFORMULARIO' +
                                 ' AND CO_CONTRATO = :p1', [fraEmpresa.Contrato]);

    sdqDatos.FieldByName('CA_IDENDOSO').AsInteger     := ValorSql(SqlSimpleQuery('ART.AFILIACION.GET_ULTENDOSO(' + IDFormulario + ')'));
    sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger := StrToInt(IDFormulario);
  end
  else
    sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsInteger := fraEmpresa.Value;
end;

procedure TfrmGeneracionCartasEventos.SetEvento(const Value: String);
var
  Contrato: String;
  EmpDeudora: String;
begin
  if fEvento <> Value then
  begin
    fraEmpresa.ShowBajas := True;
    VCLExtra.LockControls(fraEmpresa, True);
    fEvento    := Value;
    EmpDeudora := ValorSql('SELECT VA_IDEMPDEUDORA' +
                            ' FROM ZVA_VALOR, ZEC_EVENTOCHEQUE' +
                           ' WHERE EC_IDVALOR = VA_ID' +
                             ' AND EC_ID = ' + fEvento);
    if EmpDeudora <> '' then
    begin
      fraEmpresa.IsDeudora := True;
      fraEmpresa.Value     := StrToInt(EmpDeudora);
    end
    else
    begin
      Contrato := ValorSql('SELECT VA_IDCONTRATO' +
                            ' FROM ZVA_VALOR, ZEC_EVENTOCHEQUE' +
                           ' WHERE EC_IDVALOR = VA_ID' +
                             ' AND EC_ID = ' + fEvento, '');
      fraEmpresa.IsDeudora := False;
      if Contrato = '' then
        raise Exception.Create('El valor no tiene ni contrato ni empresa deudora.');
      fraEmpresa.Contrato := StrToInt(Contrato);
    end;
  end;
end;

procedure TfrmGeneracionCartasEventos.SetTextoArea(const Value: String);
begin
  if fTextoArea <> Value then
  begin
    fTextoArea := Value;
    Modulo := ValorSql('SELECT TA_IDAREATEXTO' +
                        ' FROM CTA_TEXTOAREA' +
                       ' WHERE TA_ID = ' + fTextoArea);
    Texto := ValorSql('SELECT TA_IDTEXTOCARTA' +
                       ' FROM CTA_TEXTOAREA' +
                      ' WHERE TA_ID = ' + fTextoArea);
    VCLExtra.LockControls([fraCodigoModulo, fraCodigoCodTexto], True);
  end;
end;

end.
