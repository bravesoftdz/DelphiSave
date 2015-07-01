unit unManConsultasRotulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, mwCustomEdit,
  mwHighlighter, mwSqlSyn;

type
  TfrmManConsultasRotulo = class(TfrmCustomGridABM)
    fraRotuloAsociado: TfraCodigoDescripcion;
    edCodigo: TEdit;
    lbCodigo: TLabel;
    lblautorizacion: TLabel;
    lbDescripcion: TLabel;
    edDescripcion: TEdit;
    lbSubconsulta: TLabel;
    edOrden: TIntEdit;
    cbGrafico: TCheckBox;
    lbOrden: TLabel;
    lbLimite: TLabel;
    edLimite: TIntEdit;
    Label4: TLabel;
    lbConsulta: TLabel;
    CoolBar1: TCoolBar;
    tbarSql: TToolBar;
    tbSqlLimpiar: TToolButton;
    ToolButton1: TToolButton;
    tbSqlSintaxis: TToolButton;
    tbArmarSql: TToolButton;
    ToolButton2: TToolButton;
    tbSqlVistaPrevia: TToolButton;
    ToolButton12: TToolButton;
    tbSqlImprimir: TToolButton;
    mwSql: TmwCustomEdit;
    PrinterSetupDialog: TPrinterSetupDialog;
    qpCampos: TQueryPrint;
    mwSqlSyn: TmwSqlSyn;
    fraRotuloFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    edSubconsulta: TmwCustomEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbSqlSintaxisClick(Sender: TObject);
    procedure tbArmarSqlClick(Sender: TObject);
    procedure tbSqlImprimirClick(Sender: TObject);
    procedure tbSqlLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
 		iTotal : Integer;
 		procedure CheckSQL(Sender: TObject);
		procedure CheckSintaxis(AQuery : TSDQuery; ArchivoSql : Boolean);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManConsultasRotulo: TfrmManConsultasRotulo;

implementation
uses
  CustomDlgs,StrFuncs, unCustomConsulta, unDmPrincipal,
  unSesion, AnsiSQL, SQLFuncs, VCLExtra;
{$R *.dfm}


procedure TfrmManConsultasRotulo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'qr_fechabaja';
  Sql.TableName := 'hys.hqr_queriesrotulo';
  with fraRotuloAsociado do
  begin
    TableName   := 'hys.hrr_rotulosreporte';
    FieldID     := 'RR_ID';
    FieldCodigo := 'RR_ID';
    FieldDesc   := 'RR_DESCRIPCION';
    FieldBaja := 'RR_FECHABAJA';
    Showbajas   := true;
  end;
  with fraRotuloFiltro do
  begin
    TableName   := 'hys.hrr_rotulosreporte';
    FieldID     := 'RR_ID';
    FieldCodigo := 'RR_ID';
    FieldDesc   := 'RR_DESCRIPCION';
    FieldBaja := 'RR_FECHABAJA';
    Showbajas   := true;
  end;
end;

procedure TfrmManConsultasRotulo.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  fraRotuloAsociado.Clear;
  edDescripcion.Clear;
  edOrden.Clear;
  cbGrafico.Checked := False;
  edSubconsulta.Lines.Clear;
  edLimite.Clear;
  VCLExtra.LockControls([edCodigo], true);
end;

