unit unRptAportesContrib;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TTiposListado = (tlAFJPOS_SUSS, tlAFJP_NOSUSS, tlOS_NOSUSS);

  TRptAportesContrib = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSubTitulo: TQRLabel;
    qrlSubTituloRango: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    sdqDetalle: TSDQuery;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTitJ: TQRLabel;
    qrlTitINSSJP: TQRLabel;
    qrlTitFE: TQRLabel;
    qrlTitSF: TQRLabel;
    qrlTitANSSAL: TQRLabel;
    qrlTitOS: TQRLabel;
    qrlTitTOT: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrdbPEJ: TQRDBText;
    qrdbPEINSSJP: TQRDBText;
    qrdbPEFE: TQRDBText;
    qrdbPESF: TQRDBText;
    qrdbPEANSSAL: TQRDBText;
    qrdbPEOS: TQRDBText;
    qrdbEMPJ: TQRDBText;
    qrdbEMPINSSJP: TQRDBText;
    qrdbEMPFE: TQRDBText;
    qrdbEMPSF: TQRDBText;
    qrdbEMPANSSAL: TQRDBText;
    qrdbEMPOS: TQRDBText;
    qrdbPTJ: TQRDBText;
    qrdbPTINSSJP: TQRDBText;
    qrdbPTANSSAL: TQRDBText;
    qrdbPTOS: TQRDBText;
    qrdbTRABJ: TQRDBText;
    qrdbTRABINSSJP: TQRDBText;
    qrdbTRABANSSAL: TQRDBText;
    qrdbTRABOS: TQRDBText;
    qrdbPETOT: TQRDBText;
    qrdbEMPTOT: TQRDBText;
    qrdbPTTOT: TQRDBText;
    qrdbTRABTOT: TQRDBText;
    QRShape5: TQRShape;
    qrdbDESCRGRUPO_CONPAGO: TQRDBText;
    qrgfGrupoConceptoPago: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRExpr3: TQRExpr;
    QRShape6: TQRShape;
    QRDBText17: TQRDBText;
    QRShape7: TQRShape;
    QRDBText18: TQRDBText;
    QRShape8: TQRShape;
    qrghGrupoOS: TQRGroup;
    qrghGrupoAFJP: TQRGroup;
    qrghGrupoConceptoPago: TQRGroup;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText28: TQRDBText;
    procedure FormatMonto(sender: TObject; var Value: String);
  private
    FSubTitulo: String;
    FSubTituloRango: String;
    FTipoListado: TTiposListado;
    procedure SetSubTitulo(const Value: String);
    procedure SetSubTituloRango(const Value: String);
    procedure SetTipoListado(const Value: TTiposListado);
  public
    procedure Preparar(FAprobDesde, FAprobHasta: TDateTime);
    property SubTitulo: String           read FSubTitulo          write SetSubTitulo;
    property SubTituloRango: String      read FSubTituloRango     write SetSubTituloRango;
    property TipoListado: TTiposListado  read FTipoListado        write SetTipoListado;
  end;

var
  RptAportesContrib: TRptAportesContrib;

implementation

uses
  Strfuncs, unVisualizador, unDmPrincipal, Periodo, SqlFuncs;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TRptAportesContrib.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{-------------------------------------------------------------------------------}
