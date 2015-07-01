unit unEMIGeneracionCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unBaseGeneracionCartas, SDEngine, DB, Placemnt, artSeguridad,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, StdCtrls, RxRichEd, unFraToolbarRTF, ExtCtrls,
  unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, unFraEmpresaSolicitud,
  unDmPrincipal, AnsiSql, unArt, unFraCodigoDescripcion, unRptCartaDocHeader,
  unRptCartaDocumento, unComunes;

type
  TfrmEMIGeneracionCartas = class(TfrmBaseGeneracionCartas)
    pnEmpresa: TPanel;
    Label1: TLabel;
    fraEmpresaCartaDoc: TfraEmpresa;
    fraModoNotificacion: TfraCodigoDescripcion;
    lblModoNotificacion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoGuardarCampos; override;
    function Validar: Boolean; override;
  public
    procedure Preparar(AIdCarta: TTableId = ART_EMPTY_ID); override;
  end;

var
  frmEMIGeneracionCartas: TfrmEMIGeneracionCartas;

implementation

uses
  VclExtra, unCustomDataModule;

{$R *.dfm}

procedure TfrmEMIGeneracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresaCartaDoc.ShowBajas := True;
  TransMode := tmBeginEnd;
  with fraModoNotificacion do
  begin
    TableName   := 'COMUNES.CMN_MODONOTIFICACION';
    FieldID     := 'MN_ID';
    FieldCodigo := 'MN_ID';
    FieldDesc   := 'MN_DESCRIPCION';
    ShowBajas   := False;
  end;
end;

procedure TfrmEMIGeneracionCartas.DoGuardarCampos;
begin
  inherited;
  if ModoABM = maAlta then
  begin
    sdqDatos.FieldByName('CA_IDENDOSO').AsInteger := ValorSql( SqlSimpleQuery( 'art.afiliacion.get_ultidendoso(' + SqlValue(fraEmpresaCartaDoc.Contrato) + ')' ));
  end;
end;


function TfrmEMIGeneracionCartas.Validar: Boolean;
begin
  Verificar((ModoABM = maAlta) and fraEmpresaCartaDoc.IsEmpty, fraEmpresaCartaDoc, 'La empresa es obligatoria.');
  Verificar((ModoABM = maAlta) and fraModoNotificacion.IsEmpty, fraModoNotificacion, 'Debe indicar un modo de notificación del documento.');
  inherited Validar;
  Result := True;
end;

procedure TfrmEMIGeneracionCartas.Preparar(AIdCarta: TTableId);
begin
  inherited;
  fraCtbTablasTipoSalida.Locked := true;
  if (ModoABM = maModificacion) then
  begin
    fraEmpresaCartaDoc.Contrato :=  ValorSqlEx(' SELECT en_contrato ' +
                                               ' FROM aen_endoso ' +
                                               ' WHERE en_id = :idendoso ', [sdqDatos.FieldByName('ca_idendoso').AsInteger]);

    if not (sdqDatos.FieldByName('CA_FECHAIMPRESION').IsNull) then
    begin
      LockControls([fraEmpresaCartaDoc, fraCodigoModulo,
                    fraCodigoCodTexto, fraCodigoCodFirmante,
                    fraCtbTablasCorreo,
                    fraARTs, edObservaciones, edTexto,
                    btnImprimir, btnAceptar], True);
    end;
  end;
end;

procedure TfrmEMIGeneracionCartas.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoGuardar then
    if Sender = btnImprimir then
      DoImprimirCarta(IdCarta, taEmision, srPreview, TransMode);
end;

end.

