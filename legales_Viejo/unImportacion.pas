unit unImportacion;

{----------------------------------------------------------------------------------------------------------------------
   Modulo de Importacion de Siniestros desde un archivo Excel. (xls)
   Autor: EVila.
}

interface

uses
  {$IFNDEF VER130} Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, StdCtrls, Db, SDEngine,
  RxLookup, OleServer, artSeguridad, RXDBCtrl, ArtComboBox, ArtDBGrid, Buttons, ComCtrls,
  Excel2000;

type
  TfrmImportacion = class(TForm)
    GroupBox1: TGroupBox;
    rbRecuperaSI: TRadioButton;
    rbRecuperaNO: TRadioButton;
    GroupBox2: TGroupBox;
    cmbMotivo: TRxDBLookupCombo;
    sdqMotivo: TSDQuery;
    dsMotivo: TDataSource;
    GroupBox3: TGroupBox;
    btnCargaGrilla: TButton;
    btnCargaTabla: TButton;
    btnSalir: TButton;
    OpenDialog: TOpenDialog;
    Seguridad: TSeguridad;
    lbCantProc: TLabel;
    sdqConsulta: TSDQuery;
    dsConulta: TDataSource;
    ArtDBGrid: TArtDBGrid;
    btnStop: TBitBtn;
    brProgres: TGroupBox;
    prbProgres: TProgressBar;
    lbPosActual: TLabel;
    procedure btnCargaGrillaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																 Highlight: Boolean);
    procedure btnCargaTablaClick(Sender: TObject);
  private
    ExcelApplication: TExcelApplication;
    
    procedure DoCargaExcel(Sender: TObject);
    procedure DoCargaTabla(Sender: TObject);
    procedure DoPasajeTmpToReal(Sender: TObject);
  public
  end;

var
	bStop         : Boolean;
  bExisteErrores: Boolean;
  iTotalRow     : Integer;

implementation

uses
	unDmPrincipal, AnsiSql, SqlFuncs, unPrincipal, General, CustomDlgs, ValFuncs;

{$R *.DFM}

procedure TfrmImportacion.btnCargaGrillaClick(Sender: TObject);
begin
	if (not rbRecuperaSI.Checked) or (not rbRecuperaSI.Checked) then
  	MsgBox('Es necesario identificar si recupera o no los siniestros.', MB_ICONEXCLAMATION, 'Atención')
  else
  begin
    brProgres.Visible := False;
    bStop := True;
    DoCargaExcel(nil);
    DoCargaTabla(nil);
    btnStop.Visible := False;
	end;
end;

