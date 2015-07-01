unit unReimprimirVolantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVolante, StdCtrls, unRptVolante, Buttons, Placemnt, artSeguridad;

type
  TfrmReimprimirVolante = class(TForm)
    btnSalir: TBitBtn;
    btnConfPrn: TBitBtn;
    btnImprimir: TBitBtn;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    grpVolante: TGroupBox;
    fraVolantes: TfraVolantes;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfPrnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    rptVolante: TrptVolante;
  public
  end;

var
  frmReimprimirVolante: TfrmReimprimirVolante;

Const
  sTabHead = 'TMP_';

implementation

uses unPrincipal, unDmPrincipal, strFuncs, SDOra, Numeros, CustomDlgs, General;

{----------------------------------------------------------------------------------------------------------------------}
{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.FormCreate(Sender: TObject);
begin
    rptVolante := TrptVolante.Create( Self );
    rptVolante.PrinterSettings.Copies := 1;

    fraVolantes.Temporal := True;
//    fraVolantes.sdqBusqueda.SQL.Text := strReplace(fraVolantes.sdqBusqueda.SQL.Text, 'SVO_VOLANTES', 'TMP_SVO_VOLANTES');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.FormDestroy(Sender: TObject);
begin
    rptVolante.Free ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.btnConfPrnClick(Sender: TObject);
begin
    rptVolante.PrinterSetup;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.btnSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmReimprimirVolante.btnImprimirClick(Sender: TObject);
begin
   if fraVolantes.edNumero.Value > 0 Then
      Try
          With rptVolante.sdqConsulta do begin
            Close;
            Sql.Text  := 'SELECT ''*'' || SUBSTR(''00000000'',1,8-LENGTH(TO_CHAR(VO_VOLANTE))) || TO_CHAR(VO_VOLANTE) || ''*'' CODBARRAS, ' +
                                 'SUBSTR(''00000000'',1,8-LENGTH(TO_CHAR(VO_VOLANTE))) || TO_CHAR(VO_VOLANTE) VOLANTE, ' +
                                 'VO_FACTURATIPO || ''-'' || VO_FACTURAESTABLE  || ''-'' ||  VO_FACTURANRO FACTURA, ' +
                                 'VO_VOLANTE, VO_PRESTADOR, VO_FACTURATIPO, VO_FACTURAESTABLE, VO_FACTURANRO, VO_FECHAFACTURA, ' +
                                 'VO_MONTO, VO_VENCIMIENTO, VO_OBSERVACIONES, VO_FECHARECEPCION, VO_FECHALTA, CA_CLAVE, ' +
                                 'CA_DESCRIPCION, CA_ASISTENCIAL, ' +
                                 'LG_NOMBRE, TB_DESCRIPCION TIPCOMPROBANTE, VO_CHEQUENOMBRE, VO_USUALTA, VO_REFACTURACION, VO_ESTADO, ' +
                                 'utiles.iif_char (cp_cbu1, NULL, NULL, cp_cbu1 || ''-'' || cp_cbu2) CBU, ca_esreferente ' +
                            'FROM ' + sTabHead + 'SVO_VOLANTES, CPR_PRESTADOR, DLG_DELEGACIONES, CTB_TABLAS, CCP_CUENTAPAGO ' +
                           'WHERE CA_IDENTIFICADOR = VO_PRESTADOR ' +
                             'AND LG_CODIGO (+) = VO_DELEGACION ' +
                             'AND TB_CLAVE (+)= ''TCOMP'' ' +
                             'AND TB_CODIGO (+)= CA_TIPOCOMPROBANTE ' +
                             'AND CA_IDENTIFICADOR = CP_IDACREEDOR(+) ' +
                             'AND CP_TIPOACREEDOR(+) = ''CA'' ' +
                             'AND VO_VOLANTE = ' + fraVolantes.edNumero.TextSql ;
            Open;
          end;
          Application.ProcessMessages ; // Fede (Para ver si se soluciona el problema del interior)
          rptVolante.Print ;
          Application.ProcessMessages ; // Fede (Para ver si se soluciona el problema del interior)
      except
          MsgBox('Error al Imprimir el Volante.' + #13 + 'El volante no se podrá imprimir.', MB_ICONERROR);
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
