unit unQRContratoNomina;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrContratoNomina = class(TQuickRep)
    sdqNomina: TSDQuery;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlCuil: TQRLabel;
    qrlNombre: TQRLabel;
    qrlCat: TQRLabel;
    qrlTarea: TQRLabel;
    qrlFechaMvto: TQRLabel;
    qrlFNacim: TQRLabel;
    qrlSexo: TQRLabel;
    qrlRemun: TQRLabel;
    qriLogoNom: TQRImage;
    QRShape2: TQRShape;
    qrbDetalle: TQRBand;
    qrdbNombre: TQRDBText;
    qrdbCat: TQRDBText;
    qrdbTarea: TQRDBText;
    qrdbFMvto: TQRDBText;
    qrdbFNacim: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbRemun: TQRDBText;
    qrdbCuil: TQRDBText;
    qrPagina: TQRExpr;
    qrFecha: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel6: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    procedure ImprimePagina(Sender: TObject; var Value: String);
    procedure ImprimeFecha(Sender: TObject; var Value: String);
    procedure ImprimeNroContrato(Sender: TObject; var Value: String);
    procedure ImprimeCuit(Sender: TObject; var Value: String);
    procedure ImprimeMonto(sender: TObject; var Value: String);
    function GenerarArchivo(aNombreArchivo: string): Boolean;
    function ConvierteACuit(aCadena: String): String;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FImprimeMembrete: Boolean;
  public
    function Preparar(aContrato: String; aNombreArchivo: String; const aGenerarPdf: Boolean): Boolean;

    property ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
  end;

var
  qrContratoNomina: TqrContratoNomina;

implementation

uses
  unDmPrincipal, unArt, Dialogs, Printers, CUIT, unExportPDF;

{$R *.DFM}

function TqrContratoNomina.GenerarArchivo(aNombreArchivo: String): Boolean;
var
  aArchivo: TextFile;
  sLinea: String;
begin
  AssignFile(aArchivo, aNombreArchivo);
  try
    try
      Rewrite(aArchivo);

      //Genero el encabezado del archivo
      sLinea := 'CUIT:' + Chr(9) + ConvierteACuit(sdqNomina.FieldByName('em_cuit').AsString) + Chr(9) + Chr(9) + Chr(9) +
                Chr(9) + DateToStr(Date);
      Writeln(aArchivo, sLinea);
      sLinea := 'Razón Social:' + Chr(9) + sdqNomina.FieldByName('em_nombre').AsString;
      Writeln(aArchivo, sLinea);
      Writeln(aArchivo, '');
      sLinea := 'CUIL' + Chr(9) + 'Nombre y Apellido' + Chr(9) + 'Categoría/Tarea' + Chr(9) +
                'Remuneración sujeta a aportes' + Chr(9) + 'F. de Nacim.' + Chr(9) + 'F. de Ingreso' + Chr(9);
      Writeln(aArchivo, sLinea);
      Writeln(aArchivo, '');

      // Genero el cuerpo del archivo con los trabajadores
      while not sdqNomina.Eof do
      begin
        sLinea := ConvierteACuit(sdqNomina.FieldByName('tj_cuil').AsString) + Chr(9) +
                                 sdqNomina.FieldByName('tj_nombre').AsString + Chr(9) +
                                 sdqNomina.FieldByName('rl_categoria').AsString + ' / ' + sdqNomina.FieldByName('rl_tarea').AsString  + Chr(9) +
                                 sdqNomina.FieldByName('rl_sueldo').AsString + Chr(9) +
                                 sdqNomina.FieldByName('tj_fnacimiento').AsString + Chr(9) +
                                 sdqNomina.FieldByName('rl_fechaingreso').AsString + Chr(9);
        Writeln(aArchivo, sLinea);
        sdqNomina.Next;
      end;
      sdqNomina.First;
      Result := True;
      
      MessageDlg('Se generó el archivo ' + aNombreArchivo, mtInformation, [mbOK], 0);
    except
      Result := False;

      MessageDlg('Se produjo un error al generar el archivo.', mtError, [mbOK], 0);
    end;
  finally
    CloseFile(aArchivo);
  end;
end;

function TqrContratoNomina.Preparar(aContrato: String; aNombreArchivo: String; const aGenerarPdf: Boolean): Boolean;
var
  sSql: String;
begin
  try
    sSql :=
      'SELECT   em_cuit, em_nombre, co_contrato, es_nombre, es_nroestableci,' +
              ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL)' +
              ' || art.utiles.armar_localidad(es_cpostal, es_cpostala, es_localidad, es_provincia) domicilio_establecimiento,' +
              ' tj_id, tj_cuil, tj_nombre, rl_categoria, rl_tarea, rl_fechaingreso, tj_fnacimiento, tj_sexo, rl_sueldo' +
         ' FROM aco_contrato, aem_empresa, aes_establecimiento, ctj_trabajador, crl_relacionlaboral, cre_relacionestablecimiento' +
        ' WHERE co_idempresa = em_id' +
          ' AND tj_id = rl_idtrabajador' +
          ' AND re_idrelacionlaboral = rl_id' +
          ' AND rl_contrato = co_contrato' +
          ' AND es_id = re_idestablecimiento' +
          ' AND co_contrato = :contrato' +
     ' ORDER BY es_nroestableci, tj_nombre';
    OpenQueryEx(sdqNomina, [aContrato], sSql, True);

    Result := not sdqNomina.Eof;
    qriLogoNom.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);

    if aGenerarPdf then
      FileToPDFSvr(qrContratoNomina, ExtractFileDir(aNombreArchivo), aNombreArchivo, True)
    else
    begin
      if Result and (aNombreArchivo <> '') then
        GenerarArchivo(aNombreArchivo);
      PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
    end;
  except
    Result := False;
  end;
end;

procedure TqrContratoNomina.ImprimePagina(Sender: TObject; var Value: String);
begin
  Value := 'Página: ' + Value;
end;

procedure TqrContratoNomina.ImprimeFecha(Sender: TObject; var Value: String);
begin
  Value := 'Fecha: ' + Value;
end;

procedure TqrContratoNomina.ImprimeNroContrato(Sender: TObject; var Value: String);
begin
  Value := Value + sdqNomina.FieldByName('co_contrato').AsString;
end;

procedure TqrContratoNomina.ImprimeCuit(Sender: TObject; var Value: String);
begin
  Value := ConvierteACuit(Value);
end;

function TqrContratoNomina.ConvierteACuit(aCadena: String): String;
begin
  Result := PonerGuiones(aCadena);
end;

procedure TqrContratoNomina.ImprimeMonto(Sender: TObject; var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffcurrency, 2);
end;

procedure TqrContratoNomina.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qriLogoNom.Enabled := ImprimeMembrete;
end;

end.
