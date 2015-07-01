unit unFijarImportesSentSumario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ToolEdit,
  DateComboBox, CurrEdit, Mask, ExtCtrls, FormPanel, unFraToolbarRTF, unArtFrame, Grids, DBGrids, ToolWin, DB, SDEngine,
  unDmLegales, RxRichEd, JvComponent, unSesion, Placemnt, RXDBCtrl, unArtDBAwareFrame, unDmPrincipal, AnsiSql, SqlFuncs,
  VCLExtra, unConstLegales, CustomDlgs, DBSql, Math, unCustomDataModule, ExComboBox;

type
  TfrmFijarImportesSentSumario = class(TForm)
    bvSeparadorBotones: TBevel;
    btnAceptarSentencia: TButton;
    btnCancelarFijarSentencia: TButton;
    sdqPagoSentSumario: TSDQuery;
    dsPagoSentSumario: TDataSource;
    lblImporteIntereses: TLabel;
    sdqImportesSentenciaSumario: TSDQuery;
    dsImportesSentenciaSumario: TDataSource;
    FormStorage1: TFormStorage;
    sdqSumaImportes: TSDQuery;
    pgSentencia: TPageControl;
    tsImportesRegulados: TTabSheet;
    cbEdicionImportesRegulados: TCoolBar;
    tbImportesRegulados: TToolBar;
    tbIngresoValor: TToolButton;
    tbEdicionValor: TToolButton;
    tbEliminarValor: TToolButton;
    ToolButton4: TToolButton;
    tbImprimirValores: TToolButton;
    dbgImportesSentSumario: TRxDBGrid;
    edTasaJust: TCurrencyEdit;
    edMultaTJust: TCurrencyEdit;
    edMulta: TCurrencyEdit;
    edHonorariosPropios: TCurrencyEdit;
    edHonorariosOponentes: TCurrencyEdit;
    edCostas: TCurrencyEdit;
    edGastos: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edTotal: TCurrencyEdit;
    fpImportes: TFormPanel;
    btnOkImporte: TButton;
    btnCancelarImporte: TButton;
    Label9: TLabel;
    edImporteSentencia: TCurrencyEdit;
    lblDetalle: TLabel;
    edObservaciones: TEdit;
    lblAplicacion: TLabel;
    GroupBox1: TGroupBox;
    lblImporteSRet: TLabel;
    lblImporteSinRet: TLabel;
    edImporteSinRet: TCurrencyEdit;
    edImporteConRet: TCurrencyEdit;
    cbAplicacion: TExComboBox;
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure GuardarDatosSentenciaEnSumario;
    procedure tbIngresoValorClick(Sender: TObject);
    procedure tbEdicionValorClick(Sender: TObject);
    procedure tbEliminarValorClick(Sender: TObject);
    procedure dbgImportesSentSumarioGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      																						Highlight: Boolean);
    procedure edMultaChange(Sender: TObject);
    procedure btnOkImporteClick(Sender: TObject);
  private
    FHonorariosOponentes: Boolean;
    FIdImporte: LongInt;
    FIdSumario: Integer;
    FModoFijarSentencia: TModoEjecucion;

    procedure AsignarTotales;
    procedure CargarDatosSentencia;
    procedure GrabarImporteSentencia(AModo: TModoEjecucion);
    procedure Init;
    procedure LimpiarCamposSentencia;
  public
    procedure FijarSentencia(AIdSumario: Integer; AHonorariosOponentes: Boolean);
  end;

implementation

{$R *.dfm}

procedure TfrmFijarImportesSentSumario.Init;
begin
	with sdqPagoSentSumario do
  begin
  	Close;
   	ParamByName('idSumario').AsInteger := FIdSumario;
   	Open;
  end;

  with sdqImportesSentenciaSumario do
  begin
  	Close;
    ParamByName('idSumario').AsInteger := FIdSumario;
    Open;
  end;

  with sdqSumaImportes do
  begin
    Close;
    ParamByName('idSumario').AsInteger := FIdSumario;
    Open;
  end;

  AsignarTotales
