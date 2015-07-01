unit unManATS_TIPOEVENTOSECTOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CheckLst, ARTCheckListBox,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc,
  Mask, DBCtrls, ToolEdit, JvExExtCtrls, JvComponent, JvPanel,
  JvNetscapeSplitter;

type
  TfrmManATS_TIPOEVENTOSECTOR = class(TfrmCustomGridABM)
    pnlFiltrosFiltrables: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    fraTE_ID: TfraCodDesc;
    rgTipoEvento: TRadioGroup;
    fraTE_IDPADRE: TfraCodDesc;
    rgSQL: TRadioGroup;
    rgBajas: TRadioGroup;
    Panel6: TPanel;
    Panel5: TPanel;
    fraTE_IDPROCESO: TfraCodDesc;
    fraTE_IDDESTINATARIO: TfraCodDesc;
    fraTS_IDSECTOR: TfraCodDesc;
    clbFiltroMotivosIngreso: TARTCheckListBox;
    ShortCutControlHijo: TShortCutControl;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    GridUsuarios: TArtDBGrid;
    pnlBottom: TPanel;
    Label1: TLabel;
    edTS_USUALTA: TDBEdit;
    Label3: TLabel;
    edTS_USUMODIF: TDBEdit;
    Label4: TLabel;
    edTS_USUBAJA: TDBEdit;
    edTS_FECHAALTA: TDBDateEdit;
    edTS_FECHAMODIF: TDBDateEdit;
    edTS_FECHABAJA: TDBDateEdit;
    chkVerUsuarios: TCheckBox;
    pnlTodos: TJvPanel;
    Label5: TLabel;
    Label6: TLabel;
    fraSector: TfraCodDesc;
    Label8: TLabel;
    Label10: TLabel;
    cmbPrivacidad: TComboBox;
    cmbOperacion: TComboBox;
    chkRequiereRespuesta: TCheckBox;
    Label11: TLabel;
    fraEventoTarea: TfraCodDesc;
    JvgSplitter: TJvNetscapeSplitter;
    chkRequiereRespuestaTabulada: TCheckBox;
    procedure chkVerUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqUsuariosAfterOpen(DataSet: TDataSet);
    procedure chkRequiereRespuestaClick(Sender: TObject);
    procedure chkRequiereRespuestaTabuladaClick(Sender: TObject);
  protected
    FSQL: String;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;    
    procedure RefreshData; override;
  end;

var
  frmManATS_TIPOEVENTOSECTOR: TfrmManATS_TIPOEVENTOSECTOR;

implementation

uses
  VCLExtra, CustomDlgs, unDmPrincipal, unFiltros, unGrids, Strfuncs,
  AnsiSql, unSesion, SqlFuncs, General;

{$R *.dfm}

procedure TfrmManATS_TIPOEVENTOSECTOR.chkVerUsuariosClick(Sender: TObject);
begin
  inherited;
  GridUsuarios.Visible := chkVerUsuarios.Checked;
  JvgSplitter.Visible := chkVerUsuarios.Checked;
  sdqConsultaAfterScroll(nil);
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.ClearControls;
begin
  inherited;
  fraEventoTarea.Propiedades.ExtraCondition := 'AND NOT EXISTS (SELECT 1 FROM AGENDA.ATS_TIPOEVENTOSECTOR WHERE TS_IDTIPOEVENTO = TE_ID AND TS_PRIVACIDAD = ''PU'' AND TS_FECHABAJA IS NULL)';  
  fraEventoTarea.Clear;
  fraSector.Clear;
  cmbPrivacidad.ItemIndex := -1;
  cmbOperacion.ItemIndex := -1;
  chkRequiereRespuesta.State := cbGrayed;
  chkRequiereRespuestaTabulada.State := cbGrayed;      
end;

function TfrmManATS_TIPOEVENTOSECTOR.DoABM: Boolean;
var
  sPrefijo: String;
