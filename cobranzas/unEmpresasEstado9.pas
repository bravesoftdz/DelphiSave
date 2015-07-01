unit unEmpresasEstado9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmEmpresasEstado9 = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  end;

var
  frmEmpresasEstado9: TfrmEmpresasEstado9;

implementation

{$R *.DFM}

procedure TfrmEmpresasEstado9.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT CO_CONTRATO CONTRATO, CO_FECHABAJA FBAJA, EM_CUIT CUIT, EM_NOMBRE EMPRESA, CO_ESTADO ESTADO, CCA_A.CA_NROCARTADOC C_RESCISION, ' +
                 'TRUNC(CCA_A.CA_FECHAIMPRESION) R_FIMPRESION, CCA_A.CA_FECHARECEPCION R_FRECEPCION, CCA_A.CA_CODRECEPCION R_CODRECEPCION, ' +
                 'CTB_TABLAS.TB_DESCRIPCION R_DESCRECEPCION, CCA_C.CA_NROCARTADOC C_INTIMACION, TRUNC(CCA_C.CA_FECHAIMPRESION) I_FIMPRESION, ' +
                 'CCA_C.CA_FECHARECEPCION I_FRECEPCION, CCA_C.CA_CODRECEPCION I_CODRECEPCION, ' +
                 'CTB.TB_DESCRIPCION I_DESCRECEPCION, ' +
                 'ART.DEUDA.GET_DEUDATOTALCONTRATO(CO_CONTRATO) D_DEUDAINTIMACION, ' +
                 'ART.DEUDA.GET_CANTPERCONTRATO(CO_CONTRATO) D_CANTPERINTIMACION, ' +
                 'ART.DEUDA.GET_TOTALDEVPOSTERIORINTIMAC(CO_CONTRATO) D_TOTDEVPOSTERIORINTIMAC, ' +
                 'ART.DEUDA.IS_DEVANULADOSINEMPLEADOS(CO_CONTRATO) D_DEVANULADOSINEMPLEADOS, ' +
                 'DC_MAYORDEVENGADO D_MAYORDEVULTANIO, ' +
                 'ART.DEUDA.GET_DEUDAANTRESCISION(CO_CONTRATO, ''I'') D_DEUDAANTERIORIMPRRESCISION, ' +
                 'ART.DEUDA.GET_DEUDAANTRESCISION(CO_CONTRATO, ''R'') D_DEUDAANTERIORRECEPCRESCISION, ' +
                 'ART.DEUDA.GET_TOTCOBRPOSTERIORPERINTIMAC(CO_CONTRATO) D_TOTCOBRPOSTERIORPERINTIMAC, ' +
                 'ART.DEUDA.GET_ULTFECHAPAGOMOVIM(CO_CONTRATO) D_ULTFECHAPAGOMOVIM, ' +
                 'ART.DEUDA.GET_PERULTFECHAPAGOMOVIM(CO_CONTRATO) D_PERULTFECHAPAGOMOVIM, ' +
                 'ART.DEUDA.GET_ULTFECHAPAGOSINTIMAC(CO_CONTRATO) D_ULTFECHAPAGOINTIMACION, ' +
                 'ART.DEUDA.GET_PERULTFECHAPAGOSINTIMAC(CO_CONTRATO) D_PERULTFECHAPAGOINTIMACION, ' +
                 'ART.DEUDA.GET_ULTFECHAPAGOSFUERAINTIMAC(CO_CONTRATO) D_ULTFECHAPAGOFUERAINTIMACION, ' +
                 'ART.DEUDA.GET_PERULTFPAGOSFUERAINTIMAC(CO_CONTRATO) D_PERULTFPAGOFUERAINTIMACION, ' +
                 'ART.DEUDA.GET_DEVANULADOINTIMACION(CO_CONTRATO) D_DEVENGADOANULADOINTIMACION, ' +
                 'TRUNC(PP_FECHA) P_ULTFECHAPLANPAGO, ' +
                 'ART.DEUDA.GET_TOTALAPAGARPLANPAGO(PP_ID) P_TOTALAPAGARPLANPAGO, ' +
                 'ART.DEUDA.GET_VENCIMIENTOPROXCUOTAPLAN(PP_ID) P_FECHAVENCPROXCUOTAPLANPAGO, ' +
                 'CTBSECT.TB_DESCRIPCION P_SECTORPLANPAGO ' +
            'FROM ART.CTB_TABLAS CTBSECT, ZPP_PLANPAGO, TDC_DEUDACOBRANZA, ART.CTB_TABLAS CTB_TABLAS, ART.CTB_TABLAS CTB, CCA_CARTA CCA_A, ' +
                 'AEN_ENDOSO AEN_A, CCA_CARTA CCA_C, AEM_EMPRESA, ACO_CONTRATO ' +
           'WHERE AEN_A.EN_CONTRATO = CO_CONTRATO ' +
                 'AND CO_ESTADO = ''9'' ' +
                 'AND CO_IDEMPRESA = EM_ID ' +
                 'AND CCA_A.CA_IDENDOSO = AEN_A.EN_ID ' +
                 'AND CCA_A.CA_ID = ART.AFILIACION.GET_IDULTIMACARTADOCIMPRESA(AEN_A.EN_CONTRATO, ''04'', ''02'') ' +
                 'AND CCA_C.CA_NROCARTADOC = ART.DEUDA.GET_NROCARTADOCINTIMACION(CCA_A.CA_NROCARTADOC) ' +
                 'AND CTB_TABLAS.TB_CODIGO (+) = CCA_A.CA_CODRECEPCION ' +
                 'AND CTB_TABLAS.TB_CLAVE (+) = ''CODRE'' ' +
                 'AND CTB.TB_CODIGO (+) = CCA_C.CA_CODRECEPCION ' +
                 'AND CTB.TB_CLAVE (+)= ''CODRE'' ' +
                 'AND CO_CONTRATO = ART.GET_VULTCONTRATO(EM_CUIT) ' +
                 'AND DC_USUARIO (+) = ''SISTEMAS'' ' +
                 'AND CO_CONTRATO = DC_CONTRATO (+) ' +
                 'AND ART.DEUDA.GET_PLANPAGOULTFECHA(CO_CONTRATO) = PP_ID(+) ' +
                 'AND CTBSECT.TB_CLAVE(+) = ''SECT'' ' +
                 'AND EM_SECTOR = CTBSECT.TB_CODIGO(+)';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmEmpresasEstado9.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('D_DEUDAINTIMACION') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('D_DEUDAINTIMACION')).Currency := True;

  if sdqConsulta.FieldByName('D_TOTDEVPOSTERIORINTIMAC') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_TOTDEVPOSTERIORINTIMAC')).Currency := True;

  if sdqConsulta.FieldByName('D_MAYORDEVULTANIO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_MAYORDEVULTANIO')).Currency := True;

  if sdqConsulta.FieldByName('D_DEUDAANTERIORIMPRRESCISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_DEUDAANTERIORIMPRRESCISION')).Currency := True;

  if sdqConsulta.FieldByName('D_DEUDAANTERIORRECEPCRESCISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_DEUDAANTERIORRECEPCRESCISION')).Currency := True;

  if sdqConsulta.FieldByName('D_TOTCOBRPOSTERIORPERINTIMAC') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_TOTCOBRPOSTERIORPERINTIMAC')).Currency := True;

  if sdqConsulta.FieldByName('D_DEVENGADOANULADOINTIMACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('D_DEVENGADOANULADOINTIMACION')).Currency := True;

  if sdqConsulta.FieldByName('P_TOTALAPAGARPLANPAGO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('P_TOTALAPAGARPLANPAGO')).Currency := True;
end;

end.