end;

procedure TfrmFijarImportesSentSumario.LimpiarCamposSentencia;
begin
  edImporteSentencia.Clear;
  edImporteSinRet.Clear;
  edImporteConRet.Clear;
  edObservaciones.Clear;
  cbAplicacion.ItemIndex := -1
end;

procedure TfrmFijarImportesSentSumario.CargarDatosSentencia;
var
	sSql: String;
begin
	sSql :=
		'SELECT su_multasentecia, su_costas, su_gastos, su_honorariosabogadospropios, su_honorariosabogadoopenente,' +
    			' su_tasasjusticia, su_multatasasjusticia' +
     ' FROM legales.lsu_sumario ' +
    ' WHERE su_id = ' + SqlValue(FIdSumario);
  with GetQuery(sSql) do
  try
    if IsEmpty then
      FModoFijarSentencia := meAlta
    else
    begin
      FModoFijarSentencia := meModificacion;

      edMulta.Value               := FieldByName('su_multasentecia').AsCurrency;
      edHonorariosPropios.Value   := FieldByName('su_honorariosabogadospropios').AsCurrency;
      edHonorariosOponentes.Value := FieldByName('su_honorariosabogadoopenente').AsCurrency;
      edCostas.Value              := FieldByName('su_costas').AsCurrency;
      edGastos.Value              := FieldByName('su_gastos').AsCurrency;
      edTasaJust.Value            := FieldByName('su_tasasjusticia').AsCurrency;
      edMultaTJust.Value          := FieldByName('su_multatasasjusticia').AsCurrency;
		end;
  finally
  	Free;
  end;
end;

procedure TfrmFijarImportesSentSumario.GuardarDatosSentenciaEnSumario;
var
	sSql: String;
begin
  try
  	sSql :=
			'UPDATE legales.lsu_sumario' +
      	' SET su_multasentecia = ' + SqlValue(edMulta.Value) +
        	 ', su_costas = ' + SqlValue(edCostas.Value) +
           ', su_gastos = ' + SqlValue(edGastos.Value) +
           ', su_honorariosabogadospropios = ' + SqlValue(edHonorariosPropios.Value) +
           ', su_honorariosabogadoopenente = ' + SqlValue(edHonorariosOponentes.Value) +
           ', su_tasasjusticia = ' + SqlValue(edTasaJust.Value) +
           ', su_multatasasjusticia = ' + SqlValue(edMultaTJust.Value) +
      ' WHERE su_id = ' + SqlInteger(FIdSumario);
    EjecutarSqlST(sSql);

    Close;
  except
    on E: Exception do
    	raise Exception.Create('Error al guardar sumario. ' + E.Message);
  end;
end;

procedure TfrmFijarImportesSentSumario.AsignarTotales;
begin
  edMulta.Clear;
  edHonorariosPropios.Clear;
  edHonorariosOponentes.Clear;
  edCostas.Clear;
  edGastos.Clear;
  edTasaJust.Clear;
  edMultaTJust.Clear;

  with sdqSumaImportes do
  begin
    Refresh;
    First;

    while not EoF do
    begin
    	case Char(FieldByName('is_aplicacion').AsString[1]) of
        'M': edMulta.Value               := FieldByName('Total').AsCurrency;
        'H': edHonorariosPropios.Value   := FieldByName('Total').AsCurrency;
        'O': edHonorariosOponentes.Value := FieldByName('Total').AsCurrency;
        'C': edCostas.Value              := FieldByName('Total').AsCurrency;
        'G': edGastos.Value              := FieldByName('Total').AsCurrency;
        'T': edTasaJust.Value            := FieldByName('Total').AsCurrency;
        'U': edMultaTJust.Value          := FieldByName('Total').AsCurrency;
      end;

      Next;
    end
  end
