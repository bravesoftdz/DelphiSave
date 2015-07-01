unit unGeneracionCartasAdmin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unBaseGeneracionCartas, SDEngine, Db, Placemnt, artSeguridad, unArtFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, StdCtrls, RxRichEd,
  unFraToolbarRTF, ExtCtrls, unArtDbFrame, unFraEmpresa, unArt, unComunes,
  unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmGeneracionCartasAdmin = class(TfrmBaseGeneracionCartas)
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    procedure btnAceptarClick(Sender: TObject);
  private
  protected
    procedure DoGuardarCampos; override;
    function Validar: Boolean; override;
  public
    IDEmpresa: Integer;
    IDLote: Integer;
    IDEstableci: Integer;
    FCartaGenerada: Boolean;
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); override;
  end;

var
  frmGeneracionCartasAdmin: TfrmGeneracionCartasAdmin;

implementation
Uses
  unCustomDataModule, unDmPrincipal, unPrincipal, VCLExtra, AnsiSql, CustomDlgs,
  unRptCartaDocHeader, unrptCartaDocumento;
{$R *.DFM}

{ TfrmGeneracionCartasAdmin }
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.Preparar(AIdCarta: TTableId);
var
  sSql :String;
begin
  inherited Preparar(AIdCarta);

  TransMode := tmBeginEnd;

  if ModoABM = maAlta then
  begin
    gbEmpresa.Visible := True;
    fraEmpresa.ShowBajas := true;
    fraEmpresa.ExtraCondition := ' AND CO_ESTADO IN (1, 9) ';
    fraEmpresa.Value := IDEmpresa;
  end
  else if ModoABM = maModificacion then
  begin
    fraEmpresa.ShowBajas    := True;
    if (sdqDatos.FieldByName('CA_IDENDOSO').AsInteger > 0) then
    begin
      sSql := 'SELECT en_contrato ' +
               ' FROM aen_endoso ' +
              ' WHERE en_id = ' + SqlInt(sdqDatos.FieldByName('CA_IDENDOSO').AsInteger);
      gbEmpresa.Visible     := True;
      fraEmpresa.Contrato := ValorSqlInteger(sSql);
    end;
    VCLExtra.LockControls(gbEmpresa, True);
  end;

  FCartaGenerada := false;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.DoGuardarCampos;
var
  sSQL,
  IDFormulario: string;
begin
  inherited;
  //Especifico
  if ModoABM = maAlta then
  begin
    sdqDatos.FieldByName('CA_MANUAL').AsString := 'S';

    IDFormulario := ValorSql( 'SELECT fo_id ' +
                               ' FROM aco_contrato, afo_formulario, aem_empresa ' +
                              ' WHERE fo_id = co_idformulario ' +
                                ' AND co_contrato = art.get_vultcontrato(em_cuit) ' +
                                ' AND co_idempresa = em_id ' +
                                ' AND em_cuit = ' + SqlValue(fraEmpresa.CUIT));
    sdqDatos.FieldByName('CA_IDENDOSO').AsInteger := ValorSql( SqlSimpleQuery( 'ART.AFILIACION.GET_ULTENDOSO(' + IDFormulario + ')' ));
    sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger := StrToInt(IDFormulario);

    sSQL := 'INSERT INTO hys.hlc_lotecartadoc ' +
            '            (lc_idcarta, lc_idlote, lc_idestableci, lc_usualta, lc_fechaalta) ' +
            '     VALUES (' +
                          SqlInteger (IdCarta) + ', ' +
                          SqlInteger (IDLote) + ', ' +
                          SqlInteger (IDEstableci) + ', ' +
                          SqlValue (frmPrincipal.DBLogin.UserID) + ', ' +
            '             SYSDATE) ';
    EjecutarSqlST(sSQL);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmGeneracionCartasAdmin.Validar: Boolean;
begin
  inherited Validar;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionCartasAdmin.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoGuardar then
  begin
    FCartaGenerada := true;
    if Sender = btnImprimir then
      DoImprimirCarta(IdCarta, taAreaMedlab, srPreview, TransMode, 1);
  end
end;

end.
