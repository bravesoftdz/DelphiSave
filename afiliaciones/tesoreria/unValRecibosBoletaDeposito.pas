unit unValRecibosBoletaDeposito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, CurrEdit,
  unArtFrame, unFraStaticCodigoDescripcion, Menus, unArt, unArtDBAwareFrame;

type
  TfrmValRecibosBoletaDeposito = class(TfrmCustomConsulta)
    gbBoletaDepos: TGroupBox;
    edBoletaDepos: TEdit;
    gbFechaDeposito: TGroupBox;
    Label5: TLabel;
    edFechaDeposDesde: TDateComboBox;
    edFechaDeposHasta: TDateComboBox;
    gbImporte: TGroupBox;
    Label2: TLabel;
    edImporteDesde: TCurrencyEdit;
    edImporteHasta: TCurrencyEdit;
    gbCuentaBancaria: TGroupBox;
    lbBanco: TLabel;
    lbCuenta: TLabel;
    fraBanco: TfraStaticCodigoDescripcion;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirRecibo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure fraBancoOnChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirReciboClick(Sender: TObject);
  private
  	function DoGenerarRecibo(FechaRecibo: TDateTime; ImporteTotal: Currency; BoletaDepos: String;
    												 IdCuentaBancaria: TTableId; Contrato: Integer): TTableId;

    procedure DoImprimirRecibo;
  public
  end;

var
  frmValRecibosBoletaDeposito: TfrmValRecibosBoletaDeposito;

implementation

uses
	unPrincipal, unDmPrincipal, AnsiSql, unTesoreria, SqlFuncs, unqrImpresionRecibo, unSesion;

{$R *.DFM}


procedure TfrmValRecibosBoletaDeposito.FormCreate(Sender: TObject);
begin
  inherited;

  with fraBanco do
  begin
    ShowBajas   := True;
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    OnChange    := fraBancoOnChange;
  end;

  with fraCuentaBancaria do
  begin
    ShowBajas      := True;
    TableName      := 'ZCB_CUENTABANCARIA';
    FieldID        := 'CB_ID';
    FieldCodigo    := 'CB_ID';
    FieldDesc      := 'CB_NUMERO';
    FieldBaja      := 'CB_FECHABAJA';
    ExtraCondition := ' AND 1=2 ';
  end;
end;

procedure TfrmValRecibosBoletaDeposito.fraBancoOnChange(Sender: TObject);
begin
  fraCuentaBancaria.ExtraCondition := ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value) + ' ';
  fraCuentaBancaria.ClearGrid;
end;

procedure TfrmValRecibosBoletaDeposito.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraBanco.Clear;

  fraCuentaBancaria.ExtraCondition := ' AND 1=2 ';
  fraCuentaBancaria.Clear;

  edBoletaDepos.Clear;
  edFechaDeposDesde.Clear;
  edFechaDeposHasta.Clear;
  edImporteDesde.Clear;
  edImporteHasta.Clear;

  fraBanco.edCodigo.SetFocus;
end;

procedure TfrmValRecibosBoletaDeposito.tbRefrescarClick(Sender: TObject);
var
   sSql, sSqlWhere,sSqlHaving: String;