end;

procedure TfrmFijarImportesSentSumario.tbIngresoValorClick(Sender: TObject);
begin
  fpImportes.Caption := 'Alta Importe Sentencia';
  LimpiarCamposSentencia;

  if fpImportes.ShowModal <> mrCancel then
  begin
    GrabarImporteSentencia (meAlta);
    sdqImportesSentenciaSumario.Refresh;
    AsignarTotales;
  end;
end;

procedure TfrmFijarImportesSentSumario.tbEdicionValorClick(Sender: TObject);
begin
  if sdqImportesSentenciaSumario.IsEmpty then
    Exit;

  if not sdqImportesSentenciaSumario.FieldByName('is_fechabaja').IsNull then
  begin
    ShowMessage('El importe de sentencia a sido dado de baja.' + #13#10 +
                'Sus datos no pueden ser modificados.');
    Exit;
  end;

  if sdqImportesSentenciaSumario.FieldByName('is_nropago').AsInteger > 0 then
  begin
    ShowMessage(Format('El importe de sentencia ha sido asignado al Nº de Pago %d.' + #13#10 +
                       'Sus datos no pueden ser modificados.',
                       [sdqImportesSentenciaSumario.FieldByName('is_nropago').AsInteger]));
    Exit;
  end;

  fpImportes.Caption := 'Modificación Importe Sentencia';
  LimpiarCamposSentencia;

  FIdImporte 							 := sdqImportesSentenciaSumario.FieldByName('is_id').AsInteger;
  edImporteSentencia.Value := sdqImportesSentenciaSumario.FieldByName('is_importesentencia').AsFloat;
  edImporteSinRet.Value    := sdqImportesSentenciaSumario.FieldByName('is_importesinret').AsFloat;
  edImporteConRet.Value    := sdqImportesSentenciaSumario.FieldByName('is_importe').AsFloat;
  edObservaciones.Text     := sdqImportesSentenciaSumario.FieldByName('is_detalle').AsString;
  cbAplicacion.Value       := sdqImportesSentenciaSumario.FieldByName('is_aplicacion').AsString;

  if fpImportes.ShowModal <> mrCancel then
  begin
    GrabarImporteSentencia (meModificacion);
    sdqImportesSentenciaSumario.Refresh;
    AsignarTotales;
  end;
end;

procedure TfrmFijarImportesSentSumario.tbEliminarValorClick(Sender: TObject);
var
	sSql: String;
begin
  if not sdqImportesSentenciaSumario.FieldByName('is_fechabaja').IsNull then
  begin
    ShowMessage('El importe de sentencia ya ha sido dado de baja.');
    Exit;
  end;

  if sdqImportesSentenciaSumario.FieldByName('is_nropago').AsInteger > 0 then
  begin
    ShowMessage(Format('El importe ha sido asignado al Nº de Pago %d.' + #13#10 + 'No puede darse de baja.',
                       [sdqImportesSentenciaSumario.FieldByName('is_nropago').AsInteger]));
    Exit;
  end;

  sSql :=
		'UPDATE legales.lis_importesentenciasumario' +
    	' SET is_usubaja = ' + SqlValue(Sesion.LoginName) +
      	 ', is_fechabaja = ' + SqlDateTime(DBDateTime) +
    ' WHERE is_id = ' + SqlInteger(sdqImportesSentenciaSumario.FieldByName('is_id').AsInteger);
  EjecutarSqlST(sSql);

  sdqImportesSentenciaSumario.Refresh;
  AsignarTotales;
end;

procedure TfrmFijarImportesSentSumario.dbgImportesSentSumarioGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
																																					 var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('is_fechabaja').IsNull then
    AFont.Color := clRed;

  if Field.DataSet.FieldByName('is_nropago').AsInteger > 0 then
    AFont.Color := clBlue;
end;

