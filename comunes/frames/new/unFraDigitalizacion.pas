unit unFraDigitalizacion;

interface

uses
  {$IFDEF VER140}Variants, {$ENDIF} {$IFDEF VER150}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, ComCtrls, JvExComCtrls, JvComCtrls,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc,
  unFraRTD_TIPODOCUMENTO, StdCtrls, SinEdit, unFraTrabajador, unArtDbFrame,
  unFraEmpresa, unFraEstablecimiento, Mask, PatternEdit, IntEdit,
  unfraCtbTablas, unfraVendedores, unfraVendedoresCUIT,
  unfraEntidadCUIT, unfraCPR_PRESTADOR;
                                      
type
  TfraDigitalizacion = class(TArtFrame)
    pgArchivos: TJvPageControl;
    tsSiniestros: TTabSheet;
    tsAfiliaciones: TTabSheet;
    tsHyS: TTabSheet;
    tsMedLab: TTabSheet;
    tsCD: TTabSheet;
    tsPrestadores: TTabSheet;
    tsComercializacion: TTabSheet;
    tsPrevencion: TTabSheet;
    tsJuicios: TTabSheet;
    tsPrestacionesDinerarias: TTabSheet;
    tsContratos: TTabSheet;
    edSiniestro: TSinEdit;
    edSiniestroPREVENCION: TSinEdit;
    lbSiniestro: TLabel;
    fraRTD_TIPODOCUMENTO_ARCHSIN: TfraRTD_TIPODOCUMENTO;
    fraEmpresaSIN: TfraEmpresa;
    fraTrabajadorSIN: TfraTrabajador;
    fraEmpresaAFI: TfraEmpresa;
    lbCUIT: TLabel;
    fraEmpresaHYS: TfraEmpresa;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    fraRTD_TIPODOCUMENTO_HYS: TfraRTD_TIPODOCUMENTO;
    fraRTD_TIPODOCUMENTO_PREVENCION: TfraRTD_TIPODOCUMENTO;
    edCarpeta: TIntEdit;
    fraEmpresaLABO: TfraEmpresa;
    fraEmpresaPREVENCION: TfraEmpresa;
    fraTrabajadorLABO: TfraTrabajador;
    fraTrabajadorPREVENCION: TfraTrabajador;
    Label10: TLabel;
    edSiniestroCARTA: TSinEdit;
    Label11: TLabel;
    fraEmpresaCARTA: TfraEmpresa;
    Label12: TLabel;
    fraAreaCARTA: TfraCtbTablas;
    Label13: TLabel;
    fraTrabajadorCARTA: TfraTrabajador;
    Label14: TLabel;
    Label15: TLabel;
    edCarta: TPatternEdit;
    fraPrestador: TfraCPR_PRESTADOR;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    fraEntidadCUIT: TfraEntidadCUIT;
    fraVendedoresCUIT: TfraVendedoresCUIT;
    edSiniestroPRESDIN: TSinEdit;
    fraEmpresaPRESDIN: TfraEmpresa;
    fraTrabajadorPRESDIN: TfraTrabajador;
    fraRTD_TIPODOCUMENTO_PRESDIN: TfraRTD_TIPODOCUMENTO;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    LabelCONTRATO1: TLabel;
    LabelCONTRATO2: TLabel;
    fraSectorCONTRATOS: TfraCodDesc;
    fraProveedorCONTRATOS: TfraCodDesc;
    tsIncapacidades: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edSiniestroINCA: TSinEdit;
    fraRTD_TIPODOCUMENTO_INCA: TfraRTD_TIPODOCUMENTO;
    fraEmpresaINCA: TfraEmpresa;
    fraTrabajadorINCA: TfraTrabajador;
    tsCDInca: TTabSheet;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edSiniestroCARTAINCA: TSinEdit;
    fraEmpresaCARTAINCA: TfraEmpresa;
    fraAreaCARTAINCA: TfraCtbTablas;
    fraTrabajadorCARTAINCA: TfraTrabajador;
    edCartaINCA: TPatternEdit;
    procedure edSiniestroCARTAINCASelect(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
    procedure OnPrivateChange(Sender: TObject);
    procedure edSiniestroCARTASelect(Sender: TObject);
    procedure edSiniestroINCASelect(Sender: TObject);
    procedure edSiniestroPREVENCIONSelect(Sender: TObject);
    procedure edSiniestroPRESDINSelect(Sender: TObject);
  private
    function  GetClave: String;
    procedure CambiaEmpresaHYS(Sender: TObject);
  protected
    procedure Change; override;
    procedure SetLocked(const Value: Boolean); override;
  public
    fraEstablecimientoHYS: TfraEstablecimiento;
    
    constructor Create(AOwner: TComponent); override;

    procedure VerificarSiniestro(AedSiniestro: TSinEdit; AfraEmpresa: TfraEmpresa; AfraTrabajador: TfraTrabajador);
    procedure Clear; override;

    property  Clave: String read GetClave;
  end;

var
  fraDigitalizacion: TfraDigitalizacion;

implementation

uses unDmPrincipal, VCLExtra, General;

{$R *.dfm}

procedure TfraDigitalizacion.VerificarSiniestro(AedSiniestro: TSinEdit; AfraEmpresa: TfraEmpresa; AfraTrabajador: TfraTrabajador);
var
  sSql : string;
begin
  sSQL := 'SELECT EX_CUIL, AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE) CONTRATO ' +
          '  FROM ART.SEX_EXPEDIENTES SEX ' +
          ' WHERE SEX.EX_SINIESTRO = :SINIESTRO ' +
          '   AND SEX.EX_ORDEN = :ORDEN ' +
          '   AND SEX.EX_RECAIDA = :RECAIDA';

  if not AedSiniestro.IsEmpty then
  with GetQueryEx(sSql, [AedSiniestro.Siniestro, AedSiniestro.Orden, AedSiniestro.Recaida]) do
  try
    if Eof then
    begin
      AfraEmpresa.Clear;
      AfraTrabajador.Clear;
      VCLExtra.LockControls([AfraEmpresa, AfraTrabajador], False);
    end else
    begin
      AfraEmpresa.Contrato := FieldByName('CONTRATO').AsInteger;
      AfraTrabajador.CUIL := FieldByName('EX_CUIL').AsString;
      VCLExtra.LockControls([AfraEmpresa, AfraTrabajador], True);
    end;
  finally
    Free;
  end;
end;

procedure TfraDigitalizacion.edSiniestroSelect(Sender: TObject);
begin
  inherited;
  VerificarSiniestro(edSiniestro, fraEmpresaSIN, fraTrabajadorSIN);
  Change;
end;

procedure TfraDigitalizacion.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([edSiniestro, fraEmpresaSIN, fraTrabajadorSIN], Value);
end;

procedure TfraDigitalizacion.Clear;
begin
  inherited;
  edSiniestro.Clear;
  edSiniestroCARTA.Clear;
  edSiniestroPREVENCION.Clear;
  edSiniestroPRESDIN.Clear;
  edSiniestroINCA.Clear;
  edSiniestroCARTAINCA.Clear;

  edCarpeta.Clear;
  edCarta.Clear;
  edCartaINCA.Clear;

  fraRTD_TIPODOCUMENTO_ARCHSIN.Clear;
  fraRTD_TIPODOCUMENTO_HYS.Clear;
  fraRTD_TIPODOCUMENTO_PREVENCION.Clear;
  fraRTD_TIPODOCUMENTO_PRESDIN.Clear;
  fraRTD_TIPODOCUMENTO_INCA.Clear;

  fraEmpresaSIN.Clear;
  fraEmpresaAFI.Clear;
  fraEmpresaHYS.Clear;
  fraEmpresaLABO.Clear;
  fraEmpresaPREVENCION.Clear;
  fraEmpresaCARTA.Clear;
  fraEmpresaPRESDIN.Clear;
  fraEmpresaINCA.Clear;
  fraEmpresaCARTAINCA.Clear;

  fraTrabajadorCARTA.Clear;
  fraTrabajadorSIN.Clear;
  fraTrabajadorLABO.Clear;
  fraTrabajadorPREVENCION.Clear;
  fraTrabajadorPRESDIN.Clear;
  fraTrabajadorINCA.Clear;
  fraTrabajadorCARTAINCA.Clear;

  fraEstablecimientoHYS.Clear;
  fraAreaCARTA.Clear;
  fraAreaCARTAINCA.Clear;  
  fraPrestador.Clear;
  fraEntidadCUIT.Clear;
  fraVendedoresCUIT.Clear;

  fraProveedorCONTRATOS.Clear;
  fraSectorCONTRATOS.Clear;
end;

constructor TfraDigitalizacion.Create(AOwner: TComponent);
const
  ESTABLECIMIENTO_TOP = 30;
  ESTABLECIMIENTO_WIDTH = 405;
  ESTABLECIMIENTO_LEFT = 76;
var
  i: Integer;
  tslLista: TStringList;
begin
  inherited Create(AOwner);
  fraEstablecimientoHYS := TfraEstablecimiento.Create(tsHyS);

  with fraEstablecimientoHYS do
  begin
    Parent := tsHyS;
    Name := 'fraEstablecimientoHYS';
    Top := ESTABLECIMIENTO_TOP;
    Left := ESTABLECIMIENTO_LEFT;
    Width := ESTABLECIMIENTO_WIDTH;
  end;

  fraEstablecimientoHYS.fraEmpresa := fraEmpresaHYS;
  fraAreaCARTA.Clave := 'AREA';
  fraEmpresaSIN.ShowBajas := True;
  fraEmpresaAFI.ShowBajas := True;
  fraEmpresaHYS.ShowBajas := True;
  fraEmpresaCARTA.ShowBajas := True;
  fraEmpresaPREVENCION.ShowBajas := True;
  fraEmpresaPRESDIN.ShowBajas := True;
  fraEmpresaINCA.ShowBajas := True;
  fraEmpresaCARTAINCA.ShowBajas := True;

  fraRTD_TIPODOCUMENTO_ARCHSIN.OnChange := OnPrivateChange;
  fraEmpresaSIN.OnChange := OnPrivateChange;
  fraTrabajadorSIN.OnChange := OnPrivateChange;

  fraEmpresaAFI.OnChange := OnPrivateChange;

  fraEmpresaHYS.OnChange := CambiaEmpresaHYS;
  fraRTD_TIPODOCUMENTO_HYS.OnChange := OnPrivateChange;

  fraEmpresaLABO.OnChange := OnPrivateChange;
  fraTrabajadorLABO.OnChange := OnPrivateChange;

  fraAreaCARTA.OnChange := OnPrivateChange;
  fraEmpresaCARTA.OnChange := OnPrivateChange;
  fraTrabajadorCARTA.OnChange := OnPrivateChange;

  fraEntidadCUIT.OnChange := OnPrivateChange;
  fraVendedoresCUIT.OnChange := OnPrivateChange;

  fraPrestador.OnChange := OnPrivateChange;

  fraRTD_TIPODOCUMENTO_PREVENCION.OnChange := OnPrivateChange;
  fraEmpresaPREVENCION.OnChange := OnPrivateChange;
  fraTrabajadorPREVENCION.OnChange := OnPrivateChange;

  fraRTD_TIPODOCUMENTO_PRESDIN.OnChange := OnPrivateChange;
  fraEmpresaPRESDIN.OnChange := OnPrivateChange;
  fraTrabajadorPRESDIN.OnChange := OnPrivateChange;

  fraProveedorCONTRATOS.OnChange := OnPrivateChange;
  fraSectorCONTRATOS.OnChange := OnPrivateChange;

  fraRTD_TIPODOCUMENTO_INCA.OnChange := OnPrivateChange;
  fraEmpresaINCA.OnChange := OnPrivateChange;
  fraTrabajadorINCA.OnChange := OnPrivateChange;

  fraEmpresaCARTAINCA.OnChange := OnPrivateChange;
  fraTrabajadorCARTAINCA.OnChange := OnPrivateChange;

  tslLista := TStringList.Create;
  try
    tslLista.Sorted := True;
    for i := 0 to pgArchivos.PageCount - 1 do
      tslLista.Add(pgArchivos.Pages[i].Name);

    for i := pgArchivos.PageCount - 1 downto 0 do
      TTabSheet(FindComponent(pgArchivos.Pages[i].Name)).PageIndex := tslLista.IndexOf(pgArchivos.Pages[i].Name);
  finally
    tslLista.Free;
  end;
end;

procedure TfraDigitalizacion.OnPrivateChange(Sender: TObject);
begin
  Change;
end;

procedure TfraDigitalizacion.Change;
begin
  inherited;

end;

procedure TfraDigitalizacion.edSiniestroCARTASelect(Sender: TObject);
begin
  VerificarSiniestro(edSiniestroCARTA, fraEmpresaCARTA, fraTrabajadorCARTA);
  Change;
end;

function TfraDigitalizacion.GetClave: String;
begin
  if pgArchivos.ActivePage = tsSiniestros then
    Result := iif(edSiniestro.IsEmpty, '', ' Siniestro ' + edSiniestro.SinOrdRec) +
              iif(fraEmpresaSIN.IsSelected, ' Empresa ' + fraEmpresaSIN.NombreEmpresa, '') +
              iif(fraEmpresaSIN.IsSelected, ' Contrato ' + IntToStr(fraEmpresaSIN.Contrato), '') +
              iif(fraTrabajadorSIN.IsSelected, ' Trabajador ' + fraTrabajadorSIN.Nombre, '') +
              iif(fraRTD_TIPODOCUMENTO_ARCHSIN.IsSelected, ' Documento ' + fraRTD_TIPODOCUMENTO_ARCHSIN.Descripcion, '')

  else if pgArchivos.ActivePage = tsAfiliaciones then
    Result := ' Empresa ' + fraEmpresaAFI.NombreEmpresa

  else if pgArchivos.ActivePage = tsHyS then
    Result := iif(fraEmpresaHYS.IsSelected, ' Empresa ' + fraEmpresaHYS.NombreEmpresa, '') +
              iif(fraEmpresaHYS.IsSelected, ' Contrato ' + IntToStr(fraEmpresaHYS.Contrato), '') +
              iif(fraEstablecimientoHYS.IsSelected, ' Establecimiento ' + fraEstablecimientoHYS.Descripcion, '') +
              iif(fraRTD_TIPODOCUMENTO_HYS.IsSelected, ' Documento ' + fraRTD_TIPODOCUMENTO_HYS.Descripcion, '')

  else if pgArchivos.ActivePage = tsMedLab then
    Result := iif(edCarpeta.IsEmpty, '', ' Carpeta ' + edCarpeta.Text) +
              iif(fraEmpresaLABO.IsSelected, ' Empresa ' + fraEmpresaLABO.NombreEmpresa, '') +
              iif(fraEmpresaLABO.IsSelected, ' Contrato ' + IntToStr(fraEmpresaLABO.Contrato), '') +
              iif(fraTrabajadorLABO.IsSelected, ' Trabajador ' + fraTrabajadorLABO.Nombre, '')

  else if pgArchivos.ActivePage = tsCD then
    Result := edCarta.Text + iif(edSiniestroCARTA.IsEmpty, '', ' Siniestro ' + edSiniestroCARTA.SinOrdRec) +
              iif(fraEmpresaCARTA.IsSelected, ' Empresa ' + fraEmpresaCARTA.NombreEmpresa, '') +
              iif(fraTrabajadorCARTA.IsSelected, ' Trabajador ' + fraTrabajadorCARTA.Nombre, '')

  else if pgArchivos.ActivePage = tsPrestadores then
    Result := ' Prestador ' + fraPrestador.RazonSocial + ' (' + fraPrestador.Cuit + ')'

  else if pgArchivos.ActivePage = tsComercializacion then
    Result := iif(fraEntidadCUIT.IsSelected, ' Entidad ' + fraEntidadCUIT.Descripcion, '') +
              iif(fraVendedoresCUIT.IsSelected, ' Vendedor ' + fraVendedoresCUIT.Descripcion, '')

  else if pgArchivos.ActivePage = tsPrevencion then
    Result := iif(edSiniestroPREVENCION.IsEmpty, '', ' Siniestro ' + edSiniestroPREVENCION.SinOrdRec) +
              iif(fraEmpresaPREVENCION.IsSelected, ' Empresa ' + fraEmpresaPREVENCION.NombreEmpresa, '') +
              iif(fraEmpresaPREVENCION.IsSelected, ' Contrato ' + IntToStr(fraEmpresaPREVENCION.Contrato), '') +
              iif(fraTrabajadorPREVENCION.IsSelected, ' Trabajador ' + fraTrabajadorPREVENCION.Nombre, '') +
              iif(fraRTD_TIPODOCUMENTO_PREVENCION.IsSelected, ' Documento ' + fraRTD_TIPODOCUMENTO_PREVENCION.Descripcion, '')

  else if pgArchivos.ActivePage = tsContratos then
    Result := iif(fraProveedorCONTRATOS.IsSelected, ' Proveedor ' + fraProveedorCONTRATOS.Descripcion, '') +
              iif(fraSectorCONTRATOS.IsSelected, ' Sector ' + fraSectorCONTRATOS.Descripcion, '')

  else if pgArchivos.ActivePage = tsPrestacionesDinerarias then
    Result := iif(edSiniestroPRESDIN.IsEmpty, '', ' Siniestro ' + edSiniestroPRESDIN.SinOrdRec) +
              iif(fraEmpresaPRESDIN.IsSelected, ' Empresa ' + fraEmpresaPRESDIN.NombreEmpresa, '') +
              iif(fraEmpresaPRESDIN.IsSelected, ' Contrato ' + IntToStr(fraEmpresaPRESDIN.Contrato), '') +
              iif(fraTrabajadorPRESDIN.IsSelected, ' Trabajador ' + fraTrabajadorPRESDIN.Nombre, '') +
              iif(fraRTD_TIPODOCUMENTO_PRESDIN.IsSelected, ' Documento ' + fraRTD_TIPODOCUMENTO_PRESDIN.Descripcion, '')
  else if pgArchivos.ActivePage = tsIncapacidades then
    Result := iif(edSiniestroINCA.IsEmpty, '', ' Siniestro ' + edSiniestroINCA.SinOrdRec) +
              iif(fraEmpresaINCA.IsSelected, ' Empresa ' + fraEmpresaINCA.NombreEmpresa, '') +
              iif(fraEmpresaINCA.IsSelected, ' Contrato ' + IntToStr(fraEmpresaINCA.Contrato), '') +
              iif(fraTrabajadorINCA.IsSelected, ' Trabajador ' + fraTrabajadorINCA.Nombre, '') +
              iif(fraRTD_TIPODOCUMENTO_INCA.IsSelected, ' Documento ' + fraRTD_TIPODOCUMENTO_INCA.Descripcion, '');
  end;

procedure TfraDigitalizacion.CambiaEmpresaHYS(Sender: TObject);
begin
  fraEstablecimientoHYS.Clear;
  Change;
end;

procedure TfraDigitalizacion.edSiniestroCARTAINCASelect(Sender: TObject);
begin
  VerificarSiniestro(edSiniestroCARTAINCA, fraEmpresaCARTAINCA, fraTrabajadorCARTAINCA);
  Change;
end;

procedure TfraDigitalizacion.edSiniestroINCASelect(Sender: TObject);
begin
  VerificarSiniestro(edSiniestroINCA, fraEmpresaINCA, fraTrabajadorINCA);
  Change;
end;

procedure TfraDigitalizacion.edSiniestroPREVENCIONSelect(Sender: TObject);
begin
  VerificarSiniestro(edSiniestroPREVENCION, fraEmpresaPREVENCION, fraTrabajadorPREVENCION);
  Change;
end;

procedure TfraDigitalizacion.edSiniestroPRESDINSelect(Sender: TObject);
begin
  VerificarSiniestro(edSiniestroPRESDIN, fraEmpresaPRESDIN, fraTrabajadorPRESDIN);
  Change;
end;

initialization
  RegisterClasses([TfraEstablecimiento]);

end.
