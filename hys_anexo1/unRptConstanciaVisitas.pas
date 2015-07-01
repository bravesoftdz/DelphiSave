unit unRptConstanciaVisitas;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, General,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, ArtDatabase,
  AnsiSql, unDmPrincipal, Dialogs, ArtQReports;

type
  TrptConstanciaVisitas = class(TQuickRep)//, IReporteEstablecimiento)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrbHeader: TQRBand;
    lbldatosempresa: TQRLabel;
    lblrazonsocial: TQRLabel;
    lbldenomestablecimiento: TQRLabel;
    lblcuit: TQRLabel;
    lblcontrato: TQRLabel;
    lblciiu: TQRLabel;
    lblactividad: TQRLabel;
    lbldomicilio: TQRLabel;
    lbllocalidad: TQRLabel;
    lblcpa: TQRLabel;
    lbltelfax: TQRLabel;
    lblprovincia: TQRLabel;
    lblemail: TQRLabel;
    lblcanttrab: TQRLabel;
    lblindustria: TQRLabel;
    lblconstruccion: TQRLabel;
    lblagro: TQRLabel;
    lblotros: TQRLabel;
    lblres700: TQRLabel;
    lblres0105: TQRLabel;
    lblactividadesaseg: TQRLabel;
    lblconsideraciones: TQRLabel;
    lblrelevhys: TQRLabel;
    lblevalriesgo: TQRLabel;
    lblcapacitacion: TQRLabel;
    lblaficheres7079: TQRLabel;
    lblmaterialprev: TQRLabel;
    lblsgc: TQRLabel;
    lbl: TQRLabel;
    lblinvestacc: TQRLabel;
    lblmedicion: TQRLabel;
    lblreunion: TQRLabel;
    lblfallida: TQRLabel;
    lblotrasactividades: TQRLabel;
    QRShape2: TQRShape;
    qrbDetalle: TQRBand;
    lblnromedida: TQRLabel;
    lblitem: TQRLabel;
    lblmedida: TQRLabel;
    cuit: TQRLabel;
    ciiu: TQRLabel;
    contrato: TQRLabel;
    denomestablecimiento: TQRLabel;
    razonsocial: TQRLabel;
    domicilio: TQRLabel;
    localidad: TQRLabel;
    cpa: TQRLabel;
    provincia: TQRLabel;
    telfax: TQRLabel;
    nromedida: TQRDBText;
    item: TQRDBText;
    medida: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRMemo2: TQRMemo;
    QRSysData1: TQRSysData;
    email: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    chkIndustria: TQRLabel;
    chkConstruccion: TQRLabel;
    chkAgro: TQRLabel;
    chkR700: TQRLabel;
    chkR01: TQRLabel;
    chkOtros: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    qrFechaSeg: TQRBand;
    qrTituloFechaSeg: TQRLabel;
    lbFechaSeguimiento: TQRMemo;
    qrsFechaSeg: TQRShape;
    QRShape53: TQRShape;
    QRLabel1: TQRLabel;
    QRShape54: TQRShape;
    QRLabel2: TQRLabel;
    QRShape55: TQRShape;
    QRLabel3: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    ChildBand1: TQRChildBand;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRMemo3: TQRMemo;
    QRShape15: TQRShape;
    logo: TQRImage;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFechaSegBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FPRSPAPE : Boolean;
    FNroEstablecimiento : String;
    FTipo : String;
    FOperativo : String;
    FFecha : TDateTime;
  public
    procedure VistaPrevia(pConsulta, pCuit, pRazonsocial, pDenomestablecimiento,
                          pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                          pProvincia, pTelfax, pEmail, pTipo: String; pPath : String = '' );
    procedure ExportPDF(pConsulta, pCuit, pRazonsocial,
      pDenomestablecimiento, pContrato, pCiiu, pDomicilio, pLocalidad,
      pCpa, pProvincia, pTelfax, pEmail, pTipo, pPath: String);
    property PRSPAPE : Boolean read FPRSPAPE write FPRSPAPE;
    property NroEstablecimiento : String read FNroEstablecimiento write FNroEstablecimiento;
    property Tipo : String read FTipo write FTipo;
    property Operativo : String read FOperativo write FOperativo;
    property Fecha : TDateTime read FFecha write FFecha;
  end;

var
  CantHojas : Integer;

implementation

uses unVisualizador, Math, ArchFuncs, unExportPDF;

{$R *.DFM}

Const
  LpH1 = 7; // # líneas para la primer hoja
  LpH2 = 13; // # líneas a partir de la 2da. hoja

