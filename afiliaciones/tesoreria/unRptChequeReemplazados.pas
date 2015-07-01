unit unRptChequeReemplazados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  ExtCtrls, Db, QueryPrint, SDEngine;

type
  TfrmRptChequeReemplazados = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbFechaDesde: TLabel;
    Label1: TLabel;
    edFECHA_REEMP_DESDE: TDateComboBox;
    edFECHA_REEMP_HASTA: TDateComboBox;
    edNO_Conta: TCheckBox;
    Bevel1: TBevel;
    sdqReporte: TSDQuery;
    qpReporte: TQueryPrint;
    dsReporte: TDataSource;
    PrintDialog: TPrintDialog;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qpReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
      var ABackground: TColor; var AAlignment: TAlignment);
    procedure qpReporteReportBegin(Sender: TObject);
    procedure qpReporteGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
  end;

implementation

uses
  AnsiSQL, unRPT_CH_REEMPLAZADOS, CustomDlgs, unDmPrincipal;

{$R *.DFM}

procedure TfrmRptChequeReemplazados.btnAceptarClick(Sender: TObject);
var
  sSql,
  sFiltro,
  sWhere: string;
begin
  sWhere := '';
  sFiltro := '';

  if not edFECHA_REEMP_DESDE.IsEmpty then
  begin
    sWhere := sWhere + ' AND TRUNC(C1.CE_FECHAESTADO) >= ' + SqlDate( edFECHA_REEMP_DESDE.Date );
    sFiltro := 'Fecha Desde ' + edFECHA_REEMP_DESDE.Text;
  end;

  if not edFECHA_REEMP_HASTA.IsEmpty then
  begin
    sWhere := sWhere + ' AND TRUNC(C1.CE_FECHAESTADO) <= '+ SqlDate( edFECHA_REEMP_HASTA.Date );
    if sFiltro = '' Then
      sFiltro := ' Fecha';

    sFiltro := sFiltro + ' Hasta ' + edFECHA_REEMP_HASTA.Text;
  end;

  if edNO_Conta.Checked then
  begin
    sWhere := sWhere + ' AND RC_CONTABILIZADO != ''Y'' ';
    if sFiltro <> '' Then
      sFiltro := sFiltro + ', No Contabilizados'
    else
      sFiltro := sFiltro + 'No Contabilizados';
  end;
{ // Trae todo
  else
    sWhere := sWhere + ' AND ORC.POSTED_FLAG != ''N'' ';
}

  sSql :=
    'SELECT DISTINCT C1.CE_ID, 1 CORTE, C1.CE_NUMERO, C1.CE_ORDENPAGO, C1.CE_FECHACHEQUE, C1.CE_FECHAESTADO,' +
    '       C1.CE_MONTO, C1.CE_BENEFICIARIO' +
    '  FROM RCE_CHEQUEEMITIDO C1, RCE_CHEQUEEMITIDO C2, RRC_REEMPLAZOCHEQUE' +
    ' WHERE C2.CE_IDCHEQUEREEMP = C1.CE_ID' +
    '   AND C2.CE_ORDENPAGO = RC_ID' +
    '   AND C1.CE_ESTADO = ''05''' + sWhere +
    ' UNION ALL ' +
    'SELECT C2.CE_IDCHEQUEREEMP, 2 CORTE, C2.CE_NUMERO, C2.CE_ORDENPAGO, C2.CE_FECHACHEQUE, C2.CE_FECHAESTADO,' +
    '       C2.CE_MONTO, C2.CE_BENEFICIARIO' +
    '  FROM RCE_CHEQUEEMITIDO C1, RCE_CHEQUEEMITIDO C2, RRC_REEMPLAZOCHEQUE' +
    ' WHERE C2.CE_IDCHEQUEREEMP = C1.CE_ID' +
    '   AND C2.CE_ORDENPAGO = RC_ID' +
    '   AND C1.CE_ESTADO = ''05''' + sWhere +
    ' ORDER BY 1, 2';

  OpenQuery(sdqReporte, sSql);
{
     try
       if sdqReporte.IsEmpty Then
         raise Exception.Create('No se encontraron datos');

       if PrintDialog.Execute Then
       begin
         qpReporte.SubTitle.Text := sFiltro;
         qpReporte.Footer.Text   := sFiltro;
         qpReporte.Print;
       end;
     finally
       sdqReporte.Close;
     end;
}
  if not sdqReporte.IsEmpty then
  begin
    frmRPT_CH_REEMPLAZADOS := TfrmRPT_CH_REEMPLAZADOS.Create( Self );
    try
      frmRPT_CH_REEMPLAZADOS.qrlFiltro.Caption := ' ' + sFiltro;
      frmRPT_CH_REEMPLAZADOS.sdqChequesRechazados.Close;
      frmRPT_CH_REEMPLAZADOS.sdqChequesRechazados.SQL.Text := sSql;
      frmRPT_CH_REEMPLAZADOS.sdqChequesRechazados.Open;
      if frmRPT_CH_REEMPLAZADOS.sdqChequesRechazados.Eof then
      begin
      end;
      frmRPT_CH_REEMPLAZADOS.qrpChequesRechazados.PreviewModal;
    finally
      frmRPT_CH_REEMPLAZADOS.Free;
    end;
  end
  else
    InvalidHint(btnAceptar, 'No se encontraron registros que coincidan' + #13 + #10 + 'con las condiciones especificadas.',
      Caption, blnWarning);
end;

procedure TfrmRptChequeReemplazados.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRptChequeReemplazados.qpReporteGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
  var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
{
  if sdqReporte.FieldByName('CORTE').asString = '1' then
  begin
    ABackground := clSilver;
    if Field.DataField = 'MONTO' Then
      rTotal := rTotal + Field.Field.AsCurrency;
  end;
  if sdqReporte.FieldByName('CORTE').asString = '2' then
    if Field.DataField = 'MONTO' Then
      rTotal2 := rTotal2 + Field.Field.AsCurrency;
}
end;

procedure TfrmRptChequeReemplazados.qpReporteReportBegin(Sender: TObject);
begin
{
  rTotal := 0;
  rTotal2:= 0;
}
end;

procedure TfrmRptChequeReemplazados.qpReporteGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
{
  if Field.DataField = 'MONTO' Then
    Value := 'Emitidos: ' + CurrToStr(rTotal) + #10#13 + 'Reemplazados: ' + CurrToStr(rTotal2);
}
end;

end.
