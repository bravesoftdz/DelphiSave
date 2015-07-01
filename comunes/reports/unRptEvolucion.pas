unit unRptEvolucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine,
  StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, SinEdit, Placemnt, Registros, General, ShortCutControl, unMoldeEnvioMail;

type
  TqrEvolucion = class(TQuickRep)
    dsEvolutivo: TDataSource;
    dsSiniestro: TDataSource;
    sdqSiniestro: TSDQuery;
    sdqEvolutivo: TSDQuery;
    grPIngreso: TQRGroup;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    lblColumna1: TQRLabel;
    lblColumna2: TQRLabel;
    lblColumna3: TQRLabel;
    lblColumna4: TQRLabel;
    lblColumna5: TQRLabel;
    lblColumna6: TQRLabel;
    lblColumna7: TQRLabel;
    lblColumna8: TQRLabel;
    lblColumna9: TQRLabel;
    lblColumna10: TQRLabel;
    lblColumna11: TQRLabel;
    QRBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlEmpDep: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    qrdbRec: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbNum: TQRDBText;
    qrdbPrest: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand6: TQRBand;
    QRLabel19: TQRLabel;
    QRShape14: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData6: TQRSysData;
    qrbSubTotales: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qriLogo: TQRImage;
    procedure lblColumna2Print(sender: TObject; var Value: String);
    procedure lblColumna3Print(sender: TObject; var Value: String);
    procedure lblColumna4Print(sender: TObject; var Value: String);
    procedure lblColumna5Print(sender: TObject; var Value: String);
    procedure lblColumna8Print(sender: TObject; var Value: String);
    procedure lblColumna10Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbSubTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    function GetGroupID: Integer; // by Fede 15/05/2000
  public
  end;

procedure DoGenerarReporte(Siniestro, Orden: Integer; Partes, Autorizac, Auditoria, PrestDin, PresteMed: Boolean;
                           TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList;
                           VistaPrevia: Boolean = False);

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, unExportPDF, unComunes, unSesion, unvisualizador;

{$R *.DFM}

procedure TqrEvolucion.lblColumna2Print(sender: TObject; var Value: String);
begin
  // EV_NUMERO
  case GetGroupID of
    0, 2: Value := '';
  else
    Value := 'Número';
  end;
end;

procedure TqrEvolucion.lblColumna3Print(sender: TObject; var Value: String);
begin
  // EV_PRESTADOR
  case GetGroupID of
    0 :         Value := 'Fecha Accidente/Recaída';
    1..4, 7, 8: Value := 'Prestador';
    5  :        Value := 'Concepto';
    6 :         Value := 'Beneficiario';
  end;
end;

procedure TqrEvolucion.lblColumna4Print(sender: TObject; var Value: String);
begin
  // EV_ESTADO
  case GetGroupID of
    0:  Value := 'Estado';
    2:  Value := 'T.Egreso';
  else
    Value := '';
  end;
end;

procedure TqrEvolucion.lblColumna5Print(sender: TObject; var Value: String);
begin
  // EV_DIAGNOSTICO
  case GetGroupID of
    0..3, 8:  Value := 'Diagnóstico';
  else
    Value := '';
  end;
end;

procedure TqrEvolucion.lblColumna8Print(sender: TObject; var Value: String);
begin
  // EV_PROXIMOCONTROL
  case GetGroupID of
    0..2, 4:  Value := '';
    3, 8   :  Value := 'PróxControl';
    5..7   :  Value := 'F.Aprob.';
  end;
end;

procedure TqrEvolucion.lblColumna10Print(sender: TObject; var Value: String);
begin
  Value := '';

  // EV_IMPORTE
  case GetGroupID of
    0..3: Value := '';
    4..7: Value := 'Importe';
  end
end;

procedure TqrEvolucion.QRDBText16Print(sender: TObject; var Value: String);
begin
  if sdqEvolutivo.FieldByName('EV_IMPORTE').AsFloat = 0 then
    Value := '';
end;

procedure TqrEvolucion.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Odd(sdqEvolutivo.RecNo) then
    Sender.Color := clWhite
  else
    Sender.Color := $00EAEAEA;
end;

function TqrEvolucion.GetGroupID: Integer;
var
  cGrupo: String;
