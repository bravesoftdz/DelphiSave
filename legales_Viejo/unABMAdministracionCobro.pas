unit unABMAdministracionCobro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CurrEdit, StdCtrls, Mask, ToolEdit,
  DateComboBox, RxLookup, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Db, SDEngine;

type
  TfrmABMAdministracionCobro = class(TForm)
    ToolBar: TToolBar;
    tbNuevo: TToolButton;
    ArtDBGrid: TArtDBGrid;
    Label1: TLabel;
    cmbFormaPago: TRxDBLookupCombo;
    Label2: TLabel;
    lbFechaVto: TLabel;
    edRC_FECHAVENCIMIENTO: TDateComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edRC_NROCOMPROBANTE: TEdit;
    edRC_MONTO: TCurrencyEdit;
    edRC_FECHAPAGO: TDateComboBox;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    tblSeparador1: TToolButton;
    tbEliminar: TToolButton;
    tblSeparador3: TToolButton;
    tbGrabar: TToolButton;
    tblSeparador4: TToolButton;
    tbSalir: TToolButton;
    sdqFormaPago: TSDQuery;
    dsFormaPago: TDataSource;
    edRC_OBSERVACIONES: TMemo;
    Label3: TLabel;
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  public
  	function GetCargaDatos(NroSiniestroParam, NroOrdenParam: Integer): Boolean;
  end;
var
  frmABMAdministracionCobro: TfrmABMAdministracionCobro;
  iNRO_SINIESTRO, iNRO_ORDEN : Integer;

const
	LGD_COBRO_ALTA  = 'Alta... (Administración de Cobros)';
  LGD_COBRO_MODIF = 'Modificación... (Administración de Cobros)';
  LGD_COBRO_BAJA  = 'Baja... (Administración de Cobros)';

implementation

uses
	unPrincipal, AnsiSql, CustomDlgs, SqlFuncs, unDmPrincipal, General, unABMAdminstracionRecupero,
  VCLExtra;

{$R *.DFM}

function TfrmABMAdministracionCobro.GetCargaDatos(NroSiniestroParam, NroOrdenParam: Integer): Boolean;
begin
  with sdqConsulta do
  begin
  	Close;
  	SQL.Text :=
      'SELECT L.RC_SINIESTRO, L.RC_ORDEN, L.RC_NUMERO, L.RC_TIPO, T.TB_DESCRIPCION, TO_CHAR(L.RC_NROCOMPROBANTE) RC_NROCOMPROBANTE, L.RC_MONTO, ' +
             'L.RC_OBSERVACIONES, L.RC_FECHAVENCIMIENTO, L.RC_FECHAPAGO, L.RC_USUALTA, L.RC_FECHAALTA, L.RC_USUMODIF, ' +
             'L.RC_FECHAMODIF, L.RC_USUBAJA, L.RC_FECHABAJA ' +
        'FROM LRC_RECUPEROCOBRO L, CTB_TABLAS T ' +
       'WHERE L.RC_TIPO = T.TB_CODIGO ' +
         'AND T.TB_CLAVE = ''COBRO'' ' +
         'AND L.RC_SINIESTRO = ' + SqlValue(NroSiniestroParam) + ' ' +
         'AND L.RC_ORDEN = ' + SqlValue(NroOrdenParam) + ' ' +
       'UNION ALL ' +
      'SELECT RS_SINIESTRO, RS_ORDEN, XP_ID, NULL, TVAL.TV_DESCRIPCION TIPO, VA_NROCHEQUE, VA_IMPORTE, BA_NOMBRE, VA_VENCIMIENTO, ' +
             'COBRANZA.GET_FECHACONCILIADO(VA_ID), VA_USUALTA, VA_FECHAALTA, VA_USUMODIF, VA_FECHAMODIF, VA_USUBAJA, VA_FECHABAJA ' +
        'FROM LRS_RECUPEROSINIESTROS, LXV_RECUPEROVALOR, ZVA_VALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN, ZBA_BANCO, OTV_TIPOVALOR TVAL ' +
       'WHERE BA_ID(+) = VA_IDBANCO ' +
         'AND VA_FECHARECHAZO IS NULL ' +
         'AND VA_IDTIPOVALOR = TVAL.TV_ID(+) ' +
         'AND XV_IDVALOR = VA_ID(+) ' +
         'AND XV_IDCUOTA(+) = XC_ID ' +
         'AND XC_IDPLANPAGO = XP_ID ' +
         'AND XV_FECHABAJA IS NULL ' +
         'AND RS_ID = XP_IDRECUPEROSINIESTRO ' +
         'AND RS_SINIESTRO = ' + SqlValue(NroSiniestroParam) + ' ' +
         'AND RS_ORDEN = ' + SqlValue(NroOrdenParam);

  	Open;
  end;

  iNRO_SINIESTRO := NroSiniestroParam;
  iNRO_ORDEN     := NroOrdenParam;
  Result := ShowModal = mrOk;
