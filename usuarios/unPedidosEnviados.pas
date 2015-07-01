unit unPedidosEnviados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, PatternEdit, IntEdit, Mask, ToolEdit,
  DateComboBox, RxRichEd, JvgGroupBox, JvExExtCtrls, JvNavigationPane,
  ShellApi;

type
  TfrmPedidosEnviados = class(TfrmCustomConsulta)
    lbID: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edFechaEnvioDesde: TDateComboBox;
    Label4: TLabel;
    edFechaEnvioHasta: TDateComboBox;
    edFechaAltaDesde: TDateComboBox;
    Label5: TLabel;
    edFechaAltaHasta: TDateComboBox;
    edMail: TEdit;
    edID: TIntEdit;
    GroupBox1: TGroupBox;
    cbErrorSi: TCheckBox;
    cbErrorNo: TCheckBox;
    GroupBox2: TGroupBox;
    cbPedidoVacioSI: TCheckBox;
    cbPedidoVacioNo: TCheckBox;
    ShortCutControl1: TShortCutControl;
    tbVerMail: TToolButton;
    tbReenviar: TToolButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    JvOutlookSplitter1: TJvOutlookSplitter;
    gbJefe: TJvgGroupBox;
    GroupBox3: TGroupBox;
    reTextoCuerpo: TRxRichEdit;
    RxDBGrid1: TRxDBGrid;
    Splitter1: TJvOutlookSplitter;
    sdqReportes: TSDQuery;
    dsReportes: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cbErrorSiClick(Sender: TObject);
    procedure cbErrorNoClick(Sender: TObject);
    procedure cbPedidoVacioSIClick(Sender: TObject);
    procedure cbPedidoVacioNoClick(Sender: TObject);
    procedure tbVerMailClick(Sender: TObject);
    procedure tbReenviarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridDblClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosEnviados: TfrmPedidosEnviados;

implementation

{$R *.dfm}

uses AnsiSql, unElementosEnviados,unDmprincipal,CustomDlgs;

procedure TfrmPedidosEnviados.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere : String;
begin
  sSql := ' SELECT pr_id, pr_emailrespuesta, pr_fechaenvio, pr_fechaalta, '+
          '        pr_usualta, pr_error, pr_descripcionerror, pr_idemailaenviar, '+
          '        pr_pedidovacio, pr_asunto, pr_firma, NVL2(pr_fechaenvio, ''SI'', ''NO'') procesado, '+
          '        pr_fechabaja,ee_cuerpo, ee_id, ea_path '+
          '   FROM hys.hpr_pedidosreporte,comunes.cee_emailaenviar, comunes.cea_emailadjunto '+
          '  WHERE pr_idemailaenviar = ee_id(+) '+
          '    AND ee_id = ea_idemailaenviar(+) ';

  if (edID.Text <> '') then
    sWhere := sWhere+ ' AND pr_id = '+SqlValue(edID.Text);

  If (edFechaEnvioDesde.Date = edFechaEnvioHasta.Date) and (edFechaEnvioDesde.Date <> 0) then
    sWhere := sWhere + ' AND trunc(pr_fechaenvio) = '+SqlValue(edFechaEnvioDesde.Date)
  else
  begin
   if (edFechaEnvioDesde.Date <> 0) then
    sWhere := sWhere + ' AND pr_fechaenvio >= '+SqlValue(edFechaEnvioDesde.Date);
   if (edFechaEnvioHasta.Date <> 0) then
    sWhere := sWhere + ' AND pr_fechaenvio <= '+SqlValue(edFechaEnvioHasta.Date)+'+1';
  end;

  If (edFechaAltaDesde.Date = edFechaAltaHasta.Date) and (edFechaAltaDesde.Date <> 0) then
    sWhere := sWhere + ' AND trunc(pr_fechaalta) = '+SqlValue(edFechaAltaDesde.Date)
  else
  begin
   if (edFechaAltaDesde.Date <> 0) then
    sWhere := sWhere + ' AND pr_fechaalta >= '+SqlValue(edFechaAltaDesde.Date);
   if (edFechaAltaHasta.Date <> 0) then
    sWhere := sWhere + ' AND pr_fechaalta <= '+SqlValue(edFechaAltaHasta.Date)+'+1';
  end;

  if edMail.Text <> '' then
    sWhere := sWhere + ' AND INSTR(UPPER(pr_emailrespuesta), '+SqlValue(edMail.Text)+') > 0';

  if cbErrorSi.Checked then
    sWhere := sWhere + ' AND pr_error = ''S'' ';

  if cbErrorNo.Checked then
    sWhere := sWhere + ' AND pr_error = ''N'' ';

  if cbPedidoVacioSI.Checked then
    sWhere := sWhere + ' AND pr_pedidovacio = ''S'' ';

  if cbPedidoVacioNo.Checked then
    sWhere := sWhere + ' AND pr_pedidovacio = ''N'' ';

  sdqConsulta.SQL.Text := sSql+sWhere;
  sdqConsulta.SQL.Add(SortDialog.OrderBy);
  inherited;

