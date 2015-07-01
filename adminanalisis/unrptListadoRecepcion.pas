unit unrptListadoRecepcion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, DB, SDEngine, QuickRpt, ExtCtrls;

type
  TrptListadoRecepcion = class(TForm)
    qrResolucion: TQuickRep;
    QRBand2: TQRBand;
    logo: TQRImage;
    QRShape1: TQRShape;
    lbEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    lbFirma: TQRLabel;
    lbLote: TQRLabel;
    QRLabel16: TQRLabel;
    sdqEmpresa: TSDQuery;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRShape5: TQRShape;
    QRDBText4: TQRDBText;
    QRShape6: TQRShape;
    QRDBText5: TQRDBText;
    QRShape7: TQRShape;
    QRLabel2: TQRLabel;
    QRShape8: TQRShape;
    QRDBText6: TQRDBText;
    QRShape9: TQRShape;
    QRDBText7: TQRDBText;
    QRShape10: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Load(Observaciones: String);
    procedure Mostrar;
    procedure Imprimir;
    { Public declarations }
  end;

var
  rptListadoRecepcion: TrptListadoRecepcion;

implementation

{$R *.dfm}

uses unVisualizador, unDmPrincipal, AnsiSql, Types;

procedure TrptListadoRecepcion.FormCreate(Sender: TObject);
begin
  sdqEmpresa.ParamByName('observaciones').AsString := '';
  Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TrptListadoRecepcion.Imprimir;
begin
  qrResolucion.Print;
end;

procedure TrptListadoRecepcion.Load(Observaciones: String);
begin
  sdqEmpresa.SQL.Text :=
   '  SELECT DISTINCT em_nombre , le_id, '+
   '                  el_operativo '+
   '                  || '' '' '+
   '                  || (SELECT TO_CHAR (MAX (le_fechanotificacion), ''YY'') '+
   '                  FROM hys.hel_estadolote '+
   '                  WHERE el_idlote = le_id) operativo, '+
   '                  os_fecha, os_FECHARECEPCIONUCAP,es_nroestableci, '+
   '                  ca_identificador, ca_descripcion, '+
   '             DECODE (os_idtipoobservacion, 6, ''R'', '''') res, os_idproceso '+
   '             FROM hys.hle_loteestudio, '+
   '                  hys.hdl_detallelote, '+
   '                  hys.hrl_relevamientolote, '+
   '                  art.cpr_prestador, '+
   '                  hys.hel_estadolote, '+
   '                  afi.aem_empresa, '+
   '                  hys.hos_observacionessublote, '+
   '                  afi.aes_establecimiento '+
   '            WHERE dl_idlote = le_id '+
   '              AND rl_idestableci = dl_idestableci '+
   '              AND ca_identificador = le_idprestador '+
   '              AND em_id = dl_idempresa '+
   '              AND es_id = dl_idestableci '+
   '              AND el_rlid = rl_id '+
   '              AND el_idlote = le_id '+
   '              AND le_id = os_idlote '+
   '              AND os_idtipoobservacion in (8,6) '+
   '              AND os_idestableci = dl_idestableci '+
   '              AND le_reconfirmacion = ''N'' '+
   '              AND os_id in ( '+observaciones +')';

  sdqEmpresa.Open;
end;

procedure TrptListadoRecepcion.Mostrar;
begin
  Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
end;

end.
