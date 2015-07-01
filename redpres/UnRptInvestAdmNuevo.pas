unit UnRptInvestAdmNuevo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SinEdit,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, RxRichEd, Buttons, unVisualizador, unfraPrestador,
  DB, SDEngine, uncomunes, unrptcomunes;

type
  TrptInvestAdminNueva = class(TForm)
    QuickRep: TQuickRep;
    QRBand1: TQRBand;
    Memo: TQRMemo;
    edInfoBasica: TRxRichEdit;
    btnVisualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    QRBand2: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    qrmDireccion: TQRMemo;
    qrlFechaImpresion: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNomPrestador: TQRLabel;
    qrlDomPrestador: TQRLabel;
    qrlProvPrestador: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlTelPrestador: TQRLabel;
    qrlFaxPrestador: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    qrlProvEmpresa: TQRLabel;
    qrlDomEmpresa: TQRLabel;
    qrlNomEmpresa: TQRLabel;
    QRLabel15: TQRLabel;
    qrlTelEmpresa: TQRLabel;
    QRLabel17: TQRLabel;
    qrlFaxEmpresa: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlNomTrabajador: TQRLabel;
    qrlDomTrabajador: TQRLabel;
    QRLabel19: TQRLabel;
    qrlProvTrabajador: TQRLabel;
    QRLabel21: TQRLabel;
    qrlTelTrabajador: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlLesion: TQRLabel;
    qrlAccidente: TQRLabel;
    QRLabel23: TQRLabel;
    qrlAutorizacion: TQRLabel;
    QRLabel26: TQRLabel;
    qrlFechaSini: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel24: TQRLabel;
    qrlObservaciones: TQRLabel;
    QRLabel25: TQRLabel;
    qrlAval: TQRLabel;
    QRLabel28: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlCaracter: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    qrlRelaciones: TQRMemo;
    sdqInvestAdmin: TSDQuery;
    qrlAnulado: TQRLabel;
    QRLabel34: TQRLabel;
    qrlFNac: TQRLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Imprimir(idautorizacion: integer);

  private
    Resultado: TResultados;
    FEMail: string;
    FNombre: string;    // Lu TK 5303
    FDni: string;
    FClaveFAX: String;
  public
    fraPrestadorAprob: TfraPrestador;
    function ShowModal: TResultados; reintroduce;

    property EMail    : String  read FEMail    write FEMail;
    property Nombre   : String  read FNombre   write FNombre;
    property Dni      : String  read FDni      write FDni;
    property ClaveFAX : String  read FClaveFAX write FClaveFAX;
  end;

var
  rptInvestAdminNueva: TrptInvestAdminNueva;

implementation