end;

procedure TfrmABMAdministracionCobro.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmABMAdministracionCobro.FormCreate(Sender: TObject);
begin
  Self.Caption := LGD_COBRO_ALTA;
  sdqFormaPago.Open;

  VCLExtra.LockControls([cmbFormaPago, edRC_MONTO, edRC_NROCOMPROBANTE, edRC_OBSERVACIONES, edRC_FECHAPAGO, edRC_FECHAVENCIMIENTO]);
end;

procedure TfrmABMAdministracionCobro.tbNuevoClick(Sender: TObject);
begin
  cmbFormaPago.ClearValue;
  edRC_MONTO.Clear;
  edRC_FECHAPAGO.Clear;
  edRC_NROCOMPROBANTE.Clear;
  edRC_FECHAVENCIMIENTO.Clear;
  edRC_OBSERVACIONES.Clear;
  Caption                       := LGD_COBRO_ALTA;
  edRC_FECHAVENCIMIENTO.Enabled := True;
  edRC_MONTO.Enabled            := True;
  edRC_NROCOMPROBANTE.Enabled   := True;
  cmbFormaPago.Enabled          := True;
  edRC_FECHAPAGO.Enabled        := True;
  edRC_OBSERVACIONES.Enabled    := True;
end;

procedure TfrmABMAdministracionCobro.tbGrabarClick(Sender: TObject);
var
	sSqlTrans: TSql;
  iNro     : Integer;
