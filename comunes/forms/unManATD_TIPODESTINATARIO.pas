unit unManATD_TIPODESTINATARIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, AdvMemo, AdvmPS, AdvmSQLS,
  CheckLst, ARTCheckListBox;

type
  TfrmManATD_TIPODESTINATARIO = class(TfrmCustomGridABM)
    lbDescripcion: TLabel;
    edTD_DESCRIPCION: TEdit;
    ShortCutControlHijo: TShortCutControl;
    btnValidarConsulta: TButton;
    sdqConsultaSQL: TSDQuery;
    AdvSQLMemoStyler: TAdvSQLMemoStyler;
    pgDestinatarios: TPageControl;
    tsEspecifica: TTabSheet;
    tsPorUsuario: TTabSheet;
    lbConsulta: TLabel;
    edTD_SQL: TAdvMemo;
    clbUsuarios: TARTCheckListBox;
    rgTipo: TRadioGroup;
    edUsuarios: TEdit;
    procedure btnValidarConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure clbUsuariosClick(Sender: TObject);
    procedure clbUsuariosKeyPress(Sender: TObject; var Key: Char);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManATD_TIPODESTINATARIO: TfrmManATD_TIPODESTINATARIO;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

procedure TfrmManATD_TIPODESTINATARIO.btnValidarConsultaClick(Sender: TObject);
var
  bAbortar: Boolean;
begin
  bAbortar := False;
  if (Trim(edTD_SQL.Lines.Text) > '') then
    try
      CheckAndOpenQuery(sdqConsultaSQL, edTD_SQL.Lines.Text);
      if not Assigned(sdqConsultaSQL.FindField('ID')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Id" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('NOMBRE')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Nombre" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('MAIL')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Mail" para ser mostrado.');
        bAbortar := True;
      end;
      if sdqConsultaSQL.Fields.Count > 3 then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay mas de 3 campos (Se deben llamar "Id", "Nombre" y "Mail".');
        bAbortar := True;
      end;
    except
      InvalidMsg(edTD_SQL, 'La consulta SQL no es válida.');
      bAbortar := True;
    end;

  if bAbortar then
    Abort
  else
    InfoHint(btnValidarConsulta, 'La consulta es válida');
end;

procedure TfrmManATD_TIPODESTINATARIO.ClearControls;
begin
  inherited;
  edTD_DESCRIPCION.Clear;
  edTD_SQL.Lines.Clear;
end;

function TfrmManATD_TIPODESTINATARIO.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('TD_ID', sdqConsulta.FieldByName('TD_ID').AsInteger);
     Sql.Fields.Add('TD_FECHABAJA', exDate);
     Sql.Fields.Add('TD_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('TD_ID', ValorSQLInteger('SELECT NVL(MAX(TD_ID), 0) FROM AGENDA.ATD_TIPODESTINATARIO') + 1);
       Sql.Fields.Add('TD_FECHAALTA', exDate);
       Sql.Fields.Add('TD_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('TD_ID', sdqConsulta.FieldByName('TD_ID').AsInteger);
       Sql.Fields.Add('TD_FECHAMODIF', exDate);
       Sql.Fields.Add('TD_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.AddString('TD_PORUSUARIO', iif(pgDestinatarios.ActivePageIndex = tsPorUsuario.PageIndex, 'S', 'N'));
     Sql.Fields.Add('TD_DESCRIPCION', edTD_DESCRIPCION.Text);
     Sql.Fields.Add('TD_SQL', edTD_SQL.Lines.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManATD_TIPODESTINATARIO.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.ATD_TIPODESTINATARIO';
  FieldBaja := 'TD_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  VCLExtra.LockControls([rgTipo], (Sesion.Sector <> 'COMPUTOS'));
end;

procedure TfrmManATD_TIPODESTINATARIO.fpAbmShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([edTD_SQL], (Sesion.Sector <> 'COMPUTOS') OR (sdqConsulta.FieldByName('TD_PORUSUARIO').AsString = 'S'));
end;

procedure TfrmManATD_TIPODESTINATARIO.LoadControls;
begin
  clbUsuarios.ClearChecks;
  edTD_DESCRIPCION.Text := sdqConsulta.FieldByName('TD_DESCRIPCION').AsString;
  edTD_SQL.Lines.Text := sdqConsulta.FieldByName('TD_SQL').AsString;
  rgTipo.ItemIndex := iif(sdqConsulta.FieldByName('TD_PORUSUARIO').AsString = 'S', 0, 1);
  if Pos('/*+INICIO*/', edTD_SQL.Lines.Text) > 0 then
  begin
    with GetQuery('SELECT * FROM art.use_usuarios WHERE 1 = 1 ' + Copy(edTD_SQL.Lines.Text, Pos('/*+INICIO*/', edTD_SQL.Lines.Text) + Length('/*+INICIO*/'), MaxInt)) do
    try
      while not Eof do
      begin
        clbUsuarios.Check(FieldByName('SE_ID').AsString);
        Next;
      end;
    finally
      Free;
      clbUsuariosClick(nil);
    end;
  end;
  rgTipoClick(nil);
end;

procedure TfrmManATD_TIPODESTINATARIO.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManATD_TIPODESTINATARIO.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('TD_EDITABLE').AsString = 'N', tbModificar, 'Este destinatario conceptual no puede ser editado');
  if sdqConsulta.FieldByName('TD_PORUSUARIO').AsString = 'S' then
    pgDestinatarios.ActivePageIndex := tsPorUsuario.PageIndex
  else
    pgDestinatarios.ActivePageIndex := tsEspecifica.PageIndex;
  inherited;
end;

function TfrmManATD_TIPODESTINATARIO.Validar: Boolean;
begin
  Verificar(Trim(edTD_DESCRIPCION.Text) = '', edTD_DESCRIPCION, 'Debe completar la descripción.');

  if pgDestinatarios.ActivePageIndex = tsPorUsuario.PageIndex then
  begin
    Verificar(clbUsuarios.CheckedValues.Count = 0, clbUsuarios, 'Debe seleccionar al menos un usuario para usar este método.');
    edTD_SQL.Lines.Text := 'SELECT se_id AS id, se_nombre AS nombre, se_mail AS mail ' +
                             'FROM art.use_usuarios, agenda.aat_agendatarea ' +
                            'WHERE at_id = :id ' +
                              'AND se_fechabaja IS NULL ' +
                              'AND se_mail IS NOT NULL /*+INICIO*/' + clbUsuarios.InSQL_IntegerValues('se_id', False);
  end;

  Verificar(Trim(edTD_SQL.Lines.Text) = '', edTD_SQL, 'Debe completar la consulta dinámica.');
  Result := True;
end;

procedure TfrmManATD_TIPODESTINATARIO.tbNuevoClick(Sender: TObject);
begin
  rgTipo.ItemIndex := 0;
  inherited;
end;

procedure TfrmManATD_TIPODESTINATARIO.rgTipoClick(Sender: TObject);
begin
  tsPorUsuario.TabVisible := rgTipo.ItemIndex = 0;
  tsEspecifica.TabVisible := not tsPorUsuario.TabVisible;   
end;

procedure TfrmManATD_TIPODESTINATARIO.clbUsuariosClick(Sender: TObject);
begin
  edUsuarios.Text := clbUsuarios.CheckedItems.CommaText;
end;

procedure TfrmManATD_TIPODESTINATARIO.clbUsuariosKeyPress(Sender: TObject; var Key: Char);
begin
  clbUsuariosClick(nil);
end;

end.