procedure TfrmFijarImportesSentSumario.FijarSentencia(AIdSumario: Integer; AHonorariosOponentes: Boolean);
begin
  FIdSumario := AIdSumario;
  FHonorariosOponentes := AHonorariosOponentes;

  CargarDatosSentencia;
  Init;

  Self.ShowModal;
end;

procedure TfrmFijarImportesSentSumario.btnAceptarSentenciaClick(Sender: TObject);
begin
  GuardarDatosSentenciaEnSumario
end;

procedure TfrmFijarImportesSentSumario.edMultaChange(Sender: TObject);
begin
  edTotal.Value :=
  	edMulta.Value +
    edHonorariosPropios.Value +
    edHonorariosOponentes.Value +
    edCostas.Value +
    edGastos.Value +
    edTasaJust.Value +
    edMultaTJust.Value
end;

procedure TfrmFijarImportesSentSumario.GrabarImporteSentencia(AModo: TModoEjecucion);
var
	sSqlTrans: TSql;
begin
  sSqlTrans := TSql.Create('legales.lis_importesentenciasumario');

  try
    sSqlTrans.Fields.AddInteger('is_idsumario',        FIdSumario);
    sSqlTrans.Fields.Add       ('is_importesinret',    edImporteSinRet.Value);
    sSqlTrans.Fields.Add       ('is_importe',          edImporteConRet.Value);
    sSqlTrans.Fields.Add       ('is_importesentencia', edImporteSentencia.Value);
    sSqlTrans.Fields.AddString ('is_detalle',          edObservaciones.Text, True);
    sSqlTrans.Fields.AddString ('is_aplicacion',       cbAplicacion.Value, True);

    if AModo = meAlta then
    begin
      sSqlTrans.SqlType := stInsert;
      FIdImporte := GetSecNextVal('legales.seq_lis_id');

      sSqlTrans.Fields.AddInteger('is_id', 				 FIdImporte);
      sSqlTrans.Fields.AddString('is_usualta', 		 Sesion.LoginName);
      sSqlTrans.Fields.AddDateTime('is_fechaalta', DBDateTime);
    end
    else
    begin
      sSqlTrans.SqlType := stUpdate;

      sSqlTrans.PrimaryKey.Add('is_id', 						FIdImporte);
      sSqlTrans.Fields.AddString('is_usumodif', 		Sesion.LoginName);
      sSqlTrans.Fields.AddDateTime('is_fechamodif', DBDateTime);
    end;

    EjecutarSQLST(sSqlTrans.Sql, tmNone)
  finally
    sSqlTrans.Free
  end
end;

procedure TfrmFijarImportesSentSumario.btnOkImporteClick(Sender: TObject);
{
var
  SumaImportes: Double;
}
begin
//  SumaImportes := RoundTo (edImporteSentencia.Value - (edImporteConRet.Value + edImporteSinRet.Value), -2);
  VerificarMultiple(['Guardando Importe Regulado en Sentencia',
                     edImporteSentencia,
                     edImporteSentencia.Value > 0,
                     'Debe especificar un monto válido.',
                     cbAplicacion,
                     cbAplicacion.ItemIndex >= 0,
                     'Debe especificar concepto de aplicación.',
                     cbAplicacion,
                     FHonorariosOponentes or ((not FHonorariosOponentes) and (cbAplicacion.Value <> 'O')),
                     'No corresponde fijar este tipo de honorarios.',
                     edImporteSinRet,
                     edImporteSinRet.Value >= 0,
                     'Debe especificar un monto no negativo.',
                     edImporteConRet,
                     edImporteConRet.Value >= 0,
                     'Debe especificar un monto no negativo.'//,
                     //edImporteConRet,
                     //SumaImportes >= 0,
                     //'Los montos a pagar no pueden superar el monto de la sentencia.'
                    ]);

  fpImportes.ModalResult := mrOk
end;

end.