begin
	// Control tanto para el Alta o Modificacion.
	if (Self.Caption = LGD_COBRO_ALTA) or (Self.Caption = LGD_COBRO_MODIF) then
  begin
  	if cmbFormaPago.Value = '' then
    begin
    	InvalidMsg(cmbFormaPago, 'La forma de pago no puede quedar en blanco.');
      Abort;
    end;

    if edRC_FECHAPAGO.IsEmpty then
    begin
    	InvalidMsg(edRC_FECHAPAGO, 'La fecha de pago no puede quedar en blanco.');
      Abort;
    end;
  end;
	// Fin.
  
  sSqlTrans := TSql.Create('LRC_RECUPEROCOBRO');
  sSqlTrans.PrimaryKey.Add('RC_SINIESTRO', 		iNRO_SINIESTRO);
  sSqlTrans.PrimaryKey.Add('RC_ORDEN', 				iNRO_ORDEN);
  sSqlTrans.Fields.Add('RC_TIPO', 						cmbFormaPago.Value);
  sSqlTrans.Fields.Add('RC_FECHAPAGO', 				edRC_FECHAPAGO.Date);
  sSqlTrans.Fields.Add('RC_FECHAVENCIMIENTO', edRC_FECHAVENCIMIENTO.Date);
  sSqlTrans.Fields.AddExtended('RC_MONTO', 		edRC_MONTO.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.Add('RC_NROCOMPROBANTE', 	edRC_NROCOMPROBANTE.Text);
  sSqlTrans.Fields.Add('RC_OBSERVACIONES', 		edRC_OBSERVACIONES.Text);

  try
  	try
    	if Self.Caption = LGD_COBRO_ALTA then
      begin
      	iNro := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max(RC_NUMERO), 0), 0, 1, NVL(Max(RC_NUMERO), 0) + 1) ' +
                          ' FROM LRC_RECUPEROCOBRO' +
                         ' WHERE RC_SINIESTRO = ' + IntToStr(iNRO_SINIESTRO) +
                           ' AND RC_ORDEN = ' + IntToStr(iNRO_ORDEN));
        sSqlTrans.PrimaryKey.Add('RC_NUMERO', iNro);
        sSqlTrans.Fields.Add('RC_FECHAALTA', 'Actualdate', False);
        sSqlTrans.Fields.Add('RC_USUALTA', 		frmPrincipal.DBLogin.UserId);
        sSqlTrans.SqlType := stInsert;
      end
      else if Self.Caption = LGD_COBRO_MODIF then
      begin
      	iNro := sdqConsulta.FieldByName('RC_NUMERO').AsInteger;
        sSqlTrans.PrimaryKey.Add('RC_NUMERO', iNro);
        sSqlTrans.Fields.Add('RC_FECHAMODIF', 'Actualdate', False);
        sSqlTrans.Fields.Add('RC_USUMODIF', 	frmPrincipal.DBLogin.UserId);
        sSqlTrans.SqlType := stUpdate;
      end
      else
      begin
      	iNro := sdqConsulta.FieldByName('RC_NUMERO').AsInteger;
        sSqlTrans.PrimaryKey.Add('RC_NUMERO', iNro);
        iNro := ValorSql('SELECT IIF_Compara( ''>'', NVL(Min(RC_NUMERO), 0), 0, -1, NVL(Min(RC_NUMERO), 0) - 1)' +
                          ' FROM LRC_RECUPEROCOBRO' +
                         ' WHERE RC_SINIESTRO = ' + IntToStr(iNRO_SINIESTRO) +
                           ' AND RC_ORDEN = ' + IntToStr(iNRO_ORDEN));
        sSqlTrans.Fields.Add('RC_NUMERO', 		iNro);
        sSqlTrans.Fields.Add('RC_FECHABAJA', 'Actualdate', False);
        sSqlTrans.Fields.Add('RC_USUBAJA', 		frmPrincipal.DBLogin.UserId);
        sSqlTrans.SqlType := stUpdate;
      end;
      EjecutarSQL(sSqlTrans.Sql);

      ModalResult := mrOk;

      //.Si es un alta cambia a modificación.
      if Caption = LGD_COBRO_ALTA then
      begin
      	MsgBox('El alta se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
//              frmABMAdministracionCobro.tbSalirClick( self );
			end
      else if Caption = LGD_COBRO_MODIF then
      begin
      	MsgBox('La modificación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
//               frmABMAdministracionCobro.tbSalirClick( self );
			end
      else
      begin
      	MsgBox('La baja se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
//               frmABMAdministracionCobro.tbSalirClick( self );
			end;
		except
    	on Error:exception do
      	ErrorMsg(Error);
    end;
	finally
  	sSqlTrans.Free;
  end;
end;

procedure TfrmABMAdministracionCobro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	tbSalirClick(nil);
end;

procedure TfrmABMAdministracionCobro.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if not sdqConsulta.isEmpty then
  begin
  	Self.Caption               		:= LGD_COBRO_MODIF;
    edRC_FECHAPAGO.Date        		:= sdqConsulta.FieldByName('RC_FECHAPAGO').AsDateTime;
    edRC_FECHAVENCIMIENTO.Date 		:= sdqConsulta.FieldByName('RC_FECHAVENCIMIENTO').AsDateTime;
    edRC_FECHAVENCIMIENTO.Enabled := False;
    edRC_MONTO.Value           		:= sdqConsulta.FieldByName('RC_MONTO').AsCurrency;
    edRC_MONTO.Enabled         		:= False;
    edRC_NROCOMPROBANTE.Text   		:= sdqConsulta.FieldByName('RC_NROCOMPROBANTE').AsString;
    edRC_NROCOMPROBANTE.Enabled 	:= False;
    edRC_OBSERVACIONES.Text    		:= sdqConsulta.FieldByName('RC_OBSERVACIONES').AsString;
    cmbFormaPago.Value         		:= sdqConsulta.FieldByName('RC_TIPO').AsString;
    cmbFormaPago.Enabled       		:= False;
    edRC_FECHAPAGO.Enabled     		:= True;
    edRC_OBSERVACIONES.Enabled 		:= True;
    if sdqConsulta.FieldByName('RC_NUMERO').AsInteger < 0 then
    begin
    	Self.Caption               := LGD_COBRO_BAJA;
      edRC_FECHAPAGO.Enabled     := False;
      edRC_OBSERVACIONES.Enabled := False;
    end;
  end;
end;

procedure TfrmABMAdministracionCobro.tbEliminarClick(Sender: TObject);
begin
	if not sdqConsulta.isEmpty then
  begin
    Self.Caption               := LGD_COBRO_BAJA;
    edRC_FECHAPAGO.Date        := sdqConsulta.FieldByName('RC_FECHAPAGO').AsDateTime;
    edRC_FECHAVENCIMIENTO.Date := sdqConsulta.FieldByName('RC_FECHAVENCIMIENTO').AsDateTime;
    edRC_MONTO.Value           := sdqConsulta.FieldByName('RC_MONTO').AsCurrency;
    edRC_NROCOMPROBANTE.Text   := sdqConsulta.FieldByName('RC_NROCOMPROBANTE').AsString;
    edRC_OBSERVACIONES.Text    := sdqConsulta.FieldByName('RC_OBSERVACIONES').AsString;
    cmbFormaPago.Value         := sdqConsulta.FieldByName('RC_TIPO').AsString;
	end;
end;

procedure TfrmABMAdministracionCobro.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
																														var Background: TColor; Highlight: Boolean);
begin
	if sdqConsulta.FieldByName('RC_NUMERO').AsInteger < 0 then
  	AFont.Color:= clRed;
end;

end.
