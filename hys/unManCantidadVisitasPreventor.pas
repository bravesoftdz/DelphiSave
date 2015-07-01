unit unManCantidadVisitasPreventor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, PatternEdit, IntEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Vcl.Mask, RxToolEdit, DateComboBox;

type
  TfrmManCantidadVisitasPreventor = class(TfrmCustomGridABM)
    Label32: TLabel;
    Label34: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    Label33: TLabel;
    fraPreventor: TfraCodigoDescripcion;
    Label4: TLabel;
    edDiasDeVisitas: TIntEdit;
    Label8: TLabel;
    edVisitasDia: TIntEdit;
    Label1: TLabel;
    edVisitasMax: TIntEdit;
    Label2: TLabel;
    cbSinLimiteVisitas: TCheckBox;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    cbExcluirBajas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbSinLimiteVisitasClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    sSql : String;
  public

  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;

  end;

var
  frmManCantidadVisitasPreventor: TfrmManCantidadVisitasPreventor;

implementation

{$R *.dfm}

uses
  AnsiSql, unSesion, SqlFuncs, unDmPrincipal, CustomDlgs, vclExtra;

{ TfrmManCantidadVisitasPreventor }

procedure TfrmManCantidadVisitasPreventor.cbSinLimiteVisitasClick(
  Sender: TObject);
begin
  if cbSinLimiteVisitas.Checked then
  begin
    vclExtra.LockControls([edVisitasDia,edVisitasMax],True);
    edVisitasDia.Clear;
    edVisitasMax.Clear;
  end
  else
    vclExtra.LockControls([edVisitasDia,edVisitasMax],False);

end;

procedure TfrmManCantidadVisitasPreventor.ClearControls;
begin
  inherited;
  fraPreventor.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edDiasDeVisitas.Clear;
  cbSinLimiteVisitas.Checked := False;
  edVisitasDia.Clear;
  edVisitasMax.Clear;
end;

function TfrmManCantidadVisitasPreventor.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('VM_ID', sdqConsulta.FieldByName('VM_ID').AsInteger );
    end else begin
      Sql.Fields.Add('VM_IDPREVENTOR', fraPreventor.Value);
      Sql.Fields.Add('VM_VIGENCIADESDE', edVigenciaDesde.Date );
      Sql.Fields.Add('VM_VIGENCIAHASTA', edVigenciaHasta.Date);
      Sql.Fields.Add('VM_DIASDEVISITA', edDiasDeVisitas.Text);

      if cbSinLimiteVisitas.Checked then
      begin
        Sql.Fields.Add('VM_VISITASPORDIA', 999999);
        Sql.Fields.Add('VM_VISITASMAX', 9999999);
        Sql.Fields.Add('VM_SINLIMITEVISITAS', 'S');
      end
      else
      begin
        Sql.Fields.Add('VM_SINLIMITEVISITAS', 'N');
        Sql.Fields.Add('VM_VISITASPORDIA', edVisitasDia.Text);
        Sql.Fields.Add('VM_VISITASMAX', edVisitasMax.Text);
      end;

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.Add('VM_ID', GetSecNextVal('HYS.SEQ_PIT_ID'));
        Sql.Fields.Add('VM_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('VM_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('VM_ID', sdqConsulta.FieldByName('VM_ID').AsInteger);
      end;
    end;
    EjecutarSqlST( GetSqlABM );

    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar cantidad visitas maximas .');
    end;
  end;
end;

procedure TfrmManCantidadVisitasPreventor.FormCreate(Sender: TObject);
begin
  inherited;
  sSql := sdqConsulta.SQL.Text;
  with fraPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := True;
  end;
  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := True;
  end;
  Sql.TableName := 'hys.hvm_visitasmaximas';
  FieldBaja := 'it_fechabaja';
end;

procedure TfrmManCantidadVisitasPreventor.LoadControls;
begin
  inherited;
  fraPreventor.Value := sdqConsulta.FieldByName('VM_IDPREVENTOR').AsInteger;
  edVigenciaDesde.Date := sdqConsulta.FieldByName('VM_VIGENCIADESDE').AsDateTime;
  edVigenciaHasta.Date := sdqConsulta.FieldByName('VM_VIGENCIAHASTA').AsDateTime;
  edDiasDeVisitas.Text := sdqConsulta.FieldByName('VM_DIASDEVISITA').AsString;
  cbSinLimiteVisitas.Checked := sdqConsulta.FieldByName('VM_SINLIMITEVISITAS').AsString = 'S';
  cbSinLimiteVisitasClick(nil);
  if NOT cbSinLimiteVisitas.Checked then
  begin
    edVisitasDia.Text := sdqConsulta.FieldByName('VM_VISITASPORDIA').AsString;
    edVisitasMax.Text := sdqConsulta.FieldByName('VM_VISITASMAX').AsString;
  end;
end;

procedure TfrmManCantidadVisitasPreventor.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPreventorFiltro.Clear;
  cbExcluirBajas.Checked := False;
end;

procedure TfrmManCantidadVisitasPreventor.tbRefrescarClick(Sender: TObject);
var
  sWhere : String;
begin
  if fraPreventorFiltro.IsSelected then
    sWhere := sWhere + ' AND IT_ID = '+IntToStr(fraPreventorFiltro.Value);
  if cbExcluirBajas.Checked then
    sWhere := sWhere + ' AND it_fechabaja IS NULL';
  sdqConsulta.SQL.Text := sSql + sWhere;
  inherited;
end;

function TfrmManCantidadVisitasPreventor.Validar: Boolean;
begin
  Verificar(not fraPreventor.IsSelected, fraPreventor, 'Debe seleccionar un preventor.');
  Verificar(edVigenciaDesde.Date = 0, edVigenciaDesde, 'Debe seleccionar una vigencia desde.');
  if edVigenciaHasta.Date <> 0 then
    Verificar(edVigenciaDesde.Date >= edVigenciaHasta.Date, edVigenciaHasta, 'La vigencia hasta debe ser mayor a la vigencia desde.');
  Verificar(edDiasDeVisitas.Text = '', edDiasDeVisitas,'Debe ingresar diasd de visitas');
  Verificar(StrToInt(edDiasDeVisitas.Text)>30, edDiasDeVisitas, 'Debe ser menor a 30 la cantidad de dias.');
  Verificar(ExisteSql('SELECT 1 '+
                      '  FROM hys.hvm_visitasmaximas '+
                      ' WHERE vm_idpreventor = '+SqlValue(fraPreventor.Value)+
                      '   AND vm_id <> '+SqlValue(sdqConsulta.FieldByName('VM_ID').AsInteger)+
                      '   AND vm_vigenciadesde <= '+SqlValue(edVigenciaDesde.Date)+
                      '   AND ( vm_vigenciahasta >= '+SqlValue(edVigenciaDesde.Date)+
                      '        OR vm_vigenciahasta IS NULL) '),edVigenciaDesde,'Se solapa la fecha desde con otro registro.');
  Verificar(ExisteSql('SELECT 1 '+
                      '  FROM hys.hvm_visitasmaximas '+
                      ' WHERE vm_idpreventor = '+SqlValue(fraPreventor.Value)+
                      '   AND vm_id <> '+SqlValue(sdqConsulta.FieldByName('VM_ID').AsInteger)+
                      '   AND vm_vigenciadesde <= '+SqlValue(edVigenciaHasta.Date)+
                      '   AND ( vm_vigenciahasta >= '+SqlValue(edVigenciaHasta.Date)+
                      '        OR vm_vigenciahasta IS NULL) '),edVigenciaHasta,'Se solapa la fecha hasta con otro registro.');
  Result := True;
end;

end.
