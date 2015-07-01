unit unSeguimientoPQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql, Mask,
  ToolEdit, DateComboBox, PatternEdit, IntEdit, RxRichEd, 
  JvgGroupBox, unFraCodigoDescripcion, ShellApi, unArtDBAwareFrame, DBCtrls,
  unCustomGridABM;

type
  TfrmSeguimientoPQ = class(TfrmCustomConsulta)
    Splitter1: TSplitter;
    dsReportes: TDataSource;
    sdqReportes: TSDQuery;
    RxDBGrid1: TRxDBGrid;
    GroupBox3: TGroupBox;
    JvgGroupBox1: TJvgGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dcbAltaDesde: TDateComboBox;
    dcbAltaHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dcbEnvioDesde: TDateComboBox;
    dcbEnvioHasta: TDateComboBox;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    PedidoHasta: TIntEdit;
    PedidoDesde: TIntEdit;
    edUsuAlta: TEdit;
    chkBajas: TCheckBox;
    chkSinProcesar: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    chkIncluirDatos: TCheckBox;
    reTextoCuerpo: TRxRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ShortCutControlShortCuts9ShortCutPress(Sender: TObject);
    procedure fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  end;

var
  frmSeguimientoPQ: TfrmSeguimientoPQ;

implementation

uses
  unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs,
  unEnvioMail, unElementosEnviados;

{$R *.dfm}

procedure TfrmSeguimientoPQ.FormCreate(Sender: TObject);
begin
  inherited;
{
  FieldBaja := 'PR_FECHABAJA';
  Sql.TableName := 'hys.hpr_pedidosreporte';
  CheckPK := True;
}
  with fraPreventorFiltro do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ExtraFields := ', it_email ';
      ShowBajas := true;
  end;

//  tbRefrescarClick(Sender);
end;

procedure TfrmSeguimientoPQ.tbRefrescarClick(Sender: TObject);
begin
  sdqReportes.Close;

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT   pr_id, ' +
                      '         NVL(LOWER((SELECT DISTINCT pp_valor ' +
                      '                           FROM hys.hpp_parametrospedido ' +
                      '                          WHERE pp_parametro = ''EMAILFILTRO'' ' +
                      '                            AND pp_idpedidoreporte = pr_id)), pr_emailrespuesta) pr_emailrespuesta, ' +
                      '         pr_fechaalta, pr_usualta, NVL2(pr_fechaenvio, ''SI'', ''NO'') procesado, ' +
                      '         pr_descripcionerror, ee_fechaenvio, pr_fechabaja, ea_nombreadjunto, ' +
                      '         ea_path, ee_cuerpo, ee_id ' +
                      '    FROM hys.hpr_pedidosreporte pr, comunes.cee_emailaenviar ee, ' +
                      '         comunes.cea_emailadjunto ' +
                      '   WHERE ee.ee_id(+) = pr.pr_idemailaenviar ' +
                      '     AND pr_origenpedido <> ''A'' ' +
                      '     AND pr_fechabaja IS NULL ' +
                      '     AND ea_idemailaenviar(+) = ee_id ' +
                      '     AND pr_fechabaja IS NULL ');

  if not dcbAltaDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND pr_fechaalta >= ' + SqlValue (dcbAltaDesde.Date));

  if not dcbAltaHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND pr_fechaalta < ' + SqlValue (dcbAltaHasta.Date) + ' + 1');

  if not dcbEnvioDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND ee_fechaenvio >= ' + SqlValue (dcbEnvioDesde.Date));

  if not dcbEnvioHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND ee_fechaenvio < ' + SqlValue (dcbEnvioHasta.Date) + ' + 1');

  if not IsEmptyString (edUsuAlta.Text) then
    sdqConsulta.SQL.Add('   AND UPPER(pr_usualta) = ' + SqlValue (edUsuAlta.Text));

  if not chkBajas.Checked then
    sdqConsulta.SQL.Add('   AND pr_fechabaja IS NULL');

  if chkSinProcesar.Checked then
    sdqConsulta.SQL.Add('   AND pr_fechaenvio IS NULL');

  if not chkIncluirDatos.Checked then
    sdqConsulta.SQL.Add('   AND PR_PEDIDOVACIO =''N'' ');

  if PedidoDesde.Value > 0 then
    sdqConsulta.SQL.Add('   AND pr_id >= ' + SqlInteger (PedidoDesde.Value));

  if PedidoHasta.Value > 0 then
    sdqConsulta.SQL.Add('   AND pr_id <= ' + SqlInteger (PedidoHasta.Value));

  if fraPreventorFiltro.IsSelected then
    if fraPreventorFiltro.sdqDatos.FieldByName('it_email').AsString = '' then
      sdqConsulta.SQL.Add('   AND 1 = 2 ')
    else
      sdqConsulta.SQL.Add('   AND UPPER(pr_emailrespuesta) LIKE UPPER(''%'' || ' +
                           SqlValue(fraPreventorFiltro.sdqDatos.FieldByName('it_email').AsString) +
                          ' || ''%'')'
                        );

  if tbMaxRegistros.Down Then
    sdqConsulta.SQL.Add(' AND ROWNUM <= ' + IntToStr(MaxRegistros));

  sdqConsulta.SQL.Add(' ORDER BY pr_id DESC');

  inherited;

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    sdqReportes.Open
end;

procedure TfrmSeguimientoPQ.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('procesado').AsString = 'SI' then begin
    AFont.Color := clBlue;
    Background  := clWhite;
  end;

  if not sdqConsulta.FieldByName('pr_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmSeguimientoPQ.ShortCutControlShortCuts9ShortCutPress(Sender: TObject);
begin
  JvgGroupBox1.Collapsed := not JvgGroupBox1.Collapsed
end;

procedure TfrmSeguimientoPQ.fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
begin
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorFiltro.cmbDescripcion.Text := '%' + fraPreventorFiltro.cmbDescripcion.Text;
  fraPreventorFiltro.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] = '%') then
      fraPreventorFiltro.cmbDescripcion.Text := copy(fraPreventorFiltro.cmbDescripcion.Text, 2, length(fraPreventorFiltro.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmSeguimientoPQ.GridDblClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ea_path').IsNull then
    Exit;

  if FileExists (sdqConsulta.FieldByName('ea_path').AsString) then
    ShellExecute(Application.Handle, nil, PChar(sdqConsulta.FieldByName('ea_path').AsString), '', '', SW_SHOWNORMAL)
  else
    MsgBox('El archivo no existe.', MB_ICONERROR + MB_OK);
end;

procedure TfrmSeguimientoPQ.sdqConsultaAfterScroll(DataSet: TDataSet);
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
end;

end.