procedure TfrmImportacion.DoCargaExcel(Sender: TObject);
var
  IIndex: OleVariant;
  iRow: Integer;
  iRowInsert: Integer;
  NomFich: WideString;
  sDato: String;
  sDatoFecha: String;
  sError: String;
  sNroOrden: String;
  sNroSiniestro: String;
  sRecupera: String;
  sSqlTrans: TSql;
	WorkBk: _WorkBook;
  WorkSheet: _WorkSheet;
{$IFNDEF VER130}
	RangeExcel: ExcelRange;
{$ELSE}
	RangeExcel: Range;
{$ENDIF}
begin
	sdqConsulta.Close;
  bExisteErrores     := False;
  OpenDialog.Execute;
  NomFich            := OpenDialog.FileName;
  IIndex             := 1;
  iRowInsert         := 0;
  ExcelApplication.Connect;

  // Open the Excel File
  ExcelApplication.WorkBooks.Open(NomFich, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  																EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
//    ExcelApplication.WorkBooks.Open(NomFich, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, 0);
	WorkBk    := ExcelApplication.WorkBooks.Item[IIndex];
  WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

  // In order to know the dimension of the WorkSheet, i.e the number of rows and the
  // number of columns, we activate the last non-empty cell of it
  WorkSheet.Cells.SpecialCells(xlCellTypeLastCell,EmptyParam).Activate;

  // Carga la tabla.
  EjecutarSql('DELETE FROM TMP_RECUPERO WHERE MP_USUARIO = ' + SQLString(frmPrincipal.DBLogin.UserId, True));
  sSqlTrans := TSql.Create('TMP_RECUPERO');
  if rbRecuperaSI.Checked then
  	sRecupera := '01'
  else
  	sRecupera := '02';

  try
  	ExcelApplication.ActiveCell.SpecialCells(xlLastCell, EmptyParam).Select;
    ExcelApplication.ActiveCell.Offset[3, 0].Select;
    ExcelApplication.ActiveCell.End_[xlToLeft].Select;
    ExcelApplication.ActiveCell.End_[xlUp].Select;
    iTotalRow       := ExcelApplication.ActiveCell.Row ;
    btnStop.Visible := True;
    iRow            := 1;
    lbCantProc.Caption := '1 / ' + IntToStr(iTotalRow);
    while (iRow <= iTotalRow) and bStop do
    begin
    	RangeExcel := ExcelApplication.Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)];
      sError     := '';

      sSqlTrans.Clear;
      sNroSiniestro := RangeExcel.Text;
      if IsInteger(sNroSiniestro) then
      begin
      	sSqlTrans.Fields.Add('MP_SINIESTRO', sNroSiniestro);

        // Existe en Sex_Expedientes.
        if not ExisteSql('SELECT 1 FROM SEX_EXPEDIENTES WHERE EX_SINIESTRO = ' + sNroSiniestro) then
        	sError := sError + 'El Siniestro no existe. ';

        RangeExcel := RangeExcel.Next;
        sNroOrden  := RangeExcel.Text;
        sSqlTrans.Fields.Add('MP_ORDEN',Integer(RangeExcel.Value), False);

        // Control si existe siniestro + orden el la tabla de recupero.
        if ExisteSql('SELECT 1 FROM LRS_RECUPEROSINIESTROS WHERE RS_SINIESTRO = ' + sNroSiniestro + ' and RS_ORDEN = ' + sNroOrden) then
        	sError := sError + 'El Siniestro ya existe. ';

        // Fecha.
        RangeExcel := RangeExcel.Next;
        sDatoFecha := RangeExcel.Text;
        sSqlTrans.Fields.Add('MP_FECHA', sDatoFecha);

        // Abogado; Estudio.
        RangeExcel := RangeExcel.Next;
        sDato      := RangeExcel.Text;
        sSqlTrans.Fields.Add('MP_ABOGADO', sDato);

        // Control que exista el abogado en la tabla LBO_Abogados.
        if sDato <> '' then
        	if not ExisteSql('SELECT 1 FROM LEGALES.LBO_ABOGADO WHERE BO_ID = ' + sDato) then
          	sError := sError + 'El Abogado no existe. ';

        // Usuario que Cargo.
        sSqlTrans.Fields.Add('MP_USUARIO', frmPrincipal.DBLogin.UserId);

      	// Control.
        if sError <> '' then
        	sSqlTrans.Fields.Add('MP_ERROR', sError);

        EjecutarSql(sSqlTrans.InsertSql);
        iRowInsert := iRowInsert + 1;
      end;

      lbCantProc.Caption := IntToStr(iRow) + ' / ' + IntToStr(iTotalRow);
      iRow := iRow + 1;
      Application.ProcessMessages;
    end;
    iTotalRow := iRowInsert;
    lbCantProc.Caption := IntToStr(1) + ' / ' + IntToStr(iTotalRow);
	finally
  	// Quit Excel and Disconnect the Server
    ExcelApplication.Disconnect;
    ExcelApplication.Quit;
    sSqlTrans.Free;
  end;
end;

procedure TfrmImportacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuImportacion.Enabled := True;
  Action := caFree;
end;

procedure TfrmImportacion.btnSalirClick(Sender: TObject);
begin
	EjecutarSql('DELETE FROM TMP_RECUPERO WHERE MP_USUARIO = ' + SQLString(frmPrincipal.DBLogin.UserId, True));
  frmPrincipal.mnuImportacion.Enabled := True;
  Close;
end;

procedure TfrmImportacion.DoCargaTabla(Sender: TObject);
var
	sSql: String;
begin
	sSql :=
		'SELECT MP_SINIESTRO, MP_ORDEN, MP_FECHA, MP_ERROR, BO_NOMBRE, MP_ABOGADO, MP_USUARIO, MP_FECHA, A.BO_ID' +
     ' FROM TMP_RECUPERO  r, LEGALES.lbo_Abogado A' +
    ' WHERE r.MP_ABOGADO = a.BO_ID (+)' +
    	' AND MP_USUARIO = ' + SQLString(frmPrincipal.DBLogin.UserId, True) + ' ORDER BY MP_ERROR';
	sdqConsulta.SQL.Text := sSql;
  sdqConsulta.Open;
end;

procedure TfrmImportacion.FormCreate(Sender: TObject);
begin
	ExcelApplication:= TExcelApplication.Create(Self);
  sdqMotivo.Open;
end;

procedure TfrmImportacion.btnStopClick(Sender: TObject);
begin
	bStop := False;
end;