uses unPrincipal, undmprincipal, ansisql, general, strfuncs, unsesion;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TrptInvestAdminNueva.btnVisualizarClick(Sender: TObject);
begin
  Memo.Lines.Text := edInfoBasica.Lines.Text;
  Resultado := Visualizar(QuickRep, GetValores(' - Siniestro: ' + sdqInvestAdmin.fieldbyname('siniestrocomp').AsString + ' - ' + sdqInvestAdmin.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqInvestAdmin.FieldByName('tj_documento').AsString, sdqInvestAdmin.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqInvestAdmin.fieldbyname('siniestrocomp').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqInvestAdmin.FieldByName('ca_fax').AsString {Telefono}, sdqInvestAdmin.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqInvestAdmin.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

  DoActualizarImpresionAutorizacion(sdqInvestAdmin.fieldbyname('au_id').AsInteger, Resultado);
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TrptInvestAdminNueva.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TrptInvestAdminNueva.ShowModal: TResultados;
begin
  inherited ShowModal;
  Result := Resultado;
end;


procedure TrptInvestAdminNueva.Imprimir(idautorizacion: integer);
var Resultado: TResultados; Anulada: boolean;
begin

  sdqInvestAdmin.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqInvestAdmin);

  if (sdqInvestAdmin.FieldByName('AU_ESTADO').AsString = 'U') or (sdqInvestAdmin.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqInvestAdmin.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;

  //fraPrestadorAprob := Self.fraPrestadorAprob;
  EMail             := sdqInvestAdmin.fieldbyname('ca_direlectronica').AsString;
  Nombre            := sdqInvestAdmin.fieldbyname('tj_nombre').AsString;
  Dni               := sdqInvestAdmin.fieldbyname('tj_documento').AsString;
  ClaveFAX          := sdqInvestAdmin.fieldbyname('siniestrocomp').AsString;

  qrmDireccion.Lines.Text  := DomicilioDelegacion(qriLogo.Picture, sdqInvestAdmin.fieldbyname('au_siniestro').AsInteger, sdqInvestAdmin.fieldbyname('ex_id').AsInteger);  // por cambio funcion is_siniestrogobernacion
  qrlNomPrestador.Caption  := InitCap(sdqInvestAdmin.fieldbyname('ca_descripcion').AsString) + '(' + sdqInvestAdmin.fieldbyname('ca_identificador').AsString + ')';
  qrlDomPrestador.Caption  := InitCap(sdqInvestAdmin.fieldbyname('ca_domicilio').AsString + '(' + sdqInvestAdmin.fieldbyname('ca_codpostal').AsString + ') - ' +
                              sdqInvestAdmin.fieldbyname('ca_localidad').AsString);

  if (sdqInvestAdmin.fieldbyname('ca_codpostal').AsString <> '') then
    qrlProvPrestador.Caption := InitCap(ValorSql('SELECT pv_descripcion' +
                                              ' FROM ccp_codigopostal, cpv_provincias' +
                                             ' WHERE cp_provincia = pv_codigo' +
                                               ' AND cp_codigo = ' + sdqInvestAdmin.fieldbyname('ca_codpostal').AsString))
  else
    qrlProvPrestador.Caption := '';

  qrlTelPrestador.Caption  := sdqInvestAdmin.fieldbyname('ca_telefono').AsString;
  qrlFaxPrestador.Caption  := sdqInvestAdmin.fieldbyname('ca_fax').AsString;
  qrlNomEmpresa.Caption    := Initcap(sdqInvestAdmin.FieldByName('em_nombre').AsString);
  qrlDomEmpresa.Caption    := InitCap(sdqInvestAdmin.FieldByName('dc_calle').AsString) + ' ' +
                              sdqInvestAdmin.FieldByName('dc_numero').AsString + ' ' +
                              sdqInvestAdmin.FieldByName('dc_piso').AsString + ' ' +
                              sdqInvestAdmin.FieldByName('dc_departamento').AsString +'(' +
                              sdqInvestAdmin.FieldByName('dc_cpostal').AsString + ') - ' +
                              InitCap(sdqInvestAdmin.FieldByName('dc_localidad').AsString);
  qrlProvEmpresa.Caption   := InitCap(sdqInvestAdmin.FieldByName('pv_descripcion').AsString);
  qrlTelEmpresa.Caption    := sdqInvestAdmin.FieldByName('dc_telefono').AsString;
  qrlFaxEmpresa.Caption    := sdqInvestAdmin.FieldByName('dc_fax').AsString;
  qrlNomTrabajador.Caption := initcap(sdqInvestAdmin.FieldByName('tj_nombre').AsString);
  qrlFNac.Caption          := sdqInvestAdmin.FieldByName('tj_fnacimiento').AsString;
  qrlDomTrabajador.Caption := InitCap(sdqInvestAdmin.FieldByName('TJ_CALLE').AsString) + ' ' +
                              sdqInvestAdmin.FieldByName('TJ_NUMERO').AsString + ' ' +
                              sdqInvestAdmin.FieldByName('TJ_PISO').AsString + ' ' +
                              sdqInvestAdmin.FieldByName('TJ_DEPARTAMENTO').AsString + '(' +
                              sdqInvestAdmin.FieldByName('TJ_CPOSTAL').AsString + ') - ' +
                              InitCap(sdqInvestAdmin.FieldByName('TJ_LOCALIDAD').AsString);
  qrlProvTrabajador.Caption := InitCap(Valorsqlex('select pv_descripcion from art.cpv_provincias where pv_codigo = :cod', [sdqInvestAdmin.FieldByName('TJ_PROVINCIA').AsString]));
  qrlTelTrabajador.Caption  := sdqInvestAdmin.FieldByName('TELEFONO').AsString;
  qrlSiniestro.Caption      := sdqInvestAdmin.fieldbyname('siniestrocomp').AsString;
  qrlAutorizacion.Caption   := sdqInvestAdmin.fieldbyname('au_numauto').AsString;
  qrlFechaSini.Caption      := sdqInvestAdmin.FieldByName('EX_FECHAACCIDENTE').AsString;
  qrlLesion.Caption         := LCase(sdqInvestAdmin.FieldByName('EX_DIAGNOSTICO').Text);
  qrlAccidente.Caption      := LCase(sdqInvestAdmin.FieldByName('EX_BREVEDESCRIPCION').AsString);

  qrlAval.Caption           := initcap(ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                                                   ' FROM cfi_firma ' +
                                                  ' WHERE fi_id = :IdFirma ', [sdqInvestAdmin.FieldByName('AU_AVAL').AsInteger]));
  qrlDocumento.Caption      := InitCap(ValorSqlEx('SELECT UPPER(fi_documento) ' +
                                                   ' FROM cfi_firma ' +
                                                  ' WHERE fi_id = :IdFirma', [sdqInvestAdmin.FieldByName('AU_AVAL').AsInteger]));
  qrlCaracter.Caption       := InitCap(ValorSqlEx('SELECT INITCAP(fi_caracter) ' +
                                                   ' FROM cfi_firma ' +
                                                  ' WHERE fi_id = :IdFirma', [sdqInvestAdmin.FieldByName('AU_AVAL').AsInteger]));

  if sdqInvestAdmin.FieldByName('AU_USUAPRO').AsString = '' then
    qrlUsuario.Caption := initcap(Sesion.Usuario)
  else
    qrlUsuario.Caption := initcap(ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqInvestAdmin.FieldByName('AU_USUAPRO').AsString]));

  qrlObservaciones.Caption  := sdqInvestAdmin.FieldByName('au_observacionesimpresion').asstring;

  qrlPrestacion.Caption := sdqInvestAdmin.FieldByName('on_capitulo').AsString + ' ' +
                           sdqInvestAdmin.FieldByName('on_codigo').AsString + ' ' +
                           sdqInvestAdmin.FieldByName('on_descripcion').AsString;

  qrlRelaciones.Lines.Text  := GetRelaciones(idautorizacion);
  qrlGTrabajo.Caption       := sdqInvestAdmin.FieldByName('gp_nombre').AsString;
  qrlDelegacion.Caption     := sdqInvestAdmin.FieldByName('lg_nombre').AsString;
  qrlFechaImpresion.Caption := LugarImpresion(idautorizacion) + ', ' + DateFormat(GetFechaAprobacion(idautorizacion), 'd ''de'' MMMM ''de'' yyyy');

  Resultado := self.ShowModal;
  //DoActualizarImpresionAutorizacion(sdqInvestAdmin.fieldbyname('au_id').AsInteger, Resultado);

end;

{--------------------------------------------------------------------------------------------------------------------------------}
end.