begin
  sSqlWhere := SqlBetween(' AND DM_FECHADEPOSITO', edFechaDeposDesde.Date, edFechaDeposHasta.Date);

  if fraCuentaBancaria.IsSelected then
    sSqlWhere := sSqlWhere + ' AND RM_IDCUENTABANCARIA=' + SqlValue(fraCuentaBancaria.Value);

  if edBoletaDepos.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND DM_NRODEPOSITO=' + SqlValue(edBoletaDepos.Text);

  sSqlHaving := SqlBetween(' HAVING SUM(DM_IMPORTE)', edImporteDesde.Value, edImporteHasta.Value);


  sSql :=
  	'SELECT RM_IDCUENTABANCARIA, BA_NOMBRE BANCO, CB_NUMERO CUENTA, DM_NRODEPOSITO BOLETA,' +
    			' DM_FECHADEPOSITO FECHADEPOS, SUM(DM_IMPORTE) IMPORTEDEPOS' +
     ' FROM ZBA_BANCO, ZCB_CUENTABANCARIA, ZPV_PLANVALOR, RRM_REMESA, ZDM_DEPOSITOMANUAL' +
    ' WHERE DM_IDPLANVALOR = PV_ID' +
      ' AND DM_IDREMESA = RM_ID' +
      ' AND RM_IDCUENTABANCARIA = CB_ID' +
      ' AND CB_IDBANCO = BA_ID' +
      ' AND PV_IDRECIBO IS NULL' +
						sSqlWhere +
 ' GROUP BY RM_IDCUENTABANCARIA, BA_NOMBRE, CB_NUMERO, DM_NRODEPOSITO, DM_FECHADEPOSITO' +
        sSqlHaving;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmValRecibosBoletaDeposito.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('IMPORTEDEPOS') is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
   TFloatField( sdqConsulta.FieldByName('IMPORTEDEPOS')).Currency := True;
end;

procedure TfrmValRecibosBoletaDeposito.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmValRecibosBoletaDeposito.mnuImprimirReciboClick(Sender: TObject);
begin
  DoImprimirRecibo;
end;

procedure TfrmValRecibosBoletaDeposito.DoImprimirRecibo;
var
  sSql, sBoletaDepos, sSqlImporte: String;
  dFechaRecibo: TDateTime;
  IdCuentaBancaria, idRecibo: TTableId;
  i, iContrato: Integer;
  rImporte: Currency;
  ListaIdRecibos: TStringList;
begin
  ListaIdRecibos := TStringList.Create();
  try
    sBoletaDepos     := sdqConsulta.FieldByName('BOLETA').AsString;
    IdCuentaBancaria := sdqConsulta.FieldByName('RM_IDCUENTABANCARIA').AsInteger;

    BeginTrans;

    try
      { determino fecha del recibo }
      sSql := 'SELECT TESORERIA.GET_FECHACAJAACTIVA(''I'')' +
               ' FROM RCC_CIERRECAJA';

      dFechaRecibo := ValorSqlDateTime(sSql, 0);
      if dFechaRecibo = 0 then
        raise Exception.Create('La caja de Ingreso no se encuentra activa.');


      sSql :=
      	'SELECT DISTINCT DM_CONTRATO CONTRATO' +
         ' FROM RRM_REMESA, ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR' +
        ' WHERE RM_ID = DM_IDREMESA' +
        	' AND DM_NRODEPOSITO = ' + SqlValue(sBoletaDepos) +
          ' AND RM_IDCUENTABANCARIA = ' + SqlValue(IdCuentaBancaria) +
          ' AND DM_IDPLANVALOR = PV_ID' +
          ' AND PV_IDRECIBO IS NULL';

			with GetQuery(sSql) do
      try
      	while not EOF do
        begin
        	iContrato := FieldByName('CONTRATO').AsInteger;

          sSqlImporte :=
          	'SELECT SUM(PV_IMPORTE)' +
             ' FROM ZPV_PLANVALOR' +
            ' WHERE PV_ID IN (SELECT DM_IDPLANVALOR' +
            									' FROM RRM_REMESA, ZDM_DEPOSITOMANUAL' +
                             ' WHERE RM_ID = DM_IDREMESA' +
                               ' AND DM_NRODEPOSITO = ' + SqlValue(sBoletaDepos) +
                               ' AND DM_CONTRATO = ' + SqlValue(iContrato) +
                               ' AND RM_IDCUENTABANCARIA = ' + SqlValue(IdCuentaBancaria) + ')';

          rImporte := ValorSqlExtended(sSqlImporte);

          if rImporte > 0 then
          begin
          	IdRecibo := DoGenerarRecibo(dFechaRecibo, rImporte, sBoletaDepos, IdCuentaBancaria, iContrato);

            ListaIdRecibos.Add(IntToStr(IdRecibo));
          end;

        	Next;
        end;
      finally
      	Free;
      end;

    	CommitTrans;
		except
    	on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message);
      end;
    end;

    // selección de los id's de los recibos a imprimir
    for i := 0 to ListaIdRecibos.Count - 1 do
    begin
    	IdRecibo := StrToInt(ListaIdRecibos.Strings[i]);

      with TfrmValImpresionRecibo.Create(Self) do
      try
      	ImprimirRecibo(IdRecibo);
      finally
      	Free;
      end;

      Next;
    end;

  	sdqConsulta.Refresh;
  finally
    ListaIdRecibos.Free;
  end;
