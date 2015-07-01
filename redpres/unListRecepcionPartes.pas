unit unListRecepcionPartes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, QRCtrls,
  QuickRpt, Menus, unfraPrestador, unArtFrame, unArtDBAwareFrame, unArtDbFrame;

type
  TfrmListRecepcionPartes = class(TfrmCustomConsulta)
    sdqDetalle: TSDQuery;
    dsDetalle: TDataSource;
    sdqDetalleLINEA: TFloatField;
    sdqDetalleSINIESTRO: TStringField;
    sdqDetalleCUIL: TStringField;
    sdqDetalleDNI: TStringField;
    sdqDetalleNOMBREACCIDENTADO: TStringField;
    sdqDetalleFECHASINIESTRO: TStringField;
    sdqDetalleNOMBREEMPRESA: TStringField;
    sdqDetalleFECHACONTROL: TStringField;
    sdqDetalleFECHAPROXCONTROL: TStringField;
    sdqDetalleOBSERVACIONES: TStringField;
    sdqDetalleCUITPRESTADOR: TStringField;
    sdqDetalleNOMBREPRESTADOR: TStringField;
    sdqDetalleERROR: TStringField;
    sdqConsultaID: TFloatField;
    sdqConsultaNOMBREARCHIVO: TStringField;
    sdqConsultaFECHAPROCESO: TDateTimeField;
    sdqConsultaNOMBREPRESTADOR: TStringField;
    sdqConsultaCONERROR: TFloatField;
    sdqConsultaCORRECTOS: TFloatField;
    sdqConsultaARCHIVO: TStringField;
    sdqConsultaTIPOPARTE: TStringField;
    ScrollBox1: TScrollBox;
    qrRecepcion: TQuickRep;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    pmImprimir: TPopupMenu;
    MnuImpConError: TMenuItem;
    MnuImpSinError: TMenuItem;
    pmExportar: TPopupMenu;
    MnuExpConError: TMenuItem;
    MnuExpSinError: TMenuItem;
    gbPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    gbFechaProceso: TGroupBox;
    dcFechaProceso: TDateComboBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure MnuImpConErrorClick(Sender: TObject);
    procedure MnuExpConErrorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetSqlExportar(bConError: Boolean): String;
  public
  end;

var
  frmListRecepcionPartes: TfrmListRecepcionPartes;

implementation

{$R *.DFM}

uses
  AnsiSql, Strfuncs, unDmPrincipal;

procedure TfrmListRecepcionPartes.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT id, nombrearchivo, fechaproceso, conerror, correctos, nombreprestador' +
     ' FROM art.tmp_partediariocabecera' +
    ' WHERE 1 = 1';
  if not dcFechaProceso.IsEmpty then
    sSql := sSql + ' AND fechaproceso = ' + SqlDate(dcFechaProceso.Date);
  if not fraPrestador.IsEmpty then
    sSql := sSql + ' AND idprestador = ' + SqlInt(fraPrestador.IDPrestador);

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;

procedure TfrmListRecepcionPartes.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  dcFechaProceso.Clear;
  fraPrestador.Limpiar;
end;

procedure TfrmListRecepcionPartes.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;
end;

procedure TfrmListRecepcionPartes.sdqConsultaCalcFields(DataSet: TDataSet);
var
  vTmp: String;
begin
  DataSet.FieldByName('ARCHIVO').AsString := ExtractFileName(DataSet.FieldByName('NOMBREARCHIVO').AsString);
  vTmp := ExtractFileExt(DataSet.FieldByName('NOMBREARCHIVO').AsString);
  if (UpperCase(vTmp) = '.EFP') then //habría que hacer un ctb_tablas...
    DataSet.FieldByName('TIPOPARTE').AsString := 'Partes Evolutivos';
end;

procedure TfrmListRecepcionPartes.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmListRecepcionPartes.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  if sdqConsulta.Active and not (sdqConsulta.Eof) and
     (MessageDlg('¿ Confirma procesar nuevamente el/los archivo/s seleccionado/s ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqconsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
      if (sdqConsultaCONERROR.AsInteger > 0) then
      begin
        sSql := 'art.varios.do_reprocesarpartesimpoexpo(' + SqlInt(sdqConsultaID.AsInteger) + ');';
        EjecutarStore(sSql);
      end;
    end;

  tbRefrescarClick(nil);
end;

procedure TfrmListRecepcionPartes.MnuImpConErrorClick(Sender: TObject);
begin
  if sdqConsulta.Active and not(sdqConsulta.Eof) then
  begin
    sdqDetalle.Close;
    if (Sender = MnuImpConError) then
    begin
      sdqDetalle.SQL.Text := GetSqlExportar(True);
      qrlTitulo.Caption := 'Listado de errores encontrados en importación de ' + sdqConsultaARCHIVO.AsString;
    end
    else
    begin
      sdqDetalle.SQL.Text := GetSqlExportar(False);
      qrlTitulo.Caption := 'Listado de registros procesados correctamente en importación de ' + sdqConsultaARCHIVO.AsString;
    end;
    sdqDetalle.Open;
    qrRecepcion.Preview;
  end;
end;

procedure TfrmListRecepcionPartes.MnuExpConErrorClick(Sender: TObject);
begin
  if sdqConsulta.Active and not (sdqConsulta.Eof) then
  begin
    sdqDetalle.Close;
    if (Sender = MnuExpConError) then
    begin
      sdqDetalle.SQL.Text := GetSqlExportar(True);
      ExportDialog.Title := 'Listado de errores encontrados en importación de ' + sdqConsulta.FieldByName('ARCHIVO').AsString;
      ExportDialog.Fields[12].Save := True;
    end
    else
    begin
      sdqDetalle.SQL.Text := GetSqlExportar(False);
      ExportDialog.Title := 'Listado de registros procesados correctamente en importación de ' + sdqConsulta.FieldByName('ARCHIVO').AsString;
      ExportDialog.Fields[12].Save := False;
    end;
    sdqDetalle.Open;
    ExportDialog.OutputFile := sdqConsulta.FieldByName('ARCHIVO').AsString;
    ExportDialog.Execute;
  end;
end;

function TfrmListRecepcionPartes.GetSqlExportar(bConError: Boolean): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT linea, siniestro, cuil, dni, nombreaccidentado, fechasiniestro, nombreempresa, fechacontrol,' +
          ' fechaproxcontrol, observaciones, cuitprestador, nombreprestador, error' +
     ' FROM art.tmp_partediariodetalle' +
    ' WHERE idcabecera = ' + SqlInt(sdqConsultaID.AsInteger);
  if bConError then
    sSql := sSql + ' AND procesocorrecto = ''N'' ORDER BY linea'
  else
    sSql := sSql + ' AND procesocorrecto = ''S'' ORDER BY linea';

  Result := sSql;
end;

procedure TfrmListRecepcionPartes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