procedure TRptAportesContrib.Preparar(FAprobDesde, FAprobHasta: TDateTime);
begin
  sdqDetalle.ParamByName('PeriodoHasta').AsString     := GetPeriodo(FAprobHasta, fpAnioMes);
  sdqDetalle.ParamByName('FAprobadoDesde').AsDateTime := FAprobDesde;
  sdqDetalle.ParamByName('FAprobadoHasta').AsDateTime := FAprobHasta;
  sdqDetalle.ParamByName('TipoListado').AsInteger     := Ord(FTipoListado);

  OpenQuery(sdqDetalle);
  if not sdqDetalle.IsEmpty then
    Visualizar(RptAportesContrib, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;
{-------------------------------------------------------------------------------}
procedure TRptAportesContrib.SetSubTitulo(const Value: String);
begin
  FSubTitulo           := Value;
  qrlSubTitulo.Caption := Value;
end;
{-------------------------------------------------------------------------------}
procedure TRptAportesContrib.SetSubTituloRango(const Value: String);
begin
  FSubTituloRango           := Value;
  qrlSubTituloRango.Caption := Value;
end;
{-------------------------------------------------------------------------------}
procedure TRptAportesContrib.SetTipoListado(const Value: TTiposListado);
var
  bJVisible, bINSSJPVisible, bFEVisible, bSFVisible, bANSSALVisible, bOSVisible, bTOTVisible: Boolean;
  sOrderBy, sSqlDetalle, sCond: String;
begin
  FTipoListado := Value;

  bJVisible      := FTipoListado in [tlAFJPOS_SUSS, tlAFJP_NOSUSS];
  bINSSJPVisible := FTipoListado in [tlAFJPOS_SUSS];
  bFEVisible     := FTipoListado in [tlAFJPOS_SUSS];
  bSFVisible     := FTipoListado in [tlAFJPOS_SUSS];
  bANSSALVisible := FTipoListado in [tlAFJPOS_SUSS];
  bOSVisible     := FTipoListado in [tlAFJPOS_SUSS, tlOS_NOSUSS];
  bTOTVisible    := FTipoListado in [tlAFJPOS_SUSS];

  qrlTitJ.Enabled      := bJVisible;
  qrlTitINSSJP.Enabled := bINSSJPVisible;
  qrlTitFE.Enabled     := bFEVisible;
  qrlTitSF.Enabled     := bSFVisible;
  qrlTitANSSAL.Enabled := bANSSALVisible;
  qrlTitOS.Enabled     := bOSVisible;
  qrlTitTOT.Enabled    := bTOTVisible;

  qrdbPEJ.Enabled      := bJVisible;
  qrdbPEINSSJP.Enabled := bINSSJPVisible;
  qrdbPEFE.Enabled     := bFEVisible;
  qrdbPESF.Enabled     := bSFVisible;
  qrdbPEANSSAL.Enabled := bANSSALVisible;
  qrdbPEOS.Enabled     := bOSVisible;
  qrdbPETOT.Enabled    := bTOTVisible;

  qrdbEMPJ.Enabled      := bJVisible;
  qrdbEMPINSSJP.Enabled := bINSSJPVisible;
  qrdbEMPFE.Enabled     := bFEVisible;
  qrdbEMPSF.Enabled     := bSFVisible;
  qrdbEMPANSSAL.Enabled := bANSSALVisible;
  qrdbEMPOS.Enabled     := bOSVisible;
  qrdbEMPTOT.Enabled    := bTOTVisible;

  qrdbPTJ.Enabled      := bJVisible;
  qrdbPTINSSJP.Enabled := bINSSJPVisible;
  qrdbPTANSSAL.Enabled := bANSSALVisible;
  qrdbPTOS.Enabled     := bOSVisible;
  qrdbPTTOT.Enabled    := bTOTVisible;

  qrdbTRABJ.Enabled      := bJVisible;
  qrdbTRABINSSJP.Enabled := bINSSJPVisible;
  qrdbTRABANSSAL.Enabled := bANSSALVisible;
  qrdbTRABOS.Enabled     := bOSVisible;
  qrdbTRABTOT.Enabled    := bTOTVisible;

  case FTipoListado of
    tlAFJPOS_SUSS:
      begin
        qrghGrupoConceptoPago.ForceNewPage := True;

        sCond    := '(LE_OBRASOCIAL_SUSS = ''S'' OR LE_AFJP_SUSS = ''S'') ';
        sOrderBy := 'CODGRUPO_CONPAGO, NROSINILIQ';
      end;
    tlAFJP_NOSUSS:
      begin
        qrghGrupoAFJP.ForceNewPage := True;

        sCond    := 'LE_AFJP IS NOT NULL AND LE_AFJP_SUSS <> ''S'' ';
        sOrderBy := 'CODGRUPO_AFJP, CODGRUPO_CONPAGO, NROSINILIQ';
      end;
    tlOS_NOSUSS:
      begin
        qrghGrupoOS.ForceNewPage := True;

        sCond    := 'LE_OBRASOCIAL_SUSS <> ''S'' ';
        sOrderBy := 'CODGRUPO_OS, CODGRUPO_CONPAGO, NROSINILIQ';
      end;
  end;

  qrghGrupoAFJP.Enabled := (FTipoListado = tlAFJP_NOSUSS);
  if qrghGrupoAFJP.Enabled then
    qrghGrupoAFJP.Expression := 'sdqDetalle.CODGRUPO_AFJP'
  else
    qrghGrupoAFJP.Expression := '';

  qrghGrupoOS.Enabled := (FTipoListado = tlOS_NOSUSS);
  if qrghGrupoOS.Enabled then
    qrghGrupoOS.Expression := 'sdqDetalle.CODGRUPO_OS'
  else
    qrghGrupoOS.Expression := '';

  sSqlDetalle := sdqDetalle.SQL.Text;
  AddCondition(sSqlDetalle, sCond);
  sdqDetalle.SQL.Text := sSqlDetalle + ' ORDER BY ' + sOrderBy;
end;
{-------------------------------------------------------------------------------}
end.