procedure TrptConstanciaVisitas.VistaPrevia (pConsulta, pCuit, pRazonsocial, pDenomestablecimiento,
                                             pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                                             pProvincia, pTelfax, pEmail, pTipo: String; pPath : String = '' );
var
  LineasNulas: Integer;
  primerRegistro : Boolean;
  sFechas: String;
begin
  try
    primerRegistro := True;
    Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
    cuit.Caption := pCuit;
    razonsocial.Caption := pRazonsocial;
    denomestablecimiento.Caption := pDenomestablecimiento;
    contrato.Caption := pContrato;
    ciiu.Caption := pCiiu;
    domicilio.Caption := pDomicilio;
    localidad.Caption := pLocalidad;
    cpa.Caption := pCpa;
    provincia.Caption := pProvincia;
    telfax.Caption := pTelfax;
    email.Caption := pEmail;
    chkIndustria.Caption := iif (pTipo = 'I', 'X', '');
    chkConstruccion.Caption := iif (pTipo = 'C', 'X', '');
    chkAgro.Caption := iif (pTipo = 'A', 'X', '');
    chkR700.Caption := iif (pTipo = 'T', 'X', '');
    chkR01.Caption := iif (pTipo = 'P', 'X', '');
    chkOtros.Caption := iif (pTipo = 'O', 'X', '');

    sdqReporte.SQL.Text := pConsulta;
    sdqReporte.Open;

    if sdqReporte.RecordCount = LpH1 then
      LineasNulas := 0
    else
      if sdqReporte.RecordCount < LpH1 then
        LineasNulas := (LpH1 + 1) - sdqReporte.RecordCount mod LpH1
      else
        if (sdqReporte.RecordCount - LpH1) mod LpH2 = 0 then
          LineasNulas := 0
        else
          LineasNulas := (LpH2 + 1) - (sdqReporte.RecordCount - LpH1) mod LpH2;

    sdqReporte.Close;
    sdqReporte.SQL.Append('UNION ALL ' +
                          'SELECT NULL nromedida, NULL item, NULL medida ' +
                          '  FROM aco_contrato ' +
                          ' WHERE ROWNUM <  ' + SqlInt(LineasNulas)+
                          ' ORDER BY 1');
    sdqReporte.Open;
    If PRSPAPE then
    begin
      with GetQuery(
        ' SELECT   DISTINCT re_cumplimiento '+
        '     FROM art.pre_recomendaciones '+
        '    WHERE re_fechabaja IS NULL '+
        '      AND re_cuit = '+ SqlValue(pCuit)+
        '      AND re_estableci = '+SqlValue(NroEstablecimiento)+
        '      AND re_tipo = '+SqlValue(Tipo)+
        '      AND re_operativo = '+SqlValue(Operativo)+
        '      AND re_cumplimiento > '+ SqlValue(Fecha)+
        ' ORDER BY 1 ') do
      try
        while not Eof do
        begin
          if primerRegistro then
          begin
            sFechas := FieldByName('re_cumplimiento').AsString;
            primerRegistro := False;
          end
          else
            sFechas := sFechas +' - '+ FieldByName('re_cumplimiento').AsString;
          Next;
        end;
      finally
        Free;
      end;
      lbFechaSeguimiento.Lines.Clear;
      lbFechaSeguimiento.Lines.Add(sFechas);
    end;
    if pPath = '' then
      Visualizar(self, GetValores('', '', StrToIntDef(pContrato, 0)), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
    else
    begin
      Self.Prepare;
      Self.QRPrinter.Title := pPath;
      Self.QRPrinter.Print;
      Self.QRPrinter.Free;
      Self.QRPrinter.Cleanup;
    end;
  finally
    sdqReporte.Close;
  end;
end;

procedure TrptConstanciaVisitas.ExportPDF(pConsulta, pCuit, pRazonsocial, pDenomestablecimiento,
                                             pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                                             pProvincia, pTelfax, pEmail, pTipo: String; pPath : String);
begin
  VistaPrevia (pConsulta, pCuit, pRazonsocial, pDenomestablecimiento,
                                             pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                                             pProvincia, pTelfax, pEmail, pTipo, pPath);
end;

procedure TrptConstanciaVisitas.qrbHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrPrinter.PageNumber < 2 then
    qrbHeader.Height := 141
  else
    qrbHeader.Height := 37
end;



procedure TrptConstanciaVisitas.qrFechaSegBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if not PRSPAPE then
  begin
    qrFechaSeg.Height := 1;
    lbFechaSeguimiento.Enabled := False;
    qrsFechaSeg.Enabled := False;
    qrTituloFechaSeg.Enabled := False;
  end
  else
  begin
    qrFechaSeg.Height := 50;
  end
  //qrFechaSeg.Enabled    := PRSPAPE;
end;

end.