end;

procedure TfrmPedidosEnviados.cbErrorSiClick(Sender: TObject);
begin
  if cbErrorSi.Checked then
    cbErrorNo.Checked := False;
end;

procedure TfrmPedidosEnviados.cbErrorNoClick(Sender: TObject);
begin
  if cbErrorNo.Checked then
    cbErrorSi.Checked := False;
end;

procedure TfrmPedidosEnviados.cbPedidoVacioSIClick(Sender: TObject);
begin
  if cbPedidoVacioSI.Checked then
    cbPedidoVacioNo.Checked := False;
end;

procedure TfrmPedidosEnviados.cbPedidoVacioNoClick(Sender: TObject);
begin
  if cbPedidoVacioNo.Checked then
    cbPedidoVacioSI.Checked := False;
end;

procedure TfrmPedidosEnviados.FormCreate(Sender: TObject);
begin
  tbVerMail.Left := tbImprimir.Left -5;
  tbReenviar.Left := tbNuevo.Left - 5;
  inherited;
end;

procedure TfrmPedidosEnviados.tbVerMailClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('pr_pedidovacio').AsString = 'N' then
  begin
    with TfrmElementosEnviados.Create(Self) do
    begin
      FormStyle := fsNormal;
      Visible := False;
      IdCorreo := self.sdqConsulta.FieldByName('pr_idemailaenviar').AsInteger;
      fraEE_DIRECCIONORIGEN.Limpiar;
      chkVerAdjuntos.Checked := True;
      RefreshData;
      ShowModal;
    end;
  end;
end;



procedure TfrmPedidosEnviados.tbReenviarClick(Sender: TObject);
begin
  inherited;
  EjecutarSql(
    ' UPDATE hys.hpr_pedidosreporte '+
    '    SET pr_fechaenvio = NULL, pr_error = NULL, pr_descripcionerror = NULL, pr_pedidovacio = NULL '+
    '  WHERE pr_id = '+SqlValue(sdqConsulta.FieldByName('pr_id').AsInteger));
  sdqConsulta.Refresh;
end;

procedure TfrmPedidosEnviados.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('procesado').AsString = 'SI' then begin
    AFont.Color := clBlue;
    Background  := clWhite;
  end;

  //if not sdqConsulta.FieldByName('pr_fechabaja').IsNull then
  //  AFont.Color := clRed;
  if (sdqConsulta.FieldByName('pr_error').AsString = 'S') then
    AFont.Color := clRed;
end;

procedure TfrmPedidosEnviados.GridDblClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.FieldByName('ea_path').IsNull then
    Exit;

  if FileExists (sdqConsulta.FieldByName('ea_path').AsString) then
    ShellExecute(Application.Handle, nil, PChar(sdqConsulta.FieldByName('ea_path').AsString), '', '', SW_SHOWNORMAL)
  else
    MsgBox('El archivo no existe.', MB_ICONERROR + MB_OK);
end;

procedure TfrmPedidosEnviados.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  AStream: TStringStream;
begin
  inherited;
  
  with sdqConsulta do
  if Active and not IsEmpty then
  begin
    AStream := TStringStream.Create(FieldByName('EE_CUERPO').AsString);
    try
      reTextoCuerpo.Lines.Clear;
      if FieldByName('EE_CUERPO').IsNull and not FieldByName('EE_ID').IsNull then
        BlobSql('SELECT EE_CUERPOEX FROM COMUNES.CEE_EMAILAENVIAR WHERE EE_ID = ' + FieldByName('EE_ID').AsString, reTextoCuerpo.Lines)
      else
        reTextoCuerpo.Lines.LoadFromStream(AStream);
    finally
      AStream.Free;
    end;
  end
  else
    reTextoCuerpo.Lines.Clear;

  sdqReportes.ParamByName('pr_id').AsInteger := sdqConsulta.FieldByName('pr_id').AsInteger;
  if sdqReportes.Active then
    sdqReportes.Refresh
  else
    sdqReportes.Open;
end;

end.
