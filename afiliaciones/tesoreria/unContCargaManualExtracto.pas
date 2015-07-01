unit unContCargaManualExtracto;

{********************************************************}
{                                                        }
{    Contaduría, Carga Manual de Extracto                }
{                                                        }
{    Autor: Federico Firenze                             }
{    Análisis: Sebastián Gabrielli                       }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones(Tesorería)                  }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraStaticCodigoDescripcion, PatternEdit, CurrEdit, unArtDBAwareFrame, DBCtrls, Buttons, IntEdit;

type
  TfrmContCargaManualExtracto = class(TfrmCustomGridABM)
    lbBanco: TLabel;
    lbCuenta: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    fraBanco: TfraStaticCodigoDescripcion;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label3: TLabel;
    edEB_FECHAMOVIMIENTO: TDateComboBox;
    edEB_FECHAVALOR: TDateComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edEB_DEBITOCREDITO: TComboBox;
    Label6: TLabel;
    edEB_IMPORTE: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edEB_DESCRIPCION: TEdit;
    btnContinuar: TButton;
    fraOperaciones: TfraStaticCodigoDescripcion;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    pnlTotales: TPanel;
    lbSaldoFinal: TLabel;
    pnlArriba: TPanel;
    lbSaldoInicial: TLabel;
    edEB_NROCOMP: TIntEdit;
    edEB_NROCOMP2: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
    procedure fpAbmEnter(Sender: TObject);
    procedure edEB_FECHAMOVIMIENTOChange(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure fraOperacionescmbDescripcionDropDown(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    bAllowInsert: Boolean;

    procedure fraBancoOnChange(Sender: TObject);
    procedure fraCuentaBancariaOnChange(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure EnableButtons(AEnabled: Boolean = True); override;    
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmContCargaManualExtracto: TfrmContCargaManualExtracto;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, Numeros, StrFuncs, DateTimeFuncs, unFraCodigoDescripcion,
  unManCodigoExtracto, unGrids, unSesion;

{$R *.DFM}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
{ TfrmContCargaManualExtracto }
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfrmContCargaManualExtracto.ClearControls;
begin
  edEB_FECHAMOVIMIENTO.Clear;
  edEB_FECHAVALOR.Clear;
  edEB_DEBITOCREDITO.ItemIndex := -1;
  edEB_IMPORTE.Clear;
  edEB_NROCOMP.Clear;
  fraOperaciones.Clear;
  edEB_DESCRIPCION.Clear;
end;

procedure TfrmContCargaManualExtracto.ClearData;
begin
  fraBanco.Clear;
  fraCuentaBancaria.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;

  lbSaldoInicial.Caption := '';
  lbSaldoFinal.Caption := '';

  inherited;
end;

procedure TfrmContCargaManualExtracto.LoadControls;
begin
  { Este formulario no modifica los datos, por lo tanto este método no se usa  }
  {
  edEB_FECHAMOVIMIENTO.Date   := sdqConsulta.FieldByName('EB_FECHAMOVIMIENTO').AsDateTime;
  edEB_FECHAVALOR.Date        := sdqConsulta.FieldByName('EB_FECHAVALOR').AsDateTime;
  edEB_DEBITOCREDITO.ItemIdex := ArrayPos(sdqConsulta.FieldByName('EB_DEBITOCREDITO').AsString, ['D', 'C']);
  edEB_IMPORTE.Value          := sdqConsulta.FieldByName('EB_IMPORTE').AsCurrency;
  edEB_NROCOMP.Text           := sdqConsulta.FieldByName('EB_NROCOMP').AsString;
  edEB_CODOPERACION.Text      := sdqConsulta.FieldByName('EB_CODOPERACION').AsString;
  edEB_DESCRIPCION.Text       := sdqConsulta.FieldByName('EB_DESCRIPCION').AsString;
  }
end;

procedure TfrmContCargaManualExtracto.RefreshData;
var
  sSql: String;
  dMaxFecha: TDateTime;
  fSaldoInicial: Extended;
begin
  Verificar(fraBanco.IsEmpty, fraBanco.edCodigo, 'Debe seleccionar un Banco.');
  Verificar(fraCuentaBancaria.IsEmpty, fraCuentaBancaria.edCodigo, 'Debe seleccionar una Cuenta Bancaria.');
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe seleccionar una fecha inicial.');
  
  sSql :=
  	'SELECT EB_ID, EB_FECHAMOVIMIENTO, EB_FECHAVALOR, EB_DEBITOCREDITO, EB_IMPORTE, EB_NROCOMP, EB_CODOPERACION,' +
    			' EB_DESCRIPCION, CO_DESCRIPCION, EB_FECHABAJA,' +
          ' (DECODE(EB_DEBITOCREDITO, ''C'', EB_IMPORTE, 0) - DECODE(EB_DEBITOCREDITO, ''D'', EB_IMPORTE, 0)) * DECODE(EB_FECHABAJA, NULL, 1, 0) MONTO' +
     ' FROM OCO_CODIGOCONCILIACION, OCE_CODIGOEXTRACTO, OEB_EXTRACTOBANCO' +
    ' WHERE CE_ID(+) = EB_IDOPERACION' +
    	' AND CE_IDCODIGOCONC = CO_ID(+)' +
      ' AND EB_CONCILIADO = ''N''' +
      ' AND EB_IDBANCO = ' + SqlValue(fraBanco.Value) +
      ' AND EB_IDCUENTABANCARIA = ' + SqlValue(fraCuentaBancaria.Value);

  sSql := sSql + SqlBetweenDateTime(' AND EB_FECHAMOVIMIENTO', edFechaDesde.Date, edFechaHasta.Date);

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;

  inherited;

  sSql :=
  	'SELECT MAX(SB_FECHA)' +
     ' FROM OSB_SALDOBANCO' +
    ' WHERE SB_IDCUENTABANCARIA = :ID_CUENTA' +
    	' AND SB_FECHA < :FECHA_DESDE';

  dMaxFecha := ValorSqlDateTimeEx(sSQL, [fraCuentaBancaria.Value, TDateTimeEx.Create(edFechaDesde.Date)], 0);
  fSaldoInicial := 0;

  if dMaxFecha = 0 then
  begin
    lbSaldoInicial.Caption := Format('El saldo al %s es de %m.', [FormatDateTime('dd/mm/yyyy', edFechaDesde.Date - 1), fSaldoInicial]);
    lbSaldoFinal.Caption   := Format('El saldo final es de %m.', [ObtenerSuma(Grid, 'Monto')]);
  end
  else
  begin
    sSql :=
    	'SELECT SB_SALDO' +
       ' FROM OSB_SALDOBANCO' +
      ' WHERE SB_IDCUENTABANCARIA = :ID_CUENTA' +
      	' AND SB_FECHA = :MAX_FECHA';

    fSaldoInicial := ValorSqlExtendedEx(sSQL, [fraCuentaBancaria.Value, TDateTimeEx.Create(dMaxFecha)], 0);

    lbSaldoInicial.Caption := Format('El saldo al %s es de %m.', [FormatDateTime('dd/mm/yyyy', dMaxFecha), fSaldoInicial]);
    lbSaldoFinal.Caption   := Format('El saldo final es de %m.', [fSaldoInicial + ObtenerSuma(Grid, 'Monto')]);
  end;
end;

function TfrmContCargaManualExtracto.Validar: Boolean;
begin
  Result := False;
  if edEB_FECHAMOVIMIENTO.Date = 0 then
    InvalidMsg(edEB_FECHAMOVIMIENTO, 'La fecha de movimiento es obligatoria.')

  else if edEB_FECHAVALOR.Date = 0 then
    InvalidMsg(edEB_FECHAVALOR, 'La fecha de valor es obligatoria.')

  else if edEB_DEBITOCREDITO.ItemIndex = -1 then
    InvalidMsg(edEB_DEBITOCREDITO, 'El campo Débito / Crédito es obligatorio.')

  else if SameFloat(edEB_IMPORTE.Value, 0) then
    InvalidMsg(edEB_IMPORTE, 'El importe es obligatorio.')

  else if IsEmptyString(edEB_NROCOMP.Text) then
    InvalidMsg(edEB_NROCOMP, 'El número de comprobante es obligatorio.')

  else if not fraOperaciones.IsSelected then
    InvalidMsg(fraOperaciones, 'El código de operación es obligatorio.')

  else if IsEmptyString(edEB_DESCRIPCION.Text) then
    InvalidMsg(edEB_DESCRIPCION, 'La descripción es obligatoria.')

  else
    Result := True;
end;

procedure TfrmContCargaManualExtracto.fraBancoOnChange(Sender: TObject);
begin
  fraCuentaBancaria.ExtraCondition := ' AND CB_CONCILIACION = ''S''';

  if fraBanco.IsSelected then
    fraCuentaBancaria.ExtraCondition := fraCuentaBancaria.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value)
end;

procedure TfrmContCargaManualExtracto.fraCuentaBancariaOnChange(Sender: TObject);
begin
  if not fraBanco.IsSelected and fraCuentaBancaria.IsSelected then
    fraBanco.Value := StrToInt(fraCuentaBancaria.cmbDescripcion.Cells[4, fraCuentaBancaria.cmbDescripcion.Row]);
end;

procedure TfrmContCargaManualExtracto.FormCreate(Sender: TObject);
begin
  inherited;

  lbSaldoInicial.Caption := '';
  lbSaldoFinal.Caption := '';

  with fraBanco do
  begin
    ShowBajas   := True;
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';

    ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
  end;

  with fraCuentaBancaria do
  begin
    ShowBajas   := True;
    TableName   := 'ZCB_CUENTABANCARIA';
    FieldID     := 'CB_ID';
    FieldCodigo := 'CB_ID';
    FieldDesc   := 'CB_NUMERO';
    FieldBaja   := 'CB_FECHABAJA';
    DynamicCols := True;
    ExtraFields := ', CB_IDBANCO "ID Banco"';
    VisibleExtraFields[0] := False;
    ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
  end;

  with fraOperaciones do
  begin
    ShowBajas   := False;
    ExtraFields := ', CO_DESCRIPCION "Concepto"';
    DynamicCols := True;
    OrderBy     := 'CO_DESCRIPCION';

    SQL := 'SELECT CE_ID AS ' + CD_ALIAS_ID +
                ', CE_CODIGO AS ' + CD_ALIAS_CODIGO +
                ', CE_DESCRIPCION AS ' + CD_ALIAS_DESC +
                ', CO_FECHABAJA AS ' + CD_ALIAS_BAJA + ExtraFields +
            ' FROM OCE_CODIGOEXTRACTO, OCO_CODIGOCONCILIACION' +
           ' WHERE CO_ID = CE_IDCODIGOCONC';
  end;

  Sql.TableName := 'OEB_EXTRACTOBANCO';
  FieldBaja := 'EB_FECHABAJA';
  ShowActived := False;

  bAllowInsert := True;

  fraBanco.OnChange := fraBancoOnChange;
  fraCuentaBancaria.OnChange := fraCuentaBancariaOnChange;
end;

function TfrmContCargaManualExtracto.DoABM: Boolean;
var
  sSQL: String;
  fImporte, fSaldoAnterior: Extended;
  dFecha: TDateTime;
  ID_OSB: Integer;
begin
  Sql.Clear;
  if ModoABM = maAlta then
  begin
    Sql.PrimaryKey.Add('EB_ID',	 					'SEQ_OEB_ID.NEXTVAL', False);
    Sql.Fields.Add('EB_IDBANCO', 					fraBanco.Value);
    Sql.Fields.Add('EB_IDCUENTABANCARIA', fraCuentaBancaria.Value);
    Sql.Fields.Add('EB_FECHAMOVIMIENTO',  edEB_FECHAMOVIMIENTO.Date);
    Sql.Fields.Add('EB_FECHAVALOR', 			edEB_FECHAVALOR.Date);
    Sql.Fields.Add('EB_IMPORTE', 					edEB_IMPORTE.Value);
    Sql.Fields.Add('EB_NROCOMP', 					edEB_NROCOMP.Text + edEB_NROCOMP2.Text);
    Sql.Fields.Add('EB_CODOPERACION', 		fraOperaciones.Codigo);
    Sql.Fields.Add('EB_DESCRIPCION', 			edEB_DESCRIPCION.Text);
    Sql.Fields.Add('EB_CONCILIADO', 			'N');
    Sql.Fields.Add('EB_USUALTA', 					Sesion.UserId);
    Sql.Fields.Add('EB_FECHAALTA', 				exDateTime);
    if edEB_DEBITOCREDITO.ItemIndex = 0 then
      Sql.Fields.Add('EB_DEBITOCREDITO', 'D')
    else
      Sql.Fields.Add('EB_DEBITOCREDITO', 'C');
  end
  else if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('EB_ID', 	 sdqConsulta.FieldByName('EB_ID').AsInteger);
    Sql.Fields.Add('EB_USUBAJA', 	 Sesion.UserId);
    Sql.Fields.Add('EB_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;

  if Result then
  begin
    fImporte := 0;
    dFecha := Now;

    if ModoABM = maAlta then
    begin
      fImporte := edEB_IMPORTE.Value;
      dFecha   := edEB_FECHAVALOR.Date;

      if edEB_DEBITOCREDITO.ItemIndex = 0 then
        fImporte := fImporte * (-1);
    end
    else if ModoABM = maBaja then
    begin
      fImporte := sdqConsulta.FieldByName('EB_IMPORTE').AsFloat;
      dFecha   := sdqConsulta.FieldByName('EB_FECHAVALOR').AsDateTime;

      if sdqConsulta.FieldByName('EB_DEBITOCREDITO').AsString = 'D' then
        fImporte := fImporte * (-1);

      fImporte := fImporte * (-1); // POR SER MODO "BAJA"
    end;

    sdqConsulta.Close; //Para que en vez de hacer "Refresh" haga "tbRefrescarClick"...

    sSQL :=
    	'SELECT SB_ID' +
       ' FROM OSB_SALDOBANCO' +
      ' WHERE SB_IDCUENTABANCARIA = :ID_CUENTA' +
      	' AND SB_FECHA = :FECHA';

    ID_OSB := ValorSqlIntegerEx(sSQL, [fraCuentaBancaria.Value, TDateTimeEx.Create(dFecha)], 0);

    if ID_OSB > 0 then
    begin
      sSQL :=
      	'UPDATE OSB_SALDOBANCO' +
         	' SET SB_FECHA   = :SB_FECHA,' +
          		' SB_SALDO   = SB_SALDO + :IMPORTE,' +
              ' SB_USUALTA = :SB_USUALTA' +
        ' WHERE SB_ID      = :ID';

      EjecutarSQLEx(sSql, [TDateTimeEx.Create(dFecha), fImporte, Sesion.UserID, ID_OSB]);
    end
    else
    begin
      sSQL :=
      	'SELECT SB_SALDO' +
         ' FROM OSB_SALDOBANCO' +
        ' WHERE SB_IDCUENTABANCARIA = :ID_CUENTA' +
        	' AND SB_FECHA = (SELECT MAX(SB_FECHA)' +
                            ' FROM OSB_SALDOBANCO' +
                           ' WHERE SB_IDCUENTABANCARIA = :ID_CUENTA' +
                           	 ' AND SB_FECHA < :FECHA)';
      fSaldoAnterior := ValorSqlExtendedEx(sSQL, [fraCuentaBancaria.Value, fraCuentaBancaria.Value,
                                                  TDateTimeEx.Create(dFecha)], 0);

      sSQL :=
      	'INSERT INTO OSB_SALDOBANCO' +
        					' (SB_ID, SB_IDCUENTABANCARIA, SB_FECHA, SB_SALDO, SB_USUALTA, SB_FECHAALTA)' +
        	 ' VALUES (SEQ_OSB_ID.NEXTVAL, :CUENTA, :FECHA, :SALDO, :USUALTA, ACTUALDATE)';

      EjecutarSQLEx(sSQL, [fraCuentaBancaria.Value, TDateTimeEx.Create(dFecha), fSaldoAnterior+fImporte, Sesion.UserID]);
    end;
  end;
end;

procedure TfrmContCargaManualExtracto.SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
begin
  inherited;

  if Component = tbNuevo then
    bAllowInsert := False;
end;

procedure TfrmContCargaManualExtracto.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbNuevo.Enabled := bAllowInsert and fraBanco.IsSelected and fraCuentaBancaria.IsSelected;
end;

procedure TfrmContCargaManualExtracto.fpAbmEnter(Sender: TObject);
begin
  inherited;
{
  sdqOperaciones.Open;
  sdqOperaciones.First;
  edEB_CODOPERACION.Items.Clear;

  with sdqOperaciones, edEB_CODOPERACION.Items do
    while not Eof do
    begin
      Add(RPad(FieldByName('Codigo').AsString, ' ', 3) + ' | ' +
          RPad(FieldByName('Descripcion').AsString, ' ', 30) + ' | ' +
          FieldByName('Concepto').AsString);
      Next;
    end;

  sdqOperaciones.Close;
}
  if (ModoABM = maAlta) then
  begin
    edEB_FECHAMOVIMIENTO.Date := edFechaDesde.Date;
    edEB_FECHAVALOR.Date      := edFechaDesde.Date;
  end;
end;

procedure TfrmContCargaManualExtracto.edEB_FECHAMOVIMIENTOChange(Sender: TObject);
begin
  inherited;

  edEB_FECHAVALOR.Date := edEB_FECHAMOVIMIENTO.Date;
end;

procedure TfrmContCargaManualExtracto.btnContinuarClick(Sender: TObject);
begin
  if Validar and DoABM then
  begin
    edEB_IMPORTE.Clear;
    edEB_NROCOMP2.Clear;
    InvalidHint(btnContinuar, 'Datos guardados satisfactoriamente.', 'Información');
    edEB_FECHAMOVIMIENTO.SetFocus;
  end;
end;

procedure TfrmContCargaManualExtracto.ToolButton7Click(Sender: TObject);
begin
  try
    frmManCodigoExtracto.Free;
  finally
    frmManCodigoExtracto := TfrmManCodigoExtracto.Create(Self);
    frmManCodigoExtracto.ShowModal;
    fraOperaciones.ClearGrid;
  end;
end;

procedure TfrmContCargaManualExtracto.fraOperacionescmbDescripcionDropDown(Sender: TObject);
begin
  inherited;

  with fraOperaciones do
  begin
    cmbDescripcionDropDown(Sender);
    cmbDescripcion.ColWidths[1] := 160; //Descripción
    cmbDescripcion.ColWidths[4] := 180; //Concepto
  end;
end;

procedure TfrmContCargaManualExtracto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with Dataset do
    TFloatField(FieldByName('EB_IMPORTE')).Currency := True;
end;

end.