begin
  sPrefijo := 'TS_';
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('TS_ID', sdqConsulta.FieldByName('TS_ID').AsInteger);
    Sql.Fields.Add('TS_FECHABAJA', exDate);
    Sql.Fields.Add('TS_USUBAJA', Sesion.UserID);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddInteger('TS_ID', ValorSQLInteger('SELECT NVL(MAX(TS_ID), 0) FROM AGENDA.ATS_TIPOEVENTOSECTOR') + 1);
      Sql.Fields.Add('TS_FECHAALTA', exDate);
      Sql.Fields.Add('TS_USUALTA', Sesion.UserID);
      Sql.SqlType := stInsert;
    end else
    if ModoABM = maModificacion then
    begin
      Sql.PrimaryKey.Add('TS_ID', sdqConsulta.FieldByName('TS_ID').AsInteger);
      Sql.Fields.Add('TS_FECHAMODIF', exDate);
      Sql.Fields.Add('TS_USUMODIF', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add(sPrefijo + 'IDTIPOEVENTO', fraEventoTarea.Value);
    Sql.Fields.Add(sPrefijo + 'IDSECTOR', fraSector.Value);    
    Sql.Fields.Add(sPrefijo + 'PRIVACIDAD', StrLeft(cmbPrivacidad.Items[cmbPrivacidad.ItemIndex], 2));
    Sql.Fields.Add(sPrefijo + 'TIPOOPERACION', iif(cmbOperacion.ItemIndex = 0, 'A', 'M'), dtString);
    Sql.Fields.Add(sPrefijo + 'REQUIERERESPUESTA', SqlBoolean(chkRequiereRespuesta.Checked, False));
    Sql.Fields.Add(sPrefijo + 'REQUIERERESPUESTATABULADA', SqlBoolean(chkRequiereRespuestaTabulada.Checked, False));    
  end;

  Result := inherited DoABM;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  SQL.TableName := 'AGENDA.ATS_TIPOEVENTOSECTOR';
  FieldBaja := 'TS_FECHABAJA';
  VCLExtra.LockControls([edTS_USUALTA, edTS_FECHAALTA, edTS_USUMODIF, edTS_FECHAMODIF, edTS_USUBAJA, edTS_FECHABAJA], True);
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraEventoTarea], ModoABM = maModificacion);  
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEventoTarea.Propiedades.ExtraCondition := ''; 
    fraEventoTarea.Value := FieldByName('TS_IDTIPOEVENTO').AsInteger;
    fraSector.Value := FieldByName('TS_IDSECTOR').AsInteger;
    cmbPrivacidad.ItemIndex := iif(FieldByName('TS_PRIVACIDAD').AsString = 'PR',
                                   0,
                                   iif(FieldByName('TS_PRIVACIDAD').AsString = 'PG',
                                       1,
                                       iif(FieldByName('TS_PRIVACIDAD').AsString = 'PU',
                                           2,
                                           iif(FieldByName('TS_PRIVACIDAD').AsString = 'SE',
                                               3,
                                               iif(FieldByName('TS_PRIVACIDAD').AsString = 'JE',
                                                   4,
                                                   iif(FieldByName('TS_PRIVACIDAD').AsString = 'GE',
                                                       5,
                                                       -1))))));
    cmbOperacion.ItemIndex := iif(FieldByName('TS_TIPOOPERACION').AsString = 'A', 0, 1);
    chkRequiereRespuesta.Checked := FieldByName('TS_REQUIERERESPUESTA').AsString = 'S';
    chkRequiereRespuestaTabulada.Checked := FieldByName('TS_REQUIERERESPUESTATABULADA').AsString = 'S';    
    //chkObligatorio.Checked := FieldByName('TS_OBLIGATORIO').AsString = 'S';
    //chkHito.Checked := FieldByName('TS_HITO').AsString = 'S';
  end;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltrosFiltrables);
  case rgTipoEvento.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_TIPOEVENTO = ''E'' ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_TIPOEVENTO = ''T'' ';
  end;
  case rgSQL.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_SQL IS NOT NULL ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TE_SQL IS NULL ';
  end;
  case rgBajas.ItemIndex of
    1: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TS_FECHABAJA IS NULL ';
    2: sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND TS_FECHABAJA IS NOT NULL ';
  end;

  if clbFiltroMotivosIngreso.CheckedValues.Count > 0 then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' AND EXISTS(SELECT 1 FROM AGENDA.ATI_TIPOEVENTOMOTIVOINGRESO WHERE TI_IDTIPOEVENTO = TE_ID AND TI_FECHABAJA IS NULL ' + clbFiltroMotivosIngreso.InSQL_IntegerValues('TI_IDMOTIVOINGRESO') + ')';

  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  VCLExtra.DynColWidthsByData(Grid);
  Grid.ColumnByField['TE_DESCRIPCION'].Width := 160;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if chkVerUsuarios.Checked or (sdqConsulta.FieldByName('TS_PRIVACIDAD').AsString = 'PU') then
  begin
    pnlTodos.Visible := sdqConsulta.FieldByName('TS_PRIVACIDAD').AsString = 'PU';
    GridUsuarios.Visible := not pnlTodos.Visible;
    JvgSplitter.Visible := True;

    if not pnlTodos.Visible then
      OpenQueryEx(sdqUsuarios, [sdqConsulta.FieldByName('TE_ID').AsInteger]);
  end else
  begin
    pnlTodos.Visible := False;
    GridUsuarios.Visible := False;
    JvgSplitter.Visible := False;
  end;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.sdqUsuariosAfterOpen(DataSet: TDataSet);
begin
  VCLExtra.DynColWidthsByData(GridUsuarios);
  GridUsuarios.Width := GetColumnWidths(GridUsuarios, True);
end;

function TfrmManATS_TIPOEVENTOSECTOR.Validar: Boolean;
begin
  Verificar(fraSector.IsEmpty, fraSector.edCodigo, 'Debe seleccionar el sector a partir del cual se considerará la visibilidad de este evento o tarea.');
  Verificar(cmbPrivacidad.ItemIndex = -1, cmbPrivacidad, 'Debe indicar la privacidad del elemento.');
  Verificar(cmbOperacion.ItemIndex = -1, cmbOperacion, 'Debe indicar el tipo de operación del elemento.');
//  Verificar(chkHito.State = cbGrayed, chkHito, 'Debe indicar si el elemento representa un hito o no.');
  Verificar(chkRequiereRespuesta.State = cbGrayed, chkRequiereRespuesta, 'Debe indicar si el elemento requiere respuesta.');
  Verificar(chkRequiereRespuestaTabulada.State = cbGrayed, chkRequiereRespuestaTabulada, 'Debe indicar si el elemento requiere respuesta tabulada.');  
  Result := True;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.chkRequiereRespuestaClick(Sender: TObject);
begin
  if not chkRequiereRespuesta.Checked then
    chkRequiereRespuestaTabulada.Checked := False;
end;

procedure TfrmManATS_TIPOEVENTOSECTOR.chkRequiereRespuestaTabuladaClick(Sender: TObject);
begin
  if chkRequiereRespuestaTabulada.Checked then
    chkRequiereRespuesta.Checked := True;
end;

end.