function TfrmManConsultasRotulo.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('QR_ID').AsInteger;
      Sql.Fields.Add('QR_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('QR_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('QR_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('QR_IDROTULO', fraRotuloAsociado.Codigo);
      Sql.Fields.Add('QR_ORDEN', edOrden.Text);
      if cbGrafico.Checked then
        Sql.Fields.Add('QR_GRAFICO', 'S')
      else
        Sql.Fields.Add('QR_GRAFICO', 'N');
      Sql.Fields.Add('QR_SUBCONSULTA', edSubconsulta.Lines.Text);
      Sql.Fields.Add('QR_LIMITECONSULTA', edLimite.Text);
      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HQR_ID');
        Sql.Fields.Add('QR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('QR_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('QR_ID').AsInteger;
        Sql.Fields.Add('QR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('QR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('QR_USUBAJA', exNull );
        Sql.Fields.Add('QR_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('QR_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    SaveBlob('SELECT qr_consulta FROM hys.hqr_queriesrotulo '+
             ' WHERE qr_id = '+ SqlValue(iIdCodigo),
             'UPDATE hys.hqr_queriesrotulo '+
             '   SET qr_consulta = :qr_consulta '+
             ' WHERE qr_id = '+ SqlValue(iIdCodigo), 'qr_consulta', mwSql.Lines);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmManConsultasRotulo.LoadControls;
begin
  inherited;
  ClearControls;
  edCodigo.Text := sdqConsulta.FieldByName('QR_ID').AsString;
  fraRotuloAsociado.Codigo := sdqConsulta.FieldByName('QR_IDROTULO').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('QR_DESCRIPCION').AsString;
  edOrden.Text := sdqConsulta.FieldByName('QR_ORDEN').AsString;
  cbGrafico.Checked := sdqConsulta.FieldByName('QR_GRAFICO').AsString = 'S';
  edSubconsulta.Text := sdqConsulta.FieldByName('QR_SUBCONSULTA').AsString;
  edLimite.Text := sdqConsulta.FieldByName('QR_LIMITECONSULTA').AsString;
  mwSql.Text := sdqConsulta.FieldByName('QR_CONSULTA').AsString;
end;

function TfrmManConsultasRotulo.Validar: Boolean;
begin
  result := true;
  Verificar(IsEmptyString(edDescripcion.Text),edDescripcion, 'Debe especificar una Descripción.');
  Verificar(fraRotuloAsociado.IsEmpty,fraRotuloAsociado, 'Debe seleccionar un Reporte Web.');
  Verificar(edLimite.IsEmpty, edLimite, 'Debe Ingresar el limite.');
  Verificar(edOrden.IsEmpty, edOrden, 'Debe Ingresar el orden.');
end;

procedure TfrmManConsultasRotulo.tbSqlSintaxisClick(Sender: TObject);
begin
 CheckSQL(Sender)
end;

procedure TfrmManConsultasRotulo.tbArmarSqlClick(Sender: TObject);
Var sdqAutoQuery : TSDQuery;
    sTabla,
    sSql         : String;
    i            : Integer;
begin
     if (mwSql.Lines.Text = '') or (MsgBox('¿Desea armar automáticamente el sql de la tabla?', MB_ICONQUESTION + MB_YESNO) = IDYES) Then begin
        sTabla := InputBox( 'Consulta Automática', 'Ingrese el nombre de la tabla', '');
        if sTabla <> '' Then begin
            sdqAutoQuery := GetQuery('SELECT * FROM ' + sTabla);
            Try
              sSql := 'SELECT ';
              for i := 0 to sdqAutoQuery.Fields.Count -1 do
                  With sdqAutoQuery.Fields[i] do
                       if IsValidIdent(FieldName) Then
                          sSql := sSql + FieldName + ', ' + #13 + '       '
                       else
                          sSql := sSql + '"' + FieldName + '" AS CAMPO_' + IntToStr(i) + ', ' + #13 + '       ';

              SetLength(sSql, Length(sSql) - 10);
              sSql := sSql + #13 + '  FROM ' + sTabla;
              mwSql.Lines.Text := sSql;
            Finally
              sdqAutoQuery.Free;
            end;
        end;
     end;
end;

procedure TfrmManConsultasRotulo.CheckSQL(Sender : TObject);
Var
  sdqSintaxis : TSDQuery;
begin
   Try
     sdqSintaxis := TSDQuery.Create( Self );
     Try
        SetDatabaseToQuery( sdqSintaxis );
        CheckSintaxis( sdqSintaxis, (Sender = tbSqlSintaxis)); // or (Sender =  tbCampComprobar));
     finally
        sdqSintaxis.Free;
     end;

     MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
	 Except
		 On E: Exception do ErrorMsg( E, 'Error de Sintaxis' );
   end;
end;

procedure TfrmManConsultasRotulo.CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
var
	sSql : String;
begin
  sSql := mwSql.Lines.Text;
  CheckAndOpenQuery(AQuery, sSql, ArchivoSql);
end;

procedure TfrmManConsultasRotulo.tbSqlImprimirClick(Sender: TObject);
begin
  inherited;

	if PrinterSetupDialog.Execute Then begin
			iTotal := 0;
			qpCampos.Title.Text := 'Estructura del Archivo ';
			qpCampos.Print ;
	end;

end;

procedure TfrmManConsultasRotulo.tbSqlLimpiarClick(Sender: TObject);
begin
 mwSql.Lines.Text := ' ' ;
end;

procedure TfrmManConsultasRotulo.tbRefrescarClick(Sender: TObject);
var
  sSql : string;
begin
  sdqConsulta.SQL.Clear;
  sSql :=
  ' SELECT qr_id, qr_idrotulo, qr_descripcion, qr_grafico, qr_fechabaja, qr_orden, '+
  '        qr_subconsulta, qr_limiteconsulta, qr_consulta, rr_descripcion '+
  '   FROM hys.hqr_queriesrotulo, hys.hrr_rotulosreporte '+
  '  WHERE qr_idrotulo = rr_id';
  if not fraRotuloFiltro.IsEmpty then
    sSql := sSql + ' AND qr_idrotulo = '+SqlValue(fraRotuloFiltro.Value);
  sdqConsulta.SQL.Add(sSql);
  inherited;

end;

end.
