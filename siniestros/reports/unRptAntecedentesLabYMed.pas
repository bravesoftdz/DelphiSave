unit unRptAntecedentesLabYMed;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls, unComunes, General, CUIT, unVisualizador,
  unDmPrincipal, AnsiSql, unMoldeEnvioMail, unExportPDF;

type
  TfrmRptAntecedentesLabYMed = class(TForm)
    qrAntecedentesLabYMed: TQuickRep;
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlExpedienteSRT: TQRLabel;
    qrlExpedienteMedico: TQRLabel;
    qrlTrabajador: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlCUIL: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    qrlART: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Preparar(iSiniestro, iOrden, iRecaida: Integer; sTipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
  end;

const
  cVENTANILLA_CARDEFILP = 71;    // Ventanilla Electrónica: nuevo motivo "Caracter Definitivo de la ILP" (en ventanilla "6 - Comisiones médicas").

var
  frmRptAntecedentesLabYMed: TfrmRptAntecedentesLabYMed;

implementation

{$R *.dfm}

{ TfrmRptAntecedentesLabYMed }

procedure TfrmRptAntecedentesLabYMed.Preparar(iSiniestro, iOrden, iRecaida: Integer; sTipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var iIdExped: integer; sSql, sFileName: string;

begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  if Is_SiniestroDeGobernacion(iIdExped) then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlART.Caption := 'Autoaseguradora Gobernación de la Pcia. de Bs. As.';
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
    qrlART.Caption := 'ART Provincia';
  end;

  qrlFecha.Caption := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');

  sSql := 'SELECT ex_cuil, tj_nombre ' +
           ' FROM art.sex_expedientes, ctj_trabajador ' +
          ' WHERE ex_idtrabajador = tj_id  ' +
            ' AND ex_id = :id ';
  with GetQueryEx(sSql, [iIdExped]) do
  begin
    qrlCuil.Caption       := PonerGuiones(FieldByName('EX_CUIL').AsString);
    qrlTrabajador.Caption := FieldByName('TJ_NOMBRE').AsString;
  end;

  // Expediente SRT N°
  sSql := 'SELECT vr_nroreclamo_srt ' +
           ' FROM comunes.cvr_ventanilla_reclamos, COMUNES.CVS_VENTANILLA_SUBTEMAS ' +
          ' WHERE vr_idexpediente = :idexped ' +
            ' AND vs_id = vr_idsubtema ' +
            ' AND vs_id = ' + SqlInt(cVENTANILLA_CARDEFILP);   // explicado por Karina Szeinkop
  qrlExpedienteSRT.Caption := ValorSqlEx(sSql, [iIdExped]);

  // Nro Expediente Médico (Expediente de Incapacidad)
  sSql := 'SELECT ix_expedincapacidad FROM six_expedientesincapacidad A ' +
          ' WHERE A.ix_idexpediente = :idexped ' +
            ' AND A.ix_fbaja is null ' +
            ' AND A.ix_contador = (SELECT max(B.ix_contador) ' +    // Ultimo Exped. Incap. ingresado (Tal cual me informo Karina)
                                   ' FROM six_expedientesincapacidad B ' +
                                  ' WHERE B.ix_idexpediente = A.ix_idexpediente ' +
                                    ' AND B.ix_fbaja is null) ';
  qrlExpedienteMedico.Caption := ValorSqlEx(sSql, [iIdExped]);


  if sTipoSalida = 'I' then //impresora
    qrAntecedentesLabYMed.Print
  else if sTipoSalida = 'M' then //mail
  begin
    sFileName := Get_NombreArchivoPDF('DocumPrestDin', iSiniestro, iOrden, iRecaida, '');
    ExportarPDF(qrAntecedentesLabYMed, sFileName);
    Cuerpo.Add('Documentación Prestaciones Dinerarias');
    AddAttach(sFileName, 0, vAdjuntos);
  end;


end;

end.