procedure TfrmImportacion.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																								 Highlight: Boolean);
begin
	// Determina si esta seleccionado. (Highlight)
	if Highlight then
  	lbCantProc.Caption := IntToStr(sdqConsulta.RecNo {$IFDEF VER150}+ 1{$ENDIF}) + ' / ' + IntToStr(iTotalRow);

  if sdqConsulta.FieldByName('MP_ERROR').AsString <> '' then
  begin
  	AFont.Color     := clRed;
//        Background      := clRed;
		bExisteErrores  := True;
	end;
end;

procedure TfrmImportacion.btnCargaTablaClick(Sender: TObject);
begin
	if (not rbRecuperaSI.Checked) or (not rbRecuperaSI.Checked) then
  begin
  	MsgBox('Es necesario identificar si recupera o no los siniestros.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  if cmbMotivo.Text = '' then
  begin
  	MsgBox('Es necesario identificar el motivo del recupero.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  if bExisteErrores then
  begin
  	MsgBox('Existen errores en el proceso, por tal motivo no sera posible incorporar dicho archivo.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

	// Carga desde la tabla MP_Recupero a la tabla LRS_RECUPEROSINIESTROS
  DoPasajeTmpToReal(nil);
end;

procedure TfrmImportacion.DoPasajeTmpToReal(Sender: TObject);
var
  iRow: Integer;
  iTotalRow: Integer;
  rMontoRecuperar: Currency;
  sEstado: String;  
	sSqlTrans: TSql;
  sSqlValor: String;
begin
	// Controla que existan datos en la grilla para ser transferidos.
  if not sdqConsulta.Active then
  begin
  	MsgBox('Es necesario cargar la grilla para transferir los datos.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  if rbRecuperaSI.Checked then
  	sEstado := '01'
  else
  	sEstado := '02';

	brProgres.Visible := True;
  iRow              := 0;
  iTotalRow         := ValorSql('SELECT COUNT(*) FROM TMP_RECUPERO WHERE MP_USUARIO = ' + SQLString(frmPrincipal.DBLogin.UserId, True));
  prbProgres.Max    := iTotalRow;

  sSqlTrans := TSql.Create('LRS_RECUPEROSINIESTROS');
  try
  	sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
    	Inc(iRow);
      prbProgres.Position:= iRow;
      prbProgres.Show;
      sSqlTrans.Clear;
      sSqlTrans.Fields.Add('RS_SINIESTRO', 							 sdqConsulta.FieldByName('MP_SINIESTRO').AsString);
      sSqlTrans.Fields.Add('RS_ORDEN',     							 sdqConsulta.FieldByName('MP_ORDEN').AsString);
      sSqlTrans.Fields.Add('RS_ESTADO',    							 sEstado);
      sSqlTrans.Fields.Add('RS_MOTIVO',    							 cmbMotivo.Value);
      sSqlTrans.Fields.Add('RS_FECHA',     							 sdqConsulta.FieldByName('MP_FECHA').AsString);
      sSqlTrans.Fields.Add('RS_ABOGADO',   							 sdqConsulta.FieldByName('BO_ID').AsInteger);

      sSqlValor :=
      	'SELECT NVL(SUM(ART.LIQ.GET_PRESTACIONES(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA)), 0)' +
         ' FROM SEX_EXPEDIENTES' +
        ' WHERE EX_SINIESTRO = ' + sdqConsulta.fieldByName('MP_SINIESTRO').AsString +
        	' AND EX_ORDEN = ' + sdqConsulta.fieldByName('MP_ORDEN').AsString;
      rMontoRecuperar := ValorSQL(sSqlValor);

      sSqlTrans.Fields.AddExtended('RS_MONTOARECUPERAR', rMontoRecuperar, ALL_DECIMALS, False);
      sSqlTrans.Fields.Add('RS_USUALTA',    						 sdqConsulta.FieldByName('MP_USUARIO').AsString);
      sSqlTrans.Fields.Add('RS_FECHAALTA',  						'Actualdate', False);

      EjecutarSql(sSqlTrans.InsertSql);
      sdqConsulta.Next;
    end;

    if iRow > 0 then
    begin
    	MsgBox('Se han transferido ' + IntToStr(iRow) + ' siniestros', MB_ICONEXCLAMATION, 'Transferencia Terminada');
      sdqConsulta.Close;
      brProgres.Visible := False;
    end
    else
    	MsgBox('Error en la transferencia de siniestros.', MB_ICONEXCLAMATION, 'Transferencia Terminada');
	finally
  	sSqlTrans.Free;
  end;
end;

end.