end;

function TfrmValRecibosBoletaDeposito.DoGenerarRecibo(FechaRecibo: TDateTime; ImporteTotal: Currency;
																											BoletaDepos: String; IdCuentaBancaria: TTableId;
                                                      Contrato: Integer): TTableId;
var
  sSql: String;
  iNroRecibo: Integer;
  IdRecibo: TTableId;
begin
  { determino nro. del recibo }
  sSql :=
  	'SELECT CT_CONTADOR NRO_RECIBO' +
     ' FROM CCT_CONTADORES' +
    ' WHERE CT_NUMERO = ' + SqlValue(cctRecibosBolDeposito) +
    	' FOR UPDATE';
  iNroRecibo := ValorSqlInteger(sSql);

  { actualizo tabla con contador del nro. recibo }
  with TSql.Create('CCT_CONTADORES') do
  try
    PrimaryKey.Add('CT_NUMERO', cctRecibosBolDeposito);
    Fields.Add('CT_CONTADOR', 	'CT_CONTADOR + 1', False);
    SqlType := stUpdate;

    EjecutarSqlST(Sql);

    Clear;

    IdRecibo := GetSecNextVal('SEQ_RRV_ID');

    { inserto en tabla de recibos impresos }
    TableName := 'RRV_RECIBOVALOR';

    Fields.Add('RV_ID',              IdRecibo);
    Fields.Add('RV_NUMERO',          iNroRecibo);
    Fields.Add('RV_SERIE',           99);
    Fields.AddExtended('RV_IMPORTE', ImporteTotal, ALL_DECIMALS, False);
    Fields.Add('RV_FECHA',           Trunc(FechaRecibo));
    Fields.Add('RV_FECHAIMPRESION',  exDateTime);
    Fields.Add('RV_USUIMPRESION',    Sesion.UserId);
    Fields.Add('RV_CANTREIMP',       1);
    Fields.Add('RV_USUALTA',         Sesion.UserId);
    Fields.Add('RV_FECHAALTA',       exDateTime);

    SqlType := stInsert;

    EjecutarSqlST(Sql);
  finally
    Free;
  end;

  { creo relación entre tabla de recibos impresos y valores del plan }
  sSql :=
  	'UPDATE ZPV_PLANVALOR' +
    	' SET PV_IDRECIBO = ' + SqlValue(IdRecibo) +
    ' WHERE PV_ID IN (SELECT DM_IDPLANVALOR' +
    									' FROM RRM_REMESA, ZDM_DEPOSITOMANUAL' +
                     ' WHERE RM_ID = DM_IDREMESA' +
                     	 ' AND DM_NRODEPOSITO = ' + SqlValue(BoletaDepos) +
                       ' AND DM_CONTRATO = ' + SqlValue(Contrato) +
                       ' AND RM_IDCUENTABANCARIA = ' + SqlValue(IdCuentaBancaria) + ')';
  EjecutarSqlST(sSql);

  { actualizo en tabla de depósito la fecha y usuario de aprobación }
  sSql :=
  	'UPDATE ZDM_DEPOSITOMANUAL' +
    	' SET DM_USUAPROBACION = ' + SqlValue(Sesion.UserId) +
      	 ', DM_FECHAAPROBACION = SYSDATE' +
    ' WHERE DM_IDPLANVALOR IN (SELECT PV_ID' +
    													 ' FROM ZPV_PLANVALOR' +
                              ' WHERE PV_IDRECIBO = ' + SqlValue(IdRecibo) + ')';
  EjecutarSqlST(sSql);

  Result := IdRecibo;
end;

end.
