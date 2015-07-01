unit unRptNotaPagoBancoLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt;
               
type
  TBeneficiario = (beBancoCiudadBsAs, beBancoNacionArg, beOtrosBanco);

  TqrNotaPagoBancoLegales = class(TqrMoldeCarta)
    ChildBand1: TQRChildBand;
    qrTexto: TQRMemo;
    qrTextoAdicional: TQRMemo;
    qrlDestinatario2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    qrlImporte: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    qrlDescrImporte: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRMemo1: TQRMemo;
    qrlCuenta: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlNroCheque: TQRLabel;
    qrlEmitidoA: TQRLabel;
  private
  public
  end;                                 

  procedure DoImprimirNotaBancoLegales(IdCheque: TTableId; Beneficiario: TBeneficiario; Banco: String);

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros;

{$R *.dfm}

procedure DoImprimirNotaBancoLegales(IdCheque: TTableId; Beneficiario: TBeneficiario; Banco: String);
var
  rpt: TqrNotaPagoBancoLegales;
  sTexto, sSql: String;
begin
  rpt := TqrNotaPagoBancoLegales.Create(nil);

  with rpt do
    try
      sSql := 'SELECT CE_NUMERO NROCHEQUE, CE_MONTO IMPORTE, CB_NUMERO CUENTA ' +
                'FROM ZCB_CUENTABANCARIA, RCE_CHEQUEEMITIDO ' +
               'WHERE CE_ID = :IdCheque ' +
                 'AND CE_IDCUENTABANCARIA = CB_ID';

      with GetQueryEx(sSql, [IdCheque]) do
        try
          if FieldByName('NROCHEQUE').IsNull then
            MsgBox('No se ha encontrado la liquidación para el cheque Nro. ' + IntToStr(IdCheque), MB_ICONERROR)
          else
            begin
              Fecha          := DBDate();
              ShowReferencia := False;
              ShowLogoGBP    := False;

              Destinatario := 'Señor Gerente del';

              qrlNroCheque.Caption    := FieldByName('NROCHEQUE').AsString;

              case Beneficiario of
                beBancoCiudadBsAs:
                  qrlEmitidoA.Caption := 'Banco de la Ciudad de Buenos Aires';
                beBancoNacionArg:
                  qrlEmitidoA.Caption := 'Banco de la Nación Argentina';
                beOtrosBanco:
                  qrlEmitidoA.Caption := Banco;
              end;

              qrlImporte.Caption      := Get_AjusteDecimales(FieldByName('IMPORTE').AsString, '$');
              qrlDescrImporte.Caption := LowerCase(NumLetras(FieldByName('IMPORTE').AsCurrency, 2, True));
              qrlCuenta.Caption       := FieldByName('CUENTA').AsString;

              sTexto :=  'el que estimaremos quiera Ud. ordenar sea certificado por el día de hoy y hasta el ___/___/___' + CRLF +
                         '(máximo 5 días hábiles a la fecha).' + CRLF + CRLF + 
                         'En consecuencia autorizamos a ese Banco para que el importe del referido cheque más la comisión ' +
                         'y gastos correspondientes sean debitados en nuestra cuenta corriente, reintegrándolo a la misma si ' +
                         'transcurrido el plazo de su certificación no fuera presentado para su cobro.' + CRLF +
                         'Autorizamos a retirar el/los mismos al/la Sr./Sra. ____________________________________________' + CRLF +
                         'Con D.N.I. _______________________';
              qrTextoAdicional.Lines.Text := sTexto;

              rpt.Print;
            end;
        finally
          Free;
        end;
    finally
      Free;
    end;
end;

end.