begin
  cGrupo := sdqEvolutivo.FieldByName('ev_docu').AsString;
  Result := ArrayPos(cGrupo, ['Cabecera', 'P.Ingreso', 'P.Egreso', 'P.Evolutivo', 'Autorización', 'Liq. ILT/ILP',
                              'Liq. Otros Pagos', 'Liq. Pres. Med.', 'P.Auditoria']);
end;

procedure TqrEvolucion.qrbSubTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := GetGroupID in [4, 5, 6, 7];
end;

procedure DoGenerarReporte(Siniestro, Orden: Integer; Partes, Autorizac, Auditoria, PrestDin, PresteMed: Boolean;
                           TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList;
                           VistaPrevia: Boolean = False);
var
  bEsSinGobernacion: Boolean;
  rpt: TqrEvolucion;
  sFileName: String;
  sSql: String;
  iIdExpediente: Integer;
begin
  rpt := TqrEvolucion.Create(nil);
  with rpt do
  try
    iIdExpediente     := Get_IdExpediente(Siniestro, Orden, 0);
    bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExpediente);
    if bEsSinGobernacion then
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
      qrlEmpDep.Caption := 'Datos de la Dependencia';
    end
    else
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
      qrlEmpDep.Caption := 'Datos de la Empresa';
    end;

    qrlUsuario.Caption := Sesion.Usuario;
    sSql :=
      'SELECT ev_siniestro, ev_orden, ev_docu, ev_recaida, ev_numero, ev_prestador, ' +
            ' ev_estado, ev_diagnostico, ev_detalle, ev_observaciones, ev_proximocontrol, ' +
            ' ev_fechaalta, ev_importe, NVL(gp_nombre, siniestro.get_usuariogestor(ex_id)) GTrabajoGest, ' +
            ' ev_formapago' +
       ' FROM sex_expedientes, mgp_gtrabajo, mev_evolucion' +
      ' WHERE ex_siniestro = ev_siniestro' +
        ' AND ex_orden = ev_orden' +
        ' AND ex_recaida = ev_recaida' +
        ' AND ex_gtrabajo = gp_codigo' +
        ' AND ev_siniestro = :Sin ' +
        ' AND ev_orden = :Ord ' +
        ' AND ev_emiformu = ''S'' ';   // por ticket 62694

    if Partes or Autorizac or Auditoria or PrestDin or PresteMed then
    begin
      sSql := sSql + ' AND EV_TIPO IN (';
      if Partes    then sSql := sSql + '''B'', ''C'', ''D'', ';
      if Auditoria then sSql := sSql + '''E'', ';
      if Autorizac then sSql := sSql + '''F'', ';
      if PrestDin  then sSql := sSql + '''G'', ';
      if PresteMed then sSql := sSql + '''H'', ''I'', ';
      sSql := sSql + '''A'')';
    end;

    sSql := sSql + ' ORDER BY ev_tipo, ev_recaida, ev_numero ';   // por ticket 64022, coloco el orden por recaida.

    try
      OpenQueryEx(sdqEvolutivo, [Siniestro, Orden], sSql);

      with sdqSiniestro do
      begin
        Close;
        ParamByName('nSiniestro').AsInteger := Siniestro;
        ParamByName('nOrden').AsInteger     := Orden;
        Open;
      end;

      if TipoSalida = 'I' then
      begin
        PrinterSettings.Copies  := 1;
        if VistaPrevia then
          //PreviewModal
          Visualizar(rpt, GetValores(' - Siniestro: ' + Armar_Siniestro(Siniestro, Orden, 0)),
                    [oAlwaysShowDialog, oForceDB, oForceShowModal], True, '', '', sdqEvolutivo.RecordCount > 25)
        else
          Print;

      end
      else if TipoSalida = 'M' then
      begin
        sFileName := Get_NombreArchivoPDF('InfEvolucion', Siniestro, Orden, 0, '');
        ExportarPDF(rpt, sFileName);
        Cuerpo.Add('Informe de Evolución');
        AddAttach(sFileName, 0, vAdjuntos);
      end;
    except
      on E: Exception do ErrorMsg(E);
    end;
  finally
    free;
  end;
end;

end.
