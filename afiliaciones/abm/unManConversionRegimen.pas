unit unManConversionRegimen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, RxPlacemnt, Vcl.Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, unFraActividad, RxToolEdit, DateComboBox, RxCurrEdit;

type
  TfrmManConversionRegimen = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbContrato: TLabel;
    lbCuit: TLabel;
    lbRazonSocial: TLabel;
    fraActividad: TfraActividad;
    edNivel: TIntEdit;
    edTotalEmpleados: TIntEdit;
    edVigencia: TDateComboBox;
    edMasaSalarial: TCurrencyEdit;
    edPorcVariable: TCurrencyEdit;
    edSumaFija: TCurrencyEdit;
    GroupBox2: TGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label11: TLabel;
    gbMultiplesContratos: TGroupBox;
    Label13: TLabel;
    edContratos: TEdit;
    ToolBar1: TToolBar;
    tAgregarTXT: TToolButton;
    tbLimpiarTXT: TToolButton;
    tbFormatoContrato: TToolButton;
    OpenDialog: TOpenDialog;
    rbCaso: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tAgregarTXTClick(Sender: TObject);
    procedure tbLimpiarTXTClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    function Convertir(const aContrato: Integer): Boolean;
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar : Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure LoadSQL;
  end;

var
  frmManConversionRegimen: TfrmManConversionRegimen;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, Strfuncs, unArt;

{$R *.dfm}

{ TfrmManContratosTrabNoConfirmados }

procedure TfrmManConversionRegimen.btnAceptarClick(Sender: TObject);
begin
  inherited;
  tbRefrescarClick(nil);
end;

procedure TfrmManConversionRegimen.ClearControls;
begin
  lbContrato.Caption := '';
  lbCuit.Caption := '';
  lbRazonSocial.Caption := '';
  fraActividad.Clear;
  edNivel.Clear;
  edTotalEmpleados.Clear;
  edMasaSalarial.Clear;
  edSumaFija.Clear;
  edPorcVariable.Clear;
  edVigencia.Clear;
end;

function TfrmManConversionRegimen.Convertir(const aContrato: Integer) : Boolean;
var
  sSql : String;
begin
  BeginTrans;
  try
    sSql :=
       ' BEGIN' +
          ' ART.AFILIACION.do_ConversionRegimen(:contrato);' +
        ' END;';
    EjecutarSQLSTEx(sSql, [aContrato]);
    Result := True;
  except
    on E : Exception do
    begin
      ShowMessage('Ocurrio un error al guardar los datos del contrato: '+ IntToStr(aContrato) + ' ' + E.Message);
      RollBack;
      Result := False;
    end;
  end;
end;

function TfrmManConversionRegimen.DoABM: Boolean;
begin
  Sql.Clear;
  Result := False;
  BeginTrans;
    try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('cr_id', sdqConsulta.FieldByName('cr_id').AsInteger);
      Sql.SqlType := stUpdate;

    end
    else
    begin
      Validar;
      if ModoABM = maAlta then
      begin
       // Sql.PrimaryKey.AddExpression('cf_id', 'ART.SEQ_ADF_DOCUMENTACIONFALTA.NEXTVAL');
        Sql.Fields.Add('cr_fechaalta', exDateTime);
        Sql.Fields.Add('cr_usualta',   frmPrincipal.DBLogin.UserID);
        Sql.SqlType := stInsert;
      end
      else
      begin { maModificacion }
        Sql.PrimaryKey.Add('cr_id',     sdqConsulta.FieldByName('cr_id').AsInteger);
        Sql.Fields.Add('cr_fechamodif', exDateTime);
        Sql.Fields.Add('cr_usumodif',   frmPrincipal.DBLogin.UserID);
        Sql.SqlType := stUpdate;
      end;
      Sql.Fields.Add('cr_idactividadnew', fraActividad.Value);
      Sql.Fields.Add('cr_nivel', edNivel.Value);
      Sql.Fields.Add('cr_totempleados', edTotalEmpleados.Value);
      Sql.Fields.Add('cr_masatotal', edMasaSalarial.Value);

      Sql.Fields.Add('cr_sumafija', edSumaFija.Value);
      Sql.Fields.Add('cr_alicuotapesos', edSumaFija.Value + 0.6);
      Sql.Fields.Add('cr_porcmasa', edPorcVariable.Value);
      Sql.Fields.Add('cr_porcmasatarifa', edPorcVariable.Value / 1.03, dtNumber);

      Sql.Fields.Add('cr_vigenciatarifa', edVigencia.Date);
    end;

    Result := inherited DoABM;
    CommitTrans;
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmManConversionRegimen.LoadControls;
begin
  lbContrato.Caption := sdqConsulta.FieldByName('Contrato').AsString;
  lbCuit.Caption     := sdqConsulta.FieldByName('Cuit').AsString;
  lbRazonSocial.Caption := sdqConsulta.FieldByName('RazonSocial').AsString;
  fraActividad.Value    := sdqConsulta.FieldByName('cr_idactividadnew').AsInteger;
  if not sdqConsulta.FieldByName('nivel').IsNull then
    edNivel.Value         := sdqConsulta.FieldByName('nivel').AsInteger;

  edTotalEmpleados.Value := sdqConsulta.FieldByName('Total_Empleados').AsInteger;
  edMasaSalarial.Text  := sdqConsulta.FieldByName('Masa_Salarial').AsString;
  edSumaFija.Text        := sdqConsulta.FieldByName('SumaFija').AsString;
  edPorcVariable.Text    := sdqConsulta.FieldByName('Variable').AsString;
  edVigencia.Date        := sdqConsulta.FieldByName('VigenciaTarifa').AsDateTime;
end;

function TfrmManConversionRegimen.Validar: Boolean;
begin
 // Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'El contrato no puede quedar vacío');
  Result := True;
