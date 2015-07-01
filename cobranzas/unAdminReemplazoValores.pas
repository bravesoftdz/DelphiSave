unit unAdminReemplazoValores;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   22-10-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, StdCtrls,
  unFraStaticCTB_TABLAS, unArtFrame, unFraStaticCodigoDescripcion, PatternEdit, ToolEdit, DateComboBox, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, IntEdit, Mask, CurrEdit, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl,
  ComCtrls, ToolWin, ExtCtrls, QueryPrint, unArtDBAwareFrame, unART, RxToolEdit,
  RxCurrEdit, RxPlacemnt;

type
  TfrmAdminReemplazoValores = class(TfrmCustomPanelABM)
    gbPago: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    edVA_IMPORTE: TCurrencyEdit;
    cmbVA_VENCIMIENTO: TDateComboBox;
    edVA_NROCHEQUE: TPatternEdit;
    fraVA_IDBANCO: TfraStaticCodigoDescripcion;
    chkNegociable: TCheckBox;
    gbToolbar: TGroupBox;
    ToolBarPagoCuota: TToolBar;
    tbAgregarRegistro: TToolButton;
    tbModificarRegistro: TToolButton;
    tbEliminarRegistro: TToolButton;
    Grid: TArtDBGrid;
    gbSeleccion: TGroupBox;
    Label8: TLabel;
    Label3: TLabel;
    edRV_MONTOINICIAL: TCurrencyEdit;
    edRV_INTERESMORA: TCurrencyEdit;
    gbInteres: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edRV_PORCDESCINTERES: TCurrencyEdit;
    edRV_MONTODESCINTERES: TCurrencyEdit;
    gbDeuda: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    edTotalInteres: TCurrencyEdit;
    edRV_GASTOADMINISTRATIVO: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edRV_CANTIDADCUOTA: TIntEdit;
    Label2: TLabel;
    edRV_TASAINTERESMENSUAL: TCurrencyEdit;
    Label16: TLabel;
    edRV_MONTOFINAL: TCurrencyEdit;
    Label9: TLabel;
    edRD_IMPORTEINTERES: TCurrencyEdit;
    btnCalcular: TButton;
    Label11: TLabel;
    GridAdicionales: TArtDBGrid;
    sdqAdic: TSDQuery;
    dsAdic: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    fraVA_TIPO: TfraStaticCodigoDescripcion;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure CambiarModoPago ( Sender: TObject );
    procedure CalculaValores ( Sender: TObject );
    procedure btnCalcularClick(Sender: TObject);
    procedure tbAgregarRegistroClick(Sender: TObject);
    procedure tbModificarRegistroClick(Sender: TObject);
    procedure tbEliminarRegistroClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edRD_IMPORTEINTERESChange(Sender: TObject);
    procedure sdqAdicAfterOpen(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    fContrato: String;
    fListaValores: TStringList;
    fRV_ID: String;
    HuboModificacion: Boolean;

    function Get_GastosBancarios: Double;

    procedure ActualizarGrilla;
    procedure CalculaInteres;
    procedure CargarDatos;
    procedure ClearPagos;
    procedure Do_ActualizarEstadoPlanValores;
    procedure Do_HabilitarValoresReemplazantes;
    procedure DoGuardarRegistro(Modo: String; Importe: Currency; Tipo: Integer);    
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
  public
    procedure Preparar(ListaValores: TStringList; RV_ID: string);
  end;

var
  frmAdminReemplazoValores: TfrmAdminReemplazoValores;

implementation
{$R *.DFM}

uses
  VCLExtra, unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, Numeros, unCobranzas, unSesion, unGrids,
  unQrChequesReemplazados;

procedure TfrmAdminReemplazoValores.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HuboModificacion then
    if MsgAsk('No grabó las modificaciones efectuadas.' + CRLF + '¿ Desea hacerlo ahora ?') then
      if not DoABM then Exit;

  inherited;
  
  frmAdminReemplazoValores := nil;
  Action := caFree;
end;

procedure TfrmAdminReemplazoValores.Preparar(ListaValores: TStringList; RV_ID: String);
var
  IDs: String;
  iloop: Integer;
  Query: TSDQuery;
  sSql: String;
begin
  HuboModificacion := False;

  edRV_PORCDESCINTERES.OnChange     := nil;
  edRV_MONTODESCINTERES.OnChange    := nil;
  edRV_GASTOADMINISTRATIVO.OnChange := nil;
  edRV_TASAINTERESMENSUAL.OnChange  := nil;

  edRV_TASAINTERESMENSUAL.Value     := Get_TEMVigente();
  edRV_GASTOADMINISTRATIVO.Value    := Get_GastosBancarios();

  edRV_PORCDESCINTERES.OnChange     := CalculaValores;
  edRV_MONTODESCINTERES.OnChange    := CalculaValores;
  edRV_GASTOADMINISTRATIVO.OnChange := CalculaValores;
  edRV_TASAINTERESMENSUAL.OnChange  := CalculaValores;

  fListaValores := TStringList.Create;
  fRV_ID := RV_ID;

  //Reseteo la tabla temporal
  sSql := 'DELETE FROM TVA_VALOR WHERE VA_USUARIO = :p1';
  EjecutarSqlEx(sSql, [Sesion.UserID]);

  //Obtengo el ID de la Cabecera ZRV_REEMPLAZOVALOR
  if fRV_ID = '' then
  begin
    ModoABM := maAlta;
    fListaValores.Assign(ListaValores);
  end
  else
  begin
    ModoABM := maModificacion;
    sSql :=
    	'SELECT RD_IDVALOR' +
       ' FROM ZRD_REEMPLAZODETALLE' +
      ' WHERE RD_TIPO = ''R''' +
      	' AND RD_IDREEMPLAZOVALOR = :p1';
    Query := GetQueryEx(sSql, [fRV_ID]);
    try
      while not Query.Eof do
      begin
        fListaValores.Add(Query.FieldByName('RD_IDVALOR').AsString);
        Query.Next;
      end;
    finally
      Query.Free;
    end;

    CargarDatos;
  end;

  //Cargo los valores correspondientes a los reemplazados
  for iloop := 0 to fListaValores.Count - 1 do
    IDs := IDs + fListaValores.Strings[iloop] + ',';
  IDs := Copy(IDs, 1, Length(IDs) - 1);

  sSql :=
  	'SELECT BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_IMPORTE, TV_DESCRIPCION TIPO_VALOR, VA_NEGOCIABLE,' +
    			' VA_ID' +
     ' FROM ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR' +
    ' WHERE VA_IDBANCO = BA_ID(+)' +
    	' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND VA_ID IN (' + IDs + ')';
  OpenQuery(sdqAdic, sSql, True);

  // Obtengo el interes por mora..
  sSql :=
    'SELECT SUM(DEUDA.GET_TASAACUMULADA (VA_VENCIMIENTO, SYSDATE) * VA_IMPORTE / 100) INT_MORA' +
     ' FROM ZVA_VALOR' +
    ' WHERE VA_ID IN (' + IDs + ')';

  edRV_INTERESMORA.Value := ValorSql(sSql);


  //Toma los valores de la tabla temporal para visualizarlos en la grilla inferior
  ActualizarGrilla;

  fContrato := ValorSqlEx('SELECT VA_IDCONTRATO FROM ZVA_VALOR WHERE VA_ID = :p1', [fListaValores.Strings[0]]);

  CalculaValores(nil);
end;

procedure TfrmAdminReemplazoValores.FSFormCreate(Sender: TObject);
begin
  inherited;

  with fraVA_IDBANCO do
  begin
    TableName   := 'ZBA_BANCO';
    FieldCodigo := 'BA_CODIGO';
    FieldID     := 'BA_ID';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraVA_TIPO do
    begin
      TableName   := 'OTV_TIPOVALOR';
      FieldId     := 'TV_ID';
      FieldCodigo := 'TV_CODIGO';
      FieldDesc   := 'TV_DESCRIPCION';
      FieldBaja   := 'TV_USUBAJA';
      ShowBajas   := False;
      OnChange    := CambiarModoPago;
    end;

  VCLExtra.LockControls([edRV_MONTOINICIAL, edRV_INTERESMORA, edTotalInteres, edRV_MONTOFINAL], True);
end;

procedure TfrmAdminReemplazoValores.Do_HabilitarValoresReemplazantes;
begin
  VCLExtra.LockControls([fraVA_IDBANCO, edVA_NROCHEQUE, cmbVA_VENCIMIENTO, chkNegociable], (fraVA_TIPO.Codigo <> 'CHQ'));
  VCLExtra.LockControls([cmbVA_VENCIMIENTO], not((fraVA_TIPO.Codigo = 'CHQ') or (fraVA_TIPO.Codigo = 'PAG')));
end;

procedure TfrmAdminReemplazoValores.CambiarModoPago(Sender: TObject);
begin
  Do_HabilitarValoresReemplazantes;

  cmbVA_VENCIMIENTO.Clear;
  edVA_NROCHEQUE.Clear;
  fraVA_IDBANCO.Clear;
  chkNegociable.Checked := False;
end;

procedure TfrmAdminReemplazoValores.CalculaValores(Sender: TObject);
var
  iloop: Integer;
  IDs: String;
//  sSql: string;
begin
  for iloop:= 0 to fListaValores.Count - 1 do
    IDs := IDs + fListaValores.Strings[iloop] + ',' ;
  IDs := Copy(IDs, 1, Length(IDs) - 1);
  //Busca el importe inicial de los cheques
{ Ahora lo pasé al AfterOpen de la consulta... PTavasci
  sSql := 'SELECT SUM(VA_IMPORTE) ' +
          '  FROM ZVA_VALOR ' +
          ' WHERE VA_ID IN ( ' + IDs + ' )';
  edRV_MONTOINICIAL.Value := ValorSqlExtended( sSql );
}

{  if edRV_TASAINTERESMENSUAL.Value <> 0 then
  begin
    if sdqAdic.RecordCount > 1 then
    begin
      sSql := 'SELECT SUM(VA_IMPORTE * ((' + SqlNumber(edRV_TASAINTERESMENSUAL.Value) + ' / 3000) * (ACTUALDATE - VA_VENCIMIENTO))) ' +
              '  FROM ZVA_VALOR ' +
              ' WHERE VA_ID IN (' + IDs + ') ' +
              '   AND VA_VENCIMIENTO <= ACTUALDATE';
      edRV_INTERESMORA.Value := ValorSqlExtended(sSql, 0);
    end
    else
      if sdqAdic.Active then
        edRV_INTERESMORA.Value := edRV_MONTOINICIAL.Value * edRV_TASAINTERESMENSUAL.Value / 3000 * (Round(DBDate - sdqAdic.FieldByName('VA_VENCIMIENTO').AsDateTime))
  end
  else
    edRV_INTERESMORA.Value := 0;
 }


  edTotalInteres.Value  := edRV_INTERESMORA.Value - (edRV_MONTODESCINTERES.Value + edRV_PORCDESCINTERES.Value * edRV_INTERESMORA.Value / 100);
  edRV_MONTOFINAL.Value := edRV_MONTOINICIAL.Value + edTotalInteres.Value + edRV_GASTOADMINISTRATIVO.Value;
  HuboModificacion := True;
end;

procedure TfrmAdminReemplazoValores.CalculaInteres;
begin
  //Calcula los intereses que le corresponden al valor
  if (fraVA_TIPO.Codigo = 'PAG') or (fraVA_TIPO.Codigo = 'CHQ') then
  begin
    Verificar(cmbVA_VENCIMIENTO.IsEmpty, btnCalcular, 'La fecha de vencimiento es obligatoria.');
    edRD_IMPORTEINTERES.Value := RoundNumber(edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value * edRV_TASAINTERESMENSUAL.Value / 3000 * (cmbVA_VENCIMIENTO.Date - Date), 2);
    edVA_IMPORTE.Value        := RoundNumber(edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value * (1 + (edRV_TASAINTERESMENSUAL.Value / 3000 * (cmbVA_VENCIMIENTO.Date - Date))), 2);
  end
  else
  begin
    edRD_IMPORTEINTERES.Value := 0;
    edVA_IMPORTE.Value        := RoundNumber(edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value, 2);
  end;
end;

procedure TfrmAdminReemplazoValores.btnCalcularClick(Sender: TObject);
begin
  inherited;
  //Calcula los intereses que le corresponden al valor
  HuboModificacion := True;
  CalculaInteres;
end;

procedure TfrmAdminReemplazoValores.tbAgregarRegistroClick(Sender: TObject);
begin
  if Validar then
    DoGuardarRegistro('alta', edVA_IMPORTE.Value, fraVA_TIPO.Value);
end;

procedure TfrmAdminReemplazoValores.DoGuardarRegistro(Modo: String; Importe: Currency; Tipo: Integer);
var
  SqlTrans: TSql;
begin
  SqlTrans := TSql.Create('TVA_VALOR');
  try
    try
      BeginTrans;
      if modo = 'baja' then
      begin
        SqlTrans.PrimaryKey.Add ('VA_ID', sdqConsulta.FieldByName('VA_ID').AsString, False);
        SqlTrans.SqlType := stDelete;
      end
      else
      begin
        if modo = 'alta' then
        begin
          SqlTrans.SqlType := stInsert;
          SqlTrans.PrimaryKey.Add ('VA_ID', 'SEQ_ZVA_ID.NEXTVAL', False);
          SqlTrans.Fields.Add('VA_USUARIO', Sesion.UserID);
        end
        else if modo = 'modif' then
        begin
          SqlTrans.SqlType := stUpdate;
          SqlTrans.PrimaryKey.Add ('VA_ID', sdqConsulta.FieldByName('VA_ID').AsString, False);
          SqlTrans.Fields.Add('VA_USUARIO', Sesion.UserID);
        end;

        SqlTrans.Fields.Add('VA_TIPO', 		Tipo);
        SqlTrans.Fields.Add('VA_IMPORTE', Importe, dtNumber);
        SqlTrans.Fields.Add('VA_ESTADO', '01');

        if fraVA_TIPO.Codigo = 'CHQ' then //-> ingresa el banco
        begin
          SqlTrans.Fields.Add('VA_IDBANCO', 		fraVA_IDBANCO.Value);
          SqlTrans.Fields.Add('VA_VENCIMIENTO', cmbVA_VENCIMIENTO.Date);
          SqlTrans.Fields.Add('VA_NROCHEQUE', 	edVA_NROCHEQUE.Text, dtNumber);
          SqlTrans.Fields.Add('VA_INTERES', 		edRD_IMPORTEINTERES.Text, dtNumber);
          if chkNegociable.checked then
            SqlTrans.Fields.Add('VA_NEGOCIABLE', 'S')
          else
            SqlTrans.Fields.Add('VA_NEGOCIABLE', 'N');
        end
        else if fraVA_TIPO.Codigo = 'PAG' then //Pagaré
        begin
          SqlTrans.Fields.Add('VA_VENCIMIENTO', cmbVA_VENCIMIENTO.Date);
          SqlTrans.Fields.Add('VA_IDBANCO', 		'NULL', False);
          SqlTrans.Fields.Add('VA_NROCHEQUE', 	'NULL', False);
          SqlTrans.Fields.Add('VA_NEGOCIABLE', 	'N');
        end
        else
        begin
          SqlTrans.Fields.Add('VA_IDBANCO', 		'NULL', False);
          SqlTrans.Fields.Add('VA_VENCIMIENTO', 'NULL', False);
          SqlTrans.Fields.Add('VA_NROCHEQUE', 	'NULL', False);
          SqlTrans.Fields.Add('VA_NEGOCIABLE', 	'N');
        end;
      end;
      EjecutarSqlST(SqlTrans.Sql);

      CommitTrans;
      HuboModificacion := True;
    except
      on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + #13);
      end;
    end;
  finally
    SqlTrans.Free;
  end;
  //Actualizo el Query y limpio los campos
  ClearPagos;
end;

procedure TfrmAdminReemplazoValores.ActualizarGrilla;
var
  sSql: String;
begin
  //Toma los valores de la tabla temporal para visualizarlos en la grilla
  sSql :=
  	'SELECT VA_ID, VA_TIPO, VA_IMPORTE, TV_DESCRIPCION, VA_IDBANCO, VA_NEGOCIABLE, VA_NROCHEQUE, VA_VENCIMIENTO,' +
    			' VA_ESTADO, BA_NOMBRE, NVL(VA_INTERES, 0) VA_INTERES' +
     ' FROM TVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR' +
   	' WHERE VA_IDBANCO = BA_ID(+)' +
    	' AND VA_TIPO = TV_ID' +
      ' AND VA_USUARIO = :p1';
  OpenQueryEx(sdqConsulta, [Sesion.UserID], sSql);
end;

function TfrmAdminReemplazoValores.DoABM: boolean;
var
  SqlCabecera: TSql;
  SqlReemplazo: TSql;
  SqlEvento: TSql;
  sSql, sEstado: String;
  iloop, TipoValor: Integer;
  RedondeoReemplValores: Extended;
  MontoFinal, TotalValores, Diferencia: Currency;
begin
  sdqConsulta.DisableControls;

  // inserto redondeo si corresponde
  if Sesion.Sector = 'COB' then    // Cobranzas
    begin
      MontoFinal   := edRV_MONTOFINAL.Value;
      TotalValores := ObtenerSuma(Grid, 'VA_IMPORTE');
      Diferencia   := MontoFinal - TotalValores;

      RedondeoReemplValores := Get_RedondeoReemplValores(Sesion.Sector)/100;

      if (CompareFloat2(Diferencia, 0) > 0) and (CompareFloat(Diferencia, MontoFinal*RedondeoReemplValores) <= 0) then
        begin
          sSql := 'SELECT TV_ID FROM OTV_TIPOVALOR WHERE TV_CODIGO=''RED''';

          DoGuardarRegistro('alta', Diferencia, ValorSqlInteger(sSql));
        end;
    end;

  SqlCabecera  := TSql.Create('ZRV_REEMPLAZOVALOR');
  SqlReemplazo := TSql.Create('ZRD_REEMPLAZODETALLE');
  SqlEvento    := TSql.Create('ZEC_EVENTOCHEQUE');

  BeginTrans;
  try
    try
      if ModoABM = maAlta then
      begin
        fRV_ID := ValorSql('SELECT SEQ_ZRV_ID.NEXTVAL FROM DUAL');
        SqlCabecera.SqlType := stInsert;
        SqlCabecera.PrimaryKey.Add('RV_ID', fRV_ID, False);
        SqlCabecera.Fields.Add('RV_NROOPERACION', 'SEQ_NROOPERACION.NEXTVAL', False);
        SqlCabecera.Fields.Add('RV_USUALTA',      Sesion.UserID);
        SqlCabecera.Fields.Add('RV_FECHAALTA',    'ACTUALDATE', False);
        SqlCabecera.Fields.Add('RV_MONTOINICIAL', edRV_MONTOINICIAL.Value, dtNumber);
        SqlCabecera.Fields.Add('RV_INTERESMORA',  edRV_INTERESMORA.Value, dtNumber);
        SqlCabecera.Fields.Add('RV_CONTRATO',     fContrato);
      end
      else
      begin
        SqlCabecera.SqlType := stUpdate;
        SqlCabecera.PrimaryKey.Add('RV_ID', 		fRV_ID, False);
        SqlCabecera.Fields.Add('RV_USUMODIF',   Sesion.UserID);
        SqlCabecera.Fields.Add('RV_FECHAMODIF', 'ACTUALDATE', False);
      end;

      //Agrego los campos
      SqlCabecera.Fields.Add('RV_FECHA',               'ACTUALDATE', False);
      SqlCabecera.Fields.Add('RV_GASTOADMINISTRATIVO', edRV_GASTOADMINISTRATIVO.Value, dtNumber);
      SqlCabecera.Fields.Add('RV_TASAINTERESMENSUAL',  edRV_TASAINTERESMENSUAL.Value, dtNumber);
      SqlCabecera.Fields.Add('RV_PORCDESCINTERES',     edRV_PORCDESCINTERES.Value, dtNumber);
      SqlCabecera.Fields.Add('RV_MONTODESCINTERES',    edRV_MONTODESCINTERES.Value, dtNumber);
      SqlCabecera.Fields.Add('RV_CANTIDADCUOTA',       edRV_CANTIDADCUOTA.Value, dtNumber);
      SqlCabecera.Fields.Add('RV_MONTOTOTAL',          edRV_MONTOFINAL.Value, dtNumber);
      EjecutarSqlST(SqlCabecera.Sql);

      sEstado := '05';

      (*
      bReemplazoParcial := False;
      if CompareFloat(edRV_MONTOINICIAL.Value, ObtenerSuma(GridAdicionales, 'VA_IMPORTE')) = -1 then
      begin
        sEstado := '07';
        bReemplazoParcial := True;
      end
      else
      begin
        fTotal_A_Reemplazar := edRV_MONTOINICIAL.Value + edTotalInteres.Value + edRV_GASTOADMINISTRATIVO.Value;

        if CompareFloat(fTotal_A_Reemplazar, ObtenerSuma(Grid, 'VA_IMPORTE')) = 1 then
        begin
          sEstado := '07';
          bReemplazoParcial := True;
        end
        else if (MsgBox('El monto recibido es igual o mayor al monto a reemplazar: ¿ Queda usted a la espera de más valores ?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes) then
          sEstado := '07'
        else
          sEstado := '05';
      end;

      if bReemplazoParcial then
        MsgBox('El reemplazo es parcial, queda pendiente entrega de valores.', MB_ICONINFORMATION);
      *)
      
      //Doy de alta el detalle de los valores reemplazados
      for iloop := 0 to fListaValores.Count - 1 do
      begin
        sSql := 'UPDATE ZVA_VALOR SET VA_ESTADO = :p1 WHERE VA_ID = :p2';
        EjecutarSqlSTEx(sSql, [sEstado, fListaValores[iloop]]);

        if ModoABM = maAlta then
        begin
          SqlReemplazo.Clear;
          SqlReemplazo.SqlType := stInsert;
          SqlReemplazo.PrimaryKey.Add('RD_ID', 'SEQ_ZRD_ID.NEXTVAL', False);

          //Agrego los campos
          SqlReemplazo.Fields.Add('RD_TIPO',             'R');
          SqlReemplazo.Fields.Add('RD_IDREEMPLAZOVALOR', fRV_ID, False);
          SqlReemplazo.Fields.Add('RD_IDVALOR',          fListaValores[iloop], False);
          SqlReemplazo.Fields.Add('RD_USUALTA',          Sesion.UserID);
          SqlReemplazo.Fields.Add('RD_FECHAALTA',        'ACTUALDATE', False);
          EjecutarSqlST(SqlReemplazo.Sql);

          //Genera un evento de valor reemplazado para los cheques y los pagarés
          TipoValor := ValorSqlEx('SELECT VA_IDTIPOVALOR' +
                                   ' FROM ZVA_VALOR' +
                                  ' WHERE VA_ID = :p1', [fListaValores[iloop]]);
          if (TipoValor= 3) or (TipoValor = 2) then
          begin
            SqlEvento.Clear;
            SqlEvento.SqlType := stInsert;
            SqlEvento.TableName := 'ZEC_EVENTOCHEQUE';
            SqlEvento.PrimaryKey.Add('EC_ID', 			'SEQ_ZEC_ID.NEXTVAL', False);
            SqlEvento.Fields.Add('EC_EVENTO', 			'999');
            SqlEvento.Fields.Add('EC_FECHA', 				'ACTUALDATE', False);
            SqlEvento.Fields.Add('EC_OBSERVACIONES', '');
            SqlEvento.Fields.Add('EC_USUALTA', 			 Sesion.UserID);
            SqlEvento.Fields.Add('EC_FECHAALTA', 		'ACTUALDATE', False);
            SqlEvento.Fields.Add('EC_IDVALOR', 			 fListaValores[iloop], False);
            EjecutarSqlST(SqlEvento.Sql);
          end;
        end;
      end;

      ////////////////////////////////////////////////////////////////////////////////
      //  Actualizo la ZVA_VALOR a partir de los registros temporales de TVA_valor  //
      ////////////////////////////////////////////////////////////////////////////////
      if ModoABM <> maAlta then
      begin
        //Borro todos los registros de la zva_valor que no hayan sido
        //capturados por tesoreria que sean reemplazantes
        sSql :=
        	'DELETE FROM ZVA_VALOR' +
          		 ' WHERE VA_ESTADO = ''01'' AND VA_ID IN (SELECT RD_IDVALOR' +
                																				' FROM ZRD_REEMPLAZODETALLE' +
                                                       ' WHERE RD_IDREEMPLAZOVALOR = :p1' +
                                                       	 ' AND RD_TIPO = ''E'')';
        EjecutarSqlSTEx(sSql, [fRV_ID]);
      end;

      //Migro los registros de la temporal a la zva_valor
      sSql :=
      	'INSERT INTO ZVA_VALOR (VA_ID, VA_IDCONTRATO, VA_IDTIPOVALOR, VA_IMPORTE, VA_IMPOSINIMPUTAR, VA_IDBANCO,' +
        											' VA_VENCIMIENTO, VA_ESTADO, VA_NROCHEQUE, VA_NEGOCIABLE, VA_USUALTA, VA_FECHAALTA)' +
              				 ' SELECT VA_ID, ' + fContrato + ', VA_TIPO, VA_IMPORTE, VA_IMPORTE, VA_IDBANCO,' +
                       				' VA_VENCIMIENTO, VA_ESTADO, VA_NROCHEQUE, VA_NEGOCIABLE, VA_USUARIO, ACTUALDATE' +
                         ' FROM TVA_VALOR' +
                        ' WHERE VA_USUARIO = :p1' +
              						' AND VA_ESTADO = ''01''' ;
      EjecutarSqlSTEx(sSql, [Sesion.UserID]);

      /////////////////////////////////////////
      //  Actualizo la ZRD_REEMPLAZODETALLE  //
      /////////////////////////////////////////
      if ModoABM <> maAlta then
      begin
        //Borro todos los registros de la ZRD_REEMPLAZODETALLE que pertenezcan
        //a valores que no han sido tocados por tesoreria
        sSql :=
        	'DELETE FROM ZRD_REEMPLAZODETALLE' +
          		 ' WHERE RD_ID IN (SELECT RD_ID' +
                								 ' FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR' +
                                ' WHERE RD_IDVALOR = VA_ID' +
                                	' AND VA_ESTADO = ''01''' +
                                  ' AND RD_TIPO = ''E''' +
                                  ' AND RD_IDREEMPLAZOVALOR = :p1)';
        EjecutarSqlSTEx(sSql, [fRV_ID]);
      end;

      //Doy de alta el detalle de los valores reemplazantes
      //que posean estado 01
      sdqConsulta.First;
      while not sdqConsulta.Eof do
      begin
        if sdqConsulta.FieldByName('VA_ESTADO').AsString = '01' then
        begin
          SqlReemplazo.Clear;
          SqlReemplazo.SqlType := stInsert;
          SqlReemplazo.PrimaryKey.Add('RD_ID', 'SEQ_ZRD_ID.NEXTVAL', False);

          //Agrego los campos
          SqlReemplazo.Fields.Add('RD_TIPO',             'E');
          SqlReemplazo.Fields.Add('RD_IDREEMPLAZOVALOR', fRV_ID, False);
          SqlReemplazo.Fields.Add('RD_IDVALOR',          sdqConsulta.FieldByName('VA_ID').AsString, False);

          if sdqConsulta.FieldByName('VA_VENCIMIENTO').AsString = '' then
          begin
            SqlReemplazo.Fields.Add('RD_MONTOCALCULADO', edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value, dtNumber);
            SqlReemplazo.Fields.Add('RD_IMPORTEINTERES', 0, dtNumber);
          end
          else
          begin
            SqlReemplazo.Fields.Add('RD_MONTOCALCULADO', edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value * (1 + (edRV_TASAINTERESMENSUAL.Value / 3000 * (sdqConsulta.FieldByName('VA_VENCIMIENTO').AsDateTime - Date))), dtNumber);
            SqlReemplazo.Fields.Add('RD_IMPORTEINTERES', sdqConsulta.FieldByName('VA_INTERES').AsString, dtNumber);
          end;

          SqlReemplazo.Fields.Add('RD_USUALTA',   Sesion.UserID);
          SqlReemplazo.Fields.Add('RD_FECHAALTA', 'ACTUALDATE', False);

          EjecutarSqlST(SqlReemplazo.Sql);
        end;

        sdqConsulta.Next;
      end;

      Do_ActualizarEstadoPlanValores;

      HuboModificacion := False;
      CommitTrans;
      MessageDlg('La operación se ha realizado con éxito.', mtInformation, [mbOK], 0);
      result := True;
    except
      on E: Exception do
      begin
        Result := False;
        Rollback;
        ErrorMsg(E);
      end;
    end;
  finally
    SqlCabecera.Free;
    SqlReemplazo.Free;
    SqlEvento.Free;
    sdqConsulta.EnableControls;
  end;
end;

function TfrmAdminReemplazoValores.Validar: Boolean;
var
  bHabilitado: Boolean;
begin
  Result := False;
  bHabilitado := (fraVA_TIPO.Codigo = 'CHQ');

  if not fraVA_TIPO.IsSelected then
    InvalidMsg( fraVA_TIPO, 'Debe ingresar el tipo de valor.')
  else if bHabilitado and not fraVA_IDBANCO.IsSelected then
    InvalidMsg( fraVA_IDBANCO, 'Debe ingresar el banco.')
  else if bHabilitado and (edVA_NROCHEQUE.Text = '') then
    InvalidMsg( edVA_NROCHEQUE, 'Debe ingresar el nro. de cheque.')
  else if (bHabilitado or (fraVA_TIPO.Codigo = 'CHQ')) and cmbVA_VENCIMIENTO.IsEmpty then
    InvalidMsg( cmbVA_VENCIMIENTO, 'Debe ingresar la fecha la vencimiento.')
  else if edVA_IMPORTE.Value<=0 then
    InvalidMsg( edVA_IMPORTE, 'El importe debe ser mayor a 0.')
  else
   Result := True;
end;

procedure TfrmAdminReemplazoValores.tbModificarRegistroClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');
  Verificar(sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01', nil, 'El valor ya ha sido ingresado por tesorería.');

  if Validar and MsgAsk('¿ Está usted seguro de querer modificar este registro ?') then
    DoGuardarRegistro('modif', edVA_IMPORTE.Value, fraVA_TIPO.Value);
end;

procedure TfrmAdminReemplazoValores.tbEliminarRegistroClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');
  Verificar(sdqConsulta.FieldByName( 'VA_ESTADO' ).AsString <> '01', nil, 'El valor ya ha sido ingresado por tesorería.');
  if MsgAsk('¿ Está usted seguro de querer eliminar este registro ?') then
    DoGuardarRegistro('baja', 0, 0);
end;

procedure TfrmAdminReemplazoValores.tbNuevoClick(Sender: TObject);
begin
  //Validacion

  Verificar(sdqConsulta.RecordCount = 0 , Grid, 'Debe ingresar al menos un valor en la grilla.');
  Verificar(edRV_CANTIDADCUOTA.Value <= 0 , edRV_CANTIDADCUOTA, 'La cantidad de valores debe ser mayor a 0.');
  Verificar(sdqConsulta.RecordCount > edRV_CANTIDADCUOTA.Value , Grid, 'La cantidad de valores ingresados en la grilla no es correcta.');
  Verificar(CompareFloat2(ObtenerSuma(Grid, 'VA_IMPORTE'), RoundNumber(edRV_MONTOFINAL.Value*(1-Get_RedondeoReemplValores(Sesion.Sector)/100), 2)) < 0, Grid, 'El total de los valores no puede ser menor que la deuda total');

  //Graba los temporales
  DoABM;
end;

procedure TfrmAdminReemplazoValores.ClearPagos;
begin
  fraVA_TIPO.Clear;
  edVA_IMPORTE.Clear;
  fraVA_IDBANCO.Clear;
  edVA_NROCHEQUE.Clear;
  cmbVA_VENCIMIENTO.Clear;
  edRD_IMPORTEINTERES.Clear;
  chkNegociable.Checked := False;
  CambiarModoPago(nil);
  
  //Esto actualiza el sdqConsulta
  sdqConsulta.Refresh;
end;

procedure TfrmAdminReemplazoValores.GridDblClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.eof then
  begin
    fraVA_TIPO.Value       := sdqConsulta.FieldByName('VA_TIPO').AsInteger;
    edVA_IMPORTE.Value     := sdqConsulta.FieldByName('VA_IMPORTE').AsFloat;
    fraVA_IDBANCO.Value    := sdqConsulta.FieldByName('VA_IDBANCO').AsInteger;
    edVA_NROCHEQUE.Text    := sdqConsulta.FieldByName('VA_NROCHEQUE').AsString;
    cmbVA_VENCIMIENTO.Date := sdqConsulta.FieldByName('VA_VENCIMIENTO').AsDateTime;
    chkNegociable.Checked  := (sdqConsulta.FieldByName('VA_NEGOCIABLE').AsString = 'S');

    Do_HabilitarValoresReemplazantes;
  end;
end;

procedure TfrmAdminReemplazoValores.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
																											var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.Eof then
    if sdqConsulta.FieldByName('VA_ESTADO').AsString <> '01' then
      AFont.Color := clGray;
end;

procedure TfrmAdminReemplazoValores.CargarDatos;
var
  Query: TSDQuery;
  sSql: String;  
begin
  ////////////////////////////////////////////////////
  //  Actualizo los registros en la tabla temporal  //
  ////////////////////////////////////////////////////
  sSql :=
  	'INSERT INTO TVA_VALOR (VA_ID, VA_TIPO, VA_IMPORTE, VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE,' +
    											' VA_NROCHEQUE, VA_USUARIO)' +
          				' (SELECT VA_ID, VA_IDTIPOVALOR, VA_IMPORTE, VA_IDBANCO, VA_VENCIMIENTO, VA_ESTADO, VA_NEGOCIABLE,' +
                  				' VA_NROCHEQUE, :p1' +
          					 ' FROM ZVA_VALOR, ZRD_REEMPLAZODETALLE' +
          					' WHERE RD_IDREEMPLAZOVALOR = :p2' +
          						' AND RD_IDVALOR = VA_ID' +
          						' AND RD_TIPO = ''E'')';
  EjecutarSqlEx(sSql, [Sesion.UserID, fRV_ID]);
  /////////////////////////////////////////////////////////
  //  Actualizo los campos de la cabecera del reemplazo  //
  /////////////////////////////////////////////////////////
  sSql :=
  	'SELECT RV_MONTOINICIAL, RV_INTERESMORA, RV_GASTOADMINISTRATIVO, RV_TASAINTERESMENSUAL, RV_PORCDESCINTERES,' +
    			' RV_MONTODESCINTERES, RV_MONTOTOTAL, RV_CANTIDADCUOTA' +
     ' FROM ZRV_REEMPLAZOVALOR ' +
    ' WHERE RV_ID = :p1';
  Query := GetQueryEx(sSql, [fRV_ID]);
  try
    if not Query.Eof then
    begin
      edRV_MONTOINICIAL.Value        := Query.FieldByName('RV_MONTOINICIAL').AsFloat;
      edRV_INTERESMORA.Value         := Query.FieldByName('RV_INTERESMORA').AsFloat;
      edRV_GASTOADMINISTRATIVO.Value := Query.FieldByName('RV_GASTOADMINISTRATIVO').AsFloat;
      edRV_TASAINTERESMENSUAL.Value  := Query.FieldByName('RV_TASAINTERESMENSUAL').AsFloat;
      edRV_PORCDESCINTERES.Value     := Query.FieldByName('RV_PORCDESCINTERES').AsFloat;
      edRV_MONTODESCINTERES.Value    := Query.FieldByName('RV_MONTODESCINTERES').AsFloat;
      edRV_MONTOFINAL.Value          := Query.FieldByName('RV_MONTOTOTAL').AsFloat;
      edRV_CANTIDADCUOTA.Value       := Query.FieldByName('RV_CANTIDADCUOTA').AsInteger;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmAdminReemplazoValores.edRD_IMPORTEINTERESChange(Sender: TObject);
begin
  edVA_IMPORTE.Value := edRV_MONTOFINAL.Value / edRV_CANTIDADCUOTA.Value + edRD_IMPORTEINTERES.Value;
end;

function TfrmAdminReemplazoValores.Get_GastosBancarios: Double;
var
  sSql: String;
begin
  sSql :=
  	'SELECT DEUDA.Get_GastosBancarios' +
     ' FROM DUAL';

  Result := ValorSqlExtended(sSql);
end;

procedure TfrmAdminReemplazoValores.sdqAdicAfterOpen(DataSet: TDataSet);
begin
  inherited;

  edRV_MONTOINICIAL.Value := ObtenerSuma(GridAdicionales, 'VA_IMPORTE');
  //VCLExtra.LockControls([edRV_MONTOINICIAL], DataSet.RecordCount > 1);

  if sdqAdic.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqAdic.FieldByName('VA_IMPORTE')).Currency := True;
end;

procedure TfrmAdminReemplazoValores.tbImprimirClick(Sender: TObject);
var
  IdValor: TTableId;
begin
  Verificar(HuboModificacion, nil, 'Existen modificaciones pendientes de grabar.');

  tbImprimir.Enabled := False;
  try
    IdValor := StrToInt(fListaValores[0]);

    PrepararListado(IdValor);
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmAdminReemplazoValores.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('VA_IMPORTE')).Currency := True;
end;

procedure TfrmAdminReemplazoValores.Do_ActualizarEstadoPlanValores;
var
  sTipo, sEstado, sSql: String;
  IdPlanPago: TTableId;
  FAprobado: TDateTime;
begin
  // recorro los valores reemplazados
  sdqAdic.First;

  while not sdqAdic.Eof do
    begin
      sSql :=
      	'SELECT DISTINCT(PC_IDPLANPAGO) IDPLANPAGO' +
         ' FROM ZPC_PLANCUOTA, ZPV_PLANVALOR' +
        ' WHERE PV_IDVALOR = :IDVALOR' +
        	' AND PV_IDPLANCUOTA = PC_ID';

      // para cada valor, busco los dintos planes en los que puede estar y
      // actualizo el estado del plan si corresponde
      with GetQueryEx(sSql, [sdqAdic.FieldByName('VA_ID').AsInteger]) do
      try
      	while not Eof do
        begin
        	IdPlanPago  := FieldByName('IDPLANPAGO').AsInteger;

          Get_TipoEstadoFAprobadoPlan(IdPlanPago, sTipo, sEstado, FAprobado);

          if (sTipo = 'P') and (sEstado = '05') then         // Plan
          	sEstado := '03'                                  // Plan Pendiente de imputación
          else if (sTipo = 'C') and (sEstado = '09') then    // Convenio
          	sEstado := '07'                                  // Convenio Pendiente de imputación
          else if (sTipo = 'E') and (sEstado = '13') then    // Cobro con Estado de Deuda
          	sEstado := '11'                                  // Cobro con Estado de Deuda Pendiente de imputación
          else if (sTipo = 'B') and (sEstado = '17') then    // Convenio Cuota Bonificada
          	sEstado := '15'                                  // Convenio Cuota Bonificada Pendiente de imputación
          else
          	sEstado := '';

          if sEstado <> '' then
          	Do_ActualizarEstPlanPago(IdPlanPago, sEstado, False);

          Next;
        end;
      finally
      	Free;
      end;

    sdqAdic.Next;
  end;

  sdqAdic.First;
end;

end.