end;

procedure TfrmManConversionRegimen.FormCreate(Sender: TObject);
begin
  LoadSQL;
  inherited;
  Sql.TableName := 'AFI.ACR_CONVERSIONREGIMEN';
  FieldBaja     := 'cr_fechabaja';
  //fraEmpresa.ShowBajas := True;
end;


procedure TfrmManConversionRegimen.LoadSQL;
begin
  sdqConsulta.SQL.Text :=
       'SELECT co_contrato AS Contrato, ' +
       '       em_cuit AS CUIT, ' +
       '       em_nombre AS RazonSocial, ' +
       '       fo_formulario AS Formulario, ' +
       '       cr_caso AS CASO, ' +
       '       CASE cr_caso ' +
       '          WHEN ''A'' ' +
       '          THEN ' +
       '             ''OK'' ' +
       '          ELSE ' +
       '             CASE ' +
       '                WHEN     CR_IDACTIVIDADNEW IS NOT NULL ' +
       '                     AND CR_NIVEL IS NOT NULL ' +
       '                     AND NVL(CR_MASATOTAL, 0) > 0 ' +
       '                     AND NVL(CR_TOTEMPLEADOS, 0) > 0 ' +
       '                     AND NVL(CR_PORCMASATARIFA, 0) > 0 ' +
       '                     AND NVL(CR_PORCMASA, 0) > 0 ' +
       '                     AND NVL(CR_ALICUOTAPESOS, 0) > 0 ' +
       '                     AND CR_VIGENCIATARIFA IS NOT NULL ' +
       '                THEN ' +
       '                   ''OK'' ' +
       '                ELSE ' +
       '                   '''' ' +
       '             END ' +
       '       END ' +
       '          AS Estado_Conversion, ' +
       '       ac_descripcion AS actividad, ' +
       '       CR_NIVEL AS nivel, ' +
       '       CR_TOTEMPLEADOS AS Total_Empleados, ' +
       '       CR_MASATOTAL AS Masa_Salarial, ' +
       '       CR_SUMAFIJA AS SumaFija, ' +
       '       CR_PORCMASA AS Variable, ' +
       '       CR_VIGENCIATARIFA AS VigenciaTarifa, ' +
       '       CR_FECHABAJA, ' +
       '       CR_IDACTIVIDADNEW, ' +
       '       CR_ID ' +
       'FROM   AFI.ACR_CONVERSIONREGIMEN ' +
       '       JOIN aco_contrato ON co_contrato = cr_contrato ' +
       '       JOIN aem_empresa ON em_id = co_idempresa ' +
       '       JOIN afo_formulario ON fo_id = co_idformulario ' +
       '       LEFT JOIN cac_actividad ON ac_id = cr_idactividadnew ' +
       'WHERE  1 = 1 AND cr_fechaproceso IS NULL ';

  if not fraEmpresaFiltro.IsEmpty then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND cr_contrato = ' + SqlValue(fraEmpresaFiltro.Contrato);

  if edContratos.Text <> '' then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND cr_contrato IN (' + edContratos.Text + ')';

  case rbCaso.ItemIndex of
    0 : sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND cr_caso = ''A'' ';
    1 : sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND cr_caso = ''B'' ';
  end;



end;

procedure TfrmManConversionRegimen.tAgregarTXTClick(Sender: TObject);
var
  aArchivo: TextFile;
  iCountContratos: Integer;
  sContratos: String;
  sTemp: String;
begin
  inherited;

  OpenDialog.Title := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(aArchivo, OpenDialog.FileName);
      Reset(aArchivo);
      iCountContratos := 0;
      while not Eof(aArchivo) do
      begin
        Inc(iCountContratos);
        ReadLn(aArchivo, sTemp);
        if StrToIntDef(sTemp, 0) <> 0 then // Con esto chequeo que no ingrese cualquier cosa..
          sContratos := sContratos + sTemp + ',';

        if iCountContratos > 1000 then
        begin
          MessageDlg('La cantidad máxima de contratos es 1000.', mtError, [mbOK], 0);
          Exit;
        end;
      end;
      edContratos.Text := Copy(sContratos, 1, Length(sContratos) - 1);
    except
      edContratos.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(aArchivo);
  end;
end;

procedure TfrmManConversionRegimen.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + CRLF +
             '* Extensión: .TXT' + CRLF +
             '* Encabezado: No debe ingresarse encabezado' + CRLF +
             '* Cuerpo: ' + CRLF +
             '   - Campos: 1) NroDeContrato' + CRLF +
             '   - Obs: No deben ingresarse más campos que el de NroDeContrato' + CRLF +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManConversionRegimen.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaFiltro.Clear;
  edContratos.Clear;
  rbCaso.ItemIndex := 2;
end;

procedure TfrmManConversionRegimen.tbLimpiarTXTClick(Sender: TObject);
begin
  edContratos.Clear;
end;

procedure TfrmManConversionRegimen.tbNuevoClick(Sender: TObject);
var
  iLoop : Integer;
  iConvertidos : Integer;
begin
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    Verificar(sdqConsulta.FieldByName('Estado_Conversion').AsString <> 'OK', Grid, 'El contrato ' +
              sdqConsulta.FieldByName('Contrato').AsString + ' no se puede convertir');
  end;

  iConvertidos := 0;
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    if Convertir(sdqConsulta.FieldByName('Contrato').AsInteger) then
      Inc(iConvertidos);
  end;
  ShowMessage('Se Convirtieron ' + IntToStr(iConvertidos) + ' Contratos');

  tbRefrescarClick(nil);
end;

procedure TfrmManConversionRegimen.tbRefrescarClick(Sender: TObject);
begin
  LoadSQL;
  inherited;
end;

end.
